$PBExportHeader$w_new_estad_ria_os.srw
forward
global type w_new_estad_ria_os from window
end type
type dw_entregas from datawindow within w_new_estad_ria_os
end type
type st_desproc from statictext within w_new_estad_ria_os
end type
type st_desdiag from statictext within w_new_estad_ria_os
end type
type st_cdiaging from statictext within w_new_estad_ria_os
end type
type st_3 from statictext within w_new_estad_ria_os
end type
type cb_del from picturebutton within w_new_estad_ria_os
end type
type dw_trae_varias from datawindow within w_new_estad_ria_os
end type
type cb_registra from picturebutton within w_new_estad_ria_os
end type
type dw_trae from datawindow within w_new_estad_ria_os
end type
type dw_empac from datawindow within w_new_estad_ria_os
end type
type dw_cont_det from datawindow within w_new_estad_ria_os
end type
type dw_segrespon from datawindow within w_new_estad_ria_os
end type
type st_2 from statictext within w_new_estad_ria_os
end type
type cbx_replica from checkbox within w_new_estad_ria_os
end type
type sle_5 from singlelineedit within w_new_estad_ria_os
end type
type sle_3 from singlelineedit within w_new_estad_ria_os
end type
type sle_2 from singlelineedit within w_new_estad_ria_os
end type
type sle_1 from singlelineedit within w_new_estad_ria_os
end type
type gb_4 from groupbox within w_new_estad_ria_os
end type
type gb_3 from groupbox within w_new_estad_ria_os
end type
type cb_cancel from picturebutton within w_new_estad_ria_os
end type
type cb_guarda from picturebutton within w_new_estad_ria_os
end type
type st_1 from statictext within w_new_estad_ria_os
end type
type rb_anul from radiobutton within w_new_estad_ria_os
end type
type rb_incomp from radiobutton within w_new_estad_ria_os
end type
type rb_comp from radiobutton within w_new_estad_ria_os
end type
type rb_tod from radiobutton within w_new_estad_ria_os
end type
type dw_rias from datawindow within w_new_estad_ria_os
end type
type sle_4 from singlelineedit within w_new_estad_ria_os
end type
type gb_1 from groupbox within w_new_estad_ria_os
end type
type dw_inf from datawindow within w_new_estad_ria_os
end type
end forward

global type w_new_estad_ria_os from window
integer width = 6039
integer height = 2120
boolean titlebar = true
string title = "Atender Procedimientos / Estado de Rips"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rips.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
dw_entregas dw_entregas
st_desproc st_desproc
st_desdiag st_desdiag
st_cdiaging st_cdiaging
st_3 st_3
cb_del cb_del
dw_trae_varias dw_trae_varias
cb_registra cb_registra
dw_trae dw_trae
dw_empac dw_empac
dw_cont_det dw_cont_det
dw_segrespon dw_segrespon
st_2 st_2
cbx_replica cbx_replica
sle_5 sle_5
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
gb_4 gb_4
gb_3 gb_3
cb_cancel cb_cancel
cb_guarda cb_guarda
st_1 st_1
rb_anul rb_anul
rb_incomp rb_incomp
rb_comp rb_comp
rb_tod rb_tod
dw_rias dw_rias
sle_4 sle_4
gb_1 gb_1
dw_inf dw_inf
end type
global w_new_estad_ria_os w_new_estad_ria_os

type variables
string sexo_paci,i_est_hadm,i_clug_hadm,i_cemp,i_ccont,i_nautoriza,i_tingreso
long i_nh,i_norden
datawindowchild idw_ufun,idw_cc,idw_espe
DataWindowChild idw_fincon,idw_finproc,idw_causaex,idw_ambproc
trae i_st
string i_cambio='n',i_cdiaging,i_causaext,i_fin_consulta,i_tipodx,i_mueve_kardex,is_amb
end variables

on w_new_estad_ria_os.create
this.dw_entregas=create dw_entregas
this.st_desproc=create st_desproc
this.st_desdiag=create st_desdiag
this.st_cdiaging=create st_cdiaging
this.st_3=create st_3
this.cb_del=create cb_del
this.dw_trae_varias=create dw_trae_varias
this.cb_registra=create cb_registra
this.dw_trae=create dw_trae
this.dw_empac=create dw_empac
this.dw_cont_det=create dw_cont_det
this.dw_segrespon=create dw_segrespon
this.st_2=create st_2
this.cbx_replica=create cbx_replica
this.sle_5=create sle_5
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.gb_4=create gb_4
this.gb_3=create gb_3
this.cb_cancel=create cb_cancel
this.cb_guarda=create cb_guarda
this.st_1=create st_1
this.rb_anul=create rb_anul
this.rb_incomp=create rb_incomp
this.rb_comp=create rb_comp
this.rb_tod=create rb_tod
this.dw_rias=create dw_rias
this.sle_4=create sle_4
this.gb_1=create gb_1
this.dw_inf=create dw_inf
this.Control[]={this.dw_entregas,&
this.st_desproc,&
this.st_desdiag,&
this.st_cdiaging,&
this.st_3,&
this.cb_del,&
this.dw_trae_varias,&
this.cb_registra,&
this.dw_trae,&
this.dw_empac,&
this.dw_cont_det,&
this.dw_segrespon,&
this.st_2,&
this.cbx_replica,&
this.sle_5,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.gb_4,&
this.gb_3,&
this.cb_cancel,&
this.cb_guarda,&
this.st_1,&
this.rb_anul,&
this.rb_incomp,&
this.rb_comp,&
this.rb_tod,&
this.dw_rias,&
this.sle_4,&
this.gb_1,&
this.dw_inf}
end on

on w_new_estad_ria_os.destroy
destroy(this.dw_entregas)
destroy(this.st_desproc)
destroy(this.st_desdiag)
destroy(this.st_cdiaging)
destroy(this.st_3)
destroy(this.cb_del)
destroy(this.dw_trae_varias)
destroy(this.cb_registra)
destroy(this.dw_trae)
destroy(this.dw_empac)
destroy(this.dw_cont_det)
destroy(this.dw_segrespon)
destroy(this.st_2)
destroy(this.cbx_replica)
destroy(this.sle_5)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.cb_cancel)
destroy(this.cb_guarda)
destroy(this.st_1)
destroy(this.rb_anul)
destroy(this.rb_incomp)
destroy(this.rb_comp)
destroy(this.rb_tod)
destroy(this.dw_rias)
destroy(this.sle_4)
destroy(this.gb_1)
destroy(this.dw_inf)
end on

event open;sle_5.backcolor=rgb(255,255,200) //color crema para el mostrario de no obligatorio
i_st=message.powerobjectparm
long j,k,l_i
select 
	hospadmi.nh, hospadmi.clugar, hospadmi.estado, hospadmi.cemp, hospadmi.ccontrato, hospadmi.autoriza, hospadmi.causaexterna, 
	hospadmi.diagingre, hospadmi.FIN_CONSULTA, hospadmi.TIPODIAGPRIN, hospadmi.codtingre, tipoingreso.claseproced
into 
	:i_nh ,:i_clug_hadm,:i_est_hadm,:i_cemp,:i_ccont,:i_nautoriza,:i_causaext,:i_cdiaging,:i_fin_consulta,:i_tipodx,:i_tingreso,:is_amb
FROM 
	hospadmi INNER JOIN tipoingreso ON hospadmi.codtingre = tipoingreso.codtingre
where 
	hospadmi.contador=:i_st.numero and hospadmi.clugar_his=:i_st.lugar and hospadmi.codtingre=:i_st.tingres;
	
if not isnull(i_st.dx_ord) then i_cdiaging=i_st.dx_ord
	
dw_inf.retrieve(i_nh,i_clug_hadm,i_tingreso)
if i_fin_consulta='' then setnull( i_fin_consulta)
if i_cdiaging<>'' then
	select cod_rips , desdiag into :st_cdiaging.text,:st_desdiag.text from diags where codgeral=:i_cdiaging;
end if
if i_st.dw_procs.rowcount()>0 then
	i_norden=i_st.dw_procs.getitemnumber(1,'nsolicitud')
else
	if i_st.dw_meds.rowcount()=0 then return
	i_norden=i_st.dw_meds.getitemnumber(1,'nsolicitud')
end if

if i_st.otro="carga" then
	dw_rias.settransobject(SQLCA)
	dw_rias.getchild('desufuncional',idw_ufun)
	idw_ufun.settransobject(sqlca)	
	dw_rias.getchild('descripcion',idw_cc)
	idw_cc.settransobject(sqlca)	
	dw_rias.getchild('s_fin_consulta',idw_fincon)
	idw_fincon.settransobject(sqlca)
	dw_rias.getchild('s_finalidadproced',idw_finproc)
	idw_finproc.settransobject(SQLCA)
	dw_rias.getchild('s_causaexterna',idw_causaex)
	idw_causaex.settransobject(sqlca)
	dw_rias.getchild('s_ambitoproced',idw_ambproc)
	idw_ambproc.settransobject(sqlca)
	idw_fincon.retrieve('1')
	idw_finproc.retrieve('1')
	idw_causaex.retrieve('1')
	idw_ambproc.retrieve('1')
	idw_ufun.insertrow(1)
	idw_cc.insertrow(1)


	for j=1 to i_st.dw_procs.rowcount()
		if i_st.dw_procs.getitemstring(j,"agrupser")="10" then continue
		if i_st.dw_procs.getitemstring(j,'escog')='0'   then continue
		k=dw_trae.insertrow(0)
		dw_trae.setitem(k,'contador',i_st.dw_procs.getitemnumber(j,'contador'))
		dw_trae.setitem(k,'clugar',i_st.dw_procs.getitemstring(j,'clugar'))
		dw_trae.setitem(k,'nsolicitud',i_st.dw_procs.getitemnumber(j,'nsolicitud'))
		dw_trae.setitem(k,'item',i_st.dw_procs.getitemnumber(j,'item'))
		dw_trae.setitem(k,'solicitada',i_st.dw_procs.getitemnumber(j,'solicitada'))
		dw_trae.setitem(k,'suministrada',i_st.dw_procs.getitemnumber(j,'suministrada'))	
		dw_trae.setitem(k,'estado',i_st.dw_procs.getitemstring(j,'estado'))
		dw_trae.setitem(k,'facturar',i_st.dw_procs.getitemnumber(j,'facturar'))
		dw_trae.setitem(k,"asumin",dw_trae.getitemnumber(k,"solicitada")-dw_trae.getitemnumber(k,"suministrada"))
		dw_trae.setitem(k,'descripcion',i_st.dw_procs.getitemstring(j,'descripcion'))
		dw_trae.setitem(k,'rip_proc',i_st.dw_procs.getitemstring(j,'rips'))
		dw_trae.setitem(k,'codproced',i_st.dw_procs.getitemstring(j,'codproced'))
	next
	string  l_lugar
	double l_contador,l_soli,l_item,l_cuan
	if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, i_mueve_kardex)
	if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, i_mueve_kardex)	
	if i_mueve_kardex='1' then
		for j=1 to i_st.dw_meds.rowcount()
			if i_st.dw_meds.getitemstring(j,'escog')='0' then continue
			if i_st.dw_meds.getitemstring(j,'enfermeria')='1' then continue
			l_contador=i_st.dw_meds.getitemnumber(j,'contador')
			l_lugar=i_st.dw_meds.getitemstring(j,'clugar')
			l_soli=i_st.dw_meds.getitemnumber(j,'nsolicitud')
			l_item=i_st.dw_meds.getitemnumber(j,'item')
			dw_entregas.retrieve(l_contador,l_lugar,l_soli,l_item)
			l_cuan=dw_entregas.rowcount()
			for l_i=1 to dw_entregas.rowcount()
				k=dw_trae.insertrow(0)
				dw_trae.setitem(k,'contador',i_st.dw_meds.getitemnumber(j,'contador'))
				dw_trae.setitem(k,'clugar',i_st.dw_meds.getitemstring(j,'clugar'))
				dw_trae.setitem(k,'nsolicitud',i_st.dw_meds.getitemnumber(j,'nsolicitud'))
				dw_trae.setitem(k,'item',i_st.dw_meds.getitemnumber(j,'item'))
				dw_trae.setitem(k,'solicitada',dw_entregas.getitemnumber(l_i,'ecant'))
				dw_trae.setitem(k,'suministrada',dw_entregas.getitemnumber(l_i,'sumi') )	
				dw_trae.setitem(k,'sumi',dw_entregas.getitemnumber(l_i,'sumi') )	
				dw_trae.setitem(k,'estado',i_st.dw_meds.getitemstring(j,'estado'))
				dw_trae.setitem(k,'facturar',i_st.dw_meds.getitemnumber(j,'facturar'))
				dw_trae.setitem(k,'c_medica',i_st.dw_meds.getitemstring(j,'c_medica'))
				dw_trae.setitem(k,'devuelta',i_st.dw_meds.getitemnumber(j,'devuelta'))
				dw_trae.setitem(k,'rip_med',i_st.dw_meds.getitemstring(j,'rips'))
				dw_trae.setitem(k,'medicamento',i_st.dw_meds.getitemstring(j,'medicamento'))
				dw_trae.setitem(k,'codarticulo',dw_entregas.getitemstring(l_i,'codarticulo'))
				dw_trae.setitem(k,'entregada',dw_entregas.getitemnumber(l_i,'ecant') - dw_entregas.getitemnumber(l_i,'devuelta'))
				dw_trae.setitem(k,"asumin",dw_entregas.getitemnumber(l_i,'asumin'))
				dw_trae.setitem(k,'solicitat',dw_entregas.getitemnumber(l_i,'solicitat'))
				dw_trae.setitem(k,'coddoc_ent',dw_entregas.getitemstring(l_i,'coddoc'))
				dw_trae.setitem(k,'clugar_ent',dw_entregas.getitemstring(l_i,'clugare'))
				dw_trae.setitem(k,'numdoc_ent',dw_entregas.getitemnumber(l_i,'numdoc'))
				dw_trae.setitem(k,'item_ent',dw_entregas.getitemnumber(l_i,'iteme'))
				dw_trae.setitem(k,'fecha_venc',dw_entregas.getitemdatetime(l_i,'fecha_venc'))
				dw_trae.setitem(k,'lote',dw_entregas.getitemstring(l_i,'lote'))
				dw_trae.setitem(k,'convenio',dw_entregas.getitemstring(l_i,'convenio'))	
				dw_trae.setitem(k,'cod_oxig',i_st.dw_meds.getitemstring(j,'cod_oxig'))
			next
	next
else
	for j=1 to i_st.dw_meds.rowcount()
		if i_st.dw_meds.getitemstring(j,'escog')='0' then continue
		if i_st.dw_meds.getitemstring(j,'enfermeria')='1' then continue
		k=dw_trae.insertrow(0)
		dw_trae.setitem(k,'contador',i_st.dw_meds.getitemnumber(j,'contador'))
		dw_trae.setitem(k,'clugar',i_st.dw_meds.getitemstring(j,'clugar'))
		dw_trae.setitem(k,'nsolicitud',i_st.dw_meds.getitemnumber(j,'nsolicitud'))
		dw_trae.setitem(k,'item',i_st.dw_meds.getitemnumber(j,'item'))
		dw_trae.setitem(k,'solicitada',i_st.dw_meds.getitemnumber(j,'solicitada'))
		dw_trae.setitem(k,'suministrada',i_st.dw_meds.getitemnumber(j,'suministrada') )	
		dw_trae.setitem(k,'estado',i_st.dw_meds.getitemstring(j,'estado'))
		dw_trae.setitem(k,'facturar',i_st.dw_meds.getitemnumber(j,'facturar'))
		dw_trae.setitem(k,'c_medica',i_st.dw_meds.getitemstring(j,'c_medica'))
		dw_trae.setitem(k,'rip_med',i_st.dw_meds.getitemstring(j,'rips'))
		dw_trae.setitem(k,'medicamento',i_st.dw_meds.getitemstring(j,'medicamento'))
		dw_trae.setitem(k,'codarticulo',i_st.dw_meds.getitemstring(j,'codarticulo'))
		dw_trae.setitem(k,'entregada',i_st.dw_meds.getitemnumber(j,'entregada') - i_st.dw_meds.getitemnumber(j,'devuelta'))
		dw_trae.setitem(k,"asumin",dw_trae.getitemnumber(k,"entregada")-dw_trae.getitemnumber(k,"suministrada"))
		dw_trae.setitem(k,'cod_oxig',i_st.dw_meds.getitemstring(j,'cod_oxig'))		
	next
    end if
    dw_trae.resetupdate()
else//revisa
	cb_registra.enabled=false
	
	dw_rias.dataobject="dw_rips_os_todos"
	dw_rias.settransobject(SQLCA)
	dw_rias.getchild('desufuncional',idw_ufun)
	idw_ufun.settransobject(sqlca)	
	dw_rias.getchild('descripcion',idw_cc)
	idw_cc.settransobject(sqlca)	
	dw_rias.getchild('s_fin_consulta',idw_fincon)
	idw_fincon.settransobject(sqlca)
	dw_rias.getchild('s_finalidadproced',idw_finproc)
	idw_finproc.settransobject(SQLCA)
	dw_rias.getchild('s_causaexterna',idw_causaex)
	idw_causaex.settransobject(sqlca)
	dw_rias.getchild('s_ambitoproced',idw_ambproc)
	idw_ambproc.settransobject(sqlca)
	idw_fincon.retrieve('1')
	idw_finproc.retrieve('1')
	idw_causaex.retrieve('1')
	idw_ambproc.retrieve('1')
	idw_ufun.insertrow(1)
	idw_cc.insertrow(1)
	

	if i_st.dw_procs.rowcount()=0 then
		dw_trae.retrieve(i_st.numero,i_st.lugar,i_st.dw_meds.getitemnumber(1,'nsolicitud'))
		dw_rias.retrieve(i_st.numero,i_st.lugar,i_st.dw_meds.getitemnumber(1,'nsolicitud'))
	else
		dw_trae.retrieve(i_st.numero,i_st.lugar,i_st.dw_procs.getitemnumber(1,'nsolicitud'))
		dw_rias.retrieve(i_st.numero,i_st.lugar,i_st.dw_procs.getitemnumber(1,'nsolicitud'))
	end if
end if
string temp

dw_rias.getchild('desesp',idw_espe)
idw_espe.settransobject(sqlca)


if dw_rias.rowcount()>0 then idw_espe.retrieve(dw_rias.getitemstring(1,'cprof'))
choose case i_st.tingres
	case '2'
		if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, temp )
		if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, temp )
		idw_causaex.setfilter("xa_urge='1'")	
		
	case '3','7'
		if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, temp )
		if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, temp )
		idw_causaex.setfilter("xa_hosp='1'")
		
	case '4'
		if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, temp )
		if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, temp )
		idw_causaex.setfilter("xa_hosp='1'")
end choose
idw_causaex.filter()

string ls_sex
int li_dias
li_dias=w_principal.dw_1.getitemnumber(1,'dias')
if w_principal.dw_1.getitemstring(1,'sexo')="F" then ls_sex='2'
if w_principal.dw_1.getitemstring(1,'sexo')="M" then ls_sex='1'
idw_finproc.setfilter(" indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
idw_finproc.filter()

end event

event close;closewithreturn(this,i_cambio)
end event

type dw_entregas from datawindow within w_new_estad_ria_os
boolean visible = false
integer x = 2880
integer y = 1856
integer width = 1879
integer height = 80
integer taborder = 70
string title = "none"
string dataobject = "dw_entrega_x_lote_x_atencion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_desproc from statictext within w_new_estad_ria_os
integer x = 27
integer y = 1764
integer width = 4407
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_desdiag from statictext within w_new_estad_ria_os
integer x = 544
integer y = 832
integer width = 5431
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_cdiaging from statictext within w_new_estad_ria_os
integer x = 357
integer y = 832
integer width = 174
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_new_estad_ria_os
integer x = 37
integer y = 836
integer width = 315
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diag. Ingreso:"
boolean focusrectangle = false
end type

type cb_del from picturebutton within w_new_estad_ria_os
event mousemove pbm_mousemove
integer x = 2176
integer y = 1844
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            "
boolean originalsize = true
string picturename = "borrador.GIF"
string disabledname = "d_borrador.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Procedimiento"
end type

event clicked;long fila,donde,nservic,nulo,nro_donacion,nro_bolsa,item
string clugar_dona

fila=dw_rias.getrow()
if fila<1 then return
if not isnull(dw_rias.getitemnumber(fila,"nfactura")) then
	messagebox("Atención","Este procedimiento ya se encuentra facturado, no lo puede borrar")
	return
end if
if dw_rias.getItemString(fila,"enfermeria") = '1' then
	messagebox("Atención","Este procedimiento se atendió desde la estación de enfermería")
	return
end if
string snulo
if i_st.tipo_orden='B' then
	Messagebox("Atención","No se puede borrar procedimientos ya que son de un banco de fluidos")
	return
end if
if i_est_hadm<>"1" then
	Messagebox("Atención","No se puede borrar procedimientos ya que la admisión no está activa")
	return
end if
nservic=dw_rias.getitemnumber(fila,"nservicio")
string codigo,estado
setnull(nulo)
setnull(snulo)
donde=dw_trae.find('contador='+string(i_st.numero)+' and clugar="'+i_st.lugar+'" and nsolicitud='+string(i_norden)+' and item='+string(dw_rias.getitemnumber(fila,"item_orden")),1,dw_trae.rowcount())
if donde=0 then 
	messagebox("No se puede encontrar este procedimiento","Es posible que sea un procedimiento atendido en apoyo diagnóstico y no se puede borrar desde aqui")
	return
end if
dw_trae.setitem(donde,"suministrada",dw_trae.getitemnumber(donde,"suministrada") -dw_rias.getitemnumber(fila,"s_cantidad"))
if dw_trae.getitemnumber(donde,"suministrada") < dw_trae.getitemnumber(donde,"solicitada")then dw_trae.setitem(donde,"estado","1")
if dw_trae.getitemnumber(donde,"suministrada") = 0 then dw_trae.setitem(donde,"enfermeria",snulo)
long j
select count(item) into :j from oscuerpo where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden and estado='1';
if j=0 then
	estado='2'
else
	estado='1'
end if
update oscabeza set estado='1' where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando estado de orden de servicio (oscab)",sqlca.sqlerrtext)
	rollback;
	return
end if
nro_donacion=dw_rias.getitemnumber(fila,"nro_donacion")
nro_bolsa=dw_rias.getitemnumber(fila,"nro_bolsa")
clugar_dona=dw_rias.getitemstring(fila,"clugar_dona")
item=dw_rias.getitemnumber(fila,"item_orden")

update banco_reserva set estado = 'R'
where (((clugar)=:clugar_dona) and ((nro_donacion)=:nro_donacion) and ((nro_bolsa)=:nro_bolsa) and ((contador)=:i_st.numero) and ((clugar_os)=:i_st.lugar) and ((nsolicitud)=:i_norden) and ((item)=:item));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando estado Banco reserva",sqlca.sqlerrtext)
	rollback;
	return
end if

update banco_bolsa set estado = 'R'
where (((clugar)=:clugar_dona) and ((nro_donacion)=:nro_donacion) and ((nro_bolsa)=:nro_bolsa));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando estado Banco Bolsa",sqlca.sqlerrtext)
	rollback;
	return
end if

delete from qxcpacto where contador=:i_st.numero and  clugar_ser=:i_st.lugar and nservicio=:nservic;
if sqlca.sqlcode=-1 then
	messagebox("Error borrando de QxCpActo",sqlca.sqlerrtext)
	rollback;
	return
end if
dw_rias.deleterow(fila)
if dw_rias.update()=-1 then
	rollback;
	return
end if
if dw_trae.update()=-1 then
	rollback;
else
	commit;
	i_cambio='Y'
end if

end event

type dw_trae_varias from datawindow within w_new_estad_ria_os
boolean visible = false
integer x = 4795
integer y = 684
integer width = 151
integer height = 72
integer taborder = 170
boolean enabled = false
string title = "none"
string dataobject = "dw_trae_varias"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_registra from picturebutton within w_new_estad_ria_os
event mousemove pbm_mousemove
integer x = 4393
integer y = 596
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &"
boolean originalsize = true
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Registrar Procedimientos [Alt+R]"
end type

event clicked;string ambito,finali,coduf,codcc,crips,uf,cc,cemp,ccont
long j,donde,nserv,k,l,z,tt,busca,l_item
datetime fechasa
dw_trae.accepttext()
cemp=i_cemp
ccont=i_ccont
if dw_trae.find('asumin=0',1,dw_trae.rowcount())>0 then
	if messagebox("Atención","Hay procedimientos que no van a ser atendidos (ASumin = cero), desea continuar aún así ?",question!,yesno!,1)=2 then return
end if
dw_cont_det.retrieve(i_cemp,i_ccont,i_st.tingres)
if dw_cont_det.rowcount()=0 then
	messagebox("Error","El contrato de este paciente no tiene planes de servicios, adicionele planes para poder continuar")
	return
end if
string tipo_afil,des_cont,plan,codproc

boolean yapaso=false
dw_empac.retrieve(i_cemp,i_ccont,tipdoc,docu)
if dw_empac.rowcount()=0 then
	messagebox("Atención","El paciente no tiene asignada la empresa de ese ingreso, revise el responsable de ese ingreso")
	return
end if
tipo_afil=dw_empac.getitemstring(1,"codta")
dw_segrespon.retrieve(i_cemp,i_ccont,tipo_afil)
select max(nservicio) into :nserv from serviciosingreso where contador=:i_st.numero and clugar=:i_st.lugar;
if isnull(nserv) then nserv=0
nserv ++
setnull(codcc)
setnull(coduf)
//if w_atiende_os.tipo_ingres='3' then
SELECT Camas.CUfuncional, Camas.CCcosto into :coduf,:codcc
FROM Camas 
WHERE ningreso=:i_nh AND clugar_ing=:i_clug_hadm and tingreso=:i_st.tingres;

SELECT hospsali.fechaegreso,hospadmi.autoriza into:fechasa,:i_nautoriza
FROM hospadmi inner join hospsali on (hospadmi.codtingre = hospsali.codtingre) and (hospadmi.clugar = hospsali.clugar_hadm) and (hospadmi.nh = hospsali.nhosp)
where (((hospadmi.nh)=:i_nh) and ((hospadmi.clugar)=:i_clug_hadm) and ((hospadmi.codtingre)=:i_st.tingres));

for j=1 to dw_trae.rowcount()
	if dw_trae.getitemnumber(j,"asumin")>0 then
		codproc=dw_trae.getitemstring(j,"codproced")
		long cant=1
		if not isnull(codproc) then
			crips=dw_trae.getitemstring(j,"rip_proc")
			///////*********
			DO // pa poder revisar en todos los responsables
				if dw_segrespon.rowcount()>0 then des_cont=dw_segrespon.getitemstring(1,"descontrato")
				if dw_cont_det.rowcount()=0 then 
					messagebox("Error de Configuración","El contrato "+dw_segrespon.getitemstring(1,"descontrato")+" de la empresa "+dw_segrespon.getitemstring(1,"desemp")+" no tiene planes")
					return
				end if	
				/// viene lo duro	
				for z=1 to dw_cont_det.rowcount() // de aquí tiene que salir cuando encuentre los valores
					plan=dw_cont_det.getitemstring(z,"cplan")
					if f_proc_plan(codproc,plan) then goto salio
				next
			/// fin de viene lo duro
				if yapaso then 
					messagebox("Error en configuración de contratos","No se puede encontrar responsable de este procedimiento, revise incluso la empresa Particular")
					return
				end if
				if dw_segrespon.getitemstring(1,"segrespon")<>"" and dw_segrespon.getitemstring(1,"contsegrespon")<>"" then
					cemp=dw_segrespon.getitemstring(1,"segrespon")
					ccont=dw_segrespon.getitemstring(1,"contsegrespon")
					dw_segrespon.retrieve(cemp,ccont,tipo_afil)
				else
					cemp='0'
					ccont='1'
					yapaso=true
				end if
				dw_cont_det.retrieve(cemp,ccont,i_st.tingres/*tipoingreso*/)
			LOOP WHILE true
			salio:
			///// fin revisa a quien le van a cargar esto
			setnull(plan)
			/////*******
			long hasta,cantidad
			if crips='6' or crips='7' then
				hasta=1
				cantidad=dw_trae.getitemnumber(j,"asumin")
			else
				cantidad=1
				hasta=dw_trae.getitemnumber(j,"asumin")
			end if
			for k=1 to hasta
				donde=dw_trae_varias.insertrow(0)
				dw_trae_varias.setitem(donde,"nservicio",nserv)
				if idw_ufun.rowcount()=0 then idw_ufun.insertrow(1)
				if idw_cc.rowcount()=0 then idw_cc.insertrow(1)
				donde=dw_rias.insertrow(0)
				dw_rias.setitem(donde,"cproced",codproc)
				dw_rias.setitem(donde,"usuario",usuario)
				select tipoproc into :finali from proced where codproced=:codproc;
				if isnull(finali) then finali='3'
				dw_rias.setitem(donde,"rips_descripcion",crips)
				dw_rias.setitem(donde,"rips",crips)
				dw_rias.setitem(donde,"facturar",dw_trae.getitemnumber(j,"facturar"))
		
				if isnull(fechasa) or fechasa=datetime('01/01/1900') then 
					dw_rias.setitem(donde,"s_fecha",datetime(today(),time(string(now()))))
				else
					dw_rias.setitem(donde,"s_fecha",fechasa)
				end if
				dw_rias.setitem(donde,"s_cantidad",cantidad)
				dw_rias.setitem(donde,"contador",i_st.numero)
				dw_rias.setitem(donde,"cemp",cemp)
				dw_rias.setitem(donde,"cplan",plan)
				dw_rias.setitem(donde,"ccontrato",ccont)
				dw_rias.setitem(donde,"clugar",i_st.lugar)
				dw_rias.setitem(donde,"nservicio",nserv)
				choose case crips
					case '1'
						dw_rias.setitem(donde,"s_causaexterna",i_causaext)
						dw_rias.setitem(donde,"s_diagprin_",st_cdiaging.text)
						dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
						dw_rias.setitem(donde,"s_fin_consulta",i_fin_consulta)
						dw_rias.setitem(donde,"s_tipodiagprin",i_tipodx)
					case '2'
						dw_rias.setitem(donde,"s_diagprin_",st_cdiaging.text)
						dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
						dw_rias.setitem(donde,"s_finalidadproced",finali)
						dw_rias.setitem(donde,"s_ambitoproced",is_amb)
					case '8'
						dw_rias.setitem(donde,"s_causaexterna",i_causaext)	
						dw_rias.setitem(donde,"s_diagprin_",st_cdiaging.text)
						dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
					case '9'
						dw_rias.setitem(donde,"s_diagprin_",st_cdiaging.text)
						dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
						dw_rias.setitem(donde,"s_finalidadproced",finali)
						dw_rias.setitem(donde,"s_ambitoproced",is_amb)						
				end choose
				setnull(cc)
				uf=cc
				if idw_ufun.retrieve(codproc,i_st.tingres)> 0 then
					if idw_ufun.rowcount()=1 then 
						uf=idw_ufun.getitemstring(1,'coduf')
					else
						busca=idw_ufun.find("coduf='"+coduf+"'",1,idw_ufun.rowcount())
						if busca<>0 then uf=coduf//debe dejar el de la cama
					end if
					if idw_cc.retrieve(codproc,i_st.tingres,uf)>0 then
						if idw_cc.rowcount()=1 then
							cc=idw_cc.getitemstring(1,'codcc')
						else
							busca=idw_cc.find("codcc='"+codcc+"'",1,idw_cc.rowcount())
							if busca<>0 then cc=codcc
						end if
					end if
					if isnull(uf) or isnull(cc) then//porque a veces uno de los dos no es null
						setnull(uf)
						setnull(cc)
					end if
				end if
				dw_rias.setitem(donde,"cufuncional",uf)
				dw_rias.setitem(donde,"cccosto",cc)
				
				dw_rias.setitem(donde,"tipo_orden",'H')
//				choose case i_st.tingres
//					case '2' 
//						ambito='3'
//					case '1'
//						ambito='1'
//					case '3','4','7'
//						ambito='2'
//				end choose
//				dw_rias.setitem(donde,"s_ambitoproced",ambito)
				dw_rias.setitem(donde,"cprof",i_st.profe)
				if idw_espe.retrieve(i_st.profe)=1 then
					dw_rias.setitem(donde,"s_codespecialidad",idw_espe.getitemstring(1,'cesp'))
				end if
				dw_rias.setitem(donde,"conta_orden",i_st.numero)
				dw_rias.setitem(donde,"clug_orden",i_st.lugar)
				dw_rias.setitem(donde,"norden_serv",i_norden)
				dw_rias.setitem(donde,"item_orden",dw_trae.getitemnumber(j,"item"))
				l_item=dw_trae.getitemnumber(j,"item")
				if isnull(i_nautoriza) then
					setnull(i_nautoriza)
					select autorizacion into :i_nautoriza
					from hosp_autoriza_cpo
					where (((autorizacion) is not null) and ((contador)=:i_st.numero) and ((clugar_os)=:i_st.lugar) and ((nsolicitud)=:i_norden) and ((item_os)=:l_item));
				end if
				dw_rias.setitem(donde,"nautoriza",i_nautoriza)			
				nserv ++
			next
			tt=dw_trae.getitemnumber(j,"suministrada")
			dw_trae.setitem(j,"suministrada",dw_trae.getitemnumber(j,"asumin")+tt)
			if dw_trae.getitemnumber(j,"suministrada") >= dw_trae.getitemnumber(j,"solicitada")then 
				dw_trae.setitem(j,"estado","2")
			end if
			dw_trae.setitem(j,"asumin",0)
		else  // M E D I C A M E N T O S//////////////////////
			crips=dw_trae.getitemstring(j,"rip_med")
			codproc=dw_trae.getitemstring(j,"c_medica")
			string i_uf,i_cc
			setnull(i_uf)
			setnull(i_cc)
			select distinct sum_clase.coduf, sum_clase.codcc  into :i_uf ,:i_cc
			from (sumarticulo inner join sumgenerico on sumarticulo.codgenerico = sumgenerico.codgenerico) inner join sum_clase on (sumgenerico.codgrupo = sum_clase.codgrupo) and (sumgenerico.codclase = sum_clase.codclase)
			where (((sumgenerico.c_medica)=:codproc));
			DO // pa poder revisar en todos los responsables
				if dw_segrespon.rowcount()>0 then des_cont=dw_segrespon.getitemstring(1,"descontrato")
				if dw_cont_det.rowcount()=0 then 
					messagebox("Error de Configuración","El contrato "+dw_segrespon.getitemstring(1,"descontrato")+" de la empresa "+dw_segrespon.getitemstring(1,"desemp")+" no tiene planes")
					return
				end if	
				/// viene lo duro	
				for z=1 to dw_cont_det.rowcount() // de aquí tiene que salir cuando encuentre los valores
					plan=dw_cont_det.getitemstring(z,"cplan")
					if f_med_plan(plan,codproc) then goto salio2
				next
			/// fin de viene lo duro
				if yapaso then 
					messagebox("Error en configuración de contratos","No se puede encontrar responsable de este procedimiento, revise incluso la empresa Particular")
					return
				end if
				if dw_segrespon.getitemstring(1,"segrespon")<>"" and dw_segrespon.getitemstring(1,"contsegrespon")<>"" then
					cemp=dw_segrespon.getitemstring(1,"segrespon")
					ccont=dw_segrespon.getitemstring(1,"contsegrespon")
					dw_segrespon.retrieve(cemp,ccont,tipo_afil)
				else
					cemp='0'
					ccont='1'
					yapaso=true
				end if
				dw_cont_det.retrieve(cemp,ccont,i_st.tingres/*tipoingreso*/)
			LOOP WHILE true
			salio2:
			donde=dw_trae_varias.insertrow(0)
			dw_trae_varias.setitem(donde,"nservicio",nserv)
			if idw_ufun.rowcount()=0 then idw_ufun.insertrow(1)
			if idw_cc.rowcount()=0 then idw_cc.insertrow(1)
			donde=dw_rias.insertrow(0)
			dw_rias.setitem(donde,"c_medica",dw_trae.getitemstring(j,"c_medica"))
			dw_rias.setitem(donde,"cod_oxig",dw_trae.getitemstring(j,"cod_oxig"))
			if isnull(dw_trae.getitemstring(j,"codarticulo")) or dw_trae.getitemstring(j,"codarticulo")="" then
				string art
				setnull(art)
				dw_rias.setitem(donde,"codarticulo",art)
			else
				dw_rias.setitem(donde,"codarticulo",dw_trae.getitemstring(j,"codarticulo"))
			end if
			dw_rias.setitem(donde,'coddoc_ent',dw_trae.getitemstring(j,'coddoc_ent'))
			dw_rias.setitem(donde,'clugar_ent',dw_trae.getitemstring(j,'clugar_ent'))
			dw_rias.setitem(donde,'numdoc_ent',dw_trae.getitemnumber(j,'numdoc_ent'))
			dw_rias.setitem(donde,'item_ent',dw_trae.getitemnumber(j,'item_ent'))
			if not isnull(dw_trae.getitemdatetime(j,'fecha_venc')) then 
				dw_rias.setitem(donde,'fecha_venc',dw_trae.getitemdatetime(j,'fecha_venc'))
				dw_rias.setitem(donde,'lote',dw_trae.getitemstring(j,'lote'))
				dw_rias.setitem(donde,'convenio',dw_trae.getitemstring(j,'convenio'))
			end if
			dw_rias.setitem(donde,"rips_descripcion",crips)
			dw_rias.setitem(donde,"rips",crips)
			dw_rias.setitem(donde,"s_fecha",datetime(today(),time(string(now()))))
			dw_rias.setitem(donde,"usuario",usuario)
			dw_rias.setitem(donde,"facturar",dw_trae.getitemnumber(j,"facturar"))
			dw_rias.setitem(donde,"s_cantidad",dw_trae.getitemnumber(j,"asumin"))
			dw_rias.setitem(donde,"contador",i_st.numero)
			dw_rias.setitem(donde,"cemp",cemp)
			dw_rias.setitem(donde,"cplan",plan)
			dw_rias.setitem(donde,"cprof",i_st.profe)
			if idw_espe.retrieve(i_st.profe)=1 then
				dw_rias.setitem(donde,"s_codespecialidad",idw_espe.getitemstring(1,'cesp'))
			end if
			dw_rias.setitem(donde,"ccontrato",ccont)
			dw_rias.setitem(donde,"clugar",clugar)
			dw_rias.setitem(donde,"nservicio",nserv)
			dw_rias.setitem(donde,"tipo_orden",'H')
			dw_rias.setitem(donde,"cufuncional",i_uf)
			dw_rias.setitem(donde,"cccosto",i_cc)
			dw_rias.setitem(donde,"conta_orden",i_st.numero)
			dw_rias.setitem(donde,"clug_orden",i_st.lugar)
			dw_rias.setitem(donde,"norden_serv",i_norden)
			dw_rias.setitem(donde,"item_orden",dw_trae.getitemnumber(j,"item"))
			if isnull(i_nautoriza) then
				setnull(i_nautoriza)
				select autorizacion into :i_nautoriza
				from hosp_autoriza_cpo
				where (((autorizacion) is not null) and ((contador)=:i_st.numero) and ((clugar_os)=:i_st.lugar) and ((nsolicitud)=:i_norden) and ((item_os)=:l_item));
			end if
			dw_rias.setitem(donde,"nautoriza",i_nautoriza)		
			//solicitat tt_entrega
			//dw_trae.setitem(j,"suministrada",dw_trae.getitemnumber(j,"asumin")+tt)
			if i_mueve_kardex='1' then
				tt=dw_trae.getitemnumber(j,"sumi")
				dw_trae.setitem(j,"sumi",dw_trae.getitemnumber(j,"asumin")+tt)
				dw_trae.setitem(j,"suministrada",dw_trae.getitemnumber(j,"tt_entrega"))
				if dw_trae.getitemnumber(j,"tt_entrega") >= dw_trae.getitemnumber(j,"solicitat")then dw_trae.setitem(j,"estado","2")
			else
				tt=dw_trae.getitemnumber(j,"suministrada")
				dw_trae.setitem(j,"suministrada",dw_trae.getitemnumber(j,"asumin")+tt)
				if dw_trae.getitemnumber(j,"suministrada") >= dw_trae.getitemnumber(j,"solicitada")then dw_trae.setitem(j,"estado","2")
			end if
			dw_trae.setitem(j,"asumin",0)
			dw_trae.setitem(j,"enfermeria",'0')
			nserv ++
		end if
	end if
next

if dw_trae_varias.rowcount()=0 then return
if dw_rias.update()=-1 then
	rollback;
else
	if dw_trae.update()=-1 then
		rollback;
		return
	end if
	select count(item) into :j from oscuerpo
	where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden and estado='1';
	if j=0 then 
		update oscabeza set estado='2' 
		where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando estado de orden de servicio",sqlca.sqlerrtext)
			rollback;
			return
		end if
	end if
	commit;
	i_cambio='Y'
	dw_rias.reset()
	for j=1 to dw_trae_varias.rowcount()
		if idw_ufun.rowcount()=0 then idw_ufun.insertrow(1)
		if idw_cc.rowcount()=0 then idw_cc.insertrow(1)
		dw_rias.retrieve(i_st.numero,dw_trae_varias.getitemnumber(j,"nservicio"),i_st.lugar)
	next
	dw_rias.triggerevent(rowfocuschanged!)
	dw_trae_varias.reset()
end if
end event

type dw_trae from datawindow within w_new_estad_ria_os
integer x = 23
integer y = 132
integer width = 5934
integer height = 448
integer taborder = 190
string title = "none"
string dataobject = "dw_ord_serv_pa_rips"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event retrievestart;return 2
end event

event itemchanged;if getcolumnname()="facturar" then
	accepttext()
	return
end if
if isnull(getitemstring(getrow(),"codproced")) then //es medicamento?
	if long(data)+getitemnumber(getrow(),"suministrada")>getitemnumber(getrow(),"entregada") then
		settext('0')
		setitem(getrow(),"asumin",0)
		return 1
	end if
else
	if long(data)+getitemnumber(getrow(),"suministrada")>getitemnumber(getrow(),"solicitada") then
		settext('0')
		setitem(getrow(),"asumin",0)
		return 1
	end if
end if
accepttext()			
end event

event clicked;if row>0 and getrow()<>row then scrolltorow(row)
end event

type dw_empac from datawindow within w_new_estad_ria_os
boolean visible = false
integer x = 5001
integer y = 676
integer width = 64
integer height = 68
integer taborder = 180
boolean enabled = false
string title = "none"
string dataobject = "dw_emp_pac"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_cont_det from datawindow within w_new_estad_ria_os
boolean visible = false
integer x = 4891
integer y = 584
integer width = 82
integer height = 72
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cont_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_segrespon from datawindow within w_new_estad_ria_os
boolean visible = false
integer x = 4782
integer y = 584
integer width = 87
integer height = 52
integer taborder = 160
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_segrespon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_2 from statictext within w_new_estad_ria_os
integer x = 114
integer y = 740
integer width = 782
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Replicar cambios en todas las filas"
boolean focusrectangle = false
end type

type cbx_replica from checkbox within w_new_estad_ria_os
integer x = 32
integer y = 736
integer width = 73
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
boolean checked = true
end type

type sle_5 from singlelineedit within w_new_estad_ria_os
integer x = 2994
integer y = 632
integer width = 338
integer height = 68
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
string text = "No obligatorio"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_3 from singlelineedit within w_new_estad_ria_os
integer x = 2624
integer y = 632
integer width = 338
integer height = 68
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
string text = "Obligatorio"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_new_estad_ria_os
integer x = 2149
integer y = 632
integer width = 283
integer height = 68
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
string text = "Completo"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_new_estad_ria_os
integer x = 1810
integer y = 632
integer width = 283
integer height = 68
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 16777215
string text = "Incompleto"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_new_estad_ria_os
integer x = 2560
integer y = 580
integer width = 1225
integer height = 144
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Obligatoriedad de campos"
end type

type gb_3 from groupbox within w_new_estad_ria_os
integer x = 1787
integer y = 580
integer width = 677
integer height = 144
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Estado Rips"
end type

type cb_cancel from picturebutton within w_new_estad_ria_os
event mousemove pbm_mousemove
integer x = 2501
integer y = 1844
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "puerta.gif"
string disabledname = "d_puerta.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type cb_guarda from picturebutton within w_new_estad_ria_os
event mousemove pbm_mousemove
integer x = 2341
integer y = 1844
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &g"
boolean default = true
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;dw_rias.accepttext()
if dw_rias.update() = 1 then 
	commit;
end if
end event

type st_1 from statictext within w_new_estad_ria_os
integer x = 919
integer y = 740
integer width = 4983
integer height = 76
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_anul from radiobutton within w_new_estad_ria_os
integer x = 645
integer y = 640
integer width = 302
integer height = 52
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Anulados"
end type

event clicked;dw_rias.setfilter("estado='Anulado'")
dw_rias.filter()
end event

type rb_incomp from radiobutton within w_new_estad_ria_os
integer x = 1088
integer y = 628
integer width = 347
integer height = 52
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Incompletos"
end type

event clicked;dw_rias.setfilter("estado='Incompleto'")
dw_rias.filter()
end event

type rb_comp from radiobutton within w_new_estad_ria_os
integer x = 41
integer y = 640
integer width = 325
integer height = 52
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Completos"
end type

event clicked;dw_rias.setfilter("estado='Completo'")
dw_rias.filter()
end event

type rb_tod from radiobutton within w_new_estad_ria_os
integer x = 375
integer y = 640
integer width = 242
integer height = 52
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;dw_rias.setfilter("")
dw_rias.filter()
end event

type dw_rias from datawindow within w_new_estad_ria_os
integer x = 27
integer y = 928
integer width = 5938
integer height = 840
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_rips_os"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event updatestart;long i , filas
string nv_est,estr
filas=rowcount()
for i=1 to filas
	nv_est=getitemstring(i,'estado')
	if nv_est<>"Anulado" then 
		choose case nv_est
			case "Completo"
				estr="1"
			case "Incompleto"
				estr="2"
		end choose
		setitem(i,"estria",estr)
	end if
next
end event

event itemchanged;accepttext()
string cod,col,este='',nulo
long colum,i,veri
st_return_diags st
datetime ldt_actual

setnull(nulo)
colum=getcolumn()
col=getcolumnname()
if colum=13 then
	select desesp into :st_1.text from especialidades where codesp= :data;
	if st_1.text="" then return 1
end if
choose case colum
	case 58 //desufuncional
		accepttext()
		setitem(row,56,idw_ufun.getitemstring(idw_ufun.getrow(),"coduf"))
		setitem(row,57,"")
		setitem(row,59,"")
		idw_cc.retrieve(getitemstring(row,"cproced"),i_st.tingres,idw_ufun.getitemstring(idw_ufun.getrow(),"coduf"))
	case 59 //descripcion :cc
		accepttext()
		setitem(row,57,idw_cc.getitemstring(idw_cc.getrow(),"codcc"))
	case 13, 15, 17, 33, 35, 37
		if cbx_replica.checked then
			for i=1 to rowcount()
				if i<>row and not isnull(getitemstring(i,"r_"+mid(dwo.name,3))) then 
					if isnull(getitemstring(i,string(dwo.name))) then 
						if (this.getitemstring(row,'s_fin_consulta') >='01' and this.getitemstring(row,'s_fin_consulta') <= '08') then 
							this.setitem(row,'s_causaexterna',"15")
						else
							this.setitem(row,'s_causaexterna',nulo)
						end if 
						veri=f_valida_fin_con(this.getitemstring(i,'s_fin_consulta'),this.getitemstring(i,'s_causaexterna'),this.getitemstring(i,"sexo"),this.getitemnumber(i,"dias"),this.getitemstring(i,'s_diagprin'))
						if veri=-1 then
							this.setitem(i,dwo.name,'')
							return 1
						end if //veri
					end if
				end if
			next
		end if
		if (this.getitemstring(row,'s_fin_consulta') >='01' and this.getitemstring(row,'s_fin_consulta') <= '08') then 
			this.setitem(row,'s_causaexterna',"15")
		else
			this.setitem(row,'s_causaexterna',nulo)
		end if 
		veri=f_valida_fin_con(this.getitemstring(row,'s_fin_consulta'),this.getitemstring(row,'s_causaexterna'),this.getitemstring(row,"sexo"),this.getitemnumber(row,"dias"),this.getitemstring(row,'s_diagprin'))
		if veri=-1 then
			this.setitem(row,colum,"")
			return 1
		end if
		
end choose

ldt_actual=datetime(today(),now())
if col='s_fecha' and  (i_st.fecha_ord< datetime(data) or  datetime(data)> ldt_actual) then
	setitem(getrow(),"s_fecha",ldt_actual)
	return 1
end if

if col='s_diagprin_' or col='s_diagrel1_' or col='s_diagrel2_' or col='s_diagrel3_' or col='s_diagcompli' then
	if data<>"" then
		st=f_check_diag(data,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0',this.getitemstring(row,'rips'),'0')
		if st.descrip_diag="" then
			setitem(row,colum,"")
			setitem(row,left(col,len(col)-1),nulo)
			return 1
		end if
		st_1.text=st.descrip_diag
		setitem(row,left(col,len(col)-1),este)
	else
		st_1.text=''
		setitem(row,left(col,len(col)-1),nulo)
	end if
end if
if col='desesp' then
	setitem(row,'s_codespecialidad',idw_espe.getitemstring(idw_espe.getrow(),'cesp'))
end if
if col='cprof' then
	setitem(row,'s_codespecialidad',nulo)
	setitem(row,'desesp',nulo)
	if idw_espe.retrieve(data)=1 then
		setitem(row,'s_codespecialidad',idw_espe.getitemstring(1,'cesp'))
		setitem(row,'desesp',idw_espe.getitemstring(1,'desesp'))
	end if
end if
end event

event doubleclicked;string colu,carreta,resu,cual,temp
colu= dwo.name
cual="r_" + mid(colu,3)
if right(cual,1)='_' then cual=left(cual,len(cual)-1)
if describe(cual+".id")="!" then return
carreta="evaluate ('if ("+ cual +'="0", 1, 0 )'+"'," +string(row) +")"
resu=describe(carreta)
if resu="1" then return
if colu="s_diagprin_" or colu="s_diagrel1_" or colu="s_diagrel2_" or colu="s_diagrel3_" or colu="s_diagcompli_" then
	st_edadsexo st_es
	st_diag st_d
	st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
	st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
	st_es.antece='0'
	if getitemstring(getrow(),'rips')='1' then
		st_es.proced='0'
	else
		st_es.proced='1'
	end if	
	openwithparm(w_busca_diag,st_es)
	st_d=message.powerobjectparm
	if not isValid(st_d) then return
	if not isNull(st_d.codrip) then
		setitem(row,colu,st_d.codrip)
		setitem(row,left(colu,len(colu)-1),st_d.codgeral)
		st_1.text=st_d.descripcion
	end if
end if
if colu="s_codespecialidad" then
	retorna_busqueda=""
	open (w_busca_espe)
	if retorna_busqueda<>"" then
		dw_rias.setitem(dw_rias.getrow(),"s_codespecialidad",retorna_busqueda)
		st_1.text=retorna_des_busqueda
	end if
end if




end event

event itemfocuschanged;accepttext()
string cod,ojo,col
long colum
st_return_diags st

colum=getcolumn()
col=getcolumnname()
choose case colum
	case 13
		ojo=getitemstring(row,colum)
		if ojo<>"" then
			select desesp into :st_1.text from especialidades where codesp= :ojo;
		end if
end choose
if col='s_diagprin_' or col='s_diagrel1_' or col='s_diagrel2_' or col='s_diagrel3_' or col='s_diagcompli' then
	if getitemstring(row,colum)<>"" then
		string este
		este=getitemstring(row,left(col,len(col)-1))
		st=f_check_diag(getitemstring(row,colum),w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0',this.getitemstring(row,'rips'),'0')
		if st.descrip_diag="" then
			setitem(row,colum,"")
			return 1
		end if
		st_1.text=st.descrip_diag
	else
		st_1.text=""
	end if
end if
end event

event retrievestart;sexo_paci=w_principal.dw_1.getitemstring(1,"sexo")
return 2
end event

event retrieveend;if this.update() = 1 then 
	commit;
end if

end event

event rowfocuschanged;long fila
string este
fila=getrow()
if fila<1 then return
idw_ufun.retrieve(getitemstring(fila,"cproced"),i_st.tingres)
idw_cc.reset()
if getitemstring(fila,"desufuncional")<>"" then
	idw_cc.retrieve(getitemstring(fila,"cproced"),i_st.tingres,getitemstring(fila,56))
end if
idw_espe.retrieve(getitemstring(fila,'cprof'))
if not isnull(getitemstring(fila,"cproced")) and getitemstring(fila,"cproced")<>'' then
	este=getitemstring(fila,"cproced")
	select descripcion into :st_desproc.text from proced where codproced=:este;
else
	este=getitemstring(fila,"c_medica")
	select medicamento into :st_desproc.text from medicamentos where c_medica=:este;
end if
end event

event itemerror;return 1
end event

type sle_4 from singlelineedit within w_new_estad_ria_os
integer x = 3365
integer y = 632
integer width = 338
integer height = 68
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 12632256
string text = "No Requerido"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_new_estad_ria_os
integer x = 23
integer y = 580
integer width = 1710
integer height = 144
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Estado Rips"
end type

type dw_inf from datawindow within w_new_estad_ria_os
integer x = 9
integer width = 5829
integer height = 132
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

