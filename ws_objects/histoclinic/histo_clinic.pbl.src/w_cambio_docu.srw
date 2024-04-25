$PBExportHeader$w_cambio_docu.srw
forward
global type w_cambio_docu from window
end type
type cb_ok from picturebutton within w_cambio_docu
end type
type cb_cancel from picturebutton within w_cambio_docu
end type
type dw_2 from datawindow within w_cambio_docu
end type
type dw_busca from datawindow within w_cambio_docu
end type
type dw_cambio from datawindow within w_cambio_docu
end type
type dw_1 from datawindow within w_cambio_docu
end type
type gb_1 from groupbox within w_cambio_docu
end type
end forward

global type w_cambio_docu from window
integer width = 1792
integer height = 472
boolean titlebar = true
string title = "Cambio de Documento y/o Historia Clínica"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "cambio_resp.ico"
boolean clientedge = true
boolean center = true
cb_ok cb_ok
cb_cancel cb_cancel
dw_2 dw_2
dw_busca dw_busca
dw_cambio dw_cambio
dw_1 dw_1
gb_1 gb_1
end type
global w_cambio_docu w_cambio_docu

type variables
int xant,yant
datawindowchild tip_doc,tip_doc1
end variables

on w_cambio_docu.create
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.dw_2=create dw_2
this.dw_busca=create dw_busca
this.dw_cambio=create dw_cambio
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_ok,&
this.cb_cancel,&
this.dw_2,&
this.dw_busca,&
this.dw_cambio,&
this.dw_1,&
this.gb_1}
end on

on w_cambio_docu.destroy
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.dw_2)
destroy(this.dw_busca)
destroy(this.dw_cambio)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;if isnull(docu) or docu='' then
	gb_1.visible=true
	this.height=650
	dw_busca.visible=true
	dw_busca.enabled=true
	dw_busca.insertrow(1)
	dw_1.y=220
	cb_ok.y=380
	cb_cancel.y=380
end if
end event

type cb_ok from picturebutton within w_cambio_docu
event mousemove pbm_mousemove
integer x = 686
integer y = 220
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;long j,l_largo
string tdocnew,docunew,histnew,l_formato
dw_1.accepttext()
if dw_busca.visible then
	if isnull(dw_busca.getitemstring(1,2)) then
		messagebox("Atención","Debe Buscar el documento a cambiar")
		return
	end if
	if isnull(dw_1.getitemstring(1,2)) then
		messagebox("Atención","Debe Digitar el nuevo documento")
		return
	end if
	tipdoc=dw_busca.getitemstring(1,1)
	docu=dw_busca.getitemstring(1,2)
end if //visble

tdocnew=dw_1.getitemstring(1,1)
docunew=dw_1.getitemstring(1,2)
if docunew=docu and tdocnew=tipdoc then
	messagebox("Atención","Debe cambiar el número de documento para poder realizar el cambio")
	return
end if
long nguion,donde
string docu2
nguion=f_count_text(docunew,"-")
if tdocnew="CC" then nguion=0
docu2=docunew
if pos(docu2,'.')>0 or pos(docu2,',')>0 then
	messagebox("Atención","Documento no válido")
	return 
end if
tip_doc.retrieve()
tip_doc.setfilter("codtipoident='"+tdocnew+"'")
tip_doc.filter()
If tip_doc.rowcount()>0 then
	l_largo=tip_doc.getitemnumber(1,"largo")
	l_formato=tip_doc.getitemstring(1,"formato")
	if not f_valid_nu(tdocnew,docunew,l_largo,l_formato) then
		messagebox("Atención","Documento no válido")
		return 1
	end if

	histnew=dw_1.getitemstring(1,3)
	if dw_busca.visible then
		dw_busca.rowscopy(1,1,primary!,dw_2,1,primary!)
		dw_2.setitem(1,1,tdocnew)
		dw_2.setitem(1,2,docunew)
		dw_2.setitem(1,3,histnew)
	else
		dw_1.rowscopy(1,1,primary!,dw_2,1,primary!)
	end if
	if dw_2.update()=-1 then
		rollback;
		return
	end if
	UPDATE acumcab SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE acumcab.TipoDoc=:tipdoc AND acumcab.Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Acumcab",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	UPDATE pacientes_cohortes SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE TipoDoc=:tipdoc AND documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando pacientes_cohortes",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	UPDATE camas SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE TipoDoc=:tipdoc AND documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Camas",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update banco_donacion SET tipodoc = :tdocnew, Documento = :docunew
	WHERE TipoDoc=:tipdoc AND documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Banco_Donacion",sqlca.sqlerrtext)
		rollback;
		return
	end if
	insert into banco_paciente(tipodoc,documento,cod_banco,apto,apto_desde)
	select :tdocnew,:docunew,cod_banco,apto,apto_desde from banco_paciente where tipodoc=:tipdoc and documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Insertando en banco_paciente",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update banco_paciente_caract set tipodoc=:tdocnew , documento=:docunew 
	where tipodoc=:tipdoc and documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando banco_paciente_caract",sqlca.sqlerrtext)
		rollback;
		return
	end if
	delete from banco_paciente where tipodoc=:tipdoc and documento=:docu; 
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando de banco_paciente",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE CitasAsig SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE CitasAsig.TipoDoc=:tipdoc AND CitasAsig.Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando CitasAsig",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE CompFamiliar SET NHistoria = :histnew
	WHERE CompFamiliar.NHistoria=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando CompFamiliar",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE cotiza_cab SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE TipoDoc=:tipdoc AND Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Cotiza_Cab",sqlca.sqlerrtext)
		rollback;
		return
	end if
	INSERT INTO Embarazo ( Historia, NEmbarazo, Contador,clugar_his, FechaReg, Menarquia, G, P, A, C, Planificacion, FUR, FPP, Diabetes, HTA, Obito, Otros, GSF, RHF, GSM, RHM, FechaParto, TipoParto, CausaCesarea, CompliMaternas, Observacion, PeriodoGestacion, ControlPrenatal, CausamuerteM, FechaMuerteM )
	SELECT :histnew AS nueva, Embarazo.NEmbarazo, Embarazo.Contador,embarazo.clugar_his, Embarazo.FechaReg, Embarazo.Menarquia, Embarazo.G, Embarazo.P, Embarazo.A, Embarazo.C, Embarazo.Planificacion, Embarazo.FUR, Embarazo.FPP, Embarazo.Diabetes, Embarazo.HTA, Embarazo.Obito, Embarazo.Otros, Embarazo.GSF, Embarazo.RHF, Embarazo.GSM, Embarazo.RHM, Embarazo.FechaParto, Embarazo.TipoParto, Embarazo.CausaCesarea, Embarazo.CompliMaternas, Embarazo.Observacion, Embarazo.PeriodoGestacion, Embarazo.ControlPrenatal, Embarazo.CausamuerteM, Embarazo.FechaMuerteM
	FROM Embarazo
	WHERE (((Embarazo.Historia)=:histo));
	if sqlca.sqlcode=-1 then
		messagebox("Error insertando Nuevo Embarazo",sqlca.sqlerrtext)
		rollback;
		return
	end if
	INSERT INTO EmbarazoControl ( Historia, NEmbarazo, clugar,NControl, Contador,clugar_his, FechaControl, Peso, TA, AU, RsCsFs, MsFs, EdGesta, TRiesgo, Observacion )
	SELECT :histnew AS nueva, EmbarazoControl.NEmbarazo, embarazocontrol.clugar,EmbarazoControl.NControl, EmbarazoControl.Contador,EmbarazoControl.clugar_his, EmbarazoControl.FechaControl, EmbarazoControl.Peso, EmbarazoControl.TA, EmbarazoControl.AU, EmbarazoControl.RsCsFs, EmbarazoControl.MsFs, EmbarazoControl.EdGesta, EmbarazoControl.TRiesgo, EmbarazoControl.Observacion
	FROM EmbarazoControl
	WHERE EmbarazoControl.Historia=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error insertando Controles de Embarazo",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE EmbarazoCADx SET Historia = :histnew
	WHERE EmbarazoCADx.Historia=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando EmbarazoCADx",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE EmbarazoRN SET Historia = :histnew
	WHERE EmbarazoRN.Historia=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando EmbarazoRN",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	INSERT INTO emppac ( TipoDoc, Documento, CodEmp, CodContrato, CodTa, Carnet )                     		         // Toco 
	SELECT :tdocnew, :docunew, EmpPac.CodEmp, EmpPac.CodContrato, EmpPac.CodTa, EmpPac.Carnet			// dejar la instruccion dividiva en dos
	FROM EmpPac																															// para que la 
	WHERE (((EmpPac.TipoDoc)=:tipdoc) AND ((EmpPac.Documento)=:docu));												// sincronizacion 
	if sqlca.sqlcode=-1 then																												// no moleste
		messagebox("Error Insertando en  EmpPac",sqlca.sqlerrtext)															//
		rollback;																																//
		return																																	//
	end if
	
	delete from emppac WHERE EmpPac.TipoDoc=:tipdoc AND EmpPac.Documento=:docu;								//
	if sqlca.sqlcode=-1 then																												//
		messagebox("Error borrando de  EmpPac",sqlca.sqlerrtext)																//
		rollback;																																//
		return																																	//
	end if																																		//
	
	UPDATE EvolucionHC SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE EvolucionHC.TipoDoc=:tipdoc AND EvolucionHC.Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando EvolucionHC",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE FactCpo SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE FactCpo.TipoDoc=:tipdoc AND FactCpo.Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando FactCpo",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE HistLaboral SET NHistoria = :histnew
	WHERE HistLaboral.NHistoria=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando HistLaboral",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE Historial SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE Historial.TipoDoc=:tipdoc AND Historial.Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Historial",sqlca.sqlerrtext)
		rollback;
		return
	end if
	INSERT INTO Historiaubica ( NHistoria, ntraslado, Fechatraslado, archivo, estan, entrepano, Observacion, estado )
	SELECT :histnew AS nueva, Historiaubica.ntraslado, Historiaubica.Fechatraslado, Historiaubica.archivo, Historiaubica.estan, Historiaubica.entrepano, Historiaubica.Observacion, Historiaubica.estado
	FROM Historiaubica
	WHERE Historiaubica.NHistoria=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error Insertando en HistoriaUbica",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE Historiaprestamo SET NHistoria = :histnew
	WHERE Historiaprestamo.NHistoria=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Historiaprestamo",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE HospAdmi SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE HospAdmi.TipoDoc=:tipdoc AND HospAdmi.Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando HospAdmi",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE IngresoADX SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE IngresoADX.TipoDoc=:tipdoc AND IngresoADX.Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando IngresoADX",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE odongramacb SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE TipoDoc=:tipdoc AND documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Odongramacb",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE odontratacab SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE TipoDoc=:tipdoc AND documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Odontratacab",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update pacientesnotas set tipodoc=:tdocnew,documento=:docunew
	where tipodoc=:tipdoc and documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando PacientesNotas",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update pyp_progpaci set tipodoc=:tdocnew,documento=:docunew
	where tipodoc=:tipdoc and documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando PyP_ProgPaci",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update pyp_pac_condi set tipodoc=:tdocnew,documento=:docunew
	where tipodoc=:tipdoc and documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando PyP_pac_Condi",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE QxCabActo SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE QxCabActo.TipoDoc=:tipdoc AND QxCabActo.Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando QxCabActo",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE PACIENTESQUEJAS SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE TipoDoc=:tipdoc AND Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando PACIENETSquejas",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	UPDATE QxCita SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE TipoDoc=:tipdoc AND Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando QxCita",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE resultadoscab SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE TipoDoc=:tipdoc AND documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Resultadoscab",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	UPDATE hosp_autoriza SET tipodoc = :tdocnew, documento = :docunew
	WHERE (((hosp_autoriza.tipodoc)=:tipdoc) AND ((hosp_autoriza.documento)=:docu));
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Hosp_autoriza",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	UPDATE tesopagarecab SET tipodoc = :tdocnew, documento = :docunew
	WHERE tesopagarecab.tipodoc=:tipdoc AND tesopagarecab.documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando tesopagarecab",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE tesorecajcab SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE tesorecajcab.TipoDoc=:tipdoc AND tesorecajcab.Documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando tesorecajcab",sqlca.sqlerrtext)
		rollback;
		return
	end if
	INSERT INTO VacunaPac ( Historia, CodVacuna, Estado )
	SELECT :histnew AS nueva, VacunaPac.CodVacuna, VacunaPac.Estado
	FROM VacunaPac
	WHERE VacunaPac.Historia=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error Insertando en VacunaPac",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE VacunaDosis SET Historia = :histnew
	WHERE VacunaDosis.Historia=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando VacunaDosis",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE pacientes_pvunerable SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE (((pacientes_pvunerable.tipodoc)=:tipdoc) AND ((pacientes_pvunerable.documento)=:docu));
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando pacientes_pvulnerable",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE pacientes_imagen SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE (((pacientes_imagen.tipodoc)=:tipdoc) AND ((pacientes_imagen.documento)=:docu));
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando pacientes_imagen",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE pacientes_biometria SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE (((pacientes_biometria.tipodoc)=:tipdoc) AND ((pacientes_biometria.documento)=:docu));
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Pacientes_biometria",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE pacientes_antecedente SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE (((pacientes_antecedente.tipodoc)=:tipdoc) AND ((pacientes_antecedente.documento)=:docu));
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando pacientes_antecedente",sqlca.sqlerrtext)
		rollback;
		return
	end if
	UPDATE pacientes_alergias SET TipoDoc = :tdocnew, Documento = :docunew
	WHERE (((pacientes_alergias.tipodoc)=:tipdoc) AND ((pacientes_alergias.documento)=:docu));
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Pacientes_alergia",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	UPDATE gral_ma_integrantes_nucleo SET  tdoc= :tdocnew, docu= :docunew
	WHERE tdoc=:tipdoc AND docu=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando GRAL_MA_INTEGRANTES_NUCLEO ",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	UPDATE gral_ma_nucleos_predio SET tdoc_recibe= :tdocnew,  docu_recibe= :docunew
	WHERE tdoc_recibe=:tipdoc AND docu_recibe=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando gral_ma_nucleos_predio",sqlca.sqlerrtext)
		rollback;
		return
	end if
	//////////////////////////
	delete from compfamiliar WHERE nHistoria=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando fila de Compfamiliar",sqlca.sqlerrtext)
		rollback;
		return
	end if
	delete from embarazo where historia=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando fila de Embarazo",sqlca.sqlerrtext)
		rollback;
		return
	end if
	delete from embarazocontrol WHERE EmbarazoControl.Historia=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando fila de EmbarazoControl",sqlca.sqlerrtext)
		rollback;
		return
	end if
	delete from Historiaubica WHERE Historiaubica.NHistoria=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando fila de Historiaubica",sqlca.sqlerrtext)
		rollback;
		return
	end if
	delete from VacunaPac WHERE VacunaPac.Historia=:histo;
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando fila de VacunaPac",sqlca.sqlerrtext)
		rollback;
		return
	end if
	//
	delete from pacientes where tipodoc=:tipdoc and documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando fila de Pacientes",sqlca.sqlerrtext)
		rollback;
		return
	end if
	commit;
End If

dw_cambio.	insertrow(1)
dw_cambio.setitem(1,'tipodoc_ant',tipdoc)
dw_cambio.setitem(1,'documento_ant',docu)
dw_cambio.setitem(1,'tipodoc',tdocnew)
dw_cambio.setitem(1,'documento',docunew)
dw_cambio.setitem(1,'nombre1',w_principal.dw_1.getitemstring(1,'nombre1'))
dw_cambio.setitem(1,'nombre2',w_principal.dw_1.getitemstring(1,'nombre2'))
dw_cambio.setitem(1,'apellido1',w_principal.dw_1.getitemstring(1,'apellido1'))
dw_cambio.setitem(1,'apellido2',w_principal.dw_1.getitemstring(1,'apellido2'))
dw_cambio.setitem(1,'fnacimiento',w_principal.dw_1.getitemdatetime(1,'fnacimiento'))
dw_cambio.setitem(1,'usuario',usuario)
dw_cambio.setitem(1,'fecha',now())
if dw_cambio.update()=-1 then
	rollback;
	return
end if
tipdoc=tdocnew
docu=docunew

w_principal.busca_paciente()
close(parent)

end event

type cb_cancel from picturebutton within w_cambio_docu
event mousemove pbm_mousemove
integer x = 841
integer y = 220
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type dw_2 from datawindow within w_cambio_docu
boolean visible = false
integer x = 14
integer y = 380
integer width = 1655
integer height = 140
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_nuevo_doc_new"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(SQLCA)

end event

type dw_busca from datawindow within w_cambio_docu
boolean visible = false
integer x = 27
integer y = 624
integer width = 1637
integer height = 140
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "busca"
string dataobject = "dw_nuevo_doc"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;settransobject(sqlca)
modify("documento_t.text='Docum. a cambiar' ")
modify("historia_t.text='Historia a cambiar'")
modify("historia.edit.displayonly='yes'")
modify("historia.background.color='"+string(rgb(255,255,200))+"'")
dw_busca.GetChild('tipodoc',tip_doc)
tip_doc.SetTransObject(SQLCA)
end event

event itemchanged;accepttext()
if dwo.name='tipodoc' then return
if retrieve(getitemstring(1,1),getitemstring(1,2))=0 then 
	insertrow(1)
	messagebox("Atención","No se encontro ese paciente")
end if
end event

type dw_cambio from datawindow within w_cambio_docu
integer x = 1801
integer y = 24
integer width = 402
integer height = 184
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_pacientes_cambio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(SQLCA)

end event

type dw_1 from datawindow within w_cambio_docu
integer x = 50
integer y = 48
integer width = 1655
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_nuevo_doc_new"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
if retrieve(tipdoc,docu)=0 then 
	dw_1.insertrow(1)
end if
dw_1.GetChild('tipodoc',tip_doc1)
tip_doc1.SetTransObject(SQLCA)
end event

event itemchanged;accepttext()
if getcolumnname()="documento" and gettext() <> "" then
	setitem(1,"historia",data)
	STRING docu2,tdoc
	docu2=gettext()
	tdoc=getitemstring(1,"tipodoc")
	long nguion,j,donde
	if pos(docu2,'.')>0 or pos(docu2,',')>0 then
		setitem(1,"documento","")
		return 1
	end if

	int l_largo
	string  l_formato

	tip_doc1.retrieve()
	tip_doc1.setfilter("codtipoident='"+tdoc+"'")
	tip_doc1.filter()
	If tip_doc1.rowcount()>0 then
		l_largo=tip_doc1.getitemnumber(1,"largo")
		l_formato=tip_doc1.getitemstring(1,"formato")
			if not f_valid_nu(tdoc,docu2,l_largo,l_formato) then
				setitem(1,"documento","")
				setitem(1,"historia","")
				docu=""
				return 1
			end if
	end if
end if

end event

type gb_1 from groupbox within w_cambio_docu
integer x = 18
integer width = 1696
integer height = 208
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar paciente"
end type

