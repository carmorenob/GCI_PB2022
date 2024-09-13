$PBExportHeader$q_i.srw
forward
global type q_i from window
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
type cb_3 from commandbutton within q_i
end type
type dw_2 from datawindow within q_i
end type
type dw_1 from datawindow within q_i
end type
type ads_datos from datawindow within q_i
end type
type mle_2 from multilineedit within q_i
end type
type mle_1 from multilineedit within q_i
end type
type cb_1 from commandbutton within q_i
end type
end forward

global type q_i from window
integer width = 3410
integer height = 2112
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
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
cb_3 cb_3
dw_2 dw_2
dw_1 dw_1
ads_datos ads_datos
mle_2 mle_2
mle_1 mle_1
cb_1 cb_1
end type
global q_i q_i

on q_i.create
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
this.cb_3=create cb_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.ads_datos=create ads_datos
this.mle_2=create mle_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.Control[]={this.pb_2,&
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
this.cb_3,&
this.dw_2,&
this.dw_1,&
this.ads_datos,&
this.mle_2,&
this.mle_1,&
this.cb_1}
end on

on q_i.destroy
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
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.ads_datos)
destroy(this.mle_2)
destroy(this.mle_1)
destroy(this.cb_1)
end on

type pb_2 from picturebutton within q_i
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

if dw_1.retrieve(double(sle_f.text),sle_l.text,'F')>0 then
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
boolean visible = false
integer x = 2523
integer y = 556
integer width = 521
integer height = 388
integer taborder = 10
boolean enabled = false
string dataobject = "asis_int_factura_ele_cap19"
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
string text = "588"
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within q_i
integer x = 279
integer y = 500
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
	u_rips.emite_json_capita(double(sle_f.text),sle_l.text,'F','f','FV')
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
boolean visible = false
integer x = 2857
integer y = 1576
integer width = 539
integer height = 268
integer taborder = 160
string title = "none"
string dataobject = "dw_hc_plan_ajuste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type cb_3 from commandbutton within q_i
boolean visible = false
integer x = 69
integer y = 1104
integer width = 402
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "plantilla"
end type

event clicked;double ld_i,ld_cam,ld_item,fin
string  ls_pla,entrada,salida
blob ent,sal

dw_3.retrieve()
if dw_3.rowcount()>2000 then
	fin=2000
else
	fin=dw_3.rowcount()
end if
for ld_i=1 to fin
	ls_pla= dw_3.getitemstring(ld_i,'codplantilla')
	ld_cam= dw_3.getitemnumber(ld_i,'numcampo')
	ld_item= dw_3.getitemnumber(ld_i,'item')
	
	selectblob plantilla into :ent 
	from hc_plantilla
	where codplantilla=:ls_pla and numcampo=:ld_cam and item=:ld_item;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo",sqlca.sqlerrtext)
		return -1
	end if
	
	entrada=string(ent)
	//mle_1.text=entrada
	salida=f_rtf_a_txt(entrada)
	if salida='' or isnull(salida) then continue
	ent=blob(salida)
	updateblob hc_plantilla set plantilla_new=:ent
	where codplantilla=:ls_pla and numcampo=:ld_cam and item=:ld_item;
	if sqlca.sqlcode=-1 then
		messagebox("Error acualiza",sqlca.sqlerrtext)
		return -1
	end if
	commit;
	setnull(entrada)
	setnull(ent)
	setnull(salida)
next

end event

type dw_2 from datawindow within q_i
boolean visible = false
integer x = 73
integer y = 792
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

type mle_2 from multilineedit within q_i
boolean visible = false
integer x = 709
integer y = 680
integer width = 2011
integer height = 552
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within q_i
boolean visible = false
integer x = 727
integer y = 248
integer width = 2011
integer height = 376
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within q_i
boolean visible = false
integer x = 59
integer y = 812
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;	nvo_fevrips u_rips
	
	u_rips=create nvo_fevrips
	u_rips.LoginSispro('2','CC','9298274','Giselle08+','806010305')
	destroy 	u_rips
end event

