$PBExportHeader$uo_hclin_cambia.sru
forward
global type uo_hclin_cambia from userobject
end type
type dw_campos from datawindow within uo_hclin_cambia
end type
type dw_memos from datawindow within uo_hclin_cambia
end type
type dw_new from datawindow within uo_hclin_cambia
end type
type dw_serv_old from datawindow within uo_hclin_cambia
end type
type dw_ls from datawindow within uo_hclin_cambia
end type
type st_4 from statictext within uo_hclin_cambia
end type
type st_vertical from statictext within uo_hclin_cambia
end type
type st_2 from statictext within uo_hclin_cambia
end type
type st_1 from statictext within uo_hclin_cambia
end type
type dw_new_det from datawindow within uo_hclin_cambia
end type
type rte_1 from richtextedit within uo_hclin_cambia
end type
type dw_deta from datawindow within uo_hclin_cambia
end type
end forward

global type uo_hclin_cambia from userobject
integer width = 3305
integer height = 944
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event closequery pbm_closequery
event cambio_diags ( )
dw_campos dw_campos
dw_memos dw_memos
dw_new dw_new
dw_serv_old dw_serv_old
dw_ls dw_ls
st_4 st_4
st_vertical st_vertical
st_2 st_2
st_1 st_1
dw_new_det dw_new_det
rte_1 rte_1
dw_deta dw_deta
end type
global uo_hclin_cambia uo_hclin_cambia

type variables
private string i_clug,i_tipo,i_ing_sal,i_cespe,i_cplant,i_cemp,i_ccont,i_cprof, i_textos, i_campos, i_columnas
private long i_contador, posX, posY, colum, altura, consec
private datawindowchild idw_lista
private uo_timer timer
boolean i_cambia,i_nv_orden//para saber si se ha modificado algo//para saber si ya se insertó una orden de serv
string i_message,i_clug_nh,i_estado_hadm,i_tingre,i_clug_qx,i_modo
singlelineedit isle_proc,isle_med,isle_otros //para crear loas ordenes de serv cunado el objeto se abre en Evolución
picturebutton ipb_new_orden
boolean i_displayonly, i_pudo_orden,i_puede_modif//para que si no pudo crear una orden no siga enviando eso//para determinar si el usuario puede modificar la historia despues de cerrada la admision
long i_nh,i_nactoqx
keycode i_nextitem=keyf7!,i_nextchild=keyf9!,i_previtem=keyf8!
datawindow i_dw_oscab
st_xa_cambiar i_st
datawindowchild idw_finconp,idw_finprocp,idw_causaexp,idw_ambprocp

end variables
forward prototypes
public subroutine mover (long xpos)
public subroutine moverv (long ypos)
public function integer grabar ()
public function integer tamanyo (integer w, integer h)
public function integer reset ()
public function integer refresh_diags ()
public function integer guarda_diags ()
public subroutine navegar (keycode key)
public function integer lf_crea_serving (long p_nreg)
public function integer retrieve (long p_contador, string p_clug, string p_tipo, string p_tingre, string p_ingreso, string p_cespe, string p_cemp, string p_ccont, string p_cprof, long p_nactoqx, string p_clug_qx, long p_nreg)
public function integer pinta (st_xa_cambiar p_st)
public subroutine inicia_objs_ordenes (ref singlelineedit p_sle_proc, singlelineedit p_sle_med, picturebutton p_new_orden, datawindow p_dw_oscab, singlelineedit p_sle_otros)
end prototypes

event cambio_diags();//
end event

public subroutine mover (long xpos);//dw_histo.width=xpos
dw_deta.x=xpos+12
dw_deta.width= width - xpos -12
rte_1.x=dw_deta.x
rte_1.width=dw_deta.width
dw_serv_old.x=dw_deta.x
dw_serv_old.width=dw_deta.width
st_2.x=xpos+20
end subroutine

public subroutine moverv (long ypos);//la barra que va horizontal
st_4.y=ypos
//dw_histo.height=ypos - 88
dw_deta.height=ypos - 72
st_vertical.height=ypos -8

rte_1.height=dw_deta.height
dw_serv_old.height=dw_deta.height



end subroutine

public function integer grabar ();//if pos('234',i_tingre)>0 and i_estado_hadm<>'1' and i_puede_modif=false then
//	messagebox('Atención','La admisión ya se encuentra cerrada')
//	return -1
//end if

if not i_cambia then return 1
dw_new.event rowfocuschanging(dw_new.getrow(),dw_new.getrow())
long filas, donde, item, conteo, j = 1
boolean borra

dw_deta.setfilter('')
dw_deta.filter()

do while j <= dw_deta.rowcount()
	borra = FALSE
	choose case dw_deta.getitemstring(j,'tipo')
		case 'S'
			if isNull(dw_deta.getitemstring(j,'texto_s')) or trim(dw_deta.getitemstring(j,'texto_s')) = '' then
				dw_deta.DeleteRow(j)
				borra = TRUE
			end if
		case 'T' //:texto
			if isNull(dw_deta.getitemstring(j,'texto')) or trim(dw_deta.getitemstring(j,'texto')) = '' then
				dw_deta.DeleteRow(j)
				borra = TRUE
			end if
		case 'L' //:texto
			if isNull(dw_deta.getitemstring(j,'texto_l')) or trim(dw_deta.getitemstring(j,'texto_l')) = '' then
				dw_deta.DeleteRow(j)
				borra = TRUE
			end if
		case 'N'//:si/no  
			if isNull(dw_deta.getitemstring(j,'texto')) or trim(dw_deta.getitemstring(j,'sino')) = '' then
				dw_deta.DeleteRow(j)
				borra = TRUE
			end if
		case 'R'//:Numerico 
			if isNull(dw_deta.getitemnumber(j,'numero')) then
				dw_deta.DeleteRow(j)
				borra = TRUE
			end if
		case 'F' //:fecha
			if isNull(dw_deta.getitemdatetime(j,'fecha_cap')) then
				dw_deta.DeleteRow(j)
				borra = TRUE
			end if
	end choose
	if not borra then
		j = j + 1
	end if
loop

filas = dw_deta.RowCount()
for j = 1 to filas
	if dw_deta.getitemstring(j,'tipo') <> 'E' then
		dw_deta.event rec_revisa_padre(dw_deta.getitemnumber(j,'padre'))
	end if
	j = j + 1
next

if dw_deta.Update() = -1 then
	Rollback;
	Return -1
end if

for j=1 to dw_memos.rowcount()
	if dw_memos.getitemstring(j,'texto')<>'' then
		if dw_deta.find('item='+string(dw_memos.getitemnumber(j,'numcampo')),1,dw_deta.rowcount())>0 then continue
		item = dw_memos.getitemnumber(j,'numcampo')
		select count(*) into :conteo from hclin_reg_valor where contador=:i_st.contador and clugar=:i_st.clug and nregistro=:i_st.nreg and item=:item;
		if conteo = 0 then
			donde=dw_deta.insertrow(0)
			dw_deta.SetItem(donde,'contador',i_st.contador)
			dw_deta.SetItem(donde,'clugar',i_st.clug)
			dw_deta.SetItem(donde,'nregistro',i_st.nreg)
			dw_deta.setitem(donde,'item',dw_memos.getitemnumber(j,'numcampo'))
			dw_deta.setitem(donde,'padre',dw_memos.getitemnumber(j,'padre'))
			dw_deta.setitem(donde,'orden',dw_memos.getitemnumber(j,'orden'))
			dw_deta.setitem(donde,'descampo',dw_memos.getitemstring(j,'descampo'))
			dw_deta.setitem(donde,'tipo',dw_memos.getitemstring(j,'tipo'))
			dw_deta.setitem(donde,'tipo_memo',dw_memos.getitemstring(j,'tipo_memo'))
			dw_deta.event rec_revisa_padre(dw_memos.getitemnumber(j,'padre'))
		end if
	end if
next

blob guarda
string err
for j=1 to dw_memos.rowcount()
	item = dw_memos.getitemnumber(j,'numcampo')
	if dw_memos.getitemstring(j,'texto')<>'' then
		guarda=blob(dw_memos.getitemstring(j,'texto'))
		sqlca.autocommit=true
		updateblob hclin_reg_valor set long_texto =:guarda where contador=:i_st.contador and clugar=:i_st.clug and nregistro=:i_st.nreg and item=:item;
		sqlca.autocommit=false
		if sqlca.sqlcode=-1 then
			err = sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando long_texto en hclin_reg_valor',err)
			return -1
		end if
	end if
next
commit;
Return 1

end function

public function integer tamanyo (integer w, integer h);//primero posicion y luego tamaños
long w1,h1,w2,h2,w_actu,h_actu
constant long tit1=56,tit2=96
dec facto1,facto2,facto3,facto4

w_actu=width
h_actu=height
width=w+4
height=h+4
if w_actu=0 then w_actu=1
if h_actu=0 then h_actu=1 
facto1=dw_NEW.width/w_actu
facto2=dw_new.height/h_actu
if facto1=0 and w>100 then facto1=0.5
if facto2=0 and h>100 then facto2=0.5
if facto3=0 and w>100 then facto3=0.5
if facto4=0 and h>100 then facto4=0.5

w1=round(w * facto1 ,0)
h1=round(h * facto2,0)

w2=round(w * facto3,0)
h2=round(h * facto4,0)
st_vertical.x=w1
mover(w1)
st_4.y=h1+tit1
st_4.width=w
if i_displayonly = TRUE then
	moverv(h - 30)
else
	moverv(h1+tit1)
end if

return 1

end function

public function integer reset ();i_cplant=''
i_contador=0
i_clug=''
i_tipo=''
i_tingre=''
i_ing_sal=''
i_cespe=''
//dw_histo.reset()
i_cemp=''
i_ccont=''
setnull(i_cprof)

i_puede_modif=false

i_cambia=false
dw_deta.reset()
rte_1.visible=false

return 1
end function

public function integer refresh_diags ();
return 1
end function

public function integer guarda_diags ();string err
//if i_tingre='2' then
//	if uo_1.dw_tri.update(true,false)=-1 then
//		rollback;
//		return -1
//	end if
//end if
//if pos('234',i_tingre)>0 then
//	update hospadmi set estad_evol='1'
//	where contador=:i_contador and clugar_his=:i_clug;
//	IF SQLCA.SQLCode = -1 THEN
//		err=SQLCA.SQLErrText
//		rollback;
//		MessageBox("Error actualizando HospAdmi.estad_evol", err)
//		Return -1
//	END IF
//end if
//if dw_memos.find('tipo_memo="D"',1,dw_memos.rowcount())>0 and uo_1.dw_diags.getitemstatus(1,0,primary!)=datamodified! then
//	string snulo
//	setnull(snulo)
//	uo_datastore ds_diag
//	ds_diag=create uo_datastore
//	if pos('234',i_tingre)>0 then
//		if i_ing_sal='I' then
//			ds_diag.dataobject='dw_diags_hadmin'
//			ds_diag.settransobject(sqlca)
//			ds_diag.retrieve(i_nh,i_clug_nh,i_tingre)
//			ds_diag.setitem(1,'diagingre',uo_1.dw_diags.getitemstring(1,'r_diagingre'))
//			if uo_1.dw_diags.getitemstring(1,'c_diagcomplica')<>'' then 
//				ds_diag.setitem(1,'diagcomplica',uo_1.dw_diags.getitemstring(1,'r_diagcomplica'))
//			else
//				ds_diag.setitem(1,'diagcomplica',snulo)
//			end if
//			if uo_1.dw_diags.getitemstring(1,'c_diagingre1')<>'' then 
//				ds_diag.setitem(1,'diagingre1',uo_1.dw_diags.getitemstring(1,'r_diagingre1'))
//			else
//				ds_diag.setitem(1,'diagingre1',snulo)
//			end if
//			if uo_1.dw_diags.getitemstring(1,'c_diagingre2')<>'' then 
//				ds_diag.setitem(1,'diagingre2',uo_1.dw_diags.getitemstring(1,'r_diagingre2'))
//			else
//				ds_diag.setitem(1,'diagingre2',snulo)
//			end if
//			if uo_1.dw_diags.getitemstring(1,'c_diagingre3')<>'' then 
//				ds_diag.setitem(1,'diagingre3',uo_1.dw_diags.getitemstring(1,'r_diagingre3'))
//			else
//				ds_diag.setitem(1,'diagingre3',snulo)
//			end if
//		elseif i_ing_sal='S' then
//			ds_diag.dataobject='dw_diags_sale'
//			ds_diag.settransobject(sqlca)
//			if ds_diag.retrieve(i_nh,i_clug_nh,i_tingre)=0 then
//				long sali
//				ds_diag.insertrow(1)
//				select max (nsalida) into :sali from hospsali;
//				if sqlca.sqlcode=-1 then
//					err=sqlca.sqlerrtext
//					rollback;
//					dw_histo.deleterow(1)
//					dw_deta.reset()
//					messagebox('Error leyendo hospsali',err)
//					return -1
//				end if
//				ds_diag.setitem(1,'nsalida',sali)
//				ds_diag.setitem(1,'nhosp',i_nh)
//				ds_diag.setitem(1,'clugar_hadm',i_clug_nh)
//				ds_diag.setitem(1,'codtingre',i_tingre)
//				ds_diag.setitem(1,'fechaegreso',datetime(em_1.text))
//				ds_diag.setitem(1,'horaegreso',datetime(em_1.text))
//			end if
//			ds_diag.setitem(1,'estadosalida',uo_1.dw_diags.getitemstring(1,'est_sale'))
//			ds_diag.setitem(1,'diasincapacidad',uo_1.dw_diags.getitemNumber(1,'d_incap'))
//			ds_diag.setitem(1,'cprof',i_cprof)
//			ds_diag.setitem(1,'diagegreso',uo_1.dw_diags.getitemstring(1,'r_diagegreso'))
//			if uo_1.dw_diags.getitemstring(1,'c_diagegreso1')<>'' then 
//				ds_diag.setitem(1,'diagegreso1',uo_1.dw_diags.getitemstring(1,'r_diagegreso1'))
//			else
//				ds_diag.setitem(1,'diagegreso1',snulo)
//			end if
//			if uo_1.dw_diags.getitemstring(1,'c_diagegreso2')<>'' then 
//				ds_diag.setitem(1,'diagegreso2',uo_1.dw_diags.getitemstring(1,'r_diagegreso2'))
//			else
//				ds_diag.setitem(1,'diagegreso2',snulo)
//			end if
//			if uo_1.dw_diags.getitemstring(1,'c_diagegreso3')<>'' then 
//				ds_diag.setitem(1,'diagegreso3',uo_1.dw_diags.getitemstring(1,'r_diagegreso3'))
//			else
//				ds_diag.setitem(1,'diagegreso3',snulo)
//			end if
//			if uo_1.dw_diags.getitemstring(1,'c_diagcompli')<>'' then 
//				ds_diag.setitem(1,'diagcomplica',uo_1.dw_diags.getitemstring(1,'r_diagcompli'))
//			else
//				ds_diag.setitem(1,'diagcomplica',snulo)
//			end if
//			if uo_1.dw_diags.getitemstring(1,'est_sale')='1' then
//				ds_diag.setitem(1,'conductaurg',uo_1.dw_diags.getitemstring(1,'dest_urg'))
//				ds_diag.setitem(1,'causamuerte',snulo)
//				ds_diag.setitem(1,'defuncion',snulo)
//			else
//				ds_diag.setitem(1,'causamuerte',uo_1.dw_diags.getitemstring(1,'r_causamuerte'))
//				ds_diag.setitem(1,'defuncion',uo_1.dw_diags.getitemstring(1,'acta_defunc'))
//				ds_diag.setitem(1,'conductaurg',snulo)
//			end if
//		end if
//	elseif i_tipo='C' then//cons externa
//		ds_diag.dataobject='dw_diags_cext'
//		ds_diag.settransobject(sqlca)
//		if ds_diag.retrieve(i_contador,i_clug)>0 then
//			ds_diag.setitem(1,'tipodiagprin',uo_1.dw_diags.getitemstring(1,'tipo_diag'))
//			ds_diag.setitem(1,'causaexterna',uo_1.dw_diags.getitemstring(1,'causaext'))
//			ds_diag.setitem(1,'fin_consulta',uo_1.dw_diags.getitemstring(1,'finalidad'))
//			ds_diag.setitem(1,'diagprin',uo_1.dw_diags.getitemstring(1,'r_diagprin'))
//			ds_diag.setitem(1,'diagrel1',uo_1.dw_diags.getitemstring(1,'r_diagrel1'))
//			ds_diag.setitem(1,'diagrel2',uo_1.dw_diags.getitemstring(1,'r_diagrel2'))
//			ds_diag.setitem(1,'diagrel3',uo_1.dw_diags.getitemstring(1,'r_diagrel3'))
//			ds_diag.setitem(1,'diagrel4',uo_1.dw_diags.getitemstring(1,'r_diagrel4'))
//			ds_diag.setitem(1,'diagrel5',uo_1.dw_diags.getitemstring(1,'r_diagrel5'))
//			ds_diag.setitem(1,'diagcompli',uo_1.dw_diags.getitemstring(1,'r_diagcompli'))
//		end if
//	end if
//	if ds_diag.update(true,false)=-1 then 
//		dw_histo.deleterow(1)
//		dw_deta.reset()
//		return -1
//	end if
//	ds_diag.resetupdate()
//	post event cambio_diags()
//end if
return 1
end function

public subroutine navegar (keycode key);if i_modo='F' then return
if key=i_nextitem then
//	dw_new.scrollnextrow()
elseif key=i_nextchild then
//	dw_new.event doubleclicked(10,10,dw_new.getrow(),dw_new.object.label)
elseif key=i_previtem then
//	dw_new.scrollpriorrow()
end if
//if dw_new.getitemstring(dw_new.getrow(),'tipo')='M' then
//	if dw_res_new.visible then
//		dw_res_new.setfocus()
//	else
//		rte_2.setfocus()
//	end if
//else
//	dw_new_det.setfocus()
//end if

end subroutine

public function integer lf_crea_serving (long p_nreg);long j,norden,nitem_ord,conta_ord,nserv
string clug_ord
//conta_ord=dw_procs_new.getitemnumber(1,'contador')
//clug_ord=dw_procs_new.getitemstring(1,'clugar')
select max(nservicio) into :nserv from serviciosingreso where contador=:conta_ord and clugar=:clug_ord;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo max(serviciosingreso.nservicio)',sqlca.sqlerrtext)
	return -1
end if
if isnull(nserv) then nserv=0
//for j=1 to dw_procs_new.rowcount()
//	nserv++
//	dw_procs_new.setitem(j,'nservicio',nserv)
//	dw_procs_new.setitem(j,'nregistro_hc',p_nreg)
//	dw_procs_new.setitem(j,'estria',dw_procs_new.getitemstring(j,'estado'))
//next
//if dw_procs_new.update(true,false)=-1 then return -1
//for j=1 to dw_procs_new.rowcount()
//	conta_ord=dw_procs_new.getitemnumber(j,'conta_orden')
//	clug_ord=dw_procs_new.getitemstring(j,'clug_orden')
//	norden=dw_procs_new.getitemnumber(j,'norden_serv')
//	nitem_ord=dw_procs_new.getitemnumber(j,'item_orden')
//	update oscuerpo set suministrada=suministrada +1 where contador=:conta_ord and clugar=:clug_ord
//	and nsolicitud=:norden and item=:nitem_ord;
//	if sqlca.sqlcode=-1 then
//		messagebox('Error actualizando cantidades de OsCuerpo',sqlca.sqlerrtext)
//		return -1
//	end if
//next
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

public function integer retrieve (long p_contador, string p_clug, string p_tipo, string p_tingre, string p_ingreso, string p_cespe, string p_cemp, string p_ccont, string p_cprof, long p_nactoqx, string p_clug_qx, long p_nreg);//es como un inicia
i_contador=p_contador
i_clug=p_clug
i_tipo=p_tipo
i_tingre=p_tingre
i_ing_sal=p_ingreso
i_cespe=p_cespe
i_nactoqx=p_nactoqx
i_clug_qx=p_clug_qx
//if p_tipo='E' or p_tipo='R' then cbx_3.visible=true
//dw_histo.reset()
//if i_tipo='Q' then
//	if dw_histo.dataobject<>'dw_histo_regs_qx' then
//		dw_histo.dataobject='dw_histo_regs_qx'
//		dw_histo.settransobject(sqlca)
//	end if
//	dw_histo.retrieve(i_contador,i_clug,i_tipo,i_tingre,i_ing_sal,i_nactoqx,i_clug_qx)
//else
//	if dw_histo.dataobject<>'dw_histo_regs_solo' then
//		dw_histo.dataobject='dw_histo_regs_solo'
//		dw_histo.settransobject(sqlca)
//	end if
//	dw_deta.retrieve(i_contador,i_clug,i_tipo,i_tingre,i_ing_sal)
//	dw_histo.retrieve(i_contador,i_clug,i_tipo,i_tingre,i_ing_sal,p_nreg)
//end if
i_cemp=p_cemp
i_ccont=p_ccont
i_cprof=p_cprof
//em_1.text=string(datetime(today(),now()),'dd/mm/yyyy hh:mm')
i_puede_modif=false

if pos('2347',i_tingre)>0 then //es urg hosp o ambu
	select NH,clugar,estado into :i_NH,:i_clug_nh,:i_estado_hadm from hospadmi
	where contador=:i_contador and clugar_his=:i_clug;
	IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
		MessageBox("No existe registro en HospAdmi", SQLCA.SQLErrText)
		Return -1
	END IF
	string temp
	select edita_his into :temp from usuarios where usuario=:usuario;
	IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
		MessageBox("No se puede leer usuarios.edita_his", SQLCA.SQLErrText)
		Return -1
	END IF
	if temp='1' then i_puede_modif=true
end if

//dw_histo.post event rowfocuschanged(dw_histo.getrow())
return 1
end function

public function integer pinta (st_xa_cambiar p_st);i_st = p_st
i_cplant = i_st.plant

dw_new.setredraw(false)
i_nv_orden=false
i_pudo_orden=true
dw_new.reset()
dw_deta.reset()

string sintaxis, buffer, err
i_campos = ''
i_columnas = ''
i_textos = ''
consec = 0
PosX = 10
PosY = 10
altura=0
colum = 0
rte_1.visible=false
dw_campos.Retrieve(i_cplant,sex_busca)
if dw_campos.event revisar()=-1 THEN 
	dw_new.setredraw(true)
	return -1
end if
dw_memos.retrieve(i_cplant,sex_busca)
dw_deta.retrieve(i_st.contador,i_st.clug, i_st.nreg, i_st.tipo,p_st.tingre,i_st.ing_sal)
dw_new.retrieve(i_cplant,0,sex_busca)
dw_new.setredraw(true)
sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
dw_new_det.retrieve(i_cplant,sex_busca)

dw_new.event rowfocuschanged(dw_new.getrow())

end function

public subroutine inicia_objs_ordenes (ref singlelineedit p_sle_proc, singlelineedit p_sle_med, picturebutton p_new_orden, datawindow p_dw_oscab, singlelineedit p_sle_otros);isle_proc=p_sle_proc
isle_med=p_sle_med
ipb_new_orden=p_new_orden
i_dw_oscab=p_dw_oscab
isle_otros=p_sle_otros
end subroutine

on uo_hclin_cambia.create
this.dw_campos=create dw_campos
this.dw_memos=create dw_memos
this.dw_new=create dw_new
this.dw_serv_old=create dw_serv_old
this.dw_ls=create dw_ls
this.st_4=create st_4
this.st_vertical=create st_vertical
this.st_2=create st_2
this.st_1=create st_1
this.dw_new_det=create dw_new_det
this.rte_1=create rte_1
this.dw_deta=create dw_deta
this.Control[]={this.dw_campos,&
this.dw_memos,&
this.dw_new,&
this.dw_serv_old,&
this.dw_ls,&
this.st_4,&
this.st_vertical,&
this.st_2,&
this.st_1,&
this.dw_new_det,&
this.rte_1,&
this.dw_deta}
end on

on uo_hclin_cambia.destroy
destroy(this.dw_campos)
destroy(this.dw_memos)
destroy(this.dw_new)
destroy(this.dw_serv_old)
destroy(this.dw_ls)
destroy(this.st_4)
destroy(this.st_vertical)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_new_det)
destroy(this.rte_1)
destroy(this.dw_deta)
end on

event constructor;timer=create uo_timer


end event

type dw_campos from datawindow within uo_hclin_cambia
event type integer addcontrol ( integer fila )
event type integer addchildren ( string padre,  integer nivel )
event type integer revisar ( )
boolean visible = false
integer x = 1573
integer y = 768
integer width = 914
integer height = 160
integer taborder = 40
string title = "none"
string dataobject = "dw_plan_campos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer addcontrol(integer fila);string modifica, nombre, medida
long i, ncampo

ncampo = GetItemNumber(fila,'numcampo')
nombre = GetItemString(fila,'descampo')
medida = GetItemString(fila,'medida')
if isnull(medida) then medida=''
if isnull(nombre) then nombre='campo '+string(ncampo)
////Tipo de Control
// Etiqueta
if GetItemString(fila,'tipo') = 'E' then 
	consec = consec + 1
//	if col = 1 then PosY = PosY + altura
	if colum = 1 then PosY = PosY + altura
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=etiqueta_'+string(ncampo)+' dbname="etiqueta_'+string(ncampo)+'" initial="'+nombre+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence=0 border="0" color="33554432" x="'+String(PosX)+'" y="'+string(posY)+'" height="56" width="1362" format="[general]" html.valueishtml="0"  name=etiqueta_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424")~r~n'
	PosY = PosY + 100
	altura = 0 
	colum = 0
end if

// Seleccion
if GetItemString(fila,'tipo') = 'S' then 
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=selec_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'	
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=seleccion_'+string(ncampo)+' dbname="seleccion_'+string(ncampo)+'" values="	1/	0" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY + 80)+'" height="56" width="105" format="[general]" html.valueishtml="0"  name=seleccion_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" checkbox.text="" checkbox.on="1" checkbox.off="0" checkbox.scale=no checkbox.threed=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )~r~n'
	if colum = 1 then 
		if altura > 170 then
			PosY = Posy + altura
		else
			PosY = PosY + 170
		end if
		colum = 0
	else
		altura = 170
		colum = 0
	end if
end if

// Si / No
if GetItemString(fila,'tipo') = 'N' then
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=sino_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'	
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=sino_'+string(ncampo)+' dbname="sino_'+string(ncampo)+'" values="Si	1/No	0/" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="56" width="393" format="[general]" html.valueishtml="0"  name=sino_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" radiobuttons.columns=2 radiobuttons.scale=no radiobuttons.threed=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )~r~n'
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
if GetItemString(fila,'tipo') = 'L' then
	dw_ls.Retrieve(GetItemString(fila,'codplantilla'),GetItemNumber(fila,'numcampo'))
	for i = 1 to dw_ls.RowCount()
		modifica = modifica + dw_ls.GetItemString(i,'descripcion') + "~t" + string(dw_ls.GetItemNumber(i,'nitem')) + "/"
	next
	consec = consec + 1
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=lista_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'	
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=lista_'+string(ncampo)+' dbname="lista_'+string(ncampo)+'" values="'+modifica+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="56" width="1289" format="[general]" html.valueishtml="0"  name=lista_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" ddlb.limit=0 ddlb.allowedit=no ddlb.case=any ddlb.vscrollbar=yes ddlb.useasborder=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
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
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=texto_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=texto_'+string(ncampo)+' dbname="texto_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="132" width="1280" format="[general]" html.valueishtml="0"  name=texto_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=255 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autovscroll=yes edit.vscrollbar=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
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
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1500)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=memo_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	i_campos = i_campos + 'column=(type=char(32766) updatewhereclause=yes name=memo_'+string(ncampo)+' dbname="memo_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*1500)+'" y="'+string(PosY+80)+'" height="696" width="1458" format="[general]" html.valueishtml="0"  name=memo_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autovscroll=yes edit.vscrollbar=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	if GetItemString(fila,'tipo_memo') = 'R' then
		i_columnas = i_columnas + 'button(band=detail text="Resultados" enabled=yes action="0" border="1" color="0" x="'+String(PosX + colum*1500 + 1180)+'" y="'+string(PosY+80+700)+'" height="64" width="274" vtextalign="0" htextalign="0"  name=b_1 visible="1"  font.face="Tahoma" font.height="-7" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" )~r~n'
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
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=numero_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=numero_'+string(ncampo)+' dbname="numero_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="1" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="56" width="270" format="[general]" html.valueishtml="0"  name=numero_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" editmask.spin=yes editmask.mask="###,###.00" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+medida+'" border="0" color="0" x="'+String(PosX + colum*1400 + 310)+'" y="'+string(PosY+80)+'" height="56" width="645" html.valueishtml="0"  name=medida_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
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
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=fecha_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	i_campos = i_campos + 'column=(type=datetime updatewhereclause=yes name=fecha_'+string(ncampo)+'  dbname="fecha_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="56" width="361" format="dd/mm/yyyy" html.valueishtml="0"  name=fecha_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" editmask.spin=yes editmask.mask="dd/mm/yyyy" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
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

fila = dw_campos.Find("padre=" + padre,1,dw_campos.RowCount())
do while fila > 0
	cant = cant + 1
	PosX = 30 * Nivel
	if Event addControl(fila) = -1 then
		MessageBox('Error','Error Adicionando control')
		Return -1
	end if
	ret = Event addChildren(String(dw_campos.GetItemNumber(fila,'numcampo')), Nivel + 1)
	if fila = dw_campos.RowCount() then EXIT
	fila = dw_campos.Find("padre=" + padre,fila + 1,dw_campos.RowCount())
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
		MessageBox('Atención','La plantilla tiene campos errónes, revisela para poder trabajar con ella (Hay campos que no tienen campo padre)')
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

event constructor;setTransObject(SQLCA)

end event

event retrieveend;//if rowcount = 0 then Return
//integer i, f, Nivel=1, col = 0
//
//PosX = 10
//PosY = 10
//
//for i = 1 to this.RowCount()
//	if GetItemNumber(i,'padre') = 0 then
//		if event addControl(i) = -1 then
//			MessageBox('Error','Error Adicionando control')
//			Return -1
//		end if
//		// Children
//		event addChildren(String(this.GetItemNumber(i,'numcampo')), Nivel + 1)
//	end if
//next
//
end event

type dw_memos from datawindow within uo_hclin_cambia
boolean visible = false
integer x = 736
integer y = 768
integer width = 736
integer height = 128
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_lista_memos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event retrieveend;long i, item
blob dato
for i = 1 to RowCount()
	item = getitemNumber(i,'numcampo')
	sqlca.autocommit=true
	selectblob long_texto into :dato from hclin_reg_valor where contador=:i_st.contador and clugar=:i_st.clug and nregistro=:i_st.nreg and item=:item;
	sqlca.autocommit=false
	SetItem(i,'texto',string(dato))
next

end event

type dw_new from datawindow within uo_hclin_cambia
event type long rec_crea_hijos ( long p_padre,  long p_nivel,  long p_fila )
event type long inserta ( long p_pos,  string p_label,  integer p_nivel,  long p_padre,  long p_hijos,  string p_tipo_campo,  long p_contador,  string p_clug,  long p_nreg,  long p_item,  string p_tipomemo,  long p_orden )
event rec_mostrar ( long p_fila,  long p_inicial,  integer p_visible )
event keypres pbm_dwnkey
integer x = 5
integer y = 68
integer width = 1568
integer height = 656
integer taborder = 20
string title = "none"
string dataobject = "dw_hclin_arma_arbol"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type long rec_crea_hijos(long p_padre, long p_nivel, long p_fila);uo_datastore ds_hijos
ds_hijos=create uo_datastore
ds_hijos.dataobject='dw_hclin_arma_arbol'
ds_hijos.settransobject(sqlca)
long j,sumar,inserto=0,hijos
string temp
//	pos,label,nivel,padre,hijos,apdx,fecha,contador,clug,llave3,llave4,sllave3,sllave4
sumar=p_fila +1
if ds_hijos.retrieve(i_cplant,p_padre)>0 then
	setitem(p_fila,'hijos',ds_hijos.rowcount())
	for j=1 to ds_hijos.rowcount()
		temp=ds_hijos.getitemstring(j,'label')
		inserto ++
		event inserta(sumar  ,temp,p_nivel,getitemnumber(p_fila,'numcampo'),ds_hijos.getitemnumber(j,'hijos'),ds_hijos.getitemstring(j,'tipo'),i_contador,i_clug,0,ds_hijos.getitemnumber(j,'numcampo'),ds_hijos.getitemstring(j,'tipo_memo'),ds_hijos.getitemnumber(j,'orden')) 
		hijos= event rec_crea_hijos(getitemnumber(sumar,'numcampo'),p_nivel+1,sumar) 
		sumar+= hijos +1
		inserto += hijos
	next
end if
return inserto
end event

event type long inserta(long p_pos, string p_label, integer p_nivel, long p_padre, long p_hijos, string p_tipo_campo, long p_contador, string p_clug, long p_nreg, long p_item, string p_tipomemo, long p_orden);long donde
donde=insertrow(p_pos )
setitem(donde,'codplantilla',i_cplant)
setitem(donde,'numcampo',p_item)
setitem(donde,'tipo',p_tipo_campo)
setitem(donde,'label',p_label)
setitem(donde,'nivel',p_nivel)
setitem(donde,'padre',p_padre)
setitem(donde,'hijos',p_hijos)
setitem(donde,'tipo_memo',p_tipomemo)
setitem(donde,'orden',p_orden)
return donde

end event

event rec_mostrar(long p_fila, long p_inicial, integer p_visible);long j,cual,p_mostrar
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

event constructor;settransobject(sqlca)
if i_displayonly = TRUE then Visible = FALSE

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

event retrieveend;long j
//for j=1 to rowcount
//	event rec_crea_hijos(getitemnumber(j,'numcampo'),1,j)
//next
j=find('padre=0',1,rowcount())
do while j>0
	event rec_crea_hijos(getitemnumber(j,'numcampo'),1,j )
	j=find('padre=0',j+1,rowcount())
	if j=rowcount() then exit
loop
end event

event rowfocuschanged;if getrow()<1 then return
dw_deta.accepttext()
if getitemstring(getrow(),'tipo')='M' then
	rte_1.visible=true
	dw_deta.visible=false
	long cual
	cual=dw_memos.find('numcampo='+string(getitemnumber(getrow(),'numcampo')),1,dw_memos.rowcount())
	if cual=0 then
		messagebox('Atención','No se puede encontrar el campo en el cual está la información de esta fila')
		return
	end if
	boolean temp
	temp=i_cambia
	f_pega_a_rtf(rte_1,dw_memos.getitemstring(cual,'texto'),3)
	rte_1.modified = FALSE
	i_cambia=temp
else
	rte_1.visible=false
	dw_deta.setfilter('padre='+string(getitemnumber(getrow(),'numcampo')))
	dw_new_det.setfilter('padre='+string(getitemnumber(getrow(),'numcampo')))
	dw_deta.setredraw(false)
	dw_deta.filter()
	dw_new_det.filter()
	dw_deta.Event add_campos()
	dw_deta.sort()
	dw_deta.groupcalc()
	dw_deta.triggerevent (itemfocuschanged!)
	dw_deta.sort()
	dw_deta.groupcalc()
	dw_deta.visible=true
	dw_deta.setredraw(true)
end if

end event

event rowfocuschanging;if currentrow<1 or rowcount()=0 then return
if getitemstring(currentrow,'tipo')='M' then
	long cual
	cual=dw_memos.find('numcampo='+string(getitemnumber(currentrow,'numcampo')),1,dw_memos.rowcount())
	dw_memos.setitem(cual,'texto',rte_1.copyrtf(false,detail!))
end if

end event

type dw_serv_old from datawindow within uo_hclin_cambia
boolean visible = false
integer x = 1627
integer y = 72
integer width = 686
integer height = 400
integer taborder = 60
string title = "none"
string dataobject = "dw_rips_hc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('fin_consulta',idw_finconp)
idw_finconp.settransobject(sqlca)
getchild('finalidadproced',idw_finprocp)
idw_finprocp.settransobject(SQLCA)
getchild('causaexterna',idw_causaexp)
idw_causaexp.settransobject(sqlca)
getchild('ambitoproced',idw_ambprocp)
idw_ambprocp.settransobject(sqlca)

idw_finconp.retrieve('1')
idw_finprocp.retrieve('1')
idw_causaexp.retrieve('1')
idw_ambprocp.retrieve('1')
end event

type dw_ls from datawindow within uo_hclin_cambia
boolean visible = false
integer x = 1513
integer width = 686
integer height = 256
integer taborder = 30
string title = "none"
string dataobject = "dw_plan_lista"
boolean resizable = true
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

type st_4 from statictext within uo_hclin_cambia
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
integer y = 740
integer width = 3319
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

type st_vertical from statictext within uo_hclin_cambia
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
integer x = 1609
integer width = 14
integer height = 752
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

type st_2 from statictext within uo_hclin_cambia
integer x = 1632
integer width = 1294
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within uo_hclin_cambia
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
string text = "Campos de la Plantilla"
boolean focusrectangle = false
end type

type dw_new_det from datawindow within uo_hclin_cambia
event keypres pbm_dwnkey
boolean visible = false
integer x = 1646
integer y = 64
integer width = 1614
integer height = 692
integer taborder = 50
string title = "none"
string dataobject = "dw_captur_histo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypres;if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event constructor;settransobject(sqlca)
getchild('texto_l',idw_lista)
idw_lista.settransobject(sqlca)
if i_displayonly = TRUE then Visible = FALSE

end event

event itemchanged;i_cambia=true
end event

event itemfocuschanged;choose case getcolumnName()
	case 'texto_l' 
		idw_lista.retrieve(i_cplant,getitemnumber(getrow(),'numcampo'))
	
end choose
end event

event retrieveend;long j,nnulo
string snulo
setnull(nnulo)
setnull(nnulo)
for j=1 to rowcount
	setitem(j,'numero',nnulo)
	setitem(j,'sino',snulo)
	setitem(j,'texto',snulo)
next
end event

type rte_1 from richtextedit within uo_hclin_cambia
integer x = 1609
integer y = 64
integer width = 1609
integer height = 672
integer taborder = 10
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
borderstyle borderstyle = stylelowered!
end type

event key;if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event modified;i_cambia=true

end event

type dw_deta from datawindow within uo_hclin_cambia
event rec_revisa_padre ( long padre )
event keypres pbm_dwnkey
event add_campos ( )
integer x = 1627
integer y = 72
integer width = 1614
integer height = 692
integer taborder = 20
string title = "none"
string dataobject = "dw_hclin_val_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rec_revisa_padre(long padre);if padre=0 then return
if i_st.dw_hist.find('item='+string(padre),1,i_st.dw_hist.Rowcount())=0 then
	long f, fs
	if Find("item="+string(padre),1,RowCount()) > 0 then Return
	fs = dw_campos.find('numcampo='+string(padre),1, dw_campos.rowcount())
	if fs = 0 then Return	
	f = InsertRow(0)
	SetItem(f,'contador',i_st.contador)
	SetItem(f,'clugar',i_st.clug)
	SetItem(f,'nregistro',i_st.nreg)
	setitem(f,'item',dw_campos.getitemnumber(fs,'numcampo'))
	setitem(f,'padre',dw_campos.getitemnumber(fs,'padre'))
	setitem(f,'orden',dw_campos.getitemnumber(fs,'orden'))
	setitem(f,'descampo',dw_campos.getitemstring(fs,'descampo'))
	setitem(f,'tipo',dw_campos.getitemstring(fs,'tipo'))
	event rec_revisa_padre(dw_campos.getitemnumber(fs,'padre'))
end if

end event

event keypres;if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event add_campos();long i, f
for i = 1 to dw_new_det.RowCount()
	f = Find("item="+string(dw_new_det.GetItemNumber(i,'numcampo')),1,RowCount())
	if f = 0 then
		f = InsertRow(0)
		SetItem(f,'contador',i_st.contador)
		SetItem(f,'clugar',i_st.clug)
		SetItem(f,'nregistro',i_st.nreg)
		SetItem(f,'item',dw_new_det.GetItemNumber(i,'numcampo'))
		SetItem(f,'padre',dw_new_det.GetItemNumber(i,'padre'))
		SetItem(f,'tipo',dw_new_det.GetItemString(i,'tipo'))
		SetItem(f,'descampo',dw_new_det.GetItemString(i,'descampo'))
		SetItem(f,'orden',dw_new_det.GetItemNumber(i,'orden'))
		SetItem(f,'medida',dw_new_det.GetItemString(i,'medida'))
	end if
next

end event

event constructor;settransobject(sqlca)
getchild('texto_l',idw_lista)
idw_lista.settransobject(sqlca)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event itemchanged;i_cambia=true
//string tipo
//boolean revisar
//tipo = Describe(dwo.name+".coltype")
//if tipo = 'string' then
//	if not isNull(GetItemString(GetRow(),string(dwo.name))) and trim(GetItemString(GetRow(),string(dwo.name))) <> '' then revisar = TRUE
//elseif tipo = 'number' then
//	if not isNull(GetItemNumber(GetRow(),string(dwo.name))) then revisar = TRUE	
//end if
//if revisar then dw_deta.event rec_revisa_padre(getitemnumber(GetRow(),'padre'))
//
end event

event itemfocuschanged;choose case getcolumnName()
	case 'texto_l' 
		idw_lista.retrieve(i_cplant,getitemnumber(getrow(),'numcampo'))
	
end choose

end event

event losefocus;acceptText()

end event

