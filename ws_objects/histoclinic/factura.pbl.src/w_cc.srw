$PBExportHeader$w_cc.srw
forward
global type w_cc from window
end type
type pb_acep from picturebutton within w_cc
end type
type st_4 from statictext within w_cc
end type
type st_2 from statictext within w_cc
end type
type st_1 from statictext within w_cc
end type
type dw_cc from datawindow within w_cc
end type
end forward

global type w_cc from window
integer width = 2651
integer height = 1056
boolean titlebar = true
string title = "Escoger Centro de Costos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Asterisk!"
boolean clientedge = true
boolean center = true
pb_acep pb_acep
st_4 st_4
st_2 st_2
st_1 st_1
dw_cc dw_cc
end type
global w_cc w_cc

type variables
string proced, f_grupo,f_subgrp,f_categ,f_todos,f_tincluye,escog,tipoingres,p_versi
st_cc st_si
end variables

on w_cc.create
this.pb_acep=create pb_acep
this.st_4=create st_4
this.st_2=create st_2
this.st_1=create st_1
this.dw_cc=create dw_cc
this.Control[]={this.pb_acep,&
this.st_4,&
this.st_2,&
this.st_1,&
this.dw_cc}
end on

on w_cc.destroy
destroy(this.pb_acep)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_cc)
end on

event open;st_si=message.powerobjectparm
proced=st_si.cups
tipoingres=st_si.ingreso
p_versi=st_si.version
escog="!"

SELECT Proced.Cd_Grupo, Proced.Cd_SubGrupo, Proced.Cd_Categoria,descripcion
into :f_grupo, :f_subgrp , :f_categ,:st_1.text
FROM Proced
WHERE Proced.CodProced=:proced and cod_version=:p_versi;
if isnull(f_grupo) or f_grupo="" then 
	messagebox("Error","Este procedimiento no existe, o no puede ser encontrado por f_proc_cc")
	return
end if
dw_cc.settransobject(sqlca)
dw_cc.retrieve(p_versi,f_grupo,f_subgrp,f_categ,proced,tipoingres)
choose case dw_cc.rowcount()
	case 1
		escog=""
		closewithreturn(this,dw_cc.getitemstring(1,"coduf")+"-"+dw_cc.getitemstring(1,"codcc"))
	case 0
		escog=""
		closewithreturn(this,"")
	case else
end choose
end event

event closequery;if escog="!" then return 1	
end event

type pb_acep from picturebutton within w_cc
integer x = 1161
integer y = 800
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;dw_cc.triggerevent(doubleclicked!)
end event

type st_4 from statictext within w_cc
integer x = 27
integer y = 164
integer width = 1326
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Unidad Funcional/Centro Costo que realiza el procedimiento:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cc
integer x = 23
integer y = 56
integer width = 315
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimiento:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cc
integer x = 347
integer y = 48
integer width = 2240
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cc from datawindow within w_cc
integer x = 18
integer y = 240
integer width = 2574
integer height = 532
integer taborder = 20
string title = "none"
string dataobject = "dw_cc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long fila
fila=this.getrow()
if fila<1 then return
escog=""
closewithreturn(parent,this.getitemstring(fila,"coduf")+"-"+this.getitemstring(fila,"codcc"))
end event

