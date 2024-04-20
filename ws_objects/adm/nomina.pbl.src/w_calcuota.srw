$PBExportHeader$w_calcuota.srw
forward
global type w_calcuota from w_center
end type
type sle_1 from singlelineedit within w_calcuota
end type
type st_2 from statictext within w_calcuota
end type
type st_3 from statictext within w_calcuota
end type
type em_2 from editmask within w_calcuota
end type
type em_3 from editmask within w_calcuota
end type
type st_4 from statictext within w_calcuota
end type
type pb_2 from picturebutton within w_calcuota
end type
type st_6 from statictext within w_calcuota
end type
type st_1 from statictext within w_calcuota
end type
type em_1 from editmask within w_calcuota
end type
type rb_2 from radiobutton within w_calcuota
end type
type rb_1 from radiobutton within w_calcuota
end type
type gb_1 from groupbox within w_calcuota
end type
end forward

global type w_calcuota from w_center
integer width = 1893
integer height = 780
string title = "Cálculo Cuotas"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "calculo.ico"
sle_1 sle_1
st_2 st_2
st_3 st_3
em_2 em_2
em_3 em_3
st_4 st_4
pb_2 pb_2
st_6 st_6
st_1 st_1
em_1 em_1
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_calcuota w_calcuota

type variables
datawindow dw_obj
end variables

on w_calcuota.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_2=create st_2
this.st_3=create st_3
this.em_2=create em_2
this.em_3=create em_3
this.st_4=create st_4
this.pb_2=create pb_2
this.st_6=create st_6
this.st_1=create st_1
this.em_1=create em_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.em_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.pb_2
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.em_1
this.Control[iCurrent+11]=this.rb_2
this.Control[iCurrent+12]=this.rb_1
this.Control[iCurrent+13]=this.gb_1
end on

on w_calcuota.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_2)
destroy(this.em_3)
destroy(this.st_4)
destroy(this.pb_2)
destroy(this.st_6)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event open;call super::open;long acumulado
dw_obj = Message.PowerObjectParm
if dw_obj.GetRow() > 0 then
	sle_1.text = string(dw_obj.GetItemNumber(dw_obj.GetRow(),'ncuota'))
	acumulado = w_cooperativa.dw_cab.GetItemNumber(w_cooperativa.dw_cab.GetRow(),'acumulado')
	if isNull(acumulado) then acumulado = 0
	if not isNull(w_cooperativa.dw_cab.GetItemNumber(w_cooperativa.dw_cab.GetRow(),'totaldes')) then rb_2.Checked = TRUE
	em_1.text = string(w_cooperativa.dw_cab.GetItemNumber(w_cooperativa.dw_cab.GetRow(),'totaldes') - acumulado)
	em_3.text = string(date(dw_obj.GetItemDateTime(dw_obj.GetRow(),'inicia')))
else
	em_3.text = string(today())
end if

end event

type pb_grabar from w_center`pb_grabar within w_calcuota
string tag = "Calcula&r y Regresar"
integer x = 914
integer y = 552
integer taborder = 90
string text = "         &r"
boolean default = true
end type

event pb_grabar::clicked;call super::clicked;date inicio
double valor, cuotas, meses, total
em_1.GetData(total)
em_2.GetData(valor)
em_3.GetData(inicio)
cuotas = integer(sle_1.Text)
if w_cooperativa.tab_1.p_1.dw_plan.RowCount() < 1 then
	messageBox('Error','Debe crear un plan en la pestaña Planes')
	Return
end if
if cuotas > 180 then 
	if MessageBox('Aviso','Esta creando un plan demasiado largo. Esta seguro de querer continuar?',QUESTION!,YESNO!) = 2 then Return
end if
if w_cooperativa.tab_1.p_2.dw_cpo.Find("num_nomina > 0",1,w_cooperativa.tab_1.p_2.dw_cpo.RowCount()) > 0 then
	messagebox('Error','Se han cancelado cuotas para el préstamo. Deberá crear otro plan')
	Return
end if

if sle_1.Text = "" or em_3.Text="" or integer(sle_1.Text) < 0  then
	messageBox('Aviso','Debe ingresar datos válidos')
	Return
end if
if rb_2.checked then
	if em_1.Text="" then
		messageBox('Aviso','Debe ingresar datos válidos')
		Return
	end if
	valor = total / cuotas
elseif rb_1.checked then
	if em_2.Text="" then
		messageBox('Aviso','Debe ingresar datos válidos')
		Return
	end if
end if
if isNull(w_cooperativa.dw_cab.GetItemNumber(w_cooperativa.dw_cab.GetRow(),'totaldes')) then
	w_cooperativa.dw_cab.SetItem(w_cooperativa.dw_cab.GetRow(),'totaldes',cuotas * valor)
elseif w_cooperativa.dw_cab.GetItemNumber(w_cooperativa.dw_cab.GetRow(),'totaldes') <> (cuotas * valor) + w_cooperativa.dw_cab.GetItemNumber(w_cooperativa.dw_cab.GetRow(),'acumulado') then
	messageBox('Aviso','El valor calculado no corresponde con el total a deducir')
	Return
end if
if w_cooperativa.tab_1.p_2.dw_cpo.RowCount() > 0 then	
	if messageBox('Aviso','El plan de cuotas se remplazará. Desea Continuar?',QUESTION!,YESNO!) = 2 then
		Return
	end if
	w_cooperativa.tab_1.p_2.dw_cpo.Reset()
end if
w_cooperativa.addCuotas(cuotas,inicio,valor)
w_cooperativa.tab_1.p_1.dw_plan.SetItem(w_cooperativa.tab_1.p_1.dw_plan.GetRow(),'inicia',w_cooperativa.tab_1.p_2.dw_cpo.GetItemDateTime(1,'fecha'))
w_cooperativa.tab_1.p_1.dw_plan.SetItem(w_cooperativa.tab_1.p_1.dw_plan.GetRow(),'termina',w_cooperativa.tab_1.p_2.dw_cpo.GetItemDateTime(w_cooperativa.tab_1.p_2.dw_cpo.RowCount(),'fecha'))
w_cooperativa.tab_1.p_1.dw_plan.SetItem(w_cooperativa.tab_1.p_1.dw_plan.GetRow(),'ncuota',cuotas)
w_cooperativa.tab_1.SelectTab(2)
close(parent)

end event

type sle_1 from singlelineedit within w_calcuota
integer x = 155
integer y = 260
integer width = 489
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "12"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_calcuota
integer x = 155
integer y = 192
integer width = 480
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de Cuotas"
boolean focusrectangle = false
end type

type st_3 from statictext within w_calcuota
integer x = 1234
integer y = 196
integer width = 480
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valor x Cuota"
boolean focusrectangle = false
end type

type em_2 from editmask within w_calcuota
integer x = 1230
integer y = 264
integer width = 507
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#,###,###.00"
end type

event getfocus;rb_1.checked = TRUE

end event

type em_3 from editmask within w_calcuota
integer x = 699
integer y = 260
integer width = 489
integer height = 80
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_4 from statictext within w_calcuota
integer x = 699
integer y = 192
integer width = 306
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicia"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_calcuota
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 750
integer y = 552
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
end type

event clicked;Close(parent)
end event

type st_6 from statictext within w_calcuota
integer x = 197
integer y = 84
integer width = 1531
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = " Podrá cambiar el monto y número de cuotas en la pestaña Cuotas"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_calcuota
integer x = 1230
integer y = 372
integer width = 480
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total a descontar"
boolean focusrectangle = false
end type

type em_1 from editmask within w_calcuota
integer x = 1230
integer y = 436
integer width = 507
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#,###,###.00"
end type

event getfocus;rb_2.checked = TRUE

end event

type rb_2 from radiobutton within w_calcuota
integer x = 754
integer y = 428
integer width = 389
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "A Descontar"
end type

type rb_1 from radiobutton within w_calcuota
integer x = 402
integer y = 424
integer width = 265
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cuota"
boolean checked = true
end type

type gb_1 from groupbox within w_calcuota
integer x = 165
integer y = 368
integer width = 1024
integer height = 152
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Calcular por:"
end type

