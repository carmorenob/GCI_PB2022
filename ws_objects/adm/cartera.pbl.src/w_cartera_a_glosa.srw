$PBExportHeader$w_cartera_a_glosa.srw
forward
global type w_cartera_a_glosa from window
end type
type rb_con from radiobutton within w_cartera_a_glosa
end type
type rb_fac from radiobutton within w_cartera_a_glosa
end type
type rb_e from radiobutton within w_cartera_a_glosa
end type
type rb_t from radiobutton within w_cartera_a_glosa
end type
type dw_b from datawindow within w_cartera_a_glosa
end type
type dw_lug from datawindow within w_cartera_a_glosa
end type
type sle_fact from singlelineedit within w_cartera_a_glosa
end type
type dw_sitem from datawindow within w_cartera_a_glosa
end type
type dw_proc from datawindow within w_cartera_a_glosa
end type
type dw_fact from datawindow within w_cartera_a_glosa
end type
type dw_3 from datawindow within w_cartera_a_glosa
end type
type cbx_1 from checkbox within w_cartera_a_glosa
end type
type st_1 from statictext within w_cartera_a_glosa
end type
type pb_2 from picturebutton within w_cartera_a_glosa
end type
type pb_1 from picturebutton within w_cartera_a_glosa
end type
type dw_2 from datawindow within w_cartera_a_glosa
end type
type gb_1 from groupbox within w_cartera_a_glosa
end type
type dw_1 from datawindow within w_cartera_a_glosa
end type
end forward

global type w_cartera_a_glosa from window
integer width = 3086
integer height = 996
boolean titlebar = true
string title = "Crear Objeción Porcentual"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rb_con rb_con
rb_fac rb_fac
rb_e rb_e
rb_t rb_t
dw_b dw_b
dw_lug dw_lug
sle_fact sle_fact
dw_sitem dw_sitem
dw_proc dw_proc
dw_fact dw_fact
dw_3 dw_3
cbx_1 cbx_1
st_1 st_1
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
gb_1 gb_1
dw_1 dw_1
end type
global w_cartera_a_glosa w_cartera_a_glosa

type variables
datawindowchild idw_usuresp,idw_obj,idw_emp
st_amortizar st_p

end variables

on w_cartera_a_glosa.create
this.rb_con=create rb_con
this.rb_fac=create rb_fac
this.rb_e=create rb_e
this.rb_t=create rb_t
this.dw_b=create dw_b
this.dw_lug=create dw_lug
this.sle_fact=create sle_fact
this.dw_sitem=create dw_sitem
this.dw_proc=create dw_proc
this.dw_fact=create dw_fact
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_2=create dw_2
this.gb_1=create gb_1
this.dw_1=create dw_1
this.Control[]={this.rb_con,&
this.rb_fac,&
this.rb_e,&
this.rb_t,&
this.dw_b,&
this.dw_lug,&
this.sle_fact,&
this.dw_sitem,&
this.dw_proc,&
this.dw_fact,&
this.dw_3,&
this.cbx_1,&
this.st_1,&
this.pb_2,&
this.pb_1,&
this.dw_2,&
this.gb_1,&
this.dw_1}
end on

on w_cartera_a_glosa.destroy
destroy(this.rb_con)
destroy(this.rb_fac)
destroy(this.rb_e)
destroy(this.rb_t)
destroy(this.dw_b)
destroy(this.dw_lug)
destroy(this.sle_fact)
destroy(this.dw_sitem)
destroy(this.dw_proc)
destroy(this.dw_fact)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event open;//resize(2711,1024)
st_p = Message.PowerObjectParm
string td, doc, cemp
long f
if not isValid(st_p) then Return 0
if isValid(st_p.dw_cab) then
	td = st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'tipodoc')
	doc = st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'documento')
	select codemp into :cemp from empresa where tipodoc=:td and nit=:doc and estado='1';
	if not isNull(cemp) then
		dw_1.SetITem(1,'codemp',cemp)
		f =idw_emp.Find("codemp='"+cemp+"'",1,idw_emp.RowCount())
		if f > 0 then idw_emp.ScrolltoRow(f)
		
		if dw_2.Retrieve(cemp) > 0 then
			setnull(f)
			f = dw_2.Find("num_cobro="+string(st_p.dw_cpo.GetItemNumber(st_p.dw_cpo.GetRow(),'num_cobro'))+" and item="+string(st_p.dw_cpo.GetItemNumber(st_p.dw_cpo.GetRow(),'item')),1,dw_2.RowCount())
			if f > 0 then dw_2.ScrolltoRow(f)
		end if
	end if
end if

end event

type rb_con from radiobutton within w_cartera_a_glosa
integer x = 1847
integer y = 136
integer width = 366
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Consecutivo"
end type

type rb_fac from radiobutton within w_cartera_a_glosa
integer x = 1847
integer y = 72
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factura"
boolean checked = true
end type

type rb_e from radiobutton within w_cartera_a_glosa
integer x = 2190
integer y = 784
integer width = 549
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sobre valor Empresa"
end type

type rb_t from radiobutton within w_cartera_a_glosa
integer x = 1600
integer y = 784
integer width = 517
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sobre Valor Total"
end type

type dw_b from datawindow within w_cartera_a_glosa
boolean visible = false
integer x = 2304
integer y = 888
integer width = 736
integer height = 68
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_busca_cob_fact"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type dw_lug from datawindow within w_cartera_a_glosa
integer x = 2213
integer y = 120
integer width = 768
integer height = 76
integer taborder = 30
string title = "none"
string dataobject = "dw_lugar_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTRansObject(SQLCA)
InsertRow(0)
SetItem(1,'clugar',clugar)

end event

type sle_fact from singlelineedit within w_cartera_a_glosa
integer x = 2222
integer y = 44
integer width = 320
integer height = 68
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;double ncobro, nfact, nglosa
long f
string lug_cob, lug, cemp, l_tipo

lug = dw_lug.GetItemString(1,'clugar')
if not isNumber(Text) then Return 0
if isNull(lug) then Return 0

nfact = Double(Text)
if rb_fac.checked then  l_tipo='F'
if rb_con.checked then  l_tipo='C'
if dw_b.Retrieve(nfact,lug, l_tipo) > 0 then
	ncobro = dw_b.GetItemNumber(dw_b.RowCount(),'num_cobro')
	lug_cob = dw_b.GetItemString(dw_b.RowCount(),'clugar')
	dw_1.SetItem(1,'codemp',dw_b.GetItemString(dw_b.RowCount(),'cemp'))
	dw_1.TriggerEvent(Itemchanged!)
	f = dw_2.Find("num_cobro="+string(ncobro)+" and clugar='"+lug_cob+"'",1,dw_2.RowCount())
	if f > 0 then
		dw_2.ScrolltoRow(f)
	else
		MessageBox('Atención','No se encontró el número de cobro '+string(ncobro))
	end if
else
	MessageBox('Atención','No se encontró objeción para la factura')
end if
end event

type dw_sitem from datawindow within w_cartera_a_glosa
boolean visible = false
integer x = 1742
integer y = 1096
integer width = 841
integer height = 124
integer taborder = 40
string title = "none"
string dataobject = "dw_obj_x_porcen_sitem"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'
if trim(sqlerrtext)='' or isnull(sqlerrtext) or trim(lower(sqlerrtext))='select error:'then
	i_st.msgerror+=sqlca.sqlerrtext
else
	i_st.msgerror+=sqlerrtext
end if
openwithparm(w_error_ds,i_st)
return 1
end event

type dw_proc from datawindow within w_cartera_a_glosa
boolean visible = false
integer x = 846
integer y = 1096
integer width = 823
integer height = 128
integer taborder = 40
string title = "none"
string dataobject = "dw_obj_porcen_proc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'
if trim(sqlerrtext)='' or isnull(sqlerrtext) or trim(lower(sqlerrtext))='select error:'then
	i_st.msgerror+=sqlca.sqlerrtext
else
	i_st.msgerror+=sqlerrtext
end if
openwithparm(w_error_ds,i_st)
return 1
end event

type dw_fact from datawindow within w_cartera_a_glosa
boolean visible = false
integer x = 46
integer y = 1096
integer width = 745
integer height = 132
integer taborder = 40
string title = "none"
string dataobject = "dw_obje_x_porcen_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'
if trim(sqlerrtext)='' or isnull(sqlerrtext) or trim(lower(sqlerrtext))='select error:'then
	i_st.msgerror+=sqlca.sqlerrtext
else
	i_st.msgerror+=sqlerrtext
end if
openwithparm(w_error_ds,i_st)
return 1
end event

type dw_3 from datawindow within w_cartera_a_glosa
boolean visible = false
integer x = 142
integer y = 876
integer width = 805
integer height = 156
integer taborder = 30
string title = "none"
string dataobject = "dw_xa_obje_porcen"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('cod_objecion',idw_obj)
idw_obj.settransobject(sqlca)
idw_obj.retrieve('%','%')
getchild('usu',idw_usuresp)
idw_usuresp.settransobject(sqlca)
insertrow(1)
setitem(1,'fecha_recep',datetime(today()))
end event

event itemchanged;string nulo
setnull(nulo)
choose case dwo.name
	case 'cod_objecion'
		setitem(row,'pertinente',idw_obj.getitemstring(idw_obj.getrow(),'pertinente'))
		setitem(row,'fecha_respu',datetime(relativedate(date(getitemdatetime(row,'fecha_recep')),idw_obj.getitemnumber(idw_obj.getrow(),'tiempo_resp'))))
		setitem(row,'usu',nulo)
		if idw_usuresp.retrieve(data)=1 then
			setitem(row,'usu',idw_usuresp.getitemstring(1,'responsable'))
		end if
	case ''
end choose
end event

type cbx_1 from checkbox within w_cartera_a_glosa
boolean visible = false
integer x = 14
integer y = 788
integer width = 814
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Porcentual sobre toda la Cuenta"
end type

event clicked;if checked then
	parent.resize(2711,1284)
	dw_3.visible=true
else
	parent.resize(2711,1024)
	dw_3.visible=false
end if
end event

type st_1 from statictext within w_cartera_a_glosa
integer x = 14
integer y = 160
integer width = 1019
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objeciones Pendientes de Registrar:"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_cartera_a_glosa
integer x = 1371
integer y = 772
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_cartera_a_glosa
integer x = 1211
integer y = 772
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;if dw_2.rowcount()=0 then return
if not rb_t.checked and not rb_e.checked  then
	messageBox('Atención','Debe seleccionar si la objeción se aplica sobre el total de la factura o sobre el valor a cargo de la empresa')
	Return 
end if

if rb_t.checked then
	w_maneja_glosas.tab_1.tp_1.dw_facts.DataObject = 'dw_glos_cpo'
	w_maneja_glosas.tab_1.tp_2.dw_procs.DataObject = 'dw_factcpo_xa_glos2'
	w_maneja_glosas.tab_1.tp_3.dw_sitem.DataObject = 'dw_car_glos_subcpo2'
	dw_proc.DataObject = 'dw_obj_porcen_proc'
	dw_sitem.DataObject = 'dw_obj_x_porcen_sitem'
else
	w_maneja_glosas.tab_1.tp_1.dw_facts.DataObject = 'dw_glos_cpo_emp'
	w_maneja_glosas.tab_1.tp_2.dw_procs.DataObject = 'dw_factcpo_xa_glos2_emp'
	w_maneja_glosas.tab_1.tp_3.dw_sitem.DataObject = 'dw_car_glos_subcpo2_emp'
	dw_proc.DataObject = 'dw_obj_porcen_proc_emp'
	dw_sitem.DataObject = 'dw_obj_x_porcen_sitem_emp'
end if
dw_proc.SetTransObject(SQLCA)
dw_sitem.SetTransObject(SQLCA)
w_maneja_glosas.tab_1.tp_1.dw_facts.SetTransObject(SQLCA)
w_maneja_glosas.tab_1.tp_2.dw_procs.SetTransObject(SQLCA)
w_maneja_glosas.tab_1.tp_3.dw_sitem.SetTransObject(SQLCA)
w_maneja_glosas.tab_1.tp_1.dw_facts.TriggerEvent(constructor!)
w_maneja_glosas.tab_1.tp_2.dw_procs.TriggerEvent(constructor!)
w_maneja_glosas.tab_1.tp_3.dw_sitem.TriggerEvent(constructor!)

if cbx_1.checked then
	if isnull(dw_3.getitemdatetime(1,'fecha_recep')) then
		messagebox('Atención','Debe digitar la fecha de recepción')
		return
	end if
	if isnull(dw_3.getitemstring(1,'cod_objecion')) then
		messagebox('Atención','Debe digitar la objecion')
		return
	end if
	if isnull(dw_3.getitemstring(1,'usu')) then
		messagebox('Atención','Debe digitar el usuario a responder')
		return
	end if
	string snulo,clug_fac,tipo_fac
	datetime fresp
	long nnulo,j,nfact,item
	setnull(snulo)
	setnull(fresp)
	//fresp=datetime(date(dw_3.getitemdatetime(1,'fecha_respu')))
	setnull(nnulo)
	if dw_fact.retrieve(clugar,dw_2.getitemnumber(dw_2.getrow(),'porcen'),dw_3.getitemstring(1,'pertinente'),dw_3.getitemstring(1,'cod_objecion'),snulo,snulo,nnulo,nnulo,dw_3.getitemdatetime(1,'fecha_recep'),dw_3.getitemdatetime(1,'fecha_respu'),dw_3.getitemstring(1,'usu'),fresp,idw_usuresp.getitemstring(idw_usuresp.getrow(),'nombre'),dw_2.getitemstring(dw_2.getrow(),'clugar'),dw_2.getitemnumber(dw_2.getrow(),'num_cobro'))=0 then
		Messagebox('Atención','No hay facturas de esta cuenta')
		return
	end if
	dw_fact.object.item.primary=dw_fact.object.fila.primary
	dw_proc.retrieve(clugar,dw_3.getitemstring(1,'pertinente'),dw_3.getitemstring(1,'cod_objecion'),dw_2.getitemnumber(dw_2.getrow(),'porcen'),dw_2.getitemstring(dw_2.getrow(),'clugar'),dw_2.getitemnumber(dw_2.getrow(),'num_cobro'))
	dw_proc.groupcalc()
	dw_proc.object.item.primary=dw_proc.object.comp_item.primary
	
	dw_sitem.retrieve(clugar,dw_3.getitemstring(1,'pertinente'),dw_3.getitemstring(1,'cod_objecion'),dw_2.getitemnumber(dw_2.getrow(),'porcen'),dw_2.getitemstring(dw_2.getrow(),'clugar'),dw_2.getitemnumber(dw_2.getrow(),'num_cobro'))
	for j=1 to dw_sitem.rowcount()
		if clug_fac<>dw_sitem.getitemstring(j,'clugar_fact') or nfact<>dw_sitem.getitemnumber(j,'nfact') then
			clug_fac=dw_sitem.getitemstring(j,'clugar_fact') 
			tipo_fac=dw_sitem.getitemstring(j,'tipo_fact') 
			nfact=dw_sitem.getitemnumber(j,'nfact')
			item=dw_fact.find('clugar_fact="'+clug_fac+'" and nfact='+string(nfact),1,dw_fact.rowcount())
			if item=0 then 
				messagebox('Atención','No se puede encontrar la factura '+string(nfact))
				return
			end if
			item=dw_fact.getitemnumber(item,'item')
		end if
		dw_sitem.setitem(j,'item',item)
	next
end if
w_maneja_glosas.dw_deta.reset()
w_maneja_glosas.tab_1.tp_1.dw_facts.reset()
w_maneja_glosas.tab_1.tp_1.dw_fac_glos.reset()
w_maneja_glosas.idw_facts.reset()
w_maneja_glosas.idw_facts2.reset()
w_maneja_glosas.tab_1.tp_2.dw_procs.reset()
w_maneja_glosas.tab_1.tp_3.dw_sitem.reset()
w_maneja_glosas.tab_1.tp_2.dw_proc_glos.reset()
w_maneja_glosas.tab_1.tp_3.dw_item_glos.reset()
w_maneja_glosas.dw_histo.insertrow(1)
w_maneja_glosas.dw_histo.scrolltorow(1)
w_maneja_glosas.dw_deta.insertrow(1)
w_maneja_glosas.dw_deta.setitem(1,'clugar',clugar)
w_maneja_glosas.dw_deta.setitem(1,'coddoc',w_maneja_glosas.i_cdoc)
w_maneja_glosas.dw_deta.setitem(1,'clugar_cob',dw_2.getitemstring (dw_2.getrow(),'clugar'))
w_maneja_glosas.dw_deta.setitem(1,'coddoc_cob',dw_2.getitemstring (dw_2.getrow(),'coddoc'))
w_maneja_glosas.dw_deta.setitem(1,'num_cobro',dw_2.getitemnumber (dw_2.getrow(),'num_cobro'))
w_maneja_glosas.dw_deta.setitem(1,'cartipo',dw_2.getitemstring (dw_2.getrow(),'cartipo'))
w_maneja_glosas.dw_deta.setitem(1,'item_cob',dw_2.getitemnumber (dw_2.getrow(),'item'))
w_maneja_glosas.dw_deta.setitem(1,'cobro_valor',dw_2.getitemnumber (dw_2.getrow(),'valor'))
w_maneja_glosas.dw_deta.setitem(1,'codemp',dw_1.getitemstring(1,1))
w_maneja_glosas.dw_deta.setitem(1,'usuario',usuario)
w_maneja_glosas.dw_deta.setitem(1,"fecha",datetime(today()))
if rb_t.checked then
	w_maneja_glosas.dw_deta.setitem(1,'total','1')
	w_maneja_glosas.i_total = TRUE
else
	w_maneja_glosas.dw_deta.setitem(1,'total','0')
	w_maneja_glosas.i_total = FALSE
end if
//
String cd,clr,cl,tr
double nr,nc,ctos
cd = dw_2.getitemstring (dw_2.getrow(),'coddoc')
cl = dw_2.getitemstring (dw_2.getrow(),'clugar')
nc = dw_2.getitemnumber (dw_2.getrow(),'num_cobro')
select count(*) into :ctos
from car_cobro_cpo
where coddoc=:cd and clugar=:cl and num_cobro=:nc and num_radicacion is not null;
if ctos=1 then
	select num_radicacion, clugar_rad,tipo_rad into :nr,:clr,:tr from car_cobro_cpo
	where coddoc=:cd and clugar=:cl and num_cobro=:nc and num_radicacion is not null;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
else
end if
w_maneja_glosas.dw_deta.setitem(1,'num_radicacion',nr)
w_maneja_glosas.dw_deta.setitem(1,'clugar_rad',clr)
w_maneja_glosas.dw_deta.setitem(1,'tipo_rad',tr)
w_maneja_glosas.i_nuevo=true
w_maneja_glosas.i_cambio=true
w_maneja_glosas.pb_new.enabled=false
if cbx_1.checked then
	long cc
	w_maneja_glosas.idw_facts.reset()
	w_maneja_glosas.idw_facts2.reset()
	for j=1 to dw_fact.rowcount()
		w_maneja_glosas.idw_facts.insertrow(j)
		w_maneja_glosas.idw_facts2.insertrow(j)
		w_maneja_glosas.idw_facts.setitem(j,'nfact',dw_fact.getitemnumber(j,'nfact'))
		w_maneja_glosas.idw_facts.setitem(j,'clugar_fact',dw_fact.getitemstring(j,'clugar_fact'))
		w_maneja_glosas.idw_facts.setitem(j,'tipo_fact',dw_fact.getitemstring(j,'tipo_fact'))

		w_maneja_glosas.idw_facts2.setitem(j,'nfact',dw_fact.getitemnumber(j,'nfact'))
		w_maneja_glosas.idw_facts2.setitem(j,'clugar_fact',dw_fact.getitemstring(j,'clugar_fact'))
		w_maneja_glosas.idw_facts2.setitem(j,'tipo_fact',dw_fact.getitemstring(j,'tipo_fact'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.insertrow(j)
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'coddoc',dw_fact.getitemstring(j,'coddoc'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'clugar',dw_fact.getitemstring(j,'clugar'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'num_glosa',dw_fact.getitemnumber(j,'num_glosa'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'item',dw_fact.getitemnumber(j,'item'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'nfact',dw_fact.getitemnumber(j,'nfact'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'clugar_fact',dw_fact.getitemstring(j,'clugar_fact'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'tipo',dw_fact.getitemstring(j,'tipo'))
		if rb_t.checked then
			w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'valor_objecion',dw_fact.getitemnumber(j,'valor_objecion'))
		else
			w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'valor_objecion',dw_fact.getitemnumber(j,'valor_objecion_emp'))
		end if
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'valor_aceptado',dw_fact.getitemnumber(j,'valor_aceptado'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'pertinente',dw_fact.getitemstring(j,'pertinente'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'cod_objecion',dw_fact.getitemstring(j,'cod_objecion'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'clugar_cob',dw_fact.getitemstring(j,'clugar_cob'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'coddoc_cob',dw_fact.getitemstring(j,'coddoc_cob'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'num_cobro',dw_fact.getitemnumber(j,'num_cobro'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'cartipo',dw_fact.getitemstring(j,'cartipo'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'item_cob',dw_fact.getitemnumber(j,'item_cob'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'coddoc_orig',dw_fact.getitemstring(j,'coddoc_orig'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'clugar_orig',dw_fact.getitemstring(j,'clugar_orig'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'num_glosa_orig',dw_fact.getitemnumber(j,'num_glosa_orig'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'item_orig',dw_fact.getitemnumber(j,'item_orig'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'estado',dw_fact.getitemstring(j,'estado'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'respuesta_hasta',dw_3.getitemdatetime(1,'fecha_respu'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'usu_responde',dw_fact.getitemstring(j,'usu_responde'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'nombre',dw_fact.getitemstring(j,'nombre'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'fecha',dw_fact.getitemdatetime(j,'fecha'))
		if rb_t.checked then
			w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'vtemp',dw_fact.getitemnumber(j,'vtproced'))
			w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'vtempresa',dw_fact.getitemnumber(j,'vtemp'))
		else
			w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'vtproced',dw_fact.getitemnumber(j,'vtproced'))
			w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'vtemp',dw_fact.getitemnumber(j,'vtemp'))
		end if
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'nradica',dw_fact.getitemnumber(j,'nradica'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'esco',dw_fact.getitemnumber(j,'esco'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'nro_empresa',dw_fact.getitemstring(j,'nro_empresa'))
		w_maneja_glosas.tab_1.tp_1.dw_facts.setitem(j,'porcen',dw_fact.getitemnumber(j,'porcen'))
	next
	
	if dw_proc.rowcount()>0 then w_maneja_glosas.tab_1.tp_2.dw_procs.object.data=dw_proc.object.data
	if dw_sitem.rowcount()>0 then w_maneja_glosas.tab_1.tp_3.dw_sitem.object.data=dw_sitem.object.data

	w_maneja_glosas.tab_1.tp_1.dw_facts.event rowfocuschanged(1)
	w_maneja_glosas.tab_1.tp_1.dw_facts.event p_itemchanged()
end if
close(parent)

end event

type dw_2 from datawindow within w_cartera_a_glosa
integer x = 9
integer y = 220
integer width = 2994
integer height = 536
integer taborder = 20
string title = "none"
string dataobject = "dw_carcobro_cpo_a_glosa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type gb_1 from groupbox within w_cartera_a_glosa
integer x = 1806
integer y = 8
integer width = 1198
integer height = 212
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Factura"
end type

type dw_1 from datawindow within w_cartera_a_glosa
integer width = 1797
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_empr"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
dw_1.getchild('codemp_1',idw_emp)
idw_emp.settransobject(sqlca)
idw_emp.retrieve()
insertrow(1)
end event

event itemchanged;AcceptText()
dw_2.retrieve(GetItemString(1,1))
end event

