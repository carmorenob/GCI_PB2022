$PBExportHeader$w_lista_facturas.srw
forward
global type w_lista_facturas from window
end type
type st_cuantos from statictext within w_lista_facturas
end type
type st_11 from statictext within w_lista_facturas
end type
type dw_empresa from datawindow within w_lista_facturas
end type
type pb_traer from picturebutton within w_lista_facturas
end type
type dw_lista from datawindow within w_lista_facturas
end type
type st_9 from statictext within w_lista_facturas
end type
type st_8 from statictext within w_lista_facturas
end type
type rb_4 from radiobutton within w_lista_facturas
end type
type rb_3 from radiobutton within w_lista_facturas
end type
type dw_tipin from datawindow within w_lista_facturas
end type
type rb_2 from radiobutton within w_lista_facturas
end type
type rb_1 from radiobutton within w_lista_facturas
end type
type dw_lug from datawindow within w_lista_facturas
end type
type em_2 from editmask within w_lista_facturas
end type
type em_1 from editmask within w_lista_facturas
end type
type gb_4 from groupbox within w_lista_facturas
end type
type gb_1 from groupbox within w_lista_facturas
end type
type gb_2 from groupbox within w_lista_facturas
end type
type gb_3 from groupbox within w_lista_facturas
end type
type gb_5 from groupbox within w_lista_facturas
end type
end forward

global type w_lista_facturas from window
integer width = 4997
integer height = 1916
boolean titlebar = true
string title = "Relacion de Facturas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_cuantos st_cuantos
st_11 st_11
dw_empresa dw_empresa
pb_traer pb_traer
dw_lista dw_lista
st_9 st_9
st_8 st_8
rb_4 rb_4
rb_3 rb_3
dw_tipin dw_tipin
rb_2 rb_2
rb_1 rb_1
dw_lug dw_lug
em_2 em_2
em_1 em_1
gb_4 gb_4
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_5 gb_5
end type
global w_lista_facturas w_lista_facturas

type variables
datawindowchild idw_contrato,idw_emp
end variables

forward prototypes
public subroutine filtro ()
end prototypes

public subroutine filtro ();string filtro
dw_lug.accepttext()
dw_tipin.accepttext()
dw_empresa.accepttext()
setnull(filtro)

if rb_2.checked then
	filtro="clugar ='"+dw_lug.getitemstring(1,1)+"'"
end if
if rb_4.checked then
	if isnull(filtro) then
		filtro="codtingre ='"+dw_tipin.getitemstring(1,1)+"'"
	else
		filtro+=" and codtingre ='"+dw_tipin.getitemstring(1,1)+"'"
	end if
end if
if not isnull(dw_empresa.getitemstring(1,1) ) then 
	if isnull(filtro) then
		filtro="cemp ='"+dw_empresa.getitemstring(1,1)+"'"
	else
		filtro+=" and cemp ='"+dw_empresa.getitemstring(1,1)+"'"
	end if
end if
if dw_empresa.getitemstring(1,2)<>'' then 
	filtro+=" and ccontrato ='"+dw_empresa.getitemstring(1,2)+"'"
end if
if not isnull(filtro) then
	dw_lista.setfilter(filtro)
	dw_lista.filter()
end if
st_cuantos.text=string(dw_lista.rowcount())+" registro(s)"

end subroutine

on w_lista_facturas.create
this.st_cuantos=create st_cuantos
this.st_11=create st_11
this.dw_empresa=create dw_empresa
this.pb_traer=create pb_traer
this.dw_lista=create dw_lista
this.st_9=create st_9
this.st_8=create st_8
this.rb_4=create rb_4
this.rb_3=create rb_3
this.dw_tipin=create dw_tipin
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_lug=create dw_lug
this.em_2=create em_2
this.em_1=create em_1
this.gb_4=create gb_4
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_5=create gb_5
this.Control[]={this.st_cuantos,&
this.st_11,&
this.dw_empresa,&
this.pb_traer,&
this.dw_lista,&
this.st_9,&
this.st_8,&
this.rb_4,&
this.rb_3,&
this.dw_tipin,&
this.rb_2,&
this.rb_1,&
this.dw_lug,&
this.em_2,&
this.em_1,&
this.gb_4,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_5}
end on

on w_lista_facturas.destroy
destroy(this.st_cuantos)
destroy(this.st_11)
destroy(this.dw_empresa)
destroy(this.pb_traer)
destroy(this.dw_lista)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.dw_tipin)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_lug)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.gb_4)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_5)
end on

type st_cuantos from statictext within w_lista_facturas
integer x = 315
integer y = 296
integer width = 530
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15793151
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_11 from statictext within w_lista_facturas
integer x = 73
integer y = 296
integer width = 229
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros:"
boolean focusrectangle = false
end type

type dw_empresa from datawindow within w_lista_facturas
integer x = 3237
integer y = 72
integer width = 1609
integer height = 284
integer taborder = 130
string title = "none"
string dataobject = "dw_empresa_contrato"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
choose case getcolumn()
	case 1
		idw_contrato.retrieve(data)
		setitem(1,2,"")
end choose
filtro()
end event

event constructor;settransobject(sqlca)
getchild("codcontrato",idw_contrato)
idw_contrato.settransobject(sqlca)
getchild('codemp',idw_emp)
idw_emp.settransobject(sqlca)
idw_emp.retrieve('%')
insertrow(1)

end event

type pb_traer from picturebutton within w_lista_facturas
integer x = 997
integer y = 68
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
string picturename = "refrescar.GIF"
string disabledname = "refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Traer Registros [Alt+T]"
end type

event clicked;dw_lista.retrieve(datetime(em_1.text),datetime(em_2.text))
st_cuantos.text=string(dw_lista.rowcount())+" registro(s)"
end event

type dw_lista from datawindow within w_lista_facturas
integer x = 37
integer y = 436
integer width = 4846
integer height = 1296
integer taborder = 150
string title = "none"
string dataobject = "dw_factura_lista"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

type st_9 from statictext within w_lista_facturas
integer x = 539
integer y = 164
integer width = 105
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin"
boolean focusrectangle = false
end type

type st_8 from statictext within w_lista_facturas
integer x = 114
integer y = 164
integer width = 123
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio"
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_lista_facturas
integer x = 1719
integer y = 256
integer width = 265
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solo el:"
end type

type rb_3 from radiobutton within w_lista_facturas
integer x = 1408
integer y = 256
integer width = 265
integer height = 80
integer taborder = 100
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

event clicked;filtro()
end event

type dw_tipin from datawindow within w_lista_facturas
integer x = 1989
integer y = 264
integer width = 1143
integer height = 80
integer taborder = 120
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event itemchanged;rb_4.checked=true
accepttext()
filtro()
end event

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,'')
end event

type rb_2 from radiobutton within w_lista_facturas
integer x = 1723
integer y = 116
integer width = 265
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solo el:"
end type

type rb_1 from radiobutton within w_lista_facturas
integer x = 1408
integer y = 116
integer width = 261
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;filtro()
end event

type dw_lug from datawindow within w_lista_facturas
integer x = 1993
integer y = 116
integer width = 1143
integer height = 80
integer taborder = 90
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,'')
end event

event itemchanged;rb_2.checked=true
filtro()
end event

type em_2 from editmask within w_lista_facturas
integer x = 535
integer y = 84
integer width = 389
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "01/01/2000~~31/12/2020"
end type

event constructor;if isdate("31/"+string(today(),"mm/yyyy")) then
	text="31/"+string(today(),"mm/yyyy")
else
	if isdate("30/"+string(today(),"mm/yyyy")) then
		text="30/"+string(today(),"mm/yyyy")
	else
		if isdate("29/"+string(today(),"mm/yyyy")) then
			text="29/"+string(today(),"mm/yyyy")
		else
			text="28/"+string(today(),"mm/yyyy")
		end if
	end if
end if

end event

type em_1 from editmask within w_lista_facturas
integer x = 110
integer y = 84
integer width = 384
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "01/01/2000~~31/12/2020"
end type

event constructor;text="01/"+string(today(),"mm/yyyy")
end event

type gb_4 from groupbox within w_lista_facturas
integer x = 1362
integer y = 212
integer width = 1792
integer height = 132
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Servicio"
end type

type gb_1 from groupbox within w_lista_facturas
integer x = 1362
integer y = 72
integer width = 1797
integer height = 136
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugares"
end type

type gb_2 from groupbox within w_lista_facturas
integer x = 1303
integer y = 4
integer width = 3589
integer height = 388
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtros"
borderstyle borderstyle = styleraised!
end type

type gb_3 from groupbox within w_lista_facturas
integer x = 32
integer y = 16
integer width = 1248
integer height = 224
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por Fechas:"
end type

type gb_5 from groupbox within w_lista_facturas
integer x = 3122
integer y = 96
integer width = 411
integer height = 324
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

