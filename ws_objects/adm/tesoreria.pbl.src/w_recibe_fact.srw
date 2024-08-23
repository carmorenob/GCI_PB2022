$PBExportHeader$w_recibe_fact.srw
forward
global type w_recibe_fact from window
end type
type st_9 from statictext within w_recibe_fact
end type
type dw_orig from datawindow within w_recibe_fact
end type
type dw_lug from datawindow within w_recibe_fact
end type
type pb_search from picturebutton within w_recibe_fact
end type
type dw_rela from datawindow within w_recibe_fact
end type
type tab_2 from tab within w_recibe_fact
end type
type t2_1 from userobject within tab_2
end type
type tab_1 from tab within t2_1
end type
type tabconp from userobject within tab_1
end type
type dw_concep_cont from datawindow within tabconp
end type
type tabconp from userobject within tab_1
dw_concep_cont dw_concep_cont
end type
type tab_1 from tab within t2_1
tabconp tabconp
end type
type tab_fp from tab within t2_1
end type
type tabfp from userobject within tab_fp
end type
type dw_fpag from datawindow within tabfp
end type
type tabfp from userobject within tab_fp
dw_fpag dw_fpag
end type
type tabcau from userobject within tab_fp
end type
type dw_causa from datawindow within tabcau
end type
type tabcau from userobject within tab_fp
dw_causa dw_causa
end type
type tab_fp from tab within t2_1
tabfp tabfp
tabcau tabcau
end type
type pb_new_d_cont from picturebutton within t2_1
end type
type pb_del_imp_cont from picturebutton within t2_1
end type
type pb_new_impu from picturebutton within t2_1
end type
type pb_new_concep_cont from picturebutton within t2_1
end type
type pb_del_concep_cont from picturebutton within t2_1
end type
type dw_resu from datawindow within t2_1
end type
type dw_cont from datawindow within t2_1
end type
type pb_find_c from picturebutton within t2_1
end type
type dw_terce_c from datawindow within t2_1
end type
type dw_timpucontra from datawindow within t2_1
end type
type st_6 from statictext within t2_1
end type
type pb_save_tax from picturebutton within t2_1
end type
type pb_traeiva from picturebutton within t2_1
end type
type dw_ppto from datawindow within t2_1
end type
type pb_ppto from picturebutton within t2_1
end type
type t2_1 from userobject within tab_2
tab_1 tab_1
tab_fp tab_fp
pb_new_d_cont pb_new_d_cont
pb_del_imp_cont pb_del_imp_cont
pb_new_impu pb_new_impu
pb_new_concep_cont pb_new_concep_cont
pb_del_concep_cont pb_del_concep_cont
dw_resu dw_resu
dw_cont dw_cont
pb_find_c pb_find_c
dw_terce_c dw_terce_c
dw_timpucontra dw_timpucontra
st_6 st_6
pb_save_tax pb_save_tax
pb_traeiva pb_traeiva
dw_ppto dw_ppto
pb_ppto pb_ppto
end type
type t2_2 from userobject within tab_2
end type
type pb_anular from picturebutton within t2_2
end type
type pb_new from picturebutton within t2_2
end type
type pb_find from picturebutton within t2_2
end type
type dw_terce from datawindow within t2_2
end type
type dw_hist from datawindow within t2_2
end type
type pb_print from pb_report within t2_2
end type
type t2_2 from userobject within tab_2
pb_anular pb_anular
pb_new pb_new
pb_find pb_find
dw_terce dw_terce
dw_hist dw_hist
pb_print pb_print
end type
type t2_3 from userobject within tab_2
end type
type t_ret from tab within t2_3
end type
type t_o from userobject within t_ret
end type
type dw_rte from datawindow within t_o
end type
type t_o from userobject within t_ret
dw_rte dw_rte
end type
type t_c from userobject within t_ret
end type
type dw_rtem from datawindow within t_c
end type
type t_c from userobject within t_ret
dw_rtem dw_rtem
end type
type t_ret from tab within t2_3
t_o t_o
t_c t_c
end type
type t5 from tab within t2_3
end type
type t5_1 from userobject within t5
end type
type pb_del_concep from picturebutton within t5_1
end type
type pb_new_concep from picturebutton within t5_1
end type
type dw_cpo from datawindow within t5_1
end type
type t5_1 from userobject within t5
pb_del_concep pb_del_concep
pb_new_concep pb_new_concep
dw_cpo dw_cpo
end type
type t5_2 from userobject within t5
end type
type st_7 from statictext within t5_2
end type
type pb_del_anti from picturebutton within t5_2
end type
type pb_new_anti from picturebutton within t5_2
end type
type dw_anti from datawindow within t5_2
end type
type t5_2 from userobject within t5
st_7 st_7
pb_del_anti pb_del_anti
pb_new_anti pb_new_anti
dw_anti dw_anti
end type
type t5_3 from userobject within t5
end type
type st_3 from statictext within t5_3
end type
type dw_tz from datawindow within t5_3
end type
type pb_del_tz from picturebutton within t5_3
end type
type pb_new_tz from picturebutton within t5_3
end type
type t5_3 from userobject within t5
st_3 st_3
dw_tz dw_tz
pb_del_tz pb_del_tz
pb_new_tz pb_new_tz
end type
type t5_4 from userobject within t5
end type
type tab_legal from tab within t5_4
end type
type tab_pro from userobject within tab_legal
end type
type dw_legal_cpo from datawindow within tab_pro
end type
type tab_pro from userobject within tab_legal
dw_legal_cpo dw_legal_cpo
end type
type tab_devo from userobject within tab_legal
end type
type dw_devo from datawindow within tab_devo
end type
type tab_devo from userobject within tab_legal
dw_devo dw_devo
end type
type tab_legal from tab within t5_4
tab_pro tab_pro
tab_devo tab_devo
end type
type pb_devo from picturebutton within t5_4
end type
type pb_save_legal from picturebutton within t5_4
end type
type pb_2 from picturebutton within t5_4
end type
type dw_legal_cab from datawindow within t5_4
end type
type pb_save_lega from picturebutton within t5_4
end type
type pb_new_lega from picturebutton within t5_4
end type
type t5_4 from userobject within t5
tab_legal tab_legal
pb_devo pb_devo
pb_save_legal pb_save_legal
pb_2 pb_2
dw_legal_cab dw_legal_cab
pb_save_lega pb_save_lega
pb_new_lega pb_new_lega
end type
type tabpage_1 from userobject within t5
end type
type pb_3 from picturebutton within tabpage_1
end type
type pb_1 from picturebutton within tabpage_1
end type
type dw_entradas from datawindow within tabpage_1
end type
type tabpage_1 from userobject within t5
pb_3 pb_3
pb_1 pb_1
dw_entradas dw_entradas
end type
type t5 from tab within t2_3
t5_1 t5_1
t5_2 t5_2
t5_3 t5_3
t5_4 t5_4
tabpage_1 tabpage_1
end type
type pb_save_def from picturebutton within t2_3
end type
type pb_save from picturebutton within t2_3
end type
type st_4 from statictext within t2_3
end type
type tab_4 from tab within t2_3
end type
type t4_1 from userobject within tab_4
end type
type dw_cab from datawindow within t4_1
end type
type t4_1 from userobject within tab_4
dw_cab dw_cab
end type
type t4_2 from userobject within tab_4
end type
type dw_tot from datawindow within t4_2
end type
type t4_2 from userobject within tab_4
dw_tot dw_tot
end type
type tab_4 from tab within t2_3
t4_1 t4_1
t4_2 t4_2
end type
type cbx_1 from checkbox within t2_3
end type
type pb_new_tax from picturebutton within t2_3
end type
type pb_del_tax from picturebutton within t2_3
end type
type pb_ajusta from picturebutton within t2_3
end type
type t2_3 from userobject within tab_2
t_ret t_ret
t5 t5
pb_save_def pb_save_def
pb_save pb_save
st_4 st_4
tab_4 tab_4
cbx_1 cbx_1
pb_new_tax pb_new_tax
pb_del_tax pb_del_tax
pb_ajusta pb_ajusta
end type
type t2_4 from userobject within tab_2
end type
type st_10 from statictext within t2_4
end type
type dw_ord_pag from datawindow within t2_4
end type
type t2_4 from userobject within tab_2
st_10 st_10
dw_ord_pag dw_ord_pag
end type
type tab_2 from tab within w_recibe_fact
t2_1 t2_1
t2_2 t2_2
t2_3 t2_3
t2_4 t2_4
end type
type dw_tiva from datawindow within w_recibe_fact
end type
end forward

global type w_recibe_fact from window
string tag = "Insertó una nueva Radicación o modificó alguna existente, desea guardar los cambios?."
integer width = 6190
integer height = 2528
boolean titlebar = true
string title = "Recepción de Facturas"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_ocompra.ico"
st_9 st_9
dw_orig dw_orig
dw_lug dw_lug
pb_search pb_search
dw_rela dw_rela
tab_2 tab_2
dw_tiva dw_tiva
end type
global w_recibe_fact w_recibe_fact

type variables
long idb_ncont,idb_ano,idb_otrosi,idb_nrad,idb_cuantos
string is_clug_rad,is_emp,is_flujo,is_orig
datawindowchild idw_impu1,idw_cta1,idw_iva2,idw_cta2,idw_concep,idw_concep_cont,idw_desti,idw_concep_legal,idw_orig,idw_lugar,idw_concep_legal_1
boolean ibn_cambio,ibn_nueva
constant string is_cdoc='RFC'
int ii_dec_gral,ii_aprox_gral,ii_legal=0,ii_item_dev=0
dec in_valor_b=0
//datastore dw_causa
end variables

forward prototypes
public function integer cambia_ter (string p_tdoc, string p_docu)
public function integer f_save_tax ()
public function integer f_pregunta ()
public function integer grabar (string p_defini)
public function integer lf_devol ()
public subroutine f_nueva_manu ()
end prototypes

public function integer cambia_ter (string p_tdoc, string p_docu);return 1
end function

public function integer f_save_tax ();// graba los impuestos de los contratos
if tab_2.t2_1.tab_1.tabconp.dw_concep_cont.accepttext()=-1 then return -1
if tab_2.t2_1.dw_timpucontra.accepttext()=-1 then return -1
// Se pone en comentario porque solo permitiría recepción de factura de la totalidad del contrato y no por forma de pago
//if tab_2.t2_1.tab_3.t3_2.dw_concep_cont.rowcount()>0 then
//	if tab_2.t2_1.tab_3.t3_2.dw_concep_cont.getitemnumber(1,'t_bruto')<>tab_2.t2_1.tab_3.t3_2.dw_resu.getitemnumber(1,'tbruto') then
//		messagebox("Atención",'El Monto Bruto de los Conceptos del Contrato no es igual al Total Bruto del Contrato')
//		return -1
//	end if
//end if
tab_2.t2_1.dw_timpucontra.setredraw(false)
tab_2.t2_1.dw_timpucontra.setfilter('')
tab_2.t2_1.dw_timpucontra.filter()
long j
for j=1 to tab_2.t2_1.dw_timpucontra.rowcount()
	if isnull(tab_2.t2_1.dw_timpucontra.getitemstring(j,'cod_concep')) then
		messagebox('Atención','Debe escoger todos los impuestos')
		tab_2.t2_1.dw_timpucontra.scrolltorow(j)
		tab_2.t2_1.dw_timpucontra.setcolumn('cod_concep')
		tab_2.t2_1.dw_timpucontra.setfocus()
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.triggerevent(rowfocuschanged!)
		tab_2.t2_1.dw_timpucontra.setredraw(true)
		return -1
	end if
	if isnull(tab_2.t2_1.dw_timpucontra.getitemstring(j,'cod_total')) then
		messagebox('Atención','Debe escoger todos las cuentas contables de los impuestos')
		tab_2.t2_1.dw_timpucontra.scrolltorow(j)
		tab_2.t2_1.dw_timpucontra.setcolumn('cod_total')
		tab_2.t2_1.dw_timpucontra.setfocus()
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.triggerevent(rowfocuschanged!)
		tab_2.t2_1.dw_timpucontra.setredraw(true)
		return -1
	end if
next
tab_2.t2_1.tab_1.tabconp.dw_concep_cont.triggerevent(rowfocuschanged!)
tab_2.t2_1.dw_timpucontra.setredraw(true)
//if tab_2.t2_1.dw_concep_cont.update(true,false)=- 1 then return -1
//return tab_2.t2_1.dw_timpucontra.update(true,false)
return 1
end function

public function integer f_pregunta ();if not ibn_cambio then return 2
return messagebox("Atención, realizó cambios",tag,question!,yesnocancel!,3)
end function

public function integer grabar (string p_defini);if not ibn_cambio and not ibn_nueva then return 1
long ndoc,j,cuantos,ning, nomina,l_doc_equi
datawindow dw_t
string cemp,concep,cdoc_ing,clug_ing,cdoc_caja,err
dec val, valor

if tab_2.t2_3.tab_4.t4_1.dw_cab.accepttext()=-1 then return -1
if tab_2.t2_3.t_ret.t_o.dw_rte.accepttext()=-1 then return -1
if tab_2.t2_3.tab_4.t4_2.dw_tot.accepttext()=-1 then return -1
if  tab_2.t2_1.tab_fp.tabfp.dw_fpag.accepttext()=-1 then return -1
//if tab_1.t1_1.tab_4.t4_2.dw_timpucontra.accepttext() esta está en la funcion save_tax
boolean lbn_nueva
lbn_nueva=ibn_nueva

if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemnumber(1,'tneto')<=0 then 
	rollback;
	messagebox("Atención",'Revise el monto de la radicación, no puede ser menor o igual a cero')
	return -1
end if
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='0' then
	if isnull(tab_2.t2_3.tab_4.t4_1.dw_cab.getitemnumber(1,'num_fact')) or tab_2.t2_3.tab_4.t4_1.dw_cab.getitemnumber(1,'num_fact')=0 then
		rollback;
		messagebox("Atención",'No digitó el número de la factura')
		return -1
	end if
	if isnull(tab_2.t2_3.tab_4.t4_1.dw_cab.getitemdatetime(1,'fecha_fact')) then
		rollback;
		messagebox("Atención",'No digitó la fecha de la factura de la factura')
		return -1
	end if
	if isnull(tab_2.t2_3.tab_4.t4_1.dw_cab.getitemdatetime(1,'fecha_vence')) then
		rollback;
		messagebox("Atención",'No digitó la fecha de vencimiento de la factura')
		return -1
	end if
end if

if ibn_nueva then
	ndoc = f_trae_ndoc(is_cdoc,is_clug_rad,'Recepción de Facturas y/o Cuentas de Cobro')
	if ndoc = -1 then
		rollback;
		return -1
	end if
	tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'nrelacion',ndoc)
	tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'usuario',usuario)
	dw_t = tab_2.t2_3.tab_4.t4_2.dw_tot
	
	for j = 1 to dw_t.rowcount()
		dw_t.setitem(j,'nrelacion',ndoc)
	next
	if is_orig='SCT' or is_orig='NC' then //contratos
		dw_t =tab_2.t2_1.tab_fp.tabfp.dw_fpag
		for j = 1 to dw_t.rowcount()
			if dw_t.getitemstring(j,'esco')='1' and  isnull( dw_t.getitemstring(j,'coddoc_relfact'))  then 
				dw_t.setitem(j,'clugar_relfact',is_clug_rad)
				dw_t.setitem(j,'coddoc_relfact',is_cdoc)
				dw_t.setitem(j,'nrelacion_relfact',ndoc)
			end if
		next
		tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'ano',idb_ano)
		tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'ncontrato',idb_ncont)
		tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'otrosi',idb_otrosi)
		dw_t = tab_2.t2_1.dw_cont
		dw_t.setitem(dw_t.getrow(),'acum_cobro',dw_t.getitemnumber(dw_t.getrow(),'cobro_ori')+tab_2.t2_3.tab_4.t4_1.dw_cab.getitemnumber(1,'tbruto'))
	end if
	long nres,item_orig,item_cpo
	string clug_res,cdoc_res,cdoc,cflujo,messag="Error actualizando 'en_destino' de Pre_Docu_Cb",tdoc,docum
	if is_orig = 'RFC' then
		dw_t = dw_rela
		cflujo = tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'cod_flujo')
		select max(item) into :item_orig from mod_relacion_origen 
		where codigo=:cflujo;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error leyendo mod_relacion_origen",err)
			return -1
		end if
		if isnull(item_orig) then item_orig=0
		for j=1 to dw_t.rowcount()
			item_orig ++
			dw_t.setitem(j,'codigo',cflujo)
			dw_t.setitem(j,'item',item_orig)
			dw_t.setitem(j,'num_doc1',ndoc)
			dw_t.setitem(j,'char_doc1',is_clug_rad)
			dw_t.setitem(j,'char_doc2',is_cdoc)
		next
	end if
	if is_orig='PR' or is_orig='PDI' or is_orig='NM' then//reser or dispon
		dw_t = dw_rela
		cflujo = tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'cod_flujo')
		select max(item) into :item_orig from mod_relacion_origen 
		where codigo=:cflujo;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error leyendo mod_relacion_origen",err)
			return -1
		end if
		if isnull(item_orig) then item_orig=0
		for j=1 to dw_t.rowcount()
			item_orig ++
			dw_t.setitem(j,'codigo',cflujo)
			dw_t.setitem(j,'item',item_orig)
			dw_t.setitem(j,'num_doc1',ndoc)
		next
		dw_t = tab_2.t2_3.t_ret.t_o.dw_rte
		dw_t.setfilter('')
		dw_t.filter()
		for j=1 to dw_t.rowcount()
			dw_t.setitem(j,'nrelacion',ndoc)
		next
	end if

	if is_orig='SCT' then
		dw_t = dw_rela
		cflujo = tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'cod_flujo')
		select max(item) into :item_orig from mod_relacion_origen 
		where codigo=:cflujo;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error leyendo mod_relacion_origen",err)
			return -1
		end if
		if isnull(item_orig) then item_orig=0
		for j=1 to dw_t.rowcount()
			item_orig ++
			dw_t.setitem(j,'codigo', cflujo)
			dw_t.setitem(j,'item', item_orig)	
			dw_t.setitem(j,'num_doc1',ndoc)
			dw_t.setitem(j,'char_doc1',is_clug_rad)
			dw_t.setitem(j,'char_doc2',is_cdoc)			
		next
		dw_t = tab_2.t2_3.t_ret.t_o.dw_rte
		dw_t.setfilter('')
		dw_t.filter()
		for j = 1 to dw_t.rowcount()
			dw_t.setitem(j,'num_doc1',ndoc)
		next
	end if
	
	dw_t = tab_2.t2_3.t5.t5_1.dw_cpo
	for j=1 to dw_t.rowcount()
		dw_t.setitem(j,'nrelacion',ndoc)
	next
	dw_t=tab_2.t2_3.t_ret.t_o.dw_rte
	dw_t.setfilter('')
	dw_t.filter()
	for j=1 to dw_t.rowcount()
		dw_t.setitem(j,'nrelacion',ndoc)
	next
else
	ndoc=tab_2.t2_3.tab_4.t4_1.dw_cab.getitemnumber(1,'nrelacion')
end if//fin nueva

//Numero equivalente para llevar el consecutivo 
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'doc_eqv')='1' then
	select max(con_doc_eqv) into :l_doc_equi from tesorelfact;
	if isnull(l_doc_equi) then l_doc_equi=0
	l_doc_equi=l_doc_equi+1
	tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(tab_2.t2_3.tab_4.t4_1.dw_cab.getrow(),'con_doc_eqv',l_doc_equi)
else
	setnull(l_doc_equi)
	tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(tab_2.t2_3.tab_4.t4_1.dw_cab.getrow(),'doc_eqv','0')	
	tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(tab_2.t2_3.tab_4.t4_1.dw_cab.getrow(),'con_doc_eqv',l_doc_equi)	
end if

if p_defini='1' then
	if tab_2.t2_3.t5.t5_1.dw_cpo.find('tneto<0',1,tab_2.t2_3.t5.t5_1.dw_cpo.rowcount())>0 then
		rollback;
		messagebox("Atención",'Hay conceptos con neto a pagar negativos, reviselos para continuar')
		return -1
	end if 
	if isnull(tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'cod_flujo')) then
		rollback;
		messagebox("Atención",'Debe escoger el destino de la recepción, no pueden estar en nulo')
		return -1
	end if
	if tab_2.t2_3.t5.t5_1.dw_cpo.find('isnull(cod_rel)',1,tab_2.t2_3.t5.t5_1.dw_cpo.rowcount())>0 then
		rollback;
		messagebox("Atención",'Debe escoger los conceptos del pago, no pueden estar en nulo')
		return -1
	end if
	if tab_2.t2_3.t5.t5_1.dw_cpo.find('isnull(val_bruto) or val_bruto=0',1,tab_2.t2_3.t5.t5_1.dw_cpo.rowcount())>0 then
		rollback;
		messagebox("Atención",'Debe digitar los valores de los conceptos del pago, no pueden estar en cero')
		return -1
	end if
	tab_2.t2_3.t_ret.t_o.dw_rte.setfilter('')
	tab_2.t2_3.t_ret.t_o.dw_rte.filter()
	if tab_2.t2_3.t_ret.t_o.dw_rte.find('isnull(cod_concep)',1,tab_2.t2_3.t_ret.t_o.dw_rte.rowcount())>0 then
		rollback;
		messagebox("Atención",'Debe escoger los impuestos a causar, no pueden estar en nulo')
		tab_2.t2_3.t5.t5_1.dw_cpo.event rowfocuschanged(tab_2.t2_3.t5.t5_1.dw_cpo.getrow())
		return -1
	end if
	if tab_2.t2_3.t_ret.t_o.dw_rte.find('tercero="1" and isnull(documento)',1,tab_2.t2_3.t_ret.t_o.dw_rte.rowcount())>0 then
		rollback;
		messagebox("Atención",'Debe escoger el tercero de los impuestos a causar, no pueden estar en nulo')
		tab_2.t2_3.t5.t5_1.dw_cpo.event rowfocuschanged(tab_2.t2_3.t5.t5_1.dw_cpo.getrow())
		return -1
	end if
	for j=1 to tab_2.t2_3.t_ret.t_o.dw_rte.rowcount()
		if tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'cod_total')='' or isnull(tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'cod_total')) then
			cemp=tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'cod_empre')
			concep=tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'cod_concep')
			SELECT count(*) into :cuantos
			FROM cont_plan  
			WHERE ( cont_plan.cod_empresa = :is_emp ) AND  
					( cont_plan.rfuente = :concep ) AND  
					( cont_plan.rfuente is not null )    ;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error leyendo cont_plan',err)
				tab_2.t2_3.t5.t5_1.dw_cpo.event rowfocuschanged(tab_2.t2_3.t5.t5_1.dw_cpo.getrow())
				return -1
			end if
			if cuantos>0 then
				rollback;
				messagebox("Atención",'Debe escoger las cuentas contables de los impuestos a causar, no pueden estar en nulo')
				tab_2.t2_3.t5.t5_1.dw_cpo.event rowfocuschanged(tab_2.t2_3.t5.t5_1.dw_cpo.getrow())
				return -1
			end if
		end if
		if tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'sobre')='P' then //relacion con pagos directos
			ning=tab_2.t2_3.t_ret.t_o.dw_rte.getitemnumber(j,'ningreso')
			cdoc_ing=tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'coddoc_ing')
			clug_ing=tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'clugar_ing')
			cdoc_caja=tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'codcaja')
			val=tab_2.t2_3.t_ret.t_o.dw_rte.getitemnumber(j,'tvalor')
			update tesocajaingreso set valor_recepcion = valor_recepcion + :val where 
			codcaja=:cdoc_caja and clugar=:clug_ing and coddoc=:cdoc_ing and ningreso =:ning and valor - valor_recepcion>=:val;
			if sqlca.sqlcode=-1 then 
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando tesocajaingreso',err)
				return -1
			end if
			if sqlca.sqlnrows=0 then
				rollback;
				messagebox('Atención','Un pago directo asociado a la recepción ya no tiene saldo para continuar')
				return -1
			end if
		end if
	next
	tab_2.t2_3.t5.t5_1.dw_cpo.event rowfocuschanged(tab_2.t2_3.t5.t5_1.dw_cpo.getrow())
	
	double ld_final,i_vigencia
	
	dw_t = dw_rela
	for j=1 to dw_t.rowcount()
		//interface
		nres=dw_t.getitemnumber(j,'num_orig1')
		clug_res=dw_t.getitemstring(j,'char_orig2')
		cdoc_res=dw_t.getitemstring(j,'char_orig1')
		item_cpo=dw_t.getitemnumber(j,'num_orig2')
		
		//Inicio Consecutivo de obligaciones
		if j=1 then
			SELECT cod_vigencia into :i_vigencia
			FROM pre_docu_cb
			WHERE (((coddoc)=:cdoc_res) AND ((clugar)=:clug_res) AND ((numdoc)=:nres));

			ld_final = f_consec(i_vigencia,'OBL',cLugar)
			if ld_final = -1 then 
				MessageBox('Error','Imposible asignar consecutivo al documento - PRE_CONSECS')
				Rollback;
				Return -1
			end if				
		end if
		//FIN Consecutivo de obligaciones
		dw_t.setitem(j,'consecutivo',ld_final )
		dw_t.setitem(j,'fecha_consecu', tab_2.t2_3.tab_4.t4_1.dw_cab.getitemdatetime(1,'fecha_rel'))

		/// verificar aca
		if  tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')<>'I' then 
			valor=dw_t.getitemnumber(j,'valor')
			valor=round(dw_t.getitemnumber(j,'valor'),ii_dec_gral) 
		else
			valor=round(0,ii_dec_gral) 
		end if
		
		tdoc = dw_t.getitemstring(j,'char_orig3')
		docum = dw_t.getitemstring(j,'char_doc3')
		nomina = dw_t.GetItemNumber(j,'num_orig3')
	
		update pre_docu_cp set monto_interfaz=round((monto_interfaz + :valor), :ii_dec_gral) where monto_vigente>=round((monto_interfaz + :valor), :ii_dec_gral)  and
		coddoc=:cdoc_res and clugar=:clug_res and numdoc=:nres and item=:item_cpo;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox(messag,err)
			return -1
		end if
		if sqlca.sqlnrows = 0 and not (dw_t.GetItemString(j,'codigo') = 'RFCRFCPT') then
			rollback;
			messagebox('Atención','La reserva '+string(nres)+ ' ya no tiene monto suficiente para aprobar esta recepción. No la puede guardar como definitiva')
			return -1
		end if
		//// verificar aca
		update pre_dispo_ter set monto_reser=round((monto_reser + :valor), :ii_dec_gral)  where monto>=round((monto_reser + :valor), :ii_dec_gral) and 
		coddocu=:cdoc_res and clugar=:clug_res and numdoc=:nres and tipodoc=:tdoc and documento=:docum;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando pre_dispo_ter',err)
			return -1
		end if
		if sqlca.sqlnrows=0 and not (dw_t.GetItemString(j,'codigo') = 'RFCRFCPT') then
			rollback;
			messagebox('Atención','El tercero ('+tdoc+' - '+docum+') ya no tiene monto suficiente para aprobar esta recepción. No la puede guardar como definitiva')
			return -1
		end if
		if nomina > 0 then
			choose case sqlca.dbms
				case 'ODBC'
					UPDATE NOM_CPO INNER JOIN CONTRA_PRESU ON (NOM_CPO.item_fp = CONTRA_PRESU.ITEM) AND (NOM_CPO.otrosi = CONTRA_PRESU.OTROSI) AND (NOM_CPO.ncontrato = CONTRA_PRESU.NCONTRATO) AND (NOM_CPO.ano = CONTRA_PRESU.ANO) 
					SET NOM_CPO.presupuesto = '1'
					WHERE (NOM_CPO.NUM_NOMINA=:nomina) AND (CONTRA_PRESU.coddocu_reser=:cdoc_res) AND (CONTRA_PRESU.clugar_reser=:clug_res) AND (CONTRA_PRESU.numdoc_reser=:nres);
				case 'SYC Adaptive Server Enterprise','MSS Microsoft SQL Server','OLE DB'
					UPDATE nom_cpo SET NOM_CPO.presupuesto = '1' 
					from NOM_CPO INNER JOIN CONTRA_PRESU ON (NOM_CPO.item_fp = CONTRA_PRESU.ITEM) AND (NOM_CPO.otrosi = CONTRA_PRESU.OTROSI) AND (NOM_CPO.ncontrato = CONTRA_PRESU.NCONTRATO) AND (NOM_CPO.ano = CONTRA_PRESU.ANO) 
					WHERE (NOM_CPO.NUM_NOMINA=:nomina) AND (CONTRA_PRESU.coddocu_reser=:cdoc_res) AND (CONTRA_PRESU.clugar_reser=:clug_res) AND (CONTRA_PRESU.numdoc_reser=:nres);
				end choose

			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando nom_cpo desde nómina Prestación Servicios',err)
				return -1
			end if

		end if
		//fin interface
	next
end if//definitiva

if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then p_defini='1'
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'definitivo',p_defini)

if is_orig='SCT' then
	if tab_2.t2_1.tab_1.tabconp.dw_concep_cont.update(true,false) = -1 then
		rollback;
		return -1
	end if
	if tab_2.t2_1.dw_timpucontra.update(true,false) = -1 then
		rollback;
		return -1
	end if
end if

if tab_2.t2_3.tab_4.t4_1.dw_cab.update(true,false)=-1 then
	rollback;
	return -1
end if

if tab_2.t2_3.t5.t5_1.dw_cpo.update(true,false)=-1 then
	rollback;
	return -1
end if
tab_2.t2_3.t5.t5_2.dw_anti.resetupdate()//pa que no los vaya a insertar solo debe actualizar los campos
tab_2.t2_3.t5.t5_2.dw_anti.setfilter('')
tab_2.t2_3.t5.t5_2.dw_anti.filter()
for j=1 to tab_2.t2_3.t5.t5_2.dw_anti.rowcount()
	tab_2.t2_3.t5.t5_2.dw_anti.setitem(j,'clug_anticipo',tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'clugar'))
	tab_2.t2_3.t5.t5_2.dw_anti.setitem(j,'cdoc_anticipo',is_cdoc)
	tab_2.t2_3.t5.t5_2.dw_anti.setitem(j,'nrel_anticipo',ndoc)
	tab_2.t2_3.t5.t5_2.dw_anti.setitem(j,'item_anticipo',tab_2.t2_3.t5.t5_2.dw_anti.getitemnumber(j,'item_anticipo'))
next
if tab_2.t2_3.t5.t5_2.dw_anti.update()=-1 then
	rollback;
	return -1
end if
tab_2.t2_3.t5.t5_3.dw_tz.setfilter('')
tab_2.t2_3.t5.t5_3.dw_tz.filter()
string clug_tz,doc_tz
long nrel_tz,item_tz
dec amortiza
for j=1 to tab_2.t2_3.t5.t5_3.dw_tz.rowcount()
	if not isnull(tab_2.t2_3.t5.t5_3.dw_tz.getitemnumber(j,'nrelacion')) then continue
	tab_2.t2_3.t5.t5_3.dw_tz.setitem(j,'nrelacion',ndoc)
	clug_tz=tab_2.t2_3.t5.t5_3.dw_tz.getitemstring(j,'clugar_anti')
	nrel_tz=tab_2.t2_3.t5.t5_3.dw_tz.getitemnumber(j,'nrelacion_anti')
	item_tz=tab_2.t2_3.t5.t5_3.dw_tz.getitemnumber(j,'item_anti')
	amortiza=tab_2.t2_3.t5.t5_3.dw_tz.getitemnumber(j,'v_amortizado')
	update tesorelfactcpo set v_amortizado=v_amortizado+:amortiza where 
	clugar=:clug_tz and coddoc='RFC' and nrelacion=:nrel_tz and item=:item_tz;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando valor amortizado',err)
		return -1
	end if
next
if tab_2.t2_3.t5.t5_3.dw_tz.update(true,false)=-1 then
	rollback;
	return -1
end if
if tab_2.t2_3.t_ret.t_o.dw_rte.update(true,false)=-1 then
	rollback;
	return -1
end if
/// incia  entradas
for j=1 to tab_2.t2_3.t5.tabpage_1.dw_entradas.rowcount()
	
	if not isnull(tab_2.t2_3.t5.tabpage_1.dw_entradas.getitemnumber(j,'nrelacion')) then 
		tab_2.t2_3.t5.tabpage_1.dw_entradas.setitem(j,'nrelacion',ndoc)
	end if
	 if  p_defini='1' then 
		clug_tz=tab_2.t2_3.t5.tabpage_1.dw_entradas.getitemstring(j,'clugar_se')
		nrel_tz=tab_2.t2_3.t5.tabpage_1.dw_entradas.getitemnumber(j,'numdoc_se')
		doc_tz=tab_2.t2_3.t5.tabpage_1.dw_entradas.getitemstring(j,'coddoc_se')
		update sum_mvto_cab set en_destino=1
		where clugar=:clug_tz and coddoc=:doc_tz and numdoc=:nrel_tz ;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando_en destino CAB',err)
			return -1
		end if
	end if
next
if tab_2.t2_3.t5.tabpage_1.dw_entradas.update(true,false)=-1 then
	rollback;
	return -1
end if
///fin entradas

choose case is_orig
	case 'PR','PDI','NM','RFC', 'SCT'
		if dw_rela.update(true,false)=-1 then 
			rollback;
			return -1
		end if
end choose
if tab_2.t2_3.tab_4.t4_2.dw_tot.update(true,false)=-1 then
	rollback;
	return -1
end if
if  tab_2.t2_1.tab_fp.tabfp.dw_fpag.update(true,false)=-1 then
	rollback;
	return -1
end if
if f_save_tax()=-1 then //los impuestos del contrato
	rollback;
	return -1
end if
if tab_2.t2_1.dw_cont.update(true,false)=-1 then
	rollback;
	return -1
end if
commit;

tab_2.t2_3.tab_4.t4_1.dw_cab.resetupdate()
tab_2.t2_3.t5.t5_4.dw_legal_cab.resetupdate()
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.resetupdate()
tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.resetupdate()
tab_2.t2_3.t5.t5_1.dw_cpo.resetupdate()
tab_2.t2_3.t_ret.t_o.dw_rte.resetupdate()
tab_2.t2_3.tab_4.t4_2.dw_tot.resetupdate()
tab_2.t2_1.tab_fp.tabfp.dw_fpag.resetupdate()
tab_2.t2_1.tab_1.tabconp.dw_concep_cont.resetupdate()
tab_2.t2_1.dw_timpucontra.resetupdate()
tab_2.t2_1.dw_cont.resetupdate()
tab_2.t2_3.t5.t5_3.dw_tz.resetupdate()
tab_2.t2_3.t5.t5_2.dw_anti.resetupdate()
dw_rela.resetupdate()

if lbn_nueva and tab_2.t2_3.cbx_1.checked and p_defini='1' then
	any par[3]
	par[1]=is_clug_rad
	par[2]=is_cdoc
	par[3]=ndoc
	tab_2.t2_2.pb_print.imprimir(par,'','0')
end if

ibn_nueva=false
ibn_cambio=false
choose case is_orig
	case 'SCT','NC'
		tab_2.t2_1.dw_cont.triggerevent(rowfocuschanged!)
		if lbn_nueva then tab_2.t2_1.dw_cont.setitem(tab_2.t2_1.dw_cont.getrow(),'cobro_ori',tab_2.t2_1.dw_cont.getitemnumber(tab_2.t2_1.dw_cont.getrow(),'acum_cobro'))
	case '-','RFC'//manuales
		tab_2.t2_2.dw_terce.event itemchanged(1,tab_2.t2_2.dw_terce.object.documento,tab_2.t2_2.dw_terce.getitemstring(1,'documento'))
		tab_2.t2_2.dw_hist.scrolltorow(tab_2.t2_2.dw_hist.find('nrelacion='+string(ndoc),1,tab_2.t2_2.dw_hist.rowcount()))
	case 'PR','NM'//reservas
		tab_2.t2_2.dw_hist.reset()
		tab_2.t2_2.dw_hist.retrieve('RFC',is_orig,is_clug_rad)
		tab_2.t2_2.dw_hist.scrolltorow(tab_2.t2_2.dw_hist.find('nrelacion='+string(ndoc),1,tab_2.t2_2.dw_hist.rowcount()))
	case 'PDI'//pago dir
		tab_2.t2_2.dw_terce.event itemchanged(1,tab_2.t2_2.dw_terce.object.documento,tab_2.t2_2.dw_terce.getitemstring(1,'documento'))
end choose

return 1
end function

public function integer lf_devol ();datawindow dw_lcpo,dw_dev

dw_dev=tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo
dw_lcpo=tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo
dec t_devuelve=0
if dw_dev.rowcount()>0 then t_devuelve=dw_dev.getitemnumber(1,'t_devolver')
long j
for j=1 to dw_lcpo.rowcount()
	if dw_lcpo.getitemnumber(j,'tbruto_legal')<=t_devuelve then
		dw_lcpo.setitem(j,'devolucion',dw_lcpo.getitemnumber(j,'tbruto_legal'))
		dw_lcpo.setitem(j,'devolucion',dw_lcpo.getitemnumber(j,'tbruto_legal'))
		t_devuelve -=dw_lcpo.getitemnumber(j,'tbruto_legal')
	else
		dw_lcpo.setitem(j,'devolucion',t_devuelve)
	end if
next
return 1
end function

public subroutine f_nueva_manu ();tab_2.selectedtab=3
dw_rela.reset()
tab_2.t2_3.tab_4.t4_1.dw_cab.reset()
tab_2.t2_3.tab_4.t4_2.dw_tot.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.reset()
tab_2.t2_3.t5.t5_4.dw_legal_cab.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.reset()
tab_2.t2_3.tab_4.t4_1.dw_cab.insertrow(1)
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'clugar',is_clug_rad)
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'coddoc',is_cdoc)
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'fecha_rel',datetime(today(),now()))
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'cod_flujo',is_flujo)
tab_2.t2_3.t5.t5_1.dw_cpo.reset()
tab_2.t2_3.t5.t5_2.dw_anti.reset()
tab_2.t2_3.t5.t5_3.dw_tz.reset()
tab_2.t2_3.t_ret.t_o.dw_rte.reset()
idw_concep.retrieve(is_emp,'R','1')
tab_2.t2_3.t5.t5_1.pb_new_concep.event clicked()
ibn_cambio=true
ibn_nueva=true
end subroutine

on w_recibe_fact.create
this.st_9=create st_9
this.dw_orig=create dw_orig
this.dw_lug=create dw_lug
this.pb_search=create pb_search
this.dw_rela=create dw_rela
this.tab_2=create tab_2
this.dw_tiva=create dw_tiva
this.Control[]={this.st_9,&
this.dw_orig,&
this.dw_lug,&
this.pb_search,&
this.dw_rela,&
this.tab_2,&
this.dw_tiva}
end on

on w_recibe_fact.destroy
destroy(this.st_9)
destroy(this.dw_orig)
destroy(this.dw_lug)
destroy(this.pb_search)
destroy(this.dw_rela)
destroy(this.tab_2)
destroy(this.dw_tiva)
end on

event closequery;choose case f_pregunta()
	case 1
		if is_orig='SCT' or is_orig='NC' then
			if grabar('1')=-1 then
				return 1
			else
				return 0
			end if
		else
			if grabar('0')=-1 then
				return 1
			else
				return 0
			end if
		end if
	case 2
		return 0
	case 3
		return 1
end choose

end event

event open;SELECT ENTERO into :ii_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=28));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 28')
	return 
end if

SELECT ENTERO into :ii_aprox_gral
FROM parametros_gen
WHERE (((codigo_para)=18));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 18')
	return 
end if
if ii_aprox_gral=0 then ii_aprox_gral=1
tab_2.t2_3.pb_save.enabled=true

dw_lug.triggerevent(itemchanged!)
end event

type st_9 from statictext within w_recibe_fact
integer x = 1353
integer y = 28
integer width = 178
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Origen:"
boolean focusrectangle = false
end type

type dw_orig from datawindow within w_recibe_fact
integer x = 1339
integer y = 88
integer width = 1399
integer height = 88
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_origenes"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('codigo',idw_orig)
idw_orig.settransobject(sqlca)
idw_orig.retrieve(is_cdoc)
insertrow(1)
if idw_orig.rowcount()=1 then 
	setitem(1,1,idw_orig.getitemstring(1,'codigo'))
	post event itemchanged(1,object.codigo,idw_orig.getitemstring(1,'codigo'))
end if


end event

event itemchanged;if data='' or isnull(data) then return
choose case f_pregunta()
	case 1
		if is_orig='NC' or is_orig='SCT'  then
			if grabar('1')=-1 then 
				settext(is_flujo)
				return 1//definitivo
			end if
		else
			if grabar('0')=-1 then
				settext(is_flujo)
				return 1
			end if
		end if
	case 2
		ibn_cambio=false
		ibn_nueva=false
	case 3
		settext(is_flujo)
		return 1
end choose
long cual
is_flujo=data
cual=idw_orig.find('codigo="'+is_flujo+'"',1,idw_orig.rowcount())
if cual>0 then 
	idw_orig.scrolltorow(cual)//porque si viene de event ese dwchild no esta en la fila
	is_orig=idw_orig.getitemstring(idw_orig.getrow(),'cod_orig')
else
	messagebox('Atención','El Flujo de esta recepción ya no se encuentra activo')
	select cod_orig into :is_orig from mod_orig_dest where codigo=:is_flujo;
	is_flujo=''
	settext('')
end if
tab_2.t2_3.enabled=true
tab_2.t2_3.pb_save.enabled=false
choose case is_orig
	case 'RFC','NM','NMS'
		if tab_2.selectedtab=1 then tab_2.selectedtab=2
		tab_2.t2_1.visible=false
		tab_2.t2_2.dw_terce.visible=false
		tab_2.t2_2.dw_hist.dataobject='dw_hist_tesrelfac2'
		tab_2.t2_2.dw_hist.settransobject(sqlca)
		tab_2.t2_2.dw_hist.reset()
		tab_2.t2_2.dw_hist.retrieve('RFC',is_orig)

	case 'NC','SCT'
		tab_2.t2_1.visible=true
		tab_2.t2_2.dw_hist.dataobject='dw_tesorelfact_x_cont'
		tab_2.t2_2.dw_hist.settransobject(sqlca)
		tab_2.t2_2.dw_terce.visible=false
		tab_2.t2_2.dw_hist.retrieve('RFC',is_orig)	
		if tab_2.t2_2.dw_hist.rowcount()>0 then
			string ls_td,ls_doc
			idb_ncont=tab_2.t2_2.dw_hist.getitemnumber(tab_2.t2_2.dw_hist.getrow(),'ncontrato')
			idb_otrosi=tab_2.t2_2.dw_hist.getitemnumber(tab_2.t2_2.dw_hist.getrow(),'otrosi')
			idb_ano=tab_2.t2_2.dw_hist.getitemnumber(tab_2.t2_2.dw_hist.getrow(),'ano')		
			SELECT contra.tipodoc, contra.documento into :ls_td,:ls_doc
			FROM contra
			WHERE (((contra.ano)=:idb_ano) AND ((contra.ncontrato)=:idb_ncont) AND ((contra.otrosi)=:idb_otrosi));
			tab_2.t2_1.dw_terce_c.setitem(1,'tipodoc',ls_td)
			tab_2.t2_1.dw_terce_c.setitem(1,'documento',ls_doc)			
		end if
		tab_2.t2_1.dw_terce_c.event itemchanged(1,tab_2.t2_1.dw_terce_c.object.documento,tab_2.t2_1.dw_terce_c.getitemstring(1,'documento'))
		tab_2.t2_3.pb_save.enabled=false
		if not isnull(idb_ncont) then
			cual=tab_2.t2_1.dw_cont.find('ano='+string(idb_ano)+' and ncontrato='+string(idb_ncont)+' and  otrosi='+string(idb_otrosi) ,1, tab_2.t2_1.dw_cont.rowcount())
			if cual>0 then tab_2.t2_1.dw_cont.scroll(cual)
		end if
		tab_2.t2_1.tab_fp.SelectTab(1)
		tab_2.t2_1.tab_fp.tabfp.dw_fpag.SetFocus()
		tab_2.t2_1.tab_fp.tabfp.dw_fpag.SetColumn ("item")
	case '-','PDI'
		if tab_2.selectedtab=1 then tab_2.selectedtab=2
		tab_2.t2_1.visible=false
		tab_2.t2_2.dw_terce.visible=true
		tab_2.t2_2.dw_hist.dataobject='dw_hist_tesrelfac2'
		tab_2.t2_2.dw_hist.settransobject(sqlca)
		tab_2.t2_2.dw_hist.reset()
		tab_2.t2_2.dw_hist.retrieve('RFC',is_orig)

	case 'PR'
		if tab_2.selectedtab=1 then tab_2.selectedtab=2
		tab_2.t2_1.visible=false
		tab_2.t2_2.dw_terce.visible=false
		tab_2.t2_2.dw_hist.dataobject='dw_tesorelfact_reserv'
		tab_2.t2_2.dw_hist.settransobject(sqlca)
		tab_2.t2_2.dw_hist.retrieve('RFC','PR',is_clug_rad)
end choose
accepttext()

end event

type dw_lug from datawindow within w_recibe_fact
integer x = 37
integer y = 28
integer width = 1280
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('codlugar',idw_lugar)
idw_lugar.settransobject(sqlca)
idw_lugar.retrieve()
insertrow(1)
if idw_lugar.rowcount()=1 then 
	setitem(1,1,idw_lugar.getitemstring(1,1))
	post event itemchanged(1,object.codlugar,idw_lugar.getitemstring(1,1))
end if
setitem(1,1,clugar)

end event

event itemchanged;choose case f_pregunta()
	case 1
		if is_orig='NC' or is_orig='SCT'  then
			if grabar('1')=-1 then 
				settext(is_flujo)
				return 1//definitivo
			end if
		else
			if grabar('0')=-1 then
				settext(is_flujo)
				return 1
			end if
		end if
	case 2
		ibn_cambio=false
		ibn_nueva=false
	case 3
		settext(is_flujo)
		return 1
end choose

if isnull(data) then 
	is_clug_rad=clugar
else
	is_clug_rad=data
end if

select cod_empresa into :is_emp from lugar where codlugar=:is_clug_rad;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
	return 0
end if
if isnull(is_emp) then
	messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
	return 0
end if

dw_orig.event itemchanged(1,dw_orig.object.codigo,dw_orig.getitemstring(1,1))

idw_concep_cont.retrieve(is_emp,'R','1')
idw_concep.retrieve(is_emp,'R','1')

end event

type pb_search from picturebutton within w_recibe_fact
integer x = 2775
integer y = 40
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "lupa.gif"
string powertiptext = "Buscar Recepción"
end type

event clicked;openwithparm(w_busca_recep,'recep')
end event

type dw_rela from datawindow within w_recibe_fact
boolean visible = false
integer x = 4064
integer width = 1696
integer height = 104
boolean enabled = false
string title = "none"
string dataobject = "dw_mod_rel_orig"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type tab_2 from tab within w_recibe_fact
event create ( )
event destroy ( )
integer x = 37
integer y = 192
integer width = 6112
integer height = 2192
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
t2_1 t2_1
t2_2 t2_2
t2_3 t2_3
t2_4 t2_4
end type

on tab_2.create
this.t2_1=create t2_1
this.t2_2=create t2_2
this.t2_3=create t2_3
this.t2_4=create t2_4
this.Control[]={this.t2_1,&
this.t2_2,&
this.t2_3,&
this.t2_4}
end on

on tab_2.destroy
destroy(this.t2_1)
destroy(this.t2_2)
destroy(this.t2_3)
destroy(this.t2_4)
end on

type t2_1 from userobject within tab_2
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 112
integer width = 6075
integer height = 2064
long backcolor = 67108864
string text = "Contratos"
long tabtextcolor = 33554432
string picturename = "Contrato.ico"
long picturemaskcolor = 536870912
string powertiptext = "Historial de Contratos de un tercero"
tab_1 tab_1
tab_fp tab_fp
pb_new_d_cont pb_new_d_cont
pb_del_imp_cont pb_del_imp_cont
pb_new_impu pb_new_impu
pb_new_concep_cont pb_new_concep_cont
pb_del_concep_cont pb_del_concep_cont
dw_resu dw_resu
dw_cont dw_cont
pb_find_c pb_find_c
dw_terce_c dw_terce_c
dw_timpucontra dw_timpucontra
st_6 st_6
pb_save_tax pb_save_tax
pb_traeiva pb_traeiva
dw_ppto dw_ppto
pb_ppto pb_ppto
end type

on t2_1.create
this.tab_1=create tab_1
this.tab_fp=create tab_fp
this.pb_new_d_cont=create pb_new_d_cont
this.pb_del_imp_cont=create pb_del_imp_cont
this.pb_new_impu=create pb_new_impu
this.pb_new_concep_cont=create pb_new_concep_cont
this.pb_del_concep_cont=create pb_del_concep_cont
this.dw_resu=create dw_resu
this.dw_cont=create dw_cont
this.pb_find_c=create pb_find_c
this.dw_terce_c=create dw_terce_c
this.dw_timpucontra=create dw_timpucontra
this.st_6=create st_6
this.pb_save_tax=create pb_save_tax
this.pb_traeiva=create pb_traeiva
this.dw_ppto=create dw_ppto
this.pb_ppto=create pb_ppto
this.Control[]={this.tab_1,&
this.tab_fp,&
this.pb_new_d_cont,&
this.pb_del_imp_cont,&
this.pb_new_impu,&
this.pb_new_concep_cont,&
this.pb_del_concep_cont,&
this.dw_resu,&
this.dw_cont,&
this.pb_find_c,&
this.dw_terce_c,&
this.dw_timpucontra,&
this.st_6,&
this.pb_save_tax,&
this.pb_traeiva,&
this.dw_ppto,&
this.pb_ppto}
end on

on t2_1.destroy
destroy(this.tab_1)
destroy(this.tab_fp)
destroy(this.pb_new_d_cont)
destroy(this.pb_del_imp_cont)
destroy(this.pb_new_impu)
destroy(this.pb_new_concep_cont)
destroy(this.pb_del_concep_cont)
destroy(this.dw_resu)
destroy(this.dw_cont)
destroy(this.pb_find_c)
destroy(this.dw_terce_c)
destroy(this.dw_timpucontra)
destroy(this.st_6)
destroy(this.pb_save_tax)
destroy(this.pb_traeiva)
destroy(this.dw_ppto)
destroy(this.pb_ppto)
end on

type tab_1 from tab within t2_1
event create ( )
event destroy ( )
integer x = 2926
integer y = 728
integer width = 3122
integer height = 1224
integer taborder = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabconp tabconp
end type

on tab_1.create
this.tabconp=create tabconp
this.Control[]={this.tabconp}
end on

on tab_1.destroy
destroy(this.tabconp)
end on

type tabconp from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3086
integer height = 1096
long backcolor = 67108864
string text = "Conceptos Pago"
long tabtextcolor = 33554432
string picturename = "Contrato.ico"
long picturemaskcolor = 536870912
dw_concep_cont dw_concep_cont
end type

on tabconp.create
this.dw_concep_cont=create dw_concep_cont
this.Control[]={this.dw_concep_cont}
end on

on tabconp.destroy
destroy(this.dw_concep_cont)
end on

type dw_concep_cont from datawindow within tabconp
event p_itemchanged ( )
integer x = 27
integer y = 28
integer width = 2994
integer height = 1040
integer taborder = 40
string title = "none"
string dataobject = "dw_concep_cont"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
datawindow dw_t
dw_t=tab_2.t2_1.dw_resu
if rowcount()>0 then
	dw_t.setitem(1,'tneto',getitemnumber(1,'t_neto'))
	dw_t.setitem(1,'tbase',getitemnumber(1,'t_vsiniva'))
else
	dw_t.setitem(1,'tneto',dw_t.getitemnumber(1,'tbruto'))
	dw_t.setitem(1,'tbase',dw_t.getitemnumber(1,'tbruto'))
end if
end event

event constructor;settransobject(sqlca)
getchild('cod_rel',idw_concep_cont)
idw_concep_cont.settransobject(sqlca)

end event

event itemchanged;choose case dwo.name
	case 'tbruto'
		if tab_2.t2_1.dw_timpucontra.rowcount()>0 then
			long j
			for j=1 to tab_2.t2_1.dw_timpucontra.rowcount()
				tab_2.t2_1.dw_timpucontra.event itemchanged(j,tab_2.t2_1.dw_timpucontra.object.cod_concep,tab_2.t2_1.dw_timpucontra.getitemstring(j,'cod_concep'))
			next
		else
			tab_2.t2_1.dw_timpucontra.event p_itemchanged('C')
		end if
end choose
end event

event rowfocuschanged;if getrow()<1 then 
	tab_2.t2_1.dw_timpucontra.setfilter('isnull(n_concep)')
else
	if isnull(getitemnumber(getrow(),'n_concep')) then
		tab_2.t2_1.dw_timpucontra.setfilter('isnull(n_concep)')
	else
		tab_2.t2_1.dw_timpucontra.setfilter('n_concep='+string(getitemnumber(getrow(),'n_concep')))
	end if
end if
tab_2.t2_1.dw_timpucontra.filter()

end event

type tab_fp from tab within t2_1
event create ( )
event destroy ( )
integer x = 14
integer y = 728
integer width = 2834
integer height = 1300
integer taborder = 54
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabfp tabfp
tabcau tabcau
end type

on tab_fp.create
this.tabfp=create tabfp
this.tabcau=create tabcau
this.Control[]={this.tabfp,&
this.tabcau}
end on

on tab_fp.destroy
destroy(this.tabfp)
destroy(this.tabcau)
end on

type tabfp from userobject within tab_fp
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2798
integer height = 1172
long backcolor = 67108864
string text = "Pagos A Terceros"
long tabtextcolor = 33554432
string picturename = "Calculator.ico"
long picturemaskcolor = 536870912
dw_fpag dw_fpag
end type

on tabfp.create
this.dw_fpag=create dw_fpag
this.Control[]={this.dw_fpag}
end on

on tabfp.destroy
destroy(this.dw_fpag)
end on

type dw_fpag from datawindow within tabfp
integer x = 27
integer y = 28
integer width = 2729
integer height = 1100
integer taborder = 40
string title = "none"
string dataobject = "dw_f_pagos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if rowCount() = 0 then return
tab_2.t2_1.tab_1.tabconp.dw_concep_cont.retrieve(idb_ano,idb_ncont,idb_otrosi,getItemNumber(getrow(),'item'))
tab_2.t2_1.tab_fp.tabcau.dw_causa.setFilter( "item="+String(getItemNumber(getrow(),'item')) )
tab_2.t2_1.tab_fp.tabcau.dw_causa.filter()

//long ldb_nrel
//string ls_clug,ls_cdoc
//
//
//ldb_nrel=dw_fpag.getitemnumber(dw_fpag.getrow(),'nrelacion_relfact')
//ls_clug=dw_fpag.getitemstring(dw_fpag.getrow(),'clugar_relfact')
//ls_cdoc=dw_fpag.getitemstring(dw_fpag.getrow(),'coddoc_relfact')
//
//dw_rela.retrieve(ls_clug,ls_cdoc,ldb_nrel)
end event

event itemchanged;choose case dwo.name
	case 'causa_impu'
		long donde
		choose case data
			case '2'//completos
				donde=find('(causa_impu="2" or causa_impu="1" or causa_impu="3") and getrow()<>'+string(row),1,rowcount())
			case '1'//proporcional
				donde=find('(causa_impu="2" or causa_impu="3") and getrow()<>'+string(row),1,rowcount())
			case '3' // resto
				donde=find('(causa_impu="2" or causa_impu="3") and getrow()<>'+string(row),1,rowcount())
				if find('causa_impu="1"',1,row -1)=0 then donde=1
		end choose
		if donde<>0 then
			setitem(row,'causa_impu',getitemstring(row,'causa_impu'))
			settext(getitemstring(row,'causa_impu'))
			return 1
		end if
	case 'esco'
		if data='0' then
			string nulo
			setnull(nulo)
			setitem(row,'causa_impu',nulo)
		end if
end choose
if ibn_nueva then tab_2.t2_3.enabled=false
end event

event constructor;settransobject(sqlca)
end event

event retrieveend;dw_fpag.event rowfocuschanged(0)

end event

type tabcau from userobject within tab_fp
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2798
integer height = 1172
long backcolor = 67108864
string text = "Causación"
long tabtextcolor = 33554432
string picturename = "configura.ico"
long picturemaskcolor = 536870912
dw_causa dw_causa
end type

on tabcau.create
this.dw_causa=create dw_causa
this.Control[]={this.dw_causa}
end on

on tabcau.destroy
destroy(this.dw_causa)
end on

type dw_causa from datawindow within tabcau
integer x = 27
integer y = 28
integer width = 2770
integer height = 1108
integer taborder = 40
string title = "none"
string dataobject = "dw_contra_fpago_causacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

type pb_new_d_cont from picturebutton within t2_1
boolean visible = false
integer x = 3625
integer y = 16
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Insertar Nueva Recepción de Factura o Cuenta de Cobro"
end type

event clicked;if tab_2.t2_1.tab_fp.tabfp.dw_fpag.rowcount()=0 then return
if isnull(is_flujo) or is_flujo='' then 
	messagebox('Atención','Debe escoger el origen de la Recepción')
	return
end if
//if dw_concep_cont.rowcount()=0 then
//	messagebox("Atención",'Debe elegir los Conceptos de pago del Contrato')
//	return
//end if
//
//if dw_concep_cont.find('isnull(cod_rel)',1, dw_concep_cont.rowcount())>0 then
//	messagebox("Atención",'Debe escoger los conceptos del Contrato')
//	return
//end if

if dw_ppto.getItemNumber(1,'total') <> tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(1,'total') then
	messagebox("Atención", 'El monto usado en presupuesto no corresponde al valor causado')
	return
end if

if f_save_tax() = -1 then
	//rollback;
else
	//	commit;
	//	dw_concep_cont.resetupdate()
	//	dw_timpucontra.resetupdate()
end if
dec a_cobrar, t_cont
long j, k, donde, l, fila
datawindow dw_viejos,dw_nuevos

//t_cont = dw_concep_cont.getitemnumber(1,'t_bruto')
t_cont = tab_2.t2_1.tab_fp.tabcau.dw_causa.getitemnumber(1,'total')
/*a_cobrar = dw_fpag.getitemnumber(1,'a_cobrar')
if a_cobrar=0 then
	messagebox("Atención",'Debe escoger una autorización de pago para continuar')
	return
end if
*/

j = tab_2.t2_1.tab_fp.tabfp.dw_fpag.find('esco="1" and isnull(causa_impu)',1,tab_2.t2_1.tab_fp.tabfp.dw_fpag.rowcount())
if j<>0 then
	messagebox("Atención",'Debe escoger la Causación de impuestos de lo que se va a cobrar')
	return
end if
/*if dw_fpag.getitemnumber(1,'t_radicados')=dw_fpag.rowcount() and dw_fpag.getitemnumber(1,'total')>=dw_cont.getitemnumber(dw_cont.getrow(),'monto') then//todos , fin
	if dw_fpag.find('causa_impu="0"',1,dw_fpag.rowcount())>0 then//uno sin causar
		if dw_fpag.find('causa_impu="3" or causa_impu="2"',1,dw_fpag.rowcount())=0 then //no hay un resto o completos
			if messagebox('Atención','Debe existir al menos una forma de pago con causación en RESTO. Desea Continuar?', Question!, yesno!,2) = 2 then return
		end if
	end if
end if
dec porc,porc_g
porc_g = a_cobrar / t_cont

dw_viejos = dw_timpucontra
if dw_viejos.find('isnull(cod_total)',1,dw_viejos.rowcount())>0 then
	messagebox("Atención",'Debe escoger la cuenta contable de todos los impuestos')
	return
end if*/
dw_nuevos = tab_2.t2_3.t_ret.t_o.dw_rte
dw_nuevos.reset()
tab_2.t2_3.tab_4.t4_2.dw_tot.reset()
tab_2.t2_3.tab_4.t4_1.dw_cab.reset()
tab_2.t2_3.t5.t5_4.dw_legal_cab.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.reset()
tab_2.t2_3.t5.t5_1.dw_cpo.reset()
tab_2.t2_3.t5.t5_2.dw_anti.reset()
tab_2.t2_3.t5.t5_3.dw_tz.reset()
tab_2.t2_3.tab_4.t4_1.dw_cab.insertrow(1)

double fc

for l=1 to tab_2.t2_1.tab_fp.tabcau.dw_causa.rowcount()
	fc = tab_2.t2_3.t5.t5_1.dw_cpo.find("cod_rel='" + tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemString(fila,'cod_rel')+"'", 1, tab_2.t2_1.tab_1.tabconp.dw_concep_cont.rowCount())
	if fc = 0 then
		fc = tab_2.t2_3.t5.t5_1.dw_cpo.insertrow(0)
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'clugar',is_clug_rad)
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'coddoc',is_cdoc)
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'item',l)
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tipodoc',dw_terce_c.getitemstring(1,'tipodoc'))
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'documento',dw_terce_c.getitemstring(1,'documento'))
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'cod_rel', tab_2.t2_1.tab_fp.tabcau.dw_causa.getitemstring(l,'cod_rel'))
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tbruto', tab_2.t2_1.tab_fp.tabcau.dw_causa.getitemnumber(l,'total'))
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'val_bruto', tab_2.t2_1.tab_fp.tabcau.dw_causa.getitemnumber(l,'total'))
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tneto', tab_2.t2_1.tab_fp.tabcau.dw_causa.getitemnumber(l,'total'))
	else
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tbruto', tab_2.t2_3.t5.t5_1.dw_cpo.getItemNumber(fc, 'tbruto') + tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(l,'monto_vigente'))
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'val_bruto' ,tab_2.t2_3.t5.t5_1.dw_cpo.getItemNumber(fc, 'val_bruto') + tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(l,'monto_vigente'))
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tneto',tab_2.t2_3.t5.t5_1.dw_cpo.getItemNumber(fc, 'tneto') + tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(l,'monto_vigente'))
	end if
next

//for l=1 to dw_concep_cont.rowcount()
//	dw_concep_cont.scrolltorow(l)
//	tab_2.t2_3.t5.t5_1.dw_cpo.insertrow(l)
//	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'clugar',is_clug_rad)
//	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'coddoc',is_cdoc)
//	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'item',l)
//	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tipodoc',dw_terce_c.getitemstring(1,'tipodoc'))
//	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'documento',dw_terce_c.getitemstring(1,'documento'))
//	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'cod_rel', dw_concep_cont.getitemstring(l,'cod_rel'))
////  2023/09/09 Se cambia por solicitud de Armando. el tbruto de conceptos es menor al valor de la forma de pago y yl valor porc_g es mayor a 1
////	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tbruto', dw_concep_cont.getitemnumber(l,'tbruto')*porc_g)
////	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'val_bruto', dw_concep_cont.getitemnumber(l,'tbruto')*porc_g)
////	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tneto', dw_concep_cont.getitemnumber(l,'tbruto')*porc_g)
//	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tbruto', dw_concep_cont.getitemnumber(l,'tbruto'))
//	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'val_bruto', dw_concep_cont.getitemnumber(l,'tbruto'))
//	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(l,'tneto', dw_concep_cont.getitemnumber(l,'tbruto'))
//	tab_2.t2_3.t5.t5_1.dw_cpo.scrolltorow(l)
//	porc = 0
//	for j=1 to dw_fpag.rowcount()
//		if dw_fpag.getitemstring(j,'esco')='1' then
//			if dw_fpag.getitemstring(j,'causa_impu')='1' then //proporcional
//				porc += dw_fpag.getitemnumber(j,'monto') / dw_concep_cont.getitemnumber(1,'t_bruto')
//			end if
//			if dw_fpag.getitemstring(j,'causa_impu')='2' then porc=1
//			if dw_fpag.getitemstring(j,'causa_impu')='3' then //resto
//				porc +=(dw_concep_cont.getitemnumber(1,'t_bruto') - dw_fpag.getitemnumber(j,'t_propor')) / dw_concep_cont.getitemnumber(1,'t_bruto')
//			end if
//		end if
//	next
//	for k=1 to dw_viejos.rowcount()
//		donde = dw_nuevos.insertrow(0)
//		dw_nuevos.setitem(donde,'sobre',dw_viejos.getitemstring(k,'sobre'))
//		if dw_viejos.getitemstring(k,'sobre')='I' then
//			dw_nuevos.setitem(donde,'tvalor',dw_viejos.getitemnumber(k,'valor'))
//		else
//			dw_nuevos.setitem(donde,'tvalor',dw_viejos.getitemnumber(k,'valor')*porc)
//		end if
//		dw_nuevos.setitem(donde,'base',dw_viejos.getitemnumber(k,'base')*porc)//a_cobrar)
//		dw_nuevos.setitem(donde,'item',l)
//		dw_nuevos.setitem(donde,'subitem',donde)
//		dw_nuevos.setitem(donde,'cod_tipo',dw_viejos.getitemstring(k,'cod_tipo'))
//		dw_nuevos.setitem(donde,'accion',dw_viejos.getitemstring(k,'accion'))
//		dw_nuevos.setitem(donde,'cod_concep',dw_viejos.getitemstring(k,'cod_concep'))
//		dw_nuevos.setitem(donde,'clugar',is_clug_rad)
//		dw_nuevos.setitem(donde,'coddoc',is_cdoc)
//		dw_nuevos.setitem(donde,'desde','1')
//		dw_nuevos.setitem(donde,'cod_empre',dw_viejos.getitemstring(k,'cod_empre'))
//		dw_nuevos.setitem(donde,'cod_total',dw_viejos.getitemstring(k,'cod_total'))
//		dw_nuevos.setitem(donde,'tipodoc',dw_terce_c.getitemstring(1,'tipodoc'))
//		dw_nuevos.setitem(donde,'documento',dw_terce_c.getitemstring(1,'documento'))
//		tab_2.t2_3.t_ret.t_o.dw_rte.event p_itemchanged('B')
//	next
//next

for j = 1 to dw_ppto.rowCount()
	if dw_ppto.getItemNumber(j, 'a_usar') > 0 then
		fila = dw_rela.InsertRow(0)
		dw_rela.setItem(fila, 'codigo', is_flujo)
		dw_rela.setItem(fila, 'char_orig1', dw_ppto.getItemString(j, "coddoc"))
		dw_rela.setItem(fila, 'char_orig2', dw_ppto.getItemString(j, "clugar"))
		dw_rela.setItem(fila, 'num_orig1', dw_ppto.getItemNumber(j, "numdoc"))
		//dw_rela.setitem(fila,'num_doc2',donde)
		dw_rela.setItem(fila, 'num_orig2', dw_ppto.getItemNumber(j, "item"))
		dw_rela.setItem(fila, 'valor', dw_ppto.getItemNumber(j, "a_usar"))
		dw_rela.setItem(fila, 'char_orig3', dw_cont.getItemString(dw_cont.getRow(), 'tipodoc'))
		dw_rela.setItem(fila, 'char_doc3', dw_cont.getItemString(dw_cont.getRow(), 'documento'))
	end if
next

tab_2.t2_3.t5.t5_1.dw_cpo.event p_itemchanged()
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'fecha_rel',datetime(today(),now()))
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'clugar',is_clug_rad)
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'coddoc',is_cdoc)
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'cod_flujo',is_flujo)
tab_2.t2_3.enabled = true
tab_2.selectedtab = 3
tab_2.t2_3.pb_save_def.enabled = true
ibn_nueva = true
ibn_cambio = true

end event

type pb_del_imp_cont from picturebutton within t2_1
boolean visible = false
integer x = 3099
integer y = 1408
integer width = 142
integer height = 124
integer taborder = 45
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Impuesto"
end type

event clicked;//if dw_timpucontra.rowcount()=0 then return
//if dw_timpucontra.getitemnumber(dw_timpucontra.getrow(),'acumul_ori')>0 then
//	messagebox("Atención",'De este contrato ya se han radicado y causado impuestos, ya no se puede borrar este impuesto; debe anular las radicaciones para poder eliminarlo')
//	return
//end if
//dw_timpucontra.deleterow(0)
//dw_timpucontra.event p_itemchanged('C')
end event

type pb_new_impu from picturebutton within t2_1
boolean visible = false
integer x = 3099
integer y = 1284
integer width = 142
integer height = 124
integer taborder = 44
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar Impuesto"
end type

event clicked;//if dw_resu.getitemnumber(1,'acum_cobro')>=dw_resu.getitemnumber(1,'tbruto') then
//	messagebox('Atención','Ya se han radicado todas las Facturas y/o Ctas de cobro para este contrato, ya no se pueden adicionar impuestos')
//	return -1
//end if
//long donde
//donde=dw_timpucontra.insertrow(0)
//dw_timpucontra.setitem(donde,'ano',i_ano)
//dw_timpucontra.setitem(donde,'ncontrato',i_ncont)
//dw_timpucontra.setitem(donde,'otrosi',i_otrosi)
//dw_timpucontra.setitem(donde,'n_concep',dw_concep_cont.getitemnumber(dw_concep_cont.getrow(),'n_concep'))
//dw_timpucontra.setitem(donde,'base',tab_2.t2_1.dw_cont.getitemnumber(tab_2.t2_1.dw_cont.getrow(),'monto'))
//return donde
end event

type pb_new_concep_cont from picturebutton within t2_1
boolean visible = false
integer x = 3099
integer y = 996
integer width = 146
integer height = 128
integer taborder = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "insertar.gif"
string powertiptext = "Insertar Concepto de Pago al Contrato"
end type

event clicked;//if dw_resu.getitemnumber(1,'acum_cobro')>=dw_resu.getitemnumber(1,'tbruto') then
//	messagebox('Atención','Ya se han radicado todas las Facturas y/o Ctas de cobro para este contrato, ya no se pueden adicionar impuestos')
//	return -1
//end if
//long donde,j
//dec monto=0
//if dw_concep_cont.rowcount()>0 then monto=dw_concep_cont.getitemnumber(1,'t_bruto')
//donde=dw_concep_cont.insertrow(0)
//dw_concep_cont.setitem(donde,'ano',i_ano)
//dw_concep_cont.setitem(donde,'ncontrato',i_ncont)
//dw_concep_cont.setitem(donde,'otrosi',i_otrosi)
//for j=1 to dw_concep_cont.rowcount()
//	if dw_concep_cont.find('n_concep='+string(j),1,dw_concep_cont.rowcount())=0 then exit
//next
//dw_concep_cont.setitem(donde,'n_concep',j)
//dw_concep_cont.setitem(donde,'tbruto',tab_2.t2_1.dw_cont.getitemnumber(tab_2.t2_1.dw_cont.getrow(),'monto')-monto)
//dw_concep_cont.setitem(donde,'tneto',dw_concep_cont.getitemnumber(donde,'tbruto'))
//dw_concep_cont.setitem(donde,'v_siniva',dw_concep_cont.getitemnumber(donde,'tbruto'))
//dw_concep_cont.scrolltorow(donde)
//return donde
end event

type pb_del_concep_cont from picturebutton within t2_1
boolean visible = false
integer x = 3099
integer y = 1132
integer width = 146
integer height = 128
integer taborder = 74
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar Concepto de Pago del Contrato"
end type

event clicked;//if dw_concep_cont.rowcount()=0 then return
//do while dw_timpucontra.rowcount()>0
//	pb_del_imp_cont.event clicked()
//loop
//dw_concep_cont.deleterow(0)
//dw_concep_cont.triggerevent(rowfocuschanged!)
//dw_concep_cont.event p_itemchanged()
//
end event

type dw_resu from datawindow within t2_1
boolean visible = false
integer x = 4750
integer y = 16
integer width = 549
integer height = 144
integer taborder = 31
boolean enabled = false
string title = "none"
string dataobject = "dw_resu_cont"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event retrieveend;if tab_2.t2_1.tab_1.tabconp.dw_concep_cont.rowcount()>0 then tab_2.t2_1.tab_1.tabconp.dw_concep_cont.event p_itemchanged()

end event

type dw_cont from datawindow within t2_1
integer x = 5
integer y = 196
integer width = 5801
integer height = 504
integer taborder = 70
string title = "none"
string dataobject = "dw_cont_x_tercero"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_2.t2_1.tab_fp.tabfp.dw_fpag.reset()
tab_2.t2_1.tab_fp.tabcau.dw_causa.reset()
tab_2.t2_1.dw_timpucontra.reset()
tab_2.t2_1.tab_1.tabconp.dw_concep_cont.reset()
dw_resu.reset()
tab_2.t2_3.t_ret.t_o.dw_rte.reset()
tab_2.t2_3.tab_4.t4_2.dw_tot.reset()
tab_2.t2_4.dw_ord_pag.reset()
if getrow()<1 then return
idb_ano=getitemnumber(getrow(),'ano')
idb_ncont=getitemnumber(getrow(),'ncontrato')
idb_otrosi=getitemnumber(getrow(),'otrosi')
tab_2.t2_1.tab_fp.tabfp.dw_fpag.retrieve(idb_ano,idb_ncont,idb_otrosi)
tab_2.t2_1.dw_timpucontra.retrieve(idb_ano,idb_ncont,idb_otrosi)
dw_resu.retrieve(idb_ano,idb_ncont,idb_otrosi)
tab_2.t2_1.tab_fp.tabcau.dw_causa.retrieve(idb_ano,idb_ncont,idb_otrosi)
tab_2.t2_1.dw_ppto.Retrieve(idb_ano,idb_ncont,idb_otrosi)
tab_2.t2_1.tab_fp.SelectTab(1)
tab_2.t2_1.tab_fp.tabfp.dw_fpag.SetFocus()
tab_2.t2_1.tab_fp.tabfp.dw_fpag.SetColumn ("item")
end event

event rowfocuschanging;choose case f_pregunta()
	case 1
		if grabar('1')=-1 then return 1
	case 2
		ibn_cambio=false
		ibn_nueva=false
	case 3
		return 1
end choose
return 0
end event

event retrieveend;dw_cont.event rowfocuschanged(0)
end event

type pb_find_c from picturebutton within t2_1
integer x = 3209
integer y = 40
integer width = 142
integer height = 124
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &b"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar Tercero [Alt+B]"
end type

event clicked;choose case f_pregunta()
	case 1
		if is_orig='SCT' or is_orig='NC' then
			if grabar('1')=-1 then return 1
		else
			if grabar('0')=-1 then return 1
		end if
	case 2
		ibn_cambio=false
		ibn_nueva=false
	case 3
		return 1
end choose
g_tercerodesde=1
openwithparm(w_buscater,dw_terce_c)
dw_terce_c.setcolumn('documento')
dw_terce_c.event itemchanged(1,dw_terce_c.object.documento,dw_terce_c.getitemstring(1,'documento'))
end event

type dw_terce_c from datawindow within t2_1
integer x = 27
integer y = 24
integer width = 3168
integer height = 136
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
modify('tipodoc.validationmsg="No puede cambiar el tercero sin guardar"')
modify('documento.validationmsg="Tercero no existe o ya no lo puede cambiar sin guardar"')
insertrow(1)
end event

event itemchanged;if isnull(data) then 
	dw_cont.event rowfocuschanged(0)
	return
end if
choose case f_pregunta()
	case 1
		if is_orig='SCT' or is_orig='NC' then
			if grabar('1')=-1 then return 1
		else
			if grabar('0')=-1 then return 1
		end if
	case 2
		ibn_cambio=false
		ibn_nueva=false
	case 3
		return 1
end choose
accepttext()
string doc,tdoc
tdoc=getitemstring(1,"tipodoc")
doc=getitemstring(1,"documento")
string snulo
setnull(snulo)
if dwo.name="tipodoc" and doc <> "" then
	setitem(1,"documento",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,'persona',snulo)
	dw_cont.reset()
	return
end if
if dwo.name="documento" and doc = "" then 
	setitem(1,'nombre1',snulo)
	setitem(1,'persona',snulo)
end if
if dwo.name="documento" and doc <> "" then
	if retrieve(tdoc,doc)=0 then
		insertrow(1)
		setitem(1,1,tdoc)
		setitem(1,2,doc)
		messagebox("Atención",'Tercero no existe')
	else
		dw_cont.retrieve(tdoc,doc)
	end if
end if
end event

type dw_timpucontra from datawindow within t2_1
event p_itemchanged ( string p_cual )
event p_scrollto ( long p_fila,  string p_column )
boolean visible = false
integer x = 3355
integer y = 1868
integer width = 1559
integer height = 128
integer taborder = 42
string title = "none"
string dataobject = "dw_contra_timpu"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(string p_cual);accepttext()
long j,donde,donde2,k,item
dec base_desde,porcentaje,iva,v_siniva,valor,uvt
datawindow dw_1

tab_2.t2_1.tab_1.tabconp.dw_concep_cont.accepttext()
setredraw(false)
dw_1=tab_2.t2_1.tab_1.tabconp.dw_concep_cont
for j=1 to rowcount()
	if getitemstring(j,'accion')='1' then //incrementa
			if p_cual='B' then //base
			iva+=getitemnumber(j,'valor')
		else
			donde=idw_impu1.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_impu1.rowcount())
			porcentaje+=idw_impu1.getitemnumber(donde,'porcentaje')
		end if
	end if
next
if is_orig<>'-' and is_orig<>'RFC' then 
	if p_cual='C' then
		v_siniva=round(dw_1.getitemNumber(dw_1.getrow(),'tbruto')/(1+porcentaje/100),ii_dec_gral)
		if ii_dec_gral=0 then
			v_siniva=long(v_siniva/ii_aprox_gral)*ii_aprox_gral +ii_aprox_gral*round((v_siniva -long(v_siniva/ii_aprox_gral)*ii_aprox_gral)/ii_aprox_gral,0)
		end if
		dw_1.setitem(dw_1.getrow(),'v_siniva',v_siniva)
	else
		v_siniva=round(dw_1.getitemNumber(dw_1.getrow(),'tbruto')-iva,ii_dec_gral)
		if ii_dec_gral=0 then
			v_siniva=long(v_siniva/ii_aprox_gral)*ii_aprox_gral +ii_aprox_gral*round((v_siniva -long(v_siniva/ii_aprox_gral)*ii_aprox_gral)/ii_aprox_gral,0)
		end if
		dw_1.setitem(dw_1.getrow(),'v_siniva',v_siniva)
	end if
end if
for j=1 to rowcount()
	if p_cual='B' and j=getrow() then continue
	donde=idw_impu1.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_impu1.rowcount())
	base_desde=idw_impu1.getitemnumber(donde,'base')
	porcentaje=idw_impu1.getitemnumber(donde,'porcentaje')
	uvt=idw_impu1.getitemnumber(donde,'uvt')
//	if tab_1.selectedtab=2 then //manual
	if getitemstring(j,'sobre')<>'U' then
		if getitemstring(j,'sobre')<>'I' then
			if base_desde<=getitemdecimal(j,'base') then
				setitem(j,'valor',round(getitemdecimal(j,'base') *  porcentaje/100,ii_dec_gral))
			else
				setitem(j,'valor',0)
			end if
		end if
	else
		valor=dec(getitemdecimal(j,'base'))
		valor=round(f_calc_retfuente(valor,valor,uvt, getitemstring(j,'sobre'),getitemstring(j,'cod_concep'),ii_dec_gral),ii_dec_gral)
		setitem(j,'tvalor',valor)
	end if

	if getitemstring(j,'sobre')='O' then
		setitem(1,'asumar',idw_impu1.getitemstring(donde,'cod_sobre'))
		setitem(j,'base',getitemnumber(1,'suma'))
		if base_desde<=getitemnumber(1,'suma') then
			setitem(j,'valor',round(getitemnumber(1,'suma') *  porcentaje/100,ii_dec_gral))
		else
			setitem(j,'valor',0)
		end if
	end if
next
setfilter('')
filter()

tab_2.t2_1.tab_1.tabconp.dw_concep_cont.triggerevent(rowfocuschanged!)
setredraw(true)
if rowcount()>0 then
	if is_orig='NC' or is_orig='SCT' or is_orig='-' or is_orig='RFC' then//manual
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tneto',round(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'v_siniva')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta')/*-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'t_amortiza')*/,ii_dec_gral))
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tbruto',round(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'v_siniva')+getitemnumber(1,'t_incrementa'),ii_dec_gral))//-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'tdescuentos')-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'anticipo'))
	else
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tneto',round(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tbruto')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta')/*-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'t_amortiza')*/,ii_dec_gral))
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'v_siniva',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tbruto')-getitemnumber(1,'t_incrementa'))//-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'tdescuentos')-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'anticipo'))
	end if
else
	if is_orig='NC' or is_orig='SCT' or is_orig='-' or is_orig='RFC' then//manual
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tneto',round(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'v_siniva')/*-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'t_amortiza')*/,ii_dec_gral))
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tbruto',round(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'v_siniva'),ii_dec_gral))//-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'tdescuentos')-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'anticipo'))
	else
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tneto',round(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tbruto')/*-tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemdecimal(1,'t_amortiza')*/,ii_dec_gral))
		tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'v_siniva',round(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tneto'),ii_dec_gral))
	end if
end if
tab_2.t2_1.tab_1.tabconp.dw_concep_cont.event p_itemchanged()
end event

event p_scrollto(long p_fila, string p_column);setredraw(false)
scrolltorow(p_fila)
setcolumn(p_column)
setredraw(true)
end event

event constructor;getchild('cod_concep',idw_impu1)
idw_impu1.settransobject(sqlca)
idw_impu1.retrieve()

getchild('cod_total',idw_cta1)
idw_cta1.settransobject(sqlca)//el retrieve se hace en rowfocuschanged

settransobject(sqlca)
end event

event itemchanged;long donde
string acc_ante,sobre,nulo
dec base_desde,porcentaje,actual,valor
tab_2.t2_1.tab_1.tabconp.dw_concep_cont.accepttext()

setnull(nulo)
choose case dwo.name
	case 'base'
		if not isnull(getitemstring(row,'cod_concep')) then
			donde=idw_impu1.find('cod_concep="'+getitemstring(row,'cod_concep')+'"',1,idw_impu1.rowcount())
			base_desde=idw_impu1.getitemnumber(donde,'base')
			porcentaje=idw_impu1.getitemnumber(donde,'porcentaje')
			sobre=idw_impu1.getitemstring(donde,'sobre')
			if sobre<>'I' then
				if base_desde<=dec(data) then
					
					valor=round(dec(data) *  porcentaje/100,ii_dec_gral)
					if ii_dec_gral=0 then
						valor=long(valor/ii_aprox_gral)*ii_aprox_gral +ii_aprox_gral*round((valor -long(valor/ii_aprox_gral)*ii_aprox_gral)/ii_aprox_gral,0)
					end if
					
					setitem(row,'valor',dec(data) *  porcentaje/100)
				else
					setitem(row,'valor',0)
				end if
			else
				if base_desde>dec(data) then
					setitem(row,'valor',0)
				end if
			end if
			event p_itemchanged('B')
			post event p_scrollto(row,'base')
		end if
	case 'cod_concep'
		setitem(row,'cod_total',nulo)
		setitem(row,'cod_empre',nulo)
		if idw_cta1.retrieve(is_emp,data)=1 then
			setitem(row,'cod_total',idw_cta1.getitemstring(1,'codtotal'))
			setitem(row,'cod_empre',is_emp)
			setitem(row,'tercero',idw_cta1.getitemstring(1,'tercero'))
		end if
		donde=idw_impu1.find('cod_concep="'+data+'"',1,idw_impu1.rowcount())
		setitem(row,'cod_tipo',idw_impu1.getitemstring(donde,'cod_tipo'))
		setitem(row,'accion',idw_impu1.getitemstring(donde,'accion'))
		setitem(row,'cod_concep',idw_impu1.getitemstring(donde,'cod_concep'))//hay que dejarlo
		sobre=idw_impu1.getitemstring(donde,'sobre')
		setitem(row,'sobre',sobre)
		choose case sobre
			case 'R' //bruto
				setitem(row,'base',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tbruto'))
			case 'I' //ninguno
				setitem(row,'base',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'v_siniva'))
				setitem(row,'valor',idw_impu1.getitemdecimal(donde,'porcentaje'))
			case 'O' //otro (sobre la suma de otros tipos de imp)
				setitem(1,'asumar',idw_impu1.getitemstring(donde,'cod_sobre'))
				setitem(row,'base',getitemnumber(1,'suma'))
			case 'U'   //base UVT
				if is_orig='-' or is_orig='RFC' then//manuales
					setitem(row,'base',round(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'val_bruto'),ii_dec_gral))					
				else
					double base
					if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
						setitem(row,'tvalor',0)//para que no se sume dos veces
						base=round((tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tbruto')-getitemnumber(1,'t_incrementa'))/(1+idw_iva2.getitemdecimal(donde,'porcentaje')/100),ii_dec_gral)
						base=round((base - ((base*0.40)*0.285)),ii_dec_gral)
						setitem(row,'base',base)
					else
						base=round(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'val_bruto'),ii_dec_gral)
						base=round(base - ((base*0.40)*0.285),ii_dec_gral)
						setitem(row,'base',base)
					end if
				end if
			case 'B' //base
				if is_orig='-' or is_orig='RFC' then//manuales
					setitem(row,'base',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'v_siniva'))					
				else
					if idw_impu1.getitemstring(donde,'accion')='1' then//incrementa
						setitem(row,'valor',0)//para que no se sume dos veces
						setitem(row,'base',(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tbruto')-getitemnumber(1,'t_incrementa'))/(1+idw_impu1.getitemdecimal(donde,'porcentaje')/100))
					else
						setitem(row,'base',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'v_siniva'))
					end if
				end if
			case 'N' //neto
				setitem(row,'base',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getrow(),'tneto'))
		end choose
		event itemchanged(row,object.base,string(getitemnumber(row,'base')))
		post event p_scrollto(row,'cod_concep')
	case 'cod_total'
		setitem(row,'cod_empre',is_emp)
		setitem(row,'tercero',idw_cta1.getitemstring(idw_cta1.getrow(),'tercero'))
	case 'valor'
		post event p_itemchanged('B')
		post event p_scrollto(row,'valor')
	case "tipodoc"
		setitem(getrow(),"documento",nulo)
		accepttext()
	case "documento"
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(getrow(),"tipodoc")
		if isnull(tdoc) then
			setitem(getrow(),"documento",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=data
		setnull(persona)
		SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
		FROM TERCEROS
		WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
		if isnull(persona) then
			if messagebox("Atención","Este Tercero no se encuentra, desea crearlo?",question!,yesno!,2)=2 then
				settext(getitemstring(getrow(),getcolumn()))
				return 1
			else
				st_general messObj
				messObj.valor = getitemstring(getrow(),'tipodoc')
				messObj.documento = doc
				messObj.dw_obj = this
				openwithparm(w_cfgterceros, messObj)
				if message.stringparm='' then 
					settext(getitemstring(getrow(),getcolumn()))
					return 1
				end if
			end if
		else
			setitem(getrow(),"nombre1",nom1)
			setitem(getrow(),"nombre2",nom2)
			setitem(getrow(),"apellido1",ape1)
			setitem(getrow(),"apellido2",ape2)
			setitem(getrow(),"razon_social",rsoc)
			setitem(getrow(),"persona",persona)
		end if
end choose
end event

event rowfocuschanged;if getrow()<1 then return
if not isnull(getitemstring(getrow(),'cod_empre')) then
	idw_cta1.retrieve(getitemstring(getrow(),'cod_empre'),getitemstring(getrow(),'cod_concep'))
else
	idw_cta1.retrieve(is_emp,getitemstring(getrow(),'cod_concep'))
end if
end event

type st_6 from statictext within t2_1
boolean visible = false
integer x = 2976
integer y = 1884
integer width = 334
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impuestos del Concepto:"
boolean focusrectangle = false
end type

type pb_save_tax from picturebutton within t2_1
boolean visible = false
integer x = 3099
integer y = 1532
integer width = 142
integer height = 124
integer taborder = 46
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar Impuestos"
end type

event clicked;//if f_save_tax()=-1 then
//	rollback;
//else
//	commit;
//	dw_concep_cont.resetupdate()
//	dw_timpucontra.resetupdate()
//end if
end event

type pb_traeiva from picturebutton within t2_1
boolean visible = false
integer x = 3113
integer y = 1680
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Traer IVA desde Ordenes de Compra"
end type

event clicked;//if dw_tiva.retrieve(i_ano,i_ncont,i_otrosi)>0 then
//	long donde,j
//	for j=1 to dw_tiva.rowcount()
//		donde=dw_timpucontra.find('cod_concep="'+dw_tiva.getitemstring(j,'cod_impu')+'"',1,dw_timpucontra.rowcount())
//		if donde<>0 then
//			if dw_tiva.getitemnumber(j,'base')<>dw_timpucontra.getitemnumber(donde,'base') then
//				if messagebox('Atención','El impuesto código: '+dw_tiva.getitemstring(j,'cod_impu')+' ya existe con una base distinta. Desea cambiar la base?',question!,yesno!,2)=2 then continue
//			end if
//		else
//			donde=pb_new_impu.event clicked()
//			dw_timpucontra.setitem(donde,'cod_concep',dw_tiva.getitemstring(j,'cod_impu'))
//		end if
//		dw_timpucontra.setitem(donde,'base',dw_tiva.getitemnumber(j,'base'))
//		dw_timpucontra.event itemchanged(donde,dw_timpucontra.object.base,dw_tiva.getitemstring(j,'cod_impu'))
//	next
//end if
end event

type dw_ppto from datawindow within t2_1
boolean visible = false
integer x = 5445
integer y = 4
integer width = 581
integer height = 112
integer taborder = 84
boolean bringtotop = true
string dataobject = "dw_contra_ppto_rfc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type pb_ppto from picturebutton within t2_1
integer x = 5829
integer y = 560
integer width = 146
integer height = 128
integer taborder = 74
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Distribuir Presupuesto"
end type

event clicked;Integer i, fc, fila, nconcep

dw_rela.reset()
if tab_2.t2_1.tab_fp.tabfp.dw_fpag.find("esco='1'", 1, tab_2.t2_1.tab_fp.tabfp.dw_fpag.rowCount()) = 0 then
	messageBox("Atención","Debe seleccionar una forma de pago")
	return 0
end if

if isnull(is_flujo) or is_flujo='' then 
	messagebox('Atención','Debe escoger el origen de la Recepción')
	return
end if

nconcep = 1
for fila = 1 to tab_2.t2_1.tab_fp.tabfp.dw_fpag.RowCount()
	if isNull(tab_2.t2_1.tab_fp.tabfp.dw_fpag.getItemString(fila, 'autorizado')) or tab_2.t2_1.tab_fp.tabfp.dw_fpag.getItemString(fila, 'autorizado') = '0' then Continue
	if tab_2.t2_1.tab_fp.tabfp.dw_fpag.getItemString(fila, 'esco') = '0' then Continue
	tab_2.t2_1.tab_fp.tabcau.dw_causa.setFilter( "item="+String(tab_2.t2_1.tab_fp.tabfp.dw_fpag.getItemNumber(fila,'item')) )
	tab_2.t2_1.tab_fp.tabcau.dw_causa.filter()
	if tab_2.t2_1.tab_fp.tabcau.dw_causa.rowCount()>0 then
		for i = 1 to tab_2.t2_1.tab_fp.tabcau.dw_causa.rowCount()
			fc = tab_2.t2_1.tab_1.tabconp.dw_concep_cont.find( "item="+String(tab_2.t2_1.tab_fp.tabfp.dw_fpag.getItemNumber(fila,'item'))+ "and cod_rel='" + tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemString(i,'cod_rel')+"'", 1, tab_2.t2_1.tab_1.tabconp.dw_concep_cont.rowCount())
			if fc = 0 then
				fc = tab_2.t2_1.tab_1.tabconp.dw_concep_cont.insertRow(0)
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'ano', tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'ano'))
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'ncontrato', tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'ncontrato'))
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'otrosi', tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'otrosi'))
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'item', tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'item'))
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'n_concep', nconcep)
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'cod_rel', tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemString(i,'cod_rel'))
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'tbruto',tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'monto_vigente'))
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'v_siniva', tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'monto_vigente'))
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'tneto', tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'monto_vigente'))
				nconcep = nconcep + 1
			else
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'tbruto', tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getItemNumber(fc, 'tbruto') + tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'monto_vigente'))
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'v_siniva', tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getItemNumber(fc, 'v_siniva') + tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'monto_vigente'))
				tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setItem(fc, 'tneto', tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getItemNumber(fc, 'tneto') + tab_2.t2_1.tab_fp.tabcau.dw_causa.getItemNumber(i,'monto_vigente'))
			end if
			tab_2.t2_1.tab_fp.tabcau.dw_causa.setItem(i, "nuevo", nconcep)
		next
	else
		messagebox('Atención', 'No hay causación para este pago')
		exit
	end if
next

dec a_cobrar, t_cont
long  k, ldb_donde, ldb_l
datawindow dw_viejos,dw_nuevos

dw_nuevos = tab_2.t2_3.t_ret.t_o.dw_rte
dw_nuevos.reset()
tab_2.t2_3.tab_4.t4_2.dw_tot.reset()
tab_2.t2_3.tab_4.t4_1.dw_cab.reset()
tab_2.t2_3.t5.t5_4.dw_legal_cab.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.reset()
tab_2.t2_3.t5.t5_1.dw_cpo.reset()
tab_2.t2_3.t5.t5_2.dw_anti.reset()
tab_2.t2_3.t5.t5_3.dw_tz.reset()
tab_2.t2_3.tab_4.t4_1.dw_cab.insertrow(1)

if tab_2.t2_1.tab_1.tabconp.dw_concep_cont.rowcount()>0 then
	for ldb_l=1 to tab_2.t2_1.tab_1.tabconp.dw_concep_cont.rowcount()
		fc =tab_2.t2_3.t5.t5_1.dw_cpo.find( "cod_rel='"+tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemstring(ldb_l,'cod_rel')+"'", 1, tab_2.t2_3.t5.t5_1.dw_cpo.rowCount())
		if fc=0 then
			fc = tab_2.t2_3.t5.t5_1.dw_cpo.insertrow(0)
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'clugar',is_clug_rad)
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'coddoc',is_cdoc)
			ldb_donde=ldb_l
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'item',ldb_l)
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'tipodoc',dw_terce_c.getitemstring(1,'tipodoc'))
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'documento',dw_terce_c.getitemstring(1,'documento'))
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'cod_rel',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemstring(ldb_l,'cod_rel'))
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'tbruto', tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(ldb_l,'tbruto'))
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'val_bruto', tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(ldb_l,'tbruto'))
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'tneto',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(ldb_l,'tneto'))
		else
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'tbruto', tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(ldb_l,'tbruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(fc,'tbruto'))
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'val_bruto', tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(ldb_l,'tbruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(fc,'val_bruto'))
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(fc,'tneto',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(ldb_l,'tneto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(fc,'tneto'))	
		end if
		
		st_xa_antis st_ppc
		st_ppc.dw_cpo=tab_2.t2_1.tab_1.tabconp.dw_concep_cont
		st_ppc.dw_intfaz=dw_rela
		st_ppc.dw_rten=dw_ppto
		st_ppc.ld_fila= ldb_donde
		st_ppc.ps_flujo=is_flujo
		st_ppc.ps_tipodoc=dw_cont.getItemString(dw_cont.getRow(), 'tipodoc')
		st_ppc.ps_docu=dw_cont.getItemString(dw_cont.getRow(), 'documento')
		openwithparm(w_elige_ppto_cont,st_ppc)
		if message.stringparm='-1' then 
			tab_2.t2_1.tab_1.tabconp.dw_concep_cont.reset()
			return		
		end if
	next
	
	tab_2.t2_3.t5.t5_1.dw_cpo.event p_itemchanged()
	tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'fecha_rel',datetime(today(),now()))
	tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'clugar',is_clug_rad)
	tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'coddoc',is_cdoc)
	tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'cod_flujo',is_flujo)
	tab_2.t2_3.enabled = true
	tab_2.selectedtab = 3
	tab_2.t2_3.pb_save_def.enabled = true
	ibn_nueva = true
	ibn_cambio = true
end if
end event

type t2_2 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 6075
integer height = 2064
long backcolor = 67108864
string text = "Historial"
long tabtextcolor = 33554432
string picturename = "abrir.ico"
long picturemaskcolor = 536870912
string powertiptext = "Historial de Radicaciones de facturas"
pb_anular pb_anular
pb_new pb_new
pb_find pb_find
dw_terce dw_terce
dw_hist dw_hist
pb_print pb_print
end type

on t2_2.create
this.pb_anular=create pb_anular
this.pb_new=create pb_new
this.pb_find=create pb_find
this.dw_terce=create dw_terce
this.dw_hist=create dw_hist
this.pb_print=create pb_print
this.Control[]={this.pb_anular,&
this.pb_new,&
this.pb_find,&
this.dw_terce,&
this.dw_hist,&
this.pb_print}
end on

on t2_2.destroy
destroy(this.pb_anular)
destroy(this.pb_new)
destroy(this.pb_find)
destroy(this.dw_terce)
destroy(this.dw_hist)
destroy(this.pb_print)
end on

type pb_anular from picturebutton within t2_2
integer x = 3877
integer y = 28
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "Anular Radicación"
end type

event clicked;if ibn_nueva or ibn_cambio then return

if dw_hist.rowcount()=0 then return
if not isnull(dw_hist.getitemstring(dw_hist.getrow(),'estado')) then
	messagebox('Atención','Esta radicación ya se encuentra anulada')
	return
end if
if dw_hist.getitemnumber(dw_hist.getrow(),'v_pagado')>0 then
	messagebox('Atención','Esta radicación ya tiene ordenes de pago, para poderla anular debe primero anular sus respectivas ordenes de pago')
	return
end if
if dw_hist.getitemstring(dw_hist.getrow(),'contabil')='C' then
	messagebox('Atención','Esta radicación ya se encuentra contabilizada')
	return
end if
if dw_hist.getitemnumber(dw_hist.getrow(),'nplanilla')>=0 then
	messagebox('Atención','Esta radicación ya se encuentra en Planilla de Pago')
	return
end if
if dw_hist.getitemstring(dw_hist.getrow(),'en_destino')='1' then
	messagebox('Atención','Esta radicación ya se encuentra en el módulo destino')
	return
end if
if dw_hist.getitemstring(dw_hist.getrow(),'definitivo')='0' then
	if messagebox('Atención','Esta radicación no es definitiva, desea anularla de todas formas ?',question!,yesno!,2)=2 then return
end if

st_xa_anular st_anula
st_anula.tipo='RF'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
dw_hist.setitem(dw_hist.getrow(),'estado',usuario)
dw_hist.setitem(dw_hist.getrow(),'fecha_anula',datetime(today(),now()))
dw_hist.setitem(dw_hist.getrow(),'motiv_anula',st_anula.observacion)
dw_hist.setitem(dw_hist.getrow(),'cod_anula',st_anula.motivo)

string nulo,clug_rel,err,clug_res,cdoc_res,cdoc,tdoc,docum,clug_anti,ls_crel
datetime fnulo
long nnulo,j,nrel,nres,item_cpo,nanti,item_anti, nomina, fila,l_año,l_con,l_otrs,l_item,l_filas,ldb_k
dec monto,valor

setnull(nnulo)
setnull(fnulo)
setnull(nulo)
if dw_hist.update()=-1 then
	goto error
end if

nrel=dw_hist.getitemnumber(dw_hist.getrow(),'nrelacion')
clug_rel=dw_hist.getitemstring(dw_hist.getrow(),'clugar')

UPDATE sum_mvto_cab SET en_destino = Null
FROM tesorelfact_sentradas 
WHERE 
	(((tesorelfact_sentradas.clugar)=:clug_rel) AND ((tesorelfact_sentradas.coddoc)='RFC') AND ((tesorelfact_sentradas.nrelacion)=:nrel)
	AND (tesorelfact_sentradas.numdoc_se = sum_mvto_cab.numdoc) AND (tesorelfact_sentradas.clugar_se = sum_mvto_cab.clugar) AND (tesorelfact_sentradas.coddoc_se = sum_mvto_cab.coddoc));
if sqlca.sqlcode=-1 then
	messagebox('Error actualizando sum_mvto_cab.en_destino',sqlca.sqlerrtext)
	goto error
end if

UPDATE tesorelfact_sentradas SET estado=:usuario
WHERE (((tesorelfact_sentradas.clugar)=:clug_rel) AND ((tesorelfact_sentradas.coddoc)='RFC') AND ((tesorelfact_sentradas.nrelacion)=:nrel));		
if sqlca.sqlcode=-1 then
	messagebox('Error actualizando tesorelfact_sentradas.estado',sqlca.sqlerrtext)
	goto error
end if

choose case is_orig
	case 'SCT','NC'
		tab_2.t2_1.tab_fp.tabfp.dw_fpag.setfilter('nrelacion_relfact='+string(nrel))
		tab_2.t2_1.tab_fp.tabfp.dw_fpag.filter()
		for fila=1 to tab_2.t2_1.tab_fp.tabfp.dw_fpag.rowcount()
			// Para disminuir conceptos
			l_año= tab_2.t2_1.tab_fp.tabfp.dw_fpag.getitemnumber(fila,'ano')
			l_con=tab_2.t2_1.tab_fp.tabfp.dw_fpag.getitemnumber(fila,'ncontrato')
			l_otrs=tab_2.t2_1.tab_fp.tabfp.dw_fpag.getitemnumber(fila,'otrosi')
			l_item=tab_2.t2_1.tab_fp.tabfp.dw_fpag.getitemnumber(fila,'item')
			for j=1 to tab_2.t2_3.t5.t5_1.dw_cpo.rowcount()
				setnull(ls_crel)
				ls_crel=tab_2.t2_3.t5.t5_1.dw_cpo.getitemstring(j,'cod_rel')
				l_filas=tab_2.t2_1.tab_1.tabconp.dw_concep_cont.find('ano='+string(l_año)+' and ncontrato='+string(l_con)+' and otrosi='+string(l_otrs)+' and item='+string(l_item)+" and cod_rel='"+ls_crel+"'",1,tab_2.t2_1.tab_1.tabconp.dw_concep_cont.rowcount())
				if l_filas>0 then
					setnull(monto)
					monto= tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(j,'val_bruto')		
					tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(l_filas,'v_siniva',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(l_filas,'v_siniva') -monto)		
					
					setnull(monto)
					monto= tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(j,'tbruto')
					tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(l_filas,'tbruto',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(l_filas,'tbruto') -monto)		
					
					setnull(monto)
					monto= tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(j,'tneto')
					tab_2.t2_1.tab_1.tabconp.dw_concep_cont.setitem(l_filas,'tneto',tab_2.t2_1.tab_1.tabconp.dw_concep_cont.getitemnumber(l_filas,'tneto') -monto)
				end if	
				
				//devuelve montos interfaz
				if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(tab_2.t2_3.tab_4.t4_1.dw_cab.getrow(),'definitivo')='1' then
					for ldb_k=1 to dw_rela.rowcount()
						nres=dw_rela.getitemnumber(ldb_k,'num_orig1')
						clug_res=dw_rela.getitemstring(ldb_k,'char_orig2')
						cdoc_res=dw_rela.getitemstring(ldb_k,'char_orig1')
						item_cpo=dw_rela.getitemnumber(ldb_k,'num_orig2')
						valor=round(dw_rela.getitemnumber(ldb_k,'valor'),2)
						tdoc=dw_rela.getitemstring(ldb_k,'char_orig3')
						docum=dw_rela.getitemstring(ldb_k,'char_doc3')
						update 
							pre_docu_cp 
						set 
							monto_interfaz=monto_interfaz -:valor 
						where
							coddoc=:cdoc_res and clugar=:clug_res and numdoc=:nres and item=:item_cpo;
						if sqlca.sqlcode=-1 then
							err=sqlca.sqlerrtext
							messagebox("Error actualizando 'monto_interfaz' de Pre_docu_Cp",err)
							goto error
						end if
		
						update 
							pre_dispo_ter 
						set 
							monto_reser=monto_reser - :valor 
						where
							coddocu=:cdoc_res and clugar=:clug_res and numdoc=:nres and tipodoc=:tdoc and documento=:docum;
						if sqlca.sqlcode=-1 then
							err=sqlca.sqlerrtext
							messagebox('Error actualizando pre_dispo_ter',err)
							rollback;
							return -1
						end if
					next		
				end if
			next
			tab_2.t2_1.tab_fp.tabfp.dw_fpag.setitem(fila,'clugar_relfact',nulo)
			tab_2.t2_1.tab_fp.tabfp.dw_fpag.setitem(fila,'coddoc_relfact',nulo)
			tab_2.t2_1.tab_fp.tabfp.dw_fpag.setitem(fila,'nrelacion_relfact',nnulo)
			tab_2.t2_1.tab_fp.tabfp.dw_fpag.setitem(fila,'causa_impu',nulo)
			
		next
		tab_2.t2_1.tab_fp.tabfp.dw_fpag.setfilter('')
		tab_2.t2_1.tab_fp.tabfp.dw_fpag.filter()	
		if tab_2.t2_1.tab_1.tabconp.dw_concep_cont.update()=-1 then goto error
		if tab_2.t2_1.tab_fp.tabfp.dw_fpag.update()=-1 then goto error	
		
		///Actualoia monto contrato
		monto=dw_hist.getitemnumber(dw_hist.getrow(),'tbruto')
		tab_2.t2_1.dw_cont.setitem(tab_2.t2_1.dw_cont.getrow(),'acum_cobro',tab_2.t2_1.dw_cont.getitemnumber(tab_2.t2_1.dw_cont.getrow(),'cobro_ori') -monto)
		if tab_2.t2_1.dw_cont.update()=-1 then goto error
		
	case '-'
		dw_hist.setitem(dw_hist.getrow(),'estado',usuario)//solo de mostrario
	case 'RFC'
		dw_hist.setitem(dw_hist.getrow(),'estado',usuario)//solo de mostrario
		//hay que dejar el estado de los impuestos otra vez
		update tesorelfact_rete set clug_recep_pago=null , cdoc_recep_pago=null,nrel_recep_pago=null,item_recep_pago=null
		where clug_recep_pago=:clug_rel and nrel_recep_pago=:nrel;
		if sqlca.sqlcode=-1 then
			messagebox('Error actualizando tesorelfact_rete',sqlca.sqlerrtext)
			goto error
		end if
	case 'PR','PDI','NM' //reser//dispo
		//toca borrar de mod_relacion_orig
		//cambiar en_destino de reserva_cb
		for j=1 to dw_rela.rowcount()
			nres=dw_rela.getitemnumber(j,'num_orig1')
			clug_res=dw_rela.getitemstring(j,'char_orig2')
			cdoc_res=dw_rela.getitemstring(j,'char_orig1')
			item_cpo=dw_rela.getitemnumber(j,'num_orig2')
			valor=round(dw_rela.getitemnumber(j,'valor'),2)
			tdoc=dw_rela.getitemstring(j,'char_orig3')
			docum=dw_rela.getitemstring(j,'char_doc3')
			nomina = dw_rela.getitemNumber(j,'num_orig3')
			if dw_hist.getitemstring(dw_hist.getrow(),'definitivo')='1' then
				update pre_docu_cp set monto_interfaz=monto_interfaz -:valor where
				coddoc=:cdoc_res and clugar=:clug_res and numdoc=:nres and item=:item_cpo;
				if sqlca.sqlcode=-1 then
					err=sqlca.sqlerrtext
					messagebox("Error actualizando 'monto_interfaz' de Pre_docu_Cp",err)
					goto error
				end if
				update pre_dispo_ter set monto_reser=monto_reser - :valor where
				coddocu=:cdoc_res and clugar=:clug_res and numdoc=:nres and tipodoc=:tdoc and documento=:docum;
				if sqlca.sqlcode=-1 then
					err=sqlca.sqlerrtext
					messagebox('Error actualizando pre_dispo_ter',err)
					rollback;
					return -1
				end if 
			end if
			if nomina > 0 then
				choose case sqlca.dbms
					case 'ODBC'
						UPDATE NOM_CPO INNER JOIN CONTRA_PRESU ON (NOM_CPO.item_fp = CONTRA_PRESU.ITEM) AND (NOM_CPO.otrosi = CONTRA_PRESU.OTROSI) AND (NOM_CPO.ncontrato = CONTRA_PRESU.NCONTRATO) AND (NOM_CPO.ano = CONTRA_PRESU.ANO) 
						SET NOM_CPO.presupuesto = '0'
						WHERE (NOM_CPO.NUM_NOMINA=:nomina) AND (CONTRA_PRESU.coddocu_reser=:cdoc_res) AND (CONTRA_PRESU.clugar_reser=:clug_res) AND (CONTRA_PRESU.numdoc_reser=:nres);
					case 'SYC Adaptive Server Enterprise','MSS Microsoft SQL Server','OLE DB'
						UPDATE nom_cpo SET NOM_CPO.presupuesto = '0' 
						from NOM_CPO INNER JOIN CONTRA_PRESU ON (NOM_CPO.item_fp = CONTRA_PRESU.ITEM) AND (NOM_CPO.otrosi = CONTRA_PRESU.OTROSI) AND (NOM_CPO.ncontrato = CONTRA_PRESU.NCONTRATO) AND (NOM_CPO.ano = CONTRA_PRESU.ANO) 
						WHERE (NOM_CPO.NUM_NOMINA=:nomina) AND (CONTRA_PRESU.coddocu_reser=:cdoc_res) AND (CONTRA_PRESU.clugar_reser=:clug_res) AND (CONTRA_PRESU.numdoc_reser=:nres);
					end choose
	
				if sqlca.sqlcode=-1 then
					err=sqlca.sqlerrtext
					rollback;
					messagebox('Error actualizando nom_cpo desde nómina Prestación Servicios',err)
					return -1
				end if
			end if
		next
		//fin interface
		dw_hist.setitem(dw_hist.getrow(),'estado',usuario)//solo de mostrario
end choose
datawindow dw_t
dw_t=tab_2.t2_3.t5.t5_3.dw_tz
dw_t.setfilter('')
dw_t.filter()

setnull(nnulo)


for j=1 to dw_t.rowcount()
	clug_anti=dw_t.getitemstring(j,'clugar_anti')
	nanti=dw_t.getitemnumber(j,'nrelacion_anti')
	item_anti=dw_t.getitemnumber(j,'item_anti')
	valor=dw_t.getitemnumber(j,'v_amortizado')
	update tesorelfactcpo set v_amortizado=v_amortizado - :valor where
	clugar=:clug_anti and coddoc='RFC' and nrelacion=:nanti and item=:item_anti;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando tesorelfactcpo",sqlca.sqlerrtext)
		goto error
	end if
next
dw_t=tab_2.t2_3.t5.t5_2.dw_anti
dw_t.setfilter('')
dw_t.filter()
for j=1 to dw_t.rowcount()
	dw_t.setitem(j,'clug_anticipo',nulo)
	dw_t.setitem(j,'cdoc_anticipo',nulo)
	dw_t.setitem(j,'nrel_anticipo',nnulo)
	dw_t.setitem(j,'item_anticipo',nnulo)
next
if dw_t.update()=-1 then
	goto error
end if
if dw_hist.getitemstring(dw_hist.getrow(),'definitivo')='1' then
	dw_t=tab_2.t2_3.t_ret.t_o.dw_rte
	dw_t.setfilter('sobre="P"')
	dw_t.filter()
	for j=1 to dw_t.rowcount()
		cdoc=dw_t.getitemstring(j,'codcaja')
		docum=dw_t.getitemstring(j,'coddoc_ing')
		clug_anti=dw_t.getitemstring(j,'clugar_ing')
		nanti=dw_t.getitemnumber(j,'ningreso')
		valor=dw_t.getitemnumber(j,'tvalor')
		update tesocajaingreso set valor_recepcion = valor_recepcion - :valor where 
		codcaja=:cdoc and clugar=:clug_anti and coddoc=:docum and ningreso =:nanti;
		if sqlca.sqlcode=-1 then 
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando tesocajaingreso',err)
			goto error
		end if
	next
end if
commit;
return
error:
rollback;
dw_hist.setitem(dw_hist.getrow(),'estado',nulo)
dw_hist.setitem(dw_hist.getrow(),'fecha_anula',fnulo)
dw_hist.setitem(dw_hist.getrow(),'motiv_anula',nulo)
end event

type pb_new from picturebutton within t2_2
integer x = 3721
integer y = 28
integer width = 146
integer height = 128
integer taborder = 34
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Nueva radicación"
end type

event clicked;if ibn_nueva then return
if isnull(is_flujo) or is_flujo='' then 
	messagebox('Atención','Debe escoger el origen de la Recepción')
	return
end if
////
tab_2.t2_3.tab_4.t4_1.dw_cab.reset()
tab_2.t2_3.tab_4.t4_2.dw_tot.reset()
tab_2.t2_3.t5.t5_1.dw_cpo.reset()
tab_2.t2_3.t5.t5_4.dw_legal_cab.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.reset()
tab_2.t2_3.t5.t5_2.dw_anti.reset()
tab_2.t2_3.t5.t5_3.dw_tz.reset()
tab_2.t2_3.t_ret.t_o.dw_rte.reset()
tab_2.t2_4.dw_ord_pag.reset()
tab_2.t2_3.t5.tabpage_1.dw_entradas.reset()
dw_rela.reset()
setnull(idb_nrad)
///////


choose case is_orig
	case 'SCT','NC'//contratos
	case 'RFC'//pago de impuestos
		open(w_pago_impuesto)
	case '-' //manual
		if isnull(dw_terce.getitemstring(1,'documento')) or dw_terce.getitemstring(1,'documento')='' then return
		f_nueva_manu()
	case 'PR'//reserv
		openwithparm(w_intfaz_relfact,is_flujo)
	case 'PDI'//dispon
		if isnull(dw_terce.getitemstring(1,'documento')) or dw_terce.getitemstring(1,'documento')='' then return
		openwithparm(w_intfaz_relfact,is_flujo)
	case 'NM'
		open(w_lleva_nom_relfac)
	case 'NMS'
		open(w_lleva_nomina)
end choose
tab_2.t2_3.pb_save.enabled=true
tab_2.t2_3.pb_save_def.enabled=true
idw_concep.retrieve(is_emp,'R','1')
idw_concep_cont.retrieve(is_emp,'R','1')
idw_concep_legal.retrieve(is_emp,'R','1')
idw_concep_legal_1.retrieve(is_emp,'R','1')

end event

type pb_find from picturebutton within t2_2
integer x = 3470
integer y = 24
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &b"
boolean originalsize = true
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar Tercero [Alt+B]"
end type

event clicked;choose case f_pregunta()
	case 1
		if is_orig='SCT' or is_orig='NC' then
			if grabar('1')=-1 then return 1
		else
			if grabar('0')=-1 then return 1
		end if
	case 2
		ibn_cambio=false
		ibn_nueva=false
	case 3
		return 1
end choose
g_tercerodesde=1
openwithparm(w_buscater,dw_terce)
dw_terce.setcolumn('documento')
dw_terce.event itemchanged(1,dw_terce.object.documento,dw_terce.getitemstring(1,'documento'))
end event

type dw_terce from datawindow within t2_2
integer x = 59
integer y = 20
integer width = 3191
integer height = 136
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
modify('tipodoc.validationmsg="No puede cambiar el tercero sin guardar"')
modify('documento.validationmsg="Tercero no existe o ya no lo puede cambiar sin guardar"')
insertrow(1)
end event

event itemchanged;if isnull(data) then 
	dw_hist.event rowfocuschanged(0)
	return
end if
choose case f_pregunta()
	case 1
		if is_orig='SCT' or is_orig='NC' then
			if grabar('1')=-1 then return 1
		else
			if grabar('0')=-1 then return 1
		end if
	case 2
		ibn_cambio=false
		ibn_nueva=false
	case 3
		return 1
end choose
accepttext()
string doc,tdoc
tdoc=getitemstring(1,"tipodoc")
doc=getitemstring(1,"documento")
string snulo
setnull(snulo)
if dwo.name="tipodoc" and doc <> "" then
	setitem(1,"documento",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,'tel1',snulo)
	setitem(1,'persona',snulo)
	return
end if
if dwo.name="documento" and doc = "" then 
	setitem(1,'nombre1',snulo)
	setitem(1,'persona',snulo)
end if
if dwo.name="documento" and doc <> "" then
	if retrieve(tdoc,doc)=0 then
		insertrow(1)
		setitem(1,1,tdoc)
		setitem(1,2,doc)
		messagebox("Atención",'Tercero no existe')
	else
		dw_hist.reset()
		dw_hist.retrieve('RFC',is_orig,tdoc,doc)
	end if
end if
end event

type dw_hist from datawindow within t2_2
integer x = 55
integer y = 172
integer width = 6007
integer height = 1864
integer taborder = 31
string title = "none"
string dataobject = "dw_hist_tesrelfac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_2.t2_3.tab_4.t4_1.dw_cab.reset()
tab_2.t2_3.tab_4.t4_2.dw_tot.reset()
tab_2.t2_3.t5.t5_1.dw_cpo.reset()
tab_2.t2_3.t5.t5_4.dw_legal_cab.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.reset()
tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.reset()
tab_2.t2_3.t5.t5_2.dw_anti.reset()
tab_2.t2_3.t5.t5_3.dw_tz.reset()
tab_2.t2_3.t_ret.t_o.dw_rte.reset()
tab_2.t2_4.dw_ord_pag.reset()
tab_2.t2_3.t5.tabpage_1.dw_entradas.reset()
dw_rela.reset()
if getrow()<1 then return
long nrel,cual
string clug,tipo,ls_td,ls_doc


nrel=getitemnumber(dw_hist.getrow(),'nrelacion')
clug=getitemstring(dw_hist.getrow(),'clugar')
tipo=getitemstring(dw_hist.getrow(),'tiporelacion')
idb_nrad=nrel
tab_2.t2_3.tab_4.t4_1.dw_cab.retrieve(clug,is_cdoc,nrel)
tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.retrieve(clug,is_cdoc,nrel)
tab_2.t2_3.tab_4.t4_2.dw_tot.retrieve(clug,is_cdoc,nrel)
dw_rela.retrieve(clug,is_cdoc,nrel)
int jaer
jaer=dw_rela.rowcount()
tab_2.t2_3.t_ret.t_o.dw_rte.retrieve(clug,is_cdoc,nrel)
tab_2.t2_3.t_ret.t_c.dw_rtem.retrieve(clug,is_cdoc,nrel)
tab_2.t2_3.t5.t5_2.dw_anti.retrieve(clug,is_cdoc,nrel)
tab_2.t2_3.t5.t5_3.dw_tz.retrieve(clug,is_cdoc,nrel)
tab_2.t2_3.t5.tabpage_1.dw_entradas.retrieve(clug,is_cdoc,nrel)

idb_ncont=dw_hist.getitemnumber(dw_hist.getrow(),'ncontrato')
idb_otrosi=dw_hist.getitemnumber(dw_hist.getrow(),'otrosi')
idb_ano=dw_hist.getitemnumber(dw_hist.getrow(),'ano')	

if not isnull(idb_ncont) then
	SELECT contra.tipodoc, contra.documento into :ls_td,:ls_doc
	FROM contra
	WHERE (((contra.ano)=:idb_ano) AND ((contra.ncontrato)=:idb_ncont) AND ((contra.otrosi)=:idb_otrosi));	
	tab_2.t2_1.dw_terce_c.setitem(1,'tipodoc',ls_td)
	tab_2.t2_1.dw_terce_c.setitem(1,'documento',ls_doc)	
	tab_2.t2_1.dw_terce_c.event itemchanged(1,tab_2.t2_1.dw_terce_c.object.documento,tab_2.t2_1.dw_terce_c.getitemstring(1,'documento'))
	tab_2.t2_3.pb_save.enabled=false

	cual=tab_2.t2_1.dw_cont.find('ano='+string(idb_ano)+' and ncontrato='+string(idb_ncont)+' and  otrosi='+string(idb_otrosi) ,1, tab_2.t2_1.dw_cont.rowcount())
	if cual>0 then tab_2.t2_1.dw_cont.scrolltorow(cual)
	
	cual=tab_2.t2_1.tab_fp.tabfp.dw_fpag.find("clugar_relfact='"+clug+ "' and  coddoc_relfact='"+is_cdoc+ "' and nrelacion_relfact="+string(nrel),1,tab_2.t2_1.tab_fp.tabfp.dw_fpag.rowcount())
	if cual>0 then tab_2.t2_1.tab_fp.tabfp.dw_fpag.scrolltorow(cual)	
end if

tab_2.t2_3.t5.t5_1.dw_cpo.retrieve(clug,is_cdoc,nrel)//despues de dw_rte para que haga el rowfocuschanged
tab_2.t2_4.dw_ord_pag.retrieve(clug,is_cdoc,nrel)
if not isnull(getitemstring(getrow(),'estado')) then return

//para controlar que no puedan hacer legalizaciones si no son anticipos
if tipo='2' then 
	tab_2.t2_3.t5.t5_4.dw_legal_cab.retrieve(clug,is_cdoc,nrel)
	ii_item_dev=tab_2.t2_3.t5.t5_4.dw_legal_cab.getitemnumber(tab_2.t2_3.t5.t5_4.dw_legal_cab.getrow(),'item')
	tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.retrieve(clug,is_cdoc,nrel)
	in_valor_b=tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.GetRow(),'tbruto')
	tab_2.t2_3.t5.t5_4.pb_new_lega.enabled=true
	tab_2.t2_3.t5.t5_4.pb_save_lega.enabled=true
	tab_2.t2_3.t5.t5_4.pb_save_legal.enabled=true
		//tab_2.t2_3.t5.t5_4.pb_save_legal.enabled=true
end if
	
tab_2.t2_1.tab_fp.SelectTab(1)
tab_2.t2_1.tab_fp.tabfp.dw_fpag.SetFocus()
tab_2.t2_1.tab_fp.tabfp.dw_fpag.SetColumn ("item")
end event

event rowfocuschanging;choose case f_pregunta()
	case 1
		if grabar('0')=-1 then return 1
	case 2
		ibn_cambio=false
		ibn_nueva=false
	case 3
		return 1
end choose
return 0
end event

event clicked;if row>0 and row<>getrow() then setrow(row)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type pb_print from pb_report within t2_2
integer x = 4027
integer y = 28
integer taborder = 60
boolean bringtotop = true
integer textsize = 0
integer weight = 0
fontpitch fontpitch = default!
fontfamily fontfamily = anyfont!
string facename = ""
string powertiptext = "Reimprimir Radicación de Factura"
string cod_rep = "RFC"
string nombre_rep = "Recepción de Facturas"
string tipo_rep = "documento!"
long tam_imp = 0
integer num_cop = 0
end type

event clicked;call super::clicked;if dw_hist.rowcount()=0 or (dw_hist.dataobject='dw_det_tesrelfac' and (is_orig='SCT' or is_orig='NC')) then return
any par[3]
par[1]=dw_hist.getitemstring(dw_hist.getrow(),'clugar')
par[2]=is_cdoc
par[3]=dw_hist.getitemnumber(dw_hist.getrow(),'nrelacion')
imprimir(par,'','0')
end event

type t2_3 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 6075
integer height = 2064
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "calculator.ico"
long picturemaskcolor = 536870912
string powertiptext = "Detalle de la Radicación"
t_ret t_ret
t5 t5
pb_save_def pb_save_def
pb_save pb_save
st_4 st_4
tab_4 tab_4
cbx_1 cbx_1
pb_new_tax pb_new_tax
pb_del_tax pb_del_tax
pb_ajusta pb_ajusta
end type

on t2_3.create
this.t_ret=create t_ret
this.t5=create t5
this.pb_save_def=create pb_save_def
this.pb_save=create pb_save
this.st_4=create st_4
this.tab_4=create tab_4
this.cbx_1=create cbx_1
this.pb_new_tax=create pb_new_tax
this.pb_del_tax=create pb_del_tax
this.pb_ajusta=create pb_ajusta
this.Control[]={this.t_ret,&
this.t5,&
this.pb_save_def,&
this.pb_save,&
this.st_4,&
this.tab_4,&
this.cbx_1,&
this.pb_new_tax,&
this.pb_del_tax,&
this.pb_ajusta}
end on

on t2_3.destroy
destroy(this.t_ret)
destroy(this.t5)
destroy(this.pb_save_def)
destroy(this.pb_save)
destroy(this.st_4)
destroy(this.tab_4)
destroy(this.cbx_1)
destroy(this.pb_new_tax)
destroy(this.pb_del_tax)
destroy(this.pb_ajusta)
end on

type t_ret from tab within t2_3
event create ( )
event destroy ( )
integer x = 18
integer y = 1540
integer width = 5984
integer height = 512
integer taborder = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean pictureonright = true
tabposition tabposition = tabsonleft!
integer selectedtab = 1
t_o t_o
t_c t_c
end type

on t_ret.create
this.t_o=create t_o
this.t_c=create t_c
this.Control[]={this.t_o,&
this.t_c}
end on

on t_ret.destroy
destroy(this.t_o)
destroy(this.t_c)
end on

type t_o from userobject within t_ret
event create ( )
event destroy ( )
integer x = 128
integer y = 16
integer width = 5838
integer height = 480
long backcolor = 67108864
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
dw_rte dw_rte
end type

on t_o.create
this.dw_rte=create dw_rte
this.Control[]={this.dw_rte}
end on

on t_o.destroy
destroy(this.dw_rte)
end on

type dw_rte from datawindow within t_o
event p_itemchanged ( string p_cual )
event p_scrollto ( long p_fila,  string p_column )
integer x = 18
integer y = 4
integer width = 5586
integer height = 468
integer taborder = 40
string title = "none"
string dataobject = "dw_trans_retencion_todos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(string p_cual);accepttext()
long j,donde,donde2,k,item
dec base_desde,porcentaje,iva,v_siniva
datawindow dw_tot,dw_1
dw_tot=tab_2.t2_3.tab_4.t4_2.dw_tot
dw_tot.setredraw(false)
for j=1 to dw_tot.rowcount()
	dw_tot.setitem(j,'valor',0)
next
tab_2.t2_3.t5.t5_1.dw_cpo.accepttext()
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.accepttext()
setredraw(false)
dw_1=tab_2.t2_3.t5.t5_1.dw_cpo
for j=1 to rowcount()
	if getitemstring(j,'accion')='1' then //incrementa
			if p_cual='B' then //base
			iva+=getitemnumber(j,'tvalor')
		else
			donde=idw_iva2.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_iva2.rowcount())
			porcentaje+=idw_iva2.getitemnumber(donde,'porcentaje')
		end if
	end if
next
if is_orig<>'-' and is_orig<>'RFC' then 
	if p_cual='C' then
		v_siniva=round(dw_1.getitemNumber(dw_1.getrow(),'tbruto')/(1+porcentaje/100),ii_dec_gral)
		if ii_dec_gral=0 then
			v_siniva=long(v_siniva/ii_aprox_gral)*ii_aprox_gral +ii_aprox_gral*round((v_siniva -long(v_siniva/ii_aprox_gral)*ii_aprox_gral)/ii_aprox_gral,0)
		end if
		if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' then return
		dw_1.setitem(dw_1.getrow(),'val_bruto',v_siniva)
	else
		v_siniva=round(dw_1.getitemNumber(dw_1.getrow(),'tbruto')-iva,ii_dec_gral)
		if ii_dec_gral=0 then
			v_siniva=long(v_siniva/ii_aprox_gral)*ii_aprox_gral +ii_aprox_gral*round((v_siniva -long(v_siniva/ii_aprox_gral)*ii_aprox_gral)/ii_aprox_gral,0)
		end if
		if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' then return
		dw_1.setitem(dw_1.getrow(),'val_bruto',v_siniva)
	end if
end if
for j=1 to rowcount()
	if p_cual='B' and j=getrow() then continue
	donde=idw_iva2.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_iva2.rowcount())
	base_desde=idw_iva2.getitemnumber(donde,'base')
	porcentaje=idw_iva2.getitemnumber(donde,'porcentaje')
	if getitemstring(j,'sobre')<>'I' and getitemstring(j,'sobre')<>'P' and getitemstring(j,'sobre')<>'U' then
		if base_desde<=getitemdecimal(j,'base') then
			setitem(j,'tvalor',round(getitemdecimal(j,'base') *  porcentaje/100,ii_dec_gral))
		else
			setitem(j,'tvalor',0)
		end if
	end if
	if getitemstring(j,'sobre')='O' then
		setitem(1,'asumar',idw_iva2.getitemstring(donde,'cod_sobre'))
		setitem(j,'base',getitemnumber(1,'suma'))
		if base_desde<=getitemnumber(1,'suma') then
			setitem(j,'tvalor',round(getitemnumber(1,'suma') *  porcentaje/100,ii_dec_gral))
		else
			setitem(j,'tvalor',0)
		end if
	end if
next
setfilter('')
filter()
for j=1 to rowcount()
	donde2=dw_tot.find("cod_tipo='"+getitemstring(j,'cod_tipo')+"'",1,dw_tot.rowcount())
	if donde2=0 then 
		donde2=dw_tot.insertrow(0)
		dw_tot.setitem(donde2,'clugar',tab_2.t2_3.t5.t5_1.dw_cpo.getitemstring(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'clugar'))//mejor asi por si es uno viejo de otro lugar
		dw_tot.setitem(donde2,'coddoc',tab_2.t2_3.t5.t5_1.dw_cpo.getitemstring(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'coddoc'))
		dw_tot.setitem(donde2,'nrelacion',tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'nrelacion'))
		for k=1 to dw_tot.rowcount()
			item=dw_tot.find('item='+string(k),1,dw_tot.rowcount())
			if item=0 then exit
		next
		dw_tot.setitem(donde2,'item',k)
	end if
	dw_tot.setitem(donde2,'valor',round(dw_tot.getitemdecimal(donde2,'valor')+getitemdecimal(j,'tvalor'),ii_dec_gral))
	dw_tot.setitem(donde2,'cod_tipo',getitemstring(j,'cod_tipo'))
next
dw_tot.setredraw(true)
setredraw(true)
tab_2.t2_3.t5.t5_1.dw_cpo.triggerevent(rowfocuschanged!)
if rowcount()>0 then
	if is_orig='NC' or is_orig='SCT' or is_orig='-' or is_orig='RFC' then//manual
		if ii_legal=0 then 	
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,ii_dec_gral))
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+getitemnumber(1,'t_incrementa'),ii_dec_gral))//-t5.t5_1.dw_cpo.getitemdecimal(1,'tdescuentos')-t5.t5_1.dw_cpo.getitemdecimal(1,'anticipo'))
		else
			tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tneto_legal',round(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tbruto_legal')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta'),ii_dec_gral))
		end if
	else
		setredraw(true)
//		if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' then return
		if ii_legal=0 then 
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,ii_dec_gral))
			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto',tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')-getitemnumber(1,'t_incrementa'))//-t5.t5_1.dw_cpo.getitemdecimal(1,'tdescuentos')-t5.t5_1.dw_cpo.getitemdecimal(1,'anticipo'))
		else
			tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tneto_legal',round(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tbruto_legal')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta'),ii_dec_gral))
		end if
	end if
else
	if is_orig='NC' or is_orig='SCT' or is_orig='-' or is_orig='RFC' then//manual
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,ii_dec_gral))
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto'),ii_dec_gral))//-t5.t5_1.dw_cpo.getitemdecimal(1,'tdescuentos')-t5.t5_1.dw_cpo.getitemdecimal(1,'anticipo'))
	else
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,ii_dec_gral))
		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto'),ii_dec_gral))
	end if
end if
setredraw(true)
tab_2.t2_3.t5.t5_1.dw_cpo.event p_itemchanged()

end event

event p_scrollto(long p_fila, string p_column);setredraw(false)
scrolltorow(p_fila)
setcolumn(p_column)
setredraw(true)


end event

event constructor;getchild('cod_concep',idw_iva2)
idw_iva2.settransobject(sqlca)
idw_iva2.retrieve()

getchild('cod_total',idw_cta2)
idw_cta2.settransobject(sqlca)
settransobject(sqlca)
end event

event clicked;if row<1 then return
if row<>getrow() then setrow(row)
end event

event doubleclicked;string columna
columna=dwo.name
if columna="documento" then
	g_tercerodesde=19
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		event itemchanged(row,dwo,getitemstring(getrow(),"documento"))
	end if
end if

end event

event itemchanged;long donde,nnulo
string acc_ante,sobre,nulo,c_con
dec dedu,porcentaje,actual,valor,uvt,pb_uvt,pc_uvt,pp_uvt,pp_tope
dec base,base_final,base_desde,pd_uvt,ss,d_dep,dedu_depe,uvt_act
dec tope_dep
int cu

tab_2.t2_3.t5.t5_1.dw_cpo.accepttext()
dw_rte.accepttext()
setnull(nulo)
setnull(nnulo)

choose case dwo.name
	case 'base'
		if not isnull(getitemstring(row,'cod_concep')) then
			donde=idw_iva2.find('cod_concep="'+getitemstring(row,'cod_concep')+'"',1,idw_iva2.rowcount())
			base_desde=idw_iva2.getitemnumber(donde,'base')
			porcentaje=idw_iva2.getitemnumber(donde,'porcentaje')
			sobre=idw_iva2.getitemstring(donde,'sobre')
			uvt_act=idw_iva2.getitemnumber(donde,'uvt')
			pb_uvt=idw_iva2.getitemnumber(donde,'porce_baseuvt')
			pc_uvt=idw_iva2.getitemnumber(donde,'porce_cotiuvt')
			pp_uvt=idw_iva2.getitemnumber(donde,'porce_parauvt')
			pd_uvt=idw_iva2.getitemnumber(donde,'porce_depuvt')
			tope_dep=idw_iva2.getitemnumber(donde,'tope_dep')
			if sobre<>'I' and sobre<>'P' then
				if sobre<>'U' and sobre<>'V' then
					if base_desde<=dec(data) then
						valor=round(dec(data) *  porcentaje/100,ii_dec_gral)
						if ii_dec_gral=0 then
							valor=long(valor/ii_aprox_gral)*ii_aprox_gral +ii_aprox_gral*round((valor -long(valor/ii_aprox_gral)*ii_aprox_gral)/ii_aprox_gral,0)
						end if
						setitem(row,'tvalor',round(dec(data) *  porcentaje/100,ii_dec_gral))
					else
						setitem(row,'tvalor',0)
					end if
				else
					c_con=getitemstring(row,'cod_concep')
					SELECT count(1) into :cu FROM nom_retefuente
					WHERE (((cod_concep)=:c_con));
					If cu>0 then
						 If sobre<> 'U' then
							base=round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),ii_dec_gral)
						else
							pb_uvt=idw_iva2.getitemnumber(donde,'porce_baseuvt')
							pc_uvt=idw_iva2.getitemnumber(donde,'porce_cotiuvt')
							pp_tope=idw_iva2.getitemnumber(donde,'base')
							pp_uvt=idw_iva2.getitemnumber(donde,'porce_parauvt')
							pd_uvt=idw_iva2.getitemnumber(donde,'porce_depuvt')
							uvt_act=idw_iva2.getitemnumber(donde,'uvt')
							tope_dep=idw_iva2.getitemnumber(donde,'tope_dep')
							base=round(dec(data),ii_dec_gral)
							dedu_depe=0
							if dw_rte.getitemstring(getrow(),'depe')='1' then
								if isnull(pd_uvt) then
									Messagebox('Atención','No hay pordcentaje de deuducción de dependientes en el concepto verifique')
									return -1
								end if	
								dedu_depe=f_aproxima_a((base * pd_uvt/100), 100)
								if dedu_depe>=tope_dep then dedu_depe=tope_dep
							end if
							base_final=round(( base -ss  - dedu - dedu_depe),0)
							if base_final >=  pp_tope then 
								base_final=dedu - pp_tope
							end if
							base = base_final
							setnull(base_final)
						end if
						setitem(row,'base',base)				
						valor=f_calc_retfuente( base, base,uvt_act, getitemstring(donde,'sobre'),c_con,2/*ii_dec_gral*/)
						valor=f_aproxima_a(valor,1000)
						if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
							setitem(row,'tvalor',valor)//para que no se sume dos veces
							setitem(row,'base',base)
						else
							setitem(row,'tvalor',valor)//para que no se sume dos veces
							setitem(row,'base',base)
						end if
					else
						sobre=idw_iva2.getitemstring(donde,'sobre')
						uvt_act=idw_iva2.getitemnumber(donde,'uvt')
						pb_uvt=idw_iva2.getitemnumber(donde,'porce_baseuvt')
						pc_uvt=idw_iva2.getitemnumber(donde,'porce_cotiuvt')
						pp_uvt=idw_iva2.getitemnumber(donde,'porce_parauvt')
						pd_uvt=idw_iva2.getitemnumber(donde,'porce_depuvt')	
						uvt=idw_iva2.getitemnumber(donde,'uvt')
						tope_dep=idw_iva2.getitemnumber(donde,'tope_dep')
						if is_orig='-' or is_orig='RFC' then//manuales
							setitem(row,'base',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),ii_dec_gral))					
						else
							if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
								setitem(row,'tvalor',0)//para que no se sume dos veces
								base=round((tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza')-getitemnumber(1,'t_incrementa'))/(1+idw_iva2.getitemdecimal(donde,'porcentaje')/100),ii_dec_gral)
								base=round(((base * pb_uvt)- ((base * pc_uvt) * pp_uvt)),ii_dec_gral)
								setitem(row,'base',base)
							else
								base=round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),ii_dec_gral)
								base=round(((base*pb_uvt)- ((base*pc_uvt)*pp_uvt)),ii_dec_gral)
								setitem(row,'base',base)
							end if
						end if
					end if
				end if
			else
				if base_desde>dec(data) then
					setitem(row,'tvalor',0)
				end if

			end if
				event p_itemchanged('B')
				post event p_scrollto(row,'base')		
		end if
	
case 'cod_concep'
		setitem(row,'cod_total',nulo)
		setitem(row,'cod_empre',nulo)
		setitem(row,'codcaja',nulo)
		setitem(row,'clugar_ing',nulo)
		setitem(row,'coddoc_ing',nulo)
		setitem(row,'ningreso',nnulo)
		if idw_cta2.retrieve(is_emp,data)=1 then
			setitem(row,'cod_total',idw_cta2.getitemstring(1,'codtotal'))
			setitem(row,'cod_empre',is_emp)
			setitem(row,'tercero',idw_cta2.getitemstring(1,'tercero'))
		end if
		donde=idw_iva2.find('cod_concep="'+data+'"',1,idw_iva2.rowcount())
		setitem(row,'cod_tipo',idw_iva2.getitemstring(donde,'cod_tipo'))
		setitem(row,'accion',idw_iva2.getitemstring(donde,'accion'))
		setitem(row,'cod_concep',idw_iva2.getitemstring(donde,'cod_concep'))//hay que dejarlo
		setitem(row,'cartipo',idw_iva2.getitemstring(donde,'cartipo'))
		sobre=idw_iva2.getitemstring(donde,'sobre')
		setitem(row,'sobre',sobre)
		choose case sobre
			case 'R' //bruto
				setitem(row,'base',tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto'))
			case 'I' //ninguno
				setitem(row,'base',tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos'))
				setitem(row,'tvalor',idw_iva2.getitemdecimal(donde,'porcentaje'))
			case 'O' //otro (sobre la suma de otros tipos de imp)
				setitem(1,'asumar',idw_iva2.getitemstring(donde,'cod_sobre'))
				setitem(row,'base',getitemnumber(1,'suma'))
			case 'U' ,'V'  //base UVT
				donde=idw_iva2.find('cod_concep="'+data+'"',1,idw_iva2.rowcount())
				c_con=getitemstring(row,'cod_concep')
				SELECT count(1) into :cu FROM nom_retefuente
				WHERE (((cod_concep)=:c_con));
				If cu>0 then
					 If sobre<> 'U' then
				    		base=round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),ii_dec_gral)
					else
						pb_uvt=idw_iva2.getitemnumber(donde,'porce_baseuvt')
						pc_uvt=idw_iva2.getitemnumber(donde,'porce_cotiuvt')
						pp_tope=idw_iva2.getitemnumber(donde,'base')
						pp_uvt=idw_iva2.getitemnumber(donde,'porce_parauvt')
						pd_uvt=idw_iva2.getitemnumber(donde,'porce_depuvt')	
						uvt_act=idw_iva2.getitemnumber(donde,'uvt')
						tope_dep=idw_iva2.getitemnumber(donde,'tope_dep')
						base=round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),ii_dec_gral)
						dedu=round((base * pb_uvt/100),0)
						dedu_depe=0
						if dw_rte.getitemstring(getrow(),'depe')='1' then
							dedu_depe=f_aproxima_a((base * pd_uvt/100), 100)
							if dedu_depe>=tope_dep then dedu_depe=tope_dep
						end if
						ss=f_aproxima_a((dedu * pc_uvt/100),10)
						dedu=( (base - ss) *pp_uvt/100)
						dedu=f_aproxima_a(( (base - ss - dedu_depe) *pp_uvt/100),1000)
						base_final=round(( base -ss  - dedu - dedu_depe),0)
						if base_final >=  pp_tope then 
							base_final=dedu - pp_tope
						end if
						base = base_final
						setnull(base_final)
					end if
					setitem(row,'base',base)				
					valor=f_calc_retfuente( base, base,uvt_act, getitemstring(donde,'sobre'),c_con,2/*ii_dec_gral*/)
					valor=f_aproxima_a(valor,1000)
					if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
						setitem(row,'tvalor',valor)//para que no se sume dos veces
						setitem(row,'base',base)
					else
						setitem(row,'tvalor',valor)//para que no se sume dos veces
						setitem(row,'base',base)
					end if
				else
					sobre=idw_iva2.getitemstring(donde,'sobre')
					uvt_act=idw_iva2.getitemnumber(donde,'uvt')
					pb_uvt=idw_iva2.getitemnumber(donde,'porce_baseuvt')
					pc_uvt=idw_iva2.getitemnumber(donde,'porce_cotiuvt')
					pp_uvt=idw_iva2.getitemnumber(donde,'porce_parauvt')
					pd_uvt=idw_iva2.getitemnumber(donde,'porce_depuvt')	
					tope_dep=idw_iva2.getitemnumber(donde,'tope_dep')
					if is_orig='-' or is_orig='RFC' then//manuales
						setitem(row,'base',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),ii_dec_gral))					
					else
						if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
							setitem(row,'tvalor',0)//para que no se sume dos veces
							base=round((tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza')-getitemnumber(1,'t_incrementa'))/(1+idw_iva2.getitemdecimal(donde,'porcentaje')/100),ii_dec_gral)
							base=round(((base * pb_uvt)- ((base * pc_uvt) * pp_uvt)),ii_dec_gral)
							setitem(row,'base',base)
						else
							base=round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),ii_dec_gral)
							base=round(((base*pb_uvt)- ((base*pc_uvt)*pp_uvt)),ii_dec_gral)
							setitem(row,'base',base)
						end if
					end if
				end if
			case 'B' //base
				if (is_orig='-' or is_orig='RFC') and ii_legal=0 then//manuales
					setitem(row,'base',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),ii_dec_gral))				
				else
					if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
						if ii_legal=0 then 
							setitem(row,'tvalor',0)//para que no se sume dos veces
							setitem(row,'base',round((tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza')-getitemnumber(1,'t_incrementa'))/(1+idw_iva2.getitemdecimal(donde,'porcentaje')/100),ii_dec_gral))
						else
						    setitem(row,'base',round(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tbruto_legal'),ii_dec_gral))
						end if
					else
						if ii_legal=0 then 
							setitem(row,'base',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),ii_dec_gral))
						else
						    setitem(row,'base',round(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tbruto_legal'),ii_dec_gral))
						end if
					end if
				end if
			case 'N' //neto
				if ii_legal=0 then 
					setitem(row,'base',tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto'))
				else
					setitem(row,'base',tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tbruto_legal'))
				end if
			case 'P' //pago directo
				st_ord_pago st
				st.dw_cpo=tab_2.t2_3.t5.t5_1.dw_cpo
				st.dw_conta=this
				openwithparm(w_escoge_pagodir,st)
				if message.doubleparm=0 then 
					settext('')
					setitem(row,'cod_concep',nulo)
					setitem(row,'cartipo',nulo)
					setitem(row,'accion',nulo)
					return 2
				end if
		end choose
		event itemchanged(row,object.base,string(getitemnumber(row,'base')))
		post event p_scrollto(row,'cod_concep')
		
	case 'cod_total'
		setitem(row,'cod_empre',is_emp)
		setitem(row,'tercero',idw_cta2.getitemstring(idw_cta2.getrow(),'tercero'))
	case 'tvalor'
		post event p_itemchanged('B')
		post event p_scrollto(row,'tvalor')
	case "tipodoc"
		setitem(getrow(),"documento",nulo)
		accepttext()
	case "documento"
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(getrow(),"tipodoc")
		if isnull(tdoc) then
			setitem(getrow(),"documento",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=data
		setnull(persona)
		SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
		FROM TERCEROS
		WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
		if isnull(persona) then
			if messagebox("Atención","Este Tercero no se encuentra, desea crearlo?",question!,yesno!,2)=2 then
				settext(getitemstring(getrow(),getcolumn()))
				return 1
			else
				st_general messObj
				messObj.valor = getitemstring(getrow(),'tipodoc')
				messObj.documento = doc
				messObj.dw_obj = this
				openwithparm(w_cfgterceros, messObj)
				if message.stringparm='' then 
					settext(getitemstring(getrow(),getcolumn()))
					return 1
				end if
			end if
		else
			setitem(getrow(),"nombre1",nom1)
			setitem(getrow(),"nombre2",nom2)
			setitem(getrow(),"apellido1",ape1)
			setitem(getrow(),"apellido2",ape2)
			setitem(getrow(),"razon_social",rsoc)
			setitem(getrow(),"persona",persona)
		end if
end choose
ibn_cambio=true
end event

event rowfocuschanged;if getrow()<1 then return
if not isnull(getitemstring(getrow(),'cod_empre')) then
	idw_cta2.retrieve(getitemstring(getrow(),'cod_empre'),getitemstring(getrow(),'cod_concep'))
else
	idw_cta2.retrieve(is_emp,getitemstring(getrow(),'cod_concep'))
end if
end event

type t_c from userobject within t_ret
integer x = 128
integer y = 16
integer width = 5838
integer height = 480
long backcolor = 67108864
long tabtextcolor = 33554432
string picturename = "ajuste1.ico"
long picturemaskcolor = 536870912
dw_rtem dw_rtem
end type

on t_c.create
this.dw_rtem=create dw_rtem
this.Control[]={this.dw_rtem}
end on

on t_c.destroy
destroy(this.dw_rtem)
end on

type dw_rtem from datawindow within t_c
integer x = 18
integer y = 8
integer width = 5605
integer height = 452
integer taborder = 60
string title = "none"
string dataobject = "dw_trans_retencion_mod_todos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//getchild('cod_concep',idw_iva2)
//idw_iva2.settransobject(sqlca)
//idw_iva2.retrieve()
//
//getchild('cod_total',idw_cta2)
//idw_cta2.settransobject(sqlca)
settransobject(sqlca)
end event

type t5 from tab within t2_3
integer x = 18
integer y = 724
integer width = 6002
integer height = 744
integer taborder = 35
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
t5_1 t5_1
t5_2 t5_2
t5_3 t5_3
t5_4 t5_4
tabpage_1 tabpage_1
end type

on t5.create
this.t5_1=create t5_1
this.t5_2=create t5_2
this.t5_3=create t5_3
this.t5_4=create t5_4
this.tabpage_1=create tabpage_1
this.Control[]={this.t5_1,&
this.t5_2,&
this.t5_3,&
this.t5_4,&
this.tabpage_1}
end on

on t5.destroy
destroy(this.t5_1)
destroy(this.t5_2)
destroy(this.t5_3)
destroy(this.t5_4)
destroy(this.tabpage_1)
end on

type t5_1 from userobject within t5
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5966
integer height = 616
long backcolor = 67108864
string text = "Conceptos"
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
string powertiptext = "Conceptos del Pago"
pb_del_concep pb_del_concep
pb_new_concep pb_new_concep
dw_cpo dw_cpo
end type

on t5_1.create
this.pb_del_concep=create pb_del_concep
this.pb_new_concep=create pb_new_concep
this.dw_cpo=create dw_cpo
this.Control[]={this.pb_del_concep,&
this.pb_new_concep,&
this.dw_cpo}
end on

on t5_1.destroy
destroy(this.pb_del_concep)
destroy(this.pb_new_concep)
destroy(this.dw_cpo)
end on

type pb_del_concep from picturebutton within t5_1
integer x = 5783
integer y = 156
integer width = 146
integer height = 128
integer taborder = 41
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Concepto"
end type

event clicked;if dw_cpo.rowcount()=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then return
if is_orig='NM' then 
	messagebox('Atención','Esta recepción es de Nómina no puede borrar conceptos')
	return
end if
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='I' then
	messagebox('Atención','No puede borrar conceptos cuando es pago de impuestos')
	return
end if
if dw_cpo.describe("evaluate('isrownew()',"+string(dw_cpo.getrow())+")")='false' then
	if messagebox("Atención",'Este registro viene de una interface o ya se encuentra guardado. ~r~nEl cambio se ***** GUARDARÁ ***** automáticamente, está seguro que desea borrarlo?.',question!,yesno!,2)=2 then return
	if is_orig<>'-' and is_orig<>'RFC' then 
		dw_rela.setfilter('num_doc2='+string(dw_cpo.getitemnumber(dw_cpo.getrow(),'item')))
		dw_rela.filter()
		long j,nres,item_orig,item_cpo
		string clug_res,cdoc_res,cdoc
		dec valor
		for j=1 to dw_rela.rowcount()
			nres=dw_rela.getitemnumber(j,'num_orig1')
			clug_res=dw_rela.getitemstring(j,'char_orig2')
			cdoc_res=dw_rela.getitemstring(j,'char_orig1')
			item_orig=dw_rela.getitemnumber(j,'num_orig2')
//			if is_orig='PR' then
//				update pre_reser_cb set en_destino='0' where
//				coddocu=:cdoc_res and clugar=:clug_res and numdoc=:nres;
//				if sqlca.sqlcode=-1 then
//					messagebox("Error actualizando 'en_destino' de Pre_Reser_Cb",sqlca.sqlerrtext)
//					rollback;
//					tab_2.t2_2.dw_hist.triggerevent(rowfocuschanged!)
//					return -1
//				end if
//			else
				valor=dw_rela.getitemnumber(j,'valor')
				update pre_docu_cp set monto_interfaz=monto_interfaz - :valor where
				coddoc=:cdoc_res and clugar=:clug_res and numdoc=:nres and item=:item_orig;
				if sqlca.sqlcode=-1 then
					messagebox("Error actualizando 'monto_interfaz' de Pre_docu_Cp",sqlca.sqlerrtext)
					rollback;
					tab_2.t2_2.dw_hist.triggerevent(rowfocuschanged!)
					return -1
				end if
			//end if
		next
		do while dw_rela.rowcount()>0
			dw_rela.deleterow(0)
		loop
		if dw_rela.update()=-1 then
			rollback;
			tab_2.t2_2.dw_hist.triggerevent(rowfocuschanged!)
		end if
		dw_rela.setfilter('')
		dw_rela.filter()
			
			
	end if
	do while tab_2.t2_3.t_ret.t_o.dw_rte.rowcount()>0
		tab_2.t2_3.pb_del_tax.event clicked()
	loop
	dw_cpo.deleterow(0)
	dw_cpo.triggerevent(rowfocuschanged!)
	dw_cpo.event p_itemchanged()
	if tab_2.t2_3.tab_4.t4_1.dw_cab.update()=-1 then
		rollback;
		tab_2.t2_2.dw_hist.triggerevent(rowfocuschanged!)
	end if
	if tab_2.t2_3.tab_4.t4_2.dw_tot.update()=-1 then
		rollback;
		tab_2.t2_2.dw_hist.triggerevent(rowfocuschanged!)
	end if
	if tab_2.t2_3.t_ret.t_o.dw_rte.update()=-1 then
		rollback;
		tab_2.t2_2.dw_hist.triggerevent(rowfocuschanged!)
	end if
	if dw_cpo.update()=-1 then
		rollback;
		tab_2.t2_2.dw_hist.triggerevent(rowfocuschanged!)
	end if
	commit;
	ibn_cambio=false
	
else
	do while tab_2.t2_3.t_ret.t_o.dw_rte.rowcount()>0
		tab_2.t2_3.pb_del_tax.event clicked()
	loop
	dw_cpo.deleterow(0)
	dw_cpo.triggerevent(rowfocuschanged!)
	dw_cpo.event p_itemchanged()
	ibn_cambio=true
end if
end event

type pb_new_concep from picturebutton within t5_1
integer x = 5783
integer y = 24
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar Concepto"
end type

event clicked;if is_orig<>'-' and is_orig<>'RFC' and is_orig<>'NM' then
	messagebox("Atención",'Únicamente se pueden agregar conceptos desde la interface')
	return -1
end if
if tab_2.t2_3.tab_4.t4_1.dw_cab.rowcount()=0 then return -1
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then return -1
long donde,j
donde=dw_cpo.insertrow(0)
dw_cpo.setitem(donde,'nrelacion',tab_2.t2_3.tab_4.t4_1.dw_cab.getitemnumber(1,'nrelacion'))
dw_cpo.setitem(donde,'clugar',tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'clugar'))
dw_cpo.setitem(donde,'coddoc',is_cdoc)
for j=1 to donde//para buscar un item válido
	if dw_cpo.find('item='+string(j),1,dw_cpo.rowcount())=0 then exit
next
if is_orig='NC' or is_orig='SCT' then
	dw_cpo.setitem(donde,'tipodoc',tab_2.t2_1.dw_terce_c.getitemstring(1,'tipodoc'))
	dw_cpo.setitem(donde,'documento',tab_2.t2_1.dw_terce_c.getitemstring(1,'documento'))
else
	dw_cpo.setitem(donde,'tipodoc',tab_2.t2_2.dw_terce.getitemstring(1,'tipodoc'))
	dw_cpo.setitem(donde,'documento',tab_2.t2_2.dw_terce.getitemstring(1,'documento'))
end if
dw_cpo.setitem(donde,'item',j)
dw_cpo.scrolltorow(donde)
dw_cpo.setcolumn('cod_rel')
dw_cpo.setfocus()
ibn_cambio=true
return donde
end event

type dw_cpo from datawindow within t5_1
event p_itemchanged ( )
string tag = "cuando es de contrato o manual se utiliza para grabar el cpo(si es desde reserva se utiliza dw_res)"
integer y = 16
integer width = 5723
integer height = 596
integer taborder = 70
string title = "none"
string dataobject = "dw_tesorelfactcpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
datawindow dw_t
dw_t=tab_2.t2_3.tab_4.t4_1.dw_cab
dw_t.accepttext()
if rowcount()>0 then
	dw_t.setitem(1,'anticipo',getitemnumber(1,'t_anticipos'))
	dw_t.setitem(1,'tneto',getitemnumber(1,'t_neto'))//-dw_t.getitemnumber(1,'anticipo'))
	dw_t.setitem(1,'tbruto',getitemnumber(1,'t_bruto'))
	dw_t.setitem(1,'val_bruto',getitemnumber(1,'t_vsiniva'))
	dw_t.setitem(1,'tdescuentos',getitemnumber(1,'t_descuentos'))
	dw_t.setitem(1,'amortiza',getitemnumber(1,'t_amortiza'))
else
	dw_t.setitem(1,'tneto',0)
	dw_t.setitem(1,'tbruto',0)
	dw_t.setitem(1,'val_bruto',0)
	dw_t.setitem(1,'tdescuentos',0)
	dw_t.setitem(1,'anticipo',0)
	dw_t.setitem(1,'amortiza',0)
end if
end event

event constructor;getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)
dw_cpo.settransobject(sqlca)
end event

event itemchanged;decimal valor
string nulo
setnull(nulo)
choose case getcolumnname()
	case 'val_bruto','tdescuentos','anticipos','amortiza'
		accepttext()
		valor=round(getitemdecimal(getrow(),getcolumn()),ii_dec_gral)
		if ii_dec_gral=0 then
			valor=long(valor/ii_aprox_gral)*ii_aprox_gral  + ii_aprox_gral*round((valor -long(valor/ii_aprox_gral)*ii_aprox_gral)/ii_aprox_gral,0)
		end if
		setitem(getrow(),getcolumn(),valor)
		settext(string(valor))
		accepttext()
		if tab_2.t2_3.t_ret.t_o.dw_rte.rowcount()>0 then
			long j
			for j=1 to tab_2.t2_3.t_ret.t_o.dw_rte.rowcount()
				tab_2.t2_3.t_ret.t_o.dw_rte.event itemchanged(j,tab_2.t2_3.t_ret.t_o.dw_rte.object.cod_concep,tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'cod_concep'))
			next
		else
			tab_2.t2_3.t_ret.t_o.dw_rte.event p_itemchanged('C')
		end if
		ibn_cambio=true
		return 2
	case "tipodoc"
		setitem(getrow(),"documento",nulo)
		accepttext()
	case "documento"
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(getrow(),"tipodoc")
		if isnull(tdoc) then
			setitem(getrow(),"documento",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=data
		setnull(persona)
		SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
		FROM TERCEROS
		WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
		if isnull(persona) then
			if messagebox("Atención","Este Tercero no se encuentra, desea crearlo?",question!,yesno!,2)=2 then
				settext(getitemstring(getrow(),getcolumn()))
				return 1
			else
				st_general messObj
				messObj.valor = getitemstring(getrow(),'tipodoc')
				messObj.documento = doc
				messObj.dw_obj = this
				openwithparm(w_cfgterceros, messObj)
				if message.stringparm='' then 
					settext(getitemstring(getrow(),getcolumn()))
					return 1
				end if
			end if
		else
	end if
end choose
ibn_cambio=true
end event

event rowfocuschanged;if getrow()<1 then
	tab_2.t2_3.t_ret.t_o.dw_rte.setfilter('isnull(item)')
	tab_2.t2_3.t5.t5_2.dw_anti.setfilter('isnull(item)')
	tab_2.t2_3.t5.t5_3.dw_tz.setfilter('isnull(item)')
else
	if isnull(getitemnumber(getrow(),'item')) then
		tab_2.t2_3.t_ret.t_o.dw_rte.setfilter('isnull(item)')
		tab_2.t2_3.t5.t5_2.dw_anti.setfilter('isnull(item)')
		tab_2.t2_3.t5.t5_3.dw_tz.setfilter('isnull(item)')
	else
		tab_2.t2_3.t_ret.t_o.dw_rte.setfilter('item='+string(getitemnumber(getrow(),'item')))
		tab_2.t2_3.t5.t5_2.dw_anti.setfilter('item='+string(getitemnumber(getrow(),'item')))
		tab_2.t2_3.t5.t5_3.dw_tz.setfilter('item='+string(getitemnumber(getrow(),'item')))
	end if
end if
tab_2.t2_3.t5.t5_3.dw_tz.filter()
tab_2.t2_3.t5.t5_2.dw_anti.filter()
tab_2.t2_3.t_ret.t_o.dw_rte.filter()
tab_2.t2_3.t_ret.t_o.dw_rte.event rowfocuschanged(tab_2.t2_3.t_ret.t_o.dw_rte.getrow())
tab_2.t2_3.t_ret.selecttab(0)
end event

event doubleclicked;if getrow()<1 then return
string columna
columna=dwo.name
if columna="documento" and getitemstring(row,'definitivo')='0' then
	g_tercerodesde=6
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		event itemchanged(row,dwo,getitemstring(getrow(),"documento"))
	end if
end if
end event

type t5_2 from userobject within t5
boolean visible = false
integer x = 18
integer y = 112
integer width = 5966
integer height = 616
boolean enabled = false
long backcolor = 67108864
string text = "Anticipos"
long tabtextcolor = 33554432
string picturename = "caja_menor.ico"
long picturemaskcolor = 536870912
string powertiptext = "Anticipos hechos al Concepto"
st_7 st_7
pb_del_anti pb_del_anti
pb_new_anti pb_new_anti
dw_anti dw_anti
end type

on t5_2.create
this.st_7=create st_7
this.pb_del_anti=create pb_del_anti
this.pb_new_anti=create pb_new_anti
this.dw_anti=create dw_anti
this.Control[]={this.st_7,&
this.pb_del_anti,&
this.pb_new_anti,&
this.dw_anti}
end on

on t5_2.destroy
destroy(this.st_7)
destroy(this.pb_del_anti)
destroy(this.pb_new_anti)
destroy(this.dw_anti)
end on

type st_7 from statictext within t5_2
integer x = 9
integer width = 526
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Anticipos por concepto:"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_del_anti from picturebutton within t5_2
integer x = 3374
integer y = 200
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar Anticipo"
end type

event clicked;if dw_anti.rowcount()=0 then return
if tab_2.t2_3.t5.t5_1.dw_cpo.rowcount()=0 then return -1
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then return
if dw_anti.getitemnumber(dw_anti.getrow(),'fila_new')=1 then
	dw_anti.deleterow(0)
else// no es nueva
	string snulo
	long nnulo
	setnull(snulo)
	setnull(nnulo)
	dw_anti.setitem(dw_anti.getrow(),'clug_anticipo',snulo)
	dw_anti.setitem(dw_anti.getrow(),'cdoc_anticipo',snulo)
	dw_anti.setitem(dw_anti.getrow(),'nrel_anticipo',nnulo)
	dw_anti.setitem(dw_anti.getrow(),'item_anticipo',nnulo)
	if dw_anti.update()=-1 then
		rollback;
		return
	else
		commit;
	end if
	dw_anti.deleterow(0)
	dw_anti.resetupdate()
end if
if dw_anti.rowcount()=0 then
	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos',0)
else
	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos',dw_anti.getitemnumber(1,'t_vsiniva'))
end if
tab_2.t2_3.t5.t5_1.dw_cpo.setcolumn('anticipos')
tab_2.t2_3.t5.t5_1.dw_cpo.event itemchanged(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),tab_2.t2_3.t5.t5_1.dw_cpo.object.anticipos,string(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')))
end event

type pb_new_anti from picturebutton within t5_2
integer x = 3369
integer y = 64
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Insertar Anticipos"
end type

event clicked;if tab_2.t2_3.tab_4.t4_1.dw_cab.rowcount()=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then return
if tab_2.t2_3.t5.t5_1.dw_cpo.rowcount()=0 then return
if dw_anti.rowcount()>0 then
	messagebox('Atención','Debe primero borrar todos los anticipos')
	return
end if
st_xa_antis st
st.dw_cpo=tab_2.t2_3.t5.t5_1.dw_cpo
st.dw_intfaz=dw_anti
openwithparm(w_teso_anticipo,st)
end event

type dw_anti from datawindow within t5_2
integer y = 56
integer width = 3355
integer height = 588
integer taborder = 31
string title = "none"
string dataobject = "dw_tesorelfactcpo_antis"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type t5_3 from userobject within t5
integer x = 18
integer y = 112
integer width = 5966
integer height = 616
long backcolor = 67108864
string text = "Amortización"
long tabtextcolor = 33554432
string picturename = "rec_caja.ico"
long picturemaskcolor = 536870912
string powertiptext = "Amortizar un Anticipo ya generado por Concepto"
st_3 st_3
dw_tz dw_tz
pb_del_tz pb_del_tz
pb_new_tz pb_new_tz
end type

on t5_3.create
this.st_3=create st_3
this.dw_tz=create dw_tz
this.pb_del_tz=create pb_del_tz
this.pb_new_tz=create pb_new_tz
this.Control[]={this.st_3,&
this.dw_tz,&
this.pb_del_tz,&
this.pb_new_tz}
end on

on t5_3.destroy
destroy(this.st_3)
destroy(this.dw_tz)
destroy(this.pb_del_tz)
destroy(this.pb_new_tz)
end on

type st_3 from statictext within t5_3
integer x = 32
integer width = 658
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Amortizaciones por concepto:"
boolean focusrectangle = false
end type

type dw_tz from datawindow within t5_3
integer x = 23
integer y = 60
integer width = 3854
integer height = 512
integer taborder = 70
string title = "none"
string dataobject = "dw_deta_amortiza"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type pb_del_tz from picturebutton within t5_3
integer x = 3954
integer y = 176
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar Amortización"
end type

event clicked;if dw_tz.rowcount()=0 then return
if tab_2.t2_3.t5.t5_1.dw_cpo.rowcount()=0 then return -1
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then return
if dw_tz.getitemnumber(dw_tz.getrow(),'fila_new')=1 then
	dw_tz.deleterow(0)
else// no es nueva
	string clug_anti
	long nanti,item_anti
	dec valor
	clug_anti=dw_tz.getitemstring(dw_tz.getrow(),'clugar_anti')
	nanti=dw_tz.getitemnumber(dw_tz.getrow(),'nrelacion_anti')
	item_anti=dw_tz.getitemnumber(dw_tz.getrow(),'item_anti')
	valor=dw_tz.getitemnumber(dw_tz.getrow(),'v_amortizado')
	update tesorelfactcpo set v_amortizado=v_amortizado - :valor where
	clugar=:clug_anti and coddoc='RFC' and nrelacion=:nanti and item=:item_anti;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando tesorelfactcpo",sqlca.sqlerrtext)
		rollback;
		return
	end if
	dw_tz.deleterow(0)
	if dw_tz.update()=-1 then
		rollback;
		return
	else
		commit;
	end if
end if
if dw_tz.rowcount()=0 then
	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza',0)
else
	tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza',dw_tz.getitemnumber(1,'t_amortiza'))
end if
tab_2.t2_3.t5.t5_1.dw_cpo.setcolumn('amortiza')
tab_2.t2_3.t5.t5_1.dw_cpo.event itemchanged(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),tab_2.t2_3.t5.t5_1.dw_cpo.object.amortiza,string(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza')))
end event

type pb_new_tz from picturebutton within t5_3
integer x = 3954
integer y = 40
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string powertiptext = "Insertar Amortizaciones"
end type

event clicked;if tab_2.t2_3.tab_4.t4_1.dw_cab.rowcount()=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then return
if tab_2.t2_3.t5.t5_1.dw_cpo.rowcount()=0 then return
if dw_tz.rowcount()>0 then
	messagebox('Atención','Debe primero borrar todos las amortizaciones')
	return
end if
st_xa_antis st
st.dw_cpo=tab_2.t2_3.t5.t5_1.dw_cpo
st.dw_intfaz=dw_tz
openwithparm(w_teso_anticipo,st)
end event

type t5_4 from userobject within t5
integer x = 18
integer y = 112
integer width = 5966
integer height = 616
long backcolor = 67108864
string text = "Legalizaciones"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
string powertiptext = "Legalizar Anticipos realizados"
tab_legal tab_legal
pb_devo pb_devo
pb_save_legal pb_save_legal
pb_2 pb_2
dw_legal_cab dw_legal_cab
pb_save_lega pb_save_lega
pb_new_lega pb_new_lega
end type

on t5_4.create
this.tab_legal=create tab_legal
this.pb_devo=create pb_devo
this.pb_save_legal=create pb_save_legal
this.pb_2=create pb_2
this.dw_legal_cab=create dw_legal_cab
this.pb_save_lega=create pb_save_lega
this.pb_new_lega=create pb_new_lega
this.Control[]={this.tab_legal,&
this.pb_devo,&
this.pb_save_legal,&
this.pb_2,&
this.dw_legal_cab,&
this.pb_save_lega,&
this.pb_new_lega}
end on

on t5_4.destroy
destroy(this.tab_legal)
destroy(this.pb_devo)
destroy(this.pb_save_legal)
destroy(this.pb_2)
destroy(this.dw_legal_cab)
destroy(this.pb_save_lega)
destroy(this.pb_new_lega)
end on

type tab_legal from tab within t5_4
integer x = 2391
integer y = 20
integer width = 3511
integer height = 596
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tab_pro tab_pro
tab_devo tab_devo
end type

on tab_legal.create
this.tab_pro=create tab_pro
this.tab_devo=create tab_devo
this.Control[]={this.tab_pro,&
this.tab_devo}
end on

on tab_legal.destroy
destroy(this.tab_pro)
destroy(this.tab_devo)
end on

type tab_pro from userobject within tab_legal
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3474
integer height = 468
long backcolor = 67108864
string text = "Legaliza"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
dw_legal_cpo dw_legal_cpo
end type

on tab_pro.create
this.dw_legal_cpo=create dw_legal_cpo
this.Control[]={this.dw_legal_cpo}
end on

on tab_pro.destroy
destroy(this.dw_legal_cpo)
end on

type dw_legal_cpo from datawindow within tab_pro
integer x = 14
integer y = 16
integer width = 3429
integer height = 452
integer taborder = 50
string title = "none"
string dataobject = "dw_tesorelfactcpo_legal_new"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long j
decimal val_dev=0,val_leg=0,val_bru=0
string nulo

accepttext()
setnull(nulo)
choose case dwo.name
	case "tbruto_legal"
		accepttext()
		val_bru=val_bru+getitemnumber(getrow(),'tbruto_legal')
		val_dev=val_dev+getitemnumber(getrow(),'devolucion')
		setitem(getrow(),'tneto_legal',(val_bru - val_dev))
		if tab_2.t2_3.t_ret.t_o.dw_rte.rowcount()>0 then
			for j=1 to tab_2.t2_3.t_ret.t_o.dw_rte.rowcount()
				tab_2.t2_3.t_ret.t_o.dw_rte.event itemchanged(j,tab_2.t2_3.t_ret.t_o.dw_rte.object.cod_concep,tab_2.t2_3.t_ret.t_o.dw_rte.getitemstring(j,'cod_concep'))
			next
		else
			tab_2.t2_3.t_ret.t_o.dw_rte.event p_itemchanged('C')
		end if
	case "tipodoc"
		setitem(getrow(),"documento",nulo)
		accepttext()
	case "documento"
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(getrow(),"tipodoc")
		if isnull(tdoc) then
			setitem(getrow(),"documento",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=data
		setnull(persona)
		SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
		FROM TERCEROS
		WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
		if isnull(persona) then
			if messagebox("Atención","Este Tercero no se encuentra, desea crearlo?",question!,yesno!,2)=2 then
				settext(getitemstring(getrow(),getcolumn()))
				return 1
			else
				st_general messObj
				messObj.valor = getitemstring(getrow(),'tipodoc')
				messObj.documento = doc
				messObj.dw_obj = this
				openwithparm(w_cfgterceros, messObj)
				if message.stringparm='' then 
					settext(getitemstring(getrow(),getcolumn()))
					return 1
				end if
			end if
		else
			setitem(getrow(),"nombre1",nom1)
			setitem(getrow(),"nombre2",nom2)
			setitem(getrow(),"apellido1",ape1)
			setitem(getrow(),"apellido2",ape2)
			setitem(getrow(),"razon_social",rsoc)
			setitem(getrow(),"persona",persona)
		end if
end choose
val_dev=0
val_leg=0
val_bru=0
for j=1 to rowcount()
	val_bru=val_bru+getitemnumber(j,'tbruto_legal')
	val_leg=val_leg+getitemnumber(j,'tneto_legal')
	val_dev=val_dev+getitemnumber(j,'devolucion')
next
in_valor_b=tab_2.t2_3.t5.t5_4.dw_legal_cab.getitemnumber(tab_2.t2_3.t5.t5_4.dw_legal_cab.GetRow(),'tbruto')
in_valor_b=in_valor_b+(val_bru+val_dev)*-1
if val_dev>tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.getitemnumber(1,'t_devolver') then
	messagebox('Atención','El valor de devolucion supera el monto del ingreso')
	return
end if
tab_2.t2_3.t5.t5_4.dw_legal_cab.setitem(1,'devolucion',val_dev)
if (val_leg+val_dev)>tab_2.t2_3.t5.t5_4.dw_legal_cab.getitemnumber(tab_2.t2_3.t5.t5_4.dw_legal_cab.getrow(),'tbruto') then
	messagebox('Atención','El valor de la legalizacion supera el monto Total del Concepto')
	return
end if

end event

event constructor;getchild('cod_rel_legal',idw_concep_legal)
idw_concep_legal.settransobject(sqlca)
settransobject(sqlca)
end event

event doubleclicked;string columna
columna=dwo.name
if columna="documento" then
	g_tercerodesde=14
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		event itemchanged(row,dwo,getitemstring(getrow(),"documento"))
	end if
end if

end event

type tab_devo from userobject within tab_legal
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3474
integer height = 468
long backcolor = 67108864
string text = "Devuelve"
long tabtextcolor = 33554432
string picturename = "notas_adm.ico"
long picturemaskcolor = 536870912
dw_devo dw_devo
end type

on tab_devo.create
this.dw_devo=create dw_devo
this.Control[]={this.dw_devo}
end on

on tab_devo.destroy
destroy(this.dw_devo)
end on

type dw_devo from datawindow within tab_devo
integer x = 14
integer y = 16
integer width = 3419
integer height = 452
integer taborder = 60
string title = "none"
string dataobject = "dw_devoluciones"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_devo from picturebutton within t5_4
integer x = 2203
integer y = 292
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar Devolución"
end type

event clicked;if tab_2.t2_3.tab_4.t4_1.dw_cab.rowcount()=0 then return
if tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.rowcount()=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='0' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' then return
openwithparm(w_busca_devoluciones,dw_legal_cab)

end event

type pb_save_legal from picturebutton within t5_4
integer x = 2203
integer y = 432
integer width = 146
integer height = 128
integer taborder = 46
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Legalización"
end type

event clicked;if dw_legal_cab.rowcount()=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' then return

//valida xa que no hagan goles

dec val_bru=0,val_leg=0,val_dev=0
int hi
//tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.acceptext()
for hi=1 to tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.rowcount()
	val_bru=val_bru+tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(hi,'tneto_legal')
	val_leg=val_leg+tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(hi,'legal')
	val_dev=val_dev+tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(hi,'devolucion')
next
if val_dev>tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.getitemnumber(1,'t_devolver') then
	messagebox('Atención','El valor de devolucion supera el monto del ingreso')
	return
end if

if (val_leg+val_dev)>tab_2.t2_3.t5.t5_4.dw_legal_cab.getitemnumber(tab_2.t2_3.t5.t5_4.dw_legal_cab.getrow(),'tbruto') then
	messagebox('Atención','El valor de la legalizacion supera el monto Total del Concepto')
	return
end if

tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'defi_legal','1')
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'fecha_legal',tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemdatetime(1,'fecha_legaliza'))
if tab_2.t2_3.tab_4.t4_1.dw_cab.update(true,false)=-1 then 
	goto error
end if
if dw_legal_cab.update(true,false)=-1 then 
	goto error
end if
if tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.update(true,false)=-1 then 
	goto error
end if
long j
for j=1 to tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.rowcount()
	tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.setitem(j,'clug_recep',is_clug_rad)
	tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.setitem(j,'cdoc_recep',is_cdoc)
	tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.setitem(j,'nrelacion',idb_nrad)
	if	tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.getitemstring(j,'impu')='1' then 
		tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.setitem(j,'impu','1')
	else
		tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.setitem(j,'impu','0')
	end if
next
if tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.update(true,false)=-1 then
	goto error
end if
if tab_2.t2_3.t_ret.t_o.dw_rte.update(true,false)=-1 then
	rollback;
	return -1
end if
commit;
tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.resetupdate()
dw_legal_cab.resetupdate()
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.resetupdate()
ii_legal=0
ibn_cambio=true
return

error:
rollback;
string snulo
long nnulo
setnull(snulo)
setnull(nnulo)
tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'defi_legal','0')
for j=1 to tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.rowcount()
	tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.setitem(j,'clug_recep',snulo)
	tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.setitem(j,'cdoc_recep',snulo)
	tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.setitem(j,'nrelacion',nnulo)
next
ii_legal=0

end event

type pb_2 from picturebutton within t5_4
boolean visible = false
integer y = 92
integer width = 41
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Devolución"
end type

event clicked;if isnull(tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.getitemnumber(tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.getrow(),'nrelacion')) then
	tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.deleterow(0)
	tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo.resetupdate()
	lf_devol()
else
	messagebox('Atención','Esta legalización ya fue guardada')
end if


end event

type dw_legal_cab from datawindow within t5_4
integer x = 23
integer y = 28
integer width = 2149
integer height = 572
integer taborder = 30
string title = "none"
string dataobject = "dw_tesorelfactcpo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;getchild('cod_rel',idw_concep_legal_1)
idw_concep_legal_1.settransobject(sqlca)
settransobject(sqlca)




end event

event rowfocuschanged;if currentRow = 0 or RowCount() = 0 then Return
accepttext()
in_valor_b=dw_legal_cab.getitemnumber(dw_legal_cab.GetRow(),'tbruto')
if not isNull(GetItemNumber(dw_legal_cab.RowCount(),'item')) then
	tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.SetFilter('item='+string(dw_legal_cab.GetItemNumber(dw_legal_cab.GetRow(),'item')))
	tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.Filter()
end if
ii_item_dev=tab_2.t2_3.t5.t5_4.dw_legal_cab.getitemnumber(tab_2.t2_3.t5.t5_4.dw_legal_cab.getrow(),'item')
end event

type pb_save_lega from picturebutton within t5_4
integer x = 2203
integer y = 156
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar legalización"
end type

event clicked;long fila
if tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.rowcount()=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='0' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' then return
fila=tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow()
if fila< 1 then return
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.deleterow(0)

//if tab_2.t2_3.t5.t5_4.dw_legal_cab.getitemstring(1,'defi_legal')<>'0' then
//	messagebox("Atención","No puede modificar este documento")
//	return
//end if

//dw_legal_cpo.setredraw(false)
//dw_legal_cpo.deleterow(fila)
//if dw_legal_cpo.update()=-1 then
//	rollback;
//	return
//else
//	commit;
//end if
end event

type pb_new_lega from picturebutton within t5_4
integer x = 2203
integer y = 24
integer width = 146
integer height = 128
integer taborder = 41
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar legalización"
end type

event clicked;long fila,sitem
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='0' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' then return
ii_legal=1
fila=tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.insertrow(0)
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.scrolltorow(fila)
if tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.rowcount()=1 then 
	sitem=0
else
	sitem=tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(1,"maximo")
end if 
sitem++
datawindow dw_t
long j,donde
dw_t=tab_2.t2_3.t5.t5_1.dw_cpo
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(fila,'subitem',sitem)
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(fila,'nrelacion',idb_nrad)
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(fila,'item',ii_item_dev)
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(fila,'clugar',is_clug_rad)
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(fila,'coddoc',is_cdoc)
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(fila,'fecha_legaliza',datetime(today(),now()))
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(fila,'tipodoc',dw_t.getitemstring(1,'tipodoc'))
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(fila,'documento',dw_t.getitemstring(1,'documento'))
tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(fila,'tbruto_legal',in_valor_b)

//dw_rte.setitem(donde,'tipodoc',t5.t5_1.dw_cpo.getitemstring(t5.t5_1.dw_cpo.getrow(),'tipodoc'))
//dw_rte.setitem(donde,'documento',t5.t5_1.dw_cpo.getitemstring(t5.t5_1.dw_cpo.getrow(),'documento'))
//dw_rte.setcolumn('documento')

//if tab_2.t2_3.tab_4.t4_1.dw_cab.rowcount()=0 then return
//if dw_legal_cpo.rowcount()>0 then return
//dw_legal_cpo.resetupdate()
//for j=1 to dw_t.rowcount()
//	dw_legal_cpo.insertrow(j)
//	dw_legal_cpo.setitem(j,'clugar',i_clug_rad)
//	dw_legal_cpo.setitem(j,'coddoc',i_cdoc)
//	dw_legal_cpo.setitem(j,'nrelacion',i_nrad)
//	dw_legal_cpo.setitem(j,'item',dw_t.getitemnumber(j,'item'))
//	dw_legal_cpo.setitem(j,'tbruto',dw_t.getitemnumber(j,'tbruto'))
//	dw_legal_cpo.setitem(j,'tipodoc',dw_t.getitemstring(j,'tipodoc'))
//	dw_legal_cpo.setitem(j,'documento',dw_t.getitemstring(j,'documento'))
//next
//dw_legal_cpo.resetupdate()
//for j=1 to dw_t.rowcount()
//	dw_legal_cpo.setitem(j,'cod_rel_legal',dw_t.getitemstring(j,'cod_rel'))
//	dw_legal_cpo.setitem(j,'devolucion',0)
//next

end event

type tabpage_1 from userobject within t5
integer x = 18
integer y = 112
integer width = 5966
integer height = 616
long backcolor = 67108864
string text = "Entradas a Almacen"
long tabtextcolor = 33554432
string picturename = "notas_adm.ico"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_1 pb_1
dw_entradas dw_entradas
end type

on tabpage_1.create
this.pb_3=create pb_3
this.pb_1=create pb_1
this.dw_entradas=create dw_entradas
this.Control[]={this.pb_3,&
this.pb_1,&
this.dw_entradas}
end on

on tabpage_1.destroy
destroy(this.pb_3)
destroy(this.pb_1)
destroy(this.dw_entradas)
end on

type pb_3 from picturebutton within tabpage_1
string tag = "Eliminar"
integer x = 5769
integer y = 156
integer width = 146
integer height = 128
integer taborder = 54
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Entrada Almacen"
end type

event clicked;if dw_entradas.rowcount()=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' and ii_legal=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')<>'2' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')<>'2' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' and ii_legal=0 then return
dw_entradas.deleterow(0)
ibn_cambio=true
dw_entradas.setredraw(true)
end event

type pb_1 from picturebutton within tabpage_1
string tag = "Traer Entradas"
integer x = 5765
integer y = 24
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.GIF"
string powertiptext = "Nuevo Entrada Almacen"
end type

event clicked;if tab_2.t2_3.tab_4.t4_1.dw_cab.rowcount()=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then return
if tab_2.t2_3.t5.t5_1.dw_cpo.rowcount()=0 then return
st_ord_pago inte
inte.tdoc=tab_2.t2_3.t5.t5_1.dw_cpo.getitemstring(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tipodoc')
inte.docu=tab_2.t2_3.t5.t5_1.dw_cpo.getitemstring(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'documento')
inte.dw_cpo=dw_entradas
openwithparm(w_interfaz_sum_entradas,inte)
ibn_cambio=true
end event

type dw_entradas from datawindow within tabpage_1
integer x = 41
integer y = 28
integer width = 5691
integer height = 572
integer taborder = 60
string title = "none"
string dataobject = "dw_tesorelfact_sentrada"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_save_def from picturebutton within t2_3
integer x = 5705
integer y = 208
integer width = 142
integer height = 124
integer taborder = 44
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
string powertiptext = "Guardar Definitivo"
end type

event clicked;if tab_2.t2_3.tab_4.t4_1.dw_cab.rowcount()=0 then return
//if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' or tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then 
	if ibn_cambio or ibn_nueva then grabar('1')
else
	if messagebox("Atención",'Está seguro que desea guardar definitivamente?, recuerde que no podrá realizar cambios posteriormente .',question!,yesno!,1)=2 then return
	ibn_cambio=true
	grabar('1')
end if
end event

type pb_save from picturebutton within t2_3
integer x = 5701
integer y = 60
integer width = 142
integer height = 124
integer taborder = 34
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guadar Temporal"
end type

event clicked;if tab_2.t2_3.tab_4.t4_1.dw_cab.rowcount()=0 then return
if ii_legal=1 then return
ii_legal=0
grabar('0')

end event

type st_4 from statictext within t2_3
integer x = 18
integer y = 1464
integer width = 558
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impuestos del Concepto:"
boolean focusrectangle = false
end type

type tab_4 from tab within t2_3
event create ( )
event destroy ( )
integer x = 18
integer y = 20
integer width = 6002
integer height = 688
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean showtext = false
boolean pictureonright = true
tabposition tabposition = tabsonright!
alignment alignment = center!
integer selectedtab = 1
t4_1 t4_1
t4_2 t4_2
end type

on tab_4.create
this.t4_1=create t4_1
this.t4_2=create t4_2
this.Control[]={this.t4_1,&
this.t4_2}
end on

on tab_4.destroy
destroy(this.t4_1)
destroy(this.t4_2)
end on

type t4_1 from userobject within tab_4
integer x = 18
integer y = 16
integer width = 5856
integer height = 656
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "pesos_deta.ico"
long picturemaskcolor = 536870912
dw_cab dw_cab
end type

on t4_1.create
this.dw_cab=create dw_cab
this.Control[]={this.dw_cab}
end on

on t4_1.destroy
destroy(this.dw_cab)
end on

type dw_cab from datawindow within t4_1
integer x = 27
integer y = 4
integer width = 5609
integer height = 640
integer taborder = 30
string title = "none"
string dataobject = "dw_det_tesrelfac"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('cod_flujo',idw_desti)
idw_desti.settransobject(sqlca)
idw_desti.retrieve(is_cdoc)
end event

event itemchanged;choose case dwo.name
	case 'cod_flujo' 
		long j
		for j=1 to dw_rela.rowcount()
			dw_rela.setitem(j,'codigo',data)
		next
	case 'anticipo'
		tab_2.t2_3.t5.t5_1.dw_cpo.post event p_itemchanged()
	case 'fecha_rel'
		if not f_valida_fecha( datetime(data) , 'M' , 2 , datetime(string(today())+' '+string(now())),'Y' ) then
			return 2
		end if
	case 'tiporelacion'
		accepttext()
		if data<>'1' then 
			setitem(getrow(),'doc_eqv',0)
			string l_nulo
			setnull(l_nulo)
			setitem(getrow(),'con_doc_eqv',l_nulo)
			return 2
		end If
		
	case 'fecha_fact'
		if not f_valida_fecha( datetime(data), 'M' , 2 , datetime(getitemdatetime(getrow(),'fecha_rel')),'Y' ) then
			return 2
		end if
end choose
accepttext()
ibn_cambio=true

end event

event retrieveend;if rowcount<1 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='0' then 
	tab_2.t2_3.pb_save.enabled=true
	tab_2.t2_3.pb_save_def.enabled=true
	tab_2.t2_3.pb_ajusta.enabled=false
	idw_concep.retrieve(is_emp,'R','1')
	idw_concep_cont.retrieve(is_emp,'R','1')
	idw_concep_legal.retrieve(is_emp,'R','1')
	idw_concep_legal_1.retrieve(is_emp,'R','1')
else
	tab_2.t2_3.pb_save.enabled=false
	tab_2.t2_3.pb_save_def.enabled=false
	tab_2.t2_3.pb_ajusta.enabled=true
	idw_concep.retrieve('%','R','%')
	idw_concep_cont.retrieve('%','R','%')
	idw_concep_legal.retrieve('%','R','1')
	idw_concep_legal_1.retrieve('%','R','%')
end if

if not isnull(tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'estado')) then 
	tab_2.t2_3.pb_save.enabled=false
	tab_2.t2_3.pb_save_def.enabled=false
	tab_2.t2_3.pb_ajusta.enabled=false
end if
end event

type t4_2 from userobject within tab_4
integer x = 18
integer y = 16
integer width = 5856
integer height = 656
long backcolor = 67108864
string text = "Cons. Imp."
long tabtextcolor = 33554432
string picturename = "calculator.ico"
long picturemaskcolor = 536870912
string powertiptext = "Consolidado de Impuestos"
dw_tot dw_tot
end type

on t4_2.create
this.dw_tot=create dw_tot
this.Control[]={this.dw_tot}
end on

on t4_2.destroy
destroy(this.dw_tot)
end on

type dw_tot from datawindow within t4_2
integer x = 165
integer y = 16
integer width = 5449
integer height = 588
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_tesorelfact_totimpu"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type cbx_1 from checkbox within t2_3
integer x = 5006
integer y = 716
integer width = 645
integer height = 56
integer taborder = 25
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir Nueva radicación"
end type

type pb_new_tax from picturebutton within t2_3
integer x = 5810
integer y = 1572
integer width = 146
integer height = 128
integer taborder = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar Impuesto"
end type

event clicked;if t5.t5_1.dw_cpo.rowcount()=0 then return -1
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' and ii_legal=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')<>'2' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')<>'2' and ii_legal=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' and ii_legal=0 then return

//if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then return
if is_orig='NM' then 
	messagebox('Atención','Esta recepción es de Nómina no puede agregar Impuestos')
	return
end if
long donde,j
donde=t_ret.t_o.dw_rte.insertrow(0)
t_ret.t_o.dw_rte.setitem(donde,'borrar',1)
t_ret.t_o.dw_rte.setitem(donde,'clugar',t5.t5_1.dw_cpo.getitemstring(t5.t5_1.dw_cpo.getrow(),'clugar'))
t_ret.t_o.dw_rte.setitem(donde,'coddoc',t5.t5_1.dw_cpo.getitemstring(t5.t5_1.dw_cpo.getrow(),'coddoc'))
t_ret.t_o.dw_rte.setitem(donde,'item',t5.t5_1.dw_cpo.getitemnumber(t5.t5_1.dw_cpo.getrow(),'item'))
t_ret.t_o.dw_rte.setitem(donde,'nrelacion',t5.t5_1.dw_cpo.getitemnumber(t5.t5_1.dw_cpo.getrow(),'nrelacion'))
t_ret.t_o.dw_rte.setitem(donde,'tipodoc',t5.t5_1.dw_cpo.getitemstring(t5.t5_1.dw_cpo.getrow(),'tipodoc'))
t_ret.t_o.dw_rte.setitem(donde,'documento',t5.t5_1.dw_cpo.getitemstring(t5.t5_1.dw_cpo.getrow(),'documento'))
t_ret.t_o.dw_rte.setcolumn('documento')
t_ret.t_o.dw_rte.event itemchanged(donde,t_ret.t_o.dw_rte.object.documento,t5.t5_1.dw_cpo.getitemstring(t5.t5_1.dw_cpo.getrow(),'documento'))
for j=1 to t_ret.t_o.dw_rte.rowcount()
	if t_ret.t_o.dw_rte.find('subitem='+string(j),1,t_ret.t_o.dw_rte.rowcount())=0 then exit
next
t_ret.t_o.dw_rte.setitem(donde,'subitem',j)
ibn_cambio=true
return donde 
end event

type pb_del_tax from picturebutton within t2_3
integer x = 5815
integer y = 1708
integer width = 146
integer height = 128
integer taborder = 66
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Impuesto"
end type

event clicked;if t_ret.t_o.dw_rte.rowcount()=0 then return
//if dw_rte.getitemnumber(dw_rte.getrow(),'borrar')=0 then return // pa que deje borrar las filas que metieron a mano cuando es de contratos
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' and ii_legal=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')<>'2' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')<>'2' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' and ii_legal=0 then return
//if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' then return
t_ret.t_o.dw_rte.deleterow(0)
t_ret.t_o.dw_rte.event p_itemchanged('C')
ibn_cambio=true
t_ret.t_o.dw_rte.setredraw(true)
end event

type pb_ajusta from picturebutton within t2_3
integer x = 5810
integer y = 1848
integer width = 146
integer height = 128
integer taborder = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "ajustar.jpg"
string disabledname = "d_ajustar.jpg"
string powertiptext = "Modificar Deducciones"
end type

event clicked;if f_permiso_boton(this,'RFC')=0 then return
if t5.t5_1.dw_cpo.rowcount()=0 then return -1
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' and ii_legal=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')<>'2' then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')<>'2' and ii_legal=0 then return
if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'defi_legal')='0' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' and ii_legal=0 then return

if is_orig='NM' then 
	messagebox('Atención','Esta recepción es de Nómina no puede ajustar Impuestos')
	return
end if
if messagebox("Atención","Va modificar valores en Retenciones y Reserva, desea ejecutar el proceso?",question!,yesno!,2)=2 then
	return 1
else
	st_xa_antis impu
	impu.dw_cpo=t5.t5_1.dw_cpo
	impu.dw_intfaz=tab_2.t2_3.t_ret.t_o.dw_rte
	impu.dw_rten=tab_2.t2_3.t_ret.t_c.dw_rtem
	openwithparm(w_mod_impuestos,impu)
	tab_2.t2_2.dw_hist.event rowfocuschanged(0)
end if
end event

type t2_4 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 6075
integer height = 2064
long backcolor = 67108864
string text = "Ordenes de pago"
long tabtextcolor = 33554432
string picturename = "factura.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las ordenes de pago realizadas a la radicación seleccionada"
st_10 st_10
dw_ord_pag dw_ord_pag
end type

on t2_4.create
this.st_10=create st_10
this.dw_ord_pag=create dw_ord_pag
this.Control[]={this.st_10,&
this.dw_ord_pag}
end on

on t2_4.destroy
destroy(this.st_10)
destroy(this.dw_ord_pag)
end on

type st_10 from statictext within t2_4
integer x = 32
integer y = 60
integer width = 1070
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble Click para ir a detalle de Orden de Pago"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_ord_pag from datawindow within t2_4
integer x = 23
integer y = 136
integer width = 5989
integer height = 1908
integer taborder = 21
string title = "none"
string dataobject = "dw_pagos_de_radica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;if row<1 then return
opensheet(w_orden_pago2,w_principal,11,original!)
w_orden_pago2.dw_terce.setitem(1,'tipodoc',getitemstring(row,'tipodoc'))
w_orden_pago2.dw_terce.setitem(1,'documento',getitemstring(row,'documento'))
w_orden_pago2.dw_terce.setcolumn('documento')
w_orden_pago2.dw_terce.event itemchanged(1,w_orden_pago2.dw_terce.object.documento,getitemstring(row,'documento'))
long donde
donde=w_orden_pago2.dw_histo_desde.find('ntransferencia='+string(getitemnumber(row,'ntransferencia')),1,w_orden_pago2.dw_histo_desde.rowcount())
if donde=0 then 
	messagebox('Atención','No se puede encontrar la orden de pago')
	return
end if
w_orden_pago2.dw_histo_desde.scrolltorow(donde)
w_orden_pago2.setfocus()
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type dw_tiva from datawindow within w_recibe_fact
string tag = "para traer el iva desde contratos"
boolean visible = false
integer x = 3611
integer y = 64
integer width = 151
integer height = 68
boolean enabled = false
string title = "none"
string dataobject = "dw_tiva_cont"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

