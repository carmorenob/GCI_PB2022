$PBExportHeader$w_print_histor_ole_sec.srw
forward
global type w_print_histor_ole_sec from window
end type
type ddlb_archivos from dropdownlistbox within w_print_histor_ole_sec
end type
type barra from hprogressbar within w_print_histor_ole_sec
end type
type dw_3 from datawindow within w_print_histor_ole_sec
end type
type pb_3 from picturebutton within w_print_histor_ole_sec
end type
type rb_2 from radiobutton within w_print_histor_ole_sec
end type
type rb_comp from radiobutton within w_print_histor_ole_sec
end type
type ddl_tipo from dropdownlistbox within w_print_histor_ole_sec
end type
type gb_1 from groupbox within w_print_histor_ole_sec
end type
type pb_1 from picturebutton within w_print_histor_ole_sec
end type
type pb_2 from picturebutton within w_print_histor_ole_sec
end type
type rte_1 from richtextedit within w_print_histor_ole_sec
end type
type dw_1 from datawindow within w_print_histor_ole_sec
end type
type dw_2 from datawindow within w_print_histor_ole_sec
end type
end forward

global type w_print_histor_ole_sec from window
integer width = 4283
integer height = 1724
boolean titlebar = true
string title = "Imprimir Historia Clínica Secuencial OLE"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "conf_imp.ico"
boolean clientedge = true
boolean center = true
ddlb_archivos ddlb_archivos
barra barra
dw_3 dw_3
pb_3 pb_3
rb_2 rb_2
rb_comp rb_comp
ddl_tipo ddl_tipo
gb_1 gb_1
pb_1 pb_1
pb_2 pb_2
rte_1 rte_1
dw_1 dw_1
dw_2 dw_2
end type
global w_print_histor_ole_sec w_print_histor_ole_sec

type variables
trae i_historial
constant string union1="  SELECT DISTINCT historial.contador,historial.clugar,historial.indapdx,historial.fecha,'1'AS sel_ing,case when hclin_registro.tipo='F' then '0' else '1'  end  AS sel_plant,hclin_registro.codplantilla,hclin_registro.desplantilla,hclin_plant.ayuda,hclin_plant.reporte,hclin_registro.ingreso ,hclin_registro.tipo FROM historial,hclin_registro,hclin_plant WHERE ( historial.contador = hclin_registro.contador ) and  ( historial.clugar = hclin_registro.clugar ) and  ( hclin_registro.codplantilla = hclin_plant.codplantilla )  "
//constant string union1="  SELECT DISTINCT historial.contador,historial.clugar,historial.indapdx,HCLIN_REGISTRO.FECHA,'1'AS sel_ing,case when hclin_registro.tipo='F' then '0' else '1'  end  AS sel_plant,hclin_registro.codplantilla,hclin_registro.desplantilla,hclin_plant.ayuda,hclin_plant.reporte,hclin_registro.ingreso ,hclin_registro.tipo FROM historial,hclin_registro,hclin_plant WHERE ( historial.contador = hclin_registro.contador ) and  ( historial.clugar = hclin_registro.clugar ) and  ( hclin_registro.codplantilla = hclin_plant.codplantilla )  "
//constant string union2=" UNION ALL SELECT historial.contador, historial.clugar,  historial.indapdx, historial.fecha, '' as codplantilla,'Evolución' as desplantilla,'Evolución en Estancia' as ayuda,'' as reporte,'1' as sel_ing,'1' as sel_plant,'01' as ingreso FROM evolucionhc, historial WHERE ( evolucionhc.contador = historial.contador ) and ( evolucionhc.clugar = historial.clugar ) "
constant string un1_res="SELECT DISTINCT historial.contador, historial.clugar, historial.indapdx, historial.fecha, '1' AS sel_ing, '1' AS sel_plant, hclin_registro.tipo AS cual, 0 AS numero_ingre, '  ' AS clugar_his, hclin_registro.desplantilla, hclin_registro.codplantilla, hclin_registro.ingreso, hclin_registro.tipo FROM historial INNER JOIN hclin_registro ON (historial.clugar = hclin_registro.clugar) AND (historial.Contador = hclin_registro.contador) WHERE (((hclin_registro.tipo)<>'E' And (hclin_registro.tipo)<>'R' And (hclin_registro.tipo)<>'F'))"
constant string un2_res=" UNION ALL SELECT historial.contador, historial.clugar, historial.indapdx, historial.fecha, '1' AS sel_ing, '1' AS sel_plant, 'EPI' AS cual, 0 AS numero_ingre, '  ' AS clugar_his, 'Resumen de Evolución' , 'EPI' , 'K','P' FROM historial INNER JOIN evolucionhc ON (historial.contador = evolucionhc.contador) AND (historial.clugar = evolucionhc.clugar) WHERE (((historial.indapdx)='2' Or (historial.indapdx)='3' Or (historial.indapdx)='4'  Or (historial.indapdx)='7' ))"
constant string un3_res=" UNION ALL SELECT Historial.contador, Historial.clugar, Historial.IndApDx, Historial.Fecha, '1' AS sel_ing, '1' AS sel_plant, 'NQX' AS cual, QxCabActo.Numero_ingre, QxCabActo.clugar, 'Notas quirúrgicas' , 'NOQX' , 'Q' , 'Q' FROM Historial INNER JOIN QxCabActo ON (Historial.clugar = QxCabActo.clugar_his) AND (Historial.Contador = QxCabActo.contador)"
constant string un4_res=" UNION ALL SELECT Historial.contador, Historial.clugar, Historial.IndApDx, Historial.Fecha,'1' AS sel_ing, '1' AS sel_plant,'NQX' AS codplantilla, 'NOTAS QUIRURGICAS' as desplantilla ,null as ayuda,null as reporte, 'Q','Q' as tipo FROM Historial INNER JOIN QxCabActo ON (Historial.clugar = QxCabActo.clugar_his) AND (Historial.Contador = QxCabActo.contador)"

string ped_ing,paci,ls_impr,l_ruta,ls_path='C:\windows\temp\'
datetime fecha_atencion
uo_datastore i_rep
end variables

forward prototypes
public function string lf_reemp_campos (string p_todo, uo_datastore p_dw)
public function string lf_encab_agrupa (string p_tipo, long p_contador, string p_clugar, string p_indapdx)
public subroutine f_impresion (oleobject p_oles, uo_datastore p_rep, long p_contador, string p_clugar, integer p_cp, string p_epi)
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

public subroutine f_impresion (oleobject p_oles, uo_datastore p_rep, long p_contador, string p_clugar, integer p_cp, string p_epi);long nreg,l_h,r_nro,c_r
uo_datastore result_s
string up_txt,up_enc,up_res,r_lug,r_cdc,r_pof,e_pof,r_cups
oleobject abregs

nreg=p_rep.getitemnumber(1,'nregistro')					
barra.Position = 0
barra.minposition=0
barra.maxposition=p_rep.rowcount()
barra.SetRange (0,p_rep.rowcount())
barra.visible=true
for l_h=1 to p_rep.rowcount()
	if ((p_rep.getitemnumber(l_h,'nregistro')<> nreg) or (p_rep.getitemnumber(l_h,'nregistro')=nreg and l_h=1)) then
		if l_h=1 or (p_contador<>dw_1.getitemnumber(p_cp,'contador') )then
			if p_epi='C' then
				p_oles.Selection.Font.Size = 10
				up_enc=lf_encab_agrupa('A',dw_1.getitemnumber(p_cp,'contador'),dw_1.getitemstring(p_cp,'clugar'),dw_1.getitemstring(p_cp,'indapdx'))
				up_enc=f_rtf_a_txt(up_enc)				
				if isnull(up_enc) or up_enc='-1' then 
					 up_enc=''
				end if
				p_oles.Selection.TypeText(up_enc+"~n")	
			end if
		end if
		p_oles.Selection.Font.Size = 10
		p_oles.Selection.Font.Bold = true
		p_oles.selection.ParagraphFormat.Alignment = 1
		p_oles.Selection.Font.Shading.BackgroundPatternColor= RGB(192,192,192)
		up_enc=p_rep.getitemstring(l_h,'desplantilla')
		p_oles.Selection.TypeText(up_enc+"~n")
		p_oles.Selection.Font.Size = 9
		p_oles.selection.ParagraphFormat.Alignment = 3
		up_enc=string(p_rep.getitemdatetime(l_h,'fecha_reg'),'dd/mm/yyyy HH:mm')+': '+upper(p_rep.getitemstring(l_h,'desprof'))
		if not isnull(p_rep.getitemstring(l_h,'desesp')) then up_enc=up_enc+' ('+p_rep.getitemstring(l_h,'desesp')+")"
		if not isnull(p_rep.getitemstring(l_h,'registro')) then up_enc=up_enc+' REG Nro: '+p_rep.getitemstring(l_h,'registro')
		p_oles.Selection.TypeText(up_enc+"~n")
		p_oles.Selection.Font.Bold = false
		p_oles.Selection.Font.Size = 8
		nreg=p_rep.getitemnumber(l_h,'nregistro')	
	end if
	p_oles.selection.ParagraphFormat.Alignment = 3
	choose case p_rep.getitemstring(l_h,'tipo')
		case 'T','L','Y'
			p_oles.Selection.Font.Underline = true
			up_enc=p_rep.getitemstring(l_h,'tab')+p_rep.getitemstring(l_h,'descampo')+' '			
			p_oles.Selection.TypeText(up_enc)
			p_oles.Selection.Font.Underline = false
			up_txt=p_rep.getitemstring(l_h,'texto')
			up_txt=up_txt+p_rep.getitemstring(l_h,'fin')
			if l_h+1<= p_rep.rowcount() then
				if p_rep.getitemnumber((l_h+1),'nregistro')<>nreg then 
					up_txt=up_txt+"~n~n"
				else
					if l_h=p_rep.rowcount() then up_txt=up_txt+"~n~n"
				end if
			end if
			p_oles.Selection.TypeText(up_txt)			
		case 'R','C'
			p_oles.Selection.Font.Bold = true
			up_enc=p_rep.getitemstring(l_h,'tab')+p_rep.getitemstring(l_h,'descampo')+' '			
			p_oles.Selection.TypeText(up_enc)
			p_oles.Selection.Font.Bold = false
			up_txt=string(p_rep.getitemnumber(l_h,'numero'))
			if not isnull(p_rep.getitemstring(l_h,'medida')) then
				up_txt=up_txt+"("+p_rep.getitemstring(l_h,'medida')+")"
			end if
			if l_h+1<= p_rep.rowcount() then
				if p_rep.getitemnumber((l_h+1),'nregistro')<>nreg then 
					up_txt=up_txt+"~n~n"
				else
					if l_h=p_rep.rowcount() then up_txt=up_txt+"~n~n"
				end if
			end if
			p_oles.Selection.TypeText(up_txt)
		case 'N'
			p_oles.Selection.Font.Bold = true
			up_enc=p_rep.getitemstring(l_h,'tab')+p_rep.getitemstring(l_h,'descampo')+' '			
			p_oles.Selection.TypeText(up_enc)
			p_oles.Selection.Font.Bold = false
			if not isnull(p_rep.getitemstring(l_h,'siyno')) then 
				up_txt=p_rep.getitemstring(l_h,'siyno')
				if l_h+1<= p_rep.rowcount() then
					if p_rep.getitemnumber((l_h+1),'nregistro')<>nreg then 
						up_txt=up_txt+"~n~n"
					else
						if l_h=p_rep.rowcount() then up_txt=up_txt+"~n~n"
					end if
				end if
				p_oles.Selection.TypeText(up_txt)				
			end if
		case 'F'
			p_oles.Selection.Font.Bold = true
			up_enc=p_rep.getitemstring(l_h,'tab')+p_rep.getitemstring(l_h,'descampo')+' '			
			p_oles.Selection.TypeText(up_enc)
			p_oles.Selection.Font.Bold = false
			up_txt=string(p_rep.getitemdatetime(l_h,'fecha'),'dd/mm/yyyy')
			if l_h+1<= p_rep.rowcount() then
				if p_rep.getitemnumber((l_h+1),'nregistro')<>nreg then 
					up_txt=up_txt+"~n~n"
				else
					if l_h=p_rep.rowcount() then up_txt=up_txt+"~n~n"
				end if
			end if
			p_oles.Selection.TypeText(up_txt)
		case 'M'		
			p_oles.Selection.Font.Bold = true
			up_enc=p_rep.getitemstring(l_h,'tab')+p_rep.getitemstring(l_h,'descampo')+' '	
			p_oles.Selection.TypeText(up_enc)
			p_oles.Selection.Font.Bold = false
			if p_rep.getitemstring(l_h,'tipo_memo')='R' then  //resultados Apdx
				result_s=create uo_datastore
				if g_motor='anywhere' then
					result_s.dataobject='dw_imp_historia_resultado'
				end if
				if g_motor='sql' then
					result_s.dataobject='dw_imp_historia_resultado_sqlserver'
				end if
				if g_motor='postgres' then
					result_s.dataobject='dw_imp_historia_resultado_postgres'
				end if
				result_s.settransobject(sqlca)
				if result_s.retrieve(dw_1.getitemnumber(p_cp,'contador'),dw_1.getitemstring(p_cp,'clugar') ,p_rep.getitemnumber(l_h,'nregistro') ,p_rep.getitemnumber(l_h,'item'))>0 then 		
					p_oles.Selection.Font.Shading.BackgroundPatternColor= RGB(192,192,192)
					p_oles.Selection.TypeText("~n"+"INFORME"+"~n")	
					r_nro=result_s.getitemnumber(1,'nrepor')
					r_lug=result_s.getitemstring(1,'clugar')
					r_cdc=result_s.getitemstring(1,'coddoc')
					r_pof=result_s.getitemstring(1,'desprof')
					e_pof=result_s.getitemstring(1,'desesp')
					r_cups=result_s.getitemstring(1,'cod_cups')
					for c_r=1 to result_s.rowcount()
						if ((c_r=1) or (r_nro<>result_s.getitemnumber(c_r,'nrepor') or r_lug<>result_s.getitemstring(c_r,'clugar') or r_cdc<>result_s.getitemstring(c_r,'coddoc') or r_pof<>result_s.getitemstring(c_r,'desprof') or r_cups<>result_s.getitemstring(c_r,'cod_cups'))) then
							p_oles.Selection.Font.Bold = true
							p_oles.Selection.TypeText(/*"~n"+*/"PROCEDIMIENTO ")
							p_oles.Selection.Font.Bold = false
							up_res="("+result_s.getitemstring(c_r,'cod_cups')+") "+result_s.getitemstring(c_r,'descripcion')
							p_oles.Selection.TypeText(up_res)
							p_oles.Selection.Font.Bold = true
							p_oles.Selection.TypeText(" REPORTADO EL ")
							p_oles.Selection.Font.Bold = false												
							up_res=string(result_s.getitemdatetime(c_r,'fecharesul'))+"~n"
							p_oles.Selection.TypeText(up_res)
							p_oles.Selection.Font.Bold = true
							p_oles.Selection.TypeText("PROCESADO POR ")
							p_oles.Selection.Font.Bold = false
							if isnull(e_pof) then
								up_res=result_s.getitemstring(c_r,'desprof')+"~n"
							else
								up_res=result_s.getitemstring(c_r,'desprof')+' ('+e_pof+')'+"~n"
							end if
							p_oles.Selection.TypeText(up_res)
							r_nro=result_s.getitemnumber(c_r,'nrepor')
							r_lug=result_s.getitemstring(c_r,'clugar')
							r_cdc=result_s.getitemstring(c_r,'coddoc')
							r_pof=result_s.getitemstring(c_r,'desprof')
							e_pof=result_s.getitemstring(c_r,'desesp')
							r_cups=result_s.getitemstring(c_r,'cod_cups')
						end if
					
						choose case result_s.getitemstring(c_r,'tipocampo')
							case '1','3','4'
								if len(result_s.getitemstring(c_r,'resultado'+result_s.getitemstring(c_r,'tipocampo')))<>0 then 
									 p_oles.Selection.Font.Bold = true
									 up_res= result_s.getitemstring(c_r,'nombrecampo')+' '	
									 if not isnull(up_res) and up_res<>'-1' then
										 p_oles.Selection.TypeText(up_res)
										 p_oles.Selection.Font.Bold = false													
										 up_res=result_s.getitemstring(c_r,'resultado'+result_s.getitemstring(c_r,'tipocampo'))
										 up_txt=f_rtf_a_txt(up_res)
										 p_oles.Selection.TypeText(up_res+"~n")	
									end if
								 end if
							case '2'
								if len(string(result_s.getitemstring(c_r,'resultado2')))<>0 then 
									p_oles.Selection.Font.Bold = true
									up_res= result_s.getitemstring(c_r,'nombrecampo')+' '	
									p_oles.Selection.TypeText(up_res)
									p_oles.Selection.Font.Bold = false													
									up_res=string(result_s.getitemnumber(c_r,'resultado2'))
									if not isnull(result_s.getitemstring(c_r,'umedida')) then
										up_res=up_res+result_s.getitemstring(c_r,'umedida')	
									end if
									p_oles.Selection.TypeText(up_res+"~n")	
								end if
							case '5','6'	
								p_oles.Selection.Font.Bold = true
								up_res= result_s.getitemstring(c_r,'nombrecampo')+' '	
								p_oles.Selection.TypeText(up_res)
								p_oles.Selection.Font.Bold = false													
								up_res=result_s.getitemstring(c_r,'resultado'+result_s.getitemstring(c_r,'tipocampo'))
								if up_res='0' then up_res='NO' else up_res='SI' 
								p_oles.Selection.TypeText(up_res+" ")	
						end choose
					next
					p_oles.Selection.TypeText("~n~n")	
				end if //resultado fin
				destroy result_s
			end if //Tipo resultad fin
			
			long l_ciclos,l_tam,l_i,l_newp,l_nreg,l_item
			blob l_b,l_notas
			string l_txt,ls_salida
			l_nreg=	p_rep.getitemnumber(l_h,'nregistro')
			l_item=	p_rep.getitemnumber(l_h,'item')
			selectblob long_texto into :l_notas from hclin_reg_valor
			where contador=:p_contador and clugar=:p_clugar and nregistro=:l_nreg and item=:l_item;		
			l_tam = Len(l_notas)
			if not isnull(l_tam ) then 
				If l_tam> 30000 THEN
					If Mod(l_tam, 30000) = 0 THEN
						l_ciclos = l_tam/30000
					else
						l_ciclos= (l_tam/30000) + 1
					End if
				else
					l_ciclos= 1
				end if
			
				if l_ciclos>20 then
					ls_salida=l_ruta+"\salida.doc"
					p_oles.Selection.TypeText("~n~n")
					rte_1.SelectTextAll()
					rte_1.clearall()
					f_pega_a_rtf(rte_1,string(l_notas),1)
					rte_1.SaveDocument(ls_salida, FileTypeDoc! )
					abregs = CREATE OLEObject
					IF abregs.ConnectToNewObject("word.application.8") = 0 THEN
						abregs.documents.open(ls_salida)
						abregs.visible =false
						abregs.ActiveDocument.Select()
						abregs.Selection.Copy()
						p_oles.Selection.Paste()
						abregs.ActiveDocument.Close(False)
						abregs.Application.quit()
						abregs.DisconnectObject()
						SetNull(abregs)
						DESTROY abregs
						//GarbageCollect()
						FILEDELETE(ls_salida)
					else
						abregs.Application.Quit()
						abregs.DisconnectObject()
						SetNull(abregs)
						DESTROY abregs
						//GarbageCollect()
					end if
				else
					l_newp = 1
					For l_i = 1 to l_ciclos
						setnull(l_b)
						setnull(l_txt)
						l_b = blobmid(l_notas,l_newp,30000)
						l_txt=string(l_b)
						up_enc=f_rtf_a_txt(l_txt)	
						if (up_enc<>'-1') and l_i=1 then
							p_oles.Selection.TypeText(up_enc)		
						else
							p_oles.Selection.Font.Size = 8
							p_oles.selection.ParagraphFormat.Alignment = 3
							if up_enc<>'-1'  then p_oles.Selection.TypeText(up_enc)										
						end if				
						l_newp += 30000
					next	
		//			up_txt=f_rtf_a_txt(p_rep.getitemstring(l_h,'long_texto'))				
		//			if isnull(up_txt) or up_txt='-1' then continue
		//			if len(up_txt)>200 then
		//				up_txt="~n"+up_txt
		//			end if
					p_oles.Selection.TypeText("~n~n")		
				end if
			end if
		case 'E'
			p_oles.Selection.Font.Bold = true
			p_oles.Selection.Font.Size = 8.5
			up_enc=p_rep.getitemstring(l_h,'tab')+p_rep.getitemstring(l_h,'descampo')+"~n"			
			p_oles.Selection.TypeText(up_enc)
			p_oles.Selection.Font.Bold = false								
			p_oles.Selection.Font.Size = 8
	end choose
	setnull(up_txt)	
	setnull(up_enc)	
	barra.position= l_h
//	p_oles.ActiveDocument.saveas(ls_impr, 17)
next
	p_oles.ActiveDocument.saveas(ls_impr, 17)
end subroutine

on w_print_histor_ole_sec.create
this.ddlb_archivos=create ddlb_archivos
this.barra=create barra
this.dw_3=create dw_3
this.pb_3=create pb_3
this.rb_2=create rb_2
this.rb_comp=create rb_comp
this.ddl_tipo=create ddl_tipo
this.gb_1=create gb_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.rte_1=create rte_1
this.dw_1=create dw_1
this.dw_2=create dw_2
this.Control[]={this.ddlb_archivos,&
this.barra,&
this.dw_3,&
this.pb_3,&
this.rb_2,&
this.rb_comp,&
this.ddl_tipo,&
this.gb_1,&
this.pb_1,&
this.pb_2,&
this.rte_1,&
this.dw_1,&
this.dw_2}
end on

on w_print_histor_ole_sec.destroy
destroy(this.ddlb_archivos)
destroy(this.barra)
destroy(this.dw_3)
destroy(this.pb_3)
destroy(this.rb_2)
destroy(this.rb_comp)
destroy(this.ddl_tipo)
destroy(this.gb_1)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.rte_1)
destroy(this.dw_1)
destroy(this.dw_2)
end on

event open;i_historial=message.powerobjectparm
blob objs
setnull(objs)

paci=" and historial.tipodoc='"+tipdoc+"' and historial.documento='"+docu+"' "
ped_ing=" and historial.contador="+string(i_historial.numero)+" and historial.clugar='"+i_historial.lugar+"'"
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
if ls_pro=32 then Registryget ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DIRECTORIO", regstring!, l_ruta)
if ls_pro=64 then RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "DIRECTORIO", regstring!, l_ruta)

Integer index
///Para borrar archivos
ddlb_archivos.DirList (ls_path+"*.doc",0)
For index=1 To ddlb_archivos.totalItems ( )
     FileDelete ( ddlb_archivos.text(index))
Next

ddlb_archivos.DirList (ls_path+"*.pdf",0)
For index=1 To ddlb_archivos.totalItems ( )
     FileDelete ( ddlb_archivos.text(index))
Next
ddl_tipo.event selectionchanged(1)
end event

type ddlb_archivos from dropdownlistbox within w_print_histor_ole_sec
boolean visible = false
integer x = 1810
integer y = 24
integer width = 480
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type barra from hprogressbar within w_print_histor_ole_sec
string tag = "Progreso"
boolean visible = false
integer x = 46
integer y = 1472
integer width = 1070
integer height = 52
unsignedinteger maxposition = 100
integer setstep = 1
end type

type dw_3 from datawindow within w_print_histor_ole_sec
boolean visible = false
integer x = 4279
integer y = 28
integer width = 2798
integer height = 2608
integer taborder = 60
boolean enabled = false
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_3 from picturebutton within w_print_histor_ole_sec
boolean visible = false
integer x = 1422
integer y = 28
integer width = 146
integer height = 128
integer taborder = 30
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

type rb_2 from radiobutton within w_print_histor_ole_sec
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

type rb_comp from radiobutton within w_print_histor_ole_sec
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

type ddl_tipo from dropdownlistbox within w_print_histor_ole_sec
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
		sql_res=un1_res+paci+ped_ing + un2_res+paci+ped_ing + un3_res+paci+ped_ing
		l_tipo='1'
	case 'Toda la Historia'
		sql_tod=union1+paci//+union2+paci
		sql_res=un1_res+paci + un2_res+paci + un3_res+paci
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

type gb_1 from groupbox within w_print_histor_ole_sec
integer x = 37
integer width = 1362
integer height = 160
integer taborder = 20
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

type pb_1 from picturebutton within w_print_histor_ole_sec
integer x = 2039
integer y = 1480
integer width = 146
integer height = 128
integer taborder = 80
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

event clicked;long c_p,c_h,c_r
blob notas
string sql_historia,sql_todo,l_temporal="C:\windows\temp\"+tipdoc+docu+".jpg"
string up_txt,up_enc,ls_enc,ldt,l_qx
uo_datastore result_s
oleobject oles,abre
datetime ffinal
boolean paso

SELECT cadena into :l_qx
FROM parametros_gen
WHERE (((codigo_para)=43));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 43')
	return
end if	 

GarbageCollectSetTimeLimit(10)
select getdate() into :ffinal from ips;
ldt=string( ffinal)
int wdHeaderFooterPrimary = 1

ldt=f_remplaza(ldt,'/','')
ldt=f_remplaza(ldt,' ','_')
ldt=f_remplaza(ldt,':','')
if g_motor='postgres' then
	sql_historia="SELECT	hclin_reg_valor.nregistro, hclin_reg_valor.item, hclin_registro.desplantilla, hclin_registro.tipo as otipo, HISTORIAL.INDAPDX as codtingre, hclin_registro.ingreso, &
	hclin_registro.fecha AS fecha_reg, hclin_reg_valor.orden, hclin_reg_valor.descampo, &
	CASE WHEN hclin_reg_valor.tipo='S' THEN 'T' else hclin_reg_valor.tipo end  as tipo, &
	CASE WHEN hclin_reg_valor.tipo='S' THEN  CASE WHEN hclin_reg_valor.texto is not null THEN 'SI' else 'NO' end else hclin_reg_valor.texto end texto, &
	CASE WHEN hclin_reg_valor.sino is not null then case when hclin_reg_valor.sino='1' then 'SI' else 'NO' end else hclin_reg_valor.sino end as sinob, &
	 hclin_reg_valor.numero, hclin_reg_valor.fecha, &
	 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end||' '||&
	 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof, &
	hclin_reg_valor.tipo_memo, Especialidades.DesEsp, Profe.registro, hclin_plantcampo.medida,hclin_reg_valor.padre,&
	hclin_reg_valor.long_texto&
	FROM ((((hclin_registro INNER JOIN Profe ON hclin_registro.CODPROF = Profe.CODPROF) INNER JOIN Especialidades ON hclin_registro.CESP = Especialidades.CODESP) INNER JOIN hclin_reg_valor ON (hclin_registro.CONTADOR = hclin_reg_valor.CONTADOR) AND (hclin_registro.CLUGAR = hclin_reg_valor.CLUGAR) AND (hclin_registro.NREGISTRO = hclin_reg_valor.NREGISTRO)) INNER JOIN hclin_plantcampo ON (hclin_reg_valor.PADRE = hclin_plantcampo.PADRE) AND (hclin_reg_valor.ITEM = hclin_plantcampo.NUMCAMPO) AND (hclin_registro.CODPLANTILLA = hclin_plantcampo.CODPLANTILLA)) INNER JOIN HISTORIAL ON (hclin_registro.CLUGAR = HISTORIAL.CLUGAR) AND (hclin_registro.CONTADOR = HISTORIAL.CONTADOR) WHERE"
else
	sql_historia="SELECT	hclin_reg_valor.nregistro, hclin_reg_valor.item, hclin_registro.desplantilla, hclin_registro.tipo as otipo, HISTORIAL.INDAPDX as codtingre, hclin_registro.ingreso, &
	hclin_registro.fecha AS fecha_reg, hclin_reg_valor.orden, hclin_reg_valor.descampo, &
	CASE WHEN hclin_reg_valor.tipo='S' THEN 'T' else hclin_reg_valor.tipo end  as tipo, &
	CASE WHEN hclin_reg_valor.tipo='S' THEN  CASE WHEN hclin_reg_valor.texto is not null THEN 'SI' else 'NO' end else hclin_reg_valor.texto end texto, &
	CASE WHEN hclin_reg_valor.sino is not null then case when hclin_reg_valor.sino='1' then 'SI' else 'NO' end else hclin_reg_valor.sino end as sinob, &
	 hclin_reg_valor.numero, hclin_reg_valor.fecha, &
	 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end+' '+&
	 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof, &
	hclin_reg_valor.tipo_memo, Especialidades.DesEsp, Profe.registro, hclin_plantcampo.medida,hclin_reg_valor.padre,&
	hclin_reg_valor.long_texto&
	FROM ((((hclin_registro INNER JOIN Profe ON hclin_registro.CODPROF = Profe.CODPROF) INNER JOIN Especialidades ON hclin_registro.CESP = Especialidades.CODESP) INNER JOIN hclin_reg_valor ON (hclin_registro.CONTADOR = hclin_reg_valor.CONTADOR) AND (hclin_registro.CLUGAR = hclin_reg_valor.CLUGAR) AND (hclin_registro.NREGISTRO = hclin_reg_valor.NREGISTRO)) INNER JOIN hclin_plantcampo ON (hclin_reg_valor.PADRE = hclin_plantcampo.PADRE) AND (hclin_reg_valor.ITEM = hclin_plantcampo.NUMCAMPO) AND (hclin_registro.CODPLANTILLA = hclin_plantcampo.CODPLANTILLA)) INNER JOIN HISTORIAL ON (hclin_registro.CLUGAR = HISTORIAL.CLUGAR) AND (hclin_registro.CONTADOR = HISTORIAL.CONTADOR) WHERE "
end If

f_foto_paciente(tipdoc,docu,l_temporal)

///PARA OLE
oles = CREATE oleobject
setnull(ls_enc)
ls_enc=l_ruta+"hc.dot"
ls_impr=ls_path+tipdoc+'_'+docu+'_'+ldt+".doc"
IF oles.ConnectToNewObject ("word.application.8") = 0 THEN
	oles.documents.open(ls_enc,true, True, False,"", "", True, "", "", 0)
	oles.ActiveDocument.SaveAs(ls_impr)
	oles.ActiveDocument.Close()
	oles.documents.open(ls_impr,true, True, False, "","", True, "", "", 0)
	oles.visible=false
	ls_impr=ls_path+tipdoc+'_'+docu+'_'+ldt+".pdf"
	ls_enc=ls_path+'E'+tipdoc+'_'+docu+'_'+ldt+".doc"	
	//FUENTES DEL CPO
	oles.Selection.Font.Name = "Tahoma"
	oles.Selection.Font.Bold = true
	st_xa_print_histo st
	///INICIA COMPLETA
	if rb_comp.checked then //completa
		///ENCABEZADO
		lf_encab_agrupa('E',0,'','')
		rte_1.SaveDocument(ls_enc, FileTypeDoc! )
		rte_1.clearall()
		ClipBoard('')
		abre = CREATE OLEObject
		IF abre.ConnectToNewObject("word.application.8") = 0 THEN
			abre.documents.open(ls_enc)
			abre.visible =false
			abre.ActiveDocument.Select()
			abre.Selection.Copy()
			oles.ActiveDocument.Sections[1].Headers[wdHeaderFooterPrimary].Range.Paste
			abre.quit(0)
		 	GarbageCollect ( )
			abre.disconnectobject()
			SetNull(abre)
			DESTROY abre
			GarbageCollect()
			FILEDELETE(ls_enc)
		else
			oles.quit(0)
			GarbageCollect()
			oles.DisconnectObject ( )
			setnull(oles)
			setnull(abre)
			DESTROY oles
			GarbageCollect()
			DESTROY abre
			GarbageCollect()
			return
		end if
		for  c_p=1 to dw_1.rowcount()
			st.p_contador=dw_1.getitemnumber(c_p,'contador')
			st.p_clug=dw_1.getitemstring(c_p,'clugar')
			if dw_1.getitemstring(c_p,'sel_plant')='1' then
				if g_motor='postgres' then
					i_rep.dataobject='dw_imp_historia_sec_postgres'				
				else
					i_rep.dataobject='dw_imp_historia_sec'
				end if
				i_rep.settransobject(sqlca)
				sql_todo=sql_historia+"(hclin_registro.Contador="+string(dw_1.getitemnumber(c_p,'contador')) +" AND hclin_reg_valor.clugar='"+dw_1.getitemstring(c_p,'clugar')+"' AND (hclin_registro.codplantilla='"+dw_1.getitemstring(c_p,'codplantilla')+"'"
				if c_p > dw_1.rowcount() - 1 then exit
				do 
					c_p++
					if dw_1.getitemstring(c_p,'sel_plant')='1' then
						sql_todo+= " OR  hclin_registro.codplantilla='"+dw_1.getitemstring(c_p,'codplantilla')+"'"
					end if
				loop while st.p_contador=dw_1.getitemnumber(c_p,'contador') and st.p_clug=dw_1.getitemstring(c_p,'clugar') and  c_p<dw_1.rowcount()
	
				if  c_p=dw_1.rowcount() then
					if dw_1.getitemstring(c_p,'sel_plant')='1' then
						sql_todo+= " OR  hclin_registro.codplantilla='"+dw_1.getitemstring(c_p,'codplantilla')+"'"
					end if
				end if
				c_p =  c_p -1
				sql_todo+="))"+"order by HISTORIAL.INDAPDX,hclin_registro.fecha,,case when hclin_registro.tipo='H' then  case when hclin_registro.ingreso ='I' then  0  else  10 end else case when hclin_registro.tipo='E' then 1 else case when hclin_registro.tipo='R' then 2 else case when hclin_registro.tipo='Q' then 3 else case when hclin_registro.tipo='F' then 4 else case when hclin_registro.tipo='L' then 5 else case when hclin_registro.tipo='P' then 6  end end end end end end end, hclin_reg_valor.orden"
				if i_rep.setsqlselect(sql_todo)=-1 then
					sql_todo=i_rep.describe('DataWindow.Table.Select')
				end if
				sql_todo=i_rep.describe('DataWindow.Table.Select')	
				if i_rep.retrieve()>0 then
					f_impresion(oles,i_rep,st.p_contador,st.p_clug,c_p,'C')
				end if
			end if
		Next
		//FIN COMPLETA
	else 
	//INCIA RESUMEN
		///ENCABEZADO
		paso=true
		lf_encab_agrupa('E',0,'','')
		rte_1.SaveDocument(ls_enc, FileTypeDoc! )
		ClipBoard('')
		abre = CREATE OLEObject
		IF abre.ConnectToNewObject("word.application.8") = 0 THEN
			abre.documents.open(ls_enc)
			abre.visible =false
			abre.ActiveDocument.Select()
			abre.Selection.Copy()
			abre.quit(0)
			abre.disconnectobject()
			setnull(abre)
			DESTROY abre
			GarbageCollect()
			FILEDELETE(ls_enc)
		else
			oles.quit(0)
			GarbageCollect()
			oles.DisconnectObject ( )
			setnull(oles)
			setnull(abre)
			DESTROY oles
			GarbageCollect()
			DESTROY abre
			GarbageCollect()
			return
		end if
		oles.ActiveDocument.Sections[1].Headers[wdHeaderFooterPrimary].Range.Paste	
		for c_p=1 to dw_2.rowcount()
			if dw_2.getitemstring(c_p,'sel_plant')='0' then continue
			choose case dw_2.getitemstring(c_p,'cual')
				case 'NQX'
					if l_qx='0' then
						i_rep.dataobject='dw_imp_historia_qx'
						i_rep.settransobject(sqlca)
						if st.p_contador<>dw_2.getitemnumber(c_p,'contador') and paso=true then //ingreso nuevo colocar el agrupamiento de ese ingreso
							oles.Selection.Font.Size = 10
							up_enc=lf_encab_agrupa('A',dw_2.getitemnumber(c_p,'contador'),dw_2.getitemstring(c_p,'clugar'),dw_2.getitemstring(c_p,'indapdx'))
							up_enc=f_rtf_a_txt(up_enc)				
							if isnull(up_enc) or up_enc='-1' then
								 up_enc=''
							end if
							oles.Selection.TypeText(up_enc+"~n")			
							paso=false
						end if
						st.p_contador=dw_2.getitemnumber(c_p,'contador')
						st.p_clug=dw_2.getitemstring(c_p,'clugar_his')
						if i_rep.retrieve(dw_2.getitemnumber(c_p,'numero_ingre'),dw_2.getitemstring(c_p,'clugar_his'))>0 then		
							oles.Selection.Font.Size = 10
							oles.Selection.Font.Bold = true
							oles.Selection.Font.Shading.BackgroundPatternColor= RGB(192,192,192)
							up_enc="~n"+"INFORME QUIRURGICO"+"~n"
							oles.Selection.TypeText(up_enc)
							oles.Selection.Font.Size = 8
							oles.selection.ParagraphFormat.Alignment = 3
							for c_h=1 to i_rep.rowcount()
								oles.Selection.Font.Bold = true
								up_enc='PROCEDIMIENTO ('+string( c_h)+'): '
								oles.Selection.TypeText(up_enc)
								oles.Selection.Font.Bold = false	
								up_enc="("+i_rep.getitemstring(c_h,'cod_cups')+' ) '+ i_rep.getitemstring(c_h,'descups')+"~n"
								oles.Selection.TypeText(up_enc)
								oles.Selection.Font.Bold = true
								oles.Selection.TypeText("ESPECIALISTA: ")
								oles.Selection.Font.Bold = false
								up_enc=i_rep.getitemstring(c_h,'especialista')+ ' REG Nro: '+i_rep.getitemstring(c_h,'Regespe')
								oles.Selection.TypeText(up_enc)
								if not isnull(i_rep.getitemstring(c_h,'tipoanestesia')) then
								oles.Selection.Font.Bold = true							
									oles.Selection.TypeText(" TIPO ANESTESIA: ")
									oles.Selection.Font.Bold = false
									up_enc=i_rep.getitemstring(c_h,'tipoanestesia')
									oles.Selection.TypeText(up_enc+"~n")
								end if
								if not isnull(i_rep.getitemstring(c_h,'anestesiologo')) then
									oles.Selection.Font.Bold = true							
									oles.Selection.TypeText("ANESTESIOLOGO: ")
									oles.Selection.Font.Bold = false
									up_enc=i_rep.getitemstring(c_h,'anestesiologo')+ ' REG Nro: '+i_rep.getitemstring(c_h,'reganes')
									oles.Selection.TypeText(up_enc)		
								end if
								if not isnull(i_rep.getitemstring(c_h,'auxiliarqx')) then
									oles.Selection.Font.Bold = true							
									oles.Selection.TypeText("~n"+"AYUDANTE: ")
									oles.Selection.Font.Bold = false
									up_enc=i_rep.getitemstring(c_h,'auxiliarqx')+ ' REG Nro: '+i_rep.getitemstring(c_h,'regayud')
									oles.Selection.TypeText(up_enc)		
								end if							
							next
							st.p_contador=dw_2.getitemnumber(c_p -1,'numero_ingre')
							st.p_clug=dw_2.getitemstring(c_p -1,'clugar_his')
							selectblob notasqx into :notas from qxcabacto where numero_ingre=:st.p_contador and clugar=:st.p_clug;
							up_enc=f_rtf_a_txt(string(notas))	
							if not isnull(up_enc) and up_enc<>'-1' then
								oles.Selection.Font.Bold = true							
								oles.Selection.TypeText("~n"+"NOTA QUIRURGICA "+"~n")
								oles.Selection.Font.Bold = false
								up_enc=up_enc+"~n"
								oles.Selection.TypeText(up_enc)									
							end if
							setnull(notas)
							
							selectblob notas_ane  into :notas from qxcabacto where numero_ingre=:st.p_contador and clugar=:st.p_clug;
							up_enc=f_rtf_a_txt(string(notas))	
							if not isnull(up_enc) and up_enc<>'-1' then
								oles.Selection.Font.Bold = true							
								oles.Selection.TypeText("NOTA ANESTESIA"+"~n")
								oles.Selection.Font.Bold = false
								up_enc=up_enc+"~n"
								oles.Selection.TypeText(up_enc)									
							end if
							setnull(notas)
						end if
					end if

				case 'EPI'
					st.p_contador=dw_2.getitemnumber(c_p,'contador')
					st.p_clug=dw_2.getitemstring(c_p,'clugar')
					if st.p_contador<>dw_2.getitemnumber(c_p,'contador') then //ingreso nuevo colocar el agrupamiento de ese ingreso
						oles.Selection.Font.Size = 10
						up_enc=lf_encab_agrupa('A',dw_2.getitemnumber(c_p,'contador'),dw_2.getitemstring(c_p,'clugar'),dw_2.getitemstring(c_p,'indapdx'))
						up_enc=f_rtf_a_txt(up_enc)				
						if isnull(up_enc) or up_enc='-1' then continue
						oles.Selection.TypeText(up_enc+"~n")						
					end if
					selectblob resumeningreso into :notas from evolucionhc where contador=:st.p_contador and clugar=:st.p_clug;
					long ciclos,tam,i,newp
					blob b
					string txt
					tam = Len(notas)
					If tam> 30000 THEN
						If Mod(tam, 30000) = 0 THEN
							ciclos = tam/30000
						else
							ciclos= (tam/30000) + 1
						End if
					else
						ciclos= 1
					end if
					newp = 1
					For i = 1 to ciclos
						setnull(b)
						setnull(txt)
						b = blobmid(notas,newp,30000)
						txt=string(b)
						up_enc=f_rtf_a_txt(txt)	
						if (not isnull(up_enc) or up_txt<>'-1') and i=1 then
							oles.Selection.Font.Size = 10
							oles.Selection.Font.Bold = true
							oles.selection.ParagraphFormat.Alignment = 1
							oles.Selection.Font.Shading.BackgroundPatternColor= RGB(192,192,192)
							oles.Selection.TypeText("EPICRISIS"+"~n")
							oles.Selection.Font.Size = 8
							oles.selection.ParagraphFormat.Alignment = 3					
							oles.Selection.Font.Bold = false
							oles.Selection.TypeText(up_enc)		
						else
							oles.Selection.Font.Size = 8
							oles.selection.ParagraphFormat.Alignment = 3
							if not isnull(up_enc) or up_txt<>'-1'  then oles.Selection.TypeText(up_enc)										
						end if				
						newp += 30000
					next
					oles.Selection.Font.Size = 8
					oles.selection.ParagraphFormat.Alignment = 3
					oles.Selection.TypeText("~n")		
					setnull(notas)
			case else
					st.p_contador=dw_1.getitemnumber(c_p,'contador')
					st.p_clug=dw_1.getitemstring(c_p,'clugar')
					if g_motor='postgres' then
						i_rep.dataobject='dw_imp_historia_agr_postgres'
					else
						i_rep.dataobject="dw_imp_historia_agr"
					end if
					i_rep.settransobject(sqlca)
					if st.p_contador<>dw_2.getitemnumber(c_p,'contador')  or paso=true then //ingreso nuevo colocar el agrupamiento de ese ingreso
						oles.Selection.Font.Size = 10
						up_enc=lf_encab_agrupa('A',dw_2.getitemnumber(c_p,'contador'),dw_2.getitemstring(c_p,'clugar'),dw_2.getitemstring(c_p,'indapdx'))
						up_enc=f_rtf_a_txt(up_enc)				
						if isnull(up_enc) or up_enc='-1' then continue
						oles.Selection.TypeText(up_enc+"~n")		
						paso=false
					end if					
					if i_rep.retrieve(dw_2.getitemnumber(c_p,'contador'),dw_2.getitemstring(c_p,'clugar'),dw_2.getitemstring(c_p,'codplantilla'),'0')>0 then
						f_impresion(oles,i_rep,st.p_contador,st.p_clug,c_p,'E')
					end if
			end choose
		next
		oles.Selection.TypeParagraph()
	end if	//FIN RESUMEN
//	oles.ActiveDocument.ExportAsFixedFormat(ls_impr, 17)
	oles.ActiveDocument.saveas(ls_impr, 17)
	oles.ActiveDocument.Close(0)
    oles.quit(0)
	GarbageCollect ( )
    oles.DisconnectObject ( )
	setnull(oles)
	DESTROY oles
	GarbageCollect()
 	run(gs_pdf+" "+ls_impr,maximized!)
else //oles
	oles.DisconnectObject ( )
	setnull(oles)
	DESTROY oles
	GarbageCollect()
end if
close(parent)
end event

type pb_2 from picturebutton within w_print_histor_ole_sec
integer x = 2203
integer y = 1480
integer width = 146
integer height = 128
integer taborder = 90
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

event clicked;FILEDELETE(ls_impr)
close(parent)
end event

type rte_1 from richtextedit within w_print_histor_ole_sec
boolean visible = false
integer x = 2880
integer y = 20
integer width = 1198
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_wordwrap = true
long init_inputfieldbackcolor = 33554431
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
long init_leftmargin = 25000
long init_topmargin = 1000
long init_rightmargin = 2000
long init_bottommargin = 1000
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_print_histor_ole_sec
event cambia_estado ( string dato,  long fila_ante,  string filtro_ante )
event pe_cambio_plant ( long fila_ant,  string filtro_ante )
integer x = 32
integer y = 184
integer width = 4178
integer height = 1280
integer taborder = 40
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

type dw_2 from datawindow within w_print_histor_ole_sec
event cambia_estado ( string dato,  long fila_ante,  string filtro_ante )
event pe_cambio_plant ( long fila_ant,  string filtro_ante )
boolean visible = false
integer x = 32
integer y = 184
integer width = 4178
integer height = 1280
integer taborder = 50
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

