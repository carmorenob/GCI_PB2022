$PBExportHeader$w_impresion_masiva.srw
forward
global type w_impresion_masiva from window
end type
type dw_rte from datawindow within w_impresion_masiva
end type
type sle_1 from singlelineedit within w_impresion_masiva
end type
type ddlb_archivos from dropdownlistbox within w_impresion_masiva
end type
type dw_4 from datawindow within w_impresion_masiva
end type
type st_3 from statictext within w_impresion_masiva
end type
type sle_log from singlelineedit within w_impresion_masiva
end type
type dw_emp from datawindow within w_impresion_masiva
end type
type sle_dir from singlelineedit within w_impresion_masiva
end type
type cb_dir from commandbutton within w_impresion_masiva
end type
type rb_defecto from radiobutton within w_impresion_masiva
end type
type st_2 from statictext within w_impresion_masiva
end type
type dw_3 from datawindow within w_impresion_masiva
end type
type barra from hprogressbar within w_impresion_masiva
end type
type st_1 from statictext within w_impresion_masiva
end type
type pb_2 from picturebutton within w_impresion_masiva
end type
type pb_1 from picturebutton within w_impresion_masiva
end type
type dw_2 from datawindow within w_impresion_masiva
end type
type em_2 from editmask within w_impresion_masiva
end type
type em_1 from editmask within w_impresion_masiva
end type
type pb_traer from picturebutton within w_impresion_masiva
end type
type dw_1 from datawindow within w_impresion_masiva
end type
type gb_6 from groupbox within w_impresion_masiva
end type
type gb_1 from groupbox within w_impresion_masiva
end type
end forward

global type w_impresion_masiva from window
integer width = 3182
integer height = 1704
boolean titlebar = true
string title = "Impresion Masiva HC"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "r_imprimem.ico"
boolean center = true
dw_rte dw_rte
sle_1 sle_1
ddlb_archivos ddlb_archivos
dw_4 dw_4
st_3 st_3
sle_log sle_log
dw_emp dw_emp
sle_dir sle_dir
cb_dir cb_dir
rb_defecto rb_defecto
st_2 st_2
dw_3 dw_3
barra barra
st_1 st_1
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
em_2 em_2
em_1 em_1
pb_traer pb_traer
dw_1 dw_1
gb_6 gb_6
gb_1 gb_1
end type
global w_impresion_masiva w_impresion_masiva

type variables
datawindowchild idw_emp
string l_ruta,ls_path='C:\windows\temp\',ls_impr, ls_tipdoc,ls_docu
string sql_historia,ls_imp
datetime ld_faten
end variables

forward prototypes
public function string lf_reemp_campos (string p_todo, datastore p_dw)
public function string lf_encab_agrupa (string p_tipo, long p_contador, string p_clugar, string p_indapdx)
end prototypes

public function string lf_reemp_campos (string p_todo, datastore p_dw);//long num_object,largo,k,numeroingreso,j
string reemp//,objects,cual,coltype,apegar,clug
//blob trae
//
//datastore ds_objects
//ds_objects=create datastore
//ds_objects.dataobject='dw_campos_de_rtfs'
//num_object=f_objects_ds(p_dw,ds_objects)
//f_sel_rtf(rte_local)
//rte_local.clearall()
//f_sel_rtf(rte_local)
//rte_local.clearall()
//for j=1 to p_dw.rowcount()
//	p_dw.setrow(j)
//	f_pega_a_rtf(rte_local,p_todo,2)
//	for k=1 to ds_objects.rowcount()
//		cual=ds_objects.getitemstring(k,'nombre')
//
//		reemp=rte_local.InputFieldLocate ( first! , cual )
//		do while reemp<>'' and reemp=cual
//			rte_local.InputFieldDeleteCurrent ( )
//			choose case ds_objects.getitemstring(k,'tipo')
//   			   case 'column','compute'
//					choose case ds_objects.getitemstring(k,'coltype')
//						case 'imagen'
//							if ds_objects.getitemnumber(k,'largo')>255 then
//								apegar=string(trae)
//							else//es menor a 255
//								apegar=p_dw.getitemstring(j,cual)
//							end if
//							//string arch,nombre
//							rte_local.InsertPicture ( apegar)
//							setnull( apegar)
//
//						case 'char'
//							if ds_objects.getitemnumber(k,'largo')>255 then
//								choose case lower(cual)
//									case 'notas_ane'
//										numeroingreso=p_dw.getitemnumber(j,'numero_ingre')
//										clug=p_dw.getitemstring(1,'clugar')
//										sqlca.autocommit=true
//										selectblob notas_ane into :trae from qxcabacto where numero_ingre=:numeroingreso and clugar=:clug;
//										sqlca.autocommit=false
//									case 'notasqx'
//										numeroingreso=p_dw.getitemnumber(j,'numero_ingre')
//										clug=p_dw.getitemstring(1,'clugar')
//										sqlca.autocommit=true
//										selectblob notasqx into :trae from qxcabacto where numero_ingre=:numeroingreso and clugar=:clug;
//										sqlca.autocommit=false							
//								end choose
//									apegar=string(trae)
//							else//es menor a 255
//								apegar=p_dw.getitemstring(j,cual)
//							end if
//						case 'long','number','real'
//							long ojo
//							ojo=p_dw.getitemnumber(j,cual)
//							apegar=string(ojo)
//						case 'decimal'
//							apegar=string(p_dw.getitemdecimal(j,cual))
//						case 'datetime'
//							choose case cual
//								case 'fechainicio','fechafin', 'fecha_nace'
//									apegar=string(p_dw.getitemdatetime(j,cual),'dd/mm/yyyy')
//								case 'horainicio','horafin'
//									apegar=string(p_dw.getitemdatetime(j,cual),'HH:mm')
//								case else
//									apegar=string(p_dw.getitemdatetime(j,cual))
//							end choose
//						case 'date'
//							apegar=string(p_dw.getitemdate(j,cual))
//						case 'time'
//							apegar=string(p_dw.getitemtime(j,cual))
//					end choose
//			end choose
//			
//			if isnull(apegar) then apegar=''
//			f_pega_a_rtf(rte_local,apegar,1)
//			reemp=rte_local.InputFieldLocate ( next! , cual )
//			setnull(apegar)
//		loop
//	next
//next
//destroy ds_objects
//reemp=rte_local.copyrtf(false,Detail!)
//f_sel_rtf(rte_local)
//rte_local.clearall()
//f_sel_rtf(rte_local)
//rte_local.clearall()
return reemp
end function

public function string lf_encab_agrupa (string p_tipo, long p_contador, string p_clugar, string p_indapdx);blob formato
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
		dw.retrieve(ls_tipdoc,ls_docu,ld_faten)
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

on w_impresion_masiva.create
this.dw_rte=create dw_rte
this.sle_1=create sle_1
this.ddlb_archivos=create ddlb_archivos
this.dw_4=create dw_4
this.st_3=create st_3
this.sle_log=create sle_log
this.dw_emp=create dw_emp
this.sle_dir=create sle_dir
this.cb_dir=create cb_dir
this.rb_defecto=create rb_defecto
this.st_2=create st_2
this.dw_3=create dw_3
this.barra=create barra
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_2=create dw_2
this.em_2=create em_2
this.em_1=create em_1
this.pb_traer=create pb_traer
this.dw_1=create dw_1
this.gb_6=create gb_6
this.gb_1=create gb_1
this.Control[]={this.dw_rte,&
this.sle_1,&
this.ddlb_archivos,&
this.dw_4,&
this.st_3,&
this.sle_log,&
this.dw_emp,&
this.sle_dir,&
this.cb_dir,&
this.rb_defecto,&
this.st_2,&
this.dw_3,&
this.barra,&
this.st_1,&
this.pb_2,&
this.pb_1,&
this.dw_2,&
this.em_2,&
this.em_1,&
this.pb_traer,&
this.dw_1,&
this.gb_6,&
this.gb_1}
end on

on w_impresion_masiva.destroy
destroy(this.dw_rte)
destroy(this.sle_1)
destroy(this.ddlb_archivos)
destroy(this.dw_4)
destroy(this.st_3)
destroy(this.sle_log)
destroy(this.dw_emp)
destroy(this.sle_dir)
destroy(this.cb_dir)
destroy(this.rb_defecto)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.barra)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.pb_traer)
destroy(this.dw_1)
destroy(this.gb_6)
destroy(this.gb_1)
end on

event open;if ls_pro=32 then Registryget ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DIRECTORIO", regstring!, l_ruta)
if ls_pro=64 then RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "DIRECTORIO", regstring!, l_ruta)
///Para borrar archivos
Integer index

ddlb_archivos.DirList (ls_path+"*.doc",0)
For index=1 To ddlb_archivos.totalItems ( )
     FileDelete ( ddlb_archivos.text(index))
Next

ddlb_archivos.DirList (ls_path+"*.pdf",0)
For index=1 To ddlb_archivos.totalItems ( )
     FileDelete ( ddlb_archivos.text(index))
Next

dw_2.retrieve()

end event

type dw_rte from datawindow within w_impresion_masiva
boolean visible = false
integer x = 2354
integer y = 200
integer width = 137
integer height = 72
integer taborder = 50
string title = "none"
string dataobject = "dw_partfs"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type sle_1 from singlelineedit within w_impresion_masiva
integer x = 41
integer y = 1540
integer width = 1797
integer height = 68
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

type ddlb_archivos from dropdownlistbox within w_impresion_masiva
boolean visible = false
integer x = 1929
integer y = 204
integer width = 411
integer height = 88
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_impresion_masiva
boolean visible = false
integer x = 2587
integer y = 220
integer width = 361
integer height = 64
integer taborder = 60
string title = "none"
string dataobject = "dr_historia_txt"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_3 from statictext within w_impresion_masiva
integer x = 1669
integer y = 464
integer width = 96
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Log"
boolean focusrectangle = false
end type

type sle_log from singlelineedit within w_impresion_masiva
integer x = 1769
integer y = 452
integer width = 1225
integer height = 72
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event constructor;text='Log'+string(today(),'dd-mm-yyyy')+'.txt'
end event

type dw_emp from datawindow within w_impresion_masiva
integer x = 32
integer y = 148
integer width = 1326
integer height = 136
integer taborder = 20
string title = "none"
string dataobject = "dw_empresa_contrato"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('codemp',idw_emp)
idw_emp.settransobject(sqlca)
idw_emp.retrieve('%')
insertrow(1)
end event

event itemchanged;//this.accepttext()
//string codem,l_null,regim
//setnull(l_null)
//
//if this.getcolumnname() = "codemp" then
//	this.accepttext()
//	setitem(1,'ctreg',l_null)
//	setitem(1,'codcontrato',l_null)
//	codem=this.getitemstring(1,"codemp")
//	dw_reg.retrieve(codem)
////	gc_regimen.retrieve(codem)
//end if
//if this.getcolumnname() = "ctreg" then
//	this.accepttext()
//	codem=this.getitemstring(1,"codemp")
//	setitem(row,'codcontrato',l_null)
//	regim=this.getitemstring(1,"ctreg")
//	dw_con.retrieve(codem,regim)
//end if
//if tab_1.tp_2.cbx_activos.checked then
//	dw_con.setfilter('estado="1"')
//else
//	dw_con.setfilter('')
//end if
//dw_con.filter()
end event

type sle_dir from singlelineedit within w_impresion_masiva
integer x = 1765
integer y = 368
integer width = 1225
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event constructor;string ruta_rips

SELECT cadena into :ruta_rips
FROM parametros_gen
WHERE (((codigo_para)=75));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 1')
	return 
end if
text=ruta_rips
end event

type cb_dir from commandbutton within w_impresion_masiva
integer x = 1669
integer y = 368
integer width = 82
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "..."
end type

event clicked;GetFolder ( 'Directorio a Colocar RIPS', sle_dir.text )

end event

type rb_defecto from radiobutton within w_impresion_masiva
integer x = 1467
integer y = 368
integer width = 155
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "En:"
boolean checked = true
end type

event clicked;sle_dir.enabled=true
cb_dir.enabled=true
end event

type st_2 from statictext within w_impresion_masiva
integer x = 2734
integer y = 588
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_impresion_masiva
integer x = 37
integer y = 672
integer width = 3054
integer height = 852
integer taborder = 160
string title = "none"
string dataobject = "dw_pac_cohorte_hc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event buttonclicked;if rowcount()=0 then return
long j
if dwo.text='Selec.' then
	dwo.text='Desel.'
	for j=1 to rowcount()
		setitem(j,'esco',1)
	next
else
	dwo.text='Selec.'
	for j=1 to rowcount()
		setitem(j,'esco',0)
	next
end if

end event

type barra from hprogressbar within w_impresion_masiva
boolean visible = false
integer x = 1435
integer y = 576
integer width = 937
integer height = 68
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_1 from statictext within w_impresion_masiva
integer x = 2382
integer y = 592
integer width = 343
integer height = 44
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Registros"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_impresion_masiva
integer x = 2098
integer y = 52
integer width = 146
integer height = 128
integer taborder = 140
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

type pb_1 from picturebutton within w_impresion_masiva
integer x = 2267
integer y = 52
integer width = 146
integer height = 128
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "print.GIF"
string disabledname = "d_print.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;double  l_j,li_i,i_numarc
integer li_rtn	
string ls_tipo_impr='1'
string p_sql_todo, ldt,ls_sal,dir_sale

barra.Position = 0
barra.minposition=0
barra.maxposition=dw_3.rowcount()
barra.SetRange (0,10)
barra.visible=true

dw_3.setfilter('esc=1')
dw_3.filter()
dir_sale=sle_dir.text+sle_log.text
i_numarc = fileopen(dir_sale,LineMode!,write!)
if i_numarc=-1 then
	messagebox("Atención",'No se puede crear el archivo de log')
	return
end if
filewrite(i_numarc,'Inicia '+String(Today(), "d/mm/yyyy hh:mm:ss"))
for li_i=1 to dw_3.rowcount()
	dw_4.retrieve(dw_3.getitemstring(li_i,'clugar'),dw_3.getitemnumber(li_i,'contador'), dw_3.getitemnumber(li_i,'nregistro'),'0')
	if dw_4.rowcount()>0 then
		ls_tipdoc=dw_3.getitemstring(li_i,'tipodoc')
		ls_docu=dw_3.getitemstring(li_i,'documento')
		ld_faten=dw_3.getitemdatetime(li_i,'fecha_reg')
		ldt=string( ld_faten)
		ldt=f_remplaza(ldt,'/','')
		ldt=f_remplaza(ldt,' ','_')
		ldt=f_remplaza(ldt,':','')
		ls_sal=sle_dir.text+ls_tipdoc+'_'+ls_docu+'_'+ldt+".pdf"			
		sle_1.text=ls_tipdoc+'_'+ls_docu+'_'+ldt+string(li_i)
				
		dw_4.Object.DataWindow.Export.PDF.Method = NativePDF!
		dw_4.Object.DataWindow.Export.PDF.NativePDF.Restrictions = 'noprint!,nocopy!'
		li_rtn =dw_4.SaveAs(ls_sal,PDF!, true)

		filewrite(i_numarc,'Generado '+ls_sal+'---> '+String(Today(), "dd/mm/yyyy hh:mm:ss"))
		if l_j >dw_1.rowcount() then l_j=dw_1.rowcount()
	end if
	dw_3.setitem(li_i,'esc',0)
	barra.position=li_i
next
if isvalid(w_reporte_gral) then close(w_reporte_gral)
filewrite(i_numarc,'Finaliza '+String(Today(), "d/mm/yyyy hh:mm:ss"))
fileclose(i_numarc)
messagebox("Proceso terminado",'Revise el archivo de log para ver Resultados')

end event

type dw_2 from datawindow within w_impresion_masiva
integer x = 37
integer y = 328
integer width = 1362
integer height = 312
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_hc_impresion_masiva"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type em_2 from editmask within w_impresion_masiva
integer x = 1445
integer y = 196
integer width = 384
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "01/01/2000~~31/12/2020"
end type

event constructor;if isdate("31/"+string(today(),"mm/yyyy")) then
	this.text="31/"+string(today(),"mm/yyyy")
else
	if isdate("30/"+string(today(),"mm/yyyy")) then
		this.text="30/"+string(today(),"mm/yyyy")
	else
		if isdate("29/"+string(today(),"mm/yyyy")) then
			this.text="29/"+string(today(),"mm/yyyy")
		else
			this.text="28/"+string(today(),"mm/yyyy")
		end if
	end if
end if

end event

type em_1 from editmask within w_impresion_masiva
integer x = 1440
integer y = 96
integer width = 384
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "01/01/2000~~31/12/2020"
end type

event constructor;this.text="01/"+string(today(),"mm/yyyy")
end event

type pb_traer from picturebutton within w_impresion_masiva
integer x = 1934
integer y = 52
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                 &t"
boolean originalsize = true
string picturename = "refrescar.GIF"
string disabledname = "d_refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Traer Registros [Alt+T]"
end type

event clicked;datetime fecha1,fecha2
string ls_filtro,ls_sql
boolean lb_pase=false
int l_i

for l_i=1 to dw_2.rowcount()
	if  dw_2.getitemnumber(l_i,'selec') =0 then continue
	if lb_pase then
		ls_filtro=ls_filtro+','+dw_2.getitemstring(l_i,"codplantilla")
	else
		lb_pase=true
		ls_filtro=ls_filtro+dw_2.getitemstring(l_i,"codplantilla")
	end if
next
if isnull(ls_filtro) then
	pb_1.enabled=false
	return 
	messagebox('Atención','No hay Registros con estos criterios')
end if

dw_3.retrieve(dw_1.getitemstring(1,1),dw_emp.getitemstring(1,1),ls_filtro,datetime(em_1.text),datetime(em_2.text))

st_2.text=string(dw_3.rowcount())

if dw_3.rowcount()>0 then
	pb_1.enabled=true
else
	pb_1.enabled=false
end if
end event

type dw_1 from datawindow within w_impresion_masiva
integer x = 32
integer y = 20
integer width = 1134
integer height = 128
integer taborder = 10
string title = "none"
string dataobject = "dw_cohortes_impresion"
boolean border = false
borderstyle borderstyle = styleshadowbox!
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;dw_2.setfilter("codgetareo='"+data+"'")
dw_2.filter()
end event

type gb_6 from groupbox within w_impresion_masiva
integer x = 1408
integer y = 24
integer width = 471
integer height = 284
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fechas a Buscar:"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_impresion_masiva
integer x = 1431
integer y = 312
integer width = 1650
integer height = 248
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Emitir"
end type

