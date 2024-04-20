$PBExportHeader$w_cambia_respon.srw
forward
global type w_cambia_respon from window
end type
type dw_deta from datawindow within w_cambia_respon
end type
type dw_cont from datawindow within w_cambia_respon
end type
type dw_emp from datawindow within w_cambia_respon
end type
type pb_2 from picturebutton within w_cambia_respon
end type
type pb_1 from picturebutton within w_cambia_respon
end type
type ln_1 from line within w_cambia_respon
end type
type ln_2 from line within w_cambia_respon
end type
type st_1 from statictext within w_cambia_respon
end type
end forward

global type w_cambia_respon from window
integer width = 2441
integer height = 1292
boolean titlebar = true
string title = "Cambiar responsable en Facturación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "factura.ico"
boolean clientedge = true
boolean contexthelp = true
boolean center = true
dw_deta dw_deta
dw_cont dw_cont
dw_emp dw_emp
pb_2 pb_2
pb_1 pb_1
ln_1 ln_1
ln_2 ln_2
st_1 st_1
end type
global w_cambia_respon w_cambia_respon

type variables
string proccups,manual,proceq,desproc,tiposerv,grupo,rips,cod_concep,que_paga,i_decual
real pormanual,pormax,pormin,cuanto_fijo,tope
dec valoru
int puntos
st_cambia_resp st_cr
end variables

on w_cambia_respon.create
this.dw_deta=create dw_deta
this.dw_cont=create dw_cont
this.dw_emp=create dw_emp
this.pb_2=create pb_2
this.pb_1=create pb_1
this.ln_1=create ln_1
this.ln_2=create ln_2
this.st_1=create st_1
this.Control[]={this.dw_deta,&
this.dw_cont,&
this.dw_emp,&
this.pb_2,&
this.pb_1,&
this.ln_1,&
this.ln_2,&
this.st_1}
end on

on w_cambia_respon.destroy
destroy(this.dw_deta)
destroy(this.dw_cont)
destroy(this.dw_emp)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.st_1)
end on

event open;st_cr=message.powerobjectparm
end event

type dw_deta from datawindow within w_cambia_respon
boolean visible = false
integer x = 1701
integer y = 1096
integer width = 366
integer height = 140
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_det_seg_respon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_cont from datawindow within w_cambia_respon
integer x = 55
integer y = 304
integer width = 2295
integer height = 672
integer taborder = 20
string title = "none"
string dataobject = "dw_contra_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string emp,cont,tingres,es_medica, tafil, estrato,tip_liq,plan,articulo,tipo_fac,cups_v
int edad
long j,filaf
uo_datastore dw_equiv
dw_equiv=create uo_datastore
dw_equiv.dataobject='dw_busca_equiv'
dw_equiv.settransobject(sqlca)
filaf=st_cr.dw_factura.getrow()
emp=dw_emp.getitemstring(1,1)
cont=dw_cont.getitemstring(dw_cont.getrow(),'codcontrato')
tipo_fac=dw_cont.getitemstring(dw_cont.getrow(),'tipoc')
if isvalid(st_cr.dw_acum_soat) then
	string soat
	select soat into :soat from contratos where codemp=:emp and codcontrato=:cont;
	if soat='1' then
		if st_cr.dw_acum_soat.find("emp='"+emp+"' and cont='"+cont+"'",1,st_cr.dw_acum_soat.rowcount())=0 then
			st_soat st
			setnull(st.nsoat)
			setnull(st.clug_soat)
			st.newemp=emp
			st.newcont=cont
			setnull(st.contador)
			setnull(st.clug_his)
			openwithparm(w_soat,st)
			if message.stringparm="!" or not isvalid(message.powerobjectparm) then return
			st=message.powerobjectparm
			st_cr.dw_acum_soat.retrieve(st.nsoat,st.clug_soat)
		end if
	end if
end if
tingres=st_cr.dw_factura.getitemstring(filaf,"tingres")
es_medica=st_cr.dw_factura.getitemstring(filaf,"es_medica")
proccups=st_cr.dw_factura.getitemstring(filaf,"proccups")
proceq=st_cr.dw_factura.getitemstring(filaf,"cproc")
articulo=st_cr.dw_factura.getitemstring(filaf,"articulo")
if isnull(es_medica) then es_medica='0'
estrato=w_principal.dw_1.getitemstring(1,"estrato")
select codta into :tafil from emppac where tipodoc=:tipdoc and documento=:docu and codemp=:emp and codcontrato=:cont;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo emppac",sqlca.sqlerrtext)
end if
edad=w_principal.dw_1.getitemnumber(1,"anyos")
if isnull(tafil) then tafil='0'
if dw_deta.retrieve(emp,cont,tingres,es_medica, edad , tafil, estrato)=0 then
	messagebox("Atención","Este contrato no se encuentra completamente configurado, reviselo en la parte de Estratos y/o Tipo de afiliación")
	return
end if
for j=1 to dw_deta.rowcount()
	plan=dw_deta.getitemstring(j,"cplan")
	if es_medica='1' then
		if not f_med_plan(plan,proccups) then continue
	else 
		if not f_proc_plan(proccups,plan) then continue
	end if
	if dw_deta.getitemstring(j,"tipo")='2' then //getareo
		if dw_deta.getitemstring(j,"confirma")='1' then
			if messagebox("Atención","Este paciente pertenece al st_cr.dw_factura. etareo: "+dw_deta.getitemstring(j,"desgetareo")+"?",question!,yesno!,1)=2 then goto otro
		end if
	end if
	manual=dw_deta.getitemstring(j,"codmanual")
	desproc=st_cr.dw_factura.getitemstring(filaf,"descripcion")
	tiposerv=st_cr.dw_factura.getitemstring(filaf,"tipo_proc")
	grupo=st_cr.dw_factura.getitemstring(filaf,"grupo")
	puntos=st_cr.dw_factura.getitemnumber(filaf,"puntos")
	tope=dw_deta.getitemnumber(j,"tope")
	rips=st_cr.dw_factura.getitemstring(filaf,"rips")
	cod_concep=st_cr.dw_factura.getitemstring(filaf,"cod_concep")
	pormanual=dw_deta.getitemnumber(j,"pormanual")
	select cod_version into :cups_v from proced where codproced=:proccups;
	
	if st_cr.dw_factura.getitemstring(filaf,"cod_manual") <> manual then 
		if es_medica='0' then	
			dw_equiv.retrieve(proccups,cups_v)
			dw_equiv.setfilter("codmanual='"+manual+"'")
			dw_equiv.filter()
			choose case dw_equiv.rowcount()
				case 0
					Messagebox("Atención","No existe equivalencias de este procedimiento en el manual "+manual)
					return
				case 1
					proceq=dw_equiv.getitemstring(1,"codservicio")
					desproc=dw_equiv.getitemstring(1,"descripcion")
					tiposerv=dw_equiv.getitemstring(1,"tiposervicio")
					grupo=dw_equiv.getitemstring(1,"grupo")
					puntos=dw_equiv.getitemnumber(1,"puntos")
					rips=dw_equiv.getitemstring(1,"rips")
					cod_concep=dw_equiv.getitemstring(1,"codconcepto")
				case else
					st_escoge_equiv st_eq
					st_eq.proccups=proccups
					st_eq.manual=manual
					st_eq.versi=cups_v
					long fill
					openwithparm(w_escoge_equiv,st_eq)
					fill=message.doubleparm
					if fill>0 then
						proceq=dw_equiv.getitemstring(fill,"codservicio")
						desproc=dw_equiv.getitemstring(fill,"descripcion")
						tiposerv=dw_equiv.getitemstring(fill,"tiposervicio")
						valoru=dw_equiv.getitemnumber(fill,"valor")
						grupo=dw_equiv.getitemstring(fill,"grupo")
						puntos=dw_equiv.getitemnumber(fill,"puntos")
						rips=dw_equiv.getitemstring(fill,"rips")
						cod_concep=dw_equiv.getitemstring(fill,"codconcepto")
					else
						return
					end if
			end choose
		end if
	end if
	///////////////  si no paga nada      ////////////////////////
	que_paga='nada'
	pormax=0
	pormin=0
	cuanto_fijo=0
	///////////////  por copago           ////////////////////////
	if dw_deta.getitemstring(j,"copago")='1' then
		que_paga='Copago'
		cuanto_fijo=dw_deta.getitemnumber(j,"copagoval")
		pormin=dw_deta.getitemnumber(j,"co_minimopor")
		pormax=dw_deta.getitemnumber(j,"co_maximopor")
	end if
	///////////////  por cuota moderadora ////////////////////////
	if dw_deta.getitemstring(j,"cuotamode")='1' then
		que_paga='Cuota Mode.'
		cuanto_fijo=dw_deta.getitemnumber(j,"cmval")
		pormin=dw_deta.getitemnumber(j,"cm_minimopor")
		pormax=dw_deta.getitemnumber(j,"cm_maximopor")
	end if
	///////////////  por cuota de recuperacion ////////////////////////
	if dw_deta.getitemstring(j,"cuotarecu")='1' then
		que_paga='Cuota Recu.'
		cuanto_fijo=dw_deta.getitemnumber(j,"cuotarecval")
		pormin=dw_deta.getitemnumber(j,"cr_minimopor")
		pormax=dw_deta.getitemnumber(j,"cr_maximopor")
	end if
	///////////////  por tipo de afiliado ////////////////////////
	if dw_deta.getitemstring(j,"tipoafil")='1' then
		choose case dw_deta.getitemstring(j,"ta_paga")
			case '1'//copago
				que_paga='Copago.'
			case '2'//cmodera
				que_paga='Cuota Mode.'
			case '3'//crecu
				que_paga='Cuota Recu.'
		end choose
		cuanto_fijo=dw_deta.getitemnumber(j,"ta_valor")
		pormin=dw_deta.getitemnumber(j,"ta_pormin")
		pormax=dw_deta.getitemnumber(j,"ta_pormaximo")
	end if
	///////////////  Particular        ////////////////////////
	if dw_deta.getitemstring(j,"pagopart")='1' then
		cuanto_fijo=0
		que_paga='particular'
		pormin=100
		pormax=100
	end if
	select ctlqx into :tip_liq from manuales where codmanual=:manual;
	if tiposerv='P' or tiposerv='Q' then
		st_cirugia st_cir
		st_cir.tiposerv=tiposerv
		st_cir.manual=manual
		st_cir.codproc=proceq
		st_cir.dw_factura=st_cr.dw_factura 
		st_cir.dw_factura_cpo=st_cr.dw_factura_cpo
		st_cir.nuevo_edita='edita'
		choose case tip_liq
			case "1" // SOAT
				st_cir.grupo=grupo		
				openwithparm(w_cirugias,st_cir)
			case "2" // ISS
				st_cir.puntos=puntos
				openwithparm(w_cirugias_uvr,st_cir)
		end choose
		st_cir=message.powerobjectparm
		if st_cir.valor>0 then 
			st_cr.dw_factura.setitem(filaf,"plan",plan)
			st_cr.dw_factura.setitem(filaf,"que_paga",que_paga)
			st_cr.dw_factura.setitem(filaf,"pormin",pormin)
			st_cr.dw_factura.setitem(filaf,"pormax",pormax)
			st_cr.dw_factura.setitem(filaf,"cuanto_fijo",cuanto_fijo)
			st_cr.dw_factura.setitem(filaf,"tipo_proc",tiposerv)
			st_cr.dw_factura.setitem(filaf,"grupo",grupo)
			st_cr.dw_factura.setitem(filaf,"puntos",puntos)
			st_cr.dw_factura.setitem(filaf,"cod_concep",cod_concep)
			st_cr.dw_factura.setitem(filaf,"cproc",proceq)
			st_cr.dw_factura.setitem(filaf,"descripcion",desproc)
			st_cr.dw_factura.setitem(filaf,"cod_manual",manual)
			st_cr.dw_factura.setitem(filaf,"cemp",dw_emp.getitemstring(1,1))
			st_cr.dw_factura.setitem(filaf,"ccontrato",dw_cont.getitemstring(w_cambia_respon.dw_cont.getrow(),1))
			st_cr.dw_factura.setitem(filaf,"por_manual",pormanual/100)
			st_cr.dw_factura.setitem(filaf,"des_cont",dw_cont.getitemstring(w_cambia_respon.dw_cont.getrow(),"descontrato"))
			st_cr.dw_factura.setitem(filaf,"v_part",0)
			st_cr.dw_factura.setitem(filaf,"vt_pac",0)
			st_cr.dw_factura.setitem(filaf,"vt_proc",0)
			st_cr.dw_factura.setitem(filaf,"vt_emp",0)
			st_cr.dw_factura.setitem(filaf,"percent_pac",pormax)
			st_cr.dw_factura.setitem(filaf,"tope",tope)
			closewithreturn(parent,'si')
		end if
		return
	end if
	setnull(valoru)
	if es_medica='0' then
		select valor into :valoru from tarifas where codmanual=:manual and codservicio=:proceq and codproced=:proccups;
	else
		select valor into :valoru from tarifa_medica where codmanual=:manual and c_medica=:proceq and codarticulo=:articulo;
	end if
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo tarifas",sqlca.sqlerrtext)
		return
	end if	
	if isnull(valoru) then
		messagebox("Atención","Este procedimiento no tiene tarifa en el manual "+manual)
		return
	end if
	st_cr.dw_factura.setitem(filaf,"plan",plan)
	st_cr.dw_factura.setitem(filaf,"que_paga",que_paga)
	st_cr.dw_factura.setitem(filaf,"tope",tope)
	st_cr.dw_factura.setitem(filaf,"pormin",pormin)
	st_cr.dw_factura.setitem(filaf,"pormax",pormax)
	st_cr.dw_factura.setitem(filaf,"cuanto_fijo",cuanto_fijo)
	st_cr.dw_factura.setitem(filaf,"tipo_proc",tiposerv)
	st_cr.dw_factura.setitem(filaf,"grupo",grupo)
	st_cr.dw_factura.setitem(filaf,"puntos",puntos)
	st_cr.dw_factura.setitem(filaf,"cod_concep",cod_concep)
	st_cr.dw_factura.setitem(filaf,"cproc",proceq)
	st_cr.dw_factura.setitem(filaf,"descripcion",desproc)
	st_cr.dw_factura.setitem(filaf,"cod_manual",manual)
	st_cr.dw_factura.setitem(filaf,"cemp",emp)
	st_cr.dw_factura.setitem(filaf,"ccontrato",cont)
	st_cr.dw_factura.setitem(filaf,"tipo_fac",tipo_fac)
	st_cr.dw_factura.setitem(filaf,"por_manual",pormanual/100)
	st_cr.dw_factura.setitem(filaf,"des_cont",dw_cont.getitemstring(dw_cont.getrow(),"descontrato"))
	st_cr.dw_factura.setitem(filaf,"v_part",0)
	st_cr.dw_factura.setitem(filaf,"vt_pac",0)
	st_cr.dw_factura.setitem(filaf,"vt_proc",0)
	st_cr.dw_factura.setitem(filaf,"vt_emp",0)
	st_cr.dw_factura.setitem(filaf,"tope",tope)
	st_cr.dw_factura.setitem(filaf,"percent_pac",pormax)
	st_cr.dw_factura.setitem(filaf,"vp_unit",valoru * dw_deta.getitemnumber(j,"pormanual")/100 )
	closewithreturn(parent,'si')
	return
otro:
next

end event

event constructor;settransobject(sqlca)
end event

type dw_emp from datawindow within w_cambia_respon
integer x = 41
integer y = 136
integer width = 2322
integer height = 160
integer taborder = 10
string title = "none"
string dataobject = "dw_empre_activas"
boolean border = false
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;this.accepttext()
dw_cont.retrieve(this.getitemstring(1,1))

end event

type pb_2 from picturebutton within w_cambia_respon
integer x = 1234
integer y = 1064
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_cambia_respon
integer x = 1061
integer y = 1064
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;dw_cont.triggerevent(doubleclicked!)

end event

type ln_1 from line within w_cambia_respon
long linecolor = 16777215
integer linethickness = 4
integer beginy = 1028
integer endx = 2380
integer endy = 1028
end type

type ln_2 from line within w_cambia_respon
long linecolor = 10789024
integer linethickness = 4
integer beginx = 5
integer beginy = 1032
integer endx = 2380
integer endy = 1032
end type

type st_1 from statictext within w_cambia_respon
integer x = 55
integer y = 16
integer width = 2313
integer height = 128
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione la Empresa luego el Contrato y de doble click sobre el contrato o presione Aceptar"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

