$PBExportHeader$w_cirugias.srw
forward
global type w_cirugias from window
end type
type st_3 from statictext within w_cirugias
end type
type st_2 from statictext within w_cirugias
end type
type st_1 from statictext within w_cirugias
end type
type dw_via from datawindow within w_cirugias
end type
type dw_profe from datawindow within w_cirugias
end type
type cbx_bilateral from checkbox within w_cirugias
end type
type pb_cancel from picturebutton within w_cirugias
end type
type pb_aceptar from picturebutton within w_cirugias
end type
type st_descrip from statictext within w_cirugias
end type
type dw_liqgrupo from datawindow within w_cirugias
end type
type rb_incruenta from radiobutton within w_cirugias
end type
type rb_normal from radiobutton within w_cirugias
end type
type gb_2 from groupbox within w_cirugias
end type
end forward

global type w_cirugias from window
integer width = 2674
integer height = 1404
boolean titlebar = true
string title = "Liquidación de Grupos Quirúrgicos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean clientedge = true
boolean center = true
st_3 st_3
st_2 st_2
st_1 st_1
dw_via dw_via
dw_profe dw_profe
cbx_bilateral cbx_bilateral
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_descrip st_descrip
dw_liqgrupo dw_liqgrupo
rb_incruenta rb_incruenta
rb_normal rb_normal
gb_2 gb_2
end type
global w_cirugias w_cirugias

type variables
datawindowchild espe
string i_profe,i_especi
st_cirugia st_c
end variables

forward prototypes
public subroutine f_revisa ()
public function integer f_bloquea ()
public subroutine calcula ()
end prototypes

public subroutine f_revisa ();dw_liqgrupo.sort()
dw_liqgrupo.groupcalc()
if dw_liqgrupo.rowcount()=0 then return
long j
FOR J=1 to dw_liqgrupo.rowcount()
	if long(dw_liqgrupo.describe("evaluate('cumulativeSum( 1 for group 1 )',"+string(j)+")"))> 1 then
		dw_liqgrupo.deleterow(j)
		j --
	//	dw_liqgrupo.setitem(j,"mostrar",'0')
	//	end if
		if dw_liqgrupo.getitemstring(j,"obligatorio")='1' then dw_liqgrupo.setitem(j,"esco",'1')
	end if
next
end subroutine

public function integer f_bloquea ();if dw_liqgrupo.rowcount()=0 or dw_liqgrupo.dataobject="dw_liq_paq_soat" then return 1
long donde
donde=dw_liqgrupo.find("configurado='C'",1,dw_liqgrupo.rowcount())
if donde> 0 then //quiere decir que existe en qxconfiguracion
	string sexo
	sexo=dw_liqgrupo.getitemstring(donde,"sexo")
	if sexo<>'A' then
		if sexo <> st_c.sexo then 
			messagebox("Atención","Esta cirugía no es para este sexo del paciente")
			return -1
		end if
	end if
	if dw_liqgrupo.getitemstring(donde,"esincruento")='1' then
		rb_incruenta.checked=true
	else
		rb_normal.checked=true
	end if
	rb_normal.enabled=false
	rb_incruenta.enabled=false
	if dw_liqgrupo.getitemstring(donde,"esbilateral")='0' then
		cbx_bilateral.checked=false
		cbx_bilateral.enabled=false
	else
		cbx_bilateral.enabled=true
	end if
end if
return 1
end function

public subroutine calcula ();string cual_col
int j
real vunit,porcent,cuanto
cual_col=""
if rb_normal.checked then
	cual_col="normal"
	st_c.tipo_cir="n"
	if cbx_bilateral.checked then st_c.tipo_cir="nb"
end if
if rb_incruenta.checked then
	cual_col="incruento"
	st_c.tipo_cir="i"
	if cbx_bilateral.checked then st_c.tipo_cir="ib"
end if
if cual_col="" or isnull(cual_col) then return
dw_liqgrupo.setredraw(false)
dw_liqgrupo.setfilter("")
dw_liqgrupo.filter()
for j=1 to dw_liqgrupo.rowcount()
	vunit=dw_liqgrupo.getitemnumber(j,"vunit")
	porcent=dw_liqgrupo.getitemnumber(j,cual_col)/100
	if cbx_bilateral.checked then
		cuanto=vunit*porcent*(1+dw_liqgrupo.getitemnumber(j,"bilateral")/100)
		dw_liqgrupo.setitem(j,"valor",cuanto)
	else
		dw_liqgrupo.setitem(j,"valor",vunit*porcent)
	end if
next
dw_liqgrupo.setfilter("valor > 0")
dw_liqgrupo.filter()
dw_liqgrupo.setredraw(true)
end subroutine

on w_cirugias.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_via=create dw_via
this.dw_profe=create dw_profe
this.cbx_bilateral=create cbx_bilateral
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_descrip=create st_descrip
this.dw_liqgrupo=create dw_liqgrupo
this.rb_incruenta=create rb_incruenta
this.rb_normal=create rb_normal
this.gb_2=create gb_2
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.dw_via,&
this.dw_profe,&
this.cbx_bilateral,&
this.pb_cancel,&
this.pb_aceptar,&
this.st_descrip,&
this.dw_liqgrupo,&
this.rb_incruenta,&
this.rb_normal,&
this.gb_2}
end on

on w_cirugias.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_via)
destroy(this.dw_profe)
destroy(this.cbx_bilateral)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_descrip)
destroy(this.dw_liqgrupo)
destroy(this.rb_incruenta)
destroy(this.rb_normal)
destroy(this.gb_2)
end on

event open;st_c = message.powerobjectparm
long donde,j,cual,k
real pormanual
string ojo
dw_via.settransobject(sqlca)
if g_motor='postgres' then
	dw_profe.dataobject='dw_escogeprof_postgres'
else
	dw_profe.dataobject='dw_escogeprof'
end if
dw_profe.settransobject(sqlca)
dw_profe.getchild('cesp',espe)
espe.settransobject(sqlca)
espe.insertrow(1)
dw_profe.insertrow(1)
dw_via.insertrow(0)
dw_via.setfocus()
choose case st_c.tiposerv
	case "Q"
		dw_liqgrupo.dataobject="dw_liqgrupo2"
		dw_liqgrupo.settransobject(sqlca)
		dw_liqgrupo.retrieve(st_c.manual,st_c.grupo,st_c.codproc)
		f_revisa()
	case "P"
		dw_liqgrupo.dataobject="dw_liq_paq_soat"
		dw_liqgrupo.settransobject(sqlca)
		dw_liqgrupo.retrieve(st_c.codproc,st_c.manual)
		this.title= "Liquidación de Paquetes"
end choose
if st_c.nuevo_edita="edita" then
	st_descrip.text=st_c.dw_factura.getitemstring(st_c.dw_factura.getrow(),"descripcion")
else
	st_descrip.text=st_c.desproc
end if
if st_c.nuevo_edita='nuevo' then
	pormanual=st_c.pormanual
	ojo=st_c.tipo_cir //si es nueva queda nula, pero si viene de qx debe colocar los valores
else
	donde=st_c.dw_factura.getrow()
	ojo=st_c.dw_factura.getitemstring(donde,"tipo_cir")
	pormanual=st_c.dw_factura.getitemnumber(donde,"por_manual")
end if
for k=1 to dw_liqgrupo.rowcount()
	dw_liqgrupo.setitem(k,"vunit",dw_liqgrupo.getitemnumber(k,"vunit")*pormanual)
next
choose case ojo
	case "n"
		rb_normal.checked=true
	case "nb"
		rb_normal.checked=true
		cbx_bilateral.checked=true
	case "i"
		rb_incruenta.checked=true
	case "ib"
		rb_incruenta.checked=true
		cbx_bilateral.checked=true
	case else
		rb_normal.checked=true
end choose
if f_bloquea()=-1 then //si está en qxconfiguracion debe bloquear los encabezados
	pb_cancel.triggerevent(clicked!)
	return
end if
if st_c.tiposerv='Q' then
	if st_c.aneste='0' or st_c.aneste='1' then
		for j=1 to dw_liqgrupo.rowcount()
			if dw_liqgrupo.getitemstring(j,'codigocobro')='2' then
				dw_liqgrupo.setitem(j,'obligatorio','1')
				dw_liqgrupo.setitem(j,'esco',st_c.aneste)
			end if
		next
	end if
	if st_c.cod_auxqx='' or isnull(st_c.cod_auxqx) then
		for j=1 to dw_liqgrupo.rowcount()
			if dw_liqgrupo.getitemstring(j,'codigocobro')='3' then
				dw_liqgrupo.setitem(j,'obligatorio','1')
				dw_liqgrupo.setitem(j,'esco','0')
			end if
		next
	end if
end if
calcula()
choose case st_c.nuevo_edita
	case "nuevo"
		dw_via.setitem(1,1,st_c.via)
		dw_profe.setitem(1,1,st_c.prof_cir)
		if not isnull(st_c.prof_cir) then espe.retrieve(st_c.prof_cir)
		dw_profe.setitem(1,2,st_c.espe_cir)
	case "edita"
		dw_via.setitem(1,1,st_c.dw_factura.getitemstring(donde,"via"))
		dw_profe.setitem(1,1,st_c.dw_factura.getitemstring(donde,"profe"))
		espe.retrieve(st_c.dw_factura.getitemstring(donde,"profe"))
		dw_profe.setitem(1,2,st_c.dw_factura.getitemstring(donde,"espe"))
		if st_c.tiposerv="Q" then
			st_c.dw_factura_cpo.setfilter("num_padre="+string(st_c.dw_factura.getitemnumber(donde,"numero")))
			st_c.dw_factura_cpo.filter()
			for j=1 to st_c.dw_factura_cpo.rowcount()
				cual=dw_liqgrupo.find("codservicio='"+st_c.dw_factura_cpo.getitemstring(j,"cproced")+"'",1,dw_liqgrupo.rowcount())
				if cual<>0 then dw_liqgrupo.setitem(cual,"esco","1")
			next
			st_c.dw_factura_cpo.setfilter("")
			st_c.dw_factura_cpo.filter()
		end if
		dw_liqgrupo.setfocus()
		calcula()
end choose
st_c.valor=0
end event

event close;closewithreturn(this,st_c)

end event

type st_3 from statictext within w_cirugias
integer x = 1769
integer y = 212
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Especialidad"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cirugias
integer x = 1243
integer y = 212
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesional"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cirugias
integer x = 1472
integer y = 16
integer width = 302
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vía Ingreso:"
boolean focusrectangle = false
end type

type dw_via from datawindow within w_cirugias
integer x = 1797
integer y = 8
integer width = 841
integer height = 84
integer taborder = 40
string title = "none"
string dataobject = "dw_drop_via_ingreso"
boolean border = false
boolean livescroll = true
end type

type dw_profe from datawindow within w_cirugias
integer x = 1234
integer y = 132
integer width = 1403
integer height = 76
integer taborder = 50
string dragicon = "none!"
string dataobject = "dw_escogeprof"
boolean border = false
end type

event itemchanged;accepttext()
choose case getcolumn()
	case 1
		setitem(1,2,"")
		i_profe=getitemstring(1,1)
		espe.retrieve(i_profe)
		if espe.rowcount() < 1 then 
			messagebox("Atención","Profesional no tiene asignada Especialidad")
		else
			setitem(1,2,espe.getitemstring(1,1))
		end if
	case 2
		i_especi = getitemstring(1,2)
end choose

end event

type cbx_bilateral from checkbox within w_cirugias
integer x = 887
integer y = 52
integer width = 343
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bilateral"
end type

event clicked;calcula()
end event

type pb_cancel from picturebutton within w_cirugias
integer x = 1266
integer y = 1120
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_cirugias
integer x = 1111
integer y = 1120
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Acpetar [Alt+A]"
end type

event clicked;real pormanual
dec cuanto
long donde,j,otro,cuenta,cuantos,acobrar
dw_liqgrupo.accepttext()
if dw_liqgrupo.rowcount()=0 then
	messagebox("Error","No se han configurado valores para este procedimiento revise Tarifas y Servicios del manual")
	return
end if
cuanto=dec(dw_liqgrupo.getitemnumber(1,"vtotal"))
if cuanto=0 then
	Messagebox("Atención","Elija los procedimientos a cobrar")
	return
end if
if isnull(dw_via.getitemstring(1,1)) or dw_via.getitemstring(1,1)='' then
	Messagebox("Atención","Elija la vía de ingreso")
	return
end if
if isnull(dw_profe.getitemstring(1,1)) or dw_profe.getitemstring(1,1)='' or isnull(dw_profe.getitemstring(1,2)) or dw_profe.getitemstring(1,2)='' then
	Messagebox("Atención","Elija el profesional y la especialidad")
	return
end if

long num_padre
st_c.via=dw_via.getitemstring(1,1)
st_c.prof_cir=dw_profe.getitemstring(1,1)
st_c.espe_cir=dw_profe.getitemstring(1,2)
if st_c.nuevo_edita="nuevo" then
	donde=st_c.dw_factura.rowcount()+st_c.dw_factura.FilteredCount ( ) +1
	num_padre=donde
	pormanual=st_c.pormanual
else
	donde=st_c.dw_factura.getrow()
	num_padre=st_c.dw_factura.getitemnumber(donde,"numero")
	pormanual=st_c.dw_factura.getitemnumber(donde,"por_manual")
end if
st_c.valor=cuanto/pormanual
cuenta=1
if st_c.tiposerv="Q" and st_c.nuevo_edita="edita" then //borrar los que ya están
	st_c.dw_factura_cpo.setfilter("num_padre="+string(num_padre))
	st_c.dw_factura_cpo.filter()
	cuantos=st_c.dw_factura_cpo.rowcount()
	for j = 1 to cuantos
		st_c.dw_factura_cpo.deleterow(0)
	next
	st_c.dw_factura_cpo.setfilter("")
	st_c.dw_factura_cpo.filter()
end if
if st_c.tiposerv="Q" then
	for j=1 to dw_liqgrupo.rowcount()
		if dw_liqgrupo.getitemstring(j,"esco")='1' then
			otro=st_c.dw_factura_cpo.insertrow(0)
			st_c.dw_factura_cpo.setitem(otro,"num_padre",num_padre)
			st_c.dw_factura_cpo.setitem(otro,"numero",cuenta)
			st_c.dw_factura_cpo.setitem(otro,"tipo_proc",'2')
			st_c.dw_factura_cpo.setitem(otro,"cproced",dw_liqgrupo.getitemstring(j,"codservicio"))
			st_c.dw_factura_cpo.setitem(otro,"valor",dw_liqgrupo.getitemnumber(j,"valor"))
			st_c.dw_factura_cpo.setitem(otro,"cantidad",1)
			st_c.dw_factura_cpo.setitem(otro,"cod_manual",st_c.manual)
			st_c.dw_factura_cpo.setitem(otro,"nombre",dw_liqgrupo.getitemstring(j,"descripcion"))
			st_c.dw_factura_cpo.setitem(otro,"mieiv",dw_liqgrupo.getitemnumber(j,"mieiv"))
			st_c.dw_factura_cpo.setitem(otro,"miedv",dw_liqgrupo.getitemnumber(j,"miedv"))
			st_c.dw_factura_cpo.setitem(otro,"mdeiv",dw_liqgrupo.getitemnumber(j,"mdeiv"))
			st_c.dw_factura_cpo.setitem(otro,"mdedv",dw_liqgrupo.getitemnumber(j,"mdedv"))
			cuenta++
		end if
	next
end if
if st_c.nuevo_edita="edita" then
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"vp_unit",cuanto)
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"tipo_cir",st_c.tipo_cir)
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"profe",st_c.prof_cir)
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"espe",st_c.espe_cir)
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"via",st_c.via)
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"recalculo",0)
end if
close(parent)
end event

type st_descrip from statictext within w_cirugias
integer x = 14
integer y = 300
integer width = 2610
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_liqgrupo from datawindow within w_cirugias
integer x = 9
integer y = 400
integer width = 2610
integer height = 696
integer taborder = 60
string title = "none"
string dataobject = "dw_liqgrupo2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;long j
for j=1 to this.rowcount()
	if this.describe("evaluate(~"if (obligatorio='1' or ( sum( long( codigocobro ) for all )<>0 and  codigocobro ='0' ) , 1,0)~","+string(j)+")" )='0' then
		if dwo.text='Cobrar' then
			this.setitem(j,'esco','1')
		else
			this.setitem(j,'esco','0')
		end if
	end if
next
if dwo.text='Cobrar' then
	this.modify(string(dwo.name)+'.text="No Cobrar"')
else
	this.modify(string(dwo.name)+'.text="Cobrar"')
end if
this.accepttext()
this.sort()
end event

type rb_incruenta from radiobutton within w_cirugias
integer x = 457
integer y = 80
integer width = 343
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Incruenta"
end type

event clicked;calcula()
end event

type rb_normal from radiobutton within w_cirugias
integer x = 37
integer y = 92
integer width = 288
integer height = 64
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Normal"
boolean checked = true
end type

event clicked;calcula()
end event

type gb_2 from groupbox within w_cirugias
integer x = 5
integer y = 20
integer width = 864
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo de Cirugía:"
end type

