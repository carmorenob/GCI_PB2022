$PBExportHeader$w_ter_reser_rfc.srw
forward
global type w_ter_reser_rfc from window
end type
type st_2 from statictext within w_ter_reser_rfc
end type
type st_1 from statictext within w_ter_reser_rfc
end type
type dw_1 from datawindow within w_ter_reser_rfc
end type
end forward

global type w_ter_reser_rfc from window
integer width = 3035
integer height = 1036
boolean titlebar = true
string title = "Terceros de la reserva"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
st_1 st_1
dw_1 dw_1
end type
global w_ter_reser_rfc w_ter_reser_rfc

type variables
datawindow dw_obj

end variables

on w_ter_reser_rfc.create
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.st_2,&
this.st_1,&
this.dw_1}
end on

on w_ter_reser_rfc.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;dw_obj = Message.PowerObjectParm
if dw_1.Retrieve(dw_obj.GetItemString(dw_obj.GetRow(),'coddoc'),dw_obj.GetItemString(dw_obj.GetRow(),'clugar'),dw_obj.GetItemNumber(dw_obj.GetRow(),'numdoc')) = 0 then closewithreturn(this,0)
st_1.Text = 'Terceros de la reserva '+string(dw_obj.GetItemNumber(dw_obj.GetRow(),'numdoc'))
end event

type st_2 from statictext within w_ter_reser_rfc
integer x = 73
integer y = 856
integer width = 987
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble click para seleccionar el tercero"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ter_reser_rfc
integer x = 78
integer y = 8
integer width = 997
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Terceros de la Reserva"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_ter_reser_rfc
integer x = 73
integer y = 80
integer width = 2912
integer height = 760
integer taborder = 10
string title = "none"
string dataobject = "dw_pre_doc_ter"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row > 0 then
	Closewithreturn(parent,row)
end if

end event

event constructor;setTransObject(SQLCA)

end event

