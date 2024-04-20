$PBExportHeader$w_costoprom_ori.srw
forward
global type w_costoprom_ori from window
end type
type dw_l from datawindow within w_costoprom_ori
end type
type st_2 from statictext within w_costoprom_ori
end type
type dw_d from datawindow within w_costoprom_ori
end type
type st_1 from statictext within w_costoprom_ori
end type
type pb_1 from picturebutton within w_costoprom_ori
end type
type em_2 from editmask within w_costoprom_ori
end type
type em_1 from editmask within w_costoprom_ori
end type
type dw_m from datawindow within w_costoprom_ori
end type
type dw_a from datawindow within w_costoprom_ori
end type
type pb_4 from picturebutton within w_costoprom_ori
end type
type pb_grabartmp from picturebutton within w_costoprom_ori
end type
type dw_almfuente from datawindow within w_costoprom_ori
end type
type pb_cerrar from picturebutton within w_costoprom_ori
end type
type gb_1 from groupbox within w_costoprom_ori
end type
type gb_2 from groupbox within w_costoprom_ori
end type
type gb_3 from groupbox within w_costoprom_ori
end type
end forward

global type w_costoprom_ori from window
integer width = 3360
integer height = 1480
boolean titlebar = true
string title = "Suministros - Ajuste Costo Promedio"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "ordenar.ico"
dw_l dw_l
st_2 st_2
dw_d dw_d
st_1 st_1
pb_1 pb_1
em_2 em_2
em_1 em_1
dw_m dw_m
dw_a dw_a
pb_4 pb_4
pb_grabartmp pb_grabartmp
dw_almfuente dw_almfuente
pb_cerrar pb_cerrar
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_costoprom_ori w_costoprom_ori

type variables
datawindowchild dwc_almfuente


end variables

forward prototypes
public function decimal cp_mes (string codalmacen, string codarticulo, long ano, long mes, decimal cp_ant, ref decimal saldo)
end prototypes

public function decimal cp_mes (string codalmacen, string codarticulo, long ano, long mes, decimal cp_ant, ref decimal saldo);decimal cProm, cPromIni, entval = 0, salval = 0
long i, f, j, l
double saldoIni, ent = 0, sal = 0

cProm = cp_ant
dw_m.Retrieve(codalmacen,codarticulo,ano,mes)

saldoIni = saldo
cPromIni = cp_ant

for i = 1 to dw_m.RowCount()
	dw_m.SetItem(i,'cos_prom_ant',cProm)
	if dw_m.GetItemNumber(i,'entradacant') > 0 then
		cProm = (cProm * saldo + dw_m.GetItemNumber(i,'entradacant') * dw_m.GetItemNumber(i,'valorunit')) / (saldo + dw_m.GetItemNumber(i,'entradacant') )
		ent = ent + dw_m.GetItemNumber(i,'entradacant')
		entval = entval + dw_m.GetItemNumber(i,'entradacant') * dw_m.GetItemNumber(i,'valorunit')
		saldo = saldo + dw_m.GetItemNumber(i,'entradacant')

	elseif dw_m.GetItemNumber(i,'salidacant') > 0 then
		dw_m.SetItem(i,'valorunit',cProm)
		sal = sal + dw_m.GetItemNumber(i,'salidacant')
		salval = salval + dw_m.GetItemNumber(i,'salidacant') * dw_m.GetItemNumber(i,'valorunit')
		saldo = saldo - dw_m.GetItemNumber(i,'salidacant')
		if saldo < 0 then
			MessageBox('Atención','Se registran saldos negativos. Articulo-'+codarticulo+' Mes-'+string(ano)+"/"+string(mes))
			Return -1
		end if
	end if
next

if dw_m.RowCount() > 0 then
	st_anomes st_p
	st_p = f_per_ant(codalmacen,ano,mes)
	f = dw_d.Retrieve(codalmacen,codarticulo,st_p.ano,st_p.mes)
	do while f = 0 and st_p.ano > 0
		st_p = f_per_ant(codalmacen,st_p.ano,st_p.mes)
		f = dw_d.Retrieve(codalmacen,codarticulo,st_p.ano,st_p.mes)
	loop

	if f = -1 then
		MessageBox('Error','Error en retrieve de kardex_deta articulo-'+codarticulo+ ' año-'+string(ano)+' mes-'+string(mes))
		Return -1
	elseif f = 1 then
		cPromIni = dw_d.GetItemNumber(1,'costoProm')
		saldoIni = dw_d.GetItemNumber(1,'saldoinicial') + dw_d.GetItemNumber(1,'entradascant') - dw_d.GetItemNumber(1,'salidascant')
	end if
	//
	f = dw_d.Retrieve(codalmacen,codarticulo,ano,mes)
	if f = 0 then
		f = dw_d.InsertRow(0)
		dw_d.SetItem(f,'codalmacen', codalmacen)
		dw_d.SetItem(f,'codarti', codarticulo)
		dw_d.SetItem(f,'ano', ano)
		dw_d.SetItem(f,'mes', mes)
		//MessageBox('Error','No existe registro en Kardex_deta para articulo-'+codarticulo+' año-'+string(ano)+' mes-'+string(mes))
		//Return -1
	elseif f = -1 then
		MessageBox('Error','Error en retrieve de kardex_deta articulo-'+codarticulo+ ' año-'+string(ano)+' mes-'+string(mes))
		Return -1
	end if
	dw_d.SetItem(f,'saldoinicial', saldoIni)
	dw_d.SetItem(f,'costoprominicial', cPromIni)
	dw_d.SetItem(f,'costoprom', cProm )
	dw_d.SetItem(f,'entradascant', ent)
	dw_d.SetItem(f,'entradasvalor', entval)
	dw_d.SetItem(f,'salidascant', sal)
	dw_d.SetItem(f,'salidasvalor', salval)
	if dw_d.Update() = -1 then
		Rollback;
		Return -1
	end if
else
	if dw_d.Retrieve(codalmacen,codarticulo,ano,mes) = 1 then
//		dw_d.DeleteRow(1)
		dw_d.SetItem(1,'saldoinicial', saldoIni)
		dw_d.SetItem(f,'costoprominicial', cPromIni)
		dw_d.SetItem(f,'costoprom', cPromIni )
		dw_d.SetItem(f,'entradascant', 0)
		dw_d.SetItem(f,'entradasvalor', 0)
		dw_d.SetItem(f,'salidascant', 0)
		dw_d.SetItem(f,'salidasvalor', 0)
		if dw_d.Update() = -1 then
			Rollback;
			Return -1
		end if
	end if
end if

if dw_m.Update() = -1 then
	Rollback;
	Return -1
end if


Return cProm

//		if dw_m.GetItemNumber(i,'salidacant') <> double(dw_lm.Describe("Evaluate('sum(cantidad)',0)")) then
//			Rollback;
//			Messagebox('Diferencia entre KMov y LMov - Sal',dw_m.GetItemString(i,'coddocref') +"-"+string(dw_m.GetItemNumber(i,'numdocref'))+"-"+string(dw_m.GetItemNumber(i,'itemref')))
//			Return -1
//		end if
//		for j = 1 to dw_lm.RowCount()
//			l = dw_l.Find("lote='"+dw_lm.GetItemString(j,'lote')+"'",1,dw_l.rowCount())
//			if l > 0 then
//				dw_l.SetItem(l,'cantidad',dw_l.GetItemNumber(l,'cantidad') + dw_lm.GetItemNumber(j,'cantidad')*dw_lm.GetItemNumber(j,'signo'))
//			elseif l = 0 then
//				l = dw_l.InsertRow(0)
//				dw_l.SetItem(l,'codalmacen',codalmacen)
//				dw_l.SetItem(l,'codarticulo',codarticulo)
//				dw_l.SetItem(l,'lote',dw_lm.GetItemString(j,'lote'))
//				dw_l.SetItem(l,'fecha_venc',dw_lm.GetItemDateTime(j,'fecha_venc'))
//				dw_l.SetItem(l,'cantidad',dw_lm.GetItemNumber(j,'cantidad')*dw_lm.GetItemNumber(j,'signo'))
//			end if
//		next
//

end function

on w_costoprom_ori.create
this.dw_l=create dw_l
this.st_2=create st_2
this.dw_d=create dw_d
this.st_1=create st_1
this.pb_1=create pb_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_m=create dw_m
this.dw_a=create dw_a
this.pb_4=create pb_4
this.pb_grabartmp=create pb_grabartmp
this.dw_almfuente=create dw_almfuente
this.pb_cerrar=create pb_cerrar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.dw_l,&
this.st_2,&
this.dw_d,&
this.st_1,&
this.pb_1,&
this.em_2,&
this.em_1,&
this.dw_m,&
this.dw_a,&
this.pb_4,&
this.pb_grabartmp,&
this.dw_almfuente,&
this.pb_cerrar,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_costoprom_ori.destroy
destroy(this.dw_l)
destroy(this.st_2)
destroy(this.dw_d)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_m)
destroy(this.dw_a)
destroy(this.pb_4)
destroy(this.pb_grabartmp)
destroy(this.dw_almfuente)
destroy(this.pb_cerrar)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;dw_almfuente.GetChild('codalmacen', dwc_almfuente)
dwc_almfuente.SetTransObject(SQLCA)
if dwc_almfuente.Retrieve(usuario,'%') = 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_almfuente.InsertRow(0)
end if
dw_almfuente.SetTransObject(SQLCA)
dw_almfuente.InsertRow(0)

em_1.Text = String(date(year(today()),month(today()),1),'mm/yyyy')
em_2.Text = String(date(year(today()),month(today()),1),'mm/yyyy')

end event

type dw_l from datawindow within w_costoprom_ori
boolean visible = false
integer x = 1947
integer y = 1192
integer width = 1138
integer height = 160
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

type st_2 from statictext within w_costoprom_ori
integer x = 2459
integer y = 1056
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

type dw_d from datawindow within w_costoprom_ori
boolean visible = false
integer x = 165
integer y = 1056
integer width = 686
integer height = 224
integer taborder = 90
boolean enabled = false
string title = "none"
string dataobject = "dw_kardexdeta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;setTransObject(SQLCA)

end event

type st_1 from statictext within w_costoprom_ori
integer x = 91
integer y = 1212
integer width = 2862
integer height = 140
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

type pb_1 from picturebutton within w_costoprom_ori
event mousemove pbm_mousemove
string tag = "Cancelar"
boolean visible = false
integer x = 1719
integer y = 1060
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

type em_2 from editmask within w_costoprom_ori
integer x = 2199
integer y = 76
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

type em_1 from editmask within w_costoprom_ori
integer x = 1481
integer y = 72
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

type dw_m from datawindow within w_costoprom_ori
boolean visible = false
integer x = 2327
integer y = 1084
integer width = 617
integer height = 196
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

type dw_a from datawindow within w_costoprom_ori
integer x = 46
integer y = 216
integer width = 3227
integer height = 812
integer taborder = 40
string title = "none"
string dataobject = "dw_cp_kardex"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

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

type pb_4 from picturebutton within w_costoprom_ori
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1573
integer y = 1060
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

event clicked;if not isNull(dw_almfuente.GetItemString(1,'codalmacen')) then
	openwithparm(w_kardex,dw_almfuente.GetItemString(1,'codalmacen'))
end if
end event

type pb_grabartmp from picturebutton within w_costoprom_ori
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 1426
integer y = 1060
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

alm = dw_almfuente.GetItemString(1,'codalmacen')
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

type dw_almfuente from datawindow within w_costoprom_ori
integer x = 73
integer y = 80
integer width = 1134
integer height = 76
integer taborder = 10
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;AcceptText()
dw_a.Retrieve(GetItemString(1,'codalmacen'))

end event

type pb_cerrar from picturebutton within w_costoprom_ori
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1271
integer y = 1060
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

type gb_1 from groupbox within w_costoprom_ori
integer x = 46
integer y = 28
integer width = 1189
integer height = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacén"
end type

type gb_2 from groupbox within w_costoprom_ori
integer x = 1257
integer y = 24
integer width = 645
integer height = 172
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

type gb_3 from groupbox within w_costoprom_ori
integer x = 1961
integer y = 28
integer width = 663
integer height = 172
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

