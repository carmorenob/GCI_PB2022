$PBExportHeader$w_mod_impuestos.srw
forward
global type w_mod_impuestos from window
end type
type dw_3 from datawindow within w_mod_impuestos
end type
type dw_modcab from datawindow within w_mod_impuestos
end type
type dw_mcpo from datawindow within w_mod_impuestos
end type
type dw_movi from datawindow within w_mod_impuestos
end type
type dw_2 from datawindow within w_mod_impuestos
end type
type pb_1 from picturebutton within w_mod_impuestos
end type
type pb_2 from picturebutton within w_mod_impuestos
end type
type dw_1 from datawindow within w_mod_impuestos
end type
type gb_1 from groupbox within w_mod_impuestos
end type
type gb_2 from groupbox within w_mod_impuestos
end type
end forward

global type w_mod_impuestos from window
integer width = 4485
integer height = 1732
boolean titlebar = true
string title = "Modificación de Impuestos y Reservas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_3 dw_3
dw_modcab dw_modcab
dw_mcpo dw_mcpo
dw_movi dw_movi
dw_2 dw_2
pb_1 pb_1
pb_2 pb_2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_mod_impuestos w_mod_impuestos

type variables
st_xa_antis i_docu
datawindowchild idwx_iva2,idwx_cta2,idwx_concep,dwc_per

end variables

on w_mod_impuestos.create
this.dw_3=create dw_3
this.dw_modcab=create dw_modcab
this.dw_mcpo=create dw_mcpo
this.dw_movi=create dw_movi
this.dw_2=create dw_2
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_3,&
this.dw_modcab,&
this.dw_mcpo,&
this.dw_movi,&
this.dw_2,&
this.pb_1,&
this.pb_2,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_mod_impuestos.destroy
destroy(this.dw_3)
destroy(this.dw_modcab)
destroy(this.dw_mcpo)
destroy(this.dw_movi)
destroy(this.dw_2)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;i_docu=message.powerobjectparm

int l_i,donde,fila,lit,lsit
double lnr
decimal dif
string lcd,lcl
date ld_termina

dw_3.retrieve(i_docu.dw_intfaz.getitemstring(1,'clugar'),i_docu.dw_intfaz.getitemstring(1,'coddoc'),i_docu.dw_intfaz.getitemnumber(1,'nrelacion'))	
i_docu.dw_cpo.RowsCopy(i_docu.dw_cpo.GetRow(), i_docu.dw_cpo.RowCount(), Primary!, dw_2, 1, Primary!)
idwx_concep.retrieve(w_recibe_fact.is_emp,'R','1')
for l_i=1 to i_docu.dw_intfaz.rowcount()
	dw_1.insertrow(1)
	lcd=i_docu.dw_intfaz.getitemstring(l_i,'coddoc')
	lcl=i_docu.dw_intfaz.getitemstring(l_i,'clugar')
	lnr=i_docu.dw_intfaz.getitemnumber(l_i,'nrelacion')
	lit=i_docu.dw_intfaz.getitemnumber(l_i,'item')
	lsit=i_docu.dw_intfaz.getitemnumber(l_i,'subitem')
	dw_1.setitem(1,'clugar',lcl)
	dw_1.setitem(1,'coddoc',lcd)
	dw_1.setitem(1,'nrelacion',lnr)	
	dw_1.setitem(1,'item',lit)	
	dw_1.setitem(1,'subitem',lsit)		
	dw_3.setfilter("clugar='"+lcl+"' and coddoc='"+lcd+"' and nrelacion="+string(lnr)+" and item="+string(lit)+" and subitem="+string(lsit))
	dw_3.filter()
	if dw_3.rowcount()>0 then
		dw_1.setitem(1,'tvalor',dw_3.getitemnumber(dw_3.getrow(),'stvalor'))	
		dw_1.setitem(1,'valor_ant',dw_3.getitemnumber(dw_3.getrow(),'stvalor'))	
		dw_1.setitem(1,'base',dw_3.getitemnumber(dw_3.getrow(),'sbase'))	
		dw_1.setitem(1,'base_ant',dw_3.getitemnumber(dw_3.getrow(),'sbase'))	
		dw_1.setitem(1,'diferencia',dw_3.getitemnumber(dw_3.getrow(),'sdife'))	
	else
		dw_1.setitem(1,'tvalor',i_docu.dw_intfaz.getitemnumber(l_i,'tvalor'))	
		dw_1.setitem(1,'valor_ant',i_docu.dw_intfaz.getitemnumber(l_i,'tvalor'))	
		dw_1.setitem(1,'base',i_docu.dw_intfaz.getitemnumber(l_i,'base'))	
		dw_1.setitem(1,'base_ant',i_docu.dw_intfaz.getitemnumber(l_i,'base'))	
		dw_1.setitem(1,'diferencia',0)	
	end if
	dw_1.setitem(1,'cod_concep',i_docu.dw_intfaz.getitemstring(l_i,'cod_concep'))
	dw_1.setitem(1,'compromiso',i_docu.dw_intfaz.getitemstring(l_i,'compromiso'))
	dw_1.setitem(1,'accion',i_docu.dw_intfaz.getitemstring(l_i,'accion'))
	dw_1.setitem(1,'asumar',i_docu.dw_intfaz.getitemstring(l_i,'asumar'))	
	dw_1.setitem(1,'sobre',i_docu.dw_intfaz.getitemstring(l_i,'sobre'))	
	dw_1.setitem(1,'desde',i_docu.dw_intfaz.getitemstring(l_i,'desde'))	
	dw_1.setitem(1,'sobre',i_docu.dw_intfaz.getitemstring(l_i,'sobre'))		
	dw_1.setitem(1,'cod_empre',i_docu.dw_intfaz.getitemstring(l_i,'cod_empre'))
	dw_1.setitem(1,'cod_total',i_docu.dw_intfaz.getitemstring(l_i,'cod_total'))
	dw_1.setitem(1,'cod_tipo',i_docu.dw_intfaz.getitemstring(l_i,'cod_tipo'))
	dw_1.setitem(1,'tercero',i_docu.dw_intfaz.getitemstring(l_i,'tercero'))	
	dw_1.setitem(1,'tipodoc',i_docu.dw_intfaz.getitemstring(l_i,'tipodoc'))	
	dw_1.setitem(1,'documento',i_docu.dw_intfaz.getitemstring(l_i,'documento'))	
	dw_1.setitem(1,'persona',i_docu.dw_intfaz.getitemstring(l_i,'persona'))	
	dw_1.setitem(1,'nombre1',i_docu.dw_intfaz.getitemstring(l_i,'nombre1'))	
	dw_1.setitem(1,'nombre2',i_docu.dw_intfaz.getitemstring(l_i,'nombre2'))	
	dw_1.setitem(1,'apellido1',i_docu.dw_intfaz.getitemstring(l_i,'apellido1'))	
	dw_1.setitem(1,'apellido2',i_docu.dw_intfaz.getitemstring(l_i,'apellido2'))	
	dw_1.setitem(1,'razon_social',i_docu.dw_intfaz.getitemstring(l_i,'razon_social'))	
	dw_1.setitem(1,'borrar',i_docu.dw_intfaz.getitemnumber(l_i,'borrar'))	
	dw_1.setitem(1,'cartipo',i_docu.dw_intfaz.getitemstring(l_i,'cartipo'))		
	dw_1.setitem(1,'codcaja',i_docu.dw_intfaz.getitemstring(l_i,'codcaja'))		
	dw_1.setitem(1,'clugar_ing',i_docu.dw_intfaz.getitemstring(l_i,'clugar_ing'))			
	dw_1.setitem(1,'ningreso',i_docu.dw_intfaz.getitemnumber(l_i,'ningreso'))	
	dw_1.setitem(1,'depe',i_docu.dw_intfaz.getitemstring(l_i,'depe'))	
	dw_1.setitem(1,'mitem',l_i)	
next
idwx_cta2.retrieve(w_recibe_fact.is_emp,i_docu.dw_intfaz.getitemstring(1,'cod_concep'))
dw_1.accepttext()
end event

type dw_3 from datawindow within w_mod_impuestos
boolean visible = false
integer x = 2994
integer y = 1504
integer width = 306
integer height = 68
integer taborder = 20
string title = "none"
string dataobject = "dw_trans_retencion_mod_todos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_modcab from datawindow within w_mod_impuestos
boolean visible = false
integer x = 3314
integer y = 1492
integer width = 242
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "dw_histo_docs_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_mcpo from datawindow within w_mod_impuestos
boolean visible = false
integer x = 3593
integer y = 1496
integer width = 430
integer height = 80
integer taborder = 20
string title = "none"
string dataobject = "dw_pre_doc_cp_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
dw_mcpo.GetChild('periodo',dwc_per)
dwc_per.SetTransObject(SQLCA)

end event

type dw_movi from datawindow within w_mod_impuestos
boolean visible = false
integer x = 4032
integer y = 1488
integer width = 320
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dw_plan_mov_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_2 from datawindow within w_mod_impuestos
integer x = 41
integer y = 76
integer width = 4352
integer height = 480
integer taborder = 10
string title = "none"
string dataobject = "dw_tesorelfactcpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;getchild('cod_rel',idwx_concep)
idwx_concep.settransobject(sqlca)
settransobject(sqlca)
end event

type pb_1 from picturebutton within w_mod_impuestos
integer x = 2011
integer y = 1492
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Aceptar y llevar a Cartera"
end type

event clicked;if messagebox("Atención","Va modificar el valor de Reserva y de los impuesto, desea ejecutar el proceso no abra modificación adicional?",question!,yesno!,2)=2 then
	close(parent)
else
	string l_clug,l_cdoc,l_td,l_nit,l_cdr,l_clr,l_cdg,l_clg
	double l_nrfc,l_irfc,l_nr,l_ir,l_perio,l_ng,l_ig,final
	double l_numdoc,l_vigencia,l_k,l_fila,modi=0,l_i,l_item,diffe,l_año
	string l_coddoc='GM',l_valor,l_codtotal,err
	date ld_termina
	uo_datastore dw_reserva,dw_giro

	sqlca.autocommit=false
	dw_reserva= Create uo_datastore
	dw_reserva.DataObject = 'dw_rfc_reserva'
	dw_reserva.SetTransObject(SQLCA)
	
	dw_giro= Create uo_datastore
	dw_giro.DataObject = 'dw_rfc_giro'
	dw_giro.SetTransObject(SQLCA)

	l_clug=dw_2.getitemstring(dw_2.getrow(),'clugar')
	l_cdoc=dw_2.getitemstring(dw_2.getrow(),'coddoc')
	l_nrfc=dw_2.getitemnumber(dw_2.getrow(),'nrelacion')
	l_irfc=dw_2.getitemnumber(dw_2.getrow(),'item')
	modi=dw_1.getitemdecimal(dw_1.getrow(),'sdife') 
	/// RESERVA
	dw_reserva.retrieve(l_cdoc,l_clug,l_nrfc,l_irfc)
	l_cdr=dw_reserva.getitemstring(1,'coddoc')
	l_clr=dw_reserva.getitemstring(1,'clugar')
	l_nr=dw_reserva.getitemnumber(1,'numdoc')
	l_ir=dw_reserva.getitemnumber(1,'item')
	l_td=dw_reserva.getitemstring(1,'td')
	l_nit=dw_reserva.getitemstring(1,'nit')
	l_vigencia=dw_reserva.getitemnumber(1,'cod_vigencia')
	l_año=year(today())
	/// Modifica Giro
	dw_giro.retrieve(l_cdoc,l_clug,l_nrfc,l_irfc)
	if dw_giro.rowcount() >0 then
		select termina into :ld_termina  from pre_vigencia where cod_vigencia = :l_vigencia;
		if dwc_per.Retrieve(l_vigencia,l_año) = 0 then
			messagebox('Error','No existen periodos para la vigencia seleccionada')
			dwc_per.insertRow(0)
			return -1
		end if
		
		if today()>=ld_termina  then
			l_perio = month(ld_termina)
		else
			l_perio = month(today())
		end if
		dw_modcab.InsertRow(1)
		dw_modcab.SetItem(1,'coddoc',l_coddoc)
		dw_modcab.SetItem(1,'cLugar',clugar)
		dw_modcab.SetItem(1,'cod_vigencia',l_vigencia)
		dw_modcab.SetItem(1,'periodo',l_perio)
		dw_modcab.SetItem(dw_modcab.GetRow(),'estado','1')
		if today()>=ld_termina  then
			dw_modcab.SetItem(1,'fecha',ld_termina)
		else
			dw_modcab.SetItem(1,'fecha',today())
		end if
		l_numdoc = f_trae_ndoc(l_coddoc,clugar,l_coddoc)
		if l_numdoc=-1 then return -1
		dw_modcab.SetItem(dw_modcab.Getrow(),'numdoc',l_numdoc)
		final = f_consec(l_vigencia,l_coddoc,clugar)
		dw_modcab.setitem(dw_modcab.GetRow(),'consecutivo',final)
		if today()>=ld_termina  then
			dw_modcab.setitem(dw_modcab.GetRow(),'fecha_consecu',datetime(ld_termina,now()))
		else
			dw_modcab.setitem(dw_modcab.GetRow(),'fecha_consecu',datetime(today(),now()))	
		end if
		dw_modcab.setitem(dw_modcab.GetRow(),'año',year(today()))
	
		for l_k=1 to	dw_giro.rowcount()
			l_cdg=dw_giro.GetItemString(l_k,'coddoc')
			l_clg=dw_giro.GetItemString(l_k,'cLugar')
			l_ng=dw_giro.GetItemNumber(l_k,'numdoc')
			l_ig=dw_giro.GetItemNumber(l_k,'item')
			l_codtotal=dw_giro.GetItemString(l_k,'codtotal')
			l_valor =dw_mcpo.Describe("Evaluate('max(item)',0)")
			l_fila = dw_mcpo.InsertRow(0)
			dw_mcpo.SetItem(l_fila,'coddoc',l_coddoc)
			dw_mcpo.SetItem(l_fila,'cLugar',clugar)
			dw_mcpo.SetItem(l_fila,'numdoc',l_numdoc)
			dw_mcpo.SetItem(l_fila,'item',long(l_valor) + 1)
			dw_mcpo.SetItem(l_fila,'cod_vigencia',l_vigencia)
			dw_mcpo.SetItem(l_fila,'periodo',l_perio)
			dw_mcpo.SetItem(l_fila,'codtotal',l_codtotal)
			dw_mcpo.SetItem(l_fila,'coddoc_orig',l_cdg)
			dw_mcpo.SetItem(l_fila,'cLugar_orig',l_clg)
			dw_mcpo.SetItem(l_fila,'numdoc_orig',l_ng)
			dw_mcpo.SetItem(l_fila,'item_orig',l_ig)
			dw_mcpo.SetItem(l_fila,'monto_vigente_orig',dw_giro.GetItemNumber(l_k,'monto')) 
			dw_mcpo.SetItem(l_fila,'monto_utilizado_orig',dw_giro.GetItemNumber(l_k,'monto_vigente')) 	
			setnull(diffe)
			diffe= - (modi * dw_giro.GetItemNumber(l_k,'pmontov'))
			dw_mcpo.setItem(l_fila,'monto', diffe + dw_giro.GetItemNumber(l_k,'monto_vigente'))
			dw_mcpo.SetItem(l_fila,'monto_vigente',diffe)		

			//preplan
			l_fila = dw_movi.InsertRow(0)
			dw_movi.setitem(l_fila,'cod_vigencia',l_vigencia)
			dw_movi.setitem(l_fila,'codtotal',l_codtotal)
			dw_movi.setitem(l_fila,'periodo',l_perio)
			if today()>=ld_termina  then
				dw_movi.setitem(l_fila,'fecha',datetime(ld_termina,now()))
			else
				dw_movi.setitem(l_fila,'fecha',datetime(today(),now()))
			end if
			dw_movi.setitem(l_fila,'coddoc',l_coddoc)
			dw_movi.setitem(l_fila,'clugar',clugar)
			dw_movi.setitem(l_fila,'numdoc',l_numdoc)
			dw_movi.setitem(l_fila,'item',long(l_valor) + 1)
			dw_movi.setitem(l_fila,'monto_mod_giro', (-1  * (modi * dw_giro.GetItemNumber(l_k,'pmontov')) ))
			dw_movi.setitem(l_fila,'año',year(today()))
			if l_k=1 then
				SELECT Max(pre_plan_movi_deta.num_movi) into :l_item
				FROM pre_plan_movi_deta
				WHERE pre_plan_movi_deta.cod_vigencia=:l_vigencia AND pre_plan_movi_deta.CodTotal=:l_codtotal
				AND pre_plan_movi_deta.periodo=:l_perio;
				if SQLCA.SQLcode=-1 then
					err = SQLCA.SQLerrtext
					rollback;
					messagebox('Error leyendo pre_plan_movi_deta',err)
					return -1
				end if
				if isnull(l_item) then l_item=0 
			end if
			l_item++
			dw_movi.setitem(l_fila,'num_movi',l_item) 
			
			////DEVUELVE VALORES
			l_cdr=dw_giro.getitemstring(l_k,'coddoc_orig')
			l_clr=dw_giro.getitemstring(l_k,'clugar_orig')
			l_nr=dw_giro.getitemnumber(l_k,'numdoc_orig')
			l_ir=dw_giro.getitemnumber(l_k,'item_orig')
			///Reservas
			update pre_docu_cp set monto_utilizado=monto_utilizado + :diffe, monto_interfaz=monto_interfaz + :diffe
			where coddoc=:l_cdr and clugar=:l_clr and numdoc=:l_nr and item=:l_ir;
			if SQLCA.SQLcode=-1 then
				err = SQLCA.SQLerrtext
				rollback;
				messagebox('Error actuializando pre_docu_cp1',err)
				return -1
			end if
			update pre_dispo_ter set monto_reser=monto_reser + :diffe
			where coddocu=:l_cdr and clugar=:l_clr and numdoc=:l_nr and tipodoc=:l_td and documento=:l_nit;
			if SQLCA.SQLcode=-1 then
				err = SQLCA.SQLerrtext
				rollback;
				messagebox('Error actuializando pre_dispo_ter1',err)
				return -1
			end if
			update mod_relacion_origen set valor=valor + :diffe
			where 
				char_orig1=:l_cdr and char_orig2=:l_clg and num_orig1=:l_nr and num_orig2=:l_ir and char_orig3=:l_td and char_doc3=:l_nit
			 	and num_doc1=:l_nrfc and num_doc2=:l_irfc	and char_doc1=:l_clug	and char_doc2=:l_cdoc; 
			if SQLCA.SQLcode=-1 then
				err = SQLCA.SQLerrtext
				rollback;
				messagebox('Error actuializando mod_relacion',err)
				return -1
			end if			
				
			//giro
			update pre_docu_cp set monto_vigente=monto_vigente + :diffe
			where coddoc=:l_cdg and clugar=:l_clg and numdoc=:l_ng and item=:l_ig;
			if SQLCA.SQLcode=-1 then
				err = SQLCA.SQLerrtext
				rollback;
				messagebox('Error actuializando pre_docu_cp2',err)
				return -1
			end if
		
			update pre_dispo_ter set monto=monto + :diffe
			where coddocu=:l_cdg and clugar=:l_clg and numdoc=:l_ng and tipodoc=:l_td and documento=:l_nit;
			if SQLCA.SQLcode=-1 then
				err = SQLCA.SQLerrtext
				rollback;
				messagebox('Error actuializando pre_dispo_ter',err)
				return -1
			end if
			
			update mod_relacion_origen set valor=valor + :diffe
			where 
				char_doc1=:l_cdg and char_doc2=:l_clg and num_doc1=:l_ng and num_doc2=:l_ig 
			 	and num_orig1=:l_nrfc and	num_orig2=:l_irfc and char_orig1=:l_cdoc and char_orig2=:l_clug; 
			if SQLCA.SQLcode=-1 then
				err = SQLCA.SQLerrtext
				rollback;
				messagebox('Error actuializando mod_relacion',err)
				return -1
			end if			
		next
		if dw_modcab.Update(TRUE,FALSE) = -1 then
			Rollback;
			Return -1
		end if
		if  dw_mcpo.Update(TRUE,FALSE) = -1 then
			Rollback;
			Return -1
		end if
		if dw_movi.Update() = -1 then 
			Rollback;
			return -1
		end if
	end if
end if
for  l_k=1 to  dw_1.rowcount()
	if dw_1.getitemnumber(l_k,'diferencia')=0 then dw_1.deleteRow(l_k)
next
for  l_k=1 to  dw_1.rowcount()
	dw_1.setitem(l_k,'fecha_mod',datetime(today(),now()))
	dw_1.setitem(l_k,'usuario',usuario)
next
if  dw_1.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
commit;
sqlca.autocommit=true
close(parent)
end event

type pb_2 from picturebutton within w_mod_impuestos
integer x = 2162
integer y = 1496
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
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_mod_impuestos
event p_scrollto ( integer p_fila,  string p_column )
event p_itemchanged ( string p_cual )
integer x = 46
integer y = 696
integer width = 4347
integer height = 736
integer taborder = 10
string title = "none"
string dataobject = "dw_trans_retencion_mod_todos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_scrollto(integer p_fila, string p_column);setredraw(false)
scrolltorow(p_fila)
setcolumn(p_column)
setredraw(true)


end event

event p_itemchanged(string p_cual);accepttext()
long j,donde,donde2,k,item
dec base_desde,porcentaje,iva,v_siniva
//datawindow dw_tot,dw_1

//for j=1 to rowcount()
//	if getitemstring(j,'accion')='1' then //incrementa
//			if p_cual='B' then //base
//			iva+=getitemnumber(j,'tvalor')
//		else
//			donde=idw_iva2.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_iva2.rowcount())
//			porcentaje+=idw_iva2.getitemnumber(donde,'porcentaje')
//		end if
//	end if
//next
//if i_orig<>'-' and i_orig<>'RFC' then 
//	if p_cual='C' then
//		v_siniva=round(dw_1.getitemNumber(dw_1.getrow(),'tbruto')/(1+porcentaje/100),i_dec_gral)
//		if i_dec_gral=0 then
//			v_siniva=long(v_siniva/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((v_siniva -long(v_siniva/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
//		end if
//		if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' then return
//		dw_1.setitem(dw_1.getrow(),'val_bruto',v_siniva)
//	else
//		v_siniva=round(dw_1.getitemNumber(dw_1.getrow(),'tbruto')-iva,i_dec_gral)
//		if i_dec_gral=0 then
//			v_siniva=long(v_siniva/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((v_siniva -long(v_siniva/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
//		end if
//		if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' then return
//		dw_1.setitem(dw_1.getrow(),'val_bruto',v_siniva)
//	end if
//end if


for j=1 to rowcount()
	if p_cual='B' and j=getrow() then continue
	donde=idwx_iva2.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idwx_iva2.rowcount())
	base_desde=idwx_iva2.getitemnumber(donde,'base')
	porcentaje=idwx_iva2.getitemnumber(donde,'porcentaje')
	if getitemstring(j,'sobre')<>'I' and getitemstring(j,'sobre')<>'P' and getitemstring(j,'sobre')<>'U' then
		if base_desde<=getitemdecimal(j,'base') then
			setitem(j,'tvalor',round(getitemdecimal(j,'base') *  porcentaje/100,w_recibe_fact.ii_dec_gral))
		else
			setitem(j,'tvalor',0)
		end if
	end if
	if getitemstring(j,'sobre')='O' then
		setitem(1,'asumar',idwx_iva2.getitemstring(donde,'cod_sobre'))
		setitem(j,'base',getitemnumber(1,'suma'))
		if base_desde<=getitemnumber(1,'suma') then
			setitem(j,'tvalor',round(getitemnumber(1,'suma') *  porcentaje/100,w_recibe_fact.ii_dec_gral))
		else
			setitem(j,'tvalor',0)
		end if
	end if
next

for j=1 to rowcount()
	setitem(j,'diferencia', (getitemdecimal(j,'valor_ant') - getitemdecimal(j,'tvalor')))
next
//for j=1 to rowcount()
//	donde2=dw_tot.find("cod_tipo='"+getitemstring(j,'cod_tipo')+"'",1,dw_tot.rowcount())
//	if donde2=0 then 
//		donde2=dw_tot.insertrow(0)
//		dw_tot.setitem(donde2,'clugar',tab_2.t2_3.t5.t5_1.dw_cpo.getitemstring(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'clugar'))//mejor asi por si es uno viejo de otro lugar
//		dw_tot.setitem(donde2,'coddoc',tab_2.t2_3.t5.t5_1.dw_cpo.getitemstring(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'coddoc'))
//		dw_tot.setitem(donde2,'nrelacion',tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'nrelacion'))
//		for k=1 to dw_tot.rowcount()
//			item=dw_tot.find('item='+string(k),1,dw_tot.rowcount())
//			if item=0 then exit
//		next
//		dw_tot.setitem(donde2,'item',k)
//	end if
//	dw_tot.setitem(donde2,'valor',round(dw_tot.getitemdecimal(donde2,'valor')+getitemdecimal(j,'tvalor'),i_dec_gral))
//	dw_tot.setitem(donde2,'cod_tipo',getitemstring(j,'cod_tipo'))
//next
//dw_tot.setredraw(true)
//setredraw(true)
//tab_2.t2_3.t5.t5_1.dw_cpo.triggerevent(rowfocuschanged!)
//if rowcount()>0 then
//	if i_orig='NC' or i_orig='SCT' or i_orig='-' or i_orig='RFC' then//manual
//		if l_legal=0 then 	
//			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,i_dec_gral))
//			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+getitemnumber(1,'t_incrementa'),i_dec_gral))//-t5.t5_1.dw_cpo.getitemdecimal(1,'tdescuentos')-t5.t5_1.dw_cpo.getitemdecimal(1,'anticipo'))
//		else
//			tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tneto_legal',round(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tbruto_legal')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta'),i_dec_gral))
//		end if
//	else
//		setredraw(true)
////		if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' then return
//		if l_legal=0 then 
//			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,i_dec_gral))
//			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto',tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')-getitemnumber(1,'t_incrementa'))//-t5.t5_1.dw_cpo.getitemdecimal(1,'tdescuentos')-t5.t5_1.dw_cpo.getitemdecimal(1,'anticipo'))
//		else
//			tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tneto_legal',round(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tbruto_legal')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta'),i_dec_gral))
//		end if
//	end if
//else
//	if i_orig='NC' or i_orig='SCT' or i_orig='-' or i_orig='RFC' then//manual
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,i_dec_gral))
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto'),i_dec_gral))//-t5.t5_1.dw_cpo.getitemdecimal(1,'tdescuentos')-t5.t5_1.dw_cpo.getitemdecimal(1,'anticipo'))
//	else
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,i_dec_gral))
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto'),i_dec_gral))
//	end if
//end if
//setredraw(true)
//tab_2.t2_3.t5.t5_1.dw_cpo.event p_itemchanged()
//
end event

event constructor;getchild('cod_concep',idwx_iva2)
idwx_iva2.settransobject(sqlca)
idwx_iva2.retrieve()

getchild('cod_total',idwx_cta2)
idwx_cta2.settransobject(sqlca)
settransobject(sqlca)
end event

event itemchanged;long donde,nnulo
string acc_ante,sobre,nulo,c_con
dec dedu,porcentaje,actual,valor,uvt,pb_uvt,pc_uvt,pp_uvt,pp_tope
dec base,base_final,base_desde,pd_uvt,ss,d_dep,dedu_depe,uvt_act
dec tope_dep
int cu
int ix_dec_gral,ix_aprox_gral

ix_dec_gral=w_recibe_fact.ii_dec_gral
ix_aprox_gral=w_recibe_fact.ii_aprox_gral
choose case dwo.name
	case 'base'
		if not isnull(getitemstring(row,'cod_concep')) then
			donde=idwx_iva2.find('cod_concep="'+getitemstring(row,'cod_concep')+'"',1,idwx_iva2.rowcount())
			base_desde=idwx_iva2.getitemnumber(donde,'base')
			porcentaje=idwx_iva2.getitemnumber(donde,'porcentaje')
			sobre=idwx_iva2.getitemstring(donde,'sobre')
			uvt_act=idwx_iva2.getitemnumber(donde,'uvt')
			pb_uvt=idwx_iva2.getitemnumber(donde,'porce_baseuvt')
			pc_uvt=idwx_iva2.getitemnumber(donde,'porce_cotiuvt')
			pp_uvt=idwx_iva2.getitemnumber(donde,'porce_parauvt')
			pd_uvt=idwx_iva2.getitemnumber(donde,'porce_depuvt')
			tope_dep=idwx_iva2.getitemnumber(donde,'tope_dep')
			if sobre<>'I' and sobre<>'P' then
				if sobre<>'U' and sobre<>'V' then
					if base_desde<=dec(data) then
						valor=round(dec(data) *  porcentaje/100,ix_dec_gral)
						if ix_dec_gral=0 then
							valor=long(valor/ix_aprox_gral)*ix_aprox_gral +ix_aprox_gral*round((valor -long(valor/ix_aprox_gral)*ix_aprox_gral)/ix_aprox_gral,0)
						end if
						setitem(row,'tvalor',round(dec(data) *  porcentaje/100,ix_dec_gral))
					else
						setitem(row,'tvalor',0)
					end if
				else
					c_con=getitemstring(row,'cod_concep')
					SELECT count(1) into :cu FROM nom_retefuente
					WHERE (((cod_concep)=:c_con));
					If cu>0 then
						 If sobre<> 'U' then
//							base=round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'anticipos')+tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'amortiza'),i_dec_gral)
						else
							pb_uvt=idwx_iva2.getitemnumber(donde,'porce_baseuvt')
							pc_uvt=idwx_iva2.getitemnumber(donde,'porce_cotiuvt')
							pp_tope=idwx_iva2.getitemnumber(donde,'base')
							pp_uvt=idwx_iva2.getitemnumber(donde,'porce_parauvt')
							pd_uvt=idwx_iva2.getitemnumber(donde,'porce_depuvt')
							uvt_act=idwx_iva2.getitemnumber(donde,'uvt')
							tope_dep=idwx_iva2.getitemnumber(donde,'tope_dep')
							base=round(dec(data),ix_dec_gral)
							dedu_depe=0
							if dw_1.getitemstring(getrow(),'depe')='1' then
								if isnull(pd_uvt) then
									Messagebox('Atención','No hay porcentaje de deuducción de dependientes en el concepto verifique')
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
						valor=f_calc_retfuente( base, base,uvt_act, getitemstring(donde,'sobre'),c_con,2/*i_dec_gral*/)
						valor=f_aproxima_a(valor,1000)
						if idwx_iva2.getitemstring(donde,'accion')='1' then//incrementa
							setitem(row,'tvalor',valor)//para que no se sume dos veces
							setitem(row,'base',base)
						else
							setitem(row,'tvalor',valor)//para que no se sume dos veces
							setitem(row,'base',base)
						end if
					else
						sobre=idwx_iva2.getitemstring(donde,'sobre')
						uvt_act=idwx_iva2.getitemnumber(donde,'uvt')
						pb_uvt=idwx_iva2.getitemnumber(donde,'porce_baseuvt')
						pc_uvt=idwx_iva2.getitemnumber(donde,'porce_cotiuvt')
						pp_uvt=idwx_iva2.getitemnumber(donde,'porce_parauvt')
						pd_uvt=idwx_iva2.getitemnumber(donde,'porce_depuvt')	
						uvt=idwx_iva2.getitemnumber(donde,'uvt')
						tope_dep=idwx_iva2.getitemnumber(donde,'tope_dep')
					end if
				end if
			else
				if base_desde>dec(data) then
					setitem(row,'tvalor',0)
				end if
			end if
			if getitemdecimal(row,'tvalor') >= getitemdecimal(row,'valor_ant') then
				setitem(row,'tvalor',getitemdecimal(row,'valor_ant'))
				setitem(row,'base',getitemdecimal(row,'base_ant'))
				Messagebox('Atención','No puede ser mayor el valor')
				accepttext()
				return 1 
			end if
			event p_itemchanged('B')
			post event p_scrollto(row,'base')		
		end if
	case 'tvalor'
		post event p_scrollto(row,'tvalor')
end choose
end event

type gb_1 from groupbox within w_mod_impuestos
integer x = 23
integer y = 4
integer width = 4411
integer height = 600
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Conceptos"
end type

type gb_2 from groupbox within w_mod_impuestos
integer x = 23
integer y = 616
integer width = 4411
integer height = 852
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Deducciones"
end type

