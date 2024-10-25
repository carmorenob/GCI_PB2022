$PBExportHeader$w_entrega_med.srw
forward
global type w_entrega_med from window
end type
type st_2 from statictext within w_entrega_med
end type
type sle_1 from singlelineedit within w_entrega_med
end type
type dw_lote_mov from datawindow within w_entrega_med
end type
type pb_1 from picturebutton within w_entrega_med
end type
type dw_tip_ingres from datawindow within w_entrega_med
end type
type dw_inf from datawindow within w_entrega_med
end type
type tab_1 from tab within w_entrega_med
end type
type tabpage_1 from userobject within tab_1
end type
type rb_2 from radiobutton within tabpage_1
end type
type rb_1 from radiobutton within tabpage_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type pb_new from picturebutton within tabpage_1
end type
type dw_medica from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
rb_2 rb_2
rb_1 rb_1
cbx_1 cbx_1
pb_new pb_new
dw_medica dw_medica
end type
type tabpage_2 from userobject within tab_1
end type
type pb_print from pb_report within tabpage_2
end type
type pb_anular from picturebutton within tabpage_2
end type
type dw_ent_det from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
pb_print pb_print
pb_anular pb_anular
dw_ent_det dw_ent_det
end type
type tab_1 from tab within w_entrega_med
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_entregas from datawindow within w_entrega_med
end type
type pb_activos from picturebutton within w_entrega_med
end type
type st_3 from statictext within w_entrega_med
end type
type dw_historial from datawindow within w_entrega_med
end type
type st_1 from statictext within w_entrega_med
end type
type gb_1 from groupbox within w_entrega_med
end type
type gb_2 from groupbox within w_entrega_med
end type
end forward

global type w_entrega_med from window
integer width = 5847
integer height = 2108
boolean titlebar = true
string title = "Entrega de Medicamentos"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "r_entrega_med.ico"
st_2 st_2
sle_1 sle_1
dw_lote_mov dw_lote_mov
pb_1 pb_1
dw_tip_ingres dw_tip_ingres
dw_inf dw_inf
tab_1 tab_1
dw_entregas dw_entregas
pb_activos pb_activos
st_3 st_3
dw_historial dw_historial
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_entrega_med w_entrega_med

type variables
long nhosp,i_nentrega
string tipo_ingres,clugar_hadm,i_clugar_ent
string i_mueve_kardex,i_alm_urg,i_alm_hosp,i_alm_amb,i_cdoc,i_cdoc_urg,i_cdoc_hosp,i_cdoc_amb
string i_lug_durg,i_lug_dhosp,i_lug_damb,l_desalm


end variables

on w_entrega_med.create
this.st_2=create st_2
this.sle_1=create sle_1
this.dw_lote_mov=create dw_lote_mov
this.pb_1=create pb_1
this.dw_tip_ingres=create dw_tip_ingres
this.dw_inf=create dw_inf
this.tab_1=create tab_1
this.dw_entregas=create dw_entregas
this.pb_activos=create pb_activos
this.st_3=create st_3
this.dw_historial=create dw_historial
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_2,&
this.sle_1,&
this.dw_lote_mov,&
this.pb_1,&
this.dw_tip_ingres,&
this.dw_inf,&
this.tab_1,&
this.dw_entregas,&
this.pb_activos,&
this.st_3,&
this.dw_historial,&
this.st_1,&
this.gb_1,&
this.gb_2}
end on

on w_entrega_med.destroy
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.dw_lote_mov)
destroy(this.pb_1)
destroy(this.dw_tip_ingres)
destroy(this.dw_inf)
destroy(this.tab_1)
destroy(this.dw_entregas)
destroy(this.pb_activos)
destroy(this.st_3)
destroy(this.dw_historial)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
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
	select clugar_entre,cod_doc_entre,descripcion into :i_lug_durg,:i_cdoc_urg,:l_desalm 
	from sumalmacen where codalmacen=:i_alm_urg;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo documento de almacen",sqlca.sqlerrtext)
		close(this)
		return
	end if
	if isnull(i_cdoc_urg) or i_cdoc_urg='' then
		messagebox("Error leyendo documento de almacen","Esta máquina mueve kardex y no se puede hallar el documento de entrega, revise la configuración de este")
		close(this)
		return
	end if
	select clugar_entre,cod_doc_entre,descripcion into :i_lug_dhosp,:i_cdoc_hosp ,:l_desalm
	from sumalmacen where codalmacen=:i_alm_hosp;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo documento de almacen",sqlca.sqlerrtext)
		close(this)
		return
	end if
	if isnull(i_cdoc_hosp) or i_cdoc_hosp='' then
		messagebox("Error leyendo documento de almacen","Esta máquina mueve kardex y no se puede hallar el documento de entrega, revise la configuración de este")
		close(this)
		return
	end if
	select clugar_entre,cod_doc_entre,descripcion into :i_lug_damb,:i_cdoc_amb,:l_desalm 
	from sumalmacen where codalmacen=:i_alm_amb;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo documento de almacen",sqlca.sqlerrtext)
		close(this)
		return
	end if
	if isnull(i_cdoc_amb) or i_cdoc_amb='' then
		messagebox("Error leyendo documento de almacen","Esta máquina mueve kardex y no se puede hallar el documento de entrega, revise la configuración de este")
		close(this)
		return
	end if
//	if g_motor='sql' then
//		tab_1.tabpage_1.dw_medica.dataobject='dw_entrega_med_kard2_sql'
//	else
		tab_1.tabpage_1.dw_medica.dataobject='dw_entrega_med_kard2'
//	end if
	tab_1.tabpage_1.dw_medica.settransobject(sqlca)
end if
sle_1.text=l_desalm
dw_tip_ingres.triggerevent(itemchanged!)
end event

type st_2 from statictext within w_entrega_med
integer x = 1888
integer y = 736
integer width = 224
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacén"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_entrega_med
integer x = 2112
integer y = 736
integer width = 1317
integer height = 60
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

type dw_lote_mov from datawindow within w_entrega_med
boolean visible = false
integer x = 3877
integer y = 728
integer width = 635
integer height = 92
integer taborder = 70
string title = "none"
string dataobject = "dw_lote_mov"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type pb_1 from picturebutton within w_entrega_med
integer x = 1696
integer y = 28
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar2.gif"
string disabledname = "d_buscar2.gif"
alignment htextalign = left!
string powertiptext = "Buscar por Entregas Anteriores"
end type

event clicked;open(w_busca_entrega_med)
end event

type dw_tip_ingres from datawindow within w_entrega_med
integer x = 393
integer y = 56
integer width = 1083
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
dw_entregas.reset()
tab_1.tabpage_2.dw_ent_det.reset()
tab_1.tabpage_1.dw_medica.reset()
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
tab_1.tabpage_2.pb_print.inicia('documento!',cdoc,clug_doc)
end event

type dw_inf from datawindow within w_entrega_med
integer x = 32
integer y = 600
integer width = 5792
integer height = 132
string title = "none"
string dataobject = "dw_inf_emp_cama"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

type tab_1 from tab within w_entrega_med
integer x = 32
integer y = 736
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
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5710
integer height = 956
long backcolor = 67108864
string text = "Pendientes de Entregar"
long tabtextcolor = 33554432
string picturename = "entrega_med.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra los elementos pendientes de entregar de todas las Ordenes de Servicio"
rb_2 rb_2
rb_1 rb_1
cbx_1 cbx_1
pb_new pb_new
dw_medica dw_medica
end type

on tabpage_1.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cbx_1=create cbx_1
this.pb_new=create pb_new
this.dw_medica=create dw_medica
this.Control[]={this.rb_2,&
this.rb_1,&
this.cbx_1,&
this.pb_new,&
this.dw_medica}
end on

on tabpage_1.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cbx_1)
destroy(this.pb_new)
destroy(this.dw_medica)
end on

type rb_2 from radiobutton within tabpage_1
integer x = 786
integer y = 8
integer width = 517
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salas Quirúrgicas"
end type

event clicked;if i_mueve_kardex='1' then
	if dw_medica.dataobject<>"dw_entrega_med_kard2" then 
		dw_medica.dataobject="dw_entrega_med_kard2"
		dw_medica.settransobject(sqlca)
	end if
	choose case dw_tip_ingres.getitemstring(1,1)
		case '2'
			tab_1.tabpage_1.dw_medica.retrieve(nhosp,clugar_hadm,'X',i_alm_urg)
		case '3','7'
			tab_1.tabpage_1.dw_medica.retrieve(nhosp,clugar_hadm,'X',i_alm_hosp)
		case '4'
			tab_1.tabpage_1.dw_medica.retrieve(nhosp,clugar_hadm,'X',i_alm_amb)
	end choose
else
	if dw_medica.dataobject<>"dw_entrega_med2" then
		dw_medica.dataobject="dw_entrega_med2"
		dw_medica.settransobject(sqlca)
	end if
	dw_medica.retrieve(nhosp,clugar_hadm,'X')
end if



end event

type rb_1 from radiobutton within tabpage_1
integer x = 50
integer y = 8
integer width = 699
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hospitalización / Urgencias"
boolean checked = true
end type

event clicked;if i_mueve_kardex='1' then
	if dw_medica.dataobject<>"dw_entrega_med_kard2" then 
//		if g_motor='sql' then
//			dw_medica.dataobject="dw_entrega_med_kard2_sql"
//		else
			dw_medica.dataobject="dw_entrega_med_kard2"
	//	end if
		dw_medica.settransobject(sqlca)
	end if
	choose case dw_tip_ingres.getitemstring(1,1)
		case '2'
			tab_1.tabpage_1.dw_medica.retrieve(nhosp,clugar_hadm,'H',i_alm_urg)
		case '3','7'
			tab_1.tabpage_1.dw_medica.retrieve(nhosp,clugar_hadm,'H',i_alm_hosp)
		case '4'
			tab_1.tabpage_1.dw_medica.retrieve(nhosp,clugar_hadm,'H',i_alm_amb)
	end choose
else
	if dw_medica.dataobject<>"dw_entrega_med2" then 
		dw_medica.dataobject="dw_entrega_med2"
		dw_medica.settransobject(sqlca)
	end if
	dw_medica.retrieve(nhosp,clugar_hadm,'H')
end if

end event

type cbx_1 from checkbox within tabpage_1
integer x = 2715
integer y = 16
integer width = 453
integer height = 60
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir Entrega"
boolean checked = true
end type

type pb_new from picturebutton within tabpage_1
event mousemove pbm_mousemove
integer x = 5531
integer y = 80
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &g"
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar e imprimir entrega [Alt+G]"
end type

event clicked;if dw_historial.rowcount()=0 or dw_medica.rowcount()=0 then return
string estado
estado=dw_historial.getitemstring(dw_historial.getrow(),"estado")
if estado<>"1" and estado<>'R' then
	Messagebox("Atención","No se puede modificar esta admisión")
	return
end if
long ndoc,k,l_sumi
long l_conta
string cdoc,clug_doc,alm

if dw_medica.getitemnumber(1,"total")=0 and dw_medica.getitemnumber(1,"total_r")=0 then return
if dw_medica.getitemnumber(1,"total")>0 then
	dw_entregas.insertrow(1)
	dw_entregas.setitem(1,"clugar",clugar)
	dw_entregas.setitem(1,"usuario",usuario)
	if i_mueve_kardex='1' then
		choose case tipo_ingres
			case '2'
				cdoc=i_cdoc_urg
				clug_doc=i_lug_durg
				dw_entregas.setitem(1,"codalmacen",i_alm_urg)
				alm=i_alm_urg
			case '3','7'
				cdoc=i_cdoc_hosp
				clug_doc=i_lug_dhosp
				dw_entregas.setitem(1,"codalmacen",i_alm_hosp)
				alm=i_alm_hosp
			case '4'
				cdoc=i_cdoc_amb
				clug_doc=i_lug_damb
				dw_entregas.setitem(1,"codalmacen",i_alm_amb)
				alm=i_alm_amb
		end choose
	else
		cdoc="EF"
		clug_doc=clugar
	end if
	ndoc=f_trae_ndoc(cdoc,clug_doc,'Entrega de Medicamentos')
	if ndoc=-1 then
		dw_entregas.deleterow(1)
		rollback;
		return
	end if
	dw_entregas.setitem(1,"coddoc",cdoc)
	dw_entregas.setitem(1,"numdoc",ndoc)
	dw_entregas.setitem(1,"fecha",datetime(today(),now()))
	dw_entregas.setitem(1,"clugar",clug_doc)
end if
long j,fila
datawindow dw_t
dw_t=tab_1.tabpage_2.dw_ent_det
dw_t.reset()

dec costoprom
string cod_arti

for j=1 to dw_medica.rowcount()
	if dw_medica.getitemnumber(j,"aentregar")>0 then
		if i_mueve_kardex='1' then
			dw_lote_mov.setfilter('item='+string(dw_medica.getitemnumber(j,"item"))+' and contador_os='+string(dw_medica.getitemnumber(j,'contador'))+' and clugar_os='+"'"+dw_medica.getitemstring(j,'clugar')+"'"+' and nsolicitud_os='+string(dw_medica.getitemnumber(j,'nsolicitud'))+' and item_os='+string(dw_medica.getitemnumber(j,'item')))
			dw_lote_mov.filter()
			for k=1 to dw_lote_mov.rowcount()
				fila=dw_t.insertrow(0)
				dw_t.setitem(fila,"clugar",clug_doc)
				dw_t.setitem(fila,"coddoc",cdoc)
				dw_t.setitem(fila,"numdoc",ndoc)
				dw_t.setitem(fila,"item",fila)
				dw_t.setitem(fila,'contador_os',dw_medica.getitemnumber(j,'contador'))
				dw_t.setitem(fila,'clugar_os',dw_medica.getitemstring(j,'clugar'))
				dw_t.setitem(fila,'nsolicitud_os',dw_medica.getitemnumber(j,'nsolicitud'))
				dw_t.setitem(fila,'item_os',dw_medica.getitemnumber(j,'item'))
				dw_t.setitem(fila,"codgenerico",dw_medica.getitemstring(j,"codgenerico"))
				cod_arti=dw_lote_mov.getitemstring(k,"codarticulo")
				select costoprom into :costoprom from sum_kardex where 
				codarticulo=:cod_arti and codalmacen=:alm;
				if sqlca.sqlcode=-1 then
					messagebox('Error leyendo costo promedio',sqlca.sqlerrtext)
					rollback;
					return
				end if
				dw_t.setitem(fila,"codarticulo",cod_arti)
				dw_t.setitem(fila,'valor_unit',costoprom)
				dw_lote_mov.setitem(k,'item_fc',fila)
				dw_t.setitem(fila,"cantidad",dw_lote_mov.getitemnumber(k,"cantidad"))
				dw_medica.setitem(j,"entregada",dw_medica.getitemnumber(j,"entregada")+dw_medica.getitemnumber(j,"aentregar"))
				dw_medica.setitem(j,"aentregar",0)
			next
		else
			fila=dw_t.insertrow(0)
			dw_t.setitem(fila,"clugar",clug_doc)
			dw_t.setitem(fila,"coddoc",cdoc)
			dw_t.setitem(fila,"numdoc",ndoc)
			dw_t.setitem(fila,"item",fila)
			dw_t.setitem(fila,'contador_os',dw_medica.getitemnumber(j,'contador'))
			dw_t.setitem(fila,'clugar_os',dw_medica.getitemstring(j,'clugar'))
			dw_t.setitem(fila,'nsolicitud_os',dw_medica.getitemnumber(j,'nsolicitud'))
			dw_t.setitem(fila,'item_os',dw_medica.getitemnumber(j,'item'))
			dw_t.setitem(fila,"codgenerico",dw_medica.getitemstring(j,"codgenerico"))
			cod_arti=dw_medica.getitemstring(j,"articulo")
			dw_t.setitem(fila,"cantidad",dw_medica.getitemnumber(j,"aentregar"))
			dw_medica.setitem(j,"entregada",dw_medica.getitemnumber(j,"entregada")+dw_medica.getitemnumber(j,"aentregar"))
			dw_medica.setitem(j,"aentregar",0)
		end if
	else
		if dw_medica.getitemstring(j,"rechazar")='1'  and dw_medica.getitemnumber(j,"entregada")=0 then
			dw_medica.setitem(j,"estado",'4')
		else
			if dw_medica.getitemstring(j,"rechazar")='1'  then
				long conta,nsol,item,amax,lcal
				string llug,err
				conta=dw_medica.getitemnumber(j,'contador')
				llug=dw_medica.getitemstring(j,'clugar')
				nsol=dw_medica.getitemnumber(j,'nsolicitud')
				item=dw_medica.getitemnumber(j,'item')
	
				select (entregada) into :lcal
				from oscuerpo
				where (((contador)=:conta) and ((clugar)=:llug) and ((nsolicitud)=:nsol) and ((item)=:item));
			
				dw_medica.setitem(j,"solicitada",lcal)
				setnull(amax)
				select max(item) into :amax
				from oscuerpo
				where (((contador)=:conta) and ((clugar)=:llug) and ((nsolicitud)=:nsol));
				amax=amax+1
			
				insert into oscuerpo ( contador, clugar, nsolicitud, item, solicitada, tipo,entregada,suministrada, c_medica, administracion, via, observaciones, estado, devuelta, frecuen, medi_pos )
				select contador, clugar, nsolicitud, :amax, (solicitada - entregada), tipo, 0, 0, c_medica, administracion, via, observaciones, '4', 0, frecuen, medi_pos
				from oscuerpo
				where (((contador)=:conta) and ((clugar)=:llug) and ((nsolicitud)=:nsol) and ((item)=:item));
				if sqlca.sqlcode=-1 then
						err=sqlca.sqlerrtext
					rollback;
					messagebox('Error',"Insertando en Oscuerpo rechazo")
					return -1
				end if
			end if
		end if
	end if
next
commit;
if dw_entregas.update()=-1 then
	dw_t.reset()
	dw_lote_mov.reset()
	dw_entregas.deleterow(1)
	rollback;
	dw_historial.triggerevent(rowfocuschanged!)
	return
end if
if dw_t.update()=-1 then
	dw_t.reset()
	dw_lote_mov.reset()
	dw_entregas.deleterow(1)
	rollback;
	return
end if
if i_mueve_kardex='1' then
	if f_mueve_kardex(alm,dw_t)=-1 then
		dw_t.reset()
		dw_entregas.deleterow(1)
		rollback;
		return
	end if
	dw_lote_mov.setfilter('')
	dw_lote_mov.filter()
	if f_mueve_lote(dw_lote_mov,ndoc)=-1 then
		dw_t.reset()
		dw_entregas.deleterow(1)
		rollback;
		return
	end if
end if
if dw_medica.update()=-1 then
	dw_t.reset()
	dw_entregas.deleterow(1)
	rollback;
	return
end if
commit;
dw_lote_mov.reset()
dw_historial.triggerevent(rowfocuschanged!)
if cbx_1.checked and dw_medica.getitemnumber(1,"total")>0  then
	any par[3]
	par[1]=cdoc
	par[2]=clug_doc
	par[3]=ndoc
	tab_1.tabpage_2.pb_print.imprimir(par,'','0')
end if
if isvalid(w_new_at_os) then w_new_at_os.dw_tip_ingres.triggerevent(itemchanged!)
if isvalid(w_new_sala_qx) then w_new_sala_qx.tab_servicios.tabpage_3.uo_2.dw_oscab.triggerevent(rowfocuschanged!)

end event

type dw_medica from datawindow within tabpage_1
integer x = 55
integer y = 84
integer width = 5445
integer height = 848
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_entrega_med_kard2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event itemchanged;modify("aentregar.validationmsg='Debe ser mayor o igual a cero y no exceder la cantidad solicitada menos la entregada menos la devuelta'")
long solic,entreg,aentreg,fila,existe,devuelt,l_control,l_con,l_soli
string articulo,l_lug

fila=getrow()

if accepttext()=-1 then 
	setitem(fila,"aentregar",0)
	return 1
end if
if getcolumnname()='rechazar' then
	setitem(fila,"aentregar",0)
	settext('0')
end if

l_con=dw_medica.getitemnumber(getrow(),'contador')
l_lug=dw_medica.getitemstring(getrow(),'clugar')
solic=dw_medica.getitemnumber(getrow(),'nsolicitud')
existe=dw_medica.getitemnumber(getrow(),'item')

SELECT OSCuerpo.solicitada - OSCuerpo.entregada - OSCuerpo.devuelta,OSCuerpo.solicitada into :l_control,:l_soli
FROM OSCuerpo
WHERE (((OSCuerpo.Contador)=:l_con) AND ((OSCuerpo.clugar)=:l_lug) AND ((OSCuerpo.NSolicitud)=:solic) AND ((OSCuerpo.Item)=:existe));
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo Oscuerpo para verificar control",sqlca.sqlerrtext)
	return 1
end if
if l_control <= 0 then
	messagebox("Leyendo Control",'Error ya entregado')
	dw_historial.triggerevent(rowfocuschanged!)
	return -1
end if
	
if l_soli<>getitemnumber(fila,"solicitada") then 
	messagebox("Cantidad",'Cantidad Modificada en la orden')
	dw_historial.triggerevent(rowfocuschanged!)
	return -1
end if
aentreg=getitemnumber(fila,"aentregar")
if aentreg=0 then
	if i_mueve_kardex='1' then
		dw_lote_mov.setfilter("contador_os="+string(dw_medica.getitemnumber(getrow(),'contador'))+" and clugar_os='"+dw_medica.getitemstring(getrow(),'clugar')+"' and nsolicitud_os="+string(dw_medica.getitemnumber(getrow(),'nsolicitud'))+" and item_os="+	string(dw_medica.getitemnumber(getrow(),'item')))
		dw_lote_mov.filter()
		do while dw_lote_mov.rowcount()>0
			dw_lote_mov.deleterow(0)
		loop
		dw_lote_mov.setfilter('')
		dw_lote_mov.filter()
	end if
	accepttext()
	return
end if

if aentreg<0 then
	settext('0')
	setitem(fila,"aentregar",0)
	return 1
end if

solic=getitemnumber(fila,"solicitada")
entreg=getitemnumber(fila,"entregada")
devuelt=getitemnumber(fila,"devuelta")
if solic - entreg -aentreg -devuelt < 0 then
	settext('0')
	setitem(fila,"aentregar",0)
	return 1
end if

if i_mueve_kardex='1' then
	existe=getitemnumber(fila,'actual')
	if isnull(existe) then existe=0
	if aentreg>existe then
		messagebox("Atención",'No hay existencias suficientes de este Producto')
		settext('0')
		setitem(fila,'aentregar',0)
		return 2
	end if
	setitem(fila,"rechazar",'0')
	st_lotes st_lote
	st_lote.cant=aentreg
	st_lote.cmedica=getitemstring(fila,"codgenerico")
	choose case tipo_ingres
		case '2'
			st_lote.alm=i_alm_urg
			st_lote.clug=i_lug_durg
			st_lote.cdoc=i_cdoc_urg
		case '3','7'
			st_lote.alm=i_alm_hosp
			st_lote.clug=i_lug_dhosp
			st_lote.cdoc=i_cdoc_hosp
		case '4'
			st_lote.alm=i_alm_amb
			st_lote.clug=i_lug_damb
			st_lote.cdoc=i_cdoc_amb
	end choose
	st_lote.dw_lote_mov=dw_lote_mov
	st_lote.item=getitemnumber(fila,'item')
	st_lote.contador_os=dw_medica.getitemnumber(getrow(),'contador')
	st_lote.clugar_os=dw_medica.getitemstring(getrow(),'clugar')
	st_lote.nsolicitud_os=dw_medica.getitemnumber(getrow(),'nsolicitud')
	st_lote.item_os=dw_medica.getitemnumber(getrow(),'item')
	openwithparm(w_escoge_lote,st_lote)
	long donde
	donde=dw_lote_mov.find('item='+string(st_lote.item)+' and contador_os='+string(st_lote.contador_os)+' and clugar_os='+"'"+st_lote.clugar_os+"'"+' and nsolicitud_os='+string(st_lote.nsolicitud_os)+' and item_os='+string(st_lote.item_os),1,dw_lote_mov.rowcount())
	if donde=0 then
		settext('0')
		setitem(getrow(),"aentregar",0)
		accepttext()
		modify("aentregar.validationmsg='No escogió un elemento'")
		return 1
	end if
end if
end event

event losefocus;accepttext()
end event

event retrieveend;if i_mueve_kardex='1' then return //porque toca escoger lotes 
long j
for j= 1 to rowcount()
	setitem(j,"aentregar",getitemnumber(j,"solicitada")-getitemnumber(j,"entregada"))
next
end event

event dberror;rollback;
return 0
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5710
integer height = 956
long backcolor = 67108864
string text = "Detalle de Entregas Anteriores"
long tabtextcolor = 33554432
string picturename = "det_med.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra el detalle de la Entrega, la reimprime o la anular"
pb_print pb_print
pb_anular pb_anular
dw_ent_det dw_ent_det
end type

on tabpage_2.create
this.pb_print=create pb_print
this.pb_anular=create pb_anular
this.dw_ent_det=create dw_ent_det
this.Control[]={this.pb_print,&
this.pb_anular,&
this.dw_ent_det}
end on

on tabpage_2.destroy
destroy(this.pb_print)
destroy(this.pb_anular)
destroy(this.dw_ent_det)
end on

type pb_print from pb_report within tabpage_2
integer x = 5541
integer y = 24
integer taborder = 50
string text = "       &r"
boolean originalsize = false
string powertiptext = "Reimprimir Entrega "
string nombre_rep = "Entrega Interna de Farmacia"
string tipo_rep = "documento!"
boolean dialogo = true
end type

event clicked;call super::clicked;if dw_historial.rowcount()=0 then return
any par[3]
par[1]=dw_entregas.getitemstring(dw_entregas.getrow(),"coddoc")
par[2]=dw_entregas.getitemstring(dw_entregas.getrow(),"clugar")
par[3]=dw_entregas.getitemnumber(dw_entregas.getrow(),"numdoc")
if isnull(par[1]) then return
imprimir(par,'','0')

end event

type pb_anular from picturebutton within tabpage_2
event mousemove pbm_mousemove
integer x = 5541
integer y = 212
integer width = 142
integer height = 124
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &a"
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Anular Entrega [Alt+A]"
end type

event clicked;if f_permiso_boton(this,'EMED')=0 then return
if dw_entregas.rowcount()=0 then return
if dw_entregas.getitemstring(dw_entregas.getrow(),"estado")='2' then return//ya está anulado
if dw_ent_det.find('entregada - suministrada - cantidad < 0',1,dw_ent_det.rowcount())>0 then
	messagebox("Atención","No puede anular esta entrega, porque ya se le ha suministrado al paciente")
	return
end if
long j,norden,nitem_os,cant,conta_os,nnull,secuencia
string clug_os,snull
setnull(snull)
setnull(nnull)
for j=1 to dw_ent_det.rowcount()
	cant=dw_ent_det.getitemnumber(j,"cantidad")
	conta_os=dw_ent_det.getitemnumber(j,"contador_os")
	clug_os=dw_ent_det.getitemstring(j,"clugar_os")
	norden=dw_ent_det.getitemnumber(j,"nsolicitud_os")
	nitem_os=dw_ent_det.getitemnumber(j,"item_os")
//	secuencia=dw_ent_det.getitemnumber(j,"secuencia")
	UPDATE oscuerpo SET entregada = entregada - :cant
	WHERE contador=:conta_os and clugar=:clug_os and nsolicitud=:norden and item=:nitem_os;// and secuencia=:secuencia;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando Orden Servicio",sqlca.sqlerrtext)
		rollback;
		dw_entregas.triggerevent(rowfocuschanged!)
		return
	end if
	dw_ent_det.setitem(j,'contador_os',nnull)
	dw_ent_det.setitem(j,'clugar_os',snull)
	dw_ent_det.setitem(j,'nsolicitud_os',nnull)
	dw_ent_det.setitem(j,'item_os',nnull)
//	dw_ent_det.setitem(j,'secuencia',nnull)
next
if dw_ent_det.update()=-1 then
	rollback;
	dw_entregas.triggerevent(rowfocuschanged!)
	return
end if
dw_entregas.setitem(dw_entregas.getrow(),"estado",'2')
dw_entregas.setitem(dw_entregas.getrow(),"anulado",usuario)
dw_entregas.setitem(dw_entregas.getrow(),"fechaanula",datetime(today()))
string clug_ent,cdoc
long nent
cdoc=dw_entregas.getitemstring(dw_entregas.getrow(),"coddoc")
clug_ent=dw_entregas.getitemstring(dw_entregas.getrow(),"clugar")
nent=dw_entregas.getitemnumber(dw_entregas.getrow(),"numdoc")
if dw_entregas.update()=-1 then
	rollback;
	dw_entregas.triggerevent(rowfocuschanged!)
else
	if f_anula_mov_kardex(cdoc,clug_ent,'',nent)=-1 then
		rollback;
		dw_entregas.triggerevent(rowfocuschanged!)
		return
	end if
	if dw_ent_det.update()=-1 then
		rollback;
		dw_entregas.triggerevent(rowfocuschanged!)
		return
	end if
	commit;
	dw_historial.triggerevent(rowfocuschanged!)
end if
if isvalid(w_new_at_os) then w_new_at_os.dw_tip_ingres.triggerevent(itemchanged!)
if isvalid(w_new_sala_qx) then w_new_sala_qx.tab_servicios.tabpage_3.uo_2.dw_oscab.triggerevent(rowfocuschanged!)

end event

event constructor;f_inicia_boton(this,'EMED')
end event

type dw_ent_det from datawindow within tabpage_2
integer x = 87
integer y = 32
integer width = 5440
integer height = 912
integer taborder = 30
string title = "none"
string dataobject = "dw_far_ent_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type dw_entregas from datawindow within w_entrega_med
integer x = 3301
integer y = 56
integer width = 2469
integer height = 528
integer taborder = 40
string title = "none"
string dataobject = "dw_far_ent_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_1.tabpage_2.dw_ent_det.reset()
if getrow()<1 then return
i_nentrega=getitemnumber(getrow(),"numdoc")
i_clugar_ent=getitemstring(getrow(),"clugar")
tab_1.tabpage_2.dw_ent_det.retrieve(getitemstring(getrow(),"coddoc"),i_clugar_ent,i_nentrega)
end event

event dberror;rollback;
return 0
end event

type pb_activos from picturebutton within w_entrega_med
event mousemove pbm_mousemove
integer x = 1536
integer y = 28
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "buscar.GIF"
string disabledname = "d_buscar.GIF"
alignment htextalign = left!
string powertiptext = "Mostrar Pacientes con Admisiones Activas"
end type

event clicked;openwithparm(w_hospitaliz,dw_tip_ingres.getitemstring(1,1))
end event

type st_3 from statictext within w_entrega_med
integer x = 55
integer y = 168
integer width = 3086
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

type dw_historial from datawindow within w_entrega_med
integer x = 55
integer y = 228
integer width = 3090
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

event rowfocuschanged;dw_entregas.reset()
tab_1.tabpage_1.dw_medica.reset()
dw_inf.reset()
if getrow()<1 then return
nhosp=getitemnumber(getrow(),"nh")
clugar_hadm=getitemstring(getrow(),"clugar")
dw_inf.retrieve(nhosp,clugar_hadm,tipo_ingres)
dw_entregas.retrieve(nhosp,clugar_hadm,tipo_ingres)
if tab_1.tabpage_1.rb_1.checked then
	tab_1.tabpage_1.rb_1.event clicked()
else
	tab_1.tabpage_1.rb_2.event clicked()
end if
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

type st_1 from statictext within w_entrega_med
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

type gb_1 from groupbox within w_entrega_med
integer x = 3250
integer width = 2542
integer height = 604
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entregas Anteriores de la Admisión"
end type

type gb_2 from groupbox within w_entrega_med
integer x = 27
integer width = 3159
integer height = 604
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

