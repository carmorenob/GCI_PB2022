$PBExportHeader$w_choosedoc.srw
forward
global type w_choosedoc from window
end type
type st_1 from statictext within w_choosedoc
end type
type pb_buscar from picturebutton within w_choosedoc
end type
type dw_t from datawindow within w_choosedoc
end type
type pb_1 from picturebutton within w_choosedoc
end type
type pb_13 from picturebutton within w_choosedoc
end type
type tb_1 from tab within w_choosedoc
end type
type tp_3 from userobject within tb_1
end type
type st_3 from statictext within tp_3
end type
type dw_cc from datawindow within tp_3
end type
type dw_intf from datawindow within tp_3
end type
type tp_3 from userobject within tb_1
st_3 st_3
dw_cc dw_cc
dw_intf dw_intf
end type
type tp_1 from userobject within tb_1
end type
type dw_rub from datawindow within tp_1
end type
type tp_1 from userobject within tb_1
dw_rub dw_rub
end type
type tp_2 from userobject within tb_1
end type
type st_2 from statictext within tp_2
end type
type dw_ter from datawindow within tp_2
end type
type tp_2 from userobject within tb_1
st_2 st_2
dw_ter dw_ter
end type
type tb_1 from tab within w_choosedoc
tp_3 tp_3
tp_1 tp_1
tp_2 tp_2
end type
type dw_historial from datawindow within w_choosedoc
end type
end forward

global type w_choosedoc from window
integer width = 5586
integer height = 1772
boolean titlebar = true
string title = "Selección de documentos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event p_selecttab ( integer p_tab )
st_1 st_1
pb_buscar pb_buscar
dw_t dw_t
pb_1 pb_1
pb_13 pb_13
tb_1 tb_1
dw_historial dw_historial
end type
global w_choosedoc w_choosedoc

type variables
st_interfaz st_p
int i_dec_gral,i_aprox_gral
end variables

event p_selecttab(integer p_tab);tb_1.selectedtab=p_tab
end event

on w_choosedoc.create
this.st_1=create st_1
this.pb_buscar=create pb_buscar
this.dw_t=create dw_t
this.pb_1=create pb_1
this.pb_13=create pb_13
this.tb_1=create tb_1
this.dw_historial=create dw_historial
this.Control[]={this.st_1,&
this.pb_buscar,&
this.dw_t,&
this.pb_1,&
this.pb_13,&
this.tb_1,&
this.dw_historial}
end on

on w_choosedoc.destroy
destroy(this.st_1)
destroy(this.pb_buscar)
destroy(this.dw_t)
destroy(this.pb_1)
destroy(this.pb_13)
destroy(this.tb_1)
destroy(this.dw_historial)
end on

event open;SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=29));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 29')
	return 
end if

SELECT ENTERO into :i_aprox_gral
FROM parametros_gen
WHERE (((codigo_para)=18));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 18')
	return 
end if
if i_aprox_gral=0 then i_aprox_gral=1

st_p = Message.PowerObjectParm
tb_1.tp_1.dw_rub.Modify("monto.Edit.DisplayOnly=YES")
if st_p.coddoc = 'PDI' or st_p.coddoc = 'PRC' then
	dw_t.Visible = FALSE
	pb_buscar.Visible = FALSE
	tb_1.tp_2.Visible = FALSE
	if st_p.coddoc = 'PDI' then
		dw_historial.DataObject = 'dw_histo_docs_sel'
		dw_historial.setTransObject(SQLCA)
		dw_historial.Retrieve(st_p.coddoc,clugar,st_p.cod_vigencia,st_p.filtro)
		tb_1.tp_1.dw_rub.Modify("monto.Edit.DisplayOnly=no")
		tb_1.tp_1.dw_rub.Modify("monto.protect='0'")
		tb_1.tp_3.Visible = FALSE
		st_1.Text = 'Disponibilidades'
	elseif st_p.coddoc = 'PRC' then
		if st_p.codmod='PI--' then 
			tb_1.tp_3.visible =false
			tb_1.tp_1.dw_rub.Modify("monto.Edit.DisplayOnly=no")
			tb_1.tp_1.dw_rub.Modify("monto.protect='0'")						
			dw_historial.DataObject = 'dw_recons_manuales'
		else
			tb_1.tp_3.Visible = TRUE
			dw_historial.DataObject = 'dw_recons_con_pagos'
		end if
		dw_historial.setTransObject(SQLCA)
		dw_historial.Retrieve(st_p.coddoc,clugar,st_p.cod_vigencia,st_p.filtro)
		st_1.Text = 'Reconocimientos'
	end if
	st_1.Visible = TRUE
	post event p_selecttab(2)
else
	dw_t.Visible = TRUE
	pb_buscar.Visible = TRUE
	dw_historial.DataObject = 'dw_histo_docs_sel_ter'
	dw_historial.setTransObject(SQLCA)
	st_1.Visible = FALSE
end if
dw_historial.TriggerEvent(rowfocuschanged!)

end event

type st_1 from statictext within w_choosedoc
integer x = 18
integer y = 72
integer width = 1161
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_choosedoc
event mousemove pbm_mousemove
integer x = 3163
integer y = 12
integer width = 137
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar Tercero"
end type

type dw_t from datawindow within w_choosedoc
integer x = 9
integer y = 12
integer width = 3159
integer height = 152
integer taborder = 30
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
insertRow(1)

end event

event itemchanged;this.accepttext()
string tipodoc, documento

tipodoc = this.getitemstring(this.getrow(),'tipodoc')
documento = this.getitemstring(this.getrow(),'documento')
if not isNull(dwo) then
	if string(dwo.Name) <> 'documento' then Return
end if

this.retrieve(tipodoc,documento)
IF this.rowcount()=0 THEN
	this.insertrow(0)
	this.SetItem(1,'tipodoc',tipodoc)
	this.SetItem(1,'documento',documento)
	this.SetColumn('documento')
	messageBox ("Atención","Tercero no encontrado.")
else
	dw_historial.retrieve(tipodoc,documento,st_p.coddoc,clugar,st_p.cod_vigencia,st_p.filtro)
END IF

end event

type pb_1 from picturebutton within w_choosedoc
event mousemove pbm_mousemove
string tag = "Reservar"
integer x = 2615
integer y = 1472
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Llevar seleccionados"
end type

event clicked;long fila, i, rub, f, cc
string valor,ct,objeto=''
dec monto,valor1

if st_p.coddoc <> 'PRC' then
	fila = dw_historial.Find("selec=1",1,dw_historial.RowCount())
	if fila = 0 then Return -1
	do while st_p.dw_it.RowCount() > 0
		st_p.dw_it.DeleteRow(1)
	loop
	do while st_p.dw_obj.RowCount() > 0
		st_p.dw_obj.DeleteRow(1)
	loop
	st_p.dw_cab.setitem(1,'objeto','')
	do while fila > 0
		objeto=st_p.dw_cab.getitemstring(1,'objeto')
		if isnull(objeto) then objeto=''
		if not isnull(dw_historial.getitemstring(fila,'objeto')) then 
			if objeto<>'' then objeto+='~r~n'
			objeto+=dw_historial.getitemstring(fila,'objeto')
		end if
		st_p.dw_cab.setitem(1,'objeto',objeto)
		dw_historial.ScrolltoRow(fila)
		//dw_historial.TriggerEvent(RowFocuschanged!)
		f = st_p.dw_it.InsertRow(0)
		st_p.dw_it.SetItem(f,'codigo',st_p.codmod)
		st_p.dw_it.SetItem(f,'char_orig1',dw_historial.GetItemString(fila,'coddoc'))
		st_p.dw_it.SetItem(f,'char_orig2',dw_historial.GetItemString(fila,'clugar'))
		st_p.dw_it.SetItem(f,'num_orig1',dw_historial.GetItemNumber(fila,'numdoc'))
		st_p.dw_it.SetItem(f,'char_doc1',st_p.dw_cab.GetItemString(1,'coddoc'))
		st_p.dw_it.SetItem(f,'char_doc2',st_p.dw_cab.GetItemString(1,'clugar'))
		st_p.dw_it.SetItem(f,'num_doc1',st_p.dw_cab.GetItemNumber(1,'numdoc'))
		valor1=round(tb_1.tp_1.dw_rub.GetItemNumber(1,'total'),i_dec_gral)
		if i_dec_gral=0 then
			valor1=long(valor1/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor1 -long(valor1/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
		end if
		st_p.dw_it.SetItem(f,'valor',valor1)
		
		for i = 1 to tb_1.tp_1.dw_rub.RowCount()
			valor = st_p.dw_obj.Describe("Evaluate('max(item)',0)")
			rub = st_p.dw_obj.InsertRow(0)
			st_p.dw_obj.SetItem(rub,'coddoc',st_p.dw_cab.GetItemString(1,'coddoc'))
			st_p.dw_obj.SetItem(rub,'clugar',st_p.dw_cab.GetItemString(1,'clugar'))
			st_p.dw_obj.SetItem(rub,'numdoc',st_p.dw_cab.GetItemNumber(1,'numdoc'))
			st_p.dw_obj.SetItem(rub,'item',long(valor) + 1)
			st_p.dw_obj.SetItem(rub,'cod_vigencia',tb_1.tp_1.dw_rub.GetItemNumber(i,'cod_vigencia'))
			st_p.dw_obj.SetItem(rub,'codtotal',tb_1.tp_1.dw_rub.GetItemString(i,'codtotal'))
			st_p.dw_obj.SetItem(rub,'coddoc_orig',tb_1.tp_1.dw_rub.GetItemString(i,'coddoc'))
			st_p.dw_obj.SetItem(rub,'clugar_orig',tb_1.tp_1.dw_rub.GetItemString(i,'clugar'))
			st_p.dw_obj.SetItem(rub,'numdoc_orig',tb_1.tp_1.dw_rub.GetItemNumber(i,'numdoc'))
			st_p.dw_obj.SetItem(rub,'item_orig',tb_1.tp_1.dw_rub.GetItemNumber(i,'item'))
			st_p.dw_obj.SetItem(rub,'descrip',tb_1.tp_1.dw_rub.GetItemString(i,'descrip'))
			st_p.dw_obj.SetItem(rub,'estado_cb','0')
	
			st_p.dw_obj.SetItem(rub,'monto',tb_1.tp_1.dw_rub.GetItemNumber(i,'monto_vigente'))
			st_p.dw_obj.SetItem(rub,'monto_vigente',tb_1.tp_1.dw_rub.GetItemNumber(i,'monto_vigente'))
			st_p.dw_obj.SetItem(rub,'monto_vigente_orig',tb_1.tp_1.dw_rub.GetItemNumber(i,'monto_vigente'))
			st_p.dw_obj.SetItem(rub,'monto_utilizado_orig',tb_1.tp_1.dw_rub.GetItemNumber(i,'monto_utilizado'))
		next
		dw_historial.SetItem(fila,'selec',0)
		fila = dw_historial.Find("selec=1",fila,dw_historial.RowCount())
	loop
else // Reconocimientos llevar para recaudos
	int decimas
	fila = dw_historial.Find("selec=1",1,dw_historial.RowCount())
	if fila = 0 then Return -1
	do while st_p.dw_it.RowCount() > 0
		st_p.dw_it.DeleteRow(1)
	loop
	do while st_p.dw_obj.RowCount() > 0
		st_p.dw_obj.DeleteRow(1)
	loop
	do while fila > 0
		dw_historial.ScrolltoRow(fila)
	//	dw_historial.TriggerEvent(RowFocuschanged!)
	///PARA OBJETOS
		objeto=st_p.dw_cab.getitemstring(1,'objeto')
		if isnull(objeto) then objeto=''
		if not isnull(dw_historial.getitemstring(fila,'objeto')) then 
			if objeto<>'' then objeto+='~r~n'
			objeto+=dw_historial.getitemstring(fila,'objeto')
		end if
		st_p.dw_cab.setitem(1,'objeto',objeto)
		if st_p.codmod='PI--' then
			monto=1
			decimas=2
		else
			for cc = 1 to tb_1.tp_3.dw_cc.RowCount()
				f = st_p.dw_it.InsertRow(0)
				st_p.dw_it.SetItem(f,'codigo',st_p.codmod)
				st_p.dw_it.SetItem(f,'char_orig1',tb_1.tp_3.dw_cc.GetItemString(cc,'coddoc'))
				st_p.dw_it.SetItem(f,'char_orig2',tb_1.tp_3.dw_cc.GetItemString(cc,'clugar'))
				st_p.dw_it.SetItem(f,'char_orig3',tb_1.tp_3.dw_cc.GetItemString(cc,'cartipo'))
				st_p.dw_it.SetItem(f,'num_orig1',tb_1.tp_3.dw_cc.GetItemNumber(cc,'num_cobro'))
				st_p.dw_it.SetItem(f,'num_orig2',tb_1.tp_3.dw_cc.GetItemNumber(cc,'item'))
				st_p.dw_it.SetItem(f,'char_doc1',st_p.dw_cab.GetItemString(1,'coddoc'))
				st_p.dw_it.SetItem(f,'char_doc2',st_p.dw_cab.GetItemString(1,'clugar'))
				st_p.dw_it.SetItem(f,'num_doc1',st_p.dw_cab.GetItemNumber(1,'numdoc'))
				valor1=round(tb_1.tp_3.dw_cc.GetItemNumber(cc,'total'),i_dec_gral)
				if i_dec_gral=0 then
					valor1=long(valor1/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor1 -long(valor1/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
				end if
				st_p.dw_it.SetItem(f,'valor',valor1)
			next
			monto=tb_1.tp_3.dw_cc.getitemnumber(1,'t_pagado')/tb_1.tp_3.dw_intf.getitemnumber(1,'t_valor')
			decimas=0
		end if
		for cc= 1 to tb_1.tp_1.dw_rub.rowcount()
			if tb_1.tp_1.dw_rub.GetItemNumber(cc,'monto')>0 then
			rub=st_p.dw_obj.insertrow(0)
			st_p.dw_obj.SetItem(rub,'coddoc',st_p.dw_cab.GetItemString(1,'coddoc'))
			st_p.dw_obj.SetItem(rub,'clugar',st_p.dw_cab.GetItemString(1,'clugar'))
			st_p.dw_obj.SetItem(rub,'numdoc',st_p.dw_cab.GetItemNumber(1,'numdoc'))
			st_p.dw_obj.SetItem(rub,'item',rub)
			st_p.dw_obj.SetItem(rub,'cod_vigencia',tb_1.tp_1.dw_rub.GetItemNumber(cc,'cod_vigencia'))
			st_p.dw_obj.SetItem(rub,'codtotal',tb_1.tp_1.dw_rub.GetItemString(cc,'codtotal'))
			st_p.dw_obj.SetItem(rub,'descrip',tb_1.tp_1.dw_rub.GetItemString(cc,'descrip'))
			st_p.dw_obj.SetItem(rub,'estado_cb','0')
			if st_p.codmod='PI--' then
				valor1=round(tb_1.tp_1.dw_rub.GetItemNumber(cc,'monto_vigente')-tb_1.tp_1.dw_rub.GetItemNumber(cc,'monto_utilizado'),i_dec_gral)
				if i_dec_gral=0 then
					valor1=long(valor1/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor1 -long(valor1/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
				end if
				st_p.dw_obj.SetItem(rub,'monto',valor1)
			else
				valor1=round(round(tb_1.tp_1.dw_rub.GetItemNumber(cc,'monto_vigente')*monto,decimas),i_dec_gral)
				if i_dec_gral=0 then
					valor1=long(valor1/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor1 -long(valor1/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
				end if
				st_p.dw_obj.SetItem(rub,'monto',valor1)
			end if
			st_p.dw_obj.SetItem(rub,'monto_vigente',st_p.dw_obj.getitemnumber(rub,'monto'))
			st_p.dw_obj.SetItem(rub,'coddoc_orig',tb_1.tp_1.dw_rub.GetItemString(cc,'coddoc'))
			st_p.dw_obj.SetItem(rub,'clugar_orig',tb_1.tp_1.dw_rub.GetItemString(cc,'clugar'))
			st_p.dw_obj.SetItem(rub,'numdoc_orig',tb_1.tp_1.dw_rub.GetItemnumber(cc,'numdoc'))
			st_p.dw_obj.SetItem(rub,'item_orig',tb_1.tp_1.dw_rub.GetItemnumber(cc,'item'))
			st_p.dw_obj.SetItem(rub,'monto_vigente_orig',tb_1.tp_1.dw_rub.GetItemNumber(cc,'monto_vigente'))
			st_p.dw_obj.SetItem(rub,'monto_utilizado_orig',tb_1.tp_1.dw_rub.GetItemNumber(cc,'monto_utilizado'))
		end if			
		next
		dw_historial.SetItem(fila,'selec',0)
		fila = dw_historial.Find("selec=1",fila,dw_historial.RowCount())
	loop
end if
close(parent)
end event

type pb_13 from picturebutton within w_choosedoc
event mousemove pbm_mousemove
integer x = 2784
integer y = 1472
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
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

type tb_1 from tab within w_choosedoc
integer y = 576
integer width = 5467
integer height = 1080
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_3 tp_3
tp_1 tp_1
tp_2 tp_2
end type

on tb_1.create
this.tp_3=create tp_3
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_3,&
this.tp_1,&
this.tp_2}
end on

on tb_1.destroy
destroy(this.tp_3)
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_3 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 5431
integer height = 952
long backcolor = 67108864
string text = "Interfaz"
long tabtextcolor = 33554432
string picturename = "buscar.ico"
long picturemaskcolor = 536870912
st_3 st_3
dw_cc dw_cc
dw_intf dw_intf
end type

on tp_3.create
this.st_3=create st_3
this.dw_cc=create dw_cc
this.dw_intf=create dw_intf
this.Control[]={this.st_3,&
this.dw_cc,&
this.dw_intf}
end on

on tp_3.destroy
destroy(this.st_3)
destroy(this.dw_cc)
destroy(this.dw_intf)
end on

type st_3 from statictext within tp_3
integer x = 50
integer y = 396
integer width = 773
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Abonos a Cuentas por Cobrar:"
boolean focusrectangle = false
end type

type dw_cc from datawindow within tp_3
integer x = 46
integer y = 452
integer width = 3026
integer height = 344
integer taborder = 30
string title = "none"
string dataobject = "dw_flujo_car_cobro"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type dw_intf from datawindow within tp_3
integer x = 37
integer y = 20
integer width = 2697
integer height = 364
integer taborder = 20
string title = "none"
string dataobject = "dw_flujo_recon_recau"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_cc.reset()
if RowCount() = 0 or currentrow = 0 then Return
dw_cc.Retrieve(GetItemString(GetRow(),'char_orig1'),GetItemString(GetRow(),'char_orig2'),GetItemNumber(GetRow(),'num_orig1'))

end event

type tp_1 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 5431
integer height = 952
long backcolor = 67108864
string text = "Rubros"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
dw_rub dw_rub
end type

on tp_1.create
this.dw_rub=create dw_rub
this.Control[]={this.dw_rub}
end on

on tp_1.destroy
destroy(this.dw_rub)
end on

type dw_rub from datawindow within tp_1
event p_changed ( )
integer x = 41
integer y = 24
integer width = 5321
integer height = 732
integer taborder = 20
string title = "none"
string dataobject = "dw_pre_doc_cp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_changed();accepttext()
end event

event constructor;setTransObject(SQLCA)

end event

event itemchanged;if dwo.name<>'monto' then return

dec valor
valor=round(dec(data),i_dec_gral)
if i_dec_gral=0 then
	valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
end if
if valor < 0 then
	settext('0')
	setitem(row,'monto',0)
	setitem(row,'monto_vigente',0)
	return 1
end if
setitem(row,'monto',valor)
if st_p.coddoc = 'PRC' then
	setitem(row,'monto_vigente',valor)
end if
if this.AcceptText() = -1 then Return
post event p_changed()
end event

type tp_2 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 5431
integer height = 952
long backcolor = 67108864
string text = "Terceros"
long tabtextcolor = 33554432
string picturename = "paciente.ico"
long picturemaskcolor = 536870912
st_2 st_2
dw_ter dw_ter
end type

on tp_2.create
this.st_2=create st_2
this.dw_ter=create dw_ter
this.Control[]={this.st_2,&
this.dw_ter}
end on

on tp_2.destroy
destroy(this.st_2)
destroy(this.dw_ter)
end on

type st_2 from statictext within tp_2
integer x = 87
integer y = 12
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
string text = "Terceros del documento"
boolean focusrectangle = false
end type

type dw_ter from datawindow within tp_2
integer x = 82
integer y = 80
integer width = 3314
integer height = 556
integer taborder = 20
string title = "none"
string dataobject = "dw_pre_doc_ter"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;dec valor

valor=round(dec(data),i_dec_gral)
if i_dec_gral=0 then
	valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
end if

accepttext()
setitem(row,'Monto',valor)
return 2
end event

type dw_historial from datawindow within w_choosedoc
event setterceros ( )
integer x = 5
integer y = 164
integer width = 5467
integer height = 400
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_recons_manuales"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;if RowCount() = 0 or currentrow = 0 then Return -1
tb_1.tp_1.dw_rub.retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
tb_1.tp_2.dw_ter.retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
tb_1.tp_3.dw_intf.reset()
tb_1.tp_3.dw_intf.retrieve(GetItemString(GetRow(),'cod_flujo'),GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'),0)

end event

event itemchanged;AcceptText()
if getColumnName() = 'selec' then
	
end if

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
	Return
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

