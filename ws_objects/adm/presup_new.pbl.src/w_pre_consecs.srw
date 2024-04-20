$PBExportHeader$w_pre_consecs.srw
forward
global type w_pre_consecs from window
end type
type st_1 from statictext within w_pre_consecs
end type
type dw_vigen from datawindow within w_pre_consecs
end type
type pb_nuevo from picturebutton within w_pre_consecs
end type
type pb_2 from picturebutton within w_pre_consecs
end type
type pb_grabartmp from picturebutton within w_pre_consecs
end type
type pb_cancelar from picturebutton within w_pre_consecs
end type
type dw_1 from datawindow within w_pre_consecs
end type
end forward

global type w_pre_consecs from window
integer width = 2391
integer height = 1216
boolean titlebar = true
string title = "Presupuesto - Configuración Consecutivos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_consec.ico"
st_1 st_1
dw_vigen dw_vigen
pb_nuevo pb_nuevo
pb_2 pb_2
pb_grabartmp pb_grabartmp
pb_cancelar pb_cancelar
dw_1 dw_1
end type
global w_pre_consecs w_pre_consecs

type variables
double cod_vigencia

end variables

on w_pre_consecs.create
this.st_1=create st_1
this.dw_vigen=create dw_vigen
this.pb_nuevo=create pb_nuevo
this.pb_2=create pb_2
this.pb_grabartmp=create pb_grabartmp
this.pb_cancelar=create pb_cancelar
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dw_vigen,&
this.pb_nuevo,&
this.pb_2,&
this.pb_grabartmp,&
this.pb_cancelar,&
this.dw_1}
end on

on w_pre_consecs.destroy
destroy(this.st_1)
destroy(this.dw_vigen)
destroy(this.pb_nuevo)
destroy(this.pb_2)
destroy(this.pb_grabartmp)
destroy(this.pb_cancelar)
destroy(this.dw_1)
end on

event closequery;if dw_1.ModifiedCount() > 0 or dw_1.DeletedCount() > 0 then
	if messageBox('Aviso','No ha guardado los cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then
		return -1
	end if
end if

end event

type st_1 from statictext within w_pre_consecs
integer x = 37
integer y = 24
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vigencia:"
boolean focusrectangle = false
end type

type dw_vigen from datawindow within w_pre_consecs
event retornar ( )
integer x = 270
integer y = 12
integer width = 681
integer height = 84
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigen"
boolean border = false
boolean livescroll = true
end type

event retornar();this.SetItem(1,'cod_vigencia',cod_vigencia)

end event

event itemchanged;if dw_1.ModifiedCount() > 0 or dw_1.DeletedCount() > 0 then
	if messageBox('Aviso','No ha guardado los cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then
		cod_vigencia = this.GetItemNumber(1,'cod_vigencia')
		this.PostEvent("retornar")
		return 2
	end if
end if

dw_1.Reset()
this.accepttext()
dw_1.Retrieve(this.GetItemNumber(1,'cod_vigencia'))

end event

event constructor;SetTransObject(SQLCA)
InsertRow(0)

end event

type pb_nuevo from picturebutton within w_pre_consecs
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 1074
integer y = 976
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo documento"
end type

event clicked;long fila
fila = dw_1.InsertRow(0)
dw_1.SetItem(fila,'cod_vigencia',dw_vigen.GetItemNumber(1,'cod_vigencia'))

end event

type pb_2 from picturebutton within w_pre_consecs
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 1211
integer y = 976
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
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar documento Nuevo"
end type

event clicked;dw_1.DeleteRow(dw_1.GetRow())

end event

type pb_grabartmp from picturebutton within w_pre_consecs
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 1349
integer y = 976
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
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar Temporal"
end type

event clicked;if dw_1.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
Return 0

end event

type pb_cancelar from picturebutton within w_pre_consecs
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 937
integer y = 976
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_pre_consecs
integer x = 37
integer y = 112
integer width = 2290
integer height = 844
integer taborder = 10
string title = "none"
string dataobject = "dw_pre_consecs"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

