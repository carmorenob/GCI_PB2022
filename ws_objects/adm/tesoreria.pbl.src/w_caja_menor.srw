$PBExportHeader$w_caja_menor.srw
forward
global type w_caja_menor from window
end type
type pb_save from picturebutton within w_caja_menor
end type
type pb_del from picturebutton within w_caja_menor
end type
type pb_new from picturebutton within w_caja_menor
end type
type st_2 from statictext within w_caja_menor
end type
type st_1 from statictext within w_caja_menor
end type
type tab_1 from tab within w_caja_menor
end type
type tp_1 from userobject within tab_1
end type
type pb_del_rub from picturebutton within tp_1
end type
type st_3 from statictext within tp_1
end type
type dw_sle from datawindow within tp_1
end type
type dw_montos from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_del_rub pb_del_rub
st_3 st_3
dw_sle dw_sle
dw_montos dw_montos
end type
type tp_2 from userobject within tab_1
end type
type pb_del_abre from picturebutton within tp_2
end type
type pb_save_abre from picturebutton within tp_2
end type
type pb_abre from picturebutton within tp_2
end type
type st_4 from statictext within tp_2
end type
type dw_intf from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_del_abre pb_del_abre
pb_save_abre pb_save_abre
pb_abre pb_abre
st_4 st_4
dw_intf dw_intf
end type
type tab_1 from tab within w_caja_menor
tp_1 tp_1
tp_2 tp_2
end type
type dw_cajas from datawindow within w_caja_menor
end type
type dw_deta from datawindow within w_caja_menor
end type
type dw_lugar from datawindow within w_caja_menor
end type
end forward

global type w_caja_menor from window
string tag = "Modificó una caja menor, desea guardar los cambios?"
integer width = 3918
integer height = 1968
boolean titlebar = true
string title = "Caja Menor"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_mvtocm.ico"
pb_save pb_save
pb_del pb_del
pb_new pb_new
st_2 st_2
st_1 st_1
tab_1 tab_1
dw_cajas dw_cajas
dw_deta dw_deta
dw_lugar dw_lugar
end type
global w_caja_menor w_caja_menor

type variables
boolean i_cambio,i_nuevo,i_ppto=false
long i_vigencia
end variables

forward prototypes
public subroutine reset_dws ()
public function integer f_pregunta ()
public function integer grabar ()
end prototypes

public subroutine reset_dws ();dw_cajas.reset()
dw_deta.reset()
tab_1.tp_1.dw_montos.reset()
tab_1.tp_2.dw_intf.reset()
end subroutine

public function integer f_pregunta ();if dw_deta.accepttext()=-1 then return 3
if not i_cambio then return 2
return messagebox("Atención, realizó cambios",tag,question!,yesnocancel!,3)
end function

public function integer grabar ();if dw_deta.accepttext()=-1 then return -1
if tab_1.tp_1.dw_montos.accepttext()=-1 then return -1
if (not i_cambio) and (not i_nuevo) then return 1
long j
if tab_1.tp_1.dw_montos.rowcount()=0 and i_ppto then
	messagebox('Atención','No ha definido los rubros de la caja, debe definirlos primero para continuar')
	return -1
end if
if (tab_1.tp_1.dw_montos.getitemnumber(1,'sum_monto_anual')<>dw_deta.getitemnumber(1,'monto_anual'))  and i_ppto  then
	messagebox('Atención','La suma Anual de los montos es diferente al indicado para la Caja')
	return -1
end if
if tab_1.tp_1.dw_montos.getitemnumber(1,'sum_monto_base')<>dw_deta.getitemnumber(1,'base_mes')  and i_ppto  then
	messagebox('Atención','La suma de los montos Base es diferente al indicado para la Caja')
	return -1
end if
if dw_deta.update(true,false)=-1 then return -1
if tab_1.tp_1.dw_montos.update(true,false)=-1 then return -1
commit;
dw_deta.resetupdate()
tab_1.tp_1.dw_montos.resetupdate()
if i_nuevo then
	string caja
	i_nuevo=false
	i_cambio=false
	caja=dw_deta.getitemstring(1,'codcaja')
	reset_dws()
	dw_cajas.retrieve(dw_lugar.getitemstring(1,1))
	dw_cajas.scrolltorow(dw_cajas.find("codcaja='"+caja+"'",1,dw_cajas.rowcount()))
end if
i_nuevo=false
i_cambio=false
return 1
end function

on w_caja_menor.create
this.pb_save=create pb_save
this.pb_del=create pb_del
this.pb_new=create pb_new
this.st_2=create st_2
this.st_1=create st_1
this.tab_1=create tab_1
this.dw_cajas=create dw_cajas
this.dw_deta=create dw_deta
this.dw_lugar=create dw_lugar
this.Control[]={this.pb_save,&
this.pb_del,&
this.pb_new,&
this.st_2,&
this.st_1,&
this.tab_1,&
this.dw_cajas,&
this.dw_deta,&
this.dw_lugar}
end on

on w_caja_menor.destroy
destroy(this.pb_save)
destroy(this.pb_del)
destroy(this.pb_new)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.tab_1)
destroy(this.dw_cajas)
destroy(this.dw_deta)
destroy(this.dw_lugar)
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

type pb_save from picturebutton within w_caja_menor
integer x = 1669
integer y = 48
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;grabar()
end event

type pb_del from picturebutton within w_caja_menor
integer x = 1513
integer y = 48
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Caja Menor"
end type

type pb_new from picturebutton within w_caja_menor
integer x = 1362
integer y = 48
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nueva Caja menor"
end type

event clicked;string clug
int caja

setnull(caja)
tab_1.tp_1.enabled=true
tab_1.tp_2.enabled=true
reset_dws()
dw_deta.insertrow(1)
dw_deta.setitem(1,'clugar',dw_lugar.getitemstring(1,1))

clug=dw_lugar.getitemstring(1,1)
if g_motor='postgres' then
	SELECT Max(tesocajamenor.codcaja)::int into :caja
	FROM tesocajamenor
	GROUP BY tesocajamenor.CLugar
	HAVING tesocajamenor.CLugar=:clug;
	
else
	SELECT convert(int,Max(tesocajamenor.codcaja)) into :caja
	FROM tesocajamenor
	GROUP BY tesocajamenor.CLugar
	HAVING tesocajamenor.CLugar=:clug;
end if
if isnull(caja) then caja=0
caja++
if caja<10 then 
	clug='0'+string(caja) 
else 
	clug=string(caja) 
end if

dw_deta.setitem(1,'codcaja',clug)
i_nuevo=true
i_cambio=true
enabled=false
end event

type st_2 from statictext within w_caja_menor
integer x = 1934
integer y = 28
integer width = 411
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de la Caja:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_caja_menor
integer x = 32
integer y = 160
integer width = 366
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cajas del Lugar:"
boolean focusrectangle = false
end type

type tab_1 from tab within w_caja_menor
integer x = 32
integer y = 696
integer width = 3611
integer height = 1092
integer taborder = 40
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
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3575
integer height = 964
long backcolor = 67108864
string text = "Rubros"
long tabtextcolor = 33554432
string picturename = "rec_caja.ico"
long picturemaskcolor = 536870912
string powertiptext = "Detalle de los Rubros Presupuestales"
pb_del_rub pb_del_rub
st_3 st_3
dw_sle dw_sle
dw_montos dw_montos
end type

on tp_1.create
this.pb_del_rub=create pb_del_rub
this.st_3=create st_3
this.dw_sle=create dw_sle
this.dw_montos=create dw_montos
this.Control[]={this.pb_del_rub,&
this.st_3,&
this.dw_sle,&
this.dw_montos}
end on

on tp_1.destroy
destroy(this.pb_del_rub)
destroy(this.st_3)
destroy(this.dw_sle)
destroy(this.dw_montos)
end on

type pb_del_rub from picturebutton within tp_1
integer x = 562
integer y = 16
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Rubro"
end type

event clicked;if dw_montos.rowcount()=0 then return
if dw_montos.getitemnumber(dw_montos.getrow(),'consumido')>0 then
	messagebox('Atención','A este rubro ya se le han cargado gastos, no lo puede borrar')
	return
end if
if dw_montos.getitemnumber(dw_montos.getrow(),'monto')>0 then
	messagebox('Atención','A este rubro ya se le han cargado montos en la apertura, no lo puede borrar')
	return
end if
dw_montos.deleterow(0)
i_cambio=true
end event

type st_3 from statictext within tp_1
integer x = 23
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

type dw_sle from datawindow within tp_1
event teclea pbm_dwnkey
integer x = 18
integer y = 52
integer width = 544
integer height = 92
integer taborder = 31
string title = "none"
string dataobject = "dw_slecta"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event teclea;if dw_deta.RowCount() = 0 or isnull(i_vigencia) then Return
if dw_deta.getitemstring(1,'activa')<>'1' then return
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

st_parm.filtro = "(lower(codtotal) like '" + lower(este) + "%') and (tipo='1' and movimiento='1')"
st_parm.dw_sle = dw_sle
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

event getfocus;if isValid(w_buscactapre) then 	w_buscactapre.st_parm.dw_sle=this

end event

event itemchanged;if dw_deta.RowCount() = 0 then Return
if dw_deta.getitemstring(1,'activa')<>'1' then return
string codtotal, descripcion, texto , valor
long  fila, filas, i, fr
dec plan_ini,planeado_actual,acum_adic,acum_trasl,acum_recor,acum_dispo,acum_mod_dispo,acum_reser,acum_mod_reser,acum_giro,acum_recon,acum_recau
if isnull(i_vigencia) then 
	messagebox('Atención','Debe elegir una vigencia')
	return
end if
AcceptText()
texto = GetItemString(1,1)
if texto = '' then Return
SELECT pre_plan.CodTotal, pre_plan.descrip, pre_plan.planeado_inicial, v_pre_suma_acum.acum_traslado, v_pre_suma_acum.acum_adicion, v_pre_suma_acum.acum_recorte, v_pre_suma_acum.acum_dispon, v_pre_suma_acum.acum_mod_dispo, v_pre_suma_acum.acum_reserva, v_pre_suma_acum.acum_mod_reserv, v_pre_suma_acum.acum_girado, v_pre_suma_acum.acum_recon, v_pre_suma_acum.acum_recaudo
into :codTotal, :descripcion, :plan_ini ,:acum_trasl,:acum_adic,:acum_recor,:acum_dispo,:acum_mod_dispo,:acum_reser,:acum_mod_reser,:acum_giro,:acum_giro,:acum_recau
FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
WHERE (((pre_plan.CodTotal)=:Texto) AND ((pre_plan.cod_vigencia)=:i_vigencia) AND ((pre_plan.tipo)='1') AND ((pre_plan.movimiento)='1'));

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

planeado_actual=plan_ini+acum_trasl+acum_adic+acum_recor
if planeado_actual=0  then 
	messagebox('Atención','Este rubro no tiene valor Planeado Actual')
	return
end if
fila = dw_montos.Find("codtotal_presu='" + codtotal+"'",1,dw_montos.RowCount())
if fila = 0 then
	fila = dw_montos.InsertRow(0)
	dw_montos.SetItem(fila,'codcaja',dw_deta.getitemstring(1,'codcaja'))
	dw_montos.SetItem(fila,'cLugar',dw_lugar.getitemstring(1,1))
	dw_montos.SetItem(fila,'codtotal_presu',codtotal)
	dw_montos.SetItem(fila,'cod_vigencia',i_vigencia)
	dw_montos.SetItem(fila,'descrip',descripcion)
	dw_montos.ScrolltoRow(fila)
	i_cambio=true
end if

end event

type dw_montos from datawindow within tp_1
integer x = 14
integer y = 156
integer width = 3520
integer height = 704
integer taborder = 50
string title = "none"
string dataobject = "dw_montos_cmenor"
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

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3575
integer height = 964
long backcolor = 67108864
string text = "Apertura"
long tabtextcolor = 33554432
string picturename = "oofl.ico"
long picturemaskcolor = 536870912
string powertiptext = "Apertura de la Caja Menor desde Reserva"
pb_del_abre pb_del_abre
pb_save_abre pb_save_abre
pb_abre pb_abre
st_4 st_4
dw_intf dw_intf
end type

on tp_2.create
this.pb_del_abre=create pb_del_abre
this.pb_save_abre=create pb_save_abre
this.pb_abre=create pb_abre
this.st_4=create st_4
this.dw_intf=create dw_intf
this.Control[]={this.pb_del_abre,&
this.pb_save_abre,&
this.pb_abre,&
this.st_4,&
this.dw_intf}
end on

on tp_2.destroy
destroy(this.pb_del_abre)
destroy(this.pb_save_abre)
destroy(this.pb_abre)
destroy(this.st_4)
destroy(this.dw_intf)
end on

type pb_del_abre from picturebutton within tp_2
integer x = 1070
integer y = 12
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Anular Apertura"
end type

event clicked;if dw_intf.rowcount()=0 then return
if pb_save_abre.enabled then
	dw_intf.reset()
else
	long j,donde,npago
	string clug_pago,cdoc_pago,err
	if tab_1.tp_1.dw_montos.find('consumido>0',1,tab_1.tp_1.dw_montos.rowcount())>0 then
		messagebox('Atención','Ya se han realizado gastos en la caja menor, no se puede anular la apertura')
		return
	end if
	for j=1 to dw_intf.rowcount()
		donde=tab_1.tp_1.dw_montos.find("cod_vigencia="+string(dw_intf.getitemnumber(j,'cod_vigencia'))+" and codtotal_presu='"+dw_intf.getitemstring(j,'codtotal')+"'",1,tab_1.tp_1.dw_montos.rowcount())
		if donde=0 then
			messagebox('Atención','No se puede hallar un rubro de la apertura en los rubros de la caja')
		end if
		tab_1.tp_1.dw_montos.setitem(donde,'monto',0)
		clug_pago=dw_intf.getitemstring(j,'char_orig2')
		cdoc_pago=dw_intf.getitemstring(j,'char_orig1')
		npago=dw_intf.getitemNumber(j,'num_orig1')
		update tesotranscab set en_destino='0' 
		where clugar =:clug_pago and coddoc=:cdoc_pago and ntransferencia=:npago;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando Tesotranscab',err)
			return
		end if
	next
	do while dw_intf.rowcount()>0
		dw_intf.deleterow(0)
	loop
	if dw_intf.update(true,false)=-1 then return
	if tab_1.tp_1.dw_montos.update(true,false)=-1 then return
	dw_deta.setitem(1,'efectivo',0)
	if dw_deta.update(true,false)=-1 then return
	commit;
	dw_intf.resetupdate()
	tab_1.tp_1.dw_montos.resetupdate()
	dw_deta.resetupdate()
end if
end event

type pb_save_abre from picturebutton within tp_2
integer x = 901
integer y = 12
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Apertura de Caja"
end type

event clicked;if i_nuevo or i_cambio then
	messagebox('Atención','Debe guardar los cambios primero')
	return
end if
long j,item,donde,npago,montos_sin_reserva
string caja,lug,clug_pag,cdoc_pag,err
caja=dw_cajas.getitemstring(dw_cajas.getrow(),'codcaja')
lug=dw_lugar.getitemstring(1,1)
select max(item) into :item from mod_relacion_origen
where codigo = 'APCMPT-';
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error leyendo mod_relacion_origen',err)
	return
end if
if isNull(item) then item = 0
for j = 1 to dw_intf.RowCount()
	if isNull(dw_intf.GetItemNumber(j,'item')) then
		item = item + 1
		dw_intf.SetItem(j,'item',item)
	end if
	dw_intf.setitem(j,'char_doc1',caja)
	dw_intf.setitem(j,'char_doc2',lug)
	if i_ppto then 
		dw_intf.setitem(j,'num_doc1',dw_intf.getitemnumber(j,'cod_vigencia'))
		dw_intf.setitem(j,'char_doc3',dw_intf.getitemstring(j,'codtotal'))
		donde=tab_1.tp_1.dw_montos.find("cod_vigencia="+string(dw_intf.getitemnumber(j,'cod_vigencia'))+" and codtotal_presu='"+dw_intf.getitemstring(j,'codtotal')+"'",1,tab_1.tp_1.dw_montos.rowcount())
		if donde=0 then
			messagebox('Atención','Un rubro de la reserva no se encuentra relacionado en los Rubros configurados para la caja')
			return
		end if
		if tab_1.tp_1.dw_montos.getitemnumber(donde,'monto_base')<dw_intf.getitemnumber(j,'valor') then
			messagebox('Atención','Un monto base de la caja es menor al valor dado en la reserva')
			return
		end if

		long montos_j
		montos_j=round(tab_1.tp_1.dw_montos.getitemnumber(donde,'monto'),2)
		if isnull(montos_j) then montos_j=0
		tab_1.tp_1.dw_montos.setitem(donde,'monto',montos_j+round(dw_intf.getitemnumber(j,'valor'),2))
	else
		montos_sin_reserva+=round(dw_intf.getitemnumber(j,'valor'),2)
	end if
next
if i_ppto  and tab_1.tp_1.dw_montos.getitemnumber(1,'sum_monto')>tab_1.tp_1.dw_montos.getitemnumber(1,'sum_monto_base') then
	messagebox('Atención','La suma de los montos de la reserva son mayores a los montos base')
	return
end if
for j=1 to dw_intf.rowcount()
	npago=dw_intf.getitemnumber(j,'num_orig1')
	clug_pag=dw_intf.getitemstring(j,'char_orig2')
	cdoc_pag=dw_intf.getitemstring(j,'char_orig1')
	update tesotranscab set en_destino='1' 
	where clugar =:clug_pag and coddoc=:cdoc_pag and ntransferencia=:npago;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando Tesotranscab',err)
		return
	end if
next
if dw_intf.update(true,false)=-1 then return

if i_ppto  then 
	if tab_1.tp_1.dw_montos.update(true,false)=-1 then return
	dw_deta.setitem(1,'efectivo',tab_1.tp_1.dw_montos.getitemnumber(1,'sum_monto_base'))
else
	dw_deta.setitem(1,'efectivo',montos_sin_reserva)
end if
if dw_deta.update(true,false)=-1 then return
commit;

dw_intf.resetupdate()
tab_1.tp_1.dw_montos.resetupdate()
dw_deta.resetupdate()
enabled=false
end event

type pb_abre from picturebutton within tp_2
integer x = 745
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
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Traer Reservas para Apertura"
end type

event clicked;if dw_intf.rowcount()>0 then return
st_caja_menor  st_abre
st_abre.caja=dw_deta.getitemstring(1,'codcaja')
st_abre.dw_intf=dw_intf
st_abre.ppto=i_ppto
st_abre.clug=dw_lugar.getitemstring(1,1)
//openwithparm(w_abre_cmen,dw_intf)
openwithparm(w_abre_cmen,st_abre)
if dw_intf.rowcount()>0 then pb_save_abre.enabled=true
end event

type st_4 from statictext within tp_2
integer x = 14
integer y = 84
integer width = 736
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenes de Pago de la Apertura:"
boolean focusrectangle = false
end type

type dw_intf from datawindow within tp_2
integer x = 37
integer y = 160
integer width = 3214
integer height = 692
integer taborder = 41
string title = "none"
string dataobject = "dw_flujo_cajame"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type dw_cajas from datawindow within w_caja_menor
integer x = 32
integer y = 216
integer width = 1833
integer height = 436
integer taborder = 30
string title = "none"
string dataobject = "dw_histo_cmenor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
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
	case 3//cancelar
		return 1
end choose
return 0
end event

event rowfocuschanged;if getrow()<1 then return
dw_deta.retrieve(dw_lugar.getitemstring(1,1),getitemstring(getrow(),'codcaja'))
if i_ppto then 
	tab_1.tp_2.dw_intf.dataobject='dw_flujo_cajame'
	tab_1.tp_2.dw_intf.settransobject(sqlca)
	tab_1.tp_1.dw_montos.retrieve(dw_lugar.getitemstring(1,1),getitemstring(getrow(),'codcaja'))
	tab_1.tp_2.dw_intf.retrieve('APCMPT-',getitemstring(getrow(),'codcaja'),dw_lugar.getitemstring(1,1))
else
	tab_1.tp_2.dw_intf.dataobject='dw_flujo_cajame_sin_reserva'
	tab_1.tp_2.dw_intf.settransobject(sqlca)
	tab_1.tp_2.dw_intf.retrieve('APCMPT-',getitemstring(getrow(),'codcaja'),dw_lugar.getitemstring(1,1))
end if
dw_deta.triggerevent(retrieveend!)
end event

type dw_deta from datawindow within w_caja_menor
integer x = 1920
integer y = 80
integer width = 1847
integer height = 572
integer taborder = 20
string title = "none"
string dataobject = "dw_deta_cajame"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

event itemchanged;choose case dwo.name
	case 'presupuesto'
		if data='1' then
			tab_1.tp_1.enabled=true
			tab_1.tp_2.enabled=true
			i_ppto=true
		else
			tab_1.tp_1.enabled=false
			tab_1.tp_2.enabled=true
			i_ppto=false
		end if
	case 'cod_vigencia'
		i_vigencia=long(data)
end choose
accepttext()
i_cambio=true

end event

event retrieveend;if rowcount=0 then return
if getitemstring(1,'presupuesto')='1' then
	i_vigencia=getitemnumber(1,'cod_vigencia')
	tab_1.tp_1.enabled=true
	tab_1.tp_2.enabled=true
	i_ppto=true
else
	setnull(i_vigencia)
	tab_1.tp_1.enabled=false
	tab_1.tp_2.enabled=true
	i_ppto=false
end if

end event

type dw_lugar from datawindow within w_caja_menor
integer x = 23
integer y = 24
integer width = 1275
integer height = 136
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string actual
actual=getitemstring(1,string(dwo.name))
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
accepttext()
reset_dws()
dw_cajas.retrieve(data)
end event

event constructor;settransobject(sqlca)
insertrow(1)
end event

