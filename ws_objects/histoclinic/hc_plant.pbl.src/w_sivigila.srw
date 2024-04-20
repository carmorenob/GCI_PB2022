$PBExportHeader$w_sivigila.srw
forward
global type w_sivigila from window
end type
type pb_1 from picturebutton within w_sivigila
end type
type uo_1 from uo_hclin within w_sivigila
end type
end forward

global type w_sivigila from window
integer width = 3328
integer height = 1936
boolean titlebar = true
string title = "Plantillas SIVIGILA"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "audita.ico"
boolean center = true
pb_1 pb_1
uo_1 uo_1
end type
global w_sivigila w_sivigila

type variables
st_xa_sivigila i_st
end variables

on w_sivigila.create
this.pb_1=create pb_1
this.uo_1=create uo_1
this.Control[]={this.pb_1,&
this.uo_1}
end on

on w_sivigila.destroy
destroy(this.pb_1)
destroy(this.uo_1)
end on

event open;i_st=message.powerobjectparm
uo_1.retrieve(i_st.contador, i_st.clug,'S',i_st.tingres,'',i_st.cespe,i_st.cemp,i_st.ccont,i_st.cprof,0,'',i_st.plantilla,'')

end event

type pb_1 from picturebutton within w_sivigila
integer x = 1088
integer y = 8
integer width = 128
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if uo_1.grabar()=-1 then 
	rollback;
	return -1 //guardar
else
	closewithreturn(parent,'ok') //no se da commit por si acaso allá da error.
end if
end event

type uo_1 from uo_hclin within w_sivigila
integer width = 3291
integer height = 1768
integer taborder = 50
end type

on uo_1.destroy
call uo_hclin::destroy
end on

event constructor;call super::constructor;tamanyo(3310,1840)
moverv(-10)
st_1.visible=false
pb_2.visible=false
pb_1.visible=false
uo_1.pb_save.visible=false

end event

