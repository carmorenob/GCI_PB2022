$PBExportHeader$w_relacion_pago.srw
forward
global type w_relacion_pago from window
end type
type st_2 from statictext within w_relacion_pago
end type
type em_token from editmask within w_relacion_pago
end type
type mle_objeto from multilineedit within w_relacion_pago
end type
type st_1 from statictext within w_relacion_pago
end type
type pb_5 from pb_report within w_relacion_pago
end type
type pb_4 from picturebutton within w_relacion_pago
end type
type tab_1 from tab within w_relacion_pago
end type
type t1 from userobject within tab_1
end type
type dw_det from datawindow within t1
end type
type t1 from userobject within tab_1
dw_det dw_det
end type
type t2 from userobject within tab_1
end type
type dw_pdet from datawindow within t2
end type
type t2 from userobject within tab_1
dw_pdet dw_pdet
end type
type tab_1 from tab within w_relacion_pago
t1 t1
t2 t2
end type
type pb_3 from picturebutton within w_relacion_pago
end type
type pb_2 from picturebutton within w_relacion_pago
end type
type dw_cab from datawindow within w_relacion_pago
end type
type st_4 from statictext within w_relacion_pago
end type
type gb_1 from groupbox within w_relacion_pago
end type
end forward

global type w_relacion_pago from window
integer width = 5189
integer height = 2604
boolean titlebar = true
string title = "Relacion de Pagos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_planillap.ico"
st_2 st_2
em_token em_token
mle_objeto mle_objeto
st_1 st_1
pb_5 pb_5
pb_4 pb_4
tab_1 tab_1
pb_3 pb_3
pb_2 pb_2
dw_cab dw_cab
st_4 st_4
gb_1 gb_1
end type
global w_relacion_pago w_relacion_pago

type variables
datawindowchild idw_caja,idw_orig,idw_concep,idw_cuenta
boolean i_nuevo
string i_lugar,i_emp,i_caja,i_cdoc='PP',i_ppto,i_flujo
int i_dec_gral,i_aprox_gral
long i_fila
end variables

on w_relacion_pago.create
this.st_2=create st_2
this.em_token=create em_token
this.mle_objeto=create mle_objeto
this.st_1=create st_1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.tab_1=create tab_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.dw_cab=create dw_cab
this.st_4=create st_4
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.em_token,&
this.mle_objeto,&
this.st_1,&
this.pb_5,&
this.pb_4,&
this.tab_1,&
this.pb_3,&
this.pb_2,&
this.dw_cab,&
this.st_4,&
this.gb_1}
end on

on w_relacion_pago.destroy
destroy(this.st_2)
destroy(this.em_token)
destroy(this.mle_objeto)
destroy(this.st_1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.tab_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.dw_cab)
destroy(this.st_4)
destroy(this.gb_1)
end on

event open;SELECT ENTERO into :i_dec_gral
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


dw_cab.retrieve()
if dw_cab.rowcount()<1 then return
end event

type st_2 from statictext within w_relacion_pago
integer x = 2743
integer y = 596
integer width = 251
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clave"
boolean focusrectangle = false
end type

type em_token from editmask within w_relacion_pago
integer x = 3008
integer y = 580
integer width = 869
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type mle_objeto from multilineedit within w_relacion_pago
integer x = 2999
integer y = 268
integer width = 2112
integer height = 288
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean hscrollbar = true
boolean vscrollbar = true
textcase textcase = upper!
integer limit = 250
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_relacion_pago
integer x = 2743
integer y = 256
integer width = 251
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Concepto"
boolean focusrectangle = false
end type

type pb_5 from pb_report within w_relacion_pago
integer x = 3250
integer y = 96
integer taborder = 40
boolean bringtotop = true
string text = "        &p"
string cod_rep = "PP"
string nombre_rep = "Reposicion caja Menor"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if dw_cab.rowcount()<1 then return
any par[3]
par[1]=dw_cab.getitemstring(dw_cab.getrow(),"coddoc")
par[2]=dw_cab.getitemstring(dw_cab.getrow(),"clugar")
par[3]=dw_cab.getitemnumber(dw_cab.getrow(),"nplanilla")
imprimir(par,'','0')

end event

type pb_4 from picturebutton within w_relacion_pago
integer x = 2766
integer y = 96
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
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Inserta Nueva Relación"
end type

event clicked;tab_1.t1.enabled=false
tab_1.t2.enabled=true
tab_1.t2.dw_pdet.retrieve()
tab_1.selectedtab=2
mle_objeto.displayonly=false
mle_objeto.text=''
em_token.text=''
double ll_newrow

ll_newrow=	dw_cab.insertrow(1)
dw_cab.setitem(1,'clugar',clugar)
dw_cab.setitem(1,'coddoc',i_cdoc)
dw_cab.setitem(1,'usuario',usuario)
dw_cab.setitem(1,'fecha',datetime(today(),now()))
pb_4.enabled=false
end event

type tab_1 from tab within w_relacion_pago
integer x = 23
integer y = 692
integer width = 5111
integer height = 1484
integer taborder = 50
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
t1 t1
t2 t2
end type

on tab_1.create
this.t1=create t1
this.t2=create t2
this.Control[]={this.t1,&
this.t2}
end on

on tab_1.destroy
destroy(this.t1)
destroy(this.t2)
end on

type t1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5074
integer height = 1356
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "pesos_deta.ico"
long picturemaskcolor = 536870912
string powertiptext = "Detalle de la reposición "
dw_det dw_det
end type

on t1.create
this.dw_det=create dw_det
this.Control[]={this.dw_det}
end on

on t1.destroy
destroy(this.dw_det)
end on

type dw_det from datawindow within t1
integer x = 32
integer y = 32
integer width = 4398
integer height = 1352
integer taborder = 10
string title = "none"
string dataobject = "dw_rfc_planilla"
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
i_fila=-1
openwithparm(w_funcion_dw,st_dw)

end event

type t2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5074
integer height = 1356
boolean enabled = false
long backcolor = 67108864
string text = "Recepciones sin Planilla"
long tabtextcolor = 33554432
string picturename = "pagos.ico"
long picturemaskcolor = 536870912
dw_pdet dw_pdet
end type

on t2.create
this.dw_pdet=create dw_pdet
this.Control[]={this.dw_pdet}
end on

on t2.destroy
destroy(this.dw_pdet)
end on

type dw_pdet from datawindow within t2
integer x = 32
integer y = 32
integer width = 4997
integer height = 1252
integer taborder = 20
string title = "none"
string dataobject = "dw_rfc_sinplanilla"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;long j,esco=1
if dwo.text='Deselecc.' then 
	esco=0
	dwo.text='Escoger'
else
	dwo.text='Deselecc.'
end if
for j=1 to rowcount()
	setitem(j,'esco',esco)
next


end event

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
i_fila=-1
openwithparm(w_funcion_dw,st_dw)

end event

type pb_3 from picturebutton within w_relacion_pago
integer x = 3081
integer y = 96
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
string picturename = "guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;double nrepo,i
if isnull(mle_objeto.text) or len(mle_objeto.text)=0 then
	messagebox('Atención','Campo concepto es obligatorio')
	mle_objeto.setfocus()
	return -1
end if

nrepo=f_trae_ndoc(i_cdoc,i_lugar,'PLANILLA DE PAGOS')
if nrepo=-1 then return -1
dw_cab.setitem(dw_cab.getrow(),'nplanilla',nrepo)
dw_cab.setitem(dw_cab.getrow(),'valor',tab_1.t2.dw_pdet.getitemnumber(1,'ttneto'))
dw_cab.setitem(dw_cab.getrow(),'concepto',mle_objeto.text)
dw_cab.setitem(dw_cab.getrow(),'token',em_token.text)
for i = 1 to tab_1.t2.dw_pdet.rowcount()
	if  tab_1.t2.dw_pdet.getitemnumber(i,'esco')=1 then
		 tab_1.t2.dw_pdet.setitem(i,'clugar_pla',clugar)
 		 tab_1.t2.dw_pdet.setitem(i,'coddoc_pla',i_cdoc)
		 tab_1.t2.dw_pdet.setitem(i,'nplanilla',nrepo)		  
	end if
next

if dw_cab.update(true,false)=-1 then return
if  tab_1.t2.dw_pdet.update(true,false)=-1 then return
commit;
pb_4.enabled=true
dw_cab.resetupdate()
dw_cab.retrieve()
tab_1.t1.enabled=true
tab_1.t2.enabled=false
tab_1.selectedtab=1
mle_objeto.displayonly=false
tab_1.t2.dw_pdet.retrieve()
dw_cab.triggerevent(rowfocuschanged!)


end event

type pb_2 from picturebutton within w_relacion_pago
integer x = 2921
integer y = 96
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_cab.rowcount()=0 then return -1
if not isnull(dw_cab.getitemstring(dw_cab.getrow(),'estado'))then
	return
end if


st_xa_anular st_anula
double repo,j,k,vig,donde
string cl,cdoc,lest,err,rubro
decimal acumulado,valor


SELECT sum(v_pagado) into :vig from  tesorelfact
WHERE (((tesorelfact.clugar_pla)=:cl) AND ((tesorelfact.coddoc_pla)=:cdoc) AND ((tesorelfact.nplanilla)=:repo));

if vig>0 then 
	messagebox('Atención','No se Puede Anular hay ordenes de pago existentes')
	return -1
end if

st_anula.tipo='CM'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
dw_cab.setitem(dw_cab.getrow(),'estado',usuario)
dw_cab.setitem(dw_cab.getrow(),'fecha_anula',datetime(today()))
dw_cab.setitem(dw_cab.getrow(),'motiv_anula',st_anula.observacion)
dw_cab.setitem(dw_cab.getrow(),'cod_anula',st_anula.motivo)
repo=dw_cab.getitemnumber(dw_cab.getrow(),'nplanilla')
cl=dw_cab.getitemstring(dw_cab.getrow(),'clugar')
cdoc=dw_cab.getitemstring(dw_cab.getrow(),'coddoc')
	
UPDATE tesorelfact SET clugar_pla = Null, coddoc_pla = Null, nplanilla = Null
WHERE (((tesorelfact.clugar_pla)=:cl) AND ((tesorelfact.coddoc_pla)=:cdoc) AND ((tesorelfact.nplanilla)=:repo));
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando Tesorelfact',err)
	return -1
end if

if dw_cab.Update() = 1 then
	commit;
else
	rollback;
	return -1
end if
dw_cab.triggerevent(rowfocuschanged!)
pb_4.enabled=true
end event

type dw_cab from datawindow within w_relacion_pago
integer x = 23
integer y = 96
integer width = 2670
integer height = 572
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_teso_planilla_rfc"
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

event rowfocuschanged;tab_1.t1.dw_det.reset()
if getrow()<1 then return
tab_1.t1.dw_det.retrieve(getitemstring(getrow(),'clugar'),getitemstring(getrow(),'coddoc'),getitemnumber(getrow(),'nplanilla'))
mle_objeto.text=getitemstring(getrow(),'concepto')
em_token.text=getitemstring(getrow(),'token')
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
i_fila=-1
openwithparm(w_funcion_dw,st_dw)

end event

type st_4 from statictext within w_relacion_pago
integer x = 37
integer y = 24
integer width = 590
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
string text = "Historial Planilla de Pago"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_relacion_pago
integer x = 2729
integer y = 40
integer width = 709
integer height = 212
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

