$PBExportHeader$w_pago_nomina.srw
forward
global type w_pago_nomina from window
end type
type em_2 from editmask within w_pago_nomina
end type
type st_6 from statictext within w_pago_nomina
end type
type st_5 from statictext within w_pago_nomina
end type
type em_1 from editmask within w_pago_nomina
end type
type pb_1 from picturebutton within w_pago_nomina
end type
type pb_imp_cheque from pb_report within w_pago_nomina
end type
type pb_cancel from picturebutton within w_pago_nomina
end type
type st_4 from statictext within w_pago_nomina
end type
type st_3 from statictext within w_pago_nomina
end type
type pb_ok from picturebutton within w_pago_nomina
end type
type st_2 from statictext within w_pago_nomina
end type
type st_1 from statictext within w_pago_nomina
end type
type cbx_1 from checkbox within w_pago_nomina
end type
type rb_1 from radiobutton within w_pago_nomina
end type
type dw_cta from datawindow within w_pago_nomina
end type
type dw_pagos from datawindow within w_pago_nomina
end type
type dw_receps from datawindow within w_pago_nomina
end type
type gb_1 from groupbox within w_pago_nomina
end type
type rb_2 from radiobutton within w_pago_nomina
end type
end forward

global type w_pago_nomina from window
integer width = 4754
integer height = 1532
boolean titlebar = true
string title = "Pago de Nómina"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_2 em_2
st_6 st_6
st_5 st_5
em_1 em_1
pb_1 pb_1
pb_imp_cheque pb_imp_cheque
pb_cancel pb_cancel
st_4 st_4
st_3 st_3
pb_ok pb_ok
st_2 st_2
st_1 st_1
cbx_1 cbx_1
rb_1 rb_1
dw_cta dw_cta
dw_pagos dw_pagos
dw_receps dw_receps
gb_1 gb_1
rb_2 rb_2
end type
global w_pago_nomina w_pago_nomina

type variables
datawindowchild idw_concep,idw_cta
int i_dec_gral,i_aprox_gral
end variables

forward prototypes
public subroutine imprimir_cheques ()
end prototypes

public subroutine imprimir_cheques ();long j
string banco,tcuenta,ncuenta
banco=dw_cta.getitemstring(1,'codbanco')
tcuenta=dw_cta.getitemstring(1,'tipo_cuenta')
ncuenta=dw_cta.getitemstring(1,'numcuenta')

for j=1 to dw_pagos.rowcount()
	if dw_pagos.getitemnumber(j,'selec')=0 then continue
	
next
end subroutine

on w_pago_nomina.create
this.em_2=create em_2
this.st_6=create st_6
this.st_5=create st_5
this.em_1=create em_1
this.pb_1=create pb_1
this.pb_imp_cheque=create pb_imp_cheque
this.pb_cancel=create pb_cancel
this.st_4=create st_4
this.st_3=create st_3
this.pb_ok=create pb_ok
this.st_2=create st_2
this.st_1=create st_1
this.cbx_1=create cbx_1
this.rb_1=create rb_1
this.dw_cta=create dw_cta
this.dw_pagos=create dw_pagos
this.dw_receps=create dw_receps
this.gb_1=create gb_1
this.rb_2=create rb_2
this.Control[]={this.em_2,&
this.st_6,&
this.st_5,&
this.em_1,&
this.pb_1,&
this.pb_imp_cheque,&
this.pb_cancel,&
this.st_4,&
this.st_3,&
this.pb_ok,&
this.st_2,&
this.st_1,&
this.cbx_1,&
this.rb_1,&
this.dw_cta,&
this.dw_pagos,&
this.dw_receps,&
this.gb_1,&
this.rb_2}
end on

on w_pago_nomina.destroy
destroy(this.em_2)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.em_1)
destroy(this.pb_1)
destroy(this.pb_imp_cheque)
destroy(this.pb_cancel)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.rb_1)
destroy(this.dw_cta)
destroy(this.dw_pagos)
destroy(this.dw_receps)
destroy(this.gb_1)
destroy(this.rb_2)
end on

event open;idw_concep.retrieve(w_orden_pago2.i_emp,'0','1')
idw_cta.setfilter('isnull(codbanco)')
idw_cta.retrieve(w_orden_pago2.i_emp)
dw_receps.retrieve()

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

type em_2 from editmask within w_pago_nomina
integer x = 3191
integer y = 1288
integer width = 635
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
boolean border = false
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm"
boolean autoskip = true
boolean dropdowncalendar = true
end type

event constructor;em_2.text=string(datetime(today(),now()))
end event

type st_6 from statictext within w_pago_nomina
integer x = 3191
integer y = 1376
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
string text = "Fecha"
boolean focusrectangle = false
end type

type st_5 from statictext within w_pago_nomina
integer x = 2647
integer y = 1376
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
string text = "Fecha Registro"
boolean focusrectangle = false
end type

type em_1 from editmask within w_pago_nomina
integer x = 2647
integer y = 1288
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm"
end type

event constructor;em_1.text=string(datetime(today(),now()))
end event

type pb_1 from picturebutton within w_pago_nomina
integer x = 2391
integer y = 1292
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
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Asignar Cuenta a empleados seleccionados"
end type

event clicked;if dw_pagos.rowcount()=0 then return
dec tneto,movs
tneto=dw_pagos.getitemnumber(1,'tselecc')
if tneto=0 then return
if tneto>dw_cta.getitemnumber(1,'saldo') then
	messagebox('Atención','La cuenta no tiene saldo para realizar este pago')
	return
end if
long j,donde,donde2
movs=idw_cta.getitemnumber(idw_cta.getrow(),'movs')
if isnull(movs) then movs=0
movs -= tneto
idw_cta.setitem(idw_cta.getrow(),'movs',movs)
idw_cta.setfilter('')
idw_cta.filter()
for j=1 to dw_pagos.rowcount()
	if dw_pagos.getitemnumber(j,'selec')<>1 then continue
	if dw_pagos.getitemstring(j,'banco')<>'' then
		donde2=idw_cta.find('codbanco="'+dw_pagos.getitemstring(j,'banco')+'" and tipo_cuenta="'+dw_pagos.getitemstring(j,'tcuenta')+'" and numcuenta="'+dw_pagos.getitemstring(j,'cuenta')+'"',1,idw_cta.rowcount())
		idw_cta.setitem(donde2,'movs',idw_cta.getitemnumber(donde2,'movs')+dw_pagos.getitemnumber(j,'a_pagar'))
	end if
	dw_pagos.setitem(j,'banco',dw_cta.getitemstring(1,'codbanco'))
	dw_pagos.setitem(j,'tcuenta',dw_cta.getitemstring(1,'tipo_cuenta'))
	dw_pagos.setitem(j,'cuenta',dw_cta.getitemstring(1,'numcuenta'))
	dw_pagos.setitem(j,'selec',0)
next
idw_cta.setfilter('codbanco="'+dw_cta.getitemstring(1,'codbanco')+'" and tipocaja="0"')
idw_cta.filter()
dw_cta.setitem(1,'movs',movs)
end event

type pb_imp_cheque from pb_report within w_pago_nomina
boolean visible = false
integer x = 4027
integer y = 1304
integer taborder = 90
boolean enabled = false
string powertiptext = "Imprimir Cheque"
string cod_rep = "CHEQ"
string nombre_rep = "Cheques"
string tipo_rep = "interno!"
end type

type pb_cancel from picturebutton within w_pago_nomina
integer x = 4338
integer y = 1304
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type st_4 from statictext within w_pago_nomina
integer x = 3351
integer y = 260
integer width = 1321
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Si elige imprimir Cheques puede escoger entre imprimirlos en este proceso o imprimirlos luego en la ventana de Pagos"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_pago_nomina
boolean visible = false
integer x = 4238
integer y = 160
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
string text = "Todos los cheques"
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_pago_nomina
integer x = 4187
integer y = 1304
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
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Guardar y Generar Pagos"
end type

event clicked;if dw_pagos.rowcount()=0 then return
if dw_pagos.getitemnumber(1,'t_neto')<=0 then return
long j,ngasto,donde,item,cuantos,dondei
string banco,tcuenta,ncuenta,err
uo_datastore dw_transcab,dw_transcpo,dw_tes_cta_movi,dw_tes_cta_movdet,dw_tes_cta_movdetcheq,dw_items
dw_transcab=create uo_datastore
dw_transcpo=create uo_datastore
dw_tes_cta_movi=create uo_datastore
dw_tes_cta_movdet=create uo_datastore
dw_tes_cta_movdetcheq=create uo_datastore
dw_items=create uo_datastore

dw_transcab.dataobject='dw_tesotranscab'
dw_transcpo.dataobject='dw_transferencias_cpo'
dw_tes_cta_movi.dataobject='dw_tesocuentasmovi'
dw_tes_cta_movdet.dataobject='dw_trans_det'
dw_tes_cta_movdetcheq.dataobject='dw_cheques'
dw_items.dataobject='dw_xa_pagos_nomi'

dw_transcab.settransobject(sqlca)
dw_transcpo.settransobject(sqlca)
dw_tes_cta_movi.settransobject(sqlca)
dw_tes_cta_movdet.settransobject(sqlca)
dw_tes_cta_movdetcheq.settransobject(sqlca)

dw_receps.setitem(dw_receps.getrow(),'v_pagado',dw_receps.getitemnumber(dw_receps.getrow(),'v_pagado') + dw_pagos.getitemnumber(1,'t_neto'))

ngasto=f_trae_ndoc(w_orden_pago2.i_cdoc,clugar,'Ordenes de Pago')
if ngasto=-1 then return

	
for j=1 to dw_pagos.rowcount()
	if dw_pagos.getitemstring(j,'banco')='' then continue
	banco=dw_pagos.getitemstring(j,'banco')
	tcuenta=dw_pagos.getitemstring(j,'tcuenta')
	ncuenta=dw_pagos.getitemstring(j,'cuenta')
	dondei=dw_items.find('banco="'+banco+'" and tcuenta="'+tcuenta+'" and ncuenta="'+ncuenta+'"',1,dw_items.rowcount())
	if dondei=0 then
		select max(item) into :item from tesocuentasmovi where CodBanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and clugar=:clugar;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error leyendo tesocuentasmovi",err)
			return -1
		end if
		if isnull(item) then item=0
		item ++
		dondei=dw_items.insertrow(0)
		dw_items.setitem(dondei,'banco',banco)
		dw_items.setitem(dondei,'tcuenta',tcuenta)
		dw_items.setitem(dondei,'ncuenta',ncuenta)
		dw_items.setitem(dondei,'clugar',clugar)		
		dw_items.setitem(dondei,'item',item)
	else
		item = dw_items.getitemnumber(dondei,'item')+1
		dw_items.setitem(dondei,'item',item)
	end if
	
	select count(*) into :cuantos from tesocuenta_chequera 
	where codbanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and estado='1';
	if cuantos<>1 and rb_2.checked and cbx_1.checked then
		messagebox("Atención",'Esta cuenta bancaria no tiene chequera activa (o puede tener mas de una activa)  revise esto para continuar')
		return
	end if
	donde=dw_transcab.insertrow(0)
	dw_transcab.setitem(donde,'clugar',clugar)
	dw_transcab.setitem(donde,'coddoc',w_orden_pago2.i_cdoc)
	dw_transcab.setitem(donde,'ntransferencia',ngasto)
	dw_transcab.setitem(donde,'fecha',datetime(em_2.text))
	dw_transcab.setitem(donde,'tipodoc',dw_pagos.getitemstring(j,'tipodoc'))
	dw_transcab.setitem(donde,'documento',dw_pagos.getitemstring(j,'documento'))
	dw_transcab.setitem(donde,'en_destino','0')
	dw_transcab.setitem(donde,'contabil','P')
//	dw_transcab.setitem(donde,'tneto',dw_pagos.getitemnumber(j,'tneto'))
//	dw_transcab.setitem(donde,'t_bruto',dw_pagos.getitemnumber(j,'tneto'))
	dw_transcab.setitem(donde,'tneto',dw_pagos.getitemnumber(j,'apagar'))
	dw_transcab.setitem(donde,'t_bruto',dw_pagos.getitemnumber(j,'apagar'))

	dw_transcab.setitem(donde,'usuario',usuario)
	dw_transcab.setitem(donde,'cod_flujo','PTPG-')
	dw_transcab.setitem(donde,'fecha_reg',datetime(em_1.text))
//	dw_transcab.setitem(donde,'v_siniva',dw_pagos.getitemnumber(j,'tneto'))
	dw_transcab.setitem(donde,'v_siniva',dw_pagos.getitemnumber(j,'apagar'))
	dw_transcab.setitem(donde,'valor_posf',0)
	dw_transcab.setitem(donde,'valor_posf_pago',0)
	dw_transcab.setitem(donde,'detalle','Pago de: '+dw_receps.getitemstring(dw_receps.getrow(),'objeto'))
	
	donde=dw_transcpo.insertrow(0)
	dw_transcpo.setitem(donde,'clugar',clugar)
	dw_transcpo.setitem(donde,'coddoc',w_orden_pago2.i_cdoc)
	dw_transcpo.setitem(donde,'ntransferencia',ngasto)
	dw_transcpo.setitem(donde,'item',1)
	dw_transcpo.setitem(donde,'clugar_rel',dw_pagos.getitemstring(j,'clugar'))
	dw_transcpo.setitem(donde,'coddoc_rel',dw_pagos.getitemstring(j,'coddoc'))
	dw_transcpo.setitem(donde,'nrelacion',dw_pagos.getitemnumber(j,'nrelacion'))
	dw_transcpo.setitem(donde,'item_rel',dw_pagos.getitemnumber(j,'item'))
	dw_transcpo.setitem(donde,'tipo_pago','0')
	dw_transcpo.setitem(donde,'liq_imp','1')
//	dw_transcpo.setitem(donde,'v_bruto',dw_pagos.getitemnumber(j,'tneto'))
//	dw_transcpo.setitem(donde,'neto',dw_pagos.getitemnumber(j,'tneto'))
//	dw_transcpo.setitem(donde,'v_siniva',dw_pagos.getitemnumber(j,'tneto'))
	dw_transcpo.setitem(donde,'v_bruto',dw_pagos.getitemnumber(j,'apagar'))
	dw_transcpo.setitem(donde,'neto',dw_pagos.getitemnumber(j,'apagar'))
	dw_transcpo.setitem(donde,'v_siniva',dw_pagos.getitemnumber(j,'apagar'))
	
	donde=dw_tes_cta_movi.insertrow(0)
	dw_tes_cta_movi.setitem(donde,'codbanco',banco)
	dw_tes_cta_movi.setitem(donde,'tipo_cuenta',tcuenta)
	dw_tes_cta_movi.setitem(donde,'numcuenta',ncuenta)
	dw_tes_cta_movi.setitem(donde,'clugar',clugar)
	dw_tes_cta_movi.setitem(donde,'item',item)
	dw_tes_cta_movi.setitem(donde,'fecha',datetime(em_2.text))	
	//dw_tes_cta_movi.setitem(donde,'fecha',datetime(today(),now()))
	dw_tes_cta_movi.setitem(donde,'detalle','Pago de nómina')
	dw_tes_cta_movi.setitem(donde,'usuario',usuario)
	dw_tes_cta_movi.setitem(donde,'tipodoc',dw_pagos.getitemstring(j,'tipodoc'))
	dw_tes_cta_movi.setitem(donde,'documento',dw_pagos.getitemstring(j,'documento'))
	dw_tes_cta_movi.setitem(donde,'tipo_trans','R')
	dw_tes_cta_movi.setitem(donde,'clugar_trans',clugar)
	dw_tes_cta_movi.setitem(donde,'coddoc_trans',w_orden_pago2.i_cdoc)
	dw_tes_cta_movi.setitem(donde,'ntransferencia',ngasto)
	dw_tes_cta_movi.setitem(donde,'valor',dw_pagos.getitemnumber(j,'apagar'))
	dw_tes_cta_movi.setitem(donde,'valor_posf',0)
	dw_tes_cta_movi.setitem(donde,'valor_posf_pago',0)
	dw_tes_cta_movi.setitem(donde,'valor_notas',0)
	dw_tes_cta_movi.setitem(donde,'signo',-1)
	dw_tes_cta_movi.setitem(donde,'contabil','P')
	dw_tes_cta_movi.setitem(donde,'valor_cartera',0)
	
	donde=dw_tes_cta_movdet.insertrow(0)
	dw_tes_cta_movdet.setitem(donde,'codbanco',banco)
	dw_tes_cta_movdet.setitem(donde,'tipo_cuenta',tcuenta)
	dw_tes_cta_movdet.setitem(donde,'numcuenta',ncuenta)
	dw_tes_cta_movdet.setitem(donde,'clugar',clugar)
	dw_tes_cta_movdet.setitem(donde,'item',item)
	dw_tes_cta_movdet.setitem(donde,'subitem',1)
	if rb_1.checked then
		dw_tes_cta_movdet.setitem(donde,'forma','T')
	else
		dw_tes_cta_movdet.setitem(donde,'forma','C')
	end if
	dw_tes_cta_movdet.setitem(donde,'valor',dw_pagos.getitemnumber(j,'apagar'))
	dw_tes_cta_movdet.setitem(donde,'posfechado','0')
	
//	dw_pagos.setitem(j,'v_pagado',dw_pagos.getitemnumber(j,'tneto'))
	dw_pagos.setitem(j,'v_pagado',dw_pagos.getitemnumber(j,'apagar'))
	dw_pagos.setitem(j,'item_mov',item)
	dw_pagos.setitem(j,'ngasto',ngasto)
	ngasto ++
next
if dw_receps.update()=-1 then goto error
if dw_pagos.update()=-1 then goto error
if dw_transcab.update()=-1 then goto error
if dw_transcpo.update()=-1 then goto error
if dw_tes_cta_movi.update()=-1 then goto error
if dw_tes_cta_movdet.update()=-1 then goto error
ngasto --
update documentos_gral set nactual= :ngasto where coddoc='PT';
if sqlca.sqlcode=-1 then 
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando nactual en Documentos_gral',err)
	goto error
end if
update documentos set nactual= :ngasto where coddoc='PT' and clugar=:clugar;
if sqlca.sqlcode=-1 then 
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando nactual en Documentos',err)
	goto error
end if
commit;
///// C H E Q U E S
if rb_2.checked and cbx_1.checked then
	LONG chequera,nro,final
	string estado='1'
	for j=1 to dw_pagos.rowcount()
		estado='1'
		if dw_pagos.getitemstring(j,'banco')='' then continue
		banco=dw_pagos.getitemstring(j,'banco')
		tcuenta=dw_pagos.getitemstring(j,'tcuenta')
		ncuenta=dw_pagos.getitemstring(j,'cuenta')
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
	
		otro_cheque:
		nro ++
		messagebox("Atención",'Se imprimirá el cheque nro: '+string(nro)+' de la chequera nro: '+string(chequera)+' ?~r~nInserte el cheque en la impresora y presione aceptar para continuar ')
		dw_tes_cta_movdet.setitem(j,'num_che',string(nro))
		dw_tes_cta_movdetcheq.insertrow(1)
		dw_tes_cta_movdetcheq.setitem(1,'codbanco',banco)
		dw_tes_cta_movdetcheq.setitem(1,'tipo_cuenta',tcuenta)
		dw_tes_cta_movdetcheq.setitem(1,'numcuenta',ncuenta)
		dw_tes_cta_movdetcheq.setitem(1,'chequera',chequera)
		dw_tes_cta_movdetcheq.setitem(1,'nro_cheque',nro)
		dw_tes_cta_movdetcheq.setitem(1,'clugar',clugar)
		dw_tes_cta_movdetcheq.setitem(1,'item',dw_pagos.getitemnumber(j,'item_mov'))
		dw_tes_cta_movdetcheq.setitem(1,'subitem',1)
		dw_tes_cta_movdetcheq.setitem(1,'valor',dw_pagos.getitemnumber(j,'pagar'))
		if dw_tes_cta_movdetcheq.update()=-1 then 
			rollback;
			return
		end if
		if dw_tes_cta_movdet.update()=-1 then
			rollback;
			return
		end if
		any par[8]
		par[1]=banco
		par[2]=tcuenta
		par[3]=ncuenta
		par[4]=dw_pagos.getitemnumber(j,'item')
		par[5]=1
		par[6]=chequera
		par[7]=clugar
		par[8]=nro
		if pb_imp_cheque.imprimir(par,'','0')<1 then
			rollback;
			messagebox('Atención','No se puede imprimir el cheque, revise los reportes para continuar.~r~nPara imprimir los cheques deberá hacerlo desde la ventana de Ordenes de Pago')
			return
			close(parent)
		else
			if messagebox('Impresión de Cheque','Se imprimió correctamente el cheque Nro ' +string(nro)+'?',question!,yesno!,1)=2 then 
				dw_tes_cta_movdetcheq.setitem(1,'estado',usuario)
				dw_tes_cta_movdetcheq.setitem(1,'fecha_anula',datetime(today(),now()))
				dw_tes_cta_movdetcheq.setitem(1,'motiv_anula','Daño al imprimir cheque')
				goto otro_cheque
			end if
			update tesocuenta_chequera set n_actual=:nro
			where codbanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and nro_chequera=:chequera;
			if sqlca.sqlcode=-1 then
				messagebox("Error actualizando TesoCuenta_Chequera",sqlca.sqlerrtext)
				rollback;
				close(parent)
				return
			end if
			if nro=final then 
				estado='0'
				update tesocuenta_chequera set estado=:estado
				where codbanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and nro_chequera=:chequera;
				if sqlca.sqlcode=-1 then
					messagebox("Error actualizando TesoCuenta_Chequera",sqlca.sqlerrtext+'.~r~nPara imprimir los cheques deberá hacerlo desde la ventana de Ordenes de Pago')
					rollback;
					close(parent)
					return
				end if
				commit;
				messagebox('Atención','Se terminaron los cheques de la chequera.~r~nPara imprimir los cheques deberá hacerlo desde la ventana de Ordenes de Pago')
				return
			end if
			commit;
		end if
	next
			
end if
/////F I N   C H E Q U E S
close(parent)
return
error:
destroy(dw_transcab)
destroy(dw_transcpo)
destroy(dw_tes_cta_movi)
destroy(dw_tes_cta_movdet)
destroy(dw_tes_cta_movdetcheq)
destroy(dw_items)
dw_receps.reset()
dw_pagos.reset()
dw_receps.retrieve()

end event

type st_2 from statictext within w_pago_nomina
integer x = 32
integer y = 420
integer width = 443
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empleados a Pagar:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_pago_nomina
integer x = 27
integer width = 750
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recepciones pendientes de Pago:"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_pago_nomina
boolean visible = false
integer x = 4155
integer y = 84
integer width = 512
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generar e Imprimir"
end type

type rb_1 from radiobutton within w_pago_nomina
integer x = 3387
integer y = 104
integer width = 384
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transferencia"
boolean checked = true
end type

event clicked;cbx_1.visible= not checked
st_3.visible= not checked
end event

type dw_cta from datawindow within w_pago_nomina
integer x = 23
integer y = 1296
integer width = 2345
integer height = 136
integer taborder = 40
string title = "none"
string dataobject = "dw_combo_banco_cta"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('numcuenta',idw_cta)
idw_cta.settransobject(sqlca)
settransobject(sqlca)
insertrow(1)

end event

event itemchanged;string nulo
setnull(nulo)
choose case dwo.name
	case 'codbanco'
		accepttext()
		setitem(row,'numcuenta',nulo)
		setitem(row,'tipo_cuenta',nulo)
		setitem(getrow(),'saldo_inicial',0)
		setitem(getrow(),'movs',0)
		idw_cta.setfilter('codbanco="'+data+'" and tipocaja="0"')
		idw_cta.filter()
	case 'numcuenta'
		long donde
		donde=idw_cta.find('numcuenta="'+data+'"',1,idw_cta.rowcount())
		if idw_cta.getitemnumber(donde,'quedan')<dw_pagos.getitemnumber(1,'tselecc') then
			setitem(getrow(),'numcuenta',getitemstring(getrow(),'numcuenta'))
			settext(getitemstring(getrow(),'numcuenta'))
			return 1
		end if
		setitem(1,'tipo_cuenta',idw_cta.getitemstring(donde,'tipo_cuenta'))
		setitem(1,'saldo_inicial',idw_cta.getitemnumber(donde,'saldo_inicial'))
		setitem(1,'movs',idw_cta.getitemnumber(donde,'movs'))
end choose
end event

type dw_pagos from datawindow within w_pago_nomina
integer x = 23
integer y = 480
integer width = 4645
integer height = 796
integer taborder = 20
string title = "none"
string dataobject = "dw_relcpo_xa_nom"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)
settransobject(sqlca)
end event

event clicked;if dwo.name<>'b_1' then return
long esco=1,j
if object.b_1.text='Desel.' then 
	esco=0
	object.b_1.text='Selec.'
else
	object.b_1.text='Desel.'
end if
for j=1 to rowcount()
	setitem(j,'selec',esco)
next
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
end event

event itemchanged;decimal saldo
accepttext()

choose case getcolumnname()
	case 'apagar'
		saldo=round(getitemdecimal(getrow(),'tneto') -getitemdecimal(getrow(),'v_pagado') ,i_dec_gral)
		if long(data)>saldo then
			setitem(row,'apagar',saldo)
			return 1
		end if
		//setitem(row,'apagar',double(data))
end choose
accepttext()
end event

type dw_receps from datawindow within w_pago_nomina
integer x = 23
integer y = 56
integer width = 3296
integer height = 348
integer taborder = 10
string title = "none"
string dataobject = "dw_recep_nom_xa_pago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;dw_pagos.reset()
if getrow()<1 then return
dw_pagos.retrieve(getitemstring(getrow(),'clugar'),getitemstring(getrow(),'coddoc'),getitemnumber(getrow(),'nrelacion'))
end event

event dberror;rollback;
return 0
end event

type gb_1 from groupbox within w_pago_nomina
integer x = 3351
integer y = 40
integer width = 1326
integer height = 196
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Forma de Pago:"
end type

type rb_2 from radiobutton within w_pago_nomina
integer x = 3849
integer y = 100
integer width = 279
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cheques"
end type

event clicked;cbx_1.visible=checked
st_3.visible=checked
end event

