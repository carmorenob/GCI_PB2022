$PBExportHeader$w_banco_fluid.srw
forward
global type w_banco_fluid from window
end type
type pb_5 from pb_report within w_banco_fluid
end type
type dw_caract from datawindow within w_banco_fluid
end type
type dw_banco_pac from datawindow within w_banco_fluid
end type
type em_sello from editmask within w_banco_fluid
end type
type st_4 from statictext within w_banco_fluid
end type
type pb_4 from picturebutton within w_banco_fluid
end type
type pb_1 from picturebutton within w_banco_fluid
end type
type dw_pruebas from datawindow within w_banco_fluid
end type
type dw_items from datawindow within w_banco_fluid
end type
type pb_del from picturebutton within w_banco_fluid
end type
type pb_insert from picturebutton within w_banco_fluid
end type
type tab_1 from tab within w_banco_fluid
end type
type tp_1 from userobject within tab_1
end type
type pb_2 from pb_report within tp_1
end type
type pb_enc from picturebutton within tp_1
end type
type dw_enc from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_2 pb_2
pb_enc pb_enc
dw_enc dw_enc
end type
type tp_2 from userobject within tab_1
end type
type pb_3 from pb_report within tp_2
end type
type pb_save_prelim from picturebutton within tp_2
end type
type dw_prelim from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_3 pb_3
pb_save_prelim pb_save_prelim
dw_prelim dw_prelim
end type
type tp_3 from userobject within tab_1
end type
type pb_aprobar from picturebutton within tp_3
end type
type dw_matriz from datawindow within tp_3
end type
type pb_infecc from picturebutton within tp_3
end type
type tp_3 from userobject within tab_1
pb_aprobar pb_aprobar
dw_matriz dw_matriz
pb_infecc pb_infecc
end type
type tab_1 from tab within w_banco_fluid
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
type st_3 from statictext within w_banco_fluid
end type
type dw_bolsas from datawindow within w_banco_fluid
end type
type st_1 from statictext within w_banco_fluid
end type
type dw_histo from datawindow within w_banco_fluid
end type
type em_1 from editmask within w_banco_fluid
end type
type st_2 from statictext within w_banco_fluid
end type
type em_muestra from editmask within w_banco_fluid
end type
type dw_1 from datawindow within w_banco_fluid
end type
type gb_1 from groupbox within w_banco_fluid
end type
end forward

global type w_banco_fluid from window
integer width = 4046
integer height = 1984
boolean titlebar = true
string title = "Bancos de Fluidos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "gota.ico"
boolean center = true
pb_5 pb_5
dw_caract dw_caract
dw_banco_pac dw_banco_pac
em_sello em_sello
st_4 st_4
pb_4 pb_4
pb_1 pb_1
dw_pruebas dw_pruebas
dw_items dw_items
pb_del pb_del
pb_insert pb_insert
tab_1 tab_1
st_3 st_3
dw_bolsas dw_bolsas
st_1 st_1
dw_histo dw_histo
em_1 em_1
st_2 st_2
em_muestra em_muestra
dw_1 dw_1
gb_1 gb_1
end type
global w_banco_fluid w_banco_fluid

type variables
datawindowchild idw_banco,idw_lista_enc,idw_tipodon
string i_banco,i_cdoc
boolean i_encuesta,i_prelim,i_infecc,i_consec_x_anyo
end variables

forward prototypes
public subroutine reset_dws ()
public function integer f_pregunta ()
public function integer grabar ()
public function integer confirma ()
end prototypes

public subroutine reset_dws ();dw_histo.reset()
dw_bolsas.reset()
tab_1.tp_1.dw_enc.reset()
tab_1.tp_2.dw_prelim.reset()
tab_1.tp_3.dw_matriz.reset()
dw_banco_pac.reset()
dw_caract.reset()
end subroutine

public function integer f_pregunta ();if (not i_encuesta) and (not i_infecc) and (not i_prelim) then return 2
return messagebox("Atención, realizó cambios",'Insertó una nueva donación o modificó alguna, desea guardar los cambios?',question!,yesnocancel!,3)
end function

public function integer grabar ();long j,ndonacion,respu,k,donde
string err
if i_encuesta then
	if tab_1.tp_1.dw_enc.find("obligatorio='1' and isnull(descrip_lista)",1,tab_1.tp_1.dw_enc.rowcount())>0 then
		messagebox('Atención','Hay campos obligatorios vacios, debe llenarlos para continuar') 
		return -1
	end if
	for j=1 to tab_1.tp_1.dw_enc.rowcount()
		if tab_1.tp_1.dw_enc.getitemstring(j,'obligatorio')='1' then
			donde=dw_caract.find('item='+string(tab_1.tp_1.dw_enc.getitemnumber(j,'item')),1,dw_caract.rowcount())
			if donde=0 then
				if dw_banco_pac.rowcount()=0 then
					dw_banco_pac.insertrow(1)
					dw_banco_pac.setitem(1,'tipodoc',tipdoc)
					dw_banco_pac.setitem(1,'documento',docu)
					dw_banco_pac.setitem(1,'cod_banco',i_banco)
				end if
				donde=dw_caract.insertrow(0)
				dw_caract.setitem(donde,'tipodoc',tipdoc)
				dw_caract.setitem(donde,'documento',docu)
				dw_caract.setitem(donde,'cod_banco',i_banco)
				dw_caract.setitem(donde,'item',tab_1.tp_1.dw_enc.getitemnumber(j,'item'))
				dw_caract.setitem(donde,'subitem',tab_1.tp_1.dw_enc.getitemnumber(j,'subitem'))
			end if
		end if
	next
	respu=messagebox('Guardar Encuesta','Es apto el paciente para donar?',question!,yesnocancel!,1)
	if respu=3 then return respu
	if respu=2 then 
		dw_histo.setitem(1,'apto','0')
		tab_1.tp_2.enabled=true
		tab_1.tp_3.enabled=true
	end if
	select max(nro_donacion) into :ndonacion from banco_donacion where clugar=:clugar;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo banco_donacion',sqlca.sqlerrtext)
		return -1
	end if
	if isnull(ndonacion) then ndonacion=0
	ndonacion ++
	dw_histo.setitem(1,'nro_donacion',ndonacion)
	for j=1 to tab_1.tp_1.dw_enc.rowcount()
		tab_1.tp_1.dw_enc.setitem(j,'nro_donacion',ndonacion)
	next
	if dw_histo.update(true,false)=-1 then return -1
	if tab_1.tp_1.dw_enc.update(true,false)=-1 then return -1
	if dw_banco_pac.update(true,false)=-1 then return -1
	if dw_caract.update(true,false)=-1 then return -1
	dw_histo.resetupdate()
	tab_1.tp_1.dw_enc.resetupdate()
	dw_banco_pac.resetupdate()
	dw_caract.resetupdate()
	i_encuesta=false
	return respu
end if
if i_prelim then
	respu=messagebox('Guardar Pruebas Preliminares','Es apto el paciente para donar sangre?',question!,yesnocancel!,1)
	if respu=3 then return respu
	if respu=2 then 
		dw_histo.setitem(dw_histo.getrow(),'apto','0')
		dw_histo.setitem(dw_histo.getrow(),'aprobado','R')
	else
		long consec,anyo
		string lug
		lug=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
		dw_histo.setitem(dw_histo.getrow(),'apto','1')
		dw_histo.setitem(dw_histo.getrow(),'aprobado','0')
		anyo=dw_histo.getitemnumber(dw_histo.getrow(),'anyo')
		if i_consec_x_anyo then
			select max(consec_donacion) into :consec from banco_donacion 
			where clugar=:lug and cod_banco=:i_banco and anyo=:anyo;
		else
			select max(consec_donacion) into :consec from banco_donacion 
			where clugar=:lug and cod_banco=:i_banco ;
		end if
		if sqlca.sqlcode=-1 then
			messagebox('Error leyendo banco_donacion',sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if isnull(consec) then consec=0
		consec ++
		dw_histo.setitem(dw_histo.getrow(),'consec_donacion',consec)
	end if
	if dw_histo.update(true,false)=-1 then return -1
	if tab_1.tp_2.dw_prelim.update(true,false)=-1 then return -1
	dw_histo.resetupdate()
	tab_1.tp_2.dw_prelim.resetupdate()
	i_prelim=false
	return respu
end if
if i_infecc then
	long conf
	conf=confirma()
	if conf=-1 then return 0
	if conf=-2 then
		dw_banco_pac.setitem(1,'apto','0')
		if dw_banco_pac.update(true,false)=-1 then return -1
		dw_banco_pac.resetupdate()
	else
		if dw_banco_pac.getitemstring(1,'apto')<>'1' then
			dw_banco_pac.setitem(1,'apto','1')
			if dw_banco_pac.update(true,false)=-1 then return -1
			dw_banco_pac.resetupdate()
		end if
	end if
	tab_1.tp_3.dw_matriz.setredraw(false)
	tab_1.tp_3.dw_matriz.setfilter('isrownew()')
	tab_1.tp_3.dw_matriz.filter()
	if tab_1.tp_3.dw_matriz.rowcount()=0 then 
		tab_1.tp_3.dw_matriz.setfilter('')
		tab_1.tp_3.dw_matriz.filter()
		tab_1.tp_3.dw_matriz.setredraw(true)
		return -1
	end if
	dw_pruebas.reset()
	for j=1 to tab_1.tp_3.dw_matriz.rowcount()
		for k=1 to tab_1.tp_3.dw_matriz.getitemnumber(j,'nro_pruebas')
			dw_pruebas.insertrow(1)
			dw_pruebas.setitem(1,'clugar',dw_histo.getitemstring(dw_histo.getrow(),'clugar'))
			dw_pruebas.setitem(1,'nro_donacion',dw_histo.getitemnumber(dw_histo.getrow(),'nro_donacion'))
			dw_pruebas.setitem(1,'cod_banco',i_banco)
			dw_pruebas.setitem(1,'nro_examen',tab_1.tp_3.dw_matriz.getitemnumber(j,'nro_exa'+string(k)))
			dw_pruebas.setitem(1,'nro_prueba',tab_1.tp_3.dw_matriz.getitemnumber(j,'prueba'))
			//dw_pruebas.setitem(1,'fecha_prueba','')
			dw_pruebas.setitem(1,'si_no',tab_1.tp_3.dw_matriz.getitemstring(j,'sino'+string(k)))
		next
	next
	if dw_pruebas.update()=-1 then
		tab_1.tp_3.dw_matriz.setfilter('')
		tab_1.tp_3.dw_matriz.filter()
		tab_1.tp_3.dw_matriz.setredraw(true)
		return -1
	end if
	tab_1.tp_3.dw_matriz.resetupdate()
	tab_1.tp_3.dw_matriz.setfilter('')
	tab_1.tp_3.dw_matriz.filter()
	tab_1.tp_3.dw_matriz.setredraw(true)
	boolean rechazar
	long nsello
	choose case tab_1.tp_3.dw_matriz.rowcount()
		case 1
			for k=1 to tab_1.tp_3.dw_matriz.getitemnumber(1,'nro_pruebas')
				if tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>0 then
					rechazar=true
					exit
				end if
			next
			if not rechazar then
				dw_histo.setitem(dw_histo.getrow(),'aprobado','A')
				for j=1 to dw_bolsas.rowcount()
					if dw_bolsas.getitemstring(j,'estado')='X' then continue
					dw_bolsas.setitem(j,'fecha_aprobacion',datetime(today(),now()))
					dw_bolsas.setitem(j,'estado','D')
					nsello=f_trae_ndoc(i_cdoc,dw_histo.getitemstring(dw_histo.getrow(),'clugar'),'Sello de Calidad')
					if nsello=-1 then return -1
					dw_bolsas.setitem(j,'nro_sello',nsello)
				next
				if dw_histo.update(true,false)=-1 then return -1
				if dw_bolsas.update(true,false)=-1 then return -1
				dw_histo.resetupdate()
				dw_bolsas.resetupdate()
			end if
		case 2
			for k=1 to tab_1.tp_3.dw_matriz.getitemnumber(1,'nro_pruebas')
				if tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>1 then
					rechazar=true
					exit
				end if
			next
			if rechazar then
				dw_histo.setitem(dw_histo.getrow(),'aprobado','R')
				for j=1 to dw_bolsas.rowcount()
					dw_bolsas.setitem(j,'estado','X')
				next
				if dw_histo.update(true,false)=-1 then return -1
				if dw_bolsas.update(true,false)=-1 then return -1
				dw_histo.resetupdate()
				dw_bolsas.resetupdate()
			end if
		case 3
			for k=1 to tab_1.tp_3.dw_matriz.getitemnumber(1,'nro_pruebas')
				if tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>1 or (tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>0 and tab_1.tp_3.dw_matriz.getitemstring(1,'riesgo'+string(k))='1') then
					rechazar=true
					exit
				end if
			next
			if rechazar then
				dw_histo.setitem(dw_histo.getrow(),'aprobado','R')
				for j=1 to dw_bolsas.rowcount()
					dw_bolsas.setitem(j,'estado','X')
				next
			end if
			if not rechazar then
				dw_histo.setitem(dw_histo.getrow(),'aprobado','A')
				for j=1 to dw_bolsas.rowcount()
					if dw_bolsas.getitemstring(j,'estado')='X' then continue
					dw_bolsas.setitem(j,'fecha_aprobacion',datetime(today(),now()))
					dw_bolsas.setitem(j,'estado','D')
					nsello=f_trae_ndoc(i_cdoc,dw_histo.getitemstring(dw_histo.getrow(),'clugar'),'Sello de Calidad')
					if nsello=-1 then return -1
					dw_bolsas.setitem(j,'nro_sello',nsello)
				next
			end if
			if dw_histo.update(true,false)=-1 then return -1
			if dw_bolsas.update(true,false)=-1 then return -1
			dw_histo.resetupdate()
			dw_bolsas.resetupdate()
	end choose
	i_infecc=false
end if
return 1
end function

public function integer confirma ();boolean rechazar
long k,j,riesgo
riesgo=tab_1.tp_3.dw_matriz.getitemnumber(1,'riesgo')
choose case tab_1.tp_3.dw_matriz.rowcount()
	case 1
		for k=1 to tab_1.tp_3.dw_matriz.getitemnumber(1,'nro_pruebas')
			if tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>0 then
				rechazar=true
				exit
			end if
		next
		if not rechazar then
			if messagebox('Atención','Está seguro que esta donación es apta para utilizar?',question!,yesno!,1)=2 then 
				if riesgo>0 then return -2
				return -1
			end if
		end if
	case 2
		for k=1 to tab_1.tp_3.dw_matriz.getitemnumber(1,'nro_pruebas')
			if tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>1 then
				rechazar=true
				exit
			end if
		next
		if rechazar then
			if messagebox('Atención','Está seguro que esta donación se   R E C H A Z A R Á ???',question!,yesno!,1)=2 then
				if riesgo>0 then return -2
				return -1
			elseif riesgo>0 then 
				return -2
			end if
		end if
	case 3
		for k=1 to tab_1.tp_3.dw_matriz.getitemnumber(1,'nro_pruebas')
			if tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>1 or (tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>0 and tab_1.tp_3.dw_matriz.getitemstring(1,'riesgo'+string(k))='1') then
				rechazar=true
				exit
			end if
		next
		if rechazar then
			if messagebox('Atención','Está seguro que esta donación se   R E C H A Z A R Á ???',question!,yesno!,1)=2 then
				if riesgo>0 then return -2
				return -1
			elseif riesgo>0 then
				return -2
			end if
		end if
		if not rechazar then
			if messagebox('Atención','Está seguro que esta donación es apta para utilizar?',question!,yesno!,1)=2 then 
				if riesgo>0 then return -2
				return -1
			end if
		end if
end choose
return 1
end function

on w_banco_fluid.create
this.pb_5=create pb_5
this.dw_caract=create dw_caract
this.dw_banco_pac=create dw_banco_pac
this.em_sello=create em_sello
this.st_4=create st_4
this.pb_4=create pb_4
this.pb_1=create pb_1
this.dw_pruebas=create dw_pruebas
this.dw_items=create dw_items
this.pb_del=create pb_del
this.pb_insert=create pb_insert
this.tab_1=create tab_1
this.st_3=create st_3
this.dw_bolsas=create dw_bolsas
this.st_1=create st_1
this.dw_histo=create dw_histo
this.em_1=create em_1
this.st_2=create st_2
this.em_muestra=create em_muestra
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_5,&
this.dw_caract,&
this.dw_banco_pac,&
this.em_sello,&
this.st_4,&
this.pb_4,&
this.pb_1,&
this.dw_pruebas,&
this.dw_items,&
this.pb_del,&
this.pb_insert,&
this.tab_1,&
this.st_3,&
this.dw_bolsas,&
this.st_1,&
this.dw_histo,&
this.em_1,&
this.st_2,&
this.em_muestra,&
this.dw_1,&
this.gb_1}
end on

on w_banco_fluid.destroy
destroy(this.pb_5)
destroy(this.dw_caract)
destroy(this.dw_banco_pac)
destroy(this.em_sello)
destroy(this.st_4)
destroy(this.pb_4)
destroy(this.pb_1)
destroy(this.dw_pruebas)
destroy(this.dw_items)
destroy(this.pb_del)
destroy(this.pb_insert)
destroy(this.tab_1)
destroy(this.st_3)
destroy(this.dw_bolsas)
destroy(this.st_1)
destroy(this.dw_histo)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.em_muestra)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event closequery;choose case f_pregunta()
	case 1//cambio y debe guardar
		if grabar()=-1 then 
			return 1
		else
			commit;
			return 0
		end if
	case 2// no cambio o no va a guardar
		i_encuesta=false
		i_prelim=false
		i_infecc=false
		return 0
	case 3//cancelar
		return 1
end choose
end event

event open;if (not isnull(docu)) and docu<>'' then 
	if not isnull(dw_1.getitemstring(1,1)) then 	dw_1.event itemchanged (1 , dw_1.object.cod_banco , dw_1.getitemstring(1,1))
end if
end event

type pb_5 from pb_report within w_banco_fluid
integer x = 2907
integer y = 608
integer taborder = 70
string powertiptext = "Imprimir Sellos de Garantía"
string nombre_rep = "Sellos de Calidad"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if dw_bolsas.rowcount()=0 or dw_histo.rowcount()=0 then return
any parm[2]
parm[1]=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
parm[2]=dw_histo.getitemnumber(dw_histo.getrow(),'nro_donacion')
imprimir(parm,'','0')

end event

type dw_caract from datawindow within w_banco_fluid
boolean visible = false
integer x = 2277
integer y = 628
integer width = 238
integer height = 52
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_banco_pac_caract"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type dw_banco_pac from datawindow within w_banco_fluid
integer x = 654
integer y = 88
integer width = 544
integer height = 76
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_banco_paciente"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)

end event

event dberror;rollback;
return 0
end event

type em_sello from editmask within w_banco_fluid
integer x = 3611
integer y = 8
integer width = 315
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "######"
end type

event modified;if isnull(dw_1.getitemstring(1,1)) then return
string tdoc,doc
long sello,interno
sello=long(text)

SELECT banco_donacion.tipodoc, banco_donacion.documento , banco_donacion.nro_donacion into :tdoc,:doc,:interno
FROM banco_donacion INNER JOIN Banco_bolsa ON (banco_donacion.nro_donacion = Banco_bolsa.nro_donacion) AND (banco_donacion.clugar = Banco_bolsa.clugar)
WHERE banco_donacion.cod_banco=:i_banco AND Banco_bolsa.nro_sello=:sello AND Banco_bolsa.clugar=:clugar;


if sqlca.sqlcode=-1 then
	messagebox('Error leyendo banco_donacion',sqlca.sqlerrtext)
	return
end if
if isnull(doc) or doc='' then
	messagebox('Atención','No se encontró este sello')
	return
end if
if tdoc<>tipdoc or doc<> docu then
	w_principal.dw_1.setitem(1,1,tdoc)
	w_principal.dw_1.setitem(1,2,doc)
	w_principal.dw_1.setcolumn(2)
	w_principal.dw_1.triggerevent(itemchanged!)
end if
dw_histo.scrolltorow(dw_histo.find('nro_donacion='+string(interno),1,dw_histo.rowcount()))

end event

type st_4 from statictext within w_banco_fluid
integer x = 3131
integer y = 16
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
string text = "Buscar por Nro Sello:"
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_banco_fluid
integer x = 2729
integer y = 608
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Rechazar Bolsa"
end type

event clicked;if dw_bolsas.rowcount()=0 then return
if not isnull(dw_bolsas.getitemnumber(dw_bolsas.getrow(),'nro_sello')) then
	messagebox('Atención','El recipiente ya tiene sello de calidad no lo puede borrar')
	return
end if
st_xa_anular st_anula
st_anula.tipo='BS'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
dw_bolsas.setitem(dw_bolsas.getrow(),'estado','X')
dw_bolsas.setitem(dw_bolsas.getrow(),'motiv_rechazo',st_anula.observacion)
dw_bolsas.setitem(dw_bolsas.getrow(),'cod_anula',st_anula.motivo)
if dw_bolsas.update()= -1 then
	dw_bolsas.retrieve(dw_histo.getitemstring(dw_histo.getrow(),'clugar'),dw_histo.getitemnumber(dw_histo.getrow(),'nro_donacion'))
else
	commit;
end if
end event

type pb_1 from picturebutton within w_banco_fluid
integer x = 2565
integer y = 608
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar Bolsas"
end type

event clicked;if dw_histo.rowcount()=0 then return
if dw_histo.getitemstring(dw_histo.getrow(),'apto')='0' then return
if not isnull(dw_histo.getitemstring(dw_histo.getrow(),'estado')) then return
if dw_histo.getitemstring(dw_histo.getrow(),'aprobado')<>'0' then return
if dw_bolsas.rowcount()>0 then
	messagebox('Atención','Ya no puede agregar bolsas')
	return
end if
open(w_selecc_produc)
end event

type dw_pruebas from datawindow within w_banco_fluid
boolean visible = false
integer x = 1760
integer y = 524
integer width = 87
integer height = 80
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_banco_prueb_prelim"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type dw_items from datawindow within w_banco_fluid
boolean visible = false
integer x = 1751
integer y = 436
integer width = 110
integer height = 72
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_banco_item_encuesta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type pb_del from picturebutton within w_banco_fluid
integer x = 1751
integer y = 288
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Cancelar nueva donación o Anular una ya existente"
end type

event clicked;if dw_histo.rowcount()=0 then return
if isnull(dw_histo.getitemnumber(dw_histo.getrow(),'nro_donacion')) then
	i_encuesta=false
	dw_histo.deleterow(0)
	dw_histo.event rowfocuschanged(dw_histo.getrow())
	tab_1.tp_2.enabled=true
	tab_1.tp_3.enabled=true
else
	st_xa_anular st_anula
	st_anula.tipo='BS'
	openwithparm (w_motiv_anula,st_anula)
	st_anula=message.powerobjectparm
	if not isValid(st_anula) then return
	dw_histo.setitem(dw_histo.getrow(),'estado',usuario)
	dw_histo.setitem(dw_histo.getrow(),'motiv_anula',st_anula.observacion)
	dw_histo.setitem(dw_histo.getrow(),'motiv_anula',st_anula.motivo)
	dw_histo.setitem(dw_histo.getrow(),'fecha_anula',datetime(today(),now()))
	long j
	for j=1 to dw_bolsas.rowcount()
		dw_bolsas.setitem(j,'estado','A')
	next
	if dw_histo.update(true,false)=-1 then return
	if dw_bolsas.update(true,false)=-1 then return
	commit;
	dw_histo.resetupdate()
	dw_bolsas.resetupdate()
end if
end event

type pb_insert from picturebutton within w_banco_fluid
integer x = 1751
integer y = 156
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
string picturename = "insertar.gif"
alignment htextalign = left!
end type

event clicked;if i_encuesta then return
if isnull(dw_1.getitemstring(1,1)) or docu='' or isnull(docu) then return
if dw_banco_pac.rowcount()>0 then
	if dw_banco_pac.getitemstring(1,'apto')='0' then
		messagebox('Atención','Este paciente no es apto para donar')
		return
	end if
end if
dw_histo.insertrow(1)
dw_histo.scrolltorow(1)
dw_histo.setitem(1,'clugar',clugar)
dw_histo.setitem(1,'anyo',year(today()))
dw_histo.setitem(1,'clugar',clugar)
dw_histo.setitem(1,'cod_banco',i_banco)
dw_histo.setitem(1,'cod_tipodon',idw_tipodon.getitemstring(1,'cod_tipodon'))
dw_histo.setitem(1,'tipodoc',tipdoc)
dw_histo.setitem(1,'documento',docu)
dw_histo.setitem(1,'fecha',datetime(today(),now()))
dw_histo.setitem(1,'usuario',usuario)
dw_items.dataobject='dw_banco_item_encuesta'
dw_items.settransobject(sqlca)
dw_items.retrieve(i_banco,w_principal.dw_1.getitemstring(1,'sexo'))
tab_1.tp_1.dw_enc.reset()
long j,donde
tab_1.tp_1.dw_enc.setredraw(false)
for j=1 to dw_items.rowcount()
	tab_1.tp_1.dw_enc.insertrow(j)
	tab_1.tp_1.dw_enc.setitem(j,'tipo',dw_items.getitemstring(j,'tipo'))
	tab_1.tp_1.dw_enc.setitem(j,'descrip_item',upper(dw_items.getitemstring(j,'descrip_item')))
	tab_1.tp_1.dw_enc.setitem(j,'item',dw_items.getitemnumber(j,'item'))
	tab_1.tp_1.dw_enc.setitem(j,'clugar',clugar)
	tab_1.tp_1.dw_enc.setitem(j,'cod_banco',i_banco)
	tab_1.tp_1.dw_enc.setitem(j,'item_enc',dw_items.getitemnumber(j,'item'))
	tab_1.tp_1.dw_enc.setitem(j,'obligatorio',dw_items.getitemstring(j,'obligatorio'))
next
for j=1 to dw_caract.rowcount()
	donde=tab_1.tp_1.dw_enc.find('item='+string(dw_caract.getitemnumber(j,'item')),1,tab_1.tp_1.dw_enc.rowcount())
	if donde=0 then continue
	tab_1.tp_1.dw_enc.setitem(donde,'descrip_lista',dw_caract.getitemstring(j,'descrip_lista'))
	tab_1.tp_1.dw_enc.setitem(donde,'subitem',dw_caract.getitemnumber(j,'subitem'))
	tab_1.tp_1.dw_enc.setitem(donde,'bloquear','1')
next
tab_1.tp_1.dw_enc.sort()
tab_1.tp_1.dw_enc.groupcalc()
tab_1.tp_1.dw_enc.setredraw(true)
tab_1.tp_1.dw_enc.event rowfocuschanged(1)
tab_1.tp_2.enabled=false
tab_1.tp_3.enabled=false
tab_1.tp_1.pb_enc.enabled=true
tab_1.selectedtab=1
i_encuesta=true


end event

type tab_1 from tab within w_banco_fluid
integer x = 9
integer y = 724
integer width = 3931
integer height = 1148
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 144
integer width = 3895
integer height = 988
long backcolor = 67108864
string text = "Encuesta"
long tabtextcolor = 33554432
string picturename = "editar.gif"
long picturemaskcolor = 536870912
string powertiptext = "Encuesta Preliminar"
pb_2 pb_2
pb_enc pb_enc
dw_enc dw_enc
end type

on tp_1.create
this.pb_2=create pb_2
this.pb_enc=create pb_enc
this.dw_enc=create dw_enc
this.Control[]={this.pb_2,&
this.pb_enc,&
this.dw_enc}
end on

on tp_1.destroy
destroy(this.pb_2)
destroy(this.pb_enc)
destroy(this.dw_enc)
end on

type pb_2 from pb_report within tp_1
integer x = 3675
integer y = 164
integer taborder = 50
string powertiptext = "Imprimir la encuesta"
string cod_rep = "ENC"
string nombre_rep = "Encuesta de Bancos"
string tipo_rep = "interno!"
end type

event constructor;call super::constructor;inicia()
end event

event clicked;call super::clicked;if dw_histo.rowcount()=0 or dw_enc.rowcount()=0 then return
any parm[2]
parm[1]=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
parm[2]=dw_histo.getitemnumber(dw_histo.getrow(),'nro_donacion')
imprimir(parm,'','0')

end event

type pb_enc from picturebutton within tp_1
string tag = "Siguiente"
integer x = 3675
integer y = 16
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
string picturename = "ultimo.gif"
string disabledname = "d_ultimo.gif"
alignment htextalign = left!
string powertiptext = "Siguiente"
end type

event clicked;if dw_histo.rowcount()=0 then return
if dw_histo.getitemstring(dw_histo.getrow(),'apto')='0' then 
	messagebox('Atención','Esta Donación ya fue marcada como no Apta')
	return
end if
long j,respu
respu=grabar()
if respu=-1 then 
	rollback;
	return
else
	commit;
end if
if respu=2 or respu=3 then return
if tab_1.tp_2.dw_prelim.rowcount()>0 then return
dw_items.dataobject='dw_banco_prueba'
dw_items.settransobject(sqlca)
dw_items.retrieve(i_banco,'1')
for j=1 to dw_items.rowcount()
	tab_1.tp_2.dw_prelim.insertrow(j)
	tab_1.tp_2.dw_prelim.setitem(j,'tipo',dw_items.getitemstring(j,'tipo'))
	tab_1.tp_2.dw_prelim.setitem(j,'descrip_examen',upper(dw_items.getitemstring(j,'descrip_examen')))
	tab_1.tp_2.dw_prelim.setitem(j,'nro_examen',dw_items.getitemnumber(j,'nro_examen'))
	tab_1.tp_2.dw_prelim.setitem(j,'clugar',clugar)
	tab_1.tp_2.dw_prelim.setitem(j,'cod_banco',i_banco)
	tab_1.tp_2.dw_prelim.setitem(j,'nro_donacion',dw_histo.getitemnumber(dw_histo.getrow(),'nro_donacion'))
	tab_1.tp_2.dw_prelim.setitem(j,'nro_prueba',1)
next
tab_1.tp_2.enabled=true
tab_1.selectedtab=2
i_prelim=true
end event

type dw_enc from datawindow within tp_1
integer width = 3218
integer height = 968
integer taborder = 40
string title = "none"
string dataobject = "dw_encuesta"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;if getrow()<1 then return
if getitemstring(getrow(),'tipo')='L' then idw_lista_enc.retrieve(i_banco,getitemnumber(getrow(),'item'))


end event

event constructor;getchild('descrip_lista',idw_lista_enc)
idw_lista_enc.settransobject(sqlca)
settransobject(sqlca)
end event

event itemchanged;if dwo.name='descrip_lista' then
	setitem(getrow(),'subitem',idw_lista_enc.getitemnumber(idw_lista_enc.getrow(),'subitem'))
end if
end event

event dberror;rollback;
return 0
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 144
integer width = 3895
integer height = 988
long backcolor = 67108864
string text = "Pruebas Preliminares"
long tabtextcolor = 33554432
string picturename = "jeringa.gif"
long picturemaskcolor = 536870912
string powertiptext = "Pruebas que ayudan a Descartar un Donante"
pb_3 pb_3
pb_save_prelim pb_save_prelim
dw_prelim dw_prelim
end type

on tp_2.create
this.pb_3=create pb_3
this.pb_save_prelim=create pb_save_prelim
this.dw_prelim=create dw_prelim
this.Control[]={this.pb_3,&
this.pb_save_prelim,&
this.dw_prelim}
end on

on tp_2.destroy
destroy(this.pb_3)
destroy(this.pb_save_prelim)
destroy(this.dw_prelim)
end on

type pb_3 from pb_report within tp_2
integer x = 3241
integer y = 156
integer taborder = 60
boolean originalsize = false
string powertiptext = "Imprimir pruebas Preliminares"
string cod_rep = "BCPR"
string nombre_rep = "Pruebas Preliminares"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_histo.rowcount()=0 or dw_prelim.rowcount()=0 then return
any parm[2]
parm[1]=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
parm[2]=dw_histo.getitemnumber(dw_histo.getrow(),'nro_donacion')
imprimir(parm,'','0')

end event

event constructor;call super::constructor;inicia()
end event

type pb_save_prelim from picturebutton within tp_2
string tag = "Siguiente"
integer x = 3241
integer y = 8
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
string picturename = "ultimo.gif"
string disabledname = "d_ultimo.gif"
string powertiptext = "Guardar Prelim. e insertar recipientes"
end type

event clicked;if dw_histo.rowcount()=0 then return
if dw_histo.getitemstring(dw_histo.getrow(),'apto')='0' then return
long respu
respu=grabar()
if respu=-1 then
	rollback;
else
	commit;
end if
if respu=2 or respu=3 then return
if dw_bolsas.rowcount()>0 then return
open(w_selecc_produc)
if message.stringparm='ok' then
	tab_1.tp_3.enabled=true
	tab_1.selectedtab=3
end if
end event

type dw_prelim from datawindow within tp_2
integer x = 41
integer y = 52
integer width = 2990
integer height = 764
integer taborder = 40
string title = "none"
string dataobject = "dw_banco_prueb_prelim"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type tp_3 from userobject within tab_1
integer x = 18
integer y = 144
integer width = 3895
integer height = 988
long backcolor = 67108864
string text = "Pruebas Infecciosas"
long tabtextcolor = 33554432
string picturename = "ojo.gif"
long picturemaskcolor = 536870912
string powertiptext = "Para rechazar o no una muestra"
pb_aprobar pb_aprobar
dw_matriz dw_matriz
pb_infecc pb_infecc
end type

on tp_3.create
this.pb_aprobar=create pb_aprobar
this.dw_matriz=create dw_matriz
this.pb_infecc=create pb_infecc
this.Control[]={this.pb_aprobar,&
this.dw_matriz,&
this.pb_infecc}
end on

on tp_3.destroy
destroy(this.pb_aprobar)
destroy(this.dw_matriz)
destroy(this.pb_infecc)
end on

type pb_aprobar from picturebutton within tp_3
integer x = 3054
integer y = 220
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
string disabledname = "d_aceptar.gif"
string powertiptext = "Aprobar Donación"
end type

event clicked;if not i_infecc then return
if grabar()=-1 then
	rollback;
else
	commit;
end if

end event

type dw_matriz from datawindow within tp_3
integer x = 27
integer y = 52
integer width = 2953
integer height = 896
integer taborder = 30
string title = "none"
string dataobject = "dw_matriz"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_infecc from picturebutton within tp_3
integer x = 3054
integer y = 52
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
string powertiptext = "Insertar Pruebas Infecciosas"
end type

event clicked;if i_infecc then return
if dw_bolsas.rowcount()=0 then
	messagebox('Atención','Debe primero insertar los recipientes de la Donación')
	return 
end if
if dw_matriz.rowcount()>=3 then return
long k
boolean rechazar
if tab_1.tp_3.dw_matriz.rowcount()=1 then
	for k=1 to tab_1.tp_3.dw_matriz.getitemnumber(1,'nro_pruebas')
		if tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>0 then
			rechazar=true
			exit
		end if
	next
	if not rechazar then
		messagebox('Atención','A esta muestra no es necesario realizarle más pruebas')
		return
	end if
end if
if tab_1.tp_3.dw_matriz.rowcount()=2 then
	for k=1 to tab_1.tp_3.dw_matriz.getitemnumber(1,'nro_pruebas')
		if tab_1.tp_3.dw_matriz.getitemnumber(1,'sum'+string(k))>1 then
			rechazar=true
			exit
		end if
	next
	if rechazar then
		messagebox('Atención','A esta muestra no es necesario realizarle más pruebas')
		return
	end if
end if
dw_items.dataobject='dw_banco_prueba'
dw_items.settransobject(sqlca)
dw_items.retrieve(i_banco,'0')
long j,donde
donde=dw_matriz.insertrow(0)
dw_matriz.setitem(donde,'nro_pruebas',dw_items.rowcount())
dw_matriz.setitem(donde,'prueba',donde)
for j=1 to dw_items.rowcount()
	dw_matriz.modify('sino'+string(j)+'_t.text="'+dw_items.getitemstring(j,'descrip_examen')+'"')
	dw_matriz.setitem(donde,'riesgo'+string(j),dw_items.getitemstring(j,'riesgo'))
	dw_matriz.setitem(donde,'nro_exa'+string(j),dw_items.getitemnumber(j,'nro_examen'))
next
i_infecc=true
end event

type st_3 from statictext within w_banco_fluid
integer x = 1906
integer y = 96
integer width = 681
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recipientes de la Donación:"
boolean focusrectangle = false
end type

type dw_bolsas from datawindow within w_banco_fluid
integer x = 1906
integer y = 152
integer width = 2034
integer height = 448
integer taborder = 40
string title = "none"
string dataobject = "dw_banco_bolsas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
modify('proced_descripcion.protect="1"')
end event

type st_1 from statictext within w_banco_fluid
integer x = 18
integer y = 100
integer width = 558
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Donaciones del Paciente:"
boolean focusrectangle = false
end type

type dw_histo from datawindow within w_banco_fluid
integer x = 9
integer y = 164
integer width = 1723
integer height = 548
integer taborder = 30
string title = "none"
string dataobject = "dw_banco_donacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_tipodon',idw_tipodon)
idw_tipodon.settransobject(sqlca)

end event

event rowfocuschanged;if getrow()<1 then return
tab_1.tp_2.dw_prelim.retrieve(getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'nro_donacion'),'1')
tab_1.tp_1.dw_enc.retrieve(getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'nro_donacion'))
dw_bolsas.retrieve(getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'nro_donacion'))
dw_pruebas.retrieve(getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'nro_donacion'),'0')
tab_1.tp_3.dw_matriz.reset()
long j,k,donde,nro_donacion,maxi
nro_donacion=getitemnumber(getrow(),'nro_donacion')
string clug
clug=getitemstring(getrow(),'clugar')
select max(nro_prueba) into :maxi from banco_resul_pruebas where clugar=:clug
and nro_donacion =:nro_donacion and cod_banco=:i_banco;
for k=1 to maxi
	dw_pruebas.setfilter('nro_prueba='+string(k))
	dw_pruebas.filter()
	if dw_pruebas.rowcount()=0 then continue
	donde=tab_1.tp_3.dw_matriz.insertrow(0)
	tab_1.tp_3.dw_matriz.setitem(donde,'nro_pruebas',dw_pruebas.rowcount())
	tab_1.tp_3.dw_matriz.setitem(donde,'prueba',k)
	for j=1 to dw_pruebas.rowcount()
		tab_1.tp_3.dw_matriz.modify('sino'+string(j)+'_t.text="'+dw_pruebas.getitemstring(j,'descrip_examen')+'"')
		tab_1.tp_3.dw_matriz.setitem(k,'sino'+string(j),dw_pruebas.getitemstring(j,'si_no'))
		tab_1.tp_3.dw_matriz.setitem(k,'riesgo'+string(j),dw_pruebas.getitemstring(j,'riesgo'))
	next
next
tab_1.tp_3.dw_matriz.resetupdate()
end event

event dberror;rollback;
return 0
end event

event rowfocuschanging;if i_encuesta or i_prelim or i_infecc then return 1
end event

type em_1 from editmask within w_banco_fluid
integer x = 2455
integer y = 8
integer width = 229
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "2000~~2050"
end type

event constructor;text=string(year(today()))
end event

type st_2 from statictext within w_banco_fluid
integer x = 1710
integer y = 16
integer width = 736
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar X Nro Donación (Año-Nro)"
boolean focusrectangle = false
end type

type em_muestra from editmask within w_banco_fluid
integer x = 2702
integer y = 8
integer width = 315
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "######"
end type

event modified;if isnull(dw_1.getitemstring(1,1)) then return
string tdoc,doc
long consec
consec=long(text)
if em_1.enabled then
	if isnull(em_1.text) then 
		messagebox('Atención','Digite el año')
		return
	end if
	long anyo
	anyo=long(em_1.text)
	select tipodoc,documento into :tdoc,:doc from banco_donacion 
	where cod_banco=:i_banco and anyo=:anyo and consec_donacion=:consec;
else
	select tipodoc,documento into :tdoc,:doc from banco_donacion 
	where cod_banco=:i_banco and consec_donacion=:consec;
end if
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo banco_donacion',sqlca.sqlerrtext)
	return
end if
if isnull(doc) or doc='' then
	messagebox('Atención','No se encontró esta donación')
	return
end if
if tdoc<>tipdoc or doc<> docu then
	w_principal.dw_1.setitem(1,1,tdoc)
	w_principal.dw_1.setitem(1,2,doc)
	w_principal.dw_1.setcolumn(2)
	w_principal.dw_1.triggerevent(itemchanged!)
end if
dw_histo.scrolltorow(dw_histo.find('consec_donacion='+string(consec),1,dw_histo.rowcount()))

end event

type dw_1 from datawindow within w_banco_fluid
integer width = 1536
integer height = 80
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_banco_fluid"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('cod_banco',idw_banco)
idw_banco.settransobject(sqlca)
idw_banco.retrieve()
settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string actual
actual=getitemstring(1,string(dwo.name))
if idw_tipodon.retrieve(data)=0 then
	settext(actual)
	setitem(1,1,actual)
	messagebox('Atención','No se ha definido tipos de donación para este banco')
	return 2
end if
choose case f_pregunta()
	case 1//cambio y debe guardar
		if grabar()=-1 then 
			setitem(1,1,actual)
			return 1
		else
			commit;
		end if
	case 2// no cambio o no va a guardar
		i_encuesta=false
		i_prelim=false
		i_infecc=false
	case 3//cancelar
		setitem(1,1,actual)
		return 1
end choose
i_banco=data
long donde
donde=idw_banco.find('cod_banco="'+i_banco+'"',1,idw_banco.rowcount())
i_cdoc=idw_banco.getitemstring(donde,'coddoc_sello')
if isnull(i_cdoc) or i_cdoc='' then
	messagebox('Atención','Este Banco no tiene configurado un documento, debe colocarlo para continuar')
	close(parent)
	return
end if
if idw_banco.getitemstring(donde,'consec_x_anyo')='1' then
	em_1.enabled=true
	i_consec_x_anyo=true
else
	em_1.enabled=false
	i_consec_x_anyo=false
end if
reset_dws()
dw_histo.retrieve(i_banco,tipdoc,docu)
dw_banco_pac.retrieve(tipdoc,docu,i_banco)
dw_caract.retrieve(tipdoc,docu,i_banco)
tab_1.tp_2.enabled=true
tab_1.tp_3.enabled=true
pb_5.inicia('documento!',i_cdoc,clugar)
end event

type gb_1 from groupbox within w_banco_fluid
integer y = 80
integer width = 7483
integer height = 8
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

