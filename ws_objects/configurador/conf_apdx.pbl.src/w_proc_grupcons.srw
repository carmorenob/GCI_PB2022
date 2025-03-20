$PBExportHeader$w_proc_grupcons.srw
forward
global type w_proc_grupcons from window
end type
type tab_1 from tab within w_proc_grupcons
end type
type tp_1 from userobject within tab_1
end type
type dw_2 from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
dw_2 dw_2
end type
type tp_2 from userobject within tab_1
end type
type pb_5 from picturebutton within tp_2
end type
type pb_4 from picturebutton within tp_2
end type
type dw_3 from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_5 pb_5
pb_4 pb_4
dw_3 dw_3
end type
type tab_1 from tab within w_proc_grupcons
tp_1 tp_1
tp_2 tp_2
end type
type pb_3 from picturebutton within w_proc_grupcons
end type
type pb_2 from picturebutton within w_proc_grupcons
end type
type pb_1 from picturebutton within w_proc_grupcons
end type
type dw_1 from datawindow within w_proc_grupcons
end type
end forward

global type w_proc_grupcons from window
string tag = "Procedimientos de Grupos de Citas"
integer width = 3584
integer height = 1372
boolean titlebar = true
string title = "Procedimientos de Grupos de Citas"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_procitas.ico"
tab_1 tab_1
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_proc_grupcons w_proc_grupcons

type variables
datawindowchild dw_grupo,idw_fincon
end variables
on w_proc_grupcons.create
this.tab_1=create tab_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.tab_1,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_proc_grupcons.destroy
destroy(this.tab_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;dw_1.getchild("codgc",dw_grupo)
dw_grupo.settransobject(sqlca)
dw_grupo.retrieve()
dw_1.settransobject(SQLCA)
tab_1.tp_1.dw_2.settransobject(SQLCA)
tab_1.tp_2.dw_3.settransobject(SQLCA)
tab_1.tp_2.dw_3.getchild('cod_fina',idw_fincon)
idw_fincon.settransobject(sqlca)
idw_fincon.retrieve('%')
dw_1.insertrow(1)
end event

type tab_1 from tab within w_proc_grupcons
integer x = 41
integer y = 192
integer width = 3483
integer height = 1056
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3447
integer height = 928
long backcolor = 67108864
string text = "Generales"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tp_1.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tp_1.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tp_1
integer x = 32
integer y = 28
integer width = 3397
integer height = 868
integer taborder = 20
string title = "none"
string dataobject = "dw_proc_gr_con"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;tab_1.tp_2.dw_3.retrieve(getitemstring(currentrow,1),getitemstring(currentrow,2))
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3447
integer height = 928
long backcolor = 67108864
string text = "Finalidades"
long tabtextcolor = 33554432
string picturename = "contratos.ico"
long picturemaskcolor = 536870912
pb_5 pb_5
pb_4 pb_4
dw_3 dw_3
end type

on tp_2.create
this.pb_5=create pb_5
this.pb_4=create pb_4
this.dw_3=create dw_3
this.Control[]={this.pb_5,&
this.pb_4,&
this.dw_3}
end on

on tp_2.destroy
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.dw_3)
end on

type pb_5 from picturebutton within tp_2
string tag = "Borrar Finalidad"
integer x = 3287
integer y = 180
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Finalidad"
end type

event clicked;tab_1.tp_2.dw_3.deleterow(0)
end event

type pb_4 from picturebutton within tp_2
string tag = "Agrega Finalidad"
integer x = 3287
integer y = 44
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
string picturename = "insertar.GIF"
alignment htextalign = left!
string powertiptext = "insertar.GIF"
end type

event clicked;int fila

fila=dw_3.insertrow(0)
dw_3.setitem(fila,1,dw_1.getitemstring(1,1))
dw_3.setitem(fila,2,tab_1.tp_1.dw_2.getitemstring(tab_1.tp_1.dw_2.getrow(),2))
end event

type dw_3 from datawindow within tp_2
integer x = 41
integer y = 48
integer width = 3195
integer height = 804
integer taborder = 20
string title = "none"
string dataobject = "dw_progcita_finalidad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_3 from picturebutton within w_proc_grupcons
string tag = "&Guardar"
integer x = 2107
integer y = 24
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if tab_1.tp_1.dw_2.update()=-1 then
	rollback;
	dw_1.triggerevent(rowfocuschanged!)
else
	if tab_1.tp_2.dw_3.update()=-1 then
		rollback;
		dw_1.triggerevent(rowfocuschanged!)
	else
		commit;
	end if
end if
end event

type pb_2 from picturebutton within w_proc_grupcons
string tag = "&Borrar"
integer x = 1929
integer y = 24
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;tab_1.tp_1.dw_2.deleterow(0)
end event

type pb_1 from picturebutton within w_proc_grupcons
string tag = "&Agregar Procedimientos"
integer x = 1751
integer y = 24
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;open(w_busca_proc)

end event

type dw_1 from datawindow within w_proc_grupcons
integer x = 32
integer y = 32
integer width = 1591
integer height = 148
integer taborder = 10
string title = "none"
string dataobject = "dw_grupcita_combo"
boolean border = false
end type

event itemchanged;this.accepttext()
if not isnull(dw_grupo.getitemstring(dw_grupo.getrow(),"codaadx")) then
	messagebox("Atención","Este grupo es de apoyo diagnóstico, por lo tanto sus procedimientos se editan en el menú de APOYO DIAGNÓSTICO")
	tab_1.tp_1.dw_2.reset()
	tab_1.tp_2.dw_3.reset()
	pb_1.enabled=false
	tab_1.enabled=false
else
	tab_1.tp_1.dw_2.retrieve(this.getitemstring(1,1))
	pb_1.enabled=true	
	tab_1.enabled=true	
end if


end event

