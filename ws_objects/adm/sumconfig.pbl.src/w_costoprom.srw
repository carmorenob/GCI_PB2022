$PBExportHeader$w_costoprom.srw
forward
global type w_costoprom from window
end type
type st_6 from statictext within w_costoprom
end type
type dw_lug from datawindow within w_costoprom
end type
type cb_1 from commandbutton within w_costoprom
end type
type dw_l from datawindow within w_costoprom
end type
type st_2 from statictext within w_costoprom
end type
type pb_1 from picturebutton within w_costoprom
end type
type em_2 from editmask within w_costoprom
end type
type em_1 from editmask within w_costoprom
end type
type dw_a from datawindow within w_costoprom
end type
type pb_4 from picturebutton within w_costoprom
end type
type pb_grabartmp from picturebutton within w_costoprom
end type
type dw_alm from datawindow within w_costoprom
end type
type pb_cerrar from picturebutton within w_costoprom
end type
type gb_1 from groupbox within w_costoprom
end type
type gb_2 from groupbox within w_costoprom
end type
type gb_3 from groupbox within w_costoprom
end type
type st_1 from statictext within w_costoprom
end type
type dw_m from datawindow within w_costoprom
end type
end forward

global type w_costoprom from window
integer width = 3680
integer height = 1568
boolean titlebar = true
string title = "Suminiistros - Ajuste Costo Promedio"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_costop.ico"
boolean center = true
st_6 st_6
dw_lug dw_lug
cb_1 cb_1
dw_l dw_l
st_2 st_2
pb_1 pb_1
em_2 em_2
em_1 em_1
dw_a dw_a
pb_4 pb_4
pb_grabartmp pb_grabartmp
dw_alm dw_alm
pb_cerrar pb_cerrar
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
st_1 st_1
dw_m dw_m
end type
global w_costoprom w_costoprom

type variables
datawindowchild idw_lugar,dwc_alm
transaction sqlba

end variables

forward prototypes
public function decimal cp_mes (string codalmacen, string codarticulo, long ano, long mes, decimal cp_ant, ref decimal saldo)
end prototypes

public function decimal cp_mes (string codalmacen, string codarticulo, long ano, long mes, decimal cp_ant, ref decimal saldo);decimal cProm, cPromIni, entval = 0, salval = 0
long i, f, j, l, nd, it
double saldoIni, ent = 0, sal = 0
string alm_t, cd, cl, msg
cProm = cp_ant
dw_m.Retrieve(codalmacen,codarticulo,ano,mes)

saldoIni = saldo
cPromIni = cp_ant

for i = 1 to dw_m.RowCount()
	dw_m.SetItem(i,'cos_prom_ant',cProm)
	if dw_m.GetItemNumber(i,'entradacant') > 0 then
		if dw_m.GetItemString(i,'coddocref') = 'SE' or dw_m.GetItemString(i,'coddocref') = 'SF' then
			dw_m.SetItem(i,'valorunit',round(dw_m.GetItemNumber(i,'valor_cpo') * (1 + dw_m.GetItemNumber(i,'porcentaje')/100),2)  )
		end if
		cProm = round((cProm * saldo + dw_m.GetItemNumber(i,'entradacant') * dw_m.GetItemNumber(i,'valorunit')) / (saldo + dw_m.GetItemNumber(i,'entradacant') ),2)
		ent = ent + dw_m.GetItemNumber(i,'entradacant')
		entval = entval + dw_m.GetItemNumber(i,'entradacant') * dw_m.GetItemNumber(i,'valorunit')
		saldo = saldo + round(dw_m.GetItemNumber(i,'entradacant'),2)
	elseif dw_m.GetItemNumber(i,'salidacant') > 0 then
		dw_m.SetItem(i,'valorunit',cProm)
//		if dw_m.GetItemNumber(i,'salidacant') > 0 then
			sal = sal + dw_m.GetItemNumber(i,'salidacant')
			salval = salval + dw_m.GetItemNumber(i,'salidacant') * dw_m.GetItemNumber(i,'valorunit')
			saldo = saldo - round(dw_m.GetItemNumber(i,'salidacant'),2)
			if saldo < 0 then
				MessageBox('Atención','Se registran saldos negativos. Articulo-'+codarticulo+' Mes-'+string(ano)+"/"+string(mes))
				Return -1
			end if
		//end if
		if dw_m.GetItemString(i,'coddocref') = 'ST' then
			alm_t = dw_m.GetItemString(i,'codalmacen_target')
			cd = dw_m.GetItemString(i,'coddocref')
			cl = dw_m.GetItemString(i,'clugarref')
			nd = dw_m.GetItemNumber(i,'numdocref')
			it = dw_m.GetItemNumber(i,'itemref')
			update sum_kardex_mov set valorunit=:cprom where
			codalmacen=:alm_t and codarti=:codarticulo and coddocref=:cd and clugarref=:cl and numdocref=:nd and itemref=:it;
			IF SQLCA.SQLCode = -1 THEN
				msg = SQLCA.SQLErrText
				rollback;
				MessageBox("SQL error", msg)
			END IF
		end if
	end if
next
if dw_m.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
Return cProm


end function

on w_costoprom.create
this.st_6=create st_6
this.dw_lug=create dw_lug
this.cb_1=create cb_1
this.dw_l=create dw_l
this.st_2=create st_2
this.pb_1=create pb_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_a=create dw_a
this.pb_4=create pb_4
this.pb_grabartmp=create pb_grabartmp
this.dw_alm=create dw_alm
this.pb_cerrar=create pb_cerrar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.st_1=create st_1
this.dw_m=create dw_m
this.Control[]={this.st_6,&
this.dw_lug,&
this.cb_1,&
this.dw_l,&
this.st_2,&
this.pb_1,&
this.em_2,&
this.em_1,&
this.dw_a,&
this.pb_4,&
this.pb_grabartmp,&
this.dw_alm,&
this.pb_cerrar,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.st_1,&
this.dw_m}
end on

on w_costoprom.destroy
destroy(this.st_6)
destroy(this.dw_lug)
destroy(this.cb_1)
destroy(this.dw_l)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_a)
destroy(this.pb_4)
destroy(this.pb_grabartmp)
destroy(this.dw_alm)
destroy(this.pb_cerrar)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.st_1)
destroy(this.dw_m)
end on

event open;sqlba = create transaction
if f_conecta_cpo(sqlba)=-1 then
	close(this)
	return
end if
em_1.Text = String(date(year(today()),month(today()),1),'mm/yyyy')
em_2.Text = String(date(year(today()),month(today()),1),'mm/yyyy')

end event

event closequery;//rollback;
disconnect using sqlba;

end event

type st_6 from statictext within w_costoprom
integer x = 1349
integer y = 56
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacén"
boolean focusrectangle = false
end type

type dw_lug from datawindow within w_costoprom
integer x = 46
integer y = 52
integer width = 1285
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('codlugar',idw_lugar)
idw_lugar.settransobject(sqlca)
idw_lugar.retrieve()
insertrow(1)
if idw_lugar.rowcount()=1 then 
	setitem(1,1,idw_lugar.getitemstring(1,1))
	post event itemchanged(1,object.codlugar,idw_lugar.getitemstring(1,1))
end if

dw_alm.SetTransObject(SQLCA)
dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)


//dw_almfuente.GetChild('codalmacen', dwc_almfuente)
//dwc_almfuente.SetTransObject(SQLCA)
//if dwc_almfuente.Retrieve(usuario,'%') = 0 then
//	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
//	dwc_almfuente.InsertRow(0)
//end if
//dw_almfuente.SetTransObject(SQLCA)
//dw_almfuente.InsertRow(0)

end event

event itemchanged;string ls_clugar
ls_clugar=data

if dwc_alm.Retrieve(usuario,'%',ls_clugar) = 0 then
	dwc_alm.setitem(row,'codalmacen','')
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(0)
end if
dw_alm.InsertRow(0)
end event

type cb_1 from commandbutton within w_costoprom
boolean visible = false
integer x = 3570
integer y = 168
integer width = 229
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Retrieve"
end type

event clicked;long ano,mes
date desde

em_1.GetData(desde)

dw_m.Retrieve(dw_alm.GetItemString(1,'codalmacen'),dw_a.GetItemString(dw_a.GetRow(),'codarticulo'),year(desde),month(desde))

end event

type dw_l from datawindow within w_costoprom
boolean visible = false
integer x = 2853
integer y = 1144
integer width = 466
integer height = 112
integer taborder = 100
boolean enabled = false
string title = "none"
string dataobject = "dw_lote"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type st_2 from statictext within w_costoprom
integer x = 2450
integer y = 1132
integer width = 544
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_costoprom
event mousemove pbm_mousemove
string tag = "Cancelar"
boolean visible = false
integer x = 1915
integer y = 1136
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar cambios"
end type

event clicked;if MessageBox('Atención','Esta seguro de querer modificar costos promedio?.',QUESTION!,YESNO!,2) = 2 then Return 0

if dw_a.Update() = -1 then
	Rollback;
	Return -1
end if
commit;

end event

type em_2 from editmask within w_costoprom
integer x = 3118
integer y = 84
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
boolean spin = true
end type

type em_1 from editmask within w_costoprom
integer x = 2633
integer y = 88
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
boolean spin = true
end type

type dw_a from datawindow within w_costoprom
integer x = 37
integer y = 292
integer width = 3570
integer height = 812
integer taborder = 40
string title = "none"
string dataobject = "dw_cp_kardex"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//SetTransObject(sqlba)


end event

event itemchanged;SetItem(row,'selec',1)

end event

event clicked;if dwo.Name = 'selec_t' then
	int i
	if describe("selec_t.text") = 'Selec.' then
		for i = 1 to rowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to rowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)
st_2.Text = string(dw_a.GetRow()) + " de " + string(dw_a.RowCount())
end event

event retrieverow;SetItem(row,'costoprominicial',0)
SetItem(row,'saldoinicial',0)
end event

event rowfocuschanged;st_2.Text = string(dw_a.GetRow()) + " de " + string(dw_a.RowCount())

end event

type pb_4 from picturebutton within w_costoprom
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1769
integer y = 1136
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Ver Existencias"
end type

event clicked;if not isNull(dw_alm.GetItemString(1,'codalmacen')) then
	openwithparm(w_kardex,dw_alm.GetItemString(1,'codalmacen'))
end if
end event

type pb_grabartmp from picturebutton within w_costoprom
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 1623
integer y = 1136
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
string powertiptext = "Calcular Costos Promedio"
end type

event clicked;long ano,mes,f,i
string codarticulo,alm
date desde, hasta
decimal cprom
decimal saldo, saldo_lote, diff

if MessageBox('Atención','Esta seguro de recalcular costos promedio y saldos?',QUESTION!,YESNO!,2) = 2 then Return 0

alm = dw_alm.GetItemString(1,'codalmacen')
em_1.GetData(desde)
em_2.GetData(hasta)
if desde > hasta then
	messageBox('Atención','La fecha "DESDE" es mayor que la fecha "HASTA"')
	Return  -1
end if

f = dw_a.Find("selec=1",1,dw_a.RowCount())
do while f > 0
	dw_l.Reset()
	dw_a.ScrolltoRow(f)
	codarticulo = dw_a.GetItemString(f,'codarticulo')
	cProm = dw_a.GetItemNumber(f,'costoprominicial')
	saldo = dw_a.GetItemNumber(f,'saldoinicial')
	dw_l.Retrieve(alm,codarticulo)
	for ano = year(desde) to year(hasta)
		if ano = year(desde) then
			mes = month(desde)
		else
			mes = 1
		end if
		do while mes <= 12
			if ano = year(hasta) then
				if mes > month(hasta) then Exit
			end if
			//Procesa mes
			cProm = cp_mes(alm,codarticulo,ano,mes,cProm,saldo)
			if cProm = -1 then 
				rollback;
				Return -1
			end if
			mes = mes + 1
		loop
	next
	dw_a.SetItem(f,'costoProm',cProm)
	dw_a.SetItem(f,'saldoActual',saldo)
	dw_a.SetItem(f,'selec',0)
	
	/// Revisa Lotes
	
	if dw_a.GetItemString(f,'vence') = '1' then
		
		saldo_lote = double(dw_l.Describe("Evaluate('sum(cantidad)',0)"))
		diff = saldo - saldo_lote
		if diff > 0 then
			if dw_l.RowCount() > 0 then
				dw_l.SetItem(1,'cantidad',dw_l.GetItemNumber(1,'cantidad') + diff)
			end if
		elseif diff < 0 then
			i = 1
			if dw_l.RowCount() > 0 then
				do while diff < 0 and i <= dw_l.RowCount()
					if dw_l.GetItemNumber(i,'cantidad') >= ABS(diff) then
						dw_l.SetItem(i,'cantidad',dw_l.GetItemNumber(i,'cantidad') + diff)
					else
						diff = diff + dw_l.GetItemNumber(i,'cantidad')
						dw_l.SetItem(i,'cantidad',0)
					end if
					i = i + 1
				loop
			end if
		end if
		if dw_l.Find("cantidad < 0",1,dw_l.RowCount()) > 0 then
			Rollback;
			MessageBox('Error','Cantidad Negativa lote')
			Return -1
		end if
	end if
	///
	if dw_a.update() = -1 then
		Rollback;
		Return -1
	end if
	if dw_l.update() = -1 then
		Rollback;
		Return -1
	end if
	Commit; //////  OJO  ///////
	if mod(f,10) = 0 then GarbageCollect()
	f = dw_a.Find("selec=1",1,dw_a.RowCount())
loop

Return 0

end event

type dw_alm from datawindow within w_costoprom
integer x = 1358
integer y = 108
integer width = 1157
integer height = 72
integer taborder = 10
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;AcceptText()
dw_a.settransobject(sqlba)
dw_a.Retrieve(GetItemString(1,'codalmacen'))

end event

type pb_cerrar from picturebutton within w_costoprom
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1467
integer y = 1136
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type gb_1 from groupbox within w_costoprom
integer x = 37
integer y = 20
integer width = 2519
integer height = 212
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_costoprom
integer x = 2578
integer y = 20
integer width = 462
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procesar desde"
end type

type gb_3 from groupbox within w_costoprom
integer x = 3067
integer y = 20
integer width = 471
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
end type

type st_1 from statictext within w_costoprom
integer x = 82
integer y = 1288
integer width = 3483
integer height = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Se toma el Costo Prom Ini. y el SaldoInicial como base para calcular el costo promedio desde movimientos en kardex para los periodos definidos en las casillas de Procesar desde - hasta. El Costo Promedio en rojo significa que ha cambiado con el cálculo."
boolean focusrectangle = false
end type

type dw_m from datawindow within w_costoprom
boolean visible = false
integer x = 2153
integer y = 1128
integer width = 617
integer height = 116
integer taborder = 90
boolean enabled = false
string title = "none"
string dataobject = "dw_cp_kardexmov"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

