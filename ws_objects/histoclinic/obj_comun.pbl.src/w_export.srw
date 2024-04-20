$PBExportHeader$w_export.srw
forward
global type w_export from window
end type
type pb_2 from picturebutton within w_export
end type
type pb_1 from picturebutton within w_export
end type
type rb_12 from radiobutton within w_export
end type
type rb_11 from radiobutton within w_export
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
integer width = 2080
integer height = 712
boolean titlebar = true
string title = "Exportar/Importar datos con Formato"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Information!"
boolean clientedge = true
boolean center = true
pb_2 pb_2
pb_1 pb_1
rb_12 rb_12
rb_11 rb_11
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

type variables
datawindow i_dw
end variables

on w_export.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.rb_12=create rb_12
this.rb_11=create rb_11
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
this.rb_12,&
this.rb_11,&
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
destroy(this.rb_12)
destroy(this.rb_11)
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

event open;i_dw=message.powerobjectparm
end event

type pb_2 from picturebutton within w_export
integer x = 1202
integer y = 472
integer width = 146
integer height = 128
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_export
integer x = 1024
integer y = 472
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;string export,j='0'
saveastype exten
boolean encabez
if rb_1.checked then
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
	export="Excel 5 (*.XLS),*.XLS"
	exten=Excel5!
	j='1'
end if
if rb_6.checked then
	export="Excel 8 (*.XLS),*.XLS"
	exten=Excel8!
end if
if rb_7.checked then
	export="Archivo HTML (*.HTM),*.HTM"
	exten=HTMLTable!
end if
if rb_8.checked then
	export="Insert de SQL (*.sql),*.sql"
	exten=SQLInsert!
end if
if rb_9.checked then
	export="Texto separado por TAB (*.TXT),*.TXT"
	exten=Text!
end if
if rb_10.checked then
	export="Lotus 123 (*.WKS),*.WKS"
	exten=SQLInsert!
end if
if rb_11.checked then
	i_dw.Object.DataWindow.Export.PDF.Method = Distill!
    i_dw.Object.DataWindow.Export.PDF.Distill.CustomPostScript="Yes" // Permitir Postscript
	export="Archivo xml (*.xml),*.xml"
	exten=xml!
end if
if rb_12.checked then
	export="Archivo Pdf (*.pdf),*.pdf"
	i_dw.Object.DataWindow.Export.PDF.Method = Distill!
    i_dw.Object.DataWindow.Export.PDF.Distill.CustomPostScript="Yes" // Permitir Postscript
	exten= PDF!
end if
if cbx_1.checked then
	encabez=true
else
	encabez=false
end if
string docname, named
integer value,li_ret

value = GetFileSaveName("Exportar como", docname, named,"*.TXT",export) 
if value =1 then 
	if j='1' then
		 li_ret=uf_save_dw_as_excel(i_dw,docname)
		if li_ret = 1 then
			//success
			//...
		else
			//fail
			//...
		end if
	else
		i_dw.saveas(docname,exten,encabez)
	end if
	close(parent)
end if
end event

type rb_12 from radiobutton within w_export
integer x = 1426
integer y = 272
integer width = 343
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PDF"
end type

type rb_11 from radiobutton within w_export
integer x = 1426
integer y = 116
integer width = 370
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo XML"
end type

type cbx_1 from checkbox within w_export
integer x = 78
integer y = 484
integer width = 686
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Exportar con encabezados"
boolean checked = true
end type

type rb_10 from radiobutton within w_export
integer x = 1426
integer y = 192
integer width = 448
integer height = 72
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lotus123 (WKS)"
end type

type rb_9 from radiobutton within w_export
integer x = 576
integer y = 340
integer width = 649
integer height = 72
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Texto separado por TAB"
end type

type rb_8 from radiobutton within w_export
integer x = 1426
integer y = 340
integer width = 526
integer height = 72
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Insert de SQL (TXT)"
end type

type rb_7 from radiobutton within w_export
integer x = 96
integer y = 344
integer width = 379
integer height = 72
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo HTML"
end type

type rb_6 from radiobutton within w_export
integer x = 576
integer y = 272
integer width = 343
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Excel 8"
end type

type rb_5 from radiobutton within w_export
integer x = 96
integer y = 272
integer width = 343
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Excel Esp"
end type

type rb_4 from radiobutton within w_export
integer x = 576
integer y = 192
integer width = 343
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DBASE3"
end type

type rb_3 from radiobutton within w_export
integer x = 96
integer y = 192
integer width = 343
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DBASE2"
end type

type rb_2 from radiobutton within w_export
integer x = 576
integer y = 116
integer width = 878
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo separado por comas (CVS)"
boolean checked = true
end type

type rb_1 from radiobutton within w_export
integer x = 96
integer y = 116
integer width = 439
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Al portapapeles"
end type

type gb_1 from groupbox within w_export
integer x = 64
integer y = 36
integer width = 1906
integer height = 428
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Importar o Exportar Datos con Formato:"
end type

