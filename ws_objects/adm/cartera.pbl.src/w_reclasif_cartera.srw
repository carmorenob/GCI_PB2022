$PBExportHeader$w_reclasif_cartera.srw
forward
global type w_reclasif_cartera from window
end type
type pb_2 from picturebutton within w_reclasif_cartera
end type
type pb_ref from picturebutton within w_reclasif_cartera
end type
type st_1 from statictext within w_reclasif_cartera
end type
type dp_1 from datepicker within w_reclasif_cartera
end type
type pb_1 from picturebutton within w_reclasif_cartera
end type
type st_4 from statictext within w_reclasif_cartera
end type
type tab_1 from tab within w_reclasif_cartera
end type
type tp_1 from userobject within tab_1
end type
type pb_next from picturebutton within tp_1
end type
type sle_2 from singlelineedit within tp_1
end type
type st_3 from statictext within tp_1
end type
type dw_des from datawindow within tp_1
end type
type sle_1 from singlelineedit within tp_1
end type
type st_2 from statictext within tp_1
end type
type dw_org from datawindow within tp_1
end type
type dw_trae from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_next pb_next
sle_2 sle_2
st_3 st_3
dw_des dw_des
sle_1 sle_1
st_2 st_2
dw_org dw_org
dw_trae dw_trae
end type
type tp_2 from userobject within tab_1
end type
type dw_recla from datawindow within tp_2
end type
type pb_save from picturebutton within tp_2
end type
type tp_2 from userobject within tab_1
dw_recla dw_recla
pb_save pb_save
end type
type tab_1 from tab within w_reclasif_cartera
tp_1 tp_1
tp_2 tp_2
end type
type dw_cab from datawindow within w_reclasif_cartera
end type
end forward

global type w_reclasif_cartera from window
integer width = 4590
integer height = 2284
boolean titlebar = true
string title = "Cartera - Reclasificación Cartera"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_rclasif.ico"
boolean center = true
pb_2 pb_2
pb_ref pb_ref
st_1 st_1
dp_1 dp_1
pb_1 pb_1
st_4 st_4
tab_1 tab_1
dw_cab dw_cab
end type
global w_reclasif_cartera w_reclasif_cartera

type variables
string i_emp,i_coddoc='CXR'
boolean i_nuevo=false
datetime fec_corte
end variables

on w_reclasif_cartera.destroy
destroy(this.pb_2)
destroy(this.pb_ref)
destroy(this.st_1)
destroy(this.dp_1)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.tab_1)
destroy(this.dw_cab)
end on

on w_reclasif_cartera.create
this.pb_2=create pb_2
this.pb_ref=create pb_ref
this.st_1=create st_1
this.dp_1=create dp_1
this.pb_1=create pb_1
this.st_4=create st_4
this.tab_1=create tab_1
this.dw_cab=create dw_cab
this.Control[]={this.pb_2,&
this.pb_ref,&
this.st_1,&
this.dp_1,&
this.pb_1,&
this.st_4,&
this.tab_1,&
this.dw_cab}
end on

event open;select cod_empresa into :i_emp from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo Lugar",sqlca.sqlerrtext)
	return
end if
dw_cab.retrieve()
end event

event resize;tab_1.resize((newwidth - 50) , (newheight * 0.70))
tab_1.tp_1.dw_trae.resize((newwidth - 150) , (newheight * 0.55))
tab_1.tp_2.dw_recla.resize((newwidth - 350) , (newheight * 0.65))
tab_1.tp_2.pb_save.x=tab_1.tp_2.dw_recla.x+tab_1.tp_2.dw_recla.width+ 50
end event

type pb_2 from picturebutton within w_reclasif_cartera
integer x = 3977
integer y = 72
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;long l_i,i_ndoc
string err
st_xa_anular st_anula

if dw_cab.getitemstring(dw_cab.getrow(),'contabil')='C' then
	messagebox('error','Documento ya contabilizado')
	return -1
end if
sqlca.autocommit=false

st_anula.tipo='CA'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
dw_cab.setitem(dw_cab.getrow(),'estado',usuario)
dw_cab.setitem(dw_cab.getrow(),'fecha_anula',datetime(today(),now()))
dw_cab.setitem(dw_cab.getrow(),'motiv_anula',st_anula.observacion)
dw_cab.setitem(dw_cab.getrow(),'cod_anula',st_anula.motivo)
i_ndoc=dw_cab.getitemnumber(dw_cab.getrow(),'reclasi')
if dw_cab.update(true,false)=-1 then
	rollback;
else
	UPDATE car_cobro_cab 
	SET cod_empresa = car_reclasifica_cpo.emp_org, .cta_contable = car_reclasifica_cpo.cta_org
	FROM 
		car_reclasifica_cpo inner join car_cobro_cab on (car_reclasifica_cpo.num_cobro = car_cobro_cab.num_cobro) 
		and (car_reclasifica_cpo.coddoc_cobro = car_cobro_cab.coddoc) and (car_reclasifica_cpo.clugar_cobro = car_cobro_cab.clugar) 
	WHERE 
		(((car_reclasifica_cpo.clugar)=:clugar) and ((car_reclasifica_cpo.coddoc)=:i_coddoc) 
		and ((car_reclasifica_cpo.reclasi)=:i_ndoc));
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando en car_cobro_cab lo nuevos totales',err)
		return -1
	end if
	commit;
end if
sqlca.autocommit=true
end event

type pb_ref from picturebutton within w_reclasif_cartera
integer x = 3813
integer y = 72
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
string picturename = "refrescar.GIF"
string disabledname = "d_refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Traer Datos"
end type

event clicked;tab_1.tp_1.dw_org.accepttext()
if isnull(tab_1.tp_1.dw_org.getitemstring(1,'edita') ) then
	messagebox('Atención','Falta Cuenta Origen')
	return
end if
tab_1.tp_1.dw_trae.retrieve(tab_1.tp_1.dw_org.getitemstring(1,'edita'),fec_corte)
if isnull(tab_1.tp_1.dw_des.getitemstring(1,'edita') ) then
	tab_1.tp_1.pb_next.enabled=false
else
	tab_1.tp_1.pb_next.enabled=true
end if
end event

type st_1 from statictext within w_reclasif_cartera
integer x = 3671
integer y = 232
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
string text = "Fecha Corte"
boolean focusrectangle = false
end type

type dp_1 from datepicker within w_reclasif_cartera
integer x = 3666
integer y = 296
integer width = 466
integer height = 100
integer taborder = 30
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2022-11-06"), Time("13:55:15.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;fec_corte=datetime(dp_1.text)
if dw_cab.getitemstring(dw_cab.getrow(),'estado')= '2' then return
dw_cab.setitem(dw_cab.getrow(),'fcorte',fec_corte)
end event

event constructor;fec_corte=datetime(dp_1.text)
end event

type pb_1 from picturebutton within w_reclasif_cartera
string tag = "Insertar"
integer x = 3657
integer y = 72
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
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Inserta Nuevo Proceso"
end type

event clicked;double l_fila
l_fila=dw_cab.insertrow(0)
dw_cab.setitem(l_fila,'fecha',datetime(today(),now()))
dw_cab.setitem(l_fila,'contabil','P')
//dw_cab.setitem(l_fila,'estado','')
dw_cab.setitem(l_fila,'fcorte',fec_corte)
dw_cab.setitem(l_fila,'usuario',usuario)
dw_cab.setitem(l_fila,'clugar',clugar)
dw_cab.setitem(l_fila,'coddoc',i_coddoc)
dw_cab.setitem(l_fila,'concepto','Reclasificación Cartera')
dw_cab.scrolltorow(l_fila)
i_nuevo=true
tab_1.tp_1.dw_org.enabled=true
tab_1.tp_1.dw_des.enabled=true
tab_1.tp_1.enabled=true
tab_1.tp_1.visible=true
tab_1.post SelectTab (1)
end event

type st_4 from statictext within w_reclasif_cartera
integer x = 46
integer y = 12
integer width = 905
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
string text = "Historial de Clasificaciones de Cuentas"
boolean focusrectangle = false
end type

type tab_1 from tab within w_reclasif_cartera
integer x = 46
integer y = 536
integer width = 4466
integer height = 1596
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4430
integer height = 1468
long backcolor = 67108864
string text = "Radicaciones"
long tabtextcolor = 33554432
string picturename = "arq_deta.ico"
long picturemaskcolor = 536870912
pb_next pb_next
sle_2 sle_2
st_3 st_3
dw_des dw_des
sle_1 sle_1
st_2 st_2
dw_org dw_org
dw_trae dw_trae
end type

on tp_1.create
this.pb_next=create pb_next
this.sle_2=create sle_2
this.st_3=create st_3
this.dw_des=create dw_des
this.sle_1=create sle_1
this.st_2=create st_2
this.dw_org=create dw_org
this.dw_trae=create dw_trae
this.Control[]={this.pb_next,&
this.sle_2,&
this.st_3,&
this.dw_des,&
this.sle_1,&
this.st_2,&
this.dw_org,&
this.dw_trae}
end on

on tp_1.destroy
destroy(this.pb_next)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.dw_des)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.dw_org)
destroy(this.dw_trae)
end on

type pb_next from picturebutton within tp_1
integer x = 4215
integer y = 20
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "ultimo.gif"
string disabledname = "d_ultimo.gif"
alignment htextalign = left!
string powertiptext = "Reclasificar"
end type

event clicked;long l_k,l_item
tab_1.tp_1.dw_des.accepttext()
pb_next.enabled=false
pb_1.enabled=false
tab_1.tp_2.pb_save.enabled=true
tab_1.post SelectTab (2)
for l_k=1 to dw_trae.rowcount()
	if dw_trae.getitemnumber(l_k,'esco')=0 then continue
	tab_1.tp_2.dw_recla.insertrow(1)
	l_item=tab_1.tp_2.dw_recla.getitemnumber(1,'maximos')
	if isnull(l_item) then l_item=0
	l_item++
	tab_1.tp_2.dw_recla.setitem(1,'clugar',clugar)
	tab_1.tp_2.dw_recla.setitem(1,'coddoc',i_coddoc)
	tab_1.tp_2.dw_recla.setitem(1,'item',l_item)
	tab_1.tp_2.dw_recla.setitem(1,'tipodoc',dw_trae.getitemstring(l_k,'tipodoc'))
	tab_1.tp_2.dw_recla.setitem(1,'documento',dw_trae.getitemstring(l_k,'documento'))
	tab_1.tp_2.dw_recla.setitem(1,'nombre1',dw_trae.getitemstring(l_k,'nombre1'))
	tab_1.tp_2.dw_recla.setitem(1,'nombre2',dw_trae.getitemstring(l_k,'nombre2'))
	tab_1.tp_2.dw_recla.setitem(1,'apellido1',dw_trae.getitemstring(l_k,'apellido1'))
	tab_1.tp_2.dw_recla.setitem(1,'apellido2',dw_trae.getitemstring(l_k,'apellido2'))
	tab_1.tp_2.dw_recla.setitem(1,'razon_social',dw_trae.getitemstring(l_k,'razon_social'))
	tab_1.tp_2.dw_recla.setitem(1,'nro_soporte',dw_trae.getitemstring(l_k,'nro_soporte'))
	tab_1.tp_2.dw_recla.setitem(1,'clugar_rad',dw_trae.getitemstring(l_k,'clugar'))
	tab_1.tp_2.dw_recla.setitem(1,'tipo_rad',dw_trae.getitemstring(l_k,'tipo'))
	tab_1.tp_2.dw_recla.setitem(1,'fecha_radica',dw_trae.getitemdatetime(l_k,'fecha_radica'))
	tab_1.tp_2.dw_recla.setitem(1,'clugar_cobro',dw_trae.getitemstring(l_k,'clugar_1'))
	tab_1.tp_2.dw_recla.setitem(1,'num_cobro',dw_trae.getitemnumber(l_k,'num_cobro'))
	tab_1.tp_2.dw_recla.setitem(1,'coddoc_cobro',dw_trae.getitemstring(l_k,'coddoc'))
	tab_1.tp_2.dw_recla.setitem(1,'emp_org',i_emp)
	tab_1.tp_2.dw_recla.setitem(1,'cta_org',dw_trae.getitemstring(l_k,'cta_contable'))
	tab_1.tp_2.dw_recla.setitem(1,'des_org',dw_trae.getitemstring(l_k,'descrip'))
	tab_1.tp_2.dw_recla.setitem(1,'emp_des',i_emp)	
	tab_1.tp_2.dw_recla.setitem(1,'cta_des',tab_1.tp_1.dw_des.getitemstring(1,'edita'))
	tab_1.tp_2.dw_recla.setitem(1,'des_des',sle_2.text)
next
end event

type sle_2 from singlelineedit within tp_1
integer x = 2798
integer y = 76
integer width = 1376
integer height = 64
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within tp_1
integer x = 2501
integer y = 16
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
string text = "Cta Destino"
boolean focusrectangle = false
end type

type dw_des from datawindow within tp_1
event keyup pbm_dwnkey
integer x = 2130
integer y = 16
integer width = 686
integer height = 136
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_paraediciones"
boolean border = false
boolean livescroll = true
end type

event keyup;if i_emp='' then return
f_busca_cuenta(key,i_emp,this)

end event

event itemchanged;string revisa,otro
otro=gettext()
setnull(revisa)
select descrip into :revisa from cont_plan where codtotal=:otro and cod_empresa=:i_emp and movimiento='1';
if isnull(revisa) then
	sle_2.text=revisa
	return 1
else
	sle_2.text=revisa	
end if
if dw_trae.rowcount()>0 then 
	pb_next.enabled=true
else
	pb_next.enabled=false
end if
end event

event getfocus;if isvalid(w_busca_cuenta) then 
	w_busca_cuenta.i_st.dw=this
	w_busca_cuenta.i_semovio=false
	if w_busca_cuenta.i_st.codemp<>i_emp then
		w_busca_cuenta.i_st.codemp=i_emp
		w_busca_cuenta.dw_1.retrieve(i_emp)
	end if
end if
end event

event constructor;insertrow(1)
end event

type sle_1 from singlelineedit within tp_1
integer x = 677
integer y = 76
integer width = 1376
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within tp_1
integer x = 398
integer y = 16
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
string text = "Cta Origen"
boolean focusrectangle = false
end type

type dw_org from datawindow within tp_1
event keyup pbm_dwnkey
integer x = 23
integer y = 16
integer width = 649
integer height = 136
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_paraediciones"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;if i_emp='' then return
f_busca_cuenta(key,i_emp,this)

end event

event constructor;insertrow(1)
end event

event getfocus;if isvalid(w_busca_cuenta) then 
	w_busca_cuenta.i_st.dw=this
	w_busca_cuenta.i_semovio=false
	if w_busca_cuenta.i_st.codemp<>i_emp then
		w_busca_cuenta.i_st.codemp=i_emp
		w_busca_cuenta.dw_1.retrieve(i_emp)
	end if
end if

end event

event itemchanged;string revisa,otro
otro=gettext()
setnull(revisa)
select descrip into :revisa from cont_plan where codtotal=:otro and cod_empresa=:i_emp and movimiento='1';
if isnull(revisa) then
	sle_1.text=revisa
	return 1
else
	sle_1.text=revisa	
end if
pb_ref.enabled=true
end event

type dw_trae from datawindow within tp_1
integer x = 32
integer y = 168
integer width = 4338
integer height = 1264
integer taborder = 10
string title = "none"
string dataobject = "dw_ctas_a_reclasificar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)

end event

event buttonclicked;long esco=0,j
if dwo.text='Desele.' then
	dwo.text='Selecc.'
else
	dwo.text='Desele.'
	esco=1
end if
for j=1 to rowcount()
	setitem(j,'esco',esco)
next

end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4430
integer height = 1468
long backcolor = 67108864
string text = "Reclasifica"
long tabtextcolor = 33554432
string picturename = "facturas.ico"
long picturemaskcolor = 536870912
dw_recla dw_recla
pb_save pb_save
end type

on tp_2.create
this.dw_recla=create dw_recla
this.pb_save=create pb_save
this.Control[]={this.dw_recla,&
this.pb_save}
end on

on tp_2.destroy
destroy(this.dw_recla)
destroy(this.pb_save)
end on

type dw_recla from datawindow within tp_2
integer x = 46
integer y = 28
integer width = 4073
integer height = 1356
integer taborder = 70
string title = "none"
string dataobject = "dw_clasif_cartera_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event constructor;settransobject(sqlca)

end event

type pb_save from picturebutton within tp_2
string tag = "Guarda"
integer x = 4215
integer y = 24
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guarda Reclasificación "
end type

event clicked;long l_i,i_ndoc
string err

sqlca.autocommit=false
i_ndoc=f_trae_ndoc(i_coddoc,clugar,'Reclasificacion Cartera')
if i_ndoc=-1 then return -1
dw_cab.setitem(dw_cab.getrow(),'reclasi',i_ndoc)

for l_i=1 to tab_1.tp_2.dw_recla.rowcount()
	tab_1.tp_2.dw_recla.setitem(l_i,'reclasi',i_ndoc)
next
if  dw_cab.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if  tab_1.tp_2.dw_recla.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

UPDATE car_cobro_cab 
SET cod_empresa = car_reclasifica_cpo.emp_des, .cta_contable = car_reclasifica_cpo.cta_des
FROM 
	car_reclasifica_cpo inner join car_cobro_cab on (car_reclasifica_cpo.num_cobro = car_cobro_cab.num_cobro) 
	and (car_reclasifica_cpo.coddoc_cobro = car_cobro_cab.coddoc) and (car_reclasifica_cpo.clugar_cobro = car_cobro_cab.clugar) 
WHERE 
	(((car_reclasifica_cpo.clugar)=:clugar) and ((car_reclasifica_cpo.coddoc)=:i_coddoc) 
	and ((car_reclasifica_cpo.reclasi)=:i_ndoc));
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando en car_cobro_cab lo nuevos totales',err)
	return -1
end if
commit;
sqlca.autocommit=true
pb_1.enabled=true
tab_1.tp_2.pb_save.enabled=false
tab_1.tp_1.dw_trae.reset()
tab_1.tp_1.enabled=false
tab_1.tp_1.visible=false
tab_1.post SelectTab (2)

end event

type dw_cab from datawindow within w_reclasif_cartera
integer x = 41
integer y = 72
integer width = 3584
integer height = 436
integer taborder = 10
string title = "none"
string dataobject = "dw_clasif_cartera"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event itemfocuschanged;if dw_cab.rowcount()=0 then return
tab_1.tp_2.dw_recla.retrieve(clugar,i_coddoc,dw_cab.getitemnumber(dw_cab.getrow(),'reclasi'))
if tab_1.tp_2.dw_recla.rowcount()>0 then 
	tab_1.tp_1.enabled=false
	tab_1.tp_1.visible=false
	tab_1.post SelectTab (2)
else
	tab_1.tp_1.enabled=true
end if
end event

