$PBExportHeader$w_busca_en_capit.srw
forward
global type w_busca_en_capit from window
end type
type pb_1 from picturebutton within w_busca_en_capit
end type
type pb_3 from picturebutton within w_busca_en_capit
end type
type dw_4 from datawindow within w_busca_en_capit
end type
type pb_2 from picturebutton within w_busca_en_capit
end type
type pb_5 from picturebutton within w_busca_en_capit
end type
type pb_ok from picturebutton within w_busca_en_capit
end type
type dw_3 from datawindow within w_busca_en_capit
end type
type st_2 from statictext within w_busca_en_capit
end type
type dw_2 from datawindow within w_busca_en_capit
end type
type rb_2 from radiobutton within w_busca_en_capit
end type
type rb_1 from radiobutton within w_busca_en_capit
end type
type st_1 from statictext within w_busca_en_capit
end type
type dw_1 from datawindow within w_busca_en_capit
end type
end forward

global type w_busca_en_capit from window
integer width = 4763
integer height = 1808
boolean titlebar = true
string title = "Buscar Pacientes en Base de Capitados o Comprobador de Derechos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_1 pb_1
pb_3 pb_3
dw_4 dw_4
pb_2 pb_2
pb_5 pb_5
pb_ok pb_ok
dw_3 dw_3
st_2 st_2
dw_2 dw_2
rb_2 rb_2
rb_1 rb_1
st_1 st_1
dw_1 dw_1
end type
global w_busca_en_capit w_busca_en_capit

type variables
transaction sqlba
string i_sql
st_busca_capi i_decual
end variables

forward prototypes
public function string f_retorno_mail (mailreturncode a_mailreturncode)
end prototypes

public function string f_retorno_mail (mailreturncode a_mailreturncode);string s
choose case a_MailReturnCode
	case mailReturnAccessDenied!
		s = 'Access Denied'
	case mailReturnAttachmentNotFound!
		s = 'Attachment Not Found'
	case mailReturnAttachmentOpenFailure!
		s = 'Attachment Open Failure'
	case mailReturnAttachmentWriteFailure!
		s = 'Attachment Write Failure'
	case mailReturnDiskFull!
		s = 'Disk Full'
	case mailReturnFailure!
		s = 'Failure'
	case mailReturnInsufficientMemory!
		s = 'Insufficient Memory'
	case mailReturnInvalidMessage!
		s = 'Invalid Message'
	case mailReturnLoginFailure!
		s = 'Login Failure'
	case mailReturnMessageInUse!
		s = 'Message In Use'
	case mailReturnNoMessages!
		s = 'No Messages'
	case mailReturnSuccess!
		s = 'Success'
	case mailReturnTextTooLarge!
		s = 'Text Too Large'
	case mailReturnTooManyFiles!
		s = 'Too Many Files'
	case mailReturnTooManyRecipients!
		s = 'Too Many Recipients'
	case mailReturnTooManySessions!
		s = 'Too Many Sessions'
	case mailReturnUnknownRecipient!
		s = 'Unknown Recipient'
	case mailReturnUserAbort!
		s = 'User Abort'

	case else
		s = 'Other'
end choose
return s

end function

event open;i_decual=message.powerobjectparm
sqlba = create transaction
if f_conecta_capi(sqlba)=-1 then
	close(this)
	return
end if

i_sql=dw_1.describe('DataWindow.Table.Select')
string sql
sql=i_sql+" where capitados.tipodoc='"+tipdoc+"' and capitados.documento='"+docu+"'"
if i_decual.valida='capi' then
	dw_1.settransobject(sqlba)
else
//	pb_ok.enabled=false
	dw_1.settransobject(sqlba)
	sql=f_remplaza(sql,'capitados','afiliados')
	rb_2.checked=true
end if
dw_1.setsqlselect(sql)
if dw_1.retrieve()=0 then pb_3.event clicked()
end event

on w_busca_en_capit.create
this.pb_1=create pb_1
this.pb_3=create pb_3
this.dw_4=create dw_4
this.pb_2=create pb_2
this.pb_5=create pb_5
this.pb_ok=create pb_ok
this.dw_3=create dw_3
this.st_2=create st_2
this.dw_2=create dw_2
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.pb_3,&
this.dw_4,&
this.pb_2,&
this.pb_5,&
this.pb_ok,&
this.dw_3,&
this.st_2,&
this.dw_2,&
this.rb_2,&
this.rb_1,&
this.st_1,&
this.dw_1}
end on

on w_busca_en_capit.destroy
destroy(this.pb_1)
destroy(this.pb_3)
destroy(this.dw_4)
destroy(this.pb_2)
destroy(this.pb_5)
destroy(this.pb_ok)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_1)
destroy(this.dw_1)
end on

event close;disconnect using sqlba;


end event

type pb_1 from picturebutton within w_busca_en_capit
integer x = 2587
integer y = 912
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
string picturename = "refrescar.GIF"
alignment htextalign = left!
end type

event clicked;long j
string buscar,valor,campo,y_o,tabla
buscar=i_sql+' where '
if rb_1.checked then
	tabla='capitados'
else
	tabla='afiliados'
end if
dw_2.accepttext()
for j=1 to dw_2.rowcount()
	valor=dw_2.getitemstring(j,'valor')
	campo=dw_2.getitemstring(j,'nom_campo')
	if (valor<>'' and not isnull(valor)) and not isnull(campo) then
		if pos(valor,'%')=0 then
			buscar+=y_o+tabla+'.'+campo+"='"+valor+"'"
		else
			buscar+=y_o+tabla+'.'+campo+" like '"+valor+"'"
		end if
		y_o=dw_2.getitemstring(j,'condicion')
	end if
next
if y_o<>'' then
	if rb_1.checked then
		dw_1.settransobject(sqlba)
		dw_1.setsqlselect(buscar)
		dw_1.retrieve()
	else
		buscar=f_remplaza(buscar,'capitados','afiliados')
		//dw_1.settransobject(sqlca)
		dw_1.settransobject(sqlba)
		dw_1.setsqlselect(buscar)
		dw_1.retrieve()
	end if
end if
end event

type pb_3 from picturebutton within w_busca_en_capit
integer x = 37
integer y = 908
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "export.gif"
alignment htextalign = left!
end type

event clicked;if pb_3.picturename="export.gif" then
	pb_3.picturename="import.gif"
	dw_2.enabled=false
	pb_1.enabled=false
	rb_1.enabled=false
	rb_2.enabled=false
else
	pb_3.picturename="export.gif"
	dw_2.enabled=true
	pb_1.enabled=true
	rb_1.enabled=true
	rb_2.enabled=true
	dw_2.setfocus()
end if
end event

type dw_4 from datawindow within w_busca_en_capit
boolean visible = false
integer x = 3003
integer y = 868
integer width = 1349
integer height = 228
integer taborder = 20
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_2 from picturebutton within w_busca_en_capit
integer x = 1623
integer y = 24
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "envia_mail.jpg"
string disabledname = "d_envia_mail.jpg"
alignment htextalign = left!
string powertiptext = "Informe de Inconsistencias Capitados"
end type

event clicked;if dw_1.rowcount()=0 then return
int l_fila,l_ret
string l_eps,l_conts,td_c,doc_c,ls_archivo,ls_email,ls_path,ls_desemp,ls_x_lugar
string ls_servidor, ls_puerto,ls_usuario,ls_clave,ls_autentica,ls_conexion,ls_em,ls_asunto,ls_desc,p_nombre,ls_obs

SELECT cadena into :ls_x_lugar
FROM parametros_gen
WHERE (((codigo_para)=64));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 64')
	return
end if

if ls_x_lugar='1' then
	SELECT servidor, puerto, usuario, clave, autentica, conexion 
	INTO   :ls_servidor, :ls_puerto,:ls_usuario,:ls_clave,:ls_autentica,:ls_conexion
	FROM lugar_correos
	WHERE clugar=:CLUGAR and ctipo='EA01';
	if isnull(ls_servidor) then 
		messagebox('Atención','No hay datos configuradorados por lugar para EA01')
		return 
	end if
else
	SELECT servidor, puerto, usuario, clave, autentica, conexion 
	INTO   :ls_servidor, :ls_puerto,:ls_usuario,:ls_clave,:ls_autentica,:ls_conexion
	FROM ips_correos
	WHERE c_ips='01' and ctipo='EA01';
	if isnull(ls_servidor) then 
		messagebox('Atención','No hay datos configuradorados por IPS para EA01')
		return 
	end if	
end if

ls_archivo = 'solicita_'+i_decual.dc+'_1'+'_'+string(datetime(today(),now()),'yyyymmddhhmmss')
If rb_1.checked=true then
	dw_4.DataObject = 'asis_int_informe_incosist_cap'
else
	dw_4.DataObject = 'asis_int_informe_incosist_afi'
end If
dw_4.settransobject(sqlba)

l_fila=dw_1.getrow()
td_c=dw_1.getitemstring(l_fila,'tipodoc')
doc_c=dw_1.getitemstring(l_fila,'documento')
l_eps=dw_1.getitemstring(l_fila,'empresa')
ls_desemp=dw_1.getitemstring(l_fila,'desemp')
l_conts=dw_1.getitemstring(l_fila,'contrato')
ls_email=dw_1.getitemstring(l_fila,'correo_bd')
ls_path=dw_1.getitemstring(l_fila,'repositorio')
if isNull(ls_email) or ls_email= '' or len(ls_email)=0 then
	messageBox('Atención','No se ha configurado el correo de la empresa '+ls_desemp)
	return 0
end if
if dw_4.retrieve(td_c,doc_c,l_eps,l_conts) > 0 then
	dw_4.SetItem(1,'nom_usuario',i_decual.usuario)
	dw_4.SetItem(1,'n1',i_decual.n1)
	dw_4.SetItem(1,'n2',i_decual.n2)
	dw_4.SetItem(1,'a1',i_decual.a1)
	dw_4.SetItem(1,'a2',i_decual.a2)
	dw_4.SetItem(1,'td',i_decual.td)
	dw_4.SetItem(1,'dc',i_decual.dc)
	dw_4.SetItem(1,'fn',i_decual.fn)
	If isnull(ls_path) or trim(ls_path) = '' then
		ls_path = "c:\"
		do 
		loop until getFolder('Seleccione repositorio para la empresa',ls_path) = 1
		ls_path = ls_path + '\'
		update empresa set repositorio = :ls_path from empresa where codemp = :l_eps;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("No pudo actualizarse repositorio para la empresa. Se continuará el proceso.", SQLCA.SQLErrText)
		END IF
	End if		
	
	ls_asunto='INCONSISTENCIA DE BD '+ td_c + doc_c
	ls_archivo= ls_path+ ls_archivo+'.pdf'
	dw_4.Object.DataWindow.Export.PDF.Method = NativePDF!
	dw_4.Object.DataWindow.Export.PDF.NativePDF.Restrictions = 'nomodify!,nocopy!'
	if dw_4.saveas(ls_archivo,PDF!, true)=-1 then 
		return 0 
	end if
	ls_em=f_envia_mail(ls_servidor, ls_puerto,ls_usuario,ls_clave,ls_autentica,ls_conexion,ls_email,ls_asunto,ls_desc,p_nombre,ls_archivo,ls_obs)
	 if ls_em='Correo Enviado Satisfactoriamente' then
		messageBox('Atención','Correo enviado')
	 else
		messageBox('Atención',ls_em)
	end if
else
	MessageBox('Atención','No se generó reporte. No se recuperó información de la base de datos')
end if

end event

type pb_5 from picturebutton within w_busca_en_capit
integer x = 1445
integer y = 28
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_busca_en_capit
integer x = 1285
integer y = 28
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar y Crear Paciente"
end type

event clicked;long j,donde
string ls_dire
if i_decual.valida='capi' then
	dw_3.reset()
	if dw_1.rowcount()=0 then return
	if dw_1.getitemnumber(1,'cuantos')=0 then
		messagebox('Atención','No escogió ningún registro para crear el paciente')
		return
	else
		j=dw_1.find('esco=1',1,dw_1.rowcount())
		IF isnull(dw_1.getitemstring(j,'tipodoc')) or trim(dw_1.getitemstring(j,'tipodoc'))='' or isnull(dw_1.getitemstring(j,'documento')) or dw_1.getitemstring(j,'documento')='' then 
			messagebox('Atención','El tipo de documento o el documento es nulo')
			return
		end if
		dw_1.settransobject(sqlca)
		dw_1.setitemstatus(j,0,primary!,new!)
		dw_1.setitem(j,'fingreso',datetime(today(),now()))
		dw_1.setitem(j,'apellido1',upper(dw_1.getitemstring(j,'apellido1')))				
		dw_1.setitem(j,'apellido2',upper(dw_1.getitemstring(j,'apellido2')))	
		dw_1.setitem(j,'nombre1',upper(dw_1.getitemstring(j,'nombre1')))	
		dw_1.setitem(j,'nombre2',upper(dw_1.getitemstring(j,'nombre2')))
		setnull(ls_dire)
		dw_1.setitem(j,'direccion',ls_dire)		
		dw_1.modify('datawindow.table.updatetable="pacientes"')
		if dw_1.update(true,false)=-1 then
			rollback;
			return
		end if
		tipdoc=dw_1.getitemstring(j,'tipodoc')
		docu=dw_1.getitemstring(j,'documento')
		dw_3.retrieve(tipdoc,docu)
		do while j>0 and j<=dw_1.rowcount()
			donde=dw_3.find("codemp='"+dw_1.getitemstring(j,'empresa')+"' and codcontrato='"+dw_1.getitemstring(j,'contrato')+"'",1,dw_3.rowcount())
			if donde=0 then
				dw_3.insertrow(1)
				dw_3.setitem(1,'tipodoc',tipdoc)
				dw_3.setitem(1,'documento',docu)
				dw_3.setitem(1,'codemp',dw_1.getitemstring(j,'empresa'))
				dw_3.setitem(1,'codcontrato',dw_1.getitemstring(j,'contrato'))
				dw_3.setitem(1,'carnet',dw_1.getitemstring(j,'carnet'))
			end if
			if j=dw_1.rowcount() then exit
			j=dw_1.find('esco=1',j+1,dw_1.rowcount())
		loop
		if dw_3.update(true,false)=-1 then
			rollback;
			return
		end if
		dw_1.resetupdate()
		dw_3.resetupdate()
		commit;
		
		w_principal.dw_1.setitem(1,'tipodoc',tipdoc)
		w_principal.dw_1.setitem(1,'documento',docu)
		w_principal.busca_paciente()
		w_principal.busca_paciente()
		
		close(parent)
	end if
else
	j=dw_1.find('esco=1',1,dw_1.rowcount())
	IF isnull(dw_1.getitemstring(j,'tipodoc')) or trim(dw_1.getitemstring(j,'tipodoc'))='' or isnull(dw_1.getitemstring(j,'documento')) or dw_1.getitemstring(j,'documento')='' then 
		messagebox('Atención','El tipo de documento o el documento es nulo')
		return
	end if
	tipdoc=dw_1.getitemstring(j,'tipodoc')
	docu=dw_1.getitemstring(j,'documento')
	dw_3.retrieve(tipdoc,docu)
	do while j>0 and j<=dw_1.rowcount()
		donde=dw_3.find("codemp='"+dw_1.getitemstring(j,'empresa')+"' and codcontrato='"+dw_1.getitemstring(j,'contrato')+"'",1,dw_3.rowcount())
		if donde=0 then
			dw_3.insertrow(1)
			dw_3.setitem(1,'tipodoc',tipdoc)
			dw_3.setitem(1,'documento',docu)
			dw_3.setitem(1,'codemp',dw_1.getitemstring(j,'empresa'))
			dw_3.setitem(1,'codcontrato',dw_1.getitemstring(j,'contrato'))
			dw_3.setitem(1,'carnet',dw_1.getitemstring(j,'carnet'))
		end if
		if j=dw_1.rowcount() then exit
		j=dw_1.find('esco=1',j+1,dw_1.rowcount())
	loop
	if dw_3.update(true,false)=-1 then
		rollback;
		return
	end if
	dw_3.resetupdate()
	commit;
	w_principal.dw_1.setitem(1,'tipodoc',tipdoc)
	w_principal.dw_1.setitem(1,'documento',docu)
	w_principal.busca_paciente()
	close(parent)
end if
end event

type dw_3 from datawindow within w_busca_en_capit
boolean visible = false
integer x = 2990
integer y = 1116
integer width = 1349
integer height = 140
integer taborder = 20
string title = "none"
string dataobject = "dw_empacguarda_ori"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_2 from statictext within w_busca_en_capit
integer x = 1883
integer y = 12
integer width = 2830
integer height = 172
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Si el paciente no se encuentra creado puede que esté en la base Capitada o en la de Comprobación de derechos y así llevar e insertar los datos más rápido."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_busca_en_capit
event keypres pbm_dwnkey
integer x = 187
integer y = 904
integer width = 2363
integer height = 736
integer taborder = 30
string title = "none"
string dataobject = "dw_busca_afil_new"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypres;if key=keytab! then
	if getrow()=rowcount() then
		insertrow(rowcount()+1)
		setitem(rowcount(),'protejer',0)
	end if
end if
if key=keyenter! then
	pb_1.event clicked()
end if
end event

event constructor;insertrow(1)
setitem(1,'nom_campo','nombre1 ')
insertrow(2)
setitem(2,'nom_campo','nombre2 ')
insertrow(3)
setitem(3,'nom_campo','apellido1 ')
insertrow(4)
setitem(4,'nom_campo','apellido2 ')

end event

event doubleclicked;if dwo.name='nom_campo_1' or dwo.name='nom_campo_2'then
	setitem(row,'protejer',0)
end if

end event

type rb_2 from radiobutton within w_busca_en_capit
integer x = 503
integer y = 20
integer width = 667
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comprobador de derechos"
end type

event clicked;string sql
sql=dw_1.describe('datawindow.table.select')
sql=f_remplaza(sql,'capitados','afiliados')
dw_1.setsqlselect(sql)
dw_1.settransobject(sqlba)
dw_1.retrieve()
end event

type rb_1 from radiobutton within w_busca_en_capit
integer x = 27
integer y = 20
integer width = 425
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base Capitados"
boolean checked = true
end type

event clicked;string sql
sql=dw_1.describe('datawindow.table.select')
sql=f_remplaza(sql,'afiliados','capitados')
dw_1.setsqlselect(sql)
dw_1.settransobject(sqlba)
dw_1.retrieve()
end event

type st_1 from statictext within w_busca_en_capit
integer x = 50
integer y = 156
integer width = 1143
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empresa y Contrato donde se encontró el paciente:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_busca_en_capit
integer x = 46
integer y = 228
integer width = 4663
integer height = 624
integer taborder = 10
string title = "none"
string dataobject = "dw_xa_buscar_afil"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.name = 'esco_t' then
	long i
	if describe("esco_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'esco',1)
		next
		Modify("esco_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'esco',0)
		next
		Modify("esco_t.Text='Selec.'")
	end if
end if
end event

