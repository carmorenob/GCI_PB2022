$PBExportHeader$w_factu_serv_hosp.srw
forward
global type w_factu_serv_hosp from window
end type
type pb_2 from picturebutton within w_factu_serv_hosp
end type
type pb_cambia from picturebutton within w_factu_serv_hosp
end type
type pb_1 from picturebutton within w_factu_serv_hosp
end type
type pb_dw from picturebutton within w_factu_serv_hosp
end type
type pb_up from picturebutton within w_factu_serv_hosp
end type
type pb_top from picturebutton within w_factu_serv_hosp
end type
type st_des from statictext within w_factu_serv_hosp
end type
type st_cod from statictext within w_factu_serv_hosp
end type
type st_cuantos from statictext within w_factu_serv_hosp
end type
type st_de from statictext within w_factu_serv_hosp
end type
type st_lleva from statictext within w_factu_serv_hosp
end type
type st_que from statictext within w_factu_serv_hosp
end type
type pb_soat from picturebutton within w_factu_serv_hosp
end type
type dw_1 from datawindow within w_factu_serv_hosp
end type
type pb_cancel from picturebutton within w_factu_serv_hosp
end type
type pb_aceptar from picturebutton within w_factu_serv_hosp
end type
type dw_serv_nofactu from datawindow within w_factu_serv_hosp
end type
type st_1 from statictext within w_factu_serv_hosp
end type
type dw_cobra_ from datawindow within w_factu_serv_hosp
end type
type gb_2 from groupbox within w_factu_serv_hosp
end type
type dw_ingres from datawindow within w_factu_serv_hosp
end type
type gb_3 from groupbox within w_factu_serv_hosp
end type
end forward

global type w_factu_serv_hosp from window
integer width = 4050
integer height = 2604
boolean titlebar = true
string title = "Facturar Servicios de Admisiones"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "RunReport5!"
boolean clientedge = true
boolean center = true
pb_2 pb_2
pb_cambia pb_cambia
pb_1 pb_1
pb_dw pb_dw
pb_up pb_up
pb_top pb_top
st_des st_des
st_cod st_cod
st_cuantos st_cuantos
st_de st_de
st_lleva st_lleva
st_que st_que
pb_soat pb_soat
dw_1 dw_1
pb_cancel pb_cancel
pb_aceptar pb_aceptar
dw_serv_nofactu dw_serv_nofactu
st_1 st_1
dw_cobra_ dw_cobra_
gb_2 gb_2
dw_ingres dw_ingres
gb_3 gb_3
end type
global w_factu_serv_hosp w_factu_serv_hosp

type variables
string parto
date sale
time hsale
boolean cierra, l_resp
end variables

event open;cierra=false
parto='0'
dw_ingres.retrieve(tipdoc,docu)
if dw_ingres.rowcount()=0 then
	messagebox("Atención","Este paciente no tiene ninguna Admisión pendiente de facturar, revise que la admisión tenga orden de salida")
	w_factura.dw_tip_ingres.setitem(1,1,"1")
	w_factura.dw_tip_ingres.accepttext()
	w_factura.i_tipoingreso="1"
	close(this)
	return
end if
long j
for j=1 to dw_ingres.rowcount()
	if dw_ingres.getitemstring(j,'codtingre')=w_factura.i_tipoingreso then
		dw_ingres.scrolltorow(j)
		dw_ingres.setitem(j,'esco',1)
		dw_ingres.setcolumn('esco')
		dw_ingres.settext('1')
		dw_ingres.event itemchanged(j,dw_ingres.object.esco,'1')
	end if
next
end event

on w_factu_serv_hosp.create
this.pb_2=create pb_2
this.pb_cambia=create pb_cambia
this.pb_1=create pb_1
this.pb_dw=create pb_dw
this.pb_up=create pb_up
this.pb_top=create pb_top
this.st_des=create st_des
this.st_cod=create st_cod
this.st_cuantos=create st_cuantos
this.st_de=create st_de
this.st_lleva=create st_lleva
this.st_que=create st_que
this.pb_soat=create pb_soat
this.dw_1=create dw_1
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.dw_serv_nofactu=create dw_serv_nofactu
this.st_1=create st_1
this.dw_cobra_=create dw_cobra_
this.gb_2=create gb_2
this.dw_ingres=create dw_ingres
this.gb_3=create gb_3
this.Control[]={this.pb_2,&
this.pb_cambia,&
this.pb_1,&
this.pb_dw,&
this.pb_up,&
this.pb_top,&
this.st_des,&
this.st_cod,&
this.st_cuantos,&
this.st_de,&
this.st_lleva,&
this.st_que,&
this.pb_soat,&
this.dw_1,&
this.pb_cancel,&
this.pb_aceptar,&
this.dw_serv_nofactu,&
this.st_1,&
this.dw_cobra_,&
this.gb_2,&
this.dw_ingres,&
this.gb_3}
end on

on w_factu_serv_hosp.destroy
destroy(this.pb_2)
destroy(this.pb_cambia)
destroy(this.pb_1)
destroy(this.pb_dw)
destroy(this.pb_up)
destroy(this.pb_top)
destroy(this.st_des)
destroy(this.st_cod)
destroy(this.st_cuantos)
destroy(this.st_de)
destroy(this.st_lleva)
destroy(this.st_que)
destroy(this.pb_soat)
destroy(this.dw_1)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.dw_serv_nofactu)
destroy(this.st_1)
destroy(this.dw_cobra_)
destroy(this.gb_2)
destroy(this.dw_ingres)
destroy(this.gb_3)
end on

event closequery;if not cierra then
	w_factura.dw_tip_ingres.setitem(1,1,"1")
	w_factura.dw_tip_ingres.accepttext()
	w_factura.i_tipoingreso="1"
end if

end event

type pb_2 from picturebutton within w_factu_serv_hosp
integer x = 23
integer y = 1408
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
string picturename = "agrega.gif"
string disabledname = "agrega.gif"
alignment htextalign = left!
string powertiptext = "Facturar servicios de Citas del paciente "
end type

event clicked;st_cirugia st_pasa
st_pasa.dw_factura=dw_serv_nofactu
st_pasa.tipo_cir=dw_ingres.getitemstring(dw_ingres.getrow(),'codtingre')
st_pasa.prof_cir=dw_ingres.getitemstring(dw_ingres.getrow(),'cemp')
st_pasa.espe_cir=dw_ingres.getitemstring(dw_ingres.getrow(),'ccontrato')
openwithparm(w_factu_serv_citas,st_pasa)
end event

type pb_cambia from picturebutton within w_factu_serv_hosp
event mousemove pbm_mousemove
integer x = 23
integer y = 1248
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "          &c"
boolean originalsize = true
string picturename = "cambia_res.gif"
string disabledname = "d_cambia_res.gif"
alignment htextalign = left!
string powertiptext = "Cambiar Responsable"
end type

event clicked;int l_i
st_cambia_resp st_cr
st_cr.dw_factura_cpo=dw_serv_nofactu
l_resp=true
openwithparm(w_cambia_respon_nuevo,st_cr)


end event

type pb_1 from picturebutton within w_factu_serv_hosp
integer x = 23
integer y = 1092
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "abajo_t.gif"
alignment htextalign = left!
end type

event clicked;if dw_serv_nofactu.rowcount()=0 or dw_serv_nofactu.getrow()=dw_serv_nofactu.rowcount() then return
long donde
donde=dw_serv_nofactu.getrow()
dw_serv_nofactu.setredraw(false)
dw_serv_nofactu.rowscopy(donde   ,donde ,primary!,dw_serv_nofactu,dw_serv_nofactu.rowcount() +2  ,primary!)
dw_serv_nofactu.deleterow(donde)
dw_serv_nofactu.scrolltorow(dw_serv_nofactu.rowcount()  +2)
dw_serv_nofactu.setredraw(true)
end event

type pb_dw from picturebutton within w_factu_serv_hosp
integer x = 23
integer y = 956
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
string picturename = "abajo.gif"
alignment htextalign = left!
end type

event clicked;if dw_serv_nofactu.rowcount()=0 or dw_serv_nofactu.getrow()=dw_serv_nofactu.rowcount() then return
long donde
donde=dw_serv_nofactu.getrow()
dw_serv_nofactu.setredraw(false)
dw_serv_nofactu.rowscopy(donde +1  ,donde +1,primary!,dw_serv_nofactu,donde  ,primary!)
dw_serv_nofactu.deleterow(donde +2)
dw_serv_nofactu.scrolltorow(donde +1)
dw_serv_nofactu.setredraw(true)
end event

type pb_up from picturebutton within w_factu_serv_hosp
integer x = 23
integer y = 824
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
string picturename = "arriba.gif"
alignment htextalign = left!
end type

event clicked;if dw_serv_nofactu.rowcount()=0 or dw_serv_nofactu.getrow()=1 then return
long donde
donde=dw_serv_nofactu.getrow()
dw_serv_nofactu.setredraw(false)
dw_serv_nofactu.rowscopy(donde  ,donde ,primary!,dw_serv_nofactu,donde -1,primary!)
dw_serv_nofactu.deleterow(donde+1)
dw_serv_nofactu.scrolltorow(donde -1)
dw_serv_nofactu.setredraw(true)
end event

type pb_top from picturebutton within w_factu_serv_hosp
integer x = 23
integer y = 692
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
string picturename = "arriba_t.gif"
alignment htextalign = left!
end type

event clicked;if dw_serv_nofactu.rowcount()=0 or dw_serv_nofactu.getrow()=1 then return
long donde
donde=dw_serv_nofactu.getrow()
dw_serv_nofactu.setredraw(false)
dw_serv_nofactu.rowscopy(donde  ,donde ,primary!,dw_serv_nofactu,1,primary!)
dw_serv_nofactu.deleterow(donde+1)
dw_serv_nofactu.scrolltorow(1)
dw_serv_nofactu.setredraw(true)
end event

type st_des from statictext within w_factu_serv_hosp
boolean visible = false
integer x = 2313
integer y = 2388
integer width = 1673
integer height = 68
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

type st_cod from statictext within w_factu_serv_hosp
boolean visible = false
integer x = 937
integer y = 2388
integer width = 430
integer height = 68
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

type st_cuantos from statictext within w_factu_serv_hosp
boolean visible = false
integer x = 731
integer y = 2388
integer width = 197
integer height = 68
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

type st_de from statictext within w_factu_serv_hosp
boolean visible = false
integer x = 640
integer y = 2388
integer width = 82
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "de"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_lleva from statictext within w_factu_serv_hosp
boolean visible = false
integer x = 434
integer y = 2388
integer width = 192
integer height = 68
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

type st_que from statictext within w_factu_serv_hosp
boolean visible = false
integer x = 32
integer y = 2388
integer width = 393
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimiento"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_soat from picturebutton within w_factu_serv_hosp
event mousemove pbm_mousemove
boolean visible = false
integer x = 4009
integer y = 148
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "          &r"
boolean originalsize = true
string picturename = "buscar2.GIF"
string disabledname = "d_buscar2.GIF"
alignment htextalign = left!
string powertiptext = "Revisar acumulados de la póliza [Alt+R]"
end type

event clicked;st_soat st
st.nsoat=dw_ingres.getitemnumber(dw_ingres.getrow(),"consec_soat")
st.clug_soat=dw_ingres.getitemstring(dw_ingres.getrow(),"clugar_soat")
st.newemp=dw_ingres.getitemstring(dw_ingres.getrow(),"cemp")
st.newcont=dw_ingres.getitemstring(dw_ingres.getrow(),"ccontrato")
st.contador=dw_ingres.getitemnumber(dw_ingres.getrow(),"contador")
st.clug_his=dw_ingres.getitemstring(dw_ingres.getrow(),"clugar_his")
openwithparm(w_soat,st)
end event

type dw_1 from datawindow within w_factu_serv_hosp
string tag = "pa cobrar los días que estuvo"
boolean visible = false
integer x = 4018
integer y = 308
integer width = 123
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "dw_estancia"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_cancel from picturebutton within w_factu_serv_hosp
event mousemove pbm_mousemove
integer x = 2107
integer y = 2360
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

type pb_aceptar from picturebutton within w_factu_serv_hosp
event mousemove pbm_mousemove
integer x = 1961
integer y = 2360
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 700
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

event clicked;string emp,cont,cod,tipo,tingres,autoriza,clug_soat,tdo,doc,sexo,codta,estrato,uf,cc
string clug_hadm,soat,clug_his,via,tipo_cir,prof_cir,espe_cir,desproc,l_codarticulo,tipo_fac,fac_sincer
string ls_coxig
long edad,cons_soat,j,cuantos=0,canti,nh,nrn,donde,fila,contador,nserv,facturar,acto
long va,hasta,k
hasta= dw_serv_nofactu.rowcount()
edad=w_principal.dw_1.getitemnumber(1,'dias')
sexo=w_principal.dw_1.getitemstring(1,'sexo')
estrato=w_principal.dw_1.getitemstring(1,'estrato')
boolean b_facturar=true

for j=1 to dw_ingres.rowcount()
	if dw_ingres.getitemnumber(j,'esco')<>1 then continue
	if dw_ingres.getitemstring(j,'factu_sinsal')='0' and dw_ingres.getitemstring(j,"estado")="1" then b_facturar=false
next
if b_facturar then
	for j=1 to dw_ingres.rowcount()
		if dw_ingres.getitemnumber(j,'esco')<>1 then continue
		if isnull(dw_ingres.getitemstring(j,'diagingre')) or dw_ingres.getitemstring(j,'diagingre')='' then 
			messagebox('Atención','No ha digitado el(los) diagnóstico(s) de ingreso')
			return
		end if
	next
	fac_sincer='1'
end if

if dw_serv_nofactu.rowcount()>0 then//revisar si tienen partos (debería ser solo uno peeero.....)
	donde=1
	do while donde<=dw_serv_nofactu.rowcount()
		donde=dw_serv_nofactu.find('parto="1"',donde,dw_serv_nofactu.rowcount())
		if donde<>0 then
			nh=dw_ingres.getitemnumber(dw_serv_nofactu.getitemnumber(donde,'fila'),'nh')
			clug_hadm=dw_ingres.getitemstring(dw_serv_nofactu.getitemnumber(donde,'fila'),'clugar')
			select count(nrn) into :nrn from hosprn where nh=:nh and clugar=:clug_hadm;
			if sqlca.sqlcode=-1 then
				messagebox("Error leyendo Hosprn",sqlca.sqlerrtext)
				return
			end if
			if nrn=0 then 
				messagebox("Atención",'La admisión '+string(nh)+ ' tiene un procedimiento de Parto, pero no han registrado el RIP de Recién Nacido, capture estos datos para continuar')
				return
			end if
			donde ++
		else
			exit
		end if
	loop
end if// fin revisar si tienen partos (debería ser solo uno peeero.....)
st_que.visible=true
st_lleva.visible=true
st_de.visible=true
st_cuantos.visible=true
st_cod.visible=true
st_des.visible=true
st_cuantos.text=string(dw_serv_nofactu.rowcount())
for j=1 to dw_serv_nofactu.rowcount()
	if dw_serv_nofactu.getitemnumber(j,'facturar')<>1 then continue
	va=j
	st_lleva.text=string(va)
	cod=dw_serv_nofactu.getitemstring(j,"cproced")
	desproc=dw_serv_nofactu.getitemstring(j,"descripcion")
	st_cod.text=cod
	st_des.text=desproc
	contador=dw_serv_nofactu.getitemnumber(j,"contador")
	canti=dw_serv_nofactu.getitemnumber(j,"cantidad")
	clug_his=dw_serv_nofactu.getitemstring(j,"clugar")
	nserv=dw_serv_nofactu.getitemnumber(j,"nservicio")
	autoriza=dw_serv_nofactu.getitemstring(j,"nautoriza")
	facturar=dw_serv_nofactu.getitemnumber(j,"facturar")
	l_codarticulo=dw_serv_nofactu.getitemstring(j,"codarticulo")
	if dw_serv_nofactu.getitemstring(j,'cod_oxig')='' or isnull(dw_serv_nofactu.getitemstring(j,'cod_oxig')) then 
		setnull(ls_coxig)
	else
		ls_coxig=dw_serv_nofactu.getitemstring(j,'cod_oxig')
	end if
	if ls_coxig='' then setnull(ls_coxig)
	fila=dw_serv_nofactu.getitemnumber(j,'fila')
	if dw_ingres.getitemnumber(fila,'al_segun')=1 then
		emp=dw_ingres.getitemstring(fila,'segrespon')
		cont=dw_ingres.getitemstring(fila,'contsegrespon')
		tipo_fac=dw_ingres.getitemstring(fila,'tipo_fac_seg')	
		setnull(cons_soat)
		setnull(clug_soat)
		codta=w_factura.dw_emppac.getitemstring(w_factura.dw_emppac.getrow(),'codta')//un hijueputa machete
	else
		emp=dw_ingres.getitemstring(fila,'cemp')
		cont=dw_ingres.getitemstring(fila,'ccontrato')
		tipo_fac=dw_ingres.getitemstring(fila,'tipo_fac')		
		if emp<>dw_serv_nofactu.getitemstring(j,"cemp") and l_resp=true then
			emp=dw_serv_nofactu.getitemstring(j,"cemp")
			cont=dw_serv_nofactu.getitemstring(j,"ccontrato")
		end if	
		donde=w_factura.dw_emppac.find('codemp="'+emp+'" and codcontrato="'+cont+'" ',1,w_factura.dw_emppac.rowcount())
		if donde=0 then
			messagebox('Atención','El Paciente ya no tiene la afiliación de la empresa con la que se hizo la admisión')
			w_factura.dw_factura.reset()
			w_factura.dw_resumen.reset()
			return
		end if
		codta=w_factura.dw_emppac.getitemstring(donde,'codta')
		if dw_ingres.getitemstring(fila,'soat')='1' then
			cons_soat=dw_ingres.getitemnumber(fila,"consec_soat")
			clug_soat=dw_ingres.getitemstring(fila,"clugar_soat")
		else
			setnull(cons_soat)
			setnull(clug_soat)
		end if
	end if
	tingres=dw_ingres.getitemstring(fila,'codtingre')
	uf=dw_serv_nofactu.getitemstring(j,"cufuncional")
	cc=dw_serv_nofactu.getitemstring(j,"cccosto")
	tipo=dw_serv_nofactu.getitemstring(j,"tipo")
	if tipo='C' or isnull(tipo) then // 'C' es de cups (procedimiento)
		if not isnull(dw_serv_nofactu.getitemnumber(j,"acto")) then
			acto=dw_serv_nofactu.getitemnumber(j,"acto")
			via=dw_serv_nofactu.getitemstring(j,"cvia")
			if dw_serv_nofactu.getitemstring(j,"incruento")='1' then
				tipo_cir='i'
			else
				tipo_cir='n'
			end if
			if dw_serv_nofactu.getitemstring(j,"bilateral")='1' then 
				tipo_cir+='b'
			end if
			prof_cir=dw_serv_nofactu.getitemstring(j,"especialista")
			espe_cir=dw_serv_nofactu.getitemstring(j,"cesp")
		else
			acto=0
			via=''
			tipo_cir=''
			prof_cir=''
			espe_cir=''
		end if
		//36 parametros ( p_codigo,  p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
		//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta, p_estrato, p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
		//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
		//  p_sec_cant_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat, p_clug_trat, p_item_trat)
		if w_factura.lf_cargar_a(cod,desproc,canti,'C',tingres,autoriza,emp,cont,cons_soat, &
		  clug_soat,tipdoc,docu,edad,sexo,codta,estrato,uf,cc,'H',facturar,contador, &
		  clug_his,nserv,prof_cir,espe_cir,via,acto,tipo_cir,dw_serv_nofactu.getitemnumber(j,"ncita"),dw_serv_nofactu.getitemstring(j,"clugar_cita"),dw_serv_nofactu.getitemnumber(j,"nservicio"),&
		  dw_serv_nofactu.getitemnumber(j,"sec_cant"),0,'',0,0,'',0,dw_serv_nofactu.getitemstring(j,"anestesiologo"),dw_serv_nofactu.getitemstring(j,"auxiliarqx"),0,0,0,l_codarticulo,tipo_fac,0,'','',0,fac_sincer,'',ls_coxig,'','','')=-1 then
			w_factura.blanquea()
			close(parent)
			return
		end if
	else //es 'M' de medicamentos
		if w_factura.lf_cargar_a(cod,desproc,canti,'M',tingres,autoriza,emp,cont,cons_soat, &
		  clug_soat,tipdoc,docu,edad,sexo,codta,estrato,uf,cc,'H',facturar,contador, &
		  clug_his,nserv,'','','',0,'',0,'',0,&
		  0,0,'',0,0,'',0,'','!',dw_serv_nofactu.getitemnumber(j,"nro_insumo"),0,0,l_codarticulo,tipo_fac,0,'','',0,fac_sincer,'',ls_coxig,'','','')=-1 then
			w_factura.blanquea()
			close(parent)
			return
		end if
	end if
	cuantos ++
next
dec abono
w_factura.dw_admis.reset()
uo_datastore dw_abonos
dw_abonos=create uo_datastore
dw_abonos.dataobject='dw_abonos_admis'
dw_abonos.settransobject(sqlca)
dw_abonos.retrieve(tipdoc,docu)
for j=1 to dw_ingres.rowcount()
	if dw_ingres.getitemnumber(j,'esco')=1 then
		nh=dw_ingres.getitemnumber(j,'nh')
		clug_hadm=dw_ingres.getitemstring(j,'clugar')
		w_factura.dw_admis.insertrow(1)
		w_factura.dw_admis.setitem(1,'nh',nh)
		w_factura.dw_admis.setitem(1,'clugar_ingre',clug_hadm)
		w_factura.dw_admis.setitem(1,'codtingre',dw_ingres.getitemstring(j,'codtingre'))
		w_factura.dw_admis.setitem(1,'estado',dw_ingres.getitemstring(j,"estado"))		
		if dw_ingres.getitemstring(j,'factu_sinsal')='0' and dw_ingres.getitemstring(j,"estado")="1" then w_factura.pb_facturar.enabled=false
	end if
next
if dw_abonos.rowcount()>0 then
	w_factura.resumen('H')
	for k=1 to dw_abonos.rowcount()
		if w_factura.dw_resumen.getitemnumber(1,'compute_5')<=0 then exit
		donde=w_factura.dw_factura.insertrow(0)
		w_factura.dw_factura.setitem(donde,'cproc','ABONOS')
		w_factura.dw_factura.setitem(donde,'descripcion','Abonos realizados anteriormente')
		if w_factura.dw_resumen.getitemnumber(1,'compute_5')>dw_abonos.getitemnumber(k,'queda') then
			w_factura.dw_factura.setitem(donde,'vt_proc', - dw_abonos.getitemnumber(k,'queda'))
			w_factura.dw_factura.setitem(donde,'vt_pac',- dw_abonos.getitemnumber(k,'queda'))
			w_factura.dw_factura.setitem(donde,'vp_unit',- dw_abonos.getitemnumber(k,'queda'))
		else
			w_factura.dw_factura.setitem(donde,'vt_proc', - w_factura.dw_resumen.getitemnumber(1,'compute_5'))
			w_factura.dw_factura.setitem(donde,'vt_pac',- w_factura.dw_resumen.getitemnumber(1,'compute_5'))
			w_factura.dw_factura.setitem(donde,'vp_unit',- w_factura.dw_resumen.getitemnumber(1,'compute_5'))
		end if
		w_factura.dw_factura.setitem(donde,'vt_emp',0)
		w_factura.dw_factura.setitem(donde,'cantidad',1)
		w_factura.dw_factura.setitem(donde,'rips','10')
		w_factura.dw_factura.setitem(donde,'numero',donde)
		w_factura.dw_factura.setitem(donde,'que_paga','particular')
		w_factura.dw_factura.setitem(donde,'plan','0')
		w_factura.dw_factura.setitem(donde,'tipodoc',tipdoc)
		w_factura.dw_factura.setitem(donde,'docu',docu)
		w_factura.dw_factura.setitem(donde,'percent_pac',100)
		w_factura.dw_factura.setitem(donde,'tipo_proc','G')
		w_factura.dw_factura.setitem(donde,'cod_manual','01')
		w_factura.dw_factura.setitem(donde,'ntrata',0)//en facturacion utiliza este campo para saber que es abono
		w_factura.dw_factura.setitem(donde,"item_trat",dw_abonos.getitemnumber(k,'nabono'))//aqui quedó el dato del nro abono
		w_factura.dw_factura.setitem(donde,"clug_trat",dw_abonos.getitemstring(k,'clugar'))
		w_factura.f_cambiar_cant(donde,1,'M')
	next
end if
w_factura.resumen('H')
if w_factura.dw_factura.rowcount()>0 then
	w_factura.pb_paci.enabled=false
	w_factura.pb_emp.enabled=false
end if
w_factura.dw_tip_ingres.setitem(1,1,dw_ingres.getitemstring(1,'max_tingre'))
w_factura.i_tipoingreso=dw_ingres.getitemstring(1,'max_tingre')
w_factura.dw_tip_ingres.accepttext()
cierra=true
close(parent)
end event

type dw_serv_nofactu from datawindow within w_factu_serv_hosp
event p_itemchanged ( )
integer x = 187
integer y = 684
integer width = 3735
integer height = 1624
integer taborder = 10
string title = "none"
string dataobject = "dw_serv_nofactu_hosp_2"
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();dw_serv_nofactu.accepttext()
if long(this.describe("evaluate('max(total_c)',0)"))> 0 then
	if long(this.describe("evaluate('max(total_c)',0)")) =dw_serv_nofactu.rowcount() then
		pb_cambia.enabled=false
		MessageBox('Atención','No puede cambiar todos los productos, Haga cambio de responsable')
	else
		pb_cambia.enabled=true
	end if
else
	pb_cambia.enabled=false
end if

end event

event constructor;this.settransobject(sqlca)
end event

event retrieverow;if this.getitemstring(row,"parto")='1' then parto='1'
end event

event buttonclicked;long j
for j=1 to this.rowcount()
	if dwo.text='Cobrar' then
		this.setitem(j,'facturar',1)
	else
		this.setitem(j,'facturar',0)
	end if
next
if dwo.text='Cobrar' then
	this.modify(string(dwo.name)+'.text="No Cobrar"')
else
	this.modify(string(dwo.name)+'.text="Cobrar"')
end if
end event

event retrievestart;return 2
end event

event itemchanged;post event p_itemchanged()
end event

type st_1 from statictext within w_factu_serv_hosp
integer x = 14
integer y = 12
integer width = 3959
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "El Paciente tiene las siguientes Admisiones sin facturar. Elija en ~'Facturar~' para ver los procedimientos de esa admisión y luego facturarlos"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cobra_ from datawindow within w_factu_serv_hosp
string tag = "pa cobrar x ejemp aten diaria"
boolean visible = false
integer x = 4023
integer y = 408
integer width = 146
integer height = 84
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_cobra_estancias"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event retrieveend;if this.rowcount()>0 then
	date ingreso
	time hentra
	int cuantos,hobserv,cantidad,suma
	string ind_cobro,ind_tiempo,esparto
	ingreso=date(dw_ingres.getitemdatetime(dw_ingres.getrow(),"fechaingreso"))
	hentra=time(dw_ingres.getitemdatetime(dw_ingres.getrow(),"horaingreso"))
	if sale<ingreso then
		messagebox("Error en fechas","Revise la fecha de ingreso y la fecha actual")
		return 1
	end if
	if w_factura.i_tipoingreso='2' then 
		suma=0
	else
		suma=1
	end if
	cuantos=daysafter(ingreso,sale)+suma
	if dw_ingres.getitemstring(dw_ingres.getrow(),"en_observa")='1' then
		hobserv=cuantos*24
		hobserv+=int((secondsafter(hentra,hsale)/3600))
	else
		hobserv=-1
	end if
	long j,inicio,fin,k
	for j=1 to this.rowcount()
		ind_cobro=this.getitemstring(j,"ind_cobro")
		ind_tiempo=this.getitemstring(j,"ind_tiempo")
		inicio=this.getitemnumber(j,"inicio")
		if isnull(inicio) then inicio=0
		fin=this.getitemnumber(j,"fin")
		esparto=this.getitemstring(j,"ind_qx")
		if lower(esparto)='q' then goto otro
		choose case ind_cobro
			case '0' //horas
				CHOOSE CASE ind_tiempo
					CASE '0'
						if hobserv >= inicio and (hobserv<=fin or isnull(fin))then 
							if lower(esparto)<>'p' then
								cantidad=hobserv -inicio
							else
								if lower(esparto)='p' and parto='1' then
									cantidad=hobserv -inicio
								else
									goto otro
								end if
							end if
						else
							goto otro
						end if
					case '1'
						goto otro
					case '2'
						goto otro
				END CHOOSE
			case '1'  //dias
				CHOOSE CASE ind_tiempo
					CASE '0'
						goto otro
					case '1'
						if cuantos>= inicio and (cuantos<=fin or isnull(fin)) then
							if lower(esparto)<>'p' then
								cantidad=cuantos -inicio
							else
								if lower(esparto)='p' and parto='1' then
									cantidad=cuantos -inicio
								else
									goto otro
								end if
							end if
						else
							goto otro
						end if	
					case '2'
						goto otro
				END CHOOSE
			case '2' //evento
				CHOOSE CASE ind_tiempo
					CASE '0'
						if hobserv>=inicio and (hobserv<=fin or isnull(fin)) then 
							if lower(esparto)<>'p' then
								cantidad=1
							else
								if lower(esparto)='p' and parto='1' then
									cantidad=1
								else
									goto otro
								end if
							end if
						else
							goto otro
						end if
					case '1'
						if cuantos>= inicio and (cuantos<=fin or isnull(fin)) then
							if lower(esparto)<>'p' then
								cantidad=1
							else
								if lower(esparto)='p' and parto='1' then
									cantidad=1
								else
									goto otro
								end if
							end if
						else
							goto otro
						end if	
					case '2'
						if lower(esparto)<>'p' then
								cantidad=1
							else
								if lower(esparto)='p' and parto='1' then
									cantidad=1
								else
									goto otro
								end if
							end if
				END CHOOSE
		end choose
		if not isnull(dw_ingres.getitemnumber(dw_ingres.getrow(),"consec_soat")) and ind_cobro='1' then
			for k= 0 to cantidad -1
				dw_serv_nofactu.insertrow(1)
				dw_serv_nofactu.setitem(1,"contador",dw_ingres.getitemnumber(dw_ingres.getrow(),'contador'))
				dw_serv_nofactu.setitem(1,"clugar",dw_ingres.getitemstring(dw_ingres.getrow(),'clugar_his'))
				dw_serv_nofactu.setitem(1,"cantidad",1)
				dw_serv_nofactu.setitem(1,"cproced",this.getitemstring(j,"codproced"))
				dw_serv_nofactu.setitem(1,"descripcion",this.getitemstring(j,"descripcion"))
				dw_serv_nofactu.setitem(1,"cprocedeq",this.getitemstring(j,"codserviman"))
				dw_serv_nofactu.setitem(1,"cons",dw_ingres.getitemnumber(dw_ingres.getrow(),"consec_soat"))
				dw_serv_nofactu.setitem(1,"clugar_soat",dw_ingres.getitemstring(dw_ingres.getrow(),"clugar_soat"))
				dw_serv_nofactu.setitem(1,"prior",0)
				dw_serv_nofactu.setitem(1,"fecha",datetime(relativedate(ingreso,inicio +k)))
				dw_serv_nofactu.setitem(1,"nh",dw_ingres.getitemnumber(dw_ingres.getrow(),'nh'))
				dw_serv_nofactu.setitem(1,"fila",dw_ingres.getrow())
			next
		else
			dw_serv_nofactu.insertrow(1)
			dw_serv_nofactu.setitem(1,"cantidad",cantidad)
			dw_serv_nofactu.setitem(1,"contador",dw_ingres.getitemnumber(dw_ingres.getrow(),'contador'))
			dw_serv_nofactu.setitem(1,"clugar",dw_ingres.getitemstring(dw_ingres.getrow(),'clugar_his'))
			//dw_serv_nofactu.setitem(1,"cproced",this.getitemstring(j,"codproced"))
			dw_serv_nofactu.setitem(1,"cproced",this.getitemstring(j,"codproced"))
			dw_serv_nofactu.setitem(1,"descripcion",this.getitemstring(j,"descripcion"))
			dw_serv_nofactu.setitem(1,"cprocedeq",this.getitemstring(j,"codserviman"))
			dw_serv_nofactu.setitem(1,"cons",dw_ingres.getitemnumber(dw_ingres.getrow(),"consec_soat"))
			dw_serv_nofactu.setitem(1,"clugar_soat",dw_ingres.getitemstring(dw_ingres.getrow(),"clugar_soat"))
			dw_serv_nofactu.setitem(1,"nh",dw_ingres.getitemnumber(dw_ingres.getrow(),'nh'))
			dw_serv_nofactu.setitem(1,"fila",dw_ingres.getrow())
		end if
	otro:
	next
end if
end event

type gb_2 from groupbox within w_factu_serv_hosp
integer x = 9
integer y = 628
integer width = 3968
integer height = 1724
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos realizados/ Medicamentos suministrados:"
borderstyle borderstyle = styleraised!
end type

type dw_ingres from datawindow within w_factu_serv_hosp
integer x = 41
integer y = 172
integer width = 3927
integer height = 452
integer taborder = 10
string title = "none"
string dataobject = "dw_admi_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;choose case getcolumnname()
	case 'esco'
		if data='0' then
			setitem(getrow(),'al_segun','0')
			dw_serv_nofactu.setredraw(false)
			dw_serv_nofactu.setfilter('nh='+string(getitemnumber(getrow(),'nh')))
			dw_serv_nofactu.filter()
			do while dw_serv_nofactu.rowcount()>0
				dw_serv_nofactu.deleterow(0)
			loop
			dw_serv_nofactu.setfilter('')
			dw_serv_nofactu.filter()
			dw_serv_nofactu.setredraw(true)
		else
			datetime salecom,hsalecom
			string clugar_hadm,emp,cont,manual,tingre
			long nh,j,dias,cuan_proc
			nh=getitemnumber(getrow(),"nh")
			clugar_hadm=getitemstring(getrow(),"clugar")
			setnull(salecom)
			setnull(hsalecom)
			select fechaegreso , horaegreso into :salecom,:hsalecom from hospsali where nhosp=:nh and clugar_hadm=:clugar_hadm;
			if isnull(salecom) then
				sale=today()
			else
				sale=date(salecom)
			end if
			if isnull(hsalecom) then
				hsale=now()
			else
				hsale=time(hsalecom)
			end if
			dw_serv_nofactu.setredraw(false)
			dw_1.retrieve(nh,datetime(sale),clugar_hadm)
			cuan_proc=dw_serv_nofactu.rowcount()
			cuan_proc -= dw_serv_nofactu.retrieve(getitemnumber(getrow(),"contador"),getitemstring(getrow(),"clugar_his"),nh,getitemstring(getrow(),'codtingre'))
			dw_serv_nofactu.setfilter('fila=0')
			dw_serv_nofactu.filter()
			for j=1 to dw_serv_nofactu.rowcount()
				dw_serv_nofactu.setitem(j,'fila',dw_ingres.getrow())
			next
			dw_serv_nofactu.setfilter('')
			dw_serv_nofactu.filter()
			if getitemnumber(getrow(),'al_segun')=0 then
				emp=getitemstring(getrow(),'cemp')
				cont=getitemstring(getrow(),'ccontrato')
			else
				emp=getitemstring(getrow(),'segrespon')
				cont=getitemstring(getrow(),'contsegrespon')
			end if
			tingre=getitemstring(getrow(),'codtingre')
			SELECT Min(ContratoDet.CodManual) into :manual
			FROM Planes INNER JOIN ContratoDet ON Planes.CodPlan = ContratoDet.Cplan
			WHERE ((Planes.es_medica='0') AND (ContratoDet.CEmp=:emp) AND (ContratoDet.CContrato=:cont) and (ContratoDet.CodTIngre=:tingre));
			//dw_cobra.retrieve(manual,tingre)
			if not isnull(getitemnumber(getrow(),"consec_soat")) then
				pb_soat.enabled=true
				pb_soat.visible=true
			else
				pb_soat.enabled=false
				pb_soat.visible=false
			end if
			long h
			if dw_1.rowcount()>0 then
				for h=1 to dw_1.rowcount()
					dias=dw_1.getitemnumber(h,"dias")
					if dias>0 then
						if not isnull(getitemnumber(getrow(),"consec_soat")) then
							for j= 0 to dias -1
								dw_serv_nofactu.insertrow(1)
								dw_serv_nofactu.setitem(1,"cantidad",1)
								dw_serv_nofactu.setitem(1,"prior",0)
								dw_serv_nofactu.setitem(1,"cproced",dw_1.getitemstring(h,"cproced"))
								dw_serv_nofactu.setitem(1,"descripcion",dw_1.getitemstring(h,"descripcion"))
								dw_serv_nofactu.setitem(1,"fecha",datetime(relativedate(date(dw_1.getitemdatetime(h,"fecha")),j)))
								dw_serv_nofactu.setitem(1,"cons",getitemnumber(getrow(),"consec_soat"))
								dw_serv_nofactu.setitem(1,"clugar_soat",getitemstring(getrow(),"clugar_soat"))
								dw_serv_nofactu.setitem(1,"nh",getitemnumber(getrow(),'nh'))
								dw_serv_nofactu.setitem(1,"cufuncional",dw_1.getitemstring(getrow(),'cufuncional'))
								dw_serv_nofactu.setitem(1,"cccosto",dw_1.getitemstring(getrow(),'cccosto'))
								dw_serv_nofactu.setitem(1,"fila",getrow())
							next
						else
							dw_serv_nofactu.insertrow(1)
							dw_serv_nofactu.setitem(1,"cantidad",dias)
							dw_serv_nofactu.setitem(1,"cproced",dw_1.getitemstring(h,"cproced"))
							dw_serv_nofactu.setitem(1,"descripcion",dw_1.getitemstring(h,"descripcion"))
							dw_serv_nofactu.setitem(1,"nh",getitemnumber(getrow(),'nh'))
							dw_serv_nofactu.setitem(1,"fila",getrow())
						end if
					end if
				next
			end if
			if cuan_proc=0 and dw_1.rowcount()=0 then //and dw_cobra.rowcount()=0 then
				settext('0')
				setitem(getrow(),'esco',0)
				return 1
			end if
			dw_serv_nofactu.setredraw(true)
			dw_serv_nofactu.sort()
		end if
	case 'al_segun'
		if data='1' then
			if isnull(getitemstring(getrow(),'segrespon')) then
				settext('0')
				setitem(getrow(),'al_segun','0')
				return 1
			end if
		end if
	case 'autoriza'
		long k
		string nro_aut
		nro_aut=gettext()
		if nro_aut='' then setnull(nro_aut)
		dw_serv_nofactu.setredraw(false)
		dw_serv_nofactu.setfilter('nh='+string(getitemnumber(getrow(),'nh')))
		dw_serv_nofactu.filter()
		for k=1 to dw_serv_nofactu.rowcount()
			dw_serv_nofactu.setitem(k,'nautoriza',nro_aut)
		next
		dw_serv_nofactu.setfilter('')
		dw_serv_nofactu.filter()
		dw_serv_nofactu.setredraw(true)
end choose
end event

event buttonclicked;//long j
//for j=1 to dw_ingres.rowcount()
//	if dw_ingres.getitemnumber(j,'esco')=0 then
//		setrow(j)
//		dw_ingres.setitem(j,'esco',1)
//	else
//		dw_ingres.setitem(j,'esco',0)
//	end if
//next
end event

type gb_3 from groupbox within w_factu_serv_hosp
integer x = 14
integer y = 112
integer width = 3968
integer height = 528
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217750
string text = "Admisiones sin facturar:"
borderstyle borderstyle = styleraised!
end type

