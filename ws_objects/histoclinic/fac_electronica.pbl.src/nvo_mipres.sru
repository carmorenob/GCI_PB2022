$PBExportHeader$nvo_mipres.sru
forward
global type nvo_mipres from nonvisualobject
end type
end forward

global type nvo_mipres from nonvisualobject
end type
global nvo_mipres nvo_mipres

forward prototypes
public function string get_token_mipres (string p_nit, string p_token)
public function integer get_prescripcion_pte_mipres (string p_nit, string p_td, string p_doc, string p_fecha, string p_token, uo_datawindow p_dwpres, uo_datawindow p_dwmed, uo_datawindow p_dwcups, uo_datawindow p_dwdispo, uo_datawindow p_dwnutri, uo_datawindow p_dwcomp)
public function integer get_prescripcion_ips_mipres (string p_nit, string p_fecha, string p_token, uo_datawindow p_dwpres, uo_datawindow p_dwmed, uo_datawindow p_dwcups, uo_datawindow p_dwdispo, uo_datawindow p_dwnutri, uo_datawindow p_dwcomp)
end prototypes

public function string get_token_mipres (string p_nit, string p_token);integer li_rc,li_Success,li_BTls, li_Port, li_BAutoReconnect,li_RespStatusCode
oleobject loo_Rest,loo_XmlResponse
oleobject loo_SbResponseBody
oleobject loo_JsonResponse
string retorno

loo_Rest = create oleobject
li_rc = loo_Rest.ConnectToNewObject("Chilkat_9_5_0.Rest")
if li_rc < 0 then
    destroy loo_Rest
    MessageBox("Error","Connecting to COM object failed")
    return '-1'
end if

li_BTls = 1
li_Port = 443
li_BAutoReconnect = 1
li_Success = loo_Rest.Connect("wsmipres.sispro.gov.co",li_Port,li_BTls,li_BAutoReconnect)
if li_Success <> 1 then
    MessageBox("ConnectFailReason: ", string(loo_Rest.ConnectFailReason))
   MessageBox("xx", loo_Rest.LastErrorText)
    destroy loo_Rest
    return '-1'
end if

loo_Rest.AddHeader("Accept","application/json")

loo_SbResponseBody = create oleobject
li_rc = loo_SbResponseBody.ConnectToNewObject("Chilkat_9_5_0.StringBuilder")

li_Success = loo_Rest.FullRequestNoBodySb("GET","/WSSUMMIPRESNOPBS/api/GenerarToken/"+p_nit+"/"+p_token,loo_SbResponseBody)
if li_Success <> 1 then
    destroy loo_Rest
    destroy loo_SbResponseBody
    return 'loo_Rest.LastErrorText'
end if

li_RespStatusCode = loo_Rest.ResponseStatusCode
if li_RespStatusCode = 200 then
//    Write-Debug "Response Status Code = " + string(li_RespStatusCode)
//    Write-Debug "Response Header:"
//    Write-Debug loo_Rest.ResponseHeader
//    Write-Debug "Response Body:"
//    Write-Debug loo_SbResponseBody.GetAsString()
	loo_XmlResponse = create oleobject
	li_rc = loo_XmlResponse.ConnectToNewObject("Chilkat_9_5_0.Xml")
	
	loo_XmlResponse.LoadSb(loo_SbResponseBody,1)
	retorno=string(loo_SbResponseBody.GetAsString())
	destroy loo_Rest
	destroy loo_SbResponseBody
	destroy loo_JsonResponse
	destroy loo_SbResponseBody
	return retorno
else
	destroy loo_Rest
    	destroy loo_SbResponseBody
	return '-1'
end if


end function

public function integer get_prescripcion_pte_mipres (string p_nit, string p_td, string p_doc, string p_fecha, string p_token, uo_datawindow p_dwpres, uo_datawindow p_dwmed, uo_datawindow p_dwcups, uo_datawindow p_dwdispo, uo_datawindow p_dwnutri, uo_datawindow p_dwcomp);integer li_rc,li_Success,li_RespStatusCode
oleobject loo_Jarr,loo_Json
boolean creo=false
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
    return -1
end if

loo_Http.SetRequestHeader("Accept","application/json")
loo_SbResponseBody = create oleobject
li_rc = loo_SbResponseBody.ConnectToNewObject("Chilkat_9_5_0.StringBuilder")


li_Success = loo_Http.QuickGetSb('https://wsmipres.sispro.gov.co/WSMIPRESNOPBS/api/PrescripcionPaciente/'+p_nit+'/'+p_fecha+'/'+p_token+'/'+p_td+'/'+p_doc,loo_SbResponseBody)
if li_Success = 0 then
messagebox('',string(loo_Http.LastErrorText))
    destroy loo_Http
    destroy loo_SbResponseBody
    return -1
end if

loo_Jarr = create oleobject
li_rc = loo_Jarr.ConnectToNewObject("Chilkat_9_5_0.JsonArray")
loo_Jarr.LoadSb(loo_SbResponseBody)
loo_Jarr.EmitCompact = 0
ls_json = loo_Jarr.Emit()

loo_Json = create oleobject
li_max_i = loo_Jarr.Size
for li_i= 0 to  li_max_i - 1
    loo_Json = loo_Jarr.ObjectAt(li_i)
	if isnull(loo_Json.StringOf("prescripcion.NoPrescripcion")) or p_dwpres.setitem(f_pre,'CodAmbAte',loo_Json.IntOf("prescripcion.CodAmbAte"))<21 then 
		continue
	end if
	if p_dwpres.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0
	if p_dwmed.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0
	if p_dwcups.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0	
	if p_dwdispo.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0	
	if p_dwnutri.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0		
	if p_dwcomp.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0		
	creo=true
	f_pre=p_dwpres.insertrow(0)
	p_dwpres.setitem(f_pre,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
	p_dwpres.setitem(f_pre,'FPrescripcion',datetime(left(loo_Json.StringOf("prescripcion.FPrescripcion"),10)))
	p_dwpres.setitem(f_pre,'HPrescripcion',datetime(date('01/01/1900'),time(loo_Json.StringOf("prescripcion.HPrescripcion"))))
	p_dwpres.setitem(f_pre,'CodHabIPS',loo_Json.StringOf("prescripcion.CodHabIPS"))
	p_dwpres.setitem(f_pre,'TipoIDIPS',loo_Json.StringOf("prescripcion.TipoIDIPS"))
	p_dwpres.setitem(f_pre,'NroIDIPS',loo_Json.StringOf("prescripcion.NroIDIPS"))
	p_dwpres.setitem(f_pre,'CodDANEMunIPS',loo_Json.StringOf("prescripcion.CodDANEMunIPS"))
	p_dwpres.setitem(f_pre,'DirSedeIPS',loo_Json.StringOf("prescripcion.DirSedeIPS"))
	p_dwpres.setitem(f_pre,'TelSedeIPS',loo_Json.StringOf("prescripcion.TelSedeIPS"))
	p_dwpres.setitem(f_pre,'TipoIDProf', loo_Json.StringOf("prescripcion.TipoIDProf"))
	p_dwpres.setitem(f_pre,'NumIDProf',loo_Json.StringOf("prescripcion.NumIDProf"))
	p_dwpres.setitem(f_pre,'PNProfS',loo_Json.StringOf("prescripcion.PNProfS"))
	p_dwpres.setitem(f_pre,'SNProfS',loo_Json.StringOf("prescripcion.SNProfS"))
	p_dwpres.setitem(f_pre,'PAProfS',loo_Json.StringOf("prescripcion.PAProfS"))
	p_dwpres.setitem(f_pre,'SAProfS',loo_Json.StringOf("prescripcion.SAProfS"))
	p_dwpres.setitem(f_pre,'RegProfS',loo_Json.StringOf("prescripcion.RegProfS"))
	p_dwpres.setitem(f_pre,'TipoIDPaciente',loo_Json.StringOf("prescripcion.TipoIDPaciente"))
	p_dwpres.setitem(f_pre,'NroIDPaciente',loo_Json.StringOf("prescripcion.NroIDPaciente"))
	p_dwpres.setitem(f_pre,'PNPaciente',loo_Json.StringOf("prescripcion.PNPaciente"))
	p_dwpres.setitem(f_pre,'SNPaciente',loo_Json.StringOf("prescripcion.SNPaciente"))
	p_dwpres.setitem(f_pre,'PAPaciente',loo_Json.StringOf("prescripcion.PAPaciente"))
	p_dwpres.setitem(f_pre,'SAPaciente',loo_Json.StringOf("prescripcion.SAPaciente"))
	p_dwpres.setitem(f_pre,'CodAmbAte',loo_Json.IntOf("prescripcion.CodAmbAte"))
	p_dwpres.setitem(f_pre,'RefAmbAte', loo_Json.IntOf("prescripcion.RefAmbAte"))
	p_dwpres.setitem(f_pre,'PacCovid19',loo_Json.IntOf("prescripcion.PacCovid19"))
	p_dwpres.setitem(f_pre,'EnfHuerfana',loo_Json.IntOf("prescripcion.EnfHuerfana"))
	if loo_Json.IntOf("prescripcion.EnfHuerfana")=1 then 
		p_dwpres.setitem(f_pre,'CodEnfHuerfana',loo_Json.StringOf("prescripcion.CodEnfHuerfana"))
		p_dwpres.setitem(f_pre,'EnfHuerfanaDX',loo_Json.StringOf("prescripcion.EnfHuerfanaDX"))
	end if
	p_dwpres.setitem(f_pre,'CodDxPpal',loo_Json.StringOf("prescripcion.CodDxPpal"))
	if loo_Json.StringOf("prescripcion.CodDxRel1")<>'null' then p_dwpres.setitem(f_pre,'CodDxRel1',loo_Json.StringOf("prescripcion.CodDxRel1"))
	if loo_Json.StringOf("prescripcion.CodDxRel2")<>'null' then p_dwpres.setitem(f_pre,'CodDxRel2',loo_Json.StringOf("prescripcion.CodDxRel2"))
	p_dwpres.setitem(f_pre,'SopNutricional',loo_Json.StringOf("prescripcion.SopNutricional"))
	p_dwpres.setitem(f_pre,'CodEPS',loo_Json.StringOf("prescripcion.CodEPS"))
	if loo_Json.StringOf("prescripcion.TipoIDMadrePaciente")<>'null' then p_dwpres.setitem(f_pre,'TipoIDMadrePaciente',loo_Json.StringOf("prescripcion.TipoIDMadrePaciente"))
	if loo_Json.StringOf("prescripcion.NroIDMadrePaciente")<>'null' then p_dwpres.setitem(f_pre,'NroIDMadrePaciente',loo_Json.StringOf("prescripcion.NroIDMadrePaciente"))
	p_dwpres.setitem(f_pre,'TipoTransc',loo_Json.StringOf("prescripcion.TipoTransc"))
	if loo_Json.StringOf("prescripcion.TipoIDDonanteVivo")<>'null' then 	p_dwpres.setitem(f_pre,'TipoIDDonanteVivo',loo_Json.StringOf("prescripcion.TipoIDDonanteVivo"))
	if loo_Json.StringOf("prescripcion.NroIDDonanteVivo")<>'null' then p_dwpres.setitem(f_pre,'NroIDDonanteVivo',loo_Json.StringOf("prescripcion.NroIDDonanteVivo"))
	p_dwpres.setitem(f_pre,'EstPres', loo_Json.IntOf("prescripcion.EstPres"))
	
	li_max_j = loo_Json.SizeOfArray("medicamentos")
	for li_j=0 to li_max_j - 1
		loo_Json.J = li_j
		f_med=p_dwmed.insertrow(0)
		p_dwmed.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwmed.setitem(f_med,'ConOrden', loo_Json.IntOf("medicamentos[j].ConOrden"))
		p_dwmed.setitem(f_med,'TipoMed',loo_Json.IntOf("medicamentos[j]TipoMed"))
		p_dwmed.setitem(f_med,'TipoPrest', loo_Json.IntOf("medicamentos[j].TipoPrest"))
		p_dwmed.setitem(f_med,'CausaS1', loo_Json.IntOf("medicamentos[j].CausaS1"))
		p_dwmed.setitem(f_med,'CausaS2',loo_Json.IntOf("medicamentos[j].CausaS2"))
		p_dwmed.setitem(f_med,'CausaS3',loo_Json.IntOf("medicamentos[j].CausaS3"))
		if loo_Json.StringOf("medicamentos[j].MedPBSUtilizado")<>'null' then p_dwmed.setitem(f_med,'MedPBSUtilizado',loo_Json.StringOf("medicamentos[j].MedPBSUtilizado"))
		p_dwmed.setitem(f_med,'RznCausaS31',loo_Json.IntOf("medicamentos[j].RznCausaS31"))
		if loo_Json.StringOf("medicamentos[j].DescRzn31")<>'null' then p_dwmed.setitem(f_med,'DescRzn31',loo_Json.StringOf("medicamentos[j].DescRzn31"))
		p_dwmed.setitem(f_med,'RznCausaS32',loo_Json.IntOf("medicamentos[j].RznCausaS32"))
		if loo_Json.StringOf("medicamentos[j].DescRzn32")<>'null' then p_dwmed.setitem(f_med,'DescRzn32',loo_Json.StringOf("medicamentos[j].DescRzn32"))
		p_dwmed.setitem(f_med,'CausaS4',loo_Json.IntOf("medicamentos[j].CausaS4"))
		if loo_Json.StringOf("medicamentos[j].MedPBSDescartado")<>'null' then p_dwmed.setitem(f_med,'MedPBSDescartado',loo_Json.StringOf("medicamentos[j].MedPBSDescartado"))
		p_dwmed.setitem(f_med,'RznCausaS41',loo_Json.IntOf("medicamentos[j].RznCausaS41"))
		if loo_Json.StringOf("medicamentos[j].DescRzn41")<>'null' then p_dwmed.setitem(f_med,'DescRzn41',loo_Json.StringOf("medicamentos[j].DescRzn41"))
		p_dwmed.setitem(f_med,'RznCausaS42',loo_Json.IntOf("medicamentos[j].RznCausaS42"))
		if loo_Json.StringOf("medicamentos[j].DescRzn42")<>'null' then p_dwmed.setitem(f_med,'DescRzn42',loo_Json.StringOf("medicamentos[j].DescRzn42"))
		p_dwmed.setitem(f_med,'RznCausaS43',loo_Json.IntOf("medicamentos[j].RznCausaS43"))
		if loo_Json.StringOf("medicamentos[j].DescRzn43")<>'null' then p_dwmed.setitem(f_med,'DescRzn43',loo_Json.StringOf("medicamentos[j].DescRzn43"))
		p_dwmed.setitem(f_med,'RznCausaS44',loo_Json.IntOf("medicamentos[j].RznCausaS44"))
		if loo_Json.StringOf("medicamentos[j].DescRzn44")<>'null' then p_dwmed.setitem(f_med,'DescRzn44',loo_Json.StringOf("medicamentos[j].DescRzn44"))
		p_dwmed.setitem(f_med,'CausaS5',loo_Json.IntOf("medicamentos[j].CausaS5"))
		if loo_Json.StringOf("medicamentos[j].RznCausaS5")<>'null' then p_dwmed.setitem(f_med,'RznCausaS5',loo_Json.StringOf("medicamentos[j].RznCausaS5"))
		p_dwmed.setitem(f_med,'CausaS6',loo_Json.StringOf("medicamentos[j].CausaS6"))
		p_dwmed.setitem(f_med,'DescMedPrinAct',loo_Json.StringOf("medicamentos[j].DescMedPrinAct"))
		p_dwmed.setitem(f_med,'CodFF',loo_Json.StringOf("medicamentos[j].CodFF"))
		p_dwmed.setitem(f_med,'CodVA',loo_Json.StringOf("medicamentos[j].CodVA"))
		p_dwmed.setitem(f_med,'JustNoPBS',loo_Json.StringOf("medicamentos[j].JustNoPBS"))
		p_dwmed.setitem(f_med,'Dosis',loo_Json.StringOf("medicamentos[j].Dosis"))
		p_dwmed.setitem(f_med,'DosisUM',loo_Json.StringOf("medicamentos[j].DosisUM"))
		p_dwmed.setitem(f_med,'NoFAdmon',loo_Json.StringOf("medicamentos[j].NoFAdmon"))
		p_dwmed.setitem(f_med,'CodFreAdmon',loo_Json.IntOf("medicamentos[j].CodFreAdmon"))
		p_dwmed.setitem(f_med,'IndEsp',loo_Json.IntOf("medicamentos[j].IndEsp"))
		p_dwmed.setitem(f_med,'CanTrat',loo_Json.StringOf("medicamentos[j].CanTrat"))
		p_dwmed.setitem(f_med,'DurTrat',loo_Json.IntOf("medicamentos[j].DurTrat"))
		p_dwmed.setitem(f_med,'CantTotalF',loo_Json.StringOf("medicamentos[j].CantTotalF"))
		p_dwmed.setitem(f_med,'UFCantTotal',loo_Json.StringOf("medicamentos[j].UFCantTotal"))
		p_dwmed.setitem(f_med,'IndRec',loo_Json.StringOf("medicamentos[j].IndRec"))
		p_dwmed.setitem(f_med,'EstJM', loo_Json.IntOf("medicamentos[j].EstJM"))
	next
    li_max_j = loo_Json.SizeOfArray("procedimientos")
    for li_j=0 to li_max_j -1
		loo_Json.J = li_j
		f_med=p_dwcups.insertrow(0) 
		p_dwcups.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwcups.setitem(f_med,'ConOrden',loo_Json.IntOf("procedimientos[j].ConOrden"))
		p_dwcups.setitem(f_med,'TipoPrest',loo_Json.IntOf("procedimientos[j].TipoPrest"))
		p_dwcups.setitem(f_med,'CausaS11',loo_Json.StringOf("procedimientos[j].CausaS11"))
		p_dwcups.setitem(f_med,'CausaS12',loo_Json.StringOf("procedimientos[j].CausaS12"))
		p_dwcups.setitem(f_med,'CausaS2',loo_Json.StringOf("procedimientos[j].CausaS2")) 
		p_dwcups.setitem(f_med,'CausaS3',loo_Json.StringOf("procedimientos[j].CausaS3"))
		p_dwcups.setitem(f_med,'CausaS4',loo_Json.StringOf("procedimientos[j].CausaS4"))
		if loo_Json.StringOf("procedimientos[j].ProPBSUtilizado")<>'null' then p_dwcups.setitem(f_med,'ProPBSUtilizado',loo_Json.StringOf("procedimientos[j].ProPBSUtilizado"))
		p_dwcups.setitem(f_med,'CausaS5',loo_Json.StringOf("procedimientos[j].CausaS5"))
		if loo_Json.StringOf("procedimientos[j].ProPBSDescartado")<>'null' then 	p_dwcups.setitem(f_med,'ProPBSDescartado',loo_Json.StringOf("procedimientos[j].ProPBSDescartado")) 
		p_dwcups.setitem(f_med,'RznCausaS51',loo_Json.IntOf("procedimientos[j].RznCausaS51"))
		If loo_Json.StringOf("procedimientos[j].DescRzn51")<>'null' then 	p_dwcups.setitem(f_med,'DescRzn51',loo_Json.StringOf("procedimientos[j].DescRzn51"))
		p_dwcups.setitem(f_med,'RznCausaS52',loo_Json.IntOf("procedimientos[j].RznCausaS52"))
		if loo_Json.StringOf("procedimientos[j].DescRzn52")<>'null' then p_dwcups.setitem(f_med,'DescRzn52',loo_Json.StringOf("procedimientos[j].DescRzn52"))
		p_dwcups.setitem(f_med,'CausaS6',loo_Json.StringOf("procedimientos[j].CausaS6")) 
		p_dwcups.setitem(f_med,'CausaS7',loo_Json.StringOf("procedimientos[j].CausaS7"))
		p_dwcups.setitem(f_med,'CodCUPS',loo_Json.StringOf("procedimientos[j].CodCUPS"))
		p_dwcups.setitem(f_med,'CanForm',loo_Json.StringOf("procedimientos[j].CanForm"))
		p_dwcups.setitem(f_med,'CadaFreUso',loo_Json.StringOf("procedimientos[j].CadaFreUso"))
		p_dwcups.setitem(f_med,'CodFreUso',loo_Json.IntOf("procedimientos[j].CodFreUso")) 
		p_dwcups.setitem(f_med,'Cant',loo_Json.StringOf("procedimientos[j].Cant"))
		p_dwcups.setitem(f_med,'CantTotal', loo_Json.StringOf("procedimientos[j].CantTotal"))
		p_dwcups.setitem(f_med,'CodPerDurTrat',loo_Json.IntOf("procedimientos[j].CodPerDurTrat"))
		p_dwcups.setitem(f_med,'JustNoPBS',loo_Json.StringOf("procedimientos[j].JustNoPBS"))
		p_dwcups.setitem(f_med,'IndRec',loo_Json.StringOf("procedimientos[j].IndRec"))
		p_dwcups.setitem(f_med,'EstJM',loo_Json.IntOf("procedimientos[j].EstJM"))
	Next
	li_max_j = loo_Json.SizeOfArray("dispositivos")
	for li_j=0 to  li_max_j -1
		loo_Json.J = li_j
		f_med=p_dwdispo.insertrow(0) 
		p_dwdispo.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwdispo.setitem(f_med,'ConOrden',loo_Json.IntOf("dispositivos[j].ConOrden"))
		p_dwdispo.setitem(f_med,'TipoPrest',loo_Json.IntOf("dispositivos[j].TipoPrest"))
		p_dwdispo.setitem(f_med,'CausaS1',loo_Json.StringOf("dispositivos[j].CausaS1"))
		p_dwdispo.setitem(f_med,'CodDisp',loo_Json.IntOf("dispositivos[j].CodDisp"))
		p_dwdispo.setitem(f_med,'CanForm',loo_Json.IntOf("dispositivos[j].'CanForm"))
		p_dwdispo.setitem(f_med,'CadaFreUso',loo_Json.IntOf("dispositivos[j].'CadaFreUso"))
		p_dwdispo.setitem(f_med,'CodFreUso',loo_Json.StringOf("dispositivos[j].CodFreUso"))
		p_dwdispo.setitem(f_med,'Cant',loo_Json.StringOf("dispositivos[j].Cant"))
		p_dwdispo.setitem(f_med,'CodPerDurTrat',loo_Json.IntOf("dispositivos[j].CodPerDurTrat")) 
		p_dwdispo.setitem(f_med,'CantTotal', loo_Json.StringOf("dispositivos[j].CantTotal"))
		p_dwdispo.setitem(f_med,'JustNoPBS',loo_Json.StringOf("dispositivos[j].JustNoPBS"))
		p_dwdispo.setitem(f_med,'IndRec',loo_Json.StringOf("dispositivos[j].IndRec"))
		p_dwdispo.setitem(f_med,'EstJM',loo_Json.IntOf("dispositivos[j].EstJM"))
	next
	li_max_j = loo_Json.SizeOfArray("productosnutricionales")
    for li_j=1 to li_max_j - 1
		loo_Json.J = li_j
		f_med=p_dwnutri.insertrow(0) 
		p_dwnutri.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwnutri.setitem(f_med,'ConOrden',loo_Json.IntOf("productosnutricionales[j].ConOrden"))
		p_dwnutri.setitem(f_med,'TipoPrest',loo_Json.IntOf("productosnutricionales[j].TipoPrest"))
		p_dwnutri.setitem(f_med,'CausaS1',loo_Json.StringOf("productosnutricionales[j].CausaS1"))
		p_dwnutri.setitem(f_med,'CausaS2',loo_Json.StringOf("productosnutricionales[j].CausaS2"))
		p_dwnutri.setitem(f_med,'CausaS3',loo_Json.StringOf("productosnutricionales[j].CausaS3"))
		p_dwnutri.setitem(f_med,'CausaS4',loo_Json.StringOf("productosnutricionales[j].CausaS4"))
		p_dwnutri.setitem(f_med,'ProPBSUtilizado',loo_Json.StringOf("productosnutricionales[j].ProPBSUtilizado"))
		p_dwnutri.setitem(f_med,'RznCausaS41',loo_Json.IntOf("productosnutricionales[j].RznCausaS41"))
		p_dwnutri.setitem(f_med,'DescRzn41',loo_Json.StringOf("productosnutricionales[j].DescRzn41"))
		p_dwnutri.setitem(f_med,'RznCausaS42',loo_Json.IntOf("productosnutricionales[j].RznCausaS42"))
		p_dwnutri.setitem(f_med,'DescRzn42',loo_Json.StringOf("productosnutricionales[j].DescRzn42"))
		p_dwnutri.setitem(f_med,'CausaS5',loo_Json.StringOf("productosnutricionales[j].CausaS5"))
		p_dwnutri.setitem(f_med,'ProNutDescartado',loo_Json.StringOf("productosnutricionales[j].ProNutDescartado"))
		p_dwnutri.setitem(f_med,'RznCausaS51',loo_Json.IntOf("productosnutricionales[j].RznCausaS51"))
		p_dwnutri.setitem(f_med,'DescRzn51',loo_Json.StringOf("productosnutricionales[j].DescRzn51"))
		p_dwnutri.setitem(f_med,'RznCausaS52',loo_Json.IntOf("productosnutricionales[j].RznCausaS52"))
		p_dwnutri.setitem(f_med,'DescRzn52',loo_Json.StringOf("productosnutricionales[j].DescRzn52"))
		p_dwnutri.setitem(f_med,'RznCausaS54',loo_Json.IntOf("productosnutricionales[j].RznCausaS53"))
		p_dwnutri.setitem(f_med,'DescRzn54',loo_Json.StringOf("productosnutricionales[j].DescRzn53"))
		p_dwnutri.setitem(f_med,'RznCausaS54',loo_Json.IntOf("productosnutricionales[j].RznCausaS54"))
		p_dwnutri.setitem(f_med,'DescRzn54',loo_Json.StringOf("productosnutricionales[j].DescRzn54"))
		p_dwnutri.setitem(f_med,'DXEnfHuer',loo_Json.IntOf("productosnutricionales[j].DXEnfHuer"))
		p_dwnutri.setitem(f_med,'DXVIH',loo_Json.IntOf("productosnutricionales[j].DXVIH"))
		p_dwnutri.setitem(f_med,'DXCaPal',loo_Json.IntOf("productosnutricionales[j].DXCaPal"))
		p_dwnutri.setitem(f_med,'DXEnfRCEV',loo_Json.IntOf("productosnutricionales[j].DXEnfRCEV"))
		p_dwnutri.setitem(f_med,'DXDesPro',loo_Json.IntOf("productosnutricionales[j].DXDesPro"))
		p_dwnutri.setitem(f_med,'TippProNut',loo_Json.StringOf("productosnutricionales[j].TippProNut"))
		p_dwnutri.setitem(f_med,'DescProdNutr',loo_Json.StringOf("productosnutricionales[j].DescProdNutr"))
		p_dwnutri.setitem(f_med,'CodForma',loo_Json.StringOf("productosnutricionales[j].CodForma"))
		p_dwnutri.setitem(f_med,'CodViaAdmon',loo_Json.IntOf("productosnutricionales[j].CodViaAdmon"))
		p_dwnutri.setitem(f_med,'JustNoPBS',loo_Json.StringOf("productosnutricionales[j].JustNoPBS"))
		p_dwnutri.setitem(f_med,'Dosis',loo_Json.StringOf("productosnutricionales[j].Dosis"))
		p_dwnutri.setitem(f_med,'DosisUM',loo_Json.StringOf("productosnutricionales[j].DosisUM"))
		p_dwnutri.setitem(f_med,'NoFAdmon',loo_Json.StringOf("productosnutricionales[j].NoFAdmon"))
		p_dwnutri.setitem(f_med,'CodFreAdmon',loo_Json.IntOf("productosnutricionales[j].CodFreAdmon"))
		p_dwnutri.setitem(f_med,'IndEsp',loo_Json.IntOf("productosnutricionales[j].'IndEsp"))
		p_dwnutri.setitem(f_med,'CanTrat',loo_Json.StringOf("productosnutricionales[j].CanTrat"))	
		p_dwnutri.setitem(f_med,'DurTrat',loo_Json.IntOf("productosnutricionales[j].'DurTrat"))
     	p_dwnutri.setitem(f_med,'CantTotalF', loo_Json.StringOf("productosnutricionales[j].CantTotalF"))
     	p_dwnutri.setitem(f_med,'UFCantTotal', loo_Json.StringOf("productosnutricionales[j].UFCantTotal"))
    		p_dwnutri.setitem(f_med,'IndRec',loo_Json.StringOf("productosnutricionales[j].IndRec"))
		p_dwnutri.setitem(f_med,'NoPrescAso',loo_Json.StringOf("productosnutricionales[j].NoPrescAso")) 
    		p_dwnutri.setitem(f_med,'EstJM',loo_Json.IntOf("productosnutricionales[j].EstJM"))
	next
    li_max_j = loo_Json.SizeOfArray("serviciosComplementarios")
    for li_j=0 to li_max_j -1
		loo_Json.J = li_j
		f_med=p_dwcomp.insertrow(0) 
		p_dwcomp.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwcomp.setitem(f_med,'ConOrden',loo_Json.IntOf("serviciosComplementarios[j].ConOrden"))
		p_dwcomp.setitem(f_med,'TipoPrest',loo_Json.StringOf("serviciosComplementarios[j].TipoPrest"))
		p_dwcomp.setitem(f_med,'CausaS1',loo_Json.StringOf("serviciosComplementarios[j].CausaS1"))
		p_dwcomp.setitem(f_med,'CausaS2',loo_Json.StringOf("serviciosComplementarios[j].CausaS2"))
		p_dwcomp.setitem(f_med,'CausaS3',loo_Json.StringOf("serviciosComplementarios[j].CausaS3"))
		p_dwcomp.setitem(f_med,'CausaS4',loo_Json.StringOf("serviciosComplementarios[j].CausaS4"))
		p_dwcomp.setitem(f_med,'DescCausaS4',loo_Json.StringOf("serviciosComplementarios[j].DescCausaS4"))
		p_dwcomp.setitem(f_med,'CausaS5',loo_Json.StringOf("serviciosComplementarios[j].CausaS5"))
		p_dwcomp.setitem(f_med,'CodSerComp',loo_Json.StringOf("serviciosComplementarios[j].CodSerComp"))
		p_dwcomp.setitem(f_med,'DescSerComp',loo_Json.StringOf("serviciosComplementarios[j].DescSerComp"))
		p_dwcomp.setitem(f_med,'CanForm',loo_Json.StringOf("serviciosComplementarios[j].CanForm"))
		p_dwcomp.setitem(f_med,'CadaFreUso',loo_Json.StringOf("serviciosComplementarios[j].CadaFreUso"))
		p_dwcomp.setitem(f_med,'CodFreUso',loo_Json.IntOf("serviciosComplementarios[j].CodFreUso"))	
		p_dwcomp.setitem(f_med,'Cant',loo_Json.StringOf("serviciosComplementarios[j].Cant"))
		p_dwcomp.setitem(f_med,'CantTotal',loo_Json.StringOf("serviciosComplementarios[j].CantTotal"))
		p_dwcomp.setitem(f_med,'CodPerDurTrat',loo_Json.IntOf("serviciosComplementarios[j].CodPerDurTrat"))
		p_dwcomp.setitem(f_med,'TipoTrans',loo_Json.IntOf("serviciosComplementarios[j].TipoTrans"))
		p_dwcomp.setitem(f_med,'ReqAcom',loo_Json.IntOf("serviciosComplementarios[j].ReqAcom"))
		p_dwcomp.setitem(f_med,'TipoIDAcomAlb',loo_Json.StringOf("serviciosComplementarios[j].TipoIDAcomAlb"))
		p_dwcomp.setitem(f_med,'NroIDAcomAlb',loo_Json.StringOf("serviciosComplementarios[j].NroIDAcomAlb"))
		p_dwcomp.setitem(f_med,'ParentAcomAlb',loo_Json.IntOf("serviciosComplementarios[j].ParentAcomAlb"))
		p_dwcomp.setitem(f_med,'NombAlb',loo_Json.StringOf("serviciosComplementarios[j].NombAlb"))
		p_dwcomp.setitem(f_med,'CodMunOriAlb',loo_Json.StringOf("serviciosComplementarios[j].CodMunOriAlb"))
		p_dwcomp.setitem(f_med,'CodMunDesAlb',loo_Json.StringOf("serviciosComplementarios[j].CodMunDesAlb"))
		p_dwcomp.setitem(f_med,'JustNoPBS',loo_Json.StringOf("serviciosComplementarios[j].JustNoPBS"))
 		p_dwcomp.setitem(f_med,'IndRec',loo_Json.StringOf("serviciosComplementarios[j].IndRec"))
		p_dwcomp.setitem(f_med,'EstJM',loo_Json.IntOf("serviciosComplementarios[j].EstJM"))
	next
next
if creo then
	if p_dwpres.update(TRUE,FALSE) = -1 then
		rollback;
	end if
	if p_dwmed.update(TRUE,FALSE) = -1 then
		rollback;
	end if
	if p_dwcups.update(TRUE,FALSE) = -1 then
		rollback;
	end if
	if p_dwdispo.update(TRUE,FALSE) = -1 then
		rollback;
	end if
	if p_dwnutri.update(TRUE,FALSE) = -1 then
		rollback;
	end if
	if p_dwcomp.update(TRUE,FALSE) = -1 then
		rollback;
	end if
	commit;
end if
destroy loo_Http
destroy loo_SbResponseBody
destroy loo_Json

return 1
end function

public function integer get_prescripcion_ips_mipres (string p_nit, string p_fecha, string p_token, uo_datawindow p_dwpres, uo_datawindow p_dwmed, uo_datawindow p_dwcups, uo_datawindow p_dwdispo, uo_datawindow p_dwnutri, uo_datawindow p_dwcomp);integer li_rc,li_Success,li_RespStatusCode
oleobject loo_Jarr,loo_Json
boolean creo=false
string ls_json,lserror,ls_value
long ll_RowCount 
integer li_i,li_max_i,f_pre
integer li_j,li_max_j,f_med

httpclient lnv_httpclient
lnv_httpclient = create httpclient

li_Success= lnv_httpclient.sendrequest("Get","https://wsmipres.sispro.gov.co/WSMIPRESNOPBS/api/Prescripcion/"+p_nit+'/'+p_fecha+'/'+p_token)
if li_Success <> 1 then
//	messagebox('',string(loo_Http.LastErrorText))
	 destroy  lnv_httpclient
   return -1
end if
lnv_httpclient.getresponsebody( ls_json)


loo_Jarr = create oleobject
li_rc = loo_Jarr.ConnectToNewObject("Chilkat_9_5_0.JsonArray")
loo_Jarr.Load(ls_json)
loo_Jarr.EmitCompact = 0
ls_json = loo_Jarr.Emit()

li_max_i = loo_Jarr.Size
for li_i= 0 to  li_max_i - 1
    loo_Json = loo_Jarr.ObjectAt(li_i)
	if isnull(loo_Json.StringOf("prescripcion.NoPrescripcion")) or (loo_Json.IntOf("prescripcion.CodAmbAte"))<21 then 
		continue
	end if
	if p_dwpres.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0
	if p_dwmed.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0
	if p_dwcups.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0	
	if p_dwdispo.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0	
	if p_dwnutri.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0		
	if p_dwcomp.retrieve(loo_Json.StringOf("prescripcion.NoPrescripcion"))> 0 then return 0		
	creo=true
	f_pre=p_dwpres.insertrow(0)
	p_dwpres.setitem(f_pre,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
	p_dwpres.setitem(f_pre,'FPrescripcion',datetime(left(loo_Json.StringOf("prescripcion.FPrescripcion"),10)))
	p_dwpres.setitem(f_pre,'HPrescripcion',datetime(date('01/01/1900'),time(loo_Json.StringOf("prescripcion.HPrescripcion"))))
	p_dwpres.setitem(f_pre,'CodHabIPS',loo_Json.StringOf("prescripcion.CodHabIPS"))
	p_dwpres.setitem(f_pre,'TipoIDIPS',loo_Json.StringOf("prescripcion.TipoIDIPS"))
	p_dwpres.setitem(f_pre,'NroIDIPS',loo_Json.StringOf("prescripcion.NroIDIPS"))
	p_dwpres.setitem(f_pre,'CodDANEMunIPS',loo_Json.StringOf("prescripcion.CodDANEMunIPS"))
	p_dwpres.setitem(f_pre,'DirSedeIPS',loo_Json.StringOf("prescripcion.DirSedeIPS"))
	p_dwpres.setitem(f_pre,'TelSedeIPS',loo_Json.StringOf("prescripcion.TelSedeIPS"))
	p_dwpres.setitem(f_pre,'TipoIDProf', loo_Json.StringOf("prescripcion.TipoIDProf"))
	p_dwpres.setitem(f_pre,'NumIDProf',loo_Json.StringOf("prescripcion.NumIDProf"))
	p_dwpres.setitem(f_pre,'PNProfS',loo_Json.StringOf("prescripcion.PNProfS"))
	p_dwpres.setitem(f_pre,'SNProfS',loo_Json.StringOf("prescripcion.SNProfS"))
	p_dwpres.setitem(f_pre,'PAProfS',loo_Json.StringOf("prescripcion.PAProfS"))
	p_dwpres.setitem(f_pre,'SAProfS',loo_Json.StringOf("prescripcion.SAProfS"))
	p_dwpres.setitem(f_pre,'RegProfS',loo_Json.StringOf("prescripcion.RegProfS"))
	p_dwpres.setitem(f_pre,'TipoIDPaciente',loo_Json.StringOf("prescripcion.TipoIDPaciente"))
	p_dwpres.setitem(f_pre,'NroIDPaciente',loo_Json.StringOf("prescripcion.NroIDPaciente"))
	p_dwpres.setitem(f_pre,'PNPaciente',loo_Json.StringOf("prescripcion.PNPaciente"))
	p_dwpres.setitem(f_pre,'SNPaciente',loo_Json.StringOf("prescripcion.SNPaciente"))
	p_dwpres.setitem(f_pre,'PAPaciente',loo_Json.StringOf("prescripcion.PAPaciente"))
	p_dwpres.setitem(f_pre,'SAPaciente',loo_Json.StringOf("prescripcion.SAPaciente"))
	p_dwpres.setitem(f_pre,'CodAmbAte',loo_Json.IntOf("prescripcion.CodAmbAte"))
	p_dwpres.setitem(f_pre,'RefAmbAte', loo_Json.IntOf("prescripcion.RefAmbAte"))
	p_dwpres.setitem(f_pre,'PacCovid19',loo_Json.IntOf("prescripcion.PacCovid19"))
	p_dwpres.setitem(f_pre,'EnfHuerfana',loo_Json.IntOf("prescripcion.EnfHuerfana"))
	if loo_Json.IntOf("prescripcion.EnfHuerfana")=1 then 
		p_dwpres.setitem(f_pre,'CodEnfHuerfana',loo_Json.StringOf("prescripcion.CodEnfHuerfana"))
		p_dwpres.setitem(f_pre,'EnfHuerfanaDX',loo_Json.StringOf("prescripcion.EnfHuerfanaDX"))
	end if
	p_dwpres.setitem(f_pre,'CodDxPpal',loo_Json.StringOf("prescripcion.CodDxPpal"))
	if loo_Json.StringOf("prescripcion.CodDxRel1")<>'null' then p_dwpres.setitem(f_pre,'CodDxRel1',loo_Json.StringOf("prescripcion.CodDxRel1"))
	if loo_Json.StringOf("prescripcion.CodDxRel2")<>'null' then p_dwpres.setitem(f_pre,'CodDxRel2',loo_Json.StringOf("prescripcion.CodDxRel2"))
	p_dwpres.setitem(f_pre,'SopNutricional',loo_Json.StringOf("prescripcion.SopNutricional"))
	p_dwpres.setitem(f_pre,'CodEPS',loo_Json.StringOf("prescripcion.CodEPS"))
	if loo_Json.StringOf("prescripcion.TipoIDMadrePaciente")<>'null' then p_dwpres.setitem(f_pre,'TipoIDMadrePaciente',loo_Json.StringOf("prescripcion.TipoIDMadrePaciente"))
	if loo_Json.StringOf("prescripcion.NroIDMadrePaciente")<>'null' then p_dwpres.setitem(f_pre,'NroIDMadrePaciente',loo_Json.StringOf("prescripcion.NroIDMadrePaciente"))
	p_dwpres.setitem(f_pre,'TipoTransc',loo_Json.StringOf("prescripcion.TipoTransc"))
	if loo_Json.StringOf("prescripcion.TipoIDDonanteVivo")<>'null' then 	p_dwpres.setitem(f_pre,'TipoIDDonanteVivo',loo_Json.StringOf("prescripcion.TipoIDDonanteVivo"))
	if loo_Json.StringOf("prescripcion.NroIDDonanteVivo")<>'null' then p_dwpres.setitem(f_pre,'NroIDDonanteVivo',loo_Json.StringOf("prescripcion.NroIDDonanteVivo"))
	p_dwpres.setitem(f_pre,'EstPres', loo_Json.IntOf("prescripcion.EstPres"))
	
	li_max_j = loo_Json.SizeOfArray("medicamentos")
	for li_j=0 to li_max_j - 1
		loo_Json.J = li_j
		f_med=p_dwmed.insertrow(0)
		p_dwmed.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwmed.setitem(f_med,'ConOrden', loo_Json.IntOf("medicamentos[j].ConOrden"))
		p_dwmed.setitem(f_med,'TipoMed',loo_Json.IntOf("medicamentos[j]TipoMed"))
		p_dwmed.setitem(f_med,'TipoPrest', loo_Json.IntOf("medicamentos[j].TipoPrest"))
		p_dwmed.setitem(f_med,'CausaS1', loo_Json.IntOf("medicamentos[j].CausaS1"))
		p_dwmed.setitem(f_med,'CausaS2',loo_Json.IntOf("medicamentos[j].CausaS2"))
		p_dwmed.setitem(f_med,'CausaS3',loo_Json.IntOf("medicamentos[j].CausaS3"))
		if loo_Json.StringOf("medicamentos[j].MedPBSUtilizado")<>'null' then p_dwmed.setitem(f_med,'MedPBSUtilizado',loo_Json.StringOf("medicamentos[j].MedPBSUtilizado"))
		p_dwmed.setitem(f_med,'RznCausaS31',loo_Json.IntOf("medicamentos[j].RznCausaS31"))
		if loo_Json.StringOf("medicamentos[j].DescRzn31")<>'null' then p_dwmed.setitem(f_med,'DescRzn31',loo_Json.StringOf("medicamentos[j].DescRzn31"))
		p_dwmed.setitem(f_med,'RznCausaS32',loo_Json.IntOf("medicamentos[j].RznCausaS32"))
		if loo_Json.StringOf("medicamentos[j].DescRzn32")<>'null' then p_dwmed.setitem(f_med,'DescRzn32',loo_Json.StringOf("medicamentos[j].DescRzn32"))
		p_dwmed.setitem(f_med,'CausaS4',loo_Json.IntOf("medicamentos[j].CausaS4"))
		if loo_Json.StringOf("medicamentos[j].MedPBSDescartado")<>'null' then p_dwmed.setitem(f_med,'MedPBSDescartado',loo_Json.StringOf("medicamentos[j].MedPBSDescartado"))
		p_dwmed.setitem(f_med,'RznCausaS41',loo_Json.IntOf("medicamentos[j].RznCausaS41"))
		if loo_Json.StringOf("medicamentos[j].DescRzn41")<>'null' then p_dwmed.setitem(f_med,'DescRzn41',loo_Json.StringOf("medicamentos[j].DescRzn41"))
		p_dwmed.setitem(f_med,'RznCausaS42',loo_Json.IntOf("medicamentos[j].RznCausaS42"))
		if loo_Json.StringOf("medicamentos[j].DescRzn42")<>'null' then p_dwmed.setitem(f_med,'DescRzn42',loo_Json.StringOf("medicamentos[j].DescRzn42"))
		p_dwmed.setitem(f_med,'RznCausaS43',loo_Json.IntOf("medicamentos[j].RznCausaS43"))
		if loo_Json.StringOf("medicamentos[j].DescRzn43")<>'null' then p_dwmed.setitem(f_med,'DescRzn43',loo_Json.StringOf("medicamentos[j].DescRzn43"))
		p_dwmed.setitem(f_med,'RznCausaS44',loo_Json.IntOf("medicamentos[j].RznCausaS44"))
		if loo_Json.StringOf("medicamentos[j].DescRzn44")<>'null' then p_dwmed.setitem(f_med,'DescRzn44',loo_Json.StringOf("medicamentos[j].DescRzn44"))
		p_dwmed.setitem(f_med,'CausaS5',loo_Json.IntOf("medicamentos[j].CausaS5"))
		if loo_Json.StringOf("medicamentos[j].RznCausaS5")<>'null' then p_dwmed.setitem(f_med,'RznCausaS5',loo_Json.StringOf("medicamentos[j].RznCausaS5"))
		p_dwmed.setitem(f_med,'CausaS6',loo_Json.StringOf("medicamentos[j].CausaS6"))
		p_dwmed.setitem(f_med,'DescMedPrinAct',loo_Json.StringOf("medicamentos[j].DescMedPrinAct"))
		p_dwmed.setitem(f_med,'CodFF',loo_Json.StringOf("medicamentos[j].CodFF"))
		p_dwmed.setitem(f_med,'CodVA',loo_Json.StringOf("medicamentos[j].CodVA"))
		p_dwmed.setitem(f_med,'JustNoPBS',loo_Json.StringOf("medicamentos[j].JustNoPBS"))
		p_dwmed.setitem(f_med,'Dosis',loo_Json.StringOf("medicamentos[j].Dosis"))
		p_dwmed.setitem(f_med,'DosisUM',loo_Json.StringOf("medicamentos[j].DosisUM"))
		p_dwmed.setitem(f_med,'NoFAdmon',loo_Json.StringOf("medicamentos[j].NoFAdmon"))
		p_dwmed.setitem(f_med,'CodFreAdmon',loo_Json.IntOf("medicamentos[j].CodFreAdmon"))
		p_dwmed.setitem(f_med,'IndEsp',loo_Json.IntOf("medicamentos[j].IndEsp"))
		p_dwmed.setitem(f_med,'CanTrat',loo_Json.StringOf("medicamentos[j].CanTrat"))
		p_dwmed.setitem(f_med,'DurTrat',loo_Json.IntOf("medicamentos[j].DurTrat"))
		p_dwmed.setitem(f_med,'CantTotalF',loo_Json.StringOf("medicamentos[j].CantTotalF"))
		p_dwmed.setitem(f_med,'UFCantTotal',loo_Json.StringOf("medicamentos[j].UFCantTotal"))
		p_dwmed.setitem(f_med,'IndRec',loo_Json.StringOf("medicamentos[j].IndRec"))
		p_dwmed.setitem(f_med,'EstJM', loo_Json.IntOf("medicamentos[j].EstJM"))
	next
    li_max_j = loo_Json.SizeOfArray("procedimientos")
    for li_j=0 to li_max_j -1
		loo_Json.J = li_j
		f_med=p_dwcups.insertrow(0) 
		p_dwcups.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwcups.setitem(f_med,'ConOrden',loo_Json.IntOf("procedimientos[j].ConOrden"))
		p_dwcups.setitem(f_med,'TipoPrest',loo_Json.IntOf("procedimientos[j].TipoPrest"))
		p_dwcups.setitem(f_med,'CausaS11',loo_Json.StringOf("procedimientos[j].CausaS11"))
		p_dwcups.setitem(f_med,'CausaS12',loo_Json.StringOf("procedimientos[j].CausaS12"))
		p_dwcups.setitem(f_med,'CausaS2',loo_Json.StringOf("procedimientos[j].CausaS2")) 
		p_dwcups.setitem(f_med,'CausaS3',loo_Json.StringOf("procedimientos[j].CausaS3"))
		p_dwcups.setitem(f_med,'CausaS4',loo_Json.StringOf("procedimientos[j].CausaS4"))
		if loo_Json.StringOf("procedimientos[j].ProPBSUtilizado")<>'null' then p_dwcups.setitem(f_med,'ProPBSUtilizado',loo_Json.StringOf("procedimientos[j].ProPBSUtilizado"))
		p_dwcups.setitem(f_med,'CausaS5',loo_Json.StringOf("procedimientos[j].CausaS5"))
		if loo_Json.StringOf("procedimientos[j].ProPBSDescartado")<>'null' then 	p_dwcups.setitem(f_med,'ProPBSDescartado',loo_Json.StringOf("procedimientos[j].ProPBSDescartado")) 
		p_dwcups.setitem(f_med,'RznCausaS51',loo_Json.IntOf("procedimientos[j].RznCausaS51"))
		If loo_Json.StringOf("procedimientos[j].DescRzn51")<>'null' then 	p_dwcups.setitem(f_med,'DescRzn51',loo_Json.StringOf("procedimientos[j].DescRzn51"))
		p_dwcups.setitem(f_med,'RznCausaS52',loo_Json.IntOf("procedimientos[j].RznCausaS52"))
		if loo_Json.StringOf("procedimientos[j].DescRzn52")<>'null' then p_dwcups.setitem(f_med,'DescRzn52',loo_Json.StringOf("procedimientos[j].DescRzn52"))
		p_dwcups.setitem(f_med,'CausaS6',loo_Json.StringOf("procedimientos[j].CausaS6")) 
		p_dwcups.setitem(f_med,'CausaS7',loo_Json.StringOf("procedimientos[j].CausaS7"))
		p_dwcups.setitem(f_med,'CodCUPS',loo_Json.StringOf("procedimientos[j].CodCUPS"))
		p_dwcups.setitem(f_med,'CanForm',loo_Json.StringOf("procedimientos[j].CanForm"))
		p_dwcups.setitem(f_med,'CadaFreUso',loo_Json.StringOf("procedimientos[j].CadaFreUso"))
		p_dwcups.setitem(f_med,'CodFreUso',loo_Json.IntOf("procedimientos[j].CodFreUso")) 
		p_dwcups.setitem(f_med,'Cant',loo_Json.StringOf("procedimientos[j].Cant"))
		p_dwcups.setitem(f_med,'CantTotal', loo_Json.StringOf("procedimientos[j].CantTotal"))
		p_dwcups.setitem(f_med,'CodPerDurTrat',loo_Json.IntOf("procedimientos[j].CodPerDurTrat"))
		p_dwcups.setitem(f_med,'JustNoPBS',loo_Json.StringOf("procedimientos[j].JustNoPBS"))
		p_dwcups.setitem(f_med,'IndRec',loo_Json.StringOf("procedimientos[j].IndRec"))
		p_dwcups.setitem(f_med,'EstJM',loo_Json.IntOf("procedimientos[j].EstJM"))
	Next
	li_max_j = loo_Json.SizeOfArray("dispositivos")
	for li_j=0 to  li_max_j -1
		loo_Json.J = li_j
		f_med=p_dwdispo.insertrow(0) 
		p_dwdispo.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwdispo.setitem(f_med,'ConOrden',loo_Json.IntOf("dispositivos[j].ConOrden"))
		p_dwdispo.setitem(f_med,'TipoPrest',loo_Json.IntOf("dispositivos[j].TipoPrest"))
		p_dwdispo.setitem(f_med,'CausaS1',loo_Json.StringOf("dispositivos[j].CausaS1"))
		p_dwdispo.setitem(f_med,'CodDisp',loo_Json.IntOf("dispositivos[j].CodDisp"))
		p_dwdispo.setitem(f_med,'CanForm',loo_Json.IntOf("dispositivos[j].'CanForm"))
		p_dwdispo.setitem(f_med,'CadaFreUso',loo_Json.IntOf("dispositivos[j].'CadaFreUso"))
		p_dwdispo.setitem(f_med,'CodFreUso',loo_Json.StringOf("dispositivos[j].CodFreUso"))
		p_dwdispo.setitem(f_med,'Cant',loo_Json.StringOf("dispositivos[j].Cant"))
		p_dwdispo.setitem(f_med,'CodPerDurTrat',loo_Json.IntOf("dispositivos[j].CodPerDurTrat")) 
		p_dwdispo.setitem(f_med,'CantTotal', loo_Json.StringOf("dispositivos[j].CantTotal"))
		p_dwdispo.setitem(f_med,'JustNoPBS',loo_Json.StringOf("dispositivos[j].JustNoPBS"))
		p_dwdispo.setitem(f_med,'IndRec',loo_Json.StringOf("dispositivos[j].IndRec"))
		p_dwdispo.setitem(f_med,'EstJM',loo_Json.IntOf("dispositivos[j].EstJM"))
	next
	li_max_j = loo_Json.SizeOfArray("productosnutricionales")
    for li_j=1 to li_max_j - 1
		loo_Json.J = li_j
		f_med=p_dwnutri.insertrow(0) 
		p_dwnutri.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwnutri.setitem(f_med,'ConOrden',loo_Json.IntOf("productosnutricionales[j].ConOrden"))
		p_dwnutri.setitem(f_med,'TipoPrest',loo_Json.IntOf("productosnutricionales[j].TipoPrest"))
		p_dwnutri.setitem(f_med,'CausaS1',loo_Json.StringOf("productosnutricionales[j].CausaS1"))
		p_dwnutri.setitem(f_med,'CausaS2',loo_Json.StringOf("productosnutricionales[j].CausaS2"))
		p_dwnutri.setitem(f_med,'CausaS3',loo_Json.StringOf("productosnutricionales[j].CausaS3"))
		p_dwnutri.setitem(f_med,'CausaS4',loo_Json.StringOf("productosnutricionales[j].CausaS4"))
		p_dwnutri.setitem(f_med,'ProPBSUtilizado',loo_Json.StringOf("productosnutricionales[j].ProPBSUtilizado"))
		p_dwnutri.setitem(f_med,'RznCausaS41',loo_Json.IntOf("productosnutricionales[j].RznCausaS41"))
		p_dwnutri.setitem(f_med,'DescRzn41',loo_Json.StringOf("productosnutricionales[j].DescRzn41"))
		p_dwnutri.setitem(f_med,'RznCausaS42',loo_Json.IntOf("productosnutricionales[j].RznCausaS42"))
		p_dwnutri.setitem(f_med,'DescRzn42',loo_Json.StringOf("productosnutricionales[j].DescRzn42"))
		p_dwnutri.setitem(f_med,'CausaS5',loo_Json.StringOf("productosnutricionales[j].CausaS5"))
		p_dwnutri.setitem(f_med,'ProNutDescartado',loo_Json.StringOf("productosnutricionales[j].ProNutDescartado"))
		p_dwnutri.setitem(f_med,'RznCausaS51',loo_Json.IntOf("productosnutricionales[j].RznCausaS51"))
		p_dwnutri.setitem(f_med,'DescRzn51',loo_Json.StringOf("productosnutricionales[j].DescRzn51"))
		p_dwnutri.setitem(f_med,'RznCausaS52',loo_Json.IntOf("productosnutricionales[j].RznCausaS52"))
		p_dwnutri.setitem(f_med,'DescRzn52',loo_Json.StringOf("productosnutricionales[j].DescRzn52"))
		p_dwnutri.setitem(f_med,'RznCausaS54',loo_Json.IntOf("productosnutricionales[j].RznCausaS53"))
		p_dwnutri.setitem(f_med,'DescRzn54',loo_Json.StringOf("productosnutricionales[j].DescRzn53"))
		p_dwnutri.setitem(f_med,'RznCausaS54',loo_Json.IntOf("productosnutricionales[j].RznCausaS54"))
		p_dwnutri.setitem(f_med,'DescRzn54',loo_Json.StringOf("productosnutricionales[j].DescRzn54"))
		p_dwnutri.setitem(f_med,'DXEnfHuer',loo_Json.IntOf("productosnutricionales[j].DXEnfHuer"))
		p_dwnutri.setitem(f_med,'DXVIH',loo_Json.IntOf("productosnutricionales[j].DXVIH"))
		p_dwnutri.setitem(f_med,'DXCaPal',loo_Json.IntOf("productosnutricionales[j].DXCaPal"))
		p_dwnutri.setitem(f_med,'DXEnfRCEV',loo_Json.IntOf("productosnutricionales[j].DXEnfRCEV"))
		p_dwnutri.setitem(f_med,'DXDesPro',loo_Json.IntOf("productosnutricionales[j].DXDesPro"))
		p_dwnutri.setitem(f_med,'TippProNut',loo_Json.StringOf("productosnutricionales[j].TippProNut"))
		p_dwnutri.setitem(f_med,'DescProdNutr',loo_Json.StringOf("productosnutricionales[j].DescProdNutr"))
		p_dwnutri.setitem(f_med,'CodForma',loo_Json.StringOf("productosnutricionales[j].CodForma"))
		p_dwnutri.setitem(f_med,'CodViaAdmon',loo_Json.IntOf("productosnutricionales[j].CodViaAdmon"))
		p_dwnutri.setitem(f_med,'JustNoPBS',loo_Json.StringOf("productosnutricionales[j].JustNoPBS"))
		p_dwnutri.setitem(f_med,'Dosis',loo_Json.StringOf("productosnutricionales[j].Dosis"))
		p_dwnutri.setitem(f_med,'DosisUM',loo_Json.StringOf("productosnutricionales[j].DosisUM"))
		p_dwnutri.setitem(f_med,'NoFAdmon',loo_Json.StringOf("productosnutricionales[j].NoFAdmon"))
		p_dwnutri.setitem(f_med,'CodFreAdmon',loo_Json.IntOf("productosnutricionales[j].CodFreAdmon"))
		p_dwnutri.setitem(f_med,'IndEsp',loo_Json.IntOf("productosnutricionales[j].'IndEsp"))
		p_dwnutri.setitem(f_med,'CanTrat',loo_Json.StringOf("productosnutricionales[j].CanTrat"))	
		p_dwnutri.setitem(f_med,'DurTrat',loo_Json.IntOf("productosnutricionales[j].'DurTrat"))
     	p_dwnutri.setitem(f_med,'CantTotalF', loo_Json.StringOf("productosnutricionales[j].CantTotalF"))
     	p_dwnutri.setitem(f_med,'UFCantTotal', loo_Json.StringOf("productosnutricionales[j].UFCantTotal"))
    		p_dwnutri.setitem(f_med,'IndRec',loo_Json.StringOf("productosnutricionales[j].IndRec"))
		p_dwnutri.setitem(f_med,'NoPrescAso',loo_Json.StringOf("productosnutricionales[j].NoPrescAso")) 
    		p_dwnutri.setitem(f_med,'EstJM',loo_Json.IntOf("productosnutricionales[j].EstJM"))
	next
    li_max_j = loo_Json.SizeOfArray("serviciosComplementarios")
    for li_j=0 to li_max_j -1
		loo_Json.J = li_j
		f_med=p_dwcomp.insertrow(0) 
		p_dwcomp.setitem(f_med,'NoPrescripcion',loo_Json.StringOf("prescripcion.NoPrescripcion"))
		p_dwcomp.setitem(f_med,'ConOrden',loo_Json.IntOf("serviciosComplementarios[j].ConOrden"))
		p_dwcomp.setitem(f_med,'TipoPrest',loo_Json.StringOf("serviciosComplementarios[j].TipoPrest"))
		p_dwcomp.setitem(f_med,'CausaS1',loo_Json.StringOf("serviciosComplementarios[j].CausaS1"))
		p_dwcomp.setitem(f_med,'CausaS2',loo_Json.StringOf("serviciosComplementarios[j].CausaS2"))
		p_dwcomp.setitem(f_med,'CausaS3',loo_Json.StringOf("serviciosComplementarios[j].CausaS3"))
		p_dwcomp.setitem(f_med,'CausaS4',loo_Json.StringOf("serviciosComplementarios[j].CausaS4"))
		p_dwcomp.setitem(f_med,'DescCausaS4',loo_Json.StringOf("serviciosComplementarios[j].DescCausaS4"))
		p_dwcomp.setitem(f_med,'CausaS5',loo_Json.StringOf("serviciosComplementarios[j].CausaS5"))
		p_dwcomp.setitem(f_med,'CodSerComp',loo_Json.StringOf("serviciosComplementarios[j].CodSerComp"))
		p_dwcomp.setitem(f_med,'DescSerComp',loo_Json.StringOf("serviciosComplementarios[j].DescSerComp"))
		p_dwcomp.setitem(f_med,'CanForm',loo_Json.StringOf("serviciosComplementarios[j].CanForm"))
		p_dwcomp.setitem(f_med,'CadaFreUso',loo_Json.StringOf("serviciosComplementarios[j].CadaFreUso"))
		p_dwcomp.setitem(f_med,'CodFreUso',loo_Json.IntOf("serviciosComplementarios[j].CodFreUso"))	
		p_dwcomp.setitem(f_med,'Cant',loo_Json.StringOf("serviciosComplementarios[j].Cant"))
		p_dwcomp.setitem(f_med,'CantTotal',loo_Json.StringOf("serviciosComplementarios[j].CantTotal"))
		p_dwcomp.setitem(f_med,'CodPerDurTrat',loo_Json.IntOf("serviciosComplementarios[j].CodPerDurTrat"))
		p_dwcomp.setitem(f_med,'TipoTrans',loo_Json.IntOf("serviciosComplementarios[j].TipoTrans"))
		p_dwcomp.setitem(f_med,'ReqAcom',loo_Json.IntOf("serviciosComplementarios[j].ReqAcom"))
		p_dwcomp.setitem(f_med,'TipoIDAcomAlb',loo_Json.StringOf("serviciosComplementarios[j].TipoIDAcomAlb"))
		p_dwcomp.setitem(f_med,'NroIDAcomAlb',loo_Json.StringOf("serviciosComplementarios[j].NroIDAcomAlb"))
		p_dwcomp.setitem(f_med,'ParentAcomAlb',loo_Json.IntOf("serviciosComplementarios[j].ParentAcomAlb"))
		p_dwcomp.setitem(f_med,'NombAlb',loo_Json.StringOf("serviciosComplementarios[j].NombAlb"))
		p_dwcomp.setitem(f_med,'CodMunOriAlb',loo_Json.StringOf("serviciosComplementarios[j].CodMunOriAlb"))
		p_dwcomp.setitem(f_med,'CodMunDesAlb',loo_Json.StringOf("serviciosComplementarios[j].CodMunDesAlb"))
		p_dwcomp.setitem(f_med,'JustNoPBS',loo_Json.StringOf("serviciosComplementarios[j].JustNoPBS"))
 		p_dwcomp.setitem(f_med,'IndRec',loo_Json.StringOf("serviciosComplementarios[j].IndRec"))
		p_dwcomp.setitem(f_med,'EstJM',loo_Json.IntOf("serviciosComplementarios[j].EstJM"))
	next
	destroy loo_Json 
	if creo then
		if p_dwpres.update(TRUE,FALSE) = -1 then
			rollback;
		end if
		if p_dwmed.update(TRUE,FALSE) = -1 then
			rollback;
		end if
		if p_dwcups.update(TRUE,FALSE) = -1 then
			rollback;
		end if
		if p_dwdispo.update(TRUE,FALSE) = -1 then
			rollback;
		end if
		if p_dwnutri.update(TRUE,FALSE) = -1 then
			rollback;
		end if
		if p_dwcomp.update(TRUE,FALSE) = -1 then
			rollback;
		end if
		commit;
	end if
next
destroy loo_Json
destroy  lnv_httpclient
return 1
end function

on nvo_mipres.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_mipres.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

