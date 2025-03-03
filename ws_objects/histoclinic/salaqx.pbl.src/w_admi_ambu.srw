$PBExportHeader$w_admi_ambu.srw
forward
global type w_admi_ambu from window
end type
type cbx_res from checkbox within w_admi_ambu
end type
type dw_his_acu from datawindow within w_admi_ambu
end type
type dw_tingres from datawindow within w_admi_ambu
end type
type st_2 from statictext within w_admi_ambu
end type
type pb_save from picturebutton within w_admi_ambu
end type
type tab_1 from tab within w_admi_ambu
end type
type tabpage_1 from userobject within tab_1
end type
type pb_print_ent from pb_report within tabpage_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type stt_diag from statictext within tabpage_1
end type
type dw_admi from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_print_ent pb_print_ent
cbx_1 cbx_1
stt_diag stt_diag
dw_admi dw_admi
end type
type tab_1 from tab within w_admi_ambu
tabpage_1 tabpage_1
end type
type pb_del from picturebutton within w_admi_ambu
end type
type dw_emppac from datawindow within w_admi_ambu
end type
type st_1 from statictext within w_admi_ambu
end type
type pb_new from picturebutton within w_admi_ambu
end type
type dw_historial from datawindow within w_admi_ambu
end type
end forward

global type w_admi_ambu from window
integer width = 4471
integer height = 2380
boolean titlebar = true
string title = "Nueva Admisión Ambulatoria"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "hospital.ico"
boolean center = true
cbx_res cbx_res
dw_his_acu dw_his_acu
dw_tingres dw_tingres
st_2 st_2
pb_save pb_save
tab_1 tab_1
pb_del pb_del
dw_emppac dw_emppac
st_1 st_1
pb_new pb_new
dw_historial dw_historial
end type
global w_admi_ambu w_admi_ambu

type variables
string tipo_ingres,clugar_ing
boolean guardo=true
String  Cdemp, Ctemp,continua
long i_nh=-1
end variables

on w_admi_ambu.create
this.cbx_res=create cbx_res
this.dw_his_acu=create dw_his_acu
this.dw_tingres=create dw_tingres
this.st_2=create st_2
this.pb_save=create pb_save
this.tab_1=create tab_1
this.pb_del=create pb_del
this.dw_emppac=create dw_emppac
this.st_1=create st_1
this.pb_new=create pb_new
this.dw_historial=create dw_historial
this.Control[]={this.cbx_res,&
this.dw_his_acu,&
this.dw_tingres,&
this.st_2,&
this.pb_save,&
this.tab_1,&
this.pb_del,&
this.dw_emppac,&
this.st_1,&
this.pb_new,&
this.dw_historial}
end on

on w_admi_ambu.destroy
destroy(this.cbx_res)
destroy(this.dw_his_acu)
destroy(this.dw_tingres)
destroy(this.st_2)
destroy(this.pb_save)
destroy(this.tab_1)
destroy(this.pb_del)
destroy(this.dw_emppac)
destroy(this.st_1)
destroy(this.pb_new)
destroy(this.dw_historial)
end on

event open;dw_emppac.retrieve(tipdoc,docu)
guardo=true
end event

event close;//closewithreturn(this,i_nh)

end event

type cbx_res from checkbox within w_admi_ambu
boolean visible = false
integer x = 2761
integer y = 632
integer width = 265
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reserva"
end type

type dw_his_acu from datawindow within w_admi_ambu
boolean visible = false
integer x = 3543
integer y = 2084
integer width = 686
integer height = 84
integer taborder = 50
string title = "none"
string dataobject = "dw_historial_acumcab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_tingres from datawindow within w_admi_ambu
integer x = 1051
integer y = 384
integer width = 1065
integer height = 88
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;//this.modify('datawindow.detail.height="116" ')
//this.modify('codtingre.font.height="-12" ')
//this.modify('codtingre.height="90"')
//this.modify('codtingre.width="791"') 
this.settransobject(sqlca)
datawindowchild ding
this.getchild('codtingre',ding)
ding.settransobject(sqlca)
//ding.modify('datawindow.detail.height="90" ')
//ding.modify('descripcion.font.height="-12" ')
//ding.modify('descripcion.height="80"')
//ding.modify('descripcion.width="791"') 
ding.retrieve()
ding.deleterow(1)
this.insertrow(1)
setitem(1,1,'4')
tipo_ingres='4'


end event

type st_2 from statictext within w_admi_ambu
integer x = 14
integer y = 8
integer width = 3442
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " Empresa a responder por el Ingreso"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_save from picturebutton within w_admi_ambu
event mousemove pbm_mousemove
integer x = 2011
integer y = 2092
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &g"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Datos Ingreso y Aceptar [Alt+G]"
end type

event clicked;if tab_1.tabpage_1.dw_admi.rowcount()<1 then return
Datetime hora,fecha
long ntraslado
if isnull(tab_1.tabpage_1.dw_admi.getitemstring(1,"viaingreso")) then
	messagebox("Error","Debe escoger la vía de ingreso")
	return
end if
if isnull(tab_1.tabpage_1.dw_admi.getitemstring(1,"causaexterna")) then
	messagebox("Error","Debe escoger la causa externa")
	return
end if
long contador,donde
if isnull(tab_1.tabpage_1.dw_admi.getitemnumber(1,'contador')) then 
	
//	SELECT max( Historial.Contador) into :contador FROM Historial where clugar=:clugar;
//	if isnull(contador) then contador=0
//	contador++
	contador=f_trae_ndoc('HIS',clugar,'Historial')
	tab_1.tabpage_1.dw_admi.setitem(1,"contador",contador)
	dw_historial.setitem(1,"contador",contador)
	if dw_historial.update()=-1 then
		rollback;
		return
	end if
	dw_his_acu.setitem(1,"contador",contador)
	if dw_his_acu.update()=-1 then
		dw_his_acu.deleterow(1)
		dw_his_acu.resetupdate()
		rollback;
		return -1
	end if
//	SELECT max(NH) into :i_nh FROM hospadmi where clugar=:clugar;
//	if isnull(i_nh) then i_nh=0
//	i_nh++
	i_nh=f_trae_ndoc('ING',clugar,'INGRESO ADMISIONES')
	tab_1.tabpage_1.dw_admi.setitem(1,"nh",i_nh)
	tab_1.tabpage_1.dw_admi.setitem(1,"clugar_his",clugar)
end if
if cbx_res.checked then tab_1.tabpage_1.dw_admi.setitem(1,'estado','6')
if tab_1.tabpage_1.dw_admi.update()=-1 then
	rollback;
	i_nh=-1
	return
end if
commit;
guardo=true
if isvalid(w_admision) then w_admision.dw_tingres.triggerevent(itemchanged!)
if isvalid(w_new_at_os) then w_new_at_os.dw_tip_ingres.triggerevent(itemchanged!)
if isvalid(w_entrega_med) then w_entrega_med.dw_tip_ingres.triggerevent(itemchanged!)
w_new_sala_qx.triggerevent(open!)
donde=w_new_sala_qx.dw_admi.find('nh='+string(i_nh),1,w_new_sala_qx.dw_admi.rowcount())
if donde<>1 and donde>0 then w_new_sala_qx.dw_admi.scrolltorow(donde)
closewithreturn(parent,i_nh)
end event

type tab_1 from tab within w_admi_ambu
event create ( )
event destroy ( )
integer x = 5
integer y = 412
integer width = 4398
integer height = 1652
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
alignment alignment = center!
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

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4361
integer height = 1524
long backcolor = 67108864
string text = "Admisión"
long tabtextcolor = 33554432
string picturename = "hospital.ico"
long picturemaskcolor = 536870912
pb_print_ent pb_print_ent
cbx_1 cbx_1
stt_diag stt_diag
dw_admi dw_admi
end type

on tabpage_1.create
this.pb_print_ent=create pb_print_ent
this.cbx_1=create cbx_1
this.stt_diag=create stt_diag
this.dw_admi=create dw_admi
this.Control[]={this.pb_print_ent,&
this.cbx_1,&
this.stt_diag,&
this.dw_admi}
end on

on tabpage_1.destroy
destroy(this.pb_print_ent)
destroy(this.cbx_1)
destroy(this.stt_diag)
destroy(this.dw_admi)
end on

type pb_print_ent from pb_report within tabpage_1
integer x = 4133
integer y = 16
integer width = 169
integer height = 148
integer taborder = 50
string text = "        &p"
boolean originalsize = false
string picturename = "print2.gif"
string disabledname = "d_prin2t.gif"
string powertiptext = "Imprimir Admisión [Alt+P]"
string cod_rep = "ADHU"
string nombre_rep = "Admisión URg/Hosp."
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_admi.rowcount()<1 then return
any par[2]
par[1]=dw_admi.getitemnumber(1,"nh")
par[2]=tipo_ingres
par[3]=dw_admi.getitemstring(1,"clugar")
imprimir(par,'','0')


end event

type cbx_1 from checkbox within tabpage_1
boolean visible = false
integer x = 2418
integer y = 496
integer width = 434
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "En Observación"
end type

type stt_diag from statictext within tabpage_1
boolean visible = false
integer x = 64
integer y = 1220
integer width = 2139
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_admi from datawindow within tabpage_1
integer x = 55
integer width = 4027
integer height = 1448
integer taborder = 60
string title = "none"
string dataobject = "dw_admision"
boolean border = false
end type

event constructor;this.settransobject(sqlca)
end event

event doubleclicked;if this.getcolumnname()<>"cod_rips" then return
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
	this.setitem(1,"diagingre",st_d.codgeral)
	this.setitem(1,"cod_rips",st_d.codrip)
	stt_diag.text=st_d.descripcion
end if
end event

event itemchanged;if this.getcolumnname()="cod_rips" then
	string este='',nulo
	st_return_diags st
	
	setnull(nulo)
	if trim(data)="" then 
		this.setitem(1,'diagingre',nulo)
		return
	end if
	sex_busca=w_principal.dw_1.getitemstring(1,"sexo")
	edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
	st=f_check_diag(data,sex_busca,edad_busca,este,'0','1','0')
	if st.descrip_diag="" then
		this.setitem(1,"diagingre",nulo)
		this.setitem(1,"cod_rips",'')
		stt_diag.text=""
		return 1
	else
		this.accepttext()
		this.setitem(1,"diagingre",este)
		stt_diag.text=st.descrip_diag
	end if
end if
if this.getcolumnname()='fechaingreso' then
	datetime fech
	fech=datetime(date(left(data,10)))
	if fech>datetime(today()) then 
		this.setitem(1,this.getcolumn(),this.getitemdatetime(1,'fechaingreso'))
		this.settext(string(this.getitemdatetime(1,'fechaingreso')))
		return 1
	end if
	long contador,cuantos
	string clug_his
	contador=this.getitemnumber(1,'contador')
	if not isnull(contador) then
		clug_his=this.getitemstring(1,'clugar_his')
		select count(nservicio) into :cuantos from serviciosingreso where contador=:contador and clugar=:clug_his and fecha<:fech;
		if cuantos>0 then
			this.setitem(1,this.getcolumn(),this.getitemdatetime(1,'fechaingreso'))
			this.settext(string(this.getitemdatetime(1,'fechaingreso')))
			messagebox('Atención','Hay '+string(cuantos)+' servicios que fueron prestados o suministrados antes de esta fecha')
			return 1
		end if
	end if
end if
this.accepttext()
guardo=false
end event

event retrieveend;if rowcount<1 then return
string diagn,clug_hadm
diagn=this.getitemstring(1,"diagingre")
if diagn<>"" then 
	select desdiag into :stt_diag.text from diags where codgeral=:diagn;
end if
long nh
nh=this.getitemnumber(1,"nh")
clug_hadm=this.getitemstring(1,"clugar")
if tipo_ingres='2' then
	string enobserv
	setnull(enobserv)
	tab_1.tabpage_1.cbx_1.visible=true
	tab_1.tabpage_1.cbx_1.enabled=true
	select en_observa into :enobserv from hospadmi where nh=:nh and clugar=:clug_hadm and codtingre='2';
	if enobserv='1' then tab_1.tabpage_1.cbx_1.checked=true
	if this.getitemstring(1,'estado')<>'1' then tab_1.tabpage_1.cbx_1.enabled=false
end if
end event

event itemfocuschanged;if this.getcolumnname()="cod_rips" then
	string data,este
	st_return_diags st
	
	data=this.getitemstring(1,this.getcolumnname())
	if data<>"" then
		este=this.getitemstring(1,'diagingre')
		sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
		edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
		st=f_check_diag(data,sex_busca,edad_busca,este,'0','1','0')
		stt_diag.text=st.descrip_diag
	else
		stt_diag.text=""
	end if
end if
end event

event clicked;if dwo.name='facturado' then
	if not isnull(this.getitemnumber(this.getrow(),'facturado')) then
		open(w_busca_fact)
		w_busca_fact.dw_busca.setitem(1,1,'factcab.nfact = ')
		w_busca_fact.dw_busca.setitem(1,2,string(this.getitemnumber(this.getrow(),'facturado')))
		w_busca_fact.dw_busca.accepttext()
		w_busca_fact.pb_busca.triggerevent(clicked!)
	end if
end if
end event

type pb_del from picturebutton within w_admi_ambu
event mousemove pbm_mousemove
integer x = 2181
integer y = 2092
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Admisión"
end type

event clicked;closewithreturn(parent,-1)
end event

type dw_emppac from datawindow within w_admi_ambu
integer x = 14
integer y = 68
integer width = 3451
integer height = 308
integer taborder = 30
string title = "none"
string dataobject = "dw_empacguarda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type st_1 from statictext within w_admi_ambu
integer x = 421
integer y = 404
integer width = 393
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Tipo Ingreso:"
boolean focusrectangle = false
end type

type pb_new from picturebutton within w_admi_ambu
event mousemove pbm_mousemove
integer x = 3502
integer y = 76
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nueva admisión [Alt+N]"
end type

event clicked;if dw_emppac.rowcount()=0 then 
	messagebox("Atención","Este paciente no tiene una empresa responsable, asignele una en la ficha de pacientes")
	return
end if
if dw_emppac.getitemstring(dw_emppac.getrow(),'estado')<>'1' then
	messagebox("Atención","Este Contrato no está activo, no puede continuar")
	return
end if
long consec_soat,ncatas
string empr,contr,clugar_soat,clugar_catas
empr=dw_emppac.getitemstring(dw_emppac.getrow(),"codemp")
contr=dw_emppac.getitemstring(dw_emppac.getrow(),"codcontrato")
open(w_alerta_deuda)
if message.stringparm='!' then return
setnull(consec_soat)
setnull(clugar_soat)
setnull(ncatas)
setnull(clugar_catas)
if dw_emppac.getitemstring(dw_emppac.getrow(),"soat")='1' then
	st_soat st
	st.nsoat=consec_soat
	st.newemp=dw_emppac.getitemstring(dw_emppac.getrow(),"codemp")
	st.newcont=dw_emppac.getitemstring(dw_emppac.getrow(),"codcontrato")
	openwithparm(w_soat,st)
	if message.stringparm="!" or not isvalid(message.powerobjectparm) then return
	st=message.powerobjectparm
	clugar_soat=st.clug_soat
	consec_soat=st.nsoat
end if
if dw_emppac.getitemstring(dw_emppac.getrow(),"catastrofe")='1' then
	openwithparm(w_catastrofes,'nuevo')
	trae trae2
	if message.stringparm="!" or not isvalid(message.powerobjectparm) then return
	trae2=message.PowerObjectParm
	ncatas=trae2.numero
	clugar_catas=trae2.lugar
end if
dw_historial.insertrow(1)
dw_historial.setitem(1,"fecha",datetime(today(),time(string(now()))))
dw_historial.setitem(1,"tipodoc",tipdoc)
dw_historial.setitem(1,"documento",docu)
dw_historial.setitem(1,"indapdx",tipo_ingres)
dw_historial.setitem(1,"clugar",clugar)
dw_historial.setitem(1,"consec_soat",consec_soat)
dw_historial.setitem(1,"clugar_soat",clugar_soat)
dw_historial.setitem(1,"ncatastrofe",ncatas)
dw_historial.setitem(1,"clugar_catas",clugar_catas)
//por nueva tabla para ligar ingresos al abrir cuenta en soat
if not isnull(consec_soat) then
		dw_his_acu.insertrow(1)
		dw_his_acu.setitem(1,"clugar",clugar)
		dw_his_acu.setitem(1,"consec_soat",consec_soat)
		dw_his_acu.setitem(1,"clugar_soat",clugar_soat)
end if
tab_1.tabpage_1.dw_admi.reset()
tab_1.tabpage_1.dw_admi.insertrow(1)
tab_1.tabpage_1.dw_admi.setitem(1,"tipodoc",tipdoc)
tab_1.tabpage_1.dw_admi.setitem(1,"documento",docu)
tab_1.tabpage_1.dw_admi.setitem(1,"clugar",clugar)
tab_1.tabpage_1.dw_admi.setitem(1,"CodTIngre",tipo_ingres)
tab_1.tabpage_1.dw_admi.setitem(1,"cemp",empr)
tab_1.tabpage_1.dw_admi.setitem(1,"ccontrato",contr)
tab_1.tabpage_1.dw_admi.Setitem(1,"CUsuario",usuario)
tab_1.tabpage_1.dw_admi.Setitem(1,"viaingreso",'2')
tab_1.tabpage_1.dw_admi.setitem(1,"FechaIngreso",datetime(date(w_qx_sinprog.dw_cab.getitemdatetime(w_qx_sinprog.dw_cab.getrow(),'tiniciaqx'))))
tab_1.tabpage_1.dw_admi.setitem(1,"Horaingreso",datetime(date('1/1/1900'),time(w_qx_sinprog.dw_cab.getitemdatetime(w_qx_sinprog.dw_cab.getrow(),'tiniciaqx'))))
//tab_1.tabpage_1.dw_admi.Setitem(1,"diagingre",w_qx_sinprog.dw_cab.getitemstring(w_qx_sinprog.dw_cab.getrow(),'codgeral'))
//tab_1.tabpage_1.dw_admi.Setitem(1,"cod_rips",w_qx_sinprog.dw_cab.getitemstring(w_qx_sinprog.dw_cab.getrow(),'cod_rips'))
//tab_1.tabpage_1.stt_diag.text=w_qx_sinprog.dw_cab.getitemstring(w_qx_sinprog.dw_cab.getrow(),'desdiag')
clugar_ing=clugar
dw_historial.scrolltorow(1)
guardo=false
tab_1.tabpage_1.dw_admi.setfocus()
tab_1.tabpage_1.dw_admi.enabled=true

end event

type dw_historial from datawindow within w_admi_ambu
event p_borrar ( long nfila )
boolean visible = false
integer x = 4133
integer y = 256
integer width = 229
integer height = 88
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_historial_tipo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_borrar(long nfila);this.deleterow(nfila)
end event

event constructor;this.settransobject(sqlca)
end event

event rowfocuschanged;if this.getrow()<1 then 
	tab_1.tabpage_1.dw_admi.reset()
	tab_1.tabpage_1.stt_diag.visible=false
	tab_1.tabpage_1.cbx_1.visible=false
	tab_1.tabpage_1.cbx_1.checked=false
	return
end if
tab_1.tabpage_1.stt_diag.text=""
clugar_ing=this.getitemstring(this.getrow(),"clugar")
if not isnull(this.getitemnumber(this.getrow(),"contador")) then 
	tab_1.tabpage_1.dw_admi.retrieve(this.getitemnumber(this.getrow(),"contador"),this.getitemstring(this.getrow(),"clugar"))
	tab_1.tabpage_1.stt_diag.visible=true
	guardo=true
end if

end event

