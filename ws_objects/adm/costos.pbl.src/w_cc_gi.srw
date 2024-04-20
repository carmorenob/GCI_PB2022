$PBExportHeader$w_cc_gi.srw
forward
global type w_cc_gi from window
end type
type pb_save from picturebutton within w_cc_gi
end type
type pb_4 from picturebutton within w_cc_gi
end type
type pb_3 from picturebutton within w_cc_gi
end type
type pb_2 from picturebutton within w_cc_gi
end type
type pb_1 from picturebutton within w_cc_gi
end type
type st_2 from statictext within w_cc_gi
end type
type st_1 from statictext within w_cc_gi
end type
type dw_3 from datawindow within w_cc_gi
end type
type dw_2 from datawindow within w_cc_gi
end type
type dw_gasto from datawindow within w_cc_gi
end type
end forward

global type w_cc_gi from window
integer width = 3913
integer height = 1664
boolean titlebar = true
string title = "Distibución de Costos Indirectos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_save pb_save
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_2 st_2
st_1 st_1
dw_3 dw_3
dw_2 dw_2
dw_gasto dw_gasto
end type
global w_cc_gi w_cc_gi

type variables
boolean i_cambio
end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();if dw_2.rowcount()=0 then
	if messagebox('Atención','Está seguro que este gasto no va a tener centros de costo',question!,yesno!,2)=2 then return -1
else
	if dw_2.getitemstring(1,'distribuir')='P' then //porcent
		if round(dw_2.getitemnumber(1,'t_porcen'),0)<>100 then
			messagebox('Atención','La suma de los porcentajes no es 100% no puede continuar')
			return -1
		end if
	else
		if dw_2.getitemnumber(1,'t_cantidad')<>dw_2.getitemnumber(1,'monto_total') then
			messagebox('Atención','La suma de las cantidades no es igual al monto total, no puede continuar')
			return -1
		end if
	end if
end if
if dw_2.update(true,false)=-1 then return -1
commit;
dw_2.resetupdate()
i_cambio=false
return 1
end function

on w_cc_gi.create
this.pb_save=create pb_save
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_gasto=create dw_gasto
this.Control[]={this.pb_save,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.dw_3,&
this.dw_2,&
this.dw_gasto}
end on

on w_cc_gi.destroy
destroy(this.pb_save)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_gasto)
end on

event open;if g_motor='postgres' then
	dw_3.dataobject='dw_resto_cc_postgres'
else
	dw_3.dataobject='dw_resto_cc'
end if
dw_3.settransobject(sqlca)
end event

type pb_save from picturebutton within w_cc_gi
integer x = 2062
integer y = 16
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;grabar()
end event

type pb_4 from picturebutton within w_cc_gi
integer x = 2158
integer y = 848
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "ultimo.gif"
alignment htextalign = left!
end type

event clicked;do while dw_2.rowcount()>0
	pb_3.event clicked()
loop

end event

type pb_3 from picturebutton within w_cc_gi
integer x = 2158
integer y = 720
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "adelante_1.gif"
alignment htextalign = left!
end type

event clicked;if dw_2.rowcount()=0 then return
dw_3.insertrow(1)
dw_3.setitem(1,'coduf',dw_2.getitemstring(dw_2.getrow(),'coduf'))
dw_3.setitem(1,'codcc',dw_2.getitemstring(dw_2.getrow(),'codcc'))
dw_3.setitem(1,'descripcion',dw_2.getitemstring(dw_2.getrow(),'descripcion'))
dw_3.setitem(1,'desufuncional',dw_2.getitemstring(dw_2.getrow(),'desufuncional'))
dw_3.setitem(1,'distribuir',dw_2.getitemstring(dw_2.getrow(),'distribuir'))
dw_3.setitem(1,'monto_total',dw_2.getitemnumber(dw_2.getrow(),'monto_total'))
dw_3.groupcalc()
dw_2.deleterow(0)
i_cambio=true

end event

type pb_2 from picturebutton within w_cc_gi
integer x = 2158
integer y = 440
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "atras.gif"
alignment htextalign = left!
string powertiptext = "Llevar todos los centros de Costo"
end type

event clicked;do while dw_3.rowcount()>0
	pb_1.event clicked()
loop

end event

type pb_1 from picturebutton within w_cc_gi
integer x = 2158
integer y = 308
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "atras_1.gif"
alignment htextalign = left!
string powertiptext = "Adicionar el Ccosto seleccionado"
end type

event clicked;if dw_3.rowcount()=0 then return
dw_2.insertrow(1)
dw_2.setitem(1,'coduf',dw_3.getitemstring(dw_3.getrow(),'coduf'))
dw_2.setitem(1,'codcc',dw_3.getitemstring(dw_3.getrow(),'codcc'))
dw_2.setitem(1,'cod_gasto',dw_gasto.getitemstring(1,1))
dw_2.setitem(1,'descripcion',dw_3.getitemstring(dw_3.getrow(),'descripcion'))
dw_2.setitem(1,'desufuncional',dw_3.getitemstring(dw_3.getrow(),'desufuncional'))
dw_2.setitem(1,'distribuir',dw_3.getitemstring(dw_3.getrow(),'distribuir'))
dw_2.setitem(1,'monto_total',dw_3.getitemnumber(dw_3.getrow(),'monto_total'))
dw_3.deleterow(0)
dw_2.groupcalc()
i_cambio=true
end event

type st_2 from statictext within w_cc_gi
integer x = 2359
integer y = 148
integer width = 750
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resto de Centros de Costo:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cc_gi
integer x = 18
integer y = 148
integer width = 750
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Centros de Costo con este gasto:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cc_gi
integer x = 2354
integer y = 204
integer width = 1449
integer height = 1296
integer taborder = 20
string title = "none"
string dataobject = "dw_resto_cc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//settransobject(sqlca)
end event

event doubleclicked;pb_1.event clicked()
end event

type dw_2 from datawindow within w_cc_gi
integer y = 196
integer width = 2103
integer height = 1300
integer taborder = 20
string title = "none"
string dataobject = "dw_cc_gi"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cambio=true
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event doubleclicked;pb_3.event clicked()
end event

type dw_gasto from datawindow within w_cc_gi
integer x = 14
integer y = 4
integer width = 2011
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_gi"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;dw_2.retrieve(data)
dw_3.retrieve(data)
end event

