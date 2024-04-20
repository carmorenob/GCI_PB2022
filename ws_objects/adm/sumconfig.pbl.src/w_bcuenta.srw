$PBExportHeader$w_bcuenta.srw
forward
global type w_bcuenta from window
end type
type dw_1 from datawindow within w_bcuenta
end type
type dw_2 from datawindow within w_bcuenta
end type
end forward

global type w_bcuenta from window
integer width = 2464
integer height = 696
boolean titlebar = true
string title = "Busca Cuenta"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "rep.ico"
dw_1 dw_1
dw_2 dw_2
end type
global w_bcuenta w_bcuenta

type variables
st_general messObj
Datawindow dw_obj
string buscar
end variables

on w_bcuenta.create
this.dw_1=create dw_1
this.dw_2=create dw_2
this.Control[]={this.dw_1,&
this.dw_2}
end on

on w_bcuenta.destroy
destroy(this.dw_1)
destroy(this.dw_2)
end on

event open;string empresa
long filas

messObj = message.PowerObjectParm
dw_obj = messObj.dw_obj
empresa = messObj.almacen

dw_1.settransobject(SQLCA)
filas = dw_1.retrieve(empresa)

end event

type dw_1 from datawindow within w_bcuenta
integer x = 55
integer y = 52
integer width = 2341
integer height = 532
integer taborder = 10
string title = "none"
string dataobject = "dw_plan_cont"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow() < 1 then return
if this.getitemstring(this.getrow(),"movimiento")<>'1' then return
if isvalid(dw_obj) and not g_semovio then
	dw_obj.settext(this.getitemstring(this.getrow(),1))
	dw_obj.setitem(dw_obj.getrow(),dw_obj.getcolumn(),this.getitemstring(this.getrow(),1))
	//parent.WindowState=minimized!
	dw_obj.setfocus()
	dw_obj.triggerevent(itemchanged!)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

type dw_2 from datawindow within w_bcuenta
event keyup pbm_dwnkey
integer x = 55
integer y = 60
integer width = 443
integer height = 64
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_paraediciones_2"
boolean border = false
boolean livescroll = true
end type

event keyup;string este="!"
choose case key
	case KeyNumpad0!,key0!
		este='0'
	case KeyNumpad1!,key1!
		este='1'
	case KeyNumpad2!,key2!
		este='2'
	case KeyNumpad3!,key3!
		este='3'
	case KeyNumpad4!,key4!
		este='4'
	case KeyNumpad5!,key5!
		este='5'
	case KeyNumpad6!,key6!
		este='6'
	case KeyNumpad7!,key7!
		este='7'
	case KeyNumpad8!,key8!
		este='8'
	case KeyNumpad9!,key9!
		este='9'
	case KeyNumpad0!,key0!
		este='0'
	case keyback!
		este=this.gettext()
		este=left(este, len(este) -1)
		if not isnumber(este) and este<>"" then return
		if trim(lower(este))="" or isnull(este) then
			dw_1.setfilter("")
		else
			dw_1.setfilter("(lower(codtotal) like '"+lower(trim(este))+"%')")
		end if
		dw_1.filter()
		dw_1.sort()
		return
end choose
if este<>"!" and isnumber(este) then
	if not isnull(this.gettext()) then este=this.gettext()+este
	if trim(lower(este))="" or isnull(este) then
		dw_1.setfilter("")
	else
		dw_1.setfilter("(lower(codtotal) like '"+lower(trim(este))+"%')")
	end if
	dw_1.filter()
	dw_1.sort()
end if

end event

event constructor;this.insertrow(1)
end event

