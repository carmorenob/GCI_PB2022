$PBExportHeader$w_cotizar.srw
forward
global type w_cotizar from w_factura_base
end type
type dw_procs from datawindow within w_cotizar
end type
type st_6 from statictext within w_cotizar
end type
type pb_1 from picturebutton within w_cotizar
end type
type dw_cotizacab from datawindow within w_cotizar
end type
type dw_cotizacpo from datawindow within w_cotizar
end type
type dw_cot_sub from datawindow within w_cotizar
end type
end forward

global type w_cotizar from w_factura_base
integer width = 3607
integer height = 1816
string title = "Cotización de Servicios"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
string icon = "rec_caja.ico"
boolean center = true
string i_cdoc = "CT"
dw_procs dw_procs
st_6 st_6
pb_1 pb_1
dw_cotizacab dw_cotizacab
dw_cotizacpo dw_cotizacpo
dw_cot_sub dw_cot_sub
end type
global w_cotizar w_cotizar

type variables
datawindow idw_servicios
string i_retorna=''
end variables

forward prototypes
public subroutine blanquea ()
public function long factura ()
end prototypes

public subroutine blanquea ();dw_factura.setfilter("")
dw_factura.filter()
dw_factura.reset()
dw_resumen.reset()
resumen('')

end subroutine

public function long factura ();if dw_factura.rowcount()=0 then return -1
dw_cotizacab.reset()
dw_cotizacpo.reset()
dw_cot_sub.reset()
dw_cotizacab.insertrow(1)
dw_cotizacab.setitem(1,'ntratamiento',idw_servicios.getitemnumber(1,'ntratamiento'))
dw_cotizacab.setitem(1,'clugar_tto',idw_servicios.getitemstring(1,'clugar'))
dw_cotizacab.setitem(1,'tipodoc',tipdoc)
dw_cotizacab.setitem(1,'documento',docu)
dw_cotizacab.setitem(1,'fecha',datetime(today(),now()))
dw_cotizacab.setitem(1,'vtcopago',dw_resumen.getitemnumber(1,'compute_6'))
dw_cotizacab.setitem(1,'vtemp',dw_resumen.getitemnumber(1,'compute_3'))
dw_cotizacab.setitem(1,'vtcmod',dw_resumen.getitemnumber(1,'compute_7'))
dw_cotizacab.setitem(1,'vtcrec',dw_resumen.getitemnumber(1,'compute_8'))
dw_cotizacab.setitem(1,'vtpaciente',dw_resumen.getitemnumber(1,'compute_4'))
dw_cotizacab.setitem(1,'vtcancelo',dw_resumen.getitemnumber(1,'compute_5'))
dw_cotizacab.setitem(1,'vtproced',dw_resumen.getitemnumber(1,'compute_2'))
dw_cotizacab.setitem(1,'tproced',dw_resumen.getitemnumber(1,'compute_1'))
dw_cotizacab.setitem(1,'usuario',usuario)
long ncot
ncot=f_trae_ndoc('COT',clugar,'Cotización')

if ncot=-1 then return -1
dw_cotizacab.setitem(1,'ncotiza',ncot)
dw_cotizacab.setitem(1,'clugar',clugar)
long j,nserv,cual,donde,l
for j=1 to dw_factura.rowcount()
	nserv=dw_factura.getitemnumber(j,'item_trat')
	cual=idw_servicios.find('item='+string(nserv),1,idw_servicios.rowcount())
	idw_servicios.setitem(cual,'Ncotiza',ncot)
	idw_servicios.setitem(cual,'clugar_cot',clugar)
	idw_servicios.setitem(cual,'nitem_cot',dw_factura.getitemnumber(j,'numero'))
	donde=dw_cotizacpo.insertrow(0)
	dw_cotizacpo.setitem(donde,'ncotiza',ncot)
	dw_cotizacpo.setitem(donde,'clugar',clugar)
	dw_cotizacpo.setitem(donde,'nitem',dw_factura.getitemnumber(j,'numero'))
	dw_cotizacpo.setitem(donde,'cemp',dw_factura.getitemstring(j,'cemp'))
	dw_cotizacpo.setitem(donde,'ccontrato',dw_factura.getitemstring(j,'ccontrato'))
	dw_cotizacpo.setitem(donde,'cplan',dw_factura.getitemstring(j,'plan'))
	dw_cotizacpo.setitem(donde,'cproced',dw_factura.getitemstring(j,'cproc'))
	dw_cotizacpo.setitem(donde,'proccups',dw_factura.getitemstring(j,'proccups'))
	dw_cotizacpo.setitem(donde,'codmanual',dw_factura.getitemstring(j,'cod_manual'))
	dw_cotizacpo.setitem(donde,'vproced',dw_factura.getitemnumber(j,'vt_proc'))
	dw_cotizacpo.setitem(donde,'vemp',dw_factura.getitemnumber(j,'vt_emp'))
	dw_cotizacpo.setitem(donde,'cantidad',1)
	dw_cotizacpo.setitem(donde,'codconcepto',dw_factura.getitemstring(j,'cod_concep'))
	dw_cotizacpo.setitem(donde,'autorizacion',dw_factura.getitemstring(j,'autoriza'))
	dw_cotizacpo.setitem(donde,'rip',dw_factura.getitemstring(j,'rips'))
	dw_cotizacpo.setitem(donde,'tipoproc',dw_factura.getitemstring(j,'tipo_proc'))
	choose case dw_factura.getitemstring(j,'que_paga')
		case 'Copago'
			dw_cotizacpo.setitem(donde,'vcopago',dw_factura.getitemnumber(j,'vt_pac'))
		case 'nada'
		case 'Cuota Mode.'
			dw_cotizacpo.setitem(donde,'vcm',dw_factura.getitemnumber(j,'vt_pac'))
		case 'Cuota Recu.'
			dw_cotizacpo.setitem(donde,'vcr',dw_factura.getitemnumber(j,'vt_pac'))
		case 'particular'
			dw_cotizacpo.setitem(donde,'vpart',dw_factura.getitemnumber(j,'vt_pac'))
	end choose
	dw_factura_cpo.setfilter("num_padre="+string(dw_factura.getitemnumber(j,"numero")))
	dw_factura_cpo.filter()
	for l=1 to dw_factura_cpo.rowcount()
		donde=dw_cot_sub.insertrow(0)
		dw_cot_sub.setitem(donde,"ncotiza",ncot)
		dw_cot_sub.setitem(donde,"clugar",clugar)
		dw_cot_sub.setitem(donde,"nitem",dw_factura.getitemnumber(j,"numero"))
		dw_cot_sub.setitem(donde,"ndeta",dw_factura_cpo.getitemnumber(l,"numero"))
		dw_cot_sub.setitem(donde,"tipoproc",dw_factura_cpo.getitemstring(l,"tipo_proc"))
		dw_cot_sub.setitem(donde,"cproced",dw_factura_cpo.getitemstring(l,"cproced"))
		dw_cot_sub.setitem(donde,"vproced",dw_factura_cpo.getitemnumber(l,"valor"))
		dw_cot_sub.setitem(donde,"codmanual",dw_factura_cpo.getitemstring(l,"cod_manual"))
	next //dw_fact_subcpo
next
if dw_cotizacab.update()=-1 then return -1
if dw_cotizacpo.update()=-1 then return -1
if dw_cot_sub.update()=-1 then return -1
if idw_servicios.update()=-1 then return -1 
commit;
if cbx_1.checked then
	any par[2]
	par[1]=ncot
	par[2]=clugar
	pb_factu.imprimir(par,'','0')
end if
i_retorna='si'
return ncot

end function

on w_cotizar.create
int iCurrent
call super::create
this.dw_procs=create dw_procs
this.st_6=create st_6
this.pb_1=create pb_1
this.dw_cotizacab=create dw_cotizacab
this.dw_cotizacpo=create dw_cotizacpo
this.dw_cot_sub=create dw_cot_sub
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_procs
this.Control[iCurrent+2]=this.st_6
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.dw_cotizacab
this.Control[iCurrent+5]=this.dw_cotizacpo
this.Control[iCurrent+6]=this.dw_cot_sub
end on

on w_cotizar.destroy
call super::destroy
destroy(this.dw_procs)
destroy(this.st_6)
destroy(this.pb_1)
destroy(this.dw_cotizacab)
destroy(this.dw_cotizacpo)
destroy(this.dw_cot_sub)
end on

event close;call super::close;closewithreturn(this,i_retorna)
end event

event open;call super::open;idw_servicios=message.powerobjectparm
string usua
select nombre into :usua from usuarios where usuario=:usuario;
title='Cotización de Servicios ('+usuario+') '+usua
long cuantos=0,j,donde
for j=1 to idw_servicios.rowcount()
	if isnull(idw_servicios.getitemnumber(j,'nfact')) and isnull(idw_servicios.getitemnumber(j,'ncotiza')) and(idw_servicios.getitemstring(j,'realizado')='0' or idw_servicios.getitemstring(j,'realizado')='1' or idw_servicios.getitemstring(j,'realizado')='2')then
		donde=dw_procs.insertrow(0)
		dw_procs.setitem(donde,'cproc',idw_servicios.getitemstring(j,'codproced'))
		dw_procs.setitem(donde,'desproc',idw_servicios.getitemstring(j,'proced_descripcion'))
		dw_procs.setitem(donde,'ntrat',idw_servicios.getitemnumber(j,'ntratamiento'))
		dw_procs.setitem(donde,'clug_trat',idw_servicios.getitemstring(j,'clugar'))
		dw_procs.setitem(donde,'item',idw_servicios.getitemnumber(j,'item'))
		cuantos ++
	end if
next
if cuantos=0 then
	messagebox("Atención",'No hay servicios para Cotizar')
	close(this)
end if
end event

type sle_siras from w_factura_base`sle_siras within w_cotizar
end type

type ddlb_archivos from w_factura_base`ddlb_archivos within w_cotizar
end type

type dw_his_acu from w_factura_base`dw_his_acu within w_cotizar
end type

type pb_aut_cc from w_factura_base`pb_aut_cc within w_cotizar
end type

type dw_kardexdeta from w_factura_base`dw_kardexdeta within w_cotizar
end type

type dw_lote_mov from w_factura_base`dw_lote_mov within w_cotizar
end type

type pb_reci from w_factura_base`pb_reci within w_cotizar
boolean visible = false
integer x = 3671
integer y = 1184
boolean enabled = false
end type

type pb_factu from w_factura_base`pb_factu within w_cotizar
integer x = 1262
integer y = 340
string powertiptext = "Opciones de Impresión de la Cotización"
string cod_rep = "COT"
string nombre_rep = "Cotización de Servicios"
end type

type dw_factadm from w_factura_base`dw_factadm within w_cotizar
integer x = 3666
integer y = 840
end type

type dw_admis from w_factura_base`dw_admis within w_cotizar
integer x = 3666
integer y = 960
end type

type st_ayuda from w_factura_base`st_ayuda within w_cotizar
integer y = 1664
end type

type pb_kit from w_factura_base`pb_kit within w_cotizar
boolean visible = false
integer x = 3781
integer y = 708
boolean enabled = false
end type

type cbx_equiv from w_factura_base`cbx_equiv within w_cotizar
integer y = 416
end type

type cbx_3 from w_factura_base`cbx_3 within w_cotizar
integer y = 412
integer height = 52
end type

type st_cuant from w_factura_base`st_cuant within w_cotizar
integer y = 468
end type

type cbx_2 from w_factura_base`cbx_2 within w_cotizar
integer x = 3666
integer y = 1060
integer width = 96
end type

type cbx_1 from w_factura_base`cbx_1 within w_cotizar
integer x = 1198
integer y = 332
integer width = 553
string text = "    Imprimir Cotización"
end type

type pb_req_cont from w_factura_base`pb_req_cont within w_cotizar
boolean visible = false
integer x = 3771
integer y = 1048
boolean enabled = false
end type

type dw_segrespon from w_factura_base`dw_segrespon within w_cotizar
integer x = 3698
integer y = 340
integer width = 73
end type

type sle_proc from w_factura_base`sle_proc within w_cotizar
boolean visible = false
integer x = 3776
integer y = 528
integer width = 41
integer height = 92
boolean enabled = false
end type

type gb_8 from w_factura_base`gb_8 within w_cotizar
integer x = 3776
integer y = 1464
integer width = 69
integer height = 80
end type

type gb_7 from w_factura_base`gb_7 within w_cotizar
integer x = 3776
integer y = 1356
integer width = 69
integer height = 80
end type

type gb_5 from w_factura_base`gb_5 within w_cotizar
integer x = 3776
integer y = 1248
integer width = 69
integer height = 80
end type

type st_4 from w_factura_base`st_4 within w_cotizar
integer y = 468
end type

type st_3 from w_factura_base`st_3 within w_cotizar
integer x = 1202
integer y = 0
end type

type sle_autoriza from w_factura_base`sle_autoriza within w_cotizar
integer x = 1198
integer y = 56
end type

type pb_borra from w_factura_base`pb_borra within w_cotizar
integer x = 1536
integer y = 192
boolean enabled = false
end type

type dw_getareo from w_factura_base`dw_getareo within w_cotizar
integer x = 3712
end type

type dw_equiv from w_factura_base`dw_equiv within w_cotizar
integer x = 3717
end type

type st_2 from w_factura_base`st_2 within w_cotizar
boolean visible = false
integer x = 3694
integer y = 612
integer width = 96
boolean enabled = false
end type

type st_1 from w_factura_base`st_1 within w_cotizar
boolean visible = false
integer x = 3685
integer y = 464
integer width = 169
boolean enabled = false
end type

type sle_poliza from w_factura_base`sle_poliza within w_cotizar
boolean visible = false
integer x = 3680
integer y = 668
integer width = 87
boolean enabled = false
end type

type dw_tarifas from w_factura_base`dw_tarifas within w_cotizar
integer x = 3712
end type

type dw_cont_det from w_factura_base`dw_cont_det within w_cotizar
integer x = 3707
end type

type pb_buscar from w_factura_base`pb_buscar within w_cotizar
boolean visible = false
integer x = 3781
integer y = 640
boolean enabled = false
end type

type dw_tip_ingres from w_factura_base`dw_tip_ingres within w_cotizar
boolean visible = false
integer x = 3680
integer y = 528
integer width = 59
integer height = 124
boolean enabled = false
end type

type dw_resumen from w_factura_base`dw_resumen within w_cotizar
integer y = 1268
end type

type dw_forma_pago from w_factura_base`dw_forma_pago within w_cotizar
integer x = 3680
integer y = 1416
integer width = 64
integer height = 136
end type

type pb_soat from w_factura_base`pb_soat within w_cotizar
integer x = 1710
integer y = 16
end type

type gb_1 from w_factura_base`gb_1 within w_cotizar
boolean visible = false
integer x = 3671
integer y = 1116
integer width = 59
integer height = 68
boolean enabled = false
end type

type gb_2 from w_factura_base`gb_2 within w_cotizar
boolean visible = false
integer x = 3698
integer y = 1612
integer width = 41
integer height = 72
boolean enabled = false
end type

type gb_3 from w_factura_base`gb_3 within w_cotizar
integer x = 3776
integer y = 1140
integer width = 69
integer height = 80
end type

type pb_facturar from w_factura_base`pb_facturar within w_cotizar
integer x = 1362
integer y = 192
boolean enabled = false
end type

event pb_facturar::clicked;call super::clicked;if i_retorna='si' then close(parent)
end event

type pb_paci from w_factura_base`pb_paci within w_cotizar
boolean visible = false
integer x = 3785
integer y = 780
boolean enabled = false
end type

type pb_emp from w_factura_base`pb_emp within w_cotizar
boolean visible = false
integer x = 3767
integer y = 896
boolean enabled = false
end type

type pb_reimprimir from w_factura_base`pb_reimprimir within w_cotizar
boolean visible = false
integer x = 3767
integer y = 972
boolean enabled = false
end type

type pb_calcula from w_factura_base`pb_calcula within w_cotizar
integer x = 1705
integer y = 192
end type

type dw_factura_cpo from w_factura_base`dw_factura_cpo within w_cotizar
integer x = 3721
end type

type p_1 from w_factura_base`p_1 within w_cotizar
boolean visible = false
integer x = 3680
integer y = 768
integer width = 64
boolean enabled = false
boolean originalsize = false
end type

type st_5 from w_factura_base`st_5 within w_cotizar
integer y = 468
end type

type dw_rec_caj_cab from w_factura_base`dw_rec_caj_cab within w_cotizar
integer x = 3675
integer y = 1296
integer width = 55
integer height = 108
boolean enabled = false
end type

type pb_pagare from w_factura_base`pb_pagare within w_cotizar
integer x = 3675
integer y = 1244
integer height = 40
boolean enabled = false
end type

type pb_parcial from w_factura_base`pb_parcial within w_cotizar
integer x = 23
integer y = 1288
end type

type dw_memory from w_factura_base`dw_memory within w_cotizar
end type

type dw_acum_soat from w_factura_base`dw_acum_soat within w_cotizar
end type

type dw_factura from w_factura_base`dw_factura within w_cotizar
integer y = 540
end type

type gb_4 from w_factura_base`gb_4 within w_cotizar
integer y = 416
end type

type pb_faccon from w_factura_base`pb_faccon within w_cotizar
end type

type dw_emppac from w_factura_base`dw_emppac within w_cotizar
integer x = 1920
integer y = 60
integer width = 1595
end type

type gb_6 from w_factura_base`gb_6 within w_cotizar
integer x = 1888
integer width = 1664
integer height = 376
end type

type st_siras from w_factura_base`st_siras within w_cotizar
end type

type cbx_4 from w_factura_base`cbx_4 within w_cotizar
end type

type pb_pagares from w_factura_base`pb_pagares within w_cotizar
integer x = 3680
integer y = 1552
integer width = 55
integer height = 48
boolean originalsize = false
end type

type dw_reccaj_cpo from w_factura_base`dw_reccaj_cpo within w_cotizar
end type

type dw_procs from datawindow within w_cotizar
integer x = 9
integer y = 52
integer width = 1161
integer height = 352
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_procs_cotizar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_cotizar
integer x = 14
integer width = 549
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos a Cotizar"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_cotizar
integer x = 1193
integer y = 192
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
string picturename = "pesos.gif"
string disabledname = "d_pesos.gif"
alignment htextalign = left!
string powertiptext = "Cotizar"
end type

event clicked;long j,edad,ntrat,nitem_trat
string emp,cont,sexo,codta,estrato,clug_trat,cproc,desproc,tipo_fac
int ret
emp=dw_emppac.getitemstring(dw_emppac.getrow(),'codemp')
cont=dw_emppac.getitemstring(dw_emppac.getrow(),'codcontrato')
tipo_fac=dw_emppac.getitemstring(dw_emppac.getrow(),'tipo_fac')
edad=w_principal.dw_1.getitemnumber(1,'dias')
sexo=w_principal.dw_1.getitemstring(1,'sexo')
codta=dw_emppac.getitemstring(dw_emppac.getrow(),'codta')
estrato=w_principal.dw_1.getitemstring(1,'estrato')

for j=1 to dw_procs.rowcount()
	ntrat=dw_procs.getitemnumber(j,'ntrat')
	nitem_trat=dw_procs.getitemnumber(j,'item')
	clug_trat=dw_procs.getitemstring(j,'clug_trat')
	cproc=dw_procs.getitemstring(j,'cproc')
	desproc=dw_procs.getitemstring(j,'desproc')
	ret=lf_cargar_a(cproc,desproc,1,'C','1',sle_autoriza.text,emp,cont,0, &
	  '',tipdoc,docu,edad,sexo,codta,estrato,'','','S',1,0, &
	  '',0,'','','',0,'',0,'',0,&
	  0,0,'',0,ntrat,clug_trat,nitem_trat,'','!',0,0,0,'',tipo_fac,0,'','',0,'0','','')
next
pb_facturar.enabled=true
pb_borra.enabled=true
enabled=false
resumen('S')
//37 parametros ( p_codigo,p_desproc, p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta, p_estrato, p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
//  p_sec_cant_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat, p_clug_trat, p_item_trat)


end event

type dw_cotizacab from datawindow within w_cotizar
boolean visible = false
integer x = 1431
integer y = 1680
integer width = 283
integer height = 60
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cotiza_cab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_cotizacpo from datawindow within w_cotizar
boolean visible = false
integer x = 1728
integer y = 1680
integer width = 329
integer height = 60
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cotiza_cpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_cot_sub from datawindow within w_cotizar
boolean visible = false
integer x = 2080
integer y = 1680
integer width = 375
integer height = 60
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cotiza_subcpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

