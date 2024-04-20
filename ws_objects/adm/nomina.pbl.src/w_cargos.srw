$PBExportHeader$w_cargos.srw
forward
global type w_cargos from window
end type
type pb_4 from picturebutton within w_cargos
end type
type pb_3 from picturebutton within w_cargos
end type
type pb_2 from picturebutton within w_cargos
end type
type pb_1 from picturebutton within w_cargos
end type
type dw_1 from datawindow within w_cargos
end type
type dw_2 from datawindow within w_cargos
end type
end forward

global type w_cargos from window
integer width = 5170
integer height = 2072
boolean titlebar = true
string title = "Cargos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_cargos.ico"
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
dw_2 dw_2
end type
global w_cargos w_cargos

on w_cargos.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.dw_2=create dw_2
this.Control[]={this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_1,&
this.dw_2}
end on

on w_cargos.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
destroy(this.dw_2)
end on

event open;long il_new_fila,j

dw_1.retrieve()
dw_1.setredraw(false)
dw_2.setredraw(false)
dw_1.setfilter('isnull(codigo_cargo) or trim(codigo_cargo)=""')
dw_1.filter()
dw_1.sort()
for j=1 to dw_1.rowcount()
	il_new_fila=dw_2.insertrow(0)
	dw_2.setitem(il_new_fila,'cargo',dw_1.getitemstring(j,'cargo'))
	dw_2.setitem(il_new_fila,'nombre_cargo',dw_1.getitemstring(j,'nombre_cargo'))
	dw_2.setitem(il_new_fila,'tipo_cargo',dw_1.getitemstring(j,'tipo_cargo'))
	dw_2.setitem(il_new_fila,'perfil_ocup',dw_1.getitemstring(j,'perfil_ocup'))
	dw_2.setitem(il_new_fila,'estado',dw_1.getitemstring(j,'estado'))
	dw_2.setitem(il_new_fila,'codigo_cargo',dw_1.getitemstring(j,'codigo_cargo'))
	dw_2.setitem(il_new_fila,'tipo',dw_1.getitemstring(j,'tipo'))
	dw_2.event ue_llena_menu(il_new_fila,dw_1.getitemstring(j,'cargo'))
	dw_1.setfilter('isnull(codigo_cargo) or trim(codigo_cargo)=""')
	dw_1.filter()
	dw_1.sort()
next
dw_2.setredraw(true)
dw_1.setredraw(true)
end event

type pb_4 from picturebutton within w_cargos
integer x = 2601
integer y = 1812
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "puerta.gif"
string disabledname = "d_puerta.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_3 from picturebutton within w_cargos
integer x = 2423
integer y = 1812
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
end type

event clicked;if dw_1.AcceptText()=-1 then return -1
if dw_1.update(true,false) = -1 then
	rollback;
	Return -1
end if
commit;
dw_1.resetupdate()
Return 0
end event

type pb_2 from picturebutton within w_cargos
integer x = 2245
integer y = 1812
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if isnull(dw_1.getitemstring(1,1)) then return
long fila
dw_1.SetColumn(1)
fila = dw_1.InsertRow(0)
dw_1.scrolltoRow(fila)
dw_1.setFocus()

end event

type pb_1 from picturebutton within w_cargos
integer x = 2066
integer y = 1812
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $n"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if messageBox('Aviso','Desea remover el cargo?',QUESTION!,YESNO!) = 1 then
	dw_1.DeleteRow(dw_1.GetRow())
	if dw_1.update() = -1 then
		rollback;
		dw_1.Retrieve()
	end if
end if

end event

type dw_1 from datawindow within w_cargos
integer x = 37
integer y = 32
integer width = 5029
integer height = 1728
integer taborder = 10
string title = "none"
string dataobject = "dw_cfg_cargo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_2 from datawindow within w_cargos
event type integer ue_llena_menu ( long p_fila_actual,  string p_padre )
integer x = 55
integer y = 1248
integer width = 2885
integer height = 44
integer taborder = 10
string title = "none"
string dataobject = "dw_tree_cargos"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer ue_llena_menu(long p_fila_actual, string p_padre);long j,k,actual

actual=p_fila_actual
dw_1.setfilter("codigo_cargo='"+p_padre+"'")
dw_1.filter()
dw_1.sort()
for j=1 to dw_1.rowcount()
	p_fila_actual += 1
	k=insertrow(p_fila_actual )
	dw_2.setitem(k,'cargo',dw_1.getitemstring(j,'cargo'))
	dw_2.setitem(k,'nombre_cargo',dw_1.getitemstring(j,'nombre_cargo'))
	dw_2.setitem(k,'tipo_cargo',dw_1.getitemstring(j,'tipo_cargo'))
	dw_2.setitem(k,'perfil_ocup',dw_1.getitemstring(j,'perfil_ocup'))
	dw_2.setitem(k,'estado',dw_1.getitemstring(j,'estado'))
	dw_2.setitem(k,'codigo_cargo',p_padre)
	dw_2.setitem(k,'tipo',dw_1.getitemstring(j,'tipo'))
	setdetailheight(2,3,0)
	event ue_llena_menu(p_fila_actual ,dw_1.getitemstring(j,'cargo'))
	dw_1.setfilter("codigo_cargo='"+p_padre+"'")
	dw_1.filter()
	dw_1.sort()
next
return 1
end event

