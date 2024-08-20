$PBExportHeader$w_atiendetto.srw
forward
global type w_atiendetto from window
end type
type dw_1 from datawindow within w_atiendetto
end type
type dw_empac from datawindow within w_atiendetto
end type
type pb_pyp from picturebutton within w_atiendetto
end type
type pb_6 from picturebutton within w_atiendetto
end type
type pb_3 from picturebutton within w_atiendetto
end type
type pb_notas from picturebutton within w_atiendetto
end type
type pb_print from picturebutton within w_atiendetto
end type
type st_1 from statictext within w_atiendetto
end type
type dw_trato from datawindow within w_atiendetto
end type
type t1 from tab within w_atiendetto
end type
type p4 from userobject within t1
end type
type pb_5 from picturebutton within p4
end type
type pb_2 from picturebutton within p4
end type
type pb_4 from picturebutton within p4
end type
type pb_1 from picturebutton within p4
end type
type dw_tratacpo from datawindow within p4
end type
type p4 from userobject within t1
pb_5 pb_5
pb_2 pb_2
pb_4 pb_4
pb_1 pb_1
dw_tratacpo dw_tratacpo
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
type uo_od from uo_odontograma within p3
end type
type p3 from userobject within t1
uo_od uo_od
end type
type psf from userobject within t1
end type
type uo_sf from uo_orden_formula within psf
end type
type psf from userobject within t1
uo_sf uo_sf
end type
type ph from userobject within t1
end type
type uo_hc from uo_hclin within ph
end type
type st_2 from statictext within ph
end type
type ph from userobject within t1
uo_hc uo_hc
st_2 st_2
end type
type t1 from tab within w_atiendetto
p4 p4
ps ps
p3 p3
psf psf
ph ph
end type
type dw_histodon from datawindow within w_atiendetto
end type
type st_3 from statictext within w_atiendetto
end type
type dw_historial from datawindow within w_atiendetto
end type
type dw_getareo from datawindow within w_atiendetto
end type
type dw_segrespon from datawindow within w_atiendetto
end type
type dw_cont_det from datawindow within w_atiendetto
end type
type cb_2 from picturebutton within w_atiendetto
end type
type cb_1 from picturebutton within w_atiendetto
end type
end forward

global type w_atiendetto from window
integer width = 5760
integer height = 1960
boolean titlebar = true
string title = "Odontología - Tratamiento"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "molar3cor.ico"
boolean toolbarvisible = false
dw_1 dw_1
dw_empac dw_empac
pb_pyp pb_pyp
pb_6 pb_6
pb_3 pb_3
pb_notas pb_notas
pb_print pb_print
st_1 st_1
dw_trato dw_trato
t1 t1
dw_histodon dw_histodon
st_3 st_3
dw_historial dw_historial
dw_getareo dw_getareo
dw_segrespon dw_segrespon
dw_cont_det dw_cont_det
cb_2 cb_2
cb_1 cb_1
end type
global w_atiendetto w_atiendetto

type variables
int xant,yant
long i_contador
String cLugar_ohis, clugar_odongr, nautoriza, cpAnt,i_profe,i_espe,i_atiende,i_plantilla,i_codfina
uo_dentaldwc pieza[52]
m_procedimientos m_proc
Datawindowchild tip_diag, causa_ext
st_fact st_f
DataStore dr_ord_serv, dr_formula
end variables

forward prototypes
public function string getfigura (integer pcuadrante, integer psuperficie)
public function integer estadotto (string estado)
public function integer ordenserv ()
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

public function integer estadotto (string estado);string est
long retorno
est = t1.p4.dw_tratacpo.GetItemString(t1.p4.dw_tratacpo.GetRow(),'realizado')
if est = '0' or est = '1' then
	if estado = '4' then
		st_fact st_p
		st_p.dw_source = dw_trato
		st_p.dw_obj = t1.p4.dw_tratacpo
		st_p.contador = 1
		openwithparm(w_addproctto, st_p)
		retorno = Message.DoubleParm
	else
		retorno = 1
	end if
	if retorno = 1 then
		t1.p4.dw_tratacpo.SetItem(t1.p4.dw_tratacpo.GetRow(),'realizado',estado)
		if t1.p4.dw_tratacpo.Update() = -1 then
			Rollback;
			Return -1
		else
			commit;
			t1.p4.dw_tratacpo.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'), dw_trato.GetItemString(dw_trato.GetRow(),'cLugar'))
		end if
	end if
else
	Messagebox('Error','Solo puede cambiarse si esta Pendiente o Incompleto')
	Return -2
end if
Return 0

end function

public function integer ordenserv ();long i, ret
if dw_histodon.RowCount() = 0 then 
	if MessageBox('Aviso','No existen Ingresos. Desea crear uno?',QUESTION!,YESNO!) = 1 then
		cb_1.TriggerEvent(clicked!)
	else
		Return -1
	end if
end if
if t1.p4.dw_tratacpo.Find('atender=1',1,t1.p4.dw_tratacpo.RowCount()) = 0 then Return -1
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
for i = 1 to t1.p4.dw_tratacpo.RowCount()
	if t1.p4.dw_tratacpo.GetItemNumber(i,'atender') = 1 then
//		ret = t1.psf.uo_sf.tab_1.tp_1.dw_oscuerpo.Find("codproced='"+ t1.p4.dw_tratacpo.GetItemString(i,'codproced') +"'",1,t1.psf.uo_sf.tab_1.tp_1.dw_oscuerpo.RowCount())
//		if ret > 0 then
//			t1.psf.uo_sf.tab_1.tp_1.dw_oscuerpo.SetItem(ret,'cantidad',t1.psf.uo_sf.tab_1.tp_1.dw_oscuerpo.GetItemNumber(ret,'cantidad') + 1)
//		else
			ret = t1.psf.uo_sf.Insert_proc(t1.p4.dw_tratacpo.GetItemString(i,'codproced'),1,dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'),dw_trato.GetItemString(dw_trato.GetRow(),'clugar'), t1.p4.dw_tratacpo.GetItemNumber(i,'item'))
			if ret = -1 then
				messageBox('Error','No se agregó procedimiento a Orden de Servicio')
				Return -1
			end if
//		end if
	end if
next
t1.SelectTab("psf")
Return 0

end function

public function long cambia_prof_espe (string p_prof, string p_espe);i_profe=p_prof
i_espe=p_espe
t1.ps.uo_s.cambia_prof_espe(i_profe,i_espe,i_atiende)
return t1.ph.uo_hc.f_cambia_espe(i_espe)
end function

on w_atiendetto.create
this.dw_1=create dw_1
this.dw_empac=create dw_empac
this.pb_pyp=create pb_pyp
this.pb_6=create pb_6
this.pb_3=create pb_3
this.pb_notas=create pb_notas
this.pb_print=create pb_print
this.st_1=create st_1
this.dw_trato=create dw_trato
this.t1=create t1
this.dw_histodon=create dw_histodon
this.st_3=create st_3
this.dw_historial=create dw_historial
this.dw_getareo=create dw_getareo
this.dw_segrespon=create dw_segrespon
this.dw_cont_det=create dw_cont_det
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.dw_empac,&
this.pb_pyp,&
this.pb_6,&
this.pb_3,&
this.pb_notas,&
this.pb_print,&
this.st_1,&
this.dw_trato,&
this.t1,&
this.dw_histodon,&
this.st_3,&
this.dw_historial,&
this.dw_getareo,&
this.dw_segrespon,&
this.dw_cont_det,&
this.cb_2,&
this.cb_1}
end on

on w_atiendetto.destroy
destroy(this.dw_1)
destroy(this.dw_empac)
destroy(this.pb_pyp)
destroy(this.pb_6)
destroy(this.pb_3)
destroy(this.pb_notas)
destroy(this.pb_print)
destroy(this.st_1)
destroy(this.dw_trato)
destroy(this.t1)
destroy(this.dw_histodon)
destroy(this.st_3)
destroy(this.dw_historial)
destroy(this.dw_getareo)
destroy(this.dw_segrespon)
destroy(this.dw_cont_det)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;dw_trato.reset()
t1.ps.uo_s.reset()
t1.psf.uo_sf.reset()
dw_histodon.reset()
if tipdoc<> "" and docu<> "" then
	dw_empac.retrieve(tipdoc,docu)
end if
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
	t1.ph.uo_hc.f_cambia_espe(i_espe)
end if
i_contador = -1 //para no cargar las otras datawindows
if tipdoc<> "" and docu<> "" then
	dw_trato.retrieve(tipdoc,docu)
	if dw_trato.rowcount()=0 then 
		messagebox("Advertencia","El Paciente no tiene Tratamientos asignados")
		cb_1.enabled=false
		t1.enabled=false
	else
		cb_1.enabled=true
		t1.enabled=true
		t1.ps.uo_s.cambia_emppac(dw_empac)
	end if
end if

end event

event activate;w_principal.dw_odprofe.visible=TRUE
cb_1.enabled=true
cb_2.enabled=true
pb_notas.enabled=true
t1.p4.dw_tratacpo.enabled=true
t1.p4.pb_1.enabled=true
t1.p4.pb_4.enabled=true
t1.ps.uo_s.enabled=true
t1.p3.uo_od.enabled=true
t1.psf.uo_sf.enabled=true
t1.ph.uo_hc.enabled=true
pb_3.enabled=true
pb_6.enabled=true

end event

event deactivate;w_principal.dw_odprofe.visible=false
cb_1.enabled=false
cb_2.enabled=false
pb_notas.enabled=false
t1.p4.dw_tratacpo.enabled=false
t1.p4.pb_1.enabled=false
t1.p4.pb_4.enabled=false
t1.ps.uo_s.enabled=false
t1.p3.uo_od.enabled=false
t1.psf.uo_sf.enabled=false
t1.ph.uo_hc.enabled=false
pb_3.enabled=false
pb_6.enabled=false

end event

event resize;t1.resize(newwidth - 20 , newheight - t1.y)
t1.ph.uo_hc.tamanyo(newwidth - 70,newheight - t1.y - 140)
end event

type dw_1 from datawindow within w_atiendetto
boolean visible = false
integer x = 55
integer y = 1828
integer width = 1586
integer height = 96
integer taborder = 40
string title = "none"
string dataobject = "dw_serv_ingre"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_empac from datawindow within w_atiendetto
boolean visible = false
integer x = 2574
integer y = 504
integer width = 201
integer height = 96
integer taborder = 40
string title = "none"
string dataobject = "dw_empacguarda"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_pyp from picturebutton within w_atiendetto
integer x = 2853
integer y = 476
integer width = 146
integer height = 128
integer taborder = 70
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
st.contador=dw_histodon.getitemnumber(dw_histodon.getrow(),'contador')
st.clugar=dw_histodon.getitemstring(dw_histodon.getrow(),'clugar_his')
st.profe=i_profe
openwithparm(w_pyp_pacos,st)
end event

type pb_6 from picturebutton within w_atiendetto
integer x = 2363
integer y = 476
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "abrir2.gif"
alignment htextalign = left!
string powertiptext = "Abrir Tratamiento Odontológico"
end type

event clicked;if dw_trato.rowcount()=0 then return
string actual
actual=dw_trato.getitemstring(dw_trato.getrow(),'estado_odon')
if actual<>'4' then
	messagebox("Atención",'No puede abrir el Tratamiento')
	return
end if
if messagebox("Atención",'Está seguro que desea abrir este Tratamiento ?',question!,yesno!,2)=2 then return
dw_trato.setitem(dw_trato.getrow(),'estado_odon','1')
if dw_trato.update()=-1 then
	dw_trato.setitem(dw_trato.getrow(),'estado_odon',actual)
	rollback;
else
	commit;
end if
end event

type pb_3 from picturebutton within w_atiendetto
integer x = 2213
integer y = 476
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cerrar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar Tratamiento Odontológico"
end type

event clicked;if dw_trato.rowcount()=0 then return
string actual
actual=dw_trato.getitemstring(dw_trato.getrow(),'estado_odon')
if actual='3' or actual='4' or actual='2' then
	messagebox("Atención",'No puede cerrar el Tratamiento')
	return
end if
string nulo
setnull(nulo)
if messagebox("Atención",'Está seguro que desea cerrar este Tratamiento ?',question!,yesno!,2)=2 then return
if dw_trato.getitemstring(dw_trato.getrow(),'ctcontra')='3' then 
	if t1.p4.dw_tratacpo.find('realizado="2"',1,t1.p4.dw_tratacpo.rowcount())>0 then
		openwithparm(w_cual_tot,'T')
		if message.stringparm<>'' then dw_trato.setitem(dw_trato.getrow(),'cod_activid',message.stringparm)
	end if
end if
dw_trato.setitem(dw_trato.getrow(),'estado_odon','4')
if dw_trato.update()=-1 then
	dw_trato.setitem(dw_trato.getrow(),'estado_odon',actual)
	dw_trato.setitem(dw_trato.getrow(),'cod_activid',nulo)
	rollback;
else
	commit;
end if
end event

type pb_notas from picturebutton within w_atiendetto
integer x = 2999
integer y = 476
integer width = 146
integer height = 128
integer taborder = 70
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

event clicked;if dw_histodon.rowcount()=0 then return
st_notas st_not
st_not.ventana='TTO'
st_not.contador=dw_histodon.getitemnumber(dw_histodon.getrow(),'contador')
st_not.clugar=dw_histodon.getitemstring(dw_histodon.getrow(),'clugar_his')
st_not.profe=w_principal.dw_odprofe.getitemstring(1,1)
openwithparm(w_notaspac,st_not)
end event

type pb_print from picturebutton within w_atiendetto
event mousemove pbm_mousemove
integer x = 3141
integer y = 476
integer width = 146
integer height = 128
integer taborder = 70
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
if dw_trato.rowcount()>0 then 
	historial.numero=dw_trato.getitemnumber(dw_trato.getrow(),'contador')
	historial.lugar=dw_trato.getitemstring(dw_trato.getrow(),'clugar')
	historial.tingres='1'
else
	return
end if

openwithparm(w_print_histor_txt,historial)


end event

type st_1 from statictext within w_atiendetto
integer x = 69
integer y = 4
integer width = 2615
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Tratamientos del Paciente"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_trato from datawindow within w_atiendetto
integer x = 69
integer y = 68
integer width = 2615
integer height = 408
integer taborder = 50
string title = "none"
string dataobject = "dw_tratamientocab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_historial.Reset()
dw_histodon.Reset()
t1.p3.uo_od.Reset()
t1.ph.uo_hc.Reset()
if RowCount() < 1 then Return
string prof, esp, codplantilla, lugar
long contador,l_ultimo

prof = w_principal.dw_odprofe.GetItemString(1,1)
esp = w_principal.dw_odprofe.GetItemString(1,2)
dw_cont_det.retrieve(dw_trato.GetItemString(dw_trato.GetRow(),"cemp"),dw_trato.GetItemString(dw_trato.GetRow(),"ccontrato"),"1"/*tipoingreso*/)
dw_histodon.Retrieve(GetItemNumber(GetRow(),'ntratamiento'),GetItemString(GetRow(),'cLugar'))
t1.p4.dw_tratacpo.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'),dw_trato.GetItemString(dw_trato.GetRow(),'cLugar'))
t1.p3.uo_od.nOdontograma = dw_trato.GetItemNumber(GetRow(),'nodontograma')
t1.p3.uo_od.cLugar_odongr =dw_trato. GetItemString(GetRow(),'clugar')

//t1.p3.uo_od.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'nodontograma'),dw_trato.GetItemString(GetRow(),'clugar'))
l_ultimo =0
t1.p3.uo_od.Reset()
t1.p3.uo_od.nOdontograma = dw_trato.GetItemNumber(dw_trato.GetRow(),'nodontograma')
t1.p3.uo_od.cLugar_odongr = dw_trato.GetItemString(dw_trato.GetRow(),'clugar')
t1.p3.uo_od.Sugerir(l_ultimo)
if dw_histodon.rowcount()>0 then
	contador = dw_histodon.GetItemNumber(dw_histodon.GetRow(),'contador')
	lugar = dw_histodon.GetItemString(dw_histodon.GetRow(),'clugar_his')
end if
if isNull(codplantilla) then codplantilla = ''
t1.ph.uo_hc.Retrieve(contador, lugar,'O','1','',esp,getitemstring(getrow(),'cemp'),getitemstring(getrow(),'ccontrato'),prof,0,'','','')  
end event

event constructor;this.SetTransObject(SQLCA)
end event

event retrieveend;this.triggerEvent(rowfocuschanged!)

end event

type t1 from tab within w_atiendetto
integer x = 32
integer y = 500
integer width = 5627
integer height = 1312
integer taborder = 40
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
p4 p4
ps ps
p3 p3
psf psf
ph ph
end type

on t1.create
this.p4=create p4
this.ps=create ps
this.p3=create p3
this.psf=create psf
this.ph=create ph
this.Control[]={this.p4,&
this.ps,&
this.p3,&
this.psf,&
this.ph}
end on

on t1.destroy
destroy(this.p4)
destroy(this.ps)
destroy(this.p3)
destroy(this.psf)
destroy(this.ph)
end on

type p4 from userobject within t1
integer x = 18
integer y = 112
integer width = 5591
integer height = 1184
long backcolor = 67108864
string text = "Tratamiento"
long tabtextcolor = 33554432
string picturename = "coronades16.ico"
long picturemaskcolor = 536870912
pb_5 pb_5
pb_2 pb_2
pb_4 pb_4
pb_1 pb_1
dw_tratacpo dw_tratacpo
end type

on p4.create
this.pb_5=create pb_5
this.pb_2=create pb_2
this.pb_4=create pb_4
this.pb_1=create pb_1
this.dw_tratacpo=create dw_tratacpo
this.Control[]={this.pb_5,&
this.pb_2,&
this.pb_4,&
this.pb_1,&
this.dw_tratacpo}
end on

on p4.destroy
destroy(this.pb_5)
destroy(this.pb_2)
destroy(this.pb_4)
destroy(this.pb_1)
destroy(this.dw_tratacpo)
end on

type pb_5 from picturebutton within p4
integer x = 5312
integer y = 472
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.gif"
alignment htextalign = left!
string powertiptext = "Ver Cotizaciones del Tratamiento"
end type

event clicked;openwithparm(w_cotizaciones,dw_tratacpo)
if message.stringparm='si' then
	dw_tratacpo.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'),dw_trato.GetItemString(dw_trato.GetRow(),'cLugar'))
end if
end event

type pb_2 from picturebutton within p4
integer x = 5312
integer y = 344
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "pesos.gif"
alignment htextalign = left!
string powertiptext = "Cotizar"
end type

event clicked;if dw_trato.rowcount()=0 then return
if isnull(dw_trato.getitemnumber(dw_trato.getrow(),'ntratamiento')) then return
openwithparm(w_cotizar,dw_tratacpo)
if message.stringparm='si' then
	dw_tratacpo.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'),dw_trato.GetItemString(dw_trato.GetRow(),'cLugar'))
end if
end event

type pb_4 from picturebutton within p4
event mousemove pbm_mousemove
integer x = 5312
integer y = 216
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
string text = "        &g"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar procedimientos"
end type

event clicked;if dw_trato.RowCount() = 0 then Return
if dw_trato.GetItemString(dw_trato.GetRow(),'estado_odon') = '2' then
	messageBox('Aviso','El tratamiento ya ha sido Cerrado')
	Return
else
	st_fact st_p
	st_p.dw_source = dw_trato
	st_p.dw_obj = t1.p4.dw_tratacpo
	openwithparm(w_addproctto, st_p)
	dw_trato.retrieve(tipdoc,docu)
end if

end event

type pb_1 from picturebutton within p4
event mousemove pbm_mousemove
integer x = 5312
integer y = 84
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
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Atender"
end type

event clicked;boolean inserta = FALSE
long nulo,lnserv
int fila, i
long contador
if dw_trato.RowCount() < 1 then Return
if dw_trato.GetItemString(dw_trato.GetRow(),'estado_odon') = '2' then
	MessageBox('Aviso','El tratamiento está Terminado')
	Return
end if
if dw_trato.GetItemString(dw_trato.GetRow(),'estado_odon') = '3' then
	MessageBox('Aviso','El tratamiento es Sugerido. Debe ser grabado como Definitivo, para atender sus procedimientos')
	Return
end if
if dw_trato.GetItemString(dw_trato.GetRow(),'estado_odon') = '4' then
	MessageBox('Aviso','El tratamiento está cerrado')
	Return
end if
fila = dw_tratacpo.find("atender=1",1,dw_tratacpo.RowCount())
if fila < 1 then Return
if dw_histodon.RowCount() = 0 then
	if messageBox('Aviso','No existen ingresos. Desea insertar uno?',Question!,YESNO!) = 2 then Return
	inserta = TRUE
else
	if date(dw_histodon.GetItemDateTime(dw_histodon.GetRow(),'fecha')) <> today() then 	Inserta = TRUE	
//	if messageBox('Aviso','El ingreso es de una fecha anterior. Desea insertar uno?',Question!,YESNO!) = 1 then 

end if	
if inserta then
	cb_1.TriggerEvent(clicked!)
end if
setNull(nulo)
for i =  1 to dw_tratacpo.RowCount()
	if dw_tratacpo.GetItemNumber(i,'atender') = 1 and dw_tratacpo.GetItemString(i,'realizado') <> '2' then
		lnserv=t1.ps.uo_s.f_insert_servicio(dw_tratacpo.GetItemString(i,'codproced'),	dw_trato.GetItemString(dw_trato.getrow(),'cemp'),dw_trato.GetItemString(dw_trato.getrow(),'ccontrato'),'',dw_tratacpo.GetItemnumber(i,'nfact'),dw_tratacpo.GetItemString(i,'clugar_fac'),dw_tratacpo.GetItemnumber(i,'item_fac'),nulo,'',nulo,nulo,'','','','',dw_tratacpo.GetItemString(i,'tipo'),dw_tratacpo.GetItemString(i,'autorizacion'),'0','') 
		if lnserv=-1 then
			rollback;
			return -1
		else
			dw_tratacpo.SetItem(i,'realizado','2')
			dw_tratacpo.SetItem(i,'atender',0)
			dw_tratacpo.SetItem(i,'nservicio',lnserv)//t1.ps.uo_s.dw_serv_ing.GetITemNumber(t1.ps.uo_s.dw_serv_ing.GetRow(),'nservicio'))
			dw_tratacpo.SetItem(i,'contador',i_contador)
			dw_tratacpo.SetItem(i,'clugar_his',cLugar_ohis)
			dw_tratacpo.SetItem(i,'codprof',w_principal.dw_odprofe.GetItemString(1,1))
		end if
	end if	
next
fila = dw_tratacpo.Find("realizado < '2'",1,dw_tratacpo.Rowcount())
if fila = 0 then
	if dw_trato.getitemstring(dw_trato.getrow(),'ctcontra')='3' then//los de actividad final FFD
		openwithparm(w_cual_tot,'T')
		if message.stringparm<>'' then dw_trato.setitem(dw_trato.getrow(),'cod_activid',message.stringparm)
	end if
	dw_trato.SetItem(dw_trato.GetRow(),'estado_odon','2')
	dw_trato.SetItem(dw_trato.GetRow(),'fechafin',today())
	if dw_trato.Update() = -1 then
		MessageBox('Error','Error actualizando estado de Tratamiento a Finalizado')
		Rollback;
		Return
	end if
end if
if dw_tratacpo.Update() = -1 then
	rollback;
	Return -1
else
	commit;
end if
t1.SelectTab('ps')
t1.p3.uo_od.Reset()
t1.p3.uo_od.nOdontograma = dw_trato.GetItemNumber(dw_trato.GetRow(),'nodontograma')
t1.p3.uo_od.cLugar_odongr = dw_trato.GetItemString(dw_trato.GetRow(),'clugar')
t1.p3.uo_od.Sugerir(0)
return 1


end event

type dw_tratacpo from datawindow within p4
integer x = 27
integer y = 72
integer width = 5243
integer height = 832
integer taborder = 80
string title = "none"
string dataobject = "dw_tratamientocpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)

end event

event rbuttondown;if row = 0 then Return
this.SetRow(row)
m_estado m_st
m_st = create m_estado
//m_st.PopMenu(w_atiendetto.PointerX() + xpos + 90, w_atiendetto.PointerY() + ypos + 120)
m_st.PopMenu(w_principal.PointerX(), w_principal.PointerY())

end event

type ps from userobject within t1
integer x = 18
integer y = 112
integer width = 5591
integer height = 1184
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
integer x = 46
integer y = 44
integer taborder = 18
string i_indapdx = "5A"
string tipo_ingres = "1"
end type

on uo_s.destroy
call uo_serv_ing::destroy
end on

event borra_serv;call super::borra_serv;dw_trato.setitem(dw_trato.getrow(),'estado_odon','1')
dw_trato.update()
commit;
t1.p4.dw_tratacpo.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'),dw_trato.GetItemString(dw_trato.GetRow(),'cLugar'))

end event

event cambio_tto;call super::cambio_tto;t1.p4.dw_tratacpo.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'),dw_trato.GetItemString(dw_trato.GetRow(),'cLugar'))
if t1.p4.dw_tratacpo.Find("realizado < '2'",1,t1.p4.dw_tratacpo.Rowcount())=0 then
	dw_trato.SetItem(dw_trato.GetRow(),'estado','2')
	dw_trato.SetItem(dw_trato.GetRow(),'fechafin',today())
	if dw_trato.Update() = -1 then
		MessageBox('Error','Error actualizando estado de Tratamiento a Finalizado')
		Rollback;
		Return
	end if
end if
end event

event constructor;call super::constructor;ipb_newingre=cb_1
end event

event cambia_diags;call super::cambia_diags;t1.psf.uo_sf.cambia_diags(p_cdiag)
t1.ph.uo_hc.refresh_diags()
end event

event cambian_serv;call super::cambian_serv;long ll_servs,dif,odon=0
ll_servs=t1.ps.uo_s.dw_serv_ing.rowcount()
dif	=SecondsAfter(time(dw_histodon.getitemdatetime(dw_histodon.getrow(),"fecha")),time(now()))/60
if dif<0 then dif=3600
if  (ll_servs >0 and dif<=30) then 
	i_plantilla='1'
else
	if dw_1.retrieve(i_contador,clugar_ohis)>0 then  odon=dw_1.getitemnumber(dw_1.getrow(),'odonto')
	if odon=0 then 	
		i_plantilla='0'
	else
		i_plantilla='1'
	end if
end if
long nnulo
string snulo
setnull(snulo)
setnull(nnulo)
t1.ph.uo_hc.retrieve(i_contador, clugar_ohis,'O','1','',i_espe,snulo,snulo,i_profe,0,'',i_plantilla,i_codfina)
end event

type p3 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5591
integer height = 1184
long backcolor = 67108864
string text = "Odontograma"
long tabtextcolor = 33554432
string picturename = "molar3cor.ico"
long picturemaskcolor = 536870912
uo_od uo_od
end type

on p3.create
this.uo_od=create uo_od
this.Control[]={this.uo_od}
end on

on p3.destroy
destroy(this.uo_od)
end on

type uo_od from uo_odontograma within p3
integer y = 24
integer width = 3534
integer height = 996
integer taborder = 40
end type

on uo_od.destroy
call uo_odontograma::destroy
end on

type psf from userobject within t1
integer x = 18
integer y = 112
integer width = 5591
integer height = 1184
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
integer taborder = 30
string i_codrep_formula = "FMCE"
string i_codrep_orden = "OSCE"
end type

on uo_sf.destroy
call uo_orden_formula::destroy
end on

event constructor;call super::constructor;init('0')
end event

type ph from userobject within t1
integer x = 18
integer y = 112
integer width = 5591
integer height = 1184
long backcolor = 67108864
string text = "Registro Odontológico"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
uo_hc uo_hc
st_2 st_2
end type

on ph.create
this.uo_hc=create uo_hc
this.st_2=create st_2
this.Control[]={this.uo_hc,&
this.st_2}
end on

on ph.destroy
destroy(this.uo_hc)
destroy(this.st_2)
end on

type uo_hc from uo_hclin within ph
integer x = 14
integer y = 16
integer width = 3474
integer height = 1164
integer taborder = 70
boolean enabled = true
end type

on uo_hc.destroy
call uo_hclin::destroy
end on

event cambio_diags;call super::cambio_diags;t1.ps.uo_s.dw_serv_ing.event rowfocuschanged(t1.ps.uo_s.dw_serv_ing.getrow())
t1.psf.uo_sf.cambia_diags(t1.ps.uo_s.dw_diags.getitemstring(1,'diagprin'))
end event

event constructor;call super::constructor;tamanyo(3474,1164)
moverv(400)
datawindow dw
singlelineedit isle_otros
inicia_objs_ordenes(t1.psf.uo_sf.tab_1.tp_1.sle_1,t1.psf.uo_sf.tab_1.tp_2.sle_2,t1.psf.uo_sf.cb_nvorden,dw,isle_otros,isle_otros,i_espe,isle_otros)

end event

type st_2 from statictext within ph
integer x = 1312
integer y = 128
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

type dw_histodon from datawindow within w_atiendetto
integer x = 2711
integer y = 68
integer width = 2697
integer height = 404
integer taborder = 10
string title = "none"
string dataobject = "dw_historial_odon"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

event rowfocuschanged;long ll_servs,dif,odon=0
t1.ps.uo_s.Reset()
t1.psf.uo_sf.Reset()

if this.getrow() < 1 then
	i_contador=-1
else
	this.selectrow(0,False)
	this.selectrow(this.getrow(),true)
	if isNull(this.getitemnumber(this.getrow(),"contador")) then Return
	i_contador = this.getitemnumber(this.getrow(),"contador")
	clugar_ohis = this.getitemstring(this.getrow(),"clugar_his")

	dif	=f_dif_fecha_minutos(getitemdatetime(this.getrow(),"fecha"),datetime(today(),now()))
	dw_historial.Retrieve(i_contador, clugar_ohis)
	ll_servs=t1.ps.uo_s.Retrieve(i_contador, clugar_ohis,dif,'T')
	if  (ll_servs >0 and dif<=60) then 
		i_plantilla='1'
	else
		if dw_1.retrieve(i_contador,clugar_ohis)>0 then  odon=dw_1.getitemnumber(dw_1.getrow(),'odonto')
		if odon=0 then
			i_plantilla='1'
		else
			i_plantilla='1'
		end if
	end if
	long nnulo
	string snulo
	setnull(snulo)
	setnull(nnulo)
	if isvalid(w_citas_asig) then
		i_codfina=w_citas_asig.dw_citas.getitemstring(w_citas_asig.dw_citas.getrow(),'cod_fina')
	end if	
	t1.psf.uo_sf.Retrieve(i_contador, clugar_ohis,i_profe,nnulo,snulo,'1',nnulo,snulo,nnulo,i_espe)	
	t1.ph.uo_hc.retrieve(i_contador, clugar_ohis,'O','1','',i_espe,snulo,snulo,i_profe,0,'',i_plantilla,i_codfina)
end if	

end event

type st_3 from statictext within w_atiendetto
integer x = 2711
integer y = 4
integer width = 2688
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Ingresos del Paciente"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_historial from datawindow within w_atiendetto
boolean visible = false
integer x = 2249
integer y = 484
integer width = 430
integer height = 116
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_histodon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
end event

type dw_getareo from datawindow within w_atiendetto
boolean visible = false
integer x = 1490
integer y = 524
integer width = 370
integer height = 88
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_getareo_cumple"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_segrespon from datawindow within w_atiendetto
boolean visible = false
integer x = 1893
integer y = 524
integer width = 393
integer height = 108
integer taborder = 80
boolean enabled = false
string title = "none"
string dataobject = "dw_segrespon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)

end event

type dw_cont_det from datawindow within w_atiendetto
boolean visible = false
integer x = 2345
integer y = 496
integer width = 864
integer height = 136
integer taborder = 90
boolean enabled = false
string title = "none"
string dataobject = "dw_cont_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type cb_2 from picturebutton within w_atiendetto
event mousemove pbm_mousemove
integer x = 3429
integer y = 476
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
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Ingreso [Alt+B]"
end type

event clicked;if i_contador = -1 or dw_histodon.rowcount()=0 then return
if w_principal.dw_1.getitemstring(1,'estado')='1' then
  messagebox("Atención","Este Paciente esta Fallecido no puede eliminar servicios")
  return
end if

dw_histodon.DeleteRow(0)
dw_historial.DeleteRow(0)

if dw_histodon.update() < 1 then
	rollback;
	dw_histodon.Reset()
	dw_histodon.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'),dw_trato.GetItemString(dw_trato.GetRow(),'cLugar'))
else
	if dw_historial.update() < 1 then
		rollback;
		dw_histodon.Reset()
		dw_histodon.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'),dw_trato.GetItemString(dw_trato.GetRow(),'cLugar'))
	else
		commit;
		dw_histodon.event rowfocuschanged(dw_histodon.getrow())
	end if
end if

end event

type cb_1 from picturebutton within w_atiendetto
event mousemove pbm_mousemove
integer x = 3287
integer y = 476
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
string text = "        &a"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Ingreso [Alt+A]"
end type

event clicked;if not f_hasta() then 
	messagebox("Atención","Su periodo de validez ha caducado, comuníquese con GCI Ltda. para reactivarlo")
	return
end if

//////////// Ojo para que no metan goles 

long fila, contador
if w_principal.dw_1.getitemstring(1,'estado')='1' then
  messagebox("Atención","Este Paciente esta Fallecido no puede adicionar servicios")
  return
end if
if i_contador = -1 and dw_histodon.RowCount() <> 0 then return
if dw_trato.rowcount() < 1 then return
dw_historial.insertrow(1)
//SELECT max( Historial.Contador) into :contador FROM Historial where clugar=:clugar;
//if isnull(i_contador) then i_contador=0
//contador++
contador=f_trae_ndoc('HIS',clugar,'Historial')
dw_historial.setitem(1,"fecha",datetime(today(),time(now())))
dw_historial.setitem(1,"tipodoc",tipdoc)
dw_historial.setitem(1,"documento",docu)
dw_historial.setitem(1,"indapdx",'5')
dw_historial.setitem(1,"odontologia",'1')
dw_historial.setitem(1,"contador",contador)
dw_historial.setitem(1,"clugar",clugar)

if dw_historial.update() = 1 then
	dw_histodon.InsertRow(1)
	dw_histodon.SetItem(1,"ntratamiento",dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'))
	dw_histodon.SetItem(1,"clugar_tto",dw_trato.GetItemString(dw_trato.GetRow(),'cLugar'))
	dw_histodon.SetItem(1,"contador",contador)
	dw_histodon.SetItem(1,"clugar_his",clugar)
	dw_histodon.SetItem(1,"fecha",datetime(today(),time(now())))
	if dw_histodon.Update() = -1 then
		dw_historial.deleterow(1)
		dw_histodon.DeleteRow(1)
		Rollback;
	else
		commit;
		dw_histodon.scrolltorow(1)
		dw_histodon.TriggerEvent(rowfocuschanged!)
	end if

else
	dw_historial.deleterow(1)
	rollback;
end if
end event

