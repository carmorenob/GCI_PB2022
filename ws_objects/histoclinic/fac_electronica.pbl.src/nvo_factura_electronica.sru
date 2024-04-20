$PBExportHeader$nvo_factura_electronica.sru
forward
global type nvo_factura_electronica from nonvisualobject
end type
end forward

global type nvo_factura_electronica from nonvisualobject
end type
global nvo_factura_electronica nvo_factura_electronica

type variables
Integer  ii_puerto_email
string is_clave_firma,is_ruta_firma,is_ruta_facturas='' , is_cuenta_email , is_cuenta_email1
string is_server_email, is_clave_email,is_nombre_lugar//ruta en donde se guardan los zips y los pdf's
string is_ssl, is_tls
end variables

forward prototypes
public function longlong hex_to_dec (string as_hexadecimal)
public function string of_connecterror (integer ai_returncode)
protected function integer of_desbloquear_chilkat ()
public function integer of_zip (string as_zipname, string as_filename, string as_new_or_add)
public function integer of_leer_certificado (ref nvo_generic_ole_object aoo_cert)
public function integer of_validar_campos (uo_datawindow adw_factura)
public function integer of_firmar_xml (ref uo_datawindow adw_factura, ref nvo_generic_ole_object aoo_cert, ref nvo_generic_ole_object aoo_sbxml, string as_tipo)
public function long of_consecutivos_fact_elect (string as_coddoc, string as_tipo_ambiente, string as_tipo, integer ai_anyo)
public function integer of_soap_xml_firmado (ref nvo_generic_ole_object aoo_sbxmlsoap, string as_zipname, ref nvo_generic_ole_object aoo_cert, integer ai_metodo, string as_testp)
public function integer of_actu_consecs_files_fact_elect (string coddoc, string as_tipo_ambiente, string as_tipo, integer ai_anyo, long al_nactual, string as_coddoc)
public function st_retorno_gral of_html_request (string as_mesage_soap, string as_filename, string as_ambiente)
public function integer of_firmar_xml_attached (ref uo_datastore ads_attached_plantilla, ref nvo_generic_ole_object aoo_cert, ref nvo_generic_ole_object aoo_sbxml)
public function st_ret_dian sign_chilkat (ref uo_datawindow adw_factura, decimal al_nro_fact, string as_clug_factura, string as_tipofac, integer as_nnota, string as_tipo_docu, string as_coddoc)
public function integer of_actu_estado_factura (decimal al_nfact, string as_clug_fact, string as_tipofac, integer as_nnota, string as_estado, string as_filename_fact, string as_filename_zip, string as_track_id, string as_tipo, string as_coddoc, string as_cufe)
public function integer of_estado_factura_dian (decimal al_nfact, string as_clug_fact, string as_tipofac, integer as_nnota, string as_estado, string as_tipo, string as_coddoc)
private function integer of_enviar_correo (ref datawindow ads_datos, decimal ad_nfact, string as_lug, string as_tipofac, integer as_nnota, string as_tipo, string as_docnm, string as_qrcode, string as_cufe, string as_small_cufe, string as_zipname, string as_filename, string as_xml_factura, string as_xml_retorno, ref nvo_generic_ole_object aoo_cert)
public function integer of_enviar_new_correo (decimal adc_nro_factura, string as_clug_factura, string as_tipofac, integer as_nnota, string as_tnota, string as_filename, string as_origen)
public subroutine of_files_names (ref uo_datawindow adw_factura, ref string as_filename, ref string as_zipname, ref decimal al_nro_fact_x_anyo, ref decimal al_nro_zip_x_anyo, ref boolean abn_actu_consec_fact, ref boolean abn_actu_consec_zip, string as_tipo_docu, string as_tipo_ambiente, integer ai_anyo, string as_coddoc, string as_lsdoc)
end prototypes

public function longlong hex_to_dec (string as_hexadecimal);string ls_binario

int j,ll_digito,li_potencia=0
longlong ll_dec=0,ll_suma

li_potencia=len(as_hexadecimal) -1

for j=1 to  len(as_hexadecimal) 
	if not isnumber(mid(as_hexadecimal,j,1)) then
		ll_digito=asc(lower(mid(as_hexadecimal,j,1))) -87
	else
		ll_digito=integer(mid(as_hexadecimal,j,1))
	end if
	ll_suma=ll_digito * (16.0^li_potencia)
	ll_dec+=ll_suma
	li_potencia --
next

return ll_dec
end function

public function string of_connecterror (integer ai_returncode);// ----------------------------------------------------------------------------------------
// SCRIPT:		of_ConnectError
//
// PURPOSE:		This function returns the text of OLE connect errors.
//
// ARGUMENTS:	ai_returncode	-	The value returned by ConnectToNewObject
//
// RETURN:		Error message
//
// DATE			PROG/ID			DESCRIPTION OF CHANGE / REASON
// ----------	-------------	-------------------------------------------------------------
// 11/22/2017	Roland Smith	Initial Creation
// ----------------------------------------------------------------------------------------

String ls_errmsg

choose case ai_returncode
	case 0
		ls_errmsg = "Success"
	case -1
		ls_errmsg = "Invalid Call: the argument is the Object property of a control"
	case -2
		ls_errmsg = "Class name not found"
	case -3
		ls_errmsg = "Object could not be created"
	case -4, 6
		ls_errmsg = "Could not connect to object"
	case -9
		ls_errmsg = "Other error"
	case -15
		ls_errmsg = "COM+ is not loaded on this computer"
	case -16
		ls_errmsg = "Invalid Call: this function not applicable"
	case else
		ls_errmsg = "Undefined return code: " + String(ai_returncode)
end choose

Return ls_errmsg

end function

protected function integer of_desbloquear_chilkat ();nvo_generic_ole_object loo_Glob
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

// In this example, the file we wish to zip is /temp/abc123/HelloWorld123.txt

// Add a reference to a single file by calling AppendOneFileOrDir
// Note: You may use either forward or backward slashes.
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

public function integer of_leer_certificado (ref nvo_generic_ole_object aoo_cert);int li_rc,li_Success

aoo_cert = create nvo_generic_ole_object
li_rc = aoo_Cert.ConnectToNewObject("Chilkat_9_5_0.Cert")
if li_rc < 0 then
    destroy aoo_cert
    MessageBox("Error","Connecting to COM object failed Chilkat_9_5_0.Cert")
    return -1
end if

if is_clave_firma='' then
	is_clave_firma=message.stringparm
	if is_clave_firma='' then 
		return -1
	end if
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
return 1
end function

public function integer of_validar_campos (uo_datawindow adw_factura);if isnull(adw_factura.getitemstring(1,"email_cliente")) or trim(adw_factura.getitemstring(1,"email_cliente"))='' then
	Messagebox("Atención!!","El cliente no tiene configurado el correo electrónico, no se puede enviar esta factura !!!!!" )
	RETURN -1
end if

if isnull(adw_factura.getitemstring(1,"codigo_postal_cliente")) or trim(adw_factura.getitemstring(1,"codigo_postal_cliente"))='' then
	Messagebox("Atención!!","El cliente no tiene configurado su código postal, no se puede enviar esta factura !!!!!" )
	RETURN -1
end if

if isnull(adw_factura.getitemstring(1,"codigo_postal")) or trim(adw_factura.getitemstring(1,"codigo_postal"))='' then
	Messagebox("Atención!!","El FACTURADOR no tiene configurado su código postal, no se puede enviar esta factura !!!!!" )
	RETURN -1
end if

return 1
end function

public function integer of_firmar_xml (ref uo_datawindow adw_factura, ref nvo_generic_ole_object aoo_cert, ref nvo_generic_ole_object aoo_sbxml, string as_tipo);//as_tipo; f:factura , a: anulacion , c: nota credito , d: nota debito , r recibo de caja
int li_success,li_rc
string ls_xml,smallcufe_formated,small_cunex
nvo_generic_ole_object loo_GenFact,loo_Xml, loo_Verifier


small_cunex=adw_factura.getitemstring(1,'small_cufe')
smallcufe_formated=mid(  small_cunex , 1, 8 )+'-'+mid(  small_cunex , 9, 4 )+'-'+mid(  small_cunex , 13, 4 )+'-'+mid(  small_cunex , 17, 4 )+'-'+mid(  small_cunex , 21, 40 )

///////////////////////////////////////////////////////////////
aoo_sbXML = create nvo_generic_ole_object
li_rc = aoo_sbXML.ConnectToNewObject("Chilkat_9_5_0.StringBuilder")
ls_xml=string(adw_factura.describe('DataWindow.Data.XML'))
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
if as_tipo='f' or as_tipo='r' then
	loo_GenFact.SigLocation = "Invoice|ext:UBLExtensions|ext:UBLExtension|ext:ExtensionContent"
elseif as_tipo='a' or as_tipo='c' then
	loo_GenFact.SigLocation = "CreditNote|ext:UBLExtensions|ext:UBLExtension|ext:ExtensionContent"
elseif as_tipo='d' then
	loo_GenFact.SigLocation = "DebitNote|ext:UBLExtensions|ext:UBLExtension|ext:ExtensionContent"
end if
loo_GenFact.SigLocationMod = 0
loo_GenFact.SigId = "xmldsig-"+smallcufe_formated
loo_GenFact.SigNamespacePrefix = "ds"
//https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html#prop20
//loo_GenFact.SignedInfoCanonAlg = "C14N"
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
loo_Xml.AddAttribute("Target","#xmldsig-"+smallcufe_formated)
loo_Xml.UpdateAttrAt("xades:SignedProperties",1,"Id","xmldsig-"+smallcufe_formated+"-signedprops")
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
// Add our 1st eference, which is to the root element of the XML document being signed.
//r3 loo_GenFact.AddSameDocRef("","sha256","EXCL_C14N","","")
loo_GenFact.AddSameDocRef("","sha256","","","")
loo_GenFact.SetRefIdAttr("","xmldsig-"+smallcufe_formated+"-ref0")

// We'll want a KeyInfo that will look like this:

//          <ds:Reference Id="ReferenceKeyInfo" URI="#KeyInfoId-Signature-d1cbfe99-fd8e-4e0f-b0b7-fc5bfe2f1dd0">
//             <ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256" />
//             <ds:DigestValue>hbYK/DyNGpK4HtUQV8xsljxbrTJY4AS0SYOa1oW/FQw=</ds:DigestValue>
//          </ds:Reference>

string ls_KeyInfoId,ls_SignedPropsId

ls_KeyInfoId = "xmldsig-"+smallcufe_formated+"-keyinfo"
loo_GenFact.KeyInfoId = ls_KeyInfoId
//r4 loo_GenFact.AddSameDocRef(ls_KeyInfoId,"sha256","EXCL_C14N","","")
loo_GenFact.AddSameDocRef(ls_KeyInfoId,"sha256","","","")
//loo_Gen.SetRefIdAttr(ls_KeyInfoId,"ReferenceKeyInfo")

// Add a Reference to the SignedProperties.
ls_SignedPropsId = "xmldsig-"+smallcufe_formated+"-signedprops"
//r5 loo_GenFact.AddObjectRef(ls_SignedPropsId,"sha256","EXCL_C14N","","http://uri.etsi.org/01903#SignedProperties")
loo_GenFact.AddObjectRef(ls_SignedPropsId,"sha256","","","http://uri.etsi.org/01903#SignedProperties")

// When the Signature is generated, the Reference to the SignedProperties will look like this:

//          <ds:Reference Type="http://uri.etsi.org/01903#SignedProperties" URI="#SignedProperties-Signature-d1cbfe99-fd8e-4e0f-b0b7-fc5bfe2f1dd0">
//             <ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256" />
//             <ds:DigestValue>GLOA1AWNZhJM9NlK515TJmCE+/EKHlrIQJkkyTPPL4E=</ds:DigestValue>
//          </ds:Reference>

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

public function long of_consecutivos_fact_elect (string as_coddoc, string as_tipo_ambiente, string as_tipo, integer ai_anyo);//as_tipo: f: factura , z: zip ,c:nota credito , d:nota debito
long ll_consec

if as_tipo='c' or as_tipo='d' then
	select count(1) into :ll_consec from PM_CONSEC_FACT_ELECT where tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and coddoc=:as_coddoc; //LAS NOTAS CREDITO Y DEBITO LLEVAN UN SOLO CONSECUTIVO (NO ES POR AÑO)
else
	select count(1) into :ll_consec from PM_CONSEC_FACT_ELECT where tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and anyo=:ai_anyo and coddoc=:as_coddoc;
end if

if sqlca.sqlcode<0 then
	messagebox("Error SQL","Error consultando pm_gral_consec_fact_elect "+sqlca.sqlerrtext)
	return -1
end if

if ll_consec=0 then
	if as_tipo='c' or as_tipo='d' then
		INSERT INTO PM_CONSEC_FACT_ELECT (coddoc,tipo_ambiente,tipo, anyo, consec_actual_x_anyo)
		VALUES (:as_coddoc,:as_tipo_ambiente,:as_tipo, 0 , 0);
	else
		INSERT INTO PM_CONSEC_FACT_ELECT (coddoc,tipo_ambiente,tipo, anyo, consec_actual_x_anyo)
		VALUES (:as_coddoc,:as_tipo_ambiente,:as_tipo, :ai_anyo , 0);
	end if	
	if sqlca.sqlcode<0 then
		messagebox("Error SQL","Error insertando en pm_gral_consec_fact_elect "+sqlca.sqlerrtext)
		return -1
	end if
end if
if as_tipo='c' or as_tipo='d' then
	select consec_actual_x_anyo+1 into :ll_consec from PM_CONSEC_FACT_ELECT where  tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and coddoc=:as_coddoc;
else
	select consec_actual_x_anyo+1 into :ll_consec from PM_CONSEC_FACT_ELECT where  tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and anyo=:ai_anyo and coddoc=:as_coddoc;
end if
if sqlca.sqlcode<0 then
	messagebox("Error SQL","Error consultando PM_CONSEC_FACT_ELECT "+sqlca.sqlerrtext)
	return -1
end if

return ll_consec
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
		loo_XmlToSign.UpdateChildContent("soap:Header|wsa:Action","http://wcf.dian.colombia/IWcfDianCustomerServices/SendBillSync")
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
		loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendBillSync|wcf:fileName",as_zipname)
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
			loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendBillSync|wcf:contentFile",ls_B64)
		elseif ai_metodo=1 then		
			loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendTestSetAsync|wcf:contentFile",ls_B64)
		//	loo_XmlToSign.UpdateChildContent("soap:Body|wcf:SendTestSetAsync|wcf:testSetId","ae8aac6d-fd5f-4e81-aeda-22331301d658")
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

// -----------------------------------------------

// Save the signed XML to a file.
//li_Success = loo_SbXml.WriteFile("d:\signedXml.xml","utf-8",0)

// messagebox("Resultado",string( loo_SbXml.GetAsString()))

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

public function integer of_actu_consecs_files_fact_elect (string coddoc, string as_tipo_ambiente, string as_tipo, integer ai_anyo, long al_nactual, string as_coddoc);//as_tipo: f: factura , z: zip , c: nota credito , d: nota debito
//as_tipo_ambiente: 1:produccion 2:pruebas
if as_tipo='c' or as_tipo='d' then
	update PM_CONSEC_FACT_ELECT set consec_actual_x_anyo=:al_nactual +1 
	where  tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and  consec_actual_x_anyo=:al_nactual and coddoc=:as_coddoc;
else
	if as_tipo='r' then
		update PM_CONSEC_FACT_ELECT set consec_actual_x_anyo=:al_nactual +1 
		where  tipo_ambiente=:as_tipo_ambiente and tipo='f' and anyo=:ai_anyo and consec_actual_x_anyo=:al_nactual and coddoc=:as_coddoc;
	else
		update PM_CONSEC_FACT_ELECT set consec_actual_x_anyo=:al_nactual +1 
		where  tipo_ambiente=:as_tipo_ambiente and tipo=:as_tipo and anyo=:ai_anyo and consec_actual_x_anyo=:al_nactual and coddoc=:as_coddoc;
	end if
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

public function st_retorno_gral of_html_request (string as_mesage_soap, string as_filename, string as_ambiente);string ls_url,ls_ret,ls_data
int li_statusCode,li_rc , li_arch
st_retorno_gral lst_ret 

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
	lst_ret.i_valor=-1
	return lst_ret
end if


li_arch=fileopen(as_filename,textmode!,Write!,Shared!,replace!,EncodingUTF8!)
fileWriteEx(li_arch,ls_data)
fileclose(li_arch)

destroy lo_client
lst_ret.i_valor=1
lst_ret.s_valor=ls_data

return lst_ret
end function

public function integer of_firmar_xml_attached (ref uo_datastore ads_attached_plantilla, ref nvo_generic_ole_object aoo_cert, ref nvo_generic_ole_object aoo_sbxml);//as_tipo; f:factura , a: anulacion , c: nota credito , d: nota debito
int li_success,li_rc
string ls_xml,smallcufe_formated,small_cunex
nvo_generic_ole_object loo_GenFact,loo_Xml, loo_Verifier


small_cunex=ads_attached_plantilla.getitemstring(1,'small_cufe')
smallcufe_formated=mid(  small_cunex , 1, 8 )+'-'+mid(  small_cunex , 9, 4 )+'-'+mid(  small_cunex , 13, 4 )+'-'+mid(  small_cunex , 17, 4 )+'-'+mid(  small_cunex , 21, 40 )

///////////////////////////////////////////////////////////////
aoo_sbXML = create nvo_generic_ole_object
li_rc = aoo_sbXML.ConnectToNewObject("Chilkat_9_5_0.StringBuilder")
ls_xml=string(ads_attached_plantilla.describe('DataWindow.Data.XML'))
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

loo_GenFact.SigLocation = "AttachedDocument|ext:UBLExtensions|ext:UBLExtension|ext:ExtensionContent"

loo_GenFact.SigLocationMod = 0
loo_GenFact.SigId = "xmldsig-"+smallcufe_formated
loo_GenFact.SigNamespacePrefix = "ds"
//https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html#prop20
//loo_GenFact.SignedInfoCanonAlg = "C14N"
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
loo_Xml.AddAttribute("Target","#xmldsig-"+smallcufe_formated)
loo_Xml.UpdateAttrAt("xades:SignedProperties",1,"Id","xmldsig-"+smallcufe_formated+"-signedprops")
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
// Add our 1st eference, which is to the root element of the XML document being signed.
//r3 loo_GenFact.AddSameDocRef("","sha256","EXCL_C14N","","")
loo_GenFact.AddSameDocRef("","sha256","","","")
loo_GenFact.SetRefIdAttr("","xmldsig-"+smallcufe_formated+"-ref0")

// We'll want a KeyInfo that will look like this:

//          <ds:Reference Id="ReferenceKeyInfo" URI="#KeyInfoId-Signature-d1cbfe99-fd8e-4e0f-b0b7-fc5bfe2f1dd0">
//             <ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256" />
//             <ds:DigestValue>hbYK/DyNGpK4HtUQV8xsljxbrTJY4AS0SYOa1oW/FQw=</ds:DigestValue>
//          </ds:Reference>

string ls_KeyInfoId,ls_SignedPropsId

ls_KeyInfoId = "xmldsig-"+smallcufe_formated+"-keyinfo"
loo_GenFact.KeyInfoId = ls_KeyInfoId
//r4 loo_GenFact.AddSameDocRef(ls_KeyInfoId,"sha256","EXCL_C14N","","")
loo_GenFact.AddSameDocRef(ls_KeyInfoId,"sha256","","","")
//loo_Gen.SetRefIdAttr(ls_KeyInfoId,"ReferenceKeyInfo")

// Add a Reference to the SignedProperties.
ls_SignedPropsId = "xmldsig-"+smallcufe_formated+"-signedprops"
//r5 loo_GenFact.AddObjectRef(ls_SignedPropsId,"sha256","EXCL_C14N","","http://uri.etsi.org/01903#SignedProperties")
loo_GenFact.AddObjectRef(ls_SignedPropsId,"sha256","","","http://uri.etsi.org/01903#SignedProperties")

// When the Signature is generated, the Reference to the SignedProperties will look like this:

//          <ds:Reference Type="http://uri.etsi.org/01903#SignedProperties" URI="#SignedProperties-Signature-d1cbfe99-fd8e-4e0f-b0b7-fc5bfe2f1dd0">
//             <ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256" />
//             <ds:DigestValue>GLOA1AWNZhJM9NlK515TJmCE+/EKHlrIQJkkyTPPL4E=</ds:DigestValue>
//          </ds:Reference>

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

string jaer
jaer=string( loo_GenFact.LastErrorText )
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

public function st_ret_dian sign_chilkat (ref uo_datawindow adw_factura, decimal al_nro_fact, string as_clug_factura, string as_tipofac, integer as_nnota, string as_tipo_docu, string as_coddoc);//as_tipo_docu = f:factura de venta ; a: nota credito de anulacion , c:nota credito , d:nota debito

int 		li_rc,						li_ret,						li_res,						li_donde,						li_file
string 	ls_data_qr,				is_ruta_qr='c:\windows\temp\'  
string 	ls_sufijo_campo='',	ls_ojo,					ls_name,					ls_small_cufe,				ls_small_cufex,				ls_sfc,			ls_sfc_384,				ls_testp
string 	ls_coddoc,				ls_retc,					ls_retdes,				ls_xml_ret,					ls_null,							ls_tipo,			ls_tipo_ambiente
string 	ls_prefac,				ls_numfact,				ls_t


st_ret_dian lst_ret_dian
Blob 		lblb_data,				lblb_sha384,			lblb_md5
oleobject loo_Crypt
st_retorno_gral lst_ret_gral

uo_datastore lds_result,lds_xml_reponse
boolean 	lbn_actu_consec_fact=false , lbn_actu_consec_zip=false
Integer 	li_zip_file,			li_Status,				li_anyo  

decimal 	ll_nro_fact_x_anyo ,	ll_nro_zip_x_anyo
nvo_generic_ole_object loo_Cert , loo_SbXml , loo_SbXmlSOAP

CrypterObject lnv_CrypterObject
Coderobject lnv_code

lnv_CrypterObject = Create CrypterObject
Lnv_code = create coderobject

setnull(ls_null)


if as_coddoc='RV' or as_coddoc='RC'  then 
	ls_coddoc='FV'
else
	ls_coddoc=as_coddoc
end if

SELECT cadena into :is_ruta_facturas
FROM parametros_gen
WHERE (((codigo_para)=55));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 55')
	lst_ret_dian.as_estado="-2"
	return lst_ret_dian
end if

if as_tipo_docu='f' or as_tipo_docu='r'  then 
	if adw_factura.retrieve(al_nro_fact,as_clug_factura,as_tipofac)<=0 then 
		messagebox('Atencíon','No se pueden recuperar datos')
		lst_ret_dian.as_estado="-2"
		return lst_ret_dian
	end if
else
	if as_coddoc='RV' then 
		if adw_factura.retrieve(al_nro_fact,as_clug_factura,as_tipofac,as_nnota)<=0 then 
			messagebox('Atencíon','No se pueden recuperar datos')
			lst_ret_dian.as_estado="-2"
			return lst_ret_dian
		end if	
	else
		if adw_factura.retrieve(al_nro_fact,as_clug_factura,as_tipofac)<=0 then 
			messagebox('Atencíon','No se pueden recuperar datos')
			lst_ret_dian.as_estado="-2"
			return lst_ret_dian
		end if
	end if
end if
	
ls_prefac=adw_factura.getitemstring(1,'prefijo')
ls_numfact=string(adw_factura.getitemnumber(1,'nfact'))

is_ruta_facturas=is_ruta_facturas+'\'+ls_prefac+ls_numfact+'\'


If not DirectoryExists ( is_ruta_facturas) Then
	integer li_filenum
	CreateDirectory ( is_ruta_facturas)
	li_filenum = ChangeDirectory( is_ruta_facturas)
end if
	
ls_testp=adw_factura.getitemstring(1,'testp')
is_ruta_firma=adw_factura.getitemstring(1,'ruta_certificado')
is_clave_firma=f_descripta_new(adw_factura.getitemstring(1,'clave_certificado'),'1')
if isnull(is_ruta_firma) or  trim(is_ruta_firma)='' then
	lst_ret_dian.as_estado="-2"
	return lst_ret_dian
end if

//HUELLA
if as_tipo_docu='f' or as_tipo_docu='r'  then 
	ls_sfc= adw_factura.getitemstring(1,'software_id')+f_descripta_new(adw_factura.getitemstring(1,'pin'),'1')+adw_factura.getitemstring(1,'prefijo')+string(adw_factura.getitemnumber(1,'nfact'))
else
	if as_tipo_docu='a' or as_tipo_docu='c'  then 
		if as_coddoc='RV' then 
			ls_sfc= adw_factura.getitemstring(1,'software_id')+f_descripta_new(adw_factura.getitemstring(1,'pin'),'1')+'NC'+adw_factura.getitemstring(1,'prefijo')+string(adw_factura.getitemnumber(1,'nfact'))+string(as_nnota,'00')
		else
			ls_sfc= adw_factura.getitemstring(1,'software_id')+f_descripta_new(adw_factura.getitemstring(1,'pin'),'1')+'NC'+adw_factura.getitemstring(1,'prefijo')+string(adw_factura.getitemnumber(1,'nfact'))+'01'
		end if
	else
		ls_sfc= adw_factura.getitemstring(1,'software_id')+f_descripta_new(adw_factura.getitemstring(1,'pin'),'1')+'ND'+adw_factura.getitemstring(1,'prefijo')+string(adw_factura.getitemnumber(1,'nfact'))+string(as_nnota,'00')		
	end if
end if

ls_sfc_384=f_encripta_sha(ls_sfc,'SHA384')
adw_factura.setitem(1,'huella',ls_sfc_384)

///CUFE
if as_tipo_docu='f' or as_tipo_docu='r' then 
	ls_small_cufe= adw_factura.getitemstring(1,'cufe')+f_descripta_new(adw_factura.getitemstring(1,'clave_tecnica'),'1')+adw_factura.getitemstring(1,'tipo_ambiente')
end if
if as_tipo_docu='a' or as_tipo_docu='c' or as_tipo_docu='d' then 
	ls_small_cufe= adw_factura.getitemstring(1,'cufe')+f_descripta_new(adw_factura.getitemstring(1,'pin'),'1')+adw_factura.getitemstring(1,'tipo_ambiente')
end if

ls_sfc=f_encripta_sha(ls_small_cufe,'SHA384')
adw_factura.setitem(1,'cufe',ls_sfc)

lst_ret_dian.as_cufe=ls_sfc

lblb_sha384=Blob(f_encripta_sha(ls_small_cufe,'SHA384'), EncodingANSI!)
lblb_md5 = lnv_CrypterObject.MD5(lblb_sha384)
ls_small_cufex = lnv_code.hexencode(lblb_MD5)
adw_factura.setitem(1,'small_cufe',ls_small_cufex)
destroy Lnv_code
destroy lnv_CrypterObject 

if isnull(adw_factura.getitemstring(1,'prefijo')) then
	if as_tipo_docu='f' or as_tipo_docu='r' then 	
		ls_data_qr ='NumFact: '+string(adw_factura.getitemnumber(1,'nfact'))+'~r~n'
	else
		if as_tipo_docu='a' or  as_tipo_docu='c'  then 
			if as_coddoc='RV' then 
				ls_data_qr ='NumFact: NC'+string(adw_factura.getitemnumber(1,'nfact'))+string(as_nnota,'00')+'~r~n'
			else
				ls_data_qr ='NumFact: NC'+string(adw_factura.getitemnumber(1,'nfact'))+'01'+'~r~n'
			end if
		else
			ls_data_qr ='NumFact: ND'+string(adw_factura.getitemnumber(1,'nfact'))+string(as_nnota,'00')+'~r~n'
		end if
	end if
else			
	if as_tipo_docu='f' or as_tipo_docu='r' then 		
		ls_data_qr ='NumFact: '+adw_factura.getitemstring(1,'prefijo')+string(adw_factura.getitemnumber(1,'nfact'))+'~r~n'
	else
		if as_tipo_docu='a' or as_tipo_docu='c' then 
			if as_coddoc='RV' then 
				ls_data_qr ='NumFact: NC'+adw_factura.getitemstring(1,'prefijo')+string(adw_factura.getitemnumber(1,'nfact'))+string(as_nnota,'00')+'~r~n'
			else
				ls_data_qr ='NumFact: NC'+adw_factura.getitemstring(1,'prefijo')+string(adw_factura.getitemnumber(1,'nfact'))+'01'+'~r~n'
			end if
		else
			ls_data_qr ='NumFact: ND'+adw_factura.getitemstring(1,'prefijo')+string(adw_factura.getitemnumber(1,'nfact'))+string(as_nnota,'00')+'~r~n'
		end if
	end if
end if

if as_tipo_docu='f' or as_tipo_docu='r' then 		
	ls_data_qr+='FecFac: '+string(adw_factura.getitemdatetime(1,'fecha_factura') ,'yyyy-mm-dd')+'~r~n'		
	ls_data_qr+='HorFac: '+string(adw_factura.getitemdatetime(1,'hora_factura') ,'HH:mm:ss')+'-05:00~r~n'
else
	if as_tipo_docu='a'  or as_tipo_docu='c' then 
		ls_data_qr+='FecFac: '+string(adw_factura.getitemdatetime(1,'fecha_anula') ,'yyyy-mm-dd')+'~r~n'		
		ls_data_qr+='HorFac: '+string(adw_factura.getitemdatetime(1,'fecha_anula') ,'HH:mm:ss')+'-05:00~r~n'
	end if
end if
ls_data_qr+='NitFac: '+adw_factura.getitemSTring(1,'documento') +'~r~n'
ls_data_qr+='DocAdq: '+adw_factura.getitemstring(1,'nit') +'~r~n'
ls_data_qr+='ValFac: '+string(adw_factura.getitemnumber(1,'vtemp') ,'##################.00')+'~r~n'
ls_data_qr+='ValIva: '+string(adw_factura.getitemnumber(1,'vtiva') ,'##################.00')+'~r~n'
ls_data_qr+='ValOtroIm: 0.00~r~n'
ls_data_qr+='ValTolFac: '+string(adw_factura.getitemnumber(1,'vtemp') ,'##################.00')+'~r~n'
ls_data_qr+='CUFE: '+adw_factura.getitemstring(1,'cufe')+'~r~n'
ls_data_qr+='QRCode:https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey='+adw_factura.getitemstring(1,'cufe')

draw_qr_code lqr_code
lqr_code=create draw_qr_code
ls_name=adw_factura.getitemstring(1,'prefijo')+string(adw_factura.getitemnumber(1,'nfact'))
lqr_code.draw_msg(ls_data_qr,"",is_ruta_qr+'qr_'+ls_name+'.bmp')
destroy lqr_code

lst_ret_dian.as_qrcode=is_ruta_qr+'qr_'+ls_name+'.bmp"'
//////////////////////// VALIDAR CAMPOS OBLIGATORIOS
if of_validar_campos(adw_factura)=-1 then
	lst_ret_dian.as_estado="-2"
	return lst_ret_dian
end if


////////////////////   DESBLOQUEAR LIBRERIAS DE CHILKAT
IF of_desbloquear_chilkat()=-1 then
	lst_ret_dian.as_estado="-2"
	 return lst_ret_dian
end if
////////////////////  LEER CERTIFICADO
if of_leer_certificado(loo_Cert)=-1 then
	lst_ret_dian.as_estado="-2"
	 return lst_ret_dian
end if

ls_tipo_ambiente=adw_factura.getitemstring(1,'tipo_ambiente')
li_anyo=year(date(adw_factura.getitemdatetime(1,'fecha_factura')))
if as_tipo_docu='a'  or as_tipo_docu='d'  or as_tipo_docu='c' then 
	if as_coddoc='RV' then 
		ls_sufijo_campo='_nota'
	else
		ls_sufijo_campo='_anul'
	end if
end if
////////////////NOMBRES y consecutivos de los ARCHIVOS
of_files_names(adw_factura , lst_ret_dian.as_filename , lst_ret_dian.as_zipname , ll_nro_fact_x_anyo , ll_nro_zip_x_anyo , lbn_actu_consec_fact , lbn_actu_consec_zip , as_tipo_docu , ls_tipo_ambiente , li_anyo,ls_coddoc,as_coddoc)

if lbn_actu_consec_fact then
	ls_tipo=as_tipo_docu
	if as_tipo_docu='a' then ls_tipo='c' //las anulaciones tambien son una nota credito
	if of_actu_consecs_files_fact_elect(ls_coddoc,ls_tipo_ambiente,ls_tipo,li_anyo,ll_nro_fact_x_anyo -1,ls_coddoc)=-1 then
		lst_ret_dian.as_estado="-2"
		return lst_ret_dian
	end if
end if
if lbn_actu_consec_zip then
	if of_actu_consecs_files_fact_elect(ls_coddoc,ls_tipo_ambiente,'z',li_anyo,ll_nro_zip_x_anyo -1,ls_coddoc)=-1 then
		lst_ret_dian.as_estado="-2"
		return lst_ret_dian
	end if
end if

if lbn_actu_consec_fact or lbn_actu_consec_zip then
	//if of_actu_estado_factura(al_nro_fact,as_clug_factura,as_tipofac,ls_null,lst_ret_dian.as_filename,lst_ret_dian.as_zipname,lst_ret_dian.as_track_id,as_tipo_docu,ls_coddoc,lst_ret_dian.as_cufe)=-1 then 
	if as_coddoc='FV' or as_coddoc='RV' then
		if of_actu_estado_factura(al_nro_fact,as_clug_factura,as_tipofac,as_nnota,ls_null,lst_ret_dian.as_filename,lst_ret_dian.as_zipname,lst_ret_dian.as_track_id,as_tipo_docu,as_coddoc,lst_ret_dian.as_cufe)=-1 then 
			lst_ret_dian.as_estado="-2"
			return lst_ret_dian
		end if
	else
		if of_actu_estado_factura(double(ls_numfact),as_clug_factura,'',0,ls_null,lst_ret_dian.as_filename,lst_ret_dian.as_zipname,lst_ret_dian.as_track_id,as_tipo_docu,as_coddoc,lst_ret_dian.as_cufe)=-1 then 
			lst_ret_dian.as_estado="-2"
			return lst_ret_dian
		end if
		
	end if
end if
		
commit;


lds_result=create uo_datastore

if isnull(adw_factura.getitemstring(1,'estado_dian'+ls_sufijo_campo)) or adw_factura.getitemstring(1,'estado_dian'+ls_sufijo_campo)="-1" then //primer vez que se envía o ya se habia enviado antes pero tuvo errores (cuando tuvo errores se vuelve a enviar todo, solo que se conservan los nombres de archivos anteriores)
    ////////////////////////////////////////////////////// P R I M E R   V E Z    Q U E    S E    E N V Í A ////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////  FIRMAR XML DE LA FACTURA
	IF of_firmar_xml(adw_factura,loo_Cert,loo_SbXml , as_tipo_docu)=-1 then
		lst_ret_dian.as_estado="-2"
		 return lst_ret_dian
	end if
	
	//guarda XML firmado en la ruta de la variable
	li_status=loo_SbXml.WriteFile(is_ruta_facturas+lst_ret_dian.as_filename+'.xml','utf-8',0)	
	if li_status<0 then
		messagebox("Error función sing_chilkat","Error exportando el XML en: "+is_ruta_facturas+lst_ret_dian.as_filename+'.xml')
		lst_ret_dian.as_estado="-2"
		return lst_ret_dian
	end if
	//crear zip con la factura en XML
	if of_zip(is_ruta_facturas+lst_ret_dian.as_zipname , is_ruta_facturas+lst_ret_dian.as_filename+'.xml','n')=-1 then
		lst_ret_dian.as_estado="-2"
		 return lst_ret_dian
	end if
	if ls_tipo_ambiente='2' then //pruebas
		///////////// C R E A R    M E N S A J E   S O A P    F I R M A D O //////////////////////
		//allá se le adiciona el ZIP cifrado en B64 al SOAP a enviar, el metodo 1 es async y el 3 sync
		if of_soap_xml_firmado(loo_SbXmlSOAP,lst_ret_dian.as_zipname,loo_Cert,1,ls_testp)=-1 then
			lst_ret_dian.as_estado="-2"
		 	return lst_ret_dian
		end if

		lds_result.dataobject='dw_retorno_dian_async'
		lst_ret_gral=of_html_request(string( loo_SbXmlSOAP.GetAsString()) , is_ruta_facturas+lst_ret_dian.as_filename+'_test_ret.xml',ls_tipo_ambiente)
		if lst_ret_gral.i_valor=-1 then
			rollback;
			lst_ret_dian.as_estado="-2"
			 return lst_ret_dian
		end if
			
		li_status=lds_result.importFile(XML!,is_ruta_facturas+lst_ret_dian.as_filename+'_test_ret.xml')
		
		if li_status<0 then
			messagebox('Error importando Respuesta','No es posible importar el mensaje de respuesta de la DIAN:~r~n'+is_ruta_facturas+lst_ret_dian.as_filename+'_test_ret.xml')
			lst_ret_dian.as_estado="-2"
			return lst_ret_dian
		end if
		
		if lds_result.getitemstring(lds_result.rowcount(),'message')='Archivo no enviado.' then
			lst_ret_dian.as_estado="-2"
		 	return lst_ret_dian
		end if
		
		lst_ret_dian.as_track_id=lds_result.getitemstring(lds_result.rowcount(),'zipkey')
		
		//if of_actu_estado_factura(al_nro_fact,as_clug_factura,as_tipofac,'0',lst_ret_dian.as_filename,lst_ret_dian.as_zipname,lst_ret_dian.as_track_id,as_tipo_docu,ls_coddoc,lst_ret_dian.as_cufe)=-1 then 
		if of_actu_estado_factura(al_nro_fact,as_clug_factura,as_tipofac,as_nnota,ls_null,lst_ret_dian.as_filename,lst_ret_dian.as_zipname,lst_ret_dian.as_track_id,as_tipo_docu,as_coddoc,lst_ret_dian.as_cufe)=-1 then 
			lst_ret_dian.as_estado="-2"
		 	return lst_ret_dian
		end if
		
			
	else //1:produccion
		//allá se le adiciona el ZIP cifrado en B64 al SOAP a enviar, el metodo 1 es async y el 3 sync
		if of_soap_xml_firmado(loo_SbXmlSOAP,lst_ret_dian.as_zipname,loo_Cert,3,ls_testp)=-1 then
			lst_ret_dian.as_estado="-2"
		 	return lst_ret_dian
		end if
		lds_result.dataobject='dw_retornos_dian'
		lst_ret_gral=of_html_request(string( loo_SbXmlSOAP.GetAsString()) , is_ruta_facturas+lst_ret_dian.as_filename+'_test_ret.xml',ls_tipo_ambiente)
		if lst_ret_gral.i_valor=-1 then
			rollback;
			lst_ret_dian.as_estado="-2"
			 return lst_ret_dian
		end if
		li_status=lds_result.importFile(XML!,is_ruta_facturas+lst_ret_dian.as_filename+'_test_ret.xml')
		if li_status<0 then
			messagebox('Error importando Respuesta','No es posible importar el mensaje de respuesta de la DIAN:~r~n'+is_ruta_facturas+lst_ret_dian.as_filename+'_sync_ret.xml')
			lst_ret_dian.as_estado="-2"
			return lst_ret_dian
		end if	
		if lds_result.getitemstring(lds_result.rowcount(),'StatusCode')='99' then
			lst_ret_dian.as_estado="-2"
		 	return lst_ret_dian
		end if
		
		if lds_result.getitemstring(lds_result.rowcount(),'statuscode')='00' then //validada OK		
			
			if of_estado_factura_dian(al_nro_fact,as_clug_factura,as_tipofac,as_nnota,'1',as_tipo_docu,as_coddoc)=-1 then
				lst_ret_dian.as_estado="-2"
				return lst_ret_dian
			end if

			oleobject loo_Bd
			loo_Bd = create oleobject
			li_status= loo_Bd.ConnectToNewObject("Chilkat_9_5_0.BinData")
			if li_status < 0 then
				 destroy loo_Bd
				 MessageBox("Error","Connecting to COM object failed")
				lst_ret_dian.as_estado="-2"
				return lst_ret_dian
			end if
			li_status= loo_Bd.AppendEncoded(lds_result.getitemstring(lds_result.rowcount(),'xmlbase64'),"base64")
			ls_xml_ret = loo_Bd.GetString("utf-8")
			
		else //con errores
			if of_estado_factura_dian(al_nro_fact,as_clug_factura,as_tipofac,as_nnota,'-1', as_tipo_docu,as_coddoc)=-1 then
				lst_ret_dian.as_estado="-2"
				return lst_ret_dian
			end if
			
			commit;
			messagebox("Atención!!","La validación del documento resultó con errores, por favor revise el archivo de retorno para corregirlos (" + is_ruta_facturas+lst_ret_dian.as_filename+'_zipStatus_ret.xml)')
			lst_ret_dian.as_estado="-1"
			return lst_ret_dian
		end if
		commit;
	end if	 //produccion
	lst_ret_dian.as_estado="0"	
elseif adw_factura.getitemstring(1,'estado_dian'+ls_sufijo_campo)='0' then //ya se habia enviado y debe validar que pasó con el primer envío
	/////////////////////////////////////////////// Y A    S E   H A B Í A    E N V I A D O    Y    H A Y    Q U E   V A L I D A R    Q U E    P A S Ó///////////////////////////////////////////////////////////////
	
	///////////// C R E A R    M E N S A J E   S O A P    F I R M A D O //////////////////////
	if of_soap_xml_firmado(loo_SbXmlSOAP,adw_factura.getitemstring(1,'track_id'+ls_sufijo_campo),loo_Cert,2,ls_testp)=-1 then
		lst_ret_dian.as_estado="-2"
		return lst_ret_dian
	end if
		
	lds_result.dataobject='dw_retorno_dian_status_zip'
	lst_ret_gral=of_html_request(string( loo_SbXmlSOAP.GetAsString()) , is_ruta_facturas+lst_ret_dian.as_filename+'_zipStatus_ret.xml',ls_tipo_ambiente)
	if lst_ret_gral.i_valor=-1 then
		rollback;
		lst_ret_dian.as_estado="-2"
		return lst_ret_dian
	end if
		
	li_status=lds_result.importFile(XML!, is_ruta_facturas+lst_ret_dian.as_filename+'_zipStatus_ret.xml' )
	
	if li_status<0 then
		messagebox('Error importando Respuesta','No es posible importar el mensaje de respuesta de la DIAN:~r~n'+ is_ruta_facturas+lst_ret_dian.as_filename+'_zipStatus_ret.xml')
		lst_ret_dian.as_estado="-2"
		return lst_ret_dian
	end if
	
	//validada OK	
	if lds_result.getitemstring(lds_result.rowcount(),'statuscode')='00' then
		
		if of_estado_factura_dian(al_nro_fact,as_clug_factura,as_tipofac,as_nnota,'1',as_tipo_docu,as_coddoc)=-1 then
			lst_ret_dian.as_estado="-2"
		 	return lst_ret_dian
		end if
	else //con errores
		
		if of_estado_factura_dian(al_nro_fact,as_clug_factura,as_tipofac,as_nnota,'-1', as_tipo_docu,as_coddoc )=-1 then
			lst_ret_dian.as_estado="-2"
		 	return lst_ret_dian
		end if
		commit;		
		messagebox("Atención!!","La validación del documento resultó con errores, por favor revise el archivo de retorno para corregirlos (" + is_ruta_facturas+lst_ret_dian.as_filename+'_zipStatus_ret.xml)')	
		lst_ret_dian.as_estado="-1"
		return lst_ret_dian
	end if
	commit;
end if

///********************GENERA JSON SOLO EVENTO***************

if (as_tipo_docu='f' and as_coddoc='FV')  then 
	nvo_rips_json u_rips
	u_rips=create nvo_rips_json
	u_rips.emite_json_evento(al_nro_fact,as_clug_factura,as_tipofac,as_tipo_docu,as_coddoc,is_ruta_facturas+ls_prefac+ls_numfact+'.json')
	destroy 	u_rips
end if
//// **********************E N V I A R    C O R R E O    **********************************
if of_enviar_correo(adw_factura,al_nro_fact,as_clug_factura,as_tipofac,as_nnota,as_tipo_docu,as_coddoc,lst_ret_dian.as_qrcode,lst_ret_dian.as_cufe,ls_small_cufex,lst_ret_dian.as_zipname,lst_ret_dian.as_filename,string(loo_SbXml.GetAsString()),ls_xml_ret,loo_Cert)=-1 then 
//if of_enviar_correo(adw_factura,al_nro_fact,as_clug_factura,as_tipofac,as_tipo_docu,as_coddoc,lst_ret_dian.as_qrcode,lst_ret_dian.as_cufe,small_cufex,lst_ret_dian.as_zipname,lst_ret_dian.as_filename,string(loo_SbXml.GetAsString()),lst_ret_gral.s_valor,loo_Cert)=-1 then
	lst_ret_dian.as_estado="-2"
	return lst_ret_dian
end if

destroy loo_Cert
destroy loo_SbXmlSOAP  
destroy loo_SbXml
destroy loo_Bd
messagebox("Atención", "Factura firmada y envida con éxito !!")

lst_ret_dian.as_estado="1"
return lst_ret_dian
end function

public function integer of_actu_estado_factura (decimal al_nfact, string as_clug_fact, string as_tipofac, integer as_nnota, string as_estado, string as_filename_fact, string as_filename_zip, string as_track_id, string as_tipo, string as_coddoc, string as_cufe);//as_tipo; f:factura , a:anulacion , c:nota credito, d:nota debito
//as_estado; 1:validada OK , -1 con errores , 0 enviada sin validar
/*siempre deben venir los nombres de archivo por si se utilizó 
el metodo sincrónico (porque entonces debe poner esos nombres de archivos 
pa no volverlos a generar y/o utilizar)*/

if as_filename_fact="" or isnull(as_filename_fact) or as_filename_zip="" or isnull(as_filename_zip) then
	messagebox("Atención","Función of_actu_estado_factura, el nombre del ZIP y/o del XML de la factura no pueden ser nulos")
	return -1
end if

if as_estado="0" and (as_track_id="" or isnull(as_track_id)) then
	messagebox("Atención","Función of_actu_estado_factura, el track_id de la factura no puede ser nulo")
	return -1
end if

if as_tipo='f' then
	if as_coddoc='FV' then
		choose case as_estado
			case "1"
				update factcab  set 
					estado_dian=:as_estado , file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip,cufe_dian=:as_cufe
				where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case "0"
				update factcab  set
					estado_dian=:as_estado , file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip , track_id=:as_track_id,cufe_dian=:as_cufe
				where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case "-1"
				update factcab  set 
					estado_dian=:as_estado ,   file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip,cufe_dian=:as_cufe
				where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case else
				update factcab  set 
					estado_dian=:as_estado , file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip,cufe_dian=:as_cufe
				where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
		end choose
	else
		choose case as_estado
			case "1"
				update ripsradica set 
					estado_dian=:as_estado , file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip,cufe_dian=:as_cufe
				where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case "0"
				update ripsradica set
					estado_dian=:as_estado , file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip , track_id=:as_track_id,cufe_dian=:as_cufe
				where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case "-1"
				update ripsradica set 
					estado_dian=:as_estado ,   file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip,cufe_dian=:as_cufe
				where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case else
				update ripsradica set 
					estado_dian=:as_estado , file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip,cufe_dian=:as_cufe
				where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
		end choose				
	end if
else
	if as_tipo='a' then
		if as_coddoc='FV' then
			choose case as_estado
				case "1"
					update factcab  set 
						estado_dian_anul=:as_estado , file_name_fact_anul =:as_filename_fact , file_name_zip_anul =:as_filename_zip,cufe_dian_anul=:as_cufe
					where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
				case "0"
					update factcab  set
						estado_dian_anul=:as_estado , file_name_fact_anul =:as_filename_fact , file_name_zip_anul =:as_filename_zip , track_id_anul=:as_track_id,cufe_dian_anul=:as_cufe
					where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
				case "-1"
					update factcab  set 
						estado_dian_anul=:as_estado ,   file_name_fact_anul =:as_filename_fact , file_name_zip_anul =:as_filename_zip,cufe_dian_anul=:as_cufe
					where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
				case else
					update factcab  set 
						estado_dian_anul=:as_estado , file_name_fact_anul =:as_filename_fact , file_name_zip_anul =:as_filename_zip,cufe_dian_anul=:as_cufe
					where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			end choose
		else
			if as_coddoc='RC' then	
				choose case as_estado
					case "1"
						update tesorecacab_notas set 
							estado_dian_nota=:as_estado , file_name_nota =:as_filename_fact , file_name_zip_nota =:as_filename_zip ,cufe_dian_nota=:as_cufe
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case "0"
						update tesorecacab_notas set
							estado_dian_nota=:as_estado , file_name_nota =:as_filename_fact , file_name_zip_nota=:as_filename_zip , track_id_nota=:as_track_id,cufe_dian_anul=:as_cufe
						where nrcaj=:al_nfact and clugar=:as_clug_fact and nro_nota=:as_nnota; 
					case "-1"
						update tesorecacab_notas set 
							estado_dian_nota=:as_estado ,   file_name_nota =:as_filename_fact , file_name_zip_nota=:as_filename_zip,cufe_dian_nota=:as_cufe
						where nrcaj=:al_nfact and clugar=:as_clug_fact and nro_nota=:as_nnota; 
					case else
						update tesorecacab_notas set 
							estado_dian_nota=:as_estado , file_name_nota =:as_filename_fact , file_name_zip_nota =:as_filename_zip ,cufe_dian_nota=:as_cufe
						where nrcaj=:al_nfact and clugar=:as_clug_fact and nro_nota=:as_nnota; 
				end choose	
			else
				choose case as_estado
					case "1"
						update ripsradica_notas set 
							estado_dian_nota=:as_estado , file_name_nota =:as_filename_fact , file_name_zip_nota =:as_filename_zip ,cufe_dian_nota=:as_cufe
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case "0"
						update ripsradica_notas set
							estado_dian_nota=:as_estado , file_name_nota =:as_filename_fact , file_name_zip_nota=:as_filename_zip , track_id_nota=:as_track_id,cufe_dian_nota=:as_cufe
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case "-1"
						update ripsradica_notas set 
							estado_dian_nota=:as_estado ,   file_name_nota =:as_filename_fact , file_name_zip_nota=:as_filename_zip,cufe_dian_nota=:as_cufe
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case else
						update ripsradica_notas set 
							estado_dian_nota=:as_estado , file_name_nota =:as_filename_fact , file_name_zip_nota =:as_filename_zip ,cufe_dian_nota=:as_cufe
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
				end choose		
			end if
		end if
	else
		if as_tipo='c' or as_tipo='d' then
			if as_coddoc='FV' then	
				choose case as_estado
					case "1"
						update factcab_notas set 
							estado_dian=:as_estado , file_name_anul =:as_filename_fact , file_name_zip =:as_filename_zip 
						where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:al_nfact; 
					case "0"
						update factcab_notas set
							estado_dian=:as_estado , file_name_anul =:as_filename_fact , file_name_zip =:as_filename_zip , track_id=:as_track_id
						where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:al_nfact; 
					case "-1"
						update factcab_notas set 
							estado_dian=:as_estado ,   file_name_anul =:as_filename_fact , file_name_zip =:as_filename_zip
						where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:al_nfact; 
					case else
						update factcab_notas set 
							estado_dian=:as_estado , file_name_anul =:as_filename_fact , file_name_zip =:as_filename_zip 
						where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:al_nfact; 
				end choose
			else
				choose case as_estado
					case "1"
						update ripsradica_notas set 
							estado_dian_nota=:as_estado , file_name_notal =:as_filename_fact , file_name_zip_nota =:as_filename_zip ,cufe_dian_nota=:as_cufe
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case "0"
						update ripsradica_notas set
							estado_dian_nota=:as_estado , file_name_nota =:as_filename_fact , file_name_zip_nota=:as_filename_zip , track_id_nota=:as_track_id,cufe_dian_nota=:as_cufe
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case "-1"
						update ripsradica_notas set 
							estado_dian_nota=:as_estado ,   file_name_nota =:as_filename_fact , file_name_zip_nota =:as_filename_zip,cufe_dian_nota=:as_cufe
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case else
						update ripsradica_notas set 
							estado_dian_nota=:as_estado , file_name_nota =:as_filename_fact , file_name_zip_nota =:as_filename_zip ,cufe_dian_nota=:as_cufe
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
				end choose
			end if
		else
			if as_tipo='r' then
				if as_coddoc='RC' then	
					choose case as_estado
						case "1"
							update tesorecajcab  set 
								estado_dian=:as_estado , file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip,cufe_dian=:as_cufe
							where nrcaj=:al_nfact and clugar=:as_clug_fact ; 
						case "0"
							update tesorecajcab  set
								estado_dian=:as_estado , file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip , track_id=:as_track_id,cufe_dian=:as_cufe
							where nrcaj=:al_nfact and clugar=:as_clug_fact; 
						case "-1"
							update tesorecajcab  set 
								estado_dian=:as_estado ,   file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip,cufe_dian=:as_cufe
							where nrcaj=:al_nfact and clugar=:as_clug_fact; 
						case else
							update tesorecajcab  set 
								estado_dian=:as_estado , file_name_fact =:as_filename_fact , file_name_zip =:as_filename_zip,cufe_dian=:as_cufe
							where nrcaj=:al_nfact and clugar=:as_clug_fact; 
					end choose
				end if
			end if // tipo r
		end if // tipo c o d
	end if //tipo a
end if  // tipo f

if sqlca.sqlcode<0 then
	gs_error=sqlca.sqlerrtext
	rollback;
	messagebox("Error de SQL of_actu_estado_factura","Error actualizando ripsradica/factcab: "+gs_error)
	return -1
end if
return 1
end function

public function integer of_estado_factura_dian (decimal al_nfact, string as_clug_fact, string as_tipofac, integer as_nnota, string as_estado, string as_tipo, string as_coddoc);//as_tipo; f:factura , a:anulacion , c:nota credito, d:nota debito , r:recibo
//as_estado; 1:validada OK , -1 con errores , 0 enviada sin validar
//siempre deben venir los nombres de archivo por si se utilizó el metodo sincrónico (porque entonces debe poner esos nombres de archivos pa no volverlos a generar y/o utilizar)
if as_tipo='f' then
	if as_coddoc='FV' then
		choose case as_estado
			case "1"
				update factcab  set 
					estado_dian=:as_estado 
				where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case "0"
				update factcab  set
					estado_dian=:as_estado 
				where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case "-1"
				update factcab  set 
					estado_dian=:as_estado 
				where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
		end choose
	else
		choose case as_estado
			case "1"
				update ripsradica set 
					estado_dian=:as_estado 
				where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case "0"
				update ripsradica set
					estado_dian=:as_estado
				where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			case "-1"
				update ripsradica set 
					estado_dian=:as_estado 
				where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
		end choose				
	end if
else //Tipo F
	if as_tipo='a' then
		if as_coddoc='FV' then
			choose case as_estado
				case "1"
					update factcab  set 
						estado_dian_anul=:as_estado 
					where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
				case "0"
					update factcab  set
						estado_dian_anul=:as_estado 
					where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
				case "-1"
					update factcab  set 
						estado_dian_anul=:as_estado 
					where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac; 
			end choose
		else // as DOC FV
			if as_coddoc='RC' then
				choose case as_estado
					case "1"
						update tesorescajcab_notas set 
							estado_dian_anul=:as_estado
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case "0"
						update ripsradica_notas set
							estado_dian_anul=:as_estado
						where nrcaj=:al_nfact and clugar=:as_clug_fact and nro_nota=:as_nnota; 
					case "-1"
						update tesorescajcab_notas set 
							estado_dian_anul=:as_estado 
						where nrcaj=:al_nfact and clugar=:as_clug_fact and nro_nota=:as_nnota; 
				end choose		
			else
				choose case as_estado
					case "1"
						update ripsradica_notas set 
							estado_dian_nota=:as_estado
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case "0"
						update ripsradica_notas set
							estado_dian_nota=:as_estado
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					case "-1"
						update ripsradica_notas set 
							estado_dian_nota=:as_estado 
						where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
				end choose		
			end if
		end if
	else //tipo a
		if as_tipo='c' or as_tipo='d' then
			if as_coddoc='FV' then	
				choose case as_estado
					case "1"
						update factcab_notas set 
							estado_dian=:as_estado
						where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:al_nfact; 
					case "0"
						update factcab_notas set
							estado_dian=:as_estado 
						where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:al_nfact; 
					case "-1"
						update factcab_notas set 
							estado_dian=:as_estado
						where nfact=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:al_nfact; 
				end choose
			else
				if as_coddoc='RC' then
					choose case as_estado
						case "1"
							update tesorescajcab_notas set 
								estado_dian_nota=:as_estado 
							where nrcaj=:al_nfact and clugar=:as_clug_fact and nro_nota=:as_nnota; 
						case "0"
							update tesorescajcab_notas set
								estado_dian_nota=:as_estado 
							where nrcaj=:al_nfact and clugar=:as_clug_fact and nro_nota=:as_nnota; 
						case "-1"
							update tesorescajcab_notas set 
								estado_dian_nota=:as_estado 
							where nrcaj=:al_nfact and clugar=:as_clug_fact and nro_nota=:as_nnota; 
					end choose
				else
					choose case as_estado
						case "1"
							update ripsradica_notas set 
								estado_dian_nota=:as_estado 
							where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
						case "0"
							update ripsradica_notas set
								estado_dian_nota=:as_estado 
							where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
						case "-1"
							update ripsradica_notas set 
								estado_dian_nota=:as_estado 
							where num_radicacion=:al_nfact and clugar=:as_clug_fact and tipo=:as_tipofac and nro_nota=:as_nnota; 
					end choose
				end if
			end if
		end if //as tipoc c
	end if // as tipo a
end if // as tipo F

if sqlca.sqlcode<0 then
	gs_error=sqlca.sqlerrtext
	rollback;
	messagebox("Error de SQL of_actu_estado_factura","Error actualizando ripsradica/factcab: "+gs_error)
	return -1
end if
return 1
end function

private function integer of_enviar_correo (ref datawindow ads_datos, decimal ad_nfact, string as_lug, string as_tipofac, integer as_nnota, string as_tipo, string as_docnm, string as_qrcode, string as_cufe, string as_small_cufe, string as_zipname, string as_filename, string as_xml_factura, string as_xml_retorno, ref nvo_generic_ole_object aoo_cert);int li_rc , li_Success
string ls_ojo,ls_cpo,ls_asun
nvo_generic_ole_object loo_Mailman , loo_Email
uo_datastore lds_attached_doc

if as_docnm='FV' then
	if as_tipo='f' then
		if f_lee_rep_dw(as_docnm,as_lug,'Factura',ads_datos)=-1 then return -1
	else
		if as_tipo='c' or as_tipo='a' and as_docnm='FV' then 
			if f_lee_rep_dw(as_docnm,as_lug,'Factura',ads_datos)=-1 then return -1
		else
			if as_tipo='d' and as_docnm='FV' then
				if f_lee_rep_dw(as_docnm,as_lug,'Factura',ads_datos)=-1 then return -1
			end if
		end if
	end if

	if ads_datos.retrieve(ad_nfact,'1',as_lug,as_tipofac)<0 then 
		return -1
	end if
end if

if as_docnm='RV'  then 
	if  as_tipo='c' or as_tipo='a' then
		if g_motor='postgres' then
			ads_datos.dataobject='asis_int_electronica_cap_ncre'
		else
			ads_datos.dataobject='dw_factura_electronica_cap_sql' 
		end if	
	end if
	
	if  as_tipo='d'  then 	
		if g_motor='postgres' then
			ads_datos.dataobject='asis_int_electronica_cap_ndeb'
		else
			ads_datos.dataobject='dw_factura_electronica_cap_sql' 
		end if			
	end if
	
	if  as_tipo='c' or as_tipo='a'  or as_tipo='d'  then 
		ads_datos.settransobject(sqlca)		
		if ads_datos.retrieve(ad_nfact,as_lug,as_tipofac,as_nnota)<0 then 
			return -1
		end if
	else
		if ads_datos.retrieve(ad_nfact,as_lug,as_tipofac)<0 then 
			return -1
		end if
	end if
end if

ls_ojo=ads_datos.modify('qr_picture.filename="'+as_qrcode+'"')
loo_Mailman = create nvo_generic_ole_object
li_rc = loo_Mailman.ConnectToNewObject("Chilkat_9_5_0.MailMan")
if li_rc < 0 then
    destroy loo_Mailman
    MessageBox("Error","Connecting to COM object failed")
    return -1
end if

select servidor, puerto, usuario, clave,autentica,conexion,usuario_adc
into :is_server_email,:ii_puerto_email,:is_cuenta_email,:is_clave_email,:is_ssl, :is_tls,:is_cuenta_email1
from documentos
where (((coddoc)=:as_docnm) and ((clugar)=:as_lug));

if isnull(is_server_email) or isnull(is_cuenta_email)  or isnull(is_clave_email) then
    MessageBox("Error","No hay servidor de documento configurado")
    return -1
end if

is_nombre_lugar=ads_datos.getitemstring(1,'ips_nombre')
is_clave_email=f_descripta_new(is_clave_email,'1')
loo_Mailman = create nvo_generic_ole_object
li_rc = loo_Mailman.ConnectToNewObject("Chilkat_9_5_0.MailMan")
if li_rc < 0 then
    destroy loo_Mailman
    MessageBox("Error","Connecting to COM object failed")
    return -1
end if

// Set the SMTP server.
loo_Mailman.SmtpHost = is_server_email// "smtp.gmail.com"

loo_Mailman.SmtpUsername = is_cuenta_email//"mySmtpLogin"
loo_Mailman.SmtpPassword = is_clave_email//"myPassword"
loo_Mailman.SmtpPort = ii_puerto_email
loo_Mailman.SmtpSsl = 1

// Create a new email object
loo_Email = create nvo_generic_ole_object
li_rc = loo_Email.ConnectToNewObject("Chilkat_9_5_0.Email")

ls_asun=ads_datos.getitemstring(1,"ips_nit")+';'+is_nombre_lugar+';'+ads_datos.getitemstring(1,"ls_numfact")+';'
if as_tipo='f' then
	ls_asun+='01'
end if
if as_tipo='a' then
	ls_asun+= '91'
end if
ls_asun+=';'+is_nombre_lugar
loo_Email.Subject = ls_asun


ls_cpo="Señores:~r~n"+ads_datos.getitemstring(1,"razon_social")+"~r~n"
ls_cpo+="NIT/CC"+ads_datos.getitemstring(1,"ls_nit")+"~r~n~r~n"
if as_tipo='f' then
	ls_cpo+="Les informamos ha recibido un documento de Factura Electronica de venta emitida por "+is_nombre_lugar
end if
if as_tipo='a' then
	ls_cpo= "Les informamos ha recibido un documento Nota Credito factura de venta emitida por "+is_nombre_lugar+".~r~n~r~nFeliz día."
end if
ls_cpo+=" Numero de documento "+ads_datos.getitemstring(1,"ls_numfact")+"~r~n~r~n"

if as_tipo='f' then
	ls_cpo+= "Fecha de Emisión "+string(ads_datos.getitemdatetime(1,"fecha_factura"),'yyyy-mm-dd')+"~r~n~r~n"
	if ads_datos.getitemnumber(1,'vtemp')<>0 then
		ls_cpo+= "Valor "+string(ads_datos.getitemnumber(1,'vtemp'),"##,##0.00")+"~r~n~r~n"
	else
		if ads_datos.getitemnumber(1,'vtproced')<>0 then
			ls_cpo+= "Valor "+string(ads_datos.getitemnumber(1,'vtproced'),"##,##0.00")+"~r~n~r~n"
		end if
	end if
end if
ls_cpo+='-----------------------------------------------------------------------------------'+"~r~n~r~n"
ls_cpo+='Este es un sistema automático de aviso, por favor no responda este mensaje'+"~r~n~r~n"
ls_cpo+='-----------------------------------------------------------------------------------'+"~r~n~r~n"
loo_Email.Body =ls_cpo

loo_Email.From = is_nombre_lugar+" <"+is_cuenta_email+">"
li_Success = loo_Email.AddTo(ads_datos.getitemstring(1,"razon_social"),ads_datos.getitemstring(1,"email_cliente"))
if not isnull(is_cuenta_email1) then
	li_Success = loo_Email.AddTo('Copia',is_cuenta_email1)
end if
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

lds_attached_doc =create uo_datastore
if as_docnm='FV' then
	lds_attached_doc.dataobject='dw_attached_document'
else
	lds_attached_doc.dataobject='dw_attached_document_capita'
end if
lds_attached_doc.settransobject(sqlca)
if lds_attached_doc.retrieve(ad_nfact,as_lug,as_tipofac)<0 then
	messagebox("Error en retrieve de lds_attached_doc: ",sqlca.sqlerrtext)
    destroy loo_Mailman
    destroy loo_Email
    return -1
end if
lds_attached_doc.setitem(1,'cufe',as_cufe)
lds_attached_doc.setitem(1,'small_cufe',as_small_cufe)
lds_attached_doc.setItem(1,'xml_invoice',as_xml_factura)

lds_attached_doc.setItem(1,'xml_response',as_xml_retorno)

nvo_generic_ole_object loo_SbXml

IF of_firmar_xml_attached(lds_attached_doc,aoo_Cert,loo_SbXml )=-1 then
	 return -2
end if
loo_SbXml.WriteFile(is_ruta_facturas+"ad"+mid(as_filename,3)+'.xml','utf-8',0)

nvo_generic_ole_object loo_zip
int li_SaveExtraPath

loo_Zip = create nvo_generic_ole_object
li_rc = loo_Zip.ConnectToNewObject("Chilkat_9_5_0.Zip")
if li_rc < 0 then
    destroy loo_Zip
    MessageBox("Error","Connecting to COM object failed Chilkat_9_5_0.Zip")
    return -1
end if

li_Success = loo_Zip.NewZip(is_ruta_facturas+"ad"+mid(as_filename,3)+'.zip')

if li_Success <> 1 then
    messagebox("Error creando Zip",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if

li_SaveExtraPath = 0
li_Success = loo_Zip.AppendOneFileOrDir(is_ruta_facturas+"ad"+mid(as_filename,3)+'.xml',li_SaveExtraPath)
if li_Success <> 1 then
    messagebox("Error adicionando Archivo AttachedDocument a Zip AD: ",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if
li_Success = loo_Zip.AppendOneFileOrDir(is_ruta_facturas+as_filename+'.pdf',li_SaveExtraPath)
if li_Success <> 1 then
    messagebox("Error adicionando PDF al archivo Zip AD: ",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if

li_Success = loo_Zip.WriteZipAndClose()
if li_Success <> 1 then
    messagebox("Error creando Zip",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

loo_Email.AddFileAttachment(is_ruta_facturas+"ad"+mid(as_filename,3)+'.zip')//is_ruta_facturas+as_zipname)
if loo_Email.LastMethodSuccess <> 1 then
	messagebox("Error adjuntando archivo of_enviar_correo",string( loo_Mailman.LastErrorText))
    destroy loo_Mailman
    destroy loo_Email
    return -1
end if

li_Success = loo_Mailman.SendEmail(loo_Email)
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

public function integer of_enviar_new_correo (decimal adc_nro_factura, string as_clug_factura, string as_tipofac, integer as_nnota, string as_tnota, string as_filename, string as_origen);uo_datastore ldw_factura,ldw_result

uo_datastore 	lds_xml_attached

string 		ls_cufe,				ls_small_cufe,				ls_xml_factura,				ls_xml_retorno
string			ls_sfc,				ls_sfc_384,					ls_testp,						ls_small_cufex
string			ls_asun,				ls_cpo,						ls_retc,						ls_retdes
string 		ls_prefac,			ls_numfact
blob 			lblb_sha384,		lblb_md5
int 			li_rc , 				li_file,							li_status					

nvo_generic_ole_object loo_Mailman , loo_Email , loo_Cert

CrypterObject lnv_CrypterObject
lnv_CrypterObject = Create CrypterObject
Coderobject lnv_code
Lnv_code = create coderobject

ldw_factura=create uo_datastore
lds_xml_attached=create uo_datastore

if as_origen='C' then
	if as_tnota='C' then 
		if g_motor='postgres' then
			ldw_factura.dataobject='asis_int_electronica_cap_ncre'
		else
			ldw_factura.dataobject='dw_factura_electronica_cap_sql' 
		end if	
	else
		if g_motor='postgres' then
			ldw_factura.dataobject='asis_int_electronica_cap_ndeb'
		else
			ldw_factura.dataobject='dw_factura_electronica_cap_sql' 
		end if			
	end if
else
	if g_motor='postgres' then
		ldw_factura.dataobject="dw_factura_electronica_postgres"
	else
		ldw_factura.dataobject="dw_factura_electronica"
	end if
end if

ldw_factura.settransobject(sqlca)		

if as_tnota='C' or  as_tnota='D' then 
	if ldw_factura.retrieve(adc_nro_factura,as_clug_factura,as_tipofac,as_nnota)<0 then 
		return -1
	end if
else
	if ldw_factura.retrieve(adc_nro_factura,as_clug_factura,as_tipofac)<0 then 
		return -1
	end if
end if

SELECT cadena into :is_ruta_facturas
FROM parametros_gen
WHERE (((codigo_para)=55));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 55')
	return -1
end if

ls_testp=ldw_factura.getitemstring(1,'testp')
is_ruta_firma=ldw_factura.getitemstring(1,'ruta_certificado')
is_clave_firma=f_descripta_new(ldw_factura.getitemstring(1,'clave_certificado'),'1')
if isnull(is_ruta_firma) or  trim(is_ruta_firma)='' then
	return -1
end if

ls_prefac=ldw_factura.getitemstring(1,'prefijo')
ls_numfact=string(ldw_factura.getitemnumber(1,'nfact'))

is_ruta_facturas=is_ruta_facturas+'\'+ls_prefac+ls_numfact+'\'

////////////////////  LEER CERTIFICADO
if of_leer_certificado(loo_Cert)=-1 then
	 return -1
end if

ls_sfc= ldw_factura.getitemstring(1,'software_id')+f_descripta_new(ldw_factura.getitemstring(1,'pin'),'1')+ldw_factura.getitemstring(1,'prefijo')+string(ldw_factura.getitemnumber(1,'nfact'))

ls_sfc_384=f_encripta_sha(ls_sfc,'SHA384')
ldw_factura.setitem(1,'huella',ls_sfc_384)

///CUFE
ls_small_cufe= ldw_factura.getitemstring(1,'cufe')+f_descripta_new(ldw_factura.getitemstring(1,'clave_tecnica'),'1')+ldw_factura.getitemstring(1,'tipo_ambiente')

ls_sfc=f_encripta_sha(ls_small_cufe,'SHA384')
ldw_factura.setitem(1,'cufe',ls_sfc)

lblb_sha384=Blob(f_encripta_sha(ls_small_cufe,'SHA384'), EncodingANSI!)
lblb_md5 = lnv_CrypterObject.MD5(lblb_sha384)
ls_small_cufex = lnv_code.hexencode(lblb_MD5)
ldw_factura.setitem(1,'small_cufe',ls_small_cufex)
destroy Lnv_code
destroy lnv_CrypterObject

if as_origen='C' then
	lds_xml_attached.dataobject='dw_attached_document_capita'
else
	lds_xml_attached.dataobject='dw_attached_document'
end if
lds_xml_attached.settransobject(sqlca)

if lds_xml_attached.retrieve(adc_nro_factura,as_clug_factura,as_tipofac)<0 then
	messagebox("Error en retrieve de lds_attached_doc: ",sqlca.sqlerrtext)
	return -1
end if
lds_xml_attached.setitem(1,'cufe',ls_sfc)
lds_xml_attached.setitem(1,'small_cufe',ls_small_cufex)

li_file=fileOpen(is_ruta_facturas + as_filename+".xml",TextMode!)
li_rc=fileReadEx(li_file,ls_xml_factura)
li_rc=fileclose(li_file)


///////////////////////// REPONSE
ldw_result=create uo_datastore
ldw_result.dataobject='dw_retornos_dian'
li_status=ldw_result.importFile(XML!,is_ruta_facturas+as_filename+'_test_ret.xml')
	
if li_status<0 then
	messagebox('Error importando Respuesta','No es posible importar el mensaje de respuesta de la DIAN:~r~n'+ is_ruta_facturas+'Status_ret.xml')
	return -1
end if
		
if ldw_result.getitemstring(ldw_result.rowcount(),'statuscode')='00' then 	
	oleobject loo_Bd
	loo_Bd = create oleobject
	li_status= loo_Bd.ConnectToNewObject("Chilkat_9_5_0.BinData")
	if li_status < 0 then
		 destroy loo_Bd
		 MessageBox("Error","Connecting to COM object failed")
		 return -1
	end if
	li_status= loo_Bd.AppendEncoded(ldw_result.getitemstring(ldw_result.rowcount(),'xmlbase64'),"base64")
	ls_xml_retorno = loo_Bd.GetString("utf-8")
end if		
lds_xml_attached.setItem(1,'xml_invoice',ls_xml_factura)
lds_xml_attached.setItem(1,'xml_response',ls_xml_retorno)
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
loo_Mailman = create nvo_generic_ole_object
li_rc = loo_Mailman.ConnectToNewObject("Chilkat_9_5_0.MailMan")
if li_rc < 0 then
    destroy loo_Mailman
    MessageBox("Error","Connecting to COM object failed")
    return -1
end if

if as_origen='C' then
	select servidor, puerto, usuario, clave,autentica,conexion,usuario_adc
	into :is_server_email,:ii_puerto_email,:is_cuenta_email,:is_clave_email,:is_ssl, :is_tls,:is_cuenta_email1
	from documentos
	where (((coddoc)='RV') and ((clugar)=:as_clug_factura));
else
	select servidor, puerto, usuario, clave,autentica,conexion,usuario_adc
	into :is_server_email,:ii_puerto_email,:is_cuenta_email,:is_clave_email,:is_ssl, :is_tls,:is_cuenta_email1
	from documentos
	where (((coddoc)='FV') and ((clugar)=:as_clug_factura));
end if

if isnull(is_server_email) or isnull(is_cuenta_email)  or isnull(is_clave_email) then
    MessageBox("Error","No hay servidor de documento configurado")
    return -1
end if

if as_origen='C' then
	is_nombre_lugar=ldw_factura.getitemstring(1,'ips_nombre')
else
	is_nombre_lugar=ldw_factura.getitemstring(1,'ips_descripcion')
end if
is_clave_email=f_descripta_new(is_clave_email,'1')
loo_Mailman = create nvo_generic_ole_object
li_rc = loo_Mailman.ConnectToNewObject("Chilkat_9_5_0.MailMan")
if li_rc < 0 then
    destroy loo_Mailman
    MessageBox("Error","Connecting to COM object failed")
    return -1
end if

// Set the SMTP server.
loo_Mailman.SmtpHost = is_server_email// "smtp.gmail.com"

loo_Mailman.SmtpUsername = is_cuenta_email//"mySmtpLogin"
loo_Mailman.SmtpPassword = is_clave_email//"myPassword"
loo_Mailman.SmtpPort = ii_puerto_email
loo_Mailman.SmtpSsl = 1

// Create a new email object
loo_Email = create nvo_generic_ole_object
li_rc = loo_Email.ConnectToNewObject("Chilkat_9_5_0.Email")

ls_asun=ldw_factura.getitemstring(1,"documento")+';'+is_nombre_lugar+';'+ldw_factura.getitemstring(1,"prefijo")+string(ldw_factura.getitemnumber(1,"nfact"))+';'

ls_asun+='01'

ls_asun+=';'+is_nombre_lugar
loo_Email.Subject = ls_asun


ls_cpo="Señores:~r~n"+ldw_factura.getitemstring(1,"razon_social")+"~r~n"
ls_cpo+="NIT/CC"+ldw_factura.getitemstring(1,"nit")+"~r~n~r~n"

ls_cpo+="Les informamos ha recibido un documento de Factura Electronica de venta emitida por "+is_nombre_lugar

ls_cpo+=" Numero de documento "+ldw_factura.getitemstring(1,"prefijo")+string(ldw_factura.getitemnumber(1,"nfact"))+"~r~n~r~n"

ls_cpo+= "Fecha de Emisión "+string(ldw_factura.getitemdatetime(1,"fecha_factura"),'yyyy-mm-dd')+"~r~n~r~n"
if ldw_factura.getitemnumber(1,'vtemp')<>0 then
	ls_cpo+= "Valor "+string(ldw_factura.getitemnumber(1,'vtemp'),"##,##0.00")+"~r~n~r~n"
else
	if ldw_factura.getitemnumber(1,'vtproced')<>0 then
		ls_cpo+= "Valor "+string(ldw_factura.getitemnumber(1,'vtproced'),"##,##0.00")+"~r~n~r~n"
	end if
end if


ls_cpo+='-----------------------------------------------------------------------------------'+"~r~n~r~n"
ls_cpo+='Este es un sistema automático de aviso, por favor no responda este mensaje'+"~r~n~r~n"
ls_cpo+='-----------------------------------------------------------------------------------'+"~r~n~r~n"
loo_Email.Body =ls_cpo

loo_Email.From = is_nombre_lugar+" <"+is_cuenta_email+">"
li_rc = loo_Email.AddTo(ldw_factura.getitemstring(1,"razon_social"),ldw_factura.getitemstring(1,"email_cliente"))
if not isnull(is_cuenta_email1) then
	li_rc = loo_Email.AddTo('Copia',is_cuenta_email1)
end if

nvo_generic_ole_object loo_SbXml

IF of_firmar_xml_attached(lds_xml_attached,loo_Cert,loo_SbXml )=-1 then
	 return -2
end if
loo_SbXml.WriteFile(is_ruta_facturas+"ad"+mid(as_filename,3)+'.xml','utf-8',0)

nvo_generic_ole_object loo_zip
int li_SaveExtraPath

loo_Zip = create nvo_generic_ole_object
li_rc = loo_Zip.ConnectToNewObject("Chilkat_9_5_0.Zip")
if li_rc < 0 then
    destroy loo_Zip
    MessageBox("Error","Connecting to COM object failed Chilkat_9_5_0.Zip")
    return -1
end if

li_rc = loo_Zip.NewZip(is_ruta_facturas+"ad"+mid(as_filename,3)+'.zip')

if li_rc <> 1 then
    messagebox("Error creando Zip",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if

li_SaveExtraPath = 0
li_rc = loo_Zip.AppendOneFileOrDir(is_ruta_facturas+"ad"+mid(as_filename,3)+'.xml',li_SaveExtraPath)
if li_rc <> 1 then
    messagebox("Error adicionando Archivo AttachedDocument a Zip AD: ",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if
li_rc = loo_Zip.AppendOneFileOrDir(is_ruta_facturas+as_filename+'.pdf',li_SaveExtraPath)
if li_rc <> 1 then
    messagebox("Error adicionando PDF al archivo Zip AD: ",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if

li_rc = loo_Zip.WriteZipAndClose()
if li_rc <> 1 then
    messagebox("Error creando Zip",string( loo_Zip.LastErrorText ))
    destroy loo_Zip
    return -1
end if

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
loo_Email.AddFileAttachment(is_ruta_facturas+"ad"+mid(as_filename,3)+'.zip')//is_ruta_facturas+as_zipname)
if loo_Email.LastMethodSuccess <> 1 then
	messagebox("Error adjuntando archivo of_enviar_correo",string( loo_Mailman.LastErrorText))
    destroy loo_Mailman
    destroy loo_Email
    return -1
end if

li_rc = loo_Mailman.SendEmail(loo_Email)
if li_rc <> 1 then
    messagebox("Error Enviando Correo of_enviar_correo",string( loo_Mailman.LastErrorText))
    destroy loo_Mailman
    destroy loo_Email
    return -1
end if

li_rc = loo_Mailman.CloseSmtpConnection()
if li_rc <> 1 then
    messagebox("Error cerrando conexion a correo", "Connection to SMTP server not closed cleanly.")
end if

destroy loo_Mailman
destroy loo_Email
destroy loo_Bd

return 1
end function

public subroutine of_files_names (ref uo_datawindow adw_factura, ref string as_filename, ref string as_zipname, ref decimal al_nro_fact_x_anyo, ref decimal al_nro_zip_x_anyo, ref boolean abn_actu_consec_fact, ref boolean abn_actu_consec_zip, string as_tipo_docu, string as_tipo_ambiente, integer ai_anyo, string as_coddoc, string as_lsdoc);if as_tipo_docu='f' or as_tipo_docu='r' then
	if isnull(adw_factura.getitemstring(1,'file_name_fact')) then //es la primera que se envía , hay que hacer los nombre de los archivos zip y xml
		al_nro_fact_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'f',ai_anyo)
		as_filename='fv'+right('0000'+adw_factura.getitemstring(1,'documento') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
		al_nro_zip_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'z',ai_anyo)
		as_zipname='z'+right('0000'+adw_factura.getitemstring(1,'documento'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
		abn_actu_consec_fact=true
		abn_actu_consec_zip=true
	else
		as_filename=adw_factura.getitemstring(1,'file_name_fact')
		as_zipname=adw_factura.getitemstring(1,'file_name_zip')
	end if
else
	if as_tipo_docu='c' then
		if isnull(adw_factura.getitemstring(1,'file_name_nota')) then //es la primera que se envía , hay que hacer los nombre de los archivos zip y xml
			al_nro_fact_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'c',ai_anyo)
			as_filename='nc'+right('0000'+adw_factura.getitemstring(1,'documento') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
			al_nro_zip_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'z',ai_anyo)
			as_zipname='z'+right('0000'+adw_factura.getitemstring(1,'documento'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
			abn_actu_consec_fact=true
			abn_actu_consec_zip=true
		else
			as_filename=adw_factura.getitemstring(1,'file_name_nota')
			as_zipname=adw_factura.getitemstring(1,'file_name_zip_nota')
		end if
	else
		if as_tipo_docu='d' then
			if isnull(adw_factura.getitemstring(1,'file_name_nota')) then //es la primera que se envía , hay que hacer los nombre de los archivos zip y xml
				al_nro_fact_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'d',ai_anyo)
				as_filename='nd'+right('0000'+adw_factura.getitemstring(1,'documento') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
				al_nro_zip_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'z',ai_anyo)
				as_zipname='z'+right('0000'+adw_factura.getitemstring(1,'documento'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
				abn_actu_consec_fact=true
				abn_actu_consec_zip=true
			else
				as_filename=adw_factura.getitemstring(1,'file_name_nota')
				as_zipname=adw_factura.getitemstring(1,'file_name_zip_nota')
			end if
		else
			if as_tipo_docu='a' then
				if as_lsdoc='FV' then
					if isnull(adw_factura.getitemstring(1,'file_name_fact_anul')) then //es la primera que se envía , hay que hacer los nombre de los archivos zip y xml
						al_nro_fact_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'c',ai_anyo)
						as_filename='nc'+right('0000'+adw_factura.getitemstring(1,'documento') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
						al_nro_zip_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'z',ai_anyo)
						as_zipname='z'+right('0000'+adw_factura.getitemstring(1,'documento'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
						abn_actu_consec_fact=true
						abn_actu_consec_zip=true
					else
						if isnull(adw_factura.getitemstring(1,'file_name_fact_anul')) then
							al_nro_fact_x_anyo=adw_factura.getitemNumber(1,'nro_nota_cred')			
							al_nro_zip_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'z',ai_anyo)
							as_filename='nc'+right('0000'+adw_factura.getitemstring(1,'documento') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
							as_zipname='z'+right('0000'+adw_factura.getitemstring(1,'documento'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
							abn_actu_consec_zip=true
						else
							as_filename=adw_factura.getitemstring(1,'file_name_fact_anul')
							as_zipname=adw_factura.getitemstring(1,'file_name_zip_anul')
						end if
					end if
				else
					if isnull(adw_factura.getitemstring(1,'file_name_nota')) then //es la primera que se envía , hay que hacer los nombre de los archivos zip y xml
						al_nro_fact_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'c',ai_anyo)
						as_filename='nc'+right('0000'+adw_factura.getitemstring(1,'documento') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
						al_nro_zip_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'z',ai_anyo)
						as_zipname='z'+right('0000'+adw_factura.getitemstring(1,'documento'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
						abn_actu_consec_fact=true
						abn_actu_consec_zip=true
					else
						if isnull(adw_factura.getitemstring(1,'file_name_nota')) then
							al_nro_fact_x_anyo=adw_factura.getitemNumber(1,'nro_nota_cred')			
							al_nro_zip_x_anyo=of_consecutivos_fact_elect(as_coddoc,as_tipo_ambiente,'z',ai_anyo)
							as_filename='nc'+right('0000'+adw_factura.getitemstring(1,'documento') , 10)+'000'+ right(string( ai_anyo ),2)+ right('0000000'+string(al_nro_fact_x_anyo),8)
							as_zipname='z'+right('0000'+adw_factura.getitemstring(1,'documento'),10)+'000'+right(string( ai_anyo ),2)+right('0000000'+string(al_nro_zip_x_anyo),8)+'.zip'
							abn_actu_consec_zip=true
						else
							as_filename=adw_factura.getitemstring(1,'file_name_nota')
							as_zipname=adw_factura.getitemstring(1,'file_name_zip_nota')
						end if
					end if
				end if
			end if //as tipo a
		end if // as tipo d
	end if //as tipo c
end if //tipo F
end subroutine

on nvo_factura_electronica.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_factura_electronica.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

