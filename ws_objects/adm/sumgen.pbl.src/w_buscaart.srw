$PBExportHeader$w_buscaart.srw
forward
global type w_buscaart from window
end type
type pb_addcerrar from picturebutton within w_buscaart
end type
type pb_adicionar from picturebutton within w_buscaart
end type
type pb_cerrar from picturebutton within w_buscaart
end type
type st_3 from statictext within w_buscaart
end type
type rb_consumo from radiobutton within w_buscaart
end type
type rb_farma from radiobutton within w_buscaart
end type
type rb_actfijos from radiobutton within w_buscaart
end type
type rb_todos from radiobutton within w_buscaart
end type
type sle_1 from singlelineedit within w_buscaart
end type
type dw_articulos from datawindow within w_buscaart
end type
type rb_codigo from radiobutton within w_buscaart
end type
type rb_generico from radiobutton within w_buscaart
end type
type gb_1 from groupbox within w_buscaart
end type
type rb_comercial from radiobutton within w_buscaart
end type
type rb_codart from radiobutton within w_buscaart
end type
end forward

global type w_buscaart from window
integer width = 3538
integer height = 1212
boolean titlebar = true
string title = "Suministros - Buscar Articulo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "hardware.ico"
pb_addcerrar pb_addcerrar
pb_adicionar pb_adicionar
pb_cerrar pb_cerrar
st_3 st_3
rb_consumo rb_consumo
rb_farma rb_farma
rb_actfijos rb_actfijos
rb_todos rb_todos
sle_1 sle_1
dw_articulos dw_articulos
rb_codigo rb_codigo
rb_generico rb_generico
gb_1 gb_1
rb_comercial rb_comercial
rb_codart rb_codart
end type
global w_buscaart w_buscaart

type variables
singleLineEdit sle
end variables

on w_buscaart.create
this.pb_addcerrar=create pb_addcerrar
this.pb_adicionar=create pb_adicionar
this.pb_cerrar=create pb_cerrar
this.st_3=create st_3
this.rb_consumo=create rb_consumo
this.rb_farma=create rb_farma
this.rb_actfijos=create rb_actfijos
this.rb_todos=create rb_todos
this.sle_1=create sle_1
this.dw_articulos=create dw_articulos
this.rb_codigo=create rb_codigo
this.rb_generico=create rb_generico
this.gb_1=create gb_1
this.rb_comercial=create rb_comercial
this.rb_codart=create rb_codart
this.Control[]={this.pb_addcerrar,&
this.pb_adicionar,&
this.pb_cerrar,&
this.st_3,&
this.rb_consumo,&
this.rb_farma,&
this.rb_actfijos,&
this.rb_todos,&
this.sle_1,&
this.dw_articulos,&
this.rb_codigo,&
this.rb_generico,&
this.gb_1,&
this.rb_comercial,&
this.rb_codart}
end on

on w_buscaart.destroy
destroy(this.pb_addcerrar)
destroy(this.pb_adicionar)
destroy(this.pb_cerrar)
destroy(this.st_3)
destroy(this.rb_consumo)
destroy(this.rb_farma)
destroy(this.rb_actfijos)
destroy(this.rb_todos)
destroy(this.sle_1)
destroy(this.dw_articulos)
destroy(this.rb_codigo)
destroy(this.rb_generico)
destroy(this.gb_1)
destroy(this.rb_comercial)
destroy(this.rb_codart)
end on

event open;sle = Message.PowerObjectParm
dw_articulos.SetTransObject(SQLCA)
dw_articulos.Retrieve('%')
end event

type pb_addcerrar from picturebutton within w_buscaart
string tag = "Adicionar y Cerrar"
integer x = 1586
integer y = 948
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "anulardoc.gif"
alignment htextalign = left!
end type

event clicked;pb_adicionar.TriggerEvent(clicked!)
close(parent)
end event

type pb_adicionar from picturebutton within w_buscaart
string tag = "Adicionar"
integer x = 1755
integer y = 948
integer width = 146
integer height = 128
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
end type

event clicked;if dw_articulos.rowcount() < 1  then return

long i
string codigo[]

codigo[] = dw_articulos.Object.codarticulo.Selected
for i = 1 to UpperBound(codigo)	
	sle.Text = codigo[i]
	sle.TriggerEvent(modified!)
next

end event

type pb_cerrar from picturebutton within w_buscaart
string tag = "Cerrar"
integer x = 1422
integer y = 948
integer width = 146
integer height = 128
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type st_3 from statictext within w_buscaart
integer x = 2345
integer y = 28
integer width = 1056
integer height = 380
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Para seleccionar haga un clic sobre el articulo y se resaltará. Un clic sobre un artículo seleccionado, lo deselccionará. Doble clic lo adiciona directamente."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_consumo from radiobutton within w_buscaart
integer x = 1888
integer y = 356
integer width = 343
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
string text = "Consumo"
end type

event clicked;dw_articulos.SetFilter("sumarticulo_tipoarticulo = 'C'")
dw_articulos.Filter()

end event

type rb_farma from radiobutton within w_buscaart
integer x = 1888
integer y = 284
integer width = 343
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
string text = "Farmacia"
end type

event clicked;dw_articulos.SetFilter("sumarticulo_tipoarticulo = 'F'")
dw_articulos.Filter()

end event

type rb_actfijos from radiobutton within w_buscaart
integer x = 1888
integer y = 200
integer width = 421
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos Fijos"
end type

event clicked;dw_articulos.SetFilter("sumarticulo_tipoarticulo = 'A'")
dw_articulos.Filter()

end event

type rb_todos from radiobutton within w_buscaart
integer x = 1888
integer y = 124
integer width = 311
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;dw_articulos.SetFilter("")
dw_articulos.Filter()

end event

type sle_1 from singlelineedit within w_buscaart
event teclear pbm_keyup
integer x = 215
integer y = 300
integer width = 1298
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event teclear;string condicion
if match(trim(sle_1.text),"%$") = TRUE then
	condicion = "'" + trim(upper(sle_1.text)) + "'"
else
	condicion = "'" + trim(upper(sle_1.text)) + "%'"
end if

if rb_codigo.checked then
	dw_articulos.setfilter("upper(sumgenerico_codgenerico) like " + condicion)
elseif rb_generico.checked then
	dw_articulos.setfilter("upper(sumgenerico_descripcion) like " + condicion)
elseif rb_comercial.checked then
	dw_articulos.setfilter("upper(sumarticulo_marca) like " + condicion)
elseif rb_codart.checked then
	dw_articulos.setfilter("upper(codarticulo) like " + condicion)
end if

dw_articulos.filter()

end event

type dw_articulos from datawindow within w_buscaart
integer x = 69
integer y = 452
integer width = 3397
integer height = 440
integer taborder = 100
string title = "none"
string dataobject = "dw_articulos"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row = 0 then return
if this.isSelected(row) then
	this.SelectRow(row,false)
else
	this.SelectRow(row,true)
end if

end event

event doubleclicked;if row = 0 then return

this.SelectRow(row,true)
pb_adicionar.TriggerEvent(clicked!)
this.SelectRow(0,false)
end event

type rb_codigo from radiobutton within w_buscaart
integer x = 187
integer y = 168
integer width = 462
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Codigo Genérico"
boolean checked = true
end type

type rb_generico from radiobutton within w_buscaart
integer x = 667
integer y = 168
integer width = 384
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generico"
end type

type gb_1 from groupbox within w_buscaart
integer x = 87
integer y = 92
integer width = 1746
integer height = 324
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por:"
end type

type rb_comercial from radiobutton within w_buscaart
integer x = 997
integer y = 168
integer width = 375
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comercial"
end type

type rb_codart from radiobutton within w_buscaart
integer x = 1367
integer y = 168
integer width = 439
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Codigo Artículo"
end type

