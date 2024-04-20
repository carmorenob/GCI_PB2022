$PBExportHeader$w_citas_arec.srw
forward
global type w_citas_arec from w_center
end type
type dw_serv_nofactu from datawindow within w_citas_arec
end type
type pb_borra from picturebutton within w_citas_arec
end type
type st_1 from statictext within w_citas_arec
end type
end forward

global type w_citas_arec from w_center
integer width = 3525
integer height = 1628
string title = "Realizar Recibo de Caja a Citas"
string icon = "rec_caja.ico"
boolean clientedge = true
dw_serv_nofactu dw_serv_nofactu
pb_borra pb_borra
st_1 st_1
end type
global w_citas_arec w_citas_arec

type variables
string i_emp_e,i_cont_e
end variables

forward prototypes
public function integer f_busca_emp (ref string p_emp, ref string p_cont, ref string p_codta)
end prototypes

public function integer f_busca_emp (ref string p_emp, ref string p_cont, ref string p_codta);long donde
if p_emp='' or p_cont='' or isnull(p_emp) or isnull(p_cont) then
	if i_emp_e='' then
		if w_rec_caja.dw_emppac.rowcount()=1 then
			p_emp=w_rec_caja.dw_emppac.getitemstring(1,'codemp')
			p_cont=w_rec_caja.dw_emppac.getitemstring(1,'codcontrato')
			p_codta=w_rec_caja.dw_emppac.getitemstring(1,'codta')
			i_emp_e=p_emp
			i_cont_e=p_cont
		else
			openwithparm(w_escoge,w_rec_caja.dw_emppac)
			if message.doubleparm=0 then
				return -1
			else
				p_emp=w_rec_caja.dw_emppac.getitemstring(message.doubleparm,'codemp')
				p_cont=w_rec_caja.dw_emppac.getitemstring(message.doubleparm,'codcontrato')
				p_codta=w_rec_caja.dw_emppac.getitemstring(message.doubleparm,'codta')
				i_emp_e=p_emp
				i_cont_e=p_cont
			end if
		end if
	else
		donde=w_rec_caja.dw_emppac.find('codemp="'+i_emp_e+'" and codcontrato="'+i_cont_e+'"',1,w_rec_caja.dw_emppac.rowcount())
		p_codta=w_rec_caja.dw_emppac.getitemstring(donde,'codta')
		p_emp=i_emp_e
		p_cont=i_cont_e
	end if
else //buscar el codta
	donde=w_rec_caja.dw_emppac.find('codemp="'+p_emp+'" and codcontrato="'+p_cont+'"',1,w_rec_caja.dw_emppac.rowcount())
	if donde=0 then
		if p_emp='0' and p_cont='1' then
			p_codta='0'
			return 1
		end if
		messagebox("Atención",'El paciente ya no tiene la empresa '+p_emp +' y el contrato '+p_cont)
		return -1
	end if
	p_codta=w_rec_caja.dw_emppac.getitemstring(donde,'codta')
end if
return 1
end function

on w_citas_arec.create
int iCurrent
call super::create
this.dw_serv_nofactu=create dw_serv_nofactu
this.pb_borra=create pb_borra
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_serv_nofactu
this.Control[iCurrent+2]=this.pb_borra
this.Control[iCurrent+3]=this.st_1
end on

on w_citas_arec.destroy
call super::destroy
destroy(this.dw_serv_nofactu)
destroy(this.pb_borra)
destroy(this.st_1)
end on

type pb_grabar from w_center`pb_grabar within w_citas_arec
string tag = "&Aceptar"
integer x = 1426
integer y = 1332
string text = "         &a"
boolean default = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
end type

event pb_grabar::clicked;call super::clicked;string cproc,desproc,emp,cont,codta,sexo,estrato,clug_cita,clugar_ate
long j,cuantos=0,cantidad,nserv_cita,sec_cant_cita,ncita,edad,contador_ate,nser_ate
codta=w_rec_caja.dw_emppac.getitemstring(w_rec_caja.dw_emppac.getrow(),'codta')
edad=w_principal.dw_1.getitemnumber(1,'dias')
sexo=w_principal.dw_1.getitemstring(1,'sexo')
estrato=w_principal.dw_1.getitemstring(1,'estrato')
for j=1 to dw_serv_nofactu.rowcount()
	if dw_serv_nofactu.getitemstring(j,"esco")='1' then
		
		cproc=dw_serv_nofactu.getitemstring(j,"cproced")
		nserv_cita=dw_serv_nofactu.getitemnumber(j,"nservicio")
		clug_cita=dw_serv_nofactu.getitemstring(j,"clugar")
		cantidad=1		
		sec_cant_cita=dw_serv_nofactu.getitemnumber(j,"sec_cant")
		ncita=dw_serv_nofactu.getitemnumber(j,"ncita")
		desproc=dw_serv_nofactu.getitemstring(j,"descripcion")
		
		clugar_ate=dw_serv_nofactu.getitemstring(j,"clugar_ser")
		contador_ate=dw_serv_nofactu.getitemnumber(j,"contador")
		nser_ate=dw_serv_nofactu.getitemnumber(j,"nservicio_ing")

		setnull(emp)
		setnull(cont)
		if f_busca_emp(emp,cont,codta)=-1 then
			w_factura.blanquea()
			return
		end if
		
		//37 parametros ( p_codigo,  p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
		//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta,  p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
		//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
		//  p_sec_cant_cita,  p_fecha_cita,  p_hora_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat,  
		//  p_clug_trat, p_item_trat)
		
//		if w_rec_caja.lf_cargar_a(cproc,desproc,cantidad,'C','1','',emp,cont,0, &
//		  '',tipdoc,docu,edad,sexo,codta,estrato,'','','S',1,0, &
//		  '',0,'','','',0,'',ncita,clug_cita,nserv_cita,&
//		  sec_cant_cita,0,'',0,0,'',0,'','!',0,0,0)<>-1 then cuantos ++
		  
		 if w_rec_caja.lf_cargar_a(cproc,desproc,cantidad,'C','1','',emp,cont,0, &
		  '',tipdoc,docu,edad,sexo,codta,estrato,'','','S',1,contador_ate, &
		  clugar_ate,nser_ate,'','','',0,'',ncita,clug_cita,nserv_cita,&
		  sec_cant_cita,0,'',0,0,'',0,'','!',0,0,0,'','',0,'','',0,'0','')<>-1 then cuantos ++
		  
	end if 
next
w_rec_caja.resumen('S')
if w_rec_caja.dw_factura.rowcount()>0 then w_rec_caja.pb_paci.enabled=false
if cuantos>0 then close(parent)
end event

type dw_serv_nofactu from datawindow within w_citas_arec
integer y = 152
integer width = 3456
integer height = 1148
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_citas_areci"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve(tipdoc,docu)
end event

type pb_borra from picturebutton within w_citas_arec
event mousemove pbm_mousemove
integer x = 1591
integer y = 1332
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type st_1 from statictext within w_citas_arec
integer x = 366
integer y = 32
integer width = 2834
integer height = 104
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "El Paciente tiene los siguientes servicios asignados en citas, marque a los que desea hacerle recibo y presione aceptar."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

