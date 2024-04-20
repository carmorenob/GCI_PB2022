$PBExportHeader$actualizador.sra
$PBExportComments$Generated Application Object
forward
global type actualizador from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string g_motor, g_ruta
long g_paso=0,i_cuantos,i_va

end variables

global type actualizador from application
string appname = "actualizador"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 22.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "D:\gci\fuentes\repo_git\actualizador\instala.ico"
string appruntimeversion = "22.0.0.1892"
boolean manualsession = false
boolean unsupportedapierror = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
end type
global actualizador actualizador

type variables

end variables

on actualizador.create
appname="actualizador"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on actualizador.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;g_ruta=GetCurrentDirectory( )
open(w_actualiza)
end event

