$PBExportHeader$w_kit_viejo.srw
forward
global type w_kit_viejo from window
end type
type dw_deta_kit from datawindow within w_kit_viejo
end type
type dw_areas from datawindow within w_kit_viejo
end type
type pb_cancel from picturebutton within w_kit_viejo
end type
type pb_aceptar from picturebutton within w_kit_viejo
end type
type tab_1 from tab within w_kit_viejo
end type
type tab_1 from tab within w_kit_viejo
end type
end forward

global type w_kit_viejo from window
integer width = 3387
integer height = 2420
boolean titlebar = true
string title = "Cargar Procedimientos Frecuentes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "conf_pag.ico"
boolean clientedge = true
boolean center = true
dw_deta_kit dw_deta_kit
dw_areas dw_areas
pb_cancel pb_cancel
pb_aceptar pb_aceptar
tab_1 tab_1
end type
global w_kit_viejo w_kit_viejo

type variables
long areas
tp_n tp[]
string i_decual
st_proc_comun st_pc
boolean encab
end variables

forward prototypes
public function integer f_factu_reci (singlelineedit p_sle, string p_codigo, string p_tipo, long p_cant, string p_descrip)
public function integer insert_proc (string p_cproced, integer p_cant, string p_descrip, string p_carreta, string p_especialidad)
protected function integer insert_med (string p_cmedica, integer p_cantk, integer p_cant, string p_descrip, string p_codgenerico, string p_carreta, string p_frecuen, string p_administracion)
end prototypes

public function integer f_factu_reci (singlelineedit p_sle, string p_codigo, string p_tipo, long p_cant, string p_descrip);//37 parametros ( p_codigo,p_desproc, p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta, p_estrato, p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
//  p_sec_cant_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat, p_clug_trat, p_item_trat)
string sexo,codta,estrato,autoriza,emp,cont,ctipo,siras
long edad
edad=w_principal.dw_1.getitemnumber(1,'dias')
sexo=w_principal.dw_1.getitemstring(1,'sexo')
estrato=w_principal.dw_1.getitemstring(1,'estrato')
choose case f_vent_padre(p_sle).classname()
	case 'w_factura'
		emp=w_factura.dw_emppac.getitemstring(w_factura.dw_emppac.getrow(),'codemp')
		cont=w_factura.dw_emppac.getitemstring(w_factura.dw_emppac.getrow(),'codcontrato')
		ctipo=w_factura.dw_emppac.getitemstring(w_factura.dw_emppac.getrow(),'tipo_fac')
		autoriza=w_factura.sle_autoriza.text
		codta=w_factura.dw_emppac.getitemstring(w_factura.dw_emppac.getrow(),'codta')
		return w_factura.lf_cargar_a(p_codigo,p_descrip,p_cant,p_tipo,'1',autoriza,emp,cont,0, &
		  '',tipdoc,docu,edad,sexo,codta,estrato,'','','K',1,0, &
		  '',0,'','','',0,'',0,'',0,&
		  0,0,'',0,0,'',0,'','!',0,0,0,'',ctipo,0,'','',0,'0',siras,'')
	case 'w_rec_caja'
		emp=w_rec_caja.dw_emppac.getitemstring(w_rec_caja.dw_emppac.getrow(),'codemp')
		cont=w_rec_caja.dw_emppac.getitemstring(w_rec_caja.dw_emppac.getrow(),'codcontrato')
		autoriza=w_rec_caja.sle_autoriza.text
		codta=w_rec_caja.dw_emppac.getitemstring(w_rec_caja.dw_emppac.getrow(),'codta')
		return w_rec_caja.lf_cargar_a(p_codigo,p_descrip,p_cant,p_tipo,'1',autoriza,emp,cont,0, &
		  '',tipdoc,docu,edad,sexo,codta,estrato,'','','K',1,0, &
		  '',0,'','','',0,'',0,'',0,&
		  0,0,'',0,0,'',0,'','!',0,0,0,'','',0,'','',0,'0',siras,'')
end choose
end function

public function integer insert_proc (string p_cproced, integer p_cant, string p_descrip, string p_carreta, string p_especialidad);if isvalid(st_pc.dw_conducta) then
	st_pc.dw_conducta.setfocus()
	st_pc.dw_conducta.scrolltorow(1)
	st_pc.dw_conducta.setitem(1,'cantidad',p_cant)
	st_pc.dw_conducta.setitem(1,'cproc',p_cproced)
	st_pc.dw_conducta.setcolumn('cproc')
	st_pc.dw_conducta.setitem(1,'observacion',p_carreta)
	st_pc.dw_conducta.setitem(1,'especialidad',p_especialidad)
	st_pc.dw_conducta.settext(p_cproced)
	st_pc.dw_conducta.event itemchanged(1,st_pc.dw_conducta.object.cproc,p_cproced)
	return 1
end if
if isvalid(st_pc.sle_proc) then
	if isvalid(st_pc.sle_cant) then //en evolucion
		st_pc.sle_cant.text=string(p_cant)
		st_pc.sle_proc.text=p_cproced
		st_pc.sle_proc.triggerevent(modified!)
		return 1
	end if
	if isvalid(st_pc.dw_procs) then//en facturacion ,w_atiende_os,salaqx y uo_orden_formula
		if f_vent_padre(st_pc.sle_proc).classname()='w_factura' or f_vent_padre(st_pc.sle_proc).classname()='w_rec_caja' then
			return f_factu_reci(st_pc.sle_proc,p_cproced,'C',p_cant,p_descrip)
		else
			st_pc.sle_proc.text=p_cproced
			st_pc.sle_proc.triggerevent(modified!)
			st_pc.dw_procs.setitem(st_pc.dw_procs.getrow(),st_pc.col_cant_proc,p_cant)
			st_pc.dw_procs.setcolumn(st_pc.col_cant_proc)
			st_pc.dw_procs.triggerevent(itemchanged!)
			return 1
		end if
	end if
	//en uo_serv_ing
	int j
	for j=1 to p_cant
		st_pc.sle_proc.text=p_cproced
		st_pc.sle_proc.triggerevent(modified!)
	next
	return 1
end if
// carga autorizaciones
if isvalid(st_pc.dw_autoriza) then
	int fila,l_item
	l_item=st_pc.dw_autoriza.rowcount()
	if isnull(l_item) then l_item=0
	l_item=l_item+1
	fila=st_pc.dw_autoriza.insertrow(0)
	st_pc.dw_autoriza.SetItem(fila,'item',l_item)
	st_pc.dw_autoriza.SetItem(fila,'codproced',p_cproced)
	st_pc.dw_autoriza.SetItem(fila,'solicitada',p_cant)
	st_pc.dw_autoriza.SetItem(fila,'descripcion',p_descrip)
	return 1
end if
return -1
end function

protected function integer insert_med (string p_cmedica, integer p_cantk, integer p_cant, string p_descrip, string p_codgenerico, string p_carreta, string p_frecuen, string p_administracion);if isvalid(st_pc.dw_conducta) then
	st_pc.dw_conducta.setitem(1,'cantidad',p_cant)
	st_pc.dw_conducta.setitem(1,'cmedica',p_cmedica)
	st_pc.dw_conducta.setcolumn('cmedica')
	st_pc.dw_conducta.setitem(1,'observacion',p_carreta)
	st_pc.dw_conducta.setitem(1,'frecuen',p_frecuen)
	st_pc.dw_conducta.setitem(1,'administracion',p_administracion)
	st_pc.dw_conducta.setitem(1,'cantk',p_cantk)
	st_pc.dw_conducta.triggerevent(itemchanged!)
	return 1
end if
if isvalid(st_pc.sle_proc) then
	if isvalid(st_pc.sle_cant) then //en evolucion
//		st_pc.sle_cant.text=string(p_cant*p_cantk)
		st_pc.sle_cant.text=string(p_cant)
		st_pc.sle_med.text=p_cmedica
		st_pc.sle_med.triggerevent(modified!)
		return 1
	end if
	if isvalid(st_pc.dw_procs) then//en facturacion ,w_atiende_os,salaqx y uo_orden_formula
		if f_vent_padre(st_pc.sle_proc).classname()='w_factura' or f_vent_padre(st_pc.sle_proc).classname()='w_rec_caja' then
			return f_factu_reci(st_pc.sle_proc,p_cmedica,'M',(p_cant*p_cantk),p_descrip)
		else
			st_pc.sle_med.text=p_cmedica
			if not isnull(p_frecuen) or not isnull(p_administracion) then
				g_formula=false
			else
				g_formula=true
			end if
			st_pc.sle_med.triggerevent(modified!)
			st_pc.dw_meds.setitem(st_pc.dw_meds.getrow(),st_pc.col_cant_med,(p_cant*p_cantk))
			st_pc.dw_meds.setitem(st_pc.dw_meds.getrow(),st_pc.frecuen,p_frecuen)
			st_pc.dw_meds.setitem(st_pc.dw_meds.getrow(),st_pc.administracion,p_administracion)
			st_pc.dw_meds.setcolumn(st_pc.col_cant_med)
			st_pc.dw_meds.triggerevent(itemchanged!)
			return 1
		end if
	end if
	//en uo_serv_ing no debe cargar medicamentos
end if
// carga autorizaciones
if isvalid(st_pc.dw_autoriza) then
	int fila,l_item
	l_item=st_pc.dw_autoriza.rowcount()
	if isnull(l_item) then l_item=0
	l_item=l_item+1
	fila=st_pc.dw_autoriza.insertrow(0)
	st_pc.dw_autoriza.SetItem(fila,'item',l_item)
	st_pc.dw_autoriza.SetItem(fila,'c_medica',p_cmedica)
	st_pc.dw_autoriza.SetItem(fila,'solicitada',(p_cant*p_cantk))
	st_pc.dw_autoriza.SetItem(fila,'descripcion',p_descrip)
	return 1
end if
return -1
end function

on w_kit_viejo.create
this.dw_deta_kit=create dw_deta_kit
this.dw_areas=create dw_areas
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.tab_1=create tab_1
this.Control[]={this.dw_deta_kit,&
this.dw_areas,&
this.pb_cancel,&
this.pb_aceptar,&
this.tab_1}
end on

on w_kit_viejo.destroy
destroy(this.dw_deta_kit)
destroy(this.dw_areas)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.tab_1)
end on

event open;long k
st_pc=message.powerobjectparm
if st_pc.carreta='' then 
	st_pc.carreta='0'
	encab=false	
else
	encab=true
end if

areas= dw_areas.retrieve()
string s_u_name
for k=1 to areas
	s_u_name = 'tp_n'
	tab_1.OpenTab(tp[k], s_u_name, 0)
	tp[k].dw_1.retrieve(dw_areas.getitemstring(k,1),st_pc.carreta)
	tp[k].text=dw_areas.getitemstring(k,2)
next

end event

type dw_deta_kit from datawindow within w_kit_viejo
boolean visible = false
integer x = 2112
integer y = 1296
integer width = 1221
integer height = 172
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_ossubdeta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_areas from datawindow within w_kit_viejo
boolean visible = false
integer x = 41
integer y = 24
integer width = 539
integer height = 48
integer taborder = 10
string title = "none"
string dataobject = "dw_osarea"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)

end event

type pb_cancel from picturebutton within w_kit_viejo
integer x = 1742
integer y = 2176
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_kit_viejo
integer x = 1582
integer y = 2172
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar (Llevar a Ordenes)"
end type

event clicked;long k,m,item,deta,subdeta,rs,cc,ll,can_k
string area,descrip
for k=1 to areas
	tp[k].dw_1.accepttext()
	deta=tp[k].dw_1.rowcount()
	for m=1 to deta
		if tp[k].dw_1.getitemstring(m,'esco')='1' then
			if isvalid(st_pc.rte) then
				if not encab then
					if st_pc.rte.Find("Se ordena",TRUE,TRUE,FALSE,FALSE) = 0 then
//						f_pega_a_rtf(st_pc.rte,"~rORDENES MEDICAS~r~n",2)
					end if
					encab=true
				end if
			end if
			choose case tp[k].dw_1.getitemstring(m,'tipo')
				case 'K' //kit
					area=tp[k].dw_1.getitemstring(m,'codarea')
					item=tp[k].dw_1.getitemnumber(m,'item')
					can_k=tp[k].dw_1.getitemnumber(m,'cantidad')
					subdeta=dw_deta_kit.retrieve(area,item)
					if isvalid(st_pc.rte) and m=1 then
						f_pega_a_rtf(st_pc.rte,dw_deta_kit.getitemstring(1,'ordenmedica'),2)
						if tp[k].dw_1.getitemstring(m,'carreta')<>'' then f_pega_a_rtf(st_pc.rte,': '+tp[k].dw_1.getitemstring(m,'carreta')+'~r~n',2)
					end if
					for rs=1 to subdeta
						if isnull(dw_deta_kit.getitemstring(rs,'proced')) then //es medica
							descrip=dw_deta_kit.getitemstring(rs,'medicamento')
							insert_med(dw_deta_kit.getitemstring(rs,'c_medica'),can_k,dw_deta_kit.getitemnumber(rs,'cantidad'),descrip,dw_deta_kit.getitemstring(rs,'codgenerico'),tp[k].dw_1.getitemstring(m,'carreta'),dw_deta_kit.getitemstring(rs,'frecuen'),dw_deta_kit.getitemstring(rs,'administracion'))
						else// es proced
							descrip=dw_deta_kit.getitemstring(rs,'descripcion')
							insert_proc(dw_deta_kit.getitemstring(rs,'proced'),can_k*dw_deta_kit.getitemnumber(rs,'cantidad'),descrip,tp[k].dw_1.getitemstring(m,'carreta'),tp[k].dw_1.getitemstring(m,'espe'))
						end if
					next
					if isvalid(st_pc.rte) then f_pega_a_rtf(st_pc.rte,'~r~n',2)
				case 'P'
					descrip=tp[k].dw_1.getitemstring(m,'descripcion')
					insert_proc(tp[k].dw_1.getitemstring(m,'proced'),tp[k].dw_1.getitemnumber(m,'cantidad'),descrip,tp[k].dw_1.getitemstring(m,'carreta'),tp[k].dw_1.getitemstring(m,'espe'))
					if tp[k].dw_1.getitemstring(m,'carreta')<>'' then 
						f_pega_a_rtf(st_pc.rte,':'+tp[k].dw_1.getitemstring(m,'carreta'),2)
					end if
					if tp[k].dw_1.getitemstring(m,'espe')<>''  then 
						string desp,codi
						codi=tp[k].dw_1.getitemstring(m,'espe')
						SELECT Especialidades.DesEsp into :desp
						FROM Especialidades
						WHERE (((Especialidades.CodEsp)=:codi));
						  f_pega_a_rtf(st_pc.rte,': '+desp,2)
					end if
				case 'M'
					descrip=tp[k].dw_1.getitemstring(m,'descripcion')
					insert_med(tp[k].dw_1.getitemstring(m,'proced'),1,tp[k].dw_1.getitemnumber(m,'cantidad'),descrip,tp[k].dw_1.getitemstring(m,'codgenerico'),tp[k].dw_1.getitemstring(m,'carreta'),tp[k].dw_1.getitemstring(m,'frecuen'),tp[k].dw_1.getitemstring(m,'administracion'))
					if tp[k].dw_1.getitemstring(m,'carreta')<>'' then 
						f_pega_a_rtf(st_pc.rte,':'+tp[k].dw_1.getitemstring(m,'carreta'),2)
					end if
			end choose
		end if
	next
next
close(parent)
end event

type tab_1 from tab within w_kit_viejo
integer x = 32
integer y = 16
integer width = 3310
integer height = 2148
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean multiline = true
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
end type

event selectionchanged;	tp[newindex].dw_1.accepttext()

end event

