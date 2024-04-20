$PBExportHeader$w_pyp_pacos.srw
forward
global type w_pyp_pacos from window
end type
type t1 from tab within w_pyp_pacos
end type
type p1 from userobject within t1
end type
type pb_6 from picturebutton within p1
end type
type pb_1 from picturebutton within p1
end type
type dw_p from datawindow within p1
end type
type p1 from userobject within t1
pb_6 pb_6
pb_1 pb_1
dw_p dw_p
end type
type p3 from userobject within t1
end type
type pb_2 from picturebutton within p3
end type
type dw_a from datawindow within p3
end type
type p3 from userobject within t1
pb_2 pb_2
dw_a dw_a
end type
type psf from userobject within t1
end type
type uo_sf from uo_orden_formula within psf
end type
type psf from userobject within t1
uo_sf uo_sf
end type
type pc from userobject within t1
end type
type pb_5 from picturebutton within pc
end type
type pb_4 from picturebutton within pc
end type
type pb_3 from picturebutton within pc
end type
type dw_c from datawindow within pc
end type
type pc from userobject within t1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
dw_c dw_c
end type
type t1 from tab within w_pyp_pacos
p1 p1
p3 p3
psf psf
pc pc
end type
end forward

global type w_pyp_pacos from window
integer width = 3931
integer height = 1976
boolean titlebar = true
string title = "Promoción y Mantenimiento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "diagnostico.ico"
boolean center = true
t1 t1
end type
global w_pyp_pacos w_pyp_pacos

type variables
string prof, espe
dataWindowChild dw_cond
st_notas st_p
end variables

on w_pyp_pacos.create
this.t1=create t1
this.Control[]={this.t1}
end on

on w_pyp_pacos.destroy
destroy(this.t1)
end on

event open;string atiend
st_p = Message.PowerObjectParm
if tipdoc<> "" and docu<> "" then
	if st_p.profe='' or isnull(st_p.profe) then
		messagebox("Atención","Debe escoger profesional para poder continuar")
		return
	else
		SELECT Profe.PersoAtiende into :atiend
		FROM Profe
		WHERE Profe.CodProf=:prof;
	end if
	
//	t1.p3.dw_a.Retrieve(tipdoc,docu)
	t1.p1.dw_p.Retrieve(tipdoc,docu)
	long nnulo
	string snulo
	setnull(nnulo)
	setnull(snulo)
	t1.psf.uo_sf.Retrieve(st_p.contador,st_p.clugar,prof,nnulo,snulo,'1',nnulo,snulo,nnulo,espe)	
	t1.pc.dw_c.GetChild('codcondicion',dw_cond)
	dw_cond.SetTransObject(SQLCA)
	dw_cond.SetFilter("sexo='"+ w_principal.dw_1.getitemstring(1,'sexo') + "' or sexo = 'T'")
	dw_cond.Filter()
	dw_cond.Retrieve()
	t1.pc.dw_c.Retrieve(tipdoc,docu)
end if

end event

type t1 from tab within w_pyp_pacos
integer x = 32
integer y = 28
integer width = 3776
integer height = 1816
integer taborder = 50
boolean bringtotop = true
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
p3 p3
psf psf
pc pc
end type

on t1.create
this.p1=create p1
this.p3=create p3
this.psf=create psf
this.pc=create pc
this.Control[]={this.p1,&
this.p3,&
this.psf,&
this.pc}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p3)
destroy(this.psf)
destroy(this.pc)
end on

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 3739
integer height = 1688
long backcolor = 67108864
string text = "Ciclo de vida"
long tabtextcolor = 33554432
string picturename = "asig_cita.ico"
long picturemaskcolor = 536870912
pb_6 pb_6
pb_1 pb_1
dw_p dw_p
end type

on p1.create
this.pb_6=create pb_6
this.pb_1=create pb_1
this.dw_p=create dw_p
this.Control[]={this.pb_6,&
this.pb_1,&
this.dw_p}
end on

on p1.destroy
destroy(this.pb_6)
destroy(this.pb_1)
destroy(this.dw_p)
end on

type pb_6 from picturebutton within p1
event mousemove pbm_mousemove
boolean visible = false
integer x = 3552
integer y = 216
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Generar Orden de Servicio"
end type

event clicked;long i, ret
if isNull(st_p.contador) or st_p.contador = 0 then 
	MessageBox('Error','No hay ingreso Activo. Retorne a la ventana anterior y seleccione/adicione alguno',QUESTION!,YESNO!)
	Return -1
end if
if t1.p1.dw_p.Find('selec=1',1,t1.p1.dw_p.RowCount()) = 0 then Return -1
if t1.psf.uo_sf.dw_oscab.RowCount() > 0 then
	ret = MessageBox('Aviso','Desea adicionar a la Orden de Servicio ya creada?',QUESTION!,YESNOCANCEL!)
	if ret = 2 then
		t1.psf.uo_sf.cb_nvorden.TriggerEvent(clicked!)
	elseif ret = 3 then
		Return 0
	end if
else
	t1.psf.uo_sf.cb_nvorden.TriggerEvent(clicked!)
end if
for i = 1 to t1.p1.dw_p.RowCount()
	if t1.p1.dw_p.GetItemNumber(i,'selec') = 1 then
		ret = t1.psf.uo_sf.Insert_proc(t1.p1.dw_p.GetItemString(i,'proced'),1)
		if ret = -1 then
			messageBox('Error','No se agregó procedimiento a Orden de Servicio')
			Rollback;
			Return -1
		end if
	end if
next
t1.SelectTab("psf")
commit;
Return 0

end event

type pb_1 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 3552
integer y = 88
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
string text = "        &a"
boolean originalsize = true
string picturename = "lapiz.gif"
string disabledname = "d_lapiz.gif"
alignment htextalign = left!
string powertiptext = "Realizar Nota al Paciente"
end type

event clicked;st_p.dw_acc = dw_p
st_p.Asunto = "Confirmación Servicios PyP"
st_p.ventana='CPYP'
openwithparm(w_notaspac,st_p)

end event

type dw_p from datawindow within p1
integer x = 59
integer y = 80
integer width = 3470
integer height = 1556
integer taborder = 30
string title = "none"
string dataobject = "dw_pym_pendientes_pac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event retrieverow;integer fila, cantidad=0, itemacc
string codacc

//codacc = GetItemString(row,'cod_prodpyp')
//itemacc = GetItemNumber(row,'accion_item')
//if t1.p3.dw_a.RowCount() = 0 then Return
//fila = t1.p3.dw_a.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),1,t1.p3.dw_a.RowCount())
//Do While fila > 0 
//	cantidad = cantidad + t1.p3.dw_a.GetItemNumber(fila,'cantidad')
//	if fila = t1.p3.dw_a.RowCount() then EXIT
//	fila = t1.p3.dw_a.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),fila + 1,t1.p3.dw_a.RowCount())
//Loop
//
//if cantidad > 0 and cantidad >= GetItemNumber(row,'cantidad') then
//	DeleteRow(row)
//else
//	if not isNull(GetItemDateTime(row,'fcondicion')) then
//		datetime dt
//		long dr
//		dt = GetItemDateTime(row,'fcondicion')
//		dr = GetItemNumber(row,'duracion')
//		if ( dr > 0 and RelativeDate(date(dt),dr) > today() ) or GetItemString(row,'estado') ='0' then
//			DeleteRow(row)
//		end if
//	end if
//end if
//
end event

type p3 from userobject within t1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3739
integer height = 1688
long backcolor = 67108864
string text = "Realizado"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
pb_2 pb_2
dw_a dw_a
end type

on p3.create
this.pb_2=create pb_2
this.dw_a=create dw_a
this.Control[]={this.pb_2,&
this.dw_a}
end on

on p3.destroy
destroy(this.pb_2)
destroy(this.dw_a)
end on

type pb_2 from picturebutton within p3
event mousemove pbm_mousemove
integer x = 2880
integer y = 88
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
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Procedimiento"
end type

event clicked;if dw_a.RowCount() = 0 then Return

dw_a.deleterow(0)
if dw_a.update()<1 then 
	rollback;
	dw_a.Retrieve(tipdoc,docu)
else
	commit;
end if
t1.p1.dw_p.Retrieve(w_principal.dw_1.GetItemNumber(1,'dias'),w_principal.dw_1.GetItemString(1,'sexo'),tipdoc,docu)

end event

type dw_a from datawindow within p3
integer x = 59
integer y = 84
integer width = 2793
integer height = 1032
integer taborder = 60
string title = "none"
string dataobject = "dw_pyp_aplicados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type psf from userobject within t1
integer x = 18
integer y = 112
integer width = 3739
integer height = 1688
long backcolor = 67108864
string text = "Ordenes"
long tabtextcolor = 33554432
string picturename = "ap_dx.ico"
long picturemaskcolor = 536870912
uo_sf uo_sf
end type

on psf.create
this.uo_sf=create uo_sf
this.Control[]={this.uo_sf}
end on

on psf.destroy
destroy(this.uo_sf)
end on

type uo_sf from uo_orden_formula within psf
integer y = 4
integer width = 3712
integer height = 1632
integer taborder = 40
string i_codrep_formula = "FMCE"
string i_codrep_orden = "OSCE"
boolean repord_dialogo = true
boolean repfor_dialogo = true
end type

on uo_sf.destroy
call uo_orden_formula::destroy
end on

type pc from userobject within t1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3739
integer height = 1688
long backcolor = 67108864
string text = "Condiciones"
long tabtextcolor = 33554432
string picturename = "conf_pag.ico"
long picturemaskcolor = 536870912
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
dw_c dw_c
end type

on pc.create
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.dw_c=create dw_c
this.Control[]={this.pb_5,&
this.pb_4,&
this.pb_3,&
this.dw_c}
end on

on pc.destroy
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.dw_c)
end on

type pb_5 from picturebutton within pc
event mousemove pbm_mousemove
integer x = 2400
integer y = 396
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &g"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "&Guardar Condiciones"
end type

event clicked;if dw_c.Update() = -1 then
	Rollback;
else
	commit;
end if

end event

type pb_4 from picturebutton within pc
event mousemove pbm_mousemove
integer x = 2400
integer y = 268
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
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "&Borrar Condición"
end type

event clicked;if dw_c.RowCount() > 0 then
	dw_c.DeleteRow(0)
end if

end event

type pb_3 from picturebutton within pc
event mousemove pbm_mousemove
integer x = 2400
integer y = 140
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
string text = "        &i"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Ad&icionar Condición"
end type

event clicked;int fila
if not isNull(docu) then
	fila = dw_c.InsertRow(0)
	dw_c.SetItem(fila,'tipodoc',tipdoc)
	dw_c.SetItem(fila,'documento',docu)
	dw_c.SetItem(fila,'estado','1')
	dw_c.SetItem(fila,'fcondicion',today())
end if

end event

type dw_c from datawindow within pc
integer x = 128
integer y = 136
integer width = 2231
integer height = 908
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_pac_cond"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;if GetColumnName() = 'codcondicion' then
	SetItem(GetRow(),'duracion',dw_cond.GetItemNumber(dw_cond.GetRow(),'duracion'))
end if

end event

