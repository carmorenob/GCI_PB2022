$PBExportHeader$w_citas_os.srw
forward
global type w_citas_os from window
end type
type st_1 from statictext within w_citas_os
end type
type rb_2 from radiobutton within w_citas_os
end type
type rb_3 from radiobutton within w_citas_os
end type
type rb_1 from radiobutton within w_citas_os
end type
type pb_1 from picturebutton within w_citas_os
end type
type cb_guarda from picturebutton within w_citas_os
end type
type dw_1 from datawindow within w_citas_os
end type
end forward

global type w_citas_os from window
integer width = 3579
integer height = 1456
boolean titlebar = true
string title = "Ordenes de Servicio pendientes de Citas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "cambia_doc.ico"
boolean center = true
st_1 st_1
rb_2 rb_2
rb_3 rb_3
rb_1 rb_1
pb_1 pb_1
cb_guarda cb_guarda
dw_1 dw_1
end type
global w_citas_os w_citas_os

type variables
st_citas_os st_os
end variables

on w_citas_os.create
this.st_1=create st_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_1=create rb_1
this.pb_1=create pb_1
this.cb_guarda=create cb_guarda
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.rb_2,&
this.rb_3,&
this.rb_1,&
this.pb_1,&
this.cb_guarda,&
this.dw_1}
end on

on w_citas_os.destroy
destroy(this.st_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_1)
destroy(this.pb_1)
destroy(this.cb_guarda)
destroy(this.dw_1)
end on

event open;st_os = Message.PowerObjectParm
dw_1.Retrieve(tipdoc,docu,st_os.grupo)

end event

type st_1 from statictext within w_citas_os
integer x = 37
integer y = 104
integer width = 3456
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "El Paciente tiene los siguientes servicios de ordenes de servicio de Consulta Externa sin Asignar, marque los que desea asignar y presione aceptar."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_2 from radiobutton within w_citas_os
integer x = 878
integer y = 12
integer width = 823
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenes Urgencias/Hospitalización"
end type

event clicked;dw_1.dataobject="dw_citas_os_hu"
dw_1.settransobject(sqlca)
dw_1.retrieve(tipdoc,docu,st_os.grupo)
st_1.text="El Paciente tiene los siguientes servicios de ordenes de servicio de Hospitalización/Urgencias sin Asignar, marque los que desea asignar y presione aceptar."
end event

type rb_3 from radiobutton within w_citas_os
integer x = 1833
integer y = 12
integer width = 699
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tratamientos Odontológicos"
end type

event clicked;dw_1.dataobject="dw_citas_tto_odonto"
dw_1.settransobject(sqlca)
dw_1.retrieve(tipdoc,docu,st_os.grupo)
st_1.text="El Paciente tiene los siguientes servicios de tratamientos Odontológicos sin Asignar, marque los que desea asignar y presione aceptar."
end event

type rb_1 from radiobutton within w_citas_os
integer x = 41
integer y = 12
integer width = 718
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenes de Consulta Externa"
boolean checked = true
end type

event clicked;dw_1.dataobject="dw_citas_os"
dw_1.settransobject(sqlca)
dw_1.retrieve(tipdoc,docu,st_os.grupo)
st_1.text="El Paciente tiene los siguientes servicios de ordenes de servicio de Consulta Externa sin Asignar, marque los que desea asignar y presione aceptar."
end event

type pb_1 from picturebutton within w_citas_os
event mousemove pbm_mousemove
integer x = 1760
integer y = 1212
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &g"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)
end event

type cb_guarda from picturebutton within w_citas_os
event mousemove pbm_mousemove
integer x = 1605
integer y = 1212
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &g"
boolean default = true
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Llevar a Citas"
end type

event clicked;if not isValid(dw_1) then Return
if dw_1.accepttext()=-1 then return
int i, ff,j,k,actual
string valor

for i = 1 to dw_1.RowCount()
	if dw_1.GetItemNumber(i,'selec') = 0 then CONTINUE

	ff=0
	if ff=0 then
		ff = st_os.dw_os.InsertRow(0)
		for k=1 to ff 
		    if st_os.dw_os.find("nservicio="+string(k),1,ff)= 0 then 
				valor = st_os.dw_os.Describe("Evaluate('max(nservicio)',0)")
				st_os.dw_os.setitem(ff,"nservicio",long(valor) + 1)
				exit
			end if
		next
		st_os.dw_os.setitem(ff,"cod_cups",dw_1.GetItemString(i,'cod_cups'))
		st_os.dw_os.setitem(ff,"cproced",dw_1.GetItemString(i,'codproced'))
		st_os.dw_os.setitem(ff,"nturnos",dw_1.GetItemNumber(i,'nturnos'))	
		st_os.dw_os.setitem(ff,"secuencia",dw_1.GetItemString(i,'secuencia'))
		for k=1 to dw_1.GetItemNumber(i,'nturnos')
			st_os.dw_sercios.insertrow(1)
			st_os.dw_sercios.setitem(1,'nservicio',long(valor) + 1)
			if dw_1.GetItemNumber(i,'nturnos')=1 then
				st_os.dw_sercios.setitem(1,'sec_cant',1)
			else
				st_os.dw_sercios.setitem(1,'sec_cant',k)
  			end if
			st_os.dw_sercios.setitem(1,'cproced',dw_1.GetItemString(i,'codproced'))
			if rb_1.checked=true or rb_2.checked=true then
				st_os.dw_sercios.setitem(1,'contador_os',dw_1.GetItemNumber(i,'contador'))
				st_os.dw_sercios.setitem(1,'clugar_os',dw_1.GetItemstring(i,'clugar'))
				st_os.dw_sercios.setitem(1,'nsolicitud_os',dw_1.GetItemNumber(i,'nsolicitud'))
				st_os.dw_sercios.setitem(1,'item_os',dw_1.GetItemNumber(i,'item'))
			end if
			if rb_3.checked=true then
				st_os.dw_sercios.setitem(1,'ntratamiento',dw_1.getitemnumber(i,'ntratamiento'))
				st_os.dw_sercios.setitem(1,'clugar_tto',dw_1.GetItemstring(i,'clugar_tto'))
				st_os.dw_sercios.setitem(1,'item_tto',dw_1.GetItemNumber(i,'item_tto'))
			end if
   		next
	end if
next
close(parent)

end event

type dw_1 from datawindow within w_citas_os
integer x = 32
integer y = 256
integer width = 3465
integer height = 932
integer taborder = 10
string title = "none"
string dataobject = "dw_citas_os"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)

end event

event clicked;int i, selec
if String(dwo.Name) = 'selec_t' then
	i = this.Find('selec=0',1,this.RowCount())
	if i = 0 then 
		selec = 0 
	else 
		selec = 1
	end if
	for i = 1 to this.RowCount()
		this.SetItem(i,'selec',selec)
	next
end if
end event

event retrieveend;if rowcount>0 then
	long j
	for j=1 to rowcount
		setitem(j,'c_llevar',getitemnumber(j,'pendiente'))
		if isnull(getitemnumber(j,'nturnos')) then
			setitem(j,'nturnos',1)
			setitem(j,'secuencia','1')
		end if
	next
end if
end event

