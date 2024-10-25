$PBExportHeader$w_cambio_emp.srw
forward
global type w_cambio_emp from window
end type
type dw_tingres from datawindow within w_cambio_emp
end type
type dw_his_acu from datawindow within w_cambio_emp
end type
type dw_qxcpo from datawindow within w_cambio_emp
end type
type dw_qxcab from datawindow within w_cambio_emp
end type
type dw_empac from datawindow within w_cambio_emp
end type
type st_4 from statictext within w_cambio_emp
end type
type st_3 from statictext within w_cambio_emp
end type
type pb_1 from picturebutton within w_cambio_emp
end type
type cb_aceptar from picturebutton within w_cambio_emp
end type
type dw_activos from datawindow within w_cambio_emp
end type
type st_1 from statictext within w_cambio_emp
end type
type gb_1 from groupbox within w_cambio_emp
end type
type gb_2 from groupbox within w_cambio_emp
end type
end forward

global type w_cambio_emp from window
integer width = 3721
integer height = 1536
boolean titlebar = true
string title = "Cambiar Empresa Responsable de Admisión Activa"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "r_cambio_resp.ico"
boolean clientedge = true
boolean center = true
dw_tingres dw_tingres
dw_his_acu dw_his_acu
dw_qxcpo dw_qxcpo
dw_qxcab dw_qxcab
dw_empac dw_empac
st_4 st_4
st_3 st_3
pb_1 pb_1
cb_aceptar cb_aceptar
dw_activos dw_activos
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_cambio_emp w_cambio_emp

type variables
string tipo_ingres,orden,anterior
long xant,yant
DataWindowChild idw_tiping
end variables

on w_cambio_emp.create
this.dw_tingres=create dw_tingres
this.dw_his_acu=create dw_his_acu
this.dw_qxcpo=create dw_qxcpo
this.dw_qxcab=create dw_qxcab
this.dw_empac=create dw_empac
this.st_4=create st_4
this.st_3=create st_3
this.pb_1=create pb_1
this.cb_aceptar=create cb_aceptar
this.dw_activos=create dw_activos
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_tingres,&
this.dw_his_acu,&
this.dw_qxcpo,&
this.dw_qxcab,&
this.dw_empac,&
this.st_4,&
this.st_3,&
this.pb_1,&
this.cb_aceptar,&
this.dw_activos,&
this.st_1,&
this.gb_1,&
this.gb_2}
end on

on w_cambio_emp.destroy
destroy(this.dw_tingres)
destroy(this.dw_his_acu)
destroy(this.dw_qxcpo)
destroy(this.dw_qxcab)
destroy(this.dw_empac)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.cb_aceptar)
destroy(this.dw_activos)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type dw_tingres from datawindow within w_cambio_emp
integer x = 398
integer y = 16
integer width = 1061
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('codtingre',idw_tiping)
idw_tiping.settransobject(sqlca)
idw_tiping.retrieve()
idw_tiping.deleterow(1)
string ojo
if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "TINGRESO", Regstring!, ojo)
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "TINGRESO", Regstring!, ojo)
insertrow(1)
setitem(1,1,ojo)
post event itemchanged(1,object.codtingre,ojo)
end event

event itemchanged;tipo_ingres=gettext()
dw_activos.retrieve(tipo_ingres,tipdoc,docu)
end event

type dw_his_acu from datawindow within w_cambio_emp
boolean visible = false
integer x = 2391
integer y = 1284
integer width = 686
integer height = 100
integer taborder = 50
string title = "none"
string dataobject = "dw_historial_acumcab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_qxcpo from datawindow within w_cambio_emp
boolean visible = false
integer x = 375
integer y = 1284
integer width = 242
integer height = 88
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dw_xa_cambiarempqx_cp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_qxcab from datawindow within w_cambio_emp
boolean visible = false
integer x = 119
integer y = 1296
integer width = 178
integer height = 92
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_xa_cambiarempqx"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_empac from datawindow within w_cambio_emp
integer x = 78
integer y = 764
integer width = 3511
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_empacguarda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve(tipdoc,docu)
end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

type st_4 from statictext within w_cambio_emp
integer x = 2363
integer y = 184
integer width = 1221
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Los registros de color rojo no tienen valoración inicial"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_cambio_emp
integer x = 2990
integer y = 564
integer width = 594
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_cambio_emp
integer x = 1888
integer y = 1252
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;	if isvalid(w_rec_caja) then w_rec_caja.triggerevent(open!)
	if isvalid(w_asig_cita) then 
		if isvalid(w_trasl_cita) then close(w_trasl_cita)
		w_asig_cita.triggerevent(open!)
	end if
	if isvalid(w_admision) then w_admision.triggerevent(open!)
	if isvalid(w_new_at_os) then w_new_at_os.dw_tip_ingres.triggerevent(itemchanged!)
	if isvalid(w_entrega_med) then w_entrega_med.dw_tip_ingres.triggerevent(itemchanged!)
	if isvalid(w_devuelve_med) then w_devuelve_med.dw_tip_ingres.triggerevent(itemchanged!)
	if isvalid(w_new_sala_qx) then w_new_sala_qx.triggerevent(open!)
	if isvalid(w_programa_cir) then w_programa_cir.triggerevent(open!)
	if isvalid(w_consulta) then w_consulta.triggerevent(open!)
	if isvalid(w_atiendetto) then w_atiendetto.triggerevent(open!)
	if isvalid(w_abonos) then w_abonos.triggerevent(open!)
	if isvalid(w_pyp_pac) then w_pyp_pac.triggerevent(open!)
	if isvalid(w_imag_diag) then w_imag_diag.triggerevent(open!)
	if isvalid(w_banco_fluid) then w_banco_fluid.triggerevent(open!)
	if isvalid(w_asig_cita_qx) then w_asig_cita_qx.triggerevent(open!)
close(parent)
end event

type cb_aceptar from picturebutton within w_cambio_emp
event mousemove pbm_mousemove
integer x = 1737
integer y = 1252
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;if dw_activos.rowcount()<1 or dw_empac.rowcount()<1 then return
string newemp,newcont,clugar_his,clug_soat,clugar_catas,clug_qx,nulo
long nsoat,ncatas,nqx,j, contador
setnull(nulo)
newemp=dw_empac.getitemstring(dw_empac.getrow(),"codemp")
newcont=dw_empac.getitemstring(dw_empac.getrow(),"codcontrato")
contador=dw_activos.getitemnumber(dw_activos.getrow(),"este")
clugar_his=dw_activos.getitemstring(dw_activos.getrow(),"clugar_his")
if newemp<>dw_activos.getitemstring(dw_activos.getrow(),"cemp") or newcont<>dw_activos.getitemstring(dw_activos.getrow(),"ccontrato") then
	if messagebox("Atención","Está seguro que desea cabiar de responsable a esta admisión?",question!,yesno!,2)=2 then return
	if dw_empac.getitemstring(dw_empac.getrow(),"soat")='1' then
		st_soat st
		setnull(st.nsoat)
		st.newemp=newemp
		st.newcont=newcont
		openwithparm(w_soat,st)
		if message.stringparm='!' or not isvalid(message.powerobjectparm) then return
		st=message.powerobjectparm
		clug_soat=st.clug_soat
		nsoat=st.nsoat
	else
		setnull(clug_soat)
		setnull(nsoat)
	end if
	if dw_empac.getitemstring(dw_empac.getrow(),"catastrofe")='1' then
		openwithparm(w_catastrofes,'nuevo')
		trae trae2
		if message.stringparm="!" or not isvalid(message.powerobjectparm) then return
		trae2=message.PowerObjectParm
		ncatas=trae2.numero
		clugar_catas=trae2.lugar
	else
		setnull(ncatas)
		setnull(clugar_catas)
	end if
	update historial set consec_soat=:nsoat , clugar_soat=:clug_soat where contador=:contador and clugar=:clugar_his;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando SOAT en Historial",sqlca.sqlerrtext)
		rollback;
		return
	end if
	if not isnull(nsoat) then
		if dw_his_acu.retrieve(nsoat,clug_soat,contador,clugar_his)= 0 then
			dw_his_acu.insertrow(1)
			dw_his_acu.setitem(1,"contador",contador)
			dw_his_acu.setitem(1,"clugar",clugar_his)
			dw_his_acu.setitem(1,"consec_soat",nsoat)
			dw_his_acu.setitem(1,"clugar_soat",clug_soat)
			if dw_his_acu.update()=-1 then
				dw_his_acu.deleterow(1)
				dw_his_acu.resetupdate()
				rollback;
				return -1
			end if
		end if
	end if
	
	update historial set ncatastrofe=:ncatas , clugar_catas=:clugar_catas where contador=:contador and clugar=:clugar_his;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando Catastrofe en Historial",sqlca.sqlerrtext)
		rollback;
		return
	end if
	dw_activos.setitem(dw_activos.getrow(),"cemp",newemp)
	dw_activos.setitem(dw_activos.getrow(),"ccontrato",newcont)
	if dw_activos.update()=-1 then
		rollback;
	else
		update serviciosingreso set cprocedeq = null , cmanual = null, cemp=:newemp,ccontrato=:newcont,cplan=null where contador=:contador and clugar=:clugar_his;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando Servicios Ingreso",sqlca.sqlerrtext)
			rollback;
			return
		end if
		if dw_qxcab.retrieve(contador,clugar_his)>0 then
			for j=1 to dw_qxcab.rowcount()
				dw_qxcab.setitem(j,'cemp',newemp)
				dw_qxcab.setitem(j,'ccontrato',newcont)
				if g_motor='postgres' then
					update qxcita set qxcita.codemp = :newemp
					from 
						qxcabacto 					
					where 
						((qxcabacto.contador=:contador) 
						and (qxcabacto.clugar_his=clugar_his)
						and (qxcabacto.clugar = qxcita.clugar_qx) 
						and (qxcabacto.numero_ingre = qxcita.numero_ingre) );
				else
					update qxcita set qxcita.codemp = :newemp
					from 
						qxcabacto inner join qxcita on (qxcabacto.clugar = qxcita.clugar_qx) 
						and (qxcabacto.numero_ingre = qxcita.numero_ingre) 
					where 
						qxcabacto.contador=:contador and qxcabacto.clugar_his=clugar_his;					
				end if
				if sqlca.sqlcode=-1 then
					messagebox("Error actualizando Servicios Ingreso",sqlca.sqlerrtext)
					rollback;
					return
				end if
			next
			if dw_qxcab.update()=-1 then
				rollback;
				return
			end if
		end if
		if dw_qxcpo.retrieve(contador,clugar_his)>0 then
			for j=1 to dw_qxcpo.rowcount()
				dw_qxcpo.setitem(j,'cemp',newemp)
				dw_qxcpo.setitem(j,'ccontrato',newcont)
				//dw_qxcpo.setitem(j,'cmanual',nulo)
				//dw_qxcpo.setitem(j,'cplan',nulo)
			next
			if dw_qxcpo.update()=-1 then
				rollback;
				return
			end if
		end if
		messagebox("Atención","Se cambió la empresa responsable del ingreso, los cambios se ven en el momento de facturar los servicios")
		commit;
		close(parent)
	end if
else
	messagebox("Atención","Eligió el mismo contrato y empresa original, esto no surtirtá efecto")
end if
end event

type dw_activos from datawindow within w_cambio_emp
integer x = 64
integer y = 268
integer width = 3529
integer height = 288
integer taborder = 20
string title = "none"
string dataobject = "dw_para_cambio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event clicked;if dwo.type = "text" then 
	string cual,ojo,ss
	cual=dwo.name
	cual=mid(cual,1,len(cual) - 2)
	if anterior=cual then
		if orden="A" then
			orden="D"
		else
			orden="A"
		end if
	else
		orden="A"
	end if
	dw_activos.setsort(cual+" "+orden)
	dw_activos.sort()
	anterior=cual
end if
end event

event rowfocuschanged;st_3.text="Reg. "+string(this.getrow()) +" de "+string(this.rowcount())
end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

event doubleclicked;cb_aceptar.triggerevent(clicked!)
end event

type st_1 from statictext within w_cambio_emp
integer x = 59
integer y = 32
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Ingreso:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_cambio_emp
integer x = 32
integer y = 144
integer width = 3621
integer height = 520
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "Ingresos Activos"
end type

type gb_2 from groupbox within w_cambio_emp
integer x = 32
integer y = 696
integer width = 3607
integer height = 536
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "Nuevo Responsable de la Admisión para el Paciente:"
end type

