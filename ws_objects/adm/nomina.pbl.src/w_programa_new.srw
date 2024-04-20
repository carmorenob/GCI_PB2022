$PBExportHeader$w_programa_new.srw
forward
global type w_programa_new from window
end type
type pb_5 from picturebutton within w_programa_new
end type
type st_10 from statictext within w_programa_new
end type
type pb_4 from picturebutton within w_programa_new
end type
type dw_3 from datawindow within w_programa_new
end type
type dw_tipoincap from datawindow within w_programa_new
end type
type dw_aus from datawindow within w_programa_new
end type
type st_6 from statictext within w_programa_new
end type
type tab_1 from tab within w_programa_new
end type
type tabpage_1 from userobject within tab_1
end type
type pb_3 from picturebutton within tabpage_1
end type
type pb_6 from pb_report within tabpage_1
end type
type pb_ciclo from picturebutton within tabpage_1
end type
type hpb_1 from hprogressbar within tabpage_1
end type
type pb_guar from picturebutton within tabpage_1
end type
type pb_2 from picturebutton within tabpage_1
end type
type pb_1 from picturebutton within tabpage_1
end type
type dw_hora_resu from datawindow within tabpage_1
end type
type st_9 from statictext within tabpage_1
end type
type st_8 from statictext within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type st_7 from statictext within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type dw_4 from datawindow within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type ddlb_2 from dropdownlistbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_3 pb_3
pb_6 pb_6
pb_ciclo pb_ciclo
hpb_1 hpb_1
pb_guar pb_guar
pb_2 pb_2
pb_1 pb_1
dw_hora_resu dw_hora_resu
st_9 st_9
st_8 st_8
st_5 st_5
st_7 st_7
dw_1 dw_1
dw_4 dw_4
st_4 st_4
ddlb_2 ddlb_2
end type
type tab_1 from tab within w_programa_new
tabpage_1 tabpage_1
end type
type st_3 from statictext within w_programa_new
end type
type st_2 from statictext within w_programa_new
end type
type ddlb_1 from dropdownlistbox within w_programa_new
end type
type em_1 from editmask within w_programa_new
end type
type dw_cargo from datawindow within w_programa_new
end type
type st_1 from statictext within w_programa_new
end type
type dw_2 from datawindow within w_programa_new
end type
type dw_lugar from datawindow within w_programa_new
end type
type gb_1 from groupbox within w_programa_new
end type
type gb_2 from groupbox within w_programa_new
end type
end forward

global type w_programa_new from window
integer width = 6217
integer height = 2452
boolean titlebar = true
string title = "Programacion Empleados"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_turnos.ico"
pb_5 pb_5
st_10 st_10
pb_4 pb_4
dw_3 dw_3
dw_tipoincap dw_tipoincap
dw_aus dw_aus
st_6 st_6
tab_1 tab_1
st_3 st_3
st_2 st_2
ddlb_1 ddlb_1
em_1 em_1
dw_cargo dw_cargo
st_1 st_1
dw_2 dw_2
dw_lugar dw_lugar
gb_1 gb_1
gb_2 gb_2
end type
global w_programa_new w_programa_new

type variables
string cl, uf, cc,is_selected,i_cemp, tipo_ts
int mes
datawindowchild dw_ufun,dw_ccosto ,dw_car,dw_turno,dw_cc1
double l_colo,hbase
datetime desde,hasta

end variables

forward prototypes
public subroutine filtro ()
public subroutine f_tipo_ausen (string td, string docus, integer fila, string tipo, string abr)
public function integer f_ver_horas ()
public subroutine f_ausentismo ()
public subroutine f_festivos ()
public function integer f_marca_turno (long filas, string columna, string tipodoc, string documento, integer ncargo, string turno, string sigla, string desturno, string lugar, string uf1, string cc1)
end prototypes

public subroutine filtro ();string filtro
setnull(filtro)
if not isnull(cl) and cl<>''  then filtro="codlugar='"+ dw_lugar.GetItemString(dw_lugar.getrow(),'codlugar')+"'"
if not isnull(uf) and uf<>'' then
	if isnull(filtro) then 
		filtro="ufuncional='"+ dw_2.GetItemString(dw_2.getrow(),'coduf')+"'" 
	else 
		filtro+=" and ufuncional='"+ dw_2.GetItemString(dw_2.getrow(),'coduf')+"'"  
	end if
end if
if not isnull(cc) and cc<>'' then filtro+=" and ccosto='"+ dw_2.GetItemString(dw_2.getrow(),'codcc')+"'"
if isnull(filtro) then filtro=''
dw_car.setfilter(filtro)
dw_car.filter()
if not isnull(dw_cargo.getitemstring(dw_cargo.getrow(),'cargo')) then  filtro+=" and cargo ='"+dw_cargo.getitemstring(dw_cargo.getrow(),'cargo')+"'"
tab_1.tabpage_1.dw_1.setfilter(filtro)
tab_1.tabpage_1.dw_1.filter()
tab_1.tabpage_1.dw_1.triggerevent(rowfocuschanged!)
end subroutine

public subroutine f_tipo_ausen (string td, string docus, integer fila, string tipo, string abr);long  i,periodo,inc_t
st_interfec  iret,interv,ivac,iper
date l_x

interv.x = datetime(date(integer(em_1.text),mes,1))
if mes=12 then
	interv.y =datetime(relativedate(date(integer(em_1.text)+1,1,1),-1))
else
	interv.y =datetime(relativedate(date(integer(em_1.text),mes+1,1),-1))
end if
dw_aus.Retrieve(td,docus,tipo,desde,hasta)
for i = 1 to dw_aus.RowCount()
	inc_t = 0
	ivac.x = datetime(dw_aus.GetItemDate(i,'fechaini'))
	ivac.y = datetime(dw_aus.GetItemDate(i,'fechafin'))
	iret = interseccion(interv,ivac)
	if (not isNull(iret.x)) and (not isNull(iret.y)) then
		if iret = iper then
			inc_t = periodo
		else
			if day(date(iret.y)) = 31 then
				inc_t = DaysAfter(date(iret.x),date(iret.y))
			else
				if month(date(iret.y)) = 2 and iret.y = iper.y then
					inc_t = DaysAfter(date(iret.x),date(iret.y)) + 1 + (30 - day(date(iper.y)))
				else
					inc_t = DaysAfter(date(iret.x),date(iret.y)) + 1
				end if
			end if
		end if
	end if
	if inc_t >0 then 
		l_x=date(iret.x)
		do while l_x <=date(iret.y)
			 tab_1.tabpage_1.dw_1.setitem(fila,'dia'+string(day(l_x)),abr)
			 l_x=relativedate(l_x,1)
		loop
	end if
next
 tab_1.tabpage_1.dw_1.accepttext()
end subroutine

public function integer f_ver_horas ();long hnorm, hextra, hcomp
if tab_1.tabpage_1.dw_hora_resu.rowCount() = 0 then return 0
hnorm = tab_1.tabpage_1.dw_hora_resu.GetItemNumber(1,'t_normal')
hextra = tab_1.tabpage_1.dw_hora_resu.GetItemNumber(1,'t_extra')
hcomp = tab_1.tabpage_1.dw_hora_resu.GetItemNumber(1,'t_compensa')
if hnorm +hcomp < hbase and hextra > 0 then
	MessageBox('Atención','El número de horas normales está por debajo de las horas base '+string(hbase)+'. No debería tener horas extras')
	Return -1
end if
if hnorm + hcomp > hbase then
	MessageBox('Atención','Excede el número de horas normales en '+string(hnorm + hcomp - hbase)+'. Debe definir algunas como extras')
	Return -1
end if

Return 0

end function

public subroutine f_ausentismo ();long dias,i,li, fila, inc_t,l_j,inc,ano,mese,vac
st_interfec ivac, iret, iper,interv
string incap,retro,tipodoc,documento
date l_x
DataWindowChild dwc_ce,dwc_ceb

dw_tipoincap.GetChild('cod_concep', dwc_ce)
dw_tipoincap.GetChild('cod_concep_base', dwc_ceb)
dwc_ce.SetTransObject(SQLCA)
dwc_ceb.SetTransObject(SQLCA)
dwc_ce.Retrieve(i_cemp)
dwc_ceb.Retrieve(i_cemp)
dw_tipoincap.retrieve()

for li = 1 to tab_1.tabpage_1.dw_1.rowcount()
	tipodoc=tab_1.tabpage_1.dw_1.getitemstring(li,'tipodoc')
	documento=tab_1.tabpage_1.dw_1.getitemstring(li,'documento')

	dw_tipoincap.setfilter("estado ='1' and incap<>'1'")
	dw_tipoincap.filter()
	for l_j = 1 to dw_tipoincap.RowCount()
		incap=dw_tipoincap.getitemstring(l_j,'cod_ausen')
		f_tipo_ausen(tipodoc,documento,li,incap,incap)
	next
	dw_tipoincap.setfilter("estado ='1' and incap='1'")
	dw_tipoincap.filter()
	for l_j = 1 to dw_tipoincap.RowCount()
		incap=dw_tipoincap.getitemstring(l_j,'cod_ausen')
		f_tipo_ausen(tipodoc,documento,li,incap,incap)
	next
next
end subroutine

public subroutine f_festivos ();uo_datastore dw_f
long i,cel,ini_mes
date fecha
string boton
dw_f = Create uo_datastore
dw_f.DataObject = 'dw_festivos'
dw_f.SetTransObject(SQLCA)
int laño,lmes
//datetime desde,hasta

laño=integer(em_1.text)
desde=datetime(date(laño,mes,1))
if mes=12 then
	hasta=datetime(relativedate(date(laño+1,1,1),-1))
else
	hasta=datetime(relativedate(date(laño,mes+1,1),-1))
end if
dw_f.Retrieve(laño,mes)
for i = 1 to dw_f.RowCount()
	fecha = date(dw_f.GetItemDatetime(i,'fecha'))
	if datetime(fecha) >= desde and datetime(fecha) <= hasta then
	boton =tab_1.tabpage_1.dw_1.modify("dia"+string(day(fecha))+"_t.background.color=15780518")
	boton =tab_1.tabpage_1.dw_1.modify("nm"+string(day(fecha))+".background.color=15780518")
	end if
next
end subroutine

public function integer f_marca_turno (long filas, string columna, string tipodoc, string documento, integer ncargo, string turno, string sigla, string desturno, string lugar, string uf1, string cc1);long i, fila, hora, fraccion, posx, largo, ll_color, fase, obj, item,il_dia,ll_segundos
string valor, ret,dia,lcc
date fechasi,fechasf
double horaini, horafin
datetime ldt_ini, ldt_fin, ldt_fechadom
uo_datastore dw_th
dw_th = Create uo_datastore

il_dia=long(mid(columna,4,len(string(columna))))
desde=datetime(date(integer(em_1.text),mes,il_dia))
fechasi=date(integer(em_1.text),mes,il_dia)
fechasf=date(integer(em_1.text),mes,il_dia)
If sigla<>'DS' then	
	If sigla<>'INT' then	
		dw_th.DataObject = 'dw_turnos_horas'
		dw_th.SetTransObject(SQLCA)
		dw_th.Retrieve()
		item=abs(dayNumber(date(desde)) - 2)
		desde=datetime(relativedate(date(desde),-item))
		if date(desde)<=date(integer(em_1.text),mes,1) then desde=datetime(date(integer(em_1.text),mes,1))
		fila =  tab_1.tabpage_1.dw_hora_resu.find("dia_des='"+string(fechasi,'dd/mm/yyyy')+"'",1, tab_1.tabpage_1.dw_hora_resu.rowCount())
		if fila<>0 then 
			return -1
		end if	
	
		dw_th.SetFilter("codigo='"+turno+"'")
		dw_th.Filter()
		if dw_th.RowCount() = 0 then
			MessageBox('Atención','No aparecen intervalos de tiempo para el turno seleccionado')
			Return -1
		end if
	
		int cuantos 
		for i = 1 to dw_th.RowCount()
			cuantos= dw_th.RowCount()
			ldt_fechadom = datetime(desde)
			horaini = secondsAfter(time("0"),time(dw_th.getitemdatetime(i,"horaini")))/3600
			horafin = secondsAfter(time("0"),time(dw_th.getitemdatetime(i,"horafin")))/3600
			ldt_ini = dw_th.getitemdatetime(i,"horaini")
			ldt_fin = dw_th.getitemdatetime(i,"horafin")
			
			if horaini< horafin then
				ll_segundos=SecondsAfter(time(ldt_ini), time(ldt_fin))
			else
				ll_segundos=SecondsAfter(time(ldt_fin), time(ldt_ini))
				ll_segundos=86400 - ll_segundos
			end if	
			
			if RelativeTime(time(ldt_ini), ll_segundos) = time('23:59:59') then
				il_dia++
			end if 
	
			fila = tab_1.tabpage_1.dw_hora_resu.Insertrow(0)
			if il_dia <= day(date(tab_1.tabpage_1.dw_1.getitemdatetime(tab_1.tabpage_1.dw_1.getrow(),'ultimo'))) then
				fechasf=date(integer(em_1.text),mes,il_dia)
			else
				if mes=12 then
					fechasf=date(integer(em_1.text)+1,1,1)
				else
					fechasf=date(integer(em_1.text),mes+1,1)
				end if
			end if

			ldt_fechadom = datetime(RelativeDate(date(desde), il_dia - 1))
			ldt_fechadom = DateTime(RelativeDate(date(ldt_fechadom),-1*f_diaNumero(date(ldt_fechadom)) + 1))
			valor = tab_1.tabpage_1.dw_hora_resu.Describe("Evaluate('max(item)', 1)")
			obj = long( tab_1.tabpage_1.dw_hora_resu.describe("Evaluate('max(obj)',0)")) + 1
			tab_1.tabpage_1.dw_1.setitem(filas,columna,sigla)
			tab_1.tabpage_1.dw_hora_resu.setItem(fila,'objeto',"obj_"+string(obj))
			tab_1.tabpage_1.dw_hora_resu.setItem(fila,'obj',obj)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'tipodoc',tipodoc)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'documento',documento)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'ncargo',ncargo)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'fecha_dom',desde)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'item',long(valor) + 1)	
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'h_ini',datetime(fechasi,time(ldt_ini)))
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'h_fin',datetime(fechasf,time(ldt_fin)))
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'Inicio',datetime(fechasi,time(ldt_ini)))
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'Fin',datetime(fechasf,time(ldt_fin)))
			tab_1.tabpage_1.dw_hora_resu.setItem(fila,'horas', tab_1.tabpage_1.dw_hora_resu.getItemNumber(fila,'horascomp'))
	
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'hextra','0')
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'compensa','0')
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'agendaprof','0')
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'calculado','0')
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'usuario',usuario)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'fecha_modi',Today())
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'turno',turno)
				
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'ntd',desturno)		
						
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'clugar',lugar)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'ufuncional',uf1)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'ccosto',cc1)
			select centrocostos.color, centrocostos.descripcion
			into :ll_color,:lcc
			from centrocostos inner join ufuncional on centrocostos.coduf = ufuncional.coduf
			where centrocostos.coduf=:uf1 and centrocostos.codcc=:cc1;
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'des_cc',lcc)
			dw_cc1.setfilter("coduf='"+uf1+"'")
			dw_cc1.filter()	
		next
		if f_ver_horas() = -1 then Return -1
	else
		/////////////////////////
			fila = tab_1.tabpage_1.dw_hora_resu.Insertrow(0)
			ldt_fechadom = datetime(RelativeDate(date(desde), il_dia - 1))
			ldt_fechadom = DateTime(RelativeDate(date(ldt_fechadom),-1*f_diaNumero(date(ldt_fechadom)) + 1))
			valor = tab_1.tabpage_1.dw_hora_resu.Describe("Evaluate('max(item)', 1)")
			obj = long( tab_1.tabpage_1.dw_hora_resu.describe("Evaluate('max(obj)',0)")) + 1
			tab_1.tabpage_1.dw_hora_resu.setItem(fila,'objeto',"obj_"+string(obj))
			tab_1.tabpage_1.dw_hora_resu.setItem(fila,'obj',obj)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'tipodoc',tipodoc)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'documento',documento)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'ncargo',ncargo)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'fecha_dom',desde)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'item',long(valor) + 1)	
			
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'h_ini',datetime(fechasi,time(ldt_ini)))
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'h_fin',datetime(fechasf,time(ldt_fin)))
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'Inicio',datetime(fechasi,time(ldt_ini)))
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'Fin',datetime(fechasf,time(ldt_fin)))
			tab_1.tabpage_1.dw_hora_resu.setItem(fila,'horas', tab_1.tabpage_1.dw_hora_resu.getItemNumber(fila,'horascomp'))
	
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'hextra','1')
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'compensa','0')
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'agendaprof','0')
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'calculado','0')
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'usuario',usuario)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'fecha_modi',Today())
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'turno',turno)
				
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'ntd',desturno)		
						
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'clugar',lugar)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'ufuncional',uf1)
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'ccosto',cc1)
			select centrocostos.color, centrocostos.descripcion
			into :ll_color,:lcc
			from centrocostos inner join ufuncional on centrocostos.coduf = ufuncional.coduf
			where centrocostos.coduf=:uf1 and centrocostos.codcc=:cc1;
			tab_1.tabpage_1.dw_hora_resu.setitem(fila,'des_cc',lcc)	
		
		/////////////////////////////
	end if
else
	turno=tab_1.tabpage_1.dw_1.getitemstring(filas,columna)
	fila = tab_1.tabpage_1.dw_hora_resu.find("dia_des='"+string(fechasi,'dd/mm/yyyy')+"' and ntd='"+turno+"'" ,1, tab_1.tabpage_1.dw_hora_resu.rowCount())
	setNull(valor)
	do while fila > 0
		if  tab_1.tabpage_1.dw_hora_resu.getitemstring(fila,'agendaprof')='1' Then
			MessageBox('Atención','No se puede Desocupar viene de Interface')
		else
			tab_1.tabpage_1.dw_1.setitem(filas,columna,valor)
			tab_1.tabpage_1.dw_hora_resu.deleterow(fila)
		end if
		if tab_1.tabpage_1.dw_hora_resu.rowCount()=0  then exit
		fila=tab_1.tabpage_1.dw_hora_resu.find("dia_des='"+string(fechasi,'dd/mm/yyyy')+"' and ntd='"+turno+"'" ,1, tab_1.tabpage_1.dw_hora_resu.rowCount())
	loop
end if

date f_dia
for i = 1 to tab_1.tabpage_1.dw_hora_resu.rowCount()
	if tab_1.tabpage_1.dw_hora_resu.getItemNumber(i,'horascomp') < 0 then
		messageBox('Atención','La hora de inicio no puede ser mayor que la de finalización')
		return -1
	end if
	
	tab_1.tabpage_1.dw_hora_resu.setItem(i,'horas', tab_1.tabpage_1.dw_hora_resu.getItemNumber(i,'horascomp'))
next
return 1
end function

on w_programa_new.create
this.pb_5=create pb_5
this.st_10=create st_10
this.pb_4=create pb_4
this.dw_3=create dw_3
this.dw_tipoincap=create dw_tipoincap
this.dw_aus=create dw_aus
this.st_6=create st_6
this.tab_1=create tab_1
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.em_1=create em_1
this.dw_cargo=create dw_cargo
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_lugar=create dw_lugar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.pb_5,&
this.st_10,&
this.pb_4,&
this.dw_3,&
this.dw_tipoincap,&
this.dw_aus,&
this.st_6,&
this.tab_1,&
this.st_3,&
this.st_2,&
this.ddlb_1,&
this.em_1,&
this.dw_cargo,&
this.st_1,&
this.dw_2,&
this.dw_lugar,&
this.gb_1,&
this.gb_2}
end on

on w_programa_new.destroy
destroy(this.pb_5)
destroy(this.st_10)
destroy(this.pb_4)
destroy(this.dw_3)
destroy(this.dw_tipoincap)
destroy(this.dw_aus)
destroy(this.st_6)
destroy(this.tab_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.em_1)
destroy(this.dw_cargo)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_lugar)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;dw_lugar.settransobject(SQLCA)
dw_2.settransobject(SQLCA)
dw_lugar.insertrow(1)
dw_2.getchild("codcc",dw_ccosto)
dw_ccosto.settransobject(SQLCA)
dw_ccosto.retrieve()
dw_ccosto.setfilter("coduf=''")
dw_ccosto.filter()
dw_2.insertrow(1)

dw_cargo.setTransObject(SQLCA)
dw_cargo.getchild("cargo",dw_car)
dw_cargo.insertrow(1)

ddlb_1.TriggerEvent (selectionchanged!)
end event

event resize;//
end event

type pb_5 from picturebutton within w_programa_new
integer x = 5970
integer y = 80
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrador.GIF"
string disabledname = "d_borrador.GIF"
alignment htextalign = left!
string powertiptext = "Quita filtros"
end type

event clicked;setnull(cl)
setnull(uf)
setnull(cc)
dw_lugar.setitem(1,'codlugar',cl)
dw_2.setitem(1,'codcc',uf)
dw_2.setitem(1,'coduf',cc)
dw_cargo.setitem(1,'cargo',cc)
filtro()

end event

type st_10 from statictext within w_programa_new
integer x = 5792
integer y = 1672
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15199194
string text = "Ausentismo"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_programa_new
integer x = 1019
integer y = 64
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
string powertiptext = "Traer Datos"
end type

event clicked;int laño,lmes,li
string tx,dx

if g_motor='postgres' then
	tab_1.tabpage_1.dw_1.dataobject='dw_empleados_activos_postgres'
else
	tab_1.tabpage_1.dw_1.dataobject='dw_empleados_activos'
end if
tab_1.tabpage_1.dw_1.setTransObject(SQLCA)

tab_1.tabpage_1.dw_hora_resu.reset()
tab_1.tabpage_1.dw_1.reset()
tab_1.tabpage_1.dw_1.retrieve(integer(em_1.text),mes,usuario)
if tab_1.tabpage_1.dw_1.rowcount()=0 then
	MessageBox("No se puede Determinar jefe Inmediato", 'No puede modificar programaciones. No está definida la identificación del usuario.')
	return
end if
f_festivos()
f_ausentismo()
laño=integer(em_1.text)
desde=datetime(date(laño,mes,1))
if mes=12 then
	hasta=datetime(relativedate(date(laño+1,1,1),-1))
else
	hasta=datetime(relativedate(date(laño,mes+1,1),-1))
end if
dw_3.retrieve(desde,hasta)
for li = 1 to dw_3.RowCount()
	tx= dw_3.getitemstring(li,'tipodoc')
	dx=dw_3.getitemstring(li,'documento')
	laño= tab_1.tabpage_1.dw_1.find("tipodoc='"+tx+"' and documento='"+dx+"'",1, tab_1.tabpage_1.dw_1.RowCount())
	if laño>0 then
		do while dx=dw_3.getitemstring(li,'documento')
			lmes=dw_3.getitemnumber(li,'dia')
			tab_1.tabpage_1.dw_1.setitem(laño,'dia'+string(lmes),dw_3.getitemstring(li,'sigla'))
			li++
		loop
		li --
	end if
next
tab_1.tabpage_1.dw_hora_resu.retrieve(date(desde),date(hasta))
pb_4.enabled=false
filtro()



end event

type dw_3 from datawindow within w_programa_new
boolean visible = false
integer x = 6496
integer y = 76
integer width = 82
integer height = 116
integer taborder = 30
string title = "none"
string dataobject = "dw_turnos_asig"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type dw_tipoincap from datawindow within w_programa_new
boolean visible = false
integer x = 6363
integer y = 84
integer width = 128
integer height = 112
integer taborder = 60
string title = "none"
string dataobject = "dw_conf_ausentismo"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
select cod_empresa into :i_cemp from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
	return -1
end if
if isnull(i_cemp) then
	messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
	return -1
end if

end event

type dw_aus from datawindow within w_programa_new
boolean visible = false
integer x = 6203
integer y = 80
integer width = 137
integer height = 112
integer taborder = 30
string title = "none"
string dataobject = "dw_ausentismo"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
end event

type st_6 from statictext within w_programa_new
integer x = 105
integer y = 376
integer width = 174
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asignar"
boolean focusrectangle = false
end type

type tab_1 from tab within w_programa_new
integer x = 41
integer y = 260
integer width = 6080
integer height = 1992
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
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 6043
integer height = 1864
long backcolor = 67108864
string text = "Programación"
long tabtextcolor = 33554432
string picturename = "apptl.ico"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_6 pb_6
pb_ciclo pb_ciclo
hpb_1 hpb_1
pb_guar pb_guar
pb_2 pb_2
pb_1 pb_1
dw_hora_resu dw_hora_resu
st_9 st_9
st_8 st_8
st_5 st_5
st_7 st_7
dw_1 dw_1
dw_4 dw_4
st_4 st_4
ddlb_2 ddlb_2
end type

on tabpage_1.create
this.pb_3=create pb_3
this.pb_6=create pb_6
this.pb_ciclo=create pb_ciclo
this.hpb_1=create hpb_1
this.pb_guar=create pb_guar
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_hora_resu=create dw_hora_resu
this.st_9=create st_9
this.st_8=create st_8
this.st_5=create st_5
this.st_7=create st_7
this.dw_1=create dw_1
this.dw_4=create dw_4
this.st_4=create st_4
this.ddlb_2=create ddlb_2
this.Control[]={this.pb_3,&
this.pb_6,&
this.pb_ciclo,&
this.hpb_1,&
this.pb_guar,&
this.pb_2,&
this.pb_1,&
this.dw_hora_resu,&
this.st_9,&
this.st_8,&
this.st_5,&
this.st_7,&
this.dw_1,&
this.dw_4,&
this.st_4,&
this.ddlb_2}
end on

on tabpage_1.destroy
destroy(this.pb_3)
destroy(this.pb_6)
destroy(this.pb_ciclo)
destroy(this.hpb_1)
destroy(this.pb_guar)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_hora_resu)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_5)
destroy(this.st_7)
destroy(this.dw_1)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.ddlb_2)
end on

type pb_3 from picturebutton within tabpage_1
integer x = 5723
integer y = 1620
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Elimina Intervalo"
end type

event clicked;if dw_hora_resu.rowcount()<0 then return
if dw_hora_resu.getitemstring(dw_hora_resu.getrow(),'turno')='INT' then 
	dw_hora_resu.DeleteRow(dw_hora_resu.GetRow())
else
	return
end if
end event

type pb_6 from pb_report within tabpage_1
integer x = 5143
integer y = 32
integer taborder = 40
string cod_rep = "NPR"
string nombre_rep = "Programacion Nomina"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_1.rowcount()<1 then return
any par[5]
par[1]=integer(em_1.text)
par[2]=mes
if isnull(dw_lugar.GetItemString(dw_lugar.getrow(),'codlugar')) then
	par[3]='%'
else
	par[3]=dw_lugar.GetItemString(dw_lugar.getrow(),'codlugar')
end if
if isnull(dw_2.GetItemString(dw_2.getrow(),'coduf')) then
	par[4]='%'
else
	par[4]=dw_2.GetItemString(dw_2.getrow(),'coduf')
end if
if isnull(dw_2.GetItemString(dw_2.getrow(),'codcc')	) then
	par[5]='%'
else
	par[5]=dw_2.GetItemString(dw_2.getrow(),'codcc')	
end if
imprimir(par,'','0')

end event

type pb_ciclo from picturebutton within tabpage_1
integer x = 1856
integer y = 28
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "ocupar.gif"
string disabledname = "d_ocupar.gif"
alignment htextalign = left!
string powertiptext = "Ocupa Ciclos"
end type

type hpb_1 from hprogressbar within tabpage_1
boolean visible = false
integer x = 3392
integer y = 68
integer width = 1394
integer height = 68
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type pb_guar from picturebutton within tabpage_1
integer x = 5307
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
end type

event clicked;if dw_hora_resu.update() = -1 then
	Rollback;
else
	Commit;
end if

end event

type pb_2 from picturebutton within tabpage_1
integer x = 4969
integer y = 32
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "medico.gif"
string disabledname = "d_medico.gif"
alignment htextalign = left!
end type

event clicked;int li
hpb_1.visible=true
hpb_1.Position = 0
hpb_1.MinPosition = 0
hpb_1.MaxPosition = dw_1.rowcount()
hpb_1.SetRange ( 0, dw_1.rowcount() )
for li = 1 to dw_1.rowcount()
	f_trae_prog_prof_new(dw_1.getItemString(li ,'tipodoc'),dw_1.getitemstring(li ,'documento'),desde,hasta)
	hpb_1.Position = li
next
hpb_1.Visible = FALSE
hpb_1.Position = 0
ddlb_1.triggerevent(selectionchanged!)
end event

type pb_1 from picturebutton within tabpage_1
boolean visible = false
integer x = 4805
integer y = 32
integer width = 146
integer height = 132
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevars.gif"
string disabledname = "d_llevars.gif"
alignment htextalign = left!
end type

event clicked;//long i,f
//uo_datastore dw_os
//date f_dom
//string l_cl,l_uf,l_cc,valor
//
//dw_os = Create uo_datastore
//dw_os.DataObject = 'dw_hora_prof_t_i'
//dw_os.SetTransObject(SQLCA)
//
//dw_os.Retrieve(dw_1.GetItemString(1,'tipodoc'),dw_1.GetItemString(1,'documento'),dw_1.GetItemNumber(1,'ncargo'))
//
//if dw_hora_resu.RowCount() > 0 then
//	if MessageBox('Atención','Desea reemplazar la programación existente para la semana seleccionada?',QUESTION!,YESNO!,2) = 2 then Return 0
//	i = 1
//	do while dw_hora_resu.RowCount() > 0
//		dw_hora_resu.DeleteRow(i)
//		i = i + 1
//	loop
//end if
//f_dom = date(desde)
//for i = 1 to dw_os.RowCount()
//	f = dw_hora_resu.InsertRow(0)
//	l_cl = dw_os.GetItemString(i,'codlugar')
//	l_uf = dw_os.GetItemString(i,'ufuncional')
//	l_cc = dw_os.GetItemString(i,'ccosto')
//	dw_hora_resu.SetItem(f,'tipodoc',dw_os.GetItemString(i,'tipodoc'))
//	dw_hora_resu.SetItem(f,'documento',dw_os.GetItemString(i,'documento'))
//	dw_hora_resu.SetItem(f,'ncargo',dw_os.GetItemNumber(i,'ncargo'))
//	dw_hora_resu.SetItem(f,'clugar',l_cl)
//	dw_hora_resu.SetItem(f,'ufuncional',l_uf)
//	dw_hora_resu.SetItem(f,'ccosto',l_cc)
//	dw_hora_resu.SetItem(f,'fecha_dom',f_dom)
//	dw_hora_resu.SetItem(f,'item',i)
//	dw_hora_resu.SetItem(f,'inicio',DateTime(RelativeDate(f_dom,dw_os.GetItemNumber(i,'dia') - 1),Time(dw_os.GetItemDatetime(i,'horaini'))))
//	dw_hora_resu.SetItem(f,'fin',DateTime(RelativeDate(f_dom,dw_os.GetItemNumber(i,'dia') - 1),Time(dw_os.GetItemDatetime(i,'horafin'))))
//	dw_hora_resu.Setitem(f,"Horas", round(secondsAfter(time(dw_os.GetItemDatetime(i,'horaini')),time(dw_os.GetItemDatetime(i,'horafin')))/3600,1) )
//	
//	Select descripcion into :valor from lugar
//	where codlugar = :l_cl;
//	IF SQLCA.SQLCode = -1 THEN
//		MessageBox("SQL error", SQLCA.SQLErrText)
//		Return -1
//	END IF
//	dw_hora_resu.Setitem(f,"des_lu",valor)
//	Select desufuncional into :valor from ufuncional
//	where coduf = :l_uf;
//	IF SQLCA.SQLCode = -1 THEN
//		MessageBox("SQL error", SQLCA.SQLErrText)
//		Return -1
//	END IF
//	dw_hora_resu.Setitem(f,"des_uf",valor)
//	Select descripcion into :valor from centrocostos
//	where coduf = :l_uf and codcc = :l_cc;
//	IF SQLCA.SQLCode = -1 THEN
//		MessageBox("SQL error", SQLCA.SQLErrText)
//		Return -1
//	END IF
//	dw_hora_resu.Setitem(f,"des_cc",valor)
//	
//next
//dw_hora_resu.TriggerEvent(RetrieveEnd!)
//
//cambio = TRUE
end event

type dw_hora_resu from datawindow within tabpage_1
integer x = 55
integer y = 1216
integer width = 5618
integer height = 624
integer taborder = 50
string dataobject = "dw_programa_new_emp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;AcceptText()
if this.getColumnName() = 'ufuncional' then
	this.setitem(row,'ccosto',"")
	this.setitem(row,'des_cc',"")
	dw_cc1.setfilter("coduf='"+this.getitemstring(row,'ufuncional')+"'")
	dw_cc1.filter()
end if
if this.getColumnName() = 'des_cc' then
	this.setitem(row,'ccosto',dw_cc1.getitemstring(dw_cc1.getrow(),'codcc'))
end if
//////////

string campo
long largo, inicio
datetime ldt_ant
st_interfec a, b, r

if getcolumnName() = 'h_ini' then
	campo = 'inicio'
	b.x = datetime(date(getItemdatetime(getrow(),'inicio')), time(datetime(data)))
	b.y = getItemdatetime(getrow(),'fin')
	tab_1.tabpage_1.dw_hora_resu.setItem(row,'horas', tab_1.tabpage_1.dw_hora_resu.getItemNumber(row,'horascomp'))
end if 
if getcolumnName() = 'h_fin' then
	campo = 'fin'
	b.x = getItemdatetime(getrow(),'inicio')
	b.y = datetime(date(getItemdatetime(getrow(),'fin')), time(datetime(data)))
	tab_1.tabpage_1.dw_hora_resu.setItem(row,'horas', tab_1.tabpage_1.dw_hora_resu.getItemNumber(row,'horascomp'))
end if

if len(campo) > 1 then
	if isnull(getItemDateTime(getrow(),'h_ini')) or isNull(getItemDateTime(getrow(),'h_fin')) then return 0
	int i
	for i = 1 to rowCount()
		if getrow() = i then Continue
		a.x = getItemDateTime(i,'inicio')
		a.y = getItemDateTime(i,'fin')
		r = interseccion(a,b)
		if not isNull(r.x) and not isnull(r.y) then
			messageBox('Atención','El intervalo de tiempo se cruza con la fila '+ string(i))
			return 1
		end if
	next
	setItem(getrow(),'inicio',b.x)
	setItem(getrow(),'fin',b.y)
	acceptText()
//	post event modifica(getrow())
end if

return 0

////////





AcceptText()

end event

event constructor;setTransObject(SQLCA)
getchild("des_cc",dw_cc1)
dw_cc1.settransobject(SQLCA)
dw_cc1.retrieve()

end event

event rowfocuschanged;if rowcount()<0 then return
if isnull("coduf='"+this.getitemstring(currentrow,'ufuncional')+"'") then return
dw_cc1.setfilter("coduf='"+this.getitemstring(currentrow,'ufuncional')+"'")
dw_cc1.filter()
end event

type st_9 from statictext within tabpage_1
integer x = 5728
integer y = 1368
integer width = 261
integer height = 64
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 13800960
string text = "AgendaProf"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_8 from statictext within tabpage_1
integer x = 5728
integer y = 1452
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 16777215
string text = "Hora Extra"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_1
integer x = 5728
integer y = 1524
integer width = 261
integer height = 64
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421376
long backcolor = 16777215
string text = "Compensat"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_1
integer x = 5728
integer y = 1224
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Libre"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_1 from datawindow within tabpage_1
integer x = 55
integer y = 184
integer width = 5943
integer height = 984
integer taborder = 50
string title = "none"
string dataobject = "dw_empleados_activos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clicked;string datos,colum
int l_ultimo,l_dias,filahist

dw_tipoincap.setfilter("estado ='1'")
dw_tipoincap.filter()
if left(dwo.name,3)='dia' then
	colum=dwo.name
	datos=dw_1.getitemstring(row,colum)
	l_ultimo=day(date(dw_1.getitemdatetime(row,'ultimo')))
	l_dias=long(mid(colum,4,len(string(colum))))
	
	if l_dias<=l_ultimo then
		filahist = dw_tipoincap.find("cod_ausen='"+datos+"'",1,dw_tipoincap.RowCount())
		if ((filahist<>0 or  datos='CE')) then	
	    		this.modify (GetColumnName ( )+".Protect=1")
		else
			if isnull(dw_turno.getitemstring(dw_turno.getrow(),'sigla')) then return -1
			this.modify (dwo.name+".Protect=0")
			f_marca_turno(row,dwo.name,dw_1.getitemstring(row,'tipodoc'),dw_1.getitemstring(row,'documento'),dw_1.getitemnumber(row,'ncargo'),dw_turno.getitemstring(dw_turno.getrow(),'codigo'),dw_turno.getitemstring(dw_turno.getrow(),'sigla'),dw_turno.getitemstring(dw_turno.getrow(),'descripcion'),dw_1.getitemstring(row,'codlugar'),dw_1.getitemstring(row,'ufuncional'),dw_1.getitemstring(row,'ccosto'))
		end if
	else
		this.modify (GetColumnName ( )+".Protect=1")
	end if
	
end if

if dwo.name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'sel',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'sel',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if
end event

event rowfocuschanged;string tipodoc, documento

tipodoc=dw_1.getitemstring(dw_1.getrow(),'tipodoc')
documento=dw_1.getitemstring(dw_1.getrow(),'documento')
dw_hora_resu.setfilter("tipodoc='"+tipodoc+"' and documento='"+documento+"'")
dw_hora_resu.filter()

select nom_esquema_tsup.tipo, horas_base into :tipo_ts, :hbase
from nom_esquema_tsup inner join empleados on nom_esquema_tsup.codtsup = empleados.codtsup
where (empleados.tipodoc=:tipodoc and empleados.documento=:documento);
if sqlca.sqlcode = -1 or sqlca.sqlcode = 100 then
	setnull(tipo_ts)
end if
if tipo_ts = 'm' or tipo_ts = 's' then
//	pb_4.enabled = true
else
//	pb_4.enabled = false
end if
//cb_guarda.enabled = true

end event

type dw_4 from datawindow within tabpage_1
integer x = 498
integer y = 64
integer width = 978
integer height = 80
integer taborder = 40
string title = "none"
string dataobject = "dw_combo_turnos"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type st_4 from statictext within tabpage_1
integer x = 498
integer width = 379
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ciclos de Turnos"
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within tabpage_1
integer x = 41
integer y = 68
integer width = 411
integer height = 352
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"TURNOS","CICLOS"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text
	case 'CICLOS'
		dw_4.dataobject='dw_combo_ciclo'
		pb_ciclo.enabled=true
	case 'TURNOS'
		dw_4.dataobject='dw_combo_turnos'
		dw_4.getchild("codigo",dw_turno)
		dw_turno.settransobject(SQLCA)
		dw_turno.retrieve()
		
		dw_turno.insertrow(1)
		dw_turno.setitem(1,'codigo','DS')
		dw_turno.setitem(1,'descripcion','DESOCUPA')		
		dw_turno.setitem(1,'sigla','DS')	
		dw_turno.setitem(1,'ausentismo','1')	
		
		dw_turno.insertrow(1)
		dw_turno.setitem(1,'codigo','INT')
		dw_turno.setitem(1,'descripcion','INTERVALO')		
		dw_turno.setitem(1,'sigla','INT')	
		dw_turno.setitem(1,'ausentismo','1')		
		
		pb_ciclo.enabled=false		
end choose
dw_4.settransobject(sqlca)
dw_4.retrieve()
if dw_4.rowcount()<0 then 
	return -1
end if
end event

type st_3 from statictext within w_programa_new
integer x = 425
integer y = 164
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes"
boolean focusrectangle = false
end type

type st_2 from statictext within w_programa_new
integer x = 73
integer y = 164
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_programa_new
integer x = 425
integer y = 72
integer width = 553
integer height = 352
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text=upper(string(f_mes(month(today()))))

end event

event selectionchanged;choose case this.text
	case 'ENERO'
		mes=1
	case 'FEBRERO'
		mes=2
	case 'MARZO'
		mes=3
	case 'ABRIL'
		mes=4
	case 'MAYO'
		mes=5
	case 'JUNIO'
		mes=6
	case 'JULIO'
		mes=7
	case 'AGOSTO'
		mes=8
	case 'SEPTIEMBRE'
		mes=9
	case 'OCTUBRE'
		mes=10
	case 'NOVIEMBRE'
		mes=11
	case 'DICIEMBRE'
		mes=12		
end choose
pb_4.enabled=true

end event

type em_1 from editmask within w_programa_new
integer x = 73
integer y = 72
integer width = 343
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "0"
boolean spin = true
string minmax = "2021~~2050"
end type

event constructor;this.text=string(year(today()))
end event

event modified;pb_4.enabled=true

end event

type dw_cargo from datawindow within w_programa_new
integer x = 4663
integer y = 56
integer width = 1312
integer height = 132
integer taborder = 20
string dataobject = "dw_combo_cargo_ubica"
boolean border = false
boolean livescroll = true
end type

event itemchanged;acceptText()
filtro()
end event

type st_1 from statictext within w_programa_new
integer x = 1234
integer y = 64
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_programa_new
integer x = 2391
integer y = 68
integer width = 2226
integer height = 144
integer taborder = 20
string title = "none"
string dataobject = "dw_uf_cc"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string l_cod,l_cuf,l_vnul
AcceptText()
if this.getColumnName() = 'coduf' then
	setNull(l_vnul)
	setnull(cc)
	this.setitem(1,'codcc',"")
	dw_ccosto.setfilter("coduf='"+this.getitemstring(1,'coduf')+"'")
	dw_ccosto.filter()
	acceptText()
	setItem(1,'codcc',l_vnul)
	l_cod = GetItemString(1,'coduf')
	select desufuncional into :uf from ufuncional
	where coduf = :l_cod;
else
	setnull(cc)
	l_cuf = GetItemString(1,'coduf')
	l_cod = GetItemString(1,'codcc')
	select descripcion,color into :cc,:l_colo from centrocostos
	where coduf=:l_cuf and codcc=:l_cod;
	setItem(1,'color',l_colo)
end if
filtro()


end event

type dw_lugar from datawindow within w_programa_new
integer x = 1221
integer y = 120
integer width = 1175
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dw_lugar_nom"
boolean border = false
boolean livescroll = true
end type

event itemchanged;acceptText()
string des,cod
cod = GetItemString(1,'codlugar')
select descripcion into :cl from lugar
where codlugar = :cod;
filtro()

end event

type gb_1 from groupbox within w_programa_new
integer x = 37
integer y = 20
integer width = 1161
integer height = 220
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Periodo"
end type

type gb_2 from groupbox within w_programa_new
integer x = 1216
integer y = 20
integer width = 4923
integer height = 220
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtros"
end type

