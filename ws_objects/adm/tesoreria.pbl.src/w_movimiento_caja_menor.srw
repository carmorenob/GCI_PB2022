$PBExportHeader$w_movimiento_caja_menor.srw
forward
global type w_movimiento_caja_menor from w_center
end type
type dw_cajas from datawindow within w_movimiento_caja_menor
end type
type dw_detcaja from datawindow within w_movimiento_caja_menor
end type
type tab_1 from tab within w_movimiento_caja_menor
end type
type tabp_2 from userobject within tab_1
end type
type pb_4 from pb_report within tabp_2
end type
type gb_1 from groupbox within tabp_2
end type
type st_3 from statictext within tabp_2
end type
type dw_gasto from datawindow within tabp_2
end type
type pb_3 from picturebutton within tabp_2
end type
type dw_tot from datawindow within tabp_2
end type
type dw_cab_gasto from datawindow within tabp_2
end type
type pb_2 from picturebutton within tabp_2
end type
type tab_2 from tab within tabp_2
end type
type tp_2 from userobject within tab_2
end type
type pb_del_tax from picturebutton within tp_2
end type
type pb_new_tax from picturebutton within tp_2
end type
type st_6 from statictext within tp_2
end type
type dw_concep from datawindow within tp_2
end type
type pb_del_concep from picturebutton within tp_2
end type
type pb_new_concep from picturebutton within tp_2
end type
type pb_sig2 from picturebutton within tp_2
end type
type dw_retencion from datawindow within tp_2
end type
type tp_2 from userobject within tab_2
pb_del_tax pb_del_tax
pb_new_tax pb_new_tax
st_6 st_6
dw_concep dw_concep
pb_del_concep pb_del_concep
pb_new_concep pb_new_concep
pb_sig2 pb_sig2
dw_retencion dw_retencion
end type
type tp_3 from userobject within tab_2
end type
type st_2 from statictext within tp_3
end type
type st_1 from statictext within tp_3
end type
type pb_del_fpago from picturebutton within tp_3
end type
type pb_new_fpago from picturebutton within tp_3
end type
type dw_pago from datawindow within tp_3
end type
type dw_montos from datawindow within tp_3
end type
type pb_guardagasto from picturebutton within tp_3
end type
type tp_3 from userobject within tab_2
st_2 st_2
st_1 st_1
pb_del_fpago pb_del_fpago
pb_new_fpago pb_new_fpago
dw_pago dw_pago
dw_montos dw_montos
pb_guardagasto pb_guardagasto
end type
type tab_2 from tab within tabp_2
tp_2 tp_2
tp_3 tp_3
end type
type tabp_2 from userobject within tab_1
pb_4 pb_4
gb_1 gb_1
st_3 st_3
dw_gasto dw_gasto
pb_3 pb_3
dw_tot dw_tot
dw_cab_gasto dw_cab_gasto
pb_2 pb_2
tab_2 tab_2
end type
type tabp_1 from userobject within tab_1
end type
type gb_2 from groupbox within tabp_1
end type
type tab_repo from tab within tabp_1
end type
type tp_pen from userobject within tab_repo
end type
type pb_1 from picturebutton within tp_pen
end type
type st_7 from statictext within tp_pen
end type
type dw_cpo_intfaz from datawindow within tp_pen
end type
type dw_cab_intfaz from datawindow within tp_pen
end type
type tp_pen from userobject within tab_repo
pb_1 pb_1
st_7 st_7
dw_cpo_intfaz dw_cpo_intfaz
dw_cab_intfaz dw_cab_intfaz
end type
type tp_pre from userobject within tab_repo
end type
type dw_det_rep from datawindow within tp_pre
end type
type tp_pre from userobject within tab_repo
dw_det_rep dw_det_rep
end type
type tab_repo from tab within tabp_1
tp_pen tp_pen
tp_pre tp_pre
end type
type dw_cab_repo from datawindow within tabp_1
end type
type pb_5 from picturebutton within tabp_1
end type
type pb_saverepo from picturebutton within tabp_1
end type
type dw_repo from datawindow within tabp_1
end type
type tabp_1 from userobject within tab_1
gb_2 gb_2
tab_repo tab_repo
dw_cab_repo dw_cab_repo
pb_5 pb_5
pb_saverepo pb_saverepo
dw_repo dw_repo
end type
type tp_pres from userobject within tab_1
end type
type st_5 from statictext within tp_pres
end type
type st_4 from statictext within tp_pres
end type
type dw_rubros from datawindow within tp_pres
end type
type dw_dispo from datawindow within tp_pres
end type
type tp_pres from userobject within tab_1
st_5 st_5
st_4 st_4
dw_rubros dw_rubros
dw_dispo dw_dispo
end type
type tab_1 from tab within w_movimiento_caja_menor
tabp_2 tabp_2
tabp_1 tabp_1
tp_pres tp_pres
end type
end forward

global type w_movimiento_caja_menor from w_center
string tag = "Insertó un nuevo Gasto y no ha guardado. Desea guardar ahora?."
integer width = 3895
integer height = 2116
string title = "Movimiento de Caja Menor"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
windowstate windowstate = maximized!
string icon = "ribon_mvtocm.ico"
boolean center = false
dw_cajas dw_cajas
dw_detcaja dw_detcaja
tab_1 tab_1
end type
global w_movimiento_caja_menor w_movimiento_caja_menor

type variables
datawindowchild dw_caja,idw_rubros,idw_iva2,idw_ccosto,idw_concep,idw_cta2
string i_lugar='',i_caja='',i_emp='',i_presu='',i_vent='RP',i_exige_origen
boolean i_cam_ing=false,i_cam_egr=false
long i_ngasto,i_vigencia
int i_dec_gral,i_aprox_gral,i_porce
datetime l_inicia,l_termina
end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();if i_cam_egr then
	if tab_1.tabp_2.tab_2.tp_3.pb_guardagasto.event p_clicked()=-1 then return -1
end if
if i_cam_ing then
	if tab_1.tabp_1.pb_saverepo.event p_clicked()=-1 then return -1
end if
cambio=false
return 1
end function

on w_movimiento_caja_menor.create
int iCurrent
call super::create
this.dw_cajas=create dw_cajas
this.dw_detcaja=create dw_detcaja
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cajas
this.Control[iCurrent+2]=this.dw_detcaja
this.Control[iCurrent+3]=this.tab_1
end on

on w_movimiento_caja_menor.destroy
call super::destroy
destroy(this.dw_cajas)
destroy(this.dw_detcaja)
destroy(this.tab_1)
end on

event open;call super::open;SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=28));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 28')
	return 
end if

SELECT ENTERO into :i_aprox_gral
FROM parametros_gen
WHERE (((codigo_para)=18));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 18')
	return 
end if
if i_aprox_gral=0 then i_aprox_gral=1
end event

type pb_grabar from w_center`pb_grabar within w_movimiento_caja_menor
integer x = 2181
integer y = 300
integer textsize = -8
string facename = "Tahoma"
end type

type dw_cajas from datawindow within w_movimiento_caja_menor
integer x = 27
integer y = 32
integer width = 1609
integer height = 160
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_caja_menor"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild("codcaja",dw_caja)
dw_caja.settransobject(sqlca)
dw_caja.insertrow(1)
insertrow(1)
end event

event itemchanged;string actual
actual=getitemstring(1,getcolumnname())
choose case f_pregunta()
	case 1
		if grabar()=-1 then 
			setitem(1,getcolumnname(),actual)
			return 1
		end if
	case 2
		i_cam_ing=false
		i_cam_egr=false
		cambio=false
	case 3
		setitem(1,getcolumnname(),actual)
		return 1
end choose
accepttext()
if getcolumnname()='clugar' then
	i_lugar=getitemstring(1,"clugar")
	
	select cod_empresa into :i_emp from lugar where codlugar=:i_lugar;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
		close(parent)
		return
	end if
	if isnull(i_emp) then
		messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
		close(parent)
		return
	end if
	idw_concep.retrieve(i_emp,'M','1')
	dw_caja.retrieve(i_lugar)
	setitem(1,"codcaja",'')
	dw_detcaja.reset()
	idw_rubros.reset()
else
	i_caja=getitemstring(1,"codcaja")
	dw_detcaja.retrieve(i_lugar,i_caja)
	tab_1.tabp_1.dw_repo.retrieve(i_lugar,i_caja)
	tab_1.tabp_2.tab_2.tp_3.dw_montos.retrieve(i_caja,i_lugar)
	tab_1.tabp_2.dw_gasto.reset()
	tab_1.tabp_2.dw_gasto.retrieve(i_lugar,i_caja)
end if

end event

type dw_detcaja from datawindow within w_movimiento_caja_menor
integer x = 1559
integer y = 32
integer width = 2066
integer height = 172
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_caja_menor"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

event retrieveend;i_presu='0'
i_emp=''
i_vigencia=0
if rowcount>0 then
	i_presu= this.getitemstring(1,'presupuesto')
	if i_presu='1' then
		i_emp=this.getitemstring(1,'cod_empresa')
		l_inicia=this.getitemdatetime(1,'inicia')
		l_termina=this.getitemdatetime(1,'termina')
		select cod_vigencia into :i_vigencia from pre_vigencia where estado='0';
		if idw_rubros.retrieve(i_caja,i_lugar,i_vigencia)=0 then 
			idw_rubros.insertrow(0)
		end if
		//tab_1.tp_pres.dw_dispo.retrieve(i_caja,i_lugar)
		tab_1.tp_pres.dw_rubros.retrieve(i_caja,i_lugar,i_vigencia)
	end if
end if
end event

type tab_1 from tab within w_movimiento_caja_menor
event create ( )
event destroy ( )
integer x = 5
integer y = 172
integer width = 3808
integer height = 1856
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabp_2 tabp_2
tabp_1 tabp_1
tp_pres tp_pres
end type

on tab_1.create
this.tabp_2=create tabp_2
this.tabp_1=create tabp_1
this.tp_pres=create tp_pres
this.Control[]={this.tabp_2,&
this.tabp_1,&
this.tp_pres}
end on

on tab_1.destroy
destroy(this.tabp_2)
destroy(this.tabp_1)
destroy(this.tp_pres)
end on

type tabp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3771
integer height = 1728
long backcolor = 67108864
string text = "Gastos"
long tabtextcolor = 33554432
string picturename = "notas_adm.ico"
long picturemaskcolor = 536870912
string powertiptext = "Salidas de Efectivo"
pb_4 pb_4
gb_1 gb_1
st_3 st_3
dw_gasto dw_gasto
pb_3 pb_3
dw_tot dw_tot
dw_cab_gasto dw_cab_gasto
pb_2 pb_2
tab_2 tab_2
end type

on tabp_2.create
this.pb_4=create pb_4
this.gb_1=create gb_1
this.st_3=create st_3
this.dw_gasto=create dw_gasto
this.pb_3=create pb_3
this.dw_tot=create dw_tot
this.dw_cab_gasto=create dw_cab_gasto
this.pb_2=create pb_2
this.tab_2=create tab_2
this.Control[]={this.pb_4,&
this.gb_1,&
this.st_3,&
this.dw_gasto,&
this.pb_3,&
this.dw_tot,&
this.dw_cab_gasto,&
this.pb_2,&
this.tab_2}
end on

on tabp_2.destroy
destroy(this.pb_4)
destroy(this.gb_1)
destroy(this.st_3)
destroy(this.dw_gasto)
destroy(this.pb_3)
destroy(this.dw_tot)
destroy(this.dw_cab_gasto)
destroy(this.pb_2)
destroy(this.tab_2)
end on

type pb_4 from pb_report within tabp_2
integer x = 1568
integer y = 272
integer taborder = 70
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string cod_rep = "CM"
string nombre_rep = "Reporte Gastos Caja menor"
string tipo_rep = "interno!"
boolean v_preliminar = true
end type

event clicked;call super::clicked;if dw_gasto.rowcount()<1 then return
any par[4]
par[1]=dw_gasto.getitemstring (dw_gasto.getrow(),"codcaja")
par[2]=dw_gasto.getitemstring(dw_gasto.getrow(),"clugar")
par[3]=dw_gasto.getitemstring(dw_gasto.getrow(),"coddoc")
par[4]=dw_gasto.getitemnumber(dw_gasto.getrow(),"ngasto")
imprimir(par,'','0')

end event

type gb_1 from groupbox within tabp_2
integer x = 1751
integer y = 424
integer width = 1998
integer height = 324
integer taborder = 13
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Impuestos:"
end type

type st_3 from statictext within tabp_2
integer x = 23
integer width = 416
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Gastos"
boolean focusrectangle = false
end type

type dw_gasto from datawindow within tabp_2
integer x = 23
integer y = 52
integer width = 1513
integer height = 688
integer taborder = 1
string title = "none"
string dataobject = "dw_cmenor_gasto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanging;if i_cam_egr then return 1
end event

event rowfocuschanged;dw_cab_gasto.reset()
dw_tot.reset()
tab_2.tp_2.dw_concep.reset()
tab_2.tp_2.dw_retencion.reset()
tab_2.tp_3.dw_pago.reset()
long fila
fila=getrow()
if fila<1 then return
i_ngasto=getitemnumber(fila,'ngasto')
dw_cab_gasto.retrieve(i_caja,i_lugar,'GME',i_ngasto)
tab_2.tp_2.dw_retencion.retrieve(i_caja,i_lugar,'GME',i_ngasto)
tab_2.tp_2.dw_concep.retrieve(i_caja,i_lugar,'GME',i_ngasto)
dw_tot.retrieve(i_caja,i_lugar,'GME',i_ngasto)
tab_2.tp_3.dw_pago.retrieve(i_caja,i_lugar,i_ngasto)
end event

type pb_3 from picturebutton within tabp_2
integer x = 1568
integer y = 140
integer width = 146
integer height = 128
integer taborder = 3
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Anular Gasto"
end type

event clicked;if dw_gasto.rowcount()=0 then return
if i_cam_egr then return
st_xa_anular st_anula
st_anula.tipo='CM'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
string banco,tcuenta,ncuenta,meserr
dec valor
long nmov,j,donde
datetime hoy
banco=dw_cab_gasto.getitemstring(1,'codbanco')
if not isnull(banco) then
	hoy=datetime(today())
	tcuenta=dw_cab_gasto.getitemstring(1,'tipo_cuenta')
	ncuenta=dw_cab_gasto.getitemstring(1,'numcuenta')
	nmov=dw_cab_gasto.getitemnumber(1,'item')
	select sum(valor) into :valor from tesocuentasmovidet
	where codbanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and item=:nmov;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo valor del movimiento",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update tesocuentasmovi set usuario_anula=:usuario, fecha_anula=:hoy ,motivo_anula=:st_anula.observacion,cod_anula=:st_anula.motivo
	where codbanco=:banco and tipo_cuenta=:tcuenta and numcuenta=:ncuenta and item=:nmov;
	if sqlca.sqlcode=-1 then
		meserr=sqlca.sqlerrtext
		rollback;
		messagebox("Error actualizando TesocuentasMovi",meserr)
		return
	end if
end if
dw_gasto.setitem(dw_gasto.getrow(),'estado',usuario)
dw_gasto.setitem(dw_gasto.getrow(),'fecha_anula',datetime(today()))
dw_gasto.setitem(dw_gasto.getrow(),'motiv_anula',st_anula.observacion)
dw_gasto.setitem(dw_gasto.getrow(),'cod_anula',st_anula.motivo)
valor=dw_cab_gasto.getitemnumber(1,'neto_pagar')
if dw_gasto.update()=-1 then
	rollback;
	return
end if
if i_presu='1' then
	long vig
	string rubro,caja
	dec val
	for j=1 to tab_1.tabp_2.tab_2.tp_2.dw_concep.rowcount()
		vig=tab_1.tabp_2.tab_2.tp_2.dw_concep.getitemnumber(j,'cod_vigencia')
		rubro=tab_1.tabp_2.tab_2.tp_2.dw_concep.getitemstring(j,'codtotal_presu')
		val=tab_1.tabp_2.tab_2.tp_2.dw_concep.getitemnumber(j,'tbruto')
		update tesocajamedispo_cp set consumido=consumido - :val where
		codcaja =:i_caja and clugar =:i_lugar and cod_vigencia =:vig and codtotal_presu=:rubro;
		if sqlca.sqlcode=-1 then
			meserr=sqlca.sqlerrtext
			rollback;
			messagebox("Error actualizando tesocajamedispo_cp",meserr)
			return
		end if
	next
	
end if
if tab_1.tabp_2.tab_2.tp_3.dw_pago.getitemnumber(1,'efectivo')>0 then
	dw_detcaja.setitem(1,'efectivo',dw_detcaja.getitemnumber(1,'efectivo') + tab_1.tabp_2.tab_2.tp_3.dw_pago.getitemnumber(1,'efectivo'))
	if dw_detcaja.update()=-1 then
		rollback;
		return
	end if
end if
commit;
idw_rubros.retrieve(i_caja,i_lugar,i_vigencia)
tab_1.tp_pres.dw_rubros.retrieve(i_caja,i_lugar,i_vigencia)
dw_detcaja.retrieve(i_lugar,i_caja)
end event

type dw_tot from datawindow within tabp_2
integer x = 1783
integer y = 472
integer width = 1865
integer height = 264
integer taborder = 14
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tgasto_timpu"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type dw_cab_gasto from datawindow within tabp_2
event p_itemchanged ( )
integer x = 1742
integer width = 2002
integer height = 432
integer taborder = 4
boolean bringtotop = true
string title = "none"
string dataobject = "dw_gasto_menor_cab"
boolean border = false
boolean livescroll = true
end type

event p_itemchanged();accepttext()
boolean prim
if isnull(getitemnumber(1,'t_bruto')) then prim=true
setitem(1,'neto_pagar',getitemdecimal(1,'val_bruto'))
setitem(1,'t_bruto',getitemdecimal(1,'neto_pagar'))
long j
for j=1 to tab_2.tp_2.dw_retencion.rowcount()
	tab_2.tp_2.dw_retencion.event itemchanged(j,tab_2.tp_2.dw_retencion.object.cod_concep,tab_2.tp_2.dw_retencion.getitemstring(j,'cod_concep'))
next
if not prim then tab_2.tp_2.pb_sig2.triggerevent(clicked!)
end event

event constructor;settransobject(sqlca)
getchild('codcc',idw_ccosto)
idw_ccosto.settransobject(sqlca)
end event

event doubleclicked;string columna
columna=getcolumnname() 
if columna="tipodoc" or columna="documento" then
	g_tercerodesde=13
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		triggerevent(itemchanged!)
	end if
end if
end event

event itemchanged;string nulo
long donde
donde=getrow()
setnull(nulo)
choose case getcolumnname()
	case "tipodoc"
		setitem(donde,"documento",nulo)
		accepttext()
	case "documento"
		string tdoc,doc,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(donde,"tipodoc")
		if isnull(tdoc) then
			setitem(donde,"documento",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=gettext()
		setnull(persona)
		SELECT TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :persona,:nom1,:nom2,:ape1,:ape2,:rsoc
		FROM TERCEROS
		WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
		if isnull(persona) then
			if messagebox("Atención","Este Tercero no se encuentra, desea crearlo?",question!,yesno!,2)=2 then
				settext(getitemstring(getrow(),getcolumn()))
				return 1
			else
				st_general messObj
				messObj.valor = getitemstring(getrow(),'tipodoc')
				messObj.documento = doc
				messObj.dw_obj = this
				openwithparm(w_cfgterceros, messObj)
				if message.stringparm='' then 
					settext(getitemstring(getrow(),getcolumn()))
					return 1
				end if
			end if
		else
			setitem(donde,"terceros_nombre1",nom1)
			setitem(donde,"terceros_nombre2",nom2)
			setitem(donde,"terceros_apellido1",ape1)
			setitem(donde,"terceros_apellido2",ape2)
			setitem(donde,"terceros_razon_social",rsoc)
			setitem(donde,"terceros_persona",persona)
		end if
	case 'val_bruto'
		post event p_itemchanged()
	case 'coduf'
		setitem(1,'codcc',nulo)
		idw_ccosto.retrieve(data)
	case 'fecha'
		if not(datetime(data) >=l_inicia  and datetime(data)<=l_termina) and  i_presu='1' then
			messagebox("Atención","Fecha fuera del Perido "+string(l_inicia,'dd-mm-yyyy')+'  al '+String(l_termina,'dd-mm-yyyy'))
			setitem(donde,"fecha",now())
			accepttext()
			return 1
		end if	
end choose

end event

event rowfocuschanged;if getrow()<1 then 
	idw_ccosto.reset()
else
	idw_ccosto.retrieve(getitemstring(getrow(),'coduf'))
end if
end event

type pb_2 from picturebutton within tabp_2
integer x = 1568
integer y = 12
integer width = 146
integer height = 128
integer taborder = 2
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
string powertiptext = "Nuevo Gasto"
end type

event clicked;if dw_detcaja.rowcount()=0 or i_cam_egr then return
dw_cab_gasto.reset()
dw_tot.reset()
tab_2.tp_2.dw_concep.reset()
tab_2.tp_2.dw_retencion.reset()
tab_2.tp_3.dw_pago.reset()

dw_cab_gasto.insertrow(1)
dw_cab_gasto.setitem(1,'fecha',datetime(today(),time(now())))
dw_cab_gasto.setitem(1,'fecha_reg',datetime(today(),time(now())))
dw_cab_gasto.setitem(1,'usuario',usuario)
dw_cab_gasto.setitem(1,'codcaja',i_caja)
dw_cab_gasto.setitem(1,'clugar',i_lugar)
dw_cab_gasto.setitem(1,'coddoc','GME')
dw_cab_gasto.setfocus()
tab_2.selectedtab=1
tab_2.tp_2.pb_sig2.visible=true
tab_2.tp_3.enabled=false
i_cam_egr=true
cambio=true
tab_2.tp_2.pb_new_concep.event clicked()

end event

type tab_2 from tab within tabp_2
event create ( )
event destroy ( )
integer x = 32
integer y = 752
integer width = 3707
integer height = 976
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tp_2 tp_2
tp_3 tp_3
end type

on tab_2.create
this.tp_2=create tp_2
this.tp_3=create tp_3
this.Control[]={this.tp_2,&
this.tp_3}
end on

on tab_2.destroy
destroy(this.tp_2)
destroy(this.tp_3)
end on

type tp_2 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 3671
integer height = 848
long backcolor = 67108864
string text = "Conceptos / Impuestos"
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
string powertiptext = "Conceptos de pago y sus respectivos impuestos"
pb_del_tax pb_del_tax
pb_new_tax pb_new_tax
st_6 st_6
dw_concep dw_concep
pb_del_concep pb_del_concep
pb_new_concep pb_new_concep
pb_sig2 pb_sig2
dw_retencion dw_retencion
end type

on tp_2.create
this.pb_del_tax=create pb_del_tax
this.pb_new_tax=create pb_new_tax
this.st_6=create st_6
this.dw_concep=create dw_concep
this.pb_del_concep=create pb_del_concep
this.pb_new_concep=create pb_new_concep
this.pb_sig2=create pb_sig2
this.dw_retencion=create dw_retencion
this.Control[]={this.pb_del_tax,&
this.pb_new_tax,&
this.st_6,&
this.dw_concep,&
this.pb_del_concep,&
this.pb_new_concep,&
this.pb_sig2,&
this.dw_retencion}
end on

on tp_2.destroy
destroy(this.pb_del_tax)
destroy(this.pb_new_tax)
destroy(this.st_6)
destroy(this.dw_concep)
destroy(this.pb_del_concep)
destroy(this.pb_new_concep)
destroy(this.pb_sig2)
destroy(this.dw_retencion)
end on

type pb_del_tax from picturebutton within tp_2
integer x = 3488
integer y = 540
integer width = 146
integer height = 128
integer taborder = 13
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Impuesto"
end type

event clicked;if not i_cam_egr or dw_retencion.rowcount()=0 then return
dw_retencion.deleterow(0)
dw_retencion.event p_itemchanged('C')
end event

type pb_new_tax from picturebutton within tp_2
integer x = 3488
integer y = 412
integer width = 146
integer height = 128
integer taborder = 12
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Impuesto"
end type

event clicked;if not i_cam_egr or dw_concep.rowcount()=0 then return
long donde,j
donde=dw_retencion.insertrow(0)
dw_retencion.setitem(donde,'codcaja',i_caja)
dw_retencion.setitem(donde,'clugar',i_lugar)
dw_retencion.setitem(donde,'coddoc','GME')
dw_retencion.setitem(donde,'item',dw_concep.getitemnumber(dw_concep.getrow(),'item'))
for j=1 to dw_retencion.rowcount()
	if dw_retencion.find('subitem='+string(j),1,dw_retencion.rowcount())=0 then exit
next
dw_retencion.setitem(donde,'subitem',j)
dw_retencion.scrolltorow(donde)
return donde
end event

type st_6 from statictext within tp_2
integer x = 9
integer y = 336
integer width = 558
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impuestos del Concepto:"
boolean focusrectangle = false
end type

type dw_concep from datawindow within tp_2
event p_itemchanged ( )
integer x = 5
integer width = 3447
integer height = 336
integer taborder = 30
string title = "none"
string dataobject = "dw_concep_cmen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
datawindow dw_t
dw_t=tab_1.tabp_2.dw_cab_gasto
if rowcount()>0 then
	dw_t.setitem(1,'neto_pagar',getitemnumber(1,'t_neto'))
	dw_t.setitem(1,'t_bruto',getitemnumber(1,'t_bruto'))
	dw_t.setitem(1,'val_bruto',getitemnumber(1,'t_vsiniva'))
	//dw_t.setitem(1,'tdescuentos',getitemnumber(1,'t_descuentos'))
else
	dw_t.setitem(1,'neto_pagar',0)
	dw_t.setitem(1,'t_bruto',0)
	dw_t.setitem(1,'val_bruto',0)
	//dw_t.setitem(1,'tdescuentos',0)
end if
end event

event constructor;getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)

getchild('codtotal_presu',idw_rubros)
idw_rubros.settransobject(sqlca)
settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then
	dw_retencion.setfilter('isnull(item)')
	else
	if isnull(getitemnumber(getrow(),'item')) then
		dw_retencion.setfilter('isnull(item)')
	else
		dw_retencion.setfilter('item='+string(getitemnumber(getrow(),'item')))
	end if
	
end if
dw_retencion.filter()

end event

event itemchanged;string nulo
setnull(nulo)
long donde
choose case dwo.name
	case 'val_bruto','tdescuentos'
		dec anterior
		anterior=round(getitemnumber(getrow(),'tbruto'),i_dec_gral)
		if i_dec_gral=0 then
			anterior=long(anterior/i_aprox_gral)*i_aprox_gral  + i_aprox_gral*round((anterior -long(anterior/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
		end if
		if dw_retencion.rowcount()>0 then
			long j
			for j=1 to dw_retencion.rowcount()
				dw_retencion.event itemchanged(j,dw_retencion.object.cod_concep,dw_retencion.getitemstring(j,'cod_concep'))
			next
		else
			dw_retencion.event p_itemchanged('C')
		end if
		if not isnull(getitemstring(getrow(),'codtotal_presu')) then
			donde=idw_rubros.find('codtotal_presu="'+getitemstring(getrow(),'codtotal_presu')+'" and cod_vigencia='+string(getitemnumber(getrow(),'cod_vigencia')),1,idw_rubros.rowcount())
			idw_rubros.setitem(donde,'consumido',idw_rubros.getitemnumber(donde,'consumido') - anterior)
		end if
		setitem(getrow(),'codtotal_presu',nulo)
		tab_1.tabp_2.tab_2.tp_3.enabled=false
		return 2
	case 'codtotal_presu'
		string actual
		long ante
		actual=getitemstring(row,'codtotal_presu')
		dec valor
		donde=idw_rubros.find('codtotal_presu="'+data+'"',1,idw_rubros.rowcount())
		valor=getitemnumber(getrow(),'tbruto')
		if actual<>'' and not isnull(actual) then
			ante=idw_rubros.find('codtotal_presu="'+actual+'"',1,idw_rubros.rowcount())
			idw_rubros.setitem(ante,'consumido',idw_rubros.getitemnumber(ante,'consumido') - valor)
		end if
		if donde=0 or isnull(donde) then return
		if idw_rubros.getitemnumber(donde,'disponible')<valor then 
			setitem(getrow(),'codtotal_presu',nulo)
			settext(nulo)
			return 1
		end if
		idw_rubros.setitem(donde,'consumido',idw_rubros.getitemnumber(donde,'consumido') + valor)
		setitem(getrow(),'cod_vigencia',idw_rubros.getitemnumber(donde,'cod_vigencia'))
		if (idw_rubros.getitemnumber(donde,'consumido')/idw_rubros.getitemnumber(donde,'monto')*100)>dw_detcaja.getitemnumber(1,'porce_gasto') then
			messagebox("Atención","Ya ha superado el porcentaje de consumo realice reposición")
		end if

end choose
end event

type pb_del_concep from picturebutton within tp_2
integer x = 3488
integer y = 140
integer width = 146
integer height = 128
integer taborder = 3
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar concepto"
end type

event clicked;if not i_cam_egr or dw_concep.rowcount()=0 then return
do while dw_retencion.rowcount()>0
	pb_del_tax.event clicked()
loop
string nulo
setnull(nulo)
dw_concep.event itemchanged(dw_concep.getrow(),dw_concep.object.codtotal_presu,nulo)
dw_concep.deleterow(0)
dw_concep.triggerevent(rowfocuschanged!)
dw_concep.event p_itemchanged()

end event

type pb_new_concep from picturebutton within tp_2
integer x = 3488
integer y = 12
integer width = 146
integer height = 128
integer taborder = 2
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Concepto"
end type

event clicked;if not i_cam_egr then return
long donde,j
donde=dw_concep.insertrow(0)
dw_concep.setitem(donde,'codcaja',i_caja)
dw_concep.setitem(donde,'clugar',i_lugar)
dw_concep.setitem(donde,'coddoc','GME')
for j=1 to dw_concep.rowcount()
	if dw_concep.find('item='+string(j),1,dw_concep.rowcount())=0 then exit
next
dw_concep.setitem(donde,'item',j)
dw_concep.scrolltorow(donde)
tab_1.tabp_2.tab_2.tp_3.enabled=false
return donde
end event

type pb_sig2 from picturebutton within tp_2
boolean visible = false
integer x = 3488
integer y = 672
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "ultimo.gif"
alignment htextalign = left!
string powertiptext = "Siguiente (Ir a Comprobante Contable)"
end type

event clicked;long j,donde
if dw_detcaja.getitemstring(1,'presupuesto')='1' then
	if dw_concep.find('isnull(codtotal_presu)',1,dw_concep.rowcount())>0 then
		messagebox("Atención","Debe digitar todos los rubros presupuestales")
		dw_retencion.setcolumn('base')
		dw_retencion.scrolltorow(j)
		return
	end if
end if
dw_retencion.setredraw(false)
dw_retencion.setfilter('')
dw_retencion.filter()
boolean salir
if dw_retencion.find('isnull(cod_concep)',1,dw_retencion.rowcount())>0 then
	salir=true
	messagebox("Atención","Debe digitar todos los impuestos")
end if
for j=1 to dw_retencion.rowcount()
	if not isnull(dw_retencion.getitemstring(j,'cod_total')) then continue
	if idw_cta2.retrieve(dw_retencion.getitemstring(j,'cod_empre'),dw_retencion.getitemstring(j,'cod_concep'))>0 then
		messagebox('Atención','Debe digitar las cuentas contables de los impuestos que poseen configuración')
		salir=true
	end if
next
dw_concep.triggerevent(rowfocuschanged!)
dw_retencion.setredraw(true)
if salir then return
tab_1.tabp_2.tab_2.selectedtab=2
tab_1.tabp_2.tab_2.tp_3.enabled=true
tab_1.tabp_2.tab_2.tp_3.pb_guardagasto.visible=true
datawindow dw_t
dec neto
dw_t=tab_1.tabp_2.tab_2.tp_3.dw_montos
neto=tab_1.tabp_2.dw_cab_gasto.getitemnumber(1,'neto_pagar')
tab_1.tabp_2.tab_2.tp_3.dw_pago.reset()
tab_1.tabp_2.tab_2.tp_3.dw_pago.insertrow(1)
if dw_t.getitemnumber(1,'efectivo')>neto then
	tab_1.tabp_2.tab_2.tp_3.dw_pago.setitem(1,'valor',neto)
elseif dw_t.getitemnumber(1,'efectivo')>0 then
	tab_1.tabp_2.tab_2.tp_3.dw_pago.setitem(1,'valor',dw_t.getitemnumber(1,'efectivo'))
	tab_1.tabp_2.tab_2.tp_3.dw_pago.insertrow(2)
	tab_1.tabp_2.tab_2.tp_3.dw_pago.setitem(2,'valor',neto -dw_t.getitemnumber(1,'efectivo'))
	tab_1.tabp_2.tab_2.tp_3.dw_pago.setitem(2,'forma','C')
else
	tab_1.tabp_2.tab_2.tp_3.dw_pago.setitem(1,'valor',neto)
	tab_1.tabp_2.tab_2.tp_3.dw_pago.setitem(1,'forma','C')
end if

end event

type dw_retencion from datawindow within tp_2
event p_itemchanged ( string p_cual )
integer y = 392
integer width = 3447
integer height = 432
integer taborder = 1
string dataobject = "dw_tesocajaretencion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(string p_cual);accepttext()
long j,donde,donde2,k,item
dec base_desde,porcentaje,iva,v_siniva
string sobre
datawindow dw_tot,dw_1
dw_tot=tab_1.tabp_2.dw_tot
dw_tot.setredraw(false)
for j=1 to dw_tot.rowcount()
	dw_tot.setitem(j,'valor',0)
next
dw_concep.accepttext()
setredraw(false)
dw_1=dw_concep
for j=1 to rowcount()
	if getitemstring(j,'accion')='1' then //incrementa
			if p_cual='B' then //base
			iva+=getitemnumber(j,'tvalor')
		else
			donde=idw_iva2.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_iva2.rowcount())
			porcentaje+=idw_iva2.getitemnumber(donde,'porcentaje')
		end if
	end if
next
for j=1 to rowcount()
	if p_cual='B' and j=getrow() then continue
	donde=idw_iva2.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_iva2.rowcount())
	base_desde=idw_iva2.getitemnumber(donde,'base')
	porcentaje=idw_iva2.getitemnumber(donde,'porcentaje')
	if sobre<>'I' then
		if base_desde<=getitemdecimal(j,'base') then
			setitem(j,'tvalor',getitemdecimal(j,'base') *  porcentaje/100)
		else
			setitem(j,'tvalor',0)
		end if
	end if
	if getitemstring(j,'sobre')='O' then
		setitem(1,'asumar',idw_iva2.getitemstring(donde,'cod_sobre'))
		setitem(j,'base',getitemnumber(1,'suma'))
		if base_desde<=getitemnumber(1,'suma') then
			setitem(j,'tvalor',round(getitemnumber(1,'suma') *  porcentaje/100,i_dec_gral))
		else
			setitem(j,'tvalor',0)
		end if
	end if
next
setfilter('')
filter()
for j=1 to rowcount()
	donde2=dw_tot.find("cod_tipo='"+getitemstring(j,'cod_concep')+"'",1,dw_tot.rowcount())
	if donde2=0 then 
		donde2=dw_tot.insertrow(0)
		dw_tot.setitem(donde2,'clugar',dw_concep.getitemstring(dw_concep.getrow(),'clugar'))//mejor asi por si es uno viejo de otro lugar
		dw_tot.setitem(donde2,'coddoc',dw_concep.getitemstring(dw_concep.getrow(),'coddoc'))
		for k=1 to dw_tot.rowcount()
			item=dw_tot.find('item='+string(k),1,dw_tot.rowcount())
			if item=0 then exit
		next
		dw_tot.setitem(donde2,'item',k)
	end if
	dw_tot.setitem(donde2,'valor',dw_tot.getitemdecimal(donde2,'valor')+getitemdecimal(j,'tvalor'))
	dw_tot.setitem(donde2,'cod_tipo',getitemstring(j,'cod_concep'))
next
dw_tot.setredraw(true)
dw_concep.triggerevent(rowfocuschanged!)
setredraw(true)
dec anterior
anterior=dw_concep.getitemnumber(dw_concep.getrow(),'tbruto')
if rowcount()>0 then
	dw_concep.setitem(dw_concep.getrow(),'tneto',dw_concep.getitemnumber(dw_concep.getrow(),'val_bruto')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta')-dw_concep.getitemdecimal(dw_concep.getrow(),'tdescuentos'))//-dw_concep.getitemdecimal(1,'anticipo'))
	dw_concep.setitem(dw_concep.getrow(),'tbruto',dw_concep.getitemnumber(dw_concep.getrow(),'val_bruto')+getitemnumber(1,'t_incrementa'))//-dw_concep.getitemdecimal(1,'tdescuentos')-dw_concep.getitemdecimal(1,'anticipo'))
else
	dw_concep.setitem(dw_concep.getrow(),'tneto',dw_concep.getitemnumber(dw_concep.getrow(),'val_bruto')-dw_concep.getitemdecimal(dw_concep.getrow(),'tdescuentos'))//-dw_concep.getitemdecimal(1,'anticipo'))
	dw_concep.setitem(dw_concep.getrow(),'tbruto',dw_concep.getitemnumber(dw_concep.getrow(),'val_bruto'))//-dw_concep.getitemdecimal(1,'tdescuentos')-dw_concep.getitemdecimal(1,'anticipo'))
end if
dw_concep.event p_itemchanged()
string nulo
setnull(nulo)
if not isnull(dw_concep.getitemstring(dw_concep.getrow(),'codtotal_presu')) then
	donde=idw_rubros.find('codtotal_presu="'+dw_concep.getitemstring(dw_concep.getrow(),'codtotal_presu')+'" and cod_vigencia='+string(dw_concep.getitemnumber(dw_concep.getrow(),'cod_vigencia')),1,idw_rubros.rowcount())
	idw_rubros.setitem(donde,'consumido',idw_rubros.getitemnumber(donde,'consumido') - anterior)
end if
dw_concep.setitem(dw_concep.getrow(),'codtotal_presu',nulo)
tab_1.tabp_2.tab_2.tp_3.enabled=false
end event

event constructor;getchild('cod_concep',idw_iva2)
idw_iva2.settransobject(sqlca)
idw_iva2.retrieve()

getchild('cod_total',idw_cta2)
idw_cta2.settransobject(sqlca)
settransobject(sqlca)
end event

event itemchanged;long donde
string acc_ante,sobre
dec base_desde,porcentaje,actual
dw_concep.accepttext()
choose case dwo.name
	case 'base'
		if not isnull(getitemstring(row,'cod_concep')) then
			donde=idw_iva2.find('cod_concep="'+getitemstring(row,'cod_concep')+'"',1,idw_iva2.rowcount())
			base_desde=idw_iva2.getitemnumber(donde,'base')
			porcentaje=idw_iva2.getitemnumber(donde,'porcentaje')
			sobre=idw_iva2.getitemstring(donde,'sobre')
			if sobre<>'I' then
				if base_desde<=dec(data) then
					setitem(row,'tvalor',dec(data) *  porcentaje/100)
				else
					setitem(row,'tvalor',0)
				end if
			end if
			event p_itemchanged('B')
		end if
	case 'cod_concep'
		if idw_cta2.retrieve(i_emp,data)=1 then
			setitem(row,'cod_total',idw_cta2.getitemstring(1,'codtotal'))
			setitem(row,'cod_empre',i_emp)
		end if
		donde=idw_iva2.find('cod_concep="'+data+'"',1,idw_iva2.rowcount())
		setitem(row,'cod_tipo',idw_iva2.getitemstring(donde,'cod_tipo'))
		setitem(row,'accion',idw_iva2.getitemstring(donde,'accion'))
		setitem(row,'cod_concep',idw_iva2.getitemstring(donde,'cod_concep'))//hay que dejarlo
		sobre=idw_iva2.getitemstring(donde,'sobre')
		setitem(row,'sobre',sobre)
		choose case sobre
			case 'R' //bruto
				setitem(row,'base',dw_concep.getitemnumber(dw_concep.getrow(),'tbruto'))
			case 'I' //ninguno
				setitem(row,'base',0)
				setitem(row,'tvalor',idw_iva2.getitemdecimal(donde,'porcentaje'))
			case 'O' //otro (sobre la suma de otros tipos de imp)
				setitem(1,'asumar',idw_iva2.getitemstring(donde,'cod_sobre'))
				setitem(row,'base',getitemnumber(1,'suma'))				
			case 'B' //base
				setitem(row,'base',dw_concep.getitemnumber(dw_concep.getrow(),'val_bruto'))//-dw_concep.getitemnumber(dw_concep.getrow(),'tdescuentos'))					
			case 'N' //neto
				setitem(row,'base',dw_concep.getitemnumber(dw_concep.getrow(),'tneto'))
		end choose
		event itemchanged(row,object.base,string(getitemnumber(row,'base')))
	case 'cod_total'
		setitem(row,'cod_empre',i_emp)
end choose

end event

event rowfocuschanged;if getrow()<1 then return
if not isnull(getitemstring(getrow(),'cod_empre')) then
	idw_cta2.retrieve(getitemstring(getrow(),'cod_empre'),getitemstring(getrow(),'cod_concep'))
else
	idw_cta2.retrieve(i_emp,getitemstring(getrow(),'cod_concep'))
end if
end event

type tp_3 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 3671
integer height = 848
long backcolor = 67108864
string text = "Forma de Pago"
long tabtextcolor = 33554432
string picturename = "factura.ico"
long picturemaskcolor = 536870912
st_2 st_2
st_1 st_1
pb_del_fpago pb_del_fpago
pb_new_fpago pb_new_fpago
dw_pago dw_pago
dw_montos dw_montos
pb_guardagasto pb_guardagasto
end type

on tp_3.create
this.st_2=create st_2
this.st_1=create st_1
this.pb_del_fpago=create pb_del_fpago
this.pb_new_fpago=create pb_new_fpago
this.dw_pago=create dw_pago
this.dw_montos=create dw_montos
this.pb_guardagasto=create pb_guardagasto
this.Control[]={this.st_2,&
this.st_1,&
this.pb_del_fpago,&
this.pb_new_fpago,&
this.dw_pago,&
this.dw_montos,&
this.pb_guardagasto}
end on

on tp_3.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_del_fpago)
destroy(this.pb_new_fpago)
destroy(this.dw_pago)
destroy(this.dw_montos)
destroy(this.pb_guardagasto)
end on

type st_2 from statictext within tp_3
integer x = 73
integer y = 212
integer width = 571
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Forma de Pago del gasto:"
boolean focusrectangle = false
end type

type st_1 from statictext within tp_3
integer x = 78
integer width = 827
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado actual de la Caja:"
boolean focusrectangle = false
end type

type pb_del_fpago from picturebutton within tp_3
integer x = 1975
integer y = 408
integer width = 146
integer height = 128
integer taborder = 4
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Item de Forma de Pago"
end type

event clicked;if not i_cam_egr then return
if dw_pago.rowcount()=1 then return
dw_pago.deleterow(0)
end event

type pb_new_fpago from picturebutton within tp_3
integer x = 1975
integer y = 268
integer width = 146
integer height = 128
integer taborder = 3
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Nuevo Item de Forma de Pago"
end type

event clicked;if not i_cam_egr then return
if dw_pago.rowcount()=2 or isnull(dw_montos.getitemnumber(1,'saldo')) then return
dw_pago.insertrow(2)
dw_pago.setitem(2,'subitem',2)
dw_pago.setitem(2,'forma','C')
end event

type dw_pago from datawindow within tp_3
integer x = 69
integer y = 268
integer width = 1673
integer height = 360
integer taborder = 2
string title = "none"
string dataobject = "dw_movi_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event itemchanged;choose case this.getcolumnname()
	case 'forma'
		if data='C' and isnull(dw_montos.getitemnumber(1,'saldo')) then return 1
	case 'valor'
		choose case this.getitemstring(this.getrow(),'forma')
			case 'E'
				if real(data)>dw_montos.getitemnumber(1,'efectivo') then return 1
				if real(data)>tab_1.tabp_2.dw_cab_gasto.getitemnumber(1,'neto_pagar') then return 1
			case 'C'
				if real(data)>dw_montos.getitemnumber(1,'saldo') then return 1
				if real(data)>tab_1.tabp_2.dw_cab_gasto.getitemnumber(1,'neto_pagar') then return 1
		end choose
end choose
end event

event retrieveend;if rowcount=0 then
	this.insertrow(1)
	this.setitem(1,'forma','E')
	this.setitem(1,'valor',tab_1.tabp_2.dw_cab_gasto.getitemnumber(1,'neto_pagar'))
else
	if this.getitemnumber(1,'total')<tab_1.tabp_2.dw_cab_gasto.getitemnumber(1,'neto_pagar') then
		this.insertrow(2)
		this.setitem(2,'forma','E')
		this.setitem(2,'valor',tab_1.tabp_2.dw_cab_gasto.getitemnumber(1,'neto_pagar')-this.getitemnumber(1,'total'))
	end if
end if
end event

type dw_montos from datawindow within tp_3
integer x = 73
integer y = 52
integer width = 3456
integer height = 156
integer taborder = 1
string title = "none"
string dataobject = "dw_monto_caja_menor"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

type pb_guardagasto from picturebutton within tp_3
event type integer p_clicked ( )
boolean visible = false
integer x = 1975
integer y = 552
integer width = 146
integer height = 128
integer taborder = 6
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Gasto de Caja Menor"
end type

event type integer p_clicked();if not i_cam_egr then return 1
if isnull(tab_1.tabp_2.dw_cab_gasto.getitemstring(1,'coduf' )) or tab_1.tabp_2.dw_cab_gasto.getitemstring(1,'coduf' )='' then
	messagebox("Atención","Falta Unidad Funcional")
	return -1
end if	

if isnull(tab_1.tabp_2.dw_cab_gasto.getitemstring(1,'codcc' )) or tab_1.tabp_2.dw_cab_gasto.getitemstring(1,'codcc' )='' then
	messagebox("Atención","Falta Centro Costo")
	return -1
end if		

if dw_pago.getitemnumber(1,'total')<>tab_1.tabp_2.dw_cab_gasto.getitemnumber(1,'neto_pagar') then
	messagebox("Atención","El total del detalle de la forma de pago es diferente al Neto a Pagar")
	return -1
end if
long ngasto,j
j=dw_pago.find('forma="E"',1,dw_pago.rowcount())
if j<>0 then 
	if dw_detcaja.getitemnumber(1,'efectivo')<dw_pago.getitemnumber(j,'valor') then
		messagebox("Atención","El efectivo disponible no alcanza para la forma de pago")
		return -1
	end if
end if
j=dw_pago.find('forma="C"',1,dw_pago.rowcount())
if j<>0 then 
	if dw_detcaja.getitemnumber(1,'saldo')<dw_pago.getitemnumber(j,'valor') then
		messagebox("Atención","El Monto disponible del Banco no alcanza para la forma de pago")
		return -1
	end if
end if
select max(ngasto) into :ngasto from tesocajagasto where codcaja=:i_caja and clugar=:i_lugar;
if sqlca.sqlcode=-1 then 
	messagebox('Error leyendo tesocajagasto',sqlca.sqlerrtext)
	rollback;
	return -1
end if
if isnull(ngasto) then ngasto=0
ngasto++
tab_1.tabp_2.dw_cab_gasto.setitem(1,'ngasto',ngasto)
if tab_1.tabp_2.dw_cab_gasto.update(true,false)=-1 then
	rollback;
	return -1
end if
for j=1 to tab_1.tabp_2.tab_2.tp_2.dw_concep.rowcount()
	tab_1.tabp_2.tab_2.tp_2.dw_concep.setitem(j,'ngasto',ngasto)
next
if tab_1.tabp_2.tab_2.tp_2.dw_concep.update(true,false)=-1 then
	rollback;
	return -1
end if
for j=1 to tab_1.tabp_2.dw_tot.rowcount()
	tab_1.tabp_2.dw_tot.setitem(j,'ngasto',ngasto)
	tab_1.tabp_2.dw_tot.setitem(j,'codcaja',i_caja)
	tab_1.tabp_2.dw_tot.setitem(j,'clugar',i_lugar)
next
if tab_1.tabp_2.dw_tot.update(true,false)=-1 then
	rollback;
	return -1
end if
tab_1.tabp_2.tab_2.tp_2.dw_retencion.setfilter('')
tab_1.tabp_2.tab_2.tp_2.dw_retencion.filter()
for j=1 to tab_1.tabp_2.tab_2.tp_2.dw_retencion.rowcount()
	tab_1.tabp_2.tab_2.tp_2.dw_retencion.setitem(j,'ngasto',ngasto)
next
if tab_1.tabp_2.tab_2.tp_2.dw_retencion.update(true,false)=-1 then
	rollback;
	return -1
end if
j=dw_pago.find('forma="E"',1,dw_pago.rowcount())
if j<>0 then 
	dw_detcaja.setitem(1,'efectivo', dw_detcaja.getitemnumber(1,'efectivo')-dw_pago.getitemnumber(j,'valor'))
	dw_montos.setitem(1,'efectivo', dw_montos.getitemnumber(1,'efectivo')-dw_pago.getitemnumber(j,'valor'))
	dw_pago.deleterow(j)
end if
if dw_pago.rowcount()>0 then
	dec valor
	string banco,tipocuenta,numcuenta,detalle,tdoc,doc
	datetime hoy
	long item
	banco=dw_montos.getitemstring(1,'codbanco')
	tipocuenta=dw_montos.getitemstring(1,'tipo_cuenta')
	numcuenta=dw_montos.getitemstring(1,'numcuenta')
	detalle=tab_1.tabp_2.dw_cab_gasto.getitemstring(1,'concepto')
	tdoc=tab_1.tabp_2.dw_cab_gasto.getitemstring(1,'tipodoc')
	doc=tab_1.tabp_2.dw_cab_gasto.getitemstring(1,'documento')
	hoy=datetime(today())
	select max(item) into :item from tesocuentasmovi where CodBanco=:banco and tipo_cuenta=:tipocuenta and numcuenta=:numcuenta and clugar=:clugar;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo tesocuentasmovi",sqlca.sqlcode)
		rollback;
		return -1
	end if
	if isnull(item) then item=0
	item ++
	INSERT INTO tesocuentasmovi ( CodBanco, tipo_cuenta, numcuenta,clugar, item, fecha, detalle, usuario, TipoDoc, documento, tipo_trans )
	values(:banco,:tipocuenta,:numcuenta,:clugar,:item,:hoy,:detalle,:usuario,:tdoc,:doc,'R');
	if sqlca.sqlcode=-1 then
		messagebox("Error insertando en tesocuentasmovi",sqlca.sqlerrtext)
		rollback;
		return -1
	end if
	dw_pago.accepttext()
	dw_pago.setitem(1,'codbanco',banco)
	dw_pago.setitem(1,'tipo_cuenta',tipocuenta)
	dw_pago.setitem(1,'numcuenta',numcuenta)
	dw_pago.setitem(1,'clugar',clugar)
	dw_pago.setitem(1,'item',item)
	dw_pago.setitem(1,'subitem',1)
	if tab_1.tabp_2.tab_2.tp_3.dw_pago.update(true,false)=-1 then
		rollback;
		return -1
	end if
	valor=dw_pago.getitemnumber(1,'total')
	
	dw_detcaja.setitem(1,'saldo', dw_detcaja.getitemnumber(1,'saldo')-valor)
	dw_montos.setitem(1,'saldo', dw_montos.getitemnumber(1,'saldo')-valor)
	update tesocajagasto set codbanco=:banco , tipo_cuenta=:tipocuenta,numcuenta=:numcuenta,item=:item
	where codcaja=:i_caja and clugar=:i_lugar and coddoc='GME' and ngasto=:ngasto;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando nro de trasaccion bancaria en tabla Tesocajagasto",sqlca.sqlerrtext)
		rollback;
		return -1
	end if
end if
if i_presu='1' then
	if idw_rubros.update(true,false)=-1 then
		rollback;
		return -1
	end if
end if
if dw_detcaja.update(true,false)=-1 then
	rollback;
	return -1
end if
tab_1.tabp_2.tab_2.tp_2.enabled=true
tab_1.tabp_2.tab_2.tp_3.pb_guardagasto.visible=false
tab_1.tabp_2.tab_2.tp_2.pb_sig2.visible=false
i_cam_egr=false

idw_rubros.resetupdate()
dw_detcaja.resetupdate()
tab_1.tabp_2.dw_gasto.reset()
tab_1.tabp_2.dw_cab_gasto.reset()
tab_1.tabp_2.tab_2.tp_2.dw_retencion.reset()
tab_1.tabp_2.tab_2.tp_3.dw_pago.reset()
tab_1.tabp_2.dw_tot.reset()
tab_1.tabp_2.dw_gasto.retrieve(i_lugar,i_caja)
tab_1.tabp_2.tab_2.tp_3.dw_montos.retrieve(i_caja,i_lugar)
if not i_cam_ing then cambio=false
return 1
end event

event clicked;if this.event p_clicked()=1 then
	commit;
end if
end event

type tabp_1 from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 112
integer width = 3771
integer height = 1728
long backcolor = 67108864
string text = "Reposiciones"
long tabtextcolor = 33554432
string picturename = "rec_caja.ico"
long picturemaskcolor = 536870912
string powertiptext = "Reposiciones - Ingreso de efectivo"
gb_2 gb_2
tab_repo tab_repo
dw_cab_repo dw_cab_repo
pb_5 pb_5
pb_saverepo pb_saverepo
dw_repo dw_repo
end type

on tabp_1.create
this.gb_2=create gb_2
this.tab_repo=create tab_repo
this.dw_cab_repo=create dw_cab_repo
this.pb_5=create pb_5
this.pb_saverepo=create pb_saverepo
this.dw_repo=create dw_repo
this.Control[]={this.gb_2,&
this.tab_repo,&
this.dw_cab_repo,&
this.pb_5,&
this.pb_saverepo,&
this.dw_repo}
end on

on tabp_1.destroy
destroy(this.gb_2)
destroy(this.tab_repo)
destroy(this.dw_cab_repo)
destroy(this.pb_5)
destroy(this.pb_saverepo)
destroy(this.dw_repo)
end on

type gb_2 from groupbox within tabp_1
integer x = 5
integer y = 12
integer width = 2203
integer height = 664
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Reposiciones:"
borderstyle borderstyle = styleraised!
end type

type tab_repo from tab within tabp_1
integer x = 27
integer y = 664
integer width = 3726
integer height = 956
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_pen tp_pen
tp_pre tp_pre
end type

on tab_repo.create
this.tp_pen=create tp_pen
this.tp_pre=create tp_pre
this.Control[]={this.tp_pen,&
this.tp_pre}
end on

on tab_repo.destroy
destroy(this.tp_pen)
destroy(this.tp_pre)
end on

type tp_pen from userobject within tab_repo
integer x = 18
integer y = 112
integer width = 3689
integer height = 828
boolean enabled = false
long backcolor = 67108864
string text = "Reposiciones Pendientes"
long tabtextcolor = 33554432
string picturename = "rec_caja.ico"
long picturemaskcolor = 536870912
pb_1 pb_1
st_7 st_7
dw_cpo_intfaz dw_cpo_intfaz
dw_cab_intfaz dw_cab_intfaz
end type

on tp_pen.create
this.pb_1=create pb_1
this.st_7=create st_7
this.dw_cpo_intfaz=create dw_cpo_intfaz
this.dw_cab_intfaz=create dw_cab_intfaz
this.Control[]={this.pb_1,&
this.st_7,&
this.dw_cpo_intfaz,&
this.dw_cab_intfaz}
end on

on tp_pen.destroy
destroy(this.pb_1)
destroy(this.st_7)
destroy(this.dw_cpo_intfaz)
destroy(this.dw_cab_intfaz)
end on

type pb_1 from picturebutton within tp_pen
integer x = 3291
integer y = 460
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Ingesar Reposiciones Pendientes"
end type

type st_7 from statictext within tp_pen
integer x = 14
integer y = 400
integer width = 407
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Reposición"
boolean focusrectangle = false
end type

type dw_cpo_intfaz from datawindow within tp_pen
integer x = 9
integer y = 452
integer width = 3237
integer height = 348
integer taborder = 23
string title = "none"
string dataobject = "dw_tesotrans_dispo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if this.getcolumnname()='codtotal' then
	string descrip
	setnull(descrip)
	SELECT pre_plan.descrip into :descrip
	FROM pre_vigencia INNER JOIN pre_plan ON pre_vigencia.cod_vigencia = pre_plan.cod_vigencia
	WHERE pre_vigencia.Estado='0' AND pre_plan.CodTotal=:data;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo pre_plan",sqlca.sqlerrtext)
		return 1
	end if
	if isnull(descrip) then
		return 1
	else
		this.setitem(this.getrow(),'descrip',descrip)
	end if
end if
end event

type dw_cab_intfaz from datawindow within tp_pen
event p_itemchanged ( )
integer width = 3433
integer height = 384
integer taborder = 30
string title = "none"
string dataobject = "dw_cab_intfaz_opag_repo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();tab_1.tabp_1.dw_cab_repo.setitem(1,'valor',this.getitemnumber(1,'total'))
end event

event itemchanged;if this.getcolumnname()='esco' then
	this.event post p_itemchanged()
end if
end event

type tp_pre from userobject within tab_repo
integer x = 18
integer y = 112
integer width = 3689
integer height = 828
boolean enabled = false
long backcolor = 67108864
string text = "Detalle Reposición"
long tabtextcolor = 33554432
string picturename = "disponible.ico"
long picturemaskcolor = 536870912
dw_det_rep dw_det_rep
end type

on tp_pre.create
this.dw_det_rep=create dw_det_rep
this.Control[]={this.dw_det_rep}
end on

on tp_pre.destroy
destroy(this.dw_det_rep)
end on

type dw_det_rep from datawindow within tp_pre
integer x = 55
integer y = 48
integer width = 3282
integer height = 612
integer taborder = 30
string title = "none"
string dataobject = "dw_det_repo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_cab_repo from datawindow within tabp_1
integer x = 2258
integer y = 36
integer width = 1367
integer height = 408
integer taborder = 20
string title = "none"
string dataobject = "dw_cab_repo"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type pb_5 from picturebutton within tabp_1
integer x = 2345
integer y = 448
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Devolver Reposición"
end type

event clicked;if dw_detcaja.rowcount()=0 or dw_repo.rowcount()=0 then return
if dw_detcaja.getitemnumber(1,'monto')<dw_repo.getitemnumber(dw_repo.getrow(),'valor') then
	messagebox("Atención","El monto actual de la caja no permite devolver esta reposición")
	return
end if
if not isnull(dw_repo.getitemstring(dw_repo.getrow(),'cod_mod_dest')) and dw_repo.getitemstring(dw_repo.getrow(),'en_destino')='1' then
	messagebox("Atención","Esta Reposición ya fue utilizada por el módulo destino, no la puede anular")
	return
end if
st_xa_anular st_anula
st_anula.tipo='CM'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
dw_detcaja.setitem(1,'monto',dw_detcaja.getitemnumber(1,'monto')- dw_repo.getitemnumber(dw_repo.getrow(),'valor'))
if dw_detcaja.update()=-1 then
	rollback;
	return
end if
string nulo,lug,meserr,orig
long donde,cual
setnull(nulo)
if not isnull(dw_repo.getitemstring(dw_repo.getrow(),'cod_mod_orig')) then
//	donde=idw_origen.find("cod_mod_dest='"+dw_repo.getitemstring(dw_repo.getrow(),'cod_mod_orig')+"'",1,idw_origen.rowcount())
	if donde=0 then
		messagebox("Atención",'No se puede encontrar el módulo origen de la reposición')
		rollback;
		return
	end if
//	orig=idw_origen.getitemstring(donde,'coddoc')
	choose case orig
		case 'PT' //ordenes de pago
			lug=dw_repo.getitemstring(dw_repo.getrow(),'clugar')
			cual=dw_repo.getitemnumber(dw_repo.getrow(),'nro_doc_orig')
			update tesotranscab set en_destino='0' where clugar=:lug and ntransferencia=:cual;
	end choose
	if sqlca.sqlcode=-1 then
		meserr=sqlca.sqlerrtext
		rollback;
		messagebox("Error actualizando Documento Origen",meserr)
		return
	end if
end if
dw_repo.setitem(dw_repo.getrow(),'estado',usuario)
dw_repo.setitem(dw_repo.getrow(),'fecha_anula',datetime(today()))
dw_repo.setitem(dw_repo.getrow(),'motiv_anula',st_anula.observacion)
dw_repo.setitem(dw_repo.getrow(),'cod_anula',st_anula.motivo)
if dw_repo.update()=-1 then
	rollback;
else
	commit;
end if
end event

type pb_saverepo from picturebutton within tabp_1
event type integer p_clicked ( )
boolean visible = false
integer x = 2505
integer y = 448
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Ingresar Reposiciones"
end type

event type integer p_clicked();//if not i_cam_ing then return 1
//real asumar
//long nrepo
//select max(nreposicion) into :nrepo from tesocajareposicion where codcaja=:i_caja and clugar=:i_lugar;
//if sqlca.sqlcode=-1 then
//	messagebox("Error leyendo tesocajareposicion",sqlca.sqlerrtext)
//	return -1
//end if
//if not isnull(dw_cab_repo.getitemstring(1,'cod_mod_orig')) then
//	if tab_repo.tp_pen.dw_cab_intfaz.rowcount()=0 then
//		messagebox("Error","No hay ningun documento pendiente de Ingresar como reposición")
//		return -1
//	end if
//	asumar=tab_repo.tp_pen.dw_cab_intfaz.getitemnumber(1,'total')
//	if asumar=0 then 
//		messagebox("Error","No hay ningun valor para Ingresar")
//		return -1
//	end if
//	long j,k
//	tab_repo.tp_pen.dw_cab_intfaz.setfilter('esco="1"')
//	tab_repo.tp_pen.dw_cab_intfaz.filter()
//	for k=1 to tab_repo.tp_pen.dw_cab_intfaz.rowcount()
//		nrepo ++
//		dw_cab_repo.setitem(1,'valor',asumar)
//		dw_cab_repo.setitem(1,'nreposicion',nrepo)
//		dw_cab_repo.setitem(1,'nro_doc_orig',tab_repo.tp_pen.dw_cab_intfaz.getitemnumber(k,'ntransferencia'))
//		dw_cab_repo.setitem(1,'codbanco',tab_repo.tp_pen.dw_cab_intfaz.getitemstring(k,'codbanco'))
//		dw_cab_repo.setitem(1,'tipo_cuenta',tab_repo.tp_pen.dw_cab_intfaz.getitemstring(k,'tipo_cuenta'))
//		dw_cab_repo.setitem(1,'numcuenta',tab_repo.tp_pen.dw_cab_intfaz.getitemstring(k,'numcuenta'))
//		dw_cab_repo.setitem(1,'item',tab_repo.tp_pen.dw_cab_intfaz.getitemnumber(k,'item'))
//		if i_presu='1' then // tiene presup
//			tab_repo.tp_pen.dw_cab_intfaz.scrolltorow(k)
//			tab_repo.tp_pen.dw_cab_intfaz.triggerevent(rowfocuschanged!)
//			if tab_repo.tp_pre.dw_cpo_intfaz.rowcount()=0 then
//				messagebox('Atención','La reposición requiere de Rubros presupuestales')
//				return -1
//			end if
//			if tab_1.tp_pres.dw_dispo.find("clugar_dispo='"+tab_repo.tp_pre.dw_cpo_intfaz.getitemstring(1,'clugar_dispo')+"' and numdoc_dispo="+string(tab_repo.tp_pre.dw_cpo_intfaz.getitemnumber(1,'numdoc_dispo')),1,tab_1.tp_pres.dw_dispo.rowcount())=0 then
//				tab_1.tp_pres.dw_dispo.insertrow(1)
//				tab_1.tp_pres.dw_dispo.setitem(1,'codcaja',i_caja)
//				tab_1.tp_pres.dw_dispo.setitem(1,'clugar',i_lugar)
//				tab_1.tp_pres.dw_dispo.setitem(1,'coddocu_dispo','PDI')
//				tab_1.tp_pres.dw_dispo.setitem(1,'clugar_dispo',tab_repo.tp_pre.dw_cpo_intfaz.getitemstring(1,'clugar_dispo'))
//				tab_1.tp_pres.dw_dispo.setitem(1,'numdoc_dispo',tab_repo.tp_pre.dw_cpo_intfaz.getitemnumber(1,'numdoc_dispo'))
//				tab_1.tp_pres.dw_dispo.setitem(1,'monto',tab_repo.tp_pre.dw_cpo_intfaz.getitemnumber(1,'total'))
//			end if
//			string cod_pre
//			long donde,cod_vig
//			for j=1 to tab_repo.tp_pre.dw_cpo_intfaz.rowcount()
//				cod_vig=tab_repo.tp_pre.dw_cpo_intfaz.getitemnumber(j,'cod_vigencia')
//				if i_vigencia<>cod_vig then
//					messagebox('Atención','La vigencia del sistema es diferente a la vigencia de la reposición. No puede continuar')
//					return -1
//				end if
//				cod_pre=tab_repo.tp_pre.dw_cpo_intfaz.getitemstring(j,'codtotal')
//				donde=idw_rubros.find("cod_vigencia="+string(cod_vig)+" and codtotal_presu='"+cod_pre+"'",1,idw_rubros.rowcount())
//				if donde=0 then 
//					donde=idw_rubros.insertrow(0)
//					idw_rubros.setitem(donde,'codcaja',i_caja)
//					idw_rubros.setitem(donde,'clugar',i_lugar)
//					idw_rubros.setitem(donde,'cod_vigencia',cod_vig)
//					idw_rubros.setitem(donde,'codtotal_presu',cod_pre)
//					idw_rubros.setitem(donde,'monto',tab_repo.tp_pre.dw_cpo_intfaz.getitemnumber(j,'monto'))
//					idw_rubros.setitem(donde,'disponible',tab_repo.tp_pre.dw_cpo_intfaz.getitemnumber(j,'monto'))
//				else
//					idw_rubros.setitem(donde,'monto',idw_rubros.getitemnumber(donde,'monto')+tab_repo.tp_pre.dw_cpo_intfaz.getitemnumber(j,'monto'))
//					idw_rubros.setitem(donde,'disponible',idw_rubros.getitemnumber(donde,'disponible')+tab_repo.tp_pre.dw_cpo_intfaz.getitemnumber(j,'monto'))
//				end if
//			next
//		end if // fin de tiene presup
//		tab_repo.tp_pen.dw_cab_intfaz.setitem(k,'en_destino','1')
//	next
//	if i_presu='1' then 
//		if idw_rubros.update()=-1 then
//			rollback;
//			return -1
//		end if
//		if tab_1.tp_pres.dw_dispo.update()=-1 then
//			rollback;
//			return -1
//		end if
//	end if
//else  //debe ser manuelita
//	nrepo ++
//	asumar=dw_cab_repo.getitemnumber(1,'valor')
//	if asumar=0 then
//		messagebox("Error","No hay ningun valor para Ingresar")
//		return -1
//	end if
//	dw_cab_repo.setitem(1,'nreposicion',nrepo)
//end if
//if dw_cab_repo.update()=-1 then
//	rollback;
//	return -1
//end if
//dw_detcaja.setitem(1,'monto',dw_detcaja.getitemnumber(1,'monto')+ asumar)
//if tab_repo.tp_pen.dw_cab_intfaz.update()=-1 then
//	rollback;
//	return -1
//end if
//if dw_detcaja.update()=-1 then
//	rollback;
//	return -1
//end if
//i_cam_ing=false
//if not i_cam_egr then cambio=false
//tab_repo.tp_pen.enabled=false
//tab_repo.tp_pre.enabled=false
//this.visible=false
//pb_1.enabled=true
//tab_1.tabp_1.dw_repo.retrieve(i_lugar,i_caja)
//tab_1.tabp_1.tab_repo.tp_pen.dw_cab_intfaz.reset()
//tab_1.tabp_1.tab_repo.tp_pre.dw_cpo_intfaz.reset()
return 1
end event

event clicked;if this.event p_clicked()=1 then
	commit;
end if
end event

type dw_repo from datawindow within tabp_1
integer x = 32
integer y = 60
integer width = 2135
integer height = 580
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cmenor_reposicion2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;long fila
fila=this.getrow()
if fila<=0 then return
dw_cab_repo.retrieve(i_caja,i_lugar,this.getitemnumber(fila,'nreposicion'))
end event

event rowfocuschanging;if i_cam_ing then return 1
end event

type tp_pres from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3771
integer height = 1728
long backcolor = 67108864
string text = "Detalle Presupuestal"
long tabtextcolor = 33554432
string picturename = "disponible.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra Disponibilidades y Rubros de la Caja"
st_5 st_5
st_4 st_4
dw_rubros dw_rubros
dw_dispo dw_dispo
end type

on tp_pres.create
this.st_5=create st_5
this.st_4=create st_4
this.dw_rubros=create dw_rubros
this.dw_dispo=create dw_dispo
this.Control[]={this.st_5,&
this.st_4,&
this.dw_rubros,&
this.dw_dispo}
end on

on tp_pres.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_rubros)
destroy(this.dw_dispo)
end on

type st_5 from statictext within tp_pres
integer x = 613
integer y = 48
integer width = 608
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Disponibilidades"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within tp_pres
integer x = 576
integer y = 824
integer width = 667
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado actual de los Rubros:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_rubros from datawindow within tp_pres
integer x = 576
integer y = 888
integer width = 2459
integer height = 692
integer taborder = 30
string title = "none"
string dataobject = "dw_rubros_con_cupo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_dispo from datawindow within tp_pres
integer x = 622
integer y = 100
integer width = 2414
integer height = 648
integer taborder = 30
string title = "none"
string dataobject = "dw_dispo_caja"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

