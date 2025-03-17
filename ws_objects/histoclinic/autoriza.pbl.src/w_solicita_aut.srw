$PBExportHeader$w_solicita_aut.srw
forward
global type w_solicita_aut from window
end type
type l_correos from listbox within w_solicita_aut
end type
type pb_2 from picturebutton within w_solicita_aut
end type
type dw_1 from datawindow within w_solicita_aut
end type
type t1 from tab within w_solicita_aut
end type
type p4 from userobject within t1
end type
type pb_cext from picturebutton within p4
end type
type dw_emppac from datawindow within p4
end type
type gb_1 from groupbox within p4
end type
type soli from tab within p4
end type
type interna from userobject within soli
end type
type pb_aut_cie from picturebutton within interna
end type
type st_11 from statictext within interna
end type
type dw_ord_cext from datawindow within interna
end type
type interna from userobject within soli
pb_aut_cie pb_aut_cie
st_11 st_11
dw_ord_cext dw_ord_cext
end type
type externa from userobject within soli
end type
type st_12 from statictext within externa
end type
type pb_8 from picturebutton within externa
end type
type pb_7 from picturebutton within externa
end type
type pb_6 from picturebutton within externa
end type
type pb_5 from picturebutton within externa
end type
type dw_cpo_sol from datawindow within externa
end type
type dw_dxext from datawindow within externa
end type
type sle_des_dx from statictext within externa
end type
type gb_5 from groupbox within externa
end type
type externa from userobject within soli
st_12 st_12
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
dw_cpo_sol dw_cpo_sol
dw_dxext dw_dxext
sle_des_dx sle_des_dx
gb_5 gb_5
end type
type soli from tab within p4
interna interna
externa externa
end type
type p4 from userobject within t1
pb_cext pb_cext
dw_emppac dw_emppac
gb_1 gb_1
soli soli
end type
type p1 from userobject within t1
end type
type pb_11 from pb_report within p1
end type
type st_20 from statictext within p1
end type
type st_19 from statictext within p1
end type
type st_17 from statictext within p1
end type
type st_16 from statictext within p1
end type
type dp_4 from datepicker within p1
end type
type dp_3 from datepicker within p1
end type
type st_10 from statictext within p1
end type
type pb_4 from picturebutton within p1
end type
type dw_pac from datawindow within p1
end type
type p1 from userobject within t1
pb_11 pb_11
st_20 st_20
st_19 st_19
st_17 st_17
st_16 st_16
dp_4 dp_4
dp_3 dp_3
st_10 st_10
pb_4 pb_4
dw_pac dw_pac
end type
type p2 from userobject within t1
end type
type pb_12 from picturebutton within p2
end type
type mle_1 from multilineedit within p2
end type
type rte_1 from richtextedit within p2
end type
type dw_formato from datawindow within p2
end type
type cb_ubica from commandbutton within p2
end type
type pb_envia from picturebutton within p2
end type
type pb_guardar from picturebutton within p2
end type
type pb_cancela from picturebutton within p2
end type
type pb_nuevo from picturebutton within p2
end type
type pb_1 from picturebutton within p2
end type
type pb_add from picturebutton within p2
end type
type st_2 from statictext within p2
end type
type dw_cpo from datawindow within p2
end type
type dw_au from datawindow within p2
end type
type p2 from userobject within t1
pb_12 pb_12
mle_1 mle_1
rte_1 rte_1
dw_formato dw_formato
cb_ubica cb_ubica
pb_envia pb_envia
pb_guardar pb_guardar
pb_cancela pb_cancela
pb_nuevo pb_nuevo
pb_1 pb_1
pb_add pb_add
st_2 st_2
dw_cpo dw_cpo
dw_au dw_au
end type
type p5 from userobject within t1
end type
type st_22 from statictext within p5
end type
type st_21 from statictext within p5
end type
type pb_10 from pb_report within p5
end type
type st_15 from statictext within p5
end type
type st_14 from statictext within p5
end type
type dp_2 from datepicker within p5
end type
type dp_1 from datepicker within p5
end type
type pb_9 from picturebutton within p5
end type
type dw_2 from datawindow within p5
end type
type p5 from userobject within t1
st_22 st_22
st_21 st_21
pb_10 pb_10
st_15 st_15
st_14 st_14
dp_2 dp_2
dp_1 dp_1
pb_9 pb_9
dw_2 dw_2
end type
type p3 from userobject within t1
end type
type st_18 from statictext within p3
end type
type st_13 from statictext within p3
end type
type dp_6 from datepicker within p3
end type
type dp_5 from datepicker within p3
end type
type pb_3 from picturebutton within p3
end type
type st_3 from statictext within p3
end type
type dw_hist from datawindow within p3
end type
type st_9 from statictext within p3
end type
type st_8 from statictext within p3
end type
type st_5 from statictext within p3
end type
type st_4 from statictext within p3
end type
type st_7 from statictext within p3
end type
type st_1 from statictext within p3
end type
type st_6 from statictext within p3
end type
type dw_historial from datawindow within p3
end type
type p3 from userobject within t1
st_18 st_18
st_13 st_13
dp_6 dp_6
dp_5 dp_5
pb_3 pb_3
st_3 st_3
dw_hist dw_hist
st_9 st_9
st_8 st_8
st_5 st_5
st_4 st_4
st_7 st_7
st_1 st_1
st_6 st_6
dw_historial dw_historial
end type
type t1 from tab within w_solicita_aut
p4 p4
p1 p1
p2 p2
p5 p5
p3 p3
end type
type gb_4 from groupbox within w_solicita_aut
end type
end forward

global type w_solicita_aut from window
integer width = 4695
integer height = 2308
boolean titlebar = true
string title = "Solicitud de Autorizaciones"
boolean controlmenu = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "autoriza.ico"
boolean clientedge = true
boolean center = true
l_correos l_correos
pb_2 pb_2
dw_1 dw_1
t1 t1
gb_4 gb_4
end type
global w_solicita_aut w_solicita_aut

type variables
boolean ib_cambio, ib_cancela,ib_cext
long fcpo
int ing=0
string serv
datetime inicia,fin,inicia_ing,fin_ing,inicia_his,fin_his
DataWindowChild idw_tiping,idw_fincon,idw_causaex

end variables
forward prototypes
public function string f_retorno_mail (mailreturncode a_mailreturncode)
public subroutine filtre_ing ()
public subroutine filtre_serv ()
public subroutine filtre_his ()
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

public subroutine filtre_ing ();date fec
fec =t1.p1.dp_3.datevalue 
inicia_ing=datetime(date(fec),time('00:00'))
fec =t1.p1.dp_4.datevalue 
fin_ing=datetime(date(fec),time('23:59'))
t1.p1.dw_pac.retrieve(serv,clugar,inicia_ing,fin_ing)
t1.p1.st_20.text=string(t1.p1.dw_pac.rowcount())+' Regs.'

end subroutine

public subroutine filtre_serv ();date fec
fec =t1.p5.dp_1.datevalue 
inicia=datetime(date(fec),time('00:00'))
fec =t1.p5.dp_2.datevalue 
fin=datetime(date(fec),time('23:59'))
t1.p5.dw_2.retrieve(serv,clugar,inicia,fin)
t1.p5.st_21.text=string(t1.p5.dw_2.rowcount())+' Regs.'
end subroutine

public subroutine filtre_his ();date fec
fec =t1.p3.dp_5.datevalue 
inicia_his=datetime(date(fec),time('00:00'))
fec =t1.p3.dp_6.datevalue 
fin_his=datetime(date(fec),time('23:59'))
t1.p3.dw_historial.retrieve(serv,clugar,inicia_his,fin_his)



end subroutine

on w_solicita_aut.create
this.l_correos=create l_correos
this.pb_2=create pb_2
this.dw_1=create dw_1
this.t1=create t1
this.gb_4=create gb_4
this.Control[]={this.l_correos,&
this.pb_2,&
this.dw_1,&
this.t1,&
this.gb_4}
end on

on w_solicita_aut.destroy
destroy(this.l_correos)
destroy(this.pb_2)
destroy(this.dw_1)
destroy(this.t1)
destroy(this.gb_4)
end on

event open;setnull(t1.p4.soli.externa.sle_des_dx.text)
setnull(t1.p4.soli.externa.sle_des_dx.tag)

	
end event

type l_correos from listbox within w_solicita_aut
boolean visible = false
integer x = 2816
integer y = 360
integer width = 242
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type pb_2 from picturebutton within w_solicita_aut
integer x = 3739
integer y = 36
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Refresca Estados"
end type

event clicked;t1.p1.dw_pac.reset()
t1.p3.dw_historial.Reset()
t1.p1.dw_pac.retrieve(serv,clugar,inicia_ing,fin_ing)
t1.p5.dw_2.retrieve(serv,clugar,inicia,fin)
t1.p3.dw_historial.retrieve(serv,clugar,inicia_his,fin_his)
end event

type dw_1 from datawindow within w_solicita_aut
integer x = 82
integer y = 52
integer width = 1285
integer height = 88
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_tipo_ingreso"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_tipo
accepttext()
ls_tipo = getItemString(1,1)
serv=data
if ls_tipo ='2' or ls_tipo ='3'  or ls_tipo ='4' or ls_tipo ='7' then
	t1.p1.enabled=true
	t1.p2.enabled=true
	t1.p3.enabled=true
	t1.p5.enabled=true
	t1.p4.enabled=false
	t1.SelectedTab = 2
	t1.p4.pb_cext.enabled=false
	t1.p3.pb_3.enabled=true
	t1.p4.dw_emppac.enabled=false
	t1.p4.soli.interna.enabled=false
	t1.p4.soli.externa.enabled=false
	t1.p4.soli.interna.dw_ord_cext.enabled=false
	t1.p4.soli.externa.dw_cpo_sol.enabled=false
	if ls_tipo ='2' then
		t1.p5.dw_2.DataObject ='dw_servcios_pendientes_ingreso_urge'
	else
		t1.p5.dw_2.DataObject ='dw_servcios_pendientes_ingreso_hosp'
	end if
	t1.p5.dw_2.setTransObject(SQLCA)
else
	t1.p1.enabled=false
	t1.p2.enabled=true
	t1.p3.enabled=true
	t1.p4.enabled=true
	t1.p5.enabled=false
	t1.p4.dw_emppac.enabled=true
	t1.p4.soli.interna.enabled=true
	t1.p4.soli.externa.enabled=true
	t1.p4.soli.interna.dw_ord_cext.enabled=true
	t1.p4.soli.externa.dw_cpo_sol.enabled=true
	t1.p4.	pb_cext.enabled=false
	t1.SelectedTab = 1
	t1.p3.pb_3.enabled=false
end if

choose case data
	case '1'
		int l_cuan
		select count(tipodoc) into :l_cuan from pacientes where tipodoc=:tipdoc and  documento=:docu;
		if sqlca.sqlcode=-1 then 
			messagebox("Error leyendo de Pacientes",sqlca.sqlerrtext)
			return
		end if
		if l_cuan=0 then 
			messagebox("Atención",'Elija usuario a asignar')
			return 0
		end if
		t1.p4.dw_emppac.retrieve(tipdoc,docu)
		t1.p4.soli.interna.dw_ord_cext.retrieve(tipdoc,docu)		
	case '2'
		t1.p1.dw_pac.DataObject= 'dw_ingresos_urg'
		t1.p1.dw_pac.SetTransObject(SQLCA)
	case '3','7'
		t1.p1.dw_pac.DataObject= 'dw_ingresos_hosp'
		t1.p1.dw_pac.SetTransObject(SQLCA)	
end choose
if ib_cambio then
	int ret 
	ret = MessageBox('Atención','Ha realizado cambios. Desea guardarlos?',Question!,yesnocancel!)
	if ret = 1 then
		if t1.p2.pb_guardar.event clicked() = -1 then return -1
	elseif ret = 2 then
		//t1.p3.dw_hist.Reset()
		ib_cambio = FALSE
	else
		setItem(1,1,ls_tipo)
		setText(ls_tipo)
		Return 1
	end if
end if
accepttext()
t1.p1.dw_pac.reset()
t1.p3.dw_historial.Reset()
filtre_ing()
filtre_his()
filtre_serv()

end event

event constructor;setTransObject(SQLCA)
getchild('tipo_ingreso',idw_tiping)
idw_tiping.settransobject(sqlca)
idw_tiping.retrieve()
idw_tiping.setfilter("estado='1'")
idw_tiping.filter()

insertRow(0)

end event

type t1 from tab within w_solicita_aut
string tag = "Consulta Externa"
integer x = 59
integer y = 196
integer width = 4526
integer height = 1952
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
p4 p4
p1 p1
p2 p2
p5 p5
p3 p3
end type

on t1.create
this.p4=create p4
this.p1=create p1
this.p2=create p2
this.p5=create p5
this.p3=create p3
this.Control[]={this.p4,&
this.p1,&
this.p2,&
this.p5,&
this.p3}
end on

on t1.destroy
destroy(this.p4)
destroy(this.p1)
destroy(this.p2)
destroy(this.p5)
destroy(this.p3)
end on

type p4 from userobject within t1
integer x = 18
integer y = 112
integer width = 4489
integer height = 1824
long backcolor = 67108864
string text = "Consulta externa"
long tabtextcolor = 33554432
string picturename = "medico.ico"
long picturemaskcolor = 536870912
pb_cext pb_cext
dw_emppac dw_emppac
gb_1 gb_1
soli soli
end type

on p4.create
this.pb_cext=create pb_cext
this.dw_emppac=create dw_emppac
this.gb_1=create gb_1
this.soli=create soli
this.Control[]={this.pb_cext,&
this.dw_emppac,&
this.gb_1,&
this.soli}
end on

on p4.destroy
destroy(this.pb_cext)
destroy(this.dw_emppac)
destroy(this.gb_1)
destroy(this.soli)
end on

type pb_cext from picturebutton within p4
integer x = 4302
integer y = 60
integer width = 146
integer height = 128
integer taborder = 30
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
string powertiptext = "LLevar Servicios a Autorizar"
end type

event clicked;if ib_cext=true and  isnull(t1.p4.soli.externa.dw_dxext.getitemstring(1,'dx')) then
	messageBox('Atención','No se cargado Dx para autorizar')
	return
end if
if ib_cext=true and  isnull(t1.p4.soli.externa.dw_dxext.getitemstring(1,'cext')) then
	messageBox('Atención','No se cargado Causa Externa autorizar')
	return
end if

if ib_cext=true and isnull( t1.p4.soli.externa.dw_dxext.getitemstring(1,'finali')) then
	messageBox('Atención','No se cargadoFinalidad  para autorizar')
	return
end if

if ib_cext=true and  isnull(t1.p4.soli.externa.dw_dxext.getitemstring(1,'modrel')) then
	messageBox('Atención','No se cargado Modalidad de realización para autorizar')
	return
end if

if ib_cext=true and  isnull(t1.p4.soli.externa.dw_dxext.getitemstring(1,'prioridad')) then
	messageBox('Atención','No se cargado  Prioridad para autorizar')
	return
end if

if ib_cext=true and t1.p4.soli.externa.dw_cpo_sol.rowcount()=0 then
	messageBox('Atención','No se cargado ningun procedimiento para autorizar')
	return
end if

If ib_cext=false and t1.p4.soli.interna.dw_ord_cext.rowcount()=0 then
	messageBox('Atención','No se cargado ningun procedimiento para autorizar')
	return
end if
ing=0
t1.SelectTab(3)
t1.p2.pb_nuevo.Event clicked()

end event

type dw_emppac from datawindow within p4
event retrie ( )
integer x = 101
integer y = 76
integer width = 4128
integer height = 396
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_empacguarda"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrie();retrieve(tipdoc,docu)

end event

event constructor;setTransObject(SQLCA)

end event

type gb_1 from groupbox within p4
integer x = 50
integer y = 12
integer width = 4219
integer height = 500
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Afiliaciones Paciente"
borderstyle borderstyle = styleraised!
end type

type soli from tab within p4
integer x = 59
integer y = 536
integer width = 4302
integer height = 1220
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean powertips = true
integer selectedtab = 1
interna interna
externa externa
end type

on soli.create
this.interna=create interna
this.externa=create externa
this.Control[]={this.interna,&
this.externa}
end on

on soli.destroy
destroy(this.interna)
destroy(this.externa)
end on

event selectionchanged;if newindex=1 then
	ib_cext=false
else
	ib_cext=true
end if
 
end event

type interna from userobject within soli
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4265
integer height = 1092
long backcolor = 67108864
string text = "Solicitud Interna"
long tabtextcolor = 33554432
string picturename = "Regenerate5!"
long picturemaskcolor = 536870912
string powertiptext = "Ordenes de Solictud Interna que requieren Autorización"
pb_aut_cie pb_aut_cie
st_11 st_11
dw_ord_cext dw_ord_cext
end type

on interna.create
this.pb_aut_cie=create pb_aut_cie
this.st_11=create st_11
this.dw_ord_cext=create dw_ord_cext
this.Control[]={this.pb_aut_cie,&
this.st_11,&
this.dw_ord_cext}
end on

on interna.destroy
destroy(this.pb_aut_cie)
destroy(this.st_11)
destroy(this.dw_ord_cext)
end on

type pb_aut_cie from picturebutton within interna
boolean visible = false
integer x = 73
integer width = 142
integer height = 56
integer taborder = 11
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
alignment htextalign = left!
end type

event clicked;if f_permiso_boton(this,'AUTO')=0 then return -1

end event

type st_11 from statictext within interna
integer x = 41
integer y = 964
integer width = 2798
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione la Empresa por la cual desea efectuar autorización, y luego los servicios que desea autorizar y de click en el boton  llevar servicios"
boolean focusrectangle = false
end type

type dw_ord_cext from datawindow within interna
integer x = 32
integer y = 56
integer width = 4183
integer height = 868
integer taborder = 23
boolean enabled = false
string dataobject = "dw_os_cpo_no_auto"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;setTransObject(SQLCA)
end event

event clicked;t1.p4.	pb_cext.enabled=true

end event

event buttonclicked;if row=0 then return -1
if dwo.name='b_cier' then
	If  t1.p4.soli.interna.pb_aut_cie.Event clicked() = 0 then
		string ls_clug_his
		double ls_norden,ls_contador
		ls_contador=t1.p4.soli.interna.dw_ord_cext.getItemNumber(row,'contador')
		ls_clug_his=t1.p4.soli.interna.dw_ord_cext.getItemString(row,'clugar')
		ls_norden=t1.p4.soli.interna.dw_ord_cext.getItemNumber(row,'nsolicitud')
		UPDATE OSCabeza SET estado = '4'
		WHERE  
			(((OSCabeza.Contador)=:ls_contador) AND 
			((OSCabeza.clugar)=:ls_clug_his) AND 
			((OSCabeza.NSolicitud)=:ls_norden));
			IF SQLCA.SQLCode = -1 THEN
				rollback;
			else
				commit;
				dw_ord_cext.retrieve(tipdoc,docu)		
			end if
	end if
end if
end event

type externa from userobject within soli
integer x = 18
integer y = 112
integer width = 4265
integer height = 1092
long backcolor = 67108864
string text = "Solicitud Externa"
long tabtextcolor = 33554432
string picturename = "Custom033!"
long picturemaskcolor = 536870912
string powertiptext = "Ordenes de Solictud Externas de la Ips que requieren Autorización"
st_12 st_12
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
dw_cpo_sol dw_cpo_sol
dw_dxext dw_dxext
sle_des_dx sle_des_dx
gb_5 gb_5
end type

on externa.create
this.st_12=create st_12
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.dw_cpo_sol=create dw_cpo_sol
this.dw_dxext=create dw_dxext
this.sle_des_dx=create sle_des_dx
this.gb_5=create gb_5
this.Control[]={this.st_12,&
this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.dw_cpo_sol,&
this.dw_dxext,&
this.sle_des_dx,&
this.gb_5}
end on

on externa.destroy
destroy(this.st_12)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.dw_cpo_sol)
destroy(this.dw_dxext)
destroy(this.sle_des_dx)
destroy(this.gb_5)
end on

type st_12 from statictext within externa
integer x = 50
integer y = 1048
integer width = 2610
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione la Empresa por la cual desea efectuar autorización, y busque y seleccione los servicios a autorizar y de click en el boton  llevar servicios"
boolean focusrectangle = false
end type

type pb_8 from picturebutton within externa
string tag = "eliminar un registro"
integer x = 4032
integer y = 444
integer width = 146
integer height = 128
integer taborder = 15
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Producto"
end type

event clicked;if t1.p4.soli.externa.dw_cpo_sol.rowcount()>0 then
	t1.p4.soli.externa.dw_cpo_sol.deleterow(t1.p4.soli.externa.dw_cpo_sol.getrow())
end if
end event

type pb_7 from picturebutton within externa
string tag = "Busca medicamento"
integer x = 4032
integer y = 300
integer width = 146
integer height = 128
integer taborder = 14
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "capsula busca.GIF"
string disabledname = "d_capsula busca.GIF"
alignment htextalign = left!
string powertiptext = "Búsqueda de Medicamentos"
end type

event clicked;st_pa_medica st_med
if dw_dxext.rowcount()=0 then dw_dxext.InsertRow(0)
st_med.dw_autoriza=t1.p4.soli.externa.dw_cpo_sol
openwithparm(w_busca_med,st_med)
t1.p4.	pb_cext.enabled=true
end event

type pb_6 from picturebutton within externa
string tag = "Busca Procedimiento"
integer x = 4027
integer y = 164
integer width = 146
integer height = 128
integer taborder = 13
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "jeringa busca.gif"
string disabledname = "d_jeringa busca.gif"
alignment htextalign = left!
string powertiptext = "Búsqueda de Procedimientos"
end type

event clicked;st_pa_proc str_proc
if dw_dxext.rowcount()=0 then dw_dxext.InsertRow(0)
str_proc.dw_autoriza=t1.p4.soli.externa.dw_cpo_sol
openwithparm(w_busca_proc,str_proc)
t1.p4.	pb_cext.enabled=true
end event

type pb_5 from picturebutton within externa
string tag = "Kits"
integer x = 4027
integer y = 36
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "kits.gif"
string disabledname = "d_kits.gif"
alignment htextalign = left!
string powertiptext = "Procedimientos Coumnes"
end type

event clicked;st_proc_comun st_pc
if dw_dxext.rowcount()=0 then dw_dxext.InsertRow(0)
st_pc.dw_autoriza=	t1.p4.soli.externa.dw_cpo_sol
openwithparm(w_kit_new,st_pc)
t1.p4.	pb_cext.enabled=true
end event

type dw_cpo_sol from datawindow within externa
integer x = 37
integer y = 428
integer width = 3899
integer height = 592
integer taborder = 130
string title = "none"
string dataobject = "dw_autoriza_cpo_ext"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;long l_actual
l_actual=getitemnumber(row,'solicitada')
if long(data)>99 then
	if messagebox('Atención','La cantidad es superior a 99 desea continuar aún así?',question!,yesno!,2)=2 then
		settext(string(l_actual))
		setitem(row,'solicitada',l_actual)
		return 2
	end if
end if

end event

type dw_dxext from datawindow within externa
integer x = 59
integer y = 80
integer width = 3863
integer height = 184
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "dw_dx_externos"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
getchild('finali',idw_fincon)
idw_fincon.settransobject(sqlca)
getchild('cext',idw_causaex)
idw_causaex.settransobject(sqlca)
idw_fincon.retrieve('1')
idw_causaex.retrieve('1')
end event

event doubleclicked;if t1.p4.dw_emppac.rowcount()=0 then return
if dwo.name="dx" then 
	st_edadsexo st_es
	st_diag st_d
	st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
	st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
	st_es.antece='0'
	st_es.proced='0'
	openwithparm(w_busca_diag,st_es)
	st_d=message.powerobjectparm
	if not isValid(st_d) then return
	if not isNull(st_d.codrip) then
		dw_dxext.setitem(1,'codgeral',st_d.codgeral)
		dw_dxext.setitem(1,'dx',st_d.codrip)
		t1.p4.soli.externa.sle_des_dx.text=st_d.descripcion
	end if
end if
end event

event itemchanged;if getcolumnname()="dx" then
	string este='',nulo
	st_return_diags st
	
	setnull(nulo)
	if trim(data)="" then 			
		setitem(1,'codgeral',nulo)
		setitem(1,'dx',nulo)
		return
	end if
	sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
	edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
	st=f_check_diag(data,sex_busca,edad_busca,este,'0','1','0')
	if st.descrip_diag="" or isnull(st.descrip_diag) then
		setitem(1,"codgeral",nulo)
		setitem(1,"dx",'')
		return 1
	else
		accepttext()
		setitem(1,"codgeral",este)
	end if
end if
end event

type sle_des_dx from statictext within externa
integer x = 59
integer y = 292
integer width = 3237
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
boolean focusrectangle = false
end type

type gb_5 from groupbox within externa
integer x = 27
integer y = 20
integer width = 3918
integer height = 356
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos Diagnósticos Solicitud:"
borderstyle borderstyle = styleraised!
end type

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 4489
integer height = 1824
long backcolor = 67108864
string text = "Admisiones Pendientes"
long tabtextcolor = 33554432
string picturename = "hospital.ico"
long picturemaskcolor = 536870912
pb_11 pb_11
st_20 st_20
st_19 st_19
st_17 st_17
st_16 st_16
dp_4 dp_4
dp_3 dp_3
st_10 st_10
pb_4 pb_4
dw_pac dw_pac
end type

on p1.create
this.pb_11=create pb_11
this.st_20=create st_20
this.st_19=create st_19
this.st_17=create st_17
this.st_16=create st_16
this.dp_4=create dp_4
this.dp_3=create dp_3
this.st_10=create st_10
this.pb_4=create pb_4
this.dw_pac=create dw_pac
this.Control[]={this.pb_11,&
this.st_20,&
this.st_19,&
this.st_17,&
this.st_16,&
this.dp_4,&
this.dp_3,&
this.st_10,&
this.pb_4,&
this.dw_pac}
end on

on p1.destroy
destroy(this.pb_11)
destroy(this.st_20)
destroy(this.st_19)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.dp_4)
destroy(this.dp_3)
destroy(this.st_10)
destroy(this.pb_4)
destroy(this.dw_pac)
end on

type pb_11 from pb_report within p1
integer x = 3685
integer y = 12
integer taborder = 30
boolean originalsize = false
string cod_rep = "ASAU"
string nombre_rep = "Admisiones Sin Autorización"
string tipo_rep = "inteno!"
end type

event clicked;call super::clicked;any par[4]
par[1]=serv
par[2]=clugar
par[3]=inicia
par[4]=fin
imprimir(par,'','0')

end event

type st_20 from statictext within p1
integer x = 3493
integer y = 1700
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean focusrectangle = false
end type

type st_19 from statictext within p1
integer x = 2985
integer y = 1704
integer width = 485
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de Registros:"
boolean focusrectangle = false
end type

type st_17 from statictext within p1
integer x = 1120
integer y = 16
integer width = 270
integer height = 104
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "F_Ingreso Final"
boolean focusrectangle = false
end type

type st_16 from statictext within p1
integer x = 91
integer y = 12
integer width = 256
integer height = 108
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "F_Ingreso Inicial"
boolean focusrectangle = false
end type

type dp_4 from datepicker within p1
integer x = 1413
integer y = 24
integer width = 686
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-03-17"), Time("10:02:36.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtre_ing()
end event

event constructor;today()
end event

type dp_3 from datepicker within p1
integer x = 352
integer y = 20
integer width = 686
integer height = 100
integer taborder = 60
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-03-17"), Time("10:02:36.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtre_ing()
end event

event constructor;today()
end event

type st_10 from statictext within p1
integer x = 78
integer y = 1684
integer width = 2437
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione el tipo de ingreso, seleccionela admisión y luego de click en el botón Solicitar nueva autorización"
boolean focusrectangle = false
end type

type pb_4 from picturebutton within p1
integer x = 3525
integer y = 12
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Solicitar nueva autorización"
end type

event clicked;ing=0
t1.SelectTab(3)
t1.p2.pb_nuevo.enabled=false
t1.p2.pb_add.enabled=true
t1.p2.pb_1.enabled=true
t1.p2.pb_nuevo.Event clicked()
t1.p2.pb_add.enabled=true
t1.p2.pb_1.enabled=true
//ing=1
end event

type dw_pac from datawindow within p1
integer x = 69
integer y = 164
integer width = 3781
integer height = 1500
integer taborder = 10
string title = "none"
string dataobject = "dw_ingresos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;if ib_cancela then 
	ib_cancela = FALSE
	return 0
end if
if row > 0 and getrow() <> row then setrow(row)

end event

event rowfocuschanged;t1.p2.dw_cpo.reset()
t1.p2.dw_au.reset()

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)

end event

event rowfocuschanging;if ib_cambio then
	int ret 
	ret = MessageBox('Atención','Ha realizado cambios. Desea guardarlos?',Question!,yesnocancel!)
	if ret = 1 then
		if t1.p2.pb_guardar.event clicked() = -1 then return -1
	elseif ret = 2 then
		ib_cambio = FALSE
	else
		ib_cancela = TRUE
		Return -1
	end if
end if
return 0

end event

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 4489
integer height = 1824
boolean enabled = false
long backcolor = 67108864
string text = "Detalle Solicitud"
long tabtextcolor = 33554432
string picturename = "Contrato.ico"
long picturemaskcolor = 536870912
pb_12 pb_12
mle_1 mle_1
rte_1 rte_1
dw_formato dw_formato
cb_ubica cb_ubica
pb_envia pb_envia
pb_guardar pb_guardar
pb_cancela pb_cancela
pb_nuevo pb_nuevo
pb_1 pb_1
pb_add pb_add
st_2 st_2
dw_cpo dw_cpo
dw_au dw_au
end type

on p2.create
this.pb_12=create pb_12
this.mle_1=create mle_1
this.rte_1=create rte_1
this.dw_formato=create dw_formato
this.cb_ubica=create cb_ubica
this.pb_envia=create pb_envia
this.pb_guardar=create pb_guardar
this.pb_cancela=create pb_cancela
this.pb_nuevo=create pb_nuevo
this.pb_1=create pb_1
this.pb_add=create pb_add
this.st_2=create st_2
this.dw_cpo=create dw_cpo
this.dw_au=create dw_au
this.Control[]={this.pb_12,&
this.mle_1,&
this.rte_1,&
this.dw_formato,&
this.cb_ubica,&
this.pb_envia,&
this.pb_guardar,&
this.pb_cancela,&
this.pb_nuevo,&
this.pb_1,&
this.pb_add,&
this.st_2,&
this.dw_cpo,&
this.dw_au}
end on

on p2.destroy
destroy(this.pb_12)
destroy(this.mle_1)
destroy(this.rte_1)
destroy(this.dw_formato)
destroy(this.cb_ubica)
destroy(this.pb_envia)
destroy(this.pb_guardar)
destroy(this.pb_cancela)
destroy(this.pb_nuevo)
destroy(this.pb_1)
destroy(this.pb_add)
destroy(this.st_2)
destroy(this.dw_cpo)
destroy(this.dw_au)
end on

type pb_12 from picturebutton within p2
integer x = 2391
integer y = 588
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
string picturename = "gnome.jpg"
alignment htextalign = left!
string powertiptext = "Ir Autorizaciones"
end type

event clicked;opensheet (w_autoriza,w_principal,7,original!)
end event

type mle_1 from multilineedit within p2
boolean visible = false
integer x = 2688
integer y = 148
integer width = 78
integer height = 68
integer taborder = 110
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
boolean border = false
boolean hscrollbar = true
boolean vscrollbar = true
end type

type rte_1 from richtextedit within p2
boolean visible = false
integer x = 3323
integer y = 132
integer width = 288
integer height = 192
integer taborder = 90
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean border = false
end type

type dw_formato from datawindow within p2
boolean visible = false
integer x = 3685
integer y = 128
integer width = 110
integer height = 168
integer taborder = 100
string title = "none"
string dataobject = "asis_int_3047_urgencias"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

type cb_ubica from commandbutton within p2
event type integer pre_clicked ( )
boolean visible = false
integer x = 3200
integer y = 28
integer width = 645
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ubicar en ficha Pacientes"
end type

event type integer pre_clicked();//if dw_1.getItemString(1,1) <> is_tingre then
//	dw_1.setItem(1,1,is_tingre)
//	dw_1.TriggerEvent(itemchanged!)
//end if
//if t1.p1.dw_pac.describe("datawindow.table.Filter") <> '' then
//	long fila
//	t1.p1.dw_pac.setFilter("")
//	t1.p1.dw_pac.Filter()
//end if
//fila = t1.p1.dw_pac.Find("nh="+string(id_nh)+" and clugar='"+is_lugar+"'",1,t1.p1.dw_pac.rowCount())
//if fila > 0 then
//	t1.p1.dw_pac.scrolltoRow(fila)
//	t1.p1.dw_pac.Event rowfocuschanged(fila)
//else
//	messageBox('Atención','No se encuentra el ingreso')
//end if
//return fila
return 0
end event

event clicked;//long fila
//if event clicked() = 0 then return -1
//if isnull(dw_au.getItemNumber(1,'id_solicitud')) then return 0
//fila = t1.p1.dw_hist.Find("id_solicitud="+string(dw_au.getItemNumber(1,'id_solicitud')),1,t1.p1.dw_hist.rowCount())
//if fila > 0 then 
//	t1.p1.dw_hist.scrolltoRow(fila)
//else
//	messageBox('Atención','No se encuentra la solicitud')
//end if
//t1.selectTab(1)
//
end event

type pb_envia from picturebutton within p2
integer x = 2391
integer y = 440
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "envia_mail.jpg"
alignment htextalign = left!
string powertiptext = "Enviar Solicitud"
end type

event clicked;if dw_au.rowCount() = 0 then return 0
string ls_medio, ls_archivo, ls_cemp,l_via, l_ingre,ls_desemp,ls_email,ls_x_lugar,ls_em,ls_path,ls_2335
string ls_servidor, ls_puerto,ls_usuario,ls_clave,ls_autentica,ls_conexion,ls_asunto,ls_desc,p_nombre,ls_obs
int li_ret, li_intento


SELECT cadena into :ls_x_lugar
FROM parametros_gen
WHERE (((codigo_para)=64));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 64')
	return
end if

if g_motor='postgres' then
	SELECT case when ahora()>= fecha  then '1' else '0' end into :ls_2335
	FROM parametros_gen
	WHERE (((codigo_para)=77));
else
	SELECT case when getdate()>= fecha  then '1' else '0' end into :ls_2335
	FROM parametros_gen
	WHERE (((codigo_para)=77));	
end if
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 77')
	return
end if

if ls_x_lugar='1' then
	SELECT servidor, puerto, usuario, clave, autentica, conexion 
	INTO :ls_servidor, :ls_puerto,:ls_usuario,:ls_clave,:ls_autentica,:ls_conexion
	FROM lugar_correos
	WHERE clugar=:CLUGAR and ctipo='EA02';
	if isnull(ls_servidor) then 
		messagebox('Atención','No hay datos configuradorados por lugar para EA02')
		return 
	end if
else
	SELECT servidor, puerto, usuario, clave, autentica, conexion 
	INTO :ls_servidor, :ls_puerto,:ls_usuario,:ls_clave,:ls_autentica,:ls_conexion
	FROM ips_correos
	WHERE c_ips='01' and ctipo='EA02';
	if isnull(ls_servidor) then 
		messagebox('Atención','No hay datos configuradorados por IPS para EA02')
		return 
	end if	
end if

l_via= dw_au.getItemString(1,'via')
l_ingre=dw_au.getItemString(1,'codtingre')
if dw_au.getItemNumber(1,'nuevo') = 1 or ib_cambio then
	li_ret = MessageBox('Atención','Desea guardar los cambios?',question!,yesnocancel!)
	if li_ret = 1 then
		if pb_guardar.Event clicked() = -1 then return -1
	elseif li_ret = 2 then
		if  dw_au.getItemNumber(1,'nuevo') = 1 then return -1
		dw_cpo.reset()
		dw_au.retrieve(dw_au.getItemNumber(1,'id_solicitud'),clugar)
	else
		return 0
	end if
end if

if l_via='1' then 
	If isnull(l_ingre) then 
		ls_medio = dw_au.getItemString(1,'correo_cext_1')
		ls_path = dw_au.getItemString(1,'repositorio1')
		ls_desemp=dw_au.getItemString(1,'desemp1')
		if isNull(ls_medio) or ls_medio = '' then
			messageBox('Atención','No se ha configurado el correo de la empresa '+ dw_au.getItemString(1,'desemp1'))
			return 0
		end if
	else
		if l_ingre='2' then
			ls_medio = dw_au.getItemString(1,'correo_urg')
		else
			ls_medio = dw_au.getItemString(1,'correo_otro')
		end if
		ls_path = dw_au.getItemString(1,'repositorio')
		ls_desemp=dw_au.getItemString(1,'desemp')
		if isNull(ls_medio) or ls_medio = '' then
			messageBox('Atención','No se ha configurado el correo de la empresa '+ dw_au.getItemString(1,'desemp'))
			return 0
		end if
	end if
else
	dw_au.setItem(1,'fec_intento1',datetime(today(),now()))
	dw_au.setItem(1,'medio1',ls_medio)
	dw_au.setItem(1,'envio1', 'Transacción')
	dw_au.setItem(1,'estado', '1')
	if dw_au.update() = -1 then
		rollback;
		return -1
	end if
	return 0	
end if

if isnull(ls_path) or trim(ls_path) = '' then
	ls_path = "c:\"
	do 
	loop until getFolder('Seleccione repositorio para la empresa',ls_path) = 1
	ls_cemp = dw_au.getItemString(1,'cemp')
	ls_path = ls_path + '\'
	update empresa set repositorio = :ls_path where codemp = :ls_cemp;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("No pudo actualizarse repositorio para la empresa. Se continuará el proceso.", SQLCA.SQLErrText)
	END IF
	dw_au.setItem(1,'repositorio',ls_path)
	commit;
end if

if not isNull(dw_au.getItemDateTime(1,'fec_dterritorial')) then
	MessageBox('Atención','ya se enviaron los tres intentos y a la entidad territorial')
	return -1
end if
// Elige Reporte
if dw_au.getItemString(1,'tipo') = 'U' then
	if ls_2335='0' then
		dw_formato.DataObject = 'asis_int_3047_urgencias'
	else
		dw_formato.DataObject= 'asis_int_2335_urgencias'
	end if
	ls_email=dw_au.getItemString(1,'correo_urg')
else
	if dw_au.getItemString(1,'tipo') = 'E' then
		if ls_2335='0' then
			dw_formato.DataObject = 'asis_int_3047_servicios_cext_ext'
		else
			dw_formato.DataObject = 'asis_int_2335_servicios_cext_ext'
		end if
		ls_email=dw_au.getItemString(1,'correo_cext')
	else
		If isnull(l_ingre) then 
			if ls_2335='0' then
				dw_formato.DataObject = 'asis_int_3047_servicios_cext'
			else
				dw_formato.DataObject = 'asis_int_2335_servicios_cext'
			end if
			ls_email=dw_au.getItemString(1,'correo_cext')
		else
			if ls_2335='0' then	
				dw_formato.DataObject = 'asis_int_3047_servicios'
			else
				dw_formato.DataObject = 'asis_int_2335_servicios'
			end if
			ls_email=dw_au.getItemString(1,'correo_otro')
		end if
	end if
end if /// fin elige reporte

int l_pos
string l_cadena,l_ante

l_correos.reset()
l_ante=ls_email
l_pos=Pos(ls_email,';')
do while l_pos>0
	l_cadena=mid(ls_email,1,l_pos - 1)
	l_correos.additem(l_cadena)
	ls_email=mid(ls_email,l_pos+1,len(ls_email))
	l_pos=Pos(ls_email,';')
	if l_pos=0 then 
		l_correos.additem(ls_email)
	end if
loop
ls_email=l_ante

dw_formato.setTransObject(SQLCA)

string ls_plantilla, ls_tingre, ls_lugar_his,q_solicita,q_cargo
long ll_item, ll_reg, ll_contador
blob lb_motivo
int row_pega

// elige tipo de servicio
if dw_au.getItemString(1,'tipo') <> 'E' then
	If not isnull(l_ingre) then 
		if dw_formato.retrieve(dw_au.getItemNumber(1,'nh'),dw_au.getItemString(1,'clugar_adm'),dw_au.getItemString(1,'codtingre'),dw_au.getItemNumber(1,'id_solicitud')) > 0 then
			ls_tingre = dw_au.getItemString(1,'codtingre')
			ll_contador = dw_au.getItemNumber(1,'contador')
			ls_lugar_his = dw_au.getItemString(1,'clugar_his')
			if ls_2335='0' then
				mle_1=f_motivo(ll_contador,ls_lugar_his ,ls_tingre,rte_1,mle_1)
				if g_motor='postgres' then
					SELECT 
						ESPECIALIDADES.DESESP, 
						 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end into :q_cargo,:q_solicita
					FROM 
						(HCLIN_REGISTRO INNER JOIN PROFE ON HCLIN_REGISTRO.CODPROF = PROFE.CODPROF) INNER JOIN 
						ESPECIALIDADES ON HCLIN_REGISTRO.CESP = ESPECIALIDADES.CODESP
					WHERE (((HCLIN_REGISTRO.contador)=:ll_contador) AND ((HCLIN_REGISTRO.clugar)=:ls_lugar_his) AND ((HCLIN_REGISTRO.nregistro)=:ll_reg));
				else
					SELECT 
						ESPECIALIDADES.DESESP, 
						 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end into :q_cargo,:q_solicita
					FROM 
						(HCLIN_REGISTRO INNER JOIN PROFE ON HCLIN_REGISTRO.CODPROF = PROFE.CODPROF) INNER JOIN 
						ESPECIALIDADES ON HCLIN_REGISTRO.CESP = ESPECIALIDADES.CODESP
					WHERE (((HCLIN_REGISTRO.contador)=:ll_contador) AND ((HCLIN_REGISTRO.clugar)=:ls_lugar_his) AND ((HCLIN_REGISTRO.nregistro)=:ll_reg));
				end if
				IF SQLCA.SQLCode = -1 THEN
					MessageBox("No pudo recuperarse información de la planilla para conocer el motivo del ingreso (hclin_reg_valor).", SQLCA.SQLErrText)
					return -1
				END IF
			
				row_pega=dw_formato.rowcount()
				if dw_au.getItemString(1,'tipo') = 'U' or dw_au.getItemString(1,'tipo') = 'S' then 			
					dw_formato.SetItem(row_pega,'motivo_consulta',mle_1.text)
					if dw_au.getItemString(1,'tipo') = 'U' then 
						dw_formato.SetItem(row_pega,'qsolicita',q_solicita)
						dw_formato.SetItem(row_pega,'cargo',q_cargo)
					end if
				end if
			end if
			mle_1.Text = ''
		else
			MessageBox('Atención','No se generó reporte. No se recuperó información de la base de datos')
			Return 0
		end if
	else
		//if dw_formato.retrieve(dw_cpo.getItemNumber(1,'contador'),dw_cpo.getItemString(1,'clugar_os')) > 0 then
		if dw_formato.retrieve(dw_cpo.getItemNumber(1,'id_solicitud'),dw_cpo.getItemString(1,'clugar')) > 0 then
			ll_contador = dw_cpo.getItemNumber(1,'contador')
			ls_lugar_his = dw_cpo.getItemString(1,'clugar_os')
			if ls_2335='0' then
				selectblob hclin_reg_valor.long_texto into :lb_motivo 
				FROM 
					(hclin_registro INNER JOIN hclin_reg_valor ON (hclin_registro.contador = hclin_reg_valor.CONTADOR) AND 
					(hclin_registro.clugar = hclin_reg_valor.clugar) AND (hclin_registro.nregistro = hclin_reg_valor.nregistro)) 
					INNER JOIN hclin_plantcampo ON (hclin_registro.codplantilla = hclin_plantcampo.codplantilla) AND 
						(hclin_reg_valor.item = hclin_plantcampo.numcampo)
				where hclin_registro.contador=:ll_contador and hclin_registro.clugar=:ls_lugar_his  AND hclin_plantcampo.motivo='1';
				IF SQLCA.SQLCode = -1 THEN
					MessageBox("No pudo recuperarse información de la planilla para conocer el motivo del ingreso (hclin_reg_valor). en Consulta Externa", SQLCA.SQLErrText)
					return -1
				END IF
				f_pega_a_rtf(rte_1,string(lb_motivo),3)
				rte_1.selectTextAll(Detail!)
				rte_1.Copy()
				mle_1.paste()
				row_pega=dw_formato.rowcount()
				dw_formato.SetItem(row_pega,'motivo_consulta',mle_1.text)
			end if
			mle_1.Text = ''
		else
			MessageBox('Atención','No se generó reporte. No se recuperó información de la base de datos Consulta Externa')
			Return 0
		end if
	end if
else //
	ls_lugar_his =dw_au.getItemString(1,'clugar')
	if dw_formato.retrieve(dw_au.getItemNumber(1,'id_solicitud'),ls_lugar_his) = 0 then
		MessageBox('Atención','No se generó reporte. No se recuperó información de la base de datos Consulta Externa')
		Return 0
	end if
end if	 // si es E

if isNull(dw_au.getItemDateTime(1,'fec_intento1')) then
	li_intento = 1
elseif isNull(dw_au.getItemDateTime(1,'fec_intento2')) then
	li_intento = 2
elseif isNull(dw_au.getItemDateTime(1,'fec_intento3')) then
	li_intento = 3
elseif isNull(dw_au.getItemDateTime(1,'fec_dterritorial')) then
	li_intento = 4
	SELECT ips.correo into :ls_medio FROM ips;
	//dw_au.setItem(1,'medio3',medio)
end if

If l_via='1' then
	ls_archivo = 'solicita_'+string(dw_au.getItemNumber(1,'id_solicitud'))+'_'+string(li_intento)+'_'+string(datetime(today(),now()),'yyyymmddhhmmss')
	ls_archivo= ls_path+ ls_archivo+'.pdf'
	dw_formato.Object.DataWindow.Export.PDF.Method = NativePDF!
	dw_formato.Object.DataWindow.Export.PDF.NativePDF.Restrictions = 'nomodify!,nocopy!'
	if dw_formato.saveas(ls_archivo,PDF!, true)=-1 then 
		return 0 
	end if

	string ls_tipodoc,ls_documento
	if isnull(dw_au.getItemString(1,'tipodoc')) then 
		ls_tipodoc=dw_au.getItemString(1,'ptipodoc')
	else 
		ls_tipodoc=dw_au.getItemString(1,'tipodoc') 
	end if
	
	if isnull(dw_au.getItemString(1,'tipodoc')) then 
		ls_documento=dw_au.getItemString(1,'pdocumento')
	else 
		ls_documento=dw_au.getItemString(1,'documento') 
	end if
	
	string ls_exec
	ls_exec = gs_pdf+ls_archivo
	run(ls_exec)
	
	
	ls_obs='Notificación de Solicitud de autorización'

	ls_asunto='Notificación solicitud autorización ' + string(dw_au.getItemNumber(1,'id_solicitud'))+dw_au.getItemstring(1,'clugar')
	ls_desc= 'Solicitud autorizacion ' + string(dw_au.getItemNumber(1,'id_solicitud'))+dw_au.getItemString(1,'clugar') + ' ~r~n' + dw_au.getItemString(1,'nombre') +' ~r~n' +ls_tipodoc + ls_documento + ' ~r~n' + ls_desemp
	l_pos=l_correos.TotalItems() 
	if l_pos>1 then
		for l_pos= 1 to l_correos.TotalItems() 
			l_cadena= l_correos.Text(l_pos) 
			ls_em=f_envia_mail(ls_servidor, ls_puerto,ls_usuario,ls_clave,ls_autentica,ls_conexion,l_cadena,ls_asunto,ls_desc,ls_desemp,ls_archivo,ls_obs)
		next
	else
		ls_em=f_envia_mail(ls_servidor, ls_puerto,ls_usuario,ls_clave,ls_autentica,ls_conexion,ls_email,ls_asunto,ls_desc,ls_desemp,ls_archivo,ls_obs)
	end if
	if ls_em='Correo Enviado Satisfactoriamente'  then 
		if isNull(dw_au.getItemDateTime(1,'fec_intento1')) then
			dw_au.setItem(1,'fec_intento1',datetime(today(),now()))
			dw_au.setItem(1,'medio1',ls_medio)
			dw_au.setItem(1,'envio1',  ls_archivo)
			dw_au.setItem(1,'estado', '1')
		elseif isNull(dw_au.getItemDateTime(1,'fec_intento2')) then
			dw_au.setItem(1,'fec_intento2',datetime(today(),now()))
			dw_au.setItem(1,'medio2',ls_medio)
			dw_au.setItem(1,'envio2', ls_archivo)
			dw_au.setItem(1,'estado', '2')
		elseif isNull(dw_au.getItemDateTime(1,'fec_intento3')) then
			dw_au.setItem(1,'fec_intento3',datetime(today(),now()))
			dw_au.setItem(1,'medio3',ls_medio)
			dw_au.setItem(1,'envio3', ls_archivo)
			dw_au.setItem(1,'estado', '3')
		elseif isNull(dw_au.getItemDateTime(1,'fec_dterritorial')) then
			dw_au.setItem(1,'fec_dterritorial',datetime(today(),now()))
			dw_au.setItem(1,'enviot', ls_archivo)
			dw_au.setItem(1,'estado', 'T')
		end if
		if dw_au.update() = -1 then
			rollback;
			return -1
		end if
		messageBox('Atención','Correo enviado')
	else
		MessageBox("Aviso", ls_em)
	end if
	
else //via
	dw_formato.Object.DataWindow.Printer = 'Fax'
	if dw_formato.print()=-1 then 
		MessageBox('Atención','No se pudo generar el PDF ')
		return -1
	end if
end If // via=1
end event

type pb_guardar from picturebutton within p2
integer x = 2391
integer y = 304
integer width = 146
integer height = 128
integer taborder = 40
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

event clicked;if dw_au.rowCount() = 0 then return 0

if isNull(dw_au.getItemString(1,'tipo')) then
	MessageBox('Atención','No ha seleccionado el tipo de solicitud')
	return -1
end if
long ld_solicitud, i
if dw_au.getItemNumber(1,'nuevo') = 1 then
	ld_solicitud = f_trae_ndoc('AUT',clugar,'Autorizaciones')
	if ld_solicitud = -1 then return -1
	dw_au.setItem(1,'id_solicitud', ld_solicitud)
	dw_au.setItem(1,'clugar', clugar)
	if serv='3' then
		dw_cpo.setItem(fcpo,'id_solicitud',ld_solicitud)
	end if
	for i = 1 to dw_cpo.rowCount()
		dw_cpo.setItem(i,'id_solicitud', ld_solicitud)
		dw_au.setItem(1,'clugar',clugar)
		dw_cpo.setItem(i,'id_solicitud', datetime(today(),now()))
		dw_cpo.setItem(i,'clugar',clugar)
	next
else
	ld_solicitud =dw_au.getItemNumber(1,'id_solicitud')
	for i = 1 to dw_cpo.rowCount()
		if dw_cpo.getItemStatus(i,0,Primary!) = DataModified! then dw_cpo.setItem(i,'fecha_modificacion', datetime(today(),now()))
	next
end if

if dw_au.Update() = -1 then
	rollback;
	return -1
end if
if dw_cpo.Update() = -1 then
	rollback;
	return -1
end if
commit;
dw_cpo.reset()
ib_cambio = FALSE

filtre_ing()
filtre_his()
filtre_serv()
dw_au.retrieve( ld_solicitud,clugar)
return 0

end event

type pb_cancela from picturebutton within p2
integer x = 2391
integer y = 176
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
string picturename = "anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular Autorización"
end type

event clicked;if dw_au.rowCount() = 0 then return 0
if dw_au.getitemstring(1,'estado')='Z' then return 0
if not isnull(dw_au.getitemstring(1,'autorizacion')) then return 0
if dw_au.getItemNumber(1,'nuevo') = 1 then
	if MessageBox('Atención','El registro es nuevo. Desea Eliminarlo?',question!,yesno!) = 2 then return 0
	dw_cpo.Reset()
	dw_au.Reset()
else
	if MessageBox('Atención','Desea Inactivar la solicitud?',question!,yesno!) = 2 then return 0
	dw_au.SetItem(1,'estado','I')
	if dw_au.Update() = -1 then
		rollback;
		return -1
	end if
	commit;
end if
return 0

end event

type pb_nuevo from picturebutton within p2
integer x = 2391
integer y = 44
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean default = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Solicitar nueva autorización"
end type

event clicked; if ib_cambio then
	int ret 
	ret = MessageBox('Atención','Ha realizado cambios. Desea guardarlos?',Question!,yesnocancel!)
	if ret = 1 then
		if t1.p2.pb_guardar.event clicked() = -1 then return -1
	elseif ret = 2 then
		dw_cpo.Reset()
		dw_au.Reset()
		ib_cambio = FALSE
	else
		Return 0
	end if
end if

long fila, fp
dw_cpo.Reset()
dw_au.Reset()
fila = dw_au.InsertRow(0)
if ing=0 then
	fp = t1.p1.dw_pac.getrow()
	if serv<>'1' then 
		dw_au.SetItem(fila,'nh', t1.p1.dw_pac.getItemNumber(fp,'nh'))
		dw_au.SetItem(fila,'clugar_adm', t1.p1.dw_pac.getItemString(fp,'clugar'))
		dw_au.SetItem(fila,'codtingre', t1.p1.dw_pac.getItemString(fp,'codtingre'))
		dw_au.setItem(fila,'cemp',t1.p1.dw_pac.getItemString(fp,'cemp'))
	end if
	dw_au.SetItem(fila,'fecha_elaboracion',datetime(today(),now()))
end if
if ing=1 then
	fp =t1.p3.dw_historial.getrow()
	dw_au.SetItem(fila,'nh', t1.p3.dw_historial.getItemNumber(fp,'nh'))
	dw_au.SetItem(fila,'clugar_adm', t1.p3.dw_historial.getItemString(fp,'clugar'))
	dw_au.SetItem(fila,'codtingre', t1.p3.dw_historial.getItemString(fp,'codtingre'))
	dw_au.SetItem(fila,'fecha_elaboracion',datetime(today(),now()))
	dw_au.setItem(fila,'cemp',t1.p3.dw_historial.getItemString(fp,'cemp'))
end if
if ing=2 then
	fp =t1.p5.dw_2.getrow()
	dw_au.SetItem(fila,'nh', t1.p5.dw_2.getItemNumber(fp,'nh'))
	dw_au.SetItem(fila,'clugar_adm',t1.p5.dw_2.getItemString(fp,'clugar'))
	dw_au.SetItem(fila,'codtingre', t1.p5.dw_2.getItemString(fp,'codtingre'))
	dw_au.SetItem(fila,'fecha_elaboracion',datetime(today(),now()))
	dw_au.setItem(fila,'cemp',t1.p5.dw_2.getItemString(fp,'cemp'))
end if
if serv='2' and ing=0 then
	dw_au.SetItem(fila,'tipo','U')
else
	if ib_cext=true then 
		dw_au.SetItem(fila,'tipo','E')
	else
		dw_au.SetItem(fila,'tipo','S')
	end if
End if

dw_au.SetItem(fila,'via','1')
dw_au.SetItem(fila,'estado','A')
dw_au.SetItem(fila,'usuario',usuario)
dw_au.SetItem(fila,'nuevo',1)

if ing=0 then
	if serv<>'1' then
		dw_au.setItem(fila,'desemp',t1.p1.dw_pac.getItemString(fp,'desemp'))
		dw_au.setItem(fila,'ptipodoc',t1.p1.dw_pac.getItemString(fp,'tipodoc'))
		dw_au.setItem(fila,'pdocumento',t1.p1.dw_pac.getItemString(fp,'documento'))
		dw_au.setItem(fila,'nombre1',t1.p1.dw_pac.getItemString(fp,'nombre1'))
		dw_au.setItem(fila,'nombre2',t1.p1.dw_pac.getItemString(fp,'nombre2'))
		dw_au.setItem(fila,'apellido1',t1.p1.dw_pac.getItemString(fp,'apellido1'))
		dw_au.setItem(fila,'apellido2',t1.p1.dw_pac.getItemString(fp,'apellido2'))
		dw_au.setItem(fila,'fechaingreso',t1.p1.dw_pac.getItemdatetime(fp,'fechaingreso'))
		dw_au.setItem(fila,'horaingreso',t1.p1.dw_pac.getItemdatetime(fp,'horaingreso'))
		dw_au.setItem(fila,'contador',t1.p1.dw_pac.getItemnumber(fp,'contador'))
		dw_au.setItem(fila,'clugar_his',t1.p1.dw_pac.getItemString(fp,'clugar_his'))
	Else
		dw_au.setItem(fila,'desemp',t1.p4.dw_emppac.getItemString(t1.p4.dw_emppac.getrow(),'desemp'))
		dw_au.setItem(fila,'descontrato',t1.p4.dw_emppac.getItemString(t1.p4.dw_emppac.getrow(),'descontrato'))
		dw_au.setItem(fila,'cemp',t1.p4.dw_emppac.getItemString(t1.p4.dw_emppac.getrow(),'codemp'))
		dw_au.setItem(fila,'ccontrato',t1.p4.dw_emppac.getItemString(t1.p4.dw_emppac.getrow(),'codcontrato'))		
		dw_au.setItem(fila,'tipodoc',tipdoc)
		dw_au.setItem(fila,'documento',docu)
		dw_au.setItem(fila,'nombre1',w_principal.dw_1.getitemstring(1,'nombre1'))
		dw_au.setItem(fila,'nombre2',w_principal.dw_1.getitemstring(1,'nombre2'))
		dw_au.setItem(fila,'apellido1',w_principal.dw_1.getitemstring(1,'apellido1'))
		dw_au.setItem(fila,'apellido2',w_principal.dw_1.getitemstring(1,'apellido1'))
		dw_au.setItem(fila,'fechaingreso',datetime(today(),now()))
		dw_au.setItem(fila,'horaingreso',datetime(today(),now()))
		if ib_cext=true then 
			//dw_au.setItem(fila,'observacion',t1.p4.soli.externa.sle_1.text)
			dw_au.SetItem(fila,'diagprin',t1.p4.soli.externa.dw_dxext.getitemstring(1,'codgeral'))
			dw_au.SetItem(fila,'causaexterna',t1.p4.soli.externa.dw_dxext.getitemstring(1,'cext'))
			dw_au.SetItem(fila,'fin_consulta', t1.p4.soli.externa.dw_dxext.getitemstring(1,'finali'))
			dw_au.SetItem(fila,'prioridad', t1.p4.soli.externa.dw_dxext.getitemstring(1,'prioridad'))
			dw_au.SetItem(fila,'cod_modrel',t1.p4.soli.externa.dw_dxext.getitemstring(1,'modrel'))	
		end if
		int l_f,l_fila
		string l_valor

		if ib_cext=false then 
			//para servicios  internos
			l_f = t1.p4.soli.interna.dw_ord_cext.find("esco = '1'",1,t1.p4.soli.interna.dw_ord_cext.rowCount())
			do while l_f > 0
				l_fila = t1.p2.dw_cpo.Find("nsolicitud="+string(t1.p4.soli.interna.dw_ord_cext.getItemNumber(l_f,'nsolicitud'))+ " and item_os="+string(t1.p4.soli.interna.dw_ord_cext.getItemNumber(l_f,'item')),1,t1.p2.dw_cpo.rowCount())
				if l_fila = 0 then
					l_fila = t1.p2.dw_cpo.InsertRow(0)
					l_valor = t1.p2.dw_cpo.describe("evaluate('max(item)',0)")
					t1.p2.dw_cpo.setItem(l_fila,'id_solicitud',1)
					t1.p2.dw_cpo.setItem(l_fila,'item',long(l_valor) + 1)
					t1.p2.dw_cpo.setItem(l_fila,'contador',t1.p4.soli.interna.dw_ord_cext.getItemNumber(l_f,'contador'))
					t1.p2.dw_cpo.setItem(l_fila,'clugar_os',t1.p4.soli.interna.dw_ord_cext.getItemString(l_f,'clugar'))
					t1.p2.dw_cpo.setItem(l_fila,'nsolicitud',t1.p4.soli.interna.dw_ord_cext.getItemNumber(l_f,'nsolicitud'))
					t1.p2.dw_cpo.setItem(l_fila,'item_os',t1.p4.soli.interna.dw_ord_cext.getItemNumber(l_f,'item'))
					t1.p2.dw_cpo.setItem(l_fila,'solicitada',t1.p4.soli.interna.dw_ord_cext.getItemNumber(l_f,'solicitada'))
					t1.p2.dw_cpo.setItem(l_fila,'c_medica',t1.p4.soli.interna.dw_ord_cext.getItemString(l_f,'c_medica'))
					t1.p2.dw_cpo.setItem(l_fila,'codproced',t1.p4.soli.interna.dw_ord_cext.getItemString(l_f,'codproced'))
					t1.p2.dw_cpo.setItem(l_fila,'descripcion',t1.p4.soli.interna.dw_ord_cext.getItemString(l_f,'descripcion'))
					t1.p2.dw_cpo.setItem(l_fila,'medicamento',t1.p4.soli.interna.dw_ord_cext.getItemString(l_f,'medicamento'))
					t1.p2.dw_cpo.setItem(l_fila,'usuario',usuario)
					t1.p2.dw_cpo.setItem(l_fila,'estado','A')
				end if
				t1.p4.soli.interna.dw_ord_cext.setItem(l_f,'esco','0')
				l_f = t1.p4.soli.interna.dw_ord_cext.find("esco = '1'",1,t1.p4.soli.interna.dw_ord_cext.rowCount())
			loop
		else
			//para servicios externos
			l_f = t1.p4.soli.externa.dw_cpo_sol.rowCount()
			do while l_f > 0
				l_fila = t1.p2.dw_cpo.InsertRow(0)
				l_valor = t1.p2.dw_cpo.describe("evaluate('max(item)',0)")
				t1.p2.dw_cpo.setItem(l_fila,'id_solicitud',1)
				t1.p2.dw_cpo.setItem(l_fila,'item',long(l_valor) + 1)
				t1.p2.dw_cpo.setItem(l_fila,'solicitada',t1.p4.soli.externa.dw_cpo_sol.getItemNumber(l_f,'solicitada'))
				t1.p2.dw_cpo.setItem(l_fila,'c_medica',t1.p4.soli.externa.dw_cpo_sol.getItemString(l_f,'c_medica'))
				t1.p2.dw_cpo.setItem(l_fila,'codproced',t1.p4.soli.externa.dw_cpo_sol.getItemString(l_f,'codproced'))
				t1.p2.dw_cpo.setItem(l_fila,'descripcion',t1.p4.soli.externa.dw_cpo_sol.getItemString(l_f,'nombres'))
				t1.p2.dw_cpo.setItem(l_fila,'medicamento',t1.p4.soli.externa.dw_cpo_sol.getItemString(l_f,'nombres'))
				t1.p2.dw_cpo.setItem(l_fila,'usuario',usuario)
				t1.p2.dw_cpo.setItem(l_fila,'estado','A')
				l_f=l_f - 1
			loop
		end if
	End If
else
	if ing=1 then
		dw_au.setItem(fila,'desemp', t1.p3.dw_historial.getItemString(fp,'desemp'))
		dw_au.setItem(fila,'ptipodoc', t1.p3.dw_historial.getItemString(fp,'tipodoc'))
		dw_au.setItem(fila,'pdocumento', t1.p3.dw_historial.getItemString(fp,'documento'))
		dw_au.setItem(fila,'nombre1', t1.p3.dw_historial.getItemString(fp,'nombre1'))
		dw_au.setItem(fila,'nombre2', t1.p3.dw_historial.getItemString(fp,'nombre2'))
		dw_au.setItem(fila,'apellido1', t1.p3.dw_historial.getItemString(fp,'apellido1'))
		dw_au.setItem(fila,'apellido2', t1.p3.dw_historial.getItemString(fp,'apellido2'))
		dw_au.setItem(fila,'fechaingreso', t1.p3.dw_historial.getItemdatetime(fp,'fechaingreso'))
		dw_au.setItem(fila,'horaingreso', t1.p3.dw_historial.getItemdatetime(fp,'horaingreso'))
	end if
	if ing=2 then
//		dw_au.setItem(fila,'desemp',t1.p5.dw_2..getItemString(fp,'desemp'))
		dw_au.setItem(fila,'ptipodoc',t1.p5.dw_2.getItemString(fp,'tipodoc'))
		dw_au.setItem(fila,'pdocumento',t1.p5.dw_2.getItemString(fp,'documento'))
		dw_au.setItem(fila,'nombre1',t1.p5.dw_2.getItemString(fp,'nombre1'))
		dw_au.setItem(fila,'nombre2',t1.p5.dw_2.getItemString(fp,'nombre2'))
		dw_au.setItem(fila,'apellido1',t1.p5.dw_2.getItemString(fp,'apellido1'))
		dw_au.setItem(fila,'apellido2',t1.p5.dw_2.getItemString(fp,'apellido2'))
		dw_au.setItem(fila,'fechaingreso',t1.p5.dw_2.getItemdatetime(fp,'fechaingreso'))
		dw_au.setItem(fila,'horaingreso',t1.p5.dw_2.getItemdatetime(fp,'horaingreso'))	
	end if
end if
ib_cambio = TRUE
end event

type pb_1 from picturebutton within p2
integer x = 2981
integer y = 1304
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Retirar producto"
end type

event clicked;if dw_cpo.rowCount() = 0 then return 0

if not isNull(dw_au.getItemDateTime(1,'fec_intento1')) then 
	MessageBox('Atención','Solo puede INACTIVAR servicios una vez el documento haya sido enviado')
	return 0
end if
dw_cpo.deleteRow(dw_cpo.getrow())

end event

type pb_add from picturebutton within p2
integer x = 2981
integer y = 1140
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
string powertiptext = "Adicionar Producto"
end type

event clicked;long fp
if dw_au.rowCount() = 0 then return 0
if not isNull(dw_au.getItemDateTime(1,'fec_intento1')) then 
	MessageBox('Atención','El documento haya sido enviado. No puede agregar servicios o cree una nueva solicitud')
	return 0
end if

st_autoriza st_p
st_p.dw_au = dw_au
st_p.dw_cpo = dw_cpo

if ing=0 then
	fp = t1.p1.dw_pac.getrow()
	st_p.codproced=t1.p1.dw_pac.getItemString(fp,'cproced')
	st_p.contador = t1.p2.dw_au.GetItemNumber(t1.p2.dw_au.getrow(),'contador')
	st_p.clugar = t1.p2.dw_au.getItemString(t1.p2.dw_au.getrow(),'clugar_his')
else
	if  ing=1 then
		fp =t1.p3.dw_historial.getrow()
		st_p.codproced=t1.p3.dw_historial.getItemString(fp,'cproced')
		st_p.contador = t1.p3.dw_historial.GetItemNumber(fp,'contador')
		st_p.clugar = t1.p3.dw_historial.getItemString(fp,'clugar_his')
	end if
	if  ing=2 then 
		fp =t1.p5.dw_2.getrow()
		st_p.codproced=t1.p3.dw_historial.getItemString(t1.p3.dw_historial.getrow(),'cproced')
		st_p.contador = t1.p5.dw_2.GetItemNumber(fp,'contador')
		st_p.clugar = t1.p5.dw_2.getItemString(fp,'clugar_his')
	end if	
end if
openwithparm(w_servicios, st_p)





end event

type st_2 from statictext within p2
integer x = 32
integer y = 1032
integer width = 960
integer height = 48
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos y Medicamentos"
boolean focusrectangle = false
end type

type dw_cpo from datawindow within p2
integer x = 27
integer y = 1128
integer width = 2939
integer height = 656
integer taborder = 80
string title = "none"
string dataobject = "dw_autoriza_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
modify("autorizacion.edit.displayonly=yes fec_autoriza.Edit.Displayonly=yes nombre_autoriza.Edit.DisplayOnly=yes")

end event

type dw_au from datawindow within p2
integer y = 8
integer width = 2359
integer height = 984
integer taborder = 10
string title = "none"
string dataobject = "dw_solicitud"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event retrieveend;if rowcount = 1 then dw_cpo.retrieve(getItemNumber(1,'id_solicitud'),clugar)

end event

event buttonclicked;long p
string ls_exec
p = pos(gs_pdf,'%1')
choose case dwo.name
	case 'b_1'
		ls_exec = replace(gs_pdf,p,2,getitemstring(1,'envio1'))
		run(ls_exec)
	case 'b_2'
		ls_exec = replace(gs_pdf,p,2,getitemstring(1,'envio2'))
		run(ls_exec)
	case 'b_3'
		ls_exec = replace(gs_pdf,p,2,getitemstring(1,'envio3'))
		run(ls_exec)
	case 'b_4'
		ls_exec = replace(gs_pdf,p,2,getitemstring(1,'enviot'))
		run(ls_exec)
end choose

end event

type p5 from userobject within t1
integer x = 18
integer y = 112
integer width = 4489
integer height = 1824
long backcolor = 67108864
string text = "Servicios Adicionales Pendientes"
long tabtextcolor = 33554432
string picturename = "anula_salida.ico"
long picturemaskcolor = 536870912
st_22 st_22
st_21 st_21
pb_10 pb_10
st_15 st_15
st_14 st_14
dp_2 dp_2
dp_1 dp_1
pb_9 pb_9
dw_2 dw_2
end type

on p5.create
this.st_22=create st_22
this.st_21=create st_21
this.pb_10=create pb_10
this.st_15=create st_15
this.st_14=create st_14
this.dp_2=create dp_2
this.dp_1=create dp_1
this.pb_9=create pb_9
this.dw_2=create dw_2
this.Control[]={this.st_22,&
this.st_21,&
this.pb_10,&
this.st_15,&
this.st_14,&
this.dp_2,&
this.dp_1,&
this.pb_9,&
this.dw_2}
end on

on p5.destroy
destroy(this.st_22)
destroy(this.st_21)
destroy(this.pb_10)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.dp_2)
destroy(this.dp_1)
destroy(this.pb_9)
destroy(this.dw_2)
end on

type st_22 from statictext within p5
integer x = 2976
integer y = 1692
integer width = 485
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de Registros:"
boolean focusrectangle = false
end type

type st_21 from statictext within p5
integer x = 3474
integer y = 1684
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
boolean focusrectangle = false
end type

type pb_10 from pb_report within p5
integer x = 3310
integer y = 20
integer taborder = 40
string powertiptext = "Autorizaciones Pendientes Qx"
string cod_rep = "SAPQ"
string nombre_rep = "Autorizaciones Pendientes Qx"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[4]
par[1]=serv
par[2]=clugar
par[3]=inicia
par[4]=fin
imprimir(par,'','0')

end event

type st_15 from statictext within p5
integer x = 1129
integer y = 52
integer width = 297
integer height = 104
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "F_Solicitud Final"
boolean focusrectangle = false
end type

type st_14 from statictext within p5
integer x = 59
integer y = 44
integer width = 302
integer height = 108
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "F_Solicitud Inicial"
boolean focusrectangle = false
end type

type dp_2 from datepicker within p5
integer x = 1431
integer y = 52
integer width = 686
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-03-17"), Time("10:02:36.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtre_serv()

end event

type dp_1 from datepicker within p5
integer x = 379
integer y = 48
integer width = 686
integer height = 100
integer taborder = 30
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-03-17"), Time("10:02:36.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtre_serv()

end event

type pb_9 from picturebutton within p5
integer x = 3141
integer y = 20
integer width = 146
integer height = 128
integer taborder = 10
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

event clicked;ing=2
t1.SelectTab(3)
t1.p2.pb_nuevo.enabled=false
t1.p2.pb_add.enabled=true
t1.p2.pb_1.enabled=true
t1.p2.pb_nuevo.Event clicked()
end event

type dw_2 from datawindow within p5
integer x = 73
integer y = 196
integer width = 4361
integer height = 1476
integer taborder = 20
string title = "none"
string dataobject = "dw_servcios_pendientes_ingreso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;pb_9.event clicked()
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)

end event

event constructor;setTransObject(SQLCA)
end event

type p3 from userobject within t1
integer x = 18
integer y = 112
integer width = 4489
integer height = 1824
long backcolor = 67108864
string text = "Historial"
long tabtextcolor = 33554432
string picturename = "abrir.ico"
long picturemaskcolor = 536870912
st_18 st_18
st_13 st_13
dp_6 dp_6
dp_5 dp_5
pb_3 pb_3
st_3 st_3
dw_hist dw_hist
st_9 st_9
st_8 st_8
st_5 st_5
st_4 st_4
st_7 st_7
st_1 st_1
st_6 st_6
dw_historial dw_historial
end type

on p3.create
this.st_18=create st_18
this.st_13=create st_13
this.dp_6=create dp_6
this.dp_5=create dp_5
this.pb_3=create pb_3
this.st_3=create st_3
this.dw_hist=create dw_hist
this.st_9=create st_9
this.st_8=create st_8
this.st_5=create st_5
this.st_4=create st_4
this.st_7=create st_7
this.st_1=create st_1
this.st_6=create st_6
this.dw_historial=create dw_historial
this.Control[]={this.st_18,&
this.st_13,&
this.dp_6,&
this.dp_5,&
this.pb_3,&
this.st_3,&
this.dw_hist,&
this.st_9,&
this.st_8,&
this.st_5,&
this.st_4,&
this.st_7,&
this.st_1,&
this.st_6,&
this.dw_historial}
end on

on p3.destroy
destroy(this.st_18)
destroy(this.st_13)
destroy(this.dp_6)
destroy(this.dp_5)
destroy(this.pb_3)
destroy(this.st_3)
destroy(this.dw_hist)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_7)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.dw_historial)
end on

type st_18 from statictext within p3
integer x = 1211
integer y = 28
integer width = 215
integer height = 104
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Final"
boolean focusrectangle = false
end type

type st_13 from statictext within p3
integer x = 110
integer y = 24
integer width = 242
integer height = 112
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Incial"
boolean focusrectangle = false
end type

type dp_6 from datepicker within p3
integer x = 1440
integer y = 28
integer width = 686
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-03-17"), Time("10:02:36.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtre_his()
end event

type dp_5 from datepicker within p3
integer x = 366
integer y = 36
integer width = 686
integer height = 100
integer taborder = 60
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-03-17"), Time("10:02:36.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtre_his()
end event

type pb_3 from picturebutton within p3
integer x = 4315
integer y = 20
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Solicitud Servicos Adicionales"
end type

event clicked;ing=1
t1.SelectTab(3)
t1.p2.pb_nuevo.enabled=false
t1.p2.pb_add.enabled=true
t1.p2.pb_1.enabled=true
t1.p2.pb_nuevo.Event clicked()

end event

type st_3 from statictext within p3
integer x = 73
integer y = 1168
integer width = 512
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Autorización Solicitada"
boolean focusrectangle = false
end type

type dw_hist from datawindow within p3
integer x = 55
integer y = 1264
integer width = 3273
integer height = 504
integer taborder = 10
string title = "none"
string dataobject = "dw_hist_autoriza"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event doubleclicked;if row = 0 then return 0
t1.SelectedTab =3

end event

event rowfocuschanged;t1.p2.dw_cpo.reset()
t1.p2.dw_au.reset()
if rowcount() = 0 or currentrow = 0 then return
t1.p2.dw_au.retrieve(getItemNumber(getrow(),'id_solicitud'),clugar)

end event

event rowfocuschanging;if ib_cambio then
	int ret 
	ret = MessageBox('Atención','Ha realizado cambios. Desea guardarlos?',Question!,yesnocancel!)
	if ret = 1 then
		if t1.p2.pb_guardar.event clicked() = -1 then return -1
	elseif ret = 2 then
		t1.p2.dw_cpo.reset()
		ib_cambio = FALSE
	else
		Return -1
	end if
end if
return 0

end event

type st_9 from statictext within p3
integer x = 3355
integer y = 1560
integer width = 288
integer height = 52
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "AUTORIZADO"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.BackColor =rgb(255,255,255) 
end event

type st_8 from statictext within p3
integer x = 3355
integer y = 1500
integer width = 288
integer height = 52
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "ENVIO ENTE"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.BackColor =rgb(150,142,192)
end event

type st_5 from statictext within p3
integer x = 3355
integer y = 1440
integer width = 288
integer height = 52
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "ENVIO 3"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.BackColor =rgb(152,181,255)
end event

type st_4 from statictext within p3
integer x = 3355
integer y = 1260
integer width = 288
integer height = 52
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "ELABORACION"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.BackColor =rgb(240,192,192)
end event

type st_7 from statictext within p3
integer x = 3355
integer y = 1380
integer width = 288
integer height = 52
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "ENVIO 2"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.BackColor =rgb(139,235,177)
end event

type st_1 from statictext within p3
integer x = 3355
integer y = 1320
integer width = 288
integer height = 52
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "ENVIO 1"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.BackColor =rgb(255,255,108)
end event

type st_6 from statictext within p3
integer x = 1216
integer y = 1164
integer width = 2363
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione el tipo de ingreso, escoja admisión de click para ver detalle  y  doble click para ver la solicitud"
boolean focusrectangle = false
end type

type dw_historial from datawindow within p3
integer x = 55
integer y = 160
integer width = 4416
integer height = 940
integer taborder = 20
string title = "none"
string dataobject = "dw_historial_autoriza"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event doubleclicked;if row = 0 then return 0
t1.p2.dw_cpo.reset()
t1.p2.dw_au.reset()
t1.p2.dw_au.retrieve(getItemNumber(getrow(),'id_solicitud'),clugar)
t1.p2.dw_cpo.retrieve(getItemNumber(getrow(),'id_solicitud'),clugar)
t1.SelectedTab = 3
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event clicked;t1.p3.dw_hist.Reset()
if rowcount() = 0 or row=0  then return
t1.p2.pb_add.enabled=false
t1.p2.pb_1.enabled=false
if dw_historial.getitemstring(row,'codtingre') ='1'  then
	t1.p3.pb_3.enabled=false
else
	t1.p3.pb_3.enabled=true
	t1.p2.pb_add.enabled=true
	t1.p2.pb_1.enabled=true
	ing=1
end if
dw_hist.Retrieve(dw_historial.getItemNumber(row,'id_solicitud'),clugar)

end event

type gb_4 from groupbox within w_solicita_aut
integer x = 59
integer y = 244
integer width = 2615
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motivo"
borderstyle borderstyle = styleraised!
end type

