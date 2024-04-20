$PBExportHeader$w_busca_fact_cartera.srw
forward
global type w_busca_fact_cartera from window
end type
type rb_fcap from radiobutton within w_busca_fact_cartera
end type
type dw_encuentra from datawindow within w_busca_fact_cartera
end type
type pb_busca from picturebutton within w_busca_fact_cartera
end type
type pb_2 from picturebutton within w_busca_fact_cartera
end type
type st_2 from statictext within w_busca_fact_cartera
end type
type dw_busca from datawindow within w_busca_fact_cartera
end type
type rb_si from radiobutton within w_busca_fact_cartera
end type
type rb_rd from radiobutton within w_busca_fact_cartera
end type
type rb_feve from radiobutton within w_busca_fact_cartera
end type
type pb_cancel from picturebutton within w_busca_fact_cartera
end type
type pb_ok from picturebutton within w_busca_fact_cartera
end type
type gb_1 from groupbox within w_busca_fact_cartera
end type
end forward

global type w_busca_fact_cartera from window
integer width = 4315
integer height = 1932
boolean titlebar = true
string title = "Búsqueda en Cartera por"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rb_fcap rb_fcap
dw_encuentra dw_encuentra
pb_busca pb_busca
pb_2 pb_2
st_2 st_2
dw_busca dw_busca
rb_si rb_si
rb_rd rb_rd
rb_feve rb_feve
pb_cancel pb_cancel
pb_ok pb_ok
gb_1 gb_1
end type
global w_busca_fact_cartera w_busca_fact_cartera

type variables
string orden,anterior
st_xa_buscar_pre i_st

end variables

on w_busca_fact_cartera.create
this.rb_fcap=create rb_fcap
this.dw_encuentra=create dw_encuentra
this.pb_busca=create pb_busca
this.pb_2=create pb_2
this.st_2=create st_2
this.dw_busca=create dw_busca
this.rb_si=create rb_si
this.rb_rd=create rb_rd
this.rb_feve=create rb_feve
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.gb_1=create gb_1
this.Control[]={this.rb_fcap,&
this.dw_encuentra,&
this.pb_busca,&
this.pb_2,&
this.st_2,&
this.dw_busca,&
this.rb_si,&
this.rb_rd,&
this.rb_feve,&
this.pb_cancel,&
this.pb_ok,&
this.gb_1}
end on

on w_busca_fact_cartera.destroy
destroy(this.rb_fcap)
destroy(this.dw_encuentra)
destroy(this.pb_busca)
destroy(this.pb_2)
destroy(this.st_2)
destroy(this.dw_busca)
destroy(this.rb_si)
destroy(this.rb_rd)
destroy(this.rb_feve)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.gb_1)
end on

event open;i_st=message.powerobjectparm
dw_busca.dataobject=''
//i_rep=create uo_report

choose case i_st.cdoc
	case 'factu'
		rb_feve.triggerevent(clicked!)
	case 'reci'
		rb_rd.triggerevent(clicked!)
		rb_rd.checked=true
end choose

end event

type rb_fcap from radiobutton within w_busca_fact_cartera
integer x = 59
integer y = 152
integer width = 471
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factura Capita Gci"
end type

event clicked;if dw_busca.dataobject<>'dw_xa_buscar_radica_cartera' then
	dw_busca.dataobject='dw_xa_buscar_radica_cartera'
	dw_busca.insertrow(0)
	dw_busca.setitem(1,1,"ripsradica.num_radicacion=")
	dw_encuentra.dataobject="dw_busca_radica"
	dw_encuentra.settransobject(sqlca)
end if
dw_busca.setcolumn(2)

end event

type dw_encuentra from datawindow within w_busca_fact_cartera
event mousemove pbm_mousemove
integer x = 32
integer y = 520
integer width = 4160
integer height = 1052
integer taborder = 40
string dragicon = "none!"
string dataobject = "dw_busca_factura"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//if dwo.type = "text" then 
//	string cual,ojo,ss
//	cual=dwo.name
//	cual=mid(cual,1,len(cual) - 2)
//	if anterior=cual then
//		if orden="A" then
//			orden="D"
//		else
//			orden="A"
//		end if
//	else
//		orden="A"
//	end if
//	dw_encuentra.setsort(cual+" "+orden)
//	dw_encuentra.sort()
//	anterior=cual
//end if
end event

event rowfocuschanged;st_2.text="Reg. "+string(this.getrow())+" de "+string(this.rowcount())
end event

event doubleclicked;if dwo.type="text" then return
pb_ok.triggerevent(clicked!)
end event

type pb_busca from picturebutton within w_busca_fact_cartera
event mousemove pbm_mousemove
integer x = 2875
integer y = 20
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &b"
boolean default = true
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar [Alt+B]"
end type

event clicked;long i,cuantas
dw_busca.accepttext()
cuantas=dw_busca.rowcount()
string comilla,Sql_text
if rb_feve.checked then 
	Sql_text="SELECT DISTINCT factcab.nfact, factcab.clugar, factcab.tipo,factcab.fecha,factcpo.tipodoc,factcpo.documento,pacientes.nombre1,pacientes.nombre2,pacientes.apellido1,pacientes.apellido2,factcab.vtproced,factcab.vtemp,factcab.vtcancelo,factcab.estado,factcab.codtingre,factcpo.nrcaj,factcpo.clugar_rec,factcab.nradica,empresa.desemp,case when factcpo.NFACT_REF is null then 'No' else 'Si' end as refa,factcab.estado_dian, factcab.file_name_fact, factcab.file_name_fact_anul,factcab.file_name_zip,factcab.file_name_zip_anul 	FROM ((factcab INNER JOIN factcpo ON (factcab.nfact = factcpo.nfact) AND (factcab.clugar = factcpo.clugar) AND (factcab.tipo = factcpo.tipo)) INNER JOIN pacientes ON (factcpo.tipodoc = pacientes.tipodoc) AND (factcpo.documento = pacientes.documento)) INNER JOIN empresa ON factcab.cemp = empresa.codemp	WHERE  (factcab.nradica Is Not Null) and "
end if

if rb_rd.checked then 
	Sql_text="SELECT distinct documentos_autfact.prefijo, ripsradica.num_radicacion, ripsradica.clugar, ripsradica.tipo, ripsradica.fecha_radica, ripsradica.fecha_inicial, ripsradica.fecha_final, ripsradica.contabil, ripsradica.valor_evento, ripsradica.nro_factu, ripsradica.estado_dian, ripsradica.file_name_fact, ripsradica.file_name_zip, empresa.desemp, empresa.nit, empresa.tipodoc,ripsradica.estado,ripsradica.valor_capita,car_cobro_cpo.num_cobro FROM  ((ripsradica INNER JOIN empresa ON ripsradica.cemp = empresa.codemp) LEFT JOIN documentos_autfact ON ripsradica.c_aut = documentos_autfact.c_aut) INNER JOIN car_cobro_cpo ON (ripsradica.tipo = car_cobro_cpo.tipo_rad) AND (ripsradica.clugar = car_cobro_cpo.clugar_rad) AND (ripsradica.num_radicacion = car_cobro_cpo.num_radicacion) WHERE 	(((ripsradica.tipo)='R') AND ((ripsradica.estado) Is Null)) and "
end if
if rb_fcap.checked then 
	Sql_text="SELECT distinct documentos_autfact.prefijo, ripsradica.num_radicacion, ripsradica.clugar, ripsradica.tipo, ripsradica.fecha_radica, ripsradica.fecha_inicial, ripsradica.fecha_final, ripsradica.contabil, ripsradica.valor_evento, ripsradica.nro_factu, ripsradica.estado_dian, ripsradica.file_name_fact, ripsradica.file_name_zip, empresa.desemp, empresa.nit, empresa.tipodoc,ripsradica.estado,ripsradica.valor_capita,car_cobro_cpo.num_cobro FROM  ((ripsradica INNER JOIN empresa ON ripsradica.cemp = empresa.codemp) LEFT JOIN documentos_autfact ON ripsradica.c_aut = documentos_autfact.c_aut) INNER JOIN car_cobro_cpo ON (ripsradica.tipo = car_cobro_cpo.tipo_rad) AND (ripsradica.clugar = car_cobro_cpo.clugar_rad) AND (ripsradica.num_radicacion = car_cobro_cpo.num_radicacion) WHERE 	(((ripsradica.tipo)='F') AND ((ripsradica.estado) Is Null)) and "
end if
if rb_si.checked then 
	Sql_text="SELECT car_cobro_cab.clugar, car_cobro_cab.coddoc, car_cobro_cab.num_cobro, car_cobro_cab.fecha,car_cobro_cab.vtcobro, car_cobro_cab.estado, terceros.tipodoc, terceros.documento,terceros.razon_social, car_cobro_cab.nro_soporte, car_cobro_cab.cxp, car_cobro_cab.documento FROM car_cobro_cab INNER JOIN terceros ON (car_cobro_cab.documento = terceros.documento) AND (car_cobro_cab.tipodoc = terceros.tipodoc) WHERE (((car_cobro_cab.estado) Is Null) AND ((car_cobro_cab.cxp)='2')) and "
end if

for i=1 to cuantas
	if trim(dw_busca.getitemstring(i,"nom_campo"))="" or trim(dw_busca.getitemstring(i,"valor"))="" then 
		messagebox("Atención","Complete las condiciones de búsqueda")
		return
	end if
	if rb_feve.checked then
		if dw_busca.getitemstring(i,"nom_campo")<>'factcab.nfact = ' then
			comilla="'"
		else
			if not isnumber(dw_busca.getitemstring(i,"valor")) then
				messagebox("Error","La condición de búsqueda por ser numérica no admite comodines o caracteres diferentes a números")
				return
			end if
			comilla=""
		end if
	end if
	if rb_rd.checked or rb_fcap.checked then 
		if dw_busca.getitemstring(i,"nom_campo")<>'ripsradica.num_radicacion=' and dw_busca.getitemstring(i,"nom_campo")<>'ripsradica.num_radicacion='then
			comilla="'"
		else
			if not isnumber(dw_busca.getitemstring(i,"valor")) then
				messagebox("Error","La condición de búsqueda por ser numérica no admite comodines o caracteres diferentes a números")
				return
			end if
			comilla=""
		end if
	end if
	if rb_si.checked then 
		if dw_busca.getitemstring(i,"nom_campo")<>'car_cobro_cab.nro_soporte=' and dw_busca.getitemstring(i,"nom_campo")<>'car_cobro_cab.nro_soporte=' then
			comilla="'"
		else
			if not isnumber(dw_busca.getitemstring(i,"valor")) then
				messagebox("Error","La condición de búsqueda por ser numérica no admite comodines o caracteres diferentes a números")
				return
			end if
			comilla="'"
		end if
	end if
	
	sql_text=sql_text+dw_busca.getitemstring(i,"nom_campo")
	sql_text=sql_text+comilla+dw_busca.getitemstring(i,"valor")+comilla+" "
	sql_text=sql_text+dw_busca.getitemstring(i,"condicion")
next
i=dw_encuentra.SetSQLSelect(sql_text)
dw_encuentra.retrieve()
if dw_encuentra.rowcount()>=1 then
	dw_encuentra.scrolltorow(1)
//	pb_4.setfocus()
end if
end event

type pb_2 from picturebutton within w_busca_fact_cartera
event mousemove pbm_mousemove
integer x = 2875
integer y = 156
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Fila de Búsqueda"
end type

event clicked;if dw_busca.rowcount()= 1 then return
dw_busca.deleterow(0)
end event

type st_2 from statictext within w_busca_fact_cartera
integer x = 46
integer y = 424
integer width = 617
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_busca from datawindow within w_busca_fact_cartera
event mousemove pbm_mousemove
integer x = 686
integer y = 28
integer width = 1998
integer height = 468
integer taborder = 20
string dragicon = "none!"
string title = "Busqueda de pacientes"
string dataobject = "dw_xa_buscar_fact_cartera"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
if this.getcolumnname()="condicion" then
	long fila,cuantos
	fila=this.getrow()
	cuantos=this.rowcount()
	choose case this.getitemstring(fila,"condicion")
		case " and "
			if fila=cuantos then this.insertrow(0)
		case " or "
			if fila=cuantos then this.insertrow(0)
		case " "
			if fila<cuantos then 
				long i
				for i=fila +1 to cuantos
					this.deleterow(fila +1)
				next
			end if
	end choose
end if
end event

type rb_si from radiobutton within w_busca_fact_cartera
integer x = 59
integer y = 304
integer width = 503
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Soporte Saldo Incial"
end type

event clicked;if dw_busca.dataobject<>'dw_xa_buscar_si_cartera' then
	dw_busca.dataobject='dw_xa_buscar_si_cartera'
	dw_busca.insertrow(0)
	dw_busca.setitem(1,1,"car_cobro_cab.nro_soporte=")
	dw_encuentra.dataobject="dw_busca_si_cartera"
	dw_encuentra.settransobject(sqlca)
end if
dw_busca.setcolumn(2)
end event

type rb_rd from radiobutton within w_busca_fact_cartera
integer x = 59
integer y = 228
integer width = 379
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Radicación Gci"
end type

event clicked;if dw_busca.dataobject<>'dw_xa_buscar_radica_cartera' then
	dw_busca.dataobject='dw_xa_buscar_radica_cartera'
	dw_busca.insertrow(0)
	dw_busca.setitem(1,1,"ripsradica.num_radicacion=")
	dw_encuentra.dataobject="dw_busca_radica"
	dw_encuentra.settransobject(sqlca)
end if
dw_busca.setcolumn(2)
end event

type rb_feve from radiobutton within w_busca_fact_cartera
integer x = 59
integer y = 76
integer width = 485
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factura Evento Gci"
boolean checked = true
end type

event clicked;if dw_busca.dataobject<>'dw_xa_buscar_fact_cartera' then
	dw_busca.dataobject="dw_xa_buscar_fact_cartera"
	dw_busca.insertrow(0)
	dw_busca.setitem(1,1,"factcab.nfact = ")
	dw_busca.setitem(1,3," and ")
	dw_busca.insertrow(0)
	dw_busca.setitem(2,1,"factcab.Tipo Like")
	dw_busca.setitem(2,2,"F")
	dw_encuentra.dataobject="dw_busca_factura"
	dw_encuentra.settransobject(sqlca)
end if
dw_busca.setcolumn(2)
end event

type pb_cancel from picturebutton within w_busca_fact_cartera
integer x = 1819
integer y = 1596
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_busca_fact_cartera
integer x = 1669
integer y = 1596
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_encuentra.getrow()<1 then return
long donde
if rb_feve.checked then 
	donde=i_st.dw_histo.find('num_radicacion='+string(dw_encuentra.getitemnumber( dw_encuentra.getrow(),'nradica')),1,i_st.dw_histo.rowcount())
end if
if rb_rd.checked or rb_fcap.checked then 
	donde=i_st.dw_histo.find('num_radicacion='+string(dw_encuentra.getitemnumber( dw_encuentra.getrow(),'num_radicacion'))+'and  num_cobro='+string(dw_encuentra.getitemnumber( dw_encuentra.getrow(),'num_cobro')),1,i_st.dw_histo.rowcount())
end if
if rb_si.checked then 
	donde=i_st.dw_histo.find('nro_soporte="'+dw_encuentra.getitemstring( dw_encuentra.getrow(),'nro_soporte')+'" and  num_cobro='+string(dw_encuentra.getitemnumber( dw_encuentra.getrow(),'num_cobro')),1,i_st.dw_histo.rowcount())
end if
if donde>0 then
	if i_st.dw_histo.event rowfocuschanging(i_st.dw_histo.getrow(),donde)=1 then return
	i_st.dw_histo.scrolltorow(donde)
end if
close(parent)

end event

type gb_1 from groupbox within w_busca_fact_cartera
integer x = 37
integer y = 16
integer width = 622
integer height = 392
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar:"
end type

