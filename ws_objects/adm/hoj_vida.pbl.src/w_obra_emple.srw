$PBExportHeader$w_obra_emple.srw
forward
global type w_obra_emple from window
end type
type dw_3 from datawindow within w_obra_emple
end type
type pb_2 from picturebutton within w_obra_emple
end type
type pb_1 from picturebutton within w_obra_emple
end type
type dw_7 from datawindow within w_obra_emple
end type
type st_6 from statictext within w_obra_emple
end type
type st_5 from statictext within w_obra_emple
end type
type st_4 from statictext within w_obra_emple
end type
type dw_6 from datawindow within w_obra_emple
end type
type dw_5 from datawindow within w_obra_emple
end type
type st_3 from statictext within w_obra_emple
end type
type dw_4 from datawindow within w_obra_emple
end type
type dw_2 from datawindow within w_obra_emple
end type
type dw_1 from datawindow within w_obra_emple
end type
type r_1 from rectangle within w_obra_emple
end type
type r_2 from rectangle within w_obra_emple
end type
end forward

global type w_obra_emple from window
integer width = 3639
integer height = 1988
boolean titlebar = true
string title = "Registro de obra real"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "obra.ico"
dw_3 dw_3
pb_2 pb_2
pb_1 pb_1
dw_7 dw_7
st_6 st_6
st_5 st_5
st_4 st_4
dw_6 dw_6
dw_5 dw_5
st_3 st_3
dw_4 dw_4
dw_2 dw_2
dw_1 dw_1
r_1 r_1
r_2 r_2
end type
global w_obra_emple w_obra_emple

type variables
string emplea, tipodoc, documento
long cargo
end variables

on w_obra_emple.create
this.dw_3=create dw_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_7=create dw_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.dw_6=create dw_6
this.dw_5=create dw_5
this.st_3=create st_3
this.dw_4=create dw_4
this.dw_2=create dw_2
this.dw_1=create dw_1
this.r_1=create r_1
this.r_2=create r_2
this.Control[]={this.dw_3,&
this.pb_2,&
this.pb_1,&
this.dw_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.dw_6,&
this.dw_5,&
this.st_3,&
this.dw_4,&
this.dw_2,&
this.dw_1,&
this.r_1,&
this.r_2}
end on

on w_obra_emple.destroy
destroy(this.dw_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.st_3)
destroy(this.dw_4)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.r_1)
destroy(this.r_2)
end on

event open;dw_1.settransobject(SQLCA)
dw_1.insertrow(1)
dw_1.setitem(1,'ano',year(today()))
dw_1.setitem(1,'mes',month(today()))
dw_2.setTransObject(SQLCA)
dw_2.insertRow(1)
dw_2.setFocus()
dw_5.setTransObject(SQLCA)
dw_4.setTransObject(SQLCA)
dw_7.setTransObject(SQLCA)
dw_3.setTransObject(SQLCA)
dw_6.setTransObject(SQLCA)

end event

type dw_3 from datawindow within w_obra_emple
integer x = 37
integer y = 220
integer width = 2848
integer height = 580
integer taborder = 50
string title = "none"
string dataobject = "dw_cargo_actual_emple"
boolean border = false
boolean livescroll = true
end type

type pb_2 from picturebutton within w_obra_emple
event mosemove pbm_mousemove
integer x = 2912
integer y = 64
integer width = 137
integer height = 124
integer taborder = 70
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

event clicked;long donde,hasta,meter,accion,inicio,dias,i,semana,anos,meses
string lugares,parametros
date fechas
datetime fechalee,festi
anos=dw_1.getitemnumber(1,1)
meses=dw_1.getitemnumber(1,2)
lugares=dw_2.getitemstring(1,1)
donde=1
dw_5.retrieve(lugares)
hasta=dw_5.rowcount()
accion=messagebox('Alerta','Si ya tiene informacion real, esta acción elimina los datos de la obra real y reemplaza por lo sugerido del mes.  ¿Esta seguro?',Question!,YesNo!,2)
if accion=2 then return
DELETE OBRAREAL.ANO, OBRAREAL.MES, OBRAREAL.CodLugar
FROM OBRAREAL
WHERE OBRAREAL.ANO=:anos AND OBRAREAL.MES=:meses AND OBRAREAL.CodLugar=:lugares;
//se mira cual es el primer dia del mes 
inicio=daynumber(date("'"+string(anos)+"/"+string(meses)+"/01'"))
fechas=date(string(anos)+"/"+string(meses)+"/01")
semana=1
FOR dias=1 TO 31
	if month(fechas)=long(meses) then
		if semana=1 and dias<inicio then
			semana=semana
		else
			semana++
//			fechalee=fechas
			inicio=daynumber(fechas)
			SELECT Fecha into:festi
			FROM nom_festivos
			WHERE Fecha=:fechas;
//			messagebox("Error del sql",SQLCA.sqlerrtext)
			
				for donde=1 to hasta

					if dw_5.getitemnumber(donde,8)=inicio then 	
						if (festi)=datetime(fechas) and dw_5.getitemstring(donde,7)="0" then
							festi=datetime(fechas)
						else
							parametros="emple='"+dw_5.getitemstring(donde,1)+"' and cargo="+string(dw_5.getitemnumber(donde,2))+" and l='"+dw_5.getitemstring(donde,3)+"' and u='"+dw_5.getitemstring(donde,4)+"' and c='"+dw_5.getitemstring(donde,5)+"'"
							meter=dw_7.find(parametros,1,dw_7.rowcount())
							if meter=0 then 
								meter=dw_7.insertrow(0)
								dw_7.setitem(meter,1,anos)
								dw_7.setitem(meter,2,meses)
								dw_7.setitem(meter,3,dw_5.getitemstring(donde,1))
								dw_7.setitem(meter,4,dw_5.getitemnumber(donde,2))
								dw_7.setitem(meter,5,dw_5.getitemstring(donde,3))
								dw_7.setitem(meter,6,dw_5.getitemstring(donde,4))
								dw_7.setitem(meter,7,dw_5.getitemstring(donde,5))
								dw_7.setitem(meter,8,dw_5.getitemnumber(donde,6))
							else
								dw_7.setitem(meter,8,dw_5.getitemnumber(donde,6)+dw_7.getitemnumber(meter,8))
							end if
						end if
					end if	
	
				next
			
		end if
		fechas=RelativeDate(fechas,1)
		dias=day(date("'"+string(anos)+"/"+string(meses)+"/01'"))
		
	else
		dias=32
	end if
NEXT
hasta=dw_7.rowcount()
for donde=1 to hasta
	meter=dw_4.insertrow(0)
	dw_4.setitem(meter,1,anos)
	dw_4.setitem(meter,2,meses)
	dw_4.setitem(meter,3,dw_7.getitemstring(donde,5))
	dw_4.setitem(meter,4,dw_7.getitemstring(donde,3))
	dw_4.setitem(meter,5,dw_7.getitemnumber(donde,4))
	dw_4.setitem(meter,6,dw_7.getitemstring(donde,6))
	dw_4.setitem(meter,7,dw_7.getitemstring(donde,7))
	dw_4.setitem(meter,8,dw_7.getitemnumber(donde,8))
	dw_4.setitem(meter,9,dw_7.getitemnumber(donde,8))
next
		
if dw_4.update()<1 then
	rollback;
	dw_4.reset()
else
	commit;
end if
dw_4.reset()
dw_3.retrieve(dw_1.getitemnumber(1,1),dw_1.getitemnumber(1,2),dw_2.getitemstring(1,1))


end event

type pb_1 from picturebutton within w_obra_emple
event mosemove pbm_mousemove
integer x = 2939
integer y = 1692
integer width = 137
integer height = 124
integer taborder = 80
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

type dw_7 from datawindow within w_obra_emple
boolean visible = false
integer x = 3154
integer y = 420
integer width = 411
integer height = 180
integer taborder = 40
string title = "none"
string dataobject = "dw_calcula_obra"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_obra_emple
integer x = 2066
integer y = 1732
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

type st_5 from statictext within w_obra_emple
integer x = 2066
integer y = 1672
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

type st_4 from statictext within w_obra_emple
integer x = 631
integer y = 1696
integer width = 585
integer height = 64
integer textsize = -10
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

type dw_6 from datawindow within w_obra_emple
integer x = 1221
integer y = 1688
integer width = 631
integer height = 116
integer taborder = 90
string title = "none"
string dataobject = "dw_cambio_obra_planta_t"
boolean border = false
boolean livescroll = true
end type

type dw_5 from datawindow within w_obra_emple
boolean visible = false
integer x = 3063
integer y = 208
integer width = 521
integer height = 204
integer taborder = 10
string title = "none"
string dataobject = "dw_total_sugerido"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_obra_emple
integer x = 82
integer y = 804
integer width = 1431
integer height = 64
integer textsize = -10
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

type dw_4 from datawindow within w_obra_emple
integer x = 82
integer y = 876
integer width = 3442
integer height = 740
integer taborder = 60
string title = "none"
string dataobject = "dw_obra_real_emple"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type dw_2 from datawindow within w_obra_emple
integer x = 859
integer y = 60
integer width = 2002
integer height = 160
integer taborder = 30
string title = "none"
string dataobject = "dw_emple_regla_doble"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
string busca
if not isNull(dwo) then
	if String(dwo.Name) <> 'documento' then Return
end if
tipodoc = this.getitemstring(1,'tipodoc')
documento = this.getitemstring(1,'documento')
this.retrieve(tipodoc, documento)
IF this.rowcount()=0 THEN
	this.insertrow(1)
	messagebox ("Atención","Empleado no encontrado. Desea Crearlo?")
	this.setItem(1,'tipodoc',tipodoc)
	this.setItem(1,'documento',documento)
	Return
else
	if dw_3.retrieve(tipodoc, documento) > 0  then
		cargo = dw_3.getitemnumber(dw_3.getrow(),'emplecargo_ncargo')
		dw_4.retrieve(dw_1.getitemnumber(1,'ano'),dw_1.getitemnumber(1,'mes'),tipodoc,documento,cargo)
		dw_6.retrieve(dw_1.getitemnumber(1,'ano'),dw_1.getitemnumber(1,'mes'),tipodoc,documento,cargo)
	else
		messageBox('Error','El empleado no tiene un cargo asignado')
		Return
	end if
//	trae los datos tomandolos de dw1 y dw2, requiere de parametros el dw3
//	dw_4.retrieve(dw_1.getitemstring(1,1),dw_2.getitemnumber(1,2))
//	dw_5.retrieve(dw_1.getitemstring(1,1),dw_2.getitemnumber(1,2))

END IF

end event

type dw_1 from datawindow within w_obra_emple
integer x = 73
integer y = 52
integer width = 800
integer height = 160
integer taborder = 20
string title = "none"
string dataobject = "dw_obra_mes"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
if dw_2.getitemstring(1,'tipodoc')="" then
   dw_2.setfocus()
else
	dw_4.retrieve(dw_1.getitemnumber(1,'ano'),dw_1.getitemnumber(1,'mes'),tipodoc,documento,cargo)
end if

end event

event retrieveend;dw_2.insertrow(1)
end event

type r_1 from rectangle within w_obra_emple
integer linethickness = 1
long fillcolor = 15793151
integer x = 1883
integer y = 1680
integer width = 165
integer height = 44
end type

type r_2 from rectangle within w_obra_emple
integer linethickness = 1
long fillcolor = 12639424
integer x = 1883
integer y = 1740
integer width = 165
integer height = 44
end type

