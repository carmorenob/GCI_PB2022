$PBExportHeader$tp_n.sru
forward
global type tp_n from userobject
end type
type dw_1 from datawindow within tp_n
end type
end forward

global type tp_n from userobject
integer width = 3269
integer height = 1932
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
end type
global tp_n tp_n

on tp_n.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tp_n.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tp_n
event repinta ( )
integer x = 9
integer y = 24
integer width = 3223
integer height = 1840
integer taborder = 10
string title = "none"
string dataobject = "dw_osdeta"
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean hsplitscroll = true
end type

event repinta();this.accepttext()
long j
j=this.getrow()
this.sort()
this.scrolltorow(j)
if this.getitemstring(j,'esco')='1' then
	this.setcolumn('carreta')
	this.setcolumn('espe')
end if
end event

event constructor;this.settransobject(sqlca)
end event

event buttonclicked;
if not isvalid(w_deta_kit) then
	string area
	long item
	area=this.getitemstring(row,'codarea')
	item=this.getitemnumber(row,'item')
	open(w_deta_kit)
	w_deta_kit.dw_1.retrieve(area,item)
	w_deta_kit.setfocus()
end if
end event

event itemchanged;if dwo.name='esco' and this.getitemstring(1,'ori')='1' then this.post event repinta()
end event

