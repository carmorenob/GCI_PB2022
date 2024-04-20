$PBExportHeader$w_busca_emp.srw
forward
global type w_busca_emp from window
end type
type pb_ins from picturebutton within w_busca_emp
end type
type st_2 from statictext within w_busca_emp
end type
type pb_3 from picturebutton within w_busca_emp
end type
type pb_2 from picturebutton within w_busca_emp
end type
type pb_1 from picturebutton within w_busca_emp
end type
type cb_aceptar from picturebutton within w_busca_emp
end type
type pb_busca from picturebutton within w_busca_emp
end type
type st_1 from statictext within w_busca_emp
end type
type dw_encuentra from datawindow within w_busca_emp
end type
type dw_busca from datawindow within w_busca_emp
end type
end forward

global type w_busca_emp from window
integer x = 402
integer y = 400
integer width = 3342
integer height = 1556
boolean titlebar = true
string title = "Busqueda Rápida de Terceros"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
pb_ins pb_ins
st_2 st_2
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
cb_aceptar cb_aceptar
pb_busca pb_busca
st_1 st_1
dw_encuentra dw_encuentra
dw_busca dw_busca
end type
global w_busca_emp w_busca_emp

type variables
string ordenar[9], sql_text
datawindow esta

end variables

on w_busca_emp.create
this.pb_ins=create pb_ins
this.st_2=create st_2
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_aceptar=create cb_aceptar
this.pb_busca=create pb_busca
this.st_1=create st_1
this.dw_encuentra=create dw_encuentra
this.dw_busca=create dw_busca
this.Control[]={this.pb_ins,&
this.st_2,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.cb_aceptar,&
this.pb_busca,&
this.st_1,&
this.dw_encuentra,&
this.dw_busca}
end on

on w_busca_emp.destroy
destroy(this.pb_ins)
destroy(this.st_2)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_aceptar)
destroy(this.pb_busca)
destroy(this.st_1)
destroy(this.dw_encuentra)
destroy(this.dw_busca)
end on

event open;esta=message.PowerObjectParm
dw_busca.InsertRow(0)
dw_encuentra.SetTransObject(SQLCA)
sql_text = dw_encuentra.GetSQLSelect()
dw_encuentra.Retrieve()

end event

event close;//w_ocompra.dw_occab.Modify("boton.background.color = '80269524' boton.border = 6")

end event

type pb_ins from picturebutton within w_busca_emp
event mousemove pbm_mousemove
integer x = 2926
integer y = 232
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Fila de Búsqueda"
end type

event clicked;dw_busca.InsertRow(0)

end event

type st_2 from statictext within w_busca_emp
integer x = 2592
integer y = 1248
integer width = 544
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_busca_emp
event mousemove pbm_mousemove
integer x = 1742
integer y = 1264
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "      &y"
boolean originalsize = true
string picturename = "ayuda.gif"
string disabledname = "d_ayuda.gif"
alignment htextalign = left!
string powertiptext = "Ayuda sobre busqueda de Terceros [Alt+Y]"
end type

event clicked;showhelp(dir_insta+"gciltda.hlp",keyword!,"Buscar pacientes")
end event

type pb_2 from picturebutton within w_busca_emp
event mousemove pbm_mousemove
integer x = 2926
integer y = 360
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Fila de Búsqueda"
end type

event clicked;if dw_busca.rowcount() = 0 then Return
dw_busca.deleterow(0)

end event

type pb_1 from picturebutton within w_busca_emp
event mousemove pbm_mousemove
integer x = 1591
integer y = 1264
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type cb_aceptar from picturebutton within w_busca_emp
event mousemove pbm_mousemove
integer x = 1445
integer y = 1264
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;if dw_encuentra.GetRow() >= 1 then
	long j
	for j=g_tercerodesde to g_tercerodesde + 6
		esta.setitem(esta.getrow(),j,dw_encuentra.GetItemString(dw_encuentra.GetRow(),j - g_tercerodesde +1))
	next
	esta.accepttext()
end if
close(parent)

end event

type pb_busca from picturebutton within w_busca_emp
event mousemove pbm_mousemove
integer x = 2926
integer y = 104
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &b"
boolean default = true
string picturename = "lupa.GIF"
string disabledname = "d_lupa.GIF"
alignment htextalign = left!
string powertiptext = "Buscar [Alt+B]"
end type

event clicked;long i,cuantas
string sqltxt
dw_busca.accepttext()
cuantas=dw_busca.rowcount()
//Sqltxt = sql_text + " where "
for i = 1 to cuantas
	if trim(dw_busca.getitemstring(i,"nom_campo"))="" or trim(dw_busca.getitemstring(i,"valor"))="" then 
		messagebox("Atención","Complete las condiciones de búsqueda")
		return
	end if
	sqltxt = sqltxt + "("+dw_busca.getitemstring(i,"nom_campo")
	sqltxt = sqltxt + "'" + upper(dw_busca.getitemstring(i,"valor")) + "') "
	sqltxt = sqltxt + dw_busca.getitemstring(i,"condicion")
next

//dw_encuentra.Reset()
//dw_encuentra.SetSQLSelect(sqltxt)
//dw_encuentra.retrieve()
dw_encuentra.SetFilter(sqltxt)
dw_encuentra.Filter()

end event

type st_1 from statictext within w_busca_emp
integer x = 274
integer y = 4
integer width = 1929
integer height = 80
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 134217752
string text = "Agregue campo y condición de búsqueda (caracter % es comodín)"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_encuentra from datawindow within w_busca_emp
event mousemove pbm_mousemove
integer x = 128
integer y = 616
integer width = 2985
integer height = 616
integer taborder = 50
string dragicon = "none!"
string dataobject = "dw_busca_emp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if dwo.type="text" then return
cb_aceptar.triggerevent(clicked!)
end event

event clicked;this.SetRow(row)
if dwo.type="text" then
choose case dwo.name
	case "tipodoc_t"
		if ordenar[1]="#1 A" then
			ordenar[1]="#1 D"
		else
			ordenar[1]="#1 A"
		end if
		dw_encuentra.setsort(ordenar[1])
	case "documento_t"
		if ordenar[2]="#2 A" then
			ordenar[2]="#2 D"
		else
			ordenar[2]="#2 A"
		end if
		dw_encuentra.setsort(ordenar[2])
	case "historia_t"
		if ordenar[3]="#3 A" then
			ordenar[3]="#3 D"
		else
			ordenar[3]="#3 A"
		end if
		dw_encuentra.setsort(ordenar[3])
	case "nombre1_t"
		if ordenar[4]="#4 A" then
			ordenar[4]="#4 D"
		else
			ordenar[4]="#4 A"
		end if
		dw_encuentra.setsort(ordenar[4])
	case "nombre2_t"
		if ordenar[5]="#5 A" then
			ordenar[5]="#5 D"
		else
			ordenar[5]="#5 A"
		end if
		dw_encuentra.setsort(ordenar[5])
	case "apellido1_t"
		if ordenar[6]="#6 A" then
			ordenar[6]="#6 D"
		else
			ordenar[6]="#6 A"
		end if
		dw_encuentra.setsort(ordenar[6])
	case "apellido2_t"
		if ordenar[7]="#7 A" then
			ordenar[7]="#7 D"
		else
			ordenar[7]="#7 A"
		end if
		dw_encuentra.setsort(ordenar[7])
	case "sexo_t"
		if ordenar[8]="#8 A" then
			ordenar[8]="#8 D"
		else
			ordenar[8]="#8 A"
		end if
		dw_encuentra.setsort(ordenar[8])
	case "t_1"	
		if ordenar[9]="#9 A" then
			ordenar[9]="#9 D"
		else
			ordenar[9]="#9 A"
		end if
		dw_encuentra.setsort(ordenar[9])
end choose
dw_encuentra.sort()
end if
end event

event rowfocuschanged;st_2.text="Reg. "+string(currentrow)+" de "+string(this.rowcount() )
end event

event retrieveend;st_2.text="Reg. "+string(this.getrow())+" de "+string(this.rowcount() )
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type dw_busca from datawindow within w_busca_emp
event mousemove pbm_mousemove
integer x = 270
integer y = 92
integer width = 2606
integer height = 464
integer taborder = 10
string dragicon = "none!"
string title = "Busqueda de pacientes"
string dataobject = "dw_xa_buscar_ter"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
if this.getcolumnname()="condicion" then
	long fila,cuantos
	fila=this.getrow()
	cuantos=this.rowcount()
	choose case this.getitemstring(fila,"condicion")
		case " and "
			if fila=cuantos then this.insertrow(0)
		case " or "
			if fila=cuantos then this.insertrow(0)
		case " "
			if fila<cuantos then 
				long i
				for i=fila +1 to cuantos
					this.deleterow(fila +1)
				next
			end if
	end choose
end if
end event

