$PBExportHeader$w_buscater.srw
forward
global type w_buscater from window
end type
type st_2 from statictext within w_buscater
end type
type pb_3 from picturebutton within w_buscater
end type
type pb_2 from picturebutton within w_buscater
end type
type pb_1 from picturebutton within w_buscater
end type
type cb_aceptar from picturebutton within w_buscater
end type
type pb_busca from picturebutton within w_buscater
end type
type st_1 from statictext within w_buscater
end type
type dw_encuentra from datawindow within w_buscater
end type
type dw_busca from datawindow within w_buscater
end type
end forward

global type w_buscater from window
integer x = 402
integer y = 400
integer width = 3538
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
global w_buscater w_buscater

type variables
string ordenar[9], sql_text
end variables

on w_buscater.create
this.st_2=create st_2
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_aceptar=create cb_aceptar
this.pb_busca=create pb_busca
this.st_1=create st_1
this.dw_encuentra=create dw_encuentra
this.dw_busca=create dw_busca
this.Control[]={this.st_2,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.cb_aceptar,&
this.pb_busca,&
this.st_1,&
this.dw_encuentra,&
this.dw_busca}
end on

on w_buscater.destroy
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

event open;dw_busca.insertrow(0)
dw_encuentra.settransobject(sqlca)
sql_text = dw_encuentra.GetSQLSelect()
end event

type st_2 from statictext within w_buscater
integer x = 2853
integer y = 1236
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

type pb_3 from picturebutton within w_buscater
event mousemove pbm_mousemove
integer x = 1865
integer y = 1280
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

type pb_2 from picturebutton within w_buscater
event mousemove pbm_mousemove
integer x = 3145
integer y = 172
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
string picturename = "borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Fila de Búsqueda"
end type

event clicked;if dw_busca.rowcount()= 1 then return
dw_busca.deleterow(0)
end event

type pb_1 from picturebutton within w_buscater
event mousemove pbm_mousemove
integer x = 1714
integer y = 1280
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

type cb_aceptar from picturebutton within w_buscater
event mousemove pbm_mousemove
integer x = 1563
integer y = 1280
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
	datawindow esta
	esta=message.PowerObjectParm
	long j
	for j=g_tercerodesde to g_tercerodesde + 6
		esta.setitem(esta.getrow(),j,dw_encuentra.GetItemString(dw_encuentra.GetRow(),j - g_tercerodesde +1))
	next
	if esta.dataobject='dw_occab' then esta.setitem(esta.getrow(),g_tercerodesde+8,dw_encuentra.GetItemnumber(dw_encuentra.GetRow(),'t_iva'))
	esta.accepttext()
end if
close(parent)
end event

type pb_busca from picturebutton within w_buscater
event mousemove pbm_mousemove
integer x = 3145
integer y = 40
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &b"
boolean default = true
boolean originalsize = true
string picturename = "buscar2.GIF"
string disabledname = "d_buscar2.GIF"
alignment htextalign = left!
string powertiptext = "Buscar [Alt+B]"
end type

event clicked;long i,cuantas
string sqltxt
dw_busca.accepttext()
cuantas=dw_busca.rowcount()
Sqltxt = sql_text + " where "
for i=1 to cuantas
	if trim(dw_busca.getitemstring(i,"nom_campo"))="" or trim(dw_busca.getitemstring(i,"valor"))="" then 
		messagebox("Atención","Complete las condiciones de búsqueda")
		return
	end if
	sqltxt=sqltxt+'terceros.'+dw_busca.getitemstring(i,"nom_campo")
	sqltxt=sqltxt+" '"+dw_busca.getitemstring(i,"valor")+"' "
	sqltxt=sqltxt+dw_busca.getitemstring(i,"condicion")
next
if g_tercerodesde = 11 then 
	sqltxt=sqltxt+" and ( (terceros.fondopension='1') OR (terceros.fondocesantia='1') or (terceros.eps='1'))"
end if
dw_encuentra.Reset()
dw_encuentra.SetSQLSelect(sqltxt)
dw_encuentra.retrieve()
end event

type st_1 from statictext within w_buscater
integer x = 274
integer y = 4
integer width = 2775
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

type dw_encuentra from datawindow within w_buscater
event mousemove pbm_mousemove
integer x = 73
integer y = 616
integer width = 3333
integer height = 616
integer taborder = 50
string dragicon = "none!"
string dataobject = "dw_terceros_busca"
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

type dw_busca from datawindow within w_buscater
event mousemove pbm_mousemove
integer x = 270
integer y = 92
integer width = 2633
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

