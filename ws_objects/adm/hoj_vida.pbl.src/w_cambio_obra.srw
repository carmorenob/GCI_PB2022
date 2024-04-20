$PBExportHeader$w_cambio_obra.srw
forward
global type w_cambio_obra from window
end type
type pb_9 from picturebutton within w_cambio_obra
end type
type pb_8 from picturebutton within w_cambio_obra
end type
type pb_7 from picturebutton within w_cambio_obra
end type
type pb_6 from picturebutton within w_cambio_obra
end type
type pb_5 from picturebutton within w_cambio_obra
end type
type pb_4 from picturebutton within w_cambio_obra
end type
type pb_3 from picturebutton within w_cambio_obra
end type
type pb_2 from picturebutton within w_cambio_obra
end type
type pb_1 from picturebutton within w_cambio_obra
end type
type pb_10 from picturebutton within w_cambio_obra
end type
type pb_11 from picturebutton within w_cambio_obra
end type
type dw_1 from datawindow within w_cambio_obra
end type
type dw_2 from datawindow within w_cambio_obra
end type
end forward

global type w_cambio_obra from window
integer width = 3323
integer height = 1224
boolean titlebar = true
string title = "Cambio de Obra"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "cargo.ico"
pb_9 pb_9
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
pb_10 pb_10
pb_11 pb_11
dw_1 dw_1
dw_2 dw_2
end type
global w_cambio_obra w_cambio_obra

type variables
datawindowchild dw_ccosto 
end variables

on w_cambio_obra.create
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.pb_10=create pb_10
this.pb_11=create pb_11
this.dw_1=create dw_1
this.dw_2=create dw_2
this.Control[]={this.pb_9,&
this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.pb_10,&
this.pb_11,&
this.dw_1,&
this.dw_2}
end on

on w_cambio_obra.destroy
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.pb_10)
destroy(this.pb_11)
destroy(this.dw_1)
destroy(this.dw_2)
end on

event open;string emplea
long cargo

IF w_obra.dw_3.rowcount()=0 THEN return
//dw_1.settransobject(SQLCA)
//dw_1.retrieve(w_obra.dw_3.getitemstring(w_obra.dw_3.getrow(),'tipodoc'),w_obra.dw_3.getitemString(w_obra.dw_3.getrow(),'documento'))
//if dw_1.getitemstring(1,'codrela')="0" then
if w_obra.dw_3.getitemstring(w_obra.dw_3.getrow(),'codrela') = '0' then
	dw_2.dataobject="dw_cambio_obra_contrata"
else
	dw_2.dataobject="dw_cambio_obra_planta"
end if
dw_2.settransobject(SQLCA)

dw_2.retrieve(w_obra.dw_3.getitemnumber(w_obra.dw_3.getrow(),'ano'),w_obra.dw_3.getitemnumber(w_obra.dw_3.getrow(),'mes'),w_obra.dw_3.getitemstring(w_obra.dw_3.getrow(),'tipodoc'),w_obra.dw_3.getitemString(w_obra.dw_3.getrow(),'documento'),w_obra.dw_3.getitemnumber(w_obra.dw_3.getrow(),'ncargo'))
dw_2.getchild("ccosto",dw_ccosto)
dw_ccosto.settransobject(SQLCA)
dw_ccosto.retrieve()
dw_ccosto.setfilter("coduf='"+dw_2.getitemstring(dw_2.getrow(),'ufuncional')+"'")
dw_ccosto.filter()

end event

type pb_9 from picturebutton within w_cambio_obra
event mousemove pbm_mousemove
integer x = 1202
integer y = 868
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrador.gif"
string disabledname = "d_borrador.gif"
vtextalign vtextalign = top!
string powertiptext = "Eliminar"
end type

event clicked;dw_2.deleterow(0);
end event

type pb_8 from picturebutton within w_cambio_obra
event mousemove pbm_mousemove
integer x = 1344
integer y = 868
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.gif"
string disabledname = "d_lupa.gif"
string powertiptext = "Buscar"
end type

type pb_7 from picturebutton within w_cambio_obra
event mousemove pbm_mousemove
integer x = 1061
integer y = 868
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
string powertiptext = "Guardar"
end type

event clicked;long cargo,anos,meses
string emple, tipodoc
anos = w_obra.dw_3.getitemnumber(w_obra.dw_3.getrow(),'ano')
meses = w_obra.dw_3.getitemnumber(w_obra.dw_3.getrow(),'mes')
emple = w_obra.dw_3.getitemstring(w_obra.dw_3.getrow(),'tipodoc')
tipodoc = w_obra.dw_3.getitemstring(w_obra.dw_3.getrow(),'documento')
cargo = w_obra.dw_3.getitemnumber(w_obra.dw_3.getrow(),'ncargo')
dw_2.setitem(dw_2.rowcount(),'ano',anos)
dw_2.setitem(dw_2.rowcount(),'mes',meses)
dw_2.setitem(dw_2.rowcount(),'tipodoc',emple)
dw_2.setitem(dw_2.rowcount(),'documento',tipodoc)
dw_2.setitem(dw_2.rowcount(),'ncargo',cargo)
if dw_2.update()<1 then
	rollback;
	dw_2.retrieve(anos,meses,tipodoc,emple,cargo)
else
	commit;
end if
end event

type pb_6 from picturebutton within w_cambio_obra
event mousemove pbm_mousemove
integer x = 919
integer y = 868
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar"
end type

event clicked;//inserta=1
//dw_2.insertrow(0)
//dw_2.scrolltorow(dw_2.rowcount())
//dw_2.setitem(dw_2.rowcount(),1,emplea)
//dw_2.setitem(dw_2.rowcount(),2,cargo)
//dw_2.setitem(dw_2.rowcount(),7,datetime(today()))
dw_2.scrolltorow(dw_2.insertrow(0))
end event

type pb_5 from picturebutton within w_cambio_obra
event mousemove pbm_mousemove
integer x = 1490
integer y = 868
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.gif"
string disabledname = "d_print.gif"
string powertiptext = "Imprimir"
end type

type pb_4 from picturebutton within w_cambio_obra
event mousemove pbm_mousemove
integer x = 2062
integer y = 868
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ultimo.gif"
string disabledname = "d_ultimo.gif"
string powertiptext = "Ir al último"
end type

event clicked;dw_2.scrolltorow(dw_2.rowcount())
end event

type pb_3 from picturebutton within w_cambio_obra
event mousemove pbm_mousemove
integer x = 1920
integer y = 868
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "adelante_1.gif"
string disabledname = "d_adelante_1.gif"
string powertiptext = "Siguiente"
end type

event clicked;dw_2.scrollnextrow()
end event

type pb_2 from picturebutton within w_cambio_obra
event mousemove pbm_mousemove
integer x = 777
integer y = 868
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras_1.gif"
string disabledname = "d_atras_1.gif"
string powertiptext = "Anterior"
end type

event clicked;dw_2.scrollpriorrow()
end event

type pb_1 from picturebutton within w_cambio_obra
event mosemove pbm_mousemove
integer x = 635
integer y = 868
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras.gif"
string disabledname = "d_atras.gif"
string powertiptext = "Ir al Primero"
end type

event clicked;dw_2.scrolltorow(1)
end event

type pb_10 from picturebutton within w_cambio_obra
event movemouse pbm_mousemove
integer x = 1632
integer y = 868
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "puerta.gif"
string disabledname = "d_puerta.gif"
string powertiptext = "Salir"
end type

event clicked;w_obra.dw_3.Reset()
w_obra.dw_4.reset()
w_obra.dw_3.retrieve(w_obra.dw_1.getitemnumber(1,'ano'),w_obra.dw_1.getitemnumber(1,'mes'),w_obra.dw_2.getitemstring(1,'codlugar'))

close(parent)
w_obra.show()
end event

type pb_11 from picturebutton within w_cambio_obra
event movemouse pbm_mousemove
integer x = 1778
integer y = 868
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
string powertiptext = "Refrescar"
end type

event clicked;//dw_1.retrieve(w_empleado.dw_2.getitemstring(1,1),w_empleado.dw_2.getitemnumber(1,2))
//emplea=w_empleado.dw_2.getitemstring(1,1)
//cargo=w_empleado.dw_2.getitemnumber(1,2)
//dw_2.settransobject(SQLCA)
//dw_2.insertrow(0)
//dw_2.setitem(dw_2.rowcount(),1,emplea)
//dw_2.setitem(dw_2.rowcount(),2,cargo)
//dw_2.setitem(dw_2.rowcount(),5,"1")
//dw_2.setitem(dw_2.rowcount(),3,now())
end event

type dw_1 from datawindow within w_cambio_obra
boolean visible = false
integer x = 50
integer y = 852
integer width = 370
integer height = 124
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_emple_cargos_tipo"
boolean border = false
boolean livescroll = true
end type

type dw_2 from datawindow within w_cambio_obra
integer x = 82
integer y = 28
integer width = 3159
integer height = 716
integer taborder = 30
string title = "none"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()

if this.GetColumnName() = 'ufuncional' then
	this.setitem(this.getrow(),'ccosto',"")
	dw_ccosto.setfilter("coduf='"+this.getitemstring(this.getrow(),'ufuncional')+"'")
	dw_ccosto.filter()
end if

end event

