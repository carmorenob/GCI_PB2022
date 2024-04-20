$PBExportHeader$w_plantilla_asiento.srw
forward
global type w_plantilla_asiento from w_center
end type
type dw_emp from datawindow within w_plantilla_asiento
end type
type dw_historial from datawindow within w_plantilla_asiento
end type
type st_regi from statictext within w_plantilla_asiento
end type
type st_cuenta from statictext within w_plantilla_asiento
end type
type st_tercero from statictext within w_plantilla_asiento
end type
type st_doc_ref from statictext within w_plantilla_asiento
end type
type dw_detalle from datawindow within w_plantilla_asiento
end type
type st_1 from statictext within w_plantilla_asiento
end type
type dw_digita from datawindow within w_plantilla_asiento
end type
type pb_new from picturebutton within w_plantilla_asiento
end type
type pb_del_asiento from picturebutton within w_plantilla_asiento
end type
type pb_export from picturebutton within w_plantilla_asiento
end type
type pb_import from picturebutton within w_plantilla_asiento
end type
type pb_del_all from picturebutton within w_plantilla_asiento
end type
type cbx_rep from checkbox within w_plantilla_asiento
end type
type gb_3 from groupbox within w_plantilla_asiento
end type
type dw_doc from datawindow within w_plantilla_asiento
end type
type dw_new from datawindow within w_plantilla_asiento
end type
end forward

global type w_plantilla_asiento from w_center
string tag = "Realizó Cambios en la Plantilla , desea guardarlos?"
integer width = 3822
integer height = 1996
string title = "Plantillas Asientos Contables"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_plantillas.ico"
boolean center = false
dw_emp dw_emp
dw_historial dw_historial
st_regi st_regi
st_cuenta st_cuenta
st_tercero st_tercero
st_doc_ref st_doc_ref
dw_detalle dw_detalle
st_1 st_1
dw_digita dw_digita
pb_new pb_new
pb_del_asiento pb_del_asiento
pb_export pb_export
pb_import pb_import
pb_del_all pb_del_all
cbx_rep cbx_rep
gb_3 gb_3
dw_doc dw_doc
dw_new dw_new
end type
global w_plantilla_asiento w_plantilla_asiento

type variables
string docum_contable='' ,i_codemp='',anterior,orden,anterior2,orden2
long num_docu_contable=0
datawindowchild dw_docus,dw_ccosto,idw_emp_docext
int i_dec_gral,i_aprox_gral,i_dec_rte,i_aprox_rte

end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();long nplant,j
if dw_new.visible then
	IF DW_historial.rowcount()=0 then
		nplant=1
	else
		nplant=dw_historial.getitemnumber(1,'maxi')+1
	end if
	dw_new.setitem(1,'nplant',nplant)
	dw_new.accepttext()
	if dw_new.update()=-1 then
		rollback;
		return -1
	end if
	for j=1 to dw_detalle.rowcount()
		dw_detalle.setitem(j,'nplant',nplant)
	next
end if
dw_historial.accepttext()
dw_detalle.accepttext()
if dw_historial.update()=-1 then
	rollback;
	return -1
end if
if dw_detalle.update()=-1 then
	rollback;
	return -1
end if
cambio=false
if dw_new.visible then
	dw_new.visible=false
	dw_historial.scrolltorow(dw_historial.retrieve(i_codemp,docum_contable))
end if
dw_digita.enabled=true
return 1
end function

on w_plantilla_asiento.create
int iCurrent
call super::create
this.dw_emp=create dw_emp
this.dw_historial=create dw_historial
this.st_regi=create st_regi
this.st_cuenta=create st_cuenta
this.st_tercero=create st_tercero
this.st_doc_ref=create st_doc_ref
this.dw_detalle=create dw_detalle
this.st_1=create st_1
this.dw_digita=create dw_digita
this.pb_new=create pb_new
this.pb_del_asiento=create pb_del_asiento
this.pb_export=create pb_export
this.pb_import=create pb_import
this.pb_del_all=create pb_del_all
this.cbx_rep=create cbx_rep
this.gb_3=create gb_3
this.dw_doc=create dw_doc
this.dw_new=create dw_new
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_emp
this.Control[iCurrent+2]=this.dw_historial
this.Control[iCurrent+3]=this.st_regi
this.Control[iCurrent+4]=this.st_cuenta
this.Control[iCurrent+5]=this.st_tercero
this.Control[iCurrent+6]=this.st_doc_ref
this.Control[iCurrent+7]=this.dw_detalle
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.dw_digita
this.Control[iCurrent+10]=this.pb_new
this.Control[iCurrent+11]=this.pb_del_asiento
this.Control[iCurrent+12]=this.pb_export
this.Control[iCurrent+13]=this.pb_import
this.Control[iCurrent+14]=this.pb_del_all
this.Control[iCurrent+15]=this.cbx_rep
this.Control[iCurrent+16]=this.gb_3
this.Control[iCurrent+17]=this.dw_doc
this.Control[iCurrent+18]=this.dw_new
end on

on w_plantilla_asiento.destroy
call super::destroy
destroy(this.dw_emp)
destroy(this.dw_historial)
destroy(this.st_regi)
destroy(this.st_cuenta)
destroy(this.st_tercero)
destroy(this.st_doc_ref)
destroy(this.dw_detalle)
destroy(this.st_1)
destroy(this.dw_digita)
destroy(this.pb_new)
destroy(this.pb_del_asiento)
destroy(this.pb_export)
destroy(this.pb_import)
destroy(this.pb_del_all)
destroy(this.cbx_rep)
destroy(this.gb_3)
destroy(this.dw_doc)
destroy(this.dw_new)
end on

event open;dw_doc.getchild("coddoc",dw_docus)
dw_detalle.getchild('coddocext',idw_emp_docext)
idw_emp_docext.settransobject(sqlca)
dw_detalle.getchild("descripcion",dw_ccosto)
dw_ccosto.settransobject(sqlca)
dw_ccosto.retrieve()
dw_ccosto.setfilter("coduf='a'")
dw_ccosto.filter()
dw_docus.settransobject(sqlca)
dw_docus.insertrow(1)
dw_doc.insertrow(1)
dw_emp.settransobject(SQLCA)
dw_emp.insertrow(1)
dw_historial.settransobject(SQLCA)
dw_detalle.settransobject(SQLCA)

SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=32));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 32')
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
if i_aprox_gral=0 then i_aprox_rte=1
end event

event resize;call super::resize;gb_3.resize(newwidth -20, newheight -400)
dw_detalle.resize(newwidth -50, newheight -800)
end event

type pb_grabar from w_center`pb_grabar within w_plantilla_asiento
integer x = 1166
integer y = 56
integer taborder = 40
end type

event pb_grabar::clicked;call super::clicked;if cambio then 
	if grabar()=1 then 
		commit;
	end if
end if
end event

type dw_emp from datawindow within w_plantilla_asiento
integer x = 27
integer y = 16
integer width = 1120
integer height = 148
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event itemchanged;call super::itemchanged;
string actual
actual=this.getitemstring(1,1)
if dw_detalle.accepttext()=-1 then return 1
choose case f_pregunta()
	case 1
		if grabar()=-1 then 
			this.setitem(1,1,actual)
			return 1
		end if
	case 2
		cambio=false
	case 3
		this.setitem(1,1,actual)
		return 1
end choose
dw_doc.setitem(1,1,'')
this.accepttext()
i_codemp=this.getitemstring(1,1)
dw_docus.retrieve(i_codemp)
idw_emp_docext.retrieve(i_codemp)

end event

type dw_historial from datawindow within w_plantilla_asiento
integer x = 1650
integer y = 72
integer width = 2085
integer height = 368
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cont_plant"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long donde
if getrow()<1 then
	reset()
	return
end if
donde=getrow()
num_docu_contable=getitemnumber(donde,'nplant')
f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
dw_detalle.retrieve(i_codemp,docum_contable,num_docu_contable,i_dec_gral,i_dec_rte)

end event

event rowfocuschanging;if dw_detalle.accepttext()=-1 then return 1
choose case f_pregunta()
	case 1
		if grabar()=-1 then return 1
	case 2
		if dw_new.visible then dw_new.visible=false
		cambio=false
	case 3
		return 1
end choose
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event clicked;if dwo.type <> "text" then return
string cual
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior2=cual then
	if orden2="A" then
		orden2="D"
	else
		orden2="A"
	end if
else
	orden2="A"
end if
this.setsort(cual+" "+orden2)
this.sort()
anterior2=cual
end event

event itemchanged;cambio=true
end event

type st_regi from statictext within w_plantilla_asiento
integer x = 41
integer y = 664
integer width = 256
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

type st_cuenta from statictext within w_plantilla_asiento
integer x = 320
integer y = 664
integer width = 1545
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

type st_tercero from statictext within w_plantilla_asiento
integer x = 1883
integer y = 664
integer width = 1239
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

type st_doc_ref from statictext within w_plantilla_asiento
integer x = 3141
integer y = 560
integer width = 416
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

type dw_detalle from datawindow within w_plantilla_asiento
event keyup pbm_dwnkey
event p_replica ( long p_fila,  string p_nombre )
integer x = 27
integer y = 744
integer width = 3529
integer height = 1052
integer taborder = 80
boolean bringtotop = true
string title = "Comprobante Contable"
string dataobject = "dw_cont_plant_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;choose case getcolumnname()
	case "coddocext"
		if key=keydelete! then
			string nulo
			setnull(nulo)
			setitem(getrow(),"coddocext",nulo)
			setitem(getrow(),"cod_empre_doc_ext",nulo)
			cambio=true
			return
		end if
	case 'tipo_transac'
		if key=keydelete! then
			setitem(getrow(),"tipo_transac",nulo)
			setitem(getrow(),"descont",nulo)
			cambio=true
			return
		end if
end choose
if getcolumnname()<>"cp_cuenta" then return
f_busca_cuenta(key,i_codemp,this)


end event

event p_replica(long p_fila, string p_nombre);accepttext()
if not cbx_rep.checked then return
long j,valorn
string valors,temp
boolean numero
if p_nombre='nsopo_externo' then
	numero=true
	valorn=getitemnumber(p_fila,p_nombre)
else
	valors=getitemstring(p_fila,p_nombre)
end if
for j=1 to rowcount()
	if p_fila=j then continue
	temp=mid(Describe(p_nombre+".protect"),4)
	temp=mid(temp,1,len(temp) -1)
	if Describe('evaluate("'+temp+'",'+string(j)+")")='1' then continue
	if numero then
		if isnull(getitemnumber(j,p_nombre)) then 
			setitem(j,p_nombre,valorn)
		end if
	else
		if isnull(getitemstring(j,p_nombre)) or getitemstring(j,p_nombre)='' then
			if p_nombre='documento' then
				setitem(j,p_nombre,valors)
				setitem(j,"cp_dverificacion",getitemstring(p_fila,'cp_dverificacion'))
				setitem(j,"terceros_nombre1",getitemstring(p_fila,'terceros_nombre1'))
				setitem(j,"terceros_nombre2",getitemstring(p_fila,'terceros_nombre2'))
				setitem(j,"terceros_apellido1",getitemstring(p_fila,'terceros_apellido1'))
				setitem(j,"terceros_apellido2",getitemstring(p_fila,'terceros_apellido2'))
				setitem(j,"terceros_razon_social",getitemstring(p_fila,'terceros_razon_social'))
				setitem(j,"terceros_persona",getitemstring(p_fila,'terceros_persona'))
			elseif p_nombre='descripcion' then
				if getitemstring(j,'cp_cufuncional')=getitemstring(p_fila,'cp_cufuncional') then 
					setitem(j,p_nombre,valors)
					setitem(j,"cp_ccosto",getitemstring(p_fila,'cp_ccosto'))
				end if
			elseif p_nombre='coddocext' then
				setitem(j,'cod_empre_doc_ext',i_codemp)
				setitem(j,p_nombre,valors)
			else
				setitem(j,p_nombre,valors)
			end if
		end if
	end if
next

end event

event rowfocuschanged;long fila
fila=getrow()
if fila<=0 then return
st_cuenta.text=getitemstring(fila,"descrip")
st_tercero.text=getitemstring(fila,"razon_social")
st_regi.text=string(getitemnumber(fila,'cp_secuencia'))
if getitemstring(fila,"cp_cufuncional")<>"" then
	dw_ccosto.setfilter("coduf='"+getitemstring(fila,"cp_cufuncional")+"'")//"),w_atiende_os.tipo_ingres,getitemstring(fila,56))
else
	dw_ccosto.setfilter("coduf='a'")
end if
dw_ccosto.filter()

end event

event itemchanged;long donde
string natu,nulo
decimal base,base_desde,valor,porcentaje
setnull(natu)
donde=getrow()
setnull(nulo)
choose case getcolumnname()
	case 'cp_valordeb','cp_valorcred'
		accepttext()
		valor=round(getitemdecimal(getrow(),getcolumn()),i_dec_gral)
		if i_dec_gral=0 then
			valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
		end if
		setitem(getrow(),getcolumn(),valor)
		settext(string(valor))
		accepttext()
		cambio=true
		return 2 //para que acepte los nuevos valores
	case "base"
		accepttext()
		base=round(getitemdecimal(donde,"base"),i_dec_gral)
		if i_dec_gral=0 then
			base=long(base/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((base -long(base/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
		end if
		setitem(getrow(),getcolumn(),base)
		settext(string(base))
		base_desde=getitemdecimal(donde,"base_desde")
		natu=getitemstring(donde,"naturaleza")
		porcentaje=getitemdecimal(donde,"porcentaje")
		if base < 0 then
			if base_desde<= - base then
				valor= round(-base * porcentaje/100,i_dec_rte)
				if i_dec_rte=0 then
					valor=long(valor/i_aprox_rte)*i_aprox_rte +i_aprox_rte*round((valor -long(valor/i_aprox_rte)*i_aprox_rte)/i_aprox_rte,0)
				end if
			else
				valor=0
			end if
			if natu='C' then
				setitem(donde,"cp_valordeb",valor)
				setitem(donde,"cp_valorcred",0)
			else
				setitem(donde,"cp_valorcred",valor)
				setitem(donde,"cp_valordeb",0)
			end if
		else
			if base_desde<= base then
				valor= round(base * porcentaje/100,i_dec_rte)
				if i_dec_rte=0 then
					valor=long(valor/i_aprox_rte)*i_aprox_rte +i_aprox_rte*round((valor -long(valor/i_aprox_rte)*i_aprox_rte)/i_aprox_rte,0)
				end if
			else
				valor=0
			end if
			if natu='C' then
				setitem(donde,"cp_valorcred",valor)
				setitem(donde,"cp_valordeb",0)
			else
				setitem(donde,"cp_valordeb",valor)
				setitem(donde,"cp_valorcred",0)
			end if
		end if
		accepttext()
		cambio=true
		return 2
	case "cp_cuenta"
		string tercero,rfuente,otro,ccosto,descrip,corr,coduf,codcc,descc,t_pyg,lugar
		otro=gettext()
		if trim(otro)='' then return 1
		SELECT cont_plan.RFUENTE, cont_plan.tercero, cont_plan.naturaleza, cont_plan.ccosto, cont_plan.descrip, cont_plan.corriente, cont_plan.CodUF, cont_plan.CodCC, CentroCostos.Descripcion as descc, cont_tipo_cta.t_pyg,cont_plan.lugar
		into :rfuente,:tercero,:natu,:ccosto,:descrip ,:corr,:coduf,:codcc,:descc,:t_pyg,:lugar
		FROM (cont_plan LEFT outer JOIN CentroCostos ON (cont_plan.CodUF = CentroCostos.CodUF) AND (cont_plan.CodCC = CentroCostos.CodCC)) INNER JOIN cont_tipo_cta ON (cont_plan.COD_EMPRESA = cont_tipo_cta.cod_empresa) AND (cont_plan.mayor = cont_tipo_cta.mayor)
		WHERE (((cont_plan.CodTotal)=:otro) AND ((cont_plan.COD_EMPRESA)=:i_codemp) AND ((cont_plan.movimiento)='1') AND ((cont_plan.estado)='1'));
		if isnull(natu) then
			//setitem(getrow(),getcolumnname(),natu)
			return 1
		else
			datetime desde,hasta
			setnull(desde)
			setnull(hasta)
			setnull(base_desde)
			setnull(porcentaje)
			if not isnull(rfuente) then
				SELECT BASE, PORCENTAJE, INICIA, TERMINA
				into :base_desde,:porcentaje,:desde,:hasta
				FROM CONT_impuesto
				WHERE CONT_impuesto.COD_CONCEP=:rfuente;
				setitem(donde,"cp_valordeb",0)
				setitem(donde,"cp_valorcred",0)
			end if
			setitem(donde,"base",0)
			setitem(donde,"base_desde",base_desde)
			setitem(donde,"porcentaje",porcentaje)
			setitem(donde,"inicia",desde)
			setitem(donde,"termina",hasta)
			setitem(donde,"naturaleza",natu)
			setitem(donde,"rfuente",rfuente)
			setitem(donde,"tercero",tercero)
			if isnull(t_pyg) or t_pyg='I' then
				dw_detalle.setitem(donde,"deduc_renta",nulo)
			else
				dw_detalle.setitem(donde,"deduc_renta",'1')
			end if
			setitem(donde,"ccosto",ccosto)
			setitem(donde,"descrip",descrip)
			setitem(donde,"corriente",corr)
			setitem(donde,"t_corriente",corr)
			dw_detalle.setitem(donde,"cp_cufuncional",coduf)
			if not isnull(coduf) then
				dw_ccosto.setfilter("coduf='"+coduf+"'")
				dw_ccosto.filter()
			end if
			dw_detalle.setitem(donde,"cp_ccosto",codcc)
			dw_detalle.setitem(donde,"descripcion",descc)
			dw_detalle.setitem(donde,"lugar",lugar)
			if lugar='0' then dw_detalle.setitem(donde,"clugar",nulo)
			dw_detalle.setitem(donde,"descripcion",descc)
			accepttext()
			cambio=true
		end if
	case "cp_cufuncional"
		accepttext()
		setitem(donde,"descripcion",'')
		setitem(donde,"cp_ccosto",natu)
		dw_ccosto.setfilter("coduf='"+data+"'")
		dw_ccosto.filter()
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case "descripcion" //del ccosto
		accepttext()
		setitem(donde,"cp_ccosto",dw_ccosto.getitemstring(dw_ccosto.getrow(),"codcc"))
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case "tipodoc"
		setitem(donde,"documento",nulo)
		accepttext()
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case "documento"
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(donde,"tipodoc")
		if isnull(tdoc) then
			setitem(donde,"documento",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=gettext()
		setnull(persona)
		SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
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
				post event p_replica(getrow(),getcolumnName())
			end if
		else
			setitem(donde,"cp_dverificacion",dverif)
			setitem(donde,"terceros_nombre1",nom1)
			setitem(donde,"terceros_nombre2",nom2)
			setitem(donde,"terceros_apellido1",ape1)
			setitem(donde,"terceros_apellido2",ape2)
			setitem(donde,"terceros_razon_social",rsoc)
			setitem(donde,"terceros_persona",persona)
			st_tercero.text=getitemstring(donde,"razon_social")
			post event p_replica(getrow(),getcolumnName())
		end if
		cambio=true
	case 'coddocext'
		setitem(donde,'cod_empre_doc_ext',i_codemp)
		accepttext()
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case 'cp_detalle','pre_sopo_externo','nsopo_externo'
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case 'tipo_transac'
		if isnull(getitemstring(row,'tipo_transac')) then setitem(row,'descont','0')
		cambio=true
	case else
		accepttext()
		cambio=true
end choose
end event

event itemfocuschanged;f_semovio(this,i_codemp,{'cp_cuenta'})

end event

event clicked;if dwo.type <> "text" then return
string cual
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
dw_detalle.setsort(cual+" "+orden)
dw_detalle.sort()
dw_detalle.groupcalc()
anterior=cual
end event

event doubleclicked;string columna
columna=dwo.name
if columna="tipodoc" or columna="cp_dverificacion" or columna="documento" then
	g_tercerodesde=10
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		event itemchanged(row,dwo,getitemstring(getrow(),"documento"))
	end if
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event getfocus;f_semovio(this,i_codemp,{'cp_cuenta'})
end event

type st_1 from statictext within w_plantilla_asiento
integer x = 1655
integer y = 16
integer width = 585
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Plantillas del Asiento:"
boolean focusrectangle = false
end type

type dw_digita from datawindow within w_plantilla_asiento
event keyup pbm_dwnkey
integer x = 41
integer y = 496
integer width = 663
integer height = 160
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_paraediciones"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event keyup;if i_codemp='' or docum_contable=''  then return
f_busca_cuenta(key,i_codemp,this)

end event

event itemchanged;if i_codemp='' or docum_contable='' or dw_historial.rowcount()=0 then return
string tercero,rfuente,natu,otro,ccosto,descrip,corr,coduf,codcc,descc,t_pyg,nulo,lugar
setnull(nulo)
setnull(natu)
otro=gettext()
if trim(otro)='' then return

SELECT cont_plan.RFUENTE, cont_plan.tercero, cont_plan.naturaleza, cont_plan.ccosto, cont_plan.descrip, cont_plan.corriente, cont_plan.CodUF, cont_plan.CodCC, CentroCostos.Descripcion as descc, cont_tipo_cta.t_pyg,cont_plan.lugar
into :rfuente,:tercero,:natu,:ccosto,:descrip ,:corr,:coduf,:codcc,:descc,:t_pyg,:lugar
FROM (cont_plan LEFT outer JOIN CentroCostos ON (cont_plan.CodUF = CentroCostos.CodUF) AND (cont_plan.CodCC = CentroCostos.CodCC)) INNER JOIN cont_tipo_cta ON (cont_plan.COD_EMPRESA = cont_tipo_cta.cod_empresa) AND (cont_plan.mayor = cont_tipo_cta.mayor)
WHERE (((cont_plan.CodTotal)=:otro) AND ((cont_plan.COD_EMPRESA)=:i_codemp) AND ((cont_plan.movimiento)='1') AND ((cont_plan.estado)='1'));

if sqlca.sqlcode=-1 then 
	messagebox("Error leyendo cont_plan",sqlca.sqlerrtext)
	return 1
end if
if isnull(natu) then
	//setitem(getrow(),getcolumnname(),natu)
	return 1
else
	reset()
	insertrow(1)
	long donde
	real base_desde,porcentaje
	datetime desde,hasta
	setnull(desde)
	setnull(hasta)
	setnull(base_desde)
	setnull(porcentaje)
	if not isnull(rfuente) then
		SELECT BASE, PORCENTAJE, INICIA, TERMINA
		into :base_desde,:porcentaje,:desde,:hasta
		FROM cont_impuesto 
		WHERE CONT_impuesto.COD_CONCEP=:rfuente;
	end if
	f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
	donde=dw_detalle.insertrow(0)
	dw_detalle.setitem(donde,"cp_cod_empresa",i_codemp)
	dw_detalle.setitem(donde,"cp_cdoc",docum_contable)
	dw_detalle.setitem(donde,"cp_secuencia",donde)
	dw_detalle.setitem(donde,"cp_cuenta",otro)
	dw_detalle.setitem(donde,"nplant",dw_historial.getitemnumber(dw_historial.getrow(),'nplant'))
	dw_detalle.setitem(donde,"naturaleza",natu)
	dw_detalle.setitem(donde,"rfuente",rfuente)
	dw_detalle.setitem(donde,"base_desde",base_desde)
	dw_detalle.setitem(donde,"porcentaje",porcentaje)
	dw_detalle.setitem(donde,"inicia",desde)
	dw_detalle.setitem(donde,"termina",hasta)
	dw_detalle.setitem(donde,"tercero",tercero)
	dw_detalle.setitem(donde,"t_pyg",t_pyg)
	dw_detalle.setitem(donde,"lugar",lugar)
	if isnull(t_pyg) or t_pyg='I' then
		dw_detalle.setitem(donde,"deduc_renta",nulo)
	else
		dw_detalle.setitem(donde,"deduc_renta",'1')
	end if
	dw_detalle.setitem(donde,"ccosto",ccosto)
	dw_detalle.setitem(donde,"cp_cufuncional",coduf)
	if not isnull(coduf) then
		dw_ccosto.setfilter("coduf='"+coduf+"'")
		dw_ccosto.filter()
	end if
	dw_detalle.setitem(donde,"cp_ccosto",codcc)
	dw_detalle.setitem(donde,"descripcion",descc)
	dw_detalle.setitem(donde,"descrip",descrip)
	dw_detalle.setitem(donde,"corriente",corr)
	dw_detalle.setitem(donde,"t_corriente",corr)
	dw_detalle.setcolumn("cp_valordeb")
	if dw_detalle.rowcount()>1 then //para repetir los valores anteriores
		long j,k
		dw_detalle.setitem(donde,'cp_detalle',dw_detalle.getitemstring(donde -1 ,'cp_detalle'))
		if tercero='1' then
			for k= donde -1 to 1 step -1
				if dw_detalle.getitemstring(k,"tercero")='1' then exit
			next
			if k<>0 then
				for j= 8 to 16 // todos los campos de terceros (nom1 y 2 ape1 y 2, nit , tdoc,docu,dverif,razonsoci)
					dw_detalle.setitem(donde,j,dw_detalle.getitemstring(k ,j))
				next
			end if
		end if
		if ccosto='1' and isnull(dw_detalle.getitemstring(donde,'cp_cufuncional')) then
			for k= donde -1 to 1 step -1
				if dw_detalle.getitemstring(k,"ccosto")='1' then exit
			next
			if k<>0 then
				for j= 23 to 25 // los tres campos de centros de costo
					dw_detalle.setitem(donde,j,dw_detalle.getitemstring(k ,j))
				next
			end if
		end if
		for j= 32 to 34 //coddocext, prfdocexte
			dw_detalle.setitem(donde,j,dw_detalle.getitemstring(donde -1 ,j))
		next
		dw_detalle.setitem(donde,'nsopo_externo',dw_detalle.getitemnumber(donde -1 ,'nsopo_externo')) //nro doc ext
	end if
	dw_detalle.scrolltorow(donde)
	event getfocus()
	cambio=true
end if
end event

event constructor;insertrow(1)
end event

event getfocus;if isvalid(w_busca_cuenta) then 
	w_busca_cuenta.i_st.dw=this
	w_busca_cuenta.i_semovio=false
	if w_busca_cuenta.i_st.codemp<>i_codemp then
		w_busca_cuenta.i_st.codemp=i_codemp
		w_busca_cuenta.dw_1.retrieve(i_codemp)
	end if
end if

end event

type pb_new from picturebutton within w_plantilla_asiento
event mousemove pbm_mousemove
integer x = 1312
integer y = 56
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Nuevo Plantilla para Asiento Contable [Alt+N]"
end type

event clicked;if cambio then return
if isnull(dw_emp.getitemstring(1,1)) or isnull(dw_doc.getitemstring(1,1)) then return
dw_new.reset()
dw_new.visible=true
dw_new.insertrow(1)
dw_new.setitem(1,'cod_empresa',i_codemp)
dw_new.setitem(1,'cdoc',docum_contable)
dw_detalle.reset()
dw_new.setfocus()
cambio=true
dw_digita.enabled=false
end event

type pb_del_asiento from picturebutton within w_plantilla_asiento
event mousemove pbm_mousemove
integer x = 718
integer y = 504
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "           &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
string powertiptext = "Borrar registro del Asiento [Alt+B]"
end type

event clicked;f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
long fila
fila=dw_detalle.getrow()
if fila< 1 then return
dw_detalle.deleterow(fila)
dw_detalle.setsort('cp_secuencia A')
dw_detalle.sort()
for fila=1 to dw_detalle.rowcount()
	dw_detalle.setitem(fila,"cp_secuencia",fila)
next
cambio=true
end event

type pb_export from picturebutton within w_plantilla_asiento
event mousemove pbm_mousemove
integer x = 1010
integer y = 504
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "export.GIF"
string disabledname = "d_export.GIF"
string powertiptext = "Exportar Comprobante"
end type

event clicked;choose case f_pregunta()
	case 1
		if grabar()=-1 then return
	case 2
	case 3
		return
end choose
openwithparm(w_export,dw_detalle)

end event

type pb_import from picturebutton within w_plantilla_asiento
event mousemove pbm_mousemove
integer x = 864
integer y = 504
integer width = 146
integer height = 128
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "import.GIF"
string disabledname = "d_import.GIF"
string powertiptext = "Importar Comprobante desde Archivo Plano"
end type

event clicked;if dw_detalle.rowcount()>0 then
	if messagebox("Atención","Este documento ya tiene asientos, desea importar los nuevos datos al final del mismo?",question!,yesno!,1)=2 then return
end if
string docname, named
long value,cuantos
value = GetFileOpenName("Importar desde:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
cuantos=dw_detalle.rowcount()
IF value = 1 THEN
	value=dw_detalle.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
if dw_detalle.rowcount()=cuantos then return
long j
string tercero,rfuente,natu,otro,ccosto,descrip
for j=1 to dw_detalle.rowcount()
	otro=dw_detalle.getitemstring(j,"cp_cuenta")
	setnull(natu)
	select rfuente,tercero,naturaleza,ccosto,descrip into :rfuente,:tercero,:natu,:ccosto,:descrip from cont_plan where codtotal=:otro and cod_empresa=:i_codemp and movimiento='1';
	if isnull(natu) then 
		messagebox("Error","La cuenta del asiento nro: "+string(j)+" no existe o no es de movimiento, revisela para poder grabar el documento")
		setnull(descrip)
	end if
	dw_detalle.setitem(j,"cp_cod_empresa",i_codemp)
	dw_detalle.setitem(j,"cp_cdoc",docum_contable)
	dw_detalle.setitem(j,"cp_secuencia",j)
	dw_detalle.setitem(j,"naturaleza",natu)
	dw_detalle.setitem(j,"rfuente",rfuente)
	dw_detalle.setitem(j,"tercero",tercero)
	dw_detalle.setitem(j,"ccosto",ccosto)
	dw_detalle.setitem(j,"descrip",descrip)
next
cambio=true
end event

type pb_del_all from picturebutton within w_plantilla_asiento
event mousemove pbm_mousemove
integer x = 1157
integer y = 504
integer width = 151
integer height = 132
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = " T"
string picturename = "anular_doc_2.gif"
string disabledname = "d_anular_doc_2.gif"
alignment htextalign = left!
vtextalign vtextalign = top!
string powertiptext = "Borrar Todos los Registros del Asiento"
end type

event clicked;f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
if dw_detalle.rowcount()=0 then return
DO WHILE dw_detalle.rowcount()>0
	dw_detalle.deleterow(0)
LOOP
cambio=true

end event

type cbx_rep from checkbox within w_plantilla_asiento
integer x = 2816
integer y = 472
integer width = 736
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Replicar cambios en los vacios"
end type

type gb_3 from groupbox within w_plantilla_asiento
integer x = 27
integer y = 436
integer width = 3707
integer height = 1396
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle del Asiento Contable"
end type

type dw_doc from datawindow within w_plantilla_asiento
integer x = 27
integer y = 184
integer width = 1385
integer height = 148
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_cont_docu"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string actual
actual=getitemstring(1,1)
f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
if dw_detalle.accepttext()=-1 then return 1
choose case f_pregunta()
	case 1
		if grabar()=-1 then 
			setitem(1,1,actual)
			return 1
		end if
	case 2
		cambio=false
	case 3
		setitem(1,1,actual)
		return 1
end choose
accepttext()
docum_contable=getitemstring(1,1)
dw_historial.reset()
dw_detalle.reset()
dw_historial.retrieve(i_codemp,docum_contable)
end event

type dw_new from datawindow within w_plantilla_asiento
boolean visible = false
integer x = 27
integer y = 328
integer width = 1381
integer height = 104
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_plant_nueva"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

