$PBExportHeader$w_pago_impuesto.srw
forward
global type w_pago_impuesto from window
end type
type st_1 from statictext within w_pago_impuesto
end type
type pb_2 from picturebutton within w_pago_impuesto
end type
type dw_2 from datawindow within w_pago_impuesto
end type
type pb_cancel from picturebutton within w_pago_impuesto
end type
type pb_ok from picturebutton within w_pago_impuesto
end type
type dw_terce2 from datawindow within w_pago_impuesto
end type
type dw_terce1 from datawindow within w_pago_impuesto
end type
type cbx_2 from checkbox within w_pago_impuesto
end type
type cbx_1 from checkbox within w_pago_impuesto
end type
type pb_1 from picturebutton within w_pago_impuesto
end type
type dw_pend from datawindow within w_pago_impuesto
end type
type dw_1 from datawindow within w_pago_impuesto
end type
end forward

global type w_pago_impuesto from window
integer width = 3282
integer height = 1884
boolean titlebar = true
string title = "Pago de Impuestos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
pb_2 pb_2
dw_2 dw_2
pb_cancel pb_cancel
pb_ok pb_ok
dw_terce2 dw_terce2
dw_terce1 dw_terce1
cbx_2 cbx_2
cbx_1 cbx_1
pb_1 pb_1
dw_pend dw_pend
dw_1 dw_1
end type
global w_pago_impuesto w_pago_impuesto

type variables
datawindowchild idw_tipo,idw_impu
end variables

forward prototypes
public subroutine filtra ()
end prototypes

public subroutine filtra ();string filtro
setnull(filtro)

if not isnull(dw_1.getitemstring(1,'lugar')) then
	filtro='clugar="'+dw_1.getitemstring(1,'lugar')+'"'
end if
if not isnull(dw_1.getitemstring(1,'cod_tipo')) then
	if isnull(filtro) then
		filtro=' cod_tipo="'+dw_1.getitemstring(1,'cod_tipo')+'"'
	else
		filtro+='and cod_tipo="'+dw_1.getitemstring(1,'cod_tipo')+'"'
	end if
end if
if not isnull(dw_1.getitemstring(1,'cod_concep')) then
	if isnull(filtro) then
		filtro=' cod_concep="'+dw_1.getitemstring(1,'cod_concep')+'"'
	else
		filtro+=' and cod_concep="'+dw_1.getitemstring(1,'cod_concep')+'"'
	end if
end if
if cbx_2.checked then
	if not isnull(dw_terce1.getitemstring(1,'documento')) then
		filtro+=' and tipodoc="'+dw_terce1.getitemstring(1,'tipodoc')+'" and documento="'+dw_terce1.getitemstring(1,'documento')+'"'
	end if			
end if
if not isnull(filtro) then
	dw_pend.setfilter(filtro)
	dw_pend.filter()
end if

end subroutine

on w_pago_impuesto.create
this.st_1=create st_1
this.pb_2=create pb_2
this.dw_2=create dw_2
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_terce2=create dw_terce2
this.dw_terce1=create dw_terce1
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.pb_1=create pb_1
this.dw_pend=create dw_pend
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.pb_2,&
this.dw_2,&
this.pb_cancel,&
this.pb_ok,&
this.dw_terce2,&
this.dw_terce1,&
this.cbx_2,&
this.cbx_1,&
this.pb_1,&
this.dw_pend,&
this.dw_1}
end on

on w_pago_impuesto.destroy
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.dw_2)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_terce2)
destroy(this.dw_terce1)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.pb_1)
destroy(this.dw_pend)
destroy(this.dw_1)
end on

type st_1 from statictext within w_pago_impuesto
integer x = 2263
integer y = 1396
integer width = 434
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
boolean righttoleft = true
end type

type pb_2 from picturebutton within w_pago_impuesto
integer x = 3017
integer y = 148
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
string picturename = "refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Limpia criterios de búsqueda"
end type

event clicked;string nulo
setnull(nulo)
dw_1.	setitem(1,'lugar',nulo)
dw_1.	setitem(1,'tipo',nulo)
dw_1.	setitem(1,'cod_tipo',nulo)
dw_1.	setitem(1,'cod_concep',nulo)
dw_pend.setfilter('')
dw_pend.retrieve(dw_1.getitemstring(1,'tipo'),dw_1.getitemdatetime(1,'inicia'),dw_1.getitemdatetime(1,'termina'))
dw_2.retrieve(dw_1.getitemstring(1,'tipo'),dw_1.getitemdatetime(1,'inicia'),dw_1.getitemdatetime(1,'termina'))
end event

type dw_2 from datawindow within w_pago_impuesto
boolean visible = false
integer x = 2158
integer y = 220
integer width = 142
integer height = 84
integer taborder = 30
string title = "none"
string dataobject = "dw_reservas_deimpu"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_cancel from picturebutton within w_pago_impuesto
integer x = 1714
integer y = 1660
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
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_pago_impuesto
integer x = 1522
integer y = 1660
integer width = 146
integer height = 128
integer taborder = 30
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

event clicked;if dw_pend.rowcount()=0 then return
long donde,k
datawindow dw_t
if cbx_1.checked then//un solo tercero
	if isnull(dw_terce2.getitemstring(1,'documento')) then
		messagebox('Atención','Debe escoger el tercero al que se causará')
		return
	end if
	w_recibe_fact.tab_2.t2_2.dw_terce.reset()
	dw_terce2.rowscopy(1,1,primary!,w_recibe_fact.tab_2.t2_2.dw_terce,1,primary!)
	w_recibe_fact.f_nueva_manu()
	w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.setitem(1,'val_bruto',dw_pend.getitemnumber(1,'gtotal'))
	w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.setcolumn('val_bruto')
	w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.event itemchanged(1,w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.object.val_bruto,string(dw_pend.getitemnumber(1,'gtotal')))
else
	w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'tipodoc',dw_pend.getitemstring(1,'tipodoc'))
	w_recibe_fact.tab_2.t2_2.dw_terce.setitem(1,'documento',dw_pend.getitemstring(1,'documento'))
	w_recibe_fact.f_nueva_manu()
	dw_t=w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo
	dw_t.deleterow(0)
	string tdoc,docum
	long j
	decimal jaer
	donde=1
	for j=1 to dw_pend.rowcount()
		if dw_pend.getitemnumber(j,'esco')=0 then continue
		if (dw_pend.getitemdecimal(j,'valor') - dw_pend.getitemdecimal(j,'diferencia'))  =0 then continue
		if tdoc<>dw_pend.getitemstring(j,'tipodoc') or docum<>dw_pend.getitemstring(j,'documento') then
			tdoc=dw_pend.getitemstring(j,'tipodoc')
			docum=dw_pend.getitemstring(j,'documento')
			donde=w_recibe_fact.tab_2.t2_3.t5.t5_1.pb_new_concep.event clicked()
			dw_t.setitem(donde,'tipodoc',tdoc)
			dw_t.setitem(donde,'documento',docum)
			dw_t.setitem(donde,'val_bruto',dw_pend.getitemnumber(j,'total_terce'))
			dw_t.setcolumn('val_bruto')
			dw_t.event itemchanged(donde,dw_t.object.val_bruto,string(dw_pend.getitemnumber(j,'total_terce')))
		end if
		dw_pend.setitem(j,'item_recep_pago',w_recibe_fact.tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(donde,'item'))
	next
end if
w_recibe_fact.tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'tiporelacion','I')
dw_t=w_recibe_fact.dw_rela
for j=1 to dw_pend.rowcount()
	if dw_pend.getitemnumber(j,'esco')=0 then continue
	if (dw_pend.getitemdecimal(j,'valor') - dw_pend.getitemdecimal(j,'diferencia'))  =0 then continue
	dw_2.setfilter("nrelacion="+string(dw_pend.getitemnumber(j,'nrelacion'))+" and item="+string(dw_pend.getitemnumber(j,'item'))+" and subitem="+string(dw_pend.getitemnumber(j,'subitem')))
	dw_2.filter()
	for k=1 to dw_2.rowcount()
		dw_t.insertrow(1)
		dw_t.setitem(1,'codigo','RFCRFCPT')
		dw_t.setitem(1,'char_orig1',dw_2.getitemstring(k,'char_orig1'))
		dw_t.setitem(1,'char_orig2',dw_2.getitemstring(k,'char_orig2'))
		dw_t.setitem(1,'num_orig1',dw_2.getitemnumber(k,'num_orig1'))
		dw_t.setitem(1,'num_orig2',dw_2.getitemnumber(k,'num_orig2'))
		dw_t.setitem(1,'valor',round(dw_2.getitemnumber(k,'llevar'),2))
		dw_t.setitem(1,'num_doc2',1)
	next
next
if w_recibe_fact.grabar('0')=-1 then 
	close(parent)
	return
end if
donde=w_recibe_fact.tab_2.t2_3.tab_4.t4_1.dw_cab.getitemnumber(1,'nrelacion')
for j=1 to dw_pend.rowcount()
	if dw_pend.getitemnumber(j,'esco')=0 then continue
	if (dw_pend.getitemdecimal(j,'valor') - dw_pend.getitemdecimal(j,'diferencia'))  =0 then continue
	dw_pend.setitem(j,'clug_recep_pago',w_recibe_fact.is_clug_rad)
	dw_pend.setitem(j,'cdoc_recep_pago',w_recibe_fact.is_cdoc)
	dw_pend.setitem(j,'nrel_recep_pago',donde)
	if cbx_1.checked then dw_pend.setitem(j,'item_recep_pago',1)
	dw_pend.setitem(j,'esco',0)
next
dw_pend.update()
if sqlca.sqlcode=-1 then
	close(parent)
	return	
end if
commit;
close(parent)
end event

type dw_terce2 from datawindow within w_pago_impuesto
boolean visible = false
integer x = 32
integer y = 1484
integer width = 3159
integer height = 140
integer taborder = 30
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event doubleclicked;if dwo.name='documento' then 
	g_tercerodesde=1
	openwithparm(w_buscater,this)
	setcolumn('documento')
	triggerevent(itemchanged!)
end if
end event

event itemchanged;accepttext()
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
	setitem(1,'tel1',snulo)
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
		return
	end if
end if
end event

type dw_terce1 from datawindow within w_pago_impuesto
integer x = 37
integer y = 336
integer width = 3159
integer height = 140
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event doubleclicked;if dwo.name='documento' then 
	g_tercerodesde=1
	openwithparm(w_buscater,this)
	setcolumn('documento')
	triggerevent(itemchanged!)
end if
end event

event itemchanged;accepttext()
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
	setitem(1,'tel1',snulo)
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
		return
	end if
	pb_1.event clicked()
end if
end event

type cbx_2 from checkbox within w_pago_impuesto
integer x = 32
integer y = 272
integer width = 626
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar solo este Tercero"
end type

event clicked;if checked then
	dw_terce1.enabled=true
else
	dw_terce1.enabled=false
end if
pb_1.event clicked()
end event

type cbx_1 from checkbox within w_pago_impuesto
integer x = 32
integer y = 1424
integer width = 677
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generar a un solo tercero"
end type

event clicked;if checked then
	dw_terce2.visible=true
else
	dw_terce2.visible=false
end if
end event

type pb_1 from picturebutton within w_pago_impuesto
integer x = 3017
integer y = 4
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Traer datos"
end type

event clicked;if not isnull(dw_1.getitemstring(1,'cod_concep')) then
	dw_1.setcolumn('cod_concep')
	dw_1.event itemchanged(1,dw_1.object.cod_concep,dw_1.getitemstring(1,'cod_concep'))
elseif not isnull(dw_1.getitemstring(1,'cod_tipo')) then
	dw_1.setcolumn('cod_tipo')
	dw_1.event itemchanged(1,dw_1.object.cod_tipo,dw_1.getitemstring(1,'cod_tipo'))
else
	dw_1.setcolumn('tipo')
	dw_1.event itemchanged(1,dw_1.object.tipo,dw_1.getitemstring(1,'tipo'))
end if
end event

type dw_pend from datawindow within w_pago_impuesto
integer x = 18
integer y = 496
integer width = 3186
integer height = 896
integer taborder = 20
string dataobject = "dw_impu_a_pagar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

event rowfocuschanged;st_1.text="Reg. "+string(dw_pend.getrow()) +" de "+string(dw_pend.rowcount())
end event

event retrieveend;this.triggerevent(rowfocuschanged!)

end event

type dw_1 from datawindow within w_pago_impuesto
event keypres pbm_dwnkey
integer width = 2958
integer height = 252
integer taborder = 10
string title = "none"
string dataobject = "dw_3combo_impuestos"
boolean border = false
boolean livescroll = true
end type

event keypres;if key=keydelete! then
	string nulo
	setnull(nulo)
	choose case  getcolumnname()
		case 'cod_tipo'
			idw_impu.reset()
			setitem(1,'cod_tipo',nulo)
			setitem(1,'cod_concep',nulo)
			post event itemchanged(1,object.tipo,getitemstring(1,'tipo'))
		case 'cod_concep'
			setitem(1,'cod_concep',nulo)
			post event itemchanged(1,object.cod_tipo,getitemstring(1,'cod_tipo'))
	end choose
end if
end event

event constructor;settransobject(sqlca)
getchild('cod_tipo',idw_tipo)
getchild('cod_concep',idw_impu)
idw_tipo.settransobject(sqlca)
idw_impu.settransobject(sqlca)

insertrow(1)
setitem(1,'inicia',datetime(date(year(today()),month(today()),1)))
if isdate(string(year(today()))+'-'+string(month(today()))+'-31') then 
	setitem(1,'termina',datetime(date(year(today()),month(today()),31),time('23:59')))
elseif isdate(string(year(today()))+'-'+string(month(today()))+'-30') then
	setitem(1,'termina',datetime(date(year(today()),month(today()),30),time('23:59')))
elseif isdate(string(year(today()))+'-'+string(month(today()))+'-29') then
	setitem(1,'termina',datetime(date(year(today()),month(today()),29),time('23:59')))
else
	setitem(1,'termina',datetime(date(year(today()),month(today()),28),time('23:59')))
end if

end event

event itemchanged;string nulo,filtro
setnull(nulo)
accepttext()
dw_pend.retrieve(getitemstring(1,'tipo'),getitemdatetime(1,'inicia'),getitemdatetime(1,'termina'))
dw_2.retrieve(getitemstring(1,'tipo'),getitemdatetime(1,'inicia'),getitemdatetime(1,'termina'))
choose case dwo.name
	case 'lugar'
		filtra()
	
	case 'tipo'
		idw_tipo.retrieve(data)
		idw_impu.reset()
		setitem(1,'cod_tipo',nulo)
		setitem(1,'cod_concep',nulo)
		filtra()
		
	case 'cod_tipo'
		idw_impu.retrieve(data)
		setitem(1,'cod_concep',nulo)
		filtra()
	case 'cod_concep'
		filtra()
end choose
sort()
dw_pend.groupcalc()
dw_pend.triggerevent(rowfocuschanged!)
end event

