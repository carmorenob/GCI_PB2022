$PBExportHeader$uo_st.sru
forward
global type uo_st from userobject
end type
type st_1 from statictext within uo_st
end type
end forward

global type uo_st from userobject
integer width = 1509
integer height = 72
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
end type
global uo_st uo_st

type variables
long pos

end variables

forward prototypes
public subroutine setlabel (string texto)
end prototypes

public subroutine setlabel (string texto);st_1.Text = Texto

end subroutine

on uo_st.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on uo_st.destroy
destroy(this.st_1)
end on

type st_1 from statictext within uo_st
integer y = 4
integer width = 1509
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

