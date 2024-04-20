$PBExportHeader$w_interfaz_sum_entradas.srw
forward
global type w_interfaz_sum_entradas from window
end type
type pb_2 from picturebutton within w_interfaz_sum_entradas
end type
type pb_1 from picturebutton within w_interfaz_sum_entradas
end type
type dw_ent from datawindow within w_interfaz_sum_entradas
end type
end forward

global type w_interfaz_sum_entradas from window
integer width = 3671
integer height = 1456
boolean titlebar = true
string title = "Entradas de Almacen A RFC"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_ent dw_ent
end type
global w_interfaz_sum_entradas w_interfaz_sum_entradas

type variables
st_ord_pago i_docu
end variables

on w_interfaz_sum_entradas.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_ent=create dw_ent
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_ent}
end on

on w_interfaz_sum_entradas.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_ent)
end on

event open;i_docu=message.powerobjectparm
dw_ent.retrieve(i_docu.tdoc,i_docu.docu)

end event

type pb_2 from picturebutton within w_interfaz_sum_entradas
integer x = 1742
integer y = 1224
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
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_interfaz_sum_entradas
integer x = 1591
integer y = 1224
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
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar y llevar a Cartera"
end type

event clicked;double l_j

dw_ent.accepttext()
l_j=dw_ent.find('esco=1',1,dw_ent.rowcount())
do while l_j > 0
	i_docu.dw_cpo.insertrow(1)
	i_docu.dw_cpo.setitem(1,'clugar',w_recibe_fact.is_clug_rad)
	i_docu.dw_cpo.setitem(1,'coddoc',w_recibe_fact.is_cdoc)
	i_docu.dw_cpo.setitem(1,'nrelacion',w_recibe_fact.idb_nrad)
	i_docu.dw_cpo.setitem(1,'clugar_se',dw_ent.getitemstring(l_j,'clugar'))
	i_docu.dw_cpo.setitem(1,'coddoc_se',dw_ent.getitemstring(l_j,'coddoc'))
	i_docu.dw_cpo.setitem(1,'numdoc_se',dw_ent.getitemnumber(l_j,'numdoc'))
	i_docu.dw_cpo.setitem(1,'tipodoc',dw_ent.getitemstring(l_j,'tipodoc'))
	i_docu.dw_cpo.setitem(1,'documento',dw_ent.getitemstring(l_j,'documento'))
	i_docu.dw_cpo.setitem(1,'nombre',dw_ent.getitemstring(l_j,'nombre'))	
	i_docu.dw_cpo.setitem(1,'fecha',dw_ent.getitemdatetime(l_j,'fecha'))	
	i_docu.dw_cpo.setitem(1,'prefijo_fac',dw_ent.getitemstring(l_j,'prefijo_fac'))
	i_docu.dw_cpo.setitem(1,'num_fact',dw_ent.getitemnumber(l_j,'num_fact'))	
	i_docu.dw_cpo.setitem(1,'usuario',usuario)
	dw_ent.setitem(l_j,'esco',0)
	l_j=dw_ent.find('esco=1',1,dw_ent.rowcount())
loop
close(parent)
end event

type dw_ent from datawindow within w_interfaz_sum_entradas
integer x = 37
integer y = 32
integer width = 3547
integer height = 1172
integer taborder = 10
string title = "none"
string dataobject = "dw_sum_entradas_a_rfc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;long esco=0,j
if dwo.text='Desele.' then
	dwo.text='Escoger.'
else
	dwo.text='Desele.'
	esco=1
end if
for j=1 to rowcount()
	setitem(j,'esco',esco)
next

end event

event constructor;settransobject(sqlca)
end event

