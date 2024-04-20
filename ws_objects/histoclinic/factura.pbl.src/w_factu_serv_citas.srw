$PBExportHeader$w_factu_serv_citas.srw
forward
global type w_factu_serv_citas from window
end type
type rb_2 from radiobutton within w_factu_serv_citas
end type
type rb_1 from radiobutton within w_factu_serv_citas
end type
type pb_cancel from picturebutton within w_factu_serv_citas
end type
type pb_aceptar from picturebutton within w_factu_serv_citas
end type
type dw_serv_nofactu from datawindow within w_factu_serv_citas
end type
type st_1 from statictext within w_factu_serv_citas
end type
type dw_qx from datawindow within w_factu_serv_citas
end type
type dw_det_qx from datawindow within w_factu_serv_citas
end type
type gb_1 from groupbox within w_factu_serv_citas
end type
end forward

global type w_factu_serv_citas from window
integer width = 3168
integer height = 1620
boolean titlebar = true
string title = "Facturar Servicios ya Prestados o de Citas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "RunReport5!"
boolean clientedge = true
boolean center = true
rb_2 rb_2
rb_1 rb_1
pb_cancel pb_cancel
pb_aceptar pb_aceptar
dw_serv_nofactu dw_serv_nofactu
st_1 st_1
dw_qx dw_qx
dw_det_qx dw_det_qx
gb_1 gb_1
end type
global w_factu_serv_citas w_factu_serv_citas

type variables
string i_emp_e,i_cont_e,i_reconf_emp,i_tipo_fac
st_cirugia sube
end variables

forward prototypes
public function integer f_busca_emp (ref string p_emp, ref string p_cont, ref string p_codta)
end prototypes

public function integer f_busca_emp (ref string p_emp, ref string p_cont, ref string p_codta);long donde,fila
if p_emp='' or p_cont='' or isnull(p_emp) or isnull(p_cont) then
	if i_emp_e='' then
		if isvalid(w_factura) then
			if w_factura.dw_emppac.rowcount()=1 then
				p_emp=w_factura.dw_emppac.getitemstring(1,'codemp')
				p_cont=w_factura.dw_emppac.getitemstring(1,'codcontrato')
				p_codta=w_factura.dw_emppac.getitemstring(1,'codta')
				i_emp_e=p_emp
				i_cont_e=p_cont
				i_tipo_fac=w_factura.dw_emppac.getitemstring(1,'tipo_fac')
			else
				if i_reconf_emp='1' then
					openwithparm(w_escoge,w_factura.dw_emppac)
					fila=message.doubleparm
				else
					fila=w_factura.dw_emppac.getrow()
				end if
				if fila<=0 then
					return -1
				else
					w_factura.dw_emppac.setfilter("estado='1'")
					w_factura.dw_emppac.filter()
					p_emp=w_factura.dw_emppac.getitemstring(fila,'codemp')
					p_cont=w_factura.dw_emppac.getitemstring(fila,'codcontrato')
					p_codta=w_factura.dw_emppac.getitemstring(fila,'codta')
					i_tipo_fac=w_factura.dw_emppac.getitemstring(fila,'tipo_fac')
					i_emp_e=p_emp
					i_cont_e=p_cont
					w_factura.dw_emppac.setfilter("")
					w_factura.dw_emppac.filter()
					
				end if
			end if
		end if
		if isvalid(w_rec_caja) then
			if w_rec_caja.dw_emppac.rowcount()=1 then
				p_emp=w_rec_caja.dw_emppac.getitemstring(1,'codemp')
				p_cont=w_rec_caja.dw_emppac.getitemstring(1,'codcontrato')
				p_codta=w_rec_caja.dw_emppac.getitemstring(1,'codta')
				i_emp_e=p_emp
				i_cont_e=p_cont
			else
				if i_reconf_emp='1' then
					openwithparm(w_escoge,w_rec_caja.dw_emppac)
					fila=message.doubleparm
				else
					fila=w_rec_caja.dw_emppac.getrow()
				end if
				if fila<=0 then
					return -1
				else
					p_emp=w_rec_caja.dw_emppac.getitemstring(fila,'codemp')
					p_cont=w_rec_caja.dw_emppac.getitemstring(fila,'codcontrato')
					p_codta=w_rec_caja.dw_emppac.getitemstring(fila,'codta')
					i_emp_e=p_emp
					i_cont_e=p_cont
				end if
			end if
		end if
		
	else
		if isvalid(w_factura) then
			donde=w_factura.dw_emppac.find('codemp="'+i_emp_e+'" and codcontrato="'+i_cont_e+'"',1,w_factura.dw_emppac.rowcount())
			p_codta=w_factura.dw_emppac.getitemstring(donde,'codta')
		end if
		if isvalid(w_rec_caja) then
			donde=w_rec_caja.dw_emppac.find('codemp="'+i_emp_e+'" and codcontrato="'+i_cont_e+'"',1,w_rec_caja.dw_emppac.rowcount())
			p_codta=w_rec_caja.dw_emppac.getitemstring(donde,'codta')
		end if
		p_emp=i_emp_e
		p_cont=i_cont_e
	end if
else //buscar el codta
	if isvalid(w_factura) then
		donde=w_factura.dw_emppac.find('codemp="'+p_emp+'" and codcontrato="'+p_cont+'"',1,w_factura.dw_emppac.rowcount())
	end if
	if isvalid(w_rec_caja) then
		donde=w_rec_caja.dw_emppac.find('codemp="'+p_emp+'" and codcontrato="'+p_cont+'"',1,w_rec_caja.dw_emppac.rowcount())
	end if
	if donde=0 then
		if p_emp='0' and p_cont='1' then
			p_codta='0'
			return 1
		end if
		messagebox("Atención",'El paciente ya no tiene la empresa '+p_emp +' y el contrato '+p_cont)
		return -1
	end if
	if isvalid(w_factura) then
		p_codta=w_factura.dw_emppac.getitemstring(donde,'codta')
		i_tipo_fac=w_factura.dw_emppac.getitemstring(donde,'tipo_fac')
	end if
	if isvalid(w_rec_caja) then
		p_codta=w_rec_caja.dw_emppac.getitemstring(donde,'codta')
		i_tipo_fac=w_rec_caja.dw_emppac.getitemstring(donde,'tipo_fac')
	end if
end if
return 1
end function

event open;sube=message.PowerObjectParm
i_reconf_emp='0'
rb_1.triggerevent(clicked!)
rb_1.checked=true
if dw_serv_nofactu.rowcount()=0 then
	rb_2.triggerevent(clicked!)
	rb_2.checked=true
	if dw_serv_nofactu.rowcount()=0 then close(this)
end if
	

end event

on w_factu_serv_citas.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.dw_serv_nofactu=create dw_serv_nofactu
this.st_1=create st_1
this.dw_qx=create dw_qx
this.dw_det_qx=create dw_det_qx
this.gb_1=create gb_1
this.Control[]={this.rb_2,&
this.rb_1,&
this.pb_cancel,&
this.pb_aceptar,&
this.dw_serv_nofactu,&
this.st_1,&
this.dw_qx,&
this.dw_det_qx,&
this.gb_1}
end on

on w_factu_serv_citas.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.dw_serv_nofactu)
destroy(this.st_1)
destroy(this.dw_qx)
destroy(this.dw_det_qx)
destroy(this.gb_1)
end on

type rb_2 from radiobutton within w_factu_serv_citas
integer x = 741
integer y = 52
integer width = 603
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Servicios ya prestados"
end type

event clicked;dw_serv_nofactu.dataobject="dw_serv_nofactu"
dw_serv_nofactu.settransobject(sqlca)
dw_serv_nofactu.retrieve(tipdoc,docu)
st_1.text="El Paciente tiene los siguientes servicios ya Recibidos sin Facturar, marque los que desea facturar y presione aceptar."
end event

type rb_1 from radiobutton within w_factu_serv_citas
integer x = 59
integer y = 52
integer width = 494
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Citas no atendidas"
boolean checked = true
end type

event clicked;dw_serv_nofactu.dataobject="dw_citas_afactu"
dw_serv_nofactu.settransobject(sqlca)
dw_serv_nofactu.retrieve(tipdoc,docu)
st_1.text="El Paciente tiene los siguientes servicios asignados en citas, marque los que desea facturar y presione aceptar."
end event

type pb_cancel from picturebutton within w_factu_serv_citas
event mousemove pbm_mousemove
integer x = 1454
integer y = 1372
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;Close(parent)
end event

type pb_aceptar from picturebutton within w_factu_serv_citas
event mousemove pbm_mousemove
integer x = 1289
integer y = 1372
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar y facturar [Alt+A]"
end type

event clicked;long filas,j 
for j=1 to dw_serv_nofactu.rowcount()
	if dw_serv_nofactu.getitemstring(j,"esco")='1' then
		filas=sube.dw_factura.insertrow(0)
	//	if rb_2.checked then
			sube.dw_factura.setitem(filas,'fecha',dw_serv_nofactu.getitemdatetime(j,'fecha'))
			sube.dw_factura.setitem(filas,'cantidad',dw_serv_nofactu.getitemnumber(j,'cantidad'))
			sube.dw_factura.setitem(filas,'cproced',dw_serv_nofactu.getitemstring(j,'cproced'))
			sube.dw_factura.setitem(filas,'descripcion',dw_serv_nofactu.getitemstring(j,'descripcion'))
			sube.dw_factura.setitem(filas,'contador',dw_serv_nofactu.getitemnumber(j,'contador'))
			sube.dw_factura.setitem(filas,'clugar',dw_serv_nofactu.getitemstring(j,'clugar'))
			sube.dw_factura.setitem(filas,'nservicio',dw_serv_nofactu.getitemnumber(j,'nservicio'))
			sube.dw_factura.setitem(filas,'nautoriza',dw_serv_nofactu.getitemstring(j,'nautoriza'))
			if rb_2.checked then
				sube.dw_factura.setitem(filas,'tipo',dw_serv_nofactu.getitemstring(j,'tipo'))
				sube.dw_factura.setitem(filas,'cons',dw_serv_nofactu.getitemnumber(j,'consec_soat'))
				sube.dw_factura.setitem(filas,'clugar_soat',dw_serv_nofactu.getitemstring(j,'clugar_soat'))
			else
				sube.dw_factura.setitem(filas,'tipo','C')
			end if
			sube.dw_factura.setitem(filas,'cufuncional',dw_serv_nofactu.getitemstring(j,'cufuncional'))
			sube.dw_factura.setitem(filas,'cccosto',dw_serv_nofactu.getitemstring(j,'cccosto'))
			sube.dw_factura.setitem(filas,'cemp',sube.prof_cir)
			sube.dw_factura.setitem(filas,'ccontrato',sube.espe_cir)


			sube.dw_factura.setitem(filas,'cplan',dw_serv_nofactu.getitemstring(j,'cplan'))
			sube.dw_factura.setitem(filas,'tipoing',sube.tipo_cir)
			sube.dw_factura.setitem(filas,'fila',sube.dw_factura.getitemnumber(1,'mfila'))
			sube.dw_factura.setitem(filas,'ncita',dw_serv_nofactu.getitemnumber(j,'ncita'))
			sube.dw_factura.setitem(filas,'clugar_cita',dw_serv_nofactu.getitemstring(j,'clugar_cita'))
			sube.dw_factura.setitem(filas,'nservicio',dw_serv_nofactu.getitemnumber(j,'nserv_turno'))
			sube.dw_factura.setitem(filas,'sec_cant',dw_serv_nofactu.getitemnumber(j,"sec_cant"))
//		end if
		
//			cproc=dw_serv_nofactu.getitemstring(j,"cproced")
//			desproc=dw_serv_nofactu.getitemstring(j,"descripcion")
//			cantidad=dw_serv_nofactu.getitemnumber(j,"cantidad")
//			nserv_cita=dw_serv_nofactu.getitemnumber(j,"nserv_turno")
//			ncita=dw_serv_nofactu.getitemnumber(j,"ncita")
//			clug_cita=dw_serv_nofactu.getitemstring(j,"clugar_cita")
//			sec_cant_cita=dw_serv_nofactu.getitemnumber(j,"sec_cant")
//	
//			cc=dw_serv_nofactu.getitemstring(j,"cccosto")
//			uf=dw_serv_nofactu.getitemstring(j,"cufuncional")
//			emp=dw_serv_nofactu.getitemstring(j,"cemp")
//			cont=dw_serv_nofactu.getitemstring(j,"ccontrato")
//			ntrat=dw_serv_nofactu.getitemnumber(j,"ntratamiento")
//			clug_trat=dw_serv_nofactu.getitemstring(j,"clugar_tto")
//			item_trat=dw_serv_nofactu.getitemnumber(j,"item_tto")
//			nfact=dw_serv_nofactu.getitemnumber(j,"nfact")
//			c_lugar_fact=dw_serv_nofactu.getitemstring(j,"clugar_fac")
//			tipo_fac=dw_serv_nofactu.getitemstring(j,"tipo_fac")
//			item_fac=dw_serv_nofactu.getitemnumber(j,"nitem")
	end if
next
close(parent)
end event

type dw_serv_nofactu from datawindow within w_factu_serv_citas
integer x = 41
integer y = 296
integer width = 3054
integer height = 1068
integer taborder = 10
string title = "none"
string dataobject = "dw_serv_nofactu"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;int j
for j=1 to rowcount()
	if dwo.text='Facturar' or dwo.text='Cobrar' or dwo.text='Autoriza' then
		setrow(j)
		setitem(j,'esco','1')
	else
		setitem(j,'esco','0')
	end if
next
choose case dwo.text 
	case 'Facturar' 
		modify(string(dwo.name)+'.text="No Factur."')  
	case 'No Cobra' 
		modify(string(dwo.name)+'.text="Cobrar"') 
	case 'Cobrar' 
		modify(string(dwo.name)+'.text="No Cobra"') 
	case 'No Factur.'
	    modify(string(dwo.name)+'.text="Facturar"')
	case 'Autoriza'
	    modify(string(dwo.name)+'.text="No Auto"')
	case 'No Auto'
	    modify(string(dwo.name)+'.text="Autoriza"')
end choose

end event

type st_1 from statictext within w_factu_serv_citas
integer x = 37
integer y = 152
integer width = 3058
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "El Paciente tiene los siguientes servicios ya Recibidos sin Facturar, marque los que desea facturar y presione aceptar."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_qx from datawindow within w_factu_serv_citas
boolean visible = false
integer x = 2327
integer y = 1424
integer width = 686
integer height = 56
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_cotiza_qxsubcpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_det_qx from datawindow within w_factu_serv_citas
boolean visible = false
integer x = 50
integer y = 1412
integer width = 1120
integer height = 60
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_paci_qx"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type gb_1 from groupbox within w_factu_serv_citas
integer x = 41
integer width = 3154
integer height = 132
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Traer servicios de:"
end type

