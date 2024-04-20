$PBExportHeader$w_orden_pago2.srw
forward
global type w_orden_pago2 from window
end type
type pb_search from picturebutton within w_orden_pago2
end type
type dw_anula from datawindow within w_orden_pago2
end type
type dw_histo_desde from datawindow within w_orden_pago2
end type
type st_3 from statictext within w_orden_pago2
end type
type st_4 from statictext within w_orden_pago2
end type
type pb_print from pb_report within w_orden_pago2
end type
type pb_anular from picturebutton within w_orden_pago2
end type
type dw_cab from datawindow within w_orden_pago2
end type
type pb_1 from picturebutton within w_orden_pago2
end type
type dw_terce from datawindow within w_orden_pago2
end type
type tab_2 from tab within w_orden_pago2
end type
type t2_1 from userobject within tab_2
end type
type st_7 from statictext within t2_1
end type
type dw_orig from datawindow within t2_1
end type
type pb_new_desde_recep from picturebutton within t2_1
end type
type dw_pend from datawindow within t2_1
end type
type t2_1 from userobject within tab_2
st_7 st_7
dw_orig dw_orig
pb_new_desde_recep pb_new_desde_recep
dw_pend dw_pend
end type
type t2_2 from userobject within tab_2
end type
type pb_imp_cheque from picturebutton within t2_2
end type
type pb_consigna from picturebutton within t2_2
end type
type cbx_auto from checkbox within t2_2
end type
type pb_print_auto from pb_report within t2_2
end type
type pb_anula_cheque from picturebutton within t2_2
end type
type st_6 from statictext within t2_2
end type
type dw_cheques from datawindow within t2_2
end type
type st_5 from statictext within t2_2
end type
type st_2 from statictext within t2_2
end type
type pb_del_cheque from picturebutton within t2_2
end type
type pb_new_cheque from picturebutton within t2_2
end type
type pb_del_det from picturebutton within t2_2
end type
type pb_new_det from picturebutton within t2_2
end type
type dw_det_pago from datawindow within t2_2
end type
type cbx_1 from checkbox within t2_2
end type
type pb_save from picturebutton within t2_2
end type
type dw_fpago from datawindow within t2_2
end type
type t2_2 from userobject within tab_2
pb_imp_cheque pb_imp_cheque
pb_consigna pb_consigna
cbx_auto cbx_auto
pb_print_auto pb_print_auto
pb_anula_cheque pb_anula_cheque
st_6 st_6
dw_cheques dw_cheques
st_5 st_5
st_2 st_2
pb_del_cheque pb_del_cheque
pb_new_cheque pb_new_cheque
pb_del_det pb_del_det
pb_new_det pb_new_det
dw_det_pago dw_det_pago
cbx_1 cbx_1
pb_save pb_save
dw_fpago dw_fpago
end type
type t2_3 from userobject within tab_2
end type
type st_9 from statictext within t2_3
end type
type dw_rte from datawindow within t2_3
end type
type st_8 from statictext within t2_3
end type
type dw_cpo from datawindow within t2_3
end type
type st_1 from statictext within t2_3
end type
type t2_3 from userobject within tab_2
st_9 st_9
dw_rte dw_rte
st_8 st_8
dw_cpo dw_cpo
st_1 st_1
end type
type tab_2 from tab within w_orden_pago2
t2_1 t2_1
t2_2 t2_2
t2_3 t2_3
end type
end forward

global type w_orden_pago2 from window
string tag = "Insertó una nueva Orden de Pago o modificó alguna existente, desea guardar los cambios?."
integer width = 6208
integer height = 2320
boolean titlebar = true
string title = "Ordenes de Pago"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_ordenp.ico"
pb_search pb_search
dw_anula dw_anula
dw_histo_desde dw_histo_desde
st_3 st_3
st_4 st_4
pb_print pb_print
pb_anular pb_anular
dw_cab dw_cab
pb_1 pb_1
dw_terce dw_terce
tab_2 tab_2
end type
global w_orden_pago2 w_orden_pago2

type variables
long i_npago
string i_clug_npago,i_emp
datawindowchild idw_concep,idw_cuenta,idw_orig,idw_iva2,idw_cta2
boolean i_cambio,i_nueva
string i_cdoc='PT',ls_dctos
int i_dec_gral,i_aprox_gral
end variables

forward prototypes
public function integer cambia_ter (string p_tdoc, string p_docu)
public function integer f_save_tax ()
public function integer f_pregunta ()
public function integer grabar ()
public subroutine muestra_det (datawindow p_dw)
end prototypes

public function integer cambia_ter (string p_tdoc, string p_docu);////apenas resetea y trae los datos
tab_2.t2_1.dw_pend.reset()
dw_histo_desde.reset()
dw_cab.setredraw(false)
dw_histo_desde.retrieve(dw_terce.getitemstring(1,'tipodoc'),dw_terce.getitemstring(1,'documento'))
tab_2.t2_1.dw_orig.event itemchanged(1,tab_2.t2_1.dw_orig.object.codigo,tab_2.t2_1.dw_orig.getitemstring(1,1))
dw_cab.setredraw(true)
return 1
end function

public function integer f_save_tax ();return 1
end function

public function integer f_pregunta ();if not i_cambio then return 2
return messagebox("Atención, realizó cambios",tag,question!,yesnocancel!,3)
end function

public function integer grabar ();if not i_cambio and not i_nueva then return 1
if tab_2.t2_2.dw_det_pago.getitemnumber(1,'t_pagar')<>dw_cab.getitemnumber(1,'tneto') then
	messagebox("Atención","El total del detalle de la forma de pago es diferente al Neto a Pagar")
	return -1
end if
if tab_2.t2_2.dw_det_pago.find('isnull(codbanco) or codbanco="" or isnull(numcuenta) or numcuenta=""',1,tab_2.t2_2.dw_det_pago.rowcount())>0 then
	messagebox("Atención","Debe escoger las entidades Bancarias y sus cuentas")
	return -1
end if
tab_2.t2_2.dw_fpago.setredraw(false)
tab_2.t2_2.dw_fpago.setfilter("")
tab_2.t2_2.dw_fpago.filter()
if tab_2.t2_2.dw_fpago.find('round(valor,0)=0',1,tab_2.t2_2.dw_fpago.rowcount())>0 then
	messagebox("Atención",'Los valores de las formas de pago no pueden ser cero')
	tab_2.t2_2.dw_det_pago.event rowfocuschanged(tab_2.t2_2.dw_det_pago.getrow())
	tab_2.t2_2.dw_fpago.setredraw(true)
	return -1
end if
if tab_2.t2_2.dw_fpago.find('posfechado="1" and isnull(fecha_cobrar)',1,tab_2.t2_2.dw_fpago.rowcount())>0 then
	messagebox("Atención",'Las fechas de pago de los cheques posfechados no pueden ser nulas')
	tab_2.t2_2.dw_det_pago.event rowfocuschanged(tab_2.t2_2.dw_det_pago.getrow())
	tab_2.t2_2.dw_fpago.setredraw(true)
	return -1
end if

tab_2.t2_2.dw_det_pago.event rowfocuschanged(tab_2.t2_2.dw_det_pago.getrow())
tab_2.t2_2.dw_fpago.setredraw(true)
long ngasto,j,k,item,ngiro=0,nnulo
string banco,tcuenta,ncuenta,detalle,tdoc,doc,clug_giro,cdoc_giro,snulo
datetime hoy,fecha
dec valor,total
any parm[3]
ngasto=f_trae_ndoc(i_cdoc,clugar,'Ordenes de Pago')
setnull(snulo)
setnull(nnulo)
if ngasto=-1 then
	rollback;
	return -1
end if
dw_cab.setitem(1,'ntransferencia',ngasto)
dw_cab.setitem(1,'usuario',usuario)
total=round(dw_cab.getitemnumber(1,'tneto'),2)
if dw_cab.update(true,false)=-1 then
	rollback;
	return -1
end if
string err
detalle=dw_cab.getitemstring(1,'detalle')
tdoc=dw_cab.getitemstring(1,'tipodoc')
doc=dw_cab.getitemstring(1,'documento')
fecha=dw_cab.getitemdatetime(1,'fecha')
hoy=datetime(today())
long nrel,item_rel
string clug_rel,cdoc_rel

long ncont,ano,otrosi,ante=0
dec monto,dctos
for j=1 to tab_2.t2_3.dw_cpo.rowcount()
	tab_2.t2_3.dw_cpo.setitem(j,'ntransferencia',ngasto)
	valor=tab_2.t2_3.dw_cpo.getitemdecimal(j,'neto')
	dctos=tab_2.t2_3.dw_cpo.getitemdecimal(j,'t_dsctos')
	nrel=tab_2.t2_3.dw_cpo.getitemnumber(j,'nrelacion')
	item_rel=tab_2.t2_3.dw_cpo.getitemnumber(j,'item_rel')
	cdoc_rel=tab_2.t2_3.dw_cpo.getitemstring(j,'coddoc_rel')
	clug_rel=tab_2.t2_3.dw_cpo.getitemstring(j,'clugar_rel')
	if not isnull(nrel) then
		update tesorelfact set v_pagado=v_pagado+:valor, tdescuentos_op=tdescuentos_op+:dctos
		where clugar=:clug_rel and coddoc=:cdoc_rel and nrelacion=:nrel;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error Actualizando TesoRelFact",err)
			return -1
		end if
		update tesorelfactcpo set v_pagado=v_pagado+:valor ,en_destino='1' , tdescuentos_op=tdescuentos_op+:dctos
		where  clugar=:clug_rel and coddoc=:cdoc_rel and nrelacion=:nrel and item=:item_rel;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error Actualizando TesoRelFactCpo",err)
			return -1
		end if
	end if
	ncont=tab_2.t2_3.dw_cpo.getitemnumber(j,'ncontrato')
	if not isnull(ncont) then //interface con contratos
		ano=tab_2.t2_3.dw_cpo.getitemnumber(j,'ano')
		otrosi=tab_2.t2_3.dw_cpo.getitemnumber(j,'otrosi')
		monto=tab_2.t2_3.dw_cpo.getitemnumber(j,'v_bruto')
		update contra set acum_pago=acum_pago +:monto 
		where ano=:ano and ncontrato=:ncont and otrosi=:otrosi;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error actualizando Monto Pagado de CONTRA",err)
			return -1
		end if
	end if
	if tab_2.t2_1.dw_orig.getitemstring(1,1)='PTPG-' then
		ngiro=tab_2.t2_3.dw_cpo.getitemnumber(j,'ngiro')
		cdoc_giro=tab_2.t2_3.dw_cpo.getitemstring(j,'cdoc_giro')
		clug_giro=tab_2.t2_3.dw_cpo.getitemstring(j,'clug_giro')
		update pre_docu_cb set en_destino='1' 
		where coddoc=:cdoc_giro and clugar=:clug_giro and numdoc=:ngiro;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error actualizando en_destino de Pre_Docu_Cb",err)
			return -1
		end if
		if ante<>ngiro then
			ante=ngiro
			long nitem
			select max(item) into :nitem from mod_relacion_origen
			where codigo='PTPG-';
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error leyendo Mod_Relacion_Origen",err)
				return -1
			end if
			if isnull(nitem) then nitem=0
			nitem ++
			insert into mod_relacion_origen (codigo,item,char_doc1,char_doc2,num_doc1,char_orig1,char_orig2,num_orig1,valor)
			values ('PTPG-',:nitem,:clugar,:i_cdoc,:ngasto,:cdoc_giro,:clug_giro,:ngiro,:total);
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error Insertando en Mod_Relacion_Origen",err)
				return -1
			end if
		end if
	end if
next
if tab_2.t2_3.dw_cpo.update(true,false)=-1 then 
	rollback;
	return -1
end if	
tab_2.t2_3.dw_rte.setfilter('')
tab_2.t2_3.dw_rte.filter()
for j=1 to tab_2.t2_3.dw_rte.rowcount()
	tab_2.t2_3.dw_rte.setitem(j,'ntransferencia',ngasto)
next
if tab_2.t2_3.dw_rte.update(true,false)=-1 then 
	rollback;
	return -1		
end if
dec v_item,v_item_posf
long nro_auto
for j=1 to tab_2.t2_2.dw_det_pago.rowcount()
	tab_2.t2_2.dw_det_pago.setrow(j)
	tab_2.t2_2.dw_det_pago.event rowfocuschanged(j)
	tcuenta=tab_2.t2_2.dw_det_pago.getitemstring(j,'tipo_cuenta')
	ncuenta=tab_2.t2_2.dw_det_pago.getitemstring(j,'numcuenta')
	banco=tab_2.t2_2.dw_det_pago.getitemstring(j,'codbanco')
	v_item=tab_2.t2_2.dw_det_pago.getitemnumber(j,'valor')
	v_item_posf=tab_2.t2_2.dw_det_pago.getitemnumber(j,'valor_posf')
	select max(item) into :item from tesocuentasmovi where CodBanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and clugar=:clugar;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox("Error leyendo tesocuentasmovi",err)
		return -1
	end if
	if isnull(item) then item=0
	item ++
	INSERT INTO tesocuentasmovi ( CodBanco, tipo_cuenta, numcuenta,clugar, item, fecha, detalle, usuario, TipoDoc, documento, tipo_trans ,clugar_trans,coddoc_trans,ntransferencia,valor,valor_posf,valor_posf_pago,valor_notas,signo)
	values(:banco,:tcuenta,:ncuenta,:clugar,:item,:fecha,:detalle,:usuario,:tdoc,:doc,'R',:i_clug_npago,:i_cdoc,:ngasto,:v_item,:v_item_posf,0,0,-1);
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox("Error insertando en tesocuentasmovi",err)
		return -1
	end if

	for k=1 to tab_2.t2_2.dw_fpago.rowcount()
		tab_2.t2_2.dw_fpago.setitem(k,'item',item)
		tab_2.t2_2.dw_fpago.setitem(k,'codbanco',banco)
		tab_2.t2_2.dw_fpago.setitem(k,'tipo_cuenta',tcuenta)
		tab_2.t2_2.dw_fpago.setitem(k,'numcuenta',ncuenta)
		tab_2.t2_2.dw_fpago.setitem(k,'clugar',clugar)		
		if tab_2.t2_2.dw_fpago.getitemstring(k,'forma')='A' then //autorizacion
			nro_auto=f_trae_ndoc('AUTB',clugar,'Autorización a Banco para pago con Cheque de Gerencia')
			if nro_auto=-1 then 
				rollback;
				return -1
			end if
			tab_2.t2_2.dw_fpago.setitem(k,'cdoc_auto','AUTB')
			tab_2.t2_2.dw_fpago.setitem(k,'clug_auto',clugar)
			tab_2.t2_2.dw_fpago.setitem(k,'nro_autoriza',nro_auto)
			if tab_2.t2_2.pb_print_auto.tag='' and tab_2.t2_2.cbx_auto.checked then
				
				parm[1]='AUTB'
				parm[2]=clugar
				parm[3]=nro_auto
				tab_2.t2_2.pb_print_auto.imprimir(parm,'','0')
			end if
		end if
		
	next
next
if tab_2.t2_2.dw_fpago.update(true,false)=-1 then return -1
if tab_2.t2_1.dw_orig.getitemstring(1,1)='PTPT-' then
	j=tab_2.t2_1.dw_pend.find('esco=1',1,tab_2.t2_1.dw_pend.rowcount())
	tab_2.t2_1.dw_pend.setitem(j,'clug_pago',clugar)
	tab_2.t2_1.dw_pend.setitem(j,'cdoc_pago',i_cdoc)
	tab_2.t2_1.dw_pend.setitem(j,'npago',ngasto)
	if tab_2.t2_1.dw_pend.update(true,false)=-1 then return -1//no es necesario el resetupdate porque a lo ultimo se le hace retrieve
end if

commit;
idw_cuenta.retrieve(i_emp)
if i_nueva and tab_2.t2_2.cbx_1.checked then
	any par[3]
	par[1]=clugar
	par[2]=i_cdoc
	par[3]=ngasto
	pb_print.imprimir(par,'','0')
end if
i_cambio=false
i_nueva=false

dw_histo_desde.reset()
dw_histo_desde.retrieve(dw_terce.getitemstring(1,'tipodoc'),dw_terce.getitemstring(1,'documento'))
tab_2.t2_1.dw_pend.retrieve(dw_terce.getitemstring(1,'tipodoc'),dw_terce.getitemstring(1,'documento'))

return 1
end function

public subroutine muestra_det (datawindow p_dw);dw_cab.reset()
tab_2.t2_2.dw_fpago.reset()
tab_2.t2_3.dw_cpo.reset()
tab_2.t2_2.dw_det_pago.reset()

if p_dw.getrow()<1 then return
i_npago=p_dw.getitemnumber(p_dw.getrow(),'ntransferencia')
i_clug_npago=p_dw.getitemstring(p_dw.getrow(),'clugar')
dw_cab.retrieve(i_clug_npago,i_cdoc,i_npago)
tab_2.t2_2.dw_fpago.retrieve(i_clug_npago,i_cdoc,i_npago)
tab_2.t2_2.dw_det_pago.retrieve(i_clug_npago,i_cdoc,i_npago)
tab_2.t2_3.dw_cpo.retrieve(i_clug_npago,i_cdoc,i_npago)

end subroutine

on w_orden_pago2.create
this.pb_search=create pb_search
this.dw_anula=create dw_anula
this.dw_histo_desde=create dw_histo_desde
this.st_3=create st_3
this.st_4=create st_4
this.pb_print=create pb_print
this.pb_anular=create pb_anular
this.dw_cab=create dw_cab
this.pb_1=create pb_1
this.dw_terce=create dw_terce
this.tab_2=create tab_2
this.Control[]={this.pb_search,&
this.dw_anula,&
this.dw_histo_desde,&
this.st_3,&
this.st_4,&
this.pb_print,&
this.pb_anular,&
this.dw_cab,&
this.pb_1,&
this.dw_terce,&
this.tab_2}
end on

on w_orden_pago2.destroy
destroy(this.pb_search)
destroy(this.dw_anula)
destroy(this.dw_histo_desde)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.pb_print)
destroy(this.pb_anular)
destroy(this.dw_cab)
destroy(this.pb_1)
destroy(this.dw_terce)
destroy(this.tab_2)
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

event open;select cod_empresa into :i_emp from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
	close(this)
	return
end if
if isnull(i_emp) then
	messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
	close(this)
	return
end if
idw_concep.retrieve(i_emp,'0')
idw_cuenta.retrieve(i_emp)
//tab_2.t2_2.pb_imp_cheque.inicia('interno!','CHEQ',clugar)
//if tab_2.t2_2.pb_print_auto.inicia('documento!','AUTB',clugar)=-1 then tab_2.t2_2.pb_print_auto.tag='!'
SELECT ENTERO into :i_dec_gral
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

type pb_search from picturebutton within w_orden_pago2
integer x = 3433
integer y = 32
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
string picturename = "lupa.gif"
string powertiptext = "Buscar Recepción"
end type

event clicked;openwithparm(w_busca_recep,'opago')
end event

type dw_anula from datawindow within w_orden_pago2
boolean visible = false
integer x = 1481
integer y = 184
integer width = 558
integer height = 56
integer taborder = 50
string title = "none"
string dataobject = "dw_anula_flujo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_histo_desde from datawindow within w_orden_pago2
integer x = 18
integer y = 248
integer width = 4352
integer height = 616
integer taborder = 45
string title = "none"
string dataobject = "dw_transferencias_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;muestra_det(this)
tab_2.t2_2.enabled=true
end event

event rowfocuschanging;choose case f_pregunta()
	case 1
		if grabar()=-1 then return 1
	case 2
		i_cambio=false
		i_nueva=false
	case 3
		return 1
end choose
return 0
end event

type st_3 from statictext within w_orden_pago2
integer x = 23
integer y = 192
integer width = 1312
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Pagos desde Radicaciones del Tercero:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_orden_pago2
integer x = 4430
integer y = 184
integer width = 379
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle del Pago:"
boolean focusrectangle = false
end type

type pb_print from pb_report within w_orden_pago2
integer x = 2144
integer y = 860
integer taborder = 31
string powertiptext = "Reimprimir Orden de Pago"
string cod_rep = "PT"
string nombre_rep = "Orden de Pago"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if i_nueva then return
any par[3]
if dw_histo_desde.rowcount()=0 then return
par[1]=dw_histo_desde.getitemstring(dw_histo_desde.getrow(),'clugar')
par[2]=i_cdoc
par[3]=dw_histo_desde.getitemnumber(dw_histo_desde.getrow(),'ntransferencia')
imprimir(par,'','0')
end event

type pb_anular from picturebutton within w_orden_pago2
integer x = 1989
integer y = 864
integer width = 146
integer height = 128
integer taborder = 21
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "Anular Orden de Pago"
end type

event clicked;if dw_cab.rowcount()=0 then return
if not isnull(dw_cab.getitemstring(1,'estado')) then
	messagebox("Atención",'Esta orden de pago ya fue anulada')
	return
end if
if dw_cab.getitemstring(1,'en_destino')='1' then
	messagebox("Atención",'Esta orden de pago ya fue utilizada por el Módulo al que se dirigía, debe primero anular el movimiento allá para poder continuar')
	return
end if
//la contabilizada de tesorelfact no importa porque de alla solo se van a sacar las causaciones de los impuestos.
if dw_cab.getitemstring(1,'contabil')='C' then
	messagebox("Atención",'Esta orden de pago ya fue contabilizada ,debe primero anular el asiento contable para poder continuar')
	return
end if
st_xa_anular st_anula
st_anula.tipo='TE'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
datetime fecha
fecha=datetime(today(),now())
dw_cab.setitem(1,'estado',usuario)
dw_cab.setitem(1,'fecha_anula',fecha)
dw_cab.setitem(1,'motiv_anula',st_anula.observacion)
dw_cab.setitem(1,'cod_anula',st_anula.motivo)
long j
datawindow dw_t
dw_t=tab_2.t2_3.dw_cpo
string clug_rad,cdoc_rad,snulo
long nrad,ano,ncont,otrosi,item_rad,nnulo
setnull(nnulo)
setnull(snulo)
dec valor,dsctos
for j=1 to dw_t.rowcount()
	nrad=dw_t.getitemnumber(j,'nrelacion')
	if not isnull(nrad) then
		valor=dw_t.getitemnumber(j,'neto')
		dsctos=dw_t.getitemnumber(j,'t_dsctos')
		clug_rad=dw_t.getitemstring(j,'clugar_rel')
		cdoc_rad=dw_t.getitemstring(j,'coddoc_rel')
		item_rad=dw_t.getitemnumber(j,'item_rel')
		update tesorelfact set v_pagado=v_pagado - :valor,tdescuentos_op=tdescuentos_op - :dsctos
		where clugar=:clug_rad and coddoc=:cdoc_rad and nrelacion=:nrad;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando v_pagado de TesoRelFact",sqlca.sqlerrtext)
			goto error
		end if
		update tesorelfactcpo set v_pagado=v_pagado - :valor,en_destino='0', tdescuentos_op= tdescuentos_op - :dsctos
		where clugar=:clug_rad and coddoc=:cdoc_rad and nrelacion=:nrad and item=:item_rad;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando v_pagado de TesoRelFactCpo",sqlca.sqlerrtext)
			goto error
		end if
	end if
	ncont=dw_t.getitemnumber(j,'ncontrato')
	if not isnull(ncont) then
		valor=dw_t.getitemnumber(j,'v_bruto')
		otrosi=dw_t.getitemnumber(j,'otrosi')
		ano=dw_t.getitemnumber(j,'ano')
		update contra set acum_pago=acum_pago -:valor where
		ano=:ano and ncontrato=:ncont and otrosi=:otrosi;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando Acum_Cobro de Contra",sqlca.sqlerrtext)
			goto error
		end if
	end if
next
string cbanco,tcuenta,ncuenta,motiv
long item
dec vposf,vposfpago
dw_t=tab_2.t2_2.dw_det_pago
for j=1 to dw_t.rowcount()
	cbanco=dw_t.getitemstring(j,'codbanco')
	tcuenta=dw_t.getitemstring(j,'tipo_cuenta')
	ncuenta=dw_t.getitemstring(j,'numcuenta')
	item=dw_t.getitemnumber(j,'item')
	motiv='Anulación de la orden de pago '+string(dw_cab.getitemnumber(1,'ntransferencia'))+left(st_anula.observacion,255)
	update tesocuentasmovi set usu_anula=:usuario,fecha_anula=:fecha,motiv_anula=:motiv,cod_anula=:st_anula.motivo where
	codbanco=:cbanco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and item=:item;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando estado de TesoCuentasMovi",sqlca.sqlerrtext)
		goto error
	end if
	vposf=dw_t.getitemnumber(j,'valor_posf')
	vposfpago=dw_t.getitemnumber(j,'valor_posf_pago')
	if isnull(vposf) then vposf=0
	if isnull(vposfpago) then vposfpago=0
	valor=dw_t.getitemnumber(j,'valor') - vposf + vposfpago
next
if dw_cab.getitemstring(1,'cod_flujo')='PTPG-' then
	dw_anula.retrieve('PTPG-',dw_cab.getitemstring(1,'clugar'),i_cdoc,dw_cab.getitemnumber(1,'ntransferencia'))
	long ngiro
	string clug_giro,cdoc_giro
	for j=1 to dw_anula.rowcount()
		ngiro=dw_anula.getitemnumber(j,'num_orig1')
		clug_giro=dw_anula.getitemstring(j,'char_orig2')
		cdoc_giro=dw_anula.getitemstring(j,'char_orig1')
		update pre_docu_cb set en_destino='0' where coddoc=:cdoc_giro and clugar=:clug_giro and numdoc=:ngiro;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando Pre_docu_CB",sqlca.sqlerrtext)
			goto error
		end if
	next
end if
update tesocuentamovdet_cheque set clug_pago=null ,cdoc_pago=null,npago=null where
clug_pago=:i_clug_npago and npago=:i_npago;
if sqlca.sqlcode=-1 then
	messagebox('Error actualizando tesocuentamovdet_cheque',sqlca.sqlerrtext)
	goto error
end if
if dw_cab.update()=-1 then goto error
commit;
idw_cuenta.retrieve(i_emp)
tab_2.t2_1.dw_pend.retrieve(dw_terce.getitemstring(1,'tipodoc'),dw_terce.getitemstring(1,'documento'))
dw_histo_desde.setitem(dw_histo_desde.getrow(),'estado',usuario)
return 1

error:
rollback;
return -1
end event

type dw_cab from datawindow within w_orden_pago2
event p_itemchanged ( )
integer x = 4402
integer y = 252
integer width = 1737
integer height = 656
integer taborder = 20
string title = "none"
string dataobject = "dw_tesotranscab"
boolean border = false
boolean livescroll = true
end type

event p_itemchanged();accepttext()
long j

end event

event constructor;settransobject(sqlca)
end event

event itemchanged;if getcolumnname()='detalle' or getcolumnname()='fecha' then
	accepttext()
	return
end if
post event p_itemchanged()
i_cambio=true
end event

event dberror;rollback;
return 0
end event

type pb_1 from picturebutton within w_orden_pago2
integer x = 3237
integer y = 32
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &b"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar Tercero [Alt+B]"
end type

event clicked;choose case f_pregunta()
	case 1
		if grabar()=-1 then return 1
	case 2
		i_cambio=false
		i_nueva=false
	case 3
		return 1
end choose
g_tercerodesde=1
openwithparm(w_buscater,dw_terce)
dw_terce.setcolumn('documento')
dw_terce.triggerevent(itemchanged!)
end event

type dw_terce from datawindow within w_orden_pago2
integer x = 18
integer y = 32
integer width = 3191
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event itemchanged;choose case f_pregunta()
	case 1
		if grabar()=-1 then return 1
	case 2
		i_cambio=false
		i_nueva=false
	case 3
		return 1
end choose
accepttext()
string doc,tdoc
tdoc=getitemstring(1,"tipodoc")
doc=getitemstring(1,"documento")
string snulo
setnull(snulo)
if getcolumnname()="tipodoc" and doc <> "" then
	setitem(1,"documento",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,'persona',snulo)
	return
end if
if getcolumnname()="documento" and doc = "" then 
	setitem(1,'nombre1',snulo)
	setitem(1,'persona',snulo)
end if
if getcolumnname()="documento" and doc <> "" then
	if retrieve(tdoc,doc)=0 then
		insertrow(1)
		setitem(1,1,tdoc)
		setitem(1,2,doc)
		messagebox("Atención",'Tercero no existe')
	else
		cambia_ter(tdoc,doc)
	end if
end if
end event

event constructor;settransobject(sqlca)
modify('tipodoc.validationmsg="No puede cambiar el tercero sin guardar"')
modify('documento.validationmsg="Tercero no existe o ya no lo puede cambiar sin guardar"')
insertrow(1)
end event

type tab_2 from tab within w_orden_pago2
integer x = 23
integer y = 888
integer width = 6107
integer height = 1312
integer taborder = 30
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
t2_1 t2_1
t2_2 t2_2
t2_3 t2_3
end type

on tab_2.create
this.t2_1=create t2_1
this.t2_2=create t2_2
this.t2_3=create t2_3
this.Control[]={this.t2_1,&
this.t2_2,&
this.t2_3}
end on

on tab_2.destroy
destroy(this.t2_1)
destroy(this.t2_2)
destroy(this.t2_3)
end on

type t2_1 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 6071
integer height = 1184
long backcolor = 67108864
string text = "Pendientes de Cobrar"
long tabtextcolor = 33554432
string picturename = "caja_menor.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las radicaciones de Facturas o Cuentas de Cobro pendientes de pago del Tercero"
st_7 st_7
dw_orig dw_orig
pb_new_desde_recep pb_new_desde_recep
dw_pend dw_pend
end type

on t2_1.create
this.st_7=create st_7
this.dw_orig=create dw_orig
this.pb_new_desde_recep=create pb_new_desde_recep
this.dw_pend=create dw_pend
this.Control[]={this.st_7,&
this.dw_orig,&
this.pb_new_desde_recep,&
this.dw_pend}
end on

on t2_1.destroy
destroy(this.st_7)
destroy(this.dw_orig)
destroy(this.pb_new_desde_recep)
destroy(this.dw_pend)
end on

type st_7 from statictext within t2_1
integer x = 23
integer y = 20
integer width = 320
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Origen (Flujo):"
boolean focusrectangle = false
end type

type dw_orig from datawindow within t2_1
integer x = 334
integer y = 8
integer width = 1403
integer height = 84
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_origenes"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('codigo',idw_orig)
idw_orig.settransobject(sqlca)
idw_orig.retrieve(i_cdoc)
insertrow(1)
if idw_orig.rowcount()=1 then setitem(1,1,idw_orig.getitemstring(1,'codigo'))


end event

event itemchanged;if isnull(data) or data='' then return
choose case data
	case 'PTRFCPG','PTRFCAPCM','PTRFCRP','PTRFC-'
		if dw_pend.dataobject<>'dw_intfaz_rel_opago' then
			dw_pend.dataobject='dw_intfaz_rel_opago'
			dw_pend.settransobject(sqlca)
		end if
	case 'PTPG-'
		if dw_pend.dataobject<>'dw_intfaz_giro_opago' then
			dw_pend.dataobject='dw_intfaz_giro_opago'
			dw_pend.settransobject(sqlca)
		end if
	case 'PTPT-'
		if dw_pend.dataobject<>'dw_rel_cheq_consig' then
			dw_pend.dataobject='dw_rel_cheq_consig'
			dw_pend.settransobject(sqlca)
		end if
	case 'PTNM-'
		open(w_pago_nomina)
	case else
		messagebox('Atención','Este flujo no se encuentra programado')
		dw_pend.reset()
		return
end choose
dw_pend.retrieve(dw_terce.getitemstring(1,'tipodoc'),dw_terce.getitemstring(1,'documento'))
end event

type pb_new_desde_recep from picturebutton within t2_1
integer x = 2395
integer y = 1040
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Nueva Orden de Pago"
end type

event clicked;if dw_pend.rowcount()=0 then return
if dw_pend.getitemnumber(1,'a_cobrar')=0 then
	messagebox("Atención",'Debe escoger una Radicación para continuar')
	return
end if
if dw_pend.find('apagar=0 and esco=1',1,dw_pend.rowcount())>0 then
	messagebox("Atención",'Los valores deben ser mayores a cero')
	return
end if
long j,k,donde,donde2,rfcn,ctos,li
dec porc,l_dctos,l_acum
string rfcl,rfcd
int pasa=0
datawindow dw_cpo,dw_fpag,dw_item
st_ord_pago st_ord

SELECT cadena into :ls_dctos
FROM parametros_gen
WHERE (((codigo_para)=58));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 58')
	return 
end if

dw_cpo=tab_2.t2_3.dw_cpo
dw_item=tab_2.t2_2.dw_det_pago
dw_fpag=tab_2.t2_2.dw_fpago
idw_cuenta.retrieve(i_emp)
dw_cpo.reset()
dw_fpag.reset()
dw_cab.reset()
dw_item.reset()
dw_item.insertrow(1)
dw_cab.insertrow(1)
dw_fpag.insertrow(1)
dw_item.setitem(1,'fecha',datetime(today(),now()))
dw_item.setitem(1,'tipodoc',dw_terce.getitemstring(1,'tipodoc'))
dw_item.setitem(1,'documento',dw_terce.getitemstring(1,'documento'))
dw_item.event itemchanged(1,dw_item.object.documento,dw_terce.getitemstring(1,'documento'))
dw_item.setitem(1,'item',1)
dw_fpag.setitem(1,'item',1)
dw_fpag.setitem(1,'subitem',1)
dw_cab.setitem(1,'tneto',dw_pend.getitemnumber(1,'a_cobrar'))
dw_cab.setitem(1,'v_siniva',dw_pend.getitemnumber(1,'a_cobrar'))
dw_cab.setitem(1,'fecha_reg',datetime(today(),now()))
dw_cab.setitem(1,'fecha',datetime(today(),now()))
dw_cab.setitem(1,'clugar',clugar)
dw_cab.setitem(1,'coddoc',i_cdoc)
dw_cab.setitem(1,'tipodoc',dw_terce.getitemstring(1,'tipodoc'))
dw_cab.setitem(1,'documento',dw_terce.getitemstring(1,'documento'))
dw_cab.setitem(1,'cod_flujo',dw_orig.getitemstring(1,1))
dec valor
dw_pend.accepttext()

rfcd=dw_pend.getitemstring(1,'coddoc')
rfcl=dw_pend.getitemstring(1,'clugar')
rfcn=dw_pend.getitemnumber(1,'nrelacion')
ctos=dw_pend.rowcount()

for j=1 to ctos
	if ((rfcd<>dw_pend.getitemstring(j,'coddoc') or rfcl<>dw_pend.getitemstring(j,'clugar') or rfcn<>dw_pend.getitemnumber(j,'nrelacion') ) and ls_dctos='1') then
		rfcd=dw_pend.getitemstring(j,'coddoc')
		rfcl=dw_pend.getitemstring(j,'clugar')
		rfcn=dw_pend.getitemnumber(j,'nrelacion')
	end if
	
	if dw_pend.getitemnumber(j,'esco')=1 then
		dw_pend.scrolltorow(j)
		dw_pend.triggerevent(rowfocuschanged!)
		if dw_orig.getitemstring(1,1)='PTPT-' then
			porc=1
		else
			porc=dw_pend.getitemnumber(j,'apagar')/(dw_pend.getitemnumber(j,'tneto'))
		end if
		donde=dw_cpo.insertrow(0)
		dw_cpo.setitem(donde,'clugar',clugar)
		dw_cpo.setitem(donde,'coddoc',i_cdoc)
		dw_cpo.setitem(donde,'item',donde)
		dw_cpo.setitem(donde,'neto',dw_pend.getitemnumber(j,'apagar'))
		dw_cpo.setitem(donde,'v_bruto',dw_pend.getitemnumber(j,'tbruto')*porc)
		dw_cpo.setitem(donde,'v_siniva',dw_pend.getitemnumber(j,'val_bruto')*porc)
		if dw_orig.getitemstring(1,1)<>'PTPT-' then
			dw_cpo.setitem(donde,'coddoc_rel',dw_pend.getitemstring(j,'coddoc'))
			dw_cpo.setitem(donde,'clugar_rel',dw_pend.getitemstring(j,'clugar'))
			dw_cpo.setitem(donde,'nrelacion',dw_pend.getitemnumber(j,'nrelacion'))
			dw_cpo.setitem(donde,'item_rel',dw_pend.getitemnumber(j,'item'))
			dw_cpo.setitem(donde,'tipo_pago',string(dw_pend.getitemnumber(j,'pagar')))
			dw_cpo.setitem(donde,'ano',dw_pend.getitemnumber(j,'ano'))
			dw_cpo.setitem(donde,'ncontrato',dw_pend.getitemnumber(j,'ncontrato'))
			dw_cpo.setitem(donde,'otrosi',dw_pend.getitemnumber(j,'otrosi'))
			dw_cpo.setitem(donde,'cod_rel',dw_pend.getitemstring(j,'cod_rel'))
			dw_cpo.setitem(donde,'prefijo_fac',dw_pend.getitemstring(j,'cod_rel'))
			dw_cpo.setitem(donde,'num_fact',dw_pend.getitemnumber(j,'num_fact'))
			dw_cpo.setitem(donde,'fecha_fact',dw_pend.getitemdatetime(j,'fecha_fact'))
			dw_cpo.setitem(donde,'tiporelacion',dw_pend.getitemstring(j,'tiporelacion'))
		end if
		if dw_orig.getitemstring(1,1)='PTPG-' then
			dw_cpo.setitem(donde,'ngiro',dw_pend.getitemnumber(j,'ndoc_giro'))
			dw_cpo.setitem(donde,'clug_giro',dw_pend.getitemstring(j,'clug_giro'))
			dw_cpo.setitem(donde,'cdoc_giro',dw_pend.getitemstring(j,'cdoc_giro'))
		end if
		if dw_orig.getitemstring(1,1)='PTPT-' then
			dw_item.setitem(1,'codbanco',dw_pend.getitemstring(j,'codbanco_consig'))
			dw_item.event itemchanged(1,dw_item.object.codbanco,dw_pend.getitemstring(j,'codbanco_consig'))
			idw_cuenta.scrolltorow(idw_cuenta.find('numcuenta="'+dw_pend.getitemstring(j,'numcuenta_consig')+'"',1,idw_cuenta.rowcount()))
			dw_item.event itemchanged(1,dw_item.object.numcuenta,dw_pend.getitemstring(j,'numcuenta_consig'))
			dw_item.setitem(1,'numcuenta',dw_pend.getitemstring(j,'numcuenta_consig'))
		end if
	
		if (j + 1 < ctos) and  ls_dctos='1' then
			rfcd=dw_pend.getitemstring(j + 1,'coddoc')
			rfcl=dw_pend.getitemstring(j + 1,'clugar')
			rfcn=dw_pend.getitemnumber(j + 1,'nrelacion')
		else 
			if (j  = ctos) and  ls_dctos='1' then
				rfcd=dw_pend.getitemstring(j,'coddoc')
				rfcl=dw_pend.getitemstring(j,'clugar')
				rfcn=dw_pend.getitemnumber(j,'nrelacion')
			end if
		end if
		if  (rfcd<>dw_pend.getitemstring(j,'coddoc') or rfcl<>dw_pend.getitemstring(j,'clugar') or rfcn<>dw_pend.getitemnumber(j,'nrelacion')) or ( (j  <= ctos) ) then
			if (dw_orig.getitemstring(1,1)='PTRFCPG' or dw_orig.getitemstring(1,1)='PTPG-') and dw_orig.getitemstring(1,1)<>'PTPT-' and ls_dctos='1'   then
				if dw_pend.getitemnumber(j,'dctos')=1 then
					st_ord.dw_cab=dw_cab
					st_ord.dw_cpo=dw_cpo
					st_ord.dw_conta=tab_2.t2_3.dw_rte
					st_ord.coddoc=i_cdoc
					st_ord.emp=i_emp
					st_ord.dgral=i_dec_gral
					st_ord.agral=i_aprox_gral			
					st_ord.cod_rfc=dw_pend.getitemstring(j,'coddoc')
					st_ord.clu_rfc=dw_pend.getitemstring(j,'clugar')
					st_ord.num_rfc=dw_pend.getitemnumber(j, 'nrelacion')
					openwithparm(w_dsctos_pago,st_ord)
					if message.stringparm='-1' then 
						dw_pend.reset()
						dw_cpo.reset()
						dw_fpag.reset()
						dw_cab.reset()
						dw_item.reset()
						dw_pend.retrieve(dw_terce.getitemstring(1,'tipodoc'),dw_terce.getitemstring(1,'documento'))
						i_nueva=false
						i_cambio=false
						exit
					else
						l_acum=0
						long loc,rfcix,rfcnx
						string rfcdx,rfclx
						for li=1 to dw_cpo.rowcount()
							tab_2.t2_3.dw_rte.setfilter("item="+string(dw_cpo.getitemnumber(li,'item')))
							tab_2.t2_3.dw_rte.filter()
							l_dctos=0
							if tab_2.t2_3.dw_rte.rowcount()>0 then
								l_dctos=tab_2.t2_3.dw_rte.getitemnumber(1,'total')
								dw_cpo.setitem(li,'t_dsctos',l_dctos)
								dw_cpo.setitem(li,'neto',dw_cpo.getitemnumber(li,'v_bruto') - l_dctos)
							end if
							rfcdx=dw_cpo.getitemstring(li,'coddoc_rel')
							rfclx= dw_cpo.getitemstring(li,'clugar_rel')
							rfcnx=dw_cpo.getitemnumber(li,'nrelacion')
							rfcix= dw_cpo.getitemnumber(li,'item_rel')
							loc=dw_pend.find("clugar='"+rfclx+"' and coddoc='"+rfcdx+"' and nrelacion="+string(rfcnx)+" and item="+string(rfcix), 1, dw_pend.rowcount())	
							if loc>0 then
								dw_pend.setitem(loc,'tdescuentos_op',l_dctos)
								dw_pend.setitem(loc,'apagar',dw_pend.getitemnumber(loc,'apagar1') - l_dctos)
							else
								dw_pend.reset()
								dw_cpo.reset()
								dw_fpag.reset()
								dw_cab.reset()
								dw_item.reset()
								dw_pend.retrieve(dw_terce.getitemstring(1,'tipodoc'),dw_terce.getitemstring(1,'documento'))
								i_nueva=false
								i_cambio=false
							end if
							l_acum+=l_dctos
						next
						dw_cab.setitem(1,'t_dsctos',l_acum)
						i_nueva=true
						i_cambio=true
					end if
				end if
			end if
		end if
	end if //-- 1
next
dw_item.setitem(1,'valor',dw_pend.getitemnumber(1,'a_cobrar'))
dw_fpag.setitem(1,'valor',dw_pend.getitemnumber(1,'a_cobrar'))
i_clug_npago=clugar
if i_cambio then
	tab_2.t2_2.enabled=true
	tab_2.selectedtab=2
end if
dw_cpo.triggerevent('p_itemchanged')

end event

type dw_pend from datawindow within t2_1
integer x = 9
integer y = 104
integer width = 6025
integer height = 932
integer taborder = 1
string title = "none"
string dataobject = "dw_intfaz_rel_opago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;tab_2.t2_2.enabled=false
decimal saldo
accepttext()

if dataobject='dw_intfaz_giro_opago' and dwo.name='esco' then
	long j
	setitem(row,'esco',long(data))
	do
		j=find('esco<>'+data+' and ndoc_giro='+string(getitemnumber(row,'ndoc_giro')),1,rowcount())
		if j>0 and j<>row then setitem(j,'esco',long(data))
	loop until j=0
end if
if dataobject='dw_intfaz_rel_opago' and dwo.name='esco' then
	setitem(row,'esco',long(data))
end if


choose case getcolumnname()
	case 'apagar'
		saldo=round(getitemdecimal(getrow(),'tneto') -getitemdecimal(getrow(),'v_pagado') ,i_dec_gral)
		if long(data)>saldo then
			setitem(row,'apagar',saldo)
			return 1
		end if
		setitem(row,'apagar1',double(data))
end choose
accepttext()
end event

event buttonclicked;long j,esco=1

if dwo.text='Deselecc.' then 
	esco=0
	dwo.text='Escoger'
else
	dwo.text='Deselecc.'
end if
for j=1 to rowcount()
	setitem(j,'esco',esco)
next
tab_2.t2_2.enabled=false
end event

event dberror;rollback;
return 0
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
garbagecollect()
end event

type t2_2 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 6071
integer height = 1184
long backcolor = 67108864
string text = "Detalle del Pago"
long tabtextcolor = 33554432
string picturename = "arq_deta.ico"
long picturemaskcolor = 536870912
string powertiptext = "Donde se realiza el comprobante y se muestra la forma de pago"
pb_imp_cheque pb_imp_cheque
pb_consigna pb_consigna
cbx_auto cbx_auto
pb_print_auto pb_print_auto
pb_anula_cheque pb_anula_cheque
st_6 st_6
dw_cheques dw_cheques
st_5 st_5
st_2 st_2
pb_del_cheque pb_del_cheque
pb_new_cheque pb_new_cheque
pb_del_det pb_del_det
pb_new_det pb_new_det
dw_det_pago dw_det_pago
cbx_1 cbx_1
pb_save pb_save
dw_fpago dw_fpago
end type

on t2_2.create
this.pb_imp_cheque=create pb_imp_cheque
this.pb_consigna=create pb_consigna
this.cbx_auto=create cbx_auto
this.pb_print_auto=create pb_print_auto
this.pb_anula_cheque=create pb_anula_cheque
this.st_6=create st_6
this.dw_cheques=create dw_cheques
this.st_5=create st_5
this.st_2=create st_2
this.pb_del_cheque=create pb_del_cheque
this.pb_new_cheque=create pb_new_cheque
this.pb_del_det=create pb_del_det
this.pb_new_det=create pb_new_det
this.dw_det_pago=create dw_det_pago
this.cbx_1=create cbx_1
this.pb_save=create pb_save
this.dw_fpago=create dw_fpago
this.Control[]={this.pb_imp_cheque,&
this.pb_consigna,&
this.cbx_auto,&
this.pb_print_auto,&
this.pb_anula_cheque,&
this.st_6,&
this.dw_cheques,&
this.st_5,&
this.st_2,&
this.pb_del_cheque,&
this.pb_new_cheque,&
this.pb_del_det,&
this.pb_new_det,&
this.dw_det_pago,&
this.cbx_1,&
this.pb_save,&
this.dw_fpago}
end on

on t2_2.destroy
destroy(this.pb_imp_cheque)
destroy(this.pb_consigna)
destroy(this.cbx_auto)
destroy(this.pb_print_auto)
destroy(this.pb_anula_cheque)
destroy(this.st_6)
destroy(this.dw_cheques)
destroy(this.st_5)
destroy(this.st_2)
destroy(this.pb_del_cheque)
destroy(this.pb_new_cheque)
destroy(this.pb_del_det)
destroy(this.pb_new_det)
destroy(this.dw_det_pago)
destroy(this.cbx_1)
destroy(this.pb_save)
destroy(this.dw_fpago)
end on

type pb_imp_cheque from picturebutton within t2_2
integer x = 3899
integer y = 592
integer width = 146
integer height = 128
integer taborder = 150
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print.gif"
string disabledname = "d_print.gif"
alignment htextalign = left!
end type

event clicked;long donde,cuantos,chequera,nro,final
uo_report rep_chq

donde=dw_fpago.find('imp_cheque="1"',1,dw_fpago.rowcount())
if donde=0 then return
string banco,tcuenta,ncuenta
banco=dw_fpago.getitemstring(donde,'codbanco')
tcuenta=dw_fpago.getitemstring(donde,'tipo_cuenta')
ncuenta=dw_fpago.getitemstring(donde,'numcuenta')

rep_chq=create uo_report
rep_chq.tipo_rep='cheque!'
rep_chq.v_preliminar=true
rep_chq.dialogo=false
rep_chq.cod_rep=banco
rep_chq.nombre_rep=tcuenta
rep_chq.i_clugar=ncuenta

select count(*) into :cuantos from tesocuenta_chequera 
where codbanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and estado='1';
if cuantos<>1 then
	messagebox("Atención",'Esta cuenta bancaria no tiene chequera activa (o puede tener mas de una activa)  revise esto para continuar')
	return
end if
select nro_chequera,n_actual,n_final into :chequera ,:nro,:final
from tesocuenta_chequera 
where codbanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and estado='1';
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo TesoCuenta_Chequera' ,sqlca.sqlerrtext)
	return
end if
if isnull(nro) then
	messagebox('Error leyendo TesoCuenta_Chequera' ,'No hay número actual de cheque')
	return
end if
nro ++
If nro >final then
	messagebox('Error en Chequera' ,'Nro de Cheque' +string(nro)+' Supera el tope de la chequera'+string(chequera)+'~r~nVerifique')
	return
End If

if messagebox("Atención",'Está seguro de imprimir el cheque nro: '+string(nro)+' de la chequera nro: '+string(chequera)+' ?~r~nInserte el cheque en la impresora y presione SI para continuar o NO para cancelar.',question!,yesno!,1)=2 then return
dw_fpago.setitem(donde,'num_che',string(nro))
dw_cheques.insertrow(1)
dw_cheques.setitem(1,'codbanco',banco)
dw_cheques.setitem(1,'tipo_cuenta',tcuenta)
dw_cheques.setitem(1,'numcuenta',ncuenta)
dw_cheques.setitem(1,'chequera',chequera)
dw_cheques.setitem(1,'nro_cheque',nro)
dw_cheques.setitem(1,'clugar',dw_fpago.getitemstring(donde,'clugar'))
dw_cheques.setitem(1,'item',dw_fpago.getitemnumber(donde,'item'))
dw_cheques.setitem(1,'subitem',dw_fpago.getitemnumber(donde,'subitem'))
dw_cheques.setitem(1,'valor',dw_fpago.getitemnumber(donde,'valor'))
if dw_cheques.update()=-1 then 
	rollback;
	return
end if
if dw_fpago.update()=-1 then
	rollback;
	return
end if
string estado='1'
if nro=final then estado='0'
update tesocuenta_chequera set estado=:estado,n_actual=:nro 
where codbanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and nro_chequera=:chequera;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando TesoCuenta_Chequera",sqlca.sqlerrtext)
	rollback;
	return
end if
commit;
dw_fpago.setitem(donde,'imp_cheque','0')
any par[8]
par[1]=banco
par[2]=tcuenta
par[3]=ncuenta
par[4]=clugar
par[5]=dw_fpago.getitemnumber(donde,'item')
par[6]=dw_fpago.getitemnumber(donde,'subitem')
par[7]=chequera
par[8]=nro
rep_chq.imprimir(par,'','0')
	
end event

type pb_consigna from picturebutton within t2_2
integer x = 4210
integer y = 592
integer width = 146
integer height = 128
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Consignar Cheque no Reclamado"
end type

event clicked;if not isnull(dw_cheques.getitemnumber(dw_cheques.getrow(),'item_consig')) then return
openwithparm(w_consigna_cheque,dw_cheques)
end event

type cbx_auto from checkbox within t2_2
integer x = 919
integer y = 676
integer width = 823
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir Autorizaciones Bancarias"
end type

type pb_print_auto from pb_report within t2_2
integer x = 1760
integer y = 604
integer taborder = 130
string powertiptext = "Reimprimir Autorizaciones Bancarias"
string cod_rep = "AUTB"
string nombre_rep = "Autorización a Banco para pago con Cheque de Gerencia"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if dw_fpago.rowcount()=0 or dw_histo_desde.rowcount()=0 then return
if not isnull(dw_histo_desde.getitemstring(dw_histo_desde.getrow(),'estado')) then return
if dw_fpago.getitemstring(dw_fpago.getrow(),'forma')<>'A' then return
any parm[3]
parm[1]='AUTB'
parm[2]=dw_fpago.getitemstring(dw_fpago.getrow(),'clug_auto')
parm[3]=dw_fpago.getitemnumber(dw_fpago.getrow(),'nro_autoriza')
imprimir(parm,'','0')

end event

type pb_anula_cheque from picturebutton within t2_2
integer x = 4055
integer y = 592
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Anular Cheque"
end type

event clicked;if dw_cheques.rowcount()=0 then return
if not isnull(dw_cheques.getitemstring(dw_cheques.getrow(),'estado')) then 
	messagebox("Atención",'Este cheque ya se encuentra anulado')
	return
end if
if not isnull(dw_cheques.getitemnumber(dw_cheques.getrow(),'item_consig')) then 
	messagebox("Atención",'Este cheque ya se encuentra consignado')
	return
end if
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
dw_fpago.setitem(dw_fpago.getrow(),'num_che',nulo)
if dw_cheques.update()=-1 then 
	rollback;
	return
end if
if dw_fpago.update()=-1 then
	rollback;
	return
end if
commit;
end event

type st_6 from statictext within t2_2
integer x = 3003
integer y = 660
integer width = 896
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de cheques de la forma de pago:"
boolean focusrectangle = false
end type

type dw_cheques from datawindow within t2_2
integer x = 3003
integer y = 724
integer width = 3003
integer height = 436
integer taborder = 110
string title = "none"
string dataobject = "dw_cheques"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;pb_consigna.enabled=false
if getrow()<1 then return
if isnull(getitemstring(getrow(),'estado')) and isnull(getitemnumber(getrow(),'item_consig')) then pb_consigna.enabled=true
end event

event dberror;rollback;
return 0
end event

type st_5 from statictext within t2_2
integer x = 46
integer y = 672
integer width = 571
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Formas de Pago del Item:"
boolean focusrectangle = false
end type

type st_2 from statictext within t2_2
integer x = 41
integer y = 8
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
string text = "Items del Pago"
boolean focusrectangle = false
end type

type pb_del_cheque from picturebutton within t2_2
integer x = 773
integer y = 604
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar forma de pago"
end type

event clicked;if dw_cab.rowcount()=0 then return
if dw_cab.getitemstring(dw_cab.getrow(),'nueva')='false' then return
if dw_det_pago.rowcount()=0 then return
if dw_fpago.rowcount()<=1 then return
dw_fpago.deleterow(0)
end event

type pb_new_cheque from picturebutton within t2_2
integer x = 617
integer y = 604
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar forma de Pago"
end type

event clicked;if dw_cab.rowcount()=0 then return
if dw_cab.getitemstring(dw_cab.getrow(),'nueva')='false' then return
if dw_det_pago.rowcount()=0 then return
long donde,j
donde=dw_fpago.insertrow(0)
for j=1 to dw_fpago.rowcount()
	if dw_fpago.find('subitem='+string(j),1,dw_fpago.rowcount())=0 then exit
next
dw_fpago.setitem(donde,'clugar',clugar)
dw_fpago.setitem(donde,'subitem',j)
dw_fpago.setitem(donde,'item',dw_det_pago.getitemnumber(dw_det_pago.getrow(),'item'))
dw_fpago.setitem(donde,'valor',dw_det_pago.getitemnumber(dw_det_pago.getrow(),'valor'))

end event

type pb_del_det from picturebutton within t2_2
integer x = 5856
integer y = 336
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Item de Pago"
end type

event clicked;if dw_det_pago.rowcount()<=1 then return
if dw_cab.rowcount()=0 then return
if dw_cab.getitemstring(dw_cab.getrow(),'nueva')='false' then return
do while dw_fpago.rowcount()>0
	dw_fpago.deleterow(0)
loop
dw_det_pago.deleterow(0)
end event

type pb_new_det from picturebutton within t2_2
integer x = 5856
integer y = 200
integer width = 146
integer height = 128
integer taborder = 21
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Item de Pago"
end type

event clicked;if dw_cab.rowcount()=0 then return
if dw_cab.getitemstring(dw_cab.getrow(),'nueva')='false' then return
long donde,j
donde=dw_det_pago.insertrow(0)
dw_det_pago.setitem(donde,'tipodoc',dw_terce.getitemstring(1,'tipodoc'))
dw_det_pago.setitem(donde,'documento',dw_terce.getitemstring(1,'documento'))
dw_det_pago.setitem(donde,'valor',dw_cab.getitemnumber(1,'tneto') -dw_det_pago.getitemnumber(1,'t_pagar'))
dw_det_pago.setitem(donde,'fecha',datetime(today(),now()))
for j=1 to dw_det_pago.rowcount()
	if dw_det_pago.find('item='+string(j),1,dw_det_pago.rowcount())=0 then exit
next
dw_det_pago.setitem(donde,'item',j)
dw_det_pago.scrolltorow(donde)
dw_det_pago.event itemchanged(donde,dw_det_pago.object.documento,dw_terce.getitemstring(1,'documento'))
dw_det_pago.setfocus()
pb_new_cheque.event clicked()
end event

type dw_det_pago from datawindow within t2_2
integer x = 41
integer y = 64
integer width = 5774
integer height = 488
integer taborder = 11
string title = "none"
string dataobject = "dw_pagos_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild("numcuenta",idw_cuenta)
idw_cuenta.settransobject(sqlca)

end event

event itemchanged;string nulo
setnull(nulo)
choose case dwo.name
	case 'codbanco'
		accepttext()
		setitem(row,'numcuenta',nulo)
		setitem(row,'tipo_cuenta',nulo)
		idw_cuenta.setfilter('(tipo_cuenta="C" or  tipo_cuenta ="A")  and codbanco="'+data+'" and tipocaja="0"')
		idw_cuenta.filter()
	case 'numcuenta'
		if idw_cuenta.getitemnumber(idw_cuenta.getrow(),'quedan')<getitemnumber(getrow(),'valor')-dw_fpago.getitemnumber(1,'t_posfechado') then
			setitem(getrow(),'numcuenta',getitemstring(getrow(),'numcuenta'))
			settext(getitemstring(getrow(),'numcuenta'))
			return 1
		else
			if not isnull(getitemstring(getrow(),'numcuenta')) then
				long anterior
				anterior=idw_cuenta.find('numcuenta="'+getitemstring(getrow(),'numcuenta')+'"',1,idw_cuenta.rowcount())
				idw_cuenta.setitem(anterior,'acumul',idw_cuenta.getitemnumber(anterior,'acumul') - getitemnumber(getrow(),'valor') + dw_fpago.getitemnumber(1,'t_posfechado'))
			end if
			idw_cuenta.setitem(idw_cuenta.getrow(),'acumul',idw_cuenta.getitemnumber(idw_cuenta.getrow(),'acumul') + getitemnumber(getrow(),'valor')-dw_fpago.getitemnumber(1,'t_posfechado'))
		end if
		setitem(getrow(),'tipo_cuenta',idw_cuenta.getitemstring(idw_cuenta.getrow(),'tipo_cuenta'))
	case 'tipodoc'
		setitem(getrow(),'documento','')
	case 'documento'
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
			setitem(getrow(),"dverificacion",dverif)
			setitem(getrow(),"nombre1",nom1)
			setitem(getrow(),"nombre2",nom2)
			setitem(getrow(),"apellido1",ape1)
			setitem(getrow(),"apellido2",ape2)
			setitem(getrow(),"razon_social",rsoc)
			setitem(getrow(),"persona",persona)
		end if
		i_cambio=true
end choose

end event

event rowfocuschanged;pb_imp_cheque.enabled=false
if getrow()<1 then return
if isnull(getitemstring(getrow(),'codbanco')) then
	idw_cuenta.setfilter('isnull(codbanco)')
else
	idw_cuenta.setfilter('codbanco="'+getitemstring(getrow(),'codbanco')+'" and tipocaja="0"')
end if
idw_cuenta.filter()
if isnull(getitemnumber(getrow(),'item')) then 
	dw_fpago.setfilter('isnull(item)')
else
	dw_fpago.setfilter('item='+string(getitemnumber(getrow(),'item')))
end if
dw_fpago.filter()
dw_fpago.event rowfocuschanged(dw_fpago.getrow())
end event

event doubleclicked;if dwo.name='tipodoc' or dwo.name='documento' then 
	if not isnull(dw_cab.getitemnumber(1,'ntransferencia')) then return
	g_tercerodesde=17
	openwithparm(w_buscater,this)
	setcolumn('documento')
	event itemchanged(row,object.documento,getitemstring(row,'documento'))
end if
end event

type cbx_1 from checkbox within t2_2
integer x = 2935
integer width = 553
integer height = 64
integer taborder = 25
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir Nuevo Pago"
end type

type pb_save from picturebutton within t2_2
integer x = 5856
integer y = 64
integer width = 142
integer height = 124
integer taborder = 45
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar y generar la Orden de Pago"
end type

event clicked;grabar()
end event

type dw_fpago from datawindow within t2_2
event p_itemchanged ( )
event p_itemchan ( )
integer x = 46
integer y = 736
integer width = 2843
integer height = 420
integer taborder = 90
string title = "none"
string dataobject = "dw_trans_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();if not isnull(dw_det_pago.getitemstring(dw_det_pago.getrow(),'numcuenta')) then
	long anterior
	anterior=idw_cuenta.find('numcuenta="'+dw_det_pago.getitemstring(dw_det_pago.getrow(),'numcuenta')+'"',1,idw_cuenta.rowcount())
	idw_cuenta.setitem(anterior,'acumul',idw_cuenta.getitemnumber(anterior,'acumul') - dw_det_pago.getitemnumber(dw_det_pago.getrow(),'valor'))
	string nulo
	setnull(nulo)
	//dw_det_pago.setitem(dw_det_pago.getrow(),'numcuenta',nulo)
end if
accepttext()
event p_itemchan()
end event

event p_itemchan();dw_det_pago.setitem(dw_det_pago.getrow(),'valor',getitemnumber(1,'total'))
dw_det_pago.setitem(dw_det_pago.getrow(),'valor_posf',getitemnumber(1,'t_posfechado'))
dw_cab.setitem(1,'valor_posf',dw_det_pago.getitemnumber(1,'t_posf'))
end event

event constructor;settransobject(sqlca)
end event

event itemchanged;choose case dwo.name
	case 'fecha_cobrar'
		if date(left(data,10))<date(dw_cab.getitemdatetime(1,'fecha')) then
			settext('')
			return 1
		end if
	case 'valor'
		post event p_itemchanged()
	case 'posfechado'
		if not isnull(dw_det_pago.getitemstring(dw_det_pago.getrow(),'numcuenta')) then
			long anterior
			anterior=idw_cuenta.find('numcuenta="'+dw_det_pago.getitemstring(dw_det_pago.getrow(),'numcuenta')+'"',1,idw_cuenta.rowcount())
			idw_cuenta.setitem(anterior,'acumul',idw_cuenta.getitemnumber(anterior,'acumul') - dw_det_pago.getitemnumber(dw_det_pago.getrow(),'valor') + getitemnumber(1,'t_posfechado'))
			string nulo
			setnull(nulo)
			dw_det_pago.setitem(dw_det_pago.getrow(),'numcuenta',nulo)
		end if
		accepttext()
		groupcalc()
		post event p_itemchan()
	case 'imp_cheque'
		if data='1' then
			pb_imp_cheque.enabled=true
		else
			pb_imp_cheque.enabled=false
		end if
end choose
end event

event rowfocuschanged;dw_cheques.reset()
if getrow()<1 then return
dw_cheques.retrieve(getitemstring(getrow(),'codbanco'),getitemstring(getrow(),'tipo_cuenta'),getitemstring(getrow(),'numcuenta'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'item'),getitemnumber(getrow(),'subitem'))
if getitemstring(getrow(),'forma')='A' and not isnull(getitemnumber(getrow(),'nro_autoriza')) then 
	pb_print_auto.enabled=true
else
	pb_print_auto.enabled=false
end if
end event

event dberror;rollback;
return 0
end event

type t2_3 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 6071
integer height = 1184
long backcolor = 67108864
string text = "Detalle Radicaciones"
long tabtextcolor = 33554432
string picturename = "arq_deta.ico"
long picturemaskcolor = 536870912
string powertiptext = "Radicaciones relñacionadas con esta orden de pago"
st_9 st_9
dw_rte dw_rte
st_8 st_8
dw_cpo dw_cpo
st_1 st_1
end type

on t2_3.create
this.st_9=create st_9
this.dw_rte=create dw_rte
this.st_8=create st_8
this.dw_cpo=create dw_cpo
this.st_1=create st_1
this.Control[]={this.st_9,&
this.dw_rte,&
this.st_8,&
this.dw_cpo,&
this.st_1}
end on

on t2_3.destroy
destroy(this.st_9)
destroy(this.dw_rte)
destroy(this.st_8)
destroy(this.dw_cpo)
destroy(this.st_1)
end on

type st_9 from statictext within t2_3
integer x = 9
integer y = 776
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
string text = "Descuentos"
boolean focusrectangle = false
end type

type dw_rte from datawindow within t2_3
integer x = 18
integer y = 836
integer width = 6098
integer height = 336
integer taborder = 31
string title = "none"
string dataobject = "dw_tesotranscpo_rte"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_concep',idw_iva2)
idw_iva2.settransobject(sqlca)
idw_iva2.retrieve()

getchild('cod_total',idw_cta2)
idw_cta2.settransobject(sqlca)
settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then return
if not isnull(getitemstring(getrow(),'cod_empre')) then
	idw_cta2.retrieve(getitemstring(getrow(),'cod_empre'),getitemstring(getrow(),'cod_concep'))
else
	idw_cta2.retrieve(i_emp,getitemstring(getrow(),'cod_concep'))
end if
end event

type st_8 from statictext within t2_3
integer x = 3822
integer y = 48
integer width = 1317
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble Click para ir a detalle de Radicación de Factura"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cpo from datawindow within t2_3
event p_itemchanged ( )
event p_doubleclicked ( )
integer x = 14
integer y = 140
integer width = 6007
integer height = 600
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_transferencias_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
if rowcount()>0 then
	dw_cab.setitem(1,'t_bruto',getitemnumber(1,'s_bruto'))
	dw_cab.setitem(1,'tneto',getitemnumber(1,'s_neto'))
else
	dw_cab.setitem(1,'t_bruto',0)
	dw_cab.setitem(1,'tneto',0)
end if

end event

event p_doubleclicked();long donde
w_recibe_fact.dw_lug.setitem(1,1,getitemstring(getrow(),'clugar_rel'))
w_recibe_fact.dw_lug.event itemchanged(1,w_recibe_fact.dw_lug.object.codlugar,getitemstring(getrow(),'clugar_rel'))
w_recibe_fact.dw_orig.setitem(1,1,getitemstring(getrow(),'cod_flujo'))
w_recibe_fact.dw_orig.event itemchanged(1,w_recibe_fact.dw_orig.object.codigo,getitemstring(getrow(),'cod_flujo'))

choose case getitemstring(getrow(),'cod_orig')
	case '-','RFC'
		w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'tipodoc',dw_terce.getitemstring(1,'tipodoc'))
		w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'documento',dw_terce.getitemstring(1,'documento'))
		w_recibe_fact.tab_2.t2_2.dw_terce.setcolumn('documento')
		w_recibe_fact.tab_2.t2_2.dw_terce.event itemchanged(1,w_recibe_fact.tab_2.t2_2.dw_terce.object.documento,dw_terce.getitemstring(1,'documento'))
		donde=w_recibe_fact.tab_2.t2_2.dw_hist.find('nrelacion='+string(dw_cpo.getitemnumber(dw_cpo.getrow(),'nrelacion')),1,w_recibe_fact.tab_2.t2_2.dw_hist.rowcount())
		
	case 'PR'
		donde=w_recibe_fact.tab_2.t2_2.dw_hist.find('nrelacion='+string(dw_cpo.getitemnumber(dw_cpo.getrow(),'nrelacion')),1,w_recibe_fact.tab_2.t2_2.dw_hist.rowcount())
	case 'PDI'
		w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'tipodoc',dw_terce.getitemstring(1,'tipodoc'))
		w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'documento',dw_terce.getitemstring(1,'documento'))
		w_recibe_fact.tab_2.t2_2.dw_terce.setcolumn('documento')
		w_recibe_fact.tab_2.t2_2.dw_terce.event itemchanged(1,w_recibe_fact.tab_2.t2_2.dw_terce.object.documento,dw_terce.getitemstring(1,'documento'))
		donde=w_recibe_fact.tab_2.t2_2.dw_hist.find('nrelacion='+string(dw_cpo.getitemnumber(dw_cpo.getrow(),'nrelacion')),1,w_recibe_fact.tab_2.t2_2.dw_hist.rowcount())
	case 'SCT'
		w_recibe_fact.tab_2.t2_1.dw_terce_c.setitem(1,'tipodoc',dw_terce.getitemstring(1,'tipodoc'))
		w_recibe_fact.tab_2.t2_1.dw_terce_c.setitem(1,'documento',dw_terce.getitemstring(1,'documento'))
		w_recibe_fact.tab_2.t2_1.dw_terce_c.setcolumn('documento')
		w_recibe_fact.tab_2.t2_1.dw_terce_c.event itemchanged(1,w_recibe_fact.tab_2.t2_1.dw_terce_c.object.documento,dw_terce.getitemstring(1,'documento'))
		
end choose
if donde>0 then
	w_recibe_fact.tab_2.t2_2.dw_hist.scrolltorow(donde)
end if
w_recibe_fact.tab_2.selectedtab=3
end event

event constructor;settransobject(sqlca)
getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)

end event

event doubleclicked;if row<1 then return
opensheet(w_recibe_fact,w_principal,11,original!)
post event p_doubleclicked()

end event

event dberror;rollback;
return 0
end event

event rowfocuschanged;if rowcount()>0 then
	tab_2.t2_3.dw_rte.retrieve(i_clug_npago,i_cdoc,i_npago,dw_cpo.getitemnumber(dw_cpo.getrow(),'item'))
end if
end event

type st_1 from statictext within t2_3
integer x = 14
integer y = 64
integer width = 544
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Radicaciones:"
boolean focusrectangle = false
end type

