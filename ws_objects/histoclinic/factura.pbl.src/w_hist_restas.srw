$PBExportHeader$w_hist_restas.srw
forward
global type w_hist_restas from window
end type
type pb_6 from picturebutton within w_hist_restas
end type
type pb_1 from picturebutton within w_hist_restas
end type
type pb_save from picturebutton within w_hist_restas
end type
type tab_1 from tab within w_hist_restas
end type
type tp_1 from userobject within tab_1
end type
type pb_cerrar_fact from picturebutton within tp_1
end type
type pb_5 from picturebutton within tp_1
end type
type pb_3 from picturebutton within tp_1
end type
type st_2 from statictext within tp_1
end type
type dw_news from datawindow within tp_1
end type
type st_1 from statictext within tp_1
end type
type dw_facts from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_cerrar_fact pb_cerrar_fact
pb_5 pb_5
pb_3 pb_3
st_2 st_2
dw_news dw_news
st_1 st_1
dw_facts dw_facts
end type
type tp_2 from userobject within tab_1
end type
type pb_4 from picturebutton within tp_2
end type
type dw_resto from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_4 pb_4
dw_resto dw_resto
end type
type tab_1 from tab within w_hist_restas
tp_1 tp_1
tp_2 tp_2
end type
type dw_1 from datawindow within w_hist_restas
end type
type gb_1 from groupbox within w_hist_restas
end type
end forward

global type w_hist_restas from window
integer width = 3918
integer height = 1916
boolean titlebar = true
string title = "Cambiar responsable a facturas ya radicadas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_6 pb_6
pb_1 pb_1
pb_save pb_save
tab_1 tab_1
dw_1 dw_1
gb_1 gb_1
end type
global w_hist_restas w_hist_restas

type variables
string i_operacion
boolean i_cambio
end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();i_operacion = 'Delete'
if tab_1.tp_1.dw_news.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_facts.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = 'Insert'
if tab_1.tp_1.dw_facts.Update(true,false) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_news.Update(true,false) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = ''

commit;
dw_1.resetupdate()
dw_1.setitemstatus(1,0,primary!,datamodified!)
dw_1.setitemstatus(1,0,primary!,notmodified!)
dw_1.setredraw(true)
tab_1.tp_1.dw_facts.resetupdate()
tab_1.tp_1.dw_news.resetUpdate()
i_cambio=false
return 1
end function

on w_hist_restas.create
this.pb_6=create pb_6
this.pb_1=create pb_1
this.pb_save=create pb_save
this.tab_1=create tab_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_6,&
this.pb_1,&
this.pb_save,&
this.tab_1,&
this.dw_1,&
this.gb_1}
end on

on w_hist_restas.destroy
destroy(this.pb_6)
destroy(this.pb_1)
destroy(this.pb_save)
destroy(this.tab_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event closequery;if i_cambio then
	choose case messagebox('Atención', 'Modificó una radicación, desea guardar los cambios ?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cambio=false
		case 3
			return 1
	end choose
end if
end event

type pb_6 from picturebutton within w_hist_restas
integer x = 3081
integer y = 204
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cerrar.gif"
string disabledname = "D_cerrar.gif"
alignment htextalign = left!
string powertiptext = "Cierra Radicación Modificada"
end type

event clicked;if dw_1.rowcount()=0 then return
if tab_1.tp_1.dw_facts.find('estado="S"',1,tab_1.tp_1.dw_facts.rowcount())>0 then
	messagebox('Atención','Hay facturas que no han sido cerradas (refacturadas), no puede cerrar esta radicación')
	return
end if
if not isnull(dw_1.getitemstring(dw_1.getrow(),'estado_refact')) then return

//idw_cab=create uo_datastore
//idw_cab.dataobject='dw_trae_car_cab'
//idw_cab.settransobject(sqlca)
//if idw_cab.retrieve(i_dw.getitemnumber(i_dw.getrow(),'num_radicacion'),i_dw.getitemstring(i_dw.getrow(),'clugar'))<>1 then
//	messagebox('Atención', 'no se puede encontrar en numero de cobro de esta radicación')
//	close(this)
//	return
//end if
//long ncobro
//string clug_cob,cdoc,tipo,err
//ncobro=idw_cab.getitemnumber(1,'num_cobro')
//clug_cob=idw_cab.getitemstring(1,'clugar')
//cdoc=idw_cab.getitemstring(1,'coddoc')
//openwithparm(w_modif_cart,tab_1.tp_1.dw_facts)
end event

type pb_1 from picturebutton within w_hist_restas
integer x = 3081
integer y = 64
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "D_insertar.gif"
alignment htextalign = left!
string powertiptext = "Inserta Radiación Glosada"
end type

event clicked;long j
j=dw_1.rowcount()
openwithparm(w_busca_radicaciones,dw_1)
if j<>dw_1.rowcount() then i_cambio=true
end event

type pb_save from picturebutton within w_hist_restas
integer x = 3081
integer y = 452
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guarda Modificación"
end type

event clicked;grabar()
end event

type tab_1 from tab within w_hist_restas
integer y = 612
integer width = 3753
integer height = 1128
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
integer x = 18
integer y = 112
integer width = 3717
integer height = 1000
long backcolor = 67108864
string text = "Refacturar"
long tabtextcolor = 33554432
string picturename = "factura.ico"
long picturemaskcolor = 536870912
string powertiptext = "Facturas que han sido retiradas de la radicación"
pb_cerrar_fact pb_cerrar_fact
pb_5 pb_5
pb_3 pb_3
st_2 st_2
dw_news dw_news
st_1 st_1
dw_facts dw_facts
end type

on tp_1.create
this.pb_cerrar_fact=create pb_cerrar_fact
this.pb_5=create pb_5
this.pb_3=create pb_3
this.st_2=create st_2
this.dw_news=create dw_news
this.st_1=create st_1
this.dw_facts=create dw_facts
this.Control[]={this.pb_cerrar_fact,&
this.pb_5,&
this.pb_3,&
this.st_2,&
this.dw_news,&
this.st_1,&
this.dw_facts}
end on

on tp_1.destroy
destroy(this.pb_cerrar_fact)
destroy(this.pb_5)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.dw_news)
destroy(this.st_1)
destroy(this.dw_facts)
end on

type pb_cerrar_fact from picturebutton within tp_1
string tag = "Cerrar factura Modificaca"
integer x = 2235
integer y = 192
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
string picturename = "cerrar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar seleccionada"
end type

event clicked;if dw_facts.rowcount()=0 then return
long j
j=dw_facts.find('esco=1',1,dw_facts.rowcount())
if j=0 then return
dw_facts.setrow(j)
if dw_facts.getitemstring(dw_facts.getrow(),'estado')='R' then return
if dw_news.rowcount()=0 then
	messagebox('Atención','Este registro no tiene nuevas facturas, no lo puede cerrar')
	return
end if
if dw_news.find('isnull(estado)',1,dw_news.rowcount())=0 then
	messagebox('Atención','Este registro no tiene nuevas facturas activas, no lo puede cerrar')
	return
end if
if messagebox('Atención','Está seguro que desea cerrar esta factura ?',question!,yesno!,2)=2 then return
dw_facts.setitem(dw_facts.getrow(),'estado','R')
if grabar()=-1 then dw_1.event rowfocuschanged(dw_1.getrow())
end event

type pb_5 from picturebutton within tp_1
integer x = 2240
integer y = 540
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Factura  (fila actual)"
end type

event clicked;if dw_facts.rowcount()=0 or dw_1.rowcount()=0 then return
if not isnull(dw_1.getitemstring(dw_1.getrow(),'estado_refact')) then return
if dw_facts.getitemstring(dw_facts.getrow(),'contabil')='C' then
	messagebox('Atención','Este registro ya fue contabilizado no lo puede borrar')
	return
end if
if dw_news.find('isnull(estado)',1,dw_news.rowcount())>0 then
	messagebox('Atención','Las nuevas facturas generadas no están anuladas, no puede borrar el registro')
	return
end if
do while dw_news.rowcount()>0
	dw_news.deleterow(0)
loop
long donde
donde=tab_1.tp_2.dw_resto.insertrow(0)
tab_1.tp_2.dw_resto.setitem(donde,'nradica',dw_facts.getitemnumber (dw_facts.getrow(),'num_radicacion'))
tab_1.tp_2.dw_resto.setitem(donde,'clugar_rad',dw_facts.getitemstring (dw_facts.getrow(),'clugar'))
tab_1.tp_2.dw_resto.setitem(donde,'nfact',dw_facts.getitemnumber (dw_facts.getrow(),'nfact'))
tab_1.tp_2.dw_resto.setitem(donde,'clugar',dw_facts.getitemstring (dw_facts.getrow(),'clugar_fact'))
tab_1.tp_2.dw_resto.setitem(donde,'fecha',dw_facts.getitemdatetime (dw_facts.getrow(),'fecha'))
tab_1.tp_2.dw_resto.setitem(donde,'vtemp',dw_facts.getitemnumber (dw_facts.getrow(),'valor_resta'))
tab_1.tp_2.dw_resto.setitem(donde,'selecc','0')
dw_facts.deleterow(0)
i_cambio=true
end event

type pb_3 from picturebutton within tp_1
integer x = 2235
integer y = 56
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
string picturename = "factura.gif"
alignment htextalign = left!
string powertiptext = "Refacturar seleccionada"
end type

event clicked;long j
j=dw_facts.find('esco=1',1,dw_facts.rowcount())
if j=0 then return
dw_facts.setrow(j)
setnull(docu)
setnull(tipdoc)
openwithparm(w_refactura,dw_facts)
dw_facts.event rowfocuschanged(dw_facts.getrow())
end event

type st_2 from statictext within tp_1
integer x = 2405
integer width = 1102
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Facturas generadas a partir de la factura original:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_news from datawindow within tp_1
integer x = 2400
integer y = 56
integer width = 1303
integer height = 896
integer taborder = 20
string title = "none"
string dataobject = "dw_new_facts"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

type st_1 from statictext within tp_1
integer x = 9
integer width = 905
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Facturas a ser retiradas de la radicación:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_facts from datawindow within tp_1
integer x = 5
integer y = 56
integer width = 2208
integer height = 900
integer taborder = 20
string title = "none"
string dataobject = "dw_fact_rips_resta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject( SQLCA)
end event

event rowfocuschanged;dw_news.reset()
if getrow()<1 then return
dw_news.retrieve(getitemnumber(getrow(),'num_radicacion'),getitemstring(getrow(),'clugar'),getitemstring(getrow(),'tipo'),getitemnumber(getrow(),'item'))
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo='Insert' then
		uo_datastore dw_adms
		dw_adms=create uo_datastore
		dw_adms.dataobject='dw_abre_adms'
		dw_adms.settransobject(sqlca)
		if dw_adms.retrieve(getitemnumber(row,'nfact',buffer,false),getitemstring(row,'clugar_fact',buffer,false))>0 then
			dw_adms.object.estado.primary=dw_adms.object.new_est.primary
			if dw_adms.update()=-1 then 
				rollback;
				destroy dw_adms
				return 1
			end if
		end if
		destroy dw_adms
	end if
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3717
integer height = 1000
long backcolor = 67108864
string text = "Facturas de la Rad."
long tabtextcolor = 33554432
string picturename = "pesos_deta.ico"
long picturemaskcolor = 536870912
string powertiptext = "Resto de facturas de la radicación"
pb_4 pb_4
dw_resto dw_resto
end type

on tp_2.create
this.pb_4=create pb_4
this.dw_resto=create dw_resto
this.Control[]={this.pb_4,&
this.dw_resto}
end on

on tp_2.destroy
destroy(this.pb_4)
destroy(this.dw_resto)
end on

type pb_4 from picturebutton within tp_2
integer x = 2144
integer y = 16
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean flatstyle = true
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Llevar a refacturar"
end type

event clicked;if dw_1.rowcount()=0 then return
if not isnull(dw_1.getitemstring(dw_1.getrow(),'estado_refact')) then return
dw_resto.setfilter('')
dw_resto.filter()
if dw_resto.rowcount()=0 then return
if dw_resto.find('selecc="1"',1,dw_resto.rowcount())=0 then return
long j,k,l
dw_resto.setfilter('selecc="1"')
dw_resto.filter()
for j=1 to dw_resto.rowcount()
	k=tab_1.tp_1.dw_facts.insertrow(0)
	tab_1.tp_1.dw_facts.setitem(k,'num_radicacion',dw_resto.getitemnumber(j,'nradica'))
	tab_1.tp_1.dw_facts.setitem(k,'clugar',dw_resto.getitemstring(j,'clugar_rad'))
	tab_1.tp_1.dw_facts.setitem(k,'tipo',dw_resto.getitemstring(j,'tipo_rad'))
	for l=tab_1.tp_1.dw_facts.rowcount() to 1 step -1 //por lo general es el ultimo que está libre por eso va de pa tras
		if tab_1.tp_1.dw_facts.find('item='+string(l),1,tab_1.tp_1.dw_facts.rowcount())=0 then exit
	next
	tab_1.tp_1.dw_facts.setitem(k,'item',l)
	tab_1.tp_1.dw_facts.setitem(k,'fecha',datetime(today(),now()))
	tab_1.tp_1.dw_facts.setitem(k,'nfact',dw_resto.getitemnumber(j,'nfact'))
	tab_1.tp_1.dw_facts.setitem(k,'clugar_fact',dw_resto.getitemstring(j,'clugar'))
	tab_1.tp_1.dw_facts.setitem(k,'tipo_fact',dw_resto.getitemstring(j,'tipo'))
	tab_1.tp_1.dw_facts.setitem(k,'valor_resta',dw_resto.getitemnumber(j,'vtemp'))
	tab_1.tp_1.dw_facts.setitem(k,'contabil','P')
	tab_1.tp_1.dw_facts.setitem(k,'estado','S')
next
do while dw_resto.rowcount()>0
	dw_resto.deleterow(0)
loop
dw_resto.setfilter('')
dw_resto.filter()
tab_1.selectedtab=1
i_cambio=true
end event

type dw_resto from datawindow within tp_2
integer y = 12
integer width = 2075
integer height = 940
integer taborder = 30
string title = "none"
string dataobject = "dw_resto_facturas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject( SQLCA)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type dw_1 from datawindow within w_hist_restas
integer x = 23
integer y = 56
integer width = 3031
integer height = 516
integer taborder = 10
string title = "none"
string dataobject = "dw_rips_resta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject( SQLCA)
this.retrieve( )
end event

event rowfocuschanged;tab_1.tp_1.dw_facts.reset()
tab_1.tp_2.dw_resto.reset()
if getrow()<1 then return
tab_1.tp_1.dw_facts.retrieve(getitemnumber(getrow(),'num_radicacion'),getitemstring(getrow(),'clugar'),getitemstring(getrow(),'tipo'))
tab_1.tp_2.dw_resto.retrieve(getitemnumber(getrow(),'num_radicacion'),getitemstring(getrow(),'clugar'),getitemstring(getrow(),'tipo'))
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanging;if i_cambio then
	choose case messagebox('Atención', 'Modificó una radicación, desea guardar los cambios ?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cambio=false
		case 3
			return 1
	end choose
end if
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type gb_1 from groupbox within w_hist_restas
integer width = 3282
integer height = 608
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de radicaciones modificadas"
end type

