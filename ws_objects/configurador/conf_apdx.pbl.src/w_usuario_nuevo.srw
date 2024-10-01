$PBExportHeader$w_usuario_nuevo.srw
forward
global type w_usuario_nuevo from window
end type
type pb_2 from picturebutton within w_usuario_nuevo
end type
type pb_1 from picturebutton within w_usuario_nuevo
end type
type st_2 from statictext within w_usuario_nuevo
end type
type st_1 from statictext within w_usuario_nuevo
end type
type dw_1 from datawindow within w_usuario_nuevo
end type
end forward

global type w_usuario_nuevo from window
integer width = 5189
integer height = 768
boolean titlebar = true
string title = "Nuevo Usuario"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
boolean center = true
pb_2 pb_2
pb_1 pb_1
st_2 st_2
st_1 st_1
dw_1 dw_1
end type
global w_usuario_nuevo w_usuario_nuevo

on w_usuario_nuevo.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.dw_1}
end on

on w_usuario_nuevo.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(SQLCA)


end event

type pb_2 from picturebutton within w_usuario_nuevo
string tag = "Salir"
integer x = 2373
integer y = 524
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cerrar Ventana"
end type

event clicked;int filas
filas=w_administra_usuario.dw_1.getrow()
w_administra_usuario.dw_1.retrieve()
w_administra_usuario.dw_1.scrolltorow(filas)
close(parent)

end event

type pb_1 from picturebutton within w_usuario_nuevo
string tag = "Guardar"
integer x = 2199
integer y = 524
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
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_1.update()<1 then
		rollback;
		dw_1.retrieve()
	else
		commit;
end if
w_administra_usuario.dw_1.retrieve()
close(parent)
end event

type st_2 from statictext within w_usuario_nuevo
integer x = 2240
integer y = 16
integer width = 1637
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Haga doble Click sobre la malla si desea cambiar o establecer una Clave"
boolean focusrectangle = false
end type

type st_1 from statictext within w_usuario_nuevo
integer x = 32
integer y = 32
integer width = 919
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "REGISTRO USUARIO"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_usuario_nuevo
integer x = 27
integer y = 132
integer width = 5061
integer height = 368
integer taborder = 10
string title = "none"
string dataobject = "dw_usuario_nuevo"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if getcolumnname()='clave' then 
	openwithparm(w_clave_usuario,'clave')
end if
	
if getcolumnname()='clave_sispro' then 
	openwithparm(w_clave_usuario,'clave_sispro')
end if
if dw_1.rowcount()>0 then
	dw_1.setitem(dw_1.getrow(),"intento",0)
	dw_1.setitem(dw_1.getrow(),"tp",1)
end if


end event

event itemchanged;int l_dias
SELECT ENTERO into :l_dias
FROM parametros_gen
WHERE (((codigo_para)=7));

dw_1.setitem(row,"fecinicio",relativedate(today(),-1))
dw_1.setitem(row,'cfecfin', RelativeDate(today(),l_dias))

end event

