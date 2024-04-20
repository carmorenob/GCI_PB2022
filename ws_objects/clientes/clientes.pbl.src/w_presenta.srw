$PBExportHeader$w_presenta.srw
forward
global type w_presenta from window
end type
type p_1 from picture within w_presenta
end type
end forward

global type w_presenta from window
integer x = 201
integer y = 200
integer width = 2062
integer height = 1196
boolean border = false
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "WinLogo!"
string pointer = "Arrow!"
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

event open;this.x=(ancho/2)-this.width/2
this.y=(alto/2)-this.height/2
//p_1.picturename="gci.JPG"

end event

type p_1 from picture within w_presenta
integer width = 64
integer height = 52
string dragicon = "none!"
string pointer = "Arrow!"
boolean originalsize = true
string picturename = "J:\Archivos de programa\Sybase\PowerBuilder 7.0\izq.bmp"
boolean focusrectangle = false
end type

