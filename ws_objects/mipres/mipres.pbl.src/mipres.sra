$PBExportHeader$mipres.sra
$PBExportComments$Generated Application Object
forward
global type mipres from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string gs_motor
Int gi_pro


end variables

global type mipres from application
string appname = "mipres"
string themepath = "C:\Program Files (x86)\Appeon\Shared\PowerBuilder\theme190"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = ""
string appruntimeversion = "22.0.0.1892"
end type
global mipres mipres

on mipres.create
appname="mipres"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on mipres.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_mipres)
end event

