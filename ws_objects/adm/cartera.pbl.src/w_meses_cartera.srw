$PBExportHeader$w_meses_cartera.srw
forward
global type w_meses_cartera from w_center
end type
type dw_meses from datawindow within w_meses_cartera
end type
type pb_cierre from picturebutton within w_meses_cartera
end type
type st_1 from statictext within w_meses_cartera
end type
type pb_abre from picturebutton within w_meses_cartera
end type
type dw_nuevo from datawindow within w_meses_cartera
end type
type pb_nuevo from picturebutton within w_meses_cartera
end type
type b_1 from hprogressbar within w_meses_cartera
end type
type gb_1 from groupbox within w_meses_cartera
end type
end forward

global type w_meses_cartera from w_center
integer width = 1371
integer height = 1484
string title = "Cartera- Periodos"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_vigencia.ico"
boolean clientedge = true
dw_meses dw_meses
pb_cierre pb_cierre
st_1 st_1
pb_abre pb_abre
dw_nuevo dw_nuevo
pb_nuevo pb_nuevo
b_1 b_1
gb_1 gb_1
end type
global w_meses_cartera w_meses_cartera

type variables
string i_codemp=''
end variables

on w_meses_cartera.create
int iCurrent
call super::create
this.dw_meses=create dw_meses
this.pb_cierre=create pb_cierre
this.st_1=create st_1
this.pb_abre=create pb_abre
this.dw_nuevo=create dw_nuevo
this.pb_nuevo=create pb_nuevo
this.b_1=create b_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_meses
this.Control[iCurrent+2]=this.pb_cierre
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.pb_abre
this.Control[iCurrent+5]=this.dw_nuevo
this.Control[iCurrent+6]=this.pb_nuevo
this.Control[iCurrent+7]=this.b_1
this.Control[iCurrent+8]=this.gb_1
end on

on w_meses_cartera.destroy
call super::destroy
destroy(this.dw_meses)
destroy(this.pb_cierre)
destroy(this.st_1)
destroy(this.pb_abre)
destroy(this.dw_nuevo)
destroy(this.pb_nuevo)
destroy(this.b_1)
destroy(this.gb_1)
end on

event resize;call super::resize;resize(1400,1600)
end event

event open;call super::open;dw_meses.retrieve()

end event

type pb_grabar from w_center`pb_grabar within w_meses_cartera
integer x = 777
integer y = 1140
integer textsize = -8
integer weight = 700
string facename = "Tahoma"
boolean enabled = false
string powertiptext = "Guardar Periodo [Alt+G]"
end type

event pb_grabar::clicked;call super::clicked;int ano,mes,anoant,mesant
ano=dw_nuevo.getitemnumber(1,"ano")
mes=dw_nuevo.getitemnumber(1,"mes")
b_1.position=5
dw_meses.insertrow(1)
dw_meses.setitem(1,"ano",ano)
dw_meses.setitem(1,"mes",mes)
if dw_meses.update(true,false)=-1 then
	b_1.position=0
	rollback;
	return
end if
if mes=1 and dw_meses.rowcount()>1 then
	anoant=ano -1
end if
b_1.position=80
commit;
dw_meses.resetupdate()
b_1.position=100
dw_nuevo.reset()
enabled=false
pb_nuevo.enabled=true
b_1.position=0
end event

type dw_meses from datawindow within w_meses_cartera
integer x = 59
integer y = 84
integer width = 978
integer height = 876
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cierre_cart"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_cierre from picturebutton within w_meses_cartera
event mousemove pbm_mousemove
integer x = 1074
integer y = 92
integer width = 142
integer height = 124
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                &c"
string picturename = "cerrar.GIF"
string disabledname = "d_cerrar.GIF"
string powertiptext = "Cerrar Mes [Alt+C]"
end type

event clicked;long fila,j,hasta
string Mensaje
fila=dw_meses.getrow()
if fila<1 then return
if dw_meses.getitemstring(fila,"estado")='1' then return
mensaje="Está seguro que desea cerrar este mes"
b_1.position=5
if fila= dw_meses.rowcount() then 
	hasta = fila
else
	hasta=0
	for j=fila +1 to dw_meses.rowcount()
		if dw_meses.getitemstring(j,"estado")='1' then
			hasta=j -1
			exit
		end if
	next
	if hasta=0 then hasta=dw_meses.rowcount()
end if
b_1.position=10
if fila<>hasta then mensaje+=" y los anteriores a él"
if messagebox("Atención",mensaje+" ?",question!,yesno!,2)=2 then 
	b_1.position=0
	return
end if
int ano,mes
long cuantos
for j=fila to hasta
	ano=dw_meses.getitemnumber(j,"ano")
	mes=dw_meses.getitemnumber(j,"mes")
next
for j=fila to hasta
	b_1.position= 10 + ( ((j - fila) * 90)/(hasta - fila +1) )
	dw_meses.setitem(j,"estado",'1')
next
if dw_meses.update()=-1 then
	rollback;
	b_1.position=0
	return
end if
b_1.position=100
commit;
b_1.position=0
end event

type st_1 from statictext within w_meses_cartera
integer x = 59
integer y = 28
integer width = 448
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Periodos Cartera:"
boolean focusrectangle = false
end type

type pb_abre from picturebutton within w_meses_cartera
event mousemove pbm_mousemove
integer x = 1074
integer y = 276
integer width = 142
integer height = 124
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                &a"
string picturename = "abrir2.GIF"
string disabledname = "d_abrir2.GIF"
string powertiptext = "Abrir Mes [Alt+A]"
end type

event clicked;long fila,j
string Mensaje
fila=dw_meses.getrow()
if fila<1 then return
if dw_meses.getitemstring(fila,"estado")='0' then return
mensaje="Está seguro que desea abrir este mes"
if fila>1 then mensaje+=" y los posteriores a él"
if messagebox("Atención",mensaje+" ?",question!,yesno!,2)=2 then return
b_1.position=10
for j=1 to fila
	b_1.position= 10 + (J * 90)/fila
	if dw_meses.getitemstring(j,"estado")='1' then
		dw_meses.setitem(j,"estado",'0')
	end if
next
if dw_meses.update()=-1 then
	rollback;
	b_1.position= 0
	return
end if
b_1.position= 100
commit;
b_1.position=0
end event

type dw_nuevo from datawindow within w_meses_cartera
integer x = 201
integer y = 1120
integer width = 475
integer height = 176
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_doc_cab"
boolean border = false
boolean livescroll = true
end type

event constructor;this.modify("fecha.protect=1")

end event

type pb_nuevo from picturebutton within w_meses_cartera
event mousemove pbm_mousemove
integer x = 1074
integer y = 468
integer width = 142
integer height = 124
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "               &n"
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
string powertiptext = "Nuevo Periodo [Alt+N]"
end type

event clicked;int smes,sano
string cerrado
if dw_meses.rowcount()>0 then
	smes=dw_meses.getitemnumber(1,"mes")
	sano=dw_meses.getitemnumber(1,"ano")
	if smes=13 then 
		smes=1
		sano=sano+1
	else
		smes=smes+1
	end if
else
	sano=year(today())
	smes=month(today())
end if
dw_nuevo.insertrow(1)
dw_nuevo.setitem(1,"ano",sano)
dw_nuevo.setitem(1,"mes",smes)
dw_nuevo.setitem(1,"estado",1)
if dw_meses.rowcount()>0 then dw_nuevo.enabled=false
enabled=false
pb_grabar.enabled=true
end event

type b_1 from hprogressbar within w_meses_cartera
integer x = 59
integer y = 1008
integer width = 983
integer height = 52
boolean bringtotop = true
unsignedinteger maxposition = 100
integer setstep = 10
end type

type gb_1 from groupbox within w_meses_cartera
integer x = 64
integer y = 1068
integer width = 983
integer height = 248
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nuevo Periodo"
end type

