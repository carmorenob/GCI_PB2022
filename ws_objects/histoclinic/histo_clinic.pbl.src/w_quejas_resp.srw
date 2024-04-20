$PBExportHeader$w_quejas_resp.srw
forward
global type w_quejas_resp from window
end type
type dw_ftpqueja from datawindow within w_quejas_resp
end type
type mc_1 from monthcalendar within w_quejas_resp
end type
type dw_2 from datawindow within w_quejas_resp
end type
type pb_7 from pb_report within w_quejas_resp
end type
type st_5 from statictext within w_quejas_resp
end type
type pb_6 from picturebutton within w_quejas_resp
end type
type st_3 from statictext within w_quejas_resp
end type
type sle_a from singlelineedit within w_quejas_resp
end type
type gb_2 from groupbox within w_quejas_resp
end type
type t1 from tab within w_quejas_resp
end type
type p2 from userobject within t1
end type
type st_2 from statictext within p2
end type
type st_1 from statictext within p2
end type
type rte_2 from richtextedit within p2
end type
type p2 from userobject within t1
st_2 st_2
st_1 st_1
rte_2 rte_2
end type
type p4 from userobject within t1
end type
type rte_4 from richtextedit within p4
end type
type p4 from userobject within t1
rte_4 rte_4
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
type t1 from tab within w_quejas_resp
p2 p2
p4 p4
p3 p3
p1 p1
end type
type pb_5 from picturebutton within w_quejas_resp
end type
type pb_4 from picturebutton within w_quejas_resp
end type
type pb_3 from picturebutton within w_quejas_resp
end type
type pb_1 from picturebutton within w_quejas_resp
end type
type st_4 from statictext within w_quejas_resp
end type
type dw_1 from datawindow within w_quejas_resp
end type
type gb_1 from groupbox within w_quejas_resp
end type
type pb_2 from picturebutton within w_quejas_resp
end type
end forward

global type w_quejas_resp from window
integer width = 6126
integer height = 2452
boolean titlebar = true
string title = "Respuestas a Novedades en Atención"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_ftpqueja dw_ftpqueja
mc_1 mc_1
dw_2 dw_2
pb_7 pb_7
st_5 st_5
pb_6 pb_6
st_3 st_3
sle_a sle_a
gb_2 gb_2
t1 t1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_1 pb_1
st_4 st_4
dw_1 dw_1
gb_1 gb_1
pb_2 pb_2
end type
global w_quejas_resp w_quejas_resp

type variables
boolean cambio, i_cambio_rte=false
st_notas st_cl
datawindowchild idw_ser,idw_tipoq
date  l_fec
end variables

on w_quejas_resp.create
this.dw_ftpqueja=create dw_ftpqueja
this.mc_1=create mc_1
this.dw_2=create dw_2
this.pb_7=create pb_7
this.st_5=create st_5
this.pb_6=create pb_6
this.st_3=create st_3
this.sle_a=create sle_a
this.gb_2=create gb_2
this.t1=create t1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_1=create pb_1
this.st_4=create st_4
this.dw_1=create dw_1
this.gb_1=create gb_1
this.pb_2=create pb_2
this.Control[]={this.dw_ftpqueja,&
this.mc_1,&
this.dw_2,&
this.pb_7,&
this.st_5,&
this.pb_6,&
this.st_3,&
this.sle_a,&
this.gb_2,&
this.t1,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_1,&
this.st_4,&
this.dw_1,&
this.gb_1,&
this.pb_2}
end on

on w_quejas_resp.destroy
destroy(this.dw_ftpqueja)
destroy(this.mc_1)
destroy(this.dw_2)
destroy(this.pb_7)
destroy(this.st_5)
destroy(this.pb_6)
destroy(this.st_3)
destroy(this.sle_a)
destroy(this.gb_2)
destroy(this.t1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.pb_2)
end on

event open;string usu

//ddlb_1.SelectItem(1)
dw_1.Retrieve(datetime(l_fec))
dw_2.Retrieve()
cambio = FALSE
//t1.p2.st_1.Text = usuario
select  nombre into :usu from usuarios where usuario= :usuario;
t1.p2.st_1.Text=usu


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

type dw_ftpqueja from datawindow within w_quejas_resp
integer x = 4046
integer y = 4
integer width = 987
integer height = 72
integer taborder = 10
string title = "none"
string dataobject = "dw_pm_tipo_queja_drop"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
getchild('cod_tipoq',idw_tipoq)
idw_tipoq.settransobject(sqlca)
idw_tipoq.retrieve()
idw_tipoq.insertrow(1)
idw_tipoq.setitem(1,'descripcionq','TODOS')
idw_tipoq.setitem(1,'cod_tipoq','%')
insertrow(1)
end event

event itemchanged;int ret

if cambio then
	ret = MessageBox('Aviso','Se realizaron cambios. Desea guardarlos?',QUESTION!,YESNO!)
	if ret = 1 then
		Return pb_3.Event Clicked()
	elseif ret = 2 then
		if dw_1.GetItemNumber(dw_1.GetRow(),'nuevo') = 1 then dw_1.DeleteRow(dw_1.GetRow())
		cambio = FALSE
	end if
end if
if data = '%' then
	dw_1.SetFilter("")
else
	dw_1.SetFilter("tipo='"+data+"'")
end if
dw_1.Filter()
dw_1.TriggerEvent(RowFocusChanged!)

end event

type mc_1 from monthcalendar within w_quejas_resp
integer x = 18
integer y = 28
integer width = 1143
integer height = 656
integer taborder = 50
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
borderstyle borderstyle = styleraised!
end type

event datechanged;GetSelectedDate ( l_fec )
dw_1.Retrieve(datetime(l_fec))

end event

event constructor;GetSelectedDate ( l_fec )
end event

type dw_2 from datawindow within w_quejas_resp
integer x = 4293
integer y = 736
integer width = 773
integer height = 76
integer taborder = 40
string title = "none"
string dataobject = "dw_tipo_queja_drop"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if isnull(data) then return
if data='-1' then
	dw_1.SetFilter("")
else
     dw_1.SetFilter(" servicio ='"+data+"'")
end if
dw_1.Filter()
dw_1.TriggerEvent(RowFocusChanged!)
end event

event constructor;dw_2.settransobject(SQLCA)
end event

type pb_7 from pb_report within w_quejas_resp
integer x = 5120
integer y = 548
integer taborder = 40
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Click contrario para propiedades"
string cod_rep = "RQS"
string nombre_rep = "Respuesta Quejas"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_1.RowCount() = 0 then Return -1
any par[3]
par[1]=dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
par[2]=dw_1.GetItemString(dw_1.GetRow(),'documento')
par[3]=dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')
imprimir(par,'','0')
end event

type st_5 from statictext within w_quejas_resp
integer x = 4059
integer y = 744
integer width = 229
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtro por"
boolean focusrectangle = false
end type

type pb_6 from picturebutton within w_quejas_resp
integer x = 4818
integer y = 548
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
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar y Cerrar"
end type

event clicked;if messageBox('Atención','Al cerrar el documento no podrá modificarlo posteriormente. Desea continuar?',Question!,yesno!) = 2 then Return 0
if pb_3.Event clicked() = -1 then Return -1
dw_1.SetItem(dw_1.GetRow(),'estado','2')
if dw_1.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
commit;
dw_1.ResetUpdate()
Return 0

end event

type st_3 from statictext within w_quejas_resp
integer x = 3872
integer y = 8
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

type sle_a from singlelineedit within w_quejas_resp
integer x = 1211
integer y = 604
integer width = 3159
integer height = 80
integer taborder = 50
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

type gb_2 from groupbox within w_quejas_resp
integer x = 4805
integer y = 500
integer width = 635
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

type t1 from tab within w_quejas_resp
integer x = 27
integer y = 732
integer width = 6002
integer height = 1592
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
p4 p4
p3 p3
p1 p1
end type

on t1.create
this.p2=create p2
this.p4=create p4
this.p3=create p3
this.p1=create p1
this.Control[]={this.p2,&
this.p4,&
this.p3,&
this.p1}
end on

on t1.destroy
destroy(this.p2)
destroy(this.p4)
destroy(this.p3)
destroy(this.p1)
end on

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 5966
integer height = 1464
long backcolor = 67108864
string text = "Gestion"
long tabtextcolor = 33554432
string picturename = "gestion.ico"
long picturemaskcolor = 536870912
st_2 st_2
st_1 st_1
rte_2 rte_2
end type

on p2.create
this.st_2=create st_2
this.st_1=create st_1
this.rte_2=create rte_2
this.Control[]={this.st_2,&
this.st_1,&
this.rte_2}
end on

on p2.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rte_2)
end on

type st_2 from statictext within p2
integer x = 91
integer y = 16
integer width = 407
integer height = 68
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuario Responde"
boolean focusrectangle = false
end type

type st_1 from statictext within p2
integer x = 507
integer y = 12
integer width = 1467
integer height = 60
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rte_2 from richtextedit within p2
integer x = 96
integer y = 84
integer width = 5842
integer height = 1328
integer taborder = 30
boolean init_wordwrap = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

event modified;cambio = TRUE

end event

type p4 from userobject within t1
integer x = 18
integer y = 112
integer width = 5966
integer height = 1464
long backcolor = 67108864
string text = "Mejoramiento"
long tabtextcolor = 33554432
string picturename = "mejoramiento.ico"
long picturemaskcolor = 553648127
rte_4 rte_4
end type

on p4.create
this.rte_4=create rte_4
this.Control[]={this.rte_4}
end on

on p4.destroy
destroy(this.rte_4)
end on

type rte_4 from richtextedit within p4
integer x = 46
integer y = 48
integer width = 5376
integer height = 1388
integer taborder = 40
boolean init_wordwrap = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

event modified;cambio = TRUE

end event

type p3 from userobject within t1
boolean visible = false
integer x = 18
integer y = 112
integer width = 5966
integer height = 1464
long backcolor = 67108864
string text = "Gestionado"
long tabtextcolor = 33554432
string picturename = "gnome.ico"
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
integer x = 55
integer y = 64
integer width = 5349
integer height = 1344
integer taborder = 80
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
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
integer width = 5966
integer height = 1464
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
integer x = 37
integer y = 40
integer width = 5367
integer height = 1380
integer taborder = 70
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
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

type pb_5 from picturebutton within w_quejas_resp
boolean visible = false
integer x = 4411
integer y = 548
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

//if ddlb_1.Text = 'Llamadas' then
//	dw_1.SetItem(f,'tipo','1')
//else
//	dw_1.SetItem(f,'tipo','3')
//end if
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

type pb_4 from picturebutton within w_quejas_resp
boolean visible = false
integer x = 4558
integer y = 548
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

type pb_3 from picturebutton within w_quejas_resp
integer x = 4965
integer y = 548
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
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;string td, doc
long nota
if dw_1.RowCount() = 0 then Return
if dw_1.GetItemString(dw_1.GetRow(),'estado') = '3' then
	MessageBox('Atención','El documento ya ha sido cerrado')
	Return -1
end if
td = dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
doc = dw_1.GetItemString(dw_1.GetRow(),'documento')
if isNull(dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')) then
	select max(num_nota) into :nota from pacientesquejas
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
//dw_1.SetItem(dw_1.GetRow(),'estado','2') 
dw_1.SetItem(dw_1.GetRow(),'fatiende',today()) 
dw_1.SetItem(dw_1.GetRow(),'usu_atiende',usuario) 
if dw_1.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
dw_1.ResetUpdate()
// se supone que es nota_atiende
blob memo
string texto
texto = t1.p2.rte_2.CopyRTF(False,Detail!)
if not (isNull(texto) or texto = '') then
	SQLCA.Autocommit = True
	memo = blob(texto)
	updateblob pacientesquejas set nota_atiende=:memo
	where tipodoc=:td and documento=:doc and num_nota=:nota and clugar=:clugar;
	if SQLCA.SQLnRows = 0 then
		messageBox('Error','No fué posible actualizar el campo Atención')
		SQLCA.Autocommit = False
		Return -1
	end if
	SQLCA.Autocommit = False
end if

texto = t1.p4.rte_4.CopyRTF(False,Detail!)
if not (isNull(texto) or texto = '') then
	SQLCA.Autocommit = True
	memo = blob(texto)
	updateblob pacientesquejas set mejoramiento=:memo
	where tipodoc=:td and documento=:doc and num_nota=:nota  and clugar=:clugar;
	if SQLCA.SQLnRows = 0 then
		messageBox('Error','No fué posible actualizar el campo mejoramiento')
		SQLCA.Autocommit = False
		Return -1
	end if
	SQLCA.Autocommit = False
end if
t1.p2.rte_2.setredraw(True)
t1.p4.rte_4.setredraw(True)

commit;
dw_1.TriggerEvent(rowfocuschanged!)
cambio = FALSE
Return 0

end event

type pb_1 from picturebutton within w_quejas_resp
integer x = 5266
integer y = 548
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

st_r.ventana = 'QRES'
st_r.rte = t1.p2.rte_2
st_r.dw_pac=w_principal.dw_1
openwithparm(w_plant_rtf,st_r)

end event

type st_4 from statictext within w_quejas_resp
integer x = 1207
integer y = 528
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

type dw_1 from datawindow within w_quejas_resp
integer x = 1198
integer y = 128
integer width = 4791
integer height = 400
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_quejas_resp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;string texto, td, doc
long nota
blob memo

i_cambio_rte = TRUE
texto=''
f_sel_rtf(t1.p1.rte_1)
t1.p1.rte_1.Clearall()
f_pega_a_rtf(t1.p1.rte_1,texto,3)
f_sel_rtf(t1.p2.rte_2)
t1.p2.rte_2.Clearall()
f_pega_a_rtf(t1.p2.rte_2,texto,3)
f_sel_rtf(t1.p3.rte_3)
t1.p3.rte_3.Clearall()
f_pega_a_rtf(t1.p3.rte_3,texto,3)
f_sel_rtf(t1.p4.rte_4)
t1.p4.rte_4.Clearall()
f_pega_a_rtf(t1.p4.rte_4,texto,3)
i_cambio_rte = TRUE

if RowCount() = 0 or currentrow = 0 then Return
sle_a.Text = GetItemString(GetRow(),'asunto')

td = getItemString(GetRow(),'tipodoc')
doc = getItemString(GetRow(),'documento')
nota = GetItemNumber(GetRow(),'num_nota')
SQLCA.Autocommit = True

selectblob solicitud into :memo from pacientesquejas
where tipodoc=:td and documento=:doc and num_nota=:nota and clugar=:clugar;
if SQLCA.SQLCode = -1 then
	MessageBox('Error','Imposible traer campo Solicitud')
	SQLCA.Autocommit = False
	Return -1
end if
texto = string(memo)
if not(isNull(texto) or texto = '') then
	t1.p1.rte_1.PasteRTF(texto,Detail!)
end if

selectblob mejoramiento into :memo from pacientesquejas
where tipodoc=:td and documento=:doc and num_nota=:nota and clugar=:clugar;
if SQLCA.SQLCode = -1 then
	MessageBox('Error','Imposible traer campo Mejoramiento')
	SQLCA.Autocommit = False
	Return -1
end if
texto = string(memo)
if not(isNull(texto) or texto = '') then
	t1.p4.rte_4.PasteRTF(texto,Detail!)
end if
//
selectblob nota_atiende into :memo from pacientesquejas
where tipodoc=:td and documento=:doc and num_nota=:nota and clugar=:clugar;
if SQLCA.SQLCode = -1 then
	MessageBox('Error','Imposible traer campo Respuesta')
	SQLCA.Autocommit = False
	Return -1
end if
texto = string(memo)
if not(isNull(texto) or texto = '') then
	t1.p2.rte_2.PasteRTF(texto,Detail!)
//	f_pega_a_rtf(t1.p3.rte_3, texto, 3)
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

event itemchanged;cambio = TRUE
end event

event clicked;if string(dwo.name) = 'compute_1' then
	SetRow(row)
end if

end event

type gb_1 from groupbox within w_quejas_resp
integer x = 1179
integer y = 8
integer width = 4850
integer height = 704
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

type pb_2 from picturebutton within w_quejas_resp
integer x = 3547
integer y = 560
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print.gif"
string disabledname = "d_print.gif"
alignment htextalign = left!
string powertiptext = "Imprimir"
end type

event clicked;//openwithparm(w_print_rtf,t1.p2.rte_2)
if dw_1.RowCount() = 0 then Return -1
any par[3]
par[1]=dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
par[2]=dw_1.GetItemString(dw_1.GetRow(),'documento')
par[3]=dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')
//imprimir(par)



//uo_datastore dw_r
//dw_r = Create uo_datastore
//
//blob repo
//Selectblob reporte into :repo from rep_interno
//where cod_rep = 'QRS' and clugar=:clugar;
//IF SQLCA.SQLCode = -1 THEN
//	MessageBox("SQL error leyendo reporte interno QRS", SQLCA.SQLErrText)
//END IF
//
//if dw_r.create(string(repo))=-1 then
//	MessageBox('Error','No fue posible leer el reporte ' + tag)
//	enabled=false
//	Return -1
//end if
//
//dw_r.Retrieve(dw_1.GetItemString(dw_1.GetRow(),'tipodoc'),dw_1.GetItemString(dw_1.GetRow(),'documento'),dw_1.GetItemNumber(dw_1.GetRow(),'num_nota'))
//st_xa_print_histo st
//st.p_ds = dw_r
//st.p_contador = dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')
//st.p_cod_plant = 'QUEJASPAC!'
//st.p_tdoc = tipdoc
//st.p_docu = docu
//if isvalid(w_reporte_gral) then
//	w_reporte_gral.pasar_a_rtf(st)
//else
//	opensheetwithparm(w_reporte_gral,st,w_principal,7)
//end if
end event

