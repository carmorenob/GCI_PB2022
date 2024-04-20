$PBExportHeader$w_tablero_citas.srw
forward
global type w_tablero_citas from window
end type
type cb_1 from commandbutton within w_tablero_citas
end type
type sle_1 from singlelineedit within w_tablero_citas
end type
end forward

global type w_tablero_citas from window
integer width = 3378
integer height = 1408
boolean titlebar = true
string title = "Consulta Extera"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
sle_1 sle_1
end type
global w_tablero_citas w_tablero_citas

on w_tablero_citas.create
this.cb_1=create cb_1
this.sle_1=create sle_1
this.Control[]={this.cb_1,&
this.sle_1}
end on

on w_tablero_citas.destroy
destroy(this.cb_1)
destroy(this.sle_1)
end on

type cb_1 from commandbutton within w_tablero_citas
integer x = 1070
integer y = 200
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;OLEObject iol_seppech
iol_seppech = CREATE OLEObject
iol_seppech.ConnectToNewObject( "SAPI.SpVoice")
iol_seppech.volume = 100
iol_seppech.speak("Convierta su texto a voz")
end event

type sle_1 from singlelineedit within w_tablero_citas
integer x = 151
integer y = 56
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Hola si "
borderstyle borderstyle = stylelowered!
end type

