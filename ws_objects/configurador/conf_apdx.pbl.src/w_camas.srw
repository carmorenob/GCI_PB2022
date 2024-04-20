$PBExportHeader$w_camas.srw
forward
global type w_camas from window
end type
type pb_3 from picturebutton within w_camas
end type
type pb_2 from picturebutton within w_camas
end type
type pb_1 from picturebutton within w_camas
end type
type dw_hab from datawindow within w_camas
end type
type dw_pab from datawindow within w_camas
end type
type dw_lug from datawindow within w_camas
end type
type dw_camas from datawindow within w_camas
end type
end forward

global type w_camas from window
integer width = 4443
integer height = 1708
boolean titlebar = true
string title = "Unidades Hospitalarias"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_hab dw_hab
dw_pab dw_pab
dw_lug dw_lug
dw_camas dw_camas
end type
global w_camas w_camas

type variables
DatawindowChild dwc_p, dwc_h, dwc_cc

end variables

on w_camas.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_hab=create dw_hab
this.dw_pab=create dw_pab
this.dw_lug=create dw_lug
this.dw_camas=create dw_camas
this.Control[]={this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_hab,&
this.dw_pab,&
this.dw_lug,&
this.dw_camas}
end on

on w_camas.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_hab)
destroy(this.dw_pab)
destroy(this.dw_lug)
destroy(this.dw_camas)
end on

type pb_3 from picturebutton within w_camas
integer x = 2281
integer y = 1456
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_camas.update()=-1 then
	rollback;
	dw_hab.triggerevent(itemchanged!)
else
	commit;
end if
end event

type pb_2 from picturebutton within w_camas
integer x = 2066
integer y = 1456
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_camas.deleterow(0)
if dw_camas.update()=-1 then
	rollback;
	dw_hab.triggerevent(itemchanged!)
else
	commit;
end if

end event

type pb_1 from picturebutton within w_camas
integer x = 1865
integer y = 1456
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;Long donde
if isNull(dw_lug.GetItemString(1,1)) or isNull(dw_pab.GetItemString(1,1)) or isNull(dw_hab.GetItemString(1,1)) then Return
donde = dw_camas.insertrow(0)
dw_camas.setitem(donde,"clugar",dw_lug.GetItemString(1,1))
dw_camas.setitem(donde,"codser",dw_pab.GetItemString(1,1))
dw_camas.setitem(donde,"codhab",dw_hab.GetItemString(1,1))
dw_camas.scrolltorow(donde)

end event

type dw_hab from datawindow within w_camas
integer x = 2807
integer y = 28
integer width = 1298
integer height = 148
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_habi2"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
GetChild('codigohab',dwc_h)
dwc_h.SetTransObject(SQLCA)
if dwc_h.Retrieve() = 0 then dwc_h.InsertRow(0)
InsertRow(0)

end event

event itemchanged;AcceptText()
if isNull(dw_lug.GetItemString(1,1)) or isNull(dw_pab.GetItemString(1,1)) then
	Return 0
end if

dw_camas.Retrieve(dw_pab.GetItemString(1,1),GetItemString(1,1),dw_lug.GetItemString(1,1))

end event

type dw_pab from datawindow within w_camas
integer x = 1349
integer y = 28
integer width = 1367
integer height = 156
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_pabellon"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
GetChild('codigoser',dwc_p)
dwc_p.SetTransObject(SQLCA)
if dwc_p.Retrieve() = 0 then dwc_p.InsertRow(0)
InsertRow(0)

end event

event itemchanged;string vnulo
setNull(vnulo)
dw_hab.SetItem(1,1,vnulo)
if isNull(dw_lug.GetItemString(1,1)) then
	Return 0
end if
dw_hab.triggerEvent(itemchanged!)
dwc_h.SetFilter("codigoser='"+data+"' and clugar='"+dw_lug.GetItemString(1,1)+"'")
dwc_h.Filter()

end event

type dw_lug from datawindow within w_camas
integer x = 27
integer y = 28
integer width = 1243
integer height = 148
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar_label"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
InsertRow(0)

end event

event itemchanged;string vnulo
setNull(vnulo)
dw_pab.SetItem(1,1,vnulo)
dw_hab.SetItem(1,1,vnulo)
dw_hab.triggerEvent(itemchanged!)
dwc_p.SetFilter("clugar='"+data+"'")
dwc_p.Filter()

end event

type dw_camas from datawindow within w_camas
integer x = 37
integer y = 188
integer width = 4338
integer height = 1248
integer taborder = 10
string title = "none"
string dataobject = "dw_camas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
GetChild('descripcion',dwc_cc)
dwc_cc.SetTransObject(SQLCA)

end event

event itemchanged;choose case this.getcolumnname()
	case "cufuncional"
		this.setitem(this.getrow(),"cccosto","")
		this.setitem(this.getrow(),"descripcion","")
		dwc_cc.setfilter("coduf='"+data+"'")
		dwc_cc.filter()
	case "descripcion"
		this.setitem(this.getrow(),"cccosto",dwc_cc.getitemstring(dwc_cc.getrow(),"codcc"))		
end choose

end event

event rowfocuschanged;if rowCount() > 0 and currentrow > 0  then
	if not isNull(GetItemString(GetRow(),'cufuncional')) then
		dwc_cc.setfilter("coduf='"+GetItemString(GetRow(),'cufuncional')+"'")
		dwc_cc.filter()
	end if
end if

end event

