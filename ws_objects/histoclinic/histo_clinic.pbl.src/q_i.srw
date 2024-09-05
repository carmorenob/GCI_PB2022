$PBExportHeader$q_i.srw
forward
global type q_i from window
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
type dw_comp from datawindow within q_i
end type
type dw_nutri from datawindow within q_i
end type
type dw_dispo from datawindow within q_i
end type
type dw_cups from datawindow within q_i
end type
type dw_med from datawindow within q_i
end type
type cb_2 from commandbutton within q_i
end type
type dw_pres from datawindow within q_i
end type
type mle_2 from multilineedit within q_i
end type
type mle_1 from multilineedit within q_i
end type
type cb_1 from commandbutton within q_i
end type
end forward

global type q_i from window
integer width = 5070
integer height = 2112
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
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
dw_comp dw_comp
dw_nutri dw_nutri
dw_dispo dw_dispo
dw_cups dw_cups
dw_med dw_med
cb_2 cb_2
dw_pres dw_pres
mle_2 mle_2
mle_1 mle_1
cb_1 cb_1
end type
global q_i q_i

on q_i.create
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
this.dw_comp=create dw_comp
this.dw_nutri=create dw_nutri
this.dw_dispo=create dw_dispo
this.dw_cups=create dw_cups
this.dw_med=create dw_med
this.cb_2=create cb_2
this.dw_pres=create dw_pres
this.mle_2=create mle_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.Control[]={this.st_2,&
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
this.dw_comp,&
this.dw_nutri,&
this.dw_dispo,&
this.dw_cups,&
this.dw_med,&
this.cb_2,&
this.dw_pres,&
this.mle_2,&
this.mle_1,&
this.cb_1}
end on

on q_i.destroy
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
destroy(this.dw_comp)
destroy(this.dw_nutri)
destroy(this.dw_dispo)
destroy(this.dw_cups)
destroy(this.dw_med)
destroy(this.cb_2)
destroy(this.dw_pres)
destroy(this.mle_2)
destroy(this.mle_1)
destroy(this.cb_1)
end on

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
integer taborder = 30
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
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "550"
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within q_i
integer x = 101
integer y = 324
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Capita"
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
integer taborder = 20
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
integer x = 187
integer y = 1284
integer width = 1879
integer height = 664
integer taborder = 60
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
integer taborder = 40
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
integer taborder = 30
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
integer width = 1746
integer height = 544
integer taborder = 40
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
integer x = 2144
integer y = 1444
integer width = 585
integer height = 208
integer taborder = 30
string title = "none"
string dataobject = "dw_factura_electronica_cap_postgres_anula"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_comp from datawindow within q_i
integer x = 2885
integer y = 1556
integer width = 1979
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "dw_mipres_prescripcion_comp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_nutri from datawindow within q_i
integer x = 2885
integer y = 1312
integer width = 1979
integer height = 200
integer taborder = 40
string title = "none"
string dataobject = "dw_mipres_prescripcion_nutri"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_dispo from datawindow within q_i
integer x = 2894
integer y = 996
integer width = 1979
integer height = 272
integer taborder = 40
string title = "none"
string dataobject = "dw_mipres_prescripcion_dispo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_cups from datawindow within q_i
integer x = 2894
integer y = 752
integer width = 1979
integer height = 212
integer taborder = 30
string title = "none"
string dataobject = "dw_mipres_prescripcion_cups"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_med from datawindow within q_i
integer x = 2894
integer y = 476
integer width = 1979
integer height = 252
integer taborder = 20
string title = "none"
string dataobject = "dw_mipres_prescripcion_med"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type cb_2 from commandbutton within q_i
integer x = 2295
integer y = 1300
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;integer li_rc,li_Success,li_RespStatusCode
oleobject loo_Jarr,loo_Json
string ls_json,lserror,ls_value
long ll_RowCount 
oleobject loo_Http, loo_SbResponseBody
integer li_i,li_max_i,f_pre
integer li_j,li_max_j,f_med


loo_Http = create oleobject
li_rc = loo_Http.ConnectToNewObject("Chilkat_9_5_0.Http")
if li_rc < 0 then
    destroy loo_Http
    MessageBox("Error","Connecting to COM object failed")
    return
end if

loo_Http.SetRequestHeader("Accept","application/json")
loo_SbResponseBody = create oleobject
li_rc = loo_SbResponseBody.ConnectToNewObject("Chilkat_9_5_0.StringBuilder")

li_Success = loo_Http.QuickGetSb('https://wsmipres.sispro.gov.co/WSMIPRESNOPBS/api/Prescripcion/800193989/2021-06-28/6AE99F44-666A-4329-BFA2-39617D77D91B',loo_SbResponseBody)
if li_Success = 0 then
messagebox('',string(loo_Http.LastErrorText))
    destroy loo_Http
    destroy loo_SbResponseBody
    return
end if

loo_Jarr = create oleobject
li_rc = loo_Jarr.ConnectToNewObject("Chilkat_9_5_0.JsonArray")
loo_Jarr.LoadSb(loo_SbResponseBody)
loo_Jarr.EmitCompact = 0
ls_json = loo_Jarr.Emit()

loo_Json = create oleobject

li_i  = 0
li_max_i = loo_Jarr.Size
do while li_i <li_max_i
    loo_Json = loo_Jarr.ObjectAt(li_i)
	if isnull(loo_Json.StringOf("prescripcion.NoPrescripcion")) then continue
	f_pre=dw_pres.insertrow(0)
	dw_pres.setitem(f_pre,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
	dw_pres.setitem(f_pre,'FPrescripcion',datetime(left(loo_Json.StringOf("prescripcion.FPrescripcion"),10)))
	dw_pres.setitem(f_pre,'HPrescripcion',datetime(date('01/01/1900'),time(loo_Json.StringOf("prescripcion.HPrescripcion"))))
	dw_pres.setitem(f_pre,'CodHabIPS',loo_Json.StringOf("prescripcion.CodHabIPS"))
	dw_pres.setitem(f_pre,'TipoIDIPS',loo_Json.StringOf("prescripcion.TipoIDIPS"))
	dw_pres.setitem(f_pre,'NroIDIPS',loo_Json.StringOf("prescripcion.NroIDIPS"))
	dw_pres.setitem(f_pre,'CodDANEMunIPS',loo_Json.StringOf("prescripcion.CodDANEMunIPS"))
	dw_pres.setitem(f_pre,'DirSedeIPS',loo_Json.StringOf("prescripcion.DirSedeIPS"))
	dw_pres.setitem(f_pre,'TelSedeIPS',loo_Json.StringOf("prescripcion.TelSedeIPS"))
	dw_pres.setitem(f_pre,'TipoIDProf', loo_Json.StringOf("prescripcion.TipoIDProf"))
	dw_pres.setitem(f_pre,'NumIDProf',loo_Json.StringOf("prescripcion.NumIDProf"))
	dw_pres.setitem(f_pre,'PNProfS',loo_Json.StringOf("prescripcion.PNProfS"))
	dw_pres.setitem(f_pre,'SNProfS',loo_Json.StringOf("prescripcion.SNProfS"))
	dw_pres.setitem(f_pre,'PAProfS',loo_Json.StringOf("prescripcion.PAProfS"))
	dw_pres.setitem(f_pre,'SAProfS',loo_Json.StringOf("prescripcion.SAProfS"))
	dw_pres.setitem(f_pre,'RegProfS',loo_Json.StringOf("prescripcion.RegProfS"))
	dw_pres.setitem(f_pre,'TipoIDPaciente',loo_Json.StringOf("prescripcion.TipoIDPaciente"))
	dw_pres.setitem(f_pre,'NroIDPaciente',loo_Json.StringOf("prescripcion.NroIDPaciente"))
	dw_pres.setitem(f_pre,'PNPaciente',loo_Json.StringOf("prescripcion.PNPaciente"))
	dw_pres.setitem(f_pre,'SNPaciente',loo_Json.StringOf("prescripcion.SNPaciente"))
	dw_pres.setitem(f_pre,'PAPaciente',loo_Json.StringOf("prescripcion.PAPaciente"))
	dw_pres.setitem(f_pre,'SAPaciente',loo_Json.StringOf("prescripcion.SAPaciente"))
	dw_pres.setitem(f_pre,'CodAmbAte',loo_Json.IntOf("prescripcion.CodAmbAte"))
	dw_pres.setitem(f_pre,'RefAmbAte', loo_Json.IntOf("prescripcion.RefAmbAte"))
	dw_pres.setitem(f_pre,'PacCovid19',loo_Json.IntOf("prescripcion.PacCovid19"))
	dw_pres.setitem(f_pre,'EnfHuerfana',loo_Json.IntOf("prescripcion.EnfHuerfana"))
	dw_pres.setitem(f_pre,'CodEnfHuerfana',loo_Json.StringOf("prescripcion.CodEnfHuerfana"))
	dw_pres.setitem(f_pre,'EnfHuerfanaDX',loo_Json.StringOf("prescripcion.EnfHuerfanaDX"))
	dw_pres.setitem(f_pre,'CodDxPpal',loo_Json.StringOf("prescripcion.CodDxPpal"))
	dw_pres.setitem(f_pre,'CodDxRel1',loo_Json.StringOf("prescripcion.CodDxRel1"))
	dw_pres.setitem(f_pre,'CodDxRel2',loo_Json.StringOf("prescripcion.CodDxRel2"))
	dw_pres.setitem(f_pre,'SopNutricional',loo_Json.StringOf("prescripcion.SopNutricional"))
	dw_pres.setitem(f_pre,'CodEPS',loo_Json.StringOf("prescripcion.CodEPS"))
	dw_pres.setitem(f_pre,'TipoIDMadrePaciente',loo_Json.StringOf("prescripcion.TipoIDMadrePaciente"))
	dw_pres.setitem(f_pre,'NroIDMadrePaciente',loo_Json.StringOf("prescripcion.NroIDMadrePaciente"))
	dw_pres.setitem(f_pre,'TipoTransc',loo_Json.StringOf("prescripcion.TipoTransc"))
	dw_pres.setitem(f_pre,'TipoIDDonanteVivo',loo_Json.StringOf("prescripcion.TipoIDDonanteVivo"))
	dw_pres.setitem(f_pre,'NroIDDonanteVivo',loo_Json.StringOf("prescripcion.NroIDDonanteVivo"))
	dw_pres.setitem(f_pre,'EstPres', loo_Json.IntOf("prescripcion.EstPres"))
	li_j = 0
    li_max_j = loo_Json.SizeOfArray("medicamentos")
    do while li_j <li_max_j
		loo_Json.J = li_j
		f_med=dw_med.insertrow(0)
		dw_med.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		dw_med.setitem(f_med,'ConOrden', loo_Json.IntOf("medicamentos[li_j].ConOrden"))
		dw_med.setitem(f_med,'TipoMed',loo_Json.IntOf("medicamentos[li_j].TipoMed"))
		dw_med.setitem(f_med,'TipoPrest', loo_Json.IntOf("medicamentos[li_j].TipoPrest"))
		dw_med.setitem(f_med,'CausaS1', loo_Json.IntOf("medicamentos[li_j].CausaS1"))
		dw_med.setitem(f_med,'CausaS2',loo_Json.IntOf("medicamentos[li_j].CausaS2"))
		dw_med.setitem(f_med,'CausaS3',loo_Json.IntOf("medicamentos[li_j].CausaS3"))
		dw_med.setitem(f_med,'MedPBSUtilizado',loo_Json.StringOf("medicamentos[li_j].MedPBSUtilizado"))
		dw_med.setitem(f_med,'RznCausaS31',loo_Json.IntOf("medicamentos[li_j].RznCausaS31"))
		dw_med.setitem(f_med,'DescRzn31',loo_Json.StringOf("medicamentos[li_j].DescRzn31"))
		dw_med.setitem(f_med,'RznCausaS32',loo_Json.IntOf("medicamentos[li_j].RznCausaS32"))
		dw_med.setitem(f_med,'DescRzn32',loo_Json.StringOf("medicamentos[li_j].DescRzn32"))
		dw_med.setitem(f_med,'CausaS4',loo_Json.IntOf("medicamentos[li_j].CausaS4"))
		dw_med.setitem(f_med,'MedPBSDescartado',loo_Json.StringOf("medicamentos[li_j].MedPBSDescartado"))
		dw_med.setitem(f_med,'RznCausaS41',loo_Json.IntOf("medicamentos[li_j].RznCausaS41"))
		dw_med.setitem(f_med,'DescRzn41',loo_Json.StringOf("medicamentos[li_j].DescRzn41"))
		dw_med.setitem(f_med,'RznCausaS42',loo_Json.IntOf("medicamentos[li_j].RznCausaS42"))
		dw_med.setitem(f_med,'DescRzn42',loo_Json.StringOf("medicamentos[li_j].DescRzn42"))
		dw_med.setitem(f_med,'RznCausaS43',loo_Json.IntOf("medicamentos[li_j].RznCausaS43"))
		dw_med.setitem(f_med,'DescRzn43',loo_Json.StringOf("medicamentos[li_j].DescRzn43"))
		dw_med.setitem(f_med,'RznCausaS44',loo_Json.IntOf("medicamentos[li_j].RznCausaS44"))
		dw_med.setitem(f_med,'DescRzn44',loo_Json.StringOf("medicamentos[li_j].DescRzn44"))
		dw_med.setitem(f_med,'CausaS5',loo_Json.IntOf("medicamentos[li_j].CausaS5"))
		dw_med.setitem(f_med,'RznCausaS5',loo_Json.StringOf("medicamentos[li_j].RznCausaS5"))
		dw_med.setitem(f_med,'CausaS6',loo_Json.StringOf("medicamentos[li_j].CausaS6"))
		dw_med.setitem(f_med,'DescMedPrinAct',loo_Json.StringOf("medicamentos[li_j].DescMedPrinAct"))
		dw_med.setitem(f_med,'CodFF',loo_Json.StringOf("medicamentos[li_j].CodFF"))
		dw_med.setitem(f_med,'CodVA',loo_Json.StringOf("medicamentos[li_j].CodVA"))
		dw_med.setitem(f_med,'JustNoPBS',loo_Json.StringOf("medicamentos[li_j].JustNoPBS"))
		dw_med.setitem(f_med,'Dosis',loo_Json.StringOf("medicamentos[li_j].Dosis"))
		dw_med.setitem(f_med,'DosisUM',loo_Json.StringOf("medicamentos[li_j].DosisUM"))
		dw_med.setitem(f_med,'NoFAdmon',loo_Json.StringOf("medicamentos[li_j].NoFAdmon"))
		dw_med.setitem(f_med,'CodFreAdmon',loo_Json.IntOf("medicamentos[li_j].CodFreAdmon"))
		dw_med.setitem(f_med,'IndEsp',loo_Json.IntOf("medicamentos[li_j].IndEsp"))
		dw_med.setitem(f_med,'CanTrat',loo_Json.StringOf("medicamentos[li_j].CanTrat"))
		dw_med.setitem(f_med,'DurTrat',loo_Json.IntOf("medicamentos[li_j].DurTrat"))
		dw_med.setitem(f_med,'CantTotalF',loo_Json.StringOf("medicamentos[li_j].CantTotalF"))
		dw_med.setitem(f_med,'UFCantTotal',loo_Json.StringOf("medicamentos[li_j].UFCantTotal"))
		dw_med.setitem(f_med,'IndRec',loo_Json.StringOf("medicamentos[li_j].IndRec"))
		dw_med.setitem(f_med,'EstJM', loo_Json.IntOf("medicamentos[li_j].EstJM"))
		 li_j = li_j +1
	loop
	li_j = 0
    li_max_j = loo_Json.SizeOfArray("procedimientos")
    do while li_j <li_max_j
		loo_Json.J = li_j
		f_med=dw_cups.insertrow(0) 
		dw_cups.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		dw_cups.setitem(f_med,'ConOrden',loo_Json.IntOf("procedimientos[li_j].ConOrden"))
		dw_cups.setitem(f_med,'TipoPrest',loo_Json.IntOf("procedimientos[li_j].TipoPrest"))
		dw_cups.setitem(f_med,'CausaS11',loo_Json.StringOf("procedimientos[li_j].CausaS11"))
		dw_cups.setitem(f_med,'CausaS12',loo_Json.StringOf("procedimientos[li_j].CausaS12"))
		dw_cups.setitem(f_med,'CausaS2',loo_Json.StringOf("procedimientos[li_j].CausaS2")) 
		dw_cups.setitem(f_med,'CausaS3',loo_Json.StringOf("procedimientos[li_j].CausaS3"))
		dw_cups.setitem(f_med,'CausaS4',loo_Json.StringOf("procedimientos[li_j].CausaS4"))
		dw_cups.setitem(f_med,'ProPBSUtilizado',loo_Json.StringOf("procedimientos[li_j].ProPBSUtilizado"))
		dw_cups.setitem(f_med,'CausaS5',loo_Json.StringOf("procedimientos[li_j].CausaS5"))
		dw_cups.setitem(f_med,'ProPBSDescartado',loo_Json.StringOf("procedimientos[li_j].ProPBSDescartado")) 
		dw_cups.setitem(f_med,'RznCausaS51',loo_Json.IntOf("procedimientos[li_j].RznCausaS51"))
		dw_cups.setitem(f_med,'DescRzn51',loo_Json.StringOf("procedimientos[li_j].DescRzn51"))
		dw_cups.setitem(f_med,'RznCausaS52',loo_Json.IntOf("procedimientos[li_j].RznCausaS52"))
		dw_cups.setitem(f_med,'DescRzn52',loo_Json.StringOf("procedimientos[li_j].DescRzn52"))
		dw_cups.setitem(f_med,'CausaS6',loo_Json.StringOf("procedimientos[li_j].CausaS6")) 
		dw_cups.setitem(f_med,'CausaS7',loo_Json.StringOf("procedimientos[li_j].CausaS7"))
		dw_cups.setitem(f_med,'CodCUPS',loo_Json.StringOf("procedimientos[li_j].CodCUPS"))
		dw_cups.setitem(f_med,'CanForm',loo_Json.StringOf("procedimientos[li_j].CanForm"))
		dw_cups.setitem(f_med,'CadaFreUso',loo_Json.StringOf("procedimientos[li_j].CadaFreUso"))
		dw_cups.setitem(f_med,'CodFreUso',loo_Json.IntOf("procedimientos[li_j].CodFreUso")) 
		dw_cups.setitem(f_med,'Cant',loo_Json.StringOf("procedimientos[li_j].Cant"))
		dw_cups.setitem(f_med,'CantTotal', loo_Json.StringOf("procedimientos[li_j].CantTotal"))
		dw_cups.setitem(f_med,'CodPerDurTrat',loo_Json.IntOf("procedimientos[li_j].CodPerDurTrat"))
		dw_cups.setitem(f_med,'JustNoPBS',loo_Json.StringOf("procedimientos[li_j].JustNoPBS"))
		dw_cups.setitem(f_med,'IndRec',loo_Json.StringOf("procedimientos[li_j].IndRec"))
		dw_cups.setitem(f_med,'EstJM',loo_Json.IntOf("procedimientos[li_j].EstJM"))
        	li_j = li_j + 1
    loop
	li_j = 0
    li_max_j = loo_Json.SizeOfArray("dispositivos")
    do while li_j <li_max_j
		loo_Json.J = li_j
		f_med=dw_dispo.insertrow(0) 
		dw_dispo.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		dw_dispo.setitem(f_med,'ConOrden',loo_Json.IntOf("dispositivos[li_j].ConOrden"))
		dw_dispo.setitem(f_med,'TipoPrest',loo_Json.IntOf("dispositivos[li_j].TipoPrest"))
		dw_dispo.setitem(f_med,'CausaS1',loo_Json.StringOf("dispositivos[li_j].CausaS1"))
		dw_dispo.setitem(f_med,'CodDisp',loo_Json.IntOf("dispositivos[li_j].CodDisp"))
		dw_dispo.setitem(f_med,'CanForm',loo_Json.IntOf("dispositivos[li_j].'CanForm"))
		dw_dispo.setitem(f_med,'CadaFreUso',loo_Json.IntOf("dispositivos[li_j].'CadaFreUso"))
		dw_dispo.setitem(f_med,'CodFreUso',loo_Json.StringOf("dispositivos[li_j].CodFreUso"))
		dw_dispo.setitem(f_med,'Cant',loo_Json.StringOf("dispositivos[li_j].Cant"))
		dw_dispo.setitem(f_med,'CodPerDurTrat',loo_Json.IntOf("dispositivos[li_j].CodPerDurTrat")) 
		dw_dispo.setitem(f_med,'CantTotal', loo_Json.StringOf("dispositivos[li_j].CantTotal"))
		dw_dispo.setitem(f_med,'JustNoPBS',loo_Json.StringOf("dispositivos[li_j].JustNoPBS"))
		dw_dispo.setitem(f_med,'IndRec',loo_Json.StringOf("dispositivos[li_j].IndRec"))
		dw_dispo.setitem(f_med,'EstJM',loo_Json.IntOf("dispositivos[li_j].EstJM"))
		li_j = li_j +1 
	loop
	li_j = 0
    li_max_j = loo_Json.SizeOfArray("productosnutricionales")
    do while li_j <li_max_j
		loo_Json.J = li_j
		f_med=dw_nutri.insertrow(0) 
		dw_nutri.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		dw_nutri.setitem(f_med,'ConOrden',loo_Json.IntOf("productosnutricionales[li_j].ConOrden"))
		dw_nutri.setitem(f_med,'TipoPrest',loo_Json.IntOf("productosnutricionales[li_j].TipoPrest"))
		dw_nutri.setitem(f_med,'CausaS1',loo_Json.StringOf("productosnutricionales[li_j].CausaS1"))
		dw_nutri.setitem(f_med,'CausaS2',loo_Json.StringOf("productosnutricionales[li_j].CausaS2"))
		dw_nutri.setitem(f_med,'CausaS3',loo_Json.StringOf("productosnutricionales[li_j].CausaS3"))
		dw_nutri.setitem(f_med,'CausaS4',loo_Json.StringOf("productosnutricionales[li_j].CausaS4"))
		dw_nutri.setitem(f_med,'ProPBSUtilizado',loo_Json.StringOf("productosnutricionales[li_j].ProPBSUtilizado"))
		dw_nutri.setitem(f_med,'RznCausaS41',loo_Json.IntOf("productosnutricionales[li_j].RznCausaS41"))
		dw_nutri.setitem(f_med,'DescRzn41',loo_Json.StringOf("productosnutricionales[li_j].DescRzn41"))
		dw_nutri.setitem(f_med,'RznCausaS42',loo_Json.IntOf("productosnutricionales[li_j].RznCausaS42"))
		dw_nutri.setitem(f_med,'DescRzn42',loo_Json.StringOf("productosnutricionales[li_j].DescRzn42"))
		dw_nutri.setitem(f_med,'CausaS5',loo_Json.StringOf("productosnutricionales[li_j].CausaS5"))
		dw_nutri.setitem(f_med,'ProNutDescartado',loo_Json.StringOf("productosnutricionales[li_j].ProNutDescartado"))
		dw_nutri.setitem(f_med,'RznCausaS51',loo_Json.IntOf("productosnutricionales[li_j].RznCausaS51"))
		dw_nutri.setitem(f_med,'DescRzn51',loo_Json.StringOf("productosnutricionales[li_j].DescRzn51"))
		dw_nutri.setitem(f_med,'RznCausaS52',loo_Json.IntOf("productosnutricionales[li_j].RznCausaS52"))
		dw_nutri.setitem(f_med,'DescRzn52',loo_Json.StringOf("productosnutricionales[li_j].DescRzn52"))
		dw_nutri.setitem(f_med,'RznCausaS54',loo_Json.IntOf("productosnutricionales[li_j].RznCausaS53"))
		dw_nutri.setitem(f_med,'DescRzn54',loo_Json.StringOf("productosnutricionales[li_j].DescRzn53"))
		dw_nutri.setitem(f_med,'RznCausaS54',loo_Json.IntOf("productosnutricionales[li_j].RznCausaS54"))
		dw_nutri.setitem(f_med,'DescRzn54',loo_Json.StringOf("productosnutricionales[li_j].DescRzn54"))
		dw_nutri.setitem(f_med,'DXEnfHuer',loo_Json.IntOf("productosnutricionales[li_j].DXEnfHuer"))
		dw_nutri.setitem(f_med,'DXVIH',loo_Json.IntOf("productosnutricionales[li_j].DXVIH"))
		dw_nutri.setitem(f_med,'DXCaPal',loo_Json.IntOf("productosnutricionales[li_j].DXCaPal"))
		dw_nutri.setitem(f_med,'DXEnfRCEV',loo_Json.IntOf("productosnutricionales[li_j].DXEnfRCEV"))
		dw_nutri.setitem(f_med,'DXDesPro',loo_Json.IntOf("productosnutricionales[li_j].DXDesPro"))
		dw_nutri.setitem(f_med,'TippProNut',loo_Json.StringOf("productosnutricionales[li_j].TippProNut"))
		dw_nutri.setitem(f_med,'DescProdNutr',loo_Json.StringOf("productosnutricionales[li_j].DescProdNutr"))
		dw_nutri.setitem(f_med,'CodForma',loo_Json.StringOf("productosnutricionales[li_j].CodForma"))
		dw_nutri.setitem(f_med,'CodViaAdmon',loo_Json.IntOf("productosnutricionales[li_j].CodViaAdmon"))
		dw_nutri.setitem(f_med,'JustNoPBS',loo_Json.StringOf("productosnutricionales[li_j].JustNoPBS"))
		dw_nutri.setitem(f_med,'Dosis',loo_Json.StringOf("productosnutricionales[li_j].Dosis"))
		dw_nutri.setitem(f_med,'DosisUM',loo_Json.StringOf("productosnutricionales[li_j].DosisUM"))
		dw_nutri.setitem(f_med,'NoFAdmon',loo_Json.StringOf("productosnutricionales[li_j].NoFAdmon"))
		dw_nutri.setitem(f_med,'CodFreAdmon',loo_Json.IntOf("productosnutricionales[li_j].CodFreAdmon"))
		dw_nutri.setitem(f_med,'IndEsp',loo_Json.IntOf("productosnutricionales[li_j].'IndEsp"))
		dw_nutri.setitem(f_med,'CanTrat',loo_Json.StringOf("productosnutricionales[li_j].CanTrat"))	
		dw_nutri.setitem(f_med,'DurTrat',loo_Json.IntOf("productosnutricionales[li_j].'DurTrat"))
     	dw_nutri.setitem(f_med,'CantTotalF', loo_Json.StringOf("productosnutricionales[li_j].CantTotalF"))
     	dw_nutri.setitem(f_med,'UFCantTotal', loo_Json.StringOf("productosnutricionales[li_j].UFCantTotal"))
    		dw_nutri.setitem(f_med,'IndRec',loo_Json.StringOf("productosnutricionales[li_j].IndRec"))
		dw_nutri.setitem(f_med,'NoPrescAso',loo_Json.StringOf("productosnutricionales[li_j].NoPrescAso")) 
    		dw_nutri.setitem(f_med,'EstJM',loo_Json.IntOf("productosnutricionales[li_j].EstJM"))
		li_j = li_j +1 
	loop
	li_j = 0
    li_max_j = loo_Json.SizeOfArray("serviciosComplementarios")
    do while li_j <li_max_j
		loo_Json.J = li_j
		f_med=dw_comp.insertrow(0) 
		dw_comp.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		dw_comp.setitem(f_med,'ConOrden',loo_Json.IntOf("serviciosComplementarios[li_j].ConOrden"))
		dw_comp.setitem(f_med,'TipoPrest',loo_Json.StringOf("serviciosComplementarios[li_j].TipoPrest"))
		dw_comp.setitem(f_med,'CausaS1',loo_Json.StringOf("serviciosComplementarios[li_j].CausaS1"))
		dw_comp.setitem(f_med,'CausaS2',loo_Json.StringOf("serviciosComplementarios[li_j].CausaS2"))
		dw_comp.setitem(f_med,'CausaS3',loo_Json.StringOf("serviciosComplementarios[li_j].CausaS3"))
		dw_comp.setitem(f_med,'CausaS4',loo_Json.StringOf("serviciosComplementarios[li_j].CausaS4"))
		dw_comp.setitem(f_med,'DescCausaS4',loo_Json.StringOf("serviciosComplementarios[li_j].DescCausaS4"))
		dw_comp.setitem(f_med,'CausaS5',loo_Json.StringOf("serviciosComplementarios[li_j].CausaS5"))
		dw_comp.setitem(f_med,'CodSerComp',loo_Json.StringOf("serviciosComplementarios[li_j].CodSerComp"))
		dw_comp.setitem(f_med,'DescSerComp',loo_Json.StringOf("serviciosComplementarios[li_j].DescSerComp"))
		dw_comp.setitem(f_med,'CanForm',loo_Json.StringOf("serviciosComplementarios[li_j].CanForm"))
		dw_comp.setitem(f_med,'CadaFreUso',loo_Json.StringOf("serviciosComplementarios[li_j].CadaFreUso"))
		dw_comp.setitem(f_med,'CodFreUso',loo_Json.IntOf("serviciosComplementarios[li_j].CodFreUso"))	
		dw_comp.setitem(f_med,'Cant',loo_Json.StringOf("serviciosComplementarios[li_j].Cant"))
		dw_comp.setitem(f_med,'CantTotal',loo_Json.StringOf("serviciosComplementarios[li_j].CantTotal"))
		dw_comp.setitem(f_med,'CodPerDurTrat',loo_Json.IntOf("serviciosComplementarios[li_j].CodPerDurTrat"))
		dw_comp.setitem(f_med,'TipoTrans',loo_Json.IntOf("serviciosComplementarios[li_j].TipoTrans"))
		dw_comp.setitem(f_med,'ReqAcom',loo_Json.IntOf("serviciosComplementarios[li_j].ReqAcom"))
		dw_comp.setitem(f_med,'TipoIDAcomAlb',loo_Json.StringOf("serviciosComplementarios[li_j].TipoIDAcomAlb"))
		dw_comp.setitem(f_med,'NroIDAcomAlb',loo_Json.StringOf("serviciosComplementarios[li_j].NroIDAcomAlb"))
		dw_comp.setitem(f_med,'ParentAcomAlb',loo_Json.IntOf("serviciosComplementarios[li_j].ParentAcomAlb"))
		dw_comp.setitem(f_med,'NombAlb',loo_Json.StringOf("serviciosComplementarios[li_j].NombAlb"))
		dw_comp.setitem(f_med,'CodMunOriAlb',loo_Json.StringOf("serviciosComplementarios[li_j].CodMunOriAlb"))
		dw_comp.setitem(f_med,'CodMunDesAlb',loo_Json.StringOf("serviciosComplementarios[li_j].CodMunDesAlb"))
		dw_comp.setitem(f_med,'JustNoPBS',loo_Json.StringOf("serviciosComplementarios[li_j].JustNoPBS"))
 		dw_comp.setitem(f_med,'IndRec',loo_Json.StringOf("serviciosComplementarios[li_j].IndRec"))
		dw_comp.setitem(f_med,'EstJM',loo_Json.IntOf("serviciosComplementarios[li_j].EstJM"))
		li_j = li_j +1 
	loop	
	li_i = li_i +1 
loop


////if dw_1.update(TRUE,FALSE) = -1 then
////messagebox('','fakko')
////end if
////commit;

destroy loo_Http
destroy loo_SbResponseBody
destroy loo_Json
return

end event

type dw_pres from datawindow within q_i
integer x = 2894
integer y = 24
integer width = 1979
integer height = 388
integer taborder = 20
string title = "none"
string dataobject = "dw_mipres_prescripcion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type mle_2 from multilineedit within q_i
integer x = 709
integer y = 680
integer width = 2011
integer height = 552
integer taborder = 20
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
integer x = 727
integer y = 248
integer width = 2011
integer height = 376
integer taborder = 20
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
integer x = 87
integer y = 624
integer width = 402
integer height = 112
integer taborder = 10
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

