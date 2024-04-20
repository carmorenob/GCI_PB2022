$PBExportHeader$w_liq_uvr.srw
forward
global type w_liq_uvr from window
end type
type pb_1 from picturebutton within w_liq_uvr
end type
type pb_2 from picturebutton within w_liq_uvr
end type
type pb_3 from picturebutton within w_liq_uvr
end type
type rb_1 from radiobutton within w_liq_uvr
end type
type sle_1 from singlelineedit within w_liq_uvr
end type
type st_3 from statictext within w_liq_uvr
end type
type st_2 from statictext within w_liq_uvr
end type
type dw_servicios from datawindow within w_liq_uvr
end type
type rb_3 from radiobutton within w_liq_uvr
end type
type rb_2 from radiobutton within w_liq_uvr
end type
type st_1 from statictext within w_liq_uvr
end type
type dw_manual from datawindow within w_liq_uvr
end type
type gb_1 from groupbox within w_liq_uvr
end type
end forward

global type w_liq_uvr from window
integer width = 7077
integer height = 1832
boolean titlebar = true
string title = "Procedimientos quirúrgicos por UVR"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
rb_1 rb_1
sle_1 sle_1
st_3 st_3
st_2 st_2
dw_servicios dw_servicios
rb_3 rb_3
rb_2 rb_2
st_1 st_1
dw_manual dw_manual
gb_1 gb_1
end type
global w_liq_uvr w_liq_uvr

type variables
string tserv,tipo_col,anterior,orden
end variables

on w_liq_uvr.create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.rb_1=create rb_1
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_servicios=create dw_servicios
this.rb_3=create rb_3
this.rb_2=create rb_2
this.st_1=create st_1
this.dw_manual=create dw_manual
this.gb_1=create gb_1
this.Control[]={this.pb_1,&
this.pb_2,&
this.pb_3,&
this.rb_1,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.dw_servicios,&
this.rb_3,&
this.rb_2,&
this.st_1,&
this.dw_manual,&
this.gb_1}
end on

on w_liq_uvr.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.rb_1)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_servicios)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.st_1)
destroy(this.dw_manual)
destroy(this.gb_1)
end on

type pb_1 from picturebutton within w_liq_uvr
string tag = "Insertar"
integer x = 2501
integer y = 1580
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;LONG donde
open(w_busca_serv_d)

end event

type pb_2 from picturebutton within w_liq_uvr
string tag = "Borrar"
integer x = 2693
integer y = 1584
integer width = 151
integer height = 132
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_servicios.deleterow(0)
if dw_servicios.update()=-1 then
	rollback;
	dw_manual.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_3 from picturebutton within w_liq_uvr
string tag = "Guardar"
integer x = 2885
integer y = 1580
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_servicios.update()=-1 then
	rollback;
	dw_manual.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type rb_1 from radiobutton within w_liq_uvr
integer x = 2103
integer y = 92
integer width = 571
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Multiplica por cantidad"
end type

event clicked;tserv='M'
dw_servicios.setfilter("tiposervicio='M'")
dw_servicios.filter()
end event

type sle_1 from singlelineedit within w_liq_uvr
integer x = 1344
integer y = 288
integer width = 667
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;if trim(this.text)="" then return
if st_3.text="" then return
long donde
choose case mid(tipo_col,1,4)
	case "char"
		donde=dw_servicios.find("lower("+st_3.text+") like '"+lower(this.text)+"'",1,dw_servicios.rowcount())
	case "numb"
		if not isnumber(this.text) then
			messagebox("Error","El campo por el que va a buscar es numérico y no acepta caracteres especiales")
			return
		else
			donde=dw_servicios.find(st_3.text+"="+this.text,1,dw_servicios.rowcount())
		end if
	case "date"
end choose
if donde=0 then
	messagebox("Atención","No se encontró la cadena de caracteres buscada")
else
	dw_servicios.scrolltorow(donde)
end if
end event

type st_3 from statictext within w_liq_uvr
integer x = 1344
integer y = 208
integer width = 663
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_liq_uvr
integer x = 1147
integer y = 196
integer width = 178
integer height = 128
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por:"
boolean focusrectangle = false
end type

type dw_servicios from datawindow within w_liq_uvr
integer x = 41
integer y = 424
integer width = 6944
integer height = 1124
integer taborder = 20
string title = "none"
string dataobject = "dw_liq_uvr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event clicked;if dwo.type <> "text" then 
	if dwo.type="column" then
		tipo_col=this.describe(dwo.name+".coltype")
		st_3.text=dwo.name
	end if
	return
end if
string cual,ojo,ss
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior=cual then
	if orden="A" then
		orden="D"
	else
		orden="A"
	end if
else
	orden="A"
end if
this.setsort(cual+" "+orden)
this.sort()
anterior=cual
end event

event rowfocuschanged;if this.getrow()<1 then return
this.selectrow(this.getrow(),true)
end event

event rowfocuschanging;this.selectrow(currentrow,false)
end event

type rb_3 from radiobutton within w_liq_uvr
integer x = 1490
integer y = 92
integer width = 549
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por intervalo de UVR"
end type

event clicked;tserv='I'
dw_servicios.setfilter("tiposervicio='I'")
dw_servicios.filter()
end event

type rb_2 from radiobutton within w_liq_uvr
integer x = 1184
integer y = 92
integer width = 279
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Paquete"
boolean checked = true
end type

event clicked;tserv='P'
dw_servicios.setfilter("tiposervicio='P'")
dw_servicios.filter()
end event

type st_1 from statictext within w_liq_uvr
integer x = 41
integer y = 24
integer width = 238
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Manual"
boolean focusrectangle = false
end type

type dw_manual from datawindow within w_liq_uvr
integer x = 37
integer y = 92
integer width = 965
integer height = 276
integer taborder = 10
string title = "none"
string dataobject = "dw_manual_tliq"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve('2')
this.triggerevent(rowfocuschanged!)
end event

event rowfocuschanged;if this.getrow()<1 then return
dw_servicios.retrieve(this.getitemstring(this.getrow(),"codmanual"))
rb_2.checked=true
rb_2.triggerevent(clicked!)
end event

type gb_1 from groupbox within w_liq_uvr
integer x = 1147
integer y = 24
integer width = 1554
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo de Servicio"
end type

