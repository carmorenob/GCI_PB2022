$PBExportHeader$w_lleva_factu_cons.srw
forward
global type w_lleva_factu_cons from window
end type
type pb_cancel from picturebutton within w_lleva_factu_cons
end type
type pb_acep from picturebutton within w_lleva_factu_cons
end type
type st_1 from statictext within w_lleva_factu_cons
end type
type dw_trae from datawindow within w_lleva_factu_cons
end type
end forward

global type w_lleva_factu_cons from window
integer width = 3282
integer height = 1404
boolean titlebar = true
string title = "Llevar procedimientos de Facturación a Consultorio (Facturas sin Cita)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Query5!"
boolean clientedge = true
boolean center = true
pb_cancel pb_cancel
pb_acep pb_acep
st_1 st_1
dw_trae dw_trae
end type
global w_lleva_factu_cons w_lleva_factu_cons

type variables
uo_serv_ing uo_serv

end variables

on w_lleva_factu_cons.create
this.pb_cancel=create pb_cancel
this.pb_acep=create pb_acep
this.st_1=create st_1
this.dw_trae=create dw_trae
this.Control[]={this.pb_cancel,&
this.pb_acep,&
this.st_1,&
this.dw_trae}
end on

on w_lleva_factu_cons.destroy
destroy(this.pb_cancel)
destroy(this.pb_acep)
destroy(this.st_1)
destroy(this.dw_trae)
end on

event open;uo_serv = Message.PowerObjectParm
if uo_serv.i_interface=1 then
	title='Llevar procedimientos de Facturación (Facturas sin Cita) a Consultorio'
	dw_trae.dataobject='dw_factura_a_consult'
else
	title='Llevar procedimientos desde Recibos de Caja (recibos sin Cita) a Consultorio'
	dw_trae.dataobject='dw_recibo_a_consult'
end if
if uo_serv.i_indapdx='5' then
	title+=' Odontológico'
	dw_trae.SetFilter('odonconsul="1"')
	dw_trae.Filter()
end if
dw_trae.settransobject(sqlca)
dw_trae.retrieve(tipdoc,docu)

end event

type pb_cancel from picturebutton within w_lleva_factu_cons
integer x = 1595
integer y = 1148
integer width = 146
integer height = 128
integer taborder = 20
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

type pb_acep from picturebutton within w_lleva_factu_cons
integer x = 1417
integer y = 1148
integer width = 146
integer height = 128
integer taborder = 20
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

event clicked;long j,cuantos,k,hasta,fila
boolean new_ingreso = FALSE
if dw_trae.accepttext()=-1 then return
for j= 1 to dw_trae.rowcount()
	if dw_trae.GetItemNumber(j,"esco")>0 then
		long alli
		alli = uo_serv.idw_emppac.Find("codemp='"+dw_trae.getitemstring(j,"cemp")+"' and codcontrato='"+dw_trae.getitemstring(j,"ccontrato")+"'",1,uo_serv.idw_emppac.rowcount())
		if alli = 0 then
			MessageBox("Error de paciente","Este paciente ya no tiene asignada la empresa "+dw_trae.getitemstring(j,"cemp")+" debe agregarsela en la ficha de pacientes")
			Rollback;
			Return
		end if
		if alli <> uo_serv.idw_emppac.getrow() then
			uo_serv.idw_emppac.scrolltorow(alli)
			// Ojo si necesita insertar historial
		end if
		if not new_ingreso then
			
			if uo_serv.ipb_newingre.Event clicked() = -1 then Return
			new_ingreso=true
		end if
		hasta=dw_trae.getitemnumber(j,"esco")
		long nulo
		setnull(nulo)
		for k=1 to hasta
			uo_serv.sle_autoriza.Text = dw_trae.GetItemString(j,"autorizacion")
			if uo_serv.i_interface=1 then //facturas
					if uo_serv.f_insert_servicio( &
						dw_trae.GetItemString(j,"proccups"),&
						dw_trae.getitemstring(j,"cemp"), &
						dw_trae.getitemstring(j,"ccontrato"), &
						dw_trae.getitemstring(j,"cplan"), &
						dw_trae.getitemnumber(j,"nfact"), &
						dw_trae.getitemstring(j,"clugar"), &
						dw_trae.getitemnumber(j,"nitem"), &
						dw_trae.getitemnumber(j,"nrcaj"), &
						dw_trae.getitemstring(j,"clugar_rec"), &
						nulo, &
						nulo, &
						dw_trae.getitemstring(j,"cproced"),&
						dw_trae.getitemstring(j,"codmanual"),'','',dw_trae.getitemstring(j,"tipo_fac"),&
						dw_trae.getitemstring(j,"autorizacion"),'0',&
						dw_trae.getitemstring(j,"codalmacen"))	=-1 then
						rollback;
						return
					end if
				else ///recibos
					if uo_serv.f_insert_servicio( &
						dw_trae.GetItemString(j,"proccups"),&
						dw_trae.getitemstring(j,"cemp"), &
						dw_trae.getitemstring(j,"ccontrato"), &
						dw_trae.getitemstring(j,"plan"), &
						nulo, &
						'', &
						nulo, &
						dw_trae.getitemnumber(j,"nrcaj"), &
						dw_trae.getitemstring(j,"clugar"), &
						dw_trae.getitemnumber(j,"items"), &
						dw_trae.getitemnumber(j,"nitem"), &
						dw_trae.getitemstring(j,"cproced"),&
						dw_trae.getitemstring(j,"cmanual"),'','','',&
						dw_trae.getitemstring(j,"autorizacion"),'0',dw_trae.getitemstring(j,"codalmacen"))	=-1 then
						rollback;
						return
					end if
			end if
		next
	end if
next
commit;
uo_serv.i_interface=0
close(parent)
end event

type st_1 from statictext within w_lleva_factu_cons
integer x = 37
integer y = 24
integer width = 3173
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione los procedimientos a atender en Consultorio (De click sobre la casilla llevar):"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_trae from datawindow within w_lleva_factu_cons
integer x = 32
integer y = 116
integer width = 3182
integer height = 1012
integer taborder = 10
string title = "none"
string dataobject = "dw_factura_a_consult"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

