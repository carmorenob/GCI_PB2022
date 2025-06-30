$PBExportHeader$w_cirugias_uvr.srw
forward
global type w_cirugias_uvr from window
end type
type st_3 from statictext within w_cirugias_uvr
end type
type st_2 from statictext within w_cirugias_uvr
end type
type dw_profe from datawindow within w_cirugias_uvr
end type
type st_1 from statictext within w_cirugias_uvr
end type
type dw_via from datawindow within w_cirugias_uvr
end type
type cbx_bilateral from checkbox within w_cirugias_uvr
end type
type pb_cancel from picturebutton within w_cirugias_uvr
end type
type pb_aceptar from picturebutton within w_cirugias_uvr
end type
type st_descrip from statictext within w_cirugias_uvr
end type
type st_puntos from statictext within w_cirugias_uvr
end type
type dw_liqgrupo from datawindow within w_cirugias_uvr
end type
type rb_incruenta from radiobutton within w_cirugias_uvr
end type
type rb_normal from radiobutton within w_cirugias_uvr
end type
type gb_2 from groupbox within w_cirugias_uvr
end type
end forward

global type w_cirugias_uvr from window
integer width = 3849
integer height = 1336
boolean titlebar = true
string title = "Liquidación de Grupos Quirúrgicos por UVR"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean clientedge = true
boolean center = true
st_3 st_3
st_2 st_2
dw_profe dw_profe
st_1 st_1
dw_via dw_via
cbx_bilateral cbx_bilateral
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_descrip st_descrip
st_puntos st_puntos
dw_liqgrupo dw_liqgrupo
rb_incruenta rb_incruenta
rb_normal rb_normal
gb_2 gb_2
end type
global w_cirugias_uvr w_cirugias_uvr

type variables
datawindowchild idw_espe,idw_profe
st_cirugia st_c
string i_profe,i_especi
end variables
forward prototypes
public function integer f_bloquea ()
public subroutine calcula ()
end prototypes

public function integer f_bloquea ();if dw_liqgrupo.rowcount()=0 or dw_liqgrupo.dataobject="dw_liq_paq_iss" then return 1
long donde
donde=dw_liqgrupo.find("configurado='C'",1,dw_liqgrupo.rowcount())
if donde> 0 then //quiere decir que existe en qxconfiguracion
	string sexo
	sexo=dw_liqgrupo.getitemstring(1,"sexo")
	if sexo<>'A' then
		if sexo<>w_principal.dw_1.getitemstring(1,"sexo") then 
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
real vunit,porcent,bilate
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
dw_liqgrupo.setfilter("")
dw_liqgrupo.filter()
for j=1 to dw_liqgrupo.rowcount()
	vunit=dw_liqgrupo.getitemnumber(j,"vunit")
	porcent=dw_liqgrupo.getitemnumber(j,cual_col)/100
	if cbx_bilateral.checked then
		bilate=1+(dw_liqgrupo.getitemnumber(j,"bilateral")/100)
	else
		bilate=1
	end if
	if dw_liqgrupo.getitemstring(j,"tiposervicio")="M" then
		dw_liqgrupo.setitem(j,"valor",round(vunit*st_c.puntos*porcent*bilate,2))
	else
		dw_liqgrupo.setitem(j,"valor",round(vunit*porcent*bilate,2))
	end if
next
dw_liqgrupo.setfilter("valor > 0")
dw_liqgrupo.filter()
end subroutine

on w_cirugias_uvr.create
this.st_3=create st_3
this.st_2=create st_2
this.dw_profe=create dw_profe
this.st_1=create st_1
this.dw_via=create dw_via
this.cbx_bilateral=create cbx_bilateral
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_descrip=create st_descrip
this.st_puntos=create st_puntos
this.dw_liqgrupo=create dw_liqgrupo
this.rb_incruenta=create rb_incruenta
this.rb_normal=create rb_normal
this.gb_2=create gb_2
this.Control[]={this.st_3,&
this.st_2,&
this.dw_profe,&
this.st_1,&
this.dw_via,&
this.cbx_bilateral,&
this.pb_cancel,&
this.pb_aceptar,&
this.st_descrip,&
this.st_puntos,&
this.dw_liqgrupo,&
this.rb_incruenta,&
this.rb_normal,&
this.gb_2}
end on

on w_cirugias_uvr.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_profe)
destroy(this.st_1)
destroy(this.dw_via)
destroy(this.cbx_bilateral)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_descrip)
destroy(this.st_puntos)
destroy(this.dw_liqgrupo)
destroy(this.rb_incruenta)
destroy(this.rb_normal)
destroy(this.gb_2)
end on

event open;long donde,j,cual,k
string ojo,mod_qx
real pormanual

SELECT cadena into :mod_qx
FROM parametros_gen
WHERE (((codigo_para)=35));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 35')
	return -1
end if

dw_profe.getchild('codprof',idw_profe)
idw_profe.settransobject(sqlca)
idw_profe.retrieve(clugar)

idw_profe.getchild('cesp',idw_espe)
idw_espe.settransobject(sqlca)

dw_profe.retrieve(clugar)

st_c=message.powerobjectparm
dw_via.setfocus()
choose case st_c.tiposerv
	case "Q"
		dw_liqgrupo.dataobject="dw_liq_uvr2"
		dw_liqgrupo.settransobject(sqlca)
		dw_liqgrupo.retrieve(st_c.puntos,st_c.manual,st_c.codproc)
		st_puntos.text="Cirugía de: "+string(st_c.puntos)+" puntos"
		FOR J=1 to dw_liqgrupo.rowcount()
			if long(dw_liqgrupo.describe("evaluate('cumulativeSum( 1 for group 1 )',"+string(j)+")"))> 1 then
				dw_liqgrupo.deleterow(j)
				j --
				if dw_liqgrupo.getitemstring(j,"obligatorio")='1' then dw_liqgrupo.setitem(j,"escog",'1')
			end if
		next
	case "P"
		dw_liqgrupo.dataobject="dw_liq_paq_iss"
		dw_liqgrupo.settransobject(sqlca)
		dw_liqgrupo.retrieve(st_c.codproc,st_c.manual)
		this.title="Liquidación de Paquetes"
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
	pormanual=st_c.dw_factura.getitemnumber(donde,"por_manual")
	ojo=st_c.dw_factura.getitemstring(donde,"tipo_cir")
end if
for k=1 to dw_liqgrupo.rowcount()
	dw_liqgrupo.setitem(k,"vunit",round(dw_liqgrupo.getitemnumber(k,"vunit")*pormanual,2))
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
if st_c.tiposerv="Q" then
	if st_c.aneste='0' or st_c.aneste='1' then
		for j=1 to dw_liqgrupo.rowcount()
			if dw_liqgrupo.getitemstring(j,'codigocobro')='2' then
				if mod_qx<>'1' then
					dw_liqgrupo.setitem(j,'obligatorio','1')
				end If
				dw_liqgrupo.setitem(j,'escog',st_c.aneste)
			end if
		next
	end if
	if st_c.cod_auxqx='' or isnull(st_c.cod_auxqx) then
		for j=1 to dw_liqgrupo.rowcount()
			if dw_liqgrupo.getitemstring(j,'codigocobro')='3' then
				if mod_qx<>'1' then
					dw_liqgrupo.setitem(j,'obligatorio','1')
				end if
				dw_liqgrupo.setitem(j,'escog','0')
			end if
		next
	end if
end if
calcula()
choose case st_c.nuevo_edita
	case "nuevo"
		dw_via.setitem(1,1,st_c.via)
		dw_profe.setitem(1,1,st_c.prof_cir)
		if not isnull(st_c.prof_cir) then idw_espe.retrieve(st_c.prof_cir)
		dw_profe.setitem(1,2,st_c.espe_cir)
		calcula()
	case "edita"
		dw_via.setitem(1,1,st_c.dw_factura.getitemstring(donde,"via"))
		dw_profe.setitem(1,1,st_c.dw_factura.getitemstring(donde,"profe"))
		idw_espe.retrieve(st_c.dw_factura.getitemstring(donde,"profe"))
		dw_profe.setitem(1,2,st_c.dw_factura.getitemstring(donde,"espe"))
		if st_c.tiposerv="Q" then
			st_c.dw_factura_cpo.setfilter("num_padre="+string(st_c.dw_factura.getitemnumber(donde,"numero")))
			st_c.dw_factura_cpo.filter()
			for j=1 to st_c.dw_factura_cpo.rowcount()
				cual=dw_liqgrupo.find("codservicio='"+st_c.dw_factura_cpo.getitemstring(j,"cproced")+"'",1,dw_liqgrupo.rowcount())
				if cual<>0 then 
					dw_liqgrupo.setitem(cual,"escog","1")
					dw_liqgrupo.setitem(cual,"valor",st_c.dw_factura_cpo.getitemnumber(j,"valor"))
				end if	
			next
			st_c.dw_factura_cpo.setfilter("")
			st_c.dw_factura_cpo.filter()
		end if
		dw_liqgrupo.setfocus()
end choose
st_c.valor=0
end event

event close;closewithreturn(this,st_c)
end event

type st_3 from statictext within w_cirugias_uvr
integer x = 2423
integer y = 204
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

type st_2 from statictext within w_cirugias_uvr
integer x = 1102
integer y = 204
integer width = 402
integer height = 60
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

type dw_profe from datawindow within w_cirugias_uvr
integer x = 1079
integer y = 124
integer width = 2670
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
		idw_espe.retrieve(i_profe)
		if idw_espe.rowcount() < 1 then 
			messagebox("Atención","Profesional no tiene asignada Especialidad")
		else
			setitem(1,2,idw_espe.getitemstring(1,1))
		end if
	case 2
		i_especi = getitemstring(1,2)
end choose


end event

event constructor;settransobject(sqlca)
getchild('cesp',idw_espe)
idw_espe.settransobject(sqlca)
idw_espe.insertrow(1)
insertrow(1)
end event

type st_1 from statictext within w_cirugias_uvr
integer x = 1463
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

type dw_via from datawindow within w_cirugias_uvr
integer x = 1783
integer y = 8
integer width = 1367
integer height = 84
integer taborder = 40
string title = "none"
string dataobject = "dw_drop_via_ingreso"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(0)
setfocus()
end event

type cbx_bilateral from checkbox within w_cirugias_uvr
integer x = 937
integer y = 36
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

type pb_cancel from picturebutton within w_cirugias_uvr
integer x = 1563
integer y = 1080
integer width = 146
integer height = 128
integer taborder = 80
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

type pb_aceptar from picturebutton within w_cirugias_uvr
integer x = 1376
integer y = 1080
integer width = 146
integer height = 128
integer taborder = 70
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

event clicked;if dw_liqgrupo.rowcount()=0 then
	messagebox("Error","No se han configurado valores para este procedimiento revise Tarifas y Servicios del manual")
	return
end if
if isnull(dw_via.getitemstring(1,1)) or dw_via.getitemstring(1,1)=''  then
	Messagebox("Atención","Elija la vía de ingreso")
	return
end if
if isnull(dw_profe.getitemstring(1,1)) or dw_profe.getitemstring(1,1)='' or isnull(dw_profe.getitemstring(1,2)) or dw_profe.getitemstring(1,2)='' then
	Messagebox("Atención","Elija el profesional y la especialidad")
	return
end if
real cuanto,pormanual
long donde,j,otro,cuenta,cuantos
cuanto=dw_liqgrupo.getitemnumber(1,"vtotal")
if cuanto=0 then
	Messagebox("Atención","Elija los procedimientos a cobrar")
	return
end if
if isnull(dw_via.getitemstring(1,1)) then
	Messagebox("Atención","Elija la vía de ingreso")
	return
end if
if isnull(dw_profe.getitemstring(1,1)) or isnull(dw_profe.getitemstring(1,2)) then
	Messagebox("Atención","Elija el profesional y la especialidad")
	return
end if

long num_padre
st_c.via=dw_via.getitemstring(1,1)
st_c.prof_cir=dw_profe.getitemstring(1,1)
st_c.espe_cir=dw_profe.getitemstring(1,2)
if st_c.nuevo_edita="nuevo" then
	donde=st_c.dw_factura.rowcount()+st_c.dw_factura.filteredcount()+1
	num_padre=donde
	pormanual=st_c.pormanual
else
	donde=st_c.dw_factura.getrow()
	num_padre=st_c.dw_factura.getitemnumber(donde,"numero")
	pormanual=st_c.dw_factura.getitemdecimal(donde,"por_manual")
end if
st_c.valor=cuanto/pormanual //cuando es nuevo allá vuelve vy lo multiplica
cuenta=1
if st_c.tiposerv="Q" and st_c.nuevo_edita="edita" then
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
		if dw_liqgrupo.getitemstring(j,"escog")='1' then
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
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"vp_unit",dw_liqgrupo.getitemnumber(1,"vtotal"))
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"tipo_cir",st_c.tipo_cir)
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"profe",st_c.prof_cir)
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"espe",st_c.espe_cir)
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"via",st_c.via)
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"recalculo",1)
end if
close(parent)
end event

type st_descrip from statictext within w_cirugias_uvr
integer x = 32
integer y = 268
integer width = 3003
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

type st_puntos from statictext within w_cirugias_uvr
integer x = 3109
integer y = 272
integer width = 626
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

type dw_liqgrupo from datawindow within w_cirugias_uvr
integer x = 32
integer y = 348
integer width = 3735
integer height = 696
integer taborder = 60
string title = "none"
string dataobject = "dw_liq_uvr2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicking;long j
for j=1 to rowcount()
	if describe("evaluate(~"if (obligatorio='1' or ( sum( long( codigocobro ) for all )<>0 and  codigocobro ='0' ) , 1,0)~","+string(j)+")" )='0' then
		if dwo.text='Cobrar' then
			setitem(j,'escog','1')
		else
			setitem(j,'escog','0')
		end if
	end if
next
if dwo.text='Cobrar' then
	modify(string(dwo.name)+'.text="No Cobrar"')
else
	modify(string(dwo.name)+'.text="Cobrar"')
end if
end event

type rb_incruenta from radiobutton within w_cirugias_uvr
integer x = 448
integer y = 68
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

type rb_normal from radiobutton within w_cirugias_uvr
integer x = 69
integer y = 80
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
end type

event clicked;calcula()
end event

type gb_2 from groupbox within w_cirugias_uvr
integer x = 37
integer y = 8
integer width = 823
integer height = 176
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

