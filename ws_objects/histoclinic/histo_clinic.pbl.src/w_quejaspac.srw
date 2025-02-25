$PBExportHeader$w_quejaspac.srw
forward
global type w_quejaspac from window
end type
type dw_ftpqueja from datawindow within w_quejaspac
end type
type mc_1 from monthcalendar within w_quejaspac
end type
type pb_7 from pb_report within w_quejaspac
end type
type pb_6 from picturebutton within w_quejaspac
end type
type sle_a from singlelineedit within w_quejaspac
end type
type gb_3 from groupbox within w_quejaspac
end type
type gb_2 from groupbox within w_quejaspac
end type
type st_3 from statictext within w_quejaspac
end type
type t1 from tab within w_quejaspac
end type
type p1 from userobject within t1
end type
type mle_1 from multilineedit within p1
end type
type p1 from userobject within t1
mle_1 mle_1
end type
type p2 from userobject within t1
end type
type mle_2 from multilineedit within p2
end type
type p2 from userobject within t1
mle_2 mle_2
end type
type p3 from userobject within t1
end type
type mle_3 from multilineedit within p3
end type
type p3 from userobject within t1
mle_3 mle_3
end type
type t1 from tab within w_quejaspac
p1 p1
p2 p2
p3 p3
end type
type pb_5 from picturebutton within w_quejaspac
end type
type pb_4 from picturebutton within w_quejaspac
end type
type pb_3 from picturebutton within w_quejaspac
end type
type pb_1 from picturebutton within w_quejaspac
end type
type st_4 from statictext within w_quejaspac
end type
type gb_1 from groupbox within w_quejaspac
end type
type dw_1 from datawindow within w_quejaspac
end type
end forward

global type w_quejaspac from window
integer width = 6098
integer height = 2428
boolean titlebar = true
string title = "Novedades en Atención"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_ftpqueja dw_ftpqueja
mc_1 mc_1
pb_7 pb_7
pb_6 pb_6
sle_a sle_a
gb_3 gb_3
gb_2 gb_2
st_3 st_3
t1 t1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_1 pb_1
st_4 st_4
gb_1 gb_1
dw_1 dw_1
end type
global w_quejaspac w_quejaspac

type variables
boolean cambio
boolean i_cambia_rte
string ant
long nuevo
datawindowchild dw_cla,idw_tipoq
date l_fec
end variables

on w_quejaspac.create
this.dw_ftpqueja=create dw_ftpqueja
this.mc_1=create mc_1
this.pb_7=create pb_7
this.pb_6=create pb_6
this.sle_a=create sle_a
this.gb_3=create gb_3
this.gb_2=create gb_2
this.st_3=create st_3
this.t1=create t1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_1=create pb_1
this.st_4=create st_4
this.gb_1=create gb_1
this.dw_1=create dw_1
this.Control[]={this.dw_ftpqueja,&
this.mc_1,&
this.pb_7,&
this.pb_6,&
this.sle_a,&
this.gb_3,&
this.gb_2,&
this.st_3,&
this.t1,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_1,&
this.st_4,&
this.gb_1,&
this.dw_1}
end on

on w_quejaspac.destroy
destroy(this.dw_ftpqueja)
destroy(this.mc_1)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.sle_a)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.st_3)
destroy(this.t1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event open;dw_1.Retrieve(datetime(l_fec))
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

type dw_ftpqueja from datawindow within w_quejaspac
integer x = 4046
integer y = 4
integer width = 987
integer height = 72
integer taborder = 50
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

type mc_1 from monthcalendar within w_quejaspac
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

event datechanged;GetSelectedDate ( l_fec )
dw_1.Retrieve(datetime(l_fec))


end event

event constructor;GetSelectedDate ( l_fec )
end event

type pb_7 from pb_report within w_quejaspac
integer x = 4443
integer y = 540
integer taborder = 60
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string cod_rep = "QRS"
string nombre_rep = "Quejas y Reclamos"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_1.RowCount() = 0 then Return -1
any par[3]
par[1]=dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
par[2]=dw_1.GetItemString(dw_1.GetRow(),'documento')
par[3]=dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')
imprimir(par,'','0')
end event

type pb_6 from picturebutton within w_quejaspac
integer x = 4786
integer y = 544
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
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular documento"
end type

event clicked;if dw_1.RowCount() = 0 then Return
if dw_1.GetItemNumber(dw_1.GetRow(),'nuevo') = 1 then
	cambio = FALSE
	dw_1.DeleteRow(dw_1.GetRow())
	PostEvent(rowfocuschanged!)
end if
dw_1.SetItem(dw_1.GetRow(),'estado','3')
if dw_1.Update() = -1 then
	Rollback;
	Return -1
end if
Return 0

end event

type sle_a from singlelineedit within w_quejaspac
integer x = 1198
integer y = 572
integer width = 3013
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event modified;if dw_1.RowCount() = 0 then Return
dw_1.SetItem(dw_1.GetRow(),'asunto',this.Text)
cambio = TRUE
end event

type gb_3 from groupbox within w_quejaspac
integer x = 4288
integer y = 516
integer width = 475
integer height = 168
integer taborder = 30
integer textsize = -4
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_quejaspac
integer x = 4768
integer y = 516
integer width = 494
integer height = 172
integer taborder = 20
integer textsize = -4
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "."
end type

type st_3 from statictext within w_quejaspac
integer x = 3936
integer y = 12
integer width = 128
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ver:"
boolean focusrectangle = false
end type

type t1 from tab within w_quejaspac
integer x = 27
integer y = 728
integer width = 6002
integer height = 1560
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
p1 p1
p2 p2
p3 p3
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.p3=create p3
this.Control[]={this.p1,&
this.p2,&
this.p3}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
destroy(this.p3)
end on

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 5966
integer height = 1432
long backcolor = 67108864
string text = "Solicitud"
long tabtextcolor = 33554432
string picturename = "quejas.ico"
long picturemaskcolor = 536870912
mle_1 mle_1
end type

on p1.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on p1.destroy
destroy(this.mle_1)
end on

type mle_1 from multilineedit within p1
integer x = 46
integer y = 32
integer width = 5861
integer height = 1396
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 5966
integer height = 1432
long backcolor = 67108864
string text = "Gestion"
long tabtextcolor = 33554432
string picturename = "gestion.ico"
long picturemaskcolor = 536870912
mle_2 mle_2
end type

on p2.create
this.mle_2=create mle_2
this.Control[]={this.mle_2}
end on

on p2.destroy
destroy(this.mle_2)
end on

type mle_2 from multilineedit within p2
integer x = 32
integer y = 24
integer width = 5897
integer height = 1396
integer taborder = 40
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type p3 from userobject within t1
integer x = 18
integer y = 112
integer width = 5966
integer height = 1432
long backcolor = 67108864
string text = "Mejoramiento"
long tabtextcolor = 33554432
string picturename = "mejoramiento.ico"
long picturemaskcolor = 536870912
mle_3 mle_3
end type

on p3.create
this.mle_3=create mle_3
this.Control[]={this.mle_3}
end on

on p3.destroy
destroy(this.mle_3)
end on

type mle_3 from multilineedit within p3
integer x = 32
integer y = 28
integer width = 5883
integer height = 1408
integer taborder = 50
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type pb_5 from picturebutton within w_quejaspac
integer x = 4297
integer y = 540
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar"
end type

event clicked;int cuan
select count(tipodoc) into :cuan from pacientes where tipodoc=:tipdoc and  documento=:docu;
if sqlca.sqlcode=-1 then 
	messagebox("Error leyendo de Pacientes",sqlca.sqlerrtext)
	return
end if
if cuan=0 then 
	messagebox("Atención",'Elija usuario a asignar')
	return 0
else
	pb_5.enabled=true
end if


long f
if dw_1.Find("nuevo=1",1,dw_1.RowCount()) > 0 then
	MessageBox('Atención','Existe un registro nuevo sin guardar')
	Return 0
end if
f = dw_1.InsertRow(1)
dw_1.SetItem(f,'tipodoc',tipdoc)
dw_1.SetItem(f,'documento',docu)
dw_1.SetItem(f,'fingreso',today())
dw_1.SetItem(f,'estado','0')
dw_1.SetItem(f,'nuevo',1)
dw_1.SetItem(f,'clugar',CLUGAR)

t1.p1.mle_1.Enabled = TRUE
sle_a.Enabled = TRUE
dw_1.scrolltoRow(f)
cambio = TRUE

end event

type pb_4 from picturebutton within w_quejaspac
integer x = 4937
integer y = 544
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar"
end type

event clicked;if dw_1.RowCount() = 0 then Return
if dw_1.GetItemNumber(dw_1.GetRow(),'nuevo') = 1 then
	dw_1.DeleteRow(0)
else
	MessageBox('Atención','Solamente registros nuevos')
end if
cambio = TRUE

end event

type pb_3 from picturebutton within w_quejaspac
integer x = 4590
integer y = 540
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

event clicked;long nota
if dw_1.AcceptText() = -1 then Return -1
string td, doc
if dw_1.GetItemString(dw_1.GetRow(),'estado') = '1' or dw_1.GetItemString(dw_1.GetRow(),'estado') = '3' then
	MessageBox('Atención','El documento ya ha sido cerrado')
	Return -1
end if

td = dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
doc = dw_1.GetItemString(dw_1.GetRow(),'documento')
if cambio and dw_1.RowCount() = 0 then
	if dw_1.Update() = -1 then
		Rollback;
		Return -1
	end if
	commit;
	cambio = FALSE
	Return 0
end if
if not cambio then Return 0
dw_1.SetItem(dw_1.GetRow(),'estado','1')
if isNull(dw_1.GetItemString(dw_1.GetRow(),'tipo')) then
	MessageBox('Atención','Se requiere el tipo de nota')
	Return -1
end if
if isNull(dw_1.GetItemString(dw_1.GetRow(),'tipo')) then
	MessageBox('Atención','Se requiere el Tipo')
	Return -1
end if
if isNull(dw_1.GetItemString(dw_1.GetRow(),'servicio')) then
	MessageBox('Atención','Se requiere el Servicio')
	Return -1
end if
if isNull(dw_1.GetItemString(dw_1.GetRow(),'clasificacion')) then
	MessageBox('Atención','Se requiere el Clasiificación')
	Return -1
end if
if isNull(dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')) then
	select max(num_nota) into :nota from pacientesquejas
	where tipodoc=:td and documento=:doc and clugar=:clugar;
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
dw_1.SetItem(dw_1.getRow(),'usuario',usuario)
if dw_1.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if dw_1.GetItemNumber(dw_1.GetRow(),'nuevo') = 1 then
	dw_1.SetItem(dw_1.GetRow(),'nuevo',0)
end if
dw_1.ResetUpdate()
commit;

blob memo
string texto
texto = t1.p1.mle_1.text
if not (isNull(texto) or texto = '') then
	SQLCA.Autocommit = True
	memo = blob(texto)
	updateblob pacientesquejas set solicitud=:memo
	where tipodoc=:td and documento=:doc and num_nota=:nota and clugar=:clugar;
	if SQLCA.SQLnRows = 0 then
		messageBox('Error','No fué posible actualizar el campo Solicitud')
		SQLCA.Autocommit = False
		Return -1
	end if
	SQLCA.Autocommit = False
end if
//dw_1.TriggerEvent(rowfocuschanged!)
cambio = FALSE
Return 0
dw_cla.setFilter('')
dw_cla.filter()
mc_1.GetSelectedDate ( l_fec )
dw_1.Retrieve(datetime(l_fec))


end event

type pb_1 from picturebutton within w_quejaspac
integer x = 5097
integer y = 544
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

//st_r.ventana = st_cl.ventana
st_r.ventana = 'QRS'  // Quejas Reclamos y Sugerencias
st_r.mle = t1.p1.mle_1
st_r.c_prof =g_profe
//st_r.empresa=st_cl.empresa
st_r.dw_pac = dw_1
openwithparm(w_plant_rtf_borrar,st_r)

end event

type st_4 from statictext within w_quejaspac
integer x = 1202
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

type gb_1 from groupbox within w_quejaspac
integer x = 1152
integer y = 32
integer width = 4887
integer height = 676
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial "
end type

type dw_1 from datawindow within w_quejaspac
event borrar_nuevo ( )
integer x = 1189
integer y = 120
integer width = 4800
integer height = 400
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_quejas_pac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event borrar_nuevo();if nuevo > 0 then
	DeleteRow(nuevo)
	nuevo = 0
	cambio = FALSE
	PostEvent(RowFocuschanged!)
end if

end event

event constructor;SetTransObject(SQLCA)
getchild('clasificacion',dw_cla)
dw_cla.settransobject(SQLCA)





end event

event rowfocuschanged;string texto, td, doc,texto1
long nota
blob memo, memo1

i_cambia_rte = TRUE

texto=''
t1.p1.mle_1.text=''
t1.p2.mle_2.text=''
t1.p3.mle_3.text=''
sle_a.Text = ''
cambio = FALSE

if RowCount() = 0 or currentrow = 0 then Return
sle_a.Text = GetItemString(GetRow(),'asunto')
if dw_1.GetItemString(dw_1.GetRow(),'estado') = '1' or dw_1.GetItemString(dw_1.GetRow(),'estado') = '3' then
	sle_a.DisplayOnly = TRUE
else
	sle_a.DisplayOnly = FALSE
end if

td = getItemString(GetRow(),'tipodoc')
doc = getItemString(GetRow(),'documento')
nota = GetItemNumber(GetRow(),'num_nota')
setnull(memo)
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
	t1.p1.mle_1.text=texto
	t1.p1.mle_1.enabled = FALSE
end if
setnull(memo)
selectblob nota_atiende into :memo from pacientesquejas
where tipodoc=:td and documento=:doc and num_nota=:nota and clugar=:clugar;
if SQLCA.SQLCode = -1 then
	MessageBox('Error','Imposible traer campo Solicitud')
	SQLCA.Autocommit = False
	Return -1
end if
texto = string(memo)
if not(isNull(texto) or texto = '') then
	t1.p2.mle_2.text=''
end if

//
setnull(memo)
selectblob mejoramiento into :memo1 from pacientesquejas
where tipodoc=:td and documento=:doc and num_nota=:nota and clugar=:clugar;
if SQLCA.SQLCode = -1 then
	MessageBox('Error','Imposible traer campo Solicitud')
	SQLCA.Autocommit = False
	Return -1
end if
texto1 = string(memo1)
if not(isNull(texto1) or texto1 = '') then
	t1.p3.mle_3.text=texto1
end if

cambio = FALSE
SQLCA.Autocommit = False

end event

event rowfocuschanging;if currentrow < 1 or this.RowCount() = 0 then Return
IF GetItemNumber(GetRow(),'nuevo') = 1 and ((KeyDown(KeyTab!) and currentrow<>newrow) or ((KeyDown(KeyEnter!) or KeyDown(KeyDownArrow!) OR & 
   KeyDown(KeyUpArrow!) OR KeyDown(KeyPageDown!) OR KeyDown(KeyPageUp!)) and getfocus()=this))  THEN
	return -1
end if

int ret
if cambio and newrow > 0  then
	ret = MessageBox('Aviso','Se realizaron cambios. Desea guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_3.Event Clicked()
	elseif ret = 2 then
		if GetItemNumber(currentrow,'nuevo') = 1 then
			nuevo = currentrow
			PostEvent("borrar_nuevo")
		end if
		cambio = FALSE
	elseif ret = 3 then
		Return -1
	end if
end if

end event

event itemchanged;string td,doc,n1,n2,a1,a2
acceptText()
if GetColumnName() = 'tipodoc' or GetColumnName() = 'documento' then
	td = GetItemString(GetRow(),'tipodoc')
	doc = GetItemString(GetRow(),'documento')
	if isNull(td) or isNull(doc) then Return 0
	select tipodoc, documento, nombre1, nombre2, apellido1, apellido2 into :td,:doc,:n1,:n2,:a1,:a2
	from pacientes where tipodoc=:td and documento=:doc;
	if isNull(doc) then
		MessageBox('Atención','Paciente no encontrado')
		Return -1
	else
		SetItem(GetRow(),'nombre1',n1)
		SetItem(GetRow(),'nombre2',n2)
		SetItem(GetRow(),'apellido1',a1)
		SetItem(GetRow(),'apellido2',a2)
	end if
	
end if
if GetColumnName() = 'servicio' or GetColumnName() = 'tipo' then
	setnull(a1)
	if GetColumnName()='tipo' then
		SetItem(GetRow(),'servicio',a1)
	end if
	SetItem(GetRow(),'clasificacion',a1)

	n1=GetItemString(GetRow(),'tipo')
	n2=GetItemString(GetRow(),'servicio')
	dw_cla.SetRedraw(false)
	if  isnull(n2) then 
		dw_cla.setFilter("clase_queja ='"+n1+ "' and isnull(tipo_servicio)")		
	else
		dw_cla.setFilter("clase_queja ='"+n1+ "' and  tipo_servicio ='"+n2+"'")		
	end if
	dw_cla.filter()
//	dw_cla.SetRedraw(true)	
end if
cambio = TRUE



end event

event clicked;if row < 1 then Return
if GetRow() <> row then
	SetRow(Row)
end if

end event

