$PBExportHeader$w_autoriza.srw
forward
global type w_autoriza from window
end type
type dp_2 from datepicker within w_autoriza
end type
type dp_1 from datepicker within w_autoriza
end type
type st_5 from statictext within w_autoriza
end type
type st_3 from statictext within w_autoriza
end type
type t1 from tab within w_autoriza
end type
type p1 from userobject within t1
end type
type st_9 from statictext within p1
end type
type st_8 from statictext within p1
end type
type st_4 from statictext within p1
end type
type dw_hist from datawindow within p1
end type
type p1 from userobject within t1
st_9 st_9
st_8 st_8
st_4 st_4
dw_hist dw_hist
end type
type p2 from userobject within t1
end type
type st_1 from statictext within p2
end type
type pb_4 from picturebutton within p2
end type
type pb_3 from picturebutton within p2
end type
type st_2 from statictext within p2
end type
type dw_cpo from datawindow within p2
end type
type dw_au from datawindow within p2
end type
type p2 from userobject within t1
st_1 st_1
pb_4 pb_4
pb_3 pb_3
st_2 st_2
dw_cpo dw_cpo
dw_au dw_au
end type
type t3 from userobject within t1
end type
type st_7 from statictext within t3
end type
type st_6 from statictext within t3
end type
type dw_1 from datawindow within t3
end type
type t3 from userobject within t1
st_7 st_7
st_6 st_6
dw_1 dw_1
end type
type t1 from tab within w_autoriza
p1 p1
p2 p2
t3 t3
end type
end forward

global type w_autoriza from window
integer width = 4864
integer height = 2452
boolean titlebar = true
string title = "Solicitud de Autorizaciones"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dp_2 dp_2
dp_1 dp_1
st_5 st_5
st_3 st_3
t1 t1
end type
global w_autoriza w_autoriza

type variables
boolean ib_cambio
string is_pdf,l_repositorio
datetime FechaI,FechaF

end variables

forward prototypes
public subroutine filtre ()
end prototypes

public subroutine filtre ();date fec
fec =dp_1.datevalue 
fechaI=datetime(date(fec),time('00:00'))
fec =dp_2.datevalue 
fechaF=datetime(date(fec),time('23:59'))
t1.p1.dw_hist.Retrieve(fechaI,fechaf)
t1.t3.dw_1.Retrieve(fechaI,fechaf)
t1.p1.st_9.text=string(t1.p1.dw_hist.rowcount())+' Regs.'
t1.t3.st_7.text=string(t1.t3.dw_1.rowcount())+' Regs.'
end subroutine

on w_autoriza.create
this.dp_2=create dp_2
this.dp_1=create dp_1
this.st_5=create st_5
this.st_3=create st_3
this.t1=create t1
this.Control[]={this.dp_2,&
this.dp_1,&
this.st_5,&
this.st_3,&
this.t1}
end on

on w_autoriza.destroy
destroy(this.dp_2)
destroy(this.dp_1)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.t1)
end on

event open;string ls_tipo
RegistryGet( "HKEY_CLASSES_ROOT\.pdf", "", RegString!, ls_tipo)
if isNull(ls_tipo) or ls_tipo = '' then return 0

RegistryGet( "HKEY_CLASSES_ROOT\"+ls_tipo+"\shell\open\command", "", RegString!, is_pdf)
SELECT cadena into :l_repositorio
FROM parametros_gen
WHERE (((codigo_para)=3));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 3')
	return
end if

if isnull(l_repositorio) then
	messagebox('Atencíon','No hay Repositorio para Almacenamiento Autorizaciones')
	return
end if

end event

event activate;filtre()
end event

type dp_2 from datepicker within w_autoriza
integer x = 1271
integer y = 24
integer width = 507
integer height = 100
integer taborder = 100
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2023-02-10"), Time("16:46:52.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtre()
end event

type dp_1 from datepicker within w_autoriza
integer x = 334
integer y = 28
integer width = 535
integer height = 100
integer taborder = 110
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2023-02-10"), Time("16:46:52.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtre()

end event

type st_5 from statictext within w_autoriza
integer x = 1006
integer y = 20
integer width = 242
integer height = 104
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FECHA FINAL"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_3 from statictext within w_autoriza
integer x = 101
integer y = 8
integer width = 215
integer height = 104
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FECHA INICIAL"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type t1 from tab within w_autoriza
integer x = 69
integer y = 140
integer width = 4718
integer height = 2180
integer taborder = 20
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
p1 p1
p2 p2
t3 t3
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.t3=create t3
this.Control[]={this.p1,&
this.p2,&
this.t3}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
destroy(this.t3)
end on

event selectionchanged;if newindex = 2 then
	if ib_cambio then		
	end if
	if t1.p1.dw_hist.RowCount() > 0 then
//		id_nh = t1.p1.dw_pac.getItemNumber(t1.p1.dw_pac.getrow(),'nh')
//		is_lugar = t1.p1.dw_pac.getitemString(t1.p1.dw_pac.getrow(),'clugar')
//		is_tingre = t1.p1.dw_pac.getItemString(t1.p1.dw_pac.getrow(),'codtingre')
//		id_contador = t1.p1.dw_pac.getItemNumber(t1.p1.dw_pac.getrow(),'contador')
//		is_clugar_his = t1.p1.dw_pac.getitemString(t1.p1.dw_pac.getrow(),'clugar_his')
//		is_cemp = t1.p1.dw_pac.getitemString(t1.p1.dw_pac.getrow(),'cemp')
//		t1.p2.st_1.Text = 'Ingreso '+string(t1.p1.dw_pac.getItemNumber(t1.p1.dw_pac.getrow(),'nh')) + '   '+dw_1.getText() +'~r~n'+t1.p1.dw_pac.getitemString(t1.p1.dw_pac.getrow(),'nombre')
//		t1.p2.dw_cpo.reset()
//		t1.p2.dw_au.reset()
//		t1.p2.dw_au.retrieve(t1.p1.dw_hist.getItemNumber(t1.p1.dw_hist.getrow(),'id_solicitud'))
	end if
end if

end event

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 4681
integer height = 2052
long backcolor = 67108864
string text = "Solicitudes Pendientes"
long tabtextcolor = 33554432
string picturename = "calculo.ico"
long picturemaskcolor = 536870912
st_9 st_9
st_8 st_8
st_4 st_4
dw_hist dw_hist
end type

on p1.create
this.st_9=create st_9
this.st_8=create st_8
this.st_4=create st_4
this.dw_hist=create dw_hist
this.Control[]={this.st_9,&
this.st_8,&
this.st_4,&
this.dw_hist}
end on

on p1.destroy
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_4)
destroy(this.dw_hist)
end on

type st_9 from statictext within p1
integer x = 4219
integer y = 1900
integer width = 430
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean focusrectangle = false
end type

type st_8 from statictext within p1
integer x = 3735
integer y = 1900
integer width = 485
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de Registros:"
boolean focusrectangle = false
end type

type st_4 from statictext within p1
integer x = 3922
integer y = 16
integer width = 704
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble click  para ver detalles"
boolean focusrectangle = false
end type

type dw_hist from datawindow within p1
integer x = 23
integer y = 88
integer width = 4622
integer height = 1796
integer taborder = 80
string dataobject = "dw_solicitudes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event doubleclicked;if row = 0 then return 0
t1.p2.dw_au.retrieve(getItemNumber(getrow(),'id_solicitud'),getItemstring(getrow(),'hpclugar'))
t1.p2.dw_cpo.retrieve(getItemNumber(getrow(),'id_solicitud'),getItemstring(getrow(),'hpclugar'))
t1.SelectedTab = 2

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)

end event

event retrieveend;st_9.text=string(dw_hist.rowcount())+' Regs.'
end event

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 4681
integer height = 2052
long backcolor = 67108864
string text = "Autorización"
long tabtextcolor = 33554432
string picturename = "Contrato.ico"
long picturemaskcolor = 536870912
st_1 st_1
pb_4 pb_4
pb_3 pb_3
st_2 st_2
dw_cpo dw_cpo
dw_au dw_au
end type

on p2.create
this.st_1=create st_1
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_2=create st_2
this.dw_cpo=create dw_cpo
this.dw_au=create dw_au
this.Control[]={this.st_1,&
this.pb_4,&
this.pb_3,&
this.st_2,&
this.dw_cpo,&
this.dw_au}
end on

on p2.destroy
destroy(this.st_1)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.dw_cpo)
destroy(this.dw_au)
end on

type st_1 from statictext within p2
integer x = 2464
integer y = 424
integer width = 1280
integer height = 232
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_4 from picturebutton within p2
integer x = 2587
integer y = 168
integer width = 142
integer height = 124
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if dw_au.rowCount() = 0 then return 0

if isNull(dw_au.getItemString(1,'tipo')) then
	MessageBox('Atención','No ha seleccionado el tipo de solicitud')
	return -1
end if
long ld_solicitud,nh
string cl,ti,auto,peor
if dw_au.getitemstring(1,'estado')<>'Z' then
	if dw_au.getItemString(1,'tipo') = 'U' then
		if dw_au.getItemNumber(1,'valores') <>0 then
			messageBox('Atención','Debe suministrar todos los datos de la autorización')
			Return -1
		end if
		dw_au.setItem(1,'estado','Z')
		ti=dw_au.getItemstring(1,'codtingre')
		cl=dw_au.getItemstring(1,'clugar')
		nh=dw_au.getItemNumber(1,'nh') 
		auto=dw_au.getItemstring(1,'autorizacion')
		peor=dw_au.getItemstring(1,'nombre_autoriza')
		update hospadmi set perso_autoriza = :peor, autoriza =:auto
		where (((nh)=:nh) and ((clugar)=:cl) and ((codtingre)=:ti));
		IF SQLCA.SQLCode = -1 THEN
			rollback;
			return -1
		else
			commit;
		end if
	else
		dw_au.setItem(1,'estado','Z')
	end if
	if dw_au.Update() = -1 then
		rollback;
		return -1
	end if
	if dw_cpo.Update() = -1 then
		rollback;
		return -1
	end if
	double  l_i,l_item
	for l_i=1 to  dw_cpo.rowcount()
		auto=dw_cpo.getitemstring(l_i,'autorizacion')
		nh=dw_cpo.getitemnumber(l_i,'contador')
		cl=dw_cpo.getitemstring(l_i,'clugar_os')
		ld_solicitud=dw_cpo.getitemnumber(l_i,'nsolicitud')
		l_item=dw_cpo.getitemnumber(l_i,'item_os')
		update serviciosingreso set nautoriza = :auto
		where (((conta_orden)=:nh) and ((clug_orden)=:cl) and ((norden_serv)=:ld_solicitud) and ((item_orden)=:l_item));
		IF SQLCA.SQLCode = -1 THEN
			rollback;
			return -1
		else
			commit;
		end if
		nh=dw_cpo.getitemnumber(l_i,'numero_qx')
		cl=dw_cpo.getitemstring(l_i,'clugar_qx')
		ld_solicitud=dw_cpo.getitemnumber(l_i,'consecutivo_qx')
		update serviciosingreso set nautoriza =:auto
		from (hosp_autoriza_cpo inner join qxcpacto on (hosp_autoriza_cpo.consecutivo_qx = qxcpacto.consecutivo) and (hosp_autoriza_cpo.clugar_qx = qxcpacto.clugar) and (hosp_autoriza_cpo.numero_qx = qxcpacto.numero)) inner join serviciosingreso on (qxcpacto.nservicio = serviciosingreso.nservicio) and (qxcpacto.clugar_ser = serviciosingreso.clugar) and (qxcpacto.contador = serviciosingreso.contador) 
		where (((hosp_autoriza_cpo.numero_qx)=:nh) and ((hosp_autoriza_cpo.clugar_qx)=:cl) and ((hosp_autoriza_cpo.consecutivo_qx)=:ld_solicitud));
		IF SQLCA.SQLCode = -1 THEN
			rollback;
			return -1
		else
			commit;
		end if
	next
//	commit;
	dw_au.resetUpdate()
	ib_cambio = FALSE
	filtre()
 end if
return 0

end event

type pb_3 from picturebutton within p2
integer x = 2587
integer y = 40
integer width = 142
integer height = 124
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular Autorización"
end type

event clicked;if dw_au.rowCount() = 0 then return 0
if dw_au.getItemNumber(1,'nuevo') = 1 then
	if MessageBox('Atención','El registro es nuevo. Desea Eliminarlo?',question!,yesno!) = 2 then return 0
	dw_cpo.Reset()
	dw_au.Reset()
else
	if MessageBox('Atención','Desea Inactivar la solicitud?',question!,yesno!) = 2 then return 0
	dw_au.SetItem(1,'estado','I')
	if dw_au.Update() = -1 then
		rollback;
		return -1
	end if
	commit;
end if
return 0

end event

type st_2 from statictext within p2
integer x = 55
integer y = 1252
integer width = 960
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos y Medicamentos"
boolean focusrectangle = false
end type

type dw_cpo from datawindow within p2
integer x = 73
integer y = 1336
integer width = 3625
integer height = 700
integer taborder = 50
string title = "none"
string dataobject = "dw_autoriza_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event buttonclicked;if row<>getrow() then setrow(row)
if dwo.name='b_1' then
	string camino,carreta,ls_path_pac,l_rutao,nomarch
	long file,li_filenum
	carreta=string(dw_au.getitemnumber(1,'id_solicitud'))+'_'+dw_au.getitemstring(1,'clugar')
	ls_path_pac=l_repositorio+'\'+carreta+'\'
	if GetFileOpenName("Abrir Reporte", camino, nomarch, "PDF","Reportes (*.PDF),*.PDF",nomarch) = 1 then
		If not FileExists(ls_path_pac) THEN 
		li_filenum=CreateDirectory ( ls_path_pac ) 
			If li_filenum<>1 then 
				MessageBox(" Atencion","No pudo crear directorio en Repositorio") 
				return
			End if 
		End If
		l_rutao=camino
		//mover el archivo de la carpeta
		 If FileCopy (l_rutao,ls_path_pac+nomarch,TRUE)<0 then	
			 messagebox('Alerta','Error copiando archivo  '+l_rutao)
			 return
		else
	//		//  FileDelete(l_rutao)
		end if
		setitem(getrow(),'url_imagen',ls_path_pac+nomarch)
	end if
	if dw_cpo.Update() = -1 then
		rollback;
		return -1
	end if
end if
if dwo.name='b_2' then
	string file_pdf
	nomarch=getitemstring(getrow(),'url_imagen')
	if isnull(nomarch) then return -1
	file_pdf=gs_pdf+' '+nomarch
	run(file_pdf,maximized!)
end if


end event

type dw_au from datawindow within p2
integer x = 59
integer y = 16
integer width = 2226
integer height = 1184
integer taborder = 40
string title = "none"
string dataobject = "dw_autoriza"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event retrieveend;int jaer
jaer=dw_au.rowcount() 
if dw_au.rowcount() = 0 then return //dw_cpo.retrieve(getItemNumber(1,'id_solicitud'))

datetime fechas
fechas=dw_au.getitemdatetime(1,'fec_autoriza')
if isnull(fechas) then 
	dw_au.SetItem(1,'fec_autoriza',datetime(today(),now()))
end if

end event

event buttonclicked;if row<>getrow() then setrow(row)
string file_pdf,nomarch

choose case dwo.name
	case 'b_1'
		nomarch=getitemstring(getrow(),'envio1')
		if isnull(nomarch) then return -1
		file_pdf=gs_pdf+' '+nomarch
		run(file_pdf,maximized!)
	case 'b_2'
		nomarch=getitemstring(getrow(),'envio2')
		if isnull(nomarch) then return -1
		file_pdf=gs_pdf+' '+nomarch
		run(file_pdf,maximized!)
	case 'b_3'
		nomarch=getitemstring(getrow(),'envio3')
		if isnull(nomarch) then return -1
		file_pdf=gs_pdf+' '+nomarch
		run(file_pdf,maximized!)
	case 'b_4'
		nomarch=getitemstring(getrow(),'enviot')
		if isnull(nomarch) then return -1
		file_pdf=gs_pdf+' '+nomarch
		run(file_pdf,maximized!)
	case 'b_5' 
		string camino,carreta,ls_path_pac,l_rutao
		long file,li_filenum
		carreta=string(dw_au.getitemnumber(1,'id_solicitud'))+'_'+dw_au.getitemstring(1,'clugar')
		ls_path_pac=l_repositorio+'\'+carreta+'\'
		if GetFileOpenName("Abrir Reporte", camino, nomarch, "PDF","Reportes (*.PDF),*.PDF",nomarch) = 1 then
			If not FileExists(ls_path_pac) THEN 
			li_filenum=CreateDirectory ( ls_path_pac ) 
				If li_filenum<>1 then 
					MessageBox(" Atencion","No pudo crear directorio en Repositorio") 
					return
				End if 
			End If
			l_rutao=camino
			//mover el archivo de la carpeta
			 If FileCopy (l_rutao,ls_path_pac+nomarch,TRUE)<0 then	
				 messagebox('Alerta','Error copiando archivo  '+l_rutao)
				 return
			else
		//		//  FileDelete(l_rutao)
			end if
			setitem(getrow(),'url_imagen',ls_path_pac+nomarch)
		end if
		if dw_au.Update() = -1 then
			rollback;
			return -1
		end if
	case 'b_6' 
		nomarch=getitemstring(getrow(),'url_imagen')
		if isnull(nomarch) then return -1
		file_pdf=gs_pdf+' '+nomarch
		run(file_pdf,maximized!)
end choose

end event

event itemchanged;int ret, i
if GetColumnName()='nombre_autoriza' then
	ret = messageBox('Atención','La autorización es para todos los servicios listados?',question!,yesnocancel!)
	if ret = 1 then
		for i = 1 to dw_cpo.rowCount()
			dw_cpo.setItem(i,'autorizacion', dw_au.getItemString(1,'autorizacion'))
			dw_cpo.setItem(i,'fec_autoriza', dw_au.getItemDateTime(1,'fec_autoriza'))
			dw_cpo.setItem(i,'nombre_autoriza', dw_au.getItemString(1,'nombre_autoriza'))
		next
	end if
end if
end event

type t3 from userobject within t1
integer x = 18
integer y = 112
integer width = 4681
integer height = 2052
long backcolor = 67108864
string text = "Historial"
long tabtextcolor = 33554432
string picturename = "abrir.ico"
long picturemaskcolor = 536870912
st_7 st_7
st_6 st_6
dw_1 dw_1
end type

on t3.create
this.st_7=create st_7
this.st_6=create st_6
this.dw_1=create dw_1
this.Control[]={this.st_7,&
this.st_6,&
this.dw_1}
end on

on t3.destroy
destroy(this.st_7)
destroy(this.st_6)
destroy(this.dw_1)
end on

type st_7 from statictext within t3
integer x = 4114
integer y = 1888
integer width = 562
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean focusrectangle = false
end type

type st_6 from statictext within t3
integer x = 3611
integer y = 1888
integer width = 485
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de Registros:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within t3
integer x = 37
integer y = 36
integer width = 4613
integer height = 1824
integer taborder = 110
string dataobject = "dw_hist_solicitudes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event doubleclicked;if row = 0 then return 0
t1.p2.dw_au.reset()
t1.p2.dw_au.retrieve(dw_1.getItemNumber(getrow(),'id_solicitud'),clugar)
t1.p2.dw_cpo.retrieve(dw_1.getItemNumber(getrow(),'id_solicitud'),clugar)
t1.SelectedTab = 2


end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)

end event

