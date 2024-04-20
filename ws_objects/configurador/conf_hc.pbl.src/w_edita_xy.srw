$PBExportHeader$w_edita_xy.srw
forward
global type w_edita_xy from window
end type
type pb_2 from picturebutton within w_edita_xy
end type
type pb_1 from picturebutton within w_edita_xy
end type
type dw_1 from datawindow within w_edita_xy
end type
end forward

global type w_edita_xy from window
integer width = 1751
integer height = 724
boolean titlebar = true
string title = "Edicón de Gráficas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Function!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_edita_xy w_edita_xy

type variables
st_rte i_dw
end variables

on w_edita_xy.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_edita_xy.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;i_dw=message.powerobjectparm
dw_1.retrieve(i_dw.codplantilla)
if i_dw.c_otro='1' then
	dw_1.Modify ( "xy.values='X	X/Y	Y/'" )
end if
if i_dw.c_otro='2' then
	dw_1.Modify ( "xy.values='X	X/Y	Y/Z	Z/'" )
end if


end event

type pb_2 from picturebutton within w_edita_xy
integer x = 1536
integer y = 144
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_edita_xy
integer x = 1531
integer y = 8
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()>0 then
    int l_i,l_fil
	dw_1.SetRedraw(false)	
	dw_1.setfilter('xy="X" or xy="Y" or xy="Z"')
	dw_1.filter()
	if i_dw.c_otro='2'  and dw_1.rowcount()<>3 then
		messagebox('Atención','Deben existir una variable X , una Y y una Z')
	else
	   l_i=dw_1.rowcount()
	   for l_i= 1 to dw_1.rowcount()
          l_fil= i_dw.dw_data.insertrow(0)
		 i_dw.dw_data.setitem(l_fil,1,dw_1.getitemstring(l_i,'codplantilla'))
		 i_dw.dw_data.setitem(l_fil,2,dw_1.getitemnumber(l_i,'numcampo'))
		 i_dw.dw_data.setitem(l_fil,3,i_dw.empresa)
 		 i_dw.dw_data.setitem(l_fil,4,dw_1.getitemstring(l_i,'descampo'))
		 i_dw.dw_data.setitem(l_fil,5,dw_1.getitemstring(l_i,'xy'))
	   next
	end If
	dw_1.SetRedraw(true)	
End If
closewithreturn(parent,i_dw.dw_data)
end event

type dw_1 from datawindow within w_edita_xy
integer width = 1486
integer height = 580
integer taborder = 10
string dragicon = "CreateLibrary5!"
string title = "none"
string dataobject = "dw_campos_plant_numeric_xy"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clicked;if row>0 and row<>getrow() then setrow(row)

end event

event constructor;settransobject(sqlca)
end event

event itemchanged;if row>0  then
	dw_1.SetRedraw(false)	
	dw_1.setfilter('xy="X"')
	dw_1.filter()
	if dw_1.rowcount()>1 then
		messagebox('Atención','No pueden haber 2 variables X')
		dw_1.setfilter('')
		dw_1.filter()
		SetItem(row, 'xy', "")
		dw_1.SetRedraw(true)
	End If
	dw_1.setfilter('xy="Y"')
	dw_1.filter()
	if dw_1.rowcount()>1 then
		messagebox('Atención','No pueden haber 2 variables Y')
		dw_1.setfilter('')
		dw_1.filter()
		SetItem(row, 'xy', "")
	End If
	dw_1.setfilter('xy="Z"')
	dw_1.filter()
	if dw_1.rowcount()>1 then
		messagebox('Atención','No pueden haber 2 variables Z')
		dw_1.setfilter('')
		dw_1.filter()
		SetItem(row, 'xy', "")
		dw_1.SetRedraw(true)
	End If
	dw_1.setfilter('')
	dw_1.filter()
End If
	dw_1.scroll(row)
dw_1.SetRedraw(true)	

end event

