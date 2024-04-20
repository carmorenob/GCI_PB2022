$PBExportHeader$uo_key.sru
forward
global type uo_key from nonvisualobject
end type
end forward

global type uo_key from nonvisualobject
end type
global uo_key uo_key

type variables
Transaction SQLCA_T

end variables

forward prototypes
public function integer conecta ()
public function string getkey ()
end prototypes

public function integer conecta ();String dbparm2x

SQLCA_T.AutoCommit = False
if ls_pro=32 THEN //ambiente a 32 bits
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBMS", Regstring!, SQLCA_T.DBMS)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM", Regstring!, SQLCA_T.DBPARM )
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM2", Regstring!, dbparm2x)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DATABASE", Regstring!, SQLCA_T.Database)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "SERVERNAME", Regstring!, SQLCA_T.servername)
end if
if ls_pro=64 THEN //ambiente a 64 bits
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBMS", Regstring!, SQLCA_T.DBMS)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM", Regstring!, SQLCA_T.DBPARM )
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM2", Regstring!, dbparm2x)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DATABASE", Regstring!, SQLCA_T.Database)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "SERVERNAME", Regstring!, SQLCA_T.servername)
end if

SQLCA_T.logid = 'postgres'
SQLCA_T.logpass = 'k$zlpAUW5zP4Bx0I/*ESE/*'

SQLCA_T.dbParm =SQLCA_T.dbParm+SQLCA_T.logid+";UID="+SQLCA_T.logid +";PWD="+SQLCA_T.logpass+"',DisableBind=1,DelimitIdentifier='No',OJSyntax='ANSI',Host='"+''+"',AppName='GCI As."+''+"',"+"PBCatalogOwner='public',LoginTimeOut=10,"
SQLCA_T.dbParm = SQLCA_T.dbParm + dbparm2x

connect using SQLCA_T;

if SQLCA_T.SQLCode = -1 then 
//	messagebox("Error de conexión",SQLCA_T.sqlerrtext)
//	parent.show()
	return -1
end if
return 0
end function

public function string getkey ();string ls_d,ls_us,ls_ps

select devolver,usuario,clave into :ls_d,:ls_us,:ls_ps from gci_versiones where nom_aplicacion='conf_apdx' using SQLCA_T;
if SQLCA_T.sqlcode=-1 then	
	messagebox("Error consultando Acceso",SQLCA_T.sqlerrtext)
	parent.show()
	return ''
end if
if SQLCA_T.sqlnrows=0 then
	return ''
end if
if ls_d='2' or ls_d='4' then 
	ls_ps=f_descripta_new(ls_ps,'1')
	if ls_pro=32 then
//		RegistrySet ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBMS", RegString!, 'ODBC' )
//		RegistrySet ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM", RegString!, "ConnectString ='DSN="+ls_con+";UID=" )
		Registryset ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGID", Regstring!, ls_us)
		Registryset ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGPASS", Regstring!, f_encripta(ls_ps) )
	End if
	if ls_pro=64 then
	//	RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBMS", RegString!, 'ODBC' )
	//	RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM", RegString!, "ConnectString ='DSN="+ls_con+";UID=" )
		RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGID", Regstring!, ls_us)
		RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGPASS", Regstring!, f_encripta(ls_ps) )
	End If
	return '0'
else
	return ''
end if

end function

on uo_key.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_key.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;SQLCA_T = create transaction
end event

