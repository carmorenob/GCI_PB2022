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
integer width = 3589
integer height = 1868
boolean titlebar = true
string title = "Eliminar Terceros Repetidos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
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
integer x = 1979
integer y = 1592
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
integer x = 1810
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

event clicked;if isnull(dw_1.getitemstring(1,'persona')) then
	messagebox("Atención","Debe escoger el Tercero al que se van a unir los datos de los otros terceros")
	return
end if

long j,cuantos=0,emple,docp
string tdocnew,docnew,tdocx,docx,dverif,ped_dverif,lugp,codp
datetime faudita

faudita=datetime(today(),now())
tdocnew=dw_1.getitemstring(1,1)
docnew=dw_1.getitemstring(1,2)
dverif=dw_1.getitemstring(1,'dverificacion')
ped_dverif=dverif
if isnull(ped_dverif) then ped_dverif=''
for j=1 to dw_2.rowcount()
	tdocx=dw_2.getitemstring(j,1)
	docx=dw_2.getitemstring(j,2)
	///////
	choose case sqlca.dbms
		case 'ODBC'
			if g_motor='postgres' then
				UPDATE CONT_SALDOS 
					SET 
					saldodebito = CONT_SALDOS.saldodebito+ante.saldodebito,
					saldocredito = CONT_SALDOS.saldocredito+ante.saldocredito, 
					Debito = CONT_SALDOS.debito+ante.debito, 
					Credito = CONT_SALDOS.credito+ante.credito, 
					cierredebito = CONT_SALDOS.cierredebito+ante.cierredebito,
					cierrecredito = CONT_SALDOS.cierrecredito+ante.cierrecredito, 
					SaldoCorriente = CONT_SALDOS.saldocorriente+ante.saldocorriente, 
					SaldoNoCorriente = CONT_SALDOS.saldonocorriente+ante.saldonocorriente, 
					CierreCorriente = CONT_SALDOS.cierrecorriente+ante.cierrecorriente, 
					CierreNoCorriente = CONT_SALDOS.cierrenocorriente+ante.cierrenocorriente
				FROM CONT_SALDOS as CONT_S INNER JOIN CONT_SALDOS AS ante ON (CONT_S.Cuenta = ante.Cuenta) 
				AND (CONT_S.mes = ante.mes) AND (CONT_S.ano = ante.ano) AND (CONT_S.COD_EMPRESA = ante.COD_EMPRESA) 
				WHERE (((CONT_SALDOS.CUFuncional) Is Null) AND ((ante.CUFuncional) Is Null) AND ((CONT_SALDOS.tipodoc)=:tdocnew) 
				AND ((CONT_SALDOS.nit)=:docnew) AND ((ante.tipodoc)=:tdocx) AND ((ante.nit)=:docx));
			else
				UPDATE CONT_SALDOS INNER JOIN CONT_SALDOS AS ante ON (CONT_SALDOS.Cuenta = ante.Cuenta) 
				AND (CONT_SALDOS.mes = ante.mes) AND (CONT_SALDOS.ano = ante.ano) AND (CONT_SALDOS.COD_EMPRESA = ante.COD_EMPRESA) 
				SET ante.Dverificacion = 'X', CONT_SALDOS.saldodebito = CONT_SALDOS.saldodebito+ante.saldodebito,
				 CONT_SALDOS.saldocredito = CONT_SALDOS.saldocredito+ante.saldocredito, CONT_SALDOS.Debito = CONT_SALDOS.debito+ante.debito, 
				CONT_SALDOS.Credito = CONT_SALDOS.credito+ante.credito, CONT_SALDOS.cierredebito = CONT_SALDOS.cierredebito+ante.cierredebito,
				 CONT_SALDOS.cierrecredito = CONT_SALDOS.cierrecredito+ante.cierrecredito, 
				CONT_SALDOS.SaldoCorriente = CONT_SALDOS.saldocorriente+ante.saldocorriente, 
				CONT_SALDOS.SaldoNoCorriente = CONT_SALDOS.saldonocorriente+ante.saldonocorriente, 
				CONT_SALDOS.CierreCorriente = CONT_SALDOS.cierrecorriente+ante.cierrecorriente, 
				CONT_SALDOS.CierreNoCorriente = CONT_SALDOS.cierrenocorriente+ante.cierrenocorriente
				where (((CONT_SALDOS.CUFuncional) Is Null) AND ((ante.CUFuncional) Is Null) AND ((CONT_SALDOS.tipodoc)=:tdocnew) 
				AND ((CONT_SALDOS.nit)=:docnew) AND ((ante.tipodoc)=:tdocx) AND ((ante.nit)=:docx));
			end If
			if sqlca.sqlcode=-1 then
				messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
				rollback;
				return
			end if
			if g_motor='postgres' then
				UPDATE CONT_SALDOS 
				SET
				  saldodebito = CONT_SALDOS.saldodebito+ante.saldodebito, 
				  saldocredito = CONT_SALDOS.saldocredito+ante.saldocredito, 
				  Debito = CONT_SALDOS.debito+ante.debito, 
				  Credito = CONT_SALDOS.credito+ante.credito, 
				  cierredebito = CONT_SALDOS.cierredebito+ante.cierredebito, 
				  cierrecredito = CONT_SALDOS.cierrecredito+ante.cierrecredito, 
				  SaldoCorriente = CONT_SALDOS.saldocorriente+ante.saldocorriente, 
				  SaldoNoCorriente = CONT_SALDOS.saldonocorriente+ante.saldonocorriente, 
				  CierreCorriente = CONT_SALDOS.cierrecorriente+ante.cierrecorriente, 
				  CierreNoCorriente = CONT_SALDOS.cierrenocorriente+ante.cierrenocorriente
				FROM 
					CONT_SALDOS as CONT_S INNER JOIN CONT_SALDOS AS ante ON (CONT_S.ccosto = ante.ccosto) 
					AND (CONT_S.CUFuncional = ante.CUFuncional) AND (CONT_S.Cuenta = ante.Cuenta) 
					AND (CONT_S.mes = ante.mes) AND (CONT_S.ano = ante.ano) 
				  AND (CONT_S.COD_EMPRESA = ante.COD_EMPRESA) 
				WHERE (((CONT_S.CUFuncional) Is Not Null) AND ((CONT_S.tipodoc)=:tdocnew) 
				AND ((CONT_S.nit)=:docnew) AND ((ante.tipodoc)=:tdocx) AND ((ante.nit)=:docx));
			else
				UPDATE CONT_SALDOS INNER JOIN CONT_SALDOS AS ante ON (CONT_SALDOS.ccosto = ante.ccosto) 
				AND (CONT_SALDOS.CUFuncional = ante.CUFuncional) AND (CONT_SALDOS.Cuenta = ante.Cuenta) 
				AND (CONT_SALDOS.mes = ante.mes) AND (CONT_SALDOS.ano = ante.ano) 
				AND (CONT_SALDOS.COD_EMPRESA = ante.COD_EMPRESA) SET ante.Dverificacion = 'X', 
				CONT_SALDOS.saldodebito = CONT_SALDOS.saldodebito+ante.saldodebito, 
				CONT_SALDOS.saldocredito = CONT_SALDOS.saldocredito+ante.saldocredito, 
				CONT_SALDOS.Debito = CONT_SALDOS.debito+ante.debito, CONT_SALDOS.Credito = CONT_SALDOS.credito+ante.credito, 
				CONT_SALDOS.cierredebito = CONT_SALDOS.cierredebito+ante.cierredebito, 
				CONT_SALDOS.cierrecredito = CONT_SALDOS.cierrecredito+ante.cierrecredito, 
				CONT_SALDOS.SaldoCorriente = CONT_SALDOS.saldocorriente+ante.saldocorriente, 
				CONT_SALDOS.SaldoNoCorriente = CONT_SALDOS.saldonocorriente+ante.saldonocorriente, 
				CONT_SALDOS.CierreCorriente = CONT_SALDOS.cierrecorriente+ante.cierrecorriente, 
				CONT_SALDOS.CierreNoCorriente = CONT_SALDOS.cierrenocorriente+ante.cierrenocorriente
				WHERE (((CONT_SALDOS.CUFuncional) Is Not Null) AND ((CONT_SALDOS.tipodoc)=:tdocnew) 
				AND ((CONT_SALDOS.nit)=:docnew) AND ((ante.tipodoc)=:tdocx) AND ((ante.nit)=:docx));
			end If
			if sqlca.sqlcode=-1 then
				messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
				rollback;
				return
			end if
		case 'SYC Adaptive Server Enterprise','MSS Microsoft SQL Server','OLE DB'
			UPDATE CONT_SALDOS SET  CONT_SALDOS.saldodebito = CONT_SALDOS.saldodebito+ante.saldodebito, 
			CONT_SALDOS.saldocredito = CONT_SALDOS.saldocredito+ante.saldocredito, 
			CONT_SALDOS.Debito = CONT_SALDOS.debito+ante.debito, 
			CONT_SALDOS.Credito = CONT_SALDOS.credito+ante.credito, 
			CONT_SALDOS.cierredebito = CONT_SALDOS.cierredebito+ante.cierredebito, 
			CONT_SALDOS.cierrecredito = CONT_SALDOS.cierrecredito+ante.cierrecredito, 
			CONT_SALDOS.SaldoCorriente = CONT_SALDOS.saldocorriente+ante.saldocorriente, 
			CONT_SALDOS.SaldoNoCorriente = CONT_SALDOS.saldonocorriente+ante.saldonocorriente, 
			CONT_SALDOS.CierreCorriente = CONT_SALDOS.cierrecorriente+ante.cierrecorriente, 
			CONT_SALDOS.CierreNoCorriente = CONT_SALDOS.cierrenocorriente+ante.cierrenocorriente
			from cont_saldos , CONT_SALDOS AS ante
			WHERE (((CONT_SALDOS.COD_EMPRESA)=ante.COD_EMPRESA) AND ((CONT_SALDOS.ano)=ante.ano) 
			AND ((CONT_SALDOS.mes)=ante.mes) AND ((CONT_SALDOS.Cuenta)=ante.Cuenta) 
			AND ((CONT_SALDOS.CUFuncional)=ante.CUFuncional) AND ((CONT_SALDOS.ccosto)=ante.ccosto) 
			AND ((CONT_SALDOS.CUFuncional) Is Not Null) AND ((CONT_SALDOS.tipodoc)=:tdocnew) 
			AND ((CONT_SALDOS.nit)=:docnew) AND ((ante.tipodoc)=:tdocx) AND ((ante.nit)=:docx));
			if sqlca.sqlcode=-1 then
				messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
				rollback;
				return
			end if
			UPDATE CONT_SALDOS SET  
			dverificacion='X'
			from CONT_SALDOS ,CONT_SALDOS AS nuevos 
			where CONT_SALDOS.Cuenta = nuevos.Cuenta 
			AND CONT_SALDOS.mes = nuevos.mes AND CONT_SALDOS.ano = nuevos.ano 
			AND CONT_SALDOS.COD_EMPRESA = nuevos.COD_EMPRESA and
			CONT_SALDOS.CUFuncional=nuevos.cufuncional and cont_saldos.ccosto=nuevos.ccosto and
			CONT_SALDOS.CUFuncional Is not Null AND nuevos.tipodoc=:tdocnew 
			AND nuevos.nit=:docnew AND cont_saldos.tipodoc=:tdocx AND cont_saldos.nit=:docx;
			if sqlca.sqlcode=-1 then
				messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
				rollback;
				return
			end if
			UPDATE CONT_SALDOS SET  
			CONT_SALDOS.saldodebito = CONT_SALDOS.saldodebito+ante.saldodebito, 
			CONT_SALDOS.saldocredito = CONT_SALDOS.saldocredito+ante.saldocredito, 
			CONT_SALDOS.Debito = CONT_SALDOS.debito+ante.debito, CONT_SALDOS.Credito = CONT_SALDOS.credito+ante.credito, 
			CONT_SALDOS.cierredebito = CONT_SALDOS.cierredebito+ante.cierredebito, 
			CONT_SALDOS.cierrecredito = CONT_SALDOS.cierrecredito+ante.cierrecredito, 
			CONT_SALDOS.SaldoCorriente = CONT_SALDOS.saldocorriente+ante.saldocorriente, 
			CONT_SALDOS.SaldoNoCorriente = CONT_SALDOS.saldonocorriente+ante.saldonocorriente, 
			CONT_SALDOS.CierreCorriente = CONT_SALDOS.cierrecorriente+ante.cierrecorriente, 
			CONT_SALDOS.CierreNoCorriente = CONT_SALDOS.cierrenocorriente+ante.cierrenocorriente
			from CONT_SALDOS ,CONT_SALDOS AS ante 
			where CONT_SALDOS.Cuenta = ante.Cuenta 
			AND CONT_SALDOS.mes = ante.mes AND CONT_SALDOS.ano = ante.ano 
			AND CONT_SALDOS.COD_EMPRESA = ante.COD_EMPRESA and
			CONT_SALDOS.CUFuncional Is Null AND CONT_SALDOS.tipodoc=:tdocnew 
			AND CONT_SALDOS.nit=:docnew AND ante.tipodoc=:tdocx AND ante.nit=:docx;
			if sqlca.sqlcode=-1 then
				messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
				rollback;
				return
			end if
			UPDATE CONT_SALDOS SET  
			dverificacion='X'
			from CONT_SALDOS ,CONT_SALDOS AS nuevos 
			where CONT_SALDOS.Cuenta = nuevos.Cuenta 
			AND CONT_SALDOS.mes = nuevos.mes AND CONT_SALDOS.ano = nuevos.ano 
			AND CONT_SALDOS.COD_EMPRESA = nuevos.COD_EMPRESA and
			CONT_SALDOS.CUFuncional Is Null AND nuevos.tipodoc=:tdocnew 
			AND nuevos.nit=:docnew AND cont_saldos.tipodoc=:tdocx AND cont_saldos.nit=:docx;
			if sqlca.sqlcode=-1 then
				messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
				rollback;
				return
			end if
	end choose
	
	delete from cont_saldos where dverificacion='X';
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
		rollback;
		return
	end if
	// netear
	update cont_saldos set saldodebito=saldodebito  -saldocredito  , 
	saldocredito=0, cierredebito=saldodebito + debito -saldocredito -credito,
	cierrecredito=0
	where (saldodebito<>0 and saldocredito<>0) or (debito<>0 and credito<>0);
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
		rollback;
		return
	end if
	//revisar negativos
	update cont_saldos set saldodebito=0 , saldocredito= -saldodebito 
	where saldodebito <0;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update cont_saldos set cierredebito=0 , cierrecredito= -cierredebito 
	where cierredebito <0;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update cont_saldos set credito=-debito , debito=0 
	where debito <0;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update cont_saldos set debito=-credito , credito=0 
	where credito <0;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando cont_saldos",sqlca.sqlerrtext)
		rollback;
		return
	end if
	//fin revisar negativos
	uo_datastore ds
	ds=create uo_datastore
	ds.dataobject='dw_unifica_saldos'
	ds.settransobject(sqlca)
	ds.retrieve(tdocx,docx)
	string clug,ccost,uf,cta,new_cod
	long l_j
	for l_j=1 to ds.rowcount()
		cta=ds.getitemstring(l_j,'cuenta')
		clug=ds.getitemstring(l_j,'clugar')
		uf=ds.getitemstring(l_j,'cufuncional')
		ccost=ds.getitemstring(l_j,'ccosto')
		new_cod=cta
		if not isnull(clug) then new_cod+='-'+clug
		if not isnull(uf) then new_cod+='-'+uf+'-'+ccost
		new_cod+='-'+docnew
		ds.setitem(l_j,'cod_general',new_cod)
		ds.setitem(l_j,'tipodoc',tdocnew)
		ds.setitem(l_j,'nit',docnew)
		ds.setitem(l_j,'dverificacion',dverif)
	next
	if ds.update()=-1 then return 
	
	update contra set tipodoc=:tdocnew,documento=:docnew	where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Contra",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update sum_mvto_cab set tipodoc=:tdocnew,documento=:docnew	where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando sum_mvto_cab",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update cont_doc_cp set tipodoc=:tdocnew,nit=:docnew	where tipodoc=:tdocx and nit=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando cont_doc_cp",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update cont_doc_plant_cp set tipodoc=:tdocnew,nit=:docnew 	where tipodoc=:tdocx and nit=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando cont_doc_plant_cp",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update empresa set tipodoc=:tdocnew , nit=:docnew where tipodoc=:tdocx and nit=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Empresa",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update nom_concep set tipodoc=:tdocnew,documento=:docnew	where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando nom_concep",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	update tesorelfact_rete set tipodoc=:tdocnew,documento=:docnew	where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando tesorelfact_rete",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update tesotranscab set tipodoc=:tdocnew,documento=:docnew	where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando Tesotranscab",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update mod_relacion_origen set char_orig3=:tdocnew,char_doc3=:docnew	where char_orig3=:tdocx and char_doc3=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando mod_relacion_origen",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	update teso_rep_rete_cp set tipodoc=:tdocnew,documento=:docnew where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando teso_rep_rete_cp",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update car_cobro_cab set tipodoc=:tdocnew,documento=:docnew where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando car_cobro_cab",sqlca.sqlerrtext)
		rollback;
		return
	end if

	
	select coddocu, clugar, numdoc, count(*) into :codp,:lugp,:docp,:emple
	from pre_dispo_ter
	where (((documento)=:docnew) and ((pre_dispo_ter.tipodoc)=:tdocnew or (pre_dispo_ter.tipodoc)=:tdocx))
	group by pre_dispo_ter.coddocu, pre_dispo_ter.clugar, pre_dispo_ter.numdoc
	having (((count(*))>1));
	if sqlca.sqlcode=-1 then
		messagebox("Error Leyendo Predispoter",sqlca.sqlerrtext)
		rollback;
		return
	end if
	if emple<=1 then 
		update pre_dispo_ter set tipodoc=:tdocnew,documento=:docnew where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando pre_dispo_ter x el si",sqlca.sqlerrtext)
			rollback;
			return
		end if
	else
		update pre_dispo_ter set monto = pre_dispo_ter.monto+pre_dispo_ter_1.monto, monto_reser = pre_dispo_ter.monto_reser+pre_dispo_ter_1.monto_reser, monto_giro = pre_dispo_ter.monto_giro+pre_dispo_ter_1.monto_giro
		from pre_dispo_ter inner join pre_dispo_ter as pre_dispo_ter_1 on (pre_dispo_ter.documento = pre_dispo_ter_1.documento) and (pre_dispo_ter.numdoc = pre_dispo_ter_1.numdoc) and (pre_dispo_ter.clugar = pre_dispo_ter_1.clugar) and (pre_dispo_ter.coddocu = pre_dispo_ter_1.coddocu) 
		where (((pre_dispo_ter.tipodoc)=:tdocnew) and ((pre_dispo_ter.documento)=:docnew) and ((pre_dispo_ter_1.tipodoc)=:tdocx) and ((pre_dispo_ter_1.documento)=:docx));
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando pre_dispo_ter x el no",sqlca.sqlerrtext)
			rollback;
			return
		end if
		delete from pre_dispo_ter where tipodoc =:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando pre_dispo_ter x el no",sqlca.sqlerrtext)
			rollback;
			return
		end if
		setnull(emple)
	end if

	update tesopagodircab set tipodoc=:tdocnew,documento=:docnew where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando tesopagodircab",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update tesocuentasmovi set tipodoc=:tdocnew,documento=:docnew where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando tesocuentasmovi",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update tesocajagasto set tipodoc=:tdocnew,documento=:docnew where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando tesocajagasto",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update tesorelfactcpo set tipodoc=:tdocnew,documento=:docnew 	where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Actualizando tesorelfactCpo",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	select count(*) into :emple from empleados where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error Leyendo Empleados",sqlca.sqlerrtext)
		rollback;
		return
	end if
	if emple=1 then 
		select count(*) into :emple from empleados where tipodoc=:tdocnew and documento=:docnew;
		if sqlca.sqlcode=-1 then
			messagebox("Error Leyendo Empleados",sqlca.sqlerrtext)
			rollback;
			return
		end if
		if emple=0 then
			INSERT INTO empleados ( TipoDoc, documento, FOTOGRAFIA, nombres, apellidos, APELLIDO2, INGRE_DISTRI, INGRE_EMPRE, FECHA_RETIRO, ULTIMO_CARGO, estado, usuario, USUFECHA, codtsup )
			SELECT :tdocnew , :docnew, EMPLEADOS.FOTOGRAFIA, EMPLEADOS.nombres, EMPLEADOS.apellidos, EMPLEADOS.APELLIDO2, EMPLEADOS.INGRE_DISTRI, EMPLEADOS.INGRE_EMPRE, EMPLEADOS.FECHA_RETIRO, EMPLEADOS.ULTIMO_CARGO, EMPLEADOS.estado, EMPLEADOS.usuario, EMPLEADOS.USUFECHA, EMPLEADOS.codtsup
			FROM EMPLEADOS
			WHERE (((EMPLEADOS.TipoDoc)=:tdocx) AND ((EMPLEADOS.documento)=:docx));
			if sqlca.sqlcode=-1 then
				messagebox("Error insertando en Empleados",sqlca.sqlerrtext)
				rollback;
				return
			end if
		end if
		
		delete from hv_edusuper where tipodoc =:tdocx and num_docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando hv_edusuper",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from hv_eduotro where tipodoc =:tdocx and num_docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando hv_eduotro",sqlca.sqlerrtext)
			rollback;
			return
		end if
			
		delete from hv_puinlogro where tipodoc =:tdocx and num_docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando hv_puinlogro",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from hv_emplehijo where tipodoc =:tdocx and num_docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando hv_emplehijo",sqlca.sqlerrtext)
			rollback;
			return
		end if
			
		delete from hv_actparti where tipodoc =:tdocx and num_docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando hv_actparti",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from hv_idioma where tipodoc =:tdocx and num_docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando hv_idioma",sqlca.sqlerrtext)
			rollback;
			return
		end if
			
		delete from hv_empante where tipodoc =:tdocx and num_docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando hv_empante",sqlca.sqlerrtext)
			rollback;
			return
		end if
			
		delete from hv_pasatiempo where tipodoc =:tdocx and num_docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando hv_pasatiempo",sqlca.sqlerrtext)
			rollback;
			return
		end if
				
		delete from hv_datopersonal where tipodoc =:tdocx and num_docu=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando hv_datopersonal",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		select count(*) into :emple from emplecargo where tipodoc=:tdocnew and documento=:docnew;
		if sqlca.sqlcode=-1 then
			messagebox("Error Leyendo Emplecargo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		if emple=0 then
			INSERT INTO emplecargo ( TipoDoc, documento, NCARGO, cargo, codrela, tipoemple, fecha_INICIO, fecha_TERMI, funcion, nivel, RESO_NOMBRA, FECHA_NOMBRA, RESO_RETIRO, FECHA_RETIRO, ESTADO, HORAS, usuario, USUFECHA, tipodoc_jefe, documento_jefe, retefuente )
			SELECT :tdocnew , :docnew, EMPLECARGO.NCARGO, EMPLECARGO.cargo, EMPLECARGO.codrela, EMPLECARGO.tipoemple, EMPLECARGO.fecha_INICIO, EMPLECARGO.fecha_TERMI, EMPLECARGO.funcion, EMPLECARGO.nivel, EMPLECARGO.RESO_NOMBRA, EMPLECARGO.FECHA_NOMBRA, EMPLECARGO.RESO_RETIRO, EMPLECARGO.FECHA_RETIRO, EMPLECARGO.ESTADO, EMPLECARGO.HORAS, EMPLECARGO.usuario, EMPLECARGO.USUFECHA, EMPLECARGO.tipodoc_jefe, EMPLECARGO.documento_jefe, EMPLECARGO.retefuente
			FROM EMPLECARGO
			WHERE (((EMPLECARGO.TipoDoc)=:tdocx) AND ((EMPLECARGO.documento)=:docx));
			if sqlca.sqlcode=-1 then
				messagebox("Error insertando en emplecargo",sqlca.sqlerrtext)
				rollback;
				return
			end if
		end if
		
		INSERT INTO nom_cpo ( NUM_NOMINA, TIPODOC, DOCUMENTO, NCARGO, COD_CONCEP, Item, Cantidad_Ac, Valor_C, Pagado, TipoCon, Cq, Coop, acum_usu, gtia, numdoc, num_plan, cuota, presupuesto )
		SELECT NOM_CPO.NUM_NOMINA, :tdocnew, :docnew, NOM_CPO.NCARGO, NOM_CPO.COD_CONCEP, NOM_CPO.Item, NOM_CPO.Cantidad_Ac, NOM_CPO.Valor_C, NOM_CPO.Pagado, NOM_CPO.TipoCon, NOM_CPO.Cq, NOM_CPO.Coop, NOM_CPO.acum_usu, NOM_CPO.gtia, NOM_CPO.numdoc, NOM_CPO.num_plan, NOM_CPO.cuota, NOM_CPO.presupuesto
		FROM NOM_CPO
		WHERE (((NOM_CPO.TIPODOC)=:tdocx) AND ((NOM_CPO.DOCUMENTO)=:docx));

		update nom_tsup set tipodoc =:tdocnew, documento=:docnew,tipodoc_nom=:tdocnew,documento_nom=:docnew where
		tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nom_tsup",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		update NOM_COOPE_PLAN_CP set tipodoc =:tdocnew, documento=:docnew where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando NOM_COOPE_PLAN_CP",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		update nom_ahorro set tipo_doc =:tdocnew, empleado=:docnew where tipo_doc=:tdocx  and empleado=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando NOM_ahorro",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		update NOM_ahorro_CP set tipodoc =:tdocnew, documento=:docnew where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando NOM_ahorro_CP",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		INSERT INTO nom_ausentismo ( tipodoc, documento, cod_ausen, item, fechaini, fechafin, estado, tipo, peri_lab, fechai_cau, fechaf_cau, numer_res, fecha_res, fecha_anula, motiv_anula, usu_anula, cod_anula, nro_incapacidad, tipodoc_pro, documento_pro, codausen_pro, item_pro, fecha_audita, usuario )
		SELECT :tdocnew , :docnew, nom_ausentismo.cod_ausen, nom_ausentismo.item, nom_ausentismo.fechaini, nom_ausentismo.fechafin, nom_ausentismo.estado, nom_ausentismo.tipo, nom_ausentismo.peri_lab, nom_ausentismo.fechai_cau, nom_ausentismo.fechaf_cau, nom_ausentismo.numer_res, nom_ausentismo.fecha_res, nom_ausentismo.fecha_anula, nom_ausentismo.motiv_anula, nom_ausentismo.usu_anula, nom_ausentismo.cod_anula, nom_ausentismo.nro_incapacidad, nom_ausentismo.tipodoc_pro, nom_ausentismo.documento_pro, nom_ausentismo.codausen_pro, nom_ausentismo.item_pro, nom_ausentismo.fecha_audita, nom_ausentismo.usuario
		FROM nom_ausentismo
		WHERE (((nom_ausentismo.tipodoc)=:tdocx) AND ((nom_ausentismo.documento)=:docx));
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando nom_ausentismo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		UPDATE nom_ausentismo_det SET tipodoc = :tdocnew, documento = :docnew,tipodoc_n = :tdocnew, documento_n = :docnew
		WHERE (((nom_ausentismo_det.tipodoc)=:tdocx) AND ((nom_ausentismo_det.documento)=:docx));
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando nom_ausentismo_det",sqlca.sqlerrtext)
			rollback;
			return
		end if		
		
		delete from nom_ausentismo where tipodoc =:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando nom_ausentismo",sqlca.sqlerrtext)
			rollback;
			return
		end if

		
		delete from nom_cpo where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando NOM_cpo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		select count(*) into :emple from empleubica where tipodoc=:tdocnew and documento=:docnew;
		if sqlca.sqlcode=-1 then
			messagebox("Error Leyendo Empleubica",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		if emple=0 then 
			update empleubica set tipodoc=:tdocnew , documento=:docnew where tipodoc=:tdocx and documento=:docx;
			if sqlca.sqlcode=-1 then
				messagebox("Error actualizando empleubica",sqlca.sqlerrtext)
				rollback;
				return
			end if
		end if
		
		select count(*) into :emple from emplerequi where tipodoc=:tdocnew and documento=:docnew;
		if sqlca.sqlcode=-1 then
			messagebox("Error Leyendo Empleubica",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		if emple=0 then 		
			update EMPLEREQUI set tipodoc=:tdocnew , documento=:docnew where tipodoc=:tdocx and documento=:docx;
			if sqlca.sqlcode=-1 then
				messagebox("Error actualizando EMPLEREQUI",sqlca.sqlerrtext)
				rollback;
				return
			end if
		end if
		
		select count(*) into :emple from emplerequi_cargo where tipodoc=:tdocnew and documento=:docnew;
		if sqlca.sqlcode=-1 then
			messagebox("Error Leyendo Empleubica",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		if emple=0 then 	
			update EMPLEREQUI_CARGO set tipodoc=:tdocnew , documento=:docnew where tipodoc=:tdocx and documento=:docx;
			if sqlca.sqlcode=-1 then
				messagebox("Error actualizando EMPLEREQUI_CARGO",sqlca.sqlerrtext)
				rollback;
				return
			end if
		end if
		
		update OBRASUJERIDA set tipodoc=:tdocnew , documento=:docnew where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando OBRASUJERIDA",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		select count(*) into :emple from emplesalario where tipodoc=:tdocnew and documento=:docnew;
		if sqlca.sqlcode=-1 then
			messagebox("Error Leyendo Empleubica",sqlca.sqlerrtext)
			rollback;
			return
		end if
		if emple=0 then 	
			update emplesalario set tipodoc=:tdocnew , documento=:docnew where tipodoc=:tdocx and documento=:docx;
			if sqlca.sqlcode=-1 then
				messagebox("Error actualizando emplesalario",sqlca.sqlerrtext)
				rollback;
				return
			end if
		end if
		
		update obrareal set tipodoc=:tdocnew , documento=:docnew where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando obrareal",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		update nom_programacion set tipodoc=:tdocnew , documento=:docnew where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nom_programacion",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from empleubica where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando de empleubica",sqlca.sqlerrtext)
			rollback;
			return
		end if		
		
		delete from emplesalario where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando de emplesalario",sqlca.sqlerrtext)
			rollback;
			return
		end if		
		
		delete from emplecargo where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando de emplecargo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		delete from empleados where tipodoc=:tdocx and documento=:docx;
		if sqlca.sqlcode=-1 then
			messagebox("Error borrando de Empleados",sqlca.sqlerrtext)
			rollback;
			return
		end if
	end if 
	// FIn emple
	select count(*) into :emple from NOM_CLASE_TERCERO where tipodoc=:tdocnew and documento=:docnew;
	if sqlca.sqlcode=-1 then
		messagebox("Error Leyendo Empleubica",sqlca.sqlerrtext)
		rollback;
		return
	end if
	if emple=0 then 	
		UPDATE NOM_CLASE_TERCERO SET tipodoc_ter = :tdocnew, documento_ter = :docnew 
		WHERE (((tipodoc_ter)=:tdocx) AND ((documento_ter)=:docx));
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Nom clase tercero",sqlca.sqlerrtext)
			rollback;
			return
		end if
	end if
	delete from NOM_CLASE_TERCERO where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando de NOM_CLASE_TERCERO",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	/**************************/	

	update nom_ahorro set doc_tercero =:tdocnew, nit=:docnew where doc_tercero=:tdocx  and nit=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando NOM_ahorro",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	update AF_RESPON_USU set tipodoc=:tdocnew , documento=:docnew where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando AF_RESPON_USUs",sqlca.sqlerrtext)
		rollback;
		return
	end if	
	
	update usuarios set tipodoc=:tdocnew , documento=:docnew where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando usuarios",sqlca.sqlerrtext)
		rollback;
		return
	end if

	
	INSERT INTO terceros_direccion (tipodoc, documento, ctdir, direccion, tel1, tel2, fax, email, cdpto, cciudad, cod_postal)
	select :tdocnew , :docnew, terceros_direccion.ctdir, terceros_direccion.direccion, terceros_direccion.tel1, terceros_direccion.tel2, terceros_direccion.fax, terceros_direccion.email, terceros_direccion.cdpto, terceros_direccion.cciudad, terceros_direccion.cod_postal
	From terceros_direccion
	where 
		(((terceros_direccion.tipodoc)=:tdocx) and ((terceros_direccion.documento)=:docx))
		and terceros_direccion.ctdir not in (
		select td.ctdir
		from terceros_direccion as td
		where (((td.tipodoc)=:tdocnew) and ((td.documento)= :docnew )));
	if sqlca.sqlcode=-1 then
		messagebox("Error insertando en terceros_direccion",sqlca.sqlerrtext)
		rollback;
		return
	end if
	delete from terceros_direccion where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando fila de terceros_direccion",sqlca.sqlerrtext)
		rollback;
		return
	end if

	delete from terceros where tipodoc=:tdocx and documento=:docx;
	if sqlca.sqlcode=-1 then
		messagebox("Error borrando fila de Terceros",sqlca.sqlerrtext)
		rollback;
		return
	end if

	/// Para auditoria
	INSERT INTO terceros_unifica(	tipodoc_destino, documento_destino, tipodoc_sale, documento_sale, usuario, fecha_audita)
	VALUES (:tdocnew ,:docnew,:tdocx,:docx,:usuario,:faudita);
	if SQLCA.SQLCode = -1 then
			messagebox("Error insertando fila de Terceros",sqlca.sqlerrtext)
			Rollback;
			Return
		end if	
	
	
	
	
	cuantos ++
next
commit;
if cuantos=0 then 
	messagebox("Atención","No Eligió ningún Tercero a eliminar")
	return
end if
close(parent)
end event

type pb_4 from picturebutton within w_borra_repetid
integer x = 3237
integer y = 624
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
integer x = 3237
integer y = 488
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
integer x = 3237
integer y = 348
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar Pacientes"
end type

event clicked;if dw_2.rowcount()=0 then return
g_tercerodesde=1
openwithparm(w_buscater,dw_2)
dw_2.setcolumn('documento')
dw_2.triggerevent(itemchanged!)
end event

type pb_1 from picturebutton within w_borra_repetid
integer x = 3237
integer y = 84
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

event clicked;g_tercerodesde=1
openwithparm(w_buscater,dw_1)
dw_1.setcolumn('documento')
dw_1.triggerevent(itemchanged!)
end event

type dw_2 from datawindow within w_borra_repetid
integer x = 55
integer y = 360
integer width = 3131
integer height = 1196
integer taborder = 20
string title = "none"
string dataobject = "dw_tercero_gral"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event doubleclicked;if dwo.name='documento' then 	pb_2.triggerevent(clicked!)

end event

event itemchanged;accepttext()
string doc,tdoc
tdoc=getitemstring(getrow(),"tipodoc")
doc=getitemstring(getrow(),"documento")
string snulo
setnull(snulo)
if getcolumnname()="tipodoc" and doc <> "" then
	setitem(getrow(),"documento",snulo)
	setitem(getrow(),"nombre1",snulo)
	setitem(getrow(),"nombre2",snulo)
	setitem(getrow(),"apellido1",snulo)
	setitem(getrow(),"apellido2",snulo)
	setitem(getrow(),'persona',snulo)
	return
end if
if getcolumnname()="documento" and doc = "" then
	setitem(getrow(),'nombre1',snulo)
	setitem(getrow(),'persona',snulo)
end if
if getcolumnname()="documento" and doc <> "" then
	long ojo1,ojo2
	string pers,nom1,nom2,ape1,ape2,dver,tel
	setnull(nom1)
	setnull(pers)
	ojo1=find("documento='"+doc+"' and tipodoc='"+tdoc+"'",1,getrow())
	ojo2=find("documento='"+doc+"' and tipodoc='"+tdoc+"'",getrow()+1,rowcount())
	if (tdoc<>dw_1.getitemstring(1,1) or doc<>dw_1.getitemstring(1,2)) and (ojo1=getrow()) and (ojo2=getrow() or ojo2=0)then
		select persona,nombre1,nombre2,apellido1,apellido2,dverificacion
		into :pers,:nom1,:nom2,:ape1,:ape2,:dver from terceros where
		tipodoc=:tdoc and documento=:doc;
		if isnull(pers) then 
			setitem(getrow(),'documento',snulo)
			settext('')
			return 1
		end if
	else
		setitem(getrow(),'documento',snulo)
		setitem(getrow(),'nombre1',snulo)
		setitem(getrow(),'persona',snulo)
		settext('')
		return 1
	end if
	setitem(getrow(),'persona',pers)
	setitem(getrow(),'nombre1',nom1)
	setitem(getrow(),'nombre2',nom2)
	setitem(getrow(),'apellido1',ape1)
	setitem(getrow(),'apellido2',ape2)
	setitem(getrow(),'dverificacion',dver)
end if
end event

type dw_1 from datawindow within w_borra_repetid
integer x = 55
integer y = 76
integer width = 3182
integer height = 140
integer taborder = 20
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;accepttext()
string doc,tdoc
tdoc=getitemstring(1,"tipodoc")
doc=getitemstring(1,"documento")
string snulo
setnull(snulo)
if getcolumnname()="tipodoc" and doc <> "" then
	setitem(1,"documento",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,'tel1',snulo)
	setitem(1,'persona',snulo)
	return
end if
if getcolumnname()="documento" and doc = "" then 
	setitem(1,'nombre1',snulo)
	setitem(1,'persona',snulo)
end if
if getcolumnname()="documento" and doc <> "" then
	if dw_2.find("tipodoc='"+tdoc+"' and documento='"+doc+"'",1,dw_2.rowcount())=0 then
		if retrieve(tdoc,doc)=0 then
			insertrow(1)
			setitem(1,1,tdoc)
			setitem(1,2,doc)
			messagebox("Atención",'Tercero no existe')
			return
		end if
	else
		setitem(1,'nombre1',snulo)
		setitem(1,'tel1',snulo)
		setitem(1,'persona',snulo)
		setitem(1,'documento',snulo)
		settext('')
		return 1
	end if
end if
end event

event doubleclicked;if dwo.name='documento' then pb_1.triggerevent(clicked!)
end event

type gb_1 from groupbox within w_borra_repetid
integer x = 23
integer y = 20
integer width = 3387
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
string text = "Documento al que pasarán los otros Terceros:"
end type

type gb_2 from groupbox within w_borra_repetid
integer x = 18
integer y = 284
integer width = 3461
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
string text = "Terceros a ser Eliminados:"
end type

