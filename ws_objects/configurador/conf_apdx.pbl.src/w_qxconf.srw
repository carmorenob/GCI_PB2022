$PBExportHeader$w_qxconf.srw
forward
global type w_qxconf from window
end type
type pb_5 from picturebutton within w_qxconf
end type
type pb_4 from picturebutton within w_qxconf
end type
type pb_3 from picturebutton within w_qxconf
end type
type pb_2 from picturebutton within w_qxconf
end type
type pb_1 from picturebutton within w_qxconf
end type
type dw_qxdet from datawindow within w_qxconf
end type
type sle_1 from singlelineedit within w_qxconf
end type
type st_3 from statictext within w_qxconf
end type
type st_2 from statictext within w_qxconf
end type
type dw_servicios from datawindow within w_qxconf
end type
type st_1 from statictext within w_qxconf
end type
type dw_manual from datawindow within w_qxconf
end type
end forward

global type w_qxconf from window
integer width = 3488
integer height = 2084
boolean titlebar = true
string title = "Configuración de Procedimientos Quirúrgicos de Grupos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_configura.ico"
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_qxdet dw_qxdet
sle_1 sle_1
st_3 st_3
st_2 st_2
dw_servicios dw_servicios
st_1 st_1
dw_manual dw_manual
end type
global w_qxconf w_qxconf

type variables
string tserv,tipo_col,anterior,orden,manual,grupo
end variables

on w_qxconf.create
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_qxdet=create dw_qxdet
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_servicios=create dw_servicios
this.st_1=create st_1
this.dw_manual=create dw_manual
this.Control[]={this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_qxdet,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.dw_servicios,&
this.st_1,&
this.dw_manual}
end on

on w_qxconf.destroy
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_qxdet)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_servicios)
destroy(this.st_1)
destroy(this.dw_manual)
end on

type pb_5 from picturebutton within w_qxconf
string tag = "Eliminar"
integer x = 2459
integer y = 1500
integer width = 146
integer height = 128
integer taborder = 110
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

type pb_4 from picturebutton within w_qxconf
string tag = "Insertar"
integer x = 2459
integer y = 1360
integer width = 146
integer height = 128
integer taborder = 100
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

event clicked;open(w_trae_qxdet_grup)
end event

type pb_3 from picturebutton within w_qxconf
string tag = "Guardar"
integer x = 2048
integer y = 112
integer width = 146
integer height = 128
integer taborder = 100
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

type pb_2 from picturebutton within w_qxconf
string tag = "Eliminar"
integer x = 2752
integer y = 272
integer width = 146
integer height = 128
integer taborder = 90
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

type pb_1 from picturebutton within w_qxconf
string tag = "Insertar"
integer x = 2574
integer y = 272
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
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;open(w_busca_qx_grup)
end event

type dw_qxdet from datawindow within w_qxconf
integer x = 37
integer y = 1340
integer width = 2391
integer height = 620
integer taborder = 50
string title = "none"
string dataobject = "dw_qxdet_grup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type sle_1 from singlelineedit within w_qxconf
integer x = 1353
integer y = 212
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

type st_3 from statictext within w_qxconf
integer x = 1353
integer y = 124
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

type st_2 from statictext within w_qxconf
integer x = 1088
integer y = 124
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

type dw_servicios from datawindow within w_qxconf
integer x = 18
integer y = 416
integer width = 3351
integer height = 880
integer taborder = 20
string title = "none"
string dataobject = "dw_qxconf_grupos"
boolean hscrollbar = true
boolean vscrollbar = true
string icon = "ribon_configura.ico"
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
grupo=this.getitemstring(this.getrow(),"grupo")
dw_qxdet.retrieve(manual,this.getitemstring(this.getrow(),"proced"))

end event

event rowfocuschanging;this.selectrow(currentrow,false)
end event

type st_1 from statictext within w_qxconf
integer x = 46
integer y = 20
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

type dw_manual from datawindow within w_qxconf
integer x = 32
integer y = 88
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
manual=this.getitemstring(this.getrow(),"codmanual")
dw_servicios.reset()
dw_qxdet.reset()
dw_servicios.retrieve(manual)

end event

