$PBExportHeader$w_abre_cmen.srw
forward
global type w_abre_cmen from window
end type
type pb_ok from picturebutton within w_abre_cmen
end type
type dw_1 from datawindow within w_abre_cmen
end type
end forward

global type w_abre_cmen from window
integer width = 2944
integer height = 1336
boolean titlebar = true
string title = "Escoger reservas para apertura de Caja Menor"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_ok pb_ok
dw_1 dw_1
end type
global w_abre_cmen w_abre_cmen

type variables
//datawindow i_dw
st_caja_menor i_dw
end variables

on w_abre_cmen.create
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.Control[]={this.pb_ok,&
this.dw_1}
end on

on w_abre_cmen.destroy
destroy(this.pb_ok)
destroy(this.dw_1)
end on

event open;i_dw=message.powerobjectparm
if i_dw.ppto then 
	dw_1.dataobject='dw_reserv_a_cmen'
	dw_1.settransobject(sqlca)
 	dw_1.retrieve('PR','APCM', i_dw.caja)
else
	dw_1.dataobject='dw_abre_cajame_sin_reserva'
	dw_1.settransobject(sqlca)
	dw_1.retrieve()
end if
end event

type pb_ok from picturebutton within w_abre_cmen
integer x = 1275
integer y = 1072
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = " "
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
if dw_1.getitemnumber(1,'total')=0 then return
long j,k
for j=1 to dw_1.rowcount()	
	if dw_1.getitemnumber(j,'esco')=0 then continue
	k=i_dw.dw_intf.insertrow(0)
//	i_dw.setitem(k,'codigo','APCMPT-')
//	i_dw.setitem(k,'num_orig1',dw_1.getitemnumber(j,'ntransferencia'))
////	i_dw.dw_intf.setitem(k,'num_orig2',dw_1.getitemnumber(j,'item'))
//	i_dw.setitem(k,'char_orig1',dw_1.getitemstring(j,'coddoc'))
//	i_dw.setitem(k,'char_orig2',dw_1.getitemstring(j,'clugar'))
//	i_dw.setitem(k,'valor',round(dw_1.getitemnumber(j,'valor'),2))
//	i_dw.setitem(k,'cod_vigencia',dw_1.getitemnumber(j,'cod_vigencia'))
//	i_dw.setitem(k,'codtotal',dw_1.getitemstring(j,'codtotal'))
	i_dw.dw_intf.setitem(k,'codigo','APCMPT-')
	i_dw.dw_intf.setitem(k,'num_orig1',dw_1.getitemnumber(j,'ntransferencia'))
	i_dw.dw_intf.setitem(k,'char_orig1',dw_1.getitemstring(j,'coddoc'))
	i_dw.dw_intf.setitem(k,'char_orig2',dw_1.getitemstring(j,'clugar'))
	if i_dw.ppto then 
		i_dw.dw_intf.setitem(k,'cod_vigencia',dw_1.getitemnumber(j,'cod_vigencia'))
		i_dw.dw_intf.setitem(k,'codtotal',dw_1.getitemstring(j,'codtotal'))
		i_dw.dw_intf.setitem(k,'valor',round(dw_1.getitemnumber(j,'valor'),2))
	else
		i_dw.dw_intf.setitem(k,'num_orig2',dw_1.getitemnumber(j,'item'))
		i_dw.dw_intf.setitem(k,'valor',round(dw_1.getitemnumber(j,'v_bruto'),2))
	end if
next
close(parent)
end event

type dw_1 from datawindow within w_abre_cmen
integer width = 2830
integer height = 1060
integer taborder = 10
string title = "none"
string dataobject = "dw_reserv_a_cmen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event buttonclicked;int i
if describe("b_1.text") = 'Selec.' then
	for i = 1 to rowCount()
		SetItem(i,'esco',1)
	next
	Modify("b_1.Text='Desel.'")
else
	for i = 1 to rowCount()
		SetItem(i,'esco',0)
	next
	Modify("b_1.Text='Selec.'")
end if


end event

event itemchanged;long sel,nd,i
sel=long(data)
nd = GetItemNumber(GetRow(),'ntransferencia')
for i = 1 to rowCount()
	if GetItemNumber(i,'ntransferencia') = nd then
		SetItem(i,'esco',sel)
	end if
next
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)


end event

