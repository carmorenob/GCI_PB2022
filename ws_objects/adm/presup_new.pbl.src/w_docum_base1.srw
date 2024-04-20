$PBExportHeader$w_docum_base1.srw
forward
global type w_docum_base1 from window
end type
type tab_1 from tab within w_docum_base1
end type
type tab_res from userobject within tab_1
end type
type tab_res from userobject within tab_1
end type
type tab_cont from userobject within tab_1
end type
type tab_cont from userobject within tab_1
end type
type tab_1 from tab within w_docum_base1
tab_res tab_res
tab_cont tab_cont
end type
type cbx_1 from checkbox within w_docum_base1
end type
type dw_movi from datawindow within w_docum_base1
end type
type pb_find from picturebutton within w_docum_base1
end type
type tb_1 from tab within w_docum_base1
end type
type tp_1 from userobject within tb_1
end type
type dw_intf from datawindow within tp_1
end type
type tp_1 from userobject within tb_1
dw_intf dw_intf
end type
type tp_2 from userobject within tb_1
end type
type st_2 from statictext within tp_2
end type
type pb_10 from picturebutton within tp_2
end type
type pb_2 from picturebutton within tp_2
end type
type pb_find_rubro from picturebutton within tp_2
end type
type dw_sle from datawindow within tp_2
end type
type dw_rub from datawindow within tp_2
end type
type tp_2 from userobject within tb_1
st_2 st_2
pb_10 pb_10
pb_2 pb_2
pb_find_rubro pb_find_rubro
dw_sle dw_sle
dw_rub dw_rub
end type
type tp_3 from userobject within tb_1
end type
type em_1 from editmask within tp_3
end type
type st_5 from statictext within tp_3
end type
type st_4 from statictext within tp_3
end type
type st_3 from statictext within tp_3
end type
type dw_sle2 from datawindow within tp_3
end type
type pb_find_fue from picturebutton within tp_3
end type
type pb_del_fue from picturebutton within tp_3
end type
type dw_r from datawindow within tp_3
end type
type dw_fuen from datawindow within tp_3
end type
type tp_3 from userobject within tb_1
em_1 em_1
st_5 st_5
st_4 st_4
st_3 st_3
dw_sle2 dw_sle2
pb_find_fue pb_find_fue
pb_del_fue pb_del_fue
dw_r dw_r
dw_fuen dw_fuen
end type
type tp_4 from userobject within tb_1
end type
type dw_dest from datawindow within tp_4
end type
type tp_4 from userobject within tb_1
dw_dest dw_dest
end type
type tp_5 from userobject within tb_1
end type
type pb_1 from picturebutton within tp_5
end type
type pb_del_ter from picturebutton within tp_5
end type
type pb_adic_ter from picturebutton within tp_5
end type
type st_7 from statictext within tp_5
end type
type dw_terce from datawindow within tp_5
end type
type dw_ter from datawindow within tp_5
end type
type gb_2 from groupbox within tp_5
end type
type tp_5 from userobject within tb_1
pb_1 pb_1
pb_del_ter pb_del_ter
pb_adic_ter pb_adic_ter
st_7 st_7
dw_terce dw_terce
dw_ter dw_ter
gb_2 gb_2
end type
type tp_6 from userobject within tb_1
end type
type pb_repmod from pb_report within tp_6
end type
type dw_modif from datawindow within tp_6
end type
type tp_6 from userobject within tb_1
pb_repmod pb_repmod
dw_modif dw_modif
end type
type tb_1 from tab within w_docum_base1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
tp_5 tp_5
tp_6 tp_6
end type
type pb_print from pb_report within w_docum_base1
end type
type pb_save_def from picturebutton within w_docum_base1
end type
type pb_anula from picturebutton within w_docum_base1
end type
type pb_save from picturebutton within w_docum_base1
end type
type pb_new from picturebutton within w_docum_base1
end type
type st_1 from statictext within w_docum_base1
end type
type dw_historial from datawindow within w_docum_base1
end type
type dw_vig_per from datawindow within w_docum_base1
end type
type gb_1 from groupbox within w_docum_base1
end type
type dw_cab from datawindow within w_docum_base1
end type
type dw_cont from datawindow within w_docum_base1
end type
end forward

global type w_docum_base1 from window
integer width = 5563
integer height = 2292
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event p_open ( )
tab_1 tab_1
cbx_1 cbx_1
dw_movi dw_movi
pb_find pb_find
tb_1 tb_1
pb_print pb_print
pb_save_def pb_save_def
pb_anula pb_anula
pb_save pb_save
pb_new pb_new
st_1 st_1
dw_historial dw_historial
dw_vig_per dw_vig_per
gb_1 gb_1
dw_cab dw_cab
dw_cont dw_cont
end type
global w_docum_base1 w_docum_base1

type variables
protected boolean i_cambio,i_nuevo
protected long i_vigencia,i_año,i_periodo,i_ndoc,i_fila
protected datetime ld_fini_per,ld_ffin_per
protected datawindowchild idw_año,idw_periodo,idw_flujo,dwc_r
protected string i_estado_per,i_equ,i_operacion,i_ing_gasto1,i_ing_gasto2,i_convenio
string i_cdoc='PDI',i_desdoc
string c_estado,val_res
date vig_termina
int i_dec_gral,i_aprox_gral
protected datawindowchild dwc_f, dwc_t
end variables

forward prototypes
public function integer f_pregunta ()
public function integer grabar ()
public function integer grabar_def ()
public function integer f_anula ()
public function integer f_borra_rubro ()
public subroutine reset_dws ()
public function integer grabar_def_1 (string p_campo, integer p_signo)
public function integer wf_crea_docurel (string p_cdoc, string p_desdoc, string p_campo, string p_codflujo)
public function integer wf_cambio_flujo ()
public function integer f_verif_montos ()
end prototypes

event p_open();tb_1.selectedtab=2

end event

public function integer f_pregunta ();if dw_cab.accepttext()=-1 then return 3
if tb_1.tp_2.dw_rub.accepttext()=-1 then return 3
if tb_1.tp_5.dw_ter.accepttext()=-1 then return 3
if tb_1.tp_6.dw_modif.accepttext()=-1 then return 3
if tb_1.tp_3.dw_fuen.accepttext()=-1 then return 3
if tb_1.tp_4.dw_dest.accepttext()=-1 then return 3
if not i_cambio then return 2
return messagebox("Atención, realizó cambios",this.tag,question!,yesnocancel!,3)
end function

public function integer grabar ();if dw_cab.accepttext()=-1 then return -1
if tb_1.tp_2.dw_rub.accepttext()=-1 then return -1
if tb_1.tp_5.dw_ter.accepttext()=-1 then return -1
if tb_1.tp_6.dw_modif.accepttext()=-1 then return -1
if tb_1.tp_3.dw_fuen.accepttext()=-1 then return -1
if tb_1.tp_4.dw_dest.accepttext()=-1 then return -1
if (not i_cambio) and (not i_nuevo) then return 1
f_quitafiltro(tb_1.tp_2.dw_rub,string(rgb(255,255,255)))

string cod_flujo,err
long item, i,j

if i_cdoc='PR'  and val_res='1' then
	if isnull(dw_cont.getitemstring(1,'nro_cont')) then
		messagebox('Atención','Falta Nro Contrato')
		Return -1	
	end if
	if isnull(dw_cont.getitemdatetime(1,'fecha_cont')) then
		messagebox('Atención','Falta Fecha Contrato')
		Return -1	
	end if
	if isnull(dw_cont.getitemstring(1,'clase_cont')) then
		messagebox('Atención','Falta Clase Contrato')
		Return -1	
	end if
	if isnull(dw_cont.getitemstring(1,'tipo_cont')) then
		messagebox('Atención','Falta Tipo Contrato')
		Return -1	
	end if	
	if isnull(dw_cont.getitemstring(1,'lugar_cont')) then
		messagebox('Atención','Falta Lugar Contrato')
		Return -1	
	end if		
end if

cod_flujo = dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo')
if not isNull(cod_flujo) then
	select max(item) into :item from mod_relacion_origen
	where codigo = :cod_flujo;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo mod_relacion_origen',err)
		return -1
	end if
	if isNull(item) then item = 0
	for i = 1 to tb_1.tp_1.dw_intf.RowCount()
		if isNull(tb_1.tp_1.dw_intf.GetItemNumber(i,'item')) then
			item = item + 1
			tb_1.tp_1.dw_intf.SetItem(i,'item',item)
		end if
	next
end if

if i_nuevo then 
	i_ndoc=f_trae_ndoc(i_cdoc,clugar,i_desdoc)
	if i_ndoc=-1 then return -1
end if
if isnull(dw_cab.getitemnumber(1,'numdoc')) then dw_cab.setitem(1,'numdoc',i_ndoc)
for j=1 to tb_1.tp_2.dw_rub.rowcount()
	if isnull(tb_1.tp_2.dw_rub.getitemnumber(j,'numdoc')) then tb_1.tp_2.dw_rub.setitem(j,'numdoc',i_ndoc)
next
tb_1.tp_3.dw_fuen.setredraw(false)
tb_1.tp_3.dw_fuen.setfilter('')
tb_1.tp_3.dw_fuen.filter()
for j=1 to tb_1.tp_3.dw_fuen.rowcount()
	if isnull(tb_1.tp_3.dw_fuen.getitemnumber(j,'numdoc')) then tb_1.tp_3.dw_fuen.setitem(j,'numdoc',i_ndoc)
next
tb_1.tp_2.dw_rub.event rowfocuschanged(tb_1.tp_2.dw_rub.getrow())
tb_1.tp_3.dw_fuen.setredraw(true)
for j=1 to tb_1.tp_5.dw_ter.rowcount()
	if isnull(tb_1.tp_5.dw_ter.getitemnumber(j,'numdoc')) then tb_1.tp_5.dw_ter.setitem(j,'numdoc',i_ndoc)
next
for j=1 to tb_1.tp_1.dw_intf.rowcount()
	if isnull(tb_1.tp_1.dw_intf.getitemnumber(j,'num_doc1')) then tb_1.tp_1.dw_intf.setitem(j,'num_doc1',i_ndoc)
next

if i_cdoc='PR' then
	dw_cab.setitem(1,'nro_cont',dw_cont.getitemstring(1,'nro_cont'))
	dw_cab.setitem(1,'fecha_cont',dw_cont.getitemdatetime(1,'fecha_cont'))
	dw_cab.setitem(1,'clase_cont',dw_cont.getitemstring(1,'clase_cont'))
	dw_cab.setitem(1,'tipo_cont',dw_cont.getitemstring(1,'tipo_cont'))
	dw_cab.setitem(1,'lugar_cont',dw_cont.getitemstring(1,'lugar_cont'))
	tab_1.selecttab(1) 
	dw_cont.visible=false
end if

if dw_cab.update(true,false)=-1 then return -1
i_operacion = 'Delete'
if tb_1.tp_3.dw_fuen.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if

if tb_1.tp_2.dw_rub.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = 'Insert'
if tb_1.tp_2.dw_rub.Update(true,false) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tb_1.tp_3.dw_fuen.Update(true,false) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = ''
if tb_1.tp_1.dw_intf.update(true,false)=-1 then return -1
if tb_1.tp_5.dw_ter.update(true,false)=-1 then return -1

dw_cab.resetupdate()
tb_1.tp_2.dw_rub.resetupdate()
tb_1.tp_1.dw_intf.resetupdate()
tb_1.tp_5.dw_ter.resetupdate()
tb_1.tp_6.dw_modif.resetupdate()
tb_1.tp_3.dw_fuen.resetupdate()
tb_1.tp_4.dw_dest.resetupdate()
if i_nuevo then
	i_nuevo=false
	i_cambio=false
	dw_vig_per.event itemchanged(1,dw_vig_per.object.periodo,string(i_periodo))
	j=dw_historial.find('numdoc='+string(i_ndoc),1,dw_historial.rowcount())
	if j<> dw_historial.getrow() then
		dw_historial.scrolltorow(j)
	else
		dw_historial.event rowfocuschanged(j)
	end if
	event timer()
end if
i_nuevo=false
i_cambio=false
pb_new.enabled=true
return 1
end function

public function integer grabar_def ();if dw_cab.getitemstring(1,'estado')<>'0' then 
	messagebox('Atención','Ya se encuentra guardado definitivo')
	return -1
end if
return 1
end function

public function integer f_anula ();if dw_cab.rowcount()=0 then return -1
string flujo
flujo=dw_cab.getitemstring(1,'cod_flujo')
if (i_cdoc='PR' and flujo='PRPG-') or (i_cdoc='PI' and flujo='PIPRC-') then
	messagebox('Atención','Este Documento fue generado en otra ventana no lo puede anular desde aquí')
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


//se debe es chequear el mes actual para ver si ya está cerrado 
datetime  ld_ahora,ld_fecons,fnula
string est,err
long per,j,cuantos,donde,item

cuantos=dw_movi.rowcount()
if cuantos>0 then
	ld_fecons=dw_cab.getitemdatetime(1,'fecha_consecu')
	ld_ahora=datetime(today(),now())
		
	if (ld_ahora<=ld_fini_per or ld_ahora >=ld_ffin_per) then
		if year(date(ld_ahora))<> year(date(ld_fecons)) and month(date(ld_fecons))=1 then
			ld_ahora=datetime(date('02'+'/'+string(month(date(ld_fini_per)))+'/'+string(year(date(ld_fini_per)))), now())
		end if
		if year(date(ld_ahora))<> year(date(ld_fecons)) and month(date(ld_fecons))=12 then
			ld_ahora=datetime(date(string(day(date(ld_ahora)))+'/'+string(month(date(ld_fini_per)))+'/'+string(year(date(ld_fini_per)))), now())
		end if
	end if
end if

per=month(date(ld_ahora))

select estado into :est from pre_periodos where cod_vigencia=:i_vigencia and periodo=:per;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error leyendo estado del periodo actual',err)
	return -1
end if
if sqlca.sqlnrows=0 then
	messagebox('Atención no está creado el periodo actual','Debe crear el periodo actual ('+string(per)+') para la vigencia '+string(i_vigencia))
	return -1
end if
if est='0' then 
	messagebox('Atención','El periodo actual no está activo')
	return -1
end if

f_quitafiltro(tb_1.tp_2.dw_rub,string(rgb(255,255,255)))
if tb_1.tp_2.dw_rub.find('monto_utilizado > 0 or monto_interfaz > 0',1,tb_1.tp_2.dw_rub.rowcount())>0 then
	messagebox('Atención','Este documento ya fue utilizado en el módulo destino')
	return -1
end if
st_xa_anular st_anula
st_anula.tipo='PR'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return -1
string est_ant,nulo,codigo

setnull(fnula)
setnull(nulo)
est_ant=dw_cab.getitemstring(1,'estado')
dw_cab.setitem(1,'estado','3')
dw_cab.setitem(1,'anulado',usuario)
dw_cab.setitem(1,'fechaanula',datetime(today(),now()))
dw_cab.setitem(1,'motiv_anula',st_anula.observacion)
dw_cab.setitem(1,'cod_anula',st_anula.motivo)

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
if dw_cab.update(true,false)=-1 then
	dw_cab.setitem(1,'estado',est_ant)
	dw_cab.setitem(1,'anulado',nulo)
	dw_cab.setitem(1,'fechaanula',fnula)
	dw_cab.resetupdate()
	rollback;
	return -1
end if
dw_cab.resetupdate()
dw_movi.resetupdate()
dw_historial.setitem(dw_historial.getrow(),'anulado',usuario)//solo de mostrario
dw_historial.setitem(dw_historial.getrow(),'estado','3')
return 1

end function

public function integer f_borra_rubro ();if dw_cab.RowCount() = 0 then Return -1
if dw_cab.GetItemString(1,'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return -1
end if
if i_estado_per  <> '1' then
	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
	Return -1
end if

if tb_1.tp_2.dw_rub.RowCount() = 0 then Return -1

Return 0

end function

public subroutine reset_dws ();dw_cab.reset()
tb_1.tp_1.dw_intf.reset()
tb_1.tp_2.dw_rub.reset()
tb_1.tp_5.dw_ter.reset()
tb_1.tp_6.dw_modif.reset()
tb_1.tp_3.dw_fuen.reset()
tb_1.tp_4.dw_dest.reset()
dw_cont.reset()
dwc_r.reset()
dw_movi.reset()
tb_1.tp_3.dw_fuen.setfilter('')
tb_1.tp_3.dw_fuen.filter()
end subroutine

public function integer grabar_def_1 (string p_campo, integer p_signo);if isnull(dw_cab.getitemstring(1,'cod_flujo')) then
	messagebox('Atención','No ha escogido flujo del documento')
	return -1
end if
if isnull(dw_cab.getitemdatetime(1,'fecha_consecu')) then
	messagebox('Atención','No ha escogido fecha del documento')
	return -1
end if
if month(date(dw_cab.getitemdatetime(1,'fecha_consecu')))<>i_periodo then
	messagebox('Atención','El documento tiene fecha en mes diferente al del periodo')
	return -1
end if

if dw_cab.getitemdatetime(1,'fecha_consecu')<ld_fini_per or dw_cab.getitemdatetime(1,'fecha_consecu')>ld_ffin_per then
	messagebox('Atención','El documento tiene fecha en mes diferente al del periodo')
	return -1
end if

if tb_1.tp_2.dw_rub.rowcount()=0 then
	messagebox('Atención','El documento no tiene Rubros, adicionele para guardar Definitivo')
	return -1
end if
long j,final,donde,item
for j=1 to tb_1.tp_2.dw_rub.rowcount()
	if tb_1.tp_2.dw_rub.getitemnumber(j,'monto')=0 then
		messagebox('Atención','Existen Rubros con montos en cero Revise para continuar')
		return -1
	end if
	if i_cdoc='PDI' or i_cdoc='PTF' or i_cdoc='PPR' then 
		if tb_1.tp_2.dw_rub.getitemnumber(j,'monto')> tb_1.tp_2.dw_rub.getitemnumber(j,'saldo_apropi') then
			messagebox('Atención','No hay saldo suficiente para el rubro del item '+string(j))
			return -1
		else
			tb_1.tp_2.dw_rub.setitem(j,'saldo_plan',tb_1.tp_2.dw_rub.getitemnumber(j,'saldo_apropi') )
		end if
	end if
	tb_1.tp_2.dw_rub.scrolltorow(j)
	if tb_1.tp_3.dw_fuen.getitemnumber(1,'t_x_rubro')<>tb_1.tp_2.dw_rub.getitemnumber(j,'monto') then
		messagebox('Atención','Existen Rubros con equilibrios desiguales Revise para continuar')
		return -1
	end if
next
tb_1.tp_3.dw_fuen.RowCount()
if f_verif_montos() = -1 then
	tb_1.tp_2.dw_rub.ScrolltoRow(tb_1.tp_2.dw_rub.GetRow())
	tb_1.tp_2.dw_rub.SetRedraw(TRUE)
	tb_1.tp_3.dw_fuen.SetRedraw(TRUE)
	return -1
end if
	
if tb_1.tp_2.dw_rub.update(true,false)=-1 then return -1
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
	dw_movi.setitem(donde,'año',i_año)
	dw_movi.setitem(donde,'periodo',i_periodo)
	if today()>=vig_termina  then
		dw_movi.setitem(donde,'fecha',datetime(vig_termina,now()))
	else
		//dw_movi.setitem(donde,'fecha',datetime(today(),now()))
		dw_movi.setitem(donde,'fecha',datetime(date(dw_cab.getitemdatetime(1,'fecha_consecu')),now()))
	end if
	dw_movi.setitem(donde,'coddoc',i_cdoc)
	dw_movi.setitem(donde,'clugar',tb_1.tp_2.dw_rub.getitemstring(j,'clugar'))
	dw_movi.setitem(donde,'numdoc',dw_cab.getitemnumber(1,'numdoc'))
	dw_movi.setitem(donde,'item',tb_1.tp_2.dw_rub.getitemnumber(j,'item'))
	dw_movi.setitem(donde,p_campo,p_signo * tb_1.tp_2.dw_rub.getitemnumber(j,'monto'))
	
	SELECT Max(pre_plan_movi_deta.num_movi) into :item
	FROM pre_plan_movi_deta
	WHERE pre_plan_movi_deta.cod_vigencia=:i_vigencia AND pre_plan_movi_deta.CodTotal=:codigo
	AND pre_plan_movi_deta.periodo=:i_periodo and pre_plan_movi_deta.año=:i_año;
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
tb_1.tp_3.dw_fuen.setredraw(false)
tb_1.tp_3.dw_fuen.setfilter('')
tb_1.tp_3.dw_fuen.filter()
int signo=1
if i_cdoc='PTF' then signo=-1
for j=1 to tb_1.tp_3.dw_fuen.rowcount()
	donde=dw_movi.insertrow(0)
	dw_movi.setitem(donde,'cod_vigencia',i_vigencia)
	codigo=tb_1.tp_3.dw_fuen.getitemstring(j,'codtotal')
	dw_movi.setitem(donde,'codtotal',codigo)
	dw_movi.setitem(donde,'año',i_año)
	dw_movi.setitem(donde,'periodo',i_periodo)
	if today()>=vig_termina  then
		dw_movi.setitem(donde,'fecha',datetime(vig_termina,now()))
	else
		//dw_movi.setitem(donde,'fecha',datetime(today(),now()))
		dw_movi.setitem(donde,'fecha',datetime(date(dw_cab.getitemdatetime(1,'fecha_consecu')),now()))
	end if
	dw_movi.setitem(donde,'coddoc',i_cdoc)
	dw_movi.setitem(donde,'clugar',tb_1.tp_3.dw_fuen.getitemstring(j,'clugar'))
	dw_movi.setitem(donde,'numdoc',dw_cab.getitemnumber(1,'numdoc'))
	dw_movi.setitem(donde,'item',tb_1.tp_3.dw_fuen.getitemnumber(j,'item'))
	dw_movi.setitem(donde,'coddoc_scp',i_cdoc)
	dw_movi.setitem(donde,'clugar_scp',tb_1.tp_3.dw_fuen.getitemstring(j,'clugar'))
	dw_movi.setitem(donde,'numdoc_scp',dw_cab.getitemnumber(1,'numdoc'))
	dw_movi.setitem(donde,'item_scp',tb_1.tp_3.dw_fuen.getitemnumber(j,'item'))
	dw_movi.setitem(donde,'sitem_scp',tb_1.tp_3.dw_fuen.getitemnumber(j,'sitem'))
	dw_movi.setitem(donde,p_campo, signo * p_signo * tb_1.tp_3.dw_fuen.getitemnumber(j,'monto'))
	
	SELECT Max(pre_plan_movi_deta.num_movi) into :item
	FROM pre_plan_movi_deta
	WHERE pre_plan_movi_deta.cod_vigencia=:i_vigencia AND pre_plan_movi_deta.CodTotal=:codigo
	AND pre_plan_movi_deta.periodo=:i_periodo AND pre_plan_movi_deta.año=:i_año;
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
tb_1.tp_2.dw_rub.event rowfocuschanged(tb_1.tp_2.dw_rub.getrow())
tb_1.tp_3.dw_fuen.setredraw(true)
dw_cab.setitem(1,'consecutivo',final)
dw_cab.setitem(1,'estado','1')
if dw_cab.update(true,false)=-1 then return -1
dw_cab.resetupdate()
tb_1.tp_2.dw_rub.resetupdate()
dw_historial.setitem(dw_historial.getrow(),'estado','1')
dw_historial.setitem(dw_historial.getrow(),'consecutivo',final)
dw_historial.setitem(dw_historial.getrow(),'fecha_consecu',dw_cab.getitemdatetime(1,'fecha_consecu'))
i_fila=0
event timer()
return 1
end function

public function integer wf_crea_docurel (string p_cdoc, string p_desdoc, string p_campo, string p_codflujo);uo_datastore dw_cb,dw_cpo,dw_tr,dw_mov
dw_cb=create uo_datastore
dw_cpo=create uo_datastore
dw_tr=create uo_datastore
dw_mov=create uo_datastore
dw_cb.dataobject='dw_pre_doc_cab'
dw_cpo.dataobject='dw_pre_doc_cp'
dw_tr.dataobject='dw_pre_doc_ter'
dw_mov.dataobject='dw_plan_mov_det'
dw_cb.settransobject(sqlca)
dw_cpo.settransobject(sqlca)
dw_tr.settransobject(sqlca)
dw_mov.settransobject(sqlca)

long nres,nconsec,j,nmovi
nres=f_trae_ndoc(p_cdoc,clugar,p_desdoc)
if nres=-1 then goto salir
nconsec=f_consec(i_vigencia,p_cdoc,clugar)
if nconsec=-1 then goto salir
dw_cb.insertrow(1)
dw_cb.setitem(1,'coddoc',p_cdoc)
dw_cb.setitem(1,'clugar',clugar)
dw_cb.setitem(1,'numdoc',nres)
dw_cb.setitem(1,'fecha',datetime(today(),now()))
dw_cb.setitem(1,'cod_vigencia',i_vigencia)
dw_cb.setitem(1,'periodo',i_periodo)
dw_cb.setitem(1,'estado','1')
dw_cb.setitem(1,'consecutivo',nconsec)
dw_cb.setitem(1,'fecha_consecu',dw_cab.getitemdatetime(1,'fecha'))
dw_cb.setitem(1,'usuario',usuario)
dw_cb.setitem(1,'cod_flujo',p_codflujo)
string carreta
carreta=p_desdoc+' automático(a) del '
if i_cdoc='PG' then
	carreta+='Giro '
elseif i_cdoc='PRC' then
	carreta+='Reconocimiento '
end if
dw_cb.setitem(1,'objeto',carreta+string(dw_cab.getitemnumber(1,'consecutivo')))
for j=1 to tb_1.tp_2.dw_rub.rowcount()
	dw_cpo.insertrow(j)
	dw_cpo.setitem(j,'coddoc',p_cdoc)
	dw_cpo.setitem(j,'clugar',clugar)
	dw_cpo.setitem(j,'numdoc',nres)
	dw_cpo.setitem(j,'item',j)
	dw_cpo.setitem(j,'coddoc_orig',tb_1.tp_2.dw_rub.getitemstring(j,'coddoc'))
	dw_cpo.setitem(j,'clugar_orig',tb_1.tp_2.dw_rub.getitemstring(j,'clugar'))
	dw_cpo.setitem(j,'numdoc_orig',tb_1.tp_2.dw_rub.getitemnumber(j,'numdoc'))
	dw_cpo.setitem(j,'item_orig',tb_1.tp_2.dw_rub.getitemnumber(j,'item'))
	dw_cpo.setitem(j,'cod_vigencia',tb_1.tp_2.dw_rub.getitemnumber(j,'cod_vigencia'))
	dw_cpo.setitem(j,'codtotal',tb_1.tp_2.dw_rub.getitemstring(j,'codtotal'))
	dw_cpo.setitem(j,'monto',tb_1.tp_2.dw_rub.getitemnumber(j,'monto'))
	dw_cpo.setitem(j,'monto_vigente',tb_1.tp_2.dw_rub.getitemnumber(j,'monto'))
	if p_cdoc='PR' then dw_cpo.setitem(j,'monto_utilizado',tb_1.tp_2.dw_rub.getitemnumber(j,'monto'))
next
for j=1 to tb_1.tp_5.dw_ter.rowcount()
	dw_tr.insertrow(j)
	dw_tr.setitem(j,'coddoc',p_cdoc)
	dw_tr.setitem(j,'clugar',clugar)
	dw_tr.setitem(j,'numdoc',nres)
	dw_tr.setitem(j,'tipodoc',tb_1.tp_5.dw_ter.getitemstring(j,'tipodoc'))
	dw_tr.setitem(j,'documento',tb_1.tp_5.dw_ter.getitemstring(j,'documento'))
next
if dw_cb.update()=-1 then goto salir
if dw_cpo.update()=-1 then goto salir
if dw_tr.update()=-1 then goto salir
string cod,err
for j=1 to tb_1.tp_2.dw_rub.rowcount()
	dw_mov.insertrow(j)
	dw_mov.setitem(j,'cod_vigencia',tb_1.tp_2.dw_rub.getitemnumber(j,'cod_vigencia'))
	cod=tb_1.tp_2.dw_rub.getitemstring(j,'codtotal')
	dw_mov.setitem(j,'codtotal',cod)
	dw_mov.setitem(j,'periodo',i_periodo)
	dw_mov.setitem(j,'fecha',datetime(today(),now()))
	dw_mov.setitem(j,'coddoc',p_cdoc)
	dw_mov.setitem(j,'clugar',clugar)
	dw_mov.setitem(j,'numdoc',nres)
	dw_mov.setitem(j,'item',j)
	dw_mov.setitem(j,p_campo,tb_1.tp_2.dw_rub.getitemnumber(j,'monto'))
	select max(num_movi) into :nmovi from pre_plan_movi_deta where 
	cod_vigencia =:i_vigencia and codtotal =:cod and periodo=:i_periodo;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo pre_plam_movi_deta (wf_crea_docurel)',err)
		goto salir
	end if
	if isnull(nmovi) then nmovi=0
	nmovi ++
	dw_mov.setitem(j,'num_movi',nmovi)
	if dw_mov.update()=-1 then goto salir
next
destroy(dw_cb)
destroy(dw_cpo)
destroy(dw_tr)
destroy(dw_mov)
garbagecollect()
return 1
salir:
destroy(dw_cb)
destroy(dw_cpo)
destroy(dw_tr)
destroy(dw_mov)
garbagecollect()
return -1
end function

public function integer wf_cambio_flujo ();// retorna : -1 si hay error , 1 si cambio con exito , 2 si cancela
if tb_1.tp_2.dw_rub.RowCount() > 0 or tb_1.tp_1.dw_intf.rowcount()>0 then
	if messageBox('Atención','Se retirarán los Documentos asociados. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return 2
	if i_nuevo then
		tb_1.tp_2.dw_rub.Reset()
		tb_1.tp_1.dw_intf.reset()
	else
		do while tb_1.tp_3.dw_fuen.RowCount()>0
			tb_1.tp_3.dw_fuen.DeleteRow(0)
		loop
		do while tb_1.tp_2.dw_rub.RowCount()>0
			tb_1.tp_2.dw_rub.DeleteRow(0)
		loop

		do while tb_1.tp_1.dw_intf.RowCount()>0
			tb_1.tp_1.dw_intf.DeleteRow(0)
		loop
		if tb_1.tp_3.dw_fuen.Update() = -1 then Return -1
		if tb_1.tp_2.dw_rub.Update() = -1 then Return -1
		if tb_1.tp_1.dw_intf.Update() = -1 then Return -1
		commit;
	end if
end if
return 1
end function

public function integer f_verif_montos ();integer i, f, p
string rubro
tb_1.tp_2.dw_rub.SetRedraw(FALSE)
tb_1.tp_3.dw_fuen.SetRedraw(FALSE)
tb_1.tp_2.dw_rub.SetFilter('')
tb_1.tp_2.dw_rub.Filter()
tb_1.tp_3.dw_fuen.SetFilter('')
tb_1.tp_3.dw_fuen.Filter()

datastore dw_r
dw_r = create dataStore
dw_r.DataObject ='dw_rubros_tmp'

if i_cdoc <> 'PPA' then
	for i = 1 to tb_1.tp_2.dw_rub.RowCount()
		rubro = tb_1.tp_2.dw_rub.GetItemString(i,'codtotal')
		f = dw_r.Find("rubro='"+ rubro +"'",1,dw_r.RowCount())
		if f = 0 then 
			f = dw_r.InsertRow(0)
			dw_r.SetItem(f,'rubro',rubro)
			dw_r.SetItem(f,'valor',tb_1.tp_2.dw_rub.GetItemNumber(i,'monto_vigente'))
			dw_r.SetItem(f,'saldo',tb_1.tp_2.dw_rub.GetItemNumber(i,'saldo_apropi'))
			IF i + 1 <= tb_1.tp_2.dw_rub.RowCount() THEN
				p = tb_1.tp_2.dw_rub.Find("codtotal='"+ rubro +"'",i + 1,tb_1.tp_2.dw_rub.RowCount())
				do while p > 0
					dw_r.SetItem(f,'valor', dw_r.GetItemNumber(f,'valor') + tb_1.tp_2.dw_rub.GetItemNumber(p,'monto_vigente'))
					IF p + 1 > tb_1.tp_2.dw_rub.RowCount() THEN EXIT
					p = tb_1.tp_2.dw_rub.Find("codtotal='"+ rubro +"'",p + 1,tb_1.tp_2.dw_rub.RowCount())
				loop
			end if
			if dw_r.GetItemNumber(f,'valor') > dw_r.GetItemNumber(f,'saldo') then
				MessageBox('Atención','El monto total para el rubro '+rubro+' sobrepasa el saldo de apropiación')
				Return -1
			end if
		end if
	next
end if

if i_cdoc = 'PDI' then
	for i = 1 to tb_1.tp_3.dw_fuen.RowCount()
		rubro = tb_1.tp_3.dw_fuen.GetItemString(i,'codtotal')
		f = dw_r.Find("rubro='"+ rubro +"'",1,dw_r.RowCount())
		if f = 0 then 
			f = dw_r.InsertRow(0)
			dw_r.SetItem(f,'rubro',rubro)
			dw_r.SetItem(f,'valor',tb_1.tp_3.dw_fuen.GetItemNumber(i,'monto'))
			dw_r.SetItem(f,'saldo',tb_1.tp_3.dw_fuen.GetItemNumber(i,'saldo_apropi'))
			IF i + 1 <= tb_1.tp_3.dw_fuen.RowCount() THEN 
				p = tb_1.tp_3.dw_fuen.Find("codtotal='"+ rubro +"'",i + 1,tb_1.tp_3.dw_fuen.RowCount())
				do while p > 0
					dw_r.SetItem(f,'valor', dw_r.GetItemNumber(f,'valor') + tb_1.tp_3.dw_fuen.GetItemNumber(p,'monto'))
					IF p + 1 > tb_1.tp_3.dw_fuen.RowCount() THEN EXIT
					p = tb_1.tp_3.dw_fuen.Find("codtotal='"+ rubro +"'",p + 1,tb_1.tp_3.dw_fuen.RowCount())
				loop
			end if
			if round(dw_r.GetItemNumber(f,'valor'), i_dec_gral) > round(dw_r.GetItemNumber(f,'saldo'), i_dec_gral) then
				MessageBox('Atención','El monto total para el rubro Fuente de Uso '+rubro+' sobrepasa el saldo de apropiación')
				Return -1
			end if
		end if
	next
end if
tb_1.tp_2.dw_rub.ScrolltoRow(tb_1.tp_2.dw_rub.GetRow())
tb_1.tp_2.dw_rub.SetRedraw(TRUE)
tb_1.tp_3.dw_fuen.SetRedraw(TRUE)

Return 0

end function

on w_docum_base1.create
this.tab_1=create tab_1
this.cbx_1=create cbx_1
this.dw_movi=create dw_movi
this.pb_find=create pb_find
this.tb_1=create tb_1
this.pb_print=create pb_print
this.pb_save_def=create pb_save_def
this.pb_anula=create pb_anula
this.pb_save=create pb_save
this.pb_new=create pb_new
this.st_1=create st_1
this.dw_historial=create dw_historial
this.dw_vig_per=create dw_vig_per
this.gb_1=create gb_1
this.dw_cab=create dw_cab
this.dw_cont=create dw_cont
this.Control[]={this.tab_1,&
this.cbx_1,&
this.dw_movi,&
this.pb_find,&
this.tb_1,&
this.pb_print,&
this.pb_save_def,&
this.pb_anula,&
this.pb_save,&
this.pb_new,&
this.st_1,&
this.dw_historial,&
this.dw_vig_per,&
this.gb_1,&
this.dw_cab,&
this.dw_cont}
end on

on w_docum_base1.destroy
destroy(this.tab_1)
destroy(this.cbx_1)
destroy(this.dw_movi)
destroy(this.pb_find)
destroy(this.tb_1)
destroy(this.pb_print)
destroy(this.pb_save_def)
destroy(this.pb_anula)
destroy(this.pb_save)
destroy(this.pb_new)
destroy(this.st_1)
destroy(this.dw_historial)
destroy(this.dw_vig_per)
destroy(this.gb_1)
destroy(this.dw_cab)
destroy(this.dw_cont)
end on

event closequery;choose case f_pregunta()
	case 1
		if grabar()=-1 then
			return 1
		else
			return 0
		end if
	case 2
		return 0
	case 3
		return 1
end choose
end event

event open;SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=29));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 29')
	return 
end if

SELECT CADENA into :val_res
FROM parametros_gen
WHERE (((codigo_para)=47));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 47')
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

if i_cdoc='PR' then
	tab_1.visible=true
	dw_cont.visible=true
else
	tab_1.visible=false
	dw_cont.visible=false
end if
post event p_open()
end event

event timer;if i_fila=dw_historial.getrow() then
	timer(0)
	return
end if
setnull(i_ndoc)
tb_1.tp_3.dw_r.setitem(1,1,i_ndoc)
if dw_historial.getrow()<1 then return
i_ndoc=dw_historial.getitemnumber(dw_historial.getrow(),'numdoc')
sqlca.autocommit=true
dw_cab.retrieve(i_cdoc,clugar,i_ndoc)
sqlca.autocommit=false
tb_1.tp_1.dw_intf.retrieve(dw_historial.getitemstring(dw_historial.getrow(),'cod_flujo'),i_cdoc,clugar,i_ndoc)
tb_1.tp_3.dw_fuen.setfilter('')
tb_1.tp_3.dw_fuen.filter()
tb_1.tp_3.dw_fuen.retrieve(i_cdoc,clugar,i_ndoc)
i_fila=tb_1.tp_3.dw_fuen.RowCount()
//tb_1.tp_4.dw_dest.retrieve(i_cdoc,clugar,i_ndoc)
dwc_r.retrieve(i_cdoc,clugar,i_ndoc)
tb_1.tp_2.dw_rub.retrieve(i_cdoc,clugar,i_ndoc)//este de ultimo porque debe filtrar
tb_1.tp_5.dw_ter.retrieve(i_cdoc,clugar,i_ndoc)
tb_1.tp_6.dw_modif.retrieve(i_cdoc,clugar,i_ndoc)
dw_cont.retrieve(i_cdoc,clugar,i_ndoc)
dw_movi.retrieve(i_cdoc,clugar,i_ndoc)

i_fila=dw_historial.getrow()

timer(0)
end event

event resize;tb_1.resize(newwidth -50, newheight -1050)
gb_1.width=newwidth -20

tb_1.tp_2.dw_rub.resize(newwidth -90, newheight -1400)
tb_1.tp_3.dw_fuen.resize(newwidth -90, newheight -1450)
tb_1.tp_3.st_5.y=tb_1.tp_3.dw_fuen.y+tb_1.tp_3.dw_fuen.height
tb_1.tp_3.em_1.y=tb_1.tp_3.dw_fuen.y+tb_1.tp_3.dw_fuen.height
tb_1.tp_4.dw_dest.resize(newwidth -90, newheight -1250)

tb_1.tp_5.dw_ter.resize(newwidth -400, newheight -1600)
tb_1.tp_5.pb_del_ter.x=tb_1.tp_5.dw_ter.width + 100
tb_1.tp_5.pb_1.x=tb_1.tp_5.dw_ter.width+ 105
tb_1.tp_5.gb_2.y=tb_1.tp_5.dw_ter.height + 100
tb_1.tp_5.dw_terce.y=tb_1.tp_5.dw_ter.height + 170
tb_1.tp_5.pb_adic_ter.y=tb_1.tp_5.dw_ter.height + 170

tb_1.tp_6.dw_modif.resize(newwidth -350, newheight -1250)
tb_1.tp_6.pb_repmod.x=tb_1.tp_6.dw_modif.width + 100
end event

type tab_1 from tab within w_docum_base1
event create ( )
event destroy ( )
integer x = 5385
integer y = 236
integer width = 128
integer height = 760
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
tabposition tabposition = tabsonright!
integer selectedtab = 1
tab_res tab_res
tab_cont tab_cont
end type

on tab_1.create
this.tab_res=create tab_res
this.tab_cont=create tab_cont
this.Control[]={this.tab_res,&
this.tab_cont}
end on

on tab_1.destroy
destroy(this.tab_res)
destroy(this.tab_cont)
end on

event selectionchanged;choose case selectedtab
	case 1 
		dw_cab.visible=true
		dw_cont.visible=false
	case 2  
		dw_cab.visible=false
		dw_cont.visible=true	
end choose


end event

type tab_res from userobject within tab_1
integer x = 18
integer y = 16
integer width = -18
integer height = 728
long backcolor = 67108864
string text = "Reserva"
long tabtextcolor = 33554432
string picturename = "disponible.ico"
long picturemaskcolor = 536870912
end type

type tab_cont from userobject within tab_1
integer x = 18
integer y = 16
integer width = -18
integer height = 728
long backcolor = 67108864
string text = "Contrato"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
end type

type cbx_1 from checkbox within w_docum_base1
integer x = 3122
integer y = 16
integer width = 599
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir al guardar Def."
boolean checked = true
end type

type dw_movi from datawindow within w_docum_base1
boolean visible = false
integer x = 3419
integer y = 20
integer width = 439
integer height = 100
integer taborder = 80
boolean enabled = false
string title = "none"
string dataobject = "dw_plan_mov_det"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type pb_find from picturebutton within w_docum_base1
integer x = 2926
integer y = 12
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "         &b"
boolean originalsize = true
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar Documentos [Alt+B]"
end type

event clicked;st_xa_buscar_pre st
st.dw_vig=dw_vig_per
st.dw_histo=dw_historial
st.cdoc=i_cdoc
openwithparm(w_busca_pre,st)
end event

type tb_1 from tab within w_docum_base1
integer x = 41
integer y = 1012
integer width = 5463
integer height = 1152
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
tp_5 tp_5
tp_6 tp_6
end type

on tb_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.tp_4=create tp_4
this.tp_5=create tp_5
this.tp_6=create tp_6
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3,&
this.tp_4,&
this.tp_5,&
this.tp_6}
end on

on tb_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
destroy(this.tp_4)
destroy(this.tp_5)
destroy(this.tp_6)
end on

type tp_1 from userobject within tb_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 5426
integer height = 1024
boolean enabled = false
long backcolor = 67108864
string text = "Interfaz"
long tabtextcolor = 33554432
string picturename = "buscar.ico"
long picturemaskcolor = 536870912
string powertiptext = "Origen del Documento"
dw_intf dw_intf
end type

on tp_1.create
this.dw_intf=create dw_intf
this.Control[]={this.dw_intf}
end on

on tp_1.destroy
destroy(this.dw_intf)
end on

type dw_intf from datawindow within tp_1
integer x = 41
integer y = 32
integer width = 2811
integer height = 948
integer taborder = 24
string title = "none"
string dataobject = "dw_flujo_2s1n"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type tp_2 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 5426
integer height = 1024
long backcolor = 67108864
string text = "Rubros"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Rubros del Documento"
st_2 st_2
pb_10 pb_10
pb_2 pb_2
pb_find_rubro pb_find_rubro
dw_sle dw_sle
dw_rub dw_rub
end type

on tp_2.create
this.st_2=create st_2
this.pb_10=create pb_10
this.pb_2=create pb_2
this.pb_find_rubro=create pb_find_rubro
this.dw_sle=create dw_sle
this.dw_rub=create dw_rub
this.Control[]={this.st_2,&
this.pb_10,&
this.pb_2,&
this.pb_find_rubro,&
this.dw_sle,&
this.dw_rub}
end on

on tp_2.destroy
destroy(this.st_2)
destroy(this.pb_10)
destroy(this.pb_2)
destroy(this.pb_find_rubro)
destroy(this.dw_sle)
destroy(this.dw_rub)
end on

type st_2 from statictext within tp_2
integer x = 27
integer y = 24
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código:"
boolean focusrectangle = false
end type

type pb_10 from picturebutton within tp_2
event mousemove pbm_mousemove
string tag = "Modificar"
integer x = 882
integer y = 40
integer width = 151
integer height = 132
integer taborder = 14
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar_borrar.gif"
string disabledname = "d_editar_borrar.gif"
string powertiptext = "Modificar"
end type

event clicked;long  valor,fila, numdoc, inicial, final, l_monto
int l_item
string buscar,l_coddoc,l_lugar
if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(1,'estado') = '0' then
	messagebox('Aviso','El documento no ha sido cerrado, Puede modificarlo sin generar documento')
	Return
end if
if dw_cab.GetItemString(1,'estado') = '3' then
	messagebox('Aviso','El documento ha sido anulado, No puede modificarlo')
	Return
end if
//if i_estado_per <> '1' then
//	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
//	Return
//end if
if dw_cab.GetItemString(1,'cod_flujo')='PDI-SCT'  then
	numdoc=dw_rub.GetItemNumber(dw_rub.GetRow(),'numdoc')
	l_item=dw_rub.GetItemNumber(dw_rub.GetRow(),'item')
	valor=dw_rub.GetItemNumber(dw_rub.GetRow(),'monto_vigente')
end if
st_ppto st_p
if i_cdoc = 'PDI' then
	st_p.coddoc = 'DM'
elseif i_cdoc = 'PR' then
	st_p.coddoc = 'RM'
else
	Return 0
end if
st_p.cod_vigencia = i_vigencia
st_p.periodo = i_periodo
st_p.año = i_año
st_p.dw_obj = dw_rub
openwithparm(w_modifica,st_p)
i_fila=0
dw_historial.TriggerEvent(RowFocusChanged!)

end event

type pb_2 from picturebutton within tp_2
event mousemove pbm_mousemove
string tag = "Borrar Rubro"
integer x = 736
integer y = 40
integer width = 146
integer height = 128
integer taborder = 13
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Rubro"
end type

event clicked;if dw_rub.rowcount()=0 then return
if dw_cab.GetItemString(1,'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrada')
	Return
end if
if i_estado_per <> '1' then
	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
	Return
end if
if dw_cab.getitemstring(1,'cod_flujo')='PDINMPR' then return
do while tb_1.tp_3.dw_fuen.rowcount()>0
	tb_1.tp_3.dw_fuen.deleterow(0)
loop
dw_rub.deleterow(0)
dw_rub.event rowfocuschanged(dw_rub.getrow())
i_cambio=true
	
end event

type pb_find_rubro from picturebutton within tp_2
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 585
integer y = 40
integer width = 146
integer height = 128
integer taborder = 12
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
string powertiptext = "Buscar"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(1,'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrada')
	Return
end if
if i_estado_per <> '1' then
	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
	Return
end if

st_ppto st_parm
st_parm.cod_vigencia = i_vigencia
st_parm.filtro = "tipo='"+i_ing_gasto1+"' and movimiento='1'"
st_parm.dw_sle = dw_sle
if isvalid(w_buscactapre) then
	w_buscactapre.st_parm.dw_sle=dw_sle
	w_buscactapre.dw_1.SetFilter(st_parm.filtro)
	w_buscactapre.dw_1.Filter()
else
	openwithparm(w_buscactapre,st_parm)
end if

end event

type dw_sle from datawindow within tp_2
event teclea pbm_dwnkey
integer x = 23
integer y = 76
integer width = 544
integer height = 92
integer taborder = 21
string title = "none"
string dataobject = "dw_slecta"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event teclea;if dw_cab.RowCount() = 0 then Return
if dw_cab.getitemstring(1,'estado')<>'0' then return
string este="!"

st_ppto st_parm
st_parm.cod_vigencia = i_vigencia
choose case key
	case KeyNumpad0!,key0!
		este='0'
	case KeyNumpad1!,key1!
		este='1'
	case KeyNumpad2!,key2!
		este='2'
	case KeyNumpad3!,key3!
		este='3'
	case KeyNumpad4!,key4!
		este='4'
	case KeyNumpad5!,key5!
		este='5'
	case KeyNumpad6!,key6!
		este='6'
	case KeyNumpad7!,key7!
		este='7'
	case KeyNumpad8!,key8!
		este='8'
	case KeyNumpad9!,key9!
		este='9'
	case KeyNumpad0!,key0!
		este='0'
	case KeyEnter!
		if isValid(w_buscactapre) then close(w_buscactapre)
		TriggerEvent(itemchanged!)
		Return
	case keya!
		este='a'
	case keyb!
		este='b'
	case keyc!
		este='c'
	case keyd!
		este='d'
	case keye!
		este='e'
	case keyf!
		este='f'
	case keyg!
		este='g'
	case keyh!
		este='h'
	case keyi!
		este='i'
	case keyj!
		este='j'
	case keyk!
		este='k'
	case keyl!
		este='l'
	case keym!
		este='m'
	case keyn!
		este='n'
	case keyo!
		este='o'
	case keyp!
		este='p'
	case keyq!
		este='q'
	case keyr!
		este='r'
	case keys!
		este='s'
	case keyt!
		este='t'
	case keyu!
		este='u'
	case keyv!
		este='v'
	case keyw!
		este='w'
	case keyx!
		este='x'
	case keyy!
		este='y'
	case keyz!
		este='z'//	case keyback!
//		este = GetText()
//		if len(este) > 1 then
//			este=left(este, len(este) - 1)
//		else
//			setNull(este)
//		end if
	case else
		if keyDown(keycontrol!) then
			return
		end if
end choose
if este <> "!" then
	if not isnull(GetText()) then este=GetText() + este
end if
if key = keyback! then
	este = GetText()
	if len(este) > 1 then
		este=left(este, len(este) - 1)
	else
		este=''
	end if
end if

st_parm.filtro = "(lower(codtotal) like '" + lower(este) + "%') and (tipo='"+i_ing_gasto1+"' and movimiento='1')"
st_parm.dw_sle = this
if isValid(w_buscactapre) then
	w_buscactapre.st_parm.dw_sle=this
	w_buscactapre.dw_1.SetFilter(st_parm.filtro)
	w_buscactapre.dw_1.Filter()
else
	openwithparm(w_buscactapre,st_parm)
end if
SetFocus()


end event

event constructor;settransobject(sqlca)
InsertRow(0)

end event

event itemchanged;if dw_cab.RowCount() = 0 then Return
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
if planeado_actual=0 and (i_cdoc='PDI' or i_cdoc='PTF' or i_cdoc='PPR') then 
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

event getfocus;if isValid(w_buscactapre) then 	w_buscactapre.st_parm.dw_sle=this

end event

type dw_rub from datawindow within tp_2
integer x = 14
integer y = 188
integer width = 5376
integer height = 808
integer taborder = 70
string title = "none"
string dataobject = "dw_pre_doc_cp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then
	tb_1.tp_3.dw_fuen.setfilter('isnull(#1)')
	tb_1.tp_4.dw_dest.setfilter('isnull(#1)')
	tb_1.tp_3.em_1.text='0'
elseif isnull(getitemnumber(getrow(),'item')) then 
	tb_1.tp_3.dw_fuen.setfilter('isnull(#1)')
	tb_1.tp_4.dw_dest.setfilter('isnull(#1)')
	tb_1.tp_3.em_1.text=string(getitemnumber(getrow(),'monto_vigente'))
else
	tb_1.tp_3.dw_fuen.setfilter('item='+string(getitemnumber(getrow(),'item')))
	tb_1.tp_4.dw_dest.setfilter('item='+string(getitemnumber(getrow(),'item')))
	tb_1.tp_3.em_1.text=string(getitemnumber(getrow(),'monto_vigente'))
end if
tb_1.tp_3.dw_fuen.filter()
tb_1.tp_4.dw_dest.filter()
if getrow()>0 then
	tb_1.tp_3.dw_r.SetItem(1,'item',GetItemNumber(Getrow(),'item'))
end if
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event losefocus;if accepttext()=-1 then setfocus()
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

event clicked;if row>0 and row<>getrow() then scrolltorow(row)
end event

type tp_3 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 5426
integer height = 1024
long backcolor = 67108864
string text = "Fuente / Uso"
long tabtextcolor = 33554432
string picturename = "pesos_deta.ico"
long picturemaskcolor = 536870912
string powertiptext = "Rubros de Equilibrio"
em_1 em_1
st_5 st_5
st_4 st_4
st_3 st_3
dw_sle2 dw_sle2
pb_find_fue pb_find_fue
pb_del_fue pb_del_fue
dw_r dw_r
dw_fuen dw_fuen
end type

on tp_3.create
this.em_1=create em_1
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.dw_sle2=create dw_sle2
this.pb_find_fue=create pb_find_fue
this.pb_del_fue=create pb_del_fue
this.dw_r=create dw_r
this.dw_fuen=create dw_fuen
this.Control[]={this.em_1,&
this.st_5,&
this.st_4,&
this.st_3,&
this.dw_sle2,&
this.pb_find_fue,&
this.pb_del_fue,&
this.dw_r,&
this.dw_fuen}
end on

on tp_3.destroy
destroy(this.em_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_sle2)
destroy(this.pb_find_fue)
destroy(this.pb_del_fue)
destroy(this.dw_r)
destroy(this.dw_fuen)
end on

type em_1 from editmask within tp_3
integer x = 361
integer y = 920
integer width = 443
integer height = 72
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

type st_5 from statictext within tp_3
integer x = 32
integer y = 936
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Monto Rubro:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within tp_3
integer x = 1344
integer y = 28
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rubros:"
boolean focusrectangle = false
end type

type st_3 from statictext within tp_3
integer x = 27
integer y = 24
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código:"
boolean focusrectangle = false
end type

type dw_sle2 from datawindow within tp_3
event teclea pbm_dwnkey
integer x = 23
integer y = 76
integer width = 544
integer height = 92
integer taborder = 31
string title = "none"
string dataobject = "dw_slecta"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event teclea;if dw_cab.RowCount() = 0 or tb_1.tp_2.dw_rub.rowcount()=0 then Return
if dw_cab.getitemstring(1,'estado')<>'0' then return
string este="!"

st_ppto st_parm
st_parm.cod_vigencia = i_vigencia
choose case key
	case KeyNumpad0!,key0!
		este='0'
	case KeyNumpad1!,key1!
		este='1'
	case KeyNumpad2!,key2!
		este='2'
	case KeyNumpad3!,key3!
		este='3'
	case KeyNumpad4!,key4!
		este='4'
	case KeyNumpad5!,key5!
		este='5'
	case KeyNumpad6!,key6!
		este='6'
	case KeyNumpad7!,key7!
		este='7'
	case KeyNumpad8!,key8!
		este='8'
	case KeyNumpad9!,key9!
		este='9'
	case KeyNumpad0!,key0!
		este='0'
	case KeyEnter!
		if isValid(w_buscactapre) then close(w_buscactapre)
		TriggerEvent(itemchanged!)
		Return
	case keya!
		este='a'
	case keyb!
		este='b'
	case keyc!
		este='c'
	case keyd!
		este='d'
	case keye!
		este='e'
	case keyf!
		este='f'
	case keyg!
		este='g'
	case keyh!
		este='h'
	case keyi!
		este='i'
	case keyj!
		este='j'
	case keyk!
		este='k'
	case keyl!
		este='l'
	case keym!
		este='m'
	case keyn!
		este='n'
	case keyo!
		este='o'
	case keyp!
		este='p'
	case keyq!
		este='q'
	case keyr!
		este='r'
	case keys!
		este='s'
	case keyt!
		este='t'
	case keyu!
		este='u'
	case keyv!
		este='v'
	case keyw!
		este='w'
	case keyx!
		este='x'
	case keyy!
		este='y'
	case keyz!
		este='z'//	case keyback!
//		este = GetText()
//		if len(este) > 1 then
//			este=left(este, len(este) - 1)
//		else
//			setNull(este)
//		end if
	case else
		if keyDown(keycontrol!) then
			return
		end if
end choose
if este <> "!" then
	if not isnull(GetText()) then este=GetText() + este
end if
if key = keyback! then
	este = GetText()
	if len(este) > 1 then
		este=left(este, len(este) - 1)
	else
		este=''
	end if
end if

st_parm.filtro = "(lower(codtotal) like '" + lower(este) + "%') and (tipo='"+i_ing_gasto2+"' and movimiento='1')"
st_parm.dw_sle = this
if isValid(w_buscactapre) then
	w_buscactapre.st_parm.dw_sle=this
	w_buscactapre.dw_1.SetFilter(st_parm.filtro)
	w_buscactapre.dw_1.Filter()
else
	openwithparm(w_buscactapre,st_parm)
end if
SetFocus()


end event

event constructor;settransobject(sqlca)
InsertRow(0)

end event

event itemchanged;if dw_cab.RowCount() = 0 or tb_1.tp_2.dw_rub.rowcount()=0 then Return
if dw_cab.getitemstring(1,'estado')<>'0' then return
string codtotal, valor, descripcion, texto
long  fila, filas, i, fr
dec plan_ini,planeado_actual,acum_adic,acum_trasl,acum_recor,acum_dispo,acum_mod_dispo,acum_reser,acum_mod_reser,acum_giro,acum_recon,acum_recau

AcceptText()
texto = GetItemString(1,1)
if texto = '' then Return 0
if texto=tb_1.tp_2.dw_rub.getitemstring(tb_1.tp_2.dw_rub.getrow(),'codtotal') then
	messagebox('Atención','Este rubro es igual al de origen')
	return -1
end if
SELECT pre_plan.CodTotal, pre_plan.descrip, pre_plan.planeado_inicial, v_pre_suma_acum.acum_traslado, v_pre_suma_acum.acum_adicion, v_pre_suma_acum.acum_recorte, v_pre_suma_acum.acum_dispon, v_pre_suma_acum.acum_mod_dispo, v_pre_suma_acum.acum_reserva, v_pre_suma_acum.acum_mod_reserv, v_pre_suma_acum.acum_girado, v_pre_suma_acum.acum_recon, v_pre_suma_acum.acum_recaudo
into :codTotal, :descripcion, :plan_ini ,:acum_trasl,:acum_adic,:acum_recor,:acum_dispo,:acum_mod_dispo,:acum_reser,:acum_mod_reser,:acum_giro,:acum_giro,:acum_recau
FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
WHERE (((pre_plan.CodTotal)=:Texto) AND ((pre_plan.cod_vigencia)=:i_vigencia) AND ((pre_plan.tipo)=:i_ing_gasto2) AND ((pre_plan.movimiento)='1'));

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
if planeado_actual=0 and (i_cdoc='PDI' or i_cdoc='PPR') then 
	messagebox('Atención','Este rubro no tiene valor Planeado Actual')
	return -1
end if
fila = dw_fuen.Find("codtotal='" + codtotal+"'",1,dw_fuen.RowCount())
if fila = 0 then
	fila = dw_fuen.InsertRow(0)
	valor = dw_fuen.Describe("Evaluate('max(sitem)',0)")
	dw_fuen.SetItem(fila,'coddoc',i_cdoc)
	dw_fuen.SetItem(fila,'cLugar',cLugar)
	dw_fuen.SetItem(fila,'numdoc',i_ndoc)
	dw_fuen.SetItem(fila,'item',tb_1.tp_2.dw_rub.getitemnumber(tb_1.tp_2.dw_rub.getrow(),'item'))
	dw_fuen.SetItem(fila,'sitem',long(valor) + 1)
	dw_fuen.SetItem(fila,'cod_vigencia',i_vigencia)
	dw_fuen.SetItem(fila,'codtotal',codtotal)
	dw_fuen.SetItem(fila,'descrip',descripcion)
	dw_fuen.SetItem(fila,'planeado_inicial',plan_ini)
	dw_fuen.SetItem(fila,'acum_traslado',acum_trasl)
	dw_fuen.SetItem(fila,'acum_adicion',acum_adic)
	dw_fuen.SetItem(fila,'acum_recorte',acum_recor)
	dw_fuen.SetItem(fila,'acum_dispon',acum_dispo)
	dw_fuen.SetItem(fila,'acum_mod_dispo',acum_mod_dispo)
	dw_fuen.SetItem(fila,'acum_reserva',acum_reser)
	dw_fuen.SetItem(fila,'acum_mod_reserv',acum_mod_reser)
	dw_fuen.SetItem(fila,'acum_girado',acum_giro)
	dw_fuen.SetItem(fila,'acum_recon',acum_recon)
	dw_fuen.SetItem(fila,'acum_recaudo',acum_recau)
	
	dw_fuen.SetItem(fila,'estado','0')
	dw_fuen.ScrolltoRow(fila)
	
	dw_fuen.TriggerEvent(rowfocuschanged!)
	i_cambio = TRUE
	settext('')
	setitem(1,1,'')
end if
dec total
total=tb_1.tp_2.dw_rub.getitemnumber(tb_1.tp_2.dw_rub.getrow(),'monto_vigente')
total=total/dw_fuen.rowcount()
//for i=1 to dw_fuen.rowcount()
//	dw_fuen.setitem(i,'monto',total)
//next
dw_fuen.setitem(i,'monto',0)
return fila

end event

event getfocus;if isValid(w_buscactapre) then 	w_buscactapre.st_parm.dw_sle=this
end event

type pb_find_fue from picturebutton within tp_3
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 585
integer y = 40
integer width = 146
integer height = 128
integer taborder = 22
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
string powertiptext = "Buscar"
end type

event clicked;if dw_cab.RowCount() = 0 or tb_1.tp_2.dw_rub.rowcount()=0 then Return
if dw_cab.GetItemString(1,'estado') <> '0' then
	messagebox('Error','La disponibilidad ya ha sido cerrada')
	Return
end if
if i_estado_per <> '1' then
	messageBox('Aviso','El periodo no esta activo. No puede modificar documentos')
	Return
end if
if i_equ = '0' then
	st_ppto st_parm
	st_parm.cod_vigencia = i_vigencia
	st_parm.filtro = "tipo='"+i_ing_gasto2+"' and movimiento='1'"
	st_parm.dw_sle=dw_sle2
	if isvalid(w_buscactapre) then
		w_buscactapre.st_parm.dw_sle=dw_sle2
		w_buscactapre.dw_1.SetFilter(st_parm.filtro)
		w_buscactapre.dw_1.Filter()
	else
		openwithparm(w_buscactapre,st_parm)
	end if
else
	int i, filas
	string valor
	uo_DataStore dw_eq
	dw_eq = CREATE uo_DataStore	
	dw_eq = Create uo_DataStore
	dw_eq.DataObject = "dw_equilibrio"
	dw_eq.SetTransObject(SQLCA)
	
	dw_eq.Retrieve(i_vigencia,'%',tb_1.tp_2.dw_rub.GetItemString(tb_1.tp_2.dw_rub.GetRow(),'codtotal'))
	for i = 1 to dw_eq.RowCount()
		filas = dw_fuen.Find("codtotal='"+dw_eq.GetItemString(i,'codtotal')+"'",1,dw_fuen.RowCount())
		if filas > 0 then CONTINUE
		valor = dw_fuen.Describe("Evaluate('max(sitem)',0)")
		filas = dw_fuen.InsertRow(0)
		dw_fuen.SetItem(filas,'coddoc',i_cdoc)
		dw_fuen.SetItem(filas,'cLugar',cLugar)
//		dw_fuen.SetItem(filas,'numdoc',dw_disp.GetItemNumber(dw_disp.GetRow(),'numdoc'))
		dw_fuen.SetItem(filas,'item',tb_1.tp_2.dw_rub.GetItemNumber(tb_1.tp_2.dw_rub.GetRow(),'item'))
		dw_fuen.SetItem(filas,'sitem',long(valor) + 1)
		dw_fuen.SetItem(filas,'cod_vigencia',dw_eq.GetItemNumber(i,'cod_vigencia'))
		dw_fuen.SetItem(filas,'codtotal',dw_eq.GetItemString(i,'codtotal'))
		dw_fuen.SetItem(filas,'monto_gasto',dw_eq.GetItemNumber(i,'monto_gasto'))
		dw_fuen.SetItem(filas,'monto_ejecutado',dw_eq.GetItemNumber(i,'monto_ejecutado'))
		dw_fuen.SetItem(filas,'descrip',dw_eq.GetItemString(i,'descrip_ingreso'))
	next
end if


end event

type pb_del_fue from picturebutton within tp_3
event mousemove pbm_mousemove
string tag = "Borrar Rubro"
integer x = 736
integer y = 40
integer width = 146
integer height = 128
integer taborder = 12
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Rubro"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(1,'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return
end if
if dw_fuen.RowCount() = 0 then Return
dw_fuen.DeleteRow(0)
i_cambio = TRUE

end event

type dw_r from datawindow within tp_3
integer x = 1344
integer y = 84
integer width = 1856
integer height = 76
integer taborder = 50
string title = "none"
string dataobject = "dw_ls_rubro"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
getchild('item',dwc_r) 
dwc_r.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;AcceptText()
if not isNull(GetItemNumber(1,'item')) then
	long fila
	fila = tb_1.tp_2.dw_rub.Find("item="+string(GetItemNumber(1,'item')),1,tb_1.tp_2.dw_rub.RowCount())
	if fila > 0 then  tb_1.tp_2.dw_rub.ScrolltoRow(fila)
end if

end event

type dw_fuen from datawindow within tp_3
integer x = 14
integer y = 188
integer width = 5353
integer height = 820
integer taborder = 80
string title = "none"
string dataobject = "dw_pre_doc_eq"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cambio=true
end event

event dberror;rollback;
return 0
end event

event losefocus;if accepttext()=-1 then setfocus()
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

event clicked;if row>0 and row<>getrow() then scrolltorow(row)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type tp_4 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 5426
integer height = 1024
long backcolor = 67108864
string text = "Rubro Destino"
long tabtextcolor = 33554432
string picturename = "oofl.ico"
long picturemaskcolor = 536870912
dw_dest dw_dest
end type

on tp_4.create
this.dw_dest=create dw_dest
this.Control[]={this.dw_dest}
end on

on tp_4.destroy
destroy(this.dw_dest)
end on

type dw_dest from datawindow within tp_4
integer x = 37
integer y = 76
integer width = 5326
integer height = 928
integer taborder = 70
string title = "none"
string dataobject = "dw_pre_doc_scp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cambio=true
end event

event dberror;rollback;
return 0
end event

event losefocus;if accepttext()=-1 then setfocus()
end event

type tp_5 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 5426
integer height = 1024
long backcolor = 67108864
string text = "Terceros"
long tabtextcolor = 33554432
string picturename = "paciente.ico"
long picturemaskcolor = 536870912
pb_1 pb_1
pb_del_ter pb_del_ter
pb_adic_ter pb_adic_ter
st_7 st_7
dw_terce dw_terce
dw_ter dw_ter
gb_2 gb_2
end type

on tp_5.create
this.pb_1=create pb_1
this.pb_del_ter=create pb_del_ter
this.pb_adic_ter=create pb_adic_ter
this.st_7=create st_7
this.dw_terce=create dw_terce
this.dw_ter=create dw_ter
this.gb_2=create gb_2
this.Control[]={this.pb_1,&
this.pb_del_ter,&
this.pb_adic_ter,&
this.st_7,&
this.dw_terce,&
this.dw_ter,&
this.gb_2}
end on

on tp_5.destroy
destroy(this.pb_1)
destroy(this.pb_del_ter)
destroy(this.pb_adic_ter)
destroy(this.st_7)
destroy(this.dw_terce)
destroy(this.dw_ter)
destroy(this.gb_2)
end on

type pb_1 from picturebutton within tp_5
integer x = 4233
integer y = 216
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "calculator.gif"
string disabledname = "d_calculator.gif"
alignment htextalign = left!
string powertiptext = "Distribuir montos"
end type

event clicked;if tb_1.tp_2.dw_rub.rowcount()=0  or dw_ter.rowcount()=0 then return
dec valor
long donde
valor=round(tb_1.tp_2.dw_rub.getitemnumber(1,'total')/dw_ter.rowcount(),i_dec_gral)
if i_dec_gral=0 then
	valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
end if
for donde=1 to dw_ter.rowcount()
	dw_ter.setitem(donde,'monto',valor)
	dw_ter.setitem(donde,'monto_org',valor)
next

end event

type pb_del_ter from picturebutton within tp_5
integer x = 4233
integer y = 88
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Tercero"
end type

event clicked;if dw_cab.rowcount()=0 or dw_ter.rowcount()=0 then return
if dw_cab.getitemstring(1,'estado')<>'0' then
	Messagebox('Atención','El documento ya no es temporal no se puede Modificar')
	return
end if
if dw_ter.GetItemString(dw_ter.GetRow(),'nomina') = '2' then
	MessageBox('Atención','El tercero proviene de interfaz de nómina ')
else
	dw_ter.deleterow(0)
end if

end event

type pb_adic_ter from picturebutton within tp_5
integer x = 3278
integer y = 848
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Tercero"
end type

event clicked;if dw_cab.rowcount()=0 then return
if dw_cab.getitemstring(1,'estado')<>'0' then
	Messagebox('Atención','El documento ya no es temporal no se puede Adicionar Terceros')
	return
end if
string tdoc,doc
tdoc=dw_terce.getitemstring(1,'tipodoc')
doc=dw_terce.getitemstring(1,'documento')
if doc='' or isnull(doc) then return
long donde
if dw_ter.find("tipodoc='"+tdoc+"' and documento='"+doc+"'",1,dw_ter.rowcount())=0 then
	donde=dw_ter.insertrow(0)
	dw_ter.setitem(donde,'coddoc',i_cdoc)
	dw_ter.setitem(donde,'clugar',clugar)
	dw_ter.setitem(donde,'numdoc',i_ndoc)
	dw_ter.setitem(donde,'tipodoc',tdoc)
	dw_ter.setitem(donde,'documento',doc)
	dw_ter.setitem(donde,'nombre1',dw_terce.getitemstring(1,'nombre1'))
	dw_ter.setitem(donde,'nombre2',dw_terce.getitemstring(1,'nombre2'))
	dw_ter.setitem(donde,'apellido1',dw_terce.getitemstring(1,'Apellido1'))
	dw_ter.setitem(donde,'apellido2',dw_terce.getitemstring(1,'apellido2'))
	dw_ter.setitem(donde,'razon_social',dw_terce.getitemstring(1,'razon_social'))
	dw_ter.ScrolltoRow(donde)
end if
i_cambio=true
Return donde

end event

type st_7 from statictext within tp_5
integer x = 73
integer y = 24
integer width = 562
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Terceros del Documento:"
boolean focusrectangle = false
end type

type dw_terce from datawindow within tp_5
integer x = 101
integer y = 848
integer width = 3159
integer height = 136
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
modify('tipodoc.validationmsg="No puede cambiar el tercero sin guardar"')
modify('documento.validationmsg="Tercero no existe o ya no lo puede cambiar sin guardar"')
insertrow(1)
end event

event itemchanged;accepttext()
string doc,tdoc
tdoc=getitemstring(1,"tipodoc")
doc=getitemstring(1,"documento")
string snulo
setnull(snulo)
if dwo.name="tipodoc" and doc <> "" then
	setitem(1,"documento",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,'persona',snulo)
	return
end if
if dwo.name="documento" and doc = "" then 
	setitem(1,'nombre1',snulo)
	setitem(1,'persona',snulo)
end if
if dwo.name="documento" and doc <> "" then
	if retrieve(tdoc,doc)=0 then
		insertrow(1)
		setitem(1,1,tdoc)
		setitem(1,2,doc)
		messagebox("Atención",'Tercero no existe')
	end if
end if
end event

event doubleclicked;g_tercerodesde=1
openwithparm(w_buscater,dw_terce)
setcolumn('documento')
event itemchanged(1,object.documento,getitemstring(1,'documento'))
end event

type dw_ter from datawindow within tp_5
integer x = 73
integer y = 80
integer width = 4087
integer height = 676
integer taborder = 80
string title = "none"
string dataobject = "dw_pre_doc_ter"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cambio=true
dw_ter.setitem(row,'monto_org',long(data))
end event

event dberror;rollback;
return 0
end event

event losefocus;if accepttext()=-1 then setfocus()
end event

type gb_2 from groupbox within tp_5
integer x = 69
integer y = 772
integer width = 3415
integer height = 240
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Búsqueda de terceros: (Doble Click para Buscar)"
end type

type tp_6 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 5426
integer height = 1024
long backcolor = 67108864
string text = "Docs. Relacionados"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
string powertiptext = "Listado de los documentos relacionados"
pb_repmod pb_repmod
dw_modif dw_modif
end type

on tp_6.create
this.pb_repmod=create pb_repmod
this.dw_modif=create dw_modif
this.Control[]={this.pb_repmod,&
this.dw_modif}
end on

on tp_6.destroy
destroy(this.pb_repmod)
destroy(this.dw_modif)
end on

type pb_repmod from pb_report within tp_6
integer x = 5257
integer y = 56
integer taborder = 90
string powertiptext = "Reimprimir Documento"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if( dw_modif.getitemstring(dw_modif.getrow(),'coddoc')<>'DM' and dw_modif.getitemstring(dw_modif.getrow(),'coddoc')<>'RM') then return
any par[3]
par[1]=dw_modif.getitemstring(dw_modif.getrow(),'coddoc')
par[2]=dw_modif.getitemstring(dw_modif.getrow(),'clugar')
par[3]=dw_modif.getitemnumber(dw_modif.getrow(),'numdoc')
if imprimir(par,'','0')=1 then 
//	update predocu_cb set impreso='1'
//	where coddop=string(:par[1]) and clugar=string(:par[2]) and numdoc=number(:par[3]);
	commit;
end if
end event

type dw_modif from datawindow within tp_6
integer x = 37
integer y = 52
integer width = 5189
integer height = 940
integer taborder = 90
string title = "none"
string dataobject = "dw_pre_doc_modif"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cambio=true
end event

event dberror;rollback;
return 0
end event

event losefocus;if accepttext()=-1 then setfocus()
end event

type pb_print from pb_report within w_docum_base1
integer x = 2770
integer y = 12
integer taborder = 60
string text = "          &i"
string powertiptext = "Reimprimir Documento"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if not enabled then return -1
any par[3]
par[1]=i_cdoc
par[2]=clugar
par[3]=i_ndoc
if imprimir(par,'','0')=1 then
	if not isnull(dw_historial.getitemnumber(dw_historial.getrow(),'consecutivo')) then 
		dw_cab.setitem(1,'impreso','1')
		if dw_cab.update()=-1 then 
			dw_cab.setitem(1,'impreso','0')
			dw_cab.resetupdate()
			return
		end if
		commit;
		dw_cab.resetupdate()
		dw_historial.setitem(dw_historial.getrow(),'impreso','1')
	end if
end if
end event

event constructor;call super::constructor;inicia('documento!',i_cdoc,clugar)
end event

type pb_save_def from picturebutton within w_docum_base1
integer x = 2615
integer y = 12
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "           &d"
boolean originalsize = true
string picturename = "cerrar.gif"
string disabledname = "d_cerrar.gif"
alignment htextalign = left!
string powertiptext = "Aprobar Documento [Alt+D]"
end type

event clicked;setpointer(hourglass!)
if dw_cab.rowcount()=0 then return
if grabar()=1 then
	commit;
	if dw_cab.rowcount()=0 then return
	if dw_cab.getitemstring(1,'estado')='1' then return
	if grabar_def()=1 then
		commit;
		if cbx_1.checked then pb_print.event clicked()
	end if
end if
end event

type pb_anula from picturebutton within w_docum_base1
integer x = 2304
integer y = 12
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean originalsize = true
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Anular Documento [Alt+A]"
end type

event clicked;if f_anula()=1 then
	commit;
end if
end event

type pb_save from picturebutton within w_docum_base1
integer x = 2459
integer y = 12
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "          &g"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Cambios [Alt+G]"
end type

event clicked;if grabar()=1 then
	commit;
end if
end event

type pb_new from picturebutton within w_docum_base1
integer x = 2149
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "          &n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Documento [Alt+N]"
end type

event clicked;string s_solici
datetime ld_ahora
ld_ahora=datetime(today(),now())
if i_estado_per='0' then 
	messagebox('Atención','Este periodo no está activo')
	return 
end if
if ld_ahora<=ld_fini_per or ld_ahora >=ld_ffin_per then
	if year(date(ld_ahora))<> year(date(ld_ffin_per)) and month(date(ld_ffin_per))=1 then
		ld_ahora=datetime(date('02/'+string(month(date(ld_fini_per)))+'/'+string(year(date(ld_fini_per)))), now())		
	end if
	
	if year(date(ld_ahora))<> year(date(ld_ffin_per)) and month(date(ld_ffin_per))=12 then
		ld_ahora=datetime(date(string(day(date(ld_ahora)))+'/'+string(month(date(ld_fini_per)))+'/'+string(year(date(ld_fini_per)))), now())
	end if
end if

dw_historial.insertrow(1)
i_fila=1
dw_historial.setrow(1)
dw_historial.setitem(1,'estado','4')
i_cambio=true
i_nuevo=true
reset_dws()
setnull(i_ndoc)

tb_1.tp_3.dw_r.setitem(1,1,i_ndoc)
dw_cab.insertrow(1)
dw_cab.setitem(1,'usuario',usuario)
dw_cab.setitem(1,'fecha',ld_ahora)
dw_cab.setitem(1,'coddoc',i_cdoc)
dw_cab.setitem(1,'clugar',clugar)
if i_cdoc='PDI' or  i_cdoc='SPDI' or i_cdoc = 'PR' then
	SELECT cadena into :s_solici
	FROM parametros_gen
	WHERE (((codigo_para)=56));
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','No hay parametro 56')
		return 
	end if
	dw_cab.setitem(1,'solicita',s_solici)
end if
if today()>=vig_termina  then
	dw_cab.setitem(1,'fecha_consecu',datetime(vig_termina,now()))
else
	dw_cab.setitem(1,'fecha_consecu',datetime(today(),now()))
end if
dw_cab.setitem(1,'cod_vigencia',i_vigencia)
dw_cab.setitem(1,'año',i_año)
dw_cab.setitem(1,'periodo',i_periodo)
dw_cab.object.objeto.edit.displayonly='no'
if idw_flujo.rowcount()=1 then dw_cab.setitem(1,'cod_flujo',idw_flujo.getitemstring(1,'codigo'))

if i_cdoc='PR' then
	dw_cont.insertrow(1)
	//dw_cont.setitem(1,'fecha_cont',datetime(today(),now()))
	dw_cont.setitem(1,'coddoc',i_cdoc)
	dw_cont.setitem(1,'clugar',clugar)
	tab_1.selecttab(1) 
	dw_cab.visible=true
	dw_cont.visible=false
end if
enabled=false
end event

type st_1 from statictext within w_docum_base1
integer x = 41
integer y = 160
integer width = 197
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial:"
boolean focusrectangle = false
end type

type dw_historial from datawindow within w_docum_base1
event p_borra_nuevo ( long p_estaba,  long p_va )
integer x = 37
integer y = 220
integer width = 2715
integer height = 740
integer taborder = 70
string title = "none"
string dataobject = "dw_histo_docs"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_borra_nuevo(long p_estaba, long p_va);deleterow(p_estaba)
i_fila=0
parent.event timer()

end event

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event rowfocuschanged;reset_dws()
timer(0.3)

end event

event rowfocuschanging;choose case f_pregunta()
	case 1//cambio y debe guardar
		if grabar()=-1 then 
			return 1
		else
			commit;
		end if
	case 2// no cambio o no va a guardar
		i_cambio=false
		i_nuevo=false
		pb_new.enabled=true
		if currentrow<1 or currentrow>rowcount() then return
		if getitemstring(currentrow,'estado')='4' then post event p_borra_nuevo(currentrow,newrow)
	case 3//cancelar
		return 1
end choose
return 0
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_vig_per from datawindow within w_docum_base1
integer x = 32
integer y = 8
integer width = 1979
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_vig_per"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('ano',idw_año)
getchild('periodo',idw_periodo)
idw_año.settransobject(sqlca)
idw_periodo.settransobject(sqlca)
insertrow(1)

end event

event itemchanged;long actual

actual=getitemnumber(1,string(dwo.name))
choose case f_pregunta()
	case 1//cambio y debe guardar
		if grabar()=-1 then 
			setitem(1,1,actual)
			return 1
		else
			commit;
		end if
	case 2// no cambio o no va a guardar
		i_cambio=false
		i_nuevo=false
		pb_new.enabled=true
	case 3//cancelar
		setitem(1,1,actual)
		return 1
end choose
choose case dwo.name
	case 'cod_vigencia'
		i_vigencia=long(data)
		setnull(i_año)
		setnull(i_periodo)
		if idw_año.retrieve(i_vigencia)>0 then
			i_año= idw_año.getitemnumber(idw_año.getrow(),'ano')
			setitem(1,'ano',i_año)
			if idw_periodo.retrieve(i_vigencia,i_año)>0 then
				i_periodo=idw_periodo.getitemnumber(idw_periodo.getrow(),'periodo')
				setitem(1,'periodo',i_periodo)	
				dw_historial.retrieve(i_cdoc,clugar,i_vigencia,i_año,i_periodo)
			end if
		end if
		reset_dws()
		pb_find.enabled=true
	//	pb_new.enabled=false
		i_estado_per='0'
		select equilibrio,estado,convenio,termina into :i_equ,:c_estado,:i_convenio,:vig_termina from pre_vigencia where cod_vigencia = :i_vigencia;
		if isNull(i_equ) then i_equ = '1'
		if i_equ = '0' then
			tb_1.tp_3.dw_fuen.DataObject = 'dw_pre_doc_scp'
			tb_1.tp_3.dw_fuen.SetTRansObject(SQLCA)
			tb_1.tp_3.pb_find_fue.PowerTipText = 'Buscar Cuentas'
		else
			tb_1.tp_3.dw_fuen.DataObject = 'dw_pre_doc_scp2'
			tb_1.tp_3.dw_fuen.SetTRansObject(SQLCA)
			tb_1.tp_3.pb_find_fue.PowerTipText = 'Traer Cuentas relacionadas'
		end if
		if i_convenio = '0' then
			dw_cab.modify("t_2.visible=false")
			dw_cab.modify("convenio.visible=false")
		else
			dw_cab.modify("t_2.visible=true")
			dw_cab.modify("convenio.visible=true")
		end if
	case 'ano'
		i_año=long(data)
		reset_dws()
		idw_periodo.retrieve(i_vigencia,i_año)
		reset_dws()
		pb_find.enabled=true
		pb_new.enabled=false

	case 'periodo'
		i_periodo=long(data)
		reset_dws()
		dw_historial.retrieve(i_cdoc,clugar,i_vigencia,i_año,i_periodo)
		i_fila=0
		dw_historial.event rowfocuschanged(1)
end choose
select estado,inicia,termina into :i_estado_per,:ld_fini_per,:ld_ffin_per from pre_periodos where cod_vigencia=:i_vigencia and periodo=:i_periodo and ano=:i_año;
if isnull(c_estado) or c_estado='2' then
	pb_new.enabled=false
	pb_save.enabled=false
	pb_save_def.enabled=false
	pb_anula.enabled=false
else
	pb_new.enabled=true
	pb_save.enabled=true
	pb_save_def.enabled=true
	pb_anula.enabled=true
end if
end event

type gb_1 from groupbox within w_docum_base1
integer x = 41
integer y = 120
integer width = 4059
integer height = 44
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_cab from datawindow within w_docum_base1
integer x = 2834
integer y = 200
integer width = 2560
integer height = 784
integer taborder = 80
string title = "none"
string dataobject = "dw_pre_doc_cab"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('cod_flujo',idw_flujo)
idw_flujo.settransobject(sqlca)
idw_flujo.retrieve(i_cdoc)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())

end event

event losefocus;if accepttext()=-1 then setfocus()
end event

event retrieveend;if rowcount()=0 then return
if getitemstring(1,'estado')<>'0' then 
	object.objeto.edit.displayonly='yes'
else
	object.objeto.edit.displayonly='no'
end if
end event

event buttonclicked;st_interfaz st_pasa
st_pasa.dw_cab=dw_cab
st_pasa.cod_vigencia=dw_cab.getrow()
openwithparm(w_cambia_objeto,st_pasa)
end event

type dw_cont from datawindow within w_docum_base1
integer x = 2834
integer y = 212
integer width = 1957
integer height = 720
integer taborder = 80
string title = "none"
string dataobject = "dw_reserva_cont"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
dw_cont.GetChild('clase_cont',dwc_f)
dwc_f.SetTransObject(SQLCA)
dwc_f.Retrieve('%')
dwc_f.SetFilter("coddoct='SCT' or coddoc='NC'")
dwc_f.Filter()

dw_cont.GetChild('tipo_cont',dwc_t)
dwc_t.SetTransObject(SQLCA)
if dwc_t.Retrieve('%') = 0 then
	dwc_t.InsertRow(0)
end if

end event

event itemchanged;if getcolumnname()='clase_cont' then
	dwc_t.Retrieve(data)
end if

end event

