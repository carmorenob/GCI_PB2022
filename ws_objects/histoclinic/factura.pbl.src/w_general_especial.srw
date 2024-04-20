$PBExportHeader$w_general_especial.srw
forward
global type w_general_especial from window
end type
type pb_cancel from picturebutton within w_general_especial
end type
type pb_aceptar from picturebutton within w_general_especial
end type
type st_descrip from statictext within w_general_especial
end type
type dw_liqgrupo from datawindow within w_general_especial
end type
end forward

global type w_general_especial from window
integer width = 3022
integer height = 1108
boolean titlebar = true
string title = "Liquidación de Especiales"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean clientedge = true
boolean center = true
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_descrip st_descrip
dw_liqgrupo dw_liqgrupo
end type
global w_general_especial w_general_especial

type variables
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

public function integer f_bloquea ();if dw_liqgrupo.rowcount()=0 or dw_liqgrupo.dataobject="dw_liq_generale_soat" then return 1
long donde
donde=dw_liqgrupo.find("configurado='C'",1,dw_liqgrupo.rowcount())
if donde> 0 then //quiere decir que existe en qxconfiguracion
	string sexo
	sexo=dw_liqgrupo.getitemstring(donde,"sexo")
	if sexo<>'A' then
		if sexo<>w_principal.dw_1.getitemstring(1,"sexo") then 
			messagebox("Atención","Esta cirugía no es para este sexo del paciente")
			return -1
		end if
	end if
end if
return 1
end function

public subroutine calcula ();string cual_col
int j
real vunit,porcent,cuanto
cual_col=""
if cual_col="" or isnull(cual_col) then return
dw_liqgrupo.setredraw(false)
dw_liqgrupo.setfilter("")
dw_liqgrupo.filter()
for j=1 to dw_liqgrupo.rowcount()
	vunit=dw_liqgrupo.getitemnumber(j,"vunit")
	porcent=dw_liqgrupo.getitemnumber(j,cual_col)/100
	dw_liqgrupo.setitem(j,"valor",vunit*porcent)
next
dw_liqgrupo.setfilter("valor > 0")
dw_liqgrupo.filter()
dw_liqgrupo.setredraw(true)
end subroutine

on w_general_especial.create
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_descrip=create st_descrip
this.dw_liqgrupo=create dw_liqgrupo
this.Control[]={this.pb_cancel,&
this.pb_aceptar,&
this.st_descrip,&
this.dw_liqgrupo}
end on

on w_general_especial.destroy
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_descrip)
destroy(this.dw_liqgrupo)
end on

event open;st_c = message.powerobjectparm
long donde,j,cual,k
real pormanual
string mod_qx, ojo
SELECT cadena into :mod_qx
FROM parametros_gen
WHERE (((codigo_para)=35));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 35')
	return -1
end if

choose case st_c.tiposerv
	case "E"
		dw_liqgrupo.dataobject="dw_liq_generale_soat"
		dw_liqgrupo.settransobject(sqlca)
		dw_liqgrupo.retrieve(st_c.codproc,st_c.manual)
		this.title= "Liquidación de Procedimientos Especiales"
end choose
if st_c.nuevo_edita="edita" then
	st_descrip.text=st_c.dw_factura.getitemstring(st_c.dw_factura.getrow(),"descripcion")
else
	st_descrip.text=st_c.desproc
end if
if st_c.nuevo_edita='nuevo' then
	pormanual=st_c.pormanual
//	ojo=st_c.tipo_cir //si es nueva queda nula, pero si viene de qx debe colocar los valores
else
	donde=st_c.dw_factura.getrow()
//	ojo=st_c.dw_factura.getitemstring(donde,"tipo_cir")
	pormanual=st_c.dw_factura.getitemnumber(donde,"por_manual")
end if
choose case st_c.nuevo_edita
	case "nuevo"
		calcula()
	case "edita"
end choose
st_c.valor=0
end event

event close;closewithreturn(this,st_c)
end event

type pb_cancel from picturebutton within w_general_especial
integer x = 1449
integer y = 848
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

type pb_aceptar from picturebutton within w_general_especial
integer x = 1294
integer y = 848
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

long num_padre
string l_tip_liq
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
////
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
if st_c.tiposerv="E" then
	for j=1 to dw_liqgrupo.rowcount()
		if dw_liqgrupo.getitemstring(j,"esco")='1' then
			otro=st_c.dw_factura_cpo.insertrow(0)
			st_c.dw_factura_cpo.setitem(otro,"num_padre",num_padre)
			st_c.dw_factura_cpo.setitem(otro,"numero",cuenta)
			st_c.dw_factura_cpo.setitem(otro,"tipo_proc",'2')			
			st_c.dw_factura_cpo.setitem(otro,"cproced",dw_liqgrupo.getitemstring(j,"codservicio"))
			//st_c.dw_factura_cpo.setitem(otro,"valor",dw_liqgrupo.getitemnumber(j,"valor"))
			if l_tip_liq='1' then
				st_c.dw_factura_cpo.setitem(otro,"valor",f_aproxima_a(dw_liqgrupo.getitemnumber(j,"valor"),100))
			else
				st_c.dw_factura_cpo.setitem(otro,"valor",dw_liqgrupo.getitemnumber(j,"valor"))
			end if
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
	st_c.dw_factura.setitem(st_c.dw_factura.getrow(),"recalculo",1)
end if
////
close(parent)
end event

type st_descrip from statictext within w_general_especial
integer x = 14
integer y = 36
integer width = 2907
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

type dw_liqgrupo from datawindow within w_general_especial
integer x = 9
integer y = 136
integer width = 2926
integer height = 696
integer taborder = 60
string title = "none"
string dataobject = "dw_liq_generale_soat"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;long j
for j=1 to this.rowcount()
//	if this.describe("evaluate(~"( if esco ='0' , 1,0)~","+string(j)+")" )='0' then
		if dwo.text='Cobrar' then
			this.setitem(j,'esco','1')
		else
			this.setitem(j,'esco','0')
		end if
//	end if
next
if dwo.text='Cobrar' then
	this.modify(string(dwo.name)+'.text="No Cobrar"')
else
	this.modify(string(dwo.name)+'.text="Cobrar"')
end if
this.accepttext()
this.sort()
end event

