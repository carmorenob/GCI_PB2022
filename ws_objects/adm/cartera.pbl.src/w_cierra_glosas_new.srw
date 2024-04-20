$PBExportHeader$w_cierra_glosas_new.srw
forward
global type w_cierra_glosas_new from window
end type
type em_3 from editmask within w_cierra_glosas_new
end type
type st_4 from statictext within w_cierra_glosas_new
end type
type st_1 from statictext within w_cierra_glosas_new
end type
type em_4 from editmask within w_cierra_glosas_new
end type
type em_2 from editmask within w_cierra_glosas_new
end type
type st_3 from statictext within w_cierra_glosas_new
end type
type st_2 from statictext within w_cierra_glosas_new
end type
type em_1 from editmask within w_cierra_glosas_new
end type
type pb_cancel from picturebutton within w_cierra_glosas_new
end type
type pb_ok from picturebutton within w_cierra_glosas_new
end type
type gb_1 from groupbox within w_cierra_glosas_new
end type
type gb_2 from groupbox within w_cierra_glosas_new
end type
end forward

global type w_cierra_glosas_new from window
integer width = 2560
integer height = 456
boolean titlebar = true
string title = "Modificar Fecha Reenvio"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "giros.ico"
boolean center = true
em_3 em_3
st_4 st_4
st_1 st_1
em_4 em_4
em_2 em_2
st_3 st_3
st_2 st_2
em_1 em_1
pb_cancel pb_cancel
pb_ok pb_ok
gb_1 gb_1
gb_2 gb_2
end type
global w_cierra_glosas_new w_cierra_glosas_new

type variables
st_amortizar i_st
int l_anyo,l_min, l_max
end variables

on w_cierra_glosas_new.create
this.em_3=create em_3
this.st_4=create st_4
this.st_1=create st_1
this.em_4=create em_4
this.em_2=create em_2
this.st_3=create st_3
this.st_2=create st_2
this.em_1=create em_1
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.em_3,&
this.st_4,&
this.st_1,&
this.em_4,&
this.em_2,&
this.st_3,&
this.st_2,&
this.em_1,&
this.pb_cancel,&
this.pb_ok,&
this.gb_1,&
this.gb_2}
end on

on w_cierra_glosas_new.destroy
destroy(this.em_3)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.em_4)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;i_st=message.powerobjectparm
em_1.text=string(date(i_st.dw_cab.getitemdatetime(i_st.dw_cab.getrow(),'fecha_envia')))
em_2.text=string(date(i_st.dw_cab.getitemdatetime(i_st.dw_cab.getrow(),'fecha_radica')))
end event

type em_3 from editmask within w_cierra_glosas_new
integer x = 1248
integer y = 148
integer width = 402
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event modified;if f_docu_cartera(datetime(em_4.text))=-1 then
	em_4.text=string(today())
	return 1
end if

end event

type st_4 from statictext within w_cierra_glosas_new
integer x = 1253
integer y = 92
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
string text = "Fecha Envío:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cierra_glosas_new
integer x = 1723
integer y = 92
integer width = 407
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Radicación:"
boolean focusrectangle = false
end type

type em_4 from editmask within w_cierra_glosas_new
integer x = 1719
integer y = 148
integer width = 402
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event modified;if f_docu_cartera(datetime(em_3.text))=-1 then
	em_3.text=string(today())
	return 1
end if

end event

type em_2 from editmask within w_cierra_glosas_new
integer x = 590
integer y = 148
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event modified;if f_docu_cartera(datetime(em_2.text))=-1 then
	em_2.text=string(today())
	return 1
end if

end event

type st_3 from statictext within w_cierra_glosas_new
integer x = 594
integer y = 92
integer width = 407
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Radicación:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cierra_glosas_new
integer x = 123
integer y = 92
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
string text = "Fecha Envío:"
boolean focusrectangle = false
end type

type em_1 from editmask within w_cierra_glosas_new
integer x = 119
integer y = 144
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event modified;if f_docu_cartera(datetime(em_1.text))=-1 then
	em_1.text=string(today())
	return 1
end if

end event

type pb_cancel from picturebutton within w_cierra_glosas_new
integer x = 2350
integer y = 168
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_cierra_glosas_new
integer x = 2350
integer y = 36
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;i_st.dw_cab.setitem(i_st.dw_cab.getrow(),'estado','3')
i_st.dw_cab.setitem(i_st.dw_cab.getrow(),'fecha_envia',datetime(date(em_3.text)))
i_st.dw_cab.setitem(i_st.dw_cab.getrow(),'fecha_radica',datetime(date(em_4.text)))

double ldb_ncobro
string ls_clug,ls_tipo,ls_err
datetime ldt_fecha

ls_tipo=i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'coddoc')
ls_clug=i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'clugar')
ldb_ncobro=i_st.dw_cab.getitemnumber(i_st.dw_cab.getrow(),'num_glosa')
ldt_fecha=datetime(date(em_3.text))
UPDATE car_cobro_cpo SET fecha = :ldt_fecha
from car_tipo INNER JOIN car_tipo_opera ON car_tipo.codtipo = car_tipo_opera.codtipo 
WHERE 
	(((car_cobro_cpo.coddoc_glosa)=:ls_tipo) 
	AND ((car_cobro_cpo.clugar_glosa)=:ls_clug) 
	AND ((car_cobro_cpo.num_glosa)=:ldb_ncobro) 
	AND ((car_tipo.operacion)=-1) 
	AND ((car_tipo.codtipo)='3') 
	and (car_cobro_cpo.cartipo = car_tipo.cartipo) );
	if sqlca.sqlcode=-1 then
		ls_err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo car_cobro_cpo',ls_err)
		return
	end if
if i_st.dw_cab.update(true,false)=-1 then return
i_st.dw_cab.resetupdate()
closewithreturn(parent,'ok')


end event

type gb_1 from groupbox within w_cierra_glosas_new
integer x = 37
integer y = 24
integer width = 1106
integer height = 304
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valor Actual"
end type

type gb_2 from groupbox within w_cierra_glosas_new
integer x = 1166
integer y = 24
integer width = 1106
integer height = 304
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valor Actualizar"
end type

