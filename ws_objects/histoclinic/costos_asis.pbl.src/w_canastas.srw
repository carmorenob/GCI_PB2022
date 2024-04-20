$PBExportHeader$w_canastas.srw
forward
global type w_canastas from window
end type
type pb_cancel from picturebutton within w_canastas
end type
type pb_ok from picturebutton within w_canastas
end type
type pb_1 from picturebutton within w_canastas
end type
type pb_insert from picturebutton within w_canastas
end type
type st_1 from statictext within w_canastas
end type
type dw_escoger from datawindow within w_canastas
end type
type dw_getareo from datawindow within w_canastas
end type
type dw_descrip from datawindow within w_canastas
end type
end forward

global type w_canastas from window
integer width = 3538
integer height = 1444
boolean titlebar = true
string title = "Elegir insumos del Procedimiento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "consumo.ico"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
pb_1 pb_1
pb_insert pb_insert
st_1 st_1
dw_escoger dw_escoger
dw_getareo dw_getareo
dw_descrip dw_descrip
end type
global w_canastas w_canastas

type variables
st_xa_canastas i_st
datawindowchild idw_getareo,idw_genericos,idw_insumo,idw_articulo
string ls_sale='!'
boolean i_cambio
end variables

on w_canastas.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.pb_1=create pb_1
this.pb_insert=create pb_insert
this.st_1=create st_1
this.dw_escoger=create dw_escoger
this.dw_getareo=create dw_getareo
this.dw_descrip=create dw_descrip
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.pb_1,&
this.pb_insert,&
this.st_1,&
this.dw_escoger,&
this.dw_getareo,&
this.dw_descrip}
end on

on w_canastas.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.pb_1)
destroy(this.pb_insert)
destroy(this.st_1)
destroy(this.dw_escoger)
destroy(this.dw_getareo)
destroy(this.dw_descrip)
end on

event open;i_st=message.powerobjectparm
dw_descrip.retrieve(i_st.cproc)
if idw_getareo.retrieve(i_st.cproc,i_st.edad_dias,i_st.sexo)>0 then
	long j
	dw_getareo.setitem( 1, 'codgetareo', idw_getareo.getitemstring(1,'codgetareo'))
	dw_getareo.event itemchanged(1,dw_getareo.object.codgetareo,idw_getareo.getitemstring(1,'codgetareo'))
else
	ls_sale='NI' //no insumos
	closewithreturn(this,'')
	return
end if
dw_escoger.sort()
end event

type pb_cancel from picturebutton within w_canastas
integer x = 1669
integer y = 1196
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_canastas
integer x = 1499
integer y = 1196
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;long j,donde
long nro_insum
if dw_escoger.find('(cod_arti="" or isnull(cod_arti)) ',1,dw_escoger.rowcount())>0 then
	messagebox('Atención','Debe elegir un artículo y sus cantidades')
	return
end if
if not i_cambio then
	closewithreturn(parent,'ok')
	return
end if
for j=1 to dw_escoger.rowcount()
	i_st.dw_canasta.insertrow(j)
	i_st.dw_canasta.setitem(j,'almacen',i_st.alm)
	i_st.dw_canasta.setitem(j,'contador',i_st.contador)
	i_st.dw_canasta.setitem(j,'clugar',i_st.clugar)
	i_st.dw_canasta.setitem(j,'nservicio',i_st.item)
	i_st.dw_canasta.setitem(j,'nro_insumo',j)
	
	i_st.dw_canasta.setitem(j,'contador_os',i_st.contador)
	i_st.dw_canasta.setitem(j,'clugar_os',i_st.clugar)
	i_st.dw_canasta.setitem(j,'nsolicitud',i_st.norden)
	i_st.dw_canasta.setitem(j,'item_os',i_st.item)

	i_st.dw_canasta.setitem(j,'cod_insumo',dw_escoger.getitemstring(j,'cod_insumo'))
	i_st.dw_canasta.setitem(j,'c_medica',dw_escoger.getitemstring(j,'c_medica'))
	i_st.dw_canasta.setitem(j,'umed',dw_escoger.getitemstring(j,'umed'))
	i_st.dw_canasta.setitem(j,'conversion',dw_escoger.getitemnumber(j,'conversion'))
	i_st.dw_canasta.setitem(j,'cantidad',dw_escoger.getitemnumber(j,'cantidad'))
	i_st.dw_canasta.setitem(j,'facturar',dw_escoger.getitemnumber(j,'facturar'))


	if dw_escoger.getitemstatus(j,0,primary!)=notmodified! or dw_escoger.getitemstatus(j,0,primary!)=DataModified!	then
		i_st.dw_canasta.setitem(j,'del_kit','1')
	end if
	i_st.dw_canasta.setitem(j,'codgenerico',dw_escoger.getitemstring(j,'codgenerico'))
	i_st.dw_canasta.setitem(j,'codarticulo',dw_escoger.getitemstring(j,'cod_arti'))
	i_st.dw_canasta.setitem(j,'descripcion',dw_escoger.getitemstring(j,'descrip_arti_ori'))
	i_st.dw_canasta.setitem(j,'vtotal',dw_escoger.getitemnumber(j,'cantidad')*dw_escoger.getitemnumber(j,'vprom'))
	
	if dw_escoger.getitemstring(j,'lote')<>'' and not isnull(dw_escoger.getitemstring(j,'lote')) then
		donde=i_st.dw_lote.insertrow(0)
		i_st.dw_lote.setitem(donde,'codalmacen',i_st.alm)
		i_st.dw_lote.setitem(donde,'codarticulo',dw_escoger.getitemstring(j,'cod_arti'))
		i_st.dw_lote.setitem(donde,'lote',dw_escoger.getitemstring(j,'lote'))
		i_st.dw_lote.setitem(donde,'convenio',dw_escoger.getitemstring(j,'convenio'))
		i_st.dw_lote.setitem(donde,'fecha_venc',dw_escoger.getitemdatetime(j,'fecha_venc'))
		i_st.dw_lote.setitem(donde,'cantidad',dw_escoger.getitemnumber(j,'cantidad'))
		i_st.dw_lote.setitem(donde,'estado','1')
		i_st.dw_lote.setitem(donde,'signo',-1)
		i_st.dw_lote.setitem(donde,'contador_serv',i_st.contador)
		i_st.dw_lote.setitem(donde,'clugar_serv',i_st.clugar)
		i_st.dw_lote.setitem(donde,'nservicio_serv',i_st.item)
		i_st.dw_lote.setitem(donde,'nro_insumo_serv',j)
//		i_st.dw_lote.setitem(donde,'contador_os',i_st.contador)
//		i_st.dw_lote.setitem(donde,'clugar_os',i_st.clugar)
//		i_st.dw_lote.setitem(donde,'nsolicitud_os',i_st.norden)
//		i_st.dw_lote.setitem(donde,'item_os',i_st.item)
	end if
next
closewithreturn(parent,'ok')



end event

type pb_1 from picturebutton within w_canastas
integer x = 1897
integer y = 212
integer width = 151
integer height = 132
integer taborder = 40
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

event clicked;if dw_escoger.rowcount()=0 then return
if dw_escoger.getitemstring(dw_escoger.getrow(),'borrar')='0' then 
	MessageBox('Atención','Ya fue guardado y afectado kardex, no se puede modificar')
	return
end if
if i_st.dw_canasta.rowcount() > 0 then //si es mayor de cero viene para edicion
	long nro_insum,donde
	nro_insum=dw_escoger.getitemnumber(dw_escoger.getrow(),'nro_insumo')
	donde=i_st.dw_canasta.find('nro_insumo='+string(nro_insum),1,i_st.dw_canasta.rowcount())
	i_st.dw_canasta.deleterow(donde)
	i_st.dw_lote.setfilter('nservicio_serv='+string(i_st.item)+' and nro_insumo_serv='+string(nro_insum))
	i_st.dw_lote.filter()
	do while i_st.dw_lote.rowcount()>0
		i_st.dw_lote.deleterow(0)
	loop
//	dw_escoger.deleterow(0)
//	no es necesario i_cambio ya que lo borra de una vez
end if
dw_escoger.deleteRow(0)
dw_escoger.event rowfocuschanged(dw_escoger.getrow())

end event

type pb_insert from picturebutton within w_canastas
integer x = 1705
integer y = 212
integer width = 151
integer height = 132
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

event clicked;dw_escoger.insertrow(0)
end event

type st_1 from statictext within w_canastas
integer x = 14
integer y = 308
integer width = 411
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Insumos a Utilizar:"
boolean focusrectangle = false
end type

type dw_escoger from datawindow within w_canastas
integer x = 9
integer y = 368
integer width = 3493
integer height = 816
integer taborder = 30
string title = "none"
string dataobject = "dw_escoger_genericos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('descrip_generico',idw_genericos)
idw_genericos.settransobject( sqlca)
getchild( 'insumo', idw_insumo)
idw_insumo.settransobject(sqlca)
getchild( 'descrip_arti', idw_articulo)
idw_articulo.settransobject(sqlca)
end event

event rowfocuschanged;idw_genericos.reset()
if getrow()<1 then return
if getitemstatus( getrow(), 0, primary!)=new! or getitemstatus( getrow(), 0, primary!)=newmodified! then
	if describe('descrip_generico.dddw.name')<>'dw_generi_x_insumo' then
		modify('descrip_generico.dddw.name="dw_generi_x_insumo"')
		getchild('descrip_generico',idw_genericos)
		idw_genericos.settransobject(sqlca)
	end if
	idw_genericos.retrieve(getitemstring(getrow(),'cod_insumo'))
else
	if describe('descrip_generico.dddw.name')<>'dw_lista_gener_x_proc' then
		modify('descrip_generico.dddw.name="dw_lista_gener_x_proc"')
		getchild('descrip_generico',idw_genericos)
		idw_genericos.settransobject(sqlca)
	end if
	idw_genericos.retrieve(i_st.cproc,getitemstring(getrow(),'cod_insumo'),dw_getareo.getitemstring(1,1))
end if
if not isnull(getitemstring(getrow(),'codgenerico')) then
	idw_articulo.retrieve(getitemstring(getrow(),'codgenerico'),i_st.alm,getitemnumber(getrow(),'cantidad'))
else
	idw_articulo.reset()
end if
end event

event itemchanged;long donde
string nulo
setnull(nulo)
choose case dwo.name
	case 'insumo'
		setitem( row, 'cod_insumo', idw_insumo.getitemstring(idw_insumo.getrow(),'cod_insumo'))
		if idw_genericos.retrieve(idw_insumo.getitemstring(idw_insumo.getrow(),'cod_insumo') )>0 then
			//setitem(row,'codgenerico',idw_genericos.getitemstring( 1, 'c_medica'))
			setitem(row,'codgenerico',idw_genericos.getitemstring( 1, 'codgenerico'))
			setitem(row,'descrip_generico',idw_genericos.getitemstring( 1, 'medicamento'))
			event itemchanged(row,object.descrip_generico,idw_genericos.getitemstring( 1, 'medicamento'))
		end if
	case 'descrip_generico'
		donde=idw_genericos.find('medicamento="'+data+'"',1,idw_genericos.rowcount())
		if donde=0 then return
		//setitem(row,'codgenerico',idw_genericos.getitemstring( donde, 'c_medica'))
		setitem(row,'codgenerico',idw_genericos.getitemstring( donde, 'codgenerico'))
		setitem(row,'descrip_arti',nulo)
		setitem(row,'cod_arti',nulo)
		if idw_articulo.retrieve(idw_genericos.getitemstring( donde, 'c_medica'),i_st.alm,getitemnumber(row,'cantidad'))>0 then
			setitem(getrow(),'descrip_arti',idw_articulo.getitemstring( 1, 'descrip_arti'))
			setitem(getrow(),'descrip_arti_ori',idw_articulo.getitemstring( 1, 'descripcion'))
			setitem(getrow(),'cod_arti',idw_articulo.getitemstring( 1, 'codarticulo'))
			setitem(getrow(),'lote',idw_articulo.getitemstring( 1, 'lote'))
			setitem(getrow(),'convenio',idw_articulo.getitemstring(1, 'convenio'))
			setitem(getrow(),'fecha_venc',idw_articulo.getitemdatetime( 1, 'fecha_venc'))
			setitem(getrow(),'vprom',idw_articulo.getitemnumber( 1, 'costoprom'))
		end if
	case 'descrip_arti'
		setitem(getrow(),'cod_arti',nulo)
		setitem(getrow(),'lote',nulo)
		donde=idw_articulo.find('descrip_arti="'+data+'"',1,idw_articulo.rowcount())
		if getitemnumber(row,'cantidad')>idw_articulo.getitemnumber(donde,'cantidad') then
			settext('')
			setitem(row,'descrip_arti',nulo)
			return 1
		end if
		setitem(getrow(),'cod_arti',idw_articulo.getitemstring( idw_articulo.getrow(), 'codarticulo'))
		setitem(getrow(),'lote',idw_articulo.getitemstring( idw_articulo.getrow(), 'lote'))
		setitem(getrow(),'convenio',idw_articulo.getitemstring( idw_articulo.getrow(), 'convenio'))
		setitem(getrow(),'descrip_arti_ori',idw_articulo.getitemstring( idw_articulo.getrow(), 'descripcion'))
		setitem(getrow(),'fecha_venc',string(idw_articulo.getitemdatetime( idw_articulo.getrow(), 'fecha_venc'),'yyyy/mm/dd hh:mm'))
		setitem(getrow(),'vprom',idw_articulo.getitemnumber( idw_articulo.getrow(), 'costoprom'))
	case 'cantidad'
		donde=idw_articulo.find('descrip_arti="'+getitemstring(row,'descrip_arti')+'"',1,idw_articulo.rowcount())
		if real(data)>idw_articulo.getitemnumber(donde,'cantidad') then
			settext('0')
			setitem(row,'cantidad',0)
			return 1
		end if
end choose
i_cambio=true
end event

event buttonclicked;openwithparm(w_escoge_gener,getitemstring(row,'cod_insumo'))
if message.stringparm<>'' then 
	setitem(row,'codgenerico',message.stringparm)
	event itemchanged(row,object.codgenerico,message.stringparm)
end if
end event

event clicked;if row>0 and getrow()<>row then setrow(row)
end event

type dw_getareo from datawindow within w_canastas
integer y = 156
integer width = 1627
integer height = 152
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_getareo_proc"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('codgetareo',idw_getareo)
idw_getareo.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;dw_escoger.retrieve(i_st.cproc,data)
long j
accepttext()
dw_escoger.SetRedraw(false)
for j=1 to dw_escoger.rowcount()
	if idw_genericos.retrieve(i_st.cproc,dw_escoger.getitemstring(j,'cod_insumo'),data)=0 then continue
	dw_escoger.setitem(j,'codgenerico',idw_genericos.getitemstring(1,'codgenerico'))
	dw_escoger.setitem(j,'descrip_generico',idw_genericos.getitemstring(1,'medicamento'))
	dw_escoger.setitem(j,'cantidad',idw_genericos.getitemnumber(1,'cantidad'))
	dw_escoger.setitem(j,'umed',idw_genericos.getitemstring(1,'umed'))
	dw_escoger.setitem(j,'conversion',idw_genericos.getitemnumber(1,'conversion'))
	dw_escoger.setrow(j)
	dw_escoger.event itemchanged(j,dw_escoger.object.descrip_generico,idw_genericos.getitemstring(1,'medicamento'))
next
dw_escoger.SetSort("#5 A")
dw_escoger.Sort()
dw_escoger.SetRedraw(true)
i_cambio=true

end event

type dw_descrip from datawindow within w_canastas
integer width = 3099
integer height = 156
integer taborder = 10
string title = "none"
string dataobject = "dw_descrip_proc"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

