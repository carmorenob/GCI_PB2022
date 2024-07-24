$PBExportHeader$w_respu_glosas.srw
forward
global type w_respu_glosas from window
end type
type pb_borra_rta from picturebutton within w_respu_glosas
end type
type pb_rabrir from picturebutton within w_respu_glosas
end type
type pb_2 from picturebutton within w_respu_glosas
end type
type st_1 from statictext within w_respu_glosas
end type
type pb_1 from picturebutton within w_respu_glosas
end type
type cb_1 from commandbutton within w_respu_glosas
end type
type tab_3 from tab within w_respu_glosas
end type
type tabpage_5 from userobject within tab_3
end type
type tabpage_5 from userobject within tab_3
end type
type tabpage_6 from userobject within tab_3
end type
type tabpage_6 from userobject within tab_3
end type
type tab_3 from tab within w_respu_glosas
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type
type pb_12 from picturebutton within w_respu_glosas
end type
type pb_11 from picturebutton within w_respu_glosas
end type
type pb_10 from picturebutton within w_respu_glosas
end type
type pb_porcen from picturebutton within w_respu_glosas
end type
type pb_save from picturebutton within w_respu_glosas
end type
type rb_2 from radiobutton within w_respu_glosas
end type
type rb_1 from radiobutton within w_respu_glosas
end type
type dw_histo from datawindow within w_respu_glosas
end type
type gb_1 from groupbox within w_respu_glosas
end type
type cb_2 from commandbutton within w_respu_glosas
end type
type rte_1 from richtextedit within w_respu_glosas
end type
type mle_resp from multilineedit within w_respu_glosas
end type
type tab_1 from tab within w_respu_glosas
end type
type tp_1 from userobject within tab_1
end type
type st_3 from statictext within tp_1
end type
type pb_7 from picturebutton within tp_1
end type
type pb_cerrar from picturebutton within tp_1
end type
type dw_fac_glos from datawindow within tp_1
end type
type dw_facts from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
st_3 st_3
pb_7 pb_7
pb_cerrar pb_cerrar
dw_fac_glos dw_fac_glos
dw_facts dw_facts
end type
type tp_2 from userobject within tab_1
end type
type pb_8 from picturebutton within tp_2
end type
type st_4 from statictext within tp_2
end type
type dw_procs from datawindow within tp_2
end type
type dw_proc_glos from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_8 pb_8
st_4 st_4
dw_procs dw_procs
dw_proc_glos dw_proc_glos
end type
type tp_3 from userobject within tab_1
end type
type pb_9 from picturebutton within tp_3
end type
type st_7 from statictext within tp_3
end type
type dw_sitem from datawindow within tp_3
end type
type dw_item_glos from datawindow within tp_3
end type
type tp_3 from userobject within tab_1
pb_9 pb_9
st_7 st_7
dw_sitem dw_sitem
dw_item_glos dw_item_glos
end type
type tab_1 from tab within w_respu_glosas
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
type mle_nots from multilineedit within w_respu_glosas
end type
type dw_objs from datawindow within w_respu_glosas
end type
type dw_res from datawindow within w_respu_glosas
end type
end forward

global type w_respu_glosas from window
integer width = 4480
integer height = 2428
boolean titlebar = true
string title = "Cartera - Respuesta a Glosas"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_rta.ico"
pb_borra_rta pb_borra_rta
pb_rabrir pb_rabrir
pb_2 pb_2
st_1 st_1
pb_1 pb_1
cb_1 cb_1
tab_3 tab_3
pb_12 pb_12
pb_11 pb_11
pb_10 pb_10
pb_porcen pb_porcen
pb_save pb_save
rb_2 rb_2
rb_1 rb_1
dw_histo dw_histo
gb_1 gb_1
cb_2 cb_2
rte_1 rte_1
mle_resp mle_resp
tab_1 tab_1
mle_nots mle_nots
dw_objs dw_objs
dw_res dw_res
end type
global w_respu_glosas w_respu_glosas

type variables
datawindowchild idw_obj, idw_obj2, idw_obj3, idw_resp,idw_ur
boolean i_cambio, i_down, i_dw_has_focus
long f_drag, f_drop, f_obj
string i_cod_resp, i_resp, i_notas, i_usu

end variables

forward prototypes
public function integer f_pregunta ()
public function integer grabar ()
public function integer f_coloca_item (datawindow p_dw)
public function double f_sum_obj_fact (double nfact, string lugar, string tipo)
public function double f_sum_obj_proc (double nfact, string lugar, string tipo, integer item)
public function double f_sum_obj_item (double nfact, string lugar, string tipo, long item, long ndeta)
end prototypes

public function integer f_pregunta ();
if (not i_cambio) then return 2
return messagebox("Atención, realizó cambios",'Desea guardar los cambios?',question!,yesnocancel!,3)
end function

public function integer grabar ();if dw_res.accepttext()=-1 then return -1
if not i_cambio then Return 1
if f_coloca_item(dw_res)=-1 then return -1
if dw_res.update(true,false)=-1 then return -1
if tab_1.tp_1.dw_facts.update(true,false)=-1 then return -1
if tab_1.tp_2.dw_procs.update(true,false)=-1 then return -1
if tab_1.tp_3.dw_sitem.update(true,false)=-1 then return -1
if tab_1.tp_1.dw_fac_glos.update(true,false)=-1 then return -1
if tab_1.tp_2.dw_proc_glos.update(true,false)=-1 then return -1
if tab_1.tp_3.dw_item_glos.update(true,false)=-1 then return -1
commit;
dw_objs.event rowfocuschanged(dw_objs.GetRow())
dw_res.resetupdate()
tab_1.tp_1.dw_facts.Resetupdate()
tab_1.tp_2.dw_procs.Resetupdate()
tab_1.tp_3.dw_sitem.Resetupdate()
tab_1.tp_1.dw_fac_glos.Resetupdate()
tab_1.tp_2.dw_proc_glos.Resetupdate()
tab_1.tp_3.dw_item_glos.Resetupdate()
i_cambio = false
Return 1

end function

public function integer f_coloca_item (datawindow p_dw);long j,cual
string err
p_dw.SetRedraw(FALSE)
p_dw.setfilter('')
p_dw.filter()
for j=1 to p_dw.rowcount()
	if isNull(p_dw.GetItemNumber(j,'t_aceptado')) then
		MessageBox('Atención','Debe proporcionar un código de respuesta')
		dw_objs.Event rowfocuschanged(f_obj)
		p_dw.SetRedraw(TRUE)
		Return -1
	end if
	if isNull(p_dw.GetItemString(j,'cod_respuesta')) then
		MessageBox('Atención','Debe proporcionar un código de respuesta')
		dw_objs.Event rowfocuschanged(f_obj)
		p_dw.SetRedraw(TRUE)
		Return -1
	end if
	if isNull(p_dw.GetItemString(j,'usu_causante')) then
		MessageBox('Atención','Debe proporcionar un código de respuesta')
		dw_objs.Event rowfocuschanged(f_obj)
		p_dw.SetRedraw(TRUE)
		Return -1
	end if
next
select max(num_respu) into :cual from car_glosa_respu;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	Rollback;
	messagebox('Error leyendo car_glosa_respu',err)
	dw_objs.Event rowfocuschanged(f_obj)
	p_dw.SetRedraw(TRUE)
	Return -1
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
p_dw.SetRedraw(TRUE)
Return 1

end function

public function double f_sum_obj_fact (double nfact, string lugar, string tipo);long i
double total, valor
string filtro

if tab_1.visible = TRUE then
	tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
end if

filtro = tab_1.tp_3.dw_item_glos.describe("Datawindow.Table.Filter")
tab_1.tp_3.dw_item_glos.SetFilter("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"'")
tab_1.tp_3.dw_item_glos.Filter()
for i = 1 to tab_1.tp_3.dw_item_glos.RowCount()
	valor = tab_1.tp_3.dw_item_glos.GetItemNumber(i,'valor_aceptado')
	if isNull(valor) then valor = 0
	total = total + valor
next

if not (filtro = '?' or filtro = '!') then 
	tab_1.tp_3.dw_sitem.SetFilter(filtro)
	tab_1.tp_3.dw_sitem.Filter()
end if

filtro = tab_1.tp_2.dw_proc_glos.describe("Datawindow.Table.Filter")
tab_1.tp_2.dw_proc_glos.SetFilter("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"'")
tab_1.tp_2.dw_proc_glos.Filter()

for i = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
	valor = tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'valor_aceptado')
	if isNull(valor) then valor = 0
	total = total + valor
next
tab_1.tp_2.dw_proc_glos.SetFilter(filtro)
tab_1.tp_2.dw_proc_glos.Filter()
//tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)

filtro = tab_1.tp_1.dw_fac_glos.describe("Datawindow.Table.Filter")
tab_1.tp_1.dw_fac_glos.SetFilter("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"'")
tab_1.tp_1.dw_fac_glos.Filter()

for i = 1 to tab_1.tp_1.dw_fac_glos.RowCount()
	valor = tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'valor_aceptado')
	if isNull(valor) then valor = 0
	total = total + valor
next
tab_1.tp_1.dw_fac_glos.SetFilter(filtro)
tab_1.tp_1.dw_fac_glos.Filter()
//tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)

if tab_1.visible = TRUE then
	tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
end if

Return round(total,i_dec_gral_car)

end function

public function double f_sum_obj_proc (double nfact, string lugar, string tipo, integer item);long i, f, fila, ff
decimal total, vbase, valor
string filtro
if tab_1.visible then
	tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
	tab_1.tp_2.dw_procs.SetRedraw(FALSE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
end if

filtro = tab_1.tp_3.dw_item_glos.describe("Datawindow.Table.Filter")
fila = tab_1.tp_2.dw_procs.GetRow()
tab_1.tp_3.dw_item_glos.SetFilter("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='" +tipo+"' and nitem_fact="+string(item))
tab_1.tp_3.dw_item_glos.Filter()
for i = 1 to tab_1.tp_3.dw_item_glos.RowCount()
//	if tab_1.tp_3.dw_item_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_3.dw_item_glos.GetItemString(i,'clugar_fact') = lugar and tab_1.tp_3.dw_item_glos.GetItemNumber(i,'nitem_fact') = item then
		valor = tab_1.tp_3.dw_item_glos.GetItemNumber(i,'valor_aceptado')
		if isNull(valor) then valor = 0
		total = total + valor
//	end if
next
if not(filtro='?' or filtro ='!') then
	tab_1.tp_3.dw_item_glos.SetFilter(filtro)
	tab_1.tp_3.dw_item_glos.Filter()
end if

filtro = tab_1.tp_2.dw_proc_glos.describe("Datawindow.Table.Filter")
tab_1.tp_2.dw_proc_glos.SetFilter("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='" +tipo+"' and nitem_fact=" +string(item) )
tab_1.tp_2.dw_proc_glos.Filter()
for i = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
//	if tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_2.dw_proc_glos.GetItemString(i,'clugar_fact') = lugar and tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'nitem_fact') = item  then
		valor = tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'valor_aceptado')
		if isNull(valor) then valor = 0
		total = total + valor
//	end if
next
tab_1.tp_2.dw_proc_glos.SetFilter(filtro)
tab_1.tp_2.dw_proc_glos.Filter()

// Base para aplicar porcentajes desde objeciones de facturas
filtro = tab_1.tp_2.dw_procs.describe("Datawindow.Table.Filter")
tab_1.tp_2.dw_procs.SetFilter("")
tab_1.tp_2.dw_procs.Filter()
ff = tab_1.tp_1.dw_facts.Find("nfact="+string(nfact),1,tab_1.tp_1.dw_facts.RowCount())
f = tab_1.tp_2.dw_procs.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='" +tipo+"' and nitem_fact="+string(item),1,tab_1.tp_2.dw_procs.RowCount())
if f > 0 then
	if tab_1.tp_1.dw_facts.GetItemNumber(ff,'valor_objecion')<>0 then
		vbase = tab_1.tp_2.dw_procs.GetItemNumber(f,'valor_objecion') / tab_1.tp_1.dw_facts.GetItemNumber(ff,'valor_objecion')
	else
		vbase=0
	end if
//	vbase = tab_1.tp_2.dw_procs.GetItemNumber(f,'vemp') / tab_1.tp_1.dw_facts.GetItemNumber(ff,'vtemp')
end if
tab_1.tp_2.dw_procs.SetFilter(filtro)
tab_1.tp_2.dw_procs.Filter()
tab_1.tp_2.dw_procs.ScrolltoRow(fila)

filtro = tab_1.tp_1.dw_fac_glos.describe("Datawindow.Table.Filter")
tab_1.tp_1.dw_fac_glos.SetFilter("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='" +tipo+"'")
tab_1.tp_1.dw_fac_glos.Filter()
for i = 1 to tab_1.tp_1.dw_fac_glos.RowCount()
//	if tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_1.dw_fac_glos.GetItemString(i,'clugar_fact') = lugar then
		valor = tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'valor_aceptado') * vbase
		if isNull(valor) then valor = 0
		total = total + valor
//	end if
next
tab_1.tp_1.dw_fac_glos.SetFilter(filtro)
tab_1.tp_1.dw_fac_glos.Filter()

if tab_1.visible then
	tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
	tab_1.tp_2.dw_procs.SetRedraw(TRUE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
end if

Return round(total,i_dec_gral_car)

end function

public function double f_sum_obj_item (double nfact, string lugar, string tipo, long item, long ndeta);long i, f, fila, fp, filap, ff
decimal total, vbasef, vbasep, valor
string filtro, filtro_p

if tab_1.visible = TRUE then
	tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
	tab_1.tp_2.dw_procs.SetRedraw(FALSE)
	tab_1.tp_3.dw_sitem.SetRedraw(FALSE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
end if

filtro = tab_1.tp_3.dw_item_glos.describe("Datawindow.Table.Filter")
fila = tab_1.tp_3.dw_sitem.GetRow()
filap = tab_1.tp_2.dw_procs.GetRow()
tab_1.tp_3.dw_item_glos.SetFilter("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"' and nitem_fact="+string(item)+" and ndeta_fact="+string(ndeta))
tab_1.tp_3.dw_item_glos.Filter()
for i = 1 to tab_1.tp_3.dw_item_glos.RowCount()
//	if tab_1.tp_3.dw_item_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_3.dw_item_glos.GetItemString(i,'clugar_fact') = lugar and tab_1.tp_3.dw_item_glos.GetItemNumber(i,'nitem_fact') = item and tab_1.tp_3.dw_item_glos.GetItemNumber(i,'ndeta_fact') = ndeta then
		valor = tab_1.tp_3.dw_item_glos.GetItemNumber(i,'valor_aceptado')
		if isNull(valor) then valor = 0
		total = total + valor
//	end if
next
if not(filtro='?' or filtro ='!') then
	tab_1.tp_3.dw_item_glos.SetFilter(filtro)
	tab_1.tp_3.dw_item_glos.Filter()
end if

// Base para aplicar porcentajes desde objeciones de procedimientos y facturas
filtro_p = tab_1.tp_2.dw_procs.describe("Datawindow.Table.Filter")
filtro = tab_1.tp_3.dw_sitem.describe("Datawindow.Table.Filter")
tab_1.tp_2.dw_procs.SetFilter("")
tab_1.tp_2.dw_procs.Filter()
tab_1.tp_3.dw_sitem.SetFilter("")
tab_1.tp_3.dw_sitem.Filter()
ff = tab_1.tp_1.dw_facts.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"'",1,tab_1.tp_1.dw_facts.RowCount())
fp = tab_1.tp_2.dw_procs.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"' and nitem_fact="+string(item),1,tab_1.tp_2.dw_procs.RowCount())
f = tab_1.tp_3.dw_sitem.Find("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"' and nitem_fact="+string(item) +" and ndeta_fact="+string(ndeta),1,tab_1.tp_3.dw_sitem.RowCount())
if f > 0 then
	if  tab_1.tp_2.dw_procs.GetItemNumber(fp,'valor_objecion')<>0 then 
		vbasep = tab_1.tp_3.dw_sitem.GetItemNumber(f,'valor_objecion') / tab_1.tp_2.dw_procs.GetItemNumber(fp,'valor_objecion')
	else
		vbasep = 0
	end if
	if tab_1.tp_1.dw_facts.GetItemNumber(ff,'valor_objecion')<>0 then 	
		vbasef = tab_1.tp_3.dw_sitem.GetItemNumber(f,'valor_objecion') / tab_1.tp_1.dw_facts.GetItemNumber(ff,'valor_objecion')
	else
		vbasef = 0
	end if
//	vbasep = tab_1.tp_3.dw_sitem.GetItemNumber(f,'vemp') / tab_1.tp_2.dw_procs.GetItemNumber(fp,'vemp')
//	vbasef = tab_1.tp_3.dw_sitem.GetItemNumber(f,'vemp') / tab_1.tp_1.dw_facts.GetItemNumber(ff,'vtemp')
end if
tab_1.tp_3.dw_sitem.SetFilter(filtro)
tab_1.tp_3.dw_sitem.Filter()
tab_1.tp_3.dw_sitem.ScrolltoRow(fila)
tab_1.tp_2.dw_procs.SetFilter(filtro_p)
tab_1.tp_2.dw_procs.Filter()
tab_1.tp_2.dw_procs.ScrolltoRow(filap)

filtro = tab_1.tp_2.dw_proc_glos.describe("Datawindow.Table.Filter")
tab_1.tp_2.dw_proc_glos.SetFilter("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"' and nitem_fact="+string(item) )
tab_1.tp_2.dw_proc_glos.Filter()
for i = 1 to tab_1.tp_2.dw_proc_glos.RowCount()
//	if tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_2.dw_proc_glos.GetItemString(i,'clugar_fact') = lugar and tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'nitem_fact') = item  then
		valor = tab_1.tp_2.dw_proc_glos.GetItemNumber(i,'valor_aceptado') * vbasep
		if isNull(valor) then valor = 0
		total = total + valor
//	end if
next
tab_1.tp_2.dw_proc_glos.SetFilter(filtro)
tab_1.tp_2.dw_proc_glos.Filter()

filtro = tab_1.tp_1.dw_fac_glos.describe("Datawindow.Table.Filter")
tab_1.tp_1.dw_fac_glos.SetFilter("nfact="+string(nfact)+" and clugar_fact='"+lugar+"' and tipo_fact='"+tipo+"'")
tab_1.tp_1.dw_fac_glos.Filter()

for i = 1 to tab_1.tp_1.dw_fac_glos.RowCount()
	if tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'nfact') = nfact and tab_1.tp_1.dw_fac_glos.GetItemString(i,'clugar_fact') = lugar  and tab_1.tp_1.dw_fac_glos.GetItemString(i,'tipo_fact') = tipo then
		valor = tab_1.tp_1.dw_fac_glos.GetItemNumber(i,'valor_aceptado') * vbasef
		if isNull(valor) then valor = 0
		total = total + valor
	end if
next
tab_1.tp_1.dw_fac_glos.SetFilter(filtro)
tab_1.tp_1.dw_fac_glos.Filter()

if tab_1.visible = TRUE then
	tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
	tab_1.tp_2.dw_procs.SetRedraw(TRUE)
	tab_1.tp_3.dw_sitem.SetRedraw(TRUE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
end if

Return round(total,i_dec_gral_car)

end function

on w_respu_glosas.create
this.pb_borra_rta=create pb_borra_rta
this.pb_rabrir=create pb_rabrir
this.pb_2=create pb_2
this.st_1=create st_1
this.pb_1=create pb_1
this.cb_1=create cb_1
this.tab_3=create tab_3
this.pb_12=create pb_12
this.pb_11=create pb_11
this.pb_10=create pb_10
this.pb_porcen=create pb_porcen
this.pb_save=create pb_save
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_histo=create dw_histo
this.gb_1=create gb_1
this.cb_2=create cb_2
this.rte_1=create rte_1
this.mle_resp=create mle_resp
this.tab_1=create tab_1
this.mle_nots=create mle_nots
this.dw_objs=create dw_objs
this.dw_res=create dw_res
this.Control[]={this.pb_borra_rta,&
this.pb_rabrir,&
this.pb_2,&
this.st_1,&
this.pb_1,&
this.cb_1,&
this.tab_3,&
this.pb_12,&
this.pb_11,&
this.pb_10,&
this.pb_porcen,&
this.pb_save,&
this.rb_2,&
this.rb_1,&
this.dw_histo,&
this.gb_1,&
this.cb_2,&
this.rte_1,&
this.mle_resp,&
this.tab_1,&
this.mle_nots,&
this.dw_objs,&
this.dw_res}
end on

on w_respu_glosas.destroy
destroy(this.pb_borra_rta)
destroy(this.pb_rabrir)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.cb_1)
destroy(this.tab_3)
destroy(this.pb_12)
destroy(this.pb_11)
destroy(this.pb_10)
destroy(this.pb_porcen)
destroy(this.pb_save)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_histo)
destroy(this.gb_1)
destroy(this.cb_2)
destroy(this.rte_1)
destroy(this.mle_resp)
destroy(this.tab_1)
destroy(this.mle_nots)
destroy(this.dw_objs)
destroy(this.dw_res)
end on

event open;tab_1.tp_1.dw_facts.SetRedraw(FALSE)
tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
tab_1.tp_2.dw_procs.SetRedraw(FALSE)
tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
tab_1.tp_3.dw_sitem.SetRedraw(FALSE)
tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
dw_histo.retrieve(usuario)
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

event resize;dw_objs.resize((newwidth - 50) , (newheight * 0.45))
dw_res.y=dw_objs.y+dw_objs.height+40
dw_res.resize((newwidth * 0.50) , (newheight * 0.20))

tab_1.resize((newwidth - 50) , (newheight * 0.45))
tab_1.tp_1.dw_facts.resize((newwidth * 48) , (newheight * 0.40))
tab_1.tp_1.dw_fac_glos.x=tab_1.tp_1.dw_facts.x+tab_1.tp_1.dw_facts.width+50
tab_1.tp_1.dw_fac_glos.resize((newwidth * 48) , (newheight * 0.40))

pb_11.x=dw_res.x+dw_res.width +30
pb_12.x=dw_res.x+dw_res.width +30
pb_1.x=dw_res.x+dw_res.width +30
pb_2.x=dw_res.x+dw_res.width +30
tab_3.x=dw_res.x+dw_res.width +230

tab_3.y=dw_objs.y+dw_objs.height +20
pb_11.y=dw_objs.y+dw_objs.height +50
pb_12.y=pb_11.y+pb_11.height +10
pb_1.y=pb_12.y+pb_12.height +10
pb_2.y=pb_1.y+pb_1.height +10

mle_resp.x=dw_res.x+dw_res.width +230
mle_resp.resize((newwidth * 0.45) , (newheight * 0.18))
mle_nots.x=dw_res.x+dw_res.width +230
mle_nots.resize((newwidth * 0.45) , (newheight * 0.18))
end event

type pb_borra_rta from picturebutton within w_respu_glosas
string tag = "Elimina respuesta total"
integer x = 3977
integer y = 52
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Elimina respuesta total"
end type

event clicked;if dw_objs.rowcount()=0 then return
long fila
string clug, err, cdoc
double nglosa, fact
long f, conteo, item

if f_permiso_boton(this,'RPG')=0 then return -1
if dw_histo.GetItemstring(dw_histo.GetRow(),'estado') = '3' then
	MessageBox('Atención','La objección ya fue reenviada.  No puede realizar el procesos')
	Return -1
end if
if messagebox("Atención","Eliminara Todas las respuestas cargadas y no podra recuperarlas.  Esta seguro relizar esta actividad?",question!,yesno!,2)=2 then return -1
fila=dw_histo.getrow()
cdoc = dw_histo.getitemstring(fila,'coddoc')
clug = dw_histo.getitemstring(fila,'clugar')
nglosa = dw_histo.getitemnumber(fila,'num_glosa')

delete from car_glosa_respu where (((car_glosa_respu.coddoc_glosa_gral)=:cdoc) and ((car_glosa_respu.clugar_glosa_gral)=:clug) and ((car_glosa_respu.num_glosa_gral)=:nglosa));
if sqlca.sqlcode=-1 then
	err= SQLCA.SQLErrText
	rollback;
	MessageBox("Error eliminado Rta GRAL", err)
	Return -1
end if
delete from car_glosa_respu  where (((car_glosa_respu.coddoc_glosa_det)=:cdoc) and ((car_glosa_respu.clugar_glosa_det)=:clug) and ((car_glosa_respu.num_glosa_det)=:nglosa));
if sqlca.sqlcode=-1 then
	err = SQLCA.SQLErrText
	rollback;
	MessageBox("Error eliminado Rta DET", err)
	Return -1
end if
delete from car_glosa_respu  where (((car_glosa_respu.coddoc_glosa_sub)=:cdoc) and ((car_glosa_respu.clugar_glosa_sub)=:clug) and ((car_glosa_respu.num_glosa_sub)=:nglosa));
if sqlca.sqlcode=-1 then
	err = SQLCA.SQLErrText
	rollback;
	MessageBox("Error eliminado Rta SUB", err)
	Return -1
end if

update car_glosa_cpo_det set estado = 'C' , valor_aceptado=0
where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and usu_responde=:usuario ;
if sqlca.sqlcode=-1 then
	err = sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando estado car_glosa_cpo_det',err)
	Return -1
end if
update car_glosa_subcpo_det set estado = 'C' , valor_aceptado=0
where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and usu_responde=:usuario;
if sqlca.sqlcode=-1 then
	err = sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando estado car_glosa_subcpo_det',err)
	Return -1
end if
update car_glosa_subfact_det set estado = 'C' , valor_aceptado=0
where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and usu_responde=:usuario;
if sqlca.sqlcode=-1 then
	err = sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando estado car_glosa_subfact_det',err)
	Return -1
end if
	
update car_glosa_cpo set estado = 'C' 
where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa ;
if sqlca.sqlcode=-1 then
	err = sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizand estado car_glosa_cpo a P.',err)
	Return -1
end if
	
dw_objs.GroupCalc()
dw_histo.setitem(dw_histo.getrow(),'estado','1')
if dw_histo.update() = -1 then Return -1
commit;
dw_histo.event rowfocuschanged(dw_histo.GetRow())
Return 0

end event

type pb_rabrir from picturebutton within w_respu_glosas
integer x = 3822
integer y = 428
integer width = 142
integer height = 124
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "abrir2.gif"
string disabledname = "d_abrir2.gif"
alignment htextalign = left!
string powertiptext = "Abre Respuestas seleccs."
end type

event clicked;if dw_objs.rowcount()=0 then return
long fila
string clug, err, cdoc
double nglosa, fact
long f, conteo, item

if dw_histo.GetItemstring(dw_histo.GetRow(),'estado') = '3' then
	MessageBox('Atención','La objección ya fue reenviada.  No puede realizar el procesos')
	Return -1
end if
if f_permiso_boton(this,'RPG')=0 then return -1
fila = dw_objs.Find("sel_fac=1",1,dw_objs.RowCount())
do while fila >0
	cdoc = dw_objs.getitemstring(fila,'coddoc')
	clug = dw_objs.getitemstring(fila,'clugar')
	nglosa = dw_objs.getitemnumber(fila,'num_glosa')
	item = dw_objs.GetItemNumber(fila,'item')
	update car_glosa_cpo_det set estado = 'R' 
	where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item and estado='P' and usu_responde=:usuario ;
	if sqlca.sqlcode=-1 then
		err = sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando estado car_glosa_cpo_det',err)
		Return -1
	end if
	update car_glosa_subcpo_det set estado = 'R' 
	where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item and estado='P' and usu_responde=:usuario;
	if sqlca.sqlcode=-1 then
		err = sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando estado car_glosa_subcpo_det',err)
		Return -1
	end if

	update car_glosa_subfact_det set estado = 'R' 
	where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item and estado='P' and usu_responde=:usuario;
	if sqlca.sqlcode=-1 then
		err = sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando estado car_glosa_subfact_det',err)
		Return -1
	end if
	
	update car_glosa_cpo set estado = 'R' 
	where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item;
	if sqlca.sqlcode=-1 then
		err = sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizand estado car_glosa_cpo a P.',err)
		Return -1
	end if
	
	dw_objs.SetItem(fila,'sel_fac',0)
	dw_objs.GroupCalc()
	fila = dw_objs.Find("sel_fac=1",1,dw_objs.RowCount())
	if conteo = 0 then
		dw_histo.setitem(dw_histo.getrow(),'estado','1')
		if dw_histo.update() = -1 then Return -1
	end if
	commit;
loop
dw_histo.event rowfocuschanged(dw_histo.GetRow())
Return 0

end event

type pb_2 from picturebutton within w_respu_glosas
integer x = 2222
integer y = 2076
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "copiar.gif"
alignment htextalign = left!
string powertiptext = "Replicar respuestas"
end type

event clicked;if dw_objs.RowCount()=0 then return -1
open(w_replica_resp)

end event

type st_1 from statictext within w_respu_glosas
integer x = 4014
integer y = 276
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event doubleclicked;if keydown(keycontrol!) then
	cb_1.Visible = TRUE
else
	cb_1.Visible = FALSE	
end if

end event

type pb_1 from picturebutton within w_respu_glosas
integer x = 2222
integer y = 1940
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "editar.gif"
alignment htextalign = left!
string powertiptext = "Taer Plantillas"
end type

event clicked;st_rte st_r

rte_1.SelectTextAll()
rte_1.ReplaceText('')
st_r.ventana = 'RGL'
st_r.rte = rte_1
openwithparm(w_plant_rtf,st_r)
if f_sel_rtf(rte_1)>0 then
	rte_1.SelectTextall(Detail!)
	rte_1.Copy()
	if mle_resp.Visible then
		mle_resp.Paste()
		mle_resp.triggerevent(modified!)
	else
		mle_nots.Paste()
		mle_nots.triggerevent(modified!)
	end if
end if

end event

type cb_1 from commandbutton within w_respu_glosas
boolean visible = false
integer x = 4178
integer y = 140
integer width = 224
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "ch view"
end type

event clicked;if tab_1.Visible then
	tab_1.Visible = FALSE
	tab_1.tp_1.dw_facts.SetRedraw(FALSE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(FALSE)
	tab_1.tp_2.dw_procs.SetRedraw(FALSE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(FALSE)
	tab_1.tp_3.dw_sitem.SetRedraw(FALSE)
	tab_1.tp_3.dw_item_glos.SetRedraw(FALSE)
else
	tab_1.Visible = TRUE
	tab_1.BringtoTop = TRUE
	tab_1.tp_1.dw_facts.SetRedraw(TRUE)
	tab_1.tp_1.dw_fac_glos.SetRedraw(TRUE)
	tab_1.tp_2.dw_procs.SetRedraw(TRUE)
	tab_1.tp_2.dw_proc_glos.SetRedraw(TRUE)
	tab_1.tp_3.dw_sitem.SetRedraw(TRUE)
	tab_1.tp_3.dw_item_glos.SetRedraw(TRUE)
end if

end event

type tab_3 from tab within w_respu_glosas
event create ( )
event destroy ( )
integer x = 2469
integer y = 1684
integer width = 1367
integer height = 124
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type

on tab_3.create
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.Control[]={this.tabpage_5,&
this.tabpage_6}
end on

on tab_3.destroy
destroy(this.tabpage_5)
destroy(this.tabpage_6)
end on

event selectionchanged;if newindex = 1 then
	mle_resp.Visible = TRUE
	mle_nots.Visible = FALSE
else
	mle_resp.Visible = FALSE
	mle_nots.Visible = TRUE
end if

end event

type tabpage_5 from userobject within tab_3
integer x = 18
integer y = 112
integer width = 1330
integer height = -4
long backcolor = 67108864
string text = "Detalle de la Respuesta"
long tabtextcolor = 33554432
string picturename = "arq_deta.ico"
long picturemaskcolor = 536870912
end type

type tabpage_6 from userobject within tab_3
integer x = 18
integer y = 112
integer width = 1330
integer height = -4
long backcolor = 67108864
string text = "Notas"
long tabtextcolor = 33554432
string picturename = "editar.ico"
long picturemaskcolor = 536870912
end type

type pb_12 from picturebutton within w_respu_glosas
integer x = 2226
integer y = 1812
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Respuesta"
end type

event clicked;if dw_objs.rowcount()=0 then return
if (dw_objs.getitemstring(f_obj,'estado') <>'C' and dw_objs.getitemstring(f_obj,'estado') <>'R') then 
	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
	return
end if
dw_res.deleterow(0)
dw_res.event p_itemchanged(1)
//distribuye_valor(dw_facts,0)
i_cambio=true

end event

type pb_11 from picturebutton within w_respu_glosas
integer x = 2222
integer y = 1692
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Respuesta"
end type

event clicked;if dw_objs.rowcount()=0 then return -1
if dw_objs.GetRow() = 0 then
	Messagebox('Atención','Seleccione o Expanda la factura a cerrar')
	Return -1
end if
if (dw_objs.getitemstring(dw_objs.getrow(),'estado') <>'C' and dw_objs.getitemstring(dw_objs.getrow(),'estado') <>'R') then 
	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
	return -1
end if
//
if dw_res.RowCount() > 0 then
	MessageBox('Atención','La objeción ya fué contestada')
	Return 0
end if
//

long donde
donde=dw_res.insertrow(0)
if dw_objs.getitemstring(dw_objs.getrow(),'nivel') = 'Factura' then
	tab_1.tp_1.dw_fac_glos.setitem(tab_1.tp_1.dw_fac_glos.GetRow(),'estado','R')
	tab_1.tp_1.dw_fac_glos.setitem(tab_1.tp_1.dw_fac_glos.GetRow(),'fecha_respuesta',datetime(today(),now()) )
	dw_res.setitem(donde,'coddoc_glosa_gral',dw_objs.getitemstring(dw_objs.getrow(),'coddoc'))
	dw_res.setitem(donde,'clugar_glosa_gral',dw_objs.getitemstring(dw_objs.getrow(),'clugar'))
	dw_res.setitem(donde,'num_glosa_gral',dw_objs.getitemnumber(dw_objs.getrow(),'num_glosa'))
	dw_res.setitem(donde,'item_glosa_gral',dw_objs.getitemnumber(dw_objs.getrow(),'item'))
	dw_res.setitem(donde,'nglosa_gral',dw_objs.getitemnumber(dw_objs.getrow(),'nobjecion'))
//	tab_1.tp_1.pb_add.Event clicked()
elseif dw_objs.getitemstring(dw_objs.getrow(),'nivel') = 'Procedimiento' then
	tab_1.tp_2.dw_proc_glos.setitem(tab_1.tp_2.dw_proc_glos.GetRow(),'estado','R')
	tab_1.tp_2.dw_proc_glos.setitem(tab_1.tp_2.dw_proc_glos.GetRow(),'fecha_respuesta',datetime(today(),now()) )
	dw_res.setitem(donde,'coddoc_glosa_det',dw_objs.getitemstring(dw_objs.getrow(),'coddoc'))
	dw_res.setitem(donde,'clugar_glosa_det',dw_objs.getitemstring(dw_objs.getrow(),'clugar'))
	dw_res.setitem(donde,'num_glosa_det',dw_objs.getitemnumber(dw_objs.getrow(),'num_glosa'))
	dw_res.setitem(donde,'item_glosa_det',dw_objs.getitemnumber(dw_objs.getrow(),'item'))
	dw_res.setitem(donde,'subitem_glosa_det',dw_objs.getitemnumber(dw_objs.getrow(),'subitem'))
	dw_res.setitem(donde,'nglosa_det',dw_objs.getitemnumber(dw_objs.getrow(),'nobjecion'))
//	tab_1.tp_2.pb_2.Event clicked()
elseif dw_objs.getitemstring(dw_objs.getrow(),'nivel') = 'Subitem' then
	tab_1.tp_3.dw_item_glos.setitem(tab_1.tp_3.dw_item_glos.GetRow(),'estado','R')
	tab_1.tp_3.dw_item_glos.setitem(tab_1.tp_3.dw_item_glos.GetRow(),'fecha_respuesta',datetime(today(),now()) )
	dw_res.setitem(donde,'coddoc_glosa_sub',dw_objs.getitemstring(dw_objs.getrow(),'coddoc'))
	dw_res.setitem(donde,'clugar_glosa_sub',dw_objs.getitemstring(dw_objs.getrow(),'clugar'))
	dw_res.setitem(donde,'num_glosa_sub',dw_objs.getitemnumber(dw_objs.getrow(),'num_glosa'))
	dw_res.setitem(donde,'item_glosa_sub',dw_objs.getitemnumber(dw_objs.getrow(),'item'))
	dw_res.setitem(donde,'subitem_glosa_sub',dw_objs.getitemnumber(dw_objs.getrow(),'subitem'))
	dw_res.setitem(donde,'ndeta_glosa_sub',dw_objs.getitemnumber(dw_objs.getrow(),'ndeta'))
	dw_res.setitem(donde,'nglosa_sub',dw_objs.getitemnumber(dw_objs.getrow(),'nobjecion'))	
//	tab_1.tp_3.pb_4.Event clicked()
end if
dw_objs.setitem(dw_objs.getrow(),'estado','R')
dw_res.ScrolltoRow(donde)
dw_res.setitem(donde,'fecha',datetime(today(),now()))
dw_res.setitem(donde,'t_aceptado',0)
dw_res.setcolumn('t_aceptado')
dw_res.setfocus()
i_cambio=true
return donde
end event

type pb_10 from picturebutton within w_respu_glosas
integer x = 3817
integer y = 296
integer width = 142
integer height = 124
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "/*"
string picturename = "cerrar.gif"
string disabledname = "d_cerrar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar Respuestas seleccs."
end type

event clicked;if dw_objs.rowcount()=0 then return
if messageBox('Atención','Desea cerrar las respuestas para las facturas seleccionadas?',Question!,YesNo!) = 2 then Return 0
if grabar()=-1 then return -1
string clug, err, cdoc
double nglosa, fact
long f, conteo, item
dw_objs.SetRedraw(FALSE)
dw_res.SetRedraw(FALSE)
long fila
fila = dw_objs.Find("sel_fac=1",1,dw_objs.RowCount())
do while fila >0
	if dw_objs.GetitemString(fila,'estado_fac') = 'P' or dw_objs.GetitemString(fila,'estado_fac') = 'E' then
		MessageBox('Atención','Ya ha sido cerrada la factura seleccionada')
		dw_objs.SetRedraw(TRUE)
		dw_res.SetRedraw(TRUE)
		Return 0
	end if
	
	fact = dw_objs.GetItemNumber(fila,'nfact')
	f = dw_objs.find("nfact="+string(fact),1,dw_objs.RowCount())
	do while f > 0
		dw_objs.SetRow(f)
		if dw_res.RowCount() = 0 then
			MessageBox('Atención','La objeción no tiene respuesta')
			dw_objs.SetRedraw(TRUE)
			dw_res.SetRedraw(TRUE)
			Return -1
		end if
		if f + 1 > dw_objs.RowCount() then exit
		f = dw_objs.find("nfact="+string(fact),f+1,dw_objs.RowCount())
	loop
	dw_objs.ScrolltoRow(fila)
	dw_objs.SetRedraw(TRUE)
	dw_res.SetRedraw(TRUE)

	//if dw_objs.update(TRUE,FALSE) = -1 then Return -1
	cdoc = dw_objs.getitemstring(fila,'coddoc')
	clug = dw_objs.getitemstring(fila,'clugar')
	nglosa = dw_objs.getitemnumber(fila,'num_glosa')
	item = dw_objs.GetItemNumber(fila,'item')
	update car_glosa_cpo_det set estado = 'P' 
	where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item and estado='R' and usu_responde=:usuario ;
	if sqlca.sqlcode=-1 then
		err = sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando estado car_glosa_cpo_det',err)
		Return -1
	end if
	update car_glosa_subcpo_det set estado = 'P' 
	where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item and estado='R' and usu_responde=:usuario;
	if sqlca.sqlcode=-1 then
		err = sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando estado car_glosa_subcpo_det',err)
		Return -1
	end if

	update car_glosa_subfact_det set estado = 'P' 
	where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item and estado='R' and usu_responde=:usuario;
	if sqlca.sqlcode=-1 then
		err = sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando estado car_glosa_subfact_det',err)
		Return -1
	end if
	////////////////////  Revisa si existen objeciones sin responder (otros usuarios) para estado de glosa_cpo////////////
	select count(*) into :conteo from car_glosa_cpo_det 
	where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item and estado not in ('P','E');
	if sqlca.sqlcode=-1 then
		err = sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando estado car_glosa_cpo_det',err)
		Return -1
	end if
	if conteo = 0 then
		select count(*) into :conteo from car_glosa_subcpo_det 
		where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item and estado not in ('P','E');
		if sqlca.sqlcode=-1 then
			err = sqlca.sqlerrtext
			rollback;
			messagebox('Error revisando estado car_glosa_subcpo_det',err)
			Return -1
		end if
	end if
	if conteo = 0 then
		select count(*) into :conteo from car_glosa_subfact_det 
		where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item and estado not in ('P','E');
		if sqlca.sqlcode=-1 then
			err = sqlca.sqlerrtext
			rollback;
			messagebox('Error revisando estado car_glosa_subfact_det',err)
			Return -1
		end if
	end if
	///// Si no hay de otros usuarios cierra la factura
	if conteo = 0 then
		update car_glosa_cpo set estado = 'P' 
		where coddoc=:cdoc and clugar=:clug and num_glosa=:nglosa and item=:item;
		if sqlca.sqlcode=-1 then
			err = sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizand estado car_glosa_cpo a P.',err)
			Return -1
		end if
	end if
	/////////////// Revisa estado de glosa_cpo para ver si puede cerrar el documento (Rta cerradas) /////////////
	select count(*) into :conteo from car_glosa_cpo where 
	coddoc ='GL' and clugar =:clug and num_glosa =:nglosa and estado not in ('P','E');
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo car_glosa_cpo',err)
		Return -1
	end if
	if conteo = 0 then
		dw_histo.setitem(dw_histo.getrow(),'estado','2')
		if dw_histo.update() = -1 then Return -1
	end if
	commit;

	f = dw_objs.Find("clugar='"+clug+"' and num_glosa="+string(nglosa)+" and item="+string(item),1,dw_objs.RowCount())
	do while f > 0
		dw_objs.SetItem(f,'estado','P')
		if f + 1 > dw_objs.RowCount() then exit
		f = dw_objs.Find("clugar='"+clug+"' and num_glosa="+string(nglosa)+" and item="+string(item),f + 1,dw_objs.RowCount())	
	loop
	dw_objs.SetItem(fila,'sel_fac',0)
	dw_objs.GroupCalc()
	fila = dw_objs.Find("sel_fac=1",1,dw_objs.RowCount())
loop
dw_histo.event rowfocuschanged(dw_histo.GetRow())
Return 0

end event

type pb_porcen from picturebutton within w_respu_glosas
integer x = 3817
integer y = 176
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Responder Porcentualmente"
end type

event clicked;if dw_histo.rowcount() = 0 then return
if dw_objs.GetItemNumber(dw_objs.GetRow(),'compute_1') > 0 then
	MessageBox('Atención','La factura tiene objeciones con respuesta')
	Return 0
end if
open(w_acepta_porcen)

end event

type pb_save from picturebutton within w_respu_glosas
integer x = 3817
integer y = 48
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "             &g"
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;grabar()
end event

type rb_2 from radiobutton within w_respu_glosas
boolean visible = false
integer x = 1344
integer y = 56
integer width = 594
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Respuestas Anteriores."
end type

type rb_1 from radiobutton within w_respu_glosas
boolean visible = false
integer x = 649
integer y = 56
integer width = 658
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pendientes de Responder"
end type

type dw_histo from datawindow within w_respu_glosas
integer x = 37
integer y = 116
integer width = 3703
integer height = 488
integer taborder = 10
string title = "none"
string dataobject = "dw_obj_a_respon_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;string l_cdoc,l_clug
double l_nglosa

dw_res.reset()
dw_objs.reset()
tab_1.tp_1.dw_facts.reset()
tab_1.tp_2.dw_procs.reset()
tab_1.tp_3.dw_sitem.reset()
if getrow()<1 then return
l_cdoc=getitemstring(getrow(),'coddoc')
l_clug=getitemstring(getrow(),'clugar')
l_nglosa=getitemnumber(getrow(),'num_glosa')
dw_res.Retrieve(l_cdoc,l_clug,l_nglosa)
dw_objs.Retrieve(l_cdoc,l_clug,l_nglosa,usuario)
tab_1.tp_3.dw_item_glos.retrieve(l_cdoc,l_clug,l_nglosa)//,usuario)
tab_1.tp_3.dw_sitem.retrieve(l_cdoc,l_clug,l_nglosa)//,usuario)
tab_1.tp_2.dw_proc_glos.retrieve(l_cdoc,l_clug,l_nglosa)//,usuario)
tab_1.tp_2.dw_procs.retrieve(l_cdoc,l_clug,l_nglosa)//,usuario)
tab_1.tp_1.dw_fac_glos.retrieve(l_cdoc,l_clug,l_nglosa)//,usuario)
tab_1.tp_1.dw_facts.retrieve(l_cdoc,l_clug,l_nglosa)//,usuario)
cb_2.Text = 'Selec. todas facturas'
if dw_objs.rowcount()>0 then dw_objs.Event rowfocuschanged(dw_res.GetRow())
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

type gb_1 from groupbox within w_respu_glosas
integer x = 18
integer y = 20
integer width = 3753
integer height = 600
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Objeciones:"
end type

type cb_2 from commandbutton within w_respu_glosas
integer x = 3808
integer y = 556
integer width = 576
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Selec. todas facturas"
end type

event clicked;long i
if Text = 'Selec. todas facturas' then
	Text = 'Deselec. todas facturas'
	for i =1 to dw_objs.RowCount()
//		if dw_objs.GetitemString(i,'estado_fac') <> 'P' and dw_objs.GetitemString(i,'estado_fac') <> 'E' then dw_objs.SetItem(i,'sel_fac',1)
		if dw_objs.GetitemString(i,'estado_fac') <> 'E' then dw_objs.SetItem(i,'sel_fac',1)
	next
else
	Text = 'Selec. todas facturas'
	for i =1 to dw_objs.RowCount()
		dw_objs.SetItem(i,'sel_fac',0)
	next
end if

end event

type rte_1 from richtextedit within w_respu_glosas
boolean visible = false
integer x = 4023
integer y = 264
integer width = 370
integer height = 352
integer taborder = 50
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type mle_resp from multilineedit within w_respu_glosas
integer x = 2455
integer y = 1884
integer width = 1362
integer height = 444
integer taborder = 120
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
borderstyle borderstyle = stylelowered!
end type

event losefocus;triggerevent (modified!)
end event

event modified;if dw_res.rowcount()=0 then return
if (isnull(dw_res.getitemstring(dw_res.getrow(),'respuesta')) and text<>'' ) or (dw_res.getitemstring(dw_res.getrow(),'respuesta')<>text) then
	dw_res.setitem(dw_res.getrow(),'respuesta',text)
	i_cambio=true
end if

end event

type tab_1 from tab within w_respu_glosas
boolean visible = false
integer x = 37
integer y = 648
integer width = 4398
integer height = 976
integer taborder = 40
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
integer width = 4361
integer height = 848
long backcolor = 67108864
string text = "Facturas"
long tabtextcolor = 33554432
string picturename = "factura.ico"
long picturemaskcolor = 536870912
string powertiptext = "Facuras de la Objeción por usuario"
st_3 st_3
pb_7 pb_7
pb_cerrar pb_cerrar
dw_fac_glos dw_fac_glos
dw_facts dw_facts
end type

on tp_1.create
this.st_3=create st_3
this.pb_7=create pb_7
this.pb_cerrar=create pb_cerrar
this.dw_fac_glos=create dw_fac_glos
this.dw_facts=create dw_facts
this.Control[]={this.st_3,&
this.pb_7,&
this.pb_cerrar,&
this.dw_fac_glos,&
this.dw_facts}
end on

on tp_1.destroy
destroy(this.st_3)
destroy(this.pb_7)
destroy(this.pb_cerrar)
destroy(this.dw_fac_glos)
destroy(this.dw_facts)
end on

type st_3 from statictext within tp_1
integer x = 2075
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
string text = "Objeciones"
boolean focusrectangle = false
end type

type pb_7 from picturebutton within tp_1
integer x = 2085
integer y = 620
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar.gif"
alignment htextalign = left!
string powertiptext = "Taer Plantillas"
end type

event clicked;st_rte st_r
long cars

rte_1.SelectTextAll()
rte_1.ReplaceText('')
st_r.ventana = 'RGL'
st_r.rte = rte_1
openwithparm(w_plant_rtf,st_r)
rte_1.SelectTextAll()
cars = rte_1.Copy()
if cars > 0 then
	mle_resp.Paste()
end if

end event

type pb_cerrar from picturebutton within tp_1
integer x = 1970
integer y = 824
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cerrar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar Respuestas"
end type

event clicked;//if dw_facts.rowcount()=0 then return
//if dw_facts.find('esco=1',1,dw_facts.rowcount())=0 then return
//if grabar()=-1 then return
//long j,k,l,m,n
//boolean sub
//string clug,err
//for j=1 to dw_facts.rowcount()
//	if dw_facts.getitemnumber(j,'esco')=0 then continue
//	dw_facts.setitem(j,'esco',0)
//	sub=false
//	if dw_facts.getitemstring(j,'forma_respu')='F' then//total a nivel de factura
//		dw_resp.setfilter('item_glosa_gral='+string(dw_facts.getitemnumber(j,'item')))
//		dw_resp.filter()
//		if dw_resp.rowcount()=0 then continue
//		for k=1 to dw_resp.rowcount()
//			if isnull(dw_resp.getitemstring(k,'cod_respuesta')) or isnull(dw_resp.getitemstring(k,'usu_causante')) then 
//				sub=true
//				exit
//			end if
//		next
//	else//parcial
//		dw_facts.scrolltorow(j)
//		for k=1 to tab_1.tp_2.dw_procs.rowcount()
//			if tab_1.tp_2.dw_procs.getitemstring(k,'tipo')='1' then//total
//				tab_1.tp_2.dw_resp_proc.setfilter('item_glosa_det='+string(tab_1.tp_2.dw_procs.getitemnumber(k,'item'))+' and subitem_glosa_det='+string(tab_1.tp_2.dw_procs.getitemnumber(k,'subitem')))
//				tab_1.tp_2.dw_resp_proc.filter()
//				if tab_1.tp_2.dw_resp_proc.rowcount()=0 then 
//					sub=true
//					exit
//				end if
//				for n=1 to tab_1.tp_2.dw_resp_proc.rowcount()
//					if isnull(tab_1.tp_2.dw_resp_proc.getitemstring(n,'cod_respuesta')) or isnull(tab_1.tp_2.dw_resp_proc.getitemstring(n,'usu_causante')) then 
//						sub=true
//						exit
//					end if
//				next
//				if sub then exit
//			else
//				tab_1.tp_2.dw_procs.scrolltorow(k)
//				for l=1 to tab_1.tp_3.dw_sitem.rowcount()
//					tab_1.tp_3.dw_resp_sitem.setfilter('item_glosa_sub='+string(tab_1.tp_3.dw_sitem.getitemnumber(l,'item'))+' and subitem_glosa_sub='+string(tab_1.tp_3.dw_sitem.getitemnumber(l,'subitem'))+' and ndeta_glosa_sub='+string(tab_1.tp_3.dw_sitem.getitemnumber(l,'ndeta')))
//					tab_1.tp_3.dw_resp_sitem.filter()
//					if tab_1.tp_3.dw_resp_sitem.rowcount()=0 then 
//						sub=true
//						exit
//					end if
//					for m=1 to tab_1.tp_3.dw_resp_sitem.rowcount()
//						if isnull(tab_1.tp_3.dw_resp_sitem.getitemstring(m,'cod_respuesta')) or isnull(tab_1.tp_3.dw_resp_sitem.getitemstring(m,'usu_causante')) then 
//							sub=true
//							exit
//						end if
//					next
//					if sub then exit
//				next
//			end if
//			if sub then exit
//		next
//	end if
//	if sub then continue
//	dw_facts.setitem(j,'estado','P')
//next
//if dw_facts.update(true,false)=-1 then goto error
//m=dw_histo.getitemnumber(dw_histo.getrow(),'num_glosa')
//clug=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
//select count(*) into :j from car_glosa_cpo where 
//coddoc ='GL' and clugar =:clug and num_glosa =:m and estado not in ('P','E');
//if sqlca.sqlcode=-1 then
//	err=sqlca.sqlerrtext
//	rollback;
//	messagebox('Error leyendo car_glosa_cpo',err)
//	goto error
//end if
//if j=0 then
//	dw_histo.setitem(dw_histo.getrow(),'estado','2')
//	if dw_histo.update()=-1 then return
//end if
//commit;
//dw_facts.resetupdate()
//return
//error:
//dw_histo.event rowfocuschanged(dw_histo.getrow())
end event

type dw_fac_glos from datawindow within tp_1
event porcentajes ( )
integer x = 2071
integer y = 48
integer width = 2231
integer height = 772
integer taborder = 30
string title = "none"
string dataobject = "dw_glos_cpo_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
getchild('cod_objecion',idw_obj)
idw_obj.settransobject(sqlca)
idw_obj.retrieve('%','%')
Modify("cod_objecion.TabOrder=0 valor_objecion.Edit.DisplayOnly=yes nombre.TabOrder=0 valor_objecion.edit.displayonly=yes")

end event

event rowfocuschanged;//dw_resp.setfilter('isnull(item_glosa_gral)')
//if getrow()>0 then
//	dw_resp.setfilter('item_glosa_gral='+string(getitemnumber(getRow(),'item'))+' and nglosa_gral='+string(getitemnumber(getrow(),'nobjecion')))
//	idw_resp1.retrieve(getitemstring(getrow(),'cod_objecion'))
//end if
//dw_resp.filter()
//dw_resp.event rowfocuschanged(dw_resp.getrow())
//
end event

event dragwithin;if row > 0 then ScrolltoRow(row)

end event

event dragdrop;//long f
//if dw_fac_glos.RowCount() = 0 then Return
//if (dw_fac_glos.getitemstring(row,'estado') <>'C' and dw_fac_glos.getitemstring(row,'estado') <>'R') then 
//	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
//	return
//end if
//
//f = pb_add.Event clicked()
//if f > 0 then
//	dw_resp.SetItem(f,'cod_respuesta',i_cod_resp)
//	dw_resp.SetItem(f,'usu_causante',i_usu)
//	dw_resp.SetItem(f,'respuesta',i_resp)
//	dw_resp.SetItem(f,'notas',i_notas)
//end if
//
end event

event retrieveend;long i
for i = 1 to RowCount()
	if GetItemNumber(i,'valor_objecion') = 0 then
		SetItem(i,'porcen',0)
	else
		SetItem(i,'porcen',round(GetItemNumber(i,'valor_aceptado')/GetItemNumber(i,'valor_objecion')*100,i_dec_gral_car))
	end if
next

end event

type dw_facts from datawindow within tp_1
event ue_mousemove pbm_mousemove
event ue_buttondown pbm_lbuttondown
event ue_buttonup pbm_lbuttonup
integer y = 48
integer width = 2043
integer height = 772
integer taborder = 30
string dragicon = "Asterisk!"
string title = "none"
string dataobject = "dw_obje_a_respu_cpo"
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
dw_fac_glos.setfilter('isnull(item)')
if getrow()>0 then
	tab_1.tp_2.dw_procs.setfilter('item='+string(getitemnumber(getrow(),'item')))
	dw_fac_glos.setfilter('item='+string(getitemnumber(getrow(),'item')))
	long donde
end if
dw_fac_glos.filter()
dw_fac_glos.event rowfocuschanged(dw_fac_glos.getrow())
tab_1.tp_2.dw_procs.filter()
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

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.solobuscar = TRUE
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event itemchanged;i_cambio=true
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4361
integer height = 848
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "bisturi.ico"
long picturemaskcolor = 536870912
string powertiptext = "Procedimientos a responder de la factura"
pb_8 pb_8
st_4 st_4
dw_procs dw_procs
dw_proc_glos dw_proc_glos
end type

on tp_2.create
this.pb_8=create pb_8
this.st_4=create st_4
this.dw_procs=create dw_procs
this.dw_proc_glos=create dw_proc_glos
this.Control[]={this.pb_8,&
this.st_4,&
this.dw_procs,&
this.dw_proc_glos}
end on

on tp_2.destroy
destroy(this.pb_8)
destroy(this.st_4)
destroy(this.dw_procs)
destroy(this.dw_proc_glos)
end on

type pb_8 from picturebutton within tp_2
integer x = 1906
integer y = 720
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar.gif"
alignment htextalign = left!
string powertiptext = "Taer Plantillas"
end type

event clicked;st_rte st_r
long cars

rte_1.SelectTextAll()
rte_1.ReplaceText('')
st_r.ventana = 'RGL'
st_r.rte = rte_1
openwithparm(w_plant_rtf,st_r)
rte_1.SelectTextAll()
cars = rte_1.Copy()
if cars > 0 then
	mle_resp.Paste()
end if

end event

type st_4 from statictext within tp_2
integer x = 5
integer y = 4
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

type dw_procs from datawindow within tp_2
event p_itemchanged ( )
integer y = 64
integer width = 1915
integer height = 760
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_gloscpo_a_respu"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();if rowcount()>0 then
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

event rowfocuschanged;dw_proc_glos.setfilter('isnull(subitem)')
tab_1.tp_3.dw_sitem.setfilter('isnull(subitem)')
if getrow()>0 then
	dw_proc_glos.setfilter('item='+string(getitemnumber(getrow(),'item'))+' and subitem='+string(getitemnumber(getrow(),'subitem')))
	tab_1.tp_3.dw_sitem.setfilter('item='+string(getitemnumber(getrow(),'item'))+' and subitem='+string(getitemnumber(getrow(),'subitem')))
	long donde
end if
dw_proc_glos.filter()
dw_proc_glos.event rowfocuschanged(dw_proc_glos.getrow())
tab_1.tp_3.dw_sitem.filter()
tab_1.tp_3.dw_sitem.event rowfocuschanged(tab_1.tp_3.dw_sitem.getrow())

end event

event clicked;if row>0 and row<>getrow() then scrolltorow(row)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.solobuscar = TRUE
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event itemchanged;i_cambio=true
end event

type dw_proc_glos from datawindow within tp_2
event porcentajes ( )
integer x = 1938
integer y = 64
integer width = 2473
integer height = 752
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_glos_proc_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
getchild('cod_objecion',idw_obj2)
idw_obj2.settransobject(sqlca)
idw_obj2.retrieve('%','%')
Modify("cod_objecion.TabOrder=0 valor_objecion.Edit.DisplayOnly=yes nombre.TabOrder=0 valor_objecion.edit.displayonly=yes")

end event

event rowfocuschanged;//dw_resp_proc.setfilter('isnull(nglosa_det)')
//if getrow()>0 then
//	idw_resp2.retrieve(getitemstring(getrow(),'cod_objecion'))
//	dw_resp_proc.setfilter('item_glosa_det='+string(getitemnumber(getrow(),'item'))+' and subitem_glosa_det='+string(getitemnumber(getrow(),'subitem'))+' and nglosa_det='+string(getitemnumber(getrow(),'nobjecion')))
//end if
//dw_resp_proc.filter()
//dw_resp_proc.event rowfocuschanged(dw_resp_proc.getrow())
//
end event

event dragwithin;//if row > 0 then ScrolltoRow(row)
end event

event dragdrop;//long f
//if dw_proc_glos.rowcount()=0 then return
//if (dw_proc_glos.getitemstring(dw_proc_glos.getrow(),'estado_respu') <>'C' and dw_proc_glos.getitemstring(dw_proc_glos.getrow(),'estado_respu') <>'R') then 
//	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
//	return
//end if
//f = pb_2.Event clicked()
//if f > 0 then
//	dw_resp_proc.SetItem(f,'cod_respuesta',i_cod_resp)
//	dw_resp_proc.SetItem(f,'usu_causante',i_usu)
//	dw_resp_proc.SetItem(f,'respuesta',i_resp)
//	dw_resp_proc.SetItem(f,'notas',i_notas)
//end if
//
end event

event retrieveend;long i
for i = 1 to RowCount()
	if GetItemNumber(i,'valor_objecion') = 0 then
		SetItem(i,'porcen',0)
	else
		SetItem(i,'porcen',round(GetItemNumber(i,'valor_aceptado')/GetItemNumber(i,'valor_objecion')*100,i_dec_gral_car))
	end if
next

end event

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4361
integer height = 848
long backcolor = 67108864
string text = "Items. del proc."
long tabtextcolor = 33554432
string picturename = "buscar.ico"
long picturemaskcolor = 536870912
string powertiptext = "Subdetalle del Procedimiento"
pb_9 pb_9
st_7 st_7
dw_sitem dw_sitem
dw_item_glos dw_item_glos
end type

on tp_3.create
this.pb_9=create pb_9
this.st_7=create st_7
this.dw_sitem=create dw_sitem
this.dw_item_glos=create dw_item_glos
this.Control[]={this.pb_9,&
this.st_7,&
this.dw_sitem,&
this.dw_item_glos}
end on

on tp_3.destroy
destroy(this.pb_9)
destroy(this.st_7)
destroy(this.dw_sitem)
destroy(this.dw_item_glos)
end on

type pb_9 from picturebutton within tp_3
integer x = 1998
integer y = 712
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
string picturename = "editar.gif"
alignment htextalign = left!
string powertiptext = "Taer Plantillas"
end type

event clicked;st_rte st_r
long cars

rte_1.SelectTextAll()
rte_1.ReplaceText('')
st_r.ventana = 'RGL'
st_r.rte = rte_1
openwithparm(w_plant_rtf,st_r)
rte_1.SelectTextAll()
cars = rte_1.Copy()
if cars > 0 then
	mle_resp.Paste()
end if

end event

type st_7 from statictext within tp_3
integer x = 9
integer y = 12
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

type dw_sitem from datawindow within tp_3
event p_itemchanged ( )
integer x = 5
integer y = 72
integer width = 2016
integer height = 724
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_glos_sitem"
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

event rowfocuschanged;dw_item_glos.setfilter('isnull(nitem_fact)')
if getrow()>0 then
	dw_item_glos.setfilter('nitem_fact='+string(getitemnumber(getrow(),'nitem_fact'))+' and ndeta_fact='+string(getitemnumber(getrow(),'ndeta_fact')))
end if
dw_item_glos.filter()
dw_item_glos.event RowFocuschanged(dw_item_glos.GetRow())


end event

event constructor;settransobject(sqlca)
end event

event clicked;if row>0 and row<>getrow() then scrolltorow(row)
end event

event itemchanged;i_cambio=true
end event

event dragdrop;//long f
//
//f = pb_4.Event clicked()
//if f > 0 then
//	dw_resp_sitem.SetItem(f,'cod_respuesta',i_cod_resp)
//	dw_resp_sitem.SetItem(f,'usu_causante',i_usu)
//	dw_resp_sitem.SetItem(f,'respuesta',i_resp)
//	dw_resp_sitem.SetItem(f,'notas',i_notas)
//end if
//
end event

type dw_item_glos from datawindow within tp_3
event porcentajes ( )
integer x = 2048
integer y = 72
integer width = 1641
integer height = 724
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_glos_item_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
getchild('cod_objecion',idw_obj3)
idw_obj3.settransobject(sqlca)
idw_obj3.retrieve('%','%')
Modify("cod_objecion.TabOrder=0 valor_objecion.Edit.DisplayOnly=yes nombre.TabOrder=0 valor_objecion.edit.displayonly=yes")

end event

event rowfocuschanged;//dw_resp_sitem.setfilter('isnull(subitem_glosa_sub)')
//if getrow()>0 then
//	idw_resp3.retrieve(getitemstring(getrow(),'cod_objecion'))
//	dw_resp_sitem.setfilter('item_glosa_sub='+string(getitemnumber(getrow(),'item'))+' and subitem_glosa_sub='+string(getitemnumber(getrow(),'subitem'))+' and ndeta_glosa_sub='+string(getitemnumber(getrow(),'ndeta'))+' and nglosa_sub='+string(getitemnumber(getrow(),'nobjecion')))
//end if
//dw_resp_sitem.filter()
//dw_resp_sitem.event rowfocuschanged(dw_resp_sitem.getrow())
//
end event

event dragwithin;if row > 0 then ScrolltoRow(row)

end event

event dragdrop;//long f
//
//f = pb_4.Event clicked()
//if f > 0 then
//	dw_resp_sitem.SetItem(f,'cod_respuesta',i_cod_resp)
//	dw_resp_sitem.SetItem(f,'usu_causante',i_usu)
//	dw_resp_sitem.SetItem(f,'respuesta',i_resp)
//	dw_resp_sitem.SetItem(f,'notas',i_notas)
//end if
//
end event

event retrieveend;long i
for i = 1 to RowCount()
	if GetItemNumber(i,'valor_objecion') = 0 then
		SetItem(i,'porcen',0)
	else
		SetItem(i,'porcen',round(GetItemNumber(i,'valor_aceptado')/GetItemNumber(i,'valor_objecion')*100,i_dec_gral_car))
	end if
next

end event

type mle_nots from multilineedit within w_respu_glosas
boolean visible = false
integer x = 2455
integer y = 1884
integer width = 1362
integer height = 440
integer taborder = 80
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
borderstyle borderstyle = stylelowered!
end type

event losefocus;triggerevent (modified!)
end event

event modified;if dw_res.rowcount()=0 then return
if (isnull(dw_res.getitemstring(dw_res.getrow(),'notas')) and text<>'' ) or (dw_res.getitemstring(dw_res.getrow(),'notas')<>text) then
	dw_res.setitem(dw_res.getrow(),'notas',text)
	i_cambio=true
end if

end event

type dw_objs from datawindow within w_respu_glosas
integer x = 41
integer y = 652
integer width = 4402
integer height = 1012
integer taborder = 80
string title = "none"
string dataobject = "dw_resp_glosa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;string texto, band
long fila, pos
if row > 0 and row <> Getrow() then SetRow(row)

texto = this.GetBandAtPointer()
pos = pos(texto, "~t")
if pos > 0 then 
	band = mid(texto, 1 , pos - 1)
	fila = long (mid (texto, pos + 1 , len(texto)))
end if
if fila > 0 then f_obj = fila
if dwo.name = 'sel_fac' and fila > 0 then
	if GetItemNumber(fila,'sel_fac') = 0 then
		if GetitemString(fila,'estado_fac') = 'P' or GetitemString(fila,'estado_fac') = 'E' or GetitemString(fila,'estado_fac') = 'R' then Return 0
		SetItem(fila,'sel_fac',1)
	else
		SetItem(fila,'sel_fac',0)
	end if
end if

end event

event rowfocuschanged;f_obj = 0
if GetRow() = 0 then Return
long f
if GetItemString(GetRow(),'nivel') = 'Factura' then
	dw_res.SetFilter("item_glosa_gral="+string(GetItemNumber(GetRow(),'item'))+" and nglosa_gral="+string(GetItemNumber(GetRow(),'nobjecion')))
elseif GetItemString(GetRow(),'nivel') = 'Procedimiento' then
	dw_res.SetFilter("item_glosa_det="+string(GetItemNumber(GetRow(),'item'))+" and subitem_glosa_det="+string(GetItemNumber(GetRow(),'subitem'))+" and nglosa_det="+string(GetItemNumber(GetRow(),'nobjecion')))
elseif GetItemString(GetRow(),'nivel') = 'Subitem' then
	dw_res.SetFilter("item_glosa_sub="+string(GetItemNumber(GetRow(),'item'))+" and subitem_glosa_sub="+string(GetItemNumber(GetRow(),'subitem'))+" and ndeta_glosa_sub="+string(GetItemNumber(GetRow(),'ndeta'))+" and nglosa_sub="+string(GetItemNumber(GetRow(),'nobjecion')))
end if
dw_res.Filter()
dw_res.Event rowfocuschanged(dw_res.GetRow())
idw_resp.Retrieve(GetItemString(GetRow(),'cod_objecion'))

f = tab_1.tp_1.dw_facts.Find("item="+string(GetItemNumber(GetRow(),'item')),1,tab_1.tp_1.dw_facts.RowCount())
if f > 0 then
	tab_1.tp_1.dw_facts.SetRow(f)
end if
if GetItemString(GetRow(),'nivel') = 'Factura' then
	f = tab_1.tp_1.dw_fac_glos.Find("nobjecion="+string(GetItemNumber(GetRow(),'nobjecion')),1,tab_1.tp_1.dw_fac_glos.RowCount())
	if f > 0 then
		tab_1.tp_1.dw_fac_glos.SetRow(f)
		tab_1.tp_1.dw_fac_glos.Event rowfocuschanged(f)
	end if
end if
if GetItemNumber(GetRow(),'subitem') > 0 then
	f = tab_1.tp_2.dw_procs.Find("subitem="+string(GetItemNumber(GetRow(),'subitem')),1,tab_1.tp_2.dw_procs.RowCount())
	if f > 0 then
		tab_1.tp_2.dw_procs.SetRow(f)
		tab_1.tp_2.dw_procs.Event RowFocuschanged(f)
	end if
	if GetItemString(GetRow(),'nivel') = 'Procedimiento' then
		f = tab_1.tp_2.dw_proc_glos.Find("nobjecion="+string(GetItemNumber(GetRow(),'nobjecion')),1,tab_1.tp_2.dw_proc_glos.RowCount())
		if f > 0 then
			tab_1.tp_2.dw_proc_glos.ScrolltoRow(f)
		end if
	end if
end if
if GetItemNumber(GetRow(),'ndeta') > 0 then
	f = tab_1.tp_3.dw_sitem.Find("ndeta="+string(GetItemNumber(GetRow(),'ndeta')),1,tab_1.tp_3.dw_sitem.RowCount())
	if f > 0 then
		tab_1.tp_3.dw_sitem.SetRow(f)
		tab_1.tp_3.dw_sitem.Event RowFocuschanged(f)
	end if
	if GetItemString(GetRow(),'nivel') = 'Subitem' then
		f = tab_1.tp_3.dw_item_glos.Find("nobjecion="+string(GetItemNumber(GetRow(),'nobjecion')),1,tab_1.tp_3.dw_item_glos.RowCount())
		if f > 0 then
			tab_1.tp_3.dw_item_glos.SetRow(f)
		end if
	end if
end if
if GetItemString(GetRow(),'estado') = 'P' then
	dw_res.modify("t_aceptado.edit.displayonly=yes")
else
	dw_res.modify("t_aceptado.edit.displayonly=no")
end if
f_obj = GetRow()

end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1

end event

event dragwithin;if row > 0 then ScrolltoRow(row)
end event

event dragdrop;long f
if dw_objs.Rowcount() = 0 then Return
if (dw_objs.getitemstring(dw_objs.getrow(),'estado') <>'C' and dw_objs.getitemstring(dw_objs.getrow(),'estado') <>'R') then 
	Messagebox('Atención','Esta objeción ya fue contestada y cerrada')
	return
end if
f = pb_11.Event clicked()
if f > 0 then
	dw_res.SetItem(f,'cod_respuesta',i_cod_resp)
	dw_res.SetItem(f,'usu_causante',i_usu)
	dw_res.SetItem(f,'respuesta',i_resp)
	dw_res.SetItem(f,'notas',i_notas)
end if

end event

event doubleclicked;string texto, band
long fila, pos
	
texto = this.GetBandAtPointer()
pos = pos(texto, "~t")
if pos > 0 then 
	band = mid(texto, 1 , pos - 1)
	fila = long (mid (texto, pos + 1 , len(texto)))
end if

if fila > 0 then
	if IsExpanded(fila,1) then
		collapse(fila,1)
	else
		Expand(fila,1)
		ScrolltoRow(fila)
	end if
end if
end event

event rowfocuschanging;if dw_res.acceptText() = -1 then Return -1

end event

event itemchanged;if GetColumnName() = 'cod_objecion' then
	string vnulo
	idw_resp.Retrieve(data)
	if dw_res.RowCount() > 0 then
		if idw_resp.Find("cod_respuesta='"+dw_res.GetItemString(dw_res.GetRow(),'cod_respuesta')+"'",1,idw_resp.RowCount()) = 0 then
			MessageBox('Atención','La respuesta no es correcta para la objeción seleccionada, debe cambiar la respuesta')
			setNull(vnulo)
			dw_res.SetItem(dw_res.GetRow(),'cod_respuesta',vnulo)
		end if
	end if
	if GetItemString(GetRow(),'nivel') = 'Factura' then
		tab_1.tp_1.dw_fac_glos.SetItem(tab_1.tp_1.dw_fac_glos.GetRow(),'cod_objecion',data)
	end if
	if GetItemNumber(GetRow(),'subitem') > 0 then
		tab_1.tp_2.dw_proc_glos.SetItem(tab_1.tp_2.dw_proc_glos.GetRow(),'cod_objecion',data)
	end if
	if GetItemNumber(GetRow(),'ndeta') > 0 then
		tab_1.tp_3.dw_item_glos.SetItem(tab_1.tp_3.dw_item_glos.GetRow(),'cod_objecion',data)
	end if
	i_cambio = TRUE
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type dw_res from datawindow within w_respu_glosas
event type integer p_itemchanged ( long p_fila )
event ue_lbuttondown pbm_lbuttondown
event ue_mouse_move pbm_mousemove
event ue_lbuttonup pbm_lbuttonup
event type integer p_change_fac ( long p_fila )
event type integer p_change_proc ( long p_fila )
event type integer p_change_sub ( long p_fila )
integer x = 37
integer y = 1692
integer width = 2135
integer height = 564
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_respuesta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer p_itemchanged(long p_fila);long ret
IF i_dw_has_focus = false THEN
	if accepttext( )=  -1 then Return -1
END IF
if RowCount() = 0 then
	datetime f_null
	setNull(f_null)
	dw_objs.SetItem(f_obj,'valor_aceptado',0)
	dw_objs.SetItem(f_obj,'estado','C')
	
	if dw_objs.getitemstring(f_obj,'nivel') = 'Factura' then
		tab_1.tp_1.dw_fac_glos.setitem(tab_1.tp_1.dw_fac_glos.GetRow(),'estado','C')
		tab_1.tp_1.dw_fac_glos.setitem(tab_1.tp_1.dw_fac_glos.GetRow(),'fecha_respuesta',f_null )
	elseif dw_objs.getitemstring(f_obj,'nivel') = 'Procedimiento' then
		tab_1.tp_2.dw_proc_glos.setitem(tab_1.tp_2.dw_proc_glos.GetRow(),'estado','C')
		tab_1.tp_2.dw_proc_glos.setitem(tab_1.tp_2.dw_proc_glos.GetRow(),'fecha_respuesta',f_null )
	elseif dw_objs.getitemstring(f_obj,'nivel') = 'Subitem' then
		tab_1.tp_3.dw_item_glos.setitem(tab_1.tp_3.dw_item_glos.GetRow(),'estado','C')
		tab_1.tp_3.dw_item_glos.setitem(tab_1.tp_3.dw_item_glos.GetRow(),'fecha_respuesta',f_null )
	end if	
else
	if f_obj=0 then 
		if p_fila=0 then  f_obj=getrow() else f_obj=p_fila 
	end if
	if dw_objs.GetItemNumber(f_obj,'valor_objecion') >= GetItemNumber(1,'total') then
		dw_objs.SetItem(f_obj,'valor_aceptado',GetItemNumber(1,'total'))
	else
		MessageBox('Atención','Excede el valor objetado')
		Return -1
	end if
end if
////
if dw_objs.GetItemString(f_obj,'nivel') = 'Factura' then
	ret = event p_change_fac(p_fila)
elseif dw_objs.GetItemString(f_obj,'nivel') = 'Procedimiento' then
	ret = event p_change_proc(p_fila)
elseif dw_objs.GetItemString(f_obj,'nivel') = 'Subitem' then
	ret = event p_change_sub(p_fila)
end if
dw_objs.Event rowfocuschanged(f_obj)
Return ret

end event

event ue_lbuttondown;i_down = TRUE

end event

event ue_mouse_move;if i_down then
//	Drag(Begin!)
	i_down = FALSE
end if
end event

event ue_lbuttonup;i_down = FALSE

end event

event type integer p_change_fac(long p_fila);long f, i, pp
double valor
if tab_1.tp_1.dw_fac_glos.RowCount() = 0 then
	tab_1.tp_1.dw_fac_glos.SetItem(tab_1.tp_1.dw_fac_glos.GetRow(),'valor_aceptado',0)
else
	if tab_1.tp_1.dw_fac_glos.GetItemNumber(tab_1.tp_1.dw_fac_glos.GetRow(),'valor_objecion') >= GetItemNumber(1,'total') then
		tab_1.tp_1.dw_fac_glos.SetItem(tab_1.tp_1.dw_fac_glos.GetRow(),'valor_aceptado',GetItemNumber(1,'total'))
		if tab_1.tp_1.dw_fac_glos.GetItemNumber(tab_1.tp_1.dw_fac_glos.GetRow(),'valor_objecion') = 0 then
			tab_1.tp_1.dw_fac_glos.SetItem(tab_1.tp_1.dw_fac_glos.GetRow(),'porcen', 0)
		else
			tab_1.tp_1.dw_fac_glos.SetItem(tab_1.tp_1.dw_fac_glos.GetRow(),'porcen', round(tab_1.tp_1.dw_fac_glos.GetItemNumber(tab_1.tp_1.dw_fac_glos.GetRow(),'valor_aceptado')/tab_1.tp_1.dw_fac_glos.GetItemNumber(tab_1.tp_1.dw_fac_glos.GetRow(),'valor_objecion')*100,i_dec_gral_car))
		end if
	else
		if p_fila > 0 then 
			SetItem(p_fila,'t_aceptado',0)
			event p_itemchanged(p_fila)
		end if
		MessageBox('Atención','Excede el valor objetado')
		Return -1
	end if
end if

f = tab_1.tp_1.dw_facts.GetRow()
valor = f_sum_obj_fact(tab_1.tp_1.dw_facts.GetItemNumber(f,'nfact'),tab_1.tp_1.dw_facts.GetItemString(f,'clugar_fact'),tab_1.tp_1.dw_facts.GetItemString(f,'tipo_fact'))
if isNull(valor) or valor > tab_1.tp_1.dw_facts.GetItemNumber(f,'valor_objecion') then
	if p_fila > 0 then 
		SetItem(p_fila,'t_aceptado',0)
		event p_itemchanged(p_fila)
	end if
	MessageBox('Atención','El valor aceptado excede el valor objetado')
	Return -1
end if
tab_1.tp_1.dw_facts.SetItem(f,'valor_aceptado',valor)

for pp = 1 to tab_1.tp_2.dw_procs.RowCount()
	tab_1.tp_2.dw_procs.ScrolltoRow(pp)
	tab_1.tp_2.dw_procs.Event RowFocuschanged(pp)
	valor = f_sum_obj_proc(tab_1.tp_1.dw_facts.GetItemNumber(f,'nfact'),tab_1.tp_1.dw_facts.GetItemString(f,'clugar_fact'),tab_1.tp_1.dw_facts.GetItemString(f,'tipo_fact'),tab_1.tp_2.dw_procs.GetItemNumber(pp,'nitem_fact'))
	if ABS(valor - tab_1.tp_2.dw_procs.GetItemNumber(pp,'valor_objecion'))  < 0.2 then valor = tab_1.tp_2.dw_procs.GetItemNumber(pp,'valor_objecion')
	if isNull(valor) or valor > tab_1.tp_2.dw_procs.GetItemNumber(pp,'valor_objecion') then
		if p_fila > 0 then 
			SetItem(p_fila,'t_aceptado',0)
			event p_itemchanged(p_fila)
		end if
		MessageBox('Atención','El valor aceptado excede el valor objetado del procedimiento ' + string(tab_1.tp_2.dw_procs.GetItemNumber(pp,'subitem')))
		Return -1
	end if
	tab_1.tp_2.dw_procs.setItem(pp,'valor_aceptado',valor)
	
	for i = 1 to tab_1.tp_3.dw_sitem.RowCount()
		valor = f_sum_obj_item(tab_1.tp_1.dw_facts.GetItemNumber(f,'nfact'),tab_1.tp_1.dw_facts.GetItemString(f,'clugar_fact'),tab_1.tp_1.dw_facts.GetItemString(f,'tipo_fact'),tab_1.tp_3.dw_sitem.GetItemNumber(i,'nitem_fact'),tab_1.tp_3.dw_sitem.GetItemNumber(i,'ndeta_fact'))
		if ABS(valor - tab_1.tp_3.dw_sitem.GetItemNumber(i,'valor_objecion'))  < 0.2 then valor = tab_1.tp_3.dw_sitem.GetItemNumber(i,'valor_objecion')
		if isNull(valor) or valor > tab_1.tp_3.dw_sitem.GetItemNumber(i,'valor_objecion') then
			if p_fila > 0 then 
				SetItem(p_fila,'t_aceptado',0)
				event p_itemchanged(p_fila)
			end if
			MessageBox('Atención','El valor aceptado excede el valor objetado del subitem' + string(tab_1.tp_3.dw_sitem.GetItemNumber(i,'ndeta')) +' y procedimiento ' + string(tab_1.tp_2.dw_procs.GetItemNumber(pp,'subitem')))
			Return -1
		end if
		tab_1.tp_3.dw_sitem.setItem(i,'valor_aceptado',valor)
	next
next
Return 0

end event

event type integer p_change_proc(long p_fila);accepttext()
long f, i
double valor
if tab_1.tp_2.dw_proc_glos.RowCount() = 0 then
	tab_1.tp_2.dw_proc_glos.SetItem(tab_1.tp_2.dw_proc_glos.GetRow(),'valor_aceptado',0)
else
	if tab_1.tp_2.dw_proc_glos.GetItemNumber(tab_1.tp_2.dw_proc_glos.GetRow(),'valor_objecion') >= GetItemNumber(1,'total') then
		tab_1.tp_2.dw_proc_glos.SetItem(tab_1.tp_2.dw_proc_glos.GetRow(),'valor_aceptado',GetItemNumber(1,'total'))
		if tab_1.tp_2.dw_proc_glos.GetItemNumber(tab_1.tp_2.dw_proc_glos.GetRow(),'valor_objecion') = 0 then
			tab_1.tp_2.dw_proc_glos.SetItem(tab_1.tp_2.dw_proc_glos.GetRow(),'porcen', 0)
		else
			tab_1.tp_2.dw_proc_glos.SetItem(tab_1.tp_2.dw_proc_glos.GetRow(),'porcen', round(tab_1.tp_2.dw_proc_glos.GetItemNumber(tab_1.tp_2.dw_proc_glos.GetRow(),'valor_aceptado')/tab_1.tp_2.dw_proc_glos.GetItemNumber(tab_1.tp_2.dw_proc_glos.GetRow(),'valor_objecion')*100,i_dec_gral_car))
		end if
	else
		MessageBox('Atención','Excede el valor objetado')
		Return -1
	end if
end if
f = tab_1.tp_2.dw_procs.GetRow()
valor = f_sum_obj_proc(tab_1.tp_2.dw_procs.GetItemNumber(f,'nfact'),tab_1.tp_2.dw_procs.GetItemString(f,'clugar_fact'),tab_1.tp_2.dw_procs.GetItemString(f,'tipo_fact'),tab_1.tp_2.dw_procs.GetItemNumber(f,'nitem_fact'))
if abs(valor - tab_1.tp_2.dw_procs.GetItemNumber(f,'valor_objecion')) < 0.2 then valor = tab_1.tp_2.dw_procs.GetItemNumber(f,'valor_objecion')
if isNull(valor) or valor > tab_1.tp_2.dw_procs.GetItemNumber(f,'valor_objecion') then
	MessageBox('Atención','El valor aceptado del procedimiento excede el valor total objetado')
	Return -1
end if
tab_1.tp_2.dw_procs.SetItem(f,'valor_aceptado',valor)

for i = 1 to tab_1.tp_3.dw_sitem.RowCount()
	valor = f_sum_obj_item(tab_1.tp_2.dw_procs.GetItemNumber(f,'nfact'),tab_1.tp_2.dw_procs.GetItemString(f,'clugar_fact'),tab_1.tp_2.dw_procs.GetItemString(f,'tipo_fact'),tab_1.tp_2.dw_procs.GetItemNumber(f,'nitem_fact'),tab_1.tp_3.dw_sitem.GetItemNumber(i,'ndeta_fact'))
	if abs(valor - tab_1.tp_3.dw_sitem.GetItemNumber(i,'valor_objecion')) < 0.2 then valor = tab_1.tp_3.dw_sitem.GetItemNumber(i,'valor_objecion')
	if isNull(valor) or valor > tab_1.tp_3.dw_sitem.GetItemNumber(i,'valor_objecion') then
		if p_fila > 0 then 
			SetItem(p_fila,'t_aceptado',0)
			event p_itemchanged(p_fila)
		end if
		MessageBox('Atención','El valor aceptado excede el valor objetado del subitem ' + string(tab_1.tp_3.dw_sitem.GetItemNumber(i,'ndeta')))
		Return -1
	end if
	tab_1.tp_3.dw_sitem.setItem(i,'valor_aceptado',valor)
next

valor = f_sum_obj_fact(tab_1.tp_2.dw_procs.GetItemNumber(f,'nfact'),tab_1.tp_2.dw_procs.GetItemString(f,'clugar_fact'),tab_1.tp_2.dw_procs.GetItemString(f,'tipo_fact'))
if abs(valor - tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'valor_objecion')) < 0.2 then valor = tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'valor_objecion')
if isNull(valor) or valor > tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'valor_objecion') then
	if p_fila > 0 then 
		SetItem(p_fila,'t_aceptado',0)
		event p_itemchanged(p_fila)
	end if
	MessageBox('Atención','El valor aceptado excede el valor objetado en la factura ' + string(tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'nfact')))
	Return -1
end if
tab_1.tp_1.dw_facts.SetItem(tab_1.tp_1.dw_facts.GetRow(),'valor_aceptado',valor)
Return 0

end event

event type integer p_change_sub(long p_fila);accepttext()
double valor
long f
if tab_1.tp_3.dw_item_glos.RowCount() = 0 then

	tab_1.tp_3.dw_item_glos.SetItem(tab_1.tp_3.dw_item_glos.GetRow(),'valor_aceptado',0)
else
	if tab_1.tp_3.dw_item_glos.GetItemNumber(tab_1.tp_3.dw_item_glos.GetRow(),'valor_objecion') >= GetItemNumber(1,'total') then
		tab_1.tp_3.dw_item_glos.SetItem(tab_1.tp_3.dw_item_glos.GetRow(),'valor_aceptado',GetItemNumber(1,'total'))
		if tab_1.tp_3.dw_item_glos.GetItemNumber(tab_1.tp_3.dw_item_glos.GetRow(),'valor_objecion') = 0 then
			tab_1.tp_3.dw_item_glos.SetItem(tab_1.tp_3.dw_item_glos.GetRow(),'porcen', 0)
		else
			tab_1.tp_3.dw_item_glos.SetItem(tab_1.tp_3.dw_item_glos.GetRow(),'porcen', round(tab_1.tp_3.dw_item_glos.GetItemNumber(tab_1.tp_3.dw_item_glos.GetRow(),'valor_aceptado')/tab_1.tp_3.dw_item_glos.GetItemNumber(tab_1.tp_3.dw_item_glos.GetRow(),'valor_objecion')*100,i_dec_gral_car))
		end if
	else
		MessageBox('Atención','Excede el valor objetado')
		Return -1
	end if
end if
f = tab_1.tp_3.dw_sitem.GetRow()
if abs(valor - tab_1.tp_3.dw_sitem.GetItemNumber(tab_1.tp_3.dw_sitem.GetRow(),'valor_objecion')) < 0.2 then valor = tab_1.tp_3.dw_sitem.GetItemNumber(tab_1.tp_3.dw_sitem.GetRow(),'valor_objecion')
valor = f_sum_obj_item(tab_1.tp_3.dw_sitem.GetItemNumber(f,'nfact'),tab_1.tp_3.dw_sitem.GetItemString(f,'clugar_fact'),tab_1.tp_3.dw_sitem.GetItemString(f,'tipo_fact'),tab_1.tp_3.dw_sitem.GetItemNumber(f,'nitem_fact'),tab_1.tp_3.dw_sitem.GetItemNumber(f,'ndeta_fact'))
if isNull(valor) or valor > tab_1.tp_3.dw_sitem.GetItemNumber(tab_1.tp_3.dw_sitem.GetRow(),'valor_objecion') then
	MessageBox('Atención','El valor aceptado excede el valor objetado')
	Return -1
end if
tab_1.tp_3.dw_sitem.SetItem(tab_1.tp_3.dw_sitem.GetRow(),'valor_aceptado', valor)

valor = f_sum_obj_proc(tab_1.tp_3.dw_sitem.GetItemNumber(f,'nfact'),tab_1.tp_3.dw_sitem.GetItemString(f,'clugar_fact'),tab_1.tp_3.dw_sitem.GetItemString(f,'tipo_fact'),tab_1.tp_3.dw_sitem.GetItemNumber(f,'nitem_fact'))
if abs(valor - tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.GetRow(),'valor_objecion')) < 0.2 then valor = tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.GetRow(),'valor_objecion')
if isNull(valor) or valor > tab_1.tp_2.dw_procs.GetItemNumber(tab_1.tp_2.dw_procs.GetRow(),'valor_objecion') then
	if p_fila > 0 then 
		SetItem(p_fila,'t_aceptado',0)
		event p_itemchanged(p_fila)
	end if
	MessageBox('Atención','El valor aceptado excede el valor objetado del procedimiento ')
	Return -1
end if
tab_1.tp_2.dw_procs.SetItem(tab_1.tp_2.dw_procs.GetRow(),'valor_aceptado',valor)

valor = f_sum_obj_fact(tab_1.tp_3.dw_sitem.GetItemNumber(f,'nfact'),tab_1.tp_3.dw_sitem.GetItemString(f,'clugar_fact'),tab_1.tp_3.dw_sitem.GetItemString(f,'tipo_fact'))
if abs(valor - tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'valor_objecion')) < 0.2 then valor = tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'valor_objecion')
if isNull(valor) or valor > tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'valor_objecion') then
	if p_fila > 0 then 
		SetItem(p_fila,'t_aceptado',0)
		event p_itemchanged(p_fila)
	end if
	MessageBox('Atención','El valor aceptado excede el valor objetado de la factura ' + string(tab_1.tp_1.dw_facts.GetItemNumber(tab_1.tp_1.dw_facts.GetRow(),'nfact')))
	Return -1
end if
tab_1.tp_1.dw_facts.SetItem(tab_1.tp_1.dw_facts.GetRow(),'valor_aceptado',valor)

Return 0

end event

event constructor;settransobject(sqlca)
getchild('cod_respuesta',idw_resp)
idw_resp.settransobject(sqlca)
getchild('usu_causante',idw_ur)
idw_ur.settransobject(sqlca)
idw_ur.setfilter("tipo='C'")
idw_ur.filter()

end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event dragleave;if GetRow() = 0 then 
	//Drag(Cancel!)
	Return 0
end if
i_cod_resp = GetItemString(GetRow(),'cod_respuesta')
i_usu = GetItemString(GetRow(),'usu_causante')
i_resp = GetItemString(GetRow(),'respuesta')
i_notas = GetItemString(GetRow(),'notas')

end event

event itemchanged;if dwo.name='cod_respuesta' then
	setitem(row,'respuesta',idw_resp.getitemstring(idw_resp.getrow(),'respuesta'))
	mle_resp.text = idw_resp.getitemstring(idw_resp.getrow(),'respuesta')
elseif dwo.name='t_aceptado' then
	post event p_itemchanged(row)
	dw_res.setcolumn('fecha')
	dw_res.setfocus()
end if
i_cambio=true


end event

event rowfocuschanged;mle_resp.text=''
mle_nots.text=''
if getrow()<1 then return
mle_resp.text=getitemstring(getrow(),'respuesta')
mle_nots.text=getitemstring(getrow(),'notas')

end event

event losefocus;i_dw_has_focus = false
event p_itemchanged(Getrow())

end event

event getfocus;//i_dw_has_focus = true
end event

