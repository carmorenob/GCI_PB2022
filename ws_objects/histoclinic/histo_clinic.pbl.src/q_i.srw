﻿$PBExportHeader$q_i.srw
forward
global type q_i from window
end type
type pb_3 from picturebutton within q_i
end type
type pb_2 from picturebutton within q_i
end type
type dw_electronica_cap from uo_datawindow within q_i
end type
type dw_electronica from uo_datawindow within q_i
end type
type pb_1 from picturebutton within q_i
end type
type st_2 from statictext within q_i
end type
type st_1 from statictext within q_i
end type
type sle_l from singlelineedit within q_i
end type
type sle_f from singlelineedit within q_i
end type
type cb_5 from commandbutton within q_i
end type
type cb_4 from commandbutton within q_i
end type
type dw_3 from datawindow within q_i
end type
type dw_2 from datawindow within q_i
end type
type dw_1 from datawindow within q_i
end type
type ads_datos from datawindow within q_i
end type
type cb_1 from commandbutton within q_i
end type
end forward

global type q_i from window
integer width = 4165
integer height = 2112
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_3 pb_3
pb_2 pb_2
dw_electronica_cap dw_electronica_cap
dw_electronica dw_electronica
pb_1 pb_1
st_2 st_2
st_1 st_1
sle_l sle_l
sle_f sle_f
cb_5 cb_5
cb_4 cb_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
ads_datos ads_datos
cb_1 cb_1
end type
global q_i q_i

on q_i.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.dw_electronica_cap=create dw_electronica_cap
this.dw_electronica=create dw_electronica
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_l=create sle_l
this.sle_f=create sle_f
this.cb_5=create cb_5
this.cb_4=create cb_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.ads_datos=create ads_datos
this.cb_1=create cb_1
this.Control[]={this.pb_3,&
this.pb_2,&
this.dw_electronica_cap,&
this.dw_electronica,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.sle_l,&
this.sle_f,&
this.cb_5,&
this.cb_4,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.ads_datos,&
this.cb_1}
end on

on q_i.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.dw_electronica_cap)
destroy(this.dw_electronica)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_l)
destroy(this.sle_f)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.ads_datos)
destroy(this.cb_1)
end on

type pb_3 from picturebutton within q_i
string tag = "NCcapita"
integer x = 933
integer y = 500
integer width = 146
integer height = 128
integer taborder = 125
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "dian.gif"
alignment htextalign = left!
string powertiptext = "NCCapita"
end type

event clicked;////////ELECTRONICA	
double l_i,l_nfactura
string ls_clugar,ls_tfac,ls_filename
nvo_factura_electronica u_elec
st_ret_dian    lst_lle

u_elec=create nvo_factura_electronica

if dw_1.retrieve(double(sle_f.text),sle_l.text,'F',1)>0 then
	l_nfactura=dw_1.getitemnumber(1,'nfact')
	ls_clugar=dw_1.getitemstring(1,'clugar')
	ls_tfac=dw_1.getitemstring(1,'tipo')
	ls_filename=dw_1.getitemstring(1,'file_name_fact')
	
	lst_lle=u_elec.envio_sin_validacion19(dw_electronica_cap,l_nfactura,ls_clugar,ls_tfac,1,'a','RV') 
	u_elec.of_enviar_new_correo_fevs(l_nfactura,ls_clugar,ls_tfac,1,'C',ls_filename,'C')
end if
messagebox('','Proceso Finalizado')
////////ELECTRONICA

end event

type pb_2 from picturebutton within q_i
string tag = "capita"
integer x = 101
integer y = 500
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "dian.gif"
alignment htextalign = left!
string powertiptext = "Capita"
end type

event clicked;////////ELECTRONICA	
double l_i,l_nfactura
string ls_clugar,ls_tfac,ls_filename
nvo_factura_electronica u_elec
st_ret_dian    lst_lle

u_elec=create nvo_factura_electronica

//--588,'01'

if dw_1.retrieve(double(sle_f.text),sle_l.text,'F',0)>0 then
	l_nfactura=dw_1.getitemnumber(1,'nfact')
	ls_clugar=dw_1.getitemstring(1,'clugar')
	ls_tfac=dw_1.getitemstring(1,'tipo')
	ls_filename=dw_1.getitemstring(1,'file_name_fact')
	
	lst_lle=u_elec.envio_sin_validacion19(dw_electronica_cap,l_nfactura,ls_clugar,ls_tfac,0,'f','RV') 
	u_elec.of_enviar_new_correo_fevs(l_nfactura,ls_clugar,ls_tfac,0,'',ls_filename,'C')
end if
messagebox('','Proceso Finalizado')
////////ELECTRONICA

end event

type dw_electronica_cap from uo_datawindow within q_i
integer x = 2523
integer y = 556
integer width = 521
integer height = 388
integer taborder = 10
string dataobject = "asis_int_electronica_cap_ncre19"
end type

type dw_electronica from uo_datawindow within q_i
boolean visible = false
integer x = 2519
integer y = 16
integer width = 521
integer height = 388
integer taborder = 20
boolean enabled = false
string dataobject = "dw_factura_electronica_postgres19"
end type

type pb_1 from picturebutton within q_i
string tag = "Evento"
boolean visible = false
integer x = 96
integer y = 332
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "dian_zip.gif"
alignment htextalign = left!
string powertiptext = "Evento "
end type

event clicked;////////ELECTRONICA	
double l_i,l_nfactura
string ls_clugar,ls_tfac,ls_filename
nvo_factura_electronica u_elec
st_ret_dian    lst_lle

u_elec=create nvo_factura_electronica

//---55387,'69'

if dw_1.retrieve(double(sle_f.text),sle_l.text,'F')>0 then
	l_nfactura=dw_1.getitemnumber(1,'nfact')
	ls_clugar=dw_1.getitemstring(1,'clugar')
	ls_tfac=dw_1.getitemstring(1,'tipo')
	ls_filename=dw_1.getitemstring(1,'file_name_fact')
	
	lst_lle=u_elec.envio_sin_validacion19(dw_electronica,l_nfactura,ls_clugar,ls_tfac,0,'f','FV') 
	u_elec.of_enviar_new_correo_fevs(l_nfactura,ls_clugar,ls_tfac,0,'',ls_filename,'F')
		
	destroy u_elec
end if
messagebox('','Proceso Finalizado')
////////ELECTRONICA
end event

type st_2 from statictext within q_i
integer x = 686
integer y = 56
integer width = 169
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type st_1 from statictext within q_i
integer x = 50
integer y = 52
integer width = 197
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factura"
boolean focusrectangle = false
end type

type sle_l from singlelineedit within q_i
integer x = 887
integer y = 48
integer width = 402
integer height = 68
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "01"
borderstyle borderstyle = stylelowered!
end type

type sle_f from singlelineedit within q_i
integer x = 288
integer y = 48
integer width = 357
integer height = 68
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "698"
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within q_i
integer x = 261
integer y = 368
integer width = 402
integer height = 112
integer taborder = 115
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "josnCapita"
end type

event clicked;	nvo_rips_json u_rips
	
	u_rips=create nvo_rips_json
//	u_rips.emite_json_evento(49971,'74','F','f','FV')
	u_rips.emite_json_capita(double(sle_f.text),sle_l.text,'F','f','FV','d:\prueba.json','0')
	destroy 	u_rips
end event

type cb_4 from commandbutton within q_i
boolean visible = false
integer x = 96
integer y = 180
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Evento"
end type

event clicked;	nvo_rips_json u_rips
	
	u_rips=create nvo_rips_json
	u_rips.emite_json_evento(double(sle_f.text),sle_l.text,'F','f','FV','D:\json'+'.json')
//	u_rips.emite_json_evento(49971,'74','F','f','FV')
	destroy 	u_rips
end event

type dw_3 from datawindow within q_i
integer x = 1893
integer y = 232
integer width = 1934
integer height = 1016
integer taborder = 160
string title = "none"
string dataobject = "dw_retorno_cargarfevrips"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_2 from datawindow within q_i
boolean visible = false
integer x = 1893
integer width = 421
integer height = 228
integer taborder = 120
string title = "none"
string dataobject = "dw_retornos_dian"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within q_i
integer x = 101
integer y = 1276
integer width = 2473
integer height = 544
integer taborder = 150
string title = "none"
string dataobject = "dw_facturas_envio_e1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type ads_datos from datawindow within q_i
boolean visible = false
integer x = 2674
integer y = 1276
integer width = 585
integer height = 208
integer taborder = 130
string title = "none"
string dataobject = "dw_factura_electronica_cap_postgres_anula"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type cb_1 from commandbutton within q_i
integer x = 59
integer y = 812
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "loginsispro"
end type

event clicked;nvo_fevrips u_rips
string ls_token,ls_err
int li_rc
st_retorno_gral lst_ret_gral
	
u_rips=create nvo_fevrips
ls_token=u_rips.sispro_login('2','CC','9298274','/*Ese/*123..','806010305')
if ls_token<>'-1' then 
//	lst_ret_gral=u_rips.sispro_carga_fev_rips(ls_token,'2','','')
//	if lst_ret_gral.i_valor=-1 then 
//		rollback;
//	end if
//	
//	lst_ret_gral=u_rips.sispro_carga_capita_ini(ls_token,'2','','')
//	if lst_ret_gral.i_valor=-1 then 
//		rollback;
//	end if
//
	lst_ret_gral=u_rips.sispro_carga_capita_mes(ls_token,'2','','')
	if lst_ret_gral.i_valor=-1 then 
		rollback;
	end if

//
//
//	lst_ret_gral=u_rips.sispro_carga_capita_fin(ls_token,'2','','')
//	if lst_ret_gral.i_valor=-1 then 
//		rollback;
//	end if

	
	jsonpackage lnv_json
	string ls_ResultadosValidacion
	lnv_json=create jsonpackage
	
	lnv_json.loadstring( lst_ret_gral.s_valor)
	ls_err = lnv_json.LoadString(lst_ret_gral.s_valor)
	if Len(ls_err) = 0 then
		ls_ResultadosValidacion =  lnv_json.GetValue("ResultadosValidacion")
		li_rc=dw_3.ImportJson(ls_ResultadosValidacion ,ls_err)
	end if		

end if


destroy lnv_json
destroy u_rips
end event

