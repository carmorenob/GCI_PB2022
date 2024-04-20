$PBExportHeader$w_conecta.srw
forward
global type w_conecta from window
end type
type st_2 from statictext within w_conecta
end type
type st_1 from statictext within w_conecta
end type
type pb_cancel from picturebutton within w_conecta
end type
type pb_aceptar from picturebutton within w_conecta
end type
type sle_passwd from singlelineedit within w_conecta
end type
type sle_usuario from singlelineedit within w_conecta
end type
type gb_1 from groupbox within w_conecta
end type
type gb_2 from groupbox within w_conecta
end type
end forward

global type w_conecta from window
integer x = 302
integer y = 300
integer width = 1605
integer height = 664
boolean titlebar = true
string title = "GCI Ltda. Conexión a Base de Datos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "DataPipeline!"
string pointer = "Arrow!"
st_2 st_2
st_1 st_1
pb_cancel pb_cancel
pb_aceptar pb_aceptar
sle_passwd sle_passwd
sle_usuario sle_usuario
gb_1 gb_1
gb_2 gb_2
end type
global w_conecta w_conecta

type variables
long alto,ancho
end variables

on w_conecta.create
this.st_2=create st_2
this.st_1=create st_1
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.sle_passwd=create sle_passwd
this.sle_usuario=create sle_usuario
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_2,&
this.st_1,&
this.pb_cancel,&
this.pb_aceptar,&
this.sle_passwd,&
this.sle_usuario,&
this.gb_1,&
this.gb_2}
end on

on w_conecta.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.sle_passwd)
destroy(this.sle_usuario)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;environment env
integer rtn
rtn = GetEnvironment(env)
IF rtn <> 1 THEN RETURN
alto=pixelstounits(env.ScreenHeight,yPixelsToUnits! 	)
ancho=pixelstounits(env.ScreenWidth,XPixelsToUnits! )
this.x=(ancho/2)-this.width/2
this.y=(alto/2)-this.height/2
if env.ScreenHeight < 600 then
	if messagebox("Atención","La resolución del monitor es menor de 800 x 600, Desea continuar de todas formas?" ,Question!,YesNo! )=2 then 
		close(this)
	end if
end if
	
end event

type st_2 from statictext within w_conecta
integer x = 242
integer y = 228
integer width = 320
integer height = 64
string dragicon = "none!"
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contraseña:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_conecta
integer x = 210
integer y = 80
integer width = 293
integer height = 88
string dragicon = "none!"
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuario:"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_conecta
integer x = 795
integer y = 420
integer width = 402
integer height = 108
integer taborder = 40
string dragicon = "none!"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Cancelar"
boolean cancel = true
boolean originalsize = true
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_conecta
integer x = 311
integer y = 420
integer width = 384
integer height = 108
integer taborder = 30
string dragicon = "none!"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Aceptar"
boolean default = true
boolean originalsize = true
end type

event clicked;//ojo en REGEDIT debe ir: 	en DBMS:    ODBC
//									en DBPARM:  ConnectString ='DSN=Historia;UID=
//									en DBPARM2: ConnectOption=' SQL_DRIVER_CONNECT , SQL_DRIVER_NOPROMPT '
if trim(sle_usuario.text)="" then 
	sle_usuario.setfocus()
	return
end if
//string dbparm2
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI", "DBPARM", Regstring!, SQLCA.DBPARM )
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI", "DBMS", Regstring!, SQLCA.DBMS)
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI", "DBMS2", Regstring!, dbparm2)
//SQLCA.dbParm =SQLCA.dbParm+sle_usuario.text+";PWD="+sle_passwd.text+"';"
SQLCA.dbms = "ODBC"
SQLCA.dbParm = "ConnectString ='DSN=clientes'"
open(w_presenta)
connect ;
string clave,estado
long intentos
if SQLCA.SQLCode = -1 then 
	close(w_presenta)
	messagebox("Error de conexión",SQLCA.sqlerrtext)
else
	usuario=trim(sle_usuario.text)
	select clave,estado into :clave , :estado from usuarios where usuario=:usuario;
	if isnull(estado) or estado="" or estado="2" then
		messagebox("Atención","Usuario no existe, o no está activo")
		close(w_presenta)
		intentos++
		disconnect;
		if intentos>2 then close(parent)
		return
	else
		if sle_passwd.text<>f_descripta(clave) then
			Messagebox("Error","Contraseña no válida")
			close(w_presenta)
			intentos++
			disconnect;
			if intentos>2 then close(parent)
			return
		end if
	end if	
	open(w_principal)
	w_presenta.show()
	close(w_presenta)
	close(parent)
	w_principal.setfocus()
end if

end event

type sle_passwd from singlelineedit within w_conecta
integer x = 567
integer y = 212
integer width = 754
integer height = 92
integer taborder = 20
string dragicon = "none!"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
boolean password = true
integer limit = 10
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_usuario from singlelineedit within w_conecta
integer x = 562
integer y = 64
integer width = 759
integer height = 92
integer taborder = 10
string dragicon = "none!"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_conecta
integer x = 192
integer y = 4
integer width = 1216
integer height = 352
string dragicon = "none!"
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_conecta
integer y = 368
integer width = 1618
integer height = 36
string dragicon = "none!"
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

