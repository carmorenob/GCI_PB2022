$PBExportHeader$w_mipres.srw
forward
global type w_mipres from window
end type
type fec_2 from editmask within w_mipres
end type
type st_2 from statictext within w_mipres
end type
type fec_1 from editmask within w_mipres
end type
type st_1 from statictext within w_mipres
end type
type tab_1 from tab within w_mipres
end type
type tabpage_1 from userobject within tab_1
end type
type dw_med from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_med dw_med
end type
type tabpage_2 from userobject within tab_1
end type
type dw_cups from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_cups dw_cups
end type
type tabpage_3 from userobject within tab_1
end type
type dw_dispo from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_dispo dw_dispo
end type
type tabpage_4 from userobject within tab_1
end type
type dw_nutri from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_nutri dw_nutri
end type
type tabpage_5 from userobject within tab_1
end type
type dw_comp from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_comp dw_comp
end type
type tab_1 from tab within w_mipres
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type dw_pres from uo_datawindow within w_mipres
end type
type gb_1 from groupbox within w_mipres
end type
end forward

global type w_mipres from window
integer width = 5760
integer height = 2260
boolean titlebar = true
string title = "Prescripciones Mipres"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "mipres.ico"
fec_2 fec_2
st_2 st_2
fec_1 fec_1
st_1 st_1
tab_1 tab_1
dw_pres dw_pres
gb_1 gb_1
end type
global w_mipres w_mipres

type variables
transaction sqlmpr


end variables

forward prototypes
public subroutine filtre ()
end prototypes

public subroutine filtre ();dw_pres.retrieve(datetime(fec_1.text),datetime(fec_2.text))
//dw_2.retrieve(date(fec_1.text),date(fec_2.text),dw_3.getitemstring(1,1))
//dw_4.retrieve(date(fec_1.text),date(fec_2.text),dw_3.getitemstring(1,1))
//dw_5.retrieve(date(fec_1.text),date(fec_2.text),dw_3.getitemstring(1,1))
//dw_6.retrieve(relativedate(date(fec_1.text),-1),date(fec_1.text),dw_3.getitemstring(1,1))
//dw_7.retrieve(date(fec_1.text),date(fec_2.text),dw_3.getitemstring(1,1))
//dw_8.retrieve(date(fec_1.text),date(fec_2.text),dw_3.getitemstring(1,1))

end subroutine

on w_mipres.create
this.fec_2=create fec_2
this.st_2=create st_2
this.fec_1=create fec_1
this.st_1=create st_1
this.tab_1=create tab_1
this.dw_pres=create dw_pres
this.gb_1=create gb_1
this.Control[]={this.fec_2,&
this.st_2,&
this.fec_1,&
this.st_1,&
this.tab_1,&
this.dw_pres,&
this.gb_1}
end on

on w_mipres.destroy
destroy(this.fec_2)
destroy(this.st_2)
destroy(this.fec_1)
destroy(this.st_1)
destroy(this.tab_1)
destroy(this.dw_pres)
destroy(this.gb_1)
end on

event open;if not isvalid(sqlmpr) then sqlmpr = create transaction
if f_conecta_mipres(sqlmpr)=-1 then
	close(this)
end if

dw_pres.settransobject(sqlmpr)
tab_1.tabpage_1.dw_med.settransobject(sqlmpr)
tab_1.tabpage_2.dw_cups.settransobject(sqlmpr)
tab_1.tabpage_3.dw_dispo.settransobject(sqlmpr)
tab_1.tabpage_4.dw_nutri.settransobject(sqlmpr)
tab_1.tabpage_5.dw_comp.settransobject(sqlmpr)
end event

type fec_2 from editmask within w_mipres
integer x = 1349
integer y = 84
integer width = 475
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;fec_2.text=string(today())
end event

event modified;filtre()
end event

type st_2 from statictext within w_mipres
integer x = 1019
integer y = 96
integer width = 370
integer height = 56
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FECHA FINAL"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type fec_1 from editmask within w_mipres
integer x = 434
integer y = 80
integer width = 475
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;fec_1.text=string(today())
end event

event modified;filtre()
end event

type st_1 from statictext within w_mipres
integer x = 73
integer y = 96
integer width = 370
integer height = 56
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FECHA INICIAL"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type tab_1 from tab within w_mipres
integer x = 32
integer y = 1040
integer width = 5627
integer height = 1088
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5591
integer height = 960
long backcolor = 67108864
string text = "Medicamentos"
long tabtextcolor = 33554432
string picturename = "ribon_clase.ico"
long picturemaskcolor = 536870912
dw_med dw_med
end type

on tabpage_1.create
this.dw_med=create dw_med
this.Control[]={this.dw_med}
end on

on tabpage_1.destroy
destroy(this.dw_med)
end on

type dw_med from datawindow within tabpage_1
integer x = 32
integer y = 40
integer width = 5536
integer height = 864
integer taborder = 30
string title = "none"
string dataobject = "dw_mipres_prescripcion_med"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5591
integer height = 960
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "ribon_producto.ico"
long picturemaskcolor = 536870912
dw_cups dw_cups
end type

on tabpage_2.create
this.dw_cups=create dw_cups
this.Control[]={this.dw_cups}
end on

on tabpage_2.destroy
destroy(this.dw_cups)
end on

type dw_cups from datawindow within tabpage_2
integer x = 41
integer y = 24
integer width = 5527
integer height = 900
integer taborder = 30
string title = "none"
string dataobject = "dw_mipres_prescripcion_cups"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5591
integer height = 960
long backcolor = 67108864
string text = "Dispositivos"
long tabtextcolor = 33554432
string picturename = "dispisitivo.ico"
long picturemaskcolor = 536870912
dw_dispo dw_dispo
end type

on tabpage_3.create
this.dw_dispo=create dw_dispo
this.Control[]={this.dw_dispo}
end on

on tabpage_3.destroy
destroy(this.dw_dispo)
end on

type dw_dispo from datawindow within tabpage_3
integer x = 69
integer y = 60
integer width = 5481
integer height = 852
integer taborder = 40
string title = "none"
string dataobject = "dw_mipres_prescripcion_dispo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5591
integer height = 960
long backcolor = 67108864
string text = "Nutricionales"
long tabtextcolor = 33554432
string picturename = "dev_med.ico"
long picturemaskcolor = 536870912
dw_nutri dw_nutri
end type

on tabpage_4.create
this.dw_nutri=create dw_nutri
this.Control[]={this.dw_nutri}
end on

on tabpage_4.destroy
destroy(this.dw_nutri)
end on

type dw_nutri from datawindow within tabpage_4
integer x = 41
integer y = 40
integer width = 5509
integer height = 876
integer taborder = 40
string title = "none"
string dataobject = "dw_mipres_prescripcion_nutri"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_5 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5591
integer height = 960
long backcolor = 67108864
string text = "Complementarios"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
dw_comp dw_comp
end type

on tabpage_5.create
this.dw_comp=create dw_comp
this.Control[]={this.dw_comp}
end on

on tabpage_5.destroy
destroy(this.dw_comp)
end on

type dw_comp from datawindow within tabpage_5
integer x = 32
integer y = 16
integer width = 5518
integer height = 912
integer taborder = 50
string title = "none"
string dataobject = "dw_mipres_prescripcion_comp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pres from uo_datawindow within w_mipres
string tag = "Prescripcion"
integer x = 32
integer y = 224
integer width = 5618
integer height = 788
integer taborder = 40
string dataobject = "dw_mipres_prescripcion"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
end type

event rbuttondown;call super::rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)

end event

event rowfocuschanged;call super::rowfocuschanged;long fila
string npres
fila=this.getrow()
if fila<1 then return
npres=this.getitemstring(fila,"NOPRESCRIPCION")
tab_1.tabpage_1.dw_med.retrieve(npres)
tab_1.tabpage_2.dw_cups.retrieve(npres)
tab_1.tabpage_3.dw_dispo.retrieve(npres)
tab_1.tabpage_4.dw_nutri.retrieve(npres)
tab_1.tabpage_5.dw_comp.retrieve(npres)

end event

type gb_1 from groupbox within w_mipres
integer x = 37
integer y = 12
integer width = 1870
integer height = 172
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterios de Consulta"
end type

