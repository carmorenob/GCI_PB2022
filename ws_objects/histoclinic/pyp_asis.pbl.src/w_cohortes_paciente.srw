$PBExportHeader$w_cohortes_paciente.srw
forward
global type w_cohortes_paciente from window
end type
type mle_1 from multilineedit within w_cohortes_paciente
end type
type pb_terminar from picturebutton within w_cohortes_paciente
end type
type pb_new from picturebutton within w_cohortes_paciente
end type
type dw_historial from uo_datawindow within w_cohortes_paciente
end type
type dw_cohortes from uo_datawindow within w_cohortes_paciente
end type
end forward

global type w_cohortes_paciente from window
integer width = 4297
integer height = 2108
boolean titlebar = true
string title = "Cohortes Paciente"
boolean controlmenu = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
pb_terminar pb_terminar
pb_new pb_new
dw_historial dw_historial
dw_cohortes dw_cohortes
end type
global w_cohortes_paciente w_cohortes_paciente

type variables


end variables

on w_cohortes_paciente.create
this.mle_1=create mle_1
this.pb_terminar=create pb_terminar
this.pb_new=create pb_new
this.dw_historial=create dw_historial
this.dw_cohortes=create dw_cohortes
this.Control[]={this.mle_1,&
this.pb_terminar,&
this.pb_new,&
this.dw_historial,&
this.dw_cohortes}
end on

on w_cohortes_paciente.destroy
destroy(this.mle_1)
destroy(this.pb_terminar)
destroy(this.pb_new)
destroy(this.dw_historial)
destroy(this.dw_cohortes)
end on

event open;if isnull(w_principal.dw_1.getitemstring(1,'documento')) or w_principal.dw_1.getitemstring(1,'documento')="" then
	dw_cohortes.reset()
else
	dw_cohortes.retrieve(w_principal.dw_1.getitemstring(1,'tipodoc'),	w_principal.dw_1.getitemstring(1,'documento'))
end if
end event

type mle_1 from multilineedit within w_cohortes_paciente
integer x = 46
integer y = 656
integer width = 3973
integer height = 316
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type pb_terminar from picturebutton within w_cohortes_paciente
integer x = 4055
integer y = 160
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "anular_doc_3.gif"
alignment htextalign = left!
string powertiptext = "Sacar paciente de este Cohorte"
end type

event clicked;openwithparm(w_termina_cohorte,dw_cohortes.getitemstring(dw_cohortes.getrow(),'id_grupoetareo'))

if isvalid(message.powerobjectparm) then
	st_add_cohorte lst
	lst=message.powerobjectparm
	dw_historial.insertrow(1)
	dw_historial.setitem(1,'id_cohorte_pac',dw_cohortes.getitemnumber(dw_cohortes.getrow(),'id_cohorte_pac'))
	dw_historial.setitem(1,'consecutivo',dw_historial.getitemnumber(1,'maxim')+1)
	dw_historial.setitem(1,'fecha',lst.fecha_inicio)
	dw_historial.setitem(1,'observaciones',lst.observaciones)
	
	if dw_historial.update(true,false)=-1 then return
	
	dw_cohortes.setitem(dw_cohortes.getrow(),'fecha_termina',lst.fecha_inicio)
	dw_cohortes.setitem(dw_cohortes.getrow(),'estado','0')
	dw_cohortes.setitem(dw_cohortes.getrow(),'cod_anula',lst.cod_anula)
	dw_cohortes.setitem(dw_cohortes.getrow(),'usu_anula',usuario)
	
	if dw_cohortes.update(true,false)=-1 then
		rollback;
		return
	end if
	
	commit;
	
	dw_historial.resetupdate()
	dw_cohortes.resetupdate()
	
	
end if
end event

type pb_new from picturebutton within w_cohortes_paciente
integer x = 4059
integer y = 16
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
end type

event clicked;if isnull(w_principal.dw_1.getitemstring(1,'documento')) or trim(w_principal.dw_1.getitemstring(1,'documento'))="" then return

open(w_add_cohorte)
if isvalid(message.powerobjectparm) then
	st_add_cohorte lst
	lst=message.powerobjectparm
	
	long ll_donde,ll_id
	
	ll_donde=dw_cohortes.insertrow(0)
	
	dw_cohortes.setitem(ll_donde , 'tipodoc' , w_principal.dw_1.getitemstring(1,'tipodoc'))
	dw_cohortes.setitem(ll_donde , 'documento' , w_principal.dw_1.getitemstring(1,'documento'))
	dw_cohortes.setitem(ll_donde , 'id_grupoetareo' ,lst.id_getareo )
	dw_cohortes.setitem(ll_donde , 'desgetareo' ,lst.descrip_getareo )
	dw_cohortes.setitem(ll_donde , 'estado' ,'1' )
	dw_cohortes.setitem(ll_donde , 'fecha_registro' ,datetime(today(),now()) )
	dw_cohortes.setitem(ll_donde , 'ingreso_externo' ,'1' )
	dw_cohortes.setitem(ll_donde , 'vitalicio' ,lst.vitalicio )
	dw_cohortes.setitem(ll_donde , 'fecha_inicio' , lst.fecha_inicio )
	dw_cohortes.setitem(ll_donde , 'observaciones' , lst.observaciones)
	
	select coalesce(max(id_cohorte_pac),0)+1 into :ll_id from pacientes_cohortes;
	
	dw_cohortes.setitem(ll_donde,'id_cohorte_pac',ll_id)
	
	dw_cohortes.setrow(ll_donde)
	
	if dw_cohortes.update(true,false)=-1 then return
	
	commit;
	
	dw_cohortes.resetUpdate()
	
	mle_1.text=lst.observaciones
	
end if
end event

type dw_historial from uo_datawindow within w_cohortes_paciente
integer x = 37
integer y = 992
integer width = 3977
integer height = 752
integer taborder = 10
string dataobject = "dw_cohortes_historial"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_cohortes from uo_datawindow within w_cohortes_paciente
integer x = 37
integer y = 20
integer width = 3991
integer height = 616
integer taborder = 10
string dataobject = "dw_cohortes_paciente"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event rowfocuschanged;call super::rowfocuschanged;string sexo_pac
double dias_pac

dw_historial.reset()
if currentrow<1 then
	mle_1.text=''
else
	dias_pac=getitemnumber(currentrow,'edmin')
	dias_pac=getitemnumber(currentrow,'edmax')
	sexo_pac=getitemstring(currentrow,'sexo')
	
	sexo_pac=w_principal.dw_1.getitemstring(1,"sexo_t")
	dias_pac=w_principal.dw_1.getitemnumber(1,"dias")	
	if (dias_pac>=getitemnumber(currentrow,'edmin') and dias_pac<=getitemnumber(currentrow,'edmax')) and (getitemstring(currentrow,'sexo')='0' or getitemstring(currentrow,'sexo')=sexo_pac )  then
		pb_new.visible=true
	else
		pb_new.visible=false
	end if
	mle_1.text=getitemstring(currentrow,'observaciones')
	dw_historial.retrieve(getitemnumber(currentrow,'id_cohorte_pac'))
end if

end event

