$PBExportHeader$w_clientes.srw
forward
global type w_clientes from window
end type
type dw_5 from datawindow within w_clientes
end type
type tab_1 from tab within w_clientes
end type
type tabpage_1 from userobject within tab_1
end type
type cb_7 from commandbutton within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_7 cb_7
cb_1 cb_1
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_2
end type
type cb_6 from commandbutton within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_3 dw_3
cb_6 cb_6
cb_3 cb_3
cb_2 cb_2
dw_2 dw_2
end type
type tab_1 from tab within w_clientes
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_clientes from window
integer width = 3442
integer height = 2356
boolean titlebar = true
string title = "Registro de Clientes -GCI-"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
dw_5 dw_5
tab_1 tab_1
end type
global w_clientes w_clientes

type variables
string version
long licencias,aplicacion,nuevo,nro
DataWindowChild ciudad
end variables

on w_clientes.create
this.dw_5=create dw_5
this.tab_1=create tab_1
this.Control[]={this.dw_5,&
this.tab_1}
end on

on w_clientes.destroy
destroy(this.dw_5)
destroy(this.tab_1)
end on

event open;tab_1.tabpage_1.dw_1.settransobject(sqlca)
tab_1.tabpage_1.dw_1.GetChild('ciudad', ciudad)
ciudad.settransobject(SQLCA)
ciudad.retrieve()
tab_1.tabpage_2.dw_2.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_5.retrieve()
nuevo=0
end event

type dw_5 from datawindow within w_clientes
integer x = 32
integer y = 8
integer width = 3310
integer height = 484
integer taborder = 40
string title = "none"
string dataobject = "dw_regla_cliente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow<1 then return
nro=this.getitemnumber(currentrow,'numero')
tab_1.tabpage_1.dw_1.retrieve(nro)
tab_1.tabpage_2.dw_2.reset()
tab_1.tabpage_2.dw_3.reset()
tab_1.tabpage_2.dw_2.retrieve(nro)

end event

type tab_1 from tab within w_clientes
integer x = 18
integer y = 504
integer width = 3355
integer height = 1724
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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
integer width = 3319
integer height = 1604
long backcolor = 67108864
string text = "Cliente"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_7 cb_7
cb_1 cb_1
dw_1 dw_1
end type

on tabpage_1.create
this.cb_7=create cb_7
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_7,&
this.cb_1,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.cb_7)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_7 from commandbutton within tabpage_1
integer x = 2693
integer y = 188
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;dw_1.reset()
dw_1.insertrow(1)
dw_1.setitem(1,'numero',dw_5.rowcount() +1 )
this.enabled=false
end event

type cb_1 from commandbutton within tabpage_1
integer x = 2693
integer y = 340
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar"
end type

event clicked;if dw_1.update()<1 then
	rollback;
else
	commit;
	cb_7.enabled=true
	long cual
	cual=dw_1.getitemnumber(1,'numero')
	dw_5.retrieve()
	dw_5.scrolltorow(cual)
end if

end event

type dw_1 from datawindow within tabpage_1
integer x = 110
integer y = 132
integer width = 2496
integer height = 1256
integer taborder = 20
string title = "none"
string dataobject = "dw_clientes"
boolean border = false
boolean livescroll = true
end type

event retrieveend;string depto
numero=tab_1.tabpage_1.dw_1.getitemnumber(tab_1.tabpage_1.dw_1.getrow(),1)
tab_1.tabpage_2.dw_2.retrieve(this.getitemnumber(this.getrow(),1))
depto=tab_1.tabpage_1.dw_1.getitemstring(this.getrow(),"departamento")
if isnull(depto) then depto=''
ciudad.setfilter("cdepto='"+depto+"'")
ciudad.filter()

end event

event itemchanged;this.accepttext()
string depto
this.accepttext()
if this.getcolumnname()="departamento" then
	depto=tab_1.tabpage_1.dw_1.getitemstring(this.getrow(),"departamento")
	ciudad.setfilter("cdepto='"+depto+"'")
	ciudad.filter()
	tab_1.tabpage_1.dw_1.setitem(1,"ciudad","")
end if

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3319
integer height = 1604
long backcolor = 67108864
string text = "Licencias"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_3 dw_3
cb_6 cb_6
cb_3 cb_3
cb_2 cb_2
dw_2 dw_2
end type

on tabpage_2.create
this.dw_3=create dw_3
this.cb_6=create cb_6
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_2=create dw_2
this.Control[]={this.dw_3,&
this.cb_6,&
this.cb_3,&
this.cb_2,&
this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_3)
destroy(this.cb_6)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_2)
end on

type dw_3 from datawindow within tabpage_2
integer x = 14
integer y = 420
integer width = 2857
integer height = 1168
integer taborder = 50
string title = "none"
string dataobject = "dw_det_lice"
boolean border = false
boolean livescroll = true
end type

event constructor;THIS.SETTRANSOBJECT(SQLCA)
end event

event itemchanged;accepttext()
dw_3.setitem(dw_3.getrow(),'clave',dw_3.getitemstring(dw_3.getrow(),'llave'))
end event

type cb_6 from commandbutton within tabpage_2
integer x = 2894
integer y = 172
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;//open(w_rte)
end event

type cb_3 from commandbutton within tabpage_2
integer x = 2889
integer y = 320
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar"
end type

event clicked;if tab_1.tabpage_2.dw_3.update()<1 then
	rollback;
else
	commit;
	long cual
	cual=dw_3.getitemnumber(1,'consec')
	dw_2.retrieve(nro)
	dw_2.scrolltorow(cual)
	CB_2.ENABLED=TRUE
end if
end event

type cb_2 from commandbutton within tabpage_2
integer x = 2894
integer y = 56
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Insertar"
end type

event clicked;dw_3.reset()
dw_3.insertrow(1)
dw_3.setitem(1,'numero',nro)
dw_3.setitem(1,'consec',dw_2.rowcount()+1)
this.enabled=false
end event

type dw_2 from datawindow within tabpage_2
integer x = 101
integer y = 28
integer width = 2647
integer height = 412
integer taborder = 30
string title = "none"
string dataobject = "dw_licencias"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;if currentrow<1 then return
this.selectrow(0,false)
this.selectrow(currentrow,true)
dw_3.retrieve(nro,this.getitemnumber(currentrow,'consec'))
end event

