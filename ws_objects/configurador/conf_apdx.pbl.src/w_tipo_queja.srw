$PBExportHeader$w_tipo_queja.srw
forward
global type w_tipo_queja from window
end type
type st_6 from statictext within w_tipo_queja
end type
type st_5 from statictext within w_tipo_queja
end type
type pb_7 from picturebutton within w_tipo_queja
end type
type pb_4 from picturebutton within w_tipo_queja
end type
type pb_3 from picturebutton within w_tipo_queja
end type
type pb_6 from picturebutton within w_tipo_queja
end type
type pb_5 from picturebutton within w_tipo_queja
end type
type pb_2 from picturebutton within w_tipo_queja
end type
type pb_1 from picturebutton within w_tipo_queja
end type
type dw_2 from datawindow within w_tipo_queja
end type
type dw_3 from datawindow within w_tipo_queja
end type
type dw_1 from datawindow within w_tipo_queja
end type
end forward

global type w_tipo_queja from window
integer width = 2779
integer height = 1808
boolean titlebar = true
string title = "Configuracion Tipo de Queja"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Form!"
st_6 st_6
st_5 st_5
pb_7 pb_7
pb_4 pb_4
pb_3 pb_3
pb_6 pb_6
pb_5 pb_5
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
dw_3 dw_3
dw_1 dw_1
end type
global w_tipo_queja w_tipo_queja

type variables
string tipo_col,anterior,orden

end variables

on w_tipo_queja.create
this.st_6=create st_6
this.st_5=create st_5
this.pb_7=create pb_7
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_3=create dw_3
this.dw_1=create dw_1
this.Control[]={this.st_6,&
this.st_5,&
this.pb_7,&
this.pb_4,&
this.pb_3,&
this.pb_6,&
this.pb_5,&
this.pb_2,&
this.pb_1,&
this.dw_2,&
this.dw_3,&
this.dw_1}
end on

on w_tipo_queja.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.pb_7)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.dw_1)
end on

event resize;dw_3.resize(newwidth - 50 , newheight -630)
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

type st_6 from statictext within w_tipo_queja
integer x = 50
integer y = 112
integer width = 375
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Servicio"
boolean focusrectangle = false
end type

type st_5 from statictext within w_tipo_queja
integer x = 46
integer y = 20
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clase Queja"
boolean focusrectangle = false
end type

type pb_7 from picturebutton within w_tipo_queja
boolean visible = false
integer x = 1943
integer y = 1528
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
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_4 from picturebutton within w_tipo_queja
string tag = "Guardar"
integer x = 1390
integer y = 1528
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
end type

event clicked;if dw_3.update(true,false)<1 then
	rollback;
else
	dw_3.resetupdate()
	commit;
end if
end event

type pb_3 from picturebutton within w_tipo_queja
string tag = "Refrescar"
integer x = 1207
integer y = 1528
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
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
end type

event clicked;dw_2.triggerevent(itemchanged!)
end event

type pb_6 from picturebutton within w_tipo_queja
string tag = "Importar"
integer x = 1778
integer y = 1528
integer width = 146
integer height = 128
integer taborder = 50
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

type pb_5 from picturebutton within w_tipo_queja
string tag = "Exportar"
integer x = 1582
integer y = 1528
integer width = 146
integer height = 128
integer taborder = 50
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

type pb_2 from picturebutton within w_tipo_queja
string tag = "Borrar"
integer x = 1042
integer y = 1528
integer width = 146
integer height = 128
integer taborder = 50
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
fila=dw_3.getrow()
if fila<1 then return
if dw_3.dataobject="dw_camas" then
	if not isnull(dw_3.getitemstring(fila,"documento")) then
		messagebox("Atención","Esta cama se encuentra ocupada, no se puede borrar")
		return
	end if
end if
dw_3.deleterow(0)
end event

type pb_1 from picturebutton within w_tipo_queja
string tag = "Insertar"
integer x = 846
integer y = 1528
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;long donde
donde=dw_3.insertrow(0)
dw_3.scrolltorow(donde)
dw_3.setitem(donde,4,dw_1.getitemstring(1,1))
dw_3.setitem(donde,5,dw_2.getitemstring(1,1))

end event

type dw_2 from datawindow within w_tipo_queja
integer x = 430
integer y = 112
integer width = 1554
integer height = 76
integer taborder = 20
string title = "none"
string dataobject = "dw_que_ser_drop"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
dw_3.retrieve(dw_1.getitemstring(1,1),dw_2.getitemstring(1,1))

end event

event constructor;settransobject(sqlca)
insertrow(1)

end event

type dw_3 from datawindow within w_tipo_queja
event teclea pbm_dwnkey
integer x = 9
integer y = 288
integer width = 2624
integer height = 1216
integer taborder = 20
string title = "none"
string dataobject = "dw_queja_servicio"
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

type dw_1 from datawindow within w_tipo_queja
integer x = 425
integer y = 20
integer width = 987
integer height = 60
integer taborder = 10
string title = "none"
string dataobject = "dw_pm_tipo_queja_drop"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
dw_3.retrieve(dw_1.getitemstring(1,1),dw_2.getitemstring(1,1))
end event

event constructor;settransobject(sqlca)
insertrow(1)

end event

