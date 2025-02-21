$PBExportHeader$uo_hclin.sru
forward
global type uo_hclin from userobject
end type
type cb_modo from picturebutton within uo_hclin
end type
type dw_img_new from datawindow within uo_hclin
end type
type pb_4 from pb_report within uo_hclin
end type
type pb_2 from picturebutton within uo_hclin
end type
type dw_vrs from datawindow within uo_hclin
end type
type dw_campo from datawindow within uo_hclin
end type
type cbx_3 from checkbox within uo_hclin
end type
type st_4 from statictext within uo_hclin
end type
type st_vert2 from statictext within uo_hclin
end type
type st_vertical from statictext within uo_hclin
end type
type dw_histo from datawindow within uo_hclin
end type
type em_1 from editmask within uo_hclin
end type
type st_muestra from singlelineedit within uo_hclin
end type
type dw_serv_old from datawindow within uo_hclin
end type
type uo_1 from uo_barra_hc within uo_hclin
end type
type dw_captur_histo from datawindow within uo_hclin
end type
type st_1 from statictext within uo_hclin
end type
type dw_ls from datawindow within uo_hclin
end type
type pb_pvisible from picturebutton within uo_hclin
end type
type dw_meds_new from datawindow within uo_hclin
end type
type dw_res_old from datawindow within uo_hclin
end type
type pb_1 from picturebutton within uo_hclin
end type
type dw_img_old from datawindow within uo_hclin
end type
type dw_procs_new from datawindow within uo_hclin
end type
type t_procs from tab within uo_hclin
end type
type tp1 from userobject within t_procs
end type
type tp1 from userobject within t_procs
end type
type tp2 from userobject within t_procs
end type
type tp2 from userobject within t_procs
end type
type t_procs from tab within uo_hclin
tp1 tp1
tp2 tp2
end type
type t_result_old from tab within uo_hclin
end type
type tp7 from userobject within t_result_old
end type
type tp7 from userobject within t_result_old
end type
type tp8 from userobject within t_result_old
end type
type tp8 from userobject within t_result_old
end type
type tp9 from userobject within t_result_old
end type
type tp9 from userobject within t_result_old
end type
type t_result_old from tab within uo_hclin
tp7 tp7
tp8 tp8
tp9 tp9
end type
type t_procs_old from tab within uo_hclin
end type
type tp5 from userobject within t_procs_old
end type
type tp5 from userobject within t_procs_old
end type
type tp6 from userobject within t_procs_old
end type
type tp6 from userobject within t_procs_old
end type
type t_procs_old from tab within uo_hclin
tp5 tp5
tp6 tp6
end type
type t_result from tab within uo_hclin
end type
type tp3 from userobject within t_result
end type
type tp3 from userobject within t_result
end type
type tp4 from userobject within t_result
end type
type tp4 from userobject within t_result
end type
type t_imagen from userobject within t_result
end type
type t_imagen from userobject within t_result
end type
type t_result from tab within uo_hclin
tp3 tp3
tp4 tp4
t_imagen t_imagen
end type
type dw_new from datawindow within uo_hclin
end type
type dw_1 from datawindow within uo_hclin
end type
type dw_deta from datawindow within uo_hclin
end type
type dw_plants from datawindow within uo_hclin
end type
type dw_res_new from datawindow within uo_hclin
end type
type mle_2 from uo_multilineedit within uo_hclin
end type
type mle_3 from multilineedit within uo_hclin
end type
type mle_1 from uo_multilineedit within uo_hclin
end type
type dw_new_det from datawindow within uo_hclin
end type
end forward

global type uo_hclin from userobject
integer width = 5989
integer height = 2244
boolean enabled = false
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event closequery pbm_closequery
event cambio_diags ( )
cb_modo cb_modo
dw_img_new dw_img_new
pb_4 pb_4
pb_2 pb_2
dw_vrs dw_vrs
dw_campo dw_campo
cbx_3 cbx_3
st_4 st_4
st_vert2 st_vert2
st_vertical st_vertical
dw_histo dw_histo
em_1 em_1
st_muestra st_muestra
dw_serv_old dw_serv_old
uo_1 uo_1
dw_captur_histo dw_captur_histo
st_1 st_1
dw_ls dw_ls
pb_pvisible pb_pvisible
dw_meds_new dw_meds_new
dw_res_old dw_res_old
pb_1 pb_1
dw_img_old dw_img_old
dw_procs_new dw_procs_new
t_procs t_procs
t_result_old t_result_old
t_procs_old t_procs_old
t_result t_result
dw_new dw_new
dw_1 dw_1
dw_deta dw_deta
dw_plants dw_plants
dw_res_new dw_res_new
mle_2 mle_2
mle_3 mle_3
mle_1 mle_1
dw_new_det dw_new_det
end type
global uo_hclin uo_hclin

type variables
private string i_clug,i_tipo,i_ing_sal='S',i_cemp,i_ccont,i_cprof, i_textos 
private string i_campos, i_columnas,is_cplant,i_codfina, ls_antece_si
private long i_contador, posX, posY, colum, altura, consec
private datawindowchild idw_plants,idw_lista,idw_listan
//private uo_timer timer
boolean i_cambia,i_nv_orden//para saber si se ha modificado algo//para saber si ya se insertó una orden de serv
string i_message,i_clug_nh,i_estado_hadm,i_tingre,i_clug_qx,i_modo,i_fecha,i_interfaz_ord,i_cespe,i_cpo,i_ptipo,i_pingsal,ls_modrel
string is_202
singlelineedit isle_proc,isle_med,sle_otros,isle_tiporep,isle_kits ,sle_plant//para crear loas ordenes de serv cunado el objeto se abre en Evolución
picturebutton ipb_new_orden
boolean i_displayonly, i_pudo_orden,i_puede_modif//para que si no pudo crear una orden no siga enviando eso//para determinar si el usuario puede modificar la historia despues de cerrada la admision
boolean i_sivigila //para referesacr si se guardo una plantilla sivigla
long i_nh,i_nactoqx
datawindow i_dw_oscab
blob imags[],objs[],imags1[]
int i_nro_imags,i_actual_image,i_nobjs[],i_control
//i_ing_sal:(I:ingreso , S:salida)
uo_datastore  ids_hijos_histo
end variables

forward prototypes
public subroutine mover (long xpos)
public subroutine mover2 (long xpos)
public subroutine moverv (long ypos)
public function integer grabar ()
public function integer tamanyo (integer w, integer h)
public function integer reset ()
public function integer refresh_diags ()
public function integer guarda_diags ()
public function integer valida_diags ()
public subroutine navegar (keycode key)
public subroutine move_data (string modo)
public function integer lf_crea_serving (long p_nreg)
public function integer f_cambia_espe (string p_espe)
public function integer f_sivigila ()
public function string traduce_fmla (string fmla)
public subroutine inicia_objs_ordenes (ref singlelineedit p_sle_proc, singlelineedit p_sle_med, picturebutton p_new_orden, datawindow p_dw_oscab, singlelineedit p_sle_otros, singlelineedit p_sle_tiporep, string p_cesp, singlelineedit p_sle_kits)
public function integer retrieve (long p_contador, string p_clug, string p_tipo, string p_tingre, string p_ingreso, string p_cespe, string p_cemp, string p_ccont, string p_cprof, long p_nactoqx, string p_clug_qx, string p_plantilla, string p_codfina)
end prototypes

event closequery;dw_new_det.accepttext()
if not i_cambia then 
	return 0
else
	I_cambia=false
	return 1
end if
if i_control<>1 then return 0
choose case messagebox('Atención','Realizón cambios en datos de '+i_message+'. Desea guardar los cambios?',question!,yesnocancel!,1)
	case 1
		if grabar()=-1 then
			rollback;
			return 1
		else
			commit;
			return 0
		end if
	case 2
		i_cambia=false
		return 0
	case 3
		return 1
end choose
end event

event cambio_diags();//
end event

public subroutine mover (long xpos);dw_histo.width=xpos
dw_deta.x=xpos+12
dw_deta.width= width - xpos -12
mle_1.x=dw_deta.x
mle_1.width=dw_deta.width
dw_serv_old.x=dw_deta.x
dw_serv_old.width=dw_deta.width
dw_res_old.x=dw_deta.x
dw_res_old.width=dw_deta.width
//st_2.x=xpos+20
end subroutine

public subroutine mover2 (long xpos);dw_new.width=xpos
dw_new_det.x=xpos+12
dw_new_det.width= width - xpos -12
mle_2.x=dw_new_det.x
mle_2.width=dw_new_det.width
dw_procs_new.x=dw_new_det.x
dw_procs_new.width=dw_new_det.width
dw_res_new.x=dw_new_det.x
dw_res_new.width=dw_new_det.width
dw_meds_new.x=dw_new_det.x
dw_meds_new.width=dw_new_det.width
dw_img_new.x=dw_new_det.x
dw_img_new.width=dw_new_det.width
dw_img_new.x=dw_new_det.x
dw_img_new.width=dw_new_det.width
end subroutine

public subroutine moverv (long ypos);//la barra que va horizontal
st_4.y=ypos
dw_histo.height=ypos - 88
dw_deta.height=dw_histo.height
st_vertical.height=ypos -8
st_vert2.height=height - ypos - 165
mle_1.height=dw_deta.height
dw_res_old.height=dw_deta.height
dw_serv_old.height=dw_deta.height
dw_img_old.height=dw_deta.height
dw_plants.y = ypos
uo_1.y = ypos + 12
cb_modo.y = uo_1.y+30
st_muestra.y = uo_1.y+uo_1.height -50
em_1.y = st_muestra.y -4
t_result.y = st_muestra.y -30
t_procs.y= t_result.y 
cbx_3.y = t_result.y +12
dw_new.y = st_muestra.y + st_muestra.height+4
dw_new_det.y = st_muestra.y + st_muestra.height + 4
dw_1.y = st_muestra.y + st_muestra.height + 4
dw_1.height = height - ypos - 210
mle_2.y = dw_new_det.y
dw_procs_new.y=dw_new_det.y
dw_res_new.y = dw_new_det.y
dw_img_new.y = dw_new_det.y
st_vert2.y = dw_new_det.y -8

dw_new.height = height - ypos - 230
dw_new_det.height = dw_new.height
mle_2.height = dw_new_det.height
dw_procs_new.height= dw_new_det.height
dw_res_new.height = dw_new_det.height
dw_img_new.height = dw_new_det.height

end subroutine

public function integer grabar ();if pos('2347',i_tingre)>0 and i_estado_hadm<>'1' and i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return -1
end if
if i_tipo='Q' and (isnull(i_nactoqx) or isnull(i_clug_qx))  then return -1

dw_deta.Resetupdate()
dw_deta.setfilter('contador=-1') //antes había un reset pero tocaba volver a hacer retrieve al finalizar, así no hay que volver a hacer retrieve
dw_deta.filter()
dw_new.event rowfocuschanging(dw_new.getrow(),dw_new.getrow())
if dw_new_det.accepttext()=-1 then return -1
If not i_cambia then return 1

If dw_histo.rowcount()>0 then
	
	if pos('2347T',i_tingre)=0 then
		If dw_histo.getitemdatetime(1,'fecha')>datetime(em_1.text) then
			messagebox('Atención','La fecha actual es menor a la del ultimo registro guardado. Por defecto se colocará la fecha de ese registro')
			em_1.event p_itemchanged()
		End if
		dw_histo.SetFilter("codplantilla ='"+is_cplant+"'")
		dw_histo.Filter()
		If dw_histo.RowCount() >0  then
			If daysAfter(date(dw_histo.getitemdatetime(1,'fecha')), date(em_1.text)) >= 1 then
				Messagebox("Atención","Esta atencion ya está cerrada, debe agregar una Nuevo Ingreso para poder agregar registro Clinico")
				return 1
			Else
				If  SecondsAfter(time(dw_histo.getitemdatetime(1,'fecha')),time(datetime(em_1.text)))  > 0  then 
					If Messagebox("Atención","Desea Ingresar un Nuevo Registro Clinico, existe uno anterior de las "+string(dw_histo.getitemdatetime(1,'fecha')),question!,yesno!,2) = 2 then return 1
				 End if		
			End If
		End if
		dw_histo.SetFilter('')
		dw_histo.Filter()
	end If
End If
if valida_diags()=-1 then return -1
if dw_procs_new.rowcount()>0 then
	if dw_procs_new.find('estado="2"',1,dw_procs_new.rowcount())>0 then
		messagebox('Atención','Debe completar los datos de RIPS de los procedimientos a atender')
		return -1
	end if
end if
if i_modo = 'F' then
	move_data(i_modo)
end if
if f_sivigila()=-1 then return -1
long j,donde
boolean inserto,lbn_si_datos
uo_datastore ds_result
ds_result=create uo_datastore

if g_motor='postgres' then
	ds_result.dataobject='dr_result_postgres'
end if
if g_motor='anywhere' then
	ds_result.dataobject='dr_result'
end if
if g_motor='sql' then
	ds_result.dataobject='dr_result_sqlserver'
end if
ds_result.settransobject(sqlca)


string err
integer fila
dw_new_det.setfilter('')
dw_new_det.filter()
dw_campo.setfilter('')
dw_campo.filter()
if  dw_new_det.find('falta=1',1,dw_new_det.rowcount())>0 or  dw_campo.find('falta=1',1,dw_campo.rowcount())>0 then
	fila=dw_campo.find('falta=1',1,dw_campo.rowcount())
	if fila>0 then 
		messagebox('Atención', 'Debe completar los datos obligatorios --'+dw_campo.getitemstring(fila,'descampo'))	
	end if
	setnull(fila)
	fila=dw_new_det.find('falta=1',1,dw_new_det.rowcount())
	if fila>0 then 
		messagebox('Atención', 'Debe completar los datos obligatorios --'+dw_new_det.getitemstring(fila,'descampo'))	
	end if

	dw_new.event rowfocuschanged(dw_new.getrow())
	return -1
end if

double cohortes
int semanas,dias
datetime fechas

cohortes=f_valida_usuario_cohorte_materna(tipdoc, docu)
for j=1 to dw_new_det.rowcount()
	choose case dw_new_det.getitemstring(j,'tipo')
		case 'S', 'L' , 'T', 'Y','A' //:seleccion  //:lista  //:texto //:INSTRUMENTO
			if dw_new_det.getitemstring(j,'texto')<>'' and not isnull(dw_new_det.getitemstring(j,'texto')) then
				donde=dw_deta.insertrow(0)
				dw_deta.setitem(donde,'texto',dw_new_det.getitemstring(j,'texto'))
				dw_deta.setitem(donde,'json',dw_new_det.getitemstring(j,'json'))
				dw_deta.setitem(donde,'inst1',dw_new_det.getitemstring(j,'inst1'))
				dw_deta.setitem(donde,'inst2',dw_new_det.getitemstring(j,'inst2'))
				dw_deta.setitem(donde,'inst3',dw_new_det.getitemstring(j,'inst3'))
				dw_deta.setitem(donde,'inst4',dw_new_det.getitemstring(j,'inst4'))				
				inserto=true
			end if
		//no existe el tipo N, el de SINO es tipo S
		case 'N'//:si/no  
			if dw_new_det.getitemstring(j,'sino')<>'' and not isnull(dw_new_det.getitemstring(j,'texto')) then
				donde=dw_deta.insertrow(0)
				dw_deta.setitem(donde,'sino',dw_new_det.getitemstring(j,'sino'))
				inserto=true
			end if
	
		case 'R','C' //:Numerico , computado
			if not isnull(dw_new_det.getitemnumber(j,'numero')) then
				if  dw_new_det.getitemnumber(j,'numero')<>0 then
					donde=dw_deta.insertrow(0)
					dw_deta.setitem(donde,'numero',dw_new_det.getitemnumber(j,'numero'))
					inserto=true
					if cohortes>0 then 
						if dw_new_det.getitemstring(j,'eco')='2' then
							semanas=dw_new_det.getitemnumber(j,'numero')
							sqlca.autocommit=true
							UPDATE pacientes_cohortes SET sgp_eco =:semanas
							WHERE (((tipodoc)=:tipdoc) AND ((documento)=:docu) AND ((id_cohorte_pac)=:cohortes) AND ((pacientes_cohortes.sgp_eco) is null));	
							sqlca.autocommit=false
						end if
						if dw_new_det.getitemstring(j,'eco')='3' then
							dias=dw_new_det.getitemnumber(j,'numero')
							sqlca.autocommit=true
							UPDATE pacientes_cohortes SET dgp_eco =:dias
							WHERE (((tipodoc)=:tipdoc) AND ((documento)=:docu) AND ((id_cohorte_pac)=:cohortes) AND ((pacientes_cohortes.dgp_eco) is null));	
							sqlca.autocommit=false
						end if		
					end if
				end if
			end if
		case 'F' ,'X'//:fecha
			if not isnull(dw_new_det.getitemdatetime(j,'fecha_cap')) then
				donde=dw_deta.insertrow(0)
				dw_deta.setitem(donde,'fecha',dw_new_det.getitemdatetime(j,'fecha_cap'))
				if dw_new_det.getitemstring(j,'eco')='1' then
					fechas=dw_new_det.getitemdatetime(j,'fecha_cap')
					if date(fechas)<date('01/01/1900') then
						sqlca.autocommit=true
						UPDATE pacientes_cohortes SET fp_eco =:fechas
						WHERE (((tipodoc)=:tipdoc) AND ((documento)=:docu) AND ((id_cohorte_pac)=:cohortes)  AND ((pacientes_cohortes.fp_eco) is null));
						sqlca.autocommit=false
					end if
				end if
				if dw_new_det.getitemstring(j,'eco')='4' then
					fechas=dw_new_det.getitemdatetime(j,'fecha_cap')
					if date(fechas)<date('01/01/1900') then
						sqlca.autocommit=true
						UPDATE pacientes_cohortes SET fp_part =:fechas
						WHERE (((tipodoc)=:tipdoc) AND ((documento)=:docu) AND ((id_cohorte_pac)=:cohortes)  AND ((pacientes_cohortes.fp_eco) is null));
						sqlca.autocommit=false
					end if
				end if				
				inserto=true
			end if
		case 'H' //:tiempo
			if not isnull(dw_new_det.getitemdatetime(j,'tiempo')) or not isDate( string(dw_new_det.getitemdatetime(j,'tiempo'))) then
				donde=dw_deta.insertrow(0)
				dw_deta.setitem(donde,'fecha',dw_new_det.getitemdatetime(j,'tiempo'))
				inserto=true
			end if
	end choose
	if inserto then
		dw_deta.setitem(donde,'item',dw_new_det.getitemnumber(j,'numcampo'))
		dw_deta.setitem(donde,'padre',dw_new_det.getitemnumber(j,'padre'))
		dw_deta.setitem(donde,'orden',dw_new_det.getitemnumber(j,'orden'))
		dw_deta.setitem(donde,'descampo',dw_new_det.getitemstring(j,'descampo'))
		dw_deta.setitem(donde,'tipo',dw_new_det.getitemstring(j,'tipo'))
		dw_deta.setitem(donde,'varia_salud',dw_new_det.getitemstring(j,'varia_salud'))
		dw_deta.setitem(donde,'json',dw_new_det.getitemstring(j,'json'))				
		inserto=false
		lbn_si_datos=true
		dw_deta.event rec_revisa_padre(dw_new_det.getitemnumber(j,'padre'))
	end if
next

dw_res_new.setfilter('')
dw_res_new.filter()
dw_procs_new.setfilter('')
dw_procs_new.filter()
string ls_epicrisis
for j=1 to dw_campo.rowcount()					//que se hayan bajado examenes
	if dw_campo.getitemstring(j,'tipo')<>'M' then continue
	if dw_campo.getitemstring(j,'texto')<>'' or dw_res_new.find('item_hc='+string(dw_campo.getitemnumber(j,'numcampo')),1,dw_res_new.rowcount())>0 or dw_procs_new.find('item_hc='+string(dw_campo.getitemnumber(j,'numcampo')),1,dw_procs_new.rowcount())>0 then
		if dw_deta.find('item='+string(dw_campo.getitemnumber(j,'numcampo')),1,dw_deta.rowcount())>0 then continue
		donde=dw_deta.insertrow(0)
		dw_deta.setitem(donde,'item',dw_campo.getitemnumber(j,'numcampo'))
		dw_deta.setitem(donde,'padre',dw_campo.getitemnumber(j,'padre'))
		dw_deta.setitem(donde,'orden',dw_campo.getitemnumber(j,'orden'))
		dw_deta.setitem(donde,'descampo',dw_campo.getitemstring(j,'descampo'))
		dw_deta.setitem(donde,'tipo',dw_campo.getitemstring(j,'tipo'))
		dw_deta.setitem(donde,'tipo_memo',dw_campo.getitemstring(j,'tipo_memo'))
		dw_deta.event rec_revisa_padre(dw_campo.getitemnumber(j,'padre'))
		lbn_si_datos=true
	end if
next
if uo_1.dw_diags.getitemstatus(1,0,primary!)=datamodified! then lbn_si_datos=true
long nreg,item
blob guarda
boolean fecha
string ls_nom1 , ls_nom2 , ls_ape1, ls_ape2 ,descrip_espe,l_pregistro,ls_descrip_prof

if lbn_si_datos then
	
	SELECT 
	 profe.nombre1,
	 profe.nombre2 ,
	 profe.apellido1,
	 profe.apellido2 ,
	 Especialidades.DesEsp,profe.registro
	into :ls_nom1,:ls_nom2,:ls_ape1,:ls_ape2,:descrip_espe,:l_pregistro
	FROM Profe INNER JOIN (Especialidades INNER JOIN EspProf ON Especialidades.CodEsp = EspProf.CEsp) ON Profe.CodProf = EspProf.CodProf
	WHERE (((EspProf.CodProf)=:i_cprof) AND ((EspProf.CEsp)=:i_cespe)) and espprof.estado='1' ;
	
	if sqlca.sqlcode=-1 then messagebox("Error SQL","Error consultando profesional: "+sqlca.sqlerrtext)
	
	ls_descrip_prof=ls_nom1
	if ls_nom2<>'' and not isnull(ls_nom2) then ls_descrip_prof+=' '+ls_nom2
	ls_descrip_prof+=' '+ls_ape1
	if ls_ape2<>'' and not isnull(ls_ape2) then ls_descrip_prof+=' '+ls_ape2

	dw_histo.insertrow(1)
	dw_histo.setitem(1,'contador',i_contador)
	dw_histo.setitem(1,'clugar',i_clug)
	dw_histo.setitem(1,'codplantilla',is_cplant)

	dw_histo.setitem(1,'desplantilla',idw_plants.getitemstring(idw_plants.getrow(),'desplantilla'))
	dw_histo.setitem(1,'tipo',i_tipo)
	dw_histo.setitem(1,'codtingre',i_tingre)
	dw_histo.setitem(1,'ingreso',i_ing_sal)
	dw_histo.setitem(1,'fecha_reg',datetime(today(),now()))
	dw_histo.setitem(1,'fecha',datetime(em_1.text))
	dw_histo.setitem(1,'codprof',i_cprof)
	dw_histo.setitem(1,'cesp',i_cespe)
	dw_histo.setitem(1,'usuario',usuario)
	dw_histo.setitem(1,'est_revisa',0)
	dw_histo.setitem(1,'padre',0)
	dw_histo.setitem(1,'item',0)
	dw_histo.setitem(1,'visible',1)
	dw_histo.setitem(1,'tipo_campo','')
	dw_histo.setitem(1,'hijos',1)
	dw_histo.setitem(1,'estado','0')
	dw_histo.setitem(1,'nombre1',ls_nom1)
	dw_histo.setitem(1,'nombre2',ls_nom2)
	dw_histo.setitem(1,'apellido1',ls_ape1)
	dw_histo.setitem(1,'apellido2',ls_ape2)
	dw_histo.setitem(1,'desesp',descrip_espe)
	
	if i_tipo='Q' then
		dw_histo.setitem(1,'numero_ingre',i_nactoqx)
		dw_histo.setitem(1,'clugar_qx',i_clug_qx)
	end if
	select max(nregistro) into :nreg from hclin_registro where contador=:i_contador and clugar=:i_clug;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo hclin_registro',err)
		return -1
	end if
	if isnull(nreg) then nreg=0
	nreg ++
	dw_histo.setitem(1,'nregistro',nreg)
	if dw_histo.update(true,false)=-1 then 
		dw_histo.deleterow(1)
		return -1
	end if
	for j=1 to dw_deta.rowcount()
		dw_deta.setitem(j,'contador',i_contador)
		dw_deta.setitem(j,'clugar',i_clug)
		dw_deta.setitem(j,'nregistro',nreg)
	next
	if dw_deta.UPDATE(true,false)=-1 then
		dw_histo.deleterow(1)
		dw_deta.reset()
		return -1
	end if

	//// Validacion de 202
	dw_new_det.setfilter("not isnull( varia_salud )")
	dw_new_det.filter()
	string ls_resul,ls_codpl
	
	if is_202='1' then
		for j=1 to dw_new_det.rowcount()	
			
			choose case dw_new_det.getitemstring(j,'tipo')
				case 'S', 'L' , 'T', 'Y','A' //:seleccion  //:lista  //:texto //:INSTRUMENTO
					if isnull(dw_new_det.getitemstring(j,'equiv_202')) then
						ls_resul=dw_new_det.getitemstring(j,'texto')
					else
						ls_resul=dw_new_det.getitemstring(j,'equiv_202')
					end if
	
				case 'N'//:si/no  
					ls_resul=dw_new_det.getitemstring(j,'sino')
		
				case 'R','C' //:Numerico , computado
						ls_resul=string(dw_new_det.getitemnumber(j,'numero'))
		
				case 'F' ,'X'//:fecha
					ls_resul=string(dw_new_det.getitemdatetime(j,'fecha_cap'),'yyy-mm-dd')
		
				case 'H' //:tiempo
						ls_resul=string(dw_new_det.getitemdatetime(j,'tiempo'),'hh:mm:ss')
			end choose
				
			gf_validar_202_cons(	tipdoc,docu,&
				w_principal.dw_1.getitemstring(1,'sexo'),&
				w_principal.dw_1.getitemnumber(1,'dias'),&
				dw_new_det.getitemstring(j,'codplantilla'),&
				dw_new_det.getitemnumber(j,'numcampo'),&
				dw_new_det.getitemstring(j,'varia_salud'),&
				ls_resul,string(date(em_1.text),'yyyy-mm-dd'))		
		next
	end if
	/// Fin 202
	
	
	dw_res_new.resetupdate()
	dw_img_new.resetupdate()
	for j=1 to dw_res_new.rowcount()
		dw_res_new.setitem(j,'contador_hc',i_contador)
		dw_res_new.setitem(j,'clugar_hc',i_clug)
		dw_res_new.setitem(j,'nregistro_hc',nreg)
		dw_res_new.setitem(j,'item_hc',dw_res_new.getitemnumber(j,'item_hc'))//trae el mismo que ya tenía
	next
	if dw_res_new.update(true,false)=-1 then
		dw_histo.deleterow(1)
		dw_deta.reset()
		return -1
	end if
	if dw_procs_new.rowcount()>0 then///// Crear servicios ingreso
		if lf_crea_serving(nreg)=-1 then return -1
	end if
	if guarda_diags()=-1 then return -1

	mle_3.text=""
	
	for j=1 to dw_campo.rowcount()
		if dw_campo.getitemstring(j,'tipo')<>'M' then continue
		item=dw_campo.getitemnumber(j,'numcampo')
		if dw_campo.getitemstring(j,'texto')<>'' then
			guarda=blob(dw_campo.getitemstring(j,'texto'))
			sqlca.autocommit=true
			updateblob hclin_reg_valor set long_texto =:guarda where contador=:i_contador and clugar=:i_clug and nregistro=:nreg and item=:item;
			sqlca.autocommit=false
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando long_texto en hclin_reg_valor',err)
				return -1
			end if
			if cbx_3.checked then
				if not fecha then
					//f_pega_a_rtf(rte_3,'~r~n'+string(dp_1.value,'dd/mm/yyyy HH:mm')+': ',2)
					if isnull(l_pregistro) then l_pregistro=''
					f_pega_a_mle(mle_3,'~r~n'+em_1.text+': ' + ls_descrip_prof + ' ('+descrip_espe+')  REG Nro:'+l_pregistro  ,2)
					fecha=true
				end if
				f_pega_a_mle(mle_3,'~r~n',2)
				f_pega_a_mle(mle_3,dw_campo.getitemstring(j,'descampo')+':~r~n',2)
				f_pega_a_mle(mle_3,dw_campo.getitemstring(j,'texto'),2)
				if dw_campo.getitemstring(j,'tipo_memo')='R' then
					if ds_result.retrieve(i_contador ,i_clug ,nreg ,item/*,datetime('01/01/2019'),datetime(today(),now())*/)>0 then//R E S U L T A D O S 
						gf_pasar_result_mle(ds_result,mle_3)
					end if
				end if				
			end if
		else
			if cbx_3.checked then
				if dw_campo.getitemstring(j,'tipo_memo')='R' then
					if ds_result.retrieve(i_contador ,i_clug ,nreg ,item,datetime('01/01/2019'),datetime(today(),now()))>0 then//R E S U L T A D O S 
						if not fecha then
							f_pega_a_mle(mle_3,'~r~n'+em_1.text+': ',2)
							fecha=true
						end if
						f_pega_a_mle(mle_3,'~r~n',2)
						f_pega_a_mle(mle_3,dw_campo.getitemstring(j,'descampo')+':~r~n',2)
						gf_pasar_result_mle(ds_result,mle_3)
					end if
				end if
			end if
		end if
	next
	
	ids_hijos_histo.retrieve(i_contador,i_clug)
	ids_hijos_histo.sort()
	sqlca.autocommit=false
	
end if

ls_epicrisis=mle_3.text

if ls_epicrisis<>'' then
	blob lee
	sqlca.autocommit=true
	selectblob resumeningreso into :lee from evolucionhc where contador=:i_contador and clugar=:i_clug;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo evolucionhc',sqlca.sqlerrtext)
		return -1
	end if
	sqlca.autocommit=false
	if sqlca.sqlnrows=0 then
		insert into evolucionhc (contador,clugar) values(:i_contador,:i_clug);
		if sqlca.sqlcode=-1 then 
			messagebox('Error insertando en evolucionhc (epicrisis)',sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	end if
	f_pega_a_mle(mle_3,string(lee),0)
	ls_epicrisis=mle_3.text
	lee=blob(ls_epicrisis)
	updateblob evolucionhc set resumeningreso=:lee where contador=:i_contador and clugar=:i_clug;
	if sqlca.sqlcode=-1 then
		messagebox('Error actualizando epicrisis en evolucionhc',sqlca.sqlerrtext)
	end if
	sqlca.autocommit=false
end if
dw_histo.resetupdate()
dw_res_new.resetupdate()
dw_procs_new.resetupdate()
uo_1.dw_tri.resetupdate()
i_cambia=false

//se crearon estos clean_fields para no volver a hacer retrieve de todos los DWs
dw_campo.event clean_fields()
dw_captur_histo.event clean_fields()
dw_new_det.event clean_fields()
mle_2.clear()

//mle_1.modified=false


if i_tipo='Q' then
	dw_histo.retrieve(i_contador,i_clug,i_tipo,i_tingre,i_ing_sal,i_nactoqx,i_clug_qx)
else
	dw_histo.retrieve(i_contador,i_clug,i_tipo,i_tingre,i_ing_sal)
end if


if dw_new.getrow()<>1 then 	
	dw_new.setrow(1)
else
	dw_new.event rowfocuschanged(1)
end if

destroy ds_result
em_1.text=string(datetime(today(),now()),'dd/mm/yyyy hh:mm')
i_sivigila=false
return 1
end function

public function integer tamanyo (integer w, integer h);//primero posicion y luego tamaños
long w1,h1,w2,h2,w_actu,h_actu
constant long tit1=56,tit2=96
dec facto1,facto2,facto3,facto4

w_actu=width
h_actu=height
width=w+4
height=h+4
//t_result_old.x=w - t_result_old.width +4
//t_result_old.x=2505
//t_procs_old.x=2505
//t_result.x=t_result_old.x +24
t_result.x=t_result_old.x 
t_procs.x=t_result.x 
if w_actu=0 then w_actu=1
if h_actu=0 then h_actu=1 
facto1=dw_histo.width/w_actu
facto2=dw_histo.height/h_actu
if facto1=0 and w>100 then facto1=0.5
if facto2=0 and h>100 then facto2=0.5
facto3=dw_new.width/w_actu
facto4=dw_new.height/h_actu
if facto3=0 and w>100 then facto3=0.5
if facto4=0 and h>100 then facto4=0.5

w1=round(w * facto1 ,0)
h1=round(h * facto2,0)

w2=round(w * facto3,0)
h2=round(h * facto4,0)
uo_1.width=w - dw_plants.width
uo_1.dw_diags.width=uo_1.width -261
uo_1.dw_tri.width=uo_1.dw_diags.width - 119
st_vertical.x=w1
mover(w1)
//st_muestra.width=uo_1.dw_diags.width - 200
st_muestra.width=uo_1.dw_diags.width - 2000
st_4.y=h1+tit1
st_4.width=w
if i_displayonly = TRUE then
	moverv(h - 30)
else
	moverv(h1+tit1)
end if
dw_1.Width = w - 100

st_vert2.x=w2
mover2(w2)

return 1
end function

public function integer reset ();is_cplant=''
i_contador=0
i_clug=''
i_tipo=''
i_tingre=''
i_ing_sal=''
i_cespe=''
dw_histo.reset()
idw_plants.reset()
i_cemp=''
i_ccont=''
setnull(i_cprof)
em_1.text=string(datetime(today(),now()),'dd/mm/yyyy hh:mm')
i_puede_modif=false
dw_new.reset()
i_cambia=false
dw_plants.setitem(1,1,i_cprof)
uo_1.dw_diags.reset()
uo_1.dw_cond.reset()
dw_res_new.reset()
dw_img_new.reset()
dw_new_det.reset()
mle_2.visible=false
dw_res_old.reset()
dw_img_old.reset()
dw_deta.reset()
dw_1.Reset()
mle_1.visible=false
st_muestra.text=''
setnull(ls_modrel)
return 1
end function

public function integer refresh_diags ();uo_1.refresh_diags()
return 1
end function

public function integer guarda_diags ();string err
if i_tingre='2' then
	if uo_1.dw_tri.getitemstatus(1,0,primary!)=datamodified! or uo_1.dw_tri.getitemstatus(1,0,primary!)=NewModified! then
		//uo_1.dw_tri.setitem(1,'usu_triage',usuario)
	end if
	if uo_1.dw_tri.update(true,false)=-1 then
		rollback;
		return -1
	end if
end if
if pos('2347',i_tingre)>0 then
	update hospadmi set estad_evol='1'
	where contador=:i_contador and clugar_his=:i_clug;
	IF SQLCA.SQLCode = -1 THEN
		err=SQLCA.SQLErrText
		rollback;
		MessageBox("Error actualizando HospAdmi.estad_evol", err)
		Return -1
	END IF
end if
dw_campo.setfilter('')
dw_campo.filter()

dwItemStatus ls_stat

ls_stat=uo_1.dw_diags.getitemstatus(1,0,primary!)

if dw_campo.find('tipo="M" and tipo_memo="D"',1,dw_campo.rowcount())>0 and (ls_stat=datamodified! or ls_stat=NewModified!) then
	string snulo
	setnull(snulo)
	uo_datastore ds_diag
	ds_diag=create uo_datastore
	if pos('2347',i_tingre)>0 then
		if i_ing_sal='I' then
			ds_diag.dataobject='dw_diags_hadmin'
			ds_diag.settransobject(sqlca)
			ds_diag.retrieve(i_nh,i_clug_nh,i_tingre)
			ds_diag.setitem(1,'diagingre',uo_1.dw_diags.getitemstring(1,'r_diagingre'))
			if uo_1.dw_diags.getitemstring(1,'c_diagcomplica')<>'' then 
				ds_diag.setitem(1,'diagcomplica',uo_1.dw_diags.getitemstring(1,'r_diagcomplica'))
			else
				ds_diag.setitem(1,'diagcomplica',snulo)
			end if
			if uo_1.dw_diags.getitemstring(1,'c_diagingre1')<>'' then 
				ds_diag.setitem(1,'diagingre1',uo_1.dw_diags.getitemstring(1,'r_diagingre1'))
			else
				ds_diag.setitem(1,'diagingre1',snulo)
			end if
			if uo_1.dw_diags.getitemstring(1,'c_diagingre2')<>'' then 
				ds_diag.setitem(1,'diagingre2',uo_1.dw_diags.getitemstring(1,'r_diagingre2'))
			else
				ds_diag.setitem(1,'diagingre2',snulo)
			end if
			if uo_1.dw_diags.getitemstring(1,'c_diagingre3')<>'' then 
				ds_diag.setitem(1,'diagingre3',uo_1.dw_diags.getitemstring(1,'r_diagingre3'))
			else
				ds_diag.setitem(1,'diagingre3',snulo)
			end if
			ds_diag.setitem(1,'tipodiagprin',uo_1.dw_diags.getitemstring(1,'tipo_diag'))
			ds_diag.setitem(1,'causaexterna',uo_1.dw_diags.getitemstring(1,'causaext'))
			
			ds_diag.setitem(1,'fin_consulta',uo_1.dw_diags.getitemstring(1,'finalidad'))
			elseif i_ing_sal='S' then
			ds_diag.dataobject='dw_diags_sale'
			ds_diag.settransobject(sqlca)
			if ds_diag.retrieve(i_nh,i_clug_nh,i_tingre)=0 then
				long sali
				ds_diag.insertrow(1)
				select max (nsalida) into :sali from hospsali;
				if sqlca.sqlcode=-1 then
					err=sqlca.sqlerrtext
					rollback;
					dw_histo.deleterow(1)
					dw_deta.reset()
					messagebox('Error leyendo hospsali',err)
					return -1
				end if
				ds_diag.setitem(1,'nsalida',sali)
				ds_diag.setitem(1,'nhosp',i_nh)
				ds_diag.setitem(1,'clugar_hadm',i_clug_nh)
				ds_diag.setitem(1,'codtingre',i_tingre)
				ds_diag.setitem(1,'fechaegreso',datetime(em_1.text))
				ds_diag.setitem(1,'horaegreso',datetime(em_1.text))
				ds_diag.setitem(1,'cusuario',usuario)
			end if
			ds_diag.setitem(1,'estadosalida',uo_1.dw_diags.getitemstring(1,'est_sale'))
			ds_diag.setitem(1,'diasincapacidad',uo_1.dw_diags.getitemNumber(1,'d_incap'))
			ds_diag.setitem(1,'cprof',i_cprof)
			ds_diag.setitem(1,'diagegreso',uo_1.dw_diags.getitemstring(1,'r_diagegreso'))
			if uo_1.dw_diags.getitemstring(1,'c_diagegreso1')<>'' then 
				ds_diag.setitem(1,'diagegreso1',uo_1.dw_diags.getitemstring(1,'r_diagegreso1'))
			else
				ds_diag.setitem(1,'diagegreso1',snulo)
			end if
			if uo_1.dw_diags.getitemstring(1,'c_diagegreso2')<>'' then 
				ds_diag.setitem(1,'diagegreso2',uo_1.dw_diags.getitemstring(1,'r_diagegreso2'))
			else
				ds_diag.setitem(1,'diagegreso2',snulo)
			end if
			if uo_1.dw_diags.getitemstring(1,'c_diagegreso3')<>'' then 
				ds_diag.setitem(1,'diagegreso3',uo_1.dw_diags.getitemstring(1,'r_diagegreso3'))
			else
				ds_diag.setitem(1,'diagegreso3',snulo)
			end if
			if uo_1.dw_diags.getitemstring(1,'c_diagcompli')<>'' then 
				ds_diag.setitem(1,'diagcomplica',uo_1.dw_diags.getitemstring(1,'r_diagcompli'))
			else
				ds_diag.setitem(1,'diagcomplica',snulo)
			end if
			if uo_1.dw_diags.getitemstring(1,'est_sale')='1' then
				ds_diag.setitem(1,'conductaurg',uo_1.dw_diags.getitemstring(1,'dest_urg'))
				ds_diag.setitem(1,'causamuerte',snulo)
				ds_diag.setitem(1,'defuncion',snulo)
			else
				ds_diag.setitem(1,'causamuerte',uo_1.dw_diags.getitemstring(1,'r_causamuerte'))
				ds_diag.setitem(1,'defuncion',uo_1.dw_diags.getitemstring(1,'acta_defunc'))
				ds_diag.setitem(1,'conductaurg',snulo)
			end if
		end if
	elseif i_tipo='C' or i_tipo='O'then//cons externa
		ds_diag.dataobject='dw_diags_cext'
		ds_diag.settransobject(sqlca)
		if ds_diag.retrieve(i_contador,i_clug)>0 then
			ds_diag.setitem(1,'tipodiagprin',uo_1.dw_diags.getitemstring(1,'tipo_diag'))
			ds_diag.setitem(1,'causaexterna',uo_1.dw_diags.getitemstring(1,'causaext'))
			ds_diag.setitem(1,'fin_consulta',uo_1.dw_diags.getitemstring(1,'finalidad'))
			
			if isnull(uo_1.dw_diags.getitemstring(1,'r_diagprin'))  or uo_1.dw_diags.getitemstring(1,'r_diagprin')='' then
				ds_diag.setitem(1,'diagprin',snulo)
			else
				ds_diag.setitem(1,'diagprin',uo_1.dw_diags.getitemstring(1,'r_diagprin'))
			end if
			
			if uo_1.dw_diags.getitemstring(1,'r_diagrel1')='' then
				ds_diag.setitem(1,'diagrel1',snulo)
			else
				ds_diag.setitem(1,'diagrel1',uo_1.dw_diags.getitemstring(1,'r_diagrel1'))
			end if
			
			if uo_1.dw_diags.getitemstring(1,'r_diagrel2')='' then
				ds_diag.setitem(1,'diagrel2',snulo)
			else
				ds_diag.setitem(1,'diagrel2',uo_1.dw_diags.getitemstring(1,'r_diagrel2'))
			end if
			
			if uo_1.dw_diags.getitemstring(1,'r_diagrel3')='' then
				ds_diag.setitem(1,'diagrel3',snulo)
			else
				ds_diag.setitem(1,'diagrel3',uo_1.dw_diags.getitemstring(1,'r_diagrel3'))
			end if
			
			if uo_1.dw_diags.getitemstring(1,'r_diagrel4')='' then
				ds_diag.setitem(1,'diagrel4',snulo)
			else
				ds_diag.setitem(1,'diagrel4',uo_1.dw_diags.getitemstring(1,'r_diagrel4'))
			end if
			
			if uo_1.dw_diags.getitemstring(1,'r_diagrel5')='' then
				ds_diag.setitem(1,'diagrel5',snulo)
			else
				ds_diag.setitem(1,'diagrel5',uo_1.dw_diags.getitemstring(1,'r_diagrel5'))
			end if
			
			if uo_1.dw_diags.getitemstring(1,'r_diagcompli')='' then
				ds_diag.setitem(1,'diagcompli',snulo)
			else
				ds_diag.setitem(1,'diagcompli',uo_1.dw_diags.getitemstring(1,'r_diagcompli'))
			end if
		end if
	end if
	if ds_diag.update(true,false)=-1 then 
		dw_histo.deleterow(1)
		dw_deta.reset()
		return -1
	end if
	ds_diag.resetupdate()
	post event cambio_diags()
end if
return 1
end function

public function integer valida_diags ();dw_campo.setfilter('')
dw_campo.filter()

if dw_campo.find('tipo="M" and tipo_memo="D"',1,dw_campo.rowcount())>0 then
	if pos('2347',i_tingre)>0 then
		if i_ing_sal='I' then
			if isnull(uo_1.dw_diags.getitemstring(1,'c_diagingre')) or uo_1.dw_diags.getitemstring(1,'c_diagingre')='' then
				messagebox('Atención','Debe digitar el Diagnóstico de Ingreso')
				return -1
			end if
			if isnull(uo_1.dw_diags.getitemstring(1,'tipo_diag')) or uo_1.dw_diags.getitemstring(1,'tipo_diag')='' then
				messagebox('Atención','Debe digitar el tipo del Diagnóstico Principal')
				return -1
			end if
			if isnull(uo_1.dw_diags.getitemstring(1,'finalidad')) or uo_1.dw_diags.getitemstring(1,'finalidad')='' then
				messagebox('Atención','Debe digitar la finalidad de la consulta')
				return -1
			end if
			if isnull(uo_1.dw_diags.getitemstring(1,'causaext')) or uo_1.dw_diags.getitemstring(1,'causaext')='' then
				messagebox('Atención','Debe digitar la causa externa')
				return -1
			end if		
		elseif i_ing_sal='S' then
			if isnull(uo_1.dw_diags.getitemstring(1,'c_diagegreso')) or uo_1.dw_diags.getitemstring(1,'c_diagegreso')='' then
				messagebox('Atención','Debe digitar el Diagnóstico de Egreso')
				return -1
			end if
			if isnull(uo_1.dw_diags.getitemstring(1,'est_sale')) or uo_1.dw_diags.getitemstring(1,'est_sale')='' then
				messagebox('Atención','Debe digitar el Estado a la Salida')
				return -1
			end if
			if uo_1.dw_diags.getitemstring(1,'est_sale')='1' then
				if isnull(uo_1.dw_diags.getitemstring(1,'dest_urg')) or uo_1.dw_diags.getitemstring(1,'dest_urg')='' then
					messagebox('Atención','Debe digitar el destino a la salida')
					return -1
				end if
			else
				if isnull(uo_1.dw_diags.getitemstring(1,'c_causamuerte')) or uo_1.dw_diags.getitemstring(1,'c_causamuerte')='' then
					messagebox('Atención','Debe digitar la causa de muerte')
					return -1
				end if
//				if isnull(uo_1.dw_diags.getitemstring(1,'acta_defunc')) or uo_1.dw_diags.getitemstring(1,'acta_defunc')='' then
//					messagebox('Atención','Debe digitar el nro de acta de defunción')
//					return -1
//				end if
			end if
		end if
	else//cons ext
		if isnull(uo_1.dw_diags.getitemstring(1,'c_diagprin')) or uo_1.dw_diags.getitemstring(1,'c_diagprin')='' then
			messagebox('Atención','Debe digitar el Diagnóstico Principal')
			return -1
		end if
		if isnull(uo_1.dw_diags.getitemstring(1,'tipo_diag')) or uo_1.dw_diags.getitemstring(1,'tipo_diag')='' then
			messagebox('Atención','Debe digitar el tipo del Diagnóstico Principal')
			return -1
		end if
		if isnull(uo_1.dw_diags.getitemstring(1,'finalidad')) or uo_1.dw_diags.getitemstring(1,'finalidad')='' then
			messagebox('Atención','Debe digitar la finalidad de la consulta')
			return -1
		end if
		if isnull(uo_1.dw_diags.getitemstring(1,'causaext')) or uo_1.dw_diags.getitemstring(1,'causaext')='' then
			messagebox('Atención','Debe digitar la causa externa')
			return -1
		end if
	end if
end if
return 1
end function

public subroutine navegar (keycode key);if i_modo='F' then return
if key=i_nextitem then
	dw_new.scrollnextrow()
elseif key=i_nextchild then
	dw_new.event doubleclicked(10,10,dw_new.getrow(),dw_new.object.label)
elseif key=i_previtem then
	dw_new.scrollpriorrow()
end if
if dw_new.getitemstring(dw_new.getrow(),'tipo')='M' then
	if dw_res_new.visible then
		dw_res_new.setfocus()
	else
		mle_2.setfocus()
	end if
else
	dw_new_det.setfocus()
end if

end subroutine

public subroutine move_data (string modo);long j, f, ncampo
string texto

if modo = 'F' then
	for j = 1 to dw_campo.RowCount()
		ncampo = dw_campo.GetItemNumber(j,'numcampo')
		f = dw_new_det.Find("numcampo="+string(ncampo),1,dw_new_det.RowCount())
		choose case dw_campo.GetItemString(j,'tipo')
			case 'S'
				dw_new_det.SetItem(f,'texto',dw_1.GetItemString(1,'seleccion_'+string(ncampo)))
			case 'N'
				dw_new_det.SetItem(f,'sino',dw_1.GetItemString(1,'sino_'+string(ncampo)))
			case 'L'
				dw_new_det.SetItem(f,'texto',dw_1.GetItemString(1,'lista_'+string(ncampo)))
			case 'T'
				string ojo
				ojo=dw_1.GetItemString(1,'texto_'+string(ncampo))
				dw_new_det.SetItem(f,'texto',ojo)
			case 'R'
				dw_new_det.SetItem(f,'numero',dw_1.GetItemNumber(1,'numero_'+string(ncampo)))
			case 'H'
				dw_new_det.SetItem(f,'tiempo',dw_1.GetItemDateTime(1,'fecha_'+string(ncampo)))
			case 'F'
				dw_new_det.SetItem(f,'fecha_cap',dw_1.GetItemDateTime(1,'fecha_'+string(ncampo)))
			case 'M'
				texto = dw_1.GetItemString(1,'memo_'+string(ncampo))
				if not isNull(texto) and texto <> '' then
					f = dw_campo.Find("numcampo="+string(ncampo),1,dw_campo.RowCount())
					if f > 0 then
						dw_campo.SetItem(f,'texto',texto)
					end if
					if dw_campo.GetItemNumber(f,'numcampo') = dw_new.GetItemNumber(dw_new.GetRow(),'numcampo') then
						f_pega_a_mle(mle_2,texto,3)
					end if
				end if
		end choose
	next
else
	mle_2.Visible = FALSE
	for j=1 to dw_campo.rowcount()
		if dw_campo.getitemstring(1,'tipo')<>'M' then continue
		if dw_campo.getitemstring(j,'texto')<>'' or dw_res_new.find('item_hc='+string(dw_campo.getitemnumber(j,'numcampo')),1,dw_res_new.rowcount())>0 then
			f_pega_a_mle(mle_2,dw_campo.getitemstring(j,'texto'),3)
			mle_2.SelectText(1,99999999)
			mle_2.Copy()
			dw_1.SetColumn('memo_'+string(dw_campo.getitemnumber(j,'numcampo')))
			dw_1.Paste()
		end if
	next
	dw_new.SetRedraw(FALSE)
	dw_new_det.SetFilter('')
	dw_new_det.Filter()
	for j = 1 to dw_new_det.RowCount()
		ncampo = dw_new_det.GetItemNumber(j,'numcampo')
		choose case dw_new_det.GetItemString(j,'tipo')
			case 'S'
				dw_1.SetItem(1,'seleccion_'+string(ncampo),dw_new_det.GetItemString(j,'texto'))
			case 'N'
				dw_1.SetItem(1,'sino_'+string(ncampo),dw_new_det.GetItemString(j,'sino'))
			case 'L'
				dw_1.SetItem(1,'lista_'+string(ncampo),dw_new_det.GetItemString(j,'texto'))
			case 'T'
				dw_1.SetItem(1,'texto_'+string(ncampo),dw_new_det.GetItemString(j,'texto'))
			case 'R'
				dw_1.SetItem(1,'numero_'+string(ncampo),dw_new_det.GetItemNumber(j,'numero'))
			case 'F'
				dw_1.SetItem(1,'fecha_'+string(ncampo),dw_new_det.GetItemDatetime(j,'fecha_cap'))
			case 'H'
				dw_1.SetItem(1,'fecha_'+string(ncampo),dw_new_det.GetItemDatetime(j,'tiempo'))				
		end choose
	next
	dw_new.SetRedraw(true)
end if

end subroutine

public function integer lf_crea_serving (long p_nreg);long j,norden,nitem_ord,conta_ord,nserv
string clug_ord
conta_ord=dw_procs_new.getitemnumber(1,'contador')
clug_ord=dw_procs_new.getitemstring(1,'clugar')
select max(nservicio) into :nserv from serviciosingreso where contador=:conta_ord and clugar=:clug_ord;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo max(serviciosingreso.nservicio)',sqlca.sqlerrtext)
	return -1
end if
if isnull(nserv) then nserv=0
for j=1 to dw_procs_new.rowcount()
	nserv++
	dw_procs_new.setitem(j,'nservicio',nserv)
	dw_procs_new.setitem(j,'nregistro_hc',p_nreg)
	dw_procs_new.setitem(j,'estria',dw_procs_new.getitemstring(j,'estado'))
	dw_procs_new.setitem(j,'cod_modrel',ls_modrel)
next
if dw_procs_new.update(true,false)=-1 then return -1
for j=1 to dw_procs_new.rowcount()
	conta_ord=dw_procs_new.getitemnumber(j,'conta_orden')
	clug_ord=dw_procs_new.getitemstring(j,'clug_orden')
	norden=dw_procs_new.getitemnumber(j,'norden_serv')
	nitem_ord=dw_procs_new.getitemnumber(j,'item_orden')
	update oscuerpo set suministrada=suministrada +1 where contador=:conta_ord and clugar=:clug_ord
	and nsolicitud=:norden and item=:nitem_ord;
	if sqlca.sqlcode=-1 then
		messagebox('Error actualizando cantidades de OsCuerpo',sqlca.sqlerrtext)
		return -1
	end if
next
update oscuerpo set estado='2' where suministrada=solicitada and estado='1' and 
contador=:conta_ord and clugar=:clug_ord and nsolicitud=:norden;
if sqlca.sqlcode=-1 then
	messagebox('Error actualizando estados de oscuerpo',sqlca.sqlerrtext)
	return -1
end if
select count(item) into :j from oscuerpo 
where contador=:conta_ord and clugar=:clug_ord and nsolicitud=:norden
and estado='1';//sin atender
if j=0  then
	update oscabeza set estado='2' where contador=:conta_ord and clugar=:clug_ord and nsolicitud=:norden;
else
	update oscabeza set estado='1' where contador=:conta_ord and clugar=:clug_ord and nsolicitud=:norden;
end if
if sqlca.sqlcode=-1 then
	messagebox('Error actualizando estado de oscabeza',sqlca.sqlerrtext)
	return -1
end if
if isvalid(i_dw_oscab) then i_dw_oscab.event rowfocuschanged(i_dw_oscab.getrow())
return 1
end function

public function integer f_cambia_espe (string p_espe);dw_new_det.accepttext()
if i_cambia then
	choose case messagebox('Atención','Realizó cambios en la plantilla de '+i_message+', desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then
				rollback;
				return -1
			else
				commit;
			end if
		case 2
			i_cambia=false
		case 3
			return -1
	end choose
end if
i_cespe=p_espe
if idw_plants.retrieve(i_tipo,i_tingre,i_ing_sal,i_cespe,sex_busca,edad_busca,i_codfina)>0 then
	dw_plants.setitem(1,1,idw_plants.getitemstring(1,'codplantilla'))
else
	dw_plants.setitem(1,1,'')
end if


dw_plants.event itemchanged(1,dw_plants.object.codplantilla,dw_plants.getitemstring(1,1))

return 1
end function

public function integer f_sivigila ();if i_tipo='S' then return 1
if dw_campo.find('tipo="M" and tipo_memo="D"',1,dw_campo.rowcount())>0 and uo_1.dw_diags.getitemstatus(1,0,primary!)=datamodified! then
//	if (pos('234',i_tingre)>0 and i_ing_sal='S') or (pos('234',i_tingre)=0) then
	if (pos('2347',i_tingre)>0 ) or (pos('2347',i_tingre)=0) then
		if uo_1.dw_diags.getitemnumber(1,'sivigila')=0 then return 1
		long cuantos
		string err
		select count(*) into :cuantos from hclin_registro where contador=:i_contador and clugar=:i_clug and tipo='S';
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error leyendo hclin_registro',err)
			return -1
		end if
		if cuantos=0 then
			select count(*) into :cuantos from hclin_plant where tipo='S';
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error leyendo hclin_plant',err)
				return -1
			end if 
			if cuantos=0 then
				messagebox('Atención','No existen platillas de tipo SIVIGILA, consulte con el administrador del sistema')
				return -1
			end if
			st_xa_sivigila st
			string i_plantilla
			st.contador=i_contador
			st.clug=i_clug
			st.cespe=i_cespe
			st.cemp=i_cemp
			st.ccont=i_ccont
			st.cprof=i_cprof
			st.tingres=i_tingre
			i_plantilla=uo_1.dw_diags.getitemstring(1,'vigila_plantilla')
			st.plantilla=i_plantilla
			openwithparm(w_sivigila,st)
			if message.stringparm='' then return -1
			i_sivigila=true 
		end if
	end if
end if
return 1
end function

public function string traduce_fmla (string fmla);string formula, campo
integer i, f, cars

formula = fmla
i = pos(formula, '@', 1)
do while i > 0
	cars = pos(formula, '@', i + 1) - i - 1
	campo = mid(formula, i + 1, cars)
	f = dw_campo.find("descampo='"+campo+"'", 1, dw_campo.rowCount())
	if f > 0 then
		formula = replace(formula, i, cars + 2, dw_campo.getItemString(f,'nombre'))
	else
		return "!"
	end if
	i = pos(formula, '@', 1)
loop
return formula

end function

public subroutine inicia_objs_ordenes (ref singlelineedit p_sle_proc, singlelineedit p_sle_med, picturebutton p_new_orden, datawindow p_dw_oscab, singlelineedit p_sle_otros, singlelineedit p_sle_tiporep, string p_cesp, singlelineedit p_sle_kits);isle_proc=p_sle_proc
isle_med=p_sle_med
isle_tiporep=p_sle_tiporep
ipb_new_orden=p_new_orden
i_dw_oscab=p_dw_oscab
sle_otros=p_sle_otros
isle_kits=p_sle_kits
i_cespe=p_cesp



end subroutine

public function integer retrieve (long p_contador, string p_clug, string p_tipo, string p_tingre, string p_ingreso, string p_cespe, string p_cemp, string p_ccont, string p_cprof, long p_nactoqx, string p_clug_qx, string p_plantilla, string p_codfina);//es como un inicia

setpointer(hourglass!)
w_principal.setMicroHelp('Migrando Historia Clínica !!')
if gf_revisa_migracion(p_clug , p_contador)<0 then //M I G R A C I O N    D E    H I S T O R I A     C L Í N I C A 
	setpointer(arrow!)
	return -1
end if
w_principal.setMicroHelp('Gestión Clínica Integrada')

boolean l_paso=false
i_contador=p_contador
i_clug=p_clug
i_tipo=p_tipo
i_cespe=p_cespe
i_tingre=p_tingre
if isnull(p_ingreso) then p_ingreso=''
i_ing_sal=p_ingreso
i_pingsal=p_ingreso
i_ptipo= p_tipo
i_nactoqx=p_nactoqx
i_clug_qx=p_clug_qx
i_codfina=p_codfina
sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
if p_tipo='E' or p_tipo='R' then cbx_3.visible=true
dw_histo.reset()
idw_plants.reset()
if i_tipo='Q' then
	if dw_histo.dataobject<>'dw_histo_regs_qx' then
		dw_histo.dataobject='dw_histo_regs_qx'
		dw_histo.settransobject(sqlca)
	end if
	ids_hijos_histo.retrieve(i_contador,i_clug)
	dw_deta.retrieve(i_contador,i_clug,i_tipo,i_tingre,i_ing_sal)
	dw_histo.retrieve(i_contador,i_clug,i_tipo,i_tingre,i_ing_sal,i_nactoqx,i_clug_qx)
else
	if dw_histo.dataobject<>'dw_histo_regs' then
		dw_histo.dataobject='dw_histo_regs'
		dw_histo.settransobject(sqlca)
	end if
	ids_hijos_histo.retrieve(i_contador,i_clug)
	dw_deta.retrieve(i_contador,i_clug,i_tipo,i_tingre,i_ing_sal)
	dw_histo.retrieve(i_contador,i_clug,i_tipo,i_tingre,i_ing_sal)
end if

idw_plants.retrieve(i_tipo,i_tingre,i_ing_sal,i_cespe,sex_busca,edad_busca,i_codfina)
if idw_plants.rowcount()=0 then
	MessageBox("Atención","No existen Plantillas para edad del paciente verifique con Administrador del Sistema"+i_tipo+i_tingre+i_ing_sal)
	Return -1	
end if
i_cemp=p_cemp
i_ccont=p_ccont
i_cprof=p_cprof
em_1.text=string(datetime(today(),now()),'dd/mm/yyyy hh:mm')
i_puede_modif=false

if pos('2347T',i_tingre)>0 then //es urg hosp o ambu
	select hospadmi.NH, hospadmi.clugar, hospadmi.estado, tipoingreso.gserv into :i_NH,:i_clug_nh,:i_estado_hadm,:ls_modrel
	from hospadmi inner join tipoingreso ON hospadmi.codtingre = tipoingreso.codtingre
	where hospadmi.contador=:i_contador and hospadmi.clugar_his=:i_clug;
	IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
		MessageBox("No existe registro en HospAdmi", SQLCA.SQLErrText)
		setpointer(arrow!)
		Return -1
	END IF
	string temp
	select edita_his into :temp from usuarios where usuario=:usuario;
	IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
		MessageBox("No se puede leer usuarios.edita_his", SQLCA.SQLErrText)
		Return -1
	END IF
	if not isnull(i_cprof)  and i_cprof <> '' then 
		SELECT Profe.control into :i_control FROM Profe
		WHERE Profe.CodProf=:i_cprof;
		IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
			MessageBox("No se puede leer profe control", SQLCA.SQLErrText)
			Return -1
		END IF
	End If
	if temp='1' then i_puede_modif=true
end if

if i_tingre='1' then
	if p_plantilla='0' then
		cb_modo.enabled=false
		dw_plants.enabled=false
		dw_new.enabled=false
		dw_new_det.enabled=false
		mle_2.enabled=false
		idw_plants.reset()
	Else
		cb_modo.enabled=true
		dw_plants.enabled=true
		dw_new.enabled=true	
		dw_new_det.enabled=true	
		mle_2.enabled=true	
	end IF
	ls_modrel='01'
end If
if idw_plants.rowcount()=1 then
	dw_plants.setitem(1,1,idw_plants.getitemstring(1,'codplantilla'))
	dw_plants.event itemchanged(1,dw_plants.object.codplantilla,idw_plants.getitemstring(1,'codplantilla'))
end if

if i_fecha='1' then 
	em_1.enabled=true
else 
	em_1.enabled=false 
end  if

dw_histo.post event rowfocuschanged(dw_histo.getrow())


int pendientedx 
select
	count(1) into :pendientedx 
from 
	((resultadoscab inner join resultadoscpo on (resultadoscab.nrepor = resultadoscpo.nrepor) 
	and (resultadoscab.clugar = resultadoscpo.clugar) and (resultadoscab.coddoc = resultadoscpo.coddoc)) 
	inner join serviciosadx on (resultadoscpo.item = serviciosadx.item) and (resultadoscpo.nrepor = serviciosadx.nrepor) 
	and (resultadoscpo.clugar = serviciosadx.clugar_res) and (resultadoscpo.coddoc = serviciosadx.coddoc)) 
	inner join ingresoadx on (serviciosadx.ningreso = ingresoadx.ningreso) and (serviciosadx.codaadx = ingresoadx.codaadx) 
	and (serviciosadx.clugar = ingresoadx.clugar)
where 
	(((resultadoscpo.contador_hc) is null) and ((resultadoscab.tipodoc)=:tipdoc) 
	and ((resultadoscab.documento)=:docu) and ((serviciosadx.estado)='7') 
	and ((ingresoadx.tipo_ingres)='1'));

IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
	MessageBox("No se puede leer paraclicinos si hay", SQLCA.SQLErrText)
	setpointer(arrow!)
	Return -1
END IF
	
if  pendientedx =0 then
	pb_pvisible.visible=false
else
	pb_pvisible.visible=false
end if
SELECT cadena into :g_ctrlv
FROM parametros_gen
WHERE (((codigo_para)=16));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 16')
	setpointer(arrow!)
	return -1
end if

g_ctrlv='0'

SELECT cadena into :ls_antece_si
FROM parametros_gen
WHERE (((codigo_para)=67));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 67')
	setpointer(arrow!)
	return -1
end if

SELECT cadena into :is_202
FROM parametros_gen
WHERE (((codigo_para)=81));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 81')
	return -1
end if

setpointer(arrow!)

return 1
end function

on uo_hclin.create
this.cb_modo=create cb_modo
this.dw_img_new=create dw_img_new
this.pb_4=create pb_4
this.pb_2=create pb_2
this.dw_vrs=create dw_vrs
this.dw_campo=create dw_campo
this.cbx_3=create cbx_3
this.st_4=create st_4
this.st_vert2=create st_vert2
this.st_vertical=create st_vertical
this.dw_histo=create dw_histo
this.em_1=create em_1
this.st_muestra=create st_muestra
this.dw_serv_old=create dw_serv_old
this.uo_1=create uo_1
this.dw_captur_histo=create dw_captur_histo
this.st_1=create st_1
this.dw_ls=create dw_ls
this.pb_pvisible=create pb_pvisible
this.dw_meds_new=create dw_meds_new
this.dw_res_old=create dw_res_old
this.pb_1=create pb_1
this.dw_img_old=create dw_img_old
this.dw_procs_new=create dw_procs_new
this.t_procs=create t_procs
this.t_result_old=create t_result_old
this.t_procs_old=create t_procs_old
this.t_result=create t_result
this.dw_new=create dw_new
this.dw_1=create dw_1
this.dw_deta=create dw_deta
this.dw_plants=create dw_plants
this.dw_res_new=create dw_res_new
this.mle_2=create mle_2
this.mle_3=create mle_3
this.mle_1=create mle_1
this.dw_new_det=create dw_new_det
this.Control[]={this.cb_modo,&
this.dw_img_new,&
this.pb_4,&
this.pb_2,&
this.dw_vrs,&
this.dw_campo,&
this.cbx_3,&
this.st_4,&
this.st_vert2,&
this.st_vertical,&
this.dw_histo,&
this.em_1,&
this.st_muestra,&
this.dw_serv_old,&
this.uo_1,&
this.dw_captur_histo,&
this.st_1,&
this.dw_ls,&
this.pb_pvisible,&
this.dw_meds_new,&
this.dw_res_old,&
this.pb_1,&
this.dw_img_old,&
this.dw_procs_new,&
this.t_procs,&
this.t_result_old,&
this.t_procs_old,&
this.t_result,&
this.dw_new,&
this.dw_1,&
this.dw_deta,&
this.dw_plants,&
this.dw_res_new,&
this.mle_2,&
this.mle_3,&
this.mle_1,&
this.dw_new_det}
end on

on uo_hclin.destroy
destroy(this.cb_modo)
destroy(this.dw_img_new)
destroy(this.pb_4)
destroy(this.pb_2)
destroy(this.dw_vrs)
destroy(this.dw_campo)
destroy(this.cbx_3)
destroy(this.st_4)
destroy(this.st_vert2)
destroy(this.st_vertical)
destroy(this.dw_histo)
destroy(this.em_1)
destroy(this.st_muestra)
destroy(this.dw_serv_old)
destroy(this.uo_1)
destroy(this.dw_captur_histo)
destroy(this.st_1)
destroy(this.dw_ls)
destroy(this.pb_pvisible)
destroy(this.dw_meds_new)
destroy(this.dw_res_old)
destroy(this.pb_1)
destroy(this.dw_img_old)
destroy(this.dw_procs_new)
destroy(this.t_procs)
destroy(this.t_result_old)
destroy(this.t_procs_old)
destroy(this.t_result)
destroy(this.dw_new)
destroy(this.dw_1)
destroy(this.dw_deta)
destroy(this.dw_plants)
destroy(this.dw_res_new)
destroy(this.mle_2)
destroy(this.mle_3)
destroy(this.mle_1)
destroy(this.dw_new_det)
end on

event constructor;ids_hijos_histo=create uo_datastore
ids_hijos_histo.dataobject='dw_hclin_arma_histo'
ids_hijos_histo.settransobject(sqlca)

end event

type cb_modo from picturebutton within uo_hclin
boolean visible = false
integer x = 1344
integer y = 800
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
boolean enabled = false
boolean originalsize = true
string picturename = "arbol.gif"
string disabledname = "d_arbol.gif"
alignment htextalign = left!
string powertiptext = "Modo de Visualización"
end type

event clicked;if dw_1.rowcount()=0 or dw_new.rowcount()=0 then return
move_data(i_modo)
if i_modo = 'A' then
	i_modo = 'F'
	picturename='arbol.gif'
	dw_new.Visible = FALSE
	st_vert2.Visible = FALSE
	dw_res_new.Visible = FALSE
	dw_img_new.Visible = FALSE
	dw_new_det.Visible = FALSE
	mle_2.Visible = FALSE
	dw_procs_new.visible=false
	t_result.Visible = FALSE
	dw_1.Visible = TRUE
	dw_1.setfocus()
else
	i_modo = 'A'
	picturename='formulario.gif'
	dw_new.Visible = TRUE
	st_vert2.Visible = TRUE
	dw_res_new.Visible = TRUE
	dw_img_new.Visible = TRUE
	dw_new_det.Visible = TRUE
	mle_2.Visible = TRUE
	t_result.Visible = TRUE
	dw_1.Visible = FALSE
	dw_new.event rowfocuschanged(dw_new.getrow())
	dw_new.setfocus()
end if
BringtoTop = TRUE

end event

event constructor;if i_displayonly = TRUE then Visible = FALSE
end event

type dw_img_new from datawindow within uo_hclin
integer x = 1582
integer y = 980
integer width = 4402
integer height = 1152
integer taborder = 70
string title = "none"
string dataobject = "dw_resultados_imagen"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_4 from pb_report within uo_hclin
boolean visible = false
integer x = 672
integer width = 91
integer height = 80
integer taborder = 30
string text = "        &b"
boolean originalsize = false
string picturename = "print2.gif"
string disabledname = "print2.gif"
string powertiptext = "Imprimir Reporte de Formato"
string cod_rep = "HF"
string nombre_rep = "Reporte de Formatos"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[4]
if dw_histo.rowcount()=0 then return
if dw_histo.find('impri=1',1,dw_histo.rowcount())=0 then return
st_filtros_hc st

par[1]=dw_histo.getitemnumber(1,"contador")
par[2]=dw_histo.getitemstring(1,"clugar")
par[3]=dw_histo.getitemnumber(1,"nregistro")
par[4]=dw_histo.getitemstring(1,"codplantilla")
imprimir(par,'','0')

end event

type pb_2 from picturebutton within uo_hclin
integer x = 549
integer width = 96
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir la Selección"
end type

event clicked;if f_permiso_boton(this,'EVOL')=0 then return
if dw_histo.rowcount()=0 then return
if dw_histo.find('impri=1',1,dw_histo.rowcount())=0 then return
st_filtros_hc st
st.dw_histo=dw_histo
st.dw_vals=dw_deta
openwithparm(w_print_ped_hc,st)
end event

event constructor;f_inicia_boton(this,'EVOL')
end event

type dw_vrs from datawindow within uo_hclin
event type integer revisa_padre ( long ncampo )
boolean visible = false
integer x = 187
integer y = 2160
integer width = 215
integer height = 60
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_hc_reg_valor"
boolean resizable = true
boolean livescroll = true
end type

event type integer revisa_padre(long ncampo);if ncampo = 0 then return 0
if find('item='+string(ncampo),1,RowCount())=0 then
	long src, dst
	src = dw_campo.find('numcampo='+string(ncampo),1,dw_campo.rowcount())
	dst = InsertRow(getRow())
	setitem(dst,'item',dw_campo.getitemnumber(src,'numcampo'))
	setitem(dst,'padre',dw_campo.getitemnumber(src,'padre'))
	setitem(dst,'orden',dw_campo.getitemnumber(src,'orden'))
	setitem(dst,'descampo',dw_campo.getitemstring(src,'descampo'))
	setitem(dst,'tipo',dw_campo.getitemstring(src,'tipo'))
	event revisa_padre(dw_campo.getItemNumber(src,'padre'))
end if
Return 0

end event

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())

end event

type dw_campo from datawindow within uo_hclin
event type integer addcontrol ( integer fila )
event type integer addchildren ( string padre,  integer nivel )
event type integer revisar ( )
event clean_fields ( )
boolean visible = false
integer x = 430
integer y = 2172
integer width = 155
integer height = 44
integer taborder = 50
string title = "none"
string dataobject = "dw_plan_campos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer addcontrol(integer fila);string modifica, nombre, medida,oblig,colores='0' ,ls_visible,fondo='16777215',modob='1'
long i, ncampo

ncampo = GetItemNumber(fila,'numcampo')
nombre = GetItemString(fila,'descampo')
medida = GetItemString(fila,'medida')
oblig=GetItemString(fila,'obligatorio')

if oblig='1' then
	colores='134217857'
	fondo='15780518~trgb (112,146,190)'
	modob='2'
	nombre='* '+nombre
End If

if isnull(medida) then medida=''
if isnull(nombre) then nombre='campo '+string(ncampo)

////Tipo de Control
// Etiqueta
ls_visible = trim(GetItemString(fila,'frm_visible'))
if isNull(ls_visible) or ls_visible = '' then
	ls_visible = '"1"'
else
	ls_visible = f_remplaza(ls_visible, '"','~~"')
	ls_visible = traduce_fmla(ls_visible)
	ls_visible = '"1~~t '  + ls_visible + ' " '
end if

if GetItemString(fila,'tipo') = 'E' then
	consec = consec + 1
	if colum = 1 then PosY = PosY + altura
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=etiqueta_'+string(ncampo)+' dbname="etiqueta_'+string(ncampo)+'" initial="'+nombre+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence=0 border="0" color="33554432" x="'+String(PosX)+'" y="'+string(posY)+'" height="56" width="2200" format="[general]" html.valueishtml="0"  name=etiqueta_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible=' +ls_visible+ ' edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424")~r~n'
	PosY = PosY + 100
	altura = 0 
	colum = 0
end if

// Seleccion
if GetItemString(fila,'tipo') = 'S' then 
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="'+colores+'" x="'+String(PosX + colum*2300)+'" y="'+string(PosY)+'" height="56" width="2200" html.valueishtml="0"  name=selec_'+string(ncampo)+'_t visible=' +ls_visible+ '  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="'+modob+'" background.color="'+fondo+'"  height.autosize=yes)~r~n'	
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=seleccion_'+string(ncampo)+' dbname="seleccion_'+string(ncampo)+'" values="	1/	0" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*2300)+'" y="'+string(PosY + 80)+'" height="56" width="105" format="[general]" html.valueishtml="0"  name=seleccion_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible=' +ls_visible+ ' checkbox.text="" checkbox.on="1" checkbox.off="0" checkbox.scale=no checkbox.threed=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )~r~n'
	if colum = 1 then 
		if altura > 170 then
			PosY = Posy + altura
		else
			PosY = PosY + 170
		end if
		colum = 0
	else
		altura = 170
		colum = 1
	end if
end if

// Si / No
if GetItemString(fila,'tipo') = 'N' then
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="'+colores+'" x="'+String(PosX + colum*2300)+'" y="'+string(PosY)+'" height="56" width="2200" html.valueishtml="0"  name=sino_'+string(ncampo)+'_t visible=' +ls_visible+ '  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="'+modob+'" background.color="'+fondo+'" height.autosize=yes)~r~n'	
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=sino_'+string(ncampo)+' dbname="sino_'+string(ncampo)+'" values="Si	1/No	0/" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*2300)+'" y="'+string(PosY+80)+'" height="56" width="393" format="[general]" html.valueishtml="0"  name=sino_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible=' +ls_visible+ ' radiobuttons.columns=2 radiobuttons.scale=no radiobuttons.threed=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )~r~n'
	if colum = 1 then 
		if altura > 170 then
			PosY = Posy + altura
		else
			PosY = PosY + 170
		end if
		colum = 0
	else
		altura = 170
		colum = 1
	end if
end if
// Lista
if GetItemString(fila,'tipo') = 'L'  or GetItemString(fila,'tipo') = 'I' then
	dw_ls.Retrieve(GetItemString(fila,'codplantilla'),GetItemNumber(fila,'numcampo'))
	for i = 1 to dw_ls.RowCount()
		if not isnull(dw_ls.GetItemString(i,'descripcion') ) then
		   modifica = modifica + dw_ls.GetItemString(i,'descripcion') + "~t" + dw_ls.GetItemString(i,'descripcion') + "/"
		end if
	next
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="'+colores+'" x="'+String(PosX + colum*2300)+'" y="'+string(PosY)+'" height="56" width="2200" html.valueishtml="0"  name=lista_'+string(ncampo)+'_t visible=' +ls_visible+ '  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="'+modob+'" background.color="'+fondo+'"  height.autosize=yes)~r~n'	
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=lista_'+string(ncampo)+' dbname="lista_'+string(ncampo)+'" values="'+modifica+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*2300)+'" y="'+string(PosY+80)+'" height="56" width="2200" format="[general]" html.valueishtml="0"  name=lista_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible=' +ls_visible+ ' ddlb.limit=0 ddlb.allowedit=no ddlb.case=any ddlb.vscrollbar=yes ddlb.useasborder=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	if colum = 1 then 
		if altura > 170 then
			PosY = Posy + altura
		else
			PosY = PosY + 170
		end if
		colum = 0
	else
		altura = 170
		colum = 1
	end if
end if
// texto
if GetItemString(fila,'tipo') = 'T' then		
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="'+colores+'" x="'+String(PosX + colum*2300)+'" y="'+string(PosY)+'" height="56" width="2220" html.valueishtml="0"  name=texto_'+string(ncampo)+'_t visible='+ ls_visible+'  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="'+modob+'" background.color="'+fondo+'" height.autosize=yes )~r~n'
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=texto_'+string(ncampo)+' dbname="texto_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*2300)+'" y="'+string(PosY+80)+'" height="132" width="2200" format="[general]" html.valueishtml="0"  name=texto_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible=' +ls_visible+ ' edit.limit=255 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autovscroll=yes edit.vscrollbar=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	if colum = 1 then 
		if altura > 270 then
			PosY = Posy + altura
		else
			PosY = PosY + 270
		end if
		colum = 0
	else
		altura = 270
		colum = 1
	end if
end if
// Memo
if GetItemString(fila,'tipo') = 'M' then
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0"  color="'+colores+'" x="'+String(PosX + colum*2300)+'" y="'+string(PosY)+'" height="56" width="2200" html.valueishtml="0"  name=memo_'+string(ncampo)+'_t visible=' +ls_visible+ '  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="'+modob+'" background.color="'+fondo+'"  height.autosize=yes)~r~n'
	i_campos = i_campos + 'column=(type=char(32766) updatewhereclause=yes name=memo_'+string(ncampo)+' dbname="memo_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*2300)+'" y="'+string(PosY+80)+'" height="696" width="2200" format="[general]" html.valueishtml="0"  name=memo_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible=' +ls_visible+ ' edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autovscroll=yes edit.vscrollbar=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	if GetItemString(fila,'tipo_memo') = 'R' then
		i_columnas = i_columnas + 'button(band=detail text="Resultados" enabled=yes action="0" border="1" color="0" x="'+String(PosX + colum*2300 + 1180)+'" y="'+string(PosY+80+700)+'" height="64" width="274" vtextalign="0" htextalign="0"  name=b_1 visible=' +ls_visible+ '  font.face="Tahoma" font.height="-7" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" )~r~n'
	end if

	if colum = 1 then 
		if altura > 870 then
			PosY = Posy + altura
		else
			PosY = PosY + 870
		end if
		colum = 0
	else
		altura = 870
		colum = 1
	end if

end if
// Numerico
if GetItemString(fila,'tipo') = 'R' then
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="'+colores+'" x="'+String(PosX + colum*2300)+'" y="'+string(PosY)+'" height="56" width="2200" html.valueishtml="0"  name=numero_'+string(ncampo)+'_t visible=' +ls_visible+ '  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="'+modob+'" background.color="16777215"  height.autosize=yes)~r~n'
	i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=numero_'+string(ncampo)+' dbname="numero_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="1" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*2300)+'" y="'+string(PosY+80)+'" height="56" width="270" format="[general]" html.valueishtml="0"  name=numero_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible=' +ls_visible+ ' editmask.spin=yes editmask.mask="###,###.00" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+medida+'" border="0" color="0" x="'+String(PosX + colum*2300 + 310)+'" y="'+string(PosY+80)+'" height="56" width="2200" html.valueishtml="0"  name=medida_'+string(ncampo)+'_t visible=' +ls_visible+ '  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	if colum = 1 then 
		if altura > 270 then
			PosY = Posy + altura
		else
			PosY = PosY + 270
		end if
		colum = 0
	else
		altura = 270
		colum = 1
	end if
end if
// Fecha
if GetItemString(fila,'tipo') = 'F' then 
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="'+colores+'" x="'+String(PosX + colum*2300)+'" y="'+string(PosY)+'" height="56" width="2200" html.valueishtml="0"  name=fecha_'+string(ncampo)+'_t visible=' +ls_visible+ '  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="'+modob+'" background.color="16777215"  height.autosize=yes )~r~n'
	i_campos = i_campos + 'column=(type=datetime updatewhereclause=yes name=fecha_'+string(ncampo)+'  dbname="fecha_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*2300)+'" y="'+string(PosY+80)+'" height="56" width="361" format="dd/mm/yyyy" html.valueishtml="0"  name=fecha_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible=' +ls_visible+ ' editmask.spin=yes editmask.mask="dd/mm/yyyy" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	if colum = 1 then 
		if altura > 270 then
			PosY = Posy + altura
		else
			PosY = PosY + 270
		end if
		colum = 0
	else
		altura = 270
		colum = 1
	end if
end if
Return 0

end event

event type integer addchildren(string padre, integer nivel);long fila, f, i, cant
integer ret
st_uobject st_uo
string modifica, texto

fila = dw_campo.Find("padre=" + padre,1,dw_campo.RowCount())
do while fila > 0
	cant = cant + 1
	PosX = 30 * Nivel
	if Event addControl(fila) = -1 then
		MessageBox('Error','Error Adicionando control')
		Return -1
	end if
	ret = Event addChildren(String(dw_campo.GetItemNumber(fila,'numcampo')), Nivel + 1)
	if fila = dw_campo.RowCount() then EXIT
	fila = dw_campo.Find("padre=" + padre,fila + 1,dw_campo.RowCount())
	if fila = 0 and ret = 0 and colum = 1 then 
		PosY = PosY + altura
		colum = 0
	end if
loop
Return cant

end event

event type integer revisar();if rowcount() = 0 then Return -1
integer i, f, Nivel=1, col = 0
long padre,f_pad
PosX = 10
PosY = 10

for i = 1 to this.RowCount()
	padre=GetItemNumber(i,'padre')
	f_pad=find('numcampo='+string(padre),1,rowcount())
	if isnull(padre) or (f_pad=0 and padre<>0 ) then 
		MessageBox('Atención','La plantilla tiene campos erróneos, revisela para poder trabajar con ella (Hay campos que no tienen campo padre)')
		return -1
	end if
	if padre<>0 then
		if getitemstring(f_pad,'tipo')<>'E' then
			MessageBox('Atención','La plantilla tiene campos errónes, revisela para poder trabajar con ella (Hay campos cuyo padre no es etiqueta)')
			return -1
		end if
	end if
	if padre = 0 then
		if event addControl(i) = -1 then
			MessageBox('Error','Error Adicionando control')
			Return -1
		end if
		// Children
		event addChildren(String(this.GetItemNumber(i,'numcampo')), Nivel + 1)
	end if
next
return 1
end event

event clean_fields();long j 
setfilter("")
filter()
for j=1 to rowcount()
	if getitemstring(j,'tipo')<>'M' then continue
	setitem(j,'texto','')
next
end event

event constructor;setTransObject(SQLCA)

end event

type cbx_3 from checkbox within uo_hclin
boolean visible = false
integer x = 549
integer y = 908
integer width = 334
integer height = 56
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Importante"
end type

event constructor;if i_displayonly = TRUE then Visible = FALSE

end event

type st_4 from statictext within uo_hclin
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
integer y = 740
integer width = 5952
integer height = 12
string dragicon = "Exclamation!"
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeNS!"
long textcolor = 255
long backcolor = 255
long bordercolor = 276856960
boolean focusrectangle = false
end type

event mousemove;If KeyDown(keyLeftButton!) Then
	y = Parent.Pointery()
End If

end event

event mouseup;parent.setredraw(false)
moverv(y)
BackColor = parent.backcolor
parent.setredraw(true)
end event

event mousedown;SetPosition(ToTop!)
BackColor = 0  // Show Bar in Black while being moved.

end event

event constructor;backcolor=parent.backcolor
if i_displayonly = TRUE then Visible = FALSE

end event

type st_vert2 from statictext within uo_hclin
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
integer x = 1522
integer y = 744
integer width = 14
integer height = 1500
string dragicon = "Exclamation!"
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeWE!"
long textcolor = 255
long backcolor = 255
long bordercolor = 276856960
boolean focusrectangle = false
end type

event mousemove;If KeyDown(keyLeftButton!) Then
	X = Parent.PointerX()
End If

end event

event mouseup;parent.setredraw(false)
mover2(x)
BackColor = parent.backcolor
parent.setredraw(true)
end event

event mousedown;SetPosition(ToTop!)
BackColor = 0  // Show Bar in Black while being moved.

end event

event constructor;backcolor=parent.backcolor
if i_displayonly = TRUE then Visible = FALSE

end event

type st_vertical from statictext within uo_hclin
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
integer x = 2048
integer y = 4
integer width = 14
integer height = 740
string dragicon = "Exclamation!"
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeWE!"
long textcolor = 255
long backcolor = 255
long bordercolor = 276856960
boolean focusrectangle = false
end type

event mousemove;If KeyDown(keyLeftButton!) Then
	X = Parent.PointerX()
End If

end event

event mouseup;parent.setredraw(false)
mover(x)
BackColor = parent.backcolor
parent.setredraw(true)
end event

event mousedown;SetPosition(ToTop!)
BackColor = 0  // Show Bar in Black while being moved.

end event

event constructor;backcolor=parent.backcolor
end event

type dw_histo from datawindow within uo_hclin
event crea_hijos ( long row )
event rec_mostrar ( long p_fila,  long p_inicial,  integer p_visible )
event type long inserta ( long p_pos,  string p_label,  integer p_nivel,  long p_padre,  long p_hijos,  string p_tipo_campo,  long p_contador,  string p_clug,  long p_nreg,  long p_item,  string p_tipo_memo,  long p_orden,  datetime p_fecha,  string p_cprof,  string p_cesp )
event type long rec_crea_hijos ( long p_padre,  long p_nivel,  long p_fila )
event keypres pbm_dwnkey
event rec_selecc ( long p_fila,  long p_inicial,  integer p_selec )
event p_itemchanged ( long p_row,  string p_colu,  any p_dato )
event rec_revisa_padre ( long p_fila )
event modifica ( )
integer y = 88
integer width = 2002
integer height = 628
integer taborder = 10
string title = "none"
string dataobject = "dw_histo_regs"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event crea_hijos(long row);setitem(row,'est_revisa',1)
event rec_crea_hijos(0,1,row)
resetupdate()
end event

event rec_mostrar(long p_fila, long p_inicial, integer p_visible);long j,cual,p_mostrar
p_mostrar=p_visible
if p_fila<>p_inicial then
	p_mostrar=0
	if p_visible=1 and getitemstring(p_fila,'estado')='1' then p_mostrar=1
end if
if getitemnumber(p_fila,'hijos')>0 then
	cual=p_fila+1
	if cual>rowcount() then 
		//setitem(p_fila,'hijos',0)
		return
	end if
	if getitemnumber(p_fila,'nregistro')<>getitemnumber(cual,'nregistro') then
		//setitem(p_fila,'hijos',0)
		return
	end if
	for j=1 to getitemnumber(p_fila,'hijos')
		cual=find('padre='+string(getitemnumber(p_fila,'item'))+' and nregistro='+string(getitemnumber(p_fila,'nregistro')),cual,rowcount())
		if cual=0 then 
			//setitem(p_fila,'hijos',0)
			cual++
			continue
		end if
		event rec_mostrar(cual,p_inicial,p_mostrar)
		setitem(cual,'visible',p_mostrar)
		setdetailheight(cual,cual,76 *p_mostrar)
		cual ++
	next
end if
end event

event type long inserta(long p_pos, string p_label, integer p_nivel, long p_padre, long p_hijos, string p_tipo_campo, long p_contador, string p_clug, long p_nreg, long p_item, string p_tipo_memo, long p_orden, datetime p_fecha, string p_cprof, string p_cesp);long donde
donde=insertrow(p_pos)
setitem(donde,'contador',p_contador)
setitem(donde,'clugar',p_clug)
setitem(donde,'nregistro',p_nreg)
setitem(donde,'item',p_item)
setitem(donde,'tipo_campo',p_tipo_campo)
setitem(donde,'label',p_label)
setitem(donde,'nivel',p_nivel)
setitem(donde,'padre',p_padre)
setitem(donde,'hijos',p_hijos)
setitem(donde,'tipo_memo',p_tipo_memo)
setitem(donde,'orden',p_orden)
setitem(donde,'fecha',p_fecha)
setitem(donde,'codprof',p_cprof)
setitem(donde,'cesp',p_cesp)
return donde

end event

event type long rec_crea_hijos(long p_padre, long p_nivel, long p_fila);long nreg,j,sumar,inserto=0,ll_hijos,ll_donde
string temp
nreg=getitemnumber(p_fila,'nregistro')

ids_hijos_histo.setfilter("nregistro="+string(nreg)+" and padre="+string(p_padre))
ids_hijos_histo.filter()
ids_hijos_histo.sort()

sumar=p_fila+1
if ids_hijos_histo.rowcount()>0 then
	setitem(p_fila,'hijos',ids_hijos_histo.rowcount())
	for j=1 to ids_hijos_histo.rowcount()
		temp=ids_hijos_histo.getitemstring(j,'descampo')
		inserto++
		ll_donde=event inserta(sumar,temp,p_nivel,getitemnumber(p_fila,'item'),ids_hijos_histo.getitemnumber(j,'hijos'),ids_hijos_histo.getitemstring(j,'tipo'),i_contador,i_clug,nreg,ids_hijos_histo.getitemnumber(j,'item'),ids_hijos_histo.getitemstring(j,'tipo_memo'),ids_hijos_histo.getitemnumber(j,'orden'),getitemdatetime(p_fila,'fecha'),getitemstring(p_fila,'codprof'),getitemstring(p_fila,'cesp'))
		
		ll_hijos=event rec_crea_hijos(getitemnumber(sumar,'item'),p_nivel+1,sumar)
		
		if ll_hijos=0 then
			setitem(ll_donde,'hijos',0)
			setitem(ll_donde,'visible',0)
		end if
		
		ids_hijos_histo.setfilter("nregistro="+string(nreg)+" and padre="+string(p_padre))
		ids_hijos_histo.filter()
		ids_hijos_histo.sort()
		
		sumar += ll_hijos+1
		inserto += ll_hijos
	next
end if
return inserto
end event

event keypres;if getrow()<1 then return
if key=keyenter! then return 1
if key=keyadd! then
	if getitemstring(getrow(),'estado')='0' then event doubleclicked(10,10,getrow(),object.label)
end if
if key=keysubtract! then
	if getitemstring(getrow(),'estado')='1' then event doubleclicked(10,10,getrow(),object.label)
end if
if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event rec_selecc(long p_fila, long p_inicial, integer p_selec);long j,cual
if getitemnumber(p_fila,'hijos')>0 then
	cual=p_fila+1
	if cual>rowcount() then 
		setitem(p_fila,'hijos',0)
		return
	end if
	if getitemnumber(p_fila,'nregistro')<>getitemnumber(cual,'nregistro') then
		setitem(p_fila,'hijos',0)
		return
	end if
	for j=1 to getitemnumber(p_fila,'hijos')
		cual=find('padre='+string(getitemnumber(p_fila,'item')),cual,rowcount())
		if cual=0 then 
			setitem(p_fila,'hijos',0)
			continue
		end if
		event rec_selecc(cual,p_inicial,p_selec)
		setitem(cual,'impri',p_selec)
		cual ++
	next
else
	setitem(p_fila,'impri',p_selec)
end if
end event

event p_itemchanged(long p_row, string p_colu, any p_dato);setitem(p_row,p_colu,p_dato)
end event

event rec_revisa_padre(long p_fila);long j,padre,cual,hijo,cuantos2=0,cuantos0=0,cuantos1=0
padre=find('item='+string(getitemnumber(p_fila,'padre'))+ ' and nregistro='+string(getitemnumber(p_fila,'nregistro')) ,1,rowcount())
if padre=0 then return
cual=padre +1
for j=1 to getitemnumber(padre,'hijos')
	hijo=find('padre='+string(getitemnumber(padre,'item'))+ ' and nregistro='+string(getitemnumber(padre,'nregistro')),cual,rowcount())
	if hijo=0 then continue
	if getitemnumber(hijo,'impri')=0 then 
		cuantos0 ++
	elseif getitemnumber(hijo,'impri')=2 then 
		cuantos2 ++
	else
		cuantos1 ++
	end if
	cual++
next
if cuantos1=getitemnumber(padre,'hijos') then
	setitem(padre,'impri',1)
elseif cuantos0=getitemnumber(padre,'hijos') then
	setitem(padre,'impri',0)
else
	setitem(padre,'impri',2)
end if
if getitemnumber(p_fila,'padre')=0 and getitemnumber(p_fila,'item')=0 then 
	return
else
	event rec_revisa_padre(padre)
end if

end event

event modifica();st_xa_cambiar st
st.tingre = getitemstring(Getrow(),'codtingre')
if isnull(st.tingre) then return
st.contador = i_contador
st.clug = i_clug
st.tipo = i_tipo
st.ing_sal = i_ing_sal
st.cesp = i_cespe
st.cemp = i_cemp
st.ccont = i_ccont
st.cprof = i_cprof
st.nreg = getitemnumber(Getrow(),'nregistro')
st.plant = getitemstring(Getrow(),'codplantilla')
st.dw_hist = dw_histo
st.dw_deta = dw_deta
openwithparm(w_modifica,st)

end event

event constructor;settransobject(sqlca)
end event

event clicked;if dwo.type='datawindow' then return
if dwo.name='mas' then
	long donde
	donde=getrow()
	if getitemnumber(row,'hijos')=0 then return
	setredraw(false)
	if getitemnumber(row,'est_revisa')=0 then event crea_hijos(row)
	if getitemstring(row,'estado')='1' then
		setitem(row,'estado','0')
		event rec_mostrar(row,row,0)
	else
		setitem(row,'estado','1')
		event rec_mostrar(row,row,1)
	end if 
	setredraw(true)
	return
end if
if row>0 then
	if row<>getrow() then scrolltorow(row)
end if
end event

event doubleclicked;if row<1 then return
if dwo.type='datawindow' then return
setredraw(false)
if getitemnumber(row,'est_revisa')=0 then event crea_hijos(row)
if getitemnumber(row,'hijos')=0 then 
	setredraw(true)
	return
end if
if getitemstring(row,'estado')='1' then
	event rec_mostrar(row,row,0)
	setitem(row,'estado','0')
else
	event rec_mostrar(row,row,1)
	setitem(row,'estado','1')
end if
setredraw(true)
end event

event rowfocuschanged;if currentrow<1 or rowcount()=0 then return
if isnull(getitemnumber(1,'contador')) then return

if getitemstring(currentrow,'tipo_campo')='M' then 
	blob lbl_dato
	long nreg,item
	nreg=getitemnumber(currentrow,'nregistro')
	item=getitemnumber(currentrow,'item')
	sqlca.autocommit=true
	selectblob long_texto into :lbl_dato from hclin_reg_valor where contador=:i_contador and clugar=:i_clug and nregistro=:nreg and item=:item;
	sqlca.autocommit=false
	f_pega_a_mle(mle_1,string(lbl_dato),3)
	mle_1.visible=true
	dw_deta.visible=false
	if getitemstring(currentrow,'tipo_memo')='R' then //resultados
		sqlca.autocommit=true
		dw_res_old.retrieve(getitemnumber(currentrow,'contador'),getitemstring(currentrow,'clugar'),getitemnumber(currentrow,'nregistro'),getitemnumber(currentrow,'item'))
		if dw_res_old.rowcount()>0 then
			dw_img_old.retrieve(dw_res_old.getitemstring(dw_res_old.getrow(),'coddoc'),dw_res_old.getitemstring(dw_res_old.getrow(),'clugar'),dw_res_old.getitemnumber(dw_res_old.getrow(),'nrepor'),dw_res_old.getitemnumber(dw_res_old.getrow(),'item'))
		end if
		sqlca.autocommit=false
		t_result_old.visible=true
		t_procs_old.visible=false
		t_result_old.triggerevent (selectionchanged!)
	elseif getitemstring(currentrow,'tipo_memo')='P' then //procedimientos
		dw_serv_old.retrieve(getitemnumber(currentrow,'contador'),getitemstring(currentrow,'clugar'),getitemnumber(currentrow,'nregistro'),getitemnumber(currentrow,'item'))
		t_result_old.visible=false
		t_procs_old.visible=true
		t_procs_old.triggerevent (selectionchanged!)
	else
		t_result_old.visible=false
	end if
else
	t_result_old.visible=false
	mle_1.visible=false
	dw_deta.visible=true
	long j
	j=dw_deta.setfilter('nregistro='+string(getitemnumber(currentrow,'nregistro'))+' and padre='+string(getitemnumber(currentrow,'item'))+' and tipo<>"E" and tipo<>"M" and mostrar="1"')
	dw_deta.filter()
end if


end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event buttonclicked;long j,sel=1
if dwo.text='S' then
	dwo.text='D'
else
	dwo.text='S'
	sel=0
end if
setredraw(false)
for j=1 to rowcount()
	if getitemnumber(j,'nivel')=0 then
		if getitemnumber(j,'est_revisa')=0 then 
			event crea_hijos(j)
			event rec_mostrar(j,j,0)
		end if
	end if
	setitem(j,'impri',sel)
next
setredraw(true)
end event

event itemchanged;if data='2' then
	data='0'
	if getitemnumber(row,'impri')=0 then data='1'
	post event p_itemchanged(row,'impri',long(data))
end if
if getitemnumber(row,'nivel')=0 then
	if getitemnumber(row,'est_revisa')=0 then 
		setredraw(false)
		event crea_hijos(row)
		event rec_mostrar(row,row,0)
		setredraw(true)
	end if
end if
event rec_selecc(row,row,long(data))
post event rec_revisa_padre(row)
end event

event rbuttondown;if row < 1 then return
string edita
select edita into :edita from profe
where codprof=:i_cprof;
if edita = '1' then
	m_modif_hc m_mod
	window vent
	vent = f_vent_padre(this)
	m_mod = Create m_modif_hc
	m_mod.PopMenu(vent.PointerX(),vent.PointerY())
	if message.StringParm ='mod' then
		Event modifica()
	end if
end if

end event

type em_1 from editmask within uo_hclin
event p_itemchanged ( )
integer x = 23
integer y = 904
integer width = 507
integer height = 64
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
boolean border = false
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm"
boolean autoskip = true
boolean spin = true
end type

event p_itemchanged();text=string(dw_histo.getitemdatetime(1,'fecha'),'dd/mm/yyyy hh:mm')
end event

event modified;if dw_histo.rowcount()>0 then
	if dw_histo.getitemdatetime(1,'fecha')>datetime(text) then
		messagebox('Atención','Esta fecha es menor a la del ultimo registro guardado. Por defecto se colocará la fecha de ese registro')
		post event p_itemchanged()
	end if
end if
end event

event constructor;if i_displayonly = TRUE then Visible = FALSE
text=string(datetime(today(),now()),'dd/mm/yyyy hh:mm')
end event

type st_muestra from singlelineedit within uo_hclin
boolean visible = false
integer x = 2011
integer y = 924
integer width = 2002
integer height = 56
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_serv_old from datawindow within uo_hclin
boolean visible = false
integer x = 5381
integer width = 293
integer height = 68
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rips_hc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type uo_1 from uo_barra_hc within uo_hclin
event keypres pbm_keydown
integer x = 1545
integer y = 768
integer width = 4402
integer height = 172
integer taborder = 30
end type

event keypres;if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

on uo_1.destroy
call uo_barra_hc::destroy
end on

event constructor;call super::constructor;if i_displayonly = TRUE then Visible = FALSE

end event

event navegar;call super::navegar;parent.navegar(key)
end event

type dw_captur_histo from datawindow within uo_hclin
event clean_fields ( )
boolean visible = false
integer x = 5134
integer y = 2208
integer width = 581
integer height = 52
integer taborder = 70
string title = "none"
string dataobject = "dw_captur_histo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clean_fields;setfilter('')
filter()
long j,ll_null
datetime ldt_null
string ls_null

setnull(ldt_null)
setnull(ls_null)
setnull(ll_null)

for j=1 to rowcount()
	setitem(j,'numero',ll_null)
	setitem(j,'fecha_cap',ll_null)
	setitem(j,'texto',ls_null)
	setitem(j,'sino',ls_null)
next

resetupdate()
end event

event constructor;settransobject(sqlca)
end event

type st_1 from statictext within uo_hclin
integer width = 521
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros anteriores"
boolean focusrectangle = false
end type

type dw_ls from datawindow within uo_hclin
boolean visible = false
integer x = 5733
integer width = 219
integer height = 52
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_plan_lista"
boolean resizable = true
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

type pb_pvisible from picturebutton within uo_hclin
boolean visible = false
integer x = 4087
integer y = 900
integer width = 759
integer height = 92
integer taborder = 20
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "resultados.gif"
end type

type dw_meds_new from datawindow within uo_hclin
boolean visible = false
integer x = 1573
integer y = 1032
integer width = 4201
integer height = 1052
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_rips_os"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_res_old from datawindow within uo_hclin
event keypres pbm_dwnkey
boolean visible = false
integer x = 2098
integer y = 92
integer width = 3849
integer height = 600
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_xa_resul_hc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypres;if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event constructor;settransobject(sqlca)
end event

event buttonclicked;if not isvalid(w_deta_kit) then
	open(w_val_norm)
	w_val_norm.dw_1.retrieve(getitemstring(getrow(),'codproced'),getitemnumber(getrow(),'consecampo'))
	w_val_norm.setfocus()
end if
end event

event clicked;if row>0 and row<>getrow() then setrow(row)
end event

type pb_1 from picturebutton within uo_hclin
integer x = 462
integer width = 91
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "filtrar.gif"
alignment htextalign = left!
string powertiptext = "Filtrar"
end type

event clicked;long j
dw_histo.setredraw(false)
for j=1 to dw_histo.rowcount()
	if dw_histo.getitemnumber(j,'nivel')=0 then
		if dw_histo.getitemnumber(j,'est_revisa')=0 then 
			dw_histo.event crea_hijos(j)
			dw_histo.event rec_mostrar(j,j,0)
		end if
	end if
next
dw_histo.setredraw(true)
st_filtros_hc st
st.dw_histo=dw_histo
st.dw_vals=dw_deta
openwithparm(w_filtros_hc,st)
end event

type dw_img_old from datawindow within uo_hclin
boolean visible = false
integer x = 2098
integer y = 92
integer width = 3849
integer height = 600
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_resultados_imagen"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_procs_new from datawindow within uo_hclin
boolean visible = false
integer x = 1568
integer y = 1032
integer width = 4402
integer height = 1052
integer taborder = 50
string title = "none"
string dataobject = "dw_rips_hc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;choose case getcolumnname()
	case 'codrip_prin','codrip_rel1','codrip_rel2','codrip_comp'
		string este,pedazo
		st_return_diags st

		pedazo=right(getcolumnname(),4)
		if trim(gettext())<>'' then
			st=f_check_diag(trim(gettext()),w_principal.dw_1.getitemstring(1,'sexo'),w_principal.dw_1.getitemnumber(1,'dias'),este,'0',this.getitemstring(row,'rips'))
			if st.descrip_diag='' then
				settext(getitemstring(getrow(),getcolumnname()))
				return 1
			end if
			setitem(getrow(),'desdiag_'+pedazo,st.descrip_diag)
			setitem(getrow(),'diag'+pedazo,este)
			st_muestra.text=st.descrip_diag
		else
			string nulo
			setnull(nulo)
			setitem(getrow(),'desdiag_'+pedazo,nulo)
			setitem(getrow(),'diag'+pedazo,nulo)
			st_muestra.text=''
		end if
end choose
accepttext()
end event

event itemfocuschanged;if row<1 or rowcount()<1 then return
choose case dwo.name
	case 'codrip_prin'
		st_muestra.text=getitemstring(getrow(),'desdiag_prin')
	case 'codrip_rel1'
		st_muestra.text=getitemstring(getrow(),'desdiag_rel1')
	case 'codrip_rel2'
		st_muestra.text=getitemstring(getrow(),'desdiag_rel2')
	case 'codrip_comp'
		st_muestra.text=getitemstring(getrow(),'desdiag_comp')
end choose
end event

event doubleclicked;string colu,pedazo
colu=dwo.name
pedazo=right(colu,4)
choose case colu
	case 'codrip_prin','codrip_rel1','codrip_rel2','codrip_comp'
		if getcolumnname()<>dwo.name then return
		st_edadsexo st_es
		st_es.edad=w_principal.dw_1.getitemnumber(1,'dias')
		st_es.sexo=w_principal.dw_1.getitemstring(1,'sexo')
		st_es.antece='0'
		st_es.proced='0'
		openwithparm(w_busca_diag,st_es)
		st_diag st_diag
		st_diag=message.powerobjectparm
		if not isvalid(st_diag) then return
		setitem(1,'diag'+pedazo,st_diag.codgeral)
		setitem(1,'codrip_'+pedazo,st_diag.codrip)
		setitem(1,'desdiag_'+pedazo,st_diag.descripcion)
		st_muestra.text=st_diag.descripcion
end choose
accepttext()
end event

event rowfocuschanged;if getrow()<1 then return
choose case getcolumnname()
	case 'codrip_prin'
		st_muestra.text=getitemstring(getrow(),'desdiag_prin')
	case 'codrip_rel1'
		st_muestra.text=getitemstring(getrow(),'desdiag_rel1')
	case 'codrip_rel2'
		st_muestra.text=getitemstring(getrow(),'desdiag_rel2')
	case 'codrip_comp'
		st_muestra.text=getitemstring(getrow(),'desdiag_comp')
end choose
end event

type t_procs from tab within uo_hclin
boolean visible = false
integer x = 4864
integer y = 892
integer width = 8498
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tp1 tp1
tp2 tp2
end type

on t_procs.create
this.tp1=create tp1
this.tp2=create tp2
this.Control[]={this.tp1,&
this.tp2}
end on

on t_procs.destroy
destroy(this.tp1)
destroy(this.tp2)
end on

event selectionchanged;if selectedtab=2 then
	dw_procs_new.visible=true
	mle_2.visible=false
	uo_1.pb_del_proc.enabled=true
	uo_1.pb_procs.enabled=true
	uo_1.pb_lleva.enabled=false
	st_muestra.visible=true
else
	dw_procs_new.visible=false
	mle_2.visible=true
	uo_1.pb_del_proc.enabled=false
	uo_1.pb_procs.enabled=false
	uo_1.pb_lleva.enabled=true
	st_muestra.visible=false
end if
BringToTop = TRUE
end event

type tp1 from userobject within t_procs
integer x = 18
integer y = 112
integer width = 8462
integer height = -36
long backcolor = 67108864
string text = "Respuesta"
long tabtextcolor = 33554432
string picturename = "notas_adm.ico"
long picturemaskcolor = 536870912
string powertiptext = "Observaciones a registrar"
end type

type tp2 from userobject within t_procs
integer x = 18
integer y = 112
integer width = 8462
integer height = -36
long backcolor = 67108864
string text = "Detalle de Rips"
long tabtextcolor = 33554432
string picturename = "nocita.gif"
long picturemaskcolor = 536870912
string powertiptext = "Procedimientos a ser Registrados"
end type

type t_result_old from tab within uo_hclin
event create ( )
event destroy ( )
boolean visible = false
integer x = 2935
integer width = 1001
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tp7 tp7
tp8 tp8
tp9 tp9
end type

on t_result_old.create
this.tp7=create tp7
this.tp8=create tp8
this.tp9=create tp9
this.Control[]={this.tp7,&
this.tp8,&
this.tp9}
end on

on t_result_old.destroy
destroy(this.tp7)
destroy(this.tp8)
destroy(this.tp9)
end on

event selectionchanged;choose case selectedtab
	case 1 
		dw_res_old.visible=false
		mle_1.visible=true
		dw_img_old.visible=false
	case 2 
		dw_res_old.visible=true
		mle_1.visible=false
		dw_img_old.visible=false
	case 3 
		dw_res_old.visible=false
		mle_1.visible=false
		dw_img_old.visible=true
		//retieve hacer
	//	t_result_old.tp9.event mostar_fotos()
end choose

end event

type tp7 from userobject within t_result_old
integer x = 18
integer y = 112
integer width = 965
integer height = -36
long backcolor = 67108864
string text = "Interpr"
long tabtextcolor = 33554432
string picturename = "editar.ico"
long picturemaskcolor = 536870912
string powertiptext = "Observaciones a registrar"
end type

type tp8 from userobject within t_result_old
integer x = 18
integer y = 112
integer width = 965
integer height = -36
long backcolor = 67108864
string text = "Resul."
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Resultados a ser Registrados"
end type

type tp9 from userobject within t_result_old
integer x = 18
integer y = 112
integer width = 965
integer height = -36
long backcolor = 67108864
string text = "Imag."
long tabtextcolor = 33554432
string picturename = "rx.ico"
long picturemaskcolor = 536870912
end type

type t_procs_old from tab within uo_hclin
event create ( )
event destroy ( )
boolean visible = false
integer x = 4859
integer width = 850
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tp5 tp5
tp6 tp6
end type

on t_procs_old.create
this.tp5=create tp5
this.tp6=create tp6
this.Control[]={this.tp5,&
this.tp6}
end on

on t_procs_old.destroy
destroy(this.tp5)
destroy(this.tp6)
end on

event selectionchanged;if selectedtab=2 then
	dw_serv_old.visible=true
	mle_1.visible=false
else
	mle_1.visible=true
	dw_serv_old.visible=false
end if
end event

type tp5 from userobject within t_procs_old
integer x = 18
integer y = 112
integer width = 814
integer height = -36
long backcolor = 67108864
string text = "Respuesta"
long tabtextcolor = 33554432
string picturename = "notas_adm.ico"
long picturemaskcolor = 536870912
string powertiptext = "Observaciones a registrar"
end type

type tp6 from userobject within t_procs_old
integer x = 18
integer y = 112
integer width = 814
integer height = -36
long backcolor = 67108864
string text = "Detalle Rips"
long tabtextcolor = 33554432
string picturename = "nocita.gif"
long picturemaskcolor = 536870912
string powertiptext = "Procedimientos a ser Registrados"
end type

type t_result from tab within uo_hclin
boolean visible = false
integer x = 2839
integer y = 900
integer width = 887
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tp3 tp3
tp4 tp4
t_imagen t_imagen
end type

event selectionchanged;choose case selectedtab
	case 1 
		dw_res_new.visible=false
		dw_img_new.visible=false
		mle_2.visible=true
		uo_1.pb_result.visible=false
	case 2  
		dw_res_new.visible=true
		dw_img_new.visible=false
		mle_2.visible=false
		uo_1.pb_result.visible=true
	case 3 
		///aqui pilas ajuste
		dw_res_new.visible=false
		dw_img_new.visible=true
		uo_1.pb_result.visible=false			
		if i_cambia=true  then
			//t_result.t_imagen.event mostar_fotos()
		end if
end choose
BringToTop = TRUE

end event

on t_result.create
this.tp3=create tp3
this.tp4=create tp4
this.t_imagen=create t_imagen
this.Control[]={this.tp3,&
this.tp4,&
this.t_imagen}
end on

on t_result.destroy
destroy(this.tp3)
destroy(this.tp4)
destroy(this.t_imagen)
end on

type tp3 from userobject within t_result
integer x = 18
integer y = 112
integer width = 850
integer height = -36
long backcolor = 67108864
string text = "Interpr"
long tabtextcolor = 33554432
string picturename = "editar.ico"
long picturemaskcolor = 536870912
string powertiptext = "Observaciones a registrar"
end type

type tp4 from userobject within t_result
integer x = 18
integer y = 112
integer width = 850
integer height = -36
long backcolor = 67108864
string text = "Resul."
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Mostrar los resultados a guardar"
end type

type t_imagen from userobject within t_result
integer x = 18
integer y = 112
integer width = 850
integer height = -36
long backcolor = 67108864
string text = "Imag."
long tabtextcolor = 33554432
string picturename = "rx.ico"
long picturemaskcolor = 536870912
end type

type dw_new from datawindow within uo_hclin
event type long inserta ( long p_pos,  string p_label,  integer p_nivel,  long p_padre,  long p_hijos,  string p_tipo_campo,  long p_contador,  string p_clug,  long p_nreg,  long p_item,  string p_tipomemo,  long p_orden,  string p_oblig,  integer p_captura,  string p_ant,  string p_cod_ant,  string p_alergia )
event rec_mostrar ( long p_fila,  long p_inicial,  integer p_visible )
event keypres pbm_dwnkey
integer y = 980
integer width = 1499
integer height = 1200
integer taborder = 30
string dataobject = "dw_hclin_arma_arbol"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type long inserta(long p_pos, string p_label, integer p_nivel, long p_padre, long p_hijos, string p_tipo_campo, long p_contador, string p_clug, long p_nreg, long p_item, string p_tipomemo, long p_orden, string p_oblig, integer p_captura, string p_ant, string p_cod_ant, string p_alergia);long donde
donde=insertrow(p_pos )
setitem(donde,'codplantilla',is_cplant)
setitem(donde,'numcampo',p_item)
setitem(donde,'tipo',p_tipo_campo)
setitem(donde,'label',p_label)
setitem(donde,'nivel',p_nivel)
setitem(donde,'padre',p_padre)
setitem(donde,'hijos',p_hijos)
setitem(donde,'tipo_memo',p_tipomemo)
setitem(donde,'orden',p_orden)
setitem(donde,'obligatorio',p_oblig)
setitem(donde,'captura',p_captura)
setitem(donde,'ant',p_ant)
setitem(donde,'cod_ant',p_cod_ant)
setitem(donde,'alergia',p_alergia)
return donde

end event

event rec_mostrar(long p_fila, long p_inicial, integer p_visible);long j,cual,p_mostrar
string ant
p_mostrar=p_visible
if p_fila<>p_inicial then
	p_mostrar=0
	if p_visible=1 and getitemstring(p_fila,'estado')='1' then p_mostrar=1
end if
if getitemnumber(p_fila,'hijos')>0 then
	cual=p_fila+1
	for j=1 to getitemnumber(p_fila,'hijos')
		cual=find('padre='+string(getitemnumber(p_fila,'numcampo')),cual,rowcount())
		if cual=0 then 
			setitem(p_fila,'hijos',0)
			continue
		end if
		event rec_mostrar(cual,p_inicial,p_mostrar)
		setitem(cual,'visible',p_mostrar)
		setdetailheight(cual,cual,76 *p_mostrar)
		cual ++
	next
end if

end event

event keypres;if getrow()<1 then return
if key=keyenter! then return 1
if key=keyadd! then
	if getitemstring(getrow(),'estado')='0' then event doubleclicked(10,10,getrow(),object.label)
end if
if key=keysubtract! then
	if getitemstring(getrow(),'estado')='1' then event doubleclicked(10,10,getrow(),object.label)
end if
if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event constructor;settransobject(sqlca)
if i_displayonly = TRUE then Visible = FALSE

end event

event retrieveend;long j,ll_hijos,ll_padre

for j=1 to dw_campo.rowcount()
	if dw_campo.getitemnumber(j,'padre')=0 or (dw_campo.getitemstring(j,'tipo')<>'E' and dw_campo.getitemstring(j,'tipo')<>'M') then continue
	ll_padre=find('numcampo='+string(dw_campo.getitemnumber(j,'padre')),1,rowcount())
	setitem(ll_padre,'hijos',getitemnumber(ll_padre,'hijos')+1)
	event inserta(ll_padre+1 , dw_campo.getitemstring(j,'descampo') , getitemnumber(ll_padre,'nivel')+1 ,  dw_campo.getitemnumber(j,'padre') , 0 ,dw_campo.getitemstring(j,'tipo'),i_contador,i_clug,0,dw_campo.getitemnumber(j,'numcampo'),&
	dw_campo.getitemstring(j,'tipo_memo'),dw_campo.getitemnumber(j,'orden'),dw_campo.getitemstring(j,'obligatorio'),0 ,dw_campo.getitemstring(j,'ant'),dw_campo.getitemstring(j,'cod_ant'),dw_campo.getitemstring(j,'alergia')) 
		
next

//aquí lo deja tal como el campo orden está creado
sort()

end event

event clicked;if dwo.type='datawindow' then return
if dwo.name='mas' then
	long donde
	donde=getrow()
	if getitemnumber(row,'hijos')=0 then return
	setredraw(false)
	if getitemstring(row,'estado')='1' then
		setitem(row,'estado','0')
		event rec_mostrar(row,row,0)
	else
		setitem(row,'estado','1')
		event rec_mostrar(row,row,1)
	end if 
	setredraw(true)
	return
end if
if row>0 then
	if row<>getrow() then scrolltorow(row)
end if

end event

event doubleclicked;if row<1 then return
if dwo.type='datawindow' then return
setredraw(false)
if getitemnumber(row,'hijos')=0 then 
	setredraw(true)
	return
end if
if getitemstring(row,'estado')='1' then
	event rec_mostrar(row,row,0)
	setitem(row,'estado','0')
else
	event rec_mostrar(row,row,1)
	setitem(row,'estado','1')
end if
setredraw(true)
end event

event rowfocuschanged;if getrow()<1 then return
dw_new_det.accepttext()
if getitemstring(getrow(),'tipo')='M'  then
	mle_2.visible=true
	dw_new_det.visible=false
	long cual
	cual=dw_campo.find('numcampo='+string(getitemnumber(getrow(),'numcampo')),1,dw_campo.rowcount())
	if cual=0 then
		messagebox('Atención','No se puede encontrar el campo en el cual está la información de esta fila')
		return
	end if
	if dw_campo.getitemstring(cual,'importante')='1' then
		cbx_3.checked=true
	else
		cbx_3.checked=false
	end if
	boolean temp
	temp=i_cambia
	f_pega_a_mle(mle_2,dw_campo.getitemstring(cual,'texto'),3)
	uo_1.retrieve(getitemnumber(getrow(),'numcampo'),getitemstring(getrow(),'tipo_memo'),getitemstring(getrow(),'ant'),getitemstring(getrow(),'cod_ant'),getitemstring(getrow(),'alergia'),i_cpo)
	i_cambia=temp
	if getitemstring(getrow(),'tipo_memo')='C' or  getitemstring(getrow(),'tipo_memo')='D' then
		st_muestra.visible=true
	else
		st_muestra.visible=false
	end if
	if ls_antece_si='1' then
		if getitemstring(getrow(),'ant')='1' then
			mle_2.displayonly=true
		else
			 if getitemstring(getrow(),'tipo_memo')='D' then		
				mle_2.displayonly=true
			else
				mle_2.displayonly=false
			end if
		end if
	end if
	
	if getitemstring(getrow(),'tipo_memo')='R' then //resultados
		dw_res_new.setfilter('item_hc='+string(getitemnumber(getrow(),'numcampo')))
		dw_res_new.filter()
		t_result.visible=true
		t_procs.visible=false
		t_result.triggerevent (selectionchanged!)
	elseif getitemstring(getrow(),'tipo_memo')='P' then //procedimientos
		dw_procs_new.setfilter('item_hc='+string(getitemnumber(getrow(),'numcampo')))
		dw_procs_new.filter()
		t_result.visible=false
		t_procs.visible=true
		t_procs.triggerevent(selectionchanged!)
	else
		t_procs.visible=false
		t_result.visible=false
		dw_res_new.visible=false
	end if
else
	t_result.visible=false
	t_procs.visible=false
	uo_1.retrieve(0,'','','','',i_cpo)
	mle_2.visible=false
	dw_new_det.setfilter('padre='+string(getitemnumber(getrow(),'numcampo')))
	dw_new_det.setredraw(false)
	dw_new_det.filter()
	dw_new_det.sort()
	dw_new_det.groupcalc()
	dw_new_det.triggerevent (itemfocuschanged!)
	dw_new_det.sort()
	dw_new_det.groupcalc()
	dw_new_det.setredraw(true)
	dw_new_det.visible=true
	dw_res_new.visible=false
	st_muestra.visible=false
end if
end event

event rowfocuschanging;if currentrow<1 or rowcount()=0 then return
if getitemstring(currentrow,'tipo')='M' then
	long cual
	if ls_antece_si='1' then
		if getitemstring(currentrow,'ant')='1' then
			mle_2.displayonly=true
		else
			if getitemstring(currentrow,'tipo_memo')='D' then		
				mle_2.displayonly=true
			else
				mle_2.displayonly=false
			end if
		end if
	end if
	cual=dw_campo.find('numcampo='+string(getitemnumber(currentrow,'numcampo')),1,dw_campo.rowcount())
	dw_campo.setitem(cual,'texto',mle_2.text)
	if dw_campo.getitemnumber(cual,'falta')=0 then
		dw_new.setitem(currentrow,'captura',1)
	else
		dw_new.setitem(currentrow,'captura',0)
	end if
	
end if
end event

type dw_1 from datawindow within uo_hclin
event keypress pbm_dwnkey
boolean visible = false
integer x = 5
integer y = 984
integer width = 4800
integer height = 1200
integer taborder = 50
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypress;string ls_columnname
ls_columnname =this.getcolumnname() 
if left(ls_columnname,5)='memo_' then
	if g_ctrlv<>'1' then 
		If keyflags = 2 or keydown(KeyControl!) then
			if key=keyv! then return 1	
			IF keydown(KeyAlt!) THEN 
				if key=keyv! then return 1
			end if
		else
			IF keyflags = 1 THEN
				if key=keyinsert! then return 1
			end if
		end if
	end if
end if
end event

event buttonclicked;if dw_res_new.RowCount() = 0 then 
	MessageBox('Atención','No tiene resultados relacionados')
	Return 0
end if
opensheetwithparm(w_res_selec,dw_res_new,w_principal,0,original!)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())

end event

event itemchanged;i_cambia = TRUE

end event

event itemfocuschanged;long fila
string ayuda
st_muestra.text = ''
fila = dw_campo.Find("numcampo="+Describe(string(dwo.name)+".Tag"),1,dw_campo.RowCount())
if fila = 0 then Return -1
ayuda = dw_campo.getItemString(fila,'ayuda')
if not isNull(ayuda) and trim(ayuda) <> '' then
	st_muestra.text = ayuda
end if
if dw_campo.getItemString(fila,'tipo') = 'M' then
	uo_1.retrieve(dw_campo.getItemNumber(fila,'numcampo'), dw_campo.GetItemString(fila,'tipo_memo'), dw_campo.GetItemString(fila,'ant'), dw_campo.GetItemString(fila,'cod_ant'), dw_campo.GetItemString(fila,'alergia'),i_cpo)
end if

end event

event losefocus;if AcceptText() = -1 then Return -1

end event

type dw_deta from datawindow within uo_hclin
event rec_revisa_padre ( long padre )
event keypres pbm_dwnkey
integer x = 2098
integer y = 88
integer width = 3849
integer height = 600
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_hclin_valores"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rec_revisa_padre(long padre);if padre=0 then return
if find('item='+string(padre),1,rowcount())=0 then
	long donde,donde2
	donde=dw_new.find('numcampo='+string(padre),1,dw_new.rowcount())
	donde2=insertrow(getrow())
	setitem(donde2,'item',dw_new.getitemnumber(donde,'numcampo'))
	setitem(donde2,'padre',dw_new.getitemnumber(donde,'padre'))
	setitem(donde2,'orden',dw_new.getitemnumber(donde,'orden'))
	setitem(donde2,'descampo',dw_new.getitemstring(donde,'label'))
	setitem(donde2,'tipo',dw_new.getitemstring(donde,'tipo'))
	event rec_revisa_padre(dw_new.getitemnumber(donde,'padre'))
end if
end event

event keypres;if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event buttonclicked;if dwo.name='b_gra' then
	st_xa_graficas l_st
	if isnull(getitemnumber(row ,'numero')) then 
		MessageBox("Atención", "No hay campo en la casilla de captura para evaluar")
		return
	end if
	l_st.codplantilla=this.getitemstring(row,'codplantilla')
	l_st.numcampo=this.getitemnumber(row,'item')
	l_st.edad=w_principal.dw_1.getitemnumber(1,'dias')
	l_st.sexo=w_principal.dw_1.getitemstring(1,'sexo')
	l_st.origen=2
	l_st.dw_captura=dw_deta
	l_st.fecha=this.getitemdatetime(row,'freg')
	openwithparm(w_grafica_hc,l_st)
end if
end event

type dw_plants from datawindow within uo_hclin
event pinta ( )
event keypres pbm_dwnkey
integer y = 764
integer width = 1321
integer height = 124
integer taborder = 20
string dataobject = "dw_combo_plants"
boolean border = false
boolean livescroll = true
end type

event pinta();accepttext()
if is_cplant=getitemstring(1,1) then return
dw_new_det.accepttext()

if i_cambia then
	choose case messagebox('Atención','Realizó cambios en la plantilla de '+i_message+', desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then
				rollback;
			else	
				commit;
			end if
		case 2
			i_cambia=false
		case 3
			setitem(1,1,is_cplant)
			return
	end choose
end if
is_cplant = getitemstring(1,1)

select vista,fecha,corp into :i_modo,:i_fecha,:i_cpo from hclin_plant where codplantilla=:is_cplant;
if isnull(i_cpo) or i_cpo='' then i_cpo='0'

parent.setredraw(false)
setpointer(hourglass!)

i_nv_orden=false
i_pudo_orden=true
dw_new.reset()
dw_res_new.reset()
dw_new_det.reset()

string sintaxis, buffer, err
i_campos = ''
i_columnas = ''
i_textos = ''
consec = 0
PosX = 10
PosY = 10
altura=0
colum = 0
dw_1.Reset()
mle_2.visible=false
dw_campo.Retrieve(is_cplant,sex_busca)
if dw_campo.event revisar()=-1 THEN 

	parent.setredraw(true)
	setpointer(arrow!)
	return
end if
uo_1.inicia(i_contador,i_clug,0,is_cplant,i_ing_sal,i_tipo,i_tingre,st_muestra,mle_2,i_cemp,i_ccont,i_cprof,dw_res_new,dw_new_det,dw_campo,dw_1,i_cespe)
//dw_memos.retrieve(is_cplant,sex_busca)
dw_new_det.setfilter('')
dw_new_det.retrieve(is_cplant,sex_busca)
dw_captur_histo.retrieve(is_cplant,sex_busca)
dw_captur_histo.setfilter("tipo='R' OR tipo='C' ")
dw_captur_histo.filter()

dw_new.retrieve(is_cplant,0,sex_busca)

sintaxis = 'release 22;~r~n' + &
' datawindow(units=0 timer_interval=0 color=67108864 processing=0 HTMLDW=no print.printername="" print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.canusedefaultprinter=yes print.prompt=no print.buttons=no print.preview.buttons=no print.cliptext=no print.overrideprintjob=no print.collate=yes print.preview.outline=yes hidegrayline=no )~r~n' +&
' header(height=0 color="536870912" )~r~n' +&
' summary(height=0 color="536870912" )~r~n' + &
' footer(height=0 color="536870912" )~r~n' +&
' detail(height=1096 color="536870912" ) ~r~n' +&
'table('

sintaxis = sintaxis + i_campos + ') ~r~n'
sintaxis = sintaxis + i_columnas
sintaxis = sintaxis + i_textos
dw_1.Create(sintaxis,err)
if err <> '' then
	messageBox('Error',err)
end if
err = dw_1.Modify('Datawindow.Detail.height="'+string(PosY+altura)+'"')
if err <> '' then
	messageBox('Error',err)
end if
long f
f = dw_1.Insertrow(0)
//cb_modo.visible = true
if i_modo = 'F' then
	cb_modo.picturename = 'arbol.gif'
	dw_new.Visible = FALSE
	st_vert2.Visible = FALSE
	dw_res_new.Visible = FALSE
	dw_new_det.Visible = FALSE
	mle_2.Visible = FALSE
	t_result.Visible = FALSE
	dw_1.Visible = TRUE
else
	cb_modo.picturename = 'Formulario.gif'
	dw_new.Visible = TRUE
	st_vert2.Visible = TRUE
	dw_res_new.Visible = TRUE
	dw_new_det.Visible = TRUE
	mle_2.Visible = TRUE
	t_result.Visible = TRUE
	dw_1.Visible = FALSE
end if
cb_modo.BringtoTop = true
dw_new.Post event rowfocuschanged(dw_new.getrow())

parent.post setredraw(true)
post setpointer(arrow!)

end event

event keypres;if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event constructor;if i_displayonly = TRUE then Visible = FALSE
getchild('codplantilla',idw_plants)
idw_plants.settransobject(sqlca)
insertrow(1)

end event

event itemchanged;event pinta()
if i_fecha='1' then 
	em_1.enabled=true
else 
	em_1.enabled=false 
end  if

end event

type dw_res_new from datawindow within uo_hclin
event keypres pbm_dwnkey
boolean visible = false
integer x = 1573
integer y = 1028
integer width = 4402
integer height = 1152
integer taborder = 40
string title = "none"
string dataobject = "dw_trae_resultados2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypres;if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event constructor;settransobject(sqlca)
modify('esco.visible=0')
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event buttonclicked;if not isvalid(w_deta_kit) then
	if dwo.name='b_1' then
		open(w_val_norm)
		w_val_norm.dw_1.retrieve(getitemstring(row,'codproced'),getitemnumber(row,'consecampo'))
		w_val_norm.setfocus()
	else
		open(w_graf_apoyodx)
		w_graf_apoyodx.dw_1.retrieve(tipdoc,docu,getitemstring(row,'codproced'))
		w_graf_apoyodx.setfocus()
	end if
end if
end event

event clicked;if row>0 and row<>getrow() then setrow(row)
end event

type mle_2 from uo_multilineedit within uo_hclin
boolean visible = false
integer x = 1545
integer y = 984
integer width = 4402
integer height = 1200
integer taborder = 40
boolean bringtotop = true
end type

event modified;i_cambia=true
end event

type mle_3 from multilineedit within uo_hclin
boolean visible = false
integer x = 969
integer y = 2176
integer width = 411
integer height = 324
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type mle_1 from uo_multilineedit within uo_hclin
integer x = 2098
integer y = 88
integer width = 3849
integer height = 628
integer taborder = 50
boolean bringtotop = true
end type

type dw_new_det from datawindow within uo_hclin
event keypres pbm_dwnkey
event clean_fields ( )
integer x = 1554
integer y = 984
integer width = 4402
integer height = 1152
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_captur_histo"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationalways!
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypres;if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event clean_fields();setfilter('')
filter()
long j,ll_null
datetime ldt_null
string ls_null

setnull(ldt_null)
setnull(ls_null)
setnull(ll_null)

for j=1 to rowcount()
	setitem(j,'numero',ll_null)
	setitem(j,'fecha_cap',ll_null)
	setitem(j,'texto',ls_null)
	setitem(j,'tiempo',ll_null)
	setitem(j,'sino',ls_null)
next

resetupdate()
end event

event constructor;settransobject(sqlca)
getchild('texto_l',idw_lista)
idw_lista.settransobject(sqlca)
getchild('numero_l',idw_listan)
idw_listan.settransobject(sqlca)
if i_displayonly = TRUE then Visible = FALSE

end event

event itemfocuschanged;choose case getcolumnName()
	case 'texto_l' 
		idw_lista.retrieve(is_cplant,getitemnumber(getrow(),'numcampo'))
	case 'numero_l' 
		idw_listan.retrieve(is_cplant,getitemnumber(getrow(),'numcampo'))
end choose

end event

event itemchanged;choose case dwo.name
	case 'numero'
		if not isnull(getitemnumber(row,'num_min')) and not isnull(getitemnumber(row,'num_max')) then
			if real(data)<getitemnumber(row,'num_min') or real(data)>getitemnumber(row,'num_max') then
//				 messagebox('Atención','El valor no se encuentra dentro del Rango configurado debe estar entre '+string(getitemnumber(row,'num_min'))+' y  '+string(getitemnumber(row,'num_max')))
				 return 1
			end if
			long fila
			fila= dw_captur_histo.find('numcampo='+string(getitemnumber(getrow(),'numcampo')),1,dw_captur_histo.rowcount())
			dw_captur_histo.setitem(fila,'numero',real(data))
		end if
end choose

choose case getitemstring(row,'tipo')
	case 'S','L','T' ,'Y'
		if (trim(getitemstring(row,'texto'))<>''  or Not IsNull(getitemstring(row,'texto'))) and  getitemstring(row,'obligatorio') ='1'   then 
			dw_new.setitem(dw_new.getrow(),'captura',1) 
		else
			dw_new.setitem(dw_new.getrow(),'captura',0) 
		end if 
		if getitemstring(row,'tipo')='Y' then
			dw_new_det.setitem(row,'nitem',idw_listan.getitemnumber(idw_listan.getrow(),'nitem'))
			dw_new_det.setitem(row,'equiv_202',idw_listan.getitemstring(idw_listan.getrow(),'equiv_202'))
		end if
		
	case 'R','C' 
		if (Not IsNull(getitemnumber(row,'numero'))) and  getitemstring(row,'obligatorio') ='1'   then 
			dw_new.setitem(dw_new.getrow(),'captura',1) 
		else
			dw_new.setitem(dw_new.getrow(),'captura',0) 
		end if 
	case	'F' ,'X','H'
		if not f_valida_fechas_cap(date(data),date(w_principal.dw_1.getitemdatetime(1,'fnacimiento')),getitemstring(row,'futura'),getitemnumber(row,'ndias')) then
			settext('')
			string ls_null
			setnull(ls_null)
			setitem(row,'fecha_cap',ls_null)
			setitem(row,'tiempo',ls_null)			
			return 1
		end if
		
		if (Not IsNull(getitemdatetime(row,'fecha_cap'))) and  getitemstring(row,'obligatorio') ='1'   then 
			dw_new.setitem(dw_new.getrow(),'captura',1) 
		else
			dw_new.setitem(dw_new.getrow(),'captura',0) 
		end if 
end choose
i_cambia=true
end event

event retrieveend;long j,cohortes
int semanas, dias
datetime fechas,fp_part

cohortes=f_valida_usuario_cohorte_materna(tipdoc, docu)
if cohortes>0 then 
	Select fp_eco, sgp_eco, dgp_eco,fp_part into :fechas,:semanas,:dias ,:fp_part
	From pacientes_cohortes 
	Where (((tipodoc)=:tipdoc) AND ((documento)=:docu) AND ((id_cohorte_pac)=:cohortes)  AND ((pacientes_cohortes.fp_eco)<>:fechas));
end if

for j=1 to rowcount
	choose case  getitemstring(j,'tipo')
		case 'F'
			if getitemstring(j,'eco')='1' then
				if date(fechas)<>date('01/01/1900') then 
					setitem(j,"fecha_cap",fechas)
				end if
			else
				if getitemstring(j,'eco')='4' then
					if date(fechas)<>date('01/01/1900') then 
						setitem(j,"fecha_cap",fechas)
					end if
				else
					setitem(j,"fecha_cap",getitemdatetime(j,'moda6'))
				end if
			end if
		case 'T','M'
			setitem(j,"texto",getitemstring(j,'moda1'))			
		case 'N'
			setitem(j,'sino',getitemstring(j,'moda4'))
		case 'R'
			if getitemstring(j,'eco')='2' then
				if not isnull(semanas) then 
					setitem(j,'numero',semanas)
				end if		
			else
				if getitemstring(j,'eco')='3' then
					if not isnull(dias) then  
						setitem(j,'numero',dias)
					end if		
				else
					setitem(j,'numero',getitemnumber(j,'moda2'))
				end if
			end if
		case 'S'
			setitem(j,"texto_s",getitemstring(j,'moda5'))	
		case 'L'
			setitem(j,"texto_l",getitemstring(j,'moda3'))	
	end choose
next
end event

event buttonclicked;accepttext()
string ls_formula,ls_column,ls_result,l_sex,l_pedazo,f_ant1
long j,fin,k,fila,l_numcampo,jp,fp
decimal ld_valor
int fila_ant,li_cipa,li_csis,li_duf,li_frf,li_fru,li_verd
st_xa_graficas l_st

if dwo.name='b_inst' then
	l_st.codplantilla=this.getitemstring(row,'codplantilla')
	l_st.numcampo=this.getitemnumber(row,'numcampo')
	l_st.edad=w_principal.dw_1.getitemnumber(1,'dias')
	l_st.sexo=w_principal.dw_1.getitemstring(1,'sexo')
	l_st.instr=this.getitemstring(row,'cod_inst')
	l_st.origen=row
	l_st.dw_captura=dw_new_det
	
	
	if l_st.instr='LF' then	 //LINDA FRIED
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())		
		openwithparm(w_instrumentos_lfried,l_st)
		l_st=message.powerobjectparm
		if isvalid(l_st) then
			if l_st.cambio then 
				i_cambia=true
				setitem(row,'json',l_st.json)
				setitem(row,'texto',l_st.texto)
				setitem(row,'inst1',l_st.instr1)
			end if
		end if		
		return
	end if
	
	if l_st.instr='HH' then //HERRERA HURTADO
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())
		openwithparm(w_instrumento_hc_herrerahurtado,l_st)
		l_st=message.powerobjectparm
		if isvalid(l_st) then
			if l_st.cambio then 
				i_cambia=true
				setitem(row,'json',l_st.json)
				setitem(row,'texto',l_st.texto)
				setitem(row,'inst1',l_st.instr1)
			end if
		end if
		return	
	end if	
	
	if l_st.instr='CK' then //CKD-EPI
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())
		f_ant1 =dw_new_det.describe("datawindow.table.filter")	
		fila_ant=row
		dw_new_det.setfilter("")
		dw_new_det.Filter( )		
		//Busca Peso
		fila= dw_new_det.find('numcampo='+string(103),1,dw_new_det.rowcount())
		if fila>0 then 
			l_st.valor=dw_new_det.getitemnumber(fila ,'numero')	
		end if
		if isnull(l_st.valor) or l_st.valor=0 then
			messagebox('Atencion','Se requeire campo peso para el calulo')
			return
		end if
		dw_new_det.setfilter(f_ant1)
		dw_new_det.Filter( )
		
		openwithparm(w_instrumento_ckd_epi,l_st)
		l_st=message.powerobjectparm
		if isvalid(l_st) then
			if l_st.cambio then 
				i_cambia=true
				setitem(row,'json',l_st.json)
				setitem(row,'texto',l_st.texto)
				setitem(row,'inst1',l_st.instr1)
				setitem(row,'inst2',l_st.instr2)
				setitem(row,'inst3',l_st.instr3)				
			end if
		end if
		return
	end if
	
	
	if l_st.instr='FO' then //CARDIO VASCULAR FRAMINGHAM/OMS
		dw_new_det.SetRedraw(true)	
		f_ant1 =dw_new_det.describe("datawindow.table.filter")	
		fila_ant=row
		dw_new_det.setfilter("")
		dw_new_det.Filter( )		
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())
		//juventud
		if l_st.codplantilla='C4' then 
			li_cipa=243
			li_csis=100	
		end if
		//adultez
		if l_st.codplantilla='C30' then 
			li_cipa=249
			li_csis=100		
		end if
		//vejez
		if l_st.codplantilla='C31' then
			li_cipa=249
			li_csis=100		
		end if
		//HIPERTENSOS
		if l_st.codplantilla='C35' then
			li_cipa=249
			li_csis=100		
		end if		
		//hipertenos
		if l_st.codplantilla='C14' then
			li_cipa=249
			li_csis=100
		end if	
		//Planificacion
		if l_st.codplantilla='C42' then
			li_cipa=249
			li_csis=100
		end if		
		//hipertenos
		//Busca IPA
		fila= dw_new_det.find('numcampo='+string(li_cipa),1,dw_new_det.rowcount())
		if fila>0 then 
			l_st.ipa=dw_new_det.getitemnumber(fila ,'numero')	
		end if
		//Busca Sistolica
		fila= dw_new_det.find('numcampo='+string(li_csis),1,dw_new_det.rowcount())
		if fila>0 then 
			l_st.sistolica=dw_new_det.getitemnumber(fila ,'numero')	
		end if
		dw_new_det.setfilter(f_ant1)
		dw_new_det.Filter( )
		
		openwithparm(w_instrumento_cardiovascular,l_st)
		l_st=message.powerobjectparm
		if isvalid(l_st) then
			if l_st.cambio then 
				i_cambia=true
				setitem(fila_ant,'json',l_st.json)
				setitem(fila_ant,'texto',l_st.texto)
				setitem(row,'inst1',l_st.instr1)
			end if
		end if		
		dw_new_det.SetRedraw(true)			
		return	
	end if		
	
	if l_st.instr='PC' then //ECLAMSIA
		l_st.fecha=datetime(w_principal.wf_fecha_nace())
		dw_new_det.SetRedraw(true)	
		f_ant1 =dw_new_det.describe("datawindow.table.filter")	
		fila_ant=row
		dw_new_det.setfilter("")
		dw_new_det.Filter( )		
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())
		
		//Busca IMC
		setnull(l_st.ipa)
		if l_st.codplantilla='C10'  or l_st.codplantilla='C9' then
			fila= dw_new_det.find('numcampo='+string(146),1,dw_new_det.rowcount())
			if fila>0 then 
				l_st.ipa=dw_new_det.getitemnumber(fila ,'numero')	
			end if
		end if
		dw_new_det.setfilter(f_ant1)
		dw_new_det.Filter( )	
		l_st.sexo=w_principal.dw_1.getitemstring(1,'sexo')		
		openwithparm(w_instrumento_eclampsia,l_st)
		l_st=message.powerobjectparm
		if isvalid(l_st) then
			if l_st.cambio then 			
				i_cambia=true
				setitem(fila_ant,'json',l_st.json)
				setitem(fila_ant,'texto',l_st.texto)
				setitem(row,'inst1',l_st.instr1)				
			end if
		end if		
		dw_new_det.SetRedraw(true)		
		return	
	end if			
	
	if l_st.instr='FR' then //FINNISH RISK
		dw_new_det.SetRedraw(true)	
		f_ant1 =dw_new_det.describe("datawindow.table.filter")	
		fila_ant=row
		dw_new_det.setfilter("")
		dw_new_det.Filter( )		
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())
		//juventud
		if l_st.codplantilla='C4' then 
			li_cipa=207
			li_csis=208	
			li_duf=250
			li_frf=251
			li_fru=70
			li_verd=71
		end if
		//adultez
		if l_st.codplantilla='C30' then 
			li_cipa=207
			li_csis=208
			li_duf=266
			li_frf=267
			li_fru=351
			li_verd=352			
		end if
		//vejez
		if l_st.codplantilla='C31' then
			li_cipa=207
			li_csis=208			
			li_duf=266
			li_frf=267	
			li_fru=351
			li_verd=352			
		end if
		//hipertenos
		if l_st.codplantilla='C14' then
			li_cipa=207
			li_csis=208
			li_duf=266
			li_frf=267	
			li_fru=351
			li_verd=352					
		end if	
		//Busca IMC
		fila= dw_new_det.find('numcampo='+string(li_cipa),1,dw_new_det.rowcount())
		if fila>0 then 
			l_st.ipa=dw_new_det.getitemnumber(fila ,'numero')	
		end if
		
		//Busca circun
		fila= dw_new_det.find('numcampo='+string(li_csis),1,dw_new_det.rowcount())
		if fila>0 then 
			l_st.sistolica=dw_new_det.getitemnumber(fila ,'numero')	
		end if
		
		//Busca duracion fisica
		fila= dw_new_det.find('numcampo='+string(li_duf),1,dw_new_det.rowcount())
		if fila>0 then 
			li_duf=dw_new_det.getitemnumber(fila ,'numero')	
		end if
		
		//Busca frecuencia fisica
		fila= dw_new_det.find('numcampo='+string(li_frf),1,dw_new_det.rowcount())
		if fila>0 then 
			li_frf=dw_new_det.getitemnumber(fila ,'numero')	
		end if
		
		if li_frf*li_duf>=150 then
			l_st.actfis=1
		else
			l_st.actfis=0			
		end if
				
		//Busca frutas
		fila= dw_new_det.find('numcampo='+string(li_fru),1,dw_new_det.rowcount())
		if fila>0 then 
			li_fru=dw_new_det.getitemnumber(fila ,'numero')	
		end if
		
		//Busca verduras
		fila= dw_new_det.find('numcampo='+string(li_verd),1,dw_new_det.rowcount())
		if fila>0 then 
			li_verd=dw_new_det.getitemnumber(fila ,'numero')	
		end if	
		
		if li_frf+ li_duf>1 then
			l_st.frutas=1
		else
			l_st.frutas=0			
		end if
		dw_new_det.setfilter(f_ant1)
		dw_new_det.Filter( )	
		l_st.sexo=w_principal.dw_1.getitemstring(1,'sexo')		
		openwithparm(w_instrumento_finnishr,l_st)
		l_st=message.powerobjectparm
		if isvalid(l_st) then
			if l_st.cambio then 			
				i_cambia=true
				setitem(fila_ant,'json',l_st.json)
				setitem(fila_ant,'texto',l_st.texto)
				setitem(row,'inst1',l_st.instr1)				
			end if
		end if		
		dw_new_det.SetRedraw(true)		
		return	
	end if		
		
	if l_st.instr='VL' then //VALE
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())
		openwithparm(w_instrumento_hc_vale,l_st)
		l_st=message.powerobjectparm
		if isvalid(l_st) then
			if l_st.cambio then 
				i_cambia=true
				setitem(row,'json',l_st.json)
				setitem(row,'texto',l_st.texto)				
			end if
		end if
		return	
	end if
	
	if l_st.instr='EA' then //ESCALA ABREVIADA DE DESARROLLO
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())
		openwithparm(w_instrumento_hc_ead,l_st)
		l_st=message.powerobjectparm
		if isvalid(l_st) then
			setitem(row,'json',l_st.json)
			setitem(row,'texto',l_st.texto)
			setitem(row,'inst1',l_st.instr1)
			setitem(row,'inst2',l_st.instr2)
			setitem(row,'inst3',l_st.instr3)
			setitem(row,'inst4',l_st.instr4)							
			i_cambia=true
		end if
		return
	end if
	
	if l_st.instr='MM' then	 //MINIMENTAL
		if w_principal.dw_1.getitemnumber(1,'dias')>=21535 then
			l_st.json=getitemstring(row,'json')
			l_st.fecha=datetime(w_principal.wf_fecha_nace())
			openwithparm(w_instrumento_hc_minimental,l_st)
			l_st=message.powerobjectparm
			if isvalid(l_st) then
				if l_st.cambio then 
					i_cambia=true
					setitem(row,'json',l_st.json)
					setitem(row,'texto',l_st.texto)						
				end if
			end if
			return		
		else
			return	
		end if
	end if
	
	if l_st.instr='ET' then	 //ESCALA TANNER
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())
		openwithparm(w_instrumentos_tanner,l_st)
		l_st=message.powerobjectparm
		if isvalid(l_st) then
			if l_st.cambio then 
				i_cambia=true
				setitem(row,'json',l_st.json)
				setitem(row,'texto',l_st.texto)						
			end if
		end if
		return				
	else
		l_st.json=getitemstring(row,'json')
		l_st.fecha=datetime(w_principal.wf_fecha_nace())		
		openwithparm(w_instrumentos_hc,l_st)
	end if
end if

if dwo.name='b_gra' then
	if isnull(getitemnumber(row ,'numero')) then 
		MessageBox("Atención", "No hay campo en la casilla de captura para evaluar")
		return
	end if
	l_st.codplantilla=this.getitemstring(row,'codplantilla')
	l_st.numcampo=this.getitemnumber(row,'numcampo')
	l_st.edad=w_principal.dw_1.getitemnumber(1,'dias')
	l_st.sexo=w_principal.dw_1.getitemstring(1,'sexo')
	l_st.origen=1
	l_st.dw_captura=dw_new_det
	l_st.fecha=datetime(em_1.text)
	openwithparm(w_grafica_hc,l_st)
end if

if dwo.name='b_for' then
	dw_new_det.SetRedraw(false)
	f_ant1 =dw_new_det.describe("datawindow.table.filter")
	ls_formula=this.getitemstring(row,'formula')

	l_numcampo=this.getitemnumber(row,'numcampo')
	fila_ant=row
	j=pos(ls_formula,'#',1)
	dw_new_det.setfilter("")
	dw_new_det.Filter( )
	
	do while j>0
		fin=len(ls_formula) +1
		k=pos(ls_formula,',',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,'/',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,'=',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,'D',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,'*',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,'-',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,'+',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,'(',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,')',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,'"',j+1)
		if k<fin and k<>0 then fin=k
		k=pos(ls_formula,'if',j+1)
		if k<fin and k<>0 then fin=k+2
		k=pos(ls_formula,'edad',j+1)
		if k<fin and k<>0 then fin=k+4
		k=pos(ls_formula,'sexo',j+1)
		if k<fin and k<>0 then fin=k+4
		k=pos(ls_formula,'plantilla',j+1)
		if k<fin and k<>0 then fin=k+9
		k=pos(ls_formula,'campo',j+1)
		if k<fin and k<>0 then fin=k+5
		ls_column=mid(ls_formula,j,fin - j)
		ls_column=mid(ls_column,2)
		if ls_column='edad'  or  ls_column='sexo' or  ls_column='plantilla'  or  ls_column='campo' then 
			if ls_column='edad' then 
				ld_valor=w_principal.dw_1.getitemnumber(1,'dias')
				l_st.edad=ld_valor
				ls_formula=mid(ls_formula,1, j - 1 )+string(ld_valor)+mid(ls_formula,fin)
			end if
			if ls_column='sexo' then
				choose case w_principal.dw_1.getitemstring(1,'sexo')
					case 'F'  
						l_sex='1'
					case 'M' 
						l_sex='0'
					end choose 
				l_st.sexo=l_sex
				ls_formula=mid(ls_formula,1, j - 1 )+"'"+l_sex+"'"+mid(ls_formula,fin)
			end if
			if ls_column='plantilla' then
				l_st.codplantilla=this.getitemstring(row,'codplantilla')
				ls_formula=mid(ls_formula,1, j - 1 )+"'"+this.getitemstring(row,'codplantilla')+"'"+mid(ls_formula,fin)
			end if
			if ls_column='campo' then
				l_pedazo=mid(ls_formula,fin)
				jp=pos(l_pedazo,'#',1)
				fp=len(l_pedazo) 
				ls_column=mid(l_pedazo,jp,fp - jp)
				ls_column=mid(ls_column,2)
				l_st.numcampo=integer(ls_column)
				ls_formula=mid(ls_formula,1, j - 1 )+ls_column+mid(ls_formula,fin)
			end if
		else 
			fila= dw_new_det.find('numcampo='+ls_column,1,dw_new_det.rowcount())
			if fila<0 then return
			if this.getitemstring(fila,'tipo') ='F' then 
				ls_formula=mid(ls_formula,1, j - 1 )+'date("'+string(dw_new_det.getitemdatetime(fila ,'fecha_cap'),'dd/mm/yyyy')+'")'+mid(ls_formula,fin)
			Else
				if this.getitemstring(fila,'tipo') ='Y' then 
					ld_valor=dw_new_det.getitemnumber(fila,'nitem')
				else	
					setnull(ld_valor)
					if fila<> 0 then
						ld_valor=dw_new_det.getitemnumber(fila ,'numero')	
					 end if
				end if
				if isnull(ld_valor) then ld_valor=0 
				l_st.valor= ld_valor
				ls_formula=mid(ls_formula,1, j - 1 )+string(ld_valor)+mid(ls_formula,fin)
			End If
		End If
		j=pos(ls_formula,'#',1)
	loop
	dw_new_det.setfilter(f_ant1)
	dw_new_det.Filter( )
	dw_new_det.SetRedraw(true)


	if  getitemstring(row,'tipo')='C' or getitemstring(row,'tipo')='X' then
		ls_result=describe("evaluate('"+ls_formula+"',0)")
		if getitemstring(row,'tipo')='C' then setitem(row,'numero',dec(ls_result))
		if getitemstring(row,'tipo')='X' then setitem(row,'fecha_cap',date(ls_result))
	else
		ls_result=f_percentil(l_st.edad,l_st.sexo,l_st.codplantilla,l_st.numcampo,l_st.valor)
		if not isnull(ls_result) then setitem(row,'texto',ls_result)
	end if
	fila= dw_new_det.find('numcampo='+ls_column,1,dw_new_det.rowcount())
	if fila<= 0 then  return
	dw_captur_histo.setitem(fila,'numero',dec(ls_result))
	i_cambia=true
end if
//dw_new_det.scrolltorow(f_ant1)
dw_new_det.scrolltorow(row) 
end event

event losefocus;if AcceptText() = -1 then Return -1
end event

