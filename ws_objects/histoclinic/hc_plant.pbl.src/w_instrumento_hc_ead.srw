$PBExportHeader$w_instrumento_hc_ead.srw
forward
global type w_instrumento_hc_ead from window
end type
type dw_calc_edad from datawindow within w_instrumento_hc_ead
end type
type dw_result from datawindow within w_instrumento_hc_ead
end type
type tab_1 from tab within w_instrumento_hc_ead
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
type tp_4 from userobject within tab_1
end type
type dw_4 from datawindow within tp_4
end type
type tp_4 from userobject within tab_1
dw_4 dw_4
end type
type tab_1 from tab within w_instrumento_hc_ead
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
end type
type pb_1 from picturebutton within w_instrumento_hc_ead
end type
type pb_cancelar from picturebutton within w_instrumento_hc_ead
end type
end forward

global type w_instrumento_hc_ead from window
integer width = 3602
integer height = 2608
boolean titlebar = true
string title = "Escala Abreviada del Desarrollo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_calc_edad dw_calc_edad
dw_result dw_result
tab_1 tab_1
pb_1 pb_1
pb_cancelar pb_cancelar
end type
global w_instrumento_hc_ead w_instrumento_hc_ead

type variables
st_xa_graficas i_stde

int iPI[4]
int iPC[4]
int iCol[4]
int ii_Rango_edad,ii_semanas_gestacion
st_edad_meses_dias ist_edad

boolean ibn_new

date id_fechaEvalua

constant string is_data_MG='1	1	Realiza reflejo de búsqueda y reflejo de succión	1~r~n&
1	2	El reflejo de moro está presente y es simétrico	1~r~n&
1~t3~tMueve sus extremidades~t1~r~n&
2~t4~tSostiene la cabeza al levantarlo de los brazos~t1~r~n&
2~t5~tLevanta la cabeza y pecho en prono~t1~r~n&
2~t6~tGira la cabeza desde la línea media~t1~r~n&
3~t7~tControl de cabeza sentado con apoyo~t1~r~n&
3~t8~tSe voltea~t1~r~n&
3~t9~tSe mantiene sentado momentáneamente~t1~r~n&
4~t10~tSe mantiene sentado sin apoyo~t1~r~n&
4~t11~tAdopta la posición de sentado~t1~r~n&
4~t12~tSe arrastra en posición prono~t1~r~n&
5~t13~tGatea con desplazamiento cruzado (alternando rodillas y manos)~t1~r~n&
5~t14~tAdopta posición bípeda y se sostiene en pie con apoyo~t1~r~n&
5~t15~tSe sostiene de pie sin apoyo~t1~r~n&
6~t16~tSe pone de pie sin ayuda~t1~r~n&
6~t17~tDa pasos solo(a)~t1~r~n&
6~t18~tCamina con desplazamiento cruzado sin ayuda (alternando brazos y pies)~t1~r~n&
7~t19~tCorre~t1~r~n&
7~t20~tLanza la pelota~t1~r~n&
7~t21~tPatea la pelota~t1~r~n&
8~t22~tSalta con los pies juntos~t1~r~n&
8~t23~tSe empina en ambos pies~t1~r~n&
8~t24~tSube dos escalones sin apoyo~t1~r~n&
9~t25~tCamina en puntas de pies~t1~r~n&
9~t26~tSe para en un solo pie~t1~r~n&
9~t27~tBaja dos escalones con apoyo minimo, alternando los pies~t1~r~n&
10~t28~tCamina sobre una línea recta sin apoyo visual~t1~r~n&
10~t29~tSalta en tres o más ocasiones en un pie~t1~r~n&
10~t30~tHace rebotar y agarra la pelota~t1~r~n&
11~t31~tHace "caballitos" (alternando los pies)~t1~r~n&
11~t32~tSalta de lado a lado de una lína con los pies juntos~t1~r~n&
11~t33~tSalta desplazándose con ambos pies~t1~r~n&
12~t34~tMantiene el equilibrio en la punta de los pies con los ojos cerrados~t1~r~n&
12~t35~tRealiza saltos alternados en secuencia~t1~r~n&
12~t36~tRealiza alguna actividad de integración motora~t1~r~n&
'


constant string is_data_MF='1~t1~tReflejo de prensión palmar~t1~r~n&
1~t2~tReacciona ante luz y sonidos~t1~r~n&
1~t3~tSigue movimiento horizontal~t1~r~n&
2~t4~tAbre y mira sus manos~t1~r~n&
2~t5~tSostiene objeto en la mano~t1~r~n&
2~t6~tSe lleva un objeto a la boca~t1~r~n&
3~t7~tAgarra objetos voluntariamente~t1~r~n&
3~t8~tRetiene un objeto cuando se lo intentan quitar~t1~r~n&
3~t9~tPasa objeto de una mano a otra~t1~r~n&
4~t10~tSostiene un objeto en cada mano~t1~r~n&
4~t11~tDeja caer los objetos intencionalmente~t1~r~n&
4~t12~tAgarra con pulgar e índice (pinza)~t1~r~n&
5~t13~tAgarra tercer objeto sin soltar otros~t1~r~n&
5~t14~tSaca objetos del contenedor~t1~r~n&
5~t15~tBusca objetos escondidos~t1~r~n&
6~t16~tHace torre de tres cubos~t1~r~n&
6~t17~tPasa hojas de un libro~t1~r~n&
6~t18~tAgarra una cuchara y se la lleva a la boca~t1~r~n&
7~t19~tGarabatea espontáneamente~t1~r~n&
7~t20~tQuita la tapa del contenedor o frasco de muestra de orina~t1~r~n&
7~t21~tHace torre de cinco cubos~t1~r~n&
8~t22~tEnsarta cuentas perforadas con pinza~t1~r~n&
8~t23~tRasga papel con pinza de ambas manos~t1~r~n&
8~t24~tCopia línea horizontal y vertical ~t1~r~n&
9~t25~tHace una bola de papel con sus dedos~t1~r~n&
9~t26~tCopia círculo~t1~r~n&
9~t27~tFigura humana rudimentaria~t1~r~n&
10~t28~tImita el dibujo de una escalera~t1~r~n&
10~t29~tCorta papel con las tijeras~t1~r~n&
10~t30~tFigura humana 2~t1~r~n&
11~t31~tDibuja el lugar en el que vive~t1~r~n&
11~t32~tModelo de cubos "escalera"~t1~r~n&
11~t33~tCopia un triángulo~t1~r~n&
12~t34~tCopia una figura de puntos~t1~r~n&
12~t35~tPuede hacer una figura plegada~t1~r~n&
12~t36~tEnsarta cordón cruzado (como amarrarse los zapatos)~t1~r~n&
'

constant string is_data_AL='1~t1~tSe sobresalta con un ruido~t1~r~n&
1~t2~tContempla momentáneamente a una persona~t1~r~n&
1~t3~tLlora para expresar necesidades~t1~r~n&
2~t4~tSe tranquiliza con la voz humana~t1~r~n&
2~t5~tProduce sonidos guturales indiferenciados~t1~r~n&
2~t6~tBusca el sonido con la mirada~t1~r~n&
3~t7~tBusca diferentes sonidos con la mirada~t1~r~n&
3~t8~tPone atención a la conversación~t1~r~n&
3~t9~tProduce cuatro o más sonidos diferentes~t1~r~n&
4~t10~tPronuncia tres o más sílabas~t1~r~n&
4~t11~tReacciona cuando se le llama por su nombre~t1~r~n&
4~t12~tReacciona a tres palabras familiares~t1~r~n&
5~t13~tReacciona a la palabra no~t1~r~n&
5~t14~tLlama al cuidador~t1~r~n&
5~t15~tResponde a una instrucción sencilla~t1~r~n&
6~t16~tAproximación a una palabra con intención comunicativa~t1~r~n&
6~t17~tReconoce al menos 6 objetos o imágenes~t1~r~n&
6~t18~tSigue instrucciones de dos pasos~t1~r~n&
7~t19~tNombra cinco objetos de una imagen~t1~r~n&
7~t20~tUtiliza más de 20 palabras~t1~r~n&
7~t21~tUsa frases de dos palabras~t1~r~n&
8~t22~tDice su nombre completo~t1~r~n&
8~t23~tDice frases de 3 palabras~t1~r~n&
8~t24~tReconoce cualidades de los objetos~t1~r~n&
9~t25~tDefine por su uso cinco objetos~t1~r~n&
9~t26~tHace comparativos~t1~r~n&
9~t27~tDescribe el dibujo~t1~r~n&
10~t28~tReconoce 5 colores~t1~r~n&
10~t29~tResponde tres preguntas sobre un relato~t1~r~n&
10~t30~tElabora un relato a partir de una imagen~t1~r~n&
11~t31~tExpresa opiniones~t1~r~n&
11~t32~tRepite palabras con pronunciación correcta~t1~r~n&
11~t33~tAbsurdos visuales~t1~r~n&
12~t34~tIdentifica palabras que inician con sonidos parecidos~t1~r~n&
12~t35~tConoce ayer, hoy y mañana~t1~r~n&
12~t36~tOrdena una historia y la relata~t1~r~n&
'

constant string is_data_PS='1~t1~tSe tranquiliza cuando se toma entre los brazos~t1~r~n&
1~t2~tResponde a las caricias~t1~r~n&
1~t3~tEl bebé ya está registrado(a)~t1~r~n&
2~t4~tReconoce la voz del cuidador principal~t1~r~n&
2~t5~tSonrisa social~t1~r~n&
2~t6~tResponde a la conversación~t1~r~n&
3~t7~tCoge las manos del examinador~t1~r~n&
3~t8~tRíe a carcajadas~t1~r~n&
3~t9~tBusca la continuación del juego~t1~r~n&
4~t10~tReacciona con desconfianza ante el extraño~t1~r~n&
4~t11~tBusca apoyo del cuidador~t1~r~n&
4~t12~tReacciona a su imagen en el espejo~t1~r~n&
5~t13~tParticipa en juegos~t1~r~n&
5~t14~tMuestra interés o intención en alimentarse solo~t1~r~n&
5~t15~tExplora el entorno~t1~r~n&
6~t16~tSeguimiento de rutinas~t1~r~n&
6~t17~tAyuda a desvestirse~t1~r~n&
6~t18~tSeñala 5 partes de su cuerpo~t1~r~n&
7~t19~tAcepta y tolera el contacto de su piel con diferentes texturas~t1~r~n&
7~t20~tExpresa su satisfacción cuando logra o consigue algo~t1~r~n&
7~t21~tIdentifica emociones básicas en una imagen~t1~r~n&
8~t22~tIdentifica qué es de él y qué es de otros~t1~r~n&
8~t23~tDice nombres de las personas con quien vive o comparte~t1~r~n&
8~t24~tExpresa verbalmente emociones básicas (tristeza, alegría, miedo, rabia)~t1~r~n&
9~t25~tRechaza la ayuda del cuidador cuando desea, intenta o hace algo por sí mismo~t1~r~n&
9~t26~tComparte juego con otros(as) niños(as)~t1~r~n&
9~t27~tReconoce las emociones básicas de los otros(as)~t1~r~n&
10~t28~tPuede vestirse y desvestirse solo(a)~t1~r~n&
10~t29~tPropone juegos~t1~r~n&
10~t30~tSabe cuántos anños tiene~t1~r~n&
11~t31~tParticipa en juegos respetando reglas y turnos~t1~r~n&
11~t32~tComenta vida familiar~t1~r~n&
11~t33~tColabora por iniciativa propia con actividades cotidianas~t1~r~n&
12~t34~tManifiesta emoción ante acontecimientos importantes de su grupo social~t1~r~n&
12~t35~tReconocimiento de normas o prohibiciones~t1~r~n&
12~t36~tReconoce emociones complejas (culpa, pena, frustración, etc.)~t1~r~n&
'

end variables

forward prototypes
public function integer wf_rango_edad (integer ai_meses, integer ai_dias)
public subroutine wf_post_revisar_puntos (datawindow adw_valores, long al_row, integer ai_tab)
public function integer wf_cual_columna (integer ai_valor)
public function string wf_valores_json (datawindow adw_valores)
public subroutine wf_set_json_data (string as_json, integer ai_fila, ref datawindow adw_valores)
public function st_edad_meses_dias wf_edad_meses_dias (date ad_nace, date ad_fecha_evaluacion, integer ai_semanas_gestacion)
public function integer wf_meses_faltantes (integer ai_semanas_faltantes, integer ai_dias_edad)
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
elseif ai_meses>=84 then
	return -5
end if
return -1

end function

public subroutine wf_post_revisar_puntos (datawindow adw_valores, long al_row, integer ai_tab);int j,li_null, li_frwv //first_row_with_value , 
int li_lrwv //last_row_with_value
int li_total_inicio=0,li_PD,li_PT
int li_rango_temp,li_hasta,li_desde
string ls_area,ls_null
boolean lbn_arriba,lbn_abajo

setnull(li_null)
setnull(ls_null)

li_frwv =adw_valores.find("not isnull(respuesta)",1,adw_valores.rowcount())

li_lrwv=adw_valores.find("not isnull(respuesta) ",adw_valores.rowcount(), li_frwv+1 )
if li_lrwv= 0 then li_lrwv=li_frwv

if al_row<li_lrwv then
	if adw_valores.getitemnumber(al_row,'punto_final')=2 then
		li_lrwv=al_row
	elseif adw_valores.getitemnumber(al_row,'punto_final2')=2 then 
		li_lrwv=al_row+1
	end if
end if

if adw_valores.getitemnumber(li_frwv,'punto_inicial')=2 then
	if iPI[ai_tab]=0 then iPI[ai_tab]=li_frwv
	li_hasta= li_frwv -1
	li_rango_temp=adw_valores.getitemnumber(li_frwv,'rango_edad')
	lbn_arriba=true
else
	iPI[ai_tab]=0 
	if adw_valores.getitemnumber(li_frwv,'respuesta')=0 or not isnull(adw_valores.getitemnumber(li_frwv+1,'respuesta')) then
		if al_row>1 then 
			adw_valores.setitem(li_frwv -1 , 'bloquear', 0)
			li_hasta= li_frwv -2
			li_rango_temp=adw_valores.getitemnumber(li_frwv -1,'rango_edad') 
			adw_valores.expand(li_frwv -1,1)
			lbn_arriba=true
		end if
	
	end if
end if
if lbn_arriba then
	for j=1 to li_hasta
		adw_valores.setitem(j,'bloquear',1)
		adw_valores.setitem(j,'respuesta',li_null)
		if adw_valores.getitemnumber(j,'rango_edad')<>li_rango_temp then adw_valores.collapse(j,1)
	next
end if

if adw_valores.getitemnumber(li_lrwv,'punto_final')=2 or li_lrwv=adw_valores.rowcount() then
	iPC[ai_tab]=li_lrwv
	li_desde=li_lrwv+1
	li_rango_temp=adw_valores.getitemnumber(li_lrwv,'rango_edad')
	lbn_abajo=true
else
	iPC[ai_tab]=0
	if al_row<adw_valores.rowcount() then
		adw_valores.setitem(li_lrwv +1 , 'bloquear', 0)
		adw_valores.expand(li_lrwv +1 ,1)
		li_desde= li_lrwv +2
		li_rango_temp=adw_valores.getitemnumber(li_lrwv +1,'rango_edad') 
		lbn_abajo=true
	end if
end if
if lbn_abajo then
	for j=li_desde to adw_valores.rowcount()
		adw_valores.setitem(j,'bloquear',1)
		adw_valores.setitem(j,'respuesta',li_null)
		if adw_valores.getitemnumber(j,'rango_edad')=li_rango_temp then 
			adw_valores.expand(j,1)
		else
			adw_valores.collapse(j,1)
		end if
	next
end if

//"despintar" la X
if iCol[ai_tab]<>0 then 
	dw_result.setitem(ai_tab , iCol[ai_tab], '')
	iCol[ai_tab]=0
end if

if iPI[ai_tab]<>0 and iPC[ai_tab]<>0 then
	
	if iPI[ai_tab]>1 then li_total_inicio=adw_valores.getitemnumber(iPI[ai_tab] -1 , 'nro_item')
	li_PD=li_total_inicio + adw_valores.getitemnumber(1,'total')
	
	dw_result.setitem( ai_tab , 'pd' ,li_PD)
	
	ls_area=dw_result.getitemstring(ai_tab,'area')
	
	select puntuacion_tipica into :li_PT from hc_pm_conversion_ead 
	where rango =:ii_rango_edad and area=:ls_area and puntuacion_directa=:li_PD;
	
	if sqlca.sqlcode=-1 then
		Messagebox("Atención, error de SQL","Error consultando la tabla hc_pm_conversion_ead:"+sqlca.sqlerrtext)
		return
	end if
	
	//pintar la X
	dw_result.setitem( ai_tab , 'pt' ,li_PT)
	iCol[ai_tab]=wf_cual_columna(li_PT)
	dw_result.setitem(ai_tab,iCol[ai_tab],'X')
	
	int li_color
	string columna
	columna = dw_result.describe('#'+string(wf_cual_columna(li_PT))+'.name')
	columna ='v'+mid(columna,2,len(columna))
	li_color=dw_result.getitemnumber(ai_tab,columna)
	if li_color=1 then 
		dw_result.setitem(ai_tab,'color','ROJO')
	end if
	if li_color=2 then 
		dw_result.setitem(ai_tab,'color','AMARILLO')
	end if
	if li_color=3 then 
		dw_result.setitem(ai_tab,'color','VERDE')
	end if	
///	-----aca funciona la cosas
else
	dw_result.setitem( ai_tab , 'pd' ,li_null)
	dw_result.setitem( ai_tab , 'pt' , li_null)
end if
end subroutine

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
adw_valores.setfilter("not isnull(respuesta)")
adw_valores.filter()
for j=1 to adw_valores.rowcount()
	ls_json+='{"rango_edad":'+string(adw_valores.getitemnumber(j,'rango_edad')) + ',"nro_item":'+string(adw_valores.getitemnumber(j,'nro_item'))+',"respuesta":'+string(adw_valores.getitemnumber(j,'respuesta'))+'}'
	if j<adw_valores.rowcount() then ls_json+=','
next
ls_json+="]"
return ls_json

end function

public subroutine wf_set_json_data (string as_json, integer ai_fila, ref datawindow adw_valores);jsonpackage lnv_json
datastore lds_import_json
int j

lds_import_json=create datastore
lds_import_json.dataobject="dw_import_json_ead"

lnv_json=create jsonpackage
lnv_json.loadString(as_json)

lds_import_json.importJson(lnv_json.getValue("valores"))
	
for j=1 to lds_import_json.rowcount()
	adw_valores.setitem(lds_import_json.getitemnumber(j,'nro_item'),'respuesta',lds_import_json.getitemnumber(j,'respuesta'))
	adw_valores.expand(lds_import_json.getitemnumber(j,'nro_item'),1)
	adw_valores.setitem(lds_import_json.getitemnumber(j,'nro_item'),'bloquear',0)
next

wf_post_revisar_puntos(adw_valores, lds_import_json.getitemnumber(j -1,'nro_item') , ai_fila)

dw_result.setitem(ai_fila,'pd',lnv_json.getvalueNumber("PD"))
dw_result.setitem(ai_fila,"pt",lnv_json.getvalueNumber("PT"))

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

on w_instrumento_hc_ead.create
this.dw_calc_edad=create dw_calc_edad
this.dw_result=create dw_result
this.tab_1=create tab_1
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.Control[]={this.dw_calc_edad,&
this.dw_result,&
this.tab_1,&
this.pb_1,&
this.pb_cancelar}
end on

on w_instrumento_hc_ead.destroy
destroy(this.dw_calc_edad)
destroy(this.dw_result)
destroy(this.tab_1)
destroy(this.pb_1)
destroy(this.pb_cancelar)
end on

event open;i_stde=message.powerobjectparm
string ls_des_ins

SELECT datawin, des_inst into :ls_des_ins
FROM pm_instrumentos_hc
WHERE (((pm_instrumentos_hc.cod_inst)=:i_stde.instr) AND ((pm_instrumentos_hc.estado)='1'));

//title=ls_des_ins

int j 

/*FORMATO DEL JSON
edad:{años:1,meses:0,dias:15},
fecha_evaluacion:"2022-05-06",
semanas_gestacion:40,
MG:{PD:15,PT:57,valores:[{rango_edad:6,nro_item:17,respuesta:1},{}]},
MF:{},
AL:{},
PS:{}
*/
if i_stde.json="" or isnull(i_stde.json) then 
	ibn_new=true
	id_fechaEvalua=today()
	//ii_semanas_gestacion=i_stde.semanas_gestacion
	
	SELECT numero into :ii_semanas_gestacion 
	FROM pacientes_alergias
	WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN9' AND cod_tipo='1' and cod_alergia='2';
	
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
dw_calc_edad.setitem(1,'ver','1')

ii_Rango_edad=wf_rango_edad( ist_edad.anyos * 12 + ist_edad.meses , ist_edad.dias)

if ii_Rango_edad=-5 then
	messagebox("Atención","Paciente edad del paciente no aplica para el instrumento")
	close(this)
	return
end if
if ii_Rango_edad=-1 then
	messagebox("Atención","Paciente pretermino extremo, edad corregida no aplica para el instrumento")
	close(this)
	return
end if

tab_1.tp_1.dw_1.importString(is_data_MG)
for j=1 to tab_1.tp_1.dw_1.rowcount()
	if tab_1.tp_1.dw_1.getitemnumber(j,'rango_edad')=ii_Rango_edad then 
		tab_1.tp_1.dw_1.setitem(j,'bloquear',0)
		tab_1.tp_1.dw_1.Expand(j,1)
	end if
next
	
tab_1.tp_2.dw_2.importString(is_data_MF)
for j=1 to tab_1.tp_2.dw_2.rowcount()
	if tab_1.tp_2.dw_2.getitemnumber(j,'rango_edad')=ii_Rango_edad then 
		tab_1.tp_2.dw_2.setitem(j,'bloquear',0)
		tab_1.tp_2.dw_2.Expand(j,1)
	end if
next

tab_1.tp_3.dw_3.importString(is_data_AL)
for j=1 to tab_1.tp_3.dw_3.rowcount()
	if tab_1.tp_3.dw_3.getitemnumber(j,'rango_edad')=ii_Rango_edad then 
		tab_1.tp_3.dw_3.setitem(j,'bloquear',0)
		tab_1.tp_3.dw_3.Expand(j,1)
	end if
next

tab_1.tp_4.dw_4.importString(is_data_PS)
for j=1 to tab_1.tp_4.dw_4.rowcount()
	if tab_1.tp_4.dw_4.getitemnumber(j,'rango_edad')=ii_Rango_edad then 
		tab_1.tp_4.dw_4.setitem(j,'bloquear',0)
		tab_1.tp_4.dw_4.Expand(j,1)
	end if
next

dw_result.settransobject(sqlca)
dw_result.retrieve(ii_Rango_edad)

//si hay JSON de entrada, "pintar" los datos en los DW
if not ibn_new then

	wf_set_json_data( lnv_json.getvalue( "MG"), 1 , tab_1.tp_1.dw_1)
	wf_set_json_data( lnv_json.getvalue( "MF"), 2 , tab_1.tp_2.dw_2)
	wf_set_json_data( lnv_json.getvalue( "AL"), 3 , tab_1.tp_3.dw_3)
	wf_set_json_data( lnv_json.getvalue( "PS"), 4 , tab_1.tp_4.dw_4)
	
	destroy lnv_json2
	destroy lnv_json

end if

end event

type dw_calc_edad from datawindow within w_instrumento_hc_ead
integer x = 174
integer y = 28
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

type dw_result from datawindow within w_instrumento_hc_ead
integer x = 32
integer y = 1964
integer width = 3543
integer height = 332
integer taborder = 20
string title = "none"
string dataobject = "dw_semaforo_ead"
boolean border = false
boolean livescroll = true
end type

type tab_1 from tab within w_instrumento_hc_ead
integer x = 14
integer y = 212
integer width = 3561
integer height = 1732
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
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.tp_4=create tp_4
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3,&
this.tp_4}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
destroy(this.tp_4)
end on

type tp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3525
integer height = 1604
long backcolor = 67108864
string text = "Motricidad Gruesa"
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
integer width = 3515
integer height = 1548
integer taborder = 20
string dataobject = "dw_indice_ead"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;groupcalc()
	
post wf_post_revisar_puntos(this,row,1)

end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3525
integer height = 1604
long backcolor = 67108864
string text = "Motricidad Fino-Adaptativa"
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
integer width = 3515
integer height = 1548
integer taborder = 30
string dataobject = "dw_indice_ead"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;groupcalc()
	
post wf_post_revisar_puntos(this,row,2)


end event

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3525
integer height = 1604
long backcolor = 67108864
string text = "Audición Y Lenguaje"
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
integer width = 3515
integer height = 1548
integer taborder = 30
string dataobject = "dw_indice_ead"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;groupcalc()
	
post wf_post_revisar_puntos(this,row,3)


end event

type tp_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3525
integer height = 1604
long backcolor = 67108864
string text = "Persona Social"
long tabtextcolor = 33554432
string picturename = "ead_social.ico"
long picturemaskcolor = 536870912
dw_4 dw_4
end type

on tp_4.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tp_4.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tp_4
integer y = 12
integer width = 3515
integer height = 1548
integer taborder = 40
string dataobject = "dw_indice_ead"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;groupcalc()
	
post wf_post_revisar_puntos(this,row,4)


end event

type pb_1 from picturebutton within w_instrumento_hc_ead
integer x = 1614
integer y = 2348
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
end type

event clicked;if dw_result.find("isnull(PD) or isnull(PT)",1,4)>0 then
	messagebox("Atención","Debe completar las 4 evaluaciones!!")
	return
end if

jsonpackage lnv_json,lnv_json2
lnv_json = create jsonpackage
lnv_json2=create jsonpackage

/*FORMATO DEL JSON
edad:{años:1,meses:0,dias:15},
fecha_evaluacion:"2022-05-06",
semanas_gestacion:"40",
MG:{PD:15,PT:57,valores:[{rango_edad:,nro_item:,respuesta:},{}]},
MF:{},
AL:{},
PS:{}
*/

lnv_json.setvalue("edad",'{"años":'+string(ist_edad.anyos)+',"meses":'+string(ist_edad.meses)+',"dias":'+string(ist_edad.dias)+'}')
lnv_json.setvalue("fecha_evaluacion",string(id_fechaEvalua,"yyyy-mm-dd"),false)
lnv_json.setvalueNumber("semanas_gestacion",ii_semanas_gestacion)

lnv_json2.setvalueNumber("PD",dw_result.getitemnumber(1,'pd'))
lnv_json2.setvalueNumber("PT",dw_result.getitemnumber(1,'pt'))
tab_1.tp_1.dw_1.setfilter("not isnull(respuesta)")
tab_1.tp_1.dw_1.filter()
lnv_json2.setvalue("valores",wf_valores_json(tab_1.tp_1.dw_1),true)
lnv_json.setValue("MG",lnv_json2.GetJsonString())

lnv_json2.setvalueNumber("PD",dw_result.getitemnumber(2,'pd'))
lnv_json2.setvalueNumber("PT",dw_result.getitemnumber(2,'pt'))
tab_1.tp_2.dw_2.setfilter("not isnull(respuesta)")
tab_1.tp_2.dw_2.filter()
lnv_json2.setvalue("valores",wf_valores_json(tab_1.tp_2.dw_2),true)
lnv_json.setValue("MF",lnv_json2.GetJsonString())

lnv_json2.setvalueNumber("PD",dw_result.getitemnumber(3,'pd'))
lnv_json2.setvalueNumber("PT",dw_result.getitemnumber(3,'pt'))
tab_1.tp_3.dw_3.setfilter("not isnull(respuesta)")
tab_1.tp_3.dw_3.filter()
lnv_json2.setvalue("valores",wf_valores_json(tab_1.tp_3.dw_3),true)
lnv_json.setValue("AL",lnv_json2.GetJsonString())

lnv_json2.setvalueNumber("PD",dw_result.getitemnumber(4,'pd'))
lnv_json2.setvalueNumber("PT",dw_result.getitemnumber(4,'pt'))
tab_1.tp_4.dw_4.setfilter("not isnull(respuesta)")
tab_1.tp_4.dw_4.filter()
lnv_json2.setvalue("valores",wf_valores_json(tab_1.tp_4.dw_4),true)
lnv_json.setValue("PS",lnv_json2.GetJsonString())

string ls_texto
ls_texto= 'MOTRICIDAD GRUESA Puntuación Directa:'+string(dw_result.getitemnumber(1,'pd'))+' Puntuación Típica' +string(dw_result.getitemnumber(1,'pt'))+' Semáforo:'+dw_result.getitemstring(1,'color')
ls_texto+=' MOTRICIDAD FINA-ADAPATAIVA Directa:'+string(dw_result.getitemnumber(2,'pd'))+' Puntuación Típica' +string(dw_result.getitemnumber(2,'pt'))+' Semáforo:'+dw_result.getitemstring(2,'color')
ls_texto+=' AUDICIÓN Y LENGUAJE Directa:'+string(dw_result.getitemnumber(3,'pd'))+' Puntuación Típica' +string(dw_result.getitemnumber(3,'pt'))+' Semáforo:'+dw_result.getitemstring(3,'color')
ls_texto+=' PERSONA SOCIAL Directa:'+string(dw_result.getitemnumber(4,'pd'))+' Puntuación Típica' +string(dw_result.getitemnumber(4,'pt'))+' Semáforo:'+dw_result.getitemstring(4,'color')
setnull(i_stde.instr1)
setnull(i_stde.instr2)
setnull(i_stde.instr3)
setnull(i_stde.instr4)

if isnull(ls_texto) then 
	ls_texto='fallo'
else
	i_stde.instr1=dw_result.getitemstring(1,'color')
	i_stde.instr2=dw_result.getitemstring(2,'color')
	i_stde.instr3=dw_result.getitemstring(3,'color')
	i_stde.instr4=dw_result.getitemstring(4,'color')
end if
	
i_stde.cambio=	ibn_new
i_stde.texto=ls_texto
i_stde.json=lnv_json.GetJsonString()
closewithreturn(parent, i_stde)
destroy lnv_json2
destroy lnv_json
end event

type pb_cancelar from picturebutton within w_instrumento_hc_ead
event mousemove pbm_mousemove
integer x = 1797
integer y = 2348
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

