$PBExportHeader$w_solicita.srw
forward
global type w_solicita from window
end type
type rte_1 from richtextedit within w_solicita
end type
type rte_2 from richtextedit within w_solicita
end type
type pb_1 from picturebutton within w_solicita
end type
type st_3 from statictext within w_solicita
end type
type st_2 from statictext within w_solicita
end type
type dp_fin from datepicker within w_solicita
end type
type dp_ini from datepicker within w_solicita
end type
type st_1 from statictext within w_solicita
end type
type ddlb_1 from dropdownlistbox within w_solicita
end type
end forward

global type w_solicita from window
integer width = 3986
integer height = 2340
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Information!"
boolean center = true
rte_1 rte_1
rte_2 rte_2
pb_1 pb_1
st_3 st_3
st_2 st_2
dp_fin dp_fin
dp_ini dp_ini
st_1 st_1
ddlb_1 ddlb_1
end type
global w_solicita w_solicita

type variables
long contador
string clugar_hadm,tingres
datetime fech_ing
end variables

forward prototypes
public subroutine filtra (string p_texto)
public function string lf_encab_agrupa (string p_tipo, long p_contador, string p_clugar, string p_indapdx)
public function string lf_reemp_campos (string p_todo, uo_datastore p_dw)
end prototypes

public subroutine filtra (string p_texto);uo_datastore ds,ds_result
datetime fecha1,fecha2
date fec
ds=create uo_datastore
rte_1.SelectTextAll ( header! )
rte_1.clearall()
rte_1.SelectTextAll ( detail! )
rte_1.clearall()
rte_2.SelectTextAll ( header! )
rte_2.clearall()
rte_2.SelectTextAll ( detail! )
rte_2.clearall()

if g_motor='postgres' then
	ds.dataobject='dr_evol_orde_postgres'
else
	ds.dataobject='dr_evol_orde'
end if
ds.settransobject(sqlca)
ds_result=create uo_datastore
if g_motor='anywhere' then
	ds_result.dataobject='dr_result'
end if
if g_motor='sql' then
	ds_result.dataobject='dr_result_sqlserver'
end if
if g_motor='postgres' then
	ds_result.dataobject='dr_result_psotgres'
end if
ds_result.settransobject(sqlca)

sqlca.autocommit=true
if p_texto='EVOLUCIÓN' then
	st_2.visible=true
	st_3.visible=true
	dp_ini.visible=true
	dp_fin.visible=true
	fec =dp_ini.datevalue 
	fecha1=datetime(date(fec),time('00:00'))
	fec =dp_fin.datevalue
	fecha2=datetime(date(fec),time('23:59'))
	ds.retrieve(contador,clugar_hadm,'E',fecha1,fecha2)
else
	if p_texto='ORDENES MÉDICAS' then
		st_2.visible=true
		st_3.visible=true
		dp_ini.visible=true
		dp_fin.visible=true
		fec =dp_ini.datevalue 
		fecha1=datetime(date(fec),time('00:00'))
		fec =dp_fin.datevalue
		fecha2=datetime(date(fec),time('23:59'))
		ds.retrieve(contador,clugar_hadm,'R',fecha1,fecha2)
		pb_1.visible=true
	else
		fec =dp_fin.datevalue
		fecha2=datetime(date(fec),time('23:59'))
		ds.retrieve(contador,clugar_hadm,'H',fech_ing,fecha2)
		pb_1.visible=true
	end if
end if
sqlca.autocommit=false
if ds.rowcount()>0 then
	rte_1.visible=false
	f_sel_rtf(rte_1)
	rte_1.displayonly=false
	rte_1.clearall()
		
	string p_header,encab_ingreso
	p_header=lf_encab_agrupa('E',0,'','')
	rte_1.pastertf(p_header,header!)//pa que lo haga una sola vez (colocar el encabezado)
	encab_ingreso=lf_encab_agrupa('A',contador,clugar_hadm,tingres)
	f_pega_a_rtf(rte_1,encab_ingreso,2)
		
	if p_texto='EVOLUCIÓN' then
		f_pega_a_rtf(rte_1,'EVOLUCIÓN~r~n',2)
	else
		if p_texto='ORDENES MÉDICAS' then
			f_pega_a_rtf(rte_1,'ORDENES MÉDICAS~r~n',2)
		else
			f_pega_a_rtf(rte_1,'DATOS DE INGRESO~r~n',2)
		end if
	end if
	string objects,cual,coltype,apegar,reemp,encab,tipo_memo,cdoc,clug,cproc,cual2
	datastore ds_objects
	long num_object,largo,k,j,nreg,nrep,item_rep,conscamp
	blob trae
	ds_objects=create datastore 
	ds_objects.dataobject='dw_campos_de_rtfs'
	objects=ds.describe('datawindow.objects')
	num_object=f_count_text(objects,'	')+1
	setpointer(hourglass!)
	for j=1 to num_object
		cual=f_trae_string_num (objects,j,'	')
		coltype=ds.describe(cual+'.coltype')
		if coltype<>'?' then
			ds_objects.insertrow(1)	
			ds_objects.setitem(1,'nombre',cual)
			ds_objects.setitem(1,'tipo',ds.describe(cual+'.type'))
			if left(coltype,4)='char' then
				ds_objects.setitem(1,'coltype','char')
				largo=long(mid(coltype,6,len(coltype) - 6))
				ds_objects.setitem(1,'largo',largo)
			else
				ds_objects.setitem(1,'coltype',coltype)
			end if
		end if
	next
	nreg=0
	for j=1 to ds.rowcount()//filas del sql(hojas del rtf)
		if nreg<>ds.getitemnumber(j,'nregistro') then
			encab='~r~n'+string(ds.getitemdatetime(j,'fecha_reg'),'dd/mm/yyyy hh:mm')+': '
			encab+=ds.getitemstring(j,'desprof')+' ('+ds.getitemstring(j,'desesp')+')'+'~r~n'
			f_pega_a_rtf(rte_1,encab,2)
			nreg=ds.getitemnumber(j,'nregistro')
			setnull(encab)
		end if
		item_rep=ds.getitemnumber(j,'item')
		ds.setrow(j)
		GARBAGECOLLECT()
		f_pega_a_rtf(rte_1,ds.copyrtf(false,detail!),2)
		if ds.getitemstring(j,'tipo')='M' and ds.getitemstring(j,'tipo_memo')='R' then
			if ds_result.retrieve(contador ,clugar_hadm ,nreg ,item_rep,fecha1,fecha2)>0 then gf_pasar_result_rtf(ds_result,rte_1)
		end if
		for k=1 to ds_objects.rowcount()	
			cual=ds_objects.getitemstring(k,'nombre')
			cual2=ds_objects.getitemstring(k,'tipo')
			reemp=rte_1.InputFieldLocate ( first! , cual )
			do while reemp<>'' and reemp=cual
				rte_1.InputFieldDeleteCurrent ( )
				choose case ds_objects.getitemstring(k,'tipo')
					case 'column','compute'
						choose case ds_objects.getitemstring(k,'coltype')
							case 'char'
								if ds_objects.getitemnumber(k,'largo')>255 then
									sqlca.autocommit=true
									selectblob long_texto into :trae from hclin_reg_valor 
									where contador=:contador and clugar=:clugar_hadm and nregistro=:nreg and item=:item_rep;
									sqlca.autocommit=false
									if sqlca.sqlcode=-1 then
										messagebox('Error leyendo plantillas',sqlca.sqlerrtext)
									end if
									apegar=string(trae)
									setnull(trae)
								else//es menor a 255
									apegar=ds.getitemstring(j,cual)
								end if
							case 'long','number','real'
								long ojo
								ojo=ds.getitemnumber(j,cual)
								apegar=string(ojo)
							case 'decimal(2)'
								apegar=string(ds.getitemdecimal(j,cual))
							case 'datetime'
								apegar=string(ds.getitemdatetime(j,cual))
							case 'date'
								apegar=string(ds.getitemdate(j,cual))
							case 'time'
								apegar=string(ds.getitemtime(j,cual))
						end choose
				end choose
				if isnull(apegar) then apegar=''
				f_pega_a_rtf(rte_1,apegar ,1)
				reemp=rte_1.InputFieldLocate ( next! , cual )
				setnull(apegar)
			loop
		next//objeto por objeto para irlo quitando
		if j=ds.rowcount() then f_pega_a_rtf(rte_1,'~r~n',2)
	next//las filas del sql
	rte_1.visible=true
else
	f_sel_rtf(rte_1)
	rte_1.displayonly=false
	rte_1.clearall()
	rte_1.displayonly=true
end if
destroy ds_objects
destroy ds_result
end subroutine

public function string lf_encab_agrupa (string p_tipo, long p_contador, string p_clugar, string p_indapdx);blob formato
date l_fec 
datetime l_fecha2
uo_datastore dw
dw=create uo_datastore
sqlca.autocommit=true
choose case p_tipo
	case 'E'//encabezado
		selectblob encab_historia into :formato from lugar where codlugar=:clugar;
		if sqlca.sqlcode=-1 then
			messagebox('Error leyendo encabezados',sqlca.sqlerrtext)
		end if
		dw.dataobject='dw_encab_histo'
		dw.settransobject(sqlca)
		l_fec =dp_fin.datevalue
		l_fecha2=datetime(date(l_fec),time('23:59'))
		dw.retrieve(tipdoc,docu,l_fecha2)
	case 'A'//agrupamiento del ingreso
		selectblob agrupa_historia into :formato from tipoingreso where codtingre=:p_indapdx;
		dw.dataobject='dw_agrupa_ing_hc'
		dw.settransobject(sqlca)
		dw.retrieve(p_contador,p_clugar)
end choose
sqlca.autocommit=false
return lf_reemp_campos(string(formato),dw)

end function

public function string lf_reemp_campos (string p_todo, uo_datastore p_dw);long num_object,largo,k,numeroingreso,j
string objects,cual,coltype,reemp,apegar,clug
blob trae

datastore ds_objects
ds_objects=create datastore
ds_objects.dataobject='dw_campos_de_rtfs'
num_object=f_objects_ds(p_dw,ds_objects)
f_sel_rtf(rte_2)
rte_2.clearall()
f_sel_rtf(rte_2)
rte_2.clearall()
for j=1 to p_dw.rowcount()
	p_dw.setrow(j)
	f_pega_a_rtf(rte_2,p_todo,2)
	for k=1 to ds_objects.rowcount()
		cual=ds_objects.getitemstring(k,'nombre')
		reemp=rte_2.InputFieldLocate ( first! , cual )
		do while reemp<>'' and reemp=cual
			rte_2.InputFieldDeleteCurrent ( )
			choose case ds_objects.getitemstring(k,'tipo')
				case 'column','compute'
					choose case ds_objects.getitemstring(k,'coltype')
						case 'char'
							if ds_objects.getitemnumber(k,'largo')>255 then
								choose case lower(cual)
									case 'notas_ane'
										numeroingreso=p_dw.getitemnumber(j,'numero_ingre')
										clug=p_dw.getitemstring(1,'clugar')
										sqlca.autocommit=true
										selectblob notas_ane into :trae from qxcabacto where numero_ingre=:numeroingreso and clugar=:clug;
										sqlca.autocommit=false
									case 'notasqx'
										numeroingreso=p_dw.getitemnumber(j,'numero_ingre')
										clug=p_dw.getitemstring(1,'clugar')
										sqlca.autocommit=true
										selectblob notasqx into :trae from qxcabacto where numero_ingre=:numeroingreso and clugar=:clug;
										sqlca.autocommit=false
									end choose
											apegar=string(trae)
							else//es menor a 255
								apegar=p_dw.getitemstring(j,cual)
							end if
						case 'long','number','real'
							long ojo
							ojo=p_dw.getitemnumber(j,cual)
							apegar=string(ojo)
						case 'decimal'
							apegar=string(p_dw.getitemdecimal(j,cual))
						case 'datetime'
							choose case cual
								case 'fechainicio','fechafin', 'fecha_nace'
									apegar=string(p_dw.getitemdatetime(j,cual),'dd/mm/yyyy')
								case 'horainicio','horafin'
									apegar=string(p_dw.getitemdatetime(j,cual),'HH:mm')
								case else
									apegar=string(p_dw.getitemdatetime(j,cual))
							end choose
						case 'date'
							apegar=string(p_dw.getitemdate(j,cual))
						case 'time'
							apegar=string(p_dw.getitemtime(j,cual))
					end choose
			end choose
			if isnull(apegar) then apegar=''
			f_pega_a_rtf(rte_2,apegar,1)
			reemp=rte_2.InputFieldLocate ( next! , cual )
			setnull(apegar)
		loop
	next
next
destroy ds_objects
reemp=rte_2.copyrtf(false,header!)
return reemp
end function

on w_solicita.create
this.rte_1=create rte_1
this.rte_2=create rte_2
this.pb_1=create pb_1
this.st_3=create st_3
this.st_2=create st_2
this.dp_fin=create dp_fin
this.dp_ini=create dp_ini
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.Control[]={this.rte_1,&
this.rte_2,&
this.pb_1,&
this.st_3,&
this.st_2,&
this.dp_fin,&
this.dp_ini,&
this.st_1,&
this.ddlb_1}
end on

on w_solicita.destroy
destroy(this.rte_1)
destroy(this.rte_2)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dp_fin)
destroy(this.dp_ini)
destroy(this.st_1)
destroy(this.ddlb_1)
end on

event open; this.y=1
contador=w_new_at_os.dw_historial.getitemnumber(w_new_at_os.dw_historial.getrow(),"contador")
clugar_hadm=w_new_at_os.dw_historial.getitemstring(w_new_at_os.dw_historial.getrow(),"clugar")
tingres=w_new_at_os.dw_historial.getitemstring(w_new_at_os.dw_historial.getrow(),"codtingre")
fech_ing=w_new_at_os.dw_historial.getitemdatetime(w_new_at_os.dw_historial.getrow(),"fechaingreso")


end event

event resize;//long alt,anch
//anch=this.height - 15
//alt=this.height - 15
//rte_1.width=anch
//rte_1.height=alt
end event

event close;sqlca.autocommit=false
end event

type rte_1 from richtextedit within w_solicita
integer x = 37
integer y = 156
integer width = 3904
integer height = 2056
integer taborder = 50
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
long init_leftmargin = 2000
long init_topmargin = 1000
long init_rightmargin = 1000
long init_bottommargin = 1000
end type

type rte_2 from richtextedit within w_solicita
boolean visible = false
integer x = 2994
integer y = 20
integer width = 343
integer height = 60
integer taborder = 40
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_solicita
string tag = "&Imprimir"
integer x = 1339
integer y = 8
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = right!
end type

event clicked;rte_1.print(1,'',true,true)
end event

type st_3 from statictext within w_solicita
boolean visible = false
integer x = 2354
integer y = 36
integer width = 187
integer height = 68
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta el"
boolean focusrectangle = false
end type

type st_2 from statictext within w_solicita
boolean visible = false
integer x = 1691
integer y = 36
integer width = 224
integer height = 68
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde el"
boolean focusrectangle = false
end type

type dp_fin from datepicker within w_solicita
boolean visible = false
integer x = 2537
integer y = 12
integer width = 407
integer height = 100
integer taborder = 50
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2023-01-30"), Time("11:48:25.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtra(ddlb_1.text)
end event

type dp_ini from datepicker within w_solicita
boolean visible = false
integer x = 1929
integer y = 12
integer width = 379
integer height = 100
integer taborder = 40
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2023-01-30"), Time("11:48:25.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtra(ddlb_1.text)
end event

type st_1 from statictext within w_solicita
integer x = 23
integer y = 12
integer width = 558
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Información a desplegar:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_solicita
integer x = 590
integer y = 16
integer width = 608
integer height = 324
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"INGRESO","ORDENES MÉDICAS","EVOLUCIÓN"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;filtra(this.text)

end event

