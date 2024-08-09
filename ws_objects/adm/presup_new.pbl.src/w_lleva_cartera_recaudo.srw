$PBExportHeader$w_lleva_cartera_recaudo.srw
forward
global type w_lleva_cartera_recaudo from window
end type
type st_titulo from statictext within w_lleva_cartera_recaudo
end type
type pb_1 from picturebutton within w_lleva_cartera_recaudo
end type
type pb_13 from picturebutton within w_lleva_cartera_recaudo
end type
type tb_1 from tab within w_lleva_cartera_recaudo
end type
type tp_3 from userobject within tb_1
end type
type st_1 from statictext within tp_3
end type
type st_3 from statictext within tp_3
end type
type dw_cc from datawindow within tp_3
end type
type dw_intf from datawindow within tp_3
end type
type tp_3 from userobject within tb_1
st_1 st_1
st_3 st_3
dw_cc dw_cc
dw_intf dw_intf
end type
type tp_1 from userobject within tb_1
end type
type dw_rub from datawindow within tp_1
end type
type tp_1 from userobject within tb_1
dw_rub dw_rub
end type
type tb_1 from tab within w_lleva_cartera_recaudo
tp_3 tp_3
tp_1 tp_1
end type
type dw_historial from datawindow within w_lleva_cartera_recaudo
end type
end forward

global type w_lleva_cartera_recaudo from window
integer width = 3890
integer height = 1808
boolean titlebar = true
string title = "Selección de documentos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event p_selecttab ( integer p_tab )
st_titulo st_titulo
pb_1 pb_1
pb_13 pb_13
tb_1 tb_1
dw_historial dw_historial
end type
global w_lleva_cartera_recaudo w_lleva_cartera_recaudo

type variables
st_interfaz st_p

end variables

event p_selecttab(integer p_tab);tb_1.selectedtab=p_tab
end event

on w_lleva_cartera_recaudo.create
this.st_titulo=create st_titulo
this.pb_1=create pb_1
this.pb_13=create pb_13
this.tb_1=create tb_1
this.dw_historial=create dw_historial
this.Control[]={this.st_titulo,&
this.pb_1,&
this.pb_13,&
this.tb_1,&
this.dw_historial}
end on

on w_lleva_cartera_recaudo.destroy
destroy(this.st_titulo)
destroy(this.pb_1)
destroy(this.pb_13)
destroy(this.tb_1)
destroy(this.dw_historial)
end on

event open;st_p = Message.PowerObjectParm
tb_1.tp_1.dw_rub.Modify("monto.Edit.DisplayOnly=YES")
if g_motor='postgres' then
	dw_historial.dataobject='dw_recons_con_pagos2_postgres'
else
	dw_historial.dataobject='dw_recons_con_pagos2'
end if
dw_historial.settransobject(sqlca)
dw_historial.Retrieve('PRC',clugar,st_p.cod_vigencia,'%PI')
post event p_selecttab(2)
dw_historial.TriggerEvent(rowfocuschanged!)

end event

type st_titulo from statictext within w_lleva_cartera_recaudo
integer x = 5
integer width = 1161
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reconocimientos:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_lleva_cartera_recaudo
event mousemove pbm_mousemove
string tag = "Reservar"
integer x = 1678
integer y = 1532
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Llevar seleccionados"
end type

event clicked;long fila, i, rub, f, cc
string valor,ct,objeto=''
dec monto
int decimas
if tb_1.tp_1.dw_RUB.rowcount()=0 then
	messagebox('Atención','No tiene rubros disponibles')
	return
end if
fila = dw_historial.Find("selec=1",1,dw_historial.RowCount())
if fila = 0 then Return -1
do while st_p.dw_it.RowCount() > 0
	st_p.dw_it.DeleteRow(1)
loop
do while st_p.dw_obj.RowCount() > 0
	st_p.dw_obj.DeleteRow(1)
loop
do while fila > 0
	dw_historial.ScrolltoRow(fila)
	dw_historial.TriggerEvent(RowFocuschanged!)
	for cc = 1 to tb_1.tp_3.dw_cc.RowCount()
		f = st_p.dw_it.InsertRow(0)
		st_p.dw_it.SetItem(f,'codigo',st_p.codmod)
		st_p.dw_it.SetItem(f,'char_orig1',tb_1.tp_3.dw_cc.GetItemString(cc,'coddoc'))
		st_p.dw_it.SetItem(f,'char_orig2',tb_1.tp_3.dw_cc.GetItemString(cc,'clugar'))
		st_p.dw_it.SetItem(f,'char_orig3',tb_1.tp_3.dw_cc.GetItemString(cc,'cartipo'))
		st_p.dw_it.SetItem(f,'num_orig1',tb_1.tp_3.dw_cc.GetItemNumber(cc,'num_cobro'))
		st_p.dw_it.SetItem(f,'num_orig2',tb_1.tp_3.dw_cc.GetItemNumber(cc,'item'))
		st_p.dw_it.SetItem(f,'char_doc1',st_p.dw_cab.GetItemString(1,'coddoc'))
		st_p.dw_it.SetItem(f,'char_doc2',st_p.dw_cab.GetItemString(1,'clugar'))
		st_p.dw_it.SetItem(f,'num_doc1',st_p.dw_cab.GetItemNumber(1,'numdoc'))
		st_p.dw_it.SetItem(f,'valor',tb_1.tp_3.dw_cc.GetItemNumber(cc,'total'))
	next
	monto=tb_1.tp_3.dw_cc.getitemnumber(1,'t_pagado')/tb_1.tp_1.dw_RUB.getitemnumber(1,'TOTAL')
	decimas=0
	for cc= 1 to tb_1.tp_1.dw_rub.rowcount()
		rub=st_p.dw_obj.insertrow(0)
		
		st_p.dw_obj.SetItem(rub,'coddoc',st_p.dw_cab.GetItemString(1,'coddoc'))
		st_p.dw_obj.SetItem(rub,'clugar',st_p.dw_cab.GetItemString(1,'clugar'))
		st_p.dw_obj.SetItem(rub,'numdoc',st_p.dw_cab.GetItemNumber(1,'numdoc'))
		st_p.dw_obj.SetItem(rub,'item',rub)
		st_p.dw_obj.SetItem(rub,'cod_vigencia',tb_1.tp_1.dw_rub.GetItemNumber(cc,'cod_vigencia'))
		st_p.dw_obj.SetItem(rub,'codtotal',tb_1.tp_1.dw_rub.GetItemString(cc,'codtotal'))
		
		st_p.dw_obj.SetItem(rub,'descrip',tb_1.tp_1.dw_rub.GetItemString(cc,'descrip'))
		st_p.dw_obj.SetItem(rub,'estado_cb','0')
		st_p.dw_obj.SetItem(rub,'monto',round(tb_1.tp_1.dw_rub.GetItemNumber(cc,'monto_vigente')*monto,decimas))
		st_p.dw_obj.SetItem(rub,'monto_vigente',st_p.dw_obj.getitemnumber(rub,'monto'))
		st_p.dw_obj.SetItem(rub,'coddoc_orig',tb_1.tp_1.dw_rub.GetItemString(cc,'coddoc'))
		st_p.dw_obj.SetItem(rub,'clugar_orig',tb_1.tp_1.dw_rub.GetItemString(cc,'clugar'))
		st_p.dw_obj.SetItem(rub,'numdoc_orig',tb_1.tp_1.dw_rub.GetItemnumber(cc,'numdoc'))
		st_p.dw_obj.SetItem(rub,'item_orig',tb_1.tp_1.dw_rub.GetItemnumber(cc,'item'))
		st_p.dw_obj.SetItem(rub,'monto_vigente_orig',tb_1.tp_1.dw_rub.GetItemNumber(cc,'monto_vigente'))
		st_p.dw_obj.SetItem(rub,'monto_utilizado_orig',tb_1.tp_1.dw_rub.GetItemNumber(cc,'monto_utilizado'))
	next
	dw_historial.SetItem(fila,'selec',0)
	fila = dw_historial.Find("selec=1",fila,dw_historial.RowCount())
loop
close(parent)
end event

type pb_13 from picturebutton within w_lleva_cartera_recaudo
event mousemove pbm_mousemove
integer x = 1833
integer y = 1532
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)

end event

type tb_1 from tab within w_lleva_cartera_recaudo
integer y = 576
integer width = 3822
integer height = 1104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_3 tp_3
tp_1 tp_1
end type

on tb_1.create
this.tp_3=create tp_3
this.tp_1=create tp_1
this.Control[]={this.tp_3,&
this.tp_1}
end on

on tb_1.destroy
destroy(this.tp_3)
destroy(this.tp_1)
end on

type tp_3 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 3785
integer height = 976
long backcolor = 67108864
string text = "Interfaz"
long tabtextcolor = 33554432
string picturename = "buscar.ico"
long picturemaskcolor = 536870912
st_1 st_1
st_3 st_3
dw_cc dw_cc
dw_intf dw_intf
end type

on tp_3.create
this.st_1=create st_1
this.st_3=create st_3
this.dw_cc=create dw_cc
this.dw_intf=create dw_intf
this.Control[]={this.st_1,&
this.st_3,&
this.dw_cc,&
this.dw_intf}
end on

on tp_3.destroy
destroy(this.st_1)
destroy(this.st_3)
destroy(this.dw_cc)
destroy(this.dw_intf)
end on

type st_1 from statictext within tp_3
integer x = 41
integer y = 4
integer width = 795
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagos Realizados al Reconocimiento"
boolean focusrectangle = false
end type

type st_3 from statictext within tp_3
integer x = 50
integer y = 432
integer width = 773
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Abonos a Cuentas por Cobrar:"
boolean focusrectangle = false
end type

type dw_cc from datawindow within tp_3
integer x = 46
integer y = 492
integer width = 3675
integer height = 344
integer taborder = 30
string title = "none"
string dataobject = "dw_flujo_car_cobro"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type dw_intf from datawindow within tp_3
integer x = 37
integer y = 60
integer width = 3694
integer height = 364
integer taborder = 20
string title = "none"
string dataobject = "dw_flujo_recon_recau"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_cc.reset()
if RowCount() = 0 or currentrow = 0 then Return
long fila
fila = tb_1.tp_1.dw_rub.Find("item="+String(GetItemNumber(GetRow(),'num_doc2')),1,tb_1.tp_1.dw_rub.RowCount())
if fila > 0 then
	if tb_1.tp_1.dw_rub.GetItemString(fila,'coddoc_orig') = 'PRC' then
		tb_1.tp_1.dw_rub.SetFilter("coddoc_orig='PRC' and clugar_orig='"+tb_1.tp_1.dw_rub.GetItemString(fila,'clugar_orig')+"' and numdoc_orig="+string(tb_1.tp_1.dw_rub.GetItemNumber(fila,'numdoc_orig')))
		tb_1.tp_1.dw_rub.Filter()
	end if
end if

dw_cc.Retrieve(GetItemString(GetRow(),'char_orig1'),GetItemString(GetRow(),'char_orig2'),GetItemNumber(GetRow(),'num_orig1'))

end event

type tp_1 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 3785
integer height = 976
long backcolor = 67108864
string text = "Rubros"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
dw_rub dw_rub
end type

on tp_1.create
this.dw_rub=create dw_rub
this.Control[]={this.dw_rub}
end on

on tp_1.destroy
destroy(this.dw_rub)
end on

type dw_rub from datawindow within tp_1
integer x = 41
integer y = 24
integer width = 3721
integer height = 792
integer taborder = 20
string title = "none"
string dataobject = "dw_pre_doc_cp_item"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;if row > 0 then
	MessageBox('',GetItemString(row,'coddoc_orig')+string(GetItemNumber(row,'numdoc_orig')))
end if
end event

type dw_historial from datawindow within w_lleva_cartera_recaudo
event setterceros ( )
integer x = 5
integer y = 52
integer width = 3826
integer height = 508
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_recons_con_pagos2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//setTransObject(SQLCA)

end event

event rowfocuschanged;if RowCount() = 0 or currentrow = 0 then Return -1
tb_1.tp_1.dw_rub.SetRedraw(FALSE)
tb_1.tp_1.dw_rub.SetFilter("")
tb_1.tp_1.dw_rub.Filter()
tb_1.tp_1.dw_rub.retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))//,GetItemNumber(GetRow(),'num_doc2'))
tb_1.tp_3.dw_intf.reset()
tb_1.tp_3.dw_intf.retrieve(GetItemString(GetRow(),'cod_flujo'),GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'),GetItemNumber(GetRow(),'num_cobro'))
tb_1.tp_1.dw_rub.SetRedraw(TRUE)
end event

event itemchanged;
AcceptText()
if getColumnName() = 'selec' then
	
end if

end event

event clicked;if dwo.Name = 'selec_t' then
	int i
	if describe("selec_t.text") = 'Selec.' then
		for i = 1 to rowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to rowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
	Return
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

