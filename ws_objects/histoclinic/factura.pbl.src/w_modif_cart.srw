$PBExportHeader$w_modif_cart.srw
forward
global type w_modif_cart from window
end type
type dw_1 from datawindow within w_modif_cart
end type
type pb_cancel from picturebutton within w_modif_cart
end type
type pb_1 from picturebutton within w_modif_cart
end type
end forward

global type w_modif_cart from window
integer width = 1147
integer height = 560
boolean titlebar = true
string title = "Confirmar Valores"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
pb_cancel pb_cancel
pb_1 pb_1
end type
global w_modif_cart w_modif_cart

type variables
datawindowchild idw_glo
datawindow i_dw
uo_datastore idw_cab
end variables

on w_modif_cart.create
this.dw_1=create dw_1
this.pb_cancel=create pb_cancel
this.pb_1=create pb_1
this.Control[]={this.dw_1,&
this.pb_cancel,&
this.pb_1}
end on

on w_modif_cart.destroy
destroy(this.dw_1)
destroy(this.pb_cancel)
destroy(this.pb_1)
end on

event open;i_dw=message.powerobjectparm
idw_cab=create uo_datastore
idw_cab.dataobject='dw_trae_car_cab'
idw_cab.settransobject(sqlca)
if idw_cab.retrieve(i_dw.getitemnumber(i_dw.getrow(),'num_radicacion'),i_dw.getitemstring(i_dw.getrow(),'clugar'))<>1 then
	messagebox('Atención', 'no se puede encontrar en numero de cobro de esta radicación')
	close(this)
	return
end if
dw_1.setitem(1,'valor',i_dw.getitemnumber(1,'compute_1'))
end event

type dw_1 from datawindow within w_modif_cart
integer width = 1134
integer height = 296
integer taborder = 10
string title = "none"
string dataobject = "dw_tipo_refact_cart"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('cartipo',idw_glo)
idw_glo.settransobject(sqlca)
idw_glo.setfilter('operacion=-1')
idw_glo.retrieve('3')
insertrow(1)
setitem(1,'fecha',datetime(today()))
if idw_glo.rowcount()=1 then setitem(1,'cartipo',idw_glo.getitemstring(1,'cartipo'))
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type pb_cancel from picturebutton within w_modif_cart
integer x = 544
integer y = 316
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean flatstyle = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

type pb_1 from picturebutton within w_modif_cart
integer x = 361
integer y = 316
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean flatstyle = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;long item,ncobro
string clug_cob,cdoc,tipo,err
dec valor
valor=dw_1.getitemnumber(1,'valor')
tipo=dw_1.getitemstring(1,'cartipo')
if isnull(tipo) then 
	messagebox('Atención','Debe escoger el tipo de Glosa')
	return
end if
ncobro=idw_cab.getitemnumber(1,'num_cobro')
clug_cob=idw_cab.getitemstring(1,'clugar')
cdoc=idw_cab.getitemstring(1,'coddoc')
select max(item) into :item from car_cobro_cpo where clugar=:clug_cob and coddoc=:cdoc and num_cobro=:ncobro and cartipo=:tipo;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo car_cobro_cpo',sqlca.sqlerrtext)
	return
end if
if isnull(item) then item=0
item ++
dw_1.setitem(1,'clugar',clug_cob)
dw_1.setitem(1,'coddoc',cdoc)
dw_1.setitem(1,'num_cobro',ncobro)
dw_1.setitem(1,'item',item)
dw_1.setitem(1,'usuario',usuario)
dw_1.accepttext()
update car_cobro_cab set vtcancelar=vtcancelar - :valor where  clugar=:clug_cob and coddoc=:cdoc and num_cobro=:ncobro;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando car_cobro_cab',err)
	return
end if
w_hist_restas.dw_1.setitem(w_hist_restas.dw_1.getrow(),'estado_refact','C')
if w_hist_restas.dw_1.update(true,false)=-1 then return
if dw_1.update(true,false)=-1 then return
commit;
w_hist_restas.dw_1.resetupdate()
dw_1.resetupdate()
close(parent)
end event

