$PBExportHeader$w_modifica.srw
forward
global type w_modifica from window
end type
type pb_2 from picturebutton within w_modifica
end type
type pb_1 from picturebutton within w_modifica
end type
type uo_1 from uo_hclin_cambia within w_modifica
end type
end forward

global type w_modifica from window
integer width = 3360
integer height = 1108
boolean titlebar = true
string title = "Modificación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
uo_1 uo_1
end type
global w_modifica w_modifica

type variables
st_xa_cambiar i_st
end variables

on w_modifica.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.uo_1=create uo_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.uo_1}
end on

on w_modifica.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.uo_1)
end on

event open;i_st=message.powerobjectparm
//uo_1.retrieve(i_st.contador,i_st.clug,i_st.tipo,i_st.tingre,i_st.ing_sal,i_st.cesp,i_st.cemp,i_st.ccont,i_st.cprof,i_st.nacto,i_st.clug_qx,i_st.nreg)
uo_1.pinta(i_st)

end event

type pb_2 from picturebutton within w_modifica
integer x = 1659
integer y = 864
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)

end event

type pb_1 from picturebutton within w_modifica
integer x = 1513
integer y = 864
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar"
end type

event clicked;if uo_1.grabar() = 1 then
	i_st.dw_deta.Retrieve(i_st.contador, i_st.clug, i_st.tipo, i_st.tingre, i_st.ing_sal)
	i_st.dw_hist.Retrieve(i_st.contador, i_st.clug, i_st.tipo, i_st.tingre, i_st.ing_sal)
	close(parent)
end if

end event

type uo_1 from uo_hclin_cambia within w_modifica
integer x = 23
integer y = 24
integer taborder = 40
end type

on uo_1.destroy
call uo_hclin_cambia::destroy
end on

