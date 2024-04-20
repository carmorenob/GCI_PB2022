$PBExportHeader$w_ripsdetalle_desagrega.srw
forward
global type w_ripsdetalle_desagrega from window
end type
type pb_guardar from picturebutton within w_ripsdetalle_desagrega
end type
type st_nusu from statictext within w_ripsdetalle_desagrega
end type
type dw_lugara from datawindow within w_ripsdetalle_desagrega
end type
type st_7 from statictext within w_ripsdetalle_desagrega
end type
type st_6 from statictext within w_ripsdetalle_desagrega
end type
type st_5 from statictext within w_ripsdetalle_desagrega
end type
type st_4 from statictext within w_ripsdetalle_desagrega
end type
type st_3 from statictext within w_ripsdetalle_desagrega
end type
type st_2 from statictext within w_ripsdetalle_desagrega
end type
type st_1 from statictext within w_ripsdetalle_desagrega
end type
type pb_ins from picturebutton within w_ripsdetalle_desagrega
end type
type pb_borrar from picturebutton within w_ripsdetalle_desagrega
end type
type pb_cerrar from picturebutton within w_ripsdetalle_desagrega
end type
type pb_cancel from picturebutton within w_ripsdetalle_desagrega
end type
type dw_deta from datawindow within w_ripsdetalle_desagrega
end type
end forward

global type w_ripsdetalle_desagrega from window
integer width = 3232
integer height = 1512
boolean titlebar = true
string title = "Desagrega Detalle de Rips"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_guardar pb_guardar
st_nusu st_nusu
dw_lugara dw_lugara
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
pb_ins pb_ins
pb_borrar pb_borrar
pb_cerrar pb_cerrar
pb_cancel pb_cancel
dw_deta dw_deta
end type
global w_ripsdetalle_desagrega w_ripsdetalle_desagrega

type variables
st_deta_rips st_rec
end variables

on w_ripsdetalle_desagrega.create
this.pb_guardar=create pb_guardar
this.st_nusu=create st_nusu
this.dw_lugara=create dw_lugara
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.pb_ins=create pb_ins
this.pb_borrar=create pb_borrar
this.pb_cerrar=create pb_cerrar
this.pb_cancel=create pb_cancel
this.dw_deta=create dw_deta
this.Control[]={this.pb_guardar,&
this.st_nusu,&
this.dw_lugara,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.pb_ins,&
this.pb_borrar,&
this.pb_cerrar,&
this.pb_cancel,&
this.dw_deta}
end on

on w_ripsdetalle_desagrega.destroy
destroy(this.pb_guardar)
destroy(this.st_nusu)
destroy(this.dw_lugara)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_ins)
destroy(this.pb_borrar)
destroy(this.pb_cerrar)
destroy(this.pb_cancel)
destroy(this.dw_deta)
end on

event open;st_rec=message.powerobjectparm
if st_rec.contabil='C' then 
	pb_guardar.enabled=false
	pb_ins.enabled=false
	pb_borrar.enabled=false
	pb_cerrar.enabled=false
else
	pb_guardar.enabled=true
	pb_ins.enabled=true
	pb_cerrar.enabled=true
	pb_borrar.enabled=true
end if

if dw_deta.retrieve(st_rec.nrad,st_rec.clug,st_rec.tipo,st_rec.cemp,st_rec.ccont)=0 then
	dw_lugara.retrieve()
	integer recorre,fila
	for recorre= 1 to dw_lugara.rowcount()
		 fila=dw_deta.InsertRow(0)
		 dw_deta.setitem(fila,'num_radicacion',st_rec.nrad)
		 dw_deta.setitem(fila,'clugar',st_rec.clug)
		 dw_deta.setitem(fila,'tipo',st_rec.tipo)
		 dw_deta.setitem(fila,'cemp',st_rec.cemp)
		 dw_deta.setitem(fila,'ccontrato',st_rec.ccont)
		 dw_deta.setitem(fila,'usuario',usuario)
		 dw_deta.setitem(fila,'codlugar',dw_lugara.getitemstring(recorre,'codlugar'))
		 dw_deta.setitem(fila,'lugar_descripcion',dw_lugara.getitemstring(recorre,'descripcion'))		 
		 dw_deta.setitem(fila,'contabil',st_rec.contabil)
		 dw_deta.setitem(fila,'capita',st_rec.nusuario)
	next	
else
	for recorre= 1 to dw_deta.rowcount()
		 dw_deta.setitem(recorre,'contabil',st_rec.contabil)
		 dw_deta.setitem(recorre,'capita',st_rec.nusuario)
	next	

end if
	
st_3.text=st_rec.eapb
st_5.text=st_rec.ncont
st_1.text=string(st_rec.capita,'#,###.00')
st_nusu.text=string(st_rec.nusuario,'#,###')
end event

type pb_guardar from picturebutton within w_ripsdetalle_desagrega
integer x = 1536
integer y = 1248
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Temporal"
end type

event clicked;int ll_result

ll_result=dw_deta.update(true,false)
if ll_result=-1 then
	rollback;
else
	commit;
end if
end event

type st_nusu from statictext within w_ripsdetalle_desagrega
integer x = 2501
integer y = 88
integer width = 549
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_lugara from datawindow within w_ripsdetalle_desagrega
boolean visible = false
integer x = 41
integer y = 1236
integer width = 686
integer height = 80
integer taborder = 20
string title = "none"
string dataobject = "dw_lugares_activos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_7 from statictext within w_ripsdetalle_desagrega
integer x = 2126
integer y = 88
integer width = 366
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NRO USUARIOS"
boolean focusrectangle = false
end type

type st_6 from statictext within w_ripsdetalle_desagrega
integer x = 2126
integer y = 16
integer width = 361
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "VALOR CAPITA"
boolean focusrectangle = false
end type

type st_5 from statictext within w_ripsdetalle_desagrega
integer x = 343
integer y = 88
integer width = 1737
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
boolean focusrectangle = false
end type

type st_4 from statictext within w_ripsdetalle_desagrega
integer x = 55
integer y = 96
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
string text = "CONTRATO"
boolean focusrectangle = false
end type

type st_3 from statictext within w_ripsdetalle_desagrega
integer x = 343
integer y = 16
integer width = 1737
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ripsdetalle_desagrega
integer x = 55
integer y = 12
integer width = 251
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EAPB"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ripsdetalle_desagrega
integer x = 2501
integer y = 16
integer width = 549
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ins from picturebutton within w_ripsdetalle_desagrega
integer x = 1184
integer y = 1248
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Inserta Registro"
end type

event clicked;long fila,recorre,monto,tot
fila =dw_deta.InsertRow(0)
dw_deta.setitem(fila,'num_radicacion',st_rec.nrad)
dw_deta.setitem(fila,'clugar',st_rec.clug)
dw_deta.setitem(fila,'tipo',st_rec.tipo)
dw_deta.setitem(fila,'cemp',st_rec.cemp)
dw_deta.setitem(fila,'ccontrato',st_rec.ccont)
dw_deta.setitem(fila,'usuario',usuario)
dw_deta.setitem(fila,'contabil',st_rec.contabil)
dw_deta.setitem(fila,'capita',st_rec.nusuario)
dw_deta.ScrolltoRow(fila)

end event

type pb_borrar from picturebutton within w_ripsdetalle_desagrega
integer x = 1362
integer y = 1248
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Registro"
end type

event clicked;if dw_deta.rowcount()=0 then return 
dw_deta.deleterow(dw_deta.getrow())
end event

type pb_cerrar from picturebutton within w_ripsdetalle_desagrega
event mousemove pbm_mousemove
integer x = 1874
integer y = 1248
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        "
boolean default = true
boolean originalsize = true
string picturename = "cerrar.gif"
string disabledname = "d_cerrar.gif"
alignment htextalign = left!
string powertiptext = "Guarda Definitivo"
end type

event clicked;if dw_deta.getitemnumber(1,'valores') <>0 then
		messagebox("Error","Los valores desagregados no corresponde al Total de la población entregada")
	return
end if

int ll_result
ll_result=dw_deta.update(true,false)
if ll_result=-1 then
	rollback;
else
	commit;
end if
closewithreturn(parent,'ok')
end event

type pb_cancel from picturebutton within w_ripsdetalle_desagrega
event mousemove pbm_mousemove
integer x = 1701
integer y = 1248
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        "
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)
end event

type dw_deta from datawindow within w_ripsdetalle_desagrega
integer x = 41
integer y = 176
integer width = 3131
integer height = 1036
integer taborder = 10
string title = "none"
string dataobject = "dw_ripsradicadet_dist"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

