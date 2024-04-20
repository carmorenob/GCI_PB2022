$PBExportHeader$w_lleva_resul_cons.srw
forward
global type w_lleva_resul_cons from window
end type
type cbx_1 from checkbox within w_lleva_resul_cons
end type
type pb_cancel from picturebutton within w_lleva_resul_cons
end type
type pb_acep from picturebutton within w_lleva_resul_cons
end type
type st_1 from statictext within w_lleva_resul_cons
end type
type dw_trae from datawindow within w_lleva_resul_cons
end type
end forward

global type w_lleva_resul_cons from window
integer width = 3877
integer height = 1748
boolean titlebar = true
string title = "Registrar Resultados Pendientes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "ap_dx.ico"
boolean clientedge = true
boolean center = true
cbx_1 cbx_1
pb_cancel pb_cancel
pb_acep pb_acep
st_1 st_1
dw_trae dw_trae
end type
global w_lleva_resul_cons w_lleva_resul_cons

type variables
st_xa_result i_st
end variables

on w_lleva_resul_cons.create
this.cbx_1=create cbx_1
this.pb_cancel=create pb_cancel
this.pb_acep=create pb_acep
this.st_1=create st_1
this.dw_trae=create dw_trae
this.Control[]={this.cbx_1,&
this.pb_cancel,&
this.pb_acep,&
this.st_1,&
this.dw_trae}
end on

on w_lleva_resul_cons.destroy
destroy(this.cbx_1)
destroy(this.pb_cancel)
destroy(this.pb_acep)
destroy(this.st_1)
destroy(this.dw_trae)
end on

event open;i_st=Message.PowerObjectParm
sqlca.autocommit=true
if i_st.tingres='1' then 
	dw_trae.dataobject='dw_trae_resultados2'
	dw_trae.settransobject(sqlca)
	dw_trae.retrieve(tipdoc,docu,i_st.tingres)
else
	dw_trae.dataobject='dw_trae_resultados_hosp'
	dw_trae.settransobject(sqlca)
	dw_trae.retrieve(i_st.contador,i_st.clugar)
end if
sqlca.autocommit=false

end event

type cbx_1 from checkbox within w_lleva_resul_cons
integer x = 3141
integer y = 4
integer width = 631
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 134217752
string text = "Seleccionar Todos"
end type

event clicked;int li_i
for li_i=1 to dw_trae.rowcount()
	if cbx_1.checked then
		 cbx_1.text='Deseleccionar Todos'
		dw_trae.setitem(li_i,'esco','1')
	else
		 cbx_1.text='Seleccionar Todos'
		dw_trae.setitem(li_i,'esco','0')
	end if
next
end event

type pb_cancel from picturebutton within w_lleva_resul_cons
integer x = 2030
integer y = 1500
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_acep from picturebutton within w_lleva_resul_cons
integer x = 1874
integer y = 1500
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;dw_trae.setfilter('esco="1"')
dw_trae.filter()
long j,donde
i_st.dw_results.setfilter('')
i_st.dw_results.filter()
for j=1 to dw_trae.rowcount()
	if i_st.dw_results.find('coddoc="'+dw_trae.getitemstring(j,'coddoc')+'" and clugar="'+dw_trae.getitemstring(j,'clugar')+'" and nrepor='+string(dw_trae.getitemnumber(j,'nrepor'))+' and item='+string(dw_trae.getitemnumber(j,'item'))+' and consecampo='+string(dw_trae.getitemnumber(j,'consecampo')),1,i_st.dw_results.rowcount())=0 then
		dw_trae.rowscopy(j,j,primary!,i_st.dw_results,i_st.dw_results.rowcount()+1,primary!)
		i_st.dw_results.setitem(i_st.dw_results.rowcount(),'item_hc',i_st.nitem)
	end if
next
i_st.dw_results.setfilter('item_hc='+string(i_st.nitem))
i_st.dw_results.filter()
i_st.dw_results.groupcalc()
close(parent)


end event

type st_1 from statictext within w_lleva_resul_cons
integer x = 37
integer y = 8
integer width = 2866
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 134217752
string text = "Seleccione los resultados pendientes del paciente a registrar (De click sobre la casilla llevar):"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_trae from datawindow within w_lleva_resul_cons
string tag = "dw_trae_resul_a_hc"
integer x = 32
integer y = 88
integer width = 3781
integer height = 1392
integer taborder = 10
boolean bringtotop = true
string title = "dw_trae_resultados2"
string dataobject = "dw_trae_resultados2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 and GetRow() <> row then
	SetRow(row)
end if

end event

event itemchanged;if dwo.name='esco' then
	long j,nrep,item
	string cdoc
	cdoc=getitemstring(row,'coddoc')
	nrep=getitemnumber(row,'nrepor')
	item=getitemnumber(row,'item')
	for j=row +1 to rowcount()
		if cdoc<>getitemstring(j,'coddoc') or nrep<>getitemnumber(j,'nrepor') or item<>getitemnumber(j,'item') then exit
		setitem(j,'esco',data)
	next
end if
end event

event buttonclicked;if not isvalid(w_deta_kit) then
	if dwo.name='b_1' then
		open(w_val_norm)
		w_val_norm.dw_1.retrieve(getitemstring(row,'codproced'),getitemnumber(row,'consecampo'))
		w_val_norm.setfocus()
	else
		open(w_graf_apoyodx)
		w_graf_apoyodx.dw_1.retrieve(tipdoc,docu,getitemstring(row,'codproced'))
		w_graf_apoyodx.setfocus()
	end if
end if
end event

