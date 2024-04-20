$PBExportHeader$w_modifica.srw
$PBExportComments$Modificaciones de Disponibilidades
forward
global type w_modifica from window
end type
type dw_movi from datawindow within w_modifica
end type
type st_2 from statictext within w_modifica
end type
type pb_grabar from picturebutton within w_modifica
end type
type pb_9 from picturebutton within w_modifica
end type
type st_1 from statictext within w_modifica
end type
type t1 from tab within w_modifica
end type
type p1 from userobject within t1
end type
type dw_mcpo from datawindow within p1
end type
type p1 from userobject within t1
dw_mcpo dw_mcpo
end type
type p2 from userobject within t1
end type
type dw_sle2 from datawindow within p2
end type
type pb_13 from picturebutton within p2
end type
type st_8 from statictext within p2
end type
type st_10 from statictext within p2
end type
type st_9 from statictext within p2
end type
type dw_scpo from datawindow within p2
end type
type p2 from userobject within t1
dw_sle2 dw_sle2
pb_13 pb_13
st_8 st_8
st_10 st_10
st_9 st_9
dw_scpo dw_scpo
end type
type p3 from userobject within t1
end type
type dw_ter from datawindow within p3
end type
type p3 from userobject within t1
dw_ter dw_ter
end type
type t1 from tab within w_modifica
p1 p1
p2 p2
p3 p3
end type
type dw_modcab from datawindow within w_modifica
end type
end forward

global type w_modifica from window
integer width = 4389
integer height = 1704
boolean titlebar = true
string title = "Presupuesto - Modificaciones"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_movi dw_movi
st_2 st_2
pb_grabar pb_grabar
pb_9 pb_9
st_1 st_1
t1 t1
dw_modcab dw_modcab
end type
global w_modifica w_modifica

type variables
st_ppto st_p
date ld_termina
long nuevo
string equ
boolean borra=FALSE
DataWindowChild dwc_per
int i_dec_pre,i_aprox_gral

end variables

on w_modifica.create
this.dw_movi=create dw_movi
this.st_2=create st_2
this.pb_grabar=create pb_grabar
this.pb_9=create pb_9
this.st_1=create st_1
this.t1=create t1
this.dw_modcab=create dw_modcab
this.Control[]={this.dw_movi,&
this.st_2,&
this.pb_grabar,&
this.pb_9,&
this.st_1,&
this.t1,&
this.dw_modcab}
end on

on w_modifica.destroy
destroy(this.dw_movi)
destroy(this.st_2)
destroy(this.pb_grabar)
destroy(this.pb_9)
destroy(this.st_1)
destroy(this.t1)
destroy(this.dw_modcab)
end on

event open;st_p = Message.PowerObjectParm

SELECT ENTERO into :i_dec_pre
FROM parametros_gen
WHERE (((codigo_para)=29));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 29')
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

t1.p1.dw_mcpo.GetChild('periodo',dwc_per)
dwc_per.SetTransObject(SQLCA)
if dwc_per.Retrieve(st_p.cod_vigencia,st_p.año) = 0 then
	messagebox('Error','No existen periodos para la vigencia seleccionada')
	dwc_per.insertRow(0)
end if

if st_p.dw_obj.RowCount() = 0 then Return
long f, fila
dec pi,tra,add,rec,disp,mdisp
string codtotal, valor, cd, cl
double nd, it


select equilibrio,termina into :equ,:ld_termina  from pre_vigencia where cod_vigencia = :st_p.cod_vigencia;
if isNull(equ) then equ = '1'
if equ = '0' then
	t1.p2.dw_scpo.DataObject = 'dw_pre_doc_scp_mod'
	t1.p2.dw_scpo.SetTransObject(SQLCA)
	t1.p2.pb_13.PowerTipText = 'Buscar Cuentas'
else
	t1.p2.dw_scpo.DataObject = 'dw_pre_doc_scp2_mod'
	t1.p2.dw_scpo.SetTransObject(SQLCA)
	t1.p2.pb_13.PowerTipText = 'Traer Cuentas relacionadas'
end if
if today()>=ld_termina  then
	st_p.periodo = month(ld_termina)
else
	st_p.periodo = month(today())
end if

f = st_p.dw_obj.GetRow()

dw_modcab.Retrieve(st_p.dw_obj.GetItemString(f,'coddoc'),st_p.dw_obj.GetItemString(f,'clugar'),st_p.dw_obj.GetItemNumber(f,'numdoc'),st_p.coddoc)
fila =dw_modcab.InsertRow(1)
dw_modcab.SetItem(fila,'coddoc',st_p.coddoc)
dw_modcab.SetItem(fila,'cLugar',cLugar)
dw_modcab.SetItem(fila,'cod_vigencia',st_p.cod_vigencia)
dw_modcab.SetItem(fila,'periodo',st_p.periodo)
if today()>=ld_termina  then
	dw_modcab.SetItem(fila,'fecha',ld_termina)
else
	dw_modcab.SetItem(fila,'fecha',today())
end if

dw_modcab.SetItem(fila,'estado','0')
dw_modcab.ScrolltoRow(fila)
setnull(fila)
dw_modcab.TriggerEvent(RowFocusChanged!)
nuevo = 1

valor = t1.p1.dw_mcpo.Describe("Evaluate('max(item)',0)")
fila = t1.p1.dw_mcpo.InsertRow(0)
t1.p1.dw_mcpo.SetItem(fila,'coddoc',dw_modcab.GetItemString(dw_modcab.GetRow(),'coddoc'))
t1.p1.dw_mcpo.SetItem(fila,'cLugar',dw_modcab.GetItemString(dw_modcab.GetRow(),'clugar'))
t1.p1.dw_mcpo.SetItem(fila,'numdoc',dw_modcab.GetItemNumber(dw_modcab.GetRow(),'numdoc'))
t1.p1.dw_mcpo.SetItem(fila,'item',long(valor) + 1)
t1.p1.dw_mcpo.SetItem(fila,'cod_vigencia',st_p.dw_obj.GetItemNumber(f,'cod_vigencia'))
t1.p1.dw_mcpo.SetItem(fila,'periodo',st_p.periodo)
t1.p1.dw_mcpo.SetItem(fila,'codtotal',st_p.dw_obj.GetItemString(f,'codtotal'))
t1.p1.dw_mcpo.SetItem(fila,'descrip',st_p.dw_obj.GetItemString(f,'descrip'))
t1.p1.dw_mcpo.SetItem(fila,'coddoc_orig',st_p.dw_obj.GetItemString(f,'coddoc'))
t1.p1.dw_mcpo.SetItem(fila,'cLugar_orig',st_p.dw_obj.GetItemString(f,'cLugar'))
t1.p1.dw_mcpo.SetItem(fila,'numdoc_orig',st_p.dw_obj.GetItemNumber(f,'numdoc'))
t1.p1.dw_mcpo.SetItem(fila,'item_orig',st_p.dw_obj.GetItemNumber(f,'item'))
t1.p1.dw_mcpo.SetItem(fila,'monto_vigente_orig',st_p.dw_obj.GetItemNumber(f,'monto_vigente')) 
t1.p1.dw_mcpo.SetItem(fila,'monto_utilizado_orig',st_p.dw_obj.GetItemNumber(f,'monto_utilizado')) 

if st_p.dw_obj.GetItemNumber(f,'monto_utilizado') < st_p.dw_obj.GetItemNumber(f,'monto_vigente') then
	t1.p1.dw_mcpo.SetItem(fila,'monto',st_p.dw_obj.GetItemNumber(f,'monto_utilizado'))
	t1.p1.dw_mcpo.SetItem(fila,'monto_vigente',st_p.dw_obj.GetItemNumber(f,'monto_utilizado'))
end if

codtotal = st_p.dw_obj.GetItemString(f,'codtotal')
if st_p.coddoc = 'DM' then
	SELECT pre_plan.planeado_inicial, v_pre_suma_acum.acum_traslado, v_pre_suma_acum.acum_adicion, v_pre_suma_acum.acum_recorte, v_pre_suma_acum.acum_dispon, v_pre_suma_acum.acum_mod_dispo
	into :pi, :tra, :add, :rec, :disp, :mdisp
	FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia) AND (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal)
	where cod_vigencia=:st_p.cod_vigencia and codtotal=:codtotal;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
	if isNull(pi) then pi = 0
	if isNull(tra) then tra = 0
	if isNull(add) then add = 0
	if isNull(rec) then rec = 0
	if isNull(disp) then disp = 0
	if isNull(mdisp) then mdisp = 0
	
	t1.p1.dw_mcpo.SetItem(fila,'saldo_plan',pi + tra + add + rec - disp - mdisp)
	t1.p3.Enabled = FALSE
elseif st_p.coddoc = 'RM' then
	cd = st_p.dw_obj.GetItemString(f,'coddoc_orig')
	cl = st_p.dw_obj.GetItemString(f,'cLugar_orig')
	nd = st_p.dw_obj.GetItemNumber(f,'numdoc_orig')
	it = st_p.dw_obj.GetItemNumber(f,'item_orig')
	select monto_vigente - monto_utilizado into :disp from pre_docu_cp
	where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return
	END IF
	t1.p1.dw_mcpo.SetItem(fila,'saldo_plan',disp)
	t1.p2.Enabled = FALSE
	t1.p3.Enabled = TRUE
	t1.p3.dw_ter.Modify("monto.protect=0")
	t1.p3.dw_ter.Retrieve(st_p.dw_obj.GetItemString(f,'coddoc'),st_p.dw_obj.GetItemString(f,'clugar'),st_p.dw_obj.GetItemNumber(f,'numdoc'))
end if
t1.p1.dw_mcpo.ScrolltoRow(fila)
t1.p1.dw_mcpo.SetColumn('monto')
t1.p1.dw_mcpo.TriggerEvent(itemChanged!)


t1.p1.dw_mcpo.TriggerEvent(RowFocusChanged!)
t1.p2.dw_scpo.Retrieve(st_p.dw_obj.GetItemString(f,'coddoc'),st_p.dw_obj.GetItemString(f,'clugar'),st_p.dw_obj.GetItemNumber(f,'numdoc'),st_p.dw_obj.GetItemNumber(f,'item'))

end event

event closequery;if t1.p1.dw_mcpo.GetItemStatus(t1.p1.dw_mcpo.GetRow(),0,Primary!) = NewModified! then
	int ret
	ret = MessageBox('Atención','No ha grabado los cambios. Desea modificar la disponibilidad?',QUESTION!,YESNOCANCEL!,3)
	if ret = 1 then
		Return pb_grabar.Event clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

type dw_movi from datawindow within w_modifica
boolean visible = false
integer x = 3447
integer y = 20
integer width = 178
integer height = 92
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dw_plan_mov_det"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;Rollback;
Return 0

end event

event constructor;setTransObject(SQLCA)

end event

type st_2 from statictext within w_modifica
integer x = 3387
integer y = 72
integer width = 882
integer height = 492
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Cambie el monto del rubro y distribuya el monto en la grilla de la ficha Distribución de Ingresos. Podrá en este último, agregar rubros y modificar montos, no eliminar rubros; en su lugar coloque el monto en 0"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_grabar from picturebutton within w_modifica
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 3589
integer y = 576
integer width = 142
integer height = 124
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar2.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if t1.p1.dw_mcpo.RowCount() = 0 then Return
long f, j, fila, periodo, item, fobj,final, i
string msg, err, valor, cd, cl
double numdoc, nd, it
dec monto, monto_orig, monto_res, monto_util, monto_mod ,monto_temp
uo_datastore dw_ss
dw_ss = Create uo_datastore
dw_ss.DataObject = 'dw_pre_doc_scp_mod'
dw_ss.SetTransObject(SQLCA)

fobj = st_p.dw_obj.GetRow()

f = t1.p1.dw_mcpo.GetRow()
if t1.p1.dw_mcpo.GetItemStatus(f,0,Primary!) <> NewModified! then
	MessageBox('Atención','Solo se grabarán nuevas modificaciones en la ficha Rubros')
	Return -1
end if
if t1.p1.dw_mcpo.AcceptText() = -1 then Return -1

if round(t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'total'),i_dec_pre)=0 then
	messageBox('Atención','No hay modificación montos iguales')
	Return -1
end if

monto = round( t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'monto_vigente_orig'),i_dec_pre)
if (round(t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'monto'),i_dec_pre) > monto) and (round(t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'monto'),i_dec_pre) - monto > round(t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'saldo_plan') ,i_dec_pre)) then
	messageBox('Atención','El monto excede el saldo de apropiación para satisfacer el monto adicional.')
	Return -1
end if
if t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'monto') < t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'monto_utilizado_orig') then
	messageBox('Atención','El monto es menor que el monto ya utilizado.')
	Return -1
end if

if messageBox('Atención','Modificará el documento y afectará saldos en el Plan presupuestal. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return -1
if st_p.coddoc = 'DM' then
	if t1.p1.dw_mcpo.GetItemNumber(f,'monto') <> dec(t1.p2.dw_scpo.Describe("evaluate('sum(n_monto)',0)")) then
		MessageBox('Atención','El monto nuevo no coincide con los de equilibrio')
		Return -1
	end if
end if

if st_p.coddoc = 'RM' then
	monto_res = 0
	
	for i = 1 to st_p.dw_obj.RowCount()
		if i = st_p.dw_obj.GetRow() then
			monto_res =round( monto_res + t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'monto'),i_dec_pre)
		else
			monto_res = round(monto_res + st_p.dw_obj.GetItemNumber(i,'monto_vigente'),i_dec_pre)
		end if
	next
	if monto_res <> round(t1.p3.dw_ter.GetItemNumber(1,'total'),i_dec_pre) then
		MessageBox('Atención','El nuevo monto para el total de la reserva- '+string(monto_res,'#,##0.00')+' - no coincide con el monto en Terceros')
		Return -1
	end if
end if

if nuevo = 1 then
	numdoc = f_trae_ndoc(st_p.coddoc,clugar,st_p.coddoc)
	if numdoc=-1 then return -1
	dw_modcab.SetItem(1,'numdoc',numdoc)
	for j = 1 to t1.p1.dw_mcpo.RowCount()
		t1.p1.dw_mcpo.SetItem(j,'numdoc',numdoc)
	next
	for j = 1 to t1.p2.dw_scpo.RowCount()
		t1.p2.dw_scpo.SetItem(j,'numdoc',numdoc)
	next
	dw_modcab.SetItem(1,'estado','1')
end if
final = f_consec(st_p.cod_vigencia,st_p.coddoc,cLugar)
dw_modcab.setitem(1,'consecutivo',final)
if today()>=ld_termina  then
	dw_modcab.setitem(1,'fecha_consecu',datetime(ld_termina,now()))
else
	dw_modcab.setitem(1,'fecha_consecu',datetime(today(),now()))	
end if
dw_modcab.setitem(dw_modcab.GetRow(),'año',year(date(dw_modcab.getitemdatetime(dw_modcab.getrow(),'fecha_consecu'))))
if dw_modcab.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.p1.dw_mcpo.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if t1.p2.dw_scpo.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if t1.p3.dw_ter.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

string codtotal, cod_ingreso
double cod_vigencia
dec diff
cod_vigencia = t1.p1.dw_mcpo.GetItemNumber(f,'cod_vigencia')
periodo = t1.p1.dw_mcpo.getitemNumber(f,'periodo')

codtotal = t1.p1.dw_mcpo.GetItemString(f,'codtotal')
diff = t1.p1.dw_mcpo.GetItemNumber(f,'monto_vigente')

fila = dw_movi.insertRow(0)
dw_movi.setitem(fila,'cod_vigencia',st_p.cod_vigencia)

dw_movi.setitem(fila,'codtotal',codtotal)
dw_movi.setitem(fila,'periodo',periodo)
dw_movi.setitem(fila,'año',st_p.año)
if today()>=ld_termina  then
	dw_movi.setitem(fila,'fecha',datetime(ld_termina,now()))
else
	dw_movi.setitem(fila,'fecha',datetime(today(),now()))
end if
dw_movi.setitem(fila,'coddoc',t1.p1.dw_mcpo.getitemString(f,'coddoc'))
dw_movi.setitem(fila,'clugar',t1.p1.dw_mcpo.getitemString(f,'clugar'))
dw_movi.setitem(fila,'numdoc',t1.p1.dw_mcpo.getitemNumber(f,'numdoc'))
dw_movi.setitem(fila,'item',t1.p1.dw_mcpo.getItemNumber(f,'item'))
if st_p.coddoc = 'DM' then
	dw_movi.setitem(fila,'monto_mod_dispon',round(t1.p1.dw_mcpo.getItemNumber(f,'monto_vigente'),i_dec_pre))
elseif st_p.coddoc = 'RM' then
	dw_movi.setitem(fila,'monto_mod_reserva',round(t1.p1.dw_mcpo.getItemNumber(f,'monto_vigente'),i_dec_pre))
end if

SELECT Max(pre_plan_movi_deta.num_movi) into :item
FROM pre_plan_movi_deta
WHERE pre_plan_movi_deta.cod_vigencia=:st_p.cod_vigencia AND pre_plan_movi_deta.CodTotal=:codtotal
AND pre_plan_movi_deta.periodo=:periodo;
if SQLCA.SQLcode=-1 then
	err = SQLCA.SQLerrtext
	rollback;
	messagebox('Error leyendo pre_plan_movi_deta',err)
	return -1
end if
if isnull(item) then item=0 
item++
dw_movi.setitem(fila,'num_movi',item) 
if dw_movi.Update() = -1 then 
	Rollback;
	return -1
end if
if st_p.coddoc = 'DM' then
	dw_ss.Retrieve(st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'coddoc'), st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'clugar'), st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'numdoc'),st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'item'))
	for j = 1 to t1.p2.dw_scpo.rowcount()
		diff = t1.p2.dw_scpo.GetItemNumber(j,'monto')
		fila = dw_movi.insertrow(0)
		dw_movi.setitem(fila,'cod_vigencia',st_p.cod_vigencia)
		codtotal = t1.p2.dw_scpo.getitemstring(j,'codtotal')
		dw_movi.setitem(fila,'codtotal',codtotal)
		dw_movi.setitem(fila,'periodo',periodo)
		dw_movi.setitem(fila,'año',st_p.año)
		if today()>=ld_termina  then
			dw_movi.setitem(fila,'fecha',datetime(ld_termina,now()))
		else
			dw_movi.setitem(fila,'fecha',datetime(today(),now()))
		end if
		dw_movi.setitem(fila,'coddoc',t1.p2.dw_scpo.getItemString(j,'coddoc'))
		dw_movi.setitem(fila,'clugar',t1.p2.dw_scpo.getItemString(j,'clugar'))
		dw_movi.setitem(fila,'numdoc',t1.p2.dw_scpo.getItemNumber(j,'numdoc'))
		dw_movi.setitem(fila,'item',t1.p2.dw_scpo.getitemnumber(j,'item'))
		dw_movi.setitem(fila,'coddoc_scp',t1.p2.dw_scpo.getitemstring(j,'coddoc'))
		dw_movi.setitem(fila,'clugar_scp',t1.p2.dw_scpo.getitemstring(j,'clugar'))
		dw_movi.setitem(fila,'numdoc_scp',t1.p2.dw_scpo.getitemNumber(j,'numdoc'))
		dw_movi.setitem(fila,'item_scp',t1.p2.dw_scpo.getitemnumber(j,'item'))
		dw_movi.setitem(fila,'sitem_scp',t1.p2.dw_scpo.getitemnumber(j,'sitem'))
		if st_p.coddoc = 'DM' then
			dw_movi.setitem(fila,'monto_mod_dispon',t1.p2.dw_scpo.getitemnumber(j,'monto'))
		elseif st_p.coddoc = 'RM' then
			dw_movi.setitem(fila,'monto_mod_reserva',t1.p2.dw_scpo.getitemnumber(j,'monto'))
		end if
		
		SELECT Max(pre_plan_movi_deta.num_movi) into :item
		FROM pre_plan_movi_deta
		WHERE pre_plan_movi_deta.cod_vigencia=:st_p.cod_vigencia AND pre_plan_movi_deta.CodTotal=:codtotal
		AND pre_plan_movi_deta.periodo=:periodo;
		if SQLCA.SQLCode=-1 then
			err = SQLCA.SQlerrText
			rollback;
			messagebox('Error leyendo pre_plan_movi_deta',err)
			return -1
		end if
		if isnull(item) then item=0 
		item++
		dw_movi.SetItem(fila,'num_movi',item) 
		if dw_movi.update() = -1 then return -1
		
		fila = dw_ss.Find("codtotal='"+codtotal+"'",1,dw_ss.RowCount())
		if fila  = 0 then
			valor = dw_ss.Describe("Evaluate('max(sitem)',0)")
			fila = dw_ss.InsertRow(0)
			dw_ss.SetItem(fila,'coddoc',st_p.dw_obj.GetItemString(fobj,'coddoc'))
			dw_ss.SetItem(fila,'clugar',st_p.dw_obj.GetItemString(fobj,'clugar'))
			dw_ss.SetItem(fila,'numdoc',st_p.dw_obj.GetItemNumber(fobj,'numdoc'))
			dw_ss.SetItem(fila,'item',st_p.dw_obj.GetItemNumber(fobj,'item'))
			dw_ss.SetItem(fila,'sitem',long(valor) + 1)
			dw_ss.SetItem(fila,'codtotal',codtotal)
			dw_ss.SetItem(fila,'cod_vigencia',t1.p2.dw_scpo.getItemNumber(j,'cod_vigencia'))
			dw_ss.SetItem(fila,'monto',t1.p2.dw_scpo.getitemnumber(j,'n_monto'))
		elseif fila > 0 then
			dw_ss.SetItem(fila,'monto',t1.p2.dw_scpo.getitemnumber(j,'n_monto'))
		end if
		if dw_ss.update() = -1 then
			Rollback;
			Return -1
		end if
	next
end if

if st_p.coddoc = 'DM' then
	cd = st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'coddoc')
	cl = st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'clugar')
	nd = st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'numdoc')
	it = st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'item')
	monto = round(t1.p1.dw_mcpo.getItemNumber(f,'monto'),i_dec_pre)
	select monto_utilizado into :monto_orig from pre_docu_cp
	where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
	if SQLCA.SQLCode=-1 then
		err = SQLCA.SQlerrText
		rollback;
		messagebox('Error leyendo disponibilidad origen',err)
		return -1
	end if
	if monto_orig > monto then
		Rollback;
		MessageBox('Atención','El monto utilizado de la disponibilidad es menor que el monto modificado')
		return -1
	end if
end if

if st_p.coddoc = 'RM' then
	cd = st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'coddoc_orig')
	cl = st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'clugar_orig')
	nd = st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'numdoc_orig')
	it = st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'item_orig')
	monto = round(t1.p1.dw_mcpo.getItemNumber(f,'monto'),I_dec_pre)
	monto_mod = round(t1.p1.dw_mcpo.getItemNumber(f,'monto_vigente'),i_dec_pre)
	select monto_vigente, monto_utilizado into :monto_orig, :monto_util from pre_docu_cp
	where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
	if SQLCA.SQLCode=-1 then
		err = SQLCA.SQlerrText
		rollback;
		messagebox('Error leyendo disponibilidad origen',err)
		return -1
	end if
	if round(monto_orig,i_dec_pre) < round(monto,i_dec_pre) then
		Rollback;
		MessageBox('Atención','El monto vigente de la disponibilidad es menor que el monto modificado de la reserva')
		return -1
	end if
	if round((monto_util + monto_mod),i_dec_pre) < 0 then
		Rollback;
		MessageBox('Atención','Se registraría valor negativo en monto_utilizado en disponibilidad '+string(nd)+' item '+string(it))
		return -1
	end if
	monto_temp=round(monto_util + monto_mod,i_dec_pre)
	if st_p.flujo= 'PRSCT' or st_p.flujo = 'PRNC' then
		update pre_docu_cp set monto_utilizado=:monto_temp,monto_interfaz=:monto_temp
		where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
	else
		update pre_docu_cp set monto_utilizado=:monto_temp
		where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
	end if
	if SQLCA.SQLCode=-1 then
		err = SQLCA.SQlerrText
		rollback;
		messagebox('Error actualizando disponibilidad origen',err)
		return -1
	end if
end if

st_p.dw_obj.SetItem(fobj,'monto_vigente',t1.p1.dw_mcpo.GetItemNumber(f,'monto'))
st_p.dw_obj.SetItem(fobj,'estado','1')
if st_p.dw_obj.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

commit;

dw_modcab.ResetUpdate()
string estado //esto es para que ejecute el trigger en SYBASE
estado=dw_modcab.getitemstring(dw_modcab.getrow(),'estado')
dw_modcab.setitem(dw_modcab.getrow(),'estado','3')
dw_modcab.setitem(dw_modcab.getrow(),'estado',estado)
dw_modcab.update()
commit;

cd = st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'coddoc')
cl = st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'clugar')
nd = st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'numdoc')
it = st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'item')
//monto_temp=st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'monto_utilizado')
select monto_vigente, monto_utilizado into :monto_orig, :monto_util from pre_docu_cp
where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
if SQLCA.SQLCode=-1 then
	err = SQLCA.SQlerrText
	rollback;
	messagebox('Error leyendo Documento origen',err)
	return -1
end if
if st_p.coddoc = 'RM' then
	UPDATE CONTRA_PRESU SET monto_utilizado = :monto_orig
	WHERE 
		(((CONTRA_PRESU.coddocu_reser)=:cd) AND ((CONTRA_PRESU.clugar_reser)=:cl) AND 
		((CONTRA_PRESU.numdoc_reser)=:nd) AND ((CONTRA_PRESU.item_reser)=:it) AND 
		((CONTRA_PRESU.OTROSI)<>1));
	if SQLCA.SQLCode=-1 then
		err = SQLCA.SQlerrText
		rollback;
		messagebox('Error actualizando Contratacion Reserva',err)
		return -1
	end if
End If
if st_p.coddoc = 'DM' then
	UPDATE CONTRA_PRESU SET monto= :monto_orig
	WHERE 
		(((CONTRA_PRESU.coddocu_dispo)=:cd) AND ((CONTRA_PRESU.clugar_dispo)=:cl) AND 
		((CONTRA_PRESU.numdoc_dispo)=:nd) AND ((CONTRA_PRESU.item_dispo)=:it) AND 
		((CONTRA_PRESU.OTROSI)<>1));

	if SQLCA.SQLCode=-1 then
		err = SQLCA.SQlerrText
		rollback;
		messagebox('Error actualizando Contratacion Disponibilidad',err)
		return -1
	end if
end if

t1.p1.dw_mcpo.ResetUpdate()
st_p.dw_obj.ResetUpdate()
t1.p2.dw_scpo.ResetUpdate()
st_p.dw_obj.Retrieve(st_p.dw_obj.GetItemString(fobj,'coddoc'),st_p.dw_obj.GetItemString(fobj,'clugar'),st_p.dw_obj.GetItemNumber(fobj,'numdoc'))
if monto_orig > monto_util then
	update pre_docu_cb set estado = '1' 
	where coddoc=:cd and clugar=:cl and numdoc=:nd;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		MessageBox("SQL error", msg)
		Rollback;
		Return -1
	END IF
End IF

SELECT 	pre_docu_cp_1.coddoc, pre_docu_cp_1.clugar, pre_docu_cp_1.numdoc, pre_docu_cp.monto_vigente, pre_docu_cp.monto_utilizado
into :cd, :cl , :nd, :monto_orig, :monto_util 
FROM pre_docu_cp INNER JOIN pre_docu_cp AS pre_docu_cp_1 ON (pre_docu_cp.item_orig = pre_docu_cp_1.item) AND (pre_docu_cp.numdoc_orig = pre_docu_cp_1.numdoc) AND (pre_docu_cp.clugar_orig = pre_docu_cp_1.clugar) AND (pre_docu_cp.coddoc_orig = pre_docu_cp_1.coddoc)
where pre_docu_cp.coddoc=:cd and pre_docu_cp.clugar=:cl and pre_docu_cp.numdoc=:nd and pre_docu_cp.item=:it;
if monto_orig > monto_util then
	update pre_docu_cb set estado = '1' 
	where coddoc=:cd and clugar=:cl and numdoc=:nd;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		MessageBox("SQL error En actualizacion de la fuente", msg)
		Rollback;
		Return -1
	END IF
End IF

close(parent)
end event

type pb_9 from picturebutton within w_modifica
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 3758
integer y = 576
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type st_1 from statictext within w_modifica
integer x = 59
integer y = 16
integer width = 389
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Modificaciones"
boolean focusrectangle = false
end type

type t1 from tab within w_modifica
event create ( )
event destroy ( )
integer x = 18
integer y = 612
integer width = 4274
integer height = 936
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
p1 p1
p2 p2
p3 p3
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.p3=create p3
this.Control[]={this.p1,&
this.p2,&
this.p3}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
destroy(this.p3)
end on

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4238
integer height = 808
long backcolor = 67108864
string text = "Rubros Modificados"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
dw_mcpo dw_mcpo
end type

on p1.create
this.dw_mcpo=create dw_mcpo
this.Control[]={this.dw_mcpo}
end on

on p1.destroy
destroy(this.dw_mcpo)
end on

type dw_mcpo from datawindow within p1
integer x = 23
integer y = 36
integer width = 4155
integer height = 728
integer taborder = 10
string title = "none"
string dataobject = "dw_pre_doc_cp_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;if this.RowCount() = 0 or currentrow = 0 then Return
if isNull(this.GetItemString(this.Getrow(),'codtotal')) then Return

if not isNull(this.GetItemNumber(this.Getrow(),'item_orig')) then
	t1.p2.dw_scpo.SetFilter("item=" + string(this.GetItemNumber(this.Getrow(),'item_orig')))
	t1.p2.dw_scpo.Filter()
	t1.p2.st_9.Text = this.GetItemString(this.Getrow(),'codtotal') + " - " + this.GetItemString(this.Getrow(),'descrip')
	t1.p2.st_8.Text = string(this.GetItemNumber(this.Getrow(),'monto'),'#,##0.00')
end if

end event

event itemchanged;dec monto_ori, ant, valor
integer filas

filas=GetRow()
if this.GetColumnName() = 'monto' then
	valor=round(dec(data),i_dec_pre)
	if i_dec_pre=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	
	if isNull(data) then valor = GetItemNumber(filas,'monto')
	monto_ori = GetItemNumber(filas,'monto_vigente_orig')
	if (valor > monto_ori) and (valor - monto_ori > GetItemNumber(filas,'saldo_plan') ) then
		messageBox('Atención','El monto excede el saldo de apropiación para satisfacer el monto adicional.')
		Return 1
	end if
	if valor < GetItemNumber(filas,'monto_utilizado_orig') then
		messageBox('Atención','El monto es menor que el monto ya utilizado.')
		Return 1
	end if
	if this.AcceptText() = -1 then Return -1
	setItem(filas,'monto_vigente',valor - monto_ori)
	setitem(row,'Monto',valor)
	t1.p2.st_8.Text = string(GetItemNumber(filas,'monto'),'#,##0.00')
	return 2
end if

end event

event dberror;Rollback;
Return 0

end event

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4238
integer height = 808
long backcolor = 67108864
string text = "Distribución de Ingresos"
long tabtextcolor = 33554432
string picturename = "pesos_deta.ico"
long picturemaskcolor = 536870912
dw_sle2 dw_sle2
pb_13 pb_13
st_8 st_8
st_10 st_10
st_9 st_9
dw_scpo dw_scpo
end type

on p2.create
this.dw_sle2=create dw_sle2
this.pb_13=create pb_13
this.st_8=create st_8
this.st_10=create st_10
this.st_9=create st_9
this.dw_scpo=create dw_scpo
this.Control[]={this.dw_sle2,&
this.pb_13,&
this.st_8,&
this.st_10,&
this.st_9,&
this.dw_scpo}
end on

on p2.destroy
destroy(this.dw_sle2)
destroy(this.pb_13)
destroy(this.st_8)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.dw_scpo)
end on

type dw_sle2 from datawindow within p2
boolean visible = false
integer x = 1426
integer y = 704
integer width = 571
integer height = 96
integer taborder = 32
boolean enabled = false
string title = "none"
string dataobject = "dw_slecta"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dw_modcab.RowCount() = 0 or t1.p1.dw_mcpo.rowcount() = 0 then Return
string codtotal, valor, descripcion, texto
long  fila, filas, i, fr
dec plan_ini,planeado_actual,acum_adic,acum_trasl,acum_recor,acum_dispo,acum_mod_dispo,acum_reser,acum_mod_reser,acum_giro,acum_recon,acum_recau

AcceptText()
texto = GetItemString(1,1)
if texto = '' then Return

SELECT pre_plan.CodTotal, pre_plan.descrip, pre_plan.planeado_inicial, v_pre_suma_acum.acum_traslado, v_pre_suma_acum.acum_adicion, v_pre_suma_acum.acum_recorte, v_pre_suma_acum.acum_dispon, v_pre_suma_acum.acum_mod_dispo, v_pre_suma_acum.acum_reserva, v_pre_suma_acum.acum_mod_reserv, v_pre_suma_acum.acum_girado, v_pre_suma_acum.acum_recon, v_pre_suma_acum.acum_recaudo
into :codTotal, :descripcion, :plan_ini ,:acum_trasl,:acum_adic,:acum_recor,:acum_dispo,:acum_mod_dispo,:acum_reser,:acum_mod_reser,:acum_giro,:acum_giro,:acum_recau
FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
WHERE (((pre_plan.CodTotal)=:Texto) AND ((pre_plan.cod_vigencia)=:st_p.cod_vigencia) AND ((pre_plan.tipo)='0') AND ((pre_plan.movimiento)='1'));

if SQLCA.SQLCode = -1 then
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return
elseif SQLCA.SQLCode = 100 then
	Messagebox('Error','La cuenta no aparece en el Plan de Presupuesto o no es de movimiento')
	Return
end if
if isnull(plan_ini) then
	messagebox('Error en Pre_plan','Esta cuenta no tiene valor planeado inicial')
	return 1
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

planeado_actual = plan_ini+acum_trasl+acum_adic+acum_recor
//if planeado_actual = 0 and (i_cdoc='PDI' or i_cdoc='PPR') then 
//	messagebox('Atención','Este rubro no tiene valor Planeado Actual')
//	return
//end if
fila = dw_scpo.Find("codtotal='" + codtotal+"'",1,dw_scpo.RowCount())
if fila = 0 then
	fila = dw_scpo.InsertRow(0)
	valor = dw_scpo.Describe("Evaluate('max(sitem)',0)")
	dw_scpo.SetItem(fila,'coddoc',t1.p1.dw_mcpo.GetItemString(t1.p1.dw_mcpo.GetRow(),'coddoc'))
	dw_scpo.SetItem(fila,'cLugar',t1.p1.dw_mcpo.GetItemString(t1.p1.dw_mcpo.GetRow(),'clugar'))
	dw_scpo.SetItem(fila,'numdoc',t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'numdoc'))
	dw_scpo.SetItem(fila,'item',t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'item'))
	dw_scpo.SetItem(fila,'sitem',long(valor) + 1)
	dw_scpo.SetItem(fila,'cod_vigencia',st_p.cod_vigencia)
	dw_scpo.SetItem(fila,'codtotal',codtotal)
	dw_scpo.SetItem(fila,'descrip',descripcion)
	dw_scpo.SetItem(fila,'planeado_inicial',plan_ini)
	dw_scpo.SetItem(fila,'acum_traslado',acum_trasl)
	dw_scpo.SetItem(fila,'acum_adicion',acum_adic)
	dw_scpo.SetItem(fila,'acum_recorte',acum_recor)
	dw_scpo.SetItem(fila,'acum_dispon',acum_dispo)
	dw_scpo.SetItem(fila,'acum_mod_dispo',acum_mod_dispo)
	dw_scpo.SetItem(fila,'acum_reserva',acum_reser)
	dw_scpo.SetItem(fila,'acum_mod_reserv',acum_mod_reser)
	dw_scpo.SetItem(fila,'acum_girado',acum_giro)
	dw_scpo.SetItem(fila,'acum_recon',acum_recon)
	dw_scpo.SetItem(fila,'acum_recaudo',acum_recau)
	dw_scpo.SetItem(fila,'monto',0)
	dw_scpo.SetItem(fila,'monto_ant',0)
	dw_scpo.SetItem(fila,'estado','0')
	dw_scpo.ScrolltoRow(fila)
	
	dw_scpo.TriggerEvent(rowfocuschanged!)

	settext('')
	setitem(1,1,'')
end if

end event

event constructor;insertRow(1)

end event

type pb_13 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 3593
integer y = 684
integer width = 142
integer height = 124
integer taborder = 22
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
string powertiptext = "Buscar"
end type

event clicked;if dw_modcab.RowCount() = 0 or t1.p1.dw_mcpo.rowcount()=0 then Return

if t1.p1.dw_mcpo.GetItemStatus(t1.p1.dw_mcpo.GetRow(),0,Primary!) <> NewModified! then
	MessageBox('Atención','Solo se grabarán nuevas modificaciones en la ficha Rubros')
	Return -1
end if

if equ = '0' then
	st_ppto st_parm
	st_parm.cod_vigencia = st_p.cod_vigencia
	st_parm.filtro = "tipo='0' and movimiento='1'"
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
	
	dw_eq.Retrieve(st_p.cod_vigencia,'%',t1.p1.dw_mcpo.GetItemString(t1.p1.dw_mcpo.GetRow(),'codtotal'))
	for i = 1 to dw_eq.RowCount()
		filas = dw_scpo.Find("codtotal='"+dw_eq.GetItemString(i,'codtotal')+"'",1,dw_scpo.RowCount())
		if filas > 0 then CONTINUE
		valor = dw_scpo.Describe("Evaluate('max(sitem)',0)")
		filas = dw_scpo.InsertRow(0)
		dw_scpo.SetItem(filas,'coddoc',t1.p1.dw_mcpo.GetItemString(t1.p1.dw_mcpo.GetRow(),'coddoc'))
		dw_scpo.SetItem(filas,'clugar',t1.p1.dw_mcpo.GetItemString(t1.p1.dw_mcpo.GetRow(),'clugar'))
		dw_scpo.SetItem(filas,'numdoc',t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'numdoc'))
		dw_scpo.SetItem(filas,'item',t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'item'))
		dw_scpo.SetItem(filas,'sitem',long(valor) + 1)
		dw_scpo.SetItem(filas,'cod_vigencia',dw_eq.GetItemNumber(i,'cod_vigencia'))
		dw_scpo.SetItem(filas,'codtotal',dw_eq.GetItemString(i,'codtotal'))
		dw_scpo.SetItem(filas,'monto_gasto',dw_eq.GetItemNumber(i,'monto_gasto'))
		dw_scpo.SetItem(filas,'monto_ejecutado',dw_eq.GetItemNumber(i,'monto_ejecutado'))
		dw_scpo.SetItem(filas,'descrip',dw_eq.GetItemString(i,'descrip_ingreso'))
	next

end if


end event

type st_8 from statictext within p2
integer x = 466
integer y = 460
integer width = 430
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_10 from statictext within p2
integer x = 114
integer y = 464
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Monto rubro"
boolean focusrectangle = false
end type

type st_9 from statictext within p2
integer x = 37
integer y = 4
integer width = 1422
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_scpo from datawindow within p2
integer x = 23
integer y = 60
integer width = 4155
integer height = 616
integer taborder = 30
string title = "none"
string dataobject = "dw_pre_doc_scp_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;long i
dec valor,valor1

if acceptText() = -1 then Return -1
if this.GetColumnName() = 'n_monto' then
	valor=round((GetItemNumber(GetRow(),'n_monto') - GetItemNumber(GetRow(),'monto_ant')),i_dec_pre)
	if i_dec_pre=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	valor1=round(dec(data),i_dec_pre)
	if i_dec_pre=0 then
		valor1=long(valor1/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor1 -long(valor1/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	
	accepttext()
	SetItem(GetRow(),'monto',valor)
	SetItem(GetRow(),'n_monto',valor1)
	return 2
end if

end event

event dberror;Rollback;
Return 0

end event

event retrieveend;long i
for i = 1 to RowCount()
	SetItem(i,'coddoc',st_p.coddoc)
	SetItem(i,'numdoc',dw_modcab.GetItemNumber(dw_modcab.GetRow(),'numdoc'))
	SetItem(i,'item',t1.p1.dw_mcpo.GetItemNumber(t1.p1.dw_mcpo.GetRow(),'item'))
//	SetItemStatus(i,'monto',Primary!,DataModified!)
	SetItemStatus(i,0,Primary!,NewModified!)
next

end event

type p3 from userobject within t1
integer x = 18
integer y = 112
integer width = 4238
integer height = 808
long backcolor = 67108864
string text = "Terceros"
long tabtextcolor = 33554432
string picturename = "paciente.ico"
long picturemaskcolor = 536870912
dw_ter dw_ter
end type

on p3.create
this.dw_ter=create dw_ter
this.Control[]={this.dw_ter}
end on

on p3.destroy
destroy(this.dw_ter)
end on

type dw_ter from datawindow within p3
integer x = 73
integer y = 52
integer width = 4119
integer height = 732
integer taborder = 20
string title = "none"
string dataobject = "dw_pre_doc_ter"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;dec valor

setitem(row,'Monto_org',getitemnumber(row,'monto'))
valor=round(dec(data),i_dec_pre)
if i_dec_pre=0 then
	valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
end if
setitem(row,'Monto',valor)
return 2

end event

type dw_modcab from datawindow within w_modifica
event borrarnuevo ( )
integer x = 46
integer y = 76
integer width = 3282
integer height = 508
integer taborder = 10
string title = "none"
string dataobject = "dw_histo_docs_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event borrarnuevo();if nuevo > 0 then
	DeleteRow(nuevo)
	nuevo = 0
	PostEvent(RowFocuschanged!)
end if

end event

event rowfocuschanged;t1.p1.dw_mcpo.Reset()
if this.RowCount() = 0 or currentRow = 0 then Return
long fx
fx = st_p.dw_obj.GetRow()
fx= st_p.dw_obj.GetItemNumber(fx,'item')
t1.p1.dw_mcpo.Retrieve(this.GetItemString(this.GetRow(),'coddoc'),this.GetItemString(this.GetRow(),'cLugar'),this.GetItemNumber(this.GetRow(),'numdoc'),fx)

end event

event rowfocuschanging;if currentRow = nuevo and nuevo > 0 then 
	if messageBox('Aviso','El documento de Modificación nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	end if
	postEvent('borrarnuevo')
	Return -1
end if

end event

event constructor;SetTransObject(SQLCA)

end event

event dberror;Rollback;
Return 0

end event

