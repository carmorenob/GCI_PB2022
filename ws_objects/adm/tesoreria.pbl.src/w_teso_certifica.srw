$PBExportHeader$w_teso_certifica.srw
forward
global type w_teso_certifica from window
end type
type tb_1 from tab within w_teso_certifica
end type
type tp1_1 from userobject within tb_1
end type
type pb_5 from picturebutton within tp1_1
end type
type pb_print from pb_report within tp1_1
end type
type st_5 from statictext within tp1_1
end type
type dw_1 from datawindow within tp1_1
end type
type pb_traer from picturebutton within tp1_1
end type
type pb_save from picturebutton within tp1_1
end type
type pb_anula from picturebutton within tp1_1
end type
type pb_new from picturebutton within tp1_1
end type
type dw_items from datawindow within tp1_1
end type
type dw_deta from datawindow within tp1_1
end type
type dw_histo from datawindow within tp1_1
end type
type dw_esco from datawindow within tp1_1
end type
type tp1_1 from userobject within tb_1
pb_5 pb_5
pb_print pb_print
st_5 st_5
dw_1 dw_1
pb_traer pb_traer
pb_save pb_save
pb_anula pb_anula
pb_new pb_new
dw_items dw_items
dw_deta dw_deta
dw_histo dw_histo
dw_esco dw_esco
end type
type tp1_2 from userobject within tb_1
end type
type tab_2 from tab within tp1_2
end type
type tb2 from userobject within tab_2
end type
type pb_4 from picturebutton within tb2
end type
type pb_3 from picturebutton within tb2
end type
type dw_item_deta from datawindow within tb2
end type
type pb_2 from picturebutton within tb2
end type
type pb_1 from picturebutton within tb2
end type
type dw_item from datawindow within tb2
end type
type tb2 from userobject within tab_2
pb_4 pb_4
pb_3 pb_3
dw_item_deta dw_item_deta
pb_2 pb_2
pb_1 pb_1
dw_item dw_item
end type
type tab_2 from tab within tp1_2
tb2 tb2
end type
type pb_save_rep from picturebutton within tp1_2
end type
type pb_del_rep from picturebutton within tp1_2
end type
type pb_new_rep from picturebutton within tp1_2
end type
type st_1 from statictext within tp1_2
end type
type dw_reps from datawindow within tp1_2
end type
type tp1_2 from userobject within tb_1
tab_2 tab_2
pb_save_rep pb_save_rep
pb_del_rep pb_del_rep
pb_new_rep pb_new_rep
st_1 st_1
dw_reps dw_reps
end type
type tb_1 from tab within w_teso_certifica
tp1_1 tp1_1
tp1_2 tp1_2
end type
end forward

global type w_teso_certifica from window
integer width = 3913
integer height = 2420
boolean titlebar = true
string title = "Certificados de Retenciones"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_certifica.ico"
tb_1 tb_1
end type
global w_teso_certifica w_teso_certifica

type variables
string i_crep
long i_nrep
boolean i_nuevo
end variables

on w_teso_certifica.create
this.tb_1=create tb_1
this.Control[]={this.tb_1}
end on

on w_teso_certifica.destroy
destroy(this.tb_1)
end on

event open;tb_1.tp1_2.dw_reps.retrieve()
end event

type tb_1 from tab within w_teso_certifica
integer x = 37
integer y = 28
integer width = 3817
integer height = 2228
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp1_1 tp1_1
tp1_2 tp1_2
end type

on tb_1.create
this.tp1_1=create tp1_1
this.tp1_2=create tp1_2
this.Control[]={this.tp1_1,&
this.tp1_2}
end on

on tb_1.destroy
destroy(this.tp1_1)
destroy(this.tp1_2)
end on

type tp1_1 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 3781
integer height = 2100
long backcolor = 67108864
string text = "Emisión"
long tabtextcolor = 33554432
string picturename = "conf_imp.ico"
long picturemaskcolor = 536870912
string powertiptext = "Genera nuevos certificados"
pb_5 pb_5
pb_print pb_print
st_5 st_5
dw_1 dw_1
pb_traer pb_traer
pb_save pb_save
pb_anula pb_anula
pb_new pb_new
dw_items dw_items
dw_deta dw_deta
dw_histo dw_histo
dw_esco dw_esco
end type

on tp1_1.create
this.pb_5=create pb_5
this.pb_print=create pb_print
this.st_5=create st_5
this.dw_1=create dw_1
this.pb_traer=create pb_traer
this.pb_save=create pb_save
this.pb_anula=create pb_anula
this.pb_new=create pb_new
this.dw_items=create dw_items
this.dw_deta=create dw_deta
this.dw_histo=create dw_histo
this.dw_esco=create dw_esco
this.Control[]={this.pb_5,&
this.pb_print,&
this.st_5,&
this.dw_1,&
this.pb_traer,&
this.pb_save,&
this.pb_anula,&
this.pb_new,&
this.dw_items,&
this.dw_deta,&
this.dw_histo,&
this.dw_esco}
end on

on tp1_1.destroy
destroy(this.pb_5)
destroy(this.pb_print)
destroy(this.st_5)
destroy(this.dw_1)
destroy(this.pb_traer)
destroy(this.pb_save)
destroy(this.pb_anula)
destroy(this.pb_new)
destroy(this.dw_items)
destroy(this.dw_deta)
destroy(this.dw_histo)
destroy(this.dw_esco)
end on

type pb_5 from picturebutton within tp1_1
integer x = 2322
integer y = 16
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
string picturename = "lupa.gif"
string powertiptext = "Busca Certificados"
end type

event clicked;st_xa_elegir cual
int ll
openwithparm(w_busca_cert,cual)
cual=message.powerobjectparm
if not isValid(cual) then return
dw_esco.setitem(1,1,cual.titulo)
dw_histo.retrieve(cual.titulo)
ll=dw_histo.Find("nro_rep="+string(cual.ancho), 1, dw_histo.rowcount())
dw_histo.ScrollToRow(ll)
dw_deta.retrieve(cual.titulo,cual.ancho)
dw_items.retrieve(cual.titulo,cual.ancho)
end event

type pb_print from pb_report within tp1_1
integer x = 1851
integer y = 16
integer taborder = 40
string nombre_rep = "Reporte de Retenciones"
string tipo_rep = "retencion!"
boolean v_preliminar = true
end type

event clicked;call super::clicked;if dw_deta.rowcount()=0 then return
if not isnull(dw_deta.getitemstring(1,'estado')) then 
	messagebox('Atención','Este reporte está anulado')
	return
end if
if inicia('retencion!',i_crep,clugar)=-1 then return
any par[2]
par[1]=i_crep
par[2]=dw_deta.getitemnumber(1,'nro_rep')
imprimir(par,'','0')
end event

type st_5 from statictext within tp1_1
integer x = 41
integer y = 1380
integer width = 494
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impuestos a reportar:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within tp1_1
boolean visible = false
integer x = 3424
integer y = 12
integer width = 242
integer height = 132
integer taborder = 60
string title = "none"
string dataobject = "dw_trae_retes"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;settransobject(sqlca)
end event

type pb_traer from picturebutton within tp1_1
integer x = 2011
integer y = 16
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
string powertiptext = "Traer datos"
end type

event clicked;if dw_deta.rowcount()=0 then return
if dw_deta.accepttext()=-1 then return
datetime fecha1,fecha2
string tdoc,ls_docu
tdoc=dw_deta.getitemstring(1,'tipodoc')
ls_docu=dw_deta.getitemstring(1,'documento')
if isnull(tdoc) or isnull(ls_docu) or tdoc='' or ls_docu='' then return
fecha1=datetime(date(dw_deta.getitemdatetime(1,'desde')),time('00:00:00'))
fecha2=datetime(date(dw_deta.getitemdatetime(1,'hasta')),time('23:59:59'))
dw_items.reset()
if dw_1.retrieve(i_crep,tdoc,ls_docu,fecha1,fecha2)>0 then
	dw_1.rowscopy(1,dw_1.rowcount(),primary!,dw_items,1,primary!)
end if
end event

type pb_save from picturebutton within tp1_1
integer x = 2167
integer y = 16
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
string powertiptext = "Guardar e imprimir reporte"
end type

event clicked;if not i_nuevo then return
if dw_items.rowcount()=0 then return
long nrep,j
string err
select nactual into :nrep from teso_rep_rete_cb where cod_rep=:i_crep;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo teso_rep_rete_cb",sqlca.sqlerrtext)
	return
end if
if isnull(nrep) then nrep=0
nrep ++
dw_deta.setitem(1,'nro_rep',nrep)
dw_deta.setitem(1,'valor_rep',dw_items.getitemnumber(1,'total'))
if dw_deta.update(true,false)=-1 then return
for j=1 to dw_items.rowcount()
	//if ( (dw_items.getitemdecimal(j,'valor') -dw_items.getitemdecimal(j,'diferencia'))=0 ) then dw_items.deleterow(j)
	dw_items.setitem(j,'nro_rep',nrep)
	dw_items.setitem(j,'rep_item',j)
next
if dw_items.update(true,false)=-1 then return
update teso_rep_rete_cb set nactual = :nrep where cod_rep=:i_crep and nactual= :nrep -1;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error actualizando nactual en teso_rep_rete_cb',err)
	return
end if
commit;
pb_new.enabled=true
pb_traer.enabled=false
i_nuevo=false
dw_deta.resetupdate()
dw_items.resetupdate()
dw_histo.reset()
dw_histo.retrieve(i_crep)
dw_histo.scrolltorow(dw_histo.find('nro_rep='+string(nrep),1,dw_histo.rowcount()))
pb_print.event clicked()
end event

type pb_anula from picturebutton within tp1_1
integer x = 1696
integer y = 16
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
string picturename = "borrar_fila.gif"
string powertiptext = "Anular Reporte"
end type

event clicked;st_xa_anular st_anula

if i_nuevo then return
st_anula.tipo='CT'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
dw_deta.setitem(1,'estado',usuario)
dw_deta.setitem(1,'fecha_anula',datetime(today(),now()))
dw_deta.setitem(1,'motiv_anula',st_anula.observacion)
dw_deta.setitem(1,'cod_anula',st_anula.motivo)

if dw_deta.update()=-1 then 
	dw_histo.event rowfocuschanged(dw_histo.getrow())
	return
end if
commit;
dw_histo.setitem(dw_histo.getrow(),'estado',usuario)
end event

type pb_new from picturebutton within tp1_1
integer x = 1541
integer y = 16
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Nuevo reporte"
end type

event clicked;if isnull(dw_esco.getitemstring(1,1)) then return
dw_deta.reset()
dw_items.reset()
dw_deta.insertrow(1)
dw_deta.setitem(1,'fecha',datetime(today(),now()))
dw_deta.setitem(1,'cod_rep',i_crep)
dw_deta.setitem(1,'desde',datetime(date(year(today()),1,1)))
dw_deta.setitem(1,'hasta',datetime(today()))
dw_deta.setitem(1,'usuario',usuario)
pb_traer.enabled=true
i_nuevo=true
enabled=false
end event

type dw_items from datawindow within tp1_1
integer x = 41
integer y = 1440
integer width = 3694
integer height = 596
integer taborder = 70
string title = "none"
string dataobject = "dw_teso_rep_rete_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

type dw_deta from datawindow within tp1_1
integer x = 59
integer y = 196
integer width = 3721
integer height = 372
integer taborder = 30
string title = "none"
string dataobject = "dw_tes_rep_rete_cab"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;string columna
columna=getcolumnname() 
if columna="tipodoc" or columna="documento" then 
	g_tercerodesde=11
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		triggerevent(itemchanged!)
	end if
end if
end event

event itemchanged;long donde
donde=1
string nulo
setnull(nulo)
choose case getcolumnname()
	case "tipodoc"
		setitem(donde,"documento",nulo)
		accepttext()
		dw_items.reset()
	case "documento"
		string tdoc,doc,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(donde,"tipodoc")
		if isnull(tdoc) then
			setnull(nulo)
			setitem(donde,"documento",nulo)
			setitem(donde,"dverificacion",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=gettext()
		setnull(persona)
		SELECT TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, 
			TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :persona,:nom1,:nom2,:ape1,:ape2,:rsoc
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
			setitem(donde,"nombre1",nom1)
			setitem(donde,"nombre2",nom2)
			setitem(donde,"apellido1",ape1)
			setitem(donde,"apellido2",ape2)
			setitem(donde,"razon_social",rsoc)
			setitem(donde,"persona",persona)
		end if
		dw_items.reset()
end choose
end event

event dberror;rollback;
return 0
end event

type dw_histo from datawindow within tp1_1
integer x = 50
integer y = 632
integer width = 3703
integer height = 676
integer taborder = 30
string title = "none"
string dataobject = "dw_tes_rep_cp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;dw_deta.reset()
dw_items.reset()
if getrow()<1 then return
i_nrep=getitemnumber(getrow(),'nro_rep')
dw_deta.retrieve(i_crep,i_nrep)
dw_items.retrieve(i_crep,i_nrep)
end event

event rowfocuschanging;if i_nuevo then return 1
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type dw_esco from datawindow within tp1_1
integer x = 18
integer width = 1463
integer height = 140
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_rep_cab"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if i_nuevo then
	setitem(1,1,getitemstring(1,1))
	settext(getitemstring(1,1))
	return 1
end if
accepttext()
dw_histo.reset()
i_crep=data
if pb_print.inicia('retencion!',i_crep,clugar)=-1 then pb_print.enabled=false
dw_histo.retrieve(i_crep)
pb_print.enabled=true
end event

type tp1_2 from userobject within tb_1
integer x = 18
integer y = 112
integer width = 3781
integer height = 2100
long backcolor = 67108864
string text = "Parametrización"
long tabtextcolor = 33554432
string picturename = "ajuste1.ico"
long picturemaskcolor = 536870912
string powertiptext = "Configura los reportes a imprimir"
tab_2 tab_2
pb_save_rep pb_save_rep
pb_del_rep pb_del_rep
pb_new_rep pb_new_rep
st_1 st_1
dw_reps dw_reps
end type

on tp1_2.create
this.tab_2=create tab_2
this.pb_save_rep=create pb_save_rep
this.pb_del_rep=create pb_del_rep
this.pb_new_rep=create pb_new_rep
this.st_1=create st_1
this.dw_reps=create dw_reps
this.Control[]={this.tab_2,&
this.pb_save_rep,&
this.pb_del_rep,&
this.pb_new_rep,&
this.st_1,&
this.dw_reps}
end on

on tp1_2.destroy
destroy(this.tab_2)
destroy(this.pb_save_rep)
destroy(this.pb_del_rep)
destroy(this.pb_new_rep)
destroy(this.st_1)
destroy(this.dw_reps)
end on

type tab_2 from tab within tp1_2
integer x = 23
integer y = 708
integer width = 3726
integer height = 1380
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tb2 tb2
end type

on tab_2.create
this.tb2=create tb2
this.Control[]={this.tb2}
end on

on tab_2.destroy
destroy(this.tb2)
end on

type tb2 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 3689
integer height = 1252
long backcolor = 67108864
string text = "Modelo"
long tabtextcolor = 33554432
string picturename = "notas_adm.ico"
long picturemaskcolor = 536870912
string powertiptext = "Ingresos & Deducciones"
pb_4 pb_4
pb_3 pb_3
dw_item_deta dw_item_deta
pb_2 pb_2
pb_1 pb_1
dw_item dw_item
end type

on tb2.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.dw_item_deta=create dw_item_deta
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_item=create dw_item
this.Control[]={this.pb_4,&
this.pb_3,&
this.dw_item_deta,&
this.pb_2,&
this.pb_1,&
this.dw_item}
end on

on tb2.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.dw_item_deta)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_item)
end on

type pb_4 from picturebutton within tb2
integer x = 3529
integer y = 848
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Borras Concepto"
end type

type pb_3 from picturebutton within tb2
integer x = 3525
integer y = 700
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Inserta Concepto"
end type

event clicked;double maxi
maxi=dw_item_deta.getitemnumber(1,'maximos')
if isnull(maxi) then maxi=0
maxi++

dw_item_deta.insertrow(1)
dw_item_deta.setitem(1,'cod_rep',tb_1.tp1_2.dw_reps.getitemstring(tb_1.tp1_2.dw_reps.getrow(),'cod_rep'))
dw_item_deta.setitem(1,'item',tb_1.tp1_2.tab_2.tb2.dw_item.getitemnumber(tb_1.tp1_2.tab_2.tb2.dw_item.getrow(),'item'))
dw_item_deta.setitem(1,'subitem',maxi)
dw_item_deta.scrolltorow(1)
dw_item_deta.setfocus()
end event

type dw_item_deta from datawindow within tb2
integer x = 23
integer y = 692
integer width = 3465
integer height = 552
integer taborder = 80
string title = "none"
string dataobject = "dw_teso_rep_rete_items_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

type pb_2 from picturebutton within tb2
integer x = 3529
integer y = 176
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Elimina Registro"
end type

type pb_1 from picturebutton within tb2
integer x = 3529
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Inserta Registro"
end type

event clicked;double maxi
maxi=dw_item.getitemnumber(1,'maximos')
if isnull(maxi) then maxi=0
maxi++

dw_item.insertrow(1)
dw_item.setitem(1,'cod_rep',tb_1.tp1_2.dw_reps.getitemstring(tb_1.tp1_2.dw_reps.getrow(),'cod_rep'))
dw_item.setitem(1,'item',maxi)
dw_item.scrolltorow(1)
dw_item.setfocus()
end event

type dw_item from datawindow within tb2
integer x = 18
integer y = 28
integer width = 3488
integer height = 636
integer taborder = 20
string title = "none"
string dataobject = "dw_teso_rep_rete_items_new"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;if getrow()<1 then return
tb_1.tp1_2.tab_2.tb2.dw_item_deta.retrieve(getitemstring(getrow(),'cod_rep'),getitemnumber(getrow(),'item'))
end event

type pb_save_rep from picturebutton within tp1_2
integer x = 3575
integer y = 360
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Reporte"
end type

event clicked;if dw_reps.accepttext()=-1 then return
if dw_reps.update(true,false)=-1 then return //el rollback está en dberror
if tb_1.tp1_2.tab_2.tb2.dw_item.update(true,false)=-1 then return
if tb_1.tp1_2.tab_2.tb2.dw_item_deta.update(true,false)=-1 then return
long j
blob reporte
string crep
for j=1 to dw_reps.rowcount()
	crep=dw_reps.getitemstring(j,'cod_rep')
	sqlca.autocommit=true
	if dw_reps.getitemstring(j,'reporte')='' or isnull(dw_reps.getitemstring(j,'reporte')) then
		update teso_rep_rete_cb set reporte=null where cod_rep=:crep;
	else
		reporte=blob(dw_reps.getitemstring(j,'reporte'))
		updateblob teso_rep_rete_cb set reporte=:reporte where cod_rep=:crep;
	end if
	sqlca.autocommit=false
	if sqlca.sqlcode=-1 then
		messagebox('Error actualizando teso_rep_rete_cb',sqlca.sqlerrtext)
		rollback;
		return -1
	end if
next

commit;
dw_reps.resetupdate()

end event

type pb_del_rep from picturebutton within tp1_2
integer x = 3575
integer y = 228
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Reporte"
end type

type pb_new_rep from picturebutton within tp1_2
integer x = 3575
integer y = 92
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo reporte"
end type

event clicked;dw_reps.insertrow(1)
dw_reps.scrolltorow(1)
dw_reps.setfocus()
end event

type st_1 from statictext within tp1_2
integer x = 9
integer y = 20
integer width = 535
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reportes Configurados:"
boolean focusrectangle = false
end type

type dw_reps from datawindow within tp1_2
integer x = 9
integer y = 80
integer width = 3534
integer height = 608
integer taborder = 10
string title = "none"
string dataobject = "dw_tes_rep_cb"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanging;if getrow()<1 then return
if describe("evaluate('isrownew()',"+string(currentrow)+")")='true' then return 1
end event

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;tb_1.tp1_2.tab_2.tb2.dw_item.reset()
if getrow()<1 then return
tb_1.tp1_2.tab_2.tb2.dw_item.retrieve(getitemstring(getrow(),'cod_rep'))

end event

event dberror;rollback;
end event

event retrieveend;long j
blob reporte
string crep,clug
for j=1 to rowcount
	sqlca.autocommit=true
	crep=getitemstring(j,'cod_rep')
	selectblob reporte into :reporte from teso_rep_rete_cb where cod_rep=:crep;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo rep_interno',sqlca.sqlerrtext)
		return
	end if
	setitem(j,'reporte',string(reporte))
	sqlca.autocommit=false
next
end event

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

