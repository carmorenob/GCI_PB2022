$PBExportHeader$w_empleado.srw
forward
global type w_empleado from window
end type
type t1 from tab within w_empleado
end type
type pc from userobject within t1
end type
type pb_24 from picturebutton within pc
end type
type pb_23 from picturebutton within pc
end type
type pb_5 from picturebutton within pc
end type
type dw_ec from datawindow within pc
end type
type pc from userobject within t1
pb_24 pb_24
pb_23 pb_23
pb_5 pb_5
dw_ec dw_ec
end type
type p1 from userobject within t1
end type
type pb_22 from picturebutton within p1
end type
type pb_13 from picturebutton within p1
end type
type pb_12 from picturebutton within p1
end type
type pb_3 from picturebutton within p1
end type
type pb_1 from picturebutton within p1
end type
type dw_3 from datawindow within p1
end type
type p1 from userobject within t1
pb_22 pb_22
pb_13 pb_13
pb_12 pb_12
pb_3 pb_3
pb_1 pb_1
dw_3 dw_3
end type
type p2 from userobject within t1
end type
type pb_17 from picturebutton within p2
end type
type pb_16 from picturebutton within p2
end type
type pb_15 from picturebutton within p2
end type
type pb_14 from picturebutton within p2
end type
type rb_cargo from radiobutton within p2
end type
type rb_emp from radiobutton within p2
end type
type dw_rc from datawindow within p2
end type
type dw_5 from datawindow within p2
end type
type p2 from userobject within t1
pb_17 pb_17
pb_16 pb_16
pb_15 pb_15
pb_14 pb_14
rb_cargo rb_cargo
rb_emp rb_emp
dw_rc dw_rc
dw_5 dw_5
end type
type p3 from userobject within t1
end type
type pb_21 from picturebutton within p3
end type
type pb_20 from picturebutton within p3
end type
type pb_19 from picturebutton within p3
end type
type pb_18 from picturebutton within p3
end type
type dw_ss from datawindow within p3
end type
type p3 from userobject within t1
pb_21 pb_21
pb_20 pb_20
pb_19 pb_19
pb_18 pb_18
dw_ss dw_ss
end type
type p4 from userobject within t1
end type
type pb_26 from picturebutton within p4
end type
type pb_10 from picturebutton within p4
end type
type pb_11 from picturebutton within p4
end type
type pb_2 from picturebutton within p4
end type
type dw_4 from datawindow within p4
end type
type p4 from userobject within t1
pb_26 pb_26
pb_10 pb_10
pb_11 pb_11
pb_2 pb_2
dw_4 dw_4
end type
type pg from userobject within t1
end type
type pb_25 from picturebutton within pg
end type
type dw_emp from datawindow within pg
end type
type pg from userobject within t1
pb_25 pb_25
dw_emp dw_emp
end type
type t1 from tab within w_empleado
pc pc
p1 p1
p2 p2
p3 p3
p4 p4
pg pg
end type
type p_1 from picture within w_empleado
end type
type dw_1 from datawindow within w_empleado
end type
type gb_1 from groupbox within w_empleado
end type
type pb_4 from picturebutton within w_empleado
end type
type pb_9 from picturebutton within w_empleado
end type
type pb_8 from picturebutton within w_empleado
end type
type pb_7 from picturebutton within w_empleado
end type
type pb_6 from picturebutton within w_empleado
end type
type dw_2 from datawindow within w_empleado
end type
end forward

global type w_empleado from window
integer width = 4914
integer height = 2072
boolean titlebar = true
string title = "Historial de cargos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_cargo.ico"
t1 t1
p_1 p_1
dw_1 dw_1
gb_1 gb_1
pb_4 pb_4
pb_9 pb_9
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
dw_2 dw_2
end type
global w_empleado w_empleado

type variables
datawindowchild dwc_cc, dw_requi, dwc_rtf, dwc_te
long tienec, ancho_ori, alto_ori
string tipodoc, documento
BOOLEAN VALIDO, retiro
blob tot_b
st_nomina st

end variables

forward prototypes
public function integer setphoto ()
end prototypes

public function integer setphoto ();long h, w, r_alto, r_ancho
r_ancho = 320
h = alto_ori
w = ancho_ori
r_alto = round(r_ancho*h/w,0)
if h > r_alto and w > r_ancho then
	if h > w then
		w = round(w * (r_alto/h),0)
		h = r_alto
	else
		h = round(h * (r_ancho/w),0)
		w = r_ancho		
	end if
elseif h > r_alto then
	w = round(w * (r_alto/h),0)
	h = r_alto
elseif w > r_ancho then
	h = round(h * (r_ancho/w),0)
	w = r_ancho		
end if
p_1.Resize(w,h)
Return 0

end function

on w_empleado.create
this.t1=create t1
this.p_1=create p_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.pb_4=create pb_4
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.dw_2=create dw_2
this.Control[]={this.t1,&
this.p_1,&
this.dw_1,&
this.gb_1,&
this.pb_4,&
this.pb_9,&
this.pb_8,&
this.pb_7,&
this.pb_6,&
this.dw_2}
end on

on w_empleado.destroy
destroy(this.t1)
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.pb_4)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.dw_2)
end on

event open;st = Message.PowerObjectParm
valido = false
t1.pc.dw_ec.GetChild('retefuente',dwc_rtf)
dwc_rtf.SetTransObject(SQLCA)
dwc_rtf.Retrieve()
dwc_rtf.InsertRow(1)
t1.pc.dw_ec.GetChild('tipoemple',dwc_te)
dwc_te.SetTransObject(SQLCA)
dwc_te.Retrieve()
if isValid(st) then
	dw_1.SetItem(1,'tipodoc',st.tipodoc)
	dw_1.SetItem(1,'documento',st.documento)
	dw_1.TriggerEvent(itemchanged!)
end if

end event

event resize;//
end event

type t1 from tab within w_empleado
event create ( )
event destroy ( )
integer x = 46
integer y = 704
integer width = 4795
integer height = 1084
integer taborder = 50
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
pc pc
p1 p1
p2 p2
p3 p3
p4 p4
pg pg
end type

on t1.create
this.pc=create pc
this.p1=create p1
this.p2=create p2
this.p3=create p3
this.p4=create p4
this.pg=create pg
this.Control[]={this.pc,&
this.p1,&
this.p2,&
this.p3,&
this.p4,&
this.pg}
end on

on t1.destroy
destroy(this.pc)
destroy(this.p1)
destroy(this.p2)
destroy(this.p3)
destroy(this.p4)
destroy(this.pg)
end on

type pc from userobject within t1
integer x = 18
integer y = 112
integer width = 4759
integer height = 956
long backcolor = 67108864
string text = "Detalle Cargo"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
pb_24 pb_24
pb_23 pb_23
pb_5 pb_5
dw_ec dw_ec
end type

on pc.create
this.pb_24=create pb_24
this.pb_23=create pb_23
this.pb_5=create pb_5
this.dw_ec=create dw_ec
this.Control[]={this.pb_24,&
this.pb_23,&
this.pb_5,&
this.dw_ec}
end on

on pc.destroy
destroy(this.pb_24)
destroy(this.pb_23)
destroy(this.pb_5)
destroy(this.dw_ec)
end on

type pb_24 from picturebutton within pc
event mousemove pbm_mousemove
integer x = 443
integer y = 800
integer width = 146
integer height = 128
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar"
end type

event clicked;date termina
long fila, fn, nc, ultimo
string td, doc, msg

fn = dw_ec.find("estado='N'",1,dw_ec.RowCount())
td = dw_1.GetItemString(1,'tipodoc')
doc = dw_1.GetItemString(1,'documento')
if fn > 0 then
	fila = dw_2.find("estado='1'",1,dw_2.RowCount())
	if fila > 0 then
		nc  = dw_2.GetItemNumber(fila,'ncargo')
		dw_2.SetItem(fila,'estado','2')
		termina = RelativeDate(date(dw_ec.GetItemDateTime(1,'fecha_inicio')),-1)
		if isNull(dw_2.GetItemDateTime(fila,'fecha_termi')) then
			dw_2.SetItem(fila,'fecha_termi',termina)
		elseif dw_2.GetItemDateTime(fila,'fecha_termi') >= dw_ec.GetItemDateTime(1,'fecha_inicio') then
			integer ret
			ret = messageBox('Error','La fecha de Terminación del cargo anterior es mayor que la de Inicio del nuevo cargo. Desea que se ajuste automáticamente?',QUESTION!,YESNO!)
			if ret = 1 then
				dw_2.SetItem(fila,'fecha_termi',termina)
			elseif ret = 2 then
				Return -1
			end if				
		end if
		
		update emplecargo set estado = '2', fecha_termi = :termina
		where tipodoc=:td and documento=:doc and ncargo=:nc;
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		end if
		
		update emplesalario set estado = '2' 
		where tipodoc=:td and documento=:doc and ncargo=:nc and estado='1';
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
		update empleubica set estado = '2' 
		where tipodoc=:td and documento=:doc and ncargo=:nc and estado='1';
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
		update empleubica set estado = '2' 
		where tipodoc=:td and documento=:doc and ncargo=:nc and estado='1';
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
	end if
	
	SELECT Max(ncargo) into :ultimo FROM emplecargo
	WHERE tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
	
	if isnull(ultimo) then ultimo=0
	ultimo++
	dw_ec.setitem(1,'ncargo',ultimo)

	dw_ec.SetItem(1,'estado','1')
end if
if retiro then
	datetime fr
	fr = dw_ec.GetItemDateTime(1,'fecha_termi')
	Update empleados set fecha_retiro=:fr
	where tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
	retiro = FALSE
end if
if dw_ec.Update() = -1 then
	Rollback;
end if
dw_1.TriggerEvent(itemchanged!)
commit;

end event

type pb_23 from picturebutton within pc
event mousemove pbm_mousemove
integer x = 293
integer y = 800
integer width = 146
integer height = 128
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
vtextalign vtextalign = top!
string powertiptext = "Eliminar Registro"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_ec.RowCount() = 0 then Return
if not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
	MessageBox('Aviso','El Empleado esta retirado')
	Return
end if
if dw_ec.GetItemString(dw_ec.GetRow(),'estado') = 'N' then
	dw_ec.deleteRow(dw_ec.GetRow());
else
	MessageBox('Atención','Solo para registros nuevos')
end if

end event

type pb_5 from picturebutton within pc
event mousemove pbm_mousemove
integer x = 137
integer y = 800
integer width = 146
integer height = 128
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_medico.gif"
string powertiptext = "Gestion de cargos"
end type

event clicked;string td,doc
if dw_2.rowcount()>0  then 
	if  not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
		MessageBox('Aviso','El Empleado esta retirado')
		Return
	end if
end if
td = dw_1.GetItemString(1,'tipodoc')
doc = dw_1.GetItemString(1,'documento')
if isNull(td) or isNull(doc) then Return 0
dw_2.ScrolltoRow(dw_2.InsertRow(1))
dw_2.SetItem(1,'estado','N')
dw_ec.Reset()
dw_ec.InsertRow(1)
dw_ec.SetItem(1,'tipodoc',td)
dw_ec.SetItem(1,'documento',doc)
dw_ec.setitem(1,'fecha_inicio',date(year(today()),month(today()),1))
dw_ec.setitem(1,'estado',"N")
dw_ec.SetItem(1,'usufecha', datetime(today(),now()))
dw_ec.SetItem(1,'usuario', usuario)
end event

type dw_ec from datawindow within pc
integer x = 142
integer y = 32
integer width = 2697
integer height = 744
integer taborder = 40
string title = "none"
string dataobject = "dw_emple_cargos"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;if getcolumnName() = 'fecha_termi' then
	if getItemString(1,'estado') = '1' then
		if MessageBox('Atención','El empleado se retira?. Si selecciona "SI", al grabar tendrán efecto los cambios',QUESTION!,YESNO!,2) = 1 then
			retiro = TRUE
		end if
	end if
end if
if getColumnName() = 'codrela' then
	string vnul
	setNull(vnul)
	SetItem(GetRow(),'tipoemple',vnul)
	dwc_te.SetFilter("codrela='"+data+"'")
	dwc_te.Filter()
end if

end event

event buttonclicked;g_tercerodesde=14
openwithparm(w_busca_emp,this)

end event

event retrieveend;dwc_te.SetFilter("codrela='"+GetItemString(getrow(),'codrela')+"'")
dwc_te.Filter()

end event

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4759
integer height = 956
long backcolor = 67108864
string text = "Salarios"
long tabtextcolor = 33554432
string picturename = "salario.ico"
long picturemaskcolor = 536870912
pb_22 pb_22
pb_13 pb_13
pb_12 pb_12
pb_3 pb_3
pb_1 pb_1
dw_3 dw_3
end type

on p1.create
this.pb_22=create pb_22
this.pb_13=create pb_13
this.pb_12=create pb_12
this.pb_3=create pb_3
this.pb_1=create pb_1
this.dw_3=create dw_3
this.Control[]={this.pb_22,&
this.pb_13,&
this.pb_12,&
this.pb_3,&
this.pb_1,&
this.dw_3}
end on

on p1.destroy
destroy(this.pb_22)
destroy(this.pb_13)
destroy(this.pb_12)
destroy(this.pb_3)
destroy(this.pb_1)
destroy(this.dw_3)
end on

type pb_22 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 530
integer y = 800
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
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
vtextalign vtextalign = top!
string powertiptext = "Anular Registro"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_3.RowCount() = 0 then Return
if not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
	MessageBox('Aviso','El Empleado esta retirado')
	Return
end if
if dw_3.GetItemString(dw_3.GetRow(),'estado') = '1' or dw_3.GetItemString(dw_3.GetRow(),'estado') = '2' then
	dw_3.SetItem(dw_3.GetRow(),'estado','3')
else
	MessageBox('Atención','Solo para registros ya grabados')
end if

end event

type pb_13 from picturebutton within p1
event mousemove pbm_mousemove
boolean visible = false
integer x = 946
integer y = 800
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "print.gif"
string disabledname = "d_print.gif"
string powertiptext = "Imprimir"
end type

type pb_12 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 87
integer y = 800
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_2.GetItemString(dw_2.Getrow(),'estado') <> '1' then 
	MessageBox('Aviso','El cargo no esta activo')
	Return
end if
if not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
	MessageBox('Aviso','El Empleado esta retirado')
	Return
end if

integer fila
fila = dw_3.insertrow(1)
dw_3.scrolltorow(fila)
dw_3.setitem(fila,'tipodoc', tipodoc)
dw_3.setitem(fila,'documento', documento)
dw_3.setitem(fila,'ncargo',dw_2.GetItemNumber(dw_2.GetRow(),'ncargo'))
dw_3.setitem(fila,'fecha_inicio',date(year(today()),month(today()),1))
dw_3.setitem(fila,'estado',"N")
dw_3.setitem(fila,'usuario',usuario)
dw_3.setitem(fila,'usufecha',today())
dw_3.setitem(fila,'nsalario',dw_3.getitemnumber(1,'maxim'))


end event

type pb_3 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 379
integer y = 800
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
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar"
end type

event clicked;dw_2.accepttext()

integer fila, fn

fn = dw_3.find("estado='N'",1,dw_3.RowCount())
if fn > 0 then
	fila = dw_3.find("estado='1'",1,dw_3.RowCount())
	if fila > 0 then
		dw_3.SetItem(fila,'estado','2')
	end if
	dw_3.SetItem(fn,'estado','1')
end if

if dw_3.Update() = -1 then
	Rollback;
end if
commit;
end event

type pb_1 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 233
integer y = 800
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
vtextalign vtextalign = top!
string powertiptext = "Eliminar Registro"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_3.RowCount() = 0 then Return
if not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
	MessageBox('Aviso','El Empleado esta retirado')
	Return
end if
if dw_3.GetItemString(dw_3.GetRow(),'estado') = 'N' then
	dw_3.deleteRow(dw_3.GetRow());
else
	MessageBox('Atención','Solo para registros nuevos')
end if

end event

type dw_3 from datawindow within p1
integer x = 87
integer y = 32
integer width = 3744
integer height = 744
integer taborder = 20
string title = "none"
string dataobject = "dw_salario"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;if GetRow() <> row then
	SetRow(row)
end if

end event

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4759
integer height = 956
long backcolor = 67108864
string text = "Requisitos"
long tabtextcolor = 33554432
string picturename = "editar.ico"
long picturemaskcolor = 536870912
pb_17 pb_17
pb_16 pb_16
pb_15 pb_15
pb_14 pb_14
rb_cargo rb_cargo
rb_emp rb_emp
dw_rc dw_rc
dw_5 dw_5
end type

on p2.create
this.pb_17=create pb_17
this.pb_16=create pb_16
this.pb_15=create pb_15
this.pb_14=create pb_14
this.rb_cargo=create rb_cargo
this.rb_emp=create rb_emp
this.dw_rc=create dw_rc
this.dw_5=create dw_5
this.Control[]={this.pb_17,&
this.pb_16,&
this.pb_15,&
this.pb_14,&
this.rb_cargo,&
this.rb_emp,&
this.dw_rc,&
this.dw_5}
end on

on p2.destroy
destroy(this.pb_17)
destroy(this.pb_16)
destroy(this.pb_15)
destroy(this.pb_14)
destroy(this.rb_cargo)
destroy(this.rb_emp)
destroy(this.dw_rc)
destroy(this.dw_5)
end on

type pb_17 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 361
integer y = 800
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrador.gif"
string disabledname = "d_borrador.gif"
vtextalign vtextalign = top!
string powertiptext = "Borrar Registro"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_2.GetItemString(dw_2.Getrow(),'estado') <> '1' then 
	MessageBox('Aviso','El cargo no esta activo')
	Return
end if
if not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
	MessageBox('Aviso','El Empleado esta retirado')
	Return
end if
if rb_emp.checked then
	if dw_5.RowCount() > 0 then dw_5.deleterow(dw_5.GetRow())
else
	if dw_rc.RowCount() > 0 then dw_rc.deleterow(dw_rc.GetRow())
end if

end event

type pb_16 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 210
integer y = 800
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
string powertiptext = "Guardar"
end type

event clicked;dw_5.accepttext()

if dw_5.update() = -1 then
	rollback;
	Return
end if
if dw_rc.update() = -1 then
	rollback;
	Return
end if
commit;

end event

type pb_15 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 59
integer y = 800
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_2.GetItemString(dw_2.Getrow(),'estado') <> '1' then 
	MessageBox('Aviso','El cargo no esta activo')
	Return
end if
if not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
	MessageBox('Aviso','El Empleado esta retirado')
	Return
end if
long fila, item
string valor

if rb_emp.checked then
	valor = dw_5.describe("Evaluate('max(nitem)', 1)")
	
	fila = dw_5.insertrow(0)
	dw_5.scrolltorow(fila)
	dw_5.setitem(fila,'tipodoc',tipodoc)
	dw_5.setitem(fila,'documento',documento)
	dw_5.setitem(fila,'ncargo',dw_2.GetItemNumber(dw_2.GetRow(),'ncargo'))
	dw_5.setitem(fila,'nitem', long(valor) + 1)
	dw_5.setitem(fila,'iniciovigencia',datetime(today()))
	dw_5.setitem(fila,'codrela',dw_2.GetItemString(dw_2.GetRow(),'codrela'))
	dw_5.setitem(fila,'tipoemple',dw_2.GetItemString(dw_2.GetRow(),'tipoemple'))
	dw_5.setitem(fila,'estado','1')
else
	valor = dw_rc.describe("Evaluate('max(nitem)', 1)")
	
	fila = dw_rc.insertrow(0)
	dw_rc.scrolltorow(fila)
	dw_rc.setitem(fila,'tipodoc',tipodoc)
	dw_rc.setitem(fila,'documento',documento)
	dw_rc.setitem(fila,'ncargo',dw_2.GetItemNumber(dw_2.GetRow(),'ncargo'))
	dw_rc.setitem(fila,'nitem', long(valor) + 1)
	dw_rc.setitem(fila,'iniciovigencia',datetime(today()))
	dw_rc.setitem(fila,'codrela',dw_2.GetItemString(dw_2.GetRow(),'codrela'))
	dw_rc.setitem(fila,'tipoemple',dw_2.GetItemString(dw_2.GetRow(),'tipoemple'))
	dw_rc.setitem(fila,'cargo',dw_2.GetItemString(dw_2.GetRow(),'cargo'))
	dw_rc.setitem(fila,'estado','1')
end if

end event

type pb_14 from picturebutton within p2
event mousemove pbm_mousemove
boolean visible = false
integer x = 517
integer y = 800
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "print.gif"
string disabledname = "d_print.gif"
string powertiptext = "Imprimir"
end type

type rb_cargo from radiobutton within p2
integer x = 485
integer y = 36
integer width = 343
integer height = 72
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cargo"
end type

event clicked;
string filtro
filtro = "codrela='"+ dw_2.GetItemString(dw_2.Getrow(),'codrela') +"' and tipoemple='"+ dw_2.GetItemString(dw_2.Getrow(),'tipoemple') +"'"
dw_rc.getchild("nrequisito",dw_requi)
dw_requi.settransobject(SQLCA)
dw_requi.retrieve()
dw_requi.setfilter(filtro)
dw_requi.filter()

dw_rc.Visible = TRUE
dw_rc.Enabled = TRUE
dw_5.Visible = FALSE
dw_5.Enabled = FALSE

end event

type rb_emp from radiobutton within p2
integer x = 59
integer y = 36
integer width = 343
integer height = 72
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empleado"
boolean checked = true
end type

event clicked;string filtro
filtro = "codrela='"+ dw_2.GetItemString(dw_2.Getrow(),'codrela') +"' and tipoemple='"+ dw_2.GetItemString(dw_2.Getrow(),'tipoemple') +"'"
dw_5.getchild("nrequisito",dw_requi)
dw_requi.settransobject(SQLCA)
dw_requi.retrieve()
dw_requi.setfilter(filtro)
dw_requi.filter()

dw_5.Visible = TRUE
dw_5.Enabled = TRUE
dw_rc.Visible = FALSE
dw_rc.Enabled = FALSE

end event

type dw_rc from datawindow within p2
boolean visible = false
integer x = 46
integer y = 120
integer width = 3314
integer height = 648
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_requisitos_cargo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;m_cargodw menugen
menugen = create m_cargodw
menugen.dw_obj = this
menugen.PopMenu(w_empleado.PointerX() + xpos,w_empleado.PointerY() + ypos + 150)

end event

event constructor;SetTransObject(SQLCA)
end event

event itemchanged;if getColumnName() = 'nrequisito' then
	long vnul
	setNull(vnul)
	if find("nrequisito="+(data),1,RowCount()) > 0 then
		MessageBox('Aviso','El requisito ya ha sido adicionado')
		SetItem(GetRow(),'nrequisito',vnul)
		SetText('')
		Return 2
	end if
end if

end event

type dw_5 from datawindow within p2
integer x = 46
integer y = 120
integer width = 3310
integer height = 620
integer taborder = 10
string title = "none"
string dataobject = "dw_requisitos"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event itemchanged;if getColumnName() = 'nrequisito' then
	long vnul
	setNull(vnul)
	if find("nrequisito="+(data),1,RowCount()) > 0 then
		MessageBox('Aviso','El requisito ya ha sido adicionado')
		SetItem(GetRow(),'nrequisito',vnul)
		SetText('')
		Return 2
	end if
end if

end event

type p3 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4759
integer height = 956
long backcolor = 67108864
string text = "Seguridad Social"
long tabtextcolor = 33554432
string picturename = "ap_dx.ico"
long picturemaskcolor = 536870912
pb_21 pb_21
pb_20 pb_20
pb_19 pb_19
pb_18 pb_18
dw_ss dw_ss
end type

on p3.create
this.pb_21=create pb_21
this.pb_20=create pb_20
this.pb_19=create pb_19
this.pb_18=create pb_18
this.dw_ss=create dw_ss
this.Control[]={this.pb_21,&
this.pb_20,&
this.pb_19,&
this.pb_18,&
this.dw_ss}
end on

on p3.destroy
destroy(this.pb_21)
destroy(this.pb_20)
destroy(this.pb_19)
destroy(this.pb_18)
destroy(this.dw_ss)
end on

type pb_21 from picturebutton within p3
event mousemove pbm_mousemove
boolean visible = false
integer x = 549
integer y = 800
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "print.gif"
string disabledname = "d_print.gif"
string powertiptext = "Imprimir"
end type

type pb_20 from picturebutton within p3
event mousemove pbm_mousemove
integer x = 82
integer y = 800
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_2.GetItemString(dw_2.Getrow(),'estado') <> '1' then 
	MessageBox('Aviso','El cargo no esta activo')
	Return
end if
if not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
	MessageBox('Aviso','El Empleado esta retirado')
	Return
end if
int fila
string valor
valor = dw_ss.Describe("Evaluate('Max(item)',0)")
fila = dw_ss.insertrow(0)
dw_ss.scrolltorow(fila)
dw_ss.setitem(fila,'tipodoc', tipodoc)
dw_ss.setitem(fila,'documento', documento)
//dw_ss.setitem(fila,'item',long(valor) + 1)
dw_ss.setitem(fila,'inicio',date(year(today()),month(today()),1))
dw_ss.setitem(fila,'estado',"N")
dw_ss.setitem(fila,'usuario',usuario)
dw_ss.setitem(fila,'usufecha',datetime(today(),now()))
dw_ss.setitem(fila,'viejo',0)

end event

type pb_19 from picturebutton within p3
event mousemove pbm_mousemove
integer x = 238
integer y = 800
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
string powertiptext = "Guardar"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_2.GetItemString(dw_2.Getrow(),'estado') <> '1' then 
	MessageBox('Aviso','El cargo no esta activo')
	Return
end if

if  dw_ss.GetItemnumber(1,'nohay')>0 then
	MessageBox('Aviso','Existente registros isn tercero valide')
	Return
end if

if dw_ss.accepttext() = -1 then Return
long i, j, n, act
string clase

n = dw_ss.Find("estado='N'",1,dw_ss.RowCount())
do while n > 0 
	clase = dw_ss.GetItemString(n,'cod_clase')
	act = dw_ss.Find("estado='1' and cod_clase='"+clase+"'",1,dw_ss.RowCount())
	if act > 0 then
		dw_ss.SetItem(act,'estado','2')
		dw_ss.SetItem(act,'retiro',RelativeDate(date(dw_ss.GetItemDateTime(n,'inicio')),-1))
	end if
	dw_ss.SetItem(n,'estado','1')
	n = dw_ss.Find("estado='N'",1,dw_ss.RowCount())
loop
if dw_ss.update() < 1 then
	rollback;
	dw_ss.retrieve(tipodoc, documento)
else
	commit;
end if

end event

type pb_18 from picturebutton within p3
event mousemove pbm_mousemove
integer x = 389
integer y = 800
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrador.gif"
string disabledname = "d_borrador.gif"
vtextalign vtextalign = top!
string powertiptext = "Borrar Fila"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_2.GetItemString(dw_2.Getrow(),'estado') <> '1' then 
	MessageBox('Aviso','El cargo no esta activo')
	Return
end if
if not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
	MessageBox('Aviso','El Empleado esta retirado')
	Return
end if
if dw_ss.RowCount() > 0 then dw_ss.deleterow(dw_ss.GetRow());
end event

type dw_ss from datawindow within p3
integer x = 82
integer y = 76
integer width = 4608
integer height = 708
integer taborder = 100
string title = "none"
string dataobject = "dw_nom_clase_ter"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event buttonclicked;g_tercerodesde = 11
openwithparm(w_buscater,this)

end event

event itemchanged;string nulo
setnull(nulo)

if getColumnName() = 'cod_clase' then
	string valor
	valor = "max(if(cod_clase=~~'"+data+"~~',item,0))"
	valor = Describe("Evaluate('"+valor+"',0)")
	SetItem(GetRow(),'item',long(valor) + 1)
end if
if getColumnName() = "tipodoc_ter" then 
	setitem(GetRow(),"documento_ter",nulo)
	accepttext()
end if
if getColumnName() =  "documento_ter" then
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(getrow(),"tipodoc_ter")
		if isnull(tdoc) then
			setitem(GetRow(),"documento_ter",nulo)
			setcolumn("tipodoc_ter")
			return 1
		end if
		doc=gettext()
		setnull(persona)
		SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
		FROM TERCEROS
		WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
		if isnull(persona) then
			Messagebox('Atencion','Tercero no existente verifique')
			setitem(GetRow(),"documento_ter",nulo)
			setcolumn("tipodoc_ter")
			return 1
		else
			setitem(getrow(),"nombre1",nom1)
			setitem(getrow(),"nombre2",nom2)
			setitem(getrow(),"apellido1",ape1)
			setitem(getrow(),"apellido2",ape2)
			setitem(getrow(),"razon_social",rsoc)
		end if
	end if
end event

type p4 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4759
integer height = 956
long backcolor = 67108864
string text = "Ubicación"
long tabtextcolor = 33554432
string picturename = "actual.ico"
long picturemaskcolor = 536870912
pb_26 pb_26
pb_10 pb_10
pb_11 pb_11
pb_2 pb_2
dw_4 dw_4
end type

on p4.create
this.pb_26=create pb_26
this.pb_10=create pb_10
this.pb_11=create pb_11
this.pb_2=create pb_2
this.dw_4=create dw_4
this.Control[]={this.pb_26,&
this.pb_10,&
this.pb_11,&
this.pb_2,&
this.dw_4}
end on

on p4.destroy
destroy(this.pb_26)
destroy(this.pb_10)
destroy(this.pb_11)
destroy(this.pb_2)
destroy(this.dw_4)
end on

type pb_26 from picturebutton within p4
event mousemove pbm_mousemove
integer x = 544
integer y = 800
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
vtextalign vtextalign = top!
string powertiptext = "Anular Registro"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_4.RowCount() = 0 then Return

if dw_4.GetItemString(dw_4.GetRow(),'estado') = '1' or dw_4.GetItemString(dw_4.GetRow(),'estado') = '2' then
	dw_4.SetItem(dw_4.GetRow(),'estado','3')
else
	MessageBox('Atención','Solo para registros ya grabados')
end if

end event

type pb_10 from picturebutton within p4
string tag = "Guardar"
integer x = 393
integer y = 800
integer width = 146
integer height = 128
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar cambios Ubicación"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_2.GetItemString(dw_2.Getrow(),'estado') <> '1' then 
	MessageBox('Aviso','El cargo no esta activo')
	Return
end if
if isnull(dw_4.GetItemString(dw_4.Getrow(),'codlugar') ) or dw_4.GetItemString(dw_4.Getrow(),'codlugar') ='' then 
	MessageBox('Aviso','Lugar sin Dato')
	Return
end if
if isnull(dw_4.GetItemString(dw_4.Getrow(),'ufuncional') ) or dw_4.GetItemString(dw_4.Getrow(),'ufuncional') ='' then 
	MessageBox('Aviso','Unidad Funcional sin Dato')
	Return
end if
if isnull(dw_4.GetItemString(dw_4.Getrow(),'cc') ) or dw_4.GetItemString(dw_4.Getrow(),'cc') ='' then 
	MessageBox('Aviso','Centro de Costo sin Dato')
	Return
end if
long fila, fn

fn = dw_4.Find("estado = '0'",1,dw_4.RowCount())
if fn > 0 then
	fila = dw_4.Find("estado = '1'",1,dw_4.RowCount())
	if fila > 0 then
		dw_4.SetItem(fila,'estado','2')
	end if
	dw_4.SetItem(fn,'estado','1')
//else
//	Return
end if

if dw_4.Update() = -1 then
	rollback;
else
	commit;
end if

end event

type pb_11 from picturebutton within p4
string tag = "Eliminar Fila"
integer x = 242
integer y = 800
integer width = 146
integer height = 128
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Fila"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_2.GetItemString(dw_2.Getrow(),'estado') <> '1' then 
	MessageBox('Aviso','El cargo no esta activo')
	Return
end if
if not valido then Return
if dw_4.RowCount() = 0 then Return
if dw_4.GetItemString(dw_4.GetRow(),'estado') = '0' then
	dw_4.DeleteRow(dw_4.GetRow())
else
	messageBox('Aviso','No pueden borrarse históricos, solo nuevos registros')
end if
end event

type pb_2 from picturebutton within p4
event mousemove pbm_mousemove
string tag = "Cambio de Lugar"
integer x = 87
integer y = 800
integer width = 146
integer height = 128
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Cambio de lugar"
end type

event clicked;if dw_2.RowCount() = 0 then Return
if dw_2.GetItemString(dw_2.Getrow(),'estado') <> '1' then 
	MessageBox('Aviso','El cargo no esta activo')
	Return
end if
if not isnull(dw_2.GetItemdatetime(dw_2.Getrow(),'fecha_retiro')) then 
	MessageBox('Aviso','El Empleado esta retirado')
	Return
end if
if not valido then Return
long fila
string valor
fila = dw_4.Find("estado = '0'",1,dw_4.RowCount())
if fila = 0 then
	valor = dw_4.Describe("Evaluate('Max(ntraslado)',0)")
	fila = dw_4.InsertRow(1)
	dw_4.SetItem(fila,'tipodoc', tipodoc)
	dw_4.SetItem(fila,'documento', documento)
	dw_4.SetItem(fila,'ncargo', dw_2.GetItemNumber(dw_2.GetRow(),'ncargo'))
	dw_4.SetItem(fila,'fecha_inicio', date(year(today()),month(today()),1))
	dw_4.SetItem(fila,'ntraslado', long(valor) + 1)
	dw_4.SetItem(fila,'estado', '0')
	dw_4.SetItem(fila,'usufecha', datetime(today(),now()))
	dw_4.SetItem(fila,'usuario', usuario)
	dw_4.ScrolltoRow(fila)
else
	messageBox('Aviso','Existe un registro nuevo para ser modificado')
end if

end event

type dw_4 from datawindow within p4
integer x = 64
integer y = 72
integer width = 4603
integer height = 696
integer taborder = 120
string title = "none"
string dataobject = "dw_ubicacion"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if this.GetRow() <> row and row > 0 then
	this.SetRow(row)
end if
	
end event

event itemchanged;if this.GetColumnName() = 'ufuncional' then
	dwc_cc.SetFilter("coduf='" + data + "'")
	dwc_cc.Filter()
elseif this.GetColumnName() = 'cc' then
	this.SetItem(row,'ccosto', dwc_cc.GetItemString(dwc_cc.GetRow(),'codcc'))
end if

end event

event retrieverow;this.SetItem(row,'cc',this.GetItemString(row,'descripcion'))

end event

event rowfocuschanged;if this.rowcount() < 1 or currentrow = 0 then Return
if not isNull(this.GetItemString(currentRow,'ufuncional')) then
	dwc_cc.SetFilter("coduf='" + this.GetItemString(currentRow,'ufuncional') + "'")
	dwc_cc.Filter()
end if

end event

event constructor;SetTransObject(SQLCA)
Getchild('cc',dwc_cc)
dwc_cc.SetTransObject(SQLCA)

end event

type pg from userobject within t1
integer x = 18
integer y = 112
integer width = 4759
integer height = 956
long backcolor = 67108864
string text = "Datos Generales"
long tabtextcolor = 33554432
string picturename = "medico.gif"
long picturemaskcolor = 536870912
pb_25 pb_25
dw_emp dw_emp
end type

on pg.create
this.pb_25=create pb_25
this.dw_emp=create dw_emp
this.Control[]={this.pb_25,&
this.dw_emp}
end on

on pg.destroy
destroy(this.pb_25)
destroy(this.dw_emp)
end on

type pb_25 from picturebutton within pg
event mousemove pbm_mousemove
integer x = 2578
integer y = 60
integer width = 146
integer height = 128
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar"
end type

event clicked;string td,doc
double ncargo
datetime fecha_ret
td = dw_emp.GetItemString(1,'tipodoc')
doc = dw_emp.GetItemString(1,'documento')

if dw_emp.GetItemString(1,'estado') = '0' then
	if MessageBox("Atención","Al desactivar el empleado se establecerá: fecha de retiro, inactivo el cargo e inactivo el salario. Está seguro de Continuar?",QUESTION!,YESNO!,2) = 2 then 
		Return 0
	else
		dw_emp.AcceptText()
		//if not isNull(dw_emp.GetItemDateTime(1,'fecha_retiro')) then
		if  isNull(dw_emp.GetItemDateTime(1,'fecha_retiro')) then
			dw_emp.SetItem(1,'fecha_retiro',today())
		end if
		fecha_ret=dw_emp.GetItemDateTime(1,'fecha_retiro')
		select ncargo into :ncargo from emplecargo
		where tipodoc=:td and documento=:doc and estado='1';
		update emplecargo set estado = '2' ,fecha_termi=:fecha_ret
		where tipodoc=:td and documento=:doc and ncargo=:ncargo and estado='1';
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		update emplesalario set estado = '2' 
		where tipodoc=:td and documento=:doc and ncargo=:ncargo and estado='1';
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		update empleubica set estado = '2' ,fecha_termi=:fecha_ret
		where tipodoc=:td and documento=:doc and estado='1';
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		UPDATE NOM_CLASE_TERCERO SET RETIRO = :fecha_ret,estado=2
		WHERE (((TIPODOC)=:td) AND ((DOCUMENTO)=:doc) AND ((ESTADO)='1'));
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
	end if
end if
if dw_emp.Update() = -1 then
	rollback;
	Return -1
end if
dw_1.TriggerEvent(itemchanged!)

end event

type dw_emp from datawindow within pg
integer x = 101
integer y = 32
integer width = 2450
integer height = 908
integer taborder = 40
string title = "none"
string dataobject = "dw_emp"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;this.accepttext()
if this.GetColumnName() = 'ingre_empre' then
	if isnull(getitemdatetime(row,'ingre_distri')) then
		setitem(row,'ingre_distri',datetime(data))
	end if
end if	
if this.GetColumnName() = 'ingre_distri' then
	if isnull(getitemdatetime(row,'ingre_empre')) then
		setitem(row,'ingre_empre',datetime(data))
	end if
end if	
this.accepttext()
end event

type p_1 from picture within w_empleado
boolean visible = false
integer x = 4224
integer y = 120
integer width = 590
integer height = 560
boolean originalsize = true
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_empleado
integer x = 69
integer y = 96
integer width = 2537
integer height = 156
integer taborder = 10
string dataobject = "dw_emple_regla"
boolean border = false
end type

event itemchanged;this.accepttext()
string filtro

tipodoc = this.getitemstring(this.getrow(),'tipodoc')
documento = this.getitemstring(this.getrow(),'documento')
if isNull(tipodoc) or isNull(documento) then Return 0
this.retrieve(tipodoc,documento)
IF this.rowcount()=0 THEN
	valido = FALSE
	this.insertrow(0)
	messageBox ("Atención","Empleado no encontrado.")
	this.SetItem(1,'tipodoc',tipodoc)
	this.SetItem(1,'documento',documento)
	this.SetColumn('documento')
else
	selectblob fotografia into :tot_b from empleados
 	where tipodoc=:tipodoc and documento=:documento;
	if SQLCA.SQLCode <> 0 then
		MessageBox("SQL error",SQLCA.SQLErrText,Information!)
	end if
	if isNull(tot_b) then
		p_1.Hide()
//		dw_2.Width=3698
	else
		p_1.SetPicture(tot_b)
		alto_ori = p_1.Height
		ancho_ori = p_1.Width
		setPhoto()
		p_1.Show()
		dw_2.Width=3310
	end if
	valido = TRUE
	dw_2.Reset()
	t1.pc.dw_ec.Reset()
	t1.p1.dw_3.Reset()
	t1.p4.dw_4.Reset()
	t1.p2.dw_5.Reset()
	t1.p2.dw_rc.Reset()
	t1.pg.dw_emp.Reset()
	dw_2.Retrieve(tipodoc,documento)
	t1.pg.dw_emp.Retrieve(tipodoc,documento)
END IF

end event

event constructor;settransobject(SQLCA)
insertrow(1)
setColumn(2)
end event

type gb_1 from groupbox within w_empleado
integer x = 37
integer y = 32
integer width = 4814
integer height = 656
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de cargos"
end type

type pb_4 from picturebutton within w_empleado
event mousemove pbm_mousemove
integer x = 2304
integer y = 1816
integer width = 146
integer height = 128
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
string powertiptext = "Registro de contratos"
end type

event clicked;window wSheet
wSheet = w_principal.GetFirstSheet()
DO WHILE IsValid(wSheet)
	if wsheet.Title = 'Contratos de Servicios' then
		wsheet.SetFocus()
		Return
	end if
	wSheet = w_principal.GetNextSheet(wSheet)
LOOP
w_contratacion w_nom_contrato
opensheetwithparm(w_nom_contrato,'NC',"w_contratacion",w_principal,11,original!)
w_principal.arrangesheets(layer!)

end event

type pb_9 from picturebutton within w_empleado
event movemouse pbm_mousemove
integer x = 2766
integer y = 1816
integer width = 146
integer height = 128
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "puerta.gif"
string disabledname = "d_puerta.gif"
string powertiptext = "Salir"
end type

event clicked;close(parent)

end event

type pb_8 from picturebutton within w_empleado
event mousemove pbm_mousemove
integer x = 2610
integer y = 1816
integer width = 146
integer height = 128
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print.gif"
string disabledname = "d_print.gif"
string powertiptext = "Imprimir"
end type

type pb_7 from picturebutton within w_empleado
event mousemove pbm_mousemove
integer x = 2619
integer y = 88
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "              &b"
string picturename = "lupa.gif"
string disabledname = "d_lupa.gif"
string powertiptext = "Buscar (Alt+B)"
end type

event clicked;//open(win_busqueda)
g_tercerodesde=1
openwithparm(w_busca_emp,dw_1)
if not isNull(dw_1.GetItemString(1,'documento')) then
	dw_1.triggerEvent(itemchanged!)
end if

end event

type pb_6 from picturebutton within w_empleado
event mousemove pbm_mousemove
integer x = 2455
integer y = 1816
integer width = 146
integer height = 128
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar trabajador.gif"
string disabledname = "d_cancelar trabajador.gif"
vtextalign vtextalign = top!
string powertiptext = "Desactiva empleado"
end type

event clicked;long fila
string cemple
if not valido then Return
cemple=dw_1.getitemstring(dw_1.getrow(),1)
if messagebox("Advertencia","Está seguro que el empleado sale de la institución",Question!,YesNo!,2)=2 then
	return
else

	UPDATE empleados SET empleados.estado = '2'
	WHERE empleados.documento=:cemple;
	
	if sqlca.sqlcode=-1 then
		rollback;
		messagebox("Error empleados",sqlca.sqlerrtext )
		return
	end if
	UPDATE emplecargo SET emplecargo.estado = '2'
	WHERE emplecargo.documento=:cemple;
	
	if sqlca.sqlcode=-1 then
		rollback;
		messagebox("Error cargo empleado",sqlca.sqlerrtext)
		return
	end if
	
	UPDATE emplesalario SET emplesalario.estado = '2'
	WHERE emplesalario.documento=:cemple;
	
	if sqlca.sqlcode=-1 then
		rollback;
		messagebox("Error salario empleado",sqlca.sqlerrtext)
		return
	end if
	
	UPDATE empleubica SET empleubica.estado = '2'
	WHERE empleubica.documento=:cemple;
	
	if sqlca.sqlcode=-1 then
		rollback;
		messagebox("Error ubicación empleado",sqlca.sqlerrtext)
		return
	end if
	
	DELETE obrasujerida.documento, obrasujerida.*
	FROM obrasujerida
	WHERE obrasujerida.documento=:cemple;
	
	if sqlca.sqlcode=-1 then
		rollback;
		messagebox("Error obra sugerida",sqlca.sqlerrtext)
		return
	end if
	
	commit;
end if
end event

type dw_2 from datawindow within w_empleado
integer x = 91
integer y = 244
integer width = 4123
integer height = 424
integer taborder = 30
boolean bringtotop = true
string title = "Datos del cargo"
string dataobject = "dw_cargos_emple"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//this.accepttext()
//choose case this.getcolumnname()
//	case "codrela"
//		this.setitem(1,5,"")
//		temple.setfilter("codrela='"+getitemstring(1,4)+"'")
//		temple.filter()
//	case "ncargo"
//		dw_3.retrieve(dw_2.getitemstring(1,1),dw_2.getitemnumber(1,2))
//		dw_4.retrieve(dw_2.getitemstring(1,1),dw_2.getitemnumber(1,2))
//		dw_5.retrieve(dw_2.getitemstring(1,1),dw_2.getitemnumber(1,2))
//end choose
end event

event rowfocuschanged;if this.RowCount() < 1 then Return
t1.pc.dw_ec.Reset()
t1.p1.dw_3.Reset()
t1.p4.dw_4.Reset()
t1.p2.dw_5.Reset()
t1.p2.dw_rc.Reset()
if isNull(this.GetItemNumber(this.GetRow(),'ncargo')) then Return
t1.pc.dw_ec.Retrieve(tipodoc,documento,this.GetItemNumber(this.GetRow(),'ncargo'))
t1.p1.dw_3.Retrieve(tipodoc,documento,this.GetItemNumber(this.GetRow(),'ncargo'))
t1.p4.dw_4.Retrieve(tipodoc,documento,this.GetItemNumber(this.GetRow(),'ncargo'))
t1.p2.dw_5.Retrieve(tipodoc,documento,this.GetItemNumber(this.GetRow(),'ncargo'))
t1.p2.dw_rc.Retrieve(tipodoc,documento,this.GetItemNumber(this.GetRow(),'ncargo'))
t1.p3.dw_ss.Retrieve(tipodoc,documento)
t1.p2.rb_emp.TriggerEvent(clicked!)

end event

event clicked;if row > 0 then this.setRow(row)
end event

event constructor;setTransObject(SQLCA)

end event

