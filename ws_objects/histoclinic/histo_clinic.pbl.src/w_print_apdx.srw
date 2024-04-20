$PBExportHeader$w_print_apdx.srw
forward
global type w_print_apdx from window
end type
type pb_3 from picturebutton within w_print_apdx
end type
type pb_2 from pb_report within w_print_apdx
end type
type pb_1 from picturebutton within w_print_apdx
end type
type st_3 from statictext within w_print_apdx
end type
type st_2 from statictext within w_print_apdx
end type
type st_1 from statictext within w_print_apdx
end type
type em_2 from editmask within w_print_apdx
end type
type em_1 from editmask within w_print_apdx
end type
type dw_1 from datawindow within w_print_apdx
end type
end forward

global type w_print_apdx from window
integer width = 3109
integer height = 1416
boolean titlebar = true
string title = "Imprimir Resulados Pendientes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "print7.ico"
boolean center = true
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_3 st_3
st_2 st_2
st_1 st_1
em_2 em_2
em_1 em_1
dw_1 dw_1
end type
global w_print_apdx w_print_apdx

type variables
string i_area
end variables

on w_print_apdx.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_1=create dw_1
this.Control[]={this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.em_2,&
this.em_1,&
this.dw_1}
end on

on w_print_apdx.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_1)
end on

event open;i_area=message.stringparm
pb_1.event clicked()
end event

type pb_3 from picturebutton within w_print_apdx
integer x = 1477
integer y = 1184
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
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

type pb_2 from pb_report within w_print_apdx
integer x = 1289
integer y = 1184
integer width = 146
integer height = 128
integer taborder = 20
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir Resultados"
end type

event clicked;call super::clicked;if dw_1.rowcount()=0 then return
if dw_1.getitemnumber(1,'compute_1')=0 then return
string cdoc
long nrepor,j
cdoc=dw_1.getitemstring(1,"coddoc")
nombre_rep='Reporte de Apoyo Diagnóstico -Area: '+i_area
if inicia('documento!',cdoc,clugar)=-1 then return
for j=1 to dw_1.rowcount()
	if dw_1.getitemnumber(j,'esco')=0 then continue
	nrepor=dw_1.getitemnumber(j,"nrepor")
	if report.dw_rep.retrieve(cdoc,nrepor,clugar)=0 then continue
	if report.dw_rep.print()=-1 then continue
	dw_1.setitem(j,'estado','2')
next
if dw_1.update(true,false)=-1 then return
commit;
dw_1.resetupdate()
pb_1.event clicked()
w_apoyo_diag2.event open()
end event

type pb_1 from picturebutton within w_print_apdx
integer x = 878
integer y = 36
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
end type

event clicked;dw_1.retrieve(i_area,date(em_1.text),date(em_2.text),clugar,w_apoyo_diag2.i_tipoing)

end event

type st_3 from statictext within w_print_apdx
integer x = 14
integer y = 144
integer width = 731
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresos pendientes de Imprimir:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_print_apdx
integer x = 462
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
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_print_apdx
integer x = 14
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
string text = "Desde:"
boolean focusrectangle = false
end type

type em_2 from editmask within w_print_apdx
integer x = 457
integer y = 52
integer width = 375
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;text=string(today(),'dd/mm/yyyy')
end event

type em_1 from editmask within w_print_apdx
integer x = 14
integer y = 52
integer width = 375
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;text=string(today(),'dd/mm/yyyy')
end event

type dw_1 from datawindow within w_print_apdx
integer x = 9
integer y = 200
integer width = 3067
integer height = 964
integer taborder = 10
string title = "none"
string dataobject = "dw_apdx_xa_print"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event buttonclicked;long esco=0,j
if dwo.text='Escog.' then
	esco=1
	dwo.text='Deselec.'
else
	dwo.text='Escog.'
end if
for j=1 to rowcount()
	setitem(j,'esco',esco)
next
end event

event dberror;rollback;
return 0
end event

