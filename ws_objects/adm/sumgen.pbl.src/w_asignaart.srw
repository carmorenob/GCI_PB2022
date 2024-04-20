$PBExportHeader$w_asignaart.srw
forward
global type w_asignaart from window
end type
type sle_3 from singlelineedit within w_asignaart
end type
type sle_2 from singlelineedit within w_asignaart
end type
type sle_1 from singlelineedit within w_asignaart
end type
type st_3 from statictext within w_asignaart
end type
type st_2 from statictext within w_asignaart
end type
type st_1 from statictext within w_asignaart
end type
type pb_nuevo from picturebutton within w_asignaart
end type
type pb_cancelar from picturebutton within w_asignaart
end type
type dw_k from datawindow within w_asignaart
end type
end forward

global type w_asignaart from window
integer width = 3922
integer height = 1300
boolean titlebar = true
string title = "Asignación de Artìculos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_3 st_3
st_2 st_2
st_1 st_1
pb_nuevo pb_nuevo
pb_cancelar pb_cancelar
dw_k dw_k
end type
global w_asignaart w_asignaart

type variables
st_sumgen st_p
double solicitado, atendido

end variables

forward prototypes
public function integer calmonto ()
end prototypes

public function integer calmonto ();double acumulado
long i = 1
acumulado = solicitado - atendido

do while acumulado > 0 and i <= dw_k.RowCount()
	if acumulado >= dw_k.GetItemNumber(i,'compute_1') then
		dw_k.SetItem(i,'aentregar',dw_k.GetItemNumber(i,'compute_1'))
		acumulado = acumulado - dw_k.GetItemNumber(i,'compute_1')
	else
		dw_k.SetItem(i,'aentregar',acumulado)
		acumulado = 0
	end if
	dw_k.SetItem(i,'selec',1)
	i = i + 1
loop

Return 0

end function

on w_asignaart.create
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.pb_nuevo=create pb_nuevo
this.pb_cancelar=create pb_cancelar
this.dw_k=create dw_k
this.Control[]={this.sle_3,&
this.sle_2,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.pb_nuevo,&
this.pb_cancelar,&
this.dw_k}
end on

on w_asignaart.destroy
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_nuevo)
destroy(this.pb_cancelar)
destroy(this.dw_k)
end on

event open;st_p = Message.PowerObjectParm
if isNull(st_p.dw_rc.GetItemString(st_p.dw_rc.GetRow(),'codgenerico')) then
	string cgen, cart
	cart = st_p.dw_rc.GetItemString(st_p.dw_rc.GetRow(),'codarticulo')
	select codgenerico into :cgen from sumarticulo 
	where codarticulo=:cart;
	st_p.dw_rc.SetItem(st_p.dw_rc.GetRow(),'codgenerico',cgen)
end if
dw_k.Retrieve(st_p.codalmacen,st_p.dw_rc.GetItemString(st_p.dw_rc.GetRow(),'codgenerico'))
solicitado = st_p.dw_rc.GetItemNumber(st_p.dw_rc.GetRow(),'cantidad')
atendido   = st_p.dw_rc.GetItemNumber(st_p.dw_rc.GetRow(),'atendido')
sle_1.Text = String(solicitado)
sle_2.Text = String(atendido)
sle_3.Text = String(solicitado - atendido)
calmonto()

end event

type sle_3 from singlelineedit within w_asignaart
integer x = 2510
integer y = 64
integer width = 384
integer height = 84
integer taborder = 20
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

type sle_2 from singlelineedit within w_asignaart
integer x = 1417
integer y = 64
integer width = 384
integer height = 84
integer taborder = 20
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

type sle_1 from singlelineedit within w_asignaart
integer x = 334
integer y = 64
integer width = 384
integer height = 84
integer taborder = 10
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

type st_3 from statictext within w_asignaart
integer x = 2185
integer y = 72
integer width = 297
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Faltante :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_asignaart
integer x = 1143
integer y = 72
integer width = 297
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entregado :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_asignaart
integer x = 78
integer y = 72
integer width = 297
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitado :"
boolean focusrectangle = false
end type

type pb_nuevo from picturebutton within w_asignaart
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 1861
integer y = 1048
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
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Atender"
end type

event clicked;long i,f,fl
string valor,ca
double aentregar, cantidad

if double(dw_k.Describe("Evaluate('sum(if(selec=1,aentregar,0))',0)")) > solicitado - atendido then
	MessageBox('Atención','No puede entregar mas de lo requerido')
	Return -1
end if

for i = 1 to dw_k.RowCount()
	aentregar = dw_k.GetItemNumber(i,'aentregar')
	if dw_k.GetItemNumber(i,'selec') = 1 and aentregar > 0 then	
		f= st_p.dw_cp.Find("coddoc_ori='" + st_p.dw_rc.GetItemString(st_p.dw_rc.GetRow(),'coddoc') + &
			"' and clugar_ori='" + st_p.dw_rc.GetItemString(st_p.dw_rc.GetRow(),'cLugar') +&
			"' and numdoc_ori=" + string(st_p.dw_rc.GetItemnumber(st_p.dw_rc.GetRow(),'numdoc')) +&
			" and item_ori=" + string(st_p.dw_rc.GetItemnumber(st_p.dw_rc.GetRow(),'item'))+&
			" and codarticulo='"+dw_k.GetItemString(i,'codarticulo')+"'", 1, st_p.dw_cp.RowCount())
		if f = 0 then
			valor = st_p.dw_cp.Describe("Evaluate('max(item)',0)")
			f = st_p.dw_cp.InsertRow(0)
			st_p.dw_cp.SetItem(f,'coddoc',st_p.dw_cb.GetItemString(1,'coddoc'))
			st_p.dw_cp.SetItem(f,'clugar',st_p.dw_cb.GetItemString(1,'clugar'))
			st_p.dw_cp.SetItem(f,'numdoc',st_p.dw_cb.GetItemNumber(1,'numdoc'))
			st_p.dw_cp.SetItem(f,'item',long(valor) + 1)
			st_p.dw_cp.SetItem(f,'codarticulo',dw_k.GetItemString(i,'codarticulo'))
			ca = dw_k.GetItemString(i,'codarticulo')
			st_p.dw_cp.SetItem(f,'cantidad',double(dw_k.Describe("Evaluate('sum(if(selec=1 and codarticulo=~~'"+ca+"~~',aentregar,0))',0)"))) //////
			st_p.dw_cp.SetItem(f,'coddoc_ori',st_p.dw_rc.GetItemString(st_p.dw_rc.GetRow(),'coddoc'))
			st_p.dw_cp.SetItem(f,'clugar_ori',st_p.dw_rc.GetItemString(st_p.dw_rc.GetRow(),'clugar'))
			st_p.dw_cp.SetItem(f,'numdoc_ori',st_p.dw_rc.GetItemNumber(st_p.dw_rc.GetRow(),'numdoc'))
			st_p.dw_cp.SetItem(f,'item_ori',st_p.dw_rc.GetItemNumber(st_p.dw_rc.GetRow(),'item'))
			st_p.dw_cp.SetItem(f,'valor_unit',dw_k.GetItemNumber(i,'costoprom'))
			st_p.dw_cp.SetItem(f,'descripcion',dw_k.GetItemString(i,'descripcion'))
			st_p.dw_cp.SetItem(f,'estado','1')
			st_p.dw_cp.SetItem(f,'vence',dw_k.GetItemString(i,'vence'))
			st_p.dw_cp.SetItem(f,'act_fijo',dw_k.GetItemString(i,'act_fijo'))
			st_p.dw_cp.SetItem(f,'saldoactual',dw_k.GetItemNumber(i,'saldoactual'))
			st_p.dw_cp.ScrolltoRow(f)
			st_p.dw_cp.TriggerEvent(RowFocusChanged!)
		else
			st_p.dw_cp.SetItem(f,'cantidad',double(dw_k.Describe("Evaluate('sum(aentregar)',0)")))
		end if
		
		if not isNull(dw_k.GetItemString(i,'lote')) then
			fl = st_p.dw_lt.Find("upper(lote)='"+upper(dw_k.GetItemString(i,'lote'))+"'",1,st_p.dw_lt.RowCount())
			if fl = 0 then
				fl = st_p.dw_lt.InsertRow(0)
				st_p.dw_lt.SetItem(fl,'codalmacen',st_p.dw_cb.GetItemString(1,'codalmacen'))
				st_p.dw_lt.SetItem(fl,'codarticulo',dw_k.GetItemString(i,'codarticulo'))
				st_p.dw_lt.SetItem(fl,'lote',dw_k.GetItemString(i,'lote'))
				st_p.dw_lt.SetItem(fl,'fecha_venc',dw_k.GetItemDateTime(i,'fecha_venc'))
				st_p.dw_lt.SetItem(fl,'convenio',dw_k.GetItemString(i,'convenio'))			
				st_p.dw_lt.SetItem(fl,'coddoc',st_p.dw_cb.GetItemString(1,'coddoc'))
				st_p.dw_lt.SetItem(fl,'cLugar',st_p.dw_cb.GetItemString(1,'clugar'))
				st_p.dw_lt.SetItem(fl,'numdoc',st_p.dw_cb.GetItemNumber(1,'numdoc'))
				st_p.dw_lt.SetItem(fl,'item',st_p.dw_cp.GetItemNumber(f,'item'))
				st_p.dw_lt.SetItem(fl,'cantidad',dw_k.GetItemNumber(i,'aentregar'))
				st_p.dw_lt.SetItem(fl,'estado','1')
				st_p.dw_lt.SetItem(fl,'signo',-1)
				st_p.dw_lt.SetItem(fl,'saldo_lote',dw_k.GetItemNumber(i,'cantidad'))
			else
				st_p.dw_lt.SetItem(fl,'cantidad', dw_k.GetItemNumber(i,'aentregar') )
			end if
		end if
		
	end if
next

close(parent)

end event

type pb_cancelar from picturebutton within w_asignaart
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1705
integer y = 1048
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type dw_k from datawindow within w_asignaart
integer x = 32
integer y = 180
integer width = 3790
integer height = 816
integer taborder = 10
string title = "none"
string dataobject = "dw_kardexprelote_asig"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;if acceptText() = -1 then Return
if getColumnName() = 'aentregar' then
	if GetItemNumber(GetRow(),'aentregar') > 0 then
		SetItem(GetRow(),'selec',1)
	else
		SetItem(GetRow(),'selec',0)
	end if
end if
if getColumnName() = 'selec' then
	if data='1'  then
		SetItem(GetRow(),'aentregar',st_p.dw_rc.GetItemNumber(st_p.dw_rc.GetRow(),'cantidad') - st_p.dw_rc.GetItemNumber(st_p.dw_rc.GetRow(),'atendido'))
	else
		SetItem(GetRow(),'aentregar',0)
	end if
end if
end event

