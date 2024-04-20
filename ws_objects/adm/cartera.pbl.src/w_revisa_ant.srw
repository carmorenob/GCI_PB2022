$PBExportHeader$w_revisa_ant.srw
forward
global type w_revisa_ant from window
end type
type pb_2 from picturebutton within w_revisa_ant
end type
type pb_1 from picturebutton within w_revisa_ant
end type
type dw_facts from datawindow within w_revisa_ant
end type
type t1 from tab within w_revisa_ant
end type
type p2 from userobject within t1
end type
type dw_procs from datawindow within p2
end type
type p2 from userobject within t1
dw_procs dw_procs
end type
type p3 from userobject within t1
end type
type dw_sitem from datawindow within p3
end type
type p3 from userobject within t1
dw_sitem dw_sitem
end type
type t1 from tab within w_revisa_ant
p2 p2
p3 p3
end type
end forward

global type w_revisa_ant from window
integer width = 3058
integer height = 1492
boolean titlebar = true
string title = "Revisa Objeción Inicial"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_facts dw_facts
t1 t1
end type
global w_revisa_ant w_revisa_ant

type variables
st_dws_revisa st_p
datawindowchild dwc_1, dwc_2, dwc_3

end variables

on w_revisa_ant.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_facts=create dw_facts
this.t1=create t1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_facts,&
this.t1}
end on

on w_revisa_ant.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_facts)
destroy(this.t1)
end on

event open;st_p = Message.PowerObjectParm
t1.p3.dw_sitem.GetChild('cod_objecion',dwc_3)
dwc_3.SetTransObject(SQLCA)
dwc_3.Retrieve('%')
t1.p2.dw_procs.GetChild('cod_objecion',dwc_2)
dwc_2.SetTransObject(SQLCA)
dwc_2.Retrieve('%')
dw_facts.GetChild('cod_objecion',dwc_1)
dwc_1.SetTransObject(SQLCA)
dwc_1.Retrieve('%')

dw_facts.SetFilter("item="+string(st_p.dw_fac.GetItemNumber(st_p.dw_fac.GetRow(),'item_orig')))
t1.p2.dw_procs.SetFilter("valor_objecion>0")
t1.p3.dw_sitem.SetFilter("valor_objecion>0")
dw_facts.Modify("esco.protect=0 esco.checkbox.other='2'")
t1.p2.dw_procs.Modify("selecc.Visible =1 selecc.protect=0 selecc.width=73 selecc.checkbox.other='2'")
string ret 
ret = t1.p3.dw_sitem.Modify("selecc.Tabsequence=1")
t1.p3.dw_sitem.retrieve(st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'coddoc_orig'), st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'clugar_orig'), st_p.dw_fac.GetItemNumber(st_p.dw_fac.GetRow(),'num_glosa_orig'))
t1.p2.dw_procs.retrieve(st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'coddoc_orig'), st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'clugar_orig'), st_p.dw_fac.GetItemNumber(st_p.dw_fac.GetRow(),'num_glosa_orig'))
dw_facts.Retrieve(st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'coddoc_orig'), st_p.dw_fac.GetItemString(st_p.dw_fac.GetRow(),'clugar_orig'), st_p.dw_fac.GetItemNumber(st_p.dw_fac.GetRow(),'num_glosa_orig'))

end event

type pb_2 from picturebutton within w_revisa_ant
integer x = 1440
integer y = 1248
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "Llevar Valores"
end type

event clicked;close(parent)

end event

type pb_1 from picturebutton within w_revisa_ant
integer x = 1275
integer y = 1248
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
string powertiptext = "Llevar Valores"
end type

event clicked;long j,f,i
double nf, it, nd
string cl
if dw_facts.RowCount() = 0 then Return
if dw_facts.GetItemNumber(dw_facts.GetRow(),'esco') = 1 then
//	if dw_facts.GetItemString(dw_facts.GetRow(),'tipo') = '1' then
		for j=1 to st_p.dw_proc.rowcount()
			st_p.dw_proc.setitem(j,'padre_tipo','1')
		next
		st_p.dw_fac.setItem(st_p.dw_fac.Getrow(),'tipo','1')
		st_p.dw_fac.setItem(st_p.dw_fac.Getrow(),'cod_objecion',dw_facts.GetItemString(dw_facts.GetRow(),'cod_objecion'))
		st_p.dw_fac.setItem(st_p.dw_fac.Getrow(),'valor_objecion',dw_facts.getItemNumber(dw_facts.GetRow(),'valor_objecion'))
		st_p.dw_fac.post event itemchanged(st_p.dw_fac.GetRow(),st_p.dw_fac.object.valor_objecion, string(dw_facts.getItemNumber(dw_facts.GetRow(),'valor_objecion')))
//	end if
else
	for j=1 to t1.p2.dw_procs.rowcount()
		st_p.dw_proc.ScrolltoRow(f)
		if t1.p2.dw_procs.GetItemString(t1.p2.dw_procs.GetRow(),'tipo') = '1' and t1.p2.dw_procs.GetItemNumber(t1.p2.dw_procs.GetRow(),'selecc') = 1 then
			nf = t1.p2.dw_procs.GetItemNumber(j,'nfact')
			cl = t1.p2.dw_procs.GetItemString(j,'clugar_fact')
			it = t1.p2.dw_procs.GetItemNumber(j,'nitem_fact')
			f = st_p.dw_proc.Find("nfact="+string(nf) +" and clugar_fact='"+cl+"' and nitem_fact="+string(it),1,st_p.dw_proc.RowCount())
			if f > 0 then
				st_p.dw_proc.setItem(f,'cod_objecion',t1.p2.dw_procs.GetItemString(j,'cod_objecion'))
				st_p.dw_proc.setItem(f,'valor_objecion',t1.p2.dw_procs.GetItemNumber(j,'valor_objecion'))
				st_p.dw_proc.setItem(f,'tipo','1')
				st_p.dw_proc.setItem(f,'padre_tipo',dw_facts.getItemString(dw_facts.GetRow(),'tipo'))
				st_p.dw_proc.post event itemchanged(f,st_p.dw_proc.object.valor_objecion, string(t1.p2.dw_procs.GetItemNumber(j,'valor_objecion')))
			end if
		else
			for i = 1 to t1.p3.dw_sitem.RowCount()
				if t1.p3.dw_sitem.GetItemNumber(i,'selecc') = 0 then Continue
				nf = t1.p3.dw_sitem.GetItemNumber(i,'nfact')
				cl = t1.p3.dw_sitem.GetItemString(i,'clugar_fact')
				it = t1.p3.dw_sitem.GetItemNumber(i,'nitem_fact')
				nd = t1.p3.dw_sitem.GetItemNumber(i,'ndeta_fact')
				f = st_p.dw_item.Find("nfact="+string(nf) +" and clugar_fact='"+cl+"' and nitem_fact="+string(it) + " and ndeta_fact="+string(nd),1,st_p.dw_item.RowCount())
				if f > 0 then
					st_p.dw_item.setItem(f,'cod_objecion',t1.p3.dw_sitem.GetItemString(i,'cod_objecion'))
					st_p.dw_item.setItem(f,'valor_objecion',t1.p3.dw_sitem.GetItemNumber(i,'valor_objecion'))
					st_p.dw_item.setItem(f,'padre_tipo',t1.p2.dw_procs.getItemString(j,'tipo'))
					st_p.dw_item.post event itemchanged(f,st_p.dw_item.object.valor_objecion, string(t1.p3.dw_sitem.GetItemNumber(i,'valor_objecion')))
				end if
			next
		end if
	next	
end if
close(parent)

end event

type dw_facts from datawindow within w_revisa_ant
event p_itemchanged ( )
event p_replica_obje ( long p_row )
integer x = 41
integer y = 16
integer width = 2944
integer height = 276
integer taborder = 30
string title = "none"
string dataobject = "dw_glos_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
//getchild('cod_objecion',idw_obj)
//idw_obj.settransobject(sqlca)
//idw_obj.retrieve('%')
//idw_obj.InsertRow(1)
//idw_obj.SetItem(1,'tiempo_resp',0)
//getchild('nombre',idw_usuresp)
//idw_usuresp.settransobject(sqlca)
//
end event

event retrieveend;long i
for i = 1 to RowCount()
	SetItem(i,'esco',1)
next
t1.p2.dw_procs.setfilter("nfact_cpo="+string(getitemnumber(getrow(),'nfact'))+" and clug_fac='"+getitemstring(getrow(),'clugar_fact')+"' and valor_objecion > 0")
t1.p2.dw_procs.filter()

end event

event itemchanged;if string(dwo.name) = 'esco' then
	long sel, j, i
	sel = GetItemNumber(GetRow(),'esco')
	if data = '2' then 
		if sel = 0 then 
			data = '1'
		elseif sel = 1 then
			data = '0'
		end if
	end if
	SetItem(GetRow(),'esco',long(data))
	SetText(data)
	for i = 1 to t1.p2.dw_procs.RowCount()
		t1.p2.dw_procs.SetItem(i,'selecc',long(data))
		t1.p2.dw_procs.ScrolltoRow(i)
		for j = 1 to t1.p3.dw_sitem.RowCount()
			t1.p3.dw_sitem.SetItem(j,'selecc',long(data))
		next
	next
end if
Return 2

end event

type t1 from tab within w_revisa_ant
event create ( )
event destroy ( )
integer x = 37
integer y = 308
integer width = 2930
integer height = 940
integer taborder = 10
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
p2 p2
p3 p3
end type

on t1.create
this.p2=create p2
this.p3=create p3
this.Control[]={this.p2,&
this.p3}
end on

on t1.destroy
destroy(this.p2)
destroy(this.p3)
end on

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2894
integer height = 820
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_procs dw_procs
end type

on p2.create
this.dw_procs=create dw_procs
this.Control[]={this.dw_procs}
end on

on p2.destroy
destroy(this.dw_procs)
end on

type dw_procs from datawindow within p2
event type long borra_boton ( long row )
event p_itemchanged ( )
event revisa_sel ( )
integer x = 18
integer y = 20
integer width = 2834
integer height = 780
integer taborder = 40
string title = "none"
string dataobject = "dw_factcpo_xa_glos2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event revisa_sel();long f1, f0, f2

f0 = Find("selecc=0",1,RowCount())
f2 = Find("selecc=2",1,RowCount())
f1 = Find("selecc=1",1,RowCount())
if f2 > 0 or (f0 > 0 and f1 > 0) then
	dw_facts.SetItem(dw_facts.GetRow(),'esco',2)
elseif f0 > 0 and f1 = 0 and f2 = 0 then
	dw_facts.SetItem(dw_facts.GetRow(),'esco',0)
elseif f1 > 0 and f0 = 0 and f2 = 0 then
	dw_facts.SetItem(dw_facts.GetRow(),'esco',1)
end if

end event

event clicked;if row>0 and row<>getrow() then setrow(row)

end event

event constructor;settransobject(sqlca)
//getchild('cod_objecion',idw_obj2)
//idw_obj2.settransobject(sqlca)
//idw_obj2.retrieve('%')
//idw_obj2.InsertRow(1)
//
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
st_dw.dw_cab=dw_facts
st_dw.color_fondo=string(rgb(255,255,255))
st_dw.solobuscar = TRUE
openwithparm(w_funcion_dw,st_dw)
end event

event rowfocuschanged;t1.p3.dw_sitem.setfilter('cnf='+string(getitemnumber(getrow(),'nfact_cpo'))+' and clugar_sfac="'+getitemstring(getrow(),'clug_fac')+'" and nitem='+string(getitemnumber(getrow(),'nitem_fac')) + " and valor_objecion > 0")
t1.p3.dw_sitem.filter()

end event

event itemchanged;if dwo.name = 'selecc' then
	long sel, j
	sel = GetItemNumber(GetRow(),'selecc')
	if data = '2' then 
		if sel = 0 then 
			data = '1'
		elseif sel = 1 then
			data = '0'
		end if
	end if
	SetItem(GetRow(),'selecc',long(data))
	SetText(data)
	for j = 1 to t1.p3.dw_sitem.RowCount()
		t1.p3.dw_sitem.SetItem(j,'selecc',long(data))
	next
end if
postEvent("revisa_sel")
Return 2

end event

event retrieveend;long i
for i = 1 to RowCount()
	SetItem(i,'selecc',1)
next

end event

type p3 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2894
integer height = 820
long backcolor = 67108864
string text = "Items del Proc."
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_sitem dw_sitem
end type

on p3.create
this.dw_sitem=create dw_sitem
this.Control[]={this.dw_sitem}
end on

on p3.destroy
destroy(this.dw_sitem)
end on

type dw_sitem from datawindow within p3
event type long borra_boton ( long row )
event p_itemchanged ( )
event revisa_sel ( )
integer x = 37
integer y = 20
integer width = 2816
integer height = 780
integer taborder = 20
string title = "none"
string dataobject = "dw_car_glos_subcpo2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event revisa_sel();long f1, f0

f0 = Find("selecc=0",1,RowCount())
f1 = Find("selecc=1",1,RowCount())
if f1 > 0 and f0 > 0 then
	t1.p2.dw_procs.SetItem(t1.p2.dw_procs.GetRow(),'selecc',2)
elseif f1 = 0 then
	t1.p2.dw_procs.SetItem(t1.p2.dw_procs.GetRow(),'selecc',0)
elseif f1 > 0 and f0 = 0 then
	t1.p2.dw_procs.SetItem(t1.p2.dw_procs.GetRow(),'selecc',1)
end if
t1.p2.dw_procs.Event revisa_sel()

end event

event clicked;if row>0 and row<>getrow() then setrow(row)
end event

event constructor;settransobject(sqlca)
//getchild('cod_objecion',idw_obj3)
//idw_obj3.settransobject(sqlca)
//idw_obj3.retrieve('%')
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
st_dw.dw_cab=t1.p2.dw_procs
st_dw.color_fondo=string(rgb(255,255,255))
st_dw.solobuscar = TRUE
openwithparm(w_funcion_dw,st_dw)

end event

event itemchanged;postEvent("revisa_sel")

end event

