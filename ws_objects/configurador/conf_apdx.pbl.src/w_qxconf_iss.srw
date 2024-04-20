$PBExportHeader$w_qxconf_iss.srw
forward
global type w_qxconf_iss from window
end type
type pb_5 from picturebutton within w_qxconf_iss
end type
type pb_4 from picturebutton within w_qxconf_iss
end type
type pb_2 from picturebutton within w_qxconf_iss
end type
type pb_1 from picturebutton within w_qxconf_iss
end type
type pb_3 from picturebutton within w_qxconf_iss
end type
type dw_qxdet from datawindow within w_qxconf_iss
end type
type sle_1 from singlelineedit within w_qxconf_iss
end type
type st_3 from statictext within w_qxconf_iss
end type
type st_2 from statictext within w_qxconf_iss
end type
type dw_servicios from datawindow within w_qxconf_iss
end type
type st_1 from statictext within w_qxconf_iss
end type
type dw_manual from datawindow within w_qxconf_iss
end type
end forward

global type w_qxconf_iss from window
integer width = 3657
integer height = 2060
boolean titlebar = true
string title = "Configuración de Procedimientos Quirúrgicos de UVR"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Project!"
pb_5 pb_5
pb_4 pb_4
pb_2 pb_2
pb_1 pb_1
pb_3 pb_3
dw_qxdet dw_qxdet
sle_1 sle_1
st_3 st_3
st_2 st_2
dw_servicios dw_servicios
st_1 st_1
dw_manual dw_manual
end type
global w_qxconf_iss w_qxconf_iss

type variables
string tserv,tipo_col,anterior,orden,manual
long puntos
end variables

on w_qxconf_iss.create
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_2=create pb_2
this.pb_1=create pb_1
this.pb_3=create pb_3
this.dw_qxdet=create dw_qxdet
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_servicios=create dw_servicios
this.st_1=create st_1
this.dw_manual=create dw_manual
this.Control[]={this.pb_5,&
this.pb_4,&
this.pb_2,&
this.pb_1,&
this.pb_3,&
this.dw_qxdet,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.dw_servicios,&
this.st_1,&
this.dw_manual}
end on

on w_qxconf_iss.destroy
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.pb_3)
destroy(this.dw_qxdet)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_servicios)
destroy(this.st_1)
destroy(this.dw_manual)
end on

type pb_5 from picturebutton within w_qxconf_iss
string tag = "Borrar"
integer x = 2514
integer y = 1408
integer width = 146
integer height = 128
integer taborder = 80
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

event clicked;dw_qxdet.deleterow(0)
end event

type pb_4 from picturebutton within w_qxconf_iss
string tag = "Insertar"
integer x = 2514
integer y = 1268
integer width = 146
integer height = 128
integer taborder = 70
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

event clicked;open(w_trae_qxdet_uvr)
end event

type pb_2 from picturebutton within w_qxconf_iss
string tag = "Borrar"
integer x = 3255
integer y = 280
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
end type

event clicked;dw_servicios.deleterow(0)
if dw_servicios.update()=-1 then
	rollback;
	dw_manual.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_1 from picturebutton within w_qxconf_iss
string tag = "Insertar"
integer x = 3086
integer y = 280
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;open(w_busca_qx_uvr)
end event

type pb_3 from picturebutton within w_qxconf_iss
string tag = "Guardar"
integer x = 2062
integer y = 124
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
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_servicios.update()=-1 then
	rollback;
	dw_manual.triggerevent(rowfocuschanged!)
else
	if dw_qxdet.update()=-1 then
		rollback;
		dw_manual.triggerevent(rowfocuschanged!)
	else
		commit;
	end if
end if
end event

type dw_qxdet from datawindow within w_qxconf_iss
integer x = 82
integer y = 1264
integer width = 2391
integer height = 596
integer taborder = 50
string title = "none"
string dataobject = "dw_qxdet_uvr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type sle_1 from singlelineedit within w_qxconf_iss
integer x = 1367
integer y = 224
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

type st_3 from statictext within w_qxconf_iss
integer x = 1367
integer y = 136
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

type st_2 from statictext within w_qxconf_iss
integer x = 1102
integer y = 136
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

type dw_servicios from datawindow within w_qxconf_iss
integer x = 32
integer y = 432
integer width = 3538
integer height = 748
integer taborder = 20
string title = "none"
string dataobject = "dw_qxconf_uvr"
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
puntos=this.getitemnumber(this.getrow(),"puntos")
dw_qxdet.retrieve(manual,this.getitemstring(this.getrow(),"proced"))

end event

event rowfocuschanging;this.selectrow(currentrow,false)
end event

type st_1 from statictext within w_qxconf_iss
integer x = 59
integer y = 32
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

type dw_manual from datawindow within w_qxconf_iss
integer x = 46
integer y = 100
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
manual=this.getitemstring(this.getrow(),"codmanual")
dw_servicios.reset()
dw_qxdet.reset()
dw_servicios.retrieve(manual)


end event

