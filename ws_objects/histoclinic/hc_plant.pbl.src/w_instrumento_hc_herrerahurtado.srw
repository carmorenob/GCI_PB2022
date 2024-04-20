$PBExportHeader$w_instrumento_hc_herrerahurtado.srw
forward
global type w_instrumento_hc_herrerahurtado from window
end type
type dw_calc_edad from datawindow within w_instrumento_hc_herrerahurtado
end type
type tab_1 from tab within w_instrumento_hc_herrerahurtado
end type
type tp_1 from userobject within tab_1
end type
type dw_1 from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
dw_1 dw_1
end type
type tp_2 from userobject within tab_1
end type
type dw_2 from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
dw_2 dw_2
end type
type tp_3 from userobject within tab_1
end type
type dw_3 from datawindow within tp_3
end type
type tp_3 from userobject within tab_1
dw_3 dw_3
end type
type tab_1 from tab within w_instrumento_hc_herrerahurtado
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
type pb_ok from picturebutton within w_instrumento_hc_herrerahurtado
end type
type pb_cancelar from picturebutton within w_instrumento_hc_herrerahurtado
end type
type dw_result from datawindow within w_instrumento_hc_herrerahurtado
end type
end forward

global type w_instrumento_hc_herrerahurtado from window
integer width = 3483
integer height = 2504
boolean titlebar = true
string title = "Instrumento Herrera y Hurtado"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_calc_edad dw_calc_edad
tab_1 tab_1
pb_ok pb_ok
pb_cancelar pb_cancelar
dw_result dw_result
end type
global w_instrumento_hc_herrerahurtado w_instrumento_hc_herrerahurtado

type variables
st_xa_graficas i_stde

int ii_Rango_edad,ii_prec,ii_hiper,ii_abor,ii_infer,ii_hep,ii_rpl,ii_pesome,ii_pesoma,ii_panor,ii_aqx
int ii_efrc,ii_dbpre,ii_semanas_gestacion,ii_paridad
st_edad_meses_dias ist_edad

boolean ibn_new,ibn_cambio

date id_fechaEvalua

constant string is_data_result='1	HISTORIA REPRODUCTIVA~r~n2	EMBARAZO ACTUAL~r~n3	RIESGOS PSICOSOCIALES'

//Embarazo Actual
constant string is_data_HR='1	Edad~r~n&
2	Paridad~r~n&
3	Cesarea Previa~r~n&
4	Preeclampsia o hipertensión~r~n&
5	Abortos recurrentes o infertilidad~r~n&
6	Hemorragia postparto o remoción manual de placenta~r~n&
7	Peso del recién nacido < 2500g o > 4000g~r~n&
8	Mortalidad fetal tardía o neonatal temprana~r~n&
9	Trabajo de parto anormal o dificultoso~r~n&
10	Cirugía ginecológica previa'

constant string is_data_EA='1	Enferemedad Renal Crónica~t2~r~n&
2	Diabetes preconcepcional~t3~r~n&
3	Hipertensión arterial~t2~r~n&
4	Diabetes gestacional~t2~r~n&
5	Hemorragia < 20 semanas~t1~r~n&
6	Hemorragia ≥ 20 semanas~t2~r~n&
7	Anemia (Hb < 10 g/l)~t1~r~n&
9	Embarazo prolongado (> 42 semanas)~t1~r~n&
9	Polihidramnios~t2~r~n&
10	Embarazo múltiple~t3~r~n&
11	Presentación de frente o transversa~t3~r~n&
12	Isoinmunización~t3'

//Riesgo psicosocial
constant string is_data_RPS='1	Ansiedad Severa~tTensión emocional~tLlanto fácil~t0~r~n&
2	Ansiedad Severa~tTensión emocional~tTensión muscular~t0~r~n&
3	Ansiedad Severa~tTensión emocional~tTemblor~t0~r~n&
4	Ansiedad Severa~tTensión emocional~tNo poder quedarse quieta en un solo sitio~t0~r~n&
5	Ansiedad Severa~tTensión emocional~tIncapaz de relajarse~t0~r~n&
6	Ansiedad Severa~tTensión emocional~tTensión muscular~t0~r~n&
7	Ansiedad Severa~tSíntomas de humor depresivo~tInsomnio~t0~r~n&
8	Ansiedad Severa~tSíntomas de humor depresivo~tFalta de interés~t0~r~n&
9	Ansiedad Severa~tSíntomas de humor depresivo~tNo disfruta pasatiempos~t0~r~n&
10	Ansiedad Severa~tSíntomas de humor depresivo~tDepresión~t0~r~n&
11	Ansiedad Severa~tSíntomas de humor depresivo~tVariaciones de humor durante el día~t~r~n&
12	Ansiedad Severa~tSíntomas neurovegetativos~tTranspiración excesiva~t0~r~n&
13	Ansiedad Severa~tSíntomas neurovegetativos~tBoca seca~t0~r~n&
14	Ansiedad Severa~tSíntomas neurovegetativos~tCefalea de tensión~t0~r~n&
16	Soporte Social Familiar~tSatisfacción~tEstá satisfecha con el apoyo y la ayuda que recibe de su familia durante este embarazo~t0~r~n&
17	Soporte Social Familiar~tSoporte Social familiar inadecuado~tEstá satisfecha con la forma en que comparte con la familia y compañero el tiempo~t1~r~n&
18	Soporte Social Familiar~tSoporte Social familiar inadecuado~tEstá satisfecha con la forma en que comparte con la familia y compañero el dinero~t1~r~n&
19	Soporte Social Familiar~tSoporte Social familiar inadecuado~tEstá satisfecha con la forma en que comparte con la familia y compañero el espacio~t1~r~n'

end variables

forward prototypes
public function integer wf_rango_edad (integer ai_meses, integer ai_dias)
public function string wf_valores_json (datawindow adw_valores)
public subroutine wf_set_json_data (string as_json, integer ai_fila, ref datawindow adw_valores)
public function st_edad_meses_dias wf_edad_meses_dias (date ad_nace, date ad_fecha_evaluacion, integer ai_semanas_gestacion)
public function integer wf_meses_faltantes (integer ai_semanas_faltantes, integer ai_dias_edad)
public subroutine wf_valores (integer ai_cual)
end prototypes

public function integer wf_rango_edad (integer ai_meses, integer ai_dias);if ai_dias>30 then 
	return -1
elseif ai_meses=0 and ai_dias>0 then 
	return 1
elseif (ai_meses>=1 and ai_meses<3) then 
	return 2
elseif (ai_meses>=3 and ai_meses<6) then 
	return 3
elseif (ai_meses>=6 and ai_meses<9) then 
	return 4
elseif (ai_meses>=9 and ai_meses<12) then 
	return 5
elseif (ai_meses>=12 and ai_meses<18) then 
	return 6
elseif (ai_meses>=18 and ai_meses<24) then 
	return 7
elseif (ai_meses>=24 and ai_meses<36) then 
	return 8
elseif (ai_meses>=36 and ai_meses<48) then 
	return 9
elseif (ai_meses>=48 and ai_meses<60) then 
	return 10
elseif (ai_meses>=60 and ai_meses<72) then 
	return 11
elseif (ai_meses>=72 and ai_meses<84) then 
	return 12
end if
return -1

end function

public function string wf_valores_json (datawindow adw_valores);string ls_json="["
int j
adw_valores.setredraw(false)

for j=1 to adw_valores.rowcount()
	if adw_valores.dataobject="dw_instrum_vale_ce" then
		ls_json+='{"item":'+string(adw_valores.getitemnumber(j,'item')) + ',"presencia":'+string(adw_valores.getitemnumber(j,'presencia'))+',"integridad":'+string(adw_valores.getitemnumber(j,'integridad'))+'}'
	else
		ls_json+='{"item":'+string(adw_valores.getitemnumber(j,'item')) + ',"respuesta":'+string(adw_valores.getitemnumber(j,'respuesta'))+'}'
	end if
	if j<adw_valores.rowcount() then ls_json+=','
next
ls_json+="]"
return ls_json

end function

public subroutine wf_set_json_data (string as_json, integer ai_fila, ref datawindow adw_valores);jsonpackage lnv_json
datastore lds_import_json
int j

lds_import_json=create datastore
lds_import_json.dataobject="dw_import_json_hh"

lnv_json=create jsonpackage
lnv_json.loadString(as_json)

j=lds_import_json.importJson(lnv_json.getValue("valores"))
	
for j=1 to lds_import_json.rowcount()
	
	if  adw_valores.dataobject='dw_instrum_hh_ro' then
		
		adw_valores.setitem(lds_import_json.getitemnumber(j,'nro_item'),'bloquear',0)
		adw_valores.expand(lds_import_json.getitemnumber(j,'nro_item'),1)
		adw_valores.setitem(lds_import_json.getitemnumber(j,'nro_item'),'respuesta',lds_import_json.getitemnumber(j,'respuesta'))
		
	elseif adw_valores.dataobject='dw_instrum_hh_rpsico' then
		adw_valores.setitem(lds_import_json.getitemnumber(j,'nro_item'),'presencia',lds_import_json.getitemnumber(j,'respuesta'))
		adw_valores.setitem(lds_import_json.getitemnumber(j,'nro_item'),'integridad',lds_import_json.getitemnumber(j,'respuesta2'))
		
	else
		adw_valores.setitem(lds_import_json.getitemnumber(j,'nro_item'),'respuesta',lds_import_json.getitemnumber(j,'respuesta'))
		
	end if
next

dw_result.setitem(ai_fila,'resultado',lnv_json.getvalueNumber("resultado"))

destroy lds_import_json
destroy lnv_json
end subroutine

public function st_edad_meses_dias wf_edad_meses_dias (date ad_nace, date ad_fecha_evaluacion, integer ai_semanas_gestacion);st_edad_meses_dias lst_edad
int li_restar_meses,li_restar_anyos,li_restar_dias

if day(ad_fecha_evaluacion)<day(ad_nace) then
	li_restar_meses=1
	lst_edad.dias=30 + day(ad_fecha_evaluacion) - day(ad_nace)
else
	lst_edad.dias=day(ad_fecha_evaluacion) - day(ad_nace)
end if
if month(ad_fecha_evaluacion) - li_restar_meses < month(ad_nace) then
	li_restar_anyos=1
	lst_edad.meses=12 + month(ad_fecha_evaluacion) - li_restar_meses - month(ad_nace)
else
	lst_edad.meses= month(ad_fecha_evaluacion) - li_restar_meses - month(ad_nace)
end if
lst_edad.anyos=year(ad_fecha_evaluacion) - li_restar_anyos - year(ad_nace)

if ((lst_edad.anyos=2 and lst_edad.meses=0 and lst_edad.dias=0) or lst_edad.anyos<2) and ai_semanas_gestacion<40 then
	li_restar_dias= (40 - ai_semanas_gestacion)*7
	li_restar_anyos=0
	if lst_edad.dias<li_restar_dias then
		li_restar_meses= wf_meses_faltantes( 40 - ai_semanas_gestacion , lst_edad.dias)
		
		lst_edad.dias = (li_restar_meses*30) + lst_edad.dias - li_restar_dias
		
		if lst_edad.meses>li_restar_meses then
			lst_edad.meses -= li_restar_meses
		else
			li_restar_anyos=1
			lst_edad.meses= 12 + lst_edad.meses - li_restar_meses
		end if
		lst_edad.anyos -= li_restar_anyos
	else
		lst_edad.dias -= li_restar_dias
	end if
	
end if

return lst_edad
end function

public function integer wf_meses_faltantes (integer ai_semanas_faltantes, integer ai_dias_edad);int li_dias_faltan,li_meses_faltan

li_dias_faltan=ai_semanas_faltantes*7
li_meses_faltan=int(li_dias_faltan/30)

if (li_meses_faltan*30)+ai_dias_edad<=li_dias_faltan then li_meses_faltan++

return li_meses_faltan
end function

public subroutine wf_valores (integer ai_cual);if ai_cual=1 then
	dw_result.setitem(1,'resultado',tab_1.tp_1.dw_1.getitemnumber(1,'total'))
elseif ai_cual=2 then
	dw_result.setitem(2,'resultado', tab_1.tp_2.dw_2.getitemnumber(1,'total') )
elseif ai_cual=3 then
	dw_result.setitem(3,'resultado', tab_1.tp_3.dw_3.getitemnumber(1,'total') )
end if
end subroutine

on w_instrumento_hc_herrerahurtado.create
this.dw_calc_edad=create dw_calc_edad
this.tab_1=create tab_1
this.pb_ok=create pb_ok
this.pb_cancelar=create pb_cancelar
this.dw_result=create dw_result
this.Control[]={this.dw_calc_edad,&
this.tab_1,&
this.pb_ok,&
this.pb_cancelar,&
this.dw_result}
end on

on w_instrumento_hc_herrerahurtado.destroy
destroy(this.dw_calc_edad)
destroy(this.tab_1)
destroy(this.pb_ok)
destroy(this.pb_cancelar)
destroy(this.dw_result)
end on

event open;i_stde=message.powerobjectparm

int j 

DW_RESULT.IMPORTsTRING(is_data_result)

if i_stde.json="" or isnull(i_stde.json) then 
	ibn_new=true
	id_fechaEvalua=today()
	
	///---Paridad
	SELECT numero into :ii_paridad
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='1' and cod_alergia='3';
		
	///---Preeclampsia
	SELECT cast(texto as integer) into :ii_prec
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='2' and cod_alergia='1';
	///Hipertension
	SELECT cast(texto as integer) into :ii_hiper
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='1';	
	///---Aborto recurrente
	SELECT cast(texto as integer) into :ii_abor
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='2' and cod_alergia='8';
	///infertilidad
	SELECT cast(texto as integer) into :ii_infer
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='2' and cod_alergia='9';	
	///---Hemorragia Postparto
	SELECT cast(texto as integer) into :ii_hep
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='2' and cod_alergia='6';
	///Remocion de placenta
	SELECT cast(texto as integer) into :ii_rpl	
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='2' and cod_alergia='10';	

	///---Peso menor 2500
	SELECT cast(texto as integer) into :ii_pesome
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='1' and cod_alergia='11';
	///Remocion de placenta
	SELECT cast(texto as integer) into :ii_pesoma
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='2' and cod_alergia='10';	
	///---trabjo anormal
	SELECT cast(texto as integer) into :ii_panor
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='2' and cod_alergia='11';
	/// QX anteriores
	SELECT Sum(1) into :ii_aqx
	FROM pacientes_antecedente INNER JOIN proced ON pacientes_antecedente.codproced = proced.codproced
	WHERE 
		(((tipodoc)=:tipdoc) AND ((documento)=:docu) AND ((pacientes_antecedente.cod_tipoa)='AN4') 
		AND ((proced.cd_grupo) In ('65','66','67','68','69','70','71','72','73','74','75')));

	///---enfermedad renal
	SELECT cast(texto as integer) into :ii_efrc
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='10';
	///---Diabetes preconcepcional
	SELECT cast(texto as integer) into :ii_dbpre
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='2';	
	//edad gestacional
	if isnull(ii_semanas_gestacion) or ii_semanas_gestacion=0 then ii_semanas_gestacion=40
	ist_edad=wf_edad_meses_dias(date(i_stde.fecha),id_fechaEvalua,ii_semanas_gestacion)
else
	jsonpackage lnv_json,lnv_json2

	lnv_json2=create jsonpackage
	lnv_json= create jsonpackage
	lnv_json.loadstring(i_stde.json)
	
	id_fechaEvalua=lnv_json.GetValueDate("fecha_evaluacion")
	ii_semanas_gestacion=lnv_json.getValueNumber("semanas_gestacion")
	
	lnv_json2.loadString(lnv_json.getValue("edad"))
	lnv_json2.GetJsonString()
	ist_edad.anyos=lnv_json2.getValueNumber("años")
	ist_edad.meses=lnv_json2.getValueNumber("meses")
	ist_edad.dias=lnv_json2.getValueNumber("dias")
	
end if

dw_calc_edad.setitem(1,'fecha_nace',i_stde.fecha)
dw_calc_edad.setitem(1,'fecha_evalua',id_fechaEvalua)
if ist_edad.anyos<=2 then dw_calc_edad.setitem(1,'edad_gestacional',ii_semanas_gestacion)
dw_calc_edad.setitem(1,'edad_anyos',ist_edad.anyos)
dw_calc_edad.setitem(1,'edad_meses',ist_edad.meses)
dw_calc_edad.setitem(1,'edad_dias',ist_edad.dias)

ii_Rango_edad=wf_rango_edad( ist_edad.anyos * 12 + ist_edad.meses , ist_edad.dias)

tab_1.tp_1.dw_1.importString(is_data_HR)
tab_1.tp_2.dw_2.importString(is_data_EA)
tab_1.tp_3.dw_3.importString(is_data_RPS)

if ist_edad.anyos<=16 then tab_1.tp_1.dw_1.setitem(1,'respuesta1',1)
if ist_edad.anyos>16 and ist_edad.anyos<=35 then tab_1.tp_1.dw_1.setitem(1,'respuesta1',0)
if ist_edad.anyos>35 then tab_1.tp_1.dw_1.setitem(1,'respuesta1',2)

//si hay JSON de entrada, "pintar" los datos en los DW
if not ibn_new then
	wf_set_json_data( lnv_json.getvalue( "HR"), 1 , tab_1.tp_1.dw_1)
	wf_set_json_data( lnv_json.getvalue( "VI"), 3 , tab_1.tp_2.dw_2)
	wf_set_json_data( lnv_json.getvalue( "RPS"), 2 , tab_1.tp_3.dw_3)

	
	destroy lnv_json2
	destroy lnv_json
end if

/// HISTORIA REPRODUCTIVA	
if ii_paridad=0 then 
		tab_1.tp_1.dw_1.setitem(2,'respuesta2',1)
	else
		if ii_paridad>=1 and ii_paridad<4 then
			tab_1.tp_1.dw_1.setitem(2,'respuesta2',0)
		else
			tab_1.tp_1.dw_1.setitem(2,'respuesta2',2)
		end if
	end if
if ii_prec= 1 or ii_hiper=1 then
	tab_1.tp_1.dw_1.setitem(4,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(4,'respuesta',0)
end if

if ii_abor= 1 or ii_infer=1 then
	tab_1.tp_1.dw_1.setitem(5,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(5,'respuesta',0)
end if

if ii_hep= 1 or ii_rpl=1 then
	tab_1.tp_1.dw_1.setitem(6,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(6,'respuesta',0)
end if
if ii_pesoma= 1 or ii_pesome=1 then
	tab_1.tp_1.dw_1.setitem(7,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(7,'respuesta',0)
end if
if ii_panor=1 then
	tab_1.tp_1.dw_1.setitem(9,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(9,'respuesta',0)
end if						
if ii_aqx >=1 then
	tab_1.tp_1.dw_1.setitem(10,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(10,'respuesta',0)
end if	

//// EMBARAZO ACTUAL
if ii_efrc =1 then
	tab_1.tp_2.dw_2.setitem(1,'respuesta',1)
else
	tab_1.tp_2.dw_2.setitem(1,'respuesta',0)
end if	
if ii_dbpre =1 then
	tab_1.tp_2.dw_2.setitem(2,'respuesta',1)
else
	tab_1.tp_2.dw_2.setitem(2,'respuesta',0)
end if	
if ii_hiper=1 then
	tab_1.tp_2.dw_2.setitem(3,'respuesta',1)
else
	tab_1.tp_2.dw_2.setitem(3,'respuesta',0)
end if

tab_1.tp_1.dw_1.triggerevent(itemchanged!)
tab_1.tp_2.dw_2.triggerevent(itemchanged!)
tab_1.tp_3.dw_3.triggerevent(itemchanged!)
end event

type dw_calc_edad from datawindow within w_instrumento_hc_herrerahurtado
integer x = 55
integer y = 28
integer width = 3031
integer height = 144
integer taborder = 30
string title = "none"
string dataobject = "dw_edad_instrumentos"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
end event

type tab_1 from tab within w_instrumento_hc_herrerahurtado
integer x = 32
integer y = 184
integer width = 3410
integer height = 1768
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
end on

type tp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3374
integer height = 1640
long backcolor = 67108864
string text = "Historia Reproductiva"
long tabtextcolor = 33554432
string picturename = "robstetrico.ico"
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tp_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tp_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tp_1
integer y = 12
integer width = 3360
integer height = 1600
integer taborder = 20
string dataobject = "dw_instrum_hh_hr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;accepttext()
groupcalc()
ibn_cambio=true
post wf_valores(1)
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3374
integer height = 1640
long backcolor = 67108864
string text = "Embarazo Actual"
long tabtextcolor = 33554432
string picturename = "rhhotros.ico"
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tp_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tp_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tp_2
integer x = 41
integer y = 28
integer width = 3319
integer height = 1592
integer taborder = 30
string dataobject = "dw_instrum_hh_ro"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;accepttext()
groupcalc()
post wf_valores(2)


end event

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3374
integer height = 1640
long backcolor = 67108864
string text = "Riesgo Psicosocial"
long tabtextcolor = 33554432
string picturename = "rpsicosocial.ico"
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tp_3.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tp_3.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tp_3
integer y = 12
integer width = 3365
integer height = 1616
integer taborder = 30
string dataobject = "dw_instrum_hh_rpsico"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;accepttext()
if getitemnumber(1,'soporteinadecuado')=1 then 
	dw_3.setitem(16,'respuesta1',1)
	dw_3.setitem(17,'respuesta1',1)
	dw_3.setitem(18,'respuesta1',1)	
end if
accepttext()
ibn_cambio=true
groupcalc()
post wf_valores(3)

end event

type pb_ok from picturebutton within w_instrumento_hc_herrerahurtado
integer x = 3205
integer y = 2012
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;int ll_donde, j 
string sale
datawindow l_dw
l_dw=tab_1.tp_3.dw_3

if l_dw.find('(isnull(respuesta) or isnull(respuesta1)) and bloquea=0',1,l_dw.rowcount())>0 then
	Messagebox("Atención","Debe completar la evaluación de la Pestaña Items de Valoración")
	tab_1.selectedtab=3
	l_dw.setfocus()
	return
end if

jsonpackage lnv_json,lnv_json2
lnv_json = create jsonpackage
lnv_json2=create jsonpackage

i_stde.cambio=ibn_cambio
if ibn_cambio then
	i_stde.json=lnv_json.GetJsonString()
end if
setnull(i_stde.instr1)
if dw_result.getitemnumber(1,'total')>= 3 then
	sale='ALTO RIESGO PSICOSOCIAL ≥ 3 ---> Total' + string(dw_result.getitemnumber(1,'total')) 
	i_stde.instr1='ALTO RIESGO'
else
	sale='RIESGO BAJO < 3 ---> Total' + string(dw_result.getitemnumber(1,'total')) 
	i_stde.instr1='RIESGO BAJO'	
end if
i_stde.texto=sale

closewithreturn(parent,i_stde)

destroy lnv_json2
destroy lnv_json
end event

type pb_cancelar from picturebutton within w_instrumento_hc_herrerahurtado
event mousemove pbm_mousemove
integer x = 3205
integer y = 2148
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type dw_result from datawindow within w_instrumento_hc_herrerahurtado
integer x = 398
integer y = 2004
integer width = 2597
integer height = 352
integer taborder = 20
string title = "none"
string dataobject = "dw_instrum_hh_results"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

