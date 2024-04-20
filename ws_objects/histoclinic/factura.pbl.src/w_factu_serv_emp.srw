$PBExportHeader$w_factu_serv_emp.srw
forward
global type w_factu_serv_emp from window
end type
type dw_qx from datawindow within w_factu_serv_emp
end type
type pb_retrieve from picturebutton within w_factu_serv_emp
end type
type dw_contdet from datawindow within w_factu_serv_emp
end type
type st_4 from statictext within w_factu_serv_emp
end type
type st_3 from statictext within w_factu_serv_emp
end type
type st_2 from statictext within w_factu_serv_emp
end type
type em_2 from editmask within w_factu_serv_emp
end type
type em_1 from editmask within w_factu_serv_emp
end type
type pb_cancel from picturebutton within w_factu_serv_emp
end type
type pb_ok from picturebutton within w_factu_serv_emp
end type
type st_1 from statictext within w_factu_serv_emp
end type
type dw_emp_cont from datawindow within w_factu_serv_emp
end type
type dw_facturar from datawindow within w_factu_serv_emp
end type
end forward

global type w_factu_serv_emp from window
integer width = 3479
integer height = 1536
boolean titlebar = true
string title = "Facturar servicios ya prestados por Empresa"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "RunReport5!"
boolean clientedge = true
boolean center = true
dw_qx dw_qx
pb_retrieve pb_retrieve
dw_contdet dw_contdet
st_4 st_4
st_3 st_3
st_2 st_2
em_2 em_2
em_1 em_1
pb_cancel pb_cancel
pb_ok pb_ok
st_1 st_1
dw_emp_cont dw_emp_cont
dw_facturar dw_facturar
end type
global w_factu_serv_emp w_factu_serv_emp

type variables
datawindowchild contrato
int xant,yant
end variables

on w_factu_serv_emp.create
this.dw_qx=create dw_qx
this.pb_retrieve=create pb_retrieve
this.dw_contdet=create dw_contdet
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.em_2=create em_2
this.em_1=create em_1
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_1=create st_1
this.dw_emp_cont=create dw_emp_cont
this.dw_facturar=create dw_facturar
this.Control[]={this.dw_qx,&
this.pb_retrieve,&
this.dw_contdet,&
this.st_4,&
this.st_3,&
this.st_2,&
this.em_2,&
this.em_1,&
this.pb_cancel,&
this.pb_ok,&
this.st_1,&
this.dw_emp_cont,&
this.dw_facturar}
end on

on w_factu_serv_emp.destroy
destroy(this.dw_qx)
destroy(this.pb_retrieve)
destroy(this.dw_contdet)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_1)
destroy(this.dw_emp_cont)
destroy(this.dw_facturar)
end on

type dw_qx from datawindow within w_factu_serv_emp
boolean visible = false
integer x = 1175
integer y = 316
integer width = 640
integer height = 48
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dw_serv_emp_qx"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_retrieve from picturebutton within w_factu_serv_emp
event mousemove pbm_mousemove
event mousemove1 pbm_mousemove
integer x = 2834
integer y = 216
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &t"
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Traer Procedimientos a Generar [Alt+T]"
end type

event clicked;string emp,cont,soat,strinnulo
long j,k,numnulo
emp=dw_emp_cont.getitemstring(1,1)
cont=dw_emp_cont.getitemstring(1,"codcontrato")
select soat into :soat from contratos where codemp=:emp and codcontrato=:cont;
if soat='1' then
	messagebox("Atención","Este contrato es de Accidentes de Tránsito no puede generarle facturas de esta forma, ya que las facturas deben ser por paciente")
	return
end if
dw_facturar.retrieve(emp,cont,datetime(date(em_1.text)),datetime(date(em_2.text)))
dw_qx.retrieve(emp,cont,datetime(date(em_1.text)),datetime(date(em_2.text)))
setnull(strinnulo)
setnull(numnulo)
dw_facturar.sort()
dw_facturar.groupcalc()
end event

type dw_contdet from datawindow within w_factu_serv_emp
boolean visible = false
integer y = 112
integer width = 69
integer height = 52
boolean enabled = false
string title = "none"
string dataobject = "dw_cont_deta"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

type st_4 from statictext within w_factu_serv_emp
boolean visible = false
integer x = 2715
integer y = 1276
integer width = 681
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_factu_serv_emp
integer x = 2834
integer y = 132
integer width = 192
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_factu_serv_emp
integer x = 2834
integer y = 28
integer width = 178
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde:"
boolean focusrectangle = false
end type

type em_2 from editmask within w_factu_serv_emp
integer x = 3026
integer y = 116
integer width = 375
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
end type

event constructor;if isdate("31/"+string(today(),"mm/yyyy")) then
	this.text="31/"+string(today(),"mm/yyyy")
else
	if isdate("30/"+string(today(),"mm/yyyy")) then
		this.text="30/"+string(today(),"mm/yyyy")
	else
		if isdate("29/"+string(today(),"mm/yyyy")) then
			this.text="29/"+string(today(),"mm/yyyy")
		else
			this.text="28/"+string(today(),"mm/yyyy")
		end if
	end if
end if
end event

type em_1 from editmask within w_factu_serv_emp
integer x = 3026
integer y = 8
integer width = 370
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
end type

event constructor;this.text="01/"+string(today(),"mm/yyyy")
end event

type pb_cancel from picturebutton within w_factu_serv_emp
integer x = 1641
integer y = 1272
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_factu_serv_emp
integer x = 1481
integer y = 1272
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;long j,donde,fila_c,k,cantidad,contador,nserv,ncita,nserv_cita,sec_cant_cita,edad
long cuantos=0
st_4.visible=true
string emp,cont,quepaga,cproc,clug_his,nautoriza,uf,cc,codta,sexo,tipo,tdoc,doc,estrato,desproc
string tdoc_ant,doc_ant,clug_cita,tipo_fac
emp=dw_emp_cont.getitemstring(1,"codemp")
cont=dw_emp_cont.getitemstring(1,"codcontrato")
tipo_fac=dw_emp_cont.getitemstring(1,"tipo")
if dw_contdet.retrieve(emp,cont,'1')=0 then
	messagebox("Atención","Este Contrato no tiene planes configurados, no puede continuar")
	return
end if
for j=1 to dw_facturar.rowcount()
	tdoc=dw_facturar.getitemstring(j,"tipodoc")
	doc=dw_facturar.getitemstring(j,"documento")
	if tdoc<>tdoc_ant or doc<>doc_ant then
		w_factura.i_comprobo=0
		w_factura.i_tipoingreso="1"
		w_factura.i_confirma_ge='si'
	end if
	tdoc_ant=tdoc
	doc_ant=doc
	if dw_facturar.getitemstring(j,"esco")='1' then
		st_4.text="Reg. "+string(j)+" de "+string(dw_facturar.rowcount())
		//tiene recibo?
		if not isnull(dw_facturar.getitemnumber(j,"nrcaj")) and not isnull(dw_facturar.getitemnumber(j,"vproc"))then
			if dw_facturar.getitemstring(j,"tiposervicio")="Q" then
				dw_qx.setfilter("nrcaj="+string(dw_facturar.getitemnumber(j,"nrcaj"))+" and clugar='"+dw_facturar.getitemstring(j,"clugar_rec")+"' and items="+string(dw_facturar.getitemnumber(j,"items"))+" and nitem="+string(dw_facturar.getitemnumber(j,"nitem_rec")))
				dw_qx.filter()
			end if
			f_lleva_a_factu_reci(j,w_factura.dw_factura,w_factura.dw_factura_cpo,dw_facturar,dw_qx,'G',contrato.getitemstring(contrato.getrow(),'descontrato'))
			cuantos++
			continue
		end if  //fin de tenia recibo
//			donde=w_factura.dw_factura.insertrow(0)
//			w_factura.dw_factura.scrolltorow(donde)
//			if dw_facturar.getitemstring(j,"tiposervicio")<>"Q" then
//				w_factura.dw_factura.setitem(donde,"tipo_proc","G")
//			else
//				w_factura.dw_factura.setitem(donde,"tipo_proc","Q")
//				dw_qx.setfilter("nrcaj="+string(dw_facturar.getitemnumber(j,"nrcaj"))+" and clugar='"+dw_facturar.getitemstring(j,"clugar_rec")+"' and items="+string(dw_facturar.getitemnumber(j,"items"))+" and nitem="+string(dw_facturar.getitemnumber(j,"nitem_rec")))
//				dw_qx.filter()
//				w_factura.dw_factura.setitem(donde,"grupo",dw_facturar.getitemstring(j,"grupo"))
//				w_factura.dw_factura.setitem(donde,"puntos",dw_facturar.getitemnumber(j,"puntos"))
//				for k=1 to dw_qx.rowcount()
//					w_factura.dw_factura_cpo.insertrow(1)
//					w_factura.dw_factura_cpo.setitem(1,"num_padre",donde)
//					w_factura.dw_factura_cpo.setitem(1,"numero",dw_qx.getitemnumber(k,"nsubitem"))
//					w_factura.dw_factura_cpo.setitem(1,"tipo_proc",'2')
//					w_factura.dw_factura_cpo.setitem(1,"cproced",dw_qx.getitemstring(k,"cproced"))
//					w_factura.dw_factura_cpo.setitem(1,"valor",dw_qx.getitemnumber(k,"vproced"))
//					w_factura.dw_factura_cpo.setitem(1,"cantidad",1)
//					w_factura.dw_factura_cpo.setitem(1,"cod_manual",dw_facturar.getitemstring(j,"man_reci"))
//					w_factura.dw_factura_cpo.setitem(1,"nombre",dw_qx.getitemstring(k,"descripcion"))
//					w_factura.dw_factura_cpo.setitem(1,"mieiv",100)
//					w_factura.dw_factura_cpo.setitem(1,"miedv",100)
//					w_factura.dw_factura_cpo.setitem(1,"mdeiv",100)
//					w_factura.dw_factura_cpo.setitem(1,"mdedv",100)
//				next
//			end if
//			w_factura.dw_factura.setitem(donde,"cproc",dw_facturar.getitemstring(j,"cprocedeq"))
//			if dw_facturar.getitemstring(j,"tiposervicio")="M" then 
//				w_factura.dw_factura.setitem(donde,"es_medica","1")
//				w_factura.dw_factura.setitem(donde,"cproc",dw_facturar.getitemstring(j,"cproced"))
//			else
//				w_factura.dw_factura.setitem(donde,"proccups",dw_facturar.getitemstring(j,"cproced"))
//			end if
//			w_factura.dw_factura.setitem(donde,"desde",'G')
//			w_factura.dw_factura.setitem(donde,"descripcion",dw_facturar.getitemstring(j,"descripcion"))
//			w_factura.dw_factura.setitem(donde,"vp_unit",dw_facturar.getitemnumber(j,"vproc"))
//			w_factura.dw_factura.setitem(donde,"numero",donde)
//			w_factura.dw_factura.setitem(donde,"plan",dw_facturar.getitemstring(j,"plan_reci"))
//			w_factura.dw_factura.setitem(donde,"rips",dw_facturar.getitemstring(j,"rips"))
//			fila_c=dw_contdet.find("cplan='"+dw_facturar.getitemstring(j,"plan_reci")+"'",1,dw_contdet.rowcount())
//			if fila_c=0 then fila_c=1
//			w_factura.dw_factura.setitem(donde,"por_manual",dw_contdet.getitemnumber(fila_c,"pormanual")/100)
//			if dw_contdet.getitemstring(fila_c,"copago")='1' then quepaga="Copago"
//			if dw_contdet.getitemstring(fila_c,"cuotamode")='1' then quepaga="Cuota Mode."
//			if dw_contdet.getitemstring(fila_c,"cuotarecu")='1' then quepaga="Cuota Recu."
//			if dw_contdet.getitemstring(fila_c,"pagopart")='1' then quepaga="particular"
//			w_factura.dw_factura.setitem(donde,"que_paga",quepaga)
//			w_factura.dw_factura.setitem(donde,"coduf",dw_facturar.getitemstring(j,"cufuncional"))
//			w_factura.dw_factura.setitem(donde,"codcc",dw_facturar.getitemstring(j,"cccosto"))
//			w_factura.dw_factura.setitem(donde,"cod_concep",dw_facturar.getitemstring(j,"codconcepto"))
//
//			w_factura.dw_factura.setitem(donde,"areaadx",dw_facturar.getitemstring(j,"codaadx"))
//			w_factura.dw_factura.setitem(donde,"nserv_cita",dw_facturar.getitemnumber(j,"nserv_turno"))
//			w_factura.dw_factura.setitem(donde,"ncita",dw_facturar.getitemnumber(j,"ncita"))
//			w_factura.dw_factura.setitem(donde,"sec_cant_cita",dw_facturar.getitemnumber(j,"sec_cant"))
//			
//			
//			w_factura.dw_factura.setitem(donde,"cod_manual",dw_facturar.getitemstring(j,"man_reci"))
//			w_factura.dw_factura.setitem(donde,"cemp",dw_facturar.getitemstring(j,"cemp"))
//			w_factura.dw_factura.setitem(donde,"ccontrato",dw_facturar.getitemstring(j,"ccontrato"))
//			w_factura.dw_factura.setitem(donde,"tipodoc",tdoc)
//			w_factura.dw_factura.setitem(donde,"docu",doc)
//			w_factura.dw_factura.setitem(donde,"des_cont",contrato.getitemstring(contrato.getrow(),"descontrato"))
//			w_factura.dw_factura.setitem(donde,"contador",dw_facturar.getitemnumber(j,"contador"))
//			w_factura.dw_factura.setitem(donde,"clugar_his",dw_facturar.getitemstring(j,"clugar"))
//			w_factura.dw_factura.setitem(donde,"nserv",dw_facturar.getitemnumber(j,"nservicio"))
//			w_factura.dw_factura.setitem(donde,"nrcaj",dw_facturar.getitemnumber(j,"nrcaj"))
//			w_factura.dw_factura.setitem(donde,"clugar_rec",dw_facturar.getitemstring(j,"clugar_rec"))
//			w_factura.dw_factura.setitem(donde,"items",dw_facturar.getitemnumber(j,"items"))
//			w_factura.dw_factura.setitem(donde,"cantidad",dw_facturar.getitemnumber(j,"cantidad"))
//			w_factura.dw_factura.setitem(donde,"autoriza",dw_facturar.getitemstring(j,"nautoriza"))
//			w_factura.dw_factura.setitem(donde,"vt_proc",dw_facturar.getitemnumber(j,"vproc"))
//			w_factura.dw_factura.setitem(donde,"vt_emp", dw_facturar.getitemnumber(j,"vemp") )
//			w_factura.dw_factura.setitem(donde,"vt_pac", dw_facturar.getitemnumber(j,"v_pac") )
//			if dw_facturar.getitemnumber(j,"v_pac")=0 then
//				w_factura.dw_factura.setitem(donde,"percent_pac",0)
//			else
//				w_factura.dw_factura.setitem(donde,"percent_pac",dw_facturar.getitemnumber(j,"vproc")/dw_facturar.getitemnumber(j,"v_pac") )
//			end if
		cproc=dw_facturar.getitemstring(j,"cproced")
		desproc=dw_facturar.getitemstring(j,"descripcion")
		cantidad=dw_facturar.getitemnumber(j,"cantidad")
		contador=dw_facturar.getitemnumber(j,"contador")
		clug_his=dw_facturar.getitemstring(j,"clugar")
		nserv=dw_facturar.getitemnumber(j,"nservicio")
		ncita=dw_facturar.getitemnumber(j,"ncita")
		clug_cita=dw_facturar.getitemstring(j,"clugar_cita")
		nserv_cita=dw_facturar.getitemnumber(j,"nserv_turno")
		sec_cant_cita=dw_facturar.getitemnumber(j,"sec_cant")
		nautoriza=trim(dw_facturar.getitemstring(j,"nautoriza"))
		uf=dw_facturar.getitemstring(j,"cufuncional")
		cc=dw_facturar.getitemstring(j,"cccosto")
		emp=dw_facturar.getitemstring(j,"cemp")
		cont=dw_facturar.getitemstring(j,"ccontrato")
		codta=dw_facturar.getitemstring(j,"codta")
		edad=dw_facturar.getitemnumber(j,"anyos")
		sexo=dw_facturar.getitemstring(j,"sexo")
		w_factura.i_comprobo=0
		w_factura.i_confirma_ge='si'
		tipo=dw_facturar.getitemstring(j,"tipo")
		estrato=dw_facturar.getitemstring(j,"estrato")
		
		
		//37 parametros ( p_codigo,p_desproc, p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
		//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta,p_estrato, p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
		//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
		//  p_sec_cant_cita, p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat,p_clug_trat, p_item_trat)
		if w_factura.lf_cargar_a(cproc,desproc,cantidad,tipo,'1',nautoriza,emp,cont,0, &
		  '',tdoc,doc,edad,sexo,codta,estrato,uf,cc,'G',1,contador, &
		  clug_his,nserv,'','','',0,'',ncita,clug_cita,nserv_cita,&
		  sec_cant_cita,0,'',0,0,'',0,'','!',dw_facturar.getitemnumber(j,"nro_insumo"),0,0,'',tipo_fac,0,'','',0,'0','')<>-1 then cuantos++
	end if
next
w_factura.resumen('G')
st_4.visible=false
if cuantos>0 then
	w_factura.pb_paci.enabled=false
	w_factura.pb_emp.enabled=false
else
	return
end if
w_factura.dw_emppac.reset()
w_factura.dw_emppac.retrieve(tipdoc,docu)
if w_factura.dw_factura.rowcount()=0 then
	w_factura.pb_paci.enabled=true
	w_factura.pb_emp.enabled=true
else
	//w_factura.i_fact_xemp=true //para los quirúrgicos
end if
close(parent)
end event

type st_1 from statictext within w_factu_serv_emp
integer x = 96
integer y = 32
integer width = 2661
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Escoger Empresa y Contrato a facturar servicios ya prestados."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_emp_cont from datawindow within w_factu_serv_emp
integer x = 73
integer y = 156
integer width = 2715
integer height = 172
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_emp_cont"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.getchild("codcontrato",contrato)
contrato.settransobject(sqlca)
contrato.retrieve("%",clugar)
this.insertrow(1)

end event

event itemchanged;this.accepttext()
choose case this.getcolumnname()
	case "codemp"
		contrato.retrieve(data,clugar)
		this.setitem(1,2,"")
	case "codcontrato"
		
end choose
end event

type dw_facturar from datawindow within w_factu_serv_emp
integer x = 73
integer y = 364
integer width = 3323
integer height = 892
integer taborder = 50
string title = "none"
string dataobject = "dw_serv_nofactu_empre2_1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event buttonclicked;int j
for j=1 to rowcount()
	if  dwo.text='Cobrar' then
		setrow(j)
		setitem(j,'esco','1')
	else
		setitem(j,'esco','0')
	end if
next
choose case dwo.text 
	case 'No Cobra' 
		modify(string(dwo.name)+'.text="Cobrar"') 
	case 'Cobrar' 
		modify(string(dwo.name)+'.text="No Cobra"') 
end choose

end event

