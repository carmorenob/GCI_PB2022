$PBExportHeader$w_devuelve_med.srw
forward
global type w_devuelve_med from window
end type
type dw_dev_lote from datawindow within w_devuelve_med
end type
type dw_mvto_lote from datawindow within w_devuelve_med
end type
type dw_kardexdeta from datawindow within w_devuelve_med
end type
type pb_anula from picturebutton within w_devuelve_med
end type
type dw_tip_ingres from datawindow within w_devuelve_med
end type
type dw_inf from datawindow within w_devuelve_med
end type
type tab_1 from tab within w_devuelve_med
end type
type tp_1 from userobject within tab_1
end type
type pb_enf from picturebutton within tp_1
end type
type dw_cpo from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_enf pb_enf
dw_cpo dw_cpo
end type
type tp_2 from userobject within tab_1
end type
type pb_1 from picturebutton within tp_2
end type
type pb_save from picturebutton within tp_2
end type
type cbx_1 from checkbox within tp_2
end type
type st_2 from statictext within tp_2
end type
type dw_dev from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_1 pb_1
pb_save pb_save
cbx_1 cbx_1
st_2 st_2
dw_dev dw_dev
end type
type tab_1 from tab within w_devuelve_med
tp_1 tp_1
tp_2 tp_2
end type
type dw_devoluciones from datawindow within w_devuelve_med
end type
type pb_activos from picturebutton within w_devuelve_med
end type
type st_3 from statictext within w_devuelve_med
end type
type dw_historial from datawindow within w_devuelve_med
end type
type st_1 from statictext within w_devuelve_med
end type
type gb_1 from groupbox within w_devuelve_med
end type
type gb_2 from groupbox within w_devuelve_med
end type
type pb_print from pb_report within w_devuelve_med
end type
end forward

global type w_devuelve_med from window
integer width = 5824
integer height = 2036
boolean titlebar = true
string title = "Devolución de Medicamentos"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "r_dev_med.ico"
dw_dev_lote dw_dev_lote
dw_mvto_lote dw_mvto_lote
dw_kardexdeta dw_kardexdeta
pb_anula pb_anula
dw_tip_ingres dw_tip_ingres
dw_inf dw_inf
tab_1 tab_1
dw_devoluciones dw_devoluciones
pb_activos pb_activos
st_3 st_3
dw_historial dw_historial
st_1 st_1
gb_1 gb_1
gb_2 gb_2
pb_print pb_print
end type
global w_devuelve_med w_devuelve_med

type variables
long nhosp,nentrega,l_conta
string tipo_ingres,clugar_hadm,clugar_ent
string i_mueve_kardex,i_alm_urg,i_alm_hosp,i_alm_amb,i_cdoc='DEVF',i_cdoc_urg,i_cdoc_hosp,i_cdoc_amb
string i_lug_durg,i_lug_dhosp,i_lug_damb
boolean guardo

end variables

forward prototypes
public function integer wf_mueve_kardex (string p_alm, datawindow p_dw)
end prototypes

public function integer wf_mueve_kardex (string p_alm, datawindow p_dw);dw_kardexdeta.SetTransObject(SQLCA)

long item,fila,j,ndocref,itemref
dec cant,saldo,actual,cants
dec valorprom,valor,valorprom_ant,vunit
int ano,mes,k
string codart,err,lote,conven
datetime l_fecha_ven

for j=1 to p_dw.rowcount()
	if  p_dw.getitemstring(j,'control')='1' and  p_dw.getitemstring(j,'estado')='1' then
		codart=p_dw.getitemstring(j,'codarticulo')
		cant=round(p_dw.getitemnumber(j,'cantidad'),2)
		vunit=round(p_dw.getitemnumber(j,'valor_unit'),2)
		ndocref=p_dw.getitemnumber(j,'numdoc')
		itemref=p_dw.getitemnumber(j,'item')
		p_dw.setitem(j,'estado','2')
		/////////////
		select costoprom,saldoactual into :valorprom_ant,:actual from sum_kardex where 
		codalmacen=:p_alm and codarticulo=:codart;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error leyendo costo promedio",err)
			return -1
		end if
		valorprom_ant=round(valorprom_ant,2)
		valorprom= round(((valorprom_ant * actual)+(cant * vunit))/(cant + actual),2)
		update sum_kardex set costoprom=:valorprom,saldoactual = saldoactual + :cant
		where codalmacen=:p_alm and codarticulo=:codart ;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error actualizando sum_kardex",err)
			return -1
		end if
		ano=year(today())
		mes=month(today())
		setnull(item)
		select max(item) into :item from sum_kardex_mov 
		where CODALMACEN=:p_alm and CODARTI=:codart and ANO=:ano and MES=:mes;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error leyendo item de sum_kardex_mov",err)
			return -1
		end if
		
		datetime fecha
		fecha=datetime(today())
		if isnull(item) then item =0
		item ++
		INSERT INTO sum_kardex_mov ( CODALMACEN, CODARTI, ANO, MES, ITEM, FECHA, USUARIO, CODDOCREF, CLUGARREF, NUMDOCREF, ENTRADACANT, SALIDACANT, VALORUNIT, COS_PROM_ANT,ITEMREF ) values
		(:p_alm,:codart,:ano,:mes,:item,:fecha,:usuario,:i_cdoc,:clugar,:ndocref,:cant,0,:vunit,:valorprom_ant,:itemref);
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error insertando en sum_kardex_mov",err)
			return -1
		end if
		
		if dw_mvto_lote.rowcount()>0 then
			dw_mvto_lote.setfilter("codalmacen='"+p_alm+"' and coddoc='"+i_cdoc+"' and clugar='"+clugar+"' and numdoc="+string(ndocref)+" and item="+string(itemref ))
			dw_mvto_lote.filter()
			for k=1 to dw_mvto_lote.rowcount()
				cant=dw_mvto_lote.getitemnumber(k,'cantidad')
				lote=dw_mvto_lote.getitemstring(k,'lote')
				l_fecha_ven=dw_mvto_lote.getitemdatetime(k,'fecha_venc')
				conven=dw_mvto_lote.getitemstring(k,'convenio')
				//dw_mvto_lote.setitem(k,'devuelto',dw_mvto_lote.getitemnumber(k,'dev_ori') + cant)
				update sum_lote set cantidad = cantidad + :cant where
				codalmacen=:p_alm and codarticulo=:codart and upper(lote)=upper(:lote) and upper(convenio)=upper(:conven);
				if sqlca.sqlcode=-1 then
					err=sqlca.sqlerrtext
					rollback;
					messagebox("Error Actualizando Sum_Lote",err)
					return -1
				end if
				insert into sum_lote_mov (codalmacen,codarticulo,lote,convenio,coddoc,clugar,numdoc,item,cantidad,estado,signo,fecha_venc)
				values(:p_alm,:codart,:lote,:conven,:i_cdoc,:clugar,:ndocref,:itemref,:cant,'1',1,:l_fecha_ven);
				if sqlca.sqlcode=-1 then
					err=sqlca.sqlerrtext
					rollback;
					messagebox("Error Insertando en Sum_Lote_MOV",err)
					return -1
				end if
			next
			dw_mvto_lote.setfilter('')
			dw_mvto_lote.filter()
		end if
	else
		continue
	end if
next
if dw_mvto_lote.update()=-1 then return -1
// if p_dw.rowcount()=(p_dw.getitemnumber(1,'sum_control'))/p_dw.rowcount() then
 if p_dw.rowcount()=(p_dw.getitemnumber(1,'sum_control')) then
 	dw_devoluciones.setitem(dw_devoluciones.getrow(),'estado','1')
	if dw_devoluciones.update()=-1 then return -1
end if
return 1
end function

on w_devuelve_med.create
this.dw_dev_lote=create dw_dev_lote
this.dw_mvto_lote=create dw_mvto_lote
this.dw_kardexdeta=create dw_kardexdeta
this.pb_anula=create pb_anula
this.dw_tip_ingres=create dw_tip_ingres
this.dw_inf=create dw_inf
this.tab_1=create tab_1
this.dw_devoluciones=create dw_devoluciones
this.pb_activos=create pb_activos
this.st_3=create st_3
this.dw_historial=create dw_historial
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.pb_print=create pb_print
this.Control[]={this.dw_dev_lote,&
this.dw_mvto_lote,&
this.dw_kardexdeta,&
this.pb_anula,&
this.dw_tip_ingres,&
this.dw_inf,&
this.tab_1,&
this.dw_devoluciones,&
this.pb_activos,&
this.st_3,&
this.dw_historial,&
this.st_1,&
this.gb_1,&
this.gb_2,&
this.pb_print}
end on

on w_devuelve_med.destroy
destroy(this.dw_dev_lote)
destroy(this.dw_mvto_lote)
destroy(this.dw_kardexdeta)
destroy(this.pb_anula)
destroy(this.dw_tip_ingres)
destroy(this.dw_inf)
destroy(this.tab_1)
destroy(this.dw_devoluciones)
destroy(this.pb_activos)
destroy(this.st_3)
destroy(this.dw_historial)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.pb_print)
end on

event open;if ls_pro=32 THEN RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, i_mueve_kardex)
if ls_pro=64 THEN RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, i_mueve_kardex)
if i_mueve_kardex='1' then
	if ls_pro=32 THEN	
		 RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, i_alm_urg )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, i_alm_hosp )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, i_alm_amb )
	end if
	if ls_pro=64 THEN	
		 RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, i_alm_urg )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, i_alm_hosp )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, i_alm_amb )
	end if
	
	if i_alm_urg='' or i_alm_hosp='' or i_alm_amb='' then
		messagebox("Atención","Esta máquina se encuentra configurada para manejar Kardex pero no tiene los códigos de los almacenes para esto") 
		close(this)
		return
	end if
	select clugar_entre,cod_doc_entre into :i_lug_durg,:i_cdoc_urg from sumalmacen where codalmacen=:i_alm_urg;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo documento de almacen",sqlca.sqlerrtext)
		close(this)
		return
	end if
	if isnull(i_cdoc_urg) or i_cdoc_urg='' then
		messagebox("Error leyendo documento de almacen","Esta máquina mueve kardex y no se puede hallar el documento de devolucion, revise la configuración de este")
		close(this)
		return
	end if
	select clugar_entre,cod_doc_entre into :i_lug_dhosp,:i_cdoc_hosp 
	from sumalmacen where codalmacen=:i_alm_hosp;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo documento de almacen",sqlca.sqlerrtext)
		close(this)
		return
	end if
	if isnull(i_cdoc_hosp) or i_cdoc_hosp='' then
		messagebox("Error leyendo documento de almacen","Esta máquina mueve kardex y no se puede hallar el documento de devolucion, revise la configuración de este")
		close(this)
		return
	end if
	select clugar_entre,cod_doc_entre into :i_lug_damb,:i_cdoc_amb from sumalmacen where codalmacen=:i_alm_amb;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo documento de almacen",sqlca.sqlerrtext)
		close(this)
		return
	end if
	if isnull(i_cdoc_amb) or i_cdoc_amb='' then
		messagebox("Error leyendo documento de almacen","Esta máquina mueve kardex y no se puede hallar el documento de devolucion, revise la configuración de este")
		close(this)
		return
	end if

end if
dw_tip_ingres.triggerevent(itemchanged!)
end event

type dw_dev_lote from datawindow within w_devuelve_med
boolean visible = false
integer x = 3502
integer y = 776
integer width = 1056
integer height = 72
integer taborder = 100
string title = "none"
string dataobject = "dw_mvto_lote_mod"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_mvto_lote from datawindow within w_devuelve_med
boolean visible = false
integer x = 50
integer y = 1832
integer width = 686
integer height = 88
integer taborder = 100
string title = "none"
string dataobject = "dw_sum_mto_lote_devf"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_kardexdeta from datawindow within w_devuelve_med
boolean visible = false
integer x = 2336
integer y = 788
integer width = 750
integer height = 68
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_kardexdeta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;rollback;
return 0
end event

type pb_anula from picturebutton within w_devuelve_med
integer x = 1696
integer y = 36
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "Anular Devolución"
end type

event clicked;if dw_devoluciones.RowCount() = 0 then Return
if dw_devoluciones.GetItemString(dw_devoluciones.getrow(),'estado') = '2' then
	messageBox('Aviso','El documento ' + string(dw_devoluciones.GetItemNumber(1,'numdoc')) +' ya ha sido anulado')
	return
end if
if dw_devoluciones.GetItemString(dw_devoluciones.getrow(),'contabil') = 'C' then
	messageBox('Aviso','El documento ' + string(dw_devoluciones.GetItemNumber(1,'numdoc')) +' ya ha sido llevado a contabilidad')
	return
end if
if dw_devoluciones.GetItemString(dw_devoluciones.getrow(),'estado') = '0' then
	If messageBox('Aviso','Se Anulará el documento ',QUESTION!,YESNO!,2) = 2 then Return
else
   If messageBox('Aviso','Se Anulará el documento y reversarán movimientos en Kardex. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return
	 if dw_devoluciones.GetItemString(dw_devoluciones.getrow(),'estado') = '1' then
		if f_kardexentanula(dw_devoluciones.GetItemString(dw_devoluciones.getrow(),'coddoc'),dw_devoluciones.GetItemString(dw_devoluciones.getrow(),'clugar'),dw_devoluciones.GetItemNumber(dw_devoluciones.getrow(),'numdoc'),dw_devoluciones.GetItemString(dw_devoluciones.getrow(),'codalmacen')) = -1 then
			rollback;
			Return -1
		end if
	end if
end if

long j,conta_os,nitem,norden,item_os,atendido
dec cant
string clug_os,err,codalm,doc

for j=1 to tab_1.tp_1.dw_cpo.rowcount()
	conta_os=tab_1.tp_1.dw_cpo.getitemnumber(j,'oscontador')
	clug_os=tab_1.tp_1.dw_cpo.getitemstring(j,'osclugar')
	norden=tab_1.tp_1.dw_cpo.getitemnumber(j,'osnsolicitud')
	item_os=tab_1.tp_1.dw_cpo.getitemnumber(j,'ositem')
	cant=tab_1.tp_1.dw_cpo.getitemnumber(j,'cantidad')
	atendido=tab_1.tp_1.dw_cpo.getitemnumber(j,'atendido')
	//actualiza oscuerpo	
	update oscuerpo set devuelta=devuelta -:cant 
	where contador=:conta_os and clugar=:clug_os and nsolicitud=:norden and item=:item_os;// and secuencia=:secu; 
	if sqlca.sqlcode=-1 then 
		err=sqlca.sqlerrtext
		rollback;
		messagebox("Error actualizando oscuerpo",err)
	end if
	tab_1.tp_1.dw_cpo.SetItem(j,'Estado','2')
	//tab_1.tp_1.dw_cpo.SetItem(j,'atendido', atendido - cant)
	doc=tab_1.tp_1.dw_cpo.getitemstring(j,'coddoc')
	clug_os=tab_1.tp_1.dw_cpo.getitemstring(j,'clugar')
	norden=tab_1.tp_1.dw_cpo.getitemnumber(j,'numdoc')
	item_os=tab_1.tp_1.dw_cpo.getitemnumber(j,'item')
// devuelve campo devuelta en lote_mv
 if g_motor='postgres' then
	UPDATE sum_mvto_lote SET devuelto = sum_mvto_lote.devuelto - :cant
	FROM 
	   sum_mvto_lote AS sum_mvto_lote_1 
	   INNER JOIN sum_mvto_cpo ON (sum_mvto_lote_1.item = sum_mvto_cpo.item) AND (sum_mvto_lote_1.numdoc = sum_mvto_cpo.numdoc) 
	   AND (sum_mvto_lote_1.clugar = sum_mvto_cpo.clugar) AND (sum_mvto_lote_1.coddoc = sum_mvto_cpo.coddoc)
	WHERE 
	   (((sum_mvto_lote_1.coddoc)=:doc) AND ((sum_mvto_lote_1.clugar)=:clug_os)
	   AND ((sum_mvto_lote_1.numdoc)=:norden) AND ((sum_mvto_lote_1.item)=:item_os))
	   AND ((sum_mvto_cpo.item_ori = sum_mvto_lote.item) AND (sum_mvto_cpo.numdoc_ori = sum_mvto_lote.numdoc) 
	   AND (sum_mvto_cpo.clugar_ori = sum_mvto_lote.clugar) AND (sum_mvto_cpo.coddoc_ori = sum_mvto_lote.coddoc)) ;
	if sqlca.sqlcode=-1 then 
		err=sqlca.sqlerrtext
		rollback;
		messagebox("Error actualizando SUM_MVTO_LOTE",err)
	end if
	//devuelve atendido en mvto_cpo
	UPDATE sum_mvto_cpo SET atendido = sum_mvto_cpo.atendido - :cant
	FROM sum_mvto_cpo AS sum_mvto_cpo_1 
	WHERE 
		(((sum_mvto_cpo_1.coddoc)=:doc) AND ((sum_mvto_cpo_1.clugar)=:clug_os) AND ((sum_mvto_cpo_1.numdoc)=:norden) 
		 AND ((sum_mvto_cpo_1.item)=:item_os))
		 AND ((sum_mvto_cpo_1.item_ori = sum_mvto_cpo.item) AND (sum_mvto_cpo_1.numdoc_ori = sum_mvto_cpo.numdoc) 
		 AND (sum_mvto_cpo_1.clugar_ori = sum_mvto_cpo.clugar) AND (sum_mvto_cpo_1.coddoc_ori = sum_mvto_cpo.coddoc)) ;
	if sqlca.sqlcode=-1 then 
		err=sqlca.sqlerrtext
		rollback;
		messagebox("Error actualizando sum_vto_cpo",err)
	end if
 else
	 if g_motor='sql' then
			UPDATE  sum_mvto_lote SET sum_mvto_lote.devuelto =sum_mvto_lote.devuelto- :cant
			FROM (sum_mvto_lote INNER JOIN sum_mvto_cpo ON (sum_mvto_lote.CODDOC = sum_mvto_cpo.CODDOC_ORI) AND (sum_mvto_lote.CLUGAR = sum_mvto_cpo.CLUGAR_ORI) AND (sum_mvto_lote.NUMDOC = sum_mvto_cpo.NUMDOC_ORI) AND (sum_mvto_lote.ITEM = sum_mvto_cpo.ITEM_ORI)) INNER JOIN sum_mvto_lote AS sum_mvto_lote_1 ON (sum_mvto_cpo.ITEM = sum_mvto_lote_1.ITEM) AND (sum_mvto_cpo.NUMDOC = sum_mvto_lote_1.NUMDOC) AND (sum_mvto_cpo.CLUGAR = sum_mvto_lote_1.CLUGAR) AND (sum_mvto_cpo.CODDOC = sum_mvto_lote_1.CODDOC) 
			WHERE 
				(((sum_mvto_lote_1.coddoc)=:doc) AND ((sum_mvto_lote_1.clugar)=:clug_os) AND 
				((sum_mvto_lote_1.numdoc)=:norden) AND ((sum_mvto_lote_1.item)=:item_os));
			if sqlca.sqlcode=-1 then 
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando SUM_MVTO_LOTE",err)
			end if
			//devuelve atendido en mvto_cpo
			UPDATE sum_mvto_cpo SET sum_mvto_cpo.atendido = sum_mvto_cpo.atendido- :cant
			FROM sum_mvto_cpo INNER JOIN sum_mvto_cpo AS sum_mvto_cpo_1 ON (sum_mvto_cpo.CODDOC = sum_mvto_cpo_1.CODDOC_ORI) AND (sum_mvto_cpo.CLUGAR = sum_mvto_cpo_1.CLUGAR_ORI) AND (sum_mvto_cpo.NUMDOC = sum_mvto_cpo_1.NUMDOC_ORI) AND (sum_mvto_cpo.ITEM = sum_mvto_cpo_1.ITEM_ORI) 
			WHERE 
			(((sum_mvto_cpo_1.coddoc)=:doc) AND ((sum_mvto_cpo_1.clugar)=:clug_os) 
			AND ((sum_mvto_cpo_1.numdoc)=:norden) AND ((sum_mvto_cpo_1.item)=:item_os));
			if sqlca.sqlcode=-1 then 
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando sum_vto_cpo",err)
			end if
	 else
		UPDATE
			(sum_mvto_lote INNER JOIN sum_mvto_cpo ON (sum_mvto_lote.CODDOC = sum_mvto_cpo.CODDOC_ORI) AND (sum_mvto_lote.CLUGAR = sum_mvto_cpo.CLUGAR_ORI) AND (sum_mvto_lote.NUMDOC = sum_mvto_cpo.NUMDOC_ORI) AND (sum_mvto_lote.ITEM = sum_mvto_cpo.ITEM_ORI)) INNER JOIN sum_mvto_lote AS sum_mvto_lote_1 ON (sum_mvto_cpo.ITEM = sum_mvto_lote_1.ITEM) AND (sum_mvto_cpo.NUMDOC = sum_mvto_lote_1.NUMDOC) AND (sum_mvto_cpo.CLUGAR = sum_mvto_lote_1.CLUGAR) AND (sum_mvto_cpo.CODDOC = sum_mvto_lote_1.CODDOC) 
		SET sum_mvto_lote.devuelto =sum_mvto_lote.devuelto- :cant
		WHERE 
			(((sum_mvto_lote_1.coddoc)=:doc) AND ((sum_mvto_lote_1.clugar)=:clug_os) AND 
			((sum_mvto_lote_1.numdoc)=:norden) AND ((sum_mvto_lote_1.item)=:item_os));
		if sqlca.sqlcode=-1 then 
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error actualizando SUM_MVTO_LOTE",err)
		end if
	//devuelve atendido en mvto_cpo
		UPDATE sum_mvto_cpo INNER JOIN sum_mvto_cpo AS sum_mvto_cpo_1 ON (sum_mvto_cpo.CODDOC = sum_mvto_cpo_1.CODDOC_ORI) AND (sum_mvto_cpo.CLUGAR = sum_mvto_cpo_1.CLUGAR_ORI) AND (sum_mvto_cpo.NUMDOC = sum_mvto_cpo_1.NUMDOC_ORI) AND (sum_mvto_cpo.ITEM = sum_mvto_cpo_1.ITEM_ORI) 
		SET sum_mvto_cpo.atendido = sum_mvto_cpo.atendido- :cant
		WHERE 
			(((sum_mvto_cpo_1.coddoc)=:doc) AND ((sum_mvto_cpo_1.clugar)=:clug_os) 
			AND ((sum_mvto_cpo_1.numdoc)=:norden) AND ((sum_mvto_cpo_1.item)=:item_os));
		if sqlca.sqlcode=-1 then 
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error actualizando sum_vto_cpo",err)
		end if
	end if
end if
next
if tab_1.tp_1.dw_cpo.Update() = 1 then
	commit;
else
	rollback;
	return -1
end if
dw_devoluciones.SetItem(dw_devoluciones.getrow(),'Estado','2')
dw_devoluciones.SetItem(dw_devoluciones.getrow(),'anulado',usuario)   
dw_devoluciones.SetItem(dw_devoluciones.getrow(),'fechaanula',now())   
if dw_devoluciones.Update() = 1 then
	commit;
else
	rollback;
	return -1
end if

dw_historial.triggerevent(rowfocuschanged!)
end event

type dw_tip_ingres from datawindow within w_devuelve_med
integer x = 393
integer y = 56
integer width = 1074
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
modify('codtingre.width=654')
datawindowchild dw_lista
getchild('codtingre',dw_lista)
dw_lista.setfilter('codtingre <>"1"')
dw_lista.modify('descripcion.width=654')
insertrow(1)
string temp
if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "TINGRESO", Regstring!, temp )
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "TINGRESO", Regstring!, temp )
if temp='' then setnull(temp)
setitem(1,1,temp)
post event itemchanged(1,object.codtingre,temp)
end event

event itemchanged;string cdoc,clug_doc

dw_historial.reset()
dw_inf.reset()
dw_devoluciones.reset()
accepttext()
tipo_ingres=gettext()
choose case tipo_ingres
	case '2'
		cdoc=i_cdoc_urg
		clug_doc=i_lug_durg
	case '3','7'
		cdoc=i_cdoc_hosp
		clug_doc=i_lug_dhosp
	case '4'
		cdoc=i_cdoc_amb
		clug_doc=i_lug_damb
	case else
		return
end choose
if i_mueve_kardex<>'1' then
	cdoc='EF'
	clug_doc=clugar
end if
dw_historial.retrieve(tipdoc,docu,tipo_ingres,clugar)

end event

type dw_inf from datawindow within w_devuelve_med
integer x = 18
integer y = 636
integer width = 5801
integer height = 132
string title = "none"
string dataobject = "dw_inf_emp_cama"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

type tab_1 from tab within w_devuelve_med
integer x = 37
integer y = 756
integer width = 5746
integer height = 1084
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
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5710
integer height = 956
long backcolor = 67108864
string text = "Detalle de la Devolución"
long tabtextcolor = 33554432
string picturename = "det_med.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra los elementos pendientes de entregar de todas las Ordenes de Servicio"
pb_enf pb_enf
dw_cpo dw_cpo
end type

on tp_1.create
this.pb_enf=create pb_enf
this.dw_cpo=create dw_cpo
this.Control[]={this.pb_enf,&
this.dw_cpo}
end on

on tp_1.destroy
destroy(this.pb_enf)
destroy(this.dw_cpo)
end on

type pb_enf from picturebutton within tp_1
integer x = 5545
integer y = 792
integer width = 142
integer height = 124
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Devolución"
end type

event clicked;if f_permiso_boton(this,'DEVF')=0 then return -1
if dw_cpo.rowcount()=0 then return
if dw_devoluciones.GetItemString(dw_devoluciones.getrow(),'estado') = '2' then
	messageBox('Aviso','El documento ' + string(dw_devoluciones.GetItemNumber(1,'numdoc')) +' ya ha sido anulado')
	return
end if

int j
long item=0
for  j=1 to dw_cpo.rowcount()
	if dw_cpo.getitemstring(j,'control')='1'  then 
		dw_cpo.setitem(j,'control','1')
		if dw_cpo.getitemstring(j,'estado')<>'2' then
			dw_cpo.setitem(j,'estado','1')
		end if
	end if
next
if dw_cpo.update()=-1 then goto error
commit;
if wf_mueve_kardex(dw_devoluciones.getitemstring(dw_devoluciones.getrow(),'codalmacen'),dw_cpo)=-1 then
	goto error
end if
return 1
commit;
error:
rollback;
dw_historial.triggerevent(rowfocuschanged!)

end event

type dw_cpo from datawindow within tp_1
integer x = 32
integer y = 40
integer width = 5477
integer height = 880
integer taborder = 20
string title = "none"
string dataobject = "dw_dev_far_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5710
integer height = 956
long backcolor = 67108864
string text = " Nueva Devolución"
long tabtextcolor = 33554432
string picturename = "llevar.ico"
long picturemaskcolor = 536870912
string powertiptext = "Cargar las devoluciones al Kardex"
pb_1 pb_1
pb_save pb_save
cbx_1 cbx_1
st_2 st_2
dw_dev dw_dev
end type

on tp_2.create
this.pb_1=create pb_1
this.pb_save=create pb_save
this.cbx_1=create cbx_1
this.st_2=create st_2
this.dw_dev=create dw_dev
this.Control[]={this.pb_1,&
this.pb_save,&
this.cbx_1,&
this.st_2,&
this.dw_dev}
end on

on tp_2.destroy
destroy(this.pb_1)
destroy(this.pb_save)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.dw_dev)
end on

type pb_1 from picturebutton within tp_2
integer x = 5545
integer y = 76
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
string picturename = "insertar.gif"
alignment htextalign = left!
end type

event clicked;tab_1.tp_2.dw_dev.retrieve(l_conta,clugar_hadm)
dw_mvto_lote.reset()
end event

type pb_save from picturebutton within tp_2
integer x = 5550
integer y = 204
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Devolución"
end type

event clicked;if dw_dev.rowcount()=0 then return

if dw_dev.accepttext()=-1 then 
	dw_dev.setfocus()
	return
end if
if dw_dev.getitemnumber(1,'devolver')=0 then
	messagebox("Atención",'No ha seleccionado ningun elemento para devolver')
	return
end if
long j,k,donde,item=0,ndoc,nent,item_ent,conta_os,nitem,norden,item_os,donde1
dec cant
string clug_ent,cdoc_ent,codalm,clug_os,cod_art,lote,err,conven
datetime l_fecha_ven
datawindow dw_cpo
dw_cpo=tab_1.tp_1.dw_cpo
ndoc=f_trae_ndoc(i_cdoc,clugar,'Devolución de Farmacia (DEVF)')
if ndoc=-1 then 
	rollback;
	return
end if
dw_devoluciones.insertrow(1)
dw_devoluciones.setitem(1,'coddoc',i_cdoc)
dw_devoluciones.setitem(1,'clugar',clugar)
dw_devoluciones.setitem(1,'numdoc',ndoc)
dw_devoluciones.setitem(1,'fecha',datetime(today(),now()))
dw_devoluciones.setitem(1,'usuario',usuario)
dw_devoluciones.setitem(1,'estado','0')
dw_devoluciones.setitem(1,'codalmacen',dw_dev.getitemstring(1,'codalmacen'))
dw_cpo.reset()
item=0
for j=1 to dw_dev.rowcount()
	 if dw_dev.getitemnumber(j,'selec')=1 then 
		item ++
		donde=dw_cpo.insertrow(0)
		dw_cpo.setitem(donde,'coddoc',i_cdoc)
		dw_cpo.setitem(donde,'numdoc',ndoc)
		dw_cpo.setitem(donde,'clugar',clugar)
		dw_cpo.setitem(donde,'item',item)
		cdoc_ent=dw_dev.getitemstring(j,'cdoc_entrega')
		clug_ent=dw_dev.getitemstring(j,'clug_entrega')
		nent=dw_dev.getitemnumber(j,'ndoc_entrega')
		cod_art=dw_dev.getitemstring(j,'codarti')
		item_ent=dw_dev.getitemnumber(j,'item_entrega')
		dw_cpo.setitem(donde,'codarticulo',cod_art)
		dw_cpo.setitem(donde,'coddoc_ori',cdoc_ent)
		dw_cpo.setitem(donde,'clugar_ori',clug_ent)
		dw_cpo.setitem(donde,'numdoc_ori',nent)
		dw_cpo.setitem(donde,'item_ori',item_ent)
		dw_cpo.setitem(donde,'valor_unit',dw_dev.getitemnumber(j,'valorunit'))
		dw_cpo.setitem(donde,'codgenerico',dw_dev.getitemstring(j,'codgenerico'))
		dw_cpo.setitem(donde,'cantidad',dw_dev.getitemnumber(j,'devuelve'))
		dw_cpo.setitem(donde,'estado','0')
		dw_cpo.setitem(donde,'control','0')		
		conta_os=dw_dev.getitemnumber(j,'contador_os')
		clug_os=dw_dev.getitemstring(j,'clugar_os')
		norden=dw_dev.getitemnumber(j,'nsolicitud_os')
		item_os=dw_dev.getitemnumber(j,'item_os')
		cant=dw_dev.getitemnumber(j,'devuelve')
		codalm=dw_dev.getitemstring(j,'codalmacen')
		if not isnull(dw_dev.getitemstring(j,'lote')) then
			donde1=dw_dev_lote.insertrow(0)
			dw_dev_lote.setitem(donde1,'codalmacen',codalm)
			dw_dev_lote.setitem(donde1,'codarticulo',cod_art)
			dw_dev_lote.setitem(donde1,'lote',dw_dev.getitemstring(j,'lote'))	
			dw_dev_lote.setitem(donde1,'convenio',dw_dev.getitemstring(j,'convenio'))			
			dw_dev_lote.setitem(donde1,'coddoc',i_cdoc)
			dw_dev_lote.setitem(donde1,'numdoc',ndoc)
			dw_dev_lote.setitem(donde1,'clugar',clugar)
			dw_dev_lote.setitem(donde1,'item',item)
			dw_dev_lote.setitem(donde1,'fecha_venc',dw_dev.getitemdatetime(j,'fecha_venc'))	
			dw_dev_lote.setitem(donde1,'cantidad',dw_dev.getitemnumber(j,'devuelve'))
			dw_dev_lote.setitem(donde1,'estado','1')		
			dw_dev_lote.setitem(donde1,'signo',1)		
		end if
		update sum_mvto_cpo set atendido=atendido + :cant where
		coddoc=:cdoc_ent and clugar=:clug_ent and numdoc=:nent and item=:item_ent;
		if sqlca.sqlcode=-1 then 
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error actualizando Sum_mvto_cpo",err)
			goto error
		end if
		update oscuerpo set devuelta=devuelta +:cant where
		contador=:conta_os and clugar=:clug_os and nsolicitud=:norden and item=:item_os;
		if sqlca.sqlcode=-1 then 
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error actualizando oscuerpo",err)
			goto error
		end if
	end if
next
if dw_devoluciones.update()=-1 then goto error
if dw_cpo.update()=-1 then goto error
if dw_dev_lote.update()=-1 then goto error
commit;
if cbx_1.checked and pb_print.enabled then
	any par[3]
	par[1]=i_cdoc
	par[2]=clugar
	par[3]=ndoc
	pb_print.imprimir(par,'','0')
end if
dw_historial.triggerevent(rowfocuschanged!)
if isvalid(w_new_at_os) then
	w_new_at_os.uo_1.dw_oscab.event rowfocuschanged(w_new_at_os.uo_1.dw_oscab.getrow())
end if
return 1
commit;
error:
rollback;
dw_historial.triggerevent(rowfocuschanged!)

end event

type cbx_1 from checkbox within tp_2
integer x = 4485
integer width = 544
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir Devolución"
end type

type st_2 from statictext within tp_2
integer x = 9
integer width = 1019
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Entregas de la Admisión por Orden:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_dev from datawindow within tp_2
event p_itemchanged ( long p_fila )
integer x = 5
integer y = 76
integer width = 5522
integer height = 876
integer taborder = 60
string title = "none"
string dataobject = "dw_new_devoluciones1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(long p_fila);accepttext()

end event

event constructor;settransobject(sqlca)

end event

event itemchanged;post event p_itemchanged(row)

end event

event buttonclicked;long l_hora,l_j
string ret

for l_j=1 to rowcount()
	if dwo.text='Selec' then
		if getitemnumber(l_j,'selec')<>1 then 
			setrow(l_j)
			setitem(l_j,'selec',1)
		end if
	else
		setitem(l_j,'selec',0)
	end if
next
if dwo.text='Selec' then modify(string(dwo.name)+'.text="No Selec."') else 	modify(string(dwo.name)+'.text="Selec"')

end event

type dw_devoluciones from datawindow within w_devuelve_med
integer x = 3799
integer y = 72
integer width = 1929
integer height = 528
integer taborder = 40
string title = "none"
string dataobject = "dw_devuelve_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_1.tp_1.dw_cpo.reset()
if getrow()<1 then return
nentrega=getitemnumber(getrow(),"numdoc")
if isnull(nentrega) then return
clugar_ent=getitemstring(getrow(),"clugar")
tab_1.tp_1.dw_cpo.retrieve(i_cdoc,clugar,nentrega)
dw_mvto_lote.retrieve(i_cdoc,clugar,nentrega)

end event

event dberror;rollback;
return 0
end event

type pb_activos from picturebutton within w_devuelve_med
event mousemove pbm_mousemove
integer x = 1531
integer y = 32
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "buscar.GIF"
string disabledname = "d_buscar.GIF"
alignment htextalign = left!
string powertiptext = "Mostrar Pacientes con Admisiones Activas"
end type

event clicked;openwithparm(w_hospitaliz,dw_tip_ingres.getitemstring(1,1))
end event

type st_3 from statictext within w_devuelve_med
integer x = 55
integer y = 168
integer width = 3552
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " Ingresos del Paciente"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_historial from datawindow within w_devuelve_med
integer x = 55
integer y = 228
integer width = 3561
integer height = 356
integer taborder = 50
string title = "none"
string dataobject = "dw_admi_pasa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;dw_devoluciones.reset()
tab_1.tp_2.dw_dev.reset()
//tab_1.tp_2.dw_dev_lote.reset()
if getrow()<1 then return
nhosp=getitemnumber(getrow(),"nh")
clugar_hadm=getitemstring(getrow(),"clugar")
l_conta=getitemnumber(getrow(),"contador")
dw_inf.retrieve(nhosp,clugar_hadm,tipo_ingres)
dw_devoluciones.reset()
dw_devoluciones.retrieve(nhosp,clugar_hadm,tipo_ingres)
if i_mueve_kardex='1' then
	int l_ctos
	select count(sum_mvto_cab.numdoc) into :l_ctos 
	from (sum_mvto_cab inner join sum_mvto_cpo on (sum_mvto_cab.numdoc = sum_mvto_cpo.numdoc) and (sum_mvto_cab.clugar = sum_mvto_cpo.clugar) and (sum_mvto_cab.coddoc = sum_mvto_cpo.coddoc)) inner join (((sum_mvto_cpo as sum_mvto_cpo_1 inner join oscuerpo on (sum_mvto_cpo_1.item_os = oscuerpo.item) and (sum_mvto_cpo_1.nsolicitud_os = oscuerpo.nsolicitud) and (sum_mvto_cpo_1.clugar_os = oscuerpo.clugar) and (sum_mvto_cpo_1.contador_os = oscuerpo.contador)) inner join hospadmi on (oscuerpo.clugar = hospadmi.clugar_his) and (oscuerpo.contador = hospadmi.contador)) inner join pacientes on (hospadmi.documento = pacientes.documento) and (hospadmi.tipodoc = pacientes.tipodoc)) on (sum_mvto_cpo.item_ori = sum_mvto_cpo_1.item) and (sum_mvto_cpo.numdoc_ori = sum_mvto_cpo_1.numdoc) and (sum_mvto_cpo.clugar_ori = sum_mvto_cpo_1.clugar) and (sum_mvto_cpo.coddoc_ori = sum_mvto_cpo_1.coddoc)
	where (((sum_mvto_cab.coddoc)='DEVF') and ((sum_mvto_cpo.control)='0') and ((sum_mvto_cab.estado)<>'2') and ((hospadmi.nh)=:nhosp) and ((hospadmi.clugar)=:clugar_hadm) and ((hospadmi.codtingre)=:tipo_ingres));
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo verificación pendientes",sqlca.sqlerrtext)
		return
	end if
	if   l_ctos>0 then
		messagebox("Atención",'Paciente con Devoluciones Pendientes por confirmar')	
	end if
end if
end event

type st_1 from statictext within w_devuelve_med
integer x = 59
integer y = 68
integer width = 352
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Ingreso:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_devuelve_med
integer x = 3721
integer y = 12
integer width = 2043
integer height = 604
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Devoluciones de la Admisión"
end type

type gb_2 from groupbox within w_devuelve_med
integer x = 27
integer width = 3621
integer height = 608
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Admisiones del paciente"
end type

type pb_print from pb_report within w_devuelve_med
integer x = 1874
integer y = 36
integer taborder = 70
boolean bringtotop = true
string powertiptext = "Reimprimir Devolución"
string cod_rep = "DEVF"
string nombre_rep = "Devolución de Farmacia"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if dw_devoluciones.rowcount()=0 then return
any par[3]
par[1]=i_cdoc
par[2]=dw_devoluciones.getitemstring(dw_devoluciones.getrow(),'clugar')
par[3]=dw_devoluciones.getitemnumber(dw_devoluciones.getrow(),'numdoc')
pb_print.imprimir(par,'','0')
end event

event constructor;call super::constructor;inicia('documento!',i_cdoc,clugar)
end event

