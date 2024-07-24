$PBExportHeader$w_choosectto.srw
forward
global type w_choosectto from window
end type
type rb_2 from radiobutton within w_choosectto
end type
type rb_1 from radiobutton within w_choosectto
end type
type st_1 from statictext within w_choosectto
end type
type pb_1 from picturebutton within w_choosectto
end type
type pb_2 from picturebutton within w_choosectto
end type
type dw_1 from datawindow within w_choosectto
end type
end forward

global type w_choosectto from window
integer width = 5074
integer height = 1328
boolean titlebar = true
string title = "Contratos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rb_2 rb_2
rb_1 rb_1
st_1 st_1
pb_1 pb_1
pb_2 pb_2
dw_1 dw_1
end type
global w_choosectto w_choosectto

type variables
st_interfaz st_p


end variables

on w_choosectto.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_1=create st_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_1=create dw_1
this.Control[]={this.rb_2,&
this.rb_1,&
this.st_1,&
this.pb_1,&
this.pb_2,&
this.dw_1}
end on

on w_choosectto.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_1)
end on

event open;st_p = Message.PowerObjectParm
if st_p.coddoc = 'SCT' then
	rb_1.checked = TRUE
elseif st_p.coddoc = 'NC' then
	rb_2.checked = TRUE
end if

dw_1.SetFilter(st_p.filtro)
dw_1.Retrieve(st_p.coddoc,year(today()) -2 ,year(today()))

end event

type rb_2 from radiobutton within w_choosectto
integer x = 987
integer y = 44
integer width = 681
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prestación de Servicios"
boolean automatic = false
end type

event clicked;if checked then Return
rb_1.checked = FALSE
checked = TRUE
dw_1.Retrieve('NC',year(today())-2, year(today()))

end event

type rb_1 from radiobutton within w_choosectto
integer x = 535
integer y = 44
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Suministros"
boolean automatic = false
end type

event clicked;if checked then Return
rb_2.checked = FALSE
checked = TRUE
dw_1.Retrieve('SCT',year(today())-2, year(today()))

end event

type st_1 from statictext within w_choosectto
integer x = 59
integer y = 44
integer width = 416
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contratos de :"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_choosectto
event mousemove pbm_mousemove
string tag = "Llevar &Orden de Compra"
integer x = 2107
integer y = 1088
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = right!
string powertiptext = "Llevar &Orden de Compra"
end type

event clicked;string td, doc, valor,objeto
long an,nc,ot, fila, i, j
decimal monto

if dw_1.RowCount() = 0 then Return
SetPointer(HourGlass!)
an = dw_1.GetItemNumber(dw_1.GetRow(),'ano')
nc = dw_1.GetItemNumber(dw_1.GetRow(),'ncontrato')
ot = dw_1.GetItemNumber(dw_1.GetRow(),'otrosi')
td = dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
doc = dw_1.GetItemString(dw_1.GetRow(),'documento')

if st_p.codmod = 'PDISCTPR' or st_p.codmod = 'PDINCPR' then
	fila = st_p.dw_obj.Find("num_orig1=" + string(an) + " and num_orig2=" + string(nc) + " and num_orig3=" + string(ot),1,st_p.dw_obj.RowCount())
	if fila = 0 then
		st_p.dw_obj.InsertRow(1)
		st_p.dw_obj.SetItem(1,'codigo',st_p.codmod)
		st_p.dw_obj.SetItem(1,'char_doc1',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'coddoc'))
		st_p.dw_obj.SetItem(1,'char_doc2',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'clugar'))
		st_p.dw_obj.SetItem(1,'num_doc1',st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'numdoc'))
		st_p.dw_obj.SetItem(1,'num_orig1',dw_1.GetItemNumber(dw_1.GetRow(),'ano'))
		st_p.dw_obj.SetItem(1,'num_orig2',dw_1.GetItemNumber(dw_1.GetRow(),'ncontrato'))
		st_p.dw_obj.SetItem(1,'num_orig3',dw_1.GetItemNumber(dw_1.GetRow(),'otrosi'))
		st_p.dw_obj.SetItem(1,'valor',dw_1.GetItemNumber(dw_1.GetRow(),'monto'))
	end if
	fila = st_p.dw_ter.Find("tipodoc='" + td + "' and documento='" + doc+ "'",1,st_p.dw_ter.RowCount())
	if fila = 0 then
		st_p.dw_ter.InsertRow(1)
		st_p.dw_ter.SetItem(1,'tipodoc',dw_1.GetItemString(dw_1.GetRow(),'tipodoc'))
		st_p.dw_ter.SetItem(1,'documento',dw_1.GetItemString(dw_1.GetRow(),'documento'))
		st_p.dw_ter.SetItem(1,'persona',dw_1.GetItemString(dw_1.GetRow(),'persona'))
		st_p.dw_ter.SetItem(1,'nombre1',dw_1.GetItemString(dw_1.GetRow(),'nombre1'))
		st_p.dw_ter.SetItem(1,'nombre2',dw_1.GetItemString(dw_1.GetRow(),'nombre2'))
		st_p.dw_ter.SetItem(1,'apellido1',dw_1.GetItemString(dw_1.GetRow(),'apellido1'))
		st_p.dw_ter.SetItem(1,'apellido2',dw_1.GetItemString(dw_1.GetRow(),'apellido2'))
		st_p.dw_ter.SetItem(1,'razon_social',dw_1.GetItemString(dw_1.GetRow(),'razon_social'))
		st_p.dw_ter.SetItem(1,'monto',dw_1.GetItemNumber(dw_1.GetRow(),'monto'))
		st_p.dw_ter.SetItem(1,'monto_org',dw_1.GetItemNumber(dw_1.GetRow(),'monto'))
	end if

elseif st_p.codmod = 'PRSCTPT' or st_p.codmod = 'PRSCTRFC' or st_p.codmod = 'PRNCPT' or st_p.codmod = 'PRNCRFC' then
	decimal montos=0

	fila = st_p.dw_it.Find("num_orig1=" + string(an) + " and num_orig2=" + string(nc) + " and num_orig3=" + string(ot),1,st_p.dw_it.RowCount())
	if fila = 0 then		
		uo_datastore dw_cp
		dw_cp = create uo_datastore
		dw_cp.DataObject = 'dw_contra_ppto'
		dw_cp.SetTransObject(SQLCA)
		if dw_cp.retrieve(dw_1.GetItemNumber(dw_1.GetRow(),'ano'),dw_1.GetItemNumber(dw_1.GetRow(),'ncontrato'),dw_1.GetItemNumber(dw_1.GetRow(),'otrosi')) > 0 then
			for i = 1 to dw_cp.RowCount()
				if dw_cp.getItemNumber(i,'monto') <= dw_cp.getItemNumber(i,'monto_utilizado') then CONTINUE
				valor = st_p.dw_obj.Describe("Evaluate('max(item)',0)")
				if valor='' then valor='0'
				fila = st_p.dw_obj.InsertRow(0)
				st_p.dw_obj.SetItem(fila,'coddoc',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'coddoc'))
				st_p.dw_obj.SetItem(fila,'cLugar',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'cLugar'))
				st_p.dw_obj.SetItem(fila,'numdoc',st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'numdoc'))
				st_p.dw_obj.SetItem(fila,'item',long(valor) + 1)
				st_p.dw_obj.SetItem(fila,'coddoc_orig',dw_cp.GetItemString(i,'coddoc_dispo'))
				st_p.dw_obj.SetItem(fila,'cLugar_orig',dw_cp.GetItemString(i,'cLugar_dispo'))
				st_p.dw_obj.SetItem(fila,'numdoc_orig',dw_cp.GetItemNumber(i,'numdoc_dispo'))
				st_p.dw_obj.SetItem(fila,'item_orig',dw_cp.GetItemNumber(i,'item_dispo'))
				st_p.dw_obj.SetItem(fila,'cod_vigencia',dw_cp.GetItemNumber(i,'cod_vigencia'))
				st_p.dw_obj.SetItem(fila,'codtotal',dw_cp.GetItemString(i,'codtotal_dispo'))
				st_p.dw_obj.SetItem(fila,'estado','0')
				st_p.dw_obj.SetItem(fila,'descrip',dw_cp.GetItemString(i,'descrip_dispo'))
//		OV		
//				st_p.dw_obj.SetItem(fila,'monto',dw_cp.GetItemNumber(i,'monto'))
//				st_p.dw_obj.SetItem(fila,'monto_vigente',dw_cp.GetItemNumber(i,'monto'))
//				st_p.dw_obj.SetItem(fila,'monto_vigente_orig',dw_cp.GetItemNumber(i,'monto_vigente_dispo'))
//				st_p.dw_obj.SetItem(fila,'monto_utilizado_orig',dw_cp.GetItemNumber(i,'monto_utilizado_dispo'))
				
				//if ot=0 or ot=100 or ot=1000 then 
					//st_p.dw_obj.SetItem(fila,'monto',dw_cp.GetItemNumber(i,'monto'))
					//st_p.dw_obj.SetItem(fila,'monto_vigente',dw_cp.GetItemNumber(i,'monto'))
					//montos+=dw_cp.GetItemNumber(i,'monto')
				//else
					montos += dw_cp.GetItemNumber(i,'monto') - dw_cp.GetItemNumber(i,'monto_utilizado_dispo')
					st_p.dw_obj.SetItem(fila,'monto', dw_cp.GetItemNumber(i,'monto') - dw_cp.GetItemNumber(i,'monto_utilizado_dispo'))					
					st_p.dw_obj.SetItem(fila,'monto_vigente', dw_cp.GetItemNumber(i,'monto') - dw_cp.GetItemNumber(i,'monto_utilizado_dispo'))	
					st_p.dw_obj.SetItem(fila,'monto_vigente_orig',dw_cp.GetItemNumber(i,'monto_vigente_dispo'))
					st_p.dw_obj.SetItem(fila,'monto_utilizado_orig',dw_cp.GetItemNumber(i,'monto_utilizado_dispo'))
			//	end if
			next
		else
			MessageBox('Atención','El contrato no tiene asociadas disponibilidades')
			Return -1
		end if
		objeto = st_p.dw_cab.getitemstring(1,'objeto')
		if isnull(objeto) then objeto=''
		if not isnull(dw_1.getitemstring(dw_1.getrow(),'objeto')) then 
			if objeto<>'' then objeto+='~r~n'
			objeto+=dw_1.getitemstring(dw_1.getrow(),'objeto')
		end if
		st_p.dw_cab.setitem(1,'objeto',objeto)
		st_p.dw_it.InsertRow(1)
		st_p.dw_it.SetItem(1,'codigo',st_p.codmod)
		st_p.dw_it.SetItem(1,'char_doc1',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'coddoc'))
		st_p.dw_it.SetItem(1,'char_doc2',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'clugar'))
		st_p.dw_it.SetItem(1,'num_doc1',st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'numdoc'))
		
		st_p.dw_it.SetItem(1,'num_orig1', dw_1.GetItemNumber(dw_1.GetRow(),'ano'))
		st_p.dw_it.SetItem(1,'num_orig2', dw_1.GetItemNumber(dw_1.GetRow(),'ncontrato'))
		st_p.dw_it.SetItem(1,'num_orig3', dw_1.GetItemNumber(dw_1.GetRow(),'otrosi'))
		st_p.dw_it.SetItem(1,'valor',montos)
		st_p.dw_ter.InsertRow(1)
		st_p.dw_ter.SetItem(1,'coddoc', st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'coddoc'))
		st_p.dw_ter.SetItem(1,'clugar', st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'clugar'))
		st_p.dw_ter.SetItem(1,'numdoc', st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'numdoc'))
		st_p.dw_ter.SetItem(1,'tipodoc', dw_1.GetItemString(dw_1.GetRow(),'tipodoc'))
		st_p.dw_ter.SetItem(1,'documento', dw_1.GetItemString(dw_1.GetRow(),'documento'))
		st_p.dw_ter.SetItem(1,'nombre1', dw_1.GetItemString(dw_1.GetRow(),'nombre1'))
		st_p.dw_ter.SetItem(1,'nombre2', dw_1.GetItemString(dw_1.GetRow(),'nombre2'))
		st_p.dw_ter.SetItem(1,'apellido1', dw_1.GetItemString(dw_1.GetRow(),'apellido1'))
		st_p.dw_ter.SetItem(1,'apellido2', dw_1.GetItemString(dw_1.GetRow(),'apellido2'))
		st_p.dw_ter.SetItem(1,'razon_social', dw_1.GetItemString(dw_1.GetRow(),'razon_social'))
		st_p.dw_ter.SetItem(1,'monto',montos)
		st_p.dw_ter.SetItem(1,'monto_org',dw_1.GetItemNumber(dw_1.GetRow(),'monto'))		
	end if
end if

end event

type pb_2 from picturebutton within w_choosectto
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 2263
integer y = 1088
integer width = 146
integer height = 128
integer taborder = 20
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

type dw_1 from datawindow within w_choosectto
integer x = 55
integer y = 132
integer width = 4955
integer height = 928
integer taborder = 10
string title = "none"
string dataobject = "dw_concabgrid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rbuttondown;st_dw_xa_funciones st_dwx
st_dwx.dw=this
st_dwx.dwo=dwo
st_dwx.row=row
st_dwx.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dwx)
end event

