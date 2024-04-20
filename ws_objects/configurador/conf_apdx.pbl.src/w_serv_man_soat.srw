$PBExportHeader$w_serv_man_soat.srw
forward
global type w_serv_man_soat from window
end type
type rb_5 from radiobutton within w_serv_man_soat
end type
type pb_1 from picturebutton within w_serv_man_soat
end type
type pb_2 from picturebutton within w_serv_man_soat
end type
type pb_3 from picturebutton within w_serv_man_soat
end type
type sle_1 from singlelineedit within w_serv_man_soat
end type
type st_3 from statictext within w_serv_man_soat
end type
type st_2 from statictext within w_serv_man_soat
end type
type dw_servicios from datawindow within w_serv_man_soat
end type
type rb_4 from radiobutton within w_serv_man_soat
end type
type rb_3 from radiobutton within w_serv_man_soat
end type
type rb_2 from radiobutton within w_serv_man_soat
end type
type rb_1 from radiobutton within w_serv_man_soat
end type
type st_1 from statictext within w_serv_man_soat
end type
type dw_manual from datawindow within w_serv_man_soat
end type
type gb_1 from groupbox within w_serv_man_soat
end type
end forward

global type w_serv_man_soat from window
integer width = 5065
integer height = 2240
boolean titlebar = true
string title = "Servicios de manual de Grupos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_servicio.ico"
rb_5 rb_5
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
sle_1 sle_1
st_3 st_3
st_2 st_2
dw_servicios dw_servicios
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
st_1 st_1
dw_manual dw_manual
gb_1 gb_1
end type
global w_serv_man_soat w_serv_man_soat

type variables
string tserv,tipo_col,anterior,orden
end variables

on w_serv_man_soat.create
this.rb_5=create rb_5
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_servicios=create dw_servicios
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_1=create st_1
this.dw_manual=create dw_manual
this.gb_1=create gb_1
this.Control[]={this.rb_5,&
this.pb_1,&
this.pb_2,&
this.pb_3,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.dw_servicios,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.st_1,&
this.dw_manual,&
this.gb_1}
end on

on w_serv_man_soat.destroy
destroy(this.rb_5)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_servicios)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_1)
destroy(this.dw_manual)
destroy(this.gb_1)
end on

type rb_5 from radiobutton within w_serv_man_soat
integer x = 2830
integer y = 156
integer width = 494
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "General Especial"
boolean checked = true
end type

event clicked;dw_servicios.setfilter("tiposervicio='E'")
dw_servicios.filter()
tserv='E'
end event

type pb_1 from picturebutton within w_serv_man_soat
string tag = "Insertar"
integer x = 2199
integer y = 1996
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
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;LONG DONDE
donde=dw_servicios.insertrow(0)
dw_servicios.setitem(donde,"codmanual",dw_manual.getitemstring(dw_manual.getrow(),"codmanual"))
dw_servicios.setitem(donde,"tiposervicio",tserv)
dw_servicios.scrolltorow(donde)
end event

type pb_2 from picturebutton within w_serv_man_soat
string tag = "Borrar"
integer x = 2382
integer y = 1996
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

type pb_3 from picturebutton within w_serv_man_soat
string tag = "Guardar"
integer x = 2565
integer y = 1996
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

type sle_1 from singlelineedit within w_serv_man_soat
integer x = 2139
integer y = 328
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

type st_3 from statictext within w_serv_man_soat
integer x = 1344
integer y = 332
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

type st_2 from statictext within w_serv_man_soat
integer x = 1042
integer y = 340
integer width = 270
integer height = 56
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

type dw_servicios from datawindow within w_serv_man_soat
integer x = 14
integer y = 428
integer width = 4965
integer height = 1548
integer taborder = 20
string title = "none"
string dataobject = "dw_serviciosman_grupo"
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

type rb_4 from radiobutton within w_serv_man_soat
integer x = 2258
integer y = 156
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Derechos de Grupo"
end type

event clicked;dw_servicios.setfilter("tiposervicio='D'")
dw_servicios.filter()
tserv='D'
end event

type rb_3 from radiobutton within w_serv_man_soat
integer x = 1742
integer y = 156
integer width = 489
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo Quirúrgico"
end type

event clicked;dw_servicios.setfilter("tiposervicio='Q'")
dw_servicios.filter()
tserv='Q'
end event

type rb_2 from radiobutton within w_serv_man_soat
integer x = 1385
integer y = 156
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
end type

event clicked;dw_servicios.setfilter("tiposervicio='P'")
dw_servicios.filter()
tserv='P'
end event

type rb_1 from radiobutton within w_serv_man_soat
integer x = 1074
integer y = 156
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
string text = "General"
boolean checked = true
end type

event clicked;dw_servicios.setfilter("tiposervicio='G'")
dw_servicios.filter()
tserv='G'
end event

type st_1 from statictext within w_serv_man_soat
integer x = 41
integer y = 28
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

type dw_manual from datawindow within w_serv_man_soat
integer x = 27
integer y = 96
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
this.retrieve('1')
this.triggerevent(rowfocuschanged!)
end event

event rowfocuschanged;if this.getrow()<1 then return
dw_servicios.retrieve(this.getitemstring(this.getrow(),"codmanual"))
rb_1.checked=true
rb_1.triggerevent(clicked!)
end event

type gb_1 from groupbox within w_serv_man_soat
integer x = 1033
integer y = 84
integer width = 2363
integer height = 192
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

