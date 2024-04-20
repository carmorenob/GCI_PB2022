$PBExportHeader$w_reasigna_receps.srw
forward
global type w_reasigna_receps from window
end type
type p_1 from picture within w_reasigna_receps
end type
type st_6 from statictext within w_reasigna_receps
end type
type pb_reasigna from picturebutton within w_reasigna_receps
end type
type st_5 from statictext within w_reasigna_receps
end type
type dw_3 from datawindow within w_reasigna_receps
end type
type st_4 from statictext within w_reasigna_receps
end type
type ddlb_1 from dropdownlistbox within w_reasigna_receps
end type
type dw_2 from datawindow within w_reasigna_receps
end type
type st_3 from statictext within w_reasigna_receps
end type
type dw_rubros from datawindow within w_reasigna_receps
end type
type pb_1 from picturebutton within w_reasigna_receps
end type
type dw_new_reser from datawindow within w_reasigna_receps
end type
type st_2 from statictext within w_reasigna_receps
end type
type st_1 from statictext within w_reasigna_receps
end type
type dw_reser from datawindow within w_reasigna_receps
end type
type dw_1 from datawindow within w_reasigna_receps
end type
type gb_1 from groupbox within w_reasigna_receps
end type
end forward

global type w_reasigna_receps from window
integer width = 3913
integer height = 2328
boolean border = false
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
p_1 p_1
st_6 st_6
pb_reasigna pb_reasigna
st_5 st_5
dw_3 dw_3
st_4 st_4
ddlb_1 ddlb_1
dw_2 dw_2
st_3 st_3
dw_rubros dw_rubros
pb_1 pb_1
dw_new_reser dw_new_reser
st_2 st_2
st_1 st_1
dw_reser dw_reser
dw_1 dw_1
gb_1 gb_1
end type
global w_reasigna_receps w_reasigna_receps

type variables
long i_item
end variables

on w_reasigna_receps.create
this.p_1=create p_1
this.st_6=create st_6
this.pb_reasigna=create pb_reasigna
this.st_5=create st_5
this.dw_3=create dw_3
this.st_4=create st_4
this.ddlb_1=create ddlb_1
this.dw_2=create dw_2
this.st_3=create st_3
this.dw_rubros=create dw_rubros
this.pb_1=create pb_1
this.dw_new_reser=create dw_new_reser
this.st_2=create st_2
this.st_1=create st_1
this.dw_reser=create dw_reser
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.p_1,&
this.st_6,&
this.pb_reasigna,&
this.st_5,&
this.dw_3,&
this.st_4,&
this.ddlb_1,&
this.dw_2,&
this.st_3,&
this.dw_rubros,&
this.pb_1,&
this.dw_new_reser,&
this.st_2,&
this.st_1,&
this.dw_reser,&
this.dw_1,&
this.gb_1}
end on

on w_reasigna_receps.destroy
destroy(this.p_1)
destroy(this.st_6)
destroy(this.pb_reasigna)
destroy(this.st_5)
destroy(this.dw_3)
destroy(this.st_4)
destroy(this.ddlb_1)
destroy(this.dw_2)
destroy(this.st_3)
destroy(this.dw_rubros)
destroy(this.pb_1)
destroy(this.dw_new_reser)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_reser)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;/*pasa solamente las recepciones que tienen reservas de vigencias no activas ( estado='1') por item de recepcion.
Para las de impuestos que se hicieron de recepciones con reservas pasadas y no se pago el impuesto, 
se debe hacer la recepcion de impuesto con las reservas viejas y ahí si reasignarle la nueva reserva, teneiendo en cuenta
que la recepcion de impuestos quedó con un tercero diferente al de la recepcion original (DIAN por lo general) osea que
la nueva reserva de estar para ese tercero*/
if g_motor='postgres' then
	dw_1.dataobject='dw_busca_recep_sin_pago_postgres'
	dw_reser.dataobject='dw_reserv_de_receps_postgres'
else
	dw_1.dataobject='dw_busca_recep_sin_pago'	
	dw_reser.dataobject='dw_reserv_de_receps'
end if
dw_1.settransobject(sqlca)
dw_reser.settransobject(sqlca)
					
end event

type p_1 from picture within w_reasigna_receps
integer width = 6501
integer height = 80
string picturename = "titulo.jpg"
boolean focusrectangle = false
end type

type st_6 from statictext within w_reasigna_receps
integer x = 37
integer width = 1751
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 553648127
string text = "Reasignación de reservas para recepciones con vigencias anteriores"
boolean focusrectangle = false
end type

type pb_reasigna from picturebutton within w_reasigna_receps
integer x = 741
integer y = 108
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "import.gif"
alignment htextalign = left!
string powertiptext = "Modificar Recepción Vigencia Actual"
end type

event clicked;if f_sol_permiso(this,'RFC') <> 1 then Return
open(w_rfc_reser)

end event

type st_5 from statictext within w_reasigna_receps
boolean visible = false
integer x = 919
integer y = 120
integer width = 736
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tercero de la reserva de nomina:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_reasigna_receps
boolean visible = false
integer x = 1659
integer y = 104
integer width = 2171
integer height = 132
integer taborder = 20
string title = "none"
string dataobject = "dw_regla_gen_empleado"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
insertRow(1)

end event

event itemchanged;this.accepttext()
string tipodoc, documento

tipodoc = this.getitemstring(this.getrow(),'tipodoc')
documento = this.getitemstring(this.getrow(),'documento')
if not isNull(dwo) then
	if (dwo.Name) <> 'documento' then Return
end if

this.retrieve(tipodoc, documento)
IF this.rowcount()=0 THEN
	this.InsertRow(0)
	Setitem(1,'tipodoc',tipodoc)
	Setitem(1,'documento',documento)
	messagebox ("Atención","Tercero no encontrado. ")
	return

end if

end event

type st_4 from statictext within w_reasigna_receps
integer x = 46
integer y = 116
integer width = 178
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Origen:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_reasigna_receps
integer x = 224
integer y = 104
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Reservas","Impuestos","Nomina"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;i_item=index
st_5.visible=false
dw_3.visible=false
choose case i_item
	case 1
//		if g_motor<>'anywhere' then dw_cpo.Object.DataWindow.Retrieve.AsNeeded='yes'
		SQLCA.Autocommit=TRUE
		dw_reser.retrieve('PR')
		SQLCA.Autocommit=FALSE
		dw_1.reset()
		SQLCA.Autocommit=TRUE
		if dw_1.retrieve('PR')>0 then
			SQLCA.Autocommit=FALSE
			dw_rubros.retrieve()
			dw_new_reser.retrieve()
		else
			SQLCA.Autocommit=FALSE
			dw_rubros.reset()
			dw_new_reser.reset()
		end if
	case 2
		SQLCA.Autocommit=TRUE
		dw_reser.retrieve('RFC')
		SQLCA.Autocommit=FALSE
		dw_1.reset()
		SQLCA.Autocommit=TRUE
		if dw_1.retrieve('RFC')>0 then
			SQLCA.Autocommit=FALSE
			dw_rubros.retrieve()
			dw_new_reser.retrieve()
		else
			SQLCA.Autocommit=FALSE
			dw_rubros.reset()
			dw_new_reser.reset()
		end if
	case 3
		st_5.visible=true
		dw_3.visible=true
		SQLCA.Autocommit=TRUE
		dw_reser.retrieve('NM')
		SQLCA.Autocommit=FALSE
		dw_1.reset()
		SQLCA.Autocommit=TRUE
		if dw_1.retrieve('NM')>0 then
			SQLCA.Autocommit=FALSE
			dw_rubros.retrieve()
			dw_new_reser.retrieve()
		else
			SQLCA.Autocommit=FALSE
			dw_rubros.reset()
			dw_new_reser.reset()
		end if
end choose

end event

type dw_2 from datawindow within w_reasigna_receps
boolean visible = false
integer x = 2025
integer y = 648
integer width = 142
integer height = 132
integer taborder = 20
string title = "none"
string dataobject = "dw_reserv_de_receps"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type st_3 from statictext within w_reasigna_receps
integer x = 41
integer y = 1732
integer width = 498
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rubros de la Reserva:"
boolean focusrectangle = false
end type

type dw_rubros from datawindow within w_reasigna_receps
event p_itemchanged ( decimal p_valor_ante,  decimal p_valor,  long p_fila )
integer x = 41
integer y = 1792
integer width = 3730
integer height = 476
integer taborder = 50
string title = "none"
string dataobject = "dw_reserv_pa_recep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(decimal p_valor_ante, decimal p_valor, long p_fila);accepttext()
setredraw(true)
dw_new_reser.setitem(dw_new_reser.getrow(),'valor_asig', dw_new_reser.getitemnumber(dw_new_reser.getrow(),'valor_asig') - p_valor_ante + p_valor)
dw_1.setitem(dw_1.getrow(),'valor_new',dw_1.getitemnumber(dw_1.getrow(),'valor_new') - p_valor_ante + p_valor )
long donde
string buscar
buscar='char_orig1="PR" and char_orig2="'+getitemstring(p_fila,'clugar')+'" and num_orig1='+string(getitemnumber(p_fila,'numdoc'))+' and num_orig2='+string(getitemnumber(p_fila,'item'))+' and char_doc1 ="'+dw_1.getitemstring(dw_1.getrow(),'clugar')+'" and char_doc2="RFC" and num_doc1='+string(dw_1.getitemnumber(dw_1.getrow(),'nrelacion'))+' and num_doc2='+string(dw_1.getitemnumber(dw_1.getrow(),'item'))
donde=dw_2.find(buscar,1,dw_2.rowcount())
if p_valor>0 then
	if donde=0 then
		donde=dw_2.insertrow(0)
		dw_2.setitem(donde,'char_orig1','PR')
		dw_2.setitem(donde,'char_orig2',getitemstring(p_fila,'clugar'))
		dw_2.setitem(donde,'num_orig1',getitemnumber(p_fila,'numdoc'))
		dw_2.setitem(donde,'num_orig2',getitemnumber(p_fila,'item'))
		dw_2.setitem(donde,'char_doc1',dw_1.getitemstring(dw_1.getrow(),'clugar'))
		dw_2.setitem(donde,'char_doc2','RFC')
		dw_2.setitem(donde,'num_doc1',dw_1.getitemnumber(dw_1.getrow(),'nrelacion'))
		dw_2.setitem(donde,'num_doc2',dw_1.getitemnumber(dw_1.getrow(),'item'))
		dw_2.setitem(donde,'codigo',dw_1.getitemstring(dw_1.getrow(),'cod_flujo'))
	end if
	dw_2.setitem(donde,'valor',p_valor)
else
	if donde>0 then dw_2.deleterow(0)
end if

end event

event constructor;settransobject(sqlca)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event itemchanged;dec valor,val_bruto,val_ante
valor=dec(data)
val_ante=getitemnumber(getrow(),'valor_asig')
if getitemnumber(getrow(),'monto_vigente')-getitemnumber(getrow(),'monto_interfaz')<valor then
	messagebox('Atención','Este valor es mayor de lo disponible del rubro')
	settext(string(val_ante))
	setitem(getrow(),'valor_asig',val_ante)
	return 2
end if
if dw_new_reser.getitemnumber(dw_new_reser.getrow(),'valor_asig') - val_ante + valor > dw_new_reser.getitemnumber(dw_new_reser.getrow(),'monto')- dw_new_reser.getitemnumber(dw_new_reser.getrow(),'monto_reser') then
	messagebox('Atención','Este valor es mayor de lo asignado para el tercero en esta Reserva')
	settext(string(val_ante))
	setitem(getrow(),'valor_asig',val_ante)
	return 2
end if
if dw_1.getitemnumber(dw_1.getrow(),'valor_new') - val_ante + valor > dw_1.getitemnumber(dw_1.getrow(),'tbruto') then
	messagebox('Atención','Este valor es mayor del item de la recepción de factura')
	settext(string(val_ante))
	setitem(getrow(),'valor_asig',val_ante)
	return 2
end if
POST event p_itemchanged(val_ante,valor,getrow())
end event

type pb_1 from picturebutton within w_reasigna_receps
integer x = 2030
integer y = 280
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Recepciones con nuevas reservas"
end type

event clicked;if dw_1.rowcount()=0 then return
long j,k,l,nreser,item_reser, rfc_num,rfc_item,fila
dec valor
string clug_reser,tdoc,docum,err,l_doc,l_clug

if dw_1.getitemnumber(dw_1.getrow(),'falta')>0 then
	messagebox('Atención','Debe asignar todo el valor para la Recepcion')
	return
end if
for j=1 to dw_1.rowcount()
	if dw_1.getitemnumber(j,'valor_new')=0 then continue
	dw_1.setrow(j)
	dw_1.event rowfocuschanged(j)
	for k=1 to dw_reser.rowcount()
		nreser=dw_reser.getitemnumber(k,'num_orig1')
		item_reser=dw_reser.getitemnumber(k,'num_orig2')
		clug_reser=dw_reser.getitemstring(k,'char_orig2')
		valor=round(dw_reser.getitemnumber(k,'valor'),2)
		tdoc=dw_1.getitemstring(j,'tipodoc')
		docum=dw_1.getitemstring(j,'documento')
		update pre_dispo_ter set monto_reser = monto_reser - :valor 
		where coddocu='PR' and clugar=:clug_reser and numdoc=:nreser and tipodoc=:tdoc and documento=:docum;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando pre_dispo_ter',err)
			return
		end if
		update pre_docu_cp set monto_interfaz = monto_interfaz - :valor 
		where coddoc='PR' and clugar=:clug_reser and numdoc=:nreser and item=:item_reser;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando pre_docu_cpr',err)
			return
		end if
	next

//	for k=1 to dw_2.rowcount()
//		l_clug=dw_2.getitemstring(k,'char_doc1')
//		l_doc=dw_2.getitemstring(k,'char_doc2')
//		rfc_num=dw_2.getitemnumber(k,'num_doc1')
//		rfc_item=dw_2.getitemnumber(k,'num_doc2')
//		fila = dw_reser.Find("char_doc2='"+l_doc+"' and "+"char_doc1='"+l_clug+"' and "+	"num_doc1="+string(rfc_num)+" and num_doc2="+string(rfc_item),1,dw_reser.RowCount())
//		if fila > 0 then
//			dw_reser.ScrolltoRow(fila)
//			dw_reser.deleterow(0)
//		end if
//	next
	do while dw_reser.rowcount()>0
		dw_reser.deleterow(0)
	loop

	for k= 1 to dw_new_reser.rowcount()
		if dw_new_reser.getitemnumber(k,'valor_asig')=0 then continue
		dw_new_reser.setitem(k,'monto_reser',round(dw_new_reser.getitemnumber(k,'monto_reser')+dw_new_reser.getitemnumber(k,'valor_asig'),2))
		dw_new_reser.setrow(k)
		dw_new_reser.event rowfocuschanged(k)
		for l=1 to dw_rubros.rowcount()
			if dw_rubros.getitemnumber(l,'valor_asig')=0 then continue
			dw_rubros.setitem(l,'monto_interfaz',round(dw_rubros.getitemnumber(l,'monto_interfaz')+dw_rubros.getitemnumber(l,'valor_asig'),2))
		next
	next
next
if dw_reser.update()=-1 then 
	rollback;
	ddlb_1.event selectionchanged(i_item)
	return
end if
if dw_new_reser.update()=-1 then
	rollback;
	ddlb_1.event selectionchanged(i_item)
	return
end if
if dw_rubros.update()=-1 then
	rollback;
	ddlb_1.event selectionchanged(i_item)
	return
end if
string cod=''
long item
dw_2.sort()
for j=1 to dw_2.rowcount()
	if cod<>dw_2.getitemstring(j,'codigo') then
		cod=dw_2.getitemstring(j,'codigo')
		select max(item) into :item from mod_relacion_origen where codigo=:cod;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error leyendo mod_relacion_origen',err)
			ddlb_1.event selectionchanged(i_item)
			return
		end if
		if isnull(item) then item=0
	end if
	item ++
	dw_2.setitem(j,'item',item)
next
if dw_2.update()=-1 then
	rollback;
	ddlb_1.event selectionchanged(i_item)
	return
end if

string clg,cdoc
long doc
clg=dw_1.getitemstring(1,'clugar')
cdoc=dw_1.getitemstring(1,'coddoc')
doc=dw_1.getitemnumber(1,'nrelacion')

UPDATE tesorelfact SET tesorelfact.en_destino = '0'
WHERE 
	(((tesorelfact.CLugar)=:clg) AND 
	((tesorelfact.CodDoc)=:cdoc) AND 
	((tesorelfact.nrelacion)=:doc));
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando tesorelfact',err)
	return
end if

commit;
ddlb_1.event selectionchanged(i_item)
end event

type dw_new_reser from datawindow within w_reasigna_receps
integer x = 37
integer y = 1156
integer width = 3726
integer height = 552
integer taborder = 30
string title = "none"
string dataobject = "dw_reserv_terce_nuevas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanged;if getrow()<1 then
	dw_rubros.setfilter('isnull(item)')
else
	dw_rubros.setfilter('coddoc="'+getitemstring(getrow(),'coddocu')+'" and clugar="'+getitemstring(getrow(),'clugar')+'" and numdoc='+string(getitemnumber(getrow(),'numdoc')))
end if
dw_rubros.filter()

end event

type st_2 from statictext within w_reasigna_receps
integer x = 2231
integer y = 304
integer width = 1189
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de la(s) reserva(s) actual(es) de la recepción:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_reasigna_receps
integer x = 41
integer y = 228
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recepciones sin pago:"
boolean focusrectangle = false
end type

type dw_reser from datawindow within w_reasigna_receps
integer x = 2222
integer y = 364
integer width = 1600
integer height = 688
integer taborder = 20
string title = "none"
string dataobject = "dw_reserv_de_receps"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_1 from datawindow within w_reasigna_receps
integer x = 32
integer y = 288
integer width = 1952
integer height = 784
integer taborder = 10
string title = "none"
string dataobject = "dw_busca_recep_sin_pago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanged;if getrow()<1 then 
	dw_new_reser.setfilter('isnull(tipodoc)')
	dw_reser.setfilter('isnull(item)')
else
	if dw_3.visible then
		if not isnull(dw_3.getitemstring(1,'documento')) then
			dw_new_reser.setfilter('tipodoc="'+dw_3.getitemstring(1,'tipodoc')+'" and documento="'+dw_3.getitemstring(1,'documento')+'"')
		else
			dw_new_reser.setfilter('isnull(tipodoc)')
		end if
	else
		dw_new_reser.setfilter('tipodoc="'+getitemstring(getrow(),'tipodoc')+'" and documento="'+getitemstring(getrow(),'documento')+'"')
	end if
	string filtro
	filtro='coddoc="'+getitemstring(getrow(),'coddoc')+'" and clugar="'+ getitemstring(getrow(),'clugar') +'" and nrelacion='+string(getitemnumber(getrow(),'nrelacion'))+' and item_rel='+string(getitemnumber(getrow(),'item'))
	dw_reser.setfilter(filtro)
end if
dw_new_reser.filter()
dw_reser.filter()
dw_new_reser.event rowfocuschanged(dw_new_reser.getrow())

end event

event rowfocuschanging;if currentrow<1 or rowcount()=0 or currentrow>rowcount() then return 0
if getitemnumber(currentrow,'valor_new')>0 then return 1
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)

end event

type gb_1 from groupbox within w_reasigna_receps
integer x = 9
integer y = 1104
integer width = 3826
integer height = 1192
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nuevas Reservas del Tercero"
end type

