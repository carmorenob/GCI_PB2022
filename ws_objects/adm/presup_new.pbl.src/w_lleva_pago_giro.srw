$PBExportHeader$w_lleva_pago_giro.srw
forward
global type w_lleva_pago_giro from window
end type
type pb_ok from picturebutton within w_lleva_pago_giro
end type
type st_2 from statictext within w_lleva_pago_giro
end type
type dw_2 from datawindow within w_lleva_pago_giro
end type
type st_1 from statictext within w_lleva_pago_giro
end type
type dw_1 from datawindow within w_lleva_pago_giro
end type
end forward

global type w_lleva_pago_giro from window
integer width = 4270
integer height = 1852
boolean titlebar = true
string title = "Escoger Orden de Pago para Giro"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_ok pb_ok
st_2 st_2
dw_2 dw_2
st_1 st_1
dw_1 dw_1
end type
global w_lleva_pago_giro w_lleva_pago_giro

type variables
st_interfaz i_st
dec i_valor
end variables

on w_lleva_pago_giro.create
this.pb_ok=create pb_ok
this.st_2=create st_2
this.dw_2=create dw_2
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_ok,&
this.st_2,&
this.dw_2,&
this.st_1,&
this.dw_1}
end on

on w_lleva_pago_giro.destroy
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm

string ls_tipo
SELECT CADENA into :ls_tipo
FROM parametros_gen
WHERE (((codigo_para)=74));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 74')
	return 
end if

if ls_tipo='1' then
	dw_1.dataobject='dw_trae_pago_xa_giro_neto'
else
	dw_1.dataobject='dw_trae_pago_xa_giro'
end if
dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type pb_ok from picturebutton within w_lleva_pago_giro
integer x = 2144
integer y = 1632
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
long donde,nrel,j,k
string clug_rel
donde=dw_1.find('esco=1',1,dw_1.rowcount())
if donde=0 then
	messagebox('Atención','No ha escogido una recepción')
	return
end if
nrel=dw_1.getitemnumber(donde,'ntransferencia')
clug_rel=dw_1.getitemstring(donde,'clugar')
do while i_st.dw_obj.rowcount()>0
	i_st.dw_obj.deleterow(0)
loop
do while i_st.dw_it.rowcount()>0
	i_st.dw_it.deleterow(0)
loop
do while i_st.dw_ter.rowcount()>0
	i_st.dw_ter.deleterow(0)
loop
if dw_1.getitemstring(donde,'cod_orig')='SCT' or dw_1.getitemstring(donde,'cod_orig')='NC' then
	if dw_2.rowcount()=0 then
		messagebox('Atención','La recepción que elegió no tiene rubros')
		return
	end if
	if round(i_valor,2)<>round(dw_2.getitemnumber(1,'total'),2) then
		messagebox('Atención','La sumatoria de los rubros '+string(round(i_valor,2))+' no es igual a la recepción '+string(round(dw_2.getitemnumber(1,'total'),2)))
		return
	end if
	for j=1 to dw_2.rowcount()
		if dw_2.getitemnumber(j,'a_girar')>dw_2.getitemnumber(j,'disponible') then
			messagebox('Atención','Uno de los rubros a girar tiene un monto mayor al saldo disponible')
			return
		end if
	next
	for j=1 to dw_2.rowcount()
		if dw_2.getitemnumber(j,'a_girar')=0 then continue
		k=i_st.dw_obj.insertrow(0)
		i_st.dw_obj.setitem(k,'coddoc',i_st.coddoc)
		i_st.dw_obj.setitem(k,'clugar',clugar)
		i_st.dw_obj.setitem(k,'item',k)
		i_st.dw_obj.setitem(k,'cod_vigencia',i_st.cod_vigencia)
		i_st.dw_obj.setitem(k,'codtotal',dw_2.getitemstring(j,'codtotal'))
		i_st.dw_obj.setitem(k,'descrip',dw_2.getitemstring(j,'descrip'))
		i_st.dw_obj.setitem(k,'monto',dw_2.getitemnumber(j,'a_girar'))
		i_st.dw_obj.setitem(k,'coddoc_orig',dw_2.getitemstring(j,'cdoc_res'))
		i_st.dw_obj.setitem(k,'clugar_orig',dw_2.getitemstring(j,'clug_res'))
		i_st.dw_obj.setitem(k,'numdoc_orig',dw_2.getitemnumber(j,'numdoc'))
		i_st.dw_obj.setitem(k,'item_orig',dw_2.getitemnumber(j,'item'))
		i_st.dw_obj.setitem(k,'monto_vigente',dw_2.getitemnumber(j,'a_girar'))
		i_st.dw_obj.setitem(k,'estado','1')	
	next
	i_st.dw_cab.setitem(1,'objeto',dw_1.getitemstring(donde,'objeto'))
	for j=donde to dw_1.rowcount()
		if dw_1.getitemnumber(j,'ntransferencia')<>nrel then exit
		k=i_st.dw_ter.find('tipodoc="'+dw_1.getitemstring(j,'tipodoc')+'" and documento="'+dw_1.getitemstring(j,'documento')+'"',1,i_st.dw_ter.rowcount())
		if k=0 then
			k=i_st.dw_ter.insertrow(0)
			i_st.dw_ter.setitem(k,'tipodoc',dw_1.getitemstring(j,'tipodoc'))
			i_st.dw_ter.setitem(k,'documento',dw_1.getitemstring(j,'documento'))
			i_st.dw_ter.setitem(k,'coddoc','PG')
			i_st.dw_ter.setitem(k,'clugar',clugar)
		end if
		i_st.dw_ter.setitem(k,'monto',i_st.dw_ter.getitemnumber(k,'monto')+dw_1.getitemnumber(j,'monto'))
		k=i_st.dw_it.insertrow(0)
		i_st.dw_it.setitem(k,'codigo','PGPT-')
		i_st.dw_it.setitem(k,'char_orig1','PT')
		i_st.dw_it.setitem(k,'char_orig2',clug_rel)
		i_st.dw_it.setitem(k,'num_orig1',nrel)
		i_st.dw_it.setitem(k,'num_orig2',dw_1.getitemnumber(j,'item'))
		i_st.dw_it.setitem(k,'char_doc1',i_st.coddoc)
		i_st.dw_it.setitem(k,'char_doc2',clugar)
		i_st.dw_it.setitem(k,'num_doc2',k)
		i_st.dw_it.setitem(k,'valor',dw_1.getitemnumber(j,'monto'))
	next
else
	i_st.dw_cab.setitem(1,'objeto',dw_1.getitemstring(donde,'objeto'))
	for j=donde to dw_1.rowcount()
		if dw_1.getitemnumber(j,'ntransferencia')<>nrel then exit
		k=i_st.dw_ter.find('tipodoc="'+dw_1.getitemstring(j,'tipodoc')+'" and documento="'+dw_1.getitemstring(j,'documento')+'"',1,i_st.dw_ter.rowcount())
		if k=0 then
			k=i_st.dw_ter.insertrow(0)
			i_st.dw_ter.setitem(k,'tipodoc',dw_1.getitemstring(j,'tipodoc'))
			i_st.dw_ter.setitem(k,'documento',dw_1.getitemstring(j,'documento'))
			i_st.dw_ter.setitem(k,'coddoc','PG')
			i_st.dw_ter.setitem(k,'clugar',clugar)
		end if
		i_st.dw_ter.setitem(k,'monto',i_st.dw_ter.getitemnumber(k,'monto')+dw_1.getitemnumber(j,'monto'))
		k=i_st.dw_obj.insertrow(0)
		i_st.dw_obj.setitem(k,'coddoc',i_st.coddoc)
		i_st.dw_obj.setitem(k,'clugar',clugar)
		i_st.dw_obj.setitem(k,'item',k)
		i_st.dw_obj.setitem(k,'cod_vigencia',i_st.cod_vigencia)
		i_st.dw_obj.setitem(k,'codtotal',dw_1.getitemstring(j,'codtotal'))
		i_st.dw_obj.setitem(k,'descrip',dw_1.getitemstring(j,'descrip'))
		i_st.dw_obj.setitem(k,'coddoc_orig',dw_1.getitemstring(j,'char_orig1'))
		i_st.dw_obj.setitem(k,'clugar_orig',dw_1.getitemstring(j,'char_orig2'))
		i_st.dw_obj.setitem(k,'numdoc_orig',dw_1.getitemnumber(j,'num_orig1'))
		i_st.dw_obj.setitem(k,'item_orig',dw_1.getitemnumber(j,'num_orig2'))
		i_st.dw_obj.setitem(k,'monto',i_st.dw_obj.getitemnumber(k,'monto')+dw_1.getitemnumber(j,'monto'))
		i_st.dw_obj.setitem(k,'monto_vigente',i_st.dw_obj.getitemnumber(k,'monto_vigente')+dw_1.getitemnumber(j,'monto'))
		i_st.dw_obj.setitem(k,'estado','1')
		k=i_st.dw_it.insertrow(0)
		i_st.dw_it.setitem(k,'codigo','PGPT-')
		i_st.dw_it.setitem(k,'char_orig1','PT')
		i_st.dw_it.setitem(k,'char_orig2',clug_rel)
		i_st.dw_it.setitem(k,'num_orig1',nrel)
		i_st.dw_it.setitem(k,'num_orig2',dw_1.getitemnumber(j,'item'))
		i_st.dw_it.setitem(k,'char_doc1',i_st.coddoc)
		i_st.dw_it.setitem(k,'char_doc2',clugar)
		i_st.dw_it.setitem(k,'num_doc2',k)
		i_st.dw_it.setitem(k,'valor',i_st.dw_it.getitemnumber(k,'valor')+dw_1.getitemnumber(j,'monto'))
	next
end if
i_st.dw_obj.setrow(i_st.dw_obj.rowcount())
closewithreturn(parent,'ok')
end event

type st_2 from statictext within w_lleva_pago_giro
integer x = 9
integer y = 1104
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rubros de la Recepción:"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_lleva_pago_giro
integer x = 5
integer y = 1160
integer width = 4160
integer height = 468
integer taborder = 20
string title = "none"
string dataobject = "dw_contra_pago_a_giro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_1 from statictext within w_lleva_pago_giro
integer width = 549
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenes de Pago"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_lleva_pago_giro
integer y = 60
integer width = 4169
integer height = 1016
integer taborder = 10
string title = "none"
string dataobject = "dw_trae_pago_xa_giro"
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

event rowfocuschanged;dw_2.reset()
if getrow()<1 then return
if mid(getitemstring(getrow(),'cflujo_recep'),4,3)='SCT' or mid(getitemstring(getrow(),'cflujo_recep'),4,2)='NC' then
	dw_2.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'ntransferencia'),i_st.cod_vigencia)
else
	dw_2.reset()
end if


end event

event itemchanged;if mid(getitemstring(getrow(),'cflujo_recep'),4,3)='SCT' or mid(getitemstring(getrow(),'cflujo_recep'),4,2)='NC' then
	dec val=0,j
	long nrel
	nrel=getitemnumber(getrow(),'ntransferencia')
	i_valor=val
	if data='1' then 
		for j=getrow() to rowcount()
			if nrel<>getitemnumber(j,'ntransferencia') then exit
			val+=getitemnumber(j,'monto')
		next
		i_valor=val
		if dw_2.rowcount()=0 then
			//messagebox('Atención','Esta Recepción de Factura viene de un Contrato de Suministros o Nómina y este no tiene reserva, revise esto (Tabla contra_presu)')
			settext('0')
			setitem(getrow(),'esco',0)
			return 1
		end if
		//val=round(getitemnumber(getrow(),'monto')/dw_2.rowcount(),0)
		val=round(i_valor/dw_2.rowcount(),0)
	end if
	for j=1 to dw_2.rowcount()
		dw_2.setitem(j,'a_girar',val)
	next
end if
end event

event rowfocuschanging;if currentrow<1 then return 0
if getitemnumber(currentrow,'esco')=1 then return 1
end event

