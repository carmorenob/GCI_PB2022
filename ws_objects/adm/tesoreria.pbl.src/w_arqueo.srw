$PBExportHeader$w_arqueo.srw
forward
global type w_arqueo from w_center
end type
type dw_usu from datawindow within w_arqueo
end type
type st_3 from statictext within w_arqueo
end type
type dw_historial from datawindow within w_arqueo
end type
type dw_resumen from datawindow within w_arqueo
end type
type cb_new from picturebutton within w_arqueo
end type
type cb_anular from picturebutton within w_arqueo
end type
type st_narq from statictext within w_arqueo
end type
type dw_new from datawindow within w_arqueo
end type
type tab_1 from tab within w_arqueo
end type
type tp_det from userobject within tab_1
end type
type dw_concep from datawindow within tp_det
end type
type pb_delnota from picturebutton within tp_det
end type
type dw_nota from datawindow within tp_det
end type
type pb_nota from picturebutton within tp_det
end type
type st_1 from statictext within tp_det
end type
type sle_concep from singlelineedit within tp_det
end type
type dw_detcaja from datawindow within tp_det
end type
type dw_caja_may from datawindow within tp_det
end type
type dw_deta from datawindow within tp_det
end type
type gb_2 from groupbox within tp_det
end type
type gb_1 from groupbox within tp_det
end type
type tp_det from userobject within tab_1
dw_concep dw_concep
pb_delnota pb_delnota
dw_nota dw_nota
pb_nota pb_nota
st_1 st_1
sle_concep sle_concep
dw_detcaja dw_detcaja
dw_caja_may dw_caja_may
dw_deta dw_deta
gb_2 gb_2
gb_1 gb_1
end type
type tp_rec from userobject within tab_1
end type
type st_nrecs from statictext within tp_rec
end type
type dw_arq_det from datawindow within tp_rec
end type
type tp_rec from userobject within tab_1
st_nrecs st_nrecs
dw_arq_det dw_arq_det
end type
type tab_1 from tab within w_arqueo
tp_det tp_det
tp_rec tp_rec
end type
type pb_print from pb_report within w_arqueo
end type
type cbx_1 from checkbox within w_arqueo
end type
type cbx_2 from checkbox within w_arqueo
end type
end forward

global type w_arqueo from w_center
string tag = "Realizó un nuevo arqueo, desea guardar los cambios ?"
integer width = 3712
integer height = 2264
string title = "Arqueo de Caja"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_arqueo.ico"
boolean center = false
dw_usu dw_usu
st_3 st_3
dw_historial dw_historial
dw_resumen dw_resumen
cb_new cb_new
cb_anular cb_anular
st_narq st_narq
dw_new dw_new
tab_1 tab_1
pb_print pb_print
cbx_1 cbx_1
cbx_2 cbx_2
end type
global w_arqueo w_arqueo

type variables
string i_caja='',i_lug_caj=''
datawindowchild dw_caja,idw_tipoing,idw_usu,idw_clug
end variables

forward prototypes
public subroutine f_totales ()
public function integer grabar ()
end prototypes

public subroutine f_totales ();if tab_1.tp_rec.dw_arq_det.rowcount()<1 then
	dw_resumen.reset()
	dw_resumen.insertrow(1)
else
	dw_resumen.setitem(1,"s_trecibo",tab_1.tp_rec.dw_arq_det.getitemnumber(1,"s_trecibo"))
	dw_resumen.setitem(1,"s_tpago",tab_1.tp_rec.dw_arq_det.getitemnumber(1,"s_tpago"))
	dw_resumen.setitem(1,"s_tsaldo",tab_1.tp_rec.dw_arq_det.getitemnumber(1,"s_tsaldo"))
	dw_resumen.setitem(1,"s_descuento",tab_1.tp_rec.dw_arq_det.getitemnumber(1,"s_descuento"))
end if
end subroutine

public function integer grabar ();if not cambio then return 1
tab_1.tp_rec.dw_arq_det.accepttext()
if dw_resumen.rowcount()=0 or tab_1.tp_det.dw_deta.rowcount()=0 then return -1
if i_caja='' or i_lug_caj='' then
	messagebox("Atención","Debe escoger la caja mayor destino del arqueo")
	return -1
end if
dec valor
valor=round(dw_historial.getitemdecimal(1,'recaudo'),2)
if round(dw_resumen.getitemdecimal(1,"s_tpago"),2)<>round(tab_1.tp_det.dw_deta.getitemdecimal(1,"total"),2) then
	messagebox("Atención","El valor de la sumatoria del datalle es diferente al de la suma de lo pagado en los recibos.") 
	return -1
end if
if isnull(tab_1.tp_det.dw_concep.getitemstring(1,1)) then
	messagebox("Atención","No ha escogido el tipo de Ingreso del arqueo") 
	return -1
end if
if tab_1.tp_det.dw_nota.rowcount()>0 then 
	if tab_1.tp_det.dw_nota.getitemnumber(1,'cab_valor')=0 then
		messagebox("Atención","No colocó valor en la nota que creó.")
		return -1
	end if
	if dw_historial.getitemnumber(1,'recaudo') < 0 then 
		messagebox("Atención","El valor de la Nota es Mayor al del arqueo")
		return -1
	end if
end if
long ning=0
string concep
datetime fecha
dw_historial.accepttext()
fecha=dw_historial.getitemdatetime(1,"fecha")
concep=tab_1.tp_det.sle_concep.text
ning=f_ingreso_caja_mayor(i_caja,i_lug_caj,concep,tab_1.tp_det.dw_concep.getitemstring(1,1),fecha,valor,'1')
if ning=-1 then
	rollback;
	return -1
end if
long narqueo
setnull(narqueo)
select max(narqueo) into :narqueo from tesoarqueocab where clugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo TesoarqueoCab",sqlca.sqlerrtext)
	return -1
end if
if isnull(narqueo) then narqueo=0
narqueo ++
dw_historial.setitem(1,"codcaja",i_caja)
dw_historial.setitem(1,"clugar_caja",i_lug_caj)
dw_historial.setitem(1,"narqueo",narqueo)
dw_historial.setitem(1,"ningreso_caja",ning)
dw_historial.setitem(1,"concepto",tab_1.tp_det.sle_concep.text)
dw_historial.setitem(1,'usuario',usuario)
if dw_historial.update(true,false)=-1 then return -1
long j
tab_1.tp_rec.dw_arq_det.resetupdate()
for j=1 to tab_1.tp_rec.dw_arq_det.rowcount()
	if tab_1.tp_rec.dw_arq_det.getitemstring(j,'esco')='1' then
		tab_1.tp_rec.dw_arq_det.setitem(j,"narqueo",narqueo)
		tab_1.tp_rec.dw_arq_det.setitem(j,"clugar_arq",clugar)
	end if
next
if tab_1.tp_rec.dw_arq_det.update(true,false)=-1 then return -1

dw_new.reset()
for j=1 to tab_1.tp_det.dw_deta.rowcount()
	tab_1.tp_det.dw_deta.setitem(j,"narqueo",narqueo)
next
if tab_1.tp_det.dw_deta.update(true,false)=-1 then return -1
if tab_1.tp_det.dw_nota.rowcount()>0 then
	long nota
	nota=f_trae_ndoc('NT',i_lug_caj,'Nota de Tesorería')
	if nota=-1 then return -1
	tab_1.tp_det.dw_nota.setitem(1,'cab_num_nota',nota)
	if tab_1.tp_det.dw_nota.update(true,false)=-1 then return -1

	valor=tab_1.tp_det.dw_nota.getitemnumber(1,'cab_valor')
	INSERT INTO tesonotacpo ( CodDoc, clugar, NUM_nota, ITEM, valor, codcaja, CLugar_caja, CodDoc_caja, ningreso_caja )
	values ('NT',:clugar,:nota,1,:valor,:i_caja,:i_lug_caj,'IM',:ning);
	if sqlca.sqlcode=-1 then
		messagebox("Error insertando en Tesonotacpo",sqlca.sqlerrtext)
		rollback;
		return -1
	end if
	tab_1.tp_det.dw_detcaja.retrieve(i_lug_caj,i_caja)
end if
tab_1.tp_det.dw_nota.resetupdate()
tab_1.tp_rec.dw_arq_det.resetupdate()
dw_historial.resetupdate()
tab_1.tp_det.dw_deta.resetupdate()
commit;
f_quitafiltro(tab_1.tp_rec.dw_arq_det,string(rgb(255,255,255)))
if cbx_1.checked then
	any par[2]
	par[1]=clugar
	par[2]=narqueo
	pb_print.imprimir(par,'','0')
end if
tab_1.tp_det.sle_concep.text=''
tab_1.tp_det.sle_concep.enabled=false
cambio=false
cb_new.enabled=true
dw_historial.setitemstatus(1,0,primary!,notmodified!)
dw_historial.triggerevent(rowfocuschanged!)
garbagecollect()
return 1
end function

on w_arqueo.create
int iCurrent
call super::create
this.dw_usu=create dw_usu
this.st_3=create st_3
this.dw_historial=create dw_historial
this.dw_resumen=create dw_resumen
this.cb_new=create cb_new
this.cb_anular=create cb_anular
this.st_narq=create st_narq
this.dw_new=create dw_new
this.tab_1=create tab_1
this.pb_print=create pb_print
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_usu
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.dw_historial
this.Control[iCurrent+4]=this.dw_resumen
this.Control[iCurrent+5]=this.cb_new
this.Control[iCurrent+6]=this.cb_anular
this.Control[iCurrent+7]=this.st_narq
this.Control[iCurrent+8]=this.dw_new
this.Control[iCurrent+9]=this.tab_1
this.Control[iCurrent+10]=this.pb_print
this.Control[iCurrent+11]=this.cbx_1
this.Control[iCurrent+12]=this.cbx_2
end on

on w_arqueo.destroy
call super::destroy
destroy(this.dw_usu)
destroy(this.st_3)
destroy(this.dw_historial)
destroy(this.dw_resumen)
destroy(this.cb_new)
destroy(this.cb_anular)
destroy(this.st_narq)
destroy(this.dw_new)
destroy(this.tab_1)
destroy(this.pb_print)
destroy(this.cbx_1)
destroy(this.cbx_2)
end on

event open;call super::open;cbx_2.triggerevent (clicked!)
end event

type pb_grabar from w_center`pb_grabar within w_arqueo
integer x = 3442
integer y = 580
end type

event pb_grabar::clicked;call super::clicked;grabar()
end event

type dw_usu from datawindow within w_arqueo
integer x = 41
integer y = 20
integer width = 1006
integer height = 148
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_usuario"
boolean border = false
boolean livescroll = true
end type

event itemchanged;choose case f_pregunta()
	case 1
		if grabar()=-1 then 
			this.setitem(1,1,this.getitemstring(1,1))
			return 1
		end if
	case 2
		cambio=false
		cb_new.enabled=true
	case 3
		this.setitem(1,1,this.getitemstring(1,1))
		return 1
end choose
this.accepttext()
dw_resumen.reset()
dw_resumen.insertrow(1)
f_quitafiltro(tab_1.tp_rec.dw_arq_det,string(rgb(255,255,255)))
tab_1.tp_rec.dw_arq_det.reset()
tab_1.tp_det.dw_deta.reset()
dw_historial.reset()
dw_historial.retrieve(this.getitemstring(1,"usuario"))
end event

event constructor;settransobject(SQLCA)
getchild('usuario',idw_usu)
insertrow(1)
end event

type st_3 from statictext within w_arqueo
integer x = 50
integer y = 164
integer width = 1047
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Arqueos por Usuario (Cajero)"
boolean focusrectangle = false
end type

type dw_historial from datawindow within w_arqueo
integer x = 41
integer y = 220
integer width = 3369
integer height = 428
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_arqueo_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(SQLCA)
end event

event rowfocuschanged;long narq,fila
string clug_arq
tab_1.tp_det.dw_concep.reset()
fila=getrow()
if fila<1 then return
narq=getitemnumber(fila,"narqueo")
clug_arq=this.getitemstring(fila,"clugar")
tab_1.tp_det.dw_concep.retrieve(clug_arq,narq)
if not isnull(narq) then 
	if g_motor='postgres' then
		tab_1.tp_rec.dw_arq_det.dataobject='dw_arqueo_detalle_postgres'
	else
		tab_1.tp_rec.dw_arq_det.dataobject='dw_arqueo_detalle'
	end if
	tab_1.tp_rec.dw_arq_det.settransobject(sqlca)
	tab_1.tp_rec.dw_arq_det.retrieve(clug_arq,narq)
	tab_1.tp_det.dw_deta.retrieve(clug_arq,narq)
	tab_1.tp_det.dw_nota.retrieve(clug_arq,narq)
	tab_1.tp_rec.dw_arq_det.modify('esco.width=0')
	tab_1.tp_rec.dw_arq_det.modify('esco.protect="1"')
	tab_1.tp_rec.dw_arq_det.modify('b_1.visible=0')
end if
st_narq.text="Reg. "+string(this.getrow())+" de "+string(this.rowcount())
f_totales()
end event

event rowfocuschanging;if cambio then return 1
end event

event clicked;if not cambio then
	if row>0 then this.scrolltorow(row)
end if
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event itemchanged;if getitemstring(row,'nueva')='false' then
	datetime actual,nueva
	actual=getitemdatetime(row,'fecha')
	if messagebox("Atención",'Está seguro que desea cambiar la fecha del arqueo?',question!,yesno!,2)=2 then 
		settext(string(actual))
		setitem(row,'fecha',actual)
		return 1
	end if
	accepttext()
	if update()=-1 then
		setitem(row,'fecha',actual)
		rollback;
	else
		nueva=getitemdatetime(row,'fecha')
		long ning
		string coddoc_ing,clug_ing,cod_caja
		ning=getitemnumber(row,'ningreso')
		coddoc_ing=getitemstring(row,'coddoc_ing')
		clug_ing=getitemstring(row,'clugar_ing')
		cod_caja=getitemstring(row,'codcaja_ing')
		update tesocajaingreso set fecha_ingreso=:nueva
		where codcaja=:cod_caja and clugar=:clug_ing and coddoc=:coddoc_ing and ningreso=:ning;
		if sqlca.sqlcode=-1 then 
			settext(string(actual))
			setitem(row,'fecha',actual)
			messagebox("Error actualizando fecha de tesocajaingreso",sqlca.sqlerrtext)
			rollback;
		else
			commit;
		end if
	end if
		
end if

end event

event dberror;rollback;
return 0
end event

type dw_resumen from datawindow within w_arqueo
integer x = 1138
integer y = 20
integer width = 1943
integer height = 164
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_arqueo_totales"
boolean border = false
boolean livescroll = true
end type

event constructor;this.insertrow(1)
end event

type cb_new from picturebutton within w_arqueo
event mousemove pbm_mousemove
integer x = 3442
integer y = 320
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo Arqueo"
end type

event clicked;if idw_tipoing.rowcount()=0 then
	messagebox('Atención','No ha definido un tipo de Ingreso ARQUEO en la tabla Operaciones Tesorería / Cartera')
	return
end if
if g_motor='postgres' then
	dw_new.dataobject='dw_arqueo_detalle_falta_postgres'
	tab_1.tp_rec.dw_arq_det.dataobject='dw_arqueo_detalle_postgres'
else
	dw_new.dataobject='dw_arqueo_detalle_falta'
	tab_1.tp_rec.dw_arq_det.dataobject='dw_arqueo_detalle'
end if
dw_new.settransobject(sqlca)
tab_1.tp_rec.dw_arq_det.settransobject(sqlca)
dw_new.retrieve(dw_usu.getitemstring(1,1))
if dw_new.rowcount()=0 then
	messagebox("Atención","Este Usuario no tiene pendiente recibos para realizarle arqueos")
	return
else
	if dw_historial.rowcount()=0 then dw_historial.insertrow(1)
	if not isnull(dw_historial.getitemnumber(1,"narqueo")) then dw_historial.insertrow(1)
	dw_historial.scrolltorow(1)
	dw_historial.setitem(1,"clugar",clugar)
	dw_historial.setitem(1,"usuario_arqueo",dw_usu.getitemstring(1,1))
	dw_historial.setitem(1,"coddoc_caja",'IM')
	dw_historial.setitem(1,"fecha",datetime(today(),now()))
	dw_historial.setitem(1,"fecha_crea",datetime(today(),now()))
	tab_1.tp_det.dw_nota.reset()
	tab_1.tp_rec.dw_arq_det.reset()
	tab_1.tp_rec.dw_arq_det.modify('esco.width=201')
	tab_1.tp_rec.dw_arq_det.modify('esco.protect="0"')
	tab_1.tp_rec.dw_arq_det.modify('b_1.visible=1')
	dw_new.RowsCopy(1, dw_new.RowCount(), Primary!, tab_1.tp_rec.dw_arq_det, 1, Primary!)
	tab_1.tp_rec.dw_arq_det.triggerevent(rowfocuschanged!)
	tab_1.tp_rec.dw_arq_det.triggerevent("p_itemchanged")
	dw_historial.setcolumn("recaudo")
	cambio=true
	this.enabled=false
	tab_1.tp_det.sle_concep.enabled=true
	tab_1.tp_det.sle_concep.text='Arqueo del Usuario: ' +idw_usu.getitemstring(idw_usu.getrow(),'todo')
	dw_historial.setfocus()
	tab_1.tp_det.dw_concep.reset()
	tab_1.tp_det.dw_concep.insertrow(1)
	if idw_tipoing.rowcount()=1 then
		tab_1.tp_det.dw_concep.setitem(1,1,idw_tipoing.getitemstring(1,1))
	end if
end if
idw_clug.setfilter('codlugar="' +clugar+'"')
idw_clug.filter()
i_lug_caj=clugar
dw_caja.retrieve(i_lug_caj)
end event

type cb_anular from picturebutton within w_arqueo
event mousemove pbm_mousemove
string tag = "Anular Arqueo"
integer x = 3442
integer y = 448
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Anular Arqueo"
end type

event clicked;if dw_historial.rowcount()=0 or dw_historial.getrow()<1 or cambio then return
long fila
fila=dw_historial.getrow()
if not isnull(dw_historial.getitemstring(fila,"estado")) then
	messagebox("Atención","Este arqueo ya fue anulado")
	return
end if
if not isnull(dw_historial.getitemnumber(fila,"nrcaj_egr")) then
	messagebox("Atención","Este arqueo ya fue Consignado , no lo puede anular")
	return
end if
if dw_historial.getitemstring(fila,"contabil_ing")='C' then
	messagebox("Atención","El ingreso a caja mayor de este arqueo ya fue Contabilizado, no lo puede Anular")
	return
end if
if dw_historial.getitemstring(fila,"contabil")='C' then
	messagebox("Atención","Este arqueo ya fue contabilizado, no lo puede anular")
	return
end if
st_xa_anular st_anula
st_anula.tipo='TE'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
long narqueo,ning_cajam
string clug_arq,cod_cajam,clug_cajam,coddoc_cajam,motiv1,cod_anula
datetime fecha
dec valor
valor=dw_historial.getitemnumber(fila,"recaudo")
narqueo=dw_historial.getitemnumber(fila,"narqueo")
clug_arq=dw_historial.getitemstring(fila,"clugar")
cod_cajam=dw_historial.getitemstring(fila,"codcaja")
clug_cajam=dw_historial.getitemstring(fila,"clugar_caja")
coddoc_cajam=dw_historial.getitemstring(fila,"coddoc_caja")
ning_cajam=dw_historial.getitemnumber(fila,"ningreso_caja")
fecha=datetime(today(),now())
motiv1=left('Anulación del Arqueo Nro '+string(narqueo)+' : '+st_anula.observacion,255)
cod_anula=st_anula.motivo
string cdoc_not,clug_not
long num_not,j
for j= 1 to tab_1.tp_det.dw_nota.rowcount()
	cdoc_not = tab_1.tp_det.dw_nota.getitemstring(j,'cab_coddoc')
	clug_not = tab_1.tp_det.dw_nota.getitemstring(j,'cab_clugar')
	num_not = tab_1.tp_det.dw_nota.getitemnumber(j,'cab_num_nota')
	update tesonotascab set estado=:usuario,fecha_anula=:fecha,motiv_anula=:motiv1,cod_anula=cod_anula
	where coddoc=:cdoc_not and clugar=:clug_not and num_nota=:num_not;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando TesoNotasCab",sqlca.sqlerrtext)
		rollback;
		return
	end if
next
update tesocajaingreso set estado=:usuario,fecha_anula=:fecha,motiv_anula=:motiv1
where codcaja=:cod_cajam and clugar=:clug_cajam and coddoc=:coddoc_cajam and ningreso=:ning_cajam;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando TesoCajaIngreso",sqlca.sqlerrtext)
	rollback;
	return
end if
update tesorecajcab set narqueo=null , clugar_arq=null where narqueo=:narqueo and clugar_arq=:clug_arq;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando tesorecajcab",sqlca.sqlerrtext)
	rollback;
	return
end if
dw_historial.setitem(fila,"estado",usuario)
dw_historial.setitem(fila,"fecha_anula",fecha)
dw_historial.setitem(fila,"motiv_anula",st_anula.observacion)
dw_historial.setitem(fila,"cod_anula",st_anula.motivo)
if dw_historial.update()=-1 then
	rollback;
else
	commit;
	tab_1.tp_rec.dw_arq_det.reset()
	tab_1.tp_det.dw_detcaja.retrieve(i_lug_caj,i_caja)
end if

end event

type st_narq from statictext within w_arqueo
integer x = 2894
integer y = 652
integer width = 512
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_new from datawindow within w_arqueo
boolean visible = false
integer x = 1262
integer y = 676
integer width = 1527
integer height = 80
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_arqueo_detalle_falta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//this.settransobject(sqlca)

end event

type tab_1 from tab within w_arqueo
integer x = 23
integer y = 660
integer width = 3575
integer height = 1308
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_det tp_det
tp_rec tp_rec
end type

on tab_1.create
this.tp_det=create tp_det
this.tp_rec=create tp_rec
this.Control[]={this.tp_det,&
this.tp_rec}
end on

on tab_1.destroy
destroy(this.tp_det)
destroy(this.tp_rec)
end on

type tp_det from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3538
integer height = 1180
long backcolor = 67108864
string text = "Detalle Arqueo"
long tabtextcolor = 33554432
string picturename = "arq_deta.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra el detalle del Arqueo"
dw_concep dw_concep
pb_delnota pb_delnota
dw_nota dw_nota
pb_nota pb_nota
st_1 st_1
sle_concep sle_concep
dw_detcaja dw_detcaja
dw_caja_may dw_caja_may
dw_deta dw_deta
gb_2 gb_2
gb_1 gb_1
end type

on tp_det.create
this.dw_concep=create dw_concep
this.pb_delnota=create pb_delnota
this.dw_nota=create dw_nota
this.pb_nota=create pb_nota
this.st_1=create st_1
this.sle_concep=create sle_concep
this.dw_detcaja=create dw_detcaja
this.dw_caja_may=create dw_caja_may
this.dw_deta=create dw_deta
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.dw_concep,&
this.pb_delnota,&
this.dw_nota,&
this.pb_nota,&
this.st_1,&
this.sle_concep,&
this.dw_detcaja,&
this.dw_caja_may,&
this.dw_deta,&
this.gb_2,&
this.gb_1}
end on

on tp_det.destroy
destroy(this.dw_concep)
destroy(this.pb_delnota)
destroy(this.dw_nota)
destroy(this.pb_nota)
destroy(this.st_1)
destroy(this.sle_concep)
destroy(this.dw_detcaja)
destroy(this.dw_caja_may)
destroy(this.dw_deta)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type dw_concep from datawindow within tp_det
integer x = 91
integer y = 1020
integer width = 741
integer height = 136
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_arq_tipo"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('cartipo',idw_tipoing)
idw_tipoing.settransobject(sqlca)
idw_tipoing.retrieve('A')
settransobject(sqlca)
end event

type pb_delnota from picturebutton within tp_det
integer x = 3232
integer y = 648
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string powertiptext = "Borrar Nota"
end type

event clicked;if dw_nota.rowcount()>0 and cambio then 
	dw_nota.deleterow(1)
	tab_1.tp_rec.dw_arq_det.event p_itemchanged()
end if
end event

type dw_nota from datawindow within tp_det
integer x = 82
integer y = 524
integer width = 2999
integer height = 260
integer taborder = 30
string title = "none"
string dataobject = "dw_nota_cab_cpo"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;if cambio then tab_1.tp_rec.dw_arq_det.post event p_itemchanged()
end event

event dberror;rollback;
return 0
end event

type pb_nota from picturebutton within tp_det
integer x = 3232
integer y = 516
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar.gif"
string powertiptext = "Insertar Nota (Débito o Crédito)"
end type

event clicked;if dw_nota.rowcount()=0 and cambio then 
	dw_nota.insertrow(1)
	dw_nota.setitem(1,'cab_fecha',datetime(today()))
	dw_nota.setitem(1,'cab_coddoc','NT')
	dw_nota.setitem(1,'cpo_coddoc','NT')
	dw_nota.setitem(1,'cab_clugar',clugar)
	dw_nota.setitem(1,'cpo_clugar',clugar)
	dw_nota.setitem(1,'cab_tiponota','I')
	dw_nota.setitem(1,'cab_usuario',usuario)
end if
end event

type st_1 from statictext within tp_det
integer x = 850
integer y = 1112
integer width = 462
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción ingreso:"
boolean focusrectangle = false
end type

type sle_concep from singlelineedit within tp_det
integer x = 841
integer y = 1024
integer width = 2546
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type dw_detcaja from datawindow within tp_det
integer x = 1687
integer y = 848
integer width = 1710
integer height = 148
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_caja_mayor_respon"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

type dw_caja_may from datawindow within tp_det
integer x = 78
integer y = 848
integer width = 1650
integer height = 140
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_caja_mayor"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild("codcaja",dw_caja)
getchild("clugar",idw_clug)
dw_caja.settransobject(sqlca)
idw_clug.settransobject(sqlca)
dw_caja.insertrow(1)
insertrow(1)
setitem(1,'clugar',clugar)




end event

event itemchanged;accepttext()
if getcolumnname()='clugar' then
	i_lug_caj=getitemstring(1,"clugar")
	dw_detcaja.reset()
	dw_caja.retrieve(i_lug_caj)
	setitem(1,"codcaja",'')
	i_caja=''
else
	i_caja=getitemstring(1,"codcaja")
	dw_detcaja.retrieve(i_lug_caj,i_caja)
end if
end event

type dw_deta from datawindow within tp_det
integer x = 64
integer y = 4
integer width = 2907
integer height = 476
integer taborder = 20
string title = "none"
string dataobject = "dw_arqueo_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;if not cambio then return 1
end event

event dberror;rollback;
return 0
end event

type gb_2 from groupbox within tp_det
integer x = 59
integer y = 476
integer width = 3369
integer height = 316
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notas:"
end type

type gb_1 from groupbox within tp_det
integer x = 59
integer y = 796
integer width = 3369
integer height = 380
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Caja Mayor Destino:"
end type

type tp_rec from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3538
integer height = 1180
long backcolor = 67108864
string text = "Recibos del Arqueo"
long tabtextcolor = 33554432
string picturename = "calculator.ico"
long picturemaskcolor = 536870912
string powertiptext = "Recibos de Caja del Arqueo"
st_nrecs st_nrecs
dw_arq_det dw_arq_det
end type

on tp_rec.create
this.st_nrecs=create st_nrecs
this.dw_arq_det=create dw_arq_det
this.Control[]={this.st_nrecs,&
this.dw_arq_det}
end on

on tp_rec.destroy
destroy(this.st_nrecs)
destroy(this.dw_arq_det)
end on

type st_nrecs from statictext within tp_rec
integer x = 3008
integer y = 1116
integer width = 517
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_arq_det from datawindow within tp_rec
event p_itemchanged ( )
integer y = 4
integer width = 3534
integer height = 1104
integer taborder = 30
string title = "none"
string dataobject = "dw_arqueo_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
dw_historial.setitem(1,"nrecibos",getitemnumber(1,'selecc'))
dw_historial.setitem(1,"trecibos",getitemnumber(1,"s_trecibo"))
dw_historial.setitem(1,"tpagos",getitemnumber(1,"s_tpago"))
dw_historial.setitem(1,"tsaldos",getitemnumber(1,"s_tsaldo"))
dw_historial.setitem(1,"tdescuentos",getitemnumber(1,"s_descuento"))
dw_historial.setitem(1,"tabono",getitemnumber(1,"s_tabono"))
dw_resumen.setitem(1,"s_trecibo",getitemnumber(1,"s_trecibo"))
dw_resumen.setitem(1,"s_tpago",getitemnumber(1,"s_tpago"))
dw_resumen.setitem(1,"s_tsaldo",getitemnumber(1,"s_tsaldo"))
dw_resumen.setitem(1,"s_descuento",getitemnumber(1,"s_descuento"))
dw_resumen.setitem(1,"s_tabono",getitemnumber(1,"s_tabono"))
long j
tab_1.tp_det.dw_deta.reset()
for j=1 to rowcount()
	if getitemstring(j,'fpago')='2' and getitemstring(j,'esco')='1' then //si son cheques toca uno por uno
		tab_1.tp_det.dw_deta.insertrow(1)
		tab_1.tp_det.dw_deta.setitem(1,"nitem",tab_1.tp_det.dw_deta.rowcount())
		tab_1.tp_det.dw_deta.setitem(1,"clugar",clugar)
		tab_1.tp_det.dw_deta.setitem(1,"forma",'2')
		tab_1.tp_det.dw_deta.setitem(1,"valor",getitemnumber(j,'tpago'))
	end if
	if getitemnumber(j,'cuenta')=1 and getitemstring(j,'fpago')<>'2' then //cuenta es un computado que enumera por forma de pago
		tab_1.tp_det.dw_deta.insertrow(1)											 //osea que solo lleva uno(el primero del grupo)
		tab_1.tp_det.dw_deta.setitem(1,"nitem",tab_1.tp_det.dw_deta.rowcount())
		tab_1.tp_det.dw_deta.setitem(1,"clugar",clugar)
		tab_1.tp_det.dw_deta.setitem(1,"forma",getitemstring(j,'fpago'))
		tab_1.tp_det.dw_deta.setitem(1,"valor",dec(describe("evaluate('sum(tpag for group 1)',"+string(j)+")")))
	end if
next
dw_historial.setitem(1,"recaudo",dw_resumen.getitemnumber(1,"s_tpago"))
dw_historial.setitem(1,"nrecibos",tab_1.tp_rec.dw_arq_det.rowcount())
dw_historial.setitem(1,"trecibos",dw_resumen.getitemnumber(1,"s_trecibo"))
dw_historial.setitem(1,"tpagos",dw_resumen.getitemnumber(1,"s_tpago"))
dw_historial.setitem(1,"tsaldos",dw_resumen.getitemnumber(1,"s_tsaldo"))
dw_historial.setitem(1,"tdescuentos",dw_resumen.getitemnumber(1,"s_descuento"))
dw_historial.setitem(1,'tnotacred',0)
dw_historial.setitem(1,'tnotadeb',0)
if tab_1.tp_det.dw_nota.rowcount()>0 then
	tab_1.tp_det.dw_nota.accepttext()
	if tab_1.tp_det.dw_nota.getitemnumber(1,'cab_clasenota')=1 then //debito
		dw_historial.setitem(1,'recaudo',getitemnumber(1,"s_tpago")+tab_1.tp_det.dw_nota.getitemnumber(1,'cab_valor'))
		dw_historial.setitem(1,'tnotadeb',tab_1.tp_det.dw_nota.getitemnumber(1,'cab_valor'))
	else//credito
		dw_historial.setitem(1,'recaudo',getitemnumber(1,"s_tpago")-tab_1.tp_det.dw_nota.getitemnumber(1,'cab_valor'))
		dw_historial.setitem(1,'tnotacred',tab_1.tp_det.dw_nota.getitemnumber(1,'cab_valor'))
	end if
	
end if
end event

event constructor;//settransobject(SQLCA)
//SetRedraw ( true )


end event

event rowfocuschanged;st_nrecs.text="Reg. "+string(getrow())+" de "+string(rowcount())
//machete para que cuando filtren actualize totales
if rowcount()>0 then
	groupcalc()
	if dw_resumen.rowcount()>0 and cambio then
		if dw_resumen.getitemnumber(1,"s_trecibo")<>getitemnumber(1,"s_trecibo") then event p_itemchanged()
	end if
else
	dw_resumen.reset()
	dw_resumen.insertrow(1)
end if
end event

event itemchanged;this.event  post p_itemchanged( )
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
garbagecollect()
end event

event buttonclicked;string esco='1'
long j
if dwo.text='Escoger' then
	dwo.text='Deselec.'
else
	dwo.text='Escoger'
	esco='0'
end if
for j=1 to rowcount()
	setitem(j,'esco',esco)
next
if rowcount()>0 then event p_itemchanged()
end event

event dberror;rollback;
return 0
end event

type pb_print from pb_report within w_arqueo
integer x = 3442
integer y = 188
integer taborder = 30
boolean bringtotop = true
string powertiptext = "Imprimir Arqueo Seleccionado"
string cod_rep = "ARQ"
string nombre_rep = "Arqueo de Caja"
string tipo_rep = "interno!"
end type

event constructor;call super::constructor;i_clugar=clugar
end event

event clicked;call super::clicked;if dw_historial.rowcount()=0 then return
any par[2]
par[1]=dw_historial.getitemstring(dw_historial.getrow(),'clugar')
par[2]=dw_historial.getitemnumber(dw_historial.getrow(),'narqueo')
imprimir(par,'','0')
end event

type cbx_1 from checkbox within w_arqueo
integer x = 3104
integer y = 80
integer width = 512
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imp. Nuevo Arqueo"
end type

type cbx_2 from checkbox within w_arqueo
integer x = 297
integer y = 20
integer width = 681
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solo pendientes de Arqueo"
boolean checked = true
end type

event clicked;if checked then
	dw_usu.modify('usuario.dddw.name="dw_usus_con_arqueos"')
	dw_usu.getchild('usuario',idw_usu)
	idw_usu.settransobject(sqlca)
else
	dw_usu.modify('usuario.dddw.name="dw_usuarios"')
	dw_usu.getchild('usuario',idw_usu)
	idw_usu.settransobject(sqlca)
end if
idw_usu.retrieve()
string nulo 
setnull(nulo)
dw_usu.setitem(1,1,nulo)
dw_usu.triggerevent (itemchanged!)
end event

