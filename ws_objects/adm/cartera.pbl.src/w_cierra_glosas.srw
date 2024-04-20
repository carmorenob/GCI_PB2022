$PBExportHeader$w_cierra_glosas.srw
forward
global type w_cierra_glosas from window
end type
type em_2 from editmask within w_cierra_glosas
end type
type st_3 from statictext within w_cierra_glosas
end type
type st_2 from statictext within w_cierra_glosas
end type
type em_1 from editmask within w_cierra_glosas
end type
type pb_cancel from picturebutton within w_cierra_glosas
end type
type pb_ok from picturebutton within w_cierra_glosas
end type
type st_1 from statictext within w_cierra_glosas
end type
type dw_1 from datawindow within w_cierra_glosas
end type
end forward

global type w_cierra_glosas from window
integer width = 2715
integer height = 1192
boolean titlebar = true
string title = "Cerrar Glosas y llevar a Cartera"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "giros.ico"
boolean center = true
em_2 em_2
st_3 st_3
st_2 st_2
em_1 em_1
pb_cancel pb_cancel
pb_ok pb_ok
st_1 st_1
dw_1 dw_1
end type
global w_cierra_glosas w_cierra_glosas

type variables
st_amortizar i_st
int l_anyo,l_min, l_max
end variables

on w_cierra_glosas.create
this.em_2=create em_2
this.st_3=create st_3
this.st_2=create st_2
this.em_1=create em_1
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.em_2,&
this.st_3,&
this.st_2,&
this.em_1,&
this.pb_cancel,&
this.pb_ok,&
this.st_1,&
this.dw_1}
end on

on w_cierra_glosas.destroy
destroy(this.em_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
dw_1.retrieve(i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'coddoc'),i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'clugar'),i_st.dw_cab.getitemnumber(i_st.dw_cab.getrow(),'num_glosa'))
em_1.text=string(today())
em_2.text=string(today())
end event

type em_2 from editmask within w_cierra_glosas
integer x = 512
integer y = 56
integer width = 402
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event modified;if f_docu_cartera(datetime(em_2.text))=-1 then
	em_2.text=string(today())
	return 1
end if

end event

type st_3 from statictext within w_cierra_glosas
integer x = 517
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
string text = "Fecha Radicación:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cierra_glosas
integer x = 46
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Envío:"
boolean focusrectangle = false
end type

type em_1 from editmask within w_cierra_glosas
integer x = 41
integer y = 56
integer width = 402
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event modified;if f_docu_cartera(datetime(em_1.text))=-1 then
	em_1.text=string(today())
	return 1
end if

end event

type pb_cancel from picturebutton within w_cierra_glosas
integer x = 1358
integer y = 964
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
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

type pb_ok from picturebutton within w_cierra_glosas
integer x = 1179
integer y = 964
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
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

event clicked;if dw_1.rowcount()=0 then return
if dw_1.find('tipo=""',1,dw_1.rowcount())>0 then return
long j,ncobro,item,n_glos
string clug,tipo,err,clug_glos,cdoc_glos
datetime fecha
dec valor,l_can,l_resul
n_glos=i_st.dw_cab.getitemnumber(i_st.dw_cab.getrow(),'num_glosa')
cdoc_glos=i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'coddoc')
clug_glos=i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'clugar')

ncobro=dw_1.getitemnumber(1,'num_cobro')
clug=dw_1.getitemstring(1,'clugar_cob')
SELECT  (vtcancelar-vtcancelado) into :l_can
FROM CAR_COBRO_CAB
WHERE (((clugar)=:clug) AND ((coddoc)='CXC') AND ((num_cobro)=:ncobro));
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	messagebox('Error leyendo car_cobro_cab',err)
	return
end if
for j=1 to dw_1.rowcount()
	valor=round(dw_1.getitemnumber(j,'v_aceptado'),i_dec_gral_car)
	l_resul=l_can - valor
	IF l_resul<0 then 
		messagebox("Atención",'El saldo no puede ser negativo verifique los datos')
		return 
	End If
	ncobro=dw_1.getitemnumber(j,'num_cobro')
	clug=dw_1.getitemstring(j,'clugar_cob')
	tipo=dw_1.getitemstring(j,'tipo')
	select max(item) into :item from car_cobro_cpo where 
	clugar =:clug and coddoc ='CXC' and num_cobro =:ncobro and cartipo=:tipo;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo car_cobro_cpo',err)
		return
	end if
	if isnull(item) then item=0
	item ++
	fecha=datetime(date(em_1.text),now())
	insert into car_cobro_cpo (clugar,coddoc,num_cobro,cartipo,item,valor,fecha,coddoc_glosa,clugar_glosa,num_glosa,usuario,fecha_audita) values
	(:clug,'CXC',:ncobro,:tipo,:item,:valor,:fecha,:cdoc_glos,:clug_glos,:n_glos,:usuario,:fecha);
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error Insertando en car_cobro_cpo',err)
		return
	end if
	l_can=l_can - valor
next
i_st.dw_cab.setitem(i_st.dw_cab.getrow(),'estado','3')
i_st.dw_cab.setitem(i_st.dw_cab.getrow(),'fecha_envia',datetime(date(em_1.text)))
i_st.dw_cab.setitem(i_st.dw_cab.getrow(),'fecha_radica',datetime(date(em_2.text)))
if i_st.dw_cab.update(true,false)=-1 then return
uo_datastore ds
ds=create uo_datastore
ds.dataobject='dw_borrar_resum'
ds.settransobject(sqlca)
ds.retrieve(i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'coddoc'),i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'clugar'),i_st.dw_cab.getitemnumber(i_st.dw_cab.getrow(),'num_glosa'),-1)
do while ds.rowcount()>0
	ds.deleterow(1)
loop
if ds.update()=-1 then return
ncobro=i_st.dw_cab.getitemnumber(i_st.dw_cab.getrow(),'num_glosa')
clug=i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'clugar')
INSERT INTO CAR_COBRO_TOT ( clugar, coddoc, num_cobro, cartipo, valor )
SELECT CAR_COBRO_CPO.clugar, CAR_COBRO_CPO.coddoc, CAR_COBRO_CPO.num_cobro, CAR_COBRO_CPO.cartipo, Sum(CAR_COBRO_CPO.valor) AS SumaDevalor
FROM v_ctas_glosas INNER JOIN (car_tipo INNER JOIN CAR_COBRO_CPO ON car_tipo.cartipo = CAR_COBRO_CPO.cartipo) ON (v_ctas_glosas.num_cobro = CAR_COBRO_CPO.num_cobro) AND (v_ctas_glosas.coddoc_cob = CAR_COBRO_CPO.coddoc) AND (v_ctas_glosas.clugar_cob = CAR_COBRO_CPO.clugar)
WHERE (((v_ctas_glosas.CodDoc)='GL') AND ((v_ctas_glosas.clugar)=:clug) AND ((v_ctas_glosas.NUM_GLOSA)=:ncobro) AND ((car_tipo.codtipo)='3') AND ((car_tipo.operacion)=-1)) and CAR_COBRO_CPO.estado is null
GROUP BY CAR_COBRO_CPO.clugar, CAR_COBRO_CPO.coddoc, CAR_COBRO_CPO.num_cobro, CAR_COBRO_CPO.cartipo;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error Insertando en car_cobro_tot lo nuevos totales',err)
	return
end if
ds.dataobject='dw_calc_tot'
ds.settransobject(sqlca)
for j=1 to dw_1.rowcount()
	ncobro=dw_1.getitemnumber(j,'num_cobro')
	clug=dw_1.getitemstring(j,'clugar_cob')
	ds.retrieve(clug,dw_1.getitemstring(j,'coddoc_cob'),ncobro)
	if ds.rowcount()>0 then
		valor=round(ds.getitemnumber(1,'vtcancelar'),i_dec_gral_car)
		update car_cobro_cab set vtcancelar=:valor where 
		clugar=:clug and coddoc='CXC' and num_cobro=:ncobro;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando en car_cobro_cab lo nuevos totales',err)
			return
		end if
	end if
next
commit;
i_st.dw_cab.resetupdate()
closewithreturn(parent,'ok')


end event

type st_1 from statictext within w_cierra_glosas
integer x = 41
integer y = 176
integer width = 1061
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen de Glosas a Registrar en Cartera:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_cierra_glosas
integer x = 41
integer y = 236
integer width = 2610
integer height = 708
integer taborder = 10
string title = "none"
string dataobject = "dw_glosa_a_carte"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

