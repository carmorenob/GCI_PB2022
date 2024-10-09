$PBExportHeader$w_maneja_glosas.srw
forward
global type w_maneja_glosas from window
end type
type em_anyo from editmask within w_maneja_glosas
end type
type pb_res from picturebutton within w_maneja_glosas
end type
type pb_close from picturebutton within w_maneja_glosas
end type
type pb_save from picturebutton within w_maneja_glosas
end type
type pb_anula from picturebutton within w_maneja_glosas
end type
type pb_new from picturebutton within w_maneja_glosas
end type
type tab_1 from tab within w_maneja_glosas
end type
type tp_1 from userobject within tab_1
end type
type dw_encartera from datawindow within tp_1
end type
type pb_abrir from picturebutton within tp_1
end type
type rb_fac from radiobutton within tp_1
end type
type rb_con from radiobutton within tp_1
end type
type st_9 from statictext within tp_1
end type
type pb_7 from picturebutton within tp_1
end type
type pb_of from picturebutton within tp_1
end type
type dw_fac_glos from datawindow within tp_1
end type
type pb_5 from picturebutton within tp_1
end type
type pb_3 from picturebutton within tp_1
end type
type cbx_r from checkbox within tp_1
end type
type dw_factcpo from datawindow within tp_1
end type
type pb_cerrar from picturebutton within tp_1
end type
type dw_busca from datawindow within tp_1
end type
type pb_del_fact from picturebutton within tp_1
end type
type st_4 from statictext within tp_1
end type
type st_3 from statictext within tp_1
end type
type dw_lug from datawindow within tp_1
end type
type em_1 from editmask within tp_1
end type
type dw_obj_fact from datawindow within tp_1
end type
type dw_facts from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
dw_encartera dw_encartera
pb_abrir pb_abrir
rb_fac rb_fac
rb_con rb_con
st_9 st_9
pb_7 pb_7
pb_of pb_of
dw_fac_glos dw_fac_glos
pb_5 pb_5
pb_3 pb_3
cbx_r cbx_r
dw_factcpo dw_factcpo
pb_cerrar pb_cerrar
dw_busca dw_busca
pb_del_fact pb_del_fact
st_4 st_4
st_3 st_3
dw_lug dw_lug
em_1 em_1
dw_obj_fact dw_obj_fact
dw_facts dw_facts
end type
type tp_2 from userobject within tab_1
end type
type rb_o from radiobutton within tp_2
end type
type rb_t from radiobutton within tp_2
end type
type st_10 from statictext within tp_2
end type
type pb_9 from picturebutton within tp_2
end type
type pb_op from picturebutton within tp_2
end type
type pb_4 from picturebutton within tp_2
end type
type cbx_p from checkbox within tp_2
end type
type pb_2 from picturebutton within tp_2
end type
type dw_factsub from datawindow within tp_2
end type
type st_5 from statictext within tp_2
end type
type dw_dfacts from datawindow within tp_2
end type
type dw_procs from datawindow within tp_2
end type
type dw_obj_proc from datawindow within tp_2
end type
type dw_proc_glos from datawindow within tp_2
end type
type st_8 from statictext within tp_2
end type
type tp_2 from userobject within tab_1
rb_o rb_o
rb_t rb_t
st_10 st_10
pb_9 pb_9
pb_op pb_op
pb_4 pb_4
cbx_p cbx_p
pb_2 pb_2
dw_factsub dw_factsub
st_5 st_5
dw_dfacts dw_dfacts
dw_procs dw_procs
dw_obj_proc dw_obj_proc
dw_proc_glos dw_proc_glos
st_8 st_8
end type
type tp_3 from userobject within tab_1
end type
type st_11 from statictext within tp_3
end type
type pb_11 from picturebutton within tp_3
end type
type pb_oi from picturebutton within tp_3
end type
type st_7 from statictext within tp_3
end type
type st_6 from statictext within tp_3
end type
type dw_dprocs from datawindow within tp_3
end type
type dw_dfacts2 from datawindow within tp_3
end type
type dw_obj_sitem from datawindow within tp_3
end type
type dw_item_glos from datawindow within tp_3
end type
type dw_sitem from datawindow within tp_3
end type
type tp_3 from userobject within tab_1
st_11 st_11
pb_11 pb_11
pb_oi pb_oi
st_7 st_7
st_6 st_6
dw_dprocs dw_dprocs
dw_dfacts2 dw_dfacts2
dw_obj_sitem dw_obj_sitem
dw_item_glos dw_item_glos
dw_sitem dw_sitem
end type
type tab_1 from tab within w_maneja_glosas
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
type st_2 from statictext within w_maneja_glosas
end type
type st_1 from statictext within w_maneja_glosas
end type
type dw_histo from datawindow within w_maneja_glosas
end type
type dw_deta from datawindow within w_maneja_glosas
end type
type st_12 from statictext within w_maneja_glosas
end type
end forward

global type w_maneja_glosas from window
integer width = 6144
integer height = 2560
boolean titlebar = true
string title = "Cartera - Manejo de Objecciones"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_objeccion.ico"
event cargar ( )
em_anyo em_anyo
pb_res pb_res
pb_close pb_close
pb_save pb_save
pb_anula pb_anula
pb_new pb_new
tab_1 tab_1
st_2 st_2
st_1 st_1
dw_histo dw_histo
dw_deta dw_deta
st_12 st_12
end type
global w_maneja_glosas w_maneja_glosas

type variables
string i_cdoc='GL',i_desdoc,i_operacion
datawindowchild idw_obj,idw_espe,idw_usuresp
datawindowchild idw_obj2,idw_espe2
datawindowchild idw_obj3,idw_espe3
datawindowchild idw_facts,idw_facts2,idw_procs
datawindowchild idw_usuresp2, idw_usuresp3
datawindowchild idw_lugar
boolean i_nuevo,i_cambio, i_total, i_procesa
long i_ndoc
int l_anyo, l_mes,l_min, l_max
st_amortizar st_p

end variables

forward prototypes
public function integer f_pregunta ()
public function integer grabar ()
public function integer valida (datawindow p_dw, long p_fila, string p_tipo, string p_columna, ref boolean p_continuar)
public function integer calcula_sub (long p_row, integer p_desde, double p_porcen)
public function double f_sum_obj_item (double nfact, string lugar, long item, long ndeta)
public function double calc_diff ()
public function integer fin_procesa ()
public function integer inicia_procesa ()
public function double f_sum_obj_fact (double nfact, string lugar, string tipo)
public function double f_sum_obj_proc (double nfact, string lugar, string tipo, integer item)
end prototypes

event cargar();st_p = Message.PowerObjectParm
em_anyo.TriggerEvent(modified!)
end event

public function integer f_pregunta ();tab_1.tp_1.dw_obj_fact.event losefocus()
tab_1.tp_2.dw_obj_proc.event losefocus()
tab_1.tp_3.dw_obj_sitem.event losefocus()
if not i_cambio then return 2
return messagebox("Atención, realizó cambios",'Desea guardar los cambios?',question!,yesnocancel!,3)
end function

public function integer grabar ();if dw_deta.accepttext()=-1 then return -1
if tab_1.tp_1.dw_facts.accepttext()=-1 then return -1
if not i_cambio and (not i_nuevo) then return 1
if dw_histo.GetItemString(dw_histo.GetRow(),'estado') = 'A' then 
	MessageBox('Atención','La objeción ya ha sido anulada')
	Return -1
end if
string err
long item, i,j, k
if i_nuevo then 
	i_ndoc=f_trae_ndoc(i_cdoc,clugar,i_desdoc)
	if i_ndoc=-1 then return -1
else
	i_ndoc=dw_deta.getitemnumber(1,'num_glosa')
end if
dw_deta.setitem(1,"anyo",year(today()))
if isnull(dw_deta.getitemnumber(1,'num_glosa')) or dw_deta.getitemnumber(1,'num_glosa')<>i_ndoc then dw_deta.setitem(1,'num_glosa',i_ndoc)
for j=1 to tab_1.tp_1.dw_facts.Rowcount()
	if isnull(tab_1.tp_1.dw_facts.getitemnumber(j,'num_glosa')) or tab_1.tp_1.dw_facts.getitemnumber(j,'num_glosa')<>i_ndoc then 
		tab_1.tp_1.dw_facts.setitem(j,'num_glosa',i_ndoc)
	end if
next

if i_nuevo then
	tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
	tab_1.tp_1.dw_fac_glos.SetFilter("")
	tab_1.tp_1.dw_fac_glos.Filter()
	for k = 1 to tab_1.tp_1.dw_fac_glos.RowCount()
		tab_1.tp_1.dw_fac_glos.SetItem(k,'num_glosa',i_ndoc)
	next
	tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
end if

tab_1.tp_2.dw_procs.setredraw(false)
tab_1.tp_2.dw_procs.setfilter('not isnull(subitem)')
tab_1.tp_2.dw_procs.filter()
for j=1 to tab_1.tp_2.dw_procs.rowcount()
	if isnull(tab_1.tp_2.dw_procs.getitemnumber(j,'num_glosa')) or tab_1.tp_2.dw_procs.getitemnumber(j,'num_glosa')<>i_ndoc then 
		tab_1.tp_2.dw_procs.setitem(j,'num_glosa',i_ndoc)
	end if
next

if i_nuevo then
	tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
	tab_1.tp_2.dw_proc_glos.SetFilter("")
	tab_1.tp_2.dw_proc_glos.Filter()
	for k = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
		tab_1.tp_2.dw_proc_glos.SetItem(k,'num_glosa',i_ndoc)
	next
	tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
end if

tab_1.tp_3.dw_sitem.setredraw(false)
tab_1.tp_3.dw_sitem.setfilter('not isnull(subitem)')
tab_1.tp_3.dw_sitem.filter()
for j=1 to tab_1.tp_3.dw_sitem.rowcount()
	if isnull(tab_1.tp_3.dw_sitem.getitemnumber(j,'num_glosa')) or tab_1.tp_3.dw_sitem.getitemnumber(j,'num_glosa')<>i_ndoc then 
		tab_1.tp_3.dw_sitem.setitem(j,'num_glosa',i_ndoc)
	end if
next

if i_nuevo then
	tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
	tab_1.tp_3.dw_item_glos.SetFilter("")
	tab_1.tp_3.dw_item_glos.Filter()
	for k = 1 to tab_1.tp_3.dw_item_glos.RowCount()
		tab_1.tp_3.dw_item_glos.SetItem(k,'num_glosa',i_ndoc)
	next
	tab_1.tp_3.dw_sitem.Event rowfocuschanged(tab_1.tp_3.dw_sitem.GetRow())
	tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
end if

tab_1.tp_1.dw_facts.event rowfocuschanged(tab_1.tp_1.dw_facts.getrow())
tab_1.tp_2.dw_procs.setredraw(true)
tab_1.tp_3.dw_sitem.setredraw(true)
if dw_deta.update(true,false)=-1 then return -1
i_operacion = 'Delete'
if tab_1.tp_3.dw_item_glos.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_3.dw_sitem.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_2.dw_proc_glos.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_2.dw_procs.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_fac_glos.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_facts.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
i_operacion = 'Insert'
if tab_1.tp_1.dw_facts.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_fac_glos.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_2.dw_procs.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_2.dw_proc_glos.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_3.dw_sitem.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if tab_1.tp_3.dw_item_glos.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
i_operacion = ''
dw_deta.resetupdate()
tab_1.tp_1.dw_facts.resetupdate()
tab_1.tp_2.dw_procs.resetupdate()
tab_1.tp_3.dw_sitem.resetupdate()
tab_1.tp_1.dw_fac_glos.resetupdate()
tab_1.tp_2.dw_proc_glos.resetupdate()
tab_1.tp_3.dw_item_glos.resetupdate()
if i_nuevo then
	string clug_cob,ctipo
	long ncobro,item_cob
	ncobro=dw_deta.getitemnumber(1,'num_cobro')
	clug_cob=dw_deta.getitemstring(1,'clugar_cob')
	ctipo=dw_deta.getitemstring(1,'cartipo')
	item_cob=dw_deta.getitemnumber(1,'item_cob')
	update car_cobro_cpo set coddoc_glosa='GL' ,clugar_glosa=:clugar , num_glosa=:i_ndoc where
	clugar =:clug_cob and coddoc ='CXC' and num_cobro =:ncobro and cartipo =:ctipo and item=:item_cob;
	if sqlca.sqlcode=-1 then 
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando car_cobro_cpo',err)
		return -1
	end if
	dw_histo.setitem(1,'num_glosa',i_ndoc)
	dw_histo.setitem(1,'clugar',clugar)
	dw_histo.resetupdate()
end if
i_nuevo=false
i_cambio=false
pb_new.enabled=true
dw_deta.event set_diff()
dw_deta.resetupdate()
return 1

end function

public function integer valida (datawindow p_dw, long p_fila, string p_tipo, string p_columna, ref boolean p_continuar);choose case p_tipo
	case 'fecha'
		if isnull(p_dw.getitemdatetime(p_fila,p_columna)) then
			if not p_continuar then
//				if messagebox('Atención','Hay datos que faltan por completar, desea continuar y revisar las otras objeciones',question!,yesno!,1)=2 then return -1
				messagebox('Atención','Hay datos que faltan por completar') 
				return -1
				p_continuar=true
			end if
			return 0
		end if
	case 'number'
		if isnull(p_dw.getitemnumber(p_fila,p_columna)) then
			if not p_continuar then
				//if messagebox('Atención','Hay datos que faltan por completar, desea continuar y revisar las otras objeciones',question!,yesno!,1)=2 then return -1
				messagebox('Atención','Hay datos que faltan por completar')
				return -1
				p_continuar=true
			end if
			return 0
		end if
		if p_dw.getitemnumber(p_fila,p_columna)=0 then
			if not p_continuar then
//				if messagebox('Atención','Hay valor de Objeciones en cero. Desea Continuar?',question!,yesno!,1)=2 then return -1
				messagebox('Atención','Hay valor de Objeciones en cero')
				return -1
				p_continuar=true
			end if
			return 0
		end if
	case 'string'
		if isnull(p_dw.getitemstring(p_fila,p_columna)) then
			if not p_continuar then
				//if messagebox('Atención','Hay datos que faltan por completar, desea continuar y revisar las otras objeciones',question!,yesno!,1)=2 then return -1
				messagebox('Atención','Hay datos que faltan por completar')
				return -1
				p_continuar=true
			end if
			return 0
		end if
end choose
return 1
end function

public function integer calcula_sub (long p_row, integer p_desde, double p_porcen);// para calcular de hay pa abajo los valores porcentuados
// p_desde: 0: todo (desde facts), 1:desde procs.
datawindow dw_t,dw_2, dw_g
long j, t, i
if p_desde = 0 then
	dw_g = tab_1.tp_1.dw_fac_glos
	dw_t = tab_1.tp_1.dw_facts
	dw_2 = tab_1.tp_2.dw_procs
	for j=1 to dw_2.rowcount()
		dw_2.setitem(j,'valor_objecion',0)
	next
	for i = 1 to dw_g.RowCount() // cada objecion
		p_porcen = dw_g.getitemnumber(i,'valor_objecion') / dw_t.getitemnumber(p_row,'vtemp')
		for j=1 to dw_2.rowcount()
			tab_1.tp_2.dw_procs.event setModified(j)
			dw_2.setitem(j,'valor_objecion',dw_2.GetItemNumber(j,'valor_objecion') + round(dw_2.getitemnumber(j,'vemp') * p_porcen,i_dec_gral_car))
			if dw_2.getitemstring(j,'agrupser')='04' then
				dw_2.scrolltorow(j)
				calcula_sub(j,1,p_porcen)
			end if
		next
	next
else
	dw_g = tab_1.tp_2.dw_proc_glos
	dw_t = tab_1.tp_2.dw_procs
	if dw_t.GetRow() <> p_row then dw_t.ScrolltoRow(p_row)
	dw_2 = tab_1.tp_3.dw_sitem
	if p_porcen = 0 then	p_porcen = dw_g.getitemnumber(dw_g.GetRow(),'valor_objecion') / dw_t.getitemnumber(p_row,'vtemp')
	for i = 1 to dw_g.RowCount() // cada objecion
		for j=1 to dw_2.rowcount()
			tab_1.tp_3.dw_sitem.event setModified(j)
			if i = 1 then
				dw_2.setitem(j,'valor_objecion',round(dw_2.getitemnumber(j,'vemp') * p_porcen ,i_dec_gral_car))
			else
				dw_2.setitem(j,'valor_objecion',dw_2.GetItemNumber(j,'valor_objecion') + round(dw_2.getitemnumber(j,'vemp') * p_porcen ,i_dec_gral_car))
			end if
		next
	next
end if

Return 1

end function

public function double f_sum_obj_item (double nfact, string lugar, long item, long ndeta);long i, f, fila, fp
double total, vbase
string clug
double fact, nitem, deta, objf, objp, obji

//if not i_procesa then
	fact = tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.Getrow(),'nfact')
	clug = tab_1.tp_1.dw_facts.GetItemString(tab_1.tp_1.dw_facts.Getrow(),'clugar_fact')
	if tab_1.tp_2.dw_procs.RowCount() > 0 then
		nitem = tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.Getrow(),'nitem_fac')
	end if
	if tab_1.tp_3.dw_sitem.RowCount() > 0 then
		deta = tab_1.tp_3.dw_sitem.GetItemNumber(tab_1.tp_3.dw_sitem.Getrow(),'ndeta_sfac')
	end if
	if tab_1.tp_1.dw_fac_glos.RowCount() > 0 then
		objf = tab_1.tp_1.dw_fac_glos.GetItemNumber(tab_1.tp_1.dw_fac_glos.GetRow(),'nobjecion')
	end if
	if tab_1.tp_2.dw_proc_glos.RowCount() > 0 then
		objp = tab_1.tp_2.dw_proc_glos.GetItemNumber(tab_1.tp_2.dw_proc_glos.GetRow(),'nobjecion')
	end if
	if tab_1.tp_3.dw_item_glos.RowCount() > 0 then
		obji = tab_1.tp_3.dw_item_glos.GetItemNumber(tab_1.tp_3.dw_item_glos.GetRow(),'nobjecion')
	end if
if not i_procesa then		
	tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
	tab_1.tp_3.dw_sitem.SetRedraw(FALSE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
end if

tab_1.tp_3.dw_item_glos.SetFilter("")
tab_1.tp_3.dw_item_glos.Filter()
fp = tab_1.tp_3.dw_item_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and nitem_fact="+string(item),1,tab_1.tp_3.dw_item_glos.RowCount())
do while fp > 0
	total = total + tab_1.tp_3.dw_item_glos.GetItemNumber(fp,'valor_objecion')
	if fp + 1 > tab_1.tp_3.dw_item_glos.RowCount() then EXIT
	fp = tab_1.tp_3.dw_item_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and nitem_fact="+string(item),fp + 1,tab_1.tp_3.dw_item_glos.RowCount())
loop
//for i = 1 to tab_1.tp_3.dw_item_glos.RowCount()
//	if tab_1.tp_3.dw_item_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_3.dw_item_glos.GetItemString(i,'clugar_fact') = lugar and tab_1.tp_3.dw_item_glos.GetItemNumber(i,'nitem_fact') = item and tab_1.tp_3.dw_item_glos.GetItemNumber(i,'ndeta_fact') = ndeta then
//		total = total + tab_1.tp_3.dw_item_glos.GetItemNumber(i,'valor_objecion')
//	end if
//next

// Base para aplicar porcentajes desde objeciones de procedimientos y facturas
tab_1.tp_3.dw_sitem.SetFilter("")
tab_1.tp_3.dw_sitem.Filter()
f = tab_1.tp_3.dw_sitem.Find("cnf="+string(nfact)+" and clugar_sfac='"+lugar+"' and nitem="+string(item) +" and ndeta_sfac="+string(ndeta),1,tab_1.tp_3.dw_sitem.RowCount())
if f > 0 then
	vbase = tab_1.tp_3.dw_sitem.GetItemNumber(f,'vemp')
end if

tab_1.tp_2.dw_proc_glos.SetFilter("")
tab_1.tp_2.dw_proc_glos.Filter()
fp = tab_1.tp_2.dw_proc_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and nitem_fact="+string(item),1,tab_1.tp_2.dw_proc_glos.RowCount())
do while fp > 0
	total = total +  tab_1.tp_2.dw_proc_glos.GetItemNumber(fp,'porcentaje') * vbase / 100
	if fp + 1 > tab_1.tp_2.dw_proc_glos.RowCount() then EXIT
	fp = tab_1.tp_2.dw_proc_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and nitem_fact="+string(item),fp + 1,tab_1.tp_2.dw_proc_glos.RowCount())
loop
//for i = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
//	if tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_2.dw_proc_glos.GetItemString(i,'clugar_fact') = lugar and tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'nitem_fact') = item  then
//		total = total + round(tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'porcentaje') * vbase / 100,i_dec_gral_car)
//	end if
//next

tab_1.tp_1.dw_fac_glos.SetFilter("")
tab_1.tp_1.dw_fac_glos.Filter()
fp = tab_1.tp_1.dw_fac_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"'",1,tab_1.tp_1.dw_fac_glos.RowCount())
do while fp > 0
	total = total + tab_1.tp_1.dw_fac_glos.GetItemNumber(fp,'porcentaje') * vbase / 100
	if fp + 1 > tab_1.tp_1.dw_fac_glos.RowCount() then EXIT
	fp = tab_1.tp_1.dw_fac_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"'",fp + 1,tab_1.tp_1.dw_fac_glos.RowCount())
loop
//for i = 1 to tab_1.tp_1.dw_fac_glos.RowCount()
//	if tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_1.dw_fac_glos.GetItemString(i,'clugar_fact') = lugar then
//		total = total + round(tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'porcentaje') * vbase / 100,i_dec_gral_car)
//	end if
//next

//if not i_procesa then
	fila = tab_1.tp_1.dw_facts.Find('nfact='+string(fact)+" and clugar_fact='"+clug+"'",1,tab_1.tp_1.dw_facts.RowCount())
	if fila > 0 then
		tab_1.tp_1.dw_facts.ScrolltoRow(fila)
		tab_1.tp_1.dw_facts.Event RowFocuschanged(fila)
	end if
	fila = tab_1.tp_1.dw_fac_glos.Find('nobjecion='+string(objf),1,tab_1.tp_1.dw_fac_glos.RowCount())
	if fila > 0 then
		tab_1.tp_1.dw_fac_glos.ScrolltoRow(fila)
	end if
	
	fila = tab_1.tp_2.dw_procs.Find("nfact_cpo="+string(fact)+" and clug_fac='"+clug+"' and nitem_fac="+string(nitem),1,tab_1.tp_2.dw_procs.RowCount())
	if fila > 0 then
		tab_1.tp_2.dw_procs.ScrolltoRow(fila)
		tab_1.tp_2.dw_procs.Event RowFocuschanged(fila)
	end if
	fila = tab_1.tp_2.dw_proc_glos.Find("nobjecion="+string(objp),1,tab_1.tp_2.dw_proc_glos.RowCount())
	if fila > 0 then
		tab_1.tp_2.dw_proc_glos.ScrolltoRow(fila)
	end if
	
	fila = tab_1.tp_3.dw_sitem.Find("cnf="+string(fact)+" and clugar_sfac='"+clug+"' and nitem="+string(nitem)+" and ndeta_sfac="+string(deta),1,tab_1.tp_3.dw_sitem.RowCount())
	if fila > 0 then
		tab_1.tp_3.dw_sitem.ScrolltoRow(fila)
		tab_1.tp_3.dw_sitem.Event RowFocuschanged(fila)
	end if
	fila = tab_1.tp_3.dw_item_glos.Find("nobjecion="+string(obji),1,tab_1.tp_3.dw_item_glos.RowCount())
	if fila > 0 then
		tab_1.tp_3.dw_item_glos.ScrolltoRow(fila)
	end if
	
if not i_procesa then		
	tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
	tab_1.tp_3.dw_sitem.SetRedraw(TRUE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
end if

Return round(total,i_dec_gral_car)



//long i, f, fila, fs
//double total, vbase
//string filtro
//filtro = tab_1.tp_3.dw_item_glos.describe("Datawindow.Table.Filter")
//fila = tab_1.tp_3.dw_sitem.GetRow()
//fs = tab_1.tp_3.dw_sitem.GetRow()
//tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
//tab_1.tp_3.dw_item_glos.SetFilter("")
//tab_1.tp_3.dw_item_glos.Filter()
//for i = 1 to tab_1.tp_3.dw_item_glos.RowCount()
//	if tab_1.tp_3.dw_item_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_3.dw_item_glos.GetItemString(i,'clugar_fact') = lugar and tab_1.tp_3.dw_item_glos.GetItemNumber(i,'nitem_fact') = item and tab_1.tp_3.dw_item_glos.GetItemNumber(i,'ndeta_fact') = ndeta then
//		total = total + tab_1.tp_3.dw_item_glos.GetItemNumber(i,'valor_objecion')
//	end if
//next
//if not(filtro='?' or filtro ='!') then
//	tab_1.tp_3.dw_item_glos.SetFilter(filtro)
//	tab_1.tp_3.dw_item_glos.Filter()
//end if
//tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
//
//// Base para aplicar porcentajes desde objeciones de procedimientos y facturas
//filtro = tab_1.tp_3.dw_sitem.describe("Datawindow.Table.Filter")
//tab_1.tp_3.dw_sitem.SetRedraw(FALSE)
//tab_1.tp_3.dw_sitem.SetFilter("")
//tab_1.tp_3.dw_sitem.Filter()
//f = tab_1.tp_3.dw_sitem.Find("cnf="+string(nfact)+" and clugar_sfac='"+lugar+"' and nitem="+string(item) +" and ndeta_sfac="+string(ndeta),1,tab_1.tp_3.dw_sitem.RowCount())
//if f > 0 then
//	vbase = tab_1.tp_3.dw_sitem.GetItemNumber(f,'vemp')
//end if
//tab_1.tp_3.dw_sitem.SetFilter(filtro)
//tab_1.tp_3.dw_sitem.Filter()
//if fs > 0 then tab_1.tp_3.dw_sitem.ScrolltoRow(fs)
//tab_1.tp_3.dw_sitem.SetRedraw(TRUE)
//
//
//filtro = tab_1.tp_2.dw_proc_glos.describe("Datawindow.Table.Filter")
//tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
//tab_1.tp_2.dw_proc_glos.SetFilter("")
//tab_1.tp_2.dw_proc_glos.Filter()
//for i = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
//	if tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_2.dw_proc_glos.GetItemString(i,'clugar_fact') = lugar and tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'nitem_fact') = item  then
//		total = total + round(tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'porcen') * vbase / 100,i_dec_gral_car)
//	end if
//next
//tab_1.tp_2.dw_proc_glos.SetFilter(filtro)
//tab_1.tp_2.dw_proc_glos.Filter()
//tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
//
//filtro = tab_1.tp_1.dw_fac_glos.describe("Datawindow.Table.Filter")
//tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
//tab_1.tp_1.dw_fac_glos.SetFilter("")
//tab_1.tp_1.dw_fac_glos.Filter()
//for i = 1 to tab_1.tp_1.dw_fac_glos.RowCount()
//	if tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_1.dw_fac_glos.GetItemString(i,'clugar_fact') = lugar then
//		total = total + round(tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'porcen') * vbase / 100,i_dec_gral_car)
//	end if
//next
//tab_1.tp_1.dw_fac_glos.SetFilter(filtro)
//tab_1.tp_1.dw_fac_glos.Filter()
//tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
//
//Return round(total,i_dec_gral_car)
//
end function

public function double calc_diff ();double diff, valor
long fp, fi
fp = tab_1.tp_2.dw_procs.GetRow()
fi = tab_1.tp_3.dw_sitem.GetRow()

tab_1.tp_2.dw_procs.SetRedraw(FALSE)
tab_1.tp_3.dw_sitem.SetRedraw(FALSE)

diff = double(tab_1.tp_1.dw_facts.Describe("Evaluate('sum(diferencia)',0)"))

tab_1.tp_2.dw_procs.SetFilter('')
tab_1.tp_2.dw_procs.Filter()
valor = double(tab_1.tp_2.dw_procs.Describe("Evaluate('sum(diferencia)',0)"))
diff = diff + valor

tab_1.tp_3.dw_sitem.SetFilter('')
tab_1.tp_3.dw_sitem.Filter()
valor = double(tab_1.tp_3.dw_sitem.Describe("Evaluate('sum(diferencia)',0)"))
diff = diff + valor

tab_1.tp_1.dw_facts.Event RowFocuschanged(tab_1.tp_1.dw_facts.GetRow())
if fp > 0 then tab_1.tp_2.dw_procs.Event RowFocuschanged(fp)
if fi > 0 then tab_1.tp_3.dw_sitem.ScrolltoRow(fi)

tab_1.tp_2.dw_procs.SetRedraw(TRUE)
tab_1.tp_3.dw_sitem.SetRedraw(TRUE)

return diff

end function

public function integer fin_procesa ();tab_1.tp_1.dw_facts.SetRedraw(TRUE)
tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
tab_1.tp_1.dw_obj_fact.SetRedraw(TRUE)

tab_1.tp_2.dw_procs.SetRedraw(TRUE)
tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
tab_1.tp_2.dw_obj_proc.SetRedraw(TRUE)

tab_1.tp_3.dw_sitem.SetRedraw(TRUE)
tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
tab_1.tp_3.dw_obj_sitem.SetRedraw(TRUE)
i_procesa = FALSE
Return 0

end function

public function integer inicia_procesa ();i_procesa = TRUE
tab_1.tp_1.dw_facts.SetRedraw(FALSE)
tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
tab_1.tp_1.dw_obj_fact.SetRedraw(FALSE)

tab_1.tp_2.dw_procs.SetRedraw(FALSE)
tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
tab_1.tp_2.dw_obj_proc.SetRedraw(FALSE)

tab_1.tp_3.dw_sitem.SetRedraw(FALSE)
tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
tab_1.tp_3.dw_obj_sitem.SetRedraw(FALSE)

Return 0

end function

public function double f_sum_obj_fact (double nfact, string lugar, string tipo);long i, f, fila, fp
double total
string clug,tipof
double fact, nitem, deta, objf, objp, obji

//if not i_procesa then		
	fact = tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.Getrow(),'nfact')
	clug = tab_1.tp_1.dw_facts.GetItemString(tab_1.tp_1.dw_facts.Getrow(),'clugar_fact')
	tipof = tab_1.tp_1.dw_facts.GetItemString(tab_1.tp_1.dw_facts.Getrow(),'tipo_fact')
	if tab_1.tp_2.dw_procs.RowCount() > 0 then
		nitem = tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.Getrow(),'nitem_fac')
	end if
	if tab_1.tp_3.dw_sitem.RowCount() > 0 then
		deta = tab_1.tp_3.dw_sitem.GetItemNumber(tab_1.tp_3.dw_sitem.Getrow(),'ndeta_sfac')
	end if
	if tab_1.tp_1.dw_fac_glos.RowCount() > 0 then
		objf = tab_1.tp_1.dw_fac_glos.GetItemNumber(tab_1.tp_1.dw_fac_glos.GetRow(),'nobjecion')
	end if
	if tab_1.tp_2.dw_proc_glos.RowCount() > 0 then
		objp = tab_1.tp_2.dw_proc_glos.GetItemNumber(tab_1.tp_2.dw_proc_glos.GetRow(),'nobjecion')
	end if
	if tab_1.tp_3.dw_item_glos.RowCount() > 0 then
		obji = tab_1.tp_3.dw_item_glos.GetItemNumber(tab_1.tp_3.dw_item_glos.GetRow(),'nobjecion')
	end if
if not i_procesa then		
	tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
end if

tab_1.tp_3.dw_item_glos.SetFilter("")
tab_1.tp_3.dw_item_glos.Filter()
fp = tab_1.tp_3.dw_item_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"'",1,tab_1.tp_3.dw_item_glos.RowCount())
do while fp > 0 
	total = total + tab_1.tp_3.dw_item_glos.GetItemNumber(fp,'valor_objecion')
	if fp + 1 > tab_1.tp_3.dw_item_glos.RowCount() then EXIT
	fp = tab_1.tp_3.dw_item_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and  tipo_fact='"+tipo+"'",fp + 1,tab_1.tp_3.dw_item_glos.RowCount())
loop
//for i = 1 to tab_1.tp_3.dw_item_glos.RowCount()
//	if tab_1.tp_3.dw_item_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_3.dw_item_glos.GetItemString(i,'clugar_fact') = lugar then
//		total = total + tab_1.tp_3.dw_item_glos.GetItemNumber(i,'valor_objecion')
//	end if
//next

tab_1.tp_2.dw_proc_glos.SetFilter("")
tab_1.tp_2.dw_proc_glos.Filter()
fp = tab_1.tp_2.dw_proc_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"'",1,tab_1.tp_2.dw_proc_glos.RowCount())
do while fp > 0 
	total = total + tab_1.tp_2.dw_proc_glos.GetItemNumber(fp,'valor_objecion')
	if fp + 1 > tab_1.tp_2.dw_proc_glos.RowCount() then EXIT
	fp = tab_1.tp_2.dw_proc_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and  tipo_fact='"+tipo+"'",fp + 1,tab_1.tp_2.dw_proc_glos.RowCount())
loop
//for i = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
//	if tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_2.dw_proc_glos.GetItemString(i,'clugar_fact') = lugar then
//		total = total + tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'valor_objecion')
//	end if
//next

tab_1.tp_1.dw_fac_glos.SetFilter("")
tab_1.tp_1.dw_fac_glos.Filter()
fp = tab_1.tp_1.dw_fac_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"'",1,tab_1.tp_1.dw_fac_glos.RowCount())
do while fp > 0 
	total = total + tab_1.tp_1.dw_fac_glos.GetItemNumber(fp,'valor_objecion')
	if fp + 1 > tab_1.tp_1.dw_fac_glos.RowCount() then EXIT
	fp = tab_1.tp_1.dw_fac_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"'",fp + 1,tab_1.tp_1.dw_fac_glos.RowCount())
loop
//for i = 1 to tab_1.tp_1.dw_fac_glos.RowCount()
//	if tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_1.dw_fac_glos.GetItemString(i,'clugar_fact') = lugar then
//		total = total + tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'valor_objecion')
//	end if
//next
//if not i_procesa then
		
	fila = tab_1.tp_1.dw_facts.Find('nfact='+string(fact)+" and clugar_fact='"+clug+"' and tipo_fact='"+tipo+"'",1,tab_1.tp_1.dw_facts.RowCount())
	if fila > 0 then
		tab_1.tp_1.dw_facts.ScrolltoRow(fila)
		tab_1.tp_1.dw_facts.Event RowFocuschanged(fila)
	end if
	fila = tab_1.tp_1.dw_fac_glos.Find('nobjecion='+string(objf),1,tab_1.tp_1.dw_fac_glos.RowCount())
	if fila > 0 then
		tab_1.tp_1.dw_fac_glos.ScrolltoRow(fila)
	end if
	
	fila = tab_1.tp_2.dw_procs.Find("nfact_cpo="+string(fact)+" and clug_fac='"+clug+"' and tipo_fact='"+tipo+"' and nitem_fac="+string(nitem),1,tab_1.tp_2.dw_procs.RowCount())
	if fila > 0 then
		tab_1.tp_2.dw_procs.ScrolltoRow(fila)
		tab_1.tp_2.dw_procs.Event RowFocuschanged(fila)
	end if
	fila = tab_1.tp_2.dw_proc_glos.Find("nobjecion="+string(objp),1,tab_1.tp_2.dw_proc_glos.RowCount())
	if fila > 0 then
		tab_1.tp_2.dw_proc_glos.ScrolltoRow(fila)
	end if
	
	fila = tab_1.tp_3.dw_sitem.Find("cnf="+string(fact)+" and clugar_sfac='"+clug+"' and  tipo_fact='"+tipo+"' and nitem="+string(nitem)+" and ndeta_sfac="+string(deta),1,tab_1.tp_3.dw_sitem.RowCount())
	if fila > 0 then
		tab_1.tp_3.dw_sitem.ScrolltoRow(fila)
		tab_1.tp_3.dw_sitem.Event RowFocuschanged(fila)
	end if
	fila = tab_1.tp_3.dw_item_glos.Find("nobjecion="+string(obji),1,tab_1.tp_3.dw_item_glos.RowCount())
	if fila > 0 then
		tab_1.tp_3.dw_item_glos.ScrolltoRow(fila)
	end if
	
if not i_procesa then		
	tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
end if

Return round(total,i_dec_gral_car)

end function

public function double f_sum_obj_proc (double nfact, string lugar, string tipo, integer item);long i, f, fila, fp
double total, vbase
string clug,tipof
double fact, nitem, deta, objf, objp, obji

//if not i_procesa then
	fact = tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.Getrow(),'nfact')
	clug = tab_1.tp_1.dw_facts.GetItemString(tab_1.tp_1.dw_facts.Getrow(),'clugar_fact')
	tipof = tab_1.tp_1.dw_facts.GetItemString(tab_1.tp_1.dw_facts.Getrow(),'tipo_fact')
	if tab_1.tp_2.dw_procs.RowCount() > 0 then
		nitem = tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.Getrow(),'nitem_fac')
	end if
	if tab_1.tp_3.dw_sitem.RowCount() > 0 then
		deta = tab_1.tp_3.dw_sitem.GetItemNumber(tab_1.tp_3.dw_sitem.Getrow(),'ndeta_sfac')
	end if
	if tab_1.tp_1.dw_fac_glos.RowCount() > 0 then
		objf = tab_1.tp_1.dw_fac_glos.GetItemNumber(tab_1.tp_1.dw_fac_glos.GetRow(),'nobjecion')
	end if
	if tab_1.tp_2.dw_proc_glos.RowCount() > 0 then
		objp = tab_1.tp_2.dw_proc_glos.GetItemNumber(tab_1.tp_2.dw_proc_glos.GetRow(),'nobjecion')
	end if
	if tab_1.tp_3.dw_item_glos.RowCount() > 0 then
		obji = tab_1.tp_3.dw_item_glos.GetItemNumber(tab_1.tp_3.dw_item_glos.GetRow(),'nobjecion')
	end if
if not i_procesa then		
	tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
	tab_1.tp_2.dw_procs.SetRedraw(FALSE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
end if

tab_1.tp_3.dw_item_glos.SetFilter("")
tab_1.tp_3.dw_item_glos.Filter()
fp = tab_1.tp_3.dw_item_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+ "' and tipo_fact='"+tipo+"' and nitem_fact="+string(item),1,tab_1.tp_3.dw_item_glos.RowCount())
do while fp > 0
	total = total + tab_1.tp_3.dw_item_glos.GetItemNumber(fp,'valor_objecion')
	if fp + 1 > tab_1.tp_3.dw_item_glos.RowCount() then EXIT
	fp = tab_1.tp_3.dw_item_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+ "' and tipo_fact='"+tipo+"' and nitem_fact="+string(item),fp + 1,tab_1.tp_3.dw_item_glos.RowCount())
loop

tab_1.tp_2.dw_proc_glos.SetFilter("")
tab_1.tp_2.dw_proc_glos.Filter()
fp = tab_1.tp_2.dw_proc_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+ "' and tipo_fact='"+tipo+"' and nitem_fact="+string(item),1,tab_1.tp_2.dw_proc_glos.RowCount())
do while fp > 0
	total = total + tab_1.tp_2.dw_proc_glos.GetItemNumber(fp,'valor_objecion')
	if fp + 1 > tab_1.tp_2.dw_proc_glos.RowCount() then EXIT
	fp = tab_1.tp_2.dw_proc_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+ "' and tipo_fact='"+tipo+"' and nitem_fact="+string(item),fp + 1,tab_1.tp_2.dw_proc_glos.RowCount())
loop


// Base para aplicar porcentajes desde objeciones de facturas
tab_1.tp_2.dw_procs.SetFilter("")
tab_1.tp_2.dw_procs.Filter()
f = tab_1.tp_2.dw_procs.Find("nfact_cpo="+string(nfact)+" and clug_fac='"+lugar+ "' and tipo_fact='"+tipo+"' and nitem_fac="+string(item),1,tab_1.tp_2.dw_procs.RowCount())
if f > 0 then
	vbase = tab_1.tp_2.dw_procs.GetItemNumber(f,'vemp')
end if

tab_1.tp_1.dw_fac_glos.SetFilter("")
tab_1.tp_1.dw_fac_glos.Filter()
fp = tab_1.tp_1.dw_fac_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+ "' and tipo_fact='"+tipo+"'",1,tab_1.tp_1.dw_fac_glos.RowCount())
do while fp > 0
	total = total + (tab_1.tp_1.dw_fac_glos.GetItemNumber(fp,'porcentaje') * vbase / 100)
	if fp + 1 > tab_1.tp_1.dw_fac_glos.RowCount() then EXIT
	fp = tab_1.tp_1.dw_fac_glos.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+ "' and tipo_fact='"+tipo+"'",fp + 1,tab_1.tp_1.dw_fac_glos.RowCount())
loop


//if not i_procesa then
	fila = tab_1.tp_1.dw_facts.Find('nfact='+string(fact)+" and clugar_fact='"+clug+ "' and tipo_fact='"+tipo+"'",1,tab_1.tp_1.dw_facts.RowCount())
	if fila > 0 then
		tab_1.tp_1.dw_facts.ScrolltoRow(fila)
		tab_1.tp_1.dw_facts.Event RowFocuschanged(fila)
	end if
	fila = tab_1.tp_1.dw_fac_glos.Find('nobjecion='+string(objf),1,tab_1.tp_1.dw_fac_glos.RowCount())
	if fila > 0 then
		tab_1.tp_1.dw_fac_glos.ScrolltoRow(fila)
	end if
	
	fila = tab_1.tp_2.dw_procs.Find("nfact_cpo="+string(fact)+" and clug_fac='"+clug+ "' and tipo_fact='"+tipo+"' and nitem_fac="+string(nitem),1,tab_1.tp_2.dw_procs.RowCount())
	if fila > 0 then
		tab_1.tp_2.dw_procs.ScrolltoRow(fila)
		tab_1.tp_2.dw_procs.Event RowFocuschanged(fila)
	end if
	fila = tab_1.tp_2.dw_proc_glos.Find("nobjecion="+string(objp),1,tab_1.tp_2.dw_proc_glos.RowCount())
	if fila > 0 then
		tab_1.tp_2.dw_proc_glos.ScrolltoRow(fila)
	end if
	
	fila = tab_1.tp_3.dw_sitem.Find("cnf="+string(fact)+" and clugar_sfac='"+clug+ "' and tipo_fact='"+tipo+"' and nitem="+string(nitem)+" and ndeta_sfac="+string(deta),1,tab_1.tp_3.dw_sitem.RowCount())
	if fila > 0 then
		tab_1.tp_3.dw_sitem.ScrolltoRow(fila)
		tab_1.tp_3.dw_sitem.Event RowFocuschanged(fila)
	end if
	fila = tab_1.tp_3.dw_item_glos.Find("nobjecion="+string(obji),1,tab_1.tp_3.dw_item_glos.RowCount())
	if fila > 0 then
		tab_1.tp_3.dw_item_glos.ScrolltoRow(fila)
	end if
	
if not i_procesa then		
	tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
	tab_1.tp_2.dw_procs.SetRedraw(TRUE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
end if

Return round(total,i_dec_gral_car)

end function

on w_maneja_glosas.create
this.em_anyo=create em_anyo
this.pb_res=create pb_res
this.pb_close=create pb_close
this.pb_save=create pb_save
this.pb_anula=create pb_anula
this.pb_new=create pb_new
this.tab_1=create tab_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_histo=create dw_histo
this.dw_deta=create dw_deta
this.st_12=create st_12
this.Control[]={this.em_anyo,&
this.pb_res,&
this.pb_close,&
this.pb_save,&
this.pb_anula,&
this.pb_new,&
this.tab_1,&
this.st_2,&
this.st_1,&
this.dw_histo,&
this.dw_deta,&
this.st_12}
end on

on w_maneja_glosas.destroy
destroy(this.em_anyo)
destroy(this.pb_res)
destroy(this.pb_close)
destroy(this.pb_save)
destroy(this.pb_anula)
destroy(this.pb_new)
destroy(this.tab_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_histo)
destroy(this.dw_deta)
destroy(this.st_12)
end on

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

event open;this.postevent("cargar")
end event

event resize;tab_1.resize((newwidth - 50) , (newheight * 0.75))

//Resize pestaña facturas
tab_1.tp_1.dw_facts.resize((newwidth -150),(tab_1.height -350))
tab_1.tp_1.dw_fac_glos.resize((newwidth *0.75),(tab_1.height *0.30))
tab_1.tp_1.pb_of.x=tab_1.tp_1.dw_fac_glos.x+tab_1.tp_1.dw_fac_glos.width+30
tab_1.tp_1.pb_7.x=tab_1.tp_1.dw_fac_glos.x+tab_1.tp_1.dw_fac_glos.width+30
tab_1.tp_1.dw_obj_fact.x=tab_1.tp_1.pb_7.x+ tab_1.tp_1.pb_7.width+30
tab_1.tp_1.dw_obj_fact.resize((newwidth -150),(tab_1.height *0.30))

//Resize pestaña procedimientos
tab_1.tp_2.dw_procs.resize((newwidth -150),(tab_1.height *0.45))
tab_1.tp_2.st_10.y=tab_1.tp_2.dw_procs.y + tab_1.tp_2.dw_procs.height + 10
tab_1.tp_2.st_8.y=tab_1.tp_2.dw_procs.y + tab_1.tp_2.dw_procs.height +10

tab_1.tp_2.dw_proc_glos.y=tab_1.tp_2.dw_procs.y + tab_1.tp_2.dw_procs.height + 100
tab_1.tp_2.dw_proc_glos.x=tab_1.tp_2.dw_procs.x
tab_1.tp_2.dw_proc_glos.height =tab_1.height *0.40

tab_1.tp_2.pb_op.y=tab_1.tp_2.dw_procs.y + tab_1.tp_2.dw_procs.height + 100
tab_1.tp_2.pb_9.y=tab_1.tp_2.pb_op.y + tab_1.tp_2.pb_op.height + 50

tab_1.tp_2.pb_op.x=tab_1.tp_2.dw_proc_glos.x + tab_1.tp_2.dw_proc_glos.width + 50
tab_1.tp_2.pb_9.x=tab_1.tp_2.dw_proc_glos.x + tab_1.tp_2.dw_proc_glos.width + 50

tab_1.tp_2.dw_obj_proc.x=tab_1.tp_2.pb_op.x  + 150
tab_1.tp_2.dw_obj_proc.y=tab_1.tp_2.dw_procs.y + tab_1.tp_2.dw_procs.height +100

tab_1.tp_2.dw_obj_proc.height =tab_1.height *0.40
tab_1.tp_2.dw_obj_proc.width =tab_1.width -150


//Resize pestaña qx
tab_1.tp_3.dw_sitem.resize((newwidth -150),(tab_1.height *0.45))
tab_1.tp_3.st_11.y=tab_1.tp_3.dw_sitem.y + tab_1.tp_3.dw_sitem.height+10

tab_1.tp_3.dw_item_glos.y=tab_1.tp_3.dw_sitem.y + tab_1.tp_3.dw_sitem.height + 100
tab_1.tp_3.dw_item_glos.x=tab_1.tp_3.dw_sitem.x
tab_1.tp_3.dw_item_glos.height =tab_1.height *0.40

tab_1.tp_3.pb_oi.y=tab_1.tp_3.dw_sitem.y + tab_1.tp_3.dw_sitem.height + 100
tab_1.tp_3.pb_11.y=tab_1.tp_3.pb_oi.y + tab_1.tp_3.pb_oi.height + 50

tab_1.tp_3.pb_oi.x=tab_1.tp_3.dw_sitem.x + tab_1.tp_3.dw_sitem.width + 50
tab_1.tp_3.pb_11.x=tab_1.tp_3.dw_sitem.x + tab_1.tp_3.dw_sitem.width + 50

tab_1.tp_3.dw_obj_sitem.height =tab_1.height *0.40
tab_1.tp_3.dw_obj_sitem.width =tab_1.width -150

end event

type em_anyo from editmask within w_maneja_glosas
integer x = 759
integer y = 28
integer width = 283
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "2000~~2050"
end type

event constructor;l_anyo=year(today())
em_anyo.text=string(l_anyo)
post event modified()
end event

event modified;long f,l_nglosa

l_anyo=integer(em_anyo.text)
SELECT Min(CAR_CIERRE.MES) , Max(CAR_CIERRE.MES) into :l_min, :l_max
FROM CAR_CIERRE
GROUP BY CAR_CIERRE.ANO
HAVING (((CAR_CIERRE.ANO)=:l_anyo));

if isnull(l_min) or isnull(l_max) then 
	messagebox("Atencion", 'No hay periodos activos para este año')
	return
end if
 if  isValid(st_p) then 
	if isvalid(w_teso_cartera) then
		if isValid(st_p.dw_cab) then
			openwithparm(w_cartera_a_glosa,st_p)
		else
			if isValid(st_p.dw_cpo) then
				l_nglosa=st_p.dw_cpo.GetItemNumber(st_p.dw_cpo.GetRow(),'num_glosa')
				SELECT ANYO into :l_anyo
				FROM CAR_GLOSA_CAB
				WHERE (((CODDOC)='GL') AND ((CLUGAR)=:clugar) AND ((CAR_GLOSA_CAB.NUM_GLOSA)=:l_nglosa));
				if not isnull(l_anyo) then
					dw_histo.retrieve(clugar,l_anyo)	
					f = dw_histo.find("num_glosa="+string(l_nglosa),1,dw_histo.RowCount())
					if f > 0 then
						dw_histo.ScrolltoRow(f)
					end if
				end if
			else
				dw_histo.retrieve(clugar,l_anyo)	
			end if
		end if
	end if
else
	dw_histo.retrieve(clugar,l_anyo)	
end if
end event

type pb_res from picturebutton within w_maneja_glosas
integer x = 4215
integer y = 644
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cambia_res.gif"
string disabledname = "d_cambia_res.gif"
alignment htextalign = left!
end type

event clicked;if dw_histo.rowcount()=0 then return -1
if f_permiso_boton(this,'GLO')=0 then return -1
st_pagos st_par
st_par.coddoc=i_cdoc
st_par.clugar=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
st_par.num_cobro=dw_histo.getitemnumber(dw_histo.getrow(),'num_glosa')
openwithparm(w_cambia_respon_cartera,st_par)

end event

type pb_close from picturebutton within w_maneja_glosas
integer x = 4215
integer y = 372
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "              &c"
boolean originalsize = true
string picturename = "cerrar.gif"
string disabledname = "d_cerrar.gif"
string powertiptext = "Cerrar Objeción y llevar a Cartera"
end type

event clicked;if dw_histo.rowcount()=0 then return
if dw_histo.getitemstring(dw_histo.getrow(),'estado')<>'0' then return
if isnull(dw_deta.getitemdatetime(1,'fecha')) then
	messagebox('Atención','Debe digitar la fecha del encabezado')
	return
end if
if messageBox('Atención','Está seguro de cerrar el documento?',QUESTION!,YESNO!) = 2 then Return
if grabar()=-1 then return
commit;
long conteo
string cd,cl
double ng
cd = dw_deta.getItemString(1,'coddoc')
cl = dw_deta.getItemString(1,'clugar')
ng = dw_deta.getitemnumber(1,'num_glosa')
select count(*) into :conteo from car_glosa_cpo_det
where coddoc=:cd and clugar=:cl and num_glosa=:ng and estado = 'O';
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF
if conteo > 0 then
	messagebox('Atención','Hay facturas que no han sido cerradas')
	Return -1
end if
double diff
diff = dw_deta.getitemnumber(1,'diferencia')
if isNull(diff) then diff = 0
if dw_deta.getitemnumber(1,'cobro_valor') <> dw_deta.getitemnumber(1,'valor') + diff then
	messagebox('Atención','Los valores Reportados y Digitados no son iguales, no puede continuar')
	Return -1
end if
dw_deta.setitem(dw_deta.getrow(),'estado','1')
if dw_deta.update(true,false)=-1 then return
commit;
//st_amortizar st
//st.dw_cab=dw_deta
//openwithparm(w_cierra_objeci,st)
dw_histo.setitem(dw_histo.getrow(),'estado','1')

end event

type pb_save from picturebutton within w_maneja_glosas
integer x = 4215
integer y = 508
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &g"
boolean originalsize = true
string picturename = "Guardar.gif"
string disabledname = "d_Guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar"
end type

event clicked;if grabar()=1 then
	commit;
end if
end event

type pb_anula from picturebutton within w_maneja_glosas
integer x = 4215
integer y = 240
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "              &a"
boolean originalsize = true
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
string powertiptext = "Anular Radicación de Glosa"
end type

event clicked;if dw_histo.RowCount() = 0 then Return 0
long cuenta
string cd, cl, estado
double nd

cd = dw_deta.GetItemString(1,'coddoc')
cl = dw_deta.GetItemString(1,'clugar')
nd = dw_deta.GetItemnumber(1,'num_glosa')
select estado into :estado from car_glosa_cab
where coddoc=:cd and clugar=:cl and num_glosa=:nd;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF

if estado = '3' then
	MessageBox('Atención','La objeción ya ha sido reenviada. No se puede anular')
	Return -1
end if

select count(*) into :cuenta from car_glosa_respu
where (coddoc_glosa_gral=:cd and clugar_glosa_gral=:cl and num_glosa_gral=:nd) or
	(coddoc_glosa_det=:cd and clugar_glosa_det=:cl and num_glosa_det=:nd) or
	(coddoc_glosa_sub=:cd and clugar_glosa_sub=:cl and num_glosa_sub=:nd);
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF
if cuenta > 0 then
	if MessageBox('Atención','Existen respuestas asociadas a la objeción. Aún desea anular la objeción?',Question!,yesno!) = 2 then Return 0
else
	if MessageBox('Atención','Está seguro de anular la objeción '+string(nd)+'?',Question!,yesno!) = 2 then Return 0
end if

st_xa_anular st_anula
st_anula.tipo='CA'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return -1

dw_histo.SetItem(dw_histo.GetRow(),'estado','A')
dw_histo.SetItem(dw_histo.GetRow(),'usu_anula',usuario)
dw_histo.SetItem(dw_histo.GetRow(),'fecha_anula',today())
dw_histo.SetItem(dw_histo.GetRow(),'motiv_anula',st_anula.observacion)
dw_histo.SetItem(dw_histo.GetRow(),'cod_anula',st_anula.motivo)
dw_deta.SetItem(1,'estado','A')
if dw_histo.Update() = - 1 then
	Rollback;
	Return -1
end if

string clug_cob,ctipo,err
long ncobro,item_cob
ncobro = dw_deta.getitemnumber(1,'num_cobro')
clug_cob = dw_deta.getitemstring(1,'clugar_cob')
ctipo = dw_deta.getitemstring(1,'cartipo')
item_cob = dw_deta.getitemnumber(1,'item_cob')
update car_cobro_cpo set coddoc_glosa=NULL ,clugar_glosa=NULL , num_glosa=NULL 
where clugar =:clug_cob and coddoc ='CXC' and num_cobro =:ncobro and cartipo =:ctipo and item=:item_cob;
if sqlca.sqlcode=-1 then 
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando car_cobro_cpo',err)
	return -1
end if
commit;
Return 0

end event

type pb_new from picturebutton within w_maneja_glosas
integer x = 4215
integer y = 104
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "D_insertar.gif"
string powertiptext = "Nueva Objeción [Alt+N]"
end type

event clicked;open(w_cartera_a_glosa)
dw_deta.setitem(1,"fecha",datetime(today(),now()))
dw_deta.setitem(1,"anyo",year(today()))
end event

type tab_1 from tab within w_maneja_glosas
integer x = 37
integer y = 796
integer width = 6080
integer height = 1656
integer taborder = 30
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
boolean boldselectedtext = true
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
integer width = 6043
integer height = 1528
long backcolor = 67108864
string text = "Facturas"
long tabtextcolor = 33554432
string picturename = "qr.ico"
long picturemaskcolor = 536870912
string powertiptext = "Facturas Objetadas"
dw_encartera dw_encartera
pb_abrir pb_abrir
rb_fac rb_fac
rb_con rb_con
st_9 st_9
pb_7 pb_7
pb_of pb_of
dw_fac_glos dw_fac_glos
pb_5 pb_5
pb_3 pb_3
cbx_r cbx_r
dw_factcpo dw_factcpo
pb_cerrar pb_cerrar
dw_busca dw_busca
pb_del_fact pb_del_fact
st_4 st_4
st_3 st_3
dw_lug dw_lug
em_1 em_1
dw_obj_fact dw_obj_fact
dw_facts dw_facts
end type

on tp_1.create
this.dw_encartera=create dw_encartera
this.pb_abrir=create pb_abrir
this.rb_fac=create rb_fac
this.rb_con=create rb_con
this.st_9=create st_9
this.pb_7=create pb_7
this.pb_of=create pb_of
this.dw_fac_glos=create dw_fac_glos
this.pb_5=create pb_5
this.pb_3=create pb_3
this.cbx_r=create cbx_r
this.dw_factcpo=create dw_factcpo
this.pb_cerrar=create pb_cerrar
this.dw_busca=create dw_busca
this.pb_del_fact=create pb_del_fact
this.st_4=create st_4
this.st_3=create st_3
this.dw_lug=create dw_lug
this.em_1=create em_1
this.dw_obj_fact=create dw_obj_fact
this.dw_facts=create dw_facts
this.Control[]={this.dw_encartera,&
this.pb_abrir,&
this.rb_fac,&
this.rb_con,&
this.st_9,&
this.pb_7,&
this.pb_of,&
this.dw_fac_glos,&
this.pb_5,&
this.pb_3,&
this.cbx_r,&
this.dw_factcpo,&
this.pb_cerrar,&
this.dw_busca,&
this.pb_del_fact,&
this.st_4,&
this.st_3,&
this.dw_lug,&
this.em_1,&
this.dw_obj_fact,&
this.dw_facts}
end on

on tp_1.destroy
destroy(this.dw_encartera)
destroy(this.pb_abrir)
destroy(this.rb_fac)
destroy(this.rb_con)
destroy(this.st_9)
destroy(this.pb_7)
destroy(this.pb_of)
destroy(this.dw_fac_glos)
destroy(this.pb_5)
destroy(this.pb_3)
destroy(this.cbx_r)
destroy(this.dw_factcpo)
destroy(this.pb_cerrar)
destroy(this.dw_busca)
destroy(this.pb_del_fact)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_lug)
destroy(this.em_1)
destroy(this.dw_obj_fact)
destroy(this.dw_facts)
end on

type dw_encartera from datawindow within tp_1
boolean visible = false
integer x = 4320
integer y = 4
integer width = 686
integer height = 108
integer taborder = 30
string title = "none"
string dataobject = "dw_facturas_encartera"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_abrir from picturebutton within tp_1
integer x = 3026
integer y = 4
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "abrir2.gif"
alignment htextalign = left!
end type

event clicked;if f_permiso_boton(this,'GLO')=0 then return -1
if dw_facts.rowcount()=0 then return
if dw_histo.GetItemString(dw_histo.Getrow(),'estado') = 'A' then
	MessageBox('Atención','El documento ya ha sido anulado. No puede modificarlo')
	Return 
end if
if dw_histo.GetItemString(dw_histo.Getrow(),'estado') ='2' then
	MessageBox('Atención','El documento ya tiene Respuesta. No puede modificarlo')
	Return 
end if
if dw_histo.GetItemString(dw_histo.Getrow(),'estado') ='3' then
	MessageBox('Atención','El documento ya ha sido reenviado. No puede modificarlo')
	Return 
end if
if dw_facts.find('esco=1',1,dw_facts.rowcount())=0 then return
long j, k, l, valid, i, s
for j=1 to dw_facts.rowcount()
	if dw_facts.getitemnumber(j,'esco')=0 then continue
	dw_facts.SetItem(dw_facts.GetRow(),'estado','O')
	for i = 1 to dw_fac_glos.RowCount()
		dw_fac_glos.setitem(i,'estado','O')
	next
	for i = 1 to tab_1.tp_2.dw_procs.RowCount()
		tab_1.tp_2.dw_procs.SetItem(i,'estado','O')
		tab_1.tp_2.dw_procs.ScrolltoRow(i)
		for k = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
			tab_1.tp_2.dw_proc_glos.setitem(k,'estado','O')
		next
		for s = 1 to tab_1.tp_2.dw_procs.RowCount()
			tab_1.tp_3.dw_sitem.ScrolltoRow(s)
			tab_1.tp_3.dw_sitem.SetItem(s,'estado','O')
			for k = 1 to tab_1.tp_3.dw_item_glos.RowCount()
				tab_1.tp_3.dw_item_glos.setitem(k,'estado','O')
			next
		next
	next
	if dw_facts.Update(TRUE,FALSE) = -1 or tab_1.tp_2.dw_procs.Update(TRUE,FALSE) = -1 or tab_1.tp_3.dw_sitem.Update(TRUE,FALSE) = -1 or dw_fac_glos.update(TRUE,FALSE) = -1 or tab_1.tp_2.dw_proc_glos.Update(TRUE,FALSE) = -1 or tab_1.tp_3.dw_item_glos.Update(TRUE,FALSE) = -1 then
		Return -1
	end if
	dw_facts.ResetUpdate()
	tab_1.tp_2.dw_procs.ResetUpdate()
	tab_1.tp_3.dw_sitem.ResetUpdate()
	dw_fac_glos.ResetUpdate()
	tab_1.tp_2.dw_proc_glos.ResetUpdate()
	tab_1.tp_3.dw_item_glos.ResetUpdate()
	commit;
next
dw_facts.event rowfocuschanged (dw_facts.getrow())

end event

type rb_fac from radiobutton within tp_1
integer x = 1536
integer width = 293
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factura"
boolean checked = true
end type

type rb_con from radiobutton within tp_1
integer x = 1536
integer y = 64
integer width = 384
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Consecutivo"
end type

type st_9 from statictext within tp_1
boolean visible = false
integer x = 18
integer y = 888
integer width = 855
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objeciones de la factura seleccionada"
boolean focusrectangle = false
end type

type pb_7 from picturebutton within tp_1
boolean visible = false
integer x = 4695
integer y = 1092
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &n"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Objeción"
end type

event clicked;if dw_fac_glos.RowCount() > 0 then
	if MessageBox('Atención','Está seguro de borrar la objeción seleccionada?',QUESTION!,YESNO!) = 2 then Return 0
	dw_fac_glos.DeleteRow(dw_fac_glos.GetRow())
	dw_fac_glos.event p_itemchanged(0)
	i_cambio = true
end if

end event

type pb_of from picturebutton within tp_1
boolean visible = false
integer x = 4695
integer y = 952
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "D_insertar.gif"
string powertiptext = "Adicionar Objeción"
end type

event clicked;long fila, ff, ng
if dw_facts.RowCount() = 0 then Return 0
ff = dw_facts.GetRow()
if dw_facts.GetItemString(ff,'estado') <> 'O' then
	MessageBox('Atención','La factura está cerrada para ser modificada')
	Return -1
end if
fila = dw_fac_glos.InsertRow(0)
ng = long(dw_fac_glos.Describe("Evaluate('max(nobjecion)',0)")) + 1
dw_fac_glos.SetItem(fila,'coddoc',dw_facts.GetItemString(ff,'coddoc'))
dw_fac_glos.SetItem(fila,'clugar',dw_facts.GetItemString(ff,'clugar'))
dw_fac_glos.SetItem(fila,'num_glosa',dw_facts.GetItemNumber(ff,'num_glosa'))
dw_fac_glos.SetItem(fila,'item',dw_facts.GetItemNumber(ff,'item'))
dw_fac_glos.SetItem(fila,'nobjecion',ng)
dw_fac_glos.SetItem(fila,'nfact',dw_facts.GetItemNumber(ff,'nfact'))
dw_fac_glos.SetItem(fila,'clugar_fact',dw_facts.GetItemString(ff,'clugar_fact'))
dw_fac_glos.SetItem(fila,'tipo_fact',dw_facts.GetItemString(ff,'tipo_fact'))
dw_fac_glos.SetItem(fila,'estado','O')
dw_fac_glos.SetItem(fila,'fecha_tramite',today())
i_cambio = true
Return fila

end event

type dw_fac_glos from datawindow within tp_1
event type integer p_itemchanged ( integer p_fila )
event porcentajes ( )
boolean visible = false
integer x = 14
integer y = 952
integer width = 4599
integer height = 480
integer taborder = 50
string dataobject = "dw_glos_cpo_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer p_itemchanged(integer p_fila);if accepttext( )=  -1 then Return -1
long f, i, pp
decimal nvalor
f =dw_facts.GetRow()
nvalor = f_sum_obj_fact(dw_facts.GetItemNumber(f,'nfact'),dw_facts.GetItemString(f,'clugar_fact'),dw_facts.GetItemString(f,'tipo_fact'))
if nvalor > (dw_facts.GetItemNumber(f,'vtemp') - dw_facts.GetItemNumber(f,'total_aceptado') ) then
	if p_fila > 0 then 
		SetItem(p_fila,'valor_objecion',0)
		SetItem(p_fila,'porcen',0)
	end if
	fin_procesa()
	MessageBox('Atención','El valor de la objeción excede el valor total de la factura')
	Return -1
end if
dw_facts.SetItem(f,'valor_objecion',nvalor)
dw_deta.setitem(1,'valor',dw_facts.getItemNumber(1,'total'))
dw_histo.setitem(dw_histo.getrow(),'valor',dw_facts.getItemNumber(1,'total'))

for pp = 1 to tab_1.tp_2.dw_procs.RowCount()
	tab_1.tp_2.dw_procs.ScrolltoRow(pp)
	nvalor = f_sum_obj_proc(dw_facts.GetItemNumber(f,'nfact'),dw_facts.GetItemString(f,'clugar_fact'),dw_facts.GetItemString(f,'tipo_fact'),tab_1.tp_2.dw_procs.GetItemNumber(pp,'nitem_fac'))
	if nvalor > (tab_1.tp_2.dw_procs.GetItemNumber(pp,'vemp') - tab_1.tp_2.dw_procs.GetItemNumber(pp,'total_aceptado')) then
		if p_fila > 0 then 
			SetItem(p_fila,'valor_objecion',0)
			SetItem(p_fila,'porcen',0)
			post event p_itemchanged(p_fila)
		end if
		fin_procesa()
		MessageBox('Atención','El valor de la objeción excede el valor total del procedimiento ' + string(tab_1.tp_2.dw_procs.GetItemNumber(pp,'subitem')))
		Return -1
	end if
	tab_1.tp_2.dw_procs.event SetModified(pp)
	tab_1.tp_2.dw_procs.setItem(pp,'valor_objecion',nvalor)
	
	for i = 1 to tab_1.tp_3.dw_sitem.RowCount()
		nvalor = f_sum_obj_item(dw_facts.GetItemNumber(f,'nfact'),dw_facts.GetItemString(f,'clugar_fact'),tab_1.tp_3.dw_sitem.GetItemNumber(i,'nitem'),tab_1.tp_3.dw_sitem.GetItemNumber(i,'ndeta_sfac'))
		if nvalor > tab_1.tp_3.dw_sitem.GetItemNumber(i,'vemp') then
			if p_fila > 0 then 
				SetItem(p_fila,'valor_objecion',0)
				SetItem(p_fila,'porcen',0)
				post event p_itemchanged(p_fila)
			end if
			fin_procesa()
			MessageBox('Atención','El valor de la objeción excede el valor total del Item ' + string(tab_1.tp_3.dw_sitem.GetItemNumber(i,'ndeta')))
			Return -1
		end if
		tab_1.tp_3.dw_sitem.event setModified(i)
		tab_1.tp_3.dw_sitem.setItem(i,'valor_objecion',nvalor)
	next
	if tab_1.tp_3.dw_sitem.RowCount() > 0 then
		if tab_1.tp_3.dw_sitem.GetItemNumber(1,'tobjecion') <> tab_1.tp_2.dw_procs.GetItemNumber(pp,'valor_objecion') then
			tab_1.tp_3.dw_sitem.SetItem(tab_1.tp_3.dw_sitem.RowCount(),'valor_objecion', tab_1.tp_3.dw_sitem.GetItemNumber(tab_1.tp_3.dw_sitem.RowCount(),'valor_objecion') + tab_1.tp_2.dw_procs.GetItemNumber(pp,'valor_objecion') - tab_1.tp_3.dw_sitem.GetItemNumber(1,'tobjecion') )
		end if
	end if
next

if tab_1.tp_2.dw_procs.RowCount() > 0 then
	if tab_1.tp_2.dw_procs.GetItemNumber(1,'tobjecion') <> dw_facts.GetItemNumber(dw_facts.GetRow(),'valor_objecion') then
		tab_1.tp_2.dw_procs.SetItem(tab_1.tp_2.dw_procs.RowCount(),'valor_objecion', tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.RowCount(),'valor_objecion') + dw_facts.GetItemNumber(dw_facts.GetRow(),'valor_objecion') - tab_1.tp_2.dw_procs.GetItemNumber(1,'tobjecion') )
	end if
end if
Return 0

end event

event porcentajes();long i
for i = 1 to RowCount()
	SetItem(i,'porcen',round(GetItemNumber(i,'valor_objecion')/dw_facts.GetItemNumber(dw_facts.GetRow(),'vtemp')*100,i_dec_gral_car))
	SetItem(i,'vtemp',dw_facts.GetItemNumber(dw_facts.GetRow(),'vtemp'))
next

end event

event constructor;setTransObject(SQLCA)
getchild('con_espe',idw_espe)
idw_espe.settransobject(sqlca)
idw_espe.retrieve('%')
getchild('cod_objecion',idw_obj)
idw_obj.settransobject(sqlca)
idw_obj.retrieve('%','%')
getchild('nombre',idw_usuresp)
idw_usuresp.settransobject(sqlca)

end event

event itemchanged;string nulo
setnull(nulo)
long j
choose case dwo.name
	case 'con_gral'
		setitem(row,'con_espe',nulo)
		if idw_espe.retrieve(data)=1 then
			setitem(row,'con_espe',idw_espe.getitemstring(idw_espe.getrow(),'con_espe') )
		end if
		
	case 'con_espe'		
		setitem(row,'cod_objecion',nulo)
		if idw_obj.retrieve(getitemstring(row,'con_gral'),data)=1 then
			setitem(row,'cod_objecion',idw_obj.getitemstring(idw_obj.getrow(),1) )
		end if	
	
		if idw_usuresp.retrieve(idw_obj.getitemstring(idw_obj.getrow(),1))=1 then
			setitem(row,'usu_responde',idw_usuresp.getitemstring(1,'responsable'))
			setitem(row,'nombre',idw_usuresp.getitemstring(1,'nombre'))
		else
			setitem(row,'usu_responde',idw_usuresp.getitemstring(idw_usuresp.getrow(),'responsable'))
		end if
		
	case 'cod_objecion'
		setitem(row,'pertinente',idw_obj.getitemstring(idw_obj.getrow(),'pertinente'))
		setitem(row,'respuesta_hasta',datetime(relativedate(date(getitemdatetime(row,'fecha_tramite')),idw_obj.getitemnumber(idw_obj.getrow(),'tiempo_resp'))))
		setitem(row,'usu_responde',nulo)
		setitem(row,'nombre',nulo)
		if idw_usuresp.retrieve(data)=1 then
			setitem(row,'usu_responde',idw_usuresp.getitemstring(1,'responsable'))
			setitem(row,'nombre',idw_usuresp.getitemstring(1,'nombre'))
		else
			setitem(row,'usu_responde',idw_usuresp.getitemstring(idw_usuresp.getrow(),'responsable'))
		end if
//		post event p_replica_obje(row)

	case 'nombre'
		setitem(row,'usu_responde',idw_usuresp.getitemstring(idw_usuresp.getrow(),'responsable'))
		if cbx_r.Checked then
			for j= row + 1 to rowcount()
				//if j=row then continue
				if not isnull(getitemstring(j,'usu_responde')) or getitemstring(row,'cod_objecion') <> getitemstring(j,'cod_objecion') then continue
				setitem(j,'nombre',data)
				setitem(j,'usu_responde',idw_usuresp.getitemstring(idw_usuresp.getrow(),'responsable'))
			next
		end if
		
	case 'valor_objecion'
		setitem(row,'porcen',round(dec(data)/dw_facts.getitemnumber(dw_facts.GetRow(),'vtemp')*100,i_dec_gral_car)) 
		//post calcula_sub(dw_facts.GetRow(),0,0)
		post event p_itemchanged(row)
		
	case 'porcen'
		setitem(row,'valor_objecion',round(dw_facts.getitemnumber(dw_facts.GetRow(),'vtemp')*dec(data)/100,i_dec_gral_car))
		post event itemchanged(row,object.valor_objecion,string(round(dw_facts.getitemnumber(dw_facts.GetRow(),'vtemp')*dec(data)/100,i_dec_gral_car)))
		
	case 'nro_empresa'
		if cbx_r.Checked then
			for j= row + 1 to rowcount()
				if not isnull(getitemstring(j,'nro_empresa')) then continue
				setitem(j,'nro_empresa',data)
			next
		end if
end choose
if dwo.name <> 'esco' then i_cambio=true

end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event rowfocuschanged;dw_obj_fact.reset()
if currentrow = 0 or RowCount() = 0 then Return
dw_obj_fact.insertrow(1)
dw_obj_fact.setitem(1,'objecion',getitemstring(getrow(),'objecion'))
idw_usuresp.retrieve(getitemstring(getrow(),'cod_objecion'))
end event

event losefocus;if rowCount() = 0 then Return 0
if GetItemString(GetRow(),'estado') <> 'O' then Return 0
if GetRow() >0 and (GetcolumnName() = 'valor_objecion' or GetcolumnName() = 'porcen' ) then 
	if acceptText() = -1 then Return -1
	event p_itemchanged(GetRow())
end if

end event

type pb_5 from picturebutton within tp_1
integer x = 3328
integer y = 4
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
string disabledname = "d_buscar.gif"
string powertiptext = "Seleccionar Facturas"
end type

event clicked;st_dws_revisa lst_p
lst_p.dw_fac = dw_facts
lst_p.dw_item = dw_deta
lst_p.em_parm = tab_1.tp_1.em_1
openwithparm(w_selec_facts,lst_p)

end event

type pb_3 from picturebutton within tp_1
integer x = 3177
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
boolean enabled = false
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
string powertiptext = "Revisar Objeción orígen"
end type

event clicked;st_dws_revisa st_par
st_par.dw_fac = dw_facts
st_par.dw_proc = tab_1.tp_2.dw_procs
st_par.dw_item = tab_1.tp_3.dw_sitem
st_par.dw_fg = dw_fac_glos
st_par.dw_pg = tab_1.tp_2.dw_proc_glos
st_par.dw_sg = tab_1.tp_3.dw_item_glos
//openwithparm(w_revisa_ant,st_p)
openwithparm(w_revisa_glos,st_par)

end event

type cbx_r from checkbox within tp_1
boolean visible = false
integer x = 3401
integer y = 16
integer width = 736
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Replicar cambios hacia abajo"
boolean checked = true
end type

type dw_factcpo from datawindow within tp_1
boolean visible = false
integer x = 3319
integer y = 24
integer width = 247
integer height = 56
integer taborder = 40
string title = "none"
string dataobject = "dw_det_factcpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_cerrar from picturebutton within tp_1
integer x = 2875
integer y = 4
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "cerrar.gif"
string powertiptext = "Cerrar Objeciones seleccionadas"
end type

event clicked;if dw_facts.rowcount()=0 then return
if dw_histo.GetItemString(dw_histo.Getrow(),'estado') = 'A' then
	MessageBox('Atención','El documento ya ha sido anulado. No puede modificarlo')
	Return 
end if
if dw_facts.find('esco=1',1,dw_facts.rowcount())=0 then return
if grabar()=1 then
	commit;
else
	return
end if
inicia_procesa()
long j, k, l, valid, i, s
boolean continuar,sub
for j=1 to dw_facts.rowcount()
	if dw_facts.getitemnumber(j,'esco')=0 then continue
	dw_facts.setitem(j,'esco',0)
	for i = 1 to dw_fac_glos.RowCount()
		valid = valida(dw_fac_glos,i,'fecha','fecha_tramite',continuar)
		if valid= -1 then 
			fin_procesa()
			return
		end if
		if valid= 0 then continue
		valid=valida(dw_fac_glos,i,'string','nombre',continuar)
		if valid= -1 then 
			fin_procesa()
			return
		end if
		if valid= 0 then continue
		valid=valida(dw_fac_glos,i,'number','valor_objecion',continuar)
		if valid= -1 then 
			fin_procesa()
			return
		end if
		if valid= 0 then continue
		valid=valida(dw_fac_glos,i,'string','cod_objecion',continuar)
		if valid= -1 then
			fin_procesa()
			return
		end if
		if valid= 0 then continue
	next
	sub=false
//	if dw_facts.getitemstring(j,'tipo')='0' then 
	dw_facts.ScrolltoRow(j)
	for k=1 to tab_1.tp_2.dw_procs.rowcount()
		if isnull(tab_1.tp_2.dw_procs.getitemnumber(k,'subitem')) then continue
		tab_1.tp_2.dw_procs.ScrolltoRow(k)
		for i = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
			valid=valida(tab_1.tp_2.dw_proc_glos,i,'string','nombre',continuar)
			if valid= -1 then 
				fin_procesa()
				return
			end if
			if valid= 0 then 
				sub=true
				exit
			end if
			valid=valida(tab_1.tp_2.dw_proc_glos,i,'number','valor_objecion',continuar)
			if valid= -1 then
				fin_procesa()
				return
			end if
			if valid= 0 then 
				sub=true
				exit
			end if
			valid=valida(tab_1.tp_2.dw_proc_glos,i,'string','cod_objecion',continuar)
			if valid= -1 then
				fin_procesa()
				return
			end if
			if valid= 0 then 
				sub=true
				exit
			end if
		next
		for l=1 to tab_1.tp_3.dw_sitem.rowcount()
			if isnull(tab_1.tp_3.dw_sitem.getitemnumber(l,'ndeta')) then continue
			tab_1.tp_3.dw_sitem.scrolltorow(l)
			for i = 1 to tab_1.tp_3.dw_item_glos.RowCount()
				valid=valida(tab_1.tp_3.dw_item_glos,i,'number','valor_objecion',continuar)
				if valid= -1 then
					fin_procesa()
					return
				end if
				if valid= 0 then 
					sub=true
					exit
				end if
				valid=valida(tab_1.tp_3.dw_item_glos,i,'string','cod_objecion',continuar)
				if valid= -1 then
					fin_procesa()
					return
				end if
				if valid= 0 then 
					sub=true
					exit
				end if
				valid=valida(tab_1.tp_3.dw_item_glos,i,'string','nombre',continuar)
				if valid= -1 then
					fin_procesa()
					return
				end if
				if valid= 0 then 
					sub=true
					exit
				end if
			next
		next
		if sub then exit
	next
//	else
//		valid=valida(dw_facts,j,'string','cod_objecion',continuar)
//		if valid= -1 then return
//		if valid= 0 then continue
//	end if
	if sub then continue
	dw_facts.setitem(dw_facts.GetRow(),'estado','C')
	for i = 1 to dw_fac_glos.RowCount()
		dw_fac_glos.setitem(i,'estado','C')
	next
	for i = 1 to tab_1.tp_2.dw_procs.RowCount()
		tab_1.tp_2.dw_procs.SetItem(i,'estado','C')
		tab_1.tp_2.dw_procs.ScrolltoRow(i)
		for k = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
			tab_1.tp_2.dw_proc_glos.setitem(k,'estado','C')
		next
		for s = 1 to tab_1.tp_2.dw_procs.RowCount()
			tab_1.tp_3.dw_sitem.ScrolltoRow(s)
			tab_1.tp_3.dw_sitem.SetItem(s,'estado','C')
			for k = 1 to tab_1.tp_3.dw_item_glos.RowCount()
				tab_1.tp_3.dw_item_glos.setitem(k,'estado','C')
			next
		next
	next
	if dw_facts.Update(TRUE,FALSE) = -1 or tab_1.tp_2.dw_procs.Update(TRUE,FALSE) = -1 or tab_1.tp_3.dw_sitem.Update(TRUE,FALSE) = -1 or dw_fac_glos.update(TRUE,FALSE) = -1 or tab_1.tp_2.dw_proc_glos.Update(TRUE,FALSE) = -1 or tab_1.tp_3.dw_item_glos.Update(TRUE,FALSE) = -1 then
		dw_facts.SetItem(dw_facts.GetRow(),'estado','O')
		for i = 1 to dw_fac_glos.RowCount()
			dw_fac_glos.setitem(i,'estado','O')
		next
		for i = 1 to tab_1.tp_2.dw_procs.RowCount()
			tab_1.tp_2.dw_procs.SetItem(i,'estado','O')
			tab_1.tp_2.dw_procs.ScrolltoRow(i)
			for k = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
				tab_1.tp_2.dw_proc_glos.setitem(k,'estado','O')
			next
			for s = 1 to tab_1.tp_2.dw_procs.RowCount()
				tab_1.tp_3.dw_sitem.ScrolltoRow(s)
				tab_1.tp_3.dw_sitem.SetItem(s,'estado','O')
				for k = 1 to tab_1.tp_3.dw_item_glos.RowCount()
					tab_1.tp_3.dw_item_glos.setitem(k,'estado','O')
				next
			next
		next
		Return -1
	end if
	
	dw_facts.ResetUpdate()
	tab_1.tp_2.dw_procs.ResetUpdate()
	tab_1.tp_3.dw_sitem.ResetUpdate()
	dw_fac_glos.ResetUpdate()
	tab_1.tp_2.dw_proc_glos.ResetUpdate()
	tab_1.tp_3.dw_item_glos.ResetUpdate()
	commit;
next
fin_procesa()

//s = dw_facts.Find("estado='O'",1,dw_facts.RowCount())
//if s = 0 then
//	dw_deta.SetItem(dw_deta.GetRow(),'estado','1')
//	if dw_deta.Update() = -1 then
//		rollback;
//		Return -1
//	end if
//	commit;
//end if
dw_facts.event rowfocuschanged (dw_facts.getrow())

end event

type dw_busca from datawindow within tp_1
boolean visible = false
integer x = 3319
integer y = 8
integer width = 850
integer height = 88
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_busca_fact_car"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type pb_del_fact from picturebutton within tp_1
event type integer recalcular ( )
integer x = 2725
integer y = 4
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
string powertiptext = "Borrar factura"
end type

event type integer recalcular();if dw_facts.RowCount() > 0 then
	dw_deta.setitem(1,'valor',dw_facts.getItemNumber(1,'total'))
	dw_histo.setitem(dw_histo.getrow(),'valor',dw_facts.getItemNumber(1,'total'))
	dw_deta.SetItem(1,'diferencia',calc_diff())
else
	dw_deta.setitem(1,'valor',0)
	dw_histo.setitem(dw_histo.getrow(),'valor',0)
	dw_deta.SetItem(1,'diferencia',0)
end if
i_cambio = TRUE
Return 0

end event

event clicked;if dw_facts.rowcount()=0 then return
if dw_fac_glos.Find("estado <>'O'",1,dw_fac_glos.RowCount()) > 0 then return
if messagebox('Atención','Está seguro que desea borrar el registro?',Question!,YesNo!,1) = 2 then Return
long j, k, g
for j = 1 to tab_1.tp_2.dw_procs.RowCount()
	tab_1.tp_2.dw_procs.ScrolltoRow(j)
	tab_1.tp_2.dw_procs.Event RowFocusChanged(j)
	for k = 1 to tab_1.tp_3.dw_sitem.RowCount()
		tab_1.tp_3.dw_sitem.ScrolltoRow(k)
		tab_1.tp_3.dw_sitem.Event RowFocusChanged(k)
		do while tab_1.tp_3.dw_item_glos.RowCount() > 0
			tab_1.tp_3.dw_item_glos.DeleteRow(1)
		loop
		tab_1.tp_3.dw_sitem.event borra_boton(k)
	next
	do while tab_1.tp_2.dw_proc_glos.RowCount() > 0
		tab_1.tp_2.dw_proc_glos.DeleteRow(1)
	loop
	tab_1.tp_2.dw_procs.event borra_fila(j)
next
do while dw_fac_glos.RowCount() > 0
	dw_fac_glos.DeleteRow(1)
loop
dw_facts.deleterow(0)
PostEvent("recalcular")
i_cambio = TRUE
//if dw_facts.update()=-1 then dw_histo.event rowfocuschanged(dw_histo.getrow())
//commit;

end event

type st_4 from statictext within tp_1
integer x = 9
integer y = 12
integer width = 137
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar:"
boolean focusrectangle = false
end type

type st_3 from statictext within tp_1
integer x = 1947
integer y = 36
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nro factura:"
boolean focusrectangle = false
end type

type dw_lug from datawindow within tp_1
integer x = 146
integer y = 4
integer width = 1280
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;modify('datawindow.header.height=0')
modify('#1.width=1243')
settransobject(sqlca)
insertrow(1)
getchild('codlugar',idw_lugar)
idw_lugar.settransobject(sqlca)
idw_lugar.insertrow(1)
idw_lugar.setitem(1,'descripcion',' Todos')
idw_lugar.setitem(1,'codlugar','%')
idw_lugar.sort()
dw_lug.setitem(1,1,'%')
end event

type em_1 from editmask within tp_1
integer x = 2245
integer y = 16
integer width = 334
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "#######"
end type

event modified;if dw_deta.rowcount()=0 then return
if rb_fac.checked=false and  rb_con.checked=false then
	MessageBox('Atención','Seleccione Consecutivo o Factura')
	return -1
end if	
if isnull(dw_lug.getitemstring(1,1)) then 
	MessageBox('Atención','Seleccione un lugar de la lista')
	return -1
end if
if text='' then return -1
if dw_deta.getitemstring(1,'estado')<>'0' then return
long donde,item
string lugar,t_fac,l_todas
double t_obj, t_acep, fact
f_quitafiltro(dw_facts,string(rgb(255,255,255)))
if rb_fac.checked then t_fac='F'
if rb_con.checked then t_fac='C'

dw_encartera.retrieve(long(text),dw_lug.getitemstring(1,1),t_fac)
if dw_encartera.rowcount()>0 then
	if dw_encartera.getitemnumber(1,'abiertas')>0 then
		dw_encartera.setfilter("estado in ('0','1','2')")
		dw_encartera.filter()
		setnull(l_todas)
		for item = 1 to dw_encartera.rowcount()
			if item=1 then 
				l_todas=string(dw_encartera.getitemnumber(item,'num_glosa'))
			else
				l_todas= l_todas+' / '+string(dw_encartera.getitemnumber(item,'num_glosa'))
			end if
		next
		messagebox('Atención','Esta factura tiiene las Objeciones  '+ l_todas+' y no tiene reenvio')
		fin_procesa()
		return -1	
	end if
end if
setnull(item)
if dw_lug.getitemstring(1,1)<>'%' then
	donde=dw_facts.find('nfact='+text+' and clugar_fact = "'+dw_lug.getitemstring(1,1)+'"  and tipo_fact="'+t_fac+'"',1,dw_facts.rowcount())
else
	donde=dw_facts.find('nfact='+text+' and tipo_fact="'+t_fac+'"',1,dw_facts.rowcount())
end if
if donde>0 then 
	dw_facts.scrolltorow(donde)
	return donde
end if
if dw_busca.retrieve(long(text),dw_lug.getitemstring(1,1),t_fac,dw_deta.getitemstring(1,'codemp'),dw_deta.getitemstring(1,'clugar_cob'),dw_deta.getitemnumber(1,'num_cobro'))=0 then
	messagebox('Atención','Esta factura no es de esta empresa, o no se ha enviado en esta cuenta')
	fin_procesa()
	return -1
end if
IF not ISNULL(dw_deta.getitemnumber(1,'num_glosa')) then
	dw_busca.setfilter('(clug_glos<>"'+dw_deta.getitemstring(1,'clugar')+'" or num_glosa<>'+string(dw_deta.getitemnumber(1,'num_glosa'))+') or (isnull(num_glosa))')
	dw_busca.filter()
end if
dw_busca.sort()
if dw_busca.rowcount()=0 then return//por si acaso
if dw_busca.getitemnumber(1,'vtemp') - dw_busca.getitemnumber(1,'vtdescuentos') <=0 then 
	messagebox('Atención','Esta factura no tiene valor a pagar por la empresa, no se puede relacionar')
	return -1
end if

//if dw_busca.getItemNumber(1,'num_glosa') > 0 then
//	fact = double(text)
//	lugar = dw_lug.getitemstring(1,1)
//	select 
//		sum(car_glosa_cpo.valor_objecion) as total_objetado,sum(car_glosa_cpo.valor_aceptado) as total_aceptado into :t_obj, :t_acep
//    	from 
//		car_glosa_cab join dba.car_glosa_cpo on(car_glosa_cab.num_glosa = car_glosa_cpo.num_glosa) 
//		and(car_glosa_cab.clugar = car_glosa_cpo.clugar) and(car_glosa_cab.coddoc = car_glosa_cpo.coddoc) 
//	where
//		(((car_glosa_cab.estado) = '3'))
//    	group by 
//		 car_glosa_cpo.nfact,car_glosa_cpo.clugar_fact,car_glosa_cpo.tipo_fact
//	having
//		 car_glosa_cpo.nfact=:fact and car_glosa_cpo.clugar_fact=:lugar and car_glosa_cpo.tipo_fact=:t_fac;
//
//	if isnull(t_obj) then t_obj=0
//	if isnull(t_acep) then t_acep=0
//end if

if dw_lug.getitemstring(1,1)<>'%' then
	donde = idw_facts.find('nfact='+text+' and clugar_fact ="'+dw_lug.getitemstring(1,1)+'" and tipo_fact="'+t_fac+'"',1,idw_facts.rowcount())
else
	donde = idw_facts.find('nfact='+text+' and tipo_fact="'+t_fac+'"',1,idw_facts.rowcount())
end if
	
if donde = 0 then 
	donde = idw_facts.InsertRow(0)
	idw_facts.SetItem(donde,'nfact',long(text))
	idw_facts.SetItem(donde,'clugar_fact',dw_busca.getitemstring(1,'clugar'))
	idw_facts.SetItem(donde,'tipo_fact',t_fac)
	idw_facts.setitem(donde,'vtproced',dw_busca.getitemnumber(1,'vtproced'))
	idw_facts.setitem(donde,'vtemp',dw_busca.getitemnumber(1,'vtemp'))
end if

if dw_lug.getitemstring(1,1)<>'%' then
	donde = idw_facts2.find('nfact='+text+' and clugar_fact = "'+dw_lug.getitemstring(1,1)+ '" and tipo_fact="'+t_fac+'"',1,idw_facts2.rowcount())
else
	donde = idw_facts2.find('nfact='+text+' and tipo_fact="'+t_fac+'"',1,idw_facts2.rowcount())
end if
if donde = 0 then 
	donde = idw_facts2.InsertRow(0)
	idw_facts2.SetItem(donde,'nfact',long(text))
	idw_facts2.SetItem(donde,'clugar_fact',dw_busca.getitemstring(1,'clugar'))	
	idw_facts2.SetItem(donde,'tipo_fact',t_fac)
	idw_facts2.setitem(donde,'vtproced',dw_busca.getitemnumber(1,'vtproced')  )
	idw_facts2.setitem(donde,'vtemp',dw_busca.getitemnumber(1,'vtemp'))
end if

item=long(dw_facts.describe("evaluate('max(item)',0)"))+1
donde=dw_facts.insertrow(0)
dw_facts.setitem(donde,'coddoc',i_cdoc)
dw_facts.setitem(donde,'clugar',clugar)
dw_facts.setitem(donde,'num_glosa',dw_deta.getitemnumber(1,'num_glosa'))
dw_facts.setitem(donde,'item',item)
dw_facts.setitem(donde,'nfact',long(text))
dw_facts.setitem(donde,'clugar_fact',dw_busca.getitemstring(1,'clugar'))
dw_facts.setitem(donde,'tipo_fact', t_fac)
dw_facts.setitem(donde,'tipo','1')//total
dw_facts.setitem(donde,'clugar_cob',dw_busca.getitemstring(1,'clug_cobro'))
dw_facts.setitem(donde,'coddoc_cob',dw_busca.getitemstring(1,'coddoc'))
dw_facts.setitem(donde,'num_cobro',dw_busca.getitemnumber(1,'num_cobro'))
dw_facts.setitem(donde,'cartipo',dw_busca.getitemstring(1,'cartipo'))
dw_facts.setitem(donde,'item_cob',dw_busca.getitemnumber(1,'item'))
dw_facts.setitem(donde,'coddoc_orig',dw_busca.getitemstring(1,'cdoc_glos'))
dw_facts.setitem(donde,'clugar_orig',dw_busca.getitemstring(1,'clug_glos'))
dw_facts.setitem(donde,'num_glosa_orig',dw_busca.getitemnumber(1,'num_glosa'))
dw_facts.setitem(donde,'item_orig',dw_busca.getitemnumber(1,'item_glos'))
dw_facts.setitem(donde,'nradica',dw_busca.getitemnumber(1,'nradica'))
dw_facts.setitem(donde,'clugar_rad',dw_busca.getitemstring(1,'clugar_rad'))
dw_facts.setitem(donde,'tipo_rad',dw_busca.getitemstring(1,'tipo_rad'))
if isnull(dw_deta.getitemdatetime(1,'fecha')) then
	dw_facts.setitem(donde,'fecha_tramite',datetime(today()))
else
	dw_facts.setitem(donde,'fecha_tramite',dw_deta.getitemdatetime(1,'fecha'))
end if
if i_total then
	dw_facts.setitem(donde,'vtemp',dw_busca.getitemnumber(1,'vtproced'))
	dw_facts.setitem(donde,'vtempresa',dw_busca.getitemnumber(1,'vtemp'))
else
	dw_facts.setitem(donde,'vtemp',dw_busca.getitemnumber(1,'vtemp'))
	dw_facts.setitem(donde,'vtproced',dw_busca.getitemnumber(1,'vtproced') )
end if
dw_facts.scrolltorow(donde)
dw_facts.event rowfocuschanged(donde)
dw_facts.setcolumn('tipo')
i_cambio=true
text=''
setfocus()
Return donde

end event

type dw_obj_fact from datawindow within tp_1
boolean visible = false
integer x = 4905
integer y = 920
integer width = 1088
integer height = 632
integer taborder = 60
string title = "none"
string dataobject = "dw_glosa_cpo_det"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event itemchanged;accepttext()
if dw_fac_glos.rowcount()=0 then return
if (isnull(dw_fac_glos.getitemstring(dw_fac_glos.getrow(),'objecion')) and getitemstring(1,'objecion')<>'' ) or (dw_fac_glos.getitemstring(dw_fac_glos.getrow(),'objecion')<>getitemstring(1,'objecion')) then
	dw_fac_glos.setitem(dw_fac_glos.getrow(),'objecion',getitemstring(1,'objecion'))
	i_cambio=true
end if
end event

event losefocus;triggerevent(itemchanged!)
end event

type dw_facts from datawindow within tp_1
event p_itemchanged ( )
integer y = 152
integer width = 5993
integer height = 1352
integer taborder = 30
string title = "none"
string dataobject = "dw_glos_cpo"
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

event rowfocuschanged;boolean inserta=FALSE
tab_1.tp_2.dw_procs.setfilter('isnull(item)')
//dw_obj_fact.reset()
idw_procs.reset()
tab_1.tp_3.dw_dprocs.reset()
tab_1.tp_3.dw_dprocs.insertrow(1)
if getrow()>0 then
	if isnull(getitemnumber(getrow(),'nfact')) then return
	string ret,l_lug,l_tipo
	long donde,j, l_item
	double l_nfact,tc_obj, tc_acep

	idw_usuresp.retrieve(getitemstring(getrow(),'cod_objecion'))
	idw_procs.retrieve(getitemnumber(getrow(),'nfact'),getitemstring(getrow(),'clugar_fact'),getitemstring(getrow(),'tipo_fact'))
	tab_1.tp_2.dw_procs.setredraw(false)
	tab_1.tp_2.dw_procs.setfilter("nfact_cpo="+string(getitemnumber(getrow(),'nfact'))+" and clug_fac='"+getitemstring(getrow(),'clugar_fact')+"' and tipo_fac ='"+getitemstring(getrow(),'tipo_fact')+"'")
	tab_1.tp_1.dw_fac_glos.SetFilter("nfact="+string(getitemnumber(getrow(),'nfact'))+" and clugar_fact='"+getitemstring(getrow(),'clugar_fact')+"' and tipo_fact ='"+getitemstring(getrow(),'tipo_fact')+"'")
	tab_1.tp_2.dw_procs.filter()
	tab_1.tp_1.dw_fac_glos.filter()
	tab_1.tp_1.dw_fac_glos.event porcentajes()
	tab_1.tp_1.dw_fac_glos.event rowfocuschanged(tab_1.tp_1.dw_fac_glos.getRow())
	dw_factcpo.retrieve(getitemnumber(getrow(),'nfact'),getitemstring(getrow(),'clugar_fact'),getitemstring(getrow(),'tipo_fact'))
	for j=1 to dw_factcpo.rowcount()
		l_nfact=dw_factcpo.getitemnumber(j,'nfact_cpo')
		l_lug=dw_factcpo.getitemstring(j,'clug_fac')
		l_tipo=dw_factcpo.getitemstring(j,'tipo_fac')
		l_item=dw_factcpo.getitemnumber(j,'nitem_fac')
		setnull(tc_obj)
		setnull(tc_acep)
			
	/*	select 
			sum(car_glosa_subcpo.valor_objecion) as valor_objecion, sum(car_glosa_subcpo.valor_aceptado) as valor_aceptado into :tc_obj, :tc_acep
		from 
			car_glosa_cab inner join car_glosa_subcpo on (car_glosa_cab.num_glosa = car_glosa_subcpo.num_glosa) 
			and (car_glosa_cab.clugar = car_glosa_subcpo.clugar) and (car_glosa_cab.coddoc = car_glosa_subcpo.coddoc)
		where 
			(((car_glosa_cab.estado)='3'))
		group by 
			car_glosa_subcpo.nfact, car_glosa_subcpo.clugar_fact, car_glosa_subcpo.tipo_fact, 
			car_glosa_subcpo.nitem_fact
		having 
			(((car_glosa_subcpo.nfact)=:l_nfact) and ((car_glosa_subcpo.clugar_fact)=:l_lug) 
				and ((car_glosa_subcpo.tipo_fact)=:l_tipo) and ((car_glosa_subcpo.nitem_fact)=:l_item));
		if isnull(tc_obj) then tc_obj=0
		if isnull(tc_acep) then tc_acep=0*/
		
		if tab_1.tp_2.dw_procs.find('nitem_fac='+string(dw_factcpo.getitemnumber(j,'nitem_fac')),1,tab_1.tp_2.dw_procs.rowcount())=0 then
			inserta = TRUE
			tab_1.tp_2.dw_procs.insertrow(1)
			tab_1.tp_2.dw_procs.setitem(1,'nfact_cpo',dw_factcpo.getitemnumber(j,'nfact_cpo'))
			tab_1.tp_2.dw_procs.setitem(1,'clug_fac',dw_factcpo.getitemstring(j,'clug_fac'))
			tab_1.tp_2.dw_procs.setitem(1,'tipo_fac',dw_factcpo.getitemstring(j,'tipo_fac'))
			tab_1.tp_2.dw_procs.setitem(1,'nitem_fac',dw_factcpo.getitemnumber(j,'nitem_fac'))
			tab_1.tp_2.dw_procs.setitem(1,'cproced',dw_factcpo.getitemstring(j,'cproced'))
			tab_1.tp_2.dw_procs.setitem(1,'descripcion',dw_factcpo.getitemstring(j,'descripcion'))
			tab_1.tp_2.dw_procs.setitem(1,'c_medica',dw_factcpo.getitemstring(j,'c_medica'))
			tab_1.tp_2.dw_procs.setitem(1,'medicamento',dw_factcpo.getitemstring(j, 'medicamento'))
			tab_1.tp_2.dw_procs.setitem(1,'cantidad',dw_factcpo.getitemnumber(j, 'cantidad'))
			if i_total then
				tab_1.tp_2.dw_procs.setitem(1,'vempresa',dw_factcpo.getitemnumber(j, 'vemp'))
				tab_1.tp_2.dw_procs.setitem(1,'vemp',dw_factcpo.getitemnumber(j, 'vproced'))
			else
				tab_1.tp_2.dw_procs.setitem(1,'vproced',dw_factcpo.getitemnumber(j, 'vproced'))
				tab_1.tp_2.dw_procs.setitem(1,'vemp',dw_factcpo.getitemnumber(j, 'vemp'))
			end if
			tab_1.tp_2.dw_procs.setitem(1,'agrupser',dw_factcpo.getitemstring(j, 'agrupser'))
			tab_1.tp_2.dw_procs.setitem(1,'agrupser_med',dw_factcpo.getitemstring(j, 'agrupser_med'))
			tab_1.tp_2.dw_procs.setitem(1,'agrup_descrip',dw_factcpo.getitemstring(j, 'agrup_descrip'))
			tab_1.tp_2.dw_procs.setitem(1,'total_objetado',tc_obj)
			tab_1.tp_2.dw_procs.setitem(1,'total_aceptado',tc_acep)
			tab_1.tp_2.dw_procs.setitemstatus(1,0,primary!,datamodified!)	
			//tab_1.tp_2.dw_procs.setitemstatus(1,0,primary!,notmodified!)	
		end if
	next
	tab_1.tp_2.dw_procs.sort()
	tab_1.tp_2.dw_procs.event rowfocuschanged(tab_1.tp_2.dw_procs.getrow())
	if not i_procesa then tab_1.tp_2.dw_procs.setredraw(true)
	donde=idw_facts.find('nfact='+string(getitemnumber(getrow(),'nfact'))+' and clugar_fact="'+getitemstring(getrow(),'clugar_fact')+'" and tipo_fact="'+getitemstring(getrow(),'tipo_fact')+'"',1,idw_facts.rowcount())
	idw_facts.scrolltorow(donde)
	idw_facts2.scrolltorow(donde)
	tab_1.tp_2.dw_dfacts.setitem(1,1,getitemnumber(getrow(),'nfact'))
	tab_1.tp_3.dw_dfacts2.setitem(1,2,getitemstring(getrow(),'clugar_fact'))
	tab_1.tp_3.dw_dfacts2.setitem(1,3,getitemstring(getrow(),'tipo_fact'))

	if isNull(GetItemNumber(GetRow(),'num_glosa_orig')) then
		pb_3.Enabled = FALSE
	else
		pb_3.Enabled = TRUE
	end if
	tab_1.tp_2.st_8.Text = 'Registro '+ string(tab_1.tp_2.dw_procs.GetRow()) +' de ' + string(tab_1.tp_2.dw_procs.RowCount())
else
	tab_1.tp_2.dw_procs.filter()
end if
tab_1.tp_2.rb_t.checked = TRUE

end event

event itemchanged;choose case dwo.name
	case 'diferencia'
		if acceptText() = -1 then Return -1
		dw_deta.SetItem(1,'diferencia',calc_diff())
		i_cambio = TRUE
end choose

end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

event clicked;if row>0 and row<>getrow() then scrolltorow(row)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
st_dw.solobuscar = TRUE
openwithparm(w_funcion_dw,st_dw)

end event

event buttonclicked;long j,selec=1
SetRedraw(FALSE)
if dwo.text='Selec.' then
	dwo.text='Desel.'
else
	dwo.text='Selec.'
	selec=0
end if
for j=1 to rowcount()
	if (getitemstring(j,'estado')<>'O') and (getitemstring(j,'estado')<>'C')  then continue
	setitem(j,'esco',selec)
next
SetRedraw(TRUE)

end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 6043
integer height = 1528
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "dev_med.ico"
long picturemaskcolor = 536870912
string powertiptext = "Detalle de la Factura"
rb_o rb_o
rb_t rb_t
st_10 st_10
pb_9 pb_9
pb_op pb_op
pb_4 pb_4
cbx_p cbx_p
pb_2 pb_2
dw_factsub dw_factsub
st_5 st_5
dw_dfacts dw_dfacts
dw_procs dw_procs
dw_obj_proc dw_obj_proc
dw_proc_glos dw_proc_glos
st_8 st_8
end type

on tp_2.create
this.rb_o=create rb_o
this.rb_t=create rb_t
this.st_10=create st_10
this.pb_9=create pb_9
this.pb_op=create pb_op
this.pb_4=create pb_4
this.cbx_p=create cbx_p
this.pb_2=create pb_2
this.dw_factsub=create dw_factsub
this.st_5=create st_5
this.dw_dfacts=create dw_dfacts
this.dw_procs=create dw_procs
this.dw_obj_proc=create dw_obj_proc
this.dw_proc_glos=create dw_proc_glos
this.st_8=create st_8
this.Control[]={this.rb_o,&
this.rb_t,&
this.st_10,&
this.pb_9,&
this.pb_op,&
this.pb_4,&
this.cbx_p,&
this.pb_2,&
this.dw_factsub,&
this.st_5,&
this.dw_dfacts,&
this.dw_procs,&
this.dw_obj_proc,&
this.dw_proc_glos,&
this.st_8}
end on

on tp_2.destroy
destroy(this.rb_o)
destroy(this.rb_t)
destroy(this.st_10)
destroy(this.pb_9)
destroy(this.pb_op)
destroy(this.pb_4)
destroy(this.cbx_p)
destroy(this.pb_2)
destroy(this.dw_factsub)
destroy(this.st_5)
destroy(this.dw_dfacts)
destroy(this.dw_procs)
destroy(this.dw_obj_proc)
destroy(this.dw_proc_glos)
destroy(this.st_8)
end on

type rb_o from radiobutton within tp_2
integer x = 2743
integer y = 40
integer width = 384
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ver Objetados"
end type

event clicked;double nfact
string clug
nfact = tab_1.tp_1.dw_facts.getItemNumber(tab_1.tp_1.dw_facts.getrow(),'nfact')
clug = tab_1.tp_1.dw_facts.getItemString(tab_1.tp_1.dw_facts.getrow(),'clugar_fact')
dw_procs.setfilter("nfact_cpo="+string(nfact)+" and clug_fac='"+clug+"' and (not isNull(subitem))")
dw_procs.Filter()
dw_procs.Event rowFocusChanged(dw_procs.GetRow())

end event

type rb_t from radiobutton within tp_2
integer x = 2322
integer y = 40
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ver Todos"
boolean checked = true
end type

event clicked;double nfact
string clug
nfact = tab_1.tp_1.dw_facts.getItemNumber(tab_1.tp_1.dw_facts.getrow(),'nfact')
clug = tab_1.tp_1.dw_facts.getItemString(tab_1.tp_1.dw_facts.getrow(),'clugar_fact')
dw_procs.setfilter("nfact_cpo="+string(nfact)+" and clug_fac='"+clug+"'")
dw_procs.Filter()
dw_procs.Event rowFocusChanged(dw_procs.GetRow())

end event

type st_10 from statictext within tp_2
integer x = 18
integer y = 888
integer width = 855
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objeciones de la factura seleccionada"
boolean focusrectangle = false
end type

type pb_9 from picturebutton within tp_2
integer x = 4695
integer y = 1132
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Objeción"
end type

event clicked;if dw_proc_glos.RowCount() > 0 then
	long i
	if MessageBox('Atención','Está seguro de borrar la objeción seleccionada?',QUESTION!,YESNO!) = 2 then Return 0
	dw_proc_glos.DeleteRow(dw_proc_glos.GetRow())
	dw_proc_glos.Event p_itemchanged(0)
	if dw_procs.GetItemNumber(dw_procs.GetRow(),'valor_objecion') = 0 then
		dw_procs.Event borra_fila(dw_procs.GetRow())
	end if
	if rb_o.checked then rb_o.event clicked()
	i_cambio = true
end if

end event

type pb_op from picturebutton within tp_2
integer x = 4695
integer y = 972
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "D_insertar.gif"
string powertiptext = "Adicionar Objeción"
end type

event clicked;long fila, ng, f
if dw_procs.RowCount() = 0 then Return -1
f = dw_procs.GetRow()
if tab_1.tp_1.dw_facts.GetItemString(tab_1.tp_1.dw_facts.GetRow(),'estado') <> 'O' then
	MessageBox('Atención','La factura está cerrada para ser modificada')
	Return -1
end if

dw_procs.event setModified(f)
fila = dw_proc_glos.InsertRow(0)
ng = long(dw_proc_glos.Describe("Evaluate('max(nobjecion)',0)")) + 1
dw_proc_glos.SetItem(fila,'coddoc',dw_procs.GetItemString(f,'coddoc'))
dw_proc_glos.SetItem(fila,'clugar',dw_procs.GetItemString(f,'clugar'))
dw_proc_glos.SetItem(fila,'num_glosa',dw_procs.GetItemNumber(f,'num_glosa'))
dw_proc_glos.SetItem(fila,'item',dw_procs.GetItemNumber(f,'item'))
dw_proc_glos.SetItem(fila,'subitem',dw_procs.GetItemNumber(f,'subitem'))
dw_proc_glos.SetItem(fila,'nobjecion',ng)
dw_proc_glos.SetItem(fila,'nfact',dw_procs.GetItemNumber(f,'nfact_cpo'))
dw_proc_glos.SetItem(fila,'clugar_fact',dw_procs.GetItemString(f,'clug_fac'))
dw_proc_glos.SetItem(fila,'tipo_fact',dw_procs.GetItemString(f,'tipo_fac'))
dw_proc_glos.SetItem(fila,'nitem_fact',dw_procs.GetItemNumber(f,'nitem_fac'))
dw_proc_glos.SetItem(fila,'estado','O')
dw_proc_glos.SetItem(fila,'fecha_tramite',today())
i_cambio = true
Return fila

end event

type pb_4 from picturebutton within tp_2
integer x = 2126
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
string picturename = "factura.gif"
string disabledname = "d_factura.gif"
string powertiptext = "Simulador de Facturación"
end type

event clicked;if dw_procs.rowcount()=0 or tab_1.tp_1.dw_facts.rowcount()=0 then return
string estado
estado = tab_1.tp_1.dw_facts.getitemstring(tab_1.tp_1.dw_facts.getrow(),'estado')
//if  estado <> 'O' then return
st_dws_revisa lst_p
lst_p.dw_fac = tab_1.tp_1.dw_facts
lst_p.dw_proc = tab_1.tp_2.dw_procs
lst_p.dw_item = tab_1.tp_3.dw_sitem

openwithparm(w_simula_fac,lst_p)

end event

type cbx_p from checkbox within tp_2
boolean visible = false
integer x = 2757
integer y = 28
integer width = 741
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
string text = "Replicar cambios hacia abajo"
boolean checked = true
end type

type pb_2 from picturebutton within tp_2
integer x = 1966
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
string picturename = "editar.gif"
string powertiptext = "Utilidades"
end type

event clicked;if dw_procs.rowcount()=0 or tab_1.tp_1.dw_facts.rowcount()=0 then return
string padre,estado
//estado=tab_1.tp_1.dw_facts.getitemstring(tab_1.tp_1.dw_facts.getrow(),'estado')
//padre=tab_1.tp_1.dw_facts.getitemstring(tab_1.tp_1.dw_facts.getrow(),'tipo')
//if  isnull(padre) or padre='1' or estado<>'O' then return
open(w_glosas_utilidades)
end event

type dw_factsub from datawindow within tp_2
boolean visible = false
integer x = 2414
integer y = 32
integer width = 517
integer height = 76
integer taborder = 50
string title = "none"
string dataobject = "dw_detasubfac"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_5 from statictext within tp_2
integer x = 9
integer y = 24
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
integer x = 233
integer y = 12
integer width = 1705
integer height = 88
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_facts_glos"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('nfact',idw_facts)
idw_facts.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string clug,ctipo
long donde
clug=idw_facts.getitemstring(idw_facts.getrow(),'clugar_fact')
ctipo=idw_facts.getitemstring(idw_facts.getrow(),'tipo_fact')
donde=tab_1.tp_1.dw_facts.find('nfact='+data+' and clugar_fact="'+clug+'" and tipo_fac="'+ctipo+"'",1,tab_1.tp_1.dw_facts.rowcount())
tab_1.tp_1.dw_facts.scrolltorow(donde)
end event

type dw_procs from datawindow within tp_2
event type long borra_fila ( long row )
event p_itemchanged ( )
event setmodified ( integer fila )
integer x = 23
integer y = 124
integer width = 5947
integer height = 740
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_factcpo_xa_glos2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type long borra_fila(long row);string snulo,clug,err
long nnulo,nglos,item,sitem,j
setnull(snulo)
setnull(nnulo)

if isNull(GetitemNumber(row,'item')) then Return 0
RowsCopy(row, row, Primary!, this, row + 1, Primary!)
DeleteRow(row)

setitem(row,'coddoc',snulo)
setitem(row,'clugar',snulo)
setitem(row,'num_glosa',nnulo)
setitem(row,'item',nnulo)
setitem(row,'nfact',nnulo)
setitem(row,'clugar_fact',snulo)
setitem(row,'nitem_fact',nnulo)
setitem(row,'subitem',nnulo)
setitem(row,'cod_objecion',snulo)
setitem(row,'valor_objecion',nnulo)
setitem(row,'pertinente',snulo)
setitem(row,'detalle',snulo)
setitem(row,'tipo',snulo)
setitem(row,'porcen',nnulo)
dw_obj_proc.setitem(1,'detalle',snulo)
setitemstatus(row,0,primary!,NotModified!)
Event rowfocuschanged(row)
return 0

end event

event setmodified(integer fila);if isnull(dw_procs.getitemnumber(fila,'item')) then
	dw_procs.setitemstatus(fila,0,primary!,NewModified!)
	dw_procs.setitem(fila,'coddoc',i_cdoc)
	dw_procs.setitem(fila,'clugar',dw_deta.getitemstring(1,'clugar'))
	dw_procs.setitem(fila,'num_glosa',dw_deta.getitemnumber(1,'num_glosa'))
	dw_procs.setitem(fila,'item',tab_1.tp_1.dw_facts.getitemnumber(tab_1.tp_1.dw_facts.getrow(),'item'))
	dw_procs.setitem(fila,'nfact',dw_procs.getitemnumber(fila,'nfact_cpo'))
	dw_procs.setitem(fila,'clugar_fact',dw_procs.getitemstring(fila,'clug_fac'))
	dw_procs.setitem(fila,'tipo_fact',dw_procs.getitemstring(fila,'tipo_fac'))
	dw_procs.setitem(fila,'nitem_fact',dw_procs.getitemnumber(fila,'nitem_fac'))
	dw_procs.setitem(fila,'subitem',long(dw_procs.describe("Evaluate('max(subitem)',0)"))+1)
	dw_procs.setitem(fila,'estado',tab_1.tp_1.dw_facts.GetItemString(tab_1.tp_1.dw_facts.GetRow(),'estado'))
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
//getchild('cod_objecion',idw_obj2)
//idw_obj2.settransobject(sqlca)
//idw_obj2.retrieve('%')
//idw_obj2.InsertRow(1)
//
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if

end event

event itemchanged;choose case dwo.name
	case 'diferencia'
		if acceptText() = -1 then Return -1
		dw_deta.SetItem(1,'diferencia',calc_diff())
		i_cambio = TRUE
end choose

end event

event buttonclicked;long item
item=getitemnumber(row,'item')
if (not isnull(item)) and (getitemstatus(row,0,primary!)=NotModified! or getitemstatus(row,0,primary!)=dataModified!) then
	if messagebox('Atención','Está seguro que desea borrar el registro?. El cambio se guardará automáticamente.',question!,yesno!,1)=2 then return -1
end if
if event borra_fila(row)<>-1 then
	commit;
end if
event p_itemchanged()
i_cambio=true

end event

event rowfocuschanged;boolean inserta = FALSE
//dw_obj_proc.reset()
tab_1.tp_3.dw_sitem.setfilter('isnull(item)')
if getrow()>0 then
	if isnull(getitemnumber(getrow(),'nfact_cpo')) then return
	long donde,j
	donde=idw_procs.find('nfact='+string(getitemnumber(getrow(),'nfact_cpo'))+' and clugar="'+getitemstring(getrow(),'clug_fac')+'" and nitem='+string(getitemnumber(getrow(),'nitem_fac')),1,idw_facts.rowcount())
	idw_procs.scrolltorow(donde)
	tab_1.tp_3.dw_dprocs.setitem(1,1,getitemnumber(getrow(),'nitem_fac'))
	tab_1.tp_3.dw_sitem.setredraw(false)
	tab_1.tp_3.dw_sitem.setfilter("cnf="+string(getitemnumber(getrow(),'nfact_cpo'))+" and clugar_sfac='"+getitemstring(getrow(),'clug_fac')+"' and nitem="+string(getitemnumber(getrow(),'nitem_fac')))
	tab_1.tp_3.dw_sitem.filter()
	tab_1.tp_2.dw_proc_glos.setfilter("nfact="+string(getitemnumber(getrow(),'nfact_cpo'))+" and clugar_fact='"+getitemstring(getrow(),'clug_fac')+"' and nitem_fact="+string(getitemnumber(getrow(),'nitem_fac')))
	tab_1.tp_2.dw_proc_glos.filter()
	tab_1.tp_2.dw_proc_glos.Event porcentajes()

	tab_1.tp_2.dw_proc_glos.event rowfocuschanged(tab_1.tp_2.dw_proc_glos.getrow())
	dw_factsub.retrieve(getitemnumber(getrow(),'nfact_cpo'),getitemstring(getrow(),'clug_fac'),getitemstring(getrow(),'tipo_fac'),getitemnumber(getrow(),'nitem_fac'))
	for j=1 to dw_factsub.rowcount()
		if tab_1.tp_3.dw_sitem.find('ndeta_sfac='+string(dw_factsub.getitemnumber(j,'ndeta_sfac')),1,tab_1.tp_3.dw_sitem.rowcount())=0 then
			inserta = TRUE
			tab_1.tp_3.dw_sitem.insertrow(1)
			tab_1.tp_3.dw_sitem.setitem(1,'cnf',dw_factsub.getitemnumber (j, 'cnf'))
			tab_1.tp_3.dw_sitem.setitem(1,'clugar_sfac',dw_factsub.getitemstring (j, 'clugar_sfac'))
			tab_1.tp_3.dw_sitem.setitem(1,'nitem',dw_factsub.getitemnumber (j, 'nitem'))
			tab_1.tp_3.dw_sitem.setitem(1,'ndeta_sfac',dw_factsub.getitemnumber (j, 'ndeta_sfac'))
			if i_total then
				tab_1.tp_3.dw_sitem.setitem(1,'vemp',dw_factsub.getitemnumber (j, 'vproced'))
				tab_1.tp_3.dw_sitem.setitem(1,'vempresa',round(dw_factsub.getitemnumber (j, 'vproced')*getitemnumber(getrow(),'vempresa')/getitemnumber(getrow(),'vemp'),i_dec_gral_car))
			else
				tab_1.tp_3.dw_sitem.setitem(1,'vproced',dw_factsub.getitemnumber (j, 'vproced'))
				tab_1.tp_3.dw_sitem.setitem(1,'vemp',round(dw_factsub.getitemnumber (j, 'vproced')*getitemnumber(getrow(),'vemp')/getitemnumber(getrow(),'vproced'),i_dec_gral_car))
			end if
			tab_1.tp_3.dw_sitem.setitem(1,'cantidad',dw_factsub.getitemnumber (j, 'cantidad'))
			tab_1.tp_3.dw_sitem.setitem(1,'cproced',dw_factsub.getitemstring (j, 'cproced'))
			tab_1.tp_3.dw_sitem.setitem(1,'descripcion',dw_factsub.getitemstring (j, 'descripcion'))
			tab_1.tp_3.dw_sitem.setitemstatus(1,0,primary!,datamodified!)
			tab_1.tp_3.dw_sitem.setitemstatus(1,0,primary!,notmodified!)
		end if
	next
	tab_1.tp_3.dw_sitem.sort()
	tab_1.tp_3.dw_sitem.event rowfocuschanged(tab_1.tp_3.dw_sitem.getrow())
	if not i_procesa then tab_1.tp_3.dw_sitem.setredraw(true)
	tab_1.tp_2.st_8.Text = 'Registro '+ string(tab_1.tp_2.dw_procs.GetRow()) +' de ' + string(tab_1.tp_2.dw_procs.RowCount())
else
	tab_1.tp_3.dw_sitem.filter()
end if

end event

event clicked;if row>0 and row<>getrow() then setrow(row)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.dw_cab=tab_1.tp_1.dw_facts
st_dw.color_fondo=string(rgb(255,255,255))
st_dw.solobuscar = TRUE
openwithparm(w_funcion_dw,st_dw)
end event

type dw_obj_proc from datawindow within tp_2
integer x = 4878
integer y = 884
integer width = 1106
integer height = 528
integer taborder = 60
string title = "none"
string dataobject = "dw_glosa_subdeta"
boolean border = false
boolean livescroll = true
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

event losefocus;triggerevent(itemchanged!)
end event

event itemchanged;accepttext()
if dw_proc_glos.rowcount()=0 or rowcount()=0 then return
if (isnull(dw_proc_glos.getitemstring(dw_proc_glos.getrow(),'objecion')) and getitemstring(1,'detalle')<>'' ) or (dw_proc_glos.getitemstring(dw_proc_glos.getrow(),'objecion')<>getitemstring(1,'detalle')) then
	dw_proc_glos.setitem(dw_proc_glos.getrow(),'objecion',getitemstring(1,'detalle'))
//	if isnull(dw_proc_glos.getitemnumber(dw_proc_glos.getrow(),'item')) then
//		dw_proc_glos.setitemstatus(dw_proc_glos.getrow(),0,primary!,notmodified!)
//	end if
	i_cambio=true
end if

end event

type dw_proc_glos from datawindow within tp_2
event type integer p_itemchanged ( integer p_fila )
event porcentajes ( )
integer x = 14
integer y = 952
integer width = 4613
integer height = 564
integer taborder = 50
string title = "none"
string dataobject = "dw_glos_proc_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer p_itemchanged(integer p_fila);accepttext()
long f, i
decimal nvalor
if dw_procs.RowCount() = 0 then rb_t.Event clicked()
f = dw_procs.GetRow()
nvalor  = f_sum_obj_proc(dw_procs.GetItemNumber(f,'nfact_cpo'),dw_procs.GetItemString(f,'clug_fac'),dw_procs.GetItemString(f,'tipo_fac'),dw_procs.GetItemNumber(f,'nitem_fac'))
if nvalor > (dw_procs.GetItemNumber(f,'vemp') -dw_procs.GetItemNumber(f,'total_aceptado')) then
	if p_fila > 0 then 
		SetItem(p_fila,'valor_objecion',0)
		SetItem(p_fila,'porcen',0)
		Post Event p_itemchanged(p_fila)
	end if
	fin_procesa()
	MessageBox('Atención','El valor de la objeción excede el valor total del procedimiento')
	Return -1
end if
dw_procs.SetItem(f,'valor_objecion',nvalor)
for i = 1 to tab_1.tp_3.dw_sitem.RowCount()
	tab_1.tp_3.dw_sitem.event setModified(i)
	nvalor = f_sum_obj_item(dw_procs.GetItemNumber(f,'nfact_cpo'),dw_procs.GetItemString(f,'clug_fac'),dw_procs.GetItemNumber(f,'nitem_fac'),tab_1.tp_3.dw_sitem.GetItemNumber(i,'ndeta_sfac'))
	if nvalor > tab_1.tp_3.dw_sitem.GetItemNumber(i,'vemp') then
		if p_fila > 0 then 
			SetItem(p_fila,'valor_objecion',0)
			SetItem(p_fila,'porcen',0)
			Post Event p_itemchanged(p_fila)
		end if
		fin_procesa()
		MessageBox('Atención','El valor de la objeción excede el valor total del Item ' + string(tab_1.tp_3.dw_sitem.GetItemNumber(i,'ndeta')))
		Return -1
	end if
	tab_1.tp_3.dw_sitem.setItem(i,'valor_objecion',nvalor)
next
if tab_1.tp_3.dw_sitem.RowCount() > 0 then
	if tab_1.tp_3.dw_sitem.GetItemNumber(1,'tobjecion') <> tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.GetRow(),'valor_objecion') then
		tab_1.tp_3.dw_sitem.SetItem(tab_1.tp_3.dw_sitem.RowCount(),'valor_objecion', tab_1.tp_3.dw_sitem.GetItemNumber(tab_1.tp_3.dw_sitem.RowCount(),'valor_objecion') + tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.GetRow(),'valor_objecion') - tab_1.tp_3.dw_sitem.GetItemNumber(1,'tobjecion') )
	end if
end if

nvalor = f_sum_obj_fact(dw_procs.GetItemNumber(f,'nfact_cpo'),dw_procs.GetItemString(f,'clug_fac'),dw_procs.GetItemString(f,'tipo_fac'))
if nvalor > tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'vtemp') then
	if p_fila > 0 then 
		SetItem(p_fila,'valor_objecion',0)
		SetItem(p_fila,'porcen',0)
		Post Event p_itemchanged(p_fila)
	end if
	fin_procesa()
	MessageBox('Atención','El valor de la objeción excede el valor total de la factura ' + string(tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'nfact')))
	Return -1
end if
tab_1.tp_1.dw_facts.SetItem(tab_1.tp_1.dw_facts.GetRow(),'valor_objecion',nvalor)
dw_deta.setitem(1,'valor',tab_1.tp_1.dw_facts.getItemNumber(1,'total'))
dw_histo.setitem(dw_histo.getrow(),'valor',tab_1.tp_1.dw_facts.getItemNumber(1,'total'))
Return 0

end event

event porcentajes();long i
for i = 1 to RowCount()
	SetItem(i,'porcen',round(GetItemNumber(i,'valor_objecion')/dw_procs.GetItemNumber(dw_procs.GetRow(),'vemp')*100,i_dec_gral_car))
	SetItem(i,'vtemp',dw_procs.GetItemNumber(dw_procs.GetRow(),'vemp'))
next

end event

event constructor;setTransObject(SQLCA)
getchild('con_espe',idw_espe2)
idw_espe2.settransobject(sqlca)
idw_espe2.retrieve('%')
getchild('cod_objecion',idw_obj2)
idw_obj2.settransobject(sqlca)
idw_obj2.retrieve('%','%')
getchild('nombre',idw_usuresp2)
idw_usuresp2.settransobject(sqlca)
end event

event itemchanged;string nulo
long j
setNull(nulo)
choose case dwo.name
	case 'con_gral'
		setitem(row,'con_espe',nulo)
		if idw_espe2.retrieve(data)=1 then
			setitem(row,'con_espe',idw_espe2.getitemstring(idw_espe2.getrow(),'con_espe') )
		end if
		
	case 'con_espe'		
		setitem(row,'cod_objecion',nulo)
		if idw_obj2.retrieve(getitemstring(row,'con_gral'),data)=1 then
			setitem(row,'cod_objecion',idw_obj2.getitemstring(idw_obj2.getrow(),1) )
		end if		
		
	case 'cod_objecion'
		setitem(row,'pertinente',idw_obj2.getitemstring(idw_obj2.getrow(),'pertinente'))
		//setitem(row,'respuesta_hasta',datetime(relativedate(date(getitemdatetime(row,'fecha_tramite')),idw_obj.getitemnumber(idw_obj.getrow(),'tiempo_resp'))))
		setitem(row,'usu_responde',nulo)
		setitem(row,'nombre',nulo)
		if idw_usuresp2.retrieve(data)=1 then
			setitem(row,'usu_responde',idw_usuresp2.getitemstring(1,'responsable'))
			setitem(row,'nombre',idw_usuresp2.getitemstring(1,'nombre'))
		end if
		
	case 'nombre'
		setitem(row,'usu_responde',idw_usuresp2.getitemstring(idw_usuresp2.getrow(),'responsable'))
		if cbx_p.Checked then
			for j= row + 1 to rowcount()
				//if j=row then continue
				if not isnull(getitemstring(j,'usu_responde')) or getitemstring(row,'cod_objecion') <> getitemstring(j,'cod_objecion') then continue
				setitem(j,'nombre',data)
				setitem(j,'usu_responde',idw_usuresp2.getitemstring(idw_usuresp2.getrow(),'responsable'))
			next
		end if
		
	case 'valor_objecion'
		setitem(row,'porcen',round(dec(data)/dw_procs.getitemnumber(dw_procs.GetRow(),'vemp')*100,i_dec_gral_car))
		//post calcula_sub(row,1,GetItemNumber(GetRow(),'porcen')/100)
		post event p_itemchanged(row)
		
	case 'porcen'
		setitem(row,'valor_objecion',round(dw_procs.GetItemNumber(dw_procs.GetRow(),'vemp')*dec(data)/100,i_dec_gral_car))
		post event itemchanged(row,object.valor_objecion,string(round(dw_procs.GetItemNumber(dw_procs.GetRow(),'vemp')*dec(data)/100,i_dec_gral_car)))
end choose
i_cambio=true

end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if

end event

event rowfocuschanged;dw_obj_proc.reset()
if currentrow = 0 or rowCount() = 0 then Return
dw_obj_proc.insertrow(1)
dw_obj_proc.setitem(1,'detalle',getitemstring(getrow(),'objecion'))
idw_usuresp2.retrieve(getitemstring(getrow(),'cod_objecion'))
end event

event losefocus;if rowCount() = 0 then Return 0
if GetItemString(GetRow(),'estado') <> 'O' then Return 0
if GetRow() >0 and (GetcolumnName() = 'valor_objecion' or GetcolumnName() = 'porcen' ) then 
	if acceptText() = -1 then Return -1
	event p_itemchanged(GetRow())
end if

end event

type st_8 from statictext within tp_2
integer x = 4050
integer y = 888
integer width = 745
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer height = 1528
long backcolor = 67108864
string text = "Items del Proc."
long tabtextcolor = 33554432
string picturename = "bisturi.ico"
long picturemaskcolor = 536870912
string powertiptext = "Subdetalle del Procedimiento"
st_11 st_11
pb_11 pb_11
pb_oi pb_oi
st_7 st_7
st_6 st_6
dw_dprocs dw_dprocs
dw_dfacts2 dw_dfacts2
dw_obj_sitem dw_obj_sitem
dw_item_glos dw_item_glos
dw_sitem dw_sitem
end type

on tp_3.create
this.st_11=create st_11
this.pb_11=create pb_11
this.pb_oi=create pb_oi
this.st_7=create st_7
this.st_6=create st_6
this.dw_dprocs=create dw_dprocs
this.dw_dfacts2=create dw_dfacts2
this.dw_obj_sitem=create dw_obj_sitem
this.dw_item_glos=create dw_item_glos
this.dw_sitem=create dw_sitem
this.Control[]={this.st_11,&
this.pb_11,&
this.pb_oi,&
this.st_7,&
this.st_6,&
this.dw_dprocs,&
this.dw_dfacts2,&
this.dw_obj_sitem,&
this.dw_item_glos,&
this.dw_sitem}
end on

on tp_3.destroy
destroy(this.st_11)
destroy(this.pb_11)
destroy(this.pb_oi)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.dw_dprocs)
destroy(this.dw_dfacts2)
destroy(this.dw_obj_sitem)
destroy(this.dw_item_glos)
destroy(this.dw_sitem)
end on

type st_11 from statictext within tp_3
integer x = 14
integer y = 860
integer width = 855
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objeciones de la factura seleccionada"
boolean focusrectangle = false
end type

type pb_11 from picturebutton within tp_3
integer x = 4672
integer y = 1064
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &n"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Objeción"
end type

event clicked;if dw_item_glos.RowCount() > 0 then
	if MessageBox('Atención','Está seguro de borrar la objeción seleccionada?',QUESTION!,YESNO!) = 2 then Return 0
	dw_item_glos.DeleteRow(dw_item_glos.GetRow())
	dw_item_glos.event p_itemchanged(0)
	if dw_sitem.GetItemNumber(dw_sitem.GetRow(),'valor_objecion') = 0 then
		dw_sitem.Event borra_boton(dw_sitem.GetRow())
	end if
	i_cambio = true
end if

end event

type pb_oi from picturebutton within tp_3
integer x = 4667
integer y = 920
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "D_insertar.gif"
string powertiptext = "Adicionar Objeción"
end type

event clicked;long fila, ff, ng
if dw_sitem.RowCount() =  0 then Return -1
ff = dw_sitem.GetRow()
if tab_1.tp_1.dw_facts.GetItemString(tab_1.tp_1.dw_facts.GetRow(),'estado') <> 'O' then
	MessageBox('Atención','La factura está cerrada para ser modificada')
	Return -1
end if
fila = dw_item_glos.InsertRow(0)
tab_1.tp_2.dw_procs.event setModified(tab_1.tp_2.dw_procs.GetRow())
dw_sitem.Event setModified(dw_sitem.GetRow())
ng = long(dw_item_glos.Describe("Evaluate('max(nobjecion)',0)")) + 1
dw_item_glos.SetItem(fila,'coddoc',dw_sitem.GetItemString(ff,'coddoc'))
dw_item_glos.SetItem(fila,'clugar',dw_sitem.GetItemString(ff,'clugar'))
dw_item_glos.SetItem(fila,'num_glosa',dw_sitem.GetItemNumber(ff,'num_glosa'))
dw_item_glos.SetItem(fila,'item',dw_sitem.GetItemNumber(ff,'item'))
dw_item_glos.SetItem(fila,'subitem',dw_sitem.GetItemNumber(ff,'subitem'))
dw_item_glos.SetItem(fila,'ndeta',dw_sitem.GetItemNumber(ff,'ndeta'))
dw_item_glos.SetItem(fila,'nobjecion',ng)
dw_item_glos.SetItem(fila,'nfact',dw_sitem.GetItemNumber(ff,'nfact'))
dw_item_glos.SetItem(fila,'clugar_fact',dw_sitem.GetItemString(ff,'clug_fact'))
dw_item_glos.SetItem(fila,'nitem_fact',dw_sitem.GetItemNumber(ff,'nitem_fact'))
dw_item_glos.SetItem(fila,'ndeta_fact',dw_sitem.GetItemNumber(ff,'ndeta_fact'))
dw_item_glos.SetItem(fila,'estado','O')
dw_item_glos.SetItem(fila,'fecha_tramite',today())
i_cambio = true
Return fila

end event

type st_7 from statictext within tp_3
integer x = 1970
integer y = 12
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

type st_6 from statictext within tp_3
integer x = 18
integer y = 8
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

type dw_dprocs from datawindow within tp_3
integer x = 2322
integer y = 4
integer width = 1765
integer height = 88
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_procs"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('nitem_fact',idw_procs)
idw_procs.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if tab_1.tp_2.dw_procs.event rowfocuschanging(tab_1.tp_2.dw_procs.getrow(),1)<>0 then 
	settext(string(getitemnumber(1,1)))
	return 2
end if
string clug
long donde,nfact
clug=idw_procs.getitemstring(idw_procs.getrow(),'clugar')
nfact=idw_procs.getitemNumber(idw_procs.getrow(),'nfact')
donde=tab_1.tp_2.dw_procs.find('nfact_cpo='+string(nfact)+' and clug_fac="'+clug+'" and nitem_fac='+data,1,tab_1.tp_2.dw_procs.rowcount())
tab_1.tp_2.dw_procs.scrolltorow(donde)
end event

type dw_dfacts2 from datawindow within tp_3
integer x = 238
integer y = 4
integer width = 1691
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_facts_glos"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('nfact',idw_facts2)
idw_facts2.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string clug
long donde
clug = idw_facts2.getitemstring(idw_facts2.getrow(),'clugar_fact')
donde = tab_1.tp_1.dw_facts.find('nfact='+data+' and clugar_fact="'+clug+'"',1,tab_1.tp_1.dw_facts.rowcount())
tab_1.tp_1.dw_facts.scrolltorow(donde)
end event

type dw_obj_sitem from datawindow within tp_3
integer x = 4873
integer y = 888
integer width = 1129
integer height = 624
integer taborder = 70
string title = "none"
string dataobject = "dw_glosa_subdeta"
boolean border = false
boolean livescroll = true
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

event itemchanged;accepttext()
if dw_item_glos.rowcount()=0 or rowcount()=0 then return
if (isnull(dw_item_glos.getitemstring(dw_item_glos.getrow(),'objecion')) and getitemstring(1,'detalle')<>'' ) or (dw_item_glos.getitemstring(dw_item_glos.getrow(),'objecion')<>getitemstring(1,'detalle')) then
	dw_item_glos.setitem(dw_item_glos.getrow(),'objecion',getitemstring(1,'detalle'))
	i_cambio=true
end if

end event

event losefocus;triggerevent(itemchanged!)
end event

type dw_item_glos from datawindow within tp_3
event type integer p_itemchanged ( integer p_fila )
event porcentajes ( )
integer x = 14
integer y = 928
integer width = 4599
integer height = 484
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_glos_item_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer p_itemchanged(integer p_fila);accepttext()
if rowcount() > 0 then
	long f
	decimal nvalor
	f = dw_sitem.GetRow()
	nvalor = f_sum_obj_item(dw_sitem.GetItemNumber(f,'cnf'),dw_sitem.GetItemString(f,'clugar_sfac'),dw_sitem.GetItemNumber(f,'nitem'),dw_sitem.GetItemNumber(f,'ndeta_sfac'))
	if nvalor > dw_sitem.GetItemNumber(dw_sitem.GetRow(),'vemp') then
		if p_fila > 0 then 
			SetItem(p_fila,'valor_objecion',0)
			SetItem(p_fila,'porcen',0)
			Post Event p_itemchanged(p_fila)
		end if
		MessageBox('Atención','El valor de la objeción excede el valor total del item')
		Return -1
	end if
	dw_sitem.SetItem(dw_sitem.GetRow(),'valor_objecion', nvalor)
	nvalor = f_sum_obj_proc(dw_sitem.GetItemNumber(f,'cnf'),dw_sitem.GetItemString(f,'clugar_sfac'),dw_sitem.GetItemString(f,'tipo_sfac'),dw_sitem.GetItemNumber(f,'nitem'))
	if nvalor > tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.GetRow(),'vemp') then
		if p_fila > 0 then 
			SetItem(p_fila,'valor_objecion',0)
			SetItem(p_fila,'porcen',0)
			Post Event p_itemchanged(p_fila)
		end if
		MessageBox('Atención','El valor de la objeción excede el valor total del procedimiento')
		Return -1
	end if
	tab_1.tp_2.dw_procs.SetItem(tab_1.tp_2.dw_procs.GetRow(),'valor_objecion',nvalor)
	nvalor = f_sum_obj_fact(dw_sitem.GetItemNumber(f,'cnf'),dw_sitem.GetItemString(f,'clugar_sfac'),dw_sitem.GetItemString(f,'tipo_sfac'))
	if nvalor > tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'vtemp') then
		if p_fila > 0 then 
			SetItem(p_fila,'valor_objecion',0)
			SetItem(p_fila,'porcen',0)
			Post Event p_itemchanged(p_fila)
		end if
		MessageBox('Atención','El valor de la objeción excede el valor total de la factura ' + string(tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'nfact')))
		Return -1
	end if
	tab_1.tp_1.dw_facts.SetItem(tab_1.tp_1.dw_facts.GetRow(),'valor_objecion',nvalor)
	dw_deta.setitem(1,'valor',tab_1.tp_1.dw_facts.getItemNumber(1,'total'))
	dw_histo.setitem(dw_histo.getrow(),'valor',tab_1.tp_1.dw_facts.getItemNumber(1,'total'))
end if
Return 0


end event

event porcentajes();long i
for i = 1 to RowCount()
	SetItem(i,'porcen',round(GetItemNumber(i,'valor_objecion')/dw_sitem.GetItemNumber(dw_sitem.GetRow(),'vemp')*100,i_dec_gral_car))
	SetItem(i,'vtemp',dw_sitem.GetItemNumber(dw_sitem.GetRow(),'vemp'))
next

end event

event constructor;setTransObject(SQLCA)
getchild('con_espe',idw_espe3)
idw_espe3.settransobject(sqlca)
idw_espe3.retrieve('%')
getchild('cod_objecion',idw_obj3)
idw_obj3.settransobject(sqlca)
idw_obj3.retrieve('%','%')
//idw_obj3.InsertRow(1)
getchild('nombre',idw_usuresp3)
idw_usuresp3.settransobject(sqlca)

end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if

end event

event itemchanged;string nulo
setNull(nulo)
choose case dwo.name
	case 'con_gral'
		setitem(row,'con_espe',nulo)
		if idw_espe3.retrieve(data)=1 then
			setitem(row,'con_espe',idw_espe2.getitemstring(idw_espe2.getrow(),'con_espe') )
		end if
	case 'con_espe'		
		setitem(row,'cod_objecion',nulo)
		if idw_obj3.retrieve(getitemstring(row,'con_gral'),data)=1 then
			setitem(row,'cod_objecion',idw_obj3.getitemstring(idw_obj3.getrow(),1) )		
		end if
		
	case 'cod_objecion'
		setitem(row,'pertinente',idw_obj3.getitemstring(idw_obj3.getrow(),'pertinente'))
		setitem(row,'respuesta_hasta',datetime(relativedate(date(getitemdatetime(row,'fecha_tramite')),idw_obj.getitemnumber(idw_obj.getrow(),'tiempo_resp'))))
		setitem(row,'usu_responde',nulo)
		setitem(row,'nombre',nulo)
		if idw_usuresp3.retrieve(data)=1 then
			setitem(row,'usu_responde',idw_usuresp3.getitemstring(1,'responsable'))
			setitem(row,'nombre',idw_usuresp3.getitemstring(1,'nombre'))
		end if
	case 'nombre'
		setitem(row,'usu_responde',idw_usuresp3.getitemstring(idw_usuresp3.getrow(),'responsable'))
	case 'valor_objecion'
		setitem(row,'porcen',round(dec(data)/dw_sitem.getitemnumber(dw_sitem.GetRow(),'vemp')*100,i_dec_gral_car))
//		dw_sitem.SetItem(dw_sitem.GetRow(),'valor_objecion',GetItemNumber(1,'tobjecion'))
//		tab_1.tp_2.dw_procs.SetItem(tab_1.tp_2.dw_procs.GetRow(),'valor_objecion',f_sum_obj_proc( tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.GetRow(),'nfact'),tab_1.tp_2.dw_procs.GetItemString(tab_1.tp_2.dw_procs.GetRow(),'clugar_fact'),tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.GetRow(),'nitem_fact')))
//		tab_1.tp_1.dw_facts.SetItem(tab_1.tp_1.dw_facts.GetRow(),'valor_objecion',f_sum_obj_fact( tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'nfact'),tab_1.tp_1.dw_facts.GetItemString(tab_1.tp_1.dw_facts.GetRow(),'clugar_fact')))
		post event p_itemchanged(row)
	case 'porcen'
		setitem(row,'valor_objecion',round(dw_sitem.getitemnumber(dw_sitem.GetRow(),'vemp')*dec(data)/100,i_dec_gral_car))
		event itemchanged(row,object.valor_objecion,string(round(dw_sitem.getitemnumber(dw_sitem.GetRow(),'vemp')*dec(data)/100,i_dec_gral_car)))
end choose
i_cambio = true

end event

event rowfocuschanged;dw_obj_sitem.reset()
if currentrow = 0 or rowCount() = 0 then Return
dw_obj_sitem.insertrow(1)
dw_obj_sitem.setitem(1,'detalle',getitemstring(getrow(),'objecion'))
idw_usuresp3.retrieve(getitemstring(getrow(),'cod_objecion'))
end event

event losefocus;if rowCount() = 0 then Return 0
if GetItemString(GetRow(),'estado') <> 'O' then Return 0
if GetRow() >0 and (GetcolumnName() = 'valor_objecion' or GetcolumnName() = 'porcen' ) then 
	if acceptText() = -1 then Return -1
	event p_itemchanged(GetRow())
end if

end event

type dw_sitem from datawindow within tp_3
event type long borra_boton ( long row )
event p_itemchanged ( )
event setmodified ( integer fila )
integer x = 5
integer y = 88
integer width = 5998
integer height = 752
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_car_glos_subcpo2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type long borra_boton(long row);string snulo,clug,err
long nnulo,nglos,item,sitem,ndeta
setnull(snulo)
setnull(nnulo)
if isNull(GetitemNumber(row,'item')) then Return 0
RowsCopy(row, row, Primary!, this, row + 1, Primary!)
DeleteRow(row)
setitem(row,'coddoc',snulo)
setitem(row,'clugar',snulo)
setitem(row,'num_glosa',nnulo)
setitem(row,'item',nnulo)
setitem(row,'nfact',nnulo)
setitem(row,'clugar_fact',snulo)
setitem(row,'nitem_fact',nnulo)
setitem(row,'subitem',nnulo)
setitem(row,'ndeta',nnulo)
setitem(row,'cod_objecion',snulo)
setitem(row,'valor_objecion',nnulo)
setitem(row,'pertinente',snulo)
setitem(row,'detalle',snulo)
dw_obj_sitem.setitem(1,'detalle',snulo)
setitemstatus(row,0,primary!,NotModified!)
Return 1

end event

event p_itemchanged();//accepttext()
//if rowcount()=0 then 
//	tab_1.tp_2.dw_procs.setitem(tab_1.tp_2.dw_procs.getrow(),'valor_objecion',0)
//else
//	tab_1.tp_2.dw_procs.setitem(tab_1.tp_2.dw_procs.getrow(),'valor_objecion',getitemnumber(1,'tobjecion'))
//end if
//tab_1.tp_2.dw_procs.event p_itemchanged()
//
end event

event setmodified(integer fila);if isnull(getitemnumber(fila,'item')) then
	setitemstatus(fila,0,primary!,NewModified!)
	setitem(fila,'coddoc',i_cdoc)
	setitem(fila,'clugar',dw_deta.getitemstring(1,'clugar'))
	setitem(fila,'num_glosa',dw_deta.getitemnumber(1,'num_glosa'))
	setitem(fila,'item',tab_1.tp_1.dw_facts.getitemnumber(tab_1.tp_1.dw_facts.getrow(),'item'))
	if isnull(tab_1.tp_2.dw_procs.getitemnumber(tab_1.tp_2.dw_procs.getrow(),'subitem')) then 
		tab_1.tp_2.dw_procs.event itemchanged(tab_1.tp_2.dw_procs.getrow(),tab_1.tp_2.dw_procs.object.valor_objecion,'1')
	end if
	setitem(fila,'subitem',tab_1.tp_2.dw_procs.getitemnumber(tab_1.tp_2.dw_procs.getrow(),'subitem'))
	setitem(fila,'nfact',getitemnumber(fila,'cnf'))
	setitem(fila,'clugar_fact',getitemstring(fila,'clugar_sfac'))
	setitem(fila,'nitem_fact',getitemnumber(fila,'nitem'))
	setitem(fila,'ndeta_fact',getitemnumber(fila,'ndeta_sfac'))
	setitem(fila,'ndeta',long(describe("Evaluate('max(ndeta)',0)"))+1)
	setitem(fila,'estado',tab_1.tp_1.dw_facts.getitemString(tab_1.tp_1.dw_facts.getrow(),'estado'))
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
getchild('cod_objecion',idw_obj3)
idw_obj3.settransobject(sqlca)
idw_obj3.retrieve('%','%')
end event

event clicked;if row>0 and row<>getrow() then setrow(row)
end event

event rowfocuschanged;dw_obj_sitem.reset()
if getrow() < 1 then return
if isNull(getitemnumber(getrow(),'ndeta_sfac')) then Return 0
dw_obj_sitem.insertrow(1)
dw_obj_sitem.setitem(1,'detalle',getitemstring(getrow(),'detalle'))
dw_item_glos.setfilter("nfact="+string(getitemnumber(getrow(),'cnf'))+" and clugar_fact='"+getitemstring(getrow(),'clugar_sfac')+"' and nitem_fact="+string(getitemnumber(getrow(),'nitem')) +" and ndeta_fact="+string(getitemnumber(getrow(),'ndeta_sfac')))
dw_item_glos.filter()
dw_item_glos.Event porcentajes()

end event

event itemchanged;choose case dwo.name
	case 'diferencia'
		if acceptText() = -1 then Return -1
		dw_deta.SetItem(1,'diferencia',calc_diff())
		i_cambio = TRUE
end choose

////choose case getitemstatus(row,0,primary!)
////	case NotModified!	//NotModified	0	The information in the row or column is unchanged from what was retrieved.
//		if isnull(getitemnumber(row,'item')) then
//			setitemstatus(row,0,primary!,NewModified!)
//			setitem(row,'coddoc',i_cdoc)
//			setitem(row,'clugar',dw_deta.getitemstring(1,'clugar'))
//			setitem(row,'num_glosa',dw_deta.getitemnumber(1,'num_glosa'))
//			setitem(row,'item',tab_1.tp_1.dw_facts.getitemnumber(tab_1.tp_1.dw_facts.getrow(),'item'))
//			if isnull(tab_1.tp_2.dw_procs.getitemnumber(tab_1.tp_2.dw_procs.getrow(),'subitem')) then 
//				tab_1.tp_2.dw_procs.event itemchanged(tab_1.tp_2.dw_procs.getrow(),tab_1.tp_2.dw_procs.object.valor_objecion,'1')
//			end if
//			setitem(row,'subitem',tab_1.tp_2.dw_procs.getitemnumber(tab_1.tp_2.dw_procs.getrow(),'subitem'))
//			setitem(row,'nfact',getitemnumber(row,'cnf'))
//			setitem(row,'clugar_fact',getitemstring(row,'clugar_sfac'))
//			setitem(row,'nitem_fact',getitemnumber(row,'nitem'))
//			setitem(row,'ndeta_fact',getitemnumber(row,'ndeta_sfac'))
//			setitem(row,'ndeta',long(describe("Evaluate('max(ndeta)',0)"))+1)
//		end if
////end choose
//choose case dwo.name
//	case 'cod_objecion'
//		setitem(row,'pertinente',idw_obj3.getitemstring(idw_obj3.getrow(),'pertinente'))
//		//setitem(row,'respuesta_hasta',datetime(relativedate(date(tab_1.tp_1.dw_facts.getitemdatetime(tab_1.tp_1.dw_facts.getrow(),'fecha_tramite')),idw_obj3.getitemnumber(idw_obj3.getrow(),'tiempo_resp'))))
//	case 'valor_objecion'
//		setitem(row,'porcen',round(dec(data)/getitemnumber(row,'vemp')*100,i_dec_gral_car))
//		post event p_itemchanged()
//	case 'porcen'
//		setitem(row,'valor_objecion',round(getitemnumber(row,'vemp')*dec(data)/100,i_dec_gral_car))
//		post event itemchanged(row,object.valor_objecion,string(round(getitemnumber(row,'vemp')*dec(data)/100,i_dec_gral_car)))
//end choose
//i_cambio=true
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if

end event

event buttonclicked;long item
item=getitemnumber(row,'item')
if (not isnull(item)) and (getitemstatus(row,0,primary!)=NotModified! or getitemstatus(row,0,primary!)=dataModified!) then
	if messagebox('Atención','Está seguro que desea borrar el registro?. El cambio se guardará automáticamente.',question!,yesno!,1)=2 then return -1
end if
if event borra_boton(row)<>-1 then
	commit;
end if
event p_itemchanged()
i_cambio=true
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.dw_cab=tab_1.tp_1.dw_facts
st_dw.color_fondo=string(rgb(255,255,255))
st_dw.solobuscar = TRUE
openwithparm(w_funcion_dw,st_dw)

end event

type st_2 from statictext within w_maneja_glosas
integer x = 4421
integer y = 84
integer width = 503
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de la Objeción:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_maneja_glosas
integer x = 32
integer y = 28
integer width = 526
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Objeciones:"
boolean focusrectangle = false
end type

type dw_histo from datawindow within w_maneja_glosas
event p_borra_nuevo ( long p_estaba,  long p_va )
integer x = 23
integer y = 116
integer width = 4165
integer height = 660
integer taborder = 10
string title = "none"
string dataobject = "dw_obje_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_borra_nuevo(long p_estaba, long p_va);deleterow(p_estaba)
event rowfocuschanged(getrow())

end event

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event rowfocuschanged;AcceptText (dw_histo ) 
tab_1.tp_1.dw_facts.reset()
tab_1.tp_1.dw_fac_glos.reset()
idw_facts.reset()
idw_facts2.reset()
long nulo
setnull(nulo)
tab_1.tp_2.dw_dfacts.setitem(1,1,nulo)
tab_1.tp_3.dw_dfacts2.setitem(1,1,nulo)
tab_1.tp_3.dw_sitem.reset()
tab_1.tp_2.dw_procs.reset()
tab_1.tp_3.dw_item_glos.Reset()
tab_1.tp_2.dw_proc_glos.reset()
if getrow()<1 then return
if dw_histo.getitemstring(getrow(),'estado')='1' then pb_res.enabled=true else pb_res.enabled=false
dw_deta.retrieve(i_cdoc,getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'))
idw_facts.retrieve(i_cdoc,getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'))
idw_facts2.retrieve(i_cdoc,getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'))
tab_1.tp_1.dw_facts.retrieve(i_cdoc,getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'))
//
tab_1.tp_2.dw_procs.retrieve(i_cdoc,getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'))
tab_1.tp_1.dw_fac_glos.retrieve(i_cdoc,getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'))
tab_1.tp_3.dw_item_glos.retrieve(i_cdoc,getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'))
tab_1.tp_2.dw_proc_glos.retrieve(i_cdoc,getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'))
//
tab_1.tp_3.dw_sitem.retrieve(i_cdoc,getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'num_glosa'))

end event

event rowfocuschanging;choose case f_pregunta()
	case 1
		if grabar()=-1 then return 1
	case 2
		pb_new.enabled=true
		if describe('evaluate ("isrownew()",'+string(currentrow)+')')='true' and i_cambio then post event p_borra_nuevo(currentrow,newrow)
		i_cambio=false
		i_nuevo=false
	case 3
		return 1
end choose
return 0
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type dw_deta from datawindow within w_maneja_glosas
event type integer set_diff ( )
integer x = 4402
integer y = 132
integer width = 1650
integer height = 648
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_obje_cab_det"
boolean border = false
boolean livescroll = true
end type

event type integer set_diff();double difer, tdifer, ng
string cd, cl
if rowCount() <> 1 then Return -1
cd = GetItemString(1,'coddoc')
cl = GetItemString(1,'clugar')
ng = GetItemNumber(1,'num_glosa')
select sum(diferencia) into :difer from car_glosa_cpo
where coddoc=:cd and clugar=:cl and num_glosa=:ng;
if isNull(difer) then difer = 0
tdifer = difer

select sum(diferencia) into :difer from car_glosa_subcpo 
where coddoc=:cd and clugar=:cl and num_glosa=:ng;
if isNull(difer) then difer = 0
tdifer = tdifer + difer

select sum(diferencia) into :difer from car_glosa_subfact
where coddoc=:cd and clugar=:cl and num_glosa=:ng;
if isNull(difer) then difer = 0
tdifer = tdifer + difer

SetItem(1,'diferencia',tdifer)
return 0

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

event itemchanged;accepttext()
choose case dwo.name
	case 'codemp','codemp_1'
		string actual
		actual=dw_deta.getitemstring(1,getcolumnname())
		if tab_1.tp_1.dw_facts.rowcount()>0 then
			settext(actual)
			messagebox('Atención','No puede cambiar la empresa porque ya relacionó Facturas')
			return 2
		end if
	case 'fecha'
		if f_docu_cartera(datetime(data))=-1 then	
			dw_deta.setitem(1,"fecha",datetime(today()))
			dw_deta.setitem(1,"anyo",year(today()))
			return 1
		end if
		date l_fecha1,l_fecha2
		dw_deta.setitem(1,"anyo",year(date(data)))
		l_fecha1=date("1/1/"+em_anyo.text)
		l_fecha2=date("31/12/"+em_anyo.text)			
		if date(data)<l_fecha1 and date(data)<l_fecha2 then
			dw_deta.setitem(1,"fecha",datetime(today()))
			dw_deta.setitem(1,"anyo",year(today()))
			messagebox('Error','La fecha no corresponde con el año seleccionado')
			return 1
		end if
end choose
i_cambio=true
end event

event retrieveend;string total
if RowCount > 0 then
	total = GetItemString(1,'total')
	if total = '1' then
		i_total = TRUE
	else
		i_total = FALSE
	end if
	if i_total then
		tab_1.tp_1.dw_facts.DataObject = 'dw_glos_cpo'
		tab_1.tp_2.dw_procs.DataObject = 'dw_factcpo_xa_glos2'
		tab_1.tp_3.dw_sitem.DataObject = 'dw_car_glos_subcpo2'
	else
		tab_1.tp_1.dw_facts.DataObject = 'dw_glos_cpo_emp'
		tab_1.tp_2.dw_procs.DataObject = 'dw_factcpo_xa_glos2_emp'
		tab_1.tp_3.dw_sitem.DataObject = 'dw_car_glos_subcpo2_emp'
	end if
	tab_1.tp_1.dw_facts.SetTransObject(SQLCA)
	tab_1.tp_2.dw_procs.SetTransObject(SQLCA)
	tab_1.tp_3.dw_sitem.SetTransObject(SQLCA)
	tab_1.tp_1.dw_facts.TriggerEvent(constructor!)
	tab_1.tp_2.dw_procs.TriggerEvent(constructor!)
	tab_1.tp_3.dw_sitem.TriggerEvent(constructor!)
end if

if rowCount() <> 1 then Return 
Event set_diff()

end event

type st_12 from statictext within w_maneja_glosas
integer x = 635
integer y = 36
integer width = 137
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
boolean focusrectangle = false
end type

