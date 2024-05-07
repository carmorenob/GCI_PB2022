$PBExportHeader$w_new_dispon.srw
forward
global type w_new_dispon from w_docum_base1
end type
type pb_intf from picturebutton within tp_1
end type
type pb_3 from picturebutton within tp_1
end type
end forward

global type w_new_dispon from w_docum_base1
string tag = "Modificó el documento de Disponibilidad , desea guardar los cambios?"
string title = "Presupuesto - Disponibilidad"
string icon = "ribon_dispop.ico"
string i_ing_gasto1 = "1"
string i_ing_gasto2 = "0"
string i_desdoc = "Disponibilidad"
end type
global w_new_dispon w_new_dispon

type variables

end variables

forward prototypes
public function integer grabar ()
public function integer grabar_def ()
public function integer f_anula ()
public subroutine f_cambio ()
public function integer f_upd_origen ()
public function integer f_anula_origen ()
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
if dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PDINMPR' or dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PDISPDIPR' then
	long ojo
	ojo=f_upd_interfaz(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),tb_1.tp_1.dw_intf)
	if ojo = -1 then
		Rollback;
		Return -1
	end if
end if
if f_upd_origen() = -1 then Return -1
if grabar_def_1('monto_dispon',1) = -1 then Return -1
Return 1

end function

public function integer f_anula ();string estado

estado = dw_cab.GetItemString(dw_cab.GetRow(),'estado')
if super :: f_anula()=1 then
	if f_anula_interfaz(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),tb_1.tp_1.dw_intf) = -1 then
		Rollback;
		Return -1
	end if
	if estado = '1' then
		if f_anula_origen() = 0 then
			commit;
		else
			Rollback;
			Return -1
		end if
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

public function integer f_upd_origen ();long i, fila
string cd,cl,msg
double nd, it
decimal monto

uo_DataStore dw_discpo
dw_discpo = CREATE uo_DataStore
dw_discpo.dataObject = "dw_pre_doc_cp"
dw_discpo.SetTransObject(SQLCA)

for i = 1 to tb_1.tp_2.dw_rub.RowCount()
	if cd <> tb_1.tp_2.dw_rub.GetItemString(i,'coddoc_orig') or cl <> tb_1.tp_2.dw_rub.GetItemString(i,'cLugar_orig') or nd <> tb_1.tp_2.dw_rub.GetItemNumber(i,'numdoc_orig') then
		cd = tb_1.tp_2.dw_rub.GetItemString(i,'coddoc_orig')
		cl = tb_1.tp_2.dw_rub.GetItemString(i,'cLugar_orig')
		nd = tb_1.tp_2.dw_rub.GetItemNumber(i,'numdoc_orig')
		dw_discpo.Retrieve(cd,cl,nd)
	end if
	monto = tb_1.tp_2.dw_rub.GetItemNumber(i,'monto_vigente')
	if dw_discpo.RowCount() > 0 then
		it = tb_1.tp_2.dw_rub.GetItemNumber(i,'item_orig')
		fila = dw_discpo.Find("item="+string(it),1,dw_discpo.RowCount())
		if fila > 0 then
			dw_discpo.SetItem(fila,'monto_utilizado',dw_discpo.GetItemNumber(fila,'monto_utilizado') + monto)
			if dw_discpo.GetItemNumber(fila,'monto_vigente') < dw_discpo.GetItemNumber(fila,'monto_utilizado') then
				Rollback;
				messageBox('Error','La reserva excede el monto de la disponibilidad')
				Return -1
			end if
		end if
	end if
	if dw_discpo.Update() = -1 then
		Rollback;
		Return -1
	end if
next

for i = 1 to tb_1.tp_1.dw_intf.RowCount()
	cd = tb_1.tp_1.dw_intf.GetItemString(i,'char_orig1')
	cl = tb_1.tp_1.dw_intf.GetItemString(i,'char_orig2')
	nd = tb_1.tp_1.dw_intf.GetItemNumber(i,'num_orig1')
	select count(*) into :fila from pre_docu_cp
	where coddoc=:cd and clugar=:cl and numdoc=:nd and monto_vigente > monto_utilizado;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		MessageBox("SQL error", msg)
		Rollback;
		Return -1
	END IF
	if fila = 0 then
		update pre_docu_cb set estado = '2' 
		where coddoc=:cd and clugar=:cl and numdoc=:nd;
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			MessageBox("SQL error", msg)
			Rollback;
			Return -1
		END IF
	end if
next

Return 0

end function

public function integer f_anula_origen ();long i, fila
string cd,cl,msg
double nd, it
decimal monto

uo_DataStore dw_discpo
dw_discpo = CREATE uo_DataStore
dw_discpo.dataObject = "dw_pre_doc_cp_orig"
dw_discpo.SetTransObject(SQLCA)

for i = 1 to tb_1.tp_2.dw_rub.RowCount()
	if cd <> tb_1.tp_2.dw_rub.GetItemString(i,'coddoc_orig') or cl <> tb_1.tp_2.dw_rub.GetItemString(i,'cLugar_orig') or nd <> tb_1.tp_2.dw_rub.GetItemNumber(i,'numdoc_orig') then
		cd = tb_1.tp_2.dw_rub.GetItemString(i,'coddoc_orig')
		cl = tb_1.tp_2.dw_rub.GetItemString(i,'cLugar_orig')
		nd = tb_1.tp_2.dw_rub.GetItemNumber(i,'numdoc_orig')
		dw_discpo.Retrieve(cd,cl,nd)
	end if
	monto = tb_1.tp_2.dw_rub.GetItemNumber(i,'monto_vigente')
	if dw_discpo.RowCount() > 0 then
		it = tb_1.tp_2.dw_rub.GetItemNumber(i,'item_orig')
		fila = dw_discpo.Find("item="+string(it),1,dw_discpo.RowCount())
		if fila > 0 then
			dw_discpo.SetItem(fila,'monto_utilizado',dw_discpo.GetItemNumber(fila,'monto_utilizado') - monto)
			if dw_discpo.GetItemNumber(fila,'monto_utilizado') < 0 then
				Rollback;
				messageBox('Error Disp '+string(nd),'El monto utilizado resulta negativo. Cta '+tb_1.tp_2.dw_rub.GetItemString(i,'codtotal'))
				Return -1
			end if
		end if
	end if
	if dw_discpo.Update() = -1 then
		Rollback;
		Return -1
	end if
next

for i = 1 to tb_1.tp_1.dw_intf.RowCount()
	cd = tb_1.tp_1.dw_intf.GetItemString(i,'char_orig1')
	cl = tb_1.tp_1.dw_intf.GetItemString(i,'char_orig2')
	nd = tb_1.tp_1.dw_intf.GetItemNumber(i,'num_orig1')
	update pre_docu_cb set estado = '1' 
	where coddoc=:cd and clugar=:cl and numdoc=:nd;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		MessageBox("SQL error", msg)
		Rollback;
		Return -1
	END IF
next
Return 0

end function

on w_new_dispon.create
int iCurrent
call super::create
end on

on w_new_dispon.destroy
call super::destroy
end on

event p_open;call super::p_open;
tb_1.tp_4.visible=false
tb_1.tp_5.visible=false
tb_1.tp_2.pb_find_rubro.Enabled = FALSE
end event

event timer;call super::timer;if dw_cab.rowcount()=0 then return
if dw_cab.GetItemString(1,'cod_flujo') = 'PDINMPR'  or dw_cab.GetItemString(1,'cod_flujo') = 'PDISPDIPR' then
	tb_1.tp_1.Visible = TRUE
	tb_1.tp_1.Enabled = TRUE
end if

end event

type tab_1 from w_docum_base1`tab_1 within w_new_dispon
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

type cbx_1 from w_docum_base1`cbx_1 within w_new_dispon
end type

type dw_movi from w_docum_base1`dw_movi within w_new_dispon
end type

type pb_find from w_docum_base1`pb_find within w_new_dispon
end type

type tb_1 from w_docum_base1`tb_1 within w_new_dispon
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
pb_3 pb_3
end type

on tp_1.create
this.pb_intf=create pb_intf
this.pb_3=create pb_3
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_intf
this.Control[iCurrent+2]=this.pb_3
end on

on tp_1.destroy
call super::destroy
destroy(this.pb_intf)
destroy(this.pb_3)
end on

type dw_intf from w_docum_base1`dw_intf within tp_1
end type

type tp_2 from w_docum_base1`tp_2 within tb_1
end type

type st_2 from w_docum_base1`st_2 within tp_2
end type

type pb_10 from w_docum_base1`pb_10 within tp_2
integer width = 146
integer height = 128
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
setitem(row,'Monto',valor)
setitem(row,'Monto_vigente',valor)
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
integer width = 1838
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
integer y = 40
integer width = 4718
integer height = 964
end type

type tp_5 from w_docum_base1`tp_5 within tb_1
end type

type pb_1 from w_docum_base1`pb_1 within tp_5
integer x = 3538
integer y = 208
end type

type pb_del_ter from w_docum_base1`pb_del_ter within tp_5
integer x = 3538
integer y = 80
end type

type pb_adic_ter from w_docum_base1`pb_adic_ter within tp_5
integer x = 3287
integer y = 864
end type

type st_7 from w_docum_base1`st_7 within tp_5
end type

type dw_terce from w_docum_base1`dw_terce within tp_5
integer width = 3163
end type

type dw_ter from w_docum_base1`dw_ter within tp_5
integer width = 3429
end type

type gb_2 from w_docum_base1`gb_2 within tp_5
integer width = 3442
end type

type tp_6 from w_docum_base1`tp_6 within tb_1
end type

type pb_repmod from w_docum_base1`pb_repmod within tp_6
end type

event pb_repmod::constructor;call super::constructor;inicia('documento!','DM',clugar)
end event

type dw_modif from w_docum_base1`dw_modif within tp_6
end type

type pb_print from w_docum_base1`pb_print within w_new_dispon
end type

type pb_save_def from w_docum_base1`pb_save_def within w_new_dispon
end type

type pb_anula from w_docum_base1`pb_anula within w_new_dispon
end type

type pb_save from w_docum_base1`pb_save within w_new_dispon
end type

type pb_new from w_docum_base1`pb_new within w_new_dispon
end type

type st_1 from w_docum_base1`st_1 within w_new_dispon
end type

type dw_historial from w_docum_base1`dw_historial within w_new_dispon
end type

event dw_historial::rowfocuschanged;call super::rowfocuschanged;if currentrow = 0 or GetRow() = 0 then Return
if GetItemString(GetRow(),'cod_flujo') = 'PDINMPR' then
	tb_1.tp_1.dw_intf.DataObject = 'dw_intf_ppto'
	tb_1.tp_2.dw_rub.modify("monto.protect='1'")
	tb_1.tp_4.dw_dest.modify("monto.protect='1'")			
	tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
end if
if  GetItemString(GetRow(),'cod_flujo') = 'PDISPDIPR' then
	tb_1.tp_1.dw_intf.DataObject = 'dw_flujo_2s1n_3n'
	tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
	tb_1.tp_2.dw_rub.modify("monto.protect='0'")
	tb_1.tp_4.dw_dest.modify("monto.protect='0'")				
end if

end event

type dw_vig_per from w_docum_base1`dw_vig_per within w_new_dispon
integer width = 1989
end type

type gb_1 from w_docum_base1`gb_1 within w_new_dispon
end type

type dw_cab from w_docum_base1`dw_cab within w_new_dispon
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
		case 'SPDI'
			tb_1.tp_1.dw_intf.DataObject= 'dw_flujo_2s1n'
			tb_1.tp_1.dw_intf.SetTransObject(SQLCA)		
			tb_1.tp_1.Visible = TRUE
			tb_1.tp_1.Enabled = TRUE			
			tb_1.selectedtab=1
			accepttext()
			tb_1.tp_2.pb_find_rubro.Enabled = FALSE
			tb_1.tp_1.pb_intf.event clicked()
			tb_1.tp_2.dw_rub.modify("monto.protect='0'")			
			tb_1.tp_4.dw_dest.modify("monto.protect='0'")			
		case '-'//ninguno
			tb_1.tp_1.visible=false
			tb_1.tp_1.enabled=false
			tb_1.selectedtab=2
			tb_1.tp_2.pb_find_rubro.Enabled = true
			tb_1.tp_2.dw_rub.modify("monto.protect='0'")	
			tb_1.tp_4.dw_dest.modify("monto.protect='0'")						
		case 'NM'
			tb_1.tp_2.pb_find_rubro.Enabled = FALSE
			tb_1.tp_1.dw_intf.DataObject = 'dw_intf_ppto'
			tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
			tb_1.tp_1.Visible = TRUE
			tb_1.tp_1.Enabled = TRUE			
			tb_1.tp_1.visible=true
			tb_1.tp_1.enabled=true
			tb_1.selectedtab=1
			accepttext()
			tb_1.tp_1.pb_intf.event clicked()
			tb_1.tp_2.dw_rub.modify("monto.protect='1'")
			tb_1.tp_4.dw_dest.modify("monto.protect='1'")						
		case else
			messagebox('Atención','Flujo no programado')
			setitem(1,'cod_flujo','')
//		case 'NM'//nomina
	end choose
end if
i_cambio=true
end event

event dw_cab::retrieveend;call super::retrieveend;if rowcount=0 then return
choose case GetItemString(1,'cod_flujo')
	case 'PDINMPR'
		tb_1.tp_1.dw_intf.DataObject = 'dw_intf_ppto'
		tb_1.tp_1.dw_intf.SetTransObject(SQLCA)		
//		tb_1.tp_2.dw_rub.DataObject = 'dw_pre_doc_cp'
//		tb_1.tp_2.dw_rub.SetTransObject(SQLCA)				
	case 'PDISPDIPR'
		tb_1.tp_1.dw_intf.DataObject = 'dw_flujo_2s1n'
		tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
//		tb_1.tp_2.dw_rub.DataObject = 'dw_pre_doc_cp_orig'
//		tb_1.tp_2.dw_rub.SetTransObject(SQLCA)				
		
	case else
//		tb_1.tp_2.dw_rub.DataObject = 'dw_pre_doc_cp'
//		tb_1.tp_2.dw_rub.SetTransObject(SQLCA)		
		tb_1.tp_1.dw_intf.Reset()
end choose

end event

type dw_cont from w_docum_base1`dw_cont within w_new_dispon
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
integer li,fr

st.codmod = dw_cab.GetItemString(1,'cod_flujo')
choose case dw_cab.getitemstring(1,'cod_flujo')
	case 'PDISPDIPR'
		tb_1.selectedtab = 1
		st.dw_it = tb_1.tp_1.dw_intf
		st.coddoc = i_cdoc
		st.cod_vigencia = i_vigencia
		st.dw_obj = tb_1.tp_2.dw_rub
		st.dw_ter = tb_1.tp_5.dw_ter
		st.dw_fte = tb_1.tp_3.dw_fuen
		st.dw_cab = dw_cab	
		st.coddoc = 'SPDI'
		st.filtro = "%"
		openwithparm(w_lleva_dispo_reserv,st)	
		if message.stringparm='ok' then i_cambio=true
		tb_1.selectedtab = 2
		for li=1 to tb_1.tp_2.dw_rub.rowcount()
			fr = dwc_r.Find("isNull(item)",1,dwc_r.RowCount())
			if fr > 0 then
				dwc_r.DeleteRow(fr)
			end if
			fr = dwc_r.InsertRow(0)
			dwc_r.SetItem(fr,'item', tb_1.tp_2.dw_rub.GetItemNumber(li,'item'))
			dwc_r.SetItem(fr,'codtotal',tb_1.tp_2.dw_rub.getitemstring(li,'codtotal'))
			dwc_r.SetItem(fr,'descrip',tb_1.tp_2.dw_rub.getitemstring(li,'descrip'))	
		next		
		tb_1.tp_2.dw_rub.modify("monto.protect='0'")	
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
		tb_1.selectedtab = 2		
		if message.stringparm='ok' then i_cambio=true
		tb_1.tp_2.dw_rub.modify("monto.protect='1'")
	case else
		messagebox('Atención','Este Flujo no se encuentra programado')
end choose

end event

type pb_3 from picturebutton within tp_1
integer x = 2930
integer y = 184
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
end type

event clicked;//uo_DataStore dw_it
//long i, nd, fila
//string cl
//
//if dw_cab.RowCount() = 0 then Return
//if dw_intf.RowCount() = 0 then Return
//if i_estado_per  <> '1' then
//	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
//	Return
//end if
//if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
//	messageBox('Aviso','La Reserva ya ha sido cerrada')
//	Return
//end if
//dw_it = Create uo_DataStore
//if pos('PRPDI',dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),1)>0 then return
//if dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRPDIPG' then
//
//	cl = dw_intf.GetItemString(dw_intf.GetRow(),'char_orig2')
//	nd = dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig1')
//	fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
//	do while fila > 0 
//		tb_1.tp_2.dw_rub.DeleteRow(fila)
//		fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
//	loop
//	dw_intf.DeleteRow(0)
//	i_cambio = TRUE
//	
//elseif dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PROCSCT' then
//	dw_it.DataObject = 'dw_flujo_2s1n'
//	dw_it.SetTransObject(SQLCA)
//	
//	if dw_it.Retrieve('OCPDIPR',dw_intf.GetItemString(dw_intf.GetRow(),'char_orig1'),dw_intf.GetItemString(dw_intf.GetRow(),'char_orig2'),dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig1')) > 0 then
//		for i =  1 to dw_it.RowCount()
//			if dw_it.GetItemString(i,'char_orig1') = 'PDI' then
//				cl = dw_it.GetItemString(i,'char_orig2')
//				nd = dw_it.GetItemNumber(i,'num_orig1')
//				fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
//				do while fila > 0 
//					tb_1.tp_2.dw_rub.DeleteRow(fila)
//					fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
//				loop
//				
//			end if
//		next
//		dw_intf.DeleteRow(0)
//		i_cambio = TRUE
//	end if
//	
//elseif dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRSCTPT' or dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRSCTRFC' or dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRNCRFC' or dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRNCPT' then
//	dw_it.DataObject = 'dw_contra_ppto'
//	dw_it.SetTransObject(SQLCA)
//
//	if dw_it.Retrieve(dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig1'),dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig2'),dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig3')) > 0 then
//		for i =  1 to dw_it.RowCount()
//			cl = dw_it.GetItemString(i,'clugar_dispo')
//			nd = dw_it.GetItemNumber(i,'numdoc_dispo')
//			fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
//			do while fila > 0 
//				tb_1.tp_2.dw_rub.DeleteRow(fila)
//				fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
//			loop
//		next
//		dw_intf.DeleteRow(0)
//		i_cambio = TRUE
//	end if
//	
//end if
//
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

