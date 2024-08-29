$PBExportHeader$w_choosedisp.srw
forward
global type w_choosedisp from window
end type
type pb_2 from picturebutton within w_choosedisp
end type
type pb_1 from picturebutton within w_choosedisp
end type
type st_2 from statictext within w_choosedisp
end type
type st_1 from statictext within w_choosedisp
end type
type dw_per from datawindow within w_choosedisp
end type
type dw_vigen from datawindow within w_choosedisp
end type
type dw_rubro from datawindow within w_choosedisp
end type
type dw_disp from datawindow within w_choosedisp
end type
type gb_1 from groupbox within w_choosedisp
end type
type gb_2 from groupbox within w_choosedisp
end type
end forward

global type w_choosedisp from window
integer width = 4430
integer height = 1800
boolean titlebar = true
string title = "Interfaz Presupuesto"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "contrato.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
st_2 st_2
st_1 st_1
dw_per dw_per
dw_vigen dw_vigen
dw_rubro dw_rubro
dw_disp dw_disp
gb_1 gb_1
gb_2 gb_2
end type
global w_choosedisp w_choosedisp

type variables
int i_dec_gral,i_aprox_gral
string codDocumento, codmodulo, orig, dest, ventan
st_interfaz st_parm

end variables
on w_choosedisp.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_per=create dw_per
this.dw_vigen=create dw_vigen
this.dw_rubro=create dw_rubro
this.dw_disp=create dw_disp
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.dw_per,&
this.dw_vigen,&
this.dw_rubro,&
this.dw_disp,&
this.gb_1,&
this.gb_2}
end on

on w_choosedisp.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_per)
destroy(this.dw_vigen)
destroy(this.dw_rubro)
destroy(this.dw_disp)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;codDocumento = 'PDI'
st_parm = Message.PowerObjectParm
dw_vigen.SetTransObject(SQLCA)

select cod_vent, cod_orig, cod_dest into :ventan, :orig, :dest from mod_orig_dest
where codigo=:st_parm.codmod;

if orig = 'PDI' then
	gb_1.Text = 'Disponibilidades'
	st_parm.coddoc = 'PDI'
elseif orig = 'PR' or st_parm.coddoc = 'PR' then	
	gb_1.Text = 'Reservas'
	st_parm.coddoc = 'PR'
else
	MessageBox('Atención','Debe seleccionar un flujo de documento')
end if

dw_disp.SetTransObject(SQLCA)
dw_rubro.SetTransObject(SQLCA)

dw_vigen.InsertRow(0)

SELECT ENTERO into :i_dec_gral
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
end event

type pb_2 from picturebutton within w_choosedisp
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 2126
integer y = 1556
integer width = 146
integer height = 128
integer taborder = 50
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
string powertiptext = "Cerrar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_choosedisp
event mousemove pbm_mousemove
string tag = "Llevar &Disponibilidad"
integer x = 2286
integer y = 1556
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "               &d"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Llevar &Disponibilidad"
end type

event clicked;string cd, cl, td, doc
long nd, fila, f, i
decimal montos
uo_datastore dw_ter
dw_ter = Create uo_datastore
dw_ter.DataObject = 'dw_pre_doc_ter'
dw_ter.SetTransObject(SQLCA)

if dw_disp.RowCount() = 0 then Return

If dw_rubro.getItemNumber(1,'monto_usar')> st_parm.dw_cab.getitemnumber(st_parm.ld_row,'monto') then
	MessageBox('Atención','Excede el monto del contrato')
	Return -1
end if

cd = dw_disp.GetItemString(dw_disp.getRow(),'coddoc')
cl = dw_disp.GetItemString(dw_disp.getRow(),'cLugar')
nd = dw_disp.GetItemNumber(dw_disp.getRow(),'numdoc')
td =  st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'tipodoc')
if st_parm.dw_cab.describe("tercero.Coltype") = '!' then
	doc = st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'documento')
else
	doc = st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'tercero')
end if
if dw_ter.Retrieve(cd,cl,nd) > 0 and not isNull(doc) then
	f = dw_ter.Find("tipodoc='"+td+"' and documento='"+doc+"'",1,dw_ter.RowCount())
	if f = 0 then
		MessageBox('Atención','La reserva no tiene asociado el tercero al que esta asociado el documento')
		Return -1
	end if
end if

if isNull(doc) then
	if orig = 'PR' then
		if dw_ter.RowCount() = 1 then
			st_parm.dw_cab.SetItem(1,'tipodoc',dw_ter.GetItemString(dw_ter.GetRow(),'tipodoc'))
			st_parm.dw_cab.SetItem(1,'documento',dw_ter.GetItemString(dw_ter.GetRow(),'documento'))
			st_parm.dw_cab.SetItem(1,'nombre1',dw_ter.GetItemString(dw_ter.GetRow(),'nombre1'))
			st_parm.dw_cab.SetItem(1,'nombre2',dw_ter.GetItemString(dw_ter.GetRow(),'nombre2'))
			st_parm.dw_cab.SetItem(1,'apellido1',dw_ter.GetItemString(dw_ter.GetRow(),'apellido1'))
			st_parm.dw_cab.SetItem(1,'apellido2',dw_ter.GetItemString(dw_ter.GetRow(),'apellido2'))
			st_parm.dw_cab.SetItem(1,'razon_social',dw_ter.GetItemString(dw_ter.GetRow(),'razon_social'))
		end if
	end if
end if

if ventan = 'OC' then
	for i = 1 to dw_rubro.rowCount()
		if dw_rubro.getItemNumber(i,'monto') = 0 then Continue
		fila = st_parm.dw_obj.Find("char_orig1='" + cd + "' and char_orig2='" +cl+ "' and num_orig1=" + string(nd)+" and num_orig2="+string(dw_rubro.getItemNumber(i,'item')),1,st_parm.dw_obj.RowCount())
		if fila = 0 then
			st_parm.dw_obj.InsertRow(1)
			st_parm.dw_obj.SetItem(1,'codigo',st_parm.codmod)
			st_parm.dw_obj.SetItem(1,'char_doc1',st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'coddoc'))
			st_parm.dw_obj.SetItem(1,'char_doc2',st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'clugar'))
			st_parm.dw_obj.SetItem(1,'num_doc1',st_parm.dw_cab.GetItemNumber(st_parm.dw_cab.GetRow(),'numdoc'))
			st_parm.dw_obj.SetItem(1,'valor',dw_rubro.getItemNumber(i,'monto'))
			st_parm.dw_obj.SetItem(1,'char_orig1',cd)
			st_parm.dw_obj.SetItem(1,'char_orig2',cl)
			st_parm.dw_obj.SetItem(1,'num_orig1',nd)
			st_parm.dw_obj.SetItem(1,'num_orig2',dw_rubro.getItemNumber(i,'item'))
			messageBox('Atención', 'Se agregó registro exitosamente')
		end if
	next
elseif ventan = 'SCT' or ventan = 'NC' then
	for i = 1 to dw_rubro.rowCount()
		if dw_rubro.getItemNumber(i,'monto') = 0 then Continue
		if st_parm.otrosi='1' then 
			fila = st_parm.dw_fte.Find("coddoc_dispo='" + cd + "' and clugar_dispo='" +cl+ "' and numdoc_dispo=" + string(nd) +" and item_dispo="+string(dw_rubro.getItemNumber(i,'item')),1,st_parm.dw_fte.RowCount())
			if fila = 0 then
				fila=st_parm.dw_fte.TriggerEvent("insertaFila")
				st_parm.dw_fte.SetItem(f,'otrosi',-1)				
				st_parm.dw_fte.SetItem(fila,'monto',dw_rubro.getItemNumber(i,'monto'))
				st_parm.dw_fte.SetItem(fila,'monto_vigente_dispo',dw_rubro.getItemNumber(i,'monto_vigente'))
				st_parm.dw_fte.SetItem(fila,'coddoc_dispo',cd)
				st_parm.dw_fte.SetItem(fila,'clugar_dispo',cl)
				st_parm.dw_fte.SetItem(fila,'numdoc_dispo',nd)
				st_parm.dw_fte.SetItem(fila,'item_dispo',dw_rubro.getItemNumber(i,'item'))
				st_parm.dw_fte.SetItem(fila,'codtotal_dispo',dw_rubro.getItemString(i,'codtotal'))
				st_parm.dw_fte.SetItem(fila,'descrip_dispo',dw_rubro.getItemString(i,'descrip'))
				st_parm.dw_fte.SetItem(fila,'consecutivo_disp',dw_disp.GetItemNumber(dw_disp.getRow(),'consecutivo'))
				st_parm.dw_fte.SetItem(fila,'fecha_consecu_disp',dw_disp.GetItemDateTime(dw_disp.getRow(),'fecha_consecu'))
				st_parm.dw_fte.SetItem(fila,'objeto',dw_disp.GetItemString(dw_disp.getRow(),'objeto'))
				messageBox('Atención', 'Se agregó registro exitosamente')
			else
				montos = st_parm.dw_fte.getitemnumber(fila,'monto')
				st_parm.dw_fte.SetItem(fila,'monto',montos + dw_rubro.getItemNumber(i,'monto'))
				messageBox('Atención', 'Se modificó el monto existente')
			end if
	//	end if
		else
			
			fila = st_parm.dw_obj.Find("coddoc_dispo='" + cd + "' and clugar_dispo='" +cl+ "' and numdoc_dispo=" + string(nd) +" and item_dispo="+string(dw_rubro.getItemNumber(i,'item')),1,st_parm.dw_obj.RowCount())
			if fila = 0 then
				fila=st_parm.dw_obj.TriggerEvent("insertaFila")
				st_parm.dw_obj.SetItem(fila,'monto',dw_rubro.getItemNumber(i,'monto'))
				st_parm.dw_obj.SetItem(fila,'monto_vigente_dispo',dw_rubro.getItemNumber(i,'monto_vigente'))
				st_parm.dw_obj.SetItem(fila,'coddoc_dispo',cd)
				st_parm.dw_obj.SetItem(fila,'clugar_dispo',cl)
				st_parm.dw_obj.SetItem(fila,'numdoc_dispo',nd)
				st_parm.dw_obj.SetItem(fila,'item_dispo',dw_rubro.getItemNumber(i,'item'))
				st_parm.dw_obj.SetItem(fila,'codtotal_dispo',dw_rubro.getItemString(i,'codtotal'))
				st_parm.dw_obj.SetItem(fila,'descrip_dispo',dw_rubro.getItemString(i,'descrip'))
				st_parm.dw_obj.SetItem(fila,'consecutivo_disp',dw_disp.GetItemNumber(dw_disp.getRow(),'consecutivo'))
				st_parm.dw_obj.SetItem(fila,'fecha_consecu_disp',dw_disp.GetItemDateTime(dw_disp.getRow(),'fecha_consecu'))
				st_parm.dw_obj.SetItem(fila,'objeto',dw_disp.GetItemString(dw_disp.getRow(),'objeto'))
				messageBox('Atención', 'Se agregó registro exitosamente')
			else
				montos = st_parm.dw_obj.getitemnumber(fila,'monto')
				st_parm.dw_obj.SetItem(fila,'monto',montos + dw_rubro.getItemNumber(i,'monto'))
				messageBox('Atención', 'Se modificó el monto existente')
			end if
			st_parm.dw_obj.TriggerEvent(rowfocuschanged!)
		end if
		
	next
end if
end event

type st_2 from statictext within w_choosedisp
boolean visible = false
integer x = 864
integer y = 8
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Periodo:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_choosedisp
integer x = 96
integer y = 8
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vigencia:"
boolean focusrectangle = false
end type

type dw_per from datawindow within w_choosedisp
boolean visible = false
integer x = 864
integer y = 64
integer width = 663
integer height = 76
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_perxvig"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.AcceptText()
w_principal.SetMicroHelp("Leyendo Registros")
timer(1)
dw_disp.Reset()
dw_rubro.Reset()
dw_disp.Retrieve(dw_vigen.GetItemNumber(1,'cod_vigencia'),this.GetItemNumber(1,'periodo'))
w_principal.setmicrohelp("Gestión Cliente Interno")

end event

type dw_vigen from datawindow within w_choosedisp
integer x = 96
integer y = 64
integer width = 672
integer height = 72
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigen"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_disp.Reset()
this.accepttext()
dw_disp.Retrieve(st_parm.coddoc,clugar,GetItemNumber(1,'cod_vigencia'),st_parm.filtro)

end event

type dw_rubro from datawindow within w_choosedisp
integer x = 87
integer y = 872
integer width = 4187
integer height = 616
integer taborder = 40
string title = "none"
string dataobject = "dw_pre_doc_cp_int"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_disp from datawindow within w_choosedisp
integer x = 78
integer y = 236
integer width = 4215
integer height = 504
integer taborder = 30
string title = "none"
string dataobject = "dw_histo_docs_sel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_rubro.Reset()
if rowCount() = 0 or currentrow = 0 then Return
dw_rubro.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
end event

event itemchanged;if dwo.name = 'selec' and row > 0 then
	long f,ld_monto
	f = find("selec=1",1,RowCount())
	if f > 0 and row = f then
		SetItem(f,'selec',0)
	else
		SetItem(row,'selec',1)
		SetItem(f,'selec',0)
	end if
	if dw_rubro.rowcount()>0 then
		ld_monto=st_parm.dw_cab.getitemnumber(st_parm.ld_row,'monto') / dw_rubro.rowcount()
		
		ld_monto=round(dec(ld_monto),i_dec_gral)
		if i_dec_gral=0 then
			ld_monto=long(ld_monto/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((ld_monto - long(ld_monto/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
		end if
	
		for f=1 to dw_rubro.rowcount()
			dw_rubro.setitem(f,'monto',ld_monto)	
		next
		accepttext()
	end if
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)

end event

type gb_1 from groupbox within w_choosedisp
integer x = 41
integer y = 164
integer width = 4293
integer height = 608
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Disponibilidades"
end type

type gb_2 from groupbox within w_choosedisp
integer x = 41
integer y = 804
integer width = 4288
integer height = 720
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rubros"
end type

