$PBExportHeader$w_cambia_respon_nuevo.srw
forward
global type w_cambia_respon_nuevo from window
end type
type dw_deta from datawindow within w_cambia_respon_nuevo
end type
type dw_cont from datawindow within w_cambia_respon_nuevo
end type
type dw_emp from datawindow within w_cambia_respon_nuevo
end type
type pb_2 from picturebutton within w_cambia_respon_nuevo
end type
type pb_1 from picturebutton within w_cambia_respon_nuevo
end type
type ln_1 from line within w_cambia_respon_nuevo
end type
type ln_2 from line within w_cambia_respon_nuevo
end type
type st_1 from statictext within w_cambia_respon_nuevo
end type
end forward

global type w_cambia_respon_nuevo from window
integer width = 2331
integer height = 1324
boolean titlebar = true
string title = "Cambiar responsable en Facturación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "factura.ico"
boolean clientedge = true
boolean contexthelp = true
boolean center = true
dw_deta dw_deta
dw_cont dw_cont
dw_emp dw_emp
pb_2 pb_2
pb_1 pb_1
ln_1 ln_1
ln_2 ln_2
st_1 st_1
end type
global w_cambia_respon_nuevo w_cambia_respon_nuevo

type variables
string proccups,manual,proceq,desproc,tiposerv,grupo,rips,cod_concep,que_paga,i_decual
real pormanual,pormax,pormin,cuanto_fijo,tope
dec valoru
int puntos
st_cambia_resp st_cr
end variables

on w_cambia_respon_nuevo.create
this.dw_deta=create dw_deta
this.dw_cont=create dw_cont
this.dw_emp=create dw_emp
this.pb_2=create pb_2
this.pb_1=create pb_1
this.ln_1=create ln_1
this.ln_2=create ln_2
this.st_1=create st_1
this.Control[]={this.dw_deta,&
this.dw_cont,&
this.dw_emp,&
this.pb_2,&
this.pb_1,&
this.ln_1,&
this.ln_2,&
this.st_1}
end on

on w_cambia_respon_nuevo.destroy
destroy(this.dw_deta)
destroy(this.dw_cont)
destroy(this.dw_emp)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.st_1)
end on

event open;st_cr=message.powerobjectparm
end event

type dw_deta from datawindow within w_cambia_respon_nuevo
boolean visible = false
integer x = 1303
integer y = 1080
integer width = 686
integer height = 136
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_det_seg_respon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_cont from datawindow within w_cambia_respon_nuevo
integer x = 55
integer y = 304
integer width = 2135
integer height = 668
integer taborder = 20
string title = "none"
string dataobject = "dw_contra_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string emp,cont,tipo
int l_i
emp=dw_emp.getitemstring(1,1)
cont=dw_cont.getitemstring(dw_cont.getrow(),'codcontrato')
tipo=dw_cont.getitemstring(dw_cont.getrow(),'tipo')
for l_i=1 to st_cr.dw_factura_cpo.rowcount()
	if  st_cr.dw_factura_cpo.getitemnumber(l_i,"cambio")=1 then
		 st_cr.dw_factura_cpo.setitem(l_i,'cemp',emp)
		 st_cr.dw_factura_cpo.setitem(l_i,'ccontrato',cont)
 		 st_cr.dw_factura_cpo.setitem(l_i,'tipo_fac',tipo)
		 st_cr.dw_factura_cpo.setitem(l_i,'cambio',0)
	end if
next
closewithreturn(parent,'si')
end event

event constructor;settransobject(sqlca)
end event

type dw_emp from datawindow within w_cambia_respon_nuevo
integer x = 41
integer y = 136
integer width = 2144
integer height = 160
integer taborder = 10
string title = "none"
string dataobject = "dw_empre_activas"
boolean border = false
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;this.accepttext()
dw_cont.retrieve(this.getitemstring(1,1))

end event

type pb_2 from picturebutton within w_cambia_respon_nuevo
integer x = 942
integer y = 1056
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_cambia_respon_nuevo
integer x = 768
integer y = 1056
integer width = 146
integer height = 128
integer taborder = 10
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

event clicked;dw_cont.triggerevent(doubleclicked!)

end event

type ln_1 from line within w_cambia_respon_nuevo
long linecolor = 16777215
integer linethickness = 4
integer beginx = -5
integer beginy = 1040
integer endx = 2280
integer endy = 1040
end type

type ln_2 from line within w_cambia_respon_nuevo
long linecolor = 10789024
integer linethickness = 4
integer beginy = 1044
integer endx = 2280
integer endy = 1044
end type

type st_1 from statictext within w_cambia_respon_nuevo
integer x = 55
integer y = 16
integer width = 2153
integer height = 128
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione la Empresa luego el Contrato y de doble click sobre el contrato o presione Aceptar"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

