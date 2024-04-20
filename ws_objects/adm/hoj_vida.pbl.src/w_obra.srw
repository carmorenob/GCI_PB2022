$PBExportHeader$w_obra.srw
forward
global type w_obra from window
end type
type st_1 from statictext within w_obra
end type
type pb_31 from picturebutton within w_obra
end type
type pb_3 from picturebutton within w_obra
end type
type pb_2 from picturebutton within w_obra
end type
type pb_1 from picturebutton within w_obra
end type
type dw_7 from datawindow within w_obra
end type
type st_6 from statictext within w_obra
end type
type st_5 from statictext within w_obra
end type
type st_4 from statictext within w_obra
end type
type dw_6 from datawindow within w_obra
end type
type dw_5 from datawindow within w_obra
end type
type st_3 from statictext within w_obra
end type
type st_2 from statictext within w_obra
end type
type dw_4 from datawindow within w_obra
end type
type dw_1 from datawindow within w_obra
end type
type r_1 from rectangle within w_obra
end type
type r_2 from rectangle within w_obra
end type
type dw_2 from datawindow within w_obra
end type
type dw_3 from datawindow within w_obra
end type
end forward

global type w_obra from window
integer width = 3511
integer height = 2124
boolean titlebar = true
string title = "Registro de obra mensual"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "obra.ico"
st_1 st_1
pb_31 pb_31
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_7 dw_7
st_6 st_6
st_5 st_5
st_4 st_4
dw_6 dw_6
dw_5 dw_5
st_3 st_3
st_2 st_2
dw_4 dw_4
dw_1 dw_1
r_1 r_1
r_2 r_2
dw_2 dw_2
dw_3 dw_3
end type
global w_obra w_obra

on w_obra.create
this.st_1=create st_1
this.pb_31=create pb_31
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_7=create dw_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.dw_6=create dw_6
this.dw_5=create dw_5
this.st_3=create st_3
this.st_2=create st_2
this.dw_4=create dw_4
this.dw_1=create dw_1
this.r_1=create r_1
this.r_2=create r_2
this.dw_2=create dw_2
this.dw_3=create dw_3
this.Control[]={this.st_1,&
this.pb_31,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.dw_6,&
this.dw_5,&
this.st_3,&
this.st_2,&
this.dw_4,&
this.dw_1,&
this.r_1,&
this.r_2,&
this.dw_2,&
this.dw_3}
end on

on w_obra.destroy
destroy(this.st_1)
destroy(this.pb_31)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_4)
destroy(this.dw_1)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.dw_2)
destroy(this.dw_3)
end on

event open;dw_1.settransobject(SQLCA)
dw_1.insertrow(1)
dw_1.setitem(1,1,year(today()))
dw_1.setitem(1,2,month(today()))
dw_2.settransobject(SQLCA)
dw_2.insertrow(1)
dw_2.setfocus()
dw_5.settransobject(SQLCA)
dw_3.settransobject(SQLCA)
dw_4.settransobject(SQLCA)
dw_7.settransobject(SQLCA)


end event

type st_1 from statictext within w_obra
integer x = 960
integer y = 136
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type pb_31 from picturebutton within w_obra
event mosemove pbm_mousemove
integer x = 2693
integer y = 1824
integer width = 137
integer height = 124
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.gif"
string disabledname = "d_print.gif"
string powertiptext = "Imprimir"
end type

event clicked;//select documentos.camino into :camino from documentos
//where documentos.coddoc='3' and documentos.codtreporte='5';
//long archivo,tamanyo,donde
//tamanyo = FileLength(camino)
//archivo = fileopen(camino,StreamMode!)
//string carreta,todo
//todo = ""
//do while tamanyo > 0 
//	fileread(archivo,carreta)
//	todo = todo + carreta
//	tamanyo = tamanyo - 32765
//loop
//fileclose(archivo)
//carreta=""
//donde=pos(todo,"release ",1)
//carreta=right(todo, len(todo) - donde +1)
/////////////////*********  los cinco pasos para visualizar un reporte
//opensheet (w_reporte,w_principal,4,original!)
//w_reporte.title = "Reportes - " + camino
//w_reporte.dw_rep.create(carreta)
//w_reporte.inicialize()
//w_reporte.dw_rep.retrieve(dw_1.getitemnumber(1,1),dw_1.getitemnumber(1,2),dw_2.getitemstring(1,1))
//w_reporte.colocapagin()
////Close(w_contrato_vencido)
end event

type pb_3 from picturebutton within w_obra
event mosemove pbm_mousemove
integer x = 2555
integer y = 1824
integer width = 137
integer height = 124
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.gif"
string disabledname = "d_lupa.gif"
string powertiptext = "Buscar Empleado"
end type

event clicked;OpenSheet(w_obra_emple, w_principal, 1,original!)
end event

type pb_2 from picturebutton within w_obra
event mosemove pbm_mousemove
integer x = 2848
integer y = 104
integer width = 137
integer height = 124
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "import2.gif"
string disabledname = "d_import2.gif"
string powertiptext = "Sugerido"
end type

event clicked;long donde,hasta,meter,inicio,dias,i,semana,anos,meses
string lugares,parametros
date fechas
datetime fechaLee,festi
anos=dw_1.getitemnumber(1,'ano')
meses=dw_1.getitemnumber(1,'mes')
lugares=dw_2.getitemstring(1,'codlugar')
donde=1
dw_7.retrieve()
dw_5.retrieve(lugares)
hasta = dw_5.rowcount()
if messagebox('Alerta','Si ya tiene informacion real, ~resta acción elimina los datos de la obra real ~ry reemplaza por lo sugerido del mes.  ¿Esta seguro?',Question!,YesNo!,2) = 2 then Return

DELETE FROM OBRAREAL
WHERE ANO=:anos AND MES=:meses AND CodLugar=:lugares;
if sqlca.sqlcode=-1 then messagebox("Aviso",sqlca.sqlerrtext)
//se mira cual es el primer dia del mes 
inicio = daynumber(date(anos,meses,1))
fechas = date(anos,meses,1)
semana = 1
do while month(fechas) = meses
	semana++
	inicio=daynumber(fechas)
	SELECT Fecha into:festi FROM NOM_FESTIVOS
	WHERE Fecha=:fechas;
	if SQLCA.SQLCode = -1 then
		messageBox('Error',SQLCA.SQLErrText)
		Return
	end if
	for donde=1 to hasta
		if dw_5.getitemnumber(donde,'dia')=inicio then 	
			if festi=datetime(fechas) and dw_5.getitemstring(donde,'festivos')="0" then
				//festi=datetime(fechas)
			else
				parametros="tipodoc='" + dw_5.GetItemString(donde,'tipodoc') + "' and emple='"+dw_5.getitemstring(donde,'documento')+"' and cargo="+string(dw_5.getitemnumber(donde,'ncargo'))+" and l='"+dw_5.getitemstring(donde,'codlugar')+"' and u='"+dw_5.getitemstring(donde,'ufuncional')+"' and c='"+dw_5.getitemstring(donde,'ccosto')+"'"
				meter=dw_7.find(parametros,1,dw_7.rowcount())
				if meter=0 then 
					meter=dw_7.insertrow(0)
					dw_7.setitem(meter,'ano',anos)
					dw_7.setitem(meter,'mes',meses)
					dw_7.setitem(meter,'tipodoc',dw_5.getitemstring(donde,'tipodoc'))
					dw_7.setitem(meter,'emple',dw_5.getitemstring(donde,'documento'))
					dw_7.setitem(meter,'cargo',dw_5.getitemnumber(donde,'ncargo'))
					dw_7.setitem(meter,'l',dw_5.getitemstring(donde,'codlugar'))
					dw_7.setitem(meter,'u',dw_5.getitemstring(donde,'ufuncional'))
					dw_7.setitem(meter,'c',dw_5.getitemstring(donde,'ccosto'))
					dw_7.setitem(meter,'v',dw_5.getitemnumber(donde,'vinculado'))
				else
					dw_7.setitem(meter,'v',dw_5.getitemnumber(donde,'vinculado') + dw_7.getitemnumber(meter,'v'))
				end if
			end if
		end if	
	next	
	fechas=RelativeDate(fechas,1)
Loop

hasta=dw_7.rowcount()
for donde=1 to hasta
	meter=dw_4.insertrow(0)
	dw_4.setitem(meter,'ano',anos)
	dw_4.setitem(meter,'mes',meses)
	dw_4.setitem(meter,'tipodoc',dw_7.getitemstring(donde,'tipodoc'))
	dw_4.setitem(meter,'documento',dw_7.getitemstring(donde,'emple'))
	dw_4.setitem(meter,'ncargo',dw_7.getitemnumber(donde,'cargo'))
	dw_4.setitem(meter,'codlugar',dw_7.getitemstring(donde,'l'))
	dw_4.setitem(meter,'ufuncional',dw_7.getitemstring(donde,'u'))
	dw_4.setitem(meter,'ccosto',dw_7.getitemString(donde,'c'))
	dw_4.setitem(meter,'vinculado',dw_7.getitemnumber(donde,'v'))
next
		
if dw_4.update()<1 then
	rollback;
	dw_4.reset()
else
	commit;
end if
dw_4.reset()
dw_3.retrieve(dw_1.getitemnumber(1,'ano'), dw_1.getitemnumber(1,'mes'), dw_2.getitemstring(1,'codlugar'))
dw_3.TriggerEvent(rowfocuschanged!)

end event

type pb_1 from picturebutton within w_obra
event mosemove pbm_mousemove
integer x = 2418
integer y = 1824
integer width = 137
integer height = 124
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "novedades.gif"
string disabledname = "d_novedades.gif"
string powertiptext = "Novedades"
end type

event clicked;Open(w_cambio_obra)
end event

type dw_7 from datawindow within w_obra
boolean visible = false
integer x = 1710
integer y = 36
integer width = 411
integer height = 180
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_calcula_obra"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_obra
integer x = 2153
integer y = 1860
integer width = 197
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Planta"
boolean focusrectangle = false
end type

type st_5 from statictext within w_obra
integer x = 2153
integer y = 1800
integer width = 233
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contrato"
boolean focusrectangle = false
end type

type st_4 from statictext within w_obra
integer x = 718
integer y = 1824
integer width = 585
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total horas del mes"
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_obra
integer x = 1307
integer y = 1812
integer width = 631
integer height = 116
integer taborder = 50
string title = "none"
string dataobject = "dw_cambio_obra_planta_t"
boolean border = false
boolean livescroll = true
end type

type dw_5 from datawindow within w_obra
boolean visible = false
integer x = 2181
integer y = 24
integer width = 594
integer height = 204
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_total_sugerido"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_obra
integer x = 165
integer y = 1100
integer width = 1449
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registro de mano de obra por Centro de Costo"
boolean focusrectangle = false
end type

type st_2 from statictext within w_obra
integer x = 169
integer y = 224
integer width = 699
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empleados del lugar"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_obra
integer x = 160
integer y = 1172
integer width = 3186
integer height = 612
integer taborder = 40
string title = "none"
string dataobject = "dw_obra_real"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_obra
integer x = 137
integer y = 44
integer width = 805
integer height = 164
integer taborder = 10
string title = "none"
string dataobject = "dw_obra_mes"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
if dw_2.getitemstring(1,1)="" then
   dw_2.setfocus()
else
	dw_3.retrieve(dw_1.getitemnumber(1,1),dw_1.getitemnumber(1,2),dw_2.getitemstring(1,1))
	dw_4.reset()
end if

end event

event retrieveend;dw_2.insertrow(1)
end event

type r_1 from rectangle within w_obra
integer linethickness = 1
long fillcolor = 15793151
integer x = 1970
integer y = 1808
integer width = 165
integer height = 44
end type

type r_2 from rectangle within w_obra
integer linethickness = 1
long fillcolor = 12639424
integer x = 1970
integer y = 1868
integer width = 165
integer height = 44
end type

type dw_2 from datawindow within w_obra
integer x = 942
integer y = 56
integer width = 741
integer height = 92
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lugar_nom"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
dw_3.reset()
dw_4.reset()
dw_3.retrieve(dw_1.getitemnumber(1,'ano'),dw_1.getitemnumber(1,'mes'),dw_2.getitemstring(1,'codlugar'))

end event

type dw_3 from datawindow within w_obra
integer x = 169
integer y = 292
integer width = 2949
integer height = 788
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lista_emple_obra"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long fila
fila=this.getrow()
if fila<1 then return
//this.selectrow(fila,true)
string t,d
long a,m,c
a=this.getitemnumber(fila,'ano')
m=this.getitemnumber(fila,'mes')
t=this.getitemstring(fila,'tipodoc')
d=this.getitemstring(fila,'documento')
c=this.getitemnumber(fila,'ncargo')
dw_4.retrieve(a,m,t,d,c)
if dw_3.getitemstring(getrow(),'codrela') = "0" then
	dw_6.dataobject="dw_cambio_obra_planta_t"
else
	dw_6.dataobject="dw_cambio_obra_contrata_t"
end if
dw_6.settransobject(SQLCA)
dw_6.retrieve(a,m,t,d,c)

end event

event rowfocuschanging;this.selectrow(currentrow,false)
end event

event clicked;if row < 1 then Return
if dwo.name = 'compute_1' then
	if getRow() <> row then
		SetRow(row)
	end if
end if

end event

