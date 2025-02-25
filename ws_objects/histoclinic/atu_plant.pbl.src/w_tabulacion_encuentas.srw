$PBExportHeader$w_tabulacion_encuentas.srw
forward
global type w_tabulacion_encuentas from window
end type
type uo_encuesta from uo_hclin_as within w_tabulacion_encuentas
end type
end forward

global type w_tabulacion_encuentas from window
integer width = 4562
integer height = 2168
boolean titlebar = true
string title = "Encuestas"
boolean controlmenu = true
boolean maxbox = true
long backcolor = 67108864
string icon = "tab_encu.ico"
uo_encuesta uo_encuesta
end type
global w_tabulacion_encuentas w_tabulacion_encuentas

on w_tabulacion_encuentas.create
this.uo_encuesta=create uo_encuesta
this.Control[]={this.uo_encuesta}
end on

on w_tabulacion_encuentas.destroy
destroy(this.uo_encuesta)
end on

event open;st_anula st_p
st_p = Message.PowerObjectParm
string vnul
if isValid(st_p) then
	if not isNull(st_p.nfact) and not isNull(st_p.de_donde) then// de_donde es codplantilla
		uo_encuesta.Retrieve(st_p.de_donde,st_p.nfact,st_p.clugar_fac)
	end if
else
	setNull(vnul)
	uo_encuesta.Retrieve(vnul,1)
end if

end event

event closequery;Return uo_encuesta.event closequery()

end event

type uo_encuesta from uo_hclin_as within w_tabulacion_encuentas
integer x = 37
integer y = 32
integer taborder = 50
end type

on uo_encuesta.destroy
call uo_hclin_as::destroy
end on

