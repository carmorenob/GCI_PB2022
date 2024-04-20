$PBExportHeader$w_revisa_glos.srw
forward
global type w_revisa_glos from window
end type
type pb_1 from picturebutton within w_revisa_glos
end type
type pb_2 from picturebutton within w_revisa_glos
end type
type dw_1 from datawindow within w_revisa_glos
end type
end forward

global type w_revisa_glos from window
integer width = 4142
integer height = 1444
boolean titlebar = true
string title = "Glosas anteriores"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_1 pb_1
pb_2 pb_2
dw_1 dw_1
end type
global w_revisa_glos w_revisa_glos

type variables
st_dws_revisa st_p

end variables

event open;st_p = Message.PowerObjectParm
dw_1.Retrieve(st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'coddoc_orig'), st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'clugar_orig'), st_p.dw_fac.GetItemNumber(st_p.dw_fac.GetRow(),'num_glosa_orig'),st_p.dw_fac.GetItemNumber(st_p.dw_fac.GetRow(),'nfact'))
dw_1.Expand(dw_1.GetRow(),1)

end event

on w_revisa_glos.create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.pb_2,&
this.dw_1}
end on

on w_revisa_glos.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_1)
end on

type pb_1 from picturebutton within w_revisa_glos
integer x = 2281
integer y = 1188
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
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Llevar Registros"
end type

event clicked;long j,f,i,fp,fs
double nf, it, nd, valor
string cl
if dw_1.RowCount() = 0 then Return
st_p.dw_proc.SetRedraw(FALSE)
st_p.dw_item.SetRedraw(FALSE)

st_p.dw_proc.setfilter("nfact_cpo="+string(st_p.dw_fac.GetItemNumber(st_p.dw_fac.GetRow(),'nfact'))+" and clug_fac='"+st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'clugar_fact')+"'")
st_p.dw_proc.Filter()
st_p.dw_proc.Event rowFocusChanged(st_p.dw_proc.GetRow())
//st_p.dw_proc.SetFilter('')
//st_p.dw_item.SetFilter('')
//st_p.dw_proc.Filter()
//st_p.dw_item.Filter()

j = dw_1.Find("selec=1",1,dw_1.RowCount())
do while j > 0
	if dw_1.GetItemString(j,'nivel') = 'Factura' then
		f = w_maneja_glosas.tab_1.tp_1.pb_of.Event clicked()
		valor = dw_1.GetItemNumber(j,'valor_aceptado')
		if isNull(valor) then valor = 0
		st_p.dw_fg.SetItem(f,'cod_objecion',dw_1.GetItemString(j,'cod_objecion'))
		st_p.dw_fg.SetItem(f,'usu_responde',dw_1.GetItemString(j,'usu_responde'))
		st_p.dw_fg.SetItem(f,'nombre',dw_1.GetItemString(j,'usu_responde'))
		st_p.dw_fg.SetItem(f,'valor_objecion',dw_1.GetItemNumber(j,'valor_objecion') - valor)		
		st_p.dw_fg.SetItem(f,'porcen',(dw_1.GetItemNumber(j,'valor_objecion') - valor)/st_p.dw_fac.GetItemNumber(st_p.dw_fac.GetRow(),'vtemp') )
		w_maneja_glosas.tab_1.tp_1.dw_fac_glos.event p_itemchanged(f)
	end if
	if dw_1.GetItemString(j,'nivel') = 'Procedimiento' then
		fp = st_p.dw_proc.Find("nitem_fac="+string(dw_1.GetItemNumber(j,'nitem_fact')),1,st_p.dw_proc.RowCount())
		if fp > 0 then 
			st_p.dw_proc.ScrolltoRow(fp)
			f = w_maneja_glosas.tab_1.tp_2.pb_op.Event clicked()
			valor = dw_1.GetItemNumber(j,'valor_aceptado')
			if isNull(valor) then valor = 0
			st_p.dw_pg.SetItem(f,'cod_objecion',dw_1.GetItemString(j,'cod_objecion'))
			st_p.dw_pg.SetItem(f,'usu_responde',dw_1.GetItemString(j,'usu_responde'))
			st_p.dw_pg.SetItem(f,'nombre',dw_1.GetItemString(j,'usu_responde'))
			st_p.dw_pg.SetItem(f,'valor_objecion',dw_1.GetItemNumber(j,'valor_objecion') - valor)		
			st_p.dw_pg.SetItem(f,'porcen',(dw_1.GetItemNumber(j,'valor_objecion') - valor)/st_p.dw_proc.GetItemNumber(fp,'vemp') )
			w_maneja_glosas.tab_1.tp_2.dw_proc_glos.event p_itemchanged(f)
		end if
	end if
	if dw_1.GetItemString(j,'nivel') = 'Subitem' then
		fp = st_p.dw_proc.Find("nitem_fac="+string(dw_1.GetItemNumber(j,'nitem_fact')),1,st_p.dw_proc.RowCount())
		if fp > 0 then st_p.dw_proc.ScrolltoRow(fp)
		fs = st_p.dw_item.Find("nitem="+string(dw_1.GetItemNumber(j,'nitem_fact'))+" and ndeta_sfac="+string(dw_1.GetItemNumber(j,'ndeta_fact')),1,st_p.dw_item.RowCount())
		if fp > 0 and fs > 0 then 
			st_p.dw_item.ScrolltoRow(fs)
			f = w_maneja_glosas.tab_1.tp_3.pb_oi.Event clicked()
			valor = dw_1.GetItemNumber(j,'valor_aceptado')
			if isNull(valor) then valor = 0
			st_p.dw_sg.SetItem(f,'cod_objecion',dw_1.GetItemString(j,'cod_objecion'))
			st_p.dw_sg.SetItem(f,'usu_responde',dw_1.GetItemString(j,'usu_responde'))
			st_p.dw_sg.SetItem(f,'nombre',dw_1.GetItemString(j,'usu_responde'))
			st_p.dw_sg.SetItem(f,'valor_objecion',dw_1.GetItemNumber(j,'valor_objecion') - valor)		
			st_p.dw_sg.SetItem(f,'porcen',(dw_1.GetItemNumber(j,'valor_objecion') - valor)/st_p.dw_item.GetItemNumber(fs,'vemp') )
			w_maneja_glosas.tab_1.tp_3.dw_item_glos.event p_itemchanged(f)
		end if
	end if
	dw_1.SetItem(j,'selec',0)
	j = dw_1.Find("selec=1",1,dw_1.RowCount())
loop

st_p.dw_proc.SetRedraw(TRUE)
st_p.dw_item.SetRedraw(TRUE)

st_p.dw_fac.Event rowfocuschanged(st_p.dw_fac.GetRow())
w_maneja_glosas.tab_1.tp_2.rb_o.event clicked()
w_maneja_glosas.tab_1.tp_2.rb_o.checked = TRUE
close(parent)

end event

type pb_2 from picturebutton within w_revisa_glos
integer x = 2441
integer y = 1188
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "Llevar Valores"
end type

event clicked;close(parent)

end event

type dw_1 from datawindow within w_revisa_glos
integer x = 59
integer y = 112
integer width = 3986
integer height = 1048
integer taborder = 10
string title = "none"
string dataobject = "dw_objs_X_fact"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

