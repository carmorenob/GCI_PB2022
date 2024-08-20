$PBExportHeader$w_hospitaliz.srw
forward
global type w_hospitaliz from window
end type
type rb_qx from radiobutton within w_hospitaliz
end type
type f_sinfac from radiobutton within w_hospitaliz
end type
type cbx_res from radiobutton within w_hospitaliz
end type
type f_salida from radiobutton within w_hospitaliz
end type
type gb_4 from groupbox within w_hospitaliz
end type
type rb_4 from radiobutton within w_hospitaliz
end type
type rb_3 from radiobutton within w_hospitaliz
end type
type rb_2 from radiobutton within w_hospitaliz
end type
type rb_1 from radiobutton within w_hospitaliz
end type
type lista1 from dropdownlistbox within w_hospitaliz
end type
type pb_2 from pb_report within w_hospitaliz
end type
type st_4 from statictext within w_hospitaliz
end type
type st_1 from statictext within w_hospitaliz
end type
type cb_1 from commandbutton within w_hospitaliz
end type
type f_prof from checkbox within w_hospitaliz
end type
type dw_espe from datawindow within w_hospitaliz
end type
type dw_profe from datawindow within w_hospitaliz
end type
type sle_1 from singlelineedit within w_hospitaliz
end type
type f_pabe from checkbox within w_hospitaliz
end type
type st_3 from statictext within w_hospitaliz
end type
type pb_1 from picturebutton within w_hospitaliz
end type
type cb_aceptar from picturebutton within w_hospitaliz
end type
type st_2 from statictext within w_hospitaliz
end type
type dw_activos from datawindow within w_hospitaliz
end type
type gb_2 from groupbox within w_hospitaliz
end type
type gb_3 from groupbox within w_hospitaliz
end type
type dw_pabellon from datawindow within w_hospitaliz
end type
type gb_1 from groupbox within w_hospitaliz
end type
type gb_7 from groupbox within w_hospitaliz
end type
type dw_tip_ingres from datawindow within w_hospitaliz
end type
end forward

global type w_hospitaliz from window
integer width = 4928
integer height = 2028
boolean titlebar = true
string title = "Pacientes con ingresos Activos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "hospital.ico"
boolean center = true
rb_qx rb_qx
f_sinfac f_sinfac
cbx_res cbx_res
f_salida f_salida
gb_4 gb_4
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
lista1 lista1
pb_2 pb_2
st_4 st_4
st_1 st_1
cb_1 cb_1
f_prof f_prof
dw_espe dw_espe
dw_profe dw_profe
sle_1 sle_1
f_pabe f_pabe
st_3 st_3
pb_1 pb_1
cb_aceptar cb_aceptar
st_2 st_2
dw_activos dw_activos
gb_2 gb_2
gb_3 gb_3
dw_pabellon dw_pabellon
gb_1 gb_1
gb_7 gb_7
dw_tip_ingres dw_tip_ingres
end type
global w_hospitaliz w_hospitaliz

type variables
string tipo_ingres,orden,anterior
datawindowchild dw_pabe

end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();string filtro='',estados
int posi

if rb_qx.checked then
	if dw_activos.dataobject<>'dw_activos6' then
		dw_activos.dataobject='dw_activos6'
		dw_activos.settransobject(sqlca)
	end if
	dw_activos.retrieve(tipo_ingres,clugar)
end if
if rb_4.checked or  f_salida.checked or  cbx_res.checked or f_sinfac.checked then
	if dw_activos.dataobject<>'dw_activos'  and dw_activos.dataobject<>'dw_activos_postgres' then
		if g_motor='postgres' then
			dw_activos.dataobject='dw_activos_postgres'
		else
			dw_activos.dataobject='dw_activos'
		end if
		dw_activos.settransobject(sqlca)
	end if
	dw_activos.retrieve(tipo_ingres,clugar)
end if

if rb_4.checked then
	filtro="isnull( nsalida ) and estado in ('1','6')"
else
	if f_salida.checked then 
		filtro="(not isnull(nsalida)) and estado='1'"
	end if
	if cbx_res.checked then
		filtro="isnull( nsalida ) and estado='6'"
	end if
	if f_sinfac.checked then
		filtro="estado='2'"
	end if
end if	

if f_pabe.checked then
	if not isnull(dw_pabellon.getitemstring(1,1)) then
		if filtro<>'' then 
			filtro+=" and pabellon='"+dw_pabellon.getitemstring(1,1)+"'"
		else
			filtro+=" pabellon='"+dw_pabellon.getitemstring(1,1)+"'"
		end if
	end if
end if
if f_prof.checked then
	if not isnull(dw_profe.getitemstring(1,1)) then
		if filtro<>'' then 
			filtro+=" and codprof='"+dw_profe.getitemstring(1,1)+"'"
		else
			filtro="codprof='"+dw_profe.getitemstring(1,1)+"'"
		end if
	end if
end if
dw_activos.setfilter(filtro)
dw_activos.filter()
dw_activos.sort()
st_3.text="Reg. "+string(dw_activos.getrow()) +" de "+string(dw_activos.rowcount())
end subroutine

on w_hospitaliz.create
this.rb_qx=create rb_qx
this.f_sinfac=create f_sinfac
this.cbx_res=create cbx_res
this.f_salida=create f_salida
this.gb_4=create gb_4
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.lista1=create lista1
this.pb_2=create pb_2
this.st_4=create st_4
this.st_1=create st_1
this.cb_1=create cb_1
this.f_prof=create f_prof
this.dw_espe=create dw_espe
this.dw_profe=create dw_profe
this.sle_1=create sle_1
this.f_pabe=create f_pabe
this.st_3=create st_3
this.pb_1=create pb_1
this.cb_aceptar=create cb_aceptar
this.st_2=create st_2
this.dw_activos=create dw_activos
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_pabellon=create dw_pabellon
this.gb_1=create gb_1
this.gb_7=create gb_7
this.dw_tip_ingres=create dw_tip_ingres
this.Control[]={this.rb_qx,&
this.f_sinfac,&
this.cbx_res,&
this.f_salida,&
this.gb_4,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.lista1,&
this.pb_2,&
this.st_4,&
this.st_1,&
this.cb_1,&
this.f_prof,&
this.dw_espe,&
this.dw_profe,&
this.sle_1,&
this.f_pabe,&
this.st_3,&
this.pb_1,&
this.cb_aceptar,&
this.st_2,&
this.dw_activos,&
this.gb_2,&
this.gb_3,&
this.dw_pabellon,&
this.gb_1,&
this.gb_7,&
this.dw_tip_ingres}
end on

on w_hospitaliz.destroy
destroy(this.rb_qx)
destroy(this.f_sinfac)
destroy(this.cbx_res)
destroy(this.f_salida)
destroy(this.gb_4)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.lista1)
destroy(this.pb_2)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.f_prof)
destroy(this.dw_espe)
destroy(this.dw_profe)
destroy(this.sle_1)
destroy(this.f_pabe)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.cb_aceptar)
destroy(this.st_2)
destroy(this.dw_activos)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_pabellon)
destroy(this.gb_1)
destroy(this.gb_7)
destroy(this.dw_tip_ingres)
end on

event resize;gb_2.width=newwidth - 20
gb_2.height = newheight - gb_2.y - 10
dw_activos.width=newwidth - 70
dw_activos.height = newheight - dw_activos.y - 30
end event

event open;string tingre
tingre=message.stringparm
if tingre='' or isnull(tingre) then 
	RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI", "tingreso", Regstring!, tingre)
	if tingre='' then setnull(tingre)
end if
dw_tip_ingres.setitem(1,1,tingre)
dw_tip_ingres.post event itemchanged(1,dw_tip_ingres.object.codtingre,tingre)

if g_motor='postgres' then
	dw_activos.dataobject='dw_activos_postgres'
else
	dw_activos.dataobject='dw_activos'
end if
dw_activos.settransobject(sqlca)
end event

type rb_qx from radiobutton within w_hospitaliz
integer x = 1216
integer y = 332
integer width = 498
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Paciente con Qx"
end type

event clicked;filtrar()
end event

type f_sinfac from radiobutton within w_hospitaliz
integer x = 1797
integer y = 224
integer width = 576
integer height = 68
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Pacientes Sin Factura"
end type

event clicked;filtrar()
end event

type cbx_res from radiobutton within w_hospitaliz
integer x = 1797
integer y = 332
integer width = 352
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Reservas"
end type

event clicked;filtrar()
end event

type f_salida from radiobutton within w_hospitaliz
integer x = 1221
integer y = 224
integer width = 567
integer height = 68
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Pacientes Con Salida"
end type

event clicked;filtrar()
end event

type gb_4 from groupbox within w_hospitaliz
integer x = 32
integer y = 44
integer width = 1093
integer height = 176
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Ingreso:"
borderstyle borderstyle = styleraised!
end type

type rb_4 from radiobutton within w_hospitaliz
integer x = 1221
integer y = 120
integer width = 421
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos"
boolean checked = true
end type

event clicked;filtrar()
end event

type rb_3 from radiobutton within w_hospitaliz
integer x = 2866
integer y = 224
integer width = 544
integer height = 64
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Especialidad destino"
end type

event clicked;if dw_activos.dataobject<>'dw_activos5' then
	dw_activos.dataobject='dw_activos5'
	dw_activos.settransobject(sqlca)
end if
dw_espe.accepttext()
if not isnull(dw_espe.getitemstring(1,1)) then
	dw_activos.retrieve(tipo_ingres,clugar,dw_espe.getitemstring(1,1))
else
	dw_activos.reset()
end if
filtrar()
end event

type rb_2 from radiobutton within w_hospitaliz
integer x = 1797
integer y = 116
integer width = 398
integer height = 64
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimiento"
end type

event clicked;if dw_activos.dataobject<>'dw_activos2' then
	dw_activos.dataobject='dw_activos2'
	dw_activos.settransobject(sqlca)
end if
if trim(sle_1.text)<>'' then
	dw_activos.retrieve(tipo_ingres,clugar,trim(sle_1.text))
else
	dw_activos.reset()
end if
filtrar()
end event

type rb_1 from radiobutton within w_hospitaliz
integer x = 2866
integer y = 104
integer width = 402
integer height = 64
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medicamentos"
end type

event clicked;lista1.triggerevent(selectionchanged!)
end event

type lista1 from dropdownlistbox within w_hospitaliz
integer x = 3419
integer y = 100
integer width = 1326
integer height = 324
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"Med. sin Despachar","Med. sin Aplicar"}
borderstyle borderstyle = stylelowered!
end type

event constructor;text='Med. sin Despachar'
end event

event selectionchanged;choose case text
	case 'Med. sin Despachar'
		dw_activos.dataobject='dw_activos4'
	case 'Med. sin Aplicar'
		dw_activos.dataobject='dw_activos3'
end choose
rb_1.checked=true
dw_activos.settransobject(sqlca)
dw_activos.retrieve(tipo_ingres,clugar)
filtrar()
end event

type pb_2 from pb_report within w_hospitaliz
integer x = 645
integer y = 424
integer taborder = 140
string powertiptext = "Imprimir"
string cod_rep = "CENS"
string nombre_rep = "Censo Diario"
string tipo_rep = "interno!"
boolean v_preliminar = true
end type

event clicked;call super::clicked;if dw_activos.rowcount()>0 then
	if imprimir({tipo_ingres},'','0')=-1 then return
	if isvalid(w_reporte_gral) then
		string filtro
		filtro=dw_activos.describe("datawindow.table.filter")
		if filtro<>"?" then 
			w_reporte_gral.dw_rep.setfilter(filtro)
			w_reporte_gral.dw_rep.filter()
		end if
	end if
end if
end event

type st_4 from statictext within w_hospitaliz
integer x = 3634
integer y = 516
integer width = 503
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Con Orden de salida"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb(200,220,200)
end event

type st_1 from statictext within w_hospitaliz
integer x = 3122
integer y = 516
integer width = 503
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Sin Valoración Inicial"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb(220,200,200)
end event

type cb_1 from commandbutton within w_hospitaliz
integer x = 2249
integer y = 108
integer width = 160
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CUPS"
end type

event clicked;st_pa_proc str_proc
str_proc.sle=sle_1
str_proc.t_ingreso=tipo_ingres
openwithparm(w_busca_proc,str_proc)

end event

type f_prof from checkbox within w_hospitaliz
integer x = 2871
integer y = 332
integer width = 370
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesional"
end type

event clicked;filtrar()
end event

type dw_espe from datawindow within w_hospitaliz
integer x = 3406
integer y = 212
integer width = 1344
integer height = 96
integer taborder = 70
string title = "none"
string dataobject = "dw_combo_espe"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;rb_3.checked=true
this.accepttext()
rb_3.event clicked()
filtrar()
end event

type dw_profe from datawindow within w_hospitaliz
integer x = 3241
integer y = 324
integer width = 1499
integer height = 100
integer taborder = 90
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;this.accepttext()
filtrar()
end event

type sle_1 from singlelineedit within w_hospitaliz
integer x = 2446
integer y = 112
integer width = 343
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string codi
rb_2.checked=true
if THIS.TEXT<>'' then 
	setnull(codi)
	select codproced into :codi from proced where codproced=:this.text;
	if isnull(codi) then 
		messagebox("Error","Este procedimiento no existe")
		this.text=''
		return
	end if
end if
rb_2.event clicked()
end event

type f_pabe from checkbox within w_hospitaliz
integer x = 69
integer y = 220
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

type st_3 from statictext within w_hospitaliz
integer x = 4192
integer y = 500
integer width = 594
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_hospitaliz
event mousemove pbm_mousemove
integer x = 489
integer y = 424
integer width = 146
integer height = 128
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type cb_aceptar from picturebutton within w_hospitaliz
event mousemove pbm_mousemove
integer x = 334
integer y = 424
integer width = 146
integer height = 128
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;long fila
fila=dw_activos.getrow()
if fila<1 then return
if isvalid(w_admision) then
	w_admision.tipo_ingres=tipo_ingres
	w_admision.dw_tingres.setitem(1,1,tipo_ingres)
end if
if isvalid(w_new_at_os) then
	w_new_at_os.is_tipo_ingres=tipo_ingres
	w_new_at_os.dw_tip_ingres.setitem(1,1,tipo_ingres)
end if
if isvalid(w_entrega_med) then
	w_entrega_med.tipo_ingres=tipo_ingres
	w_entrega_med.dw_tip_ingres.setitem(1,1,tipo_ingres)
end if
if isvalid(w_devuelve_med) then
	w_devuelve_med.tipo_ingres=tipo_ingres
	w_devuelve_med.dw_tip_ingres.setitem(1,1,tipo_ingres)
end if
tipdoc=dw_activos.getitemstring(fila,"tipodoc")
docu=dw_activos.getitemstring(fila,"documento")
w_principal.busca_paciente()
long donde
if isvalid(w_admision) then
	donde=w_admision.dw_historial.find('nh='+string(dw_activos.getitemnumber(fila,'nh')),1,w_admision.dw_historial.rowcount())
	if donde>0 then w_admision.dw_historial.scrolltorow(donde)
end if
if isvalid(w_new_at_os) then
	w_new_at_os.dw_tip_ingres.event itemchanged (1,w_new_at_os.dw_tip_ingres.object.codtingre,tipo_ingres)
end if
if isvalid(w_entrega_med) then
	donde=w_entrega_med.dw_historial.find('nh='+string(dw_activos.getitemnumber(fila,'nh')),1,w_entrega_med.dw_historial.rowcount())
	if donde>0 then w_entrega_med.dw_historial.scrolltorow(donde)
end if
if isvalid(w_devuelve_med) then
	donde=w_devuelve_med.dw_historial.find('nh='+string(dw_activos.getitemnumber(fila,'nh')),1,w_devuelve_med.dw_historial.rowcount())
	if donde>0 then w_devuelve_med.dw_historial.scrolltorow(donde)
end if
close(parent)

end event

type st_2 from statictext within w_hospitaliz
integer x = 1189
integer y = 460
integer width = 1915
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione el tipo de ingreso y sobre la malla de doble click o presione aceptar para hacer activo al paciente"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_activos from datawindow within w_hospitaliz
integer x = 32
integer y = 644
integer width = 4786
integer height = 1236
integer taborder = 80
string title = "none"
string dataobject = "dw_activos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 and getrow()<>row then scrolltorow(row)
if dwo.type = "text" then 
	string cual,ojo,ss
	cual=dwo.name
	cual=mid(cual,1,len(cual) - 2)
	if anterior=cual then
		if orden="A" then
			orden="D"
		else
			orden="A"
		end if
	else
		orden="A"
	end if
	dw_activos.setsort(cual+" "+orden)
	dw_activos.sort()
	anterior=cual
end if
end event

event retrieveend;this.triggerevent(rowfocuschanged!)

end event

event doubleclicked;if row>0 and getrow()<>row then scrolltorow(row)
cb_aceptar.triggerevent(clicked!)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)

end event

event rowfocuschanged;st_3.text="Reg. "+string(dw_activos.getrow()) +" de "+string(dw_activos.rowcount())
end event

type gb_2 from groupbox within w_hospitaliz
integer y = 576
integer width = 4850
integer height = 1328
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pacientes encontrados:"
borderstyle borderstyle = styleraised!
end type

type gb_3 from groupbox within w_hospitaliz
integer x = 37
integer y = 220
integer width = 1093
integer height = 192
integer taborder = 100
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

type dw_pabellon from datawindow within w_hospitaliz
integer x = 59
integer y = 292
integer width = 1047
integer height = 100
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_combo_pabellon"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
getchild('codigoser',dw_pabe)
dw_pabe.setfilter("clugar='"+clugar+"'")
this.insertrow(1)


end event

event itemchanged;this.accepttext()
filtrar()
end event

type gb_1 from groupbox within w_hospitaliz
boolean visible = false
integer x = 1189
integer y = 52
integer width = 3598
integer height = 400
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterios:"
borderstyle borderstyle = styleraised!
end type

type gb_7 from groupbox within w_hospitaliz
integer x = 1161
integer width = 3680
integer height = 588
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Condiciones de Búsqueda:"
borderstyle borderstyle = styleraised!
end type

type dw_tip_ingres from datawindow within w_hospitaliz
integer x = 55
integer y = 116
integer width = 1056
integer height = 88
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
datawindowchild dw_lista
getchild('codtingre',dw_lista)
dw_lista.setfilter('codtingre <>"1"')
insertrow(1)


end event

event itemchanged;tipo_ingres=data
if tipo_ingres='4' then 
	cbx_res.visible=true
else
	cbx_res.visible=false
end if
if rb_1.checked then rb_1.event clicked()
if rb_2.checked then rb_2.event clicked()
if rb_3.checked then rb_3.event clicked()
if f_salida.checked then f_salida.event clicked()
if rb_4.checked then rb_4.event clicked()

choose case tipo_ingres
	case '2'
		dw_pabe.setfilter("clugar='"+clugar+"' and xa_urge='1' ")
	case '3'
		dw_pabe.setfilter("clugar='"+clugar+"' and xa_hosp='1' ")
	case '4'
		dw_pabe.setfilter("clugar='"+clugar+"' and xa_ambu='1' ")
	case '7'
		dw_pabe.setfilter("clugar='"+clugar+"' and xa_uci='1' ")		
end choose
dw_pabe.filter()
end event

