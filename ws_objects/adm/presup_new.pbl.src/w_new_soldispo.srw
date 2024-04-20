$PBExportHeader$w_new_soldispo.srw
forward
global type w_new_soldispo from w_docum_base1
end type
type pb_intf from picturebutton within tp_1
end type
end forward

global type w_new_soldispo from w_docum_base1
string tag = "Modificó el documento de Solicitud Disponibilidad , desea guardar los cambios?"
string title = "Solicitud Disponibilidad Presupuestal"
string icon = "ribon_solicid.ico"
string i_ing_gasto1 = "1"
string i_ing_gasto2 = "0"
string i_cdoc = "SPDI"
string i_desdoc = "Solicitud Disponibilidad"
end type
global w_new_soldispo w_new_soldispo

type variables

end variables

forward prototypes
public function integer grabar ()
public function integer grabar_def ()
public function integer f_anula ()
public subroutine f_cambio ()
end prototypes

public function integer grabar ();if super :: grabar()=1 then
	commit;
	return 1
else
	rollback;
	return -1
end if
end function

public function integer grabar_def ();//if super::grabar_def()=-1 then return -1
//if dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PDINMPR' then
//	long ojo
//	ojo=f_upd_interfaz(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),tb_1.tp_1.dw_intf)
//	if ojo = -1 then
//		Rollback;
//		Return -1
//	end if
//end if
////if grabar_def_1('monto_dispon',1) = -1 then Return -1
if super::grabar_def() = -1 then return -1
long f,final
double ld_ant
			
if isnull(dw_cab.getitemstring(1,'cod_flujo')) then
	messagebox('Atención','No ha escogido flujo del documento')
	return -1
end if
if isnull(dw_cab.getitemdatetime(1,'fecha_consecu')) then
	messagebox('Atención','No ha escogido fecha del documento')
	return -1
end if
if month(date(dw_cab.getitemdatetime(1,'fecha_consecu')))<>i_periodo then
	messagebox('Atención','La Reserva tiene fecha en mes diferente al del periodo')
	return -1
end if
if tb_1.tp_2.dw_rub.RowCount() = 0 then
	messagebox('Atención','La Solicitud no tiene Rubros, adicionele para guardar Definitivo')
	return -1
end if
final = f_consec(i_vigencia,i_cdoc,cLugar)
if final = -1 then 
	MessageBox('Error','Imposible asignar consecutivo al documento - PRE_CONSECS')
	Rollback;
	Return -1
End if

tb_1.tp_2.dw_rub.event rowfocuschanged(tb_1.tp_2.dw_rub.getrow())
tb_1.tp_3.dw_fuen.SetRedraw(true)
dw_cab.setitem(1,'consecutivo',final)
dw_cab.setitem(1,'estado','1')
if dw_cab.update(true,false)=-1 then return -1
dw_cab.resetupdate()
dw_historial.setitem(dw_historial.getrow(),'estado','1')
dw_historial.setitem(dw_historial.getrow(),'consecutivo',final)
dw_historial.setitem(dw_historial.getrow(),'fecha_consecu',dw_cab.getitemdatetime(1,'fecha_consecu'))
i_fila=0
dw_historial.event rowfocuschanged(dw_historial.getrow())
Return 1

end function

public function integer f_anula ();if super :: f_anula()=1 then
	if f_anula_interfaz(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),tb_1.tp_1.dw_intf) = -1 then
		Rollback;
		Return -1
	end if
	commit;
	return 1
else
	rollback;
	return -1
end if

end function

public subroutine f_cambio ();i_cambio=true
end subroutine

on w_new_soldispo.create
int iCurrent
call super::create
end on

on w_new_soldispo.destroy
call super::destroy
end on

event p_open;call super::p_open;tb_1.tp_4.visible=false
tb_1.tp_5.visible=false
tb_1.tp_3.visible=false

end event

event timer;call super::timer;if dw_cab.rowcount()=0 then return
if dw_cab.GetItemString(1,'cod_flujo') = 'PDINMPR' then
	tb_1.tp_1.Visible = TRUE
	tb_1.tp_1.Enabled = TRUE
end if

end event

type tab_1 from w_docum_base1`tab_1 within w_new_soldispo
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

type cbx_1 from w_docum_base1`cbx_1 within w_new_soldispo
end type

type dw_movi from w_docum_base1`dw_movi within w_new_soldispo
end type

type pb_find from w_docum_base1`pb_find within w_new_soldispo
end type

type tb_1 from w_docum_base1`tb_1 within w_new_soldispo
integer width = 4873
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
integer width = 4837
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
integer width = 4837
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
integer width = 4759
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
setitem(row,'Monto',valor)
setitem(row,'Monto_vigente',valor)
tb_1.tp_3.em_1.text=string(valor)
i_cambio=true
return 2
end event

type tp_3 from w_docum_base1`tp_3 within tb_1
integer width = 4837
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
integer width = 4736
end type

event dw_fuen::itemchanged;call super::itemchanged;dec valor

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
setitem(row,'Monto',valor)
i_cambio=true
return 2
end event

type tp_4 from w_docum_base1`tp_4 within tb_1
integer width = 4837
end type

type dw_dest from w_docum_base1`dw_dest within tp_4
end type

type tp_5 from w_docum_base1`tp_5 within tb_1
integer width = 4837
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
integer width = 4837
end type

type pb_repmod from w_docum_base1`pb_repmod within tp_6
end type

type dw_modif from w_docum_base1`dw_modif within tp_6
end type

type pb_print from w_docum_base1`pb_print within w_new_soldispo
end type

type pb_save_def from w_docum_base1`pb_save_def within w_new_soldispo
end type

type pb_anula from w_docum_base1`pb_anula within w_new_soldispo
end type

type pb_save from w_docum_base1`pb_save within w_new_soldispo
end type

type pb_new from w_docum_base1`pb_new within w_new_soldispo
end type

type st_1 from w_docum_base1`st_1 within w_new_soldispo
end type

type dw_historial from w_docum_base1`dw_historial within w_new_soldispo
end type

event dw_historial::rowfocuschanged;call super::rowfocuschanged;if currentrow = 0 or GetRow() = 0 then Return
if GetItemString(GetRow(),'cod_flujo') = 'PDINMPR' then
	tb_1.tp_1.dw_intf.DataObject = 'dw_intf_ppto'
	tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
end if

end event

type dw_vig_per from w_docum_base1`dw_vig_per within w_new_soldispo
integer width = 1989
end type

type gb_1 from w_docum_base1`gb_1 within w_new_soldispo
end type

type dw_cab from w_docum_base1`dw_cab within w_new_soldispo
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
	choose case idw_flujo.getitemstring(idw_flujo.getrow(),'cod_orig')
		case '-'//ninguno
			tb_1.tp_1.visible=false
			tb_1.tp_1.enabled=false
			tb_1.selectedtab=2
		case 'NM'
			tb_1.tp_1.dw_intf.DataObject = 'dw_intf_ppto'
			tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
			tb_1.tp_1.visible=true
			tb_1.tp_1.enabled=true
			tb_1.selectedtab=1
			accepttext()
			tb_1.tp_1.pb_intf.event clicked()
		case else
			messagebox('Atención','Flujo no programado')
			setitem(1,'cod_flujo','')
//		case 'NM'//nomina
	end choose
end if
i_cambio=true
end event

type dw_cont from w_docum_base1`dw_cont within w_new_soldispo
end type

type pb_intf from picturebutton within tp_1
integer x = 2926
integer y = 40
integer width = 146
integer height = 128
integer taborder = 32
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
choose case dw_cab.getitemstring(1,'cod_flujo')
	case 'PDINMPR'
		tb_1.selectedtab = 1
		st.dw_it = tb_1.tp_1.dw_intf
		st.coddoc = i_cdoc
		st.cod_vigencia = i_vigencia
		st.dw_obj = tb_1.tp_2.dw_rub
		st.dw_ter = tb_1.tp_5.dw_ter
		st.dw_fte = tb_1.tp_3.dw_fuen
		st.dw_cab = dw_cab
		openwithparm(w_choosenom,st)
		if message.stringparm='ok' then i_cambio=true
	case else
		messagebox('Atención','Este Flujo no se encuentra programado')
end choose

end event

type dw_intfaz from datawindow within tp_1
integer x = 55
integer y = 76
integer width = 686
integer height = 400
integer taborder = 80
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

