$PBExportHeader$w_mod_recon.srw
forward
global type w_mod_recon from window
end type
type dw_movi from datawindow within w_mod_recon
end type
type st_2 from statictext within w_mod_recon
end type
type dw_cab from datawindow within w_mod_recon
end type
type dw_cpo from datawindow within w_mod_recon
end type
type pb_grabar from picturebutton within w_mod_recon
end type
type pb_cancel from picturebutton within w_mod_recon
end type
type dw_1 from datawindow within w_mod_recon
end type
type st_1 from statictext within w_mod_recon
end type
end forward

global type w_mod_recon from window
integer width = 2917
integer height = 1448
boolean titlebar = true
string title = "Modificación Reconocimientos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_movi dw_movi
st_2 st_2
dw_cab dw_cab
dw_cpo dw_cpo
pb_grabar pb_grabar
pb_cancel pb_cancel
dw_1 dw_1
st_1 st_1
end type
global w_mod_recon w_mod_recon

type variables
st_ppto st_p
datawindowchild dwc_per
end variables

on w_mod_recon.create
this.dw_movi=create dw_movi
this.st_2=create st_2
this.dw_cab=create dw_cab
this.dw_cpo=create dw_cpo
this.pb_grabar=create pb_grabar
this.pb_cancel=create pb_cancel
this.dw_1=create dw_1
this.st_1=create st_1
this.Control[]={this.dw_movi,&
this.st_2,&
this.dw_cab,&
this.dw_cpo,&
this.pb_grabar,&
this.pb_cancel,&
this.dw_1,&
this.st_1}
end on

on w_mod_recon.destroy
destroy(this.dw_movi)
destroy(this.st_2)
destroy(this.dw_cab)
destroy(this.dw_cpo)
destroy(this.pb_grabar)
destroy(this.pb_cancel)
destroy(this.dw_1)
destroy(this.st_1)
end on

event open;st_p = message.PowerObjectParm
long i, f
date ld_termina

dw_cpo.GetChild('periodo',dwc_per)
dwc_per.SetTransObject(SQLCA)
if dwc_per.Retrieve(st_p.cod_vigencia) = 0 then
	messagebox('Error','No existen periodos para la vigencia seleccionada')
	dwc_per.insertRow(0)
end if
select termina into :ld_termina  from pre_vigencia where cod_vigencia = :st_p.cod_vigencia;
if today()>=ld_termina  then
	st_p.periodo = month(ld_termina)
else
	st_p.periodo = month(today())
end if


for i = 1 to st_p.dw_src.RowCount()
	dw_1.Retrieve(st_p.dw_src.GetItemNumber(i,'num_orig1'))
next
string vig,ctotal

for i = 1 to dw_1.RowCount()
	vig = string(dw_1.GetItemNumber(i,'cod_vigencia_recon'))
	ctotal = dw_1.GetItemString(i,'cod_total_recon')
	f = st_p.dw_obj.find("cod_vigencia="+vig+" and codtotal='"+ctotal+"'",1,st_p.dw_obj.RowCount())
	if f > 0 then
		dw_1.SetItem(i,'vr_recon',st_p.dw_obj.GetItemNumber(f,'monto_vigente'))
	end if
next

end event

type dw_movi from datawindow within w_mod_recon
boolean visible = false
integer x = 2144
integer y = 1160
integer width = 695
integer height = 160
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_plan_mov_det"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;Rollback;
Return 0

end event

type st_2 from statictext within w_mod_recon
integer x = 41
integer y = 12
integer width = 887
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Glosas Relacionadas"
boolean focusrectangle = false
end type

type dw_cab from datawindow within w_mod_recon
boolean visible = false
integer x = 114
integer y = 1000
integer width = 814
integer height = 252
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_histo_docs_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;Rollback;
Return 0

end event

type dw_cpo from datawindow within w_mod_recon
boolean visible = false
integer x = 96
integer y = 1096
integer width = 695
integer height = 256
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_pre_doc_cp_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;Rollback;
Return 0

end event

type pb_grabar from picturebutton within w_mod_recon
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1349
integer y = 1212
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Modificar rubros seleccionados"
end type

event clicked;long i, f, fila, item, periodo
string vig, ctotal, valor

dw_cab.Reset()
dw_cpo.Reset()
dw_movi.Reset()

if dw_1.Find("selec=1",1,dw_1.RowCount()) = 0 then
	MessageBox('Atención','Debe seleccionar los rubros a modificar')
	Return 0
end if

if messageBox('Atención','Está seguro de modificar el reconocimiento?. No podrá deshacer los cambios',QUESTION!,YESNO!,2) = 2 then Return 0

for i = 1 to dw_1.RowCount()
	if dw_1.GetItemNumber(i,'selec') = 0 then Continue
	vig = string(dw_1.GetItemNumber(i,'cod_vigencia_recon'))
	ctotal = dw_1.GetItemString(i,'cod_total_recon')
	if dw_1.GetItemNumber(i,'valor_aceptado') = 0 then
		dw_1.SetItem(i,'selec',0)
		Continue
	end if
	f = st_p.dw_obj.find("cod_vigencia="+vig+" and codtotal='"+ctotal+"'",1,st_p.dw_obj.RowCount())
	if f > 0 then
		if st_p.dw_obj.GetItemNumber(f,'monto_vigente') - dw_1.GetItemNumber(i,'valor_aceptado') < 0 then
			messageBox('Atención','Resultaría un monto vigente negativo. Cuenta '+ctotal)
			Return -1
		elseif st_p.dw_obj.GetItemNumber(f,'monto_vigente') - dw_1.GetItemNumber(i,'valor_aceptado') < st_p.dw_obj.GetItemNumber(f,'monto_utilizado') then
			messageBox('Atención','El monto utilizado (Recaudado) resultaría mayor que el monto vigente reconocido. Cuenta '+ctotal)
			Return -1
		end if		
	else
		dw_1.ScrolltoRow(i)
		MessageBox('Atención','No se encuentra la cuenta '+ctotal)
		dw_1.SetItem(i,'selec',0)
	end if
next

double numdoc
string err

numdoc = f_trae_ndoc('PMR',clugar,'Modificación Reconocimiento')
if numdoc = -1 then return -1

dw_cab.InsertRow(1)
dw_cab.SetItem(1,'coddoc',st_p.coddoc)
dw_cab.SetItem(1,'cLugar',cLugar)
dw_cab.SetItem(1,'numdoc',numdoc)
dw_cab.SetItem(1,'cod_vigencia',st_p.cod_vigencia)
dw_cab.SetItem(1,'periodo',st_p.periodo)
dw_cab.SetItem(1,'fecha',datetime(today(),time(0)))
dw_cab.SetItem(1,'estado','0')

for i = 1 to dw_1.RowCount()
	if dw_1.GetItemNumber(i,'selec') = 0 then Continue
	valor = dw_cpo.Describe("Evaluate('max(item)',0)")
	vig = string(dw_1.GetItemNumber(i,'cod_vigencia_recon'))
	ctotal = dw_1.GetItemString(i,'cod_total_recon')
	f = st_p.dw_obj.find("cod_vigencia="+vig+" and codtotal='"+ctotal+"'",1,st_p.dw_obj.RowCount())
	fila = dw_cpo.InsertRow(0)
	dw_cpo.SetItem(fila,'coddoc',dw_cab.GetItemString(1,'coddoc'))
	dw_cpo.SetItem(fila,'cLugar',dw_cab.GetItemString(1,'clugar'))
	dw_cpo.SetItem(fila,'numdoc',dw_cab.GetItemNumber(1,'numdoc'))
	dw_cpo.SetItem(fila,'item',long(valor) + 1)
	dw_cpo.SetItem(fila,'cod_vigencia',st_p.dw_obj.GetItemNumber(f,'cod_vigencia'))
	dw_cpo.SetItem(fila,'periodo',month(today()))
	dw_cpo.SetItem(fila,'codtotal',st_p.dw_obj.GetItemString(f,'codtotal'))
	dw_cpo.SetItem(fila,'descrip',st_p.dw_obj.GetItemString(f,'descrip'))
	dw_cpo.SetItem(fila,'coddoc_orig',st_p.dw_obj.GetItemString(f,'coddoc'))
	dw_cpo.SetItem(fila,'cLugar_orig',st_p.dw_obj.GetItemString(f,'cLugar'))
	dw_cpo.SetItem(fila,'numdoc_orig',st_p.dw_obj.GetItemNumber(f,'numdoc'))
	dw_cpo.SetItem(fila,'item_orig',st_p.dw_obj.GetItemNumber(f,'item'))
	dw_cpo.SetItem(fila,'monto_vigente_orig',st_p.dw_obj.GetItemNumber(f,'monto_vigente')) 
	dw_cpo.SetItem(fila,'monto_utilizado_orig',st_p.dw_obj.GetItemNumber(f,'monto_utilizado')) 
	dw_cpo.SetItem(fila,'monto',st_p.dw_obj.GetItemNumber(f,'monto_vigente') - dw_1.GetItemNumber(f,'valor_aceptado'))
	dw_cpo.SetItem(fila,'monto_vigente',-1 * dw_1.GetItemNumber(f,'valor_aceptado'))
	
	st_p.dw_obj.SetItem(f,'monto_vigente',st_p.dw_obj.GetItemNumber(f,'monto_vigente') - dw_1.GetItemNumber(f,'valor_aceptado'))

next

if dw_cab.update() = -1 then
	Rollback;
	Return -1
end if

if dw_cpo.update()= -1 then
	Rollback;
	Return -1
end if

if st_p.dw_obj.update()= -1 then
	Rollback;
	Return -1
end if

for i = 1 to dw_cpo.RowCount()
	fila = dw_movi.insertRow(0)
	ctotal = dw_cpo.GetItemString(i,'codtotal')
	periodo = dw_cpo.GetItemNumber(i,'periodo')
	dw_movi.setitem(fila,'cod_vigencia',st_p.cod_vigencia)
	dw_movi.setitem(fila,'codtotal',ctotal)
	dw_movi.setitem(fila,'periodo',dw_cpo.GetItemNumber(i,'periodo'))
	dw_movi.setitem(fila,'fecha',datetime(today(),now()))
	dw_movi.setitem(fila,'coddoc',dw_cpo.GetItemString(i,'coddoc'))
	dw_movi.setitem(fila,'clugar',dw_cpo.getitemString(i,'clugar'))
	dw_movi.setitem(fila,'numdoc',dw_cpo.getitemNumber(i,'numdoc'))
	dw_movi.setitem(fila,'item',dw_cpo.getItemNumber(i,'item'))
	dw_movi.setitem(fila,'monto_mod_recon',dw_cpo.getItemNumber(i,'monto_vigente'))
	
	SELECT Max(pre_plan_movi_deta.num_movi) into :item
	FROM pre_plan_movi_deta
	WHERE pre_plan_movi_deta.cod_vigencia=:st_p.cod_vigencia AND pre_plan_movi_deta.CodTotal=:ctotal
	AND pre_plan_movi_deta.periodo=:periodo;
	if SQLCA.SQLcode=-1 then
		err = SQLCA.SQLerrtext
		rollback;
		messagebox('Error leyendo pre_plan_movi_deta',err)
		return -1
	end if
	if isnull(item) then item=0 
	item++
	dw_movi.setitem(fila,'num_movi',item) 
	if dw_movi.Update() = -1 then 
		Rollback;
		return -1
	end if
next

close(parent)

end event

type pb_cancel from picturebutton within w_mod_recon
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1202
integer y = 1212
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
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

type dw_1 from datawindow within w_mod_recon
integer x = 37
integer y = 80
integer width = 2738
integer height = 1108
integer taborder = 10
string title = "none"
string dataobject = "dw_mod_recon_glosa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event retrievestart;Return 2

end event

event buttonclicked;int i
if describe("b_1.text") = 'Selec.' then
	for i = 1 to rowCount()
		if GetItemNumber(i,'valor_aceptado') > 0 then
			SetItem(i,'selec',1)
		end if
	next
	Modify("b_1.Text='Desel.'")
else
	for i = 1 to rowCount()
		SetItem(i,'selec',0)
	next
	Modify("b_1.Text='Selec.'")
end if

end event

type st_1 from statictext within w_mod_recon
integer x = 1637
integer y = 1200
integer width = 1134
integer height = 164
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "El reconocimiento puede modificarse por el valor aceptado en las glosas asociadas a las facturas del cobro y radicación relacionados en la interfaz"
boolean focusrectangle = false
end type

