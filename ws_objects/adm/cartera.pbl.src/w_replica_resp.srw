$PBExportHeader$w_replica_resp.srw
forward
global type w_replica_resp from window
end type
type dw_valor from datawindow within w_replica_resp
end type
type cbx_1 from checkbox within w_replica_resp
end type
type st_1 from statictext within w_replica_resp
end type
type mle_1 from multilineedit within w_replica_resp
end type
type dw_user from datawindow within w_replica_resp
end type
type em_2 from editmask within w_replica_resp
end type
type rb_valor from radiobutton within w_replica_resp
end type
type dw_resp from datawindow within w_replica_resp
end type
type pb_cancel from picturebutton within w_replica_resp
end type
type pb_ok from picturebutton within w_replica_resp
end type
type dw_obj from datawindow within w_replica_resp
end type
type em_1 from editmask within w_replica_resp
end type
type rb_porcen from radiobutton within w_replica_resp
end type
end forward

global type w_replica_resp from window
integer width = 3493
integer height = 1008
boolean titlebar = true
string title = "Utilidades de Objeciones"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_valor dw_valor
cbx_1 cbx_1
st_1 st_1
mle_1 mle_1
dw_user dw_user
em_2 em_2
rb_valor rb_valor
dw_resp dw_resp
pb_cancel pb_cancel
pb_ok pb_ok
dw_obj dw_obj
em_1 em_1
rb_porcen rb_porcen
end type
global w_replica_resp w_replica_resp

type variables
datawindowchild idw_resp,idw_espe,idw_obj
datawindow dw_o, dw_r
end variables

on w_replica_resp.create
this.dw_valor=create dw_valor
this.cbx_1=create cbx_1
this.st_1=create st_1
this.mle_1=create mle_1
this.dw_user=create dw_user
this.em_2=create em_2
this.rb_valor=create rb_valor
this.dw_resp=create dw_resp
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_obj=create dw_obj
this.em_1=create em_1
this.rb_porcen=create rb_porcen
this.Control[]={this.dw_valor,&
this.cbx_1,&
this.st_1,&
this.mle_1,&
this.dw_user,&
this.em_2,&
this.rb_valor,&
this.dw_resp,&
this.pb_cancel,&
this.pb_ok,&
this.dw_obj,&
this.em_1,&
this.rb_porcen}
end on

on w_replica_resp.destroy
destroy(this.dw_valor)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.mle_1)
destroy(this.dw_user)
destroy(this.em_2)
destroy(this.rb_valor)
destroy(this.dw_resp)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_obj)
destroy(this.em_1)
destroy(this.rb_porcen)
end on

event open;dw_o = w_respu_glosas.dw_objs
dw_r = w_respu_glosas.dw_res
end event

type dw_valor from datawindow within w_replica_resp
boolean visible = false
integer x = 46
integer y = 748
integer width = 384
integer height = 92
integer taborder = 40
string title = "none"
string dataobject = "dw_objecion_porcen"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type cbx_1 from checkbox within w_replica_resp
integer x = 46
integer y = 368
integer width = 1001
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccionar objeciones sin seleccionar"
end type

type st_1 from statictext within w_replica_resp
integer x = 1870
integer y = 4
integer width = 526
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de la Respuesta"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_replica_resp
integer x = 1865
integer y = 64
integer width = 1550
integer height = 644
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

type dw_user from datawindow within w_replica_resp
integer x = 37
integer y = 592
integer width = 1362
integer height = 152
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_user"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
InsertRow(0)

end event

type em_2 from editmask within w_replica_resp
integer x = 1079
integer y = 32
integer width = 370
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,####.00"
end type

event modified;rb_valor.checked=true
em_1.text='0'
end event

type rb_valor from radiobutton within w_replica_resp
integer x = 859
integer y = 40
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valor"
end type

event clicked;em_1.text='0'
rb_porcen.checked=false

end event

type dw_resp from datawindow within w_replica_resp
integer x = 37
integer y = 440
integer width = 1353
integer height = 144
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_resp"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_respuesta',idw_resp)
idw_resp.settransobject(sqlca)
InsertRow(0)

end event

event itemchanged;mle_1.text = idw_resp.getitemstring(idw_resp.getrow(),'respuesta')

end event

type pb_cancel from picturebutton within w_replica_resp
integer x = 1595
integer y = 768
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_replica_resp
integer x = 1431
integer y = 768
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if (not rb_porcen.checked) and (not rb_valor.checked) then
	messagebox('Atención','Debe elegir la opción de distribución (Porcentual o valor)')
	return
end if

if isNull(dw_resp.GetItemString(1,1)) then
	messagebox('Atención','Debe elegir una respuesta')
	return
end if
long fila, fn
dec porcen,valores
double diff

dw_r.SetRedraw(FALSE)
dw_o.GroupCalc()
if cbx_1.checked then
	fila = dw_o.Find("cod_objecion='"+dw_obj.GetItemString(1,1)+"'",1,dw_o.RowCount())
else
	fila = dw_o.Find("cod_objecion='"+dw_obj.GetItemString(1,1)+"' and sel_glos=1",1,dw_o.RowCount())
end if

if rb_valor.checked then 
	dw_valor.Retrieve(dw_o.getitemstring(1,'coddoc'),dw_o.getitemstring(1,'clugar'),dw_o.getitemnumber(1,'num_glosa'),dw_obj.GetItemString(1,1))
	if dw_valor.rowcount()>0 then 
		valores=dec(Em_2.text)
		if dw_valor.getitemnumber(1,'sumadevalor_objecion')<>0  then
			porcen=dec(Em_2.text)/dw_valor.getitemnumber(1,'sumadevalor_objecion')*100
		else
			porcen=0
		end if
	end if
	em_2.text='0'
	em_1.text=string(porcen)
	rb_porcen.checked=true
	rb_valor.checked=false
else
	porcen=dec(em_1.Text)
end if

do while fila > 0
	dw_o.SetRow(fila)
	if dw_o.GetRow() <> fila then 
		dw_o.expandAll()
		dw_o.SetRow(fila)
		dw_o.Event Rowfocuschanged(fila)
	end if
	fn = w_respu_glosas.pb_11.event clicked()
	if fn > 0 then
		dw_r.SetItem(fn,'cod_respuesta',dw_resp.GetItemString(1,1))
		dw_r.SetItem(fn,'respuesta',idw_resp.getitemstring(idw_resp.getrow(),'respuesta'))
		dw_r.SetItem(fn,'usu_causante',dw_user.GetItemString(1,1))
		dw_r.SetItem(fn,'cod_objecion',dw_obj.GetItemString(1,1))
		dw_r.SetItem(fn,'respuesta',mle_1.Text)
		if rb_porcen.checked then
			dw_r.SetItem(fn,'t_aceptado',round(dw_o.GetItemNumber(fila,'valor_objecion')*porcen/100,i_dec_gral_car))
		end if
		if w_respu_glosas.dw_res.Event p_itemchanged(fn) = -1 then Exit
	else
		exit
	end if
	if fila + 1 > dw_o.RowCount() then exit
	if cbx_1.checked then
		fila = dw_o.Find("cod_objecion='"+dw_obj.GetItemString(1,1)+"'",fila+1,dw_o.RowCount())
	else
		fila = dw_o.Find("cod_objecion='"+dw_obj.GetItemString(1,1)+"' and sel_glos=1",fila+1,dw_o.RowCount())
	end if
loop


dw_r.setfilter("cod_objecion='"+dw_obj.GetItemString(1,1)+"'") 
dw_r.filter() 
fila = dw_r.RowCount()
long ret
diff = valores - dw_r.GetItemNumber(1,'total')
do while diff <> 0 and fila > 0
 	if  dw_r.GetItemNumber(fila,'t_aceptado') + diff >= 0 and  dw_r.GetItemNumber(fila,'t_aceptado') + diff <=  dw_r.GetItemNumber(fila,'t_aceptado') then
		dw_r.SetItem(fila,'t_aceptado',dw_r.GetItemNumber(fila,'t_aceptado') + diff) 
		diff = 0
	elseif  dw_r.GetItemNumber(fila,'t_aceptado') + diff < 0 then
		diff =  dw_r.GetItemNumber(fila,'t_aceptado') + diff
		dw_r.SetItem(fila,'t_aceptado',0) 
	elseif  dw_r.GetItemNumber(fila,'t_aceptado') + diff >  dw_r.GetItemNumber(fila,'t_aceptado') then
		dw_r.SetItem(fila,'t_aceptado',dw_r.GetItemNumber(fila,'t_aceptado') + diff) 
		diff = 0
	end if

	if not isnull(dw_r.GetItemNumber(fila,'num_glosa_gral')) then 
		fn = dw_o.Find("coddoc='"+dw_r.GetItemstring(fila,'coddoc_glosa_gral')+"' and clugar='" +dw_r.GetItemstring(fila,'clugar_glosa_gral')+"' and num_glosa="+string(dw_r.GetItemNumber(fila,'num_glosa_gral'))+" and item="+ string(dw_r.GetItemNumber(fila,'item_glosa_gral')) +" and nobjecion="+ string(dw_r.GetItemNumber(fila,'nglosa_gral')),1,dw_o.RowCount())
	end if
	if not isnull(dw_r.GetItemNumber(fila,'num_glosa_det')) then 
		fn = dw_o.Find("coddoc='"+dw_r.GetItemstring(fila,'coddoc_glosa_det')+"' and clugar='" +dw_r.GetItemstring(fila,'clugar_glosa_det')+"' and num_glosa="+string(dw_r.GetItemNumber(fila,'num_glosa_det'))+" and item="+ string(dw_r.GetItemNumber(fila,'item_glosa_det')) +" and nobjecion="+ string(dw_r.GetItemNumber(fila,'subitem_glosa_det'))+' and subitem='+ string(dw_r.GetItemNumber(fila,'subitem_glosa_det')),1,dw_o.RowCount())
	end if
	if not isnull(dw_r.GetItemNumber(fila,'num_glosa_sub')) then 
		fn = dw_o.Find("coddoc='"+dw_r.GetItemstring(fila,'coddoc_glosa_det')+"' and clugar='" +dw_r.GetItemstring(fila,'clugar_glosa_det')+"' and num_glosa="+string(dw_r.GetItemNumber(fila,'num_glosa_det'))+" and item="+ string(dw_r.GetItemNumber(fila,'item_glosa_det')) +" and nobjecion="+ string(dw_r.GetItemNumber(fila,'subitem_glosa_det'))+' and subitem='+ string(dw_r.GetItemNumber(fila,'subitem_glosa_det')),1,dw_o.RowCount())
	end if
	if fn>0 then
		dw_r.setfilter("getrow()="+string(fila))
		dw_r.filter() 
		if w_respu_glosas.dw_res.Event p_itemchanged(fn) = -1 then Exit
	end if
//	dw_r.setfilter('') 
//	dw_r.filter() 
	fila= fila -1
loop

dw_r.SetRedraw(TRUE)
close(parent)

end event

type dw_obj from datawindow within w_replica_resp
integer x = 46
integer y = 128
integer width = 1737
integer height = 228
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_objeciones"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('con_espe',idw_espe)
idw_espe.settransobject(sqlca)
idw_espe.retrieve('%')
getchild('cod_objecion',idw_obj)
idw_obj.settransobject(sqlca)
idw_obj.retrieve('%','%')
insertrow(1)
end event

event itemchanged;string nulo
setnull(nulo)
long j
AcceptText()
string vnulo
setNull(vnulo)
choose case dwo.name
	case 'con_gral'
		setitem(row,'con_espe',nulo)
		if idw_espe.retrieve(data)=1 then
			setitem(row,'con_espe',idw_espe.getitemstring(idw_espe.getrow(),'con_espe') )
		end if
	case 'con_espe'		
		setitem(row,'cod_objecion',nulo)
		if idw_obj.retrieve(getitemstring(row,'con_gral'),data)=1 then
			setitem(row,'cod_objecion',idw_obj.getitemstring(idw_obj.getrow(),1) )
		end if	
		idw_resp.Retrieve(GetItemString(GetRow(),'cod_objecion'))
	case 'cod_objecion'
		dw_resp.SetItem(1,1,vnulo)
		idw_resp.Retrieve(GetItemString(GetRow(),'cod_objecion'))
end choose





end event

type em_1 from editmask within w_replica_resp
integer x = 379
integer y = 28
integer width = 370
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
double increment = 1
string minmax = "0~~100"
end type

event modified;rb_porcen.checked=true
em_2.text='0'

end event

type rb_porcen from radiobutton within w_replica_resp
integer x = 50
integer y = 36
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Porcentual"
end type

event clicked;	em_2.text='0'
	rb_valor.checked=false
end event

