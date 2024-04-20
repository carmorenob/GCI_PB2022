$PBExportHeader$w_movimiento_caja_mayor.srw
forward
global type w_movimiento_caja_mayor from w_center
end type
type dw_2 from datawindow within w_movimiento_caja_mayor
end type
type dw_detcaja from datawindow within w_movimiento_caja_mayor
end type
type tab_1 from tab within w_movimiento_caja_mayor
end type
type tabp_1 from userobject within tab_1
end type
type pb_anula from picturebutton within tabp_1
end type
type pb_print_ing from pb_report within tabp_1
end type
type tab_ing from tab within tabp_1
end type
type tp_1 from userobject within tab_ing
end type
type st_concep from statictext within tp_1
end type
type sle_concep from singlelineedit within tp_1
end type
type dw_pagodir from datawindow within tp_1
end type
type pb_newdet from picturebutton within tp_1
end type
type pb_deldet from picturebutton within tp_1
end type
type dw_pagodir_cpo from datawindow within tp_1
end type
type st_1 from statictext within tp_1
end type
type tp_1 from userobject within tab_ing
st_concep st_concep
sle_concep sle_concep
dw_pagodir dw_pagodir
pb_newdet pb_newdet
pb_deldet pb_deldet
dw_pagodir_cpo dw_pagodir_cpo
st_1 st_1
end type
type tp_2 from userobject within tab_ing
end type
type pb_cancel_not_ing from picturebutton within tp_2
end type
type pb_not_ing from picturebutton within tp_2
end type
type pb_save_not_ing from picturebutton within tp_2
end type
type dw_det_not_ing from datawindow within tp_2
end type
type tp_2 from userobject within tab_ing
pb_cancel_not_ing pb_cancel_not_ing
pb_not_ing pb_not_ing
pb_save_not_ing pb_save_not_ing
dw_det_not_ing dw_det_not_ing
end type
type tab_ing from tab within tabp_1
tp_1 tp_1
tp_2 tp_2
end type
type st_7 from statictext within tabp_1
end type
type cb_save_ing from picturebutton within tabp_1
end type
type cb_new_ing_manual from picturebutton within tabp_1
end type
type dw_ingre from datawindow within tabp_1
end type
type tabp_1 from userobject within tab_1
pb_anula pb_anula
pb_print_ing pb_print_ing
tab_ing tab_ing
st_7 st_7
cb_save_ing cb_save_ing
cb_new_ing_manual cb_new_ing_manual
dw_ingre dw_ingre
end type
type tabp_2 from userobject within tab_1
end type
type pb_print_egr from pb_report within tabp_2
end type
type tab_egr from tab within tabp_2
end type
type tp_3 from userobject within tab_egr
end type
type gb_1 from groupbox within tp_3
end type
type gb_2 from groupbox within tp_3
end type
type st_det from statictext within tp_3
end type
type dw_pdtes from datawindow within tp_3
end type
type em_tran from editmask within tp_3
end type
type em_fecha from editmask within tp_3
end type
type st_3 from statictext within tp_3
end type
type sle_concepto from singlelineedit within tp_3
end type
type dw_banco from datawindow within tp_3
end type
type st_4 from statictext within tp_3
end type
type st_2 from statictext within tp_3
end type
type dw_cuentas from datawindow within tp_3
end type
type tp_3 from userobject within tab_egr
gb_1 gb_1
gb_2 gb_2
st_det st_det
dw_pdtes dw_pdtes
em_tran em_tran
em_fecha em_fecha
st_3 st_3
sle_concepto sle_concepto
dw_banco dw_banco
st_4 st_4
st_2 st_2
dw_cuentas dw_cuentas
end type
type tp_4 from userobject within tab_egr
end type
type pb_cancel_not_egr from picturebutton within tp_4
end type
type pb_save_not_egr from picturebutton within tp_4
end type
type pb_not_egr from picturebutton within tp_4
end type
type dw_det_not_egr from datawindow within tp_4
end type
type tp_4 from userobject within tab_egr
pb_cancel_not_egr pb_cancel_not_egr
pb_save_not_egr pb_save_not_egr
pb_not_egr pb_not_egr
dw_det_not_egr dw_det_not_egr
end type
type tab_egr from tab within tabp_2
tp_3 tp_3
tp_4 tp_4
end type
type st_6 from statictext within tabp_2
end type
type cb_save_egr from picturebutton within tabp_2
end type
type cb_anular_egr from picturebutton within tabp_2
end type
type cb_new_egr from picturebutton within tabp_2
end type
type dw_egre from datawindow within tabp_2
end type
type tabp_2 from userobject within tab_1
pb_print_egr pb_print_egr
tab_egr tab_egr
st_6 st_6
cb_save_egr cb_save_egr
cb_anular_egr cb_anular_egr
cb_new_egr cb_new_egr
dw_egre dw_egre
end type
type tab_1 from tab within w_movimiento_caja_mayor
tabp_1 tabp_1
tabp_2 tabp_2
end type
type dw_movidet from datawindow within w_movimiento_caja_mayor
end type
end forward

global type w_movimiento_caja_mayor from w_center
string tag = "Realizó cambios en los ingresos o egresos, desea guaradr los cambios?"
integer width = 4617
integer height = 2160
string title = "Movimiento de Caja Mayor"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_cajam.ico"
boolean center = false
dw_2 dw_2
dw_detcaja dw_detcaja
tab_1 tab_1
dw_movidet dw_movidet
end type
global w_movimiento_caja_mayor w_movimiento_caja_mayor

type variables
datawindowchild dw_caja,dw_cuenta,idw_concep,idw_clug
string color,i_lugar='',i_caja='',i_banco='',i_tcuenta='',i_ncuenta=''
boolean i_cam_ing=false , i_cam_egr=false
end variables

forward prototypes
public subroutine f_lleva (long item, long nrcaj)
public function integer grabar ()
end prototypes

public subroutine f_lleva (long item, long nrcaj);long j,k
dec efectivo=0
dw_movidet.reset()
for j=1 to tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.rowcount()
	if tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemnumber(j,"esco")=1 then
		tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.setitem(j,"codcaja_egr",i_caja)
		tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.setitem(j,"clugar_egr",i_lugar)
		tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.setitem(j,"coddoc_egr",'EM')
		tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.setitem(j,"nrcaj_egr",nrcaj)
	end if
	if tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemnumber(j,"este")=1 then
		if tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemstring(j,"forma")='1' then
			efectivo+=tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemnumber(j,"valor_det")
		else
			k=dw_movidet.insertrow(0)
			dw_movidet.setitem(k,"codbanco",i_banco)
			dw_movidet.setitem(k,"tipo_cuenta",i_tcuenta)
			dw_movidet.setitem(k,"numcuenta",i_ncuenta)
			dw_movidet.setitem(k,"clugar",clugar)
			dw_movidet.setitem(k,"item",item)
			dw_movidet.setitem(k,"subitem",k)
			dw_movidet.setitem(k,"forma",tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemstring(j,"forma"))
			dw_movidet.setitem(k,"valor",tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemnumber(j,"valor_det"))
			dw_movidet.setitem(k,"banco_che",tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemstring(j,"banco_che"))
			dw_movidet.setitem(k,"cuenta_che",tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemstring(j,"cuenta_che"))
			dw_movidet.setitem(k,"num_che",tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemstring(j,"num_che"))
		end if
	end if
next
if efectivo>0 then
	k=dw_movidet.insertrow(0)
	dw_movidet.setitem(k,"codbanco",i_banco)
	dw_movidet.setitem(k,"tipo_cuenta",i_tcuenta)
	dw_movidet.setitem(k,"numcuenta",i_ncuenta)
	dw_movidet.setitem(k,"clugar",clugar)
	dw_movidet.setitem(k,"item",item)
	dw_movidet.setitem(k,"subitem",k)
	dw_movidet.setitem(k,"forma",'1')
	dw_movidet.setitem(k,"valor",efectivo +tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemnumber(1,"st_notas"))
end if	
end subroutine

public function integer grabar ();any par[4]
string snulo,err
long nnulo
setnull(snulo)
setnull(nnulo)
if i_cam_ing then
	datetime fecha_ing
	if tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.accepttext()=-1 then return -1
	if tab_1.tabp_1.tab_ing.tp_1.dw_pagodir_cpo.accepttext()=-1 then return -1
	fecha_ing=tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.getitemdatetime(1,'fecha')
	if date(fecha_ing)>today() then
		messagebox("Error","Fecha no válida")
		return -1
	end if	
	if tab_1.tabp_1.tab_ing.tp_1.dw_pagodir_cpo.rowcount()=0 then
		messagebox("Error","No ha digitado el detalle del ingreso")
		return -1
	end if
	if tab_1.tabp_1.tab_ing.tp_1.dw_pagodir_cpo.getitemnumber(1,"total")<=0 then
		messagebox("Atención","No es válido el valor del ingreso")
		return -1
	end if
	if isnull(tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.getitemstring(1,"documento")) or trim(tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.getitemstring(1,"documento"))='' then
		messagebox("Atención","No ha escogido el tercero al que le realizará el pago")
		return -1
	end if
	if isnull(tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.getitemstring(1,"cartipo")) then
		messagebox("Atención","No ha escogido el concepto del Pago")
		return -1
	end if
	long ning=0
	ning=f_trae_ndoc('IM',i_lugar,'Ingreso a Caja Mayor')
	if ning=-1 then return -1
	tab_1.tabp_1.dw_ingre.insertrow(1)
	tab_1.tabp_1.dw_ingre.setitem(1,"codcaja",i_caja)
	tab_1.tabp_1.dw_ingre.setitem(1,"clugar",i_lugar)
	tab_1.tabp_1.dw_ingre.setitem(1,"coddoc",'IM')
	tab_1.tabp_1.dw_ingre.setitem(1,"ningreso",ning)
	tab_1.tabp_1.dw_ingre.setitem(1,"cartipo",tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.getitemstring(1,'cartipo'))
	tab_1.tabp_1.dw_ingre.setitem(1,"concepto",tab_1.tabp_1.tab_ing.tp_1.sle_concep.text)
	
	tab_1.tabp_1.dw_ingre.setitem(1,"fecha_ingreso",fecha_ing)
	tab_1.tabp_1.dw_ingre.setitem(1,"valor",tab_1.tabp_1.tab_ing.tp_1.dw_pagodir_cpo.getitemnumber(1,"total"))
	tab_1.tabp_1.dw_ingre.setitem(1,"arqueo",'0')
	tab_1.tabp_1.dw_ingre.setitem(1,"usuario",usuario)
	tab_1.tabp_1.dw_ingre.setitem(1,"ningreso",ning)
	
	if tab_1.tabp_1.dw_ingre.update()=-1 then
		tab_1.tabp_1.dw_ingre.deleterow(1)
		rollback;
		return -1
	end if	
	long ning2
	ning2=f_trae_ndoc('PD',clugar,'Pago Directo')
	if ning2=-1 then 
		tab_1.tabp_1.dw_ingre.deleterow(1)
		return -1
	end if

	tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.setitem(1,"num_ingreso",ning2)
	tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.setitem(1,"valor",tab_1.tabp_1.tab_ing.tp_1.dw_pagodir_cpo.getitemnumber(1,"total"))
	tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.setitem(1,"codcaja",i_caja)
	tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.setitem(1,"clugar_caja",i_lugar)
	tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.setitem(1,"coddoc_caja",'IM')
	tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.setitem(1,"ningreso_caja",ning)
	
	if tab_1.tabp_1.tab_ing.tp_1.dw_pagodir.update()=-1 then
		rollback;
		tab_1.tabp_1.dw_ingre.deleterow(1)
		return -1
	end if
	long j
	for j=1 to tab_1.tabp_1.tab_ing.tp_1.dw_pagodir_cpo.rowcount()
		tab_1.tabp_1.tab_ing.tp_1.dw_pagodir_cpo.setitem(j,"num_ingreso",ning2)
	next
	if tab_1.tabp_1.tab_ing.tp_1.dw_pagodir_cpo.update()=-1 then
		rollback;
		tab_1.tabp_1.dw_ingre.deleterow(1)
		return -1
	end if


	par[1]=i_caja
	par[2]=i_lugar
	par[3]='IM'
	par[4]=ning
	tab_1.tabp_1.pb_print_ing.imprimir(par,'','0')
	tab_1.tabp_1.tab_ing.tp_1.sle_concep.visible=false
	tab_1.tabp_1.tab_ing.tp_1.st_concep.visible=false
	tab_1.tabp_2.enabled=true
end if
if i_cam_egr then
	if i_banco='' or i_ncuenta='' then
		messagebox("Atención","Debe escoger el banco y la cuenta destino de la consignación")
		rollback;
		return -1
	end if
	if tab_1.tabp_2.tab_egr.tp_3.sle_concepto.text='' then
		messagebox("Atención",'Digite el concepto del egreso')
		rollback;
		return -1
	end if
	dec valor
	long donde
	valor=round(tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.getitemnumber(1,"a_consig"),2)
	if valor<=0 or valor>dw_detcaja.getitemnumber(1,"monto") then
		messagebox("Error","El monto de la consignación no puede ser cero o mayor al saldo de la caja")
		rollback;
		return -1
	end if
	donde=tab_1.tabp_2.dw_egre.insertrow(0)
	tab_1.tabp_2.dw_egre.setitem(donde,"codcaja",i_caja)
	tab_1.tabp_2.dw_egre.setitem(donde,"clugar",i_lugar)
	tab_1.tabp_2.dw_egre.setitem(donde,"coddoc",'EM')
	tab_1.tabp_2.dw_egre.setitem(donde,"fecha_recibo",datetime(date(tab_1.tabp_2.tab_egr.tp_3.em_fecha.text)))
	tab_1.tabp_2.dw_egre.setitem(donde,"usuario",usuario)
	tab_1.tabp_2.dw_egre.setitem(donde,"codbanco",i_banco)
	tab_1.tabp_2.dw_egre.setitem(donde,"tipo_cuenta",i_tcuenta)
	tab_1.tabp_2.dw_egre.setitem(donde,"clugar_ban",clugar)	
	tab_1.tabp_2.dw_egre.setitem(donde,"numcuenta",i_ncuenta)
	tab_1.tabp_2.dw_egre.setitem(donde,"valor",valor)
	long item=0,nrcaj=0
	string concep,ntrans
	select max(item) into :item from tesocuentasmovi where codbanco=:i_banco and tipo_cuenta=:i_tcuenta and numcuenta=:i_ncuenta and clugar=:clugar;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox("Error leyendo tesocuentasmovi",err)
		return -1
	end if
	if isnull(item) then item=0
	item ++
	datetime fecha
	fecha=datetime(date(tab_1.tabp_2.tab_egr.tp_3.em_fecha.text))
	concep=tab_1.tabp_2.tab_egr.tp_3.sle_concepto.text
	ntrans=tab_1.tabp_2.tab_egr.tp_3.em_tran.text
	insert into tesocuentasmovi (codbanco,tipo_cuenta,numcuenta,clugar,item,fecha,ntransaccion,detalle,usuario,tipo_trans,valor,valor_notas)
	values (:i_banco,:i_tcuenta,:i_ncuenta,:clugar,:item,:fecha,:ntrans,:concep,:usuario,'C',:valor,0);
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox("Error insertando en tesocuentasmovi",err)
		return -1
	end if
	nrcaj=f_trae_ndoc('EM',i_lugar,'Egreso de Caja Mayor')
	if nrcaj=-1 then return -1
	tab_1.tabp_2.dw_egre.setitem(donde,"nrcaja",nrcaj)
	tab_1.tabp_2.dw_egre.setitem(donde,"concepto",concep)
	tab_1.tabp_2.dw_egre.setitem(donde,"item",item)
	if tab_1.tabp_2.dw_egre.update()=-1 then
		rollback;
		return -1
	end if
	
	
	f_lleva(item,nrcaj)
	if dw_movidet.update()=-1 then
		rollback;
		return -1
	end if
	if tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.update()=-1 then
		rollback;
		return -1
	end if
	
	tab_1.tabp_2.cb_saVE_egr.enabled=false
	tab_1.tabp_2.tab_egr.tp_3.sle_concepto.TEXT=''
	tab_1.tabp_2.tab_egr.tp_3.sle_concepto.enabled=false
	tab_1.tabp_2.tab_egr.tp_3.em_tran.enabled=false
	tab_1.tabp_2.tab_egr.tp_3.em_tran.text=''
	tab_1.tabp_2.tab_egr.tp_3.em_fecha.enabled=false
	tab_1.tabp_2.tab_egr.tp_3.em_fecha.text='00/00/0000'
	par[1]=i_caja
	par[2]=i_lugar
	par[3]='EM'
	par[4]=nrcaj
	tab_1.tabp_2.pb_print_egr.imprimir(par,'','0')
	dw_movidet.reset()
	tab_1.tabp_2.tab_egr.tp_3.st_det.text="Detalle de Consignaciones:"
	tab_1.tabp_1.enabled=true
end if
commit;
i_cam_ing=false
i_cam_egr=false
cambio=false
tab_1.tabp_1.tab_ing.tp_1.pb_newdet.visible=false
tab_1.tabp_1.tab_ing.tp_1.pb_deldet.visible=false
tab_1.tabp_1.tab_ing.tp_2.enabled=true
tab_1.tabp_2.cb_new_egr.enabled=true
tab_1.tabp_1.tab_ing.tp_1.sle_concep.visible=true
tab_1.tabp_1.tab_ing.tp_1.st_concep.visible=true
dw_2.setcolumn("codcaja")
dw_2.triggerevent(itemchanged!)
return 1
end function

on w_movimiento_caja_mayor.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_detcaja=create dw_detcaja
this.tab_1=create tab_1
this.dw_movidet=create dw_movidet
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_detcaja
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.dw_movidet
end on

on w_movimiento_caja_mayor.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_detcaja)
destroy(this.tab_1)
destroy(this.dw_movidet)
end on

event open;call super::open;garbagecollect()
end event

event close;call super::close;garbagecollect()
end event

type pb_grabar from w_center`pb_grabar within w_movimiento_caja_mayor
integer x = 3264
integer y = 196
integer textsize = -8
string facename = "Tahoma"
end type

type dw_2 from datawindow within w_movimiento_caja_mayor
integer x = 37
integer y = 28
integer width = 1609
integer height = 160
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_caja_mayor"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild("codcaja",dw_caja)
getchild("clugar",idw_clug)
dw_caja.settransobject(sqlca)
idw_clug.settransobject(sqlca)
dw_caja.insertrow(1)
insertrow(1)
setitem(1,'clugar',clugar)

end event

event itemchanged;string actual,carreta,nom_arch
actual=getitemstring(1,getcolumnname())
choose case f_pregunta()
	case 1
		if grabar()=-1 then 
			setitem(1,getcolumnname(),actual)
			return 1
		end if
	case 2
		i_cam_ing=false
		i_cam_egr=false
		cambio=false
		tab_1.tabp_2.cb_new_egr.enabled=true
	case 3
		setitem(1,getcolumnname(),actual)
		return 1
end choose
accepttext()
tab_1.tabp_1.tab_ing.tp_2.enabled=true
tab_1.tabp_1.tab_ing.tp_2.pb_cancel_not_ing.event clicked()
tab_1.tabp_1.dw_ingre.reset()
tab_1.tabp_1.tab_ing.tp_1.dw_pagodir_cpo.reset()
tab_1.tabp_1.tab_ing.tp_2.dw_det_not_ing.reset()


//tab_1.tabp_2.tab_egr.tp_4.enabled=true
tab_1.tabp_2.tab_egr.tp_4.pb_cancel_not_egr.event clicked()
tab_1.tabp_2.dw_egre.reset()
tab_1.tabp_2.tab_egr.tp_3.dw_pdtes.reset()
tab_1.tabp_2.tab_egr.tp_4.dw_det_not_egr.reset()

if getcolumnname()='clugar' then
	i_lugar=getitemstring(1,"clugar")
	dw_caja.retrieve(i_lugar)
	setitem(1,"codcaja",'')
	dw_detcaja.reset()
	i_caja=''
	tab_1.tabp_1.pb_print_ing.inicia('documento!','IM',i_lugar)
	tab_1.tabp_2.pb_print_egr.inicia('documento!','EM',i_lugar)
else
	i_caja=getitemstring(1,"codcaja")
	dw_detcaja.retrieve(i_lugar,i_caja)
	tab_1.tabp_1.dw_ingre.retrieve(i_lugar,i_caja)
	tab_1.tabp_2.dw_egre.reset()
	garbagecollect()
	tab_1.tabp_2.dw_egre.retrieve(i_lugar,i_caja)
end if
end event

event rowfocuschanged;idw_clug.setfilter('codlugar="' +clugar+'"')
idw_clug.filter()
i_lugar=clugar
dw_caja.retrieve(i_lugar)
end event

type dw_detcaja from datawindow within w_movimiento_caja_mayor
integer x = 1659
integer y = 28
integer width = 1737
integer height = 140
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_caja_mayor_respon"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type tab_1 from tab within w_movimiento_caja_mayor
event create ( )
event destroy ( )
integer x = 27
integer y = 168
integer width = 4526
integer height = 1792
integer taborder = 40
boolean bringtotop = true
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
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabp_1 tabp_1
tabp_2 tabp_2
end type

on tab_1.create
this.tabp_1=create tabp_1
this.tabp_2=create tabp_2
this.Control[]={this.tabp_1,&
this.tabp_2}
end on

on tab_1.destroy
destroy(this.tabp_1)
destroy(this.tabp_2)
end on

type tabp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4489
integer height = 1664
long backcolor = 67108864
string text = "Ingresos"
long tabtextcolor = 33554432
string picturename = "entrada.ico"
long picturemaskcolor = 536870912
string powertiptext = "Ingresos de la caja"
pb_anula pb_anula
pb_print_ing pb_print_ing
tab_ing tab_ing
st_7 st_7
cb_save_ing cb_save_ing
cb_new_ing_manual cb_new_ing_manual
dw_ingre dw_ingre
end type

on tabp_1.create
this.pb_anula=create pb_anula
this.pb_print_ing=create pb_print_ing
this.tab_ing=create tab_ing
this.st_7=create st_7
this.cb_save_ing=create cb_save_ing
this.cb_new_ing_manual=create cb_new_ing_manual
this.dw_ingre=create dw_ingre
this.Control[]={this.pb_anula,&
this.pb_print_ing,&
this.tab_ing,&
this.st_7,&
this.cb_save_ing,&
this.cb_new_ing_manual,&
this.dw_ingre}
end on

on tabp_1.destroy
destroy(this.pb_anula)
destroy(this.pb_print_ing)
destroy(this.tab_ing)
destroy(this.st_7)
destroy(this.cb_save_ing)
destroy(this.cb_new_ing_manual)
destroy(this.dw_ingre)
end on

type pb_anula from picturebutton within tabp_1
integer x = 4274
integer y = 320
integer width = 146
integer height = 128
integer taborder = 35
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Anular Ingreso Directo"
end type

event clicked;if dw_ingre.rowcount()=0 then return
long fila
fila=dw_ingre.getrow()
if dw_ingre.getitemnumber(fila,'valor_cartera')>0 then
	messagebox('Atención', 'Este Ingreso ya se encuentra Registrado en Cartera no lo puede anular')
	return
end if
if dw_ingre.getitemnumber(fila,'valor_recepcion')>0 then
	messagebox('Atención', 'Este Ingreso ya se encuentra Registrado en Recepciones de factura no lo puede anular')
	return
end if
if not isnull(dw_ingre.getitemstring(fila,'estado')) then
	messagebox('Atención', 'Este Ingreso ya se encuentra anulado')
	return
end if
if not isnull(dw_ingre.getitemstring(fila,'codcaja_egr')) then
	messagebox('Atención', 'Este Ingreso ya se encuentra Consignado, no lo puede anular')
	return
end if
if dw_ingre.getitemstring(fila,'contabil')='C' then
	messagebox('Atención', 'Este Ingreso ya se encuentra Contabilizado, no lo puede anular')
	return
end if
dec valor
choose case dw_ingre.getitemstring(fila,'arqueo')
	case '0'//directo
		st_xa_anular st_anula
		st_anula.tipo='TE'
		openwithparm (w_motiv_anula,st_anula)
		st_anula=message.powerobjectparm
		if not isValid(st_anula) then return
		valor=dw_ingre.getitemdecimal(fila,'valor')
		datetime fecha
		long j,num_not,npago_dir
		string cdoc_not,clug_not,motiv1,cdoc_pdir,clug_pdir
		fecha=datetime(today(),now())
		motiv1=left('Anulación de Ingreso Directo Nro:'+string(dw_ingre.getitemnumber(fila,'ningreso'))+st_anula.observacion,255)
		for j= 1 to tab_ing.tp_2.dw_det_not_ing.rowcount()
			valor=valor + (tab_ing.tp_2.dw_det_not_ing.getitemnumber(j,'cab_clasenota')*tab_ing.tp_2.dw_det_not_ing.getitemnumber(j,'cab_valor'))
			cdoc_not = tab_ing.tp_2.dw_det_not_ing.getitemstring(j,'cab_coddoc')
			clug_not = tab_ing.tp_2.dw_det_not_ing.getitemstring(j,'cab_clugar')
			num_not = tab_ing.tp_2.dw_det_not_ing.getitemnumber(j,'cab_num_nota')
			update tesonotascab set estado=:usuario,fecha_anula=:fecha,motiv_anula=:motiv1,cod_anula=:st_anula.motivo
			where coddoc=:cdoc_not and clugar=:clug_not and num_nota=:num_not;
			if sqlca.sqlcode=-1 then
				messagebox("Error actualizando TesoNotasCab",sqlca.sqlerrtext)
				rollback;
				return
			end if
		next
		string snulo
		long nnulo
		setnull(snulo)
		setnull(nnulo)
		dw_ingre.setitem(fila,'estado',usuario)
		dw_ingre.setitem(fila,'fecha_anula',fecha)
		dw_ingre.setitem(fila,'motiv_anula',st_anula.observacion)
		dw_ingre.setitem(fila,'cod_anula',st_anula.motivo)
		cdoc_pdir=dw_ingre.getitemstring(fila,'cdoc_pdir')
		clug_pdir=dw_ingre.getitemstring(fila,'clug_pdir')
		npago_dir=dw_ingre.getitemnumber(fila,'num_ingreso')
		UPDATE tesopagodircab SET tesopagodircab.Estado = :usuario, tesopagodircab.fecha_anula = :fecha
		WHERE tesopagodircab.CodDoc=:cdoc_pdir AND tesopagodircab.clugar=:clug_pdir AND 
		tesopagodircab.NUM_ingreso=:npago_dir;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando tesopagodircab",sqlca.sqlerrtext)
			rollback;
			return
		end if
		if dw_ingre.update()=-1 then
			rollback;
			return
		end if
		commit;
	case '1'//arqueo
		messagebox('Atención', 'Este Ingreso es de un arqueo, solo lo puede anular en la ventana de arqueos')
	case else
		messagebox('Atención', 'Este Ingreso es de una interface, solo lo puede anular en la ventana donde se generó')
end choose
end event

type pb_print_ing from pb_report within tabp_1
integer x = 4274
integer y = 452
integer taborder = 60
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Reimprimir Ingreso"
string cod_rep = "IM"
string nombre_rep = "Ingreso a caja Mayor"
string tipo_rep = "documento!"
boolean dialogo = true
end type

event clicked;call super::clicked;if dw_ingre.rowcount()>0 then
	any par[4]
	par[1]=i_caja
	par[2]=i_lugar
	par[3]='IM'
	par[4]=dw_ingre.getitemnumber(dw_ingre.getrow(),"ningreso")
	imprimir(par,'','0')
end if
end event

type tab_ing from tab within tabp_1
event create ( )
event destroy ( )
integer x = 46
integer y = 608
integer width = 3771
integer height = 980
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_ing.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_ing.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_ing
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3735
integer height = 852
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "arq_deta.ico"
long picturemaskcolor = 536870912
string powertiptext = "Detalle del Ingreso"
st_concep st_concep
sle_concep sle_concep
dw_pagodir dw_pagodir
pb_newdet pb_newdet
pb_deldet pb_deldet
dw_pagodir_cpo dw_pagodir_cpo
st_1 st_1
end type

on tp_1.create
this.st_concep=create st_concep
this.sle_concep=create sle_concep
this.dw_pagodir=create dw_pagodir
this.pb_newdet=create pb_newdet
this.pb_deldet=create pb_deldet
this.dw_pagodir_cpo=create dw_pagodir_cpo
this.st_1=create st_1
this.Control[]={this.st_concep,&
this.sle_concep,&
this.dw_pagodir,&
this.pb_newdet,&
this.pb_deldet,&
this.dw_pagodir_cpo,&
this.st_1}
end on

on tp_1.destroy
destroy(this.st_concep)
destroy(this.sle_concep)
destroy(this.dw_pagodir)
destroy(this.pb_newdet)
destroy(this.pb_deldet)
destroy(this.dw_pagodir_cpo)
destroy(this.st_1)
end on

type st_concep from statictext within tp_1
boolean visible = false
integer x = 32
integer y = 768
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Concepto:"
boolean focusrectangle = false
end type

type sle_concep from singlelineedit within tp_1
boolean visible = false
integer x = 297
integer y = 760
integer width = 3365
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type dw_pagodir from datawindow within tp_1
integer x = 14
integer y = 612
integer width = 3689
integer height = 140
integer taborder = 90
string title = "none"
string dataobject = "dw_pagodir_cab"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('cartipo',idw_concep)
idw_concep.setTransobject(sqlca)
idw_concep.retrieve()
end event

event doubleclicked;if this.getcolumnname()="documento" then
	g_tercerodesde=11
	openwithparm(w_buscater,this)
	if this.getitemstring(this.getrow(),"documento")<>"" then
		this.setcolumn("documento")
		this.triggerevent(itemchanged!)
	end if
end if
end event

event itemchanged;long donde=1
string nulo
if getcolumnname()="documento" then
	string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
	tdoc=getitemstring(donde,"tipodoc")
	if isnull(tdoc) then
		setnull(nulo)
		setitem(donde,"documento",nulo)
		setcolumn("tipodoc")
		return 1
	end if
	doc=gettext()
	setnull(persona)
	SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
	into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
	FROM TERCEROS
	WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
	if isnull(persona) then
		setitem(donde,"documento",persona)
		return 1
	else
		setitem(donde,"dverificacion",dverif)
		setitem(donde,"nombre1",nom1)
		setitem(donde,"nombre2",nom2)
		setitem(donde,"apellido1",ape1)
		setitem(donde,"apellido2",ape2)
		setitem(donde,"razon_social",rsoc)
		setitem(donde,"persona",persona)
	end if
end if
end event

event dberror;rollback;
return 0
end event

type pb_newdet from picturebutton within tp_1
event mousemove pbm_mousemove
boolean visible = false
integer x = 3534
integer y = 32
integer width = 146
integer height = 128
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_print.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo detalle de Ingreso Directo"
end type

event clicked;if not i_cam_ing then return
long j
j=dw_pagodir_cpo.insertrow(0)
dw_pagodir_cpo.setitem(j,"coddoc",'PD')
dw_pagodir_cpo.setitem(j,"clugar",clugar)
dw_pagodir_cpo.setitem(j,"item",j)
end event

type pb_deldet from picturebutton within tp_1
event mousemove pbm_mousemove
boolean visible = false
integer x = 3534
integer y = 168
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
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar detalle de Ingreso Directo"
end type

event clicked;if not i_cam_ing then return
dw_pagodir_cpo.deleterow(0)
long j
for j=1 to dw_pagodir_cpo.rowcount()
	dw_pagodir_cpo.setitem(j,"item",j)
next
end event

type dw_pagodir_cpo from datawindow within tp_1
integer x = 14
integer y = 52
integer width = 3026
integer height = 544
integer taborder = 80
string title = "none"
string dataobject = "dw_caja_ingreso_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type st_1 from statictext within tp_1
integer x = 18
integer width = 439
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Items del Ingreso:"
boolean focusrectangle = false
end type

type tp_2 from userobject within tab_ing
integer x = 18
integer y = 112
integer width = 3735
integer height = 852
long backcolor = 67108864
string text = "Notas"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
string powertiptext = "Notas del Ingreso"
pb_cancel_not_ing pb_cancel_not_ing
pb_not_ing pb_not_ing
pb_save_not_ing pb_save_not_ing
dw_det_not_ing dw_det_not_ing
end type

on tp_2.create
this.pb_cancel_not_ing=create pb_cancel_not_ing
this.pb_not_ing=create pb_not_ing
this.pb_save_not_ing=create pb_save_not_ing
this.dw_det_not_ing=create dw_det_not_ing
this.Control[]={this.pb_cancel_not_ing,&
this.pb_not_ing,&
this.pb_save_not_ing,&
this.dw_det_not_ing}
end on

on tp_2.destroy
destroy(this.pb_cancel_not_ing)
destroy(this.pb_not_ing)
destroy(this.pb_save_not_ing)
destroy(this.dw_det_not_ing)
end on

type pb_cancel_not_ing from picturebutton within tp_2
boolean visible = false
integer x = 3561
integer y = 304
integer width = 142
integer height = 124
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "Cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar Creación de Nota"
end type

event clicked;visible=false
pb_not_ing.enabled=true
dw_det_not_ing.border=true
tab_1.tabp_1.dw_ingre.triggerevent(rowfocuschanged!)
pb_save_not_ing.enabled=false
pb_not_ing.enabled=true
end event

type pb_not_ing from picturebutton within tp_2
integer x = 3561
integer y = 36
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Nota Contable"
end type

event clicked;if i_cam_ing then return
if tab_1.tabp_1.dw_ingre.rowcount()=0 then return
if not isnull(tab_1.tabp_1.dw_ingre.getitemstring(tab_1.tabp_1.dw_ingre.getrow(),'estado')) then return
if tab_1.tabp_1.dw_ingre.getitemstring(tab_1.tabp_1.dw_ingre.getrow(), 'contabil' )='C' then
	messagebox("Atención","Este ingreso ya fue contabilizado, no le puede agregar notas")
	return
end if
if not isnull(tab_1.tabp_1.dw_ingre.getitemstring(tab_1.tabp_1.dw_ingre.getrow(), 'codcaja_egr' )) then
	messagebox("Atención","Este ingreso ya fue consignado, no le puede agregar notas")
	return
end if
dw_det_not_ing.dataobject='dw_nota_cab_cpo'
dw_det_not_ing.modify('cab_concepto.width=1300')
dw_det_not_ing.settransobject(sqlca)
dw_det_not_ing.border=false
pb_save_not_ing.enabled=true
enabled=false
dw_det_not_ing.insertrow(1)
dw_det_not_ing.setitem(1,'cab_fecha',datetime(today()))
dw_det_not_ing.setitem(1,'cab_coddoc','NT')
dw_det_not_ing.setitem(1,'cab_clugar',clugar)
dw_det_not_ing.setitem(1,'cab_tiponota','I')
dw_det_not_ing.setitem(1,'cab_usuario',usuario)
pb_cancel_not_ing.visible=true
end event

type pb_save_not_ing from picturebutton within tp_2
integer x = 3561
integer y = 168
integer width = 146
integer height = 128
integer taborder = 130
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
string powertiptext = "Guardar Nota"
end type

event clicked;long nota,ning
dec valor
valor=dw_det_not_ing.getitemnumber(1,'cab_valor')
if valor=0 or isnull(valor) then return
if dw_det_not_ing.getitemnumber(1,'cab_clasenota')=-1 and valor > dw_detcaja.getitemnumber(1,"monto") then
	messagebox("Atención","El valor de la Nota es mayor al saldo actual de la caja")
	return
end if
if valor> tab_1.tabp_1.dw_ingre.getitemnumber(tab_1.tabp_1.dw_ingre.getrow(),'valor') then
	if messagebox("Atención","El monto de la nota es mayor al del ingreso. Desea continuar aún así ?.",question!,yesno!,2)=2 then return
end if
nota=f_trae_ndoc('NT',i_lugar,'Nota de Tesorería')
if nota=-1 then return -1
dw_det_not_ing.setitem(1,'cab_num_nota',nota)
	if dw_det_not_ing.update()=-1 then
	rollback;
	return -1
end if
ning=tab_1.tabp_1.dw_ingre.getitemnumber(tab_1.tabp_1.dw_ingre.getrow(),'ningreso')
INSERT INTO tesonotacpo ( CodDoc, clugar, NUM_nota, ITEM, valor, codcaja, CLugar_caja, CodDoc_caja, ningreso_caja )
values ('NT',:clugar,:nota,1,:valor,:i_caja,:i_lugar,'IM',:ning);
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en Tesonotacpo",sqlca.sqlerrtext)
	rollback;
	return -1
end if
valor=valor * dw_det_not_ing.getitemnumber(1,'cab_clasenota')

tab_1.tabp_1.dw_ingre.setitem(tab_1.tabp_1.dw_ingre.getrow(),'valor',tab_1.tabp_1.dw_ingre.getitemnumber(tab_1.tabp_1.dw_ingre.getrow(),'valor')+valor)
dec vdeb=0,vcred=0
if dw_det_not_ing.getitemnumber(1,'cab_clasenota')=-1 then
	vcred=-valor
else
	vdeb=valor
end if
choose case tab_1.tabp_1.dw_ingre.getitemstring(tab_1.tabp_1.dw_ingre.getrow(),'arqueo')
	case '0' //then 'Ingreso Directo'
		update tesopagodircab set tnotadeb=tnotadeb+:vdeb,tnotacred=tnotacred+:vcred
		where codcaja=:i_caja and clugar_caja=:i_lugar and coddoc_caja='IM' and ningreso_caja=:ning;
	case '1' //then 'Arqueo de Caja'
		update tesoarqueocab set recaudo=recaudo + :valor,tnotadeb=tnotadeb+:vdeb,tnotacred=tnotacred+:vcred
		where codcaja=:i_caja and clugar_caja=:i_lugar and coddoc_caja='IM' and ningreso_caja=:ning;
	case '2' //then 'Anticipo Contrato'
	case '3' //then 'Pago de cartera'
end choose
if sqlca.sqlcode=-1 or sqlca.sqlnrows=0 then
	messagebox("Error leyendo actualizando Origen del Ingreso",sqlca.sqlerrtext)
	rollback;
	return -1
end if
if tab_1.tabp_1.dw_ingre.update()=-1 then
	rollback;
	return
end if
commit;
enabled=false
pb_not_ing.enabled=true
dw_detcaja.retrieve(i_lugar,i_caja)
dw_det_not_ing.border=true
tab_1.tabp_1.dw_ingre.triggerevent(rowfocuschanged!)
pb_cancel_not_ing.visible=false
end event

type dw_det_not_ing from datawindow within tp_2
integer x = 32
integer y = 44
integer width = 3506
integer height = 772
integer taborder = 30
string title = "none"
string dataobject = "dw_det_nota_ing"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type st_7 from statictext within tabp_1
integer x = 37
integer y = 8
integer width = 718
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Ingresos de la Caja:"
boolean focusrectangle = false
end type

type cb_save_ing from picturebutton within tabp_1
event mousemove pbm_mousemove
integer x = 4274
integer y = 184
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Ingreso"
end type

event clicked;grabar()
end event

type cb_new_ing_manual from picturebutton within tabp_1
event mousemove pbm_mousemove
integer x = 4274
integer y = 48
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo Ingreso Directo"
end type

event clicked;if i_caja='' or i_lugar='' then
	messagebox("Atención","Debe escojer el lugar y la caja")
	dw_2.setfocus()
	return
end if
tab_ing.tp_1.dw_pagodir_cpo.dataobject='dw_tesopagodir_cpo'
tab_ing.tp_1.dw_pagodir_cpo.settransobject(sqlca)
i_cam_ing=true
cambio=true
tab_ing.tp_1.dw_pagodir.reset()
tab_ing.tp_1.dw_pagodir.visible=true
tab_ing.tp_1.dw_pagodir_cpo.reset()
tab_ing.tp_1.dw_pagodir.insertrow(1)
tab_ing.tp_1.dw_pagodir.setitem(1,"coddoc",'PD')
tab_ing.tp_1.dw_pagodir.setitem(1,"clugar",clugar)
tab_ing.tp_1.dw_pagodir.setitem(1,"usuario",usuario)
tab_ing.tp_1.dw_pagodir.setitem(1,"fecha",datetime(today()))
if idw_concep.rowcount()=1 then tab_ing.tp_1.dw_pagodir.setitem(1,"cartipo",idw_concep.getitemstring(1,'cartipo'))
tab_ing.tp_1.sle_concep.visible=true
tab_ing.tp_1.st_concep.visible=true
tab_ing.tp_1.pb_newdet.visible=true
tab_ing.tp_1.pb_deldet.visible=true
tab_ing.selectedtab=1
tab_ing.tp_2.enabled=false
tab_1.tabp_2.enabled=false
end event

type dw_ingre from datawindow within tabp_1
integer x = 41
integer y = 60
integer width = 4192
integer height = 532
integer taborder = 10
string title = "none"
string dataobject = "dw_caja_ingreso"
boolean hscrollbar = true
boolean vscrollbar = true
string icon = "Library5!"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;long fila,ning
fila=getrow()
if fila<1 then return
if i_cam_ing then return 1
string arqueo
arqueo = getitemstring(fila,"arqueo")
ning=getitemnumber(fila,"ningreso")
if tab_ing.tp_2.dw_det_not_ing.dataobject<>'dw_det_nota_ing' then
	tab_ing.tp_2.dw_det_not_ing.dataobject='dw_det_nota_ing'
	tab_ing.tp_2.dw_det_not_ing.settransobject(sqlca)
end if
tab_ing.tp_2.dw_det_not_ing.retrieve(i_caja,i_lugar,'IM',ning)
tab_ing.tp_1.dw_pagodir.reset()
if arqueo='0' and not i_cam_ing then
	tab_ing.tp_1.dw_pagodir.visible=true
	tab_ing.tp_1.dw_pagodir.retrieve(i_caja,i_lugar,'IM',ning)
else
	tab_ing.tp_1.dw_pagodir.visible=false
end if
if tab_ing.tp_1.dw_pagodir_cpo.dataobject='dw_tesopagodir_cpo' then
	tab_ing.tp_1.dw_pagodir_cpo.dataobject='dw_caja_ingreso_deta'
	tab_ing.tp_1.dw_pagodir_cpo.settransobject(sqlca)
end if
tab_ing.tp_1.dw_pagodir_cpo.retrieve(i_caja,i_lugar,getitemnumber(fila,"ningreso"))
end event

event rowfocuschanging;if i_cam_ing or tab_ing.tp_2.pb_save_not_ing.enabled then return 1
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event dberror;rollback;
return 0
end event

type tabp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4489
integer height = 1664
long backcolor = 67108864
string text = "Egresos"
long tabtextcolor = 33554432
string picturename = "oofl.ico"
long picturemaskcolor = 536870912
string powertiptext = "Egresos de la Caja"
pb_print_egr pb_print_egr
tab_egr tab_egr
st_6 st_6
cb_save_egr cb_save_egr
cb_anular_egr cb_anular_egr
cb_new_egr cb_new_egr
dw_egre dw_egre
end type

on tabp_2.create
this.pb_print_egr=create pb_print_egr
this.tab_egr=create tab_egr
this.st_6=create st_6
this.cb_save_egr=create cb_save_egr
this.cb_anular_egr=create cb_anular_egr
this.cb_new_egr=create cb_new_egr
this.dw_egre=create dw_egre
this.Control[]={this.pb_print_egr,&
this.tab_egr,&
this.st_6,&
this.cb_save_egr,&
this.cb_anular_egr,&
this.cb_new_egr,&
this.dw_egre}
end on

on tabp_2.destroy
destroy(this.pb_print_egr)
destroy(this.tab_egr)
destroy(this.st_6)
destroy(this.cb_save_egr)
destroy(this.cb_anular_egr)
destroy(this.cb_new_egr)
destroy(this.dw_egre)
end on

type pb_print_egr from pb_report within tabp_2
integer x = 3877
integer y = 436
integer taborder = 110
string powertiptext = "Reimprimir Egreso"
string cod_rep = "EM"
string nombre_rep = "Egreso de caja Mayor"
string tipo_rep = "documento!"
boolean dialogo = true
end type

event clicked;call super::clicked;if dw_egre.rowcount()>0 then
	any par[4]
	par[1]=i_caja
	par[2]=i_lugar
	par[3]='EM'
	par[4]=dw_egre.getitemnumber(dw_egre.getrow(),"nrcaja")
	imprimir(par,'','0')
end if
end event

type tab_egr from tab within tabp_2
event create ( )
event destroy ( )
integer x = 18
integer y = 488
integer width = 4005
integer height = 1152
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_3 tp_3
tp_4 tp_4
end type

on tab_egr.create
this.tp_3=create tp_3
this.tp_4=create tp_4
this.Control[]={this.tp_3,&
this.tp_4}
end on

on tab_egr.destroy
destroy(this.tp_3)
destroy(this.tp_4)
end on

type tp_3 from userobject within tab_egr
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3968
integer height = 1024
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "arq_deta.ico"
long picturemaskcolor = 536870912
gb_1 gb_1
gb_2 gb_2
st_det st_det
dw_pdtes dw_pdtes
em_tran em_tran
em_fecha em_fecha
st_3 st_3
sle_concepto sle_concepto
dw_banco dw_banco
st_4 st_4
st_2 st_2
dw_cuentas dw_cuentas
end type

on tp_3.create
this.gb_1=create gb_1
this.gb_2=create gb_2
this.st_det=create st_det
this.dw_pdtes=create dw_pdtes
this.em_tran=create em_tran
this.em_fecha=create em_fecha
this.st_3=create st_3
this.sle_concepto=create sle_concepto
this.dw_banco=create dw_banco
this.st_4=create st_4
this.st_2=create st_2
this.dw_cuentas=create dw_cuentas
this.Control[]={this.gb_1,&
this.gb_2,&
this.st_det,&
this.dw_pdtes,&
this.em_tran,&
this.em_fecha,&
this.st_3,&
this.sle_concepto,&
this.dw_banco,&
this.st_4,&
this.st_2,&
this.dw_cuentas}
end on

on tp_3.destroy
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.st_det)
destroy(this.dw_pdtes)
destroy(this.em_tran)
destroy(this.em_fecha)
destroy(this.st_3)
destroy(this.sle_concepto)
destroy(this.dw_banco)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.dw_cuentas)
end on

type gb_1 from groupbox within tp_3
integer x = 2665
integer y = 48
integer width = 1280
integer height = 956
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de La Consignación (Nueva)"
end type

type gb_2 from groupbox within tp_3
integer x = 2715
integer y = 412
integer width = 1193
integer height = 552
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle"
end type

type st_det from statictext within tp_3
integer width = 1006
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Consignaciones:"
boolean focusrectangle = false
end type

type dw_pdtes from datawindow within tp_3
integer x = 5
integer y = 60
integer width = 2592
integer height = 952
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_det_mov_banc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rbuttondown;if dataobject<>'dw_caja_ingreso_pdte' then return
st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event buttonclicked;long esco=0,j
if dwo.text='Deselec' then
	dwo.text='Selecc'
else
	esco=1
	dwo.text='Deselec'
end if
for j=1 to rowcount()
	setitem(j,'esco',esco)
next
end event

event dberror;rollback;
return 0
end event

type em_tran from editmask within tp_3
integer x = 2738
integer y = 808
integer width = 562
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxxxxxxxxxxx"
end type

type em_fecha from editmask within tp_3
integer x = 3387
integer y = 808
integer width = 370
integer height = 88
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

type st_3 from statictext within tp_3
integer x = 2738
integer y = 892
integer width = 379
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nro Transacción:"
boolean focusrectangle = false
end type

type sle_concepto from singlelineedit within tp_3
integer x = 2743
integer y = 472
integer width = 1138
integer height = 284
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type dw_banco from datawindow within tp_3
integer x = 2706
integer y = 132
integer width = 1207
integer height = 156
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_banco"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
i_banco=data
i_ncuenta=''
i_tcuenta=''
dw_cuentas.setitem(1,1,'')
dw_cuenta.retrieve(i_banco)
end event

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

type st_4 from statictext within tp_3
integer x = 3378
integer y = 896
integer width = 453
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Consignación:"
boolean focusrectangle = false
end type

type st_2 from statictext within tp_3
integer x = 2747
integer y = 756
integer width = 343
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Concepto"
boolean focusrectangle = false
end type

type dw_cuentas from datawindow within tp_3
integer x = 2706
integer y = 280
integer width = 1207
integer height = 152
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cuentas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
i_tcuenta=dw_cuenta.getitemstring(dw_cuenta.getrow(),"tipo_cuenta")
i_ncuenta=this.getitemstring(1,"numcuenta")
end event

event constructor;this.settransobject(sqlca)
this.getchild("numcuenta",dw_cuenta)
dw_cuenta.settransobject(sqlca)
dw_cuenta.insertrow(1)
this.insertrow(1)
end event

type tp_4 from userobject within tab_egr
integer x = 18
integer y = 112
integer width = 3968
integer height = 1024
boolean enabled = false
long backcolor = 67108864
string text = "Notas"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
string powertiptext = "Notas deel Egreso"
pb_cancel_not_egr pb_cancel_not_egr
pb_save_not_egr pb_save_not_egr
pb_not_egr pb_not_egr
dw_det_not_egr dw_det_not_egr
end type

on tp_4.create
this.pb_cancel_not_egr=create pb_cancel_not_egr
this.pb_save_not_egr=create pb_save_not_egr
this.pb_not_egr=create pb_not_egr
this.dw_det_not_egr=create dw_det_not_egr
this.Control[]={this.pb_cancel_not_egr,&
this.pb_save_not_egr,&
this.pb_not_egr,&
this.dw_det_not_egr}
end on

on tp_4.destroy
destroy(this.pb_cancel_not_egr)
destroy(this.pb_save_not_egr)
destroy(this.pb_not_egr)
destroy(this.dw_det_not_egr)
end on

type pb_cancel_not_egr from picturebutton within tp_4
boolean visible = false
integer x = 2834
integer y = 324
integer width = 142
integer height = 124
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "Cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar Creación de Nota"
end type

event clicked;visible=false
pb_not_egr.enabled=true
dw_det_not_egr.border=true
tab_1.tabp_2.dw_egre.triggerevent(rowfocuschanged!)
pb_save_not_egr.enabled=false
pb_not_egr.enabled=true
end event

type pb_save_not_egr from picturebutton within tp_4
integer x = 2834
integer y = 192
integer width = 146
integer height = 128
integer taborder = 140
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
string powertiptext = "Guardar Nota"
end type

event clicked;long nota,negr
dec valor
valor=dw_det_not_egr.getitemnumber(1,'cab_valor')
if valor=0 or isnull(valor) then return
if valor> tab_1.tabp_2.dw_egre.getitemnumber(tab_1.tabp_2.dw_egre.getrow(),'valor') then
	if messagebox("Atención","El monto de la nota es mayor al del ingreso. Desea continuar aún así ?.",question!,yesno!,2)=2 then return
end if
nota=f_trae_ndoc('NT',i_lugar,'Notas de Tesorería')
if nota=-1 then return -1
dw_det_not_egr.setitem(1,'cab_num_nota',nota)
	if dw_det_not_egr.update()=-1 then
	rollback;
	return -1
end if
negr=tab_1.tabp_2.dw_egre.getitemnumber(tab_1.tabp_2.dw_egre.getrow(),'nrcaja')
INSERT INTO tesonotacpo ( CodDoc, clugar, NUM_nota, ITEM, valor, codcaja_egre, CLugar_egre, CodDoc_egre, negreso )
values ('NT',:clugar,:nota,1,:valor,:i_caja,:i_lugar,'EM',:negr);
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en Tesonotacpo",sqlca.sqlerrtext)
	rollback;
	return -1
end if
valor=valor * dw_det_not_egr.getitemnumber(1,'cab_clasenota')
tab_1.tabp_2.dw_egre.setitem(tab_1.tabp_2.dw_egre.getrow(),'valor',tab_1.tabp_2.dw_egre.getitemnumber(tab_1.tabp_2.dw_egre.getrow(),'valor')+valor)
if tab_1.tabp_2.dw_egre.update()=-1 then
	rollback;
	return -1
end if
string cbanc,tcuenta,ncuenta,snull
long item,nnull
setnull(snull)
setnull(nnull)
cbanc=tab_1.tabp_2.dw_egre.getitemstring(tab_1.tabp_2.dw_egre.getrow(),'codbanco')
tcuenta=tab_1.tabp_2.dw_egre.getitemstring(tab_1.tabp_2.dw_egre.getrow(),'tipo_cuenta')
ncuenta=tab_1.tabp_2.dw_egre.getitemstring(tab_1.tabp_2.dw_egre.getrow(),'numcuenta')
item=tab_1.tabp_2.dw_egre.getitemnumber(tab_1.tabp_2.dw_egre.getrow(),'item')

update tesocuentasmovi set valor_notas=valor_notas + :valor
where codbanco=:cbanc and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and item=:item;
if sqlca.sqlcode=-1 or sqlca.sqlnrows=0 then
	messagebox("Error leyendo actualizando valor en tesocuentasmovi",sqlca.sqlerrtext)
	rollback;
	return -1
end if

commit;
this.enabled=false
pb_not_egr.enabled=true
dw_detcaja.retrieve(i_lugar,i_caja)
dw_det_not_egr.border=true
tab_1.tabp_2.dw_egre.triggerevent(rowfocuschanged!)

end event

type pb_not_egr from picturebutton within tp_4
integer x = 2834
integer y = 60
integer width = 142
integer height = 124
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Nota Contable"
end type

event clicked;if i_cam_egr then return
if tab_1.tabp_2.dw_egre.rowcount()=0 then return
if not isnull(tab_1.tabp_2.dw_egre.getitemstring(tab_1.tabp_2.dw_egre.getrow(), 'estado' )) then return
if tab_1.tabp_2.dw_egre.getitemstring(tab_1.tabp_2.dw_egre.getrow(), 'contabil' )='C' then 
	messagebox("Atención",'Este egreso ya fue contabilizado, no le puede agregar notas')
	return
end if
dw_det_not_egr.dataobject='dw_nota_cab_cpo'
dw_det_not_egr.modify('cab_concepto.width=1300')
dw_det_not_egr.settransobject(sqlca)
dw_det_not_egr.border=false
pb_save_not_egr.enabled=true
this.enabled=false
dw_det_not_egr.insertrow(1)
dw_det_not_egr.setitem(1,'cab_fecha',datetime(today()))
dw_det_not_egr.setitem(1,'cab_coddoc','NT')
dw_det_not_egr.setitem(1,'cab_clugar',clugar)
dw_det_not_egr.setitem(1,'cab_tiponota','E')
dw_det_not_egr.setitem(1,'cab_usuario',usuario)
pb_cancel_not_egr.visible=true
end event

type dw_det_not_egr from datawindow within tp_4
integer x = 46
integer y = 60
integer width = 2706
integer height = 852
integer taborder = 130
string title = "none"
string dataobject = "dw_det_nota_egr"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type st_6 from statictext within tabp_2
integer x = 23
integer y = 4
integer width = 850
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Egresos de la Caja:"
boolean focusrectangle = false
end type

type cb_save_egr from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 3877
integer y = 300
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Egreso"
end type

event clicked;grabar()
end event

type cb_anular_egr from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 3877
integer y = 180
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Anular Egreso"
end type

event clicked;if dw_egre.rowcount()=0 then return
long fila
fila=dw_egre.getrow()
if not isnull(dw_egre.getitemstring(fila,'estado')) then
	messagebox("Atención",'Este Egreso ya está anulado')
	return
end if
st_xa_anular st_anula
st_anula.tipo='TE'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
string banco,cuenta,tipocu,motiv1,snulo
dec valor
long nrcaj,item,nnulo
datetime fecha
fecha=datetime(today(),now())
setnull(snulo)
setnull(nnulo)
nrcaj=dw_egre.getitemnumber(fila,'nrcaja')
valor=dw_egre.getitemdecimal(fila,'valor')
banco=dw_egre.getitemstring(fila,'codbanco')
tipocu=dw_egre.getitemstring(fila,'tipo_cuenta')
cuenta=dw_egre.getitemstring(fila,'numcuenta')
item=dw_egre.getitemnumber(fila,'item')
update tesocajaingreso set codcaja_egr=null,clugar_egr=null,coddoc_egr=null,nrcaj_egr=null
where codcaja_egr=:i_caja and clugar_egr=:i_lugar and coddoc_egr='EM' and nrcaj_egr=:nrcaj;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando tesocajaingreso",sqlca.sqlerrtext)
	rollback;
	return
end if
motiv1=left('Anulación de Egreso nro '+string(nrcaj)+' :'+st_anula.observacion,255)
update tesocuentasmovi set usu_anula=:usuario,fecha_anula=:fecha,motiv_anula=:motiv1,cod_anula=:st_anula.motivo
where codbanco=:banco and tipo_cuenta=:tipocu and numcuenta=:cuenta and item=:item;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando tesocuentasmovi",sqlca.sqlerrtext)
	rollback;
	return
end if
dw_egre.setitem(fila,'estado',usuario)
dw_egre.setitem(fila,'fecha_anula',fecha)
dw_egre.setitem(fila,'motiv_anula',st_anula.observacion)
dw_egre.setitem(fila,'cod_anula',st_anula.motivo)
if dw_egre.update()=-1 then
	rollback;
	return
end if
commit;
dw_2.setcolumn('codcaja')
dw_2.triggerevent(itemchanged!)

end event

type cb_new_egr from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 3877
integer y = 48
integer width = 146
integer height = 128
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo Egreso (Consignación)"
end type

event clicked;if i_caja='' or i_lugar='' then
	messagebox("Atención","Debe escoger la caja Mayor del egreso")
	return
end if
tab_egr.tp_3.dw_pdtes.dataobject="dw_caja_ingreso_pdte"
tab_egr.tp_3.dw_pdtes.settransobject(sqlca)
if tab_egr.tp_3.dw_pdtes.retrieve(i_lugar,i_caja)>0 then
	tab_egr.tp_3.em_fecha.text=string(today(),"dd/mm/yyyy")
	tab_egr.tp_3.sle_concepto.enabled=true
	tab_egr.tp_3.em_tran.enabled=true
	tab_egr.tp_3.em_fecha.enabled=true
	cb_save_egr.enabled=true
	i_cam_egr=true
	tab_egr.tp_3.dw_banco.enabled=true
	cambio=true
	tab_egr.tp_3.st_det.text="Ingresos pendientes de Consignar:"
	this.enabled=false
	tab_egr.selectedtab=1
//	tab_egr.tp_4.enabled=false

else
	tab_egr.tp_3.dw_pdtes.dataobject="dw_det_mov_banc"
	tab_egr.tp_3.dw_pdtes.settransobject(sqlca)
	dw_egre.triggerevent(rowfocuschanged!)
	messagebox("Atención","No hay ingresos de esta caja pendientes por consignar")
end if
tab_1.tabp_1.enabled=false
end event

type dw_egre from datawindow within tabp_2
integer x = 18
integer y = 56
integer width = 3845
integer height = 412
integer taborder = 70
string title = "none"
string dataobject = "dw_caja_egreso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;long fila
fila=getrow()
if fila<1 then return
string cbanco,tcuenta,ncuenta,l_clug
long item
cbanco=getitemstring(fila,"codbanco")
tcuenta=getitemstring(fila,"tipo_cuenta")
ncuenta=getitemstring(fila,"numcuenta")
item=getitemnumber(fila,"item")
l_clug=getitemstring(fila,"clugar")
if tab_egr.tp_3.dw_pdtes.dataobject<>'dw_det_mov_banc' then
	tab_egr.tp_3.dw_pdtes.dataobject='dw_det_mov_banc'
	tab_egr.tp_3.dw_pdtes.settransobject(sqlca)
end if
tab_egr.tp_3.dw_pdtes.retrieve(cbanco,tcuenta,ncuenta,item,l_clug)
if tab_egr.tp_4.dw_det_not_egr.dataobject<>'dw_det_nota_egr' then
	tab_egr.tp_4.dw_det_not_egr.dataobject='dw_det_nota_egr'
	tab_egr.tp_4.dw_det_not_egr.settransobject(sqlca)
end if
tab_egr.tp_4.dw_det_not_egr.retrieve(i_caja,i_lugar,'EM',getitemnumber(fila,'nrcaja'))

end event

event rowfocuschanging;if tab_egr.tp_4.pb_save_not_egr.enabled or i_cam_egr then return 1
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event dberror;rollback;
return 0
end event

type dw_movidet from datawindow within w_movimiento_caja_mayor
boolean visible = false
integer x = 846
integer y = 188
integer width = 1838
integer height = 68
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_movidet"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

