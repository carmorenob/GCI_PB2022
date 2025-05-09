$PBExportHeader$w_formulacion.srw
forward
global type w_formulacion from window
end type
type frecuencia from datawindow within w_formulacion
end type
type st_um from statictext within w_formulacion
end type
type via from datawindow within w_formulacion
end type
type st_5 from statictext within w_formulacion
end type
type dosis from singlelineedit within w_formulacion
end type
type st_3 from statictext within w_formulacion
end type
type st_2 from statictext within w_formulacion
end type
type st_1 from statictext within w_formulacion
end type
type cantidades from singlelineedit within w_formulacion
end type
type mle_1 from multilineedit within w_formulacion
end type
type pb_aceptar from picturebutton within w_formulacion
end type
end forward

global type w_formulacion from window
integer width = 2537
integer height = 532
boolean titlebar = true
string title = "Administración de Medicamentos"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean center = true
frecuencia frecuencia
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
global w_formulacion w_formulacion

type variables
datawindow dw_formula
string ls_via,ls_frec,ls_nvia, ls_nfrec
long l_cantk,l_cant
datawindowchild i_dw_frec,i_dw_via
end variables

event open;dw_formula=message.powerobjectparm
setnull(l_cantk)
setnull(l_cant)
mle_1.text=dw_formula.getitemstring(dw_formula.getrow(),'medicamento')
st_um.text=dw_formula.getitemstring(dw_formula.getrow(),'um')
l_cantk=dw_formula.getitemnumber(dw_formula.getrow(),'cantk')
l_cant=dw_formula.getitemnumber(dw_formula.getrow(),'solicitada')

ls_nfrec=dw_formula.getitemstring(dw_formula.getrow(),"frecuen")
setnull(l_cant)
l_cant=i_dw_frec.find("cod_frec ='"+ls_nfrec+"'",1,i_dw_frec.rowcount())
ls_nfrec=i_dw_frec.getitemstring(l_cant,'desc_frec')
frecuencia.setitem(1,1,dw_formula.getitemstring(dw_formula.getrow(),'frecuen'))
 
cantidades.text=string( l_cantk*l_cant)
if isnull(cantidades.text) then cantidades.text='1'
ls_via=dw_formula.getitemstring(dw_formula.getrow(),'via')
setnull(l_cant)
l_cant=i_dw_via.find("codigo ='"+ls_via+"'",1,i_dw_via.rowcount())
ls_nvia=i_dw_via.getitemstring(l_cant,'descripcion')

via.setitem(1,1,dw_formula.getitemstring(dw_formula.getrow(),'via'))
mle_1.SelectText ( 1, 1)
int dias
dias=w_principal.dw_1.getitemnumber(1,'dias')
if dias>=6480 then
	if isnull( dw_formula.getitemstring(dw_formula.getrow(),'administracion')) then 
		dosis.text=dw_formula.getitemstring(dw_formula.getrow(),'concentracion')
	else
		dosis.text=dw_formula.getitemstring(dw_formula.getrow(),'administracion')
	end if
else
	setnull(dosis.text)
end if
end event

on w_formulacion.create
this.frecuencia=create frecuencia
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
this.Control[]={this.frecuencia,&
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

on w_formulacion.destroy
destroy(this.frecuencia)
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

type frecuencia from datawindow within w_formulacion
integer x = 370
integer y = 280
integer width = 974
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dw_frec_med_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild("cod_frec",i_dw_frec)
i_dw_frec.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;integer li_cant,li_fila,li_tmp1

ls_frec=gettext()
setnull(li_tmp1)
setnull(li_fila)
li_fila=i_dw_frec.find("cod_frec ='"+ls_frec+"'",1,i_dw_frec.rowcount())
li_tmp1=i_dw_frec.getitemnumber(li_fila,'tiempo')
ls_nfrec=i_dw_frec.getitemstring(li_fila,'desc_frec')
li_cant=li_tmp1*1
if li_cant>0 then
	cantidades.text=string(li_cant)
end if

end event

type st_um from statictext within w_formulacion
integer x = 2080
integer y = 152
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

type via from datawindow within w_formulacion
integer x = 370
integer y = 152
integer width = 974
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dw_formula_via_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild("codigo",i_dw_via)
i_dw_via.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;integer li_fila
ls_via=gettext()

setnull(li_fila)
li_fila=i_dw_via.find("codigo ='"+ls_via+"'",1,i_dw_via.rowcount())
ls_nvia=i_dw_via.getitemstring(li_fila,'descripcion')

end event

type st_5 from statictext within w_formulacion
integer x = 64
integer y = 272
integer width = 283
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Frecuencia"
boolean focusrectangle = false
end type

type dosis from singlelineedit within w_formulacion
integer x = 1760
integer y = 148
integer width = 302
integer height = 76
integer taborder = 20
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
end event

type st_3 from statictext within w_formulacion
integer x = 1413
integer y = 148
integer width = 311
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dosificación"
boolean focusrectangle = false
end type

type st_2 from statictext within w_formulacion
integer x = 64
integer y = 148
integer width = 265
integer height = 84
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

type st_1 from statictext within w_formulacion
integer x = 1413
integer y = 272
integer width = 256
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cantidad:"
boolean focusrectangle = false
end type

type cantidades from singlelineedit within w_formulacion
integer x = 1760
integer y = 260
integer width = 416
integer height = 76
integer taborder = 50
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

type mle_1 from multilineedit within w_formulacion
integer x = 23
integer y = 16
integer width = 2263
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

type pb_aceptar from picturebutton within w_formulacion
integer x = 2336
integer y = 28
integer width = 146
integer height = 128
integer taborder = 60
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
	messagebox('Atención','La dosificación es obligatoria')
	return 2
end if
if isnull(ls_frec) or ls_frec='' then
	messagebox('Atención','La Frecuencia es obligatoria')
	return 2	
end if
if long(cantidades.text)>99 then
	if messagebox('Atención','La cantidad es superior a 99 desea continuar aún así?',question!,yesno!,2)=2 then
		dw_formula.setitem(dw_formula.getrow(),"solicitada",long(cantidades.text))
		 return 2
	end if
end if
dw_formula.setitem(dw_formula.getrow(),"solicitada",long(cantidades.text))
if isnull(ls_via) or ls_via='' then 
	messagebox('Atención','La Vía de administración es obligatoria')
	return 2
end if	

int dos
	
dw_formula.setitem(dw_formula.getrow(),"via",ls_via)
dw_formula.setitem(dw_formula.getrow(),"administracion",dosis.text+' '+st_um.text)
dw_formula.setitem(dw_formula.getrow(),"frecuen",ls_frec)
dos=integer(dosis.text)
dw_formula.setitem(dw_formula.getrow(),"dosis",integer(dosis.text))
dw_formula.AcceptText()
texto_np='  ADMINISTRACION Via: '+ls_nvia+' Dosificación: ' +dosis.text+' '+st_um.text+' Frecuencia: '+ls_nfrec
close(parent)
end event

