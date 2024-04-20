$PBExportHeader$w_lleva_repocmen_giro.srw
forward
global type w_lleva_repocmen_giro from window
end type
type pb_ok from picturebutton within w_lleva_repocmen_giro
end type
type st_2 from statictext within w_lleva_repocmen_giro
end type
type dw_2 from datawindow within w_lleva_repocmen_giro
end type
type st_1 from statictext within w_lleva_repocmen_giro
end type
type dw_1 from datawindow within w_lleva_repocmen_giro
end type
end forward

global type w_lleva_repocmen_giro from window
integer width = 3305
integer height = 1852
boolean titlebar = true
string title = "Escoger Reposición de Caja Menor para Giro"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_ok pb_ok
st_2 st_2
dw_2 dw_2
st_1 st_1
dw_1 dw_1
end type
global w_lleva_repocmen_giro w_lleva_repocmen_giro

type variables
st_interfaz i_st
dec i_valor
end variables

on w_lleva_repocmen_giro.create
this.pb_ok=create pb_ok
this.st_2=create st_2
this.dw_2=create dw_2
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_ok,&
this.st_2,&
this.dw_2,&
this.st_1,&
this.dw_1}
end on

on w_lleva_repocmen_giro.destroy
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
dw_1.retrieve()
end event

type pb_ok from picturebutton within w_lleva_repocmen_giro
integer x = 1495
integer y = 1636
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
long donde,nrel,j,k
string clug_rel
donde=dw_1.find('esco=1',1,dw_1.rowcount())
if donde=0 then
	messagebox('Atención','No ha escogido una Reposición')
	return
end if
nrel=dw_1.getitemnumber(donde,'nreposicion')
clug_rel=dw_1.getitemstring(donde,'clugar')
do while i_st.dw_obj.rowcount()>0
	i_st.dw_obj.deleterow(0)
loop
do while i_st.dw_it.rowcount()>0
	i_st.dw_it.deleterow(0)
loop
do while i_st.dw_ter.rowcount()>0
	i_st.dw_ter.deleterow(0)
loop
if dw_2.rowcount()=0 then
	messagebox('Atención','La recepción que elegió no tiene rubros')
	return
end if

for j=1 to dw_2.rowcount()
	if dw_2.getitemnumber(j,'valor')>dw_2.getitemnumber(j,'disponible') then
		messagebox('Atención',  'El rubro ' +dw_2.getitemstring(j,'codtotal')+' a girar tiene un monto mayor al saldo disponible')
		return
	end if
next
for j=1 to dw_2.rowcount()
	if dw_2.getitemnumber(j,'valor')=0 then continue
	k=i_st.dw_obj.insertrow(0)
	i_st.dw_obj.setitem(k,'coddoc',i_st.coddoc)
	i_st.dw_obj.setitem(k,'clugar',clugar)
	i_st.dw_obj.setitem(k,'item',k)
	i_st.dw_obj.setitem(k,'cod_vigencia',i_st.cod_vigencia)
	i_st.dw_obj.setitem(k,'codtotal',dw_2.getitemstring(j,'codtotal'))
	i_st.dw_obj.setitem(k,'monto',dw_2.getitemnumber(j,'valor'))
	i_st.dw_obj.setitem(k,'coddoc_orig',dw_2.getitemstring(j,'coddoc'))
	i_st.dw_obj.setitem(k,'clugar_orig',dw_2.getitemstring(j,'clugar'))
	i_st.dw_obj.setitem(k,'numdoc_orig',dw_2.getitemnumber(j,'numdoc'))
	i_st.dw_obj.setitem(k,'item_orig',dw_2.getitemnumber(j,'item'))
	i_st.dw_obj.setitem(k,'monto_vigente',dw_2.getitemnumber(j,'valor'))
	i_st.dw_obj.setitem(k,'estado','1')	
next

k=i_st.dw_it.insertrow(0)
i_st.dw_it.setitem(k,'codigo','PGRP-')
i_st.dw_it.setitem(k,'char_orig1','RP')
i_st.dw_it.setitem(k,'char_orig2',clug_rel)
i_st.dw_it.setitem(k,'num_orig1',nrel)
i_st.dw_it.setitem(k,'char_doc1',i_st.coddoc)
i_st.dw_it.setitem(k,'char_doc2',clugar)
i_st.dw_it.setitem(k,'valor',dw_1.getitemnumber(donde,'valor'))


i_st.dw_obj.setrow(i_st.dw_obj.rowcount())
closewithreturn(parent,'ok')
end event

type st_2 from statictext within w_lleva_repocmen_giro
integer x = 9
integer y = 1104
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
string text = "Rubros de la Reposición:"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_lleva_repocmen_giro
integer x = 5
integer y = 1160
integer width = 3264
integer height = 468
integer taborder = 20
string title = "none"
string dataobject = "dw_deta_repo_a_giro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_1 from statictext within w_lleva_repocmen_giro
integer width = 635
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reposiciones de caja Menor:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_lleva_repocmen_giro
integer y = 56
integer width = 3273
integer height = 1016
integer taborder = 10
string title = "none"
string dataobject = "dw_lleva_recep_giro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event rowfocuschanged;dw_2.reset()
if getrow()<1 then return
dw_2.retrieve(getitemstring(getrow(),'clugar'),getitemstring(getrow(),'coddoc'),getitemnumber(getrow(),'nreposicion'))


end event

event rowfocuschanging;if currentrow<1 then return 0
if getitemnumber(currentrow,'esco')=1 then return 1
end event

