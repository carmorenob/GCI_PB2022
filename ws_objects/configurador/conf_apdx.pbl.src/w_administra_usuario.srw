$PBExportHeader$w_administra_usuario.srw
forward
global type w_administra_usuario from window
end type
type pb_6 from picturebutton within w_administra_usuario
end type
type pb_biometria from picturebutton within w_administra_usuario
end type
type pb_5 from picturebutton within w_administra_usuario
end type
type pb_3 from picturebutton within w_administra_usuario
end type
type st_4 from statictext within w_administra_usuario
end type
type st_3 from statictext within w_administra_usuario
end type
type st_2 from statictext within w_administra_usuario
end type
type pb_4 from picturebutton within w_administra_usuario
end type
type mle_1 from multilineedit within w_administra_usuario
end type
type st_1 from statictext within w_administra_usuario
end type
type dw_3 from datawindow within w_administra_usuario
end type
type dw_2 from datawindow within w_administra_usuario
end type
type pb_2 from picturebutton within w_administra_usuario
end type
type pb_1 from picturebutton within w_administra_usuario
end type
type dw_1 from datawindow within w_administra_usuario
end type
type gb_1 from groupbox within w_administra_usuario
end type
type gb_2 from groupbox within w_administra_usuario
end type
end forward

global type w_administra_usuario from window
integer width = 5271
integer height = 1788
boolean titlebar = true
string title = "Administracion de usuarios"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
pb_6 pb_6
pb_biometria pb_biometria
pb_5 pb_5
pb_3 pb_3
st_4 st_4
st_3 st_3
st_2 st_2
pb_4 pb_4
mle_1 mle_1
st_1 st_1
dw_3 dw_3
dw_2 dw_2
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_administra_usuario w_administra_usuario

type variables
string i_usuario
end variables

on w_administra_usuario.create
this.pb_6=create pb_6
this.pb_biometria=create pb_biometria
this.pb_5=create pb_5
this.pb_3=create pb_3
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.pb_4=create pb_4
this.mle_1=create mle_1
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.pb_6,&
this.pb_biometria,&
this.pb_5,&
this.pb_3,&
this.st_4,&
this.st_3,&
this.st_2,&
this.pb_4,&
this.mle_1,&
this.st_1,&
this.dw_3,&
this.dw_2,&
this.pb_2,&
this.pb_1,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_administra_usuario.destroy
destroy(this.pb_6)
destroy(this.pb_biometria)
destroy(this.pb_5)
destroy(this.pb_3)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_4)
destroy(this.mle_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;dw_1.retrieve()
end event

type pb_6 from picturebutton within w_administra_usuario
integer x = 5083
integer y = 672
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
string picturename = "elimi_pac.gif"
alignment htextalign = left!
string powertiptext = "Unifica Usuarios"
end type

event clicked;st_usuarios l_prof 
l_prof.usuario=dw_1.getitemstring(dw_1.getrow(), 'usuario') 
l_prof.destino='profe'
l_prof.clave= dw_1.getitemstring(dw_1.getrow(), 'nombre') 
open(w_borra_usu_rep)

end event

type pb_biometria from picturebutton within w_administra_usuario
integer x = 5079
integer y = 388
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = " "
boolean originalsize = true
string picturename = "huella_digital.gif"
string disabledname = "d_huella_digital.gif"
alignment htextalign = left!
string powertiptext = "Ingreso a Biometría"
end type

event clicked;If dw_1.getitemstring(dw_1.getrow(), 'estado') <>'2' then
	st_usuarios l_prof 
	l_prof.usuario=dw_1.getitemstring(dw_1.getrow(), 'usuario') 
	l_prof.destino='profe'
	l_prof.clave= dw_1.getitemstring(dw_1.getrow(), 'nombre') 
	openwithparm(w_biometria_usuarios,l_prof)
End If
end event

event constructor;if g_biometria='1' then
	pb_biometria.enabled=true
else
	pb_biometria.enabled=false
end if
end event

type pb_5 from picturebutton within w_administra_usuario
integer x = 2496
integer y = 1256
integer width = 119
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<"
boolean originalsize = true
vtextalign vtextalign = vcenter!
string powertiptext = "Agregarle Grupo al Usuario"
end type

event clicked;if dw_2.rowcount()=0 then return
dw_3.insertrow(1)
long fila
fila=dw_2.getrow()
dw_3.setitem(1,'codgrupo',dw_2.getitemstring(fila,'codgrupo'))
dw_3.setitem(1,'descripcion',dw_2.getitemstring(fila,'descripcion'))
dw_3.setitem(1,'usuario',i_usuario)
dw_2.deleterow(fila)
end event

type pb_3 from picturebutton within w_administra_usuario
integer x = 2496
integer y = 1152
integer width = 119
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">"
boolean originalsize = true
vtextalign vtextalign = vcenter!
string powertiptext = "Retirar Usuario del Grupo"
end type

event clicked;if dw_3.rowcount()=0 then return
dw_2.insertrow(1)
long fila
fila=dw_3.getrow()
dw_2.setitem(1,'codgrupo',dw_3.getitemstring(fila,'codgrupo'))
dw_2.setitem(1,'descripcion',dw_3.getitemstring(fila,'descripcion'))
dw_3.deleterow(fila)
end event

type st_4 from statictext within w_administra_usuario
integer x = 69
integer y = 1072
integer width = 974
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "De doble Click para desasignar permiso"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_administra_usuario
integer x = 2715
integer y = 1072
integer width = 1147
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "De doble Click en un grupo para asignar permiso"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_administra_usuario
integer x = 50
integer y = 28
integer width = 5010
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = " Haga doble Click sobre el usuario que desea modificar o de insertar para uno nuevo (Click Derecho para filtrar)"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_administra_usuario
integer x = 5079
integer y = 528
integer width = 146
integer height = 128
integer taborder = 70
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

event clicked;close(parent)
end event

type mle_1 from multilineedit within w_administra_usuario
integer x = 398
integer y = 896
integer width = 4663
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_administra_usuario
integer x = 41
integer y = 900
integer width = 338
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Permisos para"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_administra_usuario
integer x = 69
integer y = 1148
integer width = 2281
integer height = 464
integer taborder = 40
string title = "none"
string dataobject = "dw_usugrupo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;pb_3.triggerevent(clicked!)
end event

event constructor;this.settransobject(sqlca)
end event

type dw_2 from datawindow within w_administra_usuario
integer x = 2711
integer y = 1144
integer width = 2281
integer height = 464
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_seggrupo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;pb_5.triggerevent(clicked!)
end event

event constructor;this.settransobject(sqlca)
end event

type pb_2 from picturebutton within w_administra_usuario
integer x = 5079
integer y = 248
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Usuario y Grupos"
end type

event clicked;if dw_1.update()<1 then
	rollback;
	return
end if
if dw_3.update()<1 then
	rollback;
	return
end if
commit;
end event

type pb_1 from picturebutton within w_administra_usuario
integer x = 5079
integer y = 108
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Insertar Nuevo Usuario"
end type

event clicked;open(w_usuario_nuevo)
w_usuario_nuevo.dw_1.insertrow(0)
w_usuario_nuevo.dw_1.scrolltorow(dw_1.rowcount())

end event

type dw_1 from datawindow within w_administra_usuario
integer x = 46
integer y = 112
integer width = 5015
integer height = 744
integer taborder = 10
string title = "none"
string dataobject = "dw_usuario"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow()<1 then return
i_usuario=this.getitemstring(this.getrow(),1)
mle_1.text=this.getitemstring(dw_1.getrow(),2)+" ( "+i_usuario+" ) "
dw_3.retrieve(i_usuario)
dw_2.retrieve(i_usuario)

end event

event doubleclicked;if this.getrow()<1 then return

open(w_usuario_nuevo)
w_usuario_nuevo.dw_1.retrieve(this.getitemstring(row,"usuario"))

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event constructor;this.settransobject(sqlca)
end event

type gb_1 from groupbox within w_administra_usuario
integer x = 2683
integer y = 1016
integer width = 2373
integer height = 620
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resto de Grupos (El Usuario no está en estos grupos)"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_administra_usuario
integer x = 41
integer y = 1016
integer width = 2373
integer height = 620
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Permiso usuario (Grupos del Usuario)"
borderstyle borderstyle = styleraised!
end type

