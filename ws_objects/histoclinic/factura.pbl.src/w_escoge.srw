$PBExportHeader$w_escoge.srw
forward
global type w_escoge from w_center
end type
type dw_1 from datawindow within w_escoge
end type
type pb_buscar from picturebutton within w_escoge
end type
end forward

global type w_escoge from w_center
integer height = 836
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "Question!"
boolean clientedge = true
dw_1 dw_1
pb_buscar pb_buscar
end type
global w_escoge w_escoge

type variables
double fila=0
end variables

on w_escoge.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.pb_buscar=create pb_buscar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.pb_buscar
end on

on w_escoge.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.pb_buscar)
end on

event open;call super::open;choose case message.PowerObjectParm.typeof()
	case datawindow!
		datawindow dw
		dw=message.PowerObjectParm
		dw_1.dataobject=dw.dataobject
		dw.rowscopy(1,dw.rowcount(),primary!,dw_1,1,primary!)
		if dw.dataobject='dw_empacguarda' then 
			dw_1.setfilter("estado='1'")
			dw_1.filter()
		end if
	case datastore!
		datastore ds
		ds=message.PowerObjectParm
		dw_1.create(ds.describe("datawindow.syntax"))
		ds.RowsCopy(ds.GetRow(), ds.RowCount(), Primary!, dw_1, 1, Primary!)
		if ds.dataobject='dw_empacguarda' then 
			dw_1.setfilter("estado='1'")
			dw_1.filter()
		end if
end choose
this.title = dw_1.describe("titulo.text")
end event

event close;call super::close;closewithreturn(this,fila)
end event

type pb_grabar from w_center`pb_grabar within w_escoge
string tag = "&Aceptar"
integer x = 1143
integer y = 600
string text = "         &a"
boolean default = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
end type

event pb_grabar::clicked;call super::clicked;dw_1.triggerevent(doubleclicked!)
end event

type dw_1 from datawindow within w_escoge
integer x = 27
integer y = 20
integer width = 2615
integer height = 556
integer taborder = 20
boolean bringtotop = true
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;fila=getrow()
if fila<1 then return
closewithreturn(parent,fila)
end event

type pb_buscar from picturebutton within w_escoge
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 1298
integer y = 600
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &c"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
end type

event clicked;closewithreturn(parent,"")
end event

