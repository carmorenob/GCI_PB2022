$PBExportHeader$w_lleva_dispo_reserv.srw
forward
global type w_lleva_dispo_reserv from window
end type
type st_1 from statictext within w_lleva_dispo_reserv
end type
type dw_rub from datawindow within w_lleva_dispo_reserv
end type
type st_dispon from statictext within w_lleva_dispo_reserv
end type
type pb_1 from picturebutton within w_lleva_dispo_reserv
end type
type pb_13 from picturebutton within w_lleva_dispo_reserv
end type
type dw_historial from datawindow within w_lleva_dispo_reserv
end type
end forward

global type w_lleva_dispo_reserv from window
integer width = 4891
integer height = 1896
boolean titlebar = true
string title = "Selección de documentos Dispobibilidad a Reserva"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_rub dw_rub
st_dispon st_dispon
pb_1 pb_1
pb_13 pb_13
dw_historial dw_historial
end type
global w_lleva_dispo_reserv w_lleva_dispo_reserv

type variables
st_interfaz st_p
int i_dec_gral,i_aprox_gral

end variables

on w_lleva_dispo_reserv.create
this.st_1=create st_1
this.dw_rub=create dw_rub
this.st_dispon=create st_dispon
this.pb_1=create pb_1
this.pb_13=create pb_13
this.dw_historial=create dw_historial
this.Control[]={this.st_1,&
this.dw_rub,&
this.st_dispon,&
this.pb_1,&
this.pb_13,&
this.dw_historial}
end on

on w_lleva_dispo_reserv.destroy
destroy(this.st_1)
destroy(this.dw_rub)
destroy(this.st_dispon)
destroy(this.pb_1)
destroy(this.pb_13)
destroy(this.dw_historial)
end on

event open;st_p = Message.PowerObjectParm

dw_rub.Retrieve(st_p.coddoc,clugar,st_p.cod_vigencia,st_p.filtro)
dw_historial.Retrieve(st_p.coddoc,clugar,st_p.cod_vigencia,st_p.filtro)

SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=29));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 29')
	return 
end if

SELECT ENTERO into :i_aprox_gral
FROM parametros_gen
WHERE (((codigo_para)=18));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 18')
	return 
end if
if i_aprox_gral=0 then i_aprox_gral=1
end event

type st_1 from statictext within w_lleva_dispo_reserv
integer x = 23
integer y = 700
integer width = 613
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rubros de la Disponibilidad:"
boolean focusrectangle = false
end type

type dw_rub from datawindow within w_lleva_dispo_reserv
integer x = 18
integer y = 756
integer width = 4795
integer height = 856
integer taborder = 40
string title = "none"
string dataobject = "dw_dispocp_a_reserv"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;dec valor

valor=round(dec(data),i_dec_gral)
if i_dec_gral=0 then
	valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
end if
accepttext()
setitem(row,'Monto',valor)
return 2
end event

type st_dispon from statictext within w_lleva_dispo_reserv
integer x = 9
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
string text = "Disponibilidades"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_lleva_dispo_reserv
event mousemove pbm_mousemove
string tag = "Reservar"
integer x = 2263
integer y = 1652
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
fila = dw_historial.Find("selec=1",1,dw_historial.RowCount())
if fila = 0 then Return -1
do while st_p.dw_it.RowCount() > 0
	st_p.dw_it.DeleteRow(1)
loop
do while st_p.dw_obj.RowCount() > 0
	st_p.dw_obj.DeleteRow(1)
loop
st_p.dw_cab.setitem(1,'objeto','')
do while fila > 0
	objeto=st_p.dw_cab.getitemstring(1,'objeto')
	if isnull(objeto) then objeto=''
	if not isnull(dw_historial.getitemstring(fila,'objeto')) then 
		if objeto<>'' then objeto+='~r~n'
		objeto+=dw_historial.getitemstring(fila,'objeto')
	end if
	st_p.dw_cab.setitem(1,'objeto',objeto)
	st_p.dw_cab.setitem(1,'solicita',dw_historial.getitemstring(fila,'solicita'))
	dw_historial.ScrolltoRow(fila)
	dw_historial.TriggerEvent(RowFocuschanged!)
	for i = 1 to dw_rub.RowCount()
		if dw_rub.GetItemNumber(i,'monto')>0 then
			valor = st_p.dw_obj.Describe("Evaluate('max(item)',0)")
			
			f = st_p.dw_it.InsertRow(0)
			st_p.dw_it.SetItem(f,'codigo',st_p.codmod)
			st_p.dw_it.SetItem(f,'char_orig1',dw_historial.GetItemString(fila,'coddoc'))
			st_p.dw_it.SetItem(f,'char_orig2',dw_historial.GetItemString(fila,'clugar'))
			st_p.dw_it.SetItem(f,'num_orig1',dw_historial.GetItemNumber(fila,'numdoc'))
			st_p.dw_it.SetItem(f,'num_orig2',dw_rub.GetItemNumber(i,'item'))
			st_p.dw_it.SetItem(f,'char_doc1',st_p.dw_cab.GetItemString(1,'coddoc'))
			st_p.dw_it.SetItem(f,'char_doc2',st_p.dw_cab.GetItemString(1,'clugar'))
			st_p.dw_it.SetItem(f,'num_doc1',st_p.dw_cab.GetItemNumber(1,'numdoc'))
			st_p.dw_it.SetItem(f,'num_doc2',long(valor) + 1)
			st_p.dw_it.SetItem(f,'valor',dw_rub.GetItemNumber(i,'monto'))
				
			rub = st_p.dw_obj.InsertRow(0)
			st_p.dw_obj.SetItem(rub,'coddoc',st_p.dw_cab.GetItemString(1,'coddoc'))
			st_p.dw_obj.SetItem(rub,'clugar',st_p.dw_cab.GetItemString(1,'clugar'))
			st_p.dw_obj.SetItem(rub,'numdoc',st_p.dw_cab.GetItemNumber(1,'numdoc'))
			st_p.dw_obj.SetItem(rub,'item',long(valor) + 1)
			
			st_p.dw_obj.SetItem(rub,'cod_vigencia',dw_rub.GetItemNumber(i,'cod_vigencia'))
			st_p.dw_obj.SetItem(rub,'codtotal',dw_rub.GetItemString(i,'codtotal'))
			st_p.dw_obj.SetItem(rub,'coddoc_orig',dw_rub.GetItemString(i,'coddoc'))
			st_p.dw_obj.SetItem(rub,'clugar_orig',dw_rub.GetItemString(i,'clugar'))
			st_p.dw_obj.SetItem(rub,'numdoc_orig',dw_rub.GetItemNumber(i,'numdoc'))
			st_p.dw_obj.SetItem(rub,'item_orig',dw_rub.GetItemNumber(i,'item'))
			st_p.dw_obj.SetItem(rub,'descrip',dw_rub.GetItemString(i,'descrip'))
			if st_p.coddoc='SPDI' then
				st_p.dw_obj.SetItem(rub,'planeado_inicial',dw_rub.GetItemnumber(i,'planeado_inicial'))
				st_p.dw_obj.SetItem(rub,'acum_traslado',dw_rub.GetItemnumber(i,'acum_traslado'))
				st_p.dw_obj.SetItem(rub,'acum_adicion',dw_rub.GetItemnumber(i,'acum_adicion'))
				st_p.dw_obj.SetItem(rub,'acum_recorte',dw_rub.GetItemnumber(i,'acum_recorte'))
				st_p.dw_obj.SetItem(rub,'acum_dispon',dw_rub.GetItemnumber(i,'acum_dispon'))
				st_p.dw_obj.SetItem(rub,'acum_mod_dispo',dw_rub.GetItemnumber(i,'acum_mod_dispo'))
				st_p.dw_obj.SetItem(rub,'acum_reserva',dw_rub.GetItemnumber(i,'acum_reserva'))
				st_p.dw_obj.SetItem(rub,'acum_mod_reserv',dw_rub.GetItemnumber(i,'acum_mod_reserv'))
				st_p.dw_obj.SetItem(rub,'acum_girado',dw_rub.GetItemnumber(i,'acum_girado'))
				st_p.dw_obj.SetItem(rub,'acum_recon',dw_rub.GetItemnumber(i,'acum_recon'))
				st_p.dw_obj.SetItem(rub,'acum_recaudo',dw_rub.GetItemnumber(i,'acum_recaudo'))	
			end if			
			if st_p.coddoc='PR'  then
				st_p.dw_obj.SetItem(rub,'estado_cp','0')
			else
				st_p.dw_obj.SetItem(rub,'estado_cb','0')
				st_p.dw_obj.SetItem(rub,'monto_vigente_orig',dw_rub.GetItemNumber(i,'monto_vigente'))
				st_p.dw_obj.SetItem(rub,'monto_utilizado_orig',dw_rub.GetItemNumber(i,'monto_utilizado'))
			end if
			st_p.dw_obj.SetItem(rub,'monto',dw_rub.GetItemNumber(i,'monto'))
			st_p.dw_obj.SetItem(rub,'monto_vigente',dw_rub.GetItemNumber(i,'monto'))
		end if		
	next
	dw_historial.SetItem(fila,'selec',0)
	fila = dw_historial.Find("selec=1",fila,dw_historial.RowCount())
loop
close(parent)
end event

type pb_13 from picturebutton within w_lleva_dispo_reserv
event mousemove pbm_mousemove
integer x = 2423
integer y = 1652
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

type dw_historial from datawindow within w_lleva_dispo_reserv
event setterceros ( )
integer x = 5
integer y = 64
integer width = 4809
integer height = 604
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_histo_docs_sel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;if RowCount() = 0 or currentrow = 0 then Return -1
dw_rub.setfilter('numdoc='+string(GetItemNumber(GetRow(),'numdoc')))
dw_rub.filter()


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

