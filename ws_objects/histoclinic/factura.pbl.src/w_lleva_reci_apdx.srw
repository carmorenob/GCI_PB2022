$PBExportHeader$w_lleva_reci_apdx.srw
forward
global type w_lleva_reci_apdx from window
end type
type pb_cancel from picturebutton within w_lleva_reci_apdx
end type
type pb_acep from picturebutton within w_lleva_reci_apdx
end type
type st_1 from statictext within w_lleva_reci_apdx
end type
type dw_trae from datawindow within w_lleva_reci_apdx
end type
end forward

global type w_lleva_reci_apdx from window
integer width = 2770
integer height = 1420
boolean titlebar = true
string title = "Llevar procedimientos de Recibos de Caja a Apoyo Diagnóstico (Recibos sin Factura ni Cita)"
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
global w_lleva_reci_apdx w_lleva_reci_apdx

on w_lleva_reci_apdx.create
this.pb_cancel=create pb_cancel
this.pb_acep=create pb_acep
this.st_1=create st_1
this.dw_trae=create dw_trae
this.Control[]={this.pb_cancel,&
this.pb_acep,&
this.st_1,&
this.dw_trae}
end on

on w_lleva_reci_apdx.destroy
destroy(this.pb_cancel)
destroy(this.pb_acep)
destroy(this.st_1)
destroy(this.dw_trae)
end on

type pb_cancel from picturebutton within w_lleva_reci_apdx
integer x = 1234
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

type pb_acep from picturebutton within w_lleva_reci_apdx
integer x = 1051
integer y = 1152
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

event clicked;if dw_trae.accepttext()=-1 then return
long j,cuantos,k,filas,nreci,itemrec,nitemrec,nnul
boolean new_ingreso=false
string cemp,ccont,clugrec,naut,cproceq,cmaneq,plan,snul,cod
datetime fnul
setnull(nnul)
setnull(snul)
setnull(fnul)
for j= 1 to dw_trae.rowcount()
	if dw_trae.getitemnumber(j,"esco")>0 then
		cemp=dw_trae.getitemstring(j,"cemp")
		ccont=dw_trae.getitemstring(j,"ccontrato")
		if not new_ingreso then
			if w_apoyo_diag2.pb_newing.event clicked()=-1 then return
			new_ingreso=true
		end if
		cod=dw_trae.getitemstring(j,"proccups")
		nreci=dw_trae.getitemnumber(j,"nrcaj")
		clugrec=dw_trae.getitemstring(j,"clugar")
		itemrec=dw_trae.getitemnumber(j,"items")
		nitemrec=dw_trae.getitemnumber(j,"nitem")
		naut=dw_trae.getitemstring(j,"autorizacion")
		cproceq=dw_trae.getitemstring(j,"cproced")
		cmaneq=dw_trae.getitemstring(j,"cmanual")
		plan=dw_trae.getitemstring(j,"plan")
		cuantos=dw_trae.getitemnumber(j,"esco")
		for k=1 to cuantos
			//	p_cod,procequiv,man_eq,empresa,contrato,plan,autoriza,nfactura,clug_fac,item_fac,nreci
			//	clug_rec,item_rec,nitem_rec,ncita,nserv_cita,sec_cant_cit,fecha_cit,hora_cit, conta_os
			// clug_os,norden,nitem_os,facturar
			if w_apoyo_diag2.f_insert_proc(cod,cproceq,cmaneq,cemp,ccont,plan,naut,nnul,snul,nnul,nreci, &
				clugrec,itemrec,nitemrec,nnul,snul,nnul,nnul,fnul,fnul,nnul, snul,nnul,nnul,1,'','','1')=-1 then
				rollback;
				enabled=false
				return
			end if
		next
	end if
next
commit;
close(parent)
end event

type st_1 from statictext within w_lleva_reci_apdx
integer x = 41
integer y = 28
integer width = 2651
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione los procedimientos a atender en Apoyo Diagnóstico (De click sobre la casilla llevar):"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_trae from datawindow within w_lleva_reci_apdx
integer x = 32
integer y = 116
integer width = 2665
integer height = 1012
integer taborder = 10
string title = "none"
string dataobject = "dw_recibo_a_apdx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
retrieve(tipdoc,docu,w_apoyo_diag2.i_codarea)
end event

