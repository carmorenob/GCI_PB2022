$PBExportHeader$w_conecta.srw
forward
global type w_conecta from window
end type
type st_1 from statictext within w_conecta
end type
type huella_ingreso from olecustomcontrol within w_conecta
end type
type pb_cancel from picturebutton within w_conecta
end type
type pb_aceptar from picturebutton within w_conecta
end type
type dw_hingreso from datawindow within w_conecta
end type
type c_imagen from picture within w_conecta
end type
type st_3 from statictext within w_conecta
end type
type p_1 from picture within w_conecta
end type
type sle_passwd from singlelineedit within w_conecta
end type
type sle_usuario from singlelineedit within w_conecta
end type
type gb_1 from groupbox within w_conecta
end type
end forward

global type w_conecta from window
integer x = 302
integer y = 300
integer width = 1504
integer height = 692
windowtype windowtype = response!
long backcolor = 67108864
string pointer = "Arrow!"
boolean toolbarvisible = false
boolean clientedge = true
boolean center = true
st_1 st_1
huella_ingreso huella_ingreso
pb_cancel pb_cancel
pb_aceptar pb_aceptar
dw_hingreso dw_hingreso
c_imagen c_imagen
st_3 st_3
p_1 p_1
sle_passwd sle_passwd
sle_usuario sle_usuario
gb_1 gb_1
end type
global w_conecta w_conecta

type variables
Int intentos,c_contexto
Boolean lc_huella=false
st_biometria c_template
end variables

on w_conecta.create
this.st_1=create st_1
this.huella_ingreso=create huella_ingreso
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.dw_hingreso=create dw_hingreso
this.c_imagen=create c_imagen
this.st_3=create st_3
this.p_1=create p_1
this.sle_passwd=create sle_passwd
this.sle_usuario=create sle_usuario
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.huella_ingreso,&
this.pb_cancel,&
this.pb_aceptar,&
this.dw_hingreso,&
this.c_imagen,&
this.st_3,&
this.p_1,&
this.sle_passwd,&
this.sle_usuario,&
this.gb_1}
end on

on w_conecta.destroy
destroy(this.st_1)
destroy(this.huella_ingreso)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.dw_hingreso)
destroy(this.c_imagen)
destroy(this.st_3)
destroy(this.p_1)
destroy(this.sle_passwd)
destroy(this.sle_usuario)
destroy(this.gb_1)
end on

event open;gt_sqlca= create uo_transaction

choose case g_aplicacion
	case 'gci_adm'
		title+=' Administrativo'
	case 'conf_apdx'
		title+=' Configurador'
	case 'histo_clinic'
		title+=' Asistencial'
	case 'greportes'
		title+=' GReportes'
end choose
environment env
intentos=0
integer rtn
rtn = GetEnvironment(env)
IF rtn <> 1 THEN RETURN
alto=pixelstounits(env.ScreenHeight,yPixelsToUnits! 	)
ancho=pixelstounits(env.ScreenWidth,XPixelsToUnits! )
if env.ScreenHeight < 600 then
	if messagebox("Atención","La resolución del monitor es menor de 800 x 600, Desea continuar de todas formas?" ,Question!,YesNo! )=2 then 
		close(this)
		return
	end if
end if
string sdec,smiles
registryget('HKEY_CURRENT_USER\Control Panel\International','sThousand',regstring!,smiles)
registryget('HKEY_CURRENT_USER\Control Panel\International','sDecimal',regstring!,sdec)
if smiles<>',' or sdec<>'.' then
	RegistrySet ('HKEY_CURRENT_USER\Control Panel\International','sThousand', RegString!, ',')
	RegistrySet ('HKEY_CURRENT_USER\Control Panel\International','sDecimal', RegString!, '.')
end if

end event

event close;If g_biometria='1' then
	huella_ingreso.Object.DestroyContext(c_contexto)
	huella_ingreso.Object.Finalize()
End If
FileDelete(gbiometria_filePathName)
end event

type st_1 from statictext within w_conecta
integer x = 549
integer y = 56
integer width = 727
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio Sesión"
boolean focusrectangle = false
end type

type huella_ingreso from olecustomcontrol within w_conecta
event sensorplug ( string idsensor )
event sensorunplug ( string idsensor )
event fingerup ( string idsensor )
event fingerdown ( string idsensor )
event imageacquired ( string idsensor,  long ocx_width,  long ocx_height,  any rawimage,  long res )
boolean visible = false
integer x = 1568
integer y = 392
integer width = 146
integer height = 128
integer taborder = 70
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_conecta.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event sensorplug(string idsensor);if isnull(idSensor) or idSensor='' or  Upper(idSensor)=Upper('file') then
	p_1.x=82
	p_1.y=120
	p_1.width=379
	p_1.height=	160
	p_1.picturename='conecta.gif'	
	p_1.border=false
	p_1.originalsize=true
	st_3.visible=false
else
	p_1.x=78
	p_1.y=64
	p_1.width=434
	p_1.height=	240
	p_1.picturename='conecta1.jpg'
	st_3.visible=true
	p_1.border=true
end if
Object.CapStartCapture(idSensor)
end event

event sensorunplug(string idsensor);Object.CapStopCapture(idSensor)
end event

event imageacquired(string idsensor, long ocx_width, long ocx_height, any rawimage, long res);st_biometria lc_test
integer lc_ret

c_imagen.picturename = ''
FileDelete(gbiometria_filePathName)
//Graba la imagen en archivo para poder mostrarla
huella_ingreso.Object.CapSaveRawImageToFile(rawimage, ocx_width, ocx_Height,gbiometria_filePathName , GRCAP_IMAGE_FORMAT_BMP);
lc_test.size = 10000
lc_test.template = Blob(Space(lc_test.size))
lc_ret=huella_ingreso.Object.Extract(ref rawimage, ocx_Width, ocx_Height, Res, Ref lc_test.template,Ref  lc_test.size, c_contexto);
c_template =  lc_test
c_imagen.picturename = gbiometria_filePathName
c_imagen.originalsize=false
c_imagen.resize(174,132)
c_imagen.visible=true
lc_huella=true
pb_aceptar.postevent(clicked!) 
end event

type pb_cancel from picturebutton within w_conecta
integer x = 951
integer y = 412
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string powertiptext = "Cancelar"
end type

event clicked;If g_biometria='1' then
	huella_ingreso.Object.DestroyContext(c_contexto)
	huella_ingreso.Object.Finalize()
end if
FileDelete(gbiometria_filePathName)
closewithreturn(parent,'!')
halt

end event

type pb_aceptar from picturebutton within w_conecta
integer x = 727
integer y = 408
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
boolean underline = true
boolean originalsize = true
string picturename = "aceptar.gif"
string powertiptext = "Aceptar"
end type

event clicked;//ojo en REGEDIT debe ir: 	en DBMS:    ODBC
//									en DBPARM:  ConnectString ='DSN=Historia;UID=
//									en DBPARM2: ConnectOption=' SQL_DRIVER_CONNECT , SQL_DRIVER_NOPROMPT '
if trim(sle_usuario.text)="" and lc_huella=false then 
	sle_usuario.setfocus()
	return
end if
if (trim(sle_passwd.text)=""  or isnull(sle_passwd.text)) and lc_huella=false then
  messagebox("Atención",'El Password no puede ser Null') 
  sle_passwd.setfocus()
  return
end if

n_osversion in_osver

ls_pro=in_osver.of_GetOSBits()

parent.hide()
string dbparm2,clave,estado,esta,nombre,tipodes
setnull(clave)
//RegistryGet( "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName", "ComputerName", Regstring!, g_nequipo)
if ls_pro=32 THEN //ambiente a 32 bits
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LUGAR", Regstring!, CLUGAR )
	// de SQLCA
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBMS", Regstring!, gt_sqlca.DBMS)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM", Regstring!, gt_sqlca.DBPARM )
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM2", Regstring!, dbparm2)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DATABASE", Regstring!, gt_sqlca.Database)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "SERVERNAME", Regstring!, gt_sqlca.servername)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGID", Regstring!, gt_sqlca.logid)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGPASS", Regstring!, gt_sqlca.logpass)
end if
if ls_pro=64 THEN //ambiente a 64 bits
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LUGAR", Regstring!, CLUGAR )
	// de SQLCA
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBMS", Regstring!, gt_sqlca.DBMS)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM", Regstring!, gt_sqlca.DBPARM )
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM2", Regstring!, dbparm2)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DATABASE", Regstring!, gt_sqlca.Database)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "SERVERNAME", Regstring!, gt_sqlca.servername)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGID", Regstring!, gt_sqlca.logid)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGPASS", Regstring!, gt_sqlca.logpass)
end if

uo_key uoKey
uoKey = create uo_key

if uoKey.conecta() = 0 then
	string  key 
	key = uoKey.getKey()
	if key='0' then
		if ls_pro=32 THEN //ambiente a 32 bits
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGID", Regstring!, gt_sqlca.logid)
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGPASS", Regstring!, gt_sqlca.logpass)
		end if
		if ls_pro=64 THEN //ambiente a 64 bits
			RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGID", Regstring!, gt_sqlca.logid)
			RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGPASS", Regstring!, gt_sqlca.logpass)
		end if
	end if
	disconnect;
	destroy uoKey
end if
gt_sqlca.logpass=f_descripta( gt_sqlca.logpass)
// fin de SQLCA
gt_sqlca.AutoCommit=false
if not f_entrar(g_aplicacion,ls_pro) then
	if g_aplicacion='conf_apdx' then
		if messagebox("Atención",'Desea revisar los parametros generales del equipo ?',question!,yesno!,1)=1 then 
			closewithreturn(parent,'P')
			return
		end if
	end if
	parent.show()
	w_presenta.hide()
	return
end if
///// para trabajar sin la contraseña de access       ///////////////  SQLCA.dbParm =SQLCA.dbParm+sle_usuario.text+";PWD="+sle_passwd.text+"';"
long aqui,hastaaqui
string dsn,tipo,usu_nomb

aqui=pos(gt_sqlca.dbparm,"DSN=",1)
hastaaqui=pos(gt_sqlca.dbparm,";",aqui)
dsn=mid(gt_sqlca.dbparm,aqui +4,hastaaqui - aqui -4)
u_version u_ver
u_ver=create u_version
choose case g_aplicacion//esto es xa que cuando se actualizara un obj_comun entonces los otros aplicativos tambien se actualizen o si no solo se actualiza el primero
	case 'histo_clinic'
		u_ver.i_version_asis=g_version
	case 'gci_adm'
		u_ver.i_version_adm=g_version
	case 'conf_apdx'
		u_ver.i_vers_conf=g_version
end choose
choose case gt_sqlca.dbms
	case "ODBC"
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources", dsn, Regstring!, tipo)
		if pos(lower(tipo),"anywhere",1)<>0 then //es anywhere
			gt_sqlca.dbParm =gt_sqlca.dbParm+gt_sqlca.logid+";PWD="+gt_sqlca.logpass+"',DisableBind=1,DelimitIdentifier='No',OJSyntax='ANSI',DBTextLimit='1000000',Host='sistemas',Host='"+nombre+"',AppName='GCI As."+nombre+"',"		
		//	gt_sqlca.dbParm =gt_sqlca.dbParm+gt_sqlca.logid+";PWD="+gt_sqlca.logpass+"',DelimitIdentifier='No',OJSyntax='ANSI',DBTextLimit='1000000',Host='sistemas',Host='"+nombre+"',AppName='GCI As."+nombre+"',"
	    //	gt_sqlca.dbParm =gt_sqlca.dbParm+gt_sqlca.logid+";PWD="+gt_sqlca.logpass+"';DelimitIdentifier='No';OJSyntax='ANSI';DBTextLimit='1000000';Host='sistemas';Host='"+nombre+"';AppName='GCI As."+nombre+"';"
			g_motor='anywhere'
		else
			if pos(lower(tipo),"postgresql",1)<>0 then //es PostgreSQL Unicode
				gt_sqlca.dbParm =gt_sqlca.dbParm+gt_sqlca.logid+";UID="+gt_sqlca.logid+";PWD="+gt_sqlca.logpass+"',DisableBind=1,DelimitIdentifier='No',OJSyntax='ANSI',Host='"+nombre+"',AppName='GCI As."+nombre+"',"+"PBCatalogOwner='public',LoginTimeOut=10,"
				g_motor='postgres'
			else
				gt_sqlca.dbParm =gt_sqlca.dbParm+sle_usuario.text+";PWD=jorca',OJSyntax='ANSI',DBTextLimit='1000000',Host='"+nombre+"',AppName='GCI As."+nombre+"',"
  				g_motor='access'
			end If
		end if
	case "MSS Microsoft SQL Server"
		gt_sqlca.dbParm +="',DBTextLimit='1000000',OptSelectBlob=1,Secure=1,Host='"+nombre+"',AppName='GCI As. "+nombre+"',"
	case "SYC Adaptive Server Enterprise"
		gt_sqlca.dbParm +="',DBTextLimit='1000000',Host='"+nombre+"',AppName='AsV"+f_remplaza(u_ver.i_version_asis,'.','')+' '+nombre+"',"
	case 'OLE DB'
		gt_sqlca.Lock = "RC"
		string provider,file_conex
		if ls_pro=32 THEN
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "OLE_PROVIDERr", Regstring!, provider)
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "OLE_FILE", Regstring!, file_conex)
		end If
		if ls_pro=64 THEN
			RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "OLE_PROVIDER", Regstring!, provider)
			RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "OLE_FILE", Regstring!, file_conex)			
		end if
		gt_sqlca.dbparm="PROVIDER='"+provider+"',DATALINK='"+file_conex+"',DelimitIdentifier='No',"
		g_motor='sql'
end choose
gt_sqlca.dbParm = gt_sqlca.dbParm + dbparm2
SQLCA= gt_sqlca
connect ;

if SQLCA.SQLCode = -1 then 
	if g_aplicacion='conf_apdx' then
		if messagebox("Atención",sqlca.sqlerrtext+'~r~nDesea revisar los parametros de conexión del equipo ?',question!,yesno!,1)=1 then 
			closewithreturn(parent,'P')
			return
		end if
	end if
	w_presenta.hide()
	messagebox("Error de conexión",SQLCA.sqlerrtext)
	parent.show()
	return
end if

SELECT cadena into :g_biometria
FROM parametros_gen
WHERE (((codigo_para)=10));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 10')
	return -1
end if

//INICIA BIOMETRIA
If g_biometria='1' then
	huella_ingreso.Object.DestroyContext(c_contexto)
	huella_ingreso.Object.Finalize()
	huella_ingreso.object.Initialize()
	If l_error < 0 Then
		return -1
	Else
		c_template.template = Blob(Space(10000))
		huella_ingreso.Object.CapInitialize()
	End If
	//FIN BIOMETRIA
end if


// A C T U L I Z A D O R 
string ls_vers,ls_path,ls_devolver,ls_con,ls_ser,ls_bd,ls_prt,ls_usu,ls_pass,ls_path1
select version,camino,devolver,conexion,base,servidor,puerto,usuario,clave,camino1 into :ls_vers ,:ls_path ,:ls_devolver,:ls_con,:ls_ser,:ls_bd,:ls_prt,:ls_usu,:ls_pass,:ls_path1 from gci_versiones where nom_aplicacion=:g_aplicacion;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo versiones, no se puede realizar la actualización automática',sqlca.sqlerrtext)
	w_presenta.hide()
	parent.show()
	disconnect;
	return
end if
if (isnull(ls_vers) or ls_vers='') and g_aplicacion='conf_apdx' then ls_vers='1.0.0.0'
if (isnull(ls_vers) or ls_vers='') then
	messagebox('Error leyendo versiones','No se encuentra el registro de versiones de la aplicación: '+g_aplicacion)
	w_presenta.hide()
	parent.show()
	disconnect;
	return
end if

string sversion
long n_vers,n_versdb
n_versdb=long(f_remplaza(ls_vers,'.',''))
choose case g_aplicacion
	case 'histo_clinic'
		n_vers=long(f_remplaza(u_ver.i_version_asis,'.',''))
		sversion=u_ver.i_version_asis
	case 'gci_adm'
		n_vers=long(f_remplaza(u_ver.i_version_adm,'.',''))
		sversion=u_ver.i_version_adm
	case 'conf_apdx'
		n_vers=long(f_remplaza(u_ver.i_vers_conf,'.',''))
		sversion=u_ver.i_vers_conf
	case 'greportes'
		n_vers=long(f_remplaza(u_ver.i_vers_grep,'.',''))
		sversion=u_ver.i_vers_grep
end choose
if n_vers<>n_versdb then
	if n_vers>n_versdb  then
		if g_aplicacion='conf_apdx' then ls_devolver='1' //pa que deje trabajar si es el configurador
		if ls_devolver='0' then
			messagebox('Error de versiones','La versión de este programa '+sversion+' es más reciente que la indicada en la Base de Datos, consulte con el administrador del sistema')
			w_presenta.hide()
			parent.show()
			disconnect;
			return
		end if
	end if
	if ls_devolver='3' then
		ls_path=ls_path1
	end if
	if isnull(ls_path) or ls_path='' then
		messagebox('Error leyendo versiones','No se encuentra el directorio de actualizacion de versión de la aplicación: '+g_aplicacion)
		if g_aplicacion='conf_apdx' then goto sale
		w_presenta.hide()
		parent.show()
		disconnect;
		return
	end if
	if not directoryexists(ls_path) then //and g_aplicacion<>'conf_apdx' then
		messagebox('Atención','El directorio de actualizacion de versión de la aplicación: '+g_aplicacion+' no existe')
		if g_aplicacion='conf_apdx' then goto sale
		w_presenta.hide()
		parent.show()
		disconnect;
		return
	end if
	if not FileExists('actualizador.exe') then
		messagebox('Error','No se encontró el programa de Actualización: actualizador.exe',Exclamation!)
		if g_aplicacion='conf_apdx' then goto sale
		w_presenta.hide()
		parent.show()
		disconnect;
		return
	end if
	if messagebox('Atención',"La versión del programa no es la última, se instalará automáticamente la más reciente. Todas las aplicaciones Gci Abiertas se cerraran con este proceso; esta seguro?",question!,yesno!,1)=2 then return
	if ls_pro=32 THEN
		RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "APLIC_ACTU", Regstring!, g_aplicacion)
		RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DIREC_ACTU", Regstring!, ls_path)
	end if
	if ls_pro=64 THEN
		RegistrySet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "APLIC_ACTU", Regstring!, g_aplicacion)
		RegistrySet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "DIREC_ACTU", Regstring!, ls_path)
	end if
	IF run('actualizador.exe')=-1 THEN
		messagebox('Error','No se pudo ejecutar el programa de Actualización: actualiza.exe',Exclamation!)
		if g_aplicacion='conf_apdx' then goto sale
		w_presenta.hide()
		parent.show()
		disconnect;
		return
	end if
	close(parent)
	return
end if
if ls_devolver='1' then
	///CREA ODBC
	RegistrySet ("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName", "ComputerName", Regstring!, ls_con)
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Driver", Regstring!,"C:\\Program Files (x86)\\PostgreSQL\\psqlODBC\\bin\\psqlodbc35w.dll")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"CommLog", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Debug", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Fetch", Regstring!,"100")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"UniqueIndex", Regstring!,"1")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"UseDeclareFetch", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"UnknownSizes", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"TextAsLongVarchar", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"UnknownsAsLongVarchar", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"BoolsAsChar", Regstring!,"1")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Parse", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"MaxVarcharSize", Regstring!,"255")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"MaxLongVarcharSize", Regstring!,"8190")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"ExtraSysTablePrefixes", Regstring!,"")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Description", Regstring!,"")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Database", Regstring!,ls_bd)
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Servername", Regstring!,ls_ser)
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Port", Regstring!,ls_prt)
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Username", Regstring!,"")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"UID", Regstring!,"")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Password", Regstring!,"")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"ReadOnly", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"ShowOidColumn", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"FakeOidIndex", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"RowVersioning", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"ShowSystemTables", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"Protocol", Regstring!,"")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"ConnSettings", Regstring!,"")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"pqopt", Regstring!,"")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"UpdatableCursors", Regstring!,"1")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"LFConversion", Regstring!,"1")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"TrueIsMinus1", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"BI", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"D6", Regstring!,"-101")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"OptionalErrors", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"AB", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"ByteaAsLongVarBinary", Regstring!,"1")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"UseServerSidePrepare", Regstring!,"1")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"LowerCaseIdentifier", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"SSLmode", Regstring!,"disable")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"KeepaliveTime", Regstring!,"-1")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"KeepaliveInterval", Regstring!,"-1")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"BatchSize", Regstring!,"100")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"IgnoreTimeout", Regstring!,"0")
	RegistrySet ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+ls_con,"XaOpt", Regstring!,"1")
end if
if ls_devolver='2' or ls_devolver='4' then
	///GCI
//	ls_pass=f_descripta_new(ls_pass,'1')
//	if ls_pro=32 then
//		RegistrySet ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBMS", RegString!, 'ODBC' )
//		RegistrySet ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM", RegString!, "ConnectString ='DSN="+ls_con+";UID=" )
//		Registryset ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGID", Regstring!, ls_usu)
//		Registryset ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGPASS", Regstring!, f_encripta(ls_pass) )
//	End if
//	if ls_pro=64 then
//		RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBMS", RegString!, 'ODBC' )
//		RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM", RegString!, "ConnectString ='DSN="+ls_con+";UID=" )
//		RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGID", Regstring!, ls_usu)
//		RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGPASS", Regstring!, f_encripta(ls_pass) )
//	End If
end if	
//F I N   A C T U L I Z A D O R 
sale:

if f_num_compu(g_aplicacion,'I')=false then 
	w_presenta.hide()
	parent.show()
	disconnect;
	return
end if

////para que no compartan versiones entre instituciones
uo_datastore dw_clientes
dw_clientes=create uo_datastore 
dw_clientes.dataobject='dw_clientes'
dw_clientes.settransobject(sqlca)
dw_clientes.setfilter("upper(cliente)='"+upper(nom_regis)+"'")
dw_clientes.filter()
if dw_clientes.rowcount()>0 then
	g_firma=dw_clientes.getitemstring(dw_clientes.getrow(),'firma')
	g_logo_agua=dw_clientes.getitemstring(dw_clientes.getrow(),'logo')
	if g_version <> dw_clientes.getitemstring(dw_clientes.getrow(),g_aplicacion)  then 	
		messagebox('ATENCION PIRATA','Versión NO AUTORIZADA para '+nom_regis)
		disconnect;
		return
	end if
Else
	messagebox('Error','Error no especificado comuníquese con Soporte de GCI para Licencias')
	disconnect;
	close(parent)
	halt
End If 
////para que no compartan versiones entre instituciones

st_usuarios usu_st
if lc_huella=true then
	dw_hingreso.dataobject='dw_biometria_usuarios'
	dw_hingreso.settransobject(sqlca)
	String l_rec[2]

	l_rec=f_biometria_valida_paciente(c_template,'%','%',dw_hingreso,GR_MATCH,huella_ingreso,'usuario')
	usuario=trim(l_rec[2])
else
	usuario=trim(sle_usuario.text)
end if

select clave,estado,nombre, fecinicio, cfecfin,usuarios.nombre,intento,tp
into :clave , :estado ,:g_descrip_usu,:usu_fecha_ini, :usu_fecha_fin,:usu_nomb,:intentos,:tipodes
FROM usuarios, usugrupo
WHERE usuarios.usuario=:usuario And usuarios.usuario=usugrupo.usuario;
if isnull(usu_fecha_ini) then usu_fecha_ini=today()
if isnull(usu_fecha_fin) then usu_fecha_fin=today()
if isnull(intentos) then intentos=0

int l_maxintento
SELECT entero into :l_maxintento
FROM parametros_gen
WHERE (((codigo_para)=6));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 6')
	return 
end if
if isnull(estado) or estado='' or estado='2' then
	w_presenta.hide()
	parent.show()
	messagebox("Atención","Usuario no existe, no está activo o no tiene un Perfil de Grupo")

    delete from control_red where nom_equipo=upper(:g_nequipo)  and aplicativo=upper(:g_aplicacion);
	If sqlca.sqlcode=-1 then
		messagebox("Error borrando control_red",sqlca.sqlerrtext)
	  	rollback;
	   	return
	Else
		commit;
	End If
	w_presenta.hide()
	parent.show()
	disconnect;
	return
else
	if lc_huella=true then
		sle_passwd.text=f_descripta_new(clave,tipodes)
	end if 
	
	if sle_passwd.text<>f_descripta_new(clave,tipodes) or  isnull(clave) then
		Messagebox("Error","Contraseña no válida")
		w_presenta.hide()
		parent.show()
		intentos++
	    delete from control_red where nom_equipo=upper(:g_nequipo)  and aplicativo=upper(:g_aplicacion);
	    If sqlca.sqlcode=-1 then
	    		messagebox("Error borrando control_red",sqlca.sqlerrtext)
	      	rollback;
	      	return
	    Else
	       	commit;
   	    End If
		UPDATE Usuarios SET intento= :intentos
		WHERE (((usuario)=:usuario));
		If sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Intento",sqlca.sqlerrtext)
			rollback;
			return
		Else
			commit;
		End If
		if intentos>l_maxintento then 
			UPDATE Usuarios SET estado = '2'
			WHERE (((usuario)=:usuario));
			If sqlca.sqlcode=-1 then
				messagebox("Error Actualizando Estado Usuarios",sqlca.sqlerrtext)
				rollback;
				return
			Else
				commit;
			End If
			close(parent)
		End if
		disconnect;
		return
	else
		usu_st.usuario=usu_nomb
		usu_st.ini=usu_fecha_ini 
		usu_st.fin= usu_fecha_fin
		usu_st.clave=f_descripta_new(clave,tipodes)
		if  today()<usu_fecha_ini or today()> usu_fecha_fin  then
			Messagebox("Error","Su contaseña ha Caducado Renuevala")
			openwithparm(w_cambia_clave_usuario,usu_st)
			w_presenta.hide()
			parent.show()
		    delete from control_red where nom_equipo=upper(:g_nequipo)  and aplicativo=upper(:g_aplicacion);
			If sqlca.sqlcode=-1 then
	  			messagebox("Error borrando control_red",sqlca.sqlerrtext)
	  			rollback;
	   			return
			Else
				commit;
			End If
			disconnect;
			return
		end if
		double dias_faltan
		dias_faltan=DaysAfter( today(), usu_fecha_fin )
		If dias_faltan>=0 and dias_faltan<=10 then 
			int net
			Net =Messagebox("Atención","Faltan dias "+string(dias_faltan)+" Para Renovar Su Clave!! Desea Cambiarla?",  Exclamation!, OKCancel!, 2)
			 if net= 1 then
				openwithparm(w_cambia_clave_usuario,usu_st)
				if message.stringparm='-1' then 
					delete from control_red where nom_equipo=upper(:g_nequipo)  and aplicativo=upper(:g_aplicacion);
					If sqlca.sqlcode=-1 then
	  					messagebox("Error borrando control_red",sqlca.sqlerrtext)
	  					rollback;
	   					return
					Else
						commit;
					End If
					pb_cancel.triggerevent(clicked!)
				End IF
			End if
		End If
		UPDATE Usuarios SET intento= 0
		WHERE (((usuario)=:usuario));
		If sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Intento en 0",sqlca.sqlerrtext)
			rollback;
			return
		Else
			commit;
		End If
	End If
End if
w_presenta.show()

SELECT cadena into :g_vencimiento
FROM parametros_gen
WHERE (((parametros_gen.codigo_para)=34));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 34')
	return 
end if

SELECT cadena into :g_ctrlv
FROM parametros_gen
WHERE (((codigo_para)=16));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 16')
	return 
end if

g_ctrlv='0'
closewithreturn(parent,'1')

end event

event getfocus;default=true
end event

event losefocus;default=false
end event

type dw_hingreso from datawindow within w_conecta
boolean visible = false
integer x = 1595
integer y = 532
integer width = 146
integer height = 128
integer taborder = 60
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type c_imagen from picture within w_conecta
boolean visible = false
integer x = 1573
integer y = 60
integer width = 174
integer height = 132
boolean originalsize = true
boolean focusrectangle = false
end type

type st_3 from statictext within w_conecta
boolean visible = false
integer x = 69
integer y = 556
integer width = 471
integer height = 40
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 255
long backcolor = 67108864
string text = "Coloque Dedo sobre Lector"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within w_conecta
integer x = 69
integer y = 76
integer width = 443
integer height = 412
boolean originalsize = true
string picturename = "gci.jpg"
borderstyle borderstyle = StyleRaised!
boolean focusrectangle = false
end type

event constructor;if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DIRECTORIO", Regstring!, dir_insta)
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "DIRECTORIO", Regstring!, dir_insta)
if right(trim(dir_insta),1)<>"\" then dir_insta=trim(dir_insta)+"\"

end event

type sle_passwd from singlelineedit within w_conecta
event kepres pbm_keydown
integer x = 567
integer y = 272
integer width = 800
integer height = 92
integer taborder = 20
string dragicon = "none!"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
long backcolor = 16777215
boolean password = true
integer limit = 10
borderstyle borderstyle = stylelowered!
boolean hideselection = false
string placeholder = "Contraseña"
end type

event kepres;if key=keyenter! then
	pb_aceptar.setfocus()
	pb_aceptar.triggerevent(clicked!)
end if
end event

type sle_usuario from singlelineedit within w_conecta
event kepres pbm_keydown
integer x = 562
integer y = 140
integer width = 800
integer height = 92
integer taborder = 10
string dragicon = "none!"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
long backcolor = 16777215
textcase textcase = upper!
integer limit = 15
borderstyle borderstyle = stylelowered!
string placeholder = "Usuario"
end type

event kepres;if key=keyenter! then
	sle_passwd.setfocus()
end if
end event

event help;ShowPopupHelp ( dir_insta+"gciltda.hlp", this, 1)
end event

type gb_1 from groupbox within w_conecta
integer x = 32
integer y = 8
integer width = 1394
integer height = 608
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Aw_conecta.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Aw_conecta.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
