$PBExportHeader$w_presenta.srw
forward
global type w_presenta from window
end type
type p_1 from picture within w_presenta
end type
end forward

global type w_presenta from window
integer x = 302
integer y = 300
integer width = 2866
integer height = 1432
boolean border = false
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "WinLogo!"
string pointer = "Arrow!"
boolean center = true
p_1 p_1
end type
global w_presenta w_presenta

on w_presenta.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on w_presenta.destroy
destroy(this.p_1)
end on

event open;choose case g_aplicacion
	case 'histo_clinic'
		p_1.picturename='pre_clinico.jpg'
	case 'gci_adm'
		p_1.picturename='pre_clinico.jpg'
	case 'conf_apdx'
		p_1.picturename='pre_clinico.jpg'
end choose
end event

type p_1 from picture within w_presenta
integer width = 2866
integer height = 1432
string dragicon = "none!"
string pointer = "Arrow!"
string picturename = "pre_clinico.jpg"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

