$PBExportHeader$w_ausentismo.srw
forward
global type w_ausentismo from window
end type
type dw_deta from datawindow within w_ausentismo
end type
type cbx_1 from checkbox within w_ausentismo
end type
type dw_4 from datawindow within w_ausentismo
end type
type pb_repro from picturebutton within w_ausentismo
end type
type tab_1 from tab within w_ausentismo
end type
type vaca from userobject within tab_1
end type
type dw_2 from datawindow within vaca
end type
type vaca from userobject within tab_1
dw_2 dw_2
end type
type lice from userobject within tab_1
end type
type dw_3 from datawindow within lice
end type
type lice from userobject within tab_1
dw_3 dw_3
end type
type tab_1 from tab within w_ausentismo
vaca vaca
lice lice
end type
type pb_3 from picturebutton within w_ausentismo
end type
type st_1 from statictext within w_ausentismo
end type
type pb_7 from picturebutton within w_ausentismo
end type
type dw_emp from datawindow within w_ausentismo
end type
type pb_2 from picturebutton within w_ausentismo
end type
type pb_1 from picturebutton within w_ausentismo
end type
type pb_nuevo from picturebutton within w_ausentismo
end type
type pb_cerrar from picturebutton within w_ausentismo
end type
type dw_1 from datawindow within w_ausentismo
end type
type gb_1 from groupbox within w_ausentismo
end type
end forward

global type w_ausentismo from window
integer width = 5266
integer height = 2216
boolean titlebar = true
string title = "Ausentismo"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_asentismo.ico"
dw_deta dw_deta
cbx_1 cbx_1
dw_4 dw_4
pb_repro pb_repro
tab_1 tab_1
pb_3 pb_3
st_1 st_1
pb_7 pb_7
dw_emp dw_emp
pb_2 pb_2
pb_1 pb_1
pb_nuevo pb_nuevo
pb_cerrar pb_cerrar
dw_1 dw_1
gb_1 gb_1
end type
global w_ausentismo w_ausentismo

type variables
boolean valido
datawindowchild dwc_a
string descripcion,concep,a_est,tipo,tipodoc,documento
end variables

forward prototypes
public function integer f_intervalo (datawindow dw_aus)
end prototypes

public function integer f_intervalo (datawindow dw_aus);long i, j
st_interfec iref, iptr, iret
dw_aus.setfilter("estado='0'")
dw_aus.filter()
for i = 1 to dw_aus.RowCount()
	j=dw_4.InsertRow(1)
	dw_4.setItem(j,'tipodoc', dw_aus.GetItemString(i,'tipodoc'))
	dw_4.setItem(j,'documento', dw_aus.GetItemString(i,'documento'))
	dw_4.setItem(j,'cod_ausen', dw_aus.GetItemString(i,'cod_ausen'))
	dw_4.setItem(j,'sigla',dw_aus.GetItemstring(i,'sigla'))
	dw_4.setItem(j,'item',dw_aus.getitemnumber(i,'item'))
	dw_4.setItem(j,'fechaini',dw_aus.GetItemDatetime(i,'fechaini'))
	dw_4.setItem(j,'fechafin',dw_aus.GetItemDatetime(i,'fechafin'))
	dw_4.setItem(j,'estado',dw_aus.GetItemstring(i,'estado'))
	dw_4.setItem(j,'descripcion',dw_aus.GetItemstring(i,'descripcion'))
next
dw_aus.setfilter("")
dw_aus.filter()

dw_4.setfilter("estado<>'3'")
dw_4.filter()
for i = 1 to dw_4.RowCount()
	iref.x = datetime(dw_4.GetItemDatetime(i,'fechaini'))
	iref.y =datetime(dw_4.GetItemDatetime(i,'fechafin'))
	for j = i + 1 to dw_4.RowCount()
		iptr.x = datetime(dw_4.GetItemDatetime(j,'fechaini'))
		iptr.y = datetime(dw_4.GetItemDatetime(j,'fechafin'))
		iret = interseccion(iref,iptr) 	
		if not isNull(iret.x) or not isNull(iret.y) then
			if messageBox('Atención','Se cruzan las fechas del registro '+dw_4.GetItemstring(i,'descripcion')+'('+string(dw_4.GetItemnumber(i,'item'))+') con el registro '+dw_4.GetItemstring(j,'descripcion')+'('+string(dw_4.GetItemnumber(j,'item'))+'). Desea continuar?',QUESTION!,YESNO!) = 2 then Return -1
		end if
	next
next
dw_4.setfilter("")
dw_4.filter()
return 1
end function

on w_ausentismo.create
this.dw_deta=create dw_deta
this.cbx_1=create cbx_1
this.dw_4=create dw_4
this.pb_repro=create pb_repro
this.tab_1=create tab_1
this.pb_3=create pb_3
this.st_1=create st_1
this.pb_7=create pb_7
this.dw_emp=create dw_emp
this.pb_2=create pb_2
this.pb_1=create pb_1
this.pb_nuevo=create pb_nuevo
this.pb_cerrar=create pb_cerrar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.dw_deta,&
this.cbx_1,&
this.dw_4,&
this.pb_repro,&
this.tab_1,&
this.pb_3,&
this.st_1,&
this.pb_7,&
this.dw_emp,&
this.pb_2,&
this.pb_1,&
this.pb_nuevo,&
this.pb_cerrar,&
this.dw_1,&
this.gb_1}
end on

on w_ausentismo.destroy
destroy(this.dw_deta)
destroy(this.cbx_1)
destroy(this.dw_4)
destroy(this.pb_repro)
destroy(this.tab_1)
destroy(this.pb_3)
destroy(this.st_1)
destroy(this.pb_7)
destroy(this.dw_emp)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.pb_nuevo)
destroy(this.pb_cerrar)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_emp.InsertRow(0)
dw_1.GetChild('cod_ausen',dwc_a)
dwc_a.SetTransObject(SQLCA)
dwc_a.setfilter("estado='1'")
dwc_a.filter()
dw_1.InsertRow(0)

end event

type dw_deta from datawindow within w_ausentismo
integer x = 78
integer y = 1516
integer width = 3653
integer height = 428
integer taborder = 60
string title = "none"
string dataobject = "dw_nompo_ausentismo_det"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type cbx_1 from checkbox within w_ausentismo
integer x = 2176
integer y = 164
integer width = 411
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solo Activos"
boolean checked = true
end type

event clicked;if checked then
	dwc_a.setfilter("estado='1'")
else
	dwc_a.setfilter("")	
end if
dwc_a.filter()
end event

type dw_4 from datawindow within w_ausentismo
boolean visible = false
integer x = 2487
integer y = 12
integer width = 329
integer height = 100
integer taborder = 30
string title = "none"
string dataobject = "dw_setausentismo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type pb_repro from picturebutton within w_ausentismo
integer x = 3438
integer y = 136
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "reprogramar.gif"
string disabledname = "d_reprogramar.gif"
string powertiptext = "Reprogramar"
end type

event clicked;st_xa_anular st_anula
st_anula.tipo='VA'
long fila
string valor

if not valido then
	MessageBox('Atención','Seleccione un empleado válido')
	Return -1
end if
if isNull(dw_emp.GetItemString(1,'documento')) or dw_emp.GetItemString(1,'documento') = '' then
	MessageBox('Atención','Debe seleccionar un empleado')
	Return -1
end if
if dw_emp.GetItemdatetime(1,'fecha_retiro') <=datetime(today(),now()) then
	MessageBox('Atención','Empleado Retirado')
	Return -1
end if

if isNull(dw_1.GetItemString(1,'cod_ausen')) or dw_1.GetItemString(1,'cod_ausen') = '%' then
	MessageBox('Atención','Seleccione tipo de ausentismo')
	Return -1
end if

if a_est='0'then
	MessageBox('Atención','Tipo de ausentismo Inactivo')
	Return -1
end if
fila=tab_1.vaca.dw_2.getrow()

if tipo='2'  then
	if tab_1.vaca.dw_2.RowCount()= 0 then Return
	if not isnull(tab_1.vaca.dw_2.GetItemnumber(fila,'num_nomina') ) then
		Messagebox('Atención','Concepto ya Pagado no se puede anular')
		Return
	end if
	if tab_1.vaca.dw_2.GetItemString(fila,'estado') = '1' then
		openwithparm (w_motiv_anula,st_anula)
		st_anula=message.powerobjectparm
		if not isValid(st_anula) then return

		tab_1.vaca.dw_2.SetItem(fila,'estado','4')
		tab_1.vaca.dw_2.setitem(fila,'usu_anula',usuario)
		tab_1.vaca.dw_2.setitem(fila,'fecha_anula',datetime(today(),now()))
		tab_1.vaca.dw_2.setitem(fila,'motiv_anula',st_anula.observacion)
		tab_1.vaca.dw_2.setitem(fila,'cod_anula',st_anula.motivo)
		
		valor =tab_1.vaca.dw_2.Describe("Evaluate('max(item)',0)")
		tab_1.vaca.dw_2.RowsCopy(fila, fila, primary!, tab_1.vaca.dw_2, 1,primary!)
		fila=tab_1.vaca.dw_2.getrow()
		tab_1.vaca.dw_2.setItem(fila,'item', long(valor) + 1)
		tab_1.vaca.dw_2.SetItem(fila,'incap','0')
		tab_1.vaca.dw_2.setItem(fila,'estado', '0')	

		if tab_1.vaca.dw_2.Update() = -1 then
			Rollback;
			Return -1
		end if
	end if
end if
end event

type tab_1 from tab within w_ausentismo
integer x = 37
integer y = 276
integer width = 5189
integer height = 1132
integer taborder = 40
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
vaca vaca
lice lice
end type

on tab_1.create
this.vaca=create vaca
this.lice=create lice
this.Control[]={this.vaca,&
this.lice}
end on

on tab_1.destroy
destroy(this.vaca)
destroy(this.lice)
end on

type vaca from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5152
integer height = 1004
long backcolor = 67108864
string text = "Vacaciones"
long tabtextcolor = 33554432
string picturename = "vacaciones.ico"
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on vaca.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on vaca.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within vaca
integer x = 18
integer y = 16
integer width = 5070
integer height = 968
integer taborder = 20
string dataobject = "dw_setausentismo_vac"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;accepttext()
if dwo.name='fechai_cau'  or dwo.name='fechaf_cau' or dwo.name='fechaini'  or dwo.name='fechafin' or dwo.name='fecha_res' then
	date fec_ing, fec_hoy
	string cualf
	
	cualf=dwo.name
	if dwo.name='fechai_cau' or  dwo.name='fechaf_cau'  then
		fec_hoy=f_dias_habiles(date(data),300)
	end if
	
	if dwo.name='fechaini'   or dwo.name='fechafin'  then
		if dw_2.rowcount()=1 then
			fec_hoy=f_dias_habiles(date(data),15)
		else
			fec_hoy=f_dias_habiles(date(data),45)
		end if
		setitem(row,'fechafin',fec_hoy)
	end if
	fec_ing=date(dw_emp.GetItemDatetime(dw_emp.getrow(),"ingre_empre"))
	if (date(data)>=fec_hoy or  date(data)<=fec_ing) and ( dwo.name='fechaini'  or dwo.name='fechafin' ) then
		messagebox("Atención",'Fecha debe estar entre '+string(fec_ing,'dd/mm/yyyy')+' y el '+string(fec_hoy,'dd/mm/yyyy')+' verifique')
		setnull(fec_hoy)
		setitem(row,cualf,fec_hoy)
		accepttext()
		return 1
	End If
	if dw_2.GetItemdatetime(dw_2.getrow(),"fechai_cau") > dw_2.GetItemdatetime(dw_2.getrow(),"fechaf_cau") then 
		messagebox("Atención",'Fecha Incial de Causacion no puede ser mayor a la Final de Causacion verifique')
		setnull(fec_hoy)
		setitem(row,cualf,fec_hoy)
		accepttext()
		return 1		
	end if
	if dw_2.GetItemDatetime(dw_2.getrow(),"fechaf_cau") < dw_2.GetItemDatetime(dw_2.getrow(),"fechai_cau") then 
		messagebox("Atención",'Fecha Final de Causacion no puede ser menor a la Inicial de Causacion verifique')
		setnull(fec_hoy)
		setitem(row,cualf,fec_hoy)
		accepttext()
		return 1		
	end if
	if dw_2.GetItemDatetime(dw_2.getrow(),"fechaini") > dw_2.GetItemDatetime(dw_2.getrow(),"fechafin") then 
		messagebox("Atención",'Fecha Inicial de Disfrute no puede ser mayor a la Final de Disfrute verifique')
		setnull(fec_hoy)
		setitem(row,cualf,fec_hoy)
		accepttext()
		return 1		
	end if
	if dw_2.GetItemDatetime(dw_2.getrow(),"fechafin") < dw_2.GetItemDatetime(dw_2.getrow(),"fechaini") then 
		messagebox("Atención",'Fecha Final de Disfrute no puede ser menor a la Inicial de Disfrute verifique')
		setnull(fec_hoy)
		setitem(row,cualf,fec_hoy)
		accepttext()
		return 1		
	end if
End If


end event

event itemerror;//return -1
end event

event rowfocuschanged;if dw_2.rowcount()=0 then return
dw_deta.retrieve(dw_2.getitemstring(dw_2.getrow(),'tipodoc'),dw_2.getitemstring(dw_2.getrow(),'documento'),dw_2.getitemstring(dw_2.getrow(),'cod_ausen'),dw_2.getitemnumber(dw_2.getrow(),'item'))
end event

type lice from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5152
integer height = 1004
long backcolor = 67108864
string text = "Licencias"
long tabtextcolor = 33554432
string picturename = "incapacidad.ico"
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on lice.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on lice.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within lice
integer x = 41
integer y = 24
integer width = 5083
integer height = 972
integer taborder = 20
string dataobject = "dw_setausentismo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;accepttext()
if dwo.name='fechaini'  or dwo.name='fechafin' then
	date fec_ing, fec_hoy
	string cualf
	
	cualf=dwo.name
   	fec_hoy=relativedate(date(today()),180)
	fec_ing=date(dw_emp.GetItemDatetime(dw_emp.getrow(),"ingre_empre"))
	if date(data)>=fec_hoy or  date(data)<=fec_ing then
		messagebox("Atención",'Fecha debe estar entre '+string(fec_ing,'dd/mm/yyyy')+' y el '+string(fec_hoy,'dd/mm/yyyy')+' verifique')
		setnull(fec_hoy)
		setitem(row,cualf,fec_hoy)
		accepttext()
		return 1
	End If
	if dw_3.GetItemDatetime(dw_3.getrow(),"fechaini") > dw_3.GetItemDatetime(dw_3.getrow(),"fechafin") then 
		messagebox("Atención",'Fecha Incial no puede ser mayor a la Final verifique')
		setnull(fec_hoy)
		setitem(row,cualf,fec_hoy)
		accepttext()
		return 1		
	end if
	if dw_3.GetItemDatetime(dw_3.getrow(),"fechafin") < dw_3.GetItemDatetime(dw_3.getrow(),"fechaini") then 
		messagebox("Atención",'Fecha Final no puede ser menor a la Inicial verifique')
		setnull(fec_hoy)
		setitem(row,cualf,fec_hoy)
		accepttext()
		return 1		
	end if
End If
if dwo.name='tipo' then
	if dw_3.GetItemstring(dw_3.getrow(),"tipo")='P' then
		st_ausentismo_prorroga prorroga
		prorroga.tipodoc=dw_3.GetItemstring(row,"tipodoc")
		prorroga.documento=dw_3.GetItemstring(row,"documento")
		prorroga.incap=dw_3.GetItemstring(row,"cod_ausen")
		openwithparm(w_ausentismo_prorroga,prorroga)
		prorroga =  Message.PowerObjectParm
		if prorroga.item=-1 then 
			deleterow(row)
			return -1
		end if
		setitem(row,"tipodoc_pro",prorroga.tipodoc)
		setitem(row,"documento_pro",prorroga.documento)
		setitem(row,"codausen_pro",prorroga.incap)		
		setitem(row,"item_pro",prorroga.item)				
	end if
end if

end event

event rowfocuschanged;if dw_3.rowcount()=0 then return
dw_deta.retrieve(dw_3.getitemstring(dw_3.getrow(),'tipodoc'),dw_3.getitemstring(dw_3.getrow(),'documento'),dw_3.getitemstring(dw_3.getrow(),'cod_ausen'),dw_3.getitemnumber(dw_3.getrow(),'item'))
end event

type pb_3 from picturebutton within w_ausentismo
event mousemove pbm_mousemove
string tag = "Nuevo &Documento"
integer x = 3118
integer y = 136
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $d"
boolean originalsize = true
string picturename = "anular_doc.gif"
string powertiptext = "Anular documento"
end type

event clicked;st_xa_anular st_anula
long ctos
datetime inicia_his,fin_his
date fecha_bonserv
string xtd,xdc

xtd=dw_emp.GetItemString(1,'tipodoc')
xdc=dw_emp.GetItemString(1,'documento')
st_anula.tipo='NA'

if tipo='2'  then
	if tab_1.vaca.dw_2.RowCount()= 0 then Return
	if not isnull(tab_1.vaca.dw_2.GetItemnumber(tab_1.vaca.dw_2.GetRow(),'num_nomina') ) then
		Messagebox('Atención','Concepto ya Pagado no se puede anular')
		Return
	end if
	if tab_1.vaca.dw_2.GetItemString(tab_1.vaca.dw_2.GetRow(),'estado') = '1' then
		openwithparm (w_motiv_anula,st_anula)
		st_anula=message.powerobjectparm
		if not isValid(st_anula) then return
		tab_1.vaca.dw_2.SetItem(tab_1.vaca.dw_2.GetRow(),'estado','3')
		tab_1.vaca.dw_2.setitem(tab_1.vaca.dw_2.GetRow(),'usu_anula',usuario)
		tab_1.vaca.dw_2.setitem(tab_1.vaca.dw_2.GetRow(),'fecha_anula',datetime(today(),now()))
		tab_1.vaca.dw_2.setitem(tab_1.vaca.dw_2.GetRow(),'motiv_anula',st_anula.observacion)
		tab_1.vaca.dw_2.setitem(tab_1.vaca.dw_2.GetRow(),'cod_anula',st_anula.motivo)	
		if tab_1.vaca.dw_2.Update() = -1 then
			Rollback;
			Return -1
		end if
	end if
else
	if tab_1.lice.dw_3.RowCount()= 0 then Return
	if tab_1.lice.dw_3.GetItemString(tab_1.lice.dw_3.GetRow(),'estado') = '1' then
		openwithparm (w_motiv_anula,st_anula)
		st_anula=message.powerobjectparm
		if not isValid(st_anula) then return
		tab_1.lice.dw_3.SetItem(tab_1.lice.dw_3.GetRow(),'estado','3')
		tab_1.lice.dw_3.setitem(tab_1.lice.dw_3.GetRow(),'usu_anula',usuario)
		tab_1.lice.dw_3.setitem(tab_1.lice.dw_3.GetRow(),'fecha_anula',datetime(today(),now()))
		tab_1.lice.dw_3.setitem(tab_1.lice.dw_3.GetRow(),'motiv_anula',st_anula.observacion)
		tab_1.lice.dw_3.setitem(tab_1.lice.dw_3.GetRow(),'cod_anula',st_anula.motivo)	
		if dwc_a.getitemstring(dwc_a.getrow(),'bonif')='1' then
			select fecha_bonif into :fecha_bonserv from empleados where tipodoc=:xtd and documento=:xdc ;
			inicia_his=datetime(date(tab_1.lice.dw_3.GetItemDatetime(tab_1.lice.dw_3.GetRow(),"fechaini")),time('00:00'))
			fin_his=datetime(date(tab_1.lice.dw_3.GetItemDatetime(tab_1.lice.dw_3.GetRow(),"fechafin")),time('23:59'))
			ctos=DaysAfter(date(inicia_his),date(fin_his)) + 1
			
			fecha_bonserv=relativedate(fecha_bonserv , - ctos)
			update empleado set fecha_bonif=:fecha_bonserv from empleados where tipodoc=:xtd and documento=:xdc ;
			if sqlca.sqlcode=-1 then
				rollback;
				return -1
			end if
		end if
		if tab_1.lice.dw_3.Update() = -1 then
			Rollback;
			Return -1
		end if
	end if
end if
commit;

end event

type st_1 from statictext within w_ausentismo
integer x = 37
integer y = 168
integer width = 375
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Ausentismo"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_7 from picturebutton within w_ausentismo
event mousemove pbm_mousemove
integer x = 2240
integer width = 142
integer height = 124
integer taborder = 50
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
openwithparm(w_busca_emp,dw_emp)
if not isNull(dw_emp.GetItemString(1,'documento')) then
	dw_emp.triggerEvent(itemchanged!)
end if

end event

type dw_emp from datawindow within w_ausentismo
integer x = 37
integer y = 28
integer width = 2158
integer height = 128
integer taborder = 10
string title = "none"
string dataobject = "dw_regla_gen_empleado"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long fila
if this.AcceptText() = -1 then Return
if isNull(this.GetItemString(1,'documento')) or this.GetItemString(1,'documento') = '' then Return

tipodoc = this.GetItemString(1,'tipodoc')
documento = this.GetItemString(1,'documento')
if this.Retrieve(tipodoc, documento) < 1 then
	this.InsertRow(0)
	this.SetItem(1,'tipodoc',tipodoc)
	this.SetItem(1,'documento',documento)
	valido = FALSE
	MessageBox('Atención','El empleado no existe')
else
	valido = TRUE
	if not isNull(dw_1.GetItemString(1,'cod_ausen')) then
		tab_1.vaca.dw_2.retrieve(tipodoc,documento,dw_1.GetItemString(1,'cod_ausen'))
		tab_1.lice.dw_3.retrieve(tipodoc,documento,dw_1.GetItemString(1,'cod_ausen'))
	end if
end if

end event

event constructor;setTransObject(SQLCA)

end event

type pb_2 from picturebutton within w_ausentismo
event mousemove pbm_mousemove
string tag = "&Anular Ahorro"
integer x = 3278
integer y = 136
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $A"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar"
end type

event clicked;long i,ctos
string xtd,xdc
datetime inicia_his,fin_his
date fecha_bonserv
xtd=dw_emp.GetItemString(1,'tipodoc')
xdc=dw_emp.GetItemString(1,'documento')

if tipo='2'  then
	if  tab_1.vaca.dw_2.RowCount() < 1 then Return
	
	if f_intervalo(tab_1.vaca.dw_2)= -1 then return -1
	for i = 1 to tab_1.vaca.dw_2.RowCount()
		if tab_1.vaca.dw_2.GetItemString(i,'estado') = '3' then Continue
		tab_1.vaca.dw_2.SetItem(i,'estado','1')
		inicia_his=datetime(date(tab_1.vaca.dw_2.GetItemDatetime(i,"fechaini")),time('00:00'))
		fin_his=datetime(date(tab_1.vaca.dw_2.GetItemDatetime(i,"fechafin")),time('23:59'))
		select count(*) into :ctos from nom_programacion
		where ((tipodoc=:xtd and documento=:xdc and calculado='0') and ((inicio between :inicia_his and :fin_his) or  (fin between :inicia_his and :fin_his)));
		if ctos>0 then 
			if messagebox("Atención","Hay Registros en programación se eliminaran, esta seguro ?",Question!,YesNo! )=1 then 
				delete from nom_programacion
				where ((tipodoc=:xtd and documento=:xdc and calculado='0') and ((inicio between :inicia_his and :fin_his) or  (fin between :inicia_his and :fin_his)));
			end if
		end if
	next
	if tab_1.vaca.dw_2.update(true,false) = -1 then
		Rollback;
		Return -1
	end if
else
	if  tab_1.lice.dw_3.RowCount() < 1 then Return
	if f_intervalo( tab_1.lice.dw_3)= -1 then return -1
	for i = 1 to tab_1.lice.dw_3.RowCount()
		if tab_1.lice.dw_3.GetItemString(i,'estado') = '3' then Continue
		tab_1.lice.dw_3.SetItem(i,'estado','1')
		inicia_his=datetime(date(tab_1.lice.dw_3.GetItemDatetime(i,"fechaini")),time('00:00'))
		fin_his=datetime(date(tab_1.lice.dw_3.GetItemDatetime(i,"fechafin")),time('23:59'))
		select count(*) into :ctos from nom_programacion
		where ((tipodoc=:xtd and documento=:xdc and calculado='0') and ((inicio between :inicia_his and :fin_his) or  (fin between :inicia_his and :fin_his)));
		if ctos>0 then 
			if messagebox("Atención","Hay Registros en programación se eliminaran, esta seguro ?",Question!,YesNo! )=1 then 
				delete from nom_programacion
				where ((tipodoc=:xtd and documento=:xdc and calculado='0') and ((inicio between :inicia_his and :fin_his) or  (fin between :inicia_his and :fin_his)));
			end if
		end if		
		if dwc_a.getitemstring(dwc_a.getrow(),'bonif')='1' then
			select fecha_bonif into :fecha_bonserv from empleados where tipodoc=:xtd and documento=:xdc ;
			ctos=DaysAfter(date(inicia_his),date(fin_his)) + 1
			
			fecha_bonserv=relativedate(fecha_bonserv ,ctos)
			update empleados set fecha_bonif=:fecha_bonserv where tipodoc=:xtd and documento=:xdc ;
			if sqlca.sqlcode=-1 then
				rollback;
				return -1
			end if
		end if
	next
	if tab_1.lice.dw_3.Update(true,false) = -1 then
		Rollback;
		Return -1
	end if	
end if

commit;
dw_1.TriggerEvent(itemchanged!)
end event

type pb_1 from picturebutton within w_ausentismo
event mousemove pbm_mousemove
string tag = "&Anular Ahorro"
integer x = 2958
integer y = 136
integer width = 146
integer height = 128
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $A"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "&Borrar registro nuevo"
end type

event clicked;if tipo='2'  then
	if tab_1.vaca.dw_2.RowCount()< 1 then Return
	if  tab_1.vaca.dw_2.GetItemString( tab_1.vaca.dw_2.GetRow(),'estado') = '1' then
		messagebox('Error','El registro ya ha sido cerrado')
		Return
	end if
	
	if  tab_1.vaca.dw_2.GetItemString(tab_1.vaca.dw_2.GetRow(),'estado') = '0' then
		 tab_1.vaca.dw_2.DeleteRow(tab_1.vaca.dw_2.GetRow())
		 tab_1.vaca.dw_2.TriggerEvent(rowFocuschanged!)
		Return
	end if	
else
	if tab_1.lice.dw_3.RowCount() < 1 then Return
	if tab_1.lice.dw_3.GetItemString(tab_1.lice.dw_3.GetRow(),'estado') = '1' then
		messagebox('Error','El registro ya ha sido cerrado')
		Return
	end if
	if  tab_1.lice.dw_3.GetItemString(tab_1.lice.dw_3.GetRow(),'estado') = '0' then
		tab_1.lice.dw_3.DeleteRow(tab_1.lice.dw_3.GetRow())
		 tab_1.lice.dw_3.TriggerEvent(rowFocuschanged!)
		Return
	end if	
end if

end event

type pb_nuevo from picturebutton within w_ausentismo
event mousemove pbm_mousemove
string tag = "Nuevo &Documento"
integer x = 2793
integer y = 136
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $d"
boolean originalsize = true
string picturename = "insertar.GIF"
string powertiptext = "Nuevo &Documento"
end type

event clicked;long fila
string valor

if not valido then
	MessageBox('Atención','Seleccione un empleado válido')
	Return -1
end if
if isNull(dw_emp.GetItemString(1,'documento')) or dw_emp.GetItemString(1,'documento') = '' then
	MessageBox('Atención','Debe seleccionar un empleado')
	Return -1
end if

if dw_emp.GetItemdatetime(1,'fecha_retiro') <=datetime(today(),now()) then
	MessageBox('Atención','Empleado Retirado')
	Return -1
end if

if isNull(dw_1.GetItemString(1,'cod_ausen')) or dw_1.GetItemString(1,'cod_ausen') = '%' then
	MessageBox('Atención','Seleccione tipo de ausentismo')
	Return -1
end if
if a_est='0'then
	MessageBox('Atención','Tipo de ausentismo Inactivo')
	Return -1
end if

if tipo='2' then
	valor =string(tab_1.vaca.dw_2.getitemnumber(1,'maximos'))
	if isnull(valor) then valor='0'
	fila = tab_1.vaca.dw_2.InsertRow(1)
	tab_1.vaca.dw_2.setItem(fila,'tipodoc', dw_emp.GetItemString(1,'tipodoc'))
	tab_1.vaca.dw_2.setItem(fila,'documento', dw_emp.GetItemString(1,'documento'))
	tab_1.vaca.dw_2.setItem(fila,'cod_ausen', dw_1.GetItemString(1,'cod_ausen'))
	tab_1.vaca.dw_2.setItem(fila,'sigla', concep)
	tab_1.vaca.dw_2.setItem(fila,'item', long(valor) + 1)
	if isnull(tab_1.vaca.dw_2.getitemnumber(1,'maxperlab')) or tab_1.vaca.dw_2.getitemnumber(1,'maxperlab')=0 then
		valor=string(year(date(dw_emp.GetItemdatetime(1,'ingre_empre'))))
	else
		valor=string(tab_1.vaca.dw_2.getitemnumber(1,'maxperlab')+1)
	end if	
	tab_1.vaca.dw_2.SetItem(fila,'peri_lab',integer(valor))
	if isnull(tab_1.vaca.dw_2.getitemdatetime(1,'maxfci')) then
		valor=string(date(dw_emp.GetItemdatetime(1,'ingre_empre')))
	else
		valor=string(tab_1.vaca.dw_2.getitemdatetime(1,'maxfci'))
	end if	
	tab_1.vaca.dw_2.SetItem(fila,'fechai_cau',date(valor))	
	tab_1.vaca.dw_2.SetItem(fila,'incap','0')
	tab_1.vaca.dw_2.setItem(fila,'estado', '0')	
	tab_1.vaca.dw_2.setItem(fila,'fecha_audita',datetime(date(today()),now()))	
	tab_1.vaca.dw_2.setItem(fila,'usuario', usuario)		
else
	valor =tab_1.lice.dw_3.Describe("Evaluate('max(item)',0)")
	fila = tab_1.lice.dw_3.InsertRow(1)
	tab_1.lice.dw_3.setItem(fila,'tipodoc', dw_emp.GetItemString(1,'tipodoc'))
	tab_1.lice.dw_3.setItem(fila,'documento', dw_emp.GetItemString(1,'documento'))
	tab_1.lice.dw_3.setItem(fila,'cod_ausen', dw_1.GetItemString(1,'cod_ausen'))
	tab_1.lice.dw_3.setItem(fila,'descripcion', descripcion)
	tab_1.lice.dw_3.setItem(fila,'sigla', concep)
	tab_1.lice.dw_3.setItem(fila,'item', long(valor) + 1)
	tab_1.lice.dw_3.setItem(fila,'estado', '0')
	tab_1.lice.dw_3.setItem(fila,'fecha_audita',datetime(date(today()),now()))	
	tab_1.lice.dw_3.setItem(fila,'usuario', usuario)		
	if tipo='1' then 
		tab_1.lice.dw_3.SetItem(fila,'incap','1')
		tab_1.lice.dw_3.SetItem(fila,'tipo','I')
	else
		tab_1.lice.dw_3.SetItem(fila,'incap','0')
	end if
		tab_1.lice.dw_3.scrolltoRow(fila)
end if
end event

type pb_cerrar from picturebutton within w_ausentismo
event mousemove pbm_mousemove
string tag = "&Cerrar"
integer x = 2633
integer y = 136
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $C"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "&Cerrar"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_ausentismo
integer x = 416
integer y = 164
integer width = 1714
integer height = 76
integer taborder = 20
string title = "none"
string dataobject = "dw_ext_ausentismo"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;AcceptText()
string aus, filtro
if dw_1.GetItemString(1,'cod_ausen') = '%' then
	filtro = ''
else
	filtro = "cod_ausen='"+dw_1.GetItemString(1,'cod_ausen')+"'"
	aus = dw_1.GetItemString(1,'cod_ausen')
end if

select c.sigla, a.descripcion, a.estado,incap into :concep, :descripcion,:a_est,:tipo
from nom_tipo_ausentismo a left join  nom_concep c on  a.cod_concep = c.cod_concep 
where a.cod_ausen=:aus;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF

if tipo='2' then
	tab_1.vaca.enabled=true
	tab_1.lice.enabled=false	
	tab_1.vaca.dw_2.retrieve(tipodoc,documento,aus)
	tab_1.selectedTab=1
	pb_repro.enabled=true
else
	tab_1.vaca.enabled=false
	tab_1.lice.enabled=true	
	tab_1.lice.dw_3.retrieve(tipodoc,documento,aus)
	tab_1.lice.dw_3.visible=true
	tab_1.selectedTab=2
	pb_repro.enabled=false
end if
dw_4.retrieve(tipodoc,documento,'%')
dw_4.setfilter("estado='1'")
dw_4.filter()
end event

type gb_1 from groupbox within w_ausentismo
integer x = 46
integer y = 1436
integer width = 3730
integer height = 552
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Ausentismo"
end type

