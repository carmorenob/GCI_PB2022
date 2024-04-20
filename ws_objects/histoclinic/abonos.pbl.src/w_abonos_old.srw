$PBExportHeader$w_abonos_old.srw
forward
global type w_abonos_old from window
end type
type dw_abonos from datawindow within w_abonos_old
end type
type t_1 from tab within w_abonos_old
end type
type tp_1 from userobject within t_1
end type
type st_2 from statictext within tp_1
end type
type st_1 from statictext within tp_1
end type
type dw_abo_pag from datawindow within tp_1
end type
type dw_pag_viej from datawindow within tp_1
end type
type tp_1 from userobject within t_1
st_2 st_2
st_1 st_1
dw_abo_pag dw_abo_pag
dw_pag_viej dw_pag_viej
end type
type tp_2 from userobject within t_1
end type
type st_5 from statictext within tp_2
end type
type st_4 from statictext within tp_2
end type
type st_3 from statictext within tp_2
end type
type dw_ing_act from datawindow within tp_2
end type
type dw_ab_ing_det from datawindow within tp_2
end type
type dw_ab_ing from datawindow within tp_2
end type
type tp_2 from userobject within t_1
st_5 st_5
st_4 st_4
st_3 st_3
dw_ing_act dw_ing_act
dw_ab_ing_det dw_ab_ing_det
dw_ab_ing dw_ab_ing
end type
type tp_3 from userobject within t_1
end type
type st_8 from statictext within tp_3
end type
type st_6 from statictext within tp_3
end type
type dw_ab_od_det from datawindow within tp_3
end type
type dw_od_ab_cab from datawindow within tp_3
end type
type tp_3 from userobject within t_1
st_8 st_8
st_6 st_6
dw_ab_od_det dw_ab_od_det
dw_od_ab_cab dw_od_ab_cab
end type
type t_1 from tab within w_abonos_old
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
type pb_1 from pb_report within w_abonos_old
end type
type dw_ac_fc from datawindow within w_abonos_old
end type
type cbx_1 from checkbox within w_abonos_old
end type
type pb_save from picturebutton within w_abonos_old
end type
type pb_del from picturebutton within w_abonos_old
end type
type pb_new from picturebutton within w_abonos_old
end type
end forward

global type w_abonos_old from window
integer width = 3269
integer height = 1768
boolean titlebar = true
string title = "Abonos del Paciente"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "abono.ico"
dw_abonos dw_abonos
t_1 t_1
pb_1 pb_1
dw_ac_fc dw_ac_fc
cbx_1 cbx_1
pb_save pb_save
pb_del pb_del
pb_new pb_new
end type
global w_abonos_old w_abonos_old

type variables
real i_val_max
end variables

on w_abonos_old.create
this.dw_abonos=create dw_abonos
this.t_1=create t_1
this.pb_1=create pb_1
this.dw_ac_fc=create dw_ac_fc
this.cbx_1=create cbx_1
this.pb_save=create pb_save
this.pb_del=create pb_del
this.pb_new=create pb_new
this.Control[]={this.dw_abonos,&
this.t_1,&
this.pb_1,&
this.dw_ac_fc,&
this.cbx_1,&
this.pb_save,&
this.pb_del,&
this.pb_new}
end on

on w_abonos_old.destroy
destroy(this.dw_abonos)
destroy(this.t_1)
destroy(this.pb_1)
destroy(this.dw_ac_fc)
destroy(this.cbx_1)
destroy(this.pb_save)
destroy(this.pb_del)
destroy(this.pb_new)
end on

event open;if docu="" or isnull(docu) then return
t_1.tp_1.dw_pag_viej.reset()
t_1.tp_1.dw_abo_pag.reset()
t_1.tp_1.dw_pag_viej.retrieve(tipdoc,docu)
t_1.tp_2.dw_ab_ing.reset()
t_1.tp_2.dw_ab_ing_det.reset()
t_1.tp_2.dw_ab_ing.retrieve(tipdoc,docu)
t_1.tp_2.dw_ing_act.retrieve(tipdoc,docu)
t_1.tp_3.dw_od_ab_cab.reset()
t_1.tp_3.dw_ab_od_det.reset()
t_1.tp_3.dw_od_ab_cab.retrieve(tipdoc,docu)

end event

type dw_abonos from datawindow within w_abonos_old
integer x = 1001
integer y = 1476
integer width = 1326
integer height = 160
integer taborder = 30
string title = "none"
string dataobject = "dw_tesoabono"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;choose case t_1.selectedtab
	case 1,3
		
	case 2
		
end choose
accepttext()
end event

type t_1 from tab within w_abonos_old
integer x = 14
integer y = 8
integer width = 3182
integer height = 1452
integer taborder = 10
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
end type

on t_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3}
end on

on t_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
end on

type tp_1 from userobject within t_1
integer x = 18
integer y = 112
integer width = 3145
integer height = 1324
long backcolor = 67108864
string text = "Pagarés"
long tabtextcolor = 33554432
string picturename = "abono.ico"
long picturemaskcolor = 536870912
string powertiptext = "Realizar Abonos de Pagarés"
st_2 st_2
st_1 st_1
dw_abo_pag dw_abo_pag
dw_pag_viej dw_pag_viej
end type

on tp_1.create
this.st_2=create st_2
this.st_1=create st_1
this.dw_abo_pag=create dw_abo_pag
this.dw_pag_viej=create dw_pag_viej
this.Control[]={this.st_2,&
this.st_1,&
this.dw_abo_pag,&
this.dw_pag_viej}
end on

on tp_1.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_abo_pag)
destroy(this.dw_pag_viej)
end on

type st_2 from statictext within tp_1
integer x = 27
integer y = 696
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
string text = "Abonos del Pagaré:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within tp_1
integer x = 23
integer width = 485
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagarés del Paciente:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_abo_pag from datawindow within tp_1
integer x = 27
integer y = 752
integer width = 2610
integer height = 548
integer taborder = 20
string title = "none"
string dataobject = "dw_abonos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_pag_viej from datawindow within tp_1
integer x = 23
integer y = 56
integer width = 3072
integer height = 628
integer taborder = 10
string title = "none"
string dataobject = "dw_pagares_viejos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;if getrow()<1 then return
dw_abo_pag.retrieve(getitemnumber(getrow(),'npagare'),getitemstring(getrow(),'clugar'))
end event

type tp_2 from userobject within t_1
integer x = 18
integer y = 112
integer width = 3145
integer height = 1324
long backcolor = 67108864
string text = "Abiertos"
long tabtextcolor = 33554432
string picturename = "hospital.ico"
long picturemaskcolor = 536870912
string powertiptext = "Realizar Abonos para utilizar en Admisiones"
st_5 st_5
st_4 st_4
st_3 st_3
dw_ing_act dw_ing_act
dw_ab_ing_det dw_ab_ing_det
dw_ab_ing dw_ab_ing
end type

on tp_2.create
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.dw_ing_act=create dw_ing_act
this.dw_ab_ing_det=create dw_ab_ing_det
this.dw_ab_ing=create dw_ab_ing
this.Control[]={this.st_5,&
this.st_4,&
this.st_3,&
this.dw_ing_act,&
this.dw_ab_ing_det,&
this.dw_ab_ing}
end on

on tp_2.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_ing_act)
destroy(this.dw_ab_ing_det)
destroy(this.dw_ab_ing)
end on

type st_5 from statictext within tp_2
integer x = 18
integer y = 816
integer width = 425
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Admisiones Activas"
boolean focusrectangle = false
end type

type st_4 from statictext within tp_2
integer x = 1211
integer y = 4
integer width = 517
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Abonos de la Admisión:"
boolean focusrectangle = false
end type

type st_3 from statictext within tp_2
integer x = 27
integer width = 539
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Admisiones con Abonos:"
boolean focusrectangle = false
end type

type dw_ing_act from datawindow within tp_2
integer x = 14
integer y = 872
integer width = 2587
integer height = 420
integer taborder = 20
string title = "none"
string dataobject = "dw_ingres_activo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_ab_ing_det from datawindow within tp_2
integer x = 1207
integer y = 56
integer width = 1906
integer height = 744
integer taborder = 20
string title = "none"
string dataobject = "dw_abonos_ing_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_ab_ing from datawindow within tp_2
integer x = 27
integer y = 56
integer width = 1134
integer height = 736
integer taborder = 20
string title = "none"
string dataobject = "dw_abonos_ingresos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then return
dw_ab_ing_det.retrieve(getitemnumber(getrow(),'nh'),getitemstring(getrow(),'codtingre'),getitemstring(getrow(),'clugar_hadm'))
end event

type tp_3 from userobject within t_1
integer x = 18
integer y = 112
integer width = 3145
integer height = 1324
long backcolor = 67108864
string text = "Odontología"
long tabtextcolor = 33554432
string picturename = "base16.ico"
long picturemaskcolor = 536870912
string powertiptext = "Realizar Abonos de Tratamientos ya Cotizados y no facturados"
st_8 st_8
st_6 st_6
dw_ab_od_det dw_ab_od_det
dw_od_ab_cab dw_od_ab_cab
end type

on tp_3.create
this.st_8=create st_8
this.st_6=create st_6
this.dw_ab_od_det=create dw_ab_od_det
this.dw_od_ab_cab=create dw_od_ab_cab
this.Control[]={this.st_8,&
this.st_6,&
this.dw_ab_od_det,&
this.dw_od_ab_cab}
end on

on tp_3.destroy
destroy(this.st_8)
destroy(this.st_6)
destroy(this.dw_ab_od_det)
destroy(this.dw_od_ab_cab)
end on

type st_8 from statictext within tp_3
integer x = 23
integer y = 640
integer width = 549
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Abonos del Tratamiento:"
boolean focusrectangle = false
end type

type st_6 from statictext within tp_3
integer x = 14
integer y = 16
integer width = 594
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tratamientos del Paciente:"
boolean focusrectangle = false
end type

type dw_ab_od_det from datawindow within tp_3
integer x = 14
integer y = 692
integer width = 2638
integer height = 588
integer taborder = 30
string title = "none"
string dataobject = "dw_abonos_odo_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_od_ab_cab from datawindow within tp_3
integer x = 14
integer y = 68
integer width = 2624
integer height = 556
integer taborder = 10
string title = "none"
string dataobject = "dw_od_abonocab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then return
dw_ab_od_det.retrieve(getitemnumber(getrow(),'ntratamiento'),getitemstring(getrow(),'clugar'))
end event

type pb_1 from pb_report within w_abonos_old
integer x = 3095
integer y = 1492
integer width = 87
integer height = 72
integer taborder = 20
boolean originalsize = false
string picturename = "print2.gif"
string powertiptext = "Click contrario para propiedades"
string cod_rep = "RC"
string nombre_rep = "Recibo de caja"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;long fila
any par[3]

if t_1.selectedtab=1 then
	if t_1.tp_1.dw_abo_pag.rowcount()=0 then return
	fila=t_1.tp_1.dw_abo_pag.getrow()
	par[1]=t_1.tp_1.dw_abo_pag.getitemnumber(fila,'nrecibo')
	par[2]=t_1.tp_1.dw_abo_pag.getitemstring(fila,'clugar_rec')
	par[3]='0'
elseif t_1.selectedtab=2 then
	if t_1.tp_2.dw_ab_ing_det.rowcount()=0 then return
	fila=t_1.tp_2.dw_ab_ing_det.getrow()
	par[1]=t_1.tp_2.dw_ab_ing_det.getitemnumber(fila,'nrecibo')
	par[2]=t_1.tp_2.dw_ab_ing_det.getitemstring(fila,'clugar_rec')
	par[3]='0'
else
	if t_1.tp_3.dw_ab_od_det.rowcount()=0 then return
	fila=t_1.tp_3.dw_ab_od_det.getrow()
	par[1]=t_1.tp_3.dw_ab_od_det.getitemnumber(fila,'nrecibo')
	par[2]=t_1.tp_3.dw_ab_od_det.getitemstring(fila,'clugar_rec')
	par[3]='0'
end if
imprimir(par,'','0')
end event

type dw_ac_fc from datawindow within w_abonos_old
boolean visible = false
integer x = 14
integer y = 1468
integer width = 439
integer height = 60
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_actu_factu_con_abonos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type cbx_1 from checkbox within w_abonos_old
integer x = 2670
integer y = 1496
integer width = 521
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir Recibo"
boolean checked = true
end type

event clicked;pb_1.visible=checked
end event

type pb_save from picturebutton within w_abonos_old
event mousemove pbm_mousemove
integer x = 2336
integer y = 1476
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if dw_abonos.rowcount()<1 then return
dw_abonos.accepttext()
dec valor,acum
valor=dw_abonos.getitemnumber(1,"valor")
if valor=0 then return
long nrecibo,npagare,ntratamiento,nh
string carreta,clug_pag,clug_nh,clug_tto
datetime fecha,hora
setnull(nrecibo)
nrecibo=f_trae_ndoc('RC',clugar,'Recibo de Caja')
if nrecibo=-1 then return
fecha=datetime(today())
hora=datetime(today(),time(string(now())))
if t_1.selectedtab=1 then
	npagare=t_1.tp_1.dw_pag_viej.getitemnumber(t_1.tp_1.dw_pag_viej.getrow(),'npagare')
	clug_pag=t_1.tp_1.dw_pag_viej.getitemstring(t_1.tp_1.dw_pag_viej.getrow(),'clugar')
	carreta="Abono del pagaré Nro: "+string(npagare)
elseif t_1.selectedtab=2 then
	clug_nh=t_1.tp_2.dw_ing_act.getitemstring(t_1.tp_2.dw_ing_act.getrow(),"clugar")
	nh=t_1.tp_2.dw_ing_act.getitemnumber(t_1.tp_2.dw_ing_act.getrow(),"nh")
	carreta="Abono del ingreso Nro:"+string(nh)
else
	clug_tto=t_1.tp_3.dw_od_ab_cab.GetItemstring(t_1.tp_3.dw_od_ab_cab.getrow(),"clugar")
	ntratamiento=t_1.tp_3.dw_od_ab_cab.GetItemNumber(t_1.tp_3.dw_od_ab_cab.getrow(),"ntratamiento")
	carreta="Abono del tratamiento Odontológico Nro:"+string(ntratamiento)
end if
INSERT INTO tesorecajcab ( nrcaj, CLugar, Fecha, Hora, TipoDoc, Documento, Trecibo, tpago, tsaldo, descuento, contabil, fpago, concepto, usuario )
values (:nrecibo,:clugar,:fecha,:hora,:tipdoc,:docu,:valor,:valor,0,0,'p','1',:carreta,:usuario);
if sqlca.sqlcode=-1 then
	messagebox("Error Insertando recibo de caja",sqlca.sqlerrtext)
	rollback;
	return
end if
long nabono,j

setnull(nabono)
select max(nabono) into :nabono from tesoabono where clugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo tesoabono",sqlca.sqlerrtext)
	rollback;
	return
end if
if isnull(nabono) then nabono=0
nabono++
dw_abonos.setitem(1,"nabono",nabono)
dw_abonos.setitem(1,"clugar",clugar)
dw_abonos.setitem(1,"nrecibo",nrecibo)
dw_abonos.setitem(1,"clugar_rec",clugar)
if dw_abonos.update()=-1 then
	rollback;
	return
end if
real va
if t_1.selectedtab=1 then
	va=dw_abonos.getitemnumber(1,"valor")
	if va=i_val_max then
		update tesopagarecab set estado='1' where npagare=:npagare and clugar=:clug_pag;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando estado de pagaré",sqlca.sqlerrtext)
			rollback;
			return
		end if
		t_1.tp_1.dw_pag_viej.setitem(t_1.tp_1.dw_pag_viej.getrow(),"estado",'1')
	end if
	dw_abonos.retrieve(npagare,clug_pag)
	//la maricada de don jeffer de actualizar la cabeza de las facturas que afectó este abono
	//esto solo sucede cuando se hace un abono a un pagaré => en la cabeza de las facturas 
	//"disque" se debe actualizar el campo vtpagare
	if dw_ac_fc.retrieve(nrecibo,clugar)>0 then
		acum=valor
		for j=1 to dw_ac_fc.rowcount()
			if acum>dw_ac_fc.getitemnumber(j,'vtpaciente') then
				dw_ac_fc.setitem(j,'vtcancelo',dw_ac_fc.getitemnumber(j,'vtpaciente'))
				dw_ac_fc.setitem(j,'vtpagare',0)
				acum -= dw_ac_fc.getitemnumber(j,'vtcancelo')
			else
				dw_ac_fc.setitem(j,'vtcancelo',dw_ac_fc.getitemnumber(j,'vtcancelo')+acum)
				dw_ac_fc.setitem(j,'vtpagare',dw_ac_fc.getitemnumber(j,'vtpagare') -acum)
				acum=0
				exit
			end if
		next
		if dw_ac_fc.update()=-1 then
			rollback;
			return
		end if
	end if
end if
commit;
if cbx_1.checked then
	any par[3]
	par[1]=nrecibo
	par[2]=clugar
	par[3]='0'
	pb_1.imprimir(par,'','0')
end if
pb_new.enabled=true
this.enabled=false
pb_del.enabled=false
t_1.enabled=true
parent.triggerevent(open!)
end event

type pb_del from picturebutton within w_abonos_old
event mousemove pbm_mousemove
integer x = 2501
integer y = 1476
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "Cancelar.GIF"
string disabledname = "d_Cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;dw_abonos.reset()
pb_save.enabled=false
pb_new.enabled=true
enabled=false
t_1.enabled=true
end event

type pb_new from picturebutton within w_abonos_old
event mousemove pbm_mousemove
integer x = 3003
integer y = 992
integer width = 151
integer height = 132
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "pesos.GIF"
string disabledname = "d_pesos.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo Abono"
end type

event clicked;real vpag,sum_abon=0,v_cotiz
choose case t_1.selectedtab
	case 1
		if t_1.tp_1.dw_pag_viej.rowcount()<1 then return
		if t_1.tp_1.dw_pag_viej.getitemstring(t_1.tp_1.dw_pag_viej.getrow(),'estado')<>'0' then return
		vpag=t_1.tp_1.dw_pag_viej.getitemnumber(t_1.tp_1.dw_pag_viej.getrow(),'valor')
		if t_1.tp_1.dw_abo_pag.rowcount()>0 then sum_abon=t_1.tp_1.dw_abo_pag.getitemnumber(1,"sum_abonos")
		if  vpag - sum_abon <=0 then return
		dw_abonos.reset()
		dw_abonos.insertrow(1)
		dw_abonos.setitem(1,"npagare",t_1.tp_1.dw_pag_viej.getitemnumber(t_1.tp_1.dw_pag_viej.getrow(),'npagare'))
		dw_abonos.setitem(1,"clugar_pag",t_1.tp_1.dw_pag_viej.getitemstring(t_1.tp_1.dw_pag_viej.getrow(),'clugar'))
		i_val_max=vpag - sum_abon
		dw_abonos.setitem(1,"valor",i_val_max)
	case 2
		if t_1.tp_2.dw_ing_act.rowcount()<1 then return
		dw_abonos.reset()
		dw_abonos.insertrow(1)
		dw_abonos.setitem(1,"nh",t_1.tp_2.dw_ing_act.getitemnumber(t_1.tp_2.dw_ing_act.getrow(),"nh"))
		dw_abonos.setitem(1,"codtingre",t_1.tp_2.dw_ing_act.getitemstring(t_1.tp_2.dw_ing_act.getrow(),"codtingre"))
		dw_abonos.setitem(1,"clugar_hadm",t_1.tp_2.dw_ing_act.getitemstring(t_1.tp_2.dw_ing_act.getrow(),"clugar"))
	case 3
		if t_1.tp_3.dw_od_ab_cab.rowcount()=0 then return
		if t_1.tp_3.dw_od_ab_cab.getitemstring(t_1.tp_3.dw_od_ab_cab.getrow(),'estado')='2' then return
		v_cotiz=t_1.tp_3.dw_od_ab_cab.getitemnumber(t_1.tp_3.dw_od_ab_cab.getrow(),'sum_cotiz')
		if isnull(v_cotiz) then v_cotiz=0
		vpag=t_1.tp_3.dw_od_ab_cab.getitemnumber(t_1.tp_3.dw_od_ab_cab.getrow(),'sum_factu')
		if isnull(vpag) then vpag=0
		sum_abon=t_1.tp_3.dw_od_ab_cab.getitemnumber(t_1.tp_3.dw_od_ab_cab.getrow(),'sum_abonos')
		if isnull(sum_abon) then sum_abon=0
		if sum_abon + vpag >= v_cotiz then return
		i_val_max=v_cotiz - sum_abon - vpag 
		dw_abonos.reset()
		dw_abonos.insertrow(1)
		dw_abonos.setitem(1,"ntratamiento",t_1.tp_3.dw_od_ab_cab.getitemnumber(t_1.tp_3.dw_od_ab_cab.getrow(),'ntratamiento'))
		dw_abonos.setitem(1,"clugartto",t_1.tp_3.dw_od_ab_cab.getitemstring(t_1.tp_3.dw_od_ab_cab.getrow(),'clugar'))
		dw_abonos.setitem(1,"valor",i_val_max)
end choose
t_1.enabled=false
pb_save.enabled = TRUE
pb_del.enabled=true
enabled = FALSE


end event

