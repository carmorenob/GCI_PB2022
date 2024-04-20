$PBExportHeader$nvo_nom_electronica.sru
forward
global type nvo_nom_electronica from nonvisualobject
end type
end forward

global type nvo_nom_electronica from nonvisualobject
end type
global nvo_nom_electronica nvo_nom_electronica

type variables
Integer  ii_puerto_email
string is_clave_firma,is_ruta_firma,is_ruta_facturas
string is_cuenta_email , is_server_email, is_clave_email ,is_nombre_lugar//ruta en donde se guardan los zips y los pdf's
end variables

forward prototypes
public function integer of_zip (string as_zipname, string as_filename, string as_new_or_add)
public function integer of_desbloquear_chilkat ()
public function long of_consecutivos_elect (string coddoc, string as_tipo_ambiente, string as_tipo, integer ai_anyo)
public function integer of_validar_campos (uo_datawindow adw_nomina)
public function integer of_leer_certificado (ref nvo_generic_ole_object aoo_cert)
public subroutine of_files_names (ref uo_datawindow adw_nomina, ref string as_filename, ref string as_zipname, ref decimal al_nro_fact_x_anyo, ref decimal al_nro_zip_x_anyo, ref boolean abn_actu_consec_fact, ref boolean abn_actu_consec_zip, string as_tipo_docu, string as_tipo_ambiente, integer ai_anyo, string as_coddoc)
public function integer of_actu_estado_nom (string as_tipo, integer al_nom, string as_tdoc, string as_doc, string as_estado, string as_filename_fact, string as_filename_zip, string as_track_id)
public function integer of_firmar_xml (ref uo_datawindow adw_nomina, ref nvo_generic_ole_object aoo_cert, ref nvo_generic_ole_object aoo_sbxml, string as_tipo)
public function integer of_completar_xml_nomina (integer al_nom, string as_tdoc, string as_doc, string as_small_cune, string as_sfc_384, ref nvo_generic_ole_object anvo_xml, string as_tipo, string as_small_cune_ant)
public function integer of_actu_consecs_files_nom_elect (string as_coddoc, string as_tipo_ambiente, string as_tipo, integer ai_anyo, double al_nactual)
public function integer of_soap_xml_firmado (ref nvo_generic_ole_object aoo_sbxmlsoap, string as_zipname, ref nvo_generic_ole_object aoo_cert, integer ai_metodo, string as_testp)
public function integer of_html_request (string as_mesage_soap, string as_filename, string as_ambiente)
public function st_retne_dian sign_chilkat (string as_coddoc, integer al_nom, string as_tdoc, string as_doc, uo_datawindow adw_nomina, string as_tipo_docu)
public function integer of_enviar_correo (integer al_nom, string as_tdoc, string as_doc, string as_qrcode, string as_cune, string as_zipname, string as_filename, string as_docnm, string as_lug)
end prototypes

public function integer of_zip (string as_zipname, string as_filename, string as_new_or_add);nvo_generic_ole_object loo_zip
int li_rc , li_success , li_SaveExtraPath

loo_Zip = create nvo_generic_ole_object
li_rc = loo_Zip.ConnectToNewObject("Chilkat_9_5_0.Zip")
if li_rc < 0 then
    destroy loo_Zip
    MessageBox("Error","Connecting to COM object failed Chilkat_9_5_0.Zip")
    return -1
end if

if as_new_or_add='n' then
	li_Success = loo_Zip.NewZip(as_zipname)
else
	li_Success = loo_Zip.OpenZip(as_zipname)
end if
if li_Success <> 1 then
    messagebox("Error creando Zip",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if

li_SaveExtraPath = 0
li_Success = loo_Zip.AppendOneFileOrDir(as_filename,li_SaveExtraPath)
if li_Success <> 1 then
    messagebox("Error creando Zip",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if

li_Success = loo_Zip.WriteZipAndClose()
if li_Success <> 1 then
    messagebox("Error creando Zip",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if

return 1
end function

public function integer of_desbloquear_chilkat ();nvo_generic_ole_object loo_glob
int li_rc , li_Success , li_Status

loo_Glob = create nvo_generic_ole_object
li_rc = loo_Glob.ConnectToNewObject("Chilkat_9_5_0.Global")
if li_rc < 0 then
    destroy loo_Glob
    MessageBox("Error of_desbloquear_chilkat","Connecting to COM object failed: Chilkat_9_5_0.Global")
    return -1
end if
li_Success = loo_Glob.UnlockBundle("Anything for 30-day trial")
if li_Success <> 1 then
    messagebox("Error de desbloqueo de ChilKat_9.5.0", string(loo_Glob.LastErrorText))
    destroy loo_Glob
    return -1
end if

li_Status = loo_Glob.UnlockStatus
if li_Status = 2 then
  //  messagebox("Estado Desbloqueo", "Unlocked using purchased unlock code.")
else
  //   messagebox("Estado Desbloqueo", "Unlocked in trial mode.")
end if

// The LastErrorText can be examined in the success case to see if it was unlocked in
// trial more, or with a purchased unlock code.
//Write-Debug loo_Glob.LastErrorText

destroy loo_Glob
return 1
end function

public function long of_consecutivos_elect (string coddoc, string as_tipo_ambiente, string as_tipo, integer ai_anyo);//as_tipo:n: nomina, z: zip ,e:anulacion/eliminacion, a:ajuste
long ll_consec

if as_tipo='e' or as_tipo='a' then
	select count(1) into :ll_consec from  PM_CONSEC_FACT_ELECT where tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and coddoc=:coddoc; //LAS NOTAS CREDITO Y DEBITO LLEVAN UN SOLO CONSECUTIVO (NO ES POR AÑO)
else
	select count(1) into :ll_consec from PM_CONSEC_FACT_ELECT where tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and anyo=:ai_anyo and coddoc=:coddoc;
end if

if sqlca.sqlcode<0 then
	messagebox("Error SQL","Error consultando pm_gral_consec_fact_elect "+sqlca.sqlerrtext)
	return -1
end if

if ll_consec=0 then
	if as_tipo='e' or as_tipo='a' then
		INSERT INTO PM_CONSEC_FACT_ELECTt (coddoc,tipo_ambiente,tipo, anyo, consec_actual_x_anyo)
		VALUES (:coddoc,:as_tipo_ambiente,:as_tipo, 0 , 0);
	else
		INSERT INTO PM_CONSEC_FACT_ELECT (coddoc,tipo_ambiente,tipo, anyo, consec_actual_x_anyo)
		VALUES (:coddoc,:as_tipo_ambiente,:as_tipo, :ai_anyo , 0);
	end if
	if sqlca.sqlcode<0 then
		messagebox("Error SQL","Error insertando en pm_gral_consec_fact_elect "+sqlca.sqlerrtext)
		return -1
	end if
end if

if as_tipo='e' or as_tipo='a' then
	select consec_actual_x_anyo+1 into :ll_consec from PM_CONSEC_FACT_ELECT where  tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and coddoc=:coddoc;
else
	select consec_actual_x_anyo+1 into :ll_consec from PM_CONSEC_FACT_ELECT where  tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and anyo=:ai_anyo and coddoc=:coddoc;
end if
if sqlca.sqlcode<0 then
	messagebox("Error SQL","Error consultando PM_CONSEC_FACT_ELECT "+sqlca.sqlerrtext)
	return -1
end if

return ll_consec
end function

public function integer of_validar_campos (uo_datawindow adw_nomina);if (adw_nomina.getitemstring(1,'metopag_dian')='46' or adw_nomina.getitemstring(1,'metopag_dian')='46' or adw_nomina.getitemstring(1,'metopag_dian')='47') then
	if isnull(adw_nomina.getitemstring(1,"banco")) or trim(adw_nomina.getitemstring(1,"banco"))='' then
		Messagebox("Atención!!","El empleado no tiene configurado el correo electrónico, no se puede enviar esta nomina !!!!!" )
		RETURN -1
	end if
	
	if isnull(adw_nomina.getitemstring(1,"NumeroCuenta")) or trim(adw_nomina.getitemstring(1,"NumeroCuenta"))='' then
		Messagebox("Atención!!","El empleado no tiene configurado su NumeroCuenta, no se puede enviar esta nomina !!!!!" )
		RETURN -1
	end if
end if
return 1
end function

public function integer of_leer_certificado (ref nvo_generic_ole_object aoo_cert);int li_rc,li_Success
oleobject ldt_fechaexpira,loo_Dt  

ldt_fechaexpira =  create oleobject
li_rc = ldt_fechaexpira.ConnectToNewObject("Chilkat_9_5_0.CkDateTime")
if li_rc < 0 then
    destroy ldt_fechaexpira
    MessageBox("Error","Connecting to COM object failed Chilkat_9_5_0.CkDateTime")
    return -1
end if


aoo_cert = create nvo_generic_ole_object
li_rc = aoo_Cert.ConnectToNewObject("Chilkat_9_5_0.Cert")
if li_rc < 0 then
    destroy aoo_cert
    MessageBox("Error","Connecting to COM object failed Chilkat_9_5_0.Cert")
    return -1
end if
li_Success = aoo_cert.LoadPfxFile(is_ruta_firma,is_clave_firma)
if li_Success <> 1 then
    messagebox("Error leyendo certificado", string( aoo_cert.LastErrorText))
	is_clave_firma=''
	destroy aoo_cert
    return -1
end if

li_Success=aoo_cert.Expired
If li_Success = 1 Then
    messagebox("Error certificado expirado", string( aoo_cert.LastErrorText))
	is_clave_firma=''
	destroy aoo_cert
   return -1
End If

ldt_fechaexpira=aoo_cert.GetValidToDt() 
loo_Dt = ldt_fechaexpira.GetDtObj(1)
if DaysAfter(date(now()),date( string(loo_Dt.Day) + "/" + string(loo_Dt.Month) + "/" + string(loo_Dt.Year) + "  " + string(loo_Dt.Hour) + ":" + string(loo_Dt.Minute)))<=40 then
	messagebox('Certificado Expira el',string(date( string(loo_Dt.Day) + "/" + string(loo_Dt.Month) + "/" + string(loo_Dt.Year) + "  " + string(loo_Dt.Hour) + ":" + string(loo_Dt.Minute))))
end if

destroy ldt_fechaexpira
return 1
end function

public subroutine of_files_names (ref uo_datawindow adw_nomina, ref string as_filename, ref string as_zipname, ref decimal al_nro_fact_x_anyo, ref decimal al_nro_zip_x_anyo, ref boolean abn_actu_consec_fact, ref boolean abn_actu_consec_zip, string as_tipo_docu, string as_tipo_ambiente, integer ai_anyo, string as_coddoc);if as_tipo_docu='n' then
	if isnull(adw_nomina.getitemstring(1,'file_name_nomi')) then //es la primera que se envía , hay que hacer los nombre de los archivos zip y xml
		al_nro_fact_x_anyo=of_consecutivos_elect(as_coddoc,as_tipo_ambiente,'n',ai_anyo)
		as_filename='nie'+right('0000'+adw_nomina.getitemstring(1,'documentotr') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
		al_nro_zip_x_anyo=of_consecutivos_elect(as_coddoc,as_tipo_ambiente,'z',ai_anyo)
		as_zipname='z'+right('0000'+adw_nomina.getitemstring(1,'documentotr'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
		abn_actu_consec_fact=true
		abn_actu_consec_zip=true
	else
		as_filename=adw_nomina.getitemstring(1,'file_name_nomi')
		as_zipname=adw_nomina.getitemstring(1,'file_name_zip')
	end if
elseif as_tipo_docu='e' then
	if isnull(adw_nomina.getitemstring(1,'file_name_nomi')) then //es la primera que se envía , hay que hacer los nombre de los archivos zip y xml
		as_filename='niae'+right('0000'+adw_nomina.getitemstring(1,'documentotr') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
		as_zipname='z'+right('0000'+adw_nomina.getitemstring(1,'documentotr'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
	
		abn_actu_consec_fact=true
		abn_actu_consec_zip=true
	else
		as_filename=adw_nomina.getitemstring(1,'file_name_nomi')
		as_zipname=adw_nomina.getitemstring(1,'file_name_zip')
	end if
//elseif as_tipo_docu='e' then
//	if isnull(adw_nomina.getitemstring(1,'file_name_nomi')) then //es la primera que se envía , hay que hacer los nombre de los archivos zip y xml
//		as_filename='niae'+right('0000'+adw_nomina.getitemstring(1,'documentotr') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
//		as_zipname='z'+right('0000'+adw_nomina.getitemstring(1,'documentotr'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
//		abn_actu_consec_fact=true
//		abn_actu_consec_zip=true
//	else
//		as_filename=adw_nomina.getitemstring(1,'file_name_nomi')
//		as_zipname=adw_nomina.getitemstring(1,'file_name_zip')
//	end if
//elseif as_tipo_docu='a' then
//	if isnull(adw_nomina.getitemNumber(1,'nro_nota_cred')) then //es la primera que se envía , hay que hacer los nombre de los archivos zip y xml
//		al_nro_fact_x_anyo=of_consecutivos_elect(as_tipo_docu,as_tipo_ambiente,'c',ai_anyo)
//		as_filename='niae'+right('0000'+adw_nomina.getitemstring(1,'documentotr') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
//		al_nro_zip_x_anyo=of_consecutivos_elect(as_tipo_docu,as_tipo_ambiente,'z',ai_anyo)
//		as_zipname='z'+right('0000'+adw_nomina.getitemstring(1,'documentotr'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'	
//		abn_actu_consec_fact=true
//		abn_actu_consec_zip=true
//	else
//		if isnull(adw_nomina.getitemstring(1,'file_name_nomi_anula')) then
//			al_nro_fact_x_anyo=adw_nomina.getitemNumber(1,'nro_nota_cred')			
//			al_nro_zip_x_anyo=of_consecutivos_elect(as_tipo_docu,as_tipo_ambiente,'z',ai_anyo)
//			as_filename='niae'+right('0000'+adw_nomina.getitemstring(1,'documentotr') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
//			as_zipname='z'+right('0000'+adw_nomina.getitemstring(1,'documentotr'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
//			abn_actu_consec_zip=true
//		else
//			as_filename=adw_nomina.getitemstring(1,'file_name_nomi_anula')
//			as_zipname=adw_nomina.getitemstring(1,'file_name_zip_anula')
//		end if
//	end if
end if
end subroutine

public function integer of_actu_estado_nom (string as_tipo, integer al_nom, string as_tdoc, string as_doc, string as_estado, string as_filename_fact, string as_filename_zip, string as_track_id);//as_tipo; n:nomina , a:anulacion , c:nota credito, d:nota debito
//as_estado; 1:validada OK , -1 con errores , 0 enviada sin validar
//siempre deben venir los nombres de archivo por si se utilizó el metodo sincrónico (porque entonces debe poner esos nombres de archivos pa no volverlos a generar y/o utilizar)

long ll_consec

if as_filename_fact="" or isnull(as_filename_fact) or as_filename_zip="" or isnull(as_filename_zip) then	
	messagebox("Atención","Función of_actu_estado_nom, el nombre del ZIP y/o del XML de la factura no pueden ser nulos")
	return -1
end if

if as_estado="0" and (as_track_id="" or isnull(as_track_id)) then
	messagebox("Atención","Función of_actu_estado_nom, el track_id de la nomina no puede ser nulo")
	return -1
end if

select count(1) into :ll_consec from NOM_CAB_ENVIO where num_nomina=:al_nom and tipodoc=:as_tdoc and documento=:as_doc; 
if ll_consec=0 then
	INSERT INTO NOM_CAB_ENVIO(NUM_NOMINA,TIPODOC,DOCUMENTO,ESTADO_DIAN,TRACK_ID,FILE_NAME_NOMI,FILE_NAME_ZIP)
	VALUES(:al_nom,:as_tdoc,:as_doc,:as_estado,null,null,null);
end if
if sqlca.sqlcode<0 then
	messagebox("Error SQL","Error insertando en pm_gral_consec_fact_elect "+sqlca.sqlerrtext)
	return -1
end if

if as_tipo='n' then
	choose case as_estado
		case "1"
			update nom_cab_envio set estado_dian=:as_estado, file_name_nomi =:as_filename_fact , file_name_zip =:as_filename_zip 
			where num_nomina=:al_nom and tipodoc=:as_tdoc and documento=:as_doc;  
		case "0"
			update nom_cab_envio set	estado_dian=:as_estado, file_name_nomi =:as_filename_fact , file_name_zip =:as_filename_zip , track_id=:as_track_id
			where num_nomina=:al_nom and tipodoc=:as_tdoc and documento=:as_doc; 
		case "-1"
			update nom_cab_envio set estado_dian=:as_estado, file_name_nomi =:as_filename_fact , file_name_zip =:as_filename_zip
			where num_nomina=:al_nom and tipodoc=:as_tdoc and documento=:as_doc; 
	end choose
elseif as_tipo='e' then
	choose case as_estado
		case "1"
			update nom_cab_envio set estado_dian_anul=:as_estado , file_name_nomi_anul=:as_filename_fact , file_name_zip_anul=:as_filename_zip 
			where num_nomina=:al_nom and tipodoc=:as_tdoc and documento=:as_doc;
		case "0"
			update nom_cab_envio set estado_dian_anul=:as_estado , file_name_nomi_anul =:as_filename_fact , file_name_zip_anul =:as_filename_zip , track_id_anul=:as_track_id
			where num_nomina=:al_nom and tipodoc=:as_tdoc and documento=:as_doc; 
		case "-1"
			update nom_cab_envio set estado_dian_anul=:as_estado ,   file_name_nomi_anul =:as_filename_fact , file_name_zip_anul =:as_filename_zip
			where num_nomina=:al_nom and tipodoc=:as_tdoc and documento=:as_doc; 
	end choose
end if	
//elseif as_tipo='c' or as_tipo='d' then
//	choose case as_estado
//		case "1"
//			update ma_factura_notas set 
//				estado_dian=:as_estado , file_name_nota =:as_filename_fact , file_name_zip =:as_filename_zip 
//			where tipo_nota=:as_clug_fact and nro_nota=:al_nfact; 
//		case "0"
//			update ma_factura_notas set
//				estado_dian=:as_estado , file_name_nota =:as_filename_fact , file_name_zip =:as_filename_zip , track_id=:as_track_id
//			where tipo_nota=:as_clug_fact and nro_nota=:al_nfact; 
//		case "-1"
//			update ma_factura_notas set 
//				estado_dian=:as_estado ,   file_name_nota =:as_filename_fact , file_name_zip =:as_filename_zip
//			where tipo_nota=:as_clug_fact and nro_nota=:al_nfact; 
//	end choose
if sqlca.sqlcode<0 then
	gs_error=sqlca.sqlerrtext
	rollback;
	messagebox("Error de SQL of_actu_estado_nom","Error actualizando nom_cab_envio: "+gs_error)
	return -1
end if
return 1
end function

public function integer of_firmar_xml (ref uo_datawindow adw_nomina, ref nvo_generic_ole_object aoo_cert, ref nvo_generic_ole_object aoo_sbxml, string as_tipo);//as_tipo; n:nomina  a:ajuste e:eliminar
int li_success,li_rc 
string ls_xml,sfc,sfc_384,small_cune,smallcune_formated,small_cunex,small_cune_ant
string ls_KeyInfoId,ls_SignedPropsId
nvo_generic_ole_object loo_GenFact ,loo_Xml , loo_Verifier
Blob lblb_data
Blob lblb_sha384
Blob lblb_md5

CrypterObject lnv_CrypterObject
lnv_CrypterObject = Create CrypterObject
Coderobject lnv_code
Lnv_code = create coderobject

//HUELLA
small_cune= adw_nomina.getitemstring(1,'cune')
small_cune=f_encripta_sha(small_cune,'SHA384')

sfc= adw_nomina.getitemstring(1,'softwareid')+f_descripta_new(adw_nomina.getitemstring(1,'pin'),'1')+adw_nomina.getitemstring(1,'numerodoc')
sfc_384=f_encripta_sha(sfc,'SHA384')

if as_tipo='e' then 
	small_cune_ant= adw_nomina.getitemstring(1,'cune_ant')
	small_cune_ant=f_encripta_sha(small_cune_ant,'SHA384')
	adw_nomina.setitem(1,'cune',small_cune_ant)
end if

adw_nomina.setitem(1,'cune',small_cune)
adw_nomina.setitem(1,'huella',sfc_384)

lblb_data=  Blob( adw_nomina.getitemstring(1,'cune'), EncodingANSI!)
lblb_sha384= lnv_CrypterObject.SHA(SHA384!, lblb_data)
lblb_md5 = lnv_CrypterObject.MD5(lblb_sha384)
small_cunex = lnv_code.hexencode(lblb_MD5)
 
destroy Lnv_code
destroy lnv_CrypterObject 

smallcune_formated=mid(  small_cunex , 1, 8 )+'-'+mid(  small_cunex , 9, 4 )+'-'+mid(  small_cunex , 13, 4 )+'-'+mid(  small_cunex , 17, 4 )+'-'+mid(  small_cunex , 21, 40 )
nvo_generic_ole_object aoo_sbXML2

aoo_sbXML2 = create nvo_generic_ole_object
li_rc = aoo_sbXML2.ConnectToNewObject("Chilkat_9_5_0.Xml")
ls_xml=string(adw_nomina.describe('DataWindow.Data.XML'))

//https://www.chilkatsoft.com/refdoc/xChilkatXmlRef.html#method71
li_Success = aoo_SbXml2.loadXML(ls_xml)
if li_Success <> 1 then
    Messagebox("Error OleObject of_firmar_xml", "Error convirtiendo Datawindow a XML")
    destroy aoo_SbXml
	destroy aoo_cert
    return -1
end if

if of_completar_xml_nomina(adw_nomina.getitemnumber(1,'cnum_nomina'),adw_nomina.getitemstring(1,'tdocu'),adw_nomina.getitemstring(1,'documentotr'),small_cune,sfc_384,aoo_SbXml2,as_tipo,small_cune_ant)<0 then
	destroy loo_GenFact
	destroy aoo_SbXml
	destroy aoo_cert
    MessageBox("Error en XML","Error completando los valores del XML !!")
    return -1
end if

aoo_sbXML = create nvo_generic_ole_object
li_rc = aoo_sbXML.ConnectToNewObject("Chilkat_9_5_0.StringBuilder")
ls_xml=aoo_SbXml2.getXML()

//https://www.chilkatsoft.com/refdoc/xChilkatXmlRef.html#method71
li_Success = aoo_SbXml.SetString(ls_xml)
if li_Success <> 1 then
    Messagebox("Error OleObject of_firmar_xml", "Error convirtiendo Datawindow a XML")
    destroy aoo_SbXml
	destroy aoo_cert
    return -1
end if

//https://www.chilkatsoft.com/refdoc/xChilkatXmlRef.html#method71
aoo_sbXML = create nvo_generic_ole_object
li_rc = aoo_sbXML.ConnectToNewObject("Chilkat_9_5_0.StringBuilder")
li_Success = aoo_SbXml.SetString(ls_xml)
if li_Success <> 1 then
	Messagebox("Error OleObject of_firmar_xml", "Error convirtiendo Datawindow a XML")
	destroy aoo_SbXml
	destroy aoo_cert
	return -1
end if

loo_GenFact = create nvo_generic_ole_object
li_rc = loo_GenFact.ConnectToNewObject("Chilkat_9_5_0.XmlDSigGen")
if li_rc < 0 then
	destroy loo_GenFact
	destroy aoo_SbXml
	destroy aoo_cert
	 MessageBox("Error OleObject of_firmar_xml","Connecting to COM object failed Chilkat_9_5_0.XmlDSigGen")
	 return -1
end if

// Indicate where the signature is to be placed.
if as_tipo='n' then
	loo_GenFact.SigLocation = "NominaIndividual|ext:UBLExtensions|ext:UBLExtension|ext:ExtensionContent"	
elseif as_tipo='a' or as_tipo='e' then
	loo_GenFact.SigLocation = "NominaIndividualDeAjuste|ext:UBLExtensions|ext:UBLExtension|ext:ExtensionContent"
end if

loo_GenFact.SigId = "xmldsig-"+smallcune_formated
loo_GenFact.SigNamespacePrefix = "ds"
//https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html#prop20
//https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html#prop21
loo_GenFact.SignedInfoDigestMethod = "sha256"

loo_Xml = create nvo_generic_ole_object
li_rc = loo_Xml.ConnectToNewObject("Chilkat_9_5_0.Xml")
if li_rc < 0 then
	destroy loo_GenFact
	destroy aoo_SbXml
	destroy aoo_cert
	destroy loo_Xml
	 MessageBox("Error OleObject of_firmar_xml","Connecting to COM object failed Chilkat_9_5_0.Xml")
	 return -1
end if

loo_Xml.Tag = "xades:QualifyingProperties"
loo_Xml.AddAttribute("Target","#xmldsig-"+smallcune_formated)
loo_Xml.UpdateAttrAt("xades:SignedProperties",1,"Id","xmldsig-"+smallcune_formated+"-signedprops")
loo_Xml.UpdateChildContent("xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningTime","TO BE GENERATED BY CHILKAT")
loo_Xml.UpdateAttrAt("xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificate|xades:Cert|xades:CertDigest|ds:DigestMethod",1,"Algorithm","http://www.w3.org/2001/04/xmlenc#sha256")
loo_Xml.UpdateChildContent("xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificate|xades:Cert|xades:CertDigest|ds:DigestValue","TO BE GENERATED BY CHILKAT")
loo_Xml.UpdateChildContent("xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificate|xades:Cert|xades:IssuerSerial|ds:X509IssuerName","TO BE GENERATED BY CHILKAT")
loo_Xml.UpdateChildContent("xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificate|xades:Cert|xades:IssuerSerial|ds:X509SerialNumber","TO BE GENERATED BY CHILKAT")
loo_Xml.UpdateChildContent("xades:SignedProperties|xades:SignedSignatureProperties|xades:SignaturePolicyIdentifier|xades:SignaturePolicyId|xades:SigPolicyId|xades:Identifier","https://facturaelectronica.dian.gov.co/politicadefirma/v2/politicadefirmav2.pdf")
loo_Xml.UpdateChildContent("xades:SignedProperties|xades:SignedSignatureProperties|xades:SignaturePolicyIdentifier|xades:SignaturePolicyId|xades:SigPolicyId|xades:Description","Política de firma para facturas electrónicas de la República de Colombia.")
loo_Xml.UpdateAttrAt("xades:SignedProperties|xades:SignedSignatureProperties|xades:SignaturePolicyIdentifier|xades:SignaturePolicyId|xades:SigPolicyHash|ds:DigestMethod",1,"Algorithm","http://www.w3.org/2001/04/xmlenc#sha256")
loo_Xml.UpdateChildContent("xades:SignedProperties|xades:SignedSignatureProperties|xades:SignaturePolicyIdentifier|xades:SignaturePolicyId|xades:SigPolicyHash|ds:DigestValue","dMoMvtcG5aIzgYo0tIsSQeVJBDnUnfSOfBpxXrmor0Y=")
loo_Xml.UpdateChildContent("xades:SignedProperties|xades:SignedSignatureProperties|xades:SignerRole|xades:ClaimedRoles|xades:ClaimedRole","third party")

loo_GenFact.AddObject("",loo_Xml.GetXml(),"","")
loo_GenFact.AddSameDocRef("","sha256","","","")
loo_GenFact.SetRefIdAttr("","xmldsig-"+smallcune_formated+"-ref0")



ls_KeyInfoId = "xmldsig-"+smallcune_formated+"-keyinfo"
loo_GenFact.KeyInfoId = ls_KeyInfoId
loo_GenFact.AddSameDocRef(ls_KeyInfoId,"sha256","","","")

// Add a Reference to the SignedProperties.
ls_SignedPropsId = "xmldsig-"+smallcune_formated+"-signedprops"
loo_GenFact.AddObjectRef(ls_SignedPropsId,"sha256","","","http://uri.etsi.org/01903#SignedProperties")

loo_GenFact.KeyInfoType = "X509Data"
loo_GenFact.X509Type = "Certificate"
li_Success = loo_GenFact.SetX509Cert(aoo_Cert,1)
if li_Success = 0 then
	messagebox("Error poniendo el certificado", loo_GenFact.LastErrorText)
	destroy loo_GenFact
	destroy aoo_SbXml
	destroy aoo_cert
	destroy loo_Xml
	return -1
end if

// --------------------------------------------------------------------
// Create the XAdES-EPES signed XML.
//https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html#prop0
//ESTA PROPIEDAD ES BIEN IMPORTATE PARA QUE EL MENSAJE PASE BIEN EN LA DIAN!!!!!!
loo_GenFact.Behaviors = "CompactSignedXml"

li_Success = loo_GenFact.CreateXmlDSigSb(aoo_SbXml)
if li_Success = 0 then
	messagebox("Error firmando la factura" ,string( loo_GenFact.LastErrorText ))
	destroy loo_GenFact
	destroy aoo_SbXml
	destroy aoo_cert
	destroy loo_Xml
	return -1
end if

// Verify the signatures we just produced...
loo_Verifier = create nvo_generic_ole_object
li_rc = loo_Verifier.ConnectToNewObject("Chilkat_9_5_0.XmlDSig")
li_Success = loo_Verifier.LoadSignatureSb(aoo_SbXml)
if li_Success <> 1 then
	messagebox("Verificacion de firma",loo_Verifier.LastErrorText)
	destroy aoo_Cert
	destroy loo_Verifier
	return -1
end if
int li_NumSigs,li_VerifyIdx,li_Verified
	
li_NumSigs = loo_Verifier.NumSignatures
li_VerifyIdx = 0
do while li_VerifyIdx < li_NumSigs
	 loo_Verifier.Selector = li_VerifyIdx
	 li_Verified = loo_Verifier.VerifySignature(1)
	 if li_Verified <> 1 then
		messagebox("Verificacion de firma (ciclo)", loo_Verifier.LastErrorText)
		destroy aoo_Cert
		destroy loo_Verifier
		return -1
	 end if
	 li_VerifyIdx = li_VerifyIdx + 1
loop
destroy loo_GenFact 
destroy loo_Xml
return 1
end function

public function integer of_completar_xml_nomina (integer al_nom, string as_tdoc, string as_doc, string as_small_cune, string as_sfc_384, ref nvo_generic_ole_object anvo_xml, string as_tipo, string as_small_cune_ant);//as_tipo; n:nomina  a:Ajuste :eliminar

int li_success,li_rc,li_com
string conc
uo_datastore ads_datos

ads_datos=create uo_datastore
ads_datos.dataobject='nom_desprendible'
ads_datos.settransobject(sqlca)
if ads_datos.retrieve(al_nom,as_tdoc,as_doc)<1 then 
	return -1
end if
if as_tipo='n' then 
	anvo_xml.UpdateAttrAt("Novedad",1,"CUNENov","")
	anvo_xml.UpdateChildContent("Novedad","false")
	if not isnull(ads_datos.getitemdatetime(1,'ingre_empre'))  then //and ads_datos.getitemdatetime(1,'ingre_empre')<>'' then 
		anvo_xml.UpdateAttrAt("Periodo",1,"FechaIngreso",string( ads_datos.getitemdatetime(1,'ingre_empre')  ,'yyyy-mm-dd'))
	else
		Messagebox('Atención','Usuario '+as_tdoc+' ' +as_doc+'no tiene fecha de Ingreso')
	end if
	if not isnull(ads_datos.getitemdatetime(1,'fecha_retiro')) then 
		anvo_xml.UpdateAttrAt("Periodo",1,"FechaRetiro",string( ads_datos.getitemdatetime(1,'fecha_retiro')  ,'yyyy-mm-dd'))
	end if
	anvo_xml.UpdateAttrAt("Periodo",1,"FechaLiquidacionInicio",string( ads_datos.getitemdatetime(1,'inicia')  ,'yyyy-mm-dd'))
	anvo_xml.UpdateAttrAt("Periodo",1,"FechaLiquidacionFin",string( ads_datos.getitemdatetime(1,'termina')  ,'yyyy-mm-dd'))
	if isnull(ads_datos.getitemdatetime(1,'fecha_retiro')) then  
		anvo_xml.UpdateAttrAt("Periodo",1,"TiempoLaborado",string(f_dias_360( ads_datos.getitemdatetime(1,'ingre_empre'),ads_datos.getitemdatetime(1,'termina'))))
	else	
		anvo_xml.UpdateAttrAt("Periodo",1,"TiempoLaborado",string(f_dias_360( ads_datos.getitemdatetime(1,'ingre_empre'),ads_datos.getitemdatetime(1,'fecha_retiro'))))
	end if
	anvo_xml.UpdateAttrAt("Periodo",1,"FechaGen",string( ads_datos.getitemdatetime(1,'fecha'),'yyyy-mm-dd'))
	anvo_xml.UpdateAttrAt("NumeroSecuenciaXML",1,"CodigoTrabajador",ads_datos.getitemstring(1,'tdocu'))
	//	anvo_xml.UpdateAttrAt("NumeroSecuenciaXML",1,"Prefijo",ads_datos.getitemstring(1,'prefijo'))
	anvo_xml.UpdateAttrAt("NumeroSecuenciaXML",1,"Consecutivo",trim(string(ads_datos.getitemnumber(1,'cnum_nomina')))+ads_datos.getitemstring(1,'tdocu')+trim(string(ads_datos.getitemnumber(1,'cons_emp'))))
	anvo_xml.UpdateAttrAt("NumeroSecuenciaXML",1,"Numero",trim(string(ads_datos.getitemnumber(1,'cnum_nomina')))+ads_datos.getitemstring(1,'tdocu')+trim(string(ads_datos.getitemnumber(1,'cons_emp'))))
	anvo_xml.UpdateAttrAt("LugarGeneracionXML",1,"Pais",ads_datos.getitemstring(1,'cdian'))
	anvo_xml.UpdateAttrAt("LugarGeneracionXML",1,"DepartamentoEstado",ads_datos.getitemstring(1,'dpto') )
	anvo_xml.UpdateAttrAt("LugarGeneracionXML",1,"MunicipioCiudad",ads_datos.getitemstring(1,'dpto')+ads_datos.getitemstring(1,'ciudad'))
	anvo_xml.UpdateAttrAt("LugarGeneracionXML",1,"Idioma",ads_datos.getitemstring(1,'idioma'))
				
//	anvo_xml.UpdateAttrAt("ProveedorXML",1,"RazonSocial",ads_datos.getitemstring(1,'razonsocialpv'))
//	anvo_xml.UpdateAttrAt("ProveedorXML",1,"PrimerApellido",ads_datos.getitemstring(1,'primerapellidopv'))
//	anvo_xml.UpdateAttrAt("ProveedorXML",1,"SegundoApellido",ads_datos.getitemstring(1,'segundoapellidopv'))	
//	anvo_xml.UpdateAttrAt("ProveedorXML",1,"PrimerNombre",ads_datos.getitemstring(1,'primernombrepv'))
//	anvo_xml.UpdateAttrAt("ProveedorXML",1,"OtrosNombres",ads_datos.getitemstring(1,'otrosnombrepv'))
//	anvo_xml.UpdateAttrAt("ProveedorXML",1,"NIT",string(ads_datos.getitemnumber(1,'nitpv')))
//	anvo_xml.UpdateAttrAt("ProveedorXML",1,"DV",string(ads_datos.getitemnumber(1,'dvpv')))

	anvo_xml.UpdateAttrAt("ProveedorXML",1,"RazonSocial",ads_datos.getitemstring(1,'razonsocialem'))
	anvo_xml.UpdateAttrAt("ProveedorXML",1,"PrimerApellido",ads_datos.getitemstring(1,'primerapellidoem'))
	anvo_xml.UpdateAttrAt("ProveedorXML",1,"SegundoApellido",ads_datos.getitemstring(1,'segundoapellidoem'))	
	anvo_xml.UpdateAttrAt("ProveedorXML",1,"PrimerNombre",ads_datos.getitemstring(1,'primernombrepv'))
	anvo_xml.UpdateAttrAt("ProveedorXML",1,"OtrosNombres",ads_datos.getitemstring(1,'otrosnombresem'))
	anvo_xml.UpdateAttrAt("ProveedorXML",1,"NIT",ads_datos.getitemstring(1,'nitem'))
	anvo_xml.UpdateAttrAt("ProveedorXML",1,"DV",ads_datos.getitemstring(1,'dvem'))	
	
	anvo_xml.UpdateAttrAt("ProveedorXML",1,"SoftwareID",ads_datos.getitemstring(1,'softwareid'))
	anvo_xml.UpdateAttrAt("ProveedorXML",1,"SoftwareSC",as_sfc_384)	
	if ads_datos.getitemstring(1,'tipo_ambiente')='2' then 
		anvo_xml.UpdateChildContent("CodigoQR",'https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey='+as_small_cune)
	else
		anvo_xml.UpdateChildContent("CodigoQR",'https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey='+as_small_cune)
	end if
		
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"Version","V1.0: Documento Soporte de Pago de Nómina Electrónica")
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"Ambiente",string(ads_datos.getitemstring(1,'tipo_ambiente')))
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"TipoXML","102")
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"CUNE",as_small_cune)
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"EncripCUNE","CUNE-SHA384")
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"FechaGen",string(ads_datos.getitemdatetime(1,'fecha'),'yyyy-mm-dd'))
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"HoraGen",string(ads_datos.getitemdatetime(1,'fecha'),'HH:mm:ss')+'-05:00')
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"PeriodoNomina",ads_datos.getitemstring(1,'periodo'))
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"TipoMoneda","COP")
	anvo_xml.UpdateAttrAt("InformacionGeneral",1,"TRM","0")
	anvo_xml.UpdateChildContent("Notas","Información de Novedades Empleado ("+ads_datos.getitemstring(1,'empleado')+" " +ads_datos.getitemstring(1,'nombre_empleado')+")")
	
	anvo_xml.UpdateAttrAt("Empleador",1,"RazonSocial",ads_datos.getitemstring(1,'razonsocialem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"PrimerApellido",ads_datos.getitemstring(1,'primerapellidoem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"SegundoApellido",ads_datos.getitemstring(1,'segundoapellidoem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"PrimerNombre",ads_datos.getitemstring(1,'primernombreem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"OtrosNombres",ads_datos.getitemstring(1,'otrosnombresem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"NIT",ads_datos.getitemstring(1,'nitem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"DV",ads_datos.getitemstring(1,'dvem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"Pais",ads_datos.getitemstring(1,'paisem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"DepartamentoEstado",ads_datos.getitemstring(1,'departamentoestadoem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"MunicipioCiudad",ads_datos.getitemstring(1,'departamentoestadoem')+ads_datos.getitemstring(1,'municipiociudadem'))
	anvo_xml.UpdateAttrAt("Empleador",1,"Direccion",ads_datos.getitemstring(1,'direccionem'))
		
	anvo_xml.UpdateAttrAt("Trabajador",1,"TipoTrabajador",ads_datos.getitemstring(1,'ttrab_dian'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"SubTipoTrabajador",ads_datos.getitemstring(1,'sttrab_dian'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"AltoRiesgoPension",ads_datos.getitemstring(1,'altoriesgopension'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"TipoDocumento",ads_datos.getitemstring(1,'tipodocumentotr'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"NumeroDocumento",ads_datos.getitemstring(1,'documentotr'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"PrimerApellido",ads_datos.getitemstring(1,'primerapellidotr'))
	if not isnull(ads_datos.getitemstring(1,'segundoapellidotr')) or Len(ads_datos.getitemstring(1,'segundoapellidotr'))>1 then
		anvo_xml.UpdateAttrAt("Trabajador",1,"SegundoApellido",ads_datos.getitemstring(1,'segundoapellidotr'))
	else
		anvo_xml.UpdateAttrAt("Trabajador",1,"SegundoApellido",'')
	end if
	anvo_xml.UpdateAttrAt("Trabajador",1,"PrimerNombre",ads_datos.getitemstring(1,'primernombretr'))
	if not isnull(ads_datos.getitemstring(1,'otrosnombrestr')) and Len(ads_datos.getitemstring(1,'otrosnombrestr'))>1 then 
		anvo_xml.UpdateAttrAt("Trabajador",1,"OtrosNombres",ads_datos.getitemstring(1,'otrosnombrestr'))
	end if	
	anvo_xml.UpdateAttrAt("Trabajador",1,"LugarTrabajoPais",ads_datos.getitemstring(1,'lugartrabajopaistr'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"LugarTrabajoDepartamentoEstado",ads_datos.getitemstring(1,'lugartrabajodepartamentoestadotr'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"LugarTrabajoMunicipioCiudad",ads_datos.getitemstring(1,'lugartrabajodepartamentoestadotr')+ads_datos.getitemstring(1,'lugartrabajomunicipiociudadtr'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"LugarTrabajoDireccion",ads_datos.getitemstring(1,'lugartrabajodirecciontr'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"SalarioIntegral",ads_datos.getitemstring(1,'salariointegral'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"TipoContrato",ads_datos.getitemstring(1,'tcont_dian'))
	anvo_xml.UpdateAttrAt("Trabajador",1,"Sueldo",string(ads_datos.getitemnumber(1,'salario')))
	anvo_xml.UpdateAttrAt("Trabajador",1,"CodigoTrabajador",ads_datos.getitemstring(1,'tdocu'))
	
	anvo_xml.UpdateAttrAt("Pago",1,"Forma",ads_datos.getitemstring(1,'pago_forma'))
	anvo_xml.UpdateAttrAt("Pago",1,"Metodo",ads_datos.getitemstring(1,'metopag_dian'))
	if (ads_datos.getitemstring(1,'metopag_dian')='46' or ads_datos.getitemstring(1,'metopag_dian')='46' or ads_datos.getitemstring(1,'metopag_dian')='47') then
		anvo_xml.UpdateAttrAt("Pago",1,"Banco",ads_datos.getitemstring(1,'banco'))
		anvo_xml.UpdateAttrAt("Pago",1,"TipoCuenta",ads_datos.getitemstring(1,'tipocuenta'))
		anvo_xml.UpdateAttrAt("Pago",1,"NumeroCuenta",ads_datos.getitemstring(1,'numerocuenta'))
	end if
	anvo_xml.UpdateChildContent("FechasPagos|FechaPago",string(ads_datos.getitemdatetime(1,'fechapago'),'yyyy-mm-dd'))	
	
	for  li_rc=1 to ads_datos.rowcount()
		conc=ads_datos.getitemstring(li_rc,'ord_dian')
		li_com=0
		do 
			if li_rc=1 then
				If  conc='01' then  
					anvo_xml.UpdateAttrAt("Devengados|Basico",1,"DiasTrabajados",string(ads_datos.getitemnumber(li_rc,'bas_dtra')))
					anvo_xml.UpdateAttrAt("Devengados|Basico",1,"SueldoTrabajado",string(ads_datos.getitemnumber(li_rc,'bas_sueldo')))
				else
					anvo_xml.UpdateAttrAt("Devengados|Basico",1,"DiasTrabajados",string(0))
					anvo_xml.UpdateAttrAt("Devengados|Basico",1,"SueldoTrabajado",string(0))
				end if
			end if
		/*	If  conc='02' then anvo_xml.UpdateAttrAt("Devengados|Transporte",1,"AuxilioTransporte",string(ads_datos.getitemnumber(li_rc,'auxtrans')))
			If  conc='03' then anvo_xml.UpdateAttrAt("Devengados|Transporte",1,"ViaticoManuAlojS","0")
			If  conc='04' then anvo_xml.UpdateAttrAt("Devengados|Transporte",1,"ViaticoManuAlojNS","0")
			If  conc='05' then  
				anvo_xml.UpdateAttrAt("Devengados|HEDs|HED["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinihed'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HEDs|HED["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinhed'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HEDs|HED["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'canthed')))
				anvo_xml.UpdateAttrAt("Devengados|HEDs|HED["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarhed'),"###.00"))
				anvo_xml.UpdateAttrAt("Devengados|HEDs|HED["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagohed') ))
			end if	
			If  conc='06' then  
				anvo_xml.UpdateAttrAt("Devengados|HENs|HEN["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinihen'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HENs|HEN["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinhen'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HENs|HEN["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'canthen')))
				anvo_xml.UpdateAttrAt("Devengados|HENs|HEN["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarhen'),"###.00"))
				anvo_xml.UpdateAttrAt("Devengados|HENs|HEN["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagohen') ))
			end if		
			If  conc='07' then  
				anvo_xml.UpdateAttrAt("Devengados|HRNs|HRN["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinirn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HRNs|HRN["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinrn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HRNs|HRN["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'cantrn')))
				anvo_xml.UpdateAttrAt("Devengados|HRNs|HRN["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarrn'),"###.00"))
				anvo_xml.UpdateAttrAt("Devengados|HRNs|HRN["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagorn') ))
			end if		
			If  conc='08' then  
				anvo_xml.UpdateAttrAt("Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinihedfd'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinhedfd'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'canthedfd')))
				anvo_xml.UpdateAttrAt("Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarhedfd'),"###.00"))
				anvo_xml.UpdateAttrAt("Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagohedfd') ))
			end if		
			If  conc='09' then  
				anvo_xml.UpdateAttrAt("Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinirdf'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinrdf'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'cantrdf')))
				anvo_xml.UpdateAttrAt("Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarrdf'),"###.00"))
				anvo_xml.UpdateAttrAt("Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagordf') ))
			end if	
			If  conc='10' then  
				anvo_xml.UpdateAttrAt("Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinihedfn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinhedfn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'canthedfn')))
				anvo_xml.UpdateAttrAt("Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarhedfn'),"###.00"))
				anvo_xml.UpdateAttrAt("Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagohedfn') ))
			end if			
			If  conc='11' then  
				anvo_xml.UpdateAttrAt("Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinirdfn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinrdfn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'cantrdfn')))
				anvo_xml.UpdateAttrAt("Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarrdfn'),"###.00"))
				anvo_xml.UpdateAttrAt("Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagordfn')))
			end if			*/
			If  conc='12' then  
				anvo_xml.UpdateAttrAt("Devengados|Vacaciones|VacacionesComunes["+string(li_com)+"]",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finivac'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Vacaciones|VacacionesComunes["+string(li_com)+"]",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffinvac'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Vacaciones|VacacionesComunes["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diasvac') ))
				anvo_xml.UpdateAttrAt("Devengados|Vacaciones|VacacionesComunes["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagovac') ))
			end if		
			If  conc='13' then  		
				anvo_xml.UpdateAttrAt("Devengados|Vacaciones|VacacionesCompensadas",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diasvacc') ))
				anvo_xml.UpdateAttrAt("Devengados|Vacaciones|VacacionesCompensadas",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagovacc') ))
			end if
			If  conc='14' then  
				anvo_xml.UpdateAttrAt("Devengados|Primas",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diaspr') ))
				anvo_xml.UpdateAttrAt("Devengados|Primas",1,"pago",string(ads_datos.getitemnumber(li_rc,'pagopr') ))
				anvo_xml.UpdateAttrAt("Devengados|Primas",1,"PagoNS","0.00")
			end if		
			If  conc='15' then  
				anvo_xml.UpdateAttrAt("Devengados|Cesantias",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagocesa') ))
				anvo_xml.UpdateAttrAt("Devengados|Cesantias",1,"porcentaje",string(ads_datos.getitemnumber(li_rc,'tarrintcesa') ))
			end if
			If  conc='16' then  
				anvo_xml.UpdateAttrAt("Devengados|Cesantias",1,"PagoIntereses",string(ads_datos.getitemnumber(li_rc,'pagointcesa') ))
			end if	
		/*	If  conc='17' then  	
				anvo_xml.UpdateAttrAt("Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finiinc'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffininc'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diasinc') ))
				anvo_xml.UpdateAttrAt("Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"Tipo",ads_datos.getitemstring(li_rc,'tipoinc') )
				anvo_xml.UpdateAttrAt("Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagoinc') ))
			end if*/
			If  conc='18' then  	
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaMP",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finilplm'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaMP",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffinlplm'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaMP",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diaslplm')))
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaMP",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagolplm') ))
			end if
			If  conc='19' then  	
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaR",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finillnr'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaR",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'diaslnr'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaR",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diaslnr')))
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaR",1,"Pago",string(ads_datos.getitemnumber(li_rc,'diaslnr')))
			end if
			If  conc='20' then  	
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaNR",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finillnnr'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaNR",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffinlnnr'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|Licencias|LicenciaNR",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diaslnnr')))
			end if
			If  conc='21' then  			
				anvo_xml.UpdateAttrAt("Devengados|Bonificaciones|Bonificacion",1,"BonificacionS",string(ads_datos.getitemnumber(li_rc,'pagoboni')))
				anvo_xml.UpdateAttrAt("Devengados|Bonificaciones|Bonificacion",1,"BonificacionNS","0.00")
			end if
			If  conc='22' then  				
				anvo_xml.UpdateAttrAt("Devengados|Auxilios|Auxilio",1,"AuxilioS",string(ads_datos.getitemnumber(li_rc,'pagoauxis')))
				anvo_xml.UpdateAttrAt("Devengados|Auxilios|Auxilio",1,"AuxilioNS","0.00")
			end if
			If  conc='23' then  			
				anvo_xml.UpdateAttrAt("Devengados|HuelgasLegales|HuelgaLegal",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finihuel'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|HuelgasLegales|HuelgaLegal",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffinhuel'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Devengados|HuelgasLegales|HuelgaLegal",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diashuel')))
			end if
			If  conc='24' then
				anvo_xml.UpdateAttrAt("Devengados|OtrosConceptos|OtroConcepto["+string(li_com)+"]",1,"DescripcionConcepto",ads_datos.getitemstring(li_rc,'desotrosc') )
				anvo_xml.UpdateAttrAt("Devengados|OtrosConceptos|OtroConcepto["+string(li_com)+"]",1,"ConceptoS",string(ads_datos.getitemnumber(li_rc,'pagootrosc')))
				//anvo_xml.UpdateAttrAt("Devengados|OtrosConceptos|OtroConcepto["+string(li_com)+"]",1,"ConceptoNS","0.00")
			end if
			If conc='25' then anvo_xml.UpdateAttrAt("Devengados|Compensaciones|Compensacion",1,"CompensacionO","0.00")
			If conc='26' then anvo_xml.UpdateAttrAt("Devengados|Compensaciones|Compensacion",1,"CompensacionE","0.00")
			If conc='27' then anvo_xml.UpdateAttrAt("Devengados|BonoEPCTVs|BonoEPCTV",1,"PagoS","0.00")
			If conc='28' then anvo_xml.UpdateAttrAt("Devengados|BonoEPCTVs|BonoEPCTV",1,"PagoNS","0.00")
			If conc='29' then anvo_xml.UpdateAttrAt("Devengados|BonoEPCTVs|BonoEPCTV",1,"PagoAlimentacionS","0.00")
			If conc='30' then anvo_xml.UpdateAttrAt("Devengados|BonoEPCTVs|BonoEPCTV",1,"PagoAlimentacionNS","0.00")
					
			If conc='31' then anvo_xml.UpdateChildContent("Devengados|Comisiones|Comision","0.00")
			If conc='32' then anvo_xml.UpdateChildContent("Devengados|PagosTerceros|PagoTercero["+string(li_com)+"]","0.00")
			If conc='33' then anvo_xml.UpdateChildContent("Devengados|Anticipos|Anticipo","0.00")
			If conc='34' then anvo_xml.UpdateChildContent("Devengados|Dotacion","0.00")
			If conc='35' then anvo_xml.UpdateChildContent("Devengados|ApoyoSost","0.00")
			If conc='36' then anvo_xml.UpdateChildContent("Devengados|Teletrabajo","0.00")
			If conc='37' then anvo_xml.UpdateChildContent("Devengados|BonifRetiro","0.00")
			If conc='38' then anvo_xml.UpdateChildContent("Devengados|Indemnizacion","0.00")
			If conc='39' then anvo_xml.UpdateChildContent("Devengados|Reintegro","0.00")
			If conc='40' then
				anvo_xml.UpdateAttrAt("Deducciones|Salud",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarsalud')))
				anvo_xml.UpdateAttrAt("Deducciones|Salud",1,"Deduccion",string(ads_datos.getitemnumber(li_rc,'pagosalud')))
			else
				anvo_xml.UpdateAttrAt("Deducciones|Salud",1,"Porcentaje",string(4))
				anvo_xml.UpdateAttrAt("Deducciones|Salud",1,"Deduccion","0.00")
			end if
			If conc='41' then	
				anvo_xml.UpdateAttrAt("Deducciones|FondoPension",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarpension')))
				anvo_xml.UpdateAttrAt("Deducciones|FondoPension",1,"Deduccion",string(ads_datos.getitemnumber(li_rc,'pagopension')))
			else
				anvo_xml.UpdateAttrAt("Deducciones|FondoPension",1,"Porcentaje",string(4))
				anvo_xml.UpdateAttrAt("Deducciones|FondoPension",1,"Deduccion","0.00")
			end if
			If conc='42' then	
				anvo_xml.UpdateAttrAt("Deducciones|FondoSP",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarfsp')))
				anvo_xml.UpdateAttrAt("Deducciones|FondoSP",1,"DeduccionSP",string(ads_datos.getitemnumber(li_rc,'pagofsp')))
				anvo_xml.UpdateAttrAt("Deducciones|FondoSP",1,"PorcentajeSub","0.00")
				anvo_xml.UpdateAttrAt("Deducciones|FondoSP",1,"DeduccionSub","0.00")	
			end if
			If conc='43' then	
				anvo_xml.UpdateAttrAt("Deducciones|Sindicatos|Sindicato",1,"Porcentaje","0.00")
				anvo_xml.UpdateAttrAt("Deducciones|Sindicatos|Sindicato",1,"Deduccion","0.00")
			end if
			If  conc='44' then anvo_xml.UpdateAttrAt("Deducciones|Sanciones|Sancion",1,"SancionPublic","0.00")
			If  conc='45' then	anvo_xml.UpdateAttrAt("Deducciones|Sanciones|Sancion",1,"SancionPriv","0.00")
			
			If  conc='46' then	
				anvo_xml.UpdateAttrAt("Deducciones|Libranzas|Libranza["+string(li_com)+"]",1,"Descripcion",ads_datos.getitemstring(li_rc,'deslibra'))
				anvo_xml.UpdateAttrAt("Deducciones|Libranzas|Libranza["+string(li_com)+"]",1,"Deduccion",string(ads_datos.getitemnumber(li_rc,'pagolibra')))
			end if	
			
			If  conc='47' then anvo_xml.UpdateChildContent("Deducciones|PagosTerceros|PagoTercero["+string(li_com)+"]","0.00")
			If  conc='48' then anvo_xml.UpdateChildContent("Deducciones|Anticipos|Anticipo","0.00")
			If  conc='49' then anvo_xml.UpdateChildContent("Deducciones|OtraDeduccion["+string(li_com)+"]","0.00")
			If  conc='50' then anvo_xml.UpdateChildContent("Deducciones|PensionVoluntaria","0.00")
			If  conc='51' then anvo_xml.UpdateChildContent("Deducciones|RetencionFuente",string(ads_datos.getitemnumber(li_rc,'pagoretef')))
			If  conc='52' then anvo_xml.UpdateChildContent("Deducciones|AFC",string(ads_datos.getitemnumber(li_rc,'pagoafc')))
			If  conc='53' then anvo_xml.UpdateChildContent("Deducciones|Cooperativa["+string(li_com)+"]",string(ads_datos.getitemnumber(li_rc,'pagocoope')))
			If  conc='54' then anvo_xml.UpdateChildContent("Deducciones|EmbargoFiscal["+string(li_com)+"]",string(ads_datos.getitemnumber(li_rc,'pagoembargo')))
			If  conc='55' then anvo_xml.UpdateChildContent("Deducciones|PlanComplementarios",string(ads_datos.getitemnumber(li_rc,'pagopac')))
			If  conc='56' then anvo_xml.UpdateChildContent("Deducciones|Educacion",string(ads_datos.getitemnumber(li_rc,'pagoeducacion')))
			If  conc='57' then anvo_xml.UpdateChildContent("Deducciones|Reintegro",string(ads_datos.getitemnumber(li_rc,'pagoreintegro')))
			If  conc='58' then anvo_xml.UpdateChildContent("Deducciones|Deuda["+string(li_com)+"]",string(ads_datos.getitemnumber(li_rc,'pagodeuda')))
			li_rc++
			li_com++
		loop while conc=ads_datos.getitemstring(li_rc,'ord_dian')
		li_rc --
	next
	anvo_xml.UpdateChildContent("Redondeo","0.00")
	anvo_xml.UpdateChildContent("DevengadosTotal",string(ads_datos.getitemnumber(1,'tdevn')))
	anvo_xml.UpdateChildContent("DeduccionesTotal",string(ads_datos.getitemnumber(1,'tdedu')))
	anvo_xml.UpdateChildContent("ComprobanteTotal",string(ads_datos.getitemnumber(1,'neto')))
end if

//////////////////////REMPLAZO AJUSTE
if as_tipo='a' then 
	anvo_xml.UpdateChildContent("TipoNota","1")
	anvo_xml.UpdateAttrAt("Reemplazar|ReemplazandoPredecesor",1,"NumeroPred",as_small_cune_ant)
	anvo_xml.UpdateAttrAt("Reemplazar|ReemplazandoPredecesor",1,"CUNEPred",as_small_cune_ant)
	anvo_xml.UpdateAttrAt("Reemplazar|ReemplazandoPredecesor",1,"FechaGenPred",string( ads_datos.getitemdatetime(1,'fecha'),'yyyy-mm-dd'))

	if not isnull(ads_datos.getitemstring(1,'ingre_empre')) then 
		anvo_xml.UpdateAttrAt("Reemplazar|Periodo",1,"FechaIngreso",string( ads_datos.getitemdatetime(1,'ingre_empre')  ,'yyyy-mm-dd'))
	end if	
	if not isnull(ads_datos.getitemdatetime(1,'fecha_retiro')) then 	
		anvo_xml.UpdateAttrAt("Reemplazar|Periodo",1,"FechaRetiro",string( ads_datos.getitemdatetime(1,'fecha_retiro')  ,'yyyy-mm-dd'))
	end if
	anvo_xml.UpdateAttrAt("Reemplazar|Periodo",1,"FechaLiquidacionInicio",string( ads_datos.getitemdatetime(1,'inicia')  ,'yyyy-mm-dd'))
	anvo_xml.UpdateAttrAt("Reemplazar|Periodo",1,"FechaLiquidacionFin",string( ads_datos.getitemdatetime(1,'termina')  ,'yyyy-mm-dd'))
	anvo_xml.UpdateAttrAt("Reemplazar|Periodo",1,"TiempoLaborado",string(f_dias_360( ads_datos.getitemdatetime(1,'ingre_empre'),ads_datos.getitemdatetime(1,'termina'))))
	anvo_xml.UpdateAttrAt("Reemplazar|Periodo",1,"FechaGen",string( ads_datos.getitemdatetime(1,'fecha'),'yyyy-mm-dd'))
	
	anvo_xml.UpdateAttrAt("Reemplazar|NumeroSecuenciaXML",1,"CodigoTrabajador",ads_datos.getitemstring(1,'tdocu'))
	//anvo_xml.UpdateAttrAt("Reemplazar|NumeroSecuenciaXML",1,"Prefijo",ads_datos.getitemstring(1,'prefijo'))
	anvo_xml.UpdateAttrAt("Reemplazar|NumeroSecuenciaXML",1,"Consecutivo",trim(string(ads_datos.getitemnumber(1,'cnum_nomina')))+ads_datos.getitemstring(1,'tdocu')+trim(string(ads_datos.getitemnumber(1,'cons_emp'))))
	anvo_xml.UpdateAttrAt("Reemplazar|NumeroSecuenciaXML",1,"Numero",trim(string(ads_datos.getitemnumber(1,'cnum_nomina')))+ads_datos.getitemstring(1,'tdocu')+trim(string(ads_datos.getitemnumber(1,'cons_emp'))))
	anvo_xml.UpdateAttrAt("Reemplazar|LugarGeneracionXML",1,"Pais",ads_datos.getitemstring(1,'cdian'))
	anvo_xml.UpdateAttrAt("Reemplazar|LugarGeneracionXML",1,"DepartamentoEstado",ads_datos.getitemstring(1,'dpto') )
	anvo_xml.UpdateAttrAt("Reemplazar|LugarGeneracionXML",1,"MunicipioCiudad",ads_datos.getitemstring(1,'dpto')+ads_datos.getitemstring(1,'ciudad'))
	anvo_xml.UpdateAttrAt("Reemplazar|LugarGeneracionXML",1,"Idioma",ads_datos.getitemstring(1,'idioma'))

	anvo_xml.UpdateAttrAt("Reemplazar|ProveedorXML",1,"RazonSocial",ads_datos.getitemstring(1,'razonsocialpv'))
	anvo_xml.UpdateAttrAt("Reemplazar|ProveedorXML",1,"PrimerApellido",ads_datos.getitemstring(1,'primerapellidopv'))
	anvo_xml.UpdateAttrAt("Reemplazar|ProveedorXML",1,"SegundoApellido",ads_datos.getitemstring(1,'segundoapellidopv'))	
	anvo_xml.UpdateAttrAt("Reemplazar|ProveedorXML",1,"PrimerNombre",ads_datos.getitemstring(1,'primernombrepv'))
	anvo_xml.UpdateAttrAt("Reemplazar|ProveedorXML",1,"OtrosNombres",ads_datos.getitemstring(1,'otrosnombrepv'))
	anvo_xml.UpdateAttrAt("Reemplazar|ProveedorXML",1,"NIT",string(ads_datos.getitemnumber(1,'nitpv')))
	anvo_xml.UpdateAttrAt("Reemplazar|ProveedorXML",1,"DV",string(ads_datos.getitemnumber(1,'dvpv')))
	anvo_xml.UpdateAttrAt("Reemplazar|ProveedorXML",1,"SoftwareID",ads_datos.getitemstring(1,'softwareid'))
	anvo_xml.UpdateAttrAt("Reemplazar|ProveedorXML",1,"SoftwareSC",as_sfc_384)	
	if ads_datos.getitemstring(1,'tipo_ambiente')='2' then 
		anvo_xml.UpdateChildContent("Reemplazar|CodigoQR",'https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey='+as_small_cune)
	else
		anvo_xml.UpdateChildContent("Reemplazar|CodigoQR",'https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey='+as_small_cune)
	end if	
	
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"Version","V1.0: Nota de Ajuste de Documento Soporte de Pago de Nómina Electrónica")
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"Ambiente",ads_datos.getitemstring(1,'tipo_ambiente'))
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"TipoXML","103")
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"CUNE",as_small_cune)
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"EncripCUNE","CUNE-SHA384")
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"FechaGen",string(ads_datos.getitemdatetime(1,'fecha'),'yyyy-mm-dd'))
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"HoraGen",string(ads_datos.getitemdatetime(1,'fecha'),'HH:mm:ss')+'-05:00')
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"PeriodoNomina",ads_datos.getitemstring(1,'periodo'))
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"TipoMoneda","COP")
	anvo_xml.UpdateAttrAt("Reemplazar|InformacionGeneral",1,"TRM","0")	
	anvo_xml.UpdateChildContent("Reemplazar|Notas","Información de Novedades Empleado ("+ads_datos.getitemstring(1,'empleado')+" " +ads_datos.getitemstring(1,'nombre_empleado')+")")

	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"RazonSocial",ads_datos.getitemstring(1,'razonsocialem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"PrimerApellido",ads_datos.getitemstring(1,'primerapellidoem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"SegundoApellido",ads_datos.getitemstring(1,'segundoapellidoem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"PrimerNombre",ads_datos.getitemstring(1,'primernombreem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"OtrosNombres",ads_datos.getitemstring(1,'otrosnombresem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"NIT",ads_datos.getitemstring(1,'nitem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"DV",ads_datos.getitemstring(1,'dvem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"Pais",ads_datos.getitemstring(1,'paisem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"DepartamentoEstado",ads_datos.getitemstring(1,'departamentoestadoem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"MunicipioCiudad",ads_datos.getitemstring(1,'departamentoestadoem')+ads_datos.getitemstring(1,'municipiociudadem'))
	anvo_xml.UpdateAttrAt("Reemplazar|Empleador",1,"Direccion",ads_datos.getitemstring(1,'direccionem'))
		
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"TipoTrabajador",ads_datos.getitemstring(1,'ttrab_dian'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"SubTipoTrabajador",ads_datos.getitemstring(1,'sttrab_dian'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"AltoRiesgoPension",ads_datos.getitemstring(1,'altoriesgopension'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"TipoDocumento",ads_datos.getitemstring(1,'tipodocumentotr'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"NumeroDocumento",ads_datos.getitemstring(1,'documentotr'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"PrimerApellido",ads_datos.getitemstring(1,'primerapellidotr'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"SegundoApellido",ads_datos.getitemstring(1,'segundoapellidotr'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"PrimerNombre",ads_datos.getitemstring(1,'primernombretr'))
	if not isnull(ads_datos.getitemstring(1,'otrosnombrestr')) then 
		anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"OtrosNombres",ads_datos.getitemstring(1,'otrosnombrestr'))
	end if		
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"LugarTrabajoPais",ads_datos.getitemstring(1,'lugartrabajopaistr'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"LugarTrabajoDepartamentoEstado",ads_datos.getitemstring(1,'lugartrabajodepartamentoestadotr'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"LugarTrabajoMunicipioCiudad",ads_datos.getitemstring(1,'lugartrabajodepartamentoestadotr')+ads_datos.getitemstring(1,'lugartrabajomunicipiociudadtr'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"LugarTrabajoDireccion",ads_datos.getitemstring(1,'lugartrabajodirecciontr'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"SalarioIntegral",ads_datos.getitemstring(1,'salariointegral'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"TipoContrato",ads_datos.getitemstring(1,'tcont_dian'))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"Sueldo",string(ads_datos.getitemnumber(1,'salario')))
	anvo_xml.UpdateAttrAt("Reemplazar|Trabajador",1,"CodigoTrabajador",ads_datos.getitemstring(1,'tdocu'))

	anvo_xml.UpdateAttrAt("Reemplazar|Pago",1,"Forma",ads_datos.getitemstring(1,'pago_forma'))
	anvo_xml.UpdateAttrAt("Reemplazar|Pago",1,"Metodo",ads_datos.getitemstring(1,'metopag_dian'))
	anvo_xml.UpdateAttrAt("Reemplazar|Pago",1,"Banco",ads_datos.getitemstring(1,'banco'))
	anvo_xml.UpdateAttrAt("Reemplazar|Pago",1,"TipoCuenta",ads_datos.getitemstring(1,'tipocuenta'))
	anvo_xml.UpdateAttrAt("Reemplazar|Pago",1,"NumeroCuenta",ads_datos.getitemstring(1,'numerocuenta'))
	anvo_xml.UpdateChildContent("Reemplazar|FechasPagos|FechaPago",string(ads_datos.getitemdatetime(1,'fechapago'),'yyyy-mm-dd'))	

	for  li_rc=1 to ads_datos.rowcount()
		conc=ads_datos.getitemstring(li_rc,'ord_dian')
		li_com=0
		do 
			If  conc='01' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Basico",1,"DiasTrabajados",string(ads_datos.getitemnumber(li_rc,'bas_dtra')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Basico",1,"SueldoTrabajado",string(ads_datos.getitemnumber(li_rc,'bas_sueldo')))
			end if
		/*	If  conc='02' then anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Transporte",1,"AuxilioTransporte",string(ads_datos.getitemnumber(li_rc,'auxtrans')))
			If  conc='03' then anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Transporte",1,"ViaticoManuAlojS","0")
			If  conc='04' then anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Transporte",1,"ViaticoManuAlojNS","0")
			If  conc='05' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDs|HED["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinihed'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDs|HED["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinhed'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDs|HED["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'canthed')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDs|HED["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarhed'),"###.00"))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDs|HED["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagohed') ))
			end if	
			If  conc='06' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENs|HEN["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinihen'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENs|HEN["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinhen'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENs|HEN["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'canthen')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENs|HEN["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarhen'),"###.00"))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENs|HEN["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagohen') ))
			end if		
			If  conc='07' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNs|HRN["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinirn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNs|HRN["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinrn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNs|HRN["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'cantrn')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNs|HRN["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarrn'),"###.00"))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNs|HRN["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagorn') ))
			end if		
			If  conc='08' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinihedfd'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinhedfd'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'canthedfd')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarhedfd'),"###.00"))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HEDDFs|HEDDF["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagohedfd') ))
			end if		
			If  conc='09' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinirdf'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinrdf'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'cantrdf')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarrdf'),"###.00"))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRDDFs|HRDDF["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagordf') ))
			end if	
			If  conc='10' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinihedfn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinhedfn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'canthedfn')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarhedfn'),"###.00"))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HENDFs|HENDF["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagohedfn') ))
			end if			
			If  conc='11' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"HoraInicio",string(ads_datos.getitemdatetime(li_rc,'hinirdfn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"HoraFin",string(ads_datos.getitemdatetime(li_rc,'hfinrdfn'),'yyyy-mm-ddThh:mm:ss' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'cantrdfn')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarrdfn'),"###.00"))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HRNDFs|HRNDF["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagordfn')))
			end if			*/
			If  conc='12' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Vacaciones|VacacionesComunes["+string(li_com)+"]",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finivac'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Vacaciones|VacacionesComunes["+string(li_com)+"]",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffinvac'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Vacaciones|VacacionesComunes["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diasvac') ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Vacaciones|VacacionesComunes["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagovac') ))
			end if		
			If  conc='13' then  		
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Vacaciones|VacacionesCompensadas",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diasvacc') ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Vacaciones|VacacionesCompensadas",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagovacc') ))
			end if
			If  conc='14' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Primas",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diaspr') ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Primas",1,"pago",string(ads_datos.getitemnumber(li_rc,'pagopr') ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Primas",1,"PagoNS","0.00")
			end if		
			If  conc='15' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Cesantias",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagocesa') ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Cesantias",1,"porcentaje",string(ads_datos.getitemnumber(li_rc,'tarrintcesa') ))
			end if
			If  conc='16' then  
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Cesantias",1,"PagoIntereses",string(ads_datos.getitemnumber(li_rc,'pagointcesa') ))
			end if	
		/*	If  conc='17' then  	
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finiinc'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffininc'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diasinc') ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"Tipo",ads_datos.getitemstring(li_rc,'tipoinc') )
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Incapacidades|Incapacidad["+string(li_com)+"]",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagoinc') ))
			end if*/
			If  conc='18' then  	
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaMP",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finilplm'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaMP",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffinlplm'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaMP",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diaslplm')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaMP",1,"Pago",string(ads_datos.getitemnumber(li_rc,'pagolplm') ))
			end if
			If  conc='19' then  	
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaR",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finillnr'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaR",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'diaslnr'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaR",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diaslnr')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaR",1,"Pago",string(ads_datos.getitemnumber(li_rc,'diaslnr')))
			end if
			If  conc='20' then  	
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaNR",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finillnnr'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaNR",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffinlnnr'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Licencias|LicenciaNR",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diaslnnr')))
			end if
			If  conc='21' then  			
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Bonificaciones|Bonificacion",1,"BonificacionS",string(ads_datos.getitemnumber(li_rc,'pagoboni')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Bonificaciones|Bonificacion",1,"BonificacionNS","0.00")
			end if
			If  conc='22' then  				
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Auxilios|Auxilio",1,"AuxilioS",string(ads_datos.getitemnumber(li_rc,'pagoauxis')))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Auxilios|Auxilio",1,"AuxilioNS","0.00")
			end if
			If  conc='23' then  			
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HuelgasLegales|HuelgaLegal",1,"FechaInicio",string(ads_datos.getitemdatetime(li_rc,'finihuel'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HuelgasLegales|HuelgaLegal",1,"FechaFin",string(ads_datos.getitemdatetime(li_rc,'ffinhuel'),'yyyy-mm-dd' ))
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|HuelgasLegales|HuelgaLegal",1,"Cantidad",string(ads_datos.getitemnumber(li_rc,'diashuel')))
			end if
			If  conc='24' then
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|OtrosConceptos|OtroConcepto["+string(li_com)+"]",1,"DescripcionConcepto",ads_datos.getitemstring(li_rc,'desotrosc') )
				anvo_xml.UpdateAttrAt("Reemplazar|Devengados|OtrosConceptos|OtroConcepto["+string(li_com)+"]",1,"ConceptoS",string(ads_datos.getitemnumber(li_rc,'pagootrosc')))
				//anvo_xml.UpdateAttrAt("Reemplazar|Devengados|OtrosConceptos|OtroConcepto["+string(li_com)+"]",1,"ConceptoNS","0.00")
			end if
			If conc='25' then anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Compensaciones|Compensacion",1,"CompensacionO","0.00")
			If conc='26' then anvo_xml.UpdateAttrAt("Reemplazar|Devengados|Compensaciones|Compensacion",1,"CompensacionE","0.00")
			If conc='27' then anvo_xml.UpdateAttrAt("Reemplazar|Devengados|BonoEPCTVs|BonoEPCTV",1,"PagoS","0.00")
			If conc='28' then anvo_xml.UpdateAttrAt("Reemplazar|Devengados|BonoEPCTVs|BonoEPCTV",1,"PagoNS","0.00")
			If conc='29' then anvo_xml.UpdateAttrAt("Reemplazar|Devengados|BonoEPCTVs|BonoEPCTV",1,"PagoAlimentacionS","0.00")
			If conc='30' then anvo_xml.UpdateAttrAt("Reemplazar|Devengados|BonoEPCTVs|BonoEPCTV",1,"PagoAlimentacionNS","0.00")
					
			If conc='31' then anvo_xml.UpdateChildContent("Reemplazar|Devengados|Comisiones|Comision","0.00")
			If conc='32' then anvo_xml.UpdateChildContent("Reemplazar|Devengados|PagosTerceros|PagoTercero["+string(li_com)+"]","0.00")
			If conc='33' then anvo_xml.UpdateChildContent("Reemplazar|Devengados|Anticipos|Anticipo","0.00")
			If conc='34' then anvo_xml.UpdateChildContent("Reemplazar|Devengados|Dotacion","0.00")
			If conc='35' then anvo_xml.UpdateChildContent("Reemplazar|Devengados|ApoyoSost","0.00")
			If conc='36' then anvo_xml.UpdateChildContent("Reemplazar|Devengados|Teletrabajo","0.00")
			If conc='37' then anvo_xml.UpdateChildContent("Reemplazar|Devengados|BonifRetiro","0.00")
			If conc='38' then anvo_xml.UpdateChildContent("Reemplazar|Devengados|Indemnizacion","0.00")
			If conc='39' then anvo_xml.UpdateChildContent("Reemplazar|Devengados|Reintegro","0.00")
			If  conc='40' then
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|Salud",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarsalud')))
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|Salud",1,"Deduccion",string(ads_datos.getitemnumber(li_rc,'pagosalud')))
			end if
			If  conc='41' then	
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|FondoPension",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarpension')))
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|FondoPension",1,"Deduccion",string(ads_datos.getitemnumber(li_rc,'pagopension')))
			end if
			If  conc='42' then	
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|FondoSP",1,"Porcentaje",string(ads_datos.getitemnumber(li_rc,'tarfsp')))
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|FondoSP",1,"Deduccion",string(ads_datos.getitemnumber(li_rc,'pagofsp')))
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|FondoSP",1,"PorcentajeSub","0.00")
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|FondoSP",1,"DeduccionSub","0.00")	
			end if
			If  conc='43' then	
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|Sindicatos|Sindicato",1,"Porcentaje","0.00")
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|Sindicatos|Sindicato",1,"Deduccion","0.00")
			end if
			If  conc='44' then anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|Sanciones|Sancion",1,"SancionPublic","0.00")
			If  conc='45' then	anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|Sanciones|Sancion",1,"SancionPriv","0.00")
			
			If  conc='46' then	
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|Libranzas|Libranza["+string(li_com)+"]",1,"Descripcion",ads_datos.getitemstring(li_rc,'deslibra'))
				anvo_xml.UpdateAttrAt("Reemplazar|Deducciones|Libranzas|Libranza["+string(li_com)+"]",1,"Deduccion",string(ads_datos.getitemnumber(li_rc,'pagolibra')))
			end if	
			
			If  conc='47' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|PagosTerceros|PagoTercero["+string(li_com)+"]","0.00")
			If  conc='48' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|Anticipos|Anticipo","0.00")
			If  conc='49' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|OtrasDeducciones|OtraDeduccion["+string(li_com)+"]","0.00")
			If  conc='50' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|PensionVoluntaria","0.00")
			If  conc='51' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|RetencionFuente","0.00")
			If  conc='52' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|AFC","0.00")
			If  conc='53' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|Cooperativa["+string(li_com)+"]","0.00")
			If  conc='54' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|EmbargoFiscal["+string(li_com)+"]","0.00")
			If  conc='55' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|PlanComplementarios","0.00")
			If  conc='56' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|Educacion","0.00")
			If  conc='57' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|Reintegro","0.00")
			If  conc='58' then anvo_xml.UpdateChildContent("Reemplazar|Deducciones|Deuda["+string(li_com)+"]","0.00")	
			li_rc++
			li_com++
		loop while conc=ads_datos.getitemstring(li_rc,'ord_dian')
		li_rc --
	next
	anvo_xml.UpdateChildContent("Reemplazar|Redondeo","0.00")
	anvo_xml.UpdateChildContent("Reemplazar|DevengadosTotal",string(ads_datos.getitemnumber(1,'tdevn')))
	anvo_xml.UpdateChildContent("Reemplazar|DeduccionesTotal",string(ads_datos.getitemnumber(1,'tdedu')))
	anvo_xml.UpdateChildContent("Reemplazar|ComprobanteTotal",string(ads_datos.getitemnumber(1,'neto')))
end if
//////////////////////ELIMINAR
if as_tipo='e' then
	anvo_xml.UpdateChildContent("TipoNota","2")
	anvo_xml.UpdateAttrAt("Eliminar|EliminandoPredecesor",1,"NumeroPred",as_small_cune_ant)
	anvo_xml.UpdateAttrAt("Eliminar|EliminandoPredecesor",1,"CUNEPred",as_small_cune_ant)
	anvo_xml.UpdateAttrAt("Eliminar|EliminandoPredecesor",1,"FechaGenPred",string( ads_datos.getitemdatetime(1,'fecha'),'yyyy-mm-dd'))

//	anvo_xml.UpdateAttrAt("Eliminar|NumeroSecuenciaXML",1,"Prefijo",ads_datos.getitemstring(1,'prefijo'))
	anvo_xml.UpdateAttrAt("Eliminar|NumeroSecuenciaXML",1,"Consecutivo",trim(string(ads_datos.getitemnumber(1,'cnum_nomina')))+ads_datos.getitemstring(1,'tdocu')+trim(string(ads_datos.getitemnumber(1,'cons_emp'))))
	anvo_xml.UpdateAttrAt("Eliminar|NumeroSecuenciaXML",1,"Numero",trim(string(ads_datos.getitemnumber(1,'cnum_nomina')))+ads_datos.getitemstring(1,'tdocu')+trim(string(ads_datos.getitemnumber(1,'cons_emp'))))
	anvo_xml.UpdateAttrAt("Eliminar|LugarGeneracionXML",1,"Pais",ads_datos.getitemstring(1,'cdian'))
	anvo_xml.UpdateAttrAt("Eliminar|LugarGeneracionXML",1,"DepartamentoEstado",ads_datos.getitemstring(1,'dpto') )
	anvo_xml.UpdateAttrAt("Eliminar|LugarGeneracionXML",1,"MunicipioCiudad",ads_datos.getitemstring(1,'dpto')+ads_datos.getitemstring(1,'ciudad'))
	anvo_xml.UpdateAttrAt("Eliminar|LugarGeneracionXML",1,"Idioma",ads_datos.getitemstring(1,'idioma'))
	
	anvo_xml.UpdateAttrAt("Eliminar|ProveedorXML",1,"RazonSocial",ads_datos.getitemstring(1,'razonsocialpv'))
	anvo_xml.UpdateAttrAt("Eliminar|ProveedorXML",1,"PrimerApellido",ads_datos.getitemstring(1,'primerapellidopv'))
	anvo_xml.UpdateAttrAt("Eliminar|ProveedorXML",1,"SegundoApellido",ads_datos.getitemstring(1,'segundoapellidopv'))	
	anvo_xml.UpdateAttrAt("Eliminar|ProveedorXML",1,"PrimerNombre",ads_datos.getitemstring(1,'primernombrepv'))
	anvo_xml.UpdateAttrAt("Eliminar|ProveedorXML",1,"OtrosNombres",ads_datos.getitemstring(1,'otrosnombrepv'))
	anvo_xml.UpdateAttrAt("Eliminar|ProveedorXML",1,"NIT",string(ads_datos.getitemnumber(1,'nitpv')))
	anvo_xml.UpdateAttrAt("Eliminar|ProveedorXML",1,"DV",string(ads_datos.getitemnumber(1,'dvpv')))
	anvo_xml.UpdateAttrAt("Eliminar|ProveedorXML",1,"SoftwareID",ads_datos.getitemstring(1,'softwareid'))
	anvo_xml.UpdateAttrAt("Eliminar|ProveedorXML",1,"SoftwareSC",as_sfc_384)	
	if ads_datos.getitemstring(1,'tipo_ambiente')='2' then 
		anvo_xml.UpdateChildContent("Eliminar|CodigoQR",'https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey='+as_small_cune)
	else
		anvo_xml.UpdateChildContent("Eliminar|CodigoQR",'https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey='+as_small_cune)
	end if	
	
	anvo_xml.UpdateAttrAt("Eliminar|InformacionGeneral",1,"Version","V1.0: Nota de Ajuste de Documento Soporte de Pago de Nómina Electrónica")
	anvo_xml.UpdateAttrAt("Eliminar|InformacionGeneral",1,"Ambiente",ads_datos.getitemstring(1,'tipo_ambiente'))
	anvo_xml.UpdateAttrAt("Eliminar|InformacionGeneral",1,"TipoXML","103")
	anvo_xml.UpdateAttrAt("Eliminar|InformacionGeneral",1,"CUNE",as_small_cune)
	anvo_xml.UpdateAttrAt("Eliminar|InformacionGeneral",1,"EncripCUNE","CUNE-SHA384")
	anvo_xml.UpdateAttrAt("Eliminar|InformacionGeneral",1,"FechaGen",string(ads_datos.getitemdatetime(1,'fecha'),'yyyy-mm-dd'))
	anvo_xml.UpdateAttrAt("Eliminar|InformacionGeneral",1,"HoraGen",string(ads_datos.getitemdatetime(1,'fecha'),'HH:mm:ss')+'-05:00')
	anvo_xml.UpdateChildContent("Eliminar|Notas","Información de Novedades Empleado ("+ads_datos.getitemstring(1,'empleado')+" " +ads_datos.getitemstring(1,'nombre_empleado')+")")
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"RazonSocial",ads_datos.getitemstring(1,'razonsocialem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"PrimerApellido",ads_datos.getitemstring(1,'primerapellidoem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"SegundoApellido",ads_datos.getitemstring(1,'segundoapellidoem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"PrimerNombre",ads_datos.getitemstring(1,'primernombreem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"OtrosNombres",ads_datos.getitemstring(1,'otrosnombresem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"NIT",ads_datos.getitemstring(1,'nitem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"DV",ads_datos.getitemstring(1,'dvem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"Pais",ads_datos.getitemstring(1,'paisem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"DepartamentoEstado",ads_datos.getitemstring(1,'departamentoestadoem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"MunicipioCiudad",ads_datos.getitemstring(1,'departamentoestadoem')+ads_datos.getitemstring(1,'municipiociudadem'))
	anvo_xml.UpdateAttrAt("Eliminar|Empleador",1,"Direccion",ads_datos.getitemstring(1,'direccionem'))		
end if
return 1
end function

public function integer of_actu_consecs_files_nom_elect (string as_coddoc, string as_tipo_ambiente, string as_tipo, integer ai_anyo, double al_nactual);//as_tipo: n: nomina , z: zip , e: nota eliminacion , a: nota ajuste remplazo
//as_tipo_ambiente: 1:produccion 2:pruebas

if as_tipo='e' or as_tipo='a' then
	update PM_CONSEC_FACT_ELECT set consec_actual_x_anyo=:al_nactual +1 
	where  tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and  consec_actual_x_anyo=:al_nactual and coddoc=:as_coddoc;
else
	update PM_CONSEC_FACT_ELECT set consec_actual_x_anyo=:al_nactual +1 
	where  tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and anyo=:ai_anyo and consec_actual_x_anyo=:al_nactual and coddoc=:as_coddoc;
end if
if sqlca.sqlcode<0 then
	gs_error=sqlca.sqlerrtext
	rollback;
	messagebox("Error SQL","Error actualizando pm_gral_consec_fact_elect "+gs_error)
	return -1
end if

if sqlca.sqlnrows<=0 then
	rollback;
	messagebox("Error SQL","Error actualizando pm_gral_consec_fact_elect el consecutivo actual es diferente al enviado !!!")
	return -1
end if
return 1
end function

public function integer of_soap_xml_firmado (ref nvo_generic_ole_object aoo_sbxmlsoap, string as_zipname, ref nvo_generic_ole_object aoo_cert, integer ai_metodo, string as_testp);/*ai_metodo:
1: SendTestSetAsync
2: GetStatusZip
3: SendBillSync*/
//https://www.example-code.com/powerbuilder/xades.asp
//https://www.example-code.com/powerbuilder/wcf_dian_colombia_soap_xml_signature.asp

int li_success , li_rc , li_NReplaced , li_NumSigs , li_VerifyIdx , li_verified
string ls_fechas
nvo_generic_ole_object loo_Gen , loo_XmlCustomKeyInfo ,  loo_Verifier ,loo_XmlToSign

li_Success = 1
// Create the XML to be signed...
loo_XmlToSign = create nvo_generic_ole_object
li_rc = loo_XmlToSign.ConnectToNewObject("Chilkat_9_5_0.Xml")
if li_rc < 0 then
    destroy loo_XmlToSign
    MessageBox("Error of_soap_xml_firmado","Connecting to COM object failed Chilkat_9_5_0.Xml")
    return -1
end if

date ld_hoy
time lt_ahora
datetime ldt_ahora

lt_ahora=now()
ld_hoy=today()
ldt_ahora=datetime(ld_hoy,lt_ahora)
ldt_ahora=gf_add_segundos(ldt_ahora,18000) //las 5 horas de Colombia

ls_fechas=string(ldt_ahora,'yyyy-mm-ddTHH:mm:ss')+'Z'

loo_XmlToSign.Tag = "soap:Envelope"
loo_XmlToSign.AddAttribute("xmlns:soap","http://www.w3.org/2003/05/soap-envelope")
loo_XmlToSign.AddAttribute("xmlns:wcf","http://wcf.dian.colombia")
loo_XmlToSign.UpdateAttrAt("soap:Header",1,"xmlns:wsa","http://www.w3.org/2005/08/addressing")
loo_XmlToSign.UpdateAttrAt("soap:Header|wsse:Security",1,"xmlns:wsse","http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd")
loo_XmlToSign.UpdateAttrAt("soap:Header|wsse:Security",1,"xmlns:wsu","http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd")
loo_XmlToSign.UpdateAttrAt("soap:Header|wsse:Security|wsu:Timestamp",1,"wsu:Id","TS-F25839120CBA3ECDAD68754D0443A667636FDA68")
loo_XmlToSign.UpdateChildContent("soap:Header|wsse:Security|wsu:Timestamp|wsu:Created",ls_fechas)
ls_fechas=string( gf_add_segundos(datetime(ld_hoy,lt_ahora),60000),"yyyy-mm-ddTHH:mm:ss")+'Z' //16 horas 40 mins (los 60000 milisegundos de la DIAN)
loo_XmlToSign.UpdateChildContent("soap:Header|wsse:Security|wsu:Timestamp|wsu:Expires",ls_fechas)
loo_XmlToSign.UpdateAttrAt("soap:Header|wsse:Security|wsse:BinarySecurityToken",1,"EncodingType","http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary")
loo_XmlToSign.UpdateAttrAt("soap:Header|wsse:Security|wsse:BinarySecurityToken",1,"ValueType","http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3")
loo_XmlToSign.UpdateAttrAt("soap:Header|wsse:Security|wsse:BinarySecurityToken",1,"wsu:Id","ABCXYZ-9F0F7E15A59816E680B4735080A789DC1EED6C9C")
loo_XmlToSign.UpdateChildContent("soap:Header|wsse:Security|wsse:BinarySecurityToken","BinarySecurityToken_Base64Binary_Content")

choose case ai_metodo
	case 1
		loo_XmlToSign.UpdateChildContent("soap:Header|wsa:Action","http://wcf.dian.colombia/IWcfDianCustomerServices/SendTestSetAsync")
	case 2
		loo_XmlToSign.UpdateChildContent("soap:Header|wsa:Action","http://wcf.dian.colombia/IWcfDianCustomerServices/GetStatusZip")
	case 3
		//loo_XmlToSign.UpdateChildContent("soap:Header|wsa:Action","http://wcf.dian.colombia/IWcfDianCustomerServices/SendBillSync")
		loo_XmlToSign.UpdateChildContent("soap:Header|wsa:Action","http://wcf.dian.colombia/IWcfDianCustomerServices/SendNominaSync")
end choose

loo_XmlToSign.UpdateAttrAt("soap:Header|wsa:To",1,"wsu:Id","ID-F25839120CBA3ECDAD68754D0443A667636FDA68")
loo_XmlToSign.UpdateAttrAt("soap:Header|wsa:To",1,"xmlns:wsu","http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd")
loo_XmlToSign.UpdateChildContent("soap:Header|wsa:To","https://vpfe-hab.dian.gov.co/WcfDianCustomerServices.svc")

choose case ai_metodo
	case 1
		loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendTestSetAsync|wcf:fileName",as_zipname)
	case 2
		loo_XmlToSign.UpdateChildContent("soap:Body|wcf:GetStatusZip|wcf:trackId",as_zipname)
	case 3
//		loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendBillSync|wcf:fileName",as_zipname)
		loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendNominaSync|wcf:fileName",as_zipname)	
end choose
if ai_metodo=1 or ai_metodo=3 then
		nvo_generic_ole_object loo_ZipData
		string ls_B64
		
		loo_ZipData = create nvo_generic_ole_object
		li_rc = loo_ZipData.ConnectToNewObject("Chilkat_9_5_0.BinData")
		if li_rc < 0 then
			 destroy loo_ZipData
			 MessageBox("Error","Connecting to COM object failed")
			 return -1
		end if
		
		li_Success = loo_ZipData.LoadFile(is_ruta_facturas + as_zipname)
		if li_Success <> 1 then
			  MessageBox("Error", "failed to load ZIP file.")
			 destroy loo_ZipData
			 return -1
		end if
		
		//https://www.example-code.com/powerbuilder/base64_pdf.asp
		// Encode the PDF to base64
		// Note: to produce base64 on multiple lines (as it would appear in the MIME of an email),
		// pass the string "base64_mime" instead of "base64".
		ls_B64 = loo_ZipData.GetEncoded("base64")
		
		destroy loo_ZipData
		
		if ai_metodo=3 then
//			loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendBillSync|wcf:contentFile",ls_B64)
			loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendNominaSync|wcf:contentFile",ls_B64)

		elseif ai_metodo=1 then		
			loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendTestSetAsync|wcf:contentFile",ls_B64)
//			loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendTestSetAsync|wcf:testSetId","0b6b29e6-be7b-4570-8485-f08ac144787b")
			loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendTestSetAsync|wcf:testSetId",as_testp)
		end if		
end if

loo_Gen = create nvo_generic_ole_object
li_rc = loo_Gen.ConnectToNewObject("Chilkat_9_5_0.XmlDSigGen")

loo_Gen.SigLocation = "soap:Envelope|soap:Header|wsse:Security"
loo_Gen.SigLocationMod = 0
loo_Gen.SigId = "SIG-F25839120CBA3ECDAD68754D0443A667636FDA68"
loo_Gen.SigNamespacePrefix = "ds"
loo_Gen.SigNamespaceUri = "http://www.w3.org/2000/09/xmldsig#"
loo_Gen.SignedInfoCanonAlg = "EXCL_C14N"
loo_Gen.SignedInfoDigestMethod = "sha256"

// Set the KeyInfoId before adding references..
loo_Gen.KeyInfoId = "KI-F25839120CBA3ECDAD68754D0443A667636FDA68"

// -------- Reference 1 --------
loo_Gen.AddSameDocRef("ID-F25839120CBA3ECDAD68754D0443A667636FDA68","sha256","EXCL_C14N","soap wcf","")

loo_Gen.SetX509Cert(aoo_Cert,1)
loo_Gen.KeyInfoType = "Custom"

// Create the custom KeyInfo XML..
loo_XmlCustomKeyInfo = create nvo_generic_ole_object
li_rc = loo_XmlCustomKeyInfo.ConnectToNewObject("Chilkat_9_5_0.Xml")

loo_XmlCustomKeyInfo.Tag = "wsse:SecurityTokenReference"
loo_XmlCustomKeyInfo.AddAttribute("wsu:Id","STR-F25839120CBA3ECDAD68754D0443A667636FDA68")
loo_XmlCustomKeyInfo.UpdateAttrAt("wsse:Reference",1,"URI","#ABCXYZ-9F0F7E15A59816E680B4735080A789DC1EED6C9C")
loo_XmlCustomKeyInfo.UpdateAttrAt("wsse:Reference",1,"ValueType","http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3")

loo_XmlCustomKeyInfo.EmitXmlDecl = 0
loo_Gen.CustomKeyInfoXml = loo_XmlCustomKeyInfo.GetXml()

// Load XML to be signed...
aoo_SbXmlSOAP = create nvo_generic_ole_object
li_rc = aoo_SbXmlSOAP.ConnectToNewObject("Chilkat_9_5_0.StringBuilder")

loo_XmlToSign.GetXmlSb(aoo_SbXmlSOAP)
// Update BinarySecurityToken_Base64Binary_Content with the actual X509 of the signing cert.
li_NReplaced = aoo_SbXmlSOAP.Replace("BinarySecurityToken_Base64Binary_Content",aoo_Cert.GetEncoded())

loo_Gen.Behaviors = "IndentedSignature"
// Sign the XML...
li_Success = loo_Gen.CreateXmlDSigSb(aoo_SbXmlSOAP)
if li_Success <> 1 then
    messagebox("Estado Desbloqueo", loo_Gen.LastErrorText)
    destroy loo_XmlToSign
    destroy loo_Gen
    destroy aoo_Cert
    destroy loo_XmlCustomKeyInfo
    destroy aoo_SbXmlSOAP
    return -1
end if

// ----------------------------------------
// Verify the signatures we just produced...
loo_Verifier = create nvo_generic_ole_object
li_rc = loo_Verifier.ConnectToNewObject("Chilkat_9_5_0.XmlDSig")

li_Success = loo_Verifier.LoadSignatureSb(aoo_SbXmlSOAP)
if li_Success <> 1 then
     messagebox("Verificacion de firma",loo_Verifier.LastErrorText)
    destroy loo_XmlToSign
    destroy loo_Gen
    destroy aoo_Cert
    destroy loo_XmlCustomKeyInfo
    destroy aoo_SbXmlSOAP
    destroy loo_Verifier
    return -1
end if

li_NumSigs = loo_Verifier.NumSignatures
li_VerifyIdx = 0
do while li_VerifyIdx < li_NumSigs
    loo_Verifier.Selector = li_VerifyIdx
    li_Verified = loo_Verifier.VerifySignature(1)
    if li_Verified <> 1 then
         messagebox("Verificacion de firma (ciclo)", loo_Verifier.LastErrorText)
        destroy loo_XmlToSign
        destroy loo_Gen
        destroy aoo_Cert
        destroy loo_XmlCustomKeyInfo
        destroy aoo_SbXmlSOAP
        destroy loo_Verifier
        return -1
    end if
    li_VerifyIdx = li_VerifyIdx + 1
loop
return 1

end function

public function integer of_html_request (string as_mesage_soap, string as_filename, string as_ambiente);string ls_url,ls_ret,ls_data
int li_statusCode,li_rc , li_arch

httpClient lo_client
lo_client = Create httpClient
lo_client.SetRequestHeader("Content-Type", 'application/soap+xml; charset=UTF-8')

//https://community.appeon.com/index.php/articles-blogs/tutorials-articles/2-powerbuilder/236-call-soap-web-services-using-httpclient-object
if as_ambiente='2' then
	ls_url ="https://vpfe-hab.dian.gov.co/WcfDianCustomerServices.svc"
else
	ls_url ="https://vpfe.dian.gov.co/WcfDianCustomerServices.svc"
end if
lo_client.sendrequest('POST',ls_url,as_mesage_soap)
li_StatusCode = lo_client.GetResponseStatusCode()
ls_ret = lo_client.GetResponseStatusText( )
li_rc = lo_client.getresponsebody(  ls_data)
if li_statusCode<0 then
	messagebox("Error de httpClient "+string(li_StatusCode),ls_ret)
	return -1
end if
li_arch=fileopen(as_filename,textmode!,Write!,Shared!,replace!,EncodingUTF8!)
fileWriteEx(li_arch,ls_data)
fileclose(li_arch)
destroy lo_client
return 1
end function

public function st_retne_dian sign_chilkat (string as_coddoc, integer al_nom, string as_tdoc, string as_doc, uo_datawindow adw_nomina, string as_tipo_docu);//as_tipo_docu = n:nomina ; a: nota credito de anulacion , c:nota credito , d:nota debito
int li_rc,li_ret
string cune,cunesh,ls_data_qr,is_ruta_qr='c:\windows\temp\'  
string ls_sufijo_campo='',ls_ojo,ls_name,ls_testp
st_retne_dian lst_ret

SELECT cadena into :is_ruta_facturas
FROM parametros_gen
WHERE (((codigo_para)=54));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 54')
	lst_ret.as_estado="-2"
	return lst_ret
end if

if adw_nomina.retrieve(al_nom,as_tdoc,as_doc)<=0 then 
	lst_ret.as_estado="-2"
	return lst_ret
end if

ls_testp=adw_nomina.getitemstring(1,'testp')
is_ruta_firma=string( adw_nomina.rowcount())
is_ruta_firma=adw_nomina.getitemstring(1,'ruta_certificado')
is_clave_firma=f_descripta_new(adw_nomina.getitemstring(1,'clave_certificado'),'1')

if isnull(is_ruta_firma) or  trim(is_ruta_firma)='' then
	lst_ret.as_estado="-2"
	return lst_ret
end if

/////////////////////////////QR
cune=adw_nomina.getitemstring(1,'cune')
cune=adw_nomina.getitemstring(1,'cune')+f_descripta_new(adw_nomina.getitemstring(1,'pin'),'1')+adw_nomina.getitemstring(1,'tipo_ambiente')
adw_nomina.setitem(1,'cune',cune)

ls_data_qr='QRCode:https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey='+cune
draw_qr_code lqr_code
lqr_code=create draw_qr_code

ls_name=adw_nomina.getitemstring(1,'prefijo')+adw_nomina.getitemstring(1,'documentotr')
lqr_code.draw_msg(ls_data_qr,'L',is_ruta_qr+'qr_'+ls_name+'.bmp')
lst_ret.as_qrcode=is_ruta_qr+'qr_'+ls_name+'.bmp'
lst_ret.as_cune=cune
//ls_ojo=adw_nomina.modify('qr_picture.filename="'+is_ruta_qr+'qr_'+ls_name+'.bmp"')
destroy lqr_code

//////////////////////// VALIDAR CAMPOS OBLIGATORIOS
if of_validar_campos(adw_nomina)=-1 then
	lst_ret.as_estado="-2"
	return lst_ret
end if
uo_datastore lds_result
uo_datawindow lds_envio

boolean 	lbn_actu_consec_fact=false , lbn_actu_consec_zip=false
Integer 	li_zip_file , 				li_Status, 				li_anyo  
string		ls_tipo_ambiente 
decimal 	ll_nro_fact_x_anyo ,	ll_nro_zip_x_anyo
nvo_generic_ole_object 	loo_Cert , loo_SbXml , loo_SbXmlSOAP

setnull(li_rc)
////////////////////   DESBLOQUEAR LIBRERIAS DE CHILKAT
IF of_desbloquear_chilkat()=-1 then
	lst_ret.as_estado="-2"
	return lst_ret
end if
////////////////////  LEER CERTIFICADO
if of_leer_certificado(loo_Cert)=-1 then
	lst_ret.as_estado="-2"
	return lst_ret
end if
ls_tipo_ambiente=adw_nomina.getitemstring(1,'tipo_ambiente')
li_anyo=year(date(adw_nomina.getitemdatetime(1,'fecha')))
if as_tipo_docu='e' then ls_sufijo_campo='_anul'
////////////////NOMBRES y consecutivos de los ARCHIVOS
of_files_names(adw_nomina, lst_ret.as_filename , lst_ret.as_zipname , ll_nro_fact_x_anyo , ll_nro_zip_x_anyo , lbn_actu_consec_fact , lbn_actu_consec_zip , as_tipo_docu , ls_tipo_ambiente , li_anyo ,as_coddoc)
lds_result=create uo_datastore

//primer vez que se envía o ya se habia enviado antes pero tuvo errores (cuando tuvo errores se vuelve a enviar todo, solo que se conservan los nombres de archivos anteriores)
if (isnull(adw_nomina.getitemstring(1,'estado_dian'+ls_sufijo_campo)) or adw_nomina.getitemstring(1,'estado_dian'+ls_sufijo_campo)="-1") then 
	////////////////////////////////////////////////////// P R I M E R   V E Z    Q U E    S E    E N V Í A ////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////  FIRMAR XML DE LA FACTURA
	If of_firmar_xml(adw_nomina,loo_Cert,loo_SbXml , as_tipo_docu)=-1 then
		lst_ret.as_estado="-2"
		return lst_ret
	end if
	//guarda XML firmado en la ruta de la variable
	li_status=loo_SbXml.WriteFile(is_ruta_facturas+lst_ret.as_filename+'.xml','utf-8',0)
	if li_status<0 then
		messagebox("Error función sing_chilkat","Error exportando el XML en: "+is_ruta_facturas+lst_ret.as_filename+'.xml')
		lst_ret.as_estado="-2"
		return lst_ret
	end if
	//crear zip con la factura en XML
	if of_zip(is_ruta_facturas+lst_ret.as_zipname , is_ruta_facturas+lst_ret.as_filename+'.xml','n')=-1 then
		lst_ret.as_estado="-2"
	 	return lst_ret
	end if
	if ls_tipo_ambiente='2' then //pruebas
		///////////// C R E A R    M E N S A J E   S O A P    F I R M A D O //////////////////////
		//allá se le adiciona el ZIP cifrado en B64 al SOAP a enviar, el metodo 1 es async y el 3 sync
		if of_soap_xml_firmado(loo_SbXmlSOAP,lst_ret.as_zipname,loo_Cert,1,ls_testp)=-1 then
			lst_ret.as_estado="-2"
		 return lst_ret
		end if
		lds_result.dataobject='dw_retorno_dian_async_nom'
		if of_html_request(string( loo_SbXmlSOAP.GetAsString()) , is_ruta_facturas+lst_ret.as_filename+'_test_ret.xml',ls_tipo_ambiente)=-1 then
			rollback;
			lst_ret.as_estado="-2"
		 	return lst_ret
		end if
		li_status=lds_result.importFile(XML!,is_ruta_facturas+lst_ret.as_filename+'_test_ret.xml',ls_tipo_ambiente)
		if li_status<0 then
			messagebox('Error importando Respuesta','No es posible importar el mensaje de respuesta de la DIAN:~r~n'+is_ruta_facturas+lst_ret.as_filename+'_test_ret.xml')
			lst_ret.as_estado="-2"
			return lst_ret
		end if
		if lds_result.getitemstring(lds_result.rowcount(),'message')='Archivo no enviado.' then
			lst_ret.as_estado="-2"
		 	return lst_ret
		end if
		lst_ret.as_track_id=lds_result.getitemstring(lds_result.rowcount(),'zipkey')
		if of_actu_estado_nom(as_tipo_docu,al_nom,as_tdoc,as_doc,'0',lst_ret.as_filename,lst_ret.as_zipname,lst_ret.as_track_id)=-1 then 
			lst_ret.as_estado="-2"
			return lst_ret
		end if		
		if lbn_actu_consec_fact then
			string ls_tipo
			ls_tipo=as_tipo_docu
			if as_tipo_docu='e' then ls_tipo='a' //las anulaciones tambien son una nota credito
			if of_actu_consecs_files_nom_elect(as_coddoc,ls_tipo_ambiente,ls_tipo,li_anyo,ll_nro_fact_x_anyo -1)=-1 then
				lst_ret.as_estado="-2"
				 return lst_ret
			end if
		end if
		if lbn_actu_consec_zip then
			if of_actu_consecs_files_nom_elect(as_coddoc,ls_tipo_ambiente,'z',li_anyo,ll_nro_zip_x_anyo -1)=-1 then
				lst_ret.as_estado="-2"
		 		return lst_ret
			end if
		end if
		commit;
	else  //1:produccion
		//allá se le adiciona el ZIP cifrado en B64 al SOAP a enviar, el metodo 1 es async y el 3 sync
		if of_soap_xml_firmado(loo_SbXmlSOAP,lst_ret.as_zipname,loo_Cert,3,ls_testp)=-1 then
			lst_ret.as_estado="-2"
		 	return lst_ret
		end if	
		lds_result.dataobject='dw_retornos_dian_nom'	
		if of_html_request(string( loo_SbXmlSOAP.GetAsString()) , is_ruta_facturas+lst_ret.as_filename+'_sync_ret.xml',ls_tipo_ambiente)=-1 then		
			rollback;
			lst_ret.as_estado="-2"
			return lst_ret
		end if
		
		li_status=lds_result.importFile(XML!,is_ruta_facturas+lst_ret.as_filename+'_sync_ret.xml')
		if li_status<0 then
			messagebox('Error importando Respuesta','No es posible importar el mensaje de respuesta de la DIAN:~r~n'+is_ruta_facturas+lst_ret.as_filename+'_sync_ret.xml')
			lst_ret.as_estado="-2"
			return lst_ret
		end if
		if string(lds_result.getitemnumber(lds_result.rowcount(),'StatusCode'))='99' then
			lst_ret.as_estado="-2"
		 	return lst_ret
		end if
		
		if lbn_actu_consec_fact then //aqui el orden de reservar los nombres de archivos va primero, porque así tenga error, a esa factura ya se le debe asignar ese nombre de zip y de archivo de factura
			ls_tipo=as_tipo_docu
			if as_tipo_docu='a' then ls_tipo='c' //las anulaciones tambien son una nota credito
			if of_actu_consecs_files_nom_elect(as_coddoc,ls_tipo_ambiente,ls_tipo,li_anyo,ll_nro_fact_x_anyo -1)=-1 then
				lst_ret.as_estado="-2"
				 return lst_ret
			end if
		end if
		if lbn_actu_consec_zip then
			if of_actu_consecs_files_nom_elect(as_coddoc,ls_tipo_ambiente,'z',li_anyo,ll_nro_fact_x_anyo -1)=-1 then
				lst_ret.as_estado="-2"
				return lst_ret
			end if
		end if
		commit; ///el de guardar los nombres de los archivos , osea que desde aqui empieza otra transacción
		if lds_result.getitemnumber(lds_result.rowcount(),'statuscode')=0 then //validada OK
			if of_actu_estado_nom(as_tipo_docu,al_nom,as_tdoc,as_doc,'1',lst_ret.as_filename,lst_ret.as_zipname,lst_ret.as_track_id)=-1 then
				lst_ret.as_estado="-2"
				return lst_ret
			end if
		else //con errores
			if of_actu_estado_nom(as_tipo_docu,al_nom,as_tdoc,as_doc,'-1',lst_ret.as_filename,lst_ret.as_zipname,lst_ret.as_track_id)=-1 then
				lst_ret.as_estado="-2"
				return lst_ret
			end if
		//	messagebox("Atención!!","La validación del documento resultó con errores, por favor revise el archivo de retorno para corregirlos (" + is_ruta_facturas+lst_ret.as_filename+'_sync_ret.xml)',)
			lst_ret.as_estado="-1"
			return lst_ret			
		end if		
		commit;
	end if //FIN pruebas
	destroy loo_Cert
	destroy  loo_SbXml 
	destroy loo_SbXmlSOAP 
	lst_ret.as_estado="0"
	return lst_ret
elseif adw_nomina.getitemstring(1,'estado_dian'+ls_sufijo_campo)='0' then //ya se habia enviado y debe validar que pasó con el primer envío
/////////////////////////////////////////////// Y A    S E   H A B Í A    E N V I A D O    Y    H A Y    Q U E   V A L I D A R    Q U E    P A S Ó///////////////////////////////////////////////////////////////
///////////// C R E A R    M E N S A J E   S O A P    F I R M A D O //////////////////////
	if of_soap_xml_firmado(loo_SbXmlSOAP,adw_nomina.getitemstring(1,'file_name_zip'+ls_sufijo_campo),loo_Cert,2,ls_testp)=-1 then
		lst_ret.as_estado="-2"
	 	return lst_ret
	end if	
	lds_result.dataobject='dw_retorno_dian_status_zip'
	if of_html_request(string( loo_SbXmlSOAP.GetAsString()) , is_ruta_facturas+lst_ret.as_filename+'_zipStatus_ret.xml',ls_tipo_ambiente)=-1 then
		rollback;
		lst_ret.as_estado="-2"
		return lst_ret
	end if
	li_status=lds_result.importFile(XML!, is_ruta_facturas+lst_ret.as_filename+'_zipStatus_ret.xml' )
	if li_status<0 then
		messagebox('Error importando Respuesta','No es posible importar el mensaje de respuesta de la DIAN:~r~n'+ is_ruta_facturas+lst_ret.as_filename+'_zipStatus_ret.xml')
		lst_ret.as_estado="-2"
		 return lst_ret
	end if
	if lds_result.getitemstring(lds_result.rowcount(),'statuscode')='00' then //validada OK	
		if of_actu_estado_nom(as_tipo_docu,al_nom,as_tdoc,as_doc,'1',lst_ret.as_filename,lst_ret.as_zipname,lst_ret.as_track_id)=-1 then
			lst_ret.as_estado="-2"
		 	return lst_ret
		end if
	else //con errores
		if of_actu_estado_nom(as_tipo_docu,al_nom,as_tdoc,as_doc,'1',lst_ret.as_filename,lst_ret.as_zipname,lst_ret.as_track_id)=-1 then
			lst_ret.as_estado="-2"
		 	return lst_ret
		end if
		commit;		
		messagebox("Atención!!","La validación del documento resultó con errores, por favor revise el archivo de retorno para corregirlos (" + is_ruta_facturas+lst_ret.as_filename+'_zipStatus_ret.xml)')
		lst_ret.as_estado="-1"
		return lst_ret		
	end if
	commit;
end if //elseif

destroy loo_Cert
destroy loo_SbXml 
destroy loo_SbXmlSOAP 

//// **********************E N V I A R    C O R R E O    **********************************
lst_ret.as_estado="1"
return lst_ret

end function

public function integer of_enviar_correo (integer al_nom, string as_tdoc, string as_doc, string as_qrcode, string as_cune, string as_zipname, string as_filename, string as_docnm, string as_lug);int li_rc , li_Success
string ls_ojo
uo_datastore ads_datos
nvo_generic_ole_object loo_Mailman , loo_Email

ads_datos=create uo_datastore
ads_datos.dataobject='nom_desprendible'
ads_datos.settransobject(sqlca)
if ads_datos.retrieve(al_nom,as_tdoc,as_doc)<0 then 
	return -1
end if
ads_datos.setitem(1,'cune',as_cune)

ls_ojo=ads_datos.modify('qr_picture.filename="'+as_qrcode+'"')
loo_Mailman = create nvo_generic_ole_object
li_rc = loo_Mailman.ConnectToNewObject("Chilkat_9_5_0.MailMan")
if li_rc < 0 then
    destroy loo_Mailman
    MessageBox("Error","Connecting to COM object failed")
    return -1
end if

select servidor, puerto, usuario, clave
into :is_server_email,: ii_puerto_email,:is_cuenta_email,:is_clave_email
from documentos
where (((coddoc)=:as_docnm) and ((clugar)=:as_lug));

is_nombre_lugar=ads_datos.getitemstring(1,'razonsocialem')
is_clave_email=f_descripta_new(is_clave_email,'1')

// Set the SMTP server.
loo_Mailman.SmtpHost = is_server_email// "smtp.gmail.com"

loo_Mailman.SmtpUsername = is_cuenta_email//"mySmtpLogin"
loo_Mailman.SmtpPassword = is_clave_email//"myPassword"

loo_Mailman.SmtpSsl = 1
loo_Mailman.SmtpPort = ii_puerto_email

// Create a new email object
loo_Email = create nvo_generic_ole_object
li_rc = loo_Email.ConnectToNewObject("Chilkat_9_5_0.Email")

loo_Email.Subject = "Nomina Electrónica ("+is_nombre_lugar+')'
loo_Email.Body = "Estimado Funcionario:~r~n~r~nAdjunto encontrarás el documento correspondiente a la nomina electronica emitida por "+is_nombre_lugar+".~r~n~r~nFeliz día."
loo_Email.From = is_nombre_lugar+" <"+is_cuenta_email+">"
li_Success = loo_Email.AddTo(is_nombre_lugar,ads_datos.getitemstring(1,"email"))


//guardar factura como pdf y adicionarla al .zip
li_rc=ads_datos.saveas(is_ruta_facturas+as_filename+".pdf",PDF!,false)
if li_rc<0 then
	 messagebox("Error Enviando Correo of_enviar_correo","No se pudo exportar la factura como PDF!!!")
    destroy loo_Mailman
    destroy loo_Email
    return -1
end if

if of_zip(is_ruta_facturas+as_zipname , is_ruta_facturas+as_filename+'.pdf','a')=-1 then
	 destroy loo_Mailman
    destroy loo_Email
    return -1
end if

loo_Email.AddFileAttachment(is_ruta_facturas+as_zipname)

//li_Success = loo_Mailman.SendEmail(loo_Email)
if li_Success <> 1 then
    messagebox("Error Enviando Correo of_enviar_correo",string( loo_Mailman.LastErrorText))
    destroy loo_Mailman
    destroy loo_Email
    return -1
end if

li_Success = loo_Mailman.CloseSmtpConnection()
if li_Success <> 1 then
    messagebox("Error cerrando conexion a correo", "Connection to SMTP server not closed cleanly.")
end if

destroy loo_Mailman
destroy loo_Email

return 1
end function

on nvo_nom_electronica.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_nom_electronica.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

