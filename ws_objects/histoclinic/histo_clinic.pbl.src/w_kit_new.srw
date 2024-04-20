$PBExportHeader$w_kit_new.srw
forward
global type w_kit_new from window
end type
type dw_kits from datawindow within w_kit_new
end type
type pb_cancel from picturebutton within w_kit_new
end type
type pb_aceptar from picturebutton within w_kit_new
end type
type dw_deta_kit from datawindow within w_kit_new
end type
end forward

global type w_kit_new from window
integer width = 3209
integer height = 1768
boolean titlebar = true
string title = "Cargar KITS"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "conf_pag.ico"
boolean clientedge = true
boolean center = true
dw_kits dw_kits
pb_cancel pb_cancel
pb_aceptar pb_aceptar
dw_deta_kit dw_deta_kit
end type
global w_kit_new w_kit_new

type variables
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
		  0,0,'',0,0,'',0,'','!',0,0,0,'',ctipo,0,'','',0,'0',siras)
	case 'w_rec_caja'
		emp=w_rec_caja.dw_emppac.getitemstring(w_rec_caja.dw_emppac.getrow(),'codemp')
		cont=w_rec_caja.dw_emppac.getitemstring(w_rec_caja.dw_emppac.getrow(),'codcontrato')
		autoriza=w_rec_caja.sle_autoriza.text
		codta=w_rec_caja.dw_emppac.getitemstring(w_rec_caja.dw_emppac.getrow(),'codta')
		return w_rec_caja.lf_cargar_a(p_codigo,p_descrip,p_cant,p_tipo,'1',autoriza,emp,cont,0, &
		  '',tipdoc,docu,edad,sexo,codta,estrato,'','','K',1,0, &
		  '',0,'','','',0,'',0,'',0,&
		  0,0,'',0,0,'',0,'','!',0,0,0,'','',0,'','',0,'0',siras)
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
		st_pc.sle_cant.text=string(p_cant*p_cantk)
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

on w_kit_new.create
this.dw_kits=create dw_kits
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.dw_deta_kit=create dw_deta_kit
this.Control[]={this.dw_kits,&
this.pb_cancel,&
this.pb_aceptar,&
this.dw_deta_kit}
end on

on w_kit_new.destroy
destroy(this.dw_kits)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.dw_deta_kit)
end on

event open;st_pc=message.powerobjectparm
if st_pc.carreta='' then 
	st_pc.carreta='0'
	encab=false	
else
	encab=true
end if
dw_kits.retrieve(st_pc.carreta)

end event

type dw_kits from datawindow within w_kit_new
integer x = 37
integer y = 32
integer width = 3067
integer height = 1460
integer taborder = 50
string dataobject = "dw_kits_arbol"
boolean vscrollbar = true
boolean border = false
borderstyle borderstyle = styleraised!
end type

event constructor;settransobject(sqlca)
end event

event clicked;choose case dwo.name
	case "descripcion"
String ls_ret
long indentVal

ls_ret = dw_kits.Object.DataWindow.Tree.indent
		
		
//		int li_ret
//		li_ret=dw_kits.getrow()
////		st_1.text=string(row)+'---'+string(dw_kits.getrow())+'---'+dwo.name
//
//		if dw_kits.IsExpanded(li_ret,1) then 
//			dw_kits.CollapseAllChildren( li_ret,1)
//		else
//			li_ret = dw_kits.ExpandAllChildren(li_ret ,1)
//		end if

	case "p_1"
		if not isvalid(w_deta_kit) then
			string area
			long item
			area=this.getitemstring(row,'codarea')
			item=this.getitemnumber(row,'item')
			open(w_deta_kit)
			w_deta_kit.dw_1.retrieve(area,item)
			w_deta_kit.setfocus()
		end if
end choose
end event

event doubleclicked;//st_1.text=string(row)+'---'+string(dw_kits.getrow())+'---'+dwo.name

end event

event buttonclicked;if dw_kits.IsExpanded(row,1) then 
	dw_kits.CollapseAllChildren( row,1)
	scroll(row)
else
	dw_kits.ExpandAllChildren(row,1)
end if
scrolltorow(Row)
end event

type pb_cancel from picturebutton within w_kit_new
integer x = 1431
integer y = 1524
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

type pb_aceptar from picturebutton within w_kit_new
integer x = 1280
integer y = 1524
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

event clicked;long k,item,deta,subdeta,rs,cc,ll,can_k
string area,descrip
dw_kits.SetRedraw(false)
dw_kits.accepttext()
dw_kits.setfilter("esco='1'")
dw_kits.Filter( ) 
for k=1 to dw_kits.rowcount()
	if isvalid(st_pc.mle) then
		if not encab then
			if pos(st_pc.mle.text,"Se ordena",1) = 0 then
				f_pega_a_mle(st_pc.mle,"~rORDENES MEDICAS~r~n",2)
			end if
			encab=true
		end if
	end if
	choose case dw_kits.getitemstring(k,'tipo')
		case 'K' //kit
			area=dw_kits.getitemstring(k,'codarea')
			item=dw_kits.getitemnumber(k,'item')
			can_k=dw_kits.getitemnumber(k,'cantidad')
			subdeta=dw_deta_kit.retrieve(area,item)
			if isvalid(st_pc.mle) and k=1 then
				f_pega_a_mle(st_pc.mle,dw_deta_kit.getitemstring(1,'ordenmedica'),2)
				if dw_kits.getitemstring(k,'carreta')<>'' then f_pega_a_mle(st_pc.mle,': '+dw_kits.getitemstring(k,'carreta')+'~r~n',2)
			end if
			for rs=1 to subdeta
				if isnull(dw_deta_kit.getitemstring(rs,'proced')) then //es medica
					descrip=dw_deta_kit.getitemstring(rs,'medicamento')
					insert_med(dw_deta_kit.getitemstring(rs,'c_medica'),can_k,dw_deta_kit.getitemnumber(rs,'cantidad'),descrip,dw_deta_kit.getitemstring(rs,'codgenerico'),dw_kits.getitemstring(k,'carreta'),dw_deta_kit.getitemstring(rs,'frecuen'),dw_deta_kit.getitemstring(rs,'administracion'))
				else// es proced
					descrip=dw_deta_kit.getitemstring(rs,'descripcion')
					insert_proc(dw_deta_kit.getitemstring(rs,'proced'),can_k*dw_deta_kit.getitemnumber(rs,'cantidad'),descrip,dw_kits.getitemstring(k,'carreta'),dw_kits.getitemstring(k,'espe'))
				end if
			next
			if isvalid(st_pc.mle) then f_pega_a_mle(st_pc.mle,'~r~n',2)
		case 'P'
			descrip=dw_kits.getitemstring(k,'descripcion')
			insert_proc(dw_kits.getitemstring(k,'proced'),dw_kits.getitemnumber(k,'cantidad'),descrip,dw_kits.getitemstring(k,'carreta'),dw_kits.getitemstring(k,'espe'))
			if dw_kits.getitemstring(k,'carreta')<>'' then 
				f_pega_a_mle(st_pc.mle,':'+dw_kits.getitemstring(k,'carreta'),2)
			end if
			if dw_kits.getitemstring(k,'espe')<>''  then 
				string desp,codi
				codi=dw_kits.getitemstring(k,'espe')
				SELECT Especialidades.DesEsp into :desp
				FROM Especialidades
				WHERE (((Especialidades.CodEsp)=:codi));
				  f_pega_a_mle(st_pc.mle,': '+desp,2)
			end if
		case 'M'
			descrip=dw_kits.getitemstring(k,'descripcion')
			insert_med(dw_kits.getitemstring(k,'proced'),1,dw_kits.getitemnumber(k,'cantidad'),descrip,dw_kits.getitemstring(k,'codgenerico'),dw_kits.getitemstring(k,'carreta'),dw_kits.getitemstring(k,'frecuen'),dw_kits.getitemstring(k,'administracion'))
			if dw_kits.getitemstring(k,'carreta')<>'' then 
				f_pega_a_mle(st_pc.mle,':'+dw_kits.getitemstring(k,'carreta'),2)
			end if
		end choose
next
dw_kits.SetRedraw(true)
close(parent)

end event

type dw_deta_kit from datawindow within w_kit_new
boolean visible = false
integer x = 1577
integer y = 316
integer width = 1221
integer height = 308
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_ossubdeta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

