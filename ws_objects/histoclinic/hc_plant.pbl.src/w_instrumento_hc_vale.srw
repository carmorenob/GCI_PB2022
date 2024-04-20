$PBExportHeader$w_instrumento_hc_vale.srw
forward
global type w_instrumento_hc_vale from window
end type
type dw_calc_edad from datawindow within w_instrumento_hc_vale
end type
type tab_1 from tab within w_instrumento_hc_vale
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
type tab_1 from tab within w_instrumento_hc_vale
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
type pb_ok from picturebutton within w_instrumento_hc_vale
end type
type pb_cancelar from picturebutton within w_instrumento_hc_vale
end type
type dw_result from datawindow within w_instrumento_hc_vale
end type
end forward

global type w_instrumento_hc_vale from window
integer width = 3451
integer height = 2516
boolean titlebar = true
string title = "Cuestionario VALE"
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
global w_instrumento_hc_vale w_instrumento_hc_vale

type variables
st_xa_graficas i_stde

int ii_Rango_edad,ii_bpeso,ii_semanas_gestacion,ii_compli,ii_hospi,ii_medic,ii_csocial
st_edad_meses_dias ist_edad

boolean ibn_new,ibn_cambio

date id_fechaEvalua

constant string is_data_result='1	RIESGOS GENERALES~r~n2	CONDICIONES ESTRUCTURALES~r~n3	VALORACIÓN DE LOS ITEMS'

//riesgos generales
constant string is_data_RG='1	Bajo peso al nacer (menor de 1500 gr)~r~n&
2	Nació antes de las 30 semanas de gestación (Prematuro extremo)~r~n&
3	Estancia superior a 30 días en la unidad de cuidados intensivos neonatales~r~n&
4	¿Antes, durante o poco después del nacimiento hubo alguna complicación?~r~n&
5	¿El niño / niña ha sido diagnosticado(a) con alguna condición de salud? ¿cuál diagnóstico?~r~n&
6	¿Hay alguna condición de riesgo social (maltrato, abandono, otras) en la que se encuentre el niño?~r~n&
7	¿El niño presenta dificultades en el aprendizaje de la lectura y la escritura o en su desempeño escolar?'

//condiciones estructurales
constant string is_data_CE='1	Orejas~r~n&
2	Labios~r~n&
3	Lengua~r~n&
4	Nariz~r~n&
5	Paladar~r~n&
6	Ojos~r~n&
7	Dientes (acorde a la edad)~r~n&
8	Cuello~r~n&
9	Hombros'

//items de valoración
constant string is_data_IV='1	0~t3~tComprensión~tCuando en casa se cierra una puerta, se cae un objeto o se escucha un ruido muy fuerte ¿el bebé se mueve, se queda quieto o llora?~r~n&
2	0~t3~tExpresión~t¿Usted siente diferencias en el llanto del bebé dependiendo si es por hambre, por sueño, porque está mojado, o de mal humor?~r~n&
3	0~t3~tExpresión~t¿El bebé succiona con fuerza el alimento u otros objetos?~r~n&
4	0~t3~tInteracción comunicativa~tCuando le habla al bebé, ¿él/ella la/lo mira?~r~n&
5	4~t6~tComprensión~tCuando se escucha una puerta, timbre u otro sonido familiar ¿el bebé voltea la cabeza buscando el sonido?~r~n&
6	4~t6~tExpresión~tCuando alguien le dice repeticiones de gestos y vocalizaciones como vocales “aaa”, “eee” o sílabas mamama o papapa ¿el bebé intenta emitir sonidos similares?~r~n&
7	4~t6~tInteracción comunicativa~tCuando interactúa, juega, canta, habla con su bebé, ¿él/ella hace sonidos o sonríe?~r~n&
8	7~t9~tComprensión~tCuando usted le canta o le conversa ¿el bebé muestra interés?~r~n&
9	7~t9~tExpresión~tCuando el bebé quiere algo, ¿utiliza sonidos, sílabas palabras o gestos para solicitarlo?~r~n&
10	7~t9~tInteracción comunicativa~tCuando el bebé tiene alguna necesidad (por ejemplo, quiere algo, está incómodo o tiene hambre), ¿emite balbuceos, sonidos, señala o llora, para satisfacerla?~r~n&
11	10~t12~tComprensión~tCuando las personas le hablan, ¿el niño/a les presta atención?~r~n&
12	10~t12~tExpresión~tCuando le dicen palabras nuevas, ¿el niño/a trata de imitarlas?~r~n&
13	10~t12~tExpresión~tEl niño/a consume alimentos como papillas, jugos espesos, o galletas diariamente~r~n&
14	10~t12~tInteracción comunicativa~tCuando el niño/a quiere algún objeto (por ejemplo, un juguete) ¿lo señala y/o hace sonidos para obtenerlo?~r~n&
15	13~t15~tComprensión~tCuando usted le pide al niño/a que le muestre los ojos, la nariz, u otra parte del cuerpo (que él conozca) ¿lo hace?~r~n&
16	13~t15~tExpresión~t¿El niño/a produce sonidos de animales o de objetos conocidos, por ejemplo, gato, vaca, teléfono, etc.?~r~n&
17	13~t15~tInteracción comunicativa~t¿El niño/a toma y trae un objeto cuando quiere jugar con usted?~r~n&
18	16~t18~tComprensión~t ¿El niño/a ejecuta acciones u órdenes sencillas cuando alguien se las solicita? Por ejemplo: “donde está la abuela”~r~n&
19	16~t18~tExpresión~t¿El niño/a dice el nombre de diferentes objetos cotidianos cuando se le pregunta “Qué es esto?”~r~n&
20	16~t18~tInteracción comunicativa~t¿El niño/a pide cosas usando palabras, sílabas o sonidos vocálicos?~r~n&
21	19~t24~tComprensión~t¿El niño/a entiende y ejecuta órdenes? por ejemplo si le dicen: "Trae la cuchara de la cocina"~r~n&
22	19~t24~tExpresión~t¿El niño/a dice cada vez más palabras, incluyendo: “Yo, mío, no, arriba, abajo” y nombres de objetos y acciones cotidianas?~r~n&
23	19~t24~tInteracción comunicativa~t¿El niño/a produce sonidos, sílabas y palabras, acompañadas de gestos, señalamientos, miradas y entonaciones de habla cuando quiere interactuar con otros?~r~n&
24	25~t36~tComprensión~t¿El niño/a utiliza palabras como “Mío, tuyo, suyo, etc.” cuando se le pregunta a quién pertenece algún objeto conocido, por ejemplo: “De quién es esta camisa, ¿de quién es este muñeco?”~r~n&
25	25~t36~tExpresión~t¿El niño/a se mueve, se emociona, canta, aplaude, cuando le ponen música?~r~n&
26	25~t36~tExpresión~t¿El niño/a muerde alimentos duros (por ejemplo, galletas) y los come sin atorarse?~r~n&
27	25~t36~tInteracción comunicativa~t¿El niño/a se muestra interesado por comunicarse, por interactuar, conversar y jugar con otros niños de su edad, en diferentes situaciones?~r~n&
28	37~t48~tComprensión~tEn narraciones de hechos, cuentos o historias ¿el niño/a responde a preguntas de Qué, ¿Cómo, ¿Cuándo, etc.?~r~n&
29	37~t48~tExpresión~t¿El niño/a hace preguntas cuando se presenta una situación nueva para él?~r~n&
30	37~t48~tInteracción comunicativa~t¿El niño/a expresa sus sentimientos, pensamientos, emociones, ideas cuando interactúa con personas cercanas?~r~n&
31	49~t60~tComprensión~t¿El niño/a sabe y repite rondas, canciones, cuentos, historias cortas o fragmentos?~r~n&
32	49~t60~tExpresión~t¿El niño/a habla utilizando frases de al menos cuatro palabras para contar hechos o expresar diferentes situaciones?~r~n&
33	49~t60~tInteracción comunicativa~tEl niño/a comprende y responde cuando las personas saludan, se despiden, dicen “gracias” o "por favor"?~r~n&
34	61~t108~tComprensión~tEl niño/a cumple con varias indicaciones que se le dan al mismo tiempo, por ejemplo, cuando usted le dice: “Primero te pones de pie, luego vas corriendo hasta la puerta y después das dos golpes con la mano” o “Trae el caballito, ponlo en el corral y dale de comer”~r~n&
35	61~t108~tExpresión~t¿Cuándo el niño/a habla o cuenta una historia se entiende claramente lo que dice y pronuncia bien todos los sonidos?~r~n&
36	61~t108~tInteracción comunicativa~t ¿El niño/a sostiene conversaciones con familiares y no familiares para expresar opiniones e intentar convencer de sus ideas a los demás?~r~n&
37	109~t155~tComprensión~t¿El niño/a identifica errores, se ríe de errores e intenta corregirlos, cuando alguien los dice, por ejemplo, "la pelota tiene patas" “por la noche me como el desayuno”?~r~n&
38	109~t155~tExpresión~t¿El niño/a habla y explica el porqué de diversas situaciones, sentimientos y pensamientos utilizando palabras abstractas como orgullo, valor, amar, etc.?~r~n&
39	109~t155~tInteracción comunicativa~t¿El niño/a conversa con otros de diferentes temas, escuchando sus ideas y expresando con argumentos su acuerdo o desacuerdo?~r~n&
40	36~t60~tVestibular~t¿El niño/a disfruta actividades de movimientos del cuerpo como columpiarse, girar, dar botes, saltar?~r~n&
41	36~t60~tVestibular~t¿El niño/a camina recto, sin inclinarse hacia los lados y sin caerse constantemente?~r~n&
42	61~t155~tVestibular~t¿El niño/a disfruta dar algunas vueltas sobre sí mismo, sin caerse?~r~n&
43	61~t155~tVestibular~t¿Cuándo el niño/a se tropieza, o siente que se va a caer, pone las manos para protegerse?~r~n&
44	61~t155~tVestibular~t¿El niño/a disfruta del movimiento en varias direcciones, velocidades y alturas? por ejemplo: subir al rodadero3 , ¿sube y baja, montaña rusa, que lo suban o bajen rápidamente?~r~n&
'

end variables

forward prototypes
public function integer wf_rango_edad (integer ai_meses, integer ai_dias)
public function integer wf_cual_columna (integer ai_valor)
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
elseif (ai_meses>=72 and ai_meses<155) then 
	return 12
end if
return -1

end function

public function integer wf_cual_columna (integer ai_valor);if ai_valor=0 then return 1
if ai_valor>=1 and ai_valor<=15 then return 2
if ai_valor>=16 and ai_valor<=61 then return ai_valor - 13
if ai_valor>=62 and ai_valor<=99 then return 49
if ai_valor=100 then return 50
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
lds_import_json.dataobject="dw_import_json_vale"

lnv_json=create jsonpackage
lnv_json.loadString(as_json)

j=lds_import_json.importJson(lnv_json.getValue("valores"))
	
for j=1 to lds_import_json.rowcount()
	
	if  adw_valores.dataobject='dw_instrum_vale_iv' then
		
		adw_valores.setitem(lds_import_json.getitemnumber(j,'nro_item'),'bloquear',0)
		adw_valores.expand(lds_import_json.getitemnumber(j,'nro_item'),1)
		adw_valores.setitem(lds_import_json.getitemnumber(j,'nro_item'),'respuesta',lds_import_json.getitemnumber(j,'respuesta'))
		
	elseif adw_valores.dataobject='dw_instrum_vale_ce' then
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
	dw_result.setitem(2,'resultado', tab_1.tp_2.dw_2.getitemnumber(1,'sum_presencia') +  tab_1.tp_2.dw_2.getitemnumber(1,'sum_integridad'))
elseif ai_cual=3 then
	dw_result.setitem(3,'resultado', tab_1.tp_3.dw_3.getitemnumber(1,'total') )
end if
end subroutine

on w_instrumento_hc_vale.create
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

on w_instrumento_hc_vale.destroy
destroy(this.dw_calc_edad)
destroy(this.tab_1)
destroy(this.pb_ok)
destroy(this.pb_cancelar)
destroy(this.dw_result)
end on

event open;i_stde=message.powerobjectparm

int j 

DW_RESULT.IMPORTsTRING(is_data_result)

/*FORMATO DEL JSON: en RG y CE la propiedad valores solo se llena con los valores que escogieron en Si (1), de lo contrario no se llenan porque el valor por defecto es 0
{
"edad":{"años":0,"meses":7,"dias":9},
"fecha_evaluacion":"2022-08-10",
"semanas_gestacion":40,
"RG":{"resultado":0,"valores":[]},
"CE":{"resultado":0,"valores":[]},
"VI":{"resultado":0,"valores":[{"item":5,"respuesta":1},{"item":6,"respuesta":1},{"item":7,"respuesta":1}]}}
*/

if i_stde.json="" or isnull(i_stde.json) then 
	ibn_new=true
	id_fechaEvalua=today()
	
	///---Bajo peso al nacer
	SELECT numero into :ii_bpeso
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN9' AND cod_tipo='1' and cod_alergia='1';
	//edad gestacional
	SELECT numero into :ii_semanas_gestacion 
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN9' AND cod_tipo='1' and cod_alergia='2';
	//Hospitalarios
	select sum(numero) into :ii_hospi
	FROM pacientes_antecedente
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN13' and hospi='UN';
	//Complicaciones 
	SELECT cast(texto as integer) into :ii_compli
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN9' AND cod_tipo='2' and (cod_alergia>='1' and cod_alergia <='9');
	///medicos
	SELECT sum(cast(texto as integer)) into :ii_medic
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia >='1' and  cod_alergia <= '23';
	//condicion social
	SELECT sum(cast(texto as integer))  into :ii_csocial
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN12' AND cod_tipo='1' and cod_alergia >='1' and  cod_alergia <= '10';

	////rendimiento escolar
		///plantilla  //regular 
		///C1  ---- 238 --- texto
		///C2  ----201 --- texto
		////C·  ---232 --- texto
		
	////c1 243 --- siy no
	////c1 244 --- siy no
	////c1 245 --- siy no
	////c1 246 --- siy no
	////c1 247 --- siy no
	
	///c2 203 ---siyno
	///c2 204 ---siyno	
	///c2 205 ---siyno	
	///c2 206 ---siyno	
	///c2 207 ---siyno	
	
	//c3 241 siyno
	//c3 242 siyno	
	//c3 243 siyno		
	//c3 244 siyno			
	//c3 245 siyno			

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

if ii_Rango_edad=-1 then
	messagebox("Atención","Paciente pretermino extremo, edad corregida no aplica para el instrumento")
	close(this)
	return
end if

tab_1.tp_1.dw_1.importString(is_data_RG)
	
tab_1.tp_2.dw_2.importString(is_data_CE)

tab_1.tp_3.dw_3.importString(is_data_IV)
for j=1 to tab_1.tp_3.dw_3.rowcount()
	if ii_Rango_edad>=tab_1.tp_3.dw_3.getitemnumber(j,'edad_inicio') and ii_Rango_edad<=tab_1.tp_3.dw_3.getitemnumber(j,'edad_fin') then 
		tab_1.tp_3.dw_3.setitem(j,'bloquear',0)
		tab_1.tp_3.dw_3.Expand(j,1)
	end if
next

//si hay JSON de entrada, "pintar" los datos en los DW
if not ibn_new then
	wf_set_json_data( lnv_json.getvalue( "RG"), 1 , tab_1.tp_1.dw_1)
	wf_set_json_data( lnv_json.getvalue( "CE"), 2 , tab_1.tp_2.dw_2)
	wf_set_json_data( lnv_json.getvalue( "VI"), 3 , tab_1.tp_3.dw_3)
	
	destroy lnv_json2
	destroy lnv_json
end if
if ii_bpeso>0 and ii_bpeso<1500 then
	tab_1.tp_1.dw_1.setitem(1,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(1,'respuesta',0)
end if
if ii_semanas_gestacion <30 then
	tab_1.tp_1.dw_1.setitem(2,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(2,'respuesta',0)
end if
if  ii_hospi >30 then
	tab_1.tp_1.dw_1.setitem(3,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(3,'respuesta',0)
end if
if  ii_compli >0 then
	tab_1.tp_1.dw_1.setitem(4,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(4,'respuesta',0)
end if
if  ii_medic >0 then
	tab_1.tp_1.dw_1.setitem(5,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(5,'respuesta',0)
end if
if  ii_csocial >0 then
	tab_1.tp_1.dw_1.setitem(6,'respuesta',1)
else
	tab_1.tp_1.dw_1.setitem(6,'respuesta',0)
end if
/*7	¿El niño presenta dificultades en el aprendizaje de la lectura y la escritura o en su desempeño escolar?'*/
tab_1.tp_1.dw_1.triggerevent(itemchanged!)

end event

type dw_calc_edad from datawindow within w_instrumento_hc_vale
integer x = 69
integer y = 24
integer width = 3031
integer height = 168
integer taborder = 30
string title = "none"
string dataobject = "dw_edad_instrumentos"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
end event

type tab_1 from tab within w_instrumento_hc_vale
integer x = 27
integer y = 196
integer width = 3410
integer height = 1644
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
integer height = 1516
long backcolor = 67108864
string text = "Riesgos Generales"
long tabtextcolor = 33554432
string picturename = "ead_motocidadg.ico"
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
integer height = 1488
integer taborder = 20
string dataobject = "dw_instrum_vale_rg"
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
integer height = 1516
long backcolor = 67108864
string text = "Condiciones Estructurales"
long tabtextcolor = 33554432
string picturename = "ead_motocidadf.ico"
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
integer y = 12
integer width = 3365
integer height = 1488
integer taborder = 30
string dataobject = "dw_instrum_vale_ce"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name='presencia' then
	if data='1' then setitem(row,'integridad',0)
end if
ibn_cambio=true
accepttext()
groupcalc()
	
post wf_valores(2)

end event

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3374
integer height = 1516
long backcolor = 67108864
string text = "Items de Valoración"
long tabtextcolor = 33554432
string picturename = "ead_ail.ico"
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
integer height = 1500
integer taborder = 30
string dataobject = "dw_instrum_vale_iv"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;groupcalc()
ibn_cambio=true
int j, li_edad_ini_actual,li_edad_fin_actual

 li_edad_ini_actual=getitemnumber(row,'edad_inicio')
 li_edad_fin_actual=getitemnumber(row,'edad_fin')

if data='1' then
	for j=row - 1 to 1 step -1
		setitem(j,'bloquear',0)
		if getitemnumber(j,'edad_inicio')<>li_edad_ini_actual then		
			expand(j,1)
			exit
		end if
	next
end if

post wf_valores(3)


end event

type pb_ok from picturebutton within w_instrumento_hc_vale
integer x = 3214
integer y = 1948
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

event clicked;
int ll_donde, j 
datawindow l_dw
l_dw=tab_1.tp_3.dw_3

if l_dw.find('isnull(respuesta) and bloquear=0',1,l_dw.rowcount())>0 then
	Messagebox("Atención","Debe completar la evaluación de la Pestaña Items de Valoración")
	tab_1.selectedtab=3
	l_dw.setfocus()
	return
end if

ll_donde=l_dw.find('respuesta=1',1,l_dw.rowcount())
if ll_donde>0 then
	if l_dw.getitemnumber(ll_donde,'edad_inicio')>0 then
		for j=ll_donde -1 to 1 step -1
			if l_dw.getitemnumber(j , 'edad_inicio')<>l_dw.getitemnumber(ll_donde,'edad_inicio') then
				if l_dw.find('respuesta=0',1,j)=0 then
					Messagebox("Atención","Debe completar la evaluación de la Pestaña Items de Valoración")
					tab_1.selectedtab=3
					l_dw.setfocus()
					return
				else
					exit
				end if
			end if
		next
	end if
end if

jsonpackage lnv_json,lnv_json2
lnv_json = create jsonpackage
lnv_json2=create jsonpackage

/*FORMATO DEL JSON: en RG y CE la propiedad valores solo se llena con los valores que escogieron en Si (1), de lo contrario no se llenan porque el valor por defecto es 0
{
"edad":{"años":0,"meses":7,"dias":9},
"fecha_evaluacion":"2022-08-10",
"semanas_gestacion":40,
"RG":{"resultado":0,"valores":[]},
"CE":{"resultado":0,"valores":[]},
"VI":{"resultado":0,"valores":[{"item":5,"respuesta":1},{"item":6,"respuesta":1},{"item":7,"respuesta":1}]}}
*/

lnv_json.setvalue("edad",'{"años":'+string(ist_edad.anyos)+',"meses":'+string(ist_edad.meses)+',"dias":'+string(ist_edad.dias)+'}')
lnv_json.setvalue("fecha_evaluacion",string(id_fechaEvalua,"yyyy-mm-dd"),false)
lnv_json.setvalueNumber("semanas_gestacion",ii_semanas_gestacion)

lnv_json2.setvalueNumber("resultado",dw_result.getitemnumber(1,'resultado'))
tab_1.tp_1.dw_1.setfilter("respuesta=1")
tab_1.tp_1.dw_1.filter()
lnv_json2.setvalue("valores",wf_valores_json(tab_1.tp_1.dw_1),true)
lnv_json.setValue("RG",lnv_json2.GetJsonString())

lnv_json2.setvalueNumber("resultado",dw_result.getitemnumber(2,'resultado'))
tab_1.tp_2.dw_2.setfilter("presencia=1 or integridad=1")
tab_1.tp_2.dw_2.filter()
lnv_json2.setvalue("valores",wf_valores_json(tab_1.tp_2.dw_2),true)
lnv_json.setValue("CE",lnv_json2.GetJsonString())

lnv_json2.setvalueNumber("resultado",dw_result.getitemnumber(3,'resultado'))
tab_1.tp_3.dw_3.setfilter("not isnull(respuesta)")
tab_1.tp_3.dw_3.filter()
lnv_json2.setvalue("valores",wf_valores_json(tab_1.tp_3.dw_3),true)
lnv_json.setValue("VI",lnv_json2.GetJsonString())

string ls_texto
setnull(i_stde.instr1)
setnull(i_stde.instr2)
setnull(i_stde.instr3)
setnull(i_stde.instr4)
if dw_result.getitemnumber(1,'resultado')>0 or dw_result.getitemnumber(2,'resultado')>0 or dw_result.getitemnumber(3,'resultado')>1 then
	ls_texto='FALLA'
else
	ls_texto='PASA'
end if

i_stde.cambio=ibn_cambio
if ibn_cambio then
	i_stde.json=lnv_json.GetJsonString()
	i_stde.texto=ls_texto
end if

closewithreturn(parent,i_stde)

destroy lnv_json2
destroy lnv_json
end event

type pb_cancelar from picturebutton within w_instrumento_hc_vale
event mousemove pbm_mousemove
integer x = 3218
integer y = 2092
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

type dw_result from datawindow within w_instrumento_hc_vale
integer x = 402
integer y = 1920
integer width = 2624
integer height = 476
integer taborder = 20
string title = "none"
string dataobject = "dw_instrum_vale_results"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

