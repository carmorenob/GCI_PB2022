$PBExportHeader$w_kardex.srw
forward
global type w_kardex from window
end type
type dw_almfuente from datawindow within w_kardex
end type
type dw_1 from datawindow within w_kardex
end type
end forward

global type w_kardex from window
integer width = 4178
integer height = 1480
boolean titlebar = true
string title = "Existencias en Almacén"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_almfuente dw_almfuente
dw_1 dw_1
end type
global w_kardex w_kardex

type variables
DatawindowChild dwc_almfuente
end variables

on w_kardex.create
this.dw_almfuente=create dw_almfuente
this.dw_1=create dw_1
this.Control[]={this.dw_almfuente,&
this.dw_1}
end on

on w_kardex.destroy
destroy(this.dw_almfuente)
destroy(this.dw_1)
end on

event open;string codalm

if g_motor='postgres' then
	dw_1.dataObject='dw_kardexprelote_postgres'
end if
if g_motor='sql' then
	dw_1.dataObject='dw_kardexprelote_sqlserver'
end if
if g_motor<>'postgres' and  g_motor<>'sql' then
	dw_1.dataObject='dw_kardexprelote'
end if	
	
dw_1.settransobject(sqlca)
codalm = Message.StringParm
dw_almfuente.GetChild('codalmacen', dwc_almfuente)
dwc_almfuente.SetTransObject(SQLCA)
if dwc_almfuente.Retrieve(usuario,'%') = 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_almfuente.InsertRow(0)
end if

dw_almfuente.InsertRow(0)
if not isNull(codalm) then
	dw_almfuente.SetItem(1,'codalmacen',codalm)
	dw_almfuente.TriggerEvent(itemChanged!)
end if
dw_1.Modify('selec.Visible = FALSE selec_t.Visible=FALSE')
end event

type dw_almfuente from datawindow within w_kardex
event retornar ( )
integer x = 27
integer y = 40
integer width = 1755
integer height = 76
integer taborder = 10
string title = "none"
string dataobject = "dw_ext_almacen"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;acceptText()
dw_1.retrieve(GetItemString(1,'codalmacen'))

end event

type dw_1 from datawindow within w_kardex
integer x = 27
integer y = 152
integer width = 4082
integer height = 1120
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_kardexprelote"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)

end event

