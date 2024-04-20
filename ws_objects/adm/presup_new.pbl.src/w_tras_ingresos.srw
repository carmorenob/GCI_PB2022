$PBExportHeader$w_tras_ingresos.srw
forward
global type w_tras_ingresos from window
end type
type pb_15 from picturebutton within w_tras_ingresos
end type
type pb_13 from picturebutton within w_tras_ingresos
end type
type dw_pend from datawindow within w_tras_ingresos
end type
type dw_ing from datawindow within w_tras_ingresos
end type
end forward

global type w_tras_ingresos from window
integer width = 2885
integer height = 1604
boolean titlebar = true
string title = "Ingresos Recaudados Temporalmente"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_15 pb_15
pb_13 pb_13
dw_pend dw_pend
dw_ing dw_ing
end type
global w_tras_ingresos w_tras_ingresos

type variables
st_interfaz st_p
double id_vigencia
string is_codtotal, is_descripcion

end variables

on w_tras_ingresos.create
this.pb_15=create pb_15
this.pb_13=create pb_13
this.dw_pend=create dw_pend
this.dw_ing=create dw_ing
this.Control[]={this.pb_15,&
this.pb_13,&
this.dw_pend,&
this.dw_ing}
end on

on w_tras_ingresos.destroy
destroy(this.pb_15)
destroy(this.pb_13)
destroy(this.dw_pend)
destroy(this.dw_ing)
end on

event open;st_p = message.powerObjectParm
dw_pend.retrieve('PI',st_p.cod_vigencia)

SELECT ips.cod_vigencia_recaudo, ips.codtotal_recaudo, Pre_plan.descrip into :id_vigencia, :is_codtotal, :is_descripcion
FROM ips INNER JOIN Pre_plan ON (ips.codtotal_recaudo = Pre_plan.CodTotal) AND (ips.cod_vigencia_recaudo = Pre_plan.cod_vigencia);
if sqlca.sqlcode = 100 then
	MessageBox('Atención','No está asociado el rubro del que se trasladarán los montos (IPS).')
	setnull(id_vigencia)
	Return 0
elseif sqlca.sqlcode = -1 then
	MessageBox("SQL error", SQLCA.SQLErrText)
	setnull(id_vigencia)
	Return 0
end if

end event

type pb_15 from picturebutton within w_tras_ingresos
event mousemove pbm_mousemove
string tag = "Reservar"
integer x = 1847
integer y = 384
integer width = 137
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)

end event

type pb_13 from picturebutton within w_tras_ingresos
event mousemove pbm_mousemove
string tag = "Reservar"
integer x = 1847
integer y = 256
integer width = 137
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Llevar seleccionados"
end type

event clicked;long fila, fo, i
string cd, cl, ls_cuenta
double nd, ld_vigencia
if dw_pend.getrow() = 0 then return 0
fo = dw_pend.Find("selec=1",1,dw_pend.rowCount())
w_new_traslado.tb_1.tp_2.dw_sle.setItem(1,1,is_codtotal)
if w_new_traslado.tb_1.tp_2.dw_sle.Event itemchanged(1,w_new_traslado.tb_1.tp_2.dw_sle.object.#1,is_codtotal) = -1 then return -1
do while fo > 0
	dw_pend.setRow(fo)
	if dw_ing.rowCount() = 0 then 
		if fo + 1> dw_pend.rowCount() then EXIT
		fo = dw_pend.Find("selec=1",fo + 1,dw_pend.rowCount())
		continue
	end if
	if dw_ing.getItemNumber(1,'total') = 0 then
		if fo + 1> dw_pend.rowCount() then EXIT
		fo = dw_pend.Find("selec=1",fo + 1,dw_pend.rowCount())
		continue
	end if
	cd = dw_pend.getItemString(fo,'coddoc')
	cl = dw_pend.getItemString(fo,'clugar')
	nd = dw_pend.getItemNumber(fo,'numdoc')
	
	fila = st_p.dw_it.Find("char_orig1='"+cd+"' and char_orig2='"+cl+"' and num_orig1="+string(nd),1,st_p.dw_it.rowCount())
	if fila = 0 then
		fila = st_p.dw_it.InsertRow(0)
		st_p.dw_it.setItem(fila,'codigo',st_p.codmod) //
		st_p.dw_it.setItem(fila,'char_orig1',cd) //coddoc
		st_p.dw_it.setItem(fila,'char_orig2',cl) //clugar
		st_p.dw_it.setItem(fila,'num_orig1',nd) //item
		st_p.dw_it.setItem(fila,'char_doc1',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'coddoc'))
		st_p.dw_it.setItem(fila,'char_doc2',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'clugar'))
		st_p.dw_it.setItem(fila,'num_doc1',st_p.dw_cab.getItemNumber(st_p.dw_cab.getRow(),'numdoc'))
	end if
	st_p.dw_it.setItem(fila,'valor',dw_ing.getItemNumber(1,'total'))
	for i = 1 to dw_ing.rowCount()
		ld_vigencia = dw_ing.getItemNumber(i,'cod_vig_recon')
		ls_cuenta = dw_ing.getItemString(i,'cta_pres_recon')
		fila = w_new_traslado.tb_1.tp_3.dw_fuen.Find("cod_vigencia="+string(ld_vigencia)+" and codtotal='"+ls_cuenta+"'",1,w_new_traslado.tb_1.tp_3.dw_fuen.rowCount())
		if fila = 0 then
			w_new_traslado.tb_1.tp_3.dw_sle2.setItem(1,1,ls_cuenta)
			fila = w_new_traslado.tb_1.tp_3.dw_sle2.Event itemchanged(1,w_new_traslado.tb_1.tp_3.dw_sle2.object.#1,ls_cuenta)
			if fila = -1 then return -1
//			fila = st_p.dw_obj.insertRow(0)
//			st_p.dw_obj.setItem(fila,'coddoc',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'coddoc'))
//			st_p.dw_obj.setItem(fila,'clugar',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'clugar'))
//			st_p.dw_obj.setItem(fila,'numdoc',st_p.dw_cab.getItemNumber(st_p.dw_cab.getRow(),'numdoc'))
//			st_p.dw_obj.setItem(fila,'item',fila)
//			st_p.dw_obj.SetItem(fila,'cod_vigencia', ld_vigencia)
//			st_p.dw_obj.SetItem(fila,'codtotal', ls_cuenta)
//			st_p.dw_obj.SetItem(fila,'descrip',is_descripcion)
//			st_p.dw_obj.SetItem(fila,'estado','0')
//			st_p.dw_obj.setrow(fila)
		end if
		w_new_traslado.tb_1.tp_3.dw_fuen.setItem(fila,'monto',w_new_traslado.tb_1.tp_3.dw_fuen.getItemNumber(fila,'monto')+dw_ing.getItemNumber(i,'valor_pagado'))
//		st_p.dw_obj.SetItem(fila,'monto',st_p.dw_obj.getItemNumber(fila,'monto') + dw_ing.getItemNumber(i,'valor_pagado'))
//		st_p.dw_obj.SetItem(fila,'monto_vigente',st_p.dw_obj.getItemNumber(fila,'monto_vigente') + dw_ing.getItemNumber(i,'valor_pagado'))
		w_new_traslado.tb_1.tp_2.dw_rub.setItem(1,'monto',w_new_traslado.tb_1.tp_2.dw_rub.getItemNumber(1,'monto')+dw_ing.getItemNumber(i,'valor_pagado'))
		w_new_traslado.tb_1.tp_2.dw_rub.setItem(1,'monto_vigente',w_new_traslado.tb_1.tp_2.dw_rub.getItemNumber(1,'monto_vigente')+dw_ing.getItemNumber(i,'valor_pagado'))
	next
	if fo + 1> dw_pend.rowCount() then EXIT
	fo = dw_pend.Find("selec=1",fo + 1,dw_pend.rowCount())
loop
close(parent)

end event

type dw_pend from datawindow within w_tras_ingresos
integer x = 55
integer y = 28
integer width = 1742
integer height = 492
integer taborder = 10
string title = "none"
string dataobject = "dw_histo_ingresos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_ing.reset()
if currentrow > 0 and rowcount() > 0 then
	dw_ing.retrieve(getItemString(getrow(),'coddoc'),getItemString(getrow(),'clugar'),getItemNumber(getrow(),'numdoc'))
end if

end event

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

type dw_ing from datawindow within w_tras_ingresos
integer x = 46
integer y = 540
integer width = 2734
integer height = 916
integer taborder = 10
string title = "none"
string dataobject = "dw_tras_bancos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

