$PBExportHeader$w_trae_qx_hosp.srw
forward
global type w_trae_qx_hosp from window
end type
type st_1 from statictext within w_trae_qx_hosp
end type
type pb_cancel from picturebutton within w_trae_qx_hosp
end type
type pb_aceptar from picturebutton within w_trae_qx_hosp
end type
type dw_1 from datawindow within w_trae_qx_hosp
end type
end forward

global type w_trae_qx_hosp from window
integer width = 4315
integer height = 1436
boolean titlebar = true
string title = "Traer Cirugías Pendientes de Hosp/Urg"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean contexthelp = true
boolean center = true
st_1 st_1
pb_cancel pb_cancel
pb_aceptar pb_aceptar
dw_1 dw_1
end type
global w_trae_qx_hosp w_trae_qx_hosp

on w_trae_qx_hosp.create
this.st_1=create st_1
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.pb_cancel,&
this.pb_aceptar,&
this.dw_1}
end on

on w_trae_qx_hosp.destroy
destroy(this.st_1)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.dw_1)
end on

event open;dw_1.retrieve(tipdoc,docu)
end event

type st_1 from statictext within w_trae_qx_hosp
integer x = 32
integer y = 24
integer width = 4192
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Elija los procedimientos a Cargar en un Acto Quirúrgico"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_trae_qx_hosp
integer x = 2130
integer y = 1176
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_trae_qx_hosp
integer x = 1966
integer y = 1176
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;if dw_1.rowcount()=0 then return
long j,nh=0,donde
st_hosposd st
if dw_1.getitemstring(1,'llevar')='2' then//es un max de escoger
		for j=1 to dw_1.rowcount()
		if dw_1.getitemstring(j,'estado')='2' then
			if nh<>dw_1.getitemnumber(j,'nh') then
				nh=dw_1.getitemnumber(j,'nh')
				donde=w_new_sala_qx.dw_admi.find('nh='+string(nh)+' and clugar="'+dw_1.getitemstring(j,'clugar')+'"',1,w_new_sala_qx.dw_admi.rowcount())
				if donde=0 then
					messagebox('Error','No se puede encontrar la admision '+string(nh)+' en las admisiones con ActosQx del paciente')
					return
				end if
				w_new_sala_qx.dw_admi.scrolltorow(donde)
				if w_new_sala_qx.cb_1.event clicked()=-1 then return//nuevo qxcab
			end if
			st.cproc=dw_1.getitemstring(j,'codproced')
			st.norden=dw_1.getitemnumber(j,'nsolicitud')
			st.nitem=dw_1.getitemnumber(j,'item')
			st.nhosp=dw_1.getitemnumber(j,'nh')
			st.facturar=dw_1.getitemnumber(j,'facturar')
			st.clugar_hadm=dw_1.getitemstring(j,'clugar')
			st.conta_os=dw_1.getitemnumber(j,'contador')
			st.clug_os=dw_1.getitemstring(j,'clugar')
			openwithparm(w_nuevo_proc_qx,st)
		end if
	next
	close(parent)
end if

end event

type dw_1 from datawindow within w_trae_qx_hosp
integer x = 27
integer y = 124
integer width = 4215
integer height = 1024
integer taborder = 10
string title = "none"
string dataobject = "dw_cir_pend_hosp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

