$PBExportHeader$w_versiones.srw
forward
global type w_versiones from window
end type
type tab_1 from tab within w_versiones
end type
type tabpage_1 from userobject within tab_1
end type
type pb_5 from picturebutton within tabpage_1
end type
type pb_2 from picturebutton within tabpage_1
end type
type dw_2 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_5 pb_5
pb_2 pb_2
dw_2 dw_2
end type
type tabpage_2 from userobject within tab_1
end type
type sle_super from singlelineedit within tabpage_2
end type
type sle_suerp from singlelineedit within tabpage_2
end type
type st_9 from statictext within tabpage_2
end type
type st_super from statictext within tabpage_2
end type
type sle_ser from singlelineedit within tabpage_2
end type
type sle_bd from singlelineedit within tabpage_2
end type
type st_7 from statictext within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type st_5 from statictext within tabpage_2
end type
type st_4 from statictext within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type sle_con from singlelineedit within tabpage_2
end type
type sle_port from singlelineedit within tabpage_2
end type
type sle_userdb from singlelineedit within tabpage_2
end type
type sle_password from singlelineedit within tabpage_2
end type
type tabpage_2 from userobject within tab_1
sle_super sle_super
sle_suerp sle_suerp
st_9 st_9
st_super st_super
sle_ser sle_ser
sle_bd sle_bd
st_7 st_7
st_3 st_3
st_6 st_6
st_5 st_5
st_4 st_4
st_2 st_2
sle_con sle_con
sle_port sle_port
sle_userdb sle_userdb
sle_password sle_password
end type
type tab_1 from tab within w_versiones
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type pb_save from picturebutton within w_versiones
end type
type pb_1 from picturebutton within w_versiones
end type
type pb_insert from picturebutton within w_versiones
end type
type st_1 from statictext within w_versiones
end type
type dw_1 from datawindow within w_versiones
end type
end forward

global type w_versiones from window
integer width = 4288
integer height = 1676
boolean titlebar = true
string title = "Control de Versiones"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_version.ico"
boolean center = true
tab_1 tab_1
pb_save pb_save
pb_1 pb_1
pb_insert pb_insert
st_1 st_1
dw_1 dw_1
end type
global w_versiones w_versiones

type variables
string i_operacion
boolean lb_cambio=false,lb_cambio1=false
end variables

on w_versiones.create
this.tab_1=create tab_1
this.pb_save=create pb_save
this.pb_1=create pb_1
this.pb_insert=create pb_insert
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.tab_1,&
this.pb_save,&
this.pb_1,&
this.pb_insert,&
this.st_1,&
this.dw_1}
end on

on w_versiones.destroy
destroy(this.tab_1)
destroy(this.pb_save)
destroy(this.pb_1)
destroy(this.pb_insert)
destroy(this.st_1)
destroy(this.dw_1)
end on

type tab_1 from tab within w_versiones
event create ( )
event destroy ( )
integer x = 32
integer y = 484
integer width = 2382
integer height = 1056
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
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

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2345
integer height = 928
long backcolor = 67108864
string text = "Actualiza Archivos"
long tabtextcolor = 33554432
string picturename = "files.ico"
long picturemaskcolor = 536870912
pb_5 pb_5
pb_2 pb_2
dw_2 dw_2
end type

on tabpage_1.create
this.pb_5=create pb_5
this.pb_2=create pb_2
this.dw_2=create dw_2
this.Control[]={this.pb_5,&
this.pb_2,&
this.dw_2}
end on

on tabpage_1.destroy
destroy(this.pb_5)
destroy(this.pb_2)
destroy(this.dw_2)
end on

type pb_5 from picturebutton within tabpage_1
integer x = 2176
integer y = 192
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_2.deleterow(0)
end event

type pb_2 from picturebutton within tabpage_1
integer x = 2176
integer y = 52
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "buscar.gif"
alignment htextalign = left!
end type

event clicked;if dw_1.rowcount()=0 then return
if isnull(dw_1.getitemstring(1,'nom_aplicacion')) then return
string path,filename,todo
if ls_pro=32 then Registryget ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DIRECTORIO", regstring!, path)
if ls_pro=64 then RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "DIRECTORIO", regstring!, path)
//path=dw_1.getitemstring(1,'camino')
if not directoryexists(path) then
	messagebox('Atencición','No existe el directorio '+path)
	return
end if
GetFileOpenName ( 'Archivos a actualizar', todo, filename , '*.*' , "Todos los archivos (*.*),*.*"  , path  )
if dw_2.find('nom_file="'+filename+'"',1,dw_2.rowcount())=0 then
	dw_2.insertrow(1)
	dw_2.setitem(1,'nom_aplicacion',dw_1.getitemstring(1,'nom_aplicacion'))
	dw_2.setitem(1,'nom_file',filename)
end if
end event

type dw_2 from datawindow within tabpage_1
integer x = 55
integer y = 44
integer width = 2080
integer height = 840
integer taborder = 30
string title = "none"
string dataobject = "dw_file_update"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 112
integer width = 2345
integer height = 928
boolean enabled = false
long backcolor = 67108864
string text = "Conexión"
long tabtextcolor = 33554432
string picturename = "conexion.ico"
long picturemaskcolor = 536870912
sle_super sle_super
sle_suerp sle_suerp
st_9 st_9
st_super st_super
sle_ser sle_ser
sle_bd sle_bd
st_7 st_7
st_3 st_3
st_6 st_6
st_5 st_5
st_4 st_4
st_2 st_2
sle_con sle_con
sle_port sle_port
sle_userdb sle_userdb
sle_password sle_password
end type

on tabpage_2.create
this.sle_super=create sle_super
this.sle_suerp=create sle_suerp
this.st_9=create st_9
this.st_super=create st_super
this.sle_ser=create sle_ser
this.sle_bd=create sle_bd
this.st_7=create st_7
this.st_3=create st_3
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_2=create st_2
this.sle_con=create sle_con
this.sle_port=create sle_port
this.sle_userdb=create sle_userdb
this.sle_password=create sle_password
this.Control[]={this.sle_super,&
this.sle_suerp,&
this.st_9,&
this.st_super,&
this.sle_ser,&
this.sle_bd,&
this.st_7,&
this.st_3,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_2,&
this.sle_con,&
this.sle_port,&
this.sle_userdb,&
this.sle_password}
end on

on tabpage_2.destroy
destroy(this.sle_super)
destroy(this.sle_suerp)
destroy(this.st_9)
destroy(this.st_super)
destroy(this.sle_ser)
destroy(this.sle_bd)
destroy(this.st_7)
destroy(this.st_3)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.sle_con)
destroy(this.sle_port)
destroy(this.sle_userdb)
destroy(this.sle_password)
end on

type sle_super from singlelineedit within tabpage_2
integer x = 699
integer y = 696
integer width = 1481
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_suerp from singlelineedit within tabpage_2
integer x = 699
integer y = 812
integer width = 1481
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;lb_cambio1=true
end event

type st_9 from statictext within tabpage_2
integer x = 91
integer y = 816
integer width = 466
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password1 Conexión"
boolean focusrectangle = false
end type

type st_super from statictext within tabpage_2
integer x = 91
integer y = 708
integer width = 421
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuario1 Conexión"
boolean focusrectangle = false
end type

type sle_ser from singlelineedit within tabpage_2
integer x = 704
integer y = 268
integer width = 1481
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_bd from singlelineedit within tabpage_2
integer x = 704
integer y = 164
integer width = 1481
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within tabpage_2
integer x = 91
integer y = 584
integer width = 448
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password Conexión"
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_2
integer x = 91
integer y = 472
integer width = 448
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuario Conexión"
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_2
integer x = 91
integer y = 376
integer width = 448
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Puerto Conexión"
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_2
integer x = 91
integer y = 268
integer width = 448
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Server Conexión"
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_2
integer x = 91
integer y = 164
integer width = 448
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Database"
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_2
integer x = 91
integer y = 60
integer width = 448
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ODBCN Nombre"
boolean focusrectangle = false
end type

type sle_con from singlelineedit within tabpage_2
integer x = 699
integer y = 60
integer width = 1481
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_port from singlelineedit within tabpage_2
integer x = 699
integer y = 376
integer width = 215
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_userdb from singlelineedit within tabpage_2
integer x = 699
integer y = 472
integer width = 1481
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_password from singlelineedit within tabpage_2
integer x = 699
integer y = 584
integer width = 1481
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;lb_cambio=true
end event

type pb_save from picturebutton within w_versiones
integer x = 2821
integer y = 480
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
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;int li
for li=1 to dw_1.rowcount()
	dw_1.setitem(li,'conexion',tab_1.tabpage_2.sle_con.text)
	dw_1.setitem(li,'base',tab_1.tabpage_2.sle_bd.text)
	dw_1.setitem(li,'servidor',tab_1.tabpage_2.sle_ser.text)
	dw_1.setitem(li,'puerto',tab_1.tabpage_2.sle_port.text)
	dw_1.setitem(li,'usuario',tab_1.tabpage_2.sle_userdb.text)
	if not isnull(tab_1.tabpage_2.sle_password.text) and len(tab_1.tabpage_2.sle_password.text)>0  then
		if lb_cambio then 
			dw_1.setitem(li,'clave',f_encripta_new(tab_1.tabpage_2.sle_password.text))
		end if
	end if
	dw_1.setitem(li,'usuario1',tab_1.tabpage_2.sle_userdb.text)
	if not isnull(tab_1.tabpage_2.sle_suerp.text) and len(tab_1.tabpage_2.sle_suerp.text)>0  then
		if lb_cambio1 then 
			dw_1.setitem(li,'clave1',f_encripta_new(tab_1.tabpage_2.sle_suerp.text))
		end if
	end if	
next
dw_1.accepttext()
tab_1.tabpage_1.dw_2.accepttext()
i_operacion = 'Delete'
if tab_1.tabpage_1.dw_2.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
end if
if dw_1.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
end if
i_operacion = 'Insert'
if dw_1.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
end if
if tab_1.tabpage_1.dw_2.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
end if
commit;
//dw_1.resetupdate()
//tab_1.tabpage_1.dw_2.resetupdate()
end event

type pb_1 from picturebutton within w_versiones
integer x = 2647
integer y = 480
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;do while tab_1.tabpage_1.dw_2.rowcount()>0
	tab_1.tabpage_1.dw_2.deleterow(0)
loop
dw_1.deleterow(1)
end event

type pb_insert from picturebutton within w_versiones
integer x = 2478
integer y = 476
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

event clicked;dw_1.insertrow(1)
end event

type st_1 from statictext within w_versiones
integer x = 23
integer y = 4
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aplicativos:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_versiones
integer x = 18
integer y = 60
integer width = 4110
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_versiones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
retrieve()
end event

event rowfocuschanged;tab_1.tabpage_1.dw_2.reset()
if getrow()<1 then return
if dw_1.getitemstring(getrow(),'devolver') ='0' or dw_1.getitemstring(getrow(),'devolver') ='3' then
	tab_1.tabpage_2.enabled=true
	tab_1.tabpage_2.visible=true
else
	tab_1.tabpage_2.enabled=false
	tab_1.tabpage_2.visible=false
end if
tab_1.tabpage_2.sle_con.text=dw_1.getitemstring(getrow(),'conexion')
tab_1.tabpage_2.sle_bd.text=dw_1.getitemstring(getrow(),'base')
tab_1.tabpage_2.sle_ser.text=dw_1.getitemstring(getrow(),'servidor')
tab_1.tabpage_2.sle_port.text=dw_1.getitemstring(getrow(),'puerto')
tab_1.tabpage_2.sle_userdb.text=dw_1.getitemstring(getrow(),'usuario')
tab_1.tabpage_2.sle_password.text=dw_1.getitemstring(getrow(),'clave')
tab_1.tabpage_2.sle_super.text=dw_1.getitemstring(getrow(),'usuario1')
tab_1.tabpage_2.sle_suerp.text=dw_1.getitemstring(getrow(),'clave1')
tab_1.tabpage_1.dw_2.retrieve(getitemstring(getrow(),'nom_aplicacion'))
end event

event buttonclicked;string dir
if dwo.name ='b_1' then
	GetFolder ( 'Directorio de Reportes Asistenciales', dir )
	setitem(row,'camino',dir)
end if
if dwo.name ='b_2' then
	GetFolder ( 'Directorio de Reportes Asistenciales', dir )
	setitem(row,'camino1',dir)
end if
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

event itemchanged;if getcolumnname()='devolver' then
	int li
	for li=1 to dw_1.rowcount()
		dw_1.setitem(li,'devolver',data)
	next
	if data<>'0' then
		tab_1.tabpage_2.enabled=true
		tab_1.tabpage_2.visible=true
	else
		tab_1.tabpage_2.enabled=false
		tab_1.tabpage_2.visible=false
	end if
end if
end event

