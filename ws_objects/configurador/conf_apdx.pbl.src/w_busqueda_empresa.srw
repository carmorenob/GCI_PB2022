$PBExportHeader$w_busqueda_empresa.srw
forward
global type w_busqueda_empresa from window
end type
type pb_2 from picturebutton within w_busqueda_empresa
end type
type pb_1 from picturebutton within w_busqueda_empresa
end type
type cb_aceptar from picturebutton within w_busqueda_empresa
end type
type pb_busca from picturebutton within w_busqueda_empresa
end type
type st_1 from statictext within w_busqueda_empresa
end type
type dw_encuentra from datawindow within w_busqueda_empresa
end type
type dw_busca from datawindow within w_busqueda_empresa
end type
end forward

global type w_busqueda_empresa from window
integer x = 402
integer y = 400
integer width = 2871
integer height = 1556
boolean titlebar = true
string title = "Busqueda Rápida de Aseguradoras"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
string pointer = "Arrow!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
cb_aceptar cb_aceptar
pb_busca pb_busca
st_1 st_1
dw_encuentra dw_encuentra
dw_busca dw_busca
end type
global w_busqueda_empresa w_busqueda_empresa

type variables
string ordenar[9]
end variables

on w_busqueda_empresa.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_aceptar=create cb_aceptar
this.pb_busca=create pb_busca
this.st_1=create st_1
this.dw_encuentra=create dw_encuentra
this.dw_busca=create dw_busca
this.Control[]={this.pb_2,&
this.pb_1,&
this.cb_aceptar,&
this.pb_busca,&
this.st_1,&
this.dw_encuentra,&
this.dw_busca}
end on

on w_busqueda_empresa.destroy
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

end event

type pb_2 from picturebutton within w_busqueda_empresa
integer x = 2258
integer y = 232
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
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar fila de Búsqueda"
end type

event clicked;if dw_busca.rowcount()= 1 then return
dw_busca.deleterow(0)
end event

type pb_1 from picturebutton within w_busqueda_empresa
event mousemove pbm_mousemove
integer x = 1385
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

type cb_aceptar from picturebutton within w_busqueda_empresa
event mousemove pbm_mousemove
integer x = 1234
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
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;long fila
fila=dw_encuentra.getrow()
if fila>=1 then
	if isvalid(w_contratos) then
		w_contratos.tab_1.tp_1.dw_1.setitem(1,1,dw_encuentra.getitemstring(fila,"codemp"))
		w_contratos.tab_1.tp_1.dw_1.event itemchanged(1,w_contratos.tab_1.tp_1.dw_1.object.codemp,dw_encuentra.getitemstring(fila,"codemp"))
		w_contratos.cb_sig.setfocus()
	end if
	if isvalid(w_empresas) then
		w_empresas.dw_1.setitem(1,1,dw_encuentra.getitemstring(fila,"codemp"))
		w_empresas.dw_1.event itemchanged(1,w_empresas.dw_1.object.codemp,dw_encuentra.getitemstring(fila,"codemp"))
	end if	
	close(parent)
end if

end event

type pb_busca from picturebutton within w_busqueda_empresa
event mousemove pbm_mousemove
integer x = 2258
integer y = 104
integer width = 151
integer height = 132
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
string picturename = "lupa.GIF"
string disabledname = "d_lupa.GIF"
alignment htextalign = left!
string powertiptext = "Buscar [Alt+B]"
end type

event clicked;long i,cuantas
dw_busca.accepttext()
cuantas=dw_busca.rowcount()
string Sql_text="SELECT empresa.codemp, empresa.desemp, empresa.codsuper FROM empresa where "
for i=1 to cuantas
	if trim(dw_busca.getitemstring(i,"nom_campo"))="" or trim(dw_busca.getitemstring(i,"valor"))="" then 
		messagebox("Atención","Complete las condiciones de búsqueda")
		return
	end if
	sql_text=sql_text+dw_busca.getitemstring(i,"nom_campo")
	sql_text=sql_text+"'"+dw_busca.getitemstring(i,"valor")+"' "
	sql_text=sql_text+dw_busca.getitemstring(i,"condicion")
next
//messagebox("ojo",sql_text)
dw_encuentra.SetSQLSelect(sql_text)
dw_encuentra.retrieve()
cb_aceptar.setfocus()
end event

type st_1 from statictext within w_busqueda_empresa
integer x = 274
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

type dw_encuentra from datawindow within w_busqueda_empresa
event mousemove pbm_mousemove
integer x = 73
integer y = 616
integer width = 2656
integer height = 616
integer taborder = 50
string dragicon = "none!"
string dataobject = "dw_xa_buscar_pac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if dwo.type="text" then return
cb_aceptar.triggerevent(clicked!)
end event

event clicked;if dwo.type="text" then
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

type dw_busca from datawindow within w_busqueda_empresa
event mousemove pbm_mousemove
integer x = 270
integer y = 92
integer width = 1961
integer height = 464
integer taborder = 10
string dragicon = "none!"
string title = "Busqueda de pacientes"
string dataobject = "dw_xa_buscar"
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

