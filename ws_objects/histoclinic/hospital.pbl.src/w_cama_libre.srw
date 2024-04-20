$PBExportHeader$w_cama_libre.srw
forward
global type w_cama_libre from window
end type
type pb_2 from picturebutton within w_cama_libre
end type
type pb_1 from picturebutton within w_cama_libre
end type
type dw_tingres from datawindow within w_cama_libre
end type
type dw_1 from datawindow within w_cama_libre
end type
type st_1 from statictext within w_cama_libre
end type
end forward

global type w_cama_libre from window
integer width = 2290
integer height = 1608
boolean titlebar = true
string title = "Camas libres por tipo de Ingreso"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Buscar.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_tingres dw_tingres
dw_1 dw_1
st_1 st_1
end type
global w_cama_libre w_cama_libre

type variables
datawindowchild dwc_l

end variables

event open;dw_tingres.setitem(1,1,message.stringparm)
if not isNull(clugar) then
	dw_1.retrieve(dw_tingres.getitemstring(1,1),clugar)
end if

end event

on w_cama_libre.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_tingres=create dw_tingres
this.dw_1=create dw_1
this.st_1=create st_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_tingres,&
this.dw_1,&
this.st_1}
end on

on w_cama_libre.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_tingres)
destroy(this.dw_1)
destroy(this.st_1)
end on

type pb_2 from picturebutton within w_cama_libre
integer x = 1102
integer y = 1368
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
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_cama_libre
integer x = 951
integer y = 1368
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type dw_tingres from datawindow within w_cama_libre
integer x = 59
integer width = 1179
integer height = 84
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;modify('datawindow.detail.height="116" ')
modify('codtingre.font.height="-12" ')
modify('codtingre.height="90"')
modify('codtingre.width="791"') 
settransobject(sqlca)
insertrow(1)


end event

type dw_1 from datawindow within w_cama_libre
integer x = 18
integer y = 184
integer width = 2167
integer height = 1148
integer taborder = 10
string title = "none"
string dataobject = "dw_camas_libres"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;if getrow()<1 then return
w_admision.tab_1.tabpage_2.dw_1.setitem(1,'clugar_cam',getitemstring(getrow(),'clugar'))
w_admision.tab_1.tabpage_2.dw_1.setitem(1,'codser',getitemstring(getrow(),'codigoser'))
w_admision.tab_1.tabpage_2.dw_1.setcolumn('codser')
w_admision.tab_1.tabpage_2.dw_1.triggerevent(itemchanged!)
w_admision.tab_1.tabpage_2.dw_1.setitem(1,'codhab',getitemstring(getrow(),'codigohab'))
w_admision.tab_1.tabpage_2.dw_1.setcolumn('codhab')
w_admision.tab_1.tabpage_2.dw_1.triggerevent(itemchanged!)
w_admision.tab_1.tabpage_2.dw_1.setitem(1,'codcama',getitemstring(getrow(),'codigocama'))
w_admision.tab_1.tabpage_2.dw_1.setcolumn('codcama')
w_admision.tab_1.tabpage_2.dw_1.triggerevent(itemchanged!)
closewithreturn(parent,'ok')
end event

type st_1 from statictext within w_cama_libre
integer x = 69
integer y = 104
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Ingreso:"
boolean focusrectangle = false
end type

