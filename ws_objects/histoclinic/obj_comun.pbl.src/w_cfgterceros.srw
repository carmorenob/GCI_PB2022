$PBExportHeader$w_cfgterceros.srw
forward
global type w_cfgterceros from window
end type
type dw_1 from datawindow within w_cfgterceros
end type
type dw_ter_tmp from datawindow within w_cfgterceros
end type
type st_ayuda from statictext within w_cfgterceros
end type
type tab_1 from tab within w_cfgterceros
end type
type tg_1 from userobject within tab_1
end type
type pb_cancelar from picturebutton within tg_1
end type
type pb_buscar from picturebutton within tg_1
end type
type pb_grabar from picturebutton within tg_1
end type
type pb_insert from picturebutton within tg_1
end type
type pb_borrar from picturebutton within tg_1
end type
type tab_2 from tab within tg_1
end type
type tabpage_2 from userobject within tab_2
end type
type pb_3 from picturebutton within tabpage_2
end type
type pb_2 from picturebutton within tabpage_2
end type
type pb_1 from picturebutton within tabpage_2
end type
type dw_ubi from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_2
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_ubi dw_ubi
end type
type tabpage_1 from userobject within tab_2
end type
type dw_tipo from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_2
dw_tipo dw_tipo
end type
type tab_2 from tab within tg_1
tabpage_2 tabpage_2
tabpage_1 tabpage_1
end type
type dw_terceros from datawindow within tg_1
end type
type tg_1 from userobject within tab_1
pb_cancelar pb_cancelar
pb_buscar pb_buscar
pb_grabar pb_grabar
pb_insert pb_insert
pb_borrar pb_borrar
tab_2 tab_2
dw_terceros dw_terceros
end type
type tab_1 from tab within w_cfgterceros
tg_1 tg_1
end type
type dw_emp from datawindow within w_cfgterceros
end type
end forward

global type w_cfgterceros from window
integer width = 5582
integer height = 2032
boolean titlebar = true
string title = "Creación Terceros"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "respon.ico"
boolean clientedge = true
boolean center = true
dw_1 dw_1
dw_ter_tmp dw_ter_tmp
st_ayuda st_ayuda
tab_1 tab_1
dw_emp dw_emp
end type
global w_cfgterceros w_cfgterceros

type variables
DataWindowChild dwc_ciudad, dwc_tipodoc,dwc_tiporet,dwc_postal,dwc_oficina
long xant, yant
st_general messObj
Datawindow dw_obj


end variables

forward prototypes
public subroutine muestra2 (string mostrar, integer xpos, integer ypos)
end prototypes

public subroutine muestra2 (string mostrar, integer xpos, integer ypos);//if xant=xpos and ypos=yant then return
//xant=xpos
//yant=ypos
//if st_ayuda.visible = false or st_ayuda.text<>mostrar then
//	st_ayuda.visible=false
//	st_ayuda.text=mostrar
//	st_ayuda.width=len(mostrar)*28
//	if pointerx() + st_ayuda.width +35 > this.width then 
//		xpos=pointerx() - st_ayuda.width -35
//	else
//		xpos=pointerx() +30
//	end if
//	if pointery() + 270 > this.height then 
//		ypos=pointery() - 100
//	else
//		ypos=pointery() +80
//	end if
//	st_ayuda.x=xpos
//	st_ayuda.y=ypos
//	st_ayuda.visible=true
//	timer(5)
//end if
end subroutine

on w_cfgterceros.create
this.dw_1=create dw_1
this.dw_ter_tmp=create dw_ter_tmp
this.st_ayuda=create st_ayuda
this.tab_1=create tab_1
this.dw_emp=create dw_emp
this.Control[]={this.dw_1,&
this.dw_ter_tmp,&
this.st_ayuda,&
this.tab_1,&
this.dw_emp}
end on

on w_cfgterceros.destroy
destroy(this.dw_1)
destroy(this.dw_ter_tmp)
destroy(this.st_ayuda)
destroy(this.tab_1)
destroy(this.dw_emp)
end on

event open;dw_emp.SetTransObject(SQLCA)
tab_1.tg_1.tab_2.tabpage_2.dw_ubi.GetChild('desciudad',dwc_ciudad)
tab_1.tg_1.dw_terceros.GetChild('tipodoc', dwc_tipodoc)
tab_1.tg_1.dw_terceros.GetChild('tipo_ret', dwc_tiporet)
dw_ter_tmp.SetTransObject(SQLCA)
dw_ter_tmp.insertRow(0)
dwc_tipodoc.SetTransObject(SQLCA)
dwc_tipodoc.Retrieve()
dwc_tiporet.SetTransObject(SQLCA)
dwc_tiporet.InsertRow(0)
dwc_ciudad.SetTransObject(SQLCA)
dwc_ciudad.InsertRow(0)
tab_1.tg_1.dw_terceros.SetTransObject(SQLCA)
tab_1.tg_1.dw_terceros.InsertRow(0)
messObj = Message.PowerObjectParm
if isValid(messObj) then
	tab_1.tg_1.dw_terceros.Reset()
	tab_1.tg_1.pb_insert.TriggerEvent(clicked!)
	tab_1.tg_1.dw_terceros.SetItem(tab_1.tg_1.dw_terceros.GetRow(),'persona','N')
	tab_1.tg_1.dw_terceros.SetItem(tab_1.tg_1.dw_terceros.GetRow(),'tipodoc',messObj.valor)
	tab_1.tg_1.dw_terceros.SetItem(tab_1.tg_1.dw_terceros.GetRow(),'documento',messObj.documento)
	tab_1.tg_1.dw_terceros.SetItem(tab_1.tg_1.dw_terceros.GetRow(),'emp',1)
	dw_obj = messObj.dw_obj
end if

end event

event timer;st_ayuda.visible = FALSE
end event

event mousemove;st_ayuda.visible = FALSE

end event

event closequery;if tab_1.tg_1.dw_terceros.ModifiedCount() > 0 then
	if messageBox('Aviso','Ha efectuado cambios desea guardarlos?',QUESTION!,YESNO!) = 1 then
		if tab_1.tg_1.dw_terceros.update() = -1 then
			rollback;
			Return -1
		else
			commit;
		end if
	else
		tab_1.tg_1.dw_terceros.ResetUpdate()
	end if
end if
end event

type dw_1 from datawindow within w_cfgterceros
boolean visible = false
integer x = 448
integer y = 1868
integer width = 133
integer height = 92
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_regla_gen_empleado"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.accepttext()
string tipodoc, documento

tipodoc = this.getitemstring(this.getrow(),'tipodoc')
documento = this.getitemstring(this.getrow(),'documento')
if not isNull(dwo) then
	if (dwo.Name) <> 'documento' then Return
end if

this.retrieve(tipodoc, documento)
IF this.rowcount()=0 THEN
	this.InsertRow(0)
	Setitem(1,'tipodoc',tipodoc)
	Setitem(1,'documento',documento)
	if messagebox ("Atención","Empleado no encontrado. ~rDesea Crearlo?",Question!,YesNo!,2 )=1 then
		tab_1.tg_1.pb_insert.PostEvent(clicked!)
		return
	end if
else
	tab_1.tg_1.dw_terceros.Retrieve(tipodoc,documento)
end if

end event

event constructor;setTransObject(SQLCA)
insertRow(1)

end event

type dw_ter_tmp from datawindow within w_cfgterceros
boolean visible = false
integer x = 1321
integer y = 1836
integer width = 626
integer height = 64
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_ter_tmp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if isNull(this.GetItemString(this.getRow(),'tipodoc')) then Return
tab_1.tg_1.tab_2.tabpage_1.dw_tipo.retrieve( this.GetItemString(this.getRow(),'tipodoc'),this.GetItemString(this.getRow(),'documento'))
tab_1.tg_1.dw_terceros.retrieve( this.GetItemString(this.getRow(),'tipodoc'),this.GetItemString(this.getRow(),'documento'))

end event

type st_ayuda from statictext within w_cfgterceros
boolean visible = false
integer x = 37
integer y = 1868
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb(255,255,220)
end event

type tab_1 from tab within w_cfgterceros
event create ( )
event destroy ( )
integer y = 12
integer width = 5486
integer height = 1812
integer taborder = 20
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tg_1 tg_1
end type

on tab_1.create
this.tg_1=create tg_1
this.Control[]={this.tg_1}
end on

on tab_1.destroy
destroy(this.tg_1)
end on

type tg_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5449
integer height = 1684
long backcolor = 67108864
string text = "Datos Jurídicos"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
pb_cancelar pb_cancelar
pb_buscar pb_buscar
pb_grabar pb_grabar
pb_insert pb_insert
pb_borrar pb_borrar
tab_2 tab_2
dw_terceros dw_terceros
end type

on tg_1.create
this.pb_cancelar=create pb_cancelar
this.pb_buscar=create pb_buscar
this.pb_grabar=create pb_grabar
this.pb_insert=create pb_insert
this.pb_borrar=create pb_borrar
this.tab_2=create tab_2
this.dw_terceros=create dw_terceros
this.Control[]={this.pb_cancelar,&
this.pb_buscar,&
this.pb_grabar,&
this.pb_insert,&
this.pb_borrar,&
this.tab_2,&
this.dw_terceros}
end on

on tg_1.destroy
destroy(this.pb_cancelar)
destroy(this.pb_buscar)
destroy(this.pb_grabar)
destroy(this.pb_insert)
destroy(this.pb_borrar)
destroy(this.tab_2)
destroy(this.dw_terceros)
end on

type pb_cancelar from picturebutton within tg_1
integer x = 3739
integer y = 592
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;if w_cfgterceros.windowtype = response! then
	closewithReturn(w_cfgterceros,'')
else
	close(w_cfgterceros)
end if

end event

type pb_buscar from picturebutton within tg_1
string tag = "Buscar"
integer x = 3735
integer y = 452
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
string picturename = "lupa.gif"
string disabledname = "d_lupa.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;g_tercerodesde=1
openwithparm(w_buscater,dw_ter_tmp)
dw_ter_tmp.TriggerEvent(itemchanged!)
end event

type pb_grabar from picturebutton within tg_1
string tag = "Grabar"
integer x = 3735
integer y = 316
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Grabar"
end type

event clicked;if not f_demo('ter') then return
if tab_1.tg_1.dw_terceros.AcceptText() = -1 then
	messageBox('Aviso','No todos los datos cumplen sus restricciones')
	Return
end if
string td,doc,msg
long cuenta
if tab_1.tg_1.dw_terceros.RowCount() > 0 then
	
	if tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'persona') ='N' then
		if isNull(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'nombre1')) or trim(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'nombre1')) = '' then
			messagebox("Atención","Debe digitar el Nombre1 ")
			return -1
		end if
		if isNull(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'apellido1')) or trim(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'apellido1')) = '' then
			messagebox("Atención","Debe digitar el Apellido1")
			return -1
		end if
	else
		if isNull(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'razon_social')) or trim(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'razon_social')) = '' then
			messagebox("Atención","Debe digitar Razón Social")
			return -1
		end if	
	end if
	if isNull(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'tipo_reg')) or trim(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'tipo_reg')) = '' then
		messagebox("Atención","Debe digitar Tipo Regimen")
		return -1
	end if	
	if isNull(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'tipo_ret')) or trim(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'tipo_ret')) = '' then
		messagebox("Atención","Debe digitar Responsabilidad Fiscal")
		return -1
	end if	
	
	if tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'tipodoc') = 'NI' then
		if isNull(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'dverificacion')) or trim(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'dverificacion')) = '' then
			MessageBox('Atención','Debe proporcionar el dígito de verificación')
			Return -1
		end if
		if f_dverificacion(tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'documento')) <> tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'dverificacion') then
			MessageBox('Atención','El NIT o el dígito de verificación estan erroneos.')
			Return -1
		end if
	end if
	
end if
tab_1.tg_1.dw_terceros.setitem(tab_1.tg_1.dw_terceros.GetRow(),'fondopension', tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemstring(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'fondopension'))
tab_1.tg_1.dw_terceros.setitem(tab_1.tg_1.dw_terceros.GetRow(),'fondocesantia', tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemstring(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'fondocesantia'))
tab_1.tg_1.dw_terceros.setitem(tab_1.tg_1.dw_terceros.GetRow(),'cajam', tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemstring(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'cajam'))
tab_1.tg_1.dw_terceros.setitem(tab_1.tg_1.dw_terceros.GetRow(),'cajacomp', tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemstring(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'cajacomp'))
tab_1.tg_1.dw_terceros.setitem(tab_1.tg_1.dw_terceros.GetRow(),'publico', tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemstring(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'publico'))
tab_1.tg_1.dw_terceros.setitem(tab_1.tg_1.dw_terceros.GetRow(),'eps', tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemstring(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'eps'))
tab_1.tg_1.dw_terceros.setitem(tab_1.tg_1.dw_terceros.GetRow(),'arp', tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemstring(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'arp'))
tab_1.tg_1.dw_terceros.setitem(tab_1.tg_1.dw_terceros.GetRow(),'cooperativa', tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemstring(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'cooperativa'))
tab_1.tg_1.dw_terceros.setitem(tab_1.tg_1.dw_terceros.GetRow(),'ahorro', tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemstring(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'ahorro'))
if tab_1.tg_1.dw_terceros.Update() = -1 then
	Rollback;
else
	if tab_1.tg_1.tab_2.tabpage_2.dw_ubi.Update()= -1 then 	
		Rollback;				
		Return
	end if
	if tab_1.tg_1.dw_terceros.RowCount() > 0 then
		if tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemNumber(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'emp') = 1 then
			if dw_emp.retrieve(tab_1.tg_1.dw_terceros.GetITemString(tab_1.tg_1.dw_terceros.GetRow(),'tipodoc'), tab_1.tg_1.dw_terceros.GetITemString(tab_1.tg_1.dw_terceros.GetRow(),'documento')) = 0 then
				dw_emp.insertRow(1)
				dw_emp.SetItem(1,'tipodoc',tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'tipodoc'))
				dw_emp.SetItem(1,'documento',tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'documento'))
				dw_emp.SetItem(1,'estado','1')
				dw_emp.SetItem(1,'usuario',usuario)
				dw_emp.SetItem(1,'usufecha',today())
				if dw_emp.Update() = -1 then
					Return
				end if
			end if
		elseif tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetItemNumber(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.getRow(),'emp') = 0 then
			td = tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'tipodoc')
			doc = tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'documento')
			select count(*) into :cuenta from empleados
			where tipodoc=:td and documento=:doc;
			IF SQLCA.SQLCode = -1 THEN
				msg = SQLCA.SQLErrText
				Rollback;
				MessageBox("SQL error", msg)
				Return -1
			END IF
			if cuenta > 0 then
				delete from empleados where tipodoc=:td and documento=:doc;
				if SQLCA.SQLCode = -1 THEN
					msg = SQLCA.SQLErrText
					Rollback;
					MessageBox("SQL error", msg)
					Return -1
				end if
			end if
		end if
	end if
	commit;
end if
if isValid(dw_obj) then
	dw_obj.SetItem(dw_obj.GetRow(),'tipodoc',tab_1.tg_1.dw_terceros.GetITemString(tab_1.tg_1.dw_terceros.GetRow(),'tipodoc'))
	if dw_obj.dataobject='dw_empresa_basicos' then
		dw_obj.SetItem(dw_obj.GetRow(),'nit',tab_1.tg_1.dw_terceros.GetITemString(tab_1.tg_1.dw_terceros.GetRow(),'documento'))
		dw_obj.Event itemchanged(dw_obj.getrow(),dw_obj.object.nit,tab_1.tg_1.dw_terceros.GetITemString(tab_1.tg_1.dw_terceros.GetRow(),'documento'))
	else
		dw_obj.SetItem(dw_obj.GetRow(),'documento',tab_1.tg_1.dw_terceros.GetITemString(tab_1.tg_1.dw_terceros.GetRow(),'documento'))
		dw_obj.Event itemchanged(dw_obj.getrow(),dw_obj.object.documento,tab_1.tg_1.dw_terceros.GetITemString(tab_1.tg_1.dw_terceros.GetRow(),'documento'))
	end if
end if
if tab_1.tg_1.dw_terceros.RowCount()>0 then
	tab_1.tg_1.tab_2.tabpage_2.pb_1.enabled=true
	tab_1.tg_1.tab_2.tabpage_2.pb_2.enabled=true
	tab_1.tg_1.tab_2.tabpage_2.pb_3.enabled=true
else
	tab_1.tg_1.tab_2.tabpage_2.pb_1.enabled=false
	tab_1.tg_1.tab_2.tabpage_2.pb_2.enabled=false
	tab_1.tg_1.tab_2.tabpage_2.pb_3.enabled=false
end if

end event

type pb_insert from picturebutton within tg_1
integer x = 3735
integer y = 36
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
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Insertar"
end type

event clicked;long fila
tab_1.tg_1.dw_terceros.Reset()
tab_1.tg_1.dw_terceros.enabled=true
fila = tab_1.tg_1.dw_terceros.InsertRow(0)
tab_1.tg_1.dw_terceros.scrollToRow(fila)
tab_1.tg_1.dw_terceros.SetItem(fila,'estado','1')
tab_1.tg_1.dw_terceros.Setitem(1,'tipodoc',dw_1.GetItemString(1,'tipodoc'))
tab_1.tg_1.dw_terceros.Setitem(1,'documento',dw_1.GetItemString(1,'documento'))
fila =tab_1.tg_1.tab_2.tabpage_1.dw_tipo.InsertRow(0)



end event

type pb_borrar from picturebutton within tg_1
integer x = 3735
integer y = 172
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar"
end type

event clicked;if messageBox('Aviso','Esta seguro de querer borrar el registro actual?',QUESTION!,YESNO!) = 1 then
	string td, doc
	td = tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'tipodoc')
	doc =tab_1.tg_1.dw_terceros.GetItemString(tab_1.tg_1.dw_terceros.GetRow(),'documento')
	tab_1.tg_1.dw_terceros.DeleteRow(tab_1.tg_1.dw_terceros.GetRow())
	if tab_1.tg_1.dw_terceros.Update() = -1 then
		Rollback;
		tab_1.tg_1.dw_terceros.Retrieve(td,doc)
	end if
	commit;
	tab_1.tg_1.dw_terceros.InsertRow(0)
end if

end event

type tab_2 from tab within tg_1
event create ( )
event destroy ( )
integer x = 14
integer y = 720
integer width = 5367
integer height = 956
integer taborder = 20
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_2 tabpage_2
tabpage_1 tabpage_1
end type

on tab_2.create
this.tabpage_2=create tabpage_2
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_2,&
this.tabpage_1}
end on

on tab_2.destroy
destroy(this.tabpage_2)
destroy(this.tabpage_1)
end on

type tabpage_2 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 5330
integer height = 828
long backcolor = 67108864
string text = "Direcciones"
long tabtextcolor = 33554432
string picturename = "actual.ico"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_ubi dw_ubi
end type

on tabpage_2.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_ubi=create dw_ubi
this.Control[]={this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_ubi}
end on

on tabpage_2.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_ubi)
end on

type pb_3 from picturebutton within tabpage_2
integer x = 5157
integer y = 304
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guarda Dirección"
end type

event clicked;if dw_ubi.getitemnumber(1,'tent')>1 then
	messagebox('Atención','Debe existir un registro de Entrega o Fact/Ent verifique')
	Return
end if
if dw_ubi.getitemnumber(1,'tfac')>1 then
	messagebox('Atención','Debe existir un registro de Tipo Facturación o Fact/Ent verifique')
	Return
end if
if dw_ubi.Update()= -1 then 	
	Rollback;				
	Return
end if

end event

type pb_2 from picturebutton within tabpage_2
integer x = 5157
integer y = 168
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Dirección"
end type

type pb_1 from picturebutton within tabpage_2
integer x = 5152
integer y = 28
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Inserta Dirección"
end type

event clicked;long fila
fila = dw_ubi.InsertRow(0)
dw_ubi.scrollToRow(fila)
dw_ubi.Setitem(fila,'tipodoc',tab_1.tg_1.dw_terceros.GetItemString(1,'tipodoc'))
dw_ubi.Setitem(fila,'documento',tab_1.tg_1.dw_terceros.GetItemString(1,'documento'))
end event

type dw_ubi from datawindow within tabpage_2
integer x = 23
integer y = 24
integer width = 5115
integer height = 784
integer taborder = 30
string title = "none"
string dataobject = "dw_cfgterceros_direccion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
dw_ubi.GetChild('cod_postal',dwc_postal)
dwc_postal.SetTransObject(SQLCA)
dwc_postal.InsertRow(0)


end event

event itemchanged;string s_dpto,s_ciudad

if (dwo.Name) = "cdpto" then
	dwc_ciudad.Retrieve(data)
end if
if (dwo.Name) = "desciudad" then
	s_dpto=getitemstring(row,'cdpto')
	s_ciudad=dwc_ciudad.getitemstring(dwc_ciudad.getrow(),'codciudad')
	setitem(getrow(),'cciudad',dwc_ciudad.getitemstring(dwc_ciudad.getrow(),'codciudad'))
	dwc_postal.Retrieve(s_dpto,s_ciudad)
end if
accepttext()

end event

event buttonclicked;string ls_dir
st_xa_anular st_anul

AcceptText()
if dwo.name='b_dir' then
	ls_dir=dw_ubi.getitemstring(dw_ubi.GETROW(),"direccion")
	st_anul.tipo='DIAN'
	st_anul.motivo=ls_dir
	openwithparm(w_editor_direccion,st_anul)
	ls_dir=message.stringparm
	if not isNull(ls_dir) and  ls_dir<>'' then
		dw_ubi.setitem(dw_ubi.getrow(),"direccion",ls_dir)
	end if
end if
end event

type tabpage_1 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 5330
integer height = 828
long backcolor = 67108864
string text = "Nómina"
long tabtextcolor = 33554432
string picturename = "editar.ico"
long picturemaskcolor = 536870912
dw_tipo dw_tipo
end type

on tabpage_1.create
this.dw_tipo=create dw_tipo
this.Control[]={this.dw_tipo}
end on

on tabpage_1.destroy
destroy(this.dw_tipo)
end on

type dw_tipo from datawindow within tabpage_1
integer x = 18
integer y = 24
integer width = 2304
integer height = 748
integer taborder = 20
string dataobject = "dw_cfgterceros_tipo"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)

end event

type dw_terceros from datawindow within tg_1
event keypress pbm_dwnkey
integer x = 9
integer y = 20
integer width = 3611
integer height = 704
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_cfgterceros"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

event keypress;if key=keyEnter! then
	return -1
end if
end event

event itemchanged;string valor
if (dwo.Name) = "persona" then
	if data = 'J' then
		this.SetItem(row,'tipodoc','NI')
	end if
	if data = 'N' then
		this.SetItem(row,'tipodoc','CC')
	end if
elseif (dwo.Name) = "dverificacion" then
	if f_dverificacion(GetItemString(GetRow(),'documento')) = data then
		
	else
		MessageBox('Atención','El NIT o el dígito de verificación está erroneo.')
		Return 1
	end if
elseif (dwo.Name) = "tipodoc" then
elseif dwo.name='documento' then
	string tt
	tt=gettext()
	if pos(tt,'-')>0 or pos(tt,'.')>0 or pos(tt,',')>0 or pos(tt,'_')>0 or pos(tt,':')>0 then 
		settext(getitemstring(row,'documento'))
		setitem(row,'documento',getitemstring(row,'documento'))
		return 1
	end if
end if
if (dwo.Name) = "tipo_reg" then
	dwc_tiporet.Retrieve(data)
end if

if this.GetColumnName()  ='banco' then
	dwc_oficina.retrieve(data)
end if
end event

event retrieveend;if this.RowCount() < 1 then Return
tab_1.tg_1.dw_terceros.enabled=true
tab_1.tg_1.tab_2.tabpage_2.dw_ubi.retrieve(this.GetItemString(this.GetRow(),'tipodoc'),this.GetItemString(this.GetRow(),'documento'))
tab_1.tg_1.tab_2.tabpage_1.dw_tipo.retrieve(this.GetItemString(this.GetRow(),'tipodoc'),this.GetItemString(this.GetRow(),'documento'))


if dw_emp.Retrieve(this.GetItemString(this.GetRow(),'tipodoc'),this.GetItemString(this.GetRow(),'documento')) > 0 then
	tab_1.tg_1.dw_terceros.SetItem(tab_1.tg_1.dw_terceros.GetRow(),'emp',1)
	tab_1.tg_1.tab_2.tabpage_1.dw_tipo.SetItem(tab_1.tg_1.tab_2.tabpage_1.dw_tipo.GetRow(),'emp',1)
end if
if dwc_ciudad.Retrieve(tab_1.tg_1.tab_2.tabpage_2.dw_ubi.getItemString(tab_1.tg_1.tab_2.tabpage_2.dw_ubi.GetRow(),'cdpto')) = 0 then
	dwc_ciudad.insertRow(0)
end if
dwc_postal.Retrieve(tab_1.tg_1.tab_2.tabpage_2.dw_ubi.getItemString(tab_1.tg_1.tab_2.tabpage_2.dw_ubi.GetRow(),'cdpto'),dwc_ciudad.getitemstring(dwc_ciudad.getrow(),'codciudad'))

if this.RowCount()>0 then
	tab_1.tg_1.tab_2.tabpage_2.pb_1.enabled=true
	tab_1.tg_1.tab_2.tabpage_2.pb_2.enabled=true
	tab_1.tg_1.tab_2.tabpage_2.pb_3.enabled=true
else
	tab_1.tg_1.tab_2.tabpage_2.pb_1.enabled=false
	tab_1.tg_1.tab_2.tabpage_2.pb_2.enabled=false
	tab_1.tg_1.tab_2.tabpage_2.pb_3.enabled=false
end if

if dwc_tiporet.Retrieve(this.getItemString(this.GetRow(),'tipo_reg')) = 0 then
	dwc_tiporet.insertRow(0)
end if
dw_1.Reset()
dw_1.InsertRow(1)
this.ResetUpdate()
end event

event rowfocuschanged;if this.RowCount() < 1 or currentrow = 0 then return
//if isnull(this.getItemString(this.GetRow(),'cdpto')) then Return
//if dwc_ciudad.Retrieve(this.getItemString(this.GetRow(),'cdpto')) = 0 then
//	dwc_ciudad.insertRow(0)
//end if
if dwc_tiporet.Retrieve(this.getItemString(this.GetRow(),'tipo_reg')) = 0 then
	dwc_tiporet.insertRow(0)
end if
if dw_emp.Retrieve(this.GetItemString(this.GetRow(),'tipodoc'),this.GetItemString(this.GetRow(),'documento')) > 0 then
	tab_1.tg_1.dw_terceros.SetItem(tab_1.tg_1.dw_terceros.GetRow(),'emp',1)
end if
this.ResetUpdate()

end event

event rowfocuschanging;if this.GetNextModified(0,Primary!) > 0 then
	if messageBox('Registro '+string(this.GetNextModified(0,Primary!)),'Ha efectuado cambios desea guardarlos?',QUESTION!,YESNO!) = 1 then
		if this.update() = -1 then
			rollback;
			Return
		else
			commit;
		end if
	else
		this.ResetUpdate()
	end if
end if

end event

event doubleclicked;if (dwo.Name) = "descripcion" then
	openwithParm(w_act_econ,this)
end if

end event

event constructor;dw_emp.getchild("oficina", dwc_oficina)
dwc_oficina.settransobject(sqlca)
end event

type dw_emp from datawindow within w_cfgterceros
boolean visible = false
integer x = 626
integer y = 1832
integer width = 658
integer height = 68
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_emp"
boolean border = false
boolean livescroll = true
end type

