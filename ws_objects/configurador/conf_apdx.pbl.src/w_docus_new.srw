$PBExportHeader$w_docus_new.srw
forward
global type w_docus_new from window
end type
type tab_2 from tab within w_docus_new
end type
type tabpage_2 from userobject within tab_2
end type
type pb_del2 from picturebutton within tabpage_2
end type
type pb_new2 from picturebutton within tabpage_2
end type
type dw_doc from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_2
pb_del2 pb_del2
pb_new2 pb_new2
dw_doc dw_doc
end type
type tabpage_3 from userobject within tab_2
end type
type dw_resol from datawindow within tabpage_3
end type
type pb_newre from picturebutton within tabpage_3
end type
type tabpage_3 from userobject within tab_2
dw_resol dw_resol
pb_newre pb_newre
end type
type tabpage_4 from userobject within tab_2
end type
type st_8 from statictext within tabpage_4
end type
type sle_tokens from singlelineedit within tabpage_4
end type
type sle_pasclie from singlelineedit within tabpage_4
end type
type sle_idclie from singlelineedit within tabpage_4
end type
type sle_token from singlelineedit within tabpage_4
end type
type st_7 from statictext within tabpage_4
end type
type st_6 from statictext within tabpage_4
end type
type st_5 from statictext within tabpage_4
end type
type pb_1 from picturebutton within tabpage_4
end type
type st_3 from statictext within tabpage_4
end type
type sle_ruta from singlelineedit within tabpage_4
end type
type st_2 from statictext within tabpage_4
end type
type sle_passcert from singlelineedit within tabpage_4
end type
type rb_tls from radiobutton within tabpage_4
end type
type rb_ssl from radiobutton within tabpage_4
end type
type rb_nin from radiobutton within tabpage_4
end type
type st_25 from statictext within tabpage_4
end type
type cbx_smtpauth from checkbox within tabpage_4
end type
type sle_password from singlelineedit within tabpage_4
end type
type st_19 from statictext within tabpage_4
end type
type sle_userid from singlelineedit within tabpage_4
end type
type st_18 from statictext within tabpage_4
end type
type sle_port from singlelineedit within tabpage_4
end type
type st_17 from statictext within tabpage_4
end type
type pb_3 from picturebutton within tabpage_4
end type
type pb_4 from picturebutton within tabpage_4
end type
type sle_server from singlelineedit within tabpage_4
end type
type st_16 from statictext within tabpage_4
end type
type gb_3 from groupbox within tabpage_4
end type
type gb_1 from groupbox within tabpage_4
end type
type gb_2 from groupbox within tabpage_4
end type
type gb_4 from groupbox within tabpage_4
end type
type st_4 from statictext within tabpage_4
end type
type sle_endpoint from singlelineedit within tabpage_4
end type
type tabpage_4 from userobject within tab_2
st_8 st_8
sle_tokens sle_tokens
sle_pasclie sle_pasclie
sle_idclie sle_idclie
sle_token sle_token
st_7 st_7
st_6 st_6
st_5 st_5
pb_1 pb_1
st_3 st_3
sle_ruta sle_ruta
st_2 st_2
sle_passcert sle_passcert
rb_tls rb_tls
rb_ssl rb_ssl
rb_nin rb_nin
st_25 st_25
cbx_smtpauth cbx_smtpauth
sle_password sle_password
st_19 st_19
sle_userid sle_userid
st_18 st_18
sle_port sle_port
st_17 st_17
pb_3 pb_3
pb_4 pb_4
sle_server sle_server
st_16 st_16
gb_3 gb_3
gb_1 gb_1
gb_2 gb_2
gb_4 gb_4
st_4 st_4
sle_endpoint sle_endpoint
end type
type tab_2 from tab within w_docus_new
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type tab_1 from tab within w_docus_new
end type
type tabpage_1 from userobject within tab_1
end type
type pb_save from picturebutton within tabpage_1
end type
type pb_new from picturebutton within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_mod from datawindow within tabpage_1
end type
type dw_lugares from datawindow within tabpage_1
end type
type dw_cab from datawindow within tabpage_1
end type
type dw_histo from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_save pb_save
pb_new pb_new
st_1 st_1
dw_mod dw_mod
dw_lugares dw_lugares
dw_cab dw_cab
dw_histo dw_histo
end type
type tab_1 from tab within w_docus_new
tabpage_1 tabpage_1
end type
end forward

global type w_docus_new from window
string tag = "Modificó o creó un Documento. Desea guardar los cambios ?"
integer width = 5801
integer height = 2244
boolean titlebar = true
string title = "Documentos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "rep.ico"
tab_2 tab_2
tab_1 tab_1
end type
global w_docus_new w_docus_new

type variables
datawindowchild hija,dw_ccosto
string tipo_col,anterior,orden,i_modulo,i_cdoc,i_operacion
boolean i_nuevo,i_cambio, lb_paso=false, lb_paso1=false, lb_paso2=false , lb_paso3=false
long i_fila
end variables
forward prototypes
public subroutine reset_dws ()
public function integer f_pregunta ()
public function integer grabar ()
end prototypes

public subroutine reset_dws ();tab_1.tabpage_1.dw_cab.reset()
tab_2.tabpage_2.dw_doc.reset()

end subroutine

public function integer f_pregunta ();if tab_1.tabpage_1.dw_cab.accepttext()=-1 then return 3
if tab_2.tabpage_2.dw_doc.accepttext()=-1 then return 3
if not i_cambio then return 2
return messagebox("Atención, realizó cambios",tag,question!,yesnocancel!,3)
end function

public function integer grabar ();int fila
if tab_1.tabpage_1.dw_cab.accepttext()=-1 then return -1
if tab_2.tabpage_2.dw_doc.accepttext()=-1 then return -1

fila=tab_2.tabpage_2.dw_doc.getrow()

tab_2.tabpage_2.dw_doc.setitem(fila,'servidor',tab_2.tabpage_4.sle_server.text)
tab_2.tabpage_2.dw_doc.setitem(fila,'puerto',tab_2.tabpage_4.sle_port.text)
tab_2.tabpage_2.dw_doc.setitem(fila,'usuario',tab_2.tabpage_4.sle_userid.text)
if not isnull(tab_2.tabpage_4.sle_password.text) and len(tab_2.tabpage_4.sle_password.text)<>0 then
	 if lb_paso1 then 
		tab_2.tabpage_2.dw_doc.setitem(fila,'clave',f_encripta_new(tab_2.tabpage_4.sle_password.text))
		lb_paso1=false
	end if
end if
if tab_2.tabpage_4.cbx_smtpauth.checked=true then
	tab_2.tabpage_2.dw_doc.setitem(fila,'autentica','S')
else
	tab_2.tabpage_2.dw_doc.setitem(fila,'autentica','N')
end if
if tab_2.tabpage_4.rb_ssl.checked = True then
	tab_2.tabpage_2.dw_doc.setitem(fila,'conexion','S')
end if
if tab_2.tabpage_4.rb_tls.checked = True then
	tab_2.tabpage_2.dw_doc.setitem(fila,'conexion','T')
end if	
if tab_2.tabpage_4.rb_nin.checked = True then
	tab_2.tabpage_2.dw_doc.setitem(fila,'conexion','N')
end if	

tab_2.tabpage_2.dw_doc.setitem(fila,'endpoint',tab_2.tabpage_4.sle_endpoint.text)
tab_2.tabpage_2.dw_doc.setitem(fila,'token',tab_2.tabpage_4.sle_token.text)

if not isnull(tab_2.tabpage_4.sle_idclie.text) and len(tab_2.tabpage_4.sle_idclie.text)<>0 then
	 if lb_paso2 then 
		tab_2.tabpage_2.dw_doc.setitem(fila,'clientid',f_encripta_new(tab_2.tabpage_4.sle_idclie.text))
		lb_paso2=false
	end if
end if

if not isnull(tab_2.tabpage_4.sle_pasclie.text) and len(tab_2.tabpage_4.sle_pasclie.text)<>0 then
	 if lb_paso3 then 
		tab_2.tabpage_2.dw_doc.setitem(fila,'clientsecret',f_encripta_new(tab_2.tabpage_4.sle_pasclie.text))
		lb_paso3=false
	end if
end if
tab_2.tabpage_2.dw_doc.setitem(fila,'tokens',tab_2.tabpage_4.sle_tokens.text)

if not isnull(tab_2.tabpage_4.sle_ruta.text) and len(tab_2.tabpage_4.sle_ruta.text) <>0 then 
	tab_2.tabpage_2.dw_doc.setitem(fila,'ruta_certificado',tab_2.tabpage_4.sle_ruta.text)
	if lb_paso then 
		tab_2.tabpage_2.dw_doc.setitem(fila,'clave_certificado',f_encripta_new(tab_2.tabpage_4.sle_passcert.text))
		lb_paso=false
	end if
end if

i_operacion = 'Delete'
if tab_1.tabpage_1.dw_cab.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_2.tabpage_2.dw_doc.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_2.tabpage_3.dw_resol.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
i_operacion = 'Insert'
if tab_1.tabpage_1.dw_cab.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_2.tabpage_2.dw_doc.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if

if tab_2.tabpage_3.dw_resol.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
i_operacion = ''
long j
string crep,clug
blob reporte
for j=1 to tab_2.tabpage_2.dw_doc.rowcount()
	crep=tab_2.tabpage_2.dw_doc.getitemstring(j,'coddoc')
	clug=tab_2.tabpage_2.dw_doc.getitemstring(j,'clugar')
	sqlca.autocommit=true
	if tab_2.tabpage_2.dw_doc.getitemstring(j,'reporte')='' or isnull(tab_2.tabpage_2.dw_doc.getitemstring(j,'reporte')) then
		update documentos set reporte=null where coddoc=:crep and clugar=:clug;
	else
		reporte=blob(tab_2.tabpage_2.dw_doc.getitemstring(j,'reporte'))
		updateblob documentos set reporte=:reporte where coddoc=:crep and clugar=:clug;
	end if
	sqlca.autocommit=false
	if sqlca.sqlcode=-1 then
		messagebox('Error actualizando documentos',sqlca.sqlerrtext)
		rollback;
		return -1
	end if
next
commit;
tab_1.tabpage_1.dw_cab.resetupdate()
tab_2.tabpage_2.dw_doc.resetupdate()
tab_1.tabpage_1.dw_histo.resetupdate()
if i_nuevo then
	tab_1.tabpage_1.dw_histo.setitem(1,'coddoc',tab_1.tabpage_1.dw_cab.getitemstring(1,'coddoc'))
	tab_1.tabpage_1.dw_histo.setitem(1,'desdoc',tab_1.tabpage_1.dw_cab.getitemstring(1,'desdoc'))
	tab_1.tabpage_1.dw_histo.setitem(1,'por_lugar',tab_1.tabpage_1.dw_cab.getitemstring(1,'por_lugar'))
	tab_1.tabpage_1.dw_histo.setitem(1,'resol',tab_1.tabpage_1.dw_cab.getitemstring(1,'resol'))
	tab_1.tabpage_1.dw_histo.setitem(1,'estado','1')
end if
i_cambio=false
i_nuevo=false
return 1
end function

on w_docus_new.create
this.tab_2=create tab_2
this.tab_1=create tab_1
this.Control[]={this.tab_2,&
this.tab_1}
end on

on w_docus_new.destroy
destroy(this.tab_2)
destroy(this.tab_1)
end on

event closequery;choose case f_pregunta()
	case 1
		if grabar()=-1 then
			return 1
		else
			return 0
		end if
	case 2
		return 0
	case 3
		return 1
end choose
end event

event timer;if i_fila=tab_1.tabpage_1.dw_histo.getrow() then
	timer(0)
	return
end if
setnull(i_cdoc)
if tab_1.tabpage_1.dw_histo.getrow()<1 then return
i_fila=tab_1.tabpage_1.dw_histo.getrow()
i_cdoc=tab_1.tabpage_1.dw_histo.getitemstring(i_fila,'coddoc')
tab_1.tabpage_1.dw_cab.retrieve(i_cdoc)
tab_2.tabpage_2.dw_doc.retrieve(i_cdoc)
timer(0)
end event

type tab_2 from tab within w_docus_new
event create ( )
event destroy ( )
integer x = 18
integer y = 940
integer width = 5728
integer height = 1192
integer taborder = 20
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
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_2.create
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_2.destroy
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

type tabpage_2 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5691
integer height = 1064
long backcolor = 67108864
string text = "Documentos Lugar"
long tabtextcolor = 33554432
string picturename = "rep.ico"
long picturemaskcolor = 536870912
pb_del2 pb_del2
pb_new2 pb_new2
dw_doc dw_doc
end type

on tabpage_2.create
this.pb_del2=create pb_del2
this.pb_new2=create pb_new2
this.dw_doc=create dw_doc
this.Control[]={this.pb_del2,&
this.pb_new2,&
this.dw_doc}
end on

on tabpage_2.destroy
destroy(this.pb_del2)
destroy(this.pb_new2)
destroy(this.dw_doc)
end on

type pb_del2 from picturebutton within tabpage_2
integer x = 5513
integer y = 160
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;tab_2.tabpage_2.dw_doc.deleterow(0)
i_cambio=true
end event

type pb_new2 from picturebutton within tabpage_2
integer x = 5509
integer y = 20
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;tab_2.tabpage_2.dw_doc.insertrow(1)
tab_2.tabpage_2.dw_doc.setitem(1,'codmodulo',i_modulo)
tab_2.tabpage_2.dw_doc.setitem(1,'coddoc',i_cdoc)
tab_2.tabpage_2.dw_doc.setitem(1,'por_lugar',tab_1.tabpage_1.dw_cab.getitemstring(1,'por_lugar'))

end event

type dw_doc from datawindow within tabpage_2
integer x = 27
integer y = 32
integer width = 5435
integer height = 1004
integer taborder = 60
string dataobject = "dw_doc_todo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event buttonclicked;string camino,nomarch,carreta
long file

if row<>getrow() then setrow(row)
if dwo.name='b_1' then
	nomarch=getitemstring(getrow(),'camino')
	if isnull(nomarch) then nomarch=''
	camino=nomarch
	if GetFileOpenName("Abrir Reporte", camino, nomarch, "SRD","Reportes (*.SRD),*.SRD",nomarch) = 1 then
		setitem(getrow(),'camino',camino)
		file=fileopen(nomarch,textmode!)
		if file=-1 then
			messagebox('Error', 'No se pudo abrir el archivo')
			return
		end if
		filereadex(file,carreta)
		setitem(getrow(),'fecha_carga',now())
		setitem(getrow(),'reporte',carreta)
		event itemchanged(getrow(),object.reporte,'')
	end if
else
	camino=getitemstring(getrow(),'camino')
	if GetFileSaveName ( 'Guardar reporte como', camino, nomarch , 'SRD' , 'Reportes (*.srd),*.srd' )<=0 then return
	file=fileopen(nomarch,textmode!,write!,lockwrite!,replace!)
	if file=-1 then
		messagebox('Error creando archivo','No se pudo abrir el archivo para escribirlo')
		return
	end if
	filewriteex(file,getitemstring(getrow(),'reporte'))
end if
fileclose(file)
end event

event clicked;
if dwo.type <> "text" then 
	if dwo.type="column" then
		tipo_col=this.describe(dwo.name+".coltype")
	end if
	return
end if

string cual,ojo,ss
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior=cual then
	if orden="A" then
		orden="D"
	else
		orden="A"
	end if
else
	orden="A"
end if
this.setsort(cual+" "+orden)
this.sort()
anterior=cual


end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event retrieveend;long j
blob reporte
string crep,clug
for j=1 to rowcount
	sqlca.autocommit=true
	clug=getitemstring(j,'clugar')
	crep=getitemstring(j,'coddoc')
	selectblob reporte into :reporte from documentos where coddoc=:crep and clugar=:clug;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo documentos',sqlca.sqlerrtext)
		return
	end if
	setitem(j,'reporte',string(reporte))
	sqlca.autocommit=false
next
if rowcount>0 then
	tab_2.tabpage_3.dw_resol.retrieve(i_cdoc,getitemstring(getrow(),'clugar'))

 tab_2.tabpage_4.sle_server.text=getitemstring(getrow(),'servidor')
 tab_2.tabpage_4.sle_port.text=getitemstring(getrow(),'puerto')
 tab_2.tabpage_4.sle_userid.text=getitemstring(getrow(),'usuario')
 tab_2.tabpage_4.sle_password.text=f_descripta(getitemstring(getrow(),'clave'))
if getitemstring(getrow(),'autentica')='S' then
	 tab_2.tabpage_4.cbx_smtpauth.checked=true
else
	 tab_2.tabpage_4.cbx_smtpauth.checked=false
end if
CHOOSE CASE getitemstring(getrow(),'conexion')
	CASE 'S'
		 tab_2.tabpage_4.rb_ssl.checked = True
	CASE 'T'
	 	tab_2.tabpage_4.rb_tls.checked = True
	CASE 'N'
	 	tab_2.tabpage_4.rb_nin.checked = True
	END CHOOSE	
end if

tab_2.tabpage_4.sle_endpoint.text=tab_2.tabpage_2.dw_doc.getitemstring(getrow(),'endpoint')
tab_2.tabpage_4.sle_token.text=tab_2.tabpage_2.dw_doc.getitemstring(getrow(),'token')
tab_2.tabpage_4.sle_idclie.text=tab_2.tabpage_2.dw_doc.getitemstring(getrow(),'clientid')
tab_2.tabpage_4.sle_pasclie.text=tab_2.tabpage_2.dw_doc.getitemstring(getrow(),'clientsecret')
tab_2.tabpage_4.sle_tokens.text=tab_2.tabpage_2.dw_doc.getitemstring(getrow(),'tokens')
tab_2.tabpage_4.sle_ruta.text=tab_2.tabpage_2.dw_doc.getitemstring(getrow(),'ruta_certificado')
tab_2.tabpage_4.sle_passcert.text=f_descripta(tab_2.tabpage_2.dw_doc.getitemstring(getrow(),'clave_certificado'))
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

event dberror;rollback;
return 0
end event

event rowfocuschanged;int row
row=currentrow
tab_2.tabpage_3.dw_resol.retrieve(i_cdoc, getitemstring(row,'clugar'))
tab_2.tabpage_4.sle_server.text=getitemstring(row,'servidor')
tab_2.tabpage_4.sle_port.text=getitemstring(row,'puerto')
tab_2.tabpage_4.sle_userid.text=getitemstring(row,'usuario')
tab_2.tabpage_4.sle_password.text=f_descripta(getitemstring(row,'clave'))
 
if getitemstring(row,'autentica')='S' then
	 tab_2.tabpage_4.cbx_smtpauth.checked=true
else
	 tab_2.tabpage_4.cbx_smtpauth.checked=false
end if
CHOOSE CASE getitemstring(row,'conexion')
	CASE 'S'
		 tab_2.tabpage_4.rb_ssl.checked = True
	CASE 'T'
	 	tab_2.tabpage_4.rb_tls.checked = True
	CASE 'N'
	 	tab_2.tabpage_4.rb_nin.checked = True
	END CHOOSE	
tab_2.tabpage_4.sle_ruta.text=getitemstring(row,'ruta_certificado')
tab_2.tabpage_4.sle_passcert.text=f_descripta(getitemstring(row,'clave_certificado'))

end event

event itemchanged;dw_doc.setitem(dw_doc.getrow(),'usu_modif',usuario)
dw_doc.setitem(dw_doc.getrow(),'fecha_modif',datetime(today(),now()))
dw_doc.accepttext()
end event

type tabpage_3 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 5691
integer height = 1064
long backcolor = 67108864
string text = "Resoluciones Facturación Autorizadas"
long tabtextcolor = 33554432
string picturename = "conf_pag.ico"
long picturemaskcolor = 536870912
dw_resol dw_resol
pb_newre pb_newre
end type

on tabpage_3.create
this.dw_resol=create dw_resol
this.pb_newre=create pb_newre
this.Control[]={this.dw_resol,&
this.pb_newre}
end on

on tabpage_3.destroy
destroy(this.dw_resol)
destroy(this.pb_newre)
end on

type dw_resol from datawindow within tabpage_3
event p_itemchanged ( string columna )
integer x = 32
integer y = 36
integer width = 5454
integer height = 1008
integer taborder = 50
string dataobject = "dw_documentos_x_lugar_nautoriza"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(string columna);accepttext()
string ls_encr
if not isnull(getitemstring(getrow(),'clave_tecnica')) and columna='clave_tecnica'  then 
	ls_encr=getitemstring(getrow(),'clave_tecnica')
	setitem(getrow(),'clave_tecnica',f_encripta_new(ls_encr))
end if
if not isnull(getitemstring(getrow(),'pin')) and columna='pin' then 
	ls_encr=getitemstring(getrow(),'pin')	
	setitem(getrow(),'pin',f_encripta_new(ls_encr))
end if
end event

event constructor;settransobject(sqlca)
end event

event itemchanged;if getcolumnname()='clave_tecnica' or getcolumnname()='pin'  then
	post event p_itemchanged(getcolumnname())
end if

dw_resol.setitem(dw_resol.getrow(),'usu_modif',usuario)
dw_resol.setitem(dw_resol.getrow(),'fecha_modif',datetime(today(),now()))
dw_resol.accepttext()
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

type pb_newre from picturebutton within tabpage_3
integer x = 5522
integer y = 28
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if tab_1.tabpage_1.dw_histo.rowcount()=0 then return
if dw_resol.rowcount()>0 then
	if dw_resol.find('estado="1"',1,dw_resol.rowcount())>0 then
		messagebox("Atención",'Hay una Resolución activa no puede continuar')
		return
	end if
end if
dw_resol.insertrow(1)

string ls_clug
double ldb_nro

SELECT Max(documentos_autfact.c_aut)  into :ldb_nro
FROM documentos_autfact;
if isnull(ldb_nro) then ldb_nro=0
ldb_nro++

dw_resol.setitem(1,'c_aut',ldb_nro)
dw_resol.setitem(1,'coddoc',i_cdoc)
ls_clug=tab_2.tabpage_2.dw_doc.getitemstring(tab_2.tabpage_2.dw_doc.getrow(),'clugar')
dw_resol.setitem(1,'clugar',ls_clug)
dw_resol.setitem(1,'estado','1')
end event

type tabpage_4 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 5691
integer height = 1064
long backcolor = 67108864
string text = "Configuración Factura Electronica "
long tabtextcolor = 33554432
string picturename = "qr.ico"
long picturemaskcolor = 536870912
st_8 st_8
sle_tokens sle_tokens
sle_pasclie sle_pasclie
sle_idclie sle_idclie
sle_token sle_token
st_7 st_7
st_6 st_6
st_5 st_5
pb_1 pb_1
st_3 st_3
sle_ruta sle_ruta
st_2 st_2
sle_passcert sle_passcert
rb_tls rb_tls
rb_ssl rb_ssl
rb_nin rb_nin
st_25 st_25
cbx_smtpauth cbx_smtpauth
sle_password sle_password
st_19 st_19
sle_userid sle_userid
st_18 st_18
sle_port sle_port
st_17 st_17
pb_3 pb_3
pb_4 pb_4
sle_server sle_server
st_16 st_16
gb_3 gb_3
gb_1 gb_1
gb_2 gb_2
gb_4 gb_4
st_4 st_4
sle_endpoint sle_endpoint
end type

on tabpage_4.create
this.st_8=create st_8
this.sle_tokens=create sle_tokens
this.sle_pasclie=create sle_pasclie
this.sle_idclie=create sle_idclie
this.sle_token=create sle_token
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.pb_1=create pb_1
this.st_3=create st_3
this.sle_ruta=create sle_ruta
this.st_2=create st_2
this.sle_passcert=create sle_passcert
this.rb_tls=create rb_tls
this.rb_ssl=create rb_ssl
this.rb_nin=create rb_nin
this.st_25=create st_25
this.cbx_smtpauth=create cbx_smtpauth
this.sle_password=create sle_password
this.st_19=create st_19
this.sle_userid=create sle_userid
this.st_18=create st_18
this.sle_port=create sle_port
this.st_17=create st_17
this.pb_3=create pb_3
this.pb_4=create pb_4
this.sle_server=create sle_server
this.st_16=create st_16
this.gb_3=create gb_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_4=create gb_4
this.st_4=create st_4
this.sle_endpoint=create sle_endpoint
this.Control[]={this.st_8,&
this.sle_tokens,&
this.sle_pasclie,&
this.sle_idclie,&
this.sle_token,&
this.st_7,&
this.st_6,&
this.st_5,&
this.pb_1,&
this.st_3,&
this.sle_ruta,&
this.st_2,&
this.sle_passcert,&
this.rb_tls,&
this.rb_ssl,&
this.rb_nin,&
this.st_25,&
this.cbx_smtpauth,&
this.sle_password,&
this.st_19,&
this.sle_userid,&
this.st_18,&
this.sle_port,&
this.st_17,&
this.pb_3,&
this.pb_4,&
this.sle_server,&
this.st_16,&
this.gb_3,&
this.gb_1,&
this.gb_2,&
this.gb_4,&
this.st_4,&
this.sle_endpoint}
end on

on tabpage_4.destroy
destroy(this.st_8)
destroy(this.sle_tokens)
destroy(this.sle_pasclie)
destroy(this.sle_idclie)
destroy(this.sle_token)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.sle_ruta)
destroy(this.st_2)
destroy(this.sle_passcert)
destroy(this.rb_tls)
destroy(this.rb_ssl)
destroy(this.rb_nin)
destroy(this.st_25)
destroy(this.cbx_smtpauth)
destroy(this.sle_password)
destroy(this.st_19)
destroy(this.sle_userid)
destroy(this.st_18)
destroy(this.sle_port)
destroy(this.st_17)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.sle_server)
destroy(this.st_16)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_4)
destroy(this.st_4)
destroy(this.sle_endpoint)
end on

type st_8 from statictext within tabpage_4
integer x = 2505
integer y = 812
integer width = 297
integer height = 80
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tokens"
boolean focusrectangle = false
end type

type sle_tokens from singlelineedit within tabpage_4
integer x = 2825
integer y = 812
integer width = 2062
integer height = 80
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type sle_pasclie from singlelineedit within tabpage_4
integer x = 2816
integer y = 708
integer width = 2075
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;lb_paso3=true
end event

type sle_idclie from singlelineedit within tabpage_4
integer x = 361
integer y = 912
integer width = 2080
integer height = 80
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;lb_paso2=true
end event

type sle_token from singlelineedit within tabpage_4
integer x = 361
integer y = 816
integer width = 2080
integer height = 80
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within tabpage_4
integer x = 2505
integer y = 728
integer width = 302
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Client_secret"
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_4
integer x = 82
integer y = 924
integer width = 238
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Client_id"
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_4
integer x = 82
integer y = 832
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Token_url"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within tabpage_4
integer x = 4736
integer y = 80
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
string picturename = "adjuntar.jpg"
alignment htextalign = left!
string powertiptext = "Adjuntar certificado"
end type

event clicked;string camino,nomarch,carreta

if GetFileOpenName("Abrir Reporte", camino, nomarch, "PFX","PFX Certificados (*.PFX),*.pfx, Certificado P12 (*.p12),*.p12",nomarch) = 1 then
	sle_ruta.text=camino
else
end if

end event

type st_3 from statictext within tabpage_4
integer x = 2560
integer y = 180
integer width = 581
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Ruta del Certificado Digital"
boolean focusrectangle = false
end type

type sle_ruta from singlelineedit within tabpage_4
integer x = 2551
integer y = 96
integer width = 2167
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;lb_paso=true
end event

type st_2 from statictext within tabpage_4
integer x = 2551
integer y = 416
integer width = 1038
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Digite la contraseña del certificado Digital"
boolean focusrectangle = false
end type

type sle_passcert from singlelineedit within tabpage_4
integer x = 2551
integer y = 308
integer width = 1655
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;lb_paso=true
end event

type rb_tls from radiobutton within tabpage_4
integer x = 1527
integer y = 540
integer width = 311
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

type rb_ssl from radiobutton within tabpage_4
integer x = 1157
integer y = 544
integer width = 293
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

type rb_nin from radiobutton within tabpage_4
integer x = 809
integer y = 540
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

type st_25 from statictext within tabpage_4
integer x = 69
integer y = 552
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

type cbx_smtpauth from checkbox within tabpage_4
integer x = 73
integer y = 452
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

type sle_password from singlelineedit within tabpage_4
integer x = 512
integer y = 360
integer width = 1595
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

event modified;lb_paso1=true
end event

type st_19 from statictext within tabpage_4
integer x = 73
integer y = 360
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

type sle_userid from singlelineedit within tabpage_4
integer x = 512
integer y = 256
integer width = 1595
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

type st_18 from statictext within tabpage_4
integer x = 73
integer y = 256
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

type sle_port from singlelineedit within tabpage_4
integer x = 512
integer y = 160
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

type st_17 from statictext within tabpage_4
integer x = 73
integer y = 164
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

type pb_3 from picturebutton within tabpage_4
string tag = "Ajuste Office"
integer x = 2176
integer y = 196
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
sle_endpoint.text = "https://accounts.google.com/o/oauth2/auth"
sle_token.text = "https://oauth2.googleapis.com/token"
sle_tokens.text = "qa_data/tokens/hotmail.json"


sle_userid.SetFocus()

end event

type pb_4 from picturebutton within tabpage_4
string tag = "Ajuste Gmail"
integer x = 2176
integer y = 56
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
sle_endpoint.text = "https://accounts.google.com/o/oauth2/auth"
sle_token.text = "https://oauth2.googleapis.com/token"
sle_tokens.text = "qa_data/tokens/_gmailSmtp.json"
sle_userid.SetFocus()

end event

type sle_server from singlelineedit within tabpage_4
integer x = 512
integer y = 64
integer width = 1595
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

type st_16 from statictext within tabpage_4
integer x = 73
integer y = 64
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

type gb_3 from groupbox within tabpage_4
integer x = 773
integer y = 496
integer width = 1106
integer height = 132
integer taborder = 130
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within tabpage_4
integer x = 23
integer width = 2405
integer height = 644
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de la Cuenta"
end type

type gb_2 from groupbox within tabpage_4
integer x = 2496
integer width = 2437
integer height = 612
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos del certificado"
end type

type gb_4 from groupbox within tabpage_4
integer x = 37
integer y = 664
integer width = 4905
integer height = 372
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos Oauth 2.0"
end type

type st_4 from statictext within tabpage_4
integer x = 82
integer y = 732
integer width = 265
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Auth_url"
boolean focusrectangle = false
end type

type sle_endpoint from singlelineedit within tabpage_4
integer x = 361
integer y = 720
integer width = 2075
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_docus_new
integer x = 27
integer y = 24
integer width = 5710
integer height = 880
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
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

event selectionchanged;if tab_1.tabpage_1.dw_histo.getitemstring(tab_1.tabpage_1.dw_histo.getrow(),'resol')='1' then
end if
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5673
integer height = 752
long backcolor = 67108864
string text = "Documentos Módulo"
long tabtextcolor = 33554432
string picturename = "rep.ico"
long picturemaskcolor = 536870912
pb_save pb_save
pb_new pb_new
st_1 st_1
dw_mod dw_mod
dw_lugares dw_lugares
dw_cab dw_cab
dw_histo dw_histo
end type

on tabpage_1.create
this.pb_save=create pb_save
this.pb_new=create pb_new
this.st_1=create st_1
this.dw_mod=create dw_mod
this.dw_lugares=create dw_lugares
this.dw_cab=create dw_cab
this.dw_histo=create dw_histo
this.Control[]={this.pb_save,&
this.pb_new,&
this.st_1,&
this.dw_mod,&
this.dw_lugares,&
this.dw_cab,&
this.dw_histo}
end on

on tabpage_1.destroy
destroy(this.pb_save)
destroy(this.pb_new)
destroy(this.st_1)
destroy(this.dw_mod)
destroy(this.dw_lugares)
destroy(this.dw_cab)
destroy(this.dw_histo)
end on

type pb_save from picturebutton within tabpage_1
integer x = 1627
integer y = 36
integer width = 146
integer height = 128
integer taborder = 60
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

event clicked;if grabar()=1 then
	commit;
end if
end event

type pb_new from picturebutton within tabpage_1
integer x = 1472
integer y = 36
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;reset_dws()
tab_1.tabpage_1.dw_histo.insertrow(1)
i_fila=1
tab_1.tabpage_1.dw_histo.setrow(1)
tab_1.tabpage_1.dw_histo.setitem(1,'estado','4')
i_cambio=true
i_nuevo=true
tab_1.tabpage_1.dw_cab.insertrow(1)
tab_1.tabpage_1.dw_cab.setitem(1,'codmodulo',i_modulo)
setnull(i_cdoc)
enabled=false
long j
for j=1 to tab_1.tabpage_1.dw_lugares.rowcount()
	tab_2.tabpage_2.dw_doc.insertrow(j)
	tab_2.tabpage_2.dw_doc.setitem(j,'codmodulo',i_modulo)
	tab_2.tabpage_2.dw_doc.setitem(j,'clugar', tab_1.tabpage_1.dw_lugares.getitemstring(j,'codlugar'))
	tab_2.tabpage_2.dw_doc.setitem(j,'por_lugar','1')
next
tab_1.tabpage_1.dw_cab.setfocus()
end event

type st_1 from statictext within tabpage_1
integer x = 27
integer y = 148
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugares:"
boolean focusrectangle = false
end type

type dw_mod from datawindow within tabpage_1
integer x = 18
integer y = 16
integer width = 1358
integer height = 136
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_modulos"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string actual
actual=getitemstring(1,string(dwo.name))
choose case f_pregunta()
	case 1//cambio y debe guardar
		if grabar()=-1 then 
			setitem(1,1,actual)
			return 1
		else
			commit;
		end if
	case 2// no cambio o no va a guardar
		i_cambio=false
		i_nuevo=false
		pb_new.enabled=true
	case 3//cancelar
		setitem(1,1,actual)
		return 1
end choose
pb_new.enabled=true
i_modulo=data
reset_dws()
tab_1.tabpage_1.dw_histo.retrieve(i_modulo)
i_fila=0
tab_1.tabpage_1.dw_histo.event rowfocuschanged(1)

end event

type dw_lugares from datawindow within tabpage_1
integer x = 23
integer y = 200
integer width = 2368
integer height = 536
integer taborder = 60
string title = "none"
string dataobject = "dw_lugares"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
retrieve()
object.codlugar.edit.displayonly='true'
object.descripcion.edit.displayonly='true'
end event

type dw_cab from datawindow within tabpage_1
integer x = 2491
integer y = 388
integer width = 2464
integer height = 352
integer taborder = 40
string title = "none"
string dataobject = "dw_deta_docu_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

event itemchanged;long j
choose case dwo.name
	case 'coddoc'
		i_cdoc=data
		for j=1 to tab_2.tabpage_2.dw_doc.rowcount()
			tab_2.tabpage_2.dw_doc.setitem(j,'coddoc',i_cdoc)
		next
end choose
dw_cab.setitem(dw_cab.getrow(),'usu_modif',usuario)
dw_cab.setitem(dw_cab.getrow(),'fecha_modif',datetime(today(),now()))
accepttext()
i_cambio=true

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

type dw_histo from datawindow within tabpage_1
event p_borra_nuevo ( long p_estaba,  long p_va )
integer x = 2491
integer y = 40
integer width = 3058
integer height = 356
integer taborder = 50
string title = "none"
string dataobject = "dw_list_docus_x_mod"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_borra_nuevo(long p_estaba, long p_va);deleterow(p_estaba)
i_fila=0
//parent.event timer()

end event

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

event rowfocuschanged;if dw_histo.getitemstring(dw_histo.getrow(),'por_lugar')='1' then
	tab_2.enabled=true
	tab_2.tabpage_2.enabled=true
	if dw_histo.getitemstring(dw_histo.getrow(),'resol')='1' then
		tab_2.tabpage_3.enabled=true
		tab_2.tabpage_4.enabled=true		
	else
		tab_2.tabpage_3.enabled=false
		tab_2.tabpage_4.enabled=false				
	end if
else
	tab_2.enabled=true
	tab_2.tabpage_2.enabled=false
	if dw_histo.getitemstring(dw_histo.getrow(),'resol')='1' then
		tab_2.tabpage_3.enabled=true
		tab_2.tabpage_4.enabled=true
	else
		tab_2.tabpage_3.enabled=false
		tab_2.tabpage_4.enabled=false		
	end if
end if
reset_dws()
timer(0.3)

end event

event rowfocuschanging;choose case f_pregunta()
	case 1//cambio y debe guardar
		if grabar()=-1 then 
			return 1
		else
			commit;
		end if
	case 2// no cambio o no va a guardar
		i_cambio=false
		i_nuevo=false
		pb_new.enabled=true
		if currentrow<1 or currentrow>rowcount() then return
		if getitemstring(currentrow,'estado')='4' then 
			post event p_borra_nuevo(currentrow,newrow)
		end if
	case 3//cancelar
		return 1
end choose
return 0
end event

event retrieveend;if dw_histo.getitemstring(dw_histo.getrow(),'por_lugar')='1' then
	tab_2.enabled=true
	tab_2.tabpage_3.enabled=true
	if dw_histo.getitemstring(dw_histo.getrow(),'resol')='1' then
		tab_2.tabpage_4.enabled=true
	else
		tab_2.tabpage_4.enabled=false
	end if
else
	tab_2.enabled=true
	tab_2.tabpage_3.enabled=true
	if dw_histo.getitemstring(dw_histo.getrow(),'resol')='1' then
		tab_2.tabpage_4.enabled=true
	else
		tab_2.tabpage_4.enabled=false
	end if
end if
end event

