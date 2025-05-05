$PBExportHeader$w_citas_asig.srw
forward
global type w_citas_asig from window
end type
type pb_3 from picturebutton within w_citas_asig
end type
type dp_1 from datepicker within w_citas_asig
end type
type pb_2 from picturebutton within w_citas_asig
end type
type dw_tto from datawindow within w_citas_asig
end type
type st_2 from statictext within w_citas_asig
end type
type dw_otro_profe from datawindow within w_citas_asig
end type
type pb_1 from picturebutton within w_citas_asig
end type
type st_profe from statictext within w_citas_asig
end type
type st_3 from statictext within w_citas_asig
end type
type ddlb_1 from dropdownlistbox within w_citas_asig
end type
type dw_profe from datawindow within w_citas_asig
end type
type dw_revisa from datawindow within w_citas_asig
end type
type dw_sercios from datawindow within w_citas_asig
end type
type st_1 from statictext within w_citas_asig
end type
type dw_citas from datawindow within w_citas_asig
end type
end forward

global type w_citas_asig from window
integer width = 4846
integer height = 1744
boolean titlebar = true
string title = "Citas Asignadas a Profesional"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "citas_prof.ico"
boolean clientedge = true
boolean center = true
pb_3 pb_3
dp_1 dp_1
pb_2 pb_2
dw_tto dw_tto
st_2 st_2
dw_otro_profe dw_otro_profe
pb_1 pb_1
st_profe st_profe
st_3 st_3
ddlb_1 ddlb_1
dw_profe dw_profe
dw_revisa dw_revisa
dw_sercios dw_sercios
st_1 st_1
dw_citas dw_citas
end type
global w_citas_asig w_citas_asig

type variables
datawindowchild idw_profes, idw_fincon
string i_profe,i_area,ls_clodon
double ld_odon
boolean lb_odont=false
uo_serv_ing uo_s


end variables

forward prototypes
public subroutine trae_agenda (datetime p_fecha)
end prototypes

public subroutine trae_agenda (datetime p_fecha);long nulo
setnull(nulo)
dw_citas.reset()
dw_sercios.reset()
string indapdx,odon=''
if dw_profe.visible then
	indapdx='0'
	if isnull(i_profe) or i_profe='' then
		if isvalid(w_apoyo_diag2) then i_profe=g_profe
	end if
else
	indapdx=uo_s.i_indapdx
	if uo_s.i_indapdx='5A' then indapdx='5'
	if uo_s.i_indapdx='5' then odon='0'
	if uo_s.i_indapdx='5A' then odon='1'
end if
dw_citas.retrieve(i_profe,p_fecha,indapdx,odon,clugar)
if g_motor='postgres' then
	 select profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
	 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end 
	 into :st_profe.text from profe where codprof =:i_profe;
else
	 select profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
	 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end 
	 into :st_profe.text from profe where codprof =:i_profe;
end if
if dw_profe.visible then
	dw_profe.setitem(1,1,i_profe)
else
	dw_otro_profe.setitem(1,1,i_profe)
end if
st_profe.text+=' ('+string(dw_citas.rowcount())+' citas)'
ddlb_1.selectitem(5)
ddlb_1.event selectionchanged(5)

end subroutine

on w_citas_asig.create
this.pb_3=create pb_3
this.dp_1=create dp_1
this.pb_2=create pb_2
this.dw_tto=create dw_tto
this.st_2=create st_2
this.dw_otro_profe=create dw_otro_profe
this.pb_1=create pb_1
this.st_profe=create st_profe
this.st_3=create st_3
this.ddlb_1=create ddlb_1
this.dw_profe=create dw_profe
this.dw_revisa=create dw_revisa
this.dw_sercios=create dw_sercios
this.st_1=create st_1
this.dw_citas=create dw_citas
this.Control[]={this.pb_3,&
this.dp_1,&
this.pb_2,&
this.dw_tto,&
this.st_2,&
this.dw_otro_profe,&
this.pb_1,&
this.st_profe,&
this.st_3,&
this.ddlb_1,&
this.dw_profe,&
this.dw_revisa,&
this.dw_sercios,&
this.st_1,&
this.dw_citas}
end on

on w_citas_asig.destroy
destroy(this.pb_3)
destroy(this.dp_1)
destroy(this.pb_2)
destroy(this.dw_tto)
destroy(this.st_2)
destroy(this.dw_otro_profe)
destroy(this.pb_1)
destroy(this.st_profe)
destroy(this.st_3)
destroy(this.ddlb_1)
destroy(this.dw_profe)
destroy(this.dw_revisa)
destroy(this.dw_sercios)
destroy(this.st_1)
destroy(this.dw_citas)
end on

event open;if isvalid(Message.PowerObjectParm) then
	uo_s = Message.PowerObjectParm
	i_profe=uo_s.profe()
else
	dw_profe.visible=true
	dw_otro_profe.visible=false
	st_2.visible=false
end if
trae_agenda(datetime(today()))
ddlb_1.selectitem(5)


end event

event close;//if not isnull(m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1.enabled) then
//    m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1.enabled=false
//end if
//uo_s.i_interface=0

end event

type pb_3 from picturebutton within w_citas_asig
integer x = 4585
integer y = 1244
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Actualiza Estados"
end type

event clicked;trae_agenda(datetime(date(dp_1.datevalue )))
end event

type dp_1 from datepicker within w_citas_asig
integer x = 37
integer y = 32
integer width = 709
integer height = 100
integer taborder = 40
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-04-04"), Time("12:50:06.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;trae_agenda(datetime(date(dp_1.datevalue )))
end event

type pb_2 from picturebutton within w_citas_asig
string tag = "Reatender"
integer x = 4581
integer y = 1112
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "reatender.gif"
string disabledname = "d_reatender.gif"
alignment htextalign = left!
string powertiptext = "Reatender"
end type

event clicked;long ix,ncit,nserv,sec_cant,contador,nfact
string asistio,clug_cita,clugar_ser,clugar_fac,tipo_fac,profe
datetime ld_fecha,ld_hora

ix=dw_citas.getrow()
ncit=dw_citas.getitemnumber(ix,"ncita")
nserv=dw_citas.getitemnumber(ix,"nservicio")
clug_cita=dw_citas.getitemstring(ix,"clugar")
sec_cant=dw_citas.getitemnumber(ix,"sec_cant")
contador=dw_citas.getitemnumber(ix,"contador")
clugar_ser=dw_citas.getitemstring(ix,"clugar_ser")
nfact=dw_sercios.getitemnumber(dw_sercios.getrow(),'nfact')
clugar_fac=dw_sercios.getitemstring(dw_sercios.getrow(),'clugar_fac')
tipo_fac=dw_sercios.getitemstring(dw_sercios.getrow(),'tipo_fac') 
profe=dw_sercios.getitemstring(dw_sercios.getrow(),'prof') 
ld_fecha=dw_sercios.getitemdatetime(dw_sercios.getrow(),'fecha') 
ld_hora=dw_sercios.getitemdatetime(dw_sercios.getrow(),'hora') 

select count(hclin_registro.nregistro) into :ix
from hclin_registro
where (((hclin_registro.contador)=:contador) and ((hclin_registro.clugar)=:clugar_ser));
if ix>0 then
	Messagebox("Error",'Paciente ya tiene historia Registrada')
	pb_2.enabled=false
	return
end if

select count(oscabeza.nsolicitud)  into :ix
from oscabeza
where (((oscabeza.contador)=:contador) and ((oscabeza.clugar)=:clugar_ser));
if ix>0 then
	Messagebox("Error",'Paciente ya tiene Ordenes de Servicios')
	pb_2.enabled=false
	return
end if

update serciosturno set control='5',contador=null, clugar_ser=null,nservicio_ingreso=null 
where ncita=:ncit and clugar=:clug_cita and prof=:profe and fecha=:ld_fecha and hora=:ld_hora ;
if sqlca.sqlcode=-1 then 
	messagebox("Error actualizando serciosturno",sqlca.sqlerrtext)
	rollback;
	return
end if

SELECT  nodontograma, clugar  into :ld_odon,:ls_clodon
FROM odongramacb
where contador=:contador and clugar_his=:clugar_ser;
if ld_odon>0 then
	SELECT count(1)  into :ld_odon
	FROM odontratacab
	WHERE (((odontratacab.nodontograma)=:contador) AND ((odontratacab.clugar_ocb)=:clugar_ser));
	if ld_odon>0 then
		Messagebox("Error",'Paciente ya tiene tratamiento no lo  puede reatender')
		pb_2.enabled=false
		return
	end if
	
	delete from odongrama 
	where
		exists (SELECT *
			FROM odongramacb 
			WHERE 
			(((odongramacb.contador)=:contador) AND ((odongramacb.clugar_his)=:clugar_ser)		
			and (odongramacb.clugar = odongrama.clugar) 
			and (odongramacb.nodontograma = odongrama.nodontograma)));			
	if sqlca.sqlcode=-1 then 
		messagebox("Error borrando odongrama retender",sqlca.sqlerrtext)
		rollback;
		return
	end if

	delete from odongramacb 
	where (((odongramacb.contador)=:contador) AND ((odongramacb.clugar_his)=:clugar_ser));
	if sqlca.sqlcode=-1 then 
		messagebox("Error borrarndo odongramacb reatender",sqlca.sqlerrtext)
		rollback;
		return
	end if
else
	select nodontograma, clugar  into :ld_odon,:ls_clodon 
	from odongramacb 
	where tipodoc=:tipdoc and documento =:docu and estado='0';
	if ld_odon>0 then
		delete from odongrama 
		where
			exists (SELECT *
				FROM odongramacb 
				WHERE 
				(((odongramacb.tipodoc)=:tipdoc) AND ((odongramacb.documento)=:docu)		
				and (odongramacb.clugar = odongrama.clugar) 
				and (odongramacb.nodontograma = odongrama.nodontograma)));
		if sqlca.sqlcode=-1 then 
			messagebox("Error borrando odongramacb pte",sqlca.sqlerrtext)
			rollback;
			return
		end if
//	update odontratacpo set contador=null,clugar_his=null,nservicio=null ,realizado='0'
//	where contador=:contador and clugar_his=:clugar_ser and  nservicio=:nserv;
//	if sqlca.sqlcode=-1 then 
//		messagebox("Error actualizando OdonTrataCpo",sqlca.sqlerrtext)
//		rollback;
//		return
	end if
end if

update citasasig set estado=5  where ncita=:ncit and clugar=:clug_cita;
if sqlca.sqlcode=-1 then 
	messagebox("Error actualizando citas",sqlca.sqlerrtext)
	rollback;
	return
end if

update factcpo set contador=null, clugar_ser=null,nservicio=null 
where nfact=:nfact and clugar=:clugar_fac and tipo=:tipo_fac;
if sqlca.sqlcode=-1 then 
	messagebox("Error actualizando factcpo",sqlca.sqlerrtext)
	rollback;
	return
end if
	
delete from serviciosingreso 
where contador=:contador and clugar=:clugar_ser;
if sqlca.sqlcode=-1 then 
	messagebox("Error Eliminando serviciosingreso",sqlca.sqlerrtext)
	rollback;
	return
end if

delete from historial
where contador=:contador and clugar=:clugar_ser;
if sqlca.sqlcode=-1 then 
	messagebox("Error Eliminando historial",sqlca.sqlerrtext)
	rollback;
	return
end if
commit;
//trae_agenda(datetime(dp_1.datevalue ))
trae_agenda(datetime(date(dp_1.datevalue )))
this.enabled=false
if isvalid(w_hist_gral) then w_hist_gral.triggerevent(open!)
if isvalid(w_consulta) then w_consulta.triggerevent(open!)
if isvalid(w_atiendetto) then w_atiendetto.triggerevent(open!)

end event

type dw_tto from datawindow within w_citas_asig
boolean visible = false
integer x = 3781
integer y = 1508
integer width = 123
integer height = 68
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_atiende_tto_cita"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_2 from statictext within w_citas_asig
integer x = 2455
integer y = 12
integer width = 759
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217750
string text = "Atender Citas de Otro Profesional:"
boolean focusrectangle = false
end type

type dw_otro_profe from datawindow within w_citas_asig
integer x = 3209
integer width = 1527
integer height = 84
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;accepttext()
i_profe=gettext()
trae_agenda(datetime(date(dp_1.datevalue )))

end event

type pb_1 from picturebutton within w_citas_asig
event mousemove pbm_mousemove
integer x = 4581
integer y = 980
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.GIF"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Atender servicio"
end type

event clicked;dw_citas.triggerevent(doubleclicked!)
end event

type st_profe from statictext within w_citas_asig
integer x = 1216
integer y = 88
integer width = 3502
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 12639424
boolean focusrectangle = false
end type

type st_3 from statictext within w_citas_asig
integer x = 32
integer y = 776
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Citas:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_citas_asig
integer x = 23
integer y = 688
integer width = 677
integer height = 260
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
boolean sorted = false
string item[] = {"Vigentes","No Asistió","Cumplidas","Anuladas","Todas"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index
	case 1
		dw_citas.setfilter("isnull(estado) ")
	case 2
		dw_citas.setfilter("estado ='2'")
	case 3
		dw_citas.setfilter("estado ='1'")
	case 4
		dw_citas.setfilter("len(estado) >1")
	case 5
		dw_citas.setfilter("")
end choose
dw_citas.filter()
if dw_citas.rowcount()>0 then
	dw_citas.scrolltorow(1)
	dw_citas.triggerevent(rowfocuschanged!)
else
	dw_sercios.reset()
end if
	
end event

type dw_profe from datawindow within w_citas_asig
string tag = "Se utilizaba en citas de apdx"
boolean visible = false
integer x = 763
integer width = 1632
integer height = 88
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_prof"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
i_profe=gettext()
//date ld_fecha
//ld_fecha=dp_1.datevalue 
trae_agenda(datetime(date(dp_1.datevalue)))

end event

event constructor;getchild("codprof" ,idw_profes)
settransobject(SQLCA)
idw_profes.settransobject(sqlca)
if isvalid(w_apoyo_diag2) then idw_profes.retrieve(w_apoyo_diag2.i_codarea)
insertrow(1)

end event

type dw_revisa from datawindow within w_citas_asig
boolean visible = false
integer x = 27
integer y = 532
integer width = 361
integer height = 112
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_sercios_cita_asig_todas"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type dw_sercios from datawindow within w_citas_asig
integer x = 23
integer y = 976
integer width = 4503
integer height = 612
integer taborder = 60
string title = "none"
string dataobject = "dw_sercios_cita_asig"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieverow;if this.getitemstring(row,"control")<> '5' then this.setitem(row,"esco",'0')
if this.getitemstring(row,"control")='2' or  this.getitemstring(row,"control")='5'  then
	if isvalid(w_apoyo_diag2) then
		pb_2.enabled=false
	else
		pb_2.enabled=true
	end if
else
	pb_2.enabled=false
end if
end event

event itemchanged;if getitemstring(row,"control")<> '5' then return 1
accepttext()
end event

event constructor;this.settransobject(sqlca)
end event

event clicked;if row<1 then return
if row<>getrow() then scrolltorow(row)
end event

type st_1 from statictext within w_citas_asig
integer x = 782
integer y = 84
integer width = 425
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Citas Asignadas a:"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_citas from datawindow within w_citas_asig
event doubleclicked2 ( long row1 )
integer x = 773
integer y = 156
integer width = 3931
integer height = 764
integer taborder = 10
string title = "Citas Asignadas a Profesional"
string dataobject = "dw_citas_profe"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked2(long row1);boolean new_ing=false,at_tto=false
long i,donde,nserv

if w_apoyo_diag2.dw_emp.rowcount()=0 then
	Messagebox("Error","Este paciente no tiene empresa asignada")
	return
else
	if w_apoyo_diag2.dw_emp.rowcount()>1 then
		if isnull(dw_sercios.getitemnumber(dw_sercios.getrow(),'nfact')) then
			openwithparm(w_escoge_empresa,w_apoyo_diag2.dw_emp)
		else
			string l_lug,l_tip,l_emp
			long l_fac
			l_fac=dw_sercios.getitemnumber(dw_sercios.getrow(),'nfact')
			l_lug=dw_sercios.getitemstring(dw_sercios.getrow(),'clugar_fac')
			l_tip=dw_sercios.getitemstring(dw_sercios.getrow(),'tipo_fac')
			select cemp into :l_emp from factcab where nfact=:l_fac and clugar=:l_lug and tipo=:l_tip;
			w_apoyo_diag2.i_emp=l_emp 
		end if
	end if
end if
if w_apoyo_diag2.pb_newing.event clicked()=-1 then return //alla hace rollback
new_ing=true


for i=1 to dw_sercios.rowcount()
	if dw_sercios.getitemstring(i,"esco")='1' then
		//	cod_cups
//	procequiv
//	man_eq

//	empresa
//	contrato
//	plan
// autoriza

//	nfactura
//	clug_fac
//	item_fac

//	nreci
//	clug_rec
//	item_rec
//	nitem_rec

// ncita
// nserv_cita
// sec_cant_cit
// fecha_cit
// hora_cit

// conta_os
// clug_os
// norden
// nitem_os

//	facturar
		nserv=w_apoyo_diag2.f_insert_proc(	&
			dw_sercios.getitemstring(i,'cproced'),&
			dw_sercios.getitemstring(i,'cproceq'),&
			dw_sercios.getitemstring(i,'codmanual'),&
			dw_sercios.getitemstring(i,'cemp'),&
			dw_sercios.getitemstring(i,'ccontrato'),&
			dw_sercios.getitemstring(i,'cplan'),&
			dw_sercios.getitemstring(i,'autorizacion'),&
			dw_sercios.getitemnumber(i,'nfact'),&
			dw_sercios.getitemstring(i,'clugar_fac'),&
			dw_sercios.getitemnumber(i,'nitem'),&
			dw_sercios.getitemnumber(i,'nrcaj'),&
			dw_sercios.getitemstring(i,'clugar_rec'),&
			dw_sercios.getitemnumber(i,'items'),&
			dw_sercios.getitemnumber(i,'nitem_rec'),&
			dw_sercios.getitemnumber(i,'ncita'),&
			dw_sercios.getitemstring(i,'clugar'),&
			dw_sercios.getitemnumber(i,'nservicio'),&
			dw_sercios.getitemnumber(i,'sec_cant'),&
			dw_sercios.getitemdatetime(i,'fecha'),&
			dw_sercios.getitemdatetime(i,'hora'),&
			dw_sercios.getitemnumber(i,'contador_os'),&
			dw_sercios.getitemstring(i,'clugar_os'),&
			dw_sercios.getitemnumber(i,'nsolicitud_os'),&
			dw_sercios.getitemnumber(i,'item_os'),&
			1,dw_sercios.getitemstring(i,'tipo_fac'),'','1')
		if nserv=-1 then
			rollback;
			return
		end if
		dw_sercios.setitem(i,"control","2")
		if dw_tto.rowcount()>0 then
			dw_tto.setitem(1,'realizado','2')
			dw_tto.setitem(1,'contador',uo_s.contador())
			dw_tto.setitem(1,'clugar_his',clugar)
			dw_tto.setitem(1,'nservicio',nserv)
			if dw_tto.update()=-1 then 
				rollback;
				return
			end if
			at_tto=true
		end if
	end if
next
if dw_sercios.update()<1 then
	rollback;
else
	//revisar si quedan procedimientos pendientes para cambiar el estado en citasasig
	if dw_citas.getitemnumber(row1,'nturnos')>=2 then
		long conta,nci
		string lcita
		
	 	nci= dw_citas.getitemnumber(row1,'ncita')
		lcita= dw_citas.getitemstring(row1,'clugar')
		UPDATE serciosturno 	SET control = '2'
		WHERE (((ncita)=:nci) AND ((clugar)=:lcita) and control='1');
	end If
	
	dw_Revisa.retrieve(this.getitemnumber(row1,"ncita"),clugar)
	if dw_revisa.find("control<>'2'",1,dw_revisa.rowcount())>0 then 
		dw_citas.setitem(row1,"estado","3")
	else
		dw_citas.setitem(row1,"estado","1")
	end if
	if dw_citas.update()=-1 then
		rollback;
	else
		commit;
		close(parent)
	end if
	//fin revisar si quedan procedimientos pendientes para cambiar el estado en citasasig
end if
end event

event clicked;if row<1 then return
scrolltorow(row)
end event

event rowfocuschanged;if getrow() < 1 then return
dw_sercios.retrieve(getitemnumber(getrow(),"ncita"),getitemstring(getrow(),"clugar"),datetime(date(dp_1.datevalue )),getitemdatetime(getrow(),"hora"))
//if not isnull(m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1.enabled) then
//m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1.enabled=true
//end if
string ls_sex
double li_dias
li_dias=dw_citas.getitemnumber(dw_citas.getrow(),'dias')
if dw_citas.getitemstring(dw_citas.getrow(),'sexo')="F" then ls_sex='2'
if dw_citas.getitemstring(dw_citas.getrow(),'sexo')="M" then ls_sex='1'
idw_fincon.setfilter(" indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
idw_fincon.filter()

end event

event doubleclicked;long row1,fila
long conta,nci

row1=getrow()
if row1 <1 then return
string termina,lcita
long i,empresas,nserv,donde
boolean new_ing=false,at_tto

if dw_sercios.find("esco='1'",1,dw_sercios.rowcount())=0 then return
////// PARA VERIFICAR BIOMETRIA
If g_biometria='1' then
	if w_principal.l_huella=true then
		String l_rec[2]

		l_rec=f_biometria_valida_paciente(w_principal.pac_template,dw_citas.getitemstring(dw_citas.getrow(),"tipodoc"),dw_citas.getitemstring(dw_citas.getrow(),"documento"),w_principal.dw_huella,GR_MATCH,w_principal.huella_total,'paciente')
		If l_rec[1]<>'-1' then
			if isnull(w_principal.dw_1.getitemstring(1,'tipodoc')) or w_principal.dw_1.getitemstring(1,'documento')='' or isnull(w_principal.dw_1.getitemstring(1,'documento')) then
				w_principal.dw_1.setitem(1,'tipodoc',trim(l_rec[1]))
				w_principal.dw_1.setitem(1,'documento',trim(l_rec[2]))
				w_principal.dw_1.setcolumn("documento")
				w_principal.dw_1.triggerevent(itemchanged!)
			end if
		Else
			messagebox("Atención","Paciente no identificado no encontrado")
			return
		End if
	End if
End if
/////// FIN VALIDACION BIOMETRIA

date ld_fecha
ld_fecha=dp_1.datevalue 
if ld_fecha<today() then 
	if messagebox("Atención","La cita seleccionada está programada para una fecha anterior a la de hoy. Desea atenderla de todas formas ?",question!,yesno!,2)=2 then return
end if
if ld_fecha>today() then 
	if messagebox("Atención","La cita seleccionada está programada para una fecha posterior a la de hoy. Desea atenderla de todas formas ?",question!,yesno!,2)=2 then return
end if
long fila_emp
if w_principal.dw_1.getitemstring(1,'tipodoc')<>dw_citas.getitemstring(dw_citas.getrow(),"tipodoc") or w_principal.dw_1.getitemstring(1,'documento')<>dw_citas.getitemstring(dw_citas.getrow(),"documento") or &
	isnull(w_principal.dw_1.getitemstring(1,'tipodoc')) or w_principal.dw_1.getitemstring(1,'documento')='' or isnull(w_principal.dw_1.getitemstring(1,'documento')) then
	w_principal.dw_1.setitem(1,"tipodoc",dw_citas.getitemstring(dw_citas.getrow(),"tipodoc"))
	w_principal.dw_1.setitem(1,"documento",dw_citas.getitemstring(dw_citas.getrow(),"documento"))
	w_principal.dw_1.setcolumn("documento")
	w_principal.dw_1.triggerevent(itemchanged!)
else
	if not dw_profe.visible then 
		if uo_s.idw_emppac.rowcount()>0 then
			fila_emp=uo_s.idw_emppac.getrow()
		else
			return
		end if
	end if
end if

////Se coloca validacion par a mirar multiples ventanas no esten atendidos
dw_Revisa.retrieve(this.getitemnumber(row1,"ncita"),getitemstring(row1,"clugar"))
if dw_revisa.find("maximo_ctrl='2'",1,dw_revisa.rowcount())>0 then 
	messagebox("Atención",'Cita ya atendida en otra estacion')
	pb_3.triggerevent(clicked!)
	return
End if


if dw_profe.visible then //es de apdx
	event doubleclicked2(row1)
	return
end if
if not isnull(dw_sercios.getitemstring(1,'cemp')) then
	fila_emp=uo_s.f_busca_emp_cont(dw_sercios.getitemstring(1,'cemp'),	dw_sercios.getitemstring(1,'ccontrato'))
	if fila_emp=0 then 
		if messagebox('Atención','El paciente ya no tienen la empresa con la que se facturó la cita, desea continuar aún así ?',question!,yesno!,1)=2 then return
		fila_emp=1
	end if
else
	fila_emp=uo_s.f_busca_emp_cont(dw_citas.getitemstring(row,'codemp'),	dw_citas.getitemstring(row,'ccontrato'))
	if fila_emp=0 then 
		if messagebox('Atención','El paciente ya no tienen la empresa de la cita, desea continuar aún así ?',question!,yesno!,1)=2 then return
		fila_emp=1
	end if	
end if
uo_s.idw_emppac.setrow(fila_emp)
if uo_s.ipb_newingre.event clicked()=-1 then return //alla hace rollback
new_ing=true
for i=1 to dw_sercios.rowcount()
	if dw_sercios.getitemstring(i,"esco")='1' then
		if not isnull(dw_sercios.getitemnumber(i,'ntratamiento')) then 
			//puede ser de un tratamiento
			if dw_tto.retrieve(dw_sercios.getitemnumber(i,'ntratamiento'),dw_sercios.getitemstring(i,'clugar_tto'),dw_sercios.getitemnumber(i,'item_tto'))>0 then
				donde=uo_s.idw_emppac.find('codemp="'+dw_tto.getitemstring(1,'cemp')+'" and codcontrato="'+dw_tto.getitemstring(1,'ccontrato')+'"',1,uo_s.idw_emppac.rowcount())
				if donde=0 then
					messagebox("Atención",'No se puede encontrar el tratamiento del paciente')
					rollback;
					return
				else
					if uo_s.idw_emppac.getrow()<>donde then 
						if new_ing then
							messagebox("Atención",'Está tratando atender procedimientos de Tratamientos Distintos')
							rollback;
							return
						else
							uo_s.idw_emppac.scrolltorow(donde)
						end if
					end if
					if not new_ing then 
						if uo_s.ipb_newingre.event clicked()=-1 then return //alla hace rollback
						new_ing=true
					end if
				end if
			end if
		else
			dw_tto.reset()
		end if
		nserv=uo_s.f_insert_servicio(	&
			dw_sercios.getitemstring(i,'cproced'),&
			dw_sercios.getitemstring(i,'cemp'),&
			dw_sercios.getitemstring(i,'ccontrato'),&
			dw_sercios.getitemstring(i,'cplan'),&
			dw_sercios.getitemnumber(i,'nfact'),&
			dw_sercios.getitemstring(i,'clugar_fac'),&
			dw_sercios.getitemnumber(i,'nitem'),&
			dw_sercios.getitemnumber(i,'nrcaj'),&
			dw_sercios.getitemstring(i,'clugar_rec'),&
			dw_sercios.getitemnumber(i,'items'),&
			dw_sercios.getitemnumber(i,'nitem_rec'),&
			dw_sercios.getitemstring(i,'cproceq'),&
			dw_sercios.getitemstring(i,'codmanual'),&
			idw_fincon.getitemstring(idw_fincon.getrow(),'coduf'),&
			idw_fincon.getitemstring(idw_fincon.getrow(),'codcc'),&
			dw_sercios.getitemstring(i,'tipo_fac'),&
			dw_sercios.getitemstring(i,'autorizacion'),'0',&
			dw_citas.getitemstring(dw_citas.getrow(),'codalmacen'),&
			dw_citas.getitemstring(dw_citas.getrow(),'cod_fina'),'')
		if nserv=-1 then
			rollback;
			return
		end if
		dw_sercios.setitem(i,'contador',uo_s.contador())
		dw_sercios.setitem(i,'clugar_ser',clugar)
		dw_sercios.setitem(i,'nservicio_ingreso',nserv)
		dw_sercios.setitem(i,"control","2")
		if dw_tto.rowcount()>0 then
			dw_tto.setitem(1,'realizado','2')
			dw_tto.setitem(1,'contador',uo_s.contador())
			dw_tto.setitem(1,'clugar_his',clugar)
			dw_tto.setitem(1,'nservicio',nserv)
			if dw_tto.update()=-1 then 
				rollback;
				return
			end if
			at_tto=true
		end if
		//Para volver a montar odontograma si esta
		if lb_odont then
			conta=uo_s.contador()
			update odongramacb set contador=:conta,clugar_his=:clugar
			where  nodontograma=:ld_odon and  clugar_his=:clugar:ls_clodon;
			if sqlca.sqlcode=-1 then 
				messagebox("Error actualizando odongramacb al atender",sqlca.sqlerrtext)
				rollback;
				return
			end if
		end if			
	end if
next
if dw_sercios.update()<1 then
	rollback;
else
	//revisar si quedan procedimientos pendientes para cambiar el estado en citasasig
	//para cuando hay una cita con un 2 turnos y es atendidad
	if dw_citas.getitemnumber(row1,'nturnos')>=2 then
		
		setnull(lcita)
		setnull(nci)
	 	nci= dw_citas.getitemnumber(row1,'ncita')
		lcita= dw_citas.getitemstring(row1,'clugar')
		conta=uo_s.contador()
		
		UPDATE serciosturno 	SET serciosturno.contador = :conta, serciosturno.clugar_ser =: clugar, 
		serciosturno.nservicio_ingreso = :nserv, serciosturno.control = '2'
		WHERE (((serciosturno.ncita)=:nci) AND ((serciosturno.clugar)=:lcita) and serciosturno.control='1');
	end If
	
	//se hace en la linea 
	dw_Revisa.retrieve(this.getitemnumber(row1,"ncita"),getitemstring(row1,"clugar"))
	if dw_revisa.find("control<>'2'",1,dw_revisa.rowcount())>0 then 
		dw_citas.setitem(row1,"estado","3")
	else
		dw_citas.setitem(row1,"estado","1")
	end if
	
	if dw_citas.update()=-1 then
		rollback;
	else
		commit;
		if uo_s.i_indapdx='5A' and at_tto then uo_s.event cambio_tto()
		close(parent)
	end if
	//fin revisar si quedan procedimientos pendientes para cambiar el estado en citasasig
end if
end event

event rbuttondown;if row<1 then return
if row<>getrow() then scrolltorow(row)
string estado
estado=dw_citas.describe("evaluate ( 'trim(esta)' ,"+string(dw_citas.getrow())+")")
if estado="No Asistió" or estado="Cumplida" or estado="Anulada" then return
w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1.enabled=true
w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2.enabled=false
if dw_sercios.rowcount()=0 then
	w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_4.enabled=true
else
	w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_4.enabled=false
end if
w_principal.m_principal.m_3.m_3_2.m_3_2_5.PopMenu (parent.PointerX(), parent.PointerY())

end event

event constructor;settransobject(sqlca)
getchild("desfin",idw_fincon)
idw_fincon.settransobject(sqlca)
idw_fincon.retrieve('1')
end event

event itemchanged;if getcolumnname()='desfin' then 
	idw_fincon.accepttext()
	dw_citas.setitem(row,"cod_fina",idw_fincon.getitemstring(idw_fincon.getrow(),'codfin'))
end if
end event

