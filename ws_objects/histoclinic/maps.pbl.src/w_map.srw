$PBExportHeader$w_map.srw
forward
global type w_map from window
end type
type dw_ind from datawindow within w_map
end type
type st_2 from statictext within w_map
end type
type uo_1 from uo_dwmap within w_map
end type
type st_1 from statictext within w_map
end type
type dw_m from datawindow within w_map
end type
end forward

global type w_map from window
integer width = 3314
integer height = 2108
boolean titlebar = true
string title = "Mapas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_ind dw_ind
st_2 st_2
uo_1 uo_1
st_1 st_1
dw_m dw_m
end type
global w_map w_map

on w_map.create
this.dw_ind=create dw_ind
this.st_2=create st_2
this.uo_1=create uo_1
this.st_1=create st_1
this.dw_m=create dw_m
this.Control[]={this.dw_ind,&
this.st_2,&
this.uo_1,&
this.st_1,&
this.dw_m}
end on

on w_map.destroy
destroy(this.dw_ind)
destroy(this.st_2)
destroy(this.uo_1)
destroy(this.st_1)
destroy(this.dw_m)
end on

event resize;uo_1.Resize(newwidth - 170, newHeight - 170)

end event

type dw_ind from datawindow within w_map
integer x = 1755
integer y = 16
integer width = 969
integer height = 68
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_indicadores"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
InsertRow(0)

end event

event itemchanged;acceptText()
uo_1.get_values(GetItemString(1,1))

end event

type st_2 from statictext within w_map
integer x = 1413
integer y = 20
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Indicadores"
boolean focusrectangle = false
end type

type uo_1 from uo_dwmap within w_map
integer x = 101
integer y = 112
integer width = 2926
integer height = 1764
integer taborder = 20
end type

on uo_1.destroy
call uo_dwmap::destroy
end on

type st_1 from statictext within w_map
integer x = 133
integer y = 16
integer width = 224
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Paises"
boolean focusrectangle = false
end type

type dw_m from datawindow within w_map
integer x = 315
integer y = 8
integer width = 933
integer height = 84
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_maps"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
InsertRow(0)

end event

event itemchanged;acceptText()
uo_1.Retrieve(GetItemString(1,1),'','P')

end event

