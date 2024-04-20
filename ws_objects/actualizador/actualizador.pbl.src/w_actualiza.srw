$PBExportHeader$w_actualiza.srw
forward
global type w_actualiza from window
end type
type p_3 from picture within w_actualiza
end type
type p_2 from picture within w_actualiza
end type
type p_1 from picture within w_actualiza
end type
type st_folder from statictext within w_actualiza
end type
type st_file from statictext within w_actualiza
end type
type dw_files from datawindow within w_actualiza
end type
type hpb_1 from hprogressbar within w_actualiza
end type
end forward

global type w_actualiza from window
integer width = 1851
integer height = 736
boolean titlebar = true
string title = "Actualización"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event p_open ( )
p_3 p_3
p_2 p_2
p_1 p_1
st_folder st_folder
st_file st_file
dw_files dw_files
hpb_1 hpb_1
end type
global w_actualiza w_actualiza

event p_open();string nombre,dbparm2,aplic,path,direct
n_osversion in_osver
int ls_pro

//in_osver.of_GetOSVersion(ls_so, ls_ed, ls_csd)
ls_pro=in_osver.of_GetOSBits()
RegistryGet ("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName", "ComputerName", Regstring!, nombre)
if ls_pro=32 THEN //ambiente a 32 bits
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBMS", Regstring!, SQLCA.DBMS)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM", Regstring!, SQLCA.DBPARM )
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM2", Regstring!, dbparm2)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DATABASE", Regstring!, sqlca.Database)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "SERVERNAME", Regstring!, sqlca.servername)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGID", Regstring!, sqlca.logid)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGPASS", Regstring!, sqlca.logpass)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DIRECTORIO", Regstring!, direct)
end if
if ls_pro=64 THEN //ambiente a 64 bits
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBMS", Regstring!, SQLCA.DBMS)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM", Regstring!, SQLCA.DBPARM )
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM2", Regstring!, dbparm2)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DATABASE", Regstring!, sqlca.Database)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "SERVERNAME", Regstring!, sqlca.servername)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGID", Regstring!, sqlca.logid)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGPASS", Regstring!, sqlca.logpass)
	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "DIRECTORIO", Regstring!, direct)
end if

if isnull(direct) or trim(direct)="" then
	direct=g_ruta
end if

sqlca.logpass=f_descripta( sqlca.logpass)
// fin de SQLCA
sqlca.AutoCommit=false
///// para trabajar sin la contraseña de access       ///////////////  SQLCA.dbParm =SQLCA.dbParm+sle_usuario.text+";PWD="+sle_passwd.text+"';"
long aqui,hastaaqui
string tipo,dsn
aqui=pos(sqlca.dbparm,"DSN=",1)
hastaaqui=pos(sqlca.dbparm,";",aqui)
dsn=mid(sqlca.dbparm,aqui +4,hastaaqui - aqui -4)
if ls_pro=32 THEN
	Registryget ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "APLIC_ACTU", Regstring!,aplic)
	Registryget ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DIREC_ACTU", Regstring!, path)
end if
if ls_pro=64 THEN
	Registryget ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "APLIC_ACTU", Regstring!, aplic)
	Registryget ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "DIREC_ACTU", Regstring!, path)
end if
title='Actualización Automática de '+aplic
choose case sqlca.dbms
	case "ODBC"
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources", dsn, Regstring!, tipo)
		if pos(lower(tipo),"anywhere",1)<>0 then //es anywhere
			SQLCA.dbParm =SQLCA.dbParm+sqlca.logid+";PWD="+sqlca.logpass+"',DelimitIdentifier='No',OJSyntax='ANSI',DBTextLimit='1000000',Host='sistemas',Host='"+nombre+"',AppName='GCI As."+nombre+"',"
//			SQLCA.dbParm =SQLCA.dbParm+sqlca.logid+";PWD="+sqlca.logpass+"';DelimitIdentifier='No';OJSyntax='ANSI';DBTextLimit='1000000';Host='sistemas';Host='"+nombre+"';AppName='GCI As."+nombre+"';"
			g_motor='anywhere'
		else
			if pos(lower(tipo),"postgresql",1)<>0 then //es PostgreSQL Unicode
				SQLCA.dbParm =SQLCA.dbParm+sqlca.logid+";UID="+sqlca.logid+";PWD="+sqlca.logpass+"',DisableBind=1,DelimitIdentifier='No',OJSyntax='ANSI',Host='"+nombre+"',AppName='GCI As."+nombre+"',"+"PBCatalogOwner='public',"
				g_motor='postgres'
			else
				SQLCA.dbParm =SQLCA.dbParm+"admin;PWD=jorca',OJSyntax='ANSI',DBTextLimit='1000000',Host='"+nombre+"',AppName='GCI As."+nombre+"',"
				g_motor='access'
			end if
		end if
	case "MSS Microsoft SQL Server"
		SQLCA.dbParm +="',DBTextLimit='1000000',OptSelectBlob=1,Secure=1,Host='"+nombre+"',AppName='GCI As. "+nombre+"',"
	case "SYC Adaptive Server Enterprise"
		SQLCA.dbParm +="',DBTextLimit='1000000',Host='"+nombre+"',AppName='Actualizador"+' '+nombre+"',"
	case 'OLE DB'
		string provider,file_conex
		if ls_pro=32 THEN
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "OLE_PROVIDERr", Regstring!, provider)
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "OLE_FILE", Regstring!, file_conex)
		end If
		if ls_pro=64 THEN
			RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "OLE_PROVIDER", Regstring!, provider)
			RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "OLE_FILE", Regstring!, file_conex)			
		end if
		sqlca.dbparm="PROVIDER='"+provider+"',DATALINK='"+file_conex+"',DelimitIdentifier='No',"
end choose
SQLCA.dbParm = SQLCA.dbParm + dbparm2
connect ;
if SQLCA.SQLCode = -1 then 
	messagebox("Error de conexión",SQLCA.sqlerrtext)
	close(this)
	return
end if


/////Para cerrar aplicativos y actualizar correctamente
OleObject locator,service,props
String ls_query 
int li_num, li_ret,li_i
locator = CREATE OleObject
li_ret = locator.ConnectToNewObject("WbemScripting.SWbemLocator");
service = locator.ConnectServer();

for li_i=1 to 3 
	if li_i=1 then
		ls_query = 'select name , description from Win32_Process where name = "conf_apdx.exe"'
	end if
	if li_i=2 then
		ls_query = 'select name , description from Win32_Process where name = "gci_adm.exe"'
	end if	
	if li_i=3 then
		ls_query = 'select name , description from Win32_Process where name = "histo_clinic.exe"'
	end if

	props = service.ExecQuery(ls_query);
	li_num = props.count()
	If li_num > 0 then
		if li_i=1 then
			run("Taskkill /f /im conf_apdx.exe")
		else
			if li_i=2 then
				//if messagebox("Atención","Es necesario cerrar Gestion Cliente Interno par actualizar esta seguro?",question!,yesno!,1)=2 then return
				run("Taskkill /f /im gci_adm.exe")
			end if
			if li_i=3 then
				//if messagebox("Atención","Es necesario cerrar Gestion Cliente Interno par actualizar esta seguro?",question!,yesno!,1)=2 then return
				run("Taskkill /f /im histo_clinic.exe")
			end if			
		end if
	end if
next
destroy locator

if aplic='' or path='' then
	close(this)
	return
end if
dw_files.settransobject(sqlca)
if dw_files.retrieve(aplic)=0 then
	messagebox('Atención','No se ha configurado ningún archivo para actualizar')
	close(this)
	return
end if
path=dw_files.getitemstring(1,'camino')
string orig,dest
st_folder.text='De '+path+' a '+direct
if not directoryexists(path) then
	messagebox('Atención','No existe el directorio origen ~r~n'+path)
	close(this)
	return
end if
if not directoryexists(direct) then
	messagebox('Atención','No existe el directorio destino ~r~n'+direct)
	close(this)
	return
end if
timer(0.2)
i_cuantos=dw_files.rowcount()
for i_va=1 to i_cuantos
	st_file.text=dw_files.getitemstring(i_va,'nom_file')
	orig=path+'\'+st_file.text
	dest=direct+st_file.text
	choose case FileCopy(orig,dest,TRUE)
		case -1
			timer(0)
			messagebox('Error leyendo','No se pudo abrir el archivo '+orig)
			close(this)
			return
		case -2
			timer(0)
			messagebox('Error escribiendo','No se pudo escribir el archivo '+dest)
			close(this)
			return
	end choose
	event timer()
next
IF run(aplic+'.exe')=-1 THEN 
	messagebox('Error','No se pudo ejecutar el programa: '+aplic+'.exe',Exclamation!)
end if
timer(0)
if ls_pro=32 THEN
	Registryset ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "APLIC_ACTU", Regstring!,'')
end if
if ls_pro=64 THEN
	Registryset ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "APLIC_ACTU", Regstring!, '')
end if
close(this)

end event

on w_actualiza.create
this.p_3=create p_3
this.p_2=create p_2
this.p_1=create p_1
this.st_folder=create st_folder
this.st_file=create st_file
this.dw_files=create dw_files
this.hpb_1=create hpb_1
this.Control[]={this.p_3,&
this.p_2,&
this.p_1,&
this.st_folder,&
this.st_file,&
this.dw_files,&
this.hpb_1}
end on

on w_actualiza.destroy
destroy(this.p_3)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.st_folder)
destroy(this.st_file)
destroy(this.dw_files)
destroy(this.hpb_1)
end on

event timer;g_paso++
choose case g_paso
	case 1
		p_3.picturename='lleva1.gif'
		p_3.move(471,52)
	case 2
		p_3.picturename='lleva2.gif'
		p_3.move(590,40)
	case 3
		p_3.picturename='lleva3.gif'
		p_3.move(731,28)
	case 4
		p_3.picturename='lleva1.gif'
		p_3.move(905,28)
	case 5
		p_3.picturename='lleva2.gif'
		p_3.move(1056,40)
	case 6
		p_3.picturename='lleva3.gif'
		p_3.move(1193,60)
	case 7
		p_3.picturename=p_1.picturename
		p_3.move(1358,108)
		g_paso=0
end choose
if i_cuantos>0 then hpb_1.position=100*i_va/i_cuantos
end event

event open;post event p_open()
end event

type p_3 from picture within w_actualiza
integer x = 453
integer y = 60
integer width = 96
integer height = 84
boolean originalsize = true
string picturename = "lleva1.gif"
boolean focusrectangle = false
end type

type p_2 from picture within w_actualiza
integer x = 1358
integer y = 108
integer width = 151
integer height = 132
boolean originalsize = true
string picturename = "carp2.gif"
boolean focusrectangle = false
end type

type p_1 from picture within w_actualiza
integer x = 306
integer y = 96
integer width = 151
integer height = 136
boolean originalsize = true
string picturename = "carp1.gif"
boolean focusrectangle = false
end type

type st_folder from statictext within w_actualiza
integer x = 23
integer y = 396
integer width = 1742
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_file from statictext within w_actualiza
integer x = 23
integer y = 320
integer width = 1742
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_files from datawindow within w_actualiza
boolean visible = false
integer x = 14
integer y = 512
integer width = 544
integer height = 120
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_files"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type hpb_1 from hprogressbar within w_actualiza
integer x = 5
integer y = 472
integer width = 1810
integer height = 36
unsignedinteger maxposition = 100
integer setstep = 10
end type

