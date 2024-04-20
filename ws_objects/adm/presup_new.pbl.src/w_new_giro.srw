$PBExportHeader$w_new_giro.srw
forward
global type w_new_giro from w_docum_base1
end type
type pb_intf from picturebutton within tp_1
end type
end forward

global type w_new_giro from w_docum_base1
string tag = "Realizó cambios al Giro Presupuestal. Desea guardar los cambios?"
string title = "Presupuesto - Giro"
string icon = "ribon_girop.ico"
string i_ing_gasto1 = "0"
string i_ing_gasto2 = "1"
string i_cdoc = "PG"
string i_desdoc = "Giro Presupuestal"
end type
global w_new_giro w_new_giro

forward prototypes
public function integer f_anula ()
public function integer grabar ()
public function integer grabar_def ()
end prototypes

public function integer f_anula ();string estado
estado = dw_cab.GetItemString(dw_cab.GetRow(),'estado')
if super :: f_anula()=1 then
	// Si estaba grabado temporal no debe afectar las reservas
	if estado = '0' then Return 0
	long j,ndoc,cuantos,item,item2,per
	string clug,cdoc,err,codigo
	dec valor
	per=month(today())
	for j=1 to tb_1.tp_2.dw_rub.rowcount()
		cdoc=tb_1.tp_2.dw_rub.getitemstring(j,'coddoc_orig')
		clug=tb_1.tp_2.dw_rub.getitemstring(j,'clugar_orig')
		ndoc=tb_1.tp_2.dw_rub.getitemnumber(j,'numdoc_orig')
		item=tb_1.tp_2.dw_rub.getitemnumber(j,'item_orig')
		valor=tb_1.tp_2.dw_rub.getitemnumber(j,'monto_vigente')
		update pre_docu_cp set monto_utilizado=monto_utilizado -:valor where
		coddoc =:cdoc and clugar =:clug and numdoc =:ndoc and item=:item;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando monto_vigente en f_anula',err)
			return -1
		end if
	next
	uo_datastore dw_cb,dw_mov
	dw_cb=create uo_datastore
	dw_mov=create uo_datastore
	dw_cb.dataobject='dw_anula_doc_sub'
	dw_mov.dataobject='dw_anula_mvtos_sub'
	dw_cb.settransobject(sqlca)
	dw_mov.settransobject(sqlca)
	dw_cb.retrieve(dw_cab.getitemstring(1,'coddoc'),dw_cab.getitemstring(1,'clugar'),dw_cab.getitemnumber(1,'numdoc'))
	dw_mov.retrieve(dw_cab.getitemstring(1,'coddoc'),dw_cab.getitemstring(1,'clugar'),dw_cab.getitemnumber(1,'numdoc'))
	//si este giro creo una reserva los anteriores retrieves traen datos y se deben anular esas reservas
	
	cuantos=dw_mov.rowcount()
	for j=1 to cuantos
		codigo=dw_mov.getitemstring(j,'codtotal')
		dw_mov.rowscopy(j,j,primary!,dw_mov,dw_mov.rowcount()+1,primary!)
		dw_mov.setitem(dw_mov.rowcount(),'monto_reserva',dw_mov.getitemnumber(j,'monto_reserva')* -1)
		
		dw_mov.setitem(dw_mov.rowcount(),'periodo',per)
		dw_mov.setitem(dw_mov.rowcount(),'fecha',datetime(today(),now()))
		SELECT Max(pre_plan_movi_deta.num_movi) into :item2
		FROM pre_plan_movi_deta
		WHERE pre_plan_movi_deta.cod_vigencia=:i_vigencia AND pre_plan_movi_deta.CodTotal=:codigo
		AND pre_plan_movi_deta.periodo=:per;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error leyendo pre_plan_movi_deta',err)
			destroy(dw_cb)
			destroy(dw_mov)
			return -1
		end if
		if isnull(item2) then item2=0 
		item2++
		dw_mov.setitem(dw_mov.rowcount(),'num_movi',item2) 
		if dw_mov.update()=-1 then 
			destroy(dw_cb)
			destroy(dw_mov)
			return -1
		end if
	next
	for j=1 to dw_cb.rowcount()
		dw_cb.setitem(j,'estado','3')
		dw_cb.setitem(j,'anulado',usuario)
		dw_cb.setitem(j,'fechaanula',datetime(today(),now()))
		dw_cb.setitem(j,'motiv_anula',dw_cab.getitemstring(1,'motiv_anula'))
	next
	if dw_cb.update()=-1 then 
		destroy(dw_cb)
		destroy(dw_mov)
		return -1
	end if
	string tabla
	long nrel
	for j=1 to tb_1.tp_1.dw_intf.rowcount()
		nrel=tb_1.tp_1.dw_intf.getitemnumber(j,'num_orig1')
		clug=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig2')
		cdoc=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig1')
		
		choose case dw_cab.getitemstring(1,'cod_flujo')
			case 'PGRFCPT'
				tabla='Tesorelfact'
				update tesorelfact set en_destino='0' where 
				clugar=:clug and coddoc =:cdoc and nrelacion=:nrel;
			case 'PGRP-'
				tabla='tesocajareposicion'
				update tesocajareposicion set en_destino='0' where 
				clugar=:clug and coddoc =:cdoc and nreposicion=:nrel;
			case 'PGPR-'
				tabla='pre_docu_cb'
				update pre_docu_cb set en_destino='0' where 
				clugar=:clug and coddoc =:cdoc and numdoc=:nrel;
			case 'PGPT-'
				tabla='Tesotranscab'
				update tesotranscab set en_destino='0' where 
				clugar=:clug and coddoc =:cdoc and ntransferencia=:nrel;
		end choose
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando en destino de '+tabla,err)
			return -1
		end if		
	next
	commit;
	destroy(dw_cb)
	destroy(dw_mov)
	return 1
else
	rollback;
	return -1
end if
end function

public function integer grabar ();if super :: grabar()=1 then
	commit;
	return 1
else
	rollback;
	return -1
end if
end function

public function integer grabar_def ();if super::grabar_def()=-1 then return -1
if isnull(dw_cab.getitemstring(1,'cod_flujo')) then
	messagebox('Atención','No ha escogido flujo del documento')
	return -1
end if
if isnull(dw_cab.getitemdatetime(1,'fecha_consecu')) then
	messagebox('Atención','No ha escogido fecha del documento')
	return -1
end if
if month(date(dw_cab.getitemdatetime(1,'fecha_consecu')))<>i_periodo then
	messagebox('Atención','El giro tiene fecha en mes diferente al del periodo')
	return -1
end if
if tb_1.tp_2.dw_rub.rowcount()=0 then
	messagebox('Atención','El giro no tiene Rubros, adicionele para guardar Definitivo')
	return -1
end if

long j,final,donde,item,nrel
string clug,cdoc
dec valor
for j=1 to tb_1.tp_2.dw_rub.rowcount()
	if tb_1.tp_2.dw_rub.getitemnumber(j,'monto')=0 then
		messagebox('Atención','Existen Rubros con montos en cero Revise para continuar')
		return -1
	end if
next
final = f_consec(i_vigencia,i_cdoc,cLugar)
if final = -1 then 
	MessageBox('Error','Imposible asignar consecutivo al documento - PRE_CONSECS')
	Rollback;
	Return -1
End if
dw_movi.reset()
string codigo,err
for j=1 to tb_1.tp_2.dw_rub.rowcount()
	donde=dw_movi.insertrow(0)
	dw_movi.setitem(donde,'cod_vigencia',i_vigencia)
	dw_movi.setitem(donde,'año',i_año)
	codigo=tb_1.tp_2.dw_rub.getitemstring(j,'codtotal')
	dw_movi.setitem(donde,'codtotal',codigo)
	dw_movi.setitem(donde,'periodo',i_periodo)
	dw_movi.setitem(donde,'fecha',datetime(today(),now()))
	dw_movi.setitem(donde,'coddoc',i_cdoc)
	dw_movi.setitem(donde,'clugar',tb_1.tp_2.dw_rub.getitemstring(j,'clugar'))
	dw_movi.setitem(donde,'numdoc',dw_cab.getitemnumber(1,'numdoc'))
	dw_movi.setitem(donde,'item',tb_1.tp_2.dw_rub.getitemnumber(j,'item'))
	dw_movi.setitem(donde,'monto_girado',tb_1.tp_2.dw_rub.getitemnumber(j,'monto'))
	
	SELECT Max(pre_plan_movi_deta.num_movi) into :item
	FROM pre_plan_movi_deta
	WHERE pre_plan_movi_deta.cod_vigencia=:i_vigencia AND pre_plan_movi_deta.CodTotal=:codigo
	AND pre_plan_movi_deta.periodo=:i_periodo;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo pre_plan_movi_deta',err)
		return -1
	end if
	if isnull(item) then item=0 
	item++
	dw_movi.setitem(donde,'num_movi',item) 
	if dw_movi.update()=-1 then return -1
next
string tabla
for j=1 to tb_1.tp_1.dw_intf.rowcount()
	nrel=tb_1.tp_1.dw_intf.getitemnumber(j,'num_orig1')
	clug=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig2')
	cdoc=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig1')
	choose case dw_cab.getitemstring(1,'cod_flujo')
		case 'PGRFCPT'
			//toca actualizar tesorelfact, luego si viene desde reserva o contrato actualizar los campos 
			//de la reserva. Si viene de disponib toca crear al reserva y luego actualizar los campos de la dispo
			tabla='tesorelfact'
			update tesorelfact set en_destino='1' where 
			clugar=:clug and coddoc =:cdoc and nrelacion=:nrel;
		case 'PGRP-'
			tabla='tesocajareposicion'
			update tesocajareposicion set en_destino='1' where 
			clugar=:clug and coddoc =:cdoc and nreposicion=:nrel;
		case 'PGPR-'
			tabla='pre_docu_cb'
			update pre_docu_cb set en_destino='1' where 
			clugar=:clug and coddoc =:cdoc and numdoc=:nrel;
		case 'PGPT-'
			tabla='Tesotranscab'
			update tesotranscab set en_destino='1' where 
			clugar=:clug and coddoc =:cdoc and ntransferencia=:nrel;
	end choose
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando en destino de '+tabla,err)
		return -1
	end if
next
if tb_1.tp_2.dw_rub.getitemstring(1,'coddoc_orig')='PDI' then
	if wf_crea_docurel('PR','Reserva','monto_reserva','PRPG-')=-1 then
		rollback;
		return -1
	end if
end if
for j=1 to tb_1.tp_2.dw_rub.rowcount()
	cdoc=tb_1.tp_2.dw_rub.getitemstring(j,'coddoc_orig')
	clug=tb_1.tp_2.dw_rub.getitemstring(j,'clugar_orig')
	item=tb_1.tp_2.dw_rub.getitemnumber(j,'item_orig')
	nrel=tb_1.tp_2.dw_rub.getitemnumber(j,'numdoc_orig')
	valor=tb_1.tp_2.dw_rub.getitemnumber(j,'monto_vigente')
	valor=round(valor,i_dec_gral)
	update pre_docu_cp set monto_utilizado = round((monto_utilizado + :valor),:i_dec_gral) where
	coddoc =:cdoc and clugar =:clug and numdoc =:nrel and item=:item and monto_vigente>=round((monto_utilizado+:valor),:i_dec_gral);
	if sqlca.sqlcode=-1 then 
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actuzalizando monto_gastado en Pred_docu_cb',err)
		return -1
	end if
	if sqlca.sqlnrows=0 then
		rollback;
		messagebox('Atención','El documento origen:('+cdoc+'-'+string(nrel)+') ya no tiene saldo para aprobar este documento')
		return -1
	end if
next
dw_cab.setitem(1,'consecutivo',final)
dw_cab.setitem(1,'estado','1')
if dw_cab.update(true,false)=-1 then return -1
dw_cab.resetupdate()
dw_historial.setitem(dw_historial.getrow(),'estado','1')
dw_historial.setitem(dw_historial.getrow(),'consecutivo',final)
dw_historial.setitem(dw_historial.getrow(),'fecha_consecu',dw_cab.getitemdatetime(1,'fecha_consecu'))
i_fila=0
dw_historial.event rowfocuschanged(dw_historial.getrow())
return 1
end function

on w_new_giro.create
int iCurrent
call super::create
end on

on w_new_giro.destroy
call super::destroy
end on

event p_open;call super::p_open;tb_1.tp_1.visible=true
tb_1.tp_1.enabled=true
tb_1.tp_3.visible=false
tb_1.tp_3.enabled=false
tb_1.tp_4.visible=false
tb_1.tp_4.enabled=false
tb_1.tp_5.pb_del_ter.enabled=false
tb_1.tp_5.pb_adic_ter.enabled=false
tb_1.tp_5.dw_terce.enabled=false
tb_1.tp_2.dw_sle.enabled=false
tb_1.tp_2.pb_find_rubro.enabled=false
tb_1.tp_2.pb_2.enabled=false
tb_1.tp_2.pb_10.enabled=false
end event

type tab_1 from w_docum_base1`tab_1 within w_new_giro
end type

on tab_1.create
call super::create
this.Control[]={this.tab_res,&
this.tab_cont}
end on

on tab_1.destroy
call super::destroy
end on

type tab_res from w_docum_base1`tab_res within tab_1
end type

type tab_cont from w_docum_base1`tab_cont within tab_1
end type

type cbx_1 from w_docum_base1`cbx_1 within w_new_giro
end type

type dw_movi from w_docum_base1`dw_movi within w_new_giro
end type

type pb_find from w_docum_base1`pb_find within w_new_giro
end type

type tb_1 from w_docum_base1`tb_1 within w_new_giro
end type

on tb_1.create
call super::create
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3,&
this.tp_4,&
this.tp_5,&
this.tp_6}
end on

on tb_1.destroy
call super::destroy
end on

type tp_1 from w_docum_base1`tp_1 within tb_1
pb_intf pb_intf
end type

on tp_1.create
this.pb_intf=create pb_intf
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_intf
end on

on tp_1.destroy
call super::destroy
destroy(this.pb_intf)
end on

type dw_intf from w_docum_base1`dw_intf within tp_1
end type

type tp_2 from w_docum_base1`tp_2 within tb_1
end type

type st_2 from w_docum_base1`st_2 within tp_2
end type

type pb_10 from w_docum_base1`pb_10 within tp_2
end type

type pb_2 from w_docum_base1`pb_2 within tp_2
end type

type pb_find_rubro from w_docum_base1`pb_find_rubro within tp_2
end type

type dw_sle from w_docum_base1`dw_sle within tp_2
end type

type dw_rub from w_docum_base1`dw_rub within tp_2
end type

event dw_rub::constructor;call super::constructor;object.monto.edit.displayonly='yes'
end event

type tp_3 from w_docum_base1`tp_3 within tb_1
end type

type em_1 from w_docum_base1`em_1 within tp_3
end type

type st_5 from w_docum_base1`st_5 within tp_3
end type

type st_4 from w_docum_base1`st_4 within tp_3
end type

type st_3 from w_docum_base1`st_3 within tp_3
end type

type dw_sle2 from w_docum_base1`dw_sle2 within tp_3
end type

type pb_find_fue from w_docum_base1`pb_find_fue within tp_3
end type

type pb_del_fue from w_docum_base1`pb_del_fue within tp_3
end type

type dw_r from w_docum_base1`dw_r within tp_3
end type

type dw_fuen from w_docum_base1`dw_fuen within tp_3
end type

type tp_4 from w_docum_base1`tp_4 within tb_1
end type

type dw_dest from w_docum_base1`dw_dest within tp_4
end type

type tp_5 from w_docum_base1`tp_5 within tb_1
end type

type pb_1 from w_docum_base1`pb_1 within tp_5
end type

type pb_del_ter from w_docum_base1`pb_del_ter within tp_5
end type

type pb_adic_ter from w_docum_base1`pb_adic_ter within tp_5
end type

type st_7 from w_docum_base1`st_7 within tp_5
end type

type dw_terce from w_docum_base1`dw_terce within tp_5
end type

type dw_ter from w_docum_base1`dw_ter within tp_5
end type

type gb_2 from w_docum_base1`gb_2 within tp_5
end type

type tp_6 from w_docum_base1`tp_6 within tb_1
end type

type pb_repmod from w_docum_base1`pb_repmod within tp_6
end type

type dw_modif from w_docum_base1`dw_modif within tp_6
end type

type pb_print from w_docum_base1`pb_print within w_new_giro
end type

type pb_save_def from w_docum_base1`pb_save_def within w_new_giro
end type

type pb_anula from w_docum_base1`pb_anula within w_new_giro
end type

type pb_save from w_docum_base1`pb_save within w_new_giro
end type

type pb_new from w_docum_base1`pb_new within w_new_giro
end type

type st_1 from w_docum_base1`st_1 within w_new_giro
end type

type dw_historial from w_docum_base1`dw_historial within w_new_giro
end type

type dw_vig_per from w_docum_base1`dw_vig_per within w_new_giro
end type

type gb_1 from w_docum_base1`gb_1 within w_new_giro
end type

type dw_cab from w_docum_base1`dw_cab within w_new_giro
end type

event dw_cab::itemchanged;call super::itemchanged;if dwo.name='cod_flujo' then
	string flujo
	flujo=getitemstring(1,'cod_flujo')
	choose case wf_cambio_flujo()
		case -1
			dw_historial.post event rowfocuschanged(dw_historial.getrow())
		case 1
			
		case 2
			setitem(1,'cod_flujo',flujo)
			settext(flujo)
			return 2
	end choose
	st_interfaz st
	tb_1.selectedtab=1
	st.dw_it=tb_1.tp_1.dw_intf
	st.dw_cab=dw_cab
	st.coddoc=i_cdoc
	st.cod_vigencia=i_vigencia
	st.dw_obj=tb_1.tp_2.dw_rub
	st.dw_ter=tb_1.tp_5.dw_ter
	choose case idw_flujo.getitemstring(idw_flujo.getrow(),'cod_orig')
		case 'RFC'
			openwithparm(w_lleva_relfact_giro,st)
		case 'RP'
			openwithparm(w_lleva_repocmen_giro,st)
		case 'PR'
			st.codmod='PGPR-'
			st.coddoc = 'PR'
			st.filtro = "%PG"
			openwithparm(w_lleva_dispo_reserv,st)
		case 'PT'
			openwithparm(w_lleva_pago_giro,st)
		case else
			messagebox('Atención','Este Flujo no se encuentra programado')
	end choose
end if
i_cambio=true
end event

type dw_cont from w_docum_base1`dw_cont within w_new_giro
end type

type pb_intf from picturebutton within tp_1
integer x = 2949
integer y = 36
integer width = 146
integer height = 128
integer taborder = 22
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
end type

event clicked;if dw_cab.rowcount()=0 then return
if dw_cab.getitemstring(1,'estado')<>'0' then return
st_interfaz st
tb_1.selectedtab=1
st.dw_it=tb_1.tp_1.dw_intf
st.coddoc=i_cdoc
st.cod_vigencia=i_vigencia
st.dw_obj=tb_1.tp_2.dw_rub
st.dw_ter=tb_1.tp_5.dw_ter
st.dw_cab=dw_cab
choose case dw_cab.getitemstring(1,'cod_flujo')
	case 'PGRFCPT'
		openwithparm(w_lleva_relfact_giro,st)
		if message.stringparm='ok' then i_cambio=true
	case 'PGRP-'
		openwithparm(w_lleva_repocmen_giro,st)
		if message.stringparm='ok' then i_cambio=true
	case 'PGPR-'
		st.codmod='PGPR-'
		st.coddoc = 'PR'
		st.filtro = "%PG"
		openwithparm(w_lleva_dispo_reserv,st)
	case 'PGPT-'
		openwithparm(w_lleva_pago_giro,st)
	case else
		messagebox('Atención','Este Flujo no se encuentra programado')
end choose
end event

