$PBExportHeader$w_reporte_gral.srw
forward
global type w_reporte_gral from window
end type
type pb_6 from picturebutton within w_reporte_gral
end type
type pb_3 from picturebutton within w_reporte_gral
end type
type pb_5 from picturebutton within w_reporte_gral
end type
type pb_help from picturebutton within w_reporte_gral
end type
type cbx_2 from checkbox within w_reporte_gral
end type
type sle_1 from statictext within w_reporte_gral
end type
type st_7 from statictext within w_reporte_gral
end type
type pb_retri from picturebutton within w_reporte_gral
end type
type pb_2 from picturebutton within w_reporte_gral
end type
type pb_1 from picturebutton within w_reporte_gral
end type
type em_3 from editmask within w_reporte_gral
end type
type em_2 from editmask within w_reporte_gral
end type
type em_1 from editmask within w_reporte_gral
end type
type st_5 from statictext within w_reporte_gral
end type
type st_4 from statictext within w_reporte_gral
end type
type st_3 from statictext within w_reporte_gral
end type
type st_2 from statictext within w_reporte_gral
end type
type sle_4 from singlelineedit within w_reporte_gral
end type
type cbx_1 from checkbox within w_reporte_gral
end type
type st_1 from statictext within w_reporte_gral
end type
type st_6 from statictext within w_reporte_gral
end type
type gb_1 from groupbox within w_reporte_gral
end type
type rte2 from richtextedit within w_reporte_gral
end type
type rte from richtextedit within w_reporte_gral
end type
type dw_temp from datawindow within w_reporte_gral
end type
type rte_1 from richtextedit within w_reporte_gral
end type
type dw_rte from datawindow within w_reporte_gral
end type
type dw_rep from datawindow within w_reporte_gral
end type
end forward

global type w_reporte_gral from window
integer width = 3927
integer height = 2224
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "graph9.ico"
string pointer = "Arrow!"
boolean center = true
integer animationtime = 50
event colocapagin pbm_open
event inicialize pbm_open
event p_pinta ( )
pb_6 pb_6
pb_3 pb_3
pb_5 pb_5
pb_help pb_help
cbx_2 cbx_2
sle_1 sle_1
st_7 st_7
pb_retri pb_retri
pb_2 pb_2
pb_1 pb_1
em_3 em_3
em_2 em_2
em_1 em_1
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
sle_4 sle_4
cbx_1 cbx_1
st_1 st_1
st_6 st_6
gb_1 gb_1
rte2 rte2
rte rte
dw_temp dw_temp
rte_1 rte_1
dw_rte dw_rte
dw_rep dw_rep
end type
global w_reporte_gral w_reporte_gral

type variables
string i_desarch,i_tipodw
uo_param i_param[]//los objectos de parametros del reporte
menu i_menuexport
uo_report pb_rep
st_xa_print_histo i_st
boolean ibn_reset_before_retrieve=false
end variables

forward prototypes
public subroutine colocapagin ()
public function integer inicialize (string p_tipo, string p_rep_docu, string p_descrip)
public function integer crear_parametros ()
public function string inicia_por_tipo ()
public function integer pasar_a_rtf ()
public function integer pasar_rtf_dw (integer p_donde)
public subroutine f_filtrar (integer cual, string p_tipo, string p_dato)
public function integer pasar_a_rtf (st_xa_print_histo p_param)
public function integer wf_imprime_historia (datawindow adw_registros, string as_tipo_impre)
end prototypes

event p_pinta();setredraw(true)
end event

public subroutine colocapagin ();if i_tipodw='7' then
	sle_1.text=string(rte.pagecount())+' Pags.'
	return
end if
string bb
bb = dw_rep.Describe("DataWindow.FirstRowOnPage")
if bb="!" then return
if dw_rep.rowcount() < 1 then return
st_6.text="Pag Horizontal~n~r " + dw_rep.describe("Evaluate('PageAcross()', 0)") + " de "+dw_rep.describe("Evaluate('pagecountAcross()', 0)")
sle_1.text=dw_rep.describe("Evaluate('page()', 0)") + "/" + dw_rep.describe("Evaluate('pagecount()', 0)")
w_reporte_gral.SetPosition(TopMost!)
end subroutine

public function integer inicialize (string p_tipo, string p_rep_docu, string p_descrip);// p_tipo es el que va a decir si p_rep_docu es:
//		RI:Reporte Interno 		tabla		Rep_Interno
//		RE:Reporte 					tabla		REP_ADM
//		DO:Documento 				tabla		Documentos
//Todos son de clugar=clugar y el parámetro p_decsrip es una descripción que mandan para 
//mostrarla si hay errores.
string camino,nomarch,carreta,todo,path
long archivo,tamanyo,donde
w_reporte_gral.SetPosition(TopMost!)
choose case p_tipo
	case 'RI'
		blob rep
		if f_lee_rep(p_rep_docu,clugar,p_descrip,pb_rep.dw_rep)=-1 then return -1
	case 'RE'
		if p_rep_docu='' then
			path=GetCurrentDirectory ( )
			nomarch=camino
			if GetFileOpenName("Buscar Reporte", camino, nomarch, "SRD","Reportes (*.SRD),*.SRD") <> 1 then 
				ChangeDirectory ( path )
				return -1
			end if
			ChangeDirectory ( path )
			this.title='Reportes: '+camino
		else
			if pb_rep.dw_repadm.retrieve(p_rep_docu)=0 then
				messagebox("Error de reportes",'Revise la configuración del reporte: '+p_rep_docu+' en la tabla Rep_Adm')
				return -1
			end if
			camino=pb_rep.dw_repadm.getitemstring(1,'camino')
			this.title=wordcap(pb_rep.dw_repadm.getitemstring(1,'modulo'))+'-Reportes: '+wordcap(pb_rep.dw_repadm.getitemstring(1,'descripcion'))
		end if
		carreta=pb_rep.sintax_de_camino(camino)
		dw_rep.create(carreta)
	case 'DO'
		f_lee_archivo(p_rep_docu,clugar,p_descrip,pb_rep.dw_repadm)
		if carreta<>"" then
			this.title = "Reportes - " + p_descrip
		else
			return -1
		end if
		dw_rep.create(carreta)
end choose
crear_parametros()
i_tipodw=inicia_por_tipo()
return 1

end function

public function integer crear_parametros ();string parametros,sql,sintax,err
long j,k,pos=0,i,asumar=0,donde,filas
uo_param zi_param[]
string t1,t2,tipo

parametros=dw_rep.describe('datawindow.table.arguments')
i_param[]=zi_param[]
k=f_count_text(parametros,"	")//tabs
if k>0 then 
	parametros+="~n"
	dw_rep.y=280
	rte_1.y=280
	st_7.y=196
else
	dw_rep.y =196
	rte_1.y = 140
	st_7.y = 120
end if
for j=1 to k
	t1=mid(parametros,pos +1,pos(parametros,'	',pos +1) -pos -1)
	pos=pos(parametros,'	',pos +1)
	t2=mid(parametros,pos +1 ,pos(parametros,"~n",pos) - pos -1)
	pos=pos(parametros,"~n",pos)
	if not isvalid(pb_rep.dw_repadm) then 
		pb_rep.dw_repadm=create uo_datastore
		pb_rep.dw_repadm.dataobject='dw_rep'
	end if
	donde=pb_rep.dw_repadm.find('nro_param='+string(j),1,pb_rep.dw_repadm.rowcount())
	openuserobject(i_param[j], asumar, 150)//(j -1) * 370
	i_param[j].visible=true
	if t2='datetime' then
		asumar+=488
	else
		i_param[j].width=488
		asumar+=488
	end if
	i_param[j].taborder=100 + j
	i_param[j].st_label.text=t1
	sql=''
	tipo=''
	if donde<>0 then //solo ocurre cuando es un reporte de Rep_Adm y se configuró todo
		if pb_rep.dw_repadm.getitemnumber(donde,'filtro_de')>0 then
			i_param[pb_rep.dw_repadm.getitemnumber(donde,'filtro_de')].ids_filtro_de.insertrow(1)
			i_param[pb_rep.dw_repadm.getitemnumber(donde,'filtro_de')].ids_filtro_de.setitem(1,1,j)
		end if
		tipo=pb_rep.dw_repadm.getitemstring(donde,'tipo')
		if tipo='S' then sql=pb_rep.dw_repadm.getitemstring(donde,'sql')
	end if
	choose case t2 //t2 es el tipo del parametro (t1 es el nombre del parametro)
		case 'string','character'
			i_param[j].dw_1.setitem(1,'tipo','1')
			i_param[j].dw_1.setcolumn('param_s')
			if tipo<>'' then
				i_param[j].dw_1.setitem(1,'tipo','4')
				sqlca.AutoCommit=true
				if tipo='S' then
					sintax=sqlca.syntaxfromsql (sql, '', err)
				else
					sintax=sqlca.syntaxfromsql ("select datotxt,descripcion,datotxt as dos from rep_admlista where cod_rep='"+pb_rep.cod_rep+"' and nro_param="+string(j)+" order by item", '', err)
				end if
				sqlca.AutoCommit=false
				i=dw_temp.create(sintax)
				dw_temp.settransobject(sqlca)
				if dw_temp.retrieve()>0 then
					i=dw_temp.rowscopy(1, dw_temp.rowcount(), primary!, i_param[j].dw_s, 1, primary!)
				end if
				i_param[j].dw_s.insertrow(1)
				i_param[j].dw_s.setitem(1,1,'%')
				i_param[j].dw_s.setitem(1,2,'[Todos]')
				i_param[j].dw_1.setcolumn('param_dws')
			end if
		case 'number'
			i_param[j].dw_1.setitem(1,'tipo','2')
			i_param[j].dw_1.setcolumn('param_n')
			if tipo<>'' then
				i_param[j].dw_1.setitem(1,'tipo','5')
				sqlca.AutoCommit=true
				if tipo='S' then
					sintax=sqlca.syntaxfromsql (sql, '', err)
				else
					sintax=sqlca.syntaxfromsql ("select datonum,descripcion,datonum as dos from rep_admlista where cod_rep='"+pb_rep.cod_rep+"' and nro_param="+string(j)+" order by item", '', err)
				end if
				sqlca.AutoCommit=false
				i=dw_temp.create(sintax)
				dw_temp.settransobject(sqlca)
				if dw_temp.retrieve()>0 then
					for filas=1 to dw_temp.rowcount()
						i_param[j].dw_n.insertrow(filas)
						i_param[j].dw_n.setitem(filas,'codigo',dw_temp.getitemnumber(filas,1))
						i_param[j].dw_n.setitem(filas,'descrip',dw_temp.getitemstring(filas,2))
						i_param[j].dw_n.setitem(filas,'pa_filtro',dw_temp.getitemnumber(filas,3))
					next
				end if
				i_param[j].dw_1.setcolumn('param_dwn')
			end if
		case 'datetime'
			i_param[j].dw_1.setitem(1,'tipo','3')
			i_param[j].dw_1.setitem(1,'param_d',datetime(today()))
			i_param[j].dw_1.setcolumn('param_d')
		case 'date'
			i_param[j].dw_1.setitem(1,'tipo','6')
			i_param[j].dw_1.setitem(1,'param_d2',today())
			i_param[j].dw_1.setcolumn('param_d2')
		case 'time'
			i_param[j].dw_1.setitem(1,'tipo','7')
			i_param[j].dw_1.setitem(1,'param_t',now())
			i_param[j].dw_1.setcolumn('param_t')
	end choose
next
long hasta
hasta=upperbound(i_param)
for j= k+1 to hasta
	i_param[j].visible=false
next
return 1
end function

public function string inicia_por_tipo ();string tipo
w_reporte_gral.SetPosition(TopMost!)
tipo=dw_rep.describe('datawindow.processing')
if tipo='7' then
	cbx_1.text='Enc/Pie.'
	dw_rep.enabled=false
	dw_rep.visible=false
	st_7.visible=false
//	dw_rte.visible=true
	rte_1.visible=true
	
	rte.taborder=200
	em_1.visible=false
	st_2.visible=false
	st_6.visible=false
	em_2.visible=false
	st_3.visible=false
	string margen,ojo
	if isvalid(pb_rep) then
		em_1.text=string(pb_rep.tam_imp)
		em_1.triggerevent(modified!)
		em_2.text=string(pb_rep.zoom)
		em_2.triggerevent(modified!)
		em_3.text=string(pb_rep.num_cop)
		em_3.triggerevent(modified!)
	else		
//		margen=dw_rep.describe("datawindow.print.margin.right")
//		rte.rightmargin=long(margen)
//		margen=dw_rep.describe("datawindow.print.margin.left")
//		rte.leftmargin=long(margen)
//		margen=dw_rep.describe("datawindow.print.margin.top")
//		rte.topmargin=long(margen)
//		margen=dw_rep.describe("datawindow.print.margin.bottom")
//		rte.bottommargin=long(margen)
	end if
else
	dw_rep.taborder=200
	dw_rep.settransobject(sqlca)
	dw_rep.modify("datawindow.print.preview= 'Yes'")
	if isvalid(pb_rep) then
		em_1.text=string(pb_rep.tam_imp)
		em_1.triggerevent(modified!)
		em_2.text=string(pb_rep.zoom)
		em_2.triggerevent(modified!)
		em_3.text=string(pb_rep.num_cop)
		em_3.triggerevent(modified!)
	else
		em_1.text=dw_rep.describe("datawindow.zoom")
		em_2.text=dw_rep.describe("datawindow.print.preview.zoom")
	end if
		
end if
return tipo
end function

public function integer pasar_a_rtf ();string cual,coltype,apegar,reemp
long num_object,largo,k,j
uo_datastore ds_objects
ds_objects=create uo_datastore 
ds_objects.dataobject='dw_campos_de_rtfs'
num_object=f_objects_dw(dw_rep,ds_objects)
setpointer(hourglass!)
rte.SelectTextAll ( Header! )
rte.clear()
rte.SelectTextAll ( Detail! )
rte.clear()
rte.pastertf(dw_rep.copyrtf(false,Header!))
for j=1 to dw_rep.rowcount()
	rte.SelectText ( 9999999, 999999, 0, 0 ,Detail! )//mandarlo al final pa insertar
	dw_rep.setrow(j)
	rte.pastertf(dw_rep.copyrtf(false,Detail!),Detail!)
	for k=1 to ds_objects.rowcount()
		cual=ds_objects.getitemstring(k,'nombre')
		if cual ='APGAR FAMILIAR' then
			cual ='APGAR FAMILIAR' 
		end if
		reemp=rte.InputFieldLocate ( first! , cual )
		do while reemp<>''
			rte.InputFieldDeleteCurrent ( )
			choose case ds_objects.getitemstring(k,'tipo')
				case 'column','compute'
					choose case ds_objects.getitemstring(k,'coltype')
						case 'char'
							apegar=dw_rep.getitemstring(j,cual)
						case 'long','number','real'
							apegar=string(dw_rep.getitemnumber(j,cual))
						case 'decimal'
							apegar=string(dw_rep.getitemdecimal(j,cual))
						case 'datetime'
							apegar=string(dw_rep.getitemdatetime(j,cual))
						case 'date'
							apegar=string(dw_rep.getitemdate(j,cual))
						case 'time'
							apegar=string(dw_rep.getitemtime(j,cual))	
					end choose
			end choose
			f_pega_a_rtf(rte,apegar,1)
			reemp=rte.InputFieldLocate ( next! , cual )
		loop
	next
next
f_pega_a_rtf(rte,'~r~n',2)
pasar_rtf_dw(3)
destroy(ds_objects)
return 1
end function

public function integer pasar_rtf_dw (integer p_donde);choose case p_donde
	case 0//al principio
	case 1//donde este
	case 2//al final
	rte_1.selecttext(99999,9999,0,0)
	rte_1.pastertf(rte.copyrtf(false,Detail!),Detail!)
//		dw_rte.selecttext(99999,9999,0,0)
//		dw_rte.pastertf(rte.copyrtf(false,Detail!),Detail!)
	case 3//reemplazar todo
//		dw_rte.setredraw(FALSE)
//		dw_rte.reset()
		dw_rte.retrieve(rte_1.pagecount())
//		dw_rte.selecttextall(Header!)
//		dw_rte.clear()
//		dw_rte.selecttextall(Detail!)
//		dw_rte.clear()
//		dw_rte.pastertf(rte.copyrtf(false,Header!),Header!)
//		dw_rte.pastertf(rte.copyrtf(false,Detail!),Detail!)
//		dw_rte.groupcalc()
		////	
		rte_1.setredraw(FALSE)
		rte_1.selecttextall(Header!)
		rte_1.clear()
		rte_1.selecttextall(Detail!)
		rte_1.clear()
		rte_1.pastertf(rte.copyrtf(false,Header!),Header!)
		rte_1.pastertf(rte.copyrtf(false,Detail!),Detail!)
		rte_1.pastertf(dw_rte.copyrtf(false,footer!),footer!)		

		rte_1.ShowHeadFoot(true,false)
		rte_1.InputFieldInsert("PAGENO")
		
string pie
pie= 'Pagina. ' +string(rte_1.selectedPage() )+ " de " +string(rte_1.PageCount()) 
pie=string(rte_1.InputFieldChangeData("PAGENO",pie ))

//pie=string(rte_1.pagecount()) 
//pie=string(rte_1.InputFieldChangeData("numero",pie ))
//rte_1.InputFieldChangeData("PAGENO"," Page "+string(rte_1.selectedPage())+ " Of " +string(rte_1.PageCount()) )
rte_1.ShowHeadFoot(false,false)
		/////
		
		
		colocapagin()
		rte_1.setredraw(true)
				rte_1.Preview(TRUE)
	//	dw_rte.setredraw(true)
end choose
return 1
end function

public subroutine f_filtrar (integer cual, string p_tipo, string p_dato);choose case p_tipo
	case '4','1'
		i_param[cual].dw_s.setfilter('#3="'+p_dato+'"')
		i_param[cual].dw_s.filter()
		i_param[cual].dw_s.insertrow(1)
		i_param[cual].dw_s.setitem(1,1,'%')
		i_param[cual].dw_s.setitem(1,2,'[Todos]')
		i_param[cual].dw_s.sort()
	case '2','5'
		i_param[cual].dw_n.setfilter('#3='+p_dato)
		i_param[cual].dw_n.filter()
		i_param[cual].dw_n.sort()
end choose
end subroutine

public function integer pasar_a_rtf (st_xa_print_histo p_param);string coltype,apegar,reemp,encab,tipo_memo,cual 
long k,j,nreg,item ,num_object,ojo
blob trae
boolean result
string tt
uo_datastore ds_objects
uo_datastore ds_result
ds_objects=create uo_datastore
ds_objects.dataobject='dw_campos_de_rtfs'

num_object=f_objects_ds(p_param.p_ds,ds_objects)
setpointer(hourglass!)
f_sel_rtf(rte2)
rte2.clearall()
f_sel_rtf(rte2)
rte2.ClearAll()
if p_param.p_encab_ingreso<>'' then f_pega_a_rtf(rte2,p_param.p_encab_ingreso,2)
tt=rte2.copyrtf(false,detail!)
if p_param.p_cod_plant<>'NotasQX' then
	f_pega_a_rtf(rte2,upper(p_param.p_ds.getitemstring(1,'desplantilla')),2)
	nreg=0
	tt=rte2.copyrtf(false,detail!)
	for j=1 to p_param.p_ds.rowcount()//filas del sql(hojas del rtf)
		p_param.p_ds.setrow(j)
		GARBAGECOLLECT()
		if p_param.p_cod_plant<>'EPI'  and p_param.p_cod_plant<>'NotasQX' then
			if nreg<>p_param.p_ds.getitemnumber(j,'nregistro') then//otro registro de la plantilla
				if j<>1 then 
					f_pega_a_rtf(rte2,'~r~n'+upper(p_param.p_ds.getitemstring(j,'desplantilla')),2)
				end if
				encab='~r~n'+string(p_param.p_ds.getitemdatetime(j,'fecha_reg'),'dd/mm/yyyy HH:mm:ss')+' '
				string esp,reg
				esp=p_param.p_ds.getitemstring(j,'desesp')
				if isnull(esp) then esp=''
				reg=p_param.p_ds.getitemstring(j,'registro')
				if isnull(reg) then reg=''
				encab+=p_param.p_ds.getitemstring(j,'desprof')+' ('+esp+') -REG Nro: '+reg+'~r~n'
				f_pega_a_rtf(rte2,encab,2)
				nreg=p_param.p_ds.getitemnumber(j,'nregistro')				
			end if
			item=p_param.p_ds.getitemnumber(j,'item')
			tipo_memo=p_param.p_ds.getitemstring(j,'tipo_memo')
			if tipo_memo='R' then result=true	
		end if
		if j=19 then
			j=j
		end if
		rte2.SelectText ( 9999999, 999999, 0, 0 ,detail! )
		rte2.pastertf(p_param.p_ds.copyrtf(false,detail!),detail!)
		tt=rte2.copyrtf(false,detail!)
		for k=1 to ds_objects.rowcount()
			cual=ds_objects.getitemstring(k,'nombre')
			reemp=rte2.InputFieldLocate ( first! , cual )
			do while reemp<>'' and reemp=cual
				rte2.InputFieldDeleteCurrent ( )
				choose case ds_objects.getitemstring(k,'tipo')
					case 'column','compute'
						choose case ds_objects.getitemstring(k,'coltype')
							case 'char'
								if ds_objects.getitemnumber(k,'largo')>255 then
									sqlca.autocommit=true
									if p_param.p_cod_plant='NotasQX' then
										choose case lower(cual)
											case 'notas_ane'
												selectblob notas_ane into :trae from qxcabacto where numero_ingre=:p_param.p_contador and clugar=:p_param.p_clug;
											case 'notasqx'
												selectblob notasqx into :trae from qxcabacto where numero_ingre=:p_param.p_contador and clugar=:p_param.p_clug;
										end choose
									elseif p_param.p_cod_plant='EPI' then
										selectblob resumeningreso into :trae from evolucionhc where contador=:p_param.p_contador and clugar=:p_param.p_clug;
									elseif p_param.p_cod_plant='NOTASPAC!' then//es desde Notas
										choose case lower(cual)
											case 'solicitud'
												selectblob solicitud into :trae from pacientesnotas where tipodoc=:p_param.p_tdoc and documento=:p_param.p_docu and num_nota=:p_param.p_contador ;
											case 'nota_atiende'
												selectblob nota_atiende into :trae from pacientesnotas where tipodoc=:p_param.p_tdoc and documento=:p_param.p_docu and num_nota=:p_param.p_contador ;
										end choose
									elseif p_param.p_cod_plant='QUEJASPAC!' then//es desde Notas
										choose case lower(cual)
											case 'solicitud'
												selectblob solicitud into :trae from pacientesquejas where tipodoc=:p_param.p_tdoc and documento=:p_param.p_docu and num_nota=:p_param.p_contador ;
											case 'nota_atiende'
												selectblob nota_atiende into :trae from pacientesquejas where tipodoc=:p_param.p_tdoc and documento=:p_param.p_docu and num_nota=:p_param.p_contador ;
										end choose
									else//todas las plantillas
										if tipo_memo='R' then result=true
										selectblob long_texto into :trae from hclin_reg_valor 
										where contador=:p_param.p_contador and clugar=:p_param.p_clug and nregistro=:nreg and item=:item;
									end if
									if sqlca.sqlcode=-1 then
										messagebox('Error leyendo campos memo de la plantilla '+p_param.p_cod_plant,sqlca.sqlerrtext)
									end if
									sqlca.autocommit=false
									apegar=string(trae)
									setnull(trae)
								else//es menor a 255
									apegar=p_param.p_ds.getitemstring(j,cual)
								end if
							case 'long','number','real'
								ojo=p_param.p_ds.getitemnumber(j,cual)
								apegar=string(ojo)
							case 'decimal(2)'
								apegar=string(p_param.p_ds.getitemdecimal(j,cual))
							case 'datetime'
								choose case cual
									case 'fechainicio','fechafin','fecha_nace'
										apegar=string(p_param.p_ds.getitemdatetime(j,cual),'dd/mm/yyyy')
									case 'horainicio','horafin'
										apegar=string(p_param.p_ds.getitemdatetime(j,cual),'HH:mm')
									case else
										apegar=string(p_param.p_ds.getitemdatetime(j,cual),'dd/mm/yyyy HH:mm')
								end choose
							case 'date'
								apegar=string(p_param.p_ds.getitemdate(j,cual))
							case 'time'
								apegar=string(p_param.p_ds.getitemtime(j,cual))
						end choose
				end choose
				if isnull(apegar) then apegar=''
				f_pega_a_rtf(rte2,apegar,1)
				if result then //es de resultados
					ds_result=create uo_datastore
					if g_motor='anywhere' then
						ds_result.dataobject='dr_result'
					end if
					if g_motor='sql' then
						ds_result.dataobject='dr_result_sqlserver'
					end if
					if g_motor='postgres' then
						ds_result.dataobject='dr_result_postgres'
					end if
					ds_result.settransobject(sqlca)
					if ds_result.retrieve(p_param.p_contador ,p_param.p_clug ,nreg ,item)>0 then gf_pasar_result_rtf(ds_result,rte2)
					destroy ds_result
				end if
				result=false
				reemp=rte2.InputFieldLocate ( next! , cual )
				setnull(apegar)
			loop
		next//objeto por objeto para irlo quitando
		if p_param.p_cod_plant='EPI' then
			f_pega_a_rtf(rte2,'~r~n',2)
		else
			//if p_param.p_ds.getitemstring(j,'tipo')='E' or p_param.p_ds.getitemstring(j,'tipo')='M' then f_pega_a_rtf(rte2,'~r~n',2) 2007-02-27
		end if
		if j=p_param.p_ds.rowcount() then f_pega_a_rtf(rte2,'~r~n',2)
		tt=rte2.copyrtf(false,detail!)
	next//las filas del sql
else // es de notas qx
//	f_pega_a_rtf(rte2,'NOTAS QUIRÚRGICAS~r~n',2)
	if p_param.p_detalle_qx <> '' then f_pega_a_rtf(rte2,p_param.p_detalle_qx,2)
end if
f_pega_a_rtf(rte2,'~r~n',2)
if p_param.p_notaqx <> '' then f_pega_a_rtf(rte2,p_param.p_notaqx,2)
tt=rte2.copyrtf(false,detail!)
f_pega_a_rtf(rte,tt,2)
pb_retri.enabled=false
f_sel_rtf(rte2)
rte2.clearall()
f_sel_rtf(rte2)
rte2.clearall()
destroy ds_objects
return 1
end function

public function integer wf_imprime_historia (datawindow adw_registros, string as_tipo_impre);dw_rep.visible=true
rte2.visible=false
rte_1.visible=false
dw_rte.visible=false
dw_rep.enabled=true

long j , ll_contador=0

string ls_sql , ls_result , ls_clug=''

ibn_reset_before_retrieve=true

dw_rep.dataobject='dr_historia_txt'
dw_rep.settransobject(sqlca)

choose case as_tipo_impre
case '1'//Normal
	for j=1 to adw_registros.rowcount()
		
		if adw_registros.getitemstring(j,'sel_plant')='0' then continue
		
		if adw_registros.getitemstring(j,'clugar')<> ls_clug or adw_registros.getitemnumber(j,'contador')<>ll_contador then
			
			ls_clug=adw_registros.getitemstring(j,'clugar')
			ll_contador=adw_registros.getitemnumber(j,'contador')
			
			if gf_revisa_migracion(ls_clug,ll_contador)<0 then return -1
			
		end if
		
		dw_rep.retrieve(ls_clug,ll_contador,adw_registros.getitemnumber(j,'nregistro'),as_tipo_impre)
		
	next
	
case '2' , '3' //resumen , referencia
	
	uo_datastore lds_rep
	lds_rep=create uo_datastore
	
	for j=1 to  adw_registros.rowcount()
		
		if adw_registros.getitemstring(j,'sel_plant')='0' then continue
		
		if adw_registros.getitemstring(j,'clugar')<> ls_clug or adw_registros.getitemnumber(j,'contador')<>ll_contador then
			
			ls_clug=adw_registros.getitemstring(j,'clugar')
			ll_contador=adw_registros.getitemnumber(j,'contador')
			
			if gf_revisa_migracion(ls_clug,ll_contador)<0 then return -1
			
		end if
		
		choose case adw_registros.getitemstring(j,'cual')
			case 'EPI'
				lds_rep.dataobject='dr_historia_txt_resumen'
			case 'NQX'
				//ya no existe esta opción de Notas en Salas Qx
			case else
				lds_rep.dataobject='dr_historia_txt'
		end choose
		ls_sql=lds_rep.describe("DataWindow.Table.Select")
		ls_result=dw_rep.Modify('DataWindow.Table.Select="'+ls_sql+'"')
		dw_rep.retrieve(ls_clug,ll_contador,adw_registros.getitemnumber(j,'nregistro'),as_tipo_impre)
	next
	
end choose

dw_rep.modify("datawindow.print.preview= 'Yes'")

dw_rep.groupcalc()

ibn_reset_before_retrieve=false

resizable=true

return 1
end function

on w_reporte_gral.create
this.pb_6=create pb_6
this.pb_3=create pb_3
this.pb_5=create pb_5
this.pb_help=create pb_help
this.cbx_2=create cbx_2
this.sle_1=create sle_1
this.st_7=create st_7
this.pb_retri=create pb_retri
this.pb_2=create pb_2
this.pb_1=create pb_1
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.sle_4=create sle_4
this.cbx_1=create cbx_1
this.st_1=create st_1
this.st_6=create st_6
this.gb_1=create gb_1
this.rte2=create rte2
this.rte=create rte
this.dw_temp=create dw_temp
this.rte_1=create rte_1
this.dw_rte=create dw_rte
this.dw_rep=create dw_rep
this.Control[]={this.pb_6,&
this.pb_3,&
this.pb_5,&
this.pb_help,&
this.cbx_2,&
this.sle_1,&
this.st_7,&
this.pb_retri,&
this.pb_2,&
this.pb_1,&
this.em_3,&
this.em_2,&
this.em_1,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.sle_4,&
this.cbx_1,&
this.st_1,&
this.st_6,&
this.gb_1,&
this.rte2,&
this.rte,&
this.dw_temp,&
this.rte_1,&
this.dw_rte,&
this.dw_rep}
end on

on w_reporte_gral.destroy
destroy(this.pb_6)
destroy(this.pb_3)
destroy(this.pb_5)
destroy(this.pb_help)
destroy(this.cbx_2)
destroy(this.sle_1)
destroy(this.st_7)
destroy(this.pb_retri)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_4)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.gb_1)
destroy(this.rte2)
destroy(this.rte)
destroy(this.dw_temp)
destroy(this.rte_1)
destroy(this.dw_rte)
destroy(this.dw_rep)
end on

event resize;dw_rep.width=this.width -55
rte_1.width=this.width -55
st_7.x=this.width - st_7.width - 116
if dw_rep.y=244 then
	dw_rep.height=this.height - 354
	rte_1.height=this.height - 354
else
	dw_rep.height=this.height - 480
	rte_1.height=this.height - 430
end if

end event

event open;
if isnull(message.powerobjectparm) then return

int j,k
string new_syntax, error_create

if message.powerobjectparm.classname()='st_xa_print_histo' then
	integer result, n
	string ls_name, ls_addr,tt
	SetPointer(HourGlass!) 
	if not isvalid(pb_rep) then 
		pb_rep= create uo_report
	end if
	i_st=message.powerobjectparm
	pb_rep.dw_rep=i_st.p_ds
	dw_rep.create(pb_rep.dw_rep.describe('datawindow.syntax'))
	i_tipodw=inicia_por_tipo()
	dw_rep.y=240
	rte_1.y=240
	st_7.y=116
	rte.SelectText(1, 1, 0, 0, Header!)
	rte.pastertf(i_st.p_header,Header!)//pa que lo haga una sola vez (colocar el encabezado)
	pasar_a_rtf(i_st)
else
	pb_rep=message.powerobjectparm
	dw_rep.create(pb_rep.dw_rep.describe('datawindow.syntax'))
//	new_syntax='bitmap(band=background filename="'+logo_agua+	'" x="951" y="436" height="1212" width="2226" border="0"  name=logo visible="1" )'
//	dw_rep.Modify("Create " +new_syntax)
//	dw_rep.SetTransObject(SQLCA)
  	/////////////////////
	i_tipodw=inicia_por_tipo()
	title=pb_rep.titulo
	if pb_rep.tipo_rep='menu!' or pb_rep.tipo_rep='externo!' then
		crear_parametros()
	else
		k=upperbound(i_param)
		for j=1 to k
			i_param[j].visible=false
		next
		if dw_rep.y<>156 then
			dw_rte.y=120
			dw_rep.y=240
			st_7.y=166
		end if
		pb_retri.triggerevent(clicked!)
	end if
end if


end event

type pb_6 from picturebutton within w_reporte_gral
integer x = 3319
integer y = 32
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "print_propiedades.gif"
alignment htextalign = left!
string powertiptext = "Configurar Página"
end type

event clicked;if i_tipodw='7' and cbx_2.checked then
	cbx_1.checked=false
	cbx_1.triggerevent(clicked!)
end if
openwithparm(w_conf_pag,pb_rep)

end event

type pb_3 from picturebutton within w_reporte_gral
integer x = 3168
integer y = 32
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &i"
boolean originalsize = true
string picturename = "print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir [Alt+I]"
end type

event clicked;if i_tipodw='7' then
	//dw_rte.Print ()
	rte_1.Print(1, "", FALSE, TRUE)
else
	dw_rep.print()
end if
end event

type pb_5 from picturebutton within w_reporte_gral
integer x = 3474
integer y = 32
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "export.gif"
alignment htextalign = right!
string powertiptext = "Exportar Reporte"
end type

event clicked;if f_permiso_boton(this,'PRI')=0 then return
if i_tipodw='7' then
	string docname, named
	integer value
	value = GetFileSaveName("Guardar Documento como", docname, named,"*.pdf","Archivo Pdf (*.PDF),*.PDF") 
	if value =1 then 
		rte.savedocument(docname,FileTypePDF! )
	end if
else
	OPENWITHPARM(w_export,dw_rep)
end if

end event

event constructor;f_inicia_boton(this,'PRI')
end event

type pb_help from picturebutton within w_reporte_gral
integer x = 3625
integer y = 32
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "           &y"
boolean originalsize = true
string picturename = "ayuda.gif"
alignment htextalign = left!
string powertiptext = "Ayuda [Alt+Y]"
end type

event clicked;showhelp(dir_insta+"gciltda.hlp",keyword!,"Ver reporte")
end event

type cbx_2 from checkbox within w_reporte_gral
integer x = 1646
integer y = 100
integer width = 261
integer height = 52
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Preview"
boolean checked = true
end type

event clicked;if i_tipodw='7' then
	cbx_1.checked=false
	if checked then
//		pb_1.enabled=false
//		pb_2.enabled=false
	else
		pb_1.enabled=true
		pb_2.enabled=true
	end if
	if this.checked then
//		dw_rte.modify("datawindow.print.preview= 'Yes'")
		rte_1.Preview(TRUE)
	else
//		dw_rte.modify("datawindow.print.preview= 'No'")
		rte_1.Preview(false)
	end if
else
	if this.checked then
		dw_rep.modify("datawindow.print.preview= 'Yes'")
	else
		dw_rep.modify("datawindow.print.preview= 'No'")
	end if
end if
end event

type sle_1 from statictext within w_reporte_gral
integer x = 361
integer y = 76
integer width = 238
integer height = 56
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "1/1"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_reporte_gral
integer x = 2830
integer y = 180
integer width = 731
integer height = 44
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Utilice Click Contrario para Filtrar"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_retri from picturebutton within w_reporte_gral
integer x = 27
integer y = 32
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean default = true
boolean originalsize = true
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Ejecutar Consulta"
end type

event clicked;string sin
sin=dw_rep.describe('datawindow.syntax')
if sin='' then
	inicialize('RE','','')
	return
end if
any parame[]
long j
sqlca.autocommit=true
if pb_rep.tipo_rep='menu!' or pb_rep.tipo_rep='externo!' then
	for j=1 to upperbound(i_param[])
		if i_param[j].visible then
			choose case i_param[j].dw_1.getitemstring(1,'tipo')
				case '1'
					parame[j]=i_param[j].dw_1.getitemstring(1,'param_s')
				case '2'
					parame[j]=i_param[j].dw_1.getitemnumber(1,'param_n')
				case '3'
					parame[j]=i_param[j].dw_1.getitemdatetime(1,'param_d')
				case '4'
					parame[j]=i_param[j].dw_1.getitemstring(1,'param_dws')
				case '5'
					parame[j]=i_param[j].dw_1.getitemnumber(1,'param_dwn')
				case '6'
					parame[j]=i_param[j].dw_1.getitemdate(1,'param_d2')
				case '7'
					parame[j]=i_param[j].dw_1.getitemtime(1,'param_t')	
			end choose
		end if
	next
else
	parame=pb_rep.param
end if
dw_rep.settransobject(sqlca)
choose case upperbound(parame[])
	case 0
		dw_rep.retrieve()
	case 1
		dw_rep.retrieve(parame[1])
	case 2
		dw_rep.retrieve(parame[1],parame[2])
	case 3
		dw_rep.retrieve(parame[1],parame[2],parame[3])
	case 4
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4])
	case 5
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5])
	case 6
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6])
	case 7
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6],parame[7])
	case 8
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6],parame[7],parame[8])
	case 9
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6],parame[7],parame[8],parame[9])
	case 10
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6],parame[7],parame[8],parame[9],parame[10])
	case else
		messagebox('Atención','Este reporte tiene demasiados parámetros')
end choose
dw_rep.sort()
dw_rep.groupcalc()
sqlca.autocommit=false
commit;
if i_tipodw='7' then pasar_a_rtf()

end event

type pb_2 from picturebutton within w_reporte_gral
integer x = 613
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "adelante_1.gif"
string disabledname = "d_adelante_1.gif"
alignment htextalign = left!
string powertiptext = "Siguiente Página"
end type

event clicked;if i_tipodw='7' then
	rte_1.scrollnextpage()
//	dw_rte.scrollnextpage()
else
	dw_rep.scrollnextpage()
end if
colocapagin()
end event

type pb_1 from picturebutton within w_reporte_gral
integer x = 187
integer y = 32
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras.gif"
string disabledname = "d_atras.gif"
alignment htextalign = left!
string powertiptext = "Página Anterior"
end type

event clicked;if i_tipodw='7' then
	rte_1.scrollpriorpage()
//	dw_rte.scrollpriorpage()
else
	dw_rep.scrollpriorpage()
end if
colocapagin()
end event

type em_3 from editmask within w_reporte_gral
integer x = 2153
integer y = 40
integer width = 165
integer height = 72
integer taborder = 80
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~99"
end type

event modified;dw_rep.modify("datawindow.print.copies="+this.text)
dw_rte.modify("datawindow.print.copies="+this.text)
pb_rep.num_cop=long(text)
end event

type em_2 from editmask within w_reporte_gral
event cambiando pbm_settext
integer x = 1893
integer y = 40
integer width = 233
integer height = 72
integer taborder = 70
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 5
string minmax = "30~~250"
end type

event cambiando;IF long(text) <30 or long(text)>300 then return
dw_rep.modify("datawindow.print.preview.zoom="+this.text)

end event

event modified;IF long(THIS.text) <30 or long(THIS.text)>300 then
	messagebox("Atención","El valor es entre 30 y 300")
	this.text="100"
end if
dw_rep.modify("datawindow.print.preview.zoom="+this.text)
dw_rte.modify("datawindow.print.preview.zoom="+this.text)
pb_rep.zoom=long(text)

end event

type em_1 from editmask within w_reporte_gral
event cambiando pbm_settext
integer x = 1385
integer y = 36
integer width = 233
integer height = 72
integer taborder = 40
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 5
string minmax = "30~~250"
end type

event cambiando;IF long(text) <30 or long(text)>300 then return
dw_rep.modify("datawindow.zoom="+this.text)
colocapagin()

end event

event modified;IF long(THIS.text) <30 or long(THIS.text)>250 then
	messagebox("Atención","El valor es entre 30 y 250")
	this.text="100"
end if
dw_rep.modify("datawindow.zoom="+text)
dw_rte.modify("datawindow.zoom="+text)
pb_rep.tam_imp=long(text)
colocapagin()

end event

type st_5 from statictext within w_reporte_gral
integer x = 2331
integer y = 104
integer width = 763
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Págs. ( separadas por comas o menos )"
boolean focusrectangle = false
end type

type st_4 from statictext within w_reporte_gral
integer x = 2153
integer y = 104
integer width = 155
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copias"
boolean focusrectangle = false
end type

type st_3 from statictext within w_reporte_gral
integer x = 1934
integer y = 104
integer width = 155
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Zoom"
boolean focusrectangle = false
end type

type st_2 from statictext within w_reporte_gral
integer x = 1394
integer y = 108
integer width = 192
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tamaño"
boolean focusrectangle = false
end type

type sle_4 from singlelineedit within w_reporte_gral
integer x = 2341
integer y = 36
integer width = 718
integer height = 68
integer taborder = 90
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string cambiar
cambiar = dw_rep.modify("datawindow.print.page.range='"+this.text+"'")
if cambiar<>"" then messagebox("Error de rangos",cambiar)
cambiar = dw_rte.modify("datawindow.print.page.range='"+this.text+"'")
if cambiar<>"" then messagebox("Error de rangos",cambiar)
if isvalid(pb_rep.dw_rep) then
	cambiar = pb_rep.dw_rep.modify("datawindow.print.page.range='"+this.text+"'")
	if cambiar<>"" then messagebox("Error de rangos",cambiar)
end if

end event

type cbx_1 from checkbox within w_reporte_gral
integer x = 1641
integer y = 36
integer width = 238
integer height = 64
integer taborder = 50
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reglas"
end type

event clicked;if i_tipodw='7' then
	cbx_2.checked=false
	pb_1.enabled=true
	pb_2.enabled=true
//	dw_rte.ShowHeadFoot ( checked)
//	rte_1.ShowHeadFoot ( checked)
else
	if this.checked=true then
		dw_rep.modify("datawindow.print.preview.rulers= 'Yes'")
	else
		dw_rep.modify("datawindow.print.preview.rulers= 'No'")
	end if
end if
end event

type st_1 from statictext within w_reporte_gral
integer x = 411
integer y = 32
integer width = 174
integer height = 64
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Página:"
boolean focusrectangle = false
end type

type st_6 from statictext within w_reporte_gral
integer x = 878
integer y = 16
integer width = 453
integer height = 104
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagina Horizontal"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_reporte_gral
integer x = 9
integer width = 3858
integer height = 180
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type rte2 from richtextedit within w_reporte_gral
event p_undo ( boolean p_cambiar )
string tag = "se coloca un registro y se va reemplazando"
boolean visible = false
integer y = 260
integer width = 3813
integer height = 1424
integer taborder = 150
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long init_backcolor = 16777215
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_headerfooter = true
integer init_undodepth = 100
long init_leftmargin = 2000
long init_topmargin = 1000
long init_rightmargin = 1000
long init_bottommargin = 1000
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type rte from richtextedit within w_reporte_gral
string tag = "donde se va armado todo"
boolean visible = false
integer x = 5
integer y = 264
integer width = 3840
integer height = 1404
integer taborder = 70
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long init_backcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_headerfooter = true
long init_leftmargin = 2000
long init_topmargin = 1000
long init_rightmargin = 1000
long init_bottommargin = 1000
borderstyle borderstyle = styleraised!
end type

type dw_temp from datawindow within w_reporte_gral
string tag = "para los datawindows pequeñitos de os parametros"
boolean visible = false
integer x = 2770
integer y = 188
integer width = 82
integer height = 44
boolean bringtotop = true
boolean enabled = false
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rte_1 from richtextedit within w_reporte_gral
boolean visible = false
integer y = 256
integer width = 3822
integer height = 1816
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_headerfooter = true
long init_leftmargin = 2000
long init_topmargin = 1000
long init_rightmargin = 1000
long init_bottommargin = 1000
string init_documentname = "Historia Clinica"
boolean init_displayonly = true
end type

type dw_rte from datawindow within w_reporte_gral
event keypres pbm_dwnkey
event p_undo ( )
boolean visible = false
integer y = 260
integer width = 3813
integer height = 1816
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_partfs"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypres;if (key=keyc! and keyflags=2) or keyflags=2 or keyflags=1 or key=KeyLeftArrow! or key=KeyUpArrow! or key=KeyRightArrow! or key=KeyDownArrow! then return 0
selecttext(selectedline(),selectedstart(),0,0)
post event p_undo()
return 1
end event

event p_undo();undo()
undo()
end event

event constructor;settransobject(sqlca)
end event

type dw_rep from datawindow within w_reporte_gral
event pagderecha pbm_vscroll
event mousemove pbm_dwnmousemove
integer y = 260
integer width = 3813
integer height = 1816
integer taborder = 150
string dragicon = "none!"
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_partfs"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;if this.rowcount()<1 then
	messagebox("Atención","No se encontraron registros")
	this.insertrow(0)
	this.enabled=false
else
	this.enabled=true
end if

end event

event getfocus;return
end event

event scrollvertical;if this.rowcount() >=1 then colocapagin()
end event

event scrollhorizontal;if this.rowcount() >=1 then colocapagin()
end event

event rowfocuschanged;if this.rowcount() >=1 then colocapagin()
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event retrievestart;if ibn_reset_before_retrieve then return 2
end event

