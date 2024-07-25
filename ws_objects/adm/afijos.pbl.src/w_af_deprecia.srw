$PBExportHeader$w_af_deprecia.srw
forward
global type w_af_deprecia from w_center
end type
type pb_cerrar from picturebutton within w_af_deprecia
end type
type gb_1 from groupbox within w_af_deprecia
end type
type st_1 from statictext within w_af_deprecia
end type
type st_2 from statictext within w_af_deprecia
end type
type pb_buscar from picturebutton within w_af_deprecia
end type
type pb_1 from picturebutton within w_af_deprecia
end type
type dw_d from datawindow within w_af_deprecia
end type
type st_4 from statictext within w_af_deprecia
end type
type t1 from tab within w_af_deprecia
end type
type p1 from userobject within t1
end type
type pb_3 from picturebutton within p1
end type
type pb_4 from picturebutton within p1
end type
type dw_respon from datawindow within p1
end type
type p1 from userobject within t1
pb_3 pb_3
pb_4 pb_4
dw_respon dw_respon
end type
type p2 from userobject within t1
end type
type dw_mantto from datawindow within p2
end type
type p2 from userobject within t1
dw_mantto dw_mantto
end type
type p3 from userobject within t1
end type
type dw_com from datawindow within p3
end type
type p3 from userobject within t1
dw_com dw_com
end type
type t1 from tab within w_af_deprecia
p1 p1
p2 p2
p3 p3
end type
type em_1 from editmask within w_af_deprecia
end type
type ddlb_1 from dropdownlistbox within w_af_deprecia
end type
type st_3 from statictext within w_af_deprecia
end type
type dw_lp from datawindow within w_af_deprecia
end type
type pb_2 from picturebutton within w_af_deprecia
end type
type dw_asig from datawindow within w_af_deprecia
end type
type st_5 from statictext within w_af_deprecia
end type
type dw_alm from datawindow within w_af_deprecia
end type
type cb_tod from checkbox within w_af_deprecia
end type
type dw_lug from datawindow within w_af_deprecia
end type
end forward

global type w_af_deprecia from w_center
string tag = "Ha realizado cambios. Desea guardarlos?"
integer width = 4869
integer height = 2260
string title = "Activos Fijos- Depreciación"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_deprecia.ico"
boolean center = false
pb_cerrar pb_cerrar
gb_1 gb_1
st_1 st_1
st_2 st_2
pb_buscar pb_buscar
pb_1 pb_1
dw_d dw_d
st_4 st_4
t1 t1
em_1 em_1
ddlb_1 ddlb_1
st_3 st_3
dw_lp dw_lp
pb_2 pb_2
dw_asig dw_asig
st_5 st_5
dw_alm dw_alm
cb_tod cb_tod
dw_lug dw_lug
end type
global w_af_deprecia w_af_deprecia

type variables
Datawindow dw_fuente
DataWindowChild dwc_ccosto,dwc_alm,dwc_lugar
string codDocumento
boolean err_retrieve

end variables

forward prototypes
public function integer grabar ()
public function decimal calc_deprecia_mes (integer ano, integer mes)
public function integer calc_deprecia (integer i_ano, integer i_mes, string coddoc, string lugares)
public function decimal calc_deprecia_per (integer ano, integer mes, string coddoc, string lugares)
public function integer calc_deprecia_per2 (integer ano, integer mes, string coddoc, string lugares)
end prototypes

public function integer grabar ();Return pb_grabar.Event clicked()

end function

public function decimal calc_deprecia_mes (integer ano, integer mes);decimal vrmantto, vr_x_depreciar, deprecia, valor
date f_servicio, f_ptr, f_fmes
st_interfec dep, man, ret, com
long fila, i, ano_ant, mes_ant, dias, mantto, vida
string placa

placa = dw_lp.GetItemString(dw_lp.GetRow(),'placa')
fila = t1.p1.dw_respon.Find("anyo="+string(ano)+" and mes="+string(mes),1,t1.p1.dw_respon.RowCount())
if fila > 0 then 
	MessageBox('Atención','Periodo ya calculado, año - mes '+string(ano)+' - '+string(mes))
	Return 0
elseif t1.p1.dw_respon.RowCount() > 0 then
	ano_ant = t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'anyo') 
	mes_ant = t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'mes') 
	if string(ano_ant) + string(mes,"00") > string(ano)+string(mes,"00") then
		MessageBox('Atención','El último periodo calculado es posterior al solicitado: año - mes '+string(ano)+' - '+string(mes))
		Return 0
	end if
end if

f_servicio = date(dw_lp.GetItemDateTime(dw_lp.GetRow(),'fechaservicio'))
valor = dw_lp.GetItemNumber(dw_lp.GetRow(),'vrcompra')
vida  = dw_lp.GetItemNumber(dw_lp.GetRow(),'vidautil')
f_ptr = date(ano,mes,1)
if isNull(f_servicio) then
	MessageBox('Atención','La fecha de servicio está en Nulo. ' + placa)
	Return -1
end if
if date(year(f_servicio),month(f_servicio),1) > date(year(f_ptr),month(f_ptr),1) then
	MessageBox('Atención','La fecha de servicio es superior al periodo a depreciar. ' + placa)
	Return 1
end if

if f_servicio > f_ptr then
	f_ptr = f_servicio
end if
f_fmes = f_finmes(f_ptr)

if mes = 1 then
	mes_ant = 12
	ano_ant = ano - 1
else
	mes_ant = mes - 1
	ano_ant = ano
end if

fila = t1.p1.dw_respon.Find("anyo="+string(ano_ant)+" and mes="+string(mes_ant),1,t1.p1.dw_respon.RowCount())
if f_ptr > f_servicio and fila = 0 then
	calc_deprecia_mes(ano_ant,mes_ant)
end if
fila = t1.p1.dw_respon.Find("anyo="+string(ano_ant)+" and mes="+string(mes_ant),1,t1.p1.dw_respon.RowCount())
if fila = 0 then
	if t1.p1.dw_respon.RowCount() > 0 then
		if t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'valor_x_depreciar') = 0 then
			fila = t1.p1.dw_respon.RowCount()
		end if
	end if
end if

if fila > 0 or f_ptr = f_servicio then
	
	if fila > 0 then
		vr_x_depreciar = t1.p1.dw_respon.GetItemNumber(fila,'valor_x_depreciar')
	else
		vr_x_depreciar = valor
	end if
	if day(f_ptr) = 1 then
		dias = 30
	else
		dias = DaysAfter(f_ptr,f_fmes) + 1
	end if
	dep.x = datetime(f_ptr)
	dep.y = datetime(f_fmes)
	
	for i = 1 to t1.p2.dw_mantto.RowCount()
		man.x = t1.p2.dw_mantto.GetItemDateTime(i,'fecha_inicia')
		man.y = t1.p2.dw_mantto.GetItemDateTime(i,'fecha_termina')
		
		ret = interseccion(dep,man)
		if (not isNull(ret.x)) and (not isNull(ret.y)) then
			mantto = mantto + DaysAfter(date(ret.x),date(ret.y)) + 1
			if date(man.x) >= f_ptr then 
				vrmantto = vrmantto + t1.p2.dw_mantto.GetItemNumber(i,'valor')
			end if
		end if
	next
	deprecia = round((valor/vida) * (dias - mantto)/30, 0)
	if deprecia > vr_x_depreciar + vrmantto then
		deprecia = round(vr_x_depreciar + vrmantto,0)
	end if
	if deprecia > 0 then
		fila = t1.p1.dw_respon.InsertRow(0)
		t1.p1.dw_respon.SetItem(fila,'placa',placa)
		t1.p1.dw_respon.SetItem(fila,'anyo',year(f_ptr))
		t1.p1.dw_respon.SetItem(fila,'mes',month(f_ptr))
		t1.p1.dw_respon.SetItem(fila,'dias_depreciados',dias - mantto)
		t1.p1.dw_respon.SetItem(fila,'valor_depreciado',deprecia)
		t1.p1.dw_respon.SetItem(fila,'valor_x_depreciar',vr_x_depreciar - deprecia + vrmantto)
		t1.p1.dw_respon.SetItem(fila,'valor_x_mantto',vrmantto)
	end if

end if

Return 0

end function

public function integer calc_deprecia (integer i_ano, integer i_mes, string coddoc, string lugares);decimal valor, deprecia, vrmantto, acum_dep, acum_mantto
date f_servicio, f_actual, f_ptr, f_fmes
st_interfec dep, man, ret
long dias, fila, i, mantto, vida, ano, mes
boolean continua = FALSE

if t1.p1.dw_respon.Find("contabil='1'",1,t1.p1.dw_respon.RowCount()) > 0 then
	if MessageBox('Atención','Se han llevado registros a contabilidad. Desea continuar?',QUESTION!,YESNO!) = 2 then Return 0
end if
f_actual = date(i_ano,i_mes,1)
f_servicio = date(dw_lp.GetItemDateTime(dw_lp.GetRow(),'fechaservicio'))
valor = dw_lp.GetItemNumber(dw_lp.GetRow(),'vrcompra')
vida  = dw_lp.GetItemNumber(dw_lp.GetRow(),'vidautil')
f_ptr = f_servicio

do while date(year(f_ptr),month(f_ptr),1) <= date(year(f_actual),month(f_actual),1)
	mantto = 0
	vrmantto = 0
	f_fmes = f_finmes(f_ptr)
	if day(f_ptr) = 1 then
		dias = 30
	else
		dias = DaysAfter(f_ptr,f_fmes) + 1
	end if
	dep.x = datetime(f_ptr)
	dep.y = datetime(f_fmes)
	for i = 1 to t1.p2.dw_mantto.RowCount()
		man.x = t1.p2.dw_mantto.GetItemDateTime(i,'fecha_inicia')
		man.y = t1.p2.dw_mantto.GetItemDateTime(i,'fecha_termina')
		ret = interseccion(dep,man)
		if (not isNull(ret.x)) and (not isNull(ret.y)) then
			mantto = mantto + DaysAfter(date(ret.x),date(ret.y)) + 1
			if t1.p2.dw_mantto.GetItemNumber(i,'calculado') = 0 then
				t1.p2.dw_mantto.SetItem(i,'calculado',1)
				vrmantto = vrmantto + t1.p2.dw_mantto.GetItemNumber(i,'valor')
				acum_mantto = acum_mantto + vrmantto
			end if
		end if
	next
	deprecia = round((valor/vida) * (dias - mantto)/30, 0)
	if deprecia > valor + acum_mantto - acum_dep then
		deprecia = round(valor + acum_mantto - acum_dep,0)
	end if
	if not (deprecia = 0 and (valor + acum_mantto - acum_dep - deprecia) = 0) then
		fila = dw_d.InsertRow(0)
		dw_d.SetItem(fila,'coddocu',coddoc)
		dw_d.SetItem(fila,'clugar',lugares)
		dw_d.SetItem(fila,'anyo',year(f_ptr))
		dw_d.SetItem(fila,'mes',month(f_ptr))
		dw_d.SetItem(fila,'dias_depreciados',dias - mantto)
		dw_d.SetItem(fila,'valor_depreciado',deprecia)
		dw_d.SetItem(fila,'valor_x_depreciar',valor + acum_mantto - acum_dep - deprecia)
		dw_d.SetItem(fila,'valor_x_mantto',vrmantto)
	end if
	acum_dep = acum_dep + deprecia
	f_ptr = RelativeDate(f_fmes,1)
loop

for i = 1 to dw_d.RowCount()
	ano = dw_d.GetItemNumber(i,'anyo')
	mes = dw_d.GetItemNumber(i,'mes')
	fila = t1.p1.dw_respon.Find("anyo="+string(ano)+" and mes="+string (mes),1,t1.p1.dw_respon.RowCount())
	if fila > 0 then
		if t1.p1.dw_respon.GetItemNumber(fila,'valor_depreciado') <> dw_d.GetItemNumber(i,'valor_depreciado') or t1.p1.dw_respon.GetItemNumber(fila,'valor_x_depreciar') <> dw_d.GetItemNumber(i,'valor_x_depreciar') then
			if not continua then
				if MessageBox('Atención','El ano '+string(ano)+' y mes '+string(mes)+' difiere en montos. Desea establecer los nuevos calculados?',QUESTION!,YESNO!) = 2 then CONTINUE
			end if
			continua = TRUE
			t1.p1.dw_respon.SetItem(fila,'valor_depreciado',dw_d.GetItemNumber(i,'valor_depreciado'))
			t1.p1.dw_respon.SetItem(fila,'valor_x_depreciar',dw_d.GetItemNumber(i,'valor_x_depreciar'))
			t1.p1.dw_respon.SetItem(fila,'valor_x_mantto',dw_d.GetItemNumber(i,'valor_x_mantto'))
			t1.p1.dw_respon.SetItem(fila,'dias_depreciados',dw_d.GetItemNumber(i,'dias_depreciados'))
		end if
	else
		fila = t1.p1.dw_respon.InsertRow(0)
		t1.p1.dw_respon.SetItem(fila,'placa',dw_lp.GetItemString(dw_lp.GetRow(),'placa'))
		t1.p1.dw_respon.SetItem(fila,'anyo',ano)
		t1.p1.dw_respon.SetItem(fila,'mes',mes)
		t1.p1.dw_respon.SetItem(fila,'valor_depreciado',dw_d.GetItemNumber(i,'valor_depreciado'))
		t1.p1.dw_respon.SetItem(fila,'valor_x_depreciar',dw_d.GetItemNumber(i,'valor_x_depreciar'))
		t1.p1.dw_respon.SetItem(fila,'dias_depreciados',dw_d.GetItemNumber(i,'dias_depreciados'))
		t1.p1.dw_respon.SetItem(fila,'valor_x_mantto',dw_d.GetItemNumber(i,'valor_x_mantto'))
	end if
next

for i = 1 to t1.p1.dw_respon.RowCount()
	ano = t1.p1.dw_respon.GetItemNumber(i,'anyo')
	mes = t1.p1.dw_respon.GetItemNumber(i,'mes')
	fila = dw_d.Find("anyo="+string(ano)+" and mes="+string (mes),1,dw_d.RowCount())
	if fila = 0 then
		t1.p1.dw_respon.SetItem(i,'valor_depreciado',0)
		t1.p1.dw_respon.SetItem(i,'valor_x_depreciar',0)
		t1.p1.dw_respon.SetItem(i,'valor_x_mantto',0)
		t1.p1.dw_respon.SetItem(i,'dias_depreciados',0)
	end if
next
Return 0

end function

public function decimal calc_deprecia_per (integer ano, integer mes, string coddoc, string lugares);decimal vrmantto, vr_x_depreciar, deprecia, valor, vrvaloriza, vrdesvalor
date t_fecha
datetime f_servicio
st_interfec man, ret, per, com
long fila, i, ano_ant, mes_ant, dias, vida, j, comodato, mantto
string placa, recepcion, tipo,l_m,l_a

placa = dw_lp.GetItemString(dw_lp.GetRow(),'placa')
fila = t1.p1.dw_respon.Find("anyo="+string(ano)+" and mes="+string(mes),1,t1.p1.dw_respon.RowCount())
if fila > 0 then 
	MessageBox('Atención','Periodo ya calculado, año - mes '+string(ano)+' - '+string(mes))
	Return 0
elseif t1.p1.dw_respon.RowCount() > 0 then
	ano_ant = t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'anyo') 
	mes_ant = t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'mes') 
	if string(ano_ant) + string(mes,"00") > string(ano)+string(mes,"00") then
		MessageBox('Atención','El último periodo calculado es posterior al solicitado: año - mes '+string(ano)+' - '+string(mes))
		Return 0
	end if
end if
//f_servicio = datetime(date(dw_asig.GetItemDateTime(dw_asig.RowCount(),'fechaasignacion')))
f_servicio = datetime(date(dw_asig.GetItemDateTime(dw_asig.RowCount(),'fecha_servicio')))
if isNull(f_servicio) then 
	MessageBox('Atención','El activo '+placa+' tiene fecha de asignación en NULO')
	Return -1
end if

valor = dw_lp.GetItemNumber(dw_lp.GetRow(),'vrcompra')
vida  = dw_lp.GetItemNumber(dw_lp.GetRow(),'vidautil')
per.x = datetime(date(ano,mes,1))
per.y = datetime(f_finmes(date(per.x)))
//if date(year(date(f_servicio)),month(date(f_servicio)),1) > date(per.X) then
if date(year(date(f_servicio)),month(date(f_servicio)),1) > date(per.y) then
	MessageBox('Atención','La fecha de servicio es superior al periodo a depreciar. ' + placa)
	Return 1
end if

if mes = 1 then
	mes_ant = 12
	ano_ant = ano - 1
else
	mes_ant = mes - 1
	ano_ant = ano
end if

fila = t1.p1.dw_respon.Find("anyo="+string(ano_ant)+" and mes="+string(mes_ant),1,t1.p1.dw_respon.RowCount())
if per.x > f_servicio and fila = 0 then
	if calc_deprecia_per(ano_ant,mes_ant,coddoc,lugares) = -1 then Return -1
end if
fila = t1.p1.dw_respon.Find("anyo="+string(ano_ant)+" and mes="+string(mes_ant),1,t1.p1.dw_respon.RowCount())
if fila = 0 then
	if t1.p1.dw_respon.RowCount() > 0 then
		vr_x_depreciar = t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'valor_x_depreciar')
	else
		vr_x_depreciar = valor
	end if
else
	vr_x_depreciar = t1.p1.dw_respon.GetItemNumber(fila,'valor_x_depreciar')
end if

if vr_x_depreciar <= 0 and t1.p2.dw_mantto.Find("llevado='0'",1,t1.p2.dw_mantto.RowCount()) = 0 then Return 0

setNull(ret.x)
setNull(ret.y)
for j = 1 to t1.p3.dw_com.RowCount()  // Comodato
	com.x = t1.p3.dw_com.GetItemDateTime(j,'fecha_entrega')
	com.y = t1.p3.dw_com.GetItemDateTime(j,'fecha_devolucion')
	recepcion = t1.p3.dw_com.GetItemString(j,'tipo')
	if recepcion = '1' then // Se recibe
		ret = interseccion(com,per)
	else
		ret = resta(per,com)
		per = ret
	end if
next
if (not isNull(ret.x)) and (not isNull(ret.y)) then
	per = ret
end if

for i = 1 to dw_asig.RowCount()
	man.x = dw_asig.GetItemDateTime(i,'fechaasignacion')
	man.y = dw_asig.GetItemDateTime(i,'fechatraslado')
	ret = interseccion(per,man)
	if (not isNull(ret.x)) and (not isNull(ret.y)) then
		
		for j = 1 to t1.p2.dw_mantto.RowCount()
			tipo = t1.p2.dw_mantto.GetItemString(j,'tipo')
			if tipo = '0' or tipo ='3' then
				man.x = t1.p2.dw_mantto.GetItemDateTime(j,'fecha_inicia')
				man.y = t1.p2.dw_mantto.GetItemDateTime(j,'fecha_termina')
				
				per = interseccion(ret,man)
				if (not isNull(per.x)) and (not isNull(per.y)) then
					mantto = mantto + DaysAfter(date(per.x),date(per.y)) + 1
					if t1.p2.dw_mantto.GetItemString(j,'llevado') = '1' then Continue
					vrmantto = vrmantto + t1.p2.dw_mantto.GetItemNumber(j,'valor')
					t1.p2.dw_mantto.SetItem(j,'llevado','1')
				end if
			elseif t1.p2.dw_mantto.GetItemDateTime(i,'fecha_inicia') >= per.x and t1.p2.dw_mantto.GetItemDateTime(i,'fecha_inicia') <= per.y then
				if t1.p2.dw_mantto.GetItemString(j,'llevado') = '1' then Continue
				if tipo = '1' then
					vrvaloriza = vrvaloriza + t1.p2.dw_mantto.GetItemNumber(j,'valor')
				elseif tipo = '2' then
					vrdesvalor = vrdesvalor + t1.p2.dw_mantto.GetItemNumber(j,'valor')
				end if
				t1.p2.dw_mantto.SetItem(j,'llevado','1')
			end if
		next

		if (not isNull(ret.x)) and (not isNull(ret.y)) then
			dias = DaysAfter(date(ret.x),date(ret.y)) + 1
			t_fecha = RelativeDate(Date(year(date(ret.y)),3,1),-1)
			if month(date(ret.x)) = 2 and day(date(ret.x)) = 1 and t_fecha = date(ret.y) then dias = 30
			if dias = 31 then dias = 30
			dias = dias - mantto
			if dias < 0 then dias = 0
			deprecia = round((valor/vida) * (dias)/30, 0)
			if deprecia <= 0 and vrmantto <= 0 and vrvaloriza <= 0 and vrdesvalor <= 0 then Continue
			if deprecia > vr_x_depreciar + vrmantto + vrvaloriza - vrdesvalor then
				deprecia = round(vr_x_depreciar + vrmantto + vrvaloriza - vrdesvalor,0)
				if deprecia <= 0 and vrmantto = 0 and vrvaloriza = 0 and vrdesvalor = 0 then Continue
			end if
			
			fila = t1.p1.dw_respon.InsertRow(0)
			t1.p1.dw_respon.SetItem(fila,'coddocu',coddoc)
			t1.p1.dw_respon.SetItem(fila,'clugar',lugares)
			t1.p1.dw_respon.SetItem(fila,'placa',placa)
			t1.p1.dw_respon.SetItem(fila,'anyo',year(date(ret.x)))
			t1.p1.dw_respon.SetItem(fila,'mes',month(date(ret.x)))
			t1.p1.dw_respon.SetItem(fila,'item',dw_asig.GetItemNumber(i,'item'))
			t1.p1.dw_respon.SetItem(fila,'dias_depreciados',dias)
			t1.p1.dw_respon.SetItem(fila,'valor_depreciado',deprecia)
			t1.p1.dw_respon.SetItem(fila,'valor_x_depreciar',vr_x_depreciar - deprecia + vrmantto + vrvaloriza - vrdesvalor)
			t1.p1.dw_respon.SetItem(fila,'valor_x_mantto',vrmantto)
			t1.p1.dw_respon.SetItem(fila,'valor_x_valoriza',vrvaloriza)
			t1.p1.dw_respon.SetItem(fila,'valor_x_desvalor',vrdesvalor)
			if month(date(ret.x))=12 then
				l_a=string(year(date(ret.x))+1)
				l_m='01'
			else
				l_a=string(year(date(ret.x)))
				if month(date(ret.x)) <10 then 
					l_m='0'+string(month(date(ret.x))+1)
				else
					l_m=string(month(date(ret.x)))
				end if
			end if
			t_fecha=relativedate(date(l_a+'/'+l_m+'/01'),-1)
			t1.p1.dw_respon.SetItem(fila,'fecha_causacion',t_fecha)
			t1.p1.dw_respon.SetItem(fila,'fecha_audita',datetime(today(),time('0')))
			t1.p1.dw_respon.SetItem(fila,'usuario',usuario)
		end if
	end if
next

Return 0

end function

public function integer calc_deprecia_per2 (integer ano, integer mes, string coddoc, string lugares);decimal vrmantto, vr_x_depreciar, deprecia, valor, vrvaloriza, vrdesvalor
datetime f_servicio
date t_fecha
st_interfec man, ret, per, com
long fila, i, ano_ant, mes_ant, dias, mantto, vida, j, comodato
string placa, recepcion, tipo

placa = dw_lp.GetItemString(dw_lp.GetRow(),'placa')
fila = t1.p1.dw_respon.Find("anyo="+string(ano)+" and mes="+string(mes),1,t1.p1.dw_respon.RowCount())
if fila > 0 then 
	MessageBox('Atención','Periodo ya calculado, año - mes '+string(ano)+' - '+string(mes))
	Return 0
elseif t1.p1.dw_respon.RowCount() > 0 then
	ano_ant = t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'anyo') 
	mes_ant = t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'mes') 
	if string(ano_ant) + string(mes,"00") > string(ano)+string(mes,"00") then
		MessageBox('Atención','El último periodo calculado es posterior al solicitado: año - mes '+string(ano)+' - '+string(mes))
		Return 0
	end if
end if

f_servicio = datetime(date(dw_lp.GetItemDateTime(dw_lp.GetRow(),'fechaservicio')))
valor = dw_lp.GetItemNumber(dw_lp.GetRow(),'vrcompra')
vida  = dw_lp.GetItemNumber(dw_lp.GetRow(),'vidautil')
per.x = datetime(date(ano,mes,1))
if isNull(f_servicio) then
	MessageBox('Atención','La fecha de servicio está en Nulo. ' + placa)
	Return -1
end if
if date(year(date(f_servicio)),month(date(f_servicio)),1) >= date(year(date(per.x)),month(date(per.x)),1) then
	MessageBox('Atención','La fecha de servicio es posterior al periodo a depreciar. ' + placa)
	Return -1
end if

if f_servicio > per.x then
	per.x = f_servicio
end if
per.y = datetime(f_finmes(date(per.x)))

if mes = 1 then
	mes_ant = 12
	ano_ant = ano - 1
else
	mes_ant = mes - 1
	ano_ant = ano
end if

fila = t1.p1.dw_respon.Find("anyo="+string(ano_ant)+" and mes="+string(mes_ant),1,t1.p1.dw_respon.RowCount())
if per.x > f_servicio and fila = 0 then
	if calc_deprecia_per(ano_ant,mes_ant,coddoc,lugares) = -1 then Return -1
end if
fila = t1.p1.dw_respon.Find("anyo="+string(ano_ant)+" and mes="+string(mes_ant),1,t1.p1.dw_respon.RowCount())
if fila = 0 then
	if t1.p1.dw_respon.RowCount() > 0 then
		if t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'valor_x_depreciar') = 0 then
			fila = t1.p1.dw_respon.RowCount()
		end if
	end if
end if

if fila > 0 or per.x = f_servicio then
	
	if fila > 0 then
		vr_x_depreciar = t1.p1.dw_respon.GetItemNumber(fila,'valor_x_depreciar')
	else
		vr_x_depreciar = valor
	end if
	setNull(ret.x)
	setNull(ret.y)
	for j = 1 to t1.p3.dw_com.RowCount()  // Comodato
		com.x = t1.p3.dw_com.GetItemDateTime(j,'fecha_entrega')
		com.y = t1.p3.dw_com.GetItemDateTime(j,'fecha_devolucion')
		recepcion = t1.p3.dw_com.GetItemString(j,'tipo')
		if recepcion = '1' then // Se recibe
			ret = interseccion(com,per)
		else
			ret = resta(per,com)
			per = ret
		end if
	next
	if (not isNull(ret.x)) and (not isNull(ret.y)) then
		per = ret
	end if
	
	dias = DaysAfter(date(per.x),date(per.y)) + 1
	t_fecha = RelativeDate(Date(year(date(per.y)),3,1),-1)
	if month(date(per.x)) = 2 and day(date(per.x)) = 1 and t_fecha = date(per.y) then dias = 30
	if dias = 31 then dias = 30
	
	for i = 1 to t1.p2.dw_mantto.RowCount()
		tipo = t1.p2.dw_mantto.GetItemString(i,'tipo')
		if tipo = '0' then
			man.x = t1.p2.dw_mantto.GetItemDateTime(i,'fecha_inicia')
			man.y = t1.p2.dw_mantto.GetItemDateTime(i,'fecha_termina')
			
			ret = interseccion(per,man)
			if (not isNull(ret.x)) and (not isNull(ret.y)) then
				mantto = mantto + DaysAfter(date(ret.x),date(ret.y)) + 1
				if man.x >= per.x then 
					vrmantto = vrmantto + t1.p2.dw_mantto.GetItemNumber(i,'valor')
				end if
			end if
		elseif t1.p2.dw_mantto.GetItemDateTime(i,'fecha_inicia') >= per.x and t1.p2.dw_mantto.GetItemDateTime(i,'fecha_inicia') <= per.y then
			if tipo = '1' then
				vrvaloriza = vrvaloriza + t1.p2.dw_mantto.GetItemNumber(i,'valor')
			elseif tipo = '2' then
				vrdesvalor = vrdesvalor + t1.p2.dw_mantto.GetItemNumber(i,'valor')
			end if
		end if
	next
	deprecia = round((valor/vida) * (dias - mantto)/30, 0)
	if deprecia > vr_x_depreciar + vrmantto + vrvaloriza - vrdesvalor then
		deprecia = round(vr_x_depreciar + vrmantto + vrvaloriza - vrdesvalor,0)
	end if
	if deprecia > 0 then
		fila = t1.p1.dw_respon.InsertRow(0)
		t1.p1.dw_respon.SetItem(fila,'coddocu',coddoc)
		t1.p1.dw_respon.SetItem(fila,'clugar',lugares)
		t1.p1.dw_respon.SetItem(fila,'placa',placa)
		t1.p1.dw_respon.SetItem(fila,'anyo',year(date(per.x)))
		t1.p1.dw_respon.SetItem(fila,'mes',month(date(per.x)))
		t1.p1.dw_respon.SetItem(fila,'dias_depreciados',dias - mantto)
		t1.p1.dw_respon.SetItem(fila,'valor_depreciado',deprecia)
		t1.p1.dw_respon.SetItem(fila,'valor_x_depreciar',vr_x_depreciar - deprecia + vrmantto + vrvaloriza - vrdesvalor)
		t1.p1.dw_respon.SetItem(fila,'valor_x_mantto',vrmantto)
		t1.p1.dw_respon.SetItem(fila,'valor_x_valoriza',vrvaloriza)
		t1.p1.dw_respon.SetItem(fila,'valor_x_desvalor',vrdesvalor)
		t1.p1.dw_respon.SetItem(fila,'fecha_causacion',datetime(today(),time('0')))
		t1.p1.dw_respon.SetItem(fila,'usuario',usuario)
	end if
	
end if

Return 0

end function

on w_af_deprecia.create
int iCurrent
call super::create
this.pb_cerrar=create pb_cerrar
this.gb_1=create gb_1
this.st_1=create st_1
this.st_2=create st_2
this.pb_buscar=create pb_buscar
this.pb_1=create pb_1
this.dw_d=create dw_d
this.st_4=create st_4
this.t1=create t1
this.em_1=create em_1
this.ddlb_1=create ddlb_1
this.st_3=create st_3
this.dw_lp=create dw_lp
this.pb_2=create pb_2
this.dw_asig=create dw_asig
this.st_5=create st_5
this.dw_alm=create dw_alm
this.cb_tod=create cb_tod
this.dw_lug=create dw_lug
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_cerrar
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.pb_buscar
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.dw_d
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.t1
this.Control[iCurrent+10]=this.em_1
this.Control[iCurrent+11]=this.ddlb_1
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.dw_lp
this.Control[iCurrent+14]=this.pb_2
this.Control[iCurrent+15]=this.dw_asig
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.dw_alm
this.Control[iCurrent+18]=this.cb_tod
this.Control[iCurrent+19]=this.dw_lug
end on

on w_af_deprecia.destroy
call super::destroy
destroy(this.pb_cerrar)
destroy(this.gb_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_buscar)
destroy(this.pb_1)
destroy(this.dw_d)
destroy(this.st_4)
destroy(this.t1)
destroy(this.em_1)
destroy(this.ddlb_1)
destroy(this.st_3)
destroy(this.dw_lp)
destroy(this.pb_2)
destroy(this.dw_asig)
destroy(this.st_5)
destroy(this.dw_alm)
destroy(this.cb_tod)
destroy(this.dw_lug)
end on

event open;t1.p1.dw_respon.SetTransObject(SQLCA)

em_1.Text = string(year(today()))
ddlb_1.SelectItem(month(today()))


end event

event closequery;call super::closequery;if cambio then
	if messageBox('Aviso','El documento nuevo no ha sido guardado. Desea continuar?',QUESTION!,YESNO!) = 2 then
		Return -1
	end if
end if

end event

event resize;call super::resize;//
end event

type pb_grabar from w_center`pb_grabar within w_af_deprecia
boolean visible = false
integer x = 1806
integer y = 1776
integer taborder = 100
boolean enabled = false
boolean originalsize = false
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;
if t1.p1.dw_respon.Update() = -1 then
	Rollback;
	Return
end if

commit;
Return 0

end event

type pb_cerrar from picturebutton within w_af_deprecia
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 3721
integer y = 408
integer width = 142
integer height = 124
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)

end event

type gb_1 from groupbox within w_af_deprecia
integer x = 14
integer y = 196
integer width = 3506
integer height = 616
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Placa"
end type

type st_1 from statictext within w_af_deprecia
integer x = 681
integer y = 296
integer width = 827
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_af_deprecia
boolean visible = false
integer x = 3561
integer y = 548
integer width = 1193
integer height = 276
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccione los activos que desea depreciar y el periodo a aplicar. Los periodos anteriores que no se han calculado, se calcularán automáticamente."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_af_deprecia
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 1559
integer y = 280
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;//openwithParm(w_af_bplaca,sle_1)
end event

type pb_1 from picturebutton within w_af_deprecia
event mousemove pbm_mousemove
string tag = "Cerrar"
boolean visible = false
integer x = 1659
integer y = 1776
integer width = 142
integer height = 124
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular Registro"
end type

event clicked;if t1.p1.dw_respon.RowCount() = 0 then Return
if t1.p1.dw_respon.GetItemString(t1.p1.dw_respon.GetRow(),'estado') = '1' then
	t1.p1.dw_respon.SetItem(t1.p1.dw_respon.GetRow(),'estado','2')
else
	MessageBox('Atención','Solo registros con estado Activo')
end if

end event

type dw_d from datawindow within w_af_deprecia
boolean visible = false
integer x = 123
integer y = 1936
integer width = 677
integer height = 136
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_af_deprecia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type st_4 from statictext within w_af_deprecia
integer x = 110
integer y = 1204
integer width = 421
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mantenimientos"
boolean focusrectangle = false
end type

type t1 from tab within w_af_deprecia
event create ( )
event destroy ( )
integer x = 14
integer y = 872
integer width = 4805
integer height = 1236
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
p1 p1
p2 p2
p3 p3
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.p3=create p3
this.Control[]={this.p1,&
this.p2,&
this.p3}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
destroy(this.p3)
end on

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4768
integer height = 1108
long backcolor = 67108864
string text = "Depreciación"
long tabtextcolor = 33554432
string picturename = "abono.ico"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_4 pb_4
dw_respon dw_respon
end type

on p1.create
this.pb_3=create pb_3
this.pb_4=create pb_4
this.dw_respon=create dw_respon
this.Control[]={this.pb_3,&
this.pb_4,&
this.dw_respon}
end on

on p1.destroy
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.dw_respon)
end on

type pb_3 from picturebutton within p1
event mousemove pbm_mousemove
boolean visible = false
integer x = 4553
integer y = 192
integer width = 142
integer height = 124
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "R"
string picturename = "calculator.gif"
string disabledname = "d_calculator.gif"
alignment htextalign = left!
string powertiptext = "Recalcular depreciación desde Inicio"
end type

event clicked;if messageBox('Atención','Calculará totalmente la depreciación del activo desde su activación. Desea Continuar?',QUESTION!,YESNO!,2) = 2 then Return 0
dw_d.Reset()
if dw_lp.RowCount() > 0 then
	t1.p2.dw_mantto.Retrieve(dw_lp.GetItemString(dw_lp.GetRow(),'placa'))
	calc_deprecia(long(em_1.Text),ddlb_1.FindItem(ddlb_1.Text,0),dw_lp.GetItemString(dw_lp.GetRow(),'coddocu'),dw_lp.GetItemString(dw_lp.GetRow(),'clugar'))
else
	MessageBox('Atención','Seleccione un activo fijo válido')
end if

end event

type pb_4 from picturebutton within p1
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 4553
integer y = 64
integer width = 142
integer height = 124
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Fila"
end type

event clicked;if dw_respon.RowCount() = 0 then Return 0
dw_respon.ScrolltoRow(dw_respon.RowCount())

if dw_respon.GetItemString(dw_respon.RowCount(),'contabil') = '1' then
	MessageBox('Atención','El registro ya ha sido llevado a contabilidad')
	Return -1
end if
if messageBox('Atención','El ULTIMO registro se borrará y se grabarán los cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return 0

dw_respon.DeleteRow(dw_respon.RowCount())
if t1.p1.dw_respon.RowCount() > 0 then
	dw_lp.SetItem(dw_lp.Getrow(),'vractual',t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'valor_x_depreciar'))
	dw_lp.SetItem(dw_lp.Getrow(),'vrmantto',dec(t1.p1.dw_respon.Describe("Evaluate('sum(valor_x_mantto)',0)")))
else
	dw_lp.SetItem(dw_lp.Getrow(),'vractual',dw_lp.GetItemNumber(dw_lp.Getrow(),'vrcompra'))
	dw_lp.SetItem(dw_lp.Getrow(),'vrmantto',0)
end if
if dw_lp.Update() = -1 then
	Rollback;
	Return -1
end if

if dw_respon.Update() = -1 then
	Return -1
end if
commit;

end event

type dw_respon from datawindow within p1
integer x = 50
integer y = 56
integer width = 4471
integer height = 1040
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_deprecia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	this.scrolltoRow(Row)
end if

end event

event itemchanged;string td, doc, n1, n2, a1, a2, rs
datetime dt

if getColumnName() = 'documento' then
	td = GetItemString(GetRow(),'tipodoc')
	if isNull(data) then
		doc = GetItemString(GetRow(),'documento')
	else
		doc = data
	end if
	select nombre1,nombre2,apellido1,apellido2,razon_social into :n1,:n2,:a1,:a2,:rs
	from terceros where tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 1
	elseif SQLCA.SQLCode = 100 THEN
		if MessageBox('Atención','El tercero no existe. Desea crearlo?',QUESTION!,YESNO!,2) = 1 then
			st_general st_p
			st_p.valor = td
			st_p.documento = doc
			openwithparm(w_cfgterceros,st_p)
			select nombre1,nombre2,apellido1,apellido2,razon_social into :n1,:n2,:a1,:a2,:rs
			from terceros where tipodoc=:td and documento=:doc;
		end if
	END IF
	SetItem(GetRow(),'nombre1',n1)
	SetItem(GetRow(),'nombre2',n2)
	SetItem(GetRow(),'apellido1',a1)
	SetItem(GetRow(),'apellido2',a2)
	SetItem(GetRow(),'razon_social',rs)
elseif getColumnName() = 'fecha_inicia' then
	acceptText()
	dt = getItemDateTime(GetRow(),'fecha_termina')
	if not isNull(dt) then
		if GetItemdateTime(GetRow(),'fecha_inicia') > dt then
			setNull(dt)
			MessageBox('Atención','La fecha inicio debe ser mayor que la fecha de terminación')
			SetItem(GetRow(),'fecha_inicia',dt)
			Return 2
		end if
	end if
elseif getColumnName() = 'fecha_termina' then
	acceptText()
	dt = getItemDateTime(GetRow(),'fecha_inicia')
	if not isNull(dt) then
		if GetItemdateTime(GetRow(),'fecha_termina') < dt then
			setNull(dt)
			MessageBox('Atención','La fecha inicio debe ser mayor que la fecha de terminación')
			SetItem(GetRow(),'fecha_termina',dt)
			Return 2
		end if
	end if	
end if

end event

event rowfocuschanged;string coddoc, lugar
long numdoc, item, subitem

if this.RowCount() = 0 then Return

end event

event dberror;Rollback;
Return 0

end event

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4768
integer height = 1108
long backcolor = 67108864
string text = "Manttto / Valoriz.s"
long tabtextcolor = 33554432
string picturename = "control.ico"
long picturemaskcolor = 536870912
dw_mantto dw_mantto
end type

on p2.create
this.dw_mantto=create dw_mantto
this.Control[]={this.dw_mantto}
end on

on p2.destroy
destroy(this.dw_mantto)
end on

type dw_mantto from datawindow within p2
integer x = 41
integer y = 64
integer width = 2139
integer height = 656
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_mantto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
setFilter("estado='1' or estado='3'")

end event

event dberror;Rollback;
Return 0

end event

type p3 from userobject within t1
integer x = 18
integer y = 112
integer width = 4768
integer height = 1108
long backcolor = 67108864
string text = "Comodatos"
long tabtextcolor = 33554432
string picturename = "cambio_resp.ico"
long picturemaskcolor = 536870912
dw_com dw_com
end type

on p3.create
this.dw_com=create dw_com
this.Control[]={this.dw_com}
end on

on p3.destroy
destroy(this.dw_com)
end on

type dw_com from datawindow within p3
integer x = 59
integer y = 64
integer width = 2450
integer height = 668
integer taborder = 80
string title = "none"
string dataobject = "dw_af_com_placa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type em_1 from editmask within w_af_deprecia
integer x = 3566
integer y = 300
integer width = 343
integer height = 88
integer taborder = 70
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
double increment = 1
string minmax = "2000~~2050"
end type

type ddlb_1 from dropdownlistbox within w_af_deprecia
integer x = 3941
integer y = 300
integer width = 434
integer height = 352
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"}
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_af_deprecia
integer x = 3566
integer y = 236
integer width = 489
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Periodo a Calcular"
boolean focusrectangle = false
end type

type dw_lp from datawindow within w_af_deprecia
integer x = 59
integer y = 272
integer width = 3410
integer height = 500
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ls_placa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;if RowCount() = 0 or currentrow = 0 then Return
t1.p1.dw_respon.Reset()
dw_d.Reset()
t1.p2.dw_mantto.Reset()
t1.p1.dw_respon.Retrieve(GetItemString(GetRow(),'placa'))
t1.p2.dw_mantto.Retrieve(GetItemString(GetRow(),'placa'))
t1.p3.dw_com.Retrieve(GetItemString(GetRow(),'placa'))

end event

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			if GetItemString(i,'estado') = '1' then
				SetItem(i,'selec',1)
			else
				SetItem(i,'selec',0)
			end if
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event retrieveend;long i
for i = 1 to RowCount()
	if GetItemString(i,'estado') = '2' then
		SetItem(i,'selec',0)
	end if
next

end event

type pb_2 from picturebutton within w_af_deprecia
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 3570
integer y = 404
integer width = 142
integer height = 124
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "calculator.gif"
string disabledname = "d_calculator.gif"
alignment htextalign = left!
string powertiptext = "Calcular depreciación activos seleccionados"
end type

event clicked;long fila, ult,err_cal
fila = dw_lp.Find("selec=1",1,dw_lp.RowCount())
if fila = 0 then Return 0
if MessageBox('Atención','Se calcularán y grabarán los cambios automáticamente. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return 0
do while fila > 0 
	dw_lp.SetRow(fila)
	err_retrieve = FALSE
	err_cal=0
	if dw_asig.Retrieve(dw_lp.GetItemString(fila,'placa')) < 1 then
		if MessageBox('Atención','El activo '+dw_lp.GetItemString(fila,'placa')+' no ha sido asignado. Desea continuar con los activos seleccionados?',Question!,yesno!) = 2 then Return 0
		Continue
	end if
	if err_retrieve then Return -1
	err_cal=calc_deprecia_per(long(em_1.Text),ddlb_1.FindItem(ddlb_1.Text,0),dw_lp.getitemstring(dw_lp.Getrow(),'coddocu'),dw_lp.getitemstring(dw_lp.Getrow(),'clugar')) 
	if err_cal= -1 then
		Return -1
	end if
	if err_cal= 0 then
		if t1.p1.dw_respon.Update() = -1 then
			Rollback;
			Return -1
		end if
		if t1.p2.dw_mantto.Update() = -1 then
			Rollback;
			Return -1
		end if
		if t1.p1.dw_respon.RowCount() > 0 then
			dw_lp.SetItem(dw_lp.Getrow(),'vractual',t1.p1.dw_respon.GetItemNumber(t1.p1.dw_respon.RowCount(),'valor_x_depreciar'))
		end if
		dw_lp.SetItem(dw_lp.Getrow(),'vrmantto',dec(t1.p1.dw_respon.Describe("Evaluate('sum(valor_x_mantto)',0)")))
		dw_lp.SetItem(dw_lp.Getrow(),'vrvaloriza',dec(t1.p1.dw_respon.Describe("Evaluate('sum(valor_x_valoriza)',0)")))
		dw_lp.SetItem(dw_lp.Getrow(),'vrdesvalor',dec(t1.p1.dw_respon.Describe("Evaluate('sum(valor_x_desvalor)',0)")))
		if dw_lp.Update() = -1 then
			Rollback;
			Return -1
		end if
		commit;
		dw_lp.SetItem(fila,'selec',0)
	end if
	fila = dw_lp.Find("selec=1",1,dw_lp.RowCount())
loop
Return 0

end event

type dw_asig from datawindow within w_af_deprecia
boolean visible = false
integer x = 955
integer y = 1920
integer width = 855
integer height = 140
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_respon"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
SetFilter("estado='1' or estado='2'")

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event retrieveend;datetime f_tmp
long i
	
if rowcount() <= 1 then Return 0
f_tmp = GetItemDateTime(1,'fechaasignacion')
for i = 2 to rowcount()
	SetItem(i,'fechatraslado',datetime(relativeDate(date(f_tmp), -1)))
	if GetItemDateTime(i,'fechatraslado') < GetItemDateTime(i,'fechaasignacion') then
		if DaysAfter(date(GetItemDatetime(i,'fechatraslado')),date(GetItemDatetime(i,'fechaasignacion'))) = 1 then
			SetItem(i,'fechatraslado',datetime(f_tmp))
		else
			MessageBox('Atención','Error en fechas de asignación de responsable. Fecha Traslado posterior a fecha Asignación. Placa '+GetItemString(i,'placa')+'   '+string(GetItemDateTime(i,'fechatraslado'))+string(GetItemDateTime(i,'fechaasignacion')))
			err_retrieve = TRUE
			Return -1
		end if
	end if
	f_tmp = GetItemDateTime(i,'fechaasignacion')
next

end event

type st_5 from statictext within w_af_deprecia
integer x = 1408
integer y = 28
integer width = 279
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacén:"
boolean focusrectangle = false
end type

type dw_alm from datawindow within w_af_deprecia
integer x = 1413
integer y = 92
integer width = 1157
integer height = 72
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
InsertRow(0)

end event

event itemchanged;if AcceptText() = -1 then Return 0
dw_lp.Retrieve(GetItemString(1,1))

end event

type cb_tod from checkbox within w_af_deprecia
integer x = 2638
integer y = 84
integer width = 558
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos Almacenes"
end type

event clicked;if cb_tod.checked=TRUE then
	dw_alm.enabled=false
	dw_lp.Retrieve('%')
else
	dw_alm.enabled=true
end If
end event

type dw_lug from datawindow within w_af_deprecia
integer x = 41
integer y = 32
integer width = 1326
integer height = 132
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_lugar_sumi"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
dw_lug.GetChild('codlugar', dwc_lugar)
dwc_lugar.settransobject(sqlca)

dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)
if dwc_lugar.retrieve(USUARIO)= 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(1)
else
	setitem(1,1,clugar)
	if dwc_alm.Retrieve(usuario,'%',clugar) = 0 then
		dw_alm.setitem(1,'codalmacen','')
		messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
		dw_alm.InsertRow(0)
	end if
	dw_alm.InsertRow(1)
end if
end event

event itemchanged;string ls_clugar
ls_clugar=data
if dwc_alm.Retrieve(usuario,'%',ls_clugar) = 0 then
	dw_alm.setitem(row,'codalmacen','')
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(0)
end if
dw_alm.setitem(1,1,'')
dw_alm.InsertRow(0)
end event

