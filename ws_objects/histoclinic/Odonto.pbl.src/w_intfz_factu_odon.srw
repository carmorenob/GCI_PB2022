$PBExportHeader$w_intfz_factu_odon.srw
forward
global type w_intfz_factu_odon from window
end type
type pb_cancel from picturebutton within w_intfz_factu_odon
end type
type pb_acep from picturebutton within w_intfz_factu_odon
end type
type st_1 from statictext within w_intfz_factu_odon
end type
type dw_trae from datawindow within w_intfz_factu_odon
end type
end forward

global type w_intfz_factu_odon from window
integer width = 2757
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
global w_intfz_factu_odon w_intfz_factu_odon

type variables
st_fact st_f

end variables

on w_intfz_factu_odon.create
this.pb_cancel=create pb_cancel
this.pb_acep=create pb_acep
this.st_1=create st_1
this.dw_trae=create dw_trae
this.Control[]={this.pb_cancel,&
this.pb_acep,&
this.st_1,&
this.dw_trae}
end on

on w_intfz_factu_odon.destroy
destroy(this.pb_cancel)
destroy(this.pb_acep)
destroy(this.st_1)
destroy(this.dw_trae)
end on

event open;st_f = Message.PowerObjectParm
dw_trae.settransobject(sqlca)
dw_trae.SetFilter(st_f.filtro)
dw_trae.Filter()
dw_trae.retrieve(tipdoc,docu)

end event

type pb_cancel from picturebutton within w_intfz_factu_odon
integer x = 1230
integer y = 1148
integer width = 151
integer height = 132
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_acep from picturebutton within w_intfz_factu_odon
integer x = 1051
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
for j= 1 to dw_trae.rowcount()
	if dw_trae.GetItemString(j,"esco")='1' then
		long alli
		alli = st_f.dw_source.Find("codemp='"+dw_trae.getitemstring(j,"cemp")+"' and codcontrato='"+dw_trae.getitemstring(j,"ccontrato")+"'",1,st_f.dw_source.rowcount())
		if alli = 0 then
			MessageBox("Error de paciente","Este paciente ya no tiene asignada la empresa "+dw_trae.getitemstring(j,"cemp")+" debe agregarsela en la ficha de pacientes")
			Rollback;
			Return
		end if
		if alli <> st_f.dw_source.getrow() then
			st_f.dw_source.scrolltorow(alli)
			// Ojo si necesita insertar historial
		end if
		if not new_ingreso then
			if st_f.pb_1.Event clicked() = -1 then Return
			new_ingreso=true
		end if
		hasta=dw_trae.getitemnumber(j,"cantidad")
		for k=1 to hasta
			st_f.sle_proced.Text = dw_trae.GetItemString(j,"proccups")
			st_f.sle_autoriza.Text = dw_trae.GetItemString(j,"autorizacion")
			fila = st_f.sle_proced.Event modified()
			if fila > 0 then
				st_f.dw_obj.SetItem(fila,'nfactura', dw_trae.getitemnumber(j,"nfact"))
				st_f.dw_obj.SetItem(fila,'clugar_fac', dw_trae.getitemstring(j,"clugar"))
				st_f.dw_obj.SetItem(fila,'nitem_fac', dw_trae.getitemnumber(j,"nitem"))
				st_f.dw_obj.SetItem(fila,'nrcaj', dw_trae.getitemnumber(j,"nrcaj"))
				st_f.dw_obj.SetItem(fila,'clugar_rec', dw_trae.getitemstring(j,"clugar_rec"))
				st_f.dw_obj.SetItem(fila,'nautoriza', long(dw_trae.getitemstring(j,"autorizacion")))
				st_f.dw_obj.SetItem(fila,'cemp', dw_trae.getitemstring(j,"cemp"))
				st_f.dw_obj.SetItem(fila,'ccontrato', dw_trae.getitemstring(j,"ccontrato"))
				st_f.dw_obj.SetItem(fila,'cplan', dw_trae.getitemstring(j,"cplan"))
				st_f.dw_obj.SetItem(fila,'cprocedeq', dw_trae.getitemstring(j,"cproced"))
				st_f.dw_obj.SetItem(fila,'cmanual', dw_trae.getitemstring(j,"codmanual"))
				//st_f.dw_obj.SetItem(fila,'cproced', dw_trae.getitemstring(j,"proccups"))
			end if
		next
	end if
next

close(parent)

end event

type st_1 from statictext within w_intfz_factu_odon
integer x = 37
integer y = 24
integer width = 2665
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione los procedimientos a atender en consultorio (De click sobre la casilla llevar):"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_trae from datawindow within w_intfz_factu_odon
integer x = 32
integer y = 116
integer width = 2665
integer height = 1012
integer taborder = 10
string title = "none"
string dataobject = "dw_factura_a_consult"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.SetFilter(st_f.filtro)
this.Filter()
this.retrieve(tipdoc,docu)

end event

