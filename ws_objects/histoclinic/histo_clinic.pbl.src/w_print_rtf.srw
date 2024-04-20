$PBExportHeader$w_print_rtf.srw
forward
global type w_print_rtf from window
end type
type st_1 from statictext within w_print_rtf
end type
type em_1 from editmask within w_print_rtf
end type
type cb_3 from commandbutton within w_print_rtf
end type
type cb_2 from commandbutton within w_print_rtf
end type
type cb_1 from commandbutton within w_print_rtf
end type
type ddlb_1 from dropdownlistbox within w_print_rtf
end type
type rb_2 from radiobutton within w_print_rtf
end type
type rb_1 from radiobutton within w_print_rtf
end type
type sle_1 from singlelineedit within w_print_rtf
end type
type gb_1 from groupbox within w_print_rtf
end type
end forward

global type w_print_rtf from window
integer width = 1746
integer height = 896
boolean titlebar = true
string title = "Imprimir"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
em_1 em_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
ddlb_1 ddlb_1
rb_2 rb_2
rb_1 rb_1
sle_1 sle_1
gb_1 gb_1
end type
global w_print_rtf w_print_rtf

type variables
RichTextEdit rte
end variables

on w_print_rtf.create
this.st_1=create st_1
this.em_1=create em_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ddlb_1=create ddlb_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.sle_1=create sle_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.em_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.ddlb_1,&
this.rb_2,&
this.rb_1,&
this.sle_1,&
this.gb_1}
end on

on w_print_rtf.destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ddlb_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.sle_1)
destroy(this.gb_1)
end on

event open;rte = Message.PowerObjectParm

end event

type st_1 from statictext within w_print_rtf
integer x = 128
integer y = 436
integer width = 219
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copias"
boolean focusrectangle = false
end type

type em_1 from editmask within w_print_rtf
integer x = 384
integer y = 428
integer width = 421
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "#"
boolean spin = true
double increment = 1
string minmax = "1~~100"
end type

type cb_3 from commandbutton within w_print_rtf
integer x = 910
integer y = 640
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_2 from commandbutton within w_print_rtf
integer x = 402
integer y = 640
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
boolean default = true
end type

event clicked;string pages

if rb_1.checked then
	pages = ""
else
	pages = sle_1.Text
end if
rte.Print(integer(em_1.Text),pages,FALSE,TRUE)
close(parent)
end event

type cb_1 from commandbutton within w_print_rtf
integer x = 1179
integer y = 236
integer width = 352
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Propiedades"
end type

event clicked;PrintSetupPrinter()
end event

type ddlb_1 from dropdownlistbox within w_print_rtf
integer x = 59
integer y = 64
integer width = 1477
integer height = 352
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;string lista, printer
integer posf

lista = PrintGetPrinters()

do while pos(lista,"~t") > 0 
	printer = left(lista,pos(lista,"~t") - 1)
	AddItem(printer)
	posf = pos(lista,char(13))
	if posf > 0 then
		lista = mid(lista,posf+2)
	else
		EXIT
	end if
loop
Text = left(PrintGetPrinter(),pos(lista,"~t") - 1)


end event

event selectionchanged;PrintSetPrinter(this.text(index))
end event

type rb_2 from radiobutton within w_print_rtf
integer x = 59
integer y = 340
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pági&nas"
end type

type rb_1 from radiobutton within w_print_rtf
integer x = 59
integer y = 244
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Todo"
boolean checked = true
end type

type sle_1 from singlelineedit within w_print_rtf
integer x = 384
integer y = 320
integer width = 421
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;rb_2.checked = TRUE
end event

type gb_1 from groupbox within w_print_rtf
integer x = 37
integer y = 208
integer width = 1033
integer height = 388
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

