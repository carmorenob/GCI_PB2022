$PBExportHeader$histo_clinic.sra
$PBExportComments$Generated Application Object
forward
global type histo_clinic from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
// Para BIOMETRIA
Boolean g_captura=false,g_sensor=false
Integer &
/* Initialization Error Codes */&
GRCAP_IMAGE_FORMAT_BMP= 501 /*Windows Bitmap (BMP) image format */ ,&
GR_OK						= 0,/*Success */ &
GR_MATCH 					= 1, /*Fingerprints match */ &
GR_BAD_QUALITY 			= 0, /*Extraction succeeded, template has bad quality */ &
GR_MEDIUM_QUALITY 	= 1, /*Extraction succeeded, template has medium quality */ &
GR_HIGH_QUALITY 		= 2, /*Extraction succeeded, template has high quality */ &
GRFINGER_FULL        		= 1, &
GRFINGER_LIGHT       	= 2, &
GRFINGER_FREE         	= 3,&    
l_error,&
ls_pro

String gbiometria_filePathName = 'c:\windows\temp\huella_tmp.bmp',g_biometria,ruta_certifiado
/// FIN Biometria

keycode i_nextitem=keyf7!,i_nextchild=keyf9!,i_previtem=keyf8!
String docu,histo,tipdoc,usuario,g_profe,g_especi,diagserv,atiende,sex_busca,g_descrip_usu,g_ctrlv,gs_error
String dir_rep_asis,dsn_capi,texto_np,f_imprime='1'
Boolean es_nuevo//xa pacientes
Long edad_busca,g_tercerodesde
Long ancho,alto
String retorna_busqueda,retorna_des_busqueda, dir_insta,gs_pdf
String CLUGAR,aplicativo,val_hasta,lice,nom_regis,activacion,g_motor,g_nequipo
String g_nombre_abuscar,g_abuscar,atiendeod,gs_llaved
string gs_key='Jaer Key19332000'
string gs_inv='Jorca2021'
// para el objeto de reporte los valores son : documento!,interno!,menu!,externo!
boolean g_demo=false,g_formula=true
string g_firma, g_logo_agua,tipo_pais,g_vencimiento //para lo de lotes
string g_aplicacion='histo_clinic',g_version='6.0.0.118'
string gs_oxigeno
date usu_fecha_ini, usu_fecha_fin
uo_transaction gt_sqlca
end variables
global type histo_clinic from application
string appname = "histo_clinic"
string toolbarframetitle = "Barra de Herramientas"
string toolbarsheettitle = "Odontología"
string microhelpdefault = "Gestión Clínica Integrada"
string dwmessagetitle = "Gestión Clínica Integrada"
string displayname = "Gestión Clínica Integrada"
string themepath = "C:\Program Files (x86)\Appeon\Shared\PowerBuilder\theme190"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "gci_cli.ico"
string appruntimeversion = "22.0.0.1892"
boolean manualsession = false
boolean unsupportedapierror = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
end type
global histo_clinic histo_clinic

on histo_clinic.create
appname="histo_clinic"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on histo_clinic.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_presenta)
w_presenta.hide()
open(w_conecta)

if message.stringparm='1' then
	int l_tempori
	//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI", "tempo_apli", Regstring!, l_temp )
	SELECT entero into :l_tempori
	FROM parametros_gen
	WHERE (((codigo_para)=11));
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','No hay parametro 11')
		close(w_presenta)
		halt
	end if
	idle(l_tempori*60)
	
	if CLUGAR="" or isnull(CLUGAR) then 
		messagebox('Atencíon','Este computador no tiene un código de lugar válido')
		close(w_presenta)
		halt
	end if
	string descrip
	select descripcion into :descrip from lugar where codlugar=:clugar;
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','Este computador no tiene un código de lugar válido')
		close(w_presenta)
		halt
	end if
	
	SELECT cadena into :dir_rep_asis
	FROM parametros_gen
	WHERE (((codigo_para)=27));
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','No hay parametro 27')
		close(w_presenta)
		halt
	end if
	
	if ls_pro=32 THEN	
		RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI", "PROFE", Regstring!, g_profe)
		RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI", "DSN_CAPI", Regstring!, dsn_capi)
	end If
	if ls_pro=64 THEN	
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "PROFE", Regstring!, g_profe)
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "DSN_CAPI", Regstring!, dsn_capi)
	end If
	open(w_principal)
	w_presenta.setfocus()
	//w_principal.triggerevent(toolbarmoved!)
else
	close(w_presenta)
	halt
end if
end event

event systemerror;Open(w_system_error)
end event

event idle;//if  IsValid(w_evolucion_new) then w_evolucion_new.TriggerEvent(closequery!)
w_principal.TriggerEvent(close!) 
end event

