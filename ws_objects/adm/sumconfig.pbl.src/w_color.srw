$PBExportHeader$w_color.srw
forward
global type w_color from window
end type
type sle_1 from singlelineedit within w_color
end type
type em_b from editmask within w_color
end type
type em_g from editmask within w_color
end type
type em_r from editmask within w_color
end type
type r_1 from rectangle within w_color
end type
end forward

global type w_color from window
integer width = 1979
integer height = 1100
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
sle_1 sle_1
em_b em_b
em_g em_g
em_r em_r
r_1 r_1
end type
global w_color w_color

on w_color.create
this.sle_1=create sle_1
this.em_b=create em_b
this.em_g=create em_g
this.em_r=create em_r
this.r_1=create r_1
this.Control[]={this.sle_1,&
this.em_b,&
this.em_g,&
this.em_r,&
this.r_1}
end on

on w_color.destroy
destroy(this.sle_1)
destroy(this.em_b)
destroy(this.em_g)
destroy(this.em_r)
destroy(this.r_1)
end on

type sle_1 from singlelineedit within w_color
integer x = 955
integer y = 92
integer width = 402
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;r_1.FillColor = long(this.Text)
end event

type em_b from editmask within w_color
integer x = 224
integer y = 492
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "0~~255"
end type

event modified;double r,g,b
em_r.GetData(r)
em_g.GetData(g)
em_b.GetData(b)
r_1.FillColor = rgb(r, g, b)
end event

type em_g from editmask within w_color
integer x = 224
integer y = 364
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "0~~255"
end type

event modified;double r,g,b
em_r.GetData(r)
em_g.GetData(g)
em_b.GetData(b)
r_1.FillColor = rgb(r, g, b)
end event

type em_r from editmask within w_color
integer x = 224
integer y = 240
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
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "0~~255"
end type

event modified;double r,g,b
em_r.GetData(r)
em_g.GetData(g)
em_b.GetData(b)
r_1.FillColor = rgb(r, g, b)
end event

type r_1 from rectangle within w_color
integer linethickness = 1
long fillcolor = 16777215
integer x = 919
integer y = 216
integer width = 480
integer height = 404
end type

