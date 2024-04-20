$PBExportHeader$w_seguridad.srw
forward
global type w_seguridad from window
end type
type pb_5 from picturebutton within w_seguridad
end type
type pb_7 from picturebutton within w_seguridad
end type
type pb_4 from picturebutton within w_seguridad
end type
type pb_1 from picturebutton within w_seguridad
end type
type pb_2 from picturebutton within w_seguridad
end type
type pb_3 from picturebutton within w_seguridad
end type
type pb_8 from picturebutton within w_seguridad
end type
type st_3 from statictext within w_seguridad
end type
type ddlb_1 from dropdownlistbox within w_seguridad
end type
type st_2 from statictext within w_seguridad
end type
type st_1 from statictext within w_seguridad
end type
type dw_no_estan from datawindow within w_seguridad
end type
type dw_estan from datawindow within w_seguridad
end type
type dw_1 from datawindow within w_seguridad
end type
type gb_1 from groupbox within w_seguridad
end type
type uo_adm from uo_menus within w_seguridad
end type
type uo_asis from uo_menus within w_seguridad
end type
type uo_conf from uo_menus within w_seguridad
end type
type gb_3 from groupbox within w_seguridad
end type
type filtro from dropdownlistbox within w_seguridad
end type
type sle_1 from singlelineedit within w_seguridad
end type
type gb_4 from groupbox within w_seguridad
end type
type gb_2 from groupbox within w_seguridad
end type
end forward

global type w_seguridad from window
integer width = 4631
integer height = 2232
boolean titlebar = true
string title = "Perfiles de usuarios"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_gusuario.ico"
pb_5 pb_5
pb_7 pb_7
pb_4 pb_4
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
pb_8 pb_8
st_3 st_3
ddlb_1 ddlb_1
st_2 st_2
st_1 st_1
dw_no_estan dw_no_estan
dw_estan dw_estan
dw_1 dw_1
gb_1 gb_1
uo_adm uo_adm
uo_asis uo_asis
uo_conf uo_conf
gb_3 gb_3
filtro filtro
sle_1 sle_1
gb_4 gb_4
gb_2 gb_2
end type
global w_seguridad w_seguridad

type variables
string i_grupo
end variables

on w_seguridad.create
this.pb_5=create pb_5
this.pb_7=create pb_7
this.pb_4=create pb_4
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_8=create pb_8
this.st_3=create st_3
this.ddlb_1=create ddlb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_no_estan=create dw_no_estan
this.dw_estan=create dw_estan
this.dw_1=create dw_1
this.gb_1=create gb_1
this.uo_adm=create uo_adm
this.uo_asis=create uo_asis
this.uo_conf=create uo_conf
this.gb_3=create gb_3
this.filtro=create filtro
this.sle_1=create sle_1
this.gb_4=create gb_4
this.gb_2=create gb_2
this.Control[]={this.pb_5,&
this.pb_7,&
this.pb_4,&
this.pb_1,&
this.pb_2,&
this.pb_3,&
this.pb_8,&
this.st_3,&
this.ddlb_1,&
this.st_2,&
this.st_1,&
this.dw_no_estan,&
this.dw_estan,&
this.dw_1,&
this.gb_1,&
this.uo_adm,&
this.uo_asis,&
this.uo_conf,&
this.gb_3,&
this.filtro,&
this.sle_1,&
this.gb_4,&
this.gb_2}
end on

on w_seguridad.destroy
destroy(this.pb_5)
destroy(this.pb_7)
destroy(this.pb_4)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_8)
destroy(this.st_3)
destroy(this.ddlb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_no_estan)
destroy(this.dw_estan)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.uo_adm)
destroy(this.uo_asis)
destroy(this.uo_conf)
destroy(this.gb_3)
destroy(this.filtro)
destroy(this.sle_1)
destroy(this.gb_4)
destroy(this.gb_2)
end on

type pb_5 from picturebutton within w_seguridad
integer x = 1422
integer y = 1328
integer width = 146
integer height = 128
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras.gif"
alignment htextalign = left!
end type

event clicked;if dw_no_estan.rowcount()=0 then return
long fila
fila=dw_no_estan.getrow()
dw_estan.insertrow(1)
dw_estan.setitem(1,'codgrupo',i_grupo)
dw_estan.setitem(1,'usuario',dw_no_estan.getitemstring(fila,'usuario'))
dw_estan.setitem(1,'nombre',dw_no_estan.getitemstring(fila,'nombre'))
dw_estan.setitem(1,'todo',dw_no_estan.getitemstring(fila,'todo'))
dw_no_estan.deleterow(fila)
end event

type pb_7 from picturebutton within w_seguridad
integer x = 1422
integer y = 1188
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras_1.gif"
alignment htextalign = left!
end type

event clicked;do while dw_no_estan.rowcount()>0
	pb_5.triggerevent(clicked!)
loop
end event

type pb_4 from picturebutton within w_seguridad
integer x = 1422
integer y = 1048
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ultimo.gif"
alignment htextalign = left!
end type

event clicked;do while dw_estan.rowcount()>0
	pb_1.triggerevent(clicked!)
loop
end event

type pb_1 from picturebutton within w_seguridad
integer x = 1422
integer y = 912
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "adelante_1.gif"
alignment htextalign = left!
end type

event clicked;if dw_estan.rowcount()=0 then return
long fila
fila=dw_estan.getrow()
dw_no_estan.insertrow(1)
dw_no_estan.setitem(1,'usuario',dw_estan.getitemstring(fila,'usuario'))
dw_no_estan.setitem(1,'nombre',dw_estan.getitemstring(fila,'nombre'))
dw_no_estan.setitem(1,'todo',dw_estan.getitemstring(fila,'todo'))
dw_estan.deleterow(fila)
end event

type pb_2 from picturebutton within w_seguridad
string tag = "Insertar"
integer x = 133
integer y = 676
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
end type

event clicked;dw_1.insertrow(0)
dw_1.scrolltorow(dw_1.rowcount())

end event

type pb_3 from picturebutton within w_seguridad
string tag = "Eliminar"
integer x = 297
integer y = 676
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
end type

event clicked;string grupo
grupo=dw_1.getitemstring(dw_1.getrow(),1)
DELETE SEGPERMISOS.CODGRUPO
FROM SEGGRUPO INNER JOIN SEGPERMISOS ON SEGGRUPO.CODGRUPO = SEGPERMISOS.CODGRUPO
WHERE seggrupo.codgrupo=:grupo;
dw_1.deleterow(dw_1.getrow())

end event

type pb_8 from picturebutton within w_seguridad
string tag = "Guardar"
integer x = 462
integer y = 676
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
end type

event clicked;if dw_1.update()<1 then
	rollback;
	return
end if
if dw_estan.update()=-1 then
	rollback;
	return
end if
if uo_asis.guardar()=-1 then
	rollback;
	return
end if
if uo_adm.guardar()=-1 then
	rollback;
	return
end if
if uo_conf.guardar()=-1 then
	rollback;
	return
end if
commit;


end event

type st_3 from statictext within w_seguridad
integer x = 1070
integer y = 716
integer width = 219
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aplicativo:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_seguridad
integer x = 1330
integer y = 712
integer width = 1029
integer height = 352
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"ASISTENCIAL","ADMINISTRATIVO","CONFIGURADOR"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text='ASISTENCIAL'
end event

event selectionchanged;choose case this.text
	case 'ASISTENCIAL'
		uo_asis.visible=true
		uo_adm.visible=false
		uo_conf.visible=false
	case 'ADMINISTRATIVO'
		uo_asis.visible=false
		uo_adm.visible=true
		uo_conf.visible=false
	case 'CONFIGURADOR'
		uo_asis.visible=false
		uo_adm.visible=false
		uo_conf.visible=true
end choose

end event

type st_2 from statictext within w_seguridad
integer x = 1673
integer y = 2032
integer width = 430
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resto de Usuarios"
boolean focusrectangle = false
end type

type st_1 from statictext within w_seguridad
integer x = 73
integer y = 2028
integer width = 434
integer height = 44
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuarios del Grupo"
boolean focusrectangle = false
end type

type dw_no_estan from datawindow within w_seguridad
integer x = 1673
integer y = 1060
integer width = 1298
integer height = 968
integer taborder = 140
string title = "none"
string dataobject = "dw_nousu_grup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event doubleclicked;if this.getrow()>0 then pb_7.triggerevent(clicked!)
end event

type dw_estan from datawindow within w_seguridad
integer x = 69
integer y = 920
integer width = 1298
integer height = 1112
integer taborder = 90
string title = "none"
string dataobject = "dw_usu_grup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event doubleclicked;if this.getrow()>0 then pb_4.triggerevent(clicked!)
end event

type dw_1 from datawindow within w_seguridad
integer x = 46
integer y = 88
integer width = 2907
integer height = 576
integer taborder = 10
string title = "Definicion de grupos y permisos"
string dataobject = "dw_seggrupo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
retrieve()
end event

event rowfocuschanging;if newrow<1 then return
setpointer(HourGlass!)
i_grupo=getitemstring(newrow,'codgrupo')
dw_estan.reset()
dw_no_estan.reset()
dw_estan.retrieve(i_grupo)
dw_no_estan.retrieve(i_grupo)

m_principal m_pr
m_pr = create m_principal
uo_conf.iniciar(m_principal,i_grupo,'CONF')

m_principal_asis m_asis
m_asis = create m_principal_asis
uo_asis.iniciar(m_asis,i_grupo,'ASI')

m_principal_adm m_adm
m_adm=create m_principal_adm
uo_adm.iniciar(m_adm,i_grupo,'ADM')


end event

event itemchanged;if dwo.name='codgrupo' then //es nuevo y le colocaros el código
	accepttext()
	event rowfocuschanging(row,row)
end if
end event

type gb_1 from groupbox within w_seguridad
integer x = 23
integer y = 24
integer width = 2994
integer height = 804
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos de usuarios"
borderstyle borderstyle = styleraised!
end type

type uo_adm from uo_menus within w_seguridad
event destroy ( )
boolean visible = false
integer x = 3118
integer y = 72
integer width = 1376
integer height = 1996
integer taborder = 30
end type

on uo_adm.destroy
call uo_menus::destroy
end on

type uo_asis from uo_menus within w_seguridad
event destroy ( )
integer x = 3122
integer y = 68
integer width = 1376
integer height = 1908
integer taborder = 50
end type

on uo_asis.destroy
call uo_menus::destroy
end on

type uo_conf from uo_menus within w_seguridad
boolean visible = false
integer x = 3113
integer y = 80
integer width = 1376
integer taborder = 20
borderstyle borderstyle = stylelowered!
end type

on uo_conf.destroy
call uo_menus::destroy
end on

type gb_3 from groupbox within w_seguridad
integer x = 3077
integer y = 12
integer width = 1435
integer height = 2024
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Permisos del Grupo: (Menú de la Aplicación)"
borderstyle borderstyle = styleraised!
end type

type filtro from dropdownlistbox within w_seguridad
integer x = 1710
integer y = 948
integer width = 512
integer height = 280
integer taborder = 150
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string item[] = {"NOMBRE","USUARIO"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text="NOMBRE"
end event

type sle_1 from singlelineedit within w_seguridad
event keypressed pbm_keyup
integer x = 2295
integer y = 944
integer width = 677
integer height = 80
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event keypressed;string texto
texto = upper(text)
if right(texto,1) <> '%' then
	texto = texto + '%'
end if
choose case filtro.text
	case "USUARIO"
		dw_no_estan.SetFilter("upper(usuario) like '" +upper( texto )+ "'")
	case 'NOMBRE'
		dw_no_estan.SetFilter("upper(nombre) like '" +upper( texto )+ "'")

end choose
dw_no_estan.Filter()

end event

type gb_4 from groupbox within w_seguridad
integer x = 1669
integer y = 888
integer width = 1326
integer height = 168
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtro Por"
end type

type gb_2 from groupbox within w_seguridad
integer x = 23
integer y = 824
integer width = 2990
integer height = 1276
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle del Grupo"
borderstyle borderstyle = styleraised!
end type

