$PBExportHeader$w_intfaz_relfact.srw
forward
global type w_intfaz_relfact from window
end type
type pb_cancel from picturebutton within w_intfaz_relfact
end type
type pb_ok from picturebutton within w_intfaz_relfact
end type
type pb_del_imp from picturebutton within w_intfaz_relfact
end type
type pb_insert from picturebutton within w_intfaz_relfact
end type
type pb_del_concep from picturebutton within w_intfaz_relfact
end type
type pb_bajar from picturebutton within w_intfaz_relfact
end type
type dw_dest from datawindow within w_intfaz_relfact
end type
type st_1 from statictext within w_intfaz_relfact
end type
type dw_imp from datawindow within w_intfaz_relfact
end type
type dw_conceps from datawindow within w_intfaz_relfact
end type
type st_2 from statictext within w_intfaz_relfact
end type
type dw_rubros from datawindow within w_intfaz_relfact
end type
type dw_reser from datawindow within w_intfaz_relfact
end type
type st_cuantos from statictext within w_intfaz_relfact
end type
type cbx_1 from checkbox within w_intfaz_relfact
end type
type dw_rela from datawindow within w_intfaz_relfact
end type
type dw_plant from datawindow within w_intfaz_relfact
end type
type gb_1 from groupbox within w_intfaz_relfact
end type
type gb_2 from groupbox within w_intfaz_relfact
end type
type st_3 from statictext within w_intfaz_relfact
end type
end forward

global type w_intfaz_relfact from window
integer width = 4261
integer height = 2304
boolean titlebar = true
string title = "Crear Nueva Recepción de factura"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
pb_del_imp pb_del_imp
pb_insert pb_insert
pb_del_concep pb_del_concep
pb_bajar pb_bajar
dw_dest dw_dest
st_1 st_1
dw_imp dw_imp
dw_conceps dw_conceps
st_2 st_2
dw_rubros dw_rubros
dw_reser dw_reser
st_cuantos st_cuantos
cbx_1 cbx_1
dw_rela dw_rela
dw_plant dw_plant
gb_1 gb_1
gb_2 gb_2
st_3 st_3
end type
global w_intfaz_relfact w_intfaz_relfact

type variables
datawindowchild idw_conceps,idw_plant_imp,idw_iva3,idw_cta3,idw_conceps2,idw_desti
long i_cuantas=0,i_treserv=0
int i_dec_gral,i_aprox_gral
string i_emp,i_docu,i_micro=' Reserva(s) '
end variables

on w_intfaz_relfact.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.pb_del_imp=create pb_del_imp
this.pb_insert=create pb_insert
this.pb_del_concep=create pb_del_concep
this.pb_bajar=create pb_bajar
this.dw_dest=create dw_dest
this.st_1=create st_1
this.dw_imp=create dw_imp
this.dw_conceps=create dw_conceps
this.st_2=create st_2
this.dw_rubros=create dw_rubros
this.dw_reser=create dw_reser
this.st_cuantos=create st_cuantos
this.cbx_1=create cbx_1
this.dw_rela=create dw_rela
this.dw_plant=create dw_plant
this.gb_1=create gb_1
this.gb_2=create gb_2
this.st_3=create st_3
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.pb_del_imp,&
this.pb_insert,&
this.pb_del_concep,&
this.pb_bajar,&
this.dw_dest,&
this.st_1,&
this.dw_imp,&
this.dw_conceps,&
this.st_2,&
this.dw_rubros,&
this.dw_reser,&
this.st_cuantos,&
this.cbx_1,&
this.dw_rela,&
this.dw_plant,&
this.gb_1,&
this.gb_2,&
this.st_3}
end on

on w_intfaz_relfact.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.pb_del_imp)
destroy(this.pb_insert)
destroy(this.pb_del_concep)
destroy(this.pb_bajar)
destroy(this.dw_dest)
destroy(this.st_1)
destroy(this.dw_imp)
destroy(this.dw_conceps)
destroy(this.st_2)
destroy(this.dw_rubros)
destroy(this.dw_reser)
destroy(this.st_cuantos)
destroy(this.cbx_1)
destroy(this.dw_rela)
destroy(this.dw_plant)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.st_3)
end on

event open;i_docu=message.stringparm
dw_dest.setitem(1,1,i_docu)
long j

SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=28));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 28')
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

//i_dec_gral=0
choose case i_docu
	case 'RFCPRPT','RFCPRPG'
		dw_reser.settransobject(sqlca)
		dw_rubros.settransobject(sqlca)
		dw_rubros.retrieve('PR',clugar,'RFC',i_dec_gral)
		for j=1 to dw_rubros.rowcount()
			if isnull(dw_rubros.getitemnumber(j,'a_bajar')) then
				dw_rubros.setitem(j,'a_bajar',dw_rubros.getitemnumber(j,'compute_1'))
			end if
		next
		dw_reser.retrieve('PR',clugar,'RFC')
	case 'RFCPDIPT','RFCPDIPG'
		gb_1.text='Disponibilidades con Monto para Radicar:'
		st_2.text='Rubros de la Disponibilidad:'
		i_micro=' Disponibilidad(es) '
		dw_reser.settransobject(sqlca)
		dw_rubros.settransobject(sqlca)
		dw_reser.retrieve('PDI',clugar,'RFC')
		dw_rubros.retrieve('PDI',clugar,'RFC',i_dec_gral)
end choose
dw_reser.getchild('concep',idw_conceps)
idw_conceps.settransobject(sqlca)
idw_conceps.retrieve(w_recibe_fact.is_emp,'R','1')
dw_reser.getchild('plant_impu',idw_plant_imp)
idw_plant_imp.settransobject(sqlca)
i_emp=w_recibe_fact.is_emp
//string ojo
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\tesoreria", "dec_tes", Regstring!, ojo)
//i_dec_gral=long(ojo)
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\tesoreria", "aprox_tes", Regstring!, ojo)
//i_aprox_gral=long(ojo)

end event

type pb_cancel from picturebutton within w_intfaz_relfact
integer x = 1792
integer y = 2076
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_intfaz_relfact
integer x = 1605
integer y = 2076
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Llevar a recepción"
end type

event clicked;if dw_conceps.rowcount()=0 then return
if i_cuantas=0 then return
long j
for j=1 to dw_rela.rowcount()
	dw_rela.setitem(j,'codigo',dw_dest.getitemstring(1,1))
next
w_recibe_fact.tab_2.selectedtab=3
datawindow dw_t,dw_o
w_recibe_fact.tab_2.t2_3.tab_4.t4_2.dw_tot.reset()
dw_t=w_recibe_fact.tab_2.t2_3.t5.t5_3.dw_tz
dw_t.reset()
dw_t=w_recibe_fact.tab_2.t2_3.tab_4.t4_1.dw_cab
dw_t.reset()
dw_t.insertrow(1)
dw_t.setitem(1,'clugar',w_recibe_fact.is_clug_rad)
dw_t.setitem(1,'cod_flujo',dw_dest.getitemstring(1,1))
dw_t.setitem(1,'coddoc',w_recibe_fact.is_cdoc)
dw_t.setitem(1,'fecha_rel',datetime(today(),now()))
dw_t=w_recibe_fact.tab_2.t2_3.t5.t5_2.dw_anti
dw_t.reset()
dw_t=w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo
dw_t.reset()
dw_o=dw_conceps
dw_o.rowscopy(1,dw_o.rowcount(),primary!,dw_t,1,primary!)
dw_o=dw_imp
dw_t=w_recibe_fact.dw_rela
dw_t.reset()
dw_rela.setfilter('valor>0')
dw_rela.filter()
long ojo
ojo=dw_rela.rowscopy(1,dw_rela.rowcount(),primary!,dw_t,1,primary!)
w_recibe_fact.ibn_cambio=true
w_recibe_fact.ibn_nueva=true
dw_t=w_recibe_fact.tab_2.t2_3.t_ret.t_o.dw_rte
dw_t.reset()
dw_o.rowscopy(1,dw_o.rowcount(),primary!,dw_t,1,primary!)
dw_o.rowscopy(1,dw_o.filteredcount(),filter!,dw_t,1,filter!)
dw_t.triggerevent('p_itemchanged')
w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.triggerevent(rowfocuschanged!)
close(parent)
end event

type pb_del_imp from picturebutton within w_intfaz_relfact
integer x = 4037
integer y = 1732
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar Impuesto"
end type

type pb_insert from picturebutton within w_intfaz_relfact
integer x = 4037
integer y = 1592
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Impuesto"
end type

event clicked;if dw_conceps.rowcount()=0 then return
long donde,j
donde=dw_imp.insertrow(0)
dw_imp.setitem(donde,'clugar',w_recibe_fact.is_clug_rad)
dw_imp.setitem(donde,'coddoc',w_recibe_fact.is_cdoc)
dw_imp.setitem(donde,'item',dw_conceps.getitemnumber(dw_conceps.getrow(),'item'))
dw_imp.setitem(donde,'tipodoc',dw_conceps.getitemstring(dw_conceps.getrow(),'tipodoc'))
dw_imp.setitem(donde,'documento',dw_conceps.getitemstring(dw_conceps.getrow(),'documento'))
for j=1 to dw_imp.rowcount()
	if dw_imp.find('subitem='+string(j),1,dw_imp.rowcount())=0 then exit
next
dw_imp.setitem(donde,'subitem',j)
dw_imp.scrolltorow(donde)
return donde
end event

type pb_del_concep from picturebutton within w_intfaz_relfact
integer x = 4037
integer y = 1072
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Concepto"
end type

event clicked;if dw_conceps.rowcount()=0 then return
do while dw_imp.rowcount()>0
	pb_del_imp.event clicked()
loop
dw_rela.setfilter('num_doc2='+string(dw_conceps.getitemnumber(dw_conceps.getrow(),'item')))
dw_rela.filter()
long j,donde
for j=1 to dw_rela.rowcount()
	donde=dw_reser.find('clugar="'+dw_rela.getitemstring(j,'char_orig2')+'" and numdoc='+string(dw_rela.getitemnumber(j,'num_orig1'))+' and tipodoc="'+dw_rela.getitemstring(j,'char_orig3')+'" and documento="'+dw_rela.getitemstring(j,'char_doc3')+'"',1,dw_reser.rowcount())
	dw_reser.setitem(donde,'acumul',dw_reser.getitemnumber(donde,'acumul') -dw_rela.getitemnumber(j,'valor'))
	dw_rubros.setfilter('clugar="'+dw_rela.getitemstring(j,'char_orig2')+'" and numdoc='+string(dw_rela.getitemnumber(j,'num_orig1'))+' and item='+string(dw_rela.getitemnumber(j,'num_orig2')))
	dw_rubros.filter()
	dw_rubros.setitem(1,'acu',dw_rubros.getitemnumber(1,'acu') - dw_rela.getitemnumber(j,'valor'))
next
do while dw_rela.rowcount()>0
	dw_rela.deleterow(0)
loop
dw_rela.setfilter('')
dw_rela.filter()
dw_conceps.deleterow(0)
dw_conceps.triggerevent (rowfocuschanged!)
dw_reser.event rowfocuschanged(dw_reser.getrow())
end event

type pb_bajar from picturebutton within w_intfaz_relfact
integer x = 4037
integer y = 152
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Generar Conceptos"
end type

event clicked;long j,donde,k,donde2
f_quitafiltro(dw_reser,string(rgb(255,255,255)))
dw_reser.accepttext()
if dw_reser.find('esco=1 and concep="" ',1,dw_reser.rowcount())>0 then
	messagebox("Atención",'Debe escoger el concepto de las reservas a generar')
	return
end if
datawindow dw_t
dw_t=w_recibe_fact.tab_2.t2_2.dw_terce
J=dw_reser.rowcount()
for j=1 to dw_reser.rowcount()
	if dw_reser.getitemnumber(j,'esco')=1 then	
		dw_reser.scrolltorow(j)
		if dw_rubros.rowcount()=0 then continue
		if dw_rubros.getitemnumber(1,'total')=0 then continue
	end if
	if dw_reser.getitemnumber(j,'esco')=1 and dw_reser.getitemnumber(j,'a_llevar')>0 then
		donde=dw_conceps.insertrow(0)
		dw_conceps.setitem(donde,'cod_rel',dw_reser.getitemstring(j,'concep'))
		dw_conceps.setitem(donde,'item',donde)
		dw_conceps.setitem(donde,'clugar',w_recibe_fact.is_clug_rad)
		dw_conceps.setitem(donde,'coddoc',w_recibe_fact.is_cdoc)
		dw_conceps.setitem(donde,'tneto',dw_conceps.getitemnumber(donde,'tneto')+dw_reser.getitemnumber(j,'a_llevar'))
		dw_conceps.setitem(donde,'tbruto',dw_conceps.getitemnumber(donde,'tbruto')+dw_reser.getitemnumber(j,'a_llevar'))
		dw_conceps.setitem(donde,'val_bruto',dw_conceps.getitemnumber(donde,'val_bruto')+dw_reser.getitemnumber(j,'a_llevar'))
		if i_docu='RFCPDIPT' or i_docu='RFCPDIPG' then
			dw_conceps.setitem(donde,'tipodoc',dw_t.getitemstring(1,'tipodoc'))
			dw_conceps.setitem(donde,'documento',dw_t.getitemstring(1,'documento'))
		else
			dw_conceps.setitem(donde,'tipodoc',dw_reser.getitemstring(j,'tipodoc'))
			dw_conceps.setitem(donde,'documento',dw_reser.getitemstring(j,'documento'))
		end if
		dw_conceps.scrolltorow(donde)
		dw_reser.setitem(j,'acumul',dw_reser.getitemnumber(j,'acumul')+dw_reser.getitemnumber(j,'a_llevar'))
		dw_reser.setitem(j,'a_llevar',0)
		dw_reser.setitem(j,'conceps',dw_reser.getitemnumber(j,'conceps')+1)
		for k=1 to dw_rubros.rowcount()
			dw_rubros.setitem(k,'acu',dw_rubros.getitemnumber(k,'acu')+dw_rubros.getitemnumber(k,'a_bajar'))
			dw_rubros.setitem(k,'item_cpo',donde)
			dw_rela.insertrow(1)
			dw_rela.setitem(1,'char_doc1',w_recibe_fact.is_clug_rad)
			dw_rela.setitem(1,'char_doc2',w_recibe_fact.is_cdoc)
			dw_rela.setitem(1,'num_doc2',donde)
			dw_rela.setitem(1,'char_orig1',dw_reser.getitemstring(j,'coddocu'))
			dw_rela.setitem(1,'char_orig2',dw_reser.getitemstring(j,'clugar'))
			dw_rela.setitem(1,'num_orig1',dw_reser.getitemnumber(j,'numdoc'))
			dw_rela.setitem(1,'num_orig2',dw_rubros.getitemnumber(k,'item'))
			dw_rela.setitem(1,'valor',dw_rubros.getitemnumber(k,'a_bajar'))
			dw_rela.setitem(1,'char_orig3',dw_reser.getitemstring(j,'tipodoc'))
			dw_rela.setitem(1,'char_doc3',dw_reser.getitemstring(j,'documento'))
			dw_rubros.setitem(k,'a_bajar',0)
		next
		dw_reser.setitem(j,'esco',0)
		if not isnull(dw_reser.getitemstring(j,'plant_impu')) and dw_reser.getitemstring(j,'plant_impu')<>'' then
			dw_plant.retrieve(dw_reser.getitemstring(j,'concep'),dw_reser.getitemstring(j,'cod_plant'))
			for k=1 to dw_plant.rowcount()
				donde2=dw_imp.find("cod_concep='"+dw_plant.getitemstring(k,'cod_concep')+"'",1,dw_imp.rowcount())
				if donde2=0 then
					donde2=pb_insert.event clicked()
					dw_imp.setrow(donde2)
					dw_imp.setitem(donde2,'cod_concep',dw_plant.getitemstring(k,'cod_concep'))
					dw_imp.setitem(donde2,'cod_total',dw_plant.getitemstring(k,'cod_total'))
					dw_imp.setitem(donde2,'cod_empre',i_emp)
					if i_docu='RFCPDIPT' or i_docu='RFCPDIPG' then
						dw_conceps.setitem(donde,'tipodoc',dw_t.getitemstring(1,'tipodoc'))
						dw_conceps.setitem(donde,'documento',dw_t.getitemstring(1,'documento'))
					else
						dw_conceps.setitem(donde,'tipodoc',dw_reser.getitemstring(j,'tipodoc'))
						dw_conceps.setitem(donde,'documento',dw_reser.getitemstring(j,'documento'))
					end if
				end if
				idw_cta3.retrieve(i_emp,dw_plant.getitemstring(k,'cod_concep'))
				dw_imp.event itemchanged(donde2,dw_imp.object.cod_total,dw_plant.getitemstring(k,'cod_total'))
				dw_imp.event itemchanged(donde2,dw_imp.object.cod_concep,dw_plant.getitemstring(k,'cod_concep'))
			next
		end if
	end if	
next
end event

type dw_dest from datawindow within w_intfaz_relfact
integer x = 238
integer width = 1317
integer height = 88
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_destino"
boolean border = false
boolean livescroll = true
end type

event constructor;object.codigo.protect=1
getchild('codigo',idw_desti)
idw_desti.settransobject(sqlca)
idw_desti.retrieve('RFC')
insertrow(1)

end event

type st_1 from statictext within w_intfaz_relfact
integer x = 37
integer y = 1540
integer width = 558
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impuestos del Concepto:"
boolean focusrectangle = false
end type

type dw_imp from datawindow within w_intfaz_relfact
event p_itemchanged ( string p_cual )
integer x = 32
integer y = 1592
integer width = 3977
integer height = 444
integer taborder = 100
string title = "none"
string dataobject = "dw_trans_retencion_todos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(string p_cual);accepttext()
long j,donde,donde2,k,item
dec base_desde,porcentaje,v_siniva,iva,uvt,valor
string sobre
datawindow dw_t
setredraw(false)
dw_t=dw_conceps
for j=1 to rowcount()
	if getitemstring(j,'accion')='1' then //incrementa
			if p_cual='B' then //base
			iva+=getitemnumber(j,'tvalor')
		else
			donde=idw_iva3.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_iva3.rowcount())
			porcentaje+=idw_iva3.getitemnumber(donde,'porcentaje')
		end if
	end if
next
if p_cual='C' then
	v_siniva=dw_t.getitemNumber(dw_t.getrow(),'tbruto')/(1+porcentaje/100)
	dw_t.setitem(dw_t.getrow(),'val_bruto',v_siniva)
else
	v_siniva=dw_t.getitemNumber(dw_t.getrow(),'tbruto')-iva
	dw_t.setitem(dw_t.getrow(),'val_bruto',v_siniva)
end if
for j=1 to rowcount()
	if p_cual='B' and j=getrow() then continue
	donde=idw_iva3.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_iva3.rowcount())
	base_desde=idw_iva3.getitemnumber(donde,'base')
	porcentaje=idw_iva3.getitemnumber(donde,'porcentaje')
	uvt=idw_iva3.getitemnumber(donde,'uvt')
//	if getitemstring(j,'sobre')='B' then
//		setitem(j,'base',v_siniva)
//		if base_desde<=v_siniva then
//			setitem(j,'tvalor',v_siniva *  porcentaje/100)
//		else
//			setitem(j,'tvalor',0)
//		end if
//	end if
	if getitemstring(j,'sobre')<>'I' then
		if getitemstring(j,'sobre')<>'U' and  getitemstring(j,'sobre')<>'V' then
			if base_desde<=getitemdecimal(j,'base') then
				setitem(j,'tvalor',round(getitemdecimal(j,'base') *  porcentaje/100,i_dec_gral))
			else
				setitem(j,'tvalor',0)
			end if
		else
			valor=dw_t.getitemNumber(dw_t.getrow(),'tbruto')
			valor=f_calc_retfuente(valor,dec(getitemdecimal(j,'base')),uvt, getitemstring(j,'sobre'),getitemstring(j,'cod_concep'),i_dec_gral)
			setitem(j,'tvalor',valor)
		end if
	else
		if base_desde>getitemdecimal(j,'base') then
			setitem(j,'tvalor',0)
		end if
	end if
	if getitemstring(j,'sobre')='O' then
		setitem(1,'asumar',idw_iva3.getitemstring(donde,'cod_sobre'))
		setitem(j,'base',getitemnumber(1,'suma'))
		if base_desde<=getitemnumber(1,'suma') then
			setitem(j,'tvalor',getitemnumber(1,'suma') *  porcentaje/100)
		else
			setitem(j,'tvalor',0)
		end if
	end if
next
setfilter('')
filter()
setfilter('item='+string(dw_t.getitemnumber(dw_t.getrow(),'item')))
filter()
setredraw(true)
////
if rowcount()>0 then
	dw_t.setitem(dw_t.getrow(),'tneto',dw_t.getitemnumber(dw_t.getrow(),'val_bruto')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta'))
else
	dw_t.setitem(dw_t.getrow(),'tneto',dw_t.getitemnumber(dw_t.getrow(),'tbruto'))
end if
dw_t.triggerevent('p_itemchanged')
end event

event constructor;getchild('cod_concep',idw_iva3)
idw_iva3.settransobject(sqlca)
idw_iva3.retrieve()

getchild('cod_total',idw_cta3)
idw_cta3.settransobject(sqlca)
settransobject(sqlca)
end event

event itemchanged;long donde
string acc_ante,sobre,nulo
dec base_desde,porcentaje,actual,valor,uvt,pb_uvt,pc_uvt,pp_uvt

datawindow dw_t
dw_t=dw_conceps
setnull(nulo)
choose case dwo.name
	case 'base'
		if not isnull(getitemstring(row,'cod_concep')) then
			donde=idw_iva3.find('cod_concep="'+getitemstring(row,'cod_concep')+'"',1,idw_iva3.rowcount())
			base_desde=idw_iva3.getitemnumber(donde,'base')
			porcentaje=idw_iva3.getitemnumber(donde,'porcentaje')
			sobre=idw_iva3.getitemstring(donde,'sobre')
			uvt=idw_iva3.getitemnumber(donde,'uvt')
			pb_uvt=idw_iva3.getitemnumber(donde,'porce_baseuvt')
			pc_uvt=idw_iva3.getitemnumber(donde,'porce_cotiuvt')
			pp_uvt=idw_iva3.getitemnumber(donde,'porce_parauvt')
			if sobre<>'I' then
				if base_desde<=dec(data) then
					setitem(row,'tvalor',dec(data) *  porcentaje/100)
				else
					setitem(row,'tvalor',0)
				end if
			else
				if base_desde>dec(data) then
					setitem(row,'tvalor',0)
				end if
			end if
		end if
		event p_itemchanged('B')
	case 'cod_concep'
		if idw_cta3.retrieve(i_emp,data)=1 then
			setitem(row,'cod_total',idw_cta3.getitemstring(1,'codtotal'))
			setitem(row,'cod_empre',i_emp)
		end if
		donde=idw_iva3.find('cod_concep="'+data+'"',1,idw_iva3.rowcount())
		setitem(row,'cod_tipo',idw_iva3.getitemstring(donde,'cod_tipo'))
		setitem(row,'accion',idw_iva3.getitemstring(donde,'accion'))
		setitem(row,'cod_concep',idw_iva3.getitemstring(donde,'cod_concep'))//hay que dejarlo
		sobre=idw_iva3.getitemstring(donde,'sobre')
		setitem(row,'sobre',sobre)
		choose case sobre
			case 'R' //bruto
				setitem(row,'base',dw_t.getitemnumber(dw_t.getrow(),'tbruto'))
			case 'I' //ninguno
				setitem(row,'base',dw_t.getitemnumber(dw_t.getrow(),'val_bruto'))
				setitem(row,'tvalor',idw_iva3.getitemdecimal(donde,'porcentaje'))
			case 'O' //otro (sobre la suma de otros tipos de imp)
				setitem(1,'asumar',idw_iva3.getitemstring(donde,'cod_sobre'))
				setitem(row,'base',getitemnumber(1,'suma'))
				event itemchanged(row,object.base,string(getitemnumber(1,'suma')))
			case 'U','V'   //base UVT
				double base
				if idw_iva3.getitemstring(donde,'accion')='1' then//incrementa
					setitem(row,'tvalor',0)//para que no se sume dos veces
					base=round((dw_t.getitemnumber(dw_t.getrow(),'tbruto')-getitemnumber(1,'t_incrementa'))/(1+idw_iva3.getitemdecimal(donde,'porcentaje')/100),i_dec_gral)
					base=round(((base * pb_uvt)- ((base * pc_uvt) * pp_uvt)),i_dec_gral)
					setitem(row,'base',base)
				else
					base=round(dw_t.getitemnumber(dw_t.getrow(),'val_bruto'),i_dec_gral)
					base=round(((base * pb_uvt)- ((base * pc_uvt) * pp_uvt)),i_dec_gral)
					setitem(row,'base',base)
				end if
			case 'B' //base (v_siniva)
				setitem(row,'base',dw_t.getitemnumber(dw_t.getrow(),'tbruto')-getitemnumber(1,'t_incrementa'))
				dw_t.setitem(dw_t.getrow(),'val_bruto',dw_t.getitemnumber(dw_t.getrow(),'tbruto')-getitemnumber(1,'t_incrementa'))
			case 'N' //neto
				setitem(row,'base',dw_t.getitemnumber(dw_t.getrow(),'tneto'))
		end choose
		event p_itemchanged('C')
	case 'cod_total'
		setitem(row,'cod_empre',i_emp)
		long fila
		fila=idw_cta3.find('codtotal="'+data+'"',1,idw_cta3.rowcount())
		setitem(row,'tercero',idw_cta3.getitemstring(fila,'tercero'))
	case 'tvalor'
		post event p_itemchanged('B')
	case "tipodoc"
		setitem(getrow(),"documento",nulo)
		accepttext()
	case "documento"
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(donde,"tipodoc")
		if isnull(tdoc) then
			setitem(getrow(),"documento",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=gettext()
		setnull(persona)
		SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
		FROM TERCEROS
		WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
		if isnull(persona) then
			if messagebox("Atención","Este Tercero no se encuentra, desea crearlo?",question!,yesno!,2)=2 then
				settext(getitemstring(getrow(),getcolumn()))
				return 1
			else
				st_general messObj
				messObj.valor = getitemstring(getrow(),'tipodoc')
				messObj.documento = doc
				messObj.dw_obj = this
				openwithparm(w_cfgterceros, messObj)
				if message.stringparm='' then 
					settext(getitemstring(getrow(),getcolumn()))
					return 1
				end if
			end if
		else
			setitem(getrow(),"nombre1",nom1)
			setitem(getrow(),"nombre2",nom2)
			setitem(getrow(),"apellido1",ape1)
			setitem(getrow(),"apellido2",ape2)
			setitem(getrow(),"razon_social",rsoc)
			setitem(getrow(),"persona",persona)
		end if
end choose

end event

event rowfocuschanged;if getrow()<1 then return
if not isnull(getitemstring(getrow(),'cod_empre')) then
	idw_cta3.retrieve(getitemstring(getrow(),'cod_empre'),getitemstring(getrow(),'cod_concep'))
else
	idw_cta3.retrieve(i_emp,getitemstring(getrow(),'cod_concep'))
end if
end event

event doubleclicked;string columna
columna=dwo.name
if columna="tipodoc" or columna="documento" then
	g_tercerodesde=19
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		event itemchanged(row,dwo,getitemstring(getrow(),"documento"))
	end if
end if

end event

type dw_conceps from datawindow within w_intfaz_relfact
integer x = 32
integer y = 1072
integer width = 3968
integer height = 472
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tesorelfactcpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;getchild('cod_rel',idw_conceps2)
idw_conceps2.settransobject(sqlca)
idw_conceps2.retrieve(w_recibe_fact.is_emp,'R','1')
object.tdescuentos.visible=0
object.val_bruto.edit.displayonly='yes'
end event

event rowfocuschanged;if getrow()>0 then
	datawindow dw_t
	dw_t=dw_imp
	if isnull(getitemnumber(getrow(),'item')) then
		dw_t.setfilter('isnull(item)')
	else
		dw_t.setfilter('item='+string(getitemnumber(getrow(),'item')))
	end if
	dw_t.filter()
end if

end event

type st_2 from statictext within w_intfaz_relfact
integer x = 32
integer y = 572
integer width = 498
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rubros de la Reserva:"
boolean focusrectangle = false
end type

type dw_rubros from datawindow within w_intfaz_relfact
event p_itemchanged ( )
integer x = 27
integer y = 624
integer width = 3986
integer height = 372
integer taborder = 70
string title = "none"
string dataobject = "dw_reser_cpo_intfaz"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
setredraw(true)
dw_reser.setitem(dw_reser.getrow(),'a_llevar',getitemnumber(1,'total'))
end event

event itemchanged;post event p_itemchanged()
end event

type dw_reser from datawindow within w_intfaz_relfact
event key pbm_dwnkey
integer x = 27
integer y = 152
integer width = 3991
integer height = 420
integer taborder = 40
string title = "none"
string dataobject = "dw_lleva_reser_relfact2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event key;if getcolumnName()<>'plant_impu' then return
if key=keydelete! then setitem(getrow(),'plant_impu','')

end event

event itemchanged;long j
choose case dwo.name
	case 'concep'
		if cbx_1.checked then
			for j=1 to rowcount()
				if j=getrow() then continue
				if (isnull(getitemstring(j,'concep'))or getitemstring(j,'concep')='') and getitemnumber(j,'esco')=1 then
					setitem(j,'concep',data)
				end if
			next
		end if
		string nulo
		setnull(nulo)
		idw_plant_imp.retrieve(data)
		setitem(row,'plant_impu',nulo)
	case 'plant_impu'
		string cod
		cod=idw_plant_imp.getitemstring(idw_plant_imp.getrow(),'cod_plant')
		setitem(row,'cod_plant',cod)
		if cbx_1.checked then
			for j=1 to rowcount()
				if j=getrow() then continue
				if getitemstring(j,'concep')=getitemstring(row,'concep') and getitemnumber(j,'esco')=1 then
					setitem(j,'plant_impu',data)
					setitem(j,'cod_plant',cod)
				end if
			next
		end if
	case 'esco'
		if data='0' then
			i_cuantas --
		else
			i_cuantas ++
		end if
		st_cuantos.text=string(i_cuantas)+i_micro+'seleccionada(s) de '+string(i_treserv)
end choose
accepttext()
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event retrieveend;if rowcount>0 then
	i_cuantas=rowcount
	i_treserv=rowcount
	st_cuantos.text=string(rowcount)+i_micro+'seleccionada(s) de '+string(rowcount)
else
	st_cuantos.text='No hay'+i_micro+'pendientes'
end if
end event

event rowfocuschanged;if getrow()<1 then
	dw_rubros.setfilter('isnull(item)')
else
	dw_rubros.setfilter('clugar="'+getitemstring(getrow(),'clugar')+'" and numdoc='+string(getitemnumber(getrow(),'numdoc'))+' and tipodoc="'+getitemstring(getrow(),'tipodoc')+'" and documento="'+getitemstring(getrow(),'documento')+'"')
	idw_plant_imp.retrieve(getitemstring(getrow(),'concep'))
end if
dw_rubros.filter()
end event

event buttonclicked;string dato='0'
if object.b_1.text='Deselec.' then
	object.b_1.text='Selecc.'
else
	object.b_1.text='Deselec.'
	dato='1'
end if
long j
for j=1 to rowcount()
	setitem(j,'esco',long(dato))
	event itemchanged(j,object.esco,dato)
next
end event

type st_cuantos from statictext within w_intfaz_relfact
integer x = 2139
integer y = 16
integer width = 1170
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_intfaz_relfact
integer x = 1595
integer y = 12
integer width = 448
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Replicar cambios"
end type

type dw_rela from datawindow within w_intfaz_relfact
boolean visible = false
integer x = 3579
integer width = 96
integer height = 128
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_mod_rel_orig"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_plant from datawindow within w_intfaz_relfact
boolean visible = false
integer x = 3095
integer y = 12
integer width = 155
integer height = 52
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_plant_impu_cp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type gb_1 from groupbox within w_intfaz_relfact
integer x = 5
integer y = 88
integer width = 4215
integer height = 936
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reservas Pendientes de Radicar:"
end type

type gb_2 from groupbox within w_intfaz_relfact
integer x = 9
integer y = 1016
integer width = 4215
integer height = 1036
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Conceptos a generar:"
end type

type st_3 from statictext within w_intfaz_relfact
integer x = 27
integer y = 16
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Destino:"
boolean focusrectangle = false
end type

