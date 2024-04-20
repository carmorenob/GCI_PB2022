$PBExportHeader$w_orden_quir.srw
forward
global type w_orden_quir from window
end type
type pb_print from pb_report within w_orden_quir
end type
type pb_9 from picturebutton within w_orden_quir
end type
type pb_8 from picturebutton within w_orden_quir
end type
type pb_7 from picturebutton within w_orden_quir
end type
type pb_6 from picturebutton within w_orden_quir
end type
type pb_5 from picturebutton within w_orden_quir
end type
type pb_4 from picturebutton within w_orden_quir
end type
type pb_3 from picturebutton within w_orden_quir
end type
type pb_2 from picturebutton within w_orden_quir
end type
type pb_1 from picturebutton within w_orden_quir
end type
type dw_subcpo from datawindow within w_orden_quir
end type
type dw_cpo from datawindow within w_orden_quir
end type
type dw_cab from datawindow within w_orden_quir
end type
type gb_1 from groupbox within w_orden_quir
end type
type gb_2 from groupbox within w_orden_quir
end type
type gb_3 from groupbox within w_orden_quir
end type
end forward

global type w_orden_quir from window
integer width = 3136
integer height = 1996
boolean titlebar = true
string title = "Ordenar Procedimientos Quirúrgicos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean clientedge = true
boolean center = true
pb_print pb_print
pb_9 pb_9
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_subcpo dw_subcpo
dw_cpo dw_cpo
dw_cab dw_cab
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_orden_quir w_orden_quir

type variables
st_historial st_historial
datawindowchild idw_espe
end variables

on w_orden_quir.create
this.pb_print=create pb_print
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_subcpo=create dw_subcpo
this.dw_cpo=create dw_cpo
this.dw_cab=create dw_cab
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.pb_print,&
this.pb_9,&
this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_subcpo,&
this.dw_cpo,&
this.dw_cab,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_orden_quir.destroy
destroy(this.pb_print)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_subcpo)
destroy(this.dw_cpo)
destroy(this.dw_cab)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;st_historial=message.powerobjectparm
if w_principal.dw_1.getitemstring(1,'sexo')='M' then
	dw_cab.modify('embarazada.visible=0')
end if
dw_cab.retrieve(st_historial.contador,st_historial.clugar)
end event

type pb_print from pb_report within w_orden_quir
integer x = 2921
integer y = 292
integer taborder = 30
string powertiptext = "Imprimir Orden"
string cod_rep = "SOQX"
string nombre_rep = "Solicitud de Procedimiento Quirúrgico"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_cab.rowcount()=0 then return
any par[3]
par[1]=dw_cab.getitemnumber(dw_cab.getrow(),'contador')
par[2]=dw_cab.getitemstring(dw_cab.getrow(),'clugar')
par[3]=dw_cab.getitemnumber(dw_cab.getrow(),'nsolicitud')
imprimir(par,'','0')
end event

event constructor;call super::constructor;//inicia('interno!','SOQX',clugar)
end event

type pb_9 from picturebutton within w_orden_quir
integer x = 2907
integer y = 1596
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
end type

event clicked;long j
for j=1 to dw_subcpo.rowcount()
	dw_subcpo.setitem(j,'subitem',j)
next
if dw_subcpo.update()=-1 then
	rollback;
else
	commit;
END IF
end event

type pb_8 from picturebutton within w_orden_quir
integer x = 2907
integer y = 1460
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_subcpo.deleterow(0)
if dw_subcpo.update()=-1 then
	rollback;
	parent.triggerevent(open!)
else
	commit;
end if

end event

type pb_7 from picturebutton within w_orden_quir
integer x = 2907
integer y = 1324
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;dw_subcpo.insertrow(1)
dw_subcpo.setitem(1,'contador',st_historial.contador)
dw_subcpo.setitem(1,'clugar',st_historial.clugar)
dw_subcpo.setitem(1,'nsolicitud',dw_cab.getitemnumber(dw_cab.getrow(),'nsolicitud'))
dw_subcpo.setitem(1,'item',dw_cpo.getitemnumber(dw_cpo.getrow(),'item'))
dw_subcpo.scrolltorow(1)

end event

type pb_6 from picturebutton within w_orden_quir
integer x = 2912
integer y = 980
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
end type

event clicked;long j
for j=1 to dw_cpo.rowcount()
	if isnull(dw_cpo.getitemstring(j,'prof')) or dw_cpo.getitemstring(j,'prof')='' then
		messagebox("Atención",'Debe escoger el profesional')
		dw_cpo.scrolltorow(j)
		dw_cpo.setcolumn('prof')
		dw_cpo.setfocus()
		return
	end if
	if isnull(dw_cpo.getitemstring(j,'espe')) or dw_cpo.getitemstring(j,'espe')='' then
		messagebox("Atención",'Debe escoger la especialidad del profesional')
		dw_cpo.scrolltorow(j)
		dw_cpo.setcolumn('desesp')
		dw_cpo.setfocus()
		return
	end if
	if isnull(dw_cpo.getitemstring(j,'codtipoanestesia')) or dw_cpo.getitemstring(j,'codtipoanestesia')='' then
		messagebox("Atención",'Debe escoger el tipo de anestesia')
		dw_cpo.scrolltorow(j)
		dw_cpo.setcolumn('codtipoanestesia')
		dw_cpo.setfocus()
		return
	end if
	
next
if isnull(dw_cpo.getitemnumber(1,'item')) then
	for j=1 to dw_cpo.rowcount()
		if dw_cpo.Find("item="+string(j), 1, dw_cpo.rowcount())=0 then
			dw_cpo.setitem(1,"item",j)
			exit
		end if
	next
end if
if dw_cpo.update()=-1 then
	rollback;
else
	commit;
	pb_4.enabled=true
	pb_7.enabled=true
	pb_8.enabled=true
	pb_9.enabled=true
end if
end event

type pb_5 from picturebutton within w_orden_quir
integer x = 2912
integer y = 848
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_subcpo.rowcount()>0 then
	messagebox("Atención",'Debe borrar primero los registros del detalle')
else
	dw_cpo.deleterow(0)
	if dw_cpo.update()=-1 then
		rollback;
		parent.triggerevent(open!)
	else
		commit;
		pb_4.enabled=true
		pb_7.enabled=true
		pb_8.enabled=true
		pb_9.enabled=true
	end if
end if
end event

type pb_4 from picturebutton within w_orden_quir
integer x = 2912
integer y = 716
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;dw_cpo.insertrow(1)
dw_cpo.setitem(1,'contador',st_historial.contador)
dw_cpo.setitem(1,'clugar',st_historial.clugar)
dw_cpo.setitem(1,'nsolicitud',dw_cab.getitemnumber(dw_cab.getrow(),'nsolicitud'))
dw_cpo.scrolltorow(1)
this.enabled=false
pb_7.enabled=false
pb_8.enabled=false
pb_9.enabled=false
dw_subcpo.reset()
end event

type pb_3 from picturebutton within w_orden_quir
integer x = 2921
integer y = 424
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &g"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Encabezado de Solicitud [Alt+G]"
end type

event clicked;long j
if isnull(dw_cab.getitemnumber(1,'nsolicitud')) then 
	for j=1 to dw_cab.rowcount()
		if dw_cab.Find("nsolicitud="+string(j), 1, dw_cab.rowcount())=0 then
			dw_cab.setitem(1,"nsolicitud",j)
			exit
		end if
	next
end if
if dw_cab.update()=-1 then
	rollback;
else
	commit;
	pb_1.enabled=true
	pb_4.enabled=true
	pb_5.enabled=true
	pb_6.enabled=true
	pb_7.enabled=true
	pb_8.enabled=true
	pb_9.enabled=true
end if
end event

type pb_2 from picturebutton within w_orden_quir
integer x = 2921
integer y = 164
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &b"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Solicitud de Acto [Alt+B]"
end type

event clicked;if dw_cpo.rowcount()>0 or dw_subcpo.rowcount()>0 then
	messagebox("Atención",'Debe borrar primero los registros del detalle')
else
	dw_cab.deleterow(0)
	if dw_cab.update()=-1 then
		rollback;
		parent.triggerevent(open!)
	else
		commit;
		pb_1.enabled=true
		pb_4.enabled=true
		pb_5.enabled=true
		pb_6.enabled=true
		pb_7.enabled=true
		pb_8.enabled=true
		pb_9.enabled=true
	end if
end if
end event

type pb_1 from picturebutton within w_orden_quir
integer x = 2921
integer y = 36
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &i"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Nueva Solicitud de Acto [Alt+I]"
end type

event clicked;dw_cab.insertrow(1)
dw_cab.setitem(1,'fecha',datetime(today()))
dw_cab.setitem(1,'contador',st_historial.contador)
dw_cab.setitem(1,'clugar',st_historial.clugar)
dw_cab.setitem(1,'usuario',usuario)
dw_cab.scrolltorow(1)
this.enabled=false
pb_4.enabled=false
pb_5.enabled=false
pb_6.enabled=false
pb_7.enabled=false
pb_8.enabled=false
pb_9.enabled=false
dw_cpo.reset()
dw_subcpo.reset()
end event

type dw_subcpo from datawindow within w_orden_quir
integer x = 41
integer y = 1292
integer width = 2825
integer height = 504
integer taborder = 30
string title = "none"
string dataobject = "dw_os_qx_subcpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string nulo
setnull(nulo)
choose case dwo.name
	case 'codproced'
		str_proc str_proc
		st_pa_proc st_pr
		st_pr.t_ingreso='1'
		st_pr.emp=st_historial.cemp
		st_pr.cont=st_historial.ccont
		openwithparm(w_busca_proc,st_pr)
		
		str_proc=message.powerobjectparm
		if isvalid(str_proc) then
			this.setitem(row,'codproced',str_proc.cproc)
			setitem(row,'examen',str_proc.descripcion)
			setitem(row,'cmedica',nulo)
		end if
	case 'cmedica'
		open(w_busca_med_x_gen)
		st_med st_med
		st_med=message.powerobjectparm
		if isvalid(st_med) then
			setitem(row,'cmedica',st_med.cmedica)
			setitem(row,'examen',st_med.medicamento)
			setitem(row,'codproced',nulo)
		end if
end choose
end event

event itemchanged;string descrip,nulo
setnull(nulo)
setnull(descrip)
choose case dwo.name
	case 'codproced'
		select descripcion into :descrip from proced where codproced=:data and estado='1';
		if isnull(descrip) then 
			this.setitem(row,'codproced',nulo)
			this.settext(nulo)
			return 1
		end if
		this.setitem(row,'cmedica',nulo)
		this.setitem(row,'examen',descrip)
	case 'cmedica'
		select medicamento into :descrip from medicamentos where c_medica=:data ;
		if isnull(descrip) then 
			this.setitem(row,'cmedica',nulo)
			this.settext(nulo)
			return 1
		end if
		this.setitem(row,'codproced',nulo)
		this.setitem(row,'examen',descrip)
end choose
end event

event constructor;settransobject(sqlca)
modify('cumplido.protect="1"')
end event

type dw_cpo from datawindow within w_orden_quir
integer x = 46
integer y = 704
integer width = 2821
integer height = 460
integer taborder = 20
string title = "none"
string dataobject = "dw_os_qx_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;choose case getcolumnname()
	case 'codproced'
		if this.gettext()<>'' and not isnull(this.gettext()) then
			string desproc,cproc,parto,para,sexo
			long tiempo
			cproc=this.gettext()
			setnull(desproc)
			setnull(para)
			sexo=w_principal.dw_1.getitemstring(1,'sexo')
			SELECT Proced.Descripcion, Proced.parto, proced.tiempoqx,Min(QxConfiguracion.Sexo) 
			into :desproc,:parto,:tiempo,:para
			FROM (SERVICIOSMAN LEFT outer JOIN QxConfiguracion ON (SERVICIOSMAN.codservicio = QxConfiguracion.Proced) AND (SERVICIOSMAN.CodManual = QxConfiguracion.CodManual)) INNER JOIN (Proced INNER JOIN Tarifas ON Proced.CodProced = Tarifas.CodProced) ON (SERVICIOSMAN.codservicio = Tarifas.codservicio) AND (SERVICIOSMAN.CodManual = Tarifas.CodManual)
			WHERE (((SERVICIOSMAN.tiposervicio)='P' Or (SERVICIOSMAN.tiposervicio)='Q') AND ((Proced.estado)='1') AND ((SERVICIOSMAN.estado)='1'))
			GROUP BY Proced.Descripcion, Proced.parto, Proced.CodProced, proced.tiempoqx
			HAVING (((Proced.CodProced)=:cproc));
			if sqlca.sqlcode=-1 then
				messagebox('Atención',sqlca.sqlerrtext)
				return 1
			end if
			if isnull(desproc) or desproc='' then 
				this.settext('')
				this.setitem(row,'codproced','')
				return 1
			end if
			if parto='1' and sexo='M' then
				messagebox("Atención",'Este procedimiento es solo para sexo femenino')
				this.settext('')
				this.setitem(row,'codproced','')
				return 1
			end if
			if not isnull(para) then
				if para<>'A' then
					if (sexo='M' and para='F') or ( sexo='F' and para='M') then
						messagebox("Atención",'Este procedimiento es solo para sexo '+para)
						this.settext('')
						this.setitem(row,'codproced','')
						return 1
					end if
				end if
			end if
			this.setitem(row,'examen',desproc)
			this.setitem(row,'tiempo',tiempo)
		else
			
		end if
	case 'desesp'
		setitem(row,'espe',idw_espe.getitemstring(idw_espe.getrow(),'cesp'))
	case 'prof'
		idw_espe.retrieve(data,'0')
		string nulo
		setnull(nulo)
		choose case idw_espe.rowcount()
			case 0
				setitem(row,'desesp',nulo)
				setitem(row,'espe',nulo)
				messagebox("Atención",'Este profesional no tiene especialidades definidas')
			case 1
				setitem(row,'espe',idw_espe.getitemstring(1,'cesp'))
				setitem(row,'desesp',idw_espe.getitemstring(1,'desesp'))
			case else
				setitem(row,'desesp',nulo)
				setitem(row,'espe',nulo)
		end choose
end choose
end event

event constructor;settransobject(sqlca)
getchild('desesp',idw_espe)
idw_espe.settransobject(sqlca)
end event

event doubleclicked;if this.getcolumnname()='codproced' then
	open(w_busca_qx_cups)
	st_cirug st
	st=message.powerobjectparm
	if isvalid(st) then
		this.setitem(row,'codproced',st.proccups)
		this.event itemchanged(row,dwo,st.proccups)
	end if
end if
end event

event rowfocuschanging;if rowcount()=0 then return
if isnull(getitemnumber(1,'item')) and currentrow<>0 then return 1
end event

event rowfocuschanged;if currentrow<1 then return
idw_espe.retrieve(getitemstring(currentrow,'prof'),'0')
dw_subcpo.retrieve(st_historial.contador,st_historial.clugar,getitemnumber(getrow(),'nsolicitud'),getitemnumber(getrow(),'item'))
end event

type dw_cab from datawindow within w_orden_quir
integer x = 41
integer y = 60
integer width = 2862
integer height = 488
integer taborder = 10
string title = "none"
string dataobject = "dw_os_qx_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanging;if isnull(this.getitemnumber(1,'nsolicitud')) and currentrow<>0 then return 1
end event

event rowfocuschanged;if this.getrow()<1 then return
dw_subcpo.reset()
dw_cpo.reset()
dw_cpo.retrieve(st_historial.contador,st_historial.clugar,this.getitemnumber(this.getrow(),'nsolicitud'))
end event

event constructor;this.settransobject(sqlca)
end event

event itemchanged;IF THIS.getcolumnname()='cod_rips' then
	string este='',nulo
	st_return_diags st
	
	setnull(nulo)
	if trim(data)="" then 
		this.setitem(row,'codgeral',nulo)
		return
	end if
	sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
	edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
	st=f_check_diag(data,sex_busca,edad_busca,este,'0')
	if st.descrip_diag="" then
		this.setitem(row,"codgeral",nulo)
		this.setitem(row,"cod_rips",'')
		this.setitem(row,"diagnostico",nulo)
		return 1
	else
		this.accepttext()
		this.setitem(row,"codgeral",este)
		this.setitem(row,"diagnostico",st.descrip_diag)
	end if
else
	this.accepttext()
end if
end event

event doubleclicked;if this.getcolumnname()<>"cod_rips" then return
st_edadsexo st_es
st_diag st_d
st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
st_es.antece='0'
openwithparm(w_busca_diag,st_es)
st_d=message.powerobjectparm
if not isValid(st_d) then return
if not isNull(st_d.codrip) then
	this.setitem(row,"codgeral",st_d.codgeral)
	this.setitem(row,"cod_rips",st_d.codrip)
	this.setitem(row,"diagnostico",st_d.descripcion)
end if
end event

type gb_1 from groupbox within w_orden_quir
integer x = 18
integer width = 3067
integer height = 588
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actos quirúrgicos solicitados en este ingreso:"
end type

type gb_2 from groupbox within w_orden_quir
integer x = 18
integer y = 624
integer width = 3063
integer height = 576
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos Solicitados del acto:"
end type

type gb_3 from groupbox within w_orden_quir
integer x = 9
integer y = 1216
integer width = 3067
integer height = 636
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Examenes para el Procedimiento:"
end type

