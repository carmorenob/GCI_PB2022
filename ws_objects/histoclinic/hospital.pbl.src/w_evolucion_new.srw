$PBExportHeader$w_evolucion_new.srw
forward
global type w_evolucion_new from window
end type
type pb_1 from picturebutton within w_evolucion_new
end type
type pb_triage from picturebutton within w_evolucion_new
end type
type pb_notas from picturebutton within w_evolucion_new
end type
type pb_print from picturebutton within w_evolucion_new
end type
type pb_epicris from picturebutton within w_evolucion_new
end type
type pb_close from picturebutton within w_evolucion_new
end type
type pb_pvisible from picturebutton within w_evolucion_new
end type
type dw_1 from datawindow within w_evolucion_new
end type
type barra2 from hprogressbar within w_evolucion_new
end type
type tab_1 from tab within w_evolucion_new
end type
type tabp_1 from userobject within tab_1
end type
type cbx_1 from checkbox within tabp_1
end type
type uo_ing from uo_hclin within tabp_1
end type
type tabp_1 from userobject within tab_1
cbx_1 cbx_1
uo_ing uo_ing
end type
type tabp_2 from userobject within tab_1
end type
type cbx_2 from checkbox within tabp_2
end type
type uo_ev from uo_hclin within tabp_2
end type
type tabp_2 from userobject within tab_1
cbx_2 cbx_2
uo_ev uo_ev
end type
type tabp_new from userobject within tab_1
end type
type st_1 from statictext within tabp_new
end type
type st_respon from statictext within tabp_new
end type
type uo_ord from uo_hclin within tabp_new
end type
type cb_cambiores from picturebutton within tabp_new
end type
type tabp_new from userobject within tab_1
st_1 st_1
st_respon st_respon
uo_ord uo_ord
cb_cambiores cb_cambiores
end type
type tabp_3 from userobject within tab_1
end type
type pb_guardaegres from picturebutton within tabp_3
end type
type pb_anula_sal from picturebutton within tabp_3
end type
type pb_egreso from picturebutton within tabp_3
end type
type uo_sal from uo_hclin within tabp_3
end type
type dw_sale from datawindow within tabp_3
end type
type st_14 from statictext within tabp_3
end type
type sle_diaging from singlelineedit within tabp_3
end type
type st_diagsal from statictext within tabp_3
end type
type tabp_3 from userobject within tab_1
pb_guardaegres pb_guardaegres
pb_anula_sal pb_anula_sal
pb_egreso pb_egreso
uo_sal uo_sal
dw_sale dw_sale
st_14 st_14
sle_diaging sle_diaging
st_diagsal st_diagsal
end type
type tp_5 from userobject within tab_1
end type
type uo_ord_sale from uo_orden_formula within tp_5
end type
type tp_5 from userobject within tab_1
uo_ord_sale uo_ord_sale
end type
type tab_1 from tab within w_evolucion_new
tabp_1 tabp_1
tabp_2 tabp_2
tabp_new tabp_new
tabp_3 tabp_3
tp_5 tp_5
end type
type dw_inf from datawindow within w_evolucion_new
end type
end forward

global type w_evolucion_new from window
integer width = 6107
integer height = 2664
boolean titlebar = true
string title = "Evolución Urgencias/Hospitalización"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "libro.ico"
boolean center = true
windowdockstate windowdockstate = windowdockstatefloating!
pb_1 pb_1
pb_triage pb_triage
pb_notas pb_notas
pb_print pb_print
pb_epicris pb_epicris
pb_close pb_close
pb_pvisible pb_pvisible
dw_1 dw_1
barra2 barra2
tab_1 tab_1
dw_inf dw_inf
end type
global w_evolucion_new w_evolucion_new

type variables
long colorfondo
string i_desprofes,espe,i_cespe,i_est_hadm,i_regmed
string i_edita='',i_cambia_histo,i_j//esta es pal machete de editar la historia
boolean nv_orden=false , puede=true , cambio_evo=false , cambio_ord=false, cambio_sal=false,i_cambiar=true
//puede es para no seguir mandando los proc a ordenes de servicio en caso de que no haya insertado la cabeza de la orden
//i_cambiar es para no dejar hacer nada (la admisioón está cerrada)
//i_edita es para poder hacer cambios así la admisión este cerrada
INT i_indice_ing,i_control
boolean i_cambia_rte=false
st_pa_evolucion i_stde
end variables

forward prototypes
public subroutine revisa ()
public function long nv_orden ()
end prototypes

public subroutine revisa ();string respon
datetime fentra,hentra
setnull(respon)
if g_motor='postgres' then
	SELECT 
	 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '||
	 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof into :respon 
	FROM HospRespon, Profe
	WHERE HospRespon.CodProf=profe.codprof AND HospRespon.NH=:i_stde.nh AND HospRespon.clugar=:i_stde.clug_hadm AND HospRespon.CodTIngre=:i_stde.tingres AND HospRespon.fecha_fin Is Null;
else
	SELECT 
	 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
	 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof into :respon 
	FROM HospRespon, Profe
	WHERE HospRespon.CodProf=profe.codprof AND HospRespon.NH=:i_stde.nh AND HospRespon.clugar=:i_stde.clug_hadm AND HospRespon.CodTIngre=:i_stde.tingres AND HospRespon.fecha_fin Is Null;
end if
if sqlca.sqlcode=-1 then
	messagebox("Error Consultando responsable actual",sqlca.sqlerrtext)
	return
end if
if not isnull(respon) then
	tab_1.tabp_new.st_respon.text=respon
end if


end subroutine

public function long nv_orden ();if i_stde.ventana.classname()<>'w_new_sala_qx' then
	w_new_at_os.uo_1.dw_profe.setitem(1,1,i_stde.profes)
	if w_new_at_os.uo_1.cb_nvorden.event clicked()=-1 then 
		puede=false
		return 0
	else
		nv_orden=true
		return 1
	end if
else
	if w_new_sala_qx.tab_servicios.tabpage_3.uo_2.cb_nvorden.event clicked()=-1 then
		puede=false
		return 0
	else
		w_new_sala_qx.tab_servicios.tabpage_3.uo_2.dw_oscab.setitem(1,'codprof',i_stde.profes)
		w_new_sala_qx.tab_servicios.tabpage_3.uo_2.dw_oscab.triggerevent(itemchanged!)
		nv_orden=true
		return 1
	end if
end if
end function

on w_evolucion_new.create
this.pb_1=create pb_1
this.pb_triage=create pb_triage
this.pb_notas=create pb_notas
this.pb_print=create pb_print
this.pb_epicris=create pb_epicris
this.pb_close=create pb_close
this.pb_pvisible=create pb_pvisible
this.dw_1=create dw_1
this.barra2=create barra2
this.tab_1=create tab_1
this.dw_inf=create dw_inf
this.Control[]={this.pb_1,&
this.pb_triage,&
this.pb_notas,&
this.pb_print,&
this.pb_epicris,&
this.pb_close,&
this.pb_pvisible,&
this.dw_1,&
this.barra2,&
this.tab_1,&
this.dw_inf}
end on

on w_evolucion_new.destroy
destroy(this.pb_1)
destroy(this.pb_triage)
destroy(this.pb_notas)
destroy(this.pb_print)
destroy(this.pb_epicris)
destroy(this.pb_close)
destroy(this.pb_pvisible)
destroy(this.dw_1)
destroy(this.barra2)
destroy(this.tab_1)
destroy(this.dw_inf)
end on

event open;string enobserv,ls_nul
long ll_nul
setnull(ls_nul)
setnull(ll_nul)

i_stde=message.powerobjectparm
tab_1.tabp_1.uo_ing.inicia_objs_ordenes(i_stde.sle_proc,i_stde.sle_med,i_stde.nvorden,i_stde.dw_cab,i_stde.sle_otros,i_stde.sle_tiporep,i_stde.cesp,i_stde.sle_kits)
tab_1.tabp_new.uo_ord.inicia_objs_ordenes(i_stde.sle_proc,i_stde.sle_med,i_stde.nvorden,i_stde.dw_cab,i_stde.sle_otros,i_stde.sle_tiporep,i_stde.cesp,i_stde.sle_kits)
tab_1.tabp_2.uo_ev.inicia_objs_ordenes(i_stde.sle_proc,i_stde.sle_med,i_stde.nvorden,i_stde.dw_cab,i_stde.sle_otros,i_stde.sle_tiporep,i_stde.cesp,i_stde.sle_kits)
SELECT cadena into : i_edita
FROM parametros_gen
WHERE (((codigo_para)=15));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 15')
	return
end if

choose case i_stde.tingres
	case '2'
		title='Evolución de Urgencias para: -- '
		pb_triage.visible=true
	case '3'
		title='Evolución de Hospitalización para: -- '
		pb_triage.visible=false
	case '4'
		title='Evolución Ambulatoria para: -- '
		pb_triage.visible=false
	case '7'
		title='Evolución de UCI para: -- '
		pb_triage.visible=false
end choose
title+=upper(w_principal.dw_1.getitemstring(1,'nombre'))+' --'
if isnull(i_stde.contador) then
	messagebox("Error","No existe contador para esta admisión")
	close(this)
	return
end if
//tab_1.tabp_2.cb_notasqx.visible=i_stde.mostrar
dw_inf.retrieve(i_stde.nh,i_stde.clug_hadm, i_stde.tingres)
if i_stde.tingres='2' then 
	pb_triage.enabled=true
	tab_1.tabp_1.cbx_1.visible=true
	tab_1.tabp_2.cbx_2.visible=true
	select en_observa into :enobserv from hospadmi where nh=:i_stde.nh and clugar=:i_stde.clug_hadm and codtingre='2';
	if enobserv='1' then 
		tab_1.tabp_1.cbx_1.checked=true
		tab_1.tabp_1.cbx_1.enabled=false
		tab_1.tabp_2.cbx_2.checked=true
		tab_1.tabp_2.cbx_2.enabled=false
	else
		tab_1.tabp_1.cbx_1.enabled=true
		tab_1.tabp_2.cbx_2.enabled=true
	end if
end if

if g_motor='postgres' then
	SELECT 
	 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
	 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof,
	 profe.registro, EspProf.CEsp,edita,control , especialidades.desesp
	 into :i_desprofes,:i_regmed,:i_cespe,:i_cambia_histo,:i_control,:espe 
	FROM (profe INNER JOIN EspProf ON profe.CodProf = EspProf.CodProf) INNER JOIN especialidades ON EspProf.cesp = especialidades.codesp
	WHERE (profe.CodProf=:i_stde.profes) AND (EspProf.estado='1' ) AND (EspProf.cesp=:i_stde.cesp);
else
	SELECT 
	 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+
	 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof,
	 profe.registro, EspProf.CEsp,edita,control , especialidades.desesp
	 into :i_desprofes,:i_regmed,:i_cespe,:i_cambia_histo,:i_control,:espe 
	FROM (profe INNER JOIN EspProf ON profe.CodProf = EspProf.CodProf) INNER JOIN especialidades ON EspProf.cesp = especialidades.codesp
	WHERE (profe.CodProf=:i_stde.profes) AND (EspProf.estado='1' ) AND (EspProf.cesp=:i_stde.cesp);
end if
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo Profe y/o EspProf',sqlca.sqlerrtext)
	close(this)
	return
end if
if isnull(i_regmed) then i_regmed=''

if isnull(i_cambia_histo) or i_cambia_histo='' then i_cambia_histo='0'
//para controlar no edicion  de hc desde multiples equipos
if i_control<>0 then
	messagebox("Atención","Profesional esta Evolucionado en otra estación solo podra Consultar")
	tab_1.tabp_3.pb_guardaegres.enabled=false
	if I_control<0 then i_control=0
else
	tab_1.tabp_3.pb_guardaegres.enabled=true
end if

update profe set control=:i_control+1
WHERE profe.CodProf=:i_stde.profes ;
if sqlca.sqlcode=-1 then
	messagebox("Error Actualizando Profe",sqlca.sqlerrtext)
	rollback;
	return
else
	commit;
end if

revisa()//quien es el reponsable
select estado into :i_est_hadm from hospadmi where nh=:i_stde.nh and clugar=:i_stde.clug_hadm and codtingre=:i_stde.tingres;
if i_est_hadm<>'1' then i_cambiar=false

//tab_1.tabp_1.cbx_1.enabled=i_cambiar
long cuantos
///////////////////////////
tab_1.tabp_1.uo_ing.retrieve(i_stde.contador, i_stde.clugar_his,'H',i_stde.tingres,'I',i_cespe,i_stde.emp,i_stde.cont,i_stde.profes,0,'','','')
tab_1.tabp_2.uo_ev.retrieve(i_stde.contador, i_stde.clugar_his,'E',i_stde.tingres,'',i_cespe,i_stde.emp,i_stde.cont,i_stde.profes,0,'','','')
tab_1.tabp_new.uo_ord.retrieve(i_stde.contador, i_stde.clugar_his,'R',i_stde.tingres,'I',i_cespe,i_stde.emp,i_stde.cont,i_stde.profes,0,'','','')
tab_1.tabp_3.uo_sal.retrieve(i_stde.contador, i_stde.clugar_his,'H',i_stde.tingres,'S',i_cespe,i_stde.emp,i_stde.cont,i_stde.profes,0,'','','')
////////////////////////////
/////////////////////////PARA VALIDAR QUENO HAGAN ORDENES SINO HAY ATENCION DE INGRESO

select count(*) into :cuantos
from hclin_registro
where (((contador)=:i_stde.contador) and ((clugar)=: i_stde.clugar_his) and ((codtingre) in ('2','3','4','7')) and ((ingreso)='I'));
IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
	MessageBox("No se puede leer paraclicinos si hay", SQLCA.SQLErrText)
	Return -1
END IF
if cuantos>0 then
	tab_1.tabp_2.enabled=true
	tab_1.tabp_new.enabled=true
	tab_1.tabp_3.enabled=true
	tab_1.tp_5.enabled=true
else
	tab_1.tabp_2.enabled=false
	tab_1.tabp_new.enabled=false
	tab_1.tabp_3.enabled=false
	tab_1.tp_5.enabled=false
end if
/////////////

select diagingre into :tab_1.tabp_3.sle_diaging.tag from hospadmi where nh=:i_stde.nh and clugar=:i_stde.clug_hadm and codtingre=:i_stde.tingres;
if isnull(tab_1.tabp_3.sle_diaging.tag) then 
	tab_1.tabp_3.sle_diaging.text=''
	tab_1.tabp_3.sle_diaging.tag=''
else
	select cod_rips into :tab_1.tabp_3.sle_diaging.text from diags where codgeral=:tab_1.tabp_3.sle_diaging.tag;
end if
//uo_datastore dw_primerorden
//dw_primerorden=create uo_datastore
//dw_primerorden.dataobject='dw_primer_orden'
//dw_primerorden.settransobject(sqlca)
//boolean cond,primer_ord=false
//if i_stde.ventana.classname()='w_new_sala_qx' then
//	dw_primerorden.retrieve('5')
//	if w_new_sala_qx.tab_servicios.tabpage_3.uo_2.dw_oscab.rowcount()=0 then primer_ord=true
//else
////	dw_primerorden.retrieve(i_stde.tingres)
////	if dw_primerorden.rowcount()>0 then 
////		if w_new_at_os.uo_1.dw_oscab.rowcount()=0 then 
////			primer_ord=true
////			if w_new_at_os.uo_1.cb_nvorden.event clicked()=-1 then
////				return -1
////			end if	
////		end if
////	end if
//end if
tab_1.tp_5.uo_ord_sale.retrieve(i_stde.contador, i_stde.clugar_his,i_stde.profes,ll_nul,ls_nul,'1',ll_nul,ls_nul,ll_nul,i_cespe)
if tab_1.tabp_3.dw_sale.retrieve(i_stde.nh,i_stde.clug_hadm,i_stde.tingres)>0 then
	tab_1.tp_5.uo_ord_sale.f_estado_hadm('2')
else
	tab_1.tp_5.uo_ord_sale.f_estado_hadm('1')
end if
////aca para  metre primera orden al abrir la ventana
int l_pendientedx 
select
	count(1) into :l_pendientedx 
from 
	((resultadoscab inner join resultadoscpo on (resultadoscab.nrepor = resultadoscpo.nrepor) 
	and (resultadoscab.clugar = resultadoscpo.clugar) and (resultadoscab.coddoc = resultadoscpo.coddoc)) 
	inner join serviciosadx on (resultadoscpo.item = serviciosadx.item) and (resultadoscpo.nrepor = serviciosadx.nrepor) 
	and (resultadoscpo.clugar = serviciosadx.clugar_res) and (resultadoscpo.coddoc = serviciosadx.coddoc)) 
	inner join ingresoadx on (serviciosadx.ningreso = ingresoadx.ningreso) and (serviciosadx.codaadx = ingresoadx.codaadx) 
	and (serviciosadx.clugar = ingresoadx.clugar)
where 
	(((resultadoscpo.contador_hc) is null) and ((serviciosadx.estado)='7') 
	and ((ingresoadx.contador)=:i_stde.contador) and ((ingresoadx.clugar_his)=:i_stde.clugar_his));
IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
	MessageBox("No se puede leer paraclicinos si hay", SQLCA.SQLErrText)
	Return -1
END IF
	
if  l_pendientedx =0 then
	pb_pvisible.visible=false
else
	pb_pvisible.visible=true
end if



end event

event closequery;if tab_1.tabp_1.uo_ing.event closequery()=1 then return 1
if tab_1.tabp_2.uo_ev.event closequery()=1 then return 1
if tab_1.tabp_3.uo_sal.event closequery()=1 then return 1
if tab_1.tabp_new.uo_ord.event closequery()=1 then return 1

//para controlar no edicion  de hc desde multiples equipos
SELECT  profe.control into :i_control
FROM profe 
WHERE profe.CodProf=:i_stde.profes ;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo Profe ',sqlca.sqlerrtext)
	close(this)
	return
end if
if i_control <= 0 then 
	i_control=0
else
	i_control=i_control - 1
end if
update profe set control=:i_control 
WHERE profe.CodProf=:i_stde.profes ;
if sqlca.sqlcode=-1 then
	messagebox("Error Actualizando profe",sqlca.sqlerrtext)
	rollback;
	return
else
	commit;
end if
return 0
end event

event close;sqlca.autocommit=false

end event

type pb_1 from picturebutton within w_evolucion_new
string tag = "Notas de Enfermeria"
integer x = 4069
integer y = 116
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "enfermera.jpg"
string disabledname = "d_enfermera.jpg"
alignment htextalign = left!
end type

event clicked;st_ordenes st_p
st_p.contador = i_stde.contador
st_p.clugar = i_stde.clugar_his
 st_p.cprof = i_stde.profes
 st_p.cesp = i_stde.cesp
st_p.norden =0
st_p.i_est_hadm=i_est_hadm
openwithparm(w_estacion_enf,st_p)

end event

type pb_triage from picturebutton within w_evolucion_new
integer x = 3438
integer y = 116
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &x"
boolean originalsize = true
string picturename = "ojo.gif"
string disabledname = "d_ojo.gif"
alignment htextalign = left!
string powertiptext = "TRIAGE [Alt+X]"
end type

event clicked;trae st
st.numero=i_stde.nh
st.lugar=i_stde.clug_hadm
st.otro='mira'
st.est_hadm=i_est_hadm
openwithparm(w_triage,st)
//if message.stringparm<>'!' then
//	dw_inf.setitem(1,'clasif',message.stringparm)
//end if
//
end event

type pb_notas from picturebutton within w_evolucion_new
integer x = 3598
integer y = 116
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
string picturename = "contrato.gif"
alignment htextalign = left!
string powertiptext = "Notas al paciente"
end type

event clicked;st_notas st_not
st_not.contador=i_stde.contador
st_not.clugar=i_stde.clugar_his
st_not.profe=i_stde.profes
st_not.ventana='EVOL'
st_not.empresa=dw_inf.getitemstring(1,'desemp')
openwithparm(w_notaspac,st_not)
end event

type pb_print from picturebutton within w_evolucion_new
integer x = 3758
integer y = 112
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &h"
boolean originalsize = true
string picturename = "print.GIF"
string disabledname = "d_print.GIF"
alignment htextalign = left!
string powertiptext = "Imprimir Historia o Epicrisis [Alt+H]"
end type

event clicked;if f_vent_Padre(this).event closequery()=1 then return
trae historial
historial.numero=i_stde.contador
historial.lugar=i_stde.clugar_his

SELECT  profe.control into :i_control
FROM profe 
WHERE profe.CodProf=:i_stde.profes ;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo Profe ',sqlca.sqlerrtext)
	close(parent)
	return
end if

if i_control <= 0 then 
	i_control=0
else
	i_control=i_control - 1
end if

update profe set control=:i_control WHERE profe.CodProf=:i_stde.profes ;

if sqlca.sqlcode=-1 then
	messagebox("Error Actualizando profe",sqlca.sqlerrtext)
	rollback;
	return
else
	commit;
end if

openwithparm(w_print_histor_txt,historial)
	
close(parent)
end event

type pb_epicris from picturebutton within w_evolucion_new
integer x = 3918
integer y = 116
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
string picturename = "lapiz.GIF"
string disabledname = "d_lapiz.GIF"
alignment htextalign = left!
string powertiptext = "Editar Epicrisis"
end type

event clicked;if f_permiso_boton(this,'EVOL')=0 then return
if not i_cambiar and (i_edita='' or i_edita='0') then
//if not i_cambiar  then
	messagebox("Atención","Esta admisión se encuentra cerrada, no puede realizarle cambios")
	return
end if
st_xa_print_histo st
st.p_contador=i_stde.contador
st.p_clug=i_stde.clugar_his
st.p_cod_plant='EPICRIS!'
openwithparm(w_epicris,st)
end event

type pb_close from picturebutton within w_evolucion_new
integer x = 4224
integer y = 116
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &"
boolean originalsize = true
string picturename = "puerta.GIF"
string disabledname = "d_puerta.GIF"
end type

event clicked;//para controlar no edicion  de hc desde multiples equipos
SELECT  profe.control into :i_control
FROM profe 
WHERE profe.CodProf=:i_stde.profes ;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo Profe ',sqlca.sqlerrtext)
	return
end if
if i_control <= 0 then 
	i_control=0
else
	i_control=i_control - 1
end if
update profe set control=:i_control 
WHERE profe.CodProf=:i_stde.profes ;
if sqlca.sqlcode=-1 then
	messagebox("Error Actualizando profe",sqlca.sqlerrtext)
	rollback;
	return
else
	commit;
end if
if close(parent)=-1 then return -1
return 1
end event

type pb_pvisible from picturebutton within w_evolucion_new
boolean visible = false
integer x = 4933
integer y = 140
integer width = 759
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "resultados.gif"
alignment htextalign = left!
end type

type dw_1 from datawindow within w_evolucion_new
boolean visible = false
integer x = 366
integer y = 2088
integer width = 233
integer height = 60
integer taborder = 70
string title = "none"
string dataobject = "dw_hospestancia"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type barra2 from hprogressbar within w_evolucion_new
boolean visible = false
integer x = 1819
integer y = 188
integer width = 1463
integer height = 40
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type tab_1 from tab within w_evolucion_new
integer x = 5
integer y = 136
integer width = 6080
integer height = 2408
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabp_1 tabp_1
tabp_2 tabp_2
tabp_new tabp_new
tabp_3 tabp_3
tp_5 tp_5
end type

on tab_1.create
this.tabp_1=create tabp_1
this.tabp_2=create tabp_2
this.tabp_new=create tabp_new
this.tabp_3=create tabp_3
this.tp_5=create tp_5
this.Control[]={this.tabp_1,&
this.tabp_2,&
this.tabp_new,&
this.tabp_3,&
this.tp_5}
end on

on tab_1.destroy
destroy(this.tabp_1)
destroy(this.tabp_2)
destroy(this.tabp_new)
destroy(this.tabp_3)
destroy(this.tp_5)
end on

event selectionchanged;string grabado=''
blob texto
sqlca.autocommit=true
choose case this.selectedtab
	case 2
		setpointer(hourglass!)
		barra2.position=20
		barra2.visible=true
		w_principal.SetMicroHelp ( 'Leyendo' )
		selectblob evolucion into :texto from evolucionhc where contador=:i_stde.contador and clugar=:i_stde.clugar_his;
		barra2.position=50
		grabado=string(texto)
		if isnull(grabado) then grabado=""
		barra2.position=80
		i_cambia_rte=true
		w_principal.SetMicroHelp ( 'Dando Formato' )
		w_principal.SetMicroHelp ( 'Gestión Clínica Integrada' )
		barra2.position=100
		barra2.visible=false
	case 3
		setpointer(hourglass!)
		barra2.position=20
		barra2.visible=true
		w_principal.SetMicroHelp ( 'Leyendo' )
		selectblob ordenes into :texto from evolucionhc where contador=:i_stde.contador and clugar=:i_stde.clugar_his;
		barra2.position=50
		grabado=string(texto)
		if isnull(grabado) then grabado=""
		barra2.position=80
		i_cambia_rte=true
		w_principal.SetMicroHelp ( 'Dando Formato' )
		w_principal.SetMicroHelp ( 'Gestión Clínica Integrada' )
		barra2.position=100
		barra2.visible=false
//		tab_1.tabp_new.dw_new.triggerevent(rowfocuschanged!)
end choose
sqlca.autocommit=false
end event

type tabp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 6043
integer height = 2280
long backcolor = 67108864
string text = "Ingreso"
long tabtextcolor = 33554432
string picturename = "ingreso.ico"
long picturemaskcolor = 536870912
cbx_1 cbx_1
uo_ing uo_ing
end type

on tabp_1.create
this.cbx_1=create cbx_1
this.uo_ing=create uo_ing
this.Control[]={this.cbx_1,&
this.uo_ing}
end on

on tabp_1.destroy
destroy(this.cbx_1)
destroy(this.uo_ing)
end on

type cbx_1 from checkbox within tabp_1
boolean visible = false
integer x = 905
integer y = 16
integer width = 608
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Queda en &Observación"
end type

event clicked;string est='0'
if checked then 
	est='1'
else
	return
end if
tab_1.tabp_2.cbx_2.checked=true
update hospadmi set en_observa=:est where nh=:i_stde.nh and clugar=:i_stde.clug_hadm and codtingre='2';
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando Hospadmi",sqlca.sqlerrtext)
	rollback;
else
	commit;
end if
if i_stde.ventana.classname()<>'w_new_sala_qx' then
	w_new_at_os.uo_1.sle_obs.text='obs'
	w_new_at_os.uo_1.dw_profe.setitem(1,1,i_stde.profes)
	if w_new_at_os.uo_1.cb_nvorden.event clicked()=-1 then 
		puede=false
		cbx_1.enabled=true
		tab_1.tabp_2.cbx_2.enabled=true		
		return 0
	else
		nv_orden=true
		cbx_1.enabled=false
		tab_1.tabp_2.cbx_2.enabled=false
		return 1
	end if
end if
end event

type uo_ing from uo_hclin within tabp_1
event destroy ( )
integer x = 23
integer y = 24
integer height = 2184
integer taborder = 60
boolean enabled = true
string i_message = "Ingreso"
end type

on uo_ing.destroy
call uo_hclin::destroy
end on

event cambio_diags;call super::cambio_diags;long cuantos

select count(*) into :cuantos
from hclin_registro
where (((contador)=:i_stde.contador) and ((clugar)=: i_stde.clugar_his) and ((codtingre) in ('2','3','4','7')) and ((ingreso)='I'));
IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
	MessageBox('No se puede leer paraclicinos si hay', SQLCA.SQLErrText)
	Return 
END IF
if cuantos>0 then
	tab_1.tabp_2.enabled=true
	tab_1.tabp_new.enabled=true
	tab_1.tabp_3.enabled=true
	tab_1.tp_5.enabled=true
else
	tab_1.tabp_2.enabled=false
	tab_1.tabp_new.enabled=false
	tab_1.tabp_3.enabled=false
	tab_1.tp_5.enabled=false
end if
end event

type tabp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 6043
integer height = 2280
long backcolor = 67108864
string text = "Evolución"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
cbx_2 cbx_2
uo_ev uo_ev
end type

on tabp_2.create
this.cbx_2=create cbx_2
this.uo_ev=create uo_ev
this.Control[]={this.cbx_2,&
this.uo_ev}
end on

on tabp_2.destroy
destroy(this.cbx_2)
destroy(this.uo_ev)
end on

type cbx_2 from checkbox within tabp_2
integer x = 905
integer y = 16
integer width = 603
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Queda en &Observación"
end type

event clicked;string est='0'
if checked then 
	est='1'
else
	return
end if

update hospadmi set en_observa=:est where nh=:i_stde.nh and clugar=:i_stde.clug_hadm and codtingre='2';
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando Hospadmi",sqlca.sqlerrtext)
	rollback;
else
	commit;
end if
if i_stde.ventana.classname()<>'w_new_sala_qx' then
	w_new_at_os.uo_1.sle_obs.text='obs'
	w_new_at_os.uo_1.dw_profe.setitem(1,1,i_stde.profes)
	if w_new_at_os.uo_1.cb_nvorden.event clicked()=-1 then 
		puede=false
		tab_1.tabp_1.cbx_1.enabled=true
		cbx_2.enabled=true
		return 0
	else
		nv_orden=true		
		tab_1.tabp_1.cbx_1.enabled=false
		cbx_2.enabled=false
		return 1
	end if
end if
end event

type uo_ev from uo_hclin within tabp_2
event destroy ( )
integer y = 12
integer height = 2232
integer taborder = 80
boolean enabled = true
string i_message = "Evolución"
end type

on uo_ev.destroy
call uo_hclin::destroy
end on

type tabp_new from userobject within tab_1
integer x = 18
integer y = 112
integer width = 6043
integer height = 2280
long backcolor = 67108864
string text = "Ordenes"
long tabtextcolor = 33554432
string picturename = "entrega_med.ico"
long picturemaskcolor = 536870912
st_1 st_1
st_respon st_respon
uo_ord uo_ord
cb_cambiores cb_cambiores
end type

on tabp_new.create
this.st_1=create st_1
this.st_respon=create st_respon
this.uo_ord=create uo_ord
this.cb_cambiores=create cb_cambiores
this.Control[]={this.st_1,&
this.st_respon,&
this.uo_ord,&
this.cb_cambiores}
end on

on tabp_new.destroy
destroy(this.st_1)
destroy(this.st_respon)
destroy(this.uo_ord)
destroy(this.cb_cambiores)
end on

type st_1 from statictext within tabp_new
integer x = 2537
integer y = 24
integer width = 439
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Responsable Actual"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_respon from statictext within tabp_new
integer x = 2990
integer y = 12
integer width = 1111
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388736
long backcolor = 15793151
string text = "Ninguno"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type uo_ord from uo_hclin within tabp_new
event destroy ( )
integer y = 96
integer height = 2136
integer taborder = 40
boolean bringtotop = true
boolean enabled = true
string i_message = "Ordenes"
end type

on uo_ord.destroy
call uo_hclin::destroy
end on

type cb_cambiores from picturebutton within tabp_new
integer x = 4238
integer y = 8
integer width = 146
integer height = 140
integer taborder = 13
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &b"
string picturename = "refrescar.GIF"
string disabledname = "d_refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Cambio de Medico Responsable [Alt+B]"
end type

event clicked;if not i_cambiar and (i_edita='' or i_edita='0')then
	messagebox("Atención","Esta admisión se encuentra cerrada, no puede realizarle cambios")
	return
end if
string respon
datetime fentra,hentra
setnull(respon)
respon=i_stde.profes 
SELECT HospRespon.CodProf into :respon
FROM HospRespon
WHERE HospRespon.NH=:i_stde.nh and clugar=:i_stde.clug_hadm AND HospRespon.CodTIngre=:i_stde.tingres AND HospRespon.fecha_fin Is Null;

if respon<>i_stde.profes then
	select mgeneral into :respon from profe where codprof=:i_stde.profes;
	if respon='0' then
		messagebox("Atención","El único que puede cambiar de Médico, es el médico Responsable actual o un profesional con permiso para esto")
		return
	else
		open(w_cambio_respon)
	end if
else
	open(w_cambio_respon)
end if
end event

type tabp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 6043
integer height = 2280
long backcolor = 67108864
string text = "Salida"
long tabtextcolor = 33554432
string picturename = "puerta.ico"
long picturemaskcolor = 536870912
pb_guardaegres pb_guardaegres
pb_anula_sal pb_anula_sal
pb_egreso pb_egreso
uo_sal uo_sal
dw_sale dw_sale
st_14 st_14
sle_diaging sle_diaging
st_diagsal st_diagsal
end type

on tabp_3.create
this.pb_guardaegres=create pb_guardaegres
this.pb_anula_sal=create pb_anula_sal
this.pb_egreso=create pb_egreso
this.uo_sal=create uo_sal
this.dw_sale=create dw_sale
this.st_14=create st_14
this.sle_diaging=create sle_diaging
this.st_diagsal=create st_diagsal
this.Control[]={this.pb_guardaegres,&
this.pb_anula_sal,&
this.pb_egreso,&
this.uo_sal,&
this.dw_sale,&
this.st_14,&
this.sle_diaging,&
this.st_diagsal}
end on

on tabp_3.destroy
destroy(this.pb_guardaegres)
destroy(this.pb_anula_sal)
destroy(this.pb_egreso)
destroy(this.uo_sal)
destroy(this.dw_sale)
destroy(this.st_14)
destroy(this.sle_diaging)
destroy(this.st_diagsal)
end on

event dragdrop;if dw_sale.rowcount()=0 then return 0
if not i_cambiar then
	messagebox("Atención","Esta admisión se encuentra cerrada, no puede realizarle cambios")
	return -1
end if
dw_sale.setitem(1,'fechaegreso',datetime(uo_sal.em_1.text))
dw_sale.setitem(1,'cusuario',usuario)
dw_sale.setitem(1,'horaegreso',datetime(date('1-1-1900'),time(right(uo_sal.em_1.text,5))))
if i_stde.tingres='2' then //pa lo de horas de observacion
	string observ
	datetime fecha,hora
	long horas,dias
	select en_observa,fechaingreso,horaingreso into :observ,:fecha,:hora from hospadmi where nh=:i_stde.nh and clugar=:i_stde.clug_hadm;
	if observ='1' then
		dias=daysafter(date(fecha),date(datetime(uo_sal.em_1.text)))*24
		horas=secondsafter(time(hora),time(datetime(uo_sal.em_1.text)))/3600
		dw_sale.setitem(1,'horasobserva',dias+horas)
	end if
end if
long nsal
if dw_sale.getitemstatus(1,0,primary!)=new! or dw_sale.getitemstatus(1,0,primary!)=newmodified! then
	nsal=f_trae_ndoc('SAL',clugar,'SALIDA ADMISIONES')
	if nsal<0 then
		rollback;
		return -1
	end if
	dw_sale.setitem(1,"nsalida",nsal)
end if
if dw_sale.update(true,false)= -1 then
	rollback;
	return -1
end if
if uo_sal.grabar()=-1 then 
	rollback;
	return -1 //guardar
else
	commit;
end if

dw_sale.resetupdate()
cambio_sal=false
if isvalid(w_admision) then w_admision.triggerevent(open!)
tab_1.tp_5.uo_ord_sale.f_estado_hadm('2') //para que deje crear ordenes de salida
return 0
end event

type pb_guardaegres from picturebutton within tabp_3
integer x = 3278
integer y = 4
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &g"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Salida [Alt+G]"
end type

event clicked;if dw_sale.rowcount()=0 then return 0
if not i_cambiar then
	messagebox("Atención","Esta admisión se encuentra cerrada, no puede realizarle cambios")
	return -1
end if
dw_sale.setitem(1,'fechaegreso',datetime(uo_sal.em_1.text))
dw_sale.setitem(1,'usuario',usuario)
dw_sale.setitem(1,'horaegreso',datetime(date('1-1-1900'),time(right(uo_sal.em_1.text,5))))
if i_stde.tingres='2' then //pa lo de horas de observacion
	string observ
	datetime fecha,hora
	long horas,dias
	select en_observa,fechaingreso,horaingreso into :observ,:fecha,:hora from hospadmi where nh=:i_stde.nh and clugar=:i_stde.clug_hadm;
	if observ='1' then
		dias=daysafter(date(fecha),date(datetime(uo_sal.em_1.text)))*24
		horas=secondsafter(time(hora),time(datetime(uo_sal.em_1.text)))/3600
		dw_sale.setitem(1,'horasobserva',dias+horas)
	end if
end if
long nsal
//if dw_sale.getitemstatus(1,0,primary!)=new! or dw_sale.getitemstatus(1,0,primary!)=newmodified! then
setnull(nsal)
select count(1) into :nsal from hospsali  where nhosp=:i_stde.nh and clugar_hadm=:i_stde.clug_hadm and codtingre=:i_stde.tingres;
if nsal=0 or isnull(nsal) then 
	setnull(nsal)
	select max(nsalida) into :nsal from hospsali;
	if isnull(nsal) then nsal=0
	nsal ++
	dw_sale.setitem(1,"nsalida",nsal)
end if
if dw_sale.update(true,false)= -1 then
	rollback;
	return -1
end if
if uo_sal.grabar()=-1 then 
	rollback;
	return -1 //guardar
else
	commit;
end if

dw_sale.resetupdate()
cambio_sal=false
if isvalid(w_admision) then w_admision.triggerevent(open!)
tab_1.tp_5.uo_ord_sale.f_estado_hadm('2') //para que deje crear ordenes de salida
return 0
end event

type pb_anula_sal from picturebutton within tabp_3
integer x = 3122
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Anular Salida [Alt+A]"
end type

event clicked;if not isnull(dw_sale.getitemnumber(1,"nsalida")) then
	if messagebox("Atención","Está seguro que desea anular esta salida?",question!,yesno!,2)=2 then return
	dw_sale.deleterow(1)
	if dw_sale.update()=-1 then
		rollback;
		dw_sale.retrieve(i_stde.nh,i_stde.clug_hadm,i_stde.tingres)
	else
		commit;
	end if
end if
end event

type pb_egreso from picturebutton within tabp_3
integer x = 2967
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &s"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Ingresar datos Salida [Alt+S]"
end type

event clicked;long no_pos

select count(1) into :no_pos
from 
	((resultadoscab inner join resultadoscpo on (resultadoscab.nrepor = resultadoscpo.nrepor) 
	and (resultadoscab.clugar = resultadoscpo.clugar) and (resultadoscab.coddoc = resultadoscpo.coddoc)) 
	inner join serviciosadx on (resultadoscpo.item = serviciosadx.item) and (resultadoscpo.nrepor = serviciosadx.nrepor) 
	and (resultadoscpo.clugar = serviciosadx.clugar_res) and (resultadoscpo.coddoc = serviciosadx.coddoc)) 
	inner join ingresoadx on (serviciosadx.ningreso = ingresoadx.ningreso) and (serviciosadx.codaadx = ingresoadx.codaadx) 
	and (serviciosadx.clugar = ingresoadx.clugar)
where 
	(((resultadoscpo.contador_hc) is null) and ((serviciosadx.estado)='7') 
	and ((ingresoadx.contador)=:i_stde.contador) and ((ingresoadx.clugar_his)=:i_stde.clugar_his));
if no_pos>0 then 
	messagebox("Atención","Esta admisión tiene "+string(no_pos) +" resaultados sin llevar a HC")
	return
end if

SELECT Sum(entregada-suministrada-devuelta) into :no_pos
FROM hospadmi INNER JOIN oscuerpo ON (hospadmi.clugar_his = oscuerpo.clugar) AND (hospadmi.contador = oscuerpo.contador)
WHERE (((hospadmi.nh)=:i_stde.nh) AND ((hospadmi.clugar)=:i_stde.clug_hadm) AND ((hospadmi.codtingre)=:i_stde.tingres));
if no_pos>0 then 
	messagebox("Atención","Esta admisión tiene "+string(no_pos) +" productos sin atender o devolver")
	return
end if

select count(sum_mvto_cab.numdoc) into :no_pos
	from (sum_mvto_cab inner join sum_mvto_cpo on (sum_mvto_cab.numdoc = sum_mvto_cpo.numdoc) and (sum_mvto_cab.clugar = sum_mvto_cpo.clugar) and (sum_mvto_cab.coddoc = sum_mvto_cpo.coddoc)) inner join (((sum_mvto_cpo as sum_mvto_cpo_1 inner join oscuerpo on (sum_mvto_cpo_1.item_os = oscuerpo.item) and (sum_mvto_cpo_1.nsolicitud_os = oscuerpo.nsolicitud) and (sum_mvto_cpo_1.clugar_os = oscuerpo.clugar) and (sum_mvto_cpo_1.contador_os = oscuerpo.contador)) inner join hospadmi on (oscuerpo.clugar = hospadmi.clugar_his) and (oscuerpo.contador = hospadmi.contador)) inner join pacientes on (hospadmi.documento = pacientes.documento) and (hospadmi.tipodoc = pacientes.tipodoc)) on (sum_mvto_cpo.item_ori = sum_mvto_cpo_1.item) and (sum_mvto_cpo.numdoc_ori = sum_mvto_cpo_1.numdoc) and (sum_mvto_cpo.clugar_ori = sum_mvto_cpo_1.clugar) and (sum_mvto_cpo.coddoc_ori = sum_mvto_cpo_1.coddoc)
	where (((sum_mvto_cab.coddoc)='DEVF') and ((sum_mvto_cpo.control)='0') and ((sum_mvto_cab.estado)<>'2') and ((hospadmi.nh)=:i_stde.nh) and ((hospadmi.clugar)=:i_stde.clug_hadm) and ((hospadmi.codtingre)=	:i_stde.tingres));
if no_pos>0 then
	messagebox("Atención",'Paciente con Devoluciones Pendientes por confirmar')	
	return	
end if

if dw_sale.rowcount()>0 then return
dw_sale.insertrow(1)
dw_sale.setitem(1,"nhosp",i_stde.nh)
dw_sale.setitem(1,"clugar_hadm",i_stde.clug_hadm)
dw_sale.setitem(1,"codtingre",i_stde.tingres)
string ding
ding=sle_diaging.tag
if ding<>"" then dw_sale.setitem(1,"diagingre",ding)
cambio_sal=true
uo_sal.visible=true
end event

type uo_sal from uo_hclin within tabp_3
event destroy ( )
integer x = 46
integer y = 136
integer height = 2108
integer taborder = 50
boolean enabled = true
end type

on uo_sal.destroy
call uo_hclin::destroy
end on

event constructor;call super::constructor;uo_1.pb_save.visible=false
end event

type dw_sale from datawindow within tabp_3
integer x = 2373
integer y = 12
integer width = 544
integer height = 92
integer taborder = 80
string title = "none"
string dataobject = "dw_salida_med"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event retrieveend;if rowcount>0 then
	tab_1.tabp_3.uo_sal.visible=true
else
	tab_1.tabp_3.uo_sal.visible=false
end if
end event

type st_14 from statictext within tabp_3
integer y = 20
integer width = 119
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DIng."
boolean focusrectangle = false
end type

type sle_diaging from singlelineedit within tabp_3
integer x = 119
integer y = 16
integer width = 178
integer height = 72
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;if this.text<>'' then
	select desdiag into :st_diagsal.text from diags where codgeral=:this.tag;
end if
end event

type st_diagsal from statictext within tabp_3
integer x = 297
integer y = 16
integer width = 1888
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type tp_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 6043
integer height = 2280
long backcolor = 67108864
string text = "Ord. Salida"
long tabtextcolor = 33554432
string picturename = "entrega_med.ico"
long picturemaskcolor = 536870912
uo_ord_sale uo_ord_sale
end type

on tp_5.create
this.uo_ord_sale=create uo_ord_sale
this.Control[]={this.uo_ord_sale}
end on

on tp_5.destroy
destroy(this.uo_ord_sale)
end on

type uo_ord_sale from uo_orden_formula within tp_5
integer x = 5
integer y = 12
integer width = 6025
integer height = 2224
integer taborder = 100
string i_codrep_formula = "OMSH"
string i_codrep_orden = "OSSH"
boolean repord_dialogo = true
boolean repfor_dialogo = true
end type

event constructor;call super::constructor;init('S') //salida de Hosp/Urg
end event

on uo_ord_sale.destroy
call uo_orden_formula::destroy
end on

type dw_inf from datawindow within w_evolucion_new
integer width = 5838
integer height = 128
string title = "none"
string dataobject = "dw_inf_emp_cama"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

event retrieveend;do while this.rowcount()> 1
	this.deleterow(2)
loop
end event

