$PBExportHeader$w_dist_pagos.srw
forward
global type w_dist_pagos from window
end type
type pb_2 from picturebutton within w_dist_pagos
end type
type pb_1 from picturebutton within w_dist_pagos
end type
type dw_im from datawindow within w_dist_pagos
end type
type pb_impo from picturebutton within w_dist_pagos
end type
type st_3 from statictext within w_dist_pagos
end type
type st_saldo from statictext within w_dist_pagos
end type
type pb_def from picturebutton within w_dist_pagos
end type
type dw_ctipo from datawindow within w_dist_pagos
end type
type pb_cancel from picturebutton within w_dist_pagos
end type
type pb_ok from picturebutton within w_dist_pagos
end type
type em_pago from editmask within w_dist_pagos
end type
type st_1 from statictext within w_dist_pagos
end type
type dw_facts from datawindow within w_dist_pagos
end type
type dw_ccc from datawindow within w_dist_pagos
end type
end forward

global type w_dist_pagos from window
integer width = 4366
integer height = 1556
boolean titlebar = true
string title = "Distribución Pagos / Descuentos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_im dw_im
pb_impo pb_impo
st_3 st_3
st_saldo st_saldo
pb_def pb_def
dw_ctipo dw_ctipo
pb_cancel pb_cancel
pb_ok pb_ok
em_pago em_pago
st_1 st_1
dw_facts dw_facts
dw_ccc dw_ccc
end type
global w_dist_pagos w_dist_pagos

type variables
st_pagos st_p
datawindowChild idw_ct


end variables

forward prototypes
public function integer f_grabar ()
end prototypes

public function integer f_grabar ();if dw_facts.rowCount() = 0 then return 0
if st_p.dw_pagos.getItemString(st_p.dw_pagos.getRow(),'distribuido') = '1' then
	MessageBox('Atención','El monto ya ha sido distribuido y guardado definitivo')
	return 0
end if
long fila, i
if st_p.dw_pagos.getItemNumber(st_p.dw_pagos.getRow(),'valor') = dw_facts.getItemNumber(1,'sumpago') then
	if isNull(dw_ctipo.getItemString(1,1)) then 
		MessageBox('Atención','Seleccione el tipo de pago')
		return 0
	end if
	for i = 1 to dw_facts.rowCount()
		fila = dw_ccc.Find("nfact="+string(dw_facts.getItemNumber(i,'nfact'))+" and clugar_fact='"+dw_facts.getItemString(i,'clugar')+"'",1,dw_ccc.rowCount() )
		if fila > 0 and dw_facts.getItemNumber(i,'valor_pago') <= 0 then
			dw_ccc.deleteRow(fila)
		elseif fila = 0 and dw_facts.getItemNumber(i,'valor_pago') > 0 then
			fila = dw_ccc.InsertRow(0)
			dw_ccc.setItem(fila,'coddoc',st_p.coddoc)
			dw_ccc.setItem(fila,'clugar',st_p.clugar)
			dw_ccc.setItem(fila,'num_cobro',st_p.num_cobro)
			dw_ccc.setItem(fila,'cartipo',st_p.cartipo)
			dw_ccc.setItem(fila,'item', st_p.item)
			dw_ccc.setItem(fila,'nfact',dw_facts.getItemNumber(i,'nfact'))
			dw_ccc.setItem(fila,'clugar_fact',dw_facts.getItemString(i,'clugar'))
			dw_ccc.setItem(fila,'tipo_fac',dw_facts.getItemString(i,'tipo_fac'))
			dw_ccc.setItem(fila,'num_radicacion',st_p.nradica)
			dw_ccc.setItem(fila,'clugar_rad',st_p.clugar_rad)
			dw_ccc.setItem(fila,'tipo_rad',st_p.tipo_rad)
		end if
		if st_p.origen='P' then 
			dw_ccc.setItem(fila,'valor',dw_facts.getItemNumber(i,'valor_pago'))
			dw_ccc.setItem(fila,'des_ajus',0)
		else
			dw_ccc.setItem(fila,'valor',0)
			dw_ccc.setItem(fila,'des_ajus',dw_facts.getItemNumber(i,'valor_pago'))
		end if
		dw_ccc.setItem(fila,'fecha',datetime(today(),now()))
		dw_ccc.setItem(fila,'estado','1')		
		dw_ccc.setItem(fila,'usuario',usuario)
	next
else
	messageBox('Atención','El valor total no está distribuido en las facturas')
end if

if dw_ccc.Update(TRUE,FALSE) = -1 then
	rollback;
	return -1
end if
return 0

end function

on w_dist_pagos.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_im=create dw_im
this.pb_impo=create pb_impo
this.st_3=create st_3
this.st_saldo=create st_saldo
this.pb_def=create pb_def
this.dw_ctipo=create dw_ctipo
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.em_pago=create em_pago
this.st_1=create st_1
this.dw_facts=create dw_facts
this.dw_ccc=create dw_ccc
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_im,&
this.pb_impo,&
this.st_3,&
this.st_saldo,&
this.pb_def,&
this.dw_ctipo,&
this.pb_cancel,&
this.pb_ok,&
this.em_pago,&
this.st_1,&
this.dw_facts,&
this.dw_ccc}
end on

on w_dist_pagos.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_im)
destroy(this.pb_impo)
destroy(this.st_3)
destroy(this.st_saldo)
destroy(this.pb_def)
destroy(this.dw_ctipo)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.em_pago)
destroy(this.st_1)
destroy(this.dw_facts)
destroy(this.dw_ccc)
end on

event open;st_p = Message.PowerObjectParm
em_pago.Text = string(st_p.dw_pagos.getItemNumber(st_p.dw_pagos.getRow(),'valor'),'#,##0.00')
dw_ctipo.setItem(1,1,st_p.cartipo)
dw_facts.Retrieve(st_p.nradica, st_p.clugar_rad,st_p.tipo_rad, st_p.cartipo, st_p.item)
dw_ccc.retrieve(st_p.coddoc, st_p.clugar,st_p.num_cobro, st_p.cartipo, st_p.item)
st_saldo.text = string(st_p.dw_pagos.getItemNumber(st_p.dw_pagos.getRow(),'valor') - dw_facts.getItemNumber(1,'sumpago'),'#,##0.00')

end event

type pb_2 from picturebutton within w_dist_pagos
string tag = "Distibuye Seleccionadas"
integer x = 846
integer y = 20
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
string picturename = "todas.gif"
alignment htextalign = left!
end type

event clicked;if dw_facts.rowcount()=0 then return 1
if st_p.dw_pagos.getItemString(st_p.dw_pagos.getRow(),'distribuido') = '1' then
	MessageBox('Atención','El monto ya ha sido distribuido y guardado definitivo')
	return 0
end if
dec porcen
long j, f, precision
precision = st_p.decimales
pb_impo.enabled=false
if round(dw_facts.getitemnumber(1,'sumsaldo'),precision) < round(st_p.dw_pagos.getItemNumber(st_p.dw_pagos.getRow(),'valor'),precision) then
	MessageBox('Atención','El saldo de las facturas seleccionadas es menor que el monto a distribuir')
	Return 0
end if
porcen = round(st_p.dw_pagos.getItemNumber(st_p.dw_pagos.getRow(),'valor'),precision) / round(dw_facts.getitemnumber(1,'sumsaldo'),precision)
if porcen > 1 then
	porcen = 0
	em_pago.text = '0'
end if
dw_facts.SetRedraw(FALSE)
for j = 1 to dw_facts.rowcount()
	if dw_facts.getItemNumber(j,'selec') = 0 then Continue
	dw_facts.setitem(j,'valor_pago',round(dw_facts.getitemnumber(j,'saldo')*porcen, precision))
next

double diff
diff = double(em_pago.text) - dw_facts.GetItemNumber(1,'sumpago')
f = dw_facts.RowCount()
do while diff <> 0 and f > 0
	if dw_facts.getItemNumber(f,'selec') = 0 then
		f = f -1
		continue
	end if
	if dw_facts.GetItemNumber(f,'valor_pago') + diff >= 0 and dw_facts.GetItemNumber(f,'valor_pago') + diff <= dw_facts.GetItemNumber(f,'saldo') then
		dw_facts.SetItem(f,'valor_pago',dw_facts.GetItemNumber(f,'valor_pago') + diff) 
		diff = 0
	elseif dw_facts.GetItemNumber(f,'valor_pago') + diff < 0 then
		diff = dw_facts.GetItemNumber(f,'valor_pago') + diff
		dw_facts.SetItem(f,'valor_pago',0) 
	elseif dw_facts.GetItemNumber(f,'valor_pago') + diff > dw_facts.GetItemNumber(f,'saldo') then
		diff = dw_facts.GetItemNumber(f,'valor_pago') + diff - dw_facts.GetItemNumber(f,'saldo')
		dw_facts.SetItem(f,'valor_pago',dw_facts.GetItemNumber(f,'saldo'))
	end if
	f = f -1
loop
dw_facts.SetRedraw(TRUE)
st_saldo.text = string(st_p.dw_pagos.getItemNumber(st_p.dw_pagos.getRow(),'valor') - dw_facts.getItemNumber(1,'sumpago'),'#,##0.00')
return 0

end event

type pb_1 from picturebutton within w_dist_pagos
string tag = "Limpia Pago"
integer x = 1006
integer y = 20
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "limpiar.gif"
alignment htextalign = left!
end type

event clicked;if dw_facts.rowcount()=0 then return 1
if st_p.dw_pagos.getItemString(st_p.dw_pagos.getRow(),'distribuido') = '1' then
	MessageBox('Atención','El monto ya ha sido distribuido y guardado definitivo')
	return 0
end if
dw_facts.SetRedraw(FALSE)
pb_impo.enabled=true
long j
for j = 1 to dw_facts.rowcount()
	dw_facts.setitem(j,'valor_pago',0)
next
dw_facts.SetRedraw(TRUE)
st_saldo.text = string(st_p.dw_pagos.getItemNumber(st_p.dw_pagos.getRow(),'valor') - dw_facts.getItemNumber(1,'sumpago'),'#,##0.00')

end event

type dw_im from datawindow within w_dist_pagos
boolean visible = false
integer x = 1408
integer y = 1376
integer width = 2185
integer height = 72
integer taborder = 20
string title = "none"
string dataobject = "dw_imp_pagos"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type pb_impo from picturebutton within w_dist_pagos
integer x = 2610
integer y = 12
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "import.gif"
string disabledname = "d_import.gif"
alignment htextalign = left!
string powertiptext = "Importar archivo"
end type

event clicked;if dw_facts.rowCount() = 0 then return 0

string distr
select distribuido  into :distr from car_cobro_cpo 
where coddoc=:st_p.coddoc and clugar=:st_p.clugar and num_cobro=:st_p.num_cobro and
cartipo = :st_p.cartipo and item=:st_p.item;
if distr = '1' then 
	messageBox('Atención','El documento ya ha sido distribuido. No puede modificarse')
	return 0
End If

long value, i, l_fac,n_rad,ll_found 
string docname,named,l_lug,l_tipof,tipo_rad,l_rad
date l_fec
double valores

value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Text files, *.TXT, CSV files, *.CSV") 
IF value = 1 THEN
	value = dw_im.ImportFile(csv!,docname)
	if value = -1  then MessageBox('Atención','No se encontraron filas')
	if value = -2  then MessageBox('Atención','Archivo vacio')
	if value = -3  then MessageBox('Atención','Argumento inválido')
	if value = -4  then MessageBox('Atención','Entrada inválida')
	if value = -5  then MessageBox('Atención','No se puede abrir el archivo')
	if value = -6  then MessageBox('Atención','No se puede cerrar el archivo')
	if value = -7  then MessageBox('Atención','Error leyendo el texto')
	if value = -8  then MessageBox('Atención','Sufijo de archivo no soportado (debe ser *.txt, *.csv, *.dbf or *.xml)')
	if value = -10 then MessageBox('Atención','Formato de archivo dBase no soportado  (solo version 2 or 3)')
	if value = -13 then MessageBox('Atención','Estilo de DataWindow no soportado para importación')
	if value = -14 then MessageBox('Atención','Error resolviendo anidamiento de DataWindow')
	if value < 0 then REturn -1
end if


for i = 1 to dw_im.RowCount()
	if i=1 then 
	  	n_rad=dw_im.GetItemnumber(1,'nradica')
	 	l_rad=dw_im.GetItemstring(1,'clug_rad')
	   	tipo_rad=dw_im.GetItemString(1,'tipo_rad')
	    	if st_p.nradica<> n_rad or st_p.tipo_rad<> tipo_rad or st_p.clugar_rad> l_rad then
			MessageBox('Atención','No corresponde facturas con radicación')	
			 return 0
		end if
		valores=dw_im.GetItemnumber(1,'valores')
		if valores <>double(em_pago.text)then
			MessageBox('Atención','Valor nno corresponde a monto a distribuir')	
			 return 0
		end if
	end if
	l_fac = dw_im.GetItemnumber(i,'factura')
	l_lug = dw_im.GetItemString(i,'lugar')
	l_tipof = dw_im.GetItemString(i,'tipo_fac')
	l_fec= dw_im.GetItemdate(i,'fecha')
	ll_found =dw_facts.Find("nfact ="+string(l_fac)+" and clugar ='"+l_lug+"' and tipo_fac='"+l_tipof+"' and string(fecha)='"+string(l_fec)+"'",1,dw_facts.RowCount()) 
	if ll_found > 0 then
		dw_facts.SetItem(ll_found ,'selec',2)
		dw_facts.SetItem(ll_found ,'valor_pago',dw_im.GetItemnumber(i,'valor'))
	end if
next

end event

type st_3 from statictext within w_dist_pagos
integer x = 1312
integer y = 16
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Restante"
boolean focusrectangle = false
end type

type st_saldo from statictext within w_dist_pagos
integer x = 1298
integer y = 80
integer width = 498
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

type pb_def from picturebutton within w_dist_pagos
integer x = 2766
integer y = 12
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "124"
boolean originalsize = true
string picturename = "guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Definitivo"
end type

event clicked;if dw_facts.rowCount() = 0 then return 0
string msg
if f_grabar() = -1 then return -1
if messageBox('Atención','Si guarda definitivo no podrá hacer modificaciones posteriormente. Desea continuar?',question!,yesno!) = 2 then return 0
update car_cobro_cpo set distribuido = '1'
where coddoc=:st_p.coddoc and clugar=:st_p.clugar and num_cobro=:st_p.num_cobro and
cartipo = :st_p.cartipo and item=:st_p.item;
IF SQLCA.SQLCode = -1 THEN 
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error", msg)
	return -1
END IF
dw_ccc.ResetUpdate()
commit;
return 0

end event

type dw_ctipo from datawindow within w_dist_pagos
boolean visible = false
integer x = 1317
integer y = 68
integer width = 960
integer height = 92
integer taborder = 30
boolean enabled = false
string dataobject = "dw_combo_cartipo_pago"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
getChild('cartipo',idw_ct)
idw_ct.setTransObject(SQLCA)
idw_ct.retrieve()
InsertRow(0)
if idw_ct.rowCount() = 1 then
	setItem(1,'cartipo',idw_ct.getItemString(1,'cartipo'))
end if

end event

type pb_cancel from picturebutton within w_dist_pagos
integer x = 3058
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)

end event

type pb_ok from picturebutton within w_dist_pagos
integer x = 2912
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if dw_facts.rowCount() = 0 then return 0
if f_grabar() = -1 then return -1
dw_ccc.ResetUpdate()
commit;
return 0

end event

type em_pago from editmask within w_dist_pagos
integer x = 46
integer y = 64
integer width = 645
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "#,##0.00"
end type

type st_1 from statictext within w_dist_pagos
integer x = 46
integer y = 4
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Pago"
boolean focusrectangle = false
end type

type dw_facts from datawindow within w_dist_pagos
integer x = 32
integer y = 168
integer width = 4352
integer height = 1204
integer taborder = 10
string title = "none"
string dataobject = "dw_facts_mov"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;if dwo.name="selec_t" then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

event itemchanged;if dw_facts.rowCount() = 0 then Return 0
st_saldo.text = string(st_p.dw_pagos.getItemNumber(st_p.dw_pagos.getRow(),'valor') - dw_facts.getItemNumber(1,'sumpago'),'#,##0.00')

end event

type dw_ccc from datawindow within w_dist_pagos
boolean visible = false
integer x = 4119
integer y = 24
integer width = 238
integer height = 100
integer taborder = 30
string title = "none"
string dataobject = "dw_carcobro_rad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event retrieveend;long i, fila
for i = 1 to rowCount()
	fila = dw_facts.find("nfact="+string(getItemNumber(i,'nfact'))+" and clugar='"+getItemString(i,'clugar_fact')+"'",1, dw_facts.rowCount())
	if fila > 0 then
		dw_facts.setItem(fila,'valor_pago',getItemNumber(i,'valor'))
	end if
next

end event

