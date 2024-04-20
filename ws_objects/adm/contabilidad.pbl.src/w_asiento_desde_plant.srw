$PBExportHeader$w_asiento_desde_plant.srw
forward
global type w_asiento_desde_plant from window
end type
type b_1 from hprogressbar within w_asiento_desde_plant
end type
type dw_cpo from datawindow within w_asiento_desde_plant
end type
type dw_cierres from datawindow within w_asiento_desde_plant
end type
type dw_doc_cab from datawindow within w_asiento_desde_plant
end type
type pb_2 from picturebutton within w_asiento_desde_plant
end type
type pb_1 from picturebutton within w_asiento_desde_plant
end type
type dw_1 from datawindow within w_asiento_desde_plant
end type
end forward

global type w_asiento_desde_plant from window
integer width = 1861
integer height = 1320
boolean titlebar = true
string title = "Nuevo Asiento Contable desde Plantillas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "devolucion.ico"
boolean center = true
b_1 b_1
dw_cpo dw_cpo
dw_cierres dw_cierres
dw_doc_cab dw_doc_cab
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_asiento_desde_plant w_asiento_desde_plant

on w_asiento_desde_plant.create
this.b_1=create b_1
this.dw_cpo=create dw_cpo
this.dw_cierres=create dw_cierres
this.dw_doc_cab=create dw_doc_cab
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.b_1,&
this.dw_cpo,&
this.dw_cierres,&
this.dw_doc_cab,&
this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_asiento_desde_plant.destroy
destroy(this.b_1)
destroy(this.dw_cpo)
destroy(this.dw_cierres)
destroy(this.dw_doc_cab)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;dw_1.retrieve(w_comp_cont.i_codemp,w_comp_cont.docum_contable)
dw_1.setfilter("estado='1'")
dw_1.filter()
dw_1.triggerevent(rowfocuschanged!)
end event

type b_1 from hprogressbar within w_asiento_desde_plant
integer x = 1134
integer y = 1088
integer width = 622
integer height = 60
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

type dw_cpo from datawindow within w_asiento_desde_plant
boolean visible = false
integer x = 32
integer y = 980
integer width = 594
integer height = 172
integer taborder = 30
string title = "none"
string dataobject = "dw_cont_plant_cpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_cierres from datawindow within w_asiento_desde_plant
boolean visible = false
integer x = 1399
integer y = 844
integer width = 146
integer height = 180
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cierres"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
retrieve(w_comp_cont.i_codemp)
end event

type dw_doc_cab from datawindow within w_asiento_desde_plant
integer x = 238
integer y = 812
integer width = 1125
integer height = 168
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_doc_cab"
boolean border = false
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,"cod_empresa",w_comp_cont.i_codemp)
setitem(1,"cdoc",w_comp_cont.docum_contable)
setitem(1,"ano",year(today()))
setitem(1,"mes",month(today()))
setitem(1,"fecha",datetime(today()))

end event

type pb_2 from picturebutton within w_asiento_desde_plant
integer x = 818
integer y = 1028
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_asiento_desde_plant
integer x = 654
integer y = 1028
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type dw_1 from datawindow within w_asiento_desde_plant
integer x = 14
integer y = 24
integer width = 1746
integer height = 764
integer taborder = 10
string title = "none"
string dataobject = "dw_cont_plant"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
modify('estado.visible=0')
modify('nombre.edit.displayonly=yes')
end event

event doubleclicked;if getrow()<1 then return
dw_doc_cab.accepttext()
int ano_contable,mes_contable
ano_contable=dw_doc_cab.getitemnumber(1,"ano")
mes_contable=dw_doc_cab.getitemnumber(1,"mes")
long j,fila_mes,ciclo_mes
dec valor
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
else
	if dw_cierres.getitemstring(fila_mes,"estado")='1' then
		messagebox("Atención","Este mes contable se encuentra cerrado, no puede actualizarle saldos")
		return -1
	end if
end if
if messagebox("Atención",'Está seguro que desea crear el documento?, el nro del mismo ya quedará utilizado.',question!,yesno!,1)=2 then return
if w_comp_cont.f_new_docu(false)=-1 then return//pb_new.triggerevent(clicked!)
w_comp_cont.dw_doc_cab.deleterow(1)
long ojo,nnulo
string snulo,ojo2
setnull(nnulo)
setnull(snulo)
for j=1 to dw_cpo.rowcount()
	dw_cpo.setitem(j,'cp_secuencia',j)
	B_1.POSITION=j*80/dw_cpo.rowcount()
	w_comp_cont.dw_detalle.insertrow(0)
	w_comp_cont.dw_detalle.setitem(j,1,w_comp_cont.i_codemp)//emp
	w_comp_cont.dw_detalle.setitem(j,2,dw_doc_cab.getitemnumber(1,'ano'))//ano
	w_comp_cont.dw_detalle.setitem(j,3,dw_doc_cab.getitemnumber(1,'mes'))//mes
	w_comp_cont.dw_detalle.setitem(j,4,w_comp_cont.docum_contable)//cdoc
	w_comp_cont.dw_detalle.setitem(j,6,j)//secuen
	w_comp_cont.dw_detalle.setitem(j,'cp_cuenta',dw_cpo.getitemstring(j,'cp_cuenta'))
	w_comp_cont.dw_detalle.setitem(j,'descrip',dw_cpo.getitemstring(j,'descrip'))
	w_comp_cont.dw_detalle.setitem(j,'cp_detalle',dw_cpo.getitemstring(j,'cp_detalle'))
	w_comp_cont.dw_detalle.setitem(j,'tipodoc',dw_cpo.getitemstring(j,'tipodoc'))
	w_comp_cont.dw_detalle.setitem(j,'documento',dw_cpo.getitemstring(j,'documento'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_persona',dw_cpo.getitemstring(j,'terceros_persona'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_nombre1',dw_cpo.getitemstring(j,'terceros_nombre1'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_nombre2',dw_cpo.getitemstring(j,'terceros_nombre2'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_apellido1',dw_cpo.getitemstring(j,'terceros_apellido1'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_apellido2',dw_cpo.getitemstring(j,'terceros_apellido2'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_razon_social',dw_cpo.getitemstring(j,'terceros_razon_social'))
	w_comp_cont.dw_detalle.setitem(j,'cp_dverificacion',dw_cpo.getitemstring(j,'cp_dverificacion'))
	w_comp_cont.dw_detalle.setitem(j,'corriente',dw_cpo.getitemstring(j,'corriente'))
	valor=round(dw_cpo.getitemdecimal(j,'cp_valordeb'),w_comp_cont.i_dec_gral)//valordeb
	if w_comp_cont.i_dec_gral=0 then
		valor=long(valor/w_comp_cont.i_aprox_gral)*w_comp_cont.i_aprox_gral +w_comp_cont.i_aprox_gral*round((valor -long(valor/w_comp_cont.i_aprox_gral)*w_comp_cont.i_aprox_gral)/w_comp_cont.i_aprox_gral,0)
	end if
	w_comp_cont.dw_detalle.setitem(j,'cp_valordeb',valor)//valores
	valor=round(dw_cpo.getitemdecimal(j,'cp_valorcred'),w_comp_cont.i_dec_gral)//valorcred
	if w_comp_cont.i_dec_gral=0 then
		valor=long(valor/w_comp_cont.i_aprox_gral)*w_comp_cont.i_aprox_gral +w_comp_cont.i_aprox_gral*round((valor -long(valor/w_comp_cont.i_aprox_gral)*w_comp_cont.i_aprox_gral)/w_comp_cont.i_aprox_gral,0)
	end if
	w_comp_cont.dw_detalle.setitem(j,'cp_valorcred',valor)//valores
	w_comp_cont.dw_detalle.setitem(j,'ccosto',dw_cpo.getitemstring(j,'ccosto'))
	w_comp_cont.dw_detalle.setitem(j,'tercero',dw_cpo.getitemstring(j,'tercero'))
	w_comp_cont.dw_detalle.setitem(j,'naturaleza',dw_cpo.getitemstring(j,'naturaleza'))
	w_comp_cont.dw_detalle.setitem(j,'rfuente',dw_cpo.getitemstring(j,'rfuente'))
	w_comp_cont.dw_detalle.setitem(j,'cp_cufuncional',dw_cpo.getitemstring(j,'cp_cufuncional'))
	w_comp_cont.dw_detalle.setitem(j,'cp_ccosto',dw_cpo.getitemstring(j,'cp_ccosto'))
	w_comp_cont.dw_detalle.setitem(j,'descripcion',dw_cpo.getitemstring(j,'descripcion'))
	w_comp_cont.dw_detalle.setitem(j,'estado','0')
	w_comp_cont.dw_detalle.setitem(j,'base',dw_cpo.getitemdecimal(j,'base'))//base
	w_comp_cont.dw_detalle.setitem(j,'base_desde',dw_cpo.getitemdecimal(j,'base_desde'))//basedeste
	w_comp_cont.dw_detalle.setitem(j,'porcentaje',dw_cpo.getitemdecimal(j,'porcentaje'))//porcentaje
	w_comp_cont.dw_detalle.setitem(j,'inicia',dw_cpo.getitemdate(j,'inicia'))
	w_comp_cont.dw_detalle.setitem(j,'termina',dw_cpo.getitemdate(j,'termina'))
//	w_comp_cont.dw_detalle.setitem(j,'inicia',dw_cpo.getitemdatetime(j,'inicia'))
//	w_comp_cont.dw_detalle.setitem(j,'termina',dw_cpo.getitemdatetime(j,'termina'))
	w_comp_cont.dw_detalle.setitem(j,'concep_ant',dw_cpo.getitemstring(j,'concep_ant'))
	w_comp_cont.dw_detalle.setitem(j,'coddocext',dw_cpo.getitemstring(j,'coddocext'))
	w_comp_cont.dw_detalle.setitem(j,'t_corriente',dw_cpo.getitemstring(j,'t_corriente'))
	w_comp_cont.dw_detalle.setitem(j,'pre_sopo_externo',dw_cpo.getitemstring(j,'pre_sopo_externo'))
	w_comp_cont.dw_detalle.setitem(j,'nsopo_externo',dw_cpo.getitemnumber(j,'nsopo_externo'))//nsopext
	w_comp_cont.dw_detalle.setitem(j,'visibl','1')
	w_comp_cont.dw_detalle.setitem(j,'desde_inter','0')
	if not isnull(dw_cpo.getitemstring(j,'coddocext')) then w_comp_cont.dw_detalle.setitem(j,'cod_empre_doc_ext',w_comp_cont.i_codemp)
	w_comp_cont.dw_detalle.setitem(j,'t_estado',dw_cpo.getitemstring(j,'t_estado'))
	w_comp_cont.dw_detalle.setitem(j,'t_pyg',dw_cpo.getitemstring(j,'t_pyg'))
	w_comp_cont.dw_detalle.setitem(j,'clugar',dw_cpo.getitemstring(j,'clugar'))
	w_comp_cont.dw_detalle.setitem(j,'lugar',dw_cpo.getitemstring(j,'lugar'))
	w_comp_cont.dw_detalle.setitem(j,'tipo_transac',dw_cpo.getitemstring(j,'tipo_transac'))
	w_comp_cont.dw_detalle.setitem(j,'descont',dw_cpo.getitemstring(j,'descont'))
	w_comp_cont.dw_detalle.setitem(j,'deduc_renta',dw_cpo.getitemstring(j,'deduc_renta'))
next
ojo=dw_doc_cab.rowscopy(1,1,primary!,w_comp_cont.dw_doc_cab,1,primary!)
w_comp_cont.cambio=true
b_1.position=90
if w_comp_cont.grabar(false)=-1 then
	w_comp_cont.cambio=false
	w_comp_cont.dw_detalle.reset()
	rollback;
	b_1.position=0
	return -1
else
	commit;
	b_1.position=100
	w_comp_cont.pb_new_otro.enabled=true
	close(parent)
end if
end event

event rowfocuschanged;if rowcount()=0 then return
dw_cpo.retrieve(w_comp_cont.i_codemp,w_comp_cont.docum_contable,getitemnumber(getrow(),'nplant'),w_comp_cont.i_dec_gral,w_comp_cont.i_dec_rte)
end event

