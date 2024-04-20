$PBExportHeader$w_lleva_nom_reser.srw
forward
global type w_lleva_nom_reser from window
end type
type pb_cancel from picturebutton within w_lleva_nom_reser
end type
type pb_ok from picturebutton within w_lleva_nom_reser
end type
type st_2 from statictext within w_lleva_nom_reser
end type
type dw_1 from datawindow within w_lleva_nom_reser
end type
type st_1 from statictext within w_lleva_nom_reser
end type
type dw_disp from datawindow within w_lleva_nom_reser
end type
end forward

global type w_lleva_nom_reser from window
integer width = 3607
integer height = 1868
boolean titlebar = true
string title = "Reservas desde Nómina"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
st_2 st_2
dw_1 dw_1
st_1 st_1
dw_disp dw_disp
end type
global w_lleva_nom_reser w_lleva_nom_reser

type variables
st_interfaz st_p

end variables

on w_lleva_nom_reser.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_2=create st_2
this.dw_1=create dw_1
this.st_1=create st_1
this.dw_disp=create dw_disp
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.st_2,&
this.dw_1,&
this.st_1,&
this.dw_disp}
end on

on w_lleva_nom_reser.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.dw_disp)
end on

event open;st_p = Message.PowerObjectParm
dw_disp.retrieve()
end event

type pb_cancel from picturebutton within w_lleva_nom_reser
integer x = 2752
integer y = 204
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_lleva_nom_reser
integer x = 2752
integer y = 68
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_disp.rowcount()=0 or dw_1.rowcount()=0 then return
do while st_p.dw_it.RowCount() > 0
	st_p.dw_it.DeleteRow(1)
loop
do while st_p.dw_obj.RowCount() > 0
	st_p.dw_obj.DeleteRow(1)
loop
do while st_p.dw_ter.RowCount() > 0
	st_p.dw_ter.deleterow(1)
loop
long i,rub,f,donde,donde_ter
string valor, td, doc

for i = 1 to dw_1.RowCount()
	if dw_1.GetItemNumber(i,'fila') =1 and dw_1.GetItemNumber(i,'compute_4') > 0 then 
		valor = st_p.dw_obj.Describe("Evaluate('max(item)',0)")
		rub = st_p.dw_obj.InsertRow(0)
		st_p.dw_obj.SetItem(rub,'coddoc',st_p.dw_cab.GetItemString(1,'coddoc'))
		st_p.dw_obj.SetItem(rub,'clugar',st_p.dw_cab.GetItemString(1,'clugar'))
		st_p.dw_obj.SetItem(rub,'numdoc',st_p.dw_cab.GetItemNumber(1,'numdoc'))
		st_p.dw_obj.SetItem(rub,'item',long(valor) + 1)
		st_p.dw_obj.SetItem(rub,'cod_vigencia',dw_1.GetItemNumber(i,'cod_vigencia'))
		st_p.dw_obj.SetItem(rub,'codtotal',dw_1.GetItemString(i,'codtotal'))
		st_p.dw_obj.SetItem(rub,'coddoc_orig',dw_1.GetItemString(i,'coddoc'))
		st_p.dw_obj.SetItem(rub,'clugar_orig',dw_1.GetItemString(i,'clugar'))
		st_p.dw_obj.SetItem(rub,'numdoc_orig',dw_1.GetItemNumber(i,'numdoc'))
		st_p.dw_obj.SetItem(rub,'item_orig',dw_1.GetItemNumber(i,'item'))
		st_p.dw_obj.SetItem(rub,'descrip',dw_1.GetItemString(i,'descrip'))
		st_p.dw_obj.SetItem(rub,'estado_cb','0')
		st_p.dw_obj.SetItem(rub,'monto',round(dw_1.GetItemNumber(i,'compute_4'),2))
		st_p.dw_obj.SetItem(rub,'monto_vigente',round(dw_1.GetItemNumber(i,'compute_4'),2))
		st_p.dw_obj.SetItem(rub,'monto_vigente_orig',round(dw_1.GetItemNumber(i,'monto_vigente'),2))
		st_p.dw_obj.SetItem(rub,'monto_utilizado_orig',round(dw_1.GetItemNumber(i,'monto_utilizado'),2))
	end if
	
	if dw_1.getitemnumber(i,'selec') = 0 then continue
	td = dw_1.getitemstring(i,'tipodoc')
	doc = dw_1.getitemstring(i,'documento')
	if not isNull(doc) then
		
		donde = st_p.dw_ter.find("tipodoc='"+td+"' and documento='"+doc+"'",1,st_p.dw_ter.rowcount())
		if donde=0 then
			donde=st_p.dw_ter.insertrow(0)
			st_p.dw_ter.setitem(donde,'tipodoc',td)
			st_p.dw_ter.setitem(donde,'documento',doc)
			st_p.dw_ter.setitem(donde,'coddoc','PR')
			st_p.dw_ter.setitem(donde,'clugar',clugar)
			if not(isNull(doc)) and doc <> '' then
				st_p.dw_ter.setitem(donde,'nomina','2')
			end if
		end if
		st_p.dw_ter.setitem(donde,'monto',st_p.dw_ter.getitemnumber(donde,'monto')+round(dw_1.getitemnumber(i,'valor'),2))
	end if
		f = st_p.dw_it.InsertRow(0)
		st_p.dw_it.SetItem(f,'codigo',st_p.codmod)
		st_p.dw_it.SetItem(f,'num_orig1',dw_disp.GetItemNumber(dw_disp.getrow(),'num_orig1'))//numnomina
		st_p.dw_it.SetItem(f,'char_orig1',dw_1.getitemstring(i,'tipodoc'))//tdoc
		st_p.dw_it.SetItem(f,'char_orig2',dw_1.getitemstring(i,'documento'))//docu
		st_p.dw_it.SetItem(f,'char_orig3',dw_1.getitemstring(i,'cod_concep'))//concep
		st_p.dw_it.SetItem(f,'char_doc1',st_p.dw_cab.GetItemString(1,'coddoc'))
		st_p.dw_it.SetItem(f,'char_doc2',st_p.dw_cab.GetItemString(1,'clugar'))
		st_p.dw_it.SetItem(f,'num_doc1',st_p.dw_cab.GetItemNumber(1,'numdoc'))
		st_p.dw_it.SetItem(f,'char_doc3',dw_1.getitemstring(i,'tipo_cargo'))//tipocargo
		st_p.dw_it.SetItem(f,'char_doc4',dw_1.getitemstring(i,'char_doc4'))//nombramiento	
		st_p.dw_it.SetItem(f,'num_doc2',long(valor) + 1)
		st_p.dw_it.SetItem(f,'valor',st_p.dw_it.getitemnumber(f,'valor')+round(dw_1.getitemnumber(i,'valor'),2))
	
next

w_new_reser.f_cambio()
close(parent)

end event

type st_2 from statictext within w_lleva_nom_reser
integer x = 64
integer y = 480
integer width = 183
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rubros"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_lleva_nom_reser
integer x = 64
integer y = 540
integer width = 3438
integer height = 1188
integer taborder = 20
string title = "none"
string dataobject = "dw_dispo_nom"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event clicked;//
//if dwo.Name = 'selec_t' then
//	int i
//	if GetItemNumber(getRow(),'selec') = 0 then
//		i = GetRow()
//		do 
//			SetItem(i,'selec',1)
//			i = i + 1
//		loop until GetItemNumber(i,'fila') = 1
//	else
//		i = GetRow()
//		do 
//			SetItem(i,'selec',0)
//			i = i + 1
//		loop until GetItemNumber(i,'fila') = 1
//	end if
//	Return
//end if
//
end event

event buttonclicked;SetRow(row)
int i
if GetItemNumber(getRow(),'selec') = 0 then
	i = GetRow()
	do 
		SetItem(i,'selec',1)
		i = i + 1
	loop until GetItemNumber(i,'fila') = 1 or i > RowCount()
else
	i = GetRow()
	do 
		SetItem(i,'selec',0)
		i = i + 1
	loop until GetItemNumber(i,'fila') = 1 or i> RowCount()
end if

end event

type st_1 from statictext within w_lleva_nom_reser
integer x = 59
integer width = 457
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Disponibilidades:"
boolean focusrectangle = false
end type

type dw_disp from datawindow within w_lleva_nom_reser
integer x = 59
integer y = 60
integer width = 2679
integer height = 408
integer taborder = 10
string title = "none"
string dataobject = "dw_disponom_a_reser"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_1.reset()
if getrow()<1 then return

dw_1.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'numdoc'))
end event

event constructor;settransobject(sqlca)
end event

event rowfocuschanging;if dw_1.ModifiedCount() > 0 then
	if messageBox('Atención','Ha seleccionado o deseleccionado filas. Si continua con el cambio de Disponibilidad, perderá los cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return -1
end if

end event

