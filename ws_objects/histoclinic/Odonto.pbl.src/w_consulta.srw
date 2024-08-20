$PBExportHeader$w_consulta.srw
forward
global type w_consulta from window
end type
type pb_pyp from picturebutton within w_consulta
end type
type pb_notas from picturebutton within w_consulta
end type
type pb_print from picturebutton within w_consulta
end type
type cb_2 from picturebutton within w_consulta
end type
type cb_1 from picturebutton within w_consulta
end type
type dw_historial from datawindow within w_consulta
end type
type st_3 from statictext within w_consulta
end type
type st_12 from statictext within w_consulta
end type
type dw_empac from datawindow within w_consulta
end type
type t1 from tab within w_consulta
end type
type ps from userobject within t1
end type
type uo_s from uo_serv_ing within ps
end type
type ps from userobject within t1
uo_s uo_s
end type
type p2 from userobject within t1
end type
type uo_1 from uo_hclin within p2
end type
type dw_tmpcons from datawindow within p2
end type
type pb_2 from picturebutton within p2
end type
type st_1 from statictext within p2
end type
type dwc_consult from datawindow within p2
end type
type p2 from userobject within t1
uo_1 uo_1
dw_tmpcons dw_tmpcons
pb_2 pb_2
st_1 st_1
dwc_consult dwc_consult
end type
type p3 from userobject within t1
end type
type pb_abre from picturebutton within p3
end type
type dw_cpo from datawindow within p3
end type
type pb_6 from pb_report within p3
end type
type st_4 from statictext within p3
end type
type pb_7 from picturebutton within p3
end type
type pb_3 from picturebutton within p3
end type
type cb_grabar from picturebutton within p3
end type
type cb_tratamiento from picturebutton within p3
end type
type pb_1 from picturebutton within p3
end type
type uo_od from uo_odontograma within p3
end type
type gb_1 from groupbox within p3
end type
type p3 from userobject within t1
pb_abre pb_abre
dw_cpo dw_cpo
pb_6 pb_6
st_4 st_4
pb_7 pb_7
pb_3 pb_3
cb_grabar cb_grabar
cb_tratamiento cb_tratamiento
pb_1 pb_1
uo_od uo_od
gb_1 gb_1
end type
type psf from userobject within t1
end type
type uo_sf from uo_orden_formula within psf
end type
type psf from userobject within t1
uo_sf uo_sf
end type
type t1 from tab within w_consulta
ps ps
p2 p2
p3 p3
psf psf
end type
type dw_segrespon from datawindow within w_consulta
end type
end forward

global type w_consulta from window
integer width = 6194
integer height = 2100
boolean titlebar = true
string title = "Odontología - Consulta"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean toolbarvisible = false
pb_pyp pb_pyp
pb_notas pb_notas
pb_print pb_print
cb_2 cb_2
cb_1 cb_1
dw_historial dw_historial
st_3 st_3
st_12 st_12
dw_empac dw_empac
t1 t1
dw_segrespon dw_segrespon
end type
global w_consulta w_consulta

type variables
int xant,yant
long i_contador
String cLugar_ohis, clugar_odongr, cpAnt,i_profe,i_espe,i_atiende,i_plantilla,i_codfina
string l_odo
uo_dentaldwc pieza[52]
m_procedimientos m_proc
st_fact st_f
boolean cambia
Datawindowchild tip_diag, causa_ext
datastore dr_ord_serv, dr_formula
end variables

forward prototypes
public function string getfigura (integer pcuadrante, integer psuperficie)
public function long cambia_prof_espe (string p_prof, string p_espe)
end prototypes

public function string getfigura (integer pcuadrante, integer psuperficie);string superf

if pSuperficie = 1 then
	if (pCuadrante = 1) or (pCuadrante = 2) or (pCuadrante = 5) or (pCuadrante = 6)then
		superf = 'rr_1'
	else
		superf = 'rr_4'
	end if
elseif pSuperficie = 2 then
	if (pCuadrante = 1) or (pCuadrante = 4) or (pCuadrante = 5) or (pCuadrante = 8) then
		superf = 'rr_2'
	else
		superf = 'rr_3'
	end if
elseif pSuperficie = 3 then
	if (pCuadrante = 1) or (pCuadrante = 4) or (pCuadrante = 5) or (pCuadrante = 8) then
		superf = 'rr_3'
	else
		superf = 'rr_2'
	end if
elseif pSuperficie = 4 then
	if (pCuadrante = 1) or (pCuadrante = 2) or (pCuadrante = 5) or (pCuadrante = 6)then
		superf = 'rr_4'
	else
		superf = 'rr_1'
	end if
elseif pSuperficie = 5 then
	superf = 'rr_5'
end if

return superf
end function

public function long cambia_prof_espe (string p_prof, string p_espe);i_profe=p_prof
i_espe=p_espe
t1.ps.uo_s.cambia_prof_espe(i_profe,i_espe,i_atiende)
return t1.p2.uo_1.f_cambia_espe(i_espe)
end function

on w_consulta.create
this.pb_pyp=create pb_pyp
this.pb_notas=create pb_notas
this.pb_print=create pb_print
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_historial=create dw_historial
this.st_3=create st_3
this.st_12=create st_12
this.dw_empac=create dw_empac
this.t1=create t1
this.dw_segrespon=create dw_segrespon
this.Control[]={this.pb_pyp,&
this.pb_notas,&
this.pb_print,&
this.cb_2,&
this.cb_1,&
this.dw_historial,&
this.st_3,&
this.st_12,&
this.dw_empac,&
this.t1,&
this.dw_segrespon}
end on

on w_consulta.destroy
destroy(this.pb_pyp)
destroy(this.pb_notas)
destroy(this.pb_print)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_historial)
destroy(this.st_3)
destroy(this.st_12)
destroy(this.dw_empac)
destroy(this.t1)
destroy(this.dw_segrespon)
end on

event open;dw_historial.Reset()
dw_empac.reset()
t1.ps.uo_s.reset()
t1.psf.uo_sf.reset()
i_profe=w_principal.dw_odprofe.getitemstring(1,1)
i_espe=w_principal.dw_odprofe.getitemstring(1,'cesp')
if i_profe='' or isnull(i_profe) or i_espe='' or isnull(i_espe) then
	messagebox("Atención","Debe escoger profesional para poder continuar")
	i_contador=-1
	return
else
	SELECT Profe.PersoAtiende into :i_atiende
	FROM Profe
	WHERE Profe.CodProf=:i_profe;
	t1.ps.uo_s.cambia_prof_espe(i_profe,i_espe,i_atiende)
end if
i_contador = -1 //para no cargar las otras datawindows
if tipdoc<> "" and docu<> "" then
	dw_empac.retrieve(tipdoc,docu)
	if dw_empac.rowcount()=0 then 
		messagebox("Advertencia","Paciente no tiene empresa asignada, asignele una en la ficha de Datos generales del Paciente")
		cb_1.enabled=false
	else
		cb_1.enabled=true
	end if
	t1.ps.uo_s.cambia_emppac(dw_empac)
	dw_historial.Retrieve(tipdoc,docu,'5')
end if

SELECT cadena into :l_odo
FROM parametros_gen
WHERE (((codigo_para)=44));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 44')
	return 
end if

end event

event activate;w_principal.dw_odprofe.visible=TRUE
cb_1.enabled=true
cb_2.enabled=true
pb_notas.enabled=true
t1.ps.uo_s.enabled=true
t1.p2.uo_1.enabled=true
t1.psf.uo_sf.enabled=true
t1.p3.uo_od.enabled=true
end event

event deactivate;w_principal.dw_odprofe.visible=FALSE
cb_1.enabled=false
cb_2.enabled=false
pb_notas.enabled=false
t1.ps.uo_s.enabled=false
t1.p2.uo_1.enabled=false
t1.psf.uo_sf.enabled=false
t1.p3.uo_od.enabled=false
end event

event closequery;if t1.p3.uo_od.Modified() then
	int ret
	ret = MessageBox('Aviso','Ha cambiado el odontograma. Desea guarda los cambios?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return t1.p3.pb_7.Event clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

event resize;t1.resize(newwidth - 20 , newheight - t1.y)
t1.p2.uo_1.tamanyo(newwidth - 70,newheight - t1.y - 140)
end event

type pb_pyp from picturebutton within w_consulta
integer x = 2816
integer y = 456
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &p"
boolean originalsize = true
string picturename = "pyp.gif"
alignment htextalign = left!
string powertiptext = "Promoción y Prevención [Alt+P]"
end type

event clicked;if dw_historial.rowcount()=0 then return
st_notas st
st.contador=dw_historial.getitemnumber(dw_historial.getrow(),'contador')
st.clugar=dw_historial.getitemstring(dw_historial.getrow(),'clugar')
st.profe=i_profe
openwithparm(w_pyp_pacos,st)
end event

type pb_notas from picturebutton within w_consulta
integer x = 2962
integer y = 456
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Notas del Paciente en este Ingreso"
end type

event clicked;if dw_historial.rowcount()=0 then return
st_notas st_not
st_not.ventana='ODON'
st_not.contador=dw_historial.getitemnumber(dw_historial.getrow(),'contador')
st_not.clugar=dw_historial.getitemstring(dw_historial.getrow(),'clugar')
st_not.profe=w_principal.dw_odprofe.getitemstring(1,1)
openwithparm(w_notaspac,st_not)
end event

type pb_print from picturebutton within w_consulta
event mousemove pbm_mousemove
integer x = 3109
integer y = 456
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "print.GIF"
string disabledname = "d_print.gif"
alignment htextalign = left!
string powertiptext = "Imprimir Historia Clínica"
end type

event clicked;trae historial
if dw_historial.rowcount()>0 then 
	historial.numero=dw_historial.getitemnumber(dw_historial.getrow(),'contador')
	historial.lugar=dw_historial.getitemstring(dw_historial.getrow(),'clugar')
	historial.tingres='1'
else
	return
end if

openwithparm(w_print_histor_txt,historial)


end event

type cb_2 from picturebutton within w_consulta
event mousemove pbm_mousemove
integer x = 3401
integer y = 456
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Ingreso [Alt+B]"
end type

event clicked;if i_contador = -1 or dw_historial.rowcount()=0 then return
if w_principal.dw_1.getitemstring(1,'estado')='1' then
  messagebox("Atención","Este Paciente esta Fallecido no puede eliminar servicios")
  return
end if
if t1.p2.dwc_consult.GetRow() > 0 and not isNull(t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')) then
	t1.p2.dwc_consult.DeleteRow(0)
	if t1.p2.dwc_consult.update()<1 then 
		rollback;
	end if
end if
dw_historial.deleterow(0)

if dw_historial.update()<1 then 
	rollback;
	dw_historial.retrieve(tipdoc,docu,'5')
else
	commit;
end if
dw_historial.TriggerEvent(rowfocuschanged!)

end event

type cb_1 from picturebutton within w_consulta
event mousemove pbm_mousemove
integer x = 3255
integer y = 456
integer width = 146
integer height = 128
integer taborder = 30
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
if not f_demo('pac') then return
//////////// ojo para que no metan goles 
if w_principal.dw_1.getitemstring(1,'estado')='1' then
  messagebox("Atención","Este Paciente esta Fallecido no puede adicionar servicios")
  return
end if
long este,fila, contador
setnull(este)
//if isvalid(w_citas_asig) then
//	if w_citas_asig.lb_odont=false then
//		select nodontograma into :este from odongramacb where tipodoc=:tipdoc and documento =:docu and estado='0';
//		if not isnull(este) then 
//			messagebox("Atención","Este paciente tiene un odontograma Abierto")
//			return -1
//		end if
//	end if
//else
//
//end if
if i_contador = -1 and dw_historial.rowcount() <> 0 then return
if dw_empac.rowcount() < 1 then return
dw_historial.insertrow(1)
contador=f_trae_ndoc('HIS',clugar,'Historial')
dw_historial.setitem(1,"fecha",datetime(today(),time(string(now()))))
dw_historial.setitem(1,"tipodoc",tipdoc)
dw_historial.setitem(1,"documento",docu)
dw_historial.setitem(1,"indapdx",'5')
dw_historial.setitem(1,"odontologia",'0')
fila = dw_empac.getRow()
dw_historial.setitem(1,"contador",contador)
dw_historial.setitem(1,"clugar",clugar)
if dw_historial.update()=-1 then
	dw_historial.deleterow(fila)
	rollback;
	Return -1
else
	commit;
	dw_historial.scrolltorow(1)
	dw_historial.triggerevent(rowfocuschanged!)
//	select nodontograma into :este from odongramacb where tipodoc=:tipdoc and documento =:docu and estado='0';
//	if not isnull(este) then 
//	 	update odongramacb set contador=:contador,clugar_his=:clugar where tipodoc=:tipdoc and documento =:docu and estado='0';
//		if sqlca.sqlcode=-1 then 
//			messagebox("Error actualzoiando historial en odontogramacb",sqlca.sqlerrtext)
//			rollback;
//			return
//		end if
//	end if	
//	commit;
end if
if t1.p2.dwc_consult.RowCount() = 0 then
	fila = t1.p2.dwc_consult.InsertRow(0)
else
	fila = t1.p2.dwc_consult.GetRow()
end if
t1.p2.dwc_consult.SetItem(fila,'documento',Docu)
t1.p2.dwc_consult.SetItem(fila,'tipodoc',tipDoc)
t1.p2.dwc_consult.SetItem(fila,'clugar',clugar)
t1.p2.dwc_consult.SetItem(fila,'Estado','0')
t1.p2.dwc_consult.SetItem(fila,'contador',contador)
t1.p2.dwc_consult.SetItem(fila,'clugar_his',clugar)
t1.p2.dwc_consult.SetItem(fila,'Fecha',datetime(today()))
t1.p2.dwc_consult.SetItem(fila,'codprof',w_principal.dw_odprofe.GetItemString(1,1))

i_contador = contador

string prof, esp
prof = w_principal.dw_odprofe.GetItemString(1,1)
esp = w_principal.dw_odprofe.GetItemString(1,2)
dw_historial.TriggerEvent(rowfocuschanged!)
Return 1
end event

type dw_historial from datawindow within w_consulta
integer x = 3712
integer y = 60
integer width = 2085
integer height = 376
integer taborder = 20
string title = "none"
string dataobject = "dw_historial_cons"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event rowfocuschanged;t1.p2.dwc_consult.Reset()
t1.ps.uo_s.Reset()
t1.p2.dw_tmpcons.Reset()
t1.psf.uo_sf.Reset()
t1.p2.uo_1.Reset()
if this.getrow() < 1 then
	i_contador=-1
else
	string prof, esp, codplantilla
	long fila,ll_servs,dif
	prof = w_principal.dw_odprofe.GetItemString(1,1)
	esp = w_principal.dw_odprofe.GetItemString(1,2)
	this.selectrow(0,False)
	this.selectrow(this.getrow(),True)
	i_contador = this.getitemnumber(this.getrow(),"contador")
	clugar_ohis = this.getitemstring(this.getrow(),"clugar")
	clugar_odongr = clugar_ohis
	dif	=f_dif_fecha_minutos(getitemdatetime(this.getrow(),"fecha"),datetime(today(),now()))
	ll_servs=t1.ps.uo_s.retrieve(i_contador,clugar_ohis,dif,'O')
	if isNull(codplantilla) then codplantilla = ''
	if t1.p2.dwc_consult.retrieve(i_contador, clugar_ohis) = 0 then
		t1.p3.st_4.Text = 'Estado: Abierto'
		if not isNull(this.getitemnumber(this.getrow(),"contador")) then			
			fila = t1.p2.dwc_consult.InsertRow(0)
			t1.p2.dwc_consult.SetItem(fila,'documento',Docu)
			t1.p2.dwc_consult.SetItem(fila,'tipodoc',tipDoc)
			t1.p2.dwc_consult.SetItem(fila,'clugar',clugar)
			t1.p2.dwc_consult.SetItem(fila,'Estado','0')
			t1.p2.dwc_consult.SetItem(fila,'contador',i_contador)
			t1.p2.dwc_consult.SetItem(fila,'clugar_his',clugar_ohis)
			t1.p2.dwc_consult.SetItem(fila,'Fecha',datetime(today(),now()))
			t1.p2.dwc_consult.SetItem(fila,'codprof',w_principal.dw_odprofe.GetItemString(1,1))
		end if
	end if
	string snulo
	long nnulo
	setnull(snulo)
	setnull(nnulo)
	t1.psf.uo_sf.Retrieve(i_contador, clugar_ohis,i_profe,nnulo,snulo,'1',nnulo,snulo,nnulo,esp)	
	t1.p2.dw_tmpcons.InsertRow(1)
	if t1.SelectedTab = 3 then
		w_consulta.ChangeMenu(m_proc)
		w_consulta.SetToolbar(1, TRUE, floating!)
		w_consulta.SetToolbarPos ( 1, 10, 350, 2000, 300 )
	end if
	t1.p3.dw_cpo.retrieve(i_contador,clugar_ohis)

	if  (ll_servs >0 ) and dif<=60  then 
		i_plantilla='1'
	else
		i_plantilla='0'
	end if
end if
if isvalid(w_citas_asig) then
	i_codfina=w_citas_asig.dw_citas.getitemstring(w_citas_asig.dw_citas.getrow(),'cod_fina')
end if
t1.p2.uo_1.retrieve(i_contador, clugar_ohis,'O','1','',i_espe,dw_empac.getitemstring(dw_empac.getrow(),'codemp'),dw_empac.getitemstring(dw_empac.getrow(),'codcontrato'),i_profe,0,'',i_plantilla,i_codfina)

end event

event clicked;if this.GetRow() <> row then
	this.SetRow(Row)
end if

end event

event rowfocuschanging;if t1.p2.uo_1.event closequery()=1 then return 1
if t1.p3.uo_od.Modified() then
	int ret
	ret = MessageBox('Aviso','Ha cambiado el odontograma. Desea guarda los cambios?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return t1.p3.pb_7.Event clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

type st_3 from statictext within w_consulta
integer x = 3717
integer width = 2071
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

type st_12 from statictext within w_consulta
integer x = 14
integer y = 4
integer width = 3657
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Empresa del Paciente:"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_empac from datawindow within w_consulta
integer x = 14
integer y = 68
integer width = 3662
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

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

event rowfocuschanging;long fila
fila=this.getrow()
this.selectrow(fila,false)
end event

event constructor;this.settransobject(sqlca)
end event

type t1 from tab within w_consulta
integer x = 23
integer y = 500
integer width = 5806
integer height = 1420
integer taborder = 50
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
ps ps
p2 p2
p3 p3
psf psf
end type

on t1.create
this.ps=create ps
this.p2=create p2
this.p3=create p3
this.psf=create psf
this.Control[]={this.ps,&
this.p2,&
this.p3,&
this.psf}
end on

on t1.destroy
destroy(this.ps)
destroy(this.p2)
destroy(this.p3)
destroy(this.psf)
end on

event selectionchanged;if newindex = 3 and dw_historial.RowCount() > 0 then
	if w_consulta.menuname<>'m_procedimientos' then 
		w_consulta.ChangeMenu(m_proc)
		w_consulta.SetToolbar(1, TRUE, floating!)
		w_consulta.SetToolbarPos ( 1, 10, 350, 2000, 300 )
		f_poblar_odontologia()
	elseif w_consulta.toolbarvisible=false then
		w_consulta.toolbarvisible=true
		w_consulta.ChangeMenu(m_principal)
		f_poblar_menus()
	end if
else
	w_consulta.toolbarvisible=False
	w_consulta.ChangeMenu(m_principal)
	f_poblar_menus()
end if


end event

type ps from userobject within t1
integer x = 18
integer y = 112
integer width = 5769
integer height = 1292
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
integer x = 50
integer y = 12
integer taborder = 110
string i_indapdx = "5"
string tipo_ingres = "1"
end type

on uo_s.destroy
call uo_serv_ing::destroy
end on

event constructor;call super::constructor;ipb_newingre = cb_1

end event

event cambia_diags;call super::cambia_diags;t1.psf.uo_sf.cambia_diags(p_cdiag)
t1.p2.uo_1.refresh_diags()
end event

event cambian_serv;call super::cambian_serv;long ll_servs,l_dif
ll_servs=t1.ps.uo_s.dw_serv_ing.rowcount()
l_dif	=SecondsAfter(time(dw_historial.getitemdatetime(dw_historial.getrow(),"fecha")),time(now()))/60
if l_dif<0 then l_dif=3600
if  (ll_servs >0 ) and l_dif<=30  then 
	i_plantilla='1'
else
	i_plantilla='0'
end if
t1.p2.uo_1.retrieve(i_contador, clugar_ohis,'O','1','',i_espe,dw_empac.getitemstring(dw_empac.getrow(),'codemp'),dw_empac.getitemstring(dw_empac.getrow(),'codcontrato'),i_profe,0,'',i_plantilla,i_codfina)
end event

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5769
integer height = 1292
long backcolor = 67108864
string text = "Registro Odontológico"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
uo_1 uo_1
dw_tmpcons dw_tmpcons
pb_2 pb_2
st_1 st_1
dwc_consult dwc_consult
end type

on p2.create
this.uo_1=create uo_1
this.dw_tmpcons=create dw_tmpcons
this.pb_2=create pb_2
this.st_1=create st_1
this.dwc_consult=create dwc_consult
this.Control[]={this.uo_1,&
this.dw_tmpcons,&
this.pb_2,&
this.st_1,&
this.dwc_consult}
end on

on p2.destroy
destroy(this.uo_1)
destroy(this.dw_tmpcons)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.dwc_consult)
end on

type uo_1 from uo_hclin within p2
integer width = 5737
integer height = 1232
integer taborder = 90
boolean enabled = true
end type

event constructor;call super::constructor;tamanyo(3493,1232)
moverv(400)
datawindow dw
singlelineedit isle_otros
inicia_objs_ordenes(t1.psf.uo_sf.tab_1.tp_1.sle_1,t1.psf.uo_sf.tab_1.tp_2.sle_2,t1.psf.uo_sf.cb_nvorden,dw,isle_otros,isle_otros,i_espe,isle_otros)
end event

on uo_1.destroy
call uo_hclin::destroy
end on

event cambio_diags;call super::cambio_diags;long j
for j=1 to t1.ps.uo_s.dw_serv_ing.rowcount()
	t1.ps.uo_s.dw_serv_ing.event rowfocuschanged(j)
	t1.ps.uo_s.pb_guarda_diags.event clicked()
next

t1.psf.uo_sf.cambia_diags(t1.ps.uo_s.dw_diags.getitemstring(1,'diagprin'))
end event

type dw_tmpcons from datawindow within p2
boolean visible = false
integer x = 1330
integer y = 628
integer width = 1879
integer height = 444
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_consulta"
boolean border = false
boolean livescroll = true
end type

event constructor;this.SetTransObject(SQLCA)
end event

event itemchanged;cambia = TRUE
end event

event retrieveend;setPointer(HourGlass!)
t1.p3.uo_od.Reset()
if this.RowCount() < 1 then Return
t1.p3.uo_od.nOdontograma = this.GetItemNumber(this.GetRow(),'nodontograma')
t1.p3.uo_od.cLugar_odongr = this.GetItemString(this.GetRow(),'clugar')
t1.p3.uo_od.Retrieve(this.GetItemNumber(this.GetRow(),'nodontograma'),this.GetItemString(this.GetRow(),'clugar'))
t1.p3.uo_od.estado = this.GetItemString(this.GetRow(),'estado')
if this.GetItemString(this.GetRow(),'estado') = '0' then
	t1.p3.st_4.Text = 'Estado: Abierto'
elseif this.GetItemString(this.GetRow(),'estado') = '1' then
	t1.p3.st_4.Text = 'Estado: Definitivo'
else
	t1.p3.st_4.Text = 'Estado: Cerrado'
end if
setPointer(Arrow!)

end event

type pb_2 from picturebutton within p2
event mousemove pbm_mousemove
boolean visible = false
integer x = 3209
integer y = 808
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
string text = "        &g"
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Modificar"
end type

event clicked;if dw_tmpcons.AcceptText()=-1 then Return
string texto 
long fila
fila = dwc_consult.GetRow()
//case "Cepilladas al día"
if not IsNull(dw_tmpcons.GetItemNumber(1,'cepilla_dia')) then
	dwc_consult.SetItem(fila,'cepilla_dia',dw_tmpcons.GetItemNumber(1,'cepilla_dia'))
end if
//case "Cepillado-En qué momento"
if not IsNull(dw_tmpcons.GetItemString(1,'cepilla_momento')) then
	texto = dwc_consult.GetItemString(fila,'cepilla_momento')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'cepilla_momento',texto + "~r~n" + string(today()) +': ' + dw_tmpcons.GetItemString(1,'cepilla_momento'))
end if
//case "Usa seda Dental?"
if not IsNull(dw_tmpcons.GetItemString(1,'seda_dental')) then
	dwc_consult.SetItem(fila,'seda_dental',dw_tmpcons.GetItemString(1,'seda_dental'))
end if
//case "Seda-En qué momento"
if not IsNull(dw_tmpcons.GetItemString(1,'seda_momento')) then
	texto = dwc_consult.GetItemString(fila,'seda_momento')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'seda_momento',texto + "~r~n" + string(today()) +': '+ dw_tmpcons.GetItemString(1,'seda_momento'))
end if
//case "Dificultad al Mascar"
if not IsNull(dw_tmpcons.GetItemString(1,'dif_mascar')) then
	texto = dwc_consult.GetItemString(fila,'dif_mascar')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'dif_mascar',texto + "~r~n" + string(today()) +': '+ dw_tmpcons.GetItemString(1,'dif_mascar'))
end if
//case "Anomalías de Dolor"
if not IsNull(dw_tmpcons.GetItemString(1,'ano_dolor')) then
	texto = dwc_consult.GetItemString(fila,'ano_dolor')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'ano_dolor',texto + "~r~n" + string(today()) +': '+ dw_tmpcons.GetItemString(1,'ano_dolor'))
end if
//case "Anomalías de Calcificación"
if not IsNull(dw_tmpcons.GetItemString(1,'ano_calci')) then
	texto = dwc_consult.GetItemString(fila,'ano_calci')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'ano_calci',texto + "~r~n" + string(today()) +': '+ dw_tmpcons.GetItemString(1,'ano_calci'))
end if
//case "Anomalías de Número"
if not IsNull(dw_tmpcons.GetItemString(1,'ano_numero')) then
	texto = dwc_consult.GetItemString(fila,'ano_numero')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'ano_numero',texto + "~r~n" + string(today()) +': '+ dw_tmpcons.GetItemString(1,'ano_numero'))
end if
//case "Anomalías de Forma"
if not IsNull(dw_tmpcons.GetItemString(1,'ano_forma')) then
	texto = dwc_consult.GetItemString(fila,'ano_forma')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'ano_forma',texto + "~r~n" + string(today()) +': '+ dw_tmpcons.GetItemString(1,'ano_forma'))
end if
//case "Clasificación de caries"
if not IsNull(dw_tmpcons.GetItemString(1,'clas_caries')) then
	texto = dwc_consult.GetItemString(fila,'clas_caries')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'clas_caries',texto + "~r~n" + string(today()) +': '+ dw_tmpcons.GetItemString(1,'clas_caries'))
end if
//case "Dientes Sensibles"
if not IsNull(dw_tmpcons.GetItemString(1,'dien_sensible')) then
	texto = dwc_consult.GetItemString(fila,'dien_sensible')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'dien_sensible',texto + "~r~n" + string(today()) +': '+ dw_tmpcons.GetItemString(1,'dien_sensible'))
end if
//case "Fracturas Coronarias"
if not IsNull(dw_tmpcons.GetItemString(1,'fractu_coronaria')) then
	texto = dwc_consult.GetItemString(fila,'fractu_coronaria')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'fractu_coronaria',texto + "~r~n" + string(today()) +': '+ dw_tmpcons.GetItemString(1,'fractu_coronaria'))
end if
//case "Cariados"
//dwc_consult.SetItem(fila,'cariados',dw_tmpcons.GetItemNumber(1,'cariados'))
//case "Obturados"
//dwc_consult.SetItem(fila,'obturados',dw_tmpcons.GetItemNumber(1,'obturados'))
//case "Extraídos"
//dwc_consult.SetItem(fila,'extraidos',dw_tmpcons.GetItemNumber(1,'extraidos'))
//case "Por Extraer"
//dwc_consult.SetItem(fila,'por_extraer',dw_tmpcons.GetItemNumber(1,'por_extraer'))
//case "Total"
//dwc_consult.SetItem(fila,'total_cop',dw_tmpcons.GetItemNumber(1,'total_cop'))
//case "Satisfecho"
if not IsNull(dw_tmpcons.GetItemString(1,'satisfecho')) then
	dwc_consult.SetItem(fila,'satisfecho',dw_tmpcons.GetItemString(1,'satisfecho'))
end if
//case "Observaciones"
if not IsNull(dw_tmpcons.GetItemString(1,'observacion')) then
	texto = dwc_consult.GetItemString(fila,'observacion')
	if isNull(texto) then Texto = ''
	dwc_consult.SetItem(fila,'observacion',texto + "~r~n" + string(today()) +': ' + dw_tmpcons.GetItemString(1,'observacion'))
end if
if dwc_consult.AcceptText() = -1 then
	Return
end if

long codigo
if isNull(dwc_consult.GetItemNumber(dwc_consult.GetRow(),'nOdontograma')) then
	setNull(codigo)
	select max(nOdontograma) into :codigo from odongramacb where clugar=:clugar;
	if isNull(codigo) then codigo = 0
	dwc_consult.SetItem(dwc_consult.GetRow(),'nOdontograma',codigo + 1)
	dwc_consult.setItem(dwc_consult.GetRow(),'fecha',datetime(today()))
	dwc_consult.setItem(dwc_consult.GetRow(),'estado','0')
	t1.p3.uo_od.nOdontograma = codigo + 1
	t1.p3.uo_od.st_2.text = string(codigo + 1)
	t1.p3.st_4.Text = 'Estado: Abierto'
end if

if dwc_consult.Update() = -1 then
	Rollback;
else
	commit;
end if

dw_tmpcons.Reset()
dw_tmpcons.InsertRow(1)

//long i
//string texto
//i = dwc_consult.GetRow()
//if IsNull(dwc_consult.GetItemString(i,cpAnt)) then
//	Texto = string(today()) + ': '+ mle_1.Text
//else
//	Texto = dwc_consult.GetItemString(i,cpAnt) + "~r~n" + string(today()) + ': '+ mle_1.Text
//end if
//dwc_consult.SetItem(i,cpAnt,texto)
//mle_1.Text = ''
//cambia = TRUE

end event

type st_1 from statictext within p2
integer x = 1298
integer y = 64
integer width = 791
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dwc_consult from datawindow within p2
boolean visible = false
integer x = 1330
integer y = 12
integer width = 1879
integer height = 432
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_consulta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
end event

event retrieveend;setPointer(HourGlass!)
t1.p3.uo_od.Reset()
if this.RowCount() < 1 then Return
t1.p3.uo_od.Retrieve(this.GetItemNumber(this.GetRow(),'nodontograma'),this.GetItemString(this.GetRow(),'clugar'))

if this.GetItemString(this.GetRow(),'estado') = '0' then
	t1.p3.st_4.Text = 'Estado: Abierto'
elseif this.GetItemString(this.GetRow(),'estado') = '1' then
	t1.p3.st_4.Text = 'Estado: Definitivo'
else
	t1.p3.st_4.Text = 'Estado: Cerrado'
end if
setPointer(Arrow!)

end event

event itemchanged;cambia = TRUE
end event

type p3 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5769
integer height = 1292
long backcolor = 67108864
string text = "Odontograma"
long tabtextcolor = 33554432
string picturename = "molar3cor.ico"
long picturemaskcolor = 536870912
pb_abre pb_abre
dw_cpo dw_cpo
pb_6 pb_6
st_4 st_4
pb_7 pb_7
pb_3 pb_3
cb_grabar cb_grabar
cb_tratamiento cb_tratamiento
pb_1 pb_1
uo_od uo_od
gb_1 gb_1
end type

on p3.create
this.pb_abre=create pb_abre
this.dw_cpo=create dw_cpo
this.pb_6=create pb_6
this.st_4=create st_4
this.pb_7=create pb_7
this.pb_3=create pb_3
this.cb_grabar=create cb_grabar
this.cb_tratamiento=create cb_tratamiento
this.pb_1=create pb_1
this.uo_od=create uo_od
this.gb_1=create gb_1
this.Control[]={this.pb_abre,&
this.dw_cpo,&
this.pb_6,&
this.st_4,&
this.pb_7,&
this.pb_3,&
this.cb_grabar,&
this.cb_tratamiento,&
this.pb_1,&
this.uo_od,&
this.gb_1}
end on

on p3.destroy
destroy(this.pb_abre)
destroy(this.dw_cpo)
destroy(this.pb_6)
destroy(this.st_4)
destroy(this.pb_7)
destroy(this.pb_3)
destroy(this.cb_grabar)
destroy(this.cb_tratamiento)
destroy(this.pb_1)
destroy(this.uo_od)
destroy(this.gb_1)
end on

type pb_abre from picturebutton within p3
integer x = 4357
integer y = 1060
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "abrir2.gif"
alignment htextalign = left!
end type

event clicked;long codigo,nodontograma,fila
string clugar_od

fila = t1.p2.dwc_consult.GetRow()
nOdontograma = t1.p2.dwc_consult.GetItemNumber(fila,'nOdontograma')
cLugar_od = t1.p2.dwc_consult.GetItemString(fila,'cLugar')

select odongramacb.nodontograma into :codigo
FROM odongramacb INNER JOIN odontratacab ON (odongramacb.nodontograma = odontratacab.nodontograma) AND (odongramacb.clugar = odontratacab.clugar_ocb)
WHERE (((odongramacb.nodontograma)=:nOdontograma ) AND ((odongramacb.clugar)=:cLugar_od ));
if not isnull(codigo) then 
	messagebox("Atención","Este paciente tiene un Tratamiento Abierto")
	return -1
end if

t1.p2.dwc_consult.setItem(t1.p2.dwc_consult.GetRow(),'estado','0')
t1.p3.st_4.Text = 'Estado: Abierto'
if t1.p2.dwc_consult.Update()=-1 then
	dw_historial.TriggerEvent(RowFocusChanged!)
	rollback;
	Return -1
end if
end event

type dw_cpo from datawindow within p3
integer x = 137
integer y = 1048
integer width = 3045
integer height = 204
integer taborder = 20
string title = "none"
string dataobject = "dw_cop"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_6 from pb_report within p3
string tag = "Odontograma Descriptivo"
integer x = 3433
integer y = 1060
integer taborder = 70
string picturename = "print3.GIF"
string disabledname = "d_print3.GIF"
string powertiptext = "Impresión Odontograma"
string cod_rep = "ODO"
string nombre_rep = "Odontograma Descriptivo"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[2]
long Job

par[1]=t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')
par[2]=t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'cLugar')
if isNull(par[1]) then
	messagebox('Aviso','No hay odontograma ')
	Return
else
	Job = PrintOpen( )
	w_consulta.t1.p3.uo_od.Print(Job, 1,1)
	PrintClose(Job)

	imprimir(par,'','0')
end if
end event

type st_4 from statictext within p3
integer x = 3483
integer y = 1204
integer width = 878
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado: "
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_7 from picturebutton within p3
event mousemove pbm_mousemove
integer x = 3589
integer y = 1060
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
string text = "        &g"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "&Guardar Temporalmente"
end type

event clicked;if t1.p2.dwc_consult.rowcount() < 1 then return
if not t1.p3.uo_od.Modified() then Return -1

long codigo,fila, conteo, nodontograma, total, marcas=0
int ret
string clugar_od

if not  isNull(t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')) then
	
	nOdontograma = t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')
	cLugar_od = t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'cLugar')
	
	select nodontograma into :codigo 
	from odongramacb 
	where 
		(((odongramacb.tipodoc)=:tipdoc) AND ((odongramacb.documento)=:docu) 
		AND ((odongramacb.estado)='0') AND ((odongramacb.nodontograma)<>:nOdontograma) 
		AND ((odongramacb.clugar)<>:cLugar_od ));
else
	select nodontograma into :codigo 
	from odongramacb 
	where tipodoc=:tipdoc and documento =:docu and estado='0';
end if
	if codigo>0 then 
		messagebox("Atención","Este paciente tiene un odontograma Abierto")
		return -1
	end if


select  odontratacab.ntratamiento into :codigo 
from  odontratacab
where (((odontratacab.tipodoc)=:tipdoc) AND ((odontratacab.documento)=:docu) 
AND ((odontratacab.estado) in ('0','1')));

if codigo>0 then 
	messagebox("Atención","Este paciente tiene un tratamiento sin Terminar")
	return -1
end if

setnull(nOdontograma)
setnull(cLugar_od)
setNull(codigo)

if isNull(t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')) then
	setNull(codigo)
	select max(nOdontograma) into :codigo from odongramacb where clugar=:clugar;
	if isNull(codigo) then codigo = 0
	t1.p2.dwc_consult.SetItem(t1.p2.dwc_consult.GetRow(),'nOdontograma',codigo + 1)
	t1.p2.dwc_consult.setItem(t1.p2.dwc_consult.GetRow(),'fecha',datetime(today(),now()))
	t1.p2.dwc_consult.setItem(t1.p2.dwc_consult.GetRow(),'estado','0')
	t1.p3.uo_od.nOdontograma = codigo + 1
	t1.p3.uo_od.st_2.text = string(codigo + 1)
	t1.p3.st_4.Text = 'Estado: Abierto'
	if t1.p2.dwc_consult.Update()=-1 then
		rollback;
		Return -1
	end if
else
	if t1.p2.dwc_consult.Update()=-1 then
		dw_historial.TriggerEvent(RowFocusChanged!)
		rollback;
		Return -1
	end if
end if

ret = t1.p3.uo_od.Grabar(FALSE)
if ret = 0 then

	fila = t1.p2.dwc_consult.GetRow()
	nOdontograma = t1.p2.dwc_consult.GetItemNumber(fila,'nOdontograma')
	cLugar_od = t1.p2.dwc_consult.GetItemString(fila,'cLugar')

	
	///PARA INDICE OLEARY
	select count(*) into :marcas from odongrama
	where cod_conven in (21,22) and nodontograma = :nOdontograma and clugar=:clugar_od;
	if isnull(marcas) then marcas=0
	t1.p2.dwc_consult.SetItem(fila,'marca',marcas)
	
	select sum(agrupa_odon.ctos)  into :conteo
	from 
		(  select case when count(*)/5.0>0 then 1 else 0 end as ctos
			from odongrama
			where (((odongrama.cod_conven) in (21,22)) and ((odongrama.nodontograma)=:nodontograma) and ((odongrama.clugar)=:clugar_od))
			group by odongrama.codigo_cuadrante, odongrama.codigo_pieza 
		) as agrupa_odon;
	t1.p2.dwc_consult.SetItem(fila,'num_diente',conteo)
	total = total + conteo
	
 
	if g_motor='postgres' then
		string ls_paso
		long edad 	
		
		edad=w_principal.dw_1.getitemnumber(1,"anyos")
		select f_cop(:edad,:nodontograma,:clugar_od) into :ls_paso from ips;	
	end if

	if t1.p2.dwc_consult.Update()=-1 then
		rollback;
	else
		commit;
	end if

elseif ret = -2 then
	messageBox('Error','El odontograma esta protegido')
	Return -1
else
	messageBox('Error','Error grabando odontograma.')
	rollback;
	Return -1
end if	
t1.p3.dw_cpo.retrieve(i_contador,clugar_ohis)
Return 0

end event

type pb_3 from picturebutton within p3
event mousemove pbm_mousemove
integer x = 3730
integer y = 1060
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
boolean originalsize = true
string picturename = "odontograma.jpg"
alignment htextalign = left!
string powertiptext = "Sugerir Odontograma"
end type

event clicked;long odontograma
string lugar
if uo_od.estado <> '0' then
	messagebox('Aviso','El odontograma esta protegido')
	Return
end if
if t1.p2.dwc_consult.rowcount()=0 then return

long ultimo
if isNull(t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')) then
	t1.p2.pb_2.TriggerEvent(clicked!)
	ultimo = 0
end if
if MessageBox('Aviso','Los procedimientos definidos sobre el actual Odontograma serán borrados. Desea Continuar?',QUESTION!,YESNO!) = 2 then Return
odontograma = t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')
lugar = t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'cLugar')
delete from odongrama where nodontograma=:odontograma and clugar=:lugar;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return
END IF
ultimo = t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')

uo_od.Reset()
uo_od.nOdontograma = t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')
uo_od.cLugar_odongr = t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'clugar')
if uo_od.Sugerir(ultimo) = 0 then
	MessageBox('Aviso','No se encontraron odontogramas anteriores')
end if

end event

type cb_grabar from picturebutton within p3
event mousemove pbm_mousemove
integer x = 4201
integer y = 1060
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
string text = "        &g"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "&Guardar Registro Odontológico - Definitivo"
end type

event clicked;if t1.p2.dwc_consult.rowcount() < 1 then return


/////////////////////////PARA VALIDAR QUE HAGAN HC 
long cuantos
setnull(cuantos)
select count(*) into :cuantos
from hclin_registro
where (((contador)=:i_contador) and ((clugar)=: clugar_ohis) and ((tipo) in ('O')));
IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
	MessageBox('Error',"No se puede guardar hasta que no tenga HC")
	Return -1
END IF
if cuantos=0 then
	MessageBox('Atención',"No se puede guardar hasta que no tenga HC")
	Return -1
end if
/////////////


long codigo,fila, conteo, nodontograma, total, marcas=0
int ret
string clugar_od

if not isNull(t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')) then
	
	nOdontograma = t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')
	cLugar_od = t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'cLugar')
	
	select nodontograma into :codigo 
	from odongramacb 
	where 
		(((odongramacb.tipodoc)=:tipdoc) AND ((odongramacb.documento)=:docu) 
		AND ((odongramacb.estado)='0') AND ((odongramacb.nodontograma)<>:nOdontograma) 
		AND ((odongramacb.clugar)<>:cLugar_od ));
else
	select nodontograma into :codigo 
	from odongramacb 
	where tipodoc=:tipdoc and documento =:docu and estado='0';
end if
	if codigo>0 then 
		messagebox("Atención","Este paciente tiene un odontograma Abierto")
		return -1
	end if

select  odontratacab.ntratamiento into :codigo 
from  odontratacab
where (((odontratacab.tipodoc)=:tipdoc) AND ((odontratacab.documento)=:docu) 
AND ((odontratacab.estado) in ('0','1')));

if codigo>0 then 
	messagebox("Atención","Este paciente tiene un tratamiento sin Terminar")
	return -1
end if

setnull(nOdontograma)
setnull(cLugar_od)
setNull(codigo)

if isNull(t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')) then
	setNull(codigo)
	select max(nOdontograma) into :codigo from odongramacb where clugar=:clugar;
	if isNull(codigo) then codigo = 0
	t1.p2.dwc_consult.SetItem(t1.p2.dwc_consult.GetRow(),'nOdontograma',codigo + 1)
	t1.p2.dwc_consult.setItem(t1.p2.dwc_consult.GetRow(),'fecha',datetime(today(),now()))
	t1.p2.dwc_consult.setItem(t1.p2.dwc_consult.GetRow(),'estado','1')
	t1.p3.uo_od.nOdontograma = codigo + 1
	t1.p3.uo_od.st_2.text = string(codigo + 1)
	if t1.p2.dwc_consult.Update()=-1 then
		t1.p3.st_4.Text = 'Estado: Abierto'
		t1.p2.dwc_consult.setItem(t1.p2.dwc_consult.GetRow(),'estado','0')
		t1.p3.uo_od.estado = t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'estado')
		rollback;
		Return 0
	end if
else
	if t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'estado') = '1' then
		MessageBox('Aviso','El odontograma ya ha sido grabado como Definitivo')
		Return
	end if
	t1.p2.dwc_consult.setItem(t1.p2.dwc_consult.GetRow(),'estado','1')
	t1.p3.st_4.Text = 'Estado: Definitivo'
	if t1.p2.dwc_consult.Update()=-1 then
		dw_historial.TriggerEvent(RowFocusChanged!)
		rollback;
		Return -1
	end if
end if

ret = t1.p3.uo_od.Grabar(TRUE)
if ret = 0 then

	fila = t1.p2.dwc_consult.GetRow()
	nOdontograma = t1.p2.dwc_consult.GetItemNumber(fila,'nOdontograma')
	cLugar_od = t1.p2.dwc_consult.GetItemString(fila,'cLugar')

	///PARA INDICE OLEARY
	select count(*) into :marcas from odongrama
	where cod_conven in (21,22) and nodontograma = :nOdontograma and clugar=:clugar_od;
	if isnull(marcas) then marcas=0
	t1.p2.dwc_consult.SetItem(fila,'marca',marcas)
	
	select sum(agrupa_odon.ctos)  into :conteo
	from 
		(  select case when count(*)/5.0>0 then 1 else 0 end as ctos
			from odongrama
			where (((odongrama.cod_conven) in (21,22)) and ((odongrama.nodontograma)=:nodontograma) and ((odongrama.clugar)=:clugar_od))
			group by odongrama.codigo_cuadrante, odongrama.codigo_pieza 
		) as agrupa_odon;
	t1.p2.dwc_consult.SetItem(fila,'num_diente',conteo)
	total = total + conteo

	if g_motor='postgres' then
		string ls_paso
		long edad 	
		
		edad=w_principal.dw_1.getitemnumber(1,"anyos")
		select f_cop(:edad,:nodontograma,:clugar_od) into :ls_paso from ips;	
	end if
		
	t1.p3.uo_od.estado = '1'
	if t1.p2.dwc_consult.Update()=-1 then
		rollback;
	else
		commit;
	end if
	t1.p3.uo_od.estado = '1'
	t1.p3.st_4.Text = 'Estado: Definitivo'
elseif ret = -2 then
	messageBox('Error','El odontograma esta protegido')
	Return -1
else
	messageBox('Error','Error grabando odontograma.')
	rollback;
	Return -1
end if	
t1.p3.dw_cpo.retrieve(i_contador,clugar_ohis)
Return 0

end event

type cb_tratamiento from picturebutton within p3
event mousemove pbm_mousemove
integer x = 4041
integer y = 1060
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
string picturename = "tratamiento.jpg"
string disabledname = "d_tratamiento.jpg"
alignment htextalign = left!
string powertiptext = "Tratamiento"
end type

event clicked;if t1.p2.dwc_consult.rowcount() < 1 then return
long ntrato, nodongrama
string estado, lugar

if t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'estado') = '0' then
	messageBox('Aviso','El odontograma esta Abierto. Debe cerrarse primero')
	Return -1
end if

nOdongrama = t1.p2.dwc_consult.GetItemNumber(t1.p2.dwc_consult.GetRow(),'nOdontograma')
Lugar = t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'cLugar')

select ntratamiento, estado into :ntrato, :estado from odontratacab
where nodontograma=:nodongrama and clugar_ocb=:lugar;

if isNull(nodongrama) then
	messageBox('Error','No se ha definido un tratamiento desde el sugerido. Haga click sobre el boton "Sugerir Tratamiento"')
else
	opensheet(w_atiendetto,w_principal,4,Layered!)
end if

end event

type pb_1 from picturebutton within p3
event mousemove pbm_mousemove
integer x = 3886
integer y = 1060
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "S"
boolean originalsize = true
string picturename = "tratamiento.jpg"
string disabledname = "d_tratamiento.jpg"
alignment htextalign = left!
string powertiptext = "Sugerir Tratamiento"
end type

event clicked;if t1.p2.dwc_consult.rowcount() < 1 then return
int ret
if t1.p2.dwc_consult.GetItemString(t1.p2.dwc_consult.GetRow(),'estado') = '1' then
	ret = opensheet(w_tratamiento,w_principal,4,Layered!)
else
	messageBox('Aviso','El odontograma esta Abierto. Debe cerrarse primero')
end if

end event

type uo_od from uo_odontograma within p3
integer x = 82
integer y = 48
integer width = 3520
integer height = 956
integer taborder = 40
boolean displayonly = false
end type

on uo_od.destroy
call uo_odontograma::destroy
end on

type gb_1 from groupbox within p3
integer x = 119
integer y = 992
integer width = 4466
integer height = 288
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type psf from userobject within t1
integer x = 18
integer y = 112
integer width = 5769
integer height = 1292
long backcolor = 67108864
string text = "Ordenes/Medicamentos"
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
integer x = 18
integer y = 12
integer taborder = 40
string i_codrep_formula = "FMCE"
string i_codrep_orden = "OSCE"
boolean repord_dialogo = true
boolean repfor_dialogo = true
end type

on uo_sf.destroy
call uo_orden_formula::destroy
end on

event constructor;call super::constructor;init('0')
end event

type dw_segrespon from datawindow within w_consulta
boolean visible = false
integer x = 1294
integer y = 464
integer width = 393
integer height = 108
boolean enabled = false
string title = "none"
string dataobject = "dw_segrespon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTRansObject(SQLCA)
end event

