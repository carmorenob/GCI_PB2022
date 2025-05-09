$PBExportHeader$q_i.srw
forward
global type q_i from window
end type
type cb_6 from commandbutton within q_i
end type
type cb_3 from commandbutton within q_i
end type
type wb_1 from webbrowser within q_i
end type
type cb_2 from commandbutton within q_i
end type
type pb_3 from picturebutton within q_i
end type
type pb_2 from picturebutton within q_i
end type
type dw_electronica_cap from uo_datawindow within q_i
end type
type dw_electronica from uo_datawindow within q_i
end type
type pb_1 from picturebutton within q_i
end type
type st_2 from statictext within q_i
end type
type st_1 from statictext within q_i
end type
type sle_l from singlelineedit within q_i
end type
type sle_f from singlelineedit within q_i
end type
type cb_5 from commandbutton within q_i
end type
type cb_4 from commandbutton within q_i
end type
type dw_3 from datawindow within q_i
end type
type dw_2 from datawindow within q_i
end type
type dw_1 from datawindow within q_i
end type
type ads_datos from datawindow within q_i
end type
type cb_1 from commandbutton within q_i
end type
end forward

global type q_i from window
integer width = 4165
integer height = 2112
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cb_3 cb_3
wb_1 wb_1
cb_2 cb_2
pb_3 pb_3
pb_2 pb_2
dw_electronica_cap dw_electronica_cap
dw_electronica dw_electronica
pb_1 pb_1
st_2 st_2
st_1 st_1
sle_l sle_l
sle_f sle_f
cb_5 cb_5
cb_4 cb_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
ads_datos ads_datos
cb_1 cb_1
end type
global q_i q_i

on q_i.create
this.cb_6=create cb_6
this.cb_3=create cb_3
this.wb_1=create wb_1
this.cb_2=create cb_2
this.pb_3=create pb_3
this.pb_2=create pb_2
this.dw_electronica_cap=create dw_electronica_cap
this.dw_electronica=create dw_electronica
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_l=create sle_l
this.sle_f=create sle_f
this.cb_5=create cb_5
this.cb_4=create cb_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.ads_datos=create ads_datos
this.cb_1=create cb_1
this.Control[]={this.cb_6,&
this.cb_3,&
this.wb_1,&
this.cb_2,&
this.pb_3,&
this.pb_2,&
this.dw_electronica_cap,&
this.dw_electronica,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.sle_l,&
this.sle_f,&
this.cb_5,&
this.cb_4,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.ads_datos,&
this.cb_1}
end on

on q_i.destroy
destroy(this.cb_6)
destroy(this.cb_3)
destroy(this.wb_1)
destroy(this.cb_2)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.dw_electronica_cap)
destroy(this.dw_electronica)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_l)
destroy(this.sle_f)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.ads_datos)
destroy(this.cb_1)
end on

type cb_6 from commandbutton within q_i
integer x = 942
integer y = 852
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;string ls_url = 'https://oauth2.googleapis.com/token'
string ls_clientid = '72934021868-6ta93e5tedno14u079m72obtb0hf1q9c.apps.googleusercontent.com' // here I replaced whith my real client id here
string ls_clientsecret = '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' // here I replaced whith my real client secret here
string ls_scope = 'https://mail.google.com/' //to get a 'device list'; this for get the token 'CamDistributorTenant'
string ls_auth = ''
string ls_base64 = ''
string ls_body = ''
integer li_rc
string ls_token

RestClient lo_restclient
CoderObject lo_coderobject

lo_coderobject = create CoderObject
lo_restclient =  create RestClient

ls_auth = ls_clientid + ':' + ls_clientsecret
ls_base64 = lo_coderobject.Base64Encode(Blob(ls_auth, EncodingUTF8!))

// Set the authorization and content headers
lo_restclient.SetRequestHeader('Authorization', 'Basic ' + ls_base64)
lo_restclient.SetRequestHeader('Content-Type', 'application/x-www-form-urlencoded')

// Create the body
ls_body = 'grant_type=client_credentials' 
ls_body += '&client_id=' + ls_clientid
ls_body += '&scope=' + ls_scope

// Get the token with GetJWTToken (this returns the full json of the response which needs to be parsed to get the token)
li_rc = lo_restclient.GetJWTToken(ls_url, ls_body, ls_token)

string ls_JWTToken
JsonPackage ljpk_JWTINF
ljpk_JWTINF = Create JsonPackage
ljpk_JWTINF.Loadstring( ls_token )
If ljpk_JWTINF.ContainsKey( "access_token" ) Then
    ls_JWTToken = ljpk_JWTINF.GetValueString( "access_token" )
End If

//--- endpoint 
ls_url = 'https://dryrcmapi-ec1.srv.ygles.com/v1/devices/'
ls_base64 = lo_coderobject.base64encode( blob(ls_JWTToken, EncodingUTF8!))   //ok x encode

//other attempts
//lo_restclient.SetRequestHeaders("Content-Type:application/x-www-form-urlencoded;charset=UTF-8;~r~nAuthorization:Bearer " + ls_base64)
//lo_restclient.SetRequestHeaders("Content-Type:application/x-www-form-urlencoded;charset=UTF-8;~r~nAuthorization:Bearer " + ls_JWTToken)
//lo_restclient.SetRequestHeaders("Authorization:Bearer " + ls_base64)
//lo_restclient.SetRequestHeaders("Authorization:Bearer " + ls_JWTToken)
//lo_restclient.SetRequestHeader('Authorization', 'Bearer ' + ls_base64, true)

lo_restclient.SetRequestHeader('Authorization', 'Bearer ' + ls_JWTToken, true)

string ls_response
lo_restclient.SendGetRequest(ls_url, ls_response)

string ls_msg 
ls_msg = "Status Code: " + String(lo_restclient.GetResponseStatusCode()) + '~r~n' + &
            "Status Text: " + String(lo_restclient.GetResponseStatusText()) + '~r~n' + &
            "Response Body: " + ls_response

return lo_restclient.GetResponseStatusCode()
end event

type cb_3 from commandbutton within q_i
integer x = 1403
integer y = 548
integer width = 402
integer height = 112
integer taborder = 135
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;integer li_rc,li_Success

////// DESBLOQUEA
nvo_generic_ole_object loo_Glob
loo_Glob = create nvo_generic_ole_object
li_rc = loo_Glob.ConnectToNewObject("Chilkat.Global")
if li_rc < 0 then
    destroy loo_Glob
    MessageBox("Error of_desbloquear_chilkat","Connecting to COM object failed: Chilkat.Global")
    return -1
end if
li_Success = loo_Glob.UnlockBundle("HSPCRT.CB1032026_zzYKLAke9R37")
if li_Success <> 1 then
    messagebox("Error de desbloqueo de Chilkat.Global", string(loo_Glob.LastErrorText))
    destroy loo_Glob
    return -1
end if

li_Success = loo_Glob.UnlockStatus
destroy loo_Glob
/////


oleobject loo_Http
oleobject loo_Cert

integer li_NumSec=30
string ls_AccessToken
oleobject loo_Mailman
oleobject loo_Email
string is_ruta_firma='D:\certificado\gci-mail-458618-86f975b3dc24.p12'
string is_clave_firma='notasecret'
string ls_iss='gcimail@gci-mail-458618.iam.gserviceaccount.com'
string ls_scope='https://mail.google.com/'
string ls_oauth_sub='gcimail@gci-mail-458618.iam.gserviceaccount.com'


////HTT
loo_Http = create oleobject
li_rc = loo_Http.ConnectToNewObject("Chilkat.Http")
if li_rc < 0 then
    destroy loo_Http
    MessageBox("Error","Connecting to COM object failed")
    return
end if


string ss
///CERTD
loo_Cert = create oleobject
li_rc = loo_Cert.ConnectToNewObject("Chilkat.Cert")

li_Success = loo_Cert.LoadPfxFile( is_ruta_firma,is_clave_firma)
if li_Success <> 1 then
	ss=string( loo_Cert.LastErrorText)
    messagebox('Error',string( loo_Cert.LastErrorText))
    destroy loo_Http
    destroy loo_Cert
    return
end if

/////
ls_AccessToken = loo_Http.G_SvcOauthAccessToken(ls_Iss,ls_Scope,ls_Oauth_sub,li_NumSec,loo_Cert)
if loo_Http.LastMethodSuccess <> 1 then
	ss=string( string( loo_Http.LastErrorText))
  //  messagebox('',string( loo_Http.LastErrorText))
    destroy loo_Http
    destroy loo_Cert
    return
end if
/////

//SmtpClient lnv_SmtpClient
//lsc_mail = Create SmtpClient
//
//
////Sets the email message
//lnv_SmtpClient.Message.SetSender(ls_iss,"Tester001")
//lnv_SmtpClient.Message.AddRecipient("jaespram@gmail.com")
//lnv_SmtpClient.Message.Subject = "SMTPClient Test Message"
//lnv_SmtpClient.Message.TextBody = "SMTPClient example message body"
//
////Sets the email-sender information        
//lnv_SmtpClient.Host = "ssmtp.gmail.com"
//lnv_SmtpClient.Port = 587
//lnv_SmtpClient.EnableTLS = True
//lnv_SmtpClient.Username = ls_iss
//
////Model Authentication
//lnv_SmtpClient.XOAuth2AccessToken =ls_AccessToken
//
////Sends the email
//li_rc = lnv_SmtpClient.Send()
//
//IF li_rc = 1 THEN
//                Messagebox('SMTPClient','Mail sent successfully')
//ELSE
//                Messagebox('SMTPClient' ,'Email sending failed. Return ' + String(li_rc) + '.', StopSign!)
//END IF
//
//DESTROY lnv_SmtpClient



/*loo_Mailman = create oleobject
li_rc = loo_Mailman.ConnectToNewObject("Chilkat.MailMan")
// Set the properties for the GMail SMTP server:
loo_Mailman.SmtpHost = "smtp.gmail.com"
loo_Mailman.SmtpPort = 587
loo_Mailman.StartTLS = 1
//loo_Mailman.SmtpUsername = "gcimail@gci-mail-458618.iam.gserviceaccount.com"
loo_Mailman.SmtpUsername = "jaespram@gmail.com"

loo_Mailman.OAuth2AccessToken = ls_AccessToken







//string ls_500
//int li_j
//for li_j=1 to len(ls_AccessToken)
//	ls_500=ls_500+mid(ls_AccessToken,1,495)+"~r~n"
//	//li_j=495
//	ls_AccessToken=mid(ls_AccessToken,496,len(ls_AccessToken))
//next
//ls_AccessToken=ls_500

Blob lblb_data
String ls_Base64Str

lblb_data = Blob(ls_AccessToken, EncodingANSI!)

CoderObject lnv_CoderObject
lnv_CoderObject = Create CoderObject

ls_Base64Str = lnv_CoderObject.Base64Encode(lblb_data)



// Create a new email object
loo_Email = create oleobject
li_rc = loo_Email.ConnectToNewObject("Chilkat.Email")

loo_Email.Subject = "This is a test"
loo_Email.Body = "This is a test"
loo_Email.From = "jeffer espinosa<gcimail@gci-mail-458618.iam.gserviceaccount.com>"
li_Success = loo_Email.AddTo("Chilkat Admin","jespinr@hotmail.com")

  
li_Success = loo_Mailman.SendEmail(loo_Email)
if li_Success <> 1 then
	 	ss=string( string(loo_Mailman.LastErrorText))
    destroy loo_Http
    destroy loo_Cert
    destroy loo_Mailman
    destroy loo_Email
    return
end if

// You may close the connection here.  If the connection is kept open, 
// the next call to mailman.SendEmail will continue using the already-established connection
// (and automatically re-connect if needed).
li_Success = loo_Mailman.CloseSmtpConnection()
if li_Success <> 1 then
  //  Write-Debug "Connection to SMTP server not closed cleanly."
end if

//Write-Debug "Email Sent via GMail using an OAuth2 Service Account Key."
*/

destroy loo_Http
destroy loo_Cert
destroy loo_Mailman
destroy loo_Email
end event

type wb_1 from webbrowser within q_i
integer x = 1321
integer y = 880
integer width = 402
integer height = 400
end type

type cb_2 from commandbutton within q_i
integer x = 1047
integer y = 276
integer width = 402
integer height = 112
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "token gmail"
end type

event clicked;integer li_rc
oleobject loo_Oauth2
string ls_Url,ls_AccessToken 
integer li_Success
integer li_NumMsWaited
oleobject loo_SbJson
string ls_enpoint,ls_tokene,ls_ClientId,ls_ClientSecret,ls_tokens



ls_enpoint="https://accounts.google.com/o/oauth2/auth"
ls_tokene="https://oauth2.googleapis.com/token"
ls_ClientId="872934021868-6ta93e5tedno14u079m72obtb0hf1q9c.apps.googleusercontent.com"
ls_ClientSecret="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"
ls_tokens="qa_data/tokens/_gmailSmtp.json"

nvo_factura_electronica u_elec

u_elec=create nvo_factura_electronica


////////////////////   DESBLOQUEAR LIBRERIAS DE CHILKAT
IF u_elec.of_desbloquear_chilkat()=-1 then
 return
end if

//// TOKEN
ls_AccessToken=u_elec.of_token_OAuth2(ls_enpoint,ls_tokene,ls_ClientId,ls_ClientSecret,ls_tokens)


oleobject loo_Mailman
oleobject loo_Email
oleobject loo_Json

loo_Mailman = create oleobject
li_rc = loo_Mailman.ConnectToNewObject("Chilkat.MailMan")

// Set the properties for the GMail SMTP server:
loo_Mailman.SmtpHost = "smtp.gmail.com"
loo_Mailman.SmtpPort = 587
loo_Mailman.StartTLS = 1

// The SMTP username should be the GMail address of the user's account that authorized your app to send email.
loo_Mailman.SmtpUsername = "jaespram@gmail.com"
loo_Mailman.OAuth2AccessToken = ls_AccessToken

// Create a new email object
loo_Email = create oleobject
li_rc = loo_Email.ConnectToNewObject("Chilkat.Email")

loo_Email.Subject = "This is a test"
loo_Email.Body = "This is a test"
loo_Email.From = "Chilkat <jespinr@hotmail.com>"
loo_Email.AddTo("Chilkat Admin","jespinr@hotmail.com")
// To add more recipients, call AddTo, AddCC, or AddBcc once per recipient.

// Call SendEmail to connect to the SMTP server and send.
// The connection (i.e. session) to the SMTP server remains
// open so that subsequent SendEmail calls may use the
// same connection.  
li_Success = loo_Mailman.SendEmail(loo_Email)
if li_Success <> 1 then
   // Write-Debug loo_Mailman.LastErrorText
    destroy loo_Json
    destroy loo_Mailman
    destroy loo_Email
    return
end if

// You may close the connection here.  If the connection is kept open, 
// the next call to mailman.SendEmail will continue using the already-established connection
// (and automatically re-connect if needed).
li_Success = loo_Mailman.CloseSmtpConnection()
if li_Success <> 1 then
   // Write-Debug "Connection to SMTP server not closed cleanly."
end if

//Write-Debug "Email Sent via GMail with OAuth2 authentication."


destroy loo_Json
destroy loo_Mailman
destroy loo_Email
destroy  u_elec
end event

type pb_3 from picturebutton within q_i
string tag = "NCcapita"
integer x = 933
integer y = 500
integer width = 146
integer height = 128
integer taborder = 125
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "dian.gif"
alignment htextalign = left!
string powertiptext = "NCCapita"
end type

event clicked;////////ELECTRONICA	
double l_i,l_nfactura
string ls_clugar,ls_tfac,ls_filename
nvo_factura_electronica u_elec
st_ret_dian    lst_lle

u_elec=create nvo_factura_electronica

if dw_1.retrieve(double(sle_f.text),sle_l.text,'F',1)>0 then
	l_nfactura=dw_1.getitemnumber(1,'nfact')
	ls_clugar=dw_1.getitemstring(1,'clugar')
	ls_tfac=dw_1.getitemstring(1,'tipo')
	ls_filename=dw_1.getitemstring(1,'file_name_fact')
	
	lst_lle=u_elec.envio_sin_validacion19(dw_electronica_cap,l_nfactura,ls_clugar,ls_tfac,1,'a','RV') 
	u_elec.of_enviar_new_correo_fevs(l_nfactura,ls_clugar,ls_tfac,1,'C',ls_filename,'C')
end if
messagebox('','Proceso Finalizado')
////////ELECTRONICA

end event

type pb_2 from picturebutton within q_i
string tag = "capita"
integer x = 101
integer y = 500
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "dian.gif"
alignment htextalign = left!
string powertiptext = "Capita"
end type

event clicked;////////ELECTRONICA	
double l_i,l_nfactura
string ls_clugar,ls_tfac,ls_filename
nvo_factura_electronica u_elec
st_ret_dian    lst_lle

u_elec=create nvo_factura_electronica

//--588,'01'

if dw_1.retrieve(double(sle_f.text),sle_l.text,'F',0)>0 then
	l_nfactura=dw_1.getitemnumber(1,'nfact')
	ls_clugar=dw_1.getitemstring(1,'clugar')
	ls_tfac=dw_1.getitemstring(1,'tipo')
	ls_filename=dw_1.getitemstring(1,'file_name_fact')
	
	lst_lle=u_elec.envio_sin_validacion19(dw_electronica_cap,l_nfactura,ls_clugar,ls_tfac,0,'f','RV') 
	u_elec.of_enviar_new_correo_fevs(l_nfactura,ls_clugar,ls_tfac,0,'',ls_filename,'C')
end if
messagebox('','Proceso Finalizado')
////////ELECTRONICA

end event

type dw_electronica_cap from uo_datawindow within q_i
integer x = 2523
integer y = 556
integer width = 521
integer height = 388
integer taborder = 10
string dataobject = "asis_int_factura_ele_cap19"
end type

type dw_electronica from uo_datawindow within q_i
boolean visible = false
integer x = 2519
integer y = 16
integer width = 521
integer height = 388
integer taborder = 20
boolean enabled = false
string dataobject = "dw_factura_electronica_postgres19"
end type

type pb_1 from picturebutton within q_i
string tag = "Evento"
integer x = 96
integer y = 332
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "dian_zip.gif"
alignment htextalign = left!
string powertiptext = "Evento "
end type

event clicked;////////ELECTRONICA	
double l_i,l_nfactura
string ls_clugar,ls_tfac,ls_filename
nvo_factura_electronica u_elec
st_ret_dian    lst_lle

u_elec=create nvo_factura_electronica

//---55387,'69'

if dw_1.retrieve(double(sle_f.text),sle_l.text,'F',0)>0 then
	l_nfactura=dw_1.getitemnumber(1,'nfact')
	ls_clugar=dw_1.getitemstring(1,'clugar')
	ls_tfac=dw_1.getitemstring(1,'tipo')
	ls_filename=dw_1.getitemstring(1,'file_name_fact')
	
	lst_lle=u_elec.envio_sin_validacion19(dw_electronica,l_nfactura,ls_clugar,ls_tfac,0,'f','FV') 
	u_elec.of_enviar_new_correo_fevs(l_nfactura,ls_clugar,ls_tfac,0,'',ls_filename,'F')
		
	destroy u_elec
	messagebox('','Proceso Finalizado')
else
	messagebox('','No se encontro factura')
end if

////////ELECTRONICA
end event

type st_2 from statictext within q_i
integer x = 686
integer y = 56
integer width = 169
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type st_1 from statictext within q_i
integer x = 50
integer y = 52
integer width = 197
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factura"
boolean focusrectangle = false
end type

type sle_l from singlelineedit within q_i
integer x = 887
integer y = 48
integer width = 402
integer height = 68
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "01"
borderstyle borderstyle = stylelowered!
end type

type sle_f from singlelineedit within q_i
integer x = 288
integer y = 48
integer width = 357
integer height = 68
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "698"
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within q_i
integer x = 261
integer y = 368
integer width = 402
integer height = 112
integer taborder = 115
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "josnCapita"
end type

event clicked;	nvo_fevrips u_rips
	
	u_rips=create nvo_fevrips
//	u_rips.emite_json_evento(49971,'74','F','f','FV')
	u_rips.emite_json_capita(double(sle_f.text),sle_l.text,'F','f','FV','d:\prueba.json','0')
	destroy 	u_rips
end event

type cb_4 from commandbutton within q_i
boolean visible = false
integer x = 96
integer y = 180
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Evento"
end type

event clicked;	nvo_fevrips u_rips
	
	u_rips=create nvo_fevrips
	u_rips.emite_json_evento(double(sle_f.text),sle_l.text,'F','f','FV','D:\json'+'.json')
	destroy 	u_rips
end event

type dw_3 from datawindow within q_i
integer x = 1893
integer y = 232
integer width = 1934
integer height = 1016
integer taborder = 160
string title = "none"
string dataobject = "dw_retorno_cargarfevrips"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_2 from datawindow within q_i
boolean visible = false
integer x = 1893
integer width = 421
integer height = 228
integer taborder = 120
string title = "none"
string dataobject = "dw_retornos_dian"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within q_i
integer x = 101
integer y = 1276
integer width = 2473
integer height = 544
integer taborder = 150
string title = "none"
string dataobject = "dw_facturas_envio_e1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type ads_datos from datawindow within q_i
boolean visible = false
integer x = 2674
integer y = 1276
integer width = 585
integer height = 208
integer taborder = 130
string title = "none"
string dataobject = "dw_factura_electronica_cap_postgres_anula"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type cb_1 from commandbutton within q_i
integer x = 59
integer y = 812
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "loginsispro"
end type

event clicked;nvo_fevrips u_rips
string ls_token,ls_err, ls_tds,ls_docs,ls_pass,ls_ipsn,ls_url,ls_tamb
int li_rc
st_retorno_gral lst_ret_gral
	
u_rips=create nvo_fevrips
		
SELECT 
	usuarios.tipodoc, usuarios.documento, 
	usuarios.clave_sispro, ips.documento,ips.url_apidocker,ips.tipo_ambiente
INTO
	:ls_tds,:ls_docs,:ls_pass,:ls_ipsn,:ls_url,:ls_tamb
FROM 
	usuarios, ips
WHERE (((usuarios.usuario)=:usuario));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay usuari sisipro')
	return 
end if

if isnull(ls_tds)  or isnull(ls_docs) or isnull(ls_pass) then
	return
end if
ls_pass=f_descripta_new(ls_pass,'1')
ls_token=u_rips.sispro_login(ls_tamb,ls_tds,ls_docs,ls_pass,ls_ipsn,ls_url)
if ls_token<>'-1' then 
	lst_ret_gral=u_rips.sispro_carga_fev_rips(ls_token,ls_tamb,'C:\facturas\EV133925\','EV133925.json','ad08060103050002500028513',ls_url)
	if lst_ret_gral.i_valor=-1 then 
		rollback;
	end if
//	lst_ret_gral=u_rips.sispro_carga_capita_ini(ls_token,'2','','')
//	if lst_ret_gral.i_valor=-1 then 
//		rollback;
//	end if
//
//	lst_ret_gral=u_rips.sispro_carga_capita_mes(ls_token,'2','','')
//	if lst_ret_gral.i_valor=-1 then 
//		rollback;
//	end if

//	lst_ret_gral=u_rips.sispro_carga_capita_fin(ls_token,'2','','')
//	if lst_ret_gral.i_valor=-1 then 
//		rollback;
//	end if
//

//	lst_ret_gral=u_rips.sispro_carga_nccapita(ls_token,'2','','')
//	if lst_ret_gral.i_valor=-1 then 
//		rollback;
//	end if
//

	jsonpackage lnv_json
	string ls_ResultadosValidacion
	lnv_json=create jsonpackage
	
	lnv_json.loadstring( lst_ret_gral.s_valor)
	ls_err = lnv_json.LoadString(lst_ret_gral.s_valor)
	lnv_json.SaveToFile('C:\facturas\EV133925\log.json')	
	if Len(ls_err) = 0 then
		ls_ResultadosValidacion =  lnv_json.GetValue("ResultadosValidacion")
		li_rc=dw_3.ImportJson(ls_ResultadosValidacion ,ls_err)
	end if		
end if

destroy lnv_json
destroy u_rips
end event

