$PBExportHeader$w_graph_title.srw
$PBExportComments$General response window to modify a graph title
forward
global type w_graph_title from w_center
end type
type cb_cancel from commandbutton within w_graph_title
end type
type cb_ok from commandbutton within w_graph_title
end type
type texto from singlelineedit within w_graph_title
end type
type fuente from listbox within w_graph_title
end type
type sle_fuente from singlelineedit within w_graph_title
end type
type ftaman from listbox within w_graph_title
end type
type sle_tamano from statictext within w_graph_title
end type
type dw_1 from datawindow within w_graph_title
end type
type ddplb_1 from dropdownpicturelistbox within w_graph_title
end type
type dw_2 from datawindow within w_graph_title
end type
type st_1 from statictext within w_graph_title
end type
type gb_1 from groupbox within w_graph_title
end type
type sle_color from statictext within w_graph_title
end type
end forward

global type w_graph_title from w_center
integer x = 677
integer y = 740
integer width = 1751
integer height = 1364
string title = "Título del gráfico"
windowtype windowtype = response!
long backcolor = 74481808
string icon = "titulo.ico"
toolbaralignment toolbaralignment = alignatleft!
cb_cancel cb_cancel
cb_ok cb_ok
texto texto
fuente fuente
sle_fuente sle_fuente
ftaman ftaman
sle_tamano sle_tamano
dw_1 dw_1
ddplb_1 ddplb_1
dw_2 dw_2
st_1 st_1
gb_1 gb_1
sle_color sle_color
end type
global w_graph_title w_graph_title

type variables
object io_passed
graph igr_parm
datawindow idw_parm

end variables

event open;call super::open;// The calling window has passed the current graph object. Initialize 
// the Single Line Edit so the user can modify it.
// the  graph object 'igr_parm' is declared as an instance variable.

graphicobject lgro_hold
environment env
string ruta, fon[]
long i,j

GetEnvironment(env)
Choose Case Env.OSType
	Case Windows!
	  If Env.OSMajorRevision = 4 Or Env.OSMinorRevision = 95 Then
		Ruta="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Fonts"
	  Else
		 Ruta="2"
	  End If
			
	Case windowsnt!
		Ruta="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Fonts"
	End Choose

RegistryValues(Ruta,Fon)
if Fuente.totalitems()=0 then
	For i=1 To UpperBound(Fon)
		j=Pos(fon[i]," (")
		If j<>0 Then
			Fuente.AddItem(Mid(Fon[i],1,j - 1))		
		End If
	Next
end if

lgro_hold = message.powerobjectparm
If lgro_hold.TypeOf() = Graph! Then
	io_passed = Graph!
	igr_parm = message.powerobjectparm
	Texto.text = igr_parm.title
	Texto.SelectText (1,999)
		
Elseif lgro_hold.TypeOf() = Datawindow! Then
	io_passed = Datawindow!
	long fila
	idw_parm = message.powerobjectparm
	Texto.text = idw_parm.Object.gr_1.title

	fila = dw_1.InsertRow(0)
	dw_1.SetItem(fila,'campo', 'title')
	dw_1.SetItem(fila,'texto', idw_parm.Object.gr_1.title)
	dw_1.SetItem(fila,'fuente', idw_parm.Object.gr_1.title.dispattr.font.face)
	dw_1.SetItem(fila,'tamano', idw_parm.Object.gr_1.title.dispattr.font.height)
	dw_1.SetItem(fila,'color', idw_parm.Object.gr_1.title.dispattr.textcolor)
	
	fila = dw_1.InsertRow(0)
	dw_1.SetItem(fila,'campo', 'category')
	dw_1.SetItem(fila,'texto', idw_parm.Object.gr_1.category.Label)
	dw_1.SetItem(fila,'fuente', idw_parm.Object.gr_1.category.dispattr.font.face)
	dw_1.SetItem(fila,'tamano', idw_parm.Object.gr_1.category.dispattr.font.height)
	dw_1.SetItem(fila,'color', idw_parm.Object.gr_1.category.dispattr.textcolor)
	
	fila = dw_1.InsertRow(0)
	dw_1.SetItem(fila,'campo', 'values')
	dw_1.SetItem(fila,'texto', idw_parm.Object.gr_1.values.Label)
	dw_1.SetItem(fila,'fuente', idw_parm.Object.gr_1.values.dispattr.font.face)
	dw_1.SetItem(fila,'tamano', idw_parm.Object.gr_1.values.dispattr.font.height)
	dw_1.SetItem(fila,'color', idw_parm.Object.gr_1.values.dispattr.textcolor)

	fila = dw_1.InsertRow(0)
	dw_1.SetItem(fila,'campo', 'series')
	dw_1.SetItem(fila,'texto', idw_parm.Object.gr_1.series.Label)
	dw_1.SetItem(fila,'fuente', idw_parm.Object.gr_1.series.dispattr.font.face)
	dw_1.SetItem(fila,'tamano', idw_parm.Object.gr_1.series.dispattr.font.height)
	dw_1.SetItem(fila,'color', idw_parm.Object.gr_1.series.dispattr.textcolor)
		
	dw_2.Object.Data = dw_1.Object.Data
	
	Texto.SelectText (1,999)
	ddplb_1.Text = 'Título'
	ddplb_1.TriggerEvent(selectionchanged!)
//	sle_fuente.Text = dw_1.GetItemString(1,'fuente')
//	sle_tamano.Text = dw_1.GetItemString(1,'tamano')
//	sle_color.BackColor = long(dw_1.GetItemString(1,'color'))
	
End If

end event

on w_graph_title.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.texto=create texto
this.fuente=create fuente
this.sle_fuente=create sle_fuente
this.ftaman=create ftaman
this.sle_tamano=create sle_tamano
this.dw_1=create dw_1
this.ddplb_1=create ddplb_1
this.dw_2=create dw_2
this.st_1=create st_1
this.gb_1=create gb_1
this.sle_color=create sle_color
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.texto
this.Control[iCurrent+4]=this.fuente
this.Control[iCurrent+5]=this.sle_fuente
this.Control[iCurrent+6]=this.ftaman
this.Control[iCurrent+7]=this.sle_tamano
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.ddplb_1
this.Control[iCurrent+10]=this.dw_2
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.sle_color
end on

on w_graph_title.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.texto)
destroy(this.fuente)
destroy(this.sle_fuente)
destroy(this.ftaman)
destroy(this.sle_tamano)
destroy(this.dw_1)
destroy(this.ddplb_1)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.sle_color)
end on

type pb_grabar from w_center`pb_grabar within w_graph_title
integer width = 151
integer height = 132
end type

type cb_cancel from commandbutton within w_graph_title
integer x = 795
integer y = 1096
integer width = 265
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;
If io_passed = Graph! Then
	//igr_parm.title = ''//is_original_title
Elseif io_passed = Datawindow! Then
	// Set the graph title in the datawindow to the modified text.
	//idw_parm.Object.gr_1.title = ''//is_original_title
End If

Close (parent)
end event

type cb_ok from commandbutton within w_graph_title
integer x = 480
integer y = 1096
integer width = 265
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

event clicked;long i
string ret, modstr

for i = 1 to dw_2.RowCount()
	if dw_2.GetItemString(i,'campo') = 'title' then
		modstr = 'gr_1.' + dw_2.GetItemString(i,'campo') + '="' + dw_2.GetItemString(i,'texto') + '" '
	else
		modstr = 'gr_1.' + dw_2.GetItemString(i,'campo') + '.Label="' + dw_2.GetItemString(i,'texto') + '" '
	end if
	modstr = modstr + 'gr_1.' + dw_2.GetItemString(i,'campo') + '.dispAttr.font.face="' + dw_2.GetItemString(i,'fuente') + '" '
	modstr = modstr + 'gr_1.' + dw_2.GetItemString(i,'campo') + '.dispAttr.font.height="' + dw_2.GetItemString(i,'tamano') + '" '
	modstr = modstr + 'gr_1.' + dw_2.GetItemString(i,'campo') + '.dispAttr.textcolor="' + dw_2.GetItemString(i,'color') + '" '
	if i > 1 then
		modstr = modstr + 'gr_1.' + dw_2.GetItemString(i,'campo') + '.LabeldispAttr.font.height="' + dw_2.GetItemString(i,'tamano') + '" ' + &
		'gr_1.' + dw_2.GetItemString(i,'campo') + '.LabeldispAttr.font.face="' + dw_2.GetItemString(i,'fuente') + '" ' + &
		'gr_1.' + dw_2.GetItemString(i,'campo') + '.LabeldispAttr.textcolor="' + dw_2.GetItemString(i,'color') + '"'
	end if
	ret = idw_parm.Modify(modstr)
	if ret<> '' then
		messageBox('Error Modificando gráfica',ret)
	end if
next

Close (parent)

end event

type texto from singlelineedit within w_graph_title
integer x = 146
integer y = 204
integer width = 1253
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
borderstyle borderstyle = stylelowered!
end type

event modified;choose case ddplb_1.Text
	case 'Título'
		dw_2.SetItem(1,'texto', this.Text)
	case 'Categoría'
		dw_2.SetItem(2,'texto', this.Text)
	case 'Valores'
		dw_2.SetItem(3,'texto', this.Text)
	case 'Series'
		dw_2.SetItem(4,'texto', this.Text)
end choose

end event

type fuente from listbox within w_graph_title
integer x = 242
integer y = 548
integer width = 599
integer height = 452
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string s_fuente
s_fuente = fuente.SelectedItem()
texto.facename = s_fuente
sle_fuente.text = s_fuente
choose case ddplb_1.Text
	case 'Título'
		dw_2.SetItem(1,'fuente', s_fuente)
	case 'Categoría'
		dw_2.SetItem(2,'fuente', s_fuente)
	case 'Valores'
		dw_2.SetItem(3,'fuente', s_fuente)
	case 'Series'
		dw_2.SetItem(4,'fuente', s_fuente)
end choose

end event

type sle_fuente from singlelineedit within w_graph_title
integer x = 242
integer y = 456
integer width = 599
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type ftaman from listbox within w_graph_title
integer x = 859
integer y = 548
integer width = 270
integer height = 456
integer taborder = 240
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
string item[] = {"8","9","10","11","12","14","16","18","20","22","24","26","28","36","48","72"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;texto.textsize = Integer(this.SelectedItem())* - 1
sle_tamano.text = string(Integer(this.SelectedItem()))

sle_fuente.text = fuente.SelectedItem()
choose case ddplb_1.Text
	case 'Título'
		dw_2.SetItem(1,'tamano', sle_tamano.text)
	case 'Categoría'
		dw_2.SetItem(2,'tamano', sle_tamano.text)
	case 'Valores'
		dw_2.SetItem(3,'tamano', sle_tamano.text)
	case 'Series'
		dw_2.SetItem(4,'tamano', sle_tamano.text)
end choose


end event

type sle_tamano from statictext within w_graph_title
integer x = 859
integer y = 456
integer width = 270
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_graph_title
boolean visible = false
integer x = 1211
integer y = 16
integer width = 603
integer height = 136
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_atr_fonts"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddplb_1 from dropdownpicturelistbox within w_graph_title
integer x = 151
integer y = 44
integer width = 585
integer height = 384
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Título","Categoría","Valores","Series"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,1,1,1}
long picturemaskcolor = 536870912
end type

event selectionchanged;choose case ddplb_1.Text
	case 'Título'
		texto.Text = dw_2.GetItemString(1,'texto')
		sle_fuente.Text = dw_2.GetItemString(1,'fuente')
		sle_tamano.Text = dw_2.GetItemString(1,'tamano')
		sle_color.BackColor = long(dw_2.GetItemString(1,'color'))
	case 'Categoría'
		texto.Text = dw_2.GetItemString(2,'texto')
		sle_fuente.Text = dw_2.GetItemString(2,'fuente')
		sle_tamano.Text = dw_2.GetItemString(2,'tamano')
		sle_color.BackColor = long(dw_2.GetItemString(2,'color'))
	case 'Valores'
		texto.Text = dw_2.GetItemString(3,'texto')
		sle_fuente.Text = dw_2.GetItemString(3,'fuente')
		sle_tamano.Text = dw_2.GetItemString(3,'tamano')
		sle_color.BackColor = long(dw_2.GetItemString(3,'color'))
	case 'Series'
		texto.Text = dw_2.GetItemString(4,'texto')
		sle_fuente.Text = dw_2.GetItemString(4,'fuente')
		sle_tamano.Text = dw_2.GetItemString(4,'tamano')
		sle_color.BackColor = long(dw_2.GetItemString(4,'color'))
end choose

texto.facename = sle_fuente.Text
texto.textsize = Integer(sle_tamano.Text)* -1
texto.textcolor = sle_color.BackColor

end event

type dw_2 from datawindow within w_graph_title
boolean visible = false
integer x = 1221
integer y = 168
integer width = 590
integer height = 140
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_atr_fonts"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type st_1 from statictext within w_graph_title
integer x = 1152
integer y = 396
integer width = 174
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Color"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_graph_title
integer x = 137
integer y = 352
integer width = 1353
integer height = 712
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fuente"
end type

type sle_color from statictext within w_graph_title
integer x = 1147
integer y = 456
integer width = 201
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;long ll_color_hold, ll_color, ll_customcolors[]
string ls_new_color

ChooseColor(ll_color, ll_customcolors[] ) 
sle_color.BackColor = ll_color
texto.TextColor = ll_color
choose case ddplb_1.Text
	case 'Título'
		dw_2.SetItem(1,'color', string(ll_color))
	case 'Categoría'
		dw_2.SetItem(2,'color', string(ll_color))
	case 'Valores'
		dw_2.SetItem(3,'color', string(ll_color))
	case 'Series'
		dw_2.SetItem(4,'color', string(ll_color))
end choose
end event

