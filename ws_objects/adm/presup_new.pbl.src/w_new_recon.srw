$PBExportHeader$w_new_recon.srw
forward
global type w_new_recon from w_docum_base1
end type
type pb_intf from picturebutton within tp_1
end type
end forward

global type w_new_recon from w_docum_base1
string tag = "Modificó un Reconocimiento, desea guardar los cambios?"
string title = "Presupuesto - Reconocimiento"
boolean maxbox = false
string icon = "ribon_recono.ico"
string i_ing_gasto1 = "0"
string i_ing_gasto2 = "0"
string i_cdoc = "PRC"
string i_desdoc = "Reconocimiento"
end type
global w_new_recon w_new_recon

type variables

end variables

forward prototypes
public function integer grabar ()
public function integer grabar_def ()
public function integer f_anula ()
end prototypes

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
	messagebox('Atención','El Reconocimiento tiene fecha en mes diferente al del periodo')
	return -1
end if
if tb_1.tp_2.dw_rub.rowcount()=0 then
	messagebox('Atención','El Reconocimiento no tiene Rubros, adicionele para guardar Definitivo')
	return -1
end if

long j,final,donde,item,nrel
string clug,cdoc,ls_rsinc
dec valor

SELECT cadena into :ls_rsinc
FROM parametros_gen
WHERE (((codigo_para)=61));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 61')
	return -1
end if

for j=1 to tb_1.tp_2.dw_rub.rowcount()
	if tb_1.tp_2.dw_rub.getitemnumber(j,'monto')=0 then
		messagebox('Atención','Existen Rubros con montos en cero Revise para continuar')
		return -1
	end if
	if ls_rsinc='1' then
		if tb_1.tp_2.dw_rub.getitemnumber(j,'monto')> tb_1.tp_2.dw_rub.getitemnumber(j,'saldo_apropi') then
			messagebox('Atención','No hay saldo suficiente para el rubro del item '+string(j))
			return -1
		end if	
	end if
	tb_1.tp_2.dw_rub.setitem(j,'saldo_plan',tb_1.tp_2.dw_rub.getitemnumber(j,'saldo_apropi') )
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
	codigo=tb_1.tp_2.dw_rub.getitemstring(j,'codtotal')
	dw_movi.setitem(donde,'codtotal',codigo)
	dw_movi.setitem(donde,'periodo',i_periodo)
	dw_movi.setitem(donde,'fecha',datetime(today(),now()))
	dw_movi.setitem(donde,'coddoc',i_cdoc)
	dw_movi.setitem(donde,'año',i_año)
	dw_movi.setitem(donde,'clugar',tb_1.tp_2.dw_rub.getitemstring(j,'clugar'))
	dw_movi.setitem(donde,'numdoc',dw_cab.getitemnumber(1,'numdoc'))
	dw_movi.setitem(donde,'item',tb_1.tp_2.dw_rub.getitemnumber(j,'item'))
	dw_movi.setitem(donde,'monto_recon',tb_1.tp_2.dw_rub.getitemnumber(j,'monto'))
	
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
for j=1 to tb_1.tp_1.dw_intf.rowcount()
	choose case dw_cab.getitemstring(1,'cod_flujo')
		case 'PRCPDPI'//si viene de ingresos toca cambiar el estado al ingreso y crear un recaudo automático => el monto_utilizado del recon debe ser igual al monto_vigente
			nrel=tb_1.tp_1.dw_intf.getitemnumber(j,'num_orig1')
			clug=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig2')
			cdoc=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig1')
			UPDATE tesocajaingreso set presupuesto='1' where 
			codcaja=:cdoc and clugar=:clug and coddoc='IM' and ningreso=:nrel;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando Presupuesto de Tesocajaingreso',err)
				return -1
			end if
		case 'PRCCXCPI'//si viene de cartera toca cambiar el estado de carcobrocab
			nrel=tb_1.tp_1.dw_intf.getitemnumber(j,'num_orig1')
			clug=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig2')
			update car_cobro_cab set presupuesto='1' where clugar=:clug and num_cobro =:nrel and coddoc='CXC';
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando presupuesto de car_cobro_cab',err)
				return -1
			end if
	end choose
next
if dw_cab.getitemstring(1,'cod_flujo')='PRCPDPI' then
	if wf_crea_docurel('PI','Recaudo','monto_recau','PIPRC-')=-1 then
		rollback;
		return -1
	end if
	for j=1 to tb_1.tp_2.dw_rub.rowcount()
		valor=tb_1.tp_2.dw_rub.getitemnumber(j,'monto_vigente')
		tb_1.tp_2.dw_rub.setitem(j,'monto_utilizado',valor)
	next
	if tb_1.tp_2.dw_rub.update(true,false)=-1 then return -1
end if

dw_cab.setitem(1,'consecutivo',final)
dw_cab.setitem(1,'estado','1')
if dw_cab.update(true,false)=-1 then return -1
dw_cab.resetupdate()
tb_1.tp_2.dw_rub.resetupdate()
dw_historial.setitem(dw_historial.getrow(),'estado','1')
dw_historial.setitem(dw_historial.getrow(),'consecutivo',final)
dw_historial.setitem(dw_historial.getrow(),'fecha_consecu',dw_cab.getitemdatetime(1,'fecha_consecu'))
i_fila=0
dw_historial.event rowfocuschanged(dw_historial.getrow())
return 1
end function

public function integer f_anula ();if dw_cab.rowcount()=0 then return -1
if i_estado_per='0' then 
	messagebox('Atención','Este periodo no está activo')
	return -1
end if
if not isnull(dw_cab.getitemstring(1,'anulado')) then
	messagebox('Atención','Este documento ya fue anulado')
	return -1
end if
if dw_cab.getitemstring(1,'en_destino')='1' then
	messagebox('Atención','Este documento ya fue utilizado en el módulo destino')
	return -1
end if
long j,nrel
if dw_cab.getitemstring(1,'cod_flujo')='PRCRAPI' then
	f_quitafiltro(tb_1.tp_2.dw_rub,string(rgb(255,255,255)))
	if tb_1.tp_2.dw_rub.find('monto_utilizado > 0 or monto_interfaz > 0',1,tb_1.tp_2.dw_rub.rowcount())>0 then
		messagebox('Atención','Este documento ya fue utilizado en el módulo destino')
		return -1
	end if
end if
st_xa_anular st_anula
st_anula.tipo='PR'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return -1
string est_ant,nulo,clug,cdoc,err,codigo
datetime fnula
long cuantos,per,item2,item
per=month(today())
setnull(fnula)
setnull(nulo)
est_ant=dw_cab.getitemstring(1,'estado')
dw_cab.setitem(1,'estado','3')
dw_cab.setitem(1,'anulado',usuario)
dw_cab.setitem(1,'fechaanula',datetime(today(),now()))
dw_cab.setitem(1,'motiv_anula',st_anula.observacion)
dw_cab.setitem(1,'cod_anula',st_anula.motivo)
cuantos=dw_movi.rowcount()
for j=1 to cuantos
	codigo=dw_movi.getitemstring(j,'codtotal')
	dw_movi.rowscopy(j,j,primary!,dw_movi,dw_movi.rowcount()+1,primary!)
	dw_movi.setitem(dw_movi.rowcount(),'monto_dispon',dw_movi.getitemnumber(j,'monto_dispon')* -1)
	dw_movi.setitem(dw_movi.rowcount(),'monto_reserva',dw_movi.getitemnumber(j,'monto_reserva')* -1)
	dw_movi.setitem(dw_movi.rowcount(),'monto_girado',dw_movi.getitemnumber(j,'monto_girado')* -1)
	dw_movi.setitem(dw_movi.rowcount(),'monto_traslado',dw_movi.getitemnumber(j,'monto_traslado')* -1)
	dw_movi.setitem(dw_movi.rowcount(),'monto_adicion',dw_movi.getitemnumber(j,'monto_adicion')* -1)
	dw_movi.setitem(dw_movi.rowcount(),'monto_recorte',dw_movi.getitemnumber(j,'monto_recorte')* -1)
	dw_movi.setitem(dw_movi.rowcount(),'monto_recon',dw_movi.getitemnumber(j,'monto_recon')* -1)
	dw_movi.setitem(dw_movi.rowcount(),'monto_recau',dw_movi.getitemnumber(j, 'monto_recau')* -1)
	dw_movi.setitem(dw_movi.rowcount(),'monto_mod_dispon',dw_movi.getitemnumber(j, 'monto_mod_dispon')* -1)
	dw_movi.setitem(dw_movi.rowcount(),'monto_mod_reserva',dw_movi.getitemnumber(j, 'monto_mod_reserva')* -1)
	
	dw_movi.setitem(dw_movi.rowcount(),'periodo',per)
	dw_movi.setitem(dw_movi.rowcount(),'fecha',datetime(today(),now()))
	SELECT Max(pre_plan_movi_deta.num_movi) into :item
	FROM pre_plan_movi_deta
	WHERE pre_plan_movi_deta.cod_vigencia=:i_vigencia AND pre_plan_movi_deta.CodTotal=:codigo
	AND pre_plan_movi_deta.periodo=:per;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo pre_plan_movi_deta',err)
		return -1
	end if
	if isnull(item) then item=0 
	item++
	dw_movi.setitem(dw_movi.rowcount(),'num_movi',item) 
	if dw_movi.update()=-1 then return -1
next
if dw_cab.update()=-1 then
	dw_cab.setitem(1,'estado',est_ant)
	dw_cab.setitem(1,'anulado',nulo)
	dw_cab.setitem(1,'fechaanula',fnula)
	dw_cab.resetupdate()
	rollback;
	return -1
end if
if dw_cab.getitemstring(1,'cod_flujo')='PRCPDPI' then
	uo_datastore dw_cb,dw_mov
	dw_cb=create uo_datastore
	dw_mov=create uo_datastore
	dw_cb.dataobject='dw_anula_doc_sub'
	dw_mov.dataobject='dw_anula_mvtos_sub'
	dw_cb.settransobject(sqlca)
	dw_mov.settransobject(sqlca)
	dw_cb.retrieve(dw_cab.getitemstring(1,'coddoc'),dw_cab.getitemstring(1,'clugar'),dw_cab.getitemnumber(1,'numdoc'))
	dw_mov.retrieve(dw_cab.getitemstring(1,'coddoc'),dw_cab.getitemstring(1,'clugar'),dw_cab.getitemnumber(1,'numdoc'))
	
	cuantos=dw_mov.rowcount()
	for j=1 to cuantos
		codigo=dw_mov.getitemstring(j,'codtotal')
		dw_mov.rowscopy(j,j,primary!,dw_mov,dw_mov.rowcount()+1,primary!)
		dw_mov.setitem(dw_mov.rowcount(),'monto_recau',dw_mov.getitemnumber(j,'monto_recau')* -1)
		
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
	destroy(dw_cb)
	destroy(dw_mov)
	for j=1 to tb_1.tp_1.dw_intf.rowcount()
		nrel=tb_1.tp_1.dw_intf.getitemnumber(j,'num_orig1')
		clug=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig2')
		cdoc=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig1')
		UPDATE tesocajaingreso set presupuesto='0' where 
		codcaja=:cdoc and clugar=:clug and coddoc='IM' and ningreso=:nrel;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando Presupuesto de Tesocajaingreso',err)
			return -1
		end if
	next
	
else
	for j=1 to tb_1.tp_1.dw_intf.rowcount()
		nrel=tb_1.tp_1.dw_intf.getitemnumber(j,'num_orig1')
		clug=tb_1.tp_1.dw_intf.getitemstring(j,'char_orig2')
		update car_cobro_cab set presupuesto='0' where clugar=:clug and num_cobro =:nrel and coddoc='CXC';
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando Presupuesto de Car_Cobro_Cab',err)
			return -1
		end if
	next
end if
dw_cab.resetupdate()
dw_movi.resetupdate()
dw_historial.setitem(dw_historial.getrow(),'anulado',usuario)//solo de mostrario
dw_historial.setitem(dw_historial.getrow(),'estado','3')
return 1

end function

on w_new_recon.create
int iCurrent
call super::create
end on

on w_new_recon.destroy
call super::destroy
end on

event p_open;call super::p_open;tb_1.tp_1.visible=true
tb_1.tp_1.enabled=true
tb_1.tp_3.visible=false
tb_1.tp_3.enabled=false
tb_1.tp_4.visible=false
tb_1.tp_4.enabled=false
tb_1.tp_5.visible=false
tb_1.tp_5.enabled=false
tb_1.tp_2.dw_sle.enabled=false
tb_1.tp_2.pb_find_rubro.enabled=false
tb_1.tp_2.pb_2.enabled=false
tb_1.tp_2.pb_10.enabled=true
end event

type tab_1 from w_docum_base1`tab_1 within w_new_recon
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

type cbx_1 from w_docum_base1`cbx_1 within w_new_recon
end type

type dw_movi from w_docum_base1`dw_movi within w_new_recon
end type

type pb_find from w_docum_base1`pb_find within w_new_recon
end type

type tb_1 from w_docum_base1`tb_1 within w_new_recon
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
integer width = 2825
end type

type tp_2 from w_docum_base1`tp_2 within tb_1
end type

type st_2 from w_docum_base1`st_2 within tp_2
end type

type pb_10 from w_docum_base1`pb_10 within tp_2
end type

event pb_10::clicked;call super::clicked;long fila, numdoc, inicial, final
string valor, buscar
if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(1,'estado') = '0' then
	messagebox('Aviso','El documento no ha sido cerrado, Puede modificarlo sin generar documento')
	Return
end if
if dw_cab.GetItemString(1,'estado') = '3' then
	messagebox('Aviso','El documento ha sido anulado, No puede modificarlo')
	Return
end if
if i_estado_per <> '1' then
	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
	Return
end if
st_ppto st_p
if i_cdoc = 'PRC' then
	st_p.coddoc = 'PMR'
else
	Return 0
end if
st_p.cod_vigencia = i_vigencia
st_p.periodo = i_periodo
st_p.año = i_año
st_p.dw_obj = dw_rub
st_p.dw_src = tb_1.tp_1.dw_intf
openwithparm(w_mod_recon,st_p)
i_fila=0
dw_historial.TriggerEvent(RowFocusChanged!)

end event

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

event dw_rub::itemchanged;call super::itemchanged;if dwo.name<>'monto' then return
dec valor

valor=round(dec(data),i_dec_gral)
if i_dec_gral=0 then
	valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
end if
accepttext()
if valor< 0 then
	setitem(row,'Monto',0)
	setitem(row,'Monto_vigente',0)
	return 1
end If	
accepttext()
setitem(row,'Monto_vigente',valor)
setitem(row,'Monto',valor)
i_cambio=true
return 2
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

type pb_print from w_docum_base1`pb_print within w_new_recon
end type

type pb_save_def from w_docum_base1`pb_save_def within w_new_recon
end type

type pb_anula from w_docum_base1`pb_anula within w_new_recon
end type

type pb_save from w_docum_base1`pb_save within w_new_recon
end type

type pb_new from w_docum_base1`pb_new within w_new_recon
end type

event pb_new::clicked;call super::clicked;if i_estado_per <> '1' then
	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
	Return
end if
end event

type st_1 from w_docum_base1`st_1 within w_new_recon
end type

type dw_historial from w_docum_base1`dw_historial within w_new_recon
end type

type dw_vig_per from w_docum_base1`dw_vig_per within w_new_recon
end type

type gb_1 from w_docum_base1`gb_1 within w_new_recon
end type

type dw_cab from w_docum_base1`dw_cab within w_new_recon
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
	choose case idw_flujo.getitemstring(idw_flujo.getrow(),'cod_orig')
		case 'CXC'
			st.dw_it=tb_1.tp_1.dw_intf
			st.coddoc=i_cdoc
			st.cod_vigencia=i_vigencia
			st.dw_obj=tb_1.tp_2.dw_rub
			tb_1.tp_2.dw_sle.enabled=false
			tb_1.tp_2.pb_find_rubro.enabled=false
			tb_1.tp_2.pb_2.enabled=false
			tb_1.tp_2.dw_rub.object.monto.edit.displayonly='yes'
			openwithparm(w_pre_escoge_radica,st)
		case 'PD'
			st.dw_it=tb_1.tp_1.dw_intf
			st.coddoc=i_cdoc
			st.cod_vigencia=i_vigencia
			st.dw_obj=tb_1.tp_2.dw_rub
			tb_1.tp_2.dw_sle.enabled=false
			tb_1.tp_2.pb_find_rubro.enabled=false
			tb_1.tp_2.pb_2.enabled=false
			tb_1.tp_2.dw_rub.object.monto.edit.displayonly='yes'
			openwithparm(w_pre_escoge_ingr,st)
		case '-'
			tb_1.tp_1.dw_intf.reset()
			tb_1.tp_2.dw_sle.enabled=true
			tb_1.tp_2.pb_find_rubro.enabled=true
			tb_1.tp_2.pb_2.enabled=true
			tb_1.tp_2.dw_rub.object.monto.edit.displayonly='no'
			tb_1.selectedtab=2
		case else
			messagebox('Atención','Este Flujo no se encuentra programado')
	end choose
end if
i_cambio=true
end event

event dw_cab::retrieveend;call super::retrieveend;if rowcount=0 then return
choose case getitemstring(1,'cod_flujo')
	case 'PRCCXCPI','PRCPDPI'
		tb_1.tp_2.dw_sle.enabled=false
		tb_1.tp_2.pb_find_rubro.enabled=false
		tb_1.tp_2.pb_2.enabled=false
		tb_1.tp_2.dw_rub.object.monto.edit.displayonly='yes'
	case 'PRC-PI'
		tb_1.tp_2.dw_sle.enabled=true
		tb_1.tp_2.pb_find_rubro.enabled=true
		tb_1.tp_2.pb_2.enabled=true
		tb_1.tp_2.dw_rub.object.monto.edit.displayonly='no'
		tb_1.selectedtab=2
end choose
end event

type dw_cont from w_docum_base1`dw_cont within w_new_recon
end type

type pb_intf from picturebutton within tp_1
integer x = 2939
integer y = 44
integer width = 146
integer height = 128
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "llevar.gif"
string powertiptext = "Traer datos desde Interface"
end type

event clicked;if dw_cab.rowcount()=0 then return
if dw_cab.getitemstring(1,'estado')<>'0' then return
if i_estado_per <> '1' then
	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
	Return
end if
st_interfaz st
choose case dw_cab.getitemstring(1,'cod_flujo')
	case 'PRCCXCPI'
		st.dw_it=tb_1.tp_1.dw_intf
		st.coddoc=i_cdoc
		st.cod_vigencia=i_vigencia
		st.dw_obj=tb_1.tp_2.dw_rub
		openwithparm(w_pre_escoge_radica,st)
	case 'PRCPDPI'
		st.dw_it=tb_1.tp_1.dw_intf
		st.coddoc=i_cdoc
		st.cod_vigencia=i_vigencia
		st.dw_obj=tb_1.tp_2.dw_rub
		openwithparm(w_pre_escoge_ingr,st)
	case 'PRC-PI'
	case else
		messagebox('Atención','Este Flujo no se encuentra programado')
end choose

end event

