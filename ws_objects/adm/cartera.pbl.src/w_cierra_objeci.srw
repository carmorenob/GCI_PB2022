$PBExportHeader$w_cierra_objeci.srw
forward
global type w_cierra_objeci from window
end type
type pb_cancel from picturebutton within w_cierra_objeci
end type
type pb_ok from picturebutton within w_cierra_objeci
end type
type st_1 from statictext within w_cierra_objeci
end type
type dw_1 from datawindow within w_cierra_objeci
end type
end forward

global type w_cierra_objeci from window
integer width = 2030
integer height = 1056
boolean titlebar = true
string title = "Cerrar Objeción y llevar a Cartera"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "giros.ico"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
st_1 st_1
dw_1 dw_1
end type
global w_cierra_objeci w_cierra_objeci

type variables
st_amortizar i_st
end variables

on w_cierra_objeci.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.st_1,&
this.dw_1}
end on

on w_cierra_objeci.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
dw_1.retrieve(i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'coddoc'),i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'clugar'),i_st.dw_cab.getitemnumber(i_st.dw_cab.getrow(),'num_glosa'))
end event

type pb_cancel from picturebutton within w_cierra_objeci
integer x = 987
integer y = 820
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_cierra_objeci
integer x = 809
integer y = 812
integer width = 151
integer height = 132
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
if dw_1.find('tipo=""',1,dw_1.rowcount())>0 then return
long j,ncobro,item
string clug,tipo,err
datetime fecha
dec valor
for j=1 to dw_1.rowcount()
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
	valor=dw_1.getitemnumber(j,'valor')
	fecha=i_st.dw_cab.getitemdatetime(i_st.dw_cab.getrow(),'fecha')
	insert into car_cobro_cpo (clugar,coddoc,num_cobro,cartipo,item,valor,fecha) values
	(:clug,'CXC',:ncobro,:tipo,:item,:valor,:fecha);
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error Insertando en car_cobro_cpo',err)
		return
	end if
next
i_st.dw_cab.setitem(i_st.dw_cab.getrow(),'estado','1')
if i_st.dw_cab.update(true,false)=-1 then return
uo_datastore ds
ds=create uo_datastore
ds.dataobject='dw_borrar_resum'
ds.settransobject(sqlca)
ds.retrieve(i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'coddoc'),i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'clugar'),i_st.dw_cab.getitemnumber(i_st.dw_cab.getrow(),'num_glosa'),0)
do while ds.rowcount()>0
	ds.deleterow(1)
loop
if ds.update()=-1 then return
ncobro=i_st.dw_cab.getitemnumber(i_st.dw_cab.getrow(),'num_glosa')
clug=i_st.dw_cab.getitemstring(i_st.dw_cab.getrow(),'clugar')
INSERT INTO CAR_COBRO_TOT ( clugar, coddoc, num_cobro, cartipo, valor )
SELECT CAR_COBRO_CPO.clugar, CAR_COBRO_CPO.coddoc, CAR_COBRO_CPO.num_cobro, CAR_COBRO_CPO.cartipo, Sum(CAR_COBRO_CPO.valor) AS SumaDevalor
FROM v_ctas_glosas INNER JOIN (car_tipo INNER JOIN CAR_COBRO_CPO ON car_tipo.cartipo = CAR_COBRO_CPO.cartipo) ON (v_ctas_glosas.num_cobro = CAR_COBRO_CPO.num_cobro) AND (v_ctas_glosas.coddoc_cob = CAR_COBRO_CPO.coddoc) AND (v_ctas_glosas.clugar_cob = CAR_COBRO_CPO.clugar)
WHERE (((v_ctas_glosas.CodDoc)='GL') AND ((v_ctas_glosas.clugar)=:clug) AND ((v_ctas_glosas.NUM_GLOSA)=:ncobro) AND ((car_tipo.codtipo)='3') AND ((car_tipo.operacion)=0))
GROUP BY CAR_COBRO_CPO.clugar, CAR_COBRO_CPO.coddoc, CAR_COBRO_CPO.num_cobro, CAR_COBRO_CPO.cartipo;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error Insertando en car_cobro_tot lo nuevos totales',err)
	return
end if
commit;
i_st.dw_cab.resetupdate()
closewithreturn(parent,'ok')


end event

type st_1 from statictext within w_cierra_objeci
integer x = 41
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
string text = "Resumen de Objeciones a Registrar en Cartera:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_cierra_objeci
integer x = 41
integer y = 68
integer width = 1925
integer height = 708
integer taborder = 10
string title = "none"
string dataobject = "dw_obje_a_carte"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

