$PBExportHeader$w_busca_fact.srw
forward
global type w_busca_fact from window
end type
type pb_json from picturebutton within w_busca_fact
end type
type pb_4 from picturebutton within w_busca_fact
end type
type st_2 from statictext within w_busca_fact
end type
type cbx_cita from checkbox within w_busca_fact
end type
type rb_rc from radiobutton within w_busca_fact
end type
type rb_fc from radiobutton within w_busca_fact
end type
type pb_3 from picturebutton within w_busca_fact
end type
type pb_2 from picturebutton within w_busca_fact
end type
type pb_1 from picturebutton within w_busca_fact
end type
type pb_busca from picturebutton within w_busca_fact
end type
type st_1 from statictext within w_busca_fact
end type
type dw_encuentra from datawindow within w_busca_fact
end type
type dw_busca from datawindow within w_busca_fact
end type
type gb_1 from groupbox within w_busca_fact
end type
end forward

global type w_busca_fact from window
integer x = 402
integer y = 400
integer width = 4283
integer height = 1872
boolean titlebar = true
string title = "Busqueda de facturas o Recibos para Reimprimir"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Question!"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
pb_json pb_json
pb_4 pb_4
st_2 st_2
cbx_cita cbx_cita
rb_rc rb_rc
rb_fc rb_fc
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
pb_busca pb_busca
st_1 st_1
dw_encuentra dw_encuentra
dw_busca dw_busca
gb_1 gb_1
end type
global w_busca_fact w_busca_fact

type variables
string orden,anterior,i_decual
m_ppal im_main 
uo_report i_rep
end variables

on w_busca_fact.create
this.pb_json=create pb_json
this.pb_4=create pb_4
this.st_2=create st_2
this.cbx_cita=create cbx_cita
this.rb_rc=create rb_rc
this.rb_fc=create rb_fc
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.pb_busca=create pb_busca
this.st_1=create st_1
this.dw_encuentra=create dw_encuentra
this.dw_busca=create dw_busca
this.gb_1=create gb_1
this.Control[]={this.pb_json,&
this.pb_4,&
this.st_2,&
this.cbx_cita,&
this.rb_rc,&
this.rb_fc,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.pb_busca,&
this.st_1,&
this.dw_encuentra,&
this.dw_busca,&
this.gb_1}
end on

on w_busca_fact.destroy
destroy(this.pb_json)
destroy(this.pb_4)
destroy(this.st_2)
destroy(this.cbx_cita)
destroy(this.rb_rc)
destroy(this.rb_fc)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.pb_busca)
destroy(this.st_1)
destroy(this.dw_encuentra)
destroy(this.dw_busca)
destroy(this.gb_1)
end on

event open;i_decual=message.stringparm
dw_busca.dataobject=''
i_rep=create uo_report

choose case i_decual
	case 'factu'
		rb_fc.triggerevent(clicked!)
	case 'reci'
		rb_rc.triggerevent(clicked!)
		rb_rc.checked=true
end choose

end event

event close;w_principal.m_principal.m_3.m_3_10.m_3_10_4.m_3_10_4_1.enabled=false
w_principal.m_principal.m_3.m_3_10.m_3_10_4.m_3_10_4_2.enabled=false
end event

event resize;//st_1.x=(newwidth - st_1.width)/2
//dw_encuentra.width=newwidth - 35
//dw_encuentra.height = newheight - 750
//pb_4.x=(newwidth - pb_4.width*3)/2
//pb_4.y=newheight - 130
//pb_1.x=pb_4.x+pb_1.width
//pb_1.y=pb_4.y
//pb_3.x=pb_1.x+pb_3.width
//pb_3.y=pb_4.y
end event

type pb_json from picturebutton within w_busca_fact
integer x = 1865
integer y = 1608
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "json.gif"
string disabledname = "d_json.gif"
alignment htextalign = left!
string powertiptext = "Emite estructura Json"
end type

event clicked;nvo_fevrips luo_rips
double ldb_nfac
string ls_clu,ls_tip

ldb_nfac=dw_encuentra.getitemnumber(dw_encuentra.getrow(),'nfact')
ls_clu=dw_encuentra.getitemstring(dw_encuentra.getrow(),'clugar')
ls_tip=dw_encuentra.getitemstring(dw_encuentra.getrow(),'tipo')
luo_rips=create nvo_fevrips
luo_rips.emite_json_evento(ldb_nfac,ls_clu,ls_tip,'f','FV','D:\json'+'.json')
destroy 	luo_rips
end event

type pb_4 from picturebutton within w_busca_fact
integer x = 2030
integer y = 1608
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir"
end type

event clicked;long fila
string ls_elec1
any par[4]

fila=dw_encuentra.getrow()
if fila< 1 then return

SELECT cadena into :ls_elec1
FROM parametros_gen
WHERE (((codigo_para)=66));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 66')
	return
end if

i_rep.v_preliminar=true
i_rep.dialogo=false
i_rep.cambiar_prop=false
i_rep.tipo_rep='documento!'
if rb_fc.checked then
	if dw_encuentra.getitemstring(fila,"tipo")='C' then 
		i_rep.nombre_rep='Reimpresión Consecutivo'
		i_rep.cod_rep='FC'
	else
		i_rep.nombre_rep='Reimpresión de Facturas'
		i_rep.cod_rep='FV'
	end If

	if i_rep.inicia()=-1 then return
	par[1]=dw_encuentra.getitemnumber(fila,"nfact")
	par[3]=dw_encuentra.getitemstring(fila,"clugar")
	par[4]=dw_encuentra.getitemstring(fila,"tipo")
	if cbx_cita.checked then
		par[2]='1'
	else
		par[2]='0'
	end if
	if i_rep.cod_rep='FV' and ls_elec1<>'0' then
		i_rep.imprimir(par,'','1')
	else
		i_rep.imprimir(par,'','0')
	end if
else
	i_rep.cod_rep='RC'
	i_rep.nombre_rep='Reimpresión de Recibos'
	if i_rep.inicia()=-1 then return
	par[1]=dw_encuentra.getitemnumber(fila,"nrcaj")
	par[2]=dw_encuentra.getitemstring(fila,"clugar")
	if cbx_cita.checked then
		par[3]='1'
	else
		par[3]='0'
	end if
	i_rep.imprimir(par,'','0')
end if
close(parent)
end event

type st_2 from statictext within w_busca_fact
integer x = 3694
integer y = 1588
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_cita from checkbox within w_busca_fact
integer x = 78
integer y = 352
integer width = 370
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir cita"
boolean checked = true
end type

type rb_rc from radiobutton within w_busca_fact
integer x = 69
integer y = 268
integer width = 512
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factura de Recaudo"
end type

event clicked;if dw_busca.dataobject<>'dw_xa_buscar_reccaj' then 
	dw_busca.dataobject="dw_xa_buscar_reccaj"
	dw_busca.insertrow(0)
	dw_busca.setitem(1,1,"tesorecajcab.nrcaj = ")
	choose case i_decual
		case 'factu'
			if isvalid(w_factura) then dw_busca.setitem(1,2,string(w_factura.ist_nrecibo.ndoc))
		case 'reci'
			if isvalid(w_rec_caja) then dw_busca.setitem(1,2,string(w_rec_caja.ist_nrecibo.ndoc))
	end choose
	dw_encuentra.dataobject="dw_busca_recibo"
	dw_encuentra.settransobject(sqlca)
end if
dw_busca.setcolumn(2)
//cbx_cita.enabled=false
end event

type rb_fc from radiobutton within w_busca_fact
integer x = 73
integer y = 196
integer width = 699
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factura Electronica de Venta"
boolean checked = true
end type

event clicked;if dw_busca.dataobject<>'dw_xa_buscar_fact' then
	dw_busca.dataobject="dw_xa_buscar_fact"
	dw_busca.insertrow(0)
	dw_busca.setitem(1,1,"factcab.nfact = ")
	dw_busca.setitem(1,3," and ")
	dw_busca.insertrow(0)
	dw_busca.setitem(2,1,"factcab.Tipo Like")
		dw_busca.setitem(2,2,"%")
	if isvalid(w_factura) then dw_busca.setitem(1,2,string(w_factura.ist_nfactura.ndoc))
	dw_encuentra.dataobject="dw_busca_factura"
	dw_encuentra.settransobject(sqlca)
end if
dw_busca.setcolumn(2)

//cbx_cita.enabled=true
end event

type pb_3 from picturebutton within w_busca_fact
event mousemove pbm_mousemove
integer x = 2331
integer y = 1608
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &y"
boolean originalsize = true
string picturename = "ayuda.gif"
string disabledname = "d_ayuda.gif"
alignment htextalign = left!
string powertiptext = "Ayuda sobre busqueda de Facturas [Alt+Y]"
end type

event clicked;showhelp(dir_insta+"gciltda.hlp",keyword!,"Buscar pacientes")
end event

type pb_2 from picturebutton within w_busca_fact
event mousemove pbm_mousemove
integer x = 2875
integer y = 280
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
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Fila de Búsqueda"
end type

event clicked;if dw_busca.rowcount()= 1 then return
dw_busca.deleterow(0)
end event

type pb_1 from picturebutton within w_busca_fact
event mousemove pbm_mousemove
integer x = 2181
integer y = 1608
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_busca from picturebutton within w_busca_fact
event mousemove pbm_mousemove
integer x = 2875
integer y = 148
integer width = 146
integer height = 128
integer taborder = 20
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
if rb_fc.checked then 
	Sql_text="SELECT DISTINCT factcab.nfact, factcab.clugar, factcab.tipo,factcab.fecha,factcpo.tipodoc,factcpo.documento,pacientes.nombre1,pacientes.nombre2,pacientes.apellido1,pacientes.apellido2,factcab.vtproced,factcab.vtemp,factcab.vtcancelo,factcab.estado,factcab.codtingre,factcpo.nrcaj,factcpo.clugar_rec,factcab.nradica,empresa.desemp,case when factcpo.NFACT_REF is null then 'No' else 'Si' end as refa,factcab.estado_dian, factcab.file_name_fact, factcab.file_name_fact_anul,factcab.file_name_zip,factcab.file_name_zip_anul 	FROM ((factcab INNER JOIN factcpo ON (factcab.nfact = factcpo.nfact) AND (factcab.clugar = factcpo.clugar) AND (factcab.tipo = factcpo.tipo)) INNER JOIN pacientes ON (factcpo.tipodoc = pacientes.tipodoc) AND (factcpo.documento = pacientes.documento)) INNER JOIN empresa ON factcab.cemp = empresa.codemp	WHERE factcab.clugar='"+clugar+ "' and "
else
	Sql_text="SELECT tesorecajcab.nrcaj, tesorecajcab.CLugar, tesorecajcab.Fecha, tesorecajcab.TipoDoc, tesorecajcab.Documento, pacientes.Nombre1, pacientes.Nombre2, pacientes.Apellido1, pacientes.Apellido2, tesorecajcab.Npagare, tesorecajcab.clugar_pag, tesorecajcab.Trecibo, tesorecajcpo.nfact, tesorecajcpo.clugar_fac, tesorecajcab.Estado FROM (pacientes INNER JOIN tesorecajcab ON (pacientes.Documento = tesorecajcab.Documento) AND (pacientes.TipoDoc = tesorecajcab.TipoDoc)) LEFT outer JOIN tesorecajcpo ON (tesorecajcab.CLugar = tesorecajcpo.clugar) AND (tesorecajcab.nrcaj = tesorecajcpo.nrcaj) where tesorecajcab.CLugar='"+clugar+"' and "
end if	
for i=1 to cuantas
	if trim(dw_busca.getitemstring(i,"nom_campo"))="" or trim(dw_busca.getitemstring(i,"valor"))="" then 
		messagebox("Atención","Complete las condiciones de búsqueda")
		return
	end if
	if rb_fc.checked then
		if dw_busca.getitemstring(i,"nom_campo")<>'factcab.nfact = ' then
			comilla="'"
		else
			if not isnumber(dw_busca.getitemstring(i,"valor")) then
				messagebox("Error","La condición de búsqueda por ser numérica no admite comodines o caracteres diferentes a números")
				return
			end if
			comilla=""
		end if
	else
		if dw_busca.getitemstring(i,"nom_campo")<>'nfact = ' and dw_busca.getitemstring(i,"nom_campo")<>'tesorecajcab.nrcaj = 'then
			comilla="'"
		else
			if not isnumber(dw_busca.getitemstring(i,"valor")) then
				messagebox("Error","La condición de búsqueda por ser numérica no admite comodines o caracteres diferentes a números")
				return
			end if
			comilla=""
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
	pb_4.setfocus()
end if
end event

type st_1 from statictext within w_busca_fact
integer x = 37
integer y = 12
integer width = 4174
integer height = 76
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 134217752
string text = "Agregue campo y condición de búsqueda (caracter % es comodín, pero no se puede utilizar en los campos Número de Factura o de Recibo de Caja)"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_encuentra from datawindow within w_busca_fact
event mousemove pbm_mousemove
integer x = 18
integer y = 576
integer width = 4160
integer height = 992
integer taborder = 50
string dragicon = "none!"
string dataobject = "dw_busca_factura"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if dwo.type="text" then return
pb_4.triggerevent(clicked!)
end event

event clicked;if dwo.type = "text" then 
	string cual,ojo,ss
	cual=dwo.name
	cual=mid(cual,1,len(cual) - 2)
	if anterior=cual then
		if orden="A" then
			orden="D"
		else
			orden="A"
		end if
	else
		orden="A"
	end if
	dw_encuentra.setsort(cual+" "+orden)
	dw_encuentra.sort()
	anterior=cual
end if
end event

event rowfocuschanged;st_2.text="Reg. "+string(this.getrow())+" de "+string(this.rowcount())
if  rb_fc.checked then
	if  dw_encuentra.getitemstring(dw_encuentra.getrow(),'tipo')='F' and dw_encuentra.getitemstring(dw_encuentra.getrow(),'estado_dian')='1' then
		pb_json.enabled=true
	else
		pb_json.enabled=false
	end if
else
	pb_json.enabled=false
end if
end event

event rbuttondown;if this.rowcount()<1 or this.getrow()<1 then return
this.scrolltorow(this.getrow())
this.triggerevent(rowfocuschanged!)
if not isnull(this.getitemstring(this.getrow(),"estado")) then return
if dw_busca.dataobject="dw_xa_buscar_fact" then
	w_principal.m_principal.m_3.m_3_10.m_3_10_4.m_3_10_4_1.enabled=true
	w_principal.m_principal.m_3.m_3_10.m_3_10_4.m_3_10_4_2.enabled=false
	If w_principal.m_principal <> im_main then w_principal.m_principal.m_3.m_3_10.m_3_10_4.PopMenu (parent.PointerX(), parent.PointerY())
else
	w_principal.m_principal.m_3.m_3_10.m_3_10_4.m_3_10_4_1.enabled=false
	w_principal.m_principal.m_3.m_3_10.m_3_10_4.m_3_10_4_2.enabled=true
	If w_principal.m_principal <> im_main then w_principal.m_principal.m_3.m_3_10.m_3_10_4.PopMenu (parent.PointerX(), parent.PointerY())
end if
end event

type dw_busca from datawindow within w_busca_fact
event mousemove pbm_mousemove
integer x = 837
integer y = 156
integer width = 1993
integer height = 356
integer taborder = 10
string dragicon = "none!"
string title = "Busqueda de pacientes"
string dataobject = "dw_xa_buscar_fact"
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

type gb_1 from groupbox within w_busca_fact
integer x = 46
integer y = 136
integer width = 754
integer height = 348
integer taborder = 20
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

