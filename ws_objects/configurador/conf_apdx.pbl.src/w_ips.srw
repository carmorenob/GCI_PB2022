﻿$PBExportHeader$w_ips.srw
forward
global type w_ips from window
end type
type pb_5 from picturebutton within w_ips
end type
type pb_2 from picturebutton within w_ips
end type
type pb_1 from picturebutton within w_ips
end type
type tab_1 from tab within w_ips
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type st_1 from statictext within tabpage_2
end type
type dw_ips from datawindow within tabpage_2
end type
type rb_tls from radiobutton within tabpage_2
end type
type rb_ssl from radiobutton within tabpage_2
end type
type rb_nin from radiobutton within tabpage_2
end type
type dw_2 from datawindow within tabpage_2
end type
type pb_4 from picturebutton within tabpage_2
end type
type pb_3 from picturebutton within tabpage_2
end type
type st_25 from statictext within tabpage_2
end type
type cbx_smtpauth from checkbox within tabpage_2
end type
type sle_password from singlelineedit within tabpage_2
end type
type st_19 from statictext within tabpage_2
end type
type sle_userid from singlelineedit within tabpage_2
end type
type st_18 from statictext within tabpage_2
end type
type sle_port from singlelineedit within tabpage_2
end type
type st_17 from statictext within tabpage_2
end type
type sle_server from singlelineedit within tabpage_2
end type
type st_16 from statictext within tabpage_2
end type
type gb_3 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_1 st_1
dw_ips dw_ips
rb_tls rb_tls
rb_ssl rb_ssl
rb_nin rb_nin
dw_2 dw_2
pb_4 pb_4
pb_3 pb_3
st_25 st_25
cbx_smtpauth cbx_smtpauth
sle_password sle_password
st_19 st_19
sle_userid sle_userid
st_18 st_18
sle_port sle_port
st_17 st_17
sle_server sle_server
st_16 st_16
gb_3 gb_3
end type
type tab_1 from tab within w_ips
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_ips from window
integer width = 3328
integer height = 1344
boolean titlebar = true
string title = "Datos IPS"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "hospital.ico"
boolean center = true
pb_5 pb_5
pb_2 pb_2
pb_1 pb_1
tab_1 tab_1
end type
global w_ips w_ips

type variables
datawindowchild docus,dwc_postal,dwc_tiporet
end variables

on w_ips.create
this.pb_5=create pb_5
this.pb_2=create pb_2
this.pb_1=create pb_1
this.tab_1=create tab_1
this.Control[]={this.pb_5,&
this.pb_2,&
this.pb_1,&
this.tab_1}
end on

on w_ips.destroy
destroy(this.pb_5)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.tab_1)
end on

type pb_5 from picturebutton within w_ips
integer x = 1641
integer y = 1108
integer width = 146
integer height = 128
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cerrar Ventana"
end type

event clicked;close(parent)
end event

type pb_2 from picturebutton within w_ips
string tag = "Refrescar"
integer x = 1303
integer y = 1108
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_1.retrieve()
tab_1.tabpage_2.dw_2.retrieve()
end event

type pb_1 from picturebutton within w_ips
string tag = "Guardar"
integer x = 1477
integer y = 1108
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_1.accepttext()

if tab_1.tabpage_1.dw_1.update(true,false)<1 then
	rollback;
else
	commit;
	tab_1.tabpage_1.dw_1.resetupdate()
end if

tab_1.tabpage_2.dw_ips.setfilter("ctipo='"+tab_1.tabpage_2.dw_2.getitemstring(1,'ctipo')+"'")
tab_1.tabpage_2.dw_ips.filter()
if tab_1.tabpage_2.dw_ips.rowcount()=0 then 
	tab_1.tabpage_2.dw_ips.insertrow(1)	
	tab_1.tabpage_2.dw_ips.setitem(1,'c_ips',tab_1.tabpage_1.dw_1.getitemstring(1,'c_ips'))
	tab_1.tabpage_2.dw_ips.setitem(1,'ctipo',tab_1.tabpage_2.dw_2.getitemstring(1,'ctipo'))
end if
tab_1.tabpage_2.dw_ips.setitem(1,'servidor',tab_1.tabpage_2.sle_server.text)
tab_1.tabpage_2.dw_ips.setitem(1,'puerto',tab_1.tabpage_2.sle_port.text)
tab_1.tabpage_2.dw_ips.setitem(1,'usuario',tab_1.tabpage_2.sle_userid.text)
if not isnull(tab_1.tabpage_2.sle_password.text) and len(tab_1.tabpage_2.sle_password.text)>0  then
	tab_1.tabpage_2.dw_ips.setitem(1,'clave',f_encripta_new(tab_1.tabpage_2.sle_password.text))
end if
if tab_1.tabpage_2.cbx_smtpauth.checked=true then
	tab_1.tabpage_2.dw_ips.setitem(1,'autentica','S')
else
	tab_1.tabpage_2.dw_ips.setitem(1,'autentica','N')
end if
if tab_1.tabpage_2.rb_ssl.checked = True then
	tab_1.tabpage_2.dw_ips.setitem(1,'conexion','S')
end if
if tab_1.tabpage_2.rb_tls.checked = True then
	tab_1.tabpage_2.dw_ips.setitem(1,'conexion','T')
end if	
if tab_1.tabpage_2.rb_nin.checked = True then
	tab_1.tabpage_2.dw_ips.setitem(1,'conexion','N')
end if	
if tab_1.tabpage_2.dw_ips.update(true,false)<1 then
	rollback;
else
	commit;
	tab_1.tabpage_2.dw_ips.resetupdate()
end if
tab_1.tabpage_2.dw_ips.setfilter('')
tab_1.tabpage_2.dw_ips.filter()
end event

type tab_1 from tab within w_ips
integer x = 41
integer y = 24
integer width = 3232
integer height = 1064
integer taborder = 10
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
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanged;if tab_1.tabpage_1.dw_1.rowcount()<0 then return
string jaer
jaer=tab_1.tabpage_1.dw_1.getitemstring(1,'c_ips')
tab_1.tabpage_2.dw_2.retrieve()
tab_1.tabpage_2.dw_ips.retrieve(tab_1.tabpage_1.dw_1.getitemstring(1,'c_ips'))
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3195
integer height = 936
long backcolor = 67108864
string text = "Datos Básicos"
long tabtextcolor = 33554432
string picturename = "rep.ico"
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
integer x = 37
integer y = 24
integer width = 3163
integer height = 912
integer taborder = 20
string dataobject = "dw_ips_new"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.getchild("ciudad_ips",docus)
docus.settransobject(sqlca)
docus.InsertRow(0)
settransobject(sqlca)	
dw_1.GetChild('cod_postal',dwc_postal)
dwc_postal.SetTransObject(SQLCA)
dwc_postal.InsertRow(0)
dw_1.GetChild('tipo_ret', dwc_tiporet)
dwc_tiporet.SetTransObject(SQLCA)
dwc_tiporet.InsertRow(0)
tab_1.tabpage_1.dw_1.retrieve()
end event

event rowfocuschanged;if not isnull(this.getitemstring(currentrow,'depto_ips')) then
	docus.retrieve(this.getitemstring(currentrow,'depto_ips'))
end if


end event

event buttonclicked;st_usuarios l_prof
l_prof.usuario=dw_1.getitemstring(row, 'c_ips') 
setnull(l_prof.clave)
l_prof.destino='ips'
openwithparm(w_sube_imagen,l_prof)
end event

event retrieveend;if dw_1.rowcount()>0 then
	tab_1.tabpage_2.enabled=true	
else
	tab_1.tabpage_2.enabled=false
end if
string s_dpto,s_ciudad
s_dpto=dw_1.getitemstring(dw_1.getrow(),'depto_ips')
s_ciudad=dw_1.getitemstring(dw_1.getrow(),'ciudad_ips')
dwc_postal.Retrieve(s_dpto,s_ciudad)
end event

event itemchanged;string s_dpto,s_ciudad
this.accepttext()
choose case getcolumnname()
	case 'depto_ips' 
		docus.retrieve(getitemstring(getrow(),'depto_ips'))
	case 'ciudad_ips'
		setitem(getrow(),'ciudad_ips',docus.getitemstring(docus.getrow(),'codciudad'))
		s_dpto=getitemstring(row,'depto_ips')
		s_ciudad=docus.getitemstring(docus.getrow(),'codciudad')
		setitem(getrow(),'ciudad_ips',docus.getitemstring(docus.getrow(),'codciudad'))
		dwc_postal.Retrieve(s_dpto,s_ciudad)
	case "tipo_reg"
		dwc_tiporet.Retrieve(data)
end choose

end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3195
integer height = 936
boolean enabled = false
long backcolor = 67108864
string text = "Correos Electronicos"
long tabtextcolor = 33554432
string picturename = "email.ico"
long picturemaskcolor = 536870912
st_1 st_1
dw_ips dw_ips
rb_tls rb_tls
rb_ssl rb_ssl
rb_nin rb_nin
dw_2 dw_2
pb_4 pb_4
pb_3 pb_3
st_25 st_25
cbx_smtpauth cbx_smtpauth
sle_password sle_password
st_19 st_19
sle_userid sle_userid
st_18 st_18
sle_port sle_port
st_17 st_17
sle_server sle_server
st_16 st_16
gb_3 gb_3
end type

on tabpage_2.create
this.st_1=create st_1
this.dw_ips=create dw_ips
this.rb_tls=create rb_tls
this.rb_ssl=create rb_ssl
this.rb_nin=create rb_nin
this.dw_2=create dw_2
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_25=create st_25
this.cbx_smtpauth=create cbx_smtpauth
this.sle_password=create sle_password
this.st_19=create st_19
this.sle_userid=create sle_userid
this.st_18=create st_18
this.sle_port=create sle_port
this.st_17=create st_17
this.sle_server=create sle_server
this.st_16=create st_16
this.gb_3=create gb_3
this.Control[]={this.st_1,&
this.dw_ips,&
this.rb_tls,&
this.rb_ssl,&
this.rb_nin,&
this.dw_2,&
this.pb_4,&
this.pb_3,&
this.st_25,&
this.cbx_smtpauth,&
this.sle_password,&
this.st_19,&
this.sle_userid,&
this.st_18,&
this.sle_port,&
this.st_17,&
this.sle_server,&
this.st_16,&
this.gb_3}
end on

on tabpage_2.destroy
destroy(this.st_1)
destroy(this.dw_ips)
destroy(this.rb_tls)
destroy(this.rb_ssl)
destroy(this.rb_nin)
destroy(this.dw_2)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_25)
destroy(this.cbx_smtpauth)
destroy(this.sle_password)
destroy(this.st_19)
destroy(this.sle_userid)
destroy(this.st_18)
destroy(this.sle_port)
destroy(this.st_17)
destroy(this.sle_server)
destroy(this.st_16)
destroy(this.gb_3)
end on

type st_1 from statictext within tabpage_2
integer x = 64
integer y = 32
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Correo"
boolean focusrectangle = false
end type

type dw_ips from datawindow within tabpage_2
boolean visible = false
integer x = 1888
integer y = 36
integer width = 873
integer height = 916
integer taborder = 10
string title = "none"
string dataobject = "dw_ips_correos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type rb_tls from radiobutton within tabpage_2
integer x = 809
integer y = 732
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TLS"
end type

event clicked;//sle_port.text = "587"

end event

type rb_ssl from radiobutton within tabpage_2
integer x = 809
integer y = 652
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SSL"
end type

event clicked;//sle_port.text = "465"
end event

type rb_nin from radiobutton within tabpage_2
integer x = 809
integer y = 588
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ninguno"
end type

event clicked;//sle_port.text = "25"

end event

type dw_2 from datawindow within tabpage_2
integer x = 366
integer y = 24
integer width = 1431
integer height = 68
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_tipocorreo"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;dw_ips.setfilter("ctipo='"+data+"'")
dw_ips.filter()
if dw_ips.rowcount()>0 then 
	tab_1.tabpage_2.sle_server.text=dw_ips.getitemstring(1,'servidor')
	tab_1.tabpage_2.sle_port.text=dw_ips.getitemstring(1,'puerto')
	tab_1.tabpage_2.sle_userid.text=dw_ips.getitemstring(1,'usuario')
	if isnull(dw_ips.getitemstring(1,'clave')) then
		setnull(tab_1.tabpage_2.sle_password.text)
	else
		tab_1.tabpage_2.sle_password.text=f_descripta(dw_ips.getitemstring(1,'clave'))
	end if
	if dw_ips.getitemstring(1,'autentica')='S' then
		tab_1.tabpage_2.cbx_smtpauth.checked=true
	else
		tab_1.tabpage_2.cbx_smtpauth.checked=false
	end if
	CHOOSE CASE dw_ips.getitemstring(1,'conexion')
	CASE 'S'
		tab_1.tabpage_2.rb_ssl.checked = True
	CASE 'T'
		tab_1.tabpage_2.rb_tls.checked = True
	CASE 'N'
		tab_1.tabpage_2.rb_nin.checked = True
	END CHOOSE	
Else
	tab_1.tabpage_2.sle_server.text=''
	tab_1.tabpage_2.sle_port.text=''
	tab_1.tabpage_2.sle_userid.text=''
	tab_1.tabpage_2.sle_password.text=''
	tab_1.tabpage_2.cbx_smtpauth.checked=false
	tab_1.tabpage_2.rb_ssl.checked = false
	tab_1.tabpage_2.rb_tls.checked = false
	tab_1.tabpage_2.rb_nin.checked = false
End if
dw_ips.setfilter('')
dw_ips.filter()
end event

event retrieveend;if dw_ips.rowcount()>0 then 
	tab_1.tabpage_2.sle_server.text=dw_ips.getitemstring(1,'servidor')
	tab_1.tabpage_2.sle_port.text=dw_ips.getitemstring(1,'puerto')
	tab_1.tabpage_2.sle_userid.text=dw_ips.getitemstring(1,'usuario')
	tab_1.tabpage_2.sle_password.text=f_descripta(dw_ips.getitemstring(1,'clave'))
	if dw_ips.getitemstring(1,'autentica')='S' then
		tab_1.tabpage_2.cbx_smtpauth.checked=true
	else
		tab_1.tabpage_2.cbx_smtpauth.checked=false
	end if
	CHOOSE CASE dw_ips.getitemstring(1,'conexion')
	CASE 'S'
		tab_1.tabpage_2.rb_ssl.checked = True
	CASE 'T'
		tab_1.tabpage_2.rb_tls.checked = True
	CASE 'N'
		tab_1.tabpage_2.rb_nin.checked = True
	END CHOOSE	
End if
end event

type pb_4 from picturebutton within tabpage_2
string tag = "Ajuste Gmail"
integer x = 1563
integer y = 112
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "gmail.jpg"
string disabledname = "d_gmail.jpg"
alignment htextalign = left!
end type

event clicked;sle_server.text = "smtp.gmail.com"
sle_port.text = "465"
sle_userid.text = "myaddress@gmail.com"
sle_password.text = ""
cbx_smtpauth.checked = True
rb_ssl.checked = True
sle_userid.SetFocus()

end event

type pb_3 from picturebutton within tabpage_2
string tag = "Ajuste Office"
integer x = 1563
integer y = 252
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "out.jpg"
string disabledname = "d_out.jpg"
alignment htextalign = left!
end type

event clicked;sle_server.text = "smtp.office365.com"
sle_port.text = "587"
sle_userid.text = "myaddress@mydomain.com"
sle_password.text = ""
cbx_smtpauth.checked = True
rb_tls.checked = True
sle_userid.SetFocus()

end event

type st_25 from statictext within tabpage_2
integer x = 69
integer y = 592
integer width = 603
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo conexion cifrada"
boolean focusrectangle = false
end type

type cbx_smtpauth from checkbox within tabpage_2
integer x = 73
integer y = 492
integer width = 946
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "SMTP Requiere Autenticación"
end type

type sle_password from singlelineedit within tabpage_2
integer x = 512
integer y = 396
integer width = 846
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type st_19 from statictext within tabpage_2
integer x = 73
integer y = 396
integer width = 352
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Contraseña"
boolean focusrectangle = false
end type

type sle_userid from singlelineedit within tabpage_2
integer x = 512
integer y = 300
integer width = 846
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_18 from statictext within tabpage_2
integer x = 73
integer y = 300
integer width = 393
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre Usuario"
boolean focusrectangle = false
end type

type sle_port from singlelineedit within tabpage_2
integer x = 512
integer y = 208
integer width = 215
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_17 from statictext within tabpage_2
integer x = 73
integer y = 212
integer width = 366
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Puerto"
boolean focusrectangle = false
end type

type sle_server from singlelineedit within tabpage_2
integer x = 512
integer y = 112
integer width = 846
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_16 from statictext within tabpage_2
integer x = 73
integer y = 112
integer width = 384
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Servidor SMTP"
boolean focusrectangle = false
end type

type gb_3 from groupbox within tabpage_2
integer x = 773
integer y = 536
integer width = 549
integer height = 276
integer taborder = 120
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

