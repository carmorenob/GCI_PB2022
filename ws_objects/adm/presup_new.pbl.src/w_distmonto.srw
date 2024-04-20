$PBExportHeader$w_distmonto.srw
forward
global type w_distmonto from w_center
end type
type dw_1 from datawindow within w_distmonto
end type
type st_1 from statictext within w_distmonto
end type
type st_2 from statictext within w_distmonto
end type
type st_3 from statictext within w_distmonto
end type
type st_4 from statictext within w_distmonto
end type
type st_5 from statictext within w_distmonto
end type
type pb_1 from picturebutton within w_distmonto
end type
type dw_a from datawindow within w_distmonto
end type
end forward

global type w_distmonto from w_center
string tag = "Ha realizado cambios. Desea guardarlos?"
string title = "Distribución Montos para gastos"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "plan.ico"
dw_1 dw_1
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
pb_1 pb_1
dw_a dw_a
end type
global w_distmonto w_distmonto

type variables
st_ppto st_parm

end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();long i, cod_vigencia, f
string codtotal
double monto, monto_n, monto_a
if st_parm.filtro = '1' then
	messagebox('Aviso','El Plan Presupuestal ya ha sido cerrado. No puede modificarse')
	Return 0
end if

if dw_1.Update() = -1 then
	Rollback;
	Return -1
end if

for i = 1 to dw_1.RowCount()
	cod_vigencia = dw_1.GetItemNumber(i,'cod_vigen_gasto')
	codtotal = dw_1.GetItemString(i,'codtotal_gasto')
	f = dw_a.Find("cod_vigen_gasto="+String(cod_vigencia)+" and codtotal_gasto='"+codtotal+"'",1,dw_a.RowCount() )
	if f > 0 then
		monto_n = dw_1.GetItemNumber(i,'monto_gasto')
		monto_a = dw_a.GetItemNumber(i,'monto_gasto')
		if isNull(monto_n) then monto_n = 0
		if isNull(monto_a) then monto_a = 0
		monto = monto_n - monto_a
		if monto <> 0 then
//			if f_propagamov(cod_vigencia,0,codtotal,'IN',monto) = -1 then 
//				Rollback;
//				Return -1
//			end if
		end if
	end if
	
next
dw_a.Retrieve(st_parm.dw_obj.GetItemNumber(st_parm.dw_obj.GetRow(),'cod_vigencia'))
cambio = FALSE

Return 0

end function

on w_distmonto.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.pb_1=create pb_1
this.dw_a=create dw_a
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.dw_a
end on

on w_distmonto.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.pb_1)
destroy(this.dw_a)
end on

event open;call super::open;st_parm = Message.PowerObjectParm
dw_1.SetTransObject(SQLCA)
dw_1.SetFilter("codtotal = '" + st_parm.dw_obj.GetItemString(st_parm.dw_obj.GetRow(),'codtotal') + "'")
dw_1.Filter()
dw_1.Retrieve(st_parm.dw_obj.GetItemNumber(st_parm.dw_obj.GetRow(),'cod_vigencia'))
st_1.Text = st_parm.dw_obj.GetItemString(st_parm.dw_obj.GetRow(),'codtotal') + " - " + st_parm.dw_obj.GetItemString(st_parm.dw_obj.GetRow(),'descrip')
st_3.Text = string(st_parm.dw_obj.GetItemNumber(st_parm.dw_obj.GetRow(),'planeado_inicial'),'#,##0;[RED](#,##0)')

//
dw_a.SetFilter("codtotal = '" + st_parm.dw_obj.GetItemString(st_parm.dw_obj.GetRow(),'codtotal') + "'")
dw_a.Filter()
dw_a.Retrieve(st_parm.dw_obj.GetItemNumber(st_parm.dw_obj.GetRow(),'cod_vigencia'))
//
end event

type pb_grabar from w_center`pb_grabar within w_distmonto
integer x = 1307
integer y = 1312
integer width = 151
integer height = 132
integer taborder = 20
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;call super::clicked;long i
double total = 0, monto = 0

if dw_1.AcceptText() = -1 then Return
for i = 1 to dw_1.RowCount()
	total = total + dw_1.GetItemNumber(i,'monto_gasto')
next
monto = st_parm.dw_obj.GetItemNumber(st_parm.dw_obj.GetRow(),'planeado_inicial')
if total <> monto then
	messagebox('Error','La suma de los montos debe coincidir con lo planeado en el ingreso. Diferencia ' + string(total - monto,'#,##0;[RED](#,##0)'))
	Return -1
end if
grabar()

end event

type dw_1 from datawindow within w_distmonto
integer x = 183
integer y = 140
integer width = 2240
integer height = 960
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_eqmov"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long i
double monto
if this.GetColumnName() = 'monto_gasto' then
	monto = this.GetItemNumber(this.GetRow(),'monto_gasto')
	if st_parm.filtro = '2' then
		this.SetItem(this.GetRow(),'monto_gasto',monto)
		this.SetText(string(monto))
		Return 1
	end if
	if this.AcceptText() = -1 then Return
	st_5.Text = string(double(dw_1.Describe("evaluate('sum(monto_gasto)',0)")),'#,##0;[RED](#,##0)')
	cambio = TRUE
end if

end event

event retrieveend;st_5.Text = string(double(dw_1.Describe("evaluate('sum(monto_gasto)',0)")),'#,##0;[RED](#,##0)')
end event

type st_1 from statictext within w_distmonto
integer x = 192
integer y = 32
integer width = 2222
integer height = 64
boolean bringtotop = true
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

type st_2 from statictext within w_distmonto
integer x = 242
integer y = 1132
integer width = 270
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresos:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_distmonto
integer x = 535
integer y = 1132
integer width = 475
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_distmonto
integer x = 1221
integer y = 1136
integer width = 270
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gastos:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_distmonto
integer x = 1513
integer y = 1136
integer width = 453
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_distmonto
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1152
integer y = 1312
integer width = 151
integer height = 132
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;long i
double total = 0, monto = 0

for i = 1 to dw_1.RowCount()
	total = total + dw_1.GetItemNumber(i,'monto_gasto')
next
monto = st_parm.dw_obj.GetItemNumber(st_parm.dw_obj.GetRow(),'planeado_inicial')
if total <> monto then
	messagebox('Error','La suma de los montos debe ser coincidir con lo planeado en el ingreso. Diferencia ' + string(total - monto,'#,##0;[RED](#,##0)'))
	Return -1
end if

close(parent)

end event

type dw_a from datawindow within w_distmonto
boolean visible = false
integer x = 229
integer y = 1268
integer width = 686
integer height = 172
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_eqmov"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

