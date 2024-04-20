$PBExportHeader$w_reportes.srw
forward
global type w_reportes from window
end type
type dw_prev from datawindow within w_reportes
end type
type tab_1 from tab within w_reportes
end type
type tp_1 from userobject within tab_1
end type
type pb_2 from picturebutton within tp_1
end type
type pb_1 from picturebutton within tp_1
end type
type dw_5 from datawindow within tp_1
end type
type st_3 from statictext within tp_1
end type
type dw_3 from datawindow within tp_1
end type
type dw_2 from datawindow within tp_1
end type
type gb_4 from groupbox within tp_1
end type
type tp_1 from userobject within tab_1
pb_2 pb_2
pb_1 pb_1
dw_5 dw_5
st_3 st_3
dw_3 dw_3
dw_2 dw_2
gb_4 gb_4
end type
type tp_2 from userobject within tab_1
end type
type pb_del from picturebutton within tp_2
end type
type pb_ins from picturebutton within tp_2
end type
type pb_3 from picturebutton within tp_2
end type
type pb_5 from picturebutton within tp_2
end type
type pb_4 from picturebutton within tp_2
end type
type dw_4 from datawindow within tp_2
end type
type dw_1 from datawindow within tp_2
end type
type dw_rep from datawindow within tp_2
end type
type pb_1x from picturebutton within tp_2
end type
type pb_2x from picturebutton within tp_2
end type
type gb_3 from groupbox within tp_2
end type
type gb_1 from groupbox within tp_2
end type
type gb_2 from groupbox within tp_2
end type
type dw_param from datawindow within tp_2
end type
type dw_lista from datawindow within tp_2
end type
type mle_sql from multilineedit within tp_2
end type
type dw_confpar from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_del pb_del
pb_ins pb_ins
pb_3 pb_3
pb_5 pb_5
pb_4 pb_4
dw_4 dw_4
dw_1 dw_1
dw_rep dw_rep
pb_1x pb_1x
pb_2x pb_2x
gb_3 gb_3
gb_1 gb_1
gb_2 gb_2
dw_param dw_param
dw_lista dw_lista
mle_sql mle_sql
dw_confpar dw_confpar
end type
type tab_1 from tab within w_reportes
tp_1 tp_1
tp_2 tp_2
end type
end forward

global type w_reportes from window
integer width = 4992
integer height = 2424
boolean titlebar = true
string title = "Reportes de las Aplicaciones"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "rep.ico"
dw_prev dw_prev
tab_1 tab_1
end type
global w_reportes w_reportes

type variables
string i_grupo,i_modulo,i_codrep,i_tipo,i_mod_solo
long i_item
boolean i_change_menu,i_change_param,i_change_interno
end variables

on w_reportes.create
this.dw_prev=create dw_prev
this.tab_1=create tab_1
this.Control[]={this.dw_prev,&
this.tab_1}
end on

on w_reportes.destroy
destroy(this.dw_prev)
destroy(this.tab_1)
end on

event closequery;if i_change_interno then
	choose case messagebox('Atención','Realizó cambios a los reportes Internos desea guardar los cambios?',question!,yesnocancel!,1)
		case 1
			if tab_1.tp_1.pb_2.event clicked()=-1 then 
				return 1
			end if
		case 2
		case 3
			return 1
	end choose
end if
if  i_change_menu or i_change_param then
	choose case messagebox('Atención','Realizó cambios a los reportes de menus desea guardar los cambios?',question!,yesnocancel!,1)
		case 1
			if tab_1.tp_2.pb_3.event clicked()=-1 then 
				return 1
			end if
		case 2
			return 0
		case 3
			return 1
	end choose
end if
end event

type dw_prev from datawindow within w_reportes
string tag = "Para construir aqui el reporte y poder ver los parametros"
boolean visible = false
integer x = 2665
integer y = 44
integer width = 192
integer height = 80
integer taborder = 40
boolean enabled = false
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_reportes
integer x = 9
integer y = 28
integer width = 4475
integer height = 2236
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4439
integer height = 2108
long backcolor = 67108864
string text = "    Internos"
long tabtextcolor = 33554432
string picturename = "contratos.ico"
long picturemaskcolor = 536870912
string powertiptext = "Configura lo sreportes internos de las aplicaciones"
pb_2 pb_2
pb_1 pb_1
dw_5 dw_5
st_3 st_3
dw_3 dw_3
dw_2 dw_2
gb_4 gb_4
end type

on tp_1.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_5=create dw_5
this.st_3=create st_3
this.dw_3=create dw_3
this.dw_2=create dw_2
this.gb_4=create gb_4
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_5,&
this.st_3,&
this.dw_3,&
this.dw_2,&
this.gb_4}
end on

on tp_1.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_5)
destroy(this.st_3)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.gb_4)
end on

type pb_2 from picturebutton within tp_1
string tag = "&Nuevo"
integer x = 3232
integer y = 32
integer width = 151
integer height = 132
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;if isnull(dw_3.getitemstring(1,1)) then return
long donde
donde=dw_2.insertrow(0)
dw_2.setitem(donde,'modulo',i_mod_solo)
dw_2.setitem(donde,'clugar',dw_3.getitemstring(1,1))
dw_2.scrolltorow(donde)
dw_2.setfocus()
i_change_interno=true
end event

type pb_1 from picturebutton within tp_1
string tag = "&Guardar"
integer x = 3067
integer y = 32
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_2.update(true,false)=-1 then
	rollback;
	return -1
end if
if isnull(dw_3.getitemstring(1,1)) then return -1 
long j
blob reporte
string crep, clu
clu=dw_3.getitemstring(1,1)
for j=1 to dw_2.rowcount()
	crep=dw_2.getitemstring(j,'cod_rep')
	sqlca.autocommit=true
	if dw_2.getitemstring(j,'reporte')='' or isnull(dw_2.getitemstring(j,'reporte')) then
		update rep_adm set reporte=null where cod_rep=:crep ;
	else
		string reorte
		reorte=dw_2.getitemstring(j,'reporte')
		reporte=blob(dw_2.getitemstring(j,'reporte'))
		updateblob rep_interno set reporte=:reporte where cod_rep=:crep  and  clugar=:clu;
	end if
	sqlca.autocommit=false
	if sqlca.sqlcode=-1 then
		messagebox('Error actualizando rep_interno',sqlca.sqlerrtext)
		rollback;
		return -1
	end if
next
dw_2.resetupdate()
commit;
i_change_interno=false
return 1
end event

type dw_5 from datawindow within tp_1
integer x = 1381
integer y = 24
integer width = 1367
integer height = 140
integer taborder = 40
string title = "none"
string dataobject = "dw_combo_modulos"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,'ASI')
i_mod_solo='ASI'
end event

event itemchanged;if i_change_interno then
	choose case messagebox('Atención','Realizó cambios a los reportes desea guardar los cambios?',question!,yesnocancel!,1)
		case 1
			if pb_2.event clicked()=-1 then 
				settext(getitemstring(1,1))
				setitem(1,1,getitemstring(1,1))
				return 2
			end if
		case 2
			i_change_interno=false
		case 3
			settext(getitemstring(1,1))
			setitem(1,1,getitemstring(1,1))
			return 2
	end choose
end if
accepttext()
i_mod_solo=getitemstring(1,1)
if isnull(dw_3.getitemstring(1,1)) then return
dw_2.retrieve(dw_3.getitemstring(1,1),i_mod_solo)
return 0

end event

type st_3 from statictext within tp_1
integer x = 41
integer y = 16
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within tp_1
integer x = 23
integer y = 64
integer width = 1285
integer height = 108
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if i_change_interno then
	choose case messagebox('Atención','Realizó cambios a los reportes desea guardar los cambios?',question!,yesnocancel!,1)
		case 1
			if pb_2.event clicked()=-1 then 
				settext(getitemstring(1,1))
				setitem(1,1,getitemstring(1,1))
				return 2
			end if
		case 2
			i_change_interno=false
		case 3
			settext(getitemstring(1,1))
			setitem(1,1,getitemstring(1,1))
			return 2
	end choose
end if
accepttext()
dw_5.triggerevent(itemchanged!)
end event

type dw_2 from datawindow within tp_1
integer x = 27
integer y = 244
integer width = 4357
integer height = 1796
integer taborder = 30
string title = "none"
string dataobject = "dw_rep_solo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;string camino,nomarch,carreta
long file
if row<>getrow() then setrow(row)
if dwo.name='b_1' then
	nomarch=getitemstring(getrow(),'camino')
	if isnull(nomarch) then nomarch=''
	camino=nomarch
	if GetFileOpenName("Abrir Reporte", camino, nomarch, "SRD","Reportes (*.SRD),*.SRD",nomarch) = 1 then
		setitem(getrow(),'camino',camino)
		file=fileopen(nomarch,textmode!)
		if file=-1 then
			messagebox('Error', 'No se pudo abrir el archivo')
			return
		end if
		filereadex(file,carreta)
		setitem(getrow(),'fecha_carga',now())
		setitem(getrow(),'reporte',carreta)
		event itemchanged(getrow(),object.reporte,'')
	end if
else
	camino=getitemstring(getrow(),'camino')
	if GetFileSaveName ( 'Guardar reporte como', camino, nomarch , 'SRD' , 'Reportes (*.srd),*.srd' )<=0 then return
	file=fileopen(nomarch,textmode!,write!,lockwrite!,replace!)
	if file=-1 then
		messagebox('Error creando archivo','No se pudo abrir el archivo para escribirlo')
		return
	end if
	filewriteex(file,getitemstring(getrow(),'reporte'))
end if
fileclose(file)
end event

event constructor;this.settransobject(sqlca)
end event

event itemchanged;choose case dwo.name
	case 'reporte'
		uo_datastore dw_temp
		dw_temp=create uo_datastore
		if dw_temp.create(getitemstring(getrow(),'reporte'))=-1 then return
		setitem(getrow(),'tam_papel',dw_temp.describe('datawindow.print.paper.size'))
		setitem(getrow(),'orienta',dw_temp.describe('datawindow.print.orientation'))
		real factor_umed
		choose case dw_temp.describe("datawindow.units")
			case '0'//powerunits
				factor_umed=1/174
			case '1'//pixels
				factor_umed=1/38
			case '2'//pulgadas
				factor_umed=1/395
			case '3'//centimetros
				factor_umed=1/1000
		end choose
		setitem(getrow(),'mar_izq',real(dw_temp.describe('datawindow.print.margin.left'))*factor_umed)
		setitem(getrow(),'mar_der',real(dw_temp.describe('datawindow.print.margin.right'))*factor_umed)
		setitem(getrow(),'mar_sup',real(dw_temp.describe('datawindow.print.margin.top'))*factor_umed)
		setitem(getrow(),'mar_inf',real(dw_temp.describe('datawindow.print.margin.bottom'))*factor_umed)
		setitem(getrow(),'copias',1)
		setitem(getrow(),'tamanyo',100)
		setitem(getrow(),'v_prelim','1')
		setitem(getrow(),'ver_dialogo','0')
		setitem(getrow(),'cambiar_prop','1')
end choose
accepttext()
i_change_interno=true
end event

event retrieveend;long j
blob reporte
string crep,clug
for j=1 to rowcount
	sqlca.autocommit=true
	clug=getitemstring(j,'clugar')
	crep=getitemstring(j,'cod_rep')
	selectblob reporte into :reporte from rep_interno where cod_rep=:crep and clugar=:clug;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo rep_interno',sqlca.sqlerrtext)
		return
	end if
	setitem(j,'reporte',string(reporte))
	sqlca.autocommit=false
next
end event

type gb_4 from groupbox within tp_1
integer y = 176
integer width = 4421
integer height = 1900
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reportes por Módulo:"
borderstyle borderstyle = styleraised!
end type

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4439
integer height = 2108
long backcolor = 67108864
string text = "   De Menús"
long tabtextcolor = 33554432
string picturename = "menu.ico"
long picturemaskcolor = 536870912
string powertiptext = "Configura los reportes que aparecen en los menús reportes de las aplicaciones"
pb_del pb_del
pb_ins pb_ins
pb_3 pb_3
pb_5 pb_5
pb_4 pb_4
dw_4 dw_4
dw_1 dw_1
dw_rep dw_rep
pb_1x pb_1x
pb_2x pb_2x
gb_3 gb_3
gb_1 gb_1
gb_2 gb_2
dw_param dw_param
dw_lista dw_lista
mle_sql mle_sql
dw_confpar dw_confpar
end type

on tp_2.create
this.pb_del=create pb_del
this.pb_ins=create pb_ins
this.pb_3=create pb_3
this.pb_5=create pb_5
this.pb_4=create pb_4
this.dw_4=create dw_4
this.dw_1=create dw_1
this.dw_rep=create dw_rep
this.pb_1x=create pb_1x
this.pb_2x=create pb_2x
this.gb_3=create gb_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_param=create dw_param
this.dw_lista=create dw_lista
this.mle_sql=create mle_sql
this.dw_confpar=create dw_confpar
this.Control[]={this.pb_del,&
this.pb_ins,&
this.pb_3,&
this.pb_5,&
this.pb_4,&
this.dw_4,&
this.dw_1,&
this.dw_rep,&
this.pb_1x,&
this.pb_2x,&
this.gb_3,&
this.gb_1,&
this.gb_2,&
this.dw_param,&
this.dw_lista,&
this.mle_sql,&
this.dw_confpar}
end on

on tp_2.destroy
destroy(this.pb_del)
destroy(this.pb_ins)
destroy(this.pb_3)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.dw_4)
destroy(this.dw_1)
destroy(this.dw_rep)
destroy(this.pb_1x)
destroy(this.pb_2x)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_param)
destroy(this.dw_lista)
destroy(this.mle_sql)
destroy(this.dw_confpar)
end on

type pb_del from picturebutton within tp_2
integer x = 2642
integer y = 1712
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
end type

event clicked;dw_lista.deleterow(0)
long j
for j=1 to dw_lista.rowcount()
	dw_lista.setitem(j,'item',j)
next
i_change_param=true
end event

type pb_ins from picturebutton within tp_2
integer x = 2487
integer y = 1712
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
end type

event clicked;long donde
donde=dw_lista.insertrow(0)
dw_lista.setitem(donde,'cod_rep',i_codrep)
dw_lista.setitem(donde,'nro_param',i_item)
dw_lista.setitem(donde,'item',donde)
dw_lista.setitem(donde,'tipo',i_tipo)
i_change_param=true
end event

type pb_3 from picturebutton within tp_2
string tag = "&Guardar"
integer x = 2738
integer y = 20
integer width = 151
integer height = 132
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
end type

event clicked;if dw_rep.update(true,false)=-1 then
	rollback;
	return -1
end if
long j
blob reporte
string crep
for j=1 to dw_rep.rowcount()
	crep=dw_rep.getitemstring(j,'cod_rep')
	sqlca.autocommit=true
	if dw_rep.getitemstring(j,'reporte')='' or isnull(dw_rep.getitemstring(j,'reporte')) then
		update rep_adm set reporte=null where cod_rep=:crep;
	else
		reporte=blob(dw_rep.getitemstring(j,'reporte'))
		updateblob rep_adm set reporte=:reporte where cod_rep=:crep;
	end if
	sqlca.autocommit=false
	if sqlca.sqlcode=-1 then
		messagebox('Error actualizando ep_adm',sqlca.sqlerrtext)
		rollback;
		return -1
	end if
next
if dw_confpar.update(true,false)=-1 then
	rollback;
	return -1
end if
if dw_lista.update(true,false)=-1 then
	rollback;
	return -1
end if
commit;
dw_rep.resetupdate()
dw_confpar.resetupdate()
dw_lista.resetupdate()
i_change_menu=false
i_change_param=false
pb_4.enabled=true
return 1
end event

type pb_5 from picturebutton within tp_2
string tag = "&Borrar"
integer x = 3067
integer y = 20
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
end type

event clicked;if dw_lista.rowcount()>0 or dw_lista.filteredcount()>0 then
	dw_lista.setfilter("")
	dw_lista.filter()
	do while dw_lista.rowcount()>0 
		dw_lista.deleterow(0)
	loop
	if dw_lista.update()=-1 then
		rollback;
		return
	end if
end if
do while dw_confpar.rowcount()>0 
	dw_confpar.deleterow(0)
loop
if dw_confpar.update()=-1 then
	rollback;
	return
end if
dw_rep.deleterow(0)
if dw_rep.update()=-1 then
	rollback;
	return
end if
commit;
dw_rep.event rowfocuschanged(DW_REP.GETROW())
end event

type pb_4 from picturebutton within tp_2
string tag = "&Nuevo"
integer x = 2898
integer y = 20
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
end type

event clicked;long donde
donde=dw_rep.insertrow(0)
dw_rep.setitem(donde,'modulo',i_modulo)
dw_rep.setitem(donde,'grupousuario',i_grupo)
dw_rep.scrolltorow(donde)
pb_4.enabled=false
dw_rep.setfocus()
end event

type dw_4 from datawindow within tp_2
integer y = 4
integer width = 1385
integer height = 140
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_modulos"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,'ASI')
i_modulo='ASI'
end event

event itemchanged;if i_change_param=true or i_change_menu then
	choose case messagebox('Atención','Realizó cambios a los reportes desea guardar los cambios?',question!,yesnocancel!,1)
		case 1
			if pb_3.event clicked()=-1 then 
				settext(getitemstring(1,1))
				setitem(1,1,getitemstring(1,1))
				return 2
			end if
		case 2
			i_change_menu=false
			i_change_param=false
		case 3
			settext(getitemstring(1,1))
			setitem(1,1,getitemstring(1,1))
			return 2
	end choose
end if
accepttext()
i_modulo=data
dw_1.triggerevent(itemchanged!)
return 0
end event

type dw_1 from datawindow within tp_2
integer x = 1417
integer width = 1138
integer height = 156
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_seggrupo"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if i_change_param=true or i_change_menu then
	choose case messagebox('Atención','Realizó cambios a los reportes desea guardar los cambios?',question!,yesnocancel!,1)
		case 1
			if pb_3.event clicked()=-1 then 
				settext(getitemstring(1,1))
				setitem(1,1,getitemstring(1,1))
				return 2
			end if
		case 2
			i_change_menu=false
			i_change_param=false
		case 3
			settext(getitemstring(1,1))
			setitem(1,1,getitemstring(1,1))
			return 2
	end choose
end if
accepttext()
i_grupo=getitemstring(1,1)
dw_rep.reset()
dw_param.reset()
dw_confpar.reset()
dw_lista.reset()
dw_rep.retrieve(i_modulo,i_grupo)
dw_rep.event rowfocuschanged(dw_rep.getrow())
end event

type dw_rep from datawindow within tp_2
integer x = 46
integer y = 216
integer width = 4329
integer height = 684
integer taborder = 20
string title = "none"
string dataobject = "dw_rep_adm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;string camino,nomarch,carreta
long file
if row<>getrow() then setrow(row)
if dwo.name='b_1' then
	nomarch=getitemstring(getrow(),'camino')
	if isnull(nomarch) then nomarch=''
	camino=nomarch
	if GetFileOpenName("Abrir Reporte", camino, nomarch, "SRD","Reportes (*.SRD),*.SRD",nomarch) = 1 then
		setitem(getrow(),'camino',camino)
		file=fileopen(nomarch,textmode!)
		if file=-1 then
			messagebox('Error', 'No se pudo abrir el archivo')
			return
		end if
		filereadex(file,carreta)
		setitem(getrow(),'reporte',carreta)
		setitem(getrow(),'fecha_carga',now())
		event itemchanged(getrow(),object.reporte,'')
	end if
else
	camino=getitemstring(getrow(),'camino')
	if GetFileSaveName ( 'Guardar reporte como', camino, nomarch , 'SRD' , 'Reportes (*.srd),*.srd' )<=0 then return
	file=fileopen(nomarch,textmode!,write!,lockwrite!,replace!)
	if file=-1 then
		messagebox('Error creando archivo','No se pudo abrir el archivo para escribirlo')
		return
	end if
	filewriteex(file,getitemstring(getrow(),'reporte'))
end if
fileclose(file)
end event

event constructor;this.settransobject(sqlca)
end event

event itemchanged;choose case dwo.name
	case 'reporte'
		if dw_lista.rowcount()>0 or dw_lista.filteredcount()>0 then
			dw_lista.setfilter("")
			dw_lista.filter()
			do while dw_lista.rowcount()>0 
				dw_lista.deleterow(0)
			loop
			if dw_lista.update()=-1 then
				rollback;
				return 1
			end if
		end if
		do while dw_confpar.rowcount()>0 
			dw_confpar.deleterow(0)
		loop
		if dw_confpar.update()=-1 then
			rollback;
			return 1
		end if
		uo_datastore dw_temp
		dw_temp=create uo_datastore
		if dw_temp.create(getitemstring(getrow(),'reporte'))=-1 then return
		real factor_umed
		choose case dw_temp.describe("datawindow.units")
			case '0'//powerunits
				factor_umed=1/174
			case '1'//pixels
				factor_umed=1/38
			case '2'//pulgadas
				factor_umed=1/395
			case '3'//centimetros
				factor_umed=1/1000
		end choose
	//	setitem(getrow(),'tam_papel',dw_temp.describe('datawindow.print.paper.size'))
	//	setitem(getrow(),'orienta',dw_temp.describe('datawindow.print.orientation'))
		setitem(getrow(),'mar_izq',real(dw_temp.describe('datawindow.print.margin.left'))*factor_umed)
		setitem(getrow(),'mar_der',real(dw_temp.describe('datawindow.print.margin.right'))*factor_umed)
		setitem(getrow(),'mar_sup',real(dw_temp.describe('datawindow.print.margin.top'))*factor_umed)
		setitem(getrow(),'mar_inf',real(dw_temp.describe('datawindow.print.margin.bottom'))*factor_umed)
		setitem(getrow(),'copias',1)
	//	setitem(getrow(),'tamanyo',100)
		setitem(getrow(),'cambiar_prop','1')
		triggerevent(rowfocuschanged!)
	case 'cod_rep'
		if dw_lista.rowcount()>0 or dw_lista.filteredcount()>0 then
			setitem(getrow(),'cod_rep',getitemstring(getrow(),'cod_rep'))
			return 1
		end if
		long j
		accepttext()
		i_codrep=getitemstring(getrow(),'cod_rep')
		for j=1 to dw_confpar.rowcount()
			dw_confpar.setitem(j,'cod_rep',i_codrep)
		next
end choose

end event

event rowfocuschanged;long fila
fila=getrow()
if fila<1 THEN Return
i_codrep=getitemstring(getrow(),'cod_rep')
accepttext()
long donde
string carreta,todo
todo=getitemstring(getrow(),'reporte')
donde=pos(todo,"release ",1)
carreta=right(todo, len(todo) - donde +1)
string parametros,sql,sintax,err
if dw_prev.create(carreta)=1 then parametros=dw_prev.describe('datawindow.table.arguments')
long j,k,pos=0,i
string t1,t2,tipo
k=f_count_text(parametros,"	")//tabs
if k>0 then parametros+="~n"
dw_param.reset()
for j=1 to k
	t1=mid(parametros,pos +1,pos(parametros,'	',pos +1) -pos -1)
	pos=pos(parametros,'	',pos +1)
	t2=mid(parametros,pos +1 ,pos(parametros,"~n",pos) - pos -1)
	pos=pos(parametros,"~n",pos)
	dw_param.insertrow(j)
	dw_param.setitem(j,'nombre',t1)
	dw_param.setitem(j,'tipo',t2)
	dw_param.setitem(j,'conf',j)
next
dw_param.triggerevent(rowfocuschanged!)
dw_confpar.reset()
dw_confpar.retrieve(i_codrep)
end event

event retrieveend;long j
blob reporte
string crep
for j=1 to rowcount
	sqlca.autocommit=true
	crep=getitemstring(j,'cod_rep')
	selectblob reporte into :reporte from rep_adm where cod_rep=:crep;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo rep_adm',sqlca.sqlerrtext)
		return
	end if
	setitem(j,'reporte',string(reporte))
	sqlca.autocommit=false
next
end event

event rowfocuschanging;if i_change_param=true then
	choose case messagebox('Atención','Realizó cambios a los parámetros desea guardar?',question!,yesnocancel!,1)
		case 1
			if pb_3.event clicked()=-1 then return 1
			return 0
		case 2
			i_change_param=false
			return 0
		case 3
			return 1
	end choose
end if
end event

type pb_1x from picturebutton within tp_2
integer x = 1230
integer y = 1072
integer width = 110
integer height = 96
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = ">"
boolean originalsize = true
vtextalign vtextalign = vcenter!
string powertiptext = "Configurar Parámetro"
end type

event clicked;if dw_param.rowcount()=0 then return
string tip
tip=dw_param.getitemstring(dw_param.getrow(),'tipo')
if tip='datetime' or tip='date' or tip='time' then
	messagebox("Atención","Los parámetros de tipo fecha/hora no son configurables")
	return
end if
long donde
donde=dw_confpar.find("nro_param="+string(i_item),1,dw_confpar.rowcount())
if donde=0 then
	donde=dw_confpar.insertrow(i_item)
	dw_confpar.setitem(donde,'cod_rep',i_codrep)
	i_item=dw_param.getitemnumber(dw_param.getrow(),'conf')
	dw_confpar.setitem(donde,'nro_param',i_item)
end if
dw_confpar.scrolltorow(donde)
dw_confpar.setfocus()
i_change_param=true

end event

type pb_2x from picturebutton within tp_2
integer x = 1230
integer y = 1176
integer width = 110
integer height = 96
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "<"
boolean originalsize = true
vtextalign vtextalign = vcenter!
string powertiptext = "Borrar Configuración del Parámetro"
end type

event clicked;if dw_confpar.rowcount()=0 then return
if dw_lista.rowcount()>0 then
	do while dw_lista.rowcount()>0 
		dw_lista.deleterow(0)
	loop
	if dw_lista.update()=-1 then
		rollback;
		return
	end if
end if
dw_confpar.deleterow(0)
if dw_confpar.update()=-1 then
	rollback;
	return
end if
commit;

end event

type gb_3 from groupbox within tp_2
integer x = 1376
integer y = 948
integer width = 2981
integer height = 924
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parámetros Configurados:"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within tp_2
integer y = 152
integer width = 4398
integer height = 784
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reportes por Módulo:"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within tp_2
integer x = 5
integer y = 948
integer width = 1367
integer height = 924
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parámetros del Reporte:"
borderstyle borderstyle = styleraised!
end type

type dw_param from datawindow within tp_2
integer x = 18
integer y = 1012
integer width = 1115
integer height = 712
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_param"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;if this.getrow()<1 then return
i_item=this.getitemnumber(this.getrow(),'conf')
choose case this.getitemstring(this.getrow(),'tipo')
	case 'number'
		i_tipo='1'
	case 'string'
		i_tipo='0'
	case 'datetime','date','time'
		i_tipo=''
end choose
end event

type dw_lista from datawindow within tp_2
integer x = 2455
integer y = 1012
integer width = 1723
integer height = 560
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rep_lista"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

type mle_sql from multilineedit within tp_2
boolean visible = false
integer x = 2450
integer y = 1020
integer width = 1682
integer height = 608
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event losefocus;dw_confpar.event rowfocuschanging(dw_confpar.getrow(),dw_confpar.getrow())
end event

event modified;dw_confpar.event rowfocuschanging(dw_confpar.getrow(),dw_confpar.getrow())
i_change_param=true
end event

type dw_confpar from datawindow within tp_2
integer x = 1403
integer y = 1012
integer width = 969
integer height = 628
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rep_deta"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;string nulo
long nnulo
setnull(nulo)
setnull(nnulo)
choose case getcolumn()
	case 3
		accepttext()
		triggerevent(rowfocuschanged!)
	case 5
		if long(data)<1 or long(data)>dw_param.rowcount() then
			settext(nulo)
			setitem(row,5,nnulo)
			return 1
		else
			string tip
			tip=dw_param.getitemstring(long(data),'tipo')
			if tip='datetime' or tip='time' or tip='date' then
				settext(nulo)
				setitem(row,5,nnulo)
				return 1
			end if
		end if
		accepttext()
end choose
i_change_param=true
end event

event retrieveend;if rowcount=0 then
	mle_sql.text=''
	mle_sql.visible=false
	dw_lista.reset()
	dw_lista.visible=false
	pb_ins.visible=false
	pb_del.visible=false
end if
end event

event rowfocuschanged;long fila
fila=this.getrow()
if this.getrow()<1 then return
i_item=this.getitemnumber(fila,'nro_param')
if this.getitemstring(fila,'tipo')='L' then
	dw_lista.retrieve(i_codrep,i_item)
	dw_lista.visible=true
	pb_ins.visible=true
	pb_del.visible=true
	mle_sql.visible=false
else
	mle_sql.visible=true
	mle_sql.text=this.getitemstring(fila,'sql')
	dw_lista.visible=false
	pb_ins.visible=false
	pb_del.visible=false
end if
end event

event rowfocuschanging;this.setitem(currentrow,'sql',mle_sql.text)
end event

