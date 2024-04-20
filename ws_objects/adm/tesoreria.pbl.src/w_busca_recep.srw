$PBExportHeader$w_busca_recep.srw
forward
global type w_busca_recep from window
end type
type em_1 from editmask within w_busca_recep
end type
type st_2 from statictext within w_busca_recep
end type
type pb_cancel from picturebutton within w_busca_recep
end type
type pb_ok from picturebutton within w_busca_recep
end type
type dw_1 from datawindow within w_busca_recep
end type
type st_1 from statictext within w_busca_recep
end type
end forward

global type w_busca_recep from window
integer width = 4174
integer height = 1512
boolean titlebar = true
string title = "Buscar Recepción de facturas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_1 em_1
st_2 st_2
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
st_1 st_1
end type
global w_busca_recep w_busca_recep

type variables
string i_decual

end variables

on w_busca_recep.create
this.em_1=create em_1
this.st_2=create st_2
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.st_1=create st_1
this.Control[]={this.em_1,&
this.st_2,&
this.pb_cancel,&
this.pb_ok,&
this.dw_1,&
this.st_1}
end on

on w_busca_recep.destroy
destroy(this.em_1)
destroy(this.st_2)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
destroy(this.st_1)
end on

event open;i_decual=message.stringparm
if i_decual='recep' then
	dw_1.dataobject='dw_busca_recep'
	dw_1.settransobject(sqlca)
else
	st_1.text='Consolidado de Pagos (Click contrario para filtrar)'
	dw_1.dataobject='dw_lista_pagos'
	title='Buscar Ordenes de Pago'
	dw_1.settransobject(sqlca)
end if
em_1.TriggerEvent(modified!)
end event

type em_1 from editmask within w_busca_recep
integer x = 146
integer y = 4
integer width = 283
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "2000~~2050"
end type

event constructor;text=string(year(today()))


end event

event modified;dw_1.retrieve(integer(em_1.text))
dw_1.setfocus()
end event

type st_2 from statictext within w_busca_recep
integer x = 23
integer y = 12
integer width = 137
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_busca_recep
integer x = 1952
integer y = 1296
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_busca_recep
integer x = 1792
integer y = 1296
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
long donde
if i_decual='recep' then
	w_recibe_fact.dw_lug.setitem(1,1,dw_1.getitemstring(dw_1.getrow(),'clugar'))
	w_recibe_fact.dw_lug.event itemchanged(1,w_recibe_fact.dw_lug.object.codlugar,dw_1.getitemstring(dw_1.getrow(),'clugar'))
	w_recibe_fact.dw_orig.setitem(1,1,dw_1.getitemstring(dw_1.getrow(),'cod_flujo'))
	w_recibe_fact.dw_orig.event itemchanged(1,w_recibe_fact.dw_orig.object.codigo,dw_1.getitemstring(dw_1.getrow(),'cod_flujo'))
	
	choose case dw_1.getitemstring(dw_1.getrow(),'cod_orig')
		case '-','RFC'
			w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'tipodoc',dw_1.getitemstring(dw_1.getrow(),'tipodoc'))
			w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'documento',dw_1.getitemstring(dw_1.getrow(),'documento'))
			w_recibe_fact.tab_2.t2_2.dw_terce.setcolumn('documento')
			w_recibe_fact.tab_2.t2_2.dw_terce.event itemchanged(1,w_recibe_fact.tab_2.t2_2.dw_terce.object.documento,dw_1.getitemstring(dw_1.getrow(),'documento'))
			donde=w_recibe_fact.tab_2.t2_2.dw_hist.find('nrelacion='+string(dw_1.getitemnumber(dw_1.getrow(),'nrelacion')),1,w_recibe_fact.tab_2.t2_2.dw_hist.rowcount())
			
		case 'PR'
			donde=w_recibe_fact.tab_2.t2_2.dw_hist.find('nrelacion='+string(dw_1.getitemnumber(dw_1.getrow(),'nrelacion')),1,w_recibe_fact.tab_2.t2_2.dw_hist.rowcount())
		case 'PDI'
			w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'tipodoc',dw_1.getitemstring(dw_1.getrow(),'tipodoc'))
			w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'documento',dw_1.getitemstring(dw_1.getrow(),'documento'))
			w_recibe_fact.tab_2.t2_2.dw_terce.setcolumn('documento')
			w_recibe_fact.tab_2.t2_2.dw_terce.event itemchanged(1,w_recibe_fact.tab_2.t2_2.dw_terce.object.documento,dw_1.getitemstring(dw_1.getrow(),'documento'))
			donde=w_recibe_fact.tab_2.t2_2.dw_hist.find('nrelacion='+string(dw_1.getitemnumber(dw_1.getrow(),'nrelacion')),1,w_recibe_fact.tab_2.t2_2.dw_hist.rowcount())
		case 'SCT'
			w_recibe_fact.tab_2.t2_1.dw_terce_c.setitem(1,'tipodoc',dw_1.getitemstring(dw_1.getrow(),'tipodoc'))
			w_recibe_fact.tab_2.t2_1.dw_terce_c.setitem(1,'documento',dw_1.getitemstring(dw_1.getrow(),'documento'))
			w_recibe_fact.tab_2.t2_1.dw_terce_c.setcolumn('documento')
			w_recibe_fact.tab_2.t2_1.dw_terce_c.event itemchanged(1,w_recibe_fact.tab_2.t2_1.dw_terce_c.object.documento,dw_1.getitemstring(dw_1.getrow(),'documento'))
			
	end choose
	if donde>0 then
		w_recibe_fact.tab_2.t2_2.dw_hist.scrolltorow(donde)
	end if
	w_recibe_fact.tab_2.selectedtab=3
	w_recibe_fact.tab_2.t2_3.t_ret.selectedtab=1
else
	w_orden_pago2.dw_terce.setitem(1,'tipodoc',dw_1.getitemstring(dw_1.getrow(),'tipodoc'))
	w_orden_pago2.dw_terce.setitem(1,'documento',dw_1.getitemstring(dw_1.getrow(),'documento'))
	w_orden_pago2.dw_terce.setcolumn('documento')
	w_orden_pago2.dw_terce.event itemchanged(1,w_orden_pago2.dw_terce.object.documento,dw_1.getitemstring(dw_1.getrow(),'documento'))
	donde=w_orden_pago2.dw_histo_desde.find('ntransferencia='+string(dw_1.getitemnumber(dw_1.getrow(),'ntransferencia')),1,w_orden_pago2.dw_histo_desde.rowcount())
	if donde=0 then 
		messagebox('Atención','No se puede encontrar la orden de pago')
		return
	end if
	w_orden_pago2.dw_histo_desde.scrolltorow(donde)
	w_orden_pago2.setfocus()
end if
close(parent)
end event

type dw_1 from datawindow within w_busca_recep
integer y = 104
integer width = 4128
integer height = 1180
integer taborder = 10
string title = "none"
string dataobject = "dw_busca_recep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event doubleclicked;if row>0 and row<>getrow() then setrow(row)
pb_ok.event clicked()
end event

event clicked;if row>0 and row<>getrow() then setrow(row)
end event

type st_1 from statictext within w_busca_recep
integer x = 590
integer y = 12
integer width = 1637
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Consolidado de Recepciones de factura (Click contrario para filtrar)"
boolean focusrectangle = false
end type

