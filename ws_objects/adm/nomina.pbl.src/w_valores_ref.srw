$PBExportHeader$w_valores_ref.srw
forward
global type w_valores_ref from window
end type
type tab_1 from tab within w_valores_ref
end type
type t_rf from userobject within tab_1
end type
type dw_1 from datawindow within t_rf
end type
type t_rf from userobject within tab_1
dw_1 dw_1
end type
type t_fs from userobject within tab_1
end type
type dw_3 from datawindow within t_fs
end type
type st_1 from statictext within t_fs
end type
type dw_2 from datawindow within t_fs
end type
type t_fs from userobject within tab_1
dw_3 dw_3
st_1 st_1
dw_2 dw_2
end type
type tab_email from userobject within tab_1
end type
type dw_ips from datawindow within tab_email
end type
type pb_4 from picturebutton within tab_email
end type
type pb_3 from picturebutton within tab_email
end type
type st_25 from statictext within tab_email
end type
type cbx_smtpauth from checkbox within tab_email
end type
type sle_password from singlelineedit within tab_email
end type
type st_19 from statictext within tab_email
end type
type sle_userid from singlelineedit within tab_email
end type
type st_18 from statictext within tab_email
end type
type sle_port from singlelineedit within tab_email
end type
type st_17 from statictext within tab_email
end type
type sle_server from singlelineedit within tab_email
end type
type st_16 from statictext within tab_email
end type
type gb_3 from groupbox within tab_email
end type
type tab_email from userobject within tab_1
dw_ips dw_ips
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
type tab_1 from tab within w_valores_ref
t_rf t_rf
t_fs t_fs
tab_email tab_email
end type
type pb_1 from picturebutton within w_valores_ref
end type
type pb_2 from picturebutton within w_valores_ref
end type
type pb_5 from picturebutton within w_valores_ref
end type
end forward

global type w_valores_ref from window
integer width = 5403
integer height = 1932
boolean titlebar = true
string title = "Nómina - Valores de Referencia"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_crequisitos.ico"
tab_1 tab_1
pb_1 pb_1
pb_2 pb_2
pb_5 pb_5
end type
global w_valores_ref w_valores_ref

type variables
boolean cambio
end variables

event open;tab_1.t_rf.dw_1.Retrieve()

end event

on w_valores_ref.create
this.tab_1=create tab_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_5=create pb_5
this.Control[]={this.tab_1,&
this.pb_1,&
this.pb_2,&
this.pb_5}
end on

on w_valores_ref.destroy
destroy(this.tab_1)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_5)
end on

type tab_1 from tab within w_valores_ref
event create ( )
event destroy ( )
integer x = 32
integer y = 28
integer width = 5330
integer height = 1628
integer taborder = 20
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
t_rf t_rf
t_fs t_fs
tab_email tab_email
end type

on tab_1.create
this.t_rf=create t_rf
this.t_fs=create t_fs
this.tab_email=create tab_email
this.Control[]={this.t_rf,&
this.t_fs,&
this.tab_email}
end on

on tab_1.destroy
destroy(this.t_rf)
destroy(this.t_fs)
destroy(this.tab_email)
end on

event selectionchanged;tab_1.t_fs.dw_3.retrieve()
tab_1.t_fs.dw_2.retrieve(year(today()))

end event

type t_rf from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5294
integer height = 1500
long backcolor = 67108864
string text = "Referencia"
long tabtextcolor = 33554432
string picturename = "referencia.ico"
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on t_rf.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on t_rf.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within t_rf
integer x = 14
integer y = 20
integer width = 5248
integer height = 1452
integer taborder = 30
string title = "none"
string dataobject = "dw_valores_ref"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type t_fs from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5294
integer height = 1500
long backcolor = 67108864
string text = "Fondo Solidaridad"
long tabtextcolor = 33554432
string picturename = "factura.ico"
long picturemaskcolor = 536870912
dw_3 dw_3
st_1 st_1
dw_2 dw_2
end type

on t_fs.create
this.dw_3=create dw_3
this.st_1=create st_1
this.dw_2=create dw_2
this.Control[]={this.dw_3,&
this.st_1,&
this.dw_2}
end on

on t_fs.destroy
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.dw_2)
end on

type dw_3 from datawindow within t_fs
integer x = 174
integer y = 28
integer width = 256
integer height = 88
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_anoref"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)


end event

event itemchanged;dw_2.retrieve(integer(data))
dw_2.setfocus()
end event

type st_1 from statictext within t_fs
integer x = 46
integer y = 32
integer width = 119
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
boolean focusrectangle = false
end type

type dw_2 from datawindow within t_fs
integer x = 41
integer y = 156
integer width = 1445
integer height = 1192
integer taborder = 30
string title = "none"
string dataobject = "dw_valores_ref_fs"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type tab_email from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 112
integer width = 5294
integer height = 1500
boolean enabled = false
long backcolor = 67108864
string text = "Ajustes Correo"
long tabtextcolor = 33554432
string picturename = "ajuste.ico"
long picturemaskcolor = 536870912
dw_ips dw_ips
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

on tab_email.create
this.dw_ips=create dw_ips
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
this.Control[]={this.dw_ips,&
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

on tab_email.destroy
destroy(this.dw_ips)
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

type dw_ips from datawindow within tab_email
boolean visible = false
integer x = 1897
integer y = 56
integer width = 270
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dw_ips"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//if isvalid(w_principal) then
//	string l_servidor, l_puerto,l_usuario,l_clave,l_autentica,l_conexion
//
//	settransobject(sqlca)
//	retrieve()
//	if rowcount()>0 then 
//		tab_1.tp_gral.tab_4.tabpage_3.sle_server.text=dw_ips.getitemstring(1,'servidor')
//		tab_1.tp_gral.tab_4.tabpage_3.sle_port.text=dw_ips.getitemstring(1,'puerto')
//		tab_1.tp_gral.tab_4.tabpage_3.sle_userid.text=dw_ips.getitemstring(1,'usuario')
//		tab_1.tp_gral.tab_4.tabpage_3.sle_password.text=f_descripta(dw_ips.getitemstring(1,'clave'))
//		if dw_ips.getitemstring(1,'autentica')='S' then
//			tab_1.tp_gral.tab_4.tabpage_3.cbx_smtpauth.checked=true
//		else
//			tab_1.tp_gral.tab_4.tabpage_3.cbx_smtpauth.checked=false
//		end if
//		CHOOSE CASE dw_ips.getitemstring(1,'conexion')
//		CASE 'S'
//			tab_1.tp_gral.tab_4.tabpage_3.rb_ssl.checked = True
//		CASE 'T'
//			tab_1.tp_gral.tab_4.tabpage_3.rb_tls.checked = True
//		CASE 'N'
//			tab_1.tp_gral.tab_4.tabpage_3.rb_nin.checked = True
//		END CHOOSE	
//	End If
//end if
end event

type pb_4 from picturebutton within tab_email
string tag = "Ajuste Gmail"
integer x = 1573
integer y = 52
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "gmail.jpg"
alignment htextalign = left!
end type

event clicked;//sle_server.text = "smtp.gmail.com"
//sle_port.text = "465"
//sle_userid.text = "myaddress@gmail.com"
//sle_password.text = ""
//cbx_smtpauth.checked = True
//rb_ssl.checked = True
//sle_userid.SetFocus()
//
end event

type pb_3 from picturebutton within tab_email
string tag = "Ajuste Office"
integer x = 1573
integer y = 192
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "out.jpg"
alignment htextalign = left!
end type

event clicked;//sle_server.text = "smtp.office365.com"
//sle_port.text = "587"
//sle_userid.text = "myaddress@mydomain.com"
//sle_password.text = ""
//cbx_smtpauth.checked = True
//rb_tls.checked = True
//sle_userid.SetFocus()
//
end event

type st_25 from statictext within tab_email
integer x = 78
integer y = 532
integer width = 603
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo conexion cifrada"
boolean focusrectangle = false
end type

type cbx_smtpauth from checkbox within tab_email
integer x = 82
integer y = 432
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

type sle_password from singlelineedit within tab_email
integer x = 521
integer y = 336
integer width = 846
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type st_19 from statictext within tab_email
integer x = 82
integer y = 336
integer width = 457
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

type sle_userid from singlelineedit within tab_email
integer x = 521
integer y = 240
integer width = 846
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_18 from statictext within tab_email
integer x = 82
integer y = 240
integer width = 453
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

type sle_port from singlelineedit within tab_email
integer x = 521
integer y = 148
integer width = 215
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_17 from statictext within tab_email
integer x = 82
integer y = 152
integer width = 457
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

type sle_server from singlelineedit within tab_email
integer x = 521
integer y = 52
integer width = 846
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_16 from statictext within tab_email
integer x = 82
integer y = 52
integer width = 489
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

type gb_3 from groupbox within tab_email
integer x = 782
integer y = 484
integer width = 549
integer height = 316
integer taborder = 120
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_1 from picturebutton within w_valores_ref
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 1879
integer y = 1696
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
string text = "                $n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar"
end type

event clicked;long fila
string valor
if tab_1.selectedtab=1 then
	valor = tab_1.t_rf.dw_1.Describe("Evaluate('max(item)',0)")
	if isnull(valor) then valor='0'
	fila = tab_1.t_rf.dw_1.InsertRow(0)
	tab_1.t_rf.dw_1.SetItem(fila,'item',long(valor) + 1)
	tab_1.t_rf.dw_1.ScrolltoRow(fila)
else
	valor = tab_1.t_fs.dw_2.Describe("Evaluate('max(item)',0)")
	if isnull(valor) then valor='0'
	fila = tab_1.t_fs.dw_2.InsertRow(0)
	tab_1.t_fs.dw_2.SetItem(fila,'item',long(valor) + 1)
	tab_1.t_fs.dw_2.ScrolltoRow(fila)
end if
cambio = TRUE

end event

type pb_2 from picturebutton within w_valores_ref
event mousemove pbm_mousemove
string tag = "&Eliminar Concepto"
integer x = 2025
integer y = 1696
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
string text = "                $n"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Fila"
end type

event clicked;if tab_1.selectedtab=1 then
	if tab_1.t_rf.dw_1.RowCount() > 0 then
		if tab_1.t_rf.dw_1.GetItemStatus(tab_1.t_rf.dw_1.GetRow(),0,Primary!) = NewModified! then
			tab_1.t_rf.dw_1.DeleteRow(tab_1.t_rf.dw_1.GetRow())
			cambio = TRUE
		else
			MessageBox('Atención','Solo puede borrar registros nuevos')
		end if
	end if
else
	if tab_1.t_fs.dw_2.RowCount() > 0 then
		if tab_1.t_fs.dw_2.GetItemStatus(tab_1.t_fs.dw_2.GetRow(),0,Primary!) = NewModified! then
			tab_1.t_fs.dw_2.DeleteRow(tab_1.t_fs.dw_2.GetRow())
			cambio = TRUE
		else
			MessageBox('Atención','Solo puede borrar registros nuevos')
		end if
	end if
end if
end event

type pb_5 from picturebutton within w_valores_ref
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 2171
integer y = 1696
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
string text = "                $n"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Grabar"
end type

event clicked;long fila
fila = long(tab_1.t_rf.dw_1.Describe("Evaluate('sum(if(estado=~~'1~~',1,0))',0)"))
if fila > 1 or fila = 0 then
	MessageBox('Atención','Debe existir un solo registro ACTIVO en Referencia')
	Return 0
end if
if tab_1.t_rf.dw_1.Update() = -1 then
	Rollback;
	Return -1
end if
if tab_1.t_fs.dw_2.Update() = -1 then
	Rollback;
	Return -1
end if

end event

