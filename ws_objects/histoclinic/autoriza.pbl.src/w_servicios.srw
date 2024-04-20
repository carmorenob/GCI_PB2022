$PBExportHeader$w_servicios.srw
forward
global type w_servicios from window
end type
type st_1 from statictext within w_servicios
end type
type rb_3 from radiobutton within w_servicios
end type
type rb_2 from radiobutton within w_servicios
end type
type rb_1 from radiobutton within w_servicios
end type
type pb_1 from picturebutton within w_servicios
end type
type pb_2 from picturebutton within w_servicios
end type
type dw_1 from datawindow within w_servicios
end type
end forward

global type w_servicios from window
integer width = 2971
integer height = 1372
boolean titlebar = true
string title = "Servicios"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
pb_2 pb_2
dw_1 dw_1
end type
global w_servicios w_servicios

type variables
st_autoriza st_p

end variables

on w_servicios.create
this.st_1=create st_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.pb_1,&
this.pb_2,&
this.dw_1}
end on

on w_servicios.destroy
destroy(this.st_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_1)
end on

event open;st_p = Message.PowerObjectParm
dw_1.Retrieve(st_p.contador, st_p.clugar)

int fcpo
fcpo =dw_1.InsertRow(0)
dw_1.setItem(fcpo,'codproced',st_p.codproced)
dw_1.setItem(fcpo,'solicitada',1)
string des_pro
SELECT  Proced.Descripcion into :des_pro
FROM Proced
where Proced.CodProced=:st_p.codproced;
dw_1.setItem(fcpo,'descripcion',des_pro)
dw_1.setItem(fcpo,'nsolicitud',0)
dw_1.setItem(fcpo,'item',0)
commit;
end event

type st_1 from statictext within w_servicios
integer x = 55
integer y = 16
integer width = 270
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtro por"
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_servicios
integer x = 334
integer y = 16
integer width = 238
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;dw_1.SetFilter("")
dw_1.Filter()
if dw_1.RowCount() = 0 then Return -1
end event

type rb_2 from radiobutton within w_servicios
integer x = 631
integer y = 16
integer width = 475
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos"
end type

event clicked;dw_1.SetFilter("isnull( c_medica)")
dw_1.Filter()
if dw_1.RowCount() = 0 then Return -1
end event

type rb_1 from radiobutton within w_servicios
integer x = 1157
integer y = 16
integer width = 475
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medicamentos"
end type

event clicked;dw_1.SetFilter("isnull( codproced)")
dw_1.Filter()
if dw_1.RowCount() = 0 then Return -1
end event

type pb_1 from picturebutton within w_servicios
integer x = 1312
integer y = 1104
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Solicitar nueva autorización"
end type

event clicked;close(parent)

end event

type pb_2 from picturebutton within w_servicios
integer x = 1147
integer y = 1104
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Solicitar nueva autorización"
end type

event clicked;long f, fila
string valor

f = dw_1.find("selec = 1",1,dw_1.rowCount())
do while f > 0
	fila = st_p.dw_cpo.Find("nsolicitud="+string(dw_1.getItemNumber(f,'nsolicitud'))+ " and item_os="+string(dw_1.getItemNumber(f,'item')),1,st_p.dw_cpo.rowCount())
	if fila = 0 then
		fila = st_p.dw_cpo.InsertRow(0)
		valor = st_p.dw_cpo.describe("evaluate('max(item)',0)")
		st_p.dw_cpo.setItem(fila,'id_solicitud',st_p.dw_au.getItemNumber(1,'id_solicitud'))
		st_p.dw_cpo.setItem(fila,'item',long(valor) + 1)
		st_p.dw_cpo.setItem(fila,'contador',dw_1.getItemNumber(f,'contador'))
		st_p.dw_cpo.setItem(fila,'clugar',clugar)
		st_p.dw_cpo.setItem(fila,'nsolicitud',dw_1.getItemNumber(f,'nsolicitud'))
		st_p.dw_cpo.setItem(fila,'clugar_os',dw_1.getItemString(f,'clugar'))
		st_p.dw_cpo.setItem(fila,'item_os',dw_1.getItemNumber(f,'item'))
		st_p.dw_cpo.setItem(fila,'solicitada',dw_1.getItemNumber(f,'solicitada'))
		st_p.dw_cpo.setItem(fila,'c_medica',dw_1.getItemString(f,'c_medica'))
		st_p.dw_cpo.setItem(fila,'codproced',dw_1.getItemString(f,'codproced'))
		st_p.dw_cpo.setItem(fila,'descripcion',dw_1.getItemString(f,'descripcion'))
		st_p.dw_cpo.setItem(fila,'medicamento',dw_1.getItemString(f,'medicamento'))
		st_p.dw_cpo.setItem(fila,'usuario',usuario)
		st_p.dw_cpo.setItem(fila,'estado','A')
		st_p.dw_cpo.setItem(fila,'numero_qx',dw_1.getItemnumber(f,'numero_qx')) 
		st_p.dw_cpo.setItem(fila,'clugar_qx',dw_1.getItemString(f,'clugar_qx'))
		st_p.dw_cpo.setItem(fila,'consecutivo_qx',dw_1.getItemnumber(f,'consecutivo_qx'))
		w_solicita_aut.ib_cambio = TRUE
	end if
	dw_1.setItem(f,'selec',0)
	f = dw_1.find("selec = 1",1,dw_1.rowCount())
loop
close(parent)

end event

type dw_1 from datawindow within w_servicios
integer x = 46
integer y = 108
integer width = 2830
integer height = 964
integer taborder = 10
string title = "none"
string dataobject = "dw_servicios"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransOBject(SQLCA)

end event

event clicked;if dwo.name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

