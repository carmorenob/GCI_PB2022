$PBExportHeader$w_vacunas.srw
forward
global type w_vacunas from window
end type
type pb_4 from picturebutton within w_vacunas
end type
type dw_serv_ing from datawindow within w_vacunas
end type
type dw_historial from datawindow within w_vacunas
end type
type pb_3 from picturebutton within w_vacunas
end type
type dw_1 from datawindow within w_vacunas
end type
type pb_1 from picturebutton within w_vacunas
end type
type st_2 from statictext within w_vacunas
end type
type st_1 from statictext within w_vacunas
end type
type pb_ayuda from picturebutton within w_vacunas
end type
type cb_3 from picturebutton within w_vacunas
end type
type cb_2 from picturebutton within w_vacunas
end type
type cb_1 from picturebutton within w_vacunas
end type
type dw_vacunas from datawindow within w_vacunas
end type
type dw_dosis from datawindow within w_vacunas
end type
type dw_vac_pac from datawindow within w_vacunas
end type
type pb_2 from picturebutton within w_vacunas
end type
end forward

global type w_vacunas from window
integer width = 5239
integer height = 2052
boolean titlebar = true
string title = "Vacunas de Paciente"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "r_vacunas.ico"
string pointer = "Arrow!"
boolean clientedge = true
pb_4 pb_4
dw_serv_ing dw_serv_ing
dw_historial dw_historial
pb_3 pb_3
dw_1 dw_1
pb_1 pb_1
st_2 st_2
st_1 st_1
pb_ayuda pb_ayuda
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_vacunas dw_vacunas
dw_dosis dw_dosis
dw_vac_pac dw_vac_pac
pb_2 pb_2
end type
global w_vacunas w_vacunas

type variables
string is_cod_vac, l_sex,l_ges,l_cod_cups
datawindowchild idw,iprof
end variables

forward prototypes
public function long f_insert_servicio (string as_cups, long ad_contador, string as_lugar, string as_profe, datetime ad_fecha, long ad_nservicio, string as_cemp, string as_ccont, string as_modrel)
end prototypes

public function long f_insert_servicio (string as_cups, long ad_contador, string as_lugar, string as_profe, datetime ad_fecha, long ad_nservicio, string as_cemp, string as_ccont, string as_modrel);long l_fila
string nulo,p_coduf,p_codcc

setnull(nulo)
setnull(p_coduf)
setnull(p_codcc)


l_fila=dw_serv_ing.insertrow(0)
dw_serv_ing.setitem(l_fila,"contador",ad_contador)
dw_serv_ing.setitem(l_fila,"clugar",as_lugar)
dw_serv_ing.setitem(l_fila,"nservicio",ad_nservicio)
dw_serv_ing.setitem(l_fila,"cproced",as_cups)
if isnull(idw.getitemstring(idw.getrow(),'dx')) then 
	dw_serv_ing.setitem(l_fila,"finalidadproced",'3')
	dw_serv_ing.setitem(l_fila,"ambitoproced","1")
end if
dw_serv_ing.setitem(l_fila,"rips",'9')
dw_serv_ing.setitem(l_fila,"estria",'1')
dw_serv_ing.setitem(l_fila,"persoatiende",nulo)

dw_serv_ing.setitem(l_fila,"fecha",ad_fecha)
dw_serv_ing.setitem(l_fila,"usuario",usuario)
dw_serv_ing.setitem(l_fila,"cprof",as_profe)
dw_serv_ing.setitem(l_fila,"tipo_orden",'V')
dw_serv_ing.setitem(l_fila,"cemp",as_cemp)
dw_serv_ing.setitem(l_fila,"ccontrato",as_ccont)
if not isnull(idw.getitemstring(idw.getrow(),'dx')) then 
	dw_serv_ing.setitem(l_fila,"diagprin",idw.getitemstring(idw.getrow(),'dx'))
	dw_serv_ing.setitem(l_fila,"finalidadproced",idw.getitemstring(idw.getrow(),'fin_consulta'))
	dw_serv_ing.setitem(l_fila,"cod_modrel",as_modrel)
	dw_serv_ing.setitem(l_fila,"ambitoproced","01")
end if

if dw_serv_ing.update()<1 then
	dw_serv_ing.deleterow(l_fila)
	return -1
end if
return ad_nservicio
end function

on w_vacunas.create
this.pb_4=create pb_4
this.dw_serv_ing=create dw_serv_ing
this.dw_historial=create dw_historial
this.pb_3=create pb_3
this.dw_1=create dw_1
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.pb_ayuda=create pb_ayuda
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_vacunas=create dw_vacunas
this.dw_dosis=create dw_dosis
this.dw_vac_pac=create dw_vac_pac
this.pb_2=create pb_2
this.Control[]={this.pb_4,&
this.dw_serv_ing,&
this.dw_historial,&
this.pb_3,&
this.dw_1,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.pb_ayuda,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_vacunas,&
this.dw_dosis,&
this.dw_vac_pac,&
this.pb_2}
end on

on w_vacunas.destroy
destroy(this.pb_4)
destroy(this.dw_serv_ing)
destroy(this.dw_historial)
destroy(this.pb_3)
destroy(this.dw_1)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_ayuda)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_vacunas)
destroy(this.dw_dosis)
destroy(this.dw_vac_pac)
destroy(this.pb_2)
end on

event open;dw_vac_pac.settransobject(SQLCA)
dw_vacunas.settransobject(SQLCA)
dw_dosis.settransobject(SQLCA)
dw_vacunas.insertrow(1)
dw_vac_pac.retrieve(histo)

end event

type pb_4 from picturebutton within w_vacunas
string tag = "Cambio Resposable"
integer x = 4750
integer y = 1148
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
string picturename = "cambia_res.gif"
string disabledname = "d_cambia_res.gif"
alignment htextalign = left!
string powertiptext = "Cambio Resposable"
end type

event clicked;if not isnull(dw_dosis.getitemnumber(dw_dosis.getrow(),'nfact')) then return

double ldb_cot,ldb_nser
string ls_lug

ldb_cot=dw_dosis.getitemnumber(dw_dosis.getrow(),'contador')
ldb_nser=dw_dosis.getitemnumber(dw_dosis.getrow(),'nservicio')
ls_lug=dw_dosis.getitemstring(dw_dosis.getrow(),'clugar_his')

st_busca_emp_capit st_emp
openwithparm(w_escoge_empresa_citas,st_emp)
st_emp=message.powerobjectparm
if isvalid(st_emp) then
	IF ISNULL(st_emp.emp) then 
		messagebox('Atención','No hay empresa responsable empresa')
		return 0
	end if
end if

dw_dosis.SetItem(dw_dosis.getrow(),'codemp',st_emp.emp)
dw_dosis.SetItem(dw_dosis.getrow(),'ccontrato',st_emp.cont)
dw_dosis.SetItem(dw_dosis.getrow(),'desemp',st_emp.desemp)
dw_dosis.SetItem(dw_dosis.getrow(),'descontrato',st_emp.descon)
if dw_dosis.update(true,false)=-1 then
	rollback;
	dw_dosis.retrieve(histo,is_cod_vac)
end if

update serviciosingreso set cemp=:st_emp.emp, ccontrato=:st_emp.cont
WHERE (((serviciosingreso.contador)=:ldb_cot) AND ((serviciosingreso.clugar)=:ls_lug) AND ((serviciosingreso.nservicio)=:ldb_nser));
IF SQLCA.SQLCode = -1 THEN
	MessageBox("Atención","No pudo actualizarse ServiciosIngreso")
	rollback;
END IF
commit;

end event

type dw_serv_ing from datawindow within w_vacunas
boolean visible = false
integer x = 2455
integer y = 20
integer width = 425
integer height = 96
integer taborder = 40
string dragicon = "none!"
boolean bringtotop = true
string dataobject = "dw_serv_ingre"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_historial from datawindow within w_vacunas
boolean visible = false
integer x = 3191
integer y = 24
integer width = 283
integer height = 96
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_histodon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
end event

type pb_3 from picturebutton within w_vacunas
event mousemove pbm_mousemove
integer x = 4750
integer y = 1004
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Cambios"
end type

event clicked;if dw_dosis.update(true,false)=-1 then
	rollback;
	dw_dosis.retrieve(histo,is_cod_vac)
else
	commit;
	long ndosi 
	ndosi =dw_dosis.getitemnumber(dw_dosis.getrow(),'total_a')
	// actualizar a terminada
	if dw_dosis.rowcount()=ndosi then
		dw_vac_pac.setitem(dw_vac_pac.getrow(),"estado",2)
		dw_vac_pac.update()
		commit;
	end if
end if
end event

type dw_1 from datawindow within w_vacunas
boolean visible = false
integer x = 2912
integer y = 36
integer width = 247
integer height = 76
integer taborder = 20
string title = "none"
string dataobject = "dw_vacuna_config"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_1 from picturebutton within w_vacunas
integer x = 1938
integer y = 32
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
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar vacuna"
end type

event clicked;long donde,j
string sexo_pac
sexo_pac=w_principal.dw_1.getitemstring(1,'sexo')
l_sex=idw.getitemstring(idw.getrow(),'sexo')
l_ges=idw.getitemstring(idw.getrow(),'gestante')
l_cod_cups=idw.getitemstring(idw.getrow(),'cod_fact')
donde=dw_vac_pac.find("codvacuna='"+dw_vacunas.getitemstring(1,1)+"'",1,dw_vac_pac.rowcount())
if donde=0 then
	string descrip
	long fila 
	choose case l_sex
	case "0" //HOMBRE
		if sexo_pac="F" then
			Messagebox("Atención","Esta Vacuna no es válido para el sexo del paciente")
			return 
		end if
	case "1" //MUJER
		if sexo_pac="M" then
			Messagebox("Atención","Este Vacuna no es válido para el sexo del paciente")
			return 
		end if
	end choose
	fila=dw_vac_pac.insertrow(0)
	dw_vac_pac.scrolltorow(fila)
	dw_vac_pac.setitem(fila,"codvacuna",idw.getitemstring(idw.getrow(),'codvacuna'))
	dw_vac_pac.setitem(fila,"descripcion",idw.getitemstring(idw.getrow(),'descripcion'))
	dw_vac_pac.setitem(fila,"ndosis",idw.getitemnumber(idw.getrow(),'ndosis'))
	dw_vac_pac.setitem(fila,"cod_cups",idw.getitemstring(idw.getrow(),'cod_cups'))
	dw_vac_pac.setitem(fila,"des_cups",idw.getitemstring(idw.getrow(),'descups'))
	
	dw_vac_pac.setitem(fila,"estado",1)
	dw_vac_pac.setitem(fila,"historia",histo)
	dw_vac_pac.setitem(fila,"sexo",l_sex)
	dw_vac_pac.setitem(fila,"gestante",l_ges)
	dw_vac_pac.setitem(fila,"cod_fact",l_cod_cups)
	dw_vac_pac.triggerevent(rowfocuschanged!)
	if dw_vac_pac.update(true,false)<1 then
		rollback;
	else
		commit;
		dw_vac_pac.resetupdate()
	end if
	for j=1 to dw_1.rowcount()
		fila=dw_dosis.insertrow(0)
		dw_dosis.setitem(fila,"codvacuna",is_cod_vac)
		dw_dosis.setitem(fila,"historia",histo)
		dw_dosis.setitem(fila,"ndosis",fila)
		dw_dosis.setitem(fila,"intervalo",dw_1.getitemnumber(j,'intervalo'))
		dw_dosis.setitem(fila,"descripcion",dw_1.getitemstring(j,'descripcion'))
		dw_dosis.setitem(fila,"profe",g_profe)
		dw_dosis.setitem(fila,"clugar",clugar)		
	next
	if dw_dosis.update()<1 then
		rollback;
		dw_dosis.retrieve(histo,is_cod_vac)
	else
		commit;
	end if	
else
	dw_vac_pac.setrow(donde)
end if
end event

type st_2 from statictext within w_vacunas
integer x = 69
integer width = 987
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione vacuna a aplicar:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_vacunas
integer x = 59
integer y = 156
integer width = 987
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vacunas Aplicadas al paciente:"
boolean focusrectangle = false
end type

type pb_ayuda from picturebutton within w_vacunas
event mousemove pbm_mousemove
boolean visible = false
integer x = 2094
integer y = 28
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &y"
boolean originalsize = true
string picturename = "ayuda.gif"
string disabledname = "d_ayuda.gif"
alignment htextalign = left!
string powertiptext = "Ayuda sobre Vacunación [Alt+Y]"
end type

event clicked;showhelp(dir_insta+"gciltda.hlp",keyword!,"MAPA INMUNOLOGICO")
end event

type cb_3 from picturebutton within w_vacunas
event mousemove pbm_mousemove
integer x = 4750
integer y = 868
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &d"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar Dosis [Alt+D]"
end type

event clicked;if dw_dosis.rowcount()=0 Then return
string  clug
double conta,nserv,fac,ld_fila

ld_fila=dw_dosis.getrow()
conta=dw_dosis.getitemnumber(ld_fila,'contador')
clug=dw_dosis.getitemstring(ld_fila,'clugar_his')
nserv=dw_dosis.getitemnumber(ld_fila,'nservicio')
If not isnull(conta) then 
	SELECT nfactura into :fac
	FROM ServiciosIngreso
	WHERE 
			(((ServiciosIngreso.Contador)=:conta) AND ((ServiciosIngreso.CLugar)=:clug) AND 
			((ServiciosIngreso.Nservicio)=:nserv));
	if SQLCA.SQLnRows = 0 then
		messageBox('Error','Leyendo servicios ingreso')
		Return -1
	end if
	If not isnull(fac) then
		messageBox('Error','No se puede anular esta facturado')
		Return -1
	end if

	delete from ServiciosIngreso WHERE  (((Contador)=:conta) AND ((CLugar)=:clug) AND ((Nservicio)=:nserv));
	IF SQLCA.SQLCode = -1 THEN
		messageBox('Error','Borrando servicios ingreso')
		Return -1
	end if
end if
dw_dosis.deleterow(ld_fila)
if dw_dosis.update()=-1 then
	rollback;
	dw_dosis.retrieve(histo,is_cod_vac)
else
	long ndosi 	
	 ndosi =dw_dosis.getitemnumber(1,'total_a')
	// actualizar a terminada
	if dw_dosis.rowcount()<>ndosi then
		dw_vac_pac.setitem(dw_vac_pac.getrow(),"estado",1)
		dw_vac_pac.update()
	end if
	commit;
end if
end event

type cb_2 from picturebutton within w_vacunas
event mousemove pbm_mousemove
integer x = 3479
integer y = 220
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &d"
boolean default = true
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nueva Dosis [Alt+D]"
end type

event clicked;long fila,interv,j,k
boolean	enc
datetime ldt_cuando
if dw_vac_pac.rowcount()=0 then return
fila=dw_vac_pac.getrow()
if dw_1.rowcount()<=0 then
	messagebox('Atención','No ha configurado las dosis de la vacuna')
	return
end if

If dw_dosis.rowcount() >= dw_vac_pac.getitemnumber(fila,'ndosis') then
	messagebox("Atención","Esta vacuna ya tiene todas sus dosis")
Else
	for j=1 to dw_1.rowcount()
		enc=false
		for k=1 to dw_dosis.rowcount()
			If dw_1.getitemnumber(j,'ndosis')=dw_dosis.getitemnumber(k,'ndosis') then
				enc=true
				exit
			End If
		Next
		if enc=false then 
			fila=dw_dosis.insertrow(0)
			dw_dosis.setitem(fila,"codvacuna",is_cod_vac)
			dw_dosis.setitem(fila,"historia",histo)
			dw_dosis.setitem(fila,"ndosis",j)
			interv=dw_1.getitemnumber(j,'intervalo')
			ldt_cuando=datetime(relativedate(today(),interv))
			dw_dosis.setitem(fila,"proxdosis",ldt_cuando)
			dw_dosis.setitem(fila,"intervalo",interv)
			dw_dosis.setitem(fila,"descripcion",dw_1.getitemstring(j,'descripcion'))
			dw_dosis.setitem(fila,"profe",g_profe)
			dw_dosis.setitem(fila,"clugar",clugar)
		end if
	Next
	if dw_dosis.update()<1 then
		rollback;
		dw_dosis.retrieve(histo,is_cod_vac)
	else
		commit;
	end if	
End If
dw_dosis.retrieve(histo,is_cod_vac)

end event

type cb_1 from picturebutton within w_vacunas
event mousemove pbm_mousemove
integer x = 3479
integer y = 356
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &e"
boolean default = true
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar vacuna [Alt+E]"
end type

event clicked;dw_vac_pac.deleterow(dw_vac_pac.getrow())
if dw_vac_pac.update() < 1 then
	rollback;
	dw_vac_pac.retrieve(histo)
else
	commit;
end if
end event

type dw_vacunas from datawindow within w_vacunas
integer x = 64
integer y = 44
integer width = 1838
integer height = 116
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_vacuna_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('codvacuna',idw)
end event

type dw_dosis from datawindow within w_vacunas
integer x = 59
integer y = 736
integer width = 4645
integer height = 1180
integer taborder = 40
string dragicon = "none!"
string dataobject = "dw_dosis_vac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;int lj
LONG interv
datetime ldt_cuando

if getcolumnname()='atender' then
	setitem(getrow(),"gestante","0")
	setitem(getrow(),"fechavac",today())
end if

if getcolumnname()='fechavac' or getcolumnname()='proxdosis' then
	for lj=row to dw_dosis.rowcount()
		interv=dw_dosis.getitemnumber(lj,'intervalo')
		ldt_cuando=datetime(relativedate(DATE(DATA),interv))
		dw_dosis.setitem(lj,"intervalo",interv)		
		if (lj +1) <=dw_dosis.rowcount() then
			dw_dosis.setitem(lj+1,"proxdosis",ldt_cuando)
		end if
	next
end if

if getcolumnname()='gestante' then
	if l_ges<>'1' then
		if getitemstring(getrow(),'gestante')='0' and data='1' then
			setitem(getrow(),"gestante","0")
		end if
		Messagebox("Atención","Esta Vacuna no permite aplicarse a Gestante")
	end if
end if
end event

event losefocus;accepttext()
end event

event constructor;getchild('profe',iprof)
iprof.settransobject(sqlca)
iprof.setfilter("vacunador='1'")
iprof.filter()
end event

event doubleclicked;if dwo.name="dx" then 
	st_edadsexo st_es
	st_diag st_d
	st_es.sexo='A'
	st_es.edad=0
	st_es.antece='0'
	st_es.proced='1'
	openwithparm(w_busca_diag,st_es)
	st_d=message.powerobjectparm
	if not isValid(st_d) then return
	if not isNull(st_d.codrip) then
		setitem(getrow(),'codgeral',st_d.codgeral)
		setitem(getrow(),'dx',st_d.codrip)
	end if
end if
end event

event rowfocuschanged;long fila
fila=this.rowcount()
if this.rowcount()<1 then return


if isnull(dw_dosis.getitemnumber(fila,'nfact')) or dw_dosis.getitemnumber(fila,'nfact')=0 then
	pb_4.enabled=true
else
	pb_4.enabled=false
end if

if isnull(dw_dosis.getitemnumber(fila,'contador')) or dw_dosis.getitemnumber(fila,'contador')=0 then
	pb_3.enabled=false
else
	pb_3.enabled=true
end if

end event

type dw_vac_pac from datawindow within w_vacunas
integer x = 64
integer y = 220
integer width = 3387
integer height = 480
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_vacu_pac"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long fila
fila=this.rowcount()
if this.rowcount()<1 then return
fila=this.getrow()
if fila<1 then return
is_cod_vac=this.getitemstring(fila,"codvacuna")
if not isnull(is_cod_vac) then
	l_sex=this.getitemstring(fila,'sexo')
	l_ges=this.getitemstring(fila,'gestante')
	l_cod_cups=this.getitemstring(fila,'cod_fact')
end if
dw_dosis.retrieve(histo,is_cod_vac)
dw_1.retrieve(is_cod_vac)
end event

type pb_2 from picturebutton within w_vacunas
event mousemove pbm_mousemove
integer x = 4750
integer y = 736
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Atender Procedimiento"
end type

event clicked;if dw_dosis.update()<1 then
	rollback;
	dw_dosis.retrieve(histo,is_cod_vac)
else
	commit;
	long ndosi 
	ndosi =dw_dosis.getitemnumber(dw_dosis.getrow(),'total_a')
	if dw_dosis.rowcount()=ndosi then
		dw_vac_pac.setitem(dw_vac_pac.getrow(),"estado",2)
		dw_vac_pac.update()
		commit;
	end if
end if
long j ,li_contador,nserv,nserv1

setnull(li_contador)
dw_historial.insertrow(1)

li_contador=f_trae_ndoc('HIS',clugar,'Historial')
nserv1=1
dw_historial.setitem(1,"fecha",datetime(today(),time(now())))
dw_historial.setitem(1,"tipodoc",tipdoc)
dw_historial.setitem(1,"documento",docu)
dw_historial.setitem(1,"indapdx",'6')
dw_historial.setitem(1,"contador",li_contador)
dw_historial.setitem(1,"clugar",clugar)
st_busca_emp_capit st_emp
openwithparm(w_escoge_empresa_citas,st_emp)
st_emp=message.powerobjectparm
if isvalid(st_emp) then
	IF ISNULL(st_emp.emp) then 
		messagebox('Atención','No hay empresa responsable empresa')
		return 0
	end if
end if


if dw_historial.update() = 1 then
	for j=1 to dw_dosis.rowcount()
		if dw_dosis.GetItemstring(j,'atender') = '1'  and  isnull(dw_dosis.GetItemnumber(j,'contador')) then
			nserv= f_insert_servicio(l_cod_cups,li_contador,clugar,dw_dosis.getitemstring(j,'profe'),dw_dosis.getitemdatetime(j,'fechavac'),nserv1,st_emp.emp,st_emp.cont,dw_dosis.getitemstring(j,'cod_modrel'))	
			if nserv>= 1 then
				if l_ges<>'1' then
					dw_dosis.SetItem(j,'gestante','0')	
				end if
				dw_dosis.SetItem(j,'realizado','1')
				dw_dosis.SetItem(j,'nservicio',nserv)
				dw_dosis.SetItem(j,'contador',li_contador)
				dw_dosis.SetItem(j,'clugar_his',cLugar)
				dw_dosis.SetItem(j,'codemp',st_emp.emp)
				dw_dosis.SetItem(j,'ccontrato',st_emp.cont)
				dw_dosis.SetItem(j,'desemp',st_emp.desemp)
				dw_dosis.SetItem(j,'descontrato',st_emp.descon)
				nserv1++
			else
				rollback;
				Return -1
			end if
		end if
	next
	if dw_dosis.Update() = -1 then
		rollback;
		Return -1
	else
		commit;
	end if
else
	dw_historial.deleterow(1)
	rollback;
end if
pb_3.enabled=true

end event

