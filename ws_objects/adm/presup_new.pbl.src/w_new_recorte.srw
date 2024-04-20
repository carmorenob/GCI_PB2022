$PBExportHeader$w_new_recorte.srw
forward
global type w_new_recorte from w_docum_base1
end type
end forward

global type w_new_recorte from w_docum_base1
string tag = "Modificó un Recorte , desea guardar los cambios?"
string title = "Presupuesto - Recortes"
string icon = "ribon_recortep.ico"
string i_ing_gasto1 = "0"
string i_ing_gasto2 = "1"
string i_cdoc = "PPR"
string i_desdoc = "Recorte Presupuestal"
end type
global w_new_recorte w_new_recorte

forward prototypes
public function integer grabar_def ()
public function integer grabar ()
end prototypes

public function integer grabar_def ();if super::grabar_def()=-1 then return -1
return grabar_def_1('monto_recorte',-1)
end function

public function integer grabar ();if super :: grabar()=1 then
	commit;
	return 1
else
	rollback;
	return -1
end if
end function

on w_new_recorte.create
call super::create
end on

on w_new_recorte.destroy
call super::destroy
end on

event p_open;call super::p_open;tb_1.tp_1.visible=false
tb_1.tp_1.enabled=false
tb_1.tp_4.visible=false
tb_1.tp_4.enabled=false
tb_1.tp_5.enabled=false
tb_1.tp_5.visible=false
tb_1.tp_6.visible=false
tb_1.tp_6.enabled=false

end event

type tab_1 from w_docum_base1`tab_1 within w_new_recorte
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

type cbx_1 from w_docum_base1`cbx_1 within w_new_recorte
end type

type dw_movi from w_docum_base1`dw_movi within w_new_recorte
end type

type pb_find from w_docum_base1`pb_find within w_new_recorte
end type

type tb_1 from w_docum_base1`tb_1 within w_new_recorte
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
end type

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
setitem(row,'Monto',valor)
tb_1.tp_3.em_1.text=string(valor)
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

type pb_print from w_docum_base1`pb_print within w_new_recorte
end type

type pb_save_def from w_docum_base1`pb_save_def within w_new_recorte
end type

type pb_anula from w_docum_base1`pb_anula within w_new_recorte
end type

type pb_save from w_docum_base1`pb_save within w_new_recorte
end type

type pb_new from w_docum_base1`pb_new within w_new_recorte
end type

type st_1 from w_docum_base1`st_1 within w_new_recorte
end type

type dw_historial from w_docum_base1`dw_historial within w_new_recorte
end type

type dw_vig_per from w_docum_base1`dw_vig_per within w_new_recorte
end type

type gb_1 from w_docum_base1`gb_1 within w_new_recorte
end type

type dw_cab from w_docum_base1`dw_cab within w_new_recorte
end type

event dw_cab::itemchanged;call super::itemchanged;i_cambio=true
end event

type dw_cont from w_docum_base1`dw_cont within w_new_recorte
end type

