$PBExportHeader$w_sincroniza.srw
forward
global type w_sincroniza from window
end type
type pb_2 from picturebutton within w_sincroniza
end type
type pb_1 from picturebutton within w_sincroniza
end type
type st_titulo from statictext within w_sincroniza
end type
type cb_1 from commandbutton within w_sincroniza
end type
type st_4 from statictext within w_sincroniza
end type
type sle_4 from singlelineedit within w_sincroniza
end type
type dw_1 from datawindow within w_sincroniza
end type
type sle_3 from singlelineedit within w_sincroniza
end type
type st_3 from statictext within w_sincroniza
end type
type sle_2 from singlelineedit within w_sincroniza
end type
type st_2 from statictext within w_sincroniza
end type
type sle_1 from singlelineedit within w_sincroniza
end type
type st_1 from statictext within w_sincroniza
end type
type p_1 from picture within w_sincroniza
end type
end forward

global type w_sincroniza from window
integer width = 2798
integer height = 816
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
st_titulo st_titulo
cb_1 cb_1
st_4 st_4
sle_4 sle_4
dw_1 dw_1
sle_3 sle_3
st_3 st_3
sle_2 sle_2
st_2 st_2
sle_1 sle_1
st_1 st_1
p_1 p_1
end type
global w_sincroniza w_sincroniza

type variables
string i_dsn,i_tipo
datawindowchild idw_script,idw_usu,idw_publi
end variables

on w_sincroniza.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_titulo=create st_titulo
this.cb_1=create cb_1
this.st_4=create st_4
this.sle_4=create sle_4
this.dw_1=create dw_1
this.sle_3=create sle_3
this.st_3=create st_3
this.sle_2=create sle_2
this.st_2=create st_2
this.sle_1=create sle_1
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_titulo,&
this.cb_1,&
this.st_4,&
this.sle_4,&
this.dw_1,&
this.sle_3,&
this.st_3,&
this.sle_2,&
this.st_2,&
this.sle_1,&
this.st_1,&
this.p_1}
end on

on w_sincroniza.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_titulo)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.sle_4)
destroy(this.dw_1)
destroy(this.sle_3)
destroy(this.st_3)
destroy(this.sle_2)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.p_1)
end on

event open;i_tipo=message.stringparm
long aqui,hastaaqui
aqui=pos(sqlca.dbparm,"DSN=",1)
hastaaqui=pos(sqlca.dbparm,";",aqui)
i_dsn=mid(sqlca.dbparm,aqui +4,hastaaqui - aqui -4)

sle_1.text=sqlca.logid
sle_2.text=sqlca.logpass
RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\"+i_dsn,"EngineName", Regstring!, sle_3.text)

dw_1.settransobject(sqlca)
dw_1.getchild('scriptversion',idw_script)
dw_1.getchild('user',idw_usu)
dw_1.getchild('publicacion',idw_publi)

idw_script.settransobject(sqlca)
idw_usu.settransobject(sqlca)
idw_publi.settransobject(sqlca)

dw_1.insertrow(1)
string tip
tip=i_tipo
if i_tipo='SS' then 
	tip='S'
	sle_4.enabled=true
	cb_1.enabled=true
	title+='   (I M P O R T A R  - S U B I R    D A T O S)'
elseif i_tipo='S' then
	title+='   (I M P O R T A R -  P R E P A R A R   B A S E - )'
elseif i_tipo='B' then
	title+='   (E X P O R T A R    D A T O S)'
end if
if idw_script.retrieve(tip)=1 then dw_1.setitem(1,'scriptversion',idw_script.getitemstring(1,1))
if idw_usu.retrieve()=1 then dw_1.setitem(1,'user',idw_usu.getitemstring(1,1))
if idw_publi.retrieve()=1 then dw_1.setitem(1,'publicacion',idw_publi.getitemstring(1,1))


end event

type pb_2 from picturebutton within w_sincroniza
integer x = 1303
integer y = 632
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_sincroniza
integer x = 1125
integer y = 632
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;string escribir,nombre
long file
choose case i_tipo
	case 'B'
		nombre=clugar+'-'+string(today(),'dd-mm-yyyy')+'-'+string(now(),'hhmm')
		escribir='Dbmlsync.exe -c "uid='+sle_1.text+';pwd='+sle_2.text+';eng='+sle_3.text+'" -e "sv='+dw_1.getitemstring(1,'scriptversion')+'" -u '+dw_1.getitemstring(1,'user')+' -n '+dw_1.getitemstring(1,'publicacion')+' -vn -bc '+'c:\'+nombre+'.df'
		file=fileopen('c:\bajar.bat',linemode!,write!,lockwrite!,replace!)
		ST_4.TEXT='Archivo destino:'
		sle_4.text='c:\'+nombre+'.df'
		filewriteex(file,escribir)
		fileclose(file)
		run('c:\bajar.bat',normal!)
	case 'S'
		escribir='dbmlsync -c "dsn='+i_dsn+'" -vn -e "sv='+dw_1.getitemstring(1,'scriptversion')+'" -u '+dw_1.getitemstring(1,'user')+' -n '+dw_1.getitemstring(1,'publicacion')
		file=fileopen('c:\preparar.bat',linemode!,write!,lockwrite!,replace!)
		filewriteex(file,escribir)
		fileclose(file)
		run('c:\preparar.bat',normal!)
	case 'SS'
		if not fileexists(sle_4.text) then
			messagebox('Atención','"'+sle_4.text+'" no es un archivo válido')
			return
		end if
		escribir='Dbmlsync.exe -c "dsn='+i_dsn+'" -vn -u '+dw_1.getitemstring(1,'user')+' -ba '+sle_4.text+' -ot C:\arch_sale_'+string(today(),'dd_mm_yyyy')+'.txt'
		file=fileopen('c:\subir.bat',linemode!,write!,lockwrite!,replace!)
		filewriteex(file,escribir)
		fileclose(file)
		run('c:\subir.bat',normal!)
end choose
end event

type st_titulo from statictext within w_sincroniza
integer x = 27
integer width = 1243
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 553648127
string text = "Sincronizacíon de base de datos ANYWHERE"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_sincroniza
integer x = 2683
integer y = 532
integer width = 82
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "..."
end type

event clicked;string nomarch,camino,path
path=GetCurrentDirectory ( )
if GetFileOpenName("Buscar Archivo", camino, nomarch, "*","todos (*.*),*.*") <> 1 then 
	ChangeDirectory ( path )
	return -1
end if
ChangeDirectory ( path )
sle_4.text=camino
end event

type st_4 from statictext within w_sincroniza
integer x = 32
integer y = 472
integer width = 430
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo a subir:"
boolean focusrectangle = false
end type

type sle_4 from singlelineedit within w_sincroniza
integer x = 27
integer y = 532
integer width = 2633
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_sincroniza
integer y = 308
integer width = 2789
integer height = 148
integer taborder = 20
string title = "none"
string dataobject = "dw_sincroniza"
boolean border = false
boolean livescroll = true
end type

type sle_3 from singlelineedit within w_sincroniza
integer x = 814
integer y = 212
integer width = 690
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_sincroniza
integer x = 814
integer y = 148
integer width = 549
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motor (nombre servicio):"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_sincroniza
integer x = 411
integer y = 212
integer width = 343
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
boolean password = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_sincroniza
integer x = 425
integer y = 148
integer width = 279
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_sincroniza
integer x = 27
integer y = 212
integer width = 343
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_sincroniza
integer x = 37
integer y = 148
integer width = 197
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "User Id:"
boolean focusrectangle = false
end type

type p_1 from picture within w_sincroniza
integer width = 6501
integer height = 80
string picturename = "titulo.jpg"
boolean focusrectangle = false
end type

