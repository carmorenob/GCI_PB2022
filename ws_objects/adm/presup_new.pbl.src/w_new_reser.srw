$PBExportHeader$w_new_reser.srw
forward
global type w_new_reser from w_docum_base1
end type
type pb_13 from picturebutton within tp_1
end type
type pb_15 from picturebutton within tp_1
end type
end forward

global type w_new_reser from w_docum_base1
string tag = "Modificó el documento de reserva. Desea guardarlos?"
integer width = 5701
integer height = 2384
string title = "Presupuesto - Reserva"
string icon = "ribon_reservap.ico"
string i_ing_gasto1 = "1"
string i_ing_gasto2 = "0"
string i_cdoc = "PR"
string i_desdoc = "Reservas"
end type
global w_new_reser w_new_reser

type variables
datawindowchild dwc_f, dwc_t
end variables

forward prototypes
public function integer grabar_def ()
public function integer grabar ()
public function integer f_upd_origen ()
public function integer f_anula_origen ()
public function integer f_anula ()
public subroutine f_cambio ()
end prototypes

public function integer grabar_def ();if super::grabar_def() = -1 then return -1
long f
double ld_ant
uo_datastore dw_cp
dw_cp = create uo_datastore
dw_cp.DataObject = 'dw_contra_ppto'
dw_cp.SetTransObject(SQLCA)
			
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
if tb_1.tp_5.dw_ter.RowCount() = 0 then
	messagebox('Atención','La Reserva no tiene terceros, adicionele para guardar Definitivo')
	return -1
end if
if tb_1.tp_2.dw_rub.RowCount() = 0 then
	messagebox('Atención','La Reserva no tiene Rubros, adicionele para guardar Definitivo')
	return -1
end if
if round(tb_1.tp_5.dw_ter.getitemnumber(1,'total'),2) <> round(tb_1.tp_2.dw_rub.getitemnumber(1,'total'),2) then
	messagebox('Atención','El monto de los terceros es diferente al de los rubros')
	return -1
end if
long j,final,donde,item
for j = 1 to tb_1.tp_2.dw_rub.RowCount()
	if tb_1.tp_2.dw_rub.getitemnumber(j,'monto') = 0 then
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
for j=1 to tb_1.tp_2.dw_rub.RowCount()
	donde=dw_movi.insertrow(0)
	dw_movi.setitem(donde,'cod_vigencia',i_vigencia)
	dw_movi.setitem(donde,'año',i_año)
	codigo = tb_1.tp_2.dw_rub.getitemstring(j,'codtotal')
	dw_movi.setitem(donde,'codtotal',codigo)
	dw_movi.setitem(donde,'periodo',i_periodo)
	dw_movi.setitem(donde,'fecha',datetime(today(),now()))
	dw_movi.setitem(donde,'coddoc',i_cdoc)
	dw_movi.setitem(donde,'clugar',tb_1.tp_2.dw_rub.getitemstring(j,'clugar'))
	dw_movi.setitem(donde,'numdoc',dw_cab.getitemnumber(1,'numdoc'))
	dw_movi.setitem(donde,'item',tb_1.tp_2.dw_rub.getitemnumber(j,'item'))
	dw_movi.setitem(donde,'monto_reserva',tb_1.tp_2.dw_rub.getitemnumber(j,'monto'))
	
	SELECT Max(pre_plan_movi_deta.num_movi) into :item
	FROM pre_plan_movi_deta
	WHERE pre_plan_movi_deta.cod_vigencia=:i_vigencia AND pre_plan_movi_deta.CodTotal=:codigo
	AND pre_plan_movi_deta.periodo=:i_periodo;
	if SQLCA.SQLCode = -1 then
		err = sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo pre_plan_movi_deta',err)
		return -1
	end if
	if isnull(item) then item = 0 
	item++
	dw_movi.setitem(donde,'num_movi',item) 
	if dw_movi.Update() = -1 then Return -1
next

if f_upd_origen() = -1 then Return -1
if not (left(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),5) = 'PRPDI') then
	long i, ano, ct, ot, nd
	string cl, cd
	if f_upd_interfaz(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),tb_1.tp_1.dw_intf) = -1 then
		Rollback;
		Return -1
	end if
	if left(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),5) = 'PRSCT' or left(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),4) = 'PRNC' then
		for i = 1 to tb_1.tp_1.dw_intf.RowCount()
			ano = tb_1.tp_1.dw_intf.GetItemNumber(i,'num_orig1')
			ct = tb_1.tp_1.dw_intf.GetItemNumber(i,'num_orig2')
			ot = tb_1.tp_1.dw_intf.GetItemNumber(i,'num_orig3')
			
			if dw_cp.retrieve(ano, ct, ot) > 0 then
				for i = 1 to dw_cp.RowCount()
					f = tb_1.tp_2.dw_rub.Find("coddoc_orig='"+dw_cp.GetItemString(i,'coddoc_dispo')+"' and clugar_orig='"+dw_cp.GetItemString(i,'cLugar_dispo')+"' and " + &
					"numdoc_orig="+string(dw_cp.GetItemNumber(i,'numdoc_dispo'))+" and item_orig="+string(dw_cp.GetItemNumber(i,'item_dispo')),1,tb_1.tp_2.dw_rub.RowCount())
					if f > 0 then
						ld_ant = dw_cp.getItemNumber(i,'monto_utilizado')
						if isNull(ld_ant) then ld_ant = 0
						if ld_ant + tb_1.tp_2.dw_rub.getItemNumber(f,'monto_vigente') > dw_cp.getItemNumber(i,'monto') then
							rollback;
							MessageBox('Atención','El monto de la disponibilidad para el contrato sería superado (contra_presu). No puede grabarse la reserva')
							Return -1
						end if
						dw_cp.setItem(i,'monto_utilizado',ld_ant + tb_1.tp_2.dw_rub.getItemNumber(f,'monto_vigente'))
						dw_cp.setItem(i,'coddoc_reser',tb_1.tp_2.dw_rub.getitemstring(f,'coddoc'))
						dw_cp.setItem(i,'clugar_reser',tb_1.tp_2.dw_rub.getitemstring(f,'clugar'))
						dw_cp.setItem(i,'numdoc_reser',tb_1.tp_2.dw_rub.getitemnumber(f,'numdoc'))
						dw_cp.setItem(i,'item_reser',tb_1.tp_2.dw_rub.getitemnumber(f,'item'))
					end if
				next
			else
				MessageBox('Atención','El contrato no tiene asociadas disponibilidades')
				Return -1
			end if
		next
		if dw_cp.Update() = -1 then
				Rollback;
			Return -1
		end if
		
//		cd = dw_cab.GetItemString(1,'coddoc')
//		cl = dw_cab.GetItemString(1,'clugar')
//		nd = dw_cab.GetItemNumber(1,'numdoc')
//		update contra_presu set coddocu_reser=:cd, clugar_reser=:cl, numdoc_reser=:nd
//		where ano=:ano and ncontrato=:ct and otrosi=:ot;
//		if SQLCA.SQLCode = -1 then
//			err = sqlca.sqlerrtext
//			rollback;
//			messagebox('Error actualizando contra_presu',err)
//			return -1
//		end if
	end if
end if

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

public function integer grabar ();string cod_flujo
long item, i

cod_flujo = dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo')
if not isNull(cod_flujo) then
	select max(item) into :item from mod_relacion_origen
	where codigo = :cod_flujo;
	if isNull(item) then item = 0
	for i = 1 to tb_1.tp_1.dw_intf.RowCount()
		if isNull(tb_1.tp_1.dw_intf.GetItemNumber(i,'item')) then
			item = item + 1
			tb_1.tp_1.dw_intf.SetItem(i,'item',item)
		end if
	next
end if

if super::grabar() = 1 then
	Commit;
	Return 1
else
	Rollback;
	Return -1
end if

end function

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

public function integer f_anula ();string estado
long f
double ld_ant
uo_datastore dw_cp
dw_cp = Create uo_datastore
dw_cp.DataObject = 'dw_contra_ppto'
dw_cp.setTransObject(SQLCA)

estado = dw_cab.GetItemString(dw_cab.GetRow(),'estado')

if super::f_anula() = 1 then
	if not (left(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),5) = 'PRPDI') then
		if f_anula_interfaz(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),tb_1.tp_1.dw_intf) = -1 then
			Rollback;
			Return -1
		end if
		if left(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),5) = 'PRSCT' then
			long i, ano, ct, ot
			string err
			for i = 1 to tb_1.tp_1.dw_intf.RowCount()
				ano = tb_1.tp_1.dw_intf.GetItemNumber(i,'num_orig1')
				ct = tb_1.tp_1.dw_intf.GetItemNumber(i,'num_orig2')
				ot = tb_1.tp_1.dw_intf.GetItemNumber(i,'num_orig3')
				if dw_cp.retrieve(ano, ct, ot) > 0 then
					for i = 1 to dw_cp.RowCount()
						f = tb_1.tp_2.dw_rub.Find("coddoc_orig='"+dw_cp.GetItemString(i,'coddoc_dispo')+"' and clugar_orig='"+dw_cp.GetItemString(i,'cLugar_dispo')+"' and " + &
						"numdoc_orig="+string(dw_cp.GetItemNumber(i,'numdoc_dispo'))+" and item_orig="+string(dw_cp.GetItemNumber(i,'item_dispo')),1,tb_1.tp_2.dw_rub.RowCount())
						if f > 0 then
							ld_ant = dw_cp.getItemNumber(i,'monto_utilizado')
							if isNull(ld_ant) then ld_ant = 0
							if ld_ant - tb_1.tp_2.dw_rub.getItemNumber(f,'monto_vigente') < 0 then
								rollback;
								MessageBox('Atención','El monto_utilizado sería menor de cero (contra_presu).')
								Return -1
							end if
							dw_cp.setItem(i,'monto_utilizado',ld_ant - tb_1.tp_2.dw_rub.getItemNumber(f,'monto_vigente'))
						end if
					next
				else
					MessageBox('Atención','El contrato no tiene asociadas disponibilidades')
					rollback;
					Return -1
				end if
				
				if dw_cp.Update() = -1 then
					Rollback;
					Return -1
				end if
				update contra_presu set coddocu_reser=NULL, clugar_reser=NULL, numdoc_reser=NULL
				where ano=:ano and ncontrato=:ct and otrosi=:ot;
				if SQLCA.SQLCode = -1 then
					err = sqlca.sqlerrtext
					rollback;
					messagebox('Error actualizando contra_presu',err)
					return -1
				end if
			next
		end if
	end if
	if estado = '1' then
		if f_anula_origen() = 0 then
			commit;
		else
			Rollback;
			Return -1
		end if
	end if
else
	Rollback;
	Return -1
end if

Return 0

end function

public subroutine f_cambio ();i_cambio=true
end subroutine

on w_new_reser.create
int iCurrent
call super::create
end on

on w_new_reser.destroy
call super::destroy
end on

event p_open;call super::p_open;
tb_1.tp_1.Visible = TRUE
tb_1.tp_1.Enabled = TRUE
tb_1.tp_2.dw_sle.Enabled = FALSE
tb_1.tp_2.pb_find_rubro.Enabled = FALSE
tb_1.tp_3.Visible = FALSE
tb_1.tp_3.Enabled = FALSE
tb_1.tp_4.Visible = FALSE
tb_1.tp_4.Enabled = FALSE
tb_1.tp_2.pb_2.enabled=false

end event

type tab_1 from w_docum_base1`tab_1 within w_new_reser
integer y = 212
integer height = 764
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
integer height = 732
end type

type tab_cont from w_docum_base1`tab_cont within tab_1
integer height = 732
end type

type cbx_1 from w_docum_base1`cbx_1 within w_new_reser
end type

type dw_movi from w_docum_base1`dw_movi within w_new_reser
end type

type pb_find from w_docum_base1`pb_find within w_new_reser
integer x = 2907
integer y = 36
end type

type tb_1 from w_docum_base1`tb_1 within w_new_reser
integer y = 1036
integer width = 4882
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
integer width = 4846
pb_13 pb_13
pb_15 pb_15
end type

on tp_1.create
this.pb_13=create pb_13
this.pb_15=create pb_15
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_13
this.Control[iCurrent+2]=this.pb_15
end on

on tp_1.destroy
call super::destroy
destroy(this.pb_13)
destroy(this.pb_15)
end on

type dw_intf from w_docum_base1`dw_intf within tp_1
integer y = 56
integer width = 2816
integer height = 916
end type

event dw_intf::clicked;call super::clicked;if row < 1 then Return
if RowCount() = 0 then Return

if GetRow() <> row then
	ScrolltoRow(row)
end if
end event

type tp_2 from w_docum_base1`tp_2 within tb_1
integer width = 4846
end type

type st_2 from w_docum_base1`st_2 within tp_2
end type

type pb_10 from w_docum_base1`pb_10 within tp_2
boolean originalsize = false
end type

type pb_2 from w_docum_base1`pb_2 within tp_2
boolean originalsize = false
end type

event pb_2::clicked;call super::clicked;if dw_cab.RowCount() = 0 then Return 0
double nd
long fila
if f_borra_rubro() = -1 then Return -1

if dw_cab.GetItemString(1,'cod_flujo') = 'PRPDIPG' then
	nd = dw_rub.GetItemNumber(dw_rub.GetRow(),'numdoc_orig')
	dw_rub.DeleteRow(dw_rub.GetRow())
	fila = dw_rub.Find("numdoc_orig="+string(nd),1,dw_rub.RowCount())
	if fila = 0 then
		fila = tb_1.tp_1.dw_intf.Find("num_orig1="+string(nd),1,tb_1.tp_1.dw_intf.RowCount())
		if fila > 0 then tb_1.tp_1.dw_intf.DeleteRow(fila)
	end if
else
	messageBox('Atención','Debe eliminar los registros desde la ficha interfaz')
end if

end event

type pb_find_rubro from w_docum_base1`pb_find_rubro within tp_2
end type

type dw_sle from w_docum_base1`dw_sle within tp_2
end type

type dw_rub from w_docum_base1`dw_rub within tp_2
integer width = 4773
string dataobject = "dw_pre_doc_cp_orig"
end type

event dw_rub::itemchanged;call super::itemchanged;dec valor

valor=round(dec(data),i_dec_gral)
if i_dec_gral=0 then
	valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
end if
if valor < 0 then
	settext('0')
	setitem(row,'monto',0)
	return 1
end if
accepttext()
setitem(row,'Monto',valor)
setitem(row,'Monto_vigente',valor)
i_cambio=true
return 2

end event

event dw_rub::constructor;call super::constructor;object.monto.edit.displayonly='yes'
end event

type tp_3 from w_docum_base1`tp_3 within tb_1
integer width = 4846
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
integer width = 4329
end type

type tp_4 from w_docum_base1`tp_4 within tb_1
integer width = 4846
end type

type dw_dest from w_docum_base1`dw_dest within tp_4
end type

type tp_5 from w_docum_base1`tp_5 within tb_1
integer width = 4846
end type

type pb_1 from w_docum_base1`pb_1 within tp_5
end type

type pb_del_ter from w_docum_base1`pb_del_ter within tp_5
end type

type pb_adic_ter from w_docum_base1`pb_adic_ter within tp_5
end type

event pb_adic_ter::clicked;call super::clicked;Super::EVENT Clicked()
long f
f = AncestorReturnValue
string flujo
flujo = dw_cab.getitemstring(1,'cod_flujo')
if left(flujo,4) = 'PRNM' then
	dw_ter.SetItem(f,'nomina','1')
end if

end event

type st_7 from w_docum_base1`st_7 within tp_5
end type

type dw_terce from w_docum_base1`dw_terce within tp_5
end type

type dw_ter from w_docum_base1`dw_ter within tp_5
end type

type gb_2 from w_docum_base1`gb_2 within tp_5
end type

type tp_6 from w_docum_base1`tp_6 within tb_1
integer width = 4846
end type

type pb_repmod from w_docum_base1`pb_repmod within tp_6
end type

event pb_repmod::constructor;call super::constructor;inicia('documento!','RM',clugar)
end event

type dw_modif from w_docum_base1`dw_modif within tp_6
end type

type pb_print from w_docum_base1`pb_print within w_new_reser
integer x = 2752
integer y = 36
end type

type pb_save_def from w_docum_base1`pb_save_def within w_new_reser
integer x = 2597
integer y = 36
end type

type pb_anula from w_docum_base1`pb_anula within w_new_reser
integer x = 2286
integer y = 36
end type

type pb_save from w_docum_base1`pb_save within w_new_reser
integer x = 2441
integer y = 36
end type

type pb_new from w_docum_base1`pb_new within w_new_reser
integer x = 2130
integer y = 36
end type

type st_1 from w_docum_base1`st_1 within w_new_reser
end type

type dw_historial from w_docum_base1`dw_historial within w_new_reser
integer height = 792
end type

event dw_historial::rowfocuschanged;call super::rowfocuschanged;if currentrow = 0 or GetRow() = 0 then Return
if GetItemString(GetRow(),'cod_flujo') = 'PRNMRFC' then
	tb_1.tp_1.dw_intf.DataObject = 'dw_intf_nom_res'
	tb_1.tp_2.dw_rub.modify("monto.protect='1'")
	tb_1.tp_4.dw_dest.modify("monto.protect='1'")			
	tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
else
	tb_1.tp_2.dw_rub.modify("monto.protect='0'")
	tb_1.tp_4.dw_dest.modify("monto.protect='0'")			
end if

end event

type dw_vig_per from w_docum_base1`dw_vig_per within w_new_reser
end type

type gb_1 from w_docum_base1`gb_1 within w_new_reser
integer y = 156
end type

type dw_cab from w_docum_base1`dw_cab within w_new_reser
integer width = 2546
integer height = 764
string title = ""
string icon = "DataWindow5!"
end type

event dw_cab::itemchanged;call super::itemchanged;string flujo
long i
if getColumnName() = 'cod_flujo' then
	st_interfaz st_p

	st_p.codmod = data
	st_p.dw_cab = dw_cab
	st_p.dw_obj = tb_1.tp_2.dw_rub
	st_p.dw_ter = tb_1.tp_5.dw_ter
	st_p.dw_it = tb_1.tp_1.dw_intf
	st_p.cod_vigencia = i_vigencia

	flujo = getitemstring(1,'cod_flujo')
	choose case wf_cambio_flujo()
		case -1
			dw_historial.post event rowfocuschanged(dw_historial.getrow())
		case 1
			
		case 2
			setitem(1,'cod_flujo',flujo)
			settext(flujo)
			return 2
	end choose
	AcceptText()
	choose case GetItemString(1,'cod_flujo')
		case 'PRPDIPG','PRPDIRFC','PRPDIPT','PRPDINC' 
			tb_1.tp_1.dw_intf.DataObject= 'dw_flujo_2s1n'
			tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
			st_p.coddoc = 'PDI'
			st_p.filtro = "%PR"
			tb_1.tp_5.pb_1.enabled=true
			tb_1.tp_5.pb_del_ter.enabled=true
			tb_1.tp_5.pb_adic_ter.enabled=true
			openwithparm(w_lleva_dispo_reserv,st_p)
			tb_1.tp_2.dw_rub.modify("monto.protect='0'")
			tb_1.tp_4.dw_dest.modify("monto.protect='0'")						
		case 'PRSCTPT','PRSCTRFC','PRNCRFC','PRNCPT' // Reserva desde contrato
			tb_1.tp_1.dw_intf.DataObject= 'dw_flujo_2s1n_3n'
			tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
			st_p.filtro = "(en_destino = '0' or isNull(en_destino)) and (estado = '1') and (cod_flujo like '%PR')"
			st_p.coddoc = 'SCT'
			openwithparm(w_choosectto,st_p)
			tb_1.tp_2.dw_rub.modify("monto.protect='1'")
			tb_1.tp_4.dw_dest.modify("monto.protect='1'")						
		case 'PRNMRFC' 
			tb_1.tp_1.dw_intf.DataObject = 'dw_intf_nom_res'
			tb_1.tp_5.pb_1.enabled=false
			tb_1.tp_5.pb_del_ter.enabled=false
			tb_1.tp_5.pb_adic_ter.enabled=false
			tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
			openwithparm(w_lleva_nom_reser,st_p)
			tb_1.tp_2.dw_rub.modify("monto.protect='1'")
			tb_1.tp_4.dw_dest.modify("monto.protect='1'")						
		case else
			Messagebox('Atención','Este flujo no se encuentra programado')
			tb_1.tp_1.dw_intf.Reset()
	end choose
	tb_1.tp_1.Visible = TRUE
	tb_1.tp_1.Enabled = TRUE
end if
i_cambio = true

end event

event dw_cab::retrieveend;call super::retrieveend;if rowcount=0 then return
choose case GetItemString(1,'cod_flujo')
	case 'PRPDIPG','PRPDIRFC','PROCSCT' // Reserva desde Orden de Compra para Giros
		tb_1.tp_1.dw_intf.DataObject= 'dw_flujo_2s1n'
		tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
	case 'PRSCTPT','PRSCTRFC','PRNCPT','PRNCRFC' // Reserva desde contrato
		tb_1.tp_1.dw_intf.DataObject= 'dw_flujo_2s1n_3n'
		tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
	CASE 'PRNMRFC'
		tb_1.tp_1.dw_intf.DataObject= 'dw_intf_nom_res'
		tb_1.tp_1.dw_intf.SetTransObject(SQLCA)
	case else
		tb_1.tp_1.dw_intf.Reset()
end choose

end event

type dw_cont from w_docum_base1`dw_cont within w_new_reser
end type

type pb_13 from picturebutton within tp_1
event mousemove pbm_mousemove
string tag = "Reservar"
integer x = 2981
integer y = 64
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Buscar documento origen"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if i_estado_per <> '1' then
	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
	Return
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','La Reserva ya ha sido cerrada')
	Return
end if

st_interfaz st_p

st_p.codmod = dw_cab.GetItemString(1,'cod_flujo')
st_p.dw_cab = dw_cab
st_p.dw_obj = tb_1.tp_2.dw_rub
st_p.dw_ter = tb_1.tp_5.dw_ter
st_p.dw_it = dw_intf
st_p.cod_vigencia = i_vigencia

if st_p.codmod = 'PRSCTPT' or st_p.codmod = 'PRSCTRFC' or st_p.codmod = 'PRNCPT' or st_p.codmod = 'PRNCRFC' then
	st_p.filtro = "(en_destino = '0' or isNull(en_destino)) and (estado = '1') and (cod_flujo like '%PR')"
	st_p.coddoc = 'SCT'
	tb_1.tp_5.pb_1.enabled=false
	tb_1.tp_5.pb_del_ter.enabled=false
	tb_1.tp_5.pb_adic_ter.enabled=false
	openwithparm(w_choosectto,st_p)
elseif st_p.codmod = 'PRPDIRFC' or st_p.codmod = 'PRPDIPT' or st_p.codmod = 'PRPDIPG' or st_p.codmod = 'PRPDINC' then
	st_p.coddoc = 'PDI'
	st_p.filtro = "%PR"
	tb_1.tp_5.pb_1.enabled=true
	tb_1.tp_5.pb_del_ter.enabled=true
	tb_1.tp_5.pb_adic_ter.enabled=true
	openwithparm(w_lleva_dispo_reserv,st_p)
elseif st_p.codmod='PRNMRFC' then
	st_p.coddoc = 'PDI'
	st_p.filtro = "%PR"
	tb_1.tp_5.pb_1.enabled=false
	tb_1.tp_5.pb_del_ter.enabled=false
	tb_1.tp_5.pb_adic_ter.enabled=false
	openwithparm(w_lleva_nom_reser,st_p)
else
	messagebox('Atención','Este flujo no se encuentra programado')
end if
if dw_intf.GetNextModified(0,Primary!) > 0 then i_cambio = TRUE

end event

type pb_15 from picturebutton within tp_1
event mousemove pbm_mousemove
string tag = "Reservar"
integer x = 2976
integer y = 192
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Retirar Fila"
end type

event clicked;uo_DataStore dw_it
long i, nd, fila
string cl

if dw_cab.RowCount() = 0 then Return
if dw_intf.RowCount() = 0 then Return
if i_estado_per  <> '1' then
	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
	Return
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','La Reserva ya ha sido cerrada')
	Return
end if
dw_it = Create uo_DataStore
if pos('PRPDI',dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),1)>0 then return
if dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRPDIPG' then

	cl = dw_intf.GetItemString(dw_intf.GetRow(),'char_orig2')
	nd = dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig1')
	fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
	do while fila > 0 
		tb_1.tp_2.dw_rub.DeleteRow(fila)
		fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
	loop
	dw_intf.DeleteRow(0)
	i_cambio = TRUE
	
elseif dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PROCSCT' then
	dw_it.DataObject = 'dw_flujo_2s1n'
	dw_it.SetTransObject(SQLCA)
	
	if dw_it.Retrieve('OCPDIPR',dw_intf.GetItemString(dw_intf.GetRow(),'char_orig1'),dw_intf.GetItemString(dw_intf.GetRow(),'char_orig2'),dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig1')) > 0 then
		for i =  1 to dw_it.RowCount()
			if dw_it.GetItemString(i,'char_orig1') = 'PDI' then
				cl = dw_it.GetItemString(i,'char_orig2')
				nd = dw_it.GetItemNumber(i,'num_orig1')
				fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
				do while fila > 0 
					tb_1.tp_2.dw_rub.DeleteRow(fila)
					fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
				loop
				
			end if
		next
		dw_intf.DeleteRow(0)
		i_cambio = TRUE
	end if
	
elseif dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRSCTPT' or dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRSCTRFC' or dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRNCRFC' or dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo') = 'PRNCPT' then
	dw_it.DataObject = 'dw_contra_ppto'
	dw_it.SetTransObject(SQLCA)

	if dw_it.Retrieve(dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig1'),dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig2'),dw_intf.GetItemNumber(dw_intf.GetRow(),'num_orig3')) > 0 then
		for i =  1 to dw_it.RowCount()
			cl = dw_it.GetItemString(i,'clugar_dispo')
			nd = dw_it.GetItemNumber(i,'numdoc_dispo')
			fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
			do while fila > 0 
				tb_1.tp_2.dw_rub.DeleteRow(fila)
				fila = tb_1.tp_2.dw_rub.Find("clugar_orig='"+cl+"' and numdoc_orig="+string(nd),1,tb_1.tp_2.dw_rub.RowCount())
			loop
		next
		dw_intf.DeleteRow(0)
		i_cambio = TRUE
	end if
	
end if

end event

