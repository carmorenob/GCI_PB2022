$PBExportHeader$w_antecedentes_paciente.srw
forward
global type w_antecedentes_paciente from window
end type
type tb1 from tab within w_antecedentes_paciente
end type
type t1 from userobject within tb1
end type
type pb_del_antece from picturebutton within t1
end type
type pb_nrefiere from picturebutton within t1
end type
type pb_cancel from picturebutton within t1
end type
type pb_ok from picturebutton within t1
end type
type pb_gua from picturebutton within t1
end type
type pb_eli from picturebutton within t1
end type
type pb_ins from picturebutton within t1
end type
type sle_1 from singlelineedit within t1
end type
type dw_1 from datawindow within t1
end type
type t1 from userobject within tb1
pb_del_antece pb_del_antece
pb_nrefiere pb_nrefiere
pb_cancel pb_cancel
pb_ok pb_ok
pb_gua pb_gua
pb_eli pb_eli
pb_ins pb_ins
sle_1 sle_1
dw_1 dw_1
end type
type t2 from userobject within tb1
end type
type dw_2 from datawindow within t2
end type
type t2 from userobject within tb1
dw_2 dw_2
end type
type tb1 from tab within w_antecedentes_paciente
t1 t1
t2 t2
end type
type mle_1 from multilineedit within w_antecedentes_paciente
end type
end forward

global type w_antecedentes_paciente from window
integer width = 4439
integer height = 1692
boolean titlebar = true
string title = "Antecedente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 33554431
string icon = "AppIcon!"
boolean center = true
tb1 tb1
mle_1 mle_1
end type
global w_antecedentes_paciente w_antecedentes_paciente

type variables
st_rte i_st
string cod_ant,des_antce,ls_dx,ls_fm,ls_qx,ls_md,ls_tra,ls_hosp,ls_geni,ls_vac,ls_plan
long ll_nuevo=0
DataWindowChild iparen,ihosp,iplani
end variables

on w_antecedentes_paciente.create
this.tb1=create tb1
this.mle_1=create mle_1
this.Control[]={this.tb1,&
this.mle_1}
end on

on w_antecedentes_paciente.destroy
destroy(this.tb1)
destroy(this.mle_1)
end on

event open;i_st=message.powerobjectparm
SELECT 
	tipo_antecedente.cod_tipoa,	tipo_antecedente.desp_tipoa ,
	tipo_antecedente.dx, tipo_antecedente.md, tipo_antecedente.qx, tipo_antecedente.fm,
	tipo_antecedente.trans,tipo_antecedente.hospi,tipo_antecedente.geni,tipo_antecedente.vac,tipo_antecedente.plani
	into :cod_ant,:des_antce,:ls_dx,:ls_md,:ls_qx,:ls_fm,:ls_tra,:ls_hosp,:ls_geni,:ls_vac,:ls_plan
FROM
	hclin_plantcampo inner join tipo_antecedente on hclin_plantcampo.cod_ant = tipo_antecedente.cod_tipoa
WHERE
	(((hclin_plantcampo.codplantilla)=:i_st.codplantilla) and ((hclin_plantcampo.numcampo)=:i_st.numcampo));
if not isnull(des_antce) then 
	title='Antecedentes '+des_antce
else
	title='Antecedentes'
	return
end if

if ls_vac='0' then
	if g_motor='postgres'  then
		tb1.t1.dw_1.dataobject='dw_antecedente_pac_postgres'
		tb1.t2.dw_2.dataobject='dw_antecedente_pac_elimina_postgres'		
	else
		tb1.t1.dw_1.dataobject='dw_antecedente_pac'	
		tb1.t2.dw_2.dataobject='dw_antecedente_pac_elimina'				
	end if
	tb1.t1.pb_ins.enabled=true
	tb1.t1.pb_eli.enabled=true
	tb1.t1.pb_gua.enabled=true
else
	tb1.t1.dw_1.dataobject='dw_antecedente_vacunas'	
	tb1.t1.pb_ins.enabled=false
	tb1.t1.pb_eli.enabled=false
	tb1.t1.pb_gua.enabled=false
end if

tb1.t1.dw_1.SetTransObject(SQLCA)
tb1.t2.dw_2.SetTransObject(SQLCA)

tb1.t1.dw_1.getchild('parentesco',iparen)
iparen.settransobject(sqlca)
iparen.setfilter("antece='1'")
iparen.filter()
iparen.retrieve()


tb1.t1.dw_1.getchild('plani',iplani)
iplani.settransobject(sqlca)
string ls_se
ls_se=w_principal.dw_1.getitemstring(1,'sexo')
if ls_se='F' then 
	ls_se='2'
else
	ls_se='1'
end if
iplani.setfilter(" sexo_mplan  in ('0','"+ ls_se+"')")
iplani.filter()
iplani.retrieve()

tb1.t1.dw_1.getchild('hospi',ihosp)
ihosp.settransobject(sqlca)
int li_edad
li_edad=w_principal.dw_1.getitemnumber(1,'dias')
ihosp.setfilter(string(li_edad)+ " between edadi and edadf")
ihosp.filter()
ihosp.retrieve()

if ls_vac='0' then
	tb1.t1.dw_1.retrieve(tipdoc,docu,cod_ant)
	tb1.t2.dw_2.retrieve(tipdoc,docu,cod_ant)	
else
	tb1.t1.dw_1.retrieve(tipdoc,docu,cod_ant,ls_se)
	tb1.t2.dw_2.retrieve(tipdoc,docu,cod_ant,ls_se)	
end if
end event

type tb1 from tab within w_antecedentes_paciente
event create ( )
event destroy ( )
integer x = 14
integer y = 20
integer width = 4370
integer height = 1560
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
tabposition tabposition = tabsonleft!
integer selectedtab = 1
t1 t1
t2 t2
end type

on tb1.create
this.t1=create t1
this.t2=create t2
this.Control[]={this.t1,&
this.t2}
end on

on tb1.destroy
destroy(this.t1)
destroy(this.t2)
end on

type t1 from userobject within tb1
event create ( )
event destroy ( )
integer x = 128
integer y = 16
integer width = 4224
integer height = 1528
long backcolor = 67108864
long tabtextcolor = 33554432
string picturename = "anula_salida.ico"
long picturemaskcolor = 536870912
pb_del_antece pb_del_antece
pb_nrefiere pb_nrefiere
pb_cancel pb_cancel
pb_ok pb_ok
pb_gua pb_gua
pb_eli pb_eli
pb_ins pb_ins
sle_1 sle_1
dw_1 dw_1
end type

on t1.create
this.pb_del_antece=create pb_del_antece
this.pb_nrefiere=create pb_nrefiere
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.pb_gua=create pb_gua
this.pb_eli=create pb_eli
this.pb_ins=create pb_ins
this.sle_1=create sle_1
this.dw_1=create dw_1
this.Control[]={this.pb_del_antece,&
this.pb_nrefiere,&
this.pb_cancel,&
this.pb_ok,&
this.pb_gua,&
this.pb_eli,&
this.pb_ins,&
this.sle_1,&
this.dw_1}
end on

on t1.destroy
destroy(this.pb_del_antece)
destroy(this.pb_nrefiere)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.pb_gua)
destroy(this.pb_eli)
destroy(this.pb_ins)
destroy(this.sle_1)
destroy(this.dw_1)
end on

type pb_del_antece from picturebutton within t1
integer x = 4046
integer y = 860
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrador.GIF"
alignment htextalign = left!
string powertiptext = "Elimina Antecentente"
end type

event clicked;if f_permiso_boton(this,'AAHC')=0 then return
if dw_1.rowcount()<1 then return

If messageBox('Atención','Está seguro de querer eliminar definitivamente el antecendete?',question!,yesno!,2) = 2 then Return 

st_xa_anular st_anula
double  ldb_item
datetime fec_anu

st_anula.tipo='AH'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return

fec_anu=datetime(today(),now())
ldb_item=dw_1.getitemnumber(dw_1.getrow(),'item')

select sitem into :ldb_item
from pacientes_antecedente_elimina
where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:i_st.c_otro and cod_tipoa=:cod_ant and item=:ldb_item;
if isnull(ldb_item) then
	ldb_item=0
end if

ldb_item++


insert into pacientes_antecedente_elimina ( tipodoc, documento, cod_tipoa, item,sitem, fecha, cprof, antecedente, dx, parentesco, dosificacion, codproced, cod_atc, fecha_dx, hospi, hemod, numero, uaño, causat, plani, geni, rta, quien, fecha_anula, motiv_anula, usu_anula, cod_anula )
select tipodoc,documento,cod_tipoa, item,:ldb_item, fecha, cprof, antecedente, dx, parentesco, dosificacion, codproced, cod_atc, fecha_dx, hospi, hemod, numero, uaño, causat, plani, geni, rta, quien,:fec_anu,:st_anula.observacion,:usuario,:st_anula.motivo
from pacientes_antecedente
where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:i_st.c_otro and cod_tipoa=:cod_ant and item=:ldb_item;
if sqlca.sqlcode=-1 then
	messagebox("Error Insertando Antecedente Paciente elimina",sqlca.sqlerrtext)
	rollback;
	return
end if

delete from pacientes_antecedente
where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:i_st.c_otro and cod_tipoa=:cod_ant and item=:ldb_item;
if sqlca.sqlcode=-1 then
	messagebox("Error Eliminando Antecenedete Paciente",sqlca.sqlerrtext)
	rollback;
	return
end if
commit;

if ls_vac='0' then
	tb1.t1.dw_1.retrieve(tipdoc,docu,cod_ant)
	tb1.t2.dw_2.retrieve(tipdoc,docu,cod_ant)	
else
	tb1.t1.dw_1.retrieve(tipdoc,docu,cod_ant,w_principal.dw_1.getitemstring(1,'sexo'))
	tb1.t2.dw_2.retrieve(tipdoc,docu,cod_ant,w_principal.dw_1.getitemstring(1,'sexo'))	
end if

end event

type pb_nrefiere from picturebutton within t1
integer x = 4046
integer y = 720
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "norefiere.gif"
alignment htextalign = left!
string powertiptext = "No refiere"
end type

event clicked;i_st.mle.text='NO REFIERE'
close(f_vent_padre(this))
end event

type pb_cancel from picturebutton within t1
integer x = 4050
integer y = 584
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(f_vent_padre(this))
end event

type pb_ok from picturebutton within t1
integer x = 4046
integer y = 444
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;int li,l_fila,lx
string l_apegar,ltipo,l_alergia,ls_ttx,ls_ctx
if ls_vac='0' then
	for li=1 to dw_1.rowcount()
		if dw_1.getitemstring(li,'tdx')='1' then
			l_apegar='  ▪  '+string(dw_1.getitemdatetime(li,'fecha_dx'),'dd/mm/yyyy')+'  '+dw_1.getitemstring(li,'antecedentes')+'~r~n'
		end if
		if dw_1.getitemstring(li,'fm')='1' then
			l_apegar='  ▪  '+dw_1.getitemstring(li,'antecedentes')+'  - Parentesco:'+dw_1.getitemstring(li,'despar')+'~r~n'
		end if
		if dw_1.getitemstring(li,'qx')='1' then
			l_apegar='  ▪  '+string(dw_1.getitemdatetime(li,'fecha_dx'),'dd/mm/yyyy')+'  '+dw_1.getitemstring(li,'antecedentes')+'~r~n'
		end if
		if dw_1.getitemstring(li,'md')='1' then
			l_apegar='  ▪  '+'  '+dw_1.getitemstring(li,'antecedentes')+' Dósis '+dw_1.getitemstring(li,'dosificacion')+'~r~n'
		end if	
		if dw_1.getitemstring(li,'thospi')='1' then
			l_fila=ihosp.find("cod='"+dw_1.getitemstring(li,'hospi')+"'",1,ihosp.rowcount())
			l_apegar='  ▪  '+string(dw_1.getitemdatetime(li,'fecha'),'dd/mm/yyyy') +' SERVICIO: '+ihosp.getitemstring(l_fila,'nom')+'  Días de Estancia:'+string(dw_1.getitemnumber(li,'numero'))
			 if long(dw_1.getitemstring(li,'uaño'))>0 then 
				l_apegar=l_apegar+	' En el Ultimo año:'+dw_1.getitemstring(li,'uaño')
			end if
			if l_fila>0 then 
				l_apegar=l_apegar+' Causa: '+	dw_1.getitemstring(li,'antecedentes')
			end if
			l_apegar=l_apegar+	'~r~n'
		end if		
		if dw_1.getitemstring(li,'tdx')<>'1' and dw_1.getitemstring(li,'fm')<>'1' and dw_1.getitemstring(li,'qx')<>'1' and dw_1.getitemstring(li,'md')<>'1' and dw_1.getitemstring(li,'thospi')<>'1'  then
			l_apegar='  ▪  '+string(dw_1.getitemdatetime(li,'fecha'),'dd/mm/yyyy')+dw_1.getitemstring(li,'antecedente')+'~r~n'
		end if
		
		if dw_1.getitemstring(li,'trans')='1' then
			CHOOSE CASE dw_1.getitemstring(li,'hemod')
				case 'GR'  
					ls_ttx ='GLÓBULOS ROJOS'
				case 'PQ'  
					ls_ttx ='PLAQUETAS'
				case 'ST'  
					ls_ttx ='SANGRE TOTAL'
				case 'PF'  
					ls_ttx ='PLASMA FRESCO'
				case 'OT'  
					ls_ttx ='OTROS	'		
			END CHOOSE
			CHOOSE CASE dw_1.getitemstring(li,'causat')
				case 'AN'  
					ls_ctx ='ANEMIA'
				case 'LE'  
					ls_ctx ='LEUCEMIA'
				case 'HO'  
					ls_ctx ='HEMORRAGIA OBSTÉTRICA'
				case 'HU'  
					ls_ctx ='HEMORRAGIA UTERINA ANORMAL'
				case 'DG'  
					ls_ctx='DENGUE'		
				case 'PU'  
					ls_ctx='PÚRPURA	'						
			END CHOOSE		
			l_apegar='  ▪  '+string(dw_1.getitemdatetime(li,'fecha'),'dd/mm/yyyy')+' Hemocomponente '+ls_ttx+' UND '+string(dw_1.getitemnumber(li,'numero'))+' Motivo '+ls_ctx+'~r~n'
		end if	
		
		if dw_1.getitemstring(li,'genix')='1' then
			setnull(ls_ttx )
			CHOOSE CASE dw_1.getitemstring(li,'geni')		
				case 'HF'  
					ls_ttx ='HEMOFILIA'
				case 'TC'  
					ls_ttx ='TRASTORNOS DE COAGULACIÓN'
				case 'AF'  
					ls_ttx ='ANEMIA FALCIFORME'
				case 'TL'  
					ls_ttx ='TALASEMIA'
				case 'SD'  
					ls_ttx ='SÍNDROME DE DOWN'
				case 'RM'  
					ls_ttx ='RETRASO MENTAL'	
				case 'OC'  
					ls_ttx ='OTRAS CROMOSOPATÍAS'	
				case 'TY'  
					ls_ttx ='ENFERMEDAD DE TAY-SACHS'
				case 'DM'  
					ls_ttx ='DISTROFIA MUSCULAR'
				case 'FQ'  
					ls_ttx ='FIBROSIS QUÍSTICA'								
			END CHOOSE
			
			setnull(ls_ctx)
			CHOOSE CASE dw_1.getitemstring(li,'quien')
				case 'S'  
					ls_ctx ='Ella'
				case 'H'  
					ls_ctx ='El'
				case 'FS'  
					ls_ctx ='Familia de Ella'			
				case 'FH'  
					ls_ctx ='Familia de El'					
			END CHOOSE	
			l_apegar='  ▪   Antecedente: '+ls_ttx
			
			
			CHOOSE CASE dw_1.getitemstring(li,'rta')
				case '1'  
					l_apegar=l_apegar+'  Si Quien:'+ls_ctx+'~r~n'
				case '0'  
					l_apegar=l_apegar+'  No'+'~r~n'
				case '2'  
					l_apegar=l_apegar+'  No Refiere'+'~r~n'	
			END CHOOSE	
		end if
		mle_1.text+=l_apegar
	next
	dw_1.setfilter('')
	dw_1.filter()
else
	dw_1.setfilter("realizado ='1' or realizado ='2'")
	dw_1.filter()
	for li=1 to dw_1.rowcount()
		l_apegar='  ▪  '+	dw_1.getitemstring(li,'descripcion')+ ' '+dw_1.getitemstring(li,'dosis')+' '+string(dw_1.getitemdatetime(li,'fechavac'),'dd/mm/yyyy')+'~r~n'
		mle_1.text+=l_apegar
	next
	dw_1.setfilter('')
	dw_1.filter()	
end if
dw_1.SetRedraw(true)
i_st.mle.text=(mle_1.text)
close(f_vent_padre(this))

end event

type pb_gua from picturebutton within t1
integer x = 4046
integer y = 308
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Almacena Antecedente"
end type

event clicked;if dw_1.update()= -1 then
	Return -1
else
	commit;
end if

end event

type pb_eli from picturebutton within t1
integer x = 4046
integer y = 168
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar Antecedente en Captura"
end type

event clicked;if dw_1.rowcount()=0 then return
if ll_nuevo=1 then dw_1.deleterow(0)

end event

type pb_ins from picturebutton within t1
integer x = 4046
integer y = 28
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Inserta Antecedente"
end type

event clicked;int l_item
double fila

fila=dw_1.insertrow(0)
dw_1.scrolltorow(fila)
dw_1.setfocus()

l_item=dw_1.GetItemNumber(1,'maximos')
If isnull(l_item) then 
	l_item=0
end if
l_item=l_item+1
ll_nuevo=l_item
dw_1.setitem(fila,'item',l_item)
dw_1.setitem(fila,'tipodoc',tipdoc)
dw_1.setitem(fila,'documento',docu)
dw_1.setitem(fila,'fecha',now())
dw_1.setitem(fila,'cprof',i_st.c_prof)
dw_1.setitem(fila,'cod_tipoa',cod_ant)
dw_1.setitem(fila,'tdx',ls_dx)
dw_1.setitem(fila,'md',ls_md)
dw_1.setitem(fila,'qx',ls_qx)
dw_1.setitem(fila,'fm',ls_fm)
dw_1.setitem(fila,'thospi',ls_hosp)
dw_1.setitem(fila,'trans',ls_tra)
dw_1.setitem(fila,'genix',ls_geni)
dw_1.setitem(fila,'planix',ls_plan)

dw_1.setitem(fila,'nuevo',1)
if ls_dx='1' or  ls_fm='1' then 
	st_edadsexo st_es
	st_diag st_diag

	st_es.edad=w_principal.dw_1.getitemnumber(1,'dias')
	st_es.sexo=w_principal.dw_1.getitemstring(1,'sexo')
	st_es.antece='1'
	openwithparm(w_busca_diag,st_es)
	st_diag=message.powerobjectparm
	if not isvalid(st_diag) then return
	dw_1.setitem(fila,'antecedentes',st_diag.descripcion)
	dw_1.setitem(fila,'dx',st_diag.codgeral)
end if

if ls_qx='1' then 
	st_cirug stqx
	stqx.cesp='%'
	stqx.antecedente='1'
	openwithparm(w_busca_qx_cups,stqx)
	stqx=message.powerobjectparm
	if not isvalid(stqx) then return	
	dw_1.setitem(fila,'antecedentes',stqx.descrip)
	dw_1.setitem(fila,'codproced',stqx.proccups)
end if

if ls_md='1' then
	st_med st_med
	st_pa_medica st_m

	open(w_busca_atc)	
	st_med = Message.PowerObjectParm
	if not isValid(st_med) then Return -1
	dw_1.setitem(fila,'antecedentes',st_med.medicamento)
	dw_1.setitem(fila,'cod_atc',st_med.cmedica)
end if
end event

type sle_1 from singlelineedit within t1
boolean visible = false
integer x = 1957
integer y = 1432
integer width = 2043
integer height = 68
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within t1
integer x = 37
integer y = 12
integer width = 3968
integer height = 1412
integer taborder = 20
string title = "none"
string dataobject = "dw_antecedente_pac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if ls_hosp='1' and dwo.name='dxhosp' then 
	st_edadsexo st_es
	st_diag st_diag

	st_es.edad=w_principal.dw_1.getitemnumber(1,'dias')
	st_es.sexo=w_principal.dw_1.getitemstring(1,'sexo')
	st_es.antece='0'
	openwithparm(w_busca_diag,st_es)
	st_diag=message.powerobjectparm
	if not isvalid(st_diag) then return
	sle_1.text=st_diag.descripcion
	tb1.t1.dw_1.setitem(tb1.t1.dw_1.getrow(),'antecedentes',st_diag.descripcion)
	tb1.t1.dw_1.setitem(tb1.t1.dw_1.getrow(),'dx',st_diag.codgeral)
	tb1.t1.dw_1.setitem(tb1.t1.dw_1.getrow(),'dxhosp',st_diag.codrip)
	tb1.t1.sle_1.visible=true	
else
	tb1.t1.sle_1.visible=false
end if
end event

event itemchanged;if dwo.name='parentesco' then
	setitem(row,'despar',iparen.getitemstring(iparen.getrow(),'descripcion'))
end if

if dwo.name='fecha' or dwo.name='fecha_dx'   then
	if not f_valida_fechas_cap(date(data),date(w_principal.dw_1.getitemdatetime(1,'fnacimiento')),'0',0) then
		settext('')
		setitem(row,dwo.name,'')
		return 1
	end if
end if
end event

type t2 from userobject within tb1
integer x = 128
integer y = 16
integer width = 4224
integer height = 1528
long backcolor = 67108864
long tabtextcolor = 33554432
string picturename = "notas_adm.ico"
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on t2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on t2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within t2
integer x = 37
integer y = 8
integer width = 4155
integer height = 1480
integer taborder = 20
string title = "none"
string dataobject = "dw_antecedente_pac_elimina_postgres"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_antecedentes_paciente
boolean visible = false
integer x = 9
integer y = 1508
integer width = 229
integer height = 56
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

