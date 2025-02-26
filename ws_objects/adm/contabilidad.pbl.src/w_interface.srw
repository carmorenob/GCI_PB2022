$PBExportHeader$w_interface.srw
forward
global type w_interface from window
end type
type pb_3 from picturebutton within w_interface
end type
type pb_2 from picturebutton within w_interface
end type
type st_4 from statictext within w_interface
end type
type dw_1 from datawindow within w_interface
end type
type b_1 from hprogressbar within w_interface
end type
type dw_cierres from datawindow within w_interface
end type
type dw_doc_cab from datawindow within w_interface
end type
type st_3 from statictext within w_interface
end type
type st_2 from statictext within w_interface
end type
type st_1 from statictext within w_interface
end type
type em_fecha2 from editmask within w_interface
end type
type em_fecha1 from editmask within w_interface
end type
type dw_temp from datawindow within w_interface
end type
type pb_guardar from picturebutton within w_interface
end type
type pb_1 from picturebutton within w_interface
end type
type dw_cpo from datawindow within w_interface
end type
type dw_cab from datawindow within w_interface
end type
type dw_docus from datawindow within w_interface
end type
end forward

global type w_interface from window
integer width = 5829
integer height = 2424
boolean titlebar = true
string title = "Comprobantes desde Interfaces"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_asiento.ico"
boolean center = true
pb_3 pb_3
pb_2 pb_2
st_4 st_4
dw_1 dw_1
b_1 b_1
dw_cierres dw_cierres
dw_doc_cab dw_doc_cab
st_3 st_3
st_2 st_2
st_1 st_1
em_fecha2 em_fecha2
em_fecha1 em_fecha1
dw_temp dw_temp
pb_guardar pb_guardar
pb_1 pb_1
dw_cpo dw_cpo
dw_cab dw_cab
dw_docus dw_docus
end type
global w_interface w_interface

type variables
transaction sqlba
datawindowchild dwc_docus
int i_campos
boolean i_reviso

end variables

on w_interface.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_4=create st_4
this.dw_1=create dw_1
this.b_1=create b_1
this.dw_cierres=create dw_cierres
this.dw_doc_cab=create dw_doc_cab
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.em_fecha2=create em_fecha2
this.em_fecha1=create em_fecha1
this.dw_temp=create dw_temp
this.pb_guardar=create pb_guardar
this.pb_1=create pb_1
this.dw_cpo=create dw_cpo
this.dw_cab=create dw_cab
this.dw_docus=create dw_docus
this.Control[]={this.pb_3,&
this.pb_2,&
this.st_4,&
this.dw_1,&
this.b_1,&
this.dw_cierres,&
this.dw_doc_cab,&
this.st_3,&
this.st_2,&
this.st_1,&
this.em_fecha2,&
this.em_fecha1,&
this.dw_temp,&
this.pb_guardar,&
this.pb_1,&
this.dw_cpo,&
this.dw_cab,&
this.dw_docus}
end on

on w_interface.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_4)
destroy(this.dw_1)
destroy(this.b_1)
destroy(this.dw_cierres)
destroy(this.dw_doc_cab)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_fecha2)
destroy(this.em_fecha1)
destroy(this.dw_temp)
destroy(this.pb_guardar)
destroy(this.pb_1)
destroy(this.dw_cpo)
destroy(this.dw_cab)
destroy(this.dw_docus)
end on

event open;sqlba = create transaction
if f_conecta_cpo(sqlba)=-1 then
	close(this)
	return
end if
end event

event close;disconnect using sqlba;


end event

type pb_3 from picturebutton within w_interface
integer x = 1403
integer y = 940
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
string picturename = "export.GIF"
string disabledname = "d_export.GIF"
alignment htextalign = left!
string powertiptext = "Exportar Comprobante"
end type

event clicked;//choose case f_pregunta()
//	case 1
//		if grabar(false)=-1 then return
//	case 2
//	case 3
//		return
//end choose
openwithparm(w_export,dw_cpo)

end event

type pb_2 from picturebutton within w_interface
integer x = 5097
integer y = 80
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ojo.gif"
alignment htextalign = left!
string powertiptext = "Revisar documentos para hallar desbalanceados"
end type

event clicked;if i_reviso then return
long j,k
boolean paso=false
dw_1.reset()
dw_cab.setredraw(false)
f_quitafiltro(dw_cab,string(rgb(255,255,255)))

dw_cpo.setredraw(false)
for j=1 to dw_cab.rowcount()
	dw_cab.setitem(j,'esco','0')
next

for j=1 to dw_cab.rowcount()
	st_4.text='Doc: '+string(j)
	choose case i_campos
		case 2,3
			dw_cpo.setfilter("#2='"+dw_cab.getitemstring(j,2)+"' and #1="+string(dw_cab.getitemnumber(j,1))) 
		case 5
			dw_cpo.setfilter("#1='"+dw_cab.getitemstring(j,1)+"' and #2='"+dw_cab.getitemstring(j,2)+"' and #3="+string(dw_cab.getitemnumber(j,3))+" and #4='"+dw_cab.getitemstring(j,4)+"' and #5="+string(dw_cab.getitemnumber(j,5)))
		case 6
			dw_cpo.setfilter("#1='"+dw_cab.getitemstring(j,1)+"' and #2='"+dw_cab.getitemstring(j,2)+"' and #3="+string(dw_cab.getitemnumber(j,3))+" and #4='"+dw_cab.getitemstring(j,4)+"' and #5="+string(dw_cab.getitemnumber(j,5))+" and #6="+string(dw_cab.getitemnumber(j,6)))
	end choose
	dw_cpo.filter()
	if dw_cpo.rowcount()=0 then
		paso=true
	end if

	for k=1 to dw_cpo.rowcount()
		dw_cpo.setitem(k,'visible','1')
	next
	dw_cpo.setfilter("visible='1'")
	dw_cpo.filter()

	if dw_cpo.getitemnumber(1,'dif_deb')>0 or dw_cpo.getitemnumber(1,'dif_cred')>0  or paso then
		k=dw_1.insertrow(0)
		if i_campos=2 or i_campos=3 then
			dw_1.setitem(k,'ndoc',dw_cab.getitemnumber(j,1))
			dw_1.setitem(k,'clug',dw_cab.getitemstring(j,2))
			if dw_cpo.getitemnumber(1,'dif_deb')>0 then 	dw_1.setitem(k,'valor',dw_cpo.getitemnumber(1,'dif_deb'))
			if dw_cpo.getitemnumber(1,'dif_cred')>0 then 	dw_1.setitem(k,'valor',dw_cpo.getitemnumber(1,'dif_cred'))
		else
			if i_campos=5 then
				dw_1.setitem(k,'ndoc',dw_cab.getitemnumber(j,3))
				dw_1.setitem(k,'clug',dw_cab.getitemstring(j,1))
				dw_1.setitem(k,'cdoc',dw_cab.getitemstring(j,2))
				dw_1.setitem(k,'ctipo',dw_cab.getitemstring(j,4))
				dw_1.setitem(k,'item',dw_cab.getitemnumber(j,5))
			else
				dw_1.setitem(k,'ndoc',dw_cab.getitemnumber(j,3))
				dw_1.setitem(k,'clug',dw_cab.getitemstring(j,1))
				dw_1.setitem(k,'cdoc',dw_cab.getitemstring(j,2))
				dw_1.setitem(k,'ctipo',dw_cab.getitemstring(j,4))
				dw_1.setitem(k,'mes',dw_cab.getitemnumber(j,5))
				dw_1.setitem(k,'item',dw_cab.getitemnumber(j,6))
			end if
			if dw_cpo.getitemnumber(1,'dif_deb')>0 then 	dw_1.setitem(k,'valor',dw_cpo.getitemnumber(1,'dif_deb'))
			if dw_cpo.getitemnumber(1,'dif_cred')>0 then 	dw_1.setitem(k,'valor',dw_cpo.getitemnumber(1,'dif_cred'))
		end if
		paso=false
	end if
	for k=1 to dw_cpo.rowcount()
		dw_cpo.setitem(k,'visible','0')
	next
next
dw_cpo.setfilter("visible='1'")
dw_cpo.filter()
st_4.text='Documentos desbalanceados:'
dw_cab.setredraw(true)
dw_cpo.setredraw(true)
i_reviso=true
end event

type st_4 from statictext within w_interface
integer x = 3351
integer y = 172
integer width = 795
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documentos desbalanceados:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_interface
integer x = 3342
integer y = 240
integer width = 2043
integer height = 680
integer taborder = 60
string title = "none"
string dataobject = "dw_docs_desbalan"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;if row<1 then return
long donde
if i_campos=2 or i_campos=3 then
	donde=dw_cab.find("#2='"+getitemstring(getrow(),2)+"' and #1="+string(getitemnumber(getrow(),1)),1,dw_cab.rowcount())
else
	if i_campos=5 then 
		donde=dw_cab.find("#1='"+getitemstring(getrow(),2)+	"' and #2='"+getitemstring(getrow(),3)+	"' and #3="+string(getitemnumber(getrow(),1))+	" and #4='"+getitemstring(getrow(),6)+	"' and #5="+string(getitemnumber(getrow(),5)),1,dw_cab.rowcount())
	else
		donde=dw_cab.find("#1='"+getitemstring(getrow(),2)+	"' and #2='"+getitemstring(getrow(),3)+	"' and #3="+string(getitemnumber(getrow(),1))+	" and #4='"+getitemstring(getrow(),6)+	"' and #5="+string(getitemnumber(getrow(),4))+	" and #6="+string(getitemnumber(getrow(),5)),1,dw_cab.rowcount())
	end if
end if
if donde>0 then dw_cab.scrolltorow(donde)
end event

type b_1 from hprogressbar within w_interface
integer x = 1563
integer y = 980
integer width = 974
integer height = 52
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_cierres from datawindow within w_interface
boolean visible = false
integer x = 3081
integer y = 984
integer width = 398
integer height = 92
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cierres"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve(w_comp_cont.i_codemp)
end event

type dw_doc_cab from datawindow within w_interface
integer x = 32
integer y = 924
integer width = 1129
integer height = 168
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_doc_cab"
boolean border = false
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
this.setitem(1,"cod_empresa",w_comp_cont.i_codemp)
this.setitem(1,"ano",year(today()))
this.setitem(1,"mes",month(today()))
this.setitem(1,"fecha",datetime(today()))
setitem(1,"fechageneracion",datetime(today()))
end event

event itemchanged;this.accepttext()
long j
if this.getcolumnname()="ano" or this.getcolumnname()="mes" then
	for j=1 to dw_cpo.rowcount()
		dw_cpo.setitem(j,this.getcolumnname(),this.getitemnumber(1,this.getcolumnname()))
	next
end if
end event

type st_3 from statictext within w_interface
integer x = 32
integer y = 176
integer width = 718
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros a Escoger:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_interface
integer x = 2976
integer y = 4
integer width = 315
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Final:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_interface
integer x = 2578
integer y = 4
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicial:"
boolean focusrectangle = false
end type

type em_fecha2 from editmask within w_interface
integer x = 2985
integer y = 56
integer width = 361
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;if isdate("31/"+string(today(),"mm/yyyy")) then
	this.text="31/"+string(today(),"mm/yyyy")
else
	if isdate("30/"+string(today(),"mm/yyyy")) then
		this.text="30/"+string(today(),"mm/yyyy")
	else
		if isdate("29/"+string(today(),"mm/yyyy")) then
			this.text="29/"+string(today(),"mm/yyyy")
		else
			this.text="28/"+string(today(),"mm/yyyy")
		end if
	end if
end if

end event

type em_fecha1 from editmask within w_interface
integer x = 2583
integer y = 56
integer width = 361
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;this.text="01/"+string(today(),"mm/yyyy")
end event

type dw_temp from datawindow within w_interface
boolean visible = false
integer x = 1362
integer width = 197
integer height = 40
boolean enabled = false
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_guardar from picturebutton within w_interface
integer x = 1234
integer y = 940
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Documento"
end type

event clicked;int ano_contable,mes_contable
ano_contable=dw_doc_cab.getitemnumber(1,"ano")
mes_contable=dw_doc_cab.getitemnumber(1,"mes")
long j,fila_mes,ciclo_mes
dec valor
if dw_cpo.accepttext()=-1 then return -1
if dw_cpo.rowcount()=0 then return -1
f_quitafiltro(DW_CAB,string(rgb(255,255,255)))
dw_doc_cab.accepttext()
dw_cpo.SETREDRAW(false)

if dw_doc_cab.getitemnumber(1,"ano") <> year(date(dw_doc_cab.getitemdatetime(1,"fecha"))) then
	messagebox("Atención","El año no corresponde a la fecha del documento")
	dw_doc_cab.setcolumn("ano")
	dw_doc_cab.setfocus()
	return -1
end if
if dw_doc_cab.getitemnumber(1,"mes") <> month(date(dw_doc_cab.getitemdatetime(1,"fecha"))) then
	messagebox("Atención","El mes no corresponde a la fecha del documento")
	dw_doc_cab.setcolumn("mes")
	dw_doc_cab.setfocus()
	return -1
end if
fila_mes=dw_cierres.find("ano="+string(ano_contable)+" and mes="+string(mes_contable),1,dw_cierres.rowcount())
if fila_mes=0 then
	messagebox("Atención","Este mes contable no ha sido creado, debe crearlo primero para poder continuar")
	return -1
elseif dw_cierres.getitemstring(fila_mes,"estado")='1' then
	messagebox("Atención","Este mes contable se encuentra cerrado, no puede actualizarle saldos")
	return -1
end if
w_comp_cont.dw_doc.setitem(1,1,dw_docus.getitemstring(1,1))
w_comp_cont.dw_doc.triggerevent(itemchanged!)
if w_comp_cont.f_new_docu(false)=-1 then return -1//pb_new.triggerevent(clicked!)
w_comp_cont.dw_doc_cab.deleterow(1)
long ojo,nnulo
string snulo,ojo2
setnull(nnulo)
setnull(snulo)
dw_cpo.setfilter("movimiento='0' and (round(valordeb,2)<>0 or round(valorcred,2)<>0)")
dw_cpo.filter()
if dw_cpo.rowcount()>0 then
	messagebox("Atención","Hay cuentas Mayores con Valores verifique parametrización")
	dw_cpo.setfilter("")
	dw_cpo.filter()
	return -1
end if

dw_cpo.setfilter("visible='1' and (round(valordeb,2)<>0 or round(valorcred,2)<>0)")
dw_cpo.filter()
w_comp_cont.dw_detalle.SETREDRAW(false)
for j=1 to dw_cpo.rowcount()
	dw_cpo.setitem(j,'cp_sec',j)
	B_1.POSITION=j*80/dw_cpo.rowcount()
	if dw_cpo.getitemstring(j,'cdocext')='' then dw_cpo.setitem(j,'cdocext',snulo)
	if dw_cpo.getitemstring(j,'presopext')='' then dw_cpo.setitem(j,'presopext',snulo)
	if dw_cpo.getitemnumber(j,'nsopext')=0 then dw_cpo.setitem(j,'nsopext',nnulo)//nsopext
	w_comp_cont.dw_detalle.insertrow(0)
	w_comp_cont.dw_detalle.setitem(j,'cp_cod_empresa',w_comp_cont.i_codemp)//emp
	w_comp_cont.dw_detalle.setitem(j,'cp_ano',dw_doc_cab.getitemnumber(1,'ano'))//ano
	w_comp_cont.dw_detalle.setitem(j,'cp_mes',dw_doc_cab.getitemnumber(1,'mes'))//mes
	w_comp_cont.dw_detalle.setitem(j,'cp_cdoc',dw_cpo.getitemstring(j,'cdoc'))//cdoc
	w_comp_cont.dw_detalle.setitem(j,'cp_ndoc',dw_cpo.getitemnumber(j,'ndoc'))//ndoc
	if i_campos=6 then
		w_comp_cont.dw_detalle.setitem(j,'llave4',dw_cpo.getitemstring(j,'cartipo'))
		w_comp_cont.dw_detalle.setitem(j,'llave5',dw_cpo.getitemnumber(j,'anyo'))
		w_comp_cont.dw_detalle.setitem(j,'llave6',dw_cpo.getitemnumber(j,'item'))
	end if
	
	if i_campos=5 then
		//w_comp_cont.dw_detalle.setitem(j,'llave4',string(dw_cpo.getitemnumber(j,'factcpo_nfact')))
		w_comp_cont.dw_detalle.setitem(j,'llave4',string(dw_cpo.getitemstring(j,'cartipo')))
		w_comp_cont.dw_detalle.setitem(j,'llave5',dw_cpo.getitemnumber(j,'item'))
	end if
	w_comp_cont.dw_detalle.setitem(j,'cp_secuencia',dw_cpo.getitemnumber(j,'cp_sec'))//secuen
	w_comp_cont.dw_detalle.setitem(j,'cp_cuenta',dw_cpo.getitemstring(j,'contratos_codtotal_pxc'))
	w_comp_cont.dw_detalle.setitem(j,'descrip',dw_cpo.getitemstring(j,'cont_plan_descrip'))
	w_comp_cont.dw_detalle.setitem(j,'cp_detalle',dw_cpo.getitemstring(j,'cp_detalle'))
	IF dw_cpo.getitemstring(j,'tipdoc')='' then
		w_comp_cont.dw_detalle.setitem(j,'tipodoc',snulo)
	else
		w_comp_cont.dw_detalle.setitem(j,'tipodoc',dw_cpo.getitemstring(j,'tipdoc'))
	end if
	if dw_cpo.getitemstring(j,'empresa_nit')='' then
		w_comp_cont.dw_detalle.setitem(j,'documento',snulo)
	else
		w_comp_cont.dw_detalle.setitem(j,'documento',dw_cpo.getitemstring(j,'empresa_nit'))
	end if
	w_comp_cont.dw_detalle.setitem(j,'terceros_persona',dw_cpo.getitemstring(j,'persona'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_nombre1',dw_cpo.getitemstring(j,'nom1'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_nombre2',dw_cpo.getitemstring(j,'nom2'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_apellido1',dw_cpo.getitemstring(j,'ape1'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_apellido2',dw_cpo.getitemstring(j,'ape2'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_razon_social',dw_cpo.getitemstring(j,'empresa_desemp'))
	w_comp_cont.dw_detalle.setitem(j,'cp_dverificacion',dw_cpo.getitemstring(j,'dverif'))
	valor=round(dw_cpo.getitemdecimal(j,'valordeb'),w_comp_cont.i_dec_gral)
	w_comp_cont.dw_detalle.setitem(j,'cp_valordeb',valor)//valores
	valor=round(dw_cpo.getitemdecimal(j,'valorcred'),w_comp_cont.i_dec_gral)//valorcred
	w_comp_cont.dw_detalle.setitem(j,'cp_valorcred',valor)//valores
	w_comp_cont.dw_detalle.setitem(j,'cp_clugar_doc',dw_cpo.getitemstring(j,'factcpo_clugar'))
	w_comp_cont.dw_detalle.setitem(j,'cp_cdocr',dw_cpo.getitemstring(j,'cdocref'))
	w_comp_cont.dw_detalle.setitem(j,'documentos_desdoc',dw_cpo.getitemstring(j,'desdoc'))
	if i_campos=5 or  i_campos=6 then	
		w_comp_cont.dw_detalle.setitem(j,'cp_ndocr',dw_cpo.getitemnumber(j,'factcpo_nfact1'))//nfact
	end if
	if i_campos=3 then
		w_comp_cont.dw_detalle.setitem(j,'cp_ndocr',dw_cpo.getitemnumber(j,'factcpo_nfact'))//nfact
	end if
	w_comp_cont.dw_detalle.setitem(j,'fecha_doc_int',dw_cpo.getitemdatetime(j,'fecha_docref'))
	w_comp_cont.dw_detalle.setitem(j,'ccosto',dw_cpo.getitemstring(j,'cont_plan_ccosto'))
	w_comp_cont.dw_detalle.setitem(j,'tercero',dw_cpo.getitemstring(j,'cont_plan_tercero'))
	w_comp_cont.dw_detalle.setitem(j,'naturaleza',dw_cpo.getitemstring(j,'cont_plan_naturaleza'))
	w_comp_cont.dw_detalle.setitem(j,'rfuente',dw_cpo.getitemstring(j,'cont_plan_rfuente'))
	if dw_cpo.getitemstring(j,'factcpo_cufuncional')='' then
		w_comp_cont.dw_detalle.setitem(j,'cp_cufuncional',snulo)
	else
		w_comp_cont.dw_detalle.setitem(j,'cp_cufuncional',dw_cpo.getitemstring(j,'factcpo_cufuncional'))
	end if
	if dw_cpo.getitemstring(j,'factcpo_cccosto')='' then
		w_comp_cont.dw_detalle.setitem(j,'cp_ccosto',snulo)
	else
		w_comp_cont.dw_detalle.setitem(j,'cp_ccosto',dw_cpo.getitemstring(j,'factcpo_cccosto'))
	end if
	w_comp_cont.dw_detalle.setitem(j,'descripcion',dw_cpo.getitemstring(j,'centrocostos_descripcion'))
	w_comp_cont.dw_detalle.setitem(j,'estado',dw_cpo.getitemstring(j,'estado'))
	w_comp_cont.dw_detalle.setitem(j,'base',dw_cpo.getitemdecimal(j,'bas'))//base
	w_comp_cont.dw_detalle.setitem(j,'base_desde',dw_cpo.getitemdecimal(j,'cont_rte_fte_base_desde'))//basedeste
	w_comp_cont.dw_detalle.setitem(j,'porcentaje',dw_cpo.getitemdecimal(j,'cont_rte_fte_porcentaje'))//porcentaje
	w_comp_cont.dw_detalle.setitem(j,'inicia',dw_cpo.getitemdatetime(j,'cont_rte_fte_inicia'))
	w_comp_cont.dw_detalle.setitem(j,'termina',dw_cpo.getitemdatetime(j,'cont_rte_fte_termina'))
	w_comp_cont.dw_detalle.setitem(j,'concep_ant',dw_cpo.getitemstring(j,'cont_rte_fte_concep_ant'))
	w_comp_cont.dw_detalle.setitem(j,'coddocext',dw_cpo.getitemstring(j,'cdocext'))
	w_comp_cont.dw_detalle.setitem(j,'pre_sopo_externo',dw_cpo.getitemstring(j,'presopext'))
	w_comp_cont.dw_detalle.setitem(j,'nsopo_externo',dw_cpo.getitemnumber(j,'nsopext'))//nsopext
	w_comp_cont.dw_detalle.setitem(j,'visibl',dw_cpo.getitemstring(j,'visible'))
	w_comp_cont.dw_detalle.setitem(j,'t_corriente',dw_cpo.getitemstring(j,'corriente'))
	w_comp_cont.dw_detalle.setitem(j,'corriente',dw_cpo.getitemstring(j,'corriente'))
	w_comp_cont.dw_detalle.setitem(j,'desde_inter','1')
	if not isnull(dw_cpo.getitemstring(j,'cdocext')) then w_comp_cont.dw_detalle.setitem(j,'cod_empre_doc_ext',w_comp_cont.i_codemp)
	w_comp_cont.dw_detalle.setitem(j,'t_estado',dw_cpo.getitemstring(j,'t_estado'))
	w_comp_cont.dw_detalle.setitem(j,'t_pyg',dw_cpo.getitemstring(j,'t_pyg'))
	if isnull(dw_cpo.getitemstring(j,'t_pyg')) or dw_cpo.getitemstring(j,'t_pyg')='I' then
		w_comp_cont.dw_detalle.setitem(j,'deduc_renta',snulo)
	else
		w_comp_cont.dw_detalle.setitem(j,'deduc_renta','1')
	end if
	w_comp_cont.dw_detalle.setitem(j,'lugar',dw_cpo.getitemstring(j,'lugar'))
	if dw_cpo.getitemstring(j,'clug')='' then
		w_comp_cont.dw_detalle.setitem(j,'clugar',snulo)
	else
		w_comp_cont.dw_detalle.setitem(j,'clugar',dw_cpo.getitemstring(j,'clug'))
	end if

next

ojo=dw_doc_cab.rowscopy(1,1,primary!,w_comp_cont.dw_doc_cab,1,primary!)
w_comp_cont.cambio=true
for j=1 to dw_cab.rowcount()
	if dw_cab.getitemstring(j,'esco')='1' then 
		choose case i_campos
			case 2
				dw_cpo.setfilter("#2='"+dw_cab.getitemstring(j,2)+"' and #1="+string(dw_cab.getitemnumber(j,1))) 
			case 3
				dw_cpo.setfilter("#23='"+dw_cab.getitemstring(j,2)+"' and #26="+string(dw_cab.getitemnumber(j,1))+" and #24='"+dw_cab.getitemstring(j,3)+"'") 
			case 5
				dw_cpo.setfilter("#1='"+dw_cab.getitemstring(j,1)+"' and #2='"+dw_cab.getitemstring(j,2)+"' and #3="+string(dw_cab.getitemnumber(j,3))+" and #4='"+dw_cab.getitemstring(j,4)+"' and #5="+string(dw_cab.getitemnumber(j,5)))
			case 6
				dw_cpo.setfilter("#1='"+dw_cab.getitemstring(j,1)+"' and #2='"+dw_cab.getitemstring(j,2)+"' and #3="+string(dw_cab.getitemnumber(j,3))+" and #4='"+dw_cab.getitemstring(j,4)+"' and #5="+string(dw_cab.getitemnumber(j,5))+" and #6="+string(dw_cab.getitemnumber(j,6)))
		end choose
		dw_cpo.filter()
		if dw_cpo.rowcount()>0 then
			dw_cab.setitem(j,'contabil','C')
		end if
	end if
next
w_comp_cont.dw_detalle.SETREDRAW(true)
dw_cpo.SETREDRAW(true)
b_1.position=90
if w_comp_cont.grabar(false)=-1 then
	w_comp_cont.cambio=false
	w_comp_cont.dw_detalle.reset()
	rollback using sqlba;
	rollback using sqlca;
	b_1.position=0
	return -1
end if
if dw_cab.update()=-1 then
	rollback using sqlba;
	rollback using sqlca;
	b_1.position=0
	return -1
end if
commit using sqlca;
commit using sqlba;
b_1.position=100
w_comp_cont.pb_new_otro.enabled=true
close(parent)

end event

type pb_1 from picturebutton within w_interface
integer x = 3369
integer y = 32
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Traer Registros"
end type

event clicked;if isnull(dw_docus.getitemstring(1,1)) then return
sqlca.autocommit=true
dw_cab.retrieve(datetime(date(em_fecha1.text),time('00:00')),datetime(date(em_fecha2.text),time('23:59:59')))
dw_cpo.retrieve(datetime(date(em_fecha1.text),time('00:00')),datetime(date(em_fecha2.text),time('23:59:59')),w_comp_cont.i_codemp,dw_doc_cab.getitemnumber(1,'ano'),dw_doc_cab.getitemnumber(1,'mes'),dw_docus.getitemstring(1,1))
sqlba.autocommit=false
dw_1.reset()
i_reviso=false

end event

type dw_cpo from datawindow within w_interface
integer x = 23
integer y = 1100
integer width = 5705
integer height = 1168
integer taborder = 70
string title = "none"
string dataobject = "dw_cpo_interfaz"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieverow;if b_1.position=100 then b_1.position=0
b_1.position +=25
end event

event retrieveend;b_1.position=0
end event

event dberror;string erro
erro=sqlca.sqlerrtext
rollback;
st_error i_st
i_st.ds_nombre=classname()
if sqlerrtext='' or trim(lower(sqlerrtext))='select error:' then
	i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+erro
else
	i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
end if
openwithparm(w_error_ds,i_st)
return 1
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type dw_cab from datawindow within w_interface
integer x = 27
integer y = 240
integer width = 3150
integer height = 680
integer taborder = 50
string title = "none"
string dataobject = "dw_cab_interfaz"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

event itemchanged;accepttext()
dw_cpo.setredraw(false)
choose case i_campos
	case 2,3
		dw_cpo.setfilter("#2='"+getitemstring(getrow(),2)+"' and #1="+string(getitemnumber(getrow(),1))) 
	case 5
		dw_cpo.setfilter("#1='"+getitemstring(getrow(),1)+"' and #2='"+getitemstring(getrow(),2)+"' and #3="+string(getitemnumber(getrow(),3))+" and #4='"+getitemstring(getrow(),4)+"' and #5="+string(getitemnumber(getrow(),5)))
	case 6
		dw_cpo.setfilter("#1='"+getitemstring(getrow(),1)+"' and #2='"+getitemstring(getrow(),2)+"' and #3="+string(getitemnumber(getrow(),3))+" and #4='"+getitemstring(getrow(),4)+"' and #5="+string(getitemnumber(getrow(),5))+" and #6="+string(getitemnumber(getrow(),6)))
end choose
dw_cpo.filter()
long j
for j=1 to dw_cpo.rowcount()
	dw_cpo.setitem(j,'visible',data)
next
dw_cpo.setfilter("visible='1'")
dw_cpo.filter()
DW_CPO.SORT()
dw_cpo.setredraw(true)
end event

event retrieverow;if b_1.position=100 then b_1.position=0
b_1.position +=25
end event

event buttonclicked;long j,ante
string esc='1'
setpointer(hourglass!)
if dwo.text='Escoger' then
	dwo.text='Deselecc.'
else
	dwo.text='Escoger'
	esc='0'
end if
ante=getrow()
setredraw(false)
dw_cpo.setredraw(false)

string ls_filt
ls_filt=describe('datawindow.table.filter')

if ls_filt='?' then
	for j=1 to rowcount()
		scrolltorow(j)
		setitem(j,'esco',esc)
	next
	dw_cpo.setfilter('')
	dw_cpo.filter()
	
	for j=1 to dw_cpo.rowcount()
		dw_cpo.setitem(j,'visible',esc)
	next
	dw_cpo.setfilter("visible='1'")
	dw_cpo.filter()
else
	ls_filt=''
	dw_cpo.setfilter('')
	dw_cpo.filter()
	for j=1 to rowcount()
		scrolltorow(j)
		setitem(j,'esco',esc)
		if ls_filt<>'' then ls_filt=ls_filt+' OR '
		choose case i_campos
			case 2,3
				ls_filt=ls_filt+"(#2='"+getitemstring(j,2)+"' and #1="+string(getitemnumber(j,1))+")"
			case 5
				ls_filt=ls_filt+"(#1='"+getitemstring(getrow(),1)+"' and #2='"+getitemstring(j,2)+"' and #3="+string(getitemnumber(j,3))+" and #4='"+getitemstring(j,4)+"' and #5="+string(getitemnumber(j,5))+")"
			case 6
				ls_filt=ls_filt+"(#1='"+getitemstring(j,1)+"' and #2='"+getitemstring(j,2)+"' and #3="+string(getitemnumber(j,3))+" and #4='"+getitemstring(j,4)+"' and #5="+string(getitemnumber(getrow(),5))+" and #6="+string(getitemnumber(j,6))+")"
		end choose
	next
	dw_cpo.setfilter(ls_filt)
	dw_cpo.filter()
	for j=1 to dw_cpo.rowcount()
		dw_cpo.setitem(j,'visible',esc)
	next
	dw_cpo.setfilter("("+ls_filt+") and visible='1'")
	dw_cpo.filter()
end if

dw_cpo.SORT()
scrolltorow(ante)
dw_cpo.setredraw(true)
setredraw(true)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event dberror;rollback;
return 0
end event

type dw_docus from datawindow within w_interface
integer x = 18
integer y = 4
integer width = 2341
integer height = 180
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_interfaces"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('coddoc',dwc_docus)
dwc_docus.settransobject(sqlca)
if dwc_docus.retrieve(w_comp_cont.i_codemp)=0 then dwc_docus.insertrow(1)
insertrow(1)

end event

event itemchanged;string sql_cab,sql_cpo,tabla_actu,erro,sintax,tt,yy
accepttext()
tabla_actu=dwc_docus.getitemstring(dwc_docus.getrow(),'tabla')
sql_cab=dwc_docus.getitemstring(dwc_docus.getrow(),'sql_encab')
sql_cpo=dwc_docus.getitemstring(dwc_docus.getrow(),'interface')
i_campos=dwc_docus.getitemnumber(dwc_docus.getrow(),'campos_llave')
setnull(erro)
choose case i_campos
	case 2
		dw_cab.dataobject='dw_cab_interfaz'
		dw_cpo.dataobject='dw_cpo_interfaz'
	case 3
		dw_cab.dataobject='dw_cab_intfaz3'
		dw_cpo.dataobject='dw_cpo_interfaz'
	case 5
		dw_cab.dataobject='dw_cab_intfaz5'
		dw_cpo.dataobject='dw_cpo_interfaz5'
	case 6
		dw_cab.dataobject='dw_cab_intfaz6'
		dw_cpo.dataobject='dw_cpo_interfaz6'		
end choose
if g_motor<>'anywhere' then dw_cpo.Object.DataWindow.Retrieve.AsNeeded='yes'
erro=dw_cab.Modify('DataWindow.Table.Select="'+sql_cab+'"')
if erro<>'' then 
	messagebox("Atención, error en sintaxis de SQL del encabezado",erro)
	return 1
end If
erro=dw_cpo.Modify('DataWindow.Table.Select="'+sql_cpo+'"')
if erro<>''  then 
	messagebox("Atención, error en sintaxis de SQL del cpo",erro)
	return 1
end If
erro=dw_cab.Modify('DataWindow.Table.UpdateTable = "'+tabla_actu+'"')
if i_campos=3 then 
	if tabla_actu<>'factcab' then
		erro=dw_cab.Modify('#3.key= "yes"')
	else
		erro=dw_cab.Modify('#8.key= "yes"')
	end if
	
end if
if i_campos=5 then
	erro=dw_cab.Modify('#4.key= "yes"')
	erro=dw_cab.Modify('#5.key= "yes"')
end if
tt=f_remplaza(sql_cab,':fecha1',"'2001-01-01'")
tt=f_remplaza(tt,':fecha2',"'2001-01-01'")
sintax=sqlca.syntaxfromsql(tt,"",erro)
if erro<>'' then 
	messagebox("Atención, error en sintaxis de SQL del encabezado",erro)
	return 1
end if
dw_temp.create(sintax,erro)
if erro<>'' then 
	messagebox("Atención, error en sintaxis de SQL del encabezado",erro)
	return 1
end if
yy=dw_temp.describe("#1.dbname")
erro=dw_cab.Modify("#1.dbname = '"+yy+"'")
yy=dw_temp.describe("#2.dbname")
erro=dw_cab.Modify("#2.dbname = '"+yy+"'")
yy=dw_temp.describe("#3.dbname")
erro=dw_cab.Modify("#3.dbname = '"+yy+"'")
yy=dw_temp.describe("#4.dbname")
erro=dw_cab.Modify("#4.dbname = '"+yy+"'")
yy=dw_temp.describe("#5.dbname")
erro=dw_cab.Modify("#5.dbname = '"+yy+"'")
yy=dw_temp.describe("#7.dbname")
erro=dw_cab.Modify("#7.dbname = '"+yy+"'")
dw_cab.settransobject(sqlca)
dw_cpo.settransobject(sqlba)
dw_doc_cab.setitem(1,"cdoc",getitemstring(1,1))

end event

