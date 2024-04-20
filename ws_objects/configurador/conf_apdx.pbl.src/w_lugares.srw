$PBExportHeader$w_lugares.srw
forward
global type w_lugares from window
end type
type tab_1 from tab within w_lugares
end type
type tp_1 from userobject within tab_1
end type
type dw_1 from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
dw_1 dw_1
end type
type tp_2 from userobject within tab_1
end type
type pb_10 from picturebutton within tp_2
end type
type pb_9 from picturebutton within tp_2
end type
type sle_password from singlelineedit within tp_2
end type
type sle_userid from singlelineedit within tp_2
end type
type sle_port from singlelineedit within tp_2
end type
type sle_server from singlelineedit within tp_2
end type
type dw_2 from datawindow within tp_2
end type
type st_1 from statictext within tp_2
end type
type st_16 from statictext within tp_2
end type
type st_17 from statictext within tp_2
end type
type st_18 from statictext within tp_2
end type
type st_19 from statictext within tp_2
end type
type cbx_smtpauth from checkbox within tp_2
end type
type st_25 from statictext within tp_2
end type
type rb_tls from radiobutton within tp_2
end type
type rb_nin from radiobutton within tp_2
end type
type rb_ssl from radiobutton within tp_2
end type
type dw_lug from datawindow within tp_2
end type
type gb_3 from groupbox within tp_2
end type
type tp_2 from userobject within tab_1
pb_10 pb_10
pb_9 pb_9
sle_password sle_password
sle_userid sle_userid
sle_port sle_port
sle_server sle_server
dw_2 dw_2
st_1 st_1
st_16 st_16
st_17 st_17
st_18 st_18
st_19 st_19
cbx_smtpauth cbx_smtpauth
st_25 st_25
rb_tls rb_tls
rb_nin rb_nin
rb_ssl rb_ssl
dw_lug dw_lug
gb_3 gb_3
end type
type tab_1 from tab within w_lugares
tp_1 tp_1
tp_2 tp_2
end type
type pb_8 from picturebutton within w_lugares
end type
type pb_7 from picturebutton within w_lugares
end type
type pb_6 from picturebutton within w_lugares
end type
type pb_5 from picturebutton within w_lugares
end type
type pb_4 from picturebutton within w_lugares
end type
type pb_3 from picturebutton within w_lugares
end type
type pb_2 from picturebutton within w_lugares
end type
type pb_1 from picturebutton within w_lugares
end type
end forward

global type w_lugares from window
integer width = 3099
integer height = 2020
boolean titlebar = true
string title = "Lugares de Atención"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "Query5!"
string pointer = "Arrow!"
event inicializa pbm_open
tab_1 tab_1
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
end type
global w_lugares w_lugares

type variables
string cemp,tipo_col,anterior,orden,i_cemp
datawindowchild docus,dwc_generico,dwc_gen2,dw_ccosto,idw_mcpio,dwc_postal
boolean i_cambio=false
end variables

forward prototypes
public subroutine inicializa ()
end prototypes

public subroutine inicializa ();tab_1.tp_1.dw_1.getchild("desciudad",docus)
docus.settransobject(sqlca)
docus.InsertRow(0)
tab_1.tp_1.dw_1.GetChild('cod_postal',dwc_postal)
dwc_postal.SetTransObject(SQLCA)
dwc_postal.InsertRow(0)

tab_1.tp_1.dw_1.settransobject(SQLCA)
tab_1.tp_1.dw_1.retrieve()

end subroutine

on w_lugares.create
this.tab_1=create tab_1
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.Control[]={this.tab_1,&
this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1}
end on

on w_lugares.destroy
destroy(this.tab_1)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
end on

event resize;tab_1.resize(newwidth - 100 , newheight - 180)
tab_1.tp_1.dw_1.resize(tab_1.width - 100 , tab_1.height - 150)

pb_1.x=(newwidth - 1800)/2
pb_1.y=newheight - 140
pb_2.x=(newwidth - 1800)/2 +300
pb_2.y=newheight - 140
pb_3.x=(newwidth - 1800)/2 +600
pb_3.y=newheight - 140
pb_4.x=(newwidth - 1800)/2 +900
pb_4.y=newheight - 140
pb_5.x=(newwidth - 1800)/2 +1200
pb_5.y=newheight - 140
pb_6.x=(newwidth - 1800)/2 +1500
pb_6.y=newheight - 140
pb_7.x=(newwidth - 1800)/2 +1500
pb_7.y=newheight - 140
pb_8.x=(newwidth - 1800)/2 +1500
pb_8.y=newheight - 140

end event

event open;tab_1.tp_1.dw_1.retrieve()
end event

type tab_1 from tab within w_lugares
event create ( )
event destroy ( )
integer x = 32
integer y = 24
integer width = 2981
integer height = 1732
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
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

event selectionchanged;if tab_1.tp_1.dw_1.rowcount()<0 then return
tab_1.tp_2.dw_2.retrieve()
tab_1.tp_2.dw_lug.retrieve(tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'codlugar'))
end event

type tp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2944
integer height = 1604
long backcolor = 67108864
string text = "Lugares"
long tabtextcolor = 33554432
string picturename = "ribon_postal.ico"
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tp_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tp_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tp_1
event keypres pbm_dwnkey
integer x = 37
integer y = 32
integer width = 2875
integer height = 1508
integer taborder = 20
string dragicon = "none!"
string dataobject = "dw_lugares"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event itemchanged;string nulo
string s_dpto,s_ciudad
setnull(nulo)

accepttext( )
choose case getcolumnname()
	case 'dpto' 
		docus.retrieve(getitemstring(getrow(),'dpto'))
	case 'desciudad'
		setitem(getrow(),'ciudad',docus.getitemstring(docus.getrow(),'codciudad'))
		s_dpto=getitemstring(row,'dpto')
		s_ciudad=docus.getitemstring(docus.getrow(),'codciudad')
		setitem(getrow(),'cciudad',docus.getitemstring(docus.getrow(),'codciudad'))
		dwc_postal.Retrieve(s_dpto,s_ciudad)
end choose
accepttext()


end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event rowfocuschanged;if this.getrow()<1 then return
accepttext()

if not isnull(tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'dpto')) then
	if docus.retrieve(tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'dpto'))>0 then
		dwc_postal.Retrieve(tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'dpto'),tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'ciudad'))		
	end if
else
	docus.reset()
	docus.insertrow(1)
end if
end event

event constructor;settransobject(sqlca)
end event

type tp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2944
integer height = 1604
long backcolor = 67108864
string text = "Correos"
long tabtextcolor = 33554432
string picturename = "email.ico"
long picturemaskcolor = 536870912
pb_10 pb_10
pb_9 pb_9
sle_password sle_password
sle_userid sle_userid
sle_port sle_port
sle_server sle_server
dw_2 dw_2
st_1 st_1
st_16 st_16
st_17 st_17
st_18 st_18
st_19 st_19
cbx_smtpauth cbx_smtpauth
st_25 st_25
rb_tls rb_tls
rb_nin rb_nin
rb_ssl rb_ssl
dw_lug dw_lug
gb_3 gb_3
end type

on tp_2.create
this.pb_10=create pb_10
this.pb_9=create pb_9
this.sle_password=create sle_password
this.sle_userid=create sle_userid
this.sle_port=create sle_port
this.sle_server=create sle_server
this.dw_2=create dw_2
this.st_1=create st_1
this.st_16=create st_16
this.st_17=create st_17
this.st_18=create st_18
this.st_19=create st_19
this.cbx_smtpauth=create cbx_smtpauth
this.st_25=create st_25
this.rb_tls=create rb_tls
this.rb_nin=create rb_nin
this.rb_ssl=create rb_ssl
this.dw_lug=create dw_lug
this.gb_3=create gb_3
this.Control[]={this.pb_10,&
this.pb_9,&
this.sle_password,&
this.sle_userid,&
this.sle_port,&
this.sle_server,&
this.dw_2,&
this.st_1,&
this.st_16,&
this.st_17,&
this.st_18,&
this.st_19,&
this.cbx_smtpauth,&
this.st_25,&
this.rb_tls,&
this.rb_nin,&
this.rb_ssl,&
this.dw_lug,&
this.gb_3}
end on

on tp_2.destroy
destroy(this.pb_10)
destroy(this.pb_9)
destroy(this.sle_password)
destroy(this.sle_userid)
destroy(this.sle_port)
destroy(this.sle_server)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.st_16)
destroy(this.st_17)
destroy(this.st_18)
destroy(this.st_19)
destroy(this.cbx_smtpauth)
destroy(this.st_25)
destroy(this.rb_tls)
destroy(this.rb_nin)
destroy(this.rb_ssl)
destroy(this.dw_lug)
destroy(this.gb_3)
end on

type pb_10 from picturebutton within tp_2
string tag = "Ajuste Gmail"
integer x = 1563
integer y = 112
integer width = 146
integer height = 128
integer taborder = 30
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

type pb_9 from picturebutton within tp_2
string tag = "Ajuste Office"
integer x = 1563
integer y = 252
integer width = 146
integer height = 128
integer taborder = 40
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

type sle_password from singlelineedit within tp_2
integer x = 512
integer y = 396
integer width = 846
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;i_cambio=true
end event

type sle_userid from singlelineedit within tp_2
integer x = 512
integer y = 300
integer width = 846
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_port from singlelineedit within tp_2
integer x = 512
integer y = 208
integer width = 215
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_server from singlelineedit within tp_2
integer x = 512
integer y = 112
integer width = 846
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

type dw_2 from datawindow within tp_2
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

event itemchanged;string ls_lugar
if tab_1.tp_1.dw_1.rowcount()=0 then return

ls_lugar=tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'codlugar')
dw_lug.setfilter("ctipo='"+data+"' and clugar='"+ls_lugar+"'")
dw_lug.filter()
if dw_lug.rowcount()>0 then 
	sle_server.text=dw_lug.getitemstring(1,'servidor')
	sle_port.text=dw_lug.getitemstring(1,'puerto')
	sle_userid.text=dw_lug.getitemstring(1,'usuario')
	if isnull(dw_lug.getitemstring(1,'clave')) then
		setnull(sle_password.text)
	else
		sle_password.text=f_descripta(dw_lug.getitemstring(1,'clave'))
	end if
	if dw_lug.getitemstring(1,'autentica')='S' then
		cbx_smtpauth.checked=true
	else
		cbx_smtpauth.checked=false
	end if
	CHOOSE CASE dw_lug.getitemstring(1,'conexion')
	CASE 'S'
		rb_ssl.checked = True
	CASE 'T'
		rb_tls.checked = True
	CASE 'N'
		rb_nin.checked = True
	END CHOOSE	
Else
	sle_server.text=''
	sle_port.text=''
	sle_userid.text=''
	sle_password.text=''
	cbx_smtpauth.checked=false
	rb_ssl.checked = false
	rb_tls.checked = false
	rb_nin.checked = false
End if
//dw_lug.setfilter('')
//dw_lug.filter()
end event

event retrieveend;if dw_lug.rowcount()>0 then 
	sle_server.text=dw_lug.getitemstring(1,'servidor')
	sle_port.text=dw_lug.getitemstring(1,'puerto')
	sle_userid.text=dw_lug.getitemstring(1,'usuario')
	sle_password.text=f_descripta(dw_lug.getitemstring(1,'clave'))
	if dw_lug.getitemstring(1,'autentica')='S' then
		cbx_smtpauth.checked=true
	else
		cbx_smtpauth.checked=false
	end if
	CHOOSE CASE dw_lug.getitemstring(1,'conexion')
	CASE 'S'
		rb_ssl.checked = True
	CASE 'T'
		rb_tls.checked = True
	CASE 'N'
		rb_nin.checked = True
	END CHOOSE	
End if
end event

type st_1 from statictext within tp_2
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

type st_16 from statictext within tp_2
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

type st_17 from statictext within tp_2
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

type st_18 from statictext within tp_2
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

type st_19 from statictext within tp_2
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

type cbx_smtpauth from checkbox within tp_2
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

type st_25 from statictext within tp_2
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

type rb_tls from radiobutton within tp_2
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

type rb_nin from radiobutton within tp_2
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

type rb_ssl from radiobutton within tp_2
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

type dw_lug from datawindow within tp_2
boolean visible = false
integer x = 1888
integer y = 36
integer width = 873
integer height = 916
integer taborder = 20
string title = "none"
string dataobject = "dw_lugar_correos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type gb_3 from groupbox within tp_2
integer x = 773
integer y = 536
integer width = 549
integer height = 276
integer taborder = 130
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_8 from picturebutton within w_lugares
boolean visible = false
integer x = 2016
integer y = 1772
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_7 from picturebutton within w_lugares
string tag = "Unifica Profesionales"
boolean visible = false
integer x = 1842
integer y = 1772
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "elimi_pac.gif"
alignment htextalign = left!
string powertiptext = "Unifica Profesionales"
end type

event clicked;st_usuarios l_prof 
l_prof.usuario=tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(), 'codprof') 
l_prof.destino='profe'
l_prof.clave= tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(), 'nombre1') +' '+tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(), 'apellido1')
open(w_borra_prof_rep)

end event

type pb_6 from picturebutton within w_lugares
string tag = "Im&portar"
integer x = 1664
integer y = 1772
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "import.gif"
string disabledname = "d_import.gif"
alignment htextalign = left!
end type

event clicked;string docname, named
long value
value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
IF value = 1 THEN
	value=tab_1.tp_1.dw_1.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
end event

type pb_5 from picturebutton within w_lugares
string tag = "Exportar"
integer x = 1490
integer y = 1772
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
end type

event clicked;openwithparm(w_export,tab_1.tp_1.dw_1)
end event

type pb_4 from picturebutton within w_lugares
string tag = "Guardar"
integer x = 1317
integer y = 1772
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
end type

event clicked;tab_1.tp_1.dw_1.accepttext()
if tab_1.tp_1.dw_1.update(true,false)<1 then
	rollback;
else
	commit;
	tab_1.tp_1.dw_1.resetupdate()
end if

tab_1.tp_2.dw_lug.setfilter("ctipo='"+tab_1.tp_2.dw_2.getitemstring(1,'ctipo')+"'")
tab_1.tp_2.dw_lug.filter()
if tab_1.tp_2.dw_lug.rowcount()=0 then 
	tab_1.tp_2.dw_lug.insertrow(1)	
	tab_1.tp_2.dw_lug.setitem(1,'clugar',tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'codlugar'))
	tab_1.tp_2.dw_lug.setitem(1,'ctipo',tab_1.tp_2.dw_2.getitemstring(1,'ctipo'))
end if
tab_1.tp_2.dw_lug.setitem(1,'servidor',tab_1.tp_2.sle_server.text)
tab_1.tp_2.dw_lug.setitem(1,'puerto',tab_1.tp_2.sle_port.text)
tab_1.tp_2.dw_lug.setitem(1,'usuario',tab_1.tp_2.sle_userid.text)
if not isnull(tab_1.tp_2.sle_password.text) and len(tab_1.tp_2.sle_password.text)>0  then
	if i_cambio then 
		tab_1.tp_2.dw_lug.setitem(1,'clave',f_encripta_new(tab_1.tp_2.sle_password.text))
	end if
end if
if tab_1.tp_2.cbx_smtpauth.checked=true then
	tab_1.tp_2.dw_lug.setitem(1,'autentica','S')
else
	tab_1.tp_2.dw_lug.setitem(1,'autentica','N')
end if
if tab_1.tp_2.rb_ssl.checked = True then
	tab_1.tp_2.dw_lug.setitem(1,'conexion','S')
end if
if tab_1.tp_2.rb_tls.checked = True then
	tab_1.tp_2.dw_lug.setitem(1,'conexion','T')
end if	
if tab_1.tp_2.rb_nin.checked = True then
	tab_1.tp_2.dw_lug.setitem(1,'conexion','N')
end if	
if tab_1.tp_2.dw_lug.update(true,false)<1 then
	rollback;
else
	commit;
	tab_1.tp_2.dw_lug.resetupdate()
end if
tab_1.tp_2.dw_lug.setfilter('')
tab_1.tp_2.dw_lug.filter()
end event

type pb_3 from picturebutton within w_lugares
string tag = "Refrescar"
integer x = 1143
integer y = 1772
integer width = 146
integer height = 128
integer taborder = 80
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

event clicked;tab_1.tp_1.dw_1.retrieve()
end event

type pb_2 from picturebutton within w_lugares
string tag = "Borrar"
integer x = 969
integer y = 1772
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;tab_1.tp_1.dw_1.deleterow(0)
end event

type pb_1 from picturebutton within w_lugares
string tag = "Insertar"
integer x = 795
integer y = 1772
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
end type

event clicked;tab_1.tp_1.dw_1.scrolltorow(tab_1.tp_1.dw_1.insertrow(0))
tab_1.tp_1.dw_1.setfocus()
	

end event

