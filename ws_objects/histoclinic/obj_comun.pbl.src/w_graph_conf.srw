$PBExportHeader$w_graph_conf.srw
forward
global type w_graph_conf from window
end type
type cbx_1 from checkbox within w_graph_conf
end type
type cb_2 from commandbutton within w_graph_conf
end type
type cb_1 from commandbutton within w_graph_conf
end type
type ddplb_3 from dropdownpicturelistbox within w_graph_conf
end type
type st_2 from statictext within w_graph_conf
end type
type st_1 from statictext within w_graph_conf
end type
type ddplb_2 from dropdownpicturelistbox within w_graph_conf
end type
type ddplb_1 from dropdownpicturelistbox within w_graph_conf
end type
end forward

global type w_graph_conf from window
integer width = 1659
integer height = 980
boolean titlebar = true
string title = "Parámetros de Graficación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "campos.ico"
boolean center = true
cbx_1 cbx_1
cb_2 cb_2
cb_1 cb_1
ddplb_3 ddplb_3
st_2 st_2
st_1 st_1
ddplb_2 ddplb_2
ddplb_1 ddplb_1
end type
global w_graph_conf w_graph_conf

type variables
datawindow dw_obj
end variables

forward prototypes
public function integer checkfields (string campos, dropdownpicturelistbox ddplb)
end prototypes

public function integer checkfields (string campos, dropdownpicturelistbox ddplb);string pedazo, completo
long posic

completo = campos

do while TRUE
	posic = pos(completo, ',')
	if posic > 0 then
		pedazo = trim(left(completo, posic - 1))
		completo = mid(completo,posic + 1)
	else
		pedazo = trim(completo)
		completo = ''
	end if
	if ddplb.FindItem(pedazo,0) = -1 then Return -1
	if completo = '' then Return 0
loop

Return 0

end function

event open;long i = 1
string campo, tipo, agregate

dw_obj = message.PowerObjectParm

campo = dw_obj.describe("#" + string(i) + ".Name")
tipo = dw_obj.describe("#" + string(i) + ".ColType")
do while campo <> '!'
	agregate = ''
	choose case left(lower(tipo),4)
		case 'char', 'date', 'time', 'time'
			agregate = 'count(' + campo + ' for graph)'
		case 'deci', 'int', 'long', 'numb', 'real', 'ulon'
			agregate = 'sum(' + campo + ' for graph)'
	end choose
	ddplb_1.AddItem(campo)
	ddplb_2.AddItem(campo)
	ddplb_3.AddItem(campo)
	if agregate <> '' then
		ddplb_1.AddItem(agregate)
		ddplb_2.AddItem(agregate)
		ddplb_3.AddItem(agregate)
	end if
	i = i + 1
	campo = dw_obj.describe("#" + string(i) + ".Name")
	tipo = dw_obj.describe("#" + string(i) + ".ColType")
loop

ddplb_1.text = string(dw_obj.Object.gr_1.category)
ddplb_2.text = string(dw_obj.Object.gr_1.values)
if string(dw_obj.Object.gr_1.series) <> '?' and string(dw_obj.Object.gr_1.series) <> '0'then
	cbx_1.checked = TRUE
	ddplb_3.text = string(dw_obj.Object.gr_1.series)
else
	cbx_1.checked = FALSE
end if

end event

on w_graph_conf.create
this.cbx_1=create cbx_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ddplb_3=create ddplb_3
this.st_2=create st_2
this.st_1=create st_1
this.ddplb_2=create ddplb_2
this.ddplb_1=create ddplb_1
this.Control[]={this.cbx_1,&
this.cb_2,&
this.cb_1,&
this.ddplb_3,&
this.st_2,&
this.st_1,&
this.ddplb_2,&
this.ddplb_1}
end on

on w_graph_conf.destroy
destroy(this.cbx_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ddplb_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddplb_2)
destroy(this.ddplb_1)
end on

type cbx_1 from checkbox within w_graph_conf
integer x = 274
integer y = 420
integer width = 343
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Series"
end type

event clicked;if this.checked = TRUE then
	ddplb_3.Enabled = TRUE
else
	ddplb_3.Enabled = FALSE
end if

end event

type cb_2 from commandbutton within w_graph_conf
integer x = 933
integer y = 680
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_graph_conf
integer x = 279
integer y = 680
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if checkFields(ddplb_1.text, ddplb_1) = -1 then
	messageBox('Error', 'Los valores dados para categorias no son de la lista')
	Return
elseif  checkFields(ddplb_2.text, ddplb_2) = -1 then
	messageBox('Error', 'Los valores dados para los valores no son de la lista')
	Return
end if

dw_obj.Object.gr_1.category = ddplb_1.text
dw_obj.Object.gr_1.values = ddplb_2.text
if cbx_1.checked = TRUE then
	if checkFields(ddplb_3.text, ddplb_3) = -1 then
		messageBox('Error', 'Los valores dados para categorias no son de la lista')
		Return
	end if
	dw_obj.Object.gr_1.series = ddplb_3.text
else
	if dw_obj.Object.gr_1.series <> '?' then
		dw_obj.Object.gr_1.series = '0'
	end if
end if
close(parent)

end event

type ddplb_3 from dropdownpicturelistbox within w_graph_conf
integer x = 274
integer y = 504
integer width = 1001
integer height = 416
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

type st_2 from statictext within w_graph_conf
integer x = 274
integer y = 236
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valores"
boolean focusrectangle = false
end type

type st_1 from statictext within w_graph_conf
integer x = 274
integer y = 52
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Categoría"
boolean focusrectangle = false
end type

type ddplb_2 from dropdownpicturelistbox within w_graph_conf
integer x = 274
integer y = 300
integer width = 1001
integer height = 416
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

type ddplb_1 from dropdownpicturelistbox within w_graph_conf
integer x = 274
integer y = 116
integer width = 1001
integer height = 416
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

