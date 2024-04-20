$PBExportHeader$uo_chdate.sru
$PBExportComments$Objeto para cambiar fechas de documentos
forward
global type uo_chdate from userobject
end type
type pb_g from picturebutton within uo_chdate
end type
type pb_e from picturebutton within uo_chdate
end type
end forward

global type uo_chdate from userobject
integer width = 155
integer height = 128
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_g pb_g
pb_e pb_e
end type
global uo_chdate uo_chdate

type variables
datawindow dw_cab
string campo, campo1
private boolean editable = FALSE
string estadodef,estado2

end variables

forward prototypes
public function integer reset ()
end prototypes

public function integer reset ();editable = FALSE
pb_e.Visible = TRUE
pb_g.Visible = FALSE
if isValid(dw_cab) then
	dw_cab.Modify(campo+".edit.DisplayOnly=Yes "+campo1+".edit.DisplayOnly=Yes")
end if
Return 0

end function

on uo_chdate.create
this.pb_g=create pb_g
this.pb_e=create pb_e
this.Control[]={this.pb_g,&
this.pb_e}
end on

on uo_chdate.destroy
destroy(this.pb_g)
destroy(this.pb_e)
end on

event constructor;pb_e.Visible = TRUE
pb_g.Visible = FALSE
end event

type pb_g from picturebutton within uo_chdate
event mousemove pbm_mousemove
string tag = "Nueva Disponibilidad"
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Grabar fecha"
end type

event clicked;string st

if editable then
	st = dw_cab.GetItemString(dw_cab.GetRow(),'estado')
	if not(st = estadodef or st = estado2) then
		MessageBox('Aviso','La fecha puede grabarse con el procedimiento normal para guardar el documento')
		Return -1
	end if
	if dw_cab.Update() = -1 then
		Rollback;
		Return -1
	end if
end if
this.Visible = FALSE
pb_e.Visible = TRUE
end event

type pb_e from picturebutton within uo_chdate
event mousemove pbm_mousemove
string tag = "Nueva Disponibilidad"
integer width = 142
integer height = 124
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "editar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Editar fecha"
end type

event clicked;if isValid(dw_cab) then
	dw_cab.Modify(campo+".Edit.DisplayOnly=NO " +campo1+".Edit.DisplayOnly=NO")
	editable = TRUE
	this.Visible = FALSE
	pb_g.Visible = TRUE
end if

end event

