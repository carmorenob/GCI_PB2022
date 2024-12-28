$PBExportHeader$w_reenvia_glosas.srw
forward
global type w_reenvia_glosas from window
end type
type pb_imp from pb_report within w_reenvia_glosas
end type
type pb_anul from picturebutton within w_reenvia_glosas
end type
type dw_electronica from uo_datawindow within w_reenvia_glosas
end type
type pb_impnota from picturebutton within w_reenvia_glosas
end type
type pb_connota from picturebutton within w_reenvia_glosas
end type
type pb_diann from picturebutton within w_reenvia_glosas
end type
type em_1 from editmask within w_reenvia_glosas
end type
type pb_fenvio from picturebutton within w_reenvia_glosas
end type
type pb_6 from picturebutton within w_reenvia_glosas
end type
type pb_save from picturebutton within w_reenvia_glosas
end type
type dw_histo from datawindow within w_reenvia_glosas
end type
type gb_1 from groupbox within w_reenvia_glosas
end type
type gb_2 from groupbox within w_reenvia_glosas
end type
type tab_1 from tab within w_reenvia_glosas
end type
type tp_1 from userobject within tab_1
end type
type mle_resp1 from multilineedit within tp_1
end type
type pb_1 from picturebutton within tp_1
end type
type pb_add from picturebutton within tp_1
end type
type pb_cerrar from picturebutton within tp_1
end type
type st_3 from statictext within tp_1
end type
type st_2 from statictext within tp_1
end type
type dw_resp from datawindow within tp_1
end type
type dw_facts from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
mle_resp1 mle_resp1
pb_1 pb_1
pb_add pb_add
pb_cerrar pb_cerrar
st_3 st_3
st_2 st_2
dw_resp dw_resp
dw_facts dw_facts
end type
type tp_2 from userobject within tab_1
end type
type mle_resp2 from multilineedit within tp_2
end type
type pb_3 from picturebutton within tp_2
end type
type pb_2 from picturebutton within tp_2
end type
type st_12 from statictext within tp_2
end type
type dw_dfacts from datawindow within tp_2
end type
type st_6 from statictext within tp_2
end type
type dw_resp_proc from datawindow within tp_2
end type
type st_5 from statictext within tp_2
end type
type dw_procs from datawindow within tp_2
end type
type st_4 from statictext within tp_2
end type
type tp_2 from userobject within tab_1
mle_resp2 mle_resp2
pb_3 pb_3
pb_2 pb_2
st_12 st_12
dw_dfacts dw_dfacts
st_6 st_6
dw_resp_proc dw_resp_proc
st_5 st_5
dw_procs dw_procs
st_4 st_4
end type
type tp_3 from userobject within tab_1
end type
type mle_resp3 from multilineedit within tp_3
end type
type pb_5 from picturebutton within tp_3
end type
type pb_4 from picturebutton within tp_3
end type
type dw_dprocs from datawindow within tp_3
end type
type st_11 from statictext within tp_3
end type
type dw_dfacts2 from datawindow within tp_3
end type
type st_10 from statictext within tp_3
end type
type st_9 from statictext within tp_3
end type
type dw_resp_sitem from datawindow within tp_3
end type
type st_8 from statictext within tp_3
end type
type dw_sitem from datawindow within tp_3
end type
type st_7 from statictext within tp_3
end type
type tp_3 from userobject within tab_1
mle_resp3 mle_resp3
pb_5 pb_5
pb_4 pb_4
dw_dprocs dw_dprocs
st_11 st_11
dw_dfacts2 dw_dfacts2
st_10 st_10
st_9 st_9
dw_resp_sitem dw_resp_sitem
st_8 st_8
dw_sitem dw_sitem
st_7 st_7
end type
type tab_1 from tab within w_reenvia_glosas
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
end forward

global type w_reenvia_glosas from window
integer width = 5659
integer height = 2088
boolean titlebar = true
string title = "Cartera - Reenvio de Objeciones"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_renvio.ico"
pb_imp pb_imp
pb_anul pb_anul
dw_electronica dw_electronica
pb_impnota pb_impnota
pb_connota pb_connota
pb_diann pb_diann
em_1 em_1
pb_fenvio pb_fenvio
pb_6 pb_6
pb_save pb_save
dw_histo dw_histo
gb_1 gb_1
gb_2 gb_2
tab_1 tab_1
end type
global w_reenvia_glosas w_reenvia_glosas

type variables
datawindowchild idw_facts,idw_facts2,idw_procs,idw_resp1,idw_resp2,idw_resp3
boolean i_cambio
end variables

forward prototypes
public function integer f_pregunta ()
public function integer grabar ()
public function integer f_coloca_item (datawindow p_dw)
end prototypes

public function integer f_pregunta ();tab_1.tp_1.mle_resp1.event losefocus()
tab_1.tp_2.mle_resp2.event losefocus()
tab_1.tp_3.mle_resp3.event losefocus()
if (not i_cambio) then return 2
return messagebox("Atención, realizó cambios",'Desea guardar los cambios?',question!,yesnocancel!,3)
end function

public function integer grabar ();if not i_cambio then return 1
if tab_1.tp_3.dw_resp_sitem.event p_itemchanged(1)=-1 then return -1
if tab_1.tp_2.dw_resp_proc.event p_itemchanged(1)=-1 then return -1
if tab_1.tp_1.dw_resp.event p_itemchanged(1)=-1 then return -1
if tab_1.tp_1.dw_facts.update(true,false)=-1 then return -1
if tab_1.tp_2.dw_procs.update(true,false)=-1 then return -1
if tab_1.tp_3.dw_sitem.update(true,false)=-1 then return -1
datawindow dw_t
dw_t=tab_1.tp_1.dw_resp
if f_coloca_item(dw_t)=-1 then return -1
if dw_t.update(true,false)=-1 then return -1
dw_t=tab_1.tp_2.dw_resp_proc
if f_coloca_item(dw_t)=-1 then return -1
if dw_t.update(true,false)=-1 then return -1
dw_t=tab_1.tp_3.dw_resp_sitem
if f_coloca_item(dw_t)=-1 then return -1
if dw_t.update(true,false)=-1 then return -1
commit;
tab_1.tp_1.dw_facts.event rowfocuschanged(tab_1.tp_1.dw_facts.getrow())
tab_1.tp_3.dw_resp_sitem.resetupdate()
tab_1.tp_2.dw_resp_proc.resetupdate()
tab_1.tp_1.dw_resp.resetupdate()
tab_1.tp_1.dw_facts.resetupdate()
tab_1.tp_2.dw_procs.resetupdate()
tab_1.tp_3.dw_sitem.resetupdate()
i_cambio=false
return 1
end function

public function integer f_coloca_item (datawindow p_dw);long j,cual
string err
p_dw.setfilter('')
p_dw.filter()
select max(num_respu) into :cual from car_glosa_respu;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error leyendo car_glosa_respu',err)
	return -1
end if
if isnull(cual) then cual=0
dwitemstatus estado
for j=1 to p_dw.rowcount()
	estado=p_dw.getitemstatus(j,0,primary!)
	if estado=New! or estado=NewModified! then
		cual++
		p_dw.setitem(j,'num_respu',cual)
	end if
next
return 1
end function

on w_reenvia_glosas.create
this.pb_imp=create pb_imp
this.pb_anul=create pb_anul
this.dw_electronica=create dw_electronica
this.pb_impnota=create pb_impnota
this.pb_connota=create pb_connota
this.pb_diann=create pb_diann
this.em_1=create em_1
this.pb_fenvio=create pb_fenvio
this.pb_6=create pb_6
this.pb_save=create pb_save
this.dw_histo=create dw_histo
this.gb_1=create gb_1
this.gb_2=create gb_2
this.tab_1=create tab_1
this.Control[]={this.pb_imp,&
this.pb_anul,&
this.dw_electronica,&
this.pb_impnota,&
this.pb_connota,&
this.pb_diann,&
this.em_1,&
this.pb_fenvio,&
this.pb_6,&
this.pb_save,&
this.dw_histo,&
this.gb_1,&
this.gb_2,&
this.tab_1}
end on

on w_reenvia_glosas.destroy
destroy(this.pb_imp)
destroy(this.pb_anul)
destroy(this.dw_electronica)
destroy(this.pb_impnota)
destroy(this.pb_connota)
destroy(this.pb_diann)
destroy(this.em_1)
destroy(this.pb_fenvio)
destroy(this.pb_6)
destroy(this.pb_save)
destroy(this.dw_histo)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.tab_1)
end on

event open;em_1.TriggerEvent(modified!)
end event

event closequery;choose case f_pregunta()
	case 1
		if grabar()=-1 then
			return 1
		else
			return 0
		end if
	case 2
		return 0
	case 3
		return 1
end choose
end event

event resize;tab_1.resize((newwidth - 50) , (newheight * 0.70))
tab_1.tp_1.dw_facts.resize((newwidth - 150) , (newheight * 0.30))
tab_1.tp_1.st_2.y=tab_1.tp_1.dw_facts.y+tab_1.tp_1.dw_facts.height + 20
tab_1.tp_1.dw_resp.y=tab_1.tp_1.dw_facts.y+tab_1.tp_1.dw_facts.height + 80
tab_1.tp_1.dw_resp.resize((newwidth * 0.45) , (newheight * 0.30))
tab_1.tp_1.dw_resp.Object.cod_respuesta.Width =tab_1.tp_1.dw_resp.width - 500

tab_1.tp_1.st_3.y=tab_1.tp_1.dw_facts.y+tab_1.tp_1.dw_facts.height + 20
tab_1.tp_1.st_3.x=tab_1.tp_1.dw_resp.x+tab_1.tp_1.dw_resp.width + 80

tab_1.tp_1.mle_resp1.y=tab_1.tp_1.dw_facts.y+tab_1.tp_1.dw_facts.height + 80
tab_1.tp_1.mle_resp1.x=tab_1.tp_1.dw_resp.x+tab_1.tp_1.dw_resp.width + 80
tab_1.tp_1.mle_resp1.resize((newwidth * 0.45) , (newheight * 0.30))

tab_1.tp_2.dw_procs.resize((newwidth - 150) , (newheight * 0.30))
tab_1.tp_2.st_5.y=tab_1.tp_2.dw_procs.y+tab_1.tp_2.dw_procs.height + 20
tab_1.tp_2.dw_resp_proc.y=tab_1.tp_2.dw_procs.y+tab_1.tp_2.dw_procs.height  + 80
tab_1.tp_2.dw_resp_proc.resize((newwidth * 0.45) , (newheight * 0.22))
tab_1.tp_2.dw_resp_proc.Object.cod_respuesta.Width =tab_1.tp_2.dw_resp_proc.width - 500

tab_1.tp_2.st_6.y=tab_1.tp_2.dw_procs.y+tab_1.tp_2.dw_procs.height + 20
tab_1.tp_2.st_6.x=tab_1.tp_2.dw_resp_proc.x+tab_1.tp_2.dw_resp_proc.width + 80

tab_1.tp_2.mle_resp2.y=tab_1.tp_2.dw_procs.y+tab_1.tp_2.dw_procs.height + 80
tab_1.tp_2.mle_resp2.x=tab_1.tp_2.dw_resp_proc.x+tab_1.tp_2.dw_resp_proc.width + 80
tab_1.tp_2.mle_resp2.resize((newwidth * 0.45) , (newheight * 0.22))

tab_1.tp_3.dw_sitem.resize((newwidth - 150) , (newheight * 0.30))
tab_1.tp_3.st_8.y=tab_1.tp_3.dw_sitem.y+tab_1.tp_3.dw_sitem.height + 20
tab_1.tp_3.dw_resp_sitem.y=tab_1.tp_3.dw_sitem.y+tab_1.tp_3.dw_sitem.height  + 80
tab_1.tp_3.dw_resp_sitem.resize((newwidth * 0.45) , (newheight * 0.22))
tab_1.tp_3.dw_resp_sitem.Object.cod_respuesta.Width =tab_1.tp_3.dw_resp_sitem.width - 500

tab_1.tp_3.st_9.y=tab_1.tp_3.dw_sitem.y+tab_1.tp_3.dw_sitem.height + 20
tab_1.tp_3.st_9.x=tab_1.tp_3.dw_resp_sitem.x+tab_1.tp_3.dw_resp_sitem.width + 80

tab_1.tp_3.mle_resp3.y=tab_1.tp_3.dw_sitem.y+tab_1.tp_3.dw_sitem.height + 80
tab_1.tp_3.mle_resp3.x=tab_1.tp_3.dw_resp_sitem.x+tab_1.tp_3.dw_resp_sitem.width + 80
tab_1.tp_3.mle_resp3.resize((newwidth * 0.45) , (newheight * 0.22))
end event

type pb_imp from pb_report within w_reenvia_glosas
integer x = 5390
integer y = 508
integer taborder = 70
boolean bringtotop = true
string powertiptext = "Imprime Respuesta"
string cod_rep = "ROBJ"
string nombre_rep = "Respuesta a Objección"
string tipo_rep = "interno!"
boolean v_preliminar = true
end type

event clicked;call super::clicked;if dw_histo.rowcount()=0 then return
if dw_histo.getitemstring(dw_histo.getrow(),'estado')<>'2' then return
any par[3]
par[1]='%'
par[2]=dw_histo.getitemstring(dw_histo.getrow(),'num_glosa')
par[2]=dw_histo.getitemstring(dw_histo.getrow(),'num_glosa')
imprimir(par,'','0')
end event

type pb_anul from picturebutton within w_reenvia_glosas
integer x = 5230
integer y = 508
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
string powertiptext = "Anula Reenvio"
end type

event clicked;double ldb_ncobro,ldb_itcob,ldb_nglosa
string ls_clcob,ls_coddoc,ls_ctipo,ls_err,ls_cdglos,ls_clglos,ls_nulo
string ls_cont,ls_pres
datetime ldt_nulo
dec ln_valor,ln_can,ln_resul

if dw_histo.getitemstring(dw_histo.getrow(),'estado')<>'3' then return
st_xa_anular st_anula
st_anula.tipo='CA'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return -1

ls_cdglos=dw_histo.getitemstring(dw_histo.getrow(),'coddoc')
ls_clglos=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
ldb_nglosa=dw_histo.getitemnumber(dw_histo.getrow(),'num_glosa')

select 
	car_cobro_cpo.clugar, car_cobro_cpo.coddoc, car_cobro_cpo.num_cobro, car_cobro_cpo.item, car_cobro_cpo.cartipo,
	car_cobro_cpo.contabil,car_cobro_cpo.presupuesto
	into :ls_clcob,:ls_coddoc,:ldb_ncobro,:ldb_itcob,:ls_ctipo,:ls_cont,:ls_pres
from 
	car_cobro_cpo inner join car_tipo on car_cobro_cpo.cartipo = car_tipo.cartipo
WHERE 
	(((car_cobro_cpo.coddoc_glosa)=:ls_cdglos) AND ((car_cobro_cpo.clugar_glosa)=:ls_clglos) 
	AND ((car_cobro_cpo.num_glosa)=:ldb_nglosa) AND ((car_tipo.operacion)=-1) 
	AND ((car_tipo.codtipo)='3') AND ((car_cobro_cpo.estado) Is Null));
if sqlca.sqlcode=-1 then
	ls_err=sqlca.sqlerrtext
	messagebox('Error leyendo car_cobro_cpo',ls_err)
	return -1
end if

if ls_cont='C' and ls_pres='1' then
	messagebox('Atención','Documento Contabilizado y con Movimiento Presupuestal no se puede anular')
	return -1
end if

if not isnull(ls_clcob) or ls_clcob<>'' then
	SELECT  (vtcancelar-vtcancelado) into :ln_can
	FROM CAR_COBRO_CAB
	WHERE (((clugar)=:ls_clcob) AND ((coddoc)=:ls_coddoc) AND ((num_cobro)=:ldb_ncobro));
	if sqlca.sqlcode=-1 then
		ls_err=sqlca.sqlerrtext
		messagebox('Error leyendo car_cobro_cab',ls_err)
		return -1
	end if
	
	ln_valor=round(dw_histo.getitemnumber(dw_histo.getrow(),'valor_aceptado'),i_dec_gral_car)
	ln_resul=ln_can + ln_valor
	IF ln_resul<0 then 
		messagebox("Atención",'El saldo no puede ser negativo verifique los datos')
		return 
	End If
	
	setnull(ls_nulo)
	setnull(ldt_nulo)
	dw_histo.setitem(dw_histo.getrow(),'estado','2')
	dw_histo.setitem(dw_histo.getrow(),'fecha_envia',ldt_nulo)
	dw_histo.setitem(dw_histo.getrow(),'fecha_radica',ldt_nulo)
	if dw_histo.update(true,false)=-1 then return
	
	if ls_cont='C' then
		ls_cont='P'
	else
		setnull(ls_cont)
	end if
	
	update car_cobro_cpo set coddoc_glosa=:ls_nulo ,clugar_glosa=:ls_nulo, num_glosa=:ls_nulo,cod_anula=:st_anula.motivo,motiv_anula=:st_anula.observacion,estado=:usuario,contabil_anul=:ls_cont
	where clugar =:ls_clcob and coddoc =:ls_coddoc and num_cobro =:ldb_ncobro and cartipo =:ls_ctipo and item=:ldb_itcob;
	if sqlca.sqlcode=-1 then 
		ls_err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando car_cobro_cpo',ls_err)
		return -1
	end if
	
	update car_cobro_tot set valor = (valor - :ln_valor)
	where (((car_cobro_tot.clugar)=:ls_clcob ) and ((car_cobro_tot.coddoc)=:ls_coddoc) and ((car_cobro_tot.num_cobro)=:ldb_ncobro) and ((car_cobro_tot.cartipo)=:ls_ctipo));
	if sqlca.sqlcode=-1 then 
		ls_err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando car_cobro_tot',ls_err)
		return -1
	end if
	
	uo_datastore ds
	ds=create uo_datastore
	ds.dataobject='dw_calc_tot'
	ds.settransobject(sqlca)
	
	ds.retrieve(ls_clcob,ls_coddoc,ldb_ncobro)
	if ds.rowcount()>0 then
		ln_can=round(ds.getitemnumber(1,'vtcancelar'),i_dec_gral_car)
		update car_cobro_cab set vtcancelar=:ln_can
		where clugar=:ls_clcob and coddoc=:ls_coddoc and num_cobro=:ldb_ncobro;
		if sqlca.sqlcode=-1 then
			ls_err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando en car_cobro_cab lo nuevos totales',ls_err)
			return
		end if
	end if

	destroy ds
	commit;
else
	messagebox('Atencion','No hay registro asociado')
end if
Return 0

end event

type dw_electronica from uo_datawindow within w_reenvia_glosas
boolean visible = false
integer x = 5435
integer y = 668
integer width = 183
integer height = 96
integer taborder = 50
boolean enabled = false
string dataobject = "dw_factura_electronica_postgres"
end type

type pb_impnota from picturebutton within w_reenvia_glosas
integer x = 5390
integer y = 376
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprime Nota "
end type

type pb_connota from picturebutton within w_reenvia_glosas
integer x = 5390
integer y = 232
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "dian_zip.gif"
string disabledname = "d_dian_zip.gif"
alignment htextalign = left!
string powertiptext = "Envio Contenedor"
end type

event clicked;//////////ELECTRONICA	
double ldb_i,ldb_nfactura,ldb_nnto
string ls_clugar,ls_tfac,ls_tnota
nvo_factura_electronica u_elec
st_ret_dian    lst_lle

u_elec=create nvo_factura_electronica

for ldb_i =1 to tab_1.tp_1.dw_facts.rowcount()
	if tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'estado_dian_nota')='1' then continue
	if tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'file_name_fact_nota')='0' then continue
	
	ldb_nfactura=tab_1.tp_1.dw_facts.getitemnumber(ldb_i ,'nfact')
	ls_clugar=tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'clugar')
	ls_tfac=tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'tipo_fact')
	ls_tnota=tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'tipo_nota')
	ldb_nnto=tab_1.tp_1.dw_facts.getitemnumber(ldb_i ,'nro_nota')	
	
	u_elec.of_enviar_new_correo(ldb_nfactura,ls_clugar,ls_tfac,ldb_nnto,'c',tab_1.tp_1.dw_facts.getitemstring(ldb_i,'file_name_fact_nota'),'F')
	
next
destroy u_elec
messagebox('','Proceso Finalizado')
//////////ELECTRONICA	
end event

type pb_diann from picturebutton within w_reenvia_glosas
integer x = 5390
integer y = 92
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "dian.gif"
string disabledname = "d_dian.gif"
alignment htextalign = left!
string powertiptext = "Envio Nota Dian"
end type

event clicked;//////////ELECTRONICA	
double ldb_i,ldb_nfactura,ldb_nnto
string ls_clugar,ls_tfac,ls_tnota
nvo_factura_electronica u_elec
st_ret_dian    lst_lle
	
u_elec=create nvo_factura_electronica

for ldb_i =1 to tab_1.tp_1.dw_facts.rowcount()
	if g_motor='postgres' then
		dw_electronica.dataobject="dw_factura_electronica_postgres_ncdre.srd"
	else
		//dw_electronica.dataobject="dw_factura_electronica"
	end if
	dw_electronica.settransobject(sqlca)		

	if tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'estado_dian_nota')='1' then continue
	if tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'file_name_fact_nota')='0' then continue
	
	ldb_nfactura=tab_1.tp_1.dw_facts.getitemnumber(ldb_i ,'nfact')
	ls_clugar=tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'clugar')
	ls_tfac=tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'tipo_fact')
	ls_tnota=tab_1.tp_1.dw_facts.getitemstring(ldb_i ,'tipo_nota')
	ldb_nnto=tab_1.tp_1.dw_facts.getitemnumber(ldb_i ,'nro_nota')
	
	lst_lle=u_elec.sign_chilkat(dw_electronica,ldb_nfactura,ls_clugar,ls_tfac,ldb_nnto,'c','FV')
next
destroy u_elec
messagebox('','Proceso Finalizado')
////////ELECTRONICA	

end event

type em_1 from editmask within w_reenvia_glosas
integer x = 731
integer y = 4
integer width = 283
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "2000~~2050"
end type

event constructor;text=string(year(today()))


end event

event modified;dw_histo.retrieve(integer(em_1.text))
dw_histo.setfocus()
end event

type pb_fenvio from picturebutton within w_reenvia_glosas
integer x = 5230
integer y = 232
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "limpiar.gif"
string disabledname = "d_limpiar.gif"
string powertiptext = "Modifica Fecha Reenvio"
end type

event clicked;if f_permiso_boton(this,'REO')=0 then return
if dw_histo.getitemstring(dw_histo.getrow(),'estado')='3' then
	st_amortizar st
	st.dw_cab=dw_histo
	openwithparm(w_cierra_glosas_new,st)
end if
end event

type pb_6 from picturebutton within w_reenvia_glosas
integer x = 5230
integer y = 92
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Reenviar Objeciones y Cerrar"
end type

event clicked;if dw_histo.rowcount()=0 then return
choose case dw_histo.getitemstring(dw_histo.getrow(),'estado')
	case '0' //obj abiertas
		messagebox('Atención','Las objeciones están en proceso de digitación')
		return
	case '1' //en respuestas
		messagebox('Atención','Las objeciones no han sido contestadas completamente')
		return	
	case '3' //reenviada
		messagebox('Atención','Las objeciones ya fueron Enviadas')
		return
	case 'A' //anulada
		messagebox('Atención','Las objeciones están anuladas')
		return
	case '2' //aqui si
		st_amortizar st
		st.dw_cab=dw_histo
		st.dw_cpo=tab_1.tp_1.dw_facts
		openwithparm(w_cierra_glosas,st)
		dw_histo.retrieve(integer(em_1.text))
end choose

end event

type pb_save from picturebutton within w_reenvia_glosas
integer x = 5230
integer y = 376
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "             &g"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;grabar()
end event

type dw_histo from datawindow within w_reenvia_glosas
integer x = 41
integer y = 92
integer width = 5111
integer height = 536
integer taborder = 10
string title = "none"
string dataobject = "dw_obje_cab_todas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_1.tp_1.dw_facts.reset()
tab_1.tp_2.dw_procs.reset()
tab_1.tp_1.dw_resp.reset()
tab_1.tp_2.dw_resp_proc.reset()
tab_1.tp_3.dw_sitem.reset()
tab_1.tp_3.dw_resp_sitem.reset()
idw_facts.reset()
idw_facts2.reset()
if getrow()<1 then return

idw_facts.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'),usuario)
idw_facts2.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'),usuario)
tab_1.tp_3.dw_resp_sitem.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'),usuario)
tab_1.tp_3.dw_sitem.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'),usuario)
tab_1.tp_1.dw_resp.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'),usuario)
tab_1.tp_2.dw_resp_proc.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'),usuario)
tab_1.tp_2.dw_procs.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'),usuario)
tab_1.tp_1.dw_facts.retrieve(getitemstring(getrow(),'coddoc'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'),usuario)
if dw_histo.getitemstring(dw_histo.getrow(),'estado')='3' then
	pb_anul.enabled=true
	pb_fenvio.enabled=true
else
	pb_fenvio.enabled=false
	pb_anul.enabled=false	
end if
if getitemnumber(getrow(),'valor_aceptado')>0 then
	pb_diann.enabled=true
	pb_connota.enabled=true
	pb_impnota.enabled=true
else
	pb_diann.enabled=false
	pb_connota.enabled=false
	pb_impnota.enabled=false
end if
end event

event rowfocuschanging;choose case f_pregunta()
	case 1
		if grabar()=-1 then return 1
	case 2
		i_cambio=false
	case 3
		return 1
end choose
return 0
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event buttonclicked;long ld_j,ld_selec=1
SetRedraw(FALSE)
if dwo.text='Selec.' then
	dwo.text='Desel.'
else
	dwo.text='Selec.'
	ld_selec=0
end if
for ld_j=1 to rowcount()
	if (getitemstring(ld_j,'estado')='3') then continue
	setitem(ld_j,'reen',ld_selec)
next
SetRedraw(TRUE)
end event

type gb_1 from groupbox within w_reenvia_glosas
integer x = 23
integer y = 8
integer width = 5161
integer height = 648
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Objeciones Año:"
end type

type gb_2 from groupbox within w_reenvia_glosas
integer x = 5202
integer y = 12
integer width = 407
integer height = 644
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Herramientas"
end type

type tab_1 from tab within w_reenvia_glosas
integer x = 32
integer y = 668
integer width = 5431
integer height = 1308
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5394
integer height = 1180
long backcolor = 67108864
string text = "Facturas"
long tabtextcolor = 33554432
string picturename = "qr.ico"
long picturemaskcolor = 536870912
string powertiptext = "Facuras de la Objeción por usuario"
mle_resp1 mle_resp1
pb_1 pb_1
pb_add pb_add
pb_cerrar pb_cerrar
st_3 st_3
st_2 st_2
dw_resp dw_resp
dw_facts dw_facts
end type

on tp_1.create
this.mle_resp1=create mle_resp1
this.pb_1=create pb_1
this.pb_add=create pb_add
this.pb_cerrar=create pb_cerrar
this.st_3=create st_3
this.st_2=create st_2
this.dw_resp=create dw_resp
this.dw_facts=create dw_facts
this.Control[]={this.mle_resp1,&
this.pb_1,&
this.pb_add,&
this.pb_cerrar,&
this.st_3,&
this.st_2,&
this.dw_resp,&
this.dw_facts}
end on

on tp_1.destroy
destroy(this.mle_resp1)
destroy(this.pb_1)
destroy(this.pb_add)
destroy(this.pb_cerrar)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_resp)
destroy(this.dw_facts)
end on

type mle_resp1 from multilineedit within tp_1
integer x = 1879
integer y = 588
integer width = 1673
integer height = 564
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
integer limit = 32535
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event modified;if dw_resp.rowcount()=0 then return
if (isnull(dw_resp.getitemstring(dw_resp.getrow(),'respuesta')) and text<>'' ) or (dw_resp.getitemstring(dw_resp.getrow(),'respuesta')<>text) then
	dw_resp.setitem(dw_resp.getrow(),'respuesta',text)
	i_cambio=true
end if
end event

event losefocus;triggerevent (modified!)
end event

type pb_1 from picturebutton within tp_1
boolean visible = false
integer x = 768
integer y = 448
integer width = 64
integer height = 56
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Respuesta"
end type

event clicked;if dw_facts.rowcount()=0 then return
if (dw_facts.getitemstring(dw_facts.getrow(),'estado') <>'C' and dw_facts.getitemstring(dw_facts.getrow(),'estado') <>'R') then 
	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
	return
end if
dw_resp.deleterow(0)
dw_resp.event p_itemchanged(1)
i_cambio=true
end event

type pb_add from picturebutton within tp_1
boolean visible = false
integer x = 635
integer y = 448
integer width = 64
integer height = 56
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Respuesta"
end type

event clicked;if dw_facts.rowcount()=0 then return
if (dw_facts.getitemstring(dw_facts.getrow(),'estado') <>'C' and dw_facts.getitemstring(dw_facts.getrow(),'estado') <>'R') then 
	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
	return
end if
if dw_facts.getitemstring(dw_facts.getrow(),'tipo')='0' then 
	Messagebox('Atención','Esta objeción es parcial y debe ser contestada por procedimientos')
	return
end if
long donde
donde=dw_resp.insertrow(0)
dw_facts.setitem(dw_facts.getrow(),'estado','R')
dw_facts.setitem(dw_facts.getrow(),'fecha_respuesta',datetime(today(),now()))
dw_resp.setitem(donde,'coddoc_glosa_gral',dw_facts.getitemstring(dw_facts.getrow(),'coddoc'))
dw_resp.setitem(donde,'clugar_glosa_gral',dw_facts.getitemstring(dw_facts.getrow(),'clugar'))
dw_resp.setitem(donde,'num_glosa_gral',dw_facts.getitemnumber(dw_facts.getrow(),'num_glosa'))
dw_resp.setitem(donde,'item_glosa_gral',dw_facts.getitemnumber(dw_facts.getrow(),'item'))
dw_resp.setitem(donde,'fecha',datetime(today(),now()))
i_cambio=true
end event

type pb_cerrar from picturebutton within tp_1
boolean visible = false
integer x = 379
integer y = 448
integer width = 64
integer height = 56
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "cerrar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar Respuestas"
end type

event clicked;if dw_facts.rowcount()=0 then return
if dw_facts.find('esco=1',1,dw_facts.rowcount())=0 then return
if grabar()=-1 then return
long j,k,l,m,n
boolean sub
string clug,err
for j=1 to dw_facts.rowcount()
	if dw_facts.getitemnumber(j,'esco')=0 then continue
	dw_facts.setitem(j,'esco',0)
	sub=false
	if dw_facts.getitemstring(j,'tipo')='1' then//total
		dw_resp.setfilter('item_glosa_gral='+string(dw_facts.getitemnumber(j,'item')))
		dw_resp.filter()
		if dw_resp.rowcount()=0 then continue
		for k=1 to dw_resp.rowcount()
			if isnull(dw_resp.getitemstring(k,'cod_respuesta')) then 
				sub=true
				exit
			end if
		next
	else//parcial
		dw_facts.scrolltorow(j)
		for k=1 to tab_1.tp_2.dw_procs.rowcount()
			if tab_1.tp_2.dw_procs.getitemstring(k,'tipo')='1' then//total
				tab_1.tp_2.dw_resp_proc.setfilter('item_glosa_det='+string(tab_1.tp_2.dw_procs.getitemnumber(j,'item'))+' and subitem_glosa_det='+string(tab_1.tp_2.dw_procs.getitemnumber(j,'subitem')))
				tab_1.tp_2.dw_resp_proc.filter()
				if tab_1.tp_2.dw_resp_proc.rowcount()=0 then 
					sub=true
					exit
				end if
				for n=1 to tab_1.tp_2.dw_resp_proc.rowcount()
					if isnull(tab_1.tp_2.dw_resp_proc.getitemstring(n,'cod_respuesta')) then 
						sub=true
						exit
					end if
				next
				if sub then exit
			else
				tab_1.tp_2.dw_procs.scrolltorow(k)
				for l=1 to tab_1.tp_3.dw_sitem.rowcount()
					tab_1.tp_3.dw_resp_sitem.setfilter('item_glosa_sub='+string(tab_1.tp_3.dw_sitem.getitemnumber(l,'item'))+' and subitem_glosa_sub='+string(tab_1.tp_3.dw_sitem.getitemnumber(l,'subitem'))+' and ndeta_glosa_sub='+string(tab_1.tp_3.dw_sitem.getitemnumber(l,'ndeta')))
					tab_1.tp_3.dw_resp_sitem.filter()
					if tab_1.tp_3.dw_resp_sitem.rowcount()=0 then 
						sub=true
						exit
					end if
					for m=1 to tab_1.tp_3.dw_resp_sitem.rowcount()
						if isnull(tab_1.tp_3.dw_resp_sitem.getitemstring(m,'cod_respuesta')) then 
							sub=true
							exit
						end if
					next
					if sub then exit
				next
			end if
			if sub then exit
		next
	end if
	if sub then continue
	dw_facts.setitem(j,'estado','P')
next
if dw_facts.update(true,false)=-1 then goto error
m=dw_histo.getitemnumber(dw_histo.getrow(),'num_glosa')
clug=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
select count(*) into :j from car_glosa_cpo where 
coddoc ='GL' and clugar =:clug and num_glosa =:m and estado not in ('P','E');
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error leyendo car_glosa_cpo',err)
	goto error
end if
if j=0 then
	dw_histo.setitem(dw_histo.getrow(),'estado','2')
	if dw_histo.update()=-1 then return
end if
commit;
dw_facts.resetupdate()
return
error:
dw_histo.event rowfocuschanged(dw_histo.getrow())
end event

type st_3 from statictext within tp_1
integer x = 1879
integer y = 524
integer width = 718
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de la respuesta:"
boolean focusrectangle = false
end type

type st_2 from statictext within tp_1
integer x = 14
integer y = 524
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Respuesta(s):"
boolean focusrectangle = false
end type

type dw_resp from datawindow within tp_1
event type integer p_itemchanged ( long p_fila )
integer x = 14
integer y = 588
integer width = 3264
integer height = 564
integer taborder = 50
string title = "none"
string dataobject = "dw_respu_cpo_todas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer p_itemchanged(long p_fila);accepttext()
if rowcount()>0 then
	if getitemnumber(1,'total')>dw_facts.getitemnumber(dw_facts.getrow(),'valor_objecion') then
		messagebox('Atención','La sumatoria del valor aceptado no puede ser mayor a la Objeción')
		setitem(p_fila,'t_aceptado',0)
		return -1
	end if
	dw_facts.setitem(dw_facts.getrow(),'valor_aceptado',getitemnumber(1,'total'))
else
	//dw_facts.setitem(dw_facts.getrow(),'estado','C')
	dw_facts.setitem(dw_facts.getrow(),'valor_aceptado',0)
end if
return 1
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event constructor;settransobject(sqlca)
getchild('cod_respuesta',idw_resp1)
idw_resp1.settransobject(sqlca)
end event

event itemchanged;if dwo.name='cod_respuesta' then
	setitem(row,'respuesta',idw_resp1.getitemstring(idw_resp1.getrow(),'respuesta'))
	mle_resp1.text=idw_resp1.getitemstring(idw_resp1.getrow(),'respuesta')
elseif dwo.name='t_aceptado' then
	post event p_itemchanged(row)
end if
i_cambio=true
end event

event rowfocuschanged;mle_resp1.text=''
if getrow()<1 then return
mle_resp1.text=getitemstring(getrow(),'respuesta')
idw_resp1.retrieve('%')
end event

type dw_facts from datawindow within tp_1
integer y = 20
integer width = 5362
integer height = 480
integer taborder = 30
string title = "none"
string dataobject = "dw_respu_a_reenviar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event constructor;settransobject(sqlca)

end event

event clicked;if row>0 and row<>getrow() then scrolltorow(row)
end event

event rowfocuschanged;tab_1.tp_2.dw_procs.setfilter('isnull(item)')
dw_resp.setfilter('isnull(item_glosa_gral)')
idw_procs.reset()
if getrow()>0 then
	idw_procs.retrieve(getitemnumber(getrow(),'nfact'),getitemstring(getrow(),'clugar_fact'),getitemstring(getrow(),'tipo_fact'),getitemnumber(getrow(),'num_glosa'))
	
	tab_1.tp_2.dw_procs.setfilter('item='+string(getitemnumber(getrow(),'item')))
	dw_resp.setfilter('item_glosa_gral='+string(getitemnumber(getrow(),'item')))
	long donde
	donde =idw_procs.rowcount()
	donde=idw_facts.find('nfact='+string(getitemnumber(getrow(),'nfact'))+' and clugar_fact="'+getitemstring(getrow(),'clugar_fact')+' and tipo_fact="'+getitemstring(getrow(),'tipo_fact')+'"',1,idw_facts.rowcount())
	idw_facts.scrolltorow(donde)
	idw_facts2.scrolltorow(donde)
	tab_1.tp_2.dw_dfacts.setitem(1,1,getitemnumber(getrow(),'nfact'))
	tab_1.tp_2.dw_dfacts.setitem(1,2,getitemstring(getrow(),'clugar_fact'))
	tab_1.tp_2.dw_dfacts.setitem(1,3,getitemstring(getrow(),'tipo_fact'))
	
	
	tab_1.tp_3.dw_dfacts2.setitem(1,1,getitemnumber(getrow(),'nfact'))
	tab_1.tp_3.dw_dfacts2.setitem(1,2,getitemstring(getrow(),'clugar_fact'))
	tab_1.tp_3.dw_dfacts2.setitem(1,3,getitemstring(getrow(),'tipo_fact'))	
	idw_resp1.retrieve(getitemstring(getrow(),'cod_objecion'))
end if
dw_resp.filter()
tab_1.tp_2.dw_procs.filter()
dw_resp.event rowfocuschanged(dw_resp.getrow())
tab_1.tp_2.dw_procs.event rowfocuschanged(tab_1.tp_2.dw_procs.getrow())
end event

event buttonclicked;if rowcount()=0 then return
long j
if dwo.text='Selec.' then
	dwo.text='Desel.'
	for j=1 to rowcount()
		if getitemstring(j,'estado')='R' then
			setitem(j,'esco',1)
		end if
	next
else
	dwo.text='Selec.'
	for j=1 to rowcount()
		setitem(j,'esco',0)
	next
end if

end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5394
integer height = 1180
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "dev_med.ico"
long picturemaskcolor = 536870912
string powertiptext = "Procedimientos a responder de la factura"
mle_resp2 mle_resp2
pb_3 pb_3
pb_2 pb_2
st_12 st_12
dw_dfacts dw_dfacts
st_6 st_6
dw_resp_proc dw_resp_proc
st_5 st_5
dw_procs dw_procs
st_4 st_4
end type

on tp_2.create
this.mle_resp2=create mle_resp2
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_12=create st_12
this.dw_dfacts=create dw_dfacts
this.st_6=create st_6
this.dw_resp_proc=create dw_resp_proc
this.st_5=create st_5
this.dw_procs=create dw_procs
this.st_4=create st_4
this.Control[]={this.mle_resp2,&
this.pb_3,&
this.pb_2,&
this.st_12,&
this.dw_dfacts,&
this.st_6,&
this.dw_resp_proc,&
this.st_5,&
this.dw_procs,&
this.st_4}
end on

on tp_2.destroy
destroy(this.mle_resp2)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_12)
destroy(this.dw_dfacts)
destroy(this.st_6)
destroy(this.dw_resp_proc)
destroy(this.st_5)
destroy(this.dw_procs)
destroy(this.st_4)
end on

type mle_resp2 from multilineedit within tp_2
integer x = 1847
integer y = 676
integer width = 1678
integer height = 500
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event losefocus;triggerevent (modified!)
end event

event modified;if dw_resp_proc.rowcount()=0 then return
if (isnull(dw_resp_proc.getitemstring(dw_resp_proc.getrow(),'respuesta')) and text<>'' ) or (dw_resp_proc.getitemstring(dw_resp_proc.getrow(),'respuesta')<>text) then
	dw_resp_proc.setitem(dw_resp_proc.getrow(),'respuesta',text)
	i_cambio=true
end if
end event

type pb_3 from picturebutton within tp_2
boolean visible = false
integer x = 2162
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Respuesta"
end type

event clicked;if dw_procs.rowcount()=0 then return
if (dw_procs.getitemstring(dw_procs.getrow(),'estado_respu') <>'C' and dw_procs.getitemstring(dw_procs.getrow(),'estado_respu') <>'R') then 
	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
	return
end if
dw_resp_proc.deleterow(0)
dw_resp_proc.event p_itemchanged(1)
i_cambio=true
end event

type pb_2 from picturebutton within tp_2
boolean visible = false
integer x = 1970
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Respuesta"
end type

event clicked;if dw_procs.rowcount()=0 then return
if (dw_procs.getitemstring(dw_procs.getrow(),'estado_respu') <>'C' and dw_procs.getitemstring(dw_procs.getrow(),'estado_respu') <>'R') then 
	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
	return
end if
if dw_procs.getitemstring(dw_procs.getrow(),'tipo')='0' then 
	Messagebox('Atención','Esta objeción es parcial y debe ser contestada por Items')
	return
end if
long donde
donde=dw_resp_proc.insertrow(0)
tab_1.tp_1.dw_facts.setitem(tab_1.tp_1.dw_facts.getrow(),'estado','R')
tab_1.tp_1.dw_facts.setitem(tab_1.tp_1.dw_facts.getrow(),'fecha_respuesta',datetime(today(),now()))
dw_procs.setitem(dw_procs.getrow(),'estado_respu','R')
dw_resp_proc.setitem(donde,'coddoc_glosa_det',dw_procs.getitemstring(dw_procs.getrow(),'coddoc'))
dw_resp_proc.setitem(donde,'clugar_glosa_det',dw_procs.getitemstring(dw_procs.getrow(),'clugar'))
dw_resp_proc.setitem(donde,'num_glosa_det',dw_procs.getitemnumber(dw_procs.getrow(),'num_glosa'))
dw_resp_proc.setitem(donde,'item_glosa_det',dw_procs.getitemnumber(dw_procs.getrow(),'item'))
dw_resp_proc.setitem(donde,'subitem_glosa_det',dw_procs.getitemnumber(dw_procs.getrow(),'subitem'))
dw_resp_proc.setitem(donde,'fecha',datetime(today(),now()))
i_cambio=true
end event

type st_12 from statictext within tp_2
integer y = 40
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Facturas:"
boolean focusrectangle = false
end type

type dw_dfacts from datawindow within tp_2
integer x = 224
integer y = 28
integer width = 1705
integer height = 88
integer taborder = 40
string title = "none"
string dataobject = "dw_combo_facts_glos"
boolean border = false
boolean livescroll = true
end type

event constructor;//modify('nfact.dddw.name="dw_lista_facts_glosas_x_usu"')
getchild('nfact',idw_facts)
idw_facts.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if tab_1.tp_1.dw_facts.event rowfocuschanging(tab_1.tp_1.dw_facts.getrow(),1)<>0 then 
	settext(string(getitemnumber(1,1)))
	return 2
end if
string clug,tipof
long donde
clug=idw_facts.getitemstring(idw_facts.getrow(),'clugar_fact')
tipof=idw_facts.getitemstring(idw_facts.getrow(),'tipo_fact')
donde=tab_1.tp_1.dw_facts.find('nfact='+data+' and clugar_fact="'+clug+'" and tipo_fact="'+tipof+'"',1,tab_1.tp_1.dw_facts.rowcount())
tab_1.tp_1.dw_facts.scrolltorow(donde)
end event

type st_6 from statictext within tp_2
integer x = 1856
integer y = 620
integer width = 718
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de la respuesta:"
boolean focusrectangle = false
end type

type dw_resp_proc from datawindow within tp_2
event type integer p_itemchanged ( long p_fila )
integer y = 672
integer width = 1810
integer height = 500
integer taborder = 50
string title = "none"
string dataobject = "dw_respuprocs_a_reenviar"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer p_itemchanged(long p_fila);accepttext()
if rowcount()>0 then
	if getitemnumber(1,'total')>dw_procs.getitemnumber(dw_procs.getrow(),'valor_objecion') then
		messagebox('Atención','La sumatoria del valor aceptado no puede ser mayor a la Objeción')
		setitem(p_fila,'t_aceptado',0)
		return -1
	end if
	dw_procs.setitem(dw_procs.getrow(),'valor_aceptado',getitemnumber(1,'total'))
else
	//dw_procs.setitem(dw_procs.getrow(),'estado_respu','C')
	dw_procs.setitem(dw_procs.getrow(),'valor_aceptado',0)
end if
dw_procs.event p_itemchanged()
return 1
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event constructor;settransobject(sqlca)
getchild('cod_respuesta',idw_resp2)
idw_resp2.settransobject(sqlca)

end event

event itemchanged;if dwo.name='cod_respuesta' then
	setitem(row,'respuesta',idw_resp2.getitemstring(idw_resp2.getrow(),'respuesta'))
	mle_resp2.text=idw_resp2.getitemstring(idw_resp2.getrow(),'respuesta')
elseif dwo.name='t_aceptado' then
	post event p_itemchanged(row)
end if
i_cambio=true
end event

event rowfocuschanged;mle_resp2.text=''
if getrow()<1 then return
mle_resp2.text=getitemstring(getrow(),'respuesta')
idw_resp2.retrieve('%')
end event

type st_5 from statictext within tp_2
integer x = 9
integer y = 612
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Respuesta(s):"
boolean focusrectangle = false
end type

type dw_procs from datawindow within tp_2
event p_itemchanged ( )
integer y = 160
integer width = 5353
integer height = 444
integer taborder = 40
string title = "none"
string dataobject = "dw_respucpo_a_reenviar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();if rowcount()=0 then
	
else
	if find('estado_respu="R" or estado_respu="P"',1,rowcount())=0 then
		tab_1.tp_1.dw_facts.setitem(tab_1.tp_1.dw_facts.getrow(),'estado','C')
	end if
	tab_1.tp_1.dw_facts.setitem(tab_1.tp_1.dw_facts.getrow(),'valor_aceptado',getitemnumber(1,'t_aceptado'))
end if
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;dw_resp_proc.setfilter('isnull(item_glosa_det)')
tab_1.tp_3.dw_sitem.setfilter('isnull(subitem)')
if getrow()>0 then
	idw_resp2.retrieve(getitemstring(getrow(),'cod_objecion'))
	dw_resp_proc.setfilter('item_glosa_det='+string(getitemnumber(getrow(),'item'))+' and subitem_glosa_det='+string(getitemnumber(getrow(),'subitem')))
	tab_1.tp_3.dw_sitem.setfilter('item='+string(getitemnumber(getrow(),'item'))+' and subitem='+string(getitemnumber(getrow(),'subitem')))
	long donde
	donde=idw_procs.find('nfact='+string(getitemnumber(getrow(),'nfact'))+' and clugar="'+getitemstring(getrow(),'clugar_fact')+'" and tipo_fact="'+getitemstring(getrow(),'tipo_fact')+'" and nitem='+string(getitemnumber(getrow(),'nitem_fact')),1,idw_facts.rowcount())
	idw_procs.scrolltorow(donde)
	tab_1.tp_3.dw_dprocs.setitem(1,1,getitemnumber(getrow(),'nitem_fact'))
end if
dw_resp_proc.filter()
dw_resp_proc.event rowfocuschanged(dw_resp_proc.getrow())
tab_1.tp_3.dw_sitem.filter()
tab_1.tp_3.dw_sitem.event rowfocuschanged(tab_1.tp_3.dw_sitem.getrow())
end event

event clicked;if row>0 and row<>getrow() then scrolltorow(row)
end event

type st_4 from statictext within tp_2
integer x = 5
integer y = 104
integer width = 969
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objeciones de Procedimientos a responder:"
boolean focusrectangle = false
end type

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5394
integer height = 1180
long backcolor = 67108864
string text = "Items. del proc."
long tabtextcolor = 33554432
string picturename = "bisturi.ico"
long picturemaskcolor = 536870912
string powertiptext = "Subdetalle del Procedimiento"
mle_resp3 mle_resp3
pb_5 pb_5
pb_4 pb_4
dw_dprocs dw_dprocs
st_11 st_11
dw_dfacts2 dw_dfacts2
st_10 st_10
st_9 st_9
dw_resp_sitem dw_resp_sitem
st_8 st_8
dw_sitem dw_sitem
st_7 st_7
end type

on tp_3.create
this.mle_resp3=create mle_resp3
this.pb_5=create pb_5
this.pb_4=create pb_4
this.dw_dprocs=create dw_dprocs
this.st_11=create st_11
this.dw_dfacts2=create dw_dfacts2
this.st_10=create st_10
this.st_9=create st_9
this.dw_resp_sitem=create dw_resp_sitem
this.st_8=create st_8
this.dw_sitem=create dw_sitem
this.st_7=create st_7
this.Control[]={this.mle_resp3,&
this.pb_5,&
this.pb_4,&
this.dw_dprocs,&
this.st_11,&
this.dw_dfacts2,&
this.st_10,&
this.st_9,&
this.dw_resp_sitem,&
this.st_8,&
this.dw_sitem,&
this.st_7}
end on

on tp_3.destroy
destroy(this.mle_resp3)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.dw_dprocs)
destroy(this.st_11)
destroy(this.dw_dfacts2)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.dw_resp_sitem)
destroy(this.st_8)
destroy(this.dw_sitem)
destroy(this.st_7)
end on

type mle_resp3 from multilineedit within tp_3
integer x = 1851
integer y = 704
integer width = 1682
integer height = 448
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event modified;if dw_resp_sitem.rowcount()=0 then return
if (isnull(dw_resp_sitem.getitemstring(dw_resp_sitem.getrow(),'respuesta')) and text<>'' ) or (dw_resp_sitem.getitemstring(dw_resp_sitem.getrow(),'respuesta')<>text) then
	dw_resp_sitem.setitem(dw_resp_sitem.getrow(),'respuesta',text)
	i_cambio=true
end if
end event

event losefocus;triggerevent (modified!)
end event

type pb_5 from picturebutton within tp_3
boolean visible = false
integer x = 2126
integer y = 52
integer width = 119
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Respuesta"
end type

event clicked;if dw_sitem.rowcount()=0 then return
if (dw_sitem.getitemstring(dw_sitem.getrow(),'estado') <>'C' and dw_sitem.getitemstring(dw_sitem.getrow(),'estado') <>'R') then 
	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
	return
end if
dw_resp_sitem.deleterow(0)
dw_resp_sitem.event p_itemchanged(1)
i_cambio=true

end event

type pb_4 from picturebutton within tp_3
boolean visible = false
integer x = 1970
integer y = 52
integer width = 119
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Respuesta"
end type

event clicked;if dw_sitem.rowcount()=0 then return
if (dw_sitem.getitemstring(dw_sitem.getrow(),'estado_respu') <>'C' and dw_sitem.getitemstring(dw_sitem.getrow(),'estado_respu') <>'R') then 
	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
	return
end if
long donde
donde=dw_resp_sitem.insertrow(0)
tab_1.tp_1.dw_facts.setitem(tab_1.tp_1.dw_facts.getrow(),'estado','R')
tab_1.tp_1.dw_facts.setitem(tab_1.tp_1.dw_facts.getrow(),'fecha_respuesta',datetime(today(),now()))
tab_1.tp_2.dw_procs.setitem(tab_1.tp_2.dw_procs.getrow(),'estado_respu','R')
//tab_1.tp_2.dw_procs.setitem(tab_1.tp_2.dw_procs.getrow(),'fecha_respuesta',datetime(today(),now()))

dw_sitem.setitem(dw_sitem.getrow(),'estado_respu','R')
dw_resp_sitem.setitem(donde,'coddoc_glosa_sub',dw_sitem.getitemstring(dw_sitem.getrow(),'coddoc'))
dw_resp_sitem.setitem(donde,'clugar_glosa_sub',dw_sitem.getitemstring(dw_sitem.getrow(),'clugar'))
dw_resp_sitem.setitem(donde,'num_glosa_sub',dw_sitem.getitemnumber(dw_sitem.getrow(),'num_glosa'))
dw_resp_sitem.setitem(donde,'item_glosa_sub',dw_sitem.getitemnumber(dw_sitem.getrow(),'item'))
dw_resp_sitem.setitem(donde,'subitem_glosa_sub',dw_sitem.getitemnumber(dw_sitem.getrow(),'subitem'))
dw_resp_sitem.setitem(donde,'ndeta_glosa_sub',dw_sitem.getitemnumber(dw_sitem.getrow(),'ndeta'))
dw_resp_sitem.setitem(donde,'fecha',datetime(today(),now()))
i_cambio=true
end event

type dw_dprocs from datawindow within tp_3
integer x = 2304
integer y = 12
integer width = 1253
integer height = 88
integer taborder = 40
string title = "none"
string dataobject = "dw_combo_procs"
boolean border = false
boolean livescroll = true
end type

event constructor;modify('nitem_fact.dddw.name="dw_lista_procs_x_glosas"')
getchild('nitem_fact',idw_procs)
idw_procs.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string clug,ctip
long donde,nfact
clug=idw_procs.getitemstring(idw_procs.getrow(),'clugar')
nfact=idw_procs.getitemNumber(idw_procs.getrow(),'nfact')
clug=idw_procs.getitemstring(idw_procs.getrow(),'tipo')
donde=tab_1.tp_2.dw_procs.find('nfact='+string(nfact)+' and clugar_fact="'+clug+'" and nitem_fact='+data,1,tab_1.tp_2.dw_procs.rowcount())
tab_1.tp_2.dw_procs.scrolltorow(donde)
end event

type st_11 from statictext within tp_3
integer x = 1952
integer y = 28
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos:"
boolean focusrectangle = false
end type

type dw_dfacts2 from datawindow within tp_3
integer x = 251
integer y = 12
integer width = 1691
integer height = 84
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_facts_glos"
boolean border = false
boolean livescroll = true
end type

event constructor;//modify('nfact.dddw.name="dw_lista_facts_glosas_x_usu"')
getchild('nfact',idw_facts2)
idw_facts2.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if tab_1.tp_1.dw_facts.event rowfocuschanging(tab_1.tp_1.dw_facts.getrow(),1)<>0 then 
	settext(string(getitemnumber(1,1)))
	return 2
end if
string clug,tipof
long donde
clug=idw_facts2.getitemstring(idw_facts2.getrow(),'clugar_fact')
tipof=idw_facts2.getitemstring(idw_facts2.getrow(),'tipo_fact')
donde=tab_1.tp_1.dw_facts.find('nfact='+data+' and clugar_fact="'+clug+'" and tipo_fact="'+tipof+'"',1,tab_1.tp_1.dw_facts.rowcount())
tab_1.tp_1.dw_facts.scrolltorow(donde)
end event

type st_10 from statictext within tp_3
integer x = 32
integer y = 20
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Facturas:"
boolean focusrectangle = false
end type

type st_9 from statictext within tp_3
integer x = 1851
integer y = 652
integer width = 718
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Observaciones de la respuesta:"
boolean focusrectangle = false
end type

type dw_resp_sitem from datawindow within tp_3
event type integer p_itemchanged ( long p_fila )
integer x = 14
integer y = 704
integer width = 1783
integer height = 452
integer taborder = 50
string title = "none"
string dataobject = "dw_respuglos_sitem_a_reenv"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer p_itemchanged(long p_fila);accepttext()
if rowcount()>0 then
	if getitemnumber(1,'total')>dw_sitem.getitemnumber(dw_sitem.getrow(),'valor_objecion') then
		messagebox('Atención','La sumatoria del valor aceptado no puede ser mayor a la Objeción')
		setitem(p_fila,'t_aceptado',0)
		REturn -1
	end if
	dw_sitem.setitem(dw_sitem.getrow(),'valor_aceptado',getitemnumber(1,'total'))
else
	//dw_sitem.setitem(dw_sitem.getrow(),'estado','C')
	dw_sitem.setitem(dw_sitem.getrow(),'valor_aceptado',0)
end if
dw_sitem.event p_itemchanged()
return 1
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event constructor;settransobject(sqlca)
getchild('cod_respuesta',idw_resp3)
idw_resp3.settransobject(sqlca)
end event

event itemchanged;if dwo.name='cod_respuesta' then
	setitem(row,'respuesta',idw_resp3.getitemstring(idw_resp3.getrow(),'respuesta'))
	mle_resp3.text=idw_resp3.getitemstring(idw_resp3.getrow(),'respuesta')
elseif dwo.name='t_aceptado' then
	post event p_itemchanged(row)
end if
i_cambio=true
end event

event rowfocuschanged;mle_resp3.text=''
if getrow()<1 then return
mle_resp3.text=getitemstring(getrow(),'respuesta')
end event

type st_8 from statictext within tp_3
integer x = 27
integer y = 652
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Respuesta(s):"
boolean focusrectangle = false
end type

type dw_sitem from datawindow within tp_3
event p_itemchanged ( )
integer x = 5
integer y = 172
integer width = 5353
integer height = 472
integer taborder = 40
string title = "none"
string dataobject = "dw_glos_sitem_a_reenv"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();if rowcount()=0 then
	
else
	if find('estado_respu="R" or estado_respu="P"',1,rowcount())=0 then
		tab_1.tp_2.dw_procs.setitem(tab_1.tp_2.dw_procs.getrow(),'estado_respu','C')
	end if
	tab_1.tp_2.dw_procs.setitem(tab_1.tp_2.dw_procs.getrow(),'valor_aceptado',getitemnumber(1,'t_aceptado'))
	tab_1.tp_2.dw_procs.event p_itemchanged()
end if
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event rowfocuschanged;dw_resp_sitem.setfilter('isnull(subitem_glosa_sub)')
if getrow()>0 then
	idw_resp3.retrieve(getitemstring(getrow(),'cod_objecion'))
	dw_resp_sitem.setfilter('item_glosa_sub='+string(getitemnumber(getrow(),'item'))+' and subitem_glosa_sub='+string(getitemnumber(getrow(),'subitem'))+' and ndeta_glosa_sub='+string(getitemnumber(getrow(),'ndeta')))
end if
dw_resp_sitem.filter()
dw_resp_sitem.event rowfocuschanged(dw_resp_sitem.getrow())
end event

event constructor;settransobject(sqlca)
end event

event clicked;if row>0 and row<>getrow() then scrolltorow(row)
end event

type st_7 from statictext within tp_3
integer x = 9
integer y = 108
integer width = 1179
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objeciones de items de Procedimientos  a responder:"
boolean focusrectangle = false
end type

