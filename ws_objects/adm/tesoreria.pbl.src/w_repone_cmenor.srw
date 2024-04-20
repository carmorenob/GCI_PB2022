$PBExportHeader$w_repone_cmenor.srw
forward
global type w_repone_cmenor from w_center
end type
type dw_cajas from datawindow within w_repone_cmenor
end type
type tab_2 from tab within w_repone_cmenor
end type
type tp2_d from userobject within tab_2
end type
type pb_1 from picturebutton within tp2_d
end type
type dw_intfaz from datawindow within tp2_d
end type
type tp2_d from userobject within tab_2
pb_1 pb_1
dw_intfaz dw_intfaz
end type
type tp2_1 from userobject within tab_2
end type
type dw_det_gasto from datawindow within tp2_1
end type
type pb_llevar from picturebutton within tp2_1
end type
type dw_pend from datawindow within tp2_1
end type
type tp2_1 from userobject within tab_2
dw_det_gasto dw_det_gasto
pb_llevar pb_llevar
dw_pend dw_pend
end type
type tp2_b from userobject within tab_2
end type
type pb_save from picturebutton within tp2_b
end type
type dw_reserv from datawindow within tp2_b
end type
type tp2_b from userobject within tab_2
pb_save pb_save
dw_reserv dw_reserv
end type
type tp2_2 from userobject within tab_2
end type
type st_3 from statictext within tp2_2
end type
type st_2 from statictext within tp2_2
end type
type dw_subdet from datawindow within tp2_2
end type
type dw_det from datawindow within tp2_2
end type
type tp2_2 from userobject within tab_2
st_3 st_3
st_2 st_2
dw_subdet dw_subdet
dw_det dw_det
end type
type tab_2 from tab within w_repone_cmenor
tp2_d tp2_d
tp2_1 tp2_1
tp2_b tp2_b
tp2_2 tp2_2
end type
type dw_orig from datawindow within w_repone_cmenor
end type
type st_7 from statictext within w_repone_cmenor
end type
type dw_cab from datawindow within w_repone_cmenor
end type
type st_4 from statictext within w_repone_cmenor
end type
type dw_rel_orig from datawindow within w_repone_cmenor
end type
type dw_rub from datawindow within w_repone_cmenor
end type
type pb_2 from pb_report within w_repone_cmenor
end type
type pb_3 from picturebutton within w_repone_cmenor
end type
type dw_int_op from datawindow within w_repone_cmenor
end type
end forward

global type w_repone_cmenor from w_center
integer width = 4343
integer height = 2464
string title = "Reposición de caja menor"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_reponecm.ico"
boolean center = false
dw_cajas dw_cajas
tab_2 tab_2
dw_orig dw_orig
st_7 st_7
dw_cab dw_cab
st_4 st_4
dw_rel_orig dw_rel_orig
dw_rub dw_rub
pb_2 pb_2
pb_3 pb_3
dw_int_op dw_int_op
end type
global w_repone_cmenor w_repone_cmenor

type variables
datawindowchild idw_caja,idw_orig,idw_concep,idw_cuenta
boolean i_nuevo
string i_lugar,i_emp,i_caja,i_cdoc='RP',i_ppto,i_flujo
int i_dec_gral,i_aprox_gral
end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();return 1

end function

on w_repone_cmenor.create
int iCurrent
call super::create
this.dw_cajas=create dw_cajas
this.tab_2=create tab_2
this.dw_orig=create dw_orig
this.st_7=create st_7
this.dw_cab=create dw_cab
this.st_4=create st_4
this.dw_rel_orig=create dw_rel_orig
this.dw_rub=create dw_rub
this.pb_2=create pb_2
this.pb_3=create pb_3
this.dw_int_op=create dw_int_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cajas
this.Control[iCurrent+2]=this.tab_2
this.Control[iCurrent+3]=this.dw_orig
this.Control[iCurrent+4]=this.st_7
this.Control[iCurrent+5]=this.dw_cab
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.dw_rel_orig
this.Control[iCurrent+8]=this.dw_rub
this.Control[iCurrent+9]=this.pb_2
this.Control[iCurrent+10]=this.pb_3
this.Control[iCurrent+11]=this.dw_int_op
end on

on w_repone_cmenor.destroy
call super::destroy
destroy(this.dw_cajas)
destroy(this.tab_2)
destroy(this.dw_orig)
destroy(this.st_7)
destroy(this.dw_cab)
destroy(this.st_4)
destroy(this.dw_rel_orig)
destroy(this.dw_rub)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.dw_int_op)
end on

event open;call super::open;if dw_cab.rowcount()<1 then return

SELECT ENTERO into :i_dec_gral
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

type pb_grabar from w_center`pb_grabar within w_repone_cmenor
boolean visible = false
integer x = 3104
integer y = 524
end type

event pb_grabar::clicked;call super::clicked;if not i_nuevo then return
if grabar()=-1 then
	rollback;
else
	commit;
end if
dw_cajas.setcolumn('codcaja')
dw_cajas.event itemchanged(1,dw_cajas.object.codcaja,dw_cajas.getitemstring(1,2))

end event

type dw_cajas from datawindow within w_repone_cmenor
integer x = 32
integer y = 28
integer width = 1527
integer height = 144
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_caja_menor"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild("codcaja",idw_caja)
idw_caja.settransobject(sqlca)
idw_caja.insertrow(1)
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
		i_nuevo=false
		cambio=false
	case 3
		setitem(1,getcolumnname(),actual)
		return 1
end choose
accepttext()
dw_cab.reset()
tab_2.tp2_1.dw_pend.reset()
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
	idw_cuenta.retrieve(i_emp)
	idw_caja.retrieve(i_lugar)
	setitem(1,"codcaja",'')
	dw_cab.reset()
	tab_2.tp2_1.dw_pend.reset()
else
	i_caja=getitemstring(1,"codcaja")
	i_ppto=idw_caja.getitemstring(idw_caja.getrow(),"presupuesto")
	dw_orig.event itemchanged(1,dw_orig.object.codigo,dw_orig.getitemstring(1,1))
	idw_concep.retrieve(i_emp,'M','%')
	dw_cab.dataobject='dw_repo_cmen_cab'
	dw_cab.settransobject(sqlca)
	dw_cab.retrieve(i_lugar,i_caja)
	tab_2.tp2_1.dw_pend.retrieve(i_lugar,i_caja)
	if (dw_rub.retrieve(i_caja,i_lugar)=0) and  (i_ppto='1') then
		messagebox('Atención','La caja menor no tiene rubros programados')
		return
	else
		tab_2.tp2_d.enabled=true
		tab_2.tp2_1.enabled=true
	end if
end if
end event

type tab_2 from tab within w_repone_cmenor
integer x = 32
integer y = 692
integer width = 4178
integer height = 1592
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
alignment alignment = center!
integer selectedtab = 1
tp2_d tp2_d
tp2_1 tp2_1
tp2_b tp2_b
tp2_2 tp2_2
end type

on tab_2.create
this.tp2_d=create tp2_d
this.tp2_1=create tp2_1
this.tp2_b=create tp2_b
this.tp2_2=create tp2_2
this.Control[]={this.tp2_d,&
this.tp2_1,&
this.tp2_b,&
this.tp2_2}
end on

on tab_2.destroy
destroy(this.tp2_d)
destroy(this.tp2_1)
destroy(this.tp2_b)
destroy(this.tp2_2)
end on

type tp2_d from userobject within tab_2
integer x = 18
integer y = 112
integer width = 4142
integer height = 1464
long backcolor = 67108864
string text = "Disponibilidades"
long tabtextcolor = 33554432
string picturename = "calculator.ico"
long picturemaskcolor = 536870912
string powertiptext = "Disponibilidades "
pb_1 pb_1
dw_intfaz dw_intfaz
end type

on tp2_d.create
this.pb_1=create pb_1
this.dw_intfaz=create dw_intfaz
this.Control[]={this.pb_1,&
this.dw_intfaz}
end on

on tp2_d.destroy
destroy(this.pb_1)
destroy(this.dw_intfaz)
end on

type pb_1 from picturebutton within tp2_d
integer x = 2162
integer y = 1304
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
string disabledname = "d_ultimo.gif"
string powertiptext = "Crear nueva Reposición"
end type

event clicked;long j,donde,vig,ll_newrow,l_k
string rubro
dec valor

if tab_2.tp2_d.dw_intfaz.getitemnumber(1,'total')=0 then 
	if i_ppto='0' then
		if messagebox('Atención','Está seguro que desa realizar esta reposición sin aumentar el monto de la caja menor ? (Esto se debe hacer para el cierre de la caja)',question!,yesno!,2)=2 then 
			return
		else
			ll_newrow=	tab_2.tp2_b.dw_reserv.insertrow(0)
			tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'coddoc','')
			tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'ntransferencia','')
			tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'item',1)
			tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'v_bruto',0)
			tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'detalle','')			
			tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'acumul',0)
		end if
	end if
else
	for j=1 to dw_intfaz.rowcount()
		if dw_intfaz.getitemnumber(j,'esco')=1 then
			If i_ppto='1' then
				vig=dw_intfaz.getitemnumber(j,'cod_vigencia')
				rubro=dw_intfaz.getitemstring(j,'codtotal')
				donde=dw_rub.find("cod_vigencia ="+string(vig)+" and codtotal_presu='"+rubro+"'",1,dw_rub.rowcount())
				if donde=0 then
					messagebox('Atención','El rubro '+rubro+' no se encuentra en los rubros de la Caja')
					return
				end if
				valor=dw_intfaz.getitemnumber(j,'valor')
				if dw_rub.getitemnumber(donde,'monto')+dw_rub.getitemnumber(donde,'acumul')+valor>dw_rub.getitemnumber(donde,'monto_anual') then
					if messagebox('Atención','El rubro '+rubro +' sobrepasará el monto anual, desea continuar aún así?',question!,yesno!,2)=2 then return
				end if
				if dw_rub.getitemnumber(donde,'monto')-dw_rub.getitemnumber(donde,'consumido')+dw_rub.getitemnumber(donde,'acumul')+valor>dw_rub.getitemnumber(donde,'monto_base') then
					if messagebox('Atención','El rubro '+rubro +' sobrepasará el monto base, desea continuar aún así?',question!,yesno!,2)=2 then return
				end if
				dw_rub.setitem(donde,'acumul',dw_rub.getitemnumber(donde,'acumul')+valor)
			else
				ll_newrow=	tab_2.tp2_b.dw_reserv.insertrow(0)
				tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'coddoc',dw_intfaz.getitemstring(j,'coddoc'))
				tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'ntransferencia',dw_intfaz.getitemnumber(j,'ntransferencia'))
				tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'item',dw_intfaz.getitemnumber(j,'item'))
				tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'v_bruto',dw_intfaz.getitemnumber(j,'v_bruto'))
				tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'detalle',dw_intfaz.getitemstring(j,'detalle'))			
				tab_2.tp2_b.dw_reserv.setitem(ll_newrow,'acumul',0)
			end  if
					
			l_k=dw_int_op.insertrow(0)
			dw_int_op.setitem(l_k,'codigo','PTRFCRP')
			dw_int_op.setitem(l_k,'num_orig1',dw_intfaz.getitemnumber(j,'ntransferencia'))
			dw_int_op.setitem(l_k,'char_orig1',dw_intfaz.getitemstring(j,'coddoc'))
			dw_int_op.setitem(l_k,'char_orig2',dw_intfaz.getitemstring(j,'clugar'))
			if i_ppto='1' then 
				dw_int_op.setitem(l_k,'cod_vigencia',dw_intfaz.getitemnumber(j,'cod_vigencia'))
				dw_int_op.setitem(l_k,'codtotal',dw_intfaz.getitemstring(j,'codtotal'))
				dw_int_op.setitem(l_k,'valor',round(dw_intfaz.getitemnumber(j,'valor'),2))
			else
				dw_int_op.setitem(l_k,'num_orig2',dw_intfaz.getitemnumber(j,'item'))
				dw_int_op.setitem(l_k,'valor',round(dw_intfaz.getitemnumber(j,'v_bruto'),2))
			end if
			
		end if
	next
end if
tab_2.tp2_1.enabled=true
tab_2.selectedtab=2
tab_2.tp2_d.pb_1.enabled=false
tab_2.tp2_d.enabled=false

end event

type dw_intfaz from datawindow within tp2_d
integer x = 50
integer y = 56
integer width = 4041
integer height = 1232
integer taborder = 40
string dataobject = "dw_reserv_a_cmen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long sel,nd,i
sel=long(data)
nd = GetItemNumber(GetRow(),'ntransferencia')
for i = 1 to rowCount()
	if GetItemNumber(i,'ntransferencia') = nd then
		SetItem(i,'esco',sel)
	end if
next
tab_2.tp2_1.enabled=false
end event

type tp2_1 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 4142
integer height = 1464
boolean enabled = false
long backcolor = 67108864
string text = "Gastos sin Legalizar"
long tabtextcolor = 33554432
string picturename = "pagos.ico"
long picturemaskcolor = 536870912
string powertiptext = "Gastos pendientes de realizar reposición"
dw_det_gasto dw_det_gasto
pb_llevar pb_llevar
dw_pend dw_pend
end type

on tp2_1.create
this.dw_det_gasto=create dw_det_gasto
this.pb_llevar=create pb_llevar
this.dw_pend=create dw_pend
this.Control[]={this.dw_det_gasto,&
this.pb_llevar,&
this.dw_pend}
end on

on tp2_1.destroy
destroy(this.dw_det_gasto)
destroy(this.pb_llevar)
destroy(this.dw_pend)
end on

type dw_det_gasto from datawindow within tp2_1
integer x = 5
integer y = 1064
integer width = 3936
integer height = 368
integer taborder = 40
string title = "none"
string dataobject = "dw_concep_cmen"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_llevar from picturebutton within tp2_1
integer x = 3973
integer y = 36
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "ultimo.gif"
string disabledname = "d_ultimo.gif"
string powertiptext = "Crear nueva Reposición"
end type

event clicked;if dw_pend.rowcount()=0 then return
if dw_pend.getitemnumber(1,'total')=0 then return
If i_ppto='1' then
	if tab_2.tp2_b.dw_reserv.retrieve(i_caja)=0  then return
End If	
dw_cab.dataobject='dw_repo_cab_new'
dw_cab.settransobject(sqlca)
dw_cab.border=false
dw_cab.insertrow(1)
dw_cab.setitem(1,'valor',dw_pend.getitemnumber(1,'total'))
dw_cab.setitem(1,'fecha_recibo',datetime(today(),now()))

long j,k,vig,donde
string rubro
dec valor

for j=1 to dw_pend.rowcount()
	if dw_pend.getitemnumber(j,'esco')=0 then continue
	dw_pend.setrow(j)
	for k=1 to dw_det_gasto.rowcount()
		if  i_ppto='1'  then
			vig=dw_det_gasto.getitemnumber(k,'cod_vigencia')
			rubro=dw_det_gasto.getitemstring(k,'codtotal_presu')
			valor=dw_det_gasto.getitemnumber(k,'tneto')
			donde=tab_2.tp2_b.dw_reserv.find("cod_vigencia="+string(vig)+" and codtotal='"+rubro+"' and acumul<monto_vigente - monto_utilizado",1,tab_2.tp2_b.dw_reserv.rowcount())
			do while valor>0
				if donde=0 then
					messagebox('Atención','No se puede encontrar una reserva con monto suficiente para girar del rubro '+rubro)
					return
				end if
				if valor>tab_2.tp2_b.dw_reserv.getitemnumber(donde,'v_queda') then
					valor=round(valor - tab_2.tp2_b.dw_reserv.getitemnumber(donde,'v_queda'), i_dec_gral)
					tab_2.tp2_b.dw_reserv.setitem(donde,'acumul',tab_2.tp2_b.dw_reserv.getitemnumber(donde,'acumul')+tab_2.tp2_b.dw_reserv.getitemnumber(donde,'v_queda'))
					donde=tab_2.tp2_b.dw_reserv.find("cod_vigencia="+string(vig)+" and codtotal='"+rubro+"' and acumul<monto_vigente - monto_utilizado",1,tab_2.tp2_b.dw_reserv.rowcount())
				else
					tab_2.tp2_b.dw_reserv.setitem(donde,'acumul',tab_2.tp2_b.dw_reserv.getitemnumber(donde,'acumul')+valor)
					valor=0
				end if
			loop
		Else //ppto
			valor=round(dw_det_gasto.getitemnumber(k,'tneto'), i_dec_gral)
			tab_2.tp2_b.dw_reserv.setitem(1,'acumul',tab_2.tp2_b.dw_reserv.getitemnumber(1,'acumul')+valor)
		End If
	next
next
datawindow dw_t
dw_t=tab_2.tp2_2.dw_det
	
dw_t.reset()
for j=1 to dw_pend.rowcount()
	if dw_pend.getitemnumber(j,'esco')=1 then
		k=dw_t.insertrow(0)
		dw_t.setitem(k,'codcaja',dw_pend.getitemstring(j,'codcaja'))
		dw_t.setitem(k,'clugar',dw_pend.getitemstring(j,'clugar'))
		dw_t.setitem(k,'coddoc',dw_pend.getitemstring(j,'coddoc'))
		dw_t.setitem(k,'ngasto',dw_pend.getitemnumber(j,'ngasto'))
		dw_t.setitem(k,'concepto',dw_pend.getitemstring(j,'concepto'))
		dw_t.setitem(k,'fecha',dw_pend.getitemdatetime(j,'fecha'))
		dw_t.setitem(k,'tipodoc',dw_pend.getitemstring(j,'tipodoc'))
		dw_t.setitem(k,'documento',dw_pend.getitemstring(j,'documento'))
		dw_t.setitem(k,'prefijo_fac',dw_pend.getitemstring(j,'prefijo_fac'))
		dw_t.setitem(k,'num_fact',dw_pend.getitemnumber(j,'num_fact'))
		dw_t.setitem(k,'val_bruto',dw_pend.getitemnumber(j,'val_bruto'))
		dw_t.setitem(k,'t_bruto',dw_pend.getitemnumber(j,'t_bruto'))
		dw_t.setitem(k,'neto_pagar',dw_pend.getitemnumber(j,'neto_pagar'))
	end if
next
dw_t.resetupdate()
dw_t.event rowfocuschanged(1)
tab_2.selectedtab=3
tab_2.tp2_b.enabled=true
tab_2.tp2_b.pb_save.enabled=true
end event

type dw_pend from datawindow within tp2_1
integer y = 32
integer width = 3945
integer height = 988
integer taborder = 30
string title = "none"
string dataobject = "dw_gastos_cmenor_sinrep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event buttonclicked;long dato=0,j,actual
if dwo.text='Selecc.' then
	dwo.text='Desel.'
	dato=1
else
	dwo.text='Selecc.'
end if
actual=getrow()
setredraw(false)
dw_det_gasto.setredraw(false)
for j=1 to rowcount()
	if getitemnumber(j,'esco')<>dato then
		setitem(j,'esco',dato)
	end if
next
scrolltorow(actual)
setredraw(true)
dw_det_gasto.setredraw(true)
end event

event rowfocuschanged;dw_det_gasto.reset()
if getrow()<1 then return
dw_det_gasto.retrieve(i_caja,i_lugar,'GME',getitemnumber(getrow(),'ngasto'))
end event

type tp2_b from userobject within tab_2
integer x = 18
integer y = 112
integer width = 4142
integer height = 1464
long backcolor = 67108864
string text = "Interfaz"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Dtaos de Reservas"
pb_save pb_save
dw_reserv dw_reserv
end type

on tp2_b.create
this.pb_save=create pb_save
this.dw_reserv=create dw_reserv
this.Control[]={this.pb_save,&
this.dw_reserv}
end on

on tp2_b.destroy
destroy(this.pb_save)
destroy(this.dw_reserv)
end on

type pb_save from picturebutton within tp2_b
integer x = 3954
integer y = 60
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar la Reposición"
end type

event clicked;if dw_reserv.rowcount()=0 then return
if dw_reserv.getitemnumber(1,'tacumul')=0 then return
if tab_2.tp2_d.dw_intfaz.rowcount()=0 and  i_ppto='1'  then 
	if messagebox('Atención','Está seguro que desa realizar esta reposición sin aumentar el monto de la caja menor ? (Esto se debe hacer para el cierre de la caja)',question!,yesno!,2)=2 then return
else
	if tab_2.tp2_d.dw_intfaz.getitemnumber(1,'total')=0 then 
		if messagebox('Atención','Está seguro que desa realizar esta reposición sin aumentar el monto de la caja menor ? (Esto se debe hacer para el cierre de la caja)',question!,yesno!,2)=2 then return
	end if
end if

long j,k,item,nrepo,npago
string err,cdoc_pago,clug_pago
datawindow dw_t
nrepo=f_trae_ndoc(i_cdoc,i_lugar,'Reposición de caja Menor')
if nrepo=-1 then return -1
dw_cab.setitem(1,'nreposicion',nrepo)
dw_cab.setitem(1,'clugar',i_lugar)
dw_cab.setitem(1,'coddoc',i_cdoc)
dw_cab.setitem(1,'codcaja',i_caja)
dw_cab.setitem(1,'clug_caja',i_lugar)
dw_cab.setitem(1,'cod_flujo',i_flujo)
dw_cab.setitem(1,'usuario',usuario)
if isnull(dw_cab.getitemstring(1,'concepto')) then 
	dw_cab.setitem(1,'concepto','REPOSICION DE CAJA MENOR'+i_cdoc+' -'+i_lugar+'-'+string(nrepo))
end if

dw_t=tab_2.tp2_2.dw_det
for j=1 to dw_t.rowcount()
	dw_t.setitem(j,'clugar_rep',i_lugar)
	dw_t.setitem(j,'coddoc_rep',i_cdoc)
	dw_t.setitem(j,'nreposicion',nrepo)
next
if dw_cab.update(true,false)=-1 then return
if dw_t.update(true,false)=-1 then return
dw_rel_orig.reset()
for j=1 to dw_reserv.rowcount()
	if dw_reserv.getitemnumber(j,'acumul')=0 then continue
	k=dw_rel_orig.insertrow(0)
	dw_rel_orig.setitem(k,'codigo',i_flujo)
	select max(item) into :item from mod_relacion_origen where codigo=:i_flujo;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo mod_relacion_origen',err)
		return
	end if
	if isnull(item) then item=0
	item ++
	dw_rel_orig.setitem(k,'item',item)
	dw_rel_orig.setitem(k,'char_doc1',i_lugar)
	dw_rel_orig.setitem(k,'char_doc2',i_cdoc)
	dw_rel_orig.setitem(k,'num_doc1',nrepo)
	dw_rel_orig.setitem(k,'char_orig1',dw_reserv.getitemstring(j,'coddoc'))
	dw_rel_orig.setitem(k,'char_orig2',dw_reserv.getitemstring(j,'clugar'))
	if  i_ppto='1' then
		dw_rel_orig.setitem(k,'num_orig1',dw_reserv.getitemnumber(j,'numdoc'))
	else
		dw_rel_orig.setitem(k,'num_orig1',dw_reserv.getitemnumber(j,'ntransferencia'))
	end if
	dw_rel_orig.setitem(k,'num_orig2',dw_reserv.getitemnumber(j,'item'))
	dw_rel_orig.setitem(k,'valor',dw_reserv.getitemnumber(j,'acumul'))
	if dw_rel_orig.update()=-1 then return
next

dw_int_op.reset()
select max(item) into :item from mod_relacion_origen
where codigo = 'PTRFCRP';
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error leyendo mod_relacion_origen',err)
	return
end if
if isNull(item) then item = 0
for j = 1 to dw_int_op.RowCount()
	item = item + 1
	dw_int_op.SetItem(j,'item',item)
	dw_int_op.SetItem(j,'num_doc1',nrepo)
	dw_int_op.setitem(j,'char_doc1',i_cdoc)
	dw_int_op.setitem(j,'char_doc2',i_lugar)
next

double acumulados
If i_ppto='1' then 
	acumulados=0
	for j=1 to dw_rub.rowcount()
		if dw_rub.getitemnumber(j,'acumul')=0 then continue
		acumulados=acumulados+dw_rub.getitemnumber(j,'acumul')+dw_rub.getitemnumber(j,'monto_ori')
		dw_rub.setitem(j,'monto',dw_rub.getitemnumber(j,'monto_ori')+dw_rub.getitemnumber(j,'acumul'))
	next
	if dw_rub.update(true,false)=-1 then return
else
	acumulados=dw_reserv.getitemnumber(1,'total')
end If

if  i_ppto='1' then 
	dw_t=tab_2.tp2_d.dw_intfaz
	for j=1 to dw_t.rowcount()
		if dw_t.getitemnumber(j,'esco')=0 then continue
		cdoc_pago=dw_t.getitemstring(j,'coddoc')
		clug_pago=dw_t.getitemstring(j,'clugar')
		npago=dw_t.getitemnumber(j,'ntransferencia')
		update tesotranscab set en_destino='1' 
		where clugar =:clug_pago and coddoc =:cdoc_pago and ntransferencia=:npago;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando tesotranscab',err)
			return
		end if
	next
else
	for j=1 to dw_reserv.rowcount()
		if dw_reserv.getitemnumber(j,'esco')=0 then continue
		cdoc_pago=dw_reserv.getitemstring(j,'coddoc')
		clug_pago=dw_reserv.getitemstring(j,'clugar')
		npago=dw_reserv.getitemnumber(j,'ntransferencia')
		update tesotranscab set en_destino='1' 
		where clugar =:clug_pago and coddoc =:cdoc_pago and ntransferencia=:npago;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando tesotranscab',err)
			return
		end if
	next
end if

if dw_int_op.update(true,false)=-1 then return

UPDATE tesocajamenor SET efectivo = :acumulados+efectivo
WHERE (((tesocajamenor.codcaja)=:i_caja) AND ((tesocajamenor.CLugar)=:i_lugar));
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando tesocajamenor',err)
	return
end if
commit;
tab_2.tp2_d.pb_1.enabled=true
tab_2.tp2_d.enabled=true
dw_rub.resetupdate()
dw_cab.resetupdate()
tab_2.tp2_2.dw_det.resetupdate()
dw_cajas.setcolumn('codcaja')
dw_cajas.event itemchanged(1,dw_cajas.object.codcaja,dw_cajas.getitemstring(1,'codcaja'))
enabled=false
end event

type dw_reserv from datawindow within tp2_b
integer x = 23
integer y = 60
integer width = 3895
integer height = 1372
integer taborder = 40
string title = "none"
string dataobject = "dw_reser_cmen_a_giro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event dberror;rollback;
return 0
end event

type tp2_2 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 4142
integer height = 1464
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "pesos_deta.ico"
long picturemaskcolor = 536870912
string powertiptext = "Detalle de la reposición "
st_3 st_3
st_2 st_2
dw_subdet dw_subdet
dw_det dw_det
end type

on tp2_2.create
this.st_3=create st_3
this.st_2=create st_2
this.dw_subdet=create dw_subdet
this.dw_det=create dw_det
this.Control[]={this.st_3,&
this.st_2,&
this.dw_subdet,&
this.dw_det}
end on

on tp2_2.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_subdet)
destroy(this.dw_det)
end on

type st_3 from statictext within tp2_2
integer x = 5
integer y = 1020
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle del Gasto:"
boolean focusrectangle = false
end type

type st_2 from statictext within tp2_2
integer x = 5
integer width = 544
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gastos de la Reposición:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_subdet from datawindow within tp2_2
integer x = 9
integer y = 1096
integer width = 4110
integer height = 348
integer taborder = 40
string title = "none"
string dataobject = "dw_concep_cmen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type dw_det from datawindow within tp2_2
integer y = 52
integer width = 4123
integer height = 924
integer taborder = 30
string title = "none"
string dataobject = "dw_gastos_repo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_subdet.reset()
if getrow()<1 then return
dw_subdet.retrieve(i_caja,i_lugar,'GME',getitemnumber(getrow(),'ngasto'))
end event

event constructor;settransobject(sqlca)

end event

event dberror;rollback;
return 0
end event

type dw_orig from datawindow within w_repone_cmenor
integer x = 1554
integer y = 76
integer width = 1353
integer height = 84
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_destino"
boolean border = false
boolean livescroll = true
end type

event constructor;object.codigo.width=1440
getchild('codigo',idw_orig)
idw_orig.settransobject(sqlca)
idw_orig.retrieve(i_cdoc)
insertrow(1)
if idw_orig.rowcount()=1 then 
	setitem(1,1,idw_orig.getitemstring(1,'codigo'))
//	post event itemchanged(1,object.codigo,idw_orig.getitemstring(1,'codigo'))
end if


end event

event itemchanged;if isnull(data) then return
choose case data
	case 'RPPTPG'
		tab_2.tp2_d.visible=true
		tab_2.tp2_d.text='Ordenes de Pago'
		tab_2.tp2_d.dw_intfaz.dataobject='dw_reserv_a_cmen'
		tab_2.tp2_d.dw_intfaz.settransobject(sqlca)
		tab_2.tp2_d.dw_intfaz.retrieve('PR','RP',i_caja)
		i_flujo= 'RPPTPG'
	case 'RPPT-'
		tab_2.tp2_1.visible=true
		tab_2.tp2_d.text='Ordenes de Pago'
		tab_2.tp2_b.dw_reserv.dataobject='dw_repos_sin_reserva'
		tab_2.tp2_b.dw_reserv.settransobject(sqlca)
		tab_2.tp2_d.dw_intfaz.dataobject='dw_repos_sin_reserva'
		tab_2.tp2_d.dw_intfaz.settransobject(sqlca)
		tab_2.tp2_d.dw_intfaz.retrieve()
		//tab_2.selectedtab=2
		i_flujo= 'RPPT-'
	case else
		messagebox('Atención','Este flujo no se encuentra programado')
		setitem(1,1,'')
		settext('')
end choose
end event

type st_7 from statictext within w_repone_cmenor
integer x = 1559
integer y = 28
integer width = 178
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Origen:"
boolean focusrectangle = false
end type

type dw_cab from datawindow within w_repone_cmenor
integer x = 46
integer y = 224
integer width = 2981
integer height = 444
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_repo_cmen_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_2.tp2_2.dw_det.reset()
if getrow()<1 then return
tab_2.tp2_2.dw_det.retrieve(getitemstring(getrow(),'clugar'),getitemstring(getrow(),'coddoc'),getitemnumber(getrow(),'nreposicion'))

end event

event dberror;rollback;
return 0
end event

type st_4 from statictext within w_repone_cmenor
integer x = 41
integer y = 164
integer width = 1024
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de reposiciones de la Caja por origen:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_rel_orig from datawindow within w_repone_cmenor
boolean visible = false
integer x = 3438
integer y = 188
integer width = 114
integer height = 88
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_mod_rel_orig"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type dw_rub from datawindow within w_repone_cmenor
boolean visible = false
integer x = 3506
integer y = 540
integer width = 283
integer height = 120
integer taborder = 20
string title = "none"
string dataobject = "dw_dispocp_cajame"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type pb_2 from pb_report within w_repone_cmenor
integer x = 3099
integer y = 228
integer taborder = 30
boolean bringtotop = true
string text = "        &p"
string cod_rep = "RP"
string nombre_rep = "Reposicion caja Menor"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if dw_cab.rowcount()<1 then return
any par[3]
par[1]=dw_cab.getitemstring(dw_cab.getrow(),"coddoc")
par[2]=dw_cab.getitemstring(dw_cab.getrow(),"clugar")
par[3]=dw_cab.getitemnumber(dw_cab.getrow(),"nreposicion")
imprimir(par,'','0')

end event

type pb_3 from picturebutton within w_repone_cmenor
integer x = 3099
integer y = 376
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
end type

event clicked;if dw_cab.rowcount()=0 then return
if dw_cab.getitemstring(dw_cab.getrow(),'contabil')='C' then
	messagebox('Atención',"Documento Contabilizado no ese puede Anular")
	return
end if
if not isnull(dw_cab.getitemstring(dw_cab.getrow(),'estado'))then
	return
end if
st_xa_anular st_anula
double repo,j,k,vig,donde
string cl,cdoc,lest,err,rubro
decimal acumulado,valor

st_anula.tipo='CM'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
dw_cab.setitem(dw_cab.getrow(),'estado',usuario)
dw_cab.setitem(dw_cab.getrow(),'fecha_anula',datetime(today()))
dw_cab.setitem(dw_cab.getrow(),'motiv_anula',st_anula.observacion)
dw_cab.setitem(dw_cab.getrow(),'cod_anula',st_anula.motivo)
repo=dw_cab.getitemnumber(dw_cab.getrow(),'nreposicion')
cl=dw_cab.getitemstring(dw_cab.getrow(),'clugar')
cdoc=dw_cab.getitemstring(dw_cab.getrow(),'coddoc')
If i_ppto='1' then 
	select pre_docu_cb.estado into :lest
	from mod_relacion_origen inner join pre_docu_cb on (mod_relacion_origen.char_doc2 = pre_docu_cb.clugar) and (mod_relacion_origen.char_doc1 = pre_docu_cb.coddoc) and (mod_relacion_origen.num_doc1 = pre_docu_cb.numdoc)
	where (((mod_relacion_origen.codigo)='PGRP-') and ((mod_relacion_origen.char_orig1)=:cdoc) and ((mod_relacion_origen.char_orig2)=:cl) and ((mod_relacion_origen.num_orig1)=:repo));
	if lest='1' then
		messagebox('Atención',"Documento con giro Activo")
		return
	end if	
	
//	select sum(valor) into :acumulado
//	from  mod_relacion_origen 
//	where (((codigo)='RPPTPG') and ((num_doc1)=:repo) and ((char_doc1)=:cl) and ((mod_relacion_origen.char_doc2)=:cdoc));
//	
	for j=1 to tab_2.tp2_2.dw_det.rowcount()
		tab_2.tp2_2.dw_det.setrow(j)
		for k=1 to tab_2.tp2_2.dw_subdet.rowcount()
			if  i_ppto='1'  then
				vig=tab_2.tp2_2.dw_subdet.getitemnumber(k,'cod_vigencia')
				rubro=tab_2.tp2_2.dw_subdet.getitemstring(k,'codtotal_presu')
				valor=tab_2.tp2_2.dw_subdet.getitemnumber(k,'tneto')
				donde=dw_rub.find("cod_vigencia="+string(vig)+" and codtotal_presu='"+rubro+"'",1,dw_rub.rowcount())
				do while valor>0
					if donde=0 then
						messagebox('Atención','No se puede encontrar rubro '+rubro)
						return
					end if
					dw_rub.setitem(donde,'monto',dw_rub.getitemnumber(donde,'monto')-valor)
					valor=0
				loop
			Else //ppto
				valor=round(tab_2.tp2_2.dw_subdet.getitemnumber(k,'tneto'), i_dec_gral)
				dw_rub.setitem(donde,'monto',dw_rub.getitemnumber(donde,'acumul')-valor)
			End If
		next
	next
	acumulado=	dw_rub.getitemnumber(1,'compute_1')
		
	delete from mod_relacion_origen
	where (((codigo)='RPPTPG') and ((num_doc1)=:repo) and ((char_doc1)=:cl) and ((mod_relacion_origen.char_doc2)=:cdoc));
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando mod_relacion_origen',err)
		return
	end if
	
	UPDATE tesocajamenor SET efectivo = efectivo - :acumulado 
	WHERE (((tesocajamenor.codcaja)=:i_caja) AND ((tesocajamenor.CLugar)=:i_lugar));
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando tesocajamenor',err)
		return
	end if
end if
update tesotranscab set en_destino = '0'
from tesotranscab inner join mod_relacion_origen on (tesotranscab.clugar = mod_relacion_origen.char_orig2) and (tesotranscab.coddoc = mod_relacion_origen.char_orig1) and (tesotranscab.ntransferencia = mod_relacion_origen.num_orig1) 
where (((mod_relacion_origen.codigo)='PTRFCRP') and ((tesotranscab.estado) is null) and ((mod_relacion_origen.char_doc2)=:cl) and ((mod_relacion_origen.char_doc1)=:cdoc) and ((mod_relacion_origen.num_doc1)=:repo));
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando tesotranscab',err)
	return
end if

update tesocajagasto set clugar_rep = null, coddoc_rep = null, nreposicion = null
where (((tesocajagasto.clugar_rep)=:cl) and ((tesocajagasto.coddoc_rep)=:cdoc) and ((tesocajagasto.nreposicion)=:repo));
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando Gasto',err)
	return
end if

if dw_cab.update(true,false)=-1 then return
if dw_rub.update(true,false)=-1 then return
commit;
dw_rub.resetupdate()
dw_cab.resetupdate()
tab_2.tp2_2.dw_det.resetupdate()
dw_cajas.setcolumn('codcaja')
dw_cajas.event itemchanged(1,dw_cajas.object.codcaja,dw_cajas.getitemstring(1,'codcaja'))
end event

type dw_int_op from datawindow within w_repone_cmenor
boolean visible = false
integer x = 3579
integer y = 312
integer width = 265
integer height = 272
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_flujo_cajame"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

