$PBExportHeader$w_actos_pend.srw
forward
global type w_actos_pend from window
end type
type st_1 from statictext within w_actos_pend
end type
type dw_req from datawindow within w_actos_pend
end type
type dw_pend from datawindow within w_actos_pend
end type
type st_7 from statictext within w_actos_pend
end type
type dw_acto from datawindow within w_actos_pend
end type
type pb_1 from picturebutton within w_actos_pend
end type
type gb_1 from groupbox within w_actos_pend
end type
end forward

global type w_actos_pend from window
integer width = 3881
integer height = 1804
boolean titlebar = true
string title = "Actos Qurirgicos Solicitados al Paciente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean center = true
st_1 st_1
dw_req dw_req
dw_pend dw_pend
st_7 st_7
dw_acto dw_acto
pb_1 pb_1
gb_1 gb_1
end type
global w_actos_pend w_actos_pend

type variables
st_prog_cir i_st
end variables

on w_actos_pend.create
this.st_1=create st_1
this.dw_req=create dw_req
this.dw_pend=create dw_pend
this.st_7=create st_7
this.dw_acto=create dw_acto
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.dw_req,&
this.dw_pend,&
this.st_7,&
this.dw_acto,&
this.pb_1,&
this.gb_1}
end on

on w_actos_pend.destroy
destroy(this.st_1)
destroy(this.dw_req)
destroy(this.dw_pend)
destroy(this.st_7)
destroy(this.dw_acto)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;i_st=message.powerobjectparm
dw_acto.retrieve(tipdoc,docu)
end event

type st_1 from statictext within w_actos_pend
integer x = 27
integer y = 1084
integer width = 521
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Requisitos del Acto QX:"
boolean focusrectangle = false
end type

type dw_req from datawindow within w_actos_pend
integer x = 23
integer y = 1136
integer width = 3762
integer height = 412
integer taborder = 70
string title = "none"
string dataobject = "dw_os_qx_subcpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_pend from datawindow within w_actos_pend
integer x = 50
integer y = 536
integer width = 3666
integer height = 500
integer taborder = 60
string title = "none"
string dataobject = "dw_cir_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_7 from statictext within w_actos_pend
integer x = 50
integer y = 468
integer width = 658
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cirugías del Acto a Programar"
boolean focusrectangle = false
end type

type dw_acto from datawindow within w_actos_pend
integer x = 59
integer y = 92
integer width = 3666
integer height = 376
integer taborder = 60
string title = "none"
string dataobject = "dw_acto_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if currentrow<1 then return
dw_pend.retrieve(getitemnumber(currentrow,'contador'),getitemstring(currentrow,'clugar'),getitemnumber(currentrow,'nsolicitud'))
dw_req.retrieve(getitemnumber(currentrow,'contador'),getitemstring(currentrow,'clugar'),getitemnumber(currentrow,'nsolicitud'))

end event

type pb_1 from picturebutton within w_actos_pend
integer x = 1669
integer y = 1580
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string powertiptext = "Llevar Datos para Programar"
end type

event clicked;if dw_pend.rowcount()=0  then return
dw_req.accepttext()
if dw_req.update()=-1 then
	rollback;
	return
else
	commit;
end if
if dw_req.rowcount()>0 then 
	if dw_req.getitemnumber(1,'t_cumplido')<dw_req.rowcount() then
		if messagebox("Atención",'No se han cumplido todos los requisitos para este Acto Qx, desea continuar aún así ?',question!,yesno!,2)=2 then return
	end if
end if
datawindow dw
dw=dw_acto
i_st.dw_qxcita.insertrow(1)
i_st.dw_qxcita.setitem(1,'tipodoc',tipdoc)
i_st.dw_qxcita.setitem(1,'documento',docu)
i_st.dw_qxcita.setitem(1,'usuario',usuario)
i_st.dw_qxcita.setitem(1,'estado','4')
i_st.dw_qxcita.setitem(1,'contador',dw.getitemnumber(dw.getrow(),'contador'))
i_st.dw_qxcita.setitem(1,'clugar_os',dw.getitemstring(dw.getrow(),'clugar'))
i_st.dw_qxcita.setitem(1,'nsolicitud',dw.getitemnumber(dw.getrow(),'nsolicitud'))
i_st.dw_qxcita.setitem(1,'codemp',dw_acto.getitemstring(dw_acto.getrow(),'cemp'))
dw=dw_pend
long j,donde,l_k
l_k=i_st.dw_qxcita_cir.getitemnumber(1,'maximo')
if isnull(l_k) then l_k=0
l_k=l_k+1
for j=1 to dw.rowcount()
	i_st.dw_qxcita_cir.insertrow(j)
	i_st.dw_qxcita_cir.setitem(j,'nro_cir',l_k)
	i_st.dw_qxcita_cir.setitem(j,'contador',dw.getitemnumber(j,'contador'))
	i_st.dw_qxcita_cir.setitem(j,'clugar_os',dw.getitemstring(j,'clugar'))
	i_st.dw_qxcita_cir.setitem(j,'nsolicitud',dw.getitemnumber(j,'nsolicitud'))
	i_st.dw_qxcita_cir.setitem(j,'item_os',dw.getitemnumber(j,'item'))
	i_st.dw_qxcita_cir.setitem(j,'codproced',dw.getitemstring(j,'codproced'))
	i_st.dw_qxcita_cir.setitem(j,'espe_qx',dw.getitemstring(j,'cesp'))
	i_st.dw_qxcita_cir.setitem(j,'desesp',dw.getitemstring(j,'desesp'))
	i_st.dw_qxcita_cir.setitem(j,'qx',dw.getitemstring(j,'codprof'))
	i_st.dw_qxcita_cir.setitem(j,'cod_late',dw.getitemstring(j,'cod_late'))
	i_st.dw_qxcita_cir.setitem(j,'codtipoanestesia',dw.getitemstring(j,'codtipoanestesia'))
	i_st.dw_qxcita_cir.setitem(j,'descripcion',dw.getitemstring(j,'descripcion'))
	if isnull(dw.getitemnumber(j,'tiempo_cirugia')) or (dw.getitemnumber(j,'tiempo_cirugia')=0) then
		messagebox('Atención', 'Fue programado sin tiempo Qx')
		i_st.dw_qxcita_cir.reset()
		return
		close(parent)
	end if
	i_st.dw_qxcita_cir.setitem(j,'tiempoqx',dw.getitemnumber(j,'tiempo_cirugia'))
	i_st.dw_qxcita_cir.setitem(j,'nro_cir',j)
next
close(parent)
end event

type gb_1 from groupbox within w_actos_pend
integer x = 14
integer y = 20
integer width = 3771
integer height = 1048
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actos QX Solicitados al Paciente:"
end type

