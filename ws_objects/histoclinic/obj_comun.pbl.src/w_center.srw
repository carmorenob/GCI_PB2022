$PBExportHeader$w_center.srw
$PBExportComments$Centers a window
forward
global type w_center from window
end type
type pb_grabar from picturebutton within w_center
end type
end forward

global type w_center from window
integer width = 2706
integer height = 1620
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
boolean center = true
pb_grabar pb_grabar
end type
global w_center w_center

type variables
int xant,yant
boolean cambio=false
end variables

forward prototypes
public function integer grabar ()
public function integer f_pregunta ()
end prototypes

public function integer grabar ();// si guarda bien debe pasar cambio a false
if true=false then return 1
end function

public function integer f_pregunta ();if not cambio then return 2
return messagebox("Atención, realizó cambios",this.tag,question!,yesnocancel!,3)
end function

on w_center.create
this.pb_grabar=create pb_grabar
this.Control[]={this.pb_grabar}
end on

on w_center.destroy
destroy(this.pb_grabar)
end on

event closequery;choose case f_pregunta()
	case 1
		if grabar()=-1 then
			return 1
		else
			return 0
		end if
	case 2
		return 0
	case 3
		return 1
end choose

end event

type pb_grabar from picturebutton within w_center
event mousemove pbm_mousemove
integer x = 1893
integer y = 4
integer width = 146
integer height = 128
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &g"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

