$PBExportHeader$w_llamadas.srw
forward
global type w_llamadas from window
end type
type mc_1 from monthcalendar within w_llamadas
end type
type pb_cerrar from picturebutton within w_llamadas
end type
type rte_4 from richtextedit within w_llamadas
end type
type st_2 from statictext within w_llamadas
end type
type st_1 from statictext within w_llamadas
end type
type ddlb_2 from dropdownlistbox within w_llamadas
end type
type ddlb_1 from dropdownlistbox within w_llamadas
end type
type st_3 from statictext within w_llamadas
end type
type sle_a from singlelineedit within w_llamadas
end type
type gb_2 from groupbox within w_llamadas
end type
type t1 from tab within w_llamadas
end type
type p2 from userobject within t1
end type
type rte_2 from richtextedit within p2
end type
type p2 from userobject within t1
rte_2 rte_2
end type
type p3 from userobject within t1
end type
type rte_3 from richtextedit within p3
end type
type p3 from userobject within t1
rte_3 rte_3
end type
type p1 from userobject within t1
end type
type rte_1 from richtextedit within p1
end type
type p1 from userobject within t1
rte_1 rte_1
end type
type t1 from tab within w_llamadas
p2 p2
p3 p3
p1 p1
end type
type pb_5 from picturebutton within w_llamadas
end type
type pb_4 from picturebutton within w_llamadas
end type
type pb_3 from picturebutton within w_llamadas
end type
type pb_2 from picturebutton within w_llamadas
end type
type pb_1 from picturebutton within w_llamadas
end type
type st_4 from statictext within w_llamadas
end type
type dw_1 from datawindow within w_llamadas
end type
type gb_1 from groupbox within w_llamadas
end type
type sle_p from singlelineedit within w_llamadas
end type
end forward

global type w_llamadas from window
integer width = 4795
integer height = 2168
boolean titlebar = true
string title = "Llamadas a Pacientes - Citas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "llamadas_con.ico"
boolean center = true
mc_1 mc_1
pb_cerrar pb_cerrar
rte_4 rte_4
st_2 st_2
st_1 st_1
ddlb_2 ddlb_2
ddlb_1 ddlb_1
st_3 st_3
sle_a sle_a
gb_2 gb_2
t1 t1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_4 st_4
dw_1 dw_1
gb_1 gb_1
sle_p sle_p
end type
global w_llamadas w_llamadas

type variables
boolean cambio, i_cambio_rte=false
st_notas st_cl
date l_fec
end variables

on w_llamadas.create
this.mc_1=create mc_1
this.pb_cerrar=create pb_cerrar
this.rte_4=create rte_4
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.st_3=create st_3
this.sle_a=create sle_a
this.gb_2=create gb_2
this.t1=create t1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_4=create st_4
this.dw_1=create dw_1
this.gb_1=create gb_1
this.sle_p=create sle_p
this.Control[]={this.mc_1,&
this.pb_cerrar,&
this.rte_4,&
this.st_2,&
this.st_1,&
this.ddlb_2,&
this.ddlb_1,&
this.st_3,&
this.sle_a,&
this.gb_2,&
this.t1,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_4,&
this.dw_1,&
this.gb_1,&
this.sle_p}
end on

on w_llamadas.destroy
destroy(this.mc_1)
destroy(this.pb_cerrar)
destroy(this.rte_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.st_3)
destroy(this.sle_a)
destroy(this.gb_2)
destroy(this.t1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.sle_p)
end on

event open;ddlb_1.SelectItem(1)
ddlb_1.TriggerEvent(selectionChanged!)
dw_1.Retrieve()
cambio = FALSE

end event

event closequery;int ret
if cambio then
	ret = MessageBox('Aviso','Se realizaron cambios. Desea guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_3.Event Clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

type mc_1 from monthcalendar within w_llamadas
integer x = 23
integer y = 48
integer width = 1111
integer height = 652
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long titletextcolor = 16777215
long trailingtextcolor = 134217745
long backcolor = 134217732
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
borderstyle borderstyle = styleraised!
end type

event constructor;GetSelectedDate ( l_fec )
end event

event datechanged;GetSelectedDate ( l_fec )
dw_1.Retrieve(datetime(l_fec))


end event

type pb_cerrar from picturebutton within w_llamadas
integer x = 4059
integer y = 532
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
string picturename = "cerrar.gif"
string disabledname = "d_cerrar.gif"
string powertiptext = "Cerrar Llamada"
end type

event clicked;string td, doc,usu_ll
long nota
if dw_1.RowCount() = 0 then Return
td = dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
doc = dw_1.GetItemString(dw_1.GetRow(),'documento')


if isNull(dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')) then
	select max(num_nota) into :nota from pacientesnotas
	where tipodoc=:td and documento=:doc;
	if SQLCA.SQLnRows = 0 then
		messageBox('Error',SQLCA.SQLErrText)
		Return -1
	end if
	if isNull(nota) then
		nota = 1
	else
		nota++
	end if
	dw_1.SetItem(dw_1.getRow(),'num_nota',nota)
else
	nota = dw_1.GetItemNumber(dw_1.getRow(),'num_nota')
end if
dw_1.SetItem(dw_1.getRow(),'estado','2')
dw_1.SetItem(dw_1.getRow(),'usu_atiende',usuario)
dw_1.SetItem(dw_1.getRow(),'fatiende',datetime(today(),now()))
if dw_1.Update() = -1 then
	Rollback;
	Return -1
end if
commit;

blob memo
string texto, ntexto
ntexto = t1.p2.rte_2.CopyRTF(False,Detail!)
if not (isNull(ntexto) or ntexto = '') then
	SQLCA.Autocommit = True
	selectblob nota_atiende into :memo from pacientesnotas
	where tipodoc=:td and documento=:doc and num_nota=:nota;
	
	texto = string(memo)
	select  nombre into :usu_ll from usuarios where usuario= :usuario;
	if IsNull(texto) or texto = '' then
	//	texto = f_rtf(usuario+"-"+string(today())+": ",true) + ntexto
		texto = f_rtf(usu_ll+"-"+string(today(),'dd/mm/yyyy hh:mm:ss')+": ",true) + ntexto
	else
//		texto = f_rtf(texto,true) + f_rtf(usuario+"-"+string(today())+": ",false) + ntexto
		texto =f_rtf(texto,true) +f_rtf('~r~n',true)+ f_rtf(usu_ll+"-"+string(today(),'dd/mm/yyyy hh:mm:ss')+": ",true) + ntexto
	end if

	memo = blob(texto)
	updateblob pacientesnotas set nota_atiende=:memo
	where tipodoc=:td and documento=:doc and num_nota=:nota;
	if SQLCA.SQLnRows = 0 then
		messageBox('Error','No fué posible actualizar el campo Solicitud')
		SQLCA.Autocommit = False
		Return -1
	end if
	
	SQLCA.Autocommit = False
end if

dw_1.TriggerEvent(rowfocuschanged!)
cambio = FALSE
Return 0

end event

type rte_4 from richtextedit within w_llamadas
boolean visible = false
integer x = 2848
integer y = 1800
integer width = 389
integer height = 60
integer taborder = 40
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_llamadas
integer x = 2226
integer y = 504
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesional:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_llamadas
integer x = 2889
integer y = 748
integer width = 215
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_llamadas
integer x = 3113
integer y = 720
integer width = 507
integer height = 400
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Pendiente","Completo","En curso","Cancelado"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if ddlb_1.text = 'Llamadas' then
	dw_1.SetFilter("tipo='1' and string(fllamada,'dd/mm/yyyy')='"+string( l_fec,'dd/mm/yyyy')+"'"+ " and  estado ='"+string(index -1)+"'")
else
	dw_1.SetFilter("tipo='3' and string(fllamada,'dd/mm/yyyy')='"+string( l_fec,'dd/mm/yyyy')+"'"+ " and  estado ='"+string(index -1)+"'")
end if
dw_1.Filter()

end event

type ddlb_1 from dropdownlistbox within w_llamadas
integer x = 3671
integer y = 12
integer width = 613
integer height = 412
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Todos"
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Llamadas","Promoción y Prevención","","",""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if text = 'Llamadas' then
	dw_1.SetFilter("tipo='1' and string(fllamada,'dd/mm/yyyy')='"+string( l_fec,'dd/mm/yyyy')+"'")
	pb_cerrar.enabled=true
else
	dw_1.SetFilter("tipo='3' and string(fllamada,'dd/mm/yyyy')='"+string( l_fec,'dd/mm/yyyy')+"'")
	pb_cerrar.enabled=false
end if
dw_1.Filter()
dw_1.TriggerEvent(RowFocusChanged!)

end event

type st_3 from statictext within w_llamadas
integer x = 3461
integer y = 16
integer width = 155
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ver:"
boolean focusrectangle = false
end type

type sle_a from singlelineedit within w_llamadas
integer x = 1225
integer y = 572
integer width = 974
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//if dw_1.RowCount() = 0 then Return
//dw_1.SetItem(dw_1.GetRow(),'asunto',this.Text)
//cambio = TRUE
end event

type gb_2 from groupbox within w_llamadas
integer x = 3877
integer y = 484
integer width = 654
integer height = 192
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type t1 from tab within w_llamadas
integer x = 37
integer y = 740
integer width = 4667
integer height = 1292
integer taborder = 30
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
p2 p2
p3 p3
p1 p1
end type

on t1.create
this.p2=create p2
this.p3=create p3
this.p1=create p1
this.Control[]={this.p2,&
this.p3,&
this.p1}
end on

on t1.destroy
destroy(this.p2)
destroy(this.p3)
destroy(this.p1)
end on

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 4631
integer height = 1164
long backcolor = 67108864
string text = "Gestion"
long tabtextcolor = 33554432
string picturename = "gestion.ico"
long picturemaskcolor = 536870912
rte_2 rte_2
end type

on p2.create
this.rte_2=create rte_2
this.Control[]={this.rte_2}
end on

on p2.destroy
destroy(this.rte_2)
end on

type rte_2 from richtextedit within p2
integer x = 18
integer y = 28
integer width = 4494
integer height = 1092
integer taborder = 20
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_rulerbar = true
borderstyle borderstyle = stylelowered!
end type

type p3 from userobject within t1
integer x = 18
integer y = 112
integer width = 4631
integer height = 1164
long backcolor = 67108864
string text = "Gestionado"
long tabtextcolor = 33554432
string picturename = "mejoramiento.ico"
long picturemaskcolor = 536870912
rte_3 rte_3
end type

on p3.create
this.rte_3=create rte_3
this.Control[]={this.rte_3}
end on

on p3.destroy
destroy(this.rte_3)
end on

type rte_3 from richtextedit within p3
event p_undo ( boolean p_cambio )
integer x = 18
integer y = 28
integer width = 4558
integer height = 1100
integer taborder = 80
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_rulerbar = true
borderstyle borderstyle = stylelowered!
end type

event p_undo(boolean p_cambio);if not p_cambio then
	this.undo()
end if
this.modified=false
i_cambio_rte=false
end event

event key;if keyflags = 2 then
	if key = keyC! then
		copy()
	elseif key = keycontrol! then
		Return 0
	end if
end if
this.SelectText(selectedLine(),selectedStart(),0,0)

end event

event modified;post event p_undo(i_cambio_rte)

end event

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 4631
integer height = 1164
long backcolor = 67108864
string text = "Solicitud"
long tabtextcolor = 33554432
string picturename = "quejas.ico"
long picturemaskcolor = 536870912
rte_1 rte_1
end type

on p1.create
this.rte_1=create rte_1
this.Control[]={this.rte_1}
end on

on p1.destroy
destroy(this.rte_1)
end on

type rte_1 from richtextedit within p1
event p_undo ( boolean p_cambio )
integer x = 18
integer y = 28
integer width = 4558
integer height = 1100
integer taborder = 70
integer textsize = -9
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_rulerbar = true
borderstyle borderstyle = stylelowered!
end type

event p_undo(boolean p_cambio);if not p_cambio then
	this.undo()
end if
this.modified=false
i_cambio_rte=false
end event

event key;if keyflags = 2 then
	if key = keyC! then
		copy()
	elseif key = keycontrol! then
		Return 0
	end if
end if
this.SelectText(selectedLine(),selectedStart(),0,0)

end event

event modified;post event p_undo(i_cambio_rte)

end event

type pb_5 from picturebutton within w_llamadas
boolean visible = false
integer x = 3529
integer y = 532
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar"
end type

event clicked;long f
f = dw_1.InsertRow(0)
dw_1.SetItem(f,'tipodoc',tipdoc)
dw_1.SetItem(f,'documento',docu)
dw_1.SetItem(f,'fingreso',today())
dw_1.SetItem(f,'estado','0')
if ddlb_1.Text = 'Llamadas' then
	dw_1.SetItem(f,'tipo','1')
else
	dw_1.SetItem(f,'tipo','3')
end if
if w_principal.dw_profe.Visible = TRUE then
	dw_1.SetItem(f,'codprof',w_principal.dw_profe.GetItemString(1,1))
elseif w_principal.dw_odprofe.Visible = TRUE then
	dw_1.SetItem(f,'codprof',w_principal.dw_odprofe.GetItemString(1,1))
else
	Messagebox('Aviso','No existe profesional activo')
end if

dw_1.scrolltoRow(f)
cambio = TRUE

end event

type pb_4 from picturebutton within w_llamadas
boolean visible = false
integer x = 3675
integer y = 532
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar"
end type

event clicked;if dw_1.RowCount() = 0 then Return
dw_1.DeleteRow(0)

end event

type pb_3 from picturebutton within w_llamadas
integer x = 3918
integer y = 532
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;string td, doc,usu_ll,l_estado
long nota
if dw_1.RowCount() = 0 then Return
td = dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
doc = dw_1.GetItemString(dw_1.GetRow(),'documento')
l_estado=dw_1.GetItemString(dw_1.GetRow(),'estado')
if l_estado='2' then 
	messageBox('Atención','Cerrada')
	return
end if
if isNull(dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')) then
	select max(num_nota) into :nota from pacientesnotas
	where tipodoc=:td and documento=:doc;
	if SQLCA.SQLnRows = 0 then
		messageBox('Error',SQLCA.SQLErrText)
		Return -1
	end if
	if isNull(nota) then
		nota = 1
	else
		nota++
	end if
	dw_1.SetItem(dw_1.getRow(),'num_nota',nota)
else
	nota = dw_1.GetItemNumber(dw_1.getRow(),'num_nota')
end if
if pb_cerrar.enabled=true then
	dw_1.SetItem(dw_1.getRow(),'estado','3')
else
	dw_1.SetItem(dw_1.getRow(),'estado','2')
end if
dw_1.SetItem(dw_1.getRow(),'usu_atiende',usuario)
dw_1.SetItem(dw_1.getRow(),'fatiende',datetime(today(),now()))
if dw_1.Update() = -1 then
	Rollback;
	Return -1
end if
commit;

blob memo
string texto, ntexto
ntexto = t1.p2.rte_2.CopyRTF(False,Detail!)
if not (isNull(ntexto) or ntexto = '') then
	SQLCA.Autocommit = True
	selectblob nota_atiende into :memo from pacientesnotas
	where tipodoc=:td and documento=:doc and num_nota=:nota;
	
	texto = string(memo)
	select  nombre into :usu_ll from usuarios where usuario= :usuario;
	if IsNull(texto) or texto = '' then
	//	texto = f_rtf(usuario+"-"+string(today())+": ",true) + ntexto
		texto = f_rtf(usu_ll+"-"+string(today(),'dd/mm/yyyy hh:mm:ss')+": ",true) + ntexto
	else
//		texto = f_rtf(texto,true) + f_rtf(usuario+"-"+string(today())+": ",false) + ntexto
		texto =f_rtf(texto,true) +f_rtf('~r~n',true)+ f_rtf(usu_ll+"-"+string(today(),'dd/mm/yyyy hh:mm:ss')+": ",true) + ntexto
	end if

	memo = blob(texto)
	updateblob pacientesnotas set nota_atiende=:memo
	where tipodoc=:td and documento=:doc and num_nota=:nota;
	if SQLCA.SQLnRows = 0 then
		messageBox('Error','No fué posible actualizar el campo Solicitud')
		SQLCA.Autocommit = False
		Return -1
	end if
	
	SQLCA.Autocommit = False
end if

dw_1.TriggerEvent(rowfocuschanged!)
cambio = FALSE
Return 0

end event

type pb_2 from picturebutton within w_llamadas
integer x = 4206
integer y = 532
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir"
end type

event clicked;openwithparm(w_print_rtf,t1.p2.rte_2)
//if PrintSetup( ) = -1 then
//	MessageBox("Error!","Falló Impresión")
//end if
end event

type pb_1 from picturebutton within w_llamadas
integer x = 4347
integer y = 532
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Plantilla"
end type

event clicked;st_rte st_r
long cars

if w_principal.dw_profe.Visible = TRUE then
	st_r.c_prof = w_principal.dw_profe.GetItemString(1,1)
elseif w_principal.dw_odprofe.Visible = TRUE then
	st_r.c_prof = w_principal.dw_odprofe.GetItemString(1,1)
else
	Messagebox('Aviso','No existe profesional activo')
end if

rte_4.SelectTextAll()
rte_4.ReplaceText('')

st_r.ventana = 'NOTAS'
st_r.rte = t1.p2.rte_2
st_r.dw_pac=w_principal.dw_1
openwithparm(w_plant_rtf,st_r)
rte_4.SelectTextAll()
cars = rte_4.Copy()
if cars > 0 then
	t1.p2.rte_2.Paste()
end if

end event

type st_4 from statictext within w_llamadas
integer x = 1230
integer y = 504
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asunto:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_llamadas
integer x = 1225
integer y = 96
integer width = 3419
integer height = 400
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_llamadas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;t1.p1.rte_1.SelectTextAll(Detail!)
i_cambio_rte = TRUE
t1.p1.rte_1.Clearall()
t1.p2.rte_2.SelectTextAll(Detail!)
t1.p2.rte_2.Clearall()
t1.p3.rte_3.SelectTextAll(Detail!)
i_cambio_rte = TRUE
t1.p3.rte_3.Clearall()

if RowCount() = 0 or currentrow = 0 then Return
sle_a.Text = GetItemString(GetRow(),'asunto')
sle_p.Text = GetItemString(GetRow(),'desprof')
ddlb_2.SelectItem(Integer(GetItemString(GetRow(),'estado')) + 1)
string texto, td, doc
long nota
blob memo
td = getItemString(GetRow(),'tipodoc')
doc = getItemString(GetRow(),'documento')
nota = GetItemNumber(GetRow(),'num_nota')
SQLCA.Autocommit = True
selectblob solicitud into :memo from pacientesnotas
where tipodoc=:td and documento=:doc and num_nota=:nota;
if SQLCA.SQLCode = -1 then
	MessageBox('Error','Imposible traer campo Solicitud')
	SQLCA.Autocommit = False
	Return -1
end if
texto = string(memo)
if not(isNull(texto) or texto = '') then
	t1.p1.rte_1.PasteRTF(texto,Detail!)
end if
selectblob nota_atiende into :memo from pacientesnotas
where tipodoc=:td and documento=:doc and num_nota=:nota;
if SQLCA.SQLCode = -1 then
	MessageBox('Error','Imposible traer campo Solicitud')
	SQLCA.Autocommit = False
	Return -1
end if
texto = string(memo)
if not(isNull(texto) or texto = '') then
	t1.p3.rte_3.PasteRTF(texto,Detail!)
end if

t1.p2.rte_2.Modified = FALSE
cambio = FALSE

SQLCA.Autocommit = False

end event

event rowfocuschanging;int ret
if cambio then
	ret = MessageBox('Aviso','Se realizaron cambios. Desea guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_3.Event Clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

event retrieveend;//uo_1.TriggerEvent("pe_clicked")
end event

event itemchanged;cambio = TRUE
end event

event clicked;if string(dwo.name) = 'compute_1' then
	SetRow(row)
end if

end event

type gb_1 from groupbox within w_llamadas
integer x = 1161
integer y = 36
integer width = 3534
integer height = 672
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de notas"
end type

type sle_p from singlelineedit within w_llamadas
integer x = 2222
integer y = 572
integer width = 1243
integer height = 80
integer taborder = 50
boolean bringtotop = true
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

event modified;//if dw_1.RowCount() = 0 then Return
//dw_1.SetItem(dw_1.GetRow(),'asunto',this.Text)
//cambio = TRUE
end event

