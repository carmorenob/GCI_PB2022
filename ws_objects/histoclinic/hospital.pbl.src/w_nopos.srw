$PBExportHeader$w_nopos.srw
forward
global type w_nopos from window
end type
type pb_print_ent from pb_report within w_nopos
end type
type cb_cancel from picturebutton within w_nopos
end type
type pb_change_est from picturebutton within w_nopos
end type
type pb_save from picturebutton within w_nopos
end type
type dw_np from datawindow within w_nopos
end type
end forward

global type w_nopos from window
integer width = 3689
integer height = 2480
boolean titlebar = true
string title = "Formato No POs"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Asterisk!"
boolean center = true
pb_print_ent pb_print_ent
cb_cancel cb_cancel
pb_change_est pb_change_est
pb_save pb_save
dw_np dw_np
end type
global w_nopos w_nopos

type variables
long i_contador_np
string i_clug_his_np,i_profe_np
int i_norden_np,ord_ser_item_np
end variables

on w_nopos.create
this.pb_print_ent=create pb_print_ent
this.cb_cancel=create cb_cancel
this.pb_change_est=create pb_change_est
this.pb_save=create pb_save
this.dw_np=create dw_np
this.Control[]={this.pb_print_ent,&
this.cb_cancel,&
this.pb_change_est,&
this.pb_save,&
this.dw_np}
end on

on w_nopos.destroy
destroy(this.pb_print_ent)
destroy(this.cb_cancel)
destroy(this.pb_change_est)
destroy(this.pb_save)
destroy(this.dw_np)
end on

event open;trae_ord trae2_ord
trae2_ord=message.powerobjectparm
i_contador_np=trae2_ord.contador
i_clug_his_np=trae2_ord.lugar
i_norden_np=trae2_ord.solicitud
ord_ser_item_np=trae2_ord.item
i_profe_np=trae2_ord.profe
dw_np.retrieve(i_contador_np,i_clug_his_np,i_norden_np,ord_ser_item_np)

end event

type pb_print_ent from pb_report within w_nopos
integer x = 3515
integer y = 184
integer width = 137
integer taborder = 30
string text = "        &p"
boolean originalsize = false
string powertiptext = "Imprimir Formulario No Pos [Alt+P]"
string cod_rep = "HF"
string nombre_rep = "Reporte de No Pos"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_np.rowcount()<1 then return
if dw_np.getitemstring(1,'regis')<>'1' then return

any par[4]
par[1]=dw_np.getitemnumber(1,"contador")
par[2]=dw_np.getitemstring(1,"clugar")
par[3]=dw_np.getitemnumber(1,"nsolicitud")
par[4]=dw_np.getitemnumber(1,"item")
imprimir(par,i_profe_np,'0')
close(parent)

end event

type cb_cancel from picturebutton within w_nopos
event mousemove pbm_mousemove
boolean visible = false
integer x = 3511
integer y = 320
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &c"
boolean cancel = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;if dw_np.getitemstring(1,'regis')<>'1' then return
close(parent)
end event

type pb_change_est from picturebutton within w_nopos
boolean visible = false
integer x = 3515
integer y = 460
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "abrir2.gif"
string disabledname = "d_abrir2.gif"
alignment htextalign = left!
string powertiptext = "Cambiar Estado a Activa"
end type

event clicked;dw_np.setitem(1,'regis','0')

end event

type pb_save from picturebutton within w_nopos
event mousemove pbm_mousemove
integer x = 3511
integer y = 56
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &g"
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Datos Ingreso [Alt+G]"
end type

event clicked;dw_np.accepttext()

If (isnull(dw_np.getitemstring(1,"p1")) or isnull(dw_np.getitemstring(1,"p2")) or isnull(dw_np.getitemstring(1,"p3")) or 	isnull(dw_np.getitemstring(1,"p4")) or isnull(dw_np.getitemstring(1,"p5")) or isnull(dw_np.getitemstring(1,"p6"))) then
	messagebox("Error","Debe escoger datos de Justificación del Medicamento")
	return -1
end if
If (isnull(dw_np.getitemstring(1,"tiempo"))) then
	messagebox("Error","Debe escoger Tiempo de uso")
	return -1
end if
If (isnull(dw_np.getitemstring(1,"efecto")) or isnull(dw_np.getitemstring(1,"tiempo_rta"))) then
	messagebox("Error","Debe escoger datos Efecto Esperado")
	return -1
end if
If (dw_np.getitemstring(1,"p1")='1' and isnull(dw_np.getitemstring(1,"medi_pos"))  ) then
	messagebox("Error","Debe escoger datos Se agotaron Posibilidades")
	return -1
end if

If ( isnull(dw_np.getitemstring(1,"rta"))  ) then
	messagebox("Error","Debe escoger Datos Respuesta Clínica")
	return -1
end if
dw_np.setitem(1,'regis','1')
if dw_np.update()=-1 then
	rollback;
else
	commit;
end if
close(parent)
end event

type dw_np from datawindow within w_nopos
integer x = 14
integer y = 4
integer width = 3488
integer height = 2368
integer taborder = 10
string title = "none"
string dataobject = "dw_no_pos"
boolean border = false
end type

event constructor;this.settransobject(sqlca)
end event

