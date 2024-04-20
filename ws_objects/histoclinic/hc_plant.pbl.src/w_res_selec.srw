$PBExportHeader$w_res_selec.srw
forward
global type w_res_selec from window
end type
type dw_res from datawindow within w_res_selec
end type
end forward

global type w_res_selec from window
integer width = 2651
integer height = 1408
boolean titlebar = true
string title = "Resultados relacionados"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_res dw_res
end type
global w_res_selec w_res_selec

type variables
datawindow dw_obj
end variables

on w_res_selec.create
this.dw_res=create dw_res
this.Control[]={this.dw_res}
end on

on w_res_selec.destroy
destroy(this.dw_res)
end on

event open;dw_obj = Message.PowerObjectParm
long j

for j=1 to dw_obj.rowcount()
	dw_obj.rowscopy(j, j, Primary!, dw_res, dw_res.rowcount()+1, Primary!)
next
dw_res.groupcalc()

end event

type dw_res from datawindow within w_res_selec
integer x = 37
integer y = 64
integer width = 2519
integer height = 1152
integer taborder = 10
string title = "none"
string dataobject = "dw_trae_resultados2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

