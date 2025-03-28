$PBExportHeader$w_paci_sinapdx2.srw
forward
global type w_paci_sinapdx2 from window
end type
type pb_2 from pb_report within w_paci_sinapdx2
end type
type dw_1 from datawindow within w_paci_sinapdx2
end type
type pb_1 from picturebutton within w_paci_sinapdx2
end type
type rb_2 from radiobutton within w_paci_sinapdx2
end type
type rb_1 from radiobutton within w_paci_sinapdx2
end type
type f_pabe from checkbox within w_paci_sinapdx2
end type
type dw_area from datawindow within w_paci_sinapdx2
end type
type ddlb_1 from dropdownlistbox within w_paci_sinapdx2
end type
type st_4 from statictext within w_paci_sinapdx2
end type
type pb_atien from picturebutton within w_paci_sinapdx2
end type
type st_2 from statictext within w_paci_sinapdx2
end type
type st_3 from statictext within w_paci_sinapdx2
end type
type st_1 from statictext within w_paci_sinapdx2
end type
type gb_1 from groupbox within w_paci_sinapdx2
end type
type dw_muestra from datawindow within w_paci_sinapdx2
end type
type dw_pabellon from datawindow within w_paci_sinapdx2
end type
type st_area from statictext within w_paci_sinapdx2
end type
end forward

global type w_paci_sinapdx2 from window
integer width = 4064
integer height = 1880
boolean titlebar = true
string title = "Pacientes con órdenes a atender en Apoyo Diagnóstico o con Resultados pendientes de Registrar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Information!"
boolean clientedge = true
boolean contexthelp = true
boolean center = true
pb_2 pb_2
dw_1 dw_1
pb_1 pb_1
rb_2 rb_2
rb_1 rb_1
f_pabe f_pabe
dw_area dw_area
ddlb_1 ddlb_1
st_4 st_4
pb_atien pb_atien
st_2 st_2
st_3 st_3
st_1 st_1
gb_1 gb_1
dw_muestra dw_muestra
dw_pabellon dw_pabellon
st_area st_area
end type
global w_paci_sinapdx2 w_paci_sinapdx2

type variables
datetime isdt_ah,isdt_ah90d
string i_decual,tipo_ingres=''
end variables
forward prototypes
public subroutine filtrar ()
public subroutine traer ()
end prototypes

public subroutine filtrar ();string filtro=''
if f_pabe.checked then
	if not isnull(dw_pabellon.getitemstring(1,1)) then
		filtro="pabellon='"+dw_pabellon.getitemstring(1,1)+"'"
	end if
end if
dw_muestra.setfilter(filtro)
dw_muestra.filter()
dw_muestra.sort()
end subroutine

public subroutine traer ();dw_muestra.retrieve(w_apoyo_diag2.i_tipoing,w_apoyo_diag2.i_codarea,isdt_ah90d, isdt_ah)
if dw_1.retrieve(w_apoyo_diag2.i_tipoing,w_apoyo_diag2.i_codarea,isdt_ah90d, isdt_ah)>0 then
	long j,k,cual
	for j=1 to dw_1.rowcount()
		cual=dw_1.getitemnumber(j,'solicitada') - dw_1.getitemnumber(j,'llevados')
		if cual>50 then
			if messagebox('Atención','Hay un procedimiento con cantidad mayor a 50, desea verlo de todas formas?',question!,yesno!,2)=2 then continue
		end if
		for k=1 to cual
			dw_1.rowscopy(j,j,primary!,dw_muestra,dw_muestra.rowcount()+1,primary!)
			dw_muestra.setitem(dw_muestra.rowcount(),'solicitada',1)
			dw_muestra.setitem(dw_muestra.rowcount(),'sitem',dw_1.getitemnumber(j,'llevados')+k )
		next
	next
	dw_muestra.sort()
	dw_muestra.groupcalc()
	dw_muestra.update()
	commit;
end if
end subroutine

on w_paci_sinapdx2.create
this.pb_2=create pb_2
this.dw_1=create dw_1
this.pb_1=create pb_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.f_pabe=create f_pabe
this.dw_area=create dw_area
this.ddlb_1=create ddlb_1
this.st_4=create st_4
this.pb_atien=create pb_atien
this.st_2=create st_2
this.st_3=create st_3
this.st_1=create st_1
this.gb_1=create gb_1
this.dw_muestra=create dw_muestra
this.dw_pabellon=create dw_pabellon
this.st_area=create st_area
this.Control[]={this.pb_2,&
this.dw_1,&
this.pb_1,&
this.rb_2,&
this.rb_1,&
this.f_pabe,&
this.dw_area,&
this.ddlb_1,&
this.st_4,&
this.pb_atien,&
this.st_2,&
this.st_3,&
this.st_1,&
this.gb_1,&
this.dw_muestra,&
this.dw_pabellon,&
this.st_area}
end on

on w_paci_sinapdx2.destroy
destroy(this.pb_2)
destroy(this.dw_1)
destroy(this.pb_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.f_pabe)
destroy(this.dw_area)
destroy(this.ddlb_1)
destroy(this.st_4)
destroy(this.pb_atien)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.dw_muestra)
destroy(this.dw_pabellon)
destroy(this.st_area)
end on

event open;i_decual=message.stringparm

isdt_ah=datetime(today(),now())
isdt_ah90d=datetime(relativedate(date(isdt_ah),-90),time(00,00,01))
if i_decual='apoyo' then
	select descripcion into :st_4.text from tipoingreso where codtingre=:w_apoyo_diag2.i_tipoing;
	select descripciongc into :st_area.text from areaadx where codaadx =:w_apoyo_diag2.i_codarea;
	traer()
	rb_2.visible=false
else
	ddlb_1.visible=true
	dw_area.visible=true
	dw_area.insertrow(1)
end if

end event

type pb_2 from pb_report within w_paci_sinapdx2
integer x = 2066
integer y = 1632
integer taborder = 90
string powertiptext = "Imprimir Regs. Seleccionados"
string cod_rep = "OSAD"
string nombre_rep = "Orden de Servicio para Apoyo Diagnóstico"
string tipo_rep = "interno!"
end type

event constructor;call super::constructor;inicia('interno!','OSAD',clugar)
end event

event clicked;call super::clicked;if dw_muestra.find('imp=1',1,dw_muestra.rowcount())=0 then return
long j
any par[1]
par[1]=usuario+string(datetime(today(),now()))
for j=1 to dw_muestra.rowcount()
	if dw_muestra.getitemnumber(j,'imp')=0 then continue
	if isnull(dw_muestra.getitemdatetime(j,'fecha_impreso')) then
		dw_muestra.setitem(j,'fecha_impreso',datetime(today(),now()))
		dw_muestra.setitem(j,'usu_imp',usuario)
	end if
	dw_muestra.setitem(j,'temp_imp',par[1])
	dw_muestra.setitem(j,'imp',0)
next
if dw_muestra.update()=-1 then return
commit;
imprimir(par,'','0')
end event

type dw_1 from datawindow within w_paci_sinapdx2
boolean visible = false
integer x = 3291
integer y = 168
integer width = 535
integer height = 188
integer taborder = 50
string title = "none"
string dataobject = "dw_apdx_sin_regis2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_1 from picturebutton within w_paci_sinapdx2
integer x = 1902
integer y = 1632
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "refrescar.gif"
alignment htextalign = left!
string powertiptext = "Refrescar"
end type

event clicked;if i_decual='apoyo' then
	dw_muestra.retrieve(w_apoyo_diag2.i_tipoing,w_apoyo_diag2.i_codarea,isdt_ah90d, isdt_ah)
else
	dw_area.triggerevent(itemchanged!)
end if
end event

type rb_2 from radiobutton within w_paci_sinapdx2
integer x = 1271
integer y = 200
integer width = 1550
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pacientes con Resultados Pendientes de Registrar en la Historia"
end type

event clicked;if dw_muestra.dataobject<>'dw_apdx_no_regis_his' then
	dw_muestra.dataobject='dw_apdx_no_regis_his'
	dw_muestra.settransobjecT(sqlca)
	dw_area.triggerevent(itemchanged!)
end if
end event

type rb_1 from radiobutton within w_paci_sinapdx2
integer x = 78
integer y = 200
integer width = 1097
integer height = 64
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pacientes con Pruebas Pendientes de realizar"
boolean checked = true
end type

event clicked;if dw_muestra.dataobject<>'dw_apdx_sin_regis1' then
	dw_muestra.dataobject='dw_apdx_sin_regis1'
	dw_muestra.settransobjecT(sqlca)
	dw_area.triggerevent(itemchanged!)
end if
end event

type f_pabe from checkbox within w_paci_sinapdx2
integer x = 2149
integer y = 256
integer width = 503
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por Pabellón:"
end type

event clicked;filtrar()
end event

type dw_area from datawindow within w_paci_sinapdx2
boolean visible = false
integer x = 882
integer y = 332
integer width = 1175
integer height = 104
integer taborder = 20
string title = "none"
string dataobject = "dw_areagral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
//modify('codaadx.height="72"')
modify('codaadx.dddw.autoretrieve=yes')
modify('codaadx_t.visible=0')
modify('codaadx.x=4')
end event

event itemchanged;accepttext()
if rowcounT()=0 then return
if isnull(getitemstring(1,1)) then return
if tipo_ingres='' then
	messagebox("Atención","Elija el tipo de Ingreso")
	return
end if
dw_muestra.retrieve(tipo_ingres,getitemstring(1,1))
filtrar()
end event

type ddlb_1 from dropdownlistbox within w_paci_sinapdx2
boolean visible = false
integer x = 82
integer y = 332
integer width = 672
integer height = 400
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
boolean sorted = false
string item[] = {"Urgencias","Hospitalización","Ambulatorio"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text
	case 'Urgencias'
		tipo_ingres='2'
	case 'Hospitalización'
		tipo_ingres='3'
	case 'Ambulatorio'
		tipo_ingres='4'
	case else
		return
end choose
dw_area.triggerevent(itemchanged!)
end event

type st_4 from statictext within w_paci_sinapdx2
integer x = 78
integer y = 336
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_atien from picturebutton within w_paci_sinapdx2
event mousemove pbm_mousemove
integer x = 1737
integer y = 1632
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "Cancelar.GIF"
string disabledname = "d_Cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type st_2 from statictext within w_paci_sinapdx2
integer x = 82
integer y = 272
integer width = 302
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Ingreso:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_paci_sinapdx2
integer x = 78
integer width = 3886
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = " Pacientes con órdenes de servicio de Apoyo diagnóstico que no se han realizado o que no se han registrado en la Historia: (Para llevar un paciente de doble Click sobre un procedimiento de la orden y quedará listo para atender los procedimientos del área)"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_paci_sinapdx2
integer x = 882
integer y = 272
integer width = 133
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Area:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_paci_sinapdx2
integer x = 2107
integer y = 256
integer width = 1134
integer height = 188
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type dw_muestra from datawindow within w_paci_sinapdx2
integer x = 73
integer y = 468
integer width = 3904
integer height = 1156
integer taborder = 50
string title = "none"
string dataobject = "dw_apdx_sin_regis1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event doubleclicked;long fila
fila=getrow()
if fila<1 then return
if i_decual='apoyo' then
	w_principal.dw_1.setitem(1,"tipodoc",dw_muestra.getitemstring(fila,"tipodoc"))
	w_principal.dw_1.setitem(1,"documento",dw_muestra.getitemstring(fila,"documento"))
	w_principal.dw_1.setcolumn("documento")
	w_principal.dw_1.triggerevent(itemchanged!)
	close(parent)
	w_apoyo_diag2.cb_hosp.triggerevent(clicked!)
	return
end if
if rb_2.checked then
	w_principal.dw_1.setitem(1,"tipodoc",dw_muestra.getitemstring(fila,"tipodoc"))
	w_principal.dw_1.setitem(1,"documento",dw_muestra.getitemstring(fila,"documento"))
	w_principal.dw_1.setcolumn("documento")
	w_principal.dw_1.triggerevent(itemchanged!)
	close(parent)
end if
end event

event dberror;rollback;
return 0
end event

type dw_pabellon from datawindow within w_paci_sinapdx2
integer x = 2130
integer y = 332
integer width = 1093
integer height = 92
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_pabellon"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;this.accepttext()
filtrar()
end event

type st_area from statictext within w_paci_sinapdx2
integer x = 891
integer y = 336
integer width = 1179
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

