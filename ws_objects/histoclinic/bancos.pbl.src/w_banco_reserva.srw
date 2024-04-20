$PBExportHeader$w_banco_reserva.srw
forward
global type w_banco_reserva from window
end type
type tab_1 from tab within w_banco_reserva
end type
type tp_1 from userobject within tab_1
end type
type pb_rechaza from picturebutton within tp_1
end type
type pb_1 from picturebutton within tp_1
end type
type dw_cab from datawindow within tp_1
end type
type st_2 from statictext within tp_1
end type
type st_1 from statictext within tp_1
end type
type st_3 from statictext within tp_1
end type
type dw_dispon from datawindow within tp_1
end type
type dw_caract from datawindow within tp_1
end type
type pb_cancel from picturebutton within tp_1
end type
type pb_ok from picturebutton within tp_1
end type
type tp_1 from userobject within tab_1
pb_rechaza pb_rechaza
pb_1 pb_1
dw_cab dw_cab
st_2 st_2
st_1 st_1
st_3 st_3
dw_dispon dw_dispon
dw_caract dw_caract
pb_cancel pb_cancel
pb_ok pb_ok
end type
type tp_2 from userobject within tab_1
end type
type pb_3 from picturebutton within tp_2
end type
type pb_anr from picturebutton within tp_2
end type
type st_5 from statictext within tp_2
end type
type st_4 from statictext within tp_2
end type
type dp_2 from datepicker within tp_2
end type
type dp_1 from datepicker within tp_2
end type
type dw_reserva from datawindow within tp_2
end type
type gb_1 from groupbox within tp_2
end type
type tp_2 from userobject within tab_1
pb_3 pb_3
pb_anr pb_anr
st_5 st_5
st_4 st_4
dp_2 dp_2
dp_1 dp_1
dw_reserva dw_reserva
gb_1 gb_1
end type
type tp_3 from userobject within tab_1
end type
type rb_dis from radiobutton within tp_3
end type
type rb_ven from radiobutton within tp_3
end type
type rb_des from radiobutton within tp_3
end type
type rb_res from radiobutton within tp_3
end type
type rb_usa from radiobutton within tp_3
end type
type rb_tod from radiobutton within tp_3
end type
type pb_vencida from picturebutton within tp_3
end type
type pb_2 from picturebutton within tp_3
end type
type dw_bolsa from datawindow within tp_3
end type
type tp_3 from userobject within tab_1
rb_dis rb_dis
rb_ven rb_ven
rb_des rb_des
rb_res rb_res
rb_usa rb_usa
rb_tod rb_tod
pb_vencida pb_vencida
pb_2 pb_2
dw_bolsa dw_bolsa
end type
type tab_1 from tab within w_banco_reserva
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
type dw_2 from datawindow within w_banco_reserva
end type
end forward

global type w_banco_reserva from window
integer width = 5490
integer height = 2112
boolean titlebar = true
string title = "Bancos - Reservas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "reserva.ico"
boolean center = true
tab_1 tab_1
dw_2 dw_2
end type
global w_banco_reserva w_banco_reserva

type variables
string i_banco,i_alm
datawindowchild idw_banco
end variables

forward prototypes
public subroutine filtro ()
end prototypes

public subroutine filtro ();datetime fecha1,fecha2
date fec
fec =tab_1.tp_2.dp_1.datevalue 
fecha1=datetime(date(fec),time('00:00'))
fec =tab_1.tp_2.dp_2.datevalue 
fecha2=datetime(date(fec),time('23:59'))
tab_1.tp_2.dw_reserva.retrieve(i_banco,fecha1,fecha2)
end subroutine

on w_banco_reserva.create
this.tab_1=create tab_1
this.dw_2=create dw_2
this.Control[]={this.tab_1,&
this.dw_2}
end on

on w_banco_reserva.destroy
destroy(this.tab_1)
destroy(this.dw_2)
end on

event open;if g_motor='postgres' then
	tab_1.tp_1.dw_dispon.dataObject='dw_bolsa_dispon_postgres'
	tab_1.tp_3.dw_bolsa.dataObject='dw_banco_bolsas_todas_postgres'
end if
if g_motor='sql' then
	tab_1.tp_1.dw_dispon.dataObject='dw_bolsa_dispon_sqlserver'
	tab_1.tp_3.dw_bolsa.dataObject='dw_banco_bolsas_todas_sqlserver'
end if
if g_motor<>'postgres' and  g_motor<>'sql' then
	tab_1.tp_1.dw_dispon.dataObject='dw_bolsa_dispon'
	tab_1.tp_3.dw_bolsa.dataObject='dw_banco_bolsas_todas'
end if	
tab_1.tp_1.dw_dispon.settransobject(sqlca)
tab_1.tp_3.dw_bolsa.settransobject(sqlca)
end event

type tab_1 from tab within w_banco_reserva
integer x = 23
integer y = 92
integer width = 5385
integer height = 1868
integer taborder = 40
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
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5349
integer height = 1740
long backcolor = 67108864
string text = "Pendientes"
long tabtextcolor = 33554432
string picturename = "pendiente.ico"
long picturemaskcolor = 536870912
pb_rechaza pb_rechaza
pb_1 pb_1
dw_cab dw_cab
st_2 st_2
st_1 st_1
st_3 st_3
dw_dispon dw_dispon
dw_caract dw_caract
pb_cancel pb_cancel
pb_ok pb_ok
end type

on tp_1.create
this.pb_rechaza=create pb_rechaza
this.pb_1=create pb_1
this.dw_cab=create dw_cab
this.st_2=create st_2
this.st_1=create st_1
this.st_3=create st_3
this.dw_dispon=create dw_dispon
this.dw_caract=create dw_caract
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.Control[]={this.pb_rechaza,&
this.pb_1,&
this.dw_cab,&
this.st_2,&
this.st_1,&
this.st_3,&
this.dw_dispon,&
this.dw_caract,&
this.pb_cancel,&
this.pb_ok}
end on

on tp_1.destroy
destroy(this.pb_rechaza)
destroy(this.pb_1)
destroy(this.dw_cab)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.dw_dispon)
destroy(this.dw_caract)
destroy(this.pb_cancel)
destroy(this.pb_ok)
end on

type pb_rechaza from picturebutton within tp_1
integer x = 5152
integer y = 80
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "declina.gif"
string disabledname = "d_declina.gif"
alignment htextalign = left!
string powertiptext = "Rechaza Solicitud"
end type

event clicked;if f_permiso_boton(this,'BS')=0 then return
if dw_cab.rowcount()=0 then return
If messageBox('Atención','Está seguro de querer Rechazar la orden de la Reserva?',question!,yesno!,2) = 2 then Return 

int l_j,it
string clug_c,err,clug_d
long cont,nsol,ndona,nbolsa,amax

dw_cab.setredraw(false)
dw_cab.setfilter("esco ='1'")
dw_cab.filter()
l_j=1
for l_j=1 to dw_cab.rowcount()
	cont=dw_cab.getitemnumber(l_j,'contador')
	clug_c=dw_cab.getitemstring(l_j,'clugar')
	nsol=dw_cab.getitemnumber(l_j,'nsolicitud')
	it=dw_cab.getitemnumber(l_j,'item')
	select suministrada,entregada into :nbolsa,:amax
	from oscuerpo
	where contador=:cont and clugar=:clug_c and nsolicitud=:nsol and	item=:it;
	if isnull(nbolsa) or nbolsa=0 then 
		if amax=0 then 
			update oscuerpo set estado='4'  
			where contador=:cont and clugar=:clug_c and nsolicitud=:nsol and	item=:it;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando Oscuerpo desde banco',err)
			end if
		else
			ir: 
			setnull(amax)
			select max(item) into :amax
			from oscuerpo
			where (((contador)=:cont) and ((clugar)=:clug_c) and ((nsolicitud)=:nsol));
			amax=amax+1	
			
			insert into oscuerpo ( contador, clugar, nsolicitud, item, codproced, solicitada, cant_encita, tipo, entregada, suministrada, en_apdx, registrado, facturar, cod_tsubempaq,cod_banco,estado)
			select contador, clugar, nsolicitud,:amax, codproced, (solicitada- entregada), cant_encita, tipo,0, 0, en_apdx, registrado, facturar,cod_tsubempaq, cod_banco, '4' as estado
			from oscuerpo
			where (((contador)=:cont ) and ((clugar)=:clug_c) and ((nsolicitud)=:nsol) and ((item)=:it));
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error',"Insertando en Oscuerpo rechazo")
				return -1
			end if
			update oscuerpo set solicitada=entregada
			where contador=:cont and clugar=:clug_c and nsolicitud=:nsol and	item=:it;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando Oscuerpo desde banco ajuste',err)
			end if	
		end if
	else
		goto ir
	end if
next
commit;
dw_cab.setfilter('')
dw_cab.filter()
dw_cab.setredraw(true)
filtro()
dw_cab.retrieve(i_banco)

end event

type pb_1 from picturebutton within tp_1
integer x = 5
integer y = 1588
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ojo.gif"
alignment htextalign = left!
string powertiptext = "Características del Paciente"
end type

event clicked;if dw_cab.rowcount()=0 then return
st_clasif st
st.tdoc=dw_cab.getitemstring(dw_cab.getrow(),'tipodoc')
st.docu=dw_cab.getitemstring(dw_cab.getrow(),'documento')
st.banco=i_banco
st.dw=dw_caract
st.sexo=dw_cab.getitemstring(dw_cab.getrow(),'sexo')
openwithparm(w_banco_paciente,st)
if message.stringparm='ok' then dw_cab.event rowfocuschanged(dw_cab.getrow())

end event

type dw_cab from datawindow within tp_1
integer x = 9
integer y = 72
integer width = 5111
integer height = 756
integer taborder = 10
string dataobject = "dw_banco_a_reserva"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;dw_caract.reset()
if getrow()<1 then return
dw_caract.retrieve(getitemstring(getrow(),'tipodoc'),getitemstring(getrow(),'documento'),i_banco)
//dw_dispon.retrieve(getitemstring(getrow(),'tipodoc'),getitemstring(getrow(),'documento'),i_banco,getitemstring(getrow(),'codproced'),dw_caract.rowcount(),getitemstring(getrow(),'cod_tsubempaq'))
dw_dispon.retrieve(getitemstring(getrow(),'tipodoc'),getitemstring(getrow(),'documento'),i_banco,getitemstring(getrow(),'cod_cups'),dw_caract.rowcount(),getitemstring(getrow(),'cod_tsubempaq'))
end event

event dberror;rollback;
return 0
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event itemchanged;if dw_cab.getitemnumber(1,'tot')+1>0 and data='1'  then 
	pb_rechaza.enabled=true
else
	pb_rechaza.enabled=false
end if
end event

type st_2 from statictext within tp_1
integer y = 4
integer width = 512
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitudes pendientes:"
boolean focusrectangle = false
end type

type st_1 from statictext within tp_1
integer x = 5
integer y = 880
integer width = 631
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Características del paciente:"
boolean focusrectangle = false
end type

type st_3 from statictext within tp_1
integer x = 1966
integer y = 884
integer width = 530
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Productos disponibles:"
boolean focusrectangle = false
end type

type dw_dispon from datawindow within tp_1
integer x = 1975
integer y = 932
integer width = 3337
integer height = 628
integer taborder = 20
string title = "none"
string dataobject = "dw_bolsa_dispon"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if getitemnumber(1,'cuantos')+1 > dw_cab.getitemnumber(dw_cab.getrow(),'cuantos') and data='1' then
	setitem(getrow(),'esco',0)
	settext('0')
	return 1
end if
end event

event dberror;rollback;
return 0
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type dw_caract from datawindow within tp_1
integer y = 936
integer width = 1938
integer height = 640
integer taborder = 10
string title = "none"
string dataobject = "dw_banco_pac_caract"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
modify("descrip_lista.dddw.useasborder='no'")
modify("descrip_lista.protect='1'")
modify("descrip_item.width=830")
end event

type pb_cancel from picturebutton within tp_1
integer x = 2491
integer y = 1588
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

type pb_ok from picturebutton within tp_1
integer x = 2336
integer y = 1588
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Reserva"
end type

event clicked;if dw_dispon.rowcount()=0 then return
if dw_dispon.getitemnumber(1,'cuantos')=0 then return
long j,ndona,nbolsa,nconta,nsoli,nitem,nro
string clu,err,clug_ord
datawindow dw_t
dw_t=tab_1.tp_2.dw_reserva
for j=1 to dw_dispon.rowcount()
	if dw_dispon.getitemnumber(j,'esco')=0 then continue
	clu=dw_dispon.getitemstring(j,'clugar')
	ndona=dw_dispon.getitemnumber(j,'nro_donacion')
	nbolsa=dw_dispon.getitemnumber(j,'nro_bolsa')
	nconta=dw_cab.getitemnumber(dw_cab.getrow(),'contador')
	nsoli=dw_cab.getitemnumber(dw_cab.getrow(),'nsolicitud')
	nitem=dw_cab.getitemnumber(dw_cab.getrow(),'item')
	clug_ord=dw_cab.getitemstring(dw_cab.getrow(),'clugar')
	
	select count(1) into :nro
	from banco_reserva
	where ((clugar=:clu) and (nro_donacion=:ndona) and (nro_bolsa=:nbolsa) and (contador=:nconta) and (clugar_os=:clug_ord) and (nsolicitud=:nsoli) and (item=:nitem) and (estado='A'));
	if nro=0 then 
		dw_t.insertrow(0)
		dw_t.setitem(dw_t.rowcount(),'clugar',clu)
		dw_t.setitem(dw_t.rowcount(),'nro_donacion',ndona)
		dw_t.setitem(dw_t.rowcount(),'nro_bolsa',nbolsa)
		dw_t.setitem(dw_t.rowcount(),'contador',nconta)
		dw_t.setitem(dw_t.rowcount(),'clugar_os',clug_ord)
		dw_t.setitem(dw_t.rowcount(),'nsolicitud',nsoli)
		dw_t.setitem(dw_t.rowcount(),'item',nitem)
		dw_t.setitem(dw_t.rowcount(),'estado','R')
		dw_t.setitem(dw_t.rowcount(),'fecha',datetime(today(),now()))
		dw_t.setitem(dw_t.rowcount(),'usuario',usuario)
	else
		update banco_reserva set estado='R',usu_anula=null,fecha_anula=null,motiv_anula=null,cod_anula=null
		where ((clugar=:clu) and (nro_donacion=:ndona) and (nro_bolsa=:nbolsa) and (contador=:nconta) and (clugar_os=:clu) and (nsolicitud=:nsoli) and (item=:nitem) and (estado='A'));
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			return
			messagebox('Error actualizando  Reserva',err)
		end if
	end if
	dw_dispon.setitem(j,'estado','R')
next
dw_cab.setitem(dw_cab.getrow(),'entregada',dw_cab.getitemnumber(dw_cab.getrow(),'entre_ori')+dw_dispon.getitemnumber(1,'cuantos'))
if dw_cab.update(true,false)=-1 then return
if dw_dispon.update(true,false)=-1 then return
if dw_t.update(true,false)=-1 then 
	dw_t.retrieve()
	return
end if
commit;
dw_cab.resetupdate()
dw_t.resetupdate()
dw_cab.retrieve(i_banco)
filtro()
dw_cab.event rowfocuschanged(dw_cab.getrow())
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5349
integer height = 1740
long backcolor = 67108864
string text = "Historial de Reservas"
long tabtextcolor = 33554432
string picturename = "Historial.ico"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_anr pb_anr
st_5 st_5
st_4 st_4
dp_2 dp_2
dp_1 dp_1
dw_reserva dw_reserva
gb_1 gb_1
end type

on tp_2.create
this.pb_3=create pb_3
this.pb_anr=create pb_anr
this.st_5=create st_5
this.st_4=create st_4
this.dp_2=create dp_2
this.dp_1=create dp_1
this.dw_reserva=create dw_reserva
this.gb_1=create gb_1
this.Control[]={this.pb_3,&
this.pb_anr,&
this.st_5,&
this.st_4,&
this.dp_2,&
this.dp_1,&
this.dw_reserva,&
this.gb_1}
end on

on tp_2.destroy
destroy(this.pb_3)
destroy(this.pb_anr)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dp_2)
destroy(this.dp_1)
destroy(this.dw_reserva)
destroy(this.gb_1)
end on

type pb_3 from picturebutton within tp_2
integer x = 2432
integer y = 36
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
string picturename = "refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Refrescar"
end type

event clicked;filtro()
end event

type pb_anr from picturebutton within tp_2
integer x = 5065
integer y = 36
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
string powertiptext = "Anula Reserva"
end type

event clicked;if f_permiso_boton(this,'BS')=0 then return
If messageBox('Atención','Está seguro de querer cambiar el estado de la Reserva?',question!,yesno!,2) = 2 then Return 

st_xa_anular st_anula
int l_j,it
string clug_c,err,clug_d
long cont,nsol,ndona,nbolsa

st_anula.tipo='BS'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
dw_reserva.setredraw(false)
dw_reserva.setfilter('esco =1')
dw_reserva.filter()
l_j=1
for l_j=1 to dw_reserva.rowcount()
	if dw_reserva.getitemstring(l_j,'estado')='U' then 
		continue
	else
		cont=dw_reserva.getitemnumber(l_j,'contador')
		clug_c=dw_reserva.getitemstring(l_j,'clugar_os')
		nsol=dw_reserva.getitemnumber(l_j,'nsolicitud')
		it=dw_reserva.getitemnumber(l_j,'item')
		select suministrada into :nbolsa
		from oscuerpo
		where contador=:cont and clugar=:clug_c and nsolicitud=:nsol and	item=:it;
		if isnull(nbolsa) or nbolsa=0 then 
			ndona=dw_reserva.getitemnumber(l_j,'nro_donacion')
			nbolsa=dw_reserva.getitemnumber(l_j,'nro_bolsa')
			clug_d=dw_reserva.getitemstring(l_j,'clugar')
			dw_reserva.setitem(l_j,'estado','A')
			dw_reserva.setitem(l_j,'motiv_anula',st_anula.observacion)
			dw_reserva.setitem(l_j,'cod_anula',st_anula.motivo)
			dw_reserva.setitem(l_j,'usu_anula',usuario)
			dw_reserva.setitem(l_j,'fecha_anula',datetime(today(),now()))
			dw_reserva.setitem(l_j,'cod_anula',st_anula.motivo)
			update banco_bolsa set estado='D' 
			where clugar=:clug_d and nro_donacion=:ndona and nro_bolsa=:nbolsa and estado in ('R');
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando banco_bolsa',err)
			end if
			update oscuerpo set entregada=entregada - 1  
			where contador=:cont and clugar=:clug_c and nsolicitud=:nsol and	item=:it;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando Oscuerpo desde banco',err)
			end if
		else
		end if
	end if
next
if dw_reserva.update(true,false)=-1 then 
	rollback;
	return
end if
commit;
dw_reserva.setfilter('')
dw_reserva.filter()
dw_reserva.setredraw(true)
filtro()
tab_1.tp_1.dw_cab.retrieve(i_banco)

end event

type st_5 from statictext within tp_2
integer x = 1189
integer y = 80
integer width = 320
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Final"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within tp_2
integer x = 41
integer y = 80
integer width = 270
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicia"
alignment alignment = center!
boolean focusrectangle = false
end type

type dp_2 from datepicker within tp_2
integer x = 1509
integer y = 52
integer width = 686
integer height = 100
integer taborder = 30
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2021-02-01"), Time("10:37:06.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtro()
end event

type dp_1 from datepicker within tp_2
integer x = 329
integer y = 64
integer width = 686
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2021-02-01"), Time("10:37:06.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtro()
end event

type dw_reserva from datawindow within tp_2
integer y = 200
integer width = 5266
integer height = 1408
integer taborder = 30
string title = "none"
string dataobject = "dw_banco_reserva"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;rollback;
return 0
end event

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event itemchanged;if dw_reserva.getitemnumber(1,'cuantos')+1>0 and data='1' then 
	pb_anr.enabled=true
else
	pb_anr.enabled=false
end if

end event

type gb_1 from groupbox within tp_2
integer y = 12
integer width = 2281
integer height = 172
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterios de Búsqueda"
end type

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5349
integer height = 1740
long backcolor = 67108864
string text = "Existencias"
long tabtextcolor = 33554432
string picturename = "banco_inv.ico"
long picturemaskcolor = 536870912
rb_dis rb_dis
rb_ven rb_ven
rb_des rb_des
rb_res rb_res
rb_usa rb_usa
rb_tod rb_tod
pb_vencida pb_vencida
pb_2 pb_2
dw_bolsa dw_bolsa
end type

on tp_3.create
this.rb_dis=create rb_dis
this.rb_ven=create rb_ven
this.rb_des=create rb_des
this.rb_res=create rb_res
this.rb_usa=create rb_usa
this.rb_tod=create rb_tod
this.pb_vencida=create pb_vencida
this.pb_2=create pb_2
this.dw_bolsa=create dw_bolsa
this.Control[]={this.rb_dis,&
this.rb_ven,&
this.rb_des,&
this.rb_res,&
this.rb_usa,&
this.rb_tod,&
this.pb_vencida,&
this.pb_2,&
this.dw_bolsa}
end on

on tp_3.destroy
destroy(this.rb_dis)
destroy(this.rb_ven)
destroy(this.rb_des)
destroy(this.rb_res)
destroy(this.rb_usa)
destroy(this.rb_tod)
destroy(this.pb_vencida)
destroy(this.pb_2)
destroy(this.dw_bolsa)
end on

type rb_dis from radiobutton within tp_3
integer x = 87
integer y = 24
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Disponible"
end type

event clicked;if checked then
	dw_bolsa.setfilter("estado='D'")
	dw_bolsa.filter()
end if

end event

type rb_ven from radiobutton within tp_3
integer x = 1787
integer y = 24
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vencida"
end type

event clicked;if checked then
	dw_bolsa.setfilter("estado='V'")
	dw_bolsa.filter()
end if

end event

type rb_des from radiobutton within tp_3
integer x = 1371
integer y = 24
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desechada"
end type

event clicked;if checked then
	dw_bolsa.setfilter("estado='X'")
	dw_bolsa.filter()
end if

end event

type rb_res from radiobutton within tp_3
integer x = 1015
integer y = 24
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reserva"
end type

event clicked;if checked then
	dw_bolsa.setfilter("estado='R'")
	dw_bolsa.filter()
end if

end event

type rb_usa from radiobutton within tp_3
integer x = 741
integer y = 24
integer width = 265
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usada"
end type

event clicked;if checked then
	dw_bolsa.setfilter("estado='U'")
	dw_bolsa.filter()
end if


end event

type rb_tod from radiobutton within tp_3
integer x = 462
integer y = 24
integer width = 242
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todas"
boolean checked = true
end type

event clicked;if checked then
	dw_bolsa.setfilter('')
	dw_bolsa.filter()
end if

end event

type pb_vencida from picturebutton within tp_3
integer x = 5189
integer y = 180
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "declina.gif"
string disabledname = "d_declina.gif"
string powertiptext = "Baja de Productos"
end type

event clicked;if f_permiso_boton(this,'BS')=0 then return
If messageBox('Atención','Está seguro de querer cambiar el estado de la Bolsa?',question!,yesno!,2) = 2 then Return 

st_xa_anular st_anula
int l_j,it
string err,esta,clug_d
long ndona,nbolsa

st_anula.tipo='BS'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
dw_bolsa.setredraw(false)
dw_bolsa.setfilter("esco ='1'")
dw_bolsa.filter()
l_j=1
for l_j=1 to dw_bolsa.rowcount()
	if dw_bolsa.getitemstring(l_j,'estado')='U' or dw_bolsa.getitemstring(l_j,'estado')='R' then 
		continue
	else
		if pos(UPPER(st_anula.nombre),upper( 'VENCE'),1)>0 then
			esta='V'
		else
			esta='X'
		end if
		ndona=dw_bolsa.getitemnumber(l_j,'nro_donacion')
		nbolsa=dw_bolsa.getitemnumber(l_j,'nro_bolsa')
		clug_d=dw_bolsa.getitemstring(l_j,'clugar')
		dw_bolsa.setitem(l_j,'estado',esta)
		dw_bolsa.setitem(l_j,'motiv_rechazo',st_anula.observacion)
		dw_bolsa.setitem(l_j,'cod_anula',st_anula.motivo)
		dw_bolsa.setitem(l_j,'usu_anula',usuario)
		dw_bolsa.setitem(l_j,'fecha_anula',datetime(today(),now()))
		dw_bolsa.setitem(l_j,'cod_anula',st_anula.motivo)
		dw_bolsa.setitem(l_j,'estado',esta)
	end if
next
if dw_bolsa.update(true,false)=-1 then 
	rollback;
	return
end if
commit;
dw_bolsa.setfilter('')
dw_bolsa.filter()
dw_bolsa.setredraw(true)
filtro()
tab_1.tp_1.dw_cab.retrieve(i_banco)
tab_1.tp_3.dw_bolsa.retrieve(clugar)
end event

type pb_2 from picturebutton within tp_3
string tag = "Traer desde Inventarios"
integer x = 5184
integer y = 40
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "contrato.gif"
string powertiptext = "Traer desde Inventarios"
end type

event clicked;if isnull(i_alm) then 
	messagebox('Aención',' No hay Almacen configurado para este Banco')
	return
end if
openwithparm(w_lleva_inventario,i_alm)
tab_1.tp_3.dw_bolsa.retrieve(clugar)
end event

type dw_bolsa from datawindow within tp_3
integer x = 64
integer y = 104
integer width = 5106
integer height = 1480
integer taborder = 40
string dataobject = "dw_banco_bolsas_todas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event itemchanged;if dw_bolsa.getitemnumber(1,'tot')+1>0 and data='1'  then 
	pb_vencida.enabled=true
else
	pb_vencida.enabled=false
end if
end event

type dw_2 from datawindow within w_banco_reserva
integer width = 1509
integer height = 80
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_banco_fluid"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('cod_banco',idw_banco)
idw_banco.settransobject(sqlca)
idw_banco.retrieve()
settransobject(sqlca)
insertrow(1)
end event

event itemchanged;i_alm=idw_banco.getitemstring(idw_banco.getrow(),'codalmacen')
i_banco=data
tab_1.tp_1.dw_cab.retrieve(i_banco)
tab_1.tp_3.dw_bolsa.retrieve(clugar)
tab_1.tp_3.dw_bolsa.retrieve(i_banco)
filtro()
end event

