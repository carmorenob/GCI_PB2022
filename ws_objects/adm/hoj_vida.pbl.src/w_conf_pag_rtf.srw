$PBExportHeader$w_conf_pag_rtf.srw
forward
global type w_conf_pag_rtf from window
end type
type cb_4 from commandbutton within w_conf_pag_rtf
end type
type cb_3 from commandbutton within w_conf_pag_rtf
end type
type cb_2 from commandbutton within w_conf_pag_rtf
end type
type cb_1 from commandbutton within w_conf_pag_rtf
end type
type tab_1 from tab within w_conf_pag_rtf
end type
type tabpage_1 from userobject within tab_1
end type
type rb_3 from radiobutton within tabpage_1
end type
type ddlb_2 from dropdownlistbox within tabpage_1
end type
type ddlb_1 from dropdownlistbox within tabpage_1
end type
type st_2 from statictext within tabpage_1
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
ddlb_2 ddlb_2
ddlb_1 ddlb_1
st_2 st_2
st_1 st_1
rb_2 rb_2
rb_1 rb_1
p_2 p_2
p_1 p_1
end type
type tabpage_2 from userobject within tab_1
end type
type st_9 from statictext within tabpage_2
end type
type ddlb_3 from dropdownlistbox within tabpage_2
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
st_9 st_9
ddlb_3 ddlb_3
em_der em_der
em_izq em_izq
em_inf em_inf
em_sup em_sup
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
end type
type tab_1 from tab within w_conf_pag_rtf
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_conf_pag_rtf from window
integer width = 1646
integer height = 992
boolean titlebar = true
string title = "Configurar Página"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "contrato.ico"
string pointer = "Arrow!"
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
tab_1 tab_1
end type
global w_conf_pag_rtf w_conf_pag_rtf

type variables
int fuepap=0,tampap=0,calimp=0,orientacion=0
real marsup,marinf,margder,margizq
end variables

on w_conf_pag_rtf.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.tab_1=create tab_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.tab_1}
end on

on w_conf_pag_rtf.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.tab_1)
end on

event open;this.x=(ancho/2)-this.width/2
this.y=(alto/2)-this.height/2
choose case tampap
	case 0
		tab_1.tabpage_1.ddlb_1.selectitem(1)
	case 1
		tab_1.tabpage_1.ddlb_1.selectitem(2)
	case 5
		tab_1.tabpage_1.ddlb_1.selectitem(3)
	case 9
		tab_1.tabpage_1.ddlb_1.selectitem(4)
end choose 
choose case fuepap
	case 0
		tab_1.tabpage_1.ddlb_2.selectitem(1)
	case 4
		tab_1.tabpage_1.ddlb_2.selectitem(2)
	case 8
		tab_1.tabpage_1.ddlb_2.selectitem(3)
	case 7
		tab_1.tabpage_1.ddlb_2.selectitem(4)
end choose
choose case calimp
	case 0
		tab_1.tabpage_2.ddlb_3.selectitem(1)
	case 1
		tab_1.tabpage_2.ddlb_3.selectitem(2)
	case 2
		tab_1.tabpage_2.ddlb_3.selectitem(3)
	case 3
		tab_1.tabpage_2.ddlb_3.selectitem(4)
	case 4
		tab_1.tabpage_2.ddlb_3.selectitem(5)
end choose
choose case orientacion 
	case 0
		tab_1.tabpage_1.rb_3.checked=true
	case 1
		tab_1.tabpage_1.rb_1.checked=true
	case 2
		tab_1.tabpage_1.rb_3.checked=true
end choose
if isvalid(w_rte) then
	real marg 
	marg=real(w_rte.rte_1.TopMargin )/1000
	if marg <> marsup then marsup=marg
	marg=real(w_rte.rte_1.BottomMargin )/1000
	if marg <> marinf then marinf=marg
	marg=real(w_rte.rte_1.leftMargin )/1000
	if marg <> margizq then margizq=marg
	marg=real(w_rte.rte_1.rightMargin )/1000
	if marg <> margder then margder=marg
end if	
tab_1.tabpage_2.em_sup.text=string(marsup)
tab_1.tabpage_2.em_inf.text=string(marinf)
tab_1.tabpage_2.em_izq.text=string(margizq)
tab_1.tabpage_2.em_der.text=string(margder)
		
end event

type cb_4 from commandbutton within w_conf_pag_rtf
integer x = 754
integer y = 744
integer width = 402
integer height = 112
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

type cb_3 from commandbutton within w_conf_pag_rtf
integer x = 315
integer y = 744
integer width = 402
integer height = 112
integer taborder = 40
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "&Aceptar"
boolean default = true
end type

event clicked;//if isvalid(w_rte) then 
//	tab_1.tabpage_1.ddlb_1.selectitem
	w_rte.rte_1.TopMargin= real(tab_1.tabpage_2.em_sup.text)*1000
	w_rte.rte_1.BottomMargin= real(tab_1.tabpage_2.em_inf.text)*1000
	w_rte.rte_1.leftMargin=real(tab_1.tabpage_2.em_izq.text)*1000
	w_rte.rte_1.rightMargin =real(tab_1.tabpage_2.em_der.text)*1000
	
close(parent)

end event

type cb_2 from commandbutton within w_conf_pag_rtf
integer x = 1166
integer y = 340
integer width = 402
integer height = 112
integer taborder = 30
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "&Opciones"
end type

event clicked;printsetup()
end event

type cb_1 from commandbutton within w_conf_pag_rtf
integer x = 1170
integer y = 220
integer width = 402
integer height = 112
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "&Imprimir"
end type

event clicked;if isvalid(w_rte) then 
//	w_reporte.inicialize()
//	w_reporte.dw_rep.print()
	Return w_rte.rte_1.print(1, "", True, True)
end if
close(parent)
end event

type tab_1 from tab within w_conf_pag_rtf
integer x = 32
integer y = 32
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
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

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
ddlb_2 ddlb_2
ddlb_1 ddlb_1
st_2 st_2
st_1 st_1
rb_2 rb_2
rb_1 rb_1
p_2 p_2
p_1 p_1
end type

on tabpage_1.create
this.rb_3=create rb_3
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.st_2=create st_2
this.st_1=create st_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.p_2=create p_2
this.p_1=create p_1
this.Control[]={this.rb_3,&
this.ddlb_2,&
this.ddlb_1,&
this.st_2,&
this.st_1,&
this.rb_2,&
this.rb_1,&
this.p_2,&
this.p_1}
end on

on tabpage_1.destroy
destroy(this.rb_3)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.p_2)
destroy(this.p_1)
end on

type rb_3 from radiobutton within tabpage_1
integer x = 27
integer y = 196
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

event clicked;if this.checked then orientacion=0
end event

type ddlb_2 from dropdownlistbox within tabpage_1
integer x = 471
integer y = 416
integer width = 603
integer height = 384
integer taborder = 40
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
string item[] = {"Predeterminada Impresora","Manual","Tractor","Automático"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text
	case "Predeterminada Impresora"
		fuepap=0
	case "Manual"
		fuepap=5
	case "Tractor"
		fuepap=8
	case "Automático"
		fuepap=7
end choose
end event

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
string item[] = {"Predeterminado Impresora","Carta","Oficio","A4"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text
	case "Predeterminado Impresora"
		tampap =0
	case "Carta"
		tampap =1
	case "Oficio"
		tampap =5
	case "A4"
		tampap =9
end choose
end event

type st_2 from statictext within tabpage_1
integer x = 46
integer y = 432
integer width = 407
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
string text = "&Fuente de papel:"
boolean focusrectangle = false
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

event clicked;if this.checked then orientacion=2
end event

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

event clicked;if this.checked then orientacion=1
end event

type p_2 from picture within tabpage_1
integer x = 695
integer y = 12
integer width = 114
integer height = 100
string dragicon = "none!"
string pointer = "Arrow!"
boolean originalsize = true
string picturename = "vertical.gif"
boolean focusrectangle = false
end type

type p_1 from picture within tabpage_1
integer x = 105
integer y = 28
integer width = 142
integer height = 92
string dragicon = "none!"
string pointer = "Arrow!"
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
st_9 st_9
ddlb_3 ddlb_3
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
this.st_9=create st_9
this.ddlb_3=create ddlb_3
this.em_der=create em_der
this.em_izq=create em_izq
this.em_inf=create em_inf
this.em_sup=create em_sup
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.Control[]={this.st_9,&
this.ddlb_3,&
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
destroy(this.st_9)
destroy(this.ddlb_3)
destroy(this.em_der)
destroy(this.em_izq)
destroy(this.em_inf)
destroy(this.em_sup)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
end on

event dragdrop;margizq=real(this.text)
end event

type st_9 from statictext within tabpage_2
integer x = 133
integer y = 424
integer width = 393
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
string text = "Calidad Impresión"
boolean focusrectangle = false
end type

type ddlb_3 from dropdownlistbox within tabpage_2
integer x = 549
integer y = 416
integer width = 475
integer height = 408
integer taborder = 50
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
string item[] = {"Predeterminada","Alta","Baja","Media","Borrador"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text
	case "Predeterminada"
		calimp=0
	case "Alta"
		calimp=1
	case "Baja"
		calimp=2
	case "Media"
		calimp=3
	case "Borrador"
		calimp=4
end choose
		
end event

type em_der from editmask within tabpage_2
integer x = 759
integer y = 200
integer width = 343
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
string mask = "##.##"
boolean spin = true
double increment = 1
string minmax = "1~~10"
end type

event modified;margder=real(this.text)
end event

type em_izq from editmask within tabpage_2
integer x = 210
integer y = 196
integer width = 343
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
string mask = "##.##"
boolean spin = true
double increment = 1
string minmax = "1~~10"
end type

event modified;margizq=real(this.text)
end event

type em_inf from editmask within tabpage_2
integer x = 763
integer y = 60
integer width = 343
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
string mask = "##.##"
boolean spin = true
double increment = 1
string minmax = "1~~10"
end type

event modified;marinf=real(this.text)
end event

type em_sup from editmask within tabpage_2
integer x = 206
integer y = 52
integer width = 343
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
string mask = "##.##"
boolean spin = true
double increment = 1
string minmax = "1~~10"
end type

event modified;marsup=real(this.text)
end event

type st_6 from statictext within tabpage_2
integer x = 553
integer y = 212
integer width = 178
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
integer x = 571
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

