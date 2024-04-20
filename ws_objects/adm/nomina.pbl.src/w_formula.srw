$PBExportHeader$w_formula.srw
forward
global type w_formula from window
end type
type cb_verificar from picturebutton within w_formula
end type
type cb_aceptar from picturebutton within w_formula
end type
type cb_cancelar from picturebutton within w_formula
end type
type st_3 from statictext within w_formula
end type
type sle_1 from singlelineedit within w_formula
end type
type cb_6 from commandbutton within w_formula
end type
type cb_5 from commandbutton within w_formula
end type
type cb_4 from commandbutton within w_formula
end type
type cb_3 from commandbutton within w_formula
end type
type cb_2 from commandbutton within w_formula
end type
type cb_1 from commandbutton within w_formula
end type
type st_2 from statictext within w_formula
end type
type st_1 from statictext within w_formula
end type
type dw_columnas from datawindow within w_formula
end type
type mle_1 from multilineedit within w_formula
end type
type dw_historia from datawindow within w_formula
end type
type dw_traduce from datawindow within w_formula
end type
type dw_funciones from datawindow within w_formula
end type
end forward

global type w_formula from window
integer width = 4471
integer height = 1612
boolean titlebar = true
string title = "Fórmulas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "plan.ico"
cb_verificar cb_verificar
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
st_3 st_3
sle_1 sle_1
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
dw_columnas dw_columnas
mle_1 mle_1
dw_historia dw_historia
dw_traduce dw_traduce
dw_funciones dw_funciones
end type
global w_formula w_formula

type variables
//datawindow dw_emp
st_nomina st_nom
string rta, verificar
uo_datastore dw_req

end variables

on w_formula.create
this.cb_verificar=create cb_verificar
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.st_3=create st_3
this.sle_1=create sle_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_columnas=create dw_columnas
this.mle_1=create mle_1
this.dw_historia=create dw_historia
this.dw_traduce=create dw_traduce
this.dw_funciones=create dw_funciones
this.Control[]={this.cb_verificar,&
this.cb_aceptar,&
this.cb_cancelar,&
this.st_3,&
this.sle_1,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.dw_columnas,&
this.mle_1,&
this.dw_historia,&
this.dw_traduce,&
this.dw_funciones}
end on

on w_formula.destroy
destroy(this.cb_verificar)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_columnas)
destroy(this.mle_1)
destroy(this.dw_historia)
destroy(this.dw_traduce)
destroy(this.dw_funciones)
end on

event open;long fila, i
string ret

st_nom = Message.PowerObjectParm

dw_funciones.SetTransObject(SQLCA)
dw_traduce.SetTransObject(SQLCA)
dw_historia.SetTransObject(SQLCA)
dw_funciones.Retrieve()
dw_traduce.Retrieve()
dw_req = CREATE uo_datastore
dw_req.DataObject = "dw_concep_req"
dw_req.SetTransObject(SQLCA)

if isNull(st_nom.tipodoc) or st_nom.tipodoc = '' then st_nom.tipodoc = 'CC'
if isNull(st_nom.documento) or st_nom.documento = '' then st_nom.documento = '123456'
mle_1.Text = st_nom.dw_obj.GetItemString(st_nom.dw_obj.GetRow(),st_nom.valor)
traduceFmla(mle_1.Text,mle_1.Text,'ES')
mle_1.SelectText(1,len(mle_1.Text))
st_3.text = st_nom.dw_obj.GetItemString(st_nom.dw_obj.GetRow(),'sigla') + " - " + st_nom.dw_obj.GetItemString(st_nom.dw_obj.GetRow(),'des_concep')
if st_nom.valor = 'des_formula' then Return

dw_historia.Retrieve(st_nom.tipodoc, st_nom.documento,'0','')
if dw_historia.RowCount() = 0 then
	dw_historia.InsertRow(1)
end if
i = 1
ret = dw_historia.Describe('#' + string(i) + '.Coltype')
do while ret <> '!'
	fila = dw_columnas.insertRow(0)
	dw_columnas.SetItem(fila,'tipo',ret)
	dw_columnas.SetItem(fila,'nombre',dw_historia.Describe('#' + string(i) + '.Name'))
	dw_columnas.SetItem(fila,'campo',dw_historia.Describe('#' + string(i) + '.dbName'))
	ret = dw_historia.Describe('#' + string(i) + '.Tag')
	ret = dw_historia.Describe('#' + string(i) + '.Tag')
	if ret = '?' then ret = ''
	dw_columnas.SetItem(fila,'ayuda',upper(ret))
	i = i + 1
	ret = dw_historia.Describe('#' + string(i) + '.Coltype')
loop

i = 1
for i = 1 to st_nom.dw_obj.RowCount()
	fila = dw_columnas.insertRow(0)
	dw_columnas.SetItem(fila,'tipo','double')
	dw_columnas.SetItem(fila,'nombre',st_nom.dw_obj.GetItemString(i,'sigla'))
	dw_columnas.SetItem(fila,'campo',st_nom.dw_obj.GetItemString(i,'cod_concep'))
	dw_columnas.SetItem(fila,'ayuda',st_nom.dw_obj.GetItemString(i,'des_concep'))
	addcompute(dw_historia, st_nom.dw_obj.GetItemString(i,'sigla'), st_nom.dw_obj.GetItemString(i,'form_calculo'))
next
dw_columnas.SetSort("nombre A")
dw_columnas.Sort()

end event

type cb_verificar from picturebutton within w_formula
string tag = "Verificar Formula"
integer x = 4288
integer y = 392
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
string picturename = "verifica.gif"
alignment htextalign = left!
end type

event clicked;long inicio, posicion, i

traducefmla(mle_1.Text, verificar, 'EN')
rta = dw_historia.describe("Evaluate('" + verificar + "',1)")
sle_1.text = rta
if isNull(rta) then
	messageBox('Aviso','Alguno de los parametros resulto nulo')
elseif rta <> '!' then
	messageBox('Aviso','Sintaxis Correcta')
else
	messageBox('Sintaxis PB',verificar)
end if

end event

type cb_aceptar from picturebutton within w_formula
integer x = 4283
integer y = 96
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
end type

event clicked;long inicio, posicion, i, ncon
string cod_concep, cod_concep_req, sigla, sigla_req, buffer

traducefmla(mle_1.Text, verificar, 'EN')
rta = dw_historia.describe("Evaluate('" + verificar + "',1)")

if isNull(rta) then
	messageBox('Aviso','Alguno de los parametros resulto nulo')
elseif rta <> '!' then
	cod_concep = st_nom.dw_obj.GetItemString(st_nom.dw_obj.GetRow(),'cod_concep')
	sigla = st_nom.dw_obj.GetItemString(st_nom.dw_obj.GetRow(),'sigla')
	delete from nom_concep_req where cod_concep = :cod_concep;
	
	for i = 1 to st_nom.dw_obj.RowCount()
		inicio = 1
		posicion = pos(upper(verificar), upper(st_nom.dw_obj.GetItemString(i,'sigla')), inicio)
		do while posicion > 0
//			buffer = mid(upper(verificar),inicio,posicion + len(st_nom.dw_obj.GetItemString(i,'sigla')) - inicio + 1)
//			buffer = mid(upper(verificar),posicion - 1,posicion + len(st_nom.dw_obj.GetItemString(i,'sigla')) - inicio + 1)
			buffer = mid(upper(verificar),posicion - 1,len(st_nom.dw_obj.GetItemString(i,'sigla')) + 2)
			if not (match(buffer, '"' + upper(st_nom.dw_obj.GetItemString(i,'sigla')) + '"') or match(buffer,"^[A-Za-z_]") ) then
				cod_concep_req = st_nom.dw_obj.GetItemString(i,'cod_concep')
				sigla_req = st_nom.dw_obj.GetItemString(i,'sigla')
				select count(*) into :ncon from nom_concep_req where cod_concep=:cod_concep and cod_concep_req=:cod_concep_req;
				if ncon = 0 then
					insert into nom_concep_req values(:cod_concep, :cod_concep_req, :sigla, :sigla_req);				
				end if
			end if
			inicio = posicion + len(st_nom.dw_obj.GetItemString(i,'sigla'))
			posicion = pos(upper(verificar), upper(st_nom.dw_obj.GetItemString(i,'sigla')), inicio)

//			if match(verificar,st_nom.dw_obj.GetItemString(i,'sigla')) then
//				if not match(verificar,'"' + st_nom.dw_obj.GetItemString(i,'sigla') + '"') then
//					cod_concep_req = st_nom.dw_obj.GetItemString(i,'cod_concep')
//					sigla_req = st_nom.dw_obj.GetItemString(i,'sigla')
//					insert into nom_concep_req values(:cod_concep, :cod_concep_req, :sigla, :sigla_req);
//				end if
//			end if
		loop
	next
	st_nom.dw_obj.SetItem(st_nom.dw_obj.GetRow(),st_nom.valor,verificar)
	w_concep.cambio=true
	close(parent)
end if

end event

type cb_cancelar from picturebutton within w_formula
integer x = 4283
integer y = 244
integer width = 146
integer height = 128
integer taborder = 10
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
end type

event clicked;close(parent)
end event

type st_3 from statictext within w_formula
integer x = 110
integer y = 12
integer width = 2025
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_formula
boolean visible = false
integer x = 393
integer y = 1368
integer width = 3845
integer height = 68
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_formula
integer x = 110
integer y = 1056
integer width = 96
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "("
end type

type cb_5 from commandbutton within w_formula
integer x = 256
integer y = 1056
integer width = 91
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = ")"
end type

type cb_4 from commandbutton within w_formula
integer x = 256
integer y = 932
integer width = 91
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "/"
end type

event clicked;mle_1.ReplaceText(" / ")
end event

type cb_3 from commandbutton within w_formula
integer x = 256
integer y = 808
integer width = 91
integer height = 88
integer taborder = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "-"
end type

event clicked;mle_1.ReplaceText(" - ")
end event

type cb_2 from commandbutton within w_formula
integer x = 110
integer y = 932
integer width = 91
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
string text = "*"
end type

event clicked;mle_1.ReplaceText(" * ")
end event

type cb_1 from commandbutton within w_formula
integer x = 110
integer y = 808
integer width = 91
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "+"
end type

event clicked;mle_1.ReplaceText(" + ")
end event

type st_2 from statictext within w_formula
integer x = 1330
integer y = 720
integer width = 343
integer height = 52
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

type st_1 from statictext within w_formula
integer x = 421
integer y = 720
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
string text = "Funciones"
boolean focusrectangle = false
end type

type dw_columnas from datawindow within w_formula
event mousemove pbm_dwnmousemove
integer x = 1477
integer y = 796
integer width = 2770
integer height = 560
integer taborder = 120
string title = "none"
string dataobject = "dw_parametros"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;if row < 1 then Return
sle_1.Text = this.GetItemString(row,'ayuda')
end event

event doubleclicked;
if row < 1 then Return
if this.GetColumnName() = 'nombre' then
	mle_1.ReplaceText(" " + this.GetItemString(row,'nombre') + " ")
end if

end event

type mle_1 from multilineedit within w_formula
integer x = 114
integer y = 92
integer width = 4128
integer height = 604
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_historia from datawindow within w_formula
boolean visible = false
integer x = 3470
integer y = 632
integer width = 91
integer height = 108
integer taborder = 130
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_historia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;messageBox('Formula',string(dwo.name))
end event

type dw_traduce from datawindow within w_formula
boolean visible = false
integer x = 3465
integer y = 760
integer width = 87
integer height = 92
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_traduce"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_funciones from datawindow within w_formula
event mousemove pbm_dwnmousemove
integer x = 402
integer y = 796
integer width = 960
integer height = 556
integer taborder = 110
string title = "none"
string dataobject = "dw_funciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;if row < 1 then Return
sle_1.Text = this.GetItemString(row,'ayuda')
end event

event doubleclicked;
if row < 1 then Return
if this.GetColumnName() = 'f_espanol' then
	mle_1.ReplaceText(this.GetItemString(row,'f_espanol'))
end if

end event

