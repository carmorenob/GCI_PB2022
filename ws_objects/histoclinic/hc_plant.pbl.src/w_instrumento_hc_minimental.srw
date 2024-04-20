$PBExportHeader$w_instrumento_hc_minimental.srw
$PBExportComments$Instrumento de Historia Clínica : MINIMENTAL
forward
global type w_instrumento_hc_minimental from window
end type
type sle_2 from singlelineedit within w_instrumento_hc_minimental
end type
type st_2 from statictext within w_instrumento_hc_minimental
end type
type sle_1 from singlelineedit within w_instrumento_hc_minimental
end type
type st_1 from statictext within w_instrumento_hc_minimental
end type
type dw_calc_edad from datawindow within w_instrumento_hc_minimental
end type
type dw_1 from datawindow within w_instrumento_hc_minimental
end type
type pb_ok from picturebutton within w_instrumento_hc_minimental
end type
type pb_cancelar from picturebutton within w_instrumento_hc_minimental
end type
end forward

global type w_instrumento_hc_minimental from window
integer width = 3387
integer height = 2424
boolean titlebar = true
string title = "Instrumento MINIMENTAL"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_2 sle_2
st_2 st_2
sle_1 sle_1
st_1 st_1
dw_calc_edad dw_calc_edad
dw_1 dw_1
pb_ok pb_ok
pb_cancelar pb_cancelar
end type
global w_instrumento_hc_minimental w_instrumento_hc_minimental

type variables
st_xa_graficas i_stde
st_edad_meses_dias ist_edad
DataWindowChild escol
boolean ibn_new, ibn_cambio=false
date id_fechaevalua
string ls_coe,ls_txto

constant string is_data='Alteración Visual~t0~t1~tAlteración visual evidente~t2~r~n&
Orientación temporal~t1~t1~t¿En qué año estamos?~t1~r~n&
Orientación temporal~t1~t2~t¿En qué mes estamos?~t1~r~n&
Orientación temporal~t1~t3~t¿En qué día estamos~t1~r~n&
Orientación temporal~t1~t4~t¿En qué día de la semana estamos?~t1~r~n&
Orientación temporal~t1~t5~t¿Qué hora es?~t1~r~n&
Orientación espacial~t2~t6~t¿En qué país estamos?~t1~r~n&
Orientación espacial~t2~t7~t¿En qué ciudad estamos?~t1~r~n&
Orientación espacial~t2~t8~t¿En qué departamento estamos?~t1~r~n&
Orientación espacial~t2~t9~t¿En qué sitio o lugar estamos?~t1~r~n&
Orientación espacial~t2~t10~t¿En qué piso/barrio/vereda estamos?~t1~r~n&
Memoria~t3~t1~tDiga las siguientes palabras CASA, MESA, ÁRBOL. Un segundo por cada una. Luego pida a la persona que las repita. ~t4~r~n&
Atención y cálculo~t4~t1~tReste 100 - 7 en forma sucesiva durante 5 veces. En el caso que la persona no sepa restar utilizar la siguiente alternativa: Decir los meses del año al revés: Diciembre, noviembre, octubre, septiembre, agosto.~t5~r~n&
Evocación~t5~t1~tDe las palabras anteriormente mencionadas, diga las palabras que recuerde~t4~r~n&
Lenguaje~t6~t1~tMostrar un lápiz y un reloj y preguntar el nombre de los objetos (Denominación)~t3~r~n&
Lenguaje~t7~t1~tHay que pedir que repita la siguiente frase: En el trigal había cinco perros~t1~r~n&
Lenguaje~t8~t1~tComprensión obedecer una orden en tres etapas: A continuación, le voy a dar una orden, escúchela toda y realícela: Tome esta hoja de papel con su mano derecha, dóblela por la mitad y póngala en el piso. ~t4~r~n&
Lenguaje~t9~t1~tPara las siguientes dos órdenes utilice una tarjeta u hoja de papel que contenga la frase: “cierre sus ojos”. Indique: • Hay que pedir que lea y ejecute lo que dice la frase que contiene la tarjeta. (Lectura)~t1~r~n&
Lenguaje~t10~t1~tHay que pedir que escriba la frase que contiene la tarjeta. (Escritura)~t1~r~n&
Lenguaje~t11~t1~tIndique a la persona que copie el siguiente diseño (dos pentágonos cruzados en un ángulo) (Dibujo):~t1~r~n'

end variables

forward prototypes
public function string wf_valores_json (datawindow adw_valores)
public subroutine wf_set_json_data (string as_json, integer ai_fila, ref datawindow adw_valores)
public function integer wf_meses_faltantes (integer ai_semanas_faltantes, integer ai_dias_edad)
public function st_edad_meses_dias wf_edad_meses_dias (date ad_nace, date ad_fecha_evaluacion, integer ai_semanas_gestacion)
end prototypes

public function string wf_valores_json (datawindow adw_valores);string ls_json='{"minimental":[',ls_valor,ls_valor2
int j

/*FORMATO DEL JSON
{"minimental":[
{grupo:"Alteración Visual",			item:0,	subitem:1,	tipo:4,	puntuacion:1,	intentos:},
{grupo:"Orientacion Temporal",	item:1,	subitem:1,	tipo:4,	puntuacion:1,	intentos:},
{grupo:"Memoria",					item:3,	subitem:1,	tipo:3,	puntuacion:1,	intentos:1}
...
]}

Se hace con una funcion para no utilizar exportJson porque pone todos los campos y no es necesario
*/

for j=1 to adw_valores.rowcount()

	if isnull(ls_valor) then ls_valor=''
	ls_valor2=	string(adw_valores.getitemnumber(j,'intentos'))
	if isnull(ls_valor2) then ls_valor2=''
	ls_json+='{"grupo":"'+string(adw_valores.getitemstring(j,'grupo')) + '","item":'+string(adw_valores.getitemnumber(j,'item'))+',"subitem":'+string(adw_valores.getitemnumber(j,'subitem'))+',"descripcion":"'+adw_valores.getitemString(j,'descripcion')+'","tipo":'+string(adw_valores.getitemnumber(j,'tipo'))
	if not isnull(adw_valores.getitemnumber(j,'puntuacion')) then ls_json+=',"puntuacion":'+string(adw_valores.getitemnumber(j,'puntuacion'))
	if not isnull(adw_valores.getitemnumber(j,'intentos')) then  ls_json+=',"intentos":'+string(adw_valores.getitemnumber(j,'intentos'))
	ls_json+='}'
	if j<adw_valores.rowcount() then ls_json+=','
next
ls_json+="]}"
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

//wf_post_revisar_puntos(adw_valores, lds_import_json.getitemnumber(j -1,'nro_item') , ai_fila)


destroy lds_import_json
destroy lnv_json
end subroutine

public function integer wf_meses_faltantes (integer ai_semanas_faltantes, integer ai_dias_edad);int li_dias_faltan,li_meses_faltan

li_dias_faltan=ai_semanas_faltantes*7
li_meses_faltan=int(li_dias_faltan/30)

if (li_meses_faltan*30)+ai_dias_edad<=li_dias_faltan then li_meses_faltan++

return li_meses_faltan
end function

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

on w_instrumento_hc_minimental.create
this.sle_2=create sle_2
this.st_2=create st_2
this.sle_1=create sle_1
this.st_1=create st_1
this.dw_calc_edad=create dw_calc_edad
this.dw_1=create dw_1
this.pb_ok=create pb_ok
this.pb_cancelar=create pb_cancelar
this.Control[]={this.sle_2,&
this.st_2,&
this.sle_1,&
this.st_1,&
this.dw_calc_edad,&
this.dw_1,&
this.pb_ok,&
this.pb_cancelar}
end on

on w_instrumento_hc_minimental.destroy
destroy(this.sle_2)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.dw_calc_edad)
destroy(this.dw_1)
destroy(this.pb_ok)
destroy(this.pb_cancelar)
end on

event open;i_stde=message.powerobjectparm

int j 
string ls_msg, ls_esc

/*FORMATO DEL JSON
minimental:[
{grupo:"Alteración Visual",			item:0,	subitem:1,	tipo:4,	puntuacion:1,	intentos:},
{grupo:"Orientacion Temporal",	item:1,	subitem:1,	tipo:4,	puntuacion:1,	intentos:},
{grupo:"Memoria",					item:3,	subitem:1,	tipo:3,	puntuacion:1,	intentos:1}
...
]
*/

if i_stde.json="" or isnull(i_stde.json) then 
	ibn_new=true
	id_fechaEvalua=today()
	ist_edad=wf_edad_meses_dias(date(i_stde.fecha),id_fechaEvalua,0)
	dw_1.importString(is_data)
else
	jsonpackage lnv_json

	lnv_json= create jsonpackage
	ls_msg=lnv_json.loadstring(i_stde.json)
	
	ls_msg=lnv_json.GetValue("minimental")
	
	dw_1.importJson(ls_msg)

	destroy lnv_json
	
	for j =1 to dw_1.rowCount()
		dw_1.setitem(j,'puntos',dw_1.getitemnumber(j,'puntuacion'))
		dw_1.setitem(j,'puntos_sino_2',dw_1.getitemnumber(j,'puntuacion'))
		dw_1.setitem(j,'puntos_2',dw_1.getitemnumber(j,'puntuacion'))
		dw_1.setitem(j,'puntos_3',dw_1.getitemnumber(j,'puntuacion'))
		dw_1.setitem(j,'puntos_5',dw_1.getitemnumber(j,'puntuacion'))
	next
	
end if

SELECT escolaridad.descripcion,escolaridad.codescolaridad into :ls_esc,:ls_coe
FROM pacientes INNER JOIN escolaridad ON pacientes.escolaridad = escolaridad.codescolaridad
WHERE (((pacientes.tipodoc)=:tipdoc) AND ((pacientes.documento)=:docu));

dw_calc_edad.setitem(1,'fecha_nace',i_stde.fecha)
dw_calc_edad.setitem(1,'fecha_evalua',id_fechaEvalua)
dw_calc_edad.setitem(1,'edad_anyos',ist_edad.anyos)
dw_calc_edad.setitem(1,'edad_meses',ist_edad.meses)
dw_calc_edad.setitem(1,'edad_dias',ist_edad.dias)
dw_calc_edad.setitem(1,'escolaridad',ls_coe)


end event

type sle_2 from singlelineedit within w_instrumento_hc_minimental
integer x = 1486
integer y = 2124
integer width = 1449
integer height = 72
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15793151
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_instrumento_hc_minimental
integer x = 1097
integer y = 2124
integer width = 411
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Intrepretación"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_instrumento_hc_minimental
integer x = 553
integer y = 2124
integer width = 457
integer height = 72
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15793151
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_instrumento_hc_minimental
integer x = 41
integer y = 2124
integer width = 480
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Corregido"
boolean focusrectangle = false
end type

type dw_calc_edad from datawindow within w_instrumento_hc_minimental
integer x = 41
integer y = 16
integer width = 2912
integer height = 164
integer taborder = 10
string title = "none"
string dataobject = "dw_edad_mimental"
boolean border = false
boolean livescroll = true
end type

event constructor;dw_calc_edad.GetChild('escolaridad', escol)
insertrow(1)
escol.settransobject(sqlca)
escol.retrieve()

end event

type dw_1 from datawindow within w_instrumento_hc_minimental
integer x = 23
integer y = 192
integer width = 3333
integer height = 1880
integer taborder = 40
string dataobject = "dw_instrumento_minimental"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;ibn_cambio=true

IF dwo.name='intentos' then return

setitem(row , 'puntuacion' , integer(data)) 
int total
total=dw_1.getitemnumber(1,'compute_2') 
if ist_edad.anyos>=65 and ist_edad.anyos<75 then
	total+=1
end if

if ist_edad.anyos>=75 then
	Total+=2
end if
sle_1.text=string(total)

if (integer(ls_coe)=1 or integer(ls_coe)=2 or integer(ls_coe)=13) AND (total<=21)  then
	ls_txto='SOSPECHA DE DETERIORO COGNOSCITIVO'
end if

if (integer(ls_coe)=3 or integer(ls_coe)=4 or integer(ls_coe)=5) AND (total<=24)  then
	ls_txto='SOSPECHA DE DETERIORO COGNOSCITIVO'
end if

if (integer(ls_coe)>=6 and integer(ls_coe)<=12) AND (total<=26)  then
	ls_txto='SOSPECHA DE DETERIORO COGNOSCITIVO'
end if

//Persona con nivel educativo "Sin escolaridad" o  "Preescolar" o "Básica primaria" y puntuación superior a 21: Normal
if ((integer(ls_coe)>=1 and integer(ls_coe)<=2 ) or integer(ls_coe)=13 ) AND (total>=21)  then
	ls_txto='NORMAL'
end if

//Persona con nivel educativo "Básica secundaria" o "Media (bachiller académico)" o "Media (bachiller técnico)" y puntuación superior a 24: Normal
if ((integer(ls_coe)>=3 and integer(ls_coe)<=5 )) AND (total>=24)  then
	ls_txto='NORMAL'
end if

//Persona con nivel educativo "Normalista" o "Educación para el trabajo (SENA)" o "Técnica profesional" o "Tecnólogica" o "Pregrado" o "Especialización" o "Maestría" o "Doctorado" y puntuación superior a 26: Normal
if ((integer(ls_coe)>=6 and integer(ls_coe)<=12 )) AND (total>=26)  then
	ls_txto='NORMAL'
end if

sle_2.text=ls_txto
end event

type pb_ok from picturebutton within w_instrumento_hc_minimental
integer x = 3008
integer y = 2088
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "           &a"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;i_stde.cambio=ibn_cambio


if ibn_cambio then
	i_stde.texto=ls_txto
	i_stde.json=wf_valores_json(dw_1)
end if
closewithreturn(parent,i_stde)



end event

type pb_cancelar from picturebutton within w_instrumento_hc_minimental
event mousemove pbm_mousemove
integer x = 3191
integer y = 2088
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

