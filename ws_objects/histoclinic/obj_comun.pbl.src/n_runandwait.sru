﻿$PBExportHeader$n_runandwait.sru
forward
global type n_runandwait from nonvisualobject
end type
type process_information from structure within n_runandwait
end type
type startupinfo from structure within n_runandwait
end type
type shellexecuteinfo from structure within n_runandwait
end type
end forward

type process_information from structure
	longptr		hprocess
	longptr		hthread
	ulong		dwprocessid
	ulong		dwthreadid
end type

type startupinfo from structure
	unsignedlong		cb
	string		lpreserved
	string		lpdesktop
	string		lptitle
	unsignedlong		dwx
	unsignedlong		dwy
	unsignedlong		dwxsize
	unsignedlong		dwysize
	unsignedlong		dwxcountchars
	unsignedlong		dwycountchars
	unsignedlong		dwfillattribute
	unsignedlong		dwflags
	unsignedinteger		wshowwindow
	unsignedinteger		cbreserved2
	longptr		lpreserved2
	longptr		hstdinput
	longptr		hstdoutput
	longptr		hstderror
end type

type shellexecuteinfo from structure
	unsignedlong		cbsize
	unsignedlong		fmask
	longptr		hwnd
	string		lpverb
	string		lpfile
	string		lpparameters
	string		lpdirectory
	longptr		nshow
	longptr		hinstapp
	longptr		lpidlist
	string		lpclass
	longptr		hkeyclass
	longptr		hicon
	longptr		hmonitor
	longptr		hprocess
end type

global type n_runandwait from nonvisualobject autoinstantiate
end type

type prototypes
Function boolean CreateProcess ( &
	string lpApplicationName, &
	Ref string lpCommandLine, &
	longptr lpProcessAttributes, &
	longptr lpThreadAttributes, &
	boolean bInheritHandles, &
	ulong dwCreationFlags, &
	longptr lpEnvironment, &
	string lpCurrentDirectory, &
	STARTUPINFO lpStartupInfo, &
	Ref PROCESS_INFORMATION lpProcessInformation &
	) Library "kernel32.dll" Alias For "CreateProcessW"

Function Long WaitForSingleObject ( &
	longptr hHandle, &
	long dwMilliseconds &
	) Library "kernel32.dll"

Function Boolean CloseHandle ( &
	longptr hObject &
	) Library "kernel32.dll"

Function Boolean GetExitCodeProcess ( &
	longptr hProcess, &
	Ref Long lpExitCode &
	) Library "kernel32.dll"

Function Boolean TerminateProcess ( &
	longptr hProcess, &
	Long uExitCode &
	) Library "kernel32.dll"

Function Long ExpandEnvironmentStrings ( &
	String lpSrc, &
	Ref String lpDst, &
	Long nSize &
	) Library "kernel32.dll" Alias For "ExpandEnvironmentStringsW"
	
Function Boolean ShellExecuteEx ( &
	Ref SHELLEXECUTEINFO lpExecInfo &
	) Library "shell32.dll" Alias For "ShellExecuteExW"

end prototypes

type variables
Boolean ib_terminate
Long il_millsecs

Constant Long INFINITE			= -1
Constant Long WAIT_ABANDONED	= 128
Constant Long WAIT_COMPLETE	= 0
Constant Long WAIT_OBJECT_0	= 0
Constant Long WAIT_TIMEOUT		= 258

Constant Long SW_HIDE				= 0
Constant Long SW_SHOWNORMAL		= 1
Constant Long SW_NORMAL				= 1
Constant Long SW_SHOWMINIMIZED	= 2
Constant Long SW_SHOWMAXIMIZED	= 3
Constant Long SW_MAXIMIZE			= 3
Constant Long SW_SHOWNOACTIVATE	= 4
Constant Long SW_SHOW				= 5
Constant Long SW_MINIMIZE			= 6
Constant Long SW_SHOWMINNOACTIVE	= 7
Constant Long SW_SHOWNA				= 8
Constant Long SW_RESTORE			= 9
Constant Long SW_SHOWDEFAULT		= 10
Constant Long SW_FORCEMINIMIZE	= 11
Constant Long SW_MAX					= 11

Constant Long STARTF_USESHOWWINDOW		= 1
Constant Long STARTF_USESIZE				= 2
Constant Long STARTF_USEPOSITION			= 4
Constant Long STARTF_USECOUNTCHARS		= 8
Constant Long STARTF_USEFILLATTRIBUTE	= 16
Constant Long STARTF_RUNFULLSCREEN		= 32
Constant Long STARTF_FORCEONFEEDBACK	= 64
Constant Long STARTF_FORCEOFFFEEDBACK	= 128
Constant Long STARTF_USESTDHANDLES		= 256
Constant Long STARTF_USEHOTKEY			= 512

Constant Long CREATE_DEFAULT_ERROR_MODE	= 67108864
Constant Long CREATE_FORCEDOS					= 8192
Constant Long CREATE_NEW_CONSOLE				= 16
Constant Long CREATE_NEW_PROCESS_GROUP		= 512
Constant Long CREATE_NO_WINDOW				= 134217728
Constant Long CREATE_SEPARATE_WOW_VDM		= 2048
Constant Long CREATE_SHARED_WOW_VDM			= 4096
Constant Long CREATE_SUSPENDED				= 4
Constant Long CREATE_UNICODE_ENVIRONMENT	= 1024
Constant Long DEBUG_PROCESS					= 1
Constant Long DEBUG_ONLY_THIS_PROCESS		= 2
Constant Long DETACHED_PROCESS				= 8

Constant Long HIGH_PRIORITY_CLASS		= 128
Constant Long IDLE_PRIORITY_CLASS		= 64
Constant Long NORMAL_PRIORITY_CLASS		= 32
Constant Long REALTIME_PRIORITY_CLASS	= 256

end variables

forward prototypes
public subroutine of_set_options (boolean ab_terminate, decimal adec_seconds)
private function long of_run (string as_exefullpath, long al_showwindow)
public function long of_run (string as_exefullpath, trigevent a_windowstate)
public function long of_run (string as_exefullpath, windowstate a_windowstate)
public function string of_get_shellexecute (string as_filename, string as_shellverb)
public function long of_shellrun (string as_filename, string as_shellverb, long al_showwindow)
public function long of_shellrun (string as_filename, string as_shellverb, trigevent a_windowstate)
public function long of_shellrun (string as_filename, string as_shellverb, windowstate a_windowstate)
end prototypes

public subroutine of_set_options (boolean ab_terminate, decimal adec_seconds);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_set_options
//
// PURPOSE:    This function sets a timeout period so that it can stop
//             waiting after so many seconds.  It also sets an option
//					to terminate the process if it is still running after
//					the timeout period expires.
//
// ARGUMENTS:  ab_terminate	- Terminate if still running
//             adec_seconds	- Timeout period in seconds
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

ib_terminate = ab_terminate
il_millsecs = adec_seconds * 1000

end subroutine

private function long of_run (string as_exefullpath, long al_showwindow);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_Run
//
// PURPOSE:    This function starts the process and waits for it to
//             finish.  If a timeout period has been set, it
//					optionally can terminate the process.
//
// ARGUMENTS:  as_exefullpath	- Path of program to execute
//             ai_showwindow	- Show window option
//
// RETURN:		Return code of the program or:
//					-1  = Create Process failed
//					258 = Process terminated after timeout
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Environment le_env
STARTUPINFO lstr_si
PROCESS_INFORMATION lstr_pi
LongPtr ll_null
Long ll_ExitCode
ULong lul_CreationFlags
String ls_null

GetEnvironment(le_env)

// initialize arguments
SetNull(ls_null)
If le_env.ProcessBitness = 64 Then
	lstr_si.cb = 104
Else
	lstr_si.cb = 68
End If
lstr_si.dwFlags = STARTF_USESHOWWINDOW
lstr_si.wShowWindow = al_showwindow
lul_CreationFlags = CREATE_NEW_CONSOLE + NORMAL_PRIORITY_CLASS

// create process/thread and execute the passed program
If CreateProcess(ls_null, as_exefullpath, ll_null, &
			ll_null, False, lul_CreationFlags, ll_null, &
			ls_null, lstr_si, lstr_pi) Then
	// wait for the process to complete
	If il_millsecs > 0 Then
		// wait until process ends or timeout period expires
		ll_ExitCode = WaitForSingleObject(lstr_pi.hProcess, il_millsecs)
		// terminate process if not finished
		If ib_terminate And ll_ExitCode = WAIT_TIMEOUT Then
			TerminateProcess(lstr_pi.hProcess, -1)
			ll_ExitCode = WAIT_TIMEOUT
		Else
			// check for exit code
			GetExitCodeProcess(lstr_pi.hProcess, ll_ExitCode)
		End If
	Else
		// wait until process ends
		WaitForSingleObject(lstr_pi.hProcess, INFINITE)
		// check for exit code
		GetExitCodeProcess(lstr_pi.hProcess, ll_ExitCode)
	End If
	// close process and thread handles
	CloseHandle(lstr_pi.hProcess)
	CloseHandle(lstr_pi.hThread)
Else
	// return failure
	ll_ExitCode = -1
End If

Return ll_ExitCode

end function

public function long of_run (string as_exefullpath, trigevent a_windowstate);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_Run
//
// PURPOSE:    This function takes the Hide! enumerated value and
//             passes SW_HIDE to the form of the function that
//					actually does the processing.
//
// ARGUMENTS:  as_exefullpath	- Path of program to execute
//             a_windowstate	- Show window option
//
// RETURN:		Return code from processing
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Long ll_rtn

CHOOSE CASE a_windowstate
	CASE Hide!
		// run the passed program
		ll_rtn = this.of_Run(as_exefullpath, SW_HIDE)
	CASE ELSE
		// valid trigevent but invalid windowstate
		SetNull(ll_rtn)
END CHOOSE

Return ll_rtn

end function

public function long of_run (string as_exefullpath, windowstate a_windowstate);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_Run
//
// PURPOSE:    This function takes the Normal!, Maximized and
//					Minimized! enumerated values and passes the
//             corresponding value to the form of the function
//					that actually does the processing.
//
// ARGUMENTS:  as_exepath		- Path of program to execute
//             a_windowstate	- Show window option
//
// RETURN:		Return code from processing
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Long ll_rtn

CHOOSE CASE a_windowstate
	CASE Normal!
		ll_rtn = this.of_Run(as_exefullpath, SW_SHOWNORMAL)
	CASE Maximized!
		ll_rtn = this.of_Run(as_exefullpath, SW_SHOWMAXIMIZED)
	CASE Minimized!
		ll_rtn = this.of_Run(as_exefullpath, SW_SHOWMINIMIZED)
END CHOOSE

Return ll_rtn

end function

public function string of_get_shellexecute (string as_filename, string as_shellverb);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_Get_ShellExecute
//
// PURPOSE:    This function uses the registry to build a command
//					string to execute the shell verb against a file.
//
// ARGUMENTS:  as_filename		- Full path of file to open
//					as_shellverb	- Shell verb (open, edit, print, etc.)
//
// RETURN:		Command string to pass to of_Run
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2004	RolandS		Initial Coding
// 12/03/2004	RolandS		Fixed issue with choosing the incorrect default verb
// -----------------------------------------------------------------------------

String ls_regkey, ls_class, ls_runcmd
String ls_regcmd, ls_regcmdex, ls_subkeys[]
Integer li_rc, li_pos1, li_pos2

// get file extension classname
ls_regkey = "HKEY_CLASSES_ROOT\." + Right(as_filename, 3)
RegistryGet(ls_regkey, "", RegString!, ls_class)
If ls_class = "" Then
	MessageBox(	"of_Get_ShellExecute Error", &
					"There is no association for the file type!", StopSign!)
	Return ""
End If

// get default shell verb if not given
ls_regkey = "HKEY_CLASSES_ROOT\" + ls_class + "\shell"
If as_shellverb = "" Then
	RegistryGet(ls_regkey, "", RegString!, as_shellverb)
	If as_shellverb = "" Then
		// get list of verb keys
		RegistryKeys(ls_regkey, ls_subkeys)
		If UpperBound(ls_subkeys) = 0 Then
			MessageBox(	"of_Get_ShellExecute Error", &
							"There are no shell verbs for the file type!", StopSign!)
			Return ""
		Else
			// default to first one
			as_shellverb = ls_subkeys[1]
		End If
	End If
End If

// get command string for the given shell verb
ls_regkey = ls_regkey + "\" + as_shellverb + "\command"
li_rc = RegistryGet(ls_regkey, "", RegString!, ls_regcmdex)
If li_rc = 1 Then
	ls_regcmd = Space(500)
	ExpandEnvironmentStrings(ls_regcmdex, ls_regcmd, 500)
Else
	li_rc = RegistryGet(ls_regkey, "", RegExpandString!, ls_regcmdex)
	If li_rc = 1 Then
		ls_regcmd = Space(500)
		ExpandEnvironmentStrings(ls_regcmdex, ls_regcmd, 500)
	Else
		MessageBox(	"of_Get_ShellExecute Error", &
						"The verb is invalid for the file type!", StopSign!)
		Return ""
	End If
End If

// add file name to command string
li_pos1 = Pos(ls_regcmd, "%1")
If li_pos1 = 0 Then
	ls_runcmd = ls_regcmd + " ~"" + as_filename + "~""
Else
	li_pos2 = Pos(ls_regcmd, "~"%1~"")
	If li_pos2 = 0 Then
		ls_runcmd = Replace(ls_regcmd, li_pos1, 2, "~"" + as_filename + "~"")
	Else
		ls_runcmd = Replace(ls_regcmd, li_pos1, 2, as_filename)
	End If
End If

Return ls_runcmd

end function

public function long of_shellrun (string as_filename, string as_shellverb, long al_showwindow);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_ShellRun
//
// PURPOSE:    This function starts the program that is defined to perform
//					the action on the file. It then waits for it to finish.
//					If a timeout period has been set, it optionally can terminate
//					the process.
//
// ARGUMENTS:  as_exefullpath	- Path of program to execute
//					as_shellverb	- Shell action verb (blank for default)
//             ai_showwindow	- Show window option
//
// RETURN:		Return code of the program or:
//					-1  = Create Process failed
//					258 = Process terminated after timeout
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Environment le_env
CONSTANT Long SEE_MASK_NOCLOSEPROCESS = 64
SHELLEXECUTEINFO lstr_sei
Long ll_ExitCode

GetEnvironment(le_env)

// initialize structure values
If le_env.ProcessBitness = 64 Then
	lstr_sei.cbSize = 112
Else
	lstr_sei.cbSize = 60
End If
lstr_sei.fMask  = SEE_MASK_NOCLOSEPROCESS
lstr_sei.hWnd   = Handle(this)
lstr_sei.lpVerb = as_shellverb
lstr_sei.lpFile = as_filename
lstr_sei.nShow  = al_showwindow

If ShellExecuteEx(lstr_sei) Then
	// wait for the process to complete
	If il_millsecs > 0 Then
		// wait until process ends or timeout period expires
		ll_ExitCode = WaitForSingleObject(lstr_sei.hProcess, il_millsecs)
		// terminate process if not finished
		If ib_terminate And ll_ExitCode = WAIT_TIMEOUT Then
			TerminateProcess(lstr_sei.hProcess, -1)
			ll_ExitCode = WAIT_TIMEOUT
		Else
			// check for exit code
			GetExitCodeProcess(lstr_sei.hProcess, ll_ExitCode)
		End If
	Else
		// wait until process ends
		WaitForSingleObject(lstr_sei.hProcess, INFINITE)
		// check for exit code
		GetExitCodeProcess(lstr_sei.hProcess, ll_ExitCode)
	End If
	// close process and thread handles
	CloseHandle(lstr_sei.hProcess)
Else
	// return failure
	ll_ExitCode = -1
End If

Return ll_ExitCode

end function

public function long of_shellrun (string as_filename, string as_shellverb, trigevent a_windowstate);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_ShellRun
//
// PURPOSE:    This function takes the Hide! enumerated value and
//             passes SW_HIDE to the form of the function that
//					actually does the processing.
//
// ARGUMENTS:  as_exefullpath	- Path of program to execute
//					as_shellverb	- Shell action verb (blank for default)
//             a_windowstate	- Show window option
//
// RETURN:		Return code from processing
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Long ll_rtn

CHOOSE CASE a_windowstate
	CASE Hide!
		// run the passed file
		ll_rtn = this.of_ShellRun(as_filename, as_shellverb, SW_HIDE)
	CASE ELSE
		// valid trigevent but invalid windowstate
		SetNull(ll_rtn)
END CHOOSE

Return ll_rtn

end function

public function long of_shellrun (string as_filename, string as_shellverb, windowstate a_windowstate);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_ShellRun
//
// PURPOSE:    This function takes the Normal!, Maximized and
//					Minimized! enumerated values and passes the
//             corresponding value to the form of the function
//					that actually does the processing.
//
// ARGUMENTS:  as_exefullpath	- Path of program to execute
//					as_shellverb	- Shell action verb (blank for default)
//             a_windowstate	- Show window option
//
// RETURN:		Return code from processing
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Long ll_rtn

CHOOSE CASE a_windowstate
	CASE Normal!
		ll_rtn = this.of_ShellRun(as_filename, as_shellverb, SW_SHOWNORMAL)
	CASE Maximized!
		ll_rtn = this.of_ShellRun(as_filename, as_shellverb, SW_SHOWMAXIMIZED)
	CASE Minimized!
		ll_rtn = this.of_ShellRun(as_filename, as_shellverb, SW_SHOWMINIMIZED)
END CHOOSE

Return ll_rtn

end function

on n_runandwait.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_runandwait.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

