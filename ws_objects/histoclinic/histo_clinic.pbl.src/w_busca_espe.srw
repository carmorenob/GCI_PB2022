$PBExportHeader$w_busca_espe.srw
forward
global type w_busca_espe from window
end type
type st_2 from statictext within w_busca_espe
end type
type pb_cancel from picturebutton within w_busca_espe
end type
type pb_aceptar from picturebutton within w_busca_espe
end type
type st_1 from statictext within w_busca_espe
end type
type d_filtrar from dropdownlistbox within w_busca_espe
end type
type sle_1 from singlelineedit within w_busca_espe
end type
type dw_busca from datawindow within w_busca_espe
end type
end forward

global type w_busca_espe from window
integer width = 2208
integer height = 1204
boolean titlebar = true
string title = "Búsqueda de especialidades"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean clientedge = true
boolean center = true
st_2 st_2
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_1 st_1
d_filtrar d_filtrar
sle_1 sle_1
dw_busca dw_busca
end type
global w_busca_espe w_busca_espe

type variables
string anterior,orden
end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();choose case d_filtrar.text
	case "Código"
		dw_busca.setfilter("codesp like '"+trim(sle_1.text)+"%'")
	case "Descripción"
		dw_busca.setfilter("lower(desesp) like '"+lower(trim(sle_1.text))+"%'")
end choose
dw_busca.filter()
dw_busca.sort()
st_2.text=string(dw_busca.rowcount())+' Registro(s)'
end subroutine

on w_busca_espe.create
this.st_2=create st_2
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.d_filtrar=create d_filtrar
this.sle_1=create sle_1
this.dw_busca=create dw_busca
this.Control[]={this.st_2,&
this.pb_cancel,&
this.pb_aceptar,&
this.st_1,&
this.d_filtrar,&
this.sle_1,&
this.dw_busca}
end on

on w_busca_espe.destroy
destroy(this.st_2)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.d_filtrar)
destroy(this.sle_1)
destroy(this.dw_busca)
end on

event open;dw_busca.settransobject(sqlca)
d_filtrar.text="Descripción"
dw_busca.retrieve()
end event

type st_2 from statictext within w_busca_espe
integer x = 1179
integer y = 964
integer width = 960
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_busca_espe
integer x = 1024
integer y = 968
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_busca_espe
integer x = 873
integer y = 968
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_busca.triggerevent(doubleclicked!)
end event

type st_1 from statictext within w_busca_espe
integer x = 41
integer y = 52
integer width = 274
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por:"
boolean focusrectangle = false
end type

type d_filtrar from dropdownlistbox within w_busca_espe
integer x = 325
integer y = 40
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
string item[] = {"Código","Descripción"}
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_busca_espe
event teclear pbm_keyup
integer x = 873
integer y = 44
integer width = 1253
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

type dw_busca from datawindow within w_busca_espe
integer x = 27
integer y = 180
integer width = 2112
integer height = 768
integer taborder = 10
string title = "none"
string dataobject = "dw_especialidades"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow()<1 then return
retorna_busqueda=this.getitemstring(this.getrow(),"codesp")
retorna_des_busqueda=this.getitemstring(this.getrow(),"desesp")
close(parent)
end event

event clicked;if dwo.type <> "text" then return
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
dw_busca.setsort(cual+" "+orden)
dw_busca.sort()
anterior=cual


end event

event retrieveend;st_2.text=string(rowcount)+' Registro(s)'
end event

