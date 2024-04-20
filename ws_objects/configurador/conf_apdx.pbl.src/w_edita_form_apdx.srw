$PBExportHeader$w_edita_form_apdx.srw
forward
global type w_edita_form_apdx from window
end type
type st_1 from statictext within w_edita_form_apdx
end type
type dd_fechas from dropdownlistbox within w_edita_form_apdx
end type
type pb_2 from picturebutton within w_edita_form_apdx
end type
type pb_1 from picturebutton within w_edita_form_apdx
end type
type mle_1 from multilineedit within w_edita_form_apdx
end type
type dw_1 from datawindow within w_edita_form_apdx
end type
end forward

global type w_edita_form_apdx from window
integer width = 2967
integer height = 1508
boolean titlebar = true
string title = "Edicón de Fórmulas Apdx"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Function!"
boolean center = true
st_1 st_1
dd_fechas dd_fechas
pb_2 pb_2
pb_1 pb_1
mle_1 mle_1
dw_1 dw_1
end type
global w_edita_form_apdx w_edita_form_apdx

type variables
datawindow i_dw
end variables

on w_edita_form_apdx.create
this.st_1=create st_1
this.dd_fechas=create dd_fechas
this.pb_2=create pb_2
this.pb_1=create pb_1
this.mle_1=create mle_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dd_fechas,&
this.pb_2,&
this.pb_1,&
this.mle_1,&
this.dw_1}
end on

on w_edita_form_apdx.destroy
destroy(this.st_1)
destroy(this.dd_fechas)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.mle_1)
destroy(this.dw_1)
end on

event open;i_dw=message.powerobjectparm
int li_error
if i_dw.rowcount()>0 then
	 li_error=i_dw.rowscopy(1,i_dw.rowcount(),primary!,dw_1,1,primary!)
	if li_error=-1 then
		closewithreturn(this,trim('Error al copiar'))
		return
	End IF
End If
dw_1.setfilter('tipocampo="2" or tipocampo="8" or tipocampo="9" or tipocampo="10" ' )
dw_1.filter()
mle_1.text=i_dw.getitemstring(i_dw.getrow(),'formula')

end event

type st_1 from statictext within w_edita_form_apdx
integer x = 1829
integer y = 1100
integer width = 283
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Funciones"
boolean focusrectangle = false
end type

type dd_fechas from dropdownlistbox within w_edita_form_apdx
integer x = 2149
integer y = 1100
integer width = 763
integer height = 260
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"RelativeDate()","DaysAfter()","Today()","Date()","Sqrt()","f_percentil(#edad,#sexo,#plantilla,#campo,)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;mle_1.replaceText(dd_fechas.text)	

end event

type pb_2 from picturebutton within w_edita_form_apdx
integer x = 1984
integer y = 1232
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_edita_form_apdx
integer x = 1819
integer y = 1232
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if trim(mle_1.text)="" then return
closewithreturn(parent,trim(mle_1.text))
end event

type mle_1 from multilineedit within w_edita_form_apdx
integer x = 1824
integer y = 12
integer width = 1083
integer height = 1040
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type dw_1 from datawindow within w_edita_form_apdx
integer width = 1774
integer height = 1364
integer taborder = 10
string dragicon = "CreateLibrary5!"
string title = "none"
string dataobject = "dw_campos_plant_numeric_apdx"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;if row<1 then return
mle_1.replaceText('#'+string(getitemnumber(row,'consecampo')))
end event

event clicked;if row>0 and row<>getrow() then setrow(row)
if getitemstring(row,'tipocampo')='8' then
	dd_fechas.visible=true
else
	dd_fechas.visible=false
end if
end event

event constructor;settransobject(sqlca)
end event

