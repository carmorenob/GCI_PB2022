$PBExportHeader$w_busca_solo_cups.srw
forward
global type w_busca_solo_cups from window
end type
type st_5 from statictext within w_busca_solo_cups
end type
type st_4 from statictext within w_busca_solo_cups
end type
type st_3 from statictext within w_busca_solo_cups
end type
type st_2 from statictext within w_busca_solo_cups
end type
type sle_2 from singlelineedit within w_busca_solo_cups
end type
type sle_1 from singlelineedit within w_busca_solo_cups
end type
type st_1 from statictext within w_busca_solo_cups
end type
type pb_1 from picturebutton within w_busca_solo_cups
end type
type pb_ok from picturebutton within w_busca_solo_cups
end type
type dw_2 from datawindow within w_busca_solo_cups
end type
end forward

global type w_busca_solo_cups from window
integer width = 3945
integer height = 1692
boolean titlebar = true
string title = "Buscar CUPS"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
sle_2 sle_2
sle_1 sle_1
st_1 st_1
pb_1 pb_1
pb_ok pb_ok
dw_2 dw_2
end type
global w_busca_solo_cups w_busca_solo_cups

on w_busca_solo_cups.create
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_1=create st_1
this.pb_1=create pb_1
this.pb_ok=create pb_ok
this.dw_2=create dw_2
this.Control[]={this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.sle_2,&
this.sle_1,&
this.st_1,&
this.pb_1,&
this.pb_ok,&
this.dw_2}
end on

on w_busca_solo_cups.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.pb_ok)
destroy(this.dw_2)
end on

event open;//VERIFICAR VERSION ACTIVA CUPS
datetime ahora
string version,des_vers

ahora=datetime(today())
select cod_version,des_version into :version,:des_vers from pm_cups_version where valido_hasta>=:ahora;
if isnull(version) then 
	messagebox("Atención","No existe una versión de Cups activa")
	return
end if
st_3.text='Versión CUPS: '+ des_vers
dw_2.retrieve(version)
dw_2.setsort("#2 a")

end event

type st_5 from statictext within w_busca_solo_cups
integer x = 1582
integer y = 12
integer width = 1202
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_4 from statictext within w_busca_solo_cups
integer x = 50
integer y = 12
integer width = 1486
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Puede filtrar por código o por descrición (Utilice % como comodín)"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_busca_solo_cups
integer x = 416
integer y = 84
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción"
boolean focusrectangle = false
end type

type st_2 from statictext within w_busca_solo_cups
integer x = 46
integer y = 84
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_busca_solo_cups
event key pbm_keyup
integer x = 411
integer y = 144
integer width = 3383
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event key;if text='' then
	dw_2.setfilter('')
else
	dw_2.setfilter('lower(descripcion) like lower("%'+text+'%")')
end if
dw_2.filter()
st_1.text=string(dw_2.rowcount())+' regs.'
end event

type sle_1 from singlelineedit within w_busca_solo_cups
event key pbm_keyup
integer x = 41
integer y = 144
integer width = 343
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event key;dw_2.setfilter('codproced like "'+text+'%"')
dw_2.filter()
st_1.text=string(dw_2.rowcount())+' regs.'
end event

type st_1 from statictext within w_busca_solo_cups
integer x = 3237
integer y = 1380
integer width = 645
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_busca_solo_cups
integer x = 1879
integer y = 1416
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean flatstyle = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_busca_solo_cups
integer x = 1719
integer y = 1416
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar y llevar"
end type

event clicked;if dw_2.rowcount()=0 then return
closewithreturn(parent,dw_2.getitemstring(dw_2.getrow(),'codproced'))
end event

type dw_2 from datawindow within w_busca_solo_cups
integer x = 41
integer y = 280
integer width = 3854
integer height = 1100
integer taborder = 20
string title = "none"
string dataobject = "dw_todos_cups"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event retrieveend;st_1.text=string(rowcount)+' regs.'
end event

event doubleclicked;if row<=0 then return
pb_ok.event clicked()
end event

