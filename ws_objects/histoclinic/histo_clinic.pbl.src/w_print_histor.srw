$PBExportHeader$w_print_histor.srw
forward
global type w_print_histor from window
end type
type rte_1 from richtextedit within w_print_histor
end type
type dw_3 from datawindow within w_print_histor
end type
type pb_3 from picturebutton within w_print_histor
end type
type rb_2 from radiobutton within w_print_histor
end type
type rb_comp from radiobutton within w_print_histor
end type
type ddl_tipo from dropdownlistbox within w_print_histor
end type
type gb_1 from groupbox within w_print_histor
end type
type pb_1 from picturebutton within w_print_histor
end type
type pb_2 from picturebutton within w_print_histor
end type
type dw_1 from datawindow within w_print_histor
end type
type dw_2 from datawindow within w_print_histor
end type
end forward

global type w_print_histor from window
integer width = 4283
integer height = 1724
boolean titlebar = true
string title = "Imprimir Historia Clínica"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "conf_imp.ico"
boolean clientedge = true
boolean center = true
rte_1 rte_1
dw_3 dw_3
pb_3 pb_3
rb_2 rb_2
rb_comp rb_comp
ddl_tipo ddl_tipo
gb_1 gb_1
pb_1 pb_1
pb_2 pb_2
dw_1 dw_1
dw_2 dw_2
end type
global w_print_histor w_print_histor

type variables
trae i_historial
constant string union1="SELECT DISTINCT 	historial.contador,historial.clugar,historial.indapdx,hclin_registro.fecha_reg as fecha,'1' AS sel_ing,case when hclin_registro.tipo='F' then '0' else '1' end AS sel_plant,hclin_registro.codplantilla,hclin_registro.desplantilla,hclin_plant.ayuda,hclin_plant.reporte,hclin_registro.ingreso,hclin_registro.tipo,hclin_registro.NREGISTRO,historial.fecha as hf FROM (historial INNER JOIN hclin_registro ON (historial.clugar = hclin_registro.clugar) AND (historial.contador = hclin_registro.contador)) INNER JOIN hclin_plant ON hclin_registro.codplantilla = hclin_plant.codplantilla WHERE "

constant string un1_res="SELECT DISTINCT historial.contador, historial.clugar, historial.indapdx, historial.fecha, '1' AS sel_ing, '1' AS sel_plant, hclin_registro.tipo AS cual, 0 AS numero_ingre, '  ' AS clugar_his, hclin_registro.desplantilla, hclin_registro.codplantilla, hclin_registro.ingreso, hclin_registro.tipo FROM historial INNER JOIN hclin_registro ON (historial.clugar = hclin_registro.clugar) AND (historial.Contador = hclin_registro.contador) WHERE (((hclin_registro.tipo)<>'E' And (hclin_registro.tipo)<>'R' And (hclin_registro.tipo)<>'F'))"
constant string un2_res=" UNION ALL SELECT historial.contador, historial.clugar, historial.indapdx, historial.fecha, '1' AS sel_ing, '1' AS sel_plant, 'EPI' AS cual, 0 AS numero_ingre, '  ' AS clugar_his, 'Resumen de Evolución' , 'EPI' , 'K','P' FROM historial INNER JOIN evolucionhc ON (historial.contador = evolucionhc.contador) AND (historial.clugar = evolucionhc.clugar) WHERE (((historial.indapdx)='2' Or (historial.indapdx)='3' Or (historial.indapdx)='4'  Or (historial.indapdx)='7' ))"
constant string un3_res=" UNION ALL SELECT Historial.contador, Historial.clugar, Historial.IndApDx, Historial.Fecha, '1' AS sel_ing, '1' AS sel_plant, 'NQX' AS cual, QxCabActo.Numero_ingre, QxCabActo.clugar, 'Notas quirúrgicas' , 'NOQX' , 'Q' , 'Q' FROM Historial INNER JOIN QxCabActo ON (Historial.clugar = QxCabActo.clugar_his) AND (Historial.Contador = QxCabActo.contador)"
constant string un4_res=" UNION ALL SELECT Historial.contador, Historial.clugar, Historial.IndApDx, Historial.Fecha,'1' AS sel_ing, '1' AS sel_plant,'NQX' AS codplantilla, 'NOTAS QUIRURGICAS' as desplantilla ,null as ayuda,null as reporte, 'Q','Q' as tipo FROM Historial INNER JOIN QxCabActo ON (Historial.clugar = QxCabActo.clugar_his) AND (Historial.Contador = QxCabActo.contador)"

string ped_ing,paci
datetime fecha_atencion
uo_datastore i_rep
end variables
forward prototypes
public function string lf_reemp_campos (string p_todo, uo_datastore p_dw)
public function string lf_encab_agrupa (string p_tipo, long p_contador, string p_clugar, string p_indapdx)
end prototypes

public function string lf_reemp_campos (string p_todo, uo_datastore p_dw);long num_object,largo,k,numeroingreso,j
string objects,cual,coltype,reemp,apegar,clug
blob trae

datastore ds_objects
ds_objects=create datastore
ds_objects.dataobject='dw_campos_de_rtfs'
num_object=f_objects_ds(p_dw,ds_objects)
f_sel_rtf(rte_1)
rte_1.clearall()
f_sel_rtf(rte_1)
rte_1.clearall()
for j=1 to p_dw.rowcount()
	p_dw.setrow(j)
	f_pega_a_rtf(rte_1,p_todo,2)
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
			f_pega_a_rtf(rte_1,apegar,1)
			reemp=rte_1.InputFieldLocate ( next! , cual )
			setnull(apegar)
		loop
	next
next
destroy ds_objects
reemp=rte_1.copyrtf(false,detail!)
return reemp
end function

public function string lf_encab_agrupa (string p_tipo, long p_contador, string p_clugar, string p_indapdx);blob formato
uo_datastore dw
dw=create uo_datastore
sqlca.autocommit=true
choose case p_tipo
	case 'E'//encabezado
		if rb_comp.checked then
			selectblob encab_historia into :formato from lugar where codlugar=:clugar;
		else
			selectblob encab_epi into :formato from lugar where codlugar=:clugar;
		end if
		if sqlca.sqlcode=-1 then
			messagebox('Error leyendo encabezados',sqlca.sqlerrtext)
		end if
		dw.dataobject='dw_encab_histo'
		dw.settransobject(sqlca)
		dw.retrieve(tipdoc,docu,fecha_atencion)
	case 'A'//agrupamiento del ingreso
		choose case p_indapdx
			case '1','0','5','6'
				selectblob agrupa_historia into :formato from tipoingreso where codtingre='1';
			case '2','3','4','7'
				selectblob agrupa_historia into :formato from tipoingreso where codtingre=:p_indapdx;
		end choose
		dw.dataobject='dw_agrupa_ing_hc'
		dw.settransobject(sqlca)
		dw.retrieve(p_contador,p_clugar)
end choose
sqlca.autocommit=false
return lf_reemp_campos(string(formato),dw)
end function

on w_print_histor.create
this.rte_1=create rte_1
this.dw_3=create dw_3
this.pb_3=create pb_3
this.rb_2=create rb_2
this.rb_comp=create rb_comp
this.ddl_tipo=create ddl_tipo
this.gb_1=create gb_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_1=create dw_1
this.dw_2=create dw_2
this.Control[]={this.rte_1,&
this.dw_3,&
this.pb_3,&
this.rb_2,&
this.rb_comp,&
this.ddl_tipo,&
this.gb_1,&
this.pb_1,&
this.pb_2,&
this.dw_1,&
this.dw_2}
end on

on w_print_histor.destroy
destroy(this.rte_1)
destroy(this.dw_3)
destroy(this.pb_3)
destroy(this.rb_2)
destroy(this.rb_comp)
destroy(this.ddl_tipo)
destroy(this.gb_1)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_1)
destroy(this.dw_2)
end on

event open;i_historial=message.powerobjectparm
blob objs
setnull(objs)

paci=" historial.tipodoc='"+tipdoc+"' and historial.documento='"+docu+"' "
ped_ing=" and historial.contador="+string(i_historial.numero)+" and historial.clugar='"+i_historial.lugar+"'"
ddl_tipo.event selectionchanged(1)
i_rep=create uo_datastore

selectblob corpograma into :objs from evolucionhc 
where contador=:i_historial.numero and clugar=:i_historial.lugar;
if not isnull(objs) then
	if dw_3.create(string(objs))=-1 then
		pb_3.enabled=false
		return
	end if
	dw_3.settransobject(sqlca)
	dw_3.retrieve(i_historial.numero,i_historial.lugar)
	dw_3.Modify("DataWindow.header.height=560")
else
	pb_3.enabled=false
end if

end event

type rte_1 from richtextedit within w_print_histor
boolean visible = false
integer x = 3314
integer y = 1500
integer width = 878
integer height = 52
integer taborder = 30
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_print_histor
boolean visible = false
integer x = 4279
integer y = 28
integer width = 2798
integer height = 2608
integer taborder = 30
boolean enabled = false
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_3 from picturebutton within w_print_histor
integer x = 1422
integer y = 28
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cuerpo.gif"
string disabledname = "d_cuerpo.gif"
alignment htextalign = left!
string powertiptext = "Impresión Corpograma"
end type

event clicked;long Job

Job = PrintOpen( "Imprimiendo Corpograma")
printdatawindow(Job,dw_3)
//dw_3.Print(Job, 2327,2608)
PrintClose(Job)
end event

type rb_2 from radiobutton within w_print_histor
integer x = 1070
integer y = 64
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen"
end type

event clicked;dw_1.visible=false
dw_2.visible=true
ddl_tipo.enabled=false
end event

type rb_comp from radiobutton within w_print_histor
integer x = 672
integer y = 64
integer width = 352
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Completo(a)"
boolean checked = true
end type

event clicked;dw_1.visible=true
dw_2.visible=false
ddl_tipo.enabled=true
end event

type ddl_tipo from dropdownlistbox within w_print_histor
integer x = 64
integer y = 60
integer width = 581
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string item[] = {"El Actual Ingreso","Toda la Historia"}
integer accelerator = 105
borderstyle borderstyle = stylelowered!
end type

event constructor;text='El Actual Ingreso'
end event

event selectionchanged;dw_1.setredraw(false)
string sql_tod,sql_res,l_tipo
choose case text
	case 'El Actual Ingreso'
		sql_tod=union1+paci+ped_ing//+union2+paci+ped_ing
		sql_res=un1_res+ 'and '+paci+ped_ing + un2_res+ 'and '+paci+ped_ing + un3_res+ 'and '+paci+ped_ing
		l_tipo='1'
	case 'Toda la Historia'
		sql_tod=union1+paci//+union2+paci
		sql_res=un1_res+' and '+ paci + un2_res+' and '+paci + un3_res+' and '+paci
		l_tipo='2'
end choose
dw_1.setsqlselect(sql_tod)
dw_2.setsqlselect(sql_res)
dw_1.retrieve()
dw_2.retrieve()
dw_1.sort()
dw_1.groupcalc()
dw_2.sort()
dw_2.groupcalc()
if dw_1.rowcount()>0 then
	if l_tipo='1' then
		fecha_atencion=dw_1.GetItemDatetime(dw_1.getrow(),'fecha')
	else
		fecha_atencion=datetime(today())
	end if
	if index<>-1 then dw_1.setredraw(true)
Else
	return
End If
end event

type gb_1 from groupbox within w_print_histor
integer x = 37
integer width = 1362
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir"
end type

type pb_1 from picturebutton within w_print_histor
integer x = 2039
integer y = 1476
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;long j
blob  detalle, notas
string clug, sql_historia,sql_todo,l_temporal="C:\windows\temp\"+tipdoc+docu+".jpg"

if g_motor='postgres' then
	sql_historia="SELECT hclin_reg_valor.nregistro, hclin_reg_valor.item, hclin_registro.desplantilla, hclin_registro.tipo as hctipo, &
	HISTORIAL.INDAPDX as codtingre,	hclin_registro.ingreso, hclin_registro.fecha AS fecha_reg, hclin_reg_valor.orden,hclin_reg_valor.descampo,&
	CASE WHEN hclin_reg_valor.tipo='S' THEN 'T' else hclin_reg_valor.tipo end  as tipo,&
	CASE WHEN hclin_reg_valor.tipo='S' THEN  CASE WHEN hclin_reg_valor.texto is not null THEN 'SI' else 'NO' end else hclin_reg_valor.texto end texto, &
	CASE WHEN hclin_reg_valor.tipo='N' then CASE WHEN hclin_reg_valor.sino='1' then 'SI' else 'NO' end end as sinob, &
	hclin_reg_valor.numero, hclin_reg_valor.long_texto, hclin_reg_valor.fecha, &
	profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '||profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof, &
	hclin_reg_valor.tipo_memo, Especialidades.DesEsp, Profe.registro, hclin_plantcampo.medida,hclin_reg_valor.padre &
	FROM ((((hclin_registro INNER JOIN Profe ON hclin_registro.CODPROF = Profe.CODPROF) INNER JOIN Especialidades ON hclin_registro.CESP = Especialidades.CODESP) INNER JOIN hclin_reg_valor ON (hclin_registro.CONTADOR = hclin_reg_valor.CONTADOR) AND (hclin_registro.CLUGAR = hclin_reg_valor.CLUGAR) AND (hclin_registro.NREGISTRO = hclin_reg_valor.NREGISTRO)) INNER JOIN hclin_plantcampo ON (hclin_reg_valor.PADRE = hclin_plantcampo.PADRE) AND (hclin_reg_valor.ITEM = hclin_plantcampo.NUMCAMPO) AND (hclin_registro.CODPLANTILLA = hclin_plantcampo.CODPLANTILLA)) INNER JOIN HISTORIAL ON (hclin_registro.CLUGAR = HISTORIAL.CLUGAR) AND (hclin_registro.CONTADOR = HISTORIAL.CONTADOR) WHERE"
else
	sql_historia="SELECT hclin_reg_valor.nregistro, hclin_reg_valor.item, hclin_registro.desplantilla, hclin_registro.tipo as hctipo, &
	HISTORIAL.INDAPDX as codtingre,	hclin_registro.ingreso, hclin_registro.fecha AS fecha_reg, hclin_reg_valor.orden,hclin_reg_valor.descampo,&
	CASE WHEN hclin_reg_valor.tipo='S' THEN 'T' else hclin_reg_valor.tipo end  as tipo,&
	CASE WHEN hclin_reg_valor.tipo='S' THEN  CASE WHEN hclin_reg_valor.texto is not null THEN 'SI' else 'NO' end else hclin_reg_valor.texto end texto, &
	CASE WHEN hclin_reg_valor.tipo='N' then CASE WHEN hclin_reg_valor.sino='1' then 'SI' else 'NO' end end as sinob, &
	hclin_reg_valor.numero, hclin_reg_valor.long_texto, hclin_reg_valor.fecha, &
	profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof, &
	hclin_reg_valor.tipo_memo, Especialidades.DesEsp, Profe.registro, hclin_plantcampo.medida,hclin_reg_valor.padre &
	FROM ((((hclin_registro INNER JOIN Profe ON hclin_registro.CODPROF = Profe.CODPROF) INNER JOIN Especialidades ON hclin_registro.CESP = Especialidades.CODESP) INNER JOIN hclin_reg_valor ON (hclin_registro.CONTADOR = hclin_reg_valor.CONTADOR) AND (hclin_registro.CLUGAR = hclin_reg_valor.CLUGAR) AND (hclin_registro.NREGISTRO = hclin_reg_valor.NREGISTRO)) INNER JOIN hclin_plantcampo ON (hclin_reg_valor.PADRE = hclin_plantcampo.PADRE) AND (hclin_reg_valor.ITEM = hclin_plantcampo.NUMCAMPO) AND (hclin_registro.CODPLANTILLA = hclin_plantcampo.CODPLANTILLA)) INNER JOIN HISTORIAL ON (hclin_registro.CLUGAR = HISTORIAL.CLUGAR) AND (hclin_registro.CONTADOR = HISTORIAL.CONTADOR) WHERE "
end If

if isvalid(w_reporte_gral) then close(w_reporte_gral)
f_foto_paciente(tipdoc,docu,l_temporal)

st_xa_print_histo st
if rb_comp.checked then //completa
	st.p_header=lf_encab_agrupa('E',0,'','')
	j=dw_1.rowcount()
	for j=1 to dw_1.rowcount()
		if dw_1.getitemstring(j,'sel_plant')='1' then
			st.p_fecha=dw_1.getitemdatetime(j,'fecha')
			st.p_Fechaf=datetime(today(),now())
			i_rep.dataobject='dr_historia'
			i_rep.settransobject(sqlca)
			st.p_contador=dw_1.getitemnumber(j,'contador')
			st.p_clug=dw_1.getitemstring(j,'clugar')
			st.p_encab_ingreso=lf_encab_agrupa('A',dw_1.getitemnumber(j,'contador'),dw_1.getitemstring(j,'clugar'),dw_1.getitemstring(j,'indapdx'))
			sql_todo=sql_historia+"(hclin_registro.Contador="+string(dw_1.getitemnumber(j,'contador')) +" AND hclin_reg_valor.clugar='"+dw_1.getitemstring(j,'clugar')+"' AND (hclin_registro.codplantilla='"+dw_1.getitemstring(j,'codplantilla')+"'"
			do while j<>1 and st.p_contador=dw_1.getitemnumber(j,'contador') and j<dw_1.rowcount()
				if dw_1.getitemstring(j,'sel_plant')='1' then
					sql_todo+= " OR  hclin_registro.codplantilla='"+dw_1.getitemstring(j,'codplantilla')+"'"
				end if
				j++
			loop 
	
			if j=dw_1.rowcount() then
				if dw_1.getitemstring(j,'sel_plant')='1' then
					sql_todo+= " OR  hclin_registro.codplantilla='"+dw_1.getitemstring(j,'codplantilla')+"'"
				end if
			end if
			sql_todo+="))"+"order by HISTORIAL.INDAPDX,case when hclin_registro.tipo='H' then  case when hclin_registro.ingreso ='I' then  0  else  10 end else case when hclin_registro.tipo='E' then 1 else case when hclin_registro.tipo='R' then 2 else case when hclin_registro.tipo='Q' then 3 else case when hclin_registro.tipo='F' then 4 else case when hclin_registro.tipo='L' then 5 else case when hclin_registro.tipo='P' then 6  end end end end end end end,hclin_registro.fecha, hclin_reg_valor.orden"
			if i_rep.setsqlselect(sql_todo)=-1 then
				sql_todo=i_rep.describe('DataWindow.Table.Select')
			end if
			sql_todo=i_rep.describe('DataWindow.Table.Select')
			i_rep.retrieve()
			if i_rep.rowcount()>0 then
				st.p_ds=i_rep
				if isvalid(w_reporte_gral) then
					w_reporte_gral.pasar_a_rtf(st)
				else
					opensheetwithparm(w_reporte_gral,st,w_principal,7,original!)
				end if
			end if
		end if
	next
else //resumen
	st.p_header=lf_encab_agrupa('E',0,'','')
		for j=1 to dw_2.rowcount()
		if dw_2.getitemstring(j,'sel_plant')='0' then continue
		choose case dw_2.getitemstring(j,'cual')
			case 'NQX'
				i_rep.dataobject='dr_ingresoqx'
				i_rep.settransobject(sqlca)
				if st.p_contador<>dw_2.getitemnumber(j,'contador') then //ingreso nuevo colocar el agrupamiento de ese ingreso
					st.p_encab_ingreso=lf_encab_agrupa('A',dw_2.getitemnumber(j,'contador'),dw_2.getitemstring(j,'clugar'),dw_2.getitemstring(j,'indapdx'))
				else
					st.p_encab_ingreso=''
				end if
				st.p_contador=dw_2.getitemnumber(j,'contador')
				i_rep.retrieve(dw_2.getitemnumber(j,'numero_ingre'),dw_2.getitemstring(j,'clugar_his'))
				clug=dw_2.getitemstring(j,'clugar_his')
				st.p_ds=i_rep
				sqlca.autocommit=true
				selectblob  deta_proc_qx  into  :detalle from lugar where codlugar=:clug;
				if isnull(detalle) then detalle=blob('')
				selectblob notas_qx  into :notas from lugar where codlugar=:clug;
				sqlca.autocommit=false
				if isnull(notas) then notas=blob('')
				st.p_notaqx=lf_reemp_campos(string(notas),st.p_ds)
				if g_motor='postgres' then
					i_rep.dataobject='dr_detalleqx_postgres'
				else
					i_rep.dataobject='dr_detalleqx'
				end if
				i_rep.settransobject(sqlca)
				i_rep.retrieve(dw_2.getitemnumber(j,'numero_ingre'),dw_2.getitemstring(j,'clugar_his'))
				st.p_detalle_qx=lf_reemp_campos(string(detalle),i_rep)
				st.p_cod_plant='NotasQX'
				if isvalid(w_reporte_gral) then
					w_reporte_gral.pasar_a_rtf(st)
				else
					opensheetwithparm(w_reporte_gral,st,w_principal,7,original!)
				end if
				st.p_notaqx=''
				st.p_ds.dataobject=''
			case 'EPI'
				i_rep.dataobject='dr_epicrisis'
				i_rep.settransobject(sqlca)
				if st.p_contador<>dw_2.getitemnumber(j,'contador') then //ingreso nuevo colocar el agrupamiento de ese ingreso
					st.p_encab_ingreso=lf_encab_agrupa('A',dw_2.getitemnumber(j,'contador'),dw_2.getitemstring(j,'clugar'),dw_2.getitemstring(j,'indapdx'))
				else
					st.p_encab_ingreso=''
				end if
				st.p_contador=dw_2.getitemnumber(j,'contador')
				if i_rep.retrieve(dw_2.getitemnumber(j,'contador'),dw_2.getitemstring(j,'clugar'))>0 then
					st.p_ds=i_rep
					st.p_clug=dw_2.getitemstring(j,'clugar')
					st.p_cod_plant='EPI'
					st.p_titulo='~rEpicrisis~r'
					if isvalid(w_reporte_gral) then
						w_reporte_gral.pasar_a_rtf(st)
					else
						opensheetwithparm(w_reporte_gral,st,w_principal,7,original!)
					end if
				end if
			case else
				if g_motor='postgres' then
					i_rep.dataobject='dr_historia_org_postgres'
				else
					i_rep.dataobject='dr_historia_org'
				end if
				i_rep.settransobject(sqlca)
				if st.p_contador<>dw_2.getitemnumber(j,'contador') then //ingreso nuevo colocar el agrupamiento de ese ingreso
					st.p_encab_ingreso=lf_encab_agrupa('A',dw_2.getitemnumber(j,'contador'),dw_2.getitemstring(j,'clugar'),dw_2.getitemstring(j,'indapdx'))
				else
					st.p_encab_ingreso=''
				end if
				st.p_contador=dw_2.getitemnumber(j,'contador')
				if i_rep.retrieve(dw_2.getitemnumber(j,'contador'),dw_2.getitemstring(j,'clugar'),dw_2.getitemstring(j,'codplantilla'),'0')>0 then
					st.p_ds=i_rep
					st.p_clug=dw_2.getitemstring(j,'clugar')
					st.p_cod_plant=dw_2.getitemstring(j,'codplantilla')
					st.p_titulo='~r'+string(dw_2.getitemdatetime(j,'fecha'),'dd/mm/yyyy HH:mm')+': '+upper(dw_2.getitemstring(j,'desplantilla'))+'~r'
					if isvalid(w_reporte_gral) then
						w_reporte_gral.pasar_a_rtf(st)
					else
						opensheetwithparm(w_reporte_gral,st,w_principal,7,original!)
					end if
				end if
		end choose
	next
end if
if isvalid(w_reporte_gral) then w_reporte_gral.pasar_rtf_dw(3)
FileDelete(l_temporal)
close(parent)
end event

type pb_2 from picturebutton within w_print_histor
integer x = 2203
integer y = 1476
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
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

type dw_1 from datawindow within w_print_histor
event cambia_estado ( string dato,  long fila_ante,  string filtro_ante )
event pe_cambio_plant ( long fila_ant,  string filtro_ante )
integer x = 32
integer y = 184
integer width = 4178
integer height = 1280
integer taborder = 20
string title = "Completa"
string dataobject = "dw_histo_plant"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event cambia_estado(string dato, long fila_ante, string filtro_ante);long j
accepttext()
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)	
next
setfilter(filtro_ante)
filter()
sort()
groupcalc()
scrolltorow(fila_ante)
setredraw(true)
end event

event pe_cambio_plant(long fila_ant, string filtro_ante);long j
string dato
accepttext()
if filtro_ante='' then
	setfilter('contador='+string(getitemnumber(fila_ant,'contador')))
else
	setfilter(filtro_ante+' and contador='+string(getitemnumber(fila_ant,'contador')))
end if
filter()
groupcalc()
if getitemnumber(1,'sum_plant')=0 then
	dato='0'
elseif getitemnumber(1,'sum_plant')<rowcount() then
	dato='2'
else
	dato='1'
end if
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)
next
setfilter(filtro_ante)
filter()
sort()
groupcalc()
setcolumn('sel_plant')
scrolltorow(fila_ant)
setredraw(true)
end event

event constructor;settransobject(sqlca)
end event

event clicked;if row<1 then return
scrolltorow(row)
end event

event itemchanged;long j,fila_actual
string dato,filtro_actu
fila_actual=getrow()
filtro_actu=describe("datawindow.table.filter")
if filtro_actu='?' then filtro_actu=''
setredraw(false)
choose case dwo.name
	case 'sel_ing'
		if getitemstring(fila_actual,'sel_ing')='1' or getitemstring(fila_actual,'sel_ing')='2' then
			dato='0'
		else
			dato='1'
		end if
		if filtro_actu='' then
			setfilter('contador='+string(getitemnumber(fila_actual,'contador')))
		else
			setfilter(filtro_actu+' and contador='+string(getitemnumber(fila_actual,'contador')))
		end if
		filter()
		for j=1 to rowcount()
			if getitemstring(j,'tipo')='F' then 
				setitem(j,'sel_plant','0')
			else	
				setitem(j,'sel_plant',dato)
			end if
		next
		post event cambia_estado(dato,fila_actual,filtro_actu)
	case 'sel_plant'
		accepttext()
		post event pe_cambio_plant(fila_actual,filtro_actu)
end choose

end event

event buttonclicked;setredraw(false)
string dato
long j
if dwo.tag='d' then
	dato='0'
	modify('b_1.tag="s"')
else
	modify('b_1.tag="d"')
	dato='1'
end if
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)
	if getitemstring(j,'tipo')='F' then 
		setitem(j,'sel_plant','0')
	else	
		setitem(j,'sel_plant',dato)
	end if
next
setredraw(true)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=describe('b_1.background.color')
openwithparm(w_funcion_dw,st_dw)

end event

type dw_2 from datawindow within w_print_histor
event cambia_estado ( string dato,  long fila_ante,  string filtro_ante )
event pe_cambio_plant ( long fila_ant,  string filtro_ante )
boolean visible = false
integer x = 46
integer y = 180
integer width = 4183
integer height = 1284
integer taborder = 20
string title = "Pa imprimir lo de evolucion"
string dataobject = "dw_histo_resumen"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event cambia_estado(string dato, long fila_ante, string filtro_ante);long j
accepttext()
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)	
next
setfilter(filtro_ante)
filter()
sort()
groupcalc()
scrolltorow(fila_ante)
setredraw(true)
end event

event pe_cambio_plant(long fila_ant, string filtro_ante);long j
string dato
accepttext()
if filtro_ante='' then
	setfilter('contador='+string(getitemnumber(fila_ant,'contador')))
else
	setfilter(filtro_ante+' and contador='+string(getitemnumber(fila_ant,'contador')))
end if
filter()
groupcalc()
if getitemnumber(1,'sum_plant')=0 then
	dato='0'
elseif getitemnumber(1,'sum_plant')<rowcount() then
	dato='2'
else
	dato='1'
end if
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)
next
setfilter(filtro_ante)
filter()
sort()
groupcalc()
setcolumn('sel_plant')
scrolltorow(fila_ant)
setredraw(true)
end event

event clicked;if row<1 then return
scrolltorow(row)
end event

event buttonclicked;setredraw(false)
string dato
long j
if dwo.tag='d' then
	dato='0'
	modify('b_1.tag="s"')
else
	modify('b_1.tag="d"')
	dato='1'
end if
for j=1 to rowcount()
	setitem(j,'sel_ing',dato)
	setitem(j,'sel_plant',dato)
next
setredraw(true)
end event

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=describe('b_1.background.color')
openwithparm(w_funcion_dw,st_dw)
end event

event itemchanged;long j,fila_actual
string dato,filtro_actu
fila_actual=getrow()
filtro_actu=describe("datawindow.table.filter")
if filtro_actu='?' then filtro_actu=''
setredraw(false)
choose case dwo.name
	case 'sel_ing'
		if getitemstring(fila_actual,'sel_ing')='1' or getitemstring(fila_actual,'sel_ing')='2' then
			dato='0'
		else
			dato='1'
		end if
		if filtro_actu='' then
			setfilter('contador='+string(getitemnumber(fila_actual,'contador')))
		else
			setfilter(filtro_actu+' and contador='+string(getitemnumber(fila_actual,'contador')))
		end if
		filter()
		for j=1 to rowcount()
			setitem(j,'sel_plant',dato)
		next
		post event cambia_estado(dato,fila_actual,filtro_actu)
	case 'sel_plant'
		accepttext()
		post event pe_cambio_plant(fila_actual,filtro_actu)
end choose
end event

