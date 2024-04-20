$PBExportHeader$conf_apdx.sra
$PBExportComments$Generated Application Object
forward
global type conf_apdx from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
//// Para BIOMETRIA
String gbiometria_filePathName = 'c:\windows\temp\huella_tmp.bmp'
Integer  &
/* Initialization Error Codes */&
GRCAP_IMAGE_FORMAT_BMP= 501 /*Windows Bitmap (BMP) image format */ ,&
GR_OK						= 0,/*Success */ &
GR_MATCH 					= 1, /*Fingerprints match */ &
GR_BAD_QUALITY 			= 0, /*Extraction succeeded, template has bad quality */ &
GR_MEDIUM_QUALITY 	= 1, /*Extraction succeeded, template has medium quality */ &
GR_HIGH_QUALITY 		= 2, /*Extraction succeeded, template has high quality */ &
GRFINGER_FULL        		= 1, &
GRFINGER_LIGHT       	= 2, &
GRFINGER_FREE         	= 3 ,&
l_error,&
ls_pro
/// FIN Biometria

string usuario,dir_insta,val_hasta,decual,export,dir_rep,clugar,g_motor,g_descrip_usu,g_ctrlv,g_biometria,g_ruta,sex_busca
date usu_fecha_ini,usu_fecha_fin
saveastype exten
long ancho,alto,g_tercerodesde
boolean new_or_edit,encabez,centrar=false //true nuevo false edit
//para la busqueda con el que se paraece a 'popmenu' (w_funcion_dw)
dwobject g_dwo  
string g_nombre_abuscar,g_abuscar,retorna_busqueda
string gs_key='Jaer Key19332000',gs_inv='Jorca2021'
datawindow g_dw_xabuscar
string aplicativo,lice,nom_regis,activacion,g_logo_agua,g_firma,g_nequipo
boolean g_demo=false
string g_vencimiento //para lo de lotes
string g_aplicacion='conf_apdx',g_version='6.0.0.39'
uo_transaction gt_sqlca

end variables
global type conf_apdx from application
string appname = "conf_apdx"
string toolbarframetitle = "Barra de Herramientas"
string toolbarsheettitle = "Apoyo diagnóstico"
string microhelpdefault = "Configuador de Apoyo Diagnóstico"
string dwmessagetitle = "Conf. Apoyo Diagnóstico"
string displayname = "Configuarción de Apoyo Diagnóstico"
string themepath = "C:\Program Files (x86)\Appeon\Shared\PowerBuilder\theme190"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "gci_cfg.ico"
string appruntimeversion = "22.0.0.1892"
boolean manualsession = false
boolean unsupportedapierror = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
end type
global conf_apdx conf_apdx

on conf_apdx.create
appname="conf_apdx"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on conf_apdx.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;g_ruta=GetCurrentDirectory( )
g_ruta=g_ruta+'\'

open(w_presenta)
w_presenta.hide()
open(w_conecta)
choose case message.stringparm
	case 'P'
		close(w_presenta)
		open(w_para_grales_new)
	case '1'
		int l_tempori
		SELECT entero into :l_tempori
 		FROM parametros_gen
		WHERE (((codigo_para)=11));
		if sqlca.sqlnrows=0 then
			messagebox('Atencíon','No hay parametro 11')
			close(w_presenta)
			halt
		end if
		idle(l_tempori*60)
		open(w_principal)
		w_presenta.setfocus()
	case else
			close(w_presenta)
			halt
	end choose
end event

event idle;w_principal.TriggerEvent(close!)
end event

