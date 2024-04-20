$PBExportHeader$w_proc_especialidad.srw
forward
global type w_proc_especialidad from window
end type
type st_1 from statictext within w_proc_especialidad
end type
type pb_3 from picturebutton within w_proc_especialidad
end type
type pb_2 from picturebutton within w_proc_especialidad
end type
type pb_1 from picturebutton within w_proc_especialidad
end type
type dw_2 from datawindow within w_proc_especialidad
end type
type dw_1 from datawindow within w_proc_especialidad
end type
end forward

global type w_proc_especialidad from window
string tag = "Procedimientos por Especialidad"
integer width = 3081
integer height = 1316
boolean titlebar = true
string title = "Procedimientos por Especialidad"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
st_1 st_1
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
dw_1 dw_1
end type
global w_proc_especialidad w_proc_especialidad

type variables
datawindowchild dw_grupo
end variables

on w_proc_especialidad.create
this.st_1=create st_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_2,&
this.dw_1}
end on

on w_proc_especialidad.destroy
destroy(this.st_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;dw_1.getchild("codesp",dw_grupo)
dw_grupo.settransobject(sqlca)
dw_grupo.retrieve()
dw_1.settransobject(SQLCA)
dw_2.settransobject(SQLCA)
dw_1.insertrow(1)
end event

type st_1 from statictext within w_proc_especialidad
integer x = 41
integer y = 112
integer width = 567
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Especialidades"
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_proc_especialidad
string tag = "&Guardar"
integer x = 2496
integer y = 24
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

event clicked;if dw_2.update()=-1 then
	rollback;
	dw_1.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_2 from picturebutton within w_proc_especialidad
string tag = "&Borrar"
integer x = 2318
integer y = 24
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

event clicked;dw_2.deleterow(0)
end event

type pb_1 from picturebutton within w_proc_especialidad
string tag = "&Agregar Procedimientos"
integer x = 2139
integer y = 24
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
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;open(w_busca_proc)

end event

type dw_2 from datawindow within w_proc_especialidad
integer x = 9
integer y = 176
integer width = 2990
integer height = 944
integer taborder = 20
string title = "none"
string dataobject = "dw_cups_especialidad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_proc_especialidad
integer x = 37
integer y = 28
integer width = 1362
integer height = 88
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_espe"
boolean border = false
end type

event itemchanged;this.accepttext()
dw_2.retrieve(this.getitemstring(1,1))


end event

