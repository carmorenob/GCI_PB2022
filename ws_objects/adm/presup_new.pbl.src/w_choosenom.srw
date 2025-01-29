$PBExportHeader$w_choosenom.srw
forward
global type w_choosenom from window
end type
type st_2 from statictext within w_choosenom
end type
type pb_1 from picturebutton within w_choosenom
end type
type pb_cancelar from picturebutton within w_choosenom
end type
type st_1 from statictext within w_choosenom
end type
type dw_n from datawindow within w_choosenom
end type
type dw_it from datawindow within w_choosenom
end type
end forward

global type w_choosenom from window
integer width = 4256
integer height = 1632
boolean titlebar = true
string title = "Selección Nómina"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
pb_1 pb_1
pb_cancelar pb_cancelar
st_1 st_1
dw_n dw_n
dw_it dw_it
end type
global w_choosenom w_choosenom

type variables
st_interfaz st

end variables

forward prototypes
public function integer addfuente (string codtotal, integer item, decimal monto)
public function integer addrubro (string codtotal, decimal p_monto)
end prototypes

public function integer addfuente (string codtotal, integer item, decimal monto);string valor, descripcion
long  fila
dec monto_ant,plan_ini,planeado_actual,acum_adic,acum_trasl,acum_recor,acum_dispo,acum_mod_dispo,acum_reser,acum_mod_reser,acum_giro,acum_recon,acum_recau

fila = st.dw_fte.Find("codtotal='"+codtotal+"'",1,st.dw_fte.RowCount())
if fila > 0 then
	monto_ant = st.dw_fte.GetItemNumber(fila,'monto')
end if

SELECT pre_plan.CodTotal, pre_plan.descrip, pre_plan.planeado_inicial, v_pre_suma_acum.acum_traslado, v_pre_suma_acum.acum_adicion, v_pre_suma_acum.acum_recorte, v_pre_suma_acum.acum_dispon, v_pre_suma_acum.acum_mod_dispo, v_pre_suma_acum.acum_reserva, v_pre_suma_acum.acum_mod_reserv, v_pre_suma_acum.acum_girado, v_pre_suma_acum.acum_recon, v_pre_suma_acum.acum_recaudo
into :valor, :descripcion, :plan_ini ,:acum_trasl,:acum_adic,:acum_recor,:acum_dispo,:acum_mod_dispo,:acum_reser,:acum_mod_reser,:acum_giro,:acum_giro,:acum_recau
FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
WHERE (((pre_plan.CodTotal)=:codtotal) AND ((pre_plan.cod_vigencia)=:st.cod_vigencia) AND ((pre_plan.tipo)='0') AND ((pre_plan.movimiento)='1'));

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

planeado_actual = plan_ini+acum_trasl+acum_adic+acum_recor -(acum_dispo+acum_mod_dispo)
if planeado_actual = 0 or planeado_actual < monto + monto_ant then 
	messagebox('Atención','Este rubro no tiene valor Planeado Actual o no es suficiente. codigo '+codtotal)
	return -1
end if

if fila = 0 then
	fila = st.dw_fte.InsertRow(0)
	valor = st.dw_fte.Describe("Evaluate('max(sitem)',0)")
	st.dw_fte.SetItem(fila,'coddoc',st.dw_cab.GetItemString(st.dw_cab.GetRow(),'coddoc'))
	st.dw_fte.SetItem(fila,'cLugar',st.dw_cab.GetItemString(st.dw_cab.GetRow(),'clugar'))
	st.dw_fte.SetItem(fila,'numdoc',st.dw_cab.GetItemNumber(st.dw_cab.GetRow(),'numdoc'))
	st.dw_fte.SetItem(fila,'item',item)
	st.dw_fte.SetItem(fila,'sitem',long(valor) + 1)
	st.dw_fte.SetItem(fila,'cod_vigencia',st.cod_vigencia)
	st.dw_fte.SetItem(fila,'codtotal',codtotal)
	st.dw_fte.SetItem(fila,'descrip',descripcion)
end if
st.dw_fte.SetItem(fila,'planeado_inicial',plan_ini)
st.dw_fte.SetItem(fila,'acum_traslado',acum_trasl)
st.dw_fte.SetItem(fila,'acum_adicion',acum_adic)
st.dw_fte.SetItem(fila,'acum_recorte',acum_recor)
st.dw_fte.SetItem(fila,'acum_dispon',acum_dispo)
st.dw_fte.SetItem(fila,'acum_mod_dispo',acum_mod_dispo)
st.dw_fte.SetItem(fila,'acum_reserva',acum_reser)
st.dw_fte.SetItem(fila,'acum_mod_reserv',acum_mod_reser)
st.dw_fte.SetItem(fila,'acum_girado',acum_giro)
st.dw_fte.SetItem(fila,'acum_recon',acum_recon)
st.dw_fte.SetItem(fila,'acum_recaudo',acum_recau)
st.dw_fte.setitem(fila,'monto',monto + monto_ant)
st.dw_fte.SetItem(fila,'estado','0')
st.dw_fte.ScrolltoRow(fila)

Return 0

end function

public function integer addrubro (string codtotal, decimal p_monto);string valor, descripcion
long  fila
dec monto_ant,plan_ini,planeado_actual,acum_adic,acum_trasl,acum_recor,acum_dispo,acum_mod_dispo,acum_reser,acum_mod_reser,acum_giro,acum_recon,acum_recau

fila = st.dw_obj.Find("codtotal='"+codtotal+"'",1,st.dw_obj.RowCount())
if fila > 0 then
	monto_ant = st.dw_obj.GetItemNumber(fila,'monto_vigente')
end if

SELECT pre_plan.CodTotal, pre_plan.descrip, pre_plan.planeado_inicial, v_pre_suma_acum.acum_traslado, v_pre_suma_acum.acum_adicion, v_pre_suma_acum.acum_recorte, v_pre_suma_acum.acum_dispon, v_pre_suma_acum.acum_mod_dispo, v_pre_suma_acum.acum_reserva, v_pre_suma_acum.acum_mod_reserv, v_pre_suma_acum.acum_girado, v_pre_suma_acum.acum_recon, v_pre_suma_acum.acum_recaudo
into :valor, :descripcion, :plan_ini ,:acum_trasl,:acum_adic,:acum_recor,:acum_dispo,:acum_mod_dispo,:acum_reser,:acum_mod_reser,:acum_giro,:acum_giro,:acum_recau
FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
WHERE (((pre_plan.CodTotal)=:codtotal) AND ((pre_plan.cod_vigencia)=:st.cod_vigencia) AND ((pre_plan.tipo)='1') AND ((pre_plan.movimiento)='1'));

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

planeado_actual = plan_ini+acum_trasl+acum_adic+acum_recor
if planeado_actual = 0 or planeado_actual < p_monto + monto_ant then 
	messagebox('Atención','Este rubro no tiene valor Planeado Actual o no es suficiente. codigo '+codtotal)
	return -1
end if

if fila = 0 then
	fila = st.dw_obj.InsertRow(0)
	valor = st.dw_obj.Describe("Evaluate('max(item)',0)")
	st.dw_obj.SetItem(fila,'coddoc',st.dw_cab.GetItemString(st.dw_cab.GetRow(),'coddoc'))
	st.dw_obj.SetItem(fila,'cLugar',st.dw_cab.GetItemString(st.dw_cab.GetRow(),'clugar'))
	st.dw_obj.SetItem(fila,'numdoc',st.dw_cab.GetItemNumber(st.dw_cab.GetRow(),'numdoc'))
	st.dw_obj.SetItem(fila,'item',long(valor) + 1)
	st.dw_obj.SetItem(fila,'cod_vigencia',st.cod_vigencia)
	st.dw_obj.SetItem(fila,'codtotal',codtotal)
	st.dw_obj.SetItem(fila,'descrip',descripcion)
end if
st.dw_obj.SetItem(fila,'planeado_inicial',plan_ini)
st.dw_obj.SetItem(fila,'acum_traslado',acum_trasl)
st.dw_obj.SetItem(fila,'acum_adicion',acum_adic)
st.dw_obj.SetItem(fila,'acum_recorte',acum_recor)
st.dw_obj.SetItem(fila,'acum_dispon',acum_dispo)
st.dw_obj.SetItem(fila,'acum_mod_dispo',acum_mod_dispo)
st.dw_obj.SetItem(fila,'acum_reserva',acum_reser)
st.dw_obj.SetItem(fila,'acum_mod_reserv',acum_mod_reser)
st.dw_obj.SetItem(fila,'acum_girado',acum_giro)
st.dw_obj.SetItem(fila,'acum_recon',acum_recon)
st.dw_obj.SetItem(fila,'acum_recaudo',acum_recau)
st.dw_obj.SetItem(fila,'monto',p_monto + monto_ant)
st.dw_obj.SetItem(fila,'monto_vigente',p_monto + monto_ant)
st.dw_obj.SetItem(fila,'estado','0')
st.dw_obj.ScrolltoRow(fila)

st.dw_obj.TriggerEvent(rowfocuschanged!)
Return st.dw_obj.GetItemNumber(fila,'item')

end function

on w_choosenom.create
this.st_2=create st_2
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.st_1=create st_1
this.dw_n=create dw_n
this.dw_it=create dw_it
this.Control[]={this.st_2,&
this.pb_1,&
this.pb_cancelar,&
this.st_1,&
this.dw_n,&
this.dw_it}
end on

on w_choosenom.destroy
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.pb_cancelar)
destroy(this.st_1)
destroy(this.dw_n)
destroy(this.dw_it)
end on

event open;st = Message.PowerObjectParm
dw_n.Retrieve()

end event

type st_2 from statictext within w_choosenom
integer x = 14
integer y = 568
integer width = 443
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Conceptos a Pagar:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_choosenom
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 2025
integer y = 1404
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
string text = "                $a"
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;long  f, item, fit, nom,j
string td,doc
f = dw_n.Find("selec=1 or selec=2",1,dw_n.RowCount())
if f=0 then return
do while st.dw_it.rowcount()>0
	st.dw_it.deleterow(0)
loop
do while st.dw_obj.rowcount()>0
	st.dw_obj.deleterow(0)
loop
st.dw_fte.setfilter('')
st.dw_fte.filter()
do while st.dw_fte.rowcount()>0
	st.dw_fte.deleterow(0)
loop
do while f > 0
	dw_n.SetRow(f)
	nom = dw_n.GetItemNumber(f,'num_nomina')
	for j=1 to dw_it.rowcount()
		if dw_it.getitemnumber(j,'esco')=0 then continue
		
		item = addrubro(dw_it.GetItemString(j,'codtotal_gasto'),dw_it.GetItemNumber(j,'pagado'))
		if item > 0 then
			if addfuente(dw_it.GetItemString(j,'codtotal_ingre'),item,dw_it.GetItemNumber(j,'pagado')) = -1 then Return -1
		else
			Return -1
		end if
		td = dw_it.getitemstring(j,'tipodoc_ter')
		doc = dw_it.getitemstring(j,'documento_ter')
		if not isNull(doc) then
			fit = st.dw_it.find('num_orig1='+string(nom)+' and char_orig1="'+dw_it.getitemstring(j,'cod_concep')+'" and char_orig2="'+dw_it.getitemstring(j,'tipo_cargo')+'" and char_orig3="'+td+'" and char_doc3="'+doc+'" and num_doc2='+string(item)+" and char_doc4='"+dw_it.getitemstring(j,'permanente')+"'",1,st.dw_it.rowcount())
		else
			fit = st.dw_it.find('num_orig1='+string(nom)+' and char_orig1="'+dw_it.getitemstring(j,'cod_concep')+'" and char_orig2="'+dw_it.getitemstring(j,'tipo_cargo')+'" and num_doc2='+string(item)+" and char_doc4='"+dw_it.getitemstring(j,'permanente')+"'",1,st.dw_it.rowcount())
		end if
		if fit=0 then fit = st.dw_it.insertrow(0)
		st.dw_it.SetItem(fit,'codigo','PDINMPR')
		st.dw_it.SetItem(fit,'num_orig1',nom)
		st.dw_it.SetItem(fit,'char_orig1',dw_it.getitemstring(j,'cod_concep'))
		st.dw_it.SetItem(fit,'char_orig2',dw_it.getitemstring(j,'tipo_cargo'))
		st.dw_it.SetItem(fit,'char_orig3',dw_it.getitemstring(j,'tipodoc_ter'))
		st.dw_it.SetItem(fit,'char_doc3',dw_it.getitemstring(j,'documento_ter'))
		st.dw_it.SetItem(fit,'char_doc4',dw_it.getitemstring(j,'permanente'))		
		
		st.dw_it.setItem(fit,'char_doc1',st.dw_cab.GetItemString(st.dw_cab.Getrow(),'coddoc'))
		st.dw_it.setItem(fit,'char_doc2',st.dw_cab.GetItemString(st.dw_cab.Getrow(),'clugar'))
		st.dw_it.setItem(fit,'num_doc1',st.dw_cab.GetItemNumber(st.dw_cab.Getrow(),'numdoc'))
		st.dw_it.setItem(fit,'valor',st.dw_it.getitemnumber(fit,'valor')+dw_it.GetItemNumber(j,'pagado'))
		st.dw_it.setItem(fit,'num_doc2',item)
	next
	dw_n.SetItem(f,"selec",0)
	f = dw_n.Find("selec=1 or selec=2",1,dw_n.RowCount())
loop
closewithreturn(parent,'ok')

end event

type pb_cancelar from picturebutton within w_choosenom
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 2190
integer y = 1404
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                &c"
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;
Close(parent)
end event

type st_1 from statictext within w_choosenom
integer x = 14
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nóminas:"
boolean focusrectangle = false
end type

type dw_n from datawindow within w_choosenom
integer x = 14
integer y = 56
integer width = 3031
integer height = 500
integer taborder = 10
string title = "none"
string dataobject = "dw_nomcab_it"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_it.retrieve(GetItemNumber(getRow(),'ano'))
if rowcount()=0 then 
	dw_it.setfilter('isnull(nomina)')
else
	dw_it.setfilter('num_nomina='+string(GetItemNumber(getRow(),'num_nomina')))
end if
dw_it.filter()

end event

event itemchanged;if data='2' then data='1'
long j
for j=1 to dw_it.rowcount()
	dw_it.setitem(j,'esco',long(data))
next
dw_it.post event p_changed()
end event

type dw_it from datawindow within w_choosenom
event p_changed ( )
integer x = 9
integer y = 628
integer width = 4155
integer height = 744
integer taborder = 10
string title = "none"
string dataobject = "dw_it_nom_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_changed();accepttext()
long selec
if rowcount()=0 then return
selec=long(describe("evaluate('sum(esco)',0)"))
if selec=0 then
	dw_n.setitem(dw_n.getrow(),'selec',0)
elseif selec<rowcount() then
	dw_n.setitem(dw_n.getrow(),'selec',2)
else
	dw_n.setitem(dw_n.getrow(),'selec',1)
end if
dw_n.setitem(dw_n.getrow(),'bajar',getitemnumber(1,'total'))
end event

event constructor;setTransObject(SQLCA)

end event

event itemchanged;string concep
long i

if row < 1 then Return 0
concep = GetItemString(row,'cod_concep')
if data = '1' then
	for i = 1 to RowCount()
		if GetItemString(i,'cod_concep') = concep then
			SetItem(i,'esco',1)
		end if
	next
end if
post event p_changed()

end event

