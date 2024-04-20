$PBExportHeader$w_borra_repetid.srw
forward
global type w_borra_repetid from window
end type
type pb_6 from picturebutton within w_borra_repetid
end type
type pb_5 from picturebutton within w_borra_repetid
end type
type pb_4 from picturebutton within w_borra_repetid
end type
type pb_3 from picturebutton within w_borra_repetid
end type
type pb_2 from picturebutton within w_borra_repetid
end type
type pb_1 from picturebutton within w_borra_repetid
end type
type dw_2 from datawindow within w_borra_repetid
end type
type dw_1 from datawindow within w_borra_repetid
end type
type gb_1 from groupbox within w_borra_repetid
end type
type gb_2 from groupbox within w_borra_repetid
end type
end forward

global type w_borra_repetid from window
integer width = 2866
integer height = 1820
boolean titlebar = true
string title = "Eliminar Pacientes Repetidos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "elimi_pac.ico"
boolean center = true
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_borra_repetid w_borra_repetid

on w_borra_repetid.create
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_2,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_borra_repetid.destroy
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type pb_6 from picturebutton within w_borra_repetid
integer x = 1330
integer y = 1588
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_5 from picturebutton within w_borra_repetid
integer x = 1161
integer y = 1588
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if isnull(dw_1.getitemstring(1,'historia')) then
	messagebox("Atención","Debe escoger el Paciente al que se van a unir los datos de los otros pacientes")
	return
end if
string tdocnew,docnew,histnew,tdocx,docx,histx
double maximi=0

tdocnew=dw_1.getitemstring(1,1)
docnew=dw_1.getitemstring(1,2)
histnew=dw_1.getitemstring(1,3)
long j,cuantos=0
for j=1 to dw_2.rowcount()
	if not isnull(dw_2.getitemstring(j,'historia')) then
		tdocx=dw_2.getitemstring(j,1)
		docx=dw_2.getitemstring(j,2)
		histx=dw_2.getitemstring(j,3)
		INSERT INTO Embarazo ( Historia, NEmbarazo, Contador, clugar_his, FechaReg, Menarquia, G, P, A, C, Planificacion, FUR, FPP, Diabetes, HTA, Obito, Otros, GSF, RHF, GSM, RHM, FechaParto, TipoParto, CausaCesarea, CompliMaternas, Observacion, PeriodoGestacion, ControlPrenatal, CausamuerteM, FechaMuerteM )
		SELECT :histnew AS nueva, Embarazo.NEmbarazo, Embarazo.Contador, Embarazo.clugar_his, Embarazo.FechaReg, Embarazo.Menarquia, Embarazo.G, Embarazo.P, Embarazo.A, Embarazo.C, Embarazo.Planificacion, Embarazo.FUR, Embarazo.FPP, Embarazo.Diabetes, Embarazo.HTA, Embarazo.Obito, Embarazo.Otros, Embarazo.GSF, Embarazo.RHF, Embarazo.GSM, Embarazo.RHM, Embarazo.FechaParto, Embarazo.TipoParto, Embarazo.CausaCesarea, Embarazo.CompliMaternas, Embarazo.Observacion, Embarazo.PeriodoGestacion, Embarazo.ControlPrenatal, Embarazo.CausamuerteM, Embarazo.FechaMuerteM
		FROM Embarazo LEFT outer JOIN Embarazo AS Embarazo_1 ON Embarazo.NEmbarazo = Embarazo_1.NEmbarazo
		WHERE (((Embarazo_1.Historia)=:histnew) AND ((Embarazo_1.NEmbarazo) Is Null) AND ((Embarazo.Historia)=:histx));
		if sqlca.sqlcode=-1 then
			messagebox("Error insertando Nuevo Embarazo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		INSERT INTO EmbarazoControl ( Historia, NEmbarazo, clugar, NControl, Contador, clugar_his, FechaControl, Peso, TA, AU, RsCsFs, MsFs, EdGesta, TRiesgo, Observacion )
		SELECT :histnew AS nueva, EmbarazoControl.NEmbarazo, EmbarazoControl.clugar, EmbarazoControl.NControl, EmbarazoControl.Contador, EmbarazoControl.clugar_his, EmbarazoControl.FechaControl, EmbarazoControl.Peso, EmbarazoControl.TA, EmbarazoControl.AU, EmbarazoControl.RsCsFs, EmbarazoControl.MsFs, EmbarazoControl.EdGesta, EmbarazoControl.TRiesgo, EmbarazoControl.Observacion
		FROM EmbarazoControl LEFT outer JOIN EmbarazoControl AS EmbarazoControl_1 ON (EmbarazoControl.NControl = EmbarazoControl_1.NControl) AND (EmbarazoControl.clugar = EmbarazoControl_1.clugar) AND (EmbarazoControl.NEmbarazo = EmbarazoControl_1.NEmbarazo)
		WHERE (((EmbarazoControl_1.Historia)=:histnew) AND ((EmbarazoControl_1.NEmbarazo) Is Null) AND ((EmbarazoControl.Historia)=:histx));
		if sqlca.sqlcode=-1 then
			messagebox("Error insertando Controles de Embarazo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		UPDATE EmbarazoCADx SET Historia = :histnew
		WHERE EmbarazoCADx.Historia=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando EmbarazoCADx",sqlca.sqlerrtext)
			rollback;
			return
		end if
		UPDATE EmbarazoRN SET Historia = :histnew
		WHERE EmbarazoRN.Historia=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando EmbarazoRN",sqlca.sqlerrtext)
			rollback;
			return
		end if
		UPDATE EvolucionHC SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE EvolucionHC.TipoDoc=:tdocx AND EvolucionHC.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando EvolucionHC",sqlca.sqlerrtext)
			rollback;
			return
		end if
		insert into banco_paciente(tipodoc,documento,cod_banco,apto,apto_desde)
		select :tdocnew,:docnew,cod_banco,apto,apto_desde from banco_paciente where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Insertando en banco_paciente",sqlca.sqlerrtext)
			rollback;
			return
		end if
		UPDATE banco_paciente_caract  SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE  TipoDoc=:tdocx AND Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando banco_paciente_caract",sqlca.sqlerrtext)
			rollback;
			return
		end if		
		delete from banco_paciente where tipodoc=:tdocx  and documento=:docx; 
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando de banco_paciente",sqlca.sqlerrtext)
			rollback;
			return
		end if	
		UPDATE HospAdmi SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE HospAdmi.TipoDoc=:tdocx AND HospAdmi.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando HospAdmi",sqlca.sqlerrtext)
			rollback;
			return
		end if
		UPDATE pacientesquejas SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando PACIENETSquejas",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		SELECT 
			pacientes_cohortes.id_cohorte_pac into :maximi
		FROM 
			pacientes_cohortes INNER JOIN pacientes_cohortes AS pacientes_cohortes_1 
			ON (pacientes_cohortes.id_grupoetareo = pacientes_cohortes_1.id_grupoetareo) 
			AND (pacientes_cohortes.documento = pacientes_cohortes_1.documento)
		WHERE 
			(((pacientes_cohortes.tipodoc)=:tdocx) AND ((pacientes_cohortes.documento)=:docx) 
			AND ((pacientes_cohortes_1.tipodoc)<>pacientes_cohortes.tipodoc));
		
		if maximi=0 then 
			UPDATE pacientes_cohortes SET TipoDoc = :tdocnew, Documento = :docnew
			WHERE TipoDoc=:tdocx AND Documento=:docx;
			if sqlca.sqlcode=-1 then
				messagebox("Error Actualizando pacientes_cohortes",sqlca.sqlerrtext)
				rollback;
				return
			end if
		else
			delete from pacientes_cohortes_historial where id_cohorte_pac=:maximi;
			if sqlca.sqlcode=-1 then
				messagebox("Error borrando fila de pacientes_cohortes_historial",sqlca.sqlerrtext)
				rollback;
				return
			end if
			delete from pacientes_cohortes where id_cohorte_pac=:maximi;
			if sqlca.sqlcode=-1 then
				messagebox("Error borrando fila de pacientes_cohortes",sqlca.sqlerrtext)
				rollback;
				return
			end if
		end if
		
		setnull(maximi)
		
		UPDATE pacientes_pvunerable SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE 
			(TipoDoc=:tdocx AND Documento=:docx 
			AND NOT EXISTS (
			  	SELECT  
				  	*
				FROM 
						pacientes_pvunerable AS pv
				WHERE 
					(((pv.tipodoc)=:tdocnew) AND ((pv.documento)=:docnew)
	  				and pv.cod_pvulnera=pacientes_pvunerable.cod_pvulnera))
			);
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando pacientes_pvulnerable",sqlca.sqlerrtext)
			rollback;
			return
		end if		
		
		delete from EmpPac 
		WHERE EmpPac.TipoDoc=:tdocx AND EmpPac.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Borrando EmpPac",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE CitasAsig SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE CitasAsig.TipoDoc=:tdocx AND CitasAsig.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando CitasAsig",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE Historial SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE Historial.TipoDoc=:tdocx AND Historial.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Historial",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE HistLaboral SET NHistoria = :histnew
		WHERE HistLaboral.NHistoria=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando HistLaboral",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE CompFamiliar SET NHistoria = :histnew
		WHERE CompFamiliar.NHistoria=:histx and contador not in (select contador from compfamiliar where nhistoria=:histnew);
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando CompFamiliar",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		INSERT INTO Historiaubica ( NHistoria, ntraslado, Fechatraslado, archivo, estan, entrepano, Observacion, estado )
		SELECT :histnew AS nueva, Historiaubica.ntraslado, Historiaubica.Fechatraslado, Historiaubica.archivo, Historiaubica.estan, Historiaubica.entrepano, Historiaubica.Observacion, Historiaubica.estado
		FROM Historiaubica LEFT outer JOIN Historiaubica AS Historiaubica_1 ON Historiaubica.ntraslado = Historiaubica_1.ntraslado
		WHERE (((Historiaubica_1.ntraslado) Is Null) AND ((Historiaubica_1.NHistoria)=:histnew) AND ((Historiaubica.NHistoria)=:histx));
		if sqlca.sqlcode=-1 then
			messagebox("Error Insertando en HistoriaUbica",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE Historiaprestamo SET NHistoria = :histnew
		WHERE Historiaprestamo.NHistoria=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Historiaprestamo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		SELECT count(1) into :maximi
		FROM  VacunaPac 
		WHERE (VacunaPac.Historia=:histnew);
		if maximi=0 then
			if g_motor='postgres'	 then
				INSERT INTO VacunaPac ( Historia, CodVacuna, Estado )
				SELECT  :histnew AS nueva, VacunaPac.CodVacuna, VacunaPac.Estado
				FROM VacunaPac
				WHERE (((VacunaPac.Historia)=:histx) AND ((historia||codvacuna) In (SELECT Historia||CodVacuna FROM VacunaPac WHERE (((VacunaPac.Historia)= :histnew)))));
			else
				INSERT INTO VacunaPac ( Historia, CodVacuna, Estado )
				SELECT  :histnew AS nueva, VacunaPac.CodVacuna, VacunaPac.Estado
				FROM VacunaPac
				WHERE (((VacunaPac.Historia)=:histx) AND ((historia+codvacuna) In (SELECT Historia+CodVacuna FROM VacunaPac WHERE (((VacunaPac.Historia)= :histnew)))));
			end if
			if sqlca.sqlcode=-1 then
				messagebox("Error Insertando en VacunaPac",sqlca.sqlerrtext)
				rollback;
				return
			end if
		end if
		setnull(maximi)
		
		if g_motor='postgres'	then
			UPDATE VacunaDosis SET Historia =  :histnew
			WHERE 
				(((VacunaDosis.Historia)=:histx) AND 
				((historia||codvacuna||ndosis) In (SELECT Historia||CodVacuna||ndosis FROM vacunadosis WHERE (((vacunadosis.historia)= :histnew)))));
		else
			UPDATE VacunaDosis SET Historia =  :histnew
			WHERE 
				(((VacunaDosis.Historia)=:histx) AND 
				((historia+codvacuna+ndosis) In (SELECT Historia+CodVacuna+ndosis FROM vacunadosis WHERE (((vacunadosis.historia)= :histnew)))));
		end if
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando VacunaDosis",sqlca.sqlerrtext)
			rollback;
			return
		end if


		SELECT Max(PACIENTES_IMAGEN.NRO_IMAG) into :maximi
		FROM PACIENTES_IMAGEN
		WHERE (((PACIENTES_IMAGEN.TIPODOC)=:tdocnew) AND ((PACIENTES_IMAGEN.DOCUMENTO)=:docnew));
		if isnull(maximi) then maximi=0
		
		UPDATE pacientes_imagen SET  TipoDoc=:tdocnew, Documento = :docnew,nro_imag=:maximi+nro_imag
		WHERE (((pacientes_imagen.TipoDoc)=:tdocx) AND ((pacientes_imagen.Documento)=:docx)) ;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando pacientes_imagen",sqlca.sqlerrtext)
			rollback;
			return
		end if
		setnull(maximi)
		
		if g_motor='postgres'	then
			UPDATE pacientes_biometria SET TipoDoc = :tdocnew, Documento = :docnew
			WHERE (((pacientes_biometria.TipoDoc)=:tdocx) AND ((pacientes_biometria.Documento)=:docx) AND ((tipodoc||documento||dedo) In (SELECT tipodoc||documento||dedo 
			FROM pacientes_biometria
			WHERE (((pacientes_biometria.tipodoc)=:tdocnew) AND ((pacientes_biometria.documento)=:docnew)))));
		else
			UPDATE pacientes_biometria SET TipoDoc = :tdocnew, Documento = :docnew
			WHERE (((pacientes_biometria.TipoDoc)=:tdocx) AND ((pacientes_biometria.Documento)=:docx) AND ((tipodoc+documento+dedo) In (SELECT tipodoc+documento+dedo 
			FROM pacientes_biometria
			WHERE (((pacientes_biometria.tipodoc)=:tdocnew) AND ((pacientes_biometria.documento)=:docnew)))));
		end if
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando paciente_biometria",sqlca.sqlerrtext)
			rollback;
			return
		end if
	
		UPDATE FactCpo SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE FactCpo.TipoDoc=:tdocx AND FactCpo.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando FactCpo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE acumcab SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE acumcab.TipoDoc=:tdocx AND acumcab.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Acumcab",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE tesopagarecab SET tipodoc = :tdocnew, documento = :docnew
		WHERE tesopagarecab.tipodoc=:tdocx AND tesopagarecab.documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando tesopagarecab",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE tesorecajcab SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE tesorecajcab.TipoDoc=:tdocx AND tesorecajcab.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando tesorecajcab",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE IngresoADX SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE IngresoADX.TipoDoc=:tdocx AND IngresoADX.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando IngresoADX",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE QxCabActo SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE QxCabActo.TipoDoc=:tdocx AND QxCabActo.Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando QxCabActo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE odongramacb SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Odongramacb",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE odontratacab SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Odontratacab",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE resultadoscab SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Resultadoscab",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE camas SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Camas",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE pacientesnotas SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando PacientesNotas",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE pyp_pac_condi SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando PyP_pac_Condi",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE Odontratacab SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando OdonTrataCab",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE pyp_progpaci SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Pyp_ProgPaci",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE qxcita SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando QxCita",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE cotiza_cab SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE TipoDoc=:tdocx AND Documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Cotiza_Cab",sqlca.sqlerrtext)
			rollback;
			return
		end if
				
		UPDATE gral_ma_integrantes_nucleo SET tdoc= :tdocnew, docu= :docnew
		WHERE tdoc=:tdocx AND docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando GRAL_MA_INTEGRANTES_NUCLEO ",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE pacientes_antecedente SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE 
			TipoDoc=:tdocx AND Documento=:docx 
			AND NOT EXISTS (
	  			SELECT  
				  	*
				FROM 
					pacientes_antecedente AS pa
				WHERE 
					(((pa.tipodoc=:tdocnew) AND (pa.documento=:docnew)
	  				AND(pa.cod_tipoa=pacientes_antecedente.cod_tipoa) 
					AND(pa.item=pacientes_antecedente.item)))
			);
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando pacientes_antecedentes",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		
		UPDATE pacientes_alergias SET TipoDoc = :tdocnew, Documento = :docnew
		WHERE 
			TipoDoc=:tdocx AND Documento=:docx 
			AND NOT EXISTS (
	  			SELECT  
				  	*
				FROM 
					pacientes_alergias AS pa
				WHERE 
					(((pa.tipodoc=:tdocnew) AND (pa.documento=:docnew)
		  			AND (pa.cod_tipoa=pacientes_alergias.cod_tipoa) 
		  			AND (pa.cod_tipo=pacientes_alergias.cod_tipo)
					AND (pa. cod_alergia=pacientes_alergias.cod_alergia)))
				);
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando pacientes_antecedentes",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		//
		delete from embarazo where historia=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de Embarazo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from embarazocontrol WHERE EmbarazoControl.Historia=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de EmbarazoControl",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from Historiaubica WHERE Historiaubica.NHistoria=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de Historiaubica",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from Vacunadosis WHERE Vacunadosis.Historia=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de VacunaDosis",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from VacunaPac WHERE VacunaPac.Historia=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de VacunaPac",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from compfamiliar WHERE nHistoria=:histx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de Compfamiliar",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from pacientes_imagen where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de pacientes_imagen",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from pacientes_biometria where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de Pacientes_biometria",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from pacientes_alergias where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de pacientes_alergias",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from pacientes_antecedente where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de pacientes_antecedente",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from pacientes_pvunerable where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de pacientes_pvunerable",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from pacientes where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando fila de Pacientes",sqlca.sqlerrtext)
			rollback;
			return
		end if
		cuantos ++
	end if
next
commit;
if cuantos=0 then 
	messagebox("Atención","No Eligió ningún paciente a eliminar")
	return
end if
close(parent)
end event

type pb_4 from picturebutton within w_borra_repetid
integer x = 2642
integer y = 620
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Fila"
end type

event clicked;dw_2.deleterow(0)
end event

type pb_3 from picturebutton within w_borra_repetid
integer x = 2642
integer y = 484
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Fila"
end type

event clicked;dw_2.scrolltorow(dw_2.insertrow(0))
dw_2.setfocus()
end event

type pb_2 from picturebutton within w_borra_repetid
integer x = 2642
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
boolean originalsize = true
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar Pacientes"
end type

event clicked;if dw_2.rowcount()=0 then return
openwithparm(win_busqueda,dw_2)
end event

type pb_1 from picturebutton within w_borra_repetid
integer x = 2642
integer y = 64
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar2.gif"
string disabledname = "d_busca2r.gif"
alignment htextalign = left!
string powertiptext = "Buscar Pacientes"
end type

event clicked;openwithparm(win_busqueda,dw_1)
end event

type dw_2 from datawindow within w_borra_repetid
integer x = 55
integer y = 356
integer width = 2551
integer height = 1196
integer taborder = 20
string title = "none"
string dataobject = "dw_pac_gral_elim"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event doubleclicked;if dwo.name='documento' then
	pb_2.triggerevent(clicked!)
end if
end event

event itemchanged;this.accepttext()
string doc,tdoc
tdoc=this.getitemstring(this.getrow(),"tipodoc")
doc=this.getitemstring(this.getrow(),"documento")
string snulo
datetime fnula
setnull(fnula)
setnull(snulo)
if this.getcolumnname()="tipodoc" and doc <> "" then
	this.setitem(this.getrow(),"documento",snulo)
	this.setitem(this.getrow(),"historia",snulo)
	this.setitem(this.getrow(),"nombre1",snulo)
	this.setitem(this.getrow(),"nombre2",snulo)
	this.setitem(this.getrow(),"apellido1",snulo)
	this.setitem(this.getrow(),"apellido2",snulo)
	this.setitem(this.getrow(),"sexo",snulo)
	this.setitem(this.getrow(),"fnacimiento",fnula)
	return
end if
if this.getcolumnname()="documento" and doc = "" then
	this.setitem(this.getrow(),'historia',snulo)
	this.setitem(this.getrow(),'nombre1',snulo)
	this.setitem(this.getrow(),'fnacimiento',fnula)
end if
if this.getcolumnname()="documento" and doc <> "" then
	long ojo1,ojo2
	string hist,nom1,nom2,ape1,ape2,sex
	datetime fnac
	setnull(nom1)
	setnull(fnac)
	setnull(hist)
	ojo1=this.find("documento='"+doc+"' and tipodoc='"+tdoc+"'",1,this.getrow())
	ojo2=this.find("documento='"+doc+"' and tipodoc='"+tdoc+"'",this.getrow()+1,this.rowcount())
	if (tdoc<>dw_1.getitemstring(1,1) or doc<>dw_1.getitemstring(1,2)) and (ojo1=this.getrow()) and (ojo2=this.getrow() or ojo2=0)then
		select historia,nombre1,nombre2,apellido1,apellido2,sexo,fnacimiento
		into :hist,:nom1,:nom2,:ape1,:ape2,:sex,:fnac from pacientes where
		tipodoc=:tdoc and documento=:doc;
		if isnull(hist) then messagebox("Atención","Este Paciente no existe")
	else
		messagebox("Atención","Este paciente ya lo eligió")
	end if
	this.setitem(this.getrow(),'historia',hist)
	this.setitem(this.getrow(),'nombre1',nom1)
	this.setitem(this.getrow(),'nombre2',nom2)
	this.setitem(this.getrow(),'apellido1',ape1)
	this.setitem(this.getrow(),'apellido2',ape2)
	this.setitem(this.getrow(),'sexo',sex)
	this.setitem(this.getrow(),'fnacimiento',fnac)
end if
end event

type dw_1 from datawindow within w_borra_repetid
integer x = 55
integer y = 68
integer width = 2537
integer height = 128
integer taborder = 20
string title = "none"
string dataobject = "dw_pac_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;this.accepttext()
string doc,tdoc
tdoc=this.getitemstring(1,"tipodoc")
doc=this.getitemstring(1,"documento")
string snulo
datetime fnula
setnull(fnula)
setnull(snulo)
if this.getcolumnname()="tipodoc" and doc <> "" then
	this.setitem(1,"documento",snulo)
	this.setitem(1,"historia",snulo)
	this.setitem(1,"nombre1",snulo)
	this.setitem(1,"nombre2",snulo)
	this.setitem(1,"apellido1",snulo)
	this.setitem(1,"apellido2",snulo)
	this.setitem(1,"sexo",snulo)
	this.setitem(1,"fnacimiento",fnula)
	return
end if
if this.getcolumnname()="documento" and doc = "" then
	this.setitem(this.getrow(),'historia',snulo)
	this.setitem(this.getrow(),'nombre1',snulo)
	this.setitem(this.getrow(),'fnacimiento',fnula)
end if
if this.getcolumnname()="documento" and doc <> "" then
	if dw_2.find("tipodoc='"+tdoc+"' and documento='"+doc+"'",1,dw_2.rowcount())=0 then
		if this.retrieve(tdoc,doc)=0 then
			this.insertrow(1)
			this.setitem(1,1,tdoc)
			this.setitem(1,2,doc)
			messagebox("Atención","Este paciente no existe")
		end if
	else
		this.setitem(this.getrow(),'historia',snulo)
		this.setitem(this.getrow(),'nombre1',snulo)
		this.setitem(this.getrow(),'sexo',snulo)
		this.setitem(this.getrow(),'fnacimiento',fnula)
		messagebox("Atención","Ya eligió a este Paciente")
	end if
end if
end event

event doubleclicked;if dwo.name='documento' then
	pb_1.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_borra_repetid
integer x = 23
integer y = 16
integer width = 2811
integer height = 220
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documento al que pasaran los otros Pacientes:"
end type

type gb_2 from groupbox within w_borra_repetid
integer x = 18
integer y = 280
integer width = 2807
integer height = 1284
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pacientes a ser Eliminados:"
end type

