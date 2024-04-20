$PBExportHeader$w_recuerda_citas.srw
forward
global type w_recuerda_citas from window
end type
type tab_1 from tab within w_recuerda_citas
end type
type r_citas from userobject within tab_1
end type
type rte_1 from richtextedit within r_citas
end type
type pb_camp from picturebutton within r_citas
end type
type dw_2 from datawindow within r_citas
end type
type r_citas from userobject within tab_1
rte_1 rte_1
pb_camp pb_camp
dw_2 dw_2
end type
type r_acitas from userobject within tab_1
end type
type rte_2 from richtextedit within r_acitas
end type
type pb_camp1 from picturebutton within r_acitas
end type
type dw_3 from datawindow within r_acitas
end type
type r_acitas from userobject within tab_1
rte_2 rte_2
pb_camp1 pb_camp1
dw_3 dw_3
end type
type ajustes from userobject within tab_1
end type
type gb_3 from groupbox within ajustes
end type
type pb_2 from picturebutton within ajustes
end type
type pb_1 from picturebutton within ajustes
end type
type sle_password from singlelineedit within ajustes
end type
type sle_userid from singlelineedit within ajustes
end type
type sle_port from singlelineedit within ajustes
end type
type sle_server from singlelineedit within ajustes
end type
type st_5 from statictext within ajustes
end type
type cbx_smtpauth from checkbox within ajustes
end type
type st_4 from statictext within ajustes
end type
type st_3 from statictext within ajustes
end type
type st_2 from statictext within ajustes
end type
type st_1 from statictext within ajustes
end type
type gb_2 from groupbox within ajustes
end type
type rb_ssl from radiobutton within ajustes
end type
type rb_nin from radiobutton within ajustes
end type
type rb_tls from radiobutton within ajustes
end type
type ajustes from userobject within tab_1
gb_3 gb_3
pb_2 pb_2
pb_1 pb_1
sle_password sle_password
sle_userid sle_userid
sle_port sle_port
sle_server sle_server
st_5 st_5
cbx_smtpauth cbx_smtpauth
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
gb_2 gb_2
rb_ssl rb_ssl
rb_nin rb_nin
rb_tls rb_tls
end type
type tab_1 from tab within w_recuerda_citas
r_citas r_citas
r_acitas r_acitas
ajustes ajustes
end type
type pb_8 from picturebutton within w_recuerda_citas
end type
type st_7 from statictext within w_recuerda_citas
end type
type dw_1 from datawindow within w_recuerda_citas
end type
end forward

global type w_recuerda_citas from window
integer width = 4599
integer height = 1940
boolean titlebar = true
string title = "Recordatorios de Citas"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_recuerda.ico"
tab_1 tab_1
pb_8 pb_8
st_7 st_7
dw_1 dw_1
end type
global w_recuerda_citas w_recuerda_citas

type variables
boolean i_cambio=false
Long il_DragSource, il_DragParent, il_Droptarget, il_rclick
integer FileNum
string i_cplant,i_operacion
uo_datastore i_dw_ing_qx
datawindowchild dwc_f

end variables

on w_recuerda_citas.create
this.tab_1=create tab_1
this.pb_8=create pb_8
this.st_7=create st_7
this.dw_1=create dw_1
this.Control[]={this.tab_1,&
this.pb_8,&
this.st_7,&
this.dw_1}
end on

on w_recuerda_citas.destroy
destroy(this.tab_1)
destroy(this.pb_8)
destroy(this.st_7)
destroy(this.dw_1)
end on

type tab_1 from tab within w_recuerda_citas
event create ( )
event destroy ( )
integer x = 37
integer y = 140
integer width = 4270
integer height = 1592
integer taborder = 30
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
r_citas r_citas
r_acitas r_acitas
ajustes ajustes
end type

on tab_1.create
this.r_citas=create r_citas
this.r_acitas=create r_acitas
this.ajustes=create ajustes
this.Control[]={this.r_citas,&
this.r_acitas,&
this.ajustes}
end on

on tab_1.destroy
destroy(this.r_citas)
destroy(this.r_acitas)
destroy(this.ajustes)
end on

type r_citas from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4233
integer height = 1464
long backcolor = 67108864
string text = "Recordatorio Cita"
long tabtextcolor = 33554432
string picturename = "mensa.jpg"
long picturemaskcolor = 536870912
rte_1 rte_1
pb_camp pb_camp
dw_2 dw_2
end type

on r_citas.create
this.rte_1=create rte_1
this.pb_camp=create pb_camp
this.dw_2=create dw_2
this.Control[]={this.rte_1,&
this.pb_camp,&
this.dw_2}
end on

on r_citas.destroy
destroy(this.rte_1)
destroy(this.pb_camp)
destroy(this.dw_2)
end on

type rte_1 from richtextedit within r_citas
integer x = 1682
integer y = 100
integer width = 2473
integer height = 1228
integer taborder = 20
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

type pb_camp from picturebutton within r_citas
integer x = 1467
integer y = 112
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string powertiptext = "Insertar Campo"
end type

event clicked;if isnull(dw_1.getitemstring(1,1)) then 
	messagebox('Atención','Seleccione el lugar')
	return
end if
rte_1.InputFieldInsert ( tab_1.r_citas.dw_2.getitemstring(tab_1.r_citas.dw_2.getrow(),'cod_campo'))
rte_1.SetFocus()
end event

type dw_2 from datawindow within r_citas
integer x = 73
integer y = 116
integer width = 1330
integer height = 1224
integer taborder = 70
string title = "none"
string dataobject = "dw_campos_recuerda_cita"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;object.cod_campo.width=200
end event

event doubleclicked;if row<1 then return
pb_camp.event clicked()



end event

type r_acitas from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4233
integer height = 1464
long backcolor = 67108864
string text = "Recordatrio Anulación"
long tabtextcolor = 33554432
string picturename = "mensa.jpg"
long picturemaskcolor = 536870912
rte_2 rte_2
pb_camp1 pb_camp1
dw_3 dw_3
end type

on r_acitas.create
this.rte_2=create rte_2
this.pb_camp1=create pb_camp1
this.dw_3=create dw_3
this.Control[]={this.rte_2,&
this.pb_camp1,&
this.dw_3}
end on

on r_acitas.destroy
destroy(this.rte_2)
destroy(this.pb_camp1)
destroy(this.dw_3)
end on

type rte_2 from richtextedit within r_acitas
integer x = 1481
integer y = 100
integer width = 2674
integer height = 1228
integer taborder = 90
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type pb_camp1 from picturebutton within r_acitas
integer x = 1294
integer y = 128
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string powertiptext = "Insertar Campo"
end type

event clicked;if isnull(dw_1.getitemstring(1,1)) then 
	messagebox('Atención','Seleccione el lugar')
	return
end if
rte_2.InputFieldInsert ( tab_1.r_acitas.dw_3.getitemstring(tab_1.r_acitas.dw_3.getrow(),'cod_campo'))
rte_2.SetFocus()
end event

type dw_3 from datawindow within r_acitas
integer x = 73
integer y = 116
integer width = 1184
integer height = 1224
integer taborder = 30
string title = "none"
string dataobject = "dw_campos_recuerda_cita"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;object.cod_campo.width=200
end event

event doubleclicked;if row<1 then return
pb_camp1.event clicked()
end event

type ajustes from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4233
integer height = 1464
long backcolor = 67108864
string text = "Ajustes"
long tabtextcolor = 33554432
string picturename = "ajuste.jpg"
long picturemaskcolor = 536870912
gb_3 gb_3
pb_2 pb_2
pb_1 pb_1
sle_password sle_password
sle_userid sle_userid
sle_port sle_port
sle_server sle_server
st_5 st_5
cbx_smtpauth cbx_smtpauth
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
gb_2 gb_2
rb_ssl rb_ssl
rb_nin rb_nin
rb_tls rb_tls
end type

on ajustes.create
this.gb_3=create gb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.sle_password=create sle_password
this.sle_userid=create sle_userid
this.sle_port=create sle_port
this.sle_server=create sle_server
this.st_5=create st_5
this.cbx_smtpauth=create cbx_smtpauth
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_2=create gb_2
this.rb_ssl=create rb_ssl
this.rb_nin=create rb_nin
this.rb_tls=create rb_tls
this.Control[]={this.gb_3,&
this.pb_2,&
this.pb_1,&
this.sle_password,&
this.sle_userid,&
this.sle_port,&
this.sle_server,&
this.st_5,&
this.cbx_smtpauth,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.gb_2,&
this.rb_ssl,&
this.rb_nin,&
this.rb_tls}
end on

on ajustes.destroy
destroy(this.gb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.sle_password)
destroy(this.sle_userid)
destroy(this.sle_port)
destroy(this.sle_server)
destroy(this.st_5)
destroy(this.cbx_smtpauth)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.rb_ssl)
destroy(this.rb_nin)
destroy(this.rb_tls)
end on

type gb_3 from groupbox within ajustes
integer x = 722
integer y = 752
integer width = 549
integer height = 324
integer taborder = 100
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_2 from picturebutton within ajustes
string tag = "Ajuste Office"
integer x = 1751
integer y = 256
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "out.jpg"
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

type pb_1 from picturebutton within ajustes
string tag = "Ajuste Gmail"
integer x = 1751
integer y = 116
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "gmail.jpg"
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

type sle_password from singlelineedit within ajustes
integer x = 576
integer y = 524
integer width = 846
integer height = 84
integer taborder = 90
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified; i_cambio=true
end event

type sle_userid from singlelineedit within ajustes
integer x = 576
integer y = 388
integer width = 846
integer height = 84
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_port from singlelineedit within ajustes
integer x = 576
integer y = 272
integer width = 215
integer height = 80
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_server from singlelineedit within ajustes
integer x = 576
integer y = 152
integer width = 846
integer height = 80
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within ajustes
integer x = 137
integer y = 800
integer width = 667
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

type cbx_smtpauth from checkbox within ajustes
integer x = 137
integer y = 664
integer width = 946
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "SMTP Requiere Autenticación"
end type

type st_4 from statictext within ajustes
integer x = 137
integer y = 524
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Contraseña"
boolean focusrectangle = false
end type

type st_3 from statictext within ajustes
integer x = 137
integer y = 388
integer width = 453
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre Usuario"
boolean focusrectangle = false
end type

type st_2 from statictext within ajustes
integer x = 137
integer y = 276
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Puerto"
boolean focusrectangle = false
end type

type st_1 from statictext within ajustes
integer x = 137
integer y = 152
integer width = 489
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Servidor SMTP"
boolean focusrectangle = false
end type

type gb_2 from groupbox within ajustes
integer x = 59
integer y = 28
integer width = 1618
integer height = 1092
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_ssl from radiobutton within ajustes
integer x = 754
integer y = 896
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SSL"
end type

event clicked;sle_port.text = "465"
end event

type rb_nin from radiobutton within ajustes
integer x = 754
integer y = 820
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ninguno"
end type

event clicked;sle_port.text = "25"

end event

type rb_tls from radiobutton within ajustes
integer x = 754
integer y = 976
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TLS"
end type

event clicked;sle_port.text = "587"

end event

type pb_8 from picturebutton within w_recuerda_citas
integer x = 1614
integer y = 8
integer width = 142
integer height = 124
integer taborder = 20
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
boolean flatstyle = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;blob citas,acitas
string lug,l_servidor, l_puerto,l_usuario,l_clave,l_autentica,l_conexion

if isnull(dw_1.getitemstring(1,1)) then return
lug=dw_1.getitemstring(1,1)

citas=blob(tab_1.r_citas.rte_1.copyrtf(false,detail!))
acitas=blob(tab_1.r_acitas.rte_2.copyrtf(false,detail!))
sqlca.autocommit=true
if not isnull(citas) then
	updateblob lugar set record_citas=:citas where codlugar=:lug;
	if sqlca.sqlcode=-1 then 	messagebox('Error actualizando lugar.record_citas',sqlca.sqlerrtext)
end if
if not isnull(acitas) then
	updateblob lugar set recor_anul_cita=:acitas where codlugar=:lug;
	if sqlca.sqlcode=-1 then 	messagebox('Error actualizando lugar.record_citas_anula',sqlca.sqlerrtext)
end if

l_servidor=tab_1.ajustes.sle_server.text
l_puerto=tab_1.ajustes.sle_port.text
l_usuario=tab_1.ajustes.sle_userid.text
l_clave=f_encripta(tab_1.ajustes.sle_password.text)
if tab_1.ajustes.cbx_smtpauth.checked then
	l_autentica='S'
else
	l_autentica='N'
end if

if 	tab_1.ajustes.rb_ssl.checked = True then l_conexion='S'
if 	tab_1.ajustes.rb_tls.checked = True then l_conexion='T'
if 	tab_1.ajustes.rb_nin.checked = True then l_conexion='N'
update lugar set servidor= :l_servidor, puerto=:l_puerto, usuario=:l_usuario,clave=:l_clave, autentica=:l_autentica, conexion=:l_conexion
WHERE codlugar=:lug;
if sqlca.sqlcode=-1 then 	messagebox('Error actualizando lugar ajustes',sqlca.sqlerrtext)
sqlca.autocommit=false


end event

type st_7 from statictext within w_recuerda_citas
integer x = 41
integer y = 44
integer width = 197
integer height = 52
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_recuerda_citas
integer x = 247
integer y = 24
integer width = 1294
integer height = 80
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;blob citas,acitas
string l_servidor, l_puerto,l_usuario,l_clave,l_autentica,l_conexion
sqlca.autocommit=true
selectblob record_citas into :citas from lugar where codlugar=:data;
if sqlca.sqlcode=-1 then 	messagebox('Error leyendo lugar record_citas',sqlca.sqlerrtext)
if isnull(citas) then citas=blob('')
selectblob recor_anul_cita into :acitas from lugar where codlugar=:data;
if sqlca.sqlcode=-1 then 	messagebox('Error leyendo lugar record_citas',sqlca.sqlerrtext)
if isnull(acitas) then acitas=blob('')
sqlca.autocommit=false
f_pega_a_rtf(tab_1.r_citas.rte_1,string(citas),3)
f_pega_a_rtf(tab_1.r_acitas.rte_2,string(acitas),3)

SELECT servidor, puerto, usuario, clave, autentica, conexion into 
 :l_servidor, :l_puerto,:l_usuario,:l_clave,:l_autentica,:l_conexion
FROM lugar
WHERE codlugar=:data;
if sqlca.sqlcode=-1 then 	messagebox('Error leyendo lugar ajustes',sqlca.sqlerrtext)

tab_1.ajustes.sle_server.text=l_servidor
tab_1.ajustes.sle_port.text=l_puerto
tab_1.ajustes.sle_userid.text=l_usuario
tab_1.ajustes.sle_password.text=f_descripta(l_clave)
if l_autentica='S' then
	tab_1.ajustes.cbx_smtpauth.checked =true
else
	tab_1.ajustes.cbx_smtpauth.checked =false
end if

CHOOSE CASE  l_conexion
CASE 'S'
	tab_1.ajustes.rb_ssl.checked = True
CASE 'T'
	tab_1.ajustes.rb_tls.checked = True
CASE 'N'
	tab_1.ajustes.rb_nin.checked = True
END CHOOSE	
end event

