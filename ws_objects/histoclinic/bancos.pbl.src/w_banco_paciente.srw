$PBExportHeader$w_banco_paciente.srw
forward
global type w_banco_paciente from window
end type
type pb_cancel from picturebutton within w_banco_paciente
end type
type pb_ok from picturebutton within w_banco_paciente
end type
type st_1 from statictext within w_banco_paciente
end type
type dw_items from datawindow within w_banco_paciente
end type
type dw_2 from datawindow within w_banco_paciente
end type
type dw_1 from datawindow within w_banco_paciente
end type
end forward

global type w_banco_paciente from window
integer width = 2181
integer height = 1192
boolean titlebar = true
string title = "Banco de Fluidos - Características del Paciente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
st_1 st_1
dw_items dw_items
dw_2 dw_2
dw_1 dw_1
end type
global w_banco_paciente w_banco_paciente

type variables
datawindowchild idw_lista_enc
st_clasif i_st
end variables

on w_banco_paciente.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_1=create st_1
this.dw_items=create dw_items
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.st_1,&
this.dw_items,&
this.dw_2,&
this.dw_1}
end on

on w_banco_paciente.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_1)
destroy(this.dw_items)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
if dw_1.retrieve(i_st.tdoc,i_st.docu,i_st.banco)=0 then
	dw_1.insertrow(1)
	dw_1.setitem(1,'tipodoc',i_st.tdoc)
	dw_1.setitem(1,'documento',i_st.docu)
	dw_1.setitem(1,'cod_banco',i_st.banco)
end if
if dw_2.retrieve(i_st.tdoc,i_st.docu,i_st.banco)=0 then
	dw_items.retrieve(i_st.banco,i_st.sexo)
	long j,donde
	for j=1 to dw_items.rowcount()
		if dw_items.getitemstring(j,'obligatorio')='0' or isnull(dw_items.getitemstring(j,'obligatorio')) then continue
		donde=dw_2.insertrow(0)
		dw_2.setitem(donde,'tipodoc',i_st.tdoc)
		dw_2.setitem(donde,'documento',i_st.docu)
		dw_2.setitem(donde,'cod_banco',i_st.banco)
		dw_2.setitem(donde,'item',dw_items.getitemnumber(j,'item'))
		dw_2.setitem(donde,'descrip_item',dw_items.getitemstring(j,'descrip_item'))
	next
	dw_2.event rowfocuschanged(1)
end if
end event

type pb_cancel from picturebutton within w_banco_paciente
integer x = 1106
integer y = 956
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_banco_paciente
integer x = 942
integer y = 956
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_2.find('isnull(descrip_lista)',1,dw_2.rowcount())>0 then
	messagebox('Atención','Debe elegir todos los items')
	return
end if
if dw_1.update(true,false)=-1 then return
if dw_2.update(true,false)=-1 then return
commit;
dw_1.resetupdate()
dw_2.resetupdate()
i_st.dw.reset()
dw_2.rowscopy(1,DW_2.ROWCOUNT(),primary!,i_st.dw,1,primary!)
i_st.dw.resetupdate()
closewithreturn(parent,'ok')
end event

type st_1 from statictext within w_banco_paciente
integer x = 5
integer y = 300
integer width = 1001
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Características del Paciente para este Banco:"
boolean focusrectangle = false
end type

type dw_items from datawindow within w_banco_paciente
boolean visible = false
integer x = 1051
integer y = 48
integer width = 882
integer height = 232
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_banco_item_encuesta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type dw_2 from datawindow within w_banco_paciente
integer y = 364
integer width = 2158
integer height = 572
integer taborder = 20
string title = "none"
string dataobject = "dw_banco_pac_caract"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;getchild('descrip_lista',idw_lista_enc)
idw_lista_enc.settransobject(sqlca)
settransobject(sqlca)
end event

event itemchanged;if dwo.name='descrip_lista' then
	setitem(getrow(),'subitem',idw_lista_enc.getitemnumber(idw_lista_enc.getrow(),'subitem'))
end if
end event

event dberror;rollback;
return 0
end event

event rowfocuschanged;if getrow()<1 then return
idw_lista_enc.retrieve(i_st.banco,getitemnumber(getrow(),'item'))
end event

type dw_1 from datawindow within w_banco_paciente
integer y = 64
integer width = 942
integer height = 224
integer taborder = 10
string title = "none"
string dataobject = "dw_banco_paciente"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event dberror;rollback;
return 0
end event

