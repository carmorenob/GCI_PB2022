$PBExportHeader$w_campos_funcion.srw
forward
global type w_campos_funcion from window
end type
type st_2 from statictext within w_campos_funcion
end type
type st_1 from statictext within w_campos_funcion
end type
type pb_2 from picturebutton within w_campos_funcion
end type
type pb_1 from picturebutton within w_campos_funcion
end type
type lb_2 from listbox within w_campos_funcion
end type
type lb_1 from listbox within w_campos_funcion
end type
type gb_1 from groupbox within w_campos_funcion
end type
type mle_1 from multilineedit within w_campos_funcion
end type
end forward

global type w_campos_funcion from window
integer width = 2217
integer height = 1400
boolean titlebar = true
string title = "Campos Computados"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "contrato.ico"
st_2 st_2
st_1 st_1
pb_2 pb_2
pb_1 pb_1
lb_2 lb_2
lb_1 lb_1
gb_1 gb_1
mle_1 mle_1
end type
global w_campos_funcion w_campos_funcion

type variables
string expresion
long informe
st_parm st_parametro
datawindow dw_1

end variables

event open;long num_cols,j
st_parametro = Message.PowerObjectParm
dw_1 = st_parametro.dw_obj
//dw_1.dataobject='dw_entrada'
//dw_1.settransobject(sqlca)

expresion="f_letras(15005055,58)"
//CHOOSE CASE informe
//	CASE 1
//		dw_1.retrieve(w_contrato.dw_2.getitemnumber(w_contrato.dw_2.getrow(),1),w_contrato.dw_2.getitemnumber(w_contrato.dw_2.getrow(),2))
//	case 2
//		dw_1.retrieve(w_contrato_nuevo.dw_2.getitemnumber(w_contrato_nuevo.dw_2.getrow(),1),w_contrato_nuevo.dw_2.getitemnumber(w_contrato_nuevo.dw_2.getrow(),2))
//END CHOOSE
num_cols=long(dw_1.describe("datawindow.column.count"))
for j=1 to num_cols
	lb_1.additem(dw_1.describe("#"+string(j)+".name"))
next


//double numerito
//string pp
//int decima
//pp=mid(sle_1.text,pos(sle_1.text,",")+1,2)
//decima=long(pp)
//numerito=double(sle_1.text)
//messagebox(string(numerito),f_letras(numerito,decima))

end event

on w_campos_funcion.create
this.st_2=create st_2
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.lb_2=create lb_2
this.lb_1=create lb_1
this.gb_1=create gb_1
this.mle_1=create mle_1
this.Control[]={this.st_2,&
this.st_1,&
this.pb_2,&
this.pb_1,&
this.lb_2,&
this.lb_1,&
this.gb_1,&
this.mle_1}
end on

on w_campos_funcion.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.lb_2)
destroy(this.lb_1)
destroy(this.gb_1)
destroy(this.mle_1)
end on

type st_2 from statictext within w_campos_funcion
integer x = 823
integer y = 560
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
string text = "Campo"
boolean focusrectangle = false
end type

type st_1 from statictext within w_campos_funcion
integer x = 151
integer y = 556
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
string text = "Funcion"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_campos_funcion
integer x = 1897
integer y = 592
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_campos_funcion
integer x = 1751
integer y = 592
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;//w_rte.rte_1.replacetext(string(mle_1.text))
//w_rte.rte_1.InputFieldInsert(expresion)
string rta

rta = dw_1.describe("Evaluate('" + mle_1.text + "',1)")

if isNull(rta) then
	messageBox('Aviso','Alguno de los parametros resulto nulo')
elseif rta <> '!' then
	w_rte.rte_1.InputFieldInsert('compute_10')
	w_rte.rte_1.InputFieldchangedata('compute_10',rta)
else
	messageBox('Sintaxis Incorrecta', rta)
end if

end event

type lb_2 from listbox within w_campos_funcion
integer x = 146
integer y = 628
integer width = 594
integer height = 604
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"sum( campo )","count( campo )","f_letras( entero,desimal )","if( expresion,verdadero,falso)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string nombre
nombre=this.text(index)
//w_rte.rte_1.InputFieldchangedata(nombre,dw_1.getitemstring(dw_1.getrow(),3))
//w_rte.rte_1.InputFieldInsert(nombre)
expresion=mle_1.text+nombre
mle_1.text=expresion
end event

type lb_1 from listbox within w_campos_funcion
integer x = 823
integer y = 628
integer width = 800
integer height = 608
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string nombre
nombre=this.text(index)
//w_rte.rte_1.InputFieldchangedata(nombre,dw_1.getitemstring(dw_1.getrow(),3))
//w_rte.rte_1.InputFieldInsert(nombre)
expresion=mle_1.text+nombre
mle_1.text=expresion
//w_rte.of_insert_datafield(nombre)
end event

type gb_1 from groupbox within w_campos_funcion
integer x = 123
integer y = 56
integer width = 1915
integer height = 492
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Expresión"
end type

type mle_1 from multilineedit within w_campos_funcion
integer x = 169
integer y = 136
integer width = 1824
integer height = 376
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

