$PBExportHeader$w_interface_cartera.srw
forward
global type w_interface_cartera from window
end type
type st_2 from statictext within w_interface_cartera
end type
type d1 from dropdownlistbox within w_interface_cartera
end type
type st_1 from statictext within w_interface_cartera
end type
type dw_tipo from datawindow within w_interface_cartera
end type
type pb_2 from picturebutton within w_interface_cartera
end type
type pb_1 from picturebutton within w_interface_cartera
end type
type dw_2 from datawindow within w_interface_cartera
end type
type dw_1 from datawindow within w_interface_cartera
end type
type dw_pend from datawindow within w_interface_cartera
end type
end forward

global type w_interface_cartera from window
integer width = 4311
integer height = 1864
boolean titlebar = true
string title = "Escoger origen de Cartera"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
d1 d1
st_1 st_1
dw_tipo dw_tipo
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
dw_1 dw_1
dw_pend dw_pend
end type
global w_interface_cartera w_interface_cartera

type variables
st_int_cartera st
datawindowchild idw_desc,idw_tipo//,idw_caja
end variables

on w_interface_cartera.create
this.st_2=create st_2
this.d1=create d1
this.st_1=create st_1
this.dw_tipo=create dw_tipo
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.dw_pend=create dw_pend
this.Control[]={this.st_2,&
this.d1,&
this.st_1,&
this.dw_tipo,&
this.pb_2,&
this.pb_1,&
this.dw_2,&
this.dw_1,&
this.dw_pend}
end on

on w_interface_cartera.destroy
destroy(this.st_2)
destroy(this.d1)
destroy(this.st_1)
destroy(this.dw_tipo)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.dw_pend)
end on

event open;st=message.powerobjectparm
if st.origen='1' then //cxp (anticipo)
	idw_tipo.retrieve('A')
	dw_1.dataobject='dw_escoger_contrato'
	dw_2.object.vtotal_t.text='Valor del Anticipo:'
	dw_2.object.vtotal.protect='1'
	dw_2.object.vtdesc.edit.displayonly=true
	d1.visible=true
	st_2.visible=true
	dw_pend.visible=true
	width=4434
	height=1900
	d1.event selectionchanged(1)
elseif st.origen='3' then //cxp (pagares)
	idw_tipo.retrieve('P')
	dw_1.dataobject='dw_pagares_a_cartera'
	dw_2.object.vtdesc.edit.displayonly=true
	width=3049
	height=1300
else//radicaciones
	idw_tipo.retrieve('0')
	dw_1.dataobject='dw_cobrar_radica'
	width=4302
	height=1300
end if
if idw_tipo.rowcount()=0 then
	messagebox("Atención",'No hay datos del tipo necesario (0 ,A ó P) en la tabla Car_Tipo, revisela para poder continuar')
	close(this)
	return
end if
dw_tipo.insertrow(1)
if idw_tipo.rowcount()=1 then	dw_tipo.setitem(1,1,idw_tipo.getitemstring(1,1))
dw_1.settransobject(sqlca)
dw_1.retrieve(st.tdoc,st.docu)
dw_1.event p_itemchanged()

end event

type st_2 from statictext within w_interface_cartera
boolean visible = false
integer x = 50
integer y = 1004
integer width = 174
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Origen:"
boolean focusrectangle = false
end type

type d1 from dropdownlistbox within w_interface_cartera
boolean visible = false
integer x = 229
integer y = 992
integer width = 869
integer height = 324
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"CAJA MAYOR","NOTAS BANCARIAS"}
borderstyle borderstyle = stylelowered!
end type

event constructor;text='CAJA MAYOR'
end event

event selectionchanged;dw_pend.border=true
choose case text
	case 'CAJA MAYOR' //ing directos
		if dw_pend.dataobject<>'dw_ingresos_a_cartera' then
			dw_pend.dataobject='dw_ingresos_a_cartera'
			dw_pend.settransobject(sqlca)
		end if
	case 'NOTAS BANCARIAS' //Notas
		if dw_pend.dataobject<>'dw_notas_a_cart_2' then
			dw_pend.dataobject='dw_notas_a_cart_2'
			dw_pend.settransobject(sqlca)
		end if
	
end choose
dw_pend.retrieve(st.tdoc,st.docu)

end event

type st_1 from statictext within w_interface_cartera
integer x = 101
integer y = 16
integer width = 114
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo:"
boolean focusrectangle = false
end type

type dw_tipo from datawindow within w_interface_cartera
integer x = 201
integer y = 8
integer width = 1138
integer height = 92
integer taborder = 10
string dataobject = "dw_combo_tipocart"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('cartipo',idw_tipo)
idw_tipo.settransobject(sqlca)

end event

type pb_2 from picturebutton within w_interface_cartera
integer x = 2917
integer y = 796
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_interface_cartera
integer x = 2766
integer y = 796
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar y llevar a Cartera"
end type

event clicked;dw_tipo.accepttext()
dw_2.accepttext()
if isnull(dw_tipo.getitemstring(1,1)) then
	messagebox('Atención', 'Elija el tipo de Cobro a realizar')
	return
end if
if dw_2.getitemnumber(1,'vt_cobrar')<=0 then
	messagebox('Atención', 'No hay valor para cobrar')
	return
end if
if dw_2.getitemnumber(1,'vtdesc')>0 and isnull(dw_2.getitemstring(1,'tipo_desc')) then
	messagebox("Atención",'Elija el tipo de descuento')
	return
end if
if st.origen='1' then
	if dw_pend.rowcount()=0 then return
	if dw_pend.getitemnumber(1,'total')<>dw_2.getitemnumber(1,'vt_cobrar') then
		messagebox('Atención','Los valores totales no son iguales')
		return
	end if
end if
datawindow dw,dw_des,dw_pag,dw_antis
dw_pag=w_teso_cartera.tab_1.tp_pag.tab_2.tp_1.dw_pagos
dw=w_teso_cartera.tab_1.tp_det.dw_det
long j,donde,k=1
choose case st.origen
	case '1' //cxp anticipo
		if dw_1.describe("evaluate('sum(esco for all)',0)")='0' then
			messagebox('Atención','Debe escoger un contrato al que se le realizará el anticipo')
			return
		end if
		w_teso_cartera.tab_1.tp_1a.dw_anti_nota.reset()
		w_teso_cartera.tab_1.tp_1a.dw_anti_nota.visible=false
		w_teso_cartera.tab_1.tp_1a.dw_anti_pagodir.reset()
		w_teso_cartera.tab_1.tp_1a.dw_anti_pagodir.visible=false
		if d1.text='NOTAS BANCARIAS' then
			dw_antis=w_teso_cartera.tab_1.tp_1a.dw_anti_nota
		else
			dw_antis=w_teso_cartera.tab_1.tp_1a.dw_anti_pagodir
		end if
		dw_antis.visible=true
		dw_antis.setredraw(true)
		dw.dataobject='dw_car_cpo_anti'
		dw.settransobject(sqlca)
		j=dw_1.find('esco=1',1,dw_1.rowcount())
		if  j > 0 then
			dw.insertrow(1)
			dw.setitem(1,'valor',dw_2.getitemnumber(1,'vtotal'))
			dw.setitem(1,'cartipo',dw_tipo.getitemstring(1,1))
			dw.setitem(1,'fecha',datetime(today(),now()))
			dw.setitem(1,'fecha_audita',datetime(today(),now()))			
			dw.setitem(1,'usuario',usuario)
			dw.setitem(1,'codemp',dw_1.getitemstring(j,'codemp'))
			dw.setitem(1,'codcontrato',dw_1.getitemstring(j,'codcontrato'))
			dw.setitem(1,'descontrato',dw_1.getitemstring(j,'descontrato'))
			dw.setitem(1,'desemp',dw_1.getitemstring(j,'desemp'))
		//	j=dw_1.find('esco=1',1,dw_1.rowcount())
			for j=1 to dw_pend.rowcount()
				if dw_pend.getitemnumber(j,'registrar')=0 then continue
				dw_antis.insertrow(1)
				dw_antis.setitem(1,'valor',dw_pend.getitemnumber(j,'registrar'))
				if d1.text='NOTAS BANCARIAS' then
					dw_antis.setitem(1,'codbanco',dw_pend.getitemstring (j,'codbanco'))
					dw_antis.setitem(1,'tipo_cuenta',dw_pend.getitemstring (j,'tipo_cuenta'))
					dw_antis.setitem(1,'numcuenta',dw_pend.getitemstring (j,'numcuenta'))
					dw_antis.setitem(1,'item',dw_pend.getitemnumber(j,'item'))
					dw_antis.setitem(1,'cartipo',dw_tipo.getitemstring(1,'cartipo'))
					dw_antis.setitem(1,'clugar',dw_pend.getitemstring (j,'clugar'))
				else
					dw_antis.setitem(1,'codcaja',dw_pend.getitemstring (j,'codcaja'))
					dw_antis.setitem(1,'clugar',dw_pend.getitemstring (j,'clugar'))
					dw_antis.setitem(1,'coddoc',dw_pend.getitemstring (j,'coddoc'))
					dw_antis.setitem(1,'ningreso',dw_pend.getitemnumber (j,'ningreso'))
					dw_antis.setitem(1,'cartipo',dw_tipo.getitemstring(1,'cartipo'))
				end if
			next
		end if
	case '3' //pagares
		dw_pag=w_teso_cartera.dw_cab
		j=dw_1.find('esco=1',1,dw_1.rowcount())
		dw_pag.setitem(1,'npagare',dw_1.getitemnumber(j,'npagare'))
		dw_pag.setitem(1,'clug_pag',dw_1.getitemstring(j,'clugar'))
		dw_pag.setitem(1,'vtcancelar',dw_1.getitemnumber(j,'total'))
		dw.reset()
//		dw.dataobject='dw_car_cpo_pagare'
//		dw.settransobject(sqlca)
//		dw.insertrow(1)
//		dw.setitem(1,'valor',dw_2.getitemnumber(1,'vtotal'))
//		dw.setitem(1,'cartipo',dw_tipo.getitemstring(1,1))
	case '0' //radicaciones
		dw.dataobject='dw_car_cpo_radica'
		string ls_cta,ls_cem
		dw.settransobject(sqlca)
		j=dw_1.find('esco=1',1,dw_1.rowcount())
		do while j > 0
			if dw_1.getitemnumber(j,'esco')=0 or long(dw_1.describe('evaluate("cumulativeSum( 1 for group 1 )",'+string(j)+')'))>1 then 
				j=dw_1.find('esco=1',1,dw_1.rowcount()) 
			else
				ls_cta=dw_1.getitemstring(j,'contratos_cod_empre_pxc')
				ls_cem=	dw_1.getitemstring(j,'contratos_codtotal_pxc')
				
				if ls_cta<>dw_1.getitemstring(k,'contratos_cod_empre_pxc') then
					messagebox('Atención','Cuentas contables diferentes')
					return
				end if
				
				dw.insertrow(1)
				dw.setitem(1,'num_radicacion',dw_1.getitemnumber(j,'num_radicacion'))
				dw.setitem(1,'clugar_rad',dw_1.getitemstring(j,'clugar'))
				dw.setitem(1,'tipo_rad',dw_1.getitemstring(j,'tipo_rad'))
				if isnull(dw_1.getitemnumber(j,'valor_evento')) then dw_1.setitem(j,'valor_evento',0)
				if isnull(dw_1.getitemnumber(j,'valor_capita')) then dw_1.setitem(j,'valor_capita',0)
				dw.setitem(1,'valor',dw_1.getitemnumber(j,'valores'))//+dw_1.getitemnumber(j,'valor_capita'))
				dw.setitem(1,'cartipo',dw_tipo.getitemstring(1,1))
				dw.setitem(1,'fecha',datetime(today(),now()))
				dw.setitem(1,'fecha_audita',datetime(today(),now()))				
				dw.setitem(1,'usuario',usuario)
				dw.setitem(1,'desemp',dw_1.getitemstring(j,'desemp'))
				dw_1.setitem(j,'esco',0)
				k=j
			end if
		loop
end choose
if dw_2.getitemnumber(1,'vtdesc')>0 then
	dw_des=w_teso_cartera.tab_1.tp_des.dw_des
	j=w_teso_cartera.tab_1.tp_des.pb_newdes.event clicked()
	dw_des.setitem(j,'valor',dw_2.getitemnumber(1,'vtdesc'))
	dw_des.setitem(j,'cartipo',dw_2.getitemstring(1,'tipo_desc'))
	dw_des.setitem(j,'fecha',datetime(today(),now()))
	dw_des.setitem(j,'fecha_audita',datetime(today(),now()))	
	dw_des.setitem(j,'usuario',usuario)
	dw_des.event itemchanged(j,dw_des.object.valor,string(dw_2.getitemnumber(1,'vtdesc')))
end if
if st.origen='0' then
	dw_des=w_teso_cartera.dw_cab
	dw_des.setitem(1,'cod_empresa',ls_cta)
	dw_des.setitem(1,'cta_contable',ls_cem)
	dw_des.setitem(1,'nro_soporte',string(dw_1.getitemnumber(dw_1.getrow(),'num_radicacion')))
end if
if st.origen<>'3' then w_teso_cartera.calc_totales()
close(parent)
end event

type dw_2 from datawindow within w_interface_cartera
event key pbm_dwnkey
integer x = 160
integer y = 796
integer width = 2546
integer height = 192
integer taborder = 20
string title = "none"
string dataobject = "dw_tot_cobrar"
boolean border = false
boolean livescroll = true
end type

event key;if getcolumnName()='tipo_desc' and key=keydelete! then
	string nulo
	setnull(nulo)
	setitem(1,'tipo_desc',nulo)
end if
end event

event constructor;getchild('tipo_desc',idw_desc)
idw_desc.settransobject(sqlca)
settransobject(sqlca)
insertrow(1)
if idw_desc.retrieve('2')=1 then setitem(1,'tipo_desc',idw_desc.getitemstring(1,1))

end event

event itemchanged;post  setredraw(true)
end event

type dw_1 from datawindow within w_interface_cartera
event p_itemchanged ( )
integer x = 101
integer y = 120
integer width = 4119
integer height = 660
integer taborder = 10
string title = "none"
string dataobject = "dw_cobrar_radica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
if dataobject<>'dw_cobrar_radica' and dataobject<>'dw_pagares_a_cartera' then 
	setredraw(true)
	return
end if
long fila,vpos
vpos = long(Object.DataWindow.VerticalScrollPosition)
fila = getrow()
groupcalc()
scrolltorow(fila)
Object.DataWindow.VerticalScrollPosition=string(vpos)
if rowcount()>0 then
	dw_2.setitem(1,'vtotal',getitemnumber(1,'total'))
else
	dw_2.setitem(1,'vtotal',0)
end if
setredraw(true)

end event

event retrieveend;post event p_itemchanged()

end event

event itemchanged;long fila
acceptText()
setredraw(false)
if dwo.name = 'esco' and dataObject = 'dw_cobrar_radica' then
	fila = find("esco=1",1,rowCount())
	do while fila > 0
		if fila <> row then setItem(fila,'esco','0')
		if fila + 1 > rowCount() then EXIT
		fila = find("esco=1",fila + 1,rowCount())
	loop
end if

post event p_itemchanged()

end event

event buttonclicked;long esco=0,j
if dataObject = 'dw_cobrar_radica' then return 0
if dwo.text='Desele.' then
	dwo.text='Selecc.'
else
	dwo.text='Desele.'
	esco=1
end if
for j=1 to rowcount()
	setitem(j,'esco',esco)
next
event p_itemchanged()

end event

event rowfocuschanged;Event p_itemchanged()

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event clicked;if dwo.name='esco' then
	long fila
	setredraw(false)
	if dataObject = 'dw_cobrar_radica' then
		fila = find("esco=1",1,rowCount())
		do while fila > 0
			if fila <> row then setItem(fila,'esco','0')
			if fila + 1 > rowCount() then EXIT
			fila = find("esco=1",fila + 1,rowCount())
		loop
	end if
	post event p_itemchanged()
end if

end event

type dw_pend from datawindow within w_interface_cartera
boolean visible = false
integer x = 5
integer y = 1112
integer width = 4160
integer height = 648
integer taborder = 40
string title = "none"
string dataobject = "dw_ingresos_a_cartera"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event itemchanged;accepttext()
if st.origen='1' then //cxp (anticipo)
	dw_2.setitem(1,'vtotal',dw_pend.getitemnumber(1,'total'))
end if
end event

