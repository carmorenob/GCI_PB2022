$PBExportHeader$w_formula_hc.srw
forward
global type w_formula_hc from window
end type
type pb_3 from picturebutton within w_formula_hc
end type
type pb_2 from picturebutton within w_formula_hc
end type
type pb_1 from picturebutton within w_formula_hc
end type
type dw_campos from datawindow within w_formula_hc
end type
type st_2 from statictext within w_formula_hc
end type
type cb_6 from commandbutton within w_formula_hc
end type
type cb_5 from commandbutton within w_formula_hc
end type
type cb_4 from commandbutton within w_formula_hc
end type
type cb_3 from commandbutton within w_formula_hc
end type
type cb_2 from commandbutton within w_formula_hc
end type
type cb_1 from commandbutton within w_formula_hc
end type
type st_1 from statictext within w_formula_hc
end type
type mle_1 from multilineedit within w_formula_hc
end type
type dw_c from datawindow within w_formula_hc
end type
end forward

global type w_formula_hc from window
integer width = 3109
integer height = 1624
boolean titlebar = true
string title = "Fórmulas Visibilidad"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_campos dw_campos
st_2 st_2
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
mle_1 mle_1
dw_c dw_c
end type
global w_formula_hc w_formula_hc

type variables
datawindow dw_obj

end variables

forward prototypes
public function string rename (string nombre)
public function string traduce_fmla (string fmla)
end prototypes

public function string rename (string nombre);string retorno
retorno = nombre

retorno = f_remplaza(retorno, ' ','_')
retorno = f_remplaza(retorno, '/','_')
retorno = f_remplaza(retorno, ':','_')
retorno = f_remplaza(retorno, '.','_')

return retorno
end function

public function string traduce_fmla (string fmla);string formula, campo
integer i, f, cars

formula = fmla
i = pos(formula, '@', 1)
do while i > 0
	cars = pos(formula, '@', i + 1) - i - 1
	campo = mid(formula, i + 1, cars)
	f = dw_campos.find("descampo='"+campo+"'", 1, dw_campos.rowCount())
	if f > 0 then
		formula = replace(formula, i, cars + 2, dw_campos.getItemString(f,'nombre'))
	else
		return "!"
	end if
	i = pos(formula, '@', 1)
loop
return formula

end function

on w_formula_hc.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_campos=create dw_campos
this.st_2=create st_2
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.mle_1=create mle_1
this.dw_c=create dw_c
this.Control[]={this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_campos,&
this.st_2,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.mle_1,&
this.dw_c}
end on

on w_formula_hc.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_campos)
destroy(this.st_2)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.mle_1)
destroy(this.dw_c)
end on

event open;dw_obj = Message.PowerObjectParm
st_1.text = dw_obj.getItemString(dw_obj.getrow(),'descampo')
dw_campos.retrieve(dw_obj.getItemString(dw_obj.getrow(),'codplantilla'))
mle_1.text = dw_obj.getItemString(dw_obj.getrow(),'visible')

end event

type pb_3 from picturebutton within w_formula_hc
string tag = "Verificar"
integer x = 2825
integer y = 236
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
string picturename = "diagnosticar.gif"
alignment htextalign = left!
end type

event clicked;string rta, fmla

fmla = traduce_fmla(mle_1.text)
if fmla = '!' then
	messageBox('Error', rta + " Sintaxis incorrecta")
	return
end if
rta = dw_c.describe("Evaluate('" + fmla + "',1)")
if isNull(rta) then
	messageBox('Aviso','Alguno de los parametros resultó nulo')
elseif rta <> '!' then
	messageBox('Aviso','Sintaxis Correcta')
else
	messageBox('Sintaxis PB', rta + " Sintaxis incorrecta")
end if

end event

type pb_2 from picturebutton within w_formula_hc
string tag = "Cancelar"
integer x = 2825
integer y = 376
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
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)

end event

type pb_1 from picturebutton within w_formula_hc
string tag = "Aceptar"
integer x = 2825
integer y = 100
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
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;string rta, fmla

fmla = traduce_fmla(mle_1.text)
if fmla = '!' then
	messageBox('Error', rta + " Sintaxis incorrecta")
	return
end if
rta = dw_c.describe("Evaluate('" + fmla + "',1)")
if isNull(rta) then
	messageBox('Aviso','Alguno de los parametros resultó nulo')
elseif rta <> '!' then
	//messageBox('Aviso','Sintaxis Correcta')
else
	messageBox('Sintaxis PB', rta + " Sintaxis incorrecta")
	return
end if

dw_obj.setItem(dw_obj.getRow(), 'visible', mle_1.text)
close(parent)

end event

type dw_campos from datawindow within w_formula_hc
integer x = 416
integer y = 764
integer width = 2615
integer height = 664
integer taborder = 30
string title = "none"
string dataobject = "dw_campos_hc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;int i
string stx, err, sql_syntax = 'select '
for i = 1 to RowCount()
	choose case getitemstring(i,'tipo')
		case 'S'  //, 'L' , 'T', 'N' //, 'M' //:seleccion  //:lista  //:texto //:si/no  //:Memo
			sql_syntax = sql_syntax +  " '' as seleccion_" + string(getItemNumber(i,'numcampo')) + ","
			setItem(i, 'nombre', "seleccion_" + string(getItemNumber(i,'numcampo')) )
		case 'N' //:Si No 
			sql_syntax = sql_syntax +  " '' as sino_" + string(getItemNumber(i,'numcampo')) + ","
			setItem(i, 'nombre', "sino_" + string(getItemNumber(i,'numcampo')) )
		case 'T' //:Texto
			sql_syntax = sql_syntax +  " '' as texto_" + string(getItemNumber(i,'numcampo')) + ","
			setItem(i, 'nombre', "texto_" + string(getItemNumber(i,'numcampo')) )
		case 'L' //:Lista
			sql_syntax = sql_syntax +  " '' as lista_" + string(getItemNumber(i,'numcampo')) + ","
			setItem(i, 'nombre', "lista_" + string(getItemNumber(i,'numcampo')) )
		case 'R' //:Numerico
			sql_syntax = sql_syntax +  " 0.0 as numero_" + string(getItemNumber(i,'numcampo')) + ","
			setItem(i, 'nombre', "numero_" + string(getItemNumber(i,'numcampo')) )
		case 'C' //:Computado
			sql_syntax = sql_syntax +  " 0.0 as numero_" + string(getItemNumber(i,'numcampo')) + ","
			setItem(i, 'nombre', "numero_" + string(getItemNumber(i,'numcampo')) )
		case 'F' //:fecha
			if g_motor='psotgres' then 
				sql_syntax = sql_syntax +  " to_date('2000/01/01','yyyy/mm/dd') as fecha_" + string(getItemNumber(i,'numcampo')) + ","
			else
				sql_syntax = sql_syntax +  " convert(date,'2000/01/01') as fecha_" + string(getItemNumber(i,'numcampo')) + ","
			end if
			setItem(i, 'nombre', "fecha_" + string(getItemNumber(i,'numcampo')) )
	end choose
next
sql_syntax = left(sql_syntax, len(sql_syntax)-1)
stx = SQLCA.SyntaxFromSQL(sql_syntax, "style(type=grid)", err)
IF Len(err) > 0 THEN
	MessageBox("Atención", "SyntaxFromSQL causó errores: " + err)
	RETURN
END IF

dw_c.Create( stx, err)
IF Len(err) > 0 THEN
	MessageBox("Caution", "Create cause these errors: " + err)
	RETURN
END IF
dw_c.insertRow(0)

end event

event constructor;setTransObject(SQLCA)

end event

event doubleclicked;
if row < 1 then Return
mle_1.ReplaceText('@'+this.GetItemString(row,'descampo')+'@')

end event

type st_2 from statictext within w_formula_hc
integer x = 407
integer y = 684
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Columnas"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_formula_hc
integer x = 242
integer y = 956
integer width = 91
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = ")"
end type

event clicked;mle_1.ReplaceText(" ) ")
end event

type cb_5 from commandbutton within w_formula_hc
integer x = 110
integer y = 956
integer width = 91
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "("
end type

event clicked;mle_1.ReplaceText(" ( ")
end event

type cb_4 from commandbutton within w_formula_hc
integer x = 242
integer y = 852
integer width = 91
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "/"
end type

event clicked;mle_1.ReplaceText(" / ")
end event

type cb_3 from commandbutton within w_formula_hc
integer x = 110
integer y = 852
integer width = 91
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "x"
end type

event clicked;mle_1.ReplaceText(" * ")
end event

type cb_2 from commandbutton within w_formula_hc
integer x = 242
integer y = 744
integer width = 91
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "-"
end type

event clicked;mle_1.ReplaceText(" - ")
end event

type cb_1 from commandbutton within w_formula_hc
integer x = 110
integer y = 744
integer width = 91
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "+"
end type

event clicked;mle_1.ReplaceText(" + ")
end event

type st_1 from statictext within w_formula_hc
integer x = 101
integer y = 20
integer width = 1760
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_formula_hc
integer x = 96
integer y = 92
integer width = 2683
integer height = 556
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_c from datawindow within w_formula_hc
boolean visible = false
integer x = 55
integer y = 1164
integer width = 302
integer height = 188
integer taborder = 20
boolean enabled = false
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

