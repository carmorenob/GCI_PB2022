$PBExportHeader$w_lleva_nom_relfac.srw
forward
global type w_lleva_nom_relfac from window
end type
type cbx_1 from checkbox within w_lleva_nom_relfac
end type
type tab_1 from tab within w_lleva_nom_relfac
end type
type tp_1 from userobject within tab_1
end type
type dw_ter from datawindow within tp_1
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
type dw_conceps from datawindow within tp_1
end type
type dw_cab from datawindow within tp_1
end type
type st_2 from statictext within tp_1
end type
type tp_1 from userobject within tab_1
dw_ter dw_ter
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
dw_cpo dw_cpo
st_1 st_1
dw_conceps dw_conceps
dw_cab dw_cab
st_2 st_2
end type
type tp_2 from userobject within tab_1
end type
type pb_2 from picturebutton within tp_2
end type
type pb_1 from picturebutton within tp_2
end type
type dw_patro_deta from datawindow within tp_2
end type
type dw_patro from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_2 pb_2
pb_1 pb_1
dw_patro_deta dw_patro_deta
dw_patro dw_patro
end type
type tab_1 from tab within w_lleva_nom_relfac
tp_1 tp_1
tp_2 tp_2
end type
type st_3 from statictext within w_lleva_nom_relfac
end type
type dw_nom from datawindow within w_lleva_nom_relfac
end type
end forward

global type w_lleva_nom_relfac from window
integer width = 3397
integer height = 2128
boolean titlebar = true
string title = "Elegir Nómina para recepción de factura"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_1 cbx_1
tab_1 tab_1
st_3 st_3
dw_nom dw_nom
end type
global w_lleva_nom_relfac w_lleva_nom_relfac

type variables
datawindowchild idw_concep,idw_concep2
end variables

forward prototypes
public function long wf_insert_rela (string p_cdoc_pre, string p_clug_pre, long p_num_pre, long p_item_pre, decimal p_val, long p_j)
end prototypes

public function long wf_insert_rela (string p_cdoc_pre, string p_clug_pre, long p_num_pre, long p_item_pre, decimal p_val, long p_j);long donde_intf
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
Return donde_intf

end function

on w_lleva_nom_relfac.create
this.cbx_1=create cbx_1
this.tab_1=create tab_1
this.st_3=create st_3
this.dw_nom=create dw_nom
this.Control[]={this.cbx_1,&
this.tab_1,&
this.st_3,&
this.dw_nom}
end on

on w_lleva_nom_relfac.destroy
destroy(this.cbx_1)
destroy(this.tab_1)
destroy(this.st_3)
destroy(this.dw_nom)
end on

event open;dw_nom.retrieve()
end event

type cbx_1 from checkbox within w_lleva_nom_relfac
integer x = 1595
integer y = 368
integer width = 334
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agrupada"
boolean checked = true
end type

event clicked;if tab_1.tp_1.dw_cpo.rowcount() + tab_1.tp_1.dw_cpo.filteredcount()>0 and checked=false then
	messagebox('Atención','Solo se puede desagrupar una nómina que no tenga deducciones')
	checked=true
	return
end if
dw_nom.event rowfocuschanged(dw_nom.getrow())
end event

type tab_1 from tab within w_lleva_nom_relfac
integer x = 18
integer y = 352
integer width = 3319
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
integer width = 3282
integer height = 1532
long backcolor = 67108864
string text = "Nómina"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
dw_ter dw_ter
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
dw_cpo dw_cpo
st_1 st_1
dw_conceps dw_conceps
dw_cab dw_cab
st_2 st_2
end type

on tp_1.create
this.dw_ter=create dw_ter
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.dw_cpo=create dw_cpo
this.st_1=create st_1
this.dw_conceps=create dw_conceps
this.dw_cab=create dw_cab
this.st_2=create st_2
this.Control[]={this.dw_ter,&
this.pb_cancel,&
this.pb_ok,&
this.dw_1,&
this.dw_cpo,&
this.st_1,&
this.dw_conceps,&
this.dw_cab,&
this.st_2}
end on

on tp_1.destroy
destroy(this.dw_ter)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
destroy(this.dw_cpo)
destroy(this.st_1)
destroy(this.dw_conceps)
destroy(this.dw_cab)
destroy(this.st_2)
end on

type dw_ter from datawindow within tp_1
boolean visible = false
integer x = 2368
integer y = 1416
integer width = 512
integer height = 120
integer taborder = 80
boolean enabled = false
string title = "none"
string dataobject = "dw_pre_doc_ter"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type pb_cancel from picturebutton within tp_1
integer x = 1682
integer y = 1404
integer width = 142
integer height = 124
integer taborder = 70
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

type pb_ok from picturebutton within tp_1
integer x = 1536
integer y = 1404
integer width = 142
integer height = 124
integer taborder = 60
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

event clicked;if dw_nom.rowcount()=0 then return
dw_cpo.setredraw(false)
dw_cpo.setfilter('num_nomina='+string(dw_nom.getitemnumber(dw_nom.getrow(),'num_nomina')))
dw_cpo.filter()
long j ,k ,donde ,num_pre ,item_pre ,donde_intf, f

if dw_cpo.find('isnull(cod_impu)',1,dw_cpo.rowcount())>0 then
	messagebox('Atención','Alguna deducción de un Empleado no tiene equivalencia con un impuesto, debe existir equivalencia para continuar')
	dw_cab.event rowfocuschanged(dw_cab.getrow())
	dw_cpo.setredraw(true)
	return
end if
donde = dw_cpo.find('isnull(tipodoc_ter) or tipodoc_ter=""',1,dw_cpo.rowcount())
if donde>0 then
	messagebox('Atención','El Empleado:'+dw_cpo.getitemstring(donde,'tipodoc')+' '+dw_cpo.getitemstring(donde,'documento')+' no tiene Tercero en el concepto '+dw_cpo.getitemstring(donde,'cod_concep')+'-'+dw_cpo.getitemstring(donde,'des_concep'))
	dw_cab.event rowfocuschanged(dw_cab.getrow())
	dw_cpo.setredraw(true)
	return
end if

w_recibe_fact.tab_2.selectedtab = 3
datawindow dw_t,dw_o
w_recibe_fact.tab_2.t2_3.t5.t5_3.dw_tz.reset() //amortizaciones
w_recibe_fact.tab_2.t2_3.tab_4.t4_2.dw_tot.reset()
dw_t = w_recibe_fact.tab_2.t2_3.tab_4.t4_1.dw_cab //tesorelfact
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
string cdoc_pre,clug_pre
dec val
for j=1 to dw_cab.rowcount()
	if cbx_1.checked then
		dw_conceps.setfilter("tipodoc='"+dw_cab.getitemstring(j,'tipodoc')+"' and documento='"+dw_cab.getitemstring(j,'documento')+"'")
	else
		dw_conceps.setfilter("tipodoc='"+dw_cab.getitemstring(j,'tipodoc')+"' and documento='"+dw_cab.getitemstring(j,'documento')+"' and cod_concep='"+dw_cab.getitemstring(j,'cod_concep')+"'")
	end if
	dw_conceps.filter()
	for k=1 to dw_conceps.rowcount()
		cdoc_pre = dw_conceps.getitemstring(k,'coddoc')
		clug_pre = dw_conceps.getitemstring(k,'clugar')
		num_pre = dw_conceps.getitemnumber(k,'numdoc')
		item_pre = dw_conceps.getitemnumber(k,'item')
		val = dw_conceps.getitemnumber(k,'valor')
		f = wf_insert_rela(cdoc_pre,clug_pre,num_pre,item_pre,val,j)
		w_recibe_fact.dw_rela.SetItem(f,'char_orig3',dw_conceps.getitemstring(k,'tipodoc_ter'))
		w_recibe_fact.dw_rela.SetItem(f,'char_doc3',dw_conceps.getitemstring(k,'documento_ter'))
		if dw_conceps.DataObject = 'dw_conceps_contra_rfc' then
			w_recibe_fact.dw_rela.SetItem(f,'num_orig3',dw_nom.GetItemNumber(dw_nom.GetRow(),'num_nomina'))
		end if
	next
	dw_t = w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo
	dw_cab.setrow(j)
	dw_cab.event rowfocuschanged(j)
	dw_t.insertrow(j)
	dw_t.setitem(j,'clugar',w_recibe_fact.is_clug_rad)
	dw_t.setitem(j,'coddoc',w_recibe_fact.is_cdoc)
	dw_t.setitem(j,'item',j)
	dw_t.setitem(j,'tipodoc',dw_cab.getitemstring(j,'tipodoc'))
	dw_t.setitem(j,'documento',dw_cab.getitemstring(j,'documento'))
	dw_t.setitem(j,'val_bruto',dw_cab.getitemnumber(j,'tot_bruto'))
	dw_t.setitem(j,'tbruto',dw_cab.getitemnumber(j,'tot_bruto'))
	dw_t.setitem(j,'tneto',dw_cab.getitemnumber(j,'tot_bruto'))
	if cbx_1.checked then
		dw_t.setitem(j,'cod_rel',dw_1.getitemstring(1,1))
	else
		dw_t.setitem(j,'cod_rel',dw_cab.getitemstring(j,'concep_pago'))
	end if
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
		dw_t.setitem(donde,'base',dw_cab.getitemnumber(j,'tot_bruto'))
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
		cdoc_pre=dw_cpo.getitemstring(k,'coddoc')
		clug_pre=dw_cpo.getitemstring(k,'clugar')
		num_pre=dw_cpo.getitemnumber(k,'numdoc')
		item_pre=dw_cpo.getitemnumber(k,'item')
		val=dw_cpo.getitemnumber(k,'tbruto')
//		if not isnull(num_pre) then wf_insert_rela(cdoc_pre,clug_pre,num_pre,item_pre,val,j)
	next
	if dw_cpo.rowcount() = 0 then
		w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.SetColumn('tdescuentos')
		w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.Event itemchanged(j,w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.object.tdescuentos,'0')
	end if
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
idw_concep.retrieve(w_recibe_fact.is_emp,'R','1')
insertrow(1)
if idw_concep.rowcount()=1 then
	setitem(1,1,idw_concep.getitemstring(1,'cod_rel'))
end if
end event

event itemchanged;if not cbx_1.checked then 
	long j
	for j=1 to dw_cab.rowcount()
		if dw_cab.getitemstring(j,'concep_pago')='' or isnull(dw_cab.getitemstring(j,'concep_pago')) then 
			dw_cab.setitem(j,'concep_pago',data)
		end if
	next
end if
end event

type dw_cpo from datawindow within tp_1
integer x = 23
integer y = 848
integer width = 3200
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

event retrieveend;long i, vnul
string snul
setNull(vnul)
setNull(snul)
for i = 1 to RowCount()
	SetItem(i,'coddoc',snul)
	SetItem(i,'clugar',snul)
	SetItem(i,'numdoc',vnul)
	SetItem(i,'item',vnul)
next

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

type dw_conceps from datawindow within tp_1
string tag = "pa la interfaz de reservas x cada emple"
boolean visible = false
integer x = 2272
integer y = 440
integer width = 686
integer height = 512
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_conceps_nom_xa_relfact"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event retrieveend;long i, f, fter
string cd,cl
double nd
for i = 1 to rowcount
	if GetItemString(i,'documento_ter') = '' then
		cd = GetItemString(i,'coddoc')
		cl = GetItemString(i,'clugar')
		nd = GetItemNumber(i,'numdoc')
		dw_ter.Retrieve(cd,cl,nd)
		if dw_ter.RowCount() = 1 then
			fter = 1
		elseif dw_ter.RowCount() > 0 then
			fter = dw_ter.Find("nomina='1'",1,dw_ter.RowCount())
			if fter = 0 then
				fter = dw_ter.Find("tipodoc='"+GetItemString(i,'tipodoc')+"' and documento='"+GetItemString(i,'documento')+"'",1,dw_ter.RowCount())
				if fter = 0 then
					ScrolltoRow(i)
					openwithparm(w_ter_reser_rfc,this)
					fter = Message.DoubleParm
					if fter = 0 then
						MessageBox('Error','No se pudo establecer el tercero para la reserva '+string(nd))
						Return -1
					end if
				end if
			end if
		else
			MessageBox('Error','No se pudo establecer el tercero para la reserva '+string(nd))
			Return -1
		end if
		f = Find("coddoc='"+cd+"' and clugar='"+cl+"' and numdoc="+string(nd),1,RowCount())
		do while f > 0 
			SetItem(f,'tipodoc_ter',dw_ter.GetItemString(fter,'tipodoc'))
			SetItem(f,'documento_ter',dw_ter.GetItemString(fter,'documento'))
			IF f + 1 > rowCount() THEN EXIT
			f = Find("coddoc='"+cd+"' and clugar='"+cl+"' and numdoc="+string(nd), f + 1, RowCount())
		loop
	end if	
next

end event

type dw_cab from datawindow within tp_1
integer x = 27
integer y = 56
integer width = 3191
integer height = 724
integer taborder = 20
string title = "none"
string dataobject = "dw_nom_a_relfact"
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

event clicked;if row>0 and getrow()<>row then setrow(row)
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
integer width = 3282
integer height = 1532
long backcolor = 67108864
string text = "Patronales"
long tabtextcolor = 33554432
string picturename = "buscar.ico"
long picturemaskcolor = 536870912
pb_2 pb_2
pb_1 pb_1
dw_patro_deta dw_patro_deta
dw_patro dw_patro
end type

on tp_2.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_patro_deta=create dw_patro_deta
this.dw_patro=create dw_patro
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_patro_deta,&
this.dw_patro}
end on

on tp_2.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_patro_deta)
destroy(this.dw_patro)
end on

type pb_2 from picturebutton within tp_2
integer x = 1339
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
dw_t = w_recibe_fact.tab_2.t2_3.tab_4.t4_1.dw_cab
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

long k,num_pre,item_pre,donde_intf, f, fila
string cdoc_pre,clug_pre,valor
dec val
	
dw_t = w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo

for donde=1 to dw_patro.rowcount()
	if dw_patro.getitemnumber(donde,'esco')=0 then continue	

	dw_patro_deta.setfilter('tipodoc_ter="'+dw_patro.getitemstring(donde,'tipodoc_ter')+'" and documento_ter="'+dw_patro.getitemstring(donde,'documento_ter')+'" and cod_concep="'+dw_patro.getitemstring(donde,'cod_concep')+'"')
	dw_patro_deta.filter()
	w_recibe_fact.tab_2.t2_3.t5.t5_3.dw_tz.reset()

	valor = dw_t.Describe("Evaluate('max(item)',0)")
	fila = dw_t.insertrow(0)
	dw_t.setitem(fila,'clugar',w_recibe_fact.is_clug_rad)
	dw_t.setitem(fila,'coddoc',w_recibe_fact.is_cdoc)
	dw_t.setitem(fila,'item',long(valor) + 1)
	dw_t.setitem(fila,'tipodoc',dw_patro.getitemstring(donde,'tipodoc_ter'))
	dw_t.setitem(fila,'documento',dw_patro.getitemstring(donde,'documento_ter'))
	dw_t.setitem(fila,'val_bruto',dw_patro.getitemnumber(donde,'tbruto'))
	dw_t.setitem(fila,'tbruto',dw_patro.getitemnumber(donde,'tbruto'))
	dw_t.setitem(fila,'tneto',dw_patro.getitemnumber(donde,'tbruto'))
	
	for k=1 to dw_patro_deta.rowcount()
		cdoc_pre=dw_patro_deta.getitemstring(k,'coddoc')
		clug_pre=dw_patro_deta.getitemstring(k,'clugar')
		num_pre=dw_patro_deta.getitemnumber(k,'numdoc')
		item_pre=dw_patro_deta.getitemnumber(k,'item')
		val=dw_patro_deta.getitemnumber(k,'tbruto')
		f = wf_insert_rela(cdoc_pre,clug_pre,num_pre,item_pre,val,fila)
		w_recibe_fact.dw_rela.SetItem(f,'char_orig3',dw_patro.getitemstring(donde,'tipodoc_ter'))
		w_recibe_fact.dw_rela.SetItem(f,'char_doc3',dw_patro.getitemstring(donde,'documento_ter'))
	next

next
dw_t.setrow(fila)
w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.event p_itemchanged()

w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.scrolltorow(1)
w_recibe_fact.ibn_cambio=true
w_recibe_fact.ibn_nueva=true
w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.triggerevent(rowfocuschanged!)
close(f_vent_padre(this))

end event

type pb_1 from picturebutton within tp_2
integer x = 1486
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

type dw_patro_deta from datawindow within tp_2
boolean visible = false
integer x = 2245
integer y = 280
integer width = 686
integer height = 400
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dw_aport_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_patro from datawindow within tp_2
integer x = 18
integer y = 64
integer width = 3191
integer height = 1260
integer taborder = 30
string title = "none"
string dataobject = "dw_nom_patro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event clicked;if dwo.Name = 'esco_t' then
	int i
	if describe("esco_t.text") = 'Selec.' then
		for i = 1 to rowCount()
			SetItem(i,'esco',1)
		next
		Modify("esco_t.Text='Desel.'")
	else
		for i = 1 to rowCount()
			SetItem(i,'esco',0)
		next
		Modify("esco_t.Text='Selec.'")
	end if
	Return
end if

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


end event

type st_3 from statictext within w_lleva_nom_relfac
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

type dw_nom from datawindow within w_lleva_nom_relfac
integer x = 23
integer y = 52
integer width = 2560
integer height = 300
integer taborder = 10
string title = "none"
string dataobject = "dw_nom_sin_pago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then return
if GetItemNumber(getRow(),'contra') = 0 then
	if cbx_1.checked then
		tab_1.tp_1.dw_cab.DataObject = 'dw_nom_a_relfact'
		tab_1.tp_1.dw_conceps.DataObject = 'dw_conceps_nom_xa_relfact'
	else
		tab_1.tp_1.dw_cab.DataObject = 'dw_nom_a_relfact_desagrup'
		tab_1.tp_1.dw_cab.getchild('concep_pago',idw_concep2)
		idw_concep2.settransobject(sqlca)
		idw_concep2.retrieve(w_recibe_fact.is_emp,'R','1')
		tab_1.tp_1.dw_conceps.DataObject = 'dw_conceps_nom_xa_relfact_desagrup'
	end if
	tab_1.tp_1.dw_cab.SetTransobject(SQLCA)
	tab_1.tp_1.dw_conceps.SetTransobject(SQLCA)
else
	tab_1.tp_1.dw_cab.DataObject = 'dw_nom_contra_rfc'
	tab_1.tp_1.dw_conceps.DataObject = 'dw_conceps_contra_rfc'
	tab_1.tp_1.dw_cab.SetTransobject(SQLCA)
	tab_1.tp_1.dw_conceps.SetTransobject(SQLCA)	
end if
tab_1.tp_1.dw_cpo.retrieve(getitemnumber(getrow(),'num_nomina'))
tab_1.tp_1.dw_cab.reset()
if tab_1.tp_1.dw_cab.retrieve(getitemnumber(getrow(),'num_nomina')) = 0 then tab_1.tp_1.dw_cpo.Reset()
tab_1.tp_1.dw_conceps.retrieve(getitemnumber(getrow(),'num_nomina'))
if GetItemNumber(getRow(),'contra') = 0 then
	tab_1.tp_2.dw_patro.retrieve(getitemnumber(getrow(),'num_nomina'))
	tab_1.tp_2.dw_patro_deta.retrieve(getitemnumber(getrow(),'num_nomina'))
end if

end event

