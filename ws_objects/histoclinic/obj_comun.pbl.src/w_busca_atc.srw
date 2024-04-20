$PBExportHeader$w_busca_atc.srw
forward
global type w_busca_atc from window
end type
type cb_cancel from picturebutton within w_busca_atc
end type
type cb_aceptar from picturebutton within w_busca_atc
end type
type dw_2 from datawindow within w_busca_atc
end type
type st_1 from statictext within w_busca_atc
end type
type st_5 from statictext within w_busca_atc
end type
type st_3 from statictext within w_busca_atc
end type
type st_2 from statictext within w_busca_atc
end type
type sle_1 from singlelineedit within w_busca_atc
end type
type gb_2 from groupbox within w_busca_atc
end type
end forward

global type w_busca_atc from window
integer width = 3813
integer height = 1688
boolean titlebar = true
string title = "Buscar ATC"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
event filtrar pbm_open
cb_cancel cb_cancel
cb_aceptar cb_aceptar
dw_2 dw_2
st_1 st_1
st_5 st_5
st_3 st_3
st_2 st_2
sle_1 sle_1
gb_2 gb_2
end type
global w_busca_atc w_busca_atc

type variables
datawindowchild subclase,grupo
string orden,anterior

end variables

event open;dw_2.retrieve()
dw_2.setfilter("estado='1'")
dw_2.filter()
end event

on w_busca_atc.create
this.cb_cancel=create cb_cancel
this.cb_aceptar=create cb_aceptar
this.dw_2=create dw_2
this.st_1=create st_1
this.st_5=create st_5
this.st_3=create st_3
this.st_2=create st_2
this.sle_1=create sle_1
this.gb_2=create gb_2
this.Control[]={this.cb_cancel,&
this.cb_aceptar,&
this.dw_2,&
this.st_1,&
this.st_5,&
this.st_3,&
this.st_2,&
this.sle_1,&
this.gb_2}
end on

on w_busca_atc.destroy
destroy(this.cb_cancel)
destroy(this.cb_aceptar)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.gb_2)
end on

type cb_cancel from picturebutton within w_busca_atc
event mousemove pbm_mousemove
integer x = 1883
integer y = 1420
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+A]"
end type

event clicked;close(f_vent_padre(this))
end event

type cb_aceptar from picturebutton within w_busca_atc
event mousemove pbm_mousemove
integer x = 1723
integer y = 1420
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_2.triggerevent(doubleclicked!)
end event

type dw_2 from datawindow within w_busca_atc
integer x = 64
integer y = 252
integer width = 3648
integer height = 1040
integer taborder = 60
string dragicon = "none!"
string dataobject = "dw_pm_codigoatc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.type = "text" then 
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
end if
end event

event doubleclicked;long fila
st_med st_med
if rowcount()<1  then return
st_med.cmedica=getitemstring(getrow(),'cod_atc')
st_med.medicamento=getitemstring(getrow(),'desp_atc')
closewithreturn(f_vent_padre(this),st_med)



end event

event constructor;settransobject(sqlca)
end event

type st_1 from statictext within w_busca_atc
integer x = 3026
integer y = 660
integer width = 576
integer height = 76
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_5 from statictext within w_busca_atc
integer x = 3026
integer y = 604
integer width = 471
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Número de registros:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_busca_atc
integer x = 2080
integer y = 92
integer width = 1591
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Puede Utilizar el caracter ~'%~' como comodín en cualquier parte de la cadena a buscar."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_busca_atc
integer x = 78
integer y = 180
integer width = 896
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por descripción de ATC"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_busca_atc
event teclear pbm_keyup
integer x = 73
integer y = 92
integer width = 1888
integer height = 88
integer taborder = 50
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event teclear;if sle_1.text='' then
	dw_2.setfilter('')
else
	dw_2.setfilter("estado='1' and lower( desp_atc ) like '"+lower(trim(sle_1.text))+"%'")
end if
dw_2.filter()
dw_2.sort()
st_1.text=string(dw_2.rowcount())+' Registros'

end event

type gb_2 from groupbox within w_busca_atc
integer x = 41
integer y = 20
integer width = 3703
integer height = 1352
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Codigops ATC que cumplen la condición"
end type

