$PBExportHeader$w_busca_proc.srw
forward
global type w_busca_proc from window
end type
type cbx_1 from checkbox within w_busca_proc
end type
type cb_2 from commandbutton within w_busca_proc
end type
type cb_1 from commandbutton within w_busca_proc
end type
type st_2 from statictext within w_busca_proc
end type
type st_1 from statictext within w_busca_proc
end type
type dw_2 from datawindow within w_busca_proc
end type
type sle_1 from singlelineedit within w_busca_proc
end type
type dw_1 from datawindow within w_busca_proc
end type
end forward

global type w_busca_proc from window
integer x = 201
integer y = 200
integer width = 3104
integer height = 1848
boolean titlebar = true
string title = "Buscar Procedimento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar2.gif"
string pointer = "Arrow!"
boolean center = true
event teclear pbm_syskeydown
event filtrar pbm_keyup
cbx_1 cbx_1
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
dw_2 dw_2
sle_1 sle_1
dw_1 dw_1
end type
global w_busca_proc w_busca_proc

type variables
datawindowchild capitul,grup
end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();if cbx_1.checked and dw_1.getitemstring(1,"cd_grupo")<>"" then
	dw_2.setfilter("(lower(descripcion) like '"+lower(trim(sle_1.text))+"%') and cd_grupo = '" + dw_1.getitemstring(1,"cd_grupo")+" '")
else
	dw_2.setfilter("lower(descripcion) like '"+lower(trim(sle_1.text))+"%'")
end if
dw_2.filter()
dw_2.sort()
st_1.text=string(dw_2.rowcount())+' Registros'
end subroutine

on w_busca_proc.create
this.cbx_1=create cbx_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_2=create dw_2
this.sle_1=create sle_1
this.dw_1=create dw_1
this.Control[]={this.cbx_1,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.dw_2,&
this.sle_1,&
this.dw_1}
end on

on w_busca_proc.destroy
destroy(this.cbx_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.sle_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_2.setsort("#2 a")
dw_2.retrieve()
dw_1.GetChild('cd_capitulo', capitul)
dw_1.GetChild('cd_grupo', grup)
capitul.settransobject(sqlca)
grup.settransobject(sqlca)
capitul.retrieve('%')
grup.retrieve('%')
dw_1.insertrow(0)
capitul.reset()
grup.reset()


end event

type cbx_1 from checkbox within w_busca_proc
integer x = 2007
integer y = 376
integer width = 786
integer height = 80
string dragicon = "none!"
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tener en cuenta para filtrar"
end type

event clicked;filtrar()
end event

type cb_2 from commandbutton within w_busca_proc
integer x = 1467
integer y = 1576
integer width = 343
integer height = 100
integer taborder = 50
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "&Cerrar"
boolean cancel = true
end type

event clicked;closewithreturn(parent,'')
end event

type cb_1 from commandbutton within w_busca_proc
integer x = 1115
integer y = 1576
integer width = 343
integer height = 100
integer taborder = 40
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "&Agregar"
boolean default = true
end type

event clicked;dw_2.triggerevent(doubleclicked!)
end event

type st_2 from statictext within w_busca_proc
integer x = 87
integer y = 672
integer width = 645
integer height = 64
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por &Descripción:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_busca_proc
integer x = 2386
integer y = 644
integer width = 608
integer height = 92
string dragicon = "none!"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_busca_proc
integer x = 73
integer y = 748
integer width = 2926
integer height = 784
integer taborder = 30
string dragicon = "none!"
string dataobject = "dw_procedimi"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;st_1.text=string(this.rowcount())+' Registros'
end event

event doubleclicked;if getrow()<1 then return
closewithreturn(parent,getitemstring(getrow(),"codproced"))
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type sle_1 from singlelineedit within w_busca_proc
event teclear pbm_keyup
integer x = 96
integer y = 580
integer width = 1408
integer height = 92
integer taborder = 20
string dragicon = "none!"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
textcase textcase = upper!
integer accelerator = 100
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

type dw_1 from datawindow within w_busca_proc
integer x = 46
integer y = 40
integer width = 2176
integer height = 536
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_capitulo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
choose case this.getcolumnname()
	case "cd_seccion"
		this.setitem(1,"cd_capitulo","")
		capitul.retrieve(this.getitemstring(1,'cd_seccion'))
		this.setitem(1,'cd_grupo','')
		grup.reset()
		if cbx_1.checked then filtrar()
	case "cd_capitulo"
		this.setitem(1,'cd_grupo','')
		grup.retrieve(this.getitemstring(1,'cd_capitulo'))
		if cbx_1.checked then filtrar()
	case "cd_grupo"
		if cbx_1.checked then filtrar()
end choose
		
end event

