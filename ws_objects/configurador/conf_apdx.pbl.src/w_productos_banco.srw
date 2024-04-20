$PBExportHeader$w_productos_banco.srw
forward
global type w_productos_banco from window
end type
type st_3 from statictext within w_productos_banco
end type
type pb_save from picturebutton within w_productos_banco
end type
type pb_del from picturebutton within w_productos_banco
end type
type pb_find from picturebutton within w_productos_banco
end type
type sle_1 from singlelineedit within w_productos_banco
end type
type st_2 from statictext within w_productos_banco
end type
type dw_4 from datawindow within w_productos_banco
end type
type st_1 from statictext within w_productos_banco
end type
type dw_2 from datawindow within w_productos_banco
end type
type dw_3 from datawindow within w_productos_banco
end type
type dw_1 from datawindow within w_productos_banco
end type
type gb_1 from groupbox within w_productos_banco
end type
end forward

global type w_productos_banco from window
integer width = 3113
integer height = 1880
boolean titlebar = true
string title = "Bancos de Fluidos - Productos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_prodban.ico"
st_3 st_3
pb_save pb_save
pb_del pb_del
pb_find pb_find
sle_1 sle_1
st_2 st_2
dw_4 dw_4
st_1 st_1
dw_2 dw_2
dw_3 dw_3
dw_1 dw_1
gb_1 gb_1
end type
global w_productos_banco w_productos_banco

type variables
datawindowchild hija,idw_tipo
string tipo_col,anterior,orden
end variables

on w_productos_banco.create
this.st_3=create st_3
this.pb_save=create pb_save
this.pb_del=create pb_del
this.pb_find=create pb_find
this.sle_1=create sle_1
this.st_2=create st_2
this.dw_4=create dw_4
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_3=create dw_3
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.pb_save,&
this.pb_del,&
this.pb_find,&
this.sle_1,&
this.st_2,&
this.dw_4,&
this.st_1,&
this.dw_2,&
this.dw_3,&
this.dw_1,&
this.gb_1}
end on

on w_productos_banco.destroy
destroy(this.st_3)
destroy(this.pb_save)
destroy(this.pb_del)
destroy(this.pb_find)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type st_3 from statictext within w_productos_banco
integer x = 59
integer y = 952
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código:"
boolean focusrectangle = false
end type

type pb_save from picturebutton within w_productos_banco
integer x = 928
integer y = 912
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
end type

event clicked;if dw_4.update(true,false)=-1 then return
commit;
dw_4.resetupdate()

end event

type pb_del from picturebutton within w_productos_banco
integer x = 773
integer y = 912
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_4.deleterow(0)
end event

type pb_find from picturebutton within w_productos_banco
integer x = 617
integer y = 912
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "buscar.gif"
alignment htextalign = left!
end type

event clicked;open(w_busca_proc)
if message.stringparm='' then return
sle_1.text=message.stringparm
sle_1.event modified()
end event

type sle_1 from singlelineedit within w_productos_banco
integer x = 233
integer y = 944
integer width = 343
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;if text='' or isnull(dw_1.getitemstring(1,1)) or isnull(dw_2.getitemstring(1,1)) or dw_3.rowcount()=0 then return
str_proc str
str=f_busca_cups(text,'F',1,'1')
if isnull(str.descripcion) then return -1
if dw_4.find('codproced="'+text+'"',1,dw_4.rowcount())>0 then return
long donde
donde=dw_4.insertrow(0)
dw_4.setitem(donde,'cod_banco',dw_1.getitemstring(1,1))
dw_4.setitem(donde,'cod_empaque',dw_2.getitemstring(1,1))
dw_4.setitem(donde,'nro',dw_3.getitemnumber(dw_3.getrow(),'nro'))
dw_4.setitem(donde,'codproced',text)
dw_4.setitem(donde,'descripcion',str.descripcion)
end event

type st_2 from statictext within w_productos_banco
integer x = 27
integer y = 176
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SubEmpaques:"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_productos_banco
integer x = 55
integer y = 1044
integer width = 2990
integer height = 616
integer taborder = 30
string title = "none"
string dataobject = "dw_banco_produc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type st_1 from statictext within w_productos_banco
integer x = 2053
integer y = 164
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

type dw_2 from datawindow within w_productos_banco
integer x = 1234
integer y = 24
integer width = 1193
integer height = 132
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_banco_empaque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
dw_3.reset()
dw_3.retrieve(dw_1.getitemstring(1,1),dw_2.getitemstring(1,1))
	
end event

event constructor;getchild('cod_empaque',hija)
hija.settransobject(SQLCA)
hija.retrieve()
hija.setfilter("#1='0'")
hija.filter()

settransobject(sqlca)
insertrow(1)
end event

type dw_3 from datawindow within w_productos_banco
integer x = 27
integer y = 236
integer width = 3058
integer height = 624
integer taborder = 20
string title = "none"
string dataobject = "dw_banco_subemp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;if dwo.type="column" then 
	tipo_col=this.describe(dwo.name+".coltype")
else
	tipo_col=""
end if
end event

event clicked;if dwo.type <> "text" then 
	if dwo.type="column" then
		tipo_col=describe(dwo.name+".coltype")
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
setsort(cual+" "+orden)
sort()
anterior=cual
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event rowfocuschanged;dw_4.reset()
if getrow()<1 then return
dw_4.retrieve(dw_1.getitemstring(1,1),dw_2.getitemstring(1,1),getitemnumber(getrow(),'nro'))
end event

event constructor;settransobject(sqlca)
getchild('cod_tsubempaq',idw_tipo)
idw_tipo.settransobject(sqlca)
end event

type dw_1 from datawindow within w_productos_banco
integer x = 27
integer y = 24
integer width = 1147
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_bancoapdx"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
hija.setfilter("#1='"+this.getitemstring(1,1)+"'")
idw_tipo.retrieve(data)
dw_2.setitem(1,1,"")
dw_3.reset()
dw_4.reset()
hija.filter()
hija.sort()
end event

event constructor;settransobject(sqlca)
insertrow(1)
end event

type gb_1 from groupbox within w_productos_banco
integer x = 32
integer y = 868
integer width = 3049
integer height = 816
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Productos:"
end type

