$PBExportHeader$w_alergias.srw
forward
global type w_alergias from window
end type
type dw_tipo from datawindow within w_alergias
end type
type tab_1 from tab within w_alergias
end type
type tabpage_1 from userobject within tab_1
end type
type pb_gua from picturebutton within tabpage_1
end type
type pb_borr from picturebutton within tabpage_1
end type
type pb_ins from picturebutton within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_gua pb_gua
pb_borr pb_borr
pb_ins pb_ins
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type pb_del from picturebutton within tabpage_2
end type
type pb_find from picturebutton within tabpage_2
end type
type sle_1 from singlelineedit within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type pb_gum from picturebutton within tabpage_2
end type
type dw_med_alergia from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
pb_del pb_del
pb_find pb_find
sle_1 sle_1
st_3 st_3
pb_gum pb_gum
dw_med_alergia dw_med_alergia
end type
type tab_1 from tab within w_alergias
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_alergias from window
integer width = 4823
integer height = 1728
boolean titlebar = true
string title = "Clasificación Alergias"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "D:\libs_115\histoclinic\alergiat.ico"
boolean center = true
dw_tipo dw_tipo
tab_1 tab_1
end type
global w_alergias w_alergias

type variables
boolean i_cambio,i_nuevo
string l_medica
end variables

on w_alergias.create
this.dw_tipo=create dw_tipo
this.tab_1=create tab_1
this.Control[]={this.dw_tipo,&
this.tab_1}
end on

on w_alergias.destroy
destroy(this.dw_tipo)
destroy(this.tab_1)
end on

type dw_tipo from datawindow within w_alergias
integer x = 37
integer y = 16
integer width = 1545
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_tipo_alergia"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
insertrow(1)

end event

event itemchanged;this.accepttext()
tab_1.tabpage_1.dw_1.retrieve(data)

select medica into :l_medica 
from tipo_alergia 
where cod_tipo=:data;
tab_1.tabpage_2.text='Medicamentos'
if (l_medica ='0') then 
	tab_1.tabpage_2.enabled=false
else 
	tab_1.tabpage_2.enabled=true
end if
end event

type tab_1 from tab within w_alergias
integer x = 37
integer y = 108
integer width = 4713
integer height = 1452
integer taborder = 20
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
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanged;if (l_medica ='0')  or isnull(l_medica)then 
	tab_1.tabpage_2.text='Medicamentos'
else 
	tab_1.tabpage_2.text='Medicamentos  para '+tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),'desp_alergia')
end if

end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4677
integer height = 1324
long backcolor = 67108864
string text = "Alergia"
long tabtextcolor = 33554432
string picturename = "alergia.ico"
long picturemaskcolor = 536870912
pb_gua pb_gua
pb_borr pb_borr
pb_ins pb_ins
dw_1 dw_1
end type

on tabpage_1.create
this.pb_gua=create pb_gua
this.pb_borr=create pb_borr
this.pb_ins=create pb_ins
this.dw_1=create dw_1
this.Control[]={this.pb_gua,&
this.pb_borr,&
this.pb_ins,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.pb_gua)
destroy(this.pb_borr)
destroy(this.pb_ins)
destroy(this.dw_1)
end on

type pb_gua from picturebutton within tabpage_1
integer x = 4466
integer y = 300
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_1.Update(TRUE,FALSE) = -1 then 
	Return -1
end if
i_cambio=false
i_nuevo=false
end event

type pb_borr from picturebutton within tabpage_1
integer x = 4466
integer y = 172
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_1.rowcount()=0 then return
dw_1.deleterow(0)
i_cambio=true
end event

type pb_ins from picturebutton within tabpage_1
integer x = 4466
integer y = 44
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;if isnull(dw_1.getitemstring(1,1)) then return
dw_1.insertrow(1)
dw_1.setitem(1,'cod_tipo',dw_tipo.getitemstring(1,1))
dw_1.scrolltorow(1)
dw_1.setfocus()
i_cambio=true
i_nuevo=true
end event

type dw_1 from datawindow within tabpage_1
integer x = 32
integer y = 36
integer width = 4347
integer height = 1232
integer taborder = 20
string title = "none"
string dataobject = "dw_alergias"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event rowfocuschanged;if this.getrow()<1 then return
tab_1.tabpage_2.dw_med_alergia.retrieve(dw_tipo.getitemstring(dw_tipo.getrow(),'cod_tipo'),dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),'cod_alergia'))

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4677
integer height = 1324
boolean enabled = false
long backcolor = 67108864
string text = "Medicamentos"
long tabtextcolor = 33554432
string picturename = "dev_med.ico"
long picturemaskcolor = 536870912
pb_del pb_del
pb_find pb_find
sle_1 sle_1
st_3 st_3
pb_gum pb_gum
dw_med_alergia dw_med_alergia
end type

on tabpage_2.create
this.pb_del=create pb_del
this.pb_find=create pb_find
this.sle_1=create sle_1
this.st_3=create st_3
this.pb_gum=create pb_gum
this.dw_med_alergia=create dw_med_alergia
this.Control[]={this.pb_del,&
this.pb_find,&
this.sle_1,&
this.st_3,&
this.pb_gum,&
this.dw_med_alergia}
end on

on tabpage_2.destroy
destroy(this.pb_del)
destroy(this.pb_find)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.pb_gum)
destroy(this.dw_med_alergia)
end on

type pb_del from picturebutton within tabpage_2
integer x = 622
integer y = 48
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "capsula X.GIF"
alignment htextalign = left!
end type

event clicked;//dw_4.deleterow(0)
end event

type pb_find from picturebutton within tabpage_2
integer x = 466
integer y = 48
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "capsula busca.GIF"
alignment htextalign = left!
end type

event clicked;long cuantos
cuantos=tab_1.tabpage_2.dw_med_alergia.rowcount()
st_pa_medica st
st.dw_alergia=tab_1.tabpage_2.dw_med_alergia
st.tipo=dw_tipo.getitemstring(dw_tipo.getrow(),'cod_tipo')
st.valor=tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),'cod_alergia')
openwithparm(w_busca_med,st)
end event

type sle_1 from singlelineedit within tabpage_2
integer x = 96
integer y = 88
integer width = 343
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;if text='' or isnull(tab_1.tabpage_1.dw_1.getitemstring(1,1)) or isnull(tab_1.tabpage_2.dw_med_alergia.getitemstring(1,1))  then return
st_med stm
int l_fila
stm=f_busca_med(text)
if isnull(stm.medicamento) then return -1

l_fila=dw_med_alergia.insertrow(0)
dw_med_alergia.SetItem(l_fila,'cod_tipo',dw_tipo.getitemstring(dw_tipo.getrow(),'cod_tipo'))
dw_med_alergia.SetItem(l_fila,'cod_alergia',tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),'cod_alergia'))
dw_med_alergia.SetItem(l_fila,'c_medica',stm.cmedica)
dw_med_alergia.SetItem(l_fila,'medicamento',stm.medicamento)
text=''
end event

type st_3 from statictext within tabpage_2
integer x = 91
integer y = 36
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código Med:"
boolean focusrectangle = false
end type

type pb_gum from picturebutton within tabpage_2
integer x = 782
integer y = 48
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_med_alergia.Update(TRUE,FALSE) = -1 then 
	Return -1
end if
i_cambio=false
i_nuevo=false
end event

type dw_med_alergia from datawindow within tabpage_2
integer x = 87
integer y = 200
integer width = 4567
integer height = 1076
integer taborder = 40
string title = "none"
string dataobject = "dw_alergias_medica"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

