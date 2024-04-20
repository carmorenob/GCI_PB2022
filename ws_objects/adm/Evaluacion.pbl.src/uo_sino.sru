$PBExportHeader$uo_sino.sru
forward
global type uo_sino from userobject
end type
type st_1 from statictext within uo_sino
end type
type rb_2 from radiobutton within uo_sino
end type
type rb_1 from radiobutton within uo_sino
end type
end forward

global type uo_sino from userobject
integer width = 1458
integer height = 88
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
rb_2 rb_2
rb_1 rb_1
end type
global uo_sino uo_sino

type variables
st_uobject st_p
Boolean changed = FALSE
long pos

end variables

forward prototypes
public subroutine setlabel (string texto)
public function string getvalue ()
end prototypes

public subroutine setlabel (string texto);st_1.Text = Texto

end subroutine

public function string getvalue ();string ret
if rb_1.Checked then
	ret = '1'
elseif rb_2.Checked then
	ret =  '0'
else
	setNull(ret)
end if
Return ret

end function

on uo_sino.create
this.st_1=create st_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.Control[]={this.st_1,&
this.rb_2,&
this.rb_1}
end on

on uo_sino.destroy
destroy(this.st_1)
destroy(this.rb_2)
destroy(this.rb_1)
end on

event constructor;st_p = Message.PowerObjectParm

if not isValid(st_p) then Return
if st_p.sValor = '1' then
	rb_1.Checked = TRUE
elseif st_p.sValor = '0' then
	rb_2.Checked = TRUE
end if

end event

type st_1 from statictext within uo_sino
integer x = 14
integer y = 12
integer width = 1056
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type rb_2 from radiobutton within uo_sino
integer x = 1285
integer y = 12
integer width = 178
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "No"
end type

event clicked;changed = TRUE

end event

type rb_1 from radiobutton within uo_sino
integer x = 1093
integer y = 12
integer width = 165
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Si"
end type

event clicked;changed = TRUE

end event

event getfocus;w_formulario wt
wt = f_vent_padre(this)
if parent.y + 400 > wt.Height then
	wt.vsb_1.Event moved(pos - 300)
end if
Return 0

end event

