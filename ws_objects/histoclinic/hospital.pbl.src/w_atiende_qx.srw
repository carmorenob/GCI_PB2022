$PBExportHeader$w_atiende_qx.srw
forward
global type w_atiende_qx from window
end type
type dw_admi from datawindow within w_atiende_qx
end type
type pb_1 from picturebutton within w_atiende_qx
end type
type st_1 from statictext within w_atiende_qx
end type
type dw_t_acto from datawindow within w_atiende_qx
end type
type sle_textdpqx from singlelineedit within w_atiende_qx
end type
type st_9 from statictext within w_atiende_qx
end type
type cb_dpqx from commandbutton within w_atiende_qx
end type
type sle_diagpqx from singlelineedit within w_atiende_qx
end type
type pb_save from picturebutton within w_atiende_qx
end type
type dw_segrespon from datawindow within w_atiende_qx
end type
type dw_new from datawindow within w_atiende_qx
end type
type tab_servicios from tab within w_atiende_qx
end type
type tabpage_1 from userobject within tab_servicios
end type
type sle_textdiag1 from singlelineedit within tabpage_1
end type
type dw_fina from datawindow within tabpage_1
end type
type gb_6 from groupbox within tabpage_1
end type
type st_8 from statictext within tabpage_1
end type
type st_7 from statictext within tabpage_1
end type
type st_6 from statictext within tabpage_1
end type
type dw_serv_ing from datawindow within tabpage_1
end type
type gb_2 from groupbox within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type cb_diag1 from commandbutton within tabpage_1
end type
type st_10 from statictext within tabpage_1
end type
type cb_diag2 from commandbutton within tabpage_1
end type
type sle_diag2 from singlelineedit within tabpage_1
end type
type st_11 from statictext within tabpage_1
end type
type cb_diag3 from commandbutton within tabpage_1
end type
type sle_diag3 from singlelineedit within tabpage_1
end type
type sle_diag1 from singlelineedit within tabpage_1
end type
type tabpage_1 from userobject within tab_servicios
sle_textdiag1 sle_textdiag1
dw_fina dw_fina
gb_6 gb_6
st_8 st_8
st_7 st_7
st_6 st_6
dw_serv_ing dw_serv_ing
gb_2 gb_2
st_3 st_3
cb_diag1 cb_diag1
st_10 st_10
cb_diag2 cb_diag2
sle_diag2 sle_diag2
st_11 st_11
cb_diag3 cb_diag3
sle_diag3 sle_diag3
sle_diag1 sle_diag1
end type
type tab_servicios from tab within w_atiende_qx
tabpage_1 tabpage_1
end type
type dw_cont_det from datawindow within w_atiende_qx
end type
type gb_3 from groupbox within w_atiende_qx
end type
type dw_getareo from datawindow within w_atiende_qx
end type
end forward

global type w_atiende_qx from window
integer width = 4443
integer height = 1632
boolean titlebar = true
string title = "Atender Procedimientos Quirúrgicos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "bisturi.ico"
string pointer = "Arrow!"
integer unitsperline = 10
integer linesperpage = 10
integer unitspercolumn = 10
integer columnsperpage = 10
boolean center = true
dw_admi dw_admi
pb_1 pb_1
st_1 st_1
dw_t_acto dw_t_acto
sle_textdpqx sle_textdpqx
st_9 st_9
cb_dpqx cb_dpqx
sle_diagpqx sle_diagpqx
pb_save pb_save
dw_segrespon dw_segrespon
dw_new dw_new
tab_servicios tab_servicios
dw_cont_det dw_cont_det
gb_3 gb_3
dw_getareo dw_getareo
end type
global w_atiende_qx w_atiende_qx

type variables
long i_contador,i_consec,i_nservicio,i_nh,i_norden
boolean pide_conf
string manual,i_tipo_ingres,i_clugar_his,i_clugar_acto,i_clugar_hadm,i_estado_adm
string carga_revisa
datawindowchild i_dw_esp
datastore ids_osd

end variables

forward prototypes
public subroutine f_rev_estados (boolean todos)
end prototypes

public subroutine f_rev_estados (boolean todos);long j,desde,hasta
if todos then
	desde=1
	hasta=ids_osd.rowcount()
else
	desde=tab_servicios.tabpage_1.dw_serv_ing.getrow()
	hasta=desde
end if
for j=desde to hasta
	if j>ids_osd.rowcount() or dw_t_acto.rowcount()<1 or j=0 then continue
	if not isnull(dw_t_acto.getitemstring(1,1)) and ids_osd.getitemstring(j,'finalidad')<>'' and ids_osd.getitemstring(j,'diagprin')<>'' then
		tab_servicios.tabpage_1.dw_serv_ing.setitem(j,'estria','1')
	else
		tab_servicios.tabpage_1.dw_serv_ing.setitem(j,'estria','2')
	end if
next
end subroutine

on w_atiende_qx.create
this.dw_admi=create dw_admi
this.pb_1=create pb_1
this.st_1=create st_1
this.dw_t_acto=create dw_t_acto
this.sle_textdpqx=create sle_textdpqx
this.st_9=create st_9
this.cb_dpqx=create cb_dpqx
this.sle_diagpqx=create sle_diagpqx
this.pb_save=create pb_save
this.dw_segrespon=create dw_segrespon
this.dw_new=create dw_new
this.tab_servicios=create tab_servicios
this.dw_cont_det=create dw_cont_det
this.gb_3=create gb_3
this.dw_getareo=create dw_getareo
this.Control[]={this.dw_admi,&
this.pb_1,&
this.st_1,&
this.dw_t_acto,&
this.sle_textdpqx,&
this.st_9,&
this.cb_dpqx,&
this.sle_diagpqx,&
this.pb_save,&
this.dw_segrespon,&
this.dw_new,&
this.tab_servicios,&
this.dw_cont_det,&
this.gb_3,&
this.dw_getareo}
end on

on w_atiende_qx.destroy
destroy(this.dw_admi)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.dw_t_acto)
destroy(this.sle_textdpqx)
destroy(this.st_9)
destroy(this.cb_dpqx)
destroy(this.sle_diagpqx)
destroy(this.pb_save)
destroy(this.dw_segrespon)
destroy(this.dw_new)
destroy(this.tab_servicios)
destroy(this.dw_cont_det)
destroy(this.gb_3)
destroy(this.dw_getareo)
end on

event open;ids_osd=message.powerobjectparm
pide_conf=true
dw_admi.retrieve(ids_osd.getitemnumber(1,'nh'),ids_osd.getitemstring(1,'clug_hadm'))
if dw_admi.rowcount()=0 then 
	messagebox("Advertencia","Paciente no tiene la empresa de la admisión asignada, asignela en la ficha de Datos generales del Paciente")
	return
end if
string emp,cont
i_nh=ids_osd.getitemnumber(1,'nh')
i_clugar_hadm=ids_osd.getitemstring(1,'clug_hadm')
i_tipo_ingres=ids_osd.getitemstring(1,'tingre')
i_contador=ids_osd.getitemnumber(1,'contador')
i_clugar_his=ids_osd.getitemstring(1,'clug_his')
i_norden=ids_osd.getitemnumber(1,'norden')
emp=dw_admi.getitemstring(1,"cemp")
cont=dw_admi.getitemstring(1,"ccontrato")
dw_cont_det.retrieve(emp,cont,i_tipo_ingres)
long fila,donde
dw_new.setitem(1,'fechainicio',datetime(today(),time("00:00")))
dw_new.setitem(1,'horainicio',datetime(date("1/1/1900"),time(string(now()))))
dw_new.setitem(1,'fechafin',datetime(today(),time("00:00")))
dw_new.setitem(1,'horafin',datetime(date("1/1/1900"),relativetime(time(string(now())),1200)))
dw_new.setitem(1,"viaingreso",i_tipo_ingres)
dw_new.setitem(1,"tipodoc",tipdoc)
dw_new.setitem(1,"documento",docu)
dw_new.setitem(1,"usuario",usuario)
dw_new.setitem(1,"cemp",emp)
dw_new.setitem(1,"ccontrato",cont)
dw_new.setitem(1,"contador",i_contador)
dw_new.setitem(1,"clugar_his",i_clugar_his)
dw_new.setitem(1,"clugar",clugar)
dw_new.setitem(1,"nh",i_nh)
dw_new.setitem(1,"viaingreso",i_tipo_ingres)
dw_new.setitem(1,"clugar_hadm",i_clugar_hadm)
i_clugar_acto=clugar
end event

event close;long j
select count(item) into :j from oscuerpo
where contador=:i_contador and clugar=:i_clugar_his and nsolicitud=:i_norden and estado='1';
if j=0 then 
	update oscabeza set estado='2' 
	where contador=:i_contador and clugar=:i_clugar_his and nsolicitud=:i_norden;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando estado de orden de servicio",sqlca.sqlerrtext)
		rollback;
		return
	end if
	commit;
	W_new_AT_OS.dw_historial.triggerevent(rowfocuschanged!)
end if


end event

type dw_admi from datawindow within w_atiende_qx
boolean visible = false
integer x = 2629
integer y = 1416
integer width = 686
integer height = 84
integer taborder = 50
string title = "none"
string dataobject = "dw_admi_actual"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_1 from picturebutton within w_atiende_qx
integer x = 1902
integer y = 1392
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
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type st_1 from statictext within w_atiende_qx
integer x = 3232
integer y = 140
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
string text = "Tipo Acto:"
boolean focusrectangle = false
end type

type dw_t_acto from datawindow within w_atiende_qx
integer x = 3205
integer y = 48
integer width = 1189
integer height = 92
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_tipoacto"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)

end event

event itemchanged;accepttext()
f_rev_estados(true)
end event

type sle_textdpqx from singlelineedit within w_atiende_qx
integer x = 430
integer y = 220
integer width = 3968
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_atiende_qx
integer x = 2843
integer y = 132
integer width = 283
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diag Pre-Qx"
boolean focusrectangle = false
end type

type cb_dpqx from commandbutton within w_atiende_qx
integer x = 3063
integer y = 56
integer width = 87
integer height = 72
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;if tab_servicios.tabpage_1.dw_serv_ing.rowcount()=0 then return
st_edadsexo st_es
st_diag st_d
st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
st_es.antece='0'
openwithparm(w_busca_diag,st_es)
st_d=message.powerobjectparm
if not isValid(st_d) then return
if not isNull(st_d.codrip) then
	sle_diagpqx.tag=st_d.codgeral
	sle_diagpqx.text=st_d.codrip
	sle_textdpqx.text=st_d.descripcion
end if
end event

type sle_diagpqx from singlelineedit within w_atiende_qx
integer x = 2839
integer y = 56
integer width = 206
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

event modified;string nulo
setnull(nulo)
if (isnull(this.text) or this.text="") then
	sle_textdpqx.text=""
	setnull(this.tag)
	dw_new.setitem(1,'dx_preqx',nulo)
	return
end if
if tab_servicios.tabpage_1.dw_serv_ing.rowcount()=0 then return
string este
st_return_diags st

este=this.tag
if isnull(este) or este<>this.text then este=''
st=f_check_diag(this.text,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0')
if st.descrip_diag="" then 
	this.text =  ""
	this.tag=nulo
	sle_textdpqx.text =""
else
	this.tag=este
	sle_textdpqx.text=st.descrip_diag
end if
dw_new.setitem(1,'dx_preqx',tag)
end event

type pb_save from picturebutton within w_atiende_qx
event mousemove pbm_mousemove
string tag = "Guardar datos de Tiempos"
integer x = 1733
integer y = 1392
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
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Cirugías Atendidas"
end type

event clicked;if isnull(dw_new.getitemstring(1,'codigosala')) then
	messagebox("Atención",'Elija la sala')
	return
end if
f_rev_estados(false)
long fila,ningres,j
setnull(ningres)
select max(numero_ingre) into :ningres from qxcabacto where clugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo qxcabacto",sqlca.sqlerrtext)
	rollback;
	return
end if
if isnull(ningres) then ningres=0
ningres++
dw_new.setitem(1,"numero_ingre",ningres)
if dw_new.update()=-1 then
	rollback;
	return
end if
datawindow dw
dw=tab_servicios.tabpage_1.dw_serv_ing
long nserv,norden,nitemorden,facturar
string ambito,cproced,cprocedeq,cmanual,cemp,ccontrato,cplan,crips,cprof,nautor,estria,cesp,dprin,drel1,drel2
string fina,t_acto
datetime hoy
choose case i_tipo_ingres
	case '2'//urg
		ambito='3'
	case '3','7'//hosp
		ambito='2'
	case '4'//amb
		ambito='1'
end choose
for j=1 to dw.rowcount()
	select max(nservicio) into :nserv from serviciosingreso where contador=:i_contador and clugar=:i_clugar_his;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo ServiciosIngreso",sqlca.sqlerrtext)
		rollback;
		return
	end if
	if isnull(nserv) then nserv=0
	nserv++
	cproced=dw.getitemstring(j,'proccups')
	cprocedeq=dw.getitemstring(j,'cproced')
	cmanual=dw.getitemstring(j,'cmanual')
	cemp=dw.getitemstring(j,'cemp')
	ccontrato=dw.getitemstring(j,'ccontrato')
	cplan=dw.getitemstring(j,'cplan')
	crips=dw.getitemstring(j,'crias')
	cprof=dw.getitemstring(j,'especialista')
	hoy=dw_new.getitemdatetime(1,'fechainicio')
	nautor=dw.getitemstring(j,'nautoriza')
	estria=dw.getitemstring(j,'estria')
	cesp=dw.getitemstring(j,'cesp')
	norden=ids_osd.getitemnumber(j,'norden')
	nitemorden=ids_osd.getitemnumber(j,'nitem')
	facturar=ids_osd.getitemnumber(j,'facturar')
	dprin=ids_osd.getitemstring(j,'diagprin')
	drel1=ids_osd.getitemstring(j,'diagrel1')
	drel2=ids_osd.getitemstring(j,'diagrel2')
	fina=ids_osd.getitemstring(j,'finalidad')
	t_acto=dw_t_acto.getitemstring(1,1)
	insert into serviciosingreso (contador,clugar,nservicio,cproced,cprocedeq,cmanual,cemp,ccontrato,cplan,rips,cprof,fecha,cantidad,nautoriza,estria,ambitoproced,CodEspecialidad,usuario,persoatiende,norden,tipo_orden,facturar,diagprin,diagrel1,diagrel2,finalidadproced,tipo_actoqx,conta_orden,clug_orden,norden_serv,item_orden)
	values 	(:i_contador,:i_clugar_his,:nserv,:cproced,:cprocedeq,:cmanual,:cemp,:ccontrato,:cplan,:crips,:cprof,:hoy,1,:nautor,:estria,:ambito,:cesp,:usuario,'1',:norden,'H',:facturar,:dprin,:drel1,:drel2,:fina,:t_acto,:i_contador,:i_clugar_his,:norden,:nitemorden);
	if sqlca.sqlcode<0 then
		messagebox("Error insertando registro en ServiciosIngreso",sqlca.sqlerrtext)
		rollback;
		return
	end if
	dw.setitem(j,'numero',ningres)
	dw.setitem(j,'consecutivo',j)
	dw.setitem(j,'clugar',clugar)
	dw.setitem(j,"contador",i_contador)
	dw.setitem(j,"nservicio",nserv)
	dw.setitem(j,"clugar",i_clugar_acto)
	dw.setitem(j,"clugar_ser",i_clugar_his)
	update oscuerpo set suministrada=solicitada , estado='2'
	where contador=:i_contador and clugar=:i_clugar_his and nsolicitud=:norden and item=:nitemorden;
	if sqlca.sqlcode<0 then
		messagebox("Error actualizando OSCuerpo",sqlca.sqlerrtext)
		rollback;
		return
	end if
next
if dw.update()=-1 then
	rollback;
	return
end if
commit;
//w_atiende_os.dw_orden.triggerevent(rowfocuschanged!)
close(parent)
end event

type dw_segrespon from datawindow within w_atiende_qx
boolean visible = false
integer x = 795
integer y = 1404
integer width = 302
integer height = 100
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_segrespon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_new from datawindow within w_atiende_qx
integer x = 55
integer y = 48
integer width = 2779
integer height = 136
integer taborder = 20
string title = "none"
string dataobject = "dw_nuevo_acto_qx"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)

end event

type tab_servicios from tab within w_atiende_qx
event mousemove pbm_mousemove
integer x = 14
integer y = 208
integer width = 4379
integer height = 1172
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_servicios.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_servicios.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_servicios
integer x = 18
integer y = 112
integer width = 4343
integer height = 1044
string dragicon = "none!"
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Cirugias"
long tabtextcolor = 33554432
string picturename = "bisturi.ico"
long picturemaskcolor = 536870912
string powertiptext = "Registro de Cirugías a Realizar por Acto"
sle_textdiag1 sle_textdiag1
dw_fina dw_fina
gb_6 gb_6
st_8 st_8
st_7 st_7
st_6 st_6
dw_serv_ing dw_serv_ing
gb_2 gb_2
st_3 st_3
cb_diag1 cb_diag1
st_10 st_10
cb_diag2 cb_diag2
sle_diag2 sle_diag2
st_11 st_11
cb_diag3 cb_diag3
sle_diag3 sle_diag3
sle_diag1 sle_diag1
end type

on tabpage_1.create
this.sle_textdiag1=create sle_textdiag1
this.dw_fina=create dw_fina
this.gb_6=create gb_6
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.dw_serv_ing=create dw_serv_ing
this.gb_2=create gb_2
this.st_3=create st_3
this.cb_diag1=create cb_diag1
this.st_10=create st_10
this.cb_diag2=create cb_diag2
this.sle_diag2=create sle_diag2
this.st_11=create st_11
this.cb_diag3=create cb_diag3
this.sle_diag3=create sle_diag3
this.sle_diag1=create sle_diag1
this.Control[]={this.sle_textdiag1,&
this.dw_fina,&
this.gb_6,&
this.st_8,&
this.st_7,&
this.st_6,&
this.dw_serv_ing,&
this.gb_2,&
this.st_3,&
this.cb_diag1,&
this.st_10,&
this.cb_diag2,&
this.sle_diag2,&
this.st_11,&
this.cb_diag3,&
this.sle_diag3,&
this.sle_diag1}
end on

on tabpage_1.destroy
destroy(this.sle_textdiag1)
destroy(this.dw_fina)
destroy(this.gb_6)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.dw_serv_ing)
destroy(this.gb_2)
destroy(this.st_3)
destroy(this.cb_diag1)
destroy(this.st_10)
destroy(this.cb_diag2)
destroy(this.sle_diag2)
destroy(this.st_11)
destroy(this.cb_diag3)
destroy(this.sle_diag3)
destroy(this.sle_diag1)
end on

type sle_textdiag1 from singlelineedit within tabpage_1
integer x = 59
integer y = 900
integer width = 3323
integer height = 76
integer taborder = 16
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_fina from datawindow within tabpage_1
integer x = 32
integer y = 576
integer width = 951
integer height = 92
integer taborder = 11
string title = "none"
string dataobject = "dw_combo_tipoproc"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
this.setitem(1,1,'2')
end event

event itemchanged;accepttext()
ids_osd.setitem(dw_serv_ing.getrow(),'finalidad',data)
f_rev_estados(false)
end event

type gb_6 from groupbox within tabpage_1
integer x = 23
integer y = 516
integer width = 974
integer height = 188
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Finalidad del Procedimiento:"
end type

type st_8 from statictext within tabpage_1
integer x = 1637
integer y = 588
integer width = 251
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 10789024
long backcolor = 16777215
string text = "Anulado"
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_1
integer x = 1371
integer y = 588
integer width = 251
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "Completo"
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_1
integer x = 1106
integer y = 592
integer width = 251
integer height = 48
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 255
long backcolor = 16777215
string text = "Incompleto"
boolean focusrectangle = false
end type

type dw_serv_ing from datawindow within tabpage_1
event keypres pbm_dwnkey
integer x = 18
integer y = 40
integer width = 4302
integer height = 448
integer taborder = 20
string dragicon = "none!"
boolean bringtotop = true
string dataobject = "dw_cuerpo_acto_qx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypres;if key<>keydelete! then return
choose case getcolumnName()
	case 'anestesiologo','auxiliarqx','circulante','instrumenta'
		string nulo
		setnull(nulo)
		setitem(getrow(),getcolumnName(),nulo)
end choose
end event

event rowfocuschanged;long fila
fila=this.getrow()
if fila<1 then return
i_dw_esp.retrieve(this.getitemstring(fila,"especialista"))
dw_fina.setitem(1,1,ids_osd.getitemstring(fila,'finalidad'))
sle_diag1.tag=ids_osd.getitemstring(fila,'diagprin')
sle_diag1.text=ids_osd.getitemstring(fila,'diagprinp')
sle_diag2.tag=ids_osd.getitemstring(fila,'diagrel1')
sle_diag2.text=ids_osd.getitemstring(fila,'diagrel1p')
sle_diag3.tag=ids_osd.getitemstring(fila,'diagrel2')
sle_diag3.text=ids_osd.getitemstring(fila,'diagrel1p')
sle_textdiag1.text=''
end event

event itemchanged;this.accepttext()
if this.getcolumnname()='especialista' then
	if i_dw_esp.retrieve(data)>0 then
		this.setitem(row,'cesp',i_dw_esp.getitemstring(1,'cesp'))
		this.setitem(row,'des_esp',i_dw_esp.getitemstring(1,'desesp'))
		this.accepttext()
	end if
end if
if this.getcolumnname()='des_esp' then
	this.setitem(row,'cesp',i_dw_esp.getitemstring(i_dw_esp.getrow(),'cesp'))
	this.accepttext()
end if
end event

event constructor;this.getchild("des_esp",i_dw_esp)
i_dw_esp.settransobject(sqlca)
i_dw_esp.insertrow(1)
this.settransobject(sqlca)
end event

event rowfocuschanging;if currentrow<1 then return
ids_osd.setitem(currentrow,'finalidad',dw_fina.getitemstring(1,1))
ids_osd.setitem(currentrow,'diagprin',sle_diag1.tag)
ids_osd.setitem(currentrow,'diagprinp',sle_diag1.text)
ids_osd.setitem(currentrow,'diagrel1',sle_diag2.tag)
ids_osd.setitem(currentrow,'diagrel1p',sle_diag2.text)
ids_osd.setitem(currentrow,'diagrel2',sle_diag3.tag)
ids_osd.setitem(currentrow,'diagrel1p',sle_diag3.text)
end event

type gb_2 from groupbox within tabpage_1
integer x = 1070
integer y = 532
integer width = 869
integer height = 132
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long backcolor = 80269524
string text = "Convenciones RIPS"
end type

type st_3 from statictext within tabpage_1
integer x = 69
integer y = 804
integer width = 475
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnóstico Principal:"
boolean focusrectangle = false
end type

type cb_diag1 from commandbutton within tabpage_1
integer x = 302
integer y = 716
integer width = 101
integer height = 88
integer taborder = 15
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;if tab_servicios.tabpage_1.dw_serv_ing.rowcount()=0 then return
st_edadsexo st_es
st_diag st_d
st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
st_es.antece='0'
openwithparm(w_busca_diag,st_es)
st_d=message.powerobjectparm
if not isValid(st_d) then return
if not isNull(st_d.codrip) then
	sle_diag1.tag=st_d.codgeral
	sle_diag1.text=st_d.codrip
	sle_textdiag1.text=st_d.descripcion
end if
end event

type st_10 from statictext within tabpage_1
integer x = 1033
integer y = 796
integer width = 608
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnostico relacionado1:"
boolean focusrectangle = false
end type

type cb_diag2 from commandbutton within tabpage_1
integer x = 1262
integer y = 708
integer width = 101
integer height = 88
integer taborder = 17
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;if tab_servicios.tabpage_1.dw_serv_ing.rowcount()=0 then return
st_edadsexo st_es
st_diag st_d
st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
st_es.antece='0'
openwithparm(w_busca_diag,st_es)
st_d=message.powerobjectparm
if not isValid(st_d) then return
if not isNull(st_d.codrip) then
	sle_diag2.tag=st_d.codgeral
	sle_diag2.text=st_d.codrip
	sle_textdiag1.text=st_d.descripcion
end if
end event

type sle_diag2 from singlelineedit within tabpage_1
integer x = 1033
integer y = 720
integer width = 206
integer height = 76
integer taborder = 18
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

event modified;if (isnull(this.text) or this.text="")  then 
	sle_textdiag1.text=""
	setnull(this.tag)
	ids_osd.setitem(dw_serv_ing.getrow(),'diagrel1',tag)
	ids_osd.setitem(dw_serv_ing.getrow(),'diagrel1p',text)
	f_rev_estados(false)
	return
end if
if tab_servicios.tabpage_1.dw_serv_ing.rowcount()=0 then return
string este
st_return_diags st

este=this.tag
if isnull(este) or este<>this.text then este=''
st=f_check_diag(this.text,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0')
if st.descrip_diag="" then 
	this.text =  ""
	this.tag=''
	sle_textdiag1.text =""
else
	this.tag=este
	sle_textdiag1.text=st.descrip_diag
end if
ids_osd.setitem(dw_serv_ing.getrow(),'diagrel1',tag)
ids_osd.setitem(dw_serv_ing.getrow(),'diagrel1p',text)
f_rev_estados(false)
end event

event getfocus;string este
st_return_diags st

este=this.tag
if isnull(este) or este='' then 
	sle_textdiag1.text =""
	return
end if
st=f_check_diag(this.text,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0')
if st.descrip_diag="" then 
	this.text =  ""
	this.tag=''
	sle_textdiag1.text =""
else
	sle_textdiag1.text=st.descrip_diag
end if
end event

type st_11 from statictext within tabpage_1
integer x = 2194
integer y = 788
integer width = 622
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diag rel2 o de complicacion:"
boolean focusrectangle = false
end type

type cb_diag3 from commandbutton within tabpage_1
integer x = 2414
integer y = 704
integer width = 101
integer height = 88
integer taborder = 19
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;if tab_servicios.tabpage_1.dw_serv_ing.rowcount()=0 then return
st_edadsexo st_es
st_diag st_d
st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
st_es.antece='0'
openwithparm(w_busca_diag,st_es)
st_d=message.powerobjectparm
if not isValid(st_d) then return
if not isNull(st_d.codrip) then
	sle_diag1.tag=st_d.codgeral
	sle_diag3.text=st_d.codrip
	sle_textdiag1.text=st_d.descripcion
end if
end event

type sle_diag3 from singlelineedit within tabpage_1
integer x = 2194
integer y = 708
integer width = 206
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

event modified;if (isnull(this.text) or this.text="") then 
	sle_textdiag1.text=""
	setnull(this.tag)
	ids_osd.setitem(dw_serv_ing.getrow(),'diagrel2',tag)
	ids_osd.setitem(dw_serv_ing.getrow(),'diagrel2p',text)
	f_rev_estados(false)
	return
end if
if tab_servicios.tabpage_1.dw_serv_ing.rowcount()=0 then return
string este
st_return_diags st

este=this.tag
if isnull(este) or este<>this.text then este=''
st=f_check_diag(this.text,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0')
if st.descrip_diag="" then 
	this.text =  ""
	this.tag=''
	sle_textdiag1.text =""
else
	this.tag=este
	sle_textdiag1.text=st.descrip_diag
end if
ids_osd.setitem(dw_serv_ing.getrow(),'diagrel2',tag)
ids_osd.setitem(dw_serv_ing.getrow(),'diagrel2p',text)
f_rev_estados(false)
end event

event getfocus;string este
st_return_diags st

este=this.tag
if isnull(este) or este='' then 
	sle_textdiag1.text =""
	return
end if
st=f_check_diag(this.text,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0')
if st.descrip_diag="" then 
	this.text =  ""
	this.tag=''
	sle_textdiag1.text =""
else
	sle_textdiag1.text=st.descrip_diag
end if
end event

type sle_diag1 from singlelineedit within tabpage_1
integer x = 69
integer y = 724
integer width = 206
integer height = 76
integer taborder = 16
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

event modified;if (isnull(this.text) or this.text="") then
	sle_textdiag1.text=""
	setnull(this.tag)
	ids_osd.setitem(dw_serv_ing.getrow(),'diagprin','')
	ids_osd.setitem(dw_serv_ing.getrow(),'diagprinp','')
	f_rev_estados(false)
	return
end if
if dw_serv_ing.rowcount()=0 then return
string este
st_return_diags st

este=this.tag
if isnull(este) or este<>this.text then este=''
st=f_check_diag(this.text,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0')
if st.descrip_diag="" then 
	text =  ""
	tag=''
	sle_textdiag1.text =""
else
	tag=este
	sle_textdiag1.text=st.descrip_diag
end if
ids_osd.setitem(dw_serv_ing.getrow(),'diagprin',tag)
ids_osd.setitem(dw_serv_ing.getrow(),'diagprinp',text)
f_rev_estados(false)
end event

event getfocus;string este
st_return_diags st

este=this.tag
if isnull(este) or este='' then 
	sle_textdiag1.text =""
	return
end if
st=f_check_diag(this.text,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0')
if st.descrip_diag="" then 
	this.text =  ""
	this.tag=''
	sle_textdiag1.text =""
else
	sle_textdiag1.text=st.descrip_diag
end if
end event

type dw_cont_det from datawindow within w_atiende_qx
boolean visible = false
integer x = 3419
integer y = 1396
integer width = 439
integer height = 112
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cont_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.setfilter("es_medica='0'")
this.filter()
IF rowcount>0 then 
	int i 
	for i=1 to  rowcount()
		manual="'"+this.getitemstring(i,"codmanual")+"',"
	next
else
	messagebox("Atención","El contrato de este empresa no tiene planes de procedimientos configurados")
end if	
	
end event

type gb_3 from groupbox within w_atiende_qx
integer x = 9
integer width = 3195
integer height = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "Datos nuevo Ingreso a Sala"
borderstyle borderstyle = styleraised!
end type

type dw_getareo from datawindow within w_atiende_qx
boolean visible = false
integer x = 3922
integer y = 1400
integer width = 379
integer height = 116
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_getareo_cumple"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;this.settransobject(sqlca)
end event

