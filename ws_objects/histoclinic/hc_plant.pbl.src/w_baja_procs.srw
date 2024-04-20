$PBExportHeader$w_baja_procs.srw
forward
global type w_baja_procs from window
end type
type pb_cancel from picturebutton within w_baja_procs
end type
type pb_ok from picturebutton within w_baja_procs
end type
type dw_2 from datawindow within w_baja_procs
end type
type st_2 from statictext within w_baja_procs
end type
type st_1 from statictext within w_baja_procs
end type
type st_esp from statictext within w_baja_procs
end type
type dw_1 from datawindow within w_baja_procs
end type
end forward

global type w_baja_procs from window
integer width = 3365
integer height = 1384
boolean titlebar = true
string title = "Procedimientos ordenados para una especialidad"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
dw_2 dw_2
st_2 st_2
st_1 st_1
st_esp st_esp
dw_1 dw_1
end type
global w_baja_procs w_baja_procs

type variables
st_xa_procs_hc i_st
end variables

on w_baja_procs.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_2=create dw_2
this.st_2=create st_2
this.st_1=create st_1
this.st_esp=create st_esp
this.dw_1=create dw_1
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.dw_2,&
this.st_2,&
this.st_1,&
this.st_esp,&
this.dw_1}
end on

on w_baja_procs.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_esp)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
select desesp into :st_esp.text from especialidades where codesp=:i_st.cesp;
dw_1.retrieve(i_st.contador,i_st.clug,i_st.cesp)
end event

type pb_cancel from picturebutton within w_baja_procs
integer x = 1536
integer y = 1152
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
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_baja_procs
integer x = 1376
integer y = 1152
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
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.find('esco=1',1,dw_1.rowcount())=0 then return
i_st.dw_procs.reset()
long j,k,l
string cufun,ccost
choose case i_st.tingres
	case '2'
		select uf_urg,cc_urg into :cufun,:ccost from espprof where codprof =: i_st.cprof and cesp=:i_st.cesp and espprof.estado='1' ;
	case '3'
		select uf_hosp,cc_hosp into :cufun,:ccost from espprof where codprof =: i_st.cprof and cesp=:i_st.cesp and espprof.estado='1' ;
	case '4'
		select uf_amb,cc_amb into :cufun,:ccost from espprof where codprof =: i_st.cprof and cesp=:i_st.cesp and espprof.estado='1' ;
end choose
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo espprof',sqlca.sqlerrtext)
	return
end if
if isnull(cufun) or isnull(ccost) then
	messagebox('Atención','La unidad funcional y/o el centro de costo del profesional/especialidad para este tipo de ingreso está en nulo' )
	return
end if
for j=1 to dw_1.rowcount()
	if dw_1.getitemnumber(j,'esco')=0 then continue
	dw_2.retrieve(dw_1.getitemstring(j,'codproced'))
	for k=1 to dw_1.getitemnumber(j,'atender')
		l=i_st.dw_procs.insertrow(0)
		i_st.dw_procs.setitem(l,'contador',i_st.contador)
		i_st.dw_procs.setitem(l,'clugar',i_st.clug)
		i_st.dw_procs.setitem(l,'cproced',dw_1.getitemstring(j,'codproced'))
		i_st.dw_procs.setitem(l,'descripcion',dw_1.getitemstring(j,'descripcion'))
		i_st.dw_procs.setitem(l,'cufuncional',cufun)
		i_st.dw_procs.setitem(l,'cccosto',ccost)
		i_st.dw_procs.setitem(l,'rips',dw_1.getitemstring(j,'rips'))
		i_st.dw_procs.setitem(l,'conta_orden',i_st.contador)
		i_st.dw_procs.setitem(l,'clug_orden',i_st.clug)
		i_st.dw_procs.setitem(l,'norden_serv',dw_1.getitemnumber(j,'nsolicitud'))
		i_st.dw_procs.setitem(l,'item_orden',dw_1.getitemnumber(j,'item'))
		i_st.dw_procs.setitem(l,'contador_hc',i_st.contador)
		i_st.dw_procs.setitem(l,'clugar_hc',i_st.clug)
		i_st.dw_procs.setitem(l,'item_hc',i_st.ncampo)
		i_st.dw_procs.setitem(l,'cprof',i_st.cprof)
		i_st.dw_procs.setitem(l,'fecha',i_st.fecha)
//		i_st.cesp
		i_st.dw_procs.setitem(l,'facturar',dw_1.getitemnumber(j,'facturar'))
		i_st.dw_procs.setitem(l,'r_tipodiagprin',dw_2.getitemstring(1,'r_tipodiagprin'))
		i_st.dw_procs.setitem(l,'r_diagprin',dw_2.getitemstring(1,'r_diagprin'))
		i_st.dw_procs.setitem(l,'r_causaexterna',dw_2.getitemstring(1,'r_causaexterna'))
		i_st.dw_procs.setitem(l,'r_fin_consulta',dw_2.getitemstring(1,'r_fin_consulta'))
		i_st.dw_procs.setitem(l,'r_diagrel1',dw_2.getitemstring(1,'r_diagrel1'))
		i_st.dw_procs.setitem(l,'r_diagrel2',dw_2.getitemstring(1,'r_diagrel2'))
		i_st.dw_procs.setitem(l,'r_diagcompli',dw_2.getitemstring(1,'r_diagcompli'))
		i_st.dw_procs.setitem(l,'r_tipo_actoqx',dw_2.getitemstring(1,'r_tipo_actoqx'))
		i_st.dw_procs.setitem(l,'r_ambitoproced',dw_2.getitemstring(1,'r_ambitoproced'))
		i_st.dw_procs.setitem(l,'r_finalidadproced',dw_2.getitemstring(1,'r_finalidadproced'))
		i_st.dw_procs.setitem(l,'cemp',i_st.cemp)
		i_st.dw_procs.setitem(l,'ccontrato',i_st.ccont)
	next
next
close(parent)
end event

type dw_2 from datawindow within w_baja_procs
boolean visible = false
integer x = 293
integer y = 1156
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_trae_rips"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_2 from statictext within w_baja_procs
integer x = 9
integer y = 128
integer width = 631
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos por atender:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_baja_procs
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
string text = "Especialidad:"
boolean focusrectangle = false
end type

type st_esp from statictext within w_baja_procs
integer y = 56
integer width = 3310
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_baja_procs
integer x = 5
integer y = 188
integer width = 3319
integer height = 948
integer taborder = 10
string title = "none"
string dataobject = "dw_lleva_os_hc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

