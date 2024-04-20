$PBExportHeader$w_movimiento_bancario.srw
forward
global type w_movimiento_bancario from w_center
end type
type dw_banco from datawindow within w_movimiento_bancario
end type
type dw_cuentas from datawindow within w_movimiento_bancario
end type
type st_3 from statictext within w_movimiento_bancario
end type
type dw_det_cuenta from datawindow within w_movimiento_bancario
end type
type tab_1 from tab within w_movimiento_bancario
end type
type tp_1 from userobject within tab_1
end type
type gb_3 from groupbox within tp_1
end type
type gb_2 from groupbox within tp_1
end type
type dw_det from datawindow within tp_1
end type
type dw_transacc from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
gb_3 gb_3
gb_2 gb_2
dw_det dw_det
dw_transacc dw_transacc
end type
type tp_3 from userobject within tab_1
end type
type pb_save_posf from picturebutton within tp_3
end type
type pb_cheq from picturebutton within tp_3
end type
type em_1 from editmask within tp_3
end type
type st_1 from statictext within tp_3
end type
type dw_cheq_posf from datawindow within tp_3
end type
type tp_3 from userobject within tab_1
pb_save_posf pb_save_posf
pb_cheq pb_cheq
em_1 em_1
st_1 st_1
dw_cheq_posf dw_cheq_posf
end type
type tp_2 from userobject within tab_1
end type
type pb_mod from picturebutton within tp_2
end type
type pb_edita from picturebutton within tp_2
end type
type pb_print_nota from pb_report within tp_2
end type
type pb_anula from picturebutton within tp_2
end type
type pb_anula_cheque from picturebutton within tp_2
end type
type pb_imp_cheque from pb_report within tp_2
end type
type dw_cheques from datawindow within tp_2
end type
type st_6 from statictext within tp_2
end type
type pb_save from picturebutton within tp_2
end type
type dw_nota from datawindow within tp_2
end type
type pb_new_nota from picturebutton within tp_2
end type
type st_2 from statictext within tp_2
end type
type dw_hist_notas from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_mod pb_mod
pb_edita pb_edita
pb_print_nota pb_print_nota
pb_anula pb_anula
pb_anula_cheque pb_anula_cheque
pb_imp_cheque pb_imp_cheque
dw_cheques dw_cheques
st_6 st_6
pb_save pb_save
dw_nota dw_nota
pb_new_nota pb_new_nota
st_2 st_2
dw_hist_notas dw_hist_notas
end type
type tab_1 from tab within w_movimiento_bancario
tp_1 tp_1
tp_3 tp_3
tp_2 tp_2
end type
end forward

global type w_movimiento_bancario from w_center
string tag = "Realizó una nueva Nota Bancaria. Desea guardar los cambios ?"
integer width = 5755
integer height = 2120
string title = "Movimiento Bancario"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_mvtob.ico"
boolean center = false
dw_banco dw_banco
dw_cuentas dw_cuentas
st_3 st_3
dw_det_cuenta dw_det_cuenta
tab_1 tab_1
end type
global w_movimiento_bancario w_movimiento_bancario

type variables
string i_banco,i_tcuenta,i_ncuenta,i_emp,i_doc='NBC',i_chequera
long i_itempago,i_npago
datawindowchild dw_cuenta,idw_nota1,idw_nota2,idw_cuenta2
boolean i_cam_pago=false
int i_dec_gral,i_aprox_gral
end variables

forward prototypes
public function integer grabar ()
public subroutine f_actu_vistas ()
end prototypes

public function integer grabar ();long nnota,nnota2
int signo=1
dec valor
string err

valor=round(tab_1.tp_2.dw_nota.getitemnumber(1,'valor'),i_dec_gral)
if valor<0 then 
	messagebox("Atención",'Valor no válido')
	return -1
end if
if tab_1.tp_2.dw_nota.getitemstring(1,'tercero')='1' then
	if isnull(tab_1.tp_2.dw_nota.getitemstring(1,'documento')) or tab_1.tp_2.dw_nota.getitemstring(1,'documento')='' then
		messagebox('Atención','Debe digitar el tercero para la nota')
		return -1
	end if
end if
signo=tab_1.tp_2.dw_nota.getitemnumber(1,'naturaleza')

if round(dw_det_cuenta.getitemnumber(1,'saldo') ,i_dec_gral)+round(dw_det_cuenta.getitemnumber(1,'monto_sobregiro') ,i_dec_gral)+ signo *valor<0 then
	messagebox("Atención",'El saldo sería negativo ')
	return -1
end if
if tab_1.tp_2.dw_nota.getitemstring(1,'de_transferencia')='1' then
	if isnull(tab_1.tp_2.dw_nota.getitemstring(1,'tipo')) then
		messagebox("Atención",'Debe elegir el tipo de Movimiento')
		return -1
	end if
	string ot_banco,ot_cuenta,ot_tcuenta,tnota2,ntrans,deta,ttrans
	datetime fecha
	OT_BANCO=tab_1.tp_2.dw_nota.getitemstring(1,'codbanco_2')
	ot_cuenta=tab_1.tp_2.dw_nota.getitemstring(1,'numcuenta_2')
	ot_tcuenta=tab_1.tp_2.dw_nota.getitemstring(1,'tipo_cuenta_2')
	tnota2=tab_1.tp_2.dw_nota.getitemstring(1,'cod_nota_2')
	if isnull(ot_banco) or isnull(ot_cuenta) or isnull(tnota2) then
		messagebox("Atención",'Debe elegir el banco ,la cuenta destino y el tipo de nota')
		return -1
	end if
	if ot_banco=i_banco and ot_cuenta=i_ncuenta and ot_tcuenta=i_tcuenta then 
		messagebox("Atención",'La cuenta destino no puede ser la misma')
		return -1
	end if
	select max(item) into :nnota2 from tesocuentasmovi where codbanco=:ot_banco and tipo_cuenta=:ot_tcuenta and numcuenta=:ot_cuenta;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo tesocuentasmovi',err)
		return -1
	end if
	if isnull (nnota2) then nnota2=0
	nnota2 ++
	fecha=tab_1.tp_2.dw_nota.getitemdatetime(1,'fecha')
	ntrans=tab_1.tp_2.dw_nota.getitemstring(1,'ntransaccion')
	deta=tab_1.tp_2.dw_nota.getitemstring(1,'detalle')
	ttrans=tab_1.tp_2.dw_nota.getitemstring(1,'tipo')
	INSERT INTO tesocuentasmovi ( CodBanco,clugar, tipo_cuenta, numcuenta, item, fecha, ntransaccion, detalle, usuario, tipo_trans, valor, signo, contabil, valor_cartera, tipo, cod_nota ) values
	(:ot_banco,:clugar,:ot_tcuenta,:ot_cuenta,:nnota2,:fecha,:ntrans,:deta,:usuario,'N',:valor,1,'P',0,:ttrans,:tnota2);
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error insertando en tesocuentasmovi',err)
		return -1
	end if
end if
select max(item) into :nnota from tesocuentasmovi where codbanco=:i_banco and tipo_cuenta=:i_tcuenta and numcuenta=:i_ncuenta;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error leyendo tesocuentasmovi',err)
	return -1
end if
if isnull (nnota) then nnota=0
nnota ++
tab_1.tp_2.dw_nota.setitem(1,'item',nnota)
tab_1.tp_2.dw_nota.setitem(1,'signo',tab_1.tp_2.dw_nota.getitemnumber(1,'naturaleza'))
long nulo
string snulo
setnull(nulo)
setnull(snulo)
if tab_1.tp_2.dw_nota.getitemstring(1,'de_transferencia')='1' then
	tab_1.tp_2.dw_nota.setitem(1,'item_1',nnota2)
else
	tab_1.tp_2.dw_nota.setitem(1,'codbanco_2',snulo)
	tab_1.tp_2.dw_nota.setitem(1,'numcuenta_2',snulo)
	tab_1.tp_2.dw_nota.setitem(1,'tipo_cuenta_2',snulo)
	tab_1.tp_2.dw_nota.setitem(1,'item_1',nulo)
end if
if tab_1.tp_2.dw_nota.update(true,false)=-1 then return -1

dw_det_cuenta.resetupdate()
tab_1.tp_2.dw_nota.resetupdate()
tab_1.tp_2.dw_nota.reset()
tab_1.tp_2.dw_hist_notas.reset()
f_actu_vistas()
cambio=false
return 1

end function

public subroutine f_actu_vistas ();tab_1.tp_2.dw_hist_notas.retrieve(i_banco,i_tcuenta,i_ncuenta)
dw_det_cuenta.retrieve(i_banco,i_tcuenta,i_ncuenta)
if dw_cuenta.retrieve(i_banco)=0 then dw_cuenta.insertrow(1)
tab_1.tp_1.dw_transacc.reset()
tab_1.tp_1.dw_transacc.retrieve(i_banco,i_tcuenta,i_ncuenta)
tab_1.tp_2.dw_hist_notas.event rowfocuschanged(tab_1.tp_2.dw_hist_notas.getrow())
end subroutine

on w_movimiento_bancario.create
int iCurrent
call super::create
this.dw_banco=create dw_banco
this.dw_cuentas=create dw_cuentas
this.st_3=create st_3
this.dw_det_cuenta=create dw_det_cuenta
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_banco
this.Control[iCurrent+2]=this.dw_cuentas
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.dw_det_cuenta
this.Control[iCurrent+5]=this.tab_1
end on

on w_movimiento_bancario.destroy
call super::destroy
destroy(this.dw_banco)
destroy(this.dw_cuentas)
destroy(this.st_3)
destroy(this.dw_det_cuenta)
destroy(this.tab_1)
end on

event open;call super::open;SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=28));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 28')
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
end event

type pb_grabar from w_center`pb_grabar within w_movimiento_bancario
boolean visible = false
integer x = 3538
integer y = 96
boolean enabled = false
string powertiptext = ""
end type

event pb_grabar::clicked;call super::clicked;grabar()
end event

type dw_banco from datawindow within w_movimiento_bancario
integer x = 32
integer y = 32
integer width = 1193
integer height = 152
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_banco"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;this.accepttext()
tab_1.tp_1.dw_transacc.reset()
tab_1.tp_1.dw_det.reset()
i_banco=this.getitemstring(1,"codbanco")
dw_det_cuenta.reset()
i_ncuenta=''
i_tcuenta=''
dw_cuentas.setitem(1,1,'')
if dw_cuenta.retrieve(i_banco)=0 then dw_cuenta.insertrow(1)
tab_1.tp_3.dw_cheq_posf.reset()


end event

type dw_cuentas from datawindow within w_movimiento_bancario
integer x = 1243
integer y = 32
integer width = 1271
integer height = 148
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cuentas"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild("numcuenta",dw_cuenta)
dw_cuenta.settransobject(sqlca)
dw_cuenta.insertrow(1)
insertrow(1)
end event

event itemchanged;string actual
actual=getitemstring(1,1)
choose case f_pregunta()
	case 1
		if grabar()=1 then 
			commit;
		else
			setitem(1,getcolumnname(),actual)
			return 1
		end if
	case 2
		cambio=false
		tab_1.tp_2.dw_nota.reset()
	case 3
		setitem(1,getcolumnname(),actual)
		return 1
end choose
accepttext()
i_ncuenta=getitemstring(1,"numcuenta")
i_tcuenta=dw_cuenta.getitemstring(dw_cuenta.getrow(),"tipo_cuenta")
dw_det_cuenta.retrieve(i_banco,i_tcuenta,i_ncuenta)
tab_1.tp_1.dw_transacc.reset()
tab_1.tp_1.dw_det.reset()
tab_1.tp_2.dw_hist_notas.reset()
tab_1.tp_1.dw_transacc.retrieve(i_banco,i_tcuenta,i_ncuenta)
tab_1.tp_3.dw_cheq_posf.reset()
tab_1.tp_2.dw_hist_notas.retrieve(i_banco,i_tcuenta,i_ncuenta)
end event

type st_3 from statictext within w_movimiento_bancario
integer x = 78
integer y = 200
integer width = 686
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transacciones realizadas"
boolean focusrectangle = false
end type

type dw_det_cuenta from datawindow within w_movimiento_bancario
integer x = 2661
integer y = 32
integer width = 1925
integer height = 156
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_det_cuenta"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

event retrieveend;if rowcount=0 then return
i_emp=getitemstring(1,'cod_empresa')
i_chequera=getitemstring(1,'chequera')
idw_nota1.retrieve(i_emp)
idw_nota2.retrieve(i_emp)
if getitemstring(1,'tipocaja')='1' then
	tab_1.selectedtab=1
	tab_1.tp_3.enabled=false
else
	tab_1.tp_3.enabled=true
end if
end event

event dberror;rollback;
return 0
end event

type tab_1 from tab within w_movimiento_bancario
integer x = 37
integer y = 172
integer width = 5632
integer height = 1868
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_3 tp_3
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_3=create tp_3
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_3,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_3)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5595
integer height = 1740
long backcolor = 67108864
string text = "Movimientos"
long tabtextcolor = 33554432
string picturename = "rec_caja.ico"
long picturemaskcolor = 536870912
string powertiptext = "Historial de Retiros y Consignaciones"
gb_3 gb_3
gb_2 gb_2
dw_det dw_det
dw_transacc dw_transacc
end type

on tp_1.create
this.gb_3=create gb_3
this.gb_2=create gb_2
this.dw_det=create dw_det
this.dw_transacc=create dw_transacc
this.Control[]={this.gb_3,&
this.gb_2,&
this.dw_det,&
this.dw_transacc}
end on

on tp_1.destroy
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.dw_det)
destroy(this.dw_transacc)
end on

type gb_3 from groupbox within tp_1
integer y = 1012
integer width = 5518
integer height = 700
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle del Movimiento:"
end type

type gb_2 from groupbox within tp_1
integer y = 8
integer width = 5518
integer height = 980
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Movimientos:"
end type

type dw_det from datawindow within tp_1
integer x = 41
integer y = 1048
integer width = 5417
integer height = 640
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cuentas_consignaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event itemchanged;this.accepttext()

end event

type dw_transacc from datawindow within tp_1
integer x = 37
integer y = 60
integer width = 5422
integer height = 896
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_banco_cuenta_movi"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;dw_det.reset()
if getrow()<1 then return
dw_det.retrieve(i_banco,i_tcuenta,i_ncuenta,clugar,getitemnumber(getrow(),"item"))

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
garbagecollect()
end event

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5595
integer height = 1740
long backcolor = 67108864
string text = "Cheques Posfechados"
long tabtextcolor = 33554432
string picturename = "factura.ico"
long picturemaskcolor = 536870912
string powertiptext = "Registrar el cobro de los cheques posfechados para actualizar el saldo de la cuenta"
pb_save_posf pb_save_posf
pb_cheq pb_cheq
em_1 em_1
st_1 st_1
dw_cheq_posf dw_cheq_posf
end type

on tp_3.create
this.pb_save_posf=create pb_save_posf
this.pb_cheq=create pb_cheq
this.em_1=create em_1
this.st_1=create st_1
this.dw_cheq_posf=create dw_cheq_posf
this.Control[]={this.pb_save_posf,&
this.pb_cheq,&
this.em_1,&
this.st_1,&
this.dw_cheq_posf}
end on

on tp_3.destroy
destroy(this.pb_save_posf)
destroy(this.pb_cheq)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_cheq_posf)
end on

type pb_save_posf from picturebutton within tp_3
integer x = 1856
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
end type

event clicked;if dw_cheq_posf.rowcount()=0 then return
if dw_cheq_posf.accepttext()=-1 then 
	dw_cheq_posf.setfocus()
	return
end if
if dw_cheq_posf.getitemnumber(1,'t_valor')=0 then return
long j,item,npago,nnulo
string clug_pago,cdoc_pago,snulo,err
dec valor
setnull(nnulo)
setnull(snulo)
for j=1 to dw_cheq_posf.rowcount()
	if isnull(dw_cheq_posf.getitemdatetime(j,'fecha_cobrado')) then continue
	valor=dw_cheq_posf.getitemnumber(j,'valor')
	cdoc_pago=dw_cheq_posf.getitemstring(j,'coddoc_trans')
	clug_pago=dw_cheq_posf.getitemstring(j,'clugar_trans')
	npago=dw_cheq_posf.getitemnumber(j,'ntransferencia')
	item=dw_cheq_posf.getitemnumber(j,'item')
	update tesocuentasmovi set valor_posf_pago = valor_posf_pago + :valor
	where codbanco=:i_banco and tipo_cuenta=:i_tcuenta and numcuenta=:i_ncuenta and item=:item;
	if sqlca.sqlcode=-1 then 
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando tesocuentasmovi (valor_posf_pago)',err)
		return
	end if
	update tesotranscab set valor_posf_pago = valor_posf_pago + :valor
	where clugar=:clug_pago and coddoc=:cdoc_pago and ntransferencia=:npago;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando tesotranscab (valor_posf_pago)',err)
		rollback;
		return
	end if
next
if dw_cheq_posf.update(true,false)=-1 then return
dw_cheq_posf.resetupdate()
dw_det_cuenta.resetupdate()
commit;
dw_cuentas.event itemchanged(1,dw_cuentas.object.numcuenta,i_ncuenta)
end event

type pb_cheq from picturebutton within tp_3
integer x = 1673
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
alignment htextalign = left!
end type

event clicked;datetime fecha
fecha=datetime(date(em_1.text),time('23:59:59'))
dw_cheq_posf.retrieve(i_banco,i_tcuenta,i_ncuenta,fecha)
end event

type em_1 from editmask within tp_3
integer x = 1285
integer y = 12
integer width = 370
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "1-1-2004~~31-12-2010"
end type

event constructor;text=string(today(),"dd/mm/yyyy")

end event

type st_1 from statictext within tp_3
integer x = 27
integer y = 8
integer width = 1225
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cheques Posfechados Pendientes de Pagar a la fecha:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_cheq_posf from datawindow within tp_3
integer x = 32
integer y = 128
integer width = 5495
integer height = 1444
integer taborder = 50
string title = "none"
string dataobject = "dw_cheques_posfechados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;//date(left(gettext(),10))>=date(fecha) and date(left(gettext(),10))<=today()
//messagebox('ojo',string(date(left(gettext(),10))))
end event

event dberror;rollback;
return 0
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5595
integer height = 1740
long backcolor = 67108864
string text = "Notas Bancarias"
long tabtextcolor = 33554432
string picturename = "Compute5!"
long picturemaskcolor = 536870912
string powertiptext = "Insertar Notas Débito y Crédito"
pb_mod pb_mod
pb_edita pb_edita
pb_print_nota pb_print_nota
pb_anula pb_anula
pb_anula_cheque pb_anula_cheque
pb_imp_cheque pb_imp_cheque
dw_cheques dw_cheques
st_6 st_6
pb_save pb_save
dw_nota dw_nota
pb_new_nota pb_new_nota
st_2 st_2
dw_hist_notas dw_hist_notas
end type

on tp_2.create
this.pb_mod=create pb_mod
this.pb_edita=create pb_edita
this.pb_print_nota=create pb_print_nota
this.pb_anula=create pb_anula
this.pb_anula_cheque=create pb_anula_cheque
this.pb_imp_cheque=create pb_imp_cheque
this.dw_cheques=create dw_cheques
this.st_6=create st_6
this.pb_save=create pb_save
this.dw_nota=create dw_nota
this.pb_new_nota=create pb_new_nota
this.st_2=create st_2
this.dw_hist_notas=create dw_hist_notas
this.Control[]={this.pb_mod,&
this.pb_edita,&
this.pb_print_nota,&
this.pb_anula,&
this.pb_anula_cheque,&
this.pb_imp_cheque,&
this.dw_cheques,&
this.st_6,&
this.pb_save,&
this.dw_nota,&
this.pb_new_nota,&
this.st_2,&
this.dw_hist_notas}
end on

on tp_2.destroy
destroy(this.pb_mod)
destroy(this.pb_edita)
destroy(this.pb_print_nota)
destroy(this.pb_anula)
destroy(this.pb_anula_cheque)
destroy(this.pb_imp_cheque)
destroy(this.dw_cheques)
destroy(this.st_6)
destroy(this.pb_save)
destroy(this.dw_nota)
destroy(this.pb_new_nota)
destroy(this.st_2)
destroy(this.dw_hist_notas)
end on

type pb_mod from picturebutton within tp_2
boolean visible = false
integer x = 2642
integer y = 1220
integer width = 146
integer height = 128
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
string powertiptext = "Almacena Modificaciones"
end type

event clicked;if not cambio then return
dw_nota.accepttext()
if tab_1.tp_2.dw_nota.update(true,false)=-1 then return -1

cambio=false
pb_mod.enabled=false
pb_mod.visible=false
tab_1.tp_2.dw_nota.modify ("tipodoc.Protect=1")
tab_1.tp_2.dw_nota.modify ("documento.Protect=1")
dw_hist_notas.TriggerEvent(rowfocuschanged!)
end event

type pb_edita from picturebutton within tp_2
integer x = 2638
integer y = 1080
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Permite modificar tercero asignado"
end type

event clicked;string ls_td,ls_doc,ls_cont
if not isnull(dw_nota.getitemstring(1,'usu_anula')) then
	pb_edita.enabled=false
	return
end if
if messageBox('Aviso','Esta seguro de modificar el tercero para esta nota?',QUESTION!,YESNO!) = 2 then
	pb_edita.enabled=false
	Return
end if
pb_mod.enabled=true
pb_mod.visible=true
ls_td=dw_nota.getitemstring(1,'tipodoc')
ls_doc=dw_nota.getitemstring(1,'documento')
ls_cont=dw_nota.getitemstring(1,'contabil')
if ls_cont='C' then
	dw_nota.setitem(dw_nota.getrow(),'tipodoc_ant',ls_td)
	dw_nota.setitem(dw_nota.getrow(),'documento_ant',ls_doc)
	dw_nota.setitem(dw_nota.getrow(),'contabil_mod','P')
	datetime fec
	fec=datetime(today(),now())
	dw_nota.setitem(dw_nota.getrow(),'fecha_mod',datetime(today(),now()))
end if
dw_nota.modify ("tipodoc.Protect=0")
dw_nota.modify ("documento.Protect=0")
cambio =true
end event

type pb_print_nota from pb_report within tp_2
integer x = 5394
integer y = 336
integer taborder = 50
boolean originalsize = false
string powertiptext = "Imprimir Nota bancaria"
string cod_rep = "NBC"
string nombre_rep = "Notas Bancarias"
string tipo_rep = "documento!"
end type

event constructor;call super::constructor;inicia('documento!','NBC',clugar)
end event

event clicked;call super::clicked;if dw_hist_notas.rowcount()=0 then return
any par[4]
par[1]=i_banco
par[2]=i_tcuenta
par[3]=i_ncuenta
par[4]=dw_hist_notas.getitemnumber(dw_hist_notas.getrow(),'item')
imprimir(par,'','0')
end event

type pb_anula from picturebutton within tp_2
integer x = 5394
integer y = 192
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
string picturename = "borrar_fila.gif"
string powertiptext = "Anular Nota"
end type

event clicked;if dw_hist_notas.rowcount()=0 then return
long fila,ctos
string cban2,tcuen2,ncuent2
long nro_not2

fila=dw_hist_notas.getrow()
if not isnull(dw_hist_notas.getitemstring(fila,'usuario_anula')) then
	messagebox('Atención','Esta Nota ya se encuentra anulada')
	return
end if
if dw_hist_notas.getitemstring(fila,'Contabil')='C' then
	messagebox('Atención','Esta Nota ya se encuentra Contabilizada no la puede anular')
	return
end if
if dw_hist_notas.getitemstring(fila,'de_transferencia')='2' then
	messagebox('Atención','Esta Nota es de traslado debe anularla en la cuenta de donde se sacaron los fondos')
	return
end if

cban2=dw_nota.getitemstring(fila,'codbanco')
tcuen2=dw_nota.getitemstring(fila,'tipo_cuenta')
ncuent2=dw_nota.getitemstring(1,'numcuenta')
nro_not2=dw_nota.getitemnumber(1,'item')
select 
	count(tesnotabanco_carcbrocpo.codbanco) into :ctos
from 
	tesnotabanco_carcbrocpo inner join car_cobro_cpo on (tesnotabanco_carcbrocpo.item_pag = car_cobro_cpo.item) 
	and (tesnotabanco_carcbrocpo.cartipo = car_cobro_cpo.cartipo) and (tesnotabanco_carcbrocpo.num_cobro = car_cobro_cpo.num_cobro) 
	and (tesnotabanco_carcbrocpo.coddoc_pag = car_cobro_cpo.coddoc) and (tesnotabanco_carcbrocpo.clugar_pag = car_cobro_cpo.clugar)
where 
	(((tesnotabanco_carcbrocpo.codbanco)=:cban2) and ((tesnotabanco_carcbrocpo.tipo_cuenta)=:tcuen2) 
	and ((tesnotabanco_carcbrocpo.numcuenta)=:ncuent2) and ((tesnotabanco_carcbrocpo.clugar)=:clugar) 
	and ((tesnotabanco_carcbrocpo.item)=:nro_not2) and ((car_cobro_cpo.estado) is null));
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo carcbrocpo',sqlca.sqlerrtext)
	return
end if
	
if ctos>0 then
	messagebox('Atención','Esta Nota tiene pagos registrados en Cartera.  Anule los pagos en Cartera')
	return
end if

st_xa_anular st_anula
st_anula.tipo='TE'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
int signo
dec valor
valor=dw_hist_notas.getitemnumber(fila,'valor')
//signo=dw_hist_notas.getitemnumber(fila,'signo')
signo=-1*dw_hist_notas.getitemnumber(fila,'signo')
if dw_det_cuenta.getitemnumber(1,'saldo') + (signo *valor)<0 then
	messagebox("Atención",'El saldo sería negativo ')
	return -1
end if
long nulo
setnull(nulo)
string snulo
setnull(snulo)
if not isnull(dw_nota.getitemnumber(1,'item_1')) then //mov de la otra cuenta
	cban2=dw_nota.getitemstring(1,'codbanco_2')
	tcuen2=dw_nota.getitemstring(1,'tipo_cuenta_2')
	ncuent2=dw_nota.getitemstring(1,'numcuenta_2')
	nro_not2=dw_nota.getitemnumber(1,'item_1')
	datetime hoy
	hoy=datetime(today(),now())
	update tesocuentasmovi set usu_anula=:usuario,fecha_anula=:hoy,motiv_anula=:st_anula.observacion,cod_anula=:st_anula.motivo
	where codbanco=:cban2 and tipo_cuenta=:tcuen2 and numcuenta =:ncuent2 and item=:nro_not2;
	if sqlca.sqlcode=-1 then
		messagebox('Error Anulando segunda Nota',sqlca.sqlerrtext)
		rollback;
		return
	end if

end if
dw_hist_notas.setitem(fila,'usuario_anula',usuario)
dw_hist_notas.setitem(fila,'fecha_anula',datetime(today(),now()))
dw_hist_notas.setitem(fila,'motiv_anula',st_anula.observacion)
dw_hist_notas.setitem(fila,'motiv_anula',st_anula.motivo)
if dw_hist_notas.update()=-1 then
	dw_hist_notas.setitem(fila,'estado',snulo)
	rollback;
	return
end if
commit;
f_actu_vistas()
end event

type pb_anula_cheque from picturebutton within tp_2
integer x = 5394
integer y = 1112
integer width = 142
integer height = 124
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Anular Cheque"
end type

event clicked;if dw_cheques.rowcount()=0 then return
if not isnull(dw_cheques.getitemstring(dw_cheques.getrow(),'estado')) then 
	messagebox("Atención",'Este cheque ya se encuentra anulado')
else
	st_xa_anular st_anula
	st_anula.tipo='TE'
	openwithparm (w_motiv_anula,st_anula)
	st_anula=message.powerobjectparm
	if not isValid(st_anula) then return
	datetime fecha
	string nulo
	setnull(nulo)
	fecha=datetime(today(),now())
	dw_cheques.setitem(dw_cheques.getrow(),'estado',usuario)
	dw_cheques.setitem(dw_cheques.getrow(),'fecha_anula',fecha)
	dw_cheques.setitem(dw_cheques.getrow(),'motiv_anula',st_anula.observacion)
	dw_cheques.setitem(dw_cheques.getrow(),'cod_anula',st_anula.motivo)
	dw_nota.setitem(1,'ntransaccion',nulo)
	if dw_cheques.update()=-1 then 
		rollback;
		return
	end if
	if dw_nota.update()=-1 then
		rollback;
		return
	end if
	commit;
	pb_imp_cheque.enabled=true
end if
end event

type pb_imp_cheque from pb_report within tp_2
integer x = 5394
integer y = 980
integer taborder = 120
boolean enabled = false
boolean originalsize = false
string powertiptext = "Generar o reimprimir Cheque"
string cod_rep = "CHEQ"
string nombre_rep = "Cheques"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_hist_notas.rowcount()=0 then return
long donde,cuantos,chequera,nro,final,item
any par[6]
string err
dec valor
valor=dw_hist_notas.getitemnumber(dw_hist_notas.getrow(),'valor')
item=dw_hist_notas.getitemnumber(dw_hist_notas.getrow(),'item')
par[1]=i_banco
par[2]=i_tcuenta
par[3]=i_ncuenta
par[4]=clugar
if dw_cheques.find('isnull(estado)',1,dw_cheques.rowcount())=0 then //todos anulados o no hay cheque => crearlo
	if i_chequera='0' then return
	select count(*) into :cuantos from tesocuenta_chequera 
	where codbanco=:i_banco and tipo_cuenta=:i_tcuenta and numcuenta=:i_ncuenta and estado='1';
	if cuantos<>1 then
		messagebox("Atención",'Esta cuenta bancaria no tiene chequera activa (o puede tener mas de una activa)  revise esto para continuar')
		return
	end if
	select nro_chequera,n_actual,n_final into :chequera ,:nro,:final
	from tesocuenta_chequera 
	where codbanco=:i_banco and tipo_cuenta=:i_tcuenta and numcuenta=:i_ncuenta and estado='1';
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo TesoCuenta_Chequera' ,sqlca.sqlerrtext)
		return
	end if
	if isnull(nro) then
		messagebox('Error leyendo TesoCuenta_Chequera' ,'No hay número actual de cheque')
		return
	end if
	nro ++
	if messagebox("Atención",'Está seguro de imprimir el cheque nro: '+string(nro)+' de la chequera nro: '+string(chequera)+' ?~r~nInserte el cheque en la impresora y presione SI para continuar o NO para cancelar.',question!,yesno!,1)=2 then return
	long movidet
	string num
	num=string(nro)
	select count(subitem) into :movidet from tesocuentasmovidet where codbanco=:i_banco and tipo_cuenta=:i_tcuenta and numcuenta=:i_ncuenta and item=:item;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo tesocuentasmovidet',err)
		return
	end if
	if movidet=0 then
		insert into tesocuentasmovidet (codbanco,tipo_cuenta,numcuenta,clugar,item,subitem,forma,valor,num_che,posfechado)
		values(:i_banco,:i_tcuenta,:i_ncuenta,:clugar,:item,1,'C',:valor,:num,'0');
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error insertando en tesocuentasmovidet',err)
			return
		end if
	end if
	dw_cheques.insertrow(1)
	dw_cheques.setitem(1,'codbanco',i_banco)
	dw_cheques.setitem(1,'tipo_cuenta',i_tcuenta)
	dw_cheques.setitem(1,'numcuenta',i_ncuenta)
	dw_cheques.setitem(1,'chequera',chequera)
	dw_cheques.setitem(1,'nro_cheque',nro)
	dw_cheques.setitem(1,'clugar',clugar)
	dw_cheques.setitem(1,'item',item)
	dw_cheques.setitem(1,'subitem',1)
	dw_cheques.setitem(1,'valor',valor)
	if dw_cheques.update()=-1 then
		rollback;
		return
	end if
	dw_nota.setitem(1,'ntransaccion',string(nro))
	if dw_nota.update()=-1 then 
		rollback;
		return
	end if
	string estado='1'
	if nro=final then estado='0'
	update tesocuenta_chequera set estado=:estado,n_actual=:nro 
	where codbanco=:i_banco and tipo_cuenta=:i_tcuenta and numcuenta=:i_ncuenta and nro_chequera=:chequera;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando TesoCuenta_Chequera",sqlca.sqlerrtext)
		rollback;
		return
	end if
	commit;
	par[5]=chequera
	par[6]=nro
	imprimir(par,'','0')
else
	if isnull(dw_cheques.getitemstring(dw_cheques.getrow(),'estado')) then
		par[5]=dw_cheques.getitemnumber(dw_cheques.getrow(),'chequera')
		par[6]=dw_cheques.getitemnumber(dw_cheques.getrow(),'nro_cheque')
		imprimir(par,'','0')
	end if
end if
end event

type dw_cheques from datawindow within tp_2
integer x = 2825
integer y = 980
integer width = 2546
integer height = 512
integer taborder = 120
string title = "none"
string dataobject = "dw_cheques"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_6 from statictext within tp_2
integer x = 2821
integer y = 928
integer width = 699
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de cheques de la Nota:"
boolean focusrectangle = false
end type

type pb_save from picturebutton within tp_2
integer x = 2633
integer y = 944
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar Nota(s) Bancarias"
end type

event clicked;if not cambio then return
dw_nota.accepttext()
if grabar()=1 then 
	commit;
end if
pb_save.enabled=false
end event

type dw_nota from datawindow within tp_2
integer x = 50
integer y = 924
integer width = 2560
integer height = 748
integer taborder = 60
string title = "none"
string dataobject = "dw_new_nota"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('cod_nota',idw_nota1)
getchild('cod_nota_2',idw_nota2)
idw_nota1.settransobject(sqlca)
idw_nota1.setfilter('de_transferencia="0" or de_transferencia="1"')
idw_nota1.filter()
idw_nota2.settransobject(sqlca)
idw_nota2.setfilter('de_transferencia="2"')
idw_nota2.filter()
getchild('numcuenta_2',idw_cuenta2)
idw_cuenta2.settransobject(sqlca)
settransobject(sqlca)
end event

event itemchanged;string nulo
setnull(nulo)
choose case dwo.name
	case 'fecha'
		if not f_valida_fecha( datetime(data) , 'M' , 2 ,datetime(string(today())+' '+string(now())) ,'Y' ) then
			return 2
		end if
	case 'fecha2'
		if not f_valida_fecha( datetime(data) , 'M' , 2 ,datetime(string(today())+' '+string(now())),'Y' ) then
			return 2
		end if
	case 'cod_nota'
		setitem(row,'naturaleza',idw_nota1.getitemnumber(idw_nota1.getrow(),'naturaleza'))
		setitem(row,'de_transferencia',idw_nota1.getitemstring(idw_nota1.getrow(),'de_transferencia'))
		setitem(row,'tercero',idw_nota1.getitemstring(idw_nota1.getrow(),'tercero'))
		setitem(row,'tipo',nulo)
	case 'codbanco_2'
		setitem(row,'numcuenta_2',nulo)
		setitem(row,'tipo_cuenta_2',nulo)
		idw_cuenta2.retrieve(data)
	case 'numcuenta_2'
		setitem(row,'tipo_cuenta_2',idw_cuenta2.getitemstring(idw_cuenta2.getrow(),'tipo_cuenta'))
	case "tipodoc"
		setitem(getrow(),"documento",nulo)
		accepttext()
	case "documento"
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(getrow(),"tipodoc")
		if isnull(tdoc) then
			setitem(getrow(),"documento",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=data
		setnull(persona)
		SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
		FROM TERCEROS
		WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
		if isnull(persona) then
			if messagebox("Atención","Este Tercero no se encuentra, desea crearlo?",question!,yesno!,2)=2 then
				settext(getitemstring(getrow(),getcolumn()))
				return 1
			else
				st_general messObj
				messObj.valor = getitemstring(getrow(),'tipodoc')
				messObj.documento = doc
				messObj.dw_obj = this
				openwithparm(w_cfgterceros, messObj)
				if message.stringparm='' then 
					settext(getitemstring(getrow(),getcolumn()))
					return 1
				end if
			end if
		else
			setitem(getrow(),"nombre1",nom1)
			setitem(getrow(),"nombre2",nom2)
			setitem(getrow(),"apellido1",ape1)
			setitem(getrow(),"apellido2",ape2)
			setitem(getrow(),"razon_social",rsoc)
		end if
end choose
end event

event doubleclicked;string columna
columna=dwo.name
if columna="documento" then
	g_tercerodesde=10
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		event itemchanged(row,dwo,getitemstring(getrow(),"documento"))
	end if
end if

end event

event dberror;rollback;
return 0
end event

type pb_new_nota from picturebutton within tp_2
integer x = 5394
integer y = 60
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Nueva Nota Bancaria"
end type

event clicked;if dw_cuentas.getitemstring(1,1)='' or isnull(dw_cuentas.getitemstring(1,1)) or cambio then return
dw_nota.reset()
dw_nota.insertrow(1)
dw_nota.setitem(1,'codbanco',i_banco)
dw_nota.setitem(1,'tipo_cuenta',i_tcuenta)
dw_nota.setitem(1,'numcuenta',i_ncuenta)
dw_nota.setitem(1,'clugar',clugar)
dw_nota.setitem(1,'fecha',datetime(today(),now()))
dw_nota.setitem(1,'fecha_2',datetime(today(),now()))
dw_nota.setitem(1,'usuario',usuario)
dw_cheques.reset()
pb_imp_cheque.enabled=false
cambio=true
pb_save.enabled=true

end event

type st_2 from statictext within tp_2
integer x = 5
integer y = 8
integer width = 672
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Notas Bancarias:"
boolean focusrectangle = false
end type

type dw_hist_notas from datawindow within tp_2
integer x = 5
integer y = 64
integer width = 5344
integer height = 852
integer taborder = 60
string title = "none"
string dataobject = "dw_tesoban_notas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;dw_cheques.reset()
dw_nota.reset()
if getrow()<1 then 
	pb_imp_cheque.enabled=false
	return
end if
dw_nota.retrieve(i_banco,i_tcuenta,i_ncuenta,clugar,getitemnumber(getrow(),'item'))
dw_cheques.retrieve(i_banco,i_tcuenta,i_ncuenta,clugar,getitemnumber(getrow(),'item'),1)
if getitemnumber(getrow(),'signo')=-1 and getitemstring(getrow(),'tipo')='C' and isnull(getitemstring(getrow(),'usuario_anula')) then
	pb_imp_cheque.enabled=true
else
	pb_imp_cheque.enabled=false
end if
string ls_car,ls_ter
long ld_ubic
ls_car=dw_nota.getitemstring(dw_nota.getrow(),'cod_nota')
ld_ubic=idw_nota1.find("cod_nota='"+ls_car+"'",1,idw_nota1.rowcount())
ls_car=idw_nota1.getitemstring(ld_ubic,'cartera')
ls_ter=idw_nota1.getitemstring(ld_ubic,'tercero')
if ls_car='1' and ls_ter='1' then
	pb_edita.enabled=true
else
	pb_edita.enabled=false
end if
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
garbagecollect()
end event

event rowfocuschanging;if cambio then return 1
end event

