$PBExportHeader$w_conf_pag.srw
forward
global type w_conf_pag from window
end type
type cbx_3 from checkbox within w_conf_pag
end type
type cb_3 from commandbutton within w_conf_pag
end type
type cb_1 from commandbutton within w_conf_pag
end type
type cbx_1 from checkbox within w_conf_pag
end type
type cb_4 from commandbutton within w_conf_pag
end type
type cb_2 from commandbutton within w_conf_pag
end type
type tab_1 from tab within w_conf_pag
end type
type tp_1 from userobject within tab_1
end type
type st_9 from statictext within tp_1
end type
type em_zoom from editmask within tp_1
end type
type st_8 from statictext within tp_1
end type
type sle_1 from singlelineedit within tp_1
end type
type rb_5 from radiobutton within tp_1
end type
type rb_4 from radiobutton within tp_1
end type
type st_7 from statictext within tp_1
end type
type em_1 from editmask within tp_1
end type
type cbx_2 from checkbox within tp_1
end type
type gb_1 from groupbox within tp_1
end type
type tp_1 from userobject within tab_1
st_9 st_9
em_zoom em_zoom
st_8 st_8
sle_1 sle_1
rb_5 rb_5
rb_4 rb_4
st_7 st_7
em_1 em_1
cbx_2 cbx_2
gb_1 gb_1
end type
type tabpage_1 from userobject within tab_1
end type
type rb_3 from radiobutton within tabpage_1
end type
type ddlb_1 from dropdownlistbox within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type rb_2 from radiobutton within tabpage_1
end type
type rb_1 from radiobutton within tabpage_1
end type
type p_2 from picture within tabpage_1
end type
type p_1 from picture within tabpage_1
end type
type tabpage_1 from userobject within tab_1
rb_3 rb_3
ddlb_1 ddlb_1
st_1 st_1
rb_2 rb_2
rb_1 rb_1
p_2 p_2
p_1 p_1
end type
type tabpage_2 from userobject within tab_1
end type
type em_tam from editmask within tabpage_2
end type
type st_10 from statictext within tabpage_2
end type
type em_der from editmask within tabpage_2
end type
type em_izq from editmask within tabpage_2
end type
type em_inf from editmask within tabpage_2
end type
type em_sup from editmask within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type st_5 from statictext within tabpage_2
end type
type st_4 from statictext within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type tabpage_2 from userobject within tab_1
em_tam em_tam
st_10 st_10
em_der em_der
em_izq em_izq
em_inf em_inf
em_sup em_sup
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
end type
type tab_1 from tab within w_conf_pag
tp_1 tp_1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_conf_pag from window
integer width = 1646
integer height = 1088
boolean titlebar = true
string title = "Configurar Página de Reporte"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "conf_pag.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
cbx_3 cbx_3
cb_3 cb_3
cb_1 cb_1
cbx_1 cbx_1
cb_4 cb_4
cb_2 cb_2
tab_1 tab_1
end type
global w_conf_pag w_conf_pag

type variables
uo_report i_rep
end variables

on w_conf_pag.create
this.cbx_3=create cbx_3
this.cb_3=create cb_3
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.cb_4=create cb_4
this.cb_2=create cb_2
this.tab_1=create tab_1
this.Control[]={this.cbx_3,&
this.cb_3,&
this.cb_1,&
this.cbx_1,&
this.cb_4,&
this.cb_2,&
this.tab_1}
end on

on w_conf_pag.destroy
destroy(this.cbx_3)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.tab_1)
end on

event open;i_rep=message.powerobjectparm
tab_1.tp_1.em_1.text=string(i_rep.num_cop)
tab_1.tp_1.cbx_2.checked=i_rep.v_preliminar
tab_1.tp_1.em_zoom.visible=i_rep.v_preliminar
tab_1.tp_1.st_9.visible=i_rep.v_preliminar
cbx_3.enabled=i_rep.cambiar_prop 
cbx_1.checked=i_rep.dialogo
tab_1.tp_1.em_zoom.text=string(i_rep.zoom)
tab_1.tabpage_2.em_tam.text=string(i_rep.tam_imp)
if i_rep.dw_rep.describe('datawindow.sintax')<>'' then
	choose case i_rep.dw_rep.describe('datawindow.print.paper.size')
		case '0'
			tab_1.tabpage_1.ddlb_1.selectitem(1)
		case '1'
			tab_1.tabpage_1.ddlb_1.selectitem(2)
		case '5'
			tab_1.tabpage_1.ddlb_1.selectitem(3)
		case '9'
			tab_1.tabpage_1.ddlb_1.selectitem(4)
		case '6'
			tab_1.tabpage_1.ddlb_1.selectitem(5)
	end choose 
	choose case i_rep.dw_rep.describe('datawindow.print.orientation')
		case '0'
			tab_1.tabpage_1.rb_3.checked=true
		case '1'//horizontal - landscape
			tab_1.tabpage_1.rb_1.checked=true
		case '2'//vertical - portrait
			tab_1.tabpage_1.rb_2.checked=true
	end choose
	tab_1.tabpage_2.em_sup.text=string(real(i_rep.dw_rep.describe("datawindow.print.margin.top"))*i_rep.factor_umed)
	tab_1.tabpage_2.em_inf.text=string(real(i_rep.dw_rep.describe("datawindow.print.margin.bottom"))*i_rep.factor_umed)
	tab_1.tabpage_2.em_izq.text=string(real(i_rep.dw_rep.describe("datawindow.print.margin.left"))*i_rep.factor_umed)
	tab_1.tabpage_2.em_der.text=string(real(i_rep.dw_rep.describe("datawindow.print.margin.right"))*i_rep.factor_umed)
else
	cb_3.enabled=false
	tab_1.tp_1.em_zoom.enabled=false
end if
if i_rep.v_preliminar then
	cb_3.text='&Vista Prelim.'
else
	cb_3.text='&Imprimir'
end if
if i_rep.dw_rep.rowcount()=0 then 
	cb_3.enabled=false
end if
if parentwindow().getactivesheet()=w_reporte_gral then
	tab_1.tp_1.cbx_2.checked=true
	tab_1.tp_1.cbx_2.enabled=false
	tab_1.tp_1.cbx_2.triggerevent(clicked!)
end if
tab_1.tp_1.sle_1.text=i_rep.dw_rep.describe("datawindow.print.page.range")
if tab_1.tp_1.sle_1.text<>'' then tab_1.tp_1.rb_5.checked=true
if i_rep.tipo_rep='externo!' then cbx_1.enabled=false

end event

type cbx_3 from checkbox within w_conf_pag
integer x = 37
integer y = 796
integer width = 1285
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Guardar Cambios Definitivamente en la Base de Datos"
end type

type cb_3 from commandbutton within w_conf_pag
integer x = 274
integer y = 868
integer width = 320
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Imprimir"
boolean default = true
end type

event clicked;cb_1.triggerevent(clicked!)
if tab_1.tp_1.cbx_2.checked then
	f_abrir_rep_gral(i_rep)
else
	i_rep.dw_rep.print()
end if
close(parent)
end event

type cb_1 from commandbutton within w_conf_pag
integer x = 1006
integer y = 868
integer width = 320
integer height = 92
integer taborder = 50
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "&Aplicar"
end type

event clicked;i_rep.dialogo=cbx_1.checked
i_rep.num_cop=long(tab_1.tp_1.em_1.text)
i_rep.v_preliminar=tab_1.tp_1.cbx_2.checked
i_rep.zoom=long(tab_1.tp_1.em_zoom.text)
i_rep.tam_imp=long(tab_1.tabpage_2.em_tam.text)
i_rep.mar_sup=dec(tab_1.tabpage_2.em_sup.text)
i_rep.mar_inf=dec(tab_1.tabpage_2.em_inf.text)
i_rep.mar_izq=dec(tab_1.tabpage_2.em_izq.text)
i_rep.mar_der=dec(tab_1.tabpage_2.em_der.text)
if tab_1.tabpage_1.rb_3.checked then i_rep.orienta='0'
if tab_1.tabpage_1.rb_1.checked then 
	i_rep.orienta='1'
else
	i_rep.orienta='2'
end if
choose case tab_1.tabpage_1.ddlb_1.text
	case 'Predeterminado Impresora'
		i_rep.tam_papel='0'
	case 'Carta'
		i_rep.tam_papel='1'
	case 'Oficio'
		i_rep.tam_papel='5'
	case 'A4'
		i_rep.tam_papel='9'
	case 'Media Carta Vertical'
		i_rep.tam_papel='6'
end choose 
if cbx_3.checked then i_rep.f_guarda_prop()
if i_rep.dw_rep.describe('datawindow.sintax')<>'' then
	if tab_1.tp_1.rb_4.checked then
		i_rep.dw_rep.modify("datawindow.print.page.range=''")
	else
		i_rep.dw_rep.modify("datawindow.print.page.range='"+tab_1.tp_1.sle_1.text+"'")
	end if
	i_rep.f_aplica_prop()
	if not isvalid(w_conf_pag.parentwindow().getactivesheet()) then return
	if w_conf_pag.parentwindow().getactivesheet()=w_reporte_gral then
		datawindow dw_t
		if w_reporte_gral.i_tipodw='7' then
			dw_t=w_reporte_gral.dw_rte
		else
			dw_t=w_reporte_gral.dw_rep
		end if
		w_reporte_gral.em_2.text=string(i_rep.zoom)
		w_reporte_gral.em_2.triggerevent(modified!)
		w_reporte_gral.em_1.text=string(i_rep.tam_imp)
		w_reporte_gral.em_1.triggerevent(modified!)
		w_reporte_gral.em_3.text=string(i_rep.num_cop)
		w_reporte_gral.em_3.triggerevent(modified!)
		if tab_1.tp_1.rb_4.checked then
			w_reporte_gral.sle_4.text=''
		else
			w_reporte_gral.sle_4.text=tab_1.tp_1.sle_1.text
		end if
		w_reporte_gral.sle_4.triggerevent(modified!)
		dw_t.modify("datawindow.print.margin.left="+string(int(i_rep.mar_izq/i_rep.factor_umed)))
		dw_t.modify("datawindow.print.margin.right="+string(int(i_rep.mar_der/i_rep.factor_umed)))
		dw_t.modify("datawindow.print.margin.top="+string(int(i_rep.mar_sup/i_rep.factor_umed)))
		dw_t.modify("datawindow.print.margin.bottom="+string(int(i_rep.mar_inf/i_rep.factor_umed)))
		dw_t.modify('datawindow.print.paper.size='+i_rep.tam_papel)	
		dw_t.modify('datawindow.print.orientation='+i_rep.orienta)
	end if
end if

end event

type cbx_1 from checkbox within w_conf_pag
integer x = 37
integer y = 732
integer width = 1015
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar estas Opciones antes de Imprimir"
end type

type cb_4 from commandbutton within w_conf_pag
integer x = 640
integer y = 868
integer width = 320
integer height = 92
integer taborder = 40
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_2 from commandbutton within w_conf_pag
integer x = 1211
integer y = 196
integer width = 366
integer height = 88
integer taborder = 30
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "&Impresora"
end type

event clicked;printsetup()
end event

type tab_1 from tab within w_conf_pag
integer x = 27
integer y = 28
integer width = 1568
integer height = 700
integer taborder = 10
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tp_1,&
this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 1531
integer height = 580
long backcolor = 67108864
string text = "Opciones"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_9 st_9
em_zoom em_zoom
st_8 st_8
sle_1 sle_1
rb_5 rb_5
rb_4 rb_4
st_7 st_7
em_1 em_1
cbx_2 cbx_2
gb_1 gb_1
end type

on tp_1.create
this.st_9=create st_9
this.em_zoom=create em_zoom
this.st_8=create st_8
this.sle_1=create sle_1
this.rb_5=create rb_5
this.rb_4=create rb_4
this.st_7=create st_7
this.em_1=create em_1
this.cbx_2=create cbx_2
this.gb_1=create gb_1
this.Control[]={this.st_9,&
this.em_zoom,&
this.st_8,&
this.sle_1,&
this.rb_5,&
this.rb_4,&
this.st_7,&
this.em_1,&
this.cbx_2,&
this.gb_1}
end on

on tp_1.destroy
destroy(this.st_9)
destroy(this.em_zoom)
destroy(this.st_8)
destroy(this.sle_1)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.st_7)
destroy(this.em_1)
destroy(this.cbx_2)
destroy(this.gb_1)
end on

type st_9 from statictext within tp_1
integer x = 617
integer y = 72
integer width = 183
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Zoom"
boolean focusrectangle = false
end type

type em_zoom from editmask within tp_1
integer x = 818
integer y = 64
integer width = 238
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "10~~150"
end type

type st_8 from statictext within tp_1
integer x = 69
integer y = 416
integer width = 983
integer height = 116
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Escriba Números de Páginas o Intervalos Separados por comas. Ejemplo: 1,3,5-7,10"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within tp_1
integer x = 338
integer y = 312
integer width = 695
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_5 from radiobutton within tp_1
integer x = 69
integer y = 320
integer width = 265
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Páginas"
end type

type rb_4 from radiobutton within tp_1
integer x = 69
integer y = 252
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
string text = "Todo"
boolean checked = true
end type

type st_7 from statictext within tp_1
integer x = 1093
integer y = 248
integer width = 256
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nro Copias:"
boolean focusrectangle = false
end type

type em_1 from editmask within tp_1
integer x = 1088
integer y = 316
integer width = 206
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~10"
end type

type cbx_2 from checkbox within tp_1
integer x = 50
integer y = 64
integer width = 411
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vista Preliminar"
boolean lefttext = true
end type

event clicked;if checked then
	cb_3.text='&Vista Prelim.'
else
	cb_3.text='&Imprimir'
end if
em_zoom.visible=checked
st_9.visible=checked
end event

type gb_1 from groupbox within tp_1
integer x = 46
integer y = 192
integer width = 1019
integer height = 352
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Intervalo de Páginas"
end type

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 1531
integer height = 580
string dragicon = "none!"
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Página"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
rb_3 rb_3
ddlb_1 ddlb_1
st_1 st_1
rb_2 rb_2
rb_1 rb_1
p_2 p_2
p_1 p_1
end type

on tabpage_1.create
this.rb_3=create rb_3
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.p_2=create p_2
this.p_1=create p_1
this.Control[]={this.rb_3,&
this.ddlb_1,&
this.st_1,&
this.rb_2,&
this.rb_1,&
this.p_2,&
this.p_1}
end on

on tabpage_1.destroy
destroy(this.rb_3)
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.p_2)
destroy(this.p_1)
end on

type rb_3 from radiobutton within tabpage_1
integer x = 27
integer y = 172
integer width = 667
integer height = 72
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Predeterminada Impresora"
end type

type ddlb_1 from dropdownlistbox within tabpage_1
integer x = 466
integer y = 280
integer width = 613
integer height = 428
integer taborder = 30
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "none"
boolean sorted = false
string item[] = {"Predeterminado Impresora","Carta","Oficio","A4","Media Carta Vertical"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within tabpage_1
integer x = 50
integer y = 280
integer width = 425
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Tamaño del Papel"
boolean focusrectangle = false
end type

type rb_2 from radiobutton within tabpage_1
integer x = 818
integer y = 52
integer width = 343
integer height = 72
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Vertical"
end type

type rb_1 from radiobutton within tabpage_1
integer x = 265
integer y = 52
integer width = 343
integer height = 72
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Horizontal"
boolean checked = true
end type

type p_2 from picture within tabpage_1
integer x = 695
integer y = 32
integer width = 114
integer height = 100
string dragicon = "none!"
string pointer = "Arrow!"
boolean originalsize = true
string picturename = "vertical.GIF"
boolean focusrectangle = false
end type

type p_1 from picture within tabpage_1
integer x = 133
integer y = 28
integer width = 114
integer height = 100
string dragicon = "none!"
string pointer = "Arrow!"
boolean originalsize = true
string picturename = "horizontal.gif"
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 1531
integer height = 580
string dragicon = "none!"
long backcolor = 67108864
string pointer = "Arrow!"
string text = "     Márgenes         "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
em_tam em_tam
st_10 st_10
em_der em_der
em_izq em_izq
em_inf em_inf
em_sup em_sup
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
end type

on tabpage_2.create
this.em_tam=create em_tam
this.st_10=create st_10
this.em_der=create em_der
this.em_izq=create em_izq
this.em_inf=create em_inf
this.em_sup=create em_sup
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.Control[]={this.em_tam,&
this.st_10,&
this.em_der,&
this.em_izq,&
this.em_inf,&
this.em_sup,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3}
end on

on tabpage_2.destroy
destroy(this.em_tam)
destroy(this.st_10)
destroy(this.em_der)
destroy(this.em_izq)
destroy(this.em_inf)
destroy(this.em_sup)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
end on

type em_tam from editmask within tabpage_2
integer x = 201
integer y = 364
integer width = 242
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "10~~200"
end type

type st_10 from statictext within tabpage_2
integer y = 372
integer width = 201
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tamaño"
boolean focusrectangle = false
end type

type em_der from editmask within tabpage_2
integer x = 823
integer y = 200
integer width = 311
integer height = 84
integer taborder = 40
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "##.00"
boolean spin = true
double increment = 1
string minmax = "1~~10"
end type

type em_izq from editmask within tabpage_2
integer x = 210
integer y = 196
integer width = 311
integer height = 84
integer taborder = 40
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "##.00"
boolean spin = true
double increment = 1
string minmax = "1~~10"
end type

type em_inf from editmask within tabpage_2
integer x = 827
integer y = 60
integer width = 311
integer height = 84
integer taborder = 30
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "##.00"
boolean spin = true
double increment = 1
string minmax = "1~~10"
end type

type em_sup from editmask within tabpage_2
integer x = 206
integer y = 52
integer width = 311
integer height = 84
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "##.00"
boolean spin = true
double increment = 1
string minmax = "1~~10"
end type

type st_6 from statictext within tabpage_2
integer x = 626
integer y = 212
integer width = 187
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Derecha"
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_2
integer y = 216
integer width = 251
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "I&zquierda"
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_2
integer x = 631
integer y = 72
integer width = 215
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Inferior"
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_2
integer y = 68
integer width = 343
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Superior"
boolean focusrectangle = false
end type

