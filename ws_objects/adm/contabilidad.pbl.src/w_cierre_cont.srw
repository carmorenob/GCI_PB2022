$PBExportHeader$w_cierre_cont.srw
forward
global type w_cierre_cont from w_center
end type
type dw_anyos from datawindow within w_cierre_cont
end type
type pb_new from picturebutton within w_cierre_cont
end type
type dw_cuentas from datawindow within w_cierre_cont
end type
type dw_detalle from datawindow within w_cierre_cont
end type
type pb_1 from picturebutton within w_cierre_cont
end type
type dw_uti_perd from datawindow within w_cierre_cont
end type
type dw_uti from datawindow within w_cierre_cont
end type
type pb_3 from picturebutton within w_cierre_cont
end type
type gb_1 from groupbox within w_cierre_cont
end type
type gb_2 from groupbox within w_cierre_cont
end type
end forward

global type w_cierre_cont from w_center
string tag = "Genero el cierre de Fin de año y no lo ha guardado, desea hacerlo ahora ?."
integer width = 3625
integer height = 2076
string title = "Contabilidad - Cierre de Fin de Año"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "cerrar.ico"
boolean clientedge = true
dw_anyos dw_anyos
pb_new pb_new
dw_cuentas dw_cuentas
dw_detalle dw_detalle
pb_1 pb_1
dw_uti_perd dw_uti_perd
dw_uti dw_uti
pb_3 pb_3
gb_1 gb_1
gb_2 gb_2
end type
global w_cierre_cont w_cierre_cont

type variables
string i_codemp
end variables

on w_cierre_cont.create
int iCurrent
call super::create
this.dw_anyos=create dw_anyos
this.pb_new=create pb_new
this.dw_cuentas=create dw_cuentas
this.dw_detalle=create dw_detalle
this.pb_1=create pb_1
this.dw_uti_perd=create dw_uti_perd
this.dw_uti=create dw_uti
this.pb_3=create pb_3
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_anyos
this.Control[iCurrent+2]=this.pb_new
this.Control[iCurrent+3]=this.dw_cuentas
this.Control[iCurrent+4]=this.dw_detalle
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.dw_uti_perd
this.Control[iCurrent+7]=this.dw_uti
this.Control[iCurrent+8]=this.pb_3
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.gb_2
end on

on w_cierre_cont.destroy
call super::destroy
destroy(this.dw_anyos)
destroy(this.pb_new)
destroy(this.dw_cuentas)
destroy(this.dw_detalle)
destroy(this.pb_1)
destroy(this.dw_uti_perd)
destroy(this.dw_uti)
destroy(this.pb_3)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;i_codemp=message.stringparm
f_revisa_clasif_cta(i_codemp)
dw_anyos.retrieve(i_codemp)
dw_uti_perd.retrieve(i_codemp)
dw_uti.retrieve(i_codemp)
if g_motor='postgres' then
	dw_detalle.dataobject='dw_cierre_postgres'
else
	dw_detalle.dataobject='dw_cierre'
end if
dw_detalle.settransobject(sqlca)
end event

type pb_grabar from w_center`pb_grabar within w_cierre_cont
integer x = 2382
integer y = 784
integer weight = 700
boolean enabled = false
vtextalign vtextalign = multiline!
string powertiptext = "Guardar Cierre [Alt+G]"
end type

event pb_grabar::clicked;call super::clicked;if dw_detalle.rowcount()=0 then return
w_comp_cont.dw_doc.setcolumn('coddoc')
w_comp_cont.dw_doc.settext('CI')
w_comp_cont.dw_doc.setitem(1,1,'CI')
w_comp_cont.dw_doc.event itemchanged(1,w_comp_cont.dw_doc.object.coddoc,'CI')
w_comp_cont.dw_doc.accepttext()
w_comp_cont.pb_new.event clicked()
w_comp_cont.dw_doc.accepttext()
w_comp_cont.dw_doc_cab.setitem(1,"cod_empresa",i_codemp)
w_comp_cont.dw_doc_cab.setitem(1,"cdoc",'CI')
w_comp_cont.dw_doc_cab.setitem(1,"ano",dw_anyos.getitemnumber(dw_anyos.getrow(),'ano'))
w_comp_cont.dw_doc_cab.setitem(1,"mes",13)
w_comp_cont.dw_doc_cab.setitem(1,"fecha",datetime(date(string(dw_anyos.getitemnumber(dw_anyos.getrow(),'ano'))+'-12-31')))
long j
w_comp_cont.dw_detalle.SETRedraw(false)
for j=1 to dw_detalle.rowcount()
	w_comp_cont.dw_detalle.insertrow(0)
	w_comp_cont.dw_detalle.setitem(j,'cp_cod_empresa',i_codemp)
	w_comp_cont.dw_detalle.setitem(j,'cp_ano',dw_anyos.getitemnumber(dw_anyos.getrow(),'ano'))
	w_comp_cont.dw_detalle.setitem(j,'cp_mes',13)
	w_comp_cont.dw_detalle.setitem(j,'cp_cdoc','CI')
	w_comp_cont.dw_detalle.setitem(j,'cp_secuencia',j)
	w_comp_cont.dw_detalle.setitem(j,'cp_cuenta',dw_detalle.getitemstring(j,'cuenta'))
	w_comp_cont.dw_detalle.setitem(j,'descrip',dw_detalle.getitemstring(j,'descrip'))
	w_comp_cont.dw_detalle.setitem(j,'cp_detalle',dw_detalle.getitemstring(j,'detalle'))
	w_comp_cont.dw_detalle.setitem(j,'tipodoc',dw_detalle.getitemstring(j,'tipodoc'))
	w_comp_cont.dw_detalle.setitem(j,'documento',dw_detalle.getitemstring(j,'nit'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_persona',dw_detalle.getitemstring(j,'terceros_persona'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_nombre1',dw_detalle.getitemstring(j,'terceros_nombre1'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_nombre2',dw_detalle.getitemstring(j,'terceros_nombre2'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_apellido1',dw_detalle.getitemstring(j,'terceros_apellido1'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_apellido2',dw_detalle.getitemstring(j,'terceros_apellido2'))
	w_comp_cont.dw_detalle.setitem(j,'terceros_razon_social',dw_detalle.getitemstring(j,'terceros_razon_social'))
	w_comp_cont.dw_detalle.setitem(j,'cp_dverificacion',dw_detalle.getitemstring(j,'dverificacion'))
	w_comp_cont.dw_detalle.setitem(j,'cp_valordeb',round(dw_detalle.getitemdecimal(j,'cierredeb'),w_comp_cont.i_dec_gral))
	w_comp_cont.dw_detalle.setitem(j,'cp_valorcred',round(dw_detalle.getitemdecimal(j,'cierrecred'),w_comp_cont.i_dec_gral))
	w_comp_cont.dw_detalle.setitem(j,'ccosto',dw_detalle.getitemstring(j,'pide_ccosto'))
	w_comp_cont.dw_detalle.setitem(j,'tercero',dw_detalle.getitemstring(j,'tercero'))
	w_comp_cont.dw_detalle.setitem(j,'lugar',dw_detalle.getitemstring(j,'lugar'))
	w_comp_cont.dw_detalle.setitem(j,'clugar',dw_detalle.getitemstring(j,'clugar'))
	w_comp_cont.dw_detalle.setitem(j,'naturaleza',dw_detalle.getitemstring(j,'naturaleza'))
	w_comp_cont.dw_detalle.setitem(j,'rfuente',dw_detalle.getitemstring(j,'rfuente'))
	if dw_detalle.getitemstring(j,'cufuncional')<>'' and not isnull(dw_detalle.getitemstring(j,'cufuncional')) then 
		w_comp_cont.dw_detalle.setitem(j,'cp_cufuncional',dw_detalle.getitemstring(j,'cufuncional'))
	end if
	if dw_detalle.getitemstring(j,'ccosto')<>'' and not isnull(dw_detalle.getitemstring(j,'ccosto')) then
		w_comp_cont.dw_detalle.setitem(j,'cp_ccosto',dw_detalle.getitemstring(j,'ccosto'))
	end if
	w_comp_cont.dw_detalle.setitem(j,'descripcion',dw_detalle.getitemstring(j,'descripcion'))
	w_comp_cont.dw_detalle.setitem(j,'descripcion',dw_detalle.getitemstring(j,'descripcion'))
	w_comp_cont.dw_detalle.setitem(j,'estado','0')
	w_comp_cont.dw_detalle.setitem(j,'base_desde',dw_detalle.getitemdecimal(j,'base'))
	w_comp_cont.dw_detalle.setitem(j,'porcentaje',dw_detalle.getitemdecimal(j,'porcentaje'))
	w_comp_cont.dw_detalle.setitem(j,'inicia',dw_detalle.getitemdatetime(j,'inicia'))
	w_comp_cont.dw_detalle.setitem(j,'termina',dw_detalle.getitemdatetime(j,'termina'))
	w_comp_cont.dw_detalle.setitem(j,'concep_ant',dw_detalle.getitemstring(j,'concep_ant'))
	w_comp_cont.dw_detalle.setitem(j,'desde_inter','1')
	w_comp_cont.dw_detalle.setitem(j,'corriente',dw_detalle.getitemstring(j,'corriente'))
	if dw_detalle.getitemstring(j,'corriente')='A' or isnull(dw_detalle.getitemstring(j,'corriente')) or dw_detalle.getitemstring(j,'corriente')='' then
		w_comp_cont.dw_detalle.setitem(j,'t_corriente','N')
	else
		w_comp_cont.dw_detalle.setitem(j,'t_corriente',dw_detalle.getitemstring(j,'corriente'))
	end if
	w_principal.setmicrohelp('Reg '+string(j)+' de '+string(dw_detalle.rowcount()))
next
w_comp_cont.cambio=true
w_comp_cont.dw_detalle.SETRedraw(true)
if w_comp_cont.grabar()=-1 then
	w_comp_cont.cambio=false
	w_comp_cont.dw_detalle.reset()
	rollback;
	return -1
else
	dw_anyos.setitem(dw_anyos.getrow(),'cierre_anyo','1')
	if dw_anyos.update()=-1 then
		rollback;
		return -1
	end if
	commit;
	cambio=false
	w_comp_cont.pb_new_otro.enabled=true
	close(parent)
end if
end event

type dw_anyos from datawindow within w_cierre_cont
integer x = 50
integer y = 64
integer width = 1207
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cierre_anyo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_new from picturebutton within w_cierre_cont
integer x = 1330
integer y = 24
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cerrar.GIF"
string disabledname = "d_cerrar.GIF"
alignment htextalign = left!
string powertiptext = "Cerrar el Año "
end type

event clicked;if dw_anyos.rowcount()=0 then return
if dw_anyos.getitemstring(dw_anyos.getrow(),'estado')='0' then
	messagebox("Atención","El último mes del año no se encuentra cerrado, debe cerrarlo para continuar")
	return
end if
if dw_anyos.getitemstring(1,'cierre_anyo')='1' then
	messagebox("Atención","El año ya se encuentra cerrado")
	return
end if
dw_cuentas.reset()
dw_cuentas.insertrow(1)
dw_cuentas.insertrow(1)
dw_cuentas.insertrow(1)
dw_cuentas.setitem(1,'label','Cta. Cancelación Cuentas de Resultado')
dw_cuentas.setitem(2,'label','Cta. Traslado Utilidades')
dw_cuentas.setitem(3,'label','Cta. Traslado Pérdidas')
if dw_uti.rowcount()>0 then
	dw_cuentas.setitem(1,'cta',dw_uti.getitemstring(1,'cuenta_cierre'))
	dw_cuentas.setitem(1,'des_cta',dw_uti.getitemstring(1,'descrip_2'))
	
	dw_cuentas.setitem(2,'cta',dw_uti.getitemstring(1,'cuenta_utilidad'))
	dw_cuentas.setitem(2,'des_cta',dw_uti.getitemstring(1,'descrip'))
	
	dw_cuentas.setitem(3,'cta',dw_uti.getitemstring(1,'cuenta_perdida'))
	dw_cuentas.setitem(3,'des_cta',dw_uti.getitemstring(1,'descrip_1'))
end if 
cambio=true
this.enabled=false
pb_1.enabled=true
pb_grabar.enabled=true

end event

type dw_cuentas from datawindow within w_cierre_cont
event keyup pbm_dwnkey
integer x = 32
integer y = 556
integer width = 2304
integer height = 468
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ctas_cierre"
boolean border = false
boolean livescroll = true
end type

event keyup;if key=keyapps! then
	this.triggerevent(rbuttondown!)
	return
end if
if this.getcolumnname()<>"cta" then return
f_busca_cuenta(key,i_codemp,this)


end event

event itemchanged;string tercero,rfuente,natu,otro,ccosto,descrip
setnull(natu)
otro=this.gettext()
if trim(otro)='' then return
select rfuente,tercero,naturaleza,ccosto,descrip into :rfuente,:tercero,:natu,:ccosto,:descrip from cont_plan where codtotal=:otro and cod_empresa=:i_codemp and movimiento='1';
if isnull(natu) then
	//this.setitem(this.getrow(),this.getcolumnname(),natu)
	return 1
else
	this.setitem(row,'des_cta',descrip)
	this.setitem(row,'natu',natu)
end if
end event

event itemfocuschanged;f_semovio(this,i_codemp,{'cta'})
end event

type dw_detalle from datawindow within w_cierre_cont
integer x = 27
integer y = 1072
integer width = 3488
integer height = 828
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cierre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//this.settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type pb_1 from picturebutton within w_cierre_cont
integer x = 2382
integer y = 632
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
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Generar datos del Comprobante"
end type

event clicked;if dw_anyos.rowcount()=0 then return
dw_cuentas.accepttext()
if isnull(dw_cuentas.getitemstring(1,'cta')) or dw_cuentas.getitemstring(1,'cta')='' then
	messagebox("Atención",'Digite la cuenta puente de cancelación de cuentas')
	dw_cuentas.scrolltorow(1)
	dw_cuentas.setcolumn('cta')
	dw_cuentas.setfocus()
	return
end if
if isnull(dw_cuentas.getitemstring(2,'cta')) or dw_cuentas.getitemstring(2,'cta')='' then
	messagebox("Atención",'Digite la cuenta de traslado de utilidades')
	dw_cuentas.scrolltorow(2)
	dw_cuentas.setcolumn('cta')
	dw_cuentas.setfocus()
	return
end if
if isnull(dw_cuentas.getitemstring(3,'cta')) or dw_cuentas.getitemstring(3,'cta')='' then
	messagebox("Atención",'Digite la cuenta de traslado de pérdidas')
	dw_cuentas.scrolltorow(3)
	dw_cuentas.setcolumn('cta')
	dw_cuentas.setfocus()
	return
end if
sqlca.autocommit=true
dw_detalle.retrieve(i_codemp,dw_anyos.getitemnumber(dw_anyos.getrow(),'ano'),w_comp_cont.i_dec_gral,dw_uti_perd.getitemstring(1,'cuenta_utilidad'),dw_uti_perd.getitemstring(1,'cuenta_perdida'))
sqlca.autocommit=false
dw_detalle.setfilter('cierredeb<>0 or cierrecred<>0')
dw_detalle.filter()
if dw_detalle.rowcount()>0 then
	decimal ingreso,gasto
	long donde,jj
	donde=dw_detalle.find('t_estado=""',1,dw_detalle.rowcount())
	if donde>0 then
		jj=dw_detalle.insertrow(0)
		if dw_detalle.getitemdecimal(donde,'cierredeb')>0 then //utilidad estan al contrario para que queden en cero
			dw_detalle.setitem(jj,'naturaleza',dw_cuentas.getitemstring(1,'natu'))
			dw_detalle.setitem(jj,'cuenta',dw_cuentas.getitemstring(1,'cta'))
			dw_detalle.setitem(jj,'descrip',dw_cuentas.getitemstring(1,'des_cta'))
			dw_detalle.setitem(jj,'detalle',upper('Cierre Utilidad del ejercicio'))
			dw_detalle.setitem(jj,'cierrecred',round(dw_detalle.getitemdecimal(donde,'cierredeb'),w_comp_cont.i_dec_gral))
		else//perdida
			dw_detalle.setitem(jj,'naturaleza',dw_cuentas.getitemstring(1,'natu'))
			dw_detalle.setitem(jj,'cuenta',dw_cuentas.getitemstring(1,'cta'))
			dw_detalle.setitem(jj,'descrip',dw_cuentas.getitemstring(1,'des_cta'))
			dw_detalle.setitem(jj,'detalle',upper('Cierre Pérdida del ejercicio'))
			dw_detalle.setitem(jj,'cierredeb', round(dw_detalle.getitemdecimal(donde,'cierrecred'),w_comp_cont.i_dec_gral))
		end if
	end if
	ingreso=round(dw_detalle.getitemnumber(1,'tingreso'),w_comp_cont.i_dec_gral)
	gasto=round(dw_detalle.getitemnumber(1,'tgasto'),w_comp_cont.i_dec_gral)
	if ingreso<>0 then
		donde=dw_detalle.insertrow(0)
		dw_detalle.setitem(donde,'naturaleza',dw_cuentas.getitemstring(1,'natu'))
		dw_detalle.setitem(donde,'cuenta',dw_cuentas.getitemstring(1,'cta'))
		dw_detalle.setitem(donde,'descrip',dw_cuentas.getitemstring(1,'des_cta'))
		if ingreso>0 then
			dw_detalle.setitem(donde,'detalle',upper('Cierre de ingresos'))
			dw_detalle.setitem(donde,'cierrecred',round(ingreso,w_comp_cont.i_dec_gral))	
		else
			dw_detalle.setitem(donde,'detalle',upper('Cierre de ingresos (Negativos)'))
			dw_detalle.setitem(donde,'cierredeb',round(-ingreso,w_comp_cont.i_dec_gral))	
		end if
	end if
	if gasto<>0 then
		donde=dw_detalle.insertrow(0)
		dw_detalle.setitem(donde,'naturaleza',dw_cuentas.getitemstring(1,'natu'))
		dw_detalle.setitem(donde,'cuenta',dw_cuentas.getitemstring(1,'cta'))
		dw_detalle.setitem(donde,'descrip',dw_cuentas.getitemstring(1,'des_cta'))
		if gasto>0 then
			dw_detalle.setitem(donde,'detalle',upper('Cierre de gastos'))
			dw_detalle.setitem(donde,'cierredeb',round(gasto,w_comp_cont.i_dec_gral))	
		else
			dw_detalle.setitem(donde,'detalle',upper('Cierre de gastos (Negativos)'))
			dw_detalle.setitem(donde,'cierrecred',round(-gasto,w_comp_cont.i_dec_gral))
		end if
	end if
	if ingreso - gasto<>0 then
		donde=dw_detalle.insertrow(0)
		if ingreso>gasto then //utilidad
			dw_detalle.setitem(donde,'cuenta',dw_cuentas.getitemstring(1,'cta'))
			dw_detalle.setitem(donde,'naturaleza',dw_cuentas.getitemstring(1,'natu'))
			dw_detalle.setitem(donde,'descrip',dw_cuentas.getitemstring(1,'des_cta'))
			dw_detalle.setitem(donde,'detalle',upper('Cierre de Utilidad'))
			dw_detalle.setitem(donde,'cierredeb',round((ingreso - gasto),w_comp_cont.i_dec_gral))
			donde=dw_detalle.insertrow(0)
			dw_detalle.setitem(donde,'naturaleza',dw_cuentas.getitemstring(2,'natu'))
			dw_detalle.setitem(donde,'cuenta',dw_cuentas.getitemstring(2,'cta'))
			dw_detalle.setitem(donde,'descrip',dw_cuentas.getitemstring(2,'des_cta'))
			dw_detalle.setitem(donde,'detalle',upper('Utilidad del ejercicio'))
			dw_detalle.setitem(donde,'cierrecred',round((ingreso - gasto),w_comp_cont.i_dec_gral))
		else //perdida
			dw_detalle.setitem(donde,'cuenta',dw_cuentas.getitemstring(1,'cta'))
			dw_detalle.setitem(donde,'naturaleza',dw_cuentas.getitemstring(1,'natu'))
			dw_detalle.setitem(donde,'descrip',dw_cuentas.getitemstring(1,'des_cta'))
			dw_detalle.setitem(donde,'detalle',upper('Cierre de pérdida'))
			dw_detalle.setitem(donde,'cierrecred',round((gasto -ingreso),w_comp_cont.i_dec_gral))
			donde=dw_detalle.insertrow(0)
			dw_detalle.setitem(donde,'naturaleza',dw_cuentas.getitemstring(3,'natu'))
			dw_detalle.setitem(donde,'cuenta',dw_cuentas.getitemstring(3,'cta'))
			dw_detalle.setitem(donde,'descrip',dw_cuentas.getitemstring(3,'des_cta'))
			dw_detalle.setitem(donde,'detalle',upper('Pérdida del ejercicio'))
			dw_detalle.setitem(donde,'cierredeb', round((gasto - ingreso),w_comp_cont.i_dec_gral))
		end if
	end if
end if
end event

type dw_uti_perd from datawindow within w_cierre_cont
boolean visible = false
integer x = 2606
integer y = 128
integer width = 782
integer height = 296
integer taborder = 170
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ctas_uti_perd"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_uti from datawindow within w_cierre_cont
boolean visible = false
integer x = 2619
integer y = 468
integer width = 686
integer height = 400
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ctas_uti_perd_desc"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_3 from picturebutton within w_cierre_cont
integer x = 2386
integer y = 932
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "export.GIF"
string disabledname = "d_export.GIF"
alignment htextalign = left!
string powertiptext = "Exportar Comprobante"
end type

event clicked;openwithparm(w_export,dw_detalle)

end event

type gb_1 from groupbox within w_cierre_cont
integer x = 14
integer width = 1280
integer height = 492
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año a cerrar:"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_cierre_cont
integer x = 5
integer y = 504
integer width = 2341
integer height = 540
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cuentas de traslados:"
borderstyle borderstyle = styleraised!
end type

