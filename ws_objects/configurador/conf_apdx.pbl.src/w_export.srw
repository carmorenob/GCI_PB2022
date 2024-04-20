$PBExportHeader$w_export.srw
forward
global type w_export from window
end type
type pb_2 from picturebutton within w_export
end type
type pb_1 from picturebutton within w_export
end type
type cbx_1 from checkbox within w_export
end type
type rb_10 from radiobutton within w_export
end type
type rb_9 from radiobutton within w_export
end type
type rb_8 from radiobutton within w_export
end type
type rb_7 from radiobutton within w_export
end type
type rb_6 from radiobutton within w_export
end type
type rb_5 from radiobutton within w_export
end type
type rb_4 from radiobutton within w_export
end type
type rb_3 from radiobutton within w_export
end type
type rb_2 from radiobutton within w_export
end type
type rb_1 from radiobutton within w_export
end type
type gb_1 from groupbox within w_export
end type
end forward

global type w_export from window
integer width = 1678
integer height = 860
boolean titlebar = true
string title = "Exportar/Importar datos con Formato"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Information!"
pb_2 pb_2
pb_1 pb_1
cbx_1 cbx_1
rb_10 rb_10
rb_9 rb_9
rb_8 rb_8
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_export w_export

event open;this.x=(ancho - this.width)/2
this.y=(alto - this.height)/2
end event

on w_export.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cbx_1=create cbx_1
this.rb_10=create rb_10
this.rb_9=create rb_9
this.rb_8=create rb_8
this.rb_7=create rb_7
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.cbx_1,&
this.rb_10,&
this.rb_9,&
this.rb_8,&
this.rb_7,&
this.rb_6,&
this.rb_5,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on w_export.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cbx_1)
destroy(this.rb_10)
destroy(this.rb_9)
destroy(this.rb_8)
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

type pb_2 from picturebutton within w_export
string tag = "&Cancelar"
integer x = 869
integer y = 632
integer width = 151
integer height = 132
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.GIF"
alignment htextalign = left!
end type

event clicked;export="!"
close(parent)
end event

type pb_1 from picturebutton within w_export
string tag = "&Aceptar"
integer x = 663
integer y = 636
integer width = 151
integer height = 132
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;if rb_1.checked then
	export=""
	exten=clipboard!
end if
if rb_2.checked then
	export="Texto separado por comas (*.CSV),*.CSV"
	exten=CSV!
end if
if rb_3.checked then
	export="DBASE2 (*.DBF),*.DBF"
	exten=dBASE2!
end if
if rb_4.checked then
	export="DBASE3 (*.DBF),*.DBF"
	exten=dBASE3!
end if
if rb_5.checked then
	export="Excel 3 (*.XLS),*.XLS"
	exten=Excel!
end if
if rb_6.checked then
	export="Excel 5 (*.XLS),*.XLS"
	exten=Excel5!
end if
if rb_7.checked then
	export="Archivo HTML (*.HTM),*.HTM"
	exten=HTMLTable!
end if
if rb_8.checked then
	export="Insert de SQL (*.sql),*.sql"
	exten=SQLInsert!
end if
if rb_10.checked then
	export="Lotus 123 (*.WKS),*.WKS"
	exten=SQLInsert!
end if
if rb_9.checked then
	export="Texto separado por TAB (*.TXT),*.TXT"
	exten=Text!
end if
if cbx_1.checked then
	encabez=true
else
	encabez=false
end if
close(parent)
end event

type cbx_1 from checkbox within w_export
integer x = 91
integer y = 560
integer width = 686
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Exportar con encabezados"
boolean checked = true
end type

type rb_10 from radiobutton within w_export
integer x = 110
integer y = 452
integer width = 448
integer height = 72
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lotus123 (WKS)"
end type

type rb_9 from radiobutton within w_export
integer x = 658
integer y = 452
integer width = 649
integer height = 72
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Texto separado por TAB"
end type

type rb_8 from radiobutton within w_export
integer x = 658
integer y = 368
integer width = 526
integer height = 72
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Insert de SQL (TXT)"
end type

type rb_7 from radiobutton within w_export
integer x = 110
integer y = 368
integer width = 379
integer height = 72
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo HTML"
end type

type rb_6 from radiobutton within w_export
integer x = 658
integer y = 284
integer width = 343
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Excel 5"
end type

type rb_5 from radiobutton within w_export
integer x = 110
integer y = 284
integer width = 343
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Excel 3"
end type

type rb_4 from radiobutton within w_export
integer x = 658
integer y = 200
integer width = 343
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DBASE3"
end type

type rb_3 from radiobutton within w_export
integer x = 110
integer y = 200
integer width = 343
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DBASE2"
end type

type rb_2 from radiobutton within w_export
integer x = 658
integer y = 116
integer width = 878
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo separado por comas (CVS)"
boolean checked = true
end type

type rb_1 from radiobutton within w_export
integer x = 110
integer y = 116
integer width = 439
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Al portapapeles"
end type

type gb_1 from groupbox within w_export
integer x = 64
integer y = 36
integer width = 1513
integer height = 516
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Importar o Exportar Datos con Formato:"
end type

