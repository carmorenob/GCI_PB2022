$PBExportHeader$w_new_traslado.srw
forward
global type w_new_traslado from w_docum_base1
end type
type pb_intf from picturebutton within tp_1
end type
end forward

global type w_new_traslado from w_docum_base1
string tag = "Modificó un Traslado, desea guardar los cambios?"
string title = "Presupuesto - Traslados"
string icon = "ribon_trasladop.ico"
string i_ing_gasto1 = "1"
string i_ing_gasto2 = "1"
string i_cdoc = "PTF"
string i_desdoc = "Traslados"
end type
global w_new_traslado w_new_traslado

forward prototypes
public function integer grabar_def ()
public function integer grabar ()
end prototypes

public function integer grabar_def ();if super::grabar_def()=-1 then return -1
if dw_cab.getitemString(dw_cab.getrow(),'cod_flujo') = 'PTFPIPI' then
	return grabar_def_1('monto_recau',-1)
else
	return grabar_def_1('monto_traslado',-1)
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

on w_new_traslado.create
int iCurrent
call super::create
end on

on w_new_traslado.destroy
call super::destroy
end on

event p_open;call super::p_open;tb_1.tp_4.visible=false
tb_1.tp_4.enabled=false
tb_1.tp_5.enabled=false
tb_1.tp_5.visible=false
tb_1.tp_6.visible=false
tb_1.tp_6.enabled=false
end event

type tab_1 from w_docum_base1`tab_1 within w_new_traslado
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

type cbx_1 from w_docum_base1`cbx_1 within w_new_traslado
end type

type dw_movi from w_docum_base1`dw_movi within w_new_traslado
end type

type pb_find from w_docum_base1`pb_find within w_new_traslado
end type

type tb_1 from w_docum_base1`tb_1 within w_new_traslado
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
boolean visible = true
boolean enabled = true
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

event dw_sle::itemchanged;if dw_cab.RowCount() = 0 then Return
if dw_cab.getitemstring(1,'estado')<>'0' then return
string codtotal, valor, descripcion, texto
long  fila, filas, i, fr
dec plan_ini,planeado_actual,acum_adic,acum_trasl,acum_recor,acum_dispo,acum_mod_dispo,acum_reser,acum_mod_reser,acum_giro,acum_recon,acum_recau

AcceptText()
texto = GetItemString(1,1)
if texto = '' then Return 0
SELECT pre_plan.CodTotal, pre_plan.descrip, pre_plan.planeado_inicial, v_pre_suma_acum.acum_traslado, v_pre_suma_acum.acum_adicion, v_pre_suma_acum.acum_recorte, v_pre_suma_acum.acum_dispon, v_pre_suma_acum.acum_mod_dispo, v_pre_suma_acum.acum_reserva, v_pre_suma_acum.acum_mod_reserv, v_pre_suma_acum.acum_girado, v_pre_suma_acum.acum_recon, v_pre_suma_acum.acum_recaudo
into :codTotal, :descripcion, :plan_ini ,:acum_trasl,:acum_adic,:acum_recor,:acum_dispo,:acum_mod_dispo,:acum_reser,:acum_mod_reser,:acum_giro,:acum_giro,:acum_recau
FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
WHERE (((pre_plan.CodTotal)=:Texto) AND ((pre_plan.cod_vigencia)=:i_vigencia) AND ((pre_plan.tipo)=:i_ing_gasto1) AND ((pre_plan.movimiento)='1'));

if SQLCA.SQLCode = -1 then
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
elseif SQLCA.SQLCode = 100 then
	Messagebox('Error','La cuenta no aparece en el Plan de Presupuesto o no es de movimiento')
	Return -1
end if
if isnull(plan_ini) then
	messagebox('Error en Pre_plan','Esta cuenta no tiene valor planeado inicial')
	return -1
end if
if isnull(acum_trasl) then acum_trasl=0
if isnull(acum_adic) then acum_adic=0
if isnull(acum_recor) then acum_recor=0
if isnull(acum_dispo) then acum_dispo=0
if isnull(acum_mod_dispo) then acum_mod_dispo=0
if isnull(acum_reser) then acum_reser=0
if isnull(acum_mod_reser) then acum_mod_reser=0
if isnull(acum_giro) then acum_giro=0
if isnull(acum_recon) then acum_recon=0
if isnull(acum_recau) then acum_recau=0

planeado_actual=plan_ini+acum_trasl+acum_adic+acum_recor
if dw_cab.getitemString(dw_cab.getrow(),'cod_flujo') = 'PTFPIPI' then
	if acum_recau = 0 then
		messagebox('Atención','Este rubro no tiene valor Recaudado')
		return -1
	end if
elseif planeado_actual=0 and (i_cdoc='PDI' or i_cdoc='PTF' or i_cdoc='PPR') then 
	messagebox('Atención','Este rubro no tiene valor Planeado Actual')
	return -1
end if
fila = dw_rub.Find("codtotal='" + codtotal+"'",1,dw_rub.RowCount())
if fila = 0 then
	fila = dw_rub.InsertRow(0)
	valor = dw_rub.Describe("Evaluate('max(item)',0)")
	dw_rub.SetItem(fila,'coddoc',i_cdoc)
	dw_rub.SetItem(fila,'cLugar',cLugar)
	dw_rub.SetItem(fila,'numdoc',i_ndoc)
	dw_rub.SetItem(fila,'item',long(valor) + 1)
	dw_rub.SetItem(fila,'cod_vigencia',i_vigencia)
	dw_rub.SetItem(fila,'codtotal',codtotal)
	dw_rub.SetItem(fila,'descrip',descripcion)
	dw_rub.SetItem(fila,'planeado_inicial',plan_ini)
	dw_rub.SetItem(fila,'acum_traslado',acum_trasl)
	dw_rub.SetItem(fila,'acum_adicion',acum_adic)
	dw_rub.SetItem(fila,'acum_recorte',acum_recor)
	dw_rub.SetItem(fila,'acum_dispon',acum_dispo)
	dw_rub.SetItem(fila,'acum_mod_dispo',acum_mod_dispo)
	dw_rub.SetItem(fila,'acum_reserva',acum_reser)
	dw_rub.SetItem(fila,'acum_mod_reserv',acum_mod_reser)
	dw_rub.SetItem(fila,'acum_girado',acum_giro)
	dw_rub.SetItem(fila,'acum_recon',acum_recon)
	dw_rub.SetItem(fila,'acum_recaudo',acum_recau)
	
	dw_rub.SetItem(fila,'estado','0')
	dw_rub.ScrolltoRow(fila)
	fr = dwc_r.Find("isNull(item)",1,dwc_r.RowCount())
	if fr > 0 then
		dwc_r.DeleteRow(fr)
	end if
	fr = dwc_r.InsertRow(0)
	dwc_r.SetItem(fr,'item',dw_rub.GetItemNumber(fila,'item'))
	dwc_r.SetItem(fr,'codtotal',codtotal)
	dwc_r.SetItem(fr,'descrip',descripcion)
	if i_equ='1' then tb_1.tp_3.pb_find_fue.TriggerEvent(clicked!)

	dw_rub.TriggerEvent(rowfocuschanged!)
	i_cambio = TRUE
	settext('')
	setitem(1,1,'')
end if
return fila

end event

type dw_rub from w_docum_base1`dw_rub within tp_2
end type

event dw_rub::itemchanged;call super::itemchanged;dec valor

valor=round(dec(data),i_dec_gral)
if i_dec_gral=0 then
	valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
end if
if valor > getitemnumber(row,'saldo_apropi') then
	settext('0')
	setitem(row,'monto',0)
	return 1
end if
accepttext()
setitem(row,'Monto_vigente',valor)
tb_1.tp_3.em_1.text=string(valor)
i_cambio=true
setitem(row,'Monto',valor)
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

event dw_fuen::itemchanged;call super::itemchanged;accepttext()
i_cambio=true
end event

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

type pb_print from w_docum_base1`pb_print within w_new_traslado
end type

type pb_save_def from w_docum_base1`pb_save_def within w_new_traslado
end type

type pb_anula from w_docum_base1`pb_anula within w_new_traslado
end type

type pb_save from w_docum_base1`pb_save within w_new_traslado
end type

type pb_new from w_docum_base1`pb_new within w_new_traslado
boolean originalsize = false
end type

type st_1 from w_docum_base1`st_1 within w_new_traslado
end type

type dw_historial from w_docum_base1`dw_historial within w_new_traslado
end type

type dw_vig_per from w_docum_base1`dw_vig_per within w_new_traslado
end type

type gb_1 from w_docum_base1`gb_1 within w_new_traslado
end type

type dw_cab from w_docum_base1`dw_cab within w_new_traslado
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
	accepttext()
	i_ing_gasto1 = '1'
	i_ing_gasto2 = '1'
	choose case idw_flujo.getitemstring(idw_flujo.getrow(),'cod_orig')
		case 'PI'
			st.dw_it=tb_1.tp_1.dw_intf
			st.coddoc=i_cdoc
			st.codmod='PTFPIPI'
			st.cod_vigencia=i_vigencia
			tb_1.tp_2.dw_rub.DataObject = 'dw_pre_doc_cp_ptf'
			tb_1.tp_2.dw_rub.setTransObject(SQLCA)
			st.dw_obj=tb_1.tp_2.dw_rub
			st.dw_cab=dw_cab
			openwithparm(w_tras_ingresos,st)
			i_ing_gasto1 = '0'
			i_ing_gasto2 = '0'
		case else
	//		messagebox('Atención','Este Flujo no se encuentra programado')
	end choose
end if
i_cambio=true

end event

event dw_cab::retrieveend;call super::retrieveend;if getitemString(1,'cod_flujo') = 'PTFPIPI' then
	tb_1.tp_2.dw_rub.DataObject = 'dw_pre_doc_cp_ptf'
	tb_1.tp_2.dw_rub.setTransObject(SQLCA)
	i_ing_gasto1 = '0'
	i_ing_gasto2 = '0'	
else
	i_ing_gasto1 = '1'
	i_ing_gasto2 = '1'
end if

end event

type dw_cont from w_docum_base1`dw_cont within w_new_traslado
end type

type pb_intf from picturebutton within tp_1
integer x = 2917
integer y = 44
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string powertiptext = "Traer datos desde Interface"
end type

event clicked;if dw_cab.rowcount()=0 then return
if dw_cab.getitemstring(1,'estado')<>'0' then return
st_interfaz st
choose case dw_cab.getitemstring(1,'cod_flujo')
	case 'PTFPIPI'
		st.dw_it=tb_1.tp_1.dw_intf
		st.coddoc=i_cdoc
		st.codmod='PTFPIPI'
		st.cod_vigencia=i_vigencia
		st.dw_obj=tb_1.tp_2.dw_rub
		st.dw_cab=dw_cab
		openwithparm(w_tras_ingresos,st)
	case else
//		messagebox('Atención','Este Flujo no se encuentra programado')
end choose

end event

