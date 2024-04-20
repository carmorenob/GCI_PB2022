$PBExportHeader$w_dsctos_pago.srw
forward
global type w_dsctos_pago from window
end type
type pb_ok from picturebutton within w_dsctos_pago
end type
type pb_can from picturebutton within w_dsctos_pago
end type
type tab_2 from tab within w_dsctos_pago
end type
type t2 from userobject within tab_2
end type
type pb_del_tax from picturebutton within t2
end type
type pb_new_tax from picturebutton within t2
end type
type dw_2 from datawindow within t2
end type
type t2 from userobject within tab_2
pb_del_tax pb_del_tax
pb_new_tax pb_new_tax
dw_2 dw_2
end type
type tab_2 from tab within w_dsctos_pago
t2 t2
end type
type tab_1 from tab within w_dsctos_pago
end type
type t1 from userobject within tab_1
end type
type dw_cab from datawindow within t1
end type
type t1 from userobject within tab_1
dw_cab dw_cab
end type
type tab_1 from tab within w_dsctos_pago
t1 t1
end type
end forward

global type w_dsctos_pago from window
integer width = 5019
integer height = 1576
boolean titlebar = true
string title = "Descuentos Orden de Pago"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_ok pb_ok
pb_can pb_can
tab_2 tab_2
tab_1 tab_1
end type
global w_dsctos_pago w_dsctos_pago

type variables
string  i_orig
int i_dec_gral,i_aprox_gral
boolean i_cambio
datawindowchild idw_iva2,idw_cta2
st_ord_pago st_ord
long rfcn,rfci
string rfcl,rfcd
end variables

on w_dsctos_pago.create
this.pb_ok=create pb_ok
this.pb_can=create pb_can
this.tab_2=create tab_2
this.tab_1=create tab_1
this.Control[]={this.pb_ok,&
this.pb_can,&
this.tab_2,&
this.tab_1}
end on

on w_dsctos_pago.destroy
destroy(this.pb_ok)
destroy(this.pb_can)
destroy(this.tab_2)
destroy(this.tab_1)
end on

event open;st_ord=message.powerobjectparm

tab_1.t1.dw_cab.retrieve(st_ord.cod_rfc,st_ord.clu_rfc,st_ord.num_rfc)
if tab_1.t1.dw_cab.rowcount()=0  then return

int j,lj

st_ord.dw_conta.setfilter('')
st_ord.dw_conta.filter()
st_ord.dw_conta.rowscopy(1,st_ord.dw_conta.rowcount(),primary!,tab_2.t2.dw_2,1,primary!)


for lj=1 to tab_1.t1.dw_cab.rowcount()
	rfcd= tab_1.t1.dw_cab.getitemstring(lj,'coddoc')
	rfcl= tab_1.t1.dw_cab.getitemstring(lj,'clugar')
	rfcn= tab_1.t1.dw_cab.getitemnumber(lj,'nrelacion')
	rfci= tab_1.t1.dw_cab.getitemnumber(lj,'item')
	j=st_ord.dw_cpo.Find("clugar_rel='"+rfcl+"' and coddoc_rel='"+rfcd+"' and nrelacion="+string(rfcn)+" and item_rel="+string(rfci), 1, st_ord.dw_cpo.rowcount())
	if j>0 then
		tab_1.t1.dw_cab.setitem(lj,'litem',st_ord.dw_cpo.getitemnumber(j,'item'))
		tab_1.t1.dw_cab.setitem(lj,'apagar',st_ord.dw_cpo.getitemnumber(j,'neto'))
	end if
next
tab_2.t2.dw_2.setfilter("item="+string(tab_1.t1.dw_cab.getitemnumber(1,'litem')))
tab_2.t2.dw_2.filter()
i_dec_gral=st_ord.dgral
i_aprox_gral=st_ord.agral

end event

type pb_ok from picturebutton within w_dsctos_pago
integer x = 2336
integer y = 1344
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
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;if tab_2.t2.dw_2.rowcount()<1 then return
if tab_2.t2.dw_2.getitemnumber(1,'total')= 0 then return
if messagebox('Atención','Para esta Orden de Pago agregara descuentos, Esta seguro?',question!,yesno!,2)=2 then return
int fila, li
for li=1 to tab_1.t1.dw_cab.rowcount()
	tab_1.t1.dw_cab.setitem(li,'tdescuentos_op',tab_2.t2.dw_2.getitemnumber(1,'total'))
next

for li= st_ord.dw_conta.rowcount() to 1 step -1
	st_ord.dw_conta.DeleteRow(li)
next
tab_2.t2.dw_2.setfilter('')
tab_2.t2.dw_2.filter()
tab_2.t2.dw_2.rowscopy(1,tab_2.t2.dw_2.RowCount(),primary!,st_ord.dw_conta,1,primary!)
closewithreturn(parent,'ok')
end event

type pb_can from picturebutton within w_dsctos_pago
integer x = 2505
integer y = 1344
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
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;closewithreturn(parent,'-1')
end event

type tab_2 from tab within w_dsctos_pago
integer x = 23
integer y = 732
integer width = 4937
integer height = 604
integer taborder = 30
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
t2 t2
end type

on tab_2.create
this.t2=create t2
this.Control[]={this.t2}
end on

on tab_2.destroy
destroy(this.t2)
end on

type t2 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 4901
integer height = 476
long backcolor = 67108864
string text = "Descuentos"
long tabtextcolor = 33554432
string picturename = "ajuste1.ico"
long picturemaskcolor = 536870912
string powertiptext = "Descuentos del Concepto"
pb_del_tax pb_del_tax
pb_new_tax pb_new_tax
dw_2 dw_2
end type

on t2.create
this.pb_del_tax=create pb_del_tax
this.pb_new_tax=create pb_new_tax
this.dw_2=create dw_2
this.Control[]={this.pb_del_tax,&
this.pb_new_tax,&
this.dw_2}
end on

on t2.destroy
destroy(this.pb_del_tax)
destroy(this.pb_new_tax)
destroy(this.dw_2)
end on

type pb_del_tax from picturebutton within t2
integer x = 4745
integer y = 180
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_2.rowcount()=0 then return
dw_2.deleterow(0)
dw_2.triggerevent(rowfocuschanged!)
//dw_2.event p_itemchanged()
end event

type pb_new_tax from picturebutton within t2
integer x = 4745
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
end type

event clicked;if tab_1.t1.dw_cab.rowcount()=0 then return -1
long donde,j,li

li=tab_1.t1.dw_cab.getrow()
rfcd= tab_1.t1.dw_cab.getitemstring(li,'coddoc')
rfcl= tab_1.t1.dw_cab.getitemstring(li,'clugar')
rfcn= tab_1.t1.dw_cab.getitemnumber(li,'nrelacion')
rfci= tab_1.t1.dw_cab.getitemnumber(li,'item')
j=st_ord.dw_cpo.Find("clugar_rel='"+rfcl+"' and coddoc_rel='"+rfcd+"' and nrelacion="+string(rfcn)+" and item_rel="+string(rfci), 1, st_ord.dw_cpo.rowcount())
if j>0 then
	donde=dw_2.insertrow(0)
	dw_2.setitem(donde,'coddoc',st_ord.coddoc)
	dw_2.setitem(donde,'clugar',clugar)
	dw_2.setitem(donde,'item', tab_1.t1.dw_cab.getitemnumber(li,'litem'))
	j=dw_2.getitemnumber(1,'maximos')
	if isnull(j) then j=0
	j++
	dw_2.setitem(donde,'subitem',j)
	dw_2.setitem(donde,'tipodoc',tab_1.t1.dw_cab.getitemstring(tab_1.t1.dw_cab.getrow(),'tipodoc'))
	dw_2.setitem(donde,'documento',tab_1.t1.dw_cab.getitemstring(tab_1.t1.dw_cab.getrow(),'documento'))	
	dw_2.scrolltorow(donde)
	dw_2.setcolumn('cod_concep')
	dw_2.setfocus()
end if
//i_cambio=true

end event

type dw_2 from datawindow within t2
event p_scrollto ( integer p_fila,  string p_column )
event p_itemchanged ( string p_cual )
integer x = 27
integer y = 28
integer width = 4695
integer height = 440
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tesotranscpo_rte"
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
datawindow dw_1

tab_1.t1.dw_cab.accepttext()
setredraw(false)
dw_1=tab_1.t1.dw_cab
for j=1 to rowcount()
	if getitemstring(j,'accion')='1' then //incrementa
			if p_cual='B' then //base
			iva+=getitemnumber(j,'valor')
		else
			donde=idw_iva2.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_iva2.rowcount())
			porcentaje+=idw_iva2.getitemnumber(donde,'porcentaje')
		end if
	end if
next
if p_cual='C' then
	v_siniva=round(dw_1.getitemNumber(dw_1.getrow(),'tbruto')/(1+porcentaje/100),i_dec_gral)
	if i_dec_gral=0 then
		v_siniva=long(v_siniva/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((v_siniva -long(v_siniva/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	//if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' then return
	dw_1.setitem(dw_1.getrow(),'val_bruto',v_siniva)
else
	v_siniva=round(dw_1.getitemNumber(dw_1.getrow(),'tbruto')-iva,i_dec_gral)
	if i_dec_gral=0 then
		v_siniva=long(v_siniva/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((v_siniva -long(v_siniva/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	//if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' then return
	dw_1.setitem(dw_1.getrow(),'val_bruto',v_siniva)
end if
for j=1 to rowcount()
	if p_cual='B' and j=getrow() then continue
	donde=idw_iva2.find('cod_concep="'+getitemstring(j,'cod_concep')+'"',1,idw_iva2.rowcount())
	base_desde=idw_iva2.getitemnumber(donde,'base')
	porcentaje=idw_iva2.getitemnumber(donde,'porcentaje')
	if getitemstring(j,'sobre')<>'I' and getitemstring(j,'sobre')<>'P' and getitemstring(j,'sobre')<>'U' then
		if base_desde<=getitemdecimal(j,'base') then
			setitem(j,'valor',round(getitemdecimal(j,'base') *  porcentaje/100,i_dec_gral))
		else
			setitem(j,'tvalor',0)
		end if
	end if
	if getitemstring(j,'sobre')='O' then
		setitem(1,'asumar',idw_iva2.getitemstring(donde,'cod_sobre'))
		setitem(j,'base',getitemnumber(1,'suma'))
		if base_desde<=getitemnumber(1,'suma') then
			setitem(j,'valor',round(getitemnumber(1,'suma') *  porcentaje/100,i_dec_gral))
		else
			setitem(j,'valor',0)
		end if
	end if
next
//setfilter('')
//filter()
dw_2.triggerevent(rowfocuschanged!)
if rowcount()>0 then
	if i_orig='NC' or i_orig='SCT' or i_orig='-' or i_orig='RFC' then//manual
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,i_dec_gral))
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')+getitemnumber(1,'t_incrementa'),i_dec_gral))//-t5.t5_1.dw_cpo.getitemdecimal(1,'tdescuentos')-t5.t5_1.dw_cpo.getitemdecimal(1,'anticipo'))
	else
		setredraw(true)
////		if tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'definitivo')='1' and tab_2.t2_3.tab_4.t4_1.dw_cab.getitemstring(1,'tiporelacion')='2' then return
//		if l_legal=0 then 
//			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,i_dec_gral))
//			tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto',tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')-getitemnumber(1,'t_incrementa'))//-t5.t5_1.dw_cpo.getitemdecimal(1,'tdescuentos')-t5.t5_1.dw_cpo.getitemdecimal(1,'anticipo'))
//		else
//			tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.setitem(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tneto_legal',round(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getitemnumber(tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo.getrow(),'tbruto_legal')+getitemnumber(1,'t_incrementa')-getitemnumber(1,'t_retiene')-getitemnumber(1,'t_descuenta'),i_dec_gral))
//		end if
end if
else
//	if i_orig='NC' or i_orig='SCT' or i_orig='-' or i_orig='RFC' then//manual
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,i_dec_gral))
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto'),i_dec_gral))//-t5.t5_1.dw_cpo.getitemdecimal(1,'tdescuentos')-t5.t5_1.dw_cpo.getitemdecimal(1,'anticipo'))
//	else
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tbruto')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tdescuentos')-tab_2.t2_3.t5.t5_1.dw_cpo.getitemdecimal(1,'t_anticipos')/*-t5.t5_1.dw_cpo.getitemdecimal(1,'t_amortiza')*/,i_dec_gral))
//		tab_2.t2_3.t5.t5_1.dw_cpo.setitem(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'val_bruto',round(tab_2.t2_3.t5.t5_1.dw_cpo.getitemnumber(tab_2.t2_3.t5.t5_1.dw_cpo.getrow(),'tneto'),i_dec_gral))
//	end if
end if
setredraw(true)
//tab_2.t2_3.t5.t5_1.dw_cpo.event p_itemchanged()
end event

event constructor;getchild('cod_concep',idw_iva2)
idw_iva2.settransobject(sqlca)
idw_iva2.retrieve()

getchild('cod_total',idw_cta2)
idw_cta2.settransobject(sqlca)
settransobject(sqlca)
end event

event itemchanged;long donde,nnulo
string acc_ante,sobre,nulo,c_con
dec dedu,porcentaje,actual,valor,uvt,pb_uvt,pc_uvt,pp_uvt,pp_tope
dec base,base_final,base_desde,pd_uvt,ss,d_dep,dedu_depe,uvt_act
dec tope_dep
int cu

dw_2.accepttext()
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
						valor=round(dec(data) *  porcentaje/100,i_dec_gral)
						if i_dec_gral=0 then
							valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
						end if
						setitem(row,'valor',round(dec(data) *  porcentaje/100,i_dec_gral))
					else
						setitem(row,'valor',0)
					end if
				else
					c_con=getitemstring(row,'cod_concep')
					SELECT count(1) into :cu FROM nom_retefuente
					WHERE (((cod_concep)=:c_con));
					If cu>0 then
						 If sobre<> 'U' then
							base=round(tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'val_bruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza'),i_dec_gral)
						else
							pb_uvt=idw_iva2.getitemnumber(donde,'porce_baseuvt')
							pc_uvt=idw_iva2.getitemnumber(donde,'porce_cotiuvt')
							pp_tope=idw_iva2.getitemnumber(donde,'base')
							pp_uvt=idw_iva2.getitemnumber(donde,'porce_parauvt')
							pd_uvt=idw_iva2.getitemnumber(donde,'porce_depuvt')
							uvt_act=idw_iva2.getitemnumber(donde,'uvt')
							tope_dep=idw_iva2.getitemnumber(donde,'tope_dep')
							base=round(dec(data),i_dec_gral)
							dedu_depe=0
							if dw_2.getitemstring(getrow(),'depe')='1' then
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
						valor=f_calc_retfuente( base, base,uvt_act, getitemstring(donde,'sobre'),c_con,2/*i_dec_gral*/)
						valor=f_aproxima_a(valor,1000)
						if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
							setitem(row,'valor',valor)//para que no se sume dos veces
							setitem(row,'base',base)
						else
							setitem(row,'valor',valor)//para que no se sume dos veces
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
						if i_orig='-' or i_orig='RFC' then//manuales
							setitem(row,'base',round(tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'val_bruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza'),i_dec_gral))					
						else
							if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
								setitem(row,'tvalor',0)//para que no se sume dos veces
								base=round((tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'tbruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza')-getitemnumber(1,'t_incrementa'))/(1+idw_iva2.getitemdecimal(donde,'porcentaje')/100),i_dec_gral)
								base=round(((base * pb_uvt)- ((base * pc_uvt) * pp_uvt)),i_dec_gral)
								setitem(row,'base',base)
							else
								base=round(tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'val_bruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza'),i_dec_gral)
								base=round(((base*pb_uvt)- ((base*pc_uvt)*pp_uvt)),i_dec_gral)
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
		
	case 'cod_concep', 'cod_concep_1'
		setitem(row,'cod_total',nulo)
		setitem(row,'cod_empre',nulo)
		if idw_cta2.retrieve(st_ord.emp,data)=1 then
			setitem(row,'cod_total',idw_cta2.getitemstring(1,'codtotal'))
			setitem(row,'cod_empre',st_ord.emp)
			setitem(row,'tercero',idw_cta2.getitemstring(1,'tercero'))
		else
			messagebox('Atención','Descuento sin cuenta contable configurelo')
			deleterow(row)
			return 1
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
				setitem(row,'base',tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'tbruto'))
			case 'I' //ninguno
				setitem(row,'base',tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'val_bruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos'))
				setitem(row,'valor',idw_iva2.getitemdecimal(donde,'porcentaje'))
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
						cu=0
				    		base=round(tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'val_bruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza'),i_dec_gral)
					else
						pb_uvt=idw_iva2.getitemnumber(donde,'porce_baseuvt')
						pc_uvt=idw_iva2.getitemnumber(donde,'porce_cotiuvt')
						pp_tope=idw_iva2.getitemnumber(donde,'base')
						pp_uvt=idw_iva2.getitemnumber(donde,'porce_parauvt')
						pd_uvt=idw_iva2.getitemnumber(donde,'porce_depuvt')	
						uvt_act=idw_iva2.getitemnumber(donde,'uvt')
						tope_dep=idw_iva2.getitemnumber(donde,'tope_dep')
						base=round(tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'val_bruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza'),i_dec_gral)
						dedu=round((base * pb_uvt/100),0)
						dedu_depe=0
						if dw_2.getitemstring(dw_2.getrow(),'depe')='1' then
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
					valor=f_calc_retfuente( base, base,uvt_act, getitemstring(donde,'sobre'),c_con,2/*i_dec_gral*/)
					valor=f_aproxima_a(valor,1000)
					if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
						setitem(row,'valor',valor)//para que no se sume dos veces
						setitem(row,'base',base)
					else
						setitem(row,'valor',valor)//para que no se sume dos veces
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
					if i_orig='-' or i_orig='RFC' then//manuales
						setitem(row,'base',round(tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'val_bruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza'),i_dec_gral))					
					else
						if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
							setitem(row,'tvalor',0)//para que no se sume dos veces
							base=round((tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'tbruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza')-getitemnumber(1,'t_incrementa'))/(1+idw_iva2.getitemdecimal(donde,'porcentaje')/100),i_dec_gral)
							base=round(((base * pb_uvt)- ((base * pc_uvt) * pp_uvt)),i_dec_gral)
							setitem(row,'base',base)
						else
							base=round(tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'val_bruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza'),i_dec_gral)
							base=round(((base*pb_uvt)- ((base*pc_uvt)*pp_uvt)),i_dec_gral)
							setitem(row,'base',base)
						end if
					end if
				end if
			case 'B' //base
					if idw_iva2.getitemstring(donde,'accion')='1' then//incrementa
						setitem(row,'tvalor',0)//para que no se sume dos veces
						setitem(row,'base',round((tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'tbruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza')-getitemnumber(1,'t_incrementa'))/(1+idw_iva2.getitemdecimal(donde,'porcentaje')/100),i_dec_gral))
					else
						setitem(row,'base',round(tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'val_bruto')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'anticipos')+tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'amortiza'),i_dec_gral))
					end if
			case 'N' //neto
				setitem(row,'base',tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'tneto'))
			case 'P' //pago directo
				st_ord_pago st
				st.dw_cpo=tab_1.t1.dw_cab
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
		setitem(row,'cod_empre',st_ord.emp)
		setitem(row,'tercero',idw_cta2.getitemstring(idw_cta2.getrow(),'tercero'))
	case 'valor'
		if dw_2.getitemnumber(1,'total') > tab_1.t1.dw_cab.getitemnumber(tab_1.t1.dw_cab.getrow(),'apagar') then
		//	messagebox("Atención","El valor no puede superar el monto Neto")
			setitem(row,'valor',0)
			settext(getitemstring(getrow(),getcolumn()))
			return 1
		end if
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
i_cambio=true
end event

event rowfocuschanged;if getrow()<1 then return
if not isnull(getitemstring(getrow(),'cod_empre')) then
	idw_cta2.retrieve(getitemstring(getrow(),'cod_empre'),getitemstring(getrow(),'cod_concep'))
else
	idw_cta2.retrieve(st_ord.emp,getitemstring(getrow(),'cod_concep'))
end if
end event

type tab_1 from tab within w_dsctos_pago
integer x = 23
integer y = 12
integer width = 4955
integer height = 700
integer taborder = 10
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
t1 t1
end type

on tab_1.create
this.t1=create t1
this.Control[]={this.t1}
end on

on tab_1.destroy
destroy(this.t1)
end on

type t1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4919
integer height = 572
long backcolor = 67108864
string text = "Conceptos"
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
string powertiptext = "Conceptos del Pago"
dw_cab dw_cab
end type

on t1.create
this.dw_cab=create dw_cab
this.Control[]={this.dw_cab}
end on

on t1.destroy
destroy(this.dw_cab)
end on

type dw_cab from datawindow within t1
integer x = 41
integer y = 36
integer width = 4855
integer height = 516
integer taborder = 20
string title = "none"
string dataobject = "dw_pagos_rfc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;if getrow()<1 then
	tab_2.t2.dw_2.setfilter("isnull(item)")
else
	tab_2.t2.dw_2.setfilter("item="+string(getitemnumber(getrow(),'litem')))
end if
tab_2.t2.dw_2.filter()


end event

