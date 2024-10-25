$PBExportHeader$w_new_at_os.srw
forward
global type w_new_at_os from window
end type
type dw_tip_ingres from datawindow within w_new_at_os
end type
type dw_inf from datawindow within w_new_at_os
end type
type pb_1 from picturebutton within w_new_at_os
end type
type pb_activos from picturebutton within w_new_at_os
end type
type st_3 from statictext within w_new_at_os
end type
type dw_historial from datawindow within w_new_at_os
end type
type st_1 from statictext within w_new_at_os
end type
type gb_2 from groupbox within w_new_at_os
end type
type uo_1 from uo_orden_formula_cost within w_new_at_os
end type
end forward

global type w_new_at_os from window
integer width = 7013
integer height = 2748
boolean titlebar = true
string title = "Atención de órdenes de Servicio"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "r_os.ico"
dw_tip_ingres dw_tip_ingres
dw_inf dw_inf
pb_1 pb_1
pb_activos pb_activos
st_3 st_3
dw_historial dw_historial
st_1 st_1
gb_2 gb_2
uo_1 uo_1
end type
global w_new_at_os w_new_at_os

type variables
long i_nh,i_norden,i_contador
string is_tipo_ingres,carga_revisa,i_clug_hadm,i_clug_his
boolean guardo
DataWindowChild Hab,Camas
datawindowchild dw_lista
String Pabellon, Habitacion, Cdemp, Ctemp,cama
end variables

forward prototypes
public subroutine rn ()
end prototypes

public subroutine rn ();string esparto
setnull(esparto)
SELECT Max(proced.parto) into :esparto
FROM HospAdmi, ServiciosIngreso, Proced
WHERE HospAdmi.NH=:i_nh AND HospAdmi.clugar=:i_clug_hadm AND HospAdmi.Contador=serviciosingreso.contador AND HospAdmi.clugar_his=serviciosingreso.clugar AND ServiciosIngreso.cproced=proced.codproced;
IF SQLCA.SQLCODE=-1 THEN 
	messagebox("Error leyendo proced",sqlca.sqlerrtext)
	return
end if
if not isnull(esparto) and esparto='1' and w_principal.dw_1.getitemstring(1,"sexo")='F' then
	uo_1.pb_rn.visible=true
	uo_1.pb_rn.enabled=true
else
	uo_1.pb_rn.visible=false
	uo_1.pb_rn.enabled=false
end if
end subroutine

on w_new_at_os.create
this.dw_tip_ingres=create dw_tip_ingres
this.dw_inf=create dw_inf
this.pb_1=create pb_1
this.pb_activos=create pb_activos
this.st_3=create st_3
this.dw_historial=create dw_historial
this.st_1=create st_1
this.gb_2=create gb_2
this.uo_1=create uo_1
this.Control[]={this.dw_tip_ingres,&
this.dw_inf,&
this.pb_1,&
this.pb_activos,&
this.st_3,&
this.dw_historial,&
this.st_1,&
this.gb_2,&
this.uo_1}
end on

on w_new_at_os.destroy
destroy(this.dw_tip_ingres)
destroy(this.dw_inf)
destroy(this.pb_1)
destroy(this.pb_activos)
destroy(this.st_3)
destroy(this.dw_historial)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.uo_1)
end on

type dw_tip_ingres from datawindow within w_new_at_os
integer x = 347
integer y = 184
integer width = 763
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
modify('codtingre.width=654')
getchild('codtingre',dw_lista)
dw_lista.setfilter('codtingre <>"1"')
dw_lista.modify('descripcion.width=654')
insertrow(1)
f_titulos_dw_gb(this,'ATOS',gb_2)
f_titulos_vent(parent,'ATOS')
string temp
if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "TINGRESO", Regstring!, temp)
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "TINGRESO", Regstring!, temp)
if temp='' then setnull(temp)
setitem(1,1,temp)
post event itemchanged(1,object.codtingre,temp)
end event

event itemchanged;dw_historial.reset()
accepttext()
is_tipo_ingres=gettext()
f_imprime=dw_lista.getitemstring(dw_lista.getrow(),'imprime')
dw_historial.retrieve(tipdoc,docu,is_tipo_ingres,clugar)
end event

type dw_inf from datawindow within w_new_at_os
integer width = 6894
integer height = 128
integer taborder = 110
string title = "none"
string dataobject = "dw_inf_emp_cama"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
f_titulos_dw(this,'ATOS')
end event

event retrieveend;do while this.rowcount()> 1
	this.deleterow(2)
loop
end event

type pb_1 from picturebutton within w_new_at_os
event mousemove pbm_mousemove
integer x = 1339
integer y = 160
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &d      "
boolean originalsize = true
string picturename = "jeringa busca.GIF"
string disabledname = "d_jeringa busca.GIF"
alignment htextalign = left!
string powertiptext = "Pacientes con Pruebas o Resultados Pendientes [Alt+D]"
end type

event clicked;if not f_hasta() then 
	messagebox("Atención","Su periodo de validez ha caducado, comuníquese con GCI Ltda. para reactivarlo")
	return
end if
if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
////////////// ojo para que no metan goles ^
openwithparm(w_paci_sinapdx,'os')

end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_activos from picturebutton within w_new_at_os
event mousemove pbm_mousemove
integer x = 1184
integer y = 160
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &s"
boolean originalsize = true
string picturename = "buscar.GIF"
string disabledname = "d_buscar.GIF"
alignment htextalign = left!
string powertiptext = "Mostrar Pacientes con Admisiones Activas [Alt+S]"
end type

event clicked;if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
openwithparm(w_hospitaliz,dw_tip_ingres.getitemstring(1,1))

end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type st_3 from statictext within w_new_at_os
integer x = 27
integer y = 292
integer width = 2967
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " Ingresos del Paciente"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_historial from datawindow within w_new_at_os
integer x = 27
integer y = 352
integer width = 2967
integer height = 488
integer taborder = 20
string title = "none"
string dataobject = "dw_admi_pasa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
f_titulos_dw_st(this,'ATOS',st_3)
end event

event rowfocuschanged;uo_1.reset()
dw_inf.reset()
if getrow()<1 then return
i_nh=getitemnumber(getrow(),"nh")
i_contador=getitemnumber(getrow(),'contador')
i_clug_hadm=getitemstring(getrow(),"clugar")
i_clug_his=getitemstring(getrow(),"clugar_his")
dw_inf.retrieve(i_nh,i_clug_hadm, is_tipo_ingres)
long nnulo
string snulo
if uo_1.retrieve(i_contador,i_clug_his,'',i_nh,i_clug_hadm,is_tipo_ingres,nnulo,snulo,nnulo,snulo)=-1 then return
rn()

end event

type st_1 from statictext within w_new_at_os
integer x = 32
integer y = 188
integer width = 311
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo &Ingreso:"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_new_at_os
integer x = 14
integer y = 120
integer width = 3008
integer height = 680
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Admisiones del paciente"
borderstyle borderstyle = styleraised!
end type

type uo_1 from uo_orden_formula_cost within w_new_at_os
integer y = 116
integer width = 6944
integer height = 2540
integer taborder = 50
string i_codrep_formula = "FH"
string i_codrep_orden = "OSHU"
end type

on uo_1.destroy
call uo_orden_formula_cost::destroy
end on

event constructor;call super::constructor;init('2')
end event

