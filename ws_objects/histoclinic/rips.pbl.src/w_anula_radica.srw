$PBExportHeader$w_anula_radica.srw
forward
global type w_anula_radica from window
end type
type dw_anul from datawindow within w_anula_radica
end type
type dw_electronica from uo_datawindow within w_anula_radica
end type
type pb_cancel from picturebutton within w_anula_radica
end type
type pb_aceptar from picturebutton within w_anula_radica
end type
type mle_1 from multilineedit within w_anula_radica
end type
type dw_1 from datawindow within w_anula_radica
end type
type gb_1 from groupbox within w_anula_radica
end type
end forward

global type w_anula_radica from window
integer width = 2697
integer height = 1476
boolean titlebar = true
string title = "Anulación de radicaciones de RIPS"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rips.ico"
boolean clientedge = true
boolean center = true
dw_anul dw_anul
dw_electronica dw_electronica
pb_cancel pb_cancel
pb_aceptar pb_aceptar
mle_1 mle_1
dw_1 dw_1
gb_1 gb_1
end type
global w_anula_radica w_anula_radica

type variables
datawindowchild idw_tipofac
end variables

on w_anula_radica.create
this.dw_anul=create dw_anul
this.dw_electronica=create dw_electronica
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.mle_1=create mle_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.dw_anul,&
this.dw_electronica,&
this.pb_cancel,&
this.pb_aceptar,&
this.mle_1,&
this.dw_1,&
this.gb_1}
end on

on w_anula_radica.destroy
destroy(this.dw_anul)
destroy(this.dw_electronica)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type dw_anul from datawindow within w_anula_radica
integer x = 55
integer y = 84
integer width = 1696
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_anula"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_anula',idw_tipofac)
idw_tipofac.settransobject(sqlca)
idw_tipofac.retrieve('FC')
dw_anul.insertrow(1)

end event

type dw_electronica from uo_datawindow within w_anula_radica
boolean visible = false
integer x = 1074
integer width = 1522
integer height = 60
integer taborder = 10
string dataobject = "asis_int_factura_ele_cap"
end type

type pb_cancel from picturebutton within w_anula_radica
event mousemove pbm_mousemove
integer x = 2336
integer y = 1120
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        "
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_anula_radica
event mousemove pbm_mousemove
integer x = 2162
integer y = 1120
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        "
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Anular radicación"
end type

event clicked;long ldb_numradica
datetime ldt_ahora
string ls_clugarrad,ls_tiporad,ls_anula,ls_codanula

if trim(dw_anul.getitemstring(dw_anul.getrow(),'cod_anula'))='' or isnull(dw_anul.getitemstring(dw_anul.getrow(),'cod_anula')) then 
	messagebox('Atención','Campo Motivo Obligatorio')
	return
end if

ldb_numradica=w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getitemnumber(w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getrow(),'num_radicacion')
ls_clugarrad=w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getitemstring(w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getrow(),"clugar")
ls_tiporad=w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getitemstring(w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getrow(),"tipo")

if  w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getitemstring(w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getrow(),"en_destino")='1' then
	messagebox("Atención",'La factura ya se encuentra en cartera, no la puede anular')
	return
end if
if  w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getitemstring(w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getrow(),"presupuesto")='1' then
	messagebox("Atención",'La factura ya se encuentra en Reconocimiento Presupuestal, no la puede anular')
	return
end if

ls_anula=trim(mle_1.text)
ls_codanula=dw_anul.getitemstring(dw_anul.getrow(),'cod_anula')
if ls_anula="" then 
	messagebox("Error","Digite la causa de anulación")
	return
end if
ldt_ahora=datetime(today(),time(string(now())))

update factcab set nradica = null,clugar_rad=null, tipo_rad=null, nradica_ant = :ldb_numradica,clugar_rad_ant=:ls_clugarrad, tipo_rad_ant=:ls_tiporad,cod_anula=:ls_codanula
where nradica=:ldb_numradica and clugar_rad=:ls_clugarrad and tipo_rad=:ls_tiporad;
if sqlca.sqlcode= -1 then 
	messagebox("Error cambiando Estado en FACTCAB",sqlca.sqlerrtext)
	rollback;
	return
end if
update ripsradica set 
	estado =:usuario , fecha_anula =:ldt_ahora , motivo =:ls_anula, 
	contabil_anul=(case when :ls_tiporad ='F ' then 'P' else null end )
where num_radicacion =:ldb_numradica and clugar=:ls_clugarrad and tipo=:ls_tiporad;
if sqlca.sqlcode=-1 then
	messagebox("Error",sqlca.sqlerrtext)
	rollback;
	return
else
	commit;
end if

if ls_tiporad='F' and dw_1.getitemstring(1,'estado_dian')='1' and  isnull(dw_1.getitemstring(1,'estado_dian_anul')) then

	int li_nnota
	
	SELECT 
		case when Max(ripsradica_notas.nro_nota) is null then 0 else Max(ripsradica_notas.nro_nota) end +1
		into :li_nnota
	FROM 
		ripsradica_notas
	WHERE 
		 (((ripsradica_notas.num_radicacion)=:ldb_numradica) AND ((ripsradica_notas.clugar)=:ls_clugarrad) 
		  AND ((ripsradica_notas.tipo)=:ls_tiporad));

	INSERT INTO ripsradica_notas ( num_radicacion, clugar, tipo, tipo_nota, nro_nota, fecha_nota, valor_nota,valor_capita, valor_evento, cod_usuario,contabil,motivo_nota )
	SELECT 
		ripsradica.num_radicacion, ripsradica.clugar, ripsradica.tipo, 'C' AS TIPO, 
		:li_nnota as nro_nota ,ahora(), 
		(ripsradica.valor_capita - ripsradica.valor_ncr + ripsradica.valor_ndb),
		ripsradica.valor_capita, 
		ripsradica.valor_evento,
		:usuario,'P',
		:ls_anula
	FROM 
		ripsradica
	WHERE 
		(((ripsradica.num_radicacion)=:ldb_numradica) AND ((ripsradica.clugar)=:ls_clugarrad) 
		AND ((ripsradica.tipo)=:ls_tiporad) AND ((ripsradica.estado_dian)='1'));
		
	if sqlca.sqlcode=-1 then
		messagebox("Error",sqlca.sqlerrtext)
		rollback;
		return
	else
		commit;
	end if
	
	update ripsradica set 
	valor_ncr=(valor_capita-valor_ncr+valor_ndb)
	where num_radicacion =:ldb_numradica and clugar=:ls_clugarrad and tipo=:ls_tiporad;
	if sqlca.sqlcode=-1 then
		messagebox("Error",sqlca.sqlerrtext)
		rollback;
		return
	else
		commit;
	end if

	st_ret_dian    lst_lle
	nvo_factura_electronica u_eleca
	u_eleca=create nvo_factura_electronica

	if g_motor='postgres' then
		//dw_electronica.dataobject='dw_factura_electronica_cap_postgres_anula'
		dw_electronica.dataobject='dw_factura_electronica_cap_postgres_ncredito'	
	else
		//dw_electronica.dataobject='dw_factura_electronica_cap_sql' 
	end if	
	dw_electronica.settransobject(sqlca)
		
	lst_lle=u_eleca.sign_chilkat(dw_electronica,ldb_numradica,ls_clugarrad,ls_tiporad,li_nnota,'a','RV')
	if lst_lle.as_estado<>'1' then
		destroy u_eleca
		close(parent)
		return
	end if
	destroy u_eleca
end if


w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.retrieve(CLUGAR)
close(parent)
end event

type mle_1 from multilineedit within w_anula_radica
integer x = 46
integer y = 172
integer width = 2487
integer height = 428
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type dw_1 from datawindow within w_anula_radica
integer x = 37
integer y = 640
integer width = 2510
integer height = 656
integer taborder = 10
string title = "none"
string dataobject = "dw_resumen_rips"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
long n_radica
string clugar_rad,tipo_rad
n_radica=w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getitemnumber(w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getrow(),'num_radicacion')
clugar_rad=w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getitemstring(w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getrow(),"clugar")
tipo_rad=w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getitemstring(w_rias.tab_2.tp2_1.tab_1.tp_p.dw_radica.getrow(),"tipo")
retrieve(n_radica,clugar_rad,tipo_rad)
end event

type gb_1 from groupbox within w_anula_radica
integer x = 18
integer y = 24
integer width = 2546
integer height = 600
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motivo de la anulación:"
end type

