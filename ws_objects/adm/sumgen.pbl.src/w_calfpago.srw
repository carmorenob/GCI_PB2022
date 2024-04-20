$PBExportHeader$w_calfpago.srw
forward
global type w_calfpago from w_center
end type
type sle_cuotas from singlelineedit within w_calfpago
end type
type st_2 from statictext within w_calfpago
end type
type em_porc from editmask within w_calfpago
end type
type st_4 from statictext within w_calfpago
end type
type pb_2 from picturebutton within w_calfpago
end type
type st_1 from statictext within w_calfpago
end type
type em_monto from editmask within w_calfpago
end type
type rb_porc from radiobutton within w_calfpago
end type
type rb_cuotas from radiobutton within w_calfpago
end type
type gb_1 from groupbox within w_calfpago
end type
end forward

global type w_calfpago from w_center
integer width = 1893
integer height = 740
string title = "Cálculo Cuotas"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "calculo.ico"
sle_cuotas sle_cuotas
st_2 st_2
em_porc em_porc
st_4 st_4
pb_2 pb_2
st_1 st_1
em_monto em_monto
rb_porc rb_porc
rb_cuotas rb_cuotas
gb_1 gb_1
end type
global w_calfpago w_calfpago

type variables
long idb_acumulado
integer ii_cuotas
datawindow idw_dwobj
st_otrosi ist_p
end variables
on w_calfpago.create
int iCurrent
call super::create
this.sle_cuotas=create sle_cuotas
this.st_2=create st_2
this.em_porc=create em_porc
this.st_4=create st_4
this.pb_2=create pb_2
this.st_1=create st_1
this.em_monto=create em_monto
this.rb_porc=create rb_porc
this.rb_cuotas=create rb_cuotas
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_cuotas
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.em_porc
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.pb_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.em_monto
this.Control[iCurrent+8]=this.rb_porc
this.Control[iCurrent+9]=this.rb_cuotas
this.Control[iCurrent+10]=this.gb_1
end on

on w_calfpago.destroy
call super::destroy
destroy(this.sle_cuotas)
destroy(this.st_2)
destroy(this.em_porc)
destroy(this.st_4)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.em_monto)
destroy(this.rb_porc)
destroy(this.rb_cuotas)
destroy(this.gb_1)
end on

event open;call super::open;ist_p = Message.PowerObjectParm

idb_acumulado = ist_p.dw_cab.GetItemNumber(ist_p.dw_cab.GetRow(),'monto')
if isNull(idb_acumulado) then idb_acumulado = 0	

ii_cuotas = ist_p.dw_cab.GetItemNumber(ist_p.dw_cab.GetRow(),'meses')
if isNull(ii_cuotas) then ii_cuotas = 12	

ist_p.dw_cab.GetItemNumber(ist_p.dw_cab.GetRow(),'monto')

em_monto.text = string(idb_acumulado)
sle_cuotas.text= string(ii_cuotas)
em_porc.text = string(100/ii_cuotas)

end event

type pb_grabar from w_center`pb_grabar within w_calfpago
integer x = 914
integer y = 492
integer taborder = 70
string text = "         &r"
boolean default = true
string powertiptext = "Calcula&r y Regresar"
end type

event pb_grabar::clicked;call super::clicked;date inicio
decimal valor,  porciento, total
em_monto.GetData(total)
em_porc.GetData(porciento)

ii_cuotas = integer(sle_cuotas.Text)

if ii_cuotas > 180 then 
	if MessageBox('Aviso','Esta creando un plan demasiado largo. Esta seguro de querer continuar?',QUESTION!,YESNO!) = 2 then Return
end if

if sle_cuotas.Text = "" or em_porc.Text="" or integer(sle_cuotas.Text) < 0  then
	messageBox('Aviso','Debe ingresar datos válidos')
	Return
end if
if rb_porc.checked then
	if em_porc.Text="" then
		messageBox('Aviso','Debe ingresar datos válidos')
		Return
	end if
	valor = total * porciento / 100
elseif rb_cuotas.checked then
	if sle_cuotas.Text="" then
		messageBox('Aviso','Debe ingresar datos válidos')
		Return
	end if
	valor = total /ii_cuotas	
end if
if isNull(ist_p.dw_cab.GetItemNumber(ist_p.dw_cab.GetRow(),'monto')) then
	ist_p.dw_cab.SetItem(ist_p.dw_cab.GetRow(),'monto', total)
elseif ist_p.dw_cab.GetItemNumber(ist_p.dw_cab.GetRow(),'monto') <> (Total) then
	messageBox('Aviso','El valor calculado no corresponde con el monto total')
	Return
end if
if ist_p.dw_obj.RowCount() > 0 then	
	if messageBox('Aviso','El plan de cuotas se remplazará. Desea Continuar?',QUESTION!,YESNO!) = 2 then
		Return
	end if
	do while ist_p.dw_obj.RowCount() > 0
		ist_p.dw_obj.DeleteRow(1)
	loop
end if

string item
long i, fila, mes, dia
date fecha
for i =  1 to ii_cuotas
	if mod(month(today()) - 1 + i,12) = 0 then
		mes = 12
	else
		mes = mod(month(today()) - 1 + i,12)
	end if
	fecha = date(year(today())+integer((month(today()) - 1 + i)/12), mes, day(today()))
	dia = 1
	do while fecha = date("1900-01-01")
		fecha = date(year(today())+integer((month(today()) - 1 + i)/12), mes, day(today()) - dia)
		dia++
	loop
	
	item = ist_p.dw_obj.Describe("Evaluate('max(item)',0)")
	fila = ist_p.dw_obj.InsertRow(0)
	ist_p.dw_obj.SetItem(fila,'ano',ist_p.dw_cab.GetItemNumber(1,'ano'))
	ist_p.dw_obj.SetItem(fila,'ncontrato',ist_p.dw_cab.GetItemNumber(1,'ncontrato'))
	ist_p.dw_obj.SetItem(fila,'otrosi',ist_p.dw_cab.GetItemNumber(1,'otrosi'))
	ist_p.dw_obj.SetItem(fila,'item',long(item) + 1)
	ist_p.dw_obj.SetItem(fila,'fecha',fecha)
	ist_p.dw_obj.SetItem(fila,'monto',valor)
	ist_p.dw_obj.SetItem(fila,'total',total)
	ist_p.dw_obj.SetItem(fila,'porcentaje',(valor/total)*100)
next

close(parent)

end event

type sle_cuotas from singlelineedit within w_calfpago
integer x = 114
integer y = 336
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

type st_2 from statictext within w_calfpago
integer x = 114
integer y = 268
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

type em_porc from editmask within w_calfpago
integer x = 658
integer y = 336
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
maskdatatype maskdatatype = decimalmask!
string mask = "###,###.00"
boolean spin = true
double increment = 1
string minmax = "1~~100"
end type

type st_4 from statictext within w_calfpago
integer x = 658
integer y = 268
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
string text = "Porcentaje"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_calfpago
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 768
integer y = 492
integer width = 146
integer height = 128
integer taborder = 60
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
string disabledname = "d_cancelar.GIF"
string powertiptext = "&Cancelar"
end type

event clicked;Close(parent)
end event

type st_1 from statictext within w_calfpago
integer x = 1198
integer y = 268
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
string text = "Monto"
boolean focusrectangle = false
end type

type em_monto from editmask within w_calfpago
integer x = 1198
integer y = 336
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
string mask = "#,###,###,###.00"
end type

event getfocus;rb_porc.checked = TRUE

end event

type rb_porc from radiobutton within w_calfpago
integer x = 704
integer y = 152
integer width = 389
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Porcentaje"
end type

type rb_cuotas from radiobutton within w_calfpago
integer x = 352
integer y = 152
integer width = 265
integer height = 72
integer taborder = 40
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

type gb_1 from groupbox within w_calfpago
integer x = 114
integer y = 84
integer width = 1024
integer height = 152
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

