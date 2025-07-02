$PBExportHeader$w_prog_hora.srw
forward
global type w_prog_hora from window
end type
type dp_1 from datepicker within w_prog_hora
end type
type pb_2 from pb_report within w_prog_hora
end type
type dw_esp from datawindow within w_prog_hora
end type
type dw_new from datawindow within w_prog_hora
end type
type pb_5 from picturebutton within w_prog_hora
end type
type cb_guarda from picturebutton within w_prog_hora
end type
type pb_4 from picturebutton within w_prog_hora
end type
type pb_3 from picturebutton within w_prog_hora
end type
type cb_1 from picturebutton within w_prog_hora
end type
type pb_1 from picturebutton within w_prog_hora
end type
type dw_2 from datawindow within w_prog_hora
end type
type dw_sercios from datawindow within w_prog_hora
end type
type dw_cruce from datawindow within w_prog_hora
end type
type dw_agenda from datawindow within w_prog_hora
end type
type dw_escog_consul from datawindow within w_prog_hora
end type
type dw_hora_resu from datawindow within w_prog_hora
end type
type dw_1 from datawindow within w_prog_hora
end type
type gb_1 from groupbox within w_prog_hora
end type
type dw_profe from datawindow within w_prog_hora
end type
end forward

global type w_prog_hora from window
integer width = 4567
integer height = 2136
boolean titlebar = true
string title = "Programación Semanal"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "r_citap.ico"
string pointer = "Arrow!"
dp_1 dp_1
pb_2 pb_2
dw_esp dw_esp
dw_new dw_new
pb_5 pb_5
cb_guarda cb_guarda
pb_4 pb_4
pb_3 pb_3
cb_1 cb_1
pb_1 pb_1
dw_2 dw_2
dw_sercios dw_sercios
dw_cruce dw_cruce
dw_agenda dw_agenda
dw_escog_consul dw_escog_consul
dw_hora_resu dw_hora_resu
dw_1 dw_1
gb_1 gb_1
dw_profe dw_profe
end type
global w_prog_hora w_prog_hora

type variables
long filaini,colini,pres
datawindowchild consult, espe , gcita,dclugar
datetime desde,hasta
string profe1,consul,codgrupo,ls_clugar
end variables
forward prototypes
public subroutine marcafila (long fila)
public subroutine marcacol (long columna)
public subroutine trae_agenda ()
public subroutine pinta ()
public subroutine sugerido ()
end prototypes

public subroutine marcafila (long fila);long i
for i=1 to 7 
	if (dw_1.getitemstring(fila,"est"+string(i))="" or isnull(dw_1.getitemstring(fila,"est"+string(i))))and dw_1.getitemnumber(fila,'dura')=dw_2.getitemnumber(dw_2.getrow(),'dura') then	
		if dw_1.getitemstring(fila,"selfil")="0" then
			dw_1.setitem(fila,"sel"+string(i),"1")
		else
			dw_1.setitem(fila,"sel"+string(i),"0")
		end if
	end if
next
if dw_1.getitemstring(fila,"selfil")="0" then
	dw_1.setitem(fila,"selfil","1")
else
	dw_1.setitem(fila,"selfil","0")
end if	
end subroutine

public subroutine marcacol (long columna);long i
for i=1 to dw_1.rowcount()
	if (dw_1.getitemstring(i,"est"+string(columna))="" or isnull(dw_1.getitemstring(i,"est"+string(columna))))and dw_1.getitemnumber(i,'dura')=dw_2.getitemnumber(dw_2.getrow(),'dura')  then
		if dw_1.getitemstring(1,"selcol"+string(columna))="0" then
			dw_1.setitem(i,"sel"+string(columna),"1")
		else
			dw_1.setitem(i,"sel"+string(columna),"0")
		end if
	end if
next
if dw_1.getitemstring(1,"selcol"+string(columna))="0" then
	dw_1.setitem(1,"selcol"+string(columna),"1")
else
	dw_1.setitem(1,"selcol"+string(columna),"0")
end if
end subroutine

public subroutine trae_agenda ();date ld_fecha
ld_fecha=dp_1.datevalue 
desde=datetime(relativedate(date(ld_fecha),1 - daynumber(date(ld_fecha))))
hasta=datetime(relativedate(date(ld_fecha),7 - daynumber(date(ld_fecha))))
dw_agenda.retrieve(dw_escog_consul.getitemstring(1,'cconsultorio'),desde,hasta)
dw_sercios.retrieve(dw_escog_consul.getitemstring(1,'cconsultorio'),desde,hasta)
end subroutine

public subroutine pinta ();if dw_escog_consul.getitemnumber(1,'duracion')=0 then
	messagebox("Atención","Elija un consultorio")
	return
end if
time hora
long cual,j
date esta
dw_1.modify("b_dom.text='Dom "+string(day(date(desde)))+"-"+mes(month(date(desde)),"mmm")+"'")
esta=relativedate(date(desde),1)
dw_1.modify("b_lun.text='Lun "+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("b_mar.text='Mar "+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("b_mie.text='Mie "+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("b_jue.text='Jue "+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("b_vie.text='Vie "+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("b_sab.text='Sab "+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
dw_1.reset()
dw_new.reset()
for j=1 to dw_2.rowcount()
	hora=dw_2.getitemtime(j,'hora1')	
	DO WHILE hora < dw_2.getitemtime(j,'hora2')	
		cual=dw_new.insertrow(0)
		dw_new.setitem(cual,"hora",hora)
		dw_new.setitem(cual,"dura",dw_2.getitemnumber(j,'dura'))
		hora=relativetime(hora,dw_2.getitemnumber(j,'dura')*60)
	LOOP
	if hora<> dw_2.getitemtime(j,'hora2') then dw_2.setitem(j,'hora2',hora)
next
end subroutine

public subroutine sugerido ();if dw_hora_resu.rowcount()>0 then
	//trae_agenda()
	if dw_agenda.rowcount()=0 then dw_2.reset()
	if dw_2.rowcount()=0 then pb_1.triggerevent(clicked!)
	boolean pintar
	time horaini,horafin,va
	horaini=relativetime(time("00:00"),dw_hora_resu.getitemnumber(1,"menor"))
	horafin=relativetime(time("00:00"),dw_hora_resu.getitemnumber(1,"mayor"))
	pintar=false
	if horaini < dw_2.getitemtime(1,'hora1') then 
		dw_2.setitem(1,'hora1',horaini)
		pintar=true
	end if
	if horafin > dw_2.getitemtime(dw_2.rowcount(),'hora2') then 
		dw_2.setitem(dw_2.rowcount(),'hora2',horafin)
		pintar=true
	end if
	if pintar then 
		pinta()
		dw_agenda.triggerevent(retrieveend!)
	end if
	long i,donde,dia,encuentra
	boolean cruce
	date cualdia
	string consulto,busca
	date ld_fecha
	ld_fecha=dp_1.datevalue 
	for i = 1 to dw_hora_resu.rowcount()
		horaini=time(dw_hora_resu.getitemdatetime(i,"horaini"))
		horafin=time(dw_hora_resu.getitemdatetime(i,"horafin"))
		do while horaini < horafin
			donde=dw_1.find("hora=time('"+string(horaini)+"')",1,dw_1.rowcount())
			if donde<>0 then
				cualdia=relativedate(date(ld_fecha),dw_hora_resu.getitemnumber(i,"dia") - daynumber(date(ld_fecha)))
				busca="date(fecha)=date('"+string(cualdia,"yyyy/mm/dd")+"') and time(hora) between time('"+string(horaini) +"') and time('"+string(relativetime(horaini,dw_2.getitemnumber(dw_2.getrow(),"dura")*60))+"')"
				encuentra=dw_cruce.find(busca,1,dw_cruce.rowcount())
				if encuentra=0 then //ojo validar que no se cruce
					if dw_1.getitemstring(donde,"dia"+string(dw_hora_resu.getitemnumber(i,"dia")))="" or isnull(dw_1.getitemstring(donde,"dia"+string(dw_hora_resu.getitemnumber(i,"dia")))) then
						dw_1.setitem(donde,"dia"+string(dw_hora_resu.getitemnumber(i,"dia")),wordcap(profe1+'- '+gcita.getitemstring(gcita.getrow(),'descripcion')))
						dw_1.setitem(donde,"prof"+string(dw_hora_resu.getitemnumber(i,"dia")),profe1)
						dw_1.setitem(donde,"grup"+string(dw_hora_resu.getitemnumber(i,"dia")),dw_escog_consul.getitemstring(1,'codgc'))
						dw_1.setitem(donde,"esp"+string(dw_hora_resu.getitemnumber(i,"dia")),dw_2.getitemstring(dw_2.getrow(),'cesp'))
					end if
				else
					cruce=true
					consulto=dw_cruce.getitemstring(encuentra,"consult")
				end if
			end if
			horaini=relativetime(horaini,dw_2.getitemnumber(dw_2.getrow(),"dura")*60)
		loop	
	next
	if cruce then messagebox("Atención","Este profesional tuvo cruce de horario con el consultorio: "+consulto)
else
	//pinta()
end if
end subroutine

event open;profe1=""
consul=""
//uo_1.init_cal(today())
//uo_1.set_date_format ( "dd/mmm/yyyy" )
//uo_1.event e_drop()

//dw_dist.settransobject(SQLCA)
w_principal.ArrangeSheets ( layer!)

end event

on w_prog_hora.create
this.dp_1=create dp_1
this.pb_2=create pb_2
this.dw_esp=create dw_esp
this.dw_new=create dw_new
this.pb_5=create pb_5
this.cb_guarda=create cb_guarda
this.pb_4=create pb_4
this.pb_3=create pb_3
this.cb_1=create cb_1
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_sercios=create dw_sercios
this.dw_cruce=create dw_cruce
this.dw_agenda=create dw_agenda
this.dw_escog_consul=create dw_escog_consul
this.dw_hora_resu=create dw_hora_resu
this.dw_1=create dw_1
this.gb_1=create gb_1
this.dw_profe=create dw_profe
this.Control[]={this.dp_1,&
this.pb_2,&
this.dw_esp,&
this.dw_new,&
this.pb_5,&
this.cb_guarda,&
this.pb_4,&
this.pb_3,&
this.cb_1,&
this.pb_1,&
this.dw_2,&
this.dw_sercios,&
this.dw_cruce,&
this.dw_agenda,&
this.dw_escog_consul,&
this.dw_hora_resu,&
this.dw_1,&
this.gb_1,&
this.dw_profe}
end on

on w_prog_hora.destroy
destroy(this.dp_1)
destroy(this.pb_2)
destroy(this.dw_esp)
destroy(this.dw_new)
destroy(this.pb_5)
destroy(this.cb_guarda)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.cb_1)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_sercios)
destroy(this.dw_cruce)
destroy(this.dw_agenda)
destroy(this.dw_escog_consul)
destroy(this.dw_hora_resu)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.dw_profe)
end on

type dp_1 from datepicker within w_prog_hora
integer width = 832
integer height = 100
integer taborder = 140
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-07-02"), Time("09:13:16.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;datetime inicia
datetime fec
fec =dtm
inicia=datetime(relativedate(date(fec),1 - daynumber(date(fec))))
if inicia<>desde then
	dw_2.reset()
	trae_agenda()
	if not isnull(dw_escog_consul.getitemstring(1,'cconsultorio')) then pb_1.triggerevent(clicked!)
end if
end event

type pb_2 from pb_report within w_prog_hora
integer x = 18
integer y = 1648
integer taborder = 80
string text = "           &i"
string powertiptext = "Imprimir Reporte de Programación [Alt+I]"
string cod_rep = "AP"
string nombre_rep = "Agenda de Profesionales"
string tipo_rep = "interno!"
boolean dialogo = true
boolean v_preliminar = true
end type

event clicked;call super::clicked;any par[2]
par[1]=desde
par[2]=hasta
imprimir(par,'','0')
end event

type dw_esp from datawindow within w_prog_hora
integer x = 9
integer y = 1372
integer width = 1335
integer height = 88
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_espe"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;settext(getitemstring(1,1))
return 1
end event

type dw_new from datawindow within w_prog_hora
boolean visible = false
integer x = 919
integer y = 1728
integer width = 270
integer height = 104
boolean enabled = false
string title = "none"
string dataobject = "dw_horario_citas2"
boolean border = false
boolean livescroll = true
end type

type pb_5 from picturebutton within w_prog_hora
integer x = 421
integer y = 1808
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &r"
boolean originalsize = true
string picturename = "refrescar.GIF"
string disabledname = "d_refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Refrescar [Alt+R]"
end type

event clicked;trae_agenda()

end event

type cb_guarda from picturebutton within w_prog_hora
integer x = 229
integer y = 1808
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &g"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;cb_1.triggerevent(clicked!)
long fila,col,donde
datetime fecha,hora
string busca
date ld_fecha

for col=1 to 7
	ld_fecha=dp_1.datevalue 
	fecha=datetime(relativedate(date(ld_fecha),col - daynumber(date(ld_fecha))))
	for fila=1 to dw_1.rowcount()
		if dw_1.getitemstring(fila,col)<>"" then
			hora=datetime(date("1/1/1900"),dw_1.getitemtime(fila,"hora"))
			busca="prof='"+dw_1.getitemstring(fila,'prof'+string(col))+"' and fecha=datetime('"+string(fecha,"dd/mm/yyyy hh:mm:ss")+"') and hora=datetime('"+string(hora,"dd/mm/yyyy hh:mm:ss")+"')"
			donde= dw_agenda.find(busca,1,dw_agenda.rowcount())
			if donde=0 then
				donde=dw_agenda.insertrow(0)
				dw_agenda.setitem(donde,"fecha",datetime(date(fecha),time("00:00:00")))
				dw_agenda.setitem(donde,"hora",hora)
				dw_agenda.setitem(donde,"duracion",dw_1.getitemnumber(fila,"dura"))
				dw_agenda.setitem(donde,"usuario",usuario)
				dw_agenda.setitem(donde,"fecha_crea",datetime(today(),now()))
			end if
			if dw_agenda.getitemstring(donde,'consult')<>dw_escog_consul.getitemstring(1,'cconsultorio') or isnull(dw_agenda.getitemstring(donde,'consult')) then dw_agenda.setitem(donde,"consult",dw_escog_consul.getitemstring(1,'cconsultorio'))
			if dw_agenda.getitemstring(donde,'cesp')<>dw_1.getitemstring(fila,"esp"+string(col)) or isnull(dw_agenda.getitemstring(donde,'cesp')) then dw_agenda.setitem(donde,"cesp",dw_1.getitemstring(fila,"esp"+string(col)))
			if dw_agenda.getitemstring(donde,'prof')<>dw_1.getitemstring(fila,"prof"+string(col)) or isnull(dw_agenda.getitemstring(donde,'prof')) then dw_agenda.setitem(donde,"prof",dw_1.getitemstring(fila,'prof'+string(col)))
			if dw_agenda.getitemstring(donde,'codgc')<>dw_1.getitemstring(fila,"grup"+string(col)) or isnull(dw_agenda.getitemstring(donde,'codgc')) then dw_agenda.setitem(donde,"codgc",dw_1.getitemstring(fila,'grup'+string(col)))
		end if
	next
next
if dw_sercios.update()=-1 then
	rollback;
	trae_agenda()
	return
end if
if dw_agenda.update()<1 then
	rollback;
else
	commit;
end if
trae_agenda()
end event

type pb_4 from picturebutton within w_prog_hora
integer x = 14
integer y = 1808
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &s"
boolean originalsize = true
string picturename = "llevars.gif"
string disabledname = "d_llevars.gif"
alignment htextalign = left!
string powertiptext = "Sugerido [Alt+S]"
end type

event clicked;sugerido()
end event

type pb_3 from picturebutton within w_prog_hora
integer x = 421
integer y = 1648
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &d"
boolean originalsize = true
string picturename = "desocupar.GIF"
string disabledname = "d_desocupar.GIF"
alignment htextalign = left!
string powertiptext = "Desocupar [Alt+D]"
end type

event clicked;long fil,col,donde
string busca
datetime fecha,hora
date ld_fecha
	
for col=1 to 7
	ld_fecha=dp_1.datevalue 
	fecha=datetime(relativedate(date(ld_fecha),col - daynumber(date(ld_fecha))))
	for fil=1 to dw_1.rowcount()
		hora=datetime(date("1/1/1900"),dw_1.getitemtime(fil,"hora"))
		if dw_1.getitemstring(fil,"sel"+string(col))="1" and dw_1.getitemstring(fil,col)<>"" then
			busca="prof='"+dw_1.getitemstring(fil,'prof'+string(col))+"' and fecha=datetime('"+string(fecha)+"') and hora=datetime('"+string(hora)+"')"
			donde=dw_agenda.find(busca,1,dw_agenda.rowcount())
			if donde<>0 then 
				dw_agenda.deleterow(donde)
				dw_sercios.setfilter(busca)
				dw_sercios.filter()
				do while dw_sercios.rowcount()>0
					dw_sercios.deleterow(1)
				loop
			end if
			dw_1.setitem(fil,col,"")
			dw_1.setitem(fil,"prof"+string(col),"")
			dw_1.setitem(fil,"grup"+string(col),"")
			dw_1.setitem(fil,"esp"+string(col),"")
			dw_1.setitem(fil,"sel"+string(col),"0")
		else
			if dw_1.getitemstring(fil,"sel"+string(col))="1" then dw_1.setitem(fil,"sel"+string(col),"0")
		end if
	next
next
if dw_agenda.update()=-1 then
	rollback;
else
	commit;
end if
end event

type cb_1 from picturebutton within w_prog_hora
integer x = 229
integer y = 1648
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &o"
boolean originalsize = true
string picturename = "ocupar.GIF"
string disabledname = "d_ocupar.GIF"
alignment htextalign = left!
string powertiptext = "Ocupar [Alt+O]"
end type

event clicked;if profe1="" or consul="" then
	Messagebox("Atención","Elija Consultorio y/o Profesional con su especialidad")
	return
end if
boolean cruce
long fil,col,encuentra
date cualdia
time hora1,hora2
string busca,consulto
date ld_fecha
for fil=1 to dw_1.rowcount()
	hora1=dw_1.getitemtime(fil,"hora")
	hora2=relativetime(hora1,dw_escog_consul.getitemnumber(1,"duracion")*60)
	for col=1 to 7
		ld_fecha=dp_1.datevalue 
		cualdia=relativedate(date(ld_fecha),col - daynumber(date(ld_fecha)))
		if dw_1.getitemstring(fil,"sel"+string(col))="1" then
			if ((dw_1.getitemstring(fil,col)="") or isnull(dw_1.getitemstring(fil,col))) and (dw_1.getitemnumber(fil,'dura')=dw_2.getitemnumber(dw_2.getrow(),'dura')) then
				busca="date(fecha)=date('"+string(cualdia,"yyyy/mm/dd")+"') and (time('"+string(hora1)+"') between time(hora) and relativetime(time(hora),(duracion -1)*60) or time('"+string(hora2)+"') between time(hora) and relativetime(time(hora),(duracion -1)*60))"
				encuentra=dw_cruce.find(busca,1,dw_cruce.rowcount())
				if encuentra=0 then //ojo validar que no se cruce
					dw_1.setitem(fil,"dia"+string(col),wordcap(dw_profe.getitemstring(1,1)+'- '+gcita.getitemstring(gcita.find("codgc='"+dw_2.getitemstring(dw_2.getrow(),'grupo')+"'",1,gcita.rowcount()),'descripcion')))
					dw_1.setitem(fil,'prof'+string(col),dw_profe.getitemstring(1,1))
					dw_1.setitem(fil,'grup'+string(col),dw_2.getitemstring(dw_2.getrow(),'grupo'))
					dw_1.setitem(fil,'dura',dw_2.getitemnumber(dw_2.getrow(),'dura'))
					dw_1.setitem(fil,"esp"+string(col),dw_2.getitemstring(dw_2.getrow(),'cesp'))
				else
					cruce=true
					consulto=dw_cruce.getitemstring(encuentra,"consult")
				end if
			end if
			dw_1.setitem(fil,"sel"+string(col),"0")
		end if
	next
next
if cruce then messagebox("Atención","Este profesional tuvo cruce de horario con el consultorio: "+consulto)
end event

type pb_1 from picturebutton within w_prog_hora
integer x = 1157
integer y = 540
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Nuevo intervalo"
end type

event clicked;if dw_2.rowcount()=0 then goto insertar
long donde
donde=dw_2.find('dura='+string(dw_escog_consul.getitemnumber(1,'duracion')),1,dw_2.rowcount())
if donde=0 then goto insertar
if donde<dw_2.rowcount() then
	messagebox("Atención",'Solo puede definir dos intervalos de ' +string(dw_escog_consul.getitemnumber(1,'duracion'))+' minutos unicamente si son seguidos')
	return
end if
if dw_escog_consul.getitemstring(1,'codgc')<>dw_2.getitemstring(donde,'grupo') then goto insertar
return
insertar:
donde=dw_2.insertrow(0)
dw_2.setitem(donde,'dura',dw_escog_consul.getitemnumber(1,'duracion'))
dw_2.setitem(donde,'grupo',dw_escog_consul.getitemstring(1,'codgc'))
dw_2.setitem(donde,'cesp',gcita.getitemstring(gcita.getrow(),'codesp'))
if donde>1 then
	dw_2.setitem(donde,'hora1',dw_2.getitemtime(donde -1,'hora2'))
	dw_2.setitem(donde,'hora2',relativetime(dw_2.getitemtime(donde -1,'hora2'),dw_escog_consul.getitemnumber(1,'duracion')*60))
end if
trae_agenda()
end event

type dw_2 from datawindow within w_prog_hora
event p_itemchanged ( )
event p_setitem ( long fila,  string colu,  time hora )
integer x = 14
integer y = 804
integer width = 873
integer height = 396
integer taborder = 40
string title = "none"
string dataobject = "dw_pedazos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event p_itemchanged();this.accepttext()
dw_agenda.triggerevent(retrieveend!)
end event

event p_setitem(long fila, string colu, time hora);this.setitem(fila,colu,hora)
end event

event constructor;this.settransobject(sqlca)

end event

event itemchanged;time esta
choose case this.getcolumn()
	case 1//hora 1
		if time(data)> this.getitemtime(row,'hora2') then
			this.settext(string(this.getitemtime(row,'hora1')))
			this.setitem(row,'hora1',this.getitemtime(row,'hora1'))
			return 1
		end if
		if row>1 then
			if time(data)<this.getitemtime(row -1,'hora2') then
				this.settext(string(this.getitemtime(row,'hora1')))
				this.setitem(row,'hora1',this.getitemtime(row,'hora1'))
				return 1
			end if
		end if
		if dw_agenda.rowcount()>0 then
			esta=relativetime(time(data),mod(secondsafter(time(data),this.getitemtime(row,'hora1')),this.getitemnumber(row,'dura')*60))
			if esta<>time(data) then
				this.post event p_setitem(row,'hora1',relativetime(time(data),mod(secondsafter(time(data),this.getitemtime(row,'hora1')),this.getitemnumber(row,'dura')*60)))
			end if
		end if
	case 2//hora 2
		if time(data)<this.getitemtime(row,'hora1') then
			this.settext(string(this.getitemtime(row,'hora2')))
			this.setitem(row,'hora2',this.getitemtime(row,'hora2'))
			return 1
		end if
		if row<this.rowcount() then
			if time(data)>this.getitemtime(row+1,'hora1') then
				this.settext(string(this.getitemtime(row,'hora2')))
				this.setitem(row,'hora2',this.getitemtime(row,'hora2'))
				return 1
			end if
		end if
		esta=relativetime(time(data),mod(secondsafter(time(data),this.getitemtime(row,'hora1')),this.getitemnumber(row,'dura')*60))
		if esta<>time(data) then
			this.post event p_setitem(row,'hora2',relativetime(time(data),mod(secondsafter(time(data),this.getitemtime(row,'hora1')),this.getitemnumber(row,'dura')*60)))
		end if
end choose
this.post event p_itemchanged()
end event

event rowfocuschanged;string grup,prof_actu
if currentrow<1 then return
grup=this.getitemstring(currentrow,'grupo')
if isnull(grup) then return
prof_actu=dw_profe.getitemstring(1,1)
dw_esp.setitem(1,1,getitemstring(getrow(),'cesp'))
//espe es hija DE dw_profe y es para filtrarlo por codesp
if isnull(getitemstring(getrow(),'cesp')) then
	espe.setfilter("isnull(cesp)")
else
	espe.setfilter("cesp='"+getitemstring(getrow(),'cesp')+"'")
end if
espe.filter()
if espe.rowcount()=0 then Messagebox("Atención","No hay ningún profesional con especialidad acorde con este Grupo de Cita")
if not isnull(prof_actu) and prof_actu<>'' then
	if espe.find('codprof="'+prof_actu+'"',1,espe.rowcount())=0 then
		profe1=''
		dw_hora_resu.reset()
		dw_profe.setitem(1,1,"")
	end if
end if
long fil,col
for col=1 to 7
	for fil=1 to dw_1.rowcount()
		dw_1.setitem(fil,"sel"+string(col),"0")
	next
next
//dw_2.event p_itemchanged()

end event

type dw_sercios from datawindow within w_prog_hora
boolean visible = false
integer x = 1783
integer y = 1880
integer width = 421
integer height = 124
boolean enabled = false
string title = "none"
string dataobject = "dw_sercios_citas"
boolean resizable = true
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)

end event

type dw_cruce from datawindow within w_prog_hora
boolean visible = false
integer x = 3122
integer y = 1856
integer width = 398
integer height = 172
boolean enabled = false
boolean titlebar = true
string title = "dw_cruce"
string dataobject = "dw_cruces_citas"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(SQLCA)
end event

type dw_agenda from datawindow within w_prog_hora
boolean visible = false
integer x = 2313
integer y = 1900
integer width = 347
integer height = 88
boolean enabled = false
boolean titlebar = true
string title = "dw_agenda"
string dataobject = "dw_agenda_citas"
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event retrieveend;if this.rowcount()>0 then
	time horaini,horafin,va,esta
	long dura,i,donde,dia,interv,resi
	horaini=relativetime(time("00:00"),this.getitemnumber(1,"mini"))
	horafin=relativetime(time("00:00"),this.getitemnumber(1,"maxi"))
	dura=this.getitemnumber(1,"duracion")
	interv=dw_2.find("(hora1<=time('"+string(horaini)+"') and dura="+string(dura)+") or (hora2>=time('"+string(horaini)+"') and dura="+string(dura)+")",1,dw_2.rowcount())
	if interv=0 then interv=dw_2.insertrow(0)
	dw_2.setitem(interv,'dura',dura)
	dw_2.setitem(interv,'grupo',this.getitemstring(1,"codgc"))
	dw_2.setitem(interv,'cesp',getitemstring(1,"cesp"))
	resi=mod(secondsafter(horaini,dw_2.getitemtime(interv,'hora1')),dw_2.getitemnumber(interv,'dura')*60)
	if horaini<dw_2.getitemtime(interv,'hora1') or resi<>0 then //horaini<>dw_2.getitemtime(interv,'hora1')then 
		dw_2.setitem(interv,'hora1',horaini)
	end if
	resi=mod(secondsafter(horafin,dw_2.getitemtime(interv,'hora2')),dw_2.getitemnumber(interv,'dura')*60)
	if dw_2.getitemtime(interv,'hora2')<horafin or resi<>0 then //dw_2.getitemtime(interv,'hora2')<>horafin then 
		dw_2.setitem(interv,'hora2',horafin)
	end if
	for i=2 to this.rowcount()
		if dura<>this.getitemnumber(i,'duracion') then
			dura=this.getitemnumber(i,"duracion")
			interv=dw_2.find("(hora1<=time('"+string(time(this.getitemdatetime(i,"hora")))+"') and dura="+string(dura)+") or (hora2>=time('"+string(time(this.getitemdatetime(i,"hora")))+"') and dura="+string(dura)+")",1,dw_2.rowcount())
			if interv=0 then interv=dw_2.insertrow(0)
			if dw_2.getitemtime(interv,'hora1')<time(this.getitemdatetime(i,'hora')) then 
				if interv>1 then 
					if dw_2.getitemtime(interv,'hora1')<dw_2.getitemtime(interv -1,'hora2') then
						dw_2.setitem(interv,'hora1',time(this.getitemdatetime(i,'hora')))
					end if
				end if
			else
				dw_2.setitem(interv,'hora1',time(this.getitemdatetime(i,'hora')))
			end if
			dw_2.setitem(interv,'grupo',this.getitemstring(i,"codgc"))
			dw_2.setitem(interv,'cesp',getitemstring(i,"cesp"))
			dw_2.setitem(interv,'dura',dura)
			if dw_2.getitemtime(interv,'hora2')<relativetime(time("00:00"),this.getitemnumber(i,"maxi")) then dw_2.setitem(interv,'hora2',relativetime(time("00:00"),this.getitemnumber(i,"maxi")))
		else
			dura=this.getitemnumber(i,"duracion")
		end if
	next
	if dw_2.getitemtime(interv,'hora2')<relativetime(time("00:00"),this.getitemnumber(rowcount,"maxi"))then 
		dw_2.setitem(interv,'hora2',relativetime(time("00:00"),this.getitemnumber(rowcount,"maxi")))
	end if
	pinta()
	for i = 1 to this.rowcount()
		horaini=time(this.getitemdatetime(i,"hora"))
		donde=dw_new.find("hora=time('"+string(horaini)+"')",1,dw_new.rowcount())
		if donde<>0 then
			dia=daynumber(date(this.getitemdatetime(i,"fecha")))
			dw_new.setitem(donde,"dia"+string(dia),wordcap(this.getitemstring(i,"desprof")+'- '+this.getitemstring(i,"grupocita")))
			dw_new.setitem(donde,"esp"+string(dia),this.getitemstring(i,"cesp"))
			dw_new.setitem(donde,"est"+string(dia),this.getitemstring(i,"estcita"))
			dw_new.setitem(donde,"prof"+string(dia),this.getitemstring(i,"prof"))
			dw_new.setitem(donde,"grup"+string(dia),this.getitemstring(i,"codgc"))
		end if
	next
	dw_2.event rowfocuschanged(1)
else
	pinta()
end if
dw_1.reset()
if dw_new.rowcount()>0 then
	dw_new.sort()
	dw_new.RowsCopy ( 1, dw_new.rowcount(), primary!, 	dw_1, 1, primary! )
end if
end event

event constructor;this.settransobject(SQLCA)
end event

type dw_escog_consul from datawindow within w_prog_hora
integer y = 112
integer width = 1330
integer height = 596
integer taborder = 20
string title = "none"
string dataobject = "dw_escog_consult"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
choose case this.getcolumn()
	case 1
		consul=""
		codgrupo=data
		this.setitem(1,'cconsultorio',"")
		this.setitem(1,'codlugar',"")
		this.setitem(1,'duracion',0)
	case 2
		ls_clugar=data
		consult.retrieve(codgrupo,ls_clugar)
		if consult.rowcount()=0 then messagebox("Atención","No hay definidos consultorios para este grupo de cita")		
		dw_1.reset()
		espe.setfilter('cesp="'+gcita.getitemstring(gcita.getrow(),'codesp')+'"')
		espe.filter()
	case 3
		consul=data
		
		espe.retrieve(ls_clugar)
		espe.setfilter("cesp='aa'")
		espe.filter()

		this.setitem(1,'duracion',consult.getitemnumber(consult.getrow(),"duracion"))
		dw_2.reset()
		if dw_profe.getitemstring(1,1)<>"" then
			dw_cruce.retrieve(profe1,desde,hasta,consul)
		end if
		trae_agenda()
		if dw_2.rowcount()=0 then
			dw_2.insertrow(1)
			dw_2.setitem(1,'grupo',this.getitemstring(1,1))
			dw_2.setitem(1,'cesp',gcita.getitemstring(gcita.getrow(),'codesp'))
			dw_2.setitem(1,'dura',consult.getitemnumber(consult.getrow(),"duracion"))
		end if
		dw_2.event rowfocuschanged(1)
end choose

end event

event constructor;this.getchild("cconsultorio",consult)
this.getchild("codgc",gcita)
this.getchild("codlugar",dclugar)
gcita.settransobject(SQLCA)
consult.settransobject(SQLCA)
dclugar.settransobject(SQLCA)
this.insertrow(1)
this.setitem(1,'cconsultorio',"")
this.setitem(1,'duracion',0)
gcita.retrieve()
dclugar.retrieve()
end event

type dw_hora_resu from datawindow within w_prog_hora
boolean visible = false
integer x = 869
integer y = 1888
integer width = 882
integer height = 84
boolean enabled = false
boolean titlebar = true
string title = "dw_hora_suge=dw_hora_resu"
string dataobject = "dw_hora_prof_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;if dw_agenda.rowcount()=0 and rowcount>0 then
	if dw_2.rowcount()=0 then pb_1.triggerevent(clicked!)
	time horaini,horafin
	boolean pinta=false
	horaini=relativetime(time("00:00"),dw_hora_resu.getitemnumber(1,"menor"))
	horafin=relativetime(time("00:00"),dw_hora_resu.getitemnumber(1,"mayor"))
	if horaini < dw_2.getitemtime(1,'hora1') then 
		dw_2.setitem(1,'hora1',horaini)
		pinta=true
	end if
	if horafin > dw_2.getitemtime(dw_2.rowcount(),'hora2') then 
		dw_2.setitem(dw_2.rowcount(),'hora2',horafin)
		pinta=true
	end if
	if pinta then 
		pinta()
		if dw_new.rowcount()>0 then
			dw_new.sort()
			dw_new.RowsCopy ( 1, dw_new.rowcount(), primary!, 	dw_1, 1, primary! )
		end if
	end if
end if
end event

event constructor;this.settransobject(SQLCA)
end event

type dw_1 from datawindow within w_prog_hora
event clickup pbm_dwnlbuttonup
event mousemove pbm_dwnmousemove
integer x = 1426
integer width = 3040
integer height = 1820
integer taborder = 70
string title = "none"
string dataobject = "dw_horario_citas"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clickup;pres=0
if row<1 then return
string cual
long columna,i,j
if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	columna=long(cual)
	if columna=colini and row=filaini then
		if this.getitemstring(row,"est"+cual)="" or  isnull(this.getitemstring(row,"est"+cual)) then
			if this.getitemstring(row,"sel"+cual)="1" then
				this.setitem(row,"sel"+cual,"0")
			else
				if this.getitemnumber(row,'dura')=dw_2.getitemnumber(dw_2.getrow(),'dura') then this.setitem(row,"sel"+cual,"1")
			end if
		end if
	end if
end if

end event

event mousemove;if row<1 then return
if pres=0 then return
string cual
long columna,i,j
if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	columna=long(cual)
	if columna<>colini or row<>filaini then
		int paso1,paso2
		i=filaini
		j=colini
		if (row - filaini)= 0 then 
			paso1=1
		else
			paso1 = (row - filaini) / abs(filaini - row)
		end if
		if (columna - colini) = 0 then 
			paso2=1
		else
			paso2 = (columna - colini) / abs(colini - columna)
		end if
		do 
			do 
				if this.getitemnumber(i,'dura')=dw_2.getitemnumber(dw_2.getrow(),'dura')and (this.getitemstring(i,"est"+string(j))="" or isnull(this.getitemstring(i,"est"+string(j)))) then this.setitem(i,"sel"+string(j),"1")
				j= j+ paso2
			loop until j = columna + paso2 
			i = i + paso1
			j=colini
		loop until i = row +paso1 
	end if
end if

end event

event buttonclicked;if this.rowcount()<1 then return
if dwo.name<>"b_hora" then
	choose case dwo.name
		case "b_dom"
			marcacol(1)
		case "b_lun"
			marcacol(2)
		case "b_mar"
			marcacol(3)
		case "b_mie"
			marcacol(4)
		case "b_jue"
			marcacol(5)
		case "b_vie"
			marcacol(6)
		case "b_sab"
			marcacol(7)
	end choose	
else
	marcafila(row)
end if


end event

event clicked;if string(dwo.type)="column" and string(dwo.name)<> "hora" then
	colini = long(right(string(dwo.name),1))
	filaini = row
	pres=1
end if

end event

type gb_1 from groupbox within w_prog_hora
integer y = 744
integer width = 1335
integer height = 472
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Intervalos:"
borderstyle borderstyle = styleraised!
end type

type dw_profe from datawindow within w_prog_hora
integer y = 1232
integer width = 1362
integer height = 408
integer taborder = 60
string title = "none"
string dataobject = "dw_combo_prof_esp"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
choose case this.getcolumn()
	case 1
		profe1=data
		dw_cruce.retrieve(profe1,desde,hasta,consul)
		if dw_2.rowcount()=0 then return
		dw_hora_resu.retrieve(profe1,dw_2.getitemstring(dw_2.getrow(),'cesp'))
end choose
trae_agenda()

end event

event constructor;this.getchild("codprof",espe)
espe.settransobject(sqlca)
//espe.retrieve()
//espe.setfilter("cesp='aa'")
//espe.filter()
this.insertrow(1)

end event

