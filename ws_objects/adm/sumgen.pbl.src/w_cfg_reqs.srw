$PBExportHeader$w_cfg_reqs.srw
forward
global type w_cfg_reqs from window
end type
type dw_3 from datawindow within w_cfg_reqs
end type
type dw_tcont from datawindow within w_cfg_reqs
end type
type pb_1 from picturebutton within w_cfg_reqs
end type
type pb_19 from picturebutton within w_cfg_reqs
end type
type pb_18 from picturebutton within w_cfg_reqs
end type
type dw_2 from datawindow within w_cfg_reqs
end type
type dw_1 from datawindow within w_cfg_reqs
end type
type gb_1 from groupbox within w_cfg_reqs
end type
type gb_2 from groupbox within w_cfg_reqs
end type
end forward

global type w_cfg_reqs from window
integer width = 3406
integer height = 1452
boolean titlebar = true
string title = "Requisitos x Tipo Contrato"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_trequi.ico"
dw_3 dw_3
dw_tcont dw_tcont
pb_1 pb_1
pb_19 pb_19
pb_18 pb_18
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_cfg_reqs w_cfg_reqs

on w_cfg_reqs.create
this.dw_3=create dw_3
this.dw_tcont=create dw_tcont
this.pb_1=create pb_1
this.pb_19=create pb_19
this.pb_18=create pb_18
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_3,&
this.dw_tcont,&
this.pb_1,&
this.pb_19,&
this.pb_18,&
this.dw_2,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_cfg_reqs.destroy
destroy(this.dw_3)
destroy(this.dw_tcont)
destroy(this.pb_1)
destroy(this.pb_19)
destroy(this.pb_18)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type dw_3 from datawindow within w_cfg_reqs
integer x = 1463
integer y = 280
integer width = 1847
integer height = 988
integer taborder = 20
string title = "none"
string dataobject = "dw_contra_requisitos_elegir"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

event clicked;setitem(row,'tipo',dw_2.GetItemString(dw_2.GetRow(),'tipo'))
end event

type dw_tcont from datawindow within w_cfg_reqs
integer x = 27
integer y = 24
integer width = 1367
integer height = 148
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_ctr"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
insertrow(1)
end event

event itemchanged;dw_1.Retrieve(data)

end event

type pb_1 from picturebutton within w_cfg_reqs
event mousemove pbm_mousemove
integer x = 1486
integer y = 68
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Registro"
end type

event clicked;string ls_tipo

if dw_1.rowcount()>0 then
	ls_tipo=dw_1.GetItemString(dw_1.GetRow(),'tipo')

	delete from contra_plantilla_req
	where tipo=:ls_tipo;
	if sqlca.sqlcode=-1 then
		messagebox("Error Borrando contra_plantilla_req",sqlca.sqlerrtext)
		rollback;
		return -1
	end if
	
	int l_i,l_fila
	
	dw_3.setfilter('selec=1')
	dw_3.filter()
	for  l_i = 1 to dw_3.rowcount()		
		l_fila=dw_2.insertrow(0)
		dw_2.setitem(l_fila,"tipo",ls_tipo)
		dw_2.setitem(l_fila ,"codigo",dw_3.getitemstring(l_i,'codigo'))
	next	
	dw_3.setfilter('')
	dw_3.filter()
	if dw_2.Update() = -1 then
		Rollback;
		Return -1
	end if
	commit;
	Return 0
	dw_3.retrieve(ls_tipo)
end if
end event

type pb_19 from picturebutton within w_cfg_reqs
event mousemove pbm_mousemove
string tag = "Borrar Registro"
boolean visible = false
integer x = 1897
integer y = 68
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Registro"
end type

event clicked;dw_2.DeleteRow(0)

end event

type pb_18 from picturebutton within w_cfg_reqs
event mousemove pbm_mousemove
boolean visible = false
integer x = 1751
integer y = 68
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Registro"
end type

event clicked;long fila
fila = dw_2.InsertRow(0)
dw_2.SetItem(fila,'tipo',dw_1.GetItemString(dw_1.GetRow(),'tipo'))
dw_2.ScrollToRow(fila)

end event

type dw_2 from datawindow within w_cfg_reqs
boolean visible = false
integer x = 2363
integer y = 96
integer width = 219
integer height = 120
integer taborder = 20
string title = "none"
string dataobject = "dw_reqxtipo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

type dw_1 from datawindow within w_cfg_reqs
integer x = 82
integer y = 280
integer width = 1221
integer height = 988
integer taborder = 10
string title = "none"
string dataobject = "dw_ls_tipocontra"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_3.retrieve(GetItemString(GetRow(),'tipo'))
end event

type gb_1 from groupbox within w_cfg_reqs
integer x = 46
integer y = 204
integer width = 1321
integer height = 1096
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo de Contrato"
end type

type gb_2 from groupbox within w_cfg_reqs
integer x = 1399
integer y = 204
integer width = 1947
integer height = 1096
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Requerimientos"
end type

