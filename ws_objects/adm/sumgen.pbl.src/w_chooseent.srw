$PBExportHeader$w_chooseent.srw
$PBExportComments$Escoger Orden de Compra
forward
global type w_chooseent from window
end type
type rb_o from radiobutton within w_chooseent
end type
type rb_e from radiobutton within w_chooseent
end type
type dw_almfuente from datawindow within w_chooseent
end type
type pb_2 from picturebutton within w_chooseent
end type
type gb_1 from groupbox within w_chooseent
end type
type gb_2 from groupbox within w_chooseent
end type
type gb_3 from groupbox within w_chooseent
end type
type pb_1 from picturebutton within w_chooseent
end type
type pb_o from picturebutton within w_chooseent
end type
type dw_ent from datawindow within w_chooseent
end type
type dw_entcpo from datawindow within w_chooseent
end type
type dw_o from datawindow within w_chooseent
end type
end forward

global type w_chooseent from window
integer width = 2871
integer height = 1540
boolean titlebar = true
string title = "Entradas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "contrato.ico"
boolean center = true
rb_o rb_o
rb_e rb_e
dw_almfuente dw_almfuente
pb_2 pb_2
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
pb_1 pb_1
pb_o pb_o
dw_ent dw_ent
dw_entcpo dw_entcpo
dw_o dw_o
end type
global w_chooseent w_chooseent

type variables
Datawindowchild dwc_almfuente
string codDocumento, codmodulo
st_interfaz st_parm

end variables

on w_chooseent.create
this.rb_o=create rb_o
this.rb_e=create rb_e
this.dw_almfuente=create dw_almfuente
this.pb_2=create pb_2
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.pb_1=create pb_1
this.pb_o=create pb_o
this.dw_ent=create dw_ent
this.dw_entcpo=create dw_entcpo
this.dw_o=create dw_o
this.Control[]={this.rb_o,&
this.rb_e,&
this.dw_almfuente,&
this.pb_2,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.pb_1,&
this.pb_o,&
this.dw_ent,&
this.dw_entcpo,&
this.dw_o}
end on

on w_chooseent.destroy
destroy(this.rb_o)
destroy(this.rb_e)
destroy(this.dw_almfuente)
destroy(this.pb_2)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.pb_1)
destroy(this.pb_o)
destroy(this.dw_ent)
destroy(this.dw_entcpo)
destroy(this.dw_o)
end on

event open;string varnul
long fila
codDocumento = 'OC'
st_parm = Message.PowerObjectParm

dw_entcpo.Modify("atendido_t.Text='Devuelto'")
dw_ent.SetTransObject(SQLCA)
dw_ent.SetFilter(st_parm.filtro)
dw_ent.Filter()

//dw_almfuente.GetChild('codalmacen', dwc_almfuente)
//dwc_almfuente.SetTransObject(SQLCA)
//if dwc_almfuente.Retrieve('%','%') = 0 then
//	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
//	dwc_almfuente.InsertRow(0)
//end if
//dw_almfuente.SetTransObject(SQLCA)
//dw_almfuente.InsertRow(0)
//setnull(varnul)
//dw_almfuente.SetItem(1,'codalmacen',varnul)
fila = st_parm.dw_cab.GetRow()
dw_ent.Retrieve(st_parm.dw_cab.GetItemNumber(fila,'ano'),st_parm.dw_cab.GetItemNumber(fila,'ncontrato'),st_parm.dw_cab.GetItemNumber(fila,'otrosi'))

fila = st_parm.dw_cab.GetRow()
dw_o.Retrieve(st_parm.dw_cab.GetItemNumber(fila,'ano'),st_parm.dw_cab.GetItemNumber(fila,'ncontrato'),st_parm.dw_cab.GetItemNumber(fila,'otrosi'))

end event

type rb_o from radiobutton within w_chooseent
boolean visible = false
integer x = 2304
integer y = 64
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Obra"
end type

event clicked;dw_ent.Visible = FALSE
dw_entcpo.Visible = FALSE
gb_1.Visible = FALSE
gb_2.Visible = FALSE
pb_1.Visible = FALSE

dw_o.Visible = TRUE
end event

type rb_e from radiobutton within w_chooseent
boolean visible = false
integer x = 1902
integer y = 64
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
boolean enabled = false
string text = "Entradas"
boolean checked = true
end type

event clicked;gb_1.Visible = TRUE
gb_2.Visible = TRUE
pb_1.Visible = TRUE
dw_ent.Visible = TRUE
dw_entcpo.Visible = TRUE

dw_o.Visible = FALSE
end event

type dw_almfuente from datawindow within w_chooseent
event retornar ( )
boolean visible = false
integer x = 87
integer y = 44
integer width = 1760
integer height = 72
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_ext_almacen"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_ent.Reset()
dw_entcpo.Reset()
string alm
int f
double an,nc,ot

f = st_parm.dw_cab.GetRow()
alm = dwc_almfuente.GetItemString(dwc_almfuente.GetRow(),'codalmacen')
an = st_parm.dw_cab.GetItemNumber(f,'ano')
nc = st_parm.dw_cab.GetItemNumber(f,'ncontrato')
ot = st_parm.dw_cab.GetItemNumber(f,'otrosi')
dw_ent.Retrieve(alm,an,nc,ot)

end event

type pb_2 from picturebutton within w_chooseent
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1239
integer y = 1324
integer width = 146
integer height = 128
integer taborder = 40
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

type gb_1 from groupbox within w_chooseent
integer x = 64
integer y = 36
integer width = 2738
integer height = 620
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entradas"
end type

type gb_2 from groupbox within w_chooseent
integer x = 64
integer y = 672
integer width = 2738
integer height = 636
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Items"
end type

type gb_3 from groupbox within w_chooseent
boolean visible = false
integer x = 1307
integer y = 32
integer width = 850
integer height = 136
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Ver"
end type

type pb_1 from picturebutton within w_chooseent
event mousemove pbm_mousemove
string tag = "Llevar &Orden de Compra"
integer x = 1390
integer y = 1324
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "               &O"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Llevar &Entradas seleccionadas"
end type

event clicked;string cd, cl,td,doc
long nd, fila, i, it
dec monto, valor
if dw_ent.Find("selec=1",1,dw_ent.RowCount()) = 0 then Return
SetPointer(HourGlass!)

dw_entcpo.SetRedraw(FALSE)
for i = 1 to dw_ent.RowCount()
	if dw_ent.GetItemNumber(i,'selec') = 1 then
		dw_ent.ScrolltoRow(i)
		dw_ent.TriggerEvent(RowFocuschanged!)
		valor = dec(dw_entcpo.Describe("Evaluate('sum(total)',0)"))
		monto = monto + valor
	end if
next
dw_entcpo.SetRedraw(TRUE)
if monto = 0 then 
	messageBox('Atención','El monto de las entradas es cero.')
	Return -1
end if
if monto < st_parm.dw_ter.GetItemNumber(st_parm.dw_ter.Getrow(),'monto') then
	if messageBox('Atención','El monto de las entradas es menor que el monto de la forma de pago. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return -1
end if
if monto > st_parm.dw_ter.GetItemNumber(st_parm.dw_ter.Getrow(),'monto') then
	if messageBox('Atención','El monto de las entradas es mayor que el monto de la forma de pago. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return -1
end if

cd = dw_ent.GetItemString(dw_ent.getRow(),'coddoc')
cl = dw_ent.GetItemString(dw_ent.getRow(),'cLugar')
nd = dw_ent.GetItemNumber(dw_ent.getRow(),'numdoc')
it = dw_entcpo.GetItemNumber(dw_entcpo.getRow(),'item')

fila = st_parm.dw_cab.GetRow()
for i = 1 to dw_entcpo.RowCount()
	dw_entcpo.SetItem(i,'ano',st_parm.dw_cab.GetItemNumber(fila,'ano'))
	dw_entcpo.SetItem(i,'ncontrato',st_parm.dw_cab.GetItemNumber(fila,'ncontrato'))
	dw_entcpo.SetItem(i,'otrosi',st_parm.dw_cab.GetItemNumber(fila,'otrosi'))
	dw_entcpo.SetItem(i,'item_fpago',st_parm.dw_ter.GetItemNumber(st_parm.dw_ter.GetRow(),'item'))
next
if dw_entcpo.Update() = -1 then
	MessageBox('Atención','Error actualizando relación Forma Pago / Entradas')
	Rollback;
	Return -1
end if
commit;
st_parm.dw_obj.Retrieve( dw_entcpo.GetItemNumber(dw_entcpo.GetRow(),'ano') ,dw_entcpo.GetItemNumber(dw_entcpo.GetRow(),'ncontrato'), dw_entcpo.GetItemNumber(dw_entcpo.GetRow(),'otrosi'),dw_entcpo.GetItemNumber(dw_entcpo.GetRow(),'item_fpago'))
dw_ent.TriggerEvent(rowfocuschanged!)
// Verifica si autoriza (dw_ter es dw_fpago)

//if st_parm.dw_ter.GetItemNumber(st_parm.dw_ter.Getrow(),'monto') <= double(st_parm.dw_obj.Describe("Evaluate('sum(valor)',0)")) then
	st_parm.dw_ter.SetItem(st_parm.dw_ter.Getrow(),'autorizado','1')
//end if

end event

type pb_o from picturebutton within w_chooseent
event mousemove pbm_mousemove
string tag = "Llevar &Orden de Compra"
integer x = 1381
integer y = 1324
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "               &O"
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Llevar &Orden de Compra"
end type

event clicked;
SetPointer(HourGlass!)
long fila
fila = st_parm.dw_cab.GetRow()
dw_o.SetItem(dw_o.GetRow(),'ano_autoriz',st_parm.dw_cab.GetItemNumber(fila,'ano'))
dw_o.SetItem(dw_o.GetRow(),'ncontrato_autoriz',st_parm.dw_cab.GetItemNumber(fila,'ncontrato'))
dw_o.SetItem(dw_o.GetRow(),'otrosi_autoriz',st_parm.dw_cab.GetItemNumber(fila,'otrosi'))
dw_o.SetItem(dw_o.GetRow(),'item_autoriz',st_parm.dw_ter.GetItemNumber(st_parm.dw_ter.GetRow(),'item'))
if dw_o.Update() = -1 then
	MessageBox('Atención','Error actualizando relación Forma Pago / Mano de Obra')
	Rollback;
	Return
end if
commit;
dw_o.Retrieve(dw_o.GetItemNumber(dw_o.GetRow(),'ano_autoriz'),dw_o.GetItemNumber(dw_o.GetRow(),'ncontrato_autoriz'),dw_o.GetItemNumber(dw_o.GetRow(),'otrosi_autoriz'))
// Verifica si autoriza - dw_ter es dw_fpago

//if st_parm.dw_ter.GetItemNumber(st_parm.dw_ter.Getrow(),'monto') <= double(st_parm.dw_obj.Describe("Evaluate('sum(valor)',0)")) then
	st_parm.dw_ter.SetItem(st_parm.dw_ter.Getrow(),'autorizado','1')
//end if

end event

type dw_ent from datawindow within w_chooseent
integer x = 101
integer y = 116
integer width = 2661
integer height = 496
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ent_fpago"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_entcpo.Reset()
if this.RowCount() = 0 or currentRow = 0 then Return
dw_entcpo.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))

end event

event clicked;if row = 0 then Return
if this.GetRow() <> row then
	this.SetRow(row)
end if
end event

type dw_entcpo from datawindow within w_chooseent
integer x = 110
integer y = 732
integer width = 2656
integer height = 544
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_entcpo_fpago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_o from datawindow within w_chooseent
boolean visible = false
integer x = 110
integer y = 236
integer width = 2565
integer height = 1000
integer taborder = 30
string title = "none"
string dataobject = "dw_contra_obra"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

