$PBExportHeader$w_selec_facts.srw
forward
global type w_selec_facts from window
end type
type rb_fa from radiobutton within w_selec_facts
end type
type rb_re from radiobutton within w_selec_facts
end type
type st_3 from statictext within w_selec_facts
end type
type dw_cumplan from datawindow within w_selec_facts
end type
type rb_cumplan from radiobutton within w_selec_facts
end type
type pb_2 from picturebutton within w_selec_facts
end type
type rb_todos from radiobutton within w_selec_facts
end type
type rb_selecc from radiobutton within w_selec_facts
end type
type dw_3 from datawindow within w_selec_facts
end type
type dw_2 from datawindow within w_selec_facts
end type
type rb_porcen from radiobutton within w_selec_facts
end type
type rb_valor from radiobutton within w_selec_facts
end type
type pb_4 from picturebutton within w_selec_facts
end type
type pb_1 from picturebutton within w_selec_facts
end type
type st_2 from statictext within w_selec_facts
end type
type st_1 from statictext within w_selec_facts
end type
type sle_1 from singlelineedit within w_selec_facts
end type
type em_2 from editmask within w_selec_facts
end type
type em_1 from editmask within w_selec_facts
end type
type dw_1 from datawindow within w_selec_facts
end type
type t1 from tab within w_selec_facts
end type
type p1 from userobject within t1
end type
type p1 from userobject within t1
end type
type p2 from userobject within t1
end type
type p2 from userobject within t1
end type
type t1 from tab within w_selec_facts
p1 p1
p2 p2
end type
type gb_1 from groupbox within w_selec_facts
end type
type gb_2 from groupbox within w_selec_facts
end type
end forward

global type w_selec_facts from window
integer width = 3392
integer height = 1776
boolean titlebar = true
string title = "Llevar Facturas a Glosas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rb_fa rb_fa
rb_re rb_re
st_3 st_3
dw_cumplan dw_cumplan
rb_cumplan rb_cumplan
pb_2 pb_2
rb_todos rb_todos
rb_selecc rb_selecc
dw_3 dw_3
dw_2 dw_2
rb_porcen rb_porcen
rb_valor rb_valor
pb_4 pb_4
pb_1 pb_1
st_2 st_2
st_1 st_1
sle_1 sle_1
em_2 em_2
em_1 em_1
dw_1 dw_1
t1 t1
gb_1 gb_1
gb_2 gb_2
end type
global w_selec_facts w_selec_facts

type variables
st_dws_revisa st_p
double nradica
datawindowchild idw_usu,idw_obj, idw_tiposerv,idw_espe
string campo, clugar_rad, tipo_rad

end variables

forward prototypes
public function integer distribuir ()
public function integer glos_procs (double porcen)
end prototypes

public function integer distribuir ();if dw_1.rowcount()=0 then return 1
dec porcen
long j, f
string col
dw_1.SetRedraw(FALSE)
if rb_valor.checked then
	porcen=dec(em_2.text)/dw_1.getitemnumber(1,campo)
	if porcen > 1 then
		porcen=0
		em_2.text='0'
	end if
else
	porcen=dec(em_1.text)/100
end if
if campo = 'sumvtemp' then
	col = 'vtemp'
else
	col = 'vtproced'
end if

for j=1 to dw_1.rowcount()
	if campo = 'sumvtemp' then
		dw_1.setitem(j,'valor_objecion',round(dw_1.getitemnumber(j,'vtemp')*porcen,i_dec_gral_car))
	else
		dw_1.setitem(j,'valor_objecion',round(dw_1.getitemnumber(j,'vtproced')*porcen,i_dec_gral_car))
	end if
next
//if rb_valor.checked and double(em_2.Text) <> dw_1.GetItemNumber(1,'sum_vobjec') then
//	dw_1.SetItem(dw_1.RowCount(),'valor_objecion',dw_1.GetItemNumber(dw_1.RowCount(),'valor_objecion') + double(em_2.text) - dw_1.GetItemNumber(1,'sum_vobjec')) 
//end if
double diff
diff = double(em_2.text) - dw_1.GetItemNumber(1,'sum_vobjec')
f = dw_1.RowCount()
do while diff <> 0 and f > 0
	if dw_1.GetItemNumber(f,'valor_objecion') + diff >= 0 and dw_1.GetItemNumber(f,'valor_objecion') + diff <= dw_1.GetItemNumber(f,col) then
		dw_1.SetItem(f,'valor_objecion',dw_1.GetItemNumber(f,'valor_objecion') + diff) 
		diff = 0
	elseif dw_1.GetItemNumber(f,'valor_objecion') + diff < 0 then
		diff = dw_1.GetItemNumber(f,'valor_objecion') + diff
		dw_1.SetItem(f,'valor_objecion',0) 
	elseif dw_1.GetItemNumber(f,'valor_objecion') + diff > dw_1.GetItemNumber(f,col) then
		diff = dw_1.GetItemNumber(f,'valor_objecion') + diff - dw_1.GetItemNumber(f,col)
		dw_1.SetItem(f,'valor_objecion',dw_1.GetItemNumber(f,col))
	end if
	f = f -1
loop
dw_1.SetRedraw(TRUE)
Return 1

end function

public function integer glos_procs (double porcen);string filtro='', filtro_orig
long i, f

Datawindow dw_p, dw_g
dw_p = w_maneja_glosas.tab_1.tp_2.dw_procs
dw_g = w_maneja_glosas.tab_1.tp_2.dw_proc_glos
filtro_orig = dw_p.Describe("datawindow.Table.Filter")
filtro = filtro_orig
dw_cumplan.accepttext()
choose case dw_cumplan.getitemstring(1,'copago')
	case 'C'//copagos
		if dw_p.DataObject = 'dw_factcpo_xa_glos2' then
			filtro = filtro + " and vemp > vempresa"
		else
			filtro= filtro + " and vproced > vemp"
		end if
	case 'N'
		if dw_p.DataObject = 'dw_factcpo_xa_glos2' then
			filtro = filtro + " and vemp = vempresa"
		else
			filtro = filtro + " and vproced = vemp"
		end if
end choose
if dw_cumplan.getitemstring(1,'agrupser') <> '-' then
	if filtro <> '' then filtro+=' and '
	filtro+="agrupser_def='" + dw_cumplan.getitemstring(1,'agrupser') + "'"
end if
dw_p.setfilter(filtro)
dw_p.filter()
for i = 1 to dw_p.RowCount()
	dw_p.ScrolltoRow(i)
	f = w_maneja_glosas.tab_1.tp_2.pb_op.Event clicked()
	dw_g.setitem(f,'valor_objecion', round(porcen * dw_p.GetItemNumber(i,'vemp'),i_dec_gral_car))
	dw_g.setitem(f,'porcen',round(porcen,2))
	dw_g.setitem(f,'cod_objecion',dw_2.getitemstring(1,1))	
	dw_g.SetItem(f,'usu_responde',idw_usu.GetItemString(idw_usu.getrow(),'responsable'))
	dw_g.SetItem(f,'nombre',idw_usu.GetItemString(idw_usu.getrow(),'nombre'))
//	if dw_t.event itemchanged(f,dw_t.object.valor_objecion,string(dw_1.getitemnumber(j,'valor_objecion'))) = -1 then Return -1
	if w_maneja_glosas.tab_1.tp_2.dw_proc_glos.Event p_itemchanged(f) = -1 then Return -1
next
dw_p.SetFilter(filtro_orig)
dw_p.Filter()
Return 0

end function

on w_selec_facts.create
this.rb_fa=create rb_fa
this.rb_re=create rb_re
this.st_3=create st_3
this.dw_cumplan=create dw_cumplan
this.rb_cumplan=create rb_cumplan
this.pb_2=create pb_2
this.rb_todos=create rb_todos
this.rb_selecc=create rb_selecc
this.dw_3=create dw_3
this.dw_2=create dw_2
this.rb_porcen=create rb_porcen
this.rb_valor=create rb_valor
this.pb_4=create pb_4
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_1=create dw_1
this.t1=create t1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.rb_fa,&
this.rb_re,&
this.st_3,&
this.dw_cumplan,&
this.rb_cumplan,&
this.pb_2,&
this.rb_todos,&
this.rb_selecc,&
this.dw_3,&
this.dw_2,&
this.rb_porcen,&
this.rb_valor,&
this.pb_4,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.sle_1,&
this.em_2,&
this.em_1,&
this.dw_1,&
this.t1,&
this.gb_1,&
this.gb_2}
end on

on w_selec_facts.destroy
destroy(this.rb_fa)
destroy(this.rb_re)
destroy(this.st_3)
destroy(this.dw_cumplan)
destroy(this.rb_cumplan)
destroy(this.pb_2)
destroy(this.rb_todos)
destroy(this.rb_selecc)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.rb_porcen)
destroy(this.rb_valor)
destroy(this.pb_4)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_1)
destroy(this.t1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;st_p = Message.PowerObjectParm
if isNull(st_p.dw_item.GetItemNumber(1,'num_radicacion')) then
	if st_p.dw_fac.RowCount() > 0 then
		nradica = st_p.dw_fac.GetItemNumber(st_p.dw_fac.GetRow(),'nradica')
		clugar_rad = st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'clugar_rad')
		tipo_rad = st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'tipo_rad')
		sle_1.Text = string(nradica)
		if tipo_rad ='R' then rb_re.checked=true
		if tipo_rad ='F' then rb_fa.checked=true
		sle_1.DisplayOnly = TRUE
	else
		sle_1.DisplayOnly = FALSE
	end if
else
	nradica = st_p.dw_item.GetItemNumber(1,'num_radicacion')
	clugar_rad = st_p.dw_item.GetItemString(1,'clugar_rad')
	tipo_rad =st_p.dw_item.GetItemString(1,'tipo_rad')
	sle_1.Text = string(nradica)
	sle_1.DisplayOnly = TRUE
end if
if nradica > 0  then
	dw_1.Retrieve(nradica,clugar_rad,tipo_rad)
end if
if w_maneja_glosas.tab_1.tp_1.dw_facts.DataObject = 'dw_glos_cpo' then
	campo = 'sumvtproced'
else
	campo = 'sumvtemp'
end if

end event

type rb_fa from radiobutton within w_selec_facts
integer x = 1307
integer y = 32
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Factura"
boolean checked = true
end type

type rb_re from radiobutton within w_selec_facts
integer x = 887
integer y = 32
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Relación"
boolean checked = true
end type

type st_3 from statictext within w_selec_facts
integer x = 2839
integer y = 100
integer width = 507
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_cumplan from datawindow within w_selec_facts
integer x = 530
integer y = 1504
integer width = 1253
integer height = 140
integer taborder = 60
string title = "none"
string dataobject = "dw_combo_utilidades"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('agrupser',idw_tiposerv)
idw_tiposerv.settransobject(sqlca)
idw_tiposerv.retrieve()
idw_tiposerv.insertrow(1)
idw_tiposerv.setitem(1,'codconcepto','-')
idw_tiposerv.setitem(1,'descripcion','(Todos)')
insertrow(1)

end event

event itemchanged;rb_cumplan.checked=true
rb_cumplan.post event clicked()
end event

type rb_cumplan from radiobutton within w_selec_facts
integer x = 50
integer y = 1552
integer width = 462
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Los que cumplan:"
end type

event clicked;//string filtro=''
//dw_cumplan.accepttext()
//choose case dw_cumplan.getitemstring(1,'copago')
//	case 'C'//copagos
//		if dw_1.DataObject = 'dw_factcpo_xa_glos2' then
//			filtro="vemp > vempresa"
//		else
//			filtro="vproced > vemp"
//		end if
//	case 'N'
//		if dw_1.DataObject = 'dw_factcpo_xa_glos2' then
//			filtro="vemp = vempresa"
//		else
//			filtro="vproced = vemp"
//		end if
//end choose
//if dw_cumplan.getitemstring(1,'agrupser')<>'-' then
//	if filtro<>'' then filtro+=' and '
//	filtro+="agrupser_def='"+dw_cumplan.getitemstring(1,'agrupser')+"'"
//end if
//dw_1.setfilter(filtro)
//dw_1.filter()

end event

type pb_2 from picturebutton within w_selec_facts
integer x = 2158
integer y = 32
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "export.gif"
string disabledname = "d_export.gif"
string powertiptext = "Lleva seleccionadas sin crear objecion"
end type

event clicked;long f, fnew
w_maneja_glosas.inicia_procesa()
for f = 1 to dw_1.RowCount()
	if dw_1.GetItemNumber(f,'selec') = 0 then continue
	st_p.em_parm.Text = String(dw_1.GetItemNumber(f,'nfact'))
	if dw_1.GetItemstring(f,'tipo') = 'F' then w_maneja_glosas.tab_1.tp_1.rb_fac.checked=true
	if dw_1.GetItemstring(f,'tipo') = 'C' then w_maneja_glosas.tab_1.tp_1.rb_con.checked=true
	w_maneja_glosas.tab_1.tp_1.dw_lug.SetItem(1,1,dw_1.GetItemString(f,'clugar'))
	fnew = st_p.em_parm.Event modified()
	if fnew = -1 then Return -1
next
w_maneja_glosas.fin_procesa()
close(parent)

end event

type rb_todos from radiobutton within w_selec_facts
integer x = 1015
integer y = 1280
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
string text = "Todos"
boolean checked = true
end type

event clicked;dw_1.setfilter('')
dw_1.filter()
distribuir()
end event

type rb_selecc from radiobutton within w_selec_facts
integer x = 1019
integer y = 1380
integer width = 398
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccionados"
end type

event clicked;dw_1.setfilter('selec=1')
dw_1.filter()
distribuir()
end event

type dw_3 from datawindow within w_selec_facts
integer x = 1550
integer y = 1356
integer width = 1765
integer height = 72
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_usu_respon"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
GetChild('usuario',idw_usu)
idw_usu.SetTransObject(SQLCA)
InsertRow(1)

end event

type dw_2 from datawindow within w_selec_facts
integer x = 1550
integer y = 1128
integer width = 1737
integer height = 220
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_objeciones"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('con_espe',idw_espe)
idw_espe.settransobject(sqlca)
idw_espe.retrieve('%')
getchild('cod_objecion',idw_obj)
idw_obj.settransobject(sqlca)
idw_obj.retrieve('%','%')
insertrow(1)
end event

event itemchanged;string nulo
setnull(nulo)
long j
AcceptText()
choose case dwo.name
	case 'con_gral'
		setitem(row,'con_espe',nulo)
		if idw_espe.retrieve(data)=1 then
			setitem(row,'con_espe',idw_espe.getitemstring(idw_espe.getrow(),'con_espe') )
		end if
	case 'con_espe'		
		setitem(row,'cod_objecion',nulo)
		if idw_obj.retrieve(getitemstring(row,'con_gral'),data)=1 then
			setitem(row,'cod_objecion',idw_obj.getitemstring(idw_obj.getrow(),1) )
		end if	
	case 'cod_objecion'
		idw_usu.Retrieve(GetItemString(1,1))
end choose

end event

type rb_porcen from radiobutton within w_selec_facts
integer x = 50
integer y = 1256
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
string text = "Porcentual"
end type

event clicked;distribuir()
end event

type rb_valor from radiobutton within w_selec_facts
integer x = 46
integer y = 1372
integer width = 434
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Distribuir valor"
end type

event clicked;distribuir()
end event

type pb_4 from picturebutton within w_selec_facts
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 2446
integer y = 32
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_selec_facts
integer x = 2304
integer y = 32
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Lleva Facturas"
end type

event clicked;long f, fnew
double porc
if isnull(dw_2.getitemstring(1,1)) then
	messagebox('Atención','Debe elegir una objeción')
	return
end if
if isnull(dw_3.getitemstring(1,1)) then
	messagebox('Atención','Debe elegir un usuario a responder las objeciones')
	return
end if
if (not rb_porcen.checked) and (not rb_valor.checked) then
	messagebox('Atención','Debe elegir la opción de distribución (Porcentual o por valor)')
	return
end if
if (rb_porcen.checked) and double(em_1.Text) <= 0 then
	messagebox('Atención','Debe suministrar un porcentaje mayor a cero')
	return
end if
if dw_1.Find("selec=1",1,dw_1.RowCount()) > 0 and rb_todos.checked then
	if MessageBox('Atención','Ha seleccionado algunas facturas. Desea procesar sólo las seleccionadas?',QUESTION!,YESNO!) = 1 then 	rb_selecc.event clicked()
end if
w_maneja_glosas.inicia_procesa()
porc=double(em_1.text)/100
for f = 1 to dw_1.RowCount()
	st_p.em_parm.Text = String(dw_1.GetItemNumber(f,'nfact'))
	w_maneja_glosas.tab_1.tp_1.dw_lug.SetItem(1,1,dw_1.GetItemString(f,'clugar'))
	if dw_1.GetItemstring(f,'tipo') = 'F' then w_maneja_glosas.tab_1.tp_1.rb_fac.checked=true
	if dw_1.GetItemstring(f,'tipo') = 'C' then w_maneja_glosas.tab_1.tp_1.rb_con.checked=true
	w_maneja_glosas.tab_1.tp_1.dw_lug.SetItem(1,1,dw_1.GetItemString(f,'clugar'))
	fnew = st_p.em_parm.Event modified()
	if fnew = -1 then Return -1
	if t1.SelectedTab = 1 then		
		fnew = w_maneja_glosas.tab_1.tp_1.pb_of.Event clicked()
		if rb_porcen.checked= true then
			w_maneja_glosas.tab_1.tp_1.dw_fac_glos.SetItem(fnew,'valor_objecion',round((dw_1.GetItemNumber(f,'vtemp')*porc),i_dec_gral_car))
			w_maneja_glosas.tab_1.tp_1.dw_fac_glos.SetItem(fnew,'porcen',porc)
		else
			w_maneja_glosas.tab_1.tp_1.dw_fac_glos.SetItem(fnew,'valor_objecion',dw_1.GetItemNumber(f,'valor_objecion'))
			w_maneja_glosas.tab_1.tp_1.dw_fac_glos.SetItem(fnew,'porcen',round(dw_1.GetItemNumber(f,'valor_objecion')/w_maneja_glosas.tab_1.tp_1.dw_facts.GetItemNumber(w_maneja_glosas.tab_1.tp_1.dw_facts.GetRow(),'vtemp')*100,i_dec_gral_car))
		end  if
		w_maneja_glosas.tab_1.tp_1.dw_fac_glos.SetItem(fnew,'con_gral',dw_2.GetItemString(1,'con_gral'))
		w_maneja_glosas.tab_1.tp_1.dw_fac_glos.SetItem(fnew,'con_espe',dw_2.GetItemString(1,'con_espe'))
		w_maneja_glosas.tab_1.tp_1.dw_fac_glos.SetItem(fnew,'cod_objecion',dw_2.GetItemString(1,'cod_objecion'))
		w_maneja_glosas.tab_1.tp_1.dw_fac_glos.SetItem(fnew,'usu_responde',idw_usu.GetItemString(idw_usu.getrow(),'responsable'))
		w_maneja_glosas.tab_1.tp_1.dw_fac_glos.SetItem(fnew,'nombre',idw_usu.GetItemString(idw_usu.getrow(),'nombre'))
		w_maneja_glosas.tab_1.tp_1.dw_fac_glos.setitem(fnew,'respuesta_hasta',datetime(relativedate(today(),idw_obj.getitemnumber(idw_obj.getrow(),'tiempo_resp'))))
		w_maneja_glosas.tab_1.tp_1.dw_fac_glos.ScrolltoRow(fnew)
		//if w_maneja_glosas.tab_1.tp_1.dw_fac_glos.Event itemchanged(fnew,w_maneja_glosas.tab_1.tp_1.dw_fac_glos.object.valor_objecion,string(dw_1.GetItemNumber(f,'valor_objecion'))) = -1 then Return -1
		if w_maneja_glosas.tab_1.tp_1.dw_fac_glos.Event p_itemchanged(fnew) = -1 then Return -1
	else
		glos_procs(porc)
	end if
next
w_maneja_glosas.fin_procesa()
close(parent)

end event

type st_2 from statictext within w_selec_facts
integer x = 46
integer y = 24
integer width = 302
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Radicación"
boolean focusrectangle = false
end type

type st_1 from statictext within w_selec_facts
integer x = 46
integer y = 116
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Facturas"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_selec_facts
integer x = 370
integer y = 24
integer width = 448
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type em_2 from editmask within w_selec_facts
integer x = 457
integer y = 1368
integer width = 443
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#,###,###,###.00"
end type

event modified;rb_valor.checked=true
if dec(text)>dw_1.getitemnumber(1,campo) then
	Messagebox('Atención','Este valor es mayor al valor Total')
	text='0'
	return
end if
distribuir()

end event

type em_1 from editmask within w_selec_facts
integer x = 448
integer y = 1260
integer width = 361
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "0~~100"
end type

event modified;rb_porcen.checked=true
distribuir()
end event

type dw_1 from datawindow within w_selec_facts
integer x = 27
integer y = 172
integer width = 3333
integer height = 936
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_facts_x_radica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;long i
if dwo.name = 'selec_t' then
	dw_1.SetRedraw(FALSE)
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
	dw_1.SetRedraw(TRUE)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
st_dw.solobuscar = TRUE
openwithparm(w_funcion_dw,st_dw)

end event

event rowfocuschanged;st_3.Text = 'Registro ' + string(GetRow()) + ' de ' +string(RowCount())
end event

type t1 from tab within w_selec_facts
integer x = 32
integer y = 1112
integer width = 1403
integer height = 112
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
p1 p1
p2 p2
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.Control[]={this.p1,&
this.p2}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
end on

event selectionchanged;if newindex = 1 then
	rb_cumplan.Visible = FALSE
	dw_cumplan.Visible = FALSE
	em_2.Enabled = TRUE
	rb_valor.Enabled = TRUE
else
	rb_cumplan.Visible = TRUE
	dw_cumplan.Visible = TRUE
	em_2.Enabled = FALSE
	rb_valor.Enabled = FALSE
	rb_valor.checked = FALSE
end if

end event

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 1367
integer height = -16
long backcolor = 67108864
string text = "Aplicar a facturas"
long tabtextcolor = 33554432
string picturename = "factura.ico"
long picturemaskcolor = 536870912
end type

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 1367
integer height = -16
long backcolor = 67108864
string text = "Aplicar a Procedimientos"
long tabtextcolor = 33554432
string picturename = "bisturi.ico"
long picturemaskcolor = 536870912
end type

type gb_1 from groupbox within w_selec_facts
integer x = 37
integer y = 1204
integer width = 923
integer height = 268
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_selec_facts
integer x = 992
integer y = 1220
integer width = 462
integer height = 264
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

