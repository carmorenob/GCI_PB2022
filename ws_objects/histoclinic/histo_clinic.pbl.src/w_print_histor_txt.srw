$PBExportHeader$w_print_histor_txt.srw
$PBExportComments$Ventana xa impesión de Historia Clinica con el formato ahora de texto
forward
global type w_print_histor_txt from window
end type
type rb_3 from radiobutton within w_print_histor_txt
end type
type cbx_1 from checkbox within w_print_histor_txt
end type
type dw_3 from datawindow within w_print_histor_txt
end type
type pb_3 from picturebutton within w_print_histor_txt
end type
type rb_2 from radiobutton within w_print_histor_txt
end type
type rb_comp from radiobutton within w_print_histor_txt
end type
type ddl_tipo from dropdownlistbox within w_print_histor_txt
end type
type gb_1 from groupbox within w_print_histor_txt
end type
type pb_1 from picturebutton within w_print_histor_txt
end type
type pb_2 from picturebutton within w_print_histor_txt
end type
type dw_1 from datawindow within w_print_histor_txt
end type
type dw_2 from datawindow within w_print_histor_txt
end type
end forward

global type w_print_histor_txt from window
integer width = 4283
integer height = 1792
boolean titlebar = true
string title = "Imprimir Historia Clínica"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "conf_imp.ico"
boolean clientedge = true
boolean center = true
rb_3 rb_3
cbx_1 cbx_1
dw_3 dw_3
pb_3 pb_3
rb_2 rb_2
rb_comp rb_comp
ddl_tipo ddl_tipo
gb_1 gb_1
pb_1 pb_1
pb_2 pb_2
dw_1 dw_1
dw_2 dw_2
end type
global w_print_histor_txt w_print_histor_txt

type variables
trae 		ist_historial

string 	is_sql1
string 	is_f_imprime

constant string is_sql_res1="SELECT DISTINCT 	historial.contador, historial.clugar, historial.indapdx, historial.fecha, '1' AS sel_ing, '1' AS sel_plant, hclin_registro.tipo AS cual, 	hclin_registro.nregistro, 					hclin_registro.desplantilla, 	hclin_registro.codplantilla, 	hclin_registro.ingreso, hclin_registro.tipo 	FROM historial INNER JOIN hclin_registro ON (historial.clugar = hclin_registro.clugar) AND (historial.Contador = hclin_registro.contador) WHERE (hclin_registro.tipo not in ('E','R','F') ) AND (historial.indapdx in ('2','3','4','7') ) "
constant string is_sql_res2="UNION ALL SELECT 	historial.contador, historial.clugar, historial.indapdx, historial.fecha, '1' AS sel_ing, '1' AS sel_plant, 'EPI' AS cual, 					0 AS nregistro, 								'Resumen de Evolución' , 		'EPI' , 								'K',							'P' 						FROM historial INNER JOIN evolucionhc ON (historial.contador = evolucionhc.contador) AND (historial.clugar = evolucionhc.clugar) 			WHERE (historial.indapdx in ('2','3','4','7') )"
//constant string is_sql_res3="UNION ALL SELECT 	Historial.contador, Historial.clugar, Historial.IndApDx, Historial.Fecha, '1' AS sel_ing, '1' AS sel_plant, 'NQX' AS cual, 					QxCabActo.Numero_ingre as nregistro, 	'Notas quirúrgicas' , 			'NOQX' , 							'Q' , 						'Q' 						FROM Historial INNER JOIN QxCabActo ON (Historial.clugar = QxCabActo.clugar_his) AND (Historial.Contador = QxCabActo.contador)"

string 	is_sql_paci , is_sql_actual_ing

uo_datastore ids_rep
end variables

on w_print_histor_txt.create
this.rb_3=create rb_3
this.cbx_1=create cbx_1
this.dw_3=create dw_3
this.pb_3=create pb_3
this.rb_2=create rb_2
this.rb_comp=create rb_comp
this.ddl_tipo=create ddl_tipo
this.gb_1=create gb_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_1=create dw_1
this.dw_2=create dw_2
this.Control[]={this.rb_3,&
this.cbx_1,&
this.dw_3,&
this.pb_3,&
this.rb_2,&
this.rb_comp,&
this.ddl_tipo,&
this.gb_1,&
this.pb_1,&
this.pb_2,&
this.dw_1,&
this.dw_2}
end on

on w_print_histor_txt.destroy
destroy(this.rb_3)
destroy(this.cbx_1)
destroy(this.dw_3)
destroy(this.pb_3)
destroy(this.rb_2)
destroy(this.rb_comp)
destroy(this.ddl_tipo)
destroy(this.gb_1)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_1)
destroy(this.dw_2)
end on

event open;ist_historial=message.powerobjectparm
blob objs
setnull(objs)

is_sql1=dw_1.getsqlselect()

select imprime into :is_f_imprime from tipoingreso where codtingre=:ist_historial.tingres;

if isnull(is_f_imprime) then is_f_imprime='1'

if is_f_imprime='1' then
	title+=' Secuencial'
else
	title+=' Agrupada'
end if


is_sql_paci=" historial.tipodoc='"+tipdoc+"' and historial.documento='"+docu+"' "
is_sql_actual_ing=" and historial.contador="+string(ist_historial.numero)+" and historial.clugar='"+ist_historial.lugar+"'"
ids_rep=create uo_datastore

selectblob corpograma into :objs from evolucionhc 
where contador=:ist_historial.numero and clugar=:ist_historial.lugar;

if not isnull(objs) then
	if dw_3.create(string(objs))=-1 then
		pb_3.enabled=false
		return
	end if
	dw_3.settransobject(sqlca)
	dw_3.retrieve(ist_historial.numero,ist_historial.lugar)
	dw_3.Modify("DataWindow.header.height=560")
else
	pb_3.enabled=false
end if

ddl_tipo.event selectionchanged(1)
end event

type rb_3 from radiobutton within w_print_histor_txt
integer x = 1394
integer y = 64
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Referencia"
end type

event clicked;dw_1.visible=false
dw_2.visible=true

end event

type cbx_1 from checkbox within w_print_histor_txt
boolean visible = false
integer x = 1906
integer y = 76
integer width = 361
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Envia email"
end type

type dw_3 from datawindow within w_print_histor_txt
boolean visible = false
integer x = 2395
integer y = 4
integer width = 114
integer height = 116
integer taborder = 60
boolean enabled = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_3 from picturebutton within w_print_histor_txt
boolean visible = false
integer x = 1737
integer y = 28
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cuerpo.gif"
string disabledname = "d_cuerpo.gif"
alignment htextalign = left!
string powertiptext = "Impresión Corpograma"
end type

event clicked;long Job

Job = PrintOpen( "Imprimiendo Corpograma")
printdatawindow(Job,dw_3)
//dw_3.Print(Job, 2327,2608)
PrintClose(Job)
end event

type rb_2 from radiobutton within w_print_histor_txt
integer x = 1070
integer y = 64
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen"
end type

event clicked;dw_1.visible=false
dw_2.visible=true

end event

type rb_comp from radiobutton within w_print_histor_txt
integer x = 672
integer y = 64
integer width = 352
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Completo(a)"
boolean checked = true
end type

event clicked;dw_1.visible=true
dw_2.visible=false

end event

type ddl_tipo from dropdownlistbox within w_print_histor_txt
integer x = 64
integer y = 60
integer width = 581
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string item[] = {"El Actual Ingreso","Toda la Historia"}
integer accelerator = 105
borderstyle borderstyle = stylelowered!
end type

event constructor;text='El Actual Ingreso'

end event

event selectionchanged;dw_1.setredraw(false)
string sql_tod,sql_res

dw_1.visible=false
dw_2.visible=false

if index=1 then
	sql_tod=is_sql1+' where '+is_sql_paci+ is_sql_actual_ing
	sql_res=is_sql_res1+' and '+is_sql_paci+ is_sql_actual_ing + is_sql_res2+' and ' + is_sql_paci + is_sql_actual_ing// + is_sql_res3+' where' + is_sql_paci + is_sql_actual_ing
else
	sql_tod=is_sql1+' where '+ is_sql_paci
	sql_res=is_sql_res1+' and '+ is_sql_paci + is_sql_res2+' and' + is_sql_paci //+ is_sql_res3+' and '+ is_sql_paci
end if

if rb_comp.checked then 
	dw_1.visible=true
else
	dw_2.visible=true
end if

dw_1.setsqlselect(sql_tod)
dw_2.setsqlselect(sql_res)

dw_1.retrieve()
dw_2.retrieve()

if is_f_imprime='2' then //secuencial 
	dw_1.setsort('hf ds , fecha as , xa_orden as , nregistro as , desplantilla as')
else //agrupada
	dw_1.setsort('hf ds , xa_orden_agrup as , fecha as , ')
end if

dw_1.sort()
dw_1.groupcalc()

dw_2.sort()
dw_2.groupcalc()

end event

type gb_1 from groupbox within w_print_histor_txt
integer x = 37
integer width = 1682
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir"
end type

type pb_1 from picturebutton within w_print_histor_txt
integer x = 1957
integer y = 1492
integer width = 146
integer height = 128
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;string l_temporal
datawindow ldw_regs

l_temporal="C:\windows\temp\"+tipdoc+docu+".jpg"
f_foto_paciente(tipdoc,docu,l_temporal)

ldw_regs=dw_1
if rb_2.checked OR rb_3.checked then ldw_regs=dw_2

if ldw_regs.getitemnumber(1,'sum_plant')=0 then
	Messagebox("Atención","Debe elegir algún registro para imprimir")
	return
end if

if isvalid(w_reporte_gral) then close(w_reporte_gral)
setnull(message.powerobjectparm)
opensheetwithparm(w_reporte_gral,message.powerobjectparm,w_principal,7,original!)

string ls_tipo_impr='1'

if rb_2.checked then ls_tipo_impr='2'
if rb_3.checked then ls_tipo_impr='3'

w_reporte_gral.wf_imprime_historia(ldw_regs,ls_tipo_impr)


FileDelete(l_temporal)
close(parent)
end event

type pb_2 from picturebutton within w_print_histor_txt
integer x = 2121
integer y = 1492
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_print_histor_txt
event cambia_estado ( string dato,  long fila_ante,  string filtro_ante )
event pe_cambio_plant ( long fila_ant,  string filtro_ante )
integer x = 32
integer y = 184
integer width = 4178
integer height = 1280
integer taborder = 40
string title = "Completa"
string dataobject = "dw_histo_plant_sec"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event cambia_estado(string dato, long fila_ante, string filtro_ante);long j
accepttext()
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)	
next
setfilter(filtro_ante)
filter()
sort()
groupcalc()
scrolltorow(fila_ante)
setredraw(true)
end event

event pe_cambio_plant(long fila_ant, string filtro_ante);long j
string dato
accepttext()
if filtro_ante='' then
	setfilter('contador='+string(getitemnumber(fila_ant,'contador')))
else
	setfilter(filtro_ante+' and contador='+string(getitemnumber(fila_ant,'contador')))
end if
filter()
groupcalc()
if getitemnumber(1,'sum_plant')=0 then
	dato='0'
elseif getitemnumber(1,'sum_plant')<rowcount() then
	dato='2'
else
	dato='1'
end if
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)
next
setfilter(filtro_ante)
filter()
sort()
groupcalc()
setcolumn('sel_plant')
scrolltorow(fila_ant)
setredraw(true)
end event

event constructor;settransobject(sqlca)
end event

event clicked;if row<1 then return
scrolltorow(row)
end event

event itemchanged;long j,fila_actual
string dato,filtro_actu
fila_actual=getrow()
filtro_actu=describe("datawindow.table.filter")
if filtro_actu='?' then filtro_actu=''
setredraw(false)
choose case dwo.name
	case 'sel_ing'
		if getitemstring(fila_actual,'sel_ing')='1' or getitemstring(fila_actual,'sel_ing')='2' then
			dato='0'
		else
			dato='1'
		end if
		if filtro_actu='' then
			setfilter('contador='+string(getitemnumber(fila_actual,'contador')))
		else
			setfilter(filtro_actu+' and contador='+string(getitemnumber(fila_actual,'contador')))
		end if
		filter()
		for j=1 to rowcount()
			if getitemstring(j,'tipo')='F' then 
				setitem(j,'sel_plant','0')
			else	
				setitem(j,'sel_plant',dato)
			end if
		next
		post event cambia_estado(dato,fila_actual,filtro_actu)
	case 'sel_plant'
		accepttext()
		post event pe_cambio_plant(fila_actual,filtro_actu)
end choose

end event

event buttonclicked;setredraw(false)
string dato
long j
if dwo.tag='d' then
	dato='0'
	modify('b_1.tag="s"')
else
	modify('b_1.tag="d"')
	dato='1'
end if
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)
	if getitemstring(j,'tipo')='F' then 
		setitem(j,'sel_plant','0')
	else	
		setitem(j,'sel_plant',dato)
	end if
next
setredraw(true)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=describe('b_1.background.color')
openwithparm(w_funcion_dw,st_dw)

end event

type dw_2 from datawindow within w_print_histor_txt
event cambia_estado ( string dato,  long fila_ante,  string filtro_ante )
event pe_cambio_plant ( long fila_ant,  string filtro_ante )
boolean visible = false
integer x = 32
integer y = 184
integer width = 4178
integer height = 1280
integer taborder = 50
string title = "Pa imprimir lo de evolucion"
string dataobject = "dw_histo_resumen"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event cambia_estado(string dato, long fila_ante, string filtro_ante);long j
accepttext()
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)	
next
setfilter(filtro_ante)
filter()
sort()
groupcalc()
scrolltorow(fila_ante)
setredraw(true)
end event

event pe_cambio_plant(long fila_ant, string filtro_ante);long j
string dato
accepttext()
if filtro_ante='' then
	setfilter('contador='+string(getitemnumber(fila_ant,'contador')))
else
	setfilter(filtro_ante+' and contador='+string(getitemnumber(fila_ant,'contador')))
end if
filter()
groupcalc()
if getitemnumber(1,'sum_plant')=0 then
	dato='0'
elseif getitemnumber(1,'sum_plant')<rowcount() then
	dato='2'
else
	dato='1'
end if
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)
next
setfilter(filtro_ante)
filter()
sort()
groupcalc()
setcolumn('sel_plant')
scrolltorow(fila_ant)
setredraw(true)
end event

event clicked;if row<1 then return
scrolltorow(row)
end event

event buttonclicked;setredraw(false)
string dato
long j
if dwo.tag='d' then
	dato='0'
	modify('b_1.tag="s"')
else
	modify('b_1.tag="d"')
	dato='1'
end if
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)
	setitem(j,'sel_plant',dato)
next
setredraw(true)
end event

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=describe('b_1.background.color')
openwithparm(w_funcion_dw,st_dw)
end event

event itemchanged;long j,fila_actual
string dato,filtro_actu
fila_actual=getrow()
filtro_actu=describe("datawindow.table.filter")
if filtro_actu='?' then filtro_actu=''
setredraw(false)
choose case dwo.name
	case 'sel_ing'
		if getitemstring(fila_actual,'sel_ing')='1' or getitemstring(fila_actual,'sel_ing')='2' then
			dato='0'
		else
			dato='1'
		end if
		if filtro_actu='' then
			setfilter('contador='+string(getitemnumber(fila_actual,'contador')))
		else
			setfilter(filtro_actu+' and contador='+string(getitemnumber(fila_actual,'contador')))
		end if
		filter()
		for j=1 to rowcount()
			setitem(j,'sel_plant',dato)
		next
		post event cambia_estado(dato,fila_actual,filtro_actu)
	case 'sel_plant'
		accepttext()
		post event pe_cambio_plant(fila_actual,filtro_actu)
end choose
end event

