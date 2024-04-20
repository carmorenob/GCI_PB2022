$PBExportHeader$w_pyp_subprogram.srw
forward
global type w_pyp_subprogram from window
end type
type dw_prog from datawindow within w_pyp_subprogram
end type
type st_1 from statictext within w_pyp_subprogram
end type
type cb_6 from commandbutton within w_pyp_subprogram
end type
type cb_5 from commandbutton within w_pyp_subprogram
end type
type st_4 from statictext within w_pyp_subprogram
end type
type sle_1 from singlelineedit within w_pyp_subprogram
end type
type st_3 from statictext within w_pyp_subprogram
end type
type st_2 from statictext within w_pyp_subprogram
end type
type dw_2 from datawindow within w_pyp_subprogram
end type
type cb_4 from commandbutton within w_pyp_subprogram
end type
type cb_3 from commandbutton within w_pyp_subprogram
end type
type cb_2 from commandbutton within w_pyp_subprogram
end type
type cb_1 from commandbutton within w_pyp_subprogram
end type
type dw_3 from datawindow within w_pyp_subprogram
end type
type dw_1 from datawindow within w_pyp_subprogram
end type
end forward

global type w_pyp_subprogram from window
integer width = 3474
integer height = 1604
boolean titlebar = true
string title = "PyP - Subprogramas"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Form!"
dw_prog dw_prog
st_1 st_1
cb_6 cb_6
cb_5 cb_5
st_4 st_4
sle_1 sle_1
st_3 st_3
st_2 st_2
dw_2 dw_2
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_3 dw_3
dw_1 dw_1
end type
global w_pyp_subprogram w_pyp_subprogram

type variables
datawindowchild hija,idw_prog
string tipo_col,anterior,orden
end variables

on w_pyp_subprogram.create
this.dw_prog=create dw_prog
this.st_1=create st_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.st_4=create st_4
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_2=create dw_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_3=create dw_3
this.dw_1=create dw_1
this.Control[]={this.dw_prog,&
this.st_1,&
this.cb_6,&
this.cb_5,&
this.st_4,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.dw_2,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_3,&
this.dw_1}
end on

on w_pyp_subprogram.destroy
destroy(this.dw_prog)
destroy(this.st_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.st_4)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_3)
destroy(this.dw_1)
end on

event resize;dw_3.resize(newwidth - 50 , newheight - 620)
cb_1.x=(newwidth - 1800)/2
cb_1.y=newheight - 100
cb_2.x=(newwidth - 1800)/2 +300
cb_2.y=newheight - 100
cb_3.x=(newwidth - 1800)/2 +600
cb_3.y=newheight - 100
cb_4.x=(newwidth - 1800)/2 +900
cb_4.y=newheight - 100
cb_5.x=(newwidth - 1800)/2 +1200
cb_5.y=newheight - 100
cb_6.x=(newwidth - 1800)/2 +1500
cb_6.y=newheight - 100

end event

type dw_prog from datawindow within w_pyp_subprogram
integer x = 37
integer y = 304
integer width = 1792
integer height = 144
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_pypprograma"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild(describe("#1.name"),idw_prog)
idw_prog.settransobject(sqlca)
idw_prog.retrieve()
idw_prog.setfilter('#1=""')
idw_prog.filter()
insertrow(1)
end event

event itemchanged;this.accepttext()
dw_3.retrieve(dw_1.getitemstring(1,1),dw_2.getitemstring(1,1),getitemstring(1,1))




end event

type st_1 from statictext within w_pyp_subprogram
integer x = 41
integer y = 460
integer width = 709
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Utilize click Contrario para Menu"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_pyp_subprogram
integer x = 2917
integer y = 1408
integer width = 302
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Im&portar"
end type

event clicked;string docname, named
long value
value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
IF value = 1 THEN
	value=dw_3.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
end event

type cb_5 from commandbutton within w_pyp_subprogram
integer x = 2583
integer y = 1412
integer width = 302
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;open(w_export)
if export="!" then return
string docname, named
integer value
value = GetFileSaveName("Exportar como", docname, named,"*.TXT",export) 
IF value = 1 THEN
	dw_3.saveas(docname,exten,encabez)
end if
end event

type st_4 from statictext within w_pyp_subprogram
integer x = 1952
integer y = 264
integer width = 768
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Puede utilizar el caracter ~'%~' como comodin siempre y cuando el campo a buscar no sea numérico"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_pyp_subprogram
integer x = 1966
integer y = 184
integer width = 658
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;if trim(this.text)="" then return
if st_3.text="" then return
long donde
choose case mid(tipo_col,1,4)
	case "char"
		donde=dw_3.find("lower("+st_3.text+") like '"+lower(this.text)+"'",1,dw_3.rowcount())
	case "numb"
		if not isnumber(this.text) then
			messagebox("Error","El campo por el que va a buscar es numérico y no acepta caracteres especiales")
			return
		else
			donde=dw_3.find(st_3.text+"="+this.text,1,dw_3.rowcount())
		end if
	case "date"
end choose
if donde=0 then
	messagebox("Atención","No se encontró la cadena de caracteres buscada")
else
	dw_3.scrolltorow(donde)
end if
end event

type st_3 from statictext within w_pyp_subprogram
integer x = 1966
integer y = 108
integer width = 663
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_pyp_subprogram
integer x = 1975
integer y = 52
integer width = 270
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por:"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_pyp_subprogram
integer x = 32
integer y = 164
integer width = 2249
integer height = 148
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_pypareatem"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
idw_prog.setfilter("#1='"+dw_1.getitemstring(1,1)+"' and #2='"+data+"'")
idw_prog.filter()
dw_prog.setitem(1,1,'')
dw_3.reset()
end event

event constructor;settransobject(sqlca)
insertrow(1)
getchild(describe("#1.name"),hija)
hija.settransobject(SQLCA)
hija.retrieve()
hija.setfilter("#1=''")
hija.filter()
end event

type cb_4 from commandbutton within w_pyp_subprogram
integer x = 2245
integer y = 1412
integer width = 302
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Guardar"
end type

event clicked;if dw_3.update()<1 then
	rollback;
else
	commit;
end if
end event

type cb_3 from commandbutton within w_pyp_subprogram
integer x = 1893
integer y = 1412
integer width = 302
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Refrescar"
end type

event clicked;dw_prog.triggerevent(itemchanged!)
end event

type cb_2 from commandbutton within w_pyp_subprogram
integer x = 1541
integer y = 1412
integer width = 302
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Borrar"
end type

event clicked;long fila
fila=dw_3.getrow()
if fila<1 then return
dw_3.deleterow(0)
end event

type cb_1 from commandbutton within w_pyp_subprogram
integer x = 1189
integer y = 1412
integer width = 302
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Insertar"
end type

event clicked;long donde
if isnull(dw_1.getitemstring(1,1)) then
	messagebox("Atención","Seleccione primero una actividad")
	return
end if
if isnull(dw_2.getitemstring(1,1)) or dw_2.getitemstring(1,1)="" then
	messagebox("Atención","Seleccione primero un area temática")
	return
end if
if isnull(dw_prog.getitemstring(1,1)) or dw_prog.getitemstring(1,1)="" then
	messagebox("Atención","Seleccione primero un Programa")
	return
end if
donde=dw_3.insertrow(0)
dw_3.scrolltorow(donde)
dw_3.setitem(donde,1,dw_1.getitemstring(1,1))
dw_3.setitem(donde,2,dw_2.getitemstring(1,1))
dw_3.setitem(donde,3,dw_prog.getitemstring(1,1))

end event

type dw_3 from datawindow within w_pyp_subprogram
integer x = 41
integer y = 516
integer width = 3360
integer height = 852
integer taborder = 20
string title = "none"
string dataobject = "dw_pyp_subprograma"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;if dwo.type="column" then 
	tipo_col=this.describe(dwo.name+".coltype")
	st_3.text=dwo.name
else
	tipo_col=""
	st_3.text=""
end if
end event

event rowfocuschanged;if getrow()<1 then return
selectrow(0,false)
selectrow(getrow(),true)

end event

event clicked;if dwo.type <> "text" then 
	if dwo.type="column" then
		tipo_col=this.describe(dwo.name+".coltype")
		st_3.text=dwo.name
	end if
	return
end if
string cual,ojo,ss
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior=cual then
	if orden="A" then
		orden="D"
	else
		orden="A"
	end if
else
	orden="A"
end if
this.setsort(cual+" "+orden)
this.sort()
anterior=cual
end event

event rbuttondown;if isnull(dwo) then return
if dwo.type<>"column" and dwo.type<>"compute" and dwo.type<>"datawindow" then return
g_dw_xabuscar=this
g_dwo=dwo
if dwo.type<>"datawindow" then 
	if row<>this.getrow() then this.scrolltorow(row)
	if this.getcolumnname()<>dwo.name then this.setcolumn(string(dwo.name))
end if
open(w_funcion_dw)
end event

event constructor;settransobject(sqlca)
end event

type dw_1 from datawindow within w_pyp_subprogram
integer x = 32
integer y = 24
integer width = 1829
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_pypact"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
hija.setfilter("#1='"+this.getitemstring(1,1)+"'")
idw_prog.setfilter("#1=''")
idw_prog.filter()
dw_2.setitem(1,1,"")
dw_prog.setitem(1,1,'')

dw_3.reset()
hija.filter()
hija.sort()
end event

event constructor;settransobject(sqlca)
insertrow(1)
end event

