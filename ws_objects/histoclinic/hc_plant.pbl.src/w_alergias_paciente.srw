$PBExportHeader$w_alergias_paciente.srw
forward
global type w_alergias_paciente from window
end type
type pb_del_alergia from picturebutton within w_alergias_paciente
end type
type mle_1 from multilineedit within w_alergias_paciente
end type
type pb_1 from picturebutton within w_alergias_paciente
end type
type dw_2 from datawindow within w_alergias_paciente
end type
type pb_ok from picturebutton within w_alergias_paciente
end type
type pb_cancel from picturebutton within w_alergias_paciente
end type
type dw_1 from datawindow within w_alergias_paciente
end type
end forward

global type w_alergias_paciente from window
integer width = 4005
integer height = 1716
boolean titlebar = true
string title = "Antecedente"
boolean controlmenu = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_del_alergia pb_del_alergia
mle_1 mle_1
pb_1 pb_1
dw_2 dw_2
pb_ok pb_ok
pb_cancel pb_cancel
dw_1 dw_1
end type
global w_alergias_paciente w_alergias_paciente

type variables
st_rte i_st
DataWindowChild iparen
end variables

on w_alergias_paciente.create
this.pb_del_alergia=create pb_del_alergia
this.mle_1=create mle_1
this.pb_1=create pb_1
this.dw_2=create dw_2
this.pb_ok=create pb_ok
this.pb_cancel=create pb_cancel
this.dw_1=create dw_1
this.Control[]={this.pb_del_alergia,&
this.mle_1,&
this.pb_1,&
this.dw_2,&
this.pb_ok,&
this.pb_cancel,&
this.dw_1}
end on

on w_alergias_paciente.destroy
destroy(this.pb_del_alergia)
destroy(this.mle_1)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.pb_ok)
destroy(this.pb_cancel)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
dw_1.retrieve(i_st.c_otro,tipdoc,docu)
end event

type pb_del_alergia from picturebutton within w_alergias_paciente
integer x = 2286
integer y = 1504
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
string powertiptext = "Elimina Antecentente Alergia"
end type

event clicked;if f_permiso_boton(this,'AAHC')=0 then return
if dw_1.rowcount()<1 then return

If messageBox('Atención','Está seguro de querer eliminar definitivamente el antecendete?',question!,yesno!,2) = 2 then Return 

st_xa_anular st_anula
datetime fec_anu
string ls_codtipo,ls_codale

st_anula.tipo='AH'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return

fec_anu=datetime(today(),now())
ls_codtipo=dw_1.getitemstring(dw_1.getrow(),'cod_tipo')
ls_codale=dw_1.getitemstring(dw_1.getrow(),'cod_alergia')


insert into pacientes_alergias_elimina ( tipodoc, documento, cod_tipoa, cod_tipo, cod_alergia, fecha, cprof, tipo, texto, sino, numero, fecha_cap, parentesco, cod_atc, fecha_anula, motiv_anula, usu_anula, cod_anula )
select tipodoc, documento, cod_tipoa, cod_tipo, cod_alergia, fecha, cprof, tipo, texto, sino, numero, fecha_cap, parentesco, cod_atc, :fec_anu,:st_anula.observacion,:usuario,:st_anula.motivo
from pacientes_alergias
where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:i_st.c_otro and cod_tipo=:ls_codtipo and cod_alergia=:ls_codale;
if sqlca.sqlcode=-1 then
	messagebox("Error Insertando Alergias Paciente elimina",sqlca.sqlerrtext)
	rollback;
	return
end if

delete from pacientes_alergias 
where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:i_st.c_otro and cod_tipo=:ls_codtipo and cod_alergia=:ls_codale;
if sqlca.sqlcode=-1 then
	messagebox("Error Eliminando Alergias Paciente",sqlca.sqlerrtext)
	rollback;
	return
end if
commit;

dw_1.ReselectRow(1) 
end event

type mle_1 from multilineedit within w_alergias_paciente
boolean visible = false
integer x = 3013
integer y = 1520
integer width = 411
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_alergias_paciente
integer x = 1783
integer y = 1500
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

type dw_2 from datawindow within w_alergias_paciente
boolean visible = false
integer x = 736
integer y = 1520
integer width = 283
integer height = 104
integer taborder = 50
string title = "none"
string dataobject = "dw_alergias_pac_new"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject (sqlca)
end event

type pb_ok from picturebutton within w_alergias_paciente
integer x = 1961
integer y = 1500
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
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;int li,l_fila,lx,fip
string l_apegar,ltipo,l_alergia, datos,paren

if dw_1.getitemnumber(1,'totales1')> 0 then
	messagebox("Atención",'Debe diligenciar datos obligatorios')
	return
end if
delete from pacientes_alergias where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:i_st.c_otro;
if sqlca.sqlcode=-1 then
	messagebox("Error Eliminando Alergias Paciente",sqlca.sqlerrtext)
	rollback;
	return
end if
dw_1.SetRedraw(false)
dw_1.setfilter('sele=1 or (not isnull(string(fecha))) or (not isnull(texto )) or (not isnull( sino )) or ( not isnull( string(numero) ))')
dw_1.filter()
ltipo= dw_1.getitemstring(1,'ta_desp_tipo')
lx=1
for li=1 to dw_1.rowcount()
	if dw_1.getitemstring(li,'ta_desp_tipo')= ltipo  then
		if lx=1 then
			if dw_1.getitemnumber(li,'sumas')>=1 then
				l_apegar=dw_1.getitemstring(li,'ta_desp_tipo')+'~r~n'
				//f_pega_a_mle(mle_1,l_apegar,2)
				mle_1.text+=l_apegar
			end if
		end if
		lx=lx+1
	else
		ltipo= dw_1.getitemstring(li,'ta_desp_tipo')
		l_apegar='~r~n'+dw_1.getitemstring(li,'ta_desp_tipo')+'~r~n'
		//f_pega_a_mle(mle_1,l_apegar,2)
		mle_1.text+=l_apegar
		lx=2
	end if
	l_fila=dw_2.insertrow(0)
	dw_2.setitem(l_fila,'tipodoc',tipdoc)
	dw_2.setitem(l_fila,'documento',docu)
	dw_2.setitem(l_fila,'cod_tipoa',dw_1.getitemstring(li,'ta_cod_tipoa'))
	dw_2.setitem(l_fila,'cod_tipo',dw_1.getitemstring(li,'ta_cod_tipo'))
	dw_2.setitem(l_fila,'cod_alergia',dw_1.getitemstring(li,'pa_cod_alergia'))	
	if isnull(dw_1.getitemdatetime(li,'fecha_cap')) then
		dw_2.setitem(l_fila,'fecha_cap',datetime(today(),now()))
	else
		dw_2.setitem(l_fila,'fecha_cap',dw_1.getitemdatetime(li,'fecha_cap'))
	end if
	dw_2.setitem(l_fila,'tipo',dw_1.getitemstring(li,'ta_tipo'))
	if dw_1.getitemstring(li,'ta_tipo')='T' then	
		dw_2.setitem(l_fila,'texto',dw_1.getitemstring(li,'texto'))
		datos=': '+dw_1.getitemstring(li,'texto')
	end if
	if dw_1.getitemstring(li,'ta_tipo')='R' then	
		dw_2.setitem(l_fila,'numero',dw_1.getitemnumber(li,'numero'))
		datos=': '+string(dw_1.getitemnumber(li,'numero'),'#,0')
	end if
	if dw_1.getitemstring(li,'ta_tipo')='N' then		
		dw_2.setitem(l_fila,'sino',dw_1.getitemstring(li,'sino'))
		if dw_1.getitemstring(li,'sino')='0' then
			datos=': '+'NO'
		else
			datos=': '+'SI'
		end if
	end if
	if dw_1.getitemstring(li,'ta_tipo')='F' then		
		dw_2.setitem(l_fila,'fecha',dw_1.getitemdatetime(li,'fecha'))
		datos=': '+string(dw_1.getitemdatetime(li,'fecha'),'dd/mm/yyyy')
	end if
	if dw_1.getitemstring(li,'ta_tipo')='S' or dw_1.getitemstring(li,'ta_tipo')='X'   or dw_1.getitemstring(li,'ta_tipo')='M'  then
		if dw_1.getitemnumber(li,'sele')=0 then
			dw_2.setitem(l_fila,'texto','0')
			datos=': '+'NO'
		else
			dw_2.setitem(l_fila,'texto','1')
			datos=': '+'SI'
		end if
		dw_2.setitem(l_fila,'parentesco',dw_1.getitemnumber(li,'parentesco'))			
	end if
	if isnull(dw_1.getitemstring(li,'cprof')) then 
		dw_2.setitem(l_fila,'cprof',i_st.c_prof)
	else
		dw_2.setitem(l_fila,'cprof',dw_1.getitemstring(li,'cprof'))
	end if
	
	if not isnull(dw_1.getitemnumber(li,'parentesco')) then 
		fip=iparen.find("codigo="+string(dw_1.getitemnumber(li,'parentesco')),1,iparen.rowcount())
		paren=' Parentesco: '+iparen.getitemstring(fip,'descripcion')
	end if
	
	if not isnull(paren) then
		l_apegar='  ▪  '+dw_1.getitemstring(li,'pa_desp_alergia')+datos + paren +	'~r~n'
	else
		l_apegar='  ▪  '+dw_1.getitemstring(li,'pa_desp_alergia')+datos +	'~r~n'
	end if 
//	f_pega_a_mle(mle_1,l_apegar,2)
	mle_1.text+=l_apegar
	setnull(datos)
next
dw_1.setfilter('')
dw_1.filter()
dw_1.SetRedraw(true)
if dw_2.update()=-1 then
	rollback;
	return
end if
commit;
i_st.mle.text=(mle_1.text)
close(f_vent_padre(this))

end event

type pb_cancel from picturebutton within w_alergias_paciente
integer x = 2121
integer y = 1500
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_alergias_paciente
integer x = 37
integer y = 20
integer width = 3918
integer height = 1464
integer taborder = 20
string dataobject = "dw_alergias_pac_new"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
getchild('parentesco',iparen)
iparen.settransobject(sqlca)

iparen.setfilter("antece='1'")
iparen.filter()
iparen.retrieve()
end event

event buttonclicking;if dwo.name='b_1' then
	st_med st_med
	st_pa_medica st_m

	open(w_busca_atc)	
	st_med = Message.PowerObjectParm
	if not isValid(st_med) then Return -1
end if
end event

event itemchanged;long fila
choose case dwo.name
	case 'numero'
		if not isnull(getitemnumber(row,'num_min')) and not isnull(getitemnumber(row,'num_max')) then
			if real(data)<getitemnumber(row,'num_min') or real(data)>getitemnumber(row,'num_max') then
				 messagebox('Atención','El valor no se encuentra dentro del Rango configurado debe estar entre '+string(getitemnumber(row,'num_min'))+' y  '+string(getitemnumber(row,'num_max')))
				 setnull(fila)
				 dw_1.setitem(row,'numero',fila)
				 return 1
			end if
		end if
end choose
end event

