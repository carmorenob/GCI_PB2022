$PBExportHeader$w_factu_serv.srw
forward
global type w_factu_serv from window
end type
type rb_5 from radiobutton within w_factu_serv
end type
type rb_4 from radiobutton within w_factu_serv
end type
type dw_det_qx from datawindow within w_factu_serv
end type
type dw_qx from datawindow within w_factu_serv
end type
type rb_3 from radiobutton within w_factu_serv
end type
type rb_2 from radiobutton within w_factu_serv
end type
type rb_1 from radiobutton within w_factu_serv
end type
type pb_cancel from picturebutton within w_factu_serv
end type
type pb_aceptar from picturebutton within w_factu_serv
end type
type dw_serv_nofactu from datawindow within w_factu_serv
end type
type st_1 from statictext within w_factu_serv
end type
type gb_1 from groupbox within w_factu_serv
end type
end forward

global type w_factu_serv from window
integer width = 3822
integer height = 1348
boolean titlebar = true
string title = "Facturar Servicios ya Prestados o de Citas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "RunReport5!"
boolean clientedge = true
boolean center = true
rb_5 rb_5
rb_4 rb_4
dw_det_qx dw_det_qx
dw_qx dw_qx
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
pb_cancel pb_cancel
pb_aceptar pb_aceptar
dw_serv_nofactu dw_serv_nofactu
st_1 st_1
gb_1 gb_1
end type
global w_factu_serv w_factu_serv

type variables
long xant,yant
string i_emp_e,i_cont_e,i_reconf_emp,i_tipo_fac
boolean lb_hay=true

end variables

forward prototypes
public function integer f_busca_emp (ref string p_emp, ref string p_cont, ref string p_codta)
end prototypes

public function integer f_busca_emp (ref string p_emp, ref string p_cont, ref string p_codta);long donde,fila
if p_emp='' or p_cont='' or isnull(p_emp) or isnull(p_cont) then
	if i_emp_e='' then
		if isvalid(w_factura) then
			if w_factura.dw_emppac.rowcount()=1 then
				p_emp=w_factura.dw_emppac.getitemstring(1,'codemp')
				p_cont=w_factura.dw_emppac.getitemstring(1,'codcontrato')
				p_codta=w_factura.dw_emppac.getitemstring(1,'codta')
				i_emp_e=p_emp
				i_cont_e=p_cont
				i_tipo_fac=w_factura.dw_emppac.getitemstring(1,'tipo_fac')
			else
				if i_reconf_emp='1' then
					openwithparm(w_escoge,w_factura.dw_emppac)
					fila=message.doubleparm
				else
					fila=w_factura.dw_emppac.getrow()
				end if
				if fila<=0 then
					return -1
				else
					w_factura.dw_emppac.setfilter("estado='1'")
					w_factura.dw_emppac.filter()
					p_emp=w_factura.dw_emppac.getitemstring(fila,'codemp')
					p_cont=w_factura.dw_emppac.getitemstring(fila,'codcontrato')
					p_codta=w_factura.dw_emppac.getitemstring(fila,'codta')
					i_tipo_fac=w_factura.dw_emppac.getitemstring(fila,'tipo_fac')
					i_emp_e=p_emp
					i_cont_e=p_cont
					w_factura.dw_emppac.setfilter("")
					w_factura.dw_emppac.filter()
					
				end if
			end if
		end if
		if isvalid(w_rec_caja) then
			if w_rec_caja.dw_emppac.rowcount()=1 then
				p_emp=w_rec_caja.dw_emppac.getitemstring(1,'codemp')
				p_cont=w_rec_caja.dw_emppac.getitemstring(1,'codcontrato')
				p_codta=w_rec_caja.dw_emppac.getitemstring(1,'codta')
				i_emp_e=p_emp
				i_cont_e=p_cont
			else
				if i_reconf_emp='1' then
					openwithparm(w_escoge,w_rec_caja.dw_emppac)
					fila=message.doubleparm
				else
					fila=w_rec_caja.dw_emppac.getrow()
				end if
				if fila<=0 then
					return -1
				else
					p_emp=w_rec_caja.dw_emppac.getitemstring(fila,'codemp')
					p_cont=w_rec_caja.dw_emppac.getitemstring(fila,'codcontrato')
					p_codta=w_rec_caja.dw_emppac.getitemstring(fila,'codta')
					i_emp_e=p_emp
					i_cont_e=p_cont
				end if
			end if
		end if
		
	else
		if isvalid(w_factura) then
			donde=w_factura.dw_emppac.find('codemp="'+i_emp_e+'" and codcontrato="'+i_cont_e+'"',1,w_factura.dw_emppac.rowcount())
			p_codta=w_factura.dw_emppac.getitemstring(donde,'codta')
		end if
		if isvalid(w_rec_caja) then
			donde=w_rec_caja.dw_emppac.find('codemp="'+i_emp_e+'" and codcontrato="'+i_cont_e+'"',1,w_rec_caja.dw_emppac.rowcount())
			p_codta=w_rec_caja.dw_emppac.getitemstring(donde,'codta')
		end if
		p_emp=i_emp_e
		p_cont=i_cont_e
	end if
else //buscar el codta
	if isvalid(w_factura) then
		donde=w_factura.dw_emppac.find('codemp="'+p_emp+'" and codcontrato="'+p_cont+'"',1,w_factura.dw_emppac.rowcount())
	end if
	if isvalid(w_rec_caja) then
		donde=w_rec_caja.dw_emppac.find('codemp="'+p_emp+'" and codcontrato="'+p_cont+'"',1,w_rec_caja.dw_emppac.rowcount())
	end if
	if donde=0 then
		if p_emp='0' and p_cont='1' then
			p_codta='0'
			return 1
		end if
		messagebox("Atención",'El paciente ya no tiene la empresa '+p_emp +' y el contrato '+p_cont)
		return -1
	end if
	if isvalid(w_factura) then
		p_codta=w_factura.dw_emppac.getitemstring(donde,'codta')
		i_tipo_fac=w_factura.dw_emppac.getitemstring(donde,'tipo_fac')
	end if
	if isvalid(w_rec_caja) then
		p_codta=w_rec_caja.dw_emppac.getitemstring(donde,'codta')
		i_tipo_fac=w_rec_caja.dw_emppac.getitemstring(donde,'tipo_fac')
	end if
end if
return 1
end function

event open;rb_1.triggerevent(clicked!)
i_reconf_emp='0'
if isvalid(w_factura) then
	rb_1.enabled=true
	rb_2.enabled=true
	rb_3.enabled=true
	rb_4.enabled=true
	rb_5.enabled=true	
end if
if isvalid(w_rec_caja) then
	rb_1.enabled=true
	rb_2.enabled=true
	rb_3.enabled=false
	rb_4.enabled=false
	rb_5.enabled=false
end if

select emp_fact_cita into :i_reconf_emp from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then 	messagebox('Error leyendo Lugar.emp_fact_cita',sqlca.sqlerrtext)
if dw_serv_nofactu.rowcount()=0 then
	lb_hay=false
	rb_2.triggerevent(clicked!)
	rb_2.checked=true
	if dw_serv_nofactu.rowcount()=0 then
		lb_hay=false
		rb_3.triggerevent(clicked!)
		rb_3.checked=true
		if dw_serv_nofactu.rowcount()=0 then 
			lb_hay=false
			rb_4.triggerevent(clicked!)
			rb_4.checked=true
			if dw_serv_nofactu.rowcount()=0 then 
				if  lb_hay=false then messagebox('Atención','No hay servicios pendientes por facturar')
				close(this)
			end if
		end if
	end if
end if


end event

on w_factu_serv.create
this.rb_5=create rb_5
this.rb_4=create rb_4
this.dw_det_qx=create dw_det_qx
this.dw_qx=create dw_qx
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.dw_serv_nofactu=create dw_serv_nofactu
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.rb_5,&
this.rb_4,&
this.dw_det_qx,&
this.dw_qx,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.pb_cancel,&
this.pb_aceptar,&
this.dw_serv_nofactu,&
this.st_1,&
this.gb_1}
end on

on w_factu_serv.destroy
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.dw_det_qx)
destroy(this.dw_qx)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.dw_serv_nofactu)
destroy(this.st_1)
destroy(this.gb_1)
end on

type rb_5 from radiobutton within w_factu_serv
integer x = 1655
integer y = 52
integer width = 699
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenes Urg/Hosp"
end type

event clicked;dw_serv_nofactu.dataobject="dw_os_cpo_no_uh_fact"
dw_serv_nofactu.settransobject(sqlca)
dw_serv_nofactu.retrieve(tipdoc,docu)
st_1.text="El Paciente tiene los siguientes servicios de ordenes de servicio sin Facturar, marque los que desea facturar y presione aceptar."
end event

type rb_4 from radiobutton within w_factu_serv
integer x = 827
integer y = 112
integer width = 699
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenes de Cons. Externa"
end type

event clicked;dw_serv_nofactu.dataobject="dw_os_cpo_no_fact"
dw_serv_nofactu.settransobject(sqlca)
dw_serv_nofactu.retrieve(tipdoc,docu)
st_1.text="El Paciente tiene los siguientes servicios de ordenes de servicio sin Facturar, marque los que desea facturar y presione aceptar."
end event

type dw_det_qx from datawindow within w_factu_serv
boolean visible = false
integer x = 1605
integer y = 12
integer width = 1120
integer height = 60
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_paci_qx"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_qx from datawindow within w_factu_serv
boolean visible = false
integer x = 809
integer width = 686
integer height = 56
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_cotiza_qxsubcpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type rb_3 from radiobutton within w_factu_serv
integer x = 827
integer y = 52
integer width = 722
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tratamientos Odontológicos"
end type

event clicked;dw_serv_nofactu.dataobject="dw_factu_serv_tto"
dw_serv_nofactu.settransobject(sqlca)
dw_serv_nofactu.retrieve(tipdoc,docu)
dw_qx.retrieve(tipdoc,docu)
st_1.text="El Paciente tiene los siguientes servicios de tratamientos Odontológicos sin facturar, marque los que desea facturar y presione aceptar."
end event

type rb_2 from radiobutton within w_factu_serv
integer x = 59
integer y = 112
integer width = 603
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Servicios ya prestados"
end type

event clicked;dw_serv_nofactu.dataobject="dw_serv_nofactu"
dw_serv_nofactu.settransobject(sqlca)
dw_serv_nofactu.retrieve(tipdoc,docu)
st_1.text="El Paciente tiene los siguientes servicios ya Recibidos sin Facturar, marque los que desea facturar y presione aceptar."
end event

type rb_1 from radiobutton within w_factu_serv
integer x = 59
integer y = 52
integer width = 512
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Citas no atendidas"
boolean checked = true
end type

event clicked;dw_serv_nofactu.dataobject="dw_citas_afactu"
dw_serv_nofactu.settransobject(sqlca)
dw_serv_nofactu.retrieve(tipdoc,docu)
if dw_serv_nofactu.rowcount()= 0 then lb_hay=false
st_1.text="El Paciente tiene los siguientes servicios asignados en citas, marque los que desea facturar y presione aceptar."
end event

type pb_cancel from picturebutton within w_factu_serv
event mousemove pbm_mousemove
integer x = 1952
integer y = 1116
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;Close(parent)
end event

type pb_aceptar from picturebutton within w_factu_serv
event mousemove pbm_mousemove
integer x = 1787
integer y = 1116
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar y facturar [Alt+A]"
end type

event clicked;long j,cuantos,donde,fila_c,k,contador,nserv,nserv_cita,ncita,sec_cant_cita,reci,item_rec,cons_soat,l_ttato,l_iet
string quepaga,clug_his,clug_rec,nautoriza,ls_uf,ls_cc,clug_soat,clug_trat,ls_clugcita,ls_clugarfact,ls_tipofac,ls_nsiras
string emp,cont,sexo,codta,cproc,estrato,desproc,tipo,ls_oxig,ls_dx,ls_finc,ls_ambp
long edad,cantidad,ntrat,item_trat,nfact,item_fac


cuantos=0
edad=w_principal.dw_1.getitemnumber(1,'dias')
sexo=w_principal.dw_1.getitemstring(1,'sexo')
if isvalid(w_factura) then
	codta=w_factura.dw_emppac.getitemstring(w_factura.dw_emppac.getrow(),'codta')
end if
if isvalid(w_rec_caja) then
	codta=w_rec_caja.dw_emppac.getitemstring(w_rec_caja.dw_emppac.getrow(),'codta')
end if
estrato=w_principal.dw_1.getitemstring(1,'estrato')
for j=1 to dw_serv_nofactu.rowcount()
	if dw_serv_nofactu.getitemstring(j,"esco")='1' then
		if rb_2.checked then //ya prestados
			if not isnull(dw_serv_nofactu.getitemnumber(j,'nrcaj')) and not isnull(dw_serv_nofactu.getitemnumber(j,'vproc')) then
				if dw_serv_nofactu.getitemstring(j,"tiposervicio")="Q" then
					dw_qx.retrieve(dw_serv_nofactu.getitemnumber(j,"nrcaj"),dw_serv_nofactu.getitemstring(j,"clugar_rec"),dw_serv_nofactu.getitemnumber(j,"items"),dw_serv_nofactu.getitemnumber(j,"nitem_rec"))
				end if
				f_lleva_a_factu_reci(j,w_factura.dw_factura,w_factura.dw_factura_cpo,dw_serv_nofactu,dw_qx,'S','')
				cuantos++
				continue
			end if		
			cproc=dw_serv_nofactu.getitemstring(j,"cproced")
			desproc=dw_serv_nofactu.getitemstring(j,"descripcion")
			tipo=dw_serv_nofactu.getitemstring(j,"tipo")
			contador=dw_serv_nofactu.getitemnumber(j,"contador")
			clug_his=dw_serv_nofactu.getitemstring(j,"clugar")
			nserv=dw_serv_nofactu.getitemnumber(j,"nservicio")
			nserv_cita=dw_serv_nofactu.getitemnumber(j,"nserv_turno")
			ncita=dw_serv_nofactu.getitemnumber(j,"ncita")
			ls_clugcita=dw_serv_nofactu.getitemstring(j,"clugar_cita")
			sec_cant_cita=dw_serv_nofactu.getitemnumber(j,"sec_cant")
			reci=dw_serv_nofactu.getitemnumber(j,"nrcaj")
			clug_rec=dw_serv_nofactu.getitemstring(j,"clugar_rec")
			item_rec=dw_serv_nofactu.getitemnumber(j,"items")
			nautoriza=dw_serv_nofactu.getitemstring(j,"nautoriza")
			ls_nsiras=dw_serv_nofactu.getitemstring(j,"siras")
			ls_uf=dw_serv_nofactu.getitemstring(j,"cufuncional")
			ls_cc=dw_serv_nofactu.getitemstring(j,"cccosto")
			cons_soat=dw_serv_nofactu.getitemnumber(j,"consec_soat")
			clug_soat=dw_serv_nofactu.getitemstring(j,"clugar_soat")
			cantidad=dw_serv_nofactu.getitemnumber(j,"cantidad")
			emp=dw_serv_nofactu.getitemstring(j,"cemp")
			cont=dw_serv_nofactu.getitemstring(j,"ccontrato")
			ls_dx=dw_serv_nofactu.getitemstring(j,"dx")
			if isnull(ls_dx) or ls_dx='' then  setnull(ls_dx)
			ls_finc=dw_serv_nofactu.getitemstring(j,"finap")
			if isnull(ls_finc) or ls_finc='' then  setnull(ls_finc)	
			if ls_finc='10' then ls_finc='44'
			ls_ambp='02'	
			
			if f_busca_emp(emp,cont,codta)=-1 then
				if isvalid(w_factura) then
					w_factura.blanquea()
				end if
				if isvalid(w_rec_caja) then
					w_rec_caja.blanquea()
				end if
				close(parent)
				return
			end if
			if isvalid(w_factura) then
				w_factura.lf_cargar_a(cproc,desproc,cantidad,tipo,'1',nautoriza,emp,cont,cons_soat, &
			  	clug_soat,tipdoc,docu,edad,sexo,codta,estrato,ls_uf,ls_cc,'S',1,contador, &
			  	clug_his,nserv,'','','',0,'',ncita,ls_clugcita,nserv_cita,&
			  sec_cant_cita,reci,clug_rec,item_rec,0,'',0,'','!',dw_serv_nofactu.getitemnumber(j,"nro_insumo"),0,0,'',i_tipo_fac,0,'','',0,'0',ls_nsiras,ls_oxig,ls_dx,ls_finc,ls_ambp)
			end if
			if isvalid(w_rec_caja) then
				w_rec_caja.lf_cargar_a(cproc,desproc,cantidad,tipo,'1',nautoriza,emp,cont,cons_soat, &
			  	clug_soat,tipdoc,docu,edad,sexo,codta,estrato,ls_uf,ls_cc,'S',1,contador, &
			  	clug_his,nserv,'','','',0,'',ncita,ls_clugcita,nserv_cita,&
			  sec_cant_cita,reci,clug_rec,item_rec,0,'',0,'','!',dw_serv_nofactu.getitemnumber(j,"nro_insumo"),0,0,'',i_tipo_fac,0,'','',0,'0',ls_nsiras,ls_oxig,ls_dx,ls_finc,ls_ambp)
			end if
			
		elseif rb_1.checked then//de citas
			if not isnull(dw_serv_nofactu.getitemnumber(j,'nrcaj')) and not isnull(dw_serv_nofactu.getitemnumber(j,'vproc')) then
				if dw_serv_nofactu.getitemstring(j,"tiposervicio")="Q" then
					dw_qx.retrieve(dw_serv_nofactu.getitemnumber(j,"nrcaj"),dw_serv_nofactu.getitemstring(j,"clugar_rec"),dw_serv_nofactu.getitemnumber(j,"items"),dw_serv_nofactu.getitemnumber(j,"nitem_rec"))
				end if
				f_lleva_a_factu_reci(j,w_factura.dw_factura,w_factura.dw_factura_cpo,dw_serv_nofactu,dw_qx,'S','')
				cuantos++
				continue
			end if	
			cproc=dw_serv_nofactu.getitemstring(j,"cproced")
			desproc=dw_serv_nofactu.getitemstring(j,"descripcion")
			cantidad=dw_serv_nofactu.getitemnumber(j,"cantidad")
			nserv_cita=dw_serv_nofactu.getitemnumber(j,"nserv_turno")
			ncita=dw_serv_nofactu.getitemnumber(j,"ncita")
			ls_clugcita=dw_serv_nofactu.getitemstring(j,"clugar_cita")
			sec_cant_cita=dw_serv_nofactu.getitemnumber(j,"sec_cant")
			reci=dw_serv_nofactu.getitemnumber(j,"nrcaj")
			clug_rec=dw_serv_nofactu.getitemstring(j,"clugar_rec")
			item_rec=dw_serv_nofactu.getitemnumber(j,"items")
			ls_cc=dw_serv_nofactu.getitemstring(j,"cccosto")
			ls_uf=dw_serv_nofactu.getitemstring(j,"cufuncional")
			emp=dw_serv_nofactu.getitemstring(j,"cemp")
			cont=dw_serv_nofactu.getitemstring(j,"ccontrato")
			ntrat=dw_serv_nofactu.getitemnumber(j,"ntratamiento")
			clug_trat=dw_serv_nofactu.getitemstring(j,"clugar_tto")
			item_trat=dw_serv_nofactu.getitemnumber(j,"item_tto")
			nfact=dw_serv_nofactu.getitemnumber(j,"nfact")
			ls_clugarfact=dw_serv_nofactu.getitemstring(j,"clugar_fac")
			ls_tipofac=dw_serv_nofactu.getitemstring(j,"tipo_fac")
			item_fac=dw_serv_nofactu.getitemnumber(j,"nitem")
			ls_dx=dw_serv_nofactu.getitemstring(j,"dx")
			ls_finc=dw_serv_nofactu.getitemstring(j,"finap")
			if isnull(ls_finc) or ls_finc='' then  setnull(ls_finc)	
			if ls_finc='10' then ls_finc='44'
			ls_ambp='02'
			
			if isvalid(w_factura) then
				nautoriza=w_factura.sle_autoriza.text
			else
				setnull(nautoriza)
			end if
			if isvalid(w_factura) then
				ls_nsiras=w_factura.sle_siras.text
			else
				setnull(ls_nsiras)
			end if
						
			if f_busca_emp(emp,cont,codta)=-1 then
				if isvalid(w_factura) then
					w_factura.blanquea()
				end if
				if isvalid(w_rec_caja) then
					w_rec_caja.blanquea()
				end if
				return
			end if
			
			if isvalid(w_factura) then
				w_factura.lf_cargar_a(cproc,desproc,cantidad,'C','1',nautoriza,emp,cont,0, &
				  '',tipdoc,docu,edad,sexo,codta,estrato,ls_uf,ls_cc,'S',1,0, &
				  '',0,'','','',0,'',ncita,ls_clugcita,nserv_cita,&
				  sec_cant_cita,reci,clug_rec,item_rec,ntrat,clug_trat,item_trat,'','!',0,0,0,'',i_tipo_fac,0,'','',0,'0',ls_nsiras,ls_oxig,ls_dx,ls_finc,ls_ambp)
			end if
			if isvalid(w_rec_caja) then
				w_rec_caja.lf_cargar_a(cproc,desproc,cantidad,'C','1',nautoriza,emp,cont,0, &
				  '',tipdoc,docu,edad,sexo,codta,estrato,ls_uf,ls_cc,'S',1,0, &
				  '',0,'','','',0,'',ncita,ls_clugcita,nserv_cita,&
				  sec_cant_cita,reci,clug_rec,item_rec,ntrat,clug_trat,item_trat,'','!',0,0,0,'',i_tipo_fac,0,'','',0,'0',ls_nsiras,ls_oxig,ls_dx,ls_finc,ls_ambp)
			end if
			
		elseif rb_4.checked then//de ordenes de cons. Externa
		
			if isnull(dw_serv_nofactu.getitemstring(j,"codproced")) then
				cproc=dw_serv_nofactu.getitemstring(j,"codig")		
				tipo='M'
			else
				cproc=dw_serv_nofactu.getitemstring(j,"codproced")		
				tipo='C'
			end if
  			desproc=dw_serv_nofactu.getitemstring(j,"descrip")
		     contador=dw_serv_nofactu.getitemnumber(j,"contador")
			clug_his=dw_serv_nofactu.getitemstring(j,"clugar")
			setnull(nserv)
			setnull(nserv_cita)
			setnull(ncita)
			setnull(ls_clugcita)
			setnull(sec_cant_cita)
			setnull(reci)
			setnull(clug_rec)
			setnull(item_rec)
			setnull(nautoriza)
			setnull(ls_nsiras)
			setnull(ls_uf)
			setnull(ls_cc)
			setnull(cons_soat)
			setnull(clug_soat)
			//cantidad=dw_serv_nofactu.getitemnumber(j,"solicitada")
			cantidad=dw_serv_nofactu.getitemnumber(j,"cant_factu")
			setnull(emp)
			setnull(cont)
			setnull(ls_oxig)
			ls_dx=dw_serv_nofactu.getitemstring(j,"diagnostico")
			if isnull(ls_dx) or ls_dx='' then  setnull(ls_dx)
			ls_finc=dw_serv_nofactu.getitemstring(j,"cod_fina")
			if isnull(ls_finc) or ls_finc='' then  setnull(ls_finc)
			if ls_finc='10' then ls_finc='44'				
			ls_ambp='02'
			if f_busca_emp(emp,cont,codta)=-1 then
				w_factura.blanquea()
				close(parent)
				return
			end if
			w_factura.lf_cargar_a(cproc,desproc,cantidad,tipo,'1',nautoriza,emp,cont,cons_soat, &
			  clug_soat,tipdoc,docu,edad,sexo,codta,estrato,ls_uf,ls_cc,'S',1,contador, &
			  clug_his,nserv,'','','',0,'',ncita,ls_clugcita,nserv_cita,&
			  sec_cant_cita,reci,clug_rec,item_rec,0,'',0,'','!',0,dw_serv_nofactu.getitemnumber(j,'nsolicitud'),dw_serv_nofactu.getitemnumber(j,'item'),'',&
			  i_tipo_fac,0,'','',0,'0',ls_nsiras,ls_oxig,ls_dx,ls_finc,ls_ambp)
			
			
		elseif rb_5.checked then//de ordenes de cons. Hospitaliza
			cproc=dw_serv_nofactu.getitemstring(j,"codig")
			desproc=dw_serv_nofactu.getitemstring(j,"descrip")
			if isnull(dw_serv_nofactu.getitemstring(j,"codproced")) then
				tipo='M'
			else
				tipo='C'
			end if
  			contador=dw_serv_nofactu.getitemnumber(j,"contador")
			clug_his=dw_serv_nofactu.getitemstring(j,"clugar")
			setnull(nserv)
			setnull(nserv_cita)
			setnull(ncita)
			setnull(ls_clugcita)
			setnull(sec_cant_cita)
			setnull(reci)
			setnull(clug_rec)
			setnull(item_rec)
			setnull(nautoriza)
			setnull(ls_nsiras)
			setnull(ls_uf)
			setnull(ls_cc)
			setnull(cons_soat)
			setnull(clug_soat)
			cantidad=dw_serv_nofactu.getitemnumber(j,"solicitada")
			setnull(emp)
			setnull(cont)
			ls_dx=dw_serv_nofactu.getitemstring(j,"diagegreso")
			ls_finc=dw_serv_nofactu.getitemstring(j,"fin_consulta")
			ls_ambp=dw_serv_nofactu.getitemstring(j,"claseproced")
			if f_busca_emp(emp,cont,codta)=-1 then
				w_factura.blanquea()
				close(parent)
				return
			end if

			w_factura.lf_cargar_a(cproc,desproc,cantidad,tipo,'1',nautoriza,emp,cont,cons_soat, &
			  clug_soat,tipdoc,docu,edad,sexo,codta,estrato,ls_uf,ls_cc,'S',1,contador, &
			  clug_his,nserv,'','','',0,'',ncita,ls_clugcita,nserv_cita,&
			  sec_cant_cita,reci,clug_rec,item_rec,0,'',0,'','!',0,dw_serv_nofactu.getitemnumber(j,'nsolicitud'),dw_serv_nofactu.getitemnumber(j,'item'),'',&
			  i_tipo_fac,0,'','',0,'0',ls_nsiras,ls_oxig,ls_dx,ls_finc,ls_ambp)
		else //de odontología
			uo_datastore dw_contdet
			dw_contdet=create uo_datastore
			dw_contdet.dataobject='dw_cont_deta'
			dw_contdet.settransobject(sqlca)
			if not isnull(dw_serv_nofactu.getitemnumber(j,'vproced')) then //lo cotizaron
				donde=w_factura.dw_factura.insertrow(0)
				w_factura.dw_factura.scrolltorow(donde)
				w_factura.dw_factura.setitem(donde,"ntrata", dw_serv_nofactu.getitemnumber(j,"ntratamiento"))
				w_factura.dw_factura.setitem(donde,"tipodoc",tipdoc)
				w_factura.dw_factura.setitem(donde,"docu",docu)
				if dw_serv_nofactu.getitemstring(j,'codproced')='Abono' then
					w_factura.dw_factura.setitem(donde,"clug_trat", dw_serv_nofactu.getitemstring(j,"clugar_his"))//va a quedar el clugar del abono
					w_factura.dw_factura.setitem(donde,"item_trat", dw_serv_nofactu.getitemnumber(j,"contador"))//va a quedar el nro del abono
					w_factura.dw_factura.setitem(donde,'cproc','ABONOS')
					w_factura.dw_factura.setitem(donde,'descripcion','Abonos realizados anteriormente')
					w_factura.dw_factura.setitem(donde,'vt_proc', -dw_serv_nofactu.getitemnumber(j,'vproced'))
					w_factura.dw_factura.setitem(donde,'vt_emp',0)
					w_factura.dw_factura.setitem(donde,'vt_pac',-dw_serv_nofactu.getitemnumber(j,'vproced'))
					w_factura.dw_factura.setitem(donde,'rips','10')
					w_factura.dw_factura.setitem(donde,'numero',donde)
					w_factura.dw_factura.setitem(donde,'vp_unit',-dw_serv_nofactu.getitemnumber(j,'vproced'))
					w_factura.dw_factura.setitem(donde,'que_paga','particular')
					w_factura.dw_factura.setitem(donde,'plan','0')
					w_factura.dw_factura.setitem(donde,'percent_pac',100)
					w_factura.dw_factura.setitem(donde,'tipo_proc','G')
					w_factura.dw_factura.setitem(donde,'cod_manual','01')
				else
					w_factura.dw_factura.setitem(donde,"contador",dw_serv_nofactu.getitemnumber(j,"contador"))
					w_factura.dw_factura.setitem(donde,"clugar_his",dw_serv_nofactu.getitemstring(j,"clugar_his"))
					w_factura.dw_factura.setitem(donde,"clug_trat", dw_serv_nofactu.getitemstring(j,"clugar"))
					w_factura.dw_factura.setitem(donde,"item_trat", dw_serv_nofactu.getitemnumber(j,"item"))
					w_factura.dw_factura.setitem(donde,"tipo_proc",dw_serv_nofactu.getitemstring(j,'tipoproc'))
					if dw_serv_nofactu.getitemstring(j,'tipoproc')='Q' then
						dw_qx.setfilter("ncotiza="+string(dw_serv_nofactu.getitemnumber(j,"ncotiza"))+" and clugar='"+dw_serv_nofactu.getitemstring(j,"clugar")+"' and nitem="+string(dw_serv_nofactu.getitemnumber(j,"nitem")))
						dw_qx.filter()
						w_factura.dw_factura.setitem(donde,"grupo",dw_serv_nofactu.getitemstring(j,"grupo"))
						w_factura.dw_factura.setitem(donde,"puntos",dw_serv_nofactu.getitemnumber(j,"puntos"))
						for k=1 to dw_qx.rowcount()
							w_factura.dw_factura_cpo.insertrow(1)
							w_factura.dw_factura_cpo.setitem(1,"num_padre",donde)
							w_factura.dw_factura_cpo.setitem(1,"numero",dw_qx.getitemnumber(k,"ndeta"))
							w_factura.dw_factura_cpo.setitem(1,"tipo_proc",'2')
							w_factura.dw_factura_cpo.setitem(1,"cproced",dw_qx.getitemstring(k,"cproced"))
							w_factura.dw_factura_cpo.setitem(1,"valor",dw_qx.getitemnumber(k,"vproced"))
							w_factura.dw_factura_cpo.setitem(1,"cantidad",1)
							w_factura.dw_factura_cpo.setitem(1,"cod_manual",dw_serv_nofactu.getitemstring(j,"codmanual"))
							w_factura.dw_factura_cpo.setitem(1,"nombre",dw_qx.getitemstring(k,"descripcion"))
							w_factura.dw_factura_cpo.setitem(1,"mieiv",100)
							w_factura.dw_factura_cpo.setitem(1,"miedv",100)
							w_factura.dw_factura_cpo.setitem(1,"mdeiv",100)
							w_factura.dw_factura_cpo.setitem(1,"mdedv",100)
						next
					end if
					w_factura.dw_factura.setitem(donde,"cproc",dw_serv_nofactu.getitemstring(j,"cproced"))
					w_factura.dw_factura.setitem(donde,"proccups",dw_serv_nofactu.getitemstring(j,"codproced"))
					w_factura.dw_factura.setitem(donde,"descripcion",dw_serv_nofactu.getitemstring(j,"descripcion"))
					
					w_factura.dw_factura.setitem(donde,"vp_unit",dw_serv_nofactu.getitemnumber(j,"vproced"))
					w_factura.dw_factura.setitem(donde,"numero",donde)
					w_factura.dw_factura.setitem(donde,"plan",dw_serv_nofactu.getitemstring(j,"cplan"))
					w_factura.dw_factura.setitem(donde,"rips",dw_serv_nofactu.getitemstring(j,"rip"))
					dw_contdet.retrieve(dw_serv_nofactu.getitemstring(j,"cemp"),dw_serv_nofactu.getitemstring(j,"ccontrato"),'1')
					fila_c=dw_contdet.find("cplan='"+dw_serv_nofactu.getitemstring(j,"cplan")+"'",1,dw_contdet.rowcount())
					if fila_c=0 then fila_c=1
					w_factura.dw_factura.setitem(donde,"por_manual",dw_contdet.getitemnumber(fila_c,"pormanual")/100)
					if dw_contdet.getitemstring(fila_c,"copago")='1' then quepaga="Copago"
					if dw_contdet.getitemstring(fila_c,"cuotamode")='1' then quepaga="Cuota Mode."
					if dw_contdet.getitemstring(fila_c,"cuotarecu")='1' then quepaga="Cuota Recu."
					if dw_contdet.getitemstring(fila_c,"pagopart")='1' then quepaga="particular"
					w_factura.dw_factura.setitem(donde,"que_paga",quepaga)
	
					w_factura.dw_factura.setitem(donde,"cod_concep",dw_serv_nofactu.getitemstring(j,"codconcepto"))
					w_factura.dw_factura.setitem(donde,"cod_manual",dw_serv_nofactu.getitemstring(j,"codmanual"))
					w_factura.dw_factura.setitem(donde,"cemp",dw_serv_nofactu.getitemstring(j,"cemp"))
					w_factura.dw_factura.setitem(donde,"ccontrato",dw_serv_nofactu.getitemstring(j,"ccontrato"))
					w_factura.dw_factura.setitem(donde,"des_cont",dw_serv_nofactu.getitemstring(j,"descontrato"))
			
					w_factura.dw_factura.setitem(donde,"nserv",dw_serv_nofactu.getitemnumber(j,"nservicio"))
					w_factura.dw_factura.setitem(donde,"cantidad",1)
					w_factura.dw_factura.setitem(donde,"autoriza",dw_serv_nofactu.getitemstring(j,"autorizacion"))
					w_factura.dw_factura.setitem(donde,"siras",dw_serv_nofactu.getitemstring(j,"siras"))	
					w_factura.dw_factura.setitem(donde,"vt_proc",dw_serv_nofactu.getitemnumber(j,"vproced"))
					w_factura.dw_factura.setitem(donde,"vt_emp", dw_serv_nofactu.getitemnumber(j,"vemp") )
					w_factura.dw_factura.setitem(donde,"vt_pac", dw_serv_nofactu.getitemnumber(j,"vpart") )
					if dw_serv_nofactu.getitemnumber(j,"vpart")=0 then
						w_factura.dw_factura.setitem(donde,"percent_pac",0)
					else
						w_factura.dw_factura.setitem(donde,"percent_pac",100 * dw_serv_nofactu.getitemnumber(j,"vproced")/dw_serv_nofactu.getitemnumber(j,"vpart") )
					end if
				end if
			else //no lo cotizaron y no puede tener abonos(para poder hacer abonos es obligatorio tener cotización)
				cproc=dw_serv_nofactu.getitemstring(j,"codproced")
				desproc=dw_serv_nofactu.getitemstring(j,"descripcion")
				cantidad=dw_serv_nofactu.getitemnumber(j,"cantidad")
				if isnull(cantidad) then cantidad=1
				ntrat=dw_serv_nofactu.getitemnumber(j,"ntratamiento")
				clug_trat=dw_serv_nofactu.getitemstring(j,"clugar")
				item_trat=dw_serv_nofactu.getitemnumber(j,"item")
				contador=dw_serv_nofactu.getitemnumber(j,"contador")
				clug_his=dw_serv_nofactu.getitemstring(j,"clugar_his")
				nserv=dw_serv_nofactu.getitemnumber(j,"nservicio")
				emp=dw_serv_nofactu.getitemstring(j,"cemp")
				cont=dw_serv_nofactu.getitemstring(j,"ccontrato")
				i_tipo_fac=dw_serv_nofactu.getitemstring(j,"tipo")
				
				if f_busca_emp(emp,cont,codta)=-1 then
					w_factura.blanquea()
					return
				end if
				//37 parametros ( p_codigo,  p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
				//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta,  p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
				//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita,  p_nserv_cita, 
				//  p_sec_cant_cita,  p_fecha_cita,  p_hora_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat,p_clug_trat, p_item_trat)
				w_factura.lf_cargar_a(cproc,desproc,cantidad,'C','1','',emp,cont,0, &
				  '',tipdoc,docu,edad,sexo,codta,estrato,ls_uf,ls_cc,'S',1,contador, &
				  clug_his,nserv,'','','',0,'',0,'',0,&
				  0,0,'',0,ntrat,clug_trat,item_trat,'','!',0,0,0,'',i_tipo_fac,0,'','',0,'0','',ls_oxig,ls_dx,ls_finc,ls_ambp)	
			end if
		end if
		cuantos ++
	end if
next
if isvalid(w_factura) then
	w_factura.resumen('S')
	if w_factura.dw_factura.rowcount()>0 then
		w_factura.pb_paci.enabled=false
		w_factura.pb_emp.enabled=false
	end if
end if
if isvalid(w_rec_caja) then
	w_rec_caja.resumen('S')
	if w_rec_caja.dw_factura.rowcount()>0 then
		w_rec_caja.pb_paci.enabled=false
		w_rec_caja.pb_emp.enabled=false
	end if
end if


close(parent)
end event

type dw_serv_nofactu from datawindow within w_factu_serv
integer x = 37
integer y = 316
integer width = 3648
integer height = 788
integer taborder = 10
string title = "none"
string dataobject = "dw_factu_serv_tto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;int j
for j=1 to rowcount()
	if dwo.text='Facturar' or dwo.text='Cobrar' or dwo.text='Autoriza' then
		setrow(j)
		setitem(j,'esco','1')
	else
		setitem(j,'esco','0')
	end if
next
choose case dwo.text 
	case 'Facturar' 
		modify(string(dwo.name)+'.text="No Factur."')  
	case 'No Cobra' 
		modify(string(dwo.name)+'.text="Cobrar"') 
	case 'Cobrar' 
		modify(string(dwo.name)+'.text="No Cobra"') 
	case 'No Factur.'
	    modify(string(dwo.name)+'.text="Facturar"')
	case 'Autoriza'
	    modify(string(dwo.name)+'.text="No Auto"')
	case 'No Auto'
	    modify(string(dwo.name)+'.text="Autoriza"')
end choose

end event

event itemchanged;long ldb_con,ldb_solic,ldb_entreg,ldb_soli,ldb_item,ldb_control,ldb_solci
string ls_lug

if dw_serv_nofactu.dataobject="dw_os_cpo_no_fact" and getcolumnname()='cant_factu' then 
	
	ldb_con=dw_serv_nofactu.getitemnumber(getrow(),'contador')
	ls_lug=dw_serv_nofactu.getitemstring(getrow(),'clugar')
	ldb_solic=dw_serv_nofactu.getitemnumber(getrow(),'nsolicitud')
	ldb_item=dw_serv_nofactu.getitemnumber(getrow(),'item')
	
	SELECT OSCuerpo.solicitada - OSCuerpo.entregada,OSCuerpo.solicitada into :ldb_control,:ldb_solci
	FROM OSCuerpo
	WHERE (((OSCuerpo.Contador)=:ldb_con) AND ((OSCuerpo.clugar)=:ls_lug) AND ((OSCuerpo.NSolicitud)=:ldb_solic) AND ((OSCuerpo.Item)=:ldb_item));
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo Oscuerpo para verificar control linea 13",sqlca.sqlerrtext)
		return 1
	end if
	if ldb_control <= 0 then
		messagebox("Leyendo Control",'Error ya entregado Linea 17')
		dw_serv_nofactu.retrieve(tipdoc,docu)		
		return -1
	end if
	if double(data)>ldb_control then 
		messagebox("Atención",'Cantidad mayor a lo solicitado')
		dw_serv_nofactu.retrieve(tipdoc,docu)		
		return -1
	end if
end if
end event

type st_1 from statictext within w_factu_serv
integer x = 32
integer y = 188
integer width = 3648
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "El Paciente tiene los siguientes servicios ya Recibidos sin Facturar, marque los que desea facturar y presione aceptar."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_factu_serv
integer x = 41
integer width = 3154
integer height = 180
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Traer servicios de:"
end type

