$PBExportHeader$w_system_error.srw
$PBExportComments$Generic error window used in the application systemerror event
forward
global type w_system_error from w_center
end type
type cb_print from picturebutton within w_system_error
end type
type cb_continue from picturebutton within w_system_error
end type
type cb_exit from picturebutton within w_system_error
end type
type dw_error from datawindow within w_system_error
end type
end forward

global type w_system_error from w_center
integer x = 379
integer y = 428
integer width = 2222
integer height = 1036
string title = "Error del Sistema"
windowtype windowtype = response!
long backcolor = 78748035
toolbaralignment toolbaralignment = alignatleft!
boolean clientedge = true
cb_print cb_print
cb_continue cb_continue
cb_exit cb_exit
dw_error dw_error
end type
global w_system_error w_system_error

type variables

end variables

on w_system_error.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.cb_continue=create cb_continue
this.cb_exit=create cb_exit
this.dw_error=create dw_error
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.cb_continue
this.Control[iCurrent+3]=this.cb_exit
this.Control[iCurrent+4]=this.dw_error
end on

on w_system_error.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.cb_continue)
destroy(this.cb_exit)
destroy(this.dw_error)
end on

event open;call super::open;/////////////////////////////////////////////////////////////////////////
//
// Event	 :  w_system_error.open
//
// Purpose:
// 			Displays system errors and allows the user to either continue
//				running the application, exit the application, or print the 
//				error message.  Called from the systemerror event in the
//				application object.
//
// Log:
// 
// DATE		NAME				REVISION
//------		-------------------------------------------------------------
// Powersoft Corporation	INITIAL VERSION
//
///////////////////////////////////////////////////////////////////////////
rollback;
dw_error.insertrow (1)
dw_error.setitem (1,"errornum",string(error.number))
dw_error.setitem (1,"message" ,error.text)
dw_error.setitem (1,"where"   ,error.windowmenu)
dw_error.setitem (1,"object"  ,error.object)
dw_error.setitem (1,"event"   ,error.objectevent)
dw_error.setitem (1,"line"    ,string(error.line))
end event

type pb_grabar from w_center`pb_grabar within w_system_error
integer x = 1897
integer width = 151
integer height = 132
end type

type cb_print from picturebutton within w_system_error
event mousemove pbm_mousemove
integer x = 1097
integer y = 744
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "print.gif"
string disabledname = "d_print.gif"
alignment htextalign = left!
string powertiptext = "Imprimir"
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event	 :  w_system_error.cb_print.clicked!
//
// Purpose:
// 			Event cb_print.clicked - Print the current error message
//				and write the error message to the supplied file name.
//
// Log:
// 
//  DATE		NAME				REVISION
// ------	-------------------------------------------------------------
// Powersoft Corporation	INITIAL VERSION
//
///////////////////////////////////////////////////////////////////////////

string ls_line
long	ll_prt

ll_prt   = printopen("System Error")

// Print each string variable

print    (ll_prt, "System error message - "+string(today())+" - "+string(now(), "HH:MM:SS"))
print    (ll_prt, " ")

ls_line = "Error Number  : " + getitemstring(dw_error,1,1)
print    (ll_prt, ls_line)

ls_line = "Error Message : " + getitemstring(dw_error,1,2)
print    (ll_prt, ls_line)

ls_line = "Window/Menu   : " + getitemstring(dw_error,1,3)
print    (ll_prt, ls_line)

ls_line = "Object        : " + getitemstring(dw_error,1,4)
print    (ll_prt, ls_line)

ls_line = "Event         : " + getitemstring(dw_error,1,5)
print    (ll_prt, ls_line)

ls_line = "Line Number   : " + getitemstring(dw_error,1,6)
print    (ll_prt, ls_line)

printclose(ll_prt)
return
end event

type cb_continue from picturebutton within w_system_error
event remotesend pbm_ddepoke
event mousemove pbm_mousemove
integer x = 773
integer y = 740
integer width = 151
integer height = 132
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean default = true
boolean originalsize = true
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
string powertiptext = "Continuar Ejecutando"
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event	 :  w_system_error.cb_continue
//
// Purpose:
// 			Closes w_system_error
//
// Log:
// 
// DATE		NAME				REVISION
//------		-------------------------------------------------------------
// Powersoft Corporation	INITIAL VERSION
//
///////////////////////////////////////////////////////////////////////////

close(parent)
end event

type cb_exit from picturebutton within w_system_error
event mousemove pbm_mousemove
integer x = 933
integer y = 740
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "puerta.GIF"
string disabledname = "d_puerta.GIF"
alignment htextalign = left!
string powertiptext = "Terminar programa"
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event	 :  w_system_error.cb_exit
//
// Purpose:
// 			Ends the application session
//
// Log:
// 
// DATE		NAME				REVISION
//------		-------------------------------------------------------------
// Powersoft Corporation	INITIAL VERSION
//
///////////////////////////////////////////////////////////////////////////

halt close
end event

type dw_error from datawindow within w_system_error
integer y = 40
integer width = 2117
integer height = 684
integer taborder = 10
boolean enabled = false
string dataobject = "d_system_error"
boolean border = false
end type

