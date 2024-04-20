$PBExportHeader$w_teso_anticipo.srw
forward
global type w_teso_anticipo from window
end type
type pb_cancel from picturebutton within w_teso_anticipo
end type
type pb_ok from picturebutton within w_teso_anticipo
end type
type st_2 from statictext within w_teso_anticipo
end type
type st_1 from statictext within w_teso_anticipo
end type
type dw_cpo from datawindow within w_teso_anticipo
end type
type dw_antis from datawindow within w_teso_anticipo
end type
end forward

global type w_teso_anticipo from window
integer width = 3195
integer height = 1440
boolean titlebar = true
string title = "Anticpos del Tercero"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "caja_menor.ico"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
st_2 st_2
st_1 st_1
dw_cpo dw_cpo
dw_antis dw_antis
end type
global w_teso_anticipo w_teso_anticipo

type variables
datawindowchild idw_concep
st_xa_antis i_st
end variables

on w_teso_anticipo.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_2=create st_2
this.st_1=create st_1
this.dw_cpo=create dw_cpo
this.dw_antis=create dw_antis
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.st_2,&
this.st_1,&
this.dw_cpo,&
this.dw_antis}
end on

on w_teso_anticipo.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_cpo)
destroy(this.dw_antis)
end on

event open;i_st=message.powerobjectparm
i_st.dw_cpo.rowscopy(i_st.dw_cpo.getrow(),i_st.dw_cpo.getrow(),primary!,dw_cpo,1,primary!)
if i_st.dw_intfaz.dataobject='dw_deta_amortiza' then 
	dw_antis.dataobject='dw_anti_a_amortiza'
	dw_antis.settransobject(sqlca)
end if
dw_antis.retrieve(dw_cpo.getitemstring(1,'tipodoc'),dw_cpo.getitemstring(1,'documento'),dw_cpo.getitemstring(1,'cod_rel'))

end event

type pb_cancel from picturebutton within w_teso_anticipo
integer x = 2944
integer y = 776
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_teso_anticipo
integer x = 2944
integer y = 636
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
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_antis.rowcount()<1 then return
if dw_antis.getitemnumber(1,'total')= 0 then return
if dw_antis.dataobject='dw_anti_a_recep' then
	i_st.dw_cpo.setitem(i_st.dw_cpo.getrow(),'anticipos',dw_antis.getitemnumber(1,'total'))
	i_st.dw_cpo.setcolumn('anticipos')
	i_st.dw_cpo.event itemchanged(i_st.dw_cpo.getrow(),i_st.dw_cpo.object.anticipos,string(dw_antis.getitemnumber(1,'total')))
else
	i_st.dw_cpo.setitem(i_st.dw_cpo.getrow(),'amortiza',dw_antis.getitemnumber(1,'total'))
	i_st.dw_cpo.setcolumn('amortiza')
	i_st.dw_cpo.event itemchanged(i_st.dw_cpo.getrow(),i_st.dw_cpo.object.amortiza,string(dw_antis.getitemnumber(1,'total')))
end if
long j,donde,nrel
boolean encab=true
string clug, objec
for j=1 to dw_antis.rowcount()
	nrel=dw_antis.getitemnumber(j,'nrelacion')
	clug=dw_antis.getitemstring(j,'clugar')
	if dw_antis.dataobject='dw_anti_a_recep' then
		if dw_antis.getitemnumber(j,'esco')=1 then
			if encab then
				select objeto into :objec from tesorelfact where clugar=:clug and nrelacion=:nrel;
				w_recibe_fact.tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'objeto',objec)
				encab=false
			end if
			donde=i_st.dw_intfaz.insertrow(0)
			i_st.dw_intfaz.setitem(donde,'clugar',clug)
			i_st.dw_intfaz.setitem(donde,'coddoc',dw_antis.getitemstring(j,'coddoc'))
			i_st.dw_intfaz.setitem(donde,'nrelacion',nrel)
			i_st.dw_intfaz.setitem(donde,'item',dw_antis.getitemnumber(j,'item'))
			i_st.dw_intfaz.setitem(donde,'val_bruto',dw_antis.getitemnumber(j,'val_bruto'))
			i_st.dw_intfaz.setitem(donde,'tbruto',dw_antis.getitemnumber(j,'tbruto'))
			i_st.dw_intfaz.setitem(donde,'tneto',dw_antis.getitemnumber(j,'tneto'))
			i_st.dw_intfaz.setitem(donde,'v_pagado',dw_antis.getitemnumber(j,'v_pagado'))
			i_st.dw_intfaz.setitem(donde,'item_anticipo',dw_cpo.getitemnumber(1,'item'))//los otros campos toca guardarlos en la recepcion al guardar
		end if
	else
		if dw_antis.getitemnumber(j,'v_amortizar')>0 then
			if encab then
				select objeto into :objec from tesorelfact where clugar=:clug and nrelacion=:nrel;
				w_recibe_fact.tab_2.t2_3.tab_4.t4_1.dw_cab.setitem(1,'objeto',objec)
				encab=false
			end if
			donde=i_st.dw_intfaz.insertrow(0)
			i_st.dw_intfaz.setitem(donde,'clugar',dw_cpo.getitemstring(1,'clugar'))
			i_st.dw_intfaz.setitem(donde,'fecha',datetime(today(),now()))
			i_st.dw_intfaz.setitem(donde,'coddoc',w_recibe_fact.is_cdoc)
			i_st.dw_intfaz.setitem(donde,'item',dw_cpo.getitemnumber(1,'item'))
			i_st.dw_intfaz.setitem(donde,'clugar_anti',clug)
			i_st.dw_intfaz.setitem(donde,'coddoc_anti',w_recibe_fact.is_cdoc)
			i_st.dw_intfaz.setitem(donde,'nrelacion_anti',dw_antis.getitemnumber(j,'nrelacion'))
			i_st.dw_intfaz.setitem(donde,'item_anti',dw_antis.getitemnumber(j,'item'))
			i_st.dw_intfaz.setitem(donde,'v_amortizado',dw_antis.getitemnumber(j,'v_amortizar'))//los otros campos toca guardarlos en la recepcion al guardar
		end if
	end if
next
close(parent)
end event

type st_2 from statictext within w_teso_anticipo
integer x = 18
integer y = 556
integer width = 1010
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Anticipos del Tercero pendientes de registrar:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_teso_anticipo
integer x = 9
integer width = 763
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Concepto a cargar Anticipos:"
boolean focusrectangle = false
end type

type dw_cpo from datawindow within w_teso_anticipo
event p_itemchanged ( )
string tag = "cuando es de contrato o manual se utiliza para grabar el cpo(si es desde reserva se utiliza dw_res)"
integer y = 56
integer width = 3177
integer height = 452
integer taborder = 10
string title = "none"
string dataobject = "dw_tesorelfactcpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)
settransobject(sqlca)
idw_concep.retrieve(w_recibe_fact.is_emp,'0','1')
object.val_bruto.edit.displayonly='yes'
object.tdescuentos.edit.displayonly='yes'
object.cod_rel.protect='1'
object.datawindow.footer.height=0
end event

event rowfocuschanged;if getrow()<1 then return

end event

type dw_antis from datawindow within w_teso_anticipo
integer x = 9
integer y = 612
integer width = 2839
integer height = 708
integer taborder = 10
string title = "none"
string dataobject = "dw_anti_a_recep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event buttonclicked;long esco=1
if dwo.text='Escoger' then
	dwo.text='No escog'
else
	dwo.text='Escoger'
	esco=0
end if
long j
for j=1 to rowcount()
	setitem(j,'esco',esco)
next
end event

