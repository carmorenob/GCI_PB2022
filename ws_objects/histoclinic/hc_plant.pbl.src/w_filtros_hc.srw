$PBExportHeader$w_filtros_hc.srw
forward
global type w_filtros_hc from window
end type
type cbx_1 from checkbox within w_filtros_hc
end type
type pb_3 from picturebutton within w_filtros_hc
end type
type pb_2 from picturebutton within w_filtros_hc
end type
type pb_1 from picturebutton within w_filtros_hc
end type
type cbx_3 from checkbox within w_filtros_hc
end type
type dw_3 from datawindow within w_filtros_hc
end type
type em_2 from editmask within w_filtros_hc
end type
type em_1 from editmask within w_filtros_hc
end type
type dw_1 from datawindow within w_filtros_hc
end type
end forward

global type w_filtros_hc from window
integer width = 2386
integer height = 1800
boolean titlebar = true
string title = "Filtrar Ingresos de historia"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_1 cbx_1
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
cbx_3 cbx_3
dw_3 dw_3
em_2 em_2
em_1 em_1
dw_1 dw_1
end type
global w_filtros_hc w_filtros_hc

type variables
datawindowchild idw_prof,idw_campos,idw_tipocampo
st_filtros_hc i_st
end variables

forward prototypes
public subroutine rec_muestra_padre (long p_padre, long p_nreg)
end prototypes

public subroutine rec_muestra_padre (long p_padre, long p_nreg);if p_padre=0 then 	return
long donde
donde=i_st.dw_histo.find('nregistro='+string(p_nreg)+' and item='+string(p_padre),1,i_st.dw_histo.rowcount())
if donde=0 then return
i_st.dw_histo.setitem(donde,'mostrar','1')
if i_st.dw_histo.getitemnumber(donde,'padre')=0 then i_st.dw_histo.setitem(donde,'mostrar','1')
rec_muestra_padre(i_st.dw_histo.getitemnumber(donde,'padre'),p_nreg)

end subroutine

on w_filtros_hc.create
this.cbx_1=create cbx_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cbx_3=create cbx_3
this.dw_3=create dw_3
this.em_2=create em_2
this.em_1=create em_1
this.dw_1=create dw_1
this.Control[]={this.cbx_1,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.cbx_3,&
this.dw_3,&
this.em_2,&
this.em_1,&
this.dw_1}
end on

on w_filtros_hc.destroy
destroy(this.cbx_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cbx_3)
destroy(this.dw_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
long j
i_st.dw_histo.setfilter('')
i_st.dw_histo.filter()
for j=1 to i_st.dw_histo.rowcount()
	if i_st.dw_histo.getitemstring(j,'tipo_campo')='E' or i_st.dw_histo.getitemnumber(j,'nivel')=0 then continue
	if idw_campos.find('tipo_campo="'+i_st.dw_histo.getitemstring(j,'tipo_campo')+'" and campo="'+i_st.dw_histo.getitemstring(j,'label')+'"',1,idw_campos.rowcount())=0 then
		idw_campos.insertrow(1)
		idw_campos.setitem(1,'tipo_campo',i_st.dw_histo.getitemstring(j,'tipo_campo'))
		idw_campos.setitem(1,'campo',i_st.dw_histo.getitemstring(j,'label'))
	end if
	if idw_tipocampo.find('tipo_campo="'+i_st.dw_histo.getitemstring(j,'tipo_campo')+'"',1,idw_tipocampo.rowcount())=0 then
		idw_tipocampo.insertrow(1)
		idw_tipocampo.setitem(1,'tipo_campo',i_st.dw_histo.getitemstring(j,'tipo_campo'))
	end if
next
i_st.dw_vals.setfilter('')
i_st.dw_vals.filter()
for j=1 to i_st.dw_vals.rowcount()
	if i_st.dw_vals.getitemstring(j,'tipo')='E' then continue
	if idw_campos.find('tipo_campo="'+i_st.dw_vals.getitemstring(j,'tipo')+'" and campo="'+i_st.dw_vals.getitemstring(j,'descampo')+'"',1,idw_campos.rowcount())=0 then
		idw_campos.insertrow(1)
		idw_campos.setitem(1,'tipo_campo',i_st.dw_vals.getitemstring(j,'tipo'))
		idw_campos.setitem(1,'campo',i_st.dw_vals.getitemstring(j,'descampo'))
	end if
	if idw_tipocampo.find('tipo_campo="'+i_st.dw_vals.getitemstring(j,'tipo')+'"',1,idw_tipocampo.rowcount())=0 then
		idw_tipocampo.insertrow(1)
		idw_tipocampo.setitem(1,'tipo_campo',i_st.dw_vals.getitemstring(j,'tipo'))
	end if
next
i_st.dw_histo.event rowfocuschanged(i_st.dw_histo.getrow())
end event

type cbx_1 from checkbox within w_filtros_hc
integer x = 5
integer y = 964
integer width = 841
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar solo los siguientes campos:"
end type

event clicked;dw_3.visible=checked
pb_3.visible=checked
end event

type pb_3 from picturebutton within w_filtros_hc
boolean visible = false
integer x = 1792
integer y = 1036
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar fila"
end type

event clicked;dw_3.deleterow(0)
end event

type pb_2 from picturebutton within w_filtros_hc
integer x = 1577
integer y = 16
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

type pb_1 from picturebutton within w_filtros_hc
integer x = 1413
integer y = 16
integer width = 146
integer height = 128
integer taborder = 10
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

event clicked;string filtro,mas,condic=''
boolean cerrar
long j
if cbx_3.checked then
	filtro='(fecha>=datetime(date("'+mid(em_1.text,7,4)+'-'+mid(em_1.text,4,2)+'-'+mid(em_1.text,1,2)+'"),time("'+mid(em_1.text,12,5)+'")) and fecha<=datetime(date("'+mid(em_2.text,7,4)+'-'+mid(em_2.text,4,2)+'-'+mid(em_2.text,1,2)+'"),time("'+mid(em_2.text,12,5)+'")))'
	mas=' and ('
end if
for j=1 to dw_1.rowcount()
	if (not isnull(dw_1.getitemstring(j,'cesp'))) or (not isnull(dw_1.getitemstring(j,'codprof'))) then
		filtro +=mas+condic
		cerrar=true
		mas=''
		filtro+='(' 
		if not isnull(dw_1.getitemstring(j,'cesp')) then
			filtro+='cesp="'+dw_1.getitemstring(j,'cesp')+'"'
		end if
		if not isnull(dw_1.getitemstring(j,'codprof')) then
			if not isnull(dw_1.getitemstring(j,'cesp')) then filtro+=' and ' 
			filtro+='codprof="'+dw_1.getitemstring(j,'codprof')+'"'
		end if
		filtro+=')'
		condic=dw_1.getitemstring(j,'condic')
	end if
next
if cerrar then filtro+=')'
i_st.dw_histo.setfilter('')
i_st.dw_histo.filter()
i_st.dw_histo.object.mostrar.primary=i_st.dw_histo.object.mostrar_0.primary
i_st.dw_histo.setfilter(filtro)
i_st.dw_histo.filter()
if i_st.dw_histo.rowcount()>0 then i_st.dw_histo.object.mostrar.primary=i_st.dw_histo.object.mostrar_1.primary
if cbx_1.checked then
	filtro=''
	condic=''
	for j=1 to dw_3.rowcount()
		if isnull(dw_3.getitemstring(j,'tipo_campo')) or  (dw_3.getitemstring(j,'todos')='0' and isnull(dw_3.getitemstring(j,'campo'))) then continue
		if dw_3.getitemstring(j,'tipo_campo')='M' then continue
		if dw_3.getitemstring(j,'todos')='1' then
			filtro+=condic+'(tipo="'+dw_3.getitemstring(j,'tipo_campo')+'")'
		else
			filtro+=condic+'(tipo="'+dw_3.getitemstring(j,'tipo_campo')+'" and descampo="'+dw_3.getitemstring(j,'campo')+'")'
		end if
		condic=' or '
	next
	i_st.dw_vals.setfilter('')
	i_st.dw_vals.filter()
	if i_st.dw_vals.rowcount()>0 then i_st.dw_vals.object.mostrar.primary=i_st.dw_vals.object.mostrar_0.primary
	if filtro <>'' then
		i_st.dw_vals.setfilter(filtro+' and tipo<>"E"')
	else
		i_st.dw_vals.setfilter('isnull(tipo)')
	end if
	i_st.dw_vals.filter()
	if i_st.dw_vals.rowcount()>0 then i_st.dw_vals.object.mostrar.primary=i_st.dw_vals.object.mostrar_1.primary	
	filtro =''
	condic=''
	for j=1 to dw_3.rowcount()
		if isnull(dw_3.getitemstring(j,'tipo_campo')) or  (dw_3.getitemstring(j,'todos')='0' and isnull(dw_3.getitemstring(j,'campo'))) then continue
		if dw_3.getitemstring(j,'tipo_campo')<>'M' then continue
		if dw_3.getitemstring(j,'todos')='1' then
			filtro+=condic+'(tipo_campo="'+dw_3.getitemstring(j,'tipo_campo')+'")'
		else
			filtro+=condic+'(tipo_campo="'+dw_3.getitemstring(j,'tipo_campo')+'" and label="'+dw_3.getitemstring(j,'campo')+'")'
		end if
		condic=' or '
	next
	if filtro<>'' then
		i_st.dw_histo.setfilter('mostrar="1" and (tipo_campo="E" or tipo_campo="" or '+filtro+')')
	else
		i_st.dw_histo.setfilter('mostrar="1" and (tipo_campo="E" or tipo_campo="")')
	end if
else
	i_st.dw_histo.setfilter('mostrar="1"')
	i_st.dw_vals.setfilter('tipo<>"E"')
	i_st.dw_vals.filter()
	i_st.dw_vals.object.mostrar.primary=i_st.dw_vals.object.mostrar_1.primary
end if
i_st.dw_histo.filter()
if i_st.dw_histo.filteredcount()>0 then i_st.dw_histo.object.mostrar.filter=i_st.dw_histo.object.mostrar_0.filter
i_st.dw_histo.object.mostrar.primary=i_st.dw_histo.object.mostrar_1.primary
long donde,otro
boolean mostrar
for j=1 to i_st.dw_histo.rowcount()
	if i_st.dw_histo.getitemstring(j,'tipo_campo')<>'' then continue
	mostrar=false
	otro=j
	donde=i_st.dw_histo.find('nregistro='+string(i_st.dw_histo.getitemnumber(j,'nregistro')),otro+1,i_st.dw_histo.rowcount())
	do while donde>0
		otro=donde
		if i_st.dw_histo.getitemstring(otro,'tipo_campo')='M' then mostrar=true
		if i_st.dw_histo.getitemstring(otro,'tipo_campo')='E' then
			i_st.dw_histo.setrow(otro)
			i_st.dw_histo.event rowfocuschanged(otro)
			if i_st.dw_vals.rowcount()>0 then
				mostrar=true
			else
				i_st.dw_histo.setitem(otro,'mostrar','0')
			end if
		end if
		donde=i_st.dw_histo.find('nregistro='+string(i_st.dw_histo.getitemnumber(j,'nregistro')),otro+1,i_st.dw_histo.rowcount())
		if otro +1 >=i_st.dw_histo.rowcount() then exit
	loop
	if not mostrar then
		i_st.dw_histo.setitem(j,'mostrar','0')
		donde=i_st.dw_histo.find('nregistro='+string(i_st.dw_histo.getitemnumber(j,'nregistro'))+' and mostrar="1"',j+1,i_st.dw_histo.rowcount())
		do while donde>0
			otro=donde
			i_st.dw_histo.setitem(donde,'mostrar','0')
			donde=i_st.dw_histo.find('nregistro='+string(i_st.dw_histo.getitemnumber(j,'nregistro'))+' and mostrar="1"',otro+1,i_st.dw_histo.rowcount())
			if otro +1 >=i_st.dw_histo.rowcount() then exit
		loop
	end if
next
for j=1 to i_st.dw_histo.rowcount()
	if i_st.dw_histo.getitemstring(j,'mostrar')='1' then 
		rec_muestra_padre(i_st.dw_histo.getitemnumber(j,'padre'),i_st.dw_histo.getitemnumber(j,'nregistro'))
	end if
next
i_st.dw_histo.setfilter('mostrar="1"')
i_st.dw_histo.filter()
i_st.dw_histo.sort()
i_st.dw_histo.event rowfocuschanged(i_st.dw_histo.getrow())
close(parent)

end event

type cbx_3 from checkbox within w_filtros_hc
integer x = 5
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fechas"
end type

event clicked;em_1.enabled=checked
em_2.enabled=checked
end event

type dw_3 from datawindow within w_filtros_hc
event keypres pbm_dwnkey
boolean visible = false
integer y = 1032
integer width = 1755
integer height = 556
integer taborder = 40
string title = "none"
string dataobject = "dw_selecc_campos_hc2"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event keypres;if key=keydelete! then
	string nulo
	setnull(nulo)
	if getcolumnName()='cesp' then
		setitem(getrow(),'cesp',nulo)
		event rowfocuschanged(getrow())
	else
		setitem(getrow(),'codprof',nulo)
		setitem(getrow(),'desprof',nulo)
	end if
end if
if key=keytab! then
	if getcolumnname()='campo' and getrow()=rowcount() then 	insertrow(0)
	if getcolumnname()='tipo_campo' and getitemstring(getrow(),'todos')='1' and getrow()=rowcount() then insertrow(0)
end if
end event

event constructor;getchild('campo',idw_campos)
getchild('tipo_campo',idw_tipocampo)
insertrow(1)

end event

event rowfocuschanged;if getrow()<1 then return
accepttext()
if isnull(getitemstring(getrow(),'tipo_campo')) then
	idw_campos.setfilter('isnull(tipo_campo)')
else
	idw_campos.setfilter('tipo_campo="'+getitemstring(getrow(),'tipo_campo')+'"')
end if
idw_campos.filter()
end event

event itemchanged;choose case dwo.name
	case 'tipo_campo'
		string nulo
		setnull(nulo)
		setitem(getrow(),'campo',nulo)
end choose
post event rowfocuschanged(getrow())
end event

type em_2 from editmask within w_filtros_hc
integer x = 713
integer y = 56
integer width = 649
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm am/pm"
boolean dropdowncalendar = true
end type

event constructor;text=string(datetime(today(),now()),'dd/mm/yyyy hh:mm')
end event

type em_1 from editmask within w_filtros_hc
integer y = 60
integer width = 649
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm am/pm"
boolean dropdowncalendar = true
end type

event constructor;text=string(datetime(relativedate(today(),-1),now()),'dd/mm/yyyy hh:mm')
end event

type dw_1 from datawindow within w_filtros_hc
event keypres pbm_dwnkey
integer y = 208
integer width = 2222
integer height = 704
integer taborder = 10
string title = "none"
string dataobject = "dw_filtros_hc"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event keypres;if key=keydelete! then
	string nulo
	setnull(nulo)
	if getcolumnName()='cesp' then
		setitem(getrow(),'cesp',nulo)
		event rowfocuschanged(getrow())
	else
		setitem(getrow(),'codprof',nulo)
		setitem(getrow(),'desprof',nulo)
	end if
end if
if key=keytab! then
	if getcolumnname()='condic' and getrow()=rowcount() then 	insertrow(0)
end if
end event

event constructor;settransobject(sqlca)
getchild('desprof',idw_prof)
idw_prof.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string nulo
setnull(nulo)
choose case dwo.name
	case 'cesp'
		setitem(row,'desprof',nulo)
		setitem(row,'codprof',nulo)
		if object.desprof.dddw.name<>'dw_lista_med_espe' then
			object.desprof.dddw.name='dw_lista_med_espe'
			object.desprof.dddw.displaycolumn='desprof' 
			object.desprof.dddw.datacolumn='desprof'
			getchild('desprof',idw_prof)
			idw_prof.settransobject(sqlca)
		end if
		idw_prof.retrieve(data)
	case 'desprof'
		setitem(row,'codprof',idw_prof.getitemstring(idw_prof.getrow(),'codprof'))
end choose
end event

event rowfocuschanged;if getrow()<1 then return
if isnull(getitemstring(getrow(),'cesp')) then 
	if object.desprof.dddw.name<>'dw_profe' then
		object.desprof.dddw.name='dw_profe'
		object.desprof.dddw.displaycolumn='desprof' 
		object.desprof.dddw.datacolumn='desprof'
		getchild('desprof',idw_prof)
		idw_prof.settransobject(sqlca)
	end if
	idw_prof.retrieve()
else
	if object.desprof.dddw.name<>'dw_lista_med_espe' then
		object.desprof.dddw.name='dw_lista_med_espe'
		object.desprof.dddw.displaycolumn='desprof' 
		object.desprof.dddw.datacolumn='desprof'
		getchild('desprof',idw_prof)
		idw_prof.settransobject(sqlca)
	end if
	idw_prof.retrieve(getitemstring(getrow(),'cesp'))
end if
end event

