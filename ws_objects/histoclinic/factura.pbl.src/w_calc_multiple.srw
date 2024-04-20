$PBExportHeader$w_calc_multiple.srw
forward
global type w_calc_multiple from window
end type
type pb_cancel from picturebutton within w_calc_multiple
end type
type pb_aceptar from picturebutton within w_calc_multiple
end type
type dw_calcula from datawindow within w_calc_multiple
end type
end forward

global type w_calc_multiple from window
integer width = 3333
integer height = 1280
boolean titlebar = true
string title = "Cálculo de cirugías múltiples"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean clientedge = true
boolean center = true
pb_cancel pb_cancel
pb_aceptar pb_aceptar
dw_calcula dw_calcula
end type
global w_calc_multiple w_calc_multiple

type variables
st_cambia_resp st_dws
end variables

forward prototypes
public subroutine recalcula ()
end prototypes

public subroutine recalcula ();long acto,priori,buscaprof,buscavia,consec,j
string prof,via,multiple
for j=2 to dw_calcula.rowcount()
	consec=long(dw_calcula.describe("evaluate('cumulativeSum( 1 for group 1 )',"+string(j)+")"))
	if consec>1 then
		acto=dw_calcula.getitemnumber(j,"acto")
		prof=dw_calcula.getitemstring(j,"profe")
		priori=dw_calcula.getitemnumber(j,"prioridad")
		via=dw_calcula.getitemstring(j,"via")
		buscaprof=dw_calcula.find("profe='"+prof+"' and acto="+string(acto)+" and prioridad<> "+string(priori),1,dw_calcula.rowcount())
		buscavia=dw_calcula.find("via='"+via+"' and acto="+string(acto)+" and prioridad<> "+string(priori),1,dw_calcula.rowcount())
		if buscaprof=0 then
			multiple="mde"
		else
			multiple="mie"
		end if
		if buscavia=0 then
			multiple+="dv"
		else
			multiple+="iv"
		end if
		dw_calcula.setitem(j,"multiple",multiple)
	end if
next
end subroutine

event open;st_dws=message.powerobjectparm
long j
for j=1 to st_dws.dw_factura.rowcount()
	if st_dws.dw_factura.getitemstring(j,"tipo_proc")='P' or st_dws.dw_factura.getitemstring(j,"tipo_proc")='Q' then
		dw_calcula.insertrow(1)
		dw_calcula.setitem(1,"cproced",st_dws.dw_factura.getitemstring(j,"cproc"))
		dw_calcula.setitem(1,"desproced",st_dws.dw_factura.getitemstring(j,"descripcion"))
		dw_calcula.setitem(1,"tipocir",st_dws.dw_factura.getitemstring(j,"tipo_cir"))
		dw_calcula.setitem(1,"manual",st_dws.dw_factura.getitemstring(j,"cod_manual"))
		if st_dws.dw_factura.getitemstring(j,"tipo_proc")='P' then
			dw_calcula.setitem(1,"grupo",9999)
		else
			if st_dws.dw_factura.getitemstring(j,"grupo")="" or isnull(st_dws.dw_factura.getitemstring(j,"grupo"))then
				dw_calcula.setitem(1,"grupo",st_dws.dw_factura.getitemnumber(j,"puntos"))
			else
				dw_calcula.setitem(1,"grupo",long(st_dws.dw_factura.getitemstring(j,"grupo")))
			end if
		end if
		dw_calcula.setitem(1,"tdoc",st_dws.dw_factura.getitemstring(j,"tipodoc"))
		dw_calcula.setitem(1,"docu",st_dws.dw_factura.getitemstring(j,"docu"))
		dw_calcula.setitem(1,"valor",st_dws.dw_factura.getitemnumber(j,"vt_proc"))
		dw_calcula.setitem(1,"prioridad",st_dws.dw_factura.getitemnumber(j,"numero"))
		dw_calcula.setitem(1,"acto",st_dws.dw_factura.getitemnumber(j,"acto"))
		dw_calcula.setitem(1,"profe",st_dws.dw_factura.getitemstring(j,"profe"))
		dw_calcula.setitem(1,"via",st_dws.dw_factura.getitemstring(j,"via"))
	end if
next
dw_calcula.sort()
recalcula()
end event

on w_calc_multiple.create
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.dw_calcula=create dw_calcula
this.Control[]={this.pb_cancel,&
this.pb_aceptar,&
this.dw_calcula}
end on

on w_calc_multiple.destroy
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.dw_calcula)
end on

type pb_cancel from picturebutton within w_calc_multiple
integer x = 1458
integer y = 1036
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &c"
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_calc_multiple
string tag = "&Acpetar"
integer x = 1303
integer y = 1036
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;long j,num_padre,k,vale,borrar,cuantoes,fila
string quees,manual,tipoliq,sqlstatement,proc
dw_calcula.accepttext()
DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
for j=1 to st_dws.dw_factura.rowcount()//para marcar alla cmo recalculados
	if st_dws.dw_factura.getitemstring(j,'tipo_proc')='P' or st_dws.dw_factura.getitemstring(j,'tipo_proc')='Q' then st_dws.dw_factura.setitem(j,'recalculo',1)
next
for j=1 to dw_calcula.rowcount()
	num_padre=dw_calcula.getitemnumber(j,"prioridad")
	fila=st_dws.dw_factura.find("numero="+string(num_padre),1,st_dws.dw_factura.rowcount())
	quees=dw_calcula.getitemstring(j,"multiple")
	if isnull(quees) then quees='norm'
	st_dws.dw_factura.setitem(fila,"multiple",quees)
	st_dws.dw_factura.setitem(fila,"nacto",dw_calcula.getitemnumber(j,'acto'))
	st_dws.dw_factura.setitem(fila,"orden_qx",dw_calcula.getitemnumber(j,'consec'))
	
	if long(dw_calcula.describe("evaluate('cumulativeSum( 1 for group 1 )',"+string(j)+")"))>1 then 
		
		if isnull(quees) then
			messagebox("Atención","Debe escoger el tipo de cirugía múltiple de todas")
			return
		end if
		
		manual=dw_calcula.getitemstring(j,"manual")
		proc=dw_calcula.getitemstring(j,"cproced")
		select ctlqx into :tipoliq from manuales where codmanual=:manual;
		if dw_calcula.getitemnumber(j,"grupo")=9999 then
			if tipoliq="1" then //liqgrupo
				sqlstatement = "select "+quees+" from liqgrupo where codmanual='"+manual+"' and codservicio='"+proc+"'"
			else
				sqlstatement = "select "+quees+" from liquvr where codmanual='"+manual+"' and codservicio='"+proc+"'"
			end if
			PREPARE SQLSA FROM :sqlstatement ;
			OPEN DYNAMIC my_cursor ; 
			FETCH my_cursor INTO :cuantoes ;
			CLOSE my_cursor ;
			if tipoliq="1" then
				vale=f_aproxima_a((dw_calcula.getitemnumber(j,"valor")*cuantoes /100),100)
			else
				vale=f_aproxima_a((dw_calcula.getitemnumber(j,"valor")*cuantoes /100),1)
			end if
		else
			st_dws.dw_factura_cpo.setfilter("num_padre="+string(num_padre))
			st_dws.dw_factura_cpo.filter()
			vale=0
			borrar=st_dws.dw_factura_cpo.rowcount()
			for k=1 to borrar	
				if tipoliq="1" then
					st_dws.dw_factura_cpo.setitem(k,"valor",f_aproxima_a((st_dws.dw_factura_cpo.getitemnumber(k,"valor")*st_dws.dw_factura_cpo.getitemnumber(k,quees)/100),100))
					vale+=f_aproxima_a(st_dws.dw_factura_cpo.getitemnumber(k,"valor"),100)
				else
					st_dws.dw_factura_cpo.setitem(k,"valor",f_aproxima_a((st_dws.dw_factura_cpo.getitemnumber(k,"valor")*st_dws.dw_factura_cpo.getitemnumber(k,quees)/100),1))
					vale+=f_aproxima_a(st_dws.dw_factura_cpo.getitemnumber(k,"valor"),1)
				end if
			next
			st_dws.dw_factura_cpo.setfilter("valor=0")
			st_dws.dw_factura_cpo.filter()
			borrar=st_dws.dw_factura_cpo.rowcount()
			for k=1 to borrar
				st_dws.dw_factura_cpo.deleterow(0)
			next
		end if
		st_dws.dw_factura_cpo.accepttext()
		
		st_dws.dw_factura.scrolltorow(fila)
		if tipoliq="1" then
			st_dws.dw_factura.setitem(fila,"vp_unit",f_aproxima_a(vale,100))
		else
			st_dws.dw_factura.setitem(fila,"vp_unit",f_aproxima_a(vale,1))
		end if
		st_dws.dw_factura_cpo.setfilter("")
		st_dws.dw_factura_cpo.filter()
	end if
next
st_dws.dw_factura.accepttext()
closewithreturn(parent,'si')
end event

type dw_calcula from datawindow within w_calc_multiple
event p_itemchanged ( )
integer x = 18
integer y = 16
integer width = 3255
integer height = 992
integer taborder = 10
string title = "none"
string dataobject = "dw_calc_multiples"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
sort()
recalcula()

end event

event itemchanged;if getcolumnname()='acto' then post event p_itemchanged()

end event

event constructor;this.settransobject(sqlca)
end event

