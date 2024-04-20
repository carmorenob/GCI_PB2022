$PBExportHeader$w_print_ped_hc.srw
forward
global type w_print_ped_hc from window
end type
type dw_rte from datawindow within w_print_ped_hc
end type
type pb_1 from pb_report within w_print_ped_hc
end type
type rte_1 from richtextedit within w_print_ped_hc
end type
end forward

global type w_print_ped_hc from window
integer width = 4626
integer height = 1896
boolean titlebar = true
string title = "Imprimir registros seleccionados de Historia"
boolean controlmenu = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event type string lf_reemp_campos ( string p_todo,  uo_datastore p_dw )
dw_rte dw_rte
pb_1 pb_1
rte_1 rte_1
end type
global w_print_ped_hc w_print_ped_hc

type variables
st_filtros_hc i_st
end variables

forward prototypes
public function string lf_reemp_campos (string p_todo, uo_datastore p_dw, string p_sito)
end prototypes

event type string lf_reemp_campos(string p_todo, uo_datastore p_dw);long num_object,largo,k,numeroingreso , j
string cual,coltype,reemp,apegar,clug
blob trae
datastore ds_objects
ds_objects=create datastore
ds_objects.dataobject='dw_campos_de_rtfs'
f_sel_rtf(rte_1)
rte_1.clearall()
f_sel_rtf(rte_1)
rte_1.clearall()
num_object=f_objects_ds(p_dw,ds_objects)
for j=1 to p_dw.rowcount()
	f_pega_a_rtf(rte_1,p_todo,2)
	p_dw.setrow(j)
	for k=1 to ds_objects.rowcount()
		cual=ds_objects.getitemstring(k,'nombre')
		reemp=rte_1.InputFieldLocate ( first! , cual )
		do while reemp<>'' and reemp=cual
			rte_1.InputFieldDeleteCurrent ( )
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
									apegar=string(p_dw.getitemdatetime(j,cual),'hh:mm AM/PM')
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
			f_pega_a_rtf(rte_1,apegar,1)
			reemp=rte_1.InputFieldLocate ( next! , cual )
			setnull(apegar)
		loop
	next
next
reemp=rte_1.copyrtf(false,detail!)
destroy ds_objects
return reemp
end event

public function string lf_reemp_campos (string p_todo, uo_datastore p_dw, string p_sito);long num_object,largo,k,numeroingreso , j
string cual,coltype,reemp,apegar,clug
blob trae
datastore ds_objects
ds_objects=create datastore
ds_objects.dataobject='dw_campos_de_rtfs'
f_sel_rtf(rte_1)
rte_1.clearall()
f_sel_rtf(rte_1)
rte_1.clearall()
num_object=f_objects_ds(p_dw,ds_objects)
for j=1 to p_dw.rowcount()
	f_pega_a_rtf(rte_1,p_todo,2)
	p_dw.setrow(j)
	for k=1 to ds_objects.rowcount()
		cual=ds_objects.getitemstring(k,'nombre')
		reemp=rte_1.InputFieldLocate ( first! , cual )
		do while reemp<>'' and reemp=cual
			rte_1.InputFieldDeleteCurrent ( )
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
									apegar=string(p_dw.getitemdatetime(j,cual),'hh:mm AM/PM')
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
			f_pega_a_rtf(rte_1,apegar,1)
			reemp=rte_1.InputFieldLocate ( next! , cual )
			setnull(apegar)
		loop
	next
next
f_pega_a_rtf(rte_1,'~r~n~r~n',2)
if p_sito<>'H' then 
	reemp=rte_1.copyrtf(false,detail!)
end if
return reemp
end function

on w_print_ped_hc.create
this.dw_rte=create dw_rte
this.pb_1=create pb_1
this.rte_1=create rte_1
this.Control[]={this.dw_rte,&
this.pb_1,&
this.rte_1}
end on

on w_print_ped_hc.destroy
destroy(this.dw_rte)
destroy(this.pb_1)
destroy(this.rte_1)
end on

event resize;long alt,anch
anch=newwidth + 4
alt=newheight - 100
dw_rte.width=anch
dw_rte.height=alt
end event

event open;i_st=message.powerobjectparm
long j,contador,nreg,item,k
string ls_clug,ls_enz,ls_reg,tt
datetime ld_fechai,ld_fechaF
blob trae,encabezado
uo_datastore ds_result, dw

i_st.dw_histo.SetRedraw(true)	
i_st.dw_vals.SetRedraw(true)	

rte_1.SelectTextAll ( header! )
rte_1.Clearall()
rte_1.SelectTextAll ( detail! )
rte_1.Clearall()

ld_fechai=i_st.dw_histo.getitemdatetime(1,'fecha')
ld_fechaF=datetime(today(),now())
dw=create uo_datastore
dw.dataobject='dw_encab_histo'
dw.settransobject(sqlca)
selectblob encab_historia into :encabezado from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo encabezados',sqlca.sqlerrtext)
end if
if isnull(encabezado) then encabezado=blob('')
dw.retrieve(tipdoc,docu,i_st.dw_histo.getitemdatetime(1,'fecha'))

setnull(ls_enz)
//st.p_encab_ingreso=lf_encab_agrupa('A',dw_1.getitemnumber(j,'contador'),dw_1.getitemstring(j,'clugar'),dw_1.getitemstring(j,'indapdx'))
ls_enz= lf_reemp_campos(string(encabezado),dw,'H')
sqlca.autocommit=true
//f_pega_a_rtf(rte_1,ls_enz+'~r~n',2)
rte_1.pastertf(ls_enz,Header!)

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
for j=1 to i_st.dw_histo.rowcount()
	if i_st.dw_histo.getitemnumber(j,'impri')=0 then continue
	if i_st.dw_histo.getitemstring(j,'tipo_campo')='E' then //historial
		if j>1 then f_pega_a_rtf(rte_1,'~r~n',2)
		ls_reg=i_st.dw_histo.getitemstring(j,'registro')
		if isnull(ls_reg) then ls_reg=''
		f_pega_a_rtf(rte_1,i_st.dw_histo.getitemstring(j,'desplantilla')+' ('+string(i_st.dw_histo.getitemdatetime(j,'fecha'))+')'+' '+i_st.dw_histo.getitemstring(j,'desprof')+'-'+'Reg No. '+ls_reg+'  '+i_st.dw_histo.getitemstring(j,'desesp')+'~r~n',2)
	end if
	if i_st.dw_histo.getitemstring(j,'tipo_campo')='E' then //etiqueta
		f_pega_a_rtf(rte_1,i_st.dw_histo.getitemstring(j,'label')+'~r~n',2)
		i_st.dw_histo.event rowfocuschanged(j)
		if i_st.dw_vals.rowcount()>0 then
			for k=1 to i_st.dw_vals.rowcount()
				f_pega_a_rtf(rte_1,i_st.dw_vals.getitemstring(k,'descampo')+':',2)
				choose case i_st.dw_vals.getitemstring(k,'tipo')
					case 'L','T','S'
						f_pega_a_rtf(rte_1,i_st.dw_vals.getitemstring(k,'texto'),2)
					case 'N'
						if i_st.dw_vals.getitemstring(k,'sino')='1' then
							f_pega_a_rtf(rte_1,'SI',2)
						else
							f_pega_a_rtf(rte_1,'NO',2)
						end if
					case 'R','C'
						f_pega_a_rtf(rte_1,string(i_st.dw_vals.getitemnumber(k,'numero')),2)
					case 'F'
						f_pega_a_rtf(rte_1,string(i_st.dw_vals.getitemdatetime(k,'fecha')),2)
				end choose
				f_pega_a_rtf(rte_1,'	',2)
			next
			f_pega_a_rtf(rte_1,'~r~n',2)
		end if
	end if
	if i_st.dw_histo.getitemstring(j,'tipo_campo')='M' then //memo
		f_pega_a_rtf(rte_1,i_st.dw_histo.getitemstring(j,'label')+': ',2)
		contador=i_st.dw_histo.getitemnumber(j,'contador')
		ls_clug=i_st.dw_histo.getitemstring(j,'clugar')
		nreg=i_st.dw_histo.getitemnumber(j,'nregistro')
		item=i_st.dw_histo.getitemnumber(j,'item')
		sqlca.autocommit=true
		selectblob long_texto into :trae from hclin_reg_valor 
		where contador=:contador and clugar=:ls_clug and nregistro=:nreg and item=:item;
		sqlca.autocommit=false
		if sqlca.sqlcode=-1 then 	messagebox('Error leyendo plantillas',sqlca.sqlerrtext)
		if len(string(trae))=0 then setnull(trae)
		f_pega_a_rtf(rte_1,string(trae),2)
		f_pega_a_rtf(rte_1,'~r~n',2)
		if i_st.dw_histo.getitemstring(j,'tipo_memo')='R' then
			if ds_result.retrieve(contador ,ls_clug ,nreg ,item/*,ld_fechai,ld_fechaF*/)>0 then gf_pasar_result_rtf(ds_result,rte_1)
		end if
	end if
next
dw_rte.reset()
dw_rte.retrieve(rte_1.pagecount())
dw_rte.SelectTextAll ( header! )
dw_rte.Clearall()
dw_rte.SelectTextAll ( detail! )
dw_rte.Clearall()
dw_rte.pastertf(rte_1.copyrtf(false,header!),header!)
//dw_rte.pastertf(rte_1.copyrtf(false,detail!),detail!)
i_st.dw_histo.SetRedraw(true)	
i_st.dw_vals.SetRedraw(true)	

destroy ds_result

end event

type dw_rte from datawindow within w_print_ped_hc
integer y = 96
integer width = 3017
integer height = 1612
integer taborder = 20
string title = "none"
string dataobject = "dw_partfs"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_1 from pb_report within w_print_ped_hc
integer width = 302
integer height = 84
integer taborder = 10
integer textsize = -8
string facename = "Tahoma"
string text = "&Imprimir"
boolean originalsize = false
string picturename = "print_small.GIF"
string disabledname = ""
alignment htextalign = right!
string cod_rep = "OM"
string nombre_rep = "Ordenes Médicas"
string tipo_rep = "interno!"
boolean dialogo = true
boolean v_preliminar = true
end type

event clicked;call super::clicked;//any par[2]
//par[1]=contador
//par[2]=clugar_hadm
//imprimir(par)
//rte_1.print(1,'',true,true)
dw_rte.Print ()
end event

type rte_1 from richtextedit within w_print_ped_hc
boolean visible = false
integer x = 1202
integer y = 112
integer width = 1746
integer height = 1424
integer taborder = 10
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_tabbar = true
boolean init_popmenu = true
long init_leftmargin = 2000
long init_topmargin = 1000
long init_rightmargin = 1000
long init_bottommargin = 1000
borderstyle borderstyle = stylelowered!
end type

