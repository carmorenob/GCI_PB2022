$PBExportHeader$w_lleva_nomina.srw
forward
global type w_lleva_nomina from window
end type
type tab_1 from tab within w_lleva_nomina
end type
type tp_1 from userobject within tab_1
end type
type pb_cancel from picturebutton within tp_1
end type
type pb_ok from picturebutton within tp_1
end type
type dw_1 from datawindow within tp_1
end type
type dw_cpo from datawindow within tp_1
end type
type st_1 from statictext within tp_1
end type
type dw_cab from datawindow within tp_1
end type
type st_2 from statictext within tp_1
end type
type tp_1 from userobject within tab_1
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
dw_cpo dw_cpo
st_1 st_1
dw_cab dw_cab
st_2 st_2
end type
type tp_2 from userobject within tab_1
end type
type pb_2 from picturebutton within tp_2
end type
type pb_1 from picturebutton within tp_2
end type
type dw_patro from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_2 pb_2
pb_1 pb_1
dw_patro dw_patro
end type
type tab_1 from tab within w_lleva_nomina
tp_1 tp_1
tp_2 tp_2
end type
type st_3 from statictext within w_lleva_nomina
end type
type dw_nom from datawindow within w_lleva_nomina
end type
end forward

global type w_lleva_nomina from window
integer width = 3520
integer height = 2128
boolean titlebar = true
string title = "Elegir Nómina para recepción de factura"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
st_3 st_3
dw_nom dw_nom
end type
global w_lleva_nomina w_lleva_nomina

type variables
datawindowchild idw_concep
end variables

forward prototypes
public subroutine wf_insert_rela (string p_cdoc_pre, string p_clug_pre, long p_num_pre, long p_item_pre, decimal p_val, long p_j)
end prototypes

public subroutine wf_insert_rela (string p_cdoc_pre, string p_clug_pre, long p_num_pre, long p_item_pre, decimal p_val, long p_j);long donde_intf
donde_intf=w_recibe_fact.dw_rela.find('char_orig1="'+p_cdoc_pre+'" and char_orig2="'+p_clug_pre+'" and num_orig1='+string(p_num_pre)+' and num_orig2='+string(p_item_pre)+' and num_doc2='+string(p_j),1,w_recibe_fact.dw_rela.rowcount())
if donde_intf=0 then
	donde_intf=w_recibe_fact.dw_rela.insertrow(0)
	w_recibe_fact.dw_rela.setitem(donde_intf,'char_orig1',p_cdoc_pre)
	w_recibe_fact.dw_rela.setitem(donde_intf,'char_orig2',p_clug_pre)
	w_recibe_fact.dw_rela.setitem(donde_intf,'num_orig1',p_num_pre)
	w_recibe_fact.dw_rela.setitem(donde_intf,'num_orig2',p_item_pre)
	w_recibe_fact.dw_rela.setitem(donde_intf,'num_doc2',p_j)
	w_recibe_fact.dw_rela.setitem(donde_intf,'char_doc2',w_recibe_fact.is_cdoc)
	w_recibe_fact.dw_rela.setitem(donde_intf,'char_doc1',w_recibe_fact.is_clug_rad)
end if
w_recibe_fact.dw_rela.setitem(donde_intf,'valor',w_recibe_fact.dw_rela.getitemnumber(donde_intf,'valor')+p_val)
end subroutine

on w_lleva_nomina.create
this.tab_1=create tab_1
this.st_3=create st_3
this.dw_nom=create dw_nom
this.Control[]={this.tab_1,&
this.st_3,&
this.dw_nom}
end on

on w_lleva_nomina.destroy
destroy(this.tab_1)
destroy(this.st_3)
destroy(this.dw_nom)
end on

event open;dw_nom.retrieve()
end event

type tab_1 from tab within w_lleva_nomina
integer x = 14
integer y = 360
integer width = 3438
integer height = 1660
integer taborder = 20
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
alignment alignment = center!
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
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3401
integer height = 1532
long backcolor = 67108864
string text = "Nómina"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
dw_cpo dw_cpo
st_1 st_1
dw_cab dw_cab
st_2 st_2
end type

on tp_1.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.dw_cpo=create dw_cpo
this.st_1=create st_1
this.dw_cab=create dw_cab
this.st_2=create st_2
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.dw_1,&
this.dw_cpo,&
this.st_1,&
this.dw_cab,&
this.st_2}
end on

on tp_1.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
destroy(this.dw_cpo)
destroy(this.st_1)
destroy(this.dw_cab)
destroy(this.st_2)
end on

type pb_cancel from picturebutton within tp_1
integer x = 2085
integer y = 1388
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &c"
boolean cancel = true
boolean originalsize = true
string picturename = "Cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(f_vent_padre(this))
end event

type pb_ok from picturebutton within tp_1
integer x = 1934
integer y = 1388
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;if dw_nom.rowcount()=0 then return
dw_cpo.setredraw(false)
dw_cpo.setfilter('num_nomina='+string(dw_nom.getitemnumber(dw_nom.getrow(),'num_nomina')))
dw_cpo.filter()
long j,k,donde,num_pre,item_pre,donde_intf
if dw_cpo.find('isnull(cod_impu)',1,dw_cpo.rowcount())>0 then
	messagebox('Atención','Alguna deducción de un Empleado no tiene equivalencia con un impuesto, debe existir equivalencia para continuar')
	dw_cab.event rowfocuschanged(dw_cab.getrow())
	dw_cpo.setredraw(true)
	return
end if
donde=dw_cpo.find('isnull(tipodoc_ter) or tipodoc_ter=""',1,dw_cpo.rowcount())
if donde>0 then
	messagebox('Atención','El Empleado:'+dw_cpo.getitemstring(donde,'tipodoc')+' '+dw_cpo.getitemstring(donde,'documento')+' no tiene Tercero en el concepto '+dw_cpo.getitemstring(donde,'cod_concep')+'-'+dw_cpo.getitemstring(donde,'des_concep'))
	dw_cab.event rowfocuschanged(dw_cab.getrow())
	dw_cpo.setredraw(true)
	return
end if
w_recibe_fact.tab_2.selectedtab=3
datawindow dw_t,dw_o
w_recibe_fact.tab_2.t2_3.t5.t5_3.dw_tz.reset()
w_recibe_fact.tab_2.t2_3.tab_4.t4_2.dw_tot.reset()
dw_t=w_recibe_fact.tab_2.t2_3.tab_4.t4_1.dw_cab
dw_t.reset()
dw_t.insertrow(1)
dw_t.setitem(1,'clugar',w_recibe_fact.is_clug_rad)
dw_t.setitem(1,'cod_flujo',w_recibe_fact.dw_orig.getitemstring(1,1))
dw_t.setitem(1,'coddoc',w_recibe_fact.is_cdoc)
dw_t.setitem(1,'tiporelacion','N')
dw_t.setitem(1,'fecha_rel',datetime(today(),now()))
dw_t.setitem(1,'objeto','Causación de la Nómina: '+string(dw_nom.getitemnumber(dw_nom.getrow(),'num_nomina'))+' del mes de '+dw_nom.getitemstring(dw_nom.getrow(),'compute_1'))
w_recibe_fact.tab_2.t2_3.t5.t5_2.dw_anti.reset()
w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.reset()
w_recibe_fact.dw_rela.reset()
w_recibe_fact.tab_2.t2_3.t_ret.t_o.dw_rte.reset()
//string cdoc_pre,clug_pre
dec val
for j=1 to dw_cab.rowcount()
	dw_t=w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo
	dw_cab.setrow(j)
	dw_cab.event rowfocuschanged(j)
	dw_t.insertrow(j)
	dw_t.setitem(j,'clugar',w_recibe_fact.is_clug_rad)
	dw_t.setitem(j,'coddoc',w_recibe_fact.is_cdoc)
	dw_t.setitem(j,'item',j)
	dw_t.setitem(j,'tipodoc',dw_cab.getitemstring(j,'tipodoc'))
	if dw_cab.getitemstring(j,'documento')='31300840' then
		j=j
	
	end if
	dw_t.setitem(j,'documento',dw_cab.getitemstring(j,'documento'))
	dw_t.setitem(j,'val_bruto',dw_cab.getitemnumber(j,'tot_bruto'))
	dw_t.setitem(j,'tbruto',dw_cab.getitemnumber(j,'tot_bruto'))
	dw_t.setitem(j,'cod_rel',dw_1.getitemstring(1,1))
	dw_t.setrow(j)
	dw_t=w_recibe_fact.tab_2.t2_3.t_ret.t_o.dw_rte
	for k=1 to dw_cpo.rowcount()
		donde=dw_t.insertrow(0)
		dw_t.setitem(donde,'clugar',w_recibe_fact.is_clug_rad)
		dw_t.setitem(donde,'coddoc',w_recibe_fact.is_cdoc)
		dw_t.setitem(donde,'item',j)
		dw_t.setitem(donde,'subitem',donde)
		dw_t.setitem(donde,'cod_concep',dw_cpo.getitemstring(k,'cod_impu'))
		dw_t.setitem(donde,'tvalor',dw_cpo.getitemnumber(k,'tbruto'))
		dw_t.setitem(donde,'cod_tipo',dw_cpo.getitemstring(k,'cod_tipo'))
		dw_t.setitem(donde,'accion',dw_cpo.getitemstring(k,'accion'))
		dw_t.setitem(donde,'sobre',dw_cpo.getitemstring(k,'sobre'))
		dw_t.setitem(donde,'cod_empre',dw_cpo.getitemstring(k,'cod_empresa'))
		dw_t.setitem(donde,'cod_total',dw_cpo.getitemstring(k,'codtotal'))
		dw_t.setitem(donde,'definitivo','1')
		dw_t.setitem(donde,'tercero',dw_cpo.getitemstring(k,'tercero'))
		dw_t.setitem(donde,'tipodoc',dw_cpo.getitemstring(k,'tipodoc_ter'))
		dw_t.setitem(donde,'documento',dw_cpo.getitemstring(k,'documento_ter'))
		dw_t.setitem(donde,'nombre1',dw_cpo.getitemstring(k,'nombre1'))
		dw_t.setitem(donde,'nombre2',dw_cpo.getitemstring(k,'nombre2'))
		dw_t.setitem(donde,'apellido1',dw_cpo.getitemstring(k,'apellido1'))
		dw_t.setitem(donde,'apellido2',dw_cpo.getitemstring(k,'apellido2'))
		dw_t.setitem(donde,'razon_social',dw_cpo.getitemstring(k,'razon_social'))
		dw_t.triggerevent('p_itemchanged')
//		cdoc_pre=dw_cpo.getitemstring(k,'coddoc')
//		clug_pre=dw_cpo.getitemstring(k,'clugar')
//		num_pre=dw_cpo.getitemnumber(k,'numdoc')
//		item_pre=dw_cpo.getitemnumber(k,'item')
//		val=dw_cpo.getitemnumber(k,'tbruto')
//		if not isnull(num_pre) then wf_insert_rela(cdoc_pre,clug_pre,num_pre,item_pre,val,j)
	next
next
w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.scrolltorow(1)
w_recibe_fact.ibn_cambio=true
w_recibe_fact.ibn_nueva=true
w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.triggerevent(rowfocuschanged!)
close(f_vent_padre(this))

end event

type dw_1 from datawindow within tp_1
integer x = 27
integer y = 1388
integer width = 1417
integer height = 136
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_concep_nom"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)
idw_concep.setfilter('nomina="1"')
idw_concep.retrieve(w_recibe_fact.is_emp,'0')
insertrow(1)
if idw_concep.rowcount()=1 then
	setitem(1,1,idw_concep.getitemstring(1,'cod_rel'))
end if
end event

type dw_cpo from datawindow within tp_1
integer x = 23
integer y = 848
integer width = 3342
integer height = 512
integer taborder = 40
string title = "none"
string dataobject = "dw_nomcpo_a_relfact"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

type st_1 from statictext within tp_1
integer x = 27
integer y = 792
integer width = 576
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Deducciones al Empleado:"
boolean focusrectangle = false
end type

type dw_cab from datawindow within tp_1
integer x = 23
integer y = 56
integer width = 3278
integer height = 724
integer taborder = 20
string title = "none"
string dataobject = "dw_nom_dev_rfact"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;if getrow()<1 then
	dw_cpo.setfilter('isnull(num_nomina)')
else
	dw_cpo.setfilter('tipodoc="'+getitemstring(getrow(),'tipodoc')+'" and documento="'+getitemstring(getrow(),'documento')+'" and num_nomina='+string(getitemnumber(getrow(),'num_nomina')))
end if
dw_cpo.filter()
end event

type st_2 from statictext within tp_1
integer x = 27
integer width = 640
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bruto a Pagar por Empleado:"
boolean focusrectangle = false
end type

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3401
integer height = 1532
long backcolor = 67108864
string text = "Patronales"
long tabtextcolor = 33554432
string picturename = "buscar.ico"
long picturemaskcolor = 536870912
pb_2 pb_2
pb_1 pb_1
dw_patro dw_patro
end type

on tp_2.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_patro=create dw_patro
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_patro}
end on

on tp_2.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_patro)
end on

type pb_2 from picturebutton within tp_2
integer x = 1413
integer y = 1356
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;if dw_patro.rowcount()=0 then return
long donde
	donde=dw_patro.find('esco=1',1,dw_patro.rowcount())
	if donde=0 then return
	
	w_recibe_fact.tab_2.selectedtab=3
	datawindow dw_t,dw_o
	dw_t=w_recibe_fact.tab_2.t2_3.tab_4.t4_1.dw_cab
	dw_t.reset()
	w_recibe_fact.tab_2.t2_3.t5.t5_2.dw_anti.reset()
	w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.reset()
	w_recibe_fact.dw_rela.reset()
	w_recibe_fact.tab_2.t2_3.t_ret.t_o.dw_rte.reset()
	dw_t.insertrow(1)
	dw_t.setitem(1,'clugar',w_recibe_fact.is_clug_rad)
	dw_t.setitem(1,'cod_flujo',w_recibe_fact.dw_orig.getitemstring(1,1))
	dw_t.setitem(1,'coddoc',w_recibe_fact.is_cdoc)
	dw_t.setitem(1,'tiporelacion','N')
	dw_t.setitem(1,'fecha_rel',datetime(today(),now()))
	
	dw_t.setitem(1,'objeto','Aportes patronales ('+dw_patro.getitemstring(donde,'des_concep')+') de la Nómina: '+string(dw_nom.getitemnumber(dw_nom.getrow(),'num_nomina'))+' del mes de '+dw_nom.getitemstring(dw_nom.getrow(),'compute_1'))
	
	
for donde=1 to dw_patro.rowcount()
	if dw_patro.getitemnumber(donde,'esco')=0 then continue
	

//	dw_patro_deta.setfilter('tipodoc_ter="'+dw_patro.getitemstring(donde,'tipodoc_ter')+'" and documento_ter="'+dw_patro.getitemstring(donde,'documento_ter')+'" and cod_concep="'+dw_patro.getitemstring(donde,'cod_concep')+'"')
//	dw_patro_deta.filter()
	w_recibe_fact.tab_2.t2_3.t5.t5_3.dw_tz.reset()
	
	
	long k,num_pre,item_pre,donde_intf
	string valor
//	string cdoc_pre,clug_pre
//	dec val
	
//	for k=1 to dw_patro_deta.rowcount()
//		cdoc_pre=dw_patro_deta.getitemstring(k,'coddoc')
//		clug_pre=dw_patro_deta.getitemstring(k,'clugar')
//		num_pre=dw_patro_deta.getitemnumber(k,'numdoc')
//		item_pre=dw_patro_deta.getitemnumber(k,'item')
//		val=dw_patro_deta.getitemnumber(k,'tbruto')
//		wf_insert_rela(cdoc_pre,clug_pre,num_pre,item_pre,val,1)
//	next
	dw_t=w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo
	dw_t.insertrow(1)
	valor = dw_t.Describe("Evaluate('max(item)',0)")
	dw_t.setitem(1,'clugar',w_recibe_fact.is_clug_rad)
	dw_t.setitem(1,'coddoc',w_recibe_fact.is_cdoc)
	dw_t.setitem(1,'item',long(valor) + 1)
	dw_t.setitem(1,'tipodoc',dw_patro.getitemstring(donde,'tipodoc_ter'))
	dw_t.setitem(1,'documento',dw_patro.getitemstring(donde,'documento_ter'))
	dw_t.setitem(1,'val_bruto',dw_patro.getitemnumber(donde,'tbruto'))
	dw_t.setitem(1,'tbruto',dw_patro.getitemnumber(donde,'tbruto'))
	dw_t.setitem(1,'tneto',dw_patro.getitemnumber(donde,'tbruto'))
next
dw_t.setrow(1)
w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.event p_itemchanged()

w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.scrolltorow(1)
w_recibe_fact.ibn_cambio=true
w_recibe_fact.ibn_nueva=true
w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.triggerevent(rowfocuschanged!)
close(f_vent_padre(this))

end event

type pb_1 from picturebutton within tp_2
integer x = 1563
integer y = 1356
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &c"
boolean cancel = true
string picturename = "Cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(f_vent_padre(this))
end event

type dw_patro from datawindow within tp_2
integer x = 18
integer y = 64
integer width = 3328
integer height = 1260
integer taborder = 30
string title = "none"
string dataobject = "dw_nom_patronal"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_3 from statictext within w_lleva_nomina
integer x = 23
integer width = 658
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nóminas pendientes de Pago:"
boolean focusrectangle = false
end type

type dw_nom from datawindow within w_lleva_nomina
integer x = 23
integer y = 52
integer width = 2949
integer height = 300
integer taborder = 10
string title = "none"
string dataobject = "dw_nom_pend_pago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then return
tab_1.tp_1.dw_cpo.retrieve(getitemnumber(getrow(),'num_nomina'))
tab_1.tp_1.dw_cab.retrieve(getitemnumber(getrow(),'num_nomina'))
//tab_1.tp_1.dw_conceps.retrieve(getitemnumber(getrow(),'num_nomina'))
tab_1.tp_2.dw_patro.retrieve(getitemnumber(getrow(),'num_nomina'))
//tab_1.tp_2.dw_patro_deta.retrieve(getitemnumber(getrow(),'num_nomina'))
tab_1.tp_1.dw_cab.event rowfocuschanged(tab_1.tp_1.dw_cab.getrow())

end event

