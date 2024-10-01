$PBExportHeader$gci_adm.sra
$PBExportComments$Generated Application Object
forward
global type gci_adm from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
// Para BIOMETRIA
String gbiometria_filePathName = 'c:\windows\temp\huella_tmp.bmp',g_biometria
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
/// FIN Biometria

long ancho,alto
string clugar,usuario,val_hasta,dir_insta,lice,activacion,nom_regis,aplicativo,g_descrip_usu,g_ctrlv,sex_busca
string gs_maquina,gs_usuario //agrega para fotos
date usu_fecha_ini,usu_fecha_fin
long g_tercerodesde
boolean g_semovio
boolean  gb_adm //agrega fotos
string gs_default_mevento,gs_mevento //el por defecto de un usuario
//para la busqueda con el que se paraece a 'popmenu' (w_funcion_dw)
string g_nombre_abuscar,g_abuscar,g_vencimiento,g_motor,g_chdate,g_logo_agua,g_firma,g_nequipo,gs_error
string almacen,  Regimen,retorna_busqueda // de suministros
string gs_key='Jaer Key19332000',gs_inv='Jorca2021'
window w_gen[20]
boolean g_demo=false
string g_aplicacion='gci_adm',g_version='5.0.0.78'
int i_dec_gral_car
uo_report i_rep_adm[8,15]
uo_transaction gt_sqlca

///
string tipdoc,g_profe,docu
end variables
global type gci_adm from application
string appname = "gci_adm"
string toolbarframetitle = "Barra de Herramientas de GCI"
string microhelpdefault = "Gestión Cliente Interno"
string dwmessagetitle = "Error en Datawindows de Gestión Cliente Interno"
string displayname = "Gestión Cliente Interno"
string themepath = "C:\Program Files (x86)\Appeon\Shared\PowerBuilder\theme190"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "gci_int.ico"
string appruntimeversion = "22.0.0.1892"
boolean manualsession = false
boolean unsupportedapierror = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
end type
global gci_adm gci_adm

on gci_adm.create
appname="gci_adm"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on gci_adm.destroy
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

	SELECT entero into :l_tempori
	FROM parametros_gen
	WHERE (((codigo_para)=11));
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','No hay parametro 11')
		return 
	end if

	idle(l_tempori*60)
	open(w_principal)
	w_presenta.setfocus()
else
	close(w_presenta)
	halt
end if
end event

event systemerror;open(w_system_error)
end event

event idle;//--If nom_regis<>'GCI LTDA' then
//w_principal.TriggerEvent(close!)
//End If


end event

