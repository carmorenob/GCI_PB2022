$PBExportHeader$w_glosas_utilidades.srw
forward
global type w_glosas_utilidades from window
end type
type pb_cancel from picturebutton within w_glosas_utilidades
end type
type pb_ok from picturebutton within w_glosas_utilidades
end type
type dw_1 from datawindow within w_glosas_utilidades
end type
type rb_todos from radiobutton within w_glosas_utilidades
end type
type dw_cumplan from datawindow within w_glosas_utilidades
end type
type dw_2 from datawindow within w_glosas_utilidades
end type
type rb_cumplan from radiobutton within w_glosas_utilidades
end type
type rb_selecc from radiobutton within w_glosas_utilidades
end type
type em_2 from editmask within w_glosas_utilidades
end type
type em_1 from editmask within w_glosas_utilidades
end type
type rb_valor from radiobutton within w_glosas_utilidades
end type
type rb_porcen from radiobutton within w_glosas_utilidades
end type
type gb_1 from groupbox within w_glosas_utilidades
end type
type dw_3 from datawindow within w_glosas_utilidades
end type
end forward

global type w_glosas_utilidades from window
integer width = 3378
integer height = 1688
boolean titlebar = true
string title = "Utilidades de Objeciones"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
rb_todos rb_todos
dw_cumplan dw_cumplan
dw_2 dw_2
rb_cumplan rb_cumplan
rb_selecc rb_selecc
em_2 em_2
em_1 em_1
rb_valor rb_valor
rb_porcen rb_porcen
gb_1 gb_1
dw_3 dw_3
end type
global w_glosas_utilidades w_glosas_utilidades

type variables
datawindowchild idw_tiposerv, idw_usu,idw_espe,idw_obj

end variables

forward prototypes
public function integer distribuir ()
end prototypes

public function integer distribuir ();if dw_1.rowcount()=0 then return 1
dec porcen
long j
if rb_valor.checked then
	porcen=dec(Em_2.text)/dw_1.getitemnumber(1,'compute_6')
	if porcen>1 then
		porcen=0
		em_2.text='0'
	end if
else
	porcen=dec(em_1.text)/100
end if
for j=1 to dw_1.rowcount()
	dw_1.setitem(j,'porcen',round(porcen*100,i_dec_gral_car))
	dw_1.setitem(j,'valor_objecion',round(dw_1.getitemnumber(j,'vemp')*porcen,i_dec_gral_car))
next
return 1

end function

on w_glosas_utilidades.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.rb_todos=create rb_todos
this.dw_cumplan=create dw_cumplan
this.dw_2=create dw_2
this.rb_cumplan=create rb_cumplan
this.rb_selecc=create rb_selecc
this.em_2=create em_2
this.em_1=create em_1
this.rb_valor=create rb_valor
this.rb_porcen=create rb_porcen
this.gb_1=create gb_1
this.dw_3=create dw_3
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.dw_1,&
this.rb_todos,&
this.dw_cumplan,&
this.dw_2,&
this.rb_cumplan,&
this.rb_selecc,&
this.em_2,&
this.em_1,&
this.rb_valor,&
this.rb_porcen,&
this.gb_1,&
this.dw_3}
end on

on w_glosas_utilidades.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
destroy(this.rb_todos)
destroy(this.dw_cumplan)
destroy(this.dw_2)
destroy(this.rb_cumplan)
destroy(this.rb_selecc)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_valor)
destroy(this.rb_porcen)
destroy(this.gb_1)
destroy(this.dw_3)
end on

event open;long i
if w_maneja_glosas.tab_1.tp_2.dw_procs.DataObject = 'dw_factcpo_xa_glos2' then
	dw_1.DataObject = 'dw_factcpo_xa_glos2'
else
	dw_1.DataObject = 'dw_factcpo_xa_glos2_emp'
end if
for i = 1 to dw_1.RowCount()
	dw_1.SetItem(i,'valor_objecion',0)
next
dw_1.object.data = w_maneja_glosas.tab_1.tp_2.dw_procs.object.data
dw_1.object.compute_4.visible=false
dw_1.object.b_1.visible=false

end event

type pb_cancel from picturebutton within w_glosas_utilidades
integer x = 1605
integer y = 1444
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_glosas_utilidades
integer x = 1422
integer y = 1448
integer width = 151
integer height = 132
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
long j,donde, f

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
if dw_1.Find("selecc=1",1,dw_1.RowCount()) > 0 and rb_todos.checked then
	if MessageBox('Atención','Ha seleccionado algunas facturas. Desea procesar sólo las seleccionadas?',QUESTION!,YESNO!) = 1 then 	rb_selecc.event clicked()
end if
datawindow dw_t
dw_t = w_maneja_glosas.tab_1.tp_2.dw_proc_glos
for j = 1 to dw_1.rowcount()
	donde = w_maneja_glosas.tab_1.tp_2.dw_procs.find('nitem_fac='+string(dw_1.getitemnumber(j,'nitem_fac')),1,w_maneja_glosas.tab_1.tp_2.dw_procs.rowcount())
	if donde = 0 then
		MessageBox('Error','No se encontró el procedimiento con item_fac ' +string(dw_1.getitemnumber(j,'nitem_fac')))
		Return -1
	end if
	w_maneja_glosas.tab_1.tp_2.dw_procs.ScrolltoRow(donde)
	f = w_maneja_glosas.tab_1.tp_2.pb_op.Event clicked()
	dw_t.setitem(f,'valor_objecion',dw_1.getitemnumber(j,'valor_objecion'))
	dw_t.setitem(f,'porcen',dw_1.getitemnumber(j,'porcen'))
	dw_t.setitem(f,'con_gral',dw_2.getitemstring(1,'con_gral'))	
	dw_t.setitem(f,'con_espe',dw_2.getitemstring(1,'con_espe'))	
	dw_t.setitem(f,'cod_objecion',dw_2.getitemstring(1,1))	
	dw_t.SetItem(f,'usu_responde',idw_usu.GetItemString(idw_usu.getrow(),'responsable'))
	dw_t.SetItem(f,'nombre',idw_usu.GetItemString(idw_usu.getrow(),'nombre'))
//	if dw_t.event itemchanged(f,dw_t.object.valor_objecion,string(dw_1.getitemnumber(j,'valor_objecion'))) = -1 then Return -1
	if w_maneja_glosas.tab_1.tp_2.dw_proc_glos.Event p_itemchanged(f) = -1 then Return -1

next
dw_t.triggerevent ("p_itemchanged")
close(parent)

end event

type dw_1 from datawindow within w_glosas_utilidades
integer x = 18
integer y = 444
integer width = 3314
integer height = 976
integer taborder = 50
string title = "none"
string dataobject = "dw_factcpo_xa_glos2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type rb_todos from radiobutton within w_glosas_utilidades
integer x = 1979
integer y = 52
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

type dw_cumplan from datawindow within w_glosas_utilidades
integer x = 1961
integer y = 264
integer width = 1253
integer height = 140
integer taborder = 40
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

type dw_2 from datawindow within w_glosas_utilidades
integer x = 32
integer y = 120
integer width = 1774
integer height = 228
integer taborder = 20
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
		idw_usu.Retrieve(GetItemString(1,1))
	case 'cod_objecion'
		idw_usu.Retrieve(GetItemString(1,1))
end choose

end event

type rb_cumplan from radiobutton within w_glosas_utilidades
integer x = 1979
integer y = 188
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

event clicked;string filtro=''
dw_cumplan.accepttext()
choose case dw_cumplan.getitemstring(1,'copago')
	case 'C'//copagos
		if dw_1.DataObject = 'dw_factcpo_xa_glos2' then
			filtro="vemp > vempresa"
		else
			filtro="vproced > vemp"
		end if
	case 'N'
		if dw_1.DataObject = 'dw_factcpo_xa_glos2' then
			filtro="vemp = vempresa"
		else
			filtro="vproced = vemp"
		end if
end choose
if dw_cumplan.getitemstring(1,'agrupser')<>'-' then
	if filtro<>'' then filtro+=' and '
	filtro+="agrupser_def='"+dw_cumplan.getitemstring(1,'agrupser')+"'"
end if
dw_1.setfilter(filtro)
dw_1.filter()
distribuir()

end event

type rb_selecc from radiobutton within w_glosas_utilidades
integer x = 1979
integer y = 120
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

event clicked;dw_1.setfilter('selecc=1')
dw_1.filter()
distribuir()
end event

type em_2 from editmask within w_glosas_utilidades
integer x = 1362
integer y = 16
integer width = 421
integer height = 80
integer taborder = 30
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
string mask = "#,###,###,###.00"
end type

event modified;rb_valor.checked=true
if dec(text)>dw_1.getitemnumber(1,'compute_6') then
	Messagebox('Atención','Este valor es mayor al pagado por la empresa')
	text='0'
	return
end if
distribuir()
end event

type em_1 from editmask within w_glosas_utilidades
integer x = 539
integer y = 8
integer width = 343
integer height = 80
integer taborder = 20
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
string mask = "###.00"
boolean spin = true
double increment = 1
string minmax = "0~~100"
end type

event modified;rb_porcen.checked=true
distribuir()
end event

type rb_valor from radiobutton within w_glosas_utilidades
integer x = 942
integer y = 24
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

type rb_porcen from radiobutton within w_glosas_utilidades
integer x = 37
integer y = 16
integer width = 398
integer height = 64
integer textsize = -8
integer weight = 700
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

type gb_1 from groupbox within w_glosas_utilidades
integer x = 1874
integer y = 4
integer width = 1454
integer height = 420
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sobre los Registros:"
end type

type dw_3 from datawindow within w_glosas_utilidades
integer x = 32
integer y = 348
integer width = 1737
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

