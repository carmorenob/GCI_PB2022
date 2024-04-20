$PBExportHeader$w_triage.srw
forward
global type w_triage from window
end type
type barra from htrackbar within w_triage
end type
type pb_cancel from picturebutton within w_triage
end type
type pb_ok from picturebutton within w_triage
end type
type dw_triage from datawindow within w_triage
end type
end forward

global type w_triage from window
integer width = 3374
integer height = 2240
boolean titlebar = true
string title = "Clasificación de Pacientes de Urgencias"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "triagge.ico"
boolean center = true
barra barra
pb_cancel pb_cancel
pb_ok pb_ok
dw_triage dw_triage
end type
global w_triage w_triage

type variables
trae i_st
string retorna='!'
datawindowchild idw_cierre
end variables

event open;i_st=message.powerobjectparm
if i_st.otro='mira' then 
	dw_triage.modify('clasif.protect=1')
end if
if not isnull(i_st.otro) then 
	dw_triage.enabled=false
	dw_triage.Modify("clasif.dddw.name='dw_lista_triage_total'") 
	pb_ok.enabled=false
else
	dw_triage.Modify("clasif.dddw.name='dw_lista_triage'") 
end If

if i_st.est_hadm<>'1' then dw_triage.enabled=false
sqlca.autocommit=true
dw_triage.retrieve(i_st.numero,i_st.lugar,'2')
if dw_triage.rowcount()>0 then
	if isnull(i_st.otro) then
		dw_triage.setitem(1,'signos','1')
	end if
	if isnull(dw_triage.getitemdatetime(1,'fecha_triage')) then
		dw_triage.setitem(1,'fecha_triage',now())
	end if
	barra.Position = dw_triage.getitemnumber(1,'dolor')
	dw_triage.getchild('clasif',idw_cierre)
	idw_cierre.settransobject(sqlca)
	idw_cierre.retrieve()
end if
end event

on w_triage.create
this.barra=create barra
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_triage=create dw_triage
this.Control[]={this.barra,&
this.pb_cancel,&
this.pb_ok,&
this.dw_triage}
end on

on w_triage.destroy
destroy(this.barra)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_triage)
end on

event close;closewithreturn(this,retorna)
end event

type barra from htrackbar within w_triage
integer x = 187
integer y = 1776
integer width = 2254
integer height = 120
integer maxposition = 10
integer tickfrequency = 1
integer pagesize = 1
integer linesize = 2
end type

event moved;if not isnull(i_st.otro) then 
	barra.position= dw_triage.getitemnumber(1,'dolor')
end if

end event

event lineleft;if not isnull(i_st.otro) then 
	barra.position= dw_triage.getitemnumber(1,'dolor')
end if

end event

event lineright;if not isnull(i_st.otro) then 
	barra.position= dw_triage.getitemnumber(1,'dolor')
end if

end event

event dragleave;if not isnull(i_st.otro) then 
	barra.position= dw_triage.getitemnumber(1,'dolor')
end if

end event

event dragwithin;if not isnull(i_st.otro) then 
	barra.position= dw_triage.getitemnumber(1,'dolor')
end if

end event

event pageleft;if not isnull(i_st.otro) then 
	barra.position= dw_triage.getitemnumber(1,'dolor')
end if

end event

event pageright;if not isnull(i_st.otro) then 
	barra.position= dw_triage.getitemnumber(1,'dolor')
end if

end event

type pb_cancel from picturebutton within w_triage
integer x = 1778
integer y = 2000
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_triage
integer x = 1623
integer y = 2000
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &g"
boolean originalsize = true
string picturename = "cerrar.gif"
string disabledname = "d_cerrar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+G]"
end type

event clicked;dw_triage.accepttext()
if dw_triage.getitemstring(1,'signos')='1' then
	if ( (isnull(dw_triage.getitemnumber(1,'m'))) or ( isnull(dw_triage.getitemnumber(1,'o'))) or ( isnull(dw_triage.getitemnumber(1,'v'))) ) and (isnull(dw_triage.getitemnumber(1,'total'))) then
		messagebox('Atención','Debe completar los datos de Glasgow')
		return 
	end if
	if ( (isnull(dw_triage.getitemnumber(1,'ta_sis'))) or ( isnull(dw_triage.getitemnumber(1,'ta_dia'))) ) then
		messagebox('Atención','Debe completar los datos de Tension Arterial')
		return 
	end if
	if ( (isnull(dw_triage.getitemnumber(1,'t'))) or ( isnull(dw_triage.getitemnumber(1,'fr'))) or ( isnull(dw_triage.getitemnumber(1,'fc')))   or ( isnull(dw_triage.getitemnumber(1,'sat02')))  ) then
		messagebox('Atención','Debe completar los datos de Signos Vitales')
		return 
	end if
	if ( (isnull(dw_triage.getitemnumber(1,'peso'))) or ( isnull(dw_triage.getitemnumber(1,'talla')))) then
		messagebox('Atención','Debe completar los datos de Peso Y talla')
		return 
	end if
	if isnull(dw_triage.getitemstring(1,'at_inicial')) then
		messagebox('Atención','Debe completar los datos de Atencion Inicial')
		return 
	end if	
end if

if isnull(dw_triage.getitemstring(1,'clasif')) then
	messagebox('Atención','Debe completar los datos de la Clasificación')
	return 
end if

if dw_triage.getitemstatus(1,0,primary!)=datamodified! or dw_triage.getitemstatus(1,0,primary!)=newmodified! then
	dw_triage.setitem(1,'usu_triage',usuario)
end if
dw_triage.setitem(1,'dolor',barra.position)

long ll_result
sqlca.autocommit=true
retorna=dw_triage.getitemstring(1,'clasif')
ll_result=idw_cierre.find("cod_triage='"+retorna+"'",1,idw_cierre.rowcount())
if ll_result<0 then
	messagebox('Atención','Cierre en Triagge')
	return 
end if
retorna=idw_cierre.getitemstring(ll_result,'cierre')
ll_result=dw_triage.update(true,false)
sqlca.autocommit=false
if ll_result=-1 then
	rollback;
else
	if retorna='1' then
		update hospadmi set estado='N' where nh=:i_st.numero and clugar=:i_st.lugar and codtingre='2';
		if sqlca.sqlcode=-1 then
			messagebox('Error actualizando estado de Hospadmi',sqlca.sqlerrtext)
			rollback;
			return
		end if
	end if
	commit;
	dw_triage.resetupdate()
end if

retorna=dw_triage.getitemstring(1,'clasif')
closewithreturn(parent,retorna)

end event

type dw_triage from datawindow within w_triage
event key pbm_dwnkey
integer width = 3319
integer height = 1968
integer taborder = 10
string title = "none"
string dataobject = "dw_triage"
boolean border = false
boolean livescroll = true
end type

event key;if key=keydelete! then
	string colu,nul
	long nnul
	colu=getcolumnName()
	if colu='o' or colu='m' or colu='v' then
		setnull(nul)
		setnull(nnul)
		setitem(1,colu,nnul)
		settext(nul)
	end if
end if
end event

event constructor;settransobject(sqlca)


end event

event itemchanged;accepttext()
if w_principal.dw_1.getitemnumber(1,'dias')<=1825 then
	setitem(row,'imc',0)
end if

if getcolumnname()="signos" then
	if data='0' then 
		messagebox('Atención',' Este estado no permitira cargar datos asocidos al triagge y lo clasificara como usuario en la escala de atención inmediata')
		string colo
		select cod_triage into :colo from hosp_triage where signos='1' and estado='1';
		if not isnull(colo) then 
			setitem(row,'clasif',colo)
		else
			messagebox('Error',' No hay estado para signos')
		end if
	end if
end if
end event

