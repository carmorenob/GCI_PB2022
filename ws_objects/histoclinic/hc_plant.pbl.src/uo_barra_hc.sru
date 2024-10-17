$PBExportHeader$uo_barra_hc.sru
forward
global type uo_barra_hc from userobject
end type
type pb_buscaproc from picturebutton within uo_barra_hc
end type
type pb_buscamed from picturebutton within uo_barra_hc
end type
type dw_cond from datawindow within uo_barra_hc
end type
type pb_kits from picturebutton within uo_barra_hc
end type
type pb_result from picturebutton within uo_barra_hc
end type
type pb_del_proc from picturebutton within uo_barra_hc
end type
type pb_urg from picturebutton within uo_barra_hc
end type
type pb_procs from picturebutton within uo_barra_hc
end type
type pb_cpo from picturebutton within uo_barra_hc
end type
type pb_guia from picturebutton within uo_barra_hc
end type
type c_ord from picturebutton within uo_barra_hc
end type
type pb_cevol from picturebutton within uo_barra_hc
end type
type dw_diags from datawindow within uo_barra_hc
end type
type pb_lleva from picturebutton within uo_barra_hc
end type
type pb_medi from picturebutton within uo_barra_hc
end type
type pb_save from picturebutton within uo_barra_hc
end type
type pb_antecedente from picturebutton within uo_barra_hc
end type
type dw_tri from datawindow within uo_barra_hc
end type
type pb_tri from picturebutton within uo_barra_hc
end type
type pb_1 from picturebutton within uo_barra_hc
end type
end forward

global type uo_barra_hc from userobject
integer width = 5042
integer height = 288
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event navegar ( keycode key )
pb_buscaproc pb_buscaproc
pb_buscamed pb_buscamed
dw_cond dw_cond
pb_kits pb_kits
pb_result pb_result
pb_del_proc pb_del_proc
pb_urg pb_urg
pb_procs pb_procs
pb_cpo pb_cpo
pb_guia pb_guia
c_ord c_ord
pb_cevol pb_cevol
dw_diags dw_diags
pb_lleva pb_lleva
pb_medi pb_medi
pb_save pb_save
pb_antecedente pb_antecedente
dw_tri dw_tri
pb_tri pb_tri
pb_1 pb_1
end type
global uo_barra_hc uo_barra_hc

type variables
long i_contador,i_nreg,i_ncampo
string i_clug,i_cplant,i_ing,i_tipo_plant,i_tingres,i_cemp,i_ccont,i_tipo_memo,i_cprof,i_cesp,is_guia,ls_tipo,is_pdf,i_cpo
string i_antecedente,i_alergia,i_codant,i_tipoa
//richtextedit i_rte
multilineedit i_mle
datawindowchild idw_tipodiag,idw_profe,idw_desturg,idw_finalidad,idw_causaext,idw_fincon,idw_modrea
singlelineedit i_st
datawindow idw_results,idw_dats,idw_memos, idw_frm
uo_hclin i_uo_padre
end variables

forward prototypes
public subroutine retrieve (integer p_item)
public function integer f_enlaza_ordenes (string p_codigo, string p_tipo, string p_agrupserv)
public function integer refresh_diags ()
public subroutine reemp_campo (string p_name_campo, string p_dato)
public function integer getdiagrip (string codgeral, ref string cod_rip, ref string descrip, ref string guia)
public subroutine retrieve (long p_item, string p_tipo, string p_antecedente, string p_codant, string p_alergia, string p_cpo)
public subroutine inicia (long p_contador, string p_clug, long p_nreg, string p_cplant, string p_ing, string p_tipo_plant, string p_tingres, singlelineedit p_st, multilineedit a_mle, string p_cemp, string p_ccont, string p_cprof, datawindow p_dw_res, datawindow p_dw_dats, datawindow p_dw_memos, datawindow p_dw_frm, string p_cesp)
public function integer updaterte ()
end prototypes

public subroutine retrieve (integer p_item);
end subroutine

public function integer f_enlaza_ordenes (string p_codigo, string p_tipo, string p_agrupserv);long l_pasa
if isvalid(i_uo_padre.isle_proc) then
	if not i_uo_padre.i_nv_orden then
		i_uo_padre.ipb_new_orden.tag=i_cplant
		if i_uo_padre.ipb_new_orden.event clicked()=-1 then
			i_uo_padre.i_pudo_orden=false
			return -1
		else
			i_uo_padre.i_nv_orden=true
		end if
	end if
	if p_tipo='P' then
		long j
		if p_agrupserv<>'04' then//si es 04 tcoca uno por uno y si viene de qx no lo puede cargar
			i_uo_padre.isle_proc.text=p_codigo
			i_uo_padre.sle_otros.text=dw_cond.getitemstring(1,'observacion')
			if isnull(dw_cond.getitemstring(1,'especialidad')) or dw_cond.getitemstring(1,'especialidad')='' then 
				i_uo_padre.sle_otros.tag=i_cesp
			else
				i_uo_padre.sle_otros.tag=dw_cond.getitemstring(1,'especialidad')
			end if
			i_uo_padre.isle_proc.tag=string(dw_cond.getitemnumber(1,'cantidad'))
			i_uo_padre.isle_tiporep.text='E'
			l_pasa=i_uo_padre.isle_proc.event modified()
			if l_pasa=-1 then return -1
		else
			for j=1 to dw_cond.getitemnumber(1,'cantidad')
				i_uo_padre.isle_proc.text=p_codigo
				i_uo_padre.isle_tiporep.text='E'
				l_pasa=i_uo_padre.isle_proc.event modified()
				if l_pasa=-1 then return -1
			next
		end if
	else
		if p_agrupserv='0' then
			i_uo_padre.isle_med.text=p_codigo
			i_uo_padre.isle_tiporep.text='E'
			i_uo_padre.isle_tiporep.tag=dw_cond.getitemstring(dw_cond.getrow(),'via')
			i_uo_padre.isle_kits.text=string(dw_cond.getitemnumber(dw_cond.getrow(),'cantk'))
			i_uo_padre.isle_kits.tag=string(dw_cond.getitemnumber(dw_cond.getrow(),'dosis'))
			i_uo_padre.isle_med.tag=string(dw_cond.getitemnumber(dw_cond.getrow(),'cantidad')* dw_cond.getitemnumber(dw_cond.getrow(),'cantk'))
			i_uo_padre.sle_otros.text=dw_cond.getitemstring(dw_cond.getrow(),'frecuen')
			i_uo_padre.sle_otros.tag=dw_cond.getitemstring(dw_cond.getrow(),'administracion')
			i_uo_padre.isle_med.event modified()
			dw_cond.setitem(1,'cantidad',integer(i_uo_padre.isle_med.tag))
			setnull(i_uo_padre.sle_otros.tag)
			setnull(i_uo_padre.sle_otros.text)
			setnull(i_uo_padre.isle_med.tag)
			setnull(i_uo_padre.isle_med.text)
			setnull(i_uo_padre.isle_tiporep.tag)
			setnull(i_uo_padre.isle_kits.text)
			setnull(i_uo_padre.isle_kits.tag)	
		else
			i_uo_padre.isle_med.text=p_codigo
			i_uo_padre.isle_med.tag=string(dw_cond.getitemnumber(dw_cond.getrow(),'cantidad'))
			i_uo_padre.isle_tiporep.text='E'
			i_uo_padre.isle_kits.text=string(dw_cond.getitemnumber(dw_cond.getrow(),'cantk'))
			i_uo_padre.isle_tiporep.tag=dw_cond.getitemstring(dw_cond.getrow(),'via')
			i_uo_padre.sle_otros.text=dw_cond.getitemstring(dw_cond.getrow(),'frecuen')
			i_uo_padre.sle_otros.tag=dw_cond.getitemstring(dw_cond.getrow(),'administracion')	
			i_uo_padre.isle_kits.tag=string(dw_cond.getitemnumber(dw_cond.getrow(),'dosis'))
			l_pasa=i_uo_padre.isle_med.event modified()
			if l_pasa=-1 then return -1
			dw_cond.setitem(1,'cantidad',integer(i_uo_padre.isle_med.tag))
			setnull(i_uo_padre.sle_otros.tag)
			setnull(i_uo_padre.sle_otros.text)
			setnull(i_uo_padre.isle_med.tag)
			setnull(i_uo_padre.isle_med.text)		
			setnull(i_uo_padre.isle_tiporep.tag)		
			setnull(i_uo_padre.isle_kits.text)
			setnull(i_uo_padre.isle_kits.tag)					
		end if
	end if
end if
return 1
end function

public function integer refresh_diags ();dw_diags.reset()
long f_ubica
dw_diags.retrieve(i_cplant,i_tingres)

uo_datastore ds
ds=create uo_datastore
if pos('2347',i_tingres)>0 then
	if i_ing='I' then
		dw_tri.retrieve(i_contador,i_clug)
		ds.dataobject='dw_diags_hadmin'
		ds.settransobject(sqlca)
		if ds.retrieve(i_uo_padre.i_nh,i_uo_padre.i_clug_nh,i_tingres)=0 then goto sale
		dw_diags.setitem(1,'c_diagingre',ds.getitemstring(1,'cod_rips'))
		dw_diags.setitem(1,'c_diagcomplica',ds.getitemstring(1,'cod_rips_complica'))
		dw_diags.setitem(1,'c_diagingre1',ds.getitemstring(1,'cod_ripsing1'))
		dw_diags.setitem(1,'c_diagingre2',ds.getitemstring(1,'cod_ripsing2'))
		dw_diags.setitem(1,'c_diagingre3',ds.getitemstring(1,'cod_ripsing3'))
		dw_diags.setitem(1,'r_diagingre',ds.getitemstring(1,'diagingre'))
		dw_diags.setitem(1,'r_diagcomplica',ds.getitemstring(1,'diagcomplica'))
		dw_diags.setitem(1,'r_diagingre1',ds.getitemstring(1,'diagingre1'))
		dw_diags.setitem(1,'r_diagingre2',ds.getitemstring(1,'diagingre2'))
		dw_diags.setitem(1,'r_diagingre3',ds.getitemstring(1,'diagingre3'))
		dw_diags.setitem(1,'d_diagingre',ds.getitemstring(1,'desdiag'))
		dw_diags.setitem(1,'d_diagcomplica',ds.getitemstring(1,'descompli'))
		dw_diags.setitem(1,'d_diagingre1',ds.getitemstring(1,'desdiagingre1'))
		dw_diags.setitem(1,'d_diagingre2',ds.getitemstring(1,'desdiagingre2'))
		dw_diags.setitem(1,'d_diagingre3',ds.getitemstring(1,'desdiagingre3'))
		dw_diags.setitem(1,'tipo_diag',ds.getitemstring(1,'tipodiagprin'))
		dw_diags.setitem(1,'cod_modrel',ds.getitemstring(1,'cod_modrel'))		
		if not isnull(ds.getitemstring(1,'fin_consulta')) then
			dw_diags.setitem(1,'finalidad',ds.getitemstring(1,'fin_consulta'))
			f_ubica=idw_finalidad.find("codfin='"+ds.getitemstring(1,'fin_consulta')+"'",1,idw_finalidad.RowCount())
			idw_finalidad.setrow(f_ubica)
		end if
		If not isnull(ds.getitemstring(1,'causaexterna')) then
			dw_diags.setitem(1,'causaext',ds.getitemstring(1,'causaexterna'))
			f_ubica=idw_causaext.find("codcausaexter='"+ds.getitemstring(1,'causaexterna')+"'",1, idw_causaext.RowCount())
			idw_causaext.setrow(f_ubica)
		end if
	elseif i_ing='S' then//los r_ son los reales de la BD
		ds.dataobject='dw_diags_sale'
		ds.settransobject(sqlca)
		if ds.retrieve(i_uo_padre.i_nh,i_uo_padre.i_clug_nh,i_tingres)=0 then goto sale
		dw_diags.setitem(1,'c_diagegreso',ds.getitemstring(1,'cod_rips'))
		dw_diags.setitem(1,'c_diagegreso1',ds.getitemstring(1,'cripegr1'))
		dw_diags.setitem(1,'c_diagegreso2',ds.getitemstring(1,'cripegr2'))
		dw_diags.setitem(1,'c_diagegreso3',ds.getitemstring(1,'cripegr3'))
		dw_diags.setitem(1,'c_diagcompli',ds.getitemstring(1,'cripcompli'))
		dw_diags.setitem(1,'c_causamuerte',ds.getitemstring(1,'cripmue'))
		dw_diags.setitem(1,'d_incap',ds.getitemnumber(1,'diasincapacidad'))
		dw_diags.setitem(1,'est_sale',ds.getitemstring(1,'estadosalida'))
		dw_diags.setitem(1,'profe',ds.getitemstring(1,'cprof'))
		dw_diags.setitem(1,'acta_defunc',ds.getitemstring(1,'defuncion'))
		dw_diags.setitem(1,'dest_urg',ds.getitemstring(1,'conductaurg'))
		dw_diags.setitem(1,'r_diagegreso',ds.getitemstring(1,'diagegreso'))
		dw_diags.setitem(1,'r_diagegreso1',ds.getitemstring(1,'diagegreso1'))
		dw_diags.setitem(1,'r_diagegreso2',ds.getitemstring(1,'diagegreso2'))
		dw_diags.setitem(1,'r_diagegreso3',ds.getitemstring(1,'diagegreso3'))
		dw_diags.setitem(1,'r_diagcompli',ds.getitemstring(1,'diagcomplica'))
		dw_diags.setitem(1,'r_causamuerte',ds.getitemstring(1,'causamuerte'))
		dw_diags.setitem(1,'d_diagegreso',ds.getitemstring(1,'desdiag'))
		dw_diags.setitem(1,'d_diagegreso1',ds.getitemstring(1,'desdiagegr1'))
		dw_diags.setitem(1,'d_diagegreso2',ds.getitemstring(1,'desdiagegr2'))
		dw_diags.setitem(1,'d_diagegreso3',ds.getitemstring(1,'desdiagegr3'))
		dw_diags.setitem(1,'d_diagcompli',ds.getitemstring(1,'desdiagcompli'))
		dw_diags.setitem(1,'d_causamuerte',ds.getitemstring(1,'desdiagmue'))
		dw_diags.setitem(1,'vigila_diagegreso',ds.getitemnumber(1,'vigila'))
		dw_diags.setitem(1,'vigila_diagegreso1',ds.getitemnumber(1,'vigila_egr1'))
		dw_diags.setitem(1,'vigila_diagegreso2',ds.getitemnumber(1,'vigila_egr2'))
		dw_diags.setitem(1,'vigila_diagegreso3',ds.getitemnumber(1,'vigila_egr3'))
		dw_diags.setitem(1,'vigila_diagcomplica',ds.getitemnumber(1,'vigila_complic'))
		dw_diags.setitem(1,'vigila_causamuerte',ds.getitemnumber(1,'vigila_muerte'))
		dw_diags.setitem(1,'guia',ds.getitemstring(1,'guia'))
		dw_diags.accepttext()
	end if
else //de cons ext/odonto
	ds.dataobject='dw_diags_cext'
	ds.settransobject(sqlca)
	if ds.retrieve(i_contador,i_clug)=0 then goto sale//los r_ son los reales de la BD
	if isnull(ds.getitemstring(1,'diagprin')) or ds.getitemstring(1,'diagprin')='' then
		string ls_cods,ls_desd
		
		if not isnull(dw_diags.getitemstring(1,'dx')) or dw_diags.getitemstring(1,'dx')='' then 
			ls_cods=dw_diags.getitemstring(1,'dx')

			SELECT diags.desdiag into :ls_desd
			FROM diags INNER JOIN diags_version ON diags.c_version = diags_version.c_version
			WHERE (((diags_version.val_hasta)>=getdate()) AND ((diags.codgeral)=:ls_cods));
			
			dw_diags.setitem(1,'r_diagprin',dw_diags.getitemstring(1,'dx'))
			dw_diags.setitem(1,'d_diagprin',ls_desd)
			dw_diags.Modify("r_diagprin.protect=1")
		else
			setnull(ls_cods)
			dw_diags.setitem(1,'r_diagprin',ls_cods)
			dw_diags.setitem(1,'d_diagprin',ls_cods)
			dw_diags.Modify("r_diagprin.protect=0")	
		end if
	else
		dw_diags.setitem(1,'r_diagprin',ds.getitemstring(1,'diagprin'))
		dw_diags.setitem(1,'d_diagprin',ds.getitemstring(1,'desdiagprin'))
		dw_diags.Modify("r_diagprin.protect=0")
	end if
	dw_diags.setitem(1,'r_diagrel1',ds.getitemstring(1,'diagrel1'))
	dw_diags.setitem(1,'r_diagrel2',ds.getitemstring(1,'diagrel2'))
	dw_diags.setitem(1,'r_diagrel3',ds.getitemstring(1,'diagrel3'))
	dw_diags.setitem(1,'r_diagrel4',ds.getitemstring(1,'diagrel4'))
	dw_diags.setitem(1,'r_diagrel5',ds.getitemstring(1,'diagrel5'))
	dw_diags.setitem(1,'r_diagcompli',ds.getitemstring(1,'diagcompli'))
	dw_diags.setitem(1,'tipo_diag',ds.getitemstring(1,'tipodiagprin'))
	
	if not isnull(dw_diags.getitemstring(1,'finconsulta')) then 
		if dw_diags.getitemstring(1,'finconsulta') <>ds.getitemstring(1,'fin_consulta') then
			dw_diags.setitem(1,'finalidad',dw_diags.getitemstring(1,'finconsulta'))
			dw_diags.Modify("finalidad.protect=1")
		else
			dw_diags.setitem(1,'finalidad',ds.getitemstring(1,'fin_consulta'))
			dw_diags.Modify("finalidad.protect=0")
		end if
		f_ubica=idw_finalidad.find("codfin='"+dw_diags.getitemstring(1,'finalidad')+"'",1,idw_finalidad.RowCount())
		idw_finalidad.setrow(f_ubica)
	end if

	if not isnull(dw_diags.getitemstring(1,'causaexterna')) then 
		if dw_diags.getitemstring(1,'causaexterna')<>ds.getitemstring(1,'causaexterna') then 
			dw_diags.setitem(1,'causaext',dw_diags.getitemstring(1,'causaexterna'))
			dw_diags.Modify("causaext.protect=1")
		else
			dw_diags.setitem(1,'causaext',ds.getitemstring(1,'causaexterna'))
			dw_diags.Modify("causaext.protect=0")			
		end if
		f_ubica=idw_causaext.find("codcausaexter='"+dw_diags.getitemstring(1,'causaext')+"'",1, idw_causaext.RowCount())
		idw_causaext.setrow(f_ubica)
	end if
	
	if isnull(ds.getitemstring(1,'cripprin'))	 then 
		dw_diags.setitem(1,'c_diagprin',dw_diags.getitemstring(1,'cod_rips'))
		if not isnull(dw_diags.getitemstring(1,'dx')) then 
			dw_diags.Modify("c_diagprin.protect=1")
		else
			dw_diags.Modify("c_diagprin.protect=0")
		end if
	else
		dw_diags.setitem(1,'c_diagprin',ds.getitemstring(1,'cripprin'))
		dw_diags.Modify("c_diagprin.protect=0")		
	end if
	dw_diags.setitem(1,'c_diagrel1',ds.getitemstring(1,'criprel1'))
	dw_diags.setitem(1,'c_diagrel2',ds.getitemstring(1,'criprel2'))
	dw_diags.setitem(1,'c_diagrel3',ds.getitemstring(1,'criprel3'))
	dw_diags.setitem(1,'c_diagrel4',ds.getitemstring(1,'criprel4'))
	dw_diags.setitem(1,'c_diagrel5',ds.getitemstring(1,'criprel5'))
	dw_diags.setitem(1,'c_diagcompli',ds.getitemstring(1,'cripscompli'))
	dw_diags.setitem(1,'d_diagrel1',ds.getitemstring(1,'desdiagrel1'))
	dw_diags.setitem(1,'d_diagrel2',ds.getitemstring(1,'desdiagrel2'))
	dw_diags.setitem(1,'d_diagrel3',ds.getitemstring(1,'desdiagrel3'))
	dw_diags.setitem(1,'d_diagrel4',ds.getitemstring(1,'desdiagrel4'))
	dw_diags.setitem(1,'d_diagrel5',ds.getitemstring(1,'desdiagrel5'))
	dw_diags.setitem(1,'d_diagcompli',ds.getitemstring(1,'desdiagcompli'))
	dw_diags.setitem(1,'vigila_diagprin',ds.getitemnumber(1,'vigila_diagprin'))
	dw_diags.setitem(1,'vigila_diagrel1',ds.getitemnumber(1,'vigila_rel1'))
	dw_diags.setitem(1,'vigila_diagrel2',ds.getitemnumber(1,'vigila_rel2'))
	dw_diags.setitem(1,'vigila_diagrel3',ds.getitemnumber(1,'vigila_rel3'))
	dw_diags.setitem(1,'vigila_diagrel4',ds.getitemnumber(1,'vigila_rel4'))
	dw_diags.setitem(1,'vigila_diagrel5',ds.getitemnumber(1,'vigila_rel5'))
	dw_diags.setitem(1,'vigila_diagcompli',ds.getitemnumber(1,'vigila_compli'))
	dw_diags.setitem(1,'guia',ds.getitemstring(1,'guia'))
	dw_diags.setitem(1,'cod_modrel',ds.getitemstring(1,'cod_modrel'))			
end if

sale:
destroy(ds)
dw_diags.Modify("r_diagprin.protect=0")
dw_diags.Modify("finalidad.protect=0")
dw_diags.Modify("causaext.protect=0")	
dw_diags.triggerevent (itemfocuschanged!)
dw_diags.resetupdate()

return 1
end function

public subroutine reemp_campo (string p_name_campo, string p_dato);string reemp, rtn

/*if isnull(p_dato) then p_dato=''
reemp=rte_x.InputFieldLocate ( first! , p_name_campo )
do while reemp<>'' and reemp=p_name_campo
	rtn=string(rte_x.InputFieldDeleteCurrent ( ))
	f_pega_a_rtf(rte_x,p_dato,1)
	reemp=rte_x.InputFieldLocate ( next! , p_name_campo )
loop*/
end subroutine

public function integer getdiagrip (string codgeral, ref string cod_rip, ref string descrip, ref string guia);SELECT diags.cod_rips, diags.DesDiag,guia INTO :cod_rip,:descrip,:guia
FROM diags
WHERE diags.CodGeral=:codgeral;
If SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 then
	Return -1
end if
Return 0

end function

public subroutine retrieve (long p_item, string p_tipo, string p_antecedente, string p_codant, string p_alergia, string p_cpo);i_tipo_memo=p_tipo
i_ncampo=p_item
i_antecedente=p_antecedente
i_alergia=p_alergia
i_codant=p_codant
i_cpo=p_cpo

if i_cpo='1' then
	pb_cpo.visible=true
else
	pb_cpo.visible=false
end if
if i_antecedente='1' then
	if i_alergia='1' then 
		pb_antecedente.PictureName='alergia.gif'
	else
		pb_antecedente.PictureName='antecedente.gif'	
	end if
	pb_antecedente.visible=true
else
	pb_antecedente.visible=false
end if
//pb_antecedente.originalsize=true

if p_tipo='D' then //de diags
	pb_cevol.visible=false
	pb_medi.visible=false
	dw_tri.visible=false
	dw_diags.visible=true
	pb_lleva.visible=true
	pb_buscaproc.visible=false
	pb_buscamed.visible=false
	dw_cond.visible=false
	c_ord.visible=false
	pb_kits.visible=false
	pb_1.visible=false
	pb_result.visible=false
	pb_procs.visible=false
	pb_del_proc.visible=false
	pb_tri.visible=false
	pb_urg.visible=false
	pb_guia.visible=true
	dw_diags.resetupdate()
	dw_diags.Modify("r_diagprin.protect=0")
	dw_diags.Modify("finalidad.protect=0")
	dw_diags.Modify("causaext.protect=0")	
elseif p_tipo='C' then //conducta
	pb_cevol.visible=false
	pb_medi.visible=false	
	pb_urg.visible=false
	pb_tri.visible=false
	dw_tri.visible=false
	dw_diags.visible=false
	dw_cond.visible=true
	c_ord.visible=true
     pb_procs.enabled=true
	pb_lleva.visible=false
	pb_buscaproc.visible=true
	pb_buscamed.visible=true
	pb_kits.visible=true
	pb_1.visible=true
	pb_result.visible=false
	pb_procs.visible=false
	pb_del_proc.visible=false
	pb_guia.visible=false
elseif p_tipo='R' or p_tipo='N'  then
	if i_tipo_plant='E'  then
		pb_cevol.visible=true
	else
		pb_cevol.visible=false
	end if
	pb_medi.visible=false	
	pb_urg.visible=false
	pb_tri.visible=false
	dw_tri.visible=false
	dw_diags.visible=false
	dw_cond.visible=false
 	c_ord.visible=FALSE
	pb_lleva.visible=false
	pb_buscaproc.visible=false
	pb_buscamed.visible=false
	pb_kits.visible=false
	pb_1.visible=true
	pb_result.visible=false
	pb_procs.visible=false
	pb_del_proc.visible=false
	pb_guia.visible=false
elseif p_tipo='P' then //procedimientos
	pb_cevol.visible=false	
	pb_medi.visible=false	
	pb_tri.visible=false
	dw_tri.visible=false
	dw_diags.visible=false
	dw_cond.visible=false
	c_ord.visible=FALSE
	pb_lleva.visible=true
	pb_buscaproc.visible=false
	pb_buscamed.visible=false
	pb_kits.visible=false
	pb_1.visible=false
	pb_result.visible=false
	pb_procs.visible=true
	pb_del_proc.visible=true
	pb_guia.visible=false
elseif p_tipo='T' then //triage
	pb_cevol.visible=false
	pb_medi.visible=false	
	pb_tri.visible=true
	dw_tri.visible=true
	dw_diags.visible=false
	dw_cond.visible=false
	c_ord.visible=FALSE
	pb_lleva.visible=false
	pb_buscaproc.visible=false
	pb_buscamed.visible=false
	pb_kits.visible=false
	pb_1.visible=false
	pb_result.visible=false
	pb_procs.visible=false
	pb_del_proc.visible=false
	pb_guia.visible=false
elseif p_tipo='P' then //procedimientos
	pb_cevol.visible=false
	pb_tri.visible=false
	dw_tri.visible=false
	dw_diags.visible=false
	pb_urg.visible=false
	dw_cond.visible=false
	c_ord.enabled=FALSE
	pb_lleva.visible=true
	pb_buscaproc.visible=false
	pb_buscamed.visible=false
	pb_kits.visible=false
	pb_1.visible=false
	pb_result.visible=false
	pb_procs.visible=false
	pb_medi.visible=true
	pb_del_proc.visible=true
	pb_guia.visible=false
else
	pb_cevol.visible=false
	pb_medi.visible=false
	pb_tri.visible=false
	dw_tri.visible=false
	pb_urg.visible=true
	pb_del_proc.visible=false
	dw_diags.visible=false
	dw_cond.visible=false
	c_ord.visible=FALSE
	pb_lleva.visible=false
	pb_buscaproc.visible=false
	pb_buscamed.visible=false
	pb_kits.visible=false
	pb_1.visible=false
	pb_result.visible=false
	pb_procs.visible=false
	pb_guia.visible=false
end if
end subroutine

public subroutine inicia (long p_contador, string p_clug, long p_nreg, string p_cplant, string p_ing, string p_tipo_plant, string p_tingres, singlelineedit p_st, multilineedit a_mle, string p_cemp, string p_ccont, string p_cprof, datawindow p_dw_res, datawindow p_dw_dats, datawindow p_dw_memos, datawindow p_dw_frm, string p_cesp);//Para controlar dobles evoluciones simultaeas
if i_uo_padre.i_control>1 then
  	pb_buscaproc.enabled=FALSE
  	pb_buscamed.enabled=FALSE
  	pb_kits.enabled=FALSE
  	dw_cond.enabled=FALSE
	c_ord.enabled=FALSE
else
	pb_buscaproc.enabled=true
  	pb_buscamed.enabled=true
  	pb_kits.enabled=true
  	dw_cond.enabled=true
  	c_ord.enabled=true
end if

dw_diags.reset()
dw_cond.reset()
dw_cond.insertrow(1)
dw_diags.visible=false
dw_cond.visible=false
i_contador=p_contador
i_clug=p_clug
i_nreg=p_nreg
i_cplant=p_cplant
i_ing=p_ing
i_tipo_plant=p_tipo_plant
i_tingres=p_tingres
i_st=p_st
i_mle=a_mle
i_cemp=p_cemp
i_ccont=p_ccont
i_cprof=p_cprof
i_cesp=p_cesp
idw_results=p_dw_res
if p_tipo_plant='H' and p_ing='I' then
	pb_urg.enabled=true
else
	pb_urg.enabled=false
end if

idw_dats=p_dw_dats
idw_memos=p_dw_memos
idw_frm = p_dw_frm
refresh_diags()
end subroutine

public function integer updaterte ();string  ls_text

ls_text=""

if i_tipo_memo='D' then //diags

	if not isnull(dw_diags.GetItemString(1,"est_sale")) and trim(dw_diags.GetItemString(1,"est_sale"))<>''  then
		
		ls_text+='Estado a la Salida:'+'		'
		if dw_diags.GetItemString(1,"est_sale")='1' then
			ls_text+='Vivo~r~n'
		else
			ls_text+='Muerto~r~n'
		end if

		////COLOCA DX en ANTECENTE
		if dw_diags.GetItemString(1,"antecedente")='1' then
			
			string ls_tpant , ls_dx , ls_codp
			integer li_item
			datetime ld_fechadx
			
			setnull(ls_tpant)
			
			SELECT cod_tipoa into :ls_tpant
			FROM tipo_antecedente
			WHERE (((tipo_antecedente.dx)='1'));
			if not isnull(ls_tpant) then
				ls_dx=dw_diags.GetItemString(1,"c_diagprin")
				setnull(li_item)
				select 1 into :li_item from pacientes_antecedente where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:ls_tpant and dx=:ls_dx;
				if isnull(li_item) then
					setnull(li_item)
					select max(item) into :li_item from pacientes_antecedente where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:ls_tpant;
					if isnull(li_item) then li_item=0
					li_item++
					ld_fechadx=datetime(today(),now())
					INSERT INTO pacientes_antecedente(tipodoc, documento,cod_tipoa,item,fecha,cprof,dx)
					VALUES (:tipdoc,:docu,:ls_tpant,:li_item,:ld_fechadx,:ls_codp=,:ls_dx);
					if sqlca.sqlcode<0 then
						messagebox("Error SQL","Error insertando en pacientes_antecedente")
						rollback;
						return -1
					end if
				end if
			end if
		end if
		////////////////
	end if
	
	if not isnull(dw_diags.GetItemString(1,"profe")) and trim(dw_diags.GetItemString(1,"profe"))<>''  then
		
		ls_text+='Profesional:'+'		'+dw_diags.GetItemString(1,"profe")+' - '
		
		string ls_desprof
		ls_codp=dw_diags.GetItemString(1,"profe")
		if g_motor='postgres' then
			SELECT  nombre1|| case when nombre2  is null then ' ' else  ' '||nombre2||' ' end || apellido1|| case when apellido2 is null then ' ' else  ' '||apellido2 end 
			into :ls_desprof
			FROM profe      
			WHERE ( profe.estado = '1' and profe.codprof = :ls_codp);
		else
			SELECT  nombre1+ case when nombre2  is null then ' ' else  ' '+nombre2+' ' end + apellido1+ case when apellido2 is null then ' ' else  ' '+apellido2 end 
			into :ls_desprof
			FROM profe      
			WHERE ( profe.estado = '1' and profe.codprof = :ls_codp);
		end If
		ls_text+=ls_desprof+'~r~n'
			
	end if
	
	if not isnull(dw_diags.GetItemNumber(1,"d_incap")) and  dw_diags.GetItemNumber(1,"d_incap")>0 then
		
		ls_text+='Días de Incapacidad:'+'		'+string(dw_diags.GetItemNumber(1,"d_incap"))+'~r~n'

	end if

	if not isnull(dw_diags.GetItemString(1,"dest_urg")) and trim(dw_diags.GetItemString(1,"dest_urg"))<>''  then
		
		ls_text+='Conducta de Urgencias:'+'		'+dw_diags.GetItemString(1,"dest_urg")+'  '+idw_desturg.GetItemString(idw_desturg.getrow(),'descripcion')+'~r~n'

	end if
	
	if not isnull(dw_diags.GetItemString(1,"c_diagprin")) and trim(dw_diags.GetItemString(1,"c_diagprin"))<>''  then
		
		ls_text+='Como Diagnóstico Principal:'+'		'+dw_diags.GetItemString(1,"c_diagprin")+'  '+dw_diags.GetItemString(1,"d_diagprin")+'~r~n'

	end if
	
	if not isnull(dw_diags.GetItemString(1,"tipo_diag")) and trim(dw_diags.GetItemString(1,"tipo_diag"))<>''  then
		
		ls_text+='Tipo de Diagnóstico:'+'		'+dw_diags.GetItemString(1,"tipo_diag")+'  '+idw_tipodiag.GetItemString(idw_tipodiag.getrow(),'descripcion')+'~r~n'

	end if
		
	if not isnull(dw_diags.GetItemString(1,"finalidad")) and trim(dw_diags.GetItemString(1,"finalidad"))<>''  then
		
		ls_text+='Finalidad:'+'			'+dw_diags.GetItemString(1,"finalidad")+'  '+idw_finalidad.GetItemString(idw_finalidad.getrow(),"descripcion")+'~r~n'

	end if

	if not isnull(dw_diags.GetItemString(1,"causaext")) and trim(dw_diags.GetItemString(1,"causaext"))<>''  then
		
		ls_text+='Causa Externa:'+'			'+dw_diags.GetItemString(1,"causaext")+'  '+idw_causaext.GetItemString(idw_causaext.getrow(),"descripcion")+'~r~n'

	end if
	
	if not isnull(dw_diags.GetItemString(1,"cod_modrel")) and trim(dw_diags.GetItemString(1,"cod_modrel"))<>''  then
		
		ls_text+='Modo de Realización:'+'		'+dw_diags.GetItemString(1,"cod_modrel")+'  '+idw_modrea.GetItemString(idw_modrea.getrow(),"desp_modrel")+'~r~n'

	end if
	
	if trim(dw_diags.GetItemString(1,"c_diagrel1"))<>'' or trim(dw_diags.GetItemString(1,"c_diagrel2"))<>'' or trim(dw_diags.GetItemString(1,"c_diagrel3"))<>'' or trim(dw_diags.GetItemString(1,"c_diagrel4"))<>'' or trim(dw_diags.GetItemString(1,"c_diagrel5"))<>'' then
		ls_text+='~r~nComo diagnósticos relacionados:~r~n'
		if not isnull(dw_diags.GetItemString(1,"c_diagrel1"))  and trim(dw_diags.GetItemString(1,"c_diagrel1"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagrel1")+' '+dw_diags.GetItemString(1,"d_diagrel1")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagrel2"))  and trim(dw_diags.GetItemString(1,"c_diagrel2"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagrel2")+' '+dw_diags.GetItemString(1,"d_diagrel2")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagrel3"))  and trim(dw_diags.GetItemString(1,"c_diagrel3"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagrel3")+' '+dw_diags.GetItemString(1,"d_diagrel3")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagrel4"))  and trim(dw_diags.GetItemString(1,"c_diagrel4"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagrel4")+' '+dw_diags.GetItemString(1,"d_diagrel4")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagrel5"))  and trim(dw_diags.GetItemString(1,"c_diagrel5"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagrel5")+' '+dw_diags.GetItemString(1,"d_diagrel5")+'~r~n'

		end if
	end if
	
	if trim(dw_diags.GetItemString(1,"c_diagingre"))<>'' or trim(dw_diags.GetItemString(1,"c_diagingre1"))<>'' or trim(dw_diags.GetItemString(1,"c_diagingre3"))<>'' then
		ls_text+='~r~nComo diagnósticos de Ingreso:~r~n'
		if not isnull(dw_diags.GetItemString(1,"c_diagingre"))  and trim(dw_diags.GetItemString(1,"c_diagingre"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagingre")+' '+dw_diags.GetItemString(1,"d_diagingre")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagingre1"))  and trim(dw_diags.GetItemString(1,"c_diagingre1"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagingre1")+' '+dw_diags.GetItemString(1,"d_diagingre1")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagingre2"))  and trim(dw_diags.GetItemString(1,"c_diagingre2"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagingre2")+' '+dw_diags.GetItemString(1,"d_diagingre2")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagingre3"))  and trim(dw_diags.GetItemString(1,"c_diagingre3"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagingre3")+' '+dw_diags.GetItemString(1,"d_diagingre3")+'~r~n'

		end if
	end if
	
	if trim(dw_diags.GetItemString(1,"c_diagegreso"))<>'' or trim(dw_diags.GetItemString(1,"c_diagegreso1"))<>'' or trim(dw_diags.GetItemString(1,"c_diagegreso2"))<>'' or trim(dw_diags.GetItemString(1,"c_diagegreso3"))<>'' then
		ls_text+='~r~nComo diagnósticos de Egreso:~r~n'
		if not isnull(dw_diags.GetItemString(1,"c_diagegreso"))  and trim(dw_diags.GetItemString(1,"c_diagegreso"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagegreso")+' '+dw_diags.GetItemString(1,"d_diagegreso")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagegreso1"))  and trim(dw_diags.GetItemString(1,"c_diagegreso1"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagegreso1")+' '+dw_diags.GetItemString(1,"d_diagegreso1")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagegreso2"))  and trim(dw_diags.GetItemString(1,"c_diagegreso2"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagegreso2")+' '+dw_diags.GetItemString(1,"d_diagegreso2")+'~r~n'

		end if
		if not isnull(dw_diags.GetItemString(1,"c_diagegreso3"))  and trim(dw_diags.GetItemString(1,"c_diagegreso3"))<>'' then
			
			ls_text+=dw_diags.GetItemString(1,"c_diagegreso3")+' '+dw_diags.GetItemString(1,"d_diagegreso3")+'~r~n'

		end if
	end if

	if not isnull(dw_diags.GetItemString(1,"c_diagcomplica")) and trim(dw_diags.GetItemString(1,"c_diagcomplica"))<>''  then
		
		ls_text+='Diagnóstico de Complicación:'+'		'+dw_diags.GetItemString(1,"c_diagcompli")+'  '+dw_diags.GetItemString(1,"d_diagcompli")+'~r~n'

	end if
	
	if not isnull(dw_diags.GetItemString(1,"c_causamuerte")) and trim(dw_diags.GetItemString(1,"c_causamuerte"))<>''  then
		
		ls_text+='Causa de Muerte:'+'		'+dw_diags.GetItemString(1,"c_causamuerte")+'  '+dw_diags.GetItemString(1,"d_causamuerte")+'~r~n'

	end if
	
	if not isnull(dw_diags.GetItemString(1,"acta_defunc"))  and trim(dw_diags.GetItemString(1,"acta_defunc"))<>'' then
		
		ls_text+='Acta de Defunción Nro:'+'	'+dw_diags.GetItemString(1,"acta_defunc")

	end if

elseif i_tipo_memo='P' then //proceds
	long j
	
	if i_uo_padre.dw_procs_new.rowcount()>0 then ls_text="Procedimientos:~r~n"
	
	for j=1 to i_uo_padre.dw_procs_new.rowcount()
		if not isnull(i_uo_padre.dw_procs_new.getitemdatetime(j,'fecha')) 		then ls_text+=string(i_uo_padre.dw_procs_new.getitemdatetime(j,'fecha'),'yyyy/mm/dd HH:mm')+': '
		if not isnull(i_uo_padre.dw_procs_new.getitemstring(j,'cproced')) 		then ls_text+=i_uo_padre.dw_procs_new.getitemstring(j,'cproced')+' - '
		if not isnull(i_uo_padre.dw_procs_new.getitemstring(j,'descripcion')) 	then ls_text+=i_uo_padre.dw_procs_new.getitemstring(j,'descripcion')+', '
		if not isnull(i_uo_padre.dw_procs_new.getitemstring(j,'codrip_prin')) 	then ls_text+='Diag. Princ: '+i_uo_padre.dw_procs_new.getitemstring(j,'codrip_prin')+''
		ls_text+='~r~n'
	next
	
end if

f_pega_a_mle(i_mle,ls_text,3)
i_mle.displayonly=false
i_uo_padre.i_cambia=true
Return 0

end function

on uo_barra_hc.create
this.pb_buscaproc=create pb_buscaproc
this.pb_buscamed=create pb_buscamed
this.dw_cond=create dw_cond
this.pb_kits=create pb_kits
this.pb_result=create pb_result
this.pb_del_proc=create pb_del_proc
this.pb_urg=create pb_urg
this.pb_procs=create pb_procs
this.pb_cpo=create pb_cpo
this.pb_guia=create pb_guia
this.c_ord=create c_ord
this.pb_cevol=create pb_cevol
this.dw_diags=create dw_diags
this.pb_lleva=create pb_lleva
this.pb_medi=create pb_medi
this.pb_save=create pb_save
this.pb_antecedente=create pb_antecedente
this.dw_tri=create dw_tri
this.pb_tri=create pb_tri
this.pb_1=create pb_1
this.Control[]={this.pb_buscaproc,&
this.pb_buscamed,&
this.dw_cond,&
this.pb_kits,&
this.pb_result,&
this.pb_del_proc,&
this.pb_urg,&
this.pb_procs,&
this.pb_cpo,&
this.pb_guia,&
this.c_ord,&
this.pb_cevol,&
this.dw_diags,&
this.pb_lleva,&
this.pb_medi,&
this.pb_save,&
this.pb_antecedente,&
this.dw_tri,&
this.pb_tri,&
this.pb_1}
end on

on uo_barra_hc.destroy
destroy(this.pb_buscaproc)
destroy(this.pb_buscamed)
destroy(this.dw_cond)
destroy(this.pb_kits)
destroy(this.pb_result)
destroy(this.pb_del_proc)
destroy(this.pb_urg)
destroy(this.pb_procs)
destroy(this.pb_cpo)
destroy(this.pb_guia)
destroy(this.c_ord)
destroy(this.pb_cevol)
destroy(this.dw_diags)
destroy(this.pb_lleva)
destroy(this.pb_medi)
destroy(this.pb_save)
destroy(this.pb_antecedente)
destroy(this.dw_tri)
destroy(this.pb_tri)
destroy(this.pb_1)
end on

event constructor;i_uo_padre=parent
RegistryGet( "HKEY_CLASSES_ROOT\.pdf", "", RegString!, ls_tipo)
if isNull(ls_tipo) or ls_tipo = '' then return 0
RegistryGet( "HKEY_CLASSES_ROOT\"+ls_tipo+"\shell\open\command", "", RegString!, is_pdf)


end event

type pb_buscaproc from picturebutton within uo_barra_hc
boolean visible = false
integer x = 910
integer y = 28
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "bisturi busca.gif"
alignment htextalign = left!
string powertiptext = "Buscar Procedimientos"
end type

event clicked;str_proc st_pr
st_pa_proc str_proc

str_proc.dw=dw_cond
str_proc.emp=i_cemp
str_proc.cont=i_ccont
str_proc.campo='cproc'
str_proc.t_ingreso=i_tingres

openwithparm(w_busca_proc,str_proc)
st_pr = Message.PowerObjectParm
if not isValid(st_pr) then Return -1
dw_cond.setItem(1,'codproced',st_pr.cproc)
dw_cond.setItem(1,'desproced',st_pr.descripcion)
dw_cond.SetColumn('cproc')
dw_cond.setItem(1,'tiporep','E')
dw_cond.setItem(1,'cantk',1)
TriggerEvent(itemchanged!)
dw_cond.setItem(1,'cantidad',1)
dw_cond.setItem(1,'codproced','')
dw_cond.setItem(1,'desproced','')


end event

type pb_buscamed from picturebutton within uo_barra_hc
boolean visible = false
integer x = 1495
integer y = 24
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "capsula busca.gif"
alignment htextalign = left!
string powertiptext = "Buscar Medicamento"
end type

event clicked;st_med st_med
st_pa_medica st_m

//st_med.sle=''
st_m.origen=i_tingres
st_m.cant=dw_cond.getitemnumber(1,'cantidad')
openwithparm(w_busca_med,st_m)
st_med = Message.PowerObjectParm
if not isValid(st_med) then Return -1
dw_cond.setItem(1,'cmedica',st_med.cmedica)
dw_cond.setItem(1,'medicamento',st_med.medicamento)
dw_cond.SetColumn('cmedica')
dw_cond.setItem(1,'tiporep','E')
dw_cond.setItem(1,'frecuen','')
dw_cond.setItem(1,'administracion','')
dw_cond.setItem(1,'cantk',1)
dw_cond.TriggerEvent(itemchanged!)
dw_cond.setItem(1,'cmedica','')
dw_cond.setItem(1,'medicamento','')
dw_cond.setItem(1,'cantidad',1)
end event

type dw_cond from datawindow within uo_barra_hc
event key pbm_dwnkey
boolean visible = false
integer x = 631
integer y = 28
integer width = 1659
integer height = 124
integer taborder = 20
string title = "none"
string dataobject = "dw_hcliin_conducta"
boolean border = false
boolean livescroll = true
end type

event key;//if key=i_uo_padre.i_nextitem or key=i_uo_padre.i_previtem or key=i_uo_padre.i_nextchild then parent.event navegar(key)
if key=i_nextitem or key=i_previtem or key=i_nextchild then parent.event navegar(key)
end event

event constructor;insertrow(1)
end event

event itemchanged;string diagn,colum,este='',nulo, campo, sexo, texto, txt_frm,si_kit,ls_reg,ls_despr,ls_deses
blob memo
long f,l_lleva

str_proc st_p
st_med st_med
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
setnull(nulo)
setnull(si_kit)
setnull(st_med.cmedica)
setnull(st_med.medicamento)
setnull(st_med.formaf)
setnull(st_med.pos)
setnull(st_med.via)
setnull(st_med.frecuen)
setnull(st_med.admon)
setnull(st_med.dosis)
setnull(texto_np)
si_kit='0'
colum = getcolumnname()
setitem(getRow(),'tiporep','E')

if i_uo_padre.i_modo = 'A' then //arbol
	if pos(i_mle.text, "ORDENES MEDICAS") = 0 then
		texto = string(today()) + '  '+string(Now())+ " ORDENES MEDICAS "
		txt_frm = texto
		f_pega_a_mle(i_mle,texto,3)
	end if
else
	txt_frm = idw_frm.GetItemString(1, idw_frm.GetColumn())
	if isNull(txt_frm) then txt_frm = ''
	if pos(txt_frm,'ORDENES MEDICAS') = 0 then 
		txt_frm = string(today()) +' '+ string(Now())+ " ORDENES MEDICAS~r~n"
	end if
end if
choose case colum
	case "cantidad"
		accepttext()
		if long(data)>99 then
			if messagebox('Atención','La cantidad es superior a 99 desea continuar aún así?',question!,yesno!,2)=2 then
				setitem(row,'cantidad',1)
				return 2
			end if
		end if
	case "cproc"
		if data="" then return
		if isnull(data) and not isnull(getitemstring(getrow(),colum)) then data=getitemstring(getrow(),colum)
		if w_principal.dw_1.getitemstring(1,"sexo")='F' then sexo='2'
		if w_principal.dw_1.getitemstring(1,"sexo")='M' then sexo='1'
		st_p = f_busca_cups(data,sexo,w_principal.dw_1.getitemnumber(1,'dias'),'1')
		if isNull(st_p.cproc) or  st_p.cproc='' then
			setitem(getrow(),'cproc','')
			Settext('')
			Return 2
		else
			setitem(getRow(),'desproced',st_p.descripcion)
			i_st.text = st_p.descripcion
			AcceptText()
			st_p.cproc = GetItemString(getrow(),'cproc')
			st_p.descripcion = GetItemString(getrow(),'desproced')
			l_lleva=f_enlaza_ordenes(st_p.cproc,'P',st_p.agrupser)
			if l_lleva>0 then
				texto =  ' Cantidad:( '+ string(GetItemNumber(GetRow(),'cantidad')) +')'
				if isNull(texto) or texto = '' then Texto = '1'
				if isnull(texto_np) then texto_np=''
				texto = "~r~n"+"▪ "+st_p.descripcion+ texto+texto_np
				txt_frm = txt_frm + texto
				if i_uo_padre.i_modo = 'A' then
					f_pega_a_mle(i_mle,texto,2)
				end if 
				setnull(texto_np)
			end if
			//Parent.Post Event chconducta(GetItemNumber(getrow(),'cantidad'), st_p, st_med)
		end if
	case "cmedica"
		g_formula=true
		if data="" then return
		if isnull(data) and not isnull(getitemstring(getrow(),colum)) then 
			data=getitemstring(getrow(),colum)
			st_med.frecuen=getitemstring(getrow(),'frecuen')
			st_med.admon=getitemstring(getrow(),'administracion')
			st_med.dosis=getitemnumber(getrow(),'dosis')
			si_kit='1'
		else
			if not	isnull(getitemstring(getrow(),'administracion')) then
				data=getitemstring(getrow(),colum)
				st_med.frecuen=getitemstring(getrow(),'frecuen')
				st_med.admon=getitemstring(getrow(),'administracion')
				st_med.dosis=getitemnumber(getrow(),'dosis')
			end if
			si_kit='1'
		end if
		SELECT c_medica, medicamento,peso,volumen
		into :st_med.cmedica,:st_med.medicamento,:st_med.peso ,:st_med.volumen
		FROM medicamentos
		where c_medica= :data and medicamentos.estado='1';
		if SQLCA.SQLCode = 100 then
			MessageBox('Error','El medicamento no existe')
			SetItem(getrow(),'cmedica','')
			Settext('')
			Return 2
		end if
		texto=string(st_med.peso)
		if isnull(st_med.admon) or st_med.admon='' then st_med.admon=texto
		setnull(texto)
		setitem(getRow(),'cmedica',st_med.cmedica)
		setitem(getRow(),'medicamento',st_med.medicamento)
		setitem(getRow(),'administracion',st_med.admon)
		setitem(getRow(),'dosis',st_med.dosis)
		i_st.Text = st_med.medicamento
		AcceptText()
			
		if f_enlaza_ordenes(st_med.cmedica,'M',si_kit)<>-1 then 
			texto =  ' Cantidad:('+ string(GetItemNumber(GetRow(),'cantidad')) +')'
			if isNull(texto) or texto = '' then Texto = '1'
			if isNull(texto_np) or texto_np = '' then texto_np = ' '
			texto ='~r~n'+ "▪ "+st_med.medicamento+texto+texto_np
			txt_frm = txt_frm + texto
			if i_uo_padre.i_modo = 'A' then
				f_pega_a_mle(i_mle,texto,2)
			end if
		end if
end choose
if i_uo_padre.i_modo = 'F' then
	idw_frm.SetItem(1, idw_frm.GetColumn(), txt_frm)
end if
texto_np=''
i_uo_padre.i_cambia = TRUE

end event

type pb_kits from picturebutton within uo_barra_hc
event mousemove pbm_mousemove
boolean visible = false
integer x = 2112
integer y = 28
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
boolean originalsize = true
string picturename = "kits.gif"
string disabledname = "d_kits.gif"
alignment htextalign = left!
string powertiptext = "Kits"
end type

event clicked;st_proc_comun st_pc
st_pc.mle = i_mle
st_pc.dw_conducta = dw_cond
st_pc.carreta='1'
//openwithparm(w_kit_viejo,st_pc)
openwithparm(w_kit_new,st_pc)

end event

type pb_result from picturebutton within uo_barra_hc
boolean visible = false
integer x = 457
integer y = 32
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Revisar y traer resultados desde ApDx"
end type

event clicked;if i_uo_padre.dw_1.rowcount()=0 or i_uo_padre.dw_new.rowcount()=0 then return
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
st_xa_result st
st.dw_results=idw_results
if i_uo_padre.i_modo = 'A' then
	st.nitem=i_uo_padre.dw_new.getitemnumber(i_uo_padre.dw_new.getrow(),'numcampo')
else
	st.nitem = long(idw_frm.Describe(idw_frm.GetColumnName()+'.tag'))
end if
long cuantos
cuantos=idw_results.rowcount() + idw_results.filteredcount()
st.tingres=i_tingres
st.contador=i_contador
st.clugar=i_clug
openwithparm(w_lleva_resul_cons,st)
if cuantos<>idw_results.rowcount() + idw_results.filteredcount() then
	i_uo_padre.i_cambia=true
	i_uo_padre.dw_new.event rowfocuschanged(i_uo_padre.dw_new.getrow())
end if

end event

type pb_del_proc from picturebutton within uo_barra_hc
boolean visible = false
integer x = 457
integer y = 32
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar procedimiento"
end type

event clicked;if i_uo_padre.dw_1.rowcount()=0 or i_uo_padre.dw_new.rowcount()=0 then return
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
i_uo_padre.dw_procs_new.deleterow(0)
end event

type pb_urg from picturebutton within uo_barra_hc
integer x = 9
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "import.gif"
string disabledname = "d_import.gif"
alignment htextalign = left!
string powertiptext = "Traer datos de urgencia pasada"
end type

event clicked;if i_uo_padre.dw_1.rowcount()=0 or i_uo_padre.dw_new.rowcount()=0 then return
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
st_copiar_urg st
st.cplant=i_cplant
st.dw_memos=idw_memos
st.dw_datos=idw_dats
st.dw_frm = idw_frm
openwithparm(w_copiar_urg,st)
if message.stringparm='ok' then i_uo_padre.i_cambia=true
i_uo_padre.dw_new.event rowfocuschanged(i_uo_padre.dw_new.getrow())

end event

type pb_procs from picturebutton within uo_barra_hc
integer x = 9
integer y = 32
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ordenes.gif"
string disabledname = "d_ordenes.gif"
alignment htextalign = left!
string powertiptext = "Traer procedimientos desde Ordenes de Serv para atender"
end type

event clicked;if i_uo_padre.dw_1.rowcount()=0 or i_uo_padre.dw_new.rowcount()=0 then return
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
st_xa_procs_hc st
st.contador=i_contador
st.clug=i_clug
st.ncampo=i_ncampo
st.cesp=i_cesp
st.cprof=i_cprof
st.tingres=i_tingres
st.dw_procs=i_uo_padre.dw_procs_new
st.cemp=i_cemp
st.ccont=i_ccont
st.fecha=datetime(i_uo_padre.em_1.text)
openwithparm(w_baja_procs,st)
if i_uo_padre.dw_procs_new.rowcount()>0 then i_uo_padre.i_cambia=true
end event

event constructor;//y=4
end event

type pb_cpo from picturebutton within uo_barra_hc
boolean visible = false
integer x = 457
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
string picturename = "cuerpo.gif"
string disabledname = "d_cuerpo.gif"
alignment htextalign = left!
string powertiptext = "Corpograma"
end type

event clicked;if i_uo_padre.dw_1.rowcount()=0 or i_uo_padre.dw_new.rowcount()=0 then return
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
dw_cond.reset()
st_xa_procs_hc st
st.contador=i_contador
st.clug=i_clug
st.cesp=i_cesp
st.cprof=i_cprof
st.tingres=i_tingres
st.dw_procs=dw_cond
st.cemp=i_cemp
st.ccont=i_ccont
st.fecha=datetime(i_uo_padre.em_1.text)
openwithparm(w_corpograma,st)

end event

type pb_guia from picturebutton within uo_barra_hc
boolean visible = false
integer x = 9
integer y = 32
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "dcontrato.gif"
alignment htextalign = left!
string powertiptext = "Ver Guia"
end type

event clicked;if len(is_pdf) = 0 then
	messageBox('Atención','No tiene visor de pdf instalado')
	return 0
end if
long p

string ls_exec
p = pos(is_pdf,'%1')
ls_exec = replace(is_pdf,p,2,is_guia)
run(ls_exec)
end event

type c_ord from picturebutton within uo_barra_hc
boolean visible = false
integer x = 9
integer y = 32
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "copia_orden.gif"
string disabledname = "d_copia_orden.gif"
alignment htextalign = left!
string powertiptext = "Copia Ordenes"
end type

event clicked;if i_uo_padre.dw_1.rowcount()=0 or i_uo_padre.dw_new.rowcount()=0 then return
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
dw_cond.reset()
st_xa_procs_hc st
st.contador=i_contador
st.clug=i_clug
st.cesp=i_cesp
st.cprof=i_cprof
st.tingres=i_tingres
st.dw_procs=dw_cond
st.cemp=i_cemp
st.ccont=i_ccont
st.fecha=datetime(i_uo_padre.em_1.text)
openwithparm(w_copiar_orden,st)
st=message.powerobjectparm
if isvalid(st) then
	int l_i
	for l_i=1	 to dw_cond.rowcount()
		dw_cond.setcolumn(2)
		dw_cond.SetRow(l_i)
		dw_cond.event itemchanged(l_i,dw_cond.object.cmedica,dw_cond.getitemstring(l_i,'cmedica'))
	next
	 i_uo_padre.i_cambia=true
end if
dw_cond.reset()
dw_cond.insertrow(1)

end event

type pb_cevol from picturebutton within uo_barra_hc
boolean visible = false
integer x = 5
integer y = 32
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "copi_evol.gif"
alignment htextalign = left!
string powertiptext = "Copia ultima"
end type

event clicked;
st_xa_procs_hc st_memo

st_memo.contador=i_contador
st_memo.clug=i_clug
st_memo.cesp=i_cesp
st_memo.cprof=i_cprof
st_memo.tingres=i_cplant
st_memo.ncampo=i_ncampo
openwithparm(w_copiar_hc_memo,st_memo)
st_memo=message.powerobjectparm
if isvalid(st_memo) then
	f_pega_a_mle( i_mle,string(st_memo.cemp),3)
	 i_mle.selectText(1,9999999)
	 i_mle.Copy()
end if
	
end event

type dw_diags from datawindow within uo_barra_hc
event mousemove pbm_dwnmousemove
event key pbm_dwnkey
event p_itemchanged ( )
integer x = 457
integer width = 3986
integer height = 208
integer taborder = 20
boolean bringtotop = true
string title = "dw_datos_diag_sal"
string dataobject = "dw_datos_diag_sal"
boolean border = false
end type

event key;if key=i_nextitem or key=i_previtem or key=i_nextchild then parent.event navegar(key)
end event

event p_itemchanged();this.accepttext()
end event

event retrieveend;if rowcount()=0 then return
//long suma=151,corre=24
long suma=37,corre=24

if getitemstring(1,'v_diagprin')='1' then
	suma += long(describe('c_diagprin.width'))+corre
	modify('tipo_diag.x='+string(suma))
	modify('t_tipo_diag.x='+string(suma))
	suma += long(describe('tipo_diag.width'))+corre
	modify('finalidad.x='+string(suma))
	modify('t_finalidad.x='+string(suma))
	suma += long(describe('finalidad.width'))+corre
	modify('causaext.x='+string(suma))
	modify('t_causaext.x='+string(suma))
	suma += long(describe('causaext.width'))+corre
	modify('cod_modrel.x='+string(suma))
	modify('t_modrel.x='+string(suma))	
	suma += long(describe('cod_modrel.width'))+corre			
end if
if getitemstring(1,'v_diagrel1')='1' then
	modify('c_diagrel1.x='+string(suma))
	modify('t_diagrel1.x='+string(suma))
	suma += long(describe('c_diagrel1.width'))+corre
end if
if getitemstring(1,'v_diagrel2')='1' then
	modify('c_diagrel2.x='+string(suma))
	modify('t_diagrel2.x='+string(suma))
	suma += long(describe('c_diagrel2.width'))+corre
end if
if getitemstring(1,'v_diagrel3')='1' then
	modify('c_diagrel3.x='+string(suma))
	modify('t_diagrel3.x='+string(suma))
	suma += long(describe('c_diagrel3.width'))+corre
end if
if getitemstring(1,'v_diagrel4')='1' then
	modify('c_diagrel4.x='+string(suma))
	modify('t_diagrel4.x='+string(suma))
	suma += long(describe('c_diagrel4.width'))+corre
end if
if getitemstring(1,'v_diagrel5')='1' then
	modify('c_diagrel5.x='+string(suma))
	modify('t_diagrel5.x='+string(suma))
	suma += long(describe('c_diagrel5.width'))+corre
end if
if getitemstring(1,'v_diagcompli')='1' then
	modify('c_diagcompli.x='+string(suma))
	modify('t_diagcompli.x='+string(suma))
	suma += long(describe('c_diagcompli.width'))+corre
end if
if getitemstring(1,'v_diagingre')='1' then
	suma += long(describe('c_diagingre.width'))+corre
	modify('tipo_diag.x='+string(suma))
	modify('t_tipo_diag.x='+string(suma))
	suma += long(describe('tipo_diag.width'))+corre
	modify('finalidad.x='+string(suma))
	modify('t_finalidad.x='+string(suma))
	suma += long(describe('finalidad.width'))+corre
	modify('causaext.x='+string(suma))
	modify('t_causaext.x='+string(suma))
	suma += long(describe('causaext.width'))+corre
	modify('cod_modrel.x='+string(suma))
	modify('t_modrel.x='+string(suma))	
	suma += long(describe('cod_modrel.width'))+corre		
end if
if getitemstring(1,'v_diagingre1')='1' then
	modify('c_diagingre1.x='+string(suma))
	modify('t_diagingre1.x='+string(suma))
	suma += long(describe('c_diagingre1.width'))+corre
end if
if getitemstring(1,'v_diagingre2')='1' then
	modify('c_diagingre2.x='+string(suma))
	modify('t_diagingre2.x='+string(suma))
	suma += long(describe('c_diagingre2.width'))+corre
end if
if getitemstring(1,'v_diagingre3')='1' then
	modify('c_diagingre3.x='+string(suma))
	modify('t_diagingre3.x='+string(suma))
	suma += long(describe('c_diagingre3.width'))+corre
end if

if getitemstring(1,'v_diagegreso')='1' then
	modify('c_diagegreso.x='+string(suma))
	modify('t_diagegreso.x='+string(suma))
	suma += long(describe('c_diagegreso.width'))+corre
end if
if getitemstring(1,'v_diagegreso1')='1' then
	modify('c_diagegreso1.x='+string(suma))
	modify('t_diagegreso1.x='+string(suma))
	suma += long(describe('c_diagegreso1.width'))+corre
end if
if getitemstring(1,'v_diagegreso2')='1' then
	modify('c_diagegreso2.x='+string(suma))
	modify('t_diagegreso2.x='+string(suma))
	suma += long(describe('c_diagegreso2.width'))+corre
end if
if getitemstring(1,'v_diagegreso3')='1' then
	modify('c_diagegreso3.x='+string(suma))
	modify('t_diagegreso3.x='+string(suma))
	suma += long(describe('c_diagegreso3.width'))+corre
end if
if getitemstring(1,'v_diagcomplica')='1' then
	modify('c_diagcomplica.x='+string(suma))
	modify('t_diagcomplica.x='+string(suma))
	suma += long(describe('c_diagcomplica.width'))+corre
end if
modify('c_causamuerte.x='+string(suma))
modify('t_causamuerte.x='+string(suma))
suma += long(describe('c_causamuerte.width'))+corre
suma += long(describe('c_causamuerte.width'))+corre

modify('d_incap.x='+string(suma))
modify('t_incap.x='+string(suma))
suma += long(describe('d_incap.width'))+corre
modify('est_sale.x='+string(suma))
modify('t_est_sale.x='+string(suma))
suma += long(describe('est_sale.width'))+corre
modify('acta_defunc.x='+string(suma))
modify('t_acta_defunc.x='+string(suma))
modify('profe.x='+string(suma))
modify('t_profe.x='+string(suma))
suma += long(describe('profe.width'))+corre
modify('dest_urg.x='+string(suma))
modify('t_dest_urg.x='+string(suma))
suma += long(describe('dest_urg.width'))+corre

end event

event constructor;settransobject(sqlca)
getchild('tipo_diag',idw_tipodiag)
idw_tipodiag.settransobject(sqlca)
getchild('profe',idw_profe)
idw_profe.settransobject(sqlca)
getchild('dest_urg',idw_desturg)
idw_desturg.settransobject(sqlca)
getchild('finalidad',idw_finalidad)
idw_finalidad.settransobject(sqlca)
getchild('causaext',idw_causaext)
idw_causaext.settransobject(sqlca)
getchild('finconsulta',idw_fincon)
idw_fincon.settransobject(sqlca)
getchild('cod_modrel',idw_modrea)
idw_modrea.settransobject(sqlca)

string ls_sex
int li_dias
li_dias=w_principal.dw_1.getitemnumber(1,'dias')
if w_principal.dw_1.getitemstring(1,'sexo')="F" then ls_sex='2'
if w_principal.dw_1.getitemstring(1,'sexo')="M" then ls_sex='1'
idw_fincon.setfilter(" indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
idw_fincon.filter()


end event

event itemchanged;string nulo
setnull(nulo)
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return 2
end if
int veri

choose case dwo.name	
	case 'finalidad'
		if (data>='01' and data<= '08') then 
			this.setitem(row,'causaext',"15")
		else
			this.setitem(row,'causaext',nulo)
		end if 
		this.accepttext()
		veri=f_valida_fin_con(this.getitemstring(row,'finalidad'),this.getitemstring(row,'causaext'),w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),this.getitemstring(row,'r_diagprin'))
		if veri=-1 then
			this.setitem(row,'finalidad',nulo)
			this.setitem(row,'causaext',nulo)
			this.accepttext()
			return 2
		end if

	case 'causaext'
		this.accepttext()
		veri=f_valida_fin_con(this.getitemstring(row,'finalidad'),this.getitemstring(row,'causaext'),w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),this.getitemstring(row,'r_diagprin'))
		if veri=-1 then
			this.setitem(row,'causaext',nulo)
			this.accepttext()
			return 2
		end if

	case 'c_diagprin','c_diagrel1','c_diagrel2','c_diagrel3','c_diagrel4','c_diagrel5','c_diagcompli','c_diagingre1','c_diagingre2','c_diagingre3','c_diagingre','c_diagegreso','c_diagegreso1','c_diagegreso2','c_diagegreso3','c_diagcomplica','c_causamuerte'
		st_return_diags st
		long nnul
		setnull(nnul)
		setnull(nulo)
		if trim(data)="" then 
			setitem(1,dwo.name,nulo)
			return
		end if
		sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
		edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
		st=f_check_diag2(data,sex_busca,edad_busca)
		if st.descrip_diag="" then
			setitem(1,dwo.name,nulo)
			setitem(1,"r_"+mid(dwo.name,3),'')
			setitem(1,"d_"+mid(dwo.name,3),'')
			setitem(1,"vigila_"+mid(dwo.name,3),nnul)
			setnull(is_guia)
			return 2
		else
			accepttext()
			setitem(1,"r_"+mid(dwo.name,3),st.codgeral)
			setitem(1,"d_"+mid(dwo.name,3),st.descrip_diag)
			setitem(1,"vigila_"+mid(dwo.name,3),st.vigila)
			setitem(1,"vigila_plantilla",st.plantilla)
			is_guia=st.guia
			i_st.text=st.descrip_diag
			i_uo_padre.i_cambia=true
		end if
		
	case 'est_sale'
		if data='1' then
			if isnull(getitemstring(1,'profe')) or trim(getitemstring(1,'profe'))='' then 
				setitem(1,'profe',i_cprof)
				idw_profe.scrolltorow(idw_profe.find('codprof="'+i_cprof+'"',1,idw_profe.rowcount()))
			end if
		end if
end choose
post event p_itemchanged()
end event

event itemfocuschanged;string cual
if not isvalid(i_st) then return
if isnull(dwo) then
	cual=getcolumnName()
else
	cual=dwo.name
end if
choose case cual
	case 'c_diagprin','c_diagrel1','c_diagrel2','c_diagrel3','c_diagrel4','c_diagrel5','c_diagcompli','c_diagingre1','c_diagingre2','c_diagingre3','c_diagingre','c_diagegreso','c_diagegreso1','c_diagegreso2','c_diagegreso3','c_diagcomplica','c_causamuerte'
		if getitemstring(1,string(cual))<>'' and not isnull(getitemstring(1,string(cual))) then
			i_st.text=getitemstring(1,'d_'+mid(string(cual),3))
		else
			i_st.text=''
		end if
	case else
		i_st.text=''
end choose
post event p_itemchanged()
end event

event doubleclicked;choose case dwo.name
	case 'c_diagprin','c_diagrel1','c_diagrel2','c_diagrel3','c_diagrel4','c_diagrel5','c_diagcompli','c_diagingre1','c_diagingre2','c_diagingre3','c_diagingre','c_diagegreso','c_diagegreso1','c_diagegreso2','c_diagegreso3','c_diagcomplica','c_causamuerte'
		if getcolumnname()<>dwo.name then return //porque a veces si están bloqueados entra
		st_edadsexo st_es
		st_es.edad=w_principal.dw_1.getitemnumber(1,'dias')
		st_es.sexo=w_principal.dw_1.getitemstring(1,'sexo')
		st_es.antece='0'
		openwithparm(w_busca_diag,st_es)
		st_diag st_diag
		st_diag=message.powerobjectparm
		if not isvalid(st_diag) then return
		setitem(1,"r_"+mid(dwo.name,3),st_diag.codgeral)
		setitem(1,"c_"+mid(dwo.name,3),st_diag.codrip)
		setitem(1,"d_"+mid(dwo.name,3),st_diag.descripcion)
		setitem(1,"antecedente",st_diag.antecedente)		
		i_st.text=st_diag.descripcion
		i_uo_padre.i_cambia=true
end choose
end event

event rowfocuschanged;post event p_itemchanged()

end event

type pb_lleva from picturebutton within uo_barra_hc
boolean visible = false
integer x = 315
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
string picturename = "editar_borrar.gif"
string disabledname = "d_editar_borrar.gif"
alignment htextalign = left!
string powertiptext = "Colocar plantilla y datos de Diags."
end type

event clicked;
UpdateRTE()

idw_frm.setitem(idw_frm.getrow(),'memo_'+string(i_ncampo),i_mle.text)	


end event

type pb_medi from picturebutton within uo_barra_hc
boolean visible = false
integer x = 315
integer y = 32
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "anestesia.gif"
string disabledname = "d_anestesia.gif"
alignment htextalign = left!
string powertiptext = "Atender Anestesia"
end type

event clicked;if i_uo_padre.dw_1.rowcount()=0 or i_uo_padre.dw_new.rowcount()=0 then return
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
st_xa_procs_hc st
st.contador=i_contador
st.clug=i_clug
st.ncampo=i_ncampo
st.cesp=i_cesp
st.cprof=i_cprof
st.tingres=i_tingres
//st.dw_procs=i_uo_padre.dw_procs_form
st.cemp=i_cemp
st.ccont=i_ccont
st.fecha=datetime(i_uo_padre.em_1.text)
openwithparm(w_baja_medi,st)
if i_uo_padre.dw_procs_new.rowcount()>0 then i_uo_padre.i_cambia=true
end event

type pb_save from picturebutton within uo_barra_hc
integer x = 160
integer y = 32
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar cambios de Historia"
end type

event clicked;if pos('2347T',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
if i_uo_padre.i_ptipo='H' and i_uo_padre.i_pingsal='I' then
	int totales		
	select count(hospprimerorden.tipo) into :totales
	from hospprimerorden
	where (((hospprimerorden.tingre)=:i_uo_padre.i_tingre) and ((hospprimerorden.codplantilla)=:i_cplant));
	if totales>0 then 
		setnull(totales)
		select count(oscabeza.nsolicitud)into :totales
		from oscabeza
		group by oscabeza.contador, oscabeza.clugar
		having (((oscabeza.contador)=:i_contador) and ((oscabeza.clugar)=:i_clug));
		if isnull(totales) or totales=0 then
			i_uo_padre.ipb_new_orden.tag=i_cplant
			if i_uo_padre.ipb_new_orden.event clicked()=-1 then
				i_uo_padre.i_pudo_orden=false
				return -1
			end if
		end if
	end if
end if
if i_uo_padre.grabar()=-1 then
	sqlca.autocommit=false
	rollback;
else
	sqlca.autocommit=false
	commit;
end if
end event

type pb_antecedente from picturebutton within uo_barra_hc
boolean visible = false
integer x = 457
integer y = 32
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antecedente.gif"
alignment htextalign = left!
string powertiptext = "Verifica Antecedentes del Paciente"
end type

event clicked;st_rte st
st.c_prof = i_cprof
st.mle = i_mle
st.dw_pac = w_principal.dw_1
st.codplantilla=i_cplant
st.numcampo=i_ncampo
st.ventana = i_uo_padre.i_modo
st.c_otro=i_codant
st.dw_data = idw_frm
if i_alergia='1' then 
	openwithparm(w_alergias_paciente,st)
else
	openwithparm(w_antecedentes_paciente,st)
end if
end event

type dw_tri from datawindow within uo_barra_hc
event key pbm_dwnkey
boolean visible = false
integer x = 645
integer width = 4032
integer height = 292
integer taborder = 60
string title = "none"
string dataobject = "dw_triage_resu"
boolean border = false
end type

event key;//if key=i_uo_padre.i_nextitem or key=i_uo_padre.i_previtem or key=i_uo_padre.i_nextchild then parent.event navegar(key)
if key=i_nextitem or key=i_previtem or key=i_nextchild then parent.event navegar(key)
end event

event constructor;settransobject(sqlca)
end event

type pb_tri from picturebutton within uo_barra_hc
boolean visible = false
integer x = 315
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Colocar datos de Triage en Historia"
end type

event clicked;if ( (not isnull(dw_tri.getitemnumber(1,'m'))) or (not isnull(dw_tri.getitemnumber(1,'o'))) or (not isnull(dw_tri.getitemnumber(1,'v'))) ) and (isnull(dw_tri.getitemnumber(1,'total'))) then
	messagebox('Atención','Debe completar los datos de la escala de Glasgow')
	return 
end if

string carreta,tab,triag,descrip
dw_tri.setitem(1,'triage_hc','1')

if not isnull(dw_tri.getitemstring(1,'signos')) then
	if dw_tri.getitemstring(1,'signos')='0' then 	carreta+='SIN SIGNOS VITALES'
	tab='~n~r'
end if
if dw_tri.getitemnumber(1,'ta_sis')<>0 and not isnull(dw_tri.getitemnumber(1,'ta_sis')) then
	carreta+='T.A. SISTOLICA:'+string(dw_tri.getitemnumber(1,'ta_sis')) +'	'+' T.A. DIASTOLICA:'+string(dw_tri.getitemnumber(1,'ta_dia')) +'	'+'T.A. MEDIA:'+string(dw_tri.getitemnumber(1,'ta_med'),'0.00') 
	tab='~n~r'
end if
if not isnull(dw_tri.getitemnumber(1,'t')) then
	carreta+=tab+'T(ºC): '+string(dw_tri.getitemnumber(1,'t'))
	tab='	'
end if
if not isnull(dw_tri.getitemnumber(1,'fc')) then
	carreta+=tab+'FC: '+string(dw_tri.getitemnumber(1,'fc'))
	tab='	'
end if
if not isnull(dw_tri.getitemnumber(1,'fr')) then
	carreta+=tab+'FR: '+string(dw_tri.getitemnumber(1,'fr'))
	tab='	'
end if
if not isnull(dw_tri.getitemnumber(1,'per_br')) then
	carreta+=tab+'Perímetro Braquial: '+string(dw_tri.getitemnumber(1,'per_br'))
	tab='~n~r'
end if

if not isnull(dw_tri.getitemnumber(1,'talla')) then
	carreta+=tab+'Talla(cms): '+string(dw_tri.getitemnumber(1,'talla'))
	tab='	'
end if
if not isnull(dw_tri.getitemnumber(1,'peso')) then
	carreta+=tab+'Peso(Kg): '+string(dw_tri.getitemnumber(1,'peso'))
	tab='	'
end if
if not isnull(dw_tri.getitemnumber(1,'peso')) and not isnull(dw_tri.getitemnumber(1,'talla')) then
	carreta+=tab+'IMC: '+string(  dw_tri.getitemnumber(1,'IMC'),'0.00' )
	tab='~n~r'
end if

if not isnull(dw_tri.getitemstring(1,'clasif')) then
	triag=dw_tri.getitemstring(1,'clasif')
	select color into :descrip from hosp_triage where cod_triage=:triag;
	carreta+=tab+'Clasif: '+triag+' - '+descrip
	tab='	'
end if

if not isnull(dw_tri.getitemnumber(1,'SAT02')) then
	carreta+=tab+'SatO2(%): '+string(dw_tri.getitemnumber(1,'SAT02'))
	tab='	'
end if

if not isnull(dw_tri.getitemstring(1,'discap')) then
	if dw_tri.getitemstring(1,'discap') ='1' then 
		triag='SI'  
	else 
		triag='NO' 
	end if
	carreta+=tab+'Persona en condición de Discapacidad: '+ triag
	tab='	'
end if

if not isnull(dw_tri.getitemnumber(1,'o')) then
	carreta+=tab+'Glasgow: '+string(dw_tri.getitemnumber(1,'total'))
	tab='~n~r'	
end if

if dw_tri.getitemstring(1,'at_inicial')<>'' and not isnull(dw_tri.getitemstring(1,'at_inicial')) then
	carreta+=tab+'Atención Inicial: '+dw_tri.getitemstring(1,'at_inicial')
	tab='	'
end if
f_pega_a_mle(i_mle,carreta+'~r~n',2)

end event

type pb_1 from picturebutton within uo_barra_hc
boolean visible = false
integer x = 315
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar.gif"
alignment htextalign = left!
string powertiptext = "Traer información desde Plantillas de Campos"
end type

event clicked;if i_uo_padre.dw_1.rowcount()=0 or i_uo_padre.dw_new.rowcount()=0 then return
if pos('2347',i_uo_padre.i_tingre)>0 and i_uo_padre.i_estado_hadm<>'1' and i_uo_padre.i_puede_modif=false then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
st_rte st
st.c_prof = i_cprof
st.mle = i_mle
st.dw_pac = w_principal.dw_1
st.codplantilla=i_cplant
st.numcampo=i_ncampo
st.ventana = i_uo_padre.i_modo
st.dw_data = idw_frm
openwithparm(w_plants_txt_campos,st)

end event

