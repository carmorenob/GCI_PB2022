$PBExportHeader$w_microter.srw
forward
global type w_microter from window
end type
type dw_3 from datawindow within w_microter
end type
type pb_7 from picturebutton within w_microter
end type
type pb_4 from picturebutton within w_microter
end type
type pb_3 from picturebutton within w_microter
end type
type pb_6 from picturebutton within w_microter
end type
type pb_5 from picturebutton within w_microter
end type
type pb_2 from picturebutton within w_microter
end type
type pb_1 from picturebutton within w_microter
end type
type st_1 from statictext within w_microter
end type
type st_4 from statictext within w_microter
end type
type sle_1 from singlelineedit within w_microter
end type
type st_3 from statictext within w_microter
end type
type st_2 from statictext within w_microter
end type
type dw_2 from datawindow within w_microter
end type
type dw_4 from datawindow within w_microter
end type
type dw_1 from datawindow within w_microter
end type
end forward

global type w_microter from window
integer width = 3973
integer height = 1964
boolean titlebar = true
string title = "Micro Territorios"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "Form!"
dw_3 dw_3
pb_7 pb_7
pb_4 pb_4
pb_3 pb_3
pb_6 pb_6
pb_5 pb_5
pb_2 pb_2
pb_1 pb_1
st_1 st_1
st_4 st_4
sle_1 sle_1
st_3 st_3
st_2 st_2
dw_2 dw_2
dw_4 dw_4
dw_1 dw_1
end type
global w_microter w_microter

type variables
datawindowchild hija,hija1
string tipo_col,anterior,orden
end variables

on w_microter.create
this.dw_3=create dw_3
this.pb_7=create pb_7
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.st_4=create st_4
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_2=create dw_2
this.dw_4=create dw_4
this.dw_1=create dw_1
this.Control[]={this.dw_3,&
this.pb_7,&
this.pb_4,&
this.pb_3,&
this.pb_6,&
this.pb_5,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.st_4,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.dw_2,&
this.dw_4,&
this.dw_1}
end on

on w_microter.destroy
destroy(this.dw_3)
destroy(this.pb_7)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.dw_4)
destroy(this.dw_1)
end on

event resize;//dw_3.resize(newwidth - 50 , newheight -630)
pb_1.x=(newwidth - 1800)/2
pb_1.y=newheight - 140
pb_2.x=(newwidth - 1800)/2 +300
pb_2.y=newheight - 140
pb_3.x=(newwidth - 1800)/2 +600
pb_3.y=newheight - 140
pb_4.x=(newwidth - 1800)/2 +900
pb_4.y=newheight - 140
pb_5.x=(newwidth - 1800)/2 +1200
pb_5.y=newheight - 140
pb_6.x=(newwidth - 1800)/2 +1500
pb_6.y=newheight - 140
pb_7.x=(newwidth - 1800)/2 +1500
pb_7.y=newheight - 140

end event

type dw_3 from datawindow within w_microter
integer y = 344
integer width = 2249
integer height = 128
integer taborder = 20
string title = "none"
string dataobject = "dw_drop_barrios"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
dw_4.retrieve(dw_1.getitemstring(1,1),dw_2.getitemstring(1,1),dw_3.getitemstring(1,1))

end event

event constructor;dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_3.getchild('codbarrio',hija1)
hija1.settransobject(sqlca)
hija1.retrieve()

end event

type pb_7 from picturebutton within w_microter
boolean visible = false
integer x = 2491
integer y = 1680
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
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_4 from picturebutton within w_microter
string tag = "Guardar"
integer x = 1938
integer y = 1680
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
end type

event clicked;if dw_4.update(true,false)<1 then
	rollback;
else
	dw_4.resetupdate()
	commit;
end if
end event

type pb_3 from picturebutton within w_microter
string tag = "Refrescar"
integer x = 1755
integer y = 1680
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
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
end type

event clicked;dw_2.triggerevent(itemchanged!)
end event

type pb_6 from picturebutton within w_microter
string tag = "Importar"
integer x = 2327
integer y = 1680
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
string picturename = "import.gif"
string disabledname = "d_import.gif"
alignment htextalign = left!
end type

event clicked;string docname, named
long value
value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
IF value = 1 THEN
	value=dw_3.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
end event

type pb_5 from picturebutton within w_microter
string tag = "Exportar"
integer x = 2130
integer y = 1680
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
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
end type

event clicked;openwithparm(w_export,dw_3)
end event

type pb_2 from picturebutton within w_microter
string tag = "Borrar"
integer x = 1591
integer y = 1680
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
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;long fila
fila=dw_4.getrow()
if fila<1 then return
dw_4.deleterow(0)
end event

type pb_1 from picturebutton within w_microter
string tag = "Insertar"
integer x = 1394
integer y = 1680
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;long donde
donde=dw_4.insertrow(0)
dw_4.scrolltorow(donde)
dw_4.setitem(donde,1,dw_1.getitemstring(1,1))
dw_4.setitem(donde,2,dw_2.getitemstring(1,1))
dw_4.setitem(donde,3,dw_3.getitemstring(1,1))
end event

type st_1 from statictext within w_microter
integer x = 2377
integer y = 372
integer width = 709
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Utilize click Contrario para Menu"
boolean focusrectangle = false
end type

type st_4 from statictext within w_microter
integer x = 2295
integer y = 160
integer width = 1595
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Puede utilizar el caracter ~'%~' como comodin siempre y cuando el campo a buscar no sea numérico"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_microter
integer x = 3250
integer y = 40
integer width = 658
integer height = 76
integer taborder = 50
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
		donde=dw_3.find("lower("+st_3.text+") like '"+lower(this.text)+"'",1,dw_3.rowcount())
	case "numb"
		if not isnumber(this.text) then
			messagebox("Error","El campo por el que va a buscar es numérico y no acepta caracteres especiales")
			return
		else
			donde=dw_3.find(st_3.text+"="+this.text,1,dw_3.rowcount())
		end if
	case "date"
end choose
if donde=0 then
	messagebox("Atención","No se encontró la cadena de caracteres buscada")
else
	dw_3.scrolltorow(donde)
end if
end event

type st_3 from statictext within w_microter
integer x = 2569
integer y = 40
integer width = 663
integer height = 68
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

type st_2 from statictext within w_microter
integer x = 2304
integer y = 48
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

type dw_2 from datawindow within w_microter
integer y = 180
integer width = 2249
integer height = 148
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_ciudad2"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
hija1.setfilter("cdepto='"+dw_1.getitemstring(1,1)+"' and cciudad='"+dw_2.getitemstring(1,1)+"'" )
hija1.filter()
end event

event constructor;dw_2.settransobject(sqlca)
dw_2.getchild('codciudad',hija)
hija.settransobject(sqlca)
dw_2.insertrow(1)

end event

type dw_4 from datawindow within w_microter
integer x = 27
integer y = 500
integer width = 3913
integer height = 1144
integer taborder = 40
string title = "none"
string dataobject = "dw_micro_territorio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event constructor;settransobject(sqlca)
end event

type dw_1 from datawindow within w_microter
integer x = 5
integer y = 24
integer width = 2254
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_depart"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
hija.setfilter("cdepto='"+dw_1.getitemstring(1,1)+"'")
hija.filter()


end event

event constructor;dw_1.settransobject(sqlca)
dw_1.insertrow(1)
end event

