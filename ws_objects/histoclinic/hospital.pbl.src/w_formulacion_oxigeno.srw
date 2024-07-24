$PBExportHeader$w_formulacion_oxigeno.srw
forward
global type w_formulacion_oxigeno from window
end type
type horas from singlelineedit within w_formulacion_oxigeno
end type
type st_um from statictext within w_formulacion_oxigeno
end type
type via from datawindow within w_formulacion_oxigeno
end type
type st_5 from statictext within w_formulacion_oxigeno
end type
type dosis from singlelineedit within w_formulacion_oxigeno
end type
type st_3 from statictext within w_formulacion_oxigeno
end type
type st_2 from statictext within w_formulacion_oxigeno
end type
type st_1 from statictext within w_formulacion_oxigeno
end type
type cantidades from singlelineedit within w_formulacion_oxigeno
end type
type mle_1 from multilineedit within w_formulacion_oxigeno
end type
type pb_aceptar from picturebutton within w_formulacion_oxigeno
end type
end forward

global type w_formulacion_oxigeno from window
integer width = 1582
integer height = 644
boolean titlebar = true
string title = "Administración de Oxigeno"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean center = true
horas horas
st_um st_um
via via
st_5 st_5
dosis dosis
st_3 st_3
st_2 st_2
st_1 st_1
cantidades cantidades
mle_1 mle_1
pb_aceptar pb_aceptar
end type
global w_formulacion_oxigeno w_formulacion_oxigeno

type variables
datawindow dw_formula
datawindowchild idw_oxig
string ls_via
long ldb_cantk,ldb_cant
decimal ldb_factor
end variables
event open;dw_formula=message.powerobjectparm
setnull(ldb_cantk)
setnull(ldb_cant)
mle_1.text=dw_formula.getitemstring(dw_formula.getrow(),'medicamento')
st_um.text=dw_formula.getitemstring(dw_formula.getrow(),'um')

ldb_cantk=dw_formula.getitemnumber(dw_formula.getrow(),'cantk')
ldb_cant=dw_formula.getitemnumber(dw_formula.getrow(),'solicitada')
cantidades.text=string( ldb_cantk*ldb_cant)
if isnull(cantidades.text) then cantidades.text='1'
via.retrieve()
mle_1.SelectText ( 1, 1)
setnull(dosis.text)
end event

on w_formulacion_oxigeno.create
this.horas=create horas
this.st_um=create st_um
this.via=create via
this.st_5=create st_5
this.dosis=create dosis
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cantidades=create cantidades
this.mle_1=create mle_1
this.pb_aceptar=create pb_aceptar
this.Control[]={this.horas,&
this.st_um,&
this.via,&
this.st_5,&
this.dosis,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cantidades,&
this.mle_1,&
this.pb_aceptar}
end on

on w_formulacion_oxigeno.destroy
destroy(this.horas)
destroy(this.st_um)
destroy(this.via)
destroy(this.st_5)
destroy(this.dosis)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cantidades)
destroy(this.mle_1)
destroy(this.pb_aceptar)
end on

type horas from singlelineedit within w_formulacion_oxigeno
integer x = 357
integer y = 376
integer width = 297
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 1090519039
integer limit = 20
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event losefocus;if Match(dosis.text, '^[0-9.]*$') = False then
	messagebox("Error","Ingrese solo números",Information!)
	dosis.text = ""
	dosis.setfocus( )
	return
end if

if gs_oxigeno='REAL' then
	ldb_factor=idw_oxig.getitemnumber(idw_oxig.getrow(),'factor_soat')	
	cantidades.text=string(double(dosis.text) * double(horas.text) * 60)
else
	ldb_factor=idw_oxig.getitemnumber(idw_oxig.getrow(),'factor_iss')
	cantidades.text=string(ldb_factor * double(horas.text)  *1000 )
end if
end event

type st_um from statictext within w_formulacion_oxigeno
integer x = 1998
integer y = 160
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type via from datawindow within w_formulacion_oxigeno
integer x = 197
integer y = 152
integer width = 1134
integer height = 72
integer taborder = 10
string dataobject = "dw_combo_oxigeno"
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild("cod_oxig",idw_oxig)
idw_oxig.settransobject(sqlca)

end event

event itemchanged;ls_via=gettext()

if gs_oxigeno='REAL' then
	ldb_factor=idw_oxig.getitemnumber(idw_oxig.getrow(),'factor_soat')	
	cantidades.text=string(double(dosis.text) * double(horas.text) * 60)
else
	ldb_factor=idw_oxig.getitemnumber(idw_oxig.getrow(),'factor_iss')
	cantidades.text=string(ldb_factor * double(horas.text)  *1000 )
end if
end event

event retrieveend;ls_via=getitemstring(getrow(),'cod_oxig')
end event

type st_5 from statictext within w_formulacion_oxigeno
integer x = 64
integer y = 372
integer width = 206
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Horas"
boolean focusrectangle = false
end type

type dosis from singlelineedit within w_formulacion_oxigeno
integer x = 357
integer y = 268
integer width = 302
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 1090519039
integer limit = 20
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event losefocus;if Match(dosis.text, '^[0-9.]*$') = False then
	messagebox("Error","Ingrese solo números",Information!)
	dosis.text = ""
	dosis.setfocus( )
	return
end if

if gs_oxigeno='REAL' then
	ldb_factor=idw_oxig.getitemnumber(idw_oxig.getrow(),'factor_soat')	
	cantidades.text=string(double(dosis.text) * double(horas.text) * 60)
else
	ldb_factor=idw_oxig.getitemnumber(idw_oxig.getrow(),'factor_iss')
	cantidades.text=string(ldb_factor * double(horas.text)  *1000 )
end if
end event

type st_3 from statictext within w_formulacion_oxigeno
integer x = 64
integer y = 268
integer width = 274
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Litros/min"
boolean focusrectangle = false
end type

type st_2 from statictext within w_formulacion_oxigeno
integer x = 64
integer y = 148
integer width = 155
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vía"
boolean focusrectangle = false
end type

type st_1 from statictext within w_formulacion_oxigeno
integer x = 745
integer y = 380
integer width = 251
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cantidad"
boolean focusrectangle = false
end type

type cantidades from singlelineedit within w_formulacion_oxigeno
integer x = 1001
integer y = 376
integer width = 416
integer height = 76
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 1090519039
string text = "1"
integer limit = 3
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type mle_1 from multilineedit within w_formulacion_oxigeno
integer x = 23
integer y = 16
integer width = 1499
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type pb_aceptar from picturebutton within w_formulacion_oxigeno
integer x = 1376
integer y = 112
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
end type

event clicked;if long(cantidades.text)<1 then return

if isnull(dosis.text) or dosis.text='' or len(dosis.text) =0  then
	messagebox('Atención','Litros por segundo es obligatoria')
	return 2
end if

if isnull(horas.text) or horas.text='' then
	messagebox('Atención','La Frecuencia es obligatoria')
	return 2	
else
	if double( horas.text) > 24 then
		if messagebox('Atención','La cantidad de Horas es superior a 24 desea continuar aún así?',question!,yesno!,2)=2 then
			dw_formula.setitem(dw_formula.getrow(),"solicitada",long(cantidades.text))
			 return 2
		end if
	end if
end if

dw_formula.setitem(dw_formula.getrow(),"solicitada",long(cantidades.text))
string ls_des
int dos

ls_des=idw_oxig.getitemstring(idw_oxig.getrow(),'des_oxig')	

dw_formula.setitem(dw_formula.getrow(),"dosis",integer(dosis.text))
dw_formula.setitem(dw_formula.getrow(),"cod_oxig",ls_via)
dw_formula.AcceptText()
texto_np='  ADMINISTRACION OXIGENO Via: '+ls_des+'  Litros/min: ' +dosis.text+ ' X Horas: '+horas.text
close(parent)
end event

