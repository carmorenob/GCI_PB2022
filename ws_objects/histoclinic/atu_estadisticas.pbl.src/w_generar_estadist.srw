$PBExportHeader$w_generar_estadist.srw
forward
global type w_generar_estadist from window
end type
type pb_genera_tablas from picturebutton within w_generar_estadist
end type
type dw_lugar from datawindow within w_generar_estadist
end type
type pb_imprimir from pb_report within w_generar_estadist
end type
type st_filas from statictext within w_generar_estadist
end type
type st_columnas from statictext within w_generar_estadist
end type
type pb_4 from picturebutton within w_generar_estadist
end type
type pb_3 from picturebutton within w_generar_estadist
end type
type sle_no_encu from statictext within w_generar_estadist
end type
type dw_campos_encu2 from datawindow within w_generar_estadist
end type
type cbx_frec_moda from checkbox within w_generar_estadist
end type
type dw_campos_encuesta from datawindow within w_generar_estadist
end type
type dw_campos_encu from datawindow within w_generar_estadist
end type
type dw_estad from datawindow within w_generar_estadist
end type
type st_5 from statictext within w_generar_estadist
end type
type ddlb_tipo_estad from dropdownlistbox within w_generar_estadist
end type
type st_4 from statictext within w_generar_estadist
end type
type st_3 from statictext within w_generar_estadist
end type
type st_2 from statictext within w_generar_estadist
end type
type st_1 from statictext within w_generar_estadist
end type
type em_hasta from editmask within w_generar_estadist
end type
type em_desde from editmask within w_generar_estadist
end type
type cbx_todas from checkbox within w_generar_estadist
end type
type dw_platillas from datawindow within w_generar_estadist
end type
type gb_1 from groupbox within w_generar_estadist
end type
type gb_2 from groupbox within w_generar_estadist
end type
type gb_3 from groupbox within w_generar_estadist
end type
type dw_resul_descript from datawindow within w_generar_estadist
end type
type dw_resultados_histog from datawindow within w_generar_estadist
end type
type dw_resultados_cruz from datawindow within w_generar_estadist
end type
type dw_resultados from datawindow within w_generar_estadist
end type
type gb_4 from groupbox within w_generar_estadist
end type
type dw_tabla_cruzada from datawindow within w_generar_estadist
end type
end forward

global type w_generar_estadist from window
integer width = 3680
integer height = 2692
boolean titlebar = true
string title = "Generación de Estadísticas"
boolean controlmenu = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "estadistica.ico"
boolean center = true
pb_genera_tablas pb_genera_tablas
dw_lugar dw_lugar
pb_imprimir pb_imprimir
st_filas st_filas
st_columnas st_columnas
pb_4 pb_4
pb_3 pb_3
sle_no_encu sle_no_encu
dw_campos_encu2 dw_campos_encu2
cbx_frec_moda cbx_frec_moda
dw_campos_encuesta dw_campos_encuesta
dw_campos_encu dw_campos_encu
dw_estad dw_estad
st_5 st_5
ddlb_tipo_estad ddlb_tipo_estad
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
em_hasta em_hasta
em_desde em_desde
cbx_todas cbx_todas
dw_platillas dw_platillas
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
dw_resul_descript dw_resul_descript
dw_resultados_histog dw_resultados_histog
dw_resultados_cruz dw_resultados_cruz
dw_resultados dw_resultados
gb_4 gb_4
dw_tabla_cruzada dw_tabla_cruzada
end type
global w_generar_estadist w_generar_estadist

type variables
uo_datastore i_dw_encues,i_dw_items,i_dw_datos,i_dw_datos_multiple,i_dw_campo_descript,i_dw_tipo_lista,i_dw_datos_descrip,i_dw_datos_descrip_sino
datawindowchild i_dw_campos,i_dw_campos2
string i_codplant
long i_numcampo,i_indice,i_numcampo2
string i_fecha1,i_fecha2,i_tipo1,i_tipo2,i_nombre,i_nombre2

end variables

forward prototypes
public subroutine f_genera_histogramas (string tipo, long numcampo, string titulo)
end prototypes

public subroutine f_genera_histogramas (string tipo, long numcampo, string titulo);
st_graph_atu st_gr
garbagecollect()
st_gr.st_data.tipo= tipo
if tipo ='S' or tipo='T' then
	dW_resultados_histog.dataobject='dw_graf_texto'
	st_gr.st_data.categoria= 'texto'
	st_gr.st_data.value= 'count(texto for graph)'
	st_gr.st_data.serie= 'texto'
elseif tipo='L' then
	dW_resultados_histog.dataobject='dw_graf_lista'
	st_gr.st_data.categoria= 'atu_listacampo_descripcion'
	st_gr.st_data.value= 'count(atu_reg_valor_texto for graph)'
	st_gr.st_data.serie= 'atu_listacampo_descripcion'
elseif tipo='N' then
	dW_resultados_histog.dataobject='dw_grafica_sino'
	st_gr.st_data.categoria= 'sino'
	st_gr.st_data.value= 'count(sino for graph)'
	st_gr.st_data.serie= 'sino'
elseif tipo='R' then
	dW_resultados_histog.dataobject='dw_graf_numero'
	st_gr.st_data.categoria= 'numero'
	st_gr.st_data.value= 'count(numero for graph)'
	st_gr.st_data.serie= 'numero'
elseif tipo='F' then
	dW_resultados_histog.dataobject='dw_graf_fecha'
	st_gr.st_data.categoria= 'fecha'
	st_gr.st_data.value= 'count(fecha for graph)'
	st_gr.st_data.serie= 'fecha'
elseif tipo='U' then
	dW_resultados_histog.dataobject='dw_graf_multiple'
	st_gr.st_data.categoria= 'descampo'
	st_gr.st_data.value= 'count(texto for graph)'
	st_gr.st_data.serie= 'descampo'
end if

st_gr.st_data.titulo= titulo
dW_resultados_histog.settransobject( sqlca)
dW_resultados_histog.retrieve( i_codplant,numcampo )
if dw_resultados_histog.rowcount( )<1 then 
	messagebox(w_generar_estadist.title, 'No existen datos para generar el  histograma.')
	return 
end if 
dW_resultados_histog.object.gr_1.title=titulo
st_gr.dw_syntax=dw_resultados_histog.getsqlselect()
long posicion
posicion =pos(dw_resultados_histog.getsqlselect( ), 'WHERE')
if posicion>0 then
	if tipo='U' then 
		st_gr.dw_syntax= mid(dw_resultados_histog.getsqlselect( ),1,posicion -1) + ' where cod_plantilla=~~~''+i_codplant+'~~~' and padre='+string(numcampo) +' and texto=~~~'1~~~''
	elseif tipo='L' then 
		st_gr.dw_syntax= mid(dw_resultados_histog.getsqlselect( ),1,posicion -1) + ' where atu_listacampo.codplantilla=~~~''+i_codplant+'~~~' and atu_listacampo.numcampo='+string(numcampo)
	else
		st_gr.dw_syntax= mid(dw_resultados_histog.getsqlselect( ),1,posicion -1) + ' where cod_plantilla=~~~''+i_codplant+'~~~' and item='+string(numcampo)
	end if
end if 
st_gr.parm[1] = i_codplant
st_gr.parm[2] = numcampo
st_gr.consulta = st_gr.dw_syntax
st_gr.dw_syntax = dw_resultados_histog.dataobject

openwithparm(w_graph_gral,st_gr )

end subroutine

on w_generar_estadist.create
this.pb_genera_tablas=create pb_genera_tablas
this.dw_lugar=create dw_lugar
this.pb_imprimir=create pb_imprimir
this.st_filas=create st_filas
this.st_columnas=create st_columnas
this.pb_4=create pb_4
this.pb_3=create pb_3
this.sle_no_encu=create sle_no_encu
this.dw_campos_encu2=create dw_campos_encu2
this.cbx_frec_moda=create cbx_frec_moda
this.dw_campos_encuesta=create dw_campos_encuesta
this.dw_campos_encu=create dw_campos_encu
this.dw_estad=create dw_estad
this.st_5=create st_5
this.ddlb_tipo_estad=create ddlb_tipo_estad
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.em_hasta=create em_hasta
this.em_desde=create em_desde
this.cbx_todas=create cbx_todas
this.dw_platillas=create dw_platillas
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_resul_descript=create dw_resul_descript
this.dw_resultados_histog=create dw_resultados_histog
this.dw_resultados_cruz=create dw_resultados_cruz
this.dw_resultados=create dw_resultados
this.gb_4=create gb_4
this.dw_tabla_cruzada=create dw_tabla_cruzada
this.Control[]={this.pb_genera_tablas,&
this.dw_lugar,&
this.pb_imprimir,&
this.st_filas,&
this.st_columnas,&
this.pb_4,&
this.pb_3,&
this.sle_no_encu,&
this.dw_campos_encu2,&
this.cbx_frec_moda,&
this.dw_campos_encuesta,&
this.dw_campos_encu,&
this.dw_estad,&
this.st_5,&
this.ddlb_tipo_estad,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.em_hasta,&
this.em_desde,&
this.cbx_todas,&
this.dw_platillas,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.dw_resul_descript,&
this.dw_resultados_histog,&
this.dw_resultados_cruz,&
this.dw_resultados,&
this.gb_4,&
this.dw_tabla_cruzada}
end on

on w_generar_estadist.destroy
destroy(this.pb_genera_tablas)
destroy(this.dw_lugar)
destroy(this.pb_imprimir)
destroy(this.st_filas)
destroy(this.st_columnas)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.sle_no_encu)
destroy(this.dw_campos_encu2)
destroy(this.cbx_frec_moda)
destroy(this.dw_campos_encuesta)
destroy(this.dw_campos_encu)
destroy(this.dw_estad)
destroy(this.st_5)
destroy(this.ddlb_tipo_estad)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_hasta)
destroy(this.em_desde)
destroy(this.cbx_todas)
destroy(this.dw_platillas)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_resul_descript)
destroy(this.dw_resultados_histog)
destroy(this.dw_resultados_cruz)
destroy(this.dw_resultados)
destroy(this.gb_4)
destroy(this.dw_tabla_cruzada)
end on

event open;
i_dw_encues= create uo_datastore
i_dw_encues.dataObject='dw_encuestas'
i_dw_encues.settransobject(sqlca)

i_dw_items= create uo_datastore
i_dw_items.dataObject='dw_items_campocruz'
i_dw_items.settransobject(sqlca)

i_dw_datos= create uo_datastore	//dw para determinar todas las formulas de todos los tipos de datos, menos el de seleccion multiple
i_dw_datos.dataObject='dw_datos'
i_dw_datos.settransobject(sqlca)

i_dw_datos_multiple= create uo_datastore	//dw para determinar todas las formulas del tipo de dato seleccion multiple
i_dw_datos_multiple.dataObject='dw_datos_selecc_mult'
i_dw_datos_multiple.settransobject(sqlca)

i_dw_campo_descript= create uo_datastore
i_dw_campo_descript.dataObject='dw_campos1_descrip'
i_dw_campo_descript.settransobject(sqlca)

i_dw_tipo_lista= create uo_datastore
i_dw_tipo_lista.dataObject='dw_tipo_lista'
i_dw_tipo_lista.settransobject(sqlca)

i_dw_datos_descrip= create uo_datastore	//dw para determinar la frecuencia de los datos tipo seleccion - Lista - Seleccion Multiple
i_dw_datos_descrip.dataObject='dw_datos_descrip'
i_dw_datos_descrip.settransobject(sqlca)

i_dw_datos_descrip_sino= create uo_datastore	//dw para determinar la frecuencia de los datos tipo si/no
i_dw_datos_descrip_sino.dataObject='dw_datos_descrip_si_no'
i_dw_datos_descrip_sino.settransobject(sqlca)

cbx_todas.checked=true

end event

type pb_genera_tablas from picturebutton within w_generar_estadist
integer x = 2725
integer y = 36
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                                                   &V     "
string picturename = "graficas.gif"
alignment htextalign = left!
end type

event clicked;long j
long campo_cruz,cruz
long i,fila,numcampo,num_campo
date media_num,mediana_num,moda_num,varianza_num,desviacion_num
string chequeado,descrip_campo,des_est,mediana,tipo,maximo,minimo,media,moda,varianza,desviacion
string cheque_cruz,des_campo_cruz,cuenta_grupo

if i_indice=1 then	//***------------Tipo de Estadística Generales-----------------***
	dw_resultados.visible=true
	//dw_resultados_cruz.visible=false
	dw_resultados_histog.visible=false
	dw_resul_descript.visible=false
	dw_tabla_cruzada.visible=false

	dw_resultados.setredraw( false)
	for i = 1 to dw_estad.rowcount( )	//pone visibles todos los campos
		des_est=dw_estad.getitemstring( i, 'nombre')
		dw_resultados.modify( des_est+".visible=1")
	next
	dw_campos_encuesta.accepttext( )
	dw_estad.accepttext( )
	dw_resultados.reset( )
	
	for i =1 to dw_campos_encuesta.rowcount( )	//inserto los campos selecciados en el dw de resultados
		chequeado=dw_campos_encuesta.getitemstring( i, 'num')
		if chequeado='1' then
			numcampo=dw_campos_encuesta.getitemnumber( i, 'numcampo')
			descrip_campo=dw_campos_encuesta.getitemstring( i, 'descampo')
			tipo=dw_campos_encuesta.getitemstring( i, 'tipo')
			fila= dw_resultados.insertrow(0)
			dw_resultados.setitem(fila,'campo', descrip_campo)
			
			//Maximo
			maximo=f_maximo(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion maximo
			dw_resultados.setitem(fila,'maximo', maximo)
			//Minimo
			minimo=f_minimo(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion minimo
			dw_resultados.setitem(fila,'minimo', minimo)
			//Media
			if tipo='U' then
				media=f_media(i_codplant,numcampo,tipo,i_dw_datos_multiple,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion media para tipo seleccion multiple
			else
				if tipo='F' then
					media=f_media(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion media	
					media_num=f_numero_fecha(long(media))
					media=string(media_num)
				else 
					media=f_media(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))
				end if
			end if			
			dw_resultados.setitem(fila,'media', media)
			//Mediana
			if tipo='U' then
				mediana=f_mediana(i_codplant,numcampo,tipo,i_dw_datos_multiple,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion mediana para tipo seleccion multiple
			else
				if tipo='F'  then
					mediana=f_mediana(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion media	
					mediana_num=f_numero_fecha(long(mediana))
					mediana=string(mediana_num)
				else
					mediana=f_mediana(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion mediana
				end if
			end if	
			dw_resultados.setitem(fila,'mediana', mediana)
			//Moda
			if tipo='U' then
				moda=f_moda(i_codplant,numcampo,tipo,i_dw_datos_multiple,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion moda para tipo seleccion multiple
			else
				if tipo='F' then
					moda=f_moda(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion moda
					if moda='0' then
						moda="No hay moda."
					else	
						moda_num=f_numero_fecha(long(moda)) 
						moda=string(moda_num)
					end if
				else
					moda=f_moda(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion moda
				end if
			end if	
			dw_resultados.setitem(fila,'moda', moda)
			//Varianza
			if tipo='U' then
				varianza=f_varianza(i_codplant,numcampo,tipo,i_dw_datos_multiple,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion varianza para tipo seleccion multiple
			else
				varianza=f_varianza(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion varianza
			end if	
			dw_resultados.setitem(fila,'varianza', varianza)
			//Desviacion
			if tipo='U' then
				desviacion=f_desviacion(i_codplant,numcampo,tipo,i_dw_datos_multiple,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion desviacion para tipo seleccion multiple
			else
				desviacion=f_desviacion(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion desviacion
			end if	
			dw_resultados.setitem(fila,'desviacion', desviacion)
		end if
	next
	
	for i = 1 to dw_estad.rowcount( )	//pone visibles las columnas de las estadist seleccionadas
		if  dw_estad.getitemstring( i, 'chequeo')='0' then
			des_est=dw_estad.getitemstring( i, 'nombre')
			dw_resultados.modify( des_est+".visible=0") 
		end if
	next  
	dw_resultados.setredraw( true)
	
elseif i_indice=2 then	//***-----------------------Tipo de Estadística Descriptivas---------------------***
	dw_resultados.visible=false
	//dw_resultados_cruz.visible=false
	dw_resultados_histog.visible=false
	dw_resul_descript.visible=true
	dw_tabla_cruzada.visible=false
	
	dw_resul_descript.setredraw( false)
	dw_resul_descript.reset( )
	
	for i =1 to dw_campos_encuesta.rowcount( )	//inserto los campos selecciados en el dw de resultados
		chequeado=dw_campos_encuesta.getitemstring( i, 'num')
		if chequeado='1' then
			numcampo=dw_campos_encuesta.getitemnumber( i, 'numcampo')
			descrip_campo=dw_campos_encuesta.getitemstring( i, 'descampo')
			tipo=dw_campos_encuesta.getitemstring( i, 'tipo')
			fila= dw_resul_descript.insertrow(0)
			dw_resul_descript.setitem(fila,'campo', descrip_campo)
			dw_resul_descript.setitem(fila,'color', '1')
			//Moda
			if tipo='U' then
				moda=f_moda(i_codplant,numcampo,tipo,i_dw_datos_multiple,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion moda para tipo seleccion multiple
			else
				moda=f_moda(i_codplant,numcampo,tipo,i_dw_datos,i_fecha1,i_fecha2,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))	//llama a la funcion moda
			end if	
			dw_resul_descript.setitem(fila,'moda', moda)
			dw_resul_descript.setitem(fila,'frecuencia', sle_no_encu.text )
			dw_resul_descript.setitem(fila,'encuestas', sle_no_encu.text )
			
			if tipo = 'N' then	// Si/No
				fila= dw_resul_descript.insertrow(0)
				dw_resul_descript.setitem(fila,'encuestas', sle_no_encu.text )
				dw_resul_descript.setitem(fila,'campo', '	SI')
				i_dw_datos_descrip_sino.retrieve(i_codplant,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'),numcampo,datetime(string (date(i_fecha1),'yyyy-mm-dd')),datetime(date(i_fecha2),time("23:59")),'1')
				cuenta_grupo=i_dw_datos_descrip_sino.getitemstring( 1, 'comp_cuantos_si_no')
				if cuenta_grupo<>"" then
					dw_resul_descript.setitem(fila,'frecuencia', cuenta_grupo)
				else
					dw_resul_descript.setitem(fila,'frecuencia', '0')
				end if
				fila= dw_resul_descript.insertrow(0)
				dw_resul_descript.setitem(fila,'encuestas', sle_no_encu.text )
				dw_resul_descript.setitem(fila,'campo', '	NO')
				i_dw_datos_descrip_sino.retrieve(i_codplant,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'),numcampo,datetime(string (date(i_fecha1),'yyyy-mm-dd')),datetime(date(i_fecha2),time("23:59")),'0')
				cuenta_grupo=i_dw_datos_descrip_sino.getitemstring( 1, 'comp_cuantos_si_no')
				if cuenta_grupo<>"" then
					dw_resul_descript.setitem(fila,'frecuencia', cuenta_grupo)
				else
					dw_resul_descript.setitem(fila,'frecuencia', '0')
				end if
			end if
			dw_resul_descript.accepttext( )
			
			if tipo = 'S' then	//Seleccion
				fila= dw_resul_descript.insertrow(0)
				dw_resul_descript.setitem(fila,'encuestas', sle_no_encu.text )
				dw_resul_descript.setitem(fila,'campo', '	SI')
				i_dw_datos_descrip.retrieve(i_codplant,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'),numcampo,datetime(string (date(i_fecha1),'yyyy-mm-dd')),datetime(date(i_fecha2),time("23:59")),'1')
				cuenta_grupo=i_dw_datos_descrip.getitemstring( 1, 'comp_cuantos_lista')
				if cuenta_grupo<>"" then
					dw_resul_descript.setitem(fila,'frecuencia', cuenta_grupo)
				else
					dw_resul_descript.setitem(fila,'frecuencia', '0')
				end if
				fila= dw_resul_descript.insertrow(0)
				dw_resul_descript.setitem(fila,'encuestas', sle_no_encu.text )
				dw_resul_descript.setitem(fila,'campo', '	NO')
				i_dw_datos_descrip.retrieve(i_codplant,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'),numcampo,datetime(string (date(i_fecha1),'yyyy-mm-dd')),datetime(date(i_fecha2),time("23:59")),'0')
				cuenta_grupo=i_dw_datos_descrip.getitemstring( 1, 'comp_cuantos_lista')
				if cuenta_grupo<>"" then
					dw_resul_descript.setitem(fila,'frecuencia', cuenta_grupo)
				else
					dw_resul_descript.setitem(fila,'frecuencia', '0')
				end if
			end if
			
			if tipo = 'U' then	//Seleccion Multiple
			i_dw_campo_descript.retrieve( i_codplant,numcampo)	//retrieve para saber los items de la seleccion multiple
				if i_dw_campo_descript.rowcount( )>0 then
					for j=1 to i_dw_campo_descript.rowcount( )
						descrip_campo=i_dw_campo_descript.getitemstring(j, 'descampo')
						num_campo=i_dw_campo_descript.getitemnumber(j, 'numcampo')
						fila= dw_resul_descript.insertrow(0)
						dw_resul_descript.setitem(fila,'encuestas', sle_no_encu.text )
						dw_resul_descript.setitem(fila,'campo', '	'+descrip_campo)
						i_dw_datos_descrip.retrieve(i_codplant,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'),num_campo,datetime(string (date(i_fecha1),'yyyy-mm-dd')),datetime(date(i_fecha2),time("23:59")),'1')
						cuenta_grupo=i_dw_datos_descrip.getitemstring( 1, 'comp_cuantos_lista')
						if cuenta_grupo<>"" then
							dw_resul_descript.setitem(fila,'frecuencia', cuenta_grupo)
						else
							dw_resul_descript.setitem(fila,'frecuencia', '0')
						end if
					next
				end if	
			end if		//tipo U
			
			if tipo = 'L' then 	//Lista
				i_dw_tipo_lista.retrieve(i_codplant, numcampo) 	//retrieve para saber los items de la lista}
				if i_dw_tipo_lista.rowcount( )>0 then
					for j=1 to i_dw_tipo_lista.rowcount( )
						descrip_campo=i_dw_tipo_lista.getitemstring(j, 'descripcion')
						fila= dw_resul_descript.insertrow(0)
						dw_resul_descript.setitem(fila,'encuestas', sle_no_encu.text )
						dw_resul_descript.setitem(fila,'campo', '	'+descrip_campo)
						i_dw_datos_descrip.retrieve(i_codplant,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'),numcampo,datetime(string (date(i_fecha1),'yyyy-mm-dd')),datetime(date(i_fecha2),time("23:59")),descrip_campo)
						cuenta_grupo=i_dw_datos_descrip.getitemstring( 1, 'comp_cuantos_lista')
						if cuenta_grupo<>"" then
							dw_resul_descript.setitem(fila,'frecuencia', cuenta_grupo)
						else
							dw_resul_descript.setitem(fila,'frecuencia', '0')
						end if
					next
				end if
			end if		//tipo L
			
		end if
	next
	if cbx_todas.checked then
		dw_resul_descript.Object.t_3.visible=false
	else
		dw_resul_descript.Object.t_3.visible=true
	end if
	dw_resul_descript.Object.t_3.Text ='DEL '+ em_desde.text+' AL '+ em_hasta.text
	dw_resul_descript.setredraw( true)
	
elseif i_indice=3 then		//***-------------------Tipo de Estadística tablas cruzadas------------------***
	dw_resultados.visible=false
	dw_resultados_histog.visible=false
	dw_resul_descript.visible=false
	dw_tabla_cruzada.visible=true
	
//	if isnull(i_numcampo2) then
//		messagebox("","No ha seleccionado las filas y columnas para las estadísticas.")
//		return
//	end if
	
	//pone el dw dependiendo de si el tipo es seleccion multiple o es otro tipo
	if i_tipo2='U' then
		dw_tabla_cruzada.dataobject="dw_cruz_xxs_yys11_copy"	//xx a seleccion multiple
	elseif  i_tipo1='U' then
		dw_tabla_cruzada.dataobject="dw_cruz_xxs_yys12_copy"	//seleccion multiple a xx
	else
		dw_tabla_cruzada.dataobject="dw_cruz_xx_yy1"
	end if
	
	dw_tabla_cruzada.settransobject( sqlca)
	
	dw_tabla_cruzada.setredraw( false)

	dw_campos_encuesta.accepttext( )
	dw_tabla_cruzada.reset( )
	
	dw_tabla_cruzada.retrieve(i_codplant,i_numcampo, i_numcampo2,datetime(string (date(i_fecha1),'yyyy-mm-dd')),datetime(date(i_fecha2),time("23:59")),dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))
	
	//-----
	if i_tipo2='U' then
		dw_tabla_cruzada.object.datawindow.header[2].height=0
	else
//		dw_tabla_cruzada.modify( "descampo.visible=0")
	end if
	if i_tipo1='U' then
		dw_tabla_cruzada.object.datawindow.header[4].height=0
	end if
	//-----
	dw_tabla_cruzada.setredraw( true)

end if

pb_imprimir.enabled=true
end event

type dw_lugar from datawindow within w_generar_estadist
integer x = 23
integer y = 172
integer width = 1175
integer height = 132
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

event constructor;settransobject( sqlca)
retrieve( )
end event

type pb_imprimir from pb_report within w_generar_estadist
integer x = 2898
integer y = 40
integer width = 142
integer height = 124
integer taborder = 100
boolean enabled = false
string text = "                                        &P"
boolean originalsize = false
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir Estadísticas [Alt + P]"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any param[]

if isvalid(this.report.dw_rep) then destroy(this.report.dw_rep)

if i_indice=1 then
	report.cod_rep='ES1'
	report.nombre_rep= 'Estadistica_general'
elseif i_indice=2 then
	report.cod_rep='ES2'
	report.nombre_rep= 'Estadistica_descriptiva'
elseif i_indice=3 then
	if i_tipo2='U' then
		report.cod_rep='ES4'
		report.nombre_rep= 'Estadistica_cruzada_s'	//xx a seleccion multiple
	elseif i_tipo1='U' then
		report.cod_rep='ES41'
		report.nombre_rep= 'Estadistica_cruzada_s1'	//seleccion multiple a xx
	else
		report.cod_rep='ES3'
		report.nombre_rep= 'Estadistica_cruzada'
	end if
end if	
	
if i_indice=1 or i_indice=2 then
	dw_resul_descript.print()
//	if not isnull(i_codplant) then
//		param[1]=i_codplant
//		imprimir(param)
//	end if
elseif i_indice=3 then
	if not isnull(i_codplant) then
		param[1]=i_codplant
		param[2]=i_numcampo
		param[3]=i_numcampo2
		param[4]=datetime(string (date(i_fecha1),'yyyy-mm-dd'))
		//param[5]=datetime(string (date(i_fecha2),'yyyy-mm-dd'))
		param[5]=datetime (date(i_fecha2),time("23:59"))
		imprimir(param,'','0')
	end if
end if

pb_imprimir.enabled=false
end event

type st_filas from statictext within w_generar_estadist
boolean visible = false
integer x = 78
integer y = 700
integer width = 512
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filas campos cruzados:"
boolean focusrectangle = false
end type

type st_columnas from statictext within w_generar_estadist
boolean visible = false
integer x = 78
integer y = 504
integer width = 626
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Columnas campos cruzados:"
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_generar_estadist
event mousemove pbm_mousemove
integer x = 2898
integer y = 196
integer width = 142
integer height = 124
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "      &y"
string picturename = "ayuda.gif"
string disabledname = "d_ayuda.gif"
alignment htextalign = left!
string powertiptext = "Ayuda [Alt+Y]"
end type

type pb_3 from picturebutton within w_generar_estadist
event mousemove pbm_mousemove
integer x = 2725
integer y = 196
integer width = 142
integer height = 124
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &c"
boolean cancel = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(w_generar_estadist)
end event

type sle_no_encu from statictext within w_generar_estadist
integer x = 3159
integer y = 112
integer width = 251
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_campos_encu2 from datawindow within w_generar_estadist
boolean visible = false
integer x = 50
integer y = 680
integer width = 1001
integer height = 160
integer taborder = 90
string title = "none"
string dataobject = "dw_combo_campos"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;
//visible=false
settransobject(sqlca)
insertrow(1)
getchild('codplantilla',i_dw_campos2)
i_dw_campos2.settransobject(sqlca)
setnull(i_numcampo2)


end event

event itemchanged;
long nulo
i_numcampo2=long(data)

i_dw_campos2.accepttext( )
dw_campos_encu2.accepttext( )

nulo=i_dw_campos2.find( "numcampo = "+string(i_numcampo2), 1, i_dw_campos2.rowcount( ) )	//busca el campo que seleccion
i_tipo2=i_dw_campos2.getitemstring( nulo, 'tipo')
i_nombre2=i_dw_campos2.getitemstring( nulo, 'descampo')
end event

type cbx_frec_moda from checkbox within w_generar_estadist
boolean visible = false
integer x = 2194
integer y = 1144
integer width = 352
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ver Moda "
boolean checked = true
end type

event clicked;if this.checked=true then
	dw_resul_descript.modify("moda.visible=1")
else
	dw_resul_descript.modify( "moda.visible=0")
end if

end event

type dw_campos_encuesta from datawindow within w_generar_estadist
integer x = 1271
integer y = 396
integer width = 2272
integer height = 652
integer taborder = 60
string title = "none"
string dataobject = "dw_campos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject( sqlca)
end event

event buttonclicked;string tipo, pregunta
long numcampo

dw_campos_encuesta.accepttext( )
tipo=dw_campos_encuesta.getitemstring( row,'tipo')
numcampo=dw_campos_encuesta.getitemnumber( row,'numcampo')
pregunta=dw_campos_encuesta.getitemstring( row,'descampo')
f_genera_histogramas( tipo,numcampo, pregunta)

end event

type dw_campos_encu from datawindow within w_generar_estadist
boolean visible = false
integer x = 50
integer y = 488
integer width = 997
integer height = 160
integer taborder = 70
string title = "none"
string dataobject = "dw_combo_campos"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;
//visible=false
settransobject(sqlca)
insertrow(1)
getchild('codplantilla',i_dw_campos)
i_dw_campos.settransobject(sqlca)


end event

event itemchanged;long i,numcampo,nulo

i_numcampo=long(data)

i_dw_campos.accepttext( )
dw_campos_encu.accepttext( )

long  padre,j
string tipo

i_dw_campos2.reset( )
dw_campos_encu2.event constructor( )

i_dw_campos2.retrieve(i_codplant)	//retrieve del dw_child de Campos de la Encuesta desplegable
for i=i_dw_campos2.rowcount( ) to 1 step -1
	tipo=i_dw_campos2.getitemstring( i, "tipo")
	if tipo='U' then 
		numcampo=i_dw_campos2.getitemnumber( i, 'numcampo')
		for  j=i_dw_campos2.rowcount( ) to 1 step -1
			padre=i_dw_campos2.getitemnumber( j, 'padre')
			if padre=numcampo then i_dw_campos2.deleterow( j)
		next
	end if
next

nulo=i_dw_campos.find( "numcampo = "+string(i_numcampo), 1, i_dw_campos.rowcount( ) )	//busca el campo que selecciono en el primer
i_tipo1=i_dw_campos.getitemstring( nulo, 'tipo')
i_nombre=i_dw_campos.getitemstring( nulo, 'descampo')

for i = 1 to i_dw_campos2.rowcount()
	numcampo=i_dw_campos2.getitemnumber( i, 'numcampo')
	if numcampo=i_numcampo then
		i_dw_campos2.deleterow( i)
	end if
next

if i_tipo1='U' then
	for i=i_dw_campos2.rowcount( ) to 1 step -1
	tipo=i_dw_campos2.getitemstring( i, "tipo")
	if tipo='U' then 
		numcampo=i_dw_campos2.getitemnumber( i, 'numcampo')
		for  j=i_dw_campos2.rowcount( ) to 1 step -1
			padre=i_dw_campos2.getitemnumber( j, 'padre')
			if padre=numcampo then i_dw_campos2.deleterow( j)
		next
		i_dw_campos2.deleterow( i)
	end if
next
end if
end event

type dw_estad from datawindow within w_generar_estadist
boolean visible = false
integer x = 105
integer y = 508
integer width = 603
integer height = 472
integer taborder = 110
string title = "none"
string dataobject = "dw_estadisticas"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject( sqlca)


end event

type st_5 from statictext within w_generar_estadist
integer x = 27
integer y = 296
integer width = 480
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipos de Estadísticas:"
boolean focusrectangle = false
end type

type ddlb_tipo_estad from dropdownlistbox within w_generar_estadist
integer x = 27
integer y = 352
integer width = 722
integer height = 320
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Generales","Descriptivas","Tablas Cruzadas"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;long i
i_indice=index
string descrip,plantilla

select descripcion into :descrip from lugar where codlugar=:clugar;
SELECT DESPLANTILLA into :plantilla FROM ATU_PLANT WHERE CODPLANTILLA=:i_codplant;


for i=1 to dw_campos_encuesta.rowcount( )
	dw_campos_encuesta.setitem( i, 'cruz', '0')
next
for i=1 to dw_campos_encuesta.rowcount( )
	dw_campos_encuesta.setitem( i, 'num', '0')
next
for i=1 to dw_estad.rowcount( )
	dw_estad.setitem( i, 'chequeo', '0')
next

dw_campos_encu.setitem( 1, 'codplantilla', "")
dw_campos_encu2.setitem( 1, 'codplantilla', "")

if index=1 then	//Generales
	f_retrieve_dw_campos(dw_campos_encuesta,i_codplant,index)
	dw_campos_encu.visible=false
	dw_campos_encu2.visible=false
	st_filas.visible=false
	st_columnas.visible=false
	gb_2.visible=true
	dw_estad.visible=true
	cbx_frec_moda.visible=false
	dw_campos_encuesta.enabled=true

elseif index=2 then		//Descriptivo
	f_retrieve_dw_campos(dw_campos_encuesta,i_codplant,index)	
	dw_campos_encu.visible=false
	dw_campos_encu2.visible=false
	st_filas.visible=false
	st_columnas.visible=false
	gb_2.visible=false
	dw_estad.visible=false
	dw_campos_encuesta.enabled=true
//	dw_resul_descript.Object.t_2.Text =descrip
	dw_resul_descript.Object.t_2.Text =dw_lugar.getitemstring(dw_lugar.getrow(),'descripcion')
	dw_resul_descript.Object.t_4.Text =plantilla
	cbx_frec_moda.visible=true
elseif index=3 then	//Tablas Cruzadas
	f_retrieve_dw_campos(dw_campos_encuesta,i_codplant,index)
	dw_campos_encu.visible=true
	dw_campos_encu2.visible=true
	st_filas.visible=true
	st_columnas.visible=true
	gb_2.visible=false
	dw_estad.visible=false
	cbx_frec_moda.visible=false
	dw_campos_encuesta.enabled=false

//elseif index=4 then	//Histogramas
//	f_retrieve_dw_campos(dw_campos_encuesta,i_codplant,index)
//	dw_campos_encu.visible=false
//	gb_2.visible=false
//	dw_estad.visible=false
//	cbx_frec_moda.visible=false
//	gb_5.visible=false
end if

pb_genera_tablas.event clicked( )
pb_imprimir.enabled=false
end event

type st_4 from statictext within w_generar_estadist
integer x = 3049
integer y = 48
integer width = 503
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de Encuestas:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_generar_estadist
integer x = 1906
integer y = 212
integer width = 155
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_generar_estadist
integer x = 1294
integer y = 212
integer width = 169
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_generar_estadist
integer x = 1294
integer y = 148
integer width = 631
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entre el intervalo de fechas:"
boolean focusrectangle = false
end type

type em_hasta from editmask within w_generar_estadist
integer x = 2062
integer y = 212
integer width = 379
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event modified;//string fecha1,fecha2
long no_dias

i_fecha1=em_desde.text
i_fecha2=em_hasta.text

no_dias=DaysAfter(date(i_fecha1), date(i_fecha2))
if no_dias<0 then 
	messagebox("Error Fecha","El intervalo de fecha es erroneo.")
	em_desde.text="00/00/0000"
	em_hasta.text="00/00/0000"
	sle_no_encu.text=""
else
	i_dw_encues.setfilter("")
	i_dw_encues.filter( )
	i_dw_encues.retrieve(i_codplant,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))
	i_dw_encues.setfilter(" (date(fecha_reg) >= date("+string (date(i_fecha1),'yyyy-mm-dd')+")) and (date(fecha_reg) <= date("+string(date(i_fecha2),'yyyy-mm-dd')+"))")
	i_dw_encues.filter( )
	sle_no_encu.text=string(i_dw_encues.rowcount( ))
end if
end event

type em_desde from editmask within w_generar_estadist
integer x = 1477
integer y = 212
integer width = 379
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type cbx_todas from checkbox within w_generar_estadist
integer x = 1285
integer y = 72
integer width = 549
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todas las encuestas"
end type

event clicked;i_dw_encues.setfilter("")
i_dw_encues.filter( )

if cbx_todas.checked=true then
	em_desde.enabled=false
	em_hasta.enabled=false
	em_desde.text="00/00/0000"
	em_hasta.text="00/00/0000"
	i_fecha1="1900-01-01"
	i_fecha2=string(Today ( ))
	long cuantas_encu
		
	i_dw_encues.retrieve(i_codplant,dw_lugar.getitemstring(dw_lugar.getrow(),'Codlugar'))
	cuantas_encu=i_dw_encues.getitemnumber(1,'comp_cuantas_encu')
	sle_no_encu.text=string(cuantas_encu)
else
	em_desde.enabled=true
	em_hasta.enabled=true
	sle_no_encu.text=""
end if
end event

type dw_platillas from datawindow within w_generar_estadist
integer y = 8
integer width = 1170
integer height = 160
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_plantilla"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject( sqlca)
retrieve( )
insertrow( 1)
end event

event itemchanged;long i,numcampo,j,padre
string tipo

i_codplant=data
i_dw_campos.retrieve(i_codplant)	//retrieve del dw_child de Campos de la Encuesta desplegable
for i=i_dw_campos.rowcount( ) to 1 step -1
	tipo=i_dw_campos.getitemstring( i, "tipo")
	if tipo='U' then 
		numcampo=i_dw_campos.getitemnumber( i, 'numcampo')
		for  j=i_dw_campos.rowcount( ) to 1 step -1
			padre=i_dw_campos.getitemnumber( j, 'padre')
			if padre=numcampo then i_dw_campos.deleterow( j)
		next
		//i_dw_campos.deleterow( i)
	end if
next

i_dw_campos2.retrieve(i_codplant)	//retrieve del dw_child de Campos de la Encuesta desplegable2
for i=i_dw_campos2.rowcount( ) to 1 step -1
	tipo=i_dw_campos2.getitemstring( i, "tipo")
	if tipo='U' then 
		numcampo=i_dw_campos2.getitemnumber( i, 'numcampo')
		for  j=i_dw_campos2.rowcount( ) to 1 step -1
			padre=i_dw_campos2.getitemnumber( j, 'padre')
			if padre=numcampo then i_dw_campos2.deleterow( j)
		next
		i_dw_campos2.deleterow( i)
	end if
next

dw_campos_encuesta.retrieve(i_codplant)	//retrieve del dw campos de la Encuesta
for i=dw_campos_encuesta.rowcount( ) to 1 step -1
	tipo=dw_campos_encuesta.getitemstring( i, "tipo")
	if tipo='U' then 
		numcampo=dw_campos_encuesta.getitemnumber( i, 'numcampo')
		for  j=dw_campos_encuesta.rowcount( ) to 1 step -1
			padre=dw_campos_encuesta.getitemnumber( j, 'padre')
			if padre=numcampo then dw_campos_encuesta.deleterow( j)
		next
	end if
next

dw_campos_encu.setitem( 1, 'codplantilla', "")
dw_campos_encu2.setitem( 1, 'codplantilla', "")

cbx_todas.event clicked( )


end event

type gb_1 from groupbox within w_generar_estadist
integer x = 1243
integer y = 8
integer width = 1431
integer height = 316
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar encuestas"
end type

type gb_2 from groupbox within w_generar_estadist
boolean visible = false
integer x = 37
integer y = 444
integer width = 1079
integer height = 568
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valores"
end type

type gb_3 from groupbox within w_generar_estadist
integer x = 1248
integer y = 344
integer width = 2318
integer height = 732
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Campos de la Encuesta:"
end type

type dw_resul_descript from datawindow within w_generar_estadist
boolean visible = false
integer x = 110
integer y = 1200
integer width = 3424
integer height = 832
integer taborder = 210
string title = "none"
string dataobject = "dw_result_descript"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_resultados_histog from datawindow within w_generar_estadist
boolean visible = false
integer x = 110
integer y = 1200
integer width = 3397
integer height = 832
integer taborder = 170
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type dw_resultados_cruz from datawindow within w_generar_estadist
integer x = 110
integer y = 1200
integer width = 3401
integer height = 832
integer taborder = 160
string title = "none"
string dataobject = "dw_resul_cruz"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;this.visible=false
end event

type dw_resultados from datawindow within w_generar_estadist
integer x = 110
integer y = 1200
integer width = 3415
integer height = 832
integer taborder = 150
string title = "none"
string dataobject = "dw_resul"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.visible=false
end event

type gb_4 from groupbox within w_generar_estadist
integer x = 37
integer y = 1100
integer width = 3529
integer height = 1444
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Análisis Estadístico"
end type

type dw_tabla_cruzada from datawindow within w_generar_estadist
integer x = 110
integer y = 1200
integer width = 3397
integer height = 1304
integer taborder = 180
string title = "none"
string dataobject = "dw_tabla_cruzada"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject( sqlca)

end event

