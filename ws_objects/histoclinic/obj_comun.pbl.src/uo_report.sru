$PBExportHeader$uo_report.sru
forward
global type uo_report from nonvisualobject
end type
end forward

global type uo_report from nonvisualobject
end type
global uo_report uo_report

type variables
string cod_rep,nombre_rep,tipo_rep,titulo,tam_papel,orienta,i_clugar, i_tempo_mod, tmp_file_mod, tmp_file
private string  i_tempo
boolean dialogo=false,v_preliminar=false,enabled=true,cambiar_prop=true
long tam_imp=100,zoom=100
int num_cop=1
dec mar_izq,mar_der,mar_sup,mar_inf
real factor_umed=1/1000
uo_datastore dw_repadm,dw_rep
any param[]

end variables

forward prototypes
public function string sintax_de_camino (string camino)
public function integer f_trae_prop ()
public function integer f_guarda_prop ()
public function integer f_aplica_prop ()
public function integer inicia ()
public function integer imprimir (any parametros[], string profesional, string qr)
end prototypes

public function string sintax_de_camino (string camino);string todo,ls_temp
long tamanyo,donde
int archivo
tamanyo = FileLength(camino)
archivo = fileopen(camino,TextMode!)
if archivo=-1 then 
	messagebox("Error","No se puede hallar el archivo correspondiente a este reporte, revise la configuración de los reportes de la tabla Rep_Adm")
	fileclose(archivo)
	return '!'
end if
filereadex(archivo,todo)

fileclose(archivo)

donde=pos(todo,"release ",1)
todo=right(todo, len(todo) - donde +1)
if nom_regis="DEMO" then 
	ls_temp="**** Licencia de DEMOSTRACION ****"
else
	ls_temp=nom_regis
end if
//todo+='~r~ntext(band=footer alignment="0" text="'+temp+'" border="0" color="0" x="8" y="8" height="44" width="1600"  name=t_anti_robo  font.face="Small Fonts" font.height="-7" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127" )'
return todo
end function

public function integer f_trae_prop ();string v_prel,ver_dialo,cambia_prop
setnull(mar_izq)
setnull(mar_der)
setnull(mar_sup)
setnull(mar_inf)
setnull(tam_papel)
setnull(orienta)
setnull(num_cop)
choose case tipo_rep
	case 'consenti!'
		select v_prelim,ver_dialogo,cambiar_prop,tamanyo,tam_papel,orienta,copias,mar_izq,mar_der,mar_sup,mar_inf 
		into :v_prel,:ver_dialo,:cambia_prop,:tam_imp,:tam_papel,:orienta,:num_cop,:mar_izq,:mar_der,:mar_sup,:mar_inf
		from proced where codproced=:cod_rep;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo Documentos",sqlca.sqlerrtext)
			return -1
		end if
		v_preliminar=false
		if v_prel='1' then v_preliminar=true
		dialogo=false
		if ver_dialo='1' then dialogo=true
		cambiar_prop=false
		if cambia_prop='1' then cambiar_prop=true
		
	case 'documento!'
		select v_prelim,ver_dialogo,cambiar_prop,tamanyo,tam_papel,orienta,copias,mar_izq,mar_der,mar_sup,mar_inf 
		into :v_prel,:ver_dialo,:cambia_prop,:tam_imp,:tam_papel,:orienta,:num_cop,:mar_izq,:mar_der,:mar_sup,:mar_inf
		from documentos where coddoc=:cod_rep and clugar=:clugar;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo Documentos",sqlca.sqlerrtext)
			return -1
		end if
		v_preliminar=false
		if v_prel='1' then v_preliminar=true
		dialogo=false
		if ver_dialo='1' then dialogo=true
		cambiar_prop=false
		if cambia_prop='1' then cambiar_prop=true
	case 'interno!'
		select v_prelim,ver_dialogo,cambiar_prop,tamanyo,tam_papel,orienta,copias,mar_izq,mar_der,mar_sup,mar_inf 
		into :v_prel,:ver_dialo,:cambia_prop,:tam_imp,:tam_papel,:orienta,:num_cop,:mar_izq,:mar_der,:mar_sup,:mar_inf
		from rep_interno where cod_rep=:cod_rep and clugar=:clugar;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo Rep_Interno",sqlca.sqlerrtext)
			return -1
		end if
		v_preliminar=false
		if v_prel='1' then v_preliminar=true
		dialogo=false
		if ver_dialo='1' then dialogo=true
		cambiar_prop=false
		if cambia_prop='1' then cambiar_prop=true
	case 'menu!'
		select cambiar_prop,tamanyo,tam_papel,orienta,copias,mar_izq,mar_der,mar_sup,mar_inf 
		into :cambia_prop,:tam_imp,:tam_papel,:orienta,:num_cop,:mar_izq,:mar_der,:mar_sup,:mar_inf
		from rep_adm where cod_rep=:cod_rep;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo Rep_Adm",sqlca.sqlerrtext)
			return -1
		end if
		v_preliminar=true
		dialogo=false
		cambiar_prop=false
		if cambia_prop='1' then cambiar_prop=true
	case 'externo!'
		v_preliminar=true
		dialogo=false
		cambiar_prop=false
	case else
	
end choose
boolean cambio
if isnull(num_cop) then num_cop=1
choose case dw_rep.describe("datawindow.units")
	case '0'//powerunits
		factor_umed=1/174
	case '1'//pixels
		factor_umed=1/38
	case '2'//pulgadas
		factor_umed=1/395
	case '3'//centimetros
		factor_umed=1/1000
end choose
zoom=long(dw_rep.describe("datawindow.print.preview.zoom"))
if isnull(mar_izq) then 
	mar_izq=real(dw_rep.describe("datawindow.print.margin.left"))*factor_umed
	cambio=true
end if
if isnull(mar_der) then 
	mar_der=real(dw_rep.describe("datawindow.print.margin.right"))*factor_umed
	cambio=true
end if
if isnull(mar_sup) then 
	mar_sup=real(dw_rep.describe("datawindow.print.margin.top"))*factor_umed
	cambio=true
end if
if isnull(mar_inf) then 
	mar_inf=real(dw_rep.describe("datawindow.print.margin.bottom"))*factor_umed
	cambio=true
end if
if isnull(tam_papel) then 
	tam_papel=dw_rep.describe("datawindow.print.paper.size")
	cambio=true
end if
if isnull(orienta) then 
	orienta=dw_rep.describe("datawindow.print.orientation")
	cambio=true
end if
f_aplica_prop()
if cambio then f_guarda_prop()
return 1
end function

public function integer f_guarda_prop ();if not cambiar_prop then return 0
string v_prel='0',ver_dialo='0'
if v_preliminar then v_prel='1'
if dialogo then ver_dialo='1'
choose case tipo_rep
	case 'documento!'
		update documentos set
		v_prelim=:v_prel,ver_dialogo=:ver_dialo,tamanyo=:tam_imp,tam_papel=:tam_papel,
		orienta=:orienta,copias=:num_cop,mar_izq=:mar_izq,mar_der=:mar_der,mar_sup=:mar_sup,
		mar_inf =:mar_inf
		where coddoc=:cod_rep and clugar=:clugar;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Documentos",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case 'interno!'
		update rep_interno set
		v_prelim=:v_prel,ver_dialogo=:ver_dialo,tamanyo=:tam_imp,tam_papel=:tam_papel,
		orienta=:orienta,copias=:num_cop,mar_izq=:mar_izq,mar_der=:mar_der,mar_sup=:mar_sup,
		mar_inf =:mar_inf
		where cod_rep=:cod_rep and clugar=:clugar;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Rep_Interno",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case 'menu!'
		update rep_adm set
		tamanyo=:tam_imp,tam_papel=:tam_papel,
		orienta=:orienta,copias=:num_cop,mar_izq=:mar_izq,mar_der=:mar_der,mar_sup=:mar_sup,
		mar_inf =:mar_inf
		where cod_rep=:cod_rep ;
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando Rep_Adm",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case 'externo!'
	case else
end choose
commit;
return 1
end function

public function integer f_aplica_prop ();dw_rep.modify("datawindow.print.margin.left="+string(int(mar_izq/factor_umed)))
dw_rep.modify("datawindow.print.margin.right="+string(int(mar_der/factor_umed)))
dw_rep.modify("datawindow.print.margin.top="+string(int(mar_sup/factor_umed)))
dw_rep.modify("datawindow.print.margin.bottom="+string(int(mar_inf/factor_umed)))
dw_rep.modify('datawindow.print.paper.size='+tam_papel)
dw_rep.modify('datawindow.print.orientation='+orienta)
dw_rep.modify("datawindow.zoom="+string(tam_imp))
dw_rep.modify("datawindow.print.preview.zoom="+string(zoom))
dw_rep.modify("datawindow.print.copies="+string(num_cop))
return 1
end function

public function integer inicia ();if tipo_rep='' then
	messagebox("Atención",'No definió el tipo de reporte para '+nombre_rep)
	return -1
end if
if cod_rep='' and tipo_rep<>'externo!' then
	messagebox("Atención",'No definió el código de reporte para '+nombre_rep)
	return -1
end if
string carreta
blob repo
choose case tipo_rep
	case 'consenti!'
		titulo='Reporte '+nombre_rep
		sqlca.autocommit=true
		Selectblob consenti  into :repo from proced where codproced =:cod_rep;
		sqlca.autocommit=false
		if sqlca.sqlcode=-1 then 
			messagebox('error leyendo consetimiento proced ',sqlca.sqlerrtext)
			return -1
		end if
		carreta=string(repo)
		carreta=right(carreta, len(carreta) - pos(carreta,"release ",1) +1)
		if dw_rep.create(carreta)=-1 then 
			enabled=false
			return -1
		else
			dw_rep.settransobject(sqlca)
			enabled=true
			f_trae_prop()
			return 1
		end if
	case 'cheque!'
		string cban,tcta,ncta
		cban=cod_rep
		tcta=nombre_rep
		ncta=i_clugar
		selectblob reporte into :repo from tesocuentasban where (((codbanco)=:cban) and ((tipo_cuenta)=:tcta) and ((numcuenta)=:ncta));
		sqlca.autocommit=false
		if sqlca.sqlcode=-1 then 
			messagebox('error leyendo rep_interno',sqlca.sqlerrtext)
			return -1
		elseif sqlca.sqlcode = 100 then 
			messagebox('error leyendo rep_interno','No existe el reporte '+cod_rep+' para el lugar '+i_clugar)
			return -1			
		end if
		carreta=string(repo)
		carreta=right(carreta, len(carreta) - pos(carreta,"release ",1) +1)
		if dw_rep.create(carreta)=-1 then 
			enabled=false
			return -1
		else
			dw_rep.settransobject(sqlca)
			enabled=true
			f_trae_prop()
			return 1
		end if

	case 'retencion!'
		string nombre_arch
		sqlca.autocommit=true
		selectblob reporte into :repo from teso_rep_rete_cb where cod_rep=:cod_rep;
		sqlca.autocommit=false
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo reporte en teso_rep_rete_cb",sqlca.sqlerrtext)
			enabled=false
			return -1
		end if
		titulo='Tesorería - '+nombre_rep
		carreta=string(repo)
		carreta=right(carreta, len(carreta) - pos(carreta,"release ",1) +1)
		if dw_rep.create(carreta)=-1 then 
			enabled=false
			return -1
		else
			dw_rep.settransobject(sqlca)
			enabled=true
			f_trae_prop()
			return 1
		end if
	case 'documento!'
		titulo='Reporte '+nombre_rep
		if f_lee_archivo(cod_rep,i_clugar,nombre_rep,dw_rep)=-1 then
			enabled=false
			return -1
		else
			enabled=true
			f_trae_prop()
			return 1
		end if
	case 'interno!'
		titulo='Reporte '+nombre_rep
		sqlca.autocommit=true
		selectblob reporte into :repo from rep_interno where cod_rep=:cod_rep and clugar=:i_clugar;
		sqlca.autocommit=false
		if sqlca.sqlcode=-1 then 
			messagebox('error leyendo rep_interno',sqlca.sqlerrtext)
			return -1
		elseif sqlca.sqlcode = 100 then 
			messagebox('error leyendo rep_interno','No existe el reporte '+cod_rep+' para el lugar '+i_clugar)
			return -1			
		end if
		carreta=string(repo)
		carreta=right(carreta, len(carreta) - pos(carreta,"release ",1) +1)
		if dw_rep.create(carreta)=-1 then 
			enabled=false
			return -1
		else
			dw_rep.settransobject(sqlca)
			enabled=true
			f_trae_prop()
			return 1
		end if
	case 'menu!'
		if not isvalid(dw_repadm) then
			dw_repadm=create uo_datastore
			dw_repadm.dataobject='dw_rep'
			dw_repadm.settransobject(sqlca)
		end if
		if dw_repadm.retrieve(cod_rep)<=0 then
			messagebox("Error de reportes",'Revise la configuración del reporte: '+cod_rep+' en la tabla Rep_Adm')
			enabled=false
			return -1
		end if
		titulo=wordcap(dw_repadm.getitemstring(1,'modulo'))+'-Reportes: '+wordcap(dw_repadm.getitemstring(1,'descripcion'))
		sqlca.autocommit=true
		selectblob reporte into :repo from rep_adm where cod_rep=:cod_rep;
		sqlca.autocommit=false
		if sqlca.sqlcode=-1 then 
			messagebox('error leyendo rep_adm',sqlca.sqlerrtext)
			return -1
		end if
		carreta=string(repo)
		carreta=right(carreta, len(carreta) - pos(carreta,"release ",1) +1)
		if dw_rep.create(carreta)=-1 then 
			enabled=false
			return -1
		end if
		dw_rep.settransobject(sqlca)
	case 'externo!'
		string nomarch,camino,dire
		if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DIR_REP_ASIS", Regstring!, dire)
		if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "DIR_REP_ASIS", Regstring!, dire)
		nomarch=camino
		if GetFileOpenName("Buscar Reporte", camino, nomarch, "SRD","Reportes (*.SRD),*.SRD",dire) <> 1 then 
			enabled=false
			return -1
		end if
		titulo='-Reportes: '+camino
		carreta=sintax_de_camino(camino)
		if carreta='!' or carreta='' then 
			enabled=false
			return -1
		end if
		if dw_rep.create(carreta)=-1 then 
			enabled=false
			return -1
		end if
		dw_rep.settransobject(sqlca)
	case else
		messagebox("Atención",'El tipo de reporte para '+nombre_rep+' es inválido.')
		enabled=false
		return -1
end choose
f_trae_prop()
enabled=true
return 1
end function

public function integer imprimir (any parametros[], string profesional, string qr);if not isvalid(dw_rep) then dw_rep=create uo_datastore
if tipo_rep='menu!' and dw_rep.describe("datawindow.syntax")='' then 
	if inicia()=-1 then return -1
	goto dd
end if
if tipo_rep='externo!' then
	if inicia()=-1 then return -1
	goto dd
end if
if dw_rep.describe("datawindow.syntax")='' then 
	if inicia()=-1 then return -1
end if
dd:
if not enabled then return 0
//para firma
int  li_FileNum
string dir_tmp, err, stx, ret, des_nivel
blob b_firma
if (not isnull(profesional)) and (profesional<>"") then
	if profesional<>'ips_gci' then
		selectblob firma into :b_firma from profe
		where codprof=:profesional ;
		if SQLCA.SQLCode <> 0 then
			MessageBox("SQL error",SQLCA.SQLErrText,Information!)
			return -1
		end if
	else
		selectblob firma into  :b_firma from ips
		where c_ips='01' ;
		if SQLCA.SQLCode <> 0 then
			MessageBox("SQL error",SQLCA.SQLErrText,Information!)
		end if
	end if
	if not isNull(tmp_file) or tmp_file <> '' then FileDelete(tmp_file)
	i_tempo="c:\windows\temp\"
	tmp_file = i_tempo +profesional+string(today(),'yymmddhhmm') +".jpg"
	tmp_file_mod =i_tempo+profesional+string(today(),'yymmddhhmm') +".jpg"
	li_FileNum = FileOpen(tmp_file, StreamMode!, Write!, LockWrite!, Replace!)
	if isNull(li_FileNum) or li_FileNum < 1 then
		MessageBox('Atención','Error creando archivo temporal de imágen')
		Return -1
	end if
	FileWriteEx ( li_FileNum, b_firma)
	FileClose(li_FileNum)
	ret =  dw_rep.Modify("p_firma.Filename = '" +tmp_file_mod+"'")
	if ret <> '' then 
		//MessageBox('','')
		ret =  dw_rep.Modify("p_firma.Filename=''")
	end if
end if
///para firma

param=parametros
int cuantos
cuantos=upperbound(parametros)
sqlca.autocommit=true
choose case cuantos
	case 0
		if tipo_rep='documento!' or tipo_rep='interno!' then dw_rep.retrieve()
	case 1
		dw_rep.retrieve(parametros[1])
	case 2
		dw_rep.retrieve(parametros[1],parametros[2])
	case 3
		dw_rep.retrieve(parametros[1],parametros[2],parametros[3])
	case 4
		dw_rep.retrieve(parametros[1],parametros[2],parametros[3],parametros[4])
	case 5
		dw_rep.retrieve(parametros[1],parametros[2],parametros[3],parametros[4],parametros[5])
	case 6
		dw_rep.retrieve(parametros[1],parametros[2],parametros[3],parametros[4],parametros[5],parametros[6])
	case 7
		dw_rep.retrieve(parametros[1],parametros[2],parametros[3],parametros[4],parametros[5],parametros[6],parametros[7])
	case 8
		dw_rep.retrieve(parametros[1],parametros[2],parametros[3],parametros[4],parametros[5],parametros[6],parametros[7],parametros[8])
	case 9
		dw_rep.retrieve(parametros[1],parametros[2],parametros[3],parametros[4],parametros[5],parametros[6],parametros[7],parametros[8],parametros[9])
	case 10
		dw_rep.retrieve(parametros[1],parametros[2],parametros[3],parametros[4],parametros[5],parametros[6],parametros[7],parametros[8],parametros[9],parametros[10])
end choose
sqlca.autocommit=false

//f_abrir_rep_gral debe ser para cada aplicación por lo
//que ahi llama un openshhet y un parametro es la ventana principal

if dw_rep.rowcount()>0 then
	////QR
	if qr='1' then
		string ls_dqr, ls_qr,ls_nom,is_ruta_qr='c:\windows\temp\qr_',ls_ojo
		draw_qr_code lqr_code
		lqr_code=create draw_qr_code		
		
		If titulo='Reporte Reimpresión de Facturas' or titulo='Reporte Impresión de Factura Capita' &
			or titulo='Reporte Impresión de Nota Credito' or titulo='Reporte Impresión de Nota Debito' then
			if isnull(dw_rep.getitemstring(1,'prefijo')) then	
				if cod_rep='CRA' then
					ls_dqr ='NumFact: NC'+string(dw_rep.getitemnumber(1,'nfact'))+dw_rep.getitemstring(1,'nro_nota')+'~r~n'
				else	
					if cod_rep='DRA' then
						ls_dqr ='NumFact: NB'+string(dw_rep.getitemnumber(1,'nfact'))+dw_rep.getitemstring(1,'nro_nota')+'~r~n'
					
					else
						if isnull(dw_rep.getitemstring(1,'estado')) then
							ls_dqr ='NumFact: '+string(dw_rep.getitemnumber(1,'nfact'))+'~r~n'
						else
							ls_dqr ='NumFact: NB'+string(dw_rep.getitemnumber(1,'nfact'))+'01'+'~r~n'
						end if
					end if
				end if
			else	
				if cod_rep='CRA' then
					ls_dqr ='NumFact: NC'+dw_rep.getitemstring(1,'prefijo')+string(dw_rep.getitemnumber(1,'nfact'))+dw_rep.getitemstring(1,'nro_nota')+'~r~n'
				else
					if cod_rep='DRA' then
						ls_dqr ='NumFact: NB'+dw_rep.getitemstring(1,'prefijo')+string(dw_rep.getitemnumber(1,'nfact'))+dw_rep.getitemstring(1,'nro_nota')+'~r~n'
					else
						if isnull(dw_rep.getitemstring(1,'estado')) then
							ls_dqr ='NumFact: '+dw_rep.getitemstring(1,'prefijo')+string(dw_rep.getitemnumber(1,'nfact'))+'~r~n'
						else
							ls_dqr ='NumFact: NC'+dw_rep.getitemstring(1,'prefijo')+string(dw_rep.getitemnumber(1,'nfact'))+'01'+'~r~n'
						end if
					end if				
				end if
			end if
			if isnull(dw_rep.getitemstring(1,'estado')) then
				ls_dqr+='FecFac: '+string(dw_rep.getitemdatetime(1,'fecha_factura') ,'yyyy-mm-dd')+'~r~n'		
				ls_dqr+='HorFac: '+string(dw_rep.getitemdatetime(1,'hora_factura') ,'HH:mm:ss')+'-05:00~r~n'
			else
				ls_dqr+='FecFac: '+string(dw_rep.getitemdatetime(1,'fecha_anula') ,'yyyy-mm-dd')+'~r~n'		
				ls_dqr+='HorFac: '+string(dw_rep.getitemdatetime(1,'fecha_anula') ,'HH:mm:ss')+'-05:00~r~n'
			end if
			ls_dqr+='NitFac: '+dw_rep.getitemSTring(1,'ips_nit') +'~r~n'
			ls_dqr+='DocAdq: '+dw_rep.getitemstring(1,'nit') +'~r~n'
			ls_dqr+='ValFac: '+string(dw_rep.getitemnumber(1,'vtemp') ,'##################.00')+'~r~n'
			ls_dqr+='ValIva: '+string(dw_rep.getitemnumber(1,'vtiva') ,'##################.00')+'~r~n'
			ls_dqr+='ValOtroIm: 0.00~r~n'
			ls_dqr+='ValTolFac: '+string(dw_rep.getitemnumber(1,'vtemp') ,'##################.00')+'~r~n'
			if isnull(dw_rep.getitemstring(1,'estado')) then
				ls_dqr+='CUFE: '+dw_rep.getitemstring(1,'cufe')+'~r~n'
			else
				ls_dqr+='CUFE: '+dw_rep.getitemstring(1,'cufe_anul')+'~r~n'
			end if
			if isnull(dw_rep.getitemstring(1,'estado')) then
				ls_dqr+='QRCode:https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey='+dw_rep.getitemstring(1,'cufe')
			else
				ls_dqr+='QRCode:https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey='+dw_rep.getitemstring(1,'cufe_anul')
			end if
			
			if not isnull(ls_dqr) then
				lqr_code=create draw_qr_code
				ls_nom=dw_rep.getitemstring(1,'prefijo')+string(dw_rep.getitemnumber(1,'nfact'))
				lqr_code.draw_msg(ls_dqr,"",is_ruta_qr+ls_nom+'.bmp')
				ls_ojo=dw_rep.modify('qr_picture.filename="'+is_ruta_qr+ls_nom+'.bmp"')	
			end if
			destroy lqr_code
		end if
		
		If upper(titulo)=upper('Reporte Orden de Servicio') then
			if dw_rep.getitemstring(1,'tipo_orden')='I' then
			
				ls_dqr+='IDENTIFICACION:'+dw_rep.getitemstring(1,'tipodoc')+dw_rep.getitemstring(1,'documento')+'~r~n'
				ls_dqr+='NOMBRES:'+dw_rep.getitemstring(1,'nombres')+'~r~n'
				ls_dqr+='INCAPACIDAD No:'+dw_rep.getitemstring(1,'clugar')+'_'+string(dw_rep.getitemnumber(1,'contador'))+'_'+string(dw_rep.getitemnumber(1,'nsolicitud'))+'~r~n'
				ls_dqr+='FECHA GENERACION:'+string(dw_rep.getitemdatetime(1,'fecha'),'dd/mm/yyyy hh:mm')+'~r~n'
				ls_dqr+='PROFESIONAL:'+dw_rep.getitemstring(1,'desprof')+'~r~n'
				if isnull(dw_rep.getitemstring(1,'registro')) then
					messagebox("Atención",'Hace falta registro del profesional')
					return -1
				end if
				ls_dqr+='REGISTRO:'+dw_rep.getitemstring(1,'registro')+'~r~n'
				if isnull(dw_rep.getitemstring(1,'cod_rips')) then
					messagebox("Atención",'Hace falta Dx para incapacidad')
					return -1
				end if	
				ls_dqr+='DX:'+dw_rep.getitemstring(1,'cod_rips')+'~r~n'
				ls_dqr+='INICIA:'+string(dw_rep.getitemdatetime(1,'ifecha_ini'),'dd/mm/yyyy')+'~r~n'
				ls_dqr+='FINALIZA:'+string(dw_rep.getitemdatetime(1,'ifecha_fin'),'dd/mm/yyyy')+'~r~n'
				ls_dqr+='DIAS:'+string(dw_rep.getitemnumber(1,'solicitada'))+'~r~n'
				ls_dqr+='ORIGEN:'
				if dw_rep.getitemstring(1,'rta')='1' then 
					ls_dqr+= 'COMUN' 
				end if
				if dw_rep.getitemstring(1,'rta')='2' then
					ls_dqr+= 'LABORAL' 
				end if
				if dw_rep.getitemstring(1,'rta')='3' then
					ls_dqr+= 'PROFESIONAL' 
				end if
				
				ls_dqr+='~r~n'+'FECHA EMISION:'+string(datetime(today(),now()),'dd/mm/yyyy hh:mm')+'~r~n'
				ls_dqr+='INSTITUCION QUE EMITE:'+dw_rep.getitemstring(1,'ips_nombre')+'~r~n'
				if isnull('('+dw_rep.getitemstring(1,'ipsind')+')'+dw_rep.getitemstring(1,'ipst')) then
					messagebox("Atención",'Hace falta datos de telefono IPS')
					return -1
				end if	
				ls_dqr+='LUGAR ATENCION:'+dw_rep.getitemstring(1,'ld')+'~r~n'
				ls_dqr+='HABILITACION:'+dw_rep.getitemstring(1,'l_c_supersalud')+'~r~n'
				ls_dqr+='TELEFONO:('+dw_rep.getitemstring(1,'ipsind')+')'+dw_rep.getitemstring(1,'ipst')+'~r~n'
				if isnull(dw_rep.getitemstring(1,'ips_dir')	) then
					messagebox("Atención",'Hace falta datos de Dirección IPS')
					return -1
				end if	
				ls_dqr+='DIRECCION:'+dw_rep.getitemstring(1,'ips_dir')	
			else
				ls_dqr+='IDENTIFICACION:'+dw_rep.getitemstring(1,'tipodoc')+ ' '+dw_rep.getitemstring(1,'documento')+'~r~n'
				ls_dqr+='NOMBRES:'+dw_rep.getitemstring(1,'nombres')+'~r~n'
				ls_dqr+='ORDEN No:'+dw_rep.getitemstring(1,'clugar')+'_'+string(dw_rep.getitemnumber(1,'contador'))+'_'+string(dw_rep.getitemnumber(1,'nsolicitud'))+'~r~n'
				ls_dqr+='FECHA ORDEN:'+string(dw_rep.getitemdatetime(1,'fecha'),'dd/mm/yyyy hh:mm')+'~r~n'
				ls_dqr+='PROFESIONAL:'+dw_rep.getitemstring(1,'desprof')+'~r~n'
				if isnull(dw_rep.getitemstring(1,'registro')) then
					messagebox("Atención",'Hace falta registro del profesional')
					return -1
				end if
				ls_dqr+='REGISTRO:'+dw_rep.getitemstring(1,'registro')+'~r~n'
				ls_dqr+='DX:'+dw_rep.getitemstring(1,'cod_rips')+'~r~n'
				if isnull(dw_rep.getitemstring(1,'cod_rips')) then
					messagebox("Atención",'Hace falta Dx para incapacidad')
					return -1
				end if	
	
				ls_dqr+='INSTITUCION QUE EMITE:'+dw_rep.getitemstring(1,'ips_nombre')+'~r~n'
				ls_dqr+='LUGAR ATENCION:'+dw_rep.getitemstring(1,'ld')+'~r~n'
				ls_dqr+='HABILITACION:'+dw_rep.getitemstring(1,'l_c_supersalud')+'~r~n'
				ls_dqr+='FECHA EMISION:'+string(datetime(today(),now()),'dd/mm/yyyy hh:mm')+'~r~n'
				ls_dqr+='TOTAL ITEMS ORDEN:'+string(dw_rep.rowcount())	
			end if
			
			if not isnull(ls_dqr) then
				lqr_code=create draw_qr_code
				if dw_rep.getitemstring(1,'tipo_orden')='I' then
					ls_nom='in'+dw_rep.getitemstring(1,'tipodoc')+dw_rep.getitemstring(1,'documento')
				else
					ls_nom='os'+dw_rep.getitemstring(1,'tipodoc')+dw_rep.getitemstring(1,'documento')
				end if
				lqr_code.draw_msg(ls_dqr,"",is_ruta_qr+ls_nom+'.bmp')
				ls_ojo=dw_rep.modify('qr_picture.filename="'+is_ruta_qr+ls_nom+'.bmp"')	
			end if
			destroy lqr_code
		end if
		
		If upper(titulo)=upper('Reporte Fórmula Médica') then
			ls_dqr+='IDENTIFICACION:'+dw_rep.getitemstring(1,'tipodoc')+ ' '+dw_rep.getitemstring(1,'documento')+'~r~n'
			ls_dqr+='NOMBRES:'+dw_rep.getitemstring(1,'nombres')+'~r~n'
			ls_dqr+='FORMULA No.'+dw_rep.getitemstring(1,'clugar')+'_'+string(dw_rep.getitemnumber(1,'contador'))+'_'+string(dw_rep.getitemnumber(1,'nsolicitud'))+'~r~n'
			ls_dqr+='FECHA PRESCRIPCION:'+string(dw_rep.getitemdatetime(1,'fecha'),'dd/mm/yyyy hh:mm')+'~r~n'
			ls_dqr+='PROFESIONAL:'+dw_rep.getitemstring(1,'desprof')+'~r~n'
			if isnull(dw_rep.getitemstring(1,'registro')) then
				messagebox("Atención",'Hace falta registro del profesional')
				return -1
			end if
			ls_dqr+='REGISTRO:'+dw_rep.getitemstring(1,'registro')+'~r~n'
			ls_dqr+='DX:'+dw_rep.getitemstring(1,'cod_rips')+'~r~n'
			if isnull(dw_rep.getitemstring(1,'cod_rips')) then
				messagebox("Atención",'Hace falta Dx para incapacidad')
				return -1
			end if	

			ls_dqr+='INSTITUCION QUE EMITE:'+dw_rep.getitemstring(1,'ips_nombre')+'~r~n'
			ls_dqr+='LUGAR ATENCION:'+dw_rep.getitemstring(1,'ld')+'~r~n'
			ls_dqr+='HABILITACION:'+dw_rep.getitemstring(1,'l_c_supersalud')+'~r~n'
			ls_dqr+='FECHA EMISION:'+string(datetime(today(),now()),'dd/mm/yyyy hh:mm')+'~r~n'
			ls_dqr+='TOTAL ITEMS FORMULA:'+string(dw_rep.rowcount())

			if not isnull(ls_dqr) then
				lqr_code=create draw_qr_code
				ls_nom='fr'+dw_rep.getitemstring(1,'tipodoc')+dw_rep.getitemstring(1,'documento')
				lqr_code.draw_msg(ls_dqr,"",is_ruta_qr+ls_nom+'.bmp')
				ls_ojo=dw_rep.modify('qr_picture.filename="'+is_ruta_qr+ls_nom+'.bmp"')	
			end if
			destroy lqr_code
		end if		
		
	end if
	///////
	if dialogo then
		openwithparm(w_conf_pag,this)
	else
		if v_preliminar then
			if isvalid(w_reporte_gral) then
				message.powerobjectparm=this
				w_reporte_gral.triggerevent(open!)
				w_reporte_gral.setfocus()
			else
				f_abrir_rep_gral(this)
			end if
		else
			dw_rep.print()
		end if
	end if
elseif tipo_rep='menu!' or tipo_rep='externo!' then
	if isvalid(w_reporte_gral) then
		message.powerobjectparm=this
		w_reporte_gral.triggerevent(open!)
		w_reporte_gral.setfocus()
	else
		f_abrir_rep_gral(this)
	end if
else
	messagebox("Atención",'No se encontraron registros para imprimir')
	return -1
end if
//FileDelete(is_ruta_qr+ls_nom+'.bmp')
return 1
end function

on uo_report.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_report.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;dw_rep=create uo_datastore
i_clugar=clugar

String ls_keyword,is_values[]
Integer  li_return, posic
ContextKeyword lcx_key

li_return = GetContextService ("Keyword", lcx_key)
ls_keyword = 'temp'
lcx_key.GetContextKeywords(ls_keyword, is_values)
i_tempo = is_values[1]
i_tempo_mod  = i_tempo
posic = pos(i_tempo_mod,'~~')
do while posic > 0
	i_tempo_mod = left(i_tempo_mod,posic) + '~~' +  right(i_tempo_mod,len(i_tempo_mod) - posic)
	posic = pos(i_tempo_mod,'~~', posic + 3)
loop

end event

event destructor;FileDelete(tmp_file)

end event

