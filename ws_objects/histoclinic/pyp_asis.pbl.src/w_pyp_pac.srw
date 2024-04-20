$PBExportHeader$w_pyp_pac.srw
forward
global type w_pyp_pac from window
end type
type st_3 from statictext within w_pyp_pac
end type
type dw_historial from datawindow within w_pyp_pac
end type
type st_12 from statictext within w_pyp_pac
end type
type dw_empac from datawindow within w_pyp_pac
end type
type t1 from tab within w_pyp_pac
end type
type p1 from userobject within t1
end type
type pb_1 from picturebutton within p1
end type
type dw_p from datawindow within p1
end type
type p1 from userobject within t1
pb_1 pb_1
dw_p dw_p
end type
type ps from userobject within t1
end type
type uo_s from uo_serv_ing within ps
end type
type ps from userobject within t1
uo_s uo_s
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
type t1 from tab within w_pyp_pac
p1 p1
ps ps
p3 p3
psf psf
pc pc
end type
type cb_delhis from picturebutton within w_pyp_pac
end type
type cb_nhis from picturebutton within w_pyp_pac
end type
end forward

global type w_pyp_pac from window
integer width = 3625
integer height = 1992
boolean titlebar = true
string title = "Promoción y Prevención"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "diagnostico.ico"
boolean center = true
st_3 st_3
dw_historial dw_historial
st_12 st_12
dw_empac dw_empac
t1 t1
cb_delhis cb_delhis
cb_nhis cb_nhis
end type
global w_pyp_pac w_pyp_pac

type variables
string prof, espe
dataWindowChild dw_cond

end variables

on w_pyp_pac.create
this.st_3=create st_3
this.dw_historial=create dw_historial
this.st_12=create st_12
this.dw_empac=create dw_empac
this.t1=create t1
this.cb_delhis=create cb_delhis
this.cb_nhis=create cb_nhis
this.Control[]={this.st_3,&
this.dw_historial,&
this.st_12,&
this.dw_empac,&
this.t1,&
this.cb_delhis,&
this.cb_nhis}
end on

on w_pyp_pac.destroy
destroy(this.st_3)
destroy(this.dw_historial)
destroy(this.st_12)
destroy(this.dw_empac)
destroy(this.t1)
destroy(this.cb_delhis)
destroy(this.cb_nhis)
end on

event open;string atiend

if tipdoc<> "" and docu<> "" then
	dw_empac.retrieve(tipdoc,docu)
	if dw_empac.rowcount()=0 then 
		messagebox("Advertencia","Paciente no tiene empresa asignada, asignele una en la ficha de Datos generales del Paciente")
		cb_nhis.enabled=false
	else
		cb_nhis.enabled=true
	end if
	prof = w_principal.dw_profe.getitemstring(1,1)
	espe = w_principal.dw_profe.getitemstring(1,'cesp')
	if prof='' or isnull(prof) or espe='' or isnull(espe) then
		messagebox("Atención","Debe escoger profesional para poder continuar")
		return
	else
		SELECT Profe.PersoAtiende into :atiend
		FROM Profe
		WHERE Profe.CodProf=:prof;
		t1.ps.uo_s.cambia_prof_espe(prof,espe,atiend)
	end if

	t1.ps.uo_s.cambia_emppac(dw_empac)
	dw_historial.Retrieve(tipdoc,docu,'6')
	t1.p3.dw_a.Retrieve(tipdoc,docu)
	t1.p1.dw_p.Retrieve(w_principal.dw_1.GetItemNumber(1,'dias'),w_principal.dw_1.GetItemString(1,'sexo'),tipdoc,docu)
	t1.pc.dw_c.GetChild('codcondicion',dw_cond)
	dw_cond.SetTransObject(SQLCA)
	dw_cond.SetFilter("sexo='"+ w_principal.dw_1.getitemstring(1,'sexo') + "' or sexo = 'T'")
	dw_cond.Filter()
	dw_cond.Retrieve()
	t1.pc.dw_c.Retrieve(tipdoc,docu)
end if

end event

event activate;w_principal.dw_profe.Visible = TRUE
end event

event deactivate;w_principal.dw_profe.Visible = FALSE
end event

type st_3 from statictext within w_pyp_pac
integer x = 2245
integer y = 4
integer width = 1326
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Ingresos Anteriores del Paciente"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_historial from datawindow within w_pyp_pac
integer x = 2245
integer y = 68
integer width = 1326
integer height = 376
integer taborder = 20
string title = "none"
string dataobject = "dw_historial_pyp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if this.GetRow() <> row then
	this.SetRow(Row)
end if

end event

event constructor;this.settransobject(sqlca)
end event

event rowfocuschanged;long ll_servs,dif

t1.ps.uo_s.Reset()
if RowCount() = 0 or currentrow = 0 then Return

if not isNull(GetItemNumber(getrow(),'contador')) then
	dif	=SecondsAfter(time(getitemdatetime(this.getrow(),"fecha")),time(now()))/60
	t1.ps.uo_s.Retrieve(GetItemNumber(getrow(),'contador'),GetItemString(getrow(),'clugar'),dif,'P')
	long nnulo
	string snulo
	setnull(nnulo)
	setnull(snulo)
	t1.psf.uo_sf.Retrieve(GetItemNumber(getrow(),'contador'),GetItemString(getrow(),'clugar'),prof,nnulo,snulo,'1',nnulo,snulo,nnulo,snulo)	
end if

end event

type st_12 from statictext within w_pyp_pac
integer x = 5
integer y = 4
integer width = 2222
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Empresas del Paciente:"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_empac from datawindow within w_pyp_pac
integer x = 5
integer y = 68
integer width = 2222
integer height = 376
integer taborder = 10
string dragicon = "none!"
string title = "Empresas del Paciente:"
string dataobject = "dw_empacguarda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

event rowfocuschanged;long fila
fila = this.Getrow()
this.SelectRow(fila,false)

end event

type t1 from tab within w_pyp_pac
integer x = 46
integer y = 496
integer width = 3511
integer height = 1324
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
ps ps
p3 p3
psf psf
pc pc
end type

on t1.create
this.p1=create p1
this.ps=create ps
this.p3=create p3
this.psf=create psf
this.pc=create pc
this.Control[]={this.p1,&
this.ps,&
this.p3,&
this.psf,&
this.pc}
end on

on t1.destroy
destroy(this.p1)
destroy(this.ps)
destroy(this.p3)
destroy(this.psf)
destroy(this.pc)
end on

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 3474
integer height = 1196
long backcolor = 67108864
string text = "Plan Pendiente"
long tabtextcolor = 33554432
string picturename = "asig_cita.ico"
long picturemaskcolor = 536870912
pb_1 pb_1
dw_p dw_p
end type

on p1.create
this.pb_1=create pb_1
this.dw_p=create dw_p
this.Control[]={this.pb_1,&
this.dw_p}
end on

on p1.destroy
destroy(this.pb_1)
destroy(this.dw_p)
end on

type pb_1 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 3232
integer y = 80
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
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Realizar Acción"
end type

event clicked;integer f, fila
long contador, servicio, nulo
string lugar, valor
boolean inserta

f = dw_p.Find("selec=1",1,dw_p.RowCount())
if f = 0 then Return -1

if dw_historial.RowCount() = 0 then
	if messageBox('Aviso','No existen ingresos. Desea insertar uno?',Question!,YESNO!) = 2 then Return
	inserta = TRUE
elseif date(dw_historial.GetItemDateTime(dw_historial.GetRow(),'fecha')) <> today() then
	if messageBox('Aviso','El ingreso es de una fecha anterior. Desea insertar uno?',Question!,YESNO!) = 1 then Inserta = TRUE	
end if	
if inserta then
	if cb_nhis.Event clicked() = -1 then Return
end if

contador = dw_historial.GetItemNumber(dw_historial.GetRow(),'contador')
lugar = dw_historial.GetItemString(dw_historial.GetRow(),'clugar')
//tipo_fac=
setNull(nulo)
do while f > 0
	servicio = t1.ps.uo_s.f_insert_servicio(dw_p.GetItemString(f,'proced'),'','','',nulo,'',nulo,nulo,'',nulo,nulo,'','','','','','','0','')
	if servicio >= 1 then
		valor = t1.p3.dw_a.Describe("Evaluate('max(numatencion)',0)")
		t1.p3.dw_a.InsertRow(1)
		t1.p3.dw_a.SetItem(1,'tipodoc',tipdoc)
		t1.p3.dw_a.SetItem(1,'documento',docu)
		t1.p3.dw_a.SetItem(1,'cod_prodpyp',dw_p.GetItemString(f,'cod_prodpyp'))
		t1.p3.dw_a.SetItem(1,'accion_item',dw_p.GetItemNumber(f,'accion_item'))
		t1.p3.dw_a.SetItem(1,'numatencion',long(valor) + 1)
		t1.p3.dw_a.SetItem(1,'contador',contador)
		t1.p3.dw_a.SetItem(1,'clugar_his',Lugar)
		t1.p3.dw_a.SetItem(1,'nservicio',servicio)
		t1.p3.dw_a.SetItem(1,'fecha',today())
		t1.p3.dw_a.SetItem(1,'cantidad',dw_p.GetItemNumber(f,'cantidaddosis'))		
	else
		rollback;
		Return -1
	end if

	dw_p.SetItem(f,'selec',0)
	if f = dw_p.RowCount() then EXIT
	f = dw_p.Find("selec=1",f+1,dw_p.RowCount())
loop

if t1.p3.dw_a.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
t1.p3.dw_a.Retrieve(tipdoc,docu)
t1.p1.dw_p.Retrieve(w_principal.dw_1.GetItemNumber(1,'dias'),w_principal.dw_1.GetItemString(1,'sexo'),tipdoc,docu)
Return 0

end event

type dw_p from datawindow within p1
integer x = 59
integer y = 84
integer width = 3122
integer height = 1032
integer taborder = 30
string title = "none"
string dataobject = "dw_pyp_pendiente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event retrieverow;integer fila, cantidad=0, itemacc
string codacc

codacc = GetItemString(row,'cod_prodpyp')
itemacc = GetItemNumber(row,'accion_item')
if t1.p3.dw_a.RowCount() = 0 then Return
fila = t1.p3.dw_a.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),1,t1.p3.dw_a.RowCount())
Do While fila > 0 
	cantidad = cantidad + t1.p3.dw_a.GetItemNumber(fila,'cantidad')
	if fila = t1.p3.dw_a.RowCount() then EXIT
	fila = t1.p3.dw_a.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),fila + 1,t1.p3.dw_a.RowCount())
Loop

if cantidad > 0 and cantidad >= GetItemNumber(row,'cantidad') then
	DeleteRow(row)
else
	if not isNull(GetItemDateTime(row,'fcondicion')) then
		datetime dt
		long dr
		dt = GetItemDateTime(row,'fcondicion')
		dr = GetItemNumber(row,'duracion')
		if ( dr > 0 and RelativeDate(date(dt),dr) > today() ) or GetItemString(row,'estado') ='0' then
			DeleteRow(row)
		end if
	end if
end if

end event

type ps from userobject within t1
integer x = 18
integer y = 112
integer width = 3474
integer height = 1196
long backcolor = 67108864
string text = "Servicios"
long tabtextcolor = 33554432
string picturename = "medico.ico"
long picturemaskcolor = 536870912
uo_s uo_s
end type

on ps.create
this.uo_s=create uo_s
this.Control[]={this.uo_s}
end on

on ps.destroy
destroy(this.uo_s)
end on

type uo_s from uo_serv_ing within ps
integer x = 23
integer y = 52
integer taborder = 30
string i_indapdx = "6"
string tipo_ingres = "1"
end type

on uo_s.destroy
call uo_serv_ing::destroy
end on

type p3 from userobject within t1
integer x = 18
integer y = 112
integer width = 3474
integer height = 1196
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
integer width = 3474
integer height = 1196
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
integer x = 18
integer y = 112
integer width = 3474
integer height = 1196
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
integer x = 2405
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
integer x = 123
integer y = 124
integer width = 2231
integer height = 908
integer taborder = 50
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

type cb_delhis from picturebutton within w_pyp_pac
event mousemove pbm_mousemove
integer x = 3415
integer y = 464
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
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Ingreso [Alt+B]"
end type

event clicked;if dw_historial.RowCount() = 0 then Return

dw_historial.deleterow(0)
if dw_historial.update()<1 then 
	rollback;
	dw_historial.Retrieve(tipdoc,docu,'6')
else
	commit;
end if
dw_historial.PostEvent(RowFocusChanged!)

end event

type cb_nhis from picturebutton within w_pyp_pac
event mousemove pbm_mousemove
integer x = 3269
integer y = 464
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
string text = "        &a"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Ingreso [Alt+A]"
end type

event clicked;if not f_hasta() then 
	messagebox("Atención","Su periodo de validez ha caducado, comuníquese con GCI Ltda. para reactivarlo")
	return
end if
long fila, contador

if dw_empac.rowcount() < 1 then Return
dw_historial.Insertrow(1)
//SELECT max( Historial.Contador) into :contador FROM Historial where clugar=:clugar;
//if isnull(contador) then contador=0
//contador++
contador=f_trae_ndoc('HIS',clugar,'Historial')
dw_historial.setitem(1,"fecha",datetime(today(),time(string(now()))))
dw_historial.setitem(1,"tipodoc",tipdoc)
dw_historial.setitem(1,"documento",docu)
dw_historial.setitem(1,"indapdx",'6')
dw_historial.setitem(1,"contador",contador)
dw_historial.setitem(1,"clugar",clugar)
if dw_historial.update()=-1 then
	dw_historial.deleterow(1)
	rollback;
	Return -1
else
	commit;
	dw_historial.scrolltorow(1)
	dw_historial.triggerevent(rowfocuschanged!)
end if

Return 0

end event

