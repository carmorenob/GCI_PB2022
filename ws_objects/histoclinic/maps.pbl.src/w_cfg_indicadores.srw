$PBExportHeader$w_cfg_indicadores.srw
forward
global type w_cfg_indicadores from window
end type
type t1 from tab within w_cfg_indicadores
end type
type p1 from userobject within t1
end type
type pb_2 from picturebutton within p1
end type
type pb_3 from picturebutton within p1
end type
type dw_r from datawindow within p1
end type
type p1 from userobject within t1
pb_2 pb_2
pb_3 pb_3
dw_r dw_r
end type
type p2 from userobject within t1
end type
type cb_1 from commandbutton within p2
end type
type pb_6 from picturebutton within p2
end type
type pb_5 from picturebutton within p2
end type
type st_4 from statictext within p2
end type
type st_3 from statictext within p2
end type
type st_c from statictext within p2
end type
type st_d from statictext within p2
end type
type st_p from statictext within p2
end type
type st_2 from statictext within p2
end type
type rb_b from radiobutton within p2
end type
type rb_c from radiobutton within p2
end type
type rb_d from radiobutton within p2
end type
type rb_p from radiobutton within p2
end type
type mle_1 from multilineedit within p2
end type
type dw_parm from datawindow within p2
end type
type p2 from userobject within t1
cb_1 cb_1
pb_6 pb_6
pb_5 pb_5
st_4 st_4
st_3 st_3
st_c st_c
st_d st_d
st_p st_p
st_2 st_2
rb_b rb_b
rb_c rb_c
rb_d rb_d
rb_p rb_p
mle_1 mle_1
dw_parm dw_parm
end type
type t1 from tab within w_cfg_indicadores
p1 p1
p2 p2
end type
type pb_4 from picturebutton within w_cfg_indicadores
end type
type st_1 from statictext within w_cfg_indicadores
end type
type pb_del from picturebutton within w_cfg_indicadores
end type
type pb_1 from picturebutton within w_cfg_indicadores
end type
type dw_i from datawindow within w_cfg_indicadores
end type
end forward

global type w_cfg_indicadores from window
integer width = 3177
integer height = 1916
boolean titlebar = true
string title = "Indicadores Epidemiológicos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
t1 t1
pb_4 pb_4
st_1 st_1
pb_del pb_del
pb_1 pb_1
dw_i dw_i
end type
global w_cfg_indicadores w_cfg_indicadores

type variables
string i_nivel

end variables

forward prototypes
public function string replace_parm (string sintaxis)
end prototypes

public function string replace_parm (string sintaxis);long p, i
string stx, valor

p = pos(sintaxis,"[cod_pais]")
do while p > 0
	stx = replace(sintaxis,p,10,"'01'")
	p = pos(stx,"[cod_pais]")	
loop
p = pos(stx,"[cod_depto]")
do while p > 0
	stx = replace(stx,p,11,"'01'")
	p = pos(stx,"[cod_depto]")	
loop
p = pos(stx,"[cod_ciudad]")
do while p > 0
	stx = replace(stx,p,12,"'01'")
	p = pos(stx,"[cod_ciudad]")	
loop

for i = 1 to t1.p2.dw_parm.RowCount()
	if t1.p2.dw_parm.GetItemString(i,'tipo') = 'String' then
		valor = "'01'"
	elseif t1.p2.dw_parm.GetItemString(i,'tipo') = 'Number' then
		valor = "0"
	elseif t1.p2.dw_parm.GetItemString(i,'tipo') = 'DateTime' then
		valor = "'" + string(datetime(today()),'yyyy/mm/dd') + "'"
	elseif t1.p2.dw_parm.GetItemString(i,'tipo') = 'Date' then
		valor = "'" + string(date(today()),'yyyy/mm/dd') +"'"
	end if

	p = pos(stx,"["+t1.p2.dw_parm.GetItemString(i,'nombre')+"]")
	do while p > 0
		stx = replace(stx,p,len(t1.p2.dw_parm.GetItemString(i,'nombre')) + 2,valor)
		p = pos(stx,"["+t1.p2.dw_parm.GetItemString(i,'nombre')+"]")	
	loop

next

Return stx

end function

on w_cfg_indicadores.create
this.t1=create t1
this.pb_4=create pb_4
this.st_1=create st_1
this.pb_del=create pb_del
this.pb_1=create pb_1
this.dw_i=create dw_i
this.Control[]={this.t1,&
this.pb_4,&
this.st_1,&
this.pb_del,&
this.pb_1,&
this.dw_i}
end on

on w_cfg_indicadores.destroy
destroy(this.t1)
destroy(this.pb_4)
destroy(this.st_1)
destroy(this.pb_del)
destroy(this.pb_1)
destroy(this.dw_i)
end on

event closequery;long fila
if t1.p1.dw_r.modifiedCount() > 0 or t1.p1.dw_r.DeletedCount() > 0 or dw_i.ModifiedCount() > 0 then
	integer ret
	ret = MessageBox('Atención','No ha guardado los cambios. Desea Guardar los cambios?',Question!,YesNoCancel!)
	if ret = 1 then
		Return pb_4.Event clicked()
	elseif ret = 3 then 
		Return -1
	end if
end if

end event

type t1 from tab within w_cfg_indicadores
event create ( )
event destroy ( )
integer x = 50
integer y = 620
integer width = 3013
integer height = 1096
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
p1 p1
p2 p2
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.Control[]={this.p1,&
this.p2}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
end on

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2976
integer height = 980
long backcolor = 67108864
string text = "Rangos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_2 pb_2
pb_3 pb_3
dw_r dw_r
end type

on p1.create
this.pb_2=create pb_2
this.pb_3=create pb_3
this.dw_r=create dw_r
this.Control[]={this.pb_2,&
this.pb_3,&
this.dw_r}
end on

on p1.destroy
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.dw_r)
end on

type pb_2 from picturebutton within p1
integer x = 2318
integer y = 68
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Registro"
end type

event clicked;dw_r.deleteRow(0)

end event

type pb_3 from picturebutton within p1
integer x = 2167
integer y = 68
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar Registro"
end type

event clicked;if dw_i.RowCount() = 0 then Return 0
if isNull(dw_i.GetItemString(dw_i.GetRow(),'cod_indicador')) or trim(dw_i.GetItemString(dw_i.GetRow(),'cod_indicador')) = '' then 
	MessageBox('Atención','Digite un codigo de indicador en la malla superior')
	Return 0
end if
long f
f = dw_r.InsertRow(0)
dw_r.ScrolltoRow(f)
dw_r.SetItem(f,'cod_indicador',dw_i.GetItemString(dw_i.GetRow(),'cod_indicador'))
dw_r.SetItem(f,'item',long(dw_r.describe("Evaluate('max(item)',0)")) + 1)

end event

type dw_r from datawindow within p1
event cambia_col ( )
integer x = 41
integer y = 68
integer width = 2094
integer height = 824
integer taborder = 50
string title = "none"
string dataobject = "dw_ind_rangos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event cambia_col();SetColumn('descripcion')

end event

event clicked;long color
if dwo.name = 'color' then
	color = GetItemNumber(Row,'color')
	if isNull(color) then color = RGB(255,255,255)
	choosecolor(color)
	SetItem(Row,'color',color)
	PostEvent('cambia_col')
end if

end event

event constructor;setTransObject(SQLCA)

end event

event itemfocuschanged;//if dwo.name = 'color' then
//	event clicked(0,0,row,dwo)
//end if
//
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1

end event

type p2 from userobject within t1
integer x = 18
integer y = 100
integer width = 2976
integer height = 980
long backcolor = 67108864
string text = "Consultas"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
pb_6 pb_6
pb_5 pb_5
st_4 st_4
st_3 st_3
st_c st_c
st_d st_d
st_p st_p
st_2 st_2
rb_b rb_b
rb_c rb_c
rb_d rb_d
rb_p rb_p
mle_1 mle_1
dw_parm dw_parm
end type

on p2.create
this.cb_1=create cb_1
this.pb_6=create pb_6
this.pb_5=create pb_5
this.st_4=create st_4
this.st_3=create st_3
this.st_c=create st_c
this.st_d=create st_d
this.st_p=create st_p
this.st_2=create st_2
this.rb_b=create rb_b
this.rb_c=create rb_c
this.rb_d=create rb_d
this.rb_p=create rb_p
this.mle_1=create mle_1
this.dw_parm=create dw_parm
this.Control[]={this.cb_1,&
this.pb_6,&
this.pb_5,&
this.st_4,&
this.st_3,&
this.st_c,&
this.st_d,&
this.st_p,&
this.st_2,&
this.rb_b,&
this.rb_c,&
this.rb_d,&
this.rb_p,&
this.mle_1,&
this.dw_parm}
end on

on p2.destroy
destroy(this.cb_1)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_c)
destroy(this.st_d)
destroy(this.st_p)
destroy(this.st_2)
destroy(this.rb_b)
destroy(this.rb_c)
destroy(this.rb_d)
destroy(this.rb_p)
destroy(this.mle_1)
destroy(this.dw_parm)
end on

type cb_1 from commandbutton within p2
integer x = 1381
integer y = 12
integer width = 434
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Verificar Consulta"
end type

event clicked;String consulta, err
if trim(mle_1.Text) = '' then Return 0
consulta = replace_parm(mle_1.Text)
if not isNull(consulta) and len(trim(consulta)) > 0 then
	consulta = SQLCA.SyntaxFromSQL(consulta,'',err)
	if Len(err) > 0 THEN
		MessageBox("Error de sintaxis en la consulta", err)
		Return -1
	else
		MessageBox("Indicadores", "Sintaxis correcta")
	end if
//	if dw_val.Create(sintaxis,err) = -1 then
//		MessageBox("Error creando datawindow desde consulta Indicador", err)
//		Return -1
//	end if
//	dw_val.setTransObject(SQLCA)
end if
Return 0

end event

type pb_6 from picturebutton within p2
integer x = 2715
integer y = 204
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Parámetro"
end type

event clicked;dw_parm.DeleteRow(0)

end event

type pb_5 from picturebutton within p2
integer x = 2565
integer y = 204
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
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar Parámetro"
end type

event clicked;if dw_i.RowCount() = 0 then Return 0
if isNull(dw_i.GetItemString(dw_i.GetRow(),'cod_indicador')) or trim(dw_i.GetItemString(dw_i.GetRow(),'cod_indicador')) = '' then 
	MessageBox('Atención','Digite un codigo de indicador en la malla superior')
	Return 0
end if
long fila
fila = dw_parm.InsertRow(0)
dw_parm.Scrolltorow(fila)
dw_parm.SetItem(fila,'cod_indicador',dw_i.GetItemString(dw_i.GetRow(),'cod_indicador'))
dw_parm.SetItem(fila,'nivel',i_nivel)
SetFocus(dw_parm)

end event

type st_4 from statictext within p2
integer x = 1856
integer y = 288
integer width = 549
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parámetros:"
boolean focusrectangle = false
end type

type st_3 from statictext within p2
integer x = 46
integer y = 900
integer width = 2149
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "La consulta debe retornar dos campos: El código del área geográfica (depto,ciudad,...) y el valor"
boolean focusrectangle = false
end type

type st_c from statictext within p2
boolean visible = false
integer x = 1856
integer y = 212
integer width = 352
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "[cod_ciudad]"
boolean focusrectangle = false
end type

type st_d from statictext within p2
boolean visible = false
integer x = 1856
integer y = 144
integer width = 334
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "[cod_depto]"
boolean focusrectangle = false
end type

type st_p from statictext within p2
integer x = 1856
integer y = 76
integer width = 320
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "[cod_pais]"
boolean focusrectangle = false
end type

type st_2 from statictext within p2
integer x = 1861
integer y = 20
integer width = 549
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parámetros obligatorios:"
boolean focusrectangle = false
end type

type rb_b from radiobutton within p2
boolean visible = false
integer x = 1490
integer y = 16
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Barrio"
end type

event clicked;if dw_i.RowCount() = 0 then Return 0
t1.p2.mle_1.Text = dw_i.GetItemString(dw_i.GetRow(),'SQL_barrio')
st_p.Visible = TRUE
st_d.Visible = TRUE
st_c.Visible = TRUE

end event

type rb_c from radiobutton within p2
integer x = 1070
integer y = 16
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ciudad"
end type

event clicked;if dw_i.RowCount() = 0 then Return 0
t1.p2.mle_1.Text = dw_i.GetItemString(dw_i.GetRow(),'SQL_ciudad')
t1.p2.dw_parm.SetFilter("nivel='C'")
t1.p2.dw_parm.Filter()
i_nivel = 'C'
st_p.Visible = TRUE
st_d.Visible = TRUE
st_c.Visible = TRUE

end event

type rb_d from radiobutton within p2
integer x = 480
integer y = 16
integer width = 384
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Departamento"
end type

event clicked;if dw_i.RowCount() = 0 then Return 0
t1.p2.mle_1.Text = dw_i.GetItemString(dw_i.GetRow(),'SQL_depto')
t1.p2.dw_parm.SetFilter("nivel='D'")
t1.p2.dw_parm.Filter()
i_nivel = 'D'
st_p.Visible = TRUE
st_d.Visible = TRUE
st_c.Visible = FALSE

end event

type rb_p from radiobutton within p2
integer x = 73
integer y = 16
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pais"
boolean checked = true
end type

event clicked;if dw_i.RowCount() = 0 then Return 0
t1.p2.mle_1.Text = dw_i.GetItemString(dw_i.GetRow(),'SQL_pais')
t1.p2.dw_parm.SetFilter("nivel='P'")
t1.p2.dw_parm.Filter()
i_nivel = 'P'
st_p.Visible = TRUE
st_d.Visible = FALSE
st_c.Visible = FALSE

end event

type mle_1 from multilineedit within p2
integer x = 64
integer y = 96
integer width = 1746
integer height = 768
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event modified;if rb_p.checked then
	if pos(text,"[cod_pais]") = 0 then
		MessageBox('Atención','Debe usar el parámetro [cod_pais]')
		Return -1
	end if
	dw_i.SetItem(dw_i.GetRow(),'SQL_pais',text)
elseif rb_d.checked then
	if pos(text,"[cod_pais]") = 0 or pos(text,"[cod_depto]") = 0 then
		MessageBox('Atención','Debe usar el parámetro [cod_pais] y [cod_depto]')
		Return -1
	end if
	dw_i.SetItem(dw_i.GetRow(),'SQL_depto',text)
elseif rb_c.checked then
	if pos(text,"[cod_pais]") = 0 or pos(text,"[cod_depto]") = 0 or pos(text,"[cod_ciudad]") = 0 then
		MessageBox('Atención','Debe usar el parámetro [cod_pais], [cod_depto] y [cod_ciudad]')
		Return -1
	end if
	dw_i.SetItem(dw_i.GetRow(),'SQL_ciudad',text)
elseif rb_b.checked then
	dw_i.SetItem(dw_i.GetRow(),'SQL_barrio',text)
end if

end event

event losefocus;event modified()

end event

type dw_parm from datawindow within p2
integer x = 1847
integer y = 352
integer width = 1051
integer height = 512
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ind_parm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event doubleclicked;if row < 1 then Return
if this.GetColumnName() = 'nombre' then
	mle_1.ReplaceText("[" + this.GetItemString(row,'nombre') + "]")
end if

end event

type pb_4 from picturebutton within w_cfg_indicadores
integer x = 2446
integer y = 340
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "              &G"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if dw_i.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.p1.dw_r.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.p2.dw_parm.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
dw_i.ResetUpdate()
t1.p1.dw_r.ResetUpdate()
t1.p2.dw_parm.ResetUpdate()
commit;
Return 0

end event

type st_1 from statictext within w_cfg_indicadores
integer x = 59
integer y = 8
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Indicadores"
boolean focusrectangle = false
end type

type pb_del from picturebutton within w_cfg_indicadores
integer x = 2446
integer y = 208
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Indicador"
end type

event clicked;if t1.p1.dw_r.RowCount() > 0 then
	MessageBox('Atención','Debe borrar los rangos del indicador')
	Return 0
end if
dw_i.DeleteRow(0)
dw_i.event rowFocusChanged(dw_i.GetRow())

end event

type pb_1 from picturebutton within w_cfg_indicadores
integer x = 2446
integer y = 72
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
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Indicador"
end type

event clicked;long fila
if t1.p1.dw_r.modifiedCount() > 0 or t1.p1.dw_r.DeletedCount() > 0 then
	integer ret
	ret = MessageBox('Atención','No ha guardado los cambios. Desea Guardar los cambios?',Question!,YesNoCancel!)
	if ret = 1 then
		Return pb_4.Event clicked()
	elseif ret = 3 then 
		Return -1
	end if
end if
fila = dw_i.InsertRow(0)
dw_i.Scrolltorow(fila)
SetFocus(dw_i)

end event

type dw_i from datawindow within w_cfg_indicadores
integer x = 59
integer y = 68
integer width = 2359
integer height = 512
integer taborder = 10
string title = "none"
string dataobject = "dw_indicadores"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
Retrieve()

end event

event rowfocuschanging;if t1.p1.dw_r.modifiedCount() > 0 or t1.p1.dw_r.DeletedCount() > 0 then
	integer ret
	ret = MessageBox('Atención','No ha guardado los cambios. Desea guardar los cambios?',Question!,YesNoCancel!)
	if ret = 1 then
		Return pb_4.Event clicked()
	elseif ret = 3 then 
		Return -1
	end if
end if

end event

event rowfocuschanged;t1.p1.dw_r.Reset()
if RowCount() = 0 or currentrow = 0 then Return 0
t1.p1.dw_r.Retrieve(GetItemString(GetRow(),'cod_indicador'))
t1.p2.dw_parm.Retrieve(GetItemString(GetRow(),'cod_indicador'))
if t1.p2.rb_p.checked then
	t1.p2.mle_1.Text = GetItemString(GetRow(),'SQL_pais')
	t1.p2.dw_parm.SetFilter("nivel='P'")
	i_nivel = 'P'
elseif t1.p2.rb_d.checked then
	t1.p2.mle_1.Text = GetItemString(GetRow(),'SQL_depto')
	t1.p2.dw_parm.SetFilter("nivel='D'")
	i_nivel = 'D'
elseif t1.p2.rb_c.checked then
	t1.p2.mle_1.Text = GetItemString(GetRow(),'SQL_ciudad')
	t1.p2.dw_parm.SetFilter("nivel='C'")
	i_nivel = 'C'
elseif t1.p2.rb_b.checked then
	t1.p2.mle_1.Text = GetItemString(GetRow(),'SQL_barrio')
	t1.p2.dw_parm.SetFilter("nivel='B'")
	i_nivel = 'B'
end if
t1.p2.dw_parm.Filter()

end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1

end event

