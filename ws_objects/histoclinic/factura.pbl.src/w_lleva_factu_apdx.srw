$PBExportHeader$w_lleva_factu_apdx.srw
forward
global type w_lleva_factu_apdx from window
end type
type cbx_pasa from checkbox within w_lleva_factu_apdx
end type
type pb_cancel from picturebutton within w_lleva_factu_apdx
end type
type pb_acep from picturebutton within w_lleva_factu_apdx
end type
type st_1 from statictext within w_lleva_factu_apdx
end type
type dw_trae from datawindow within w_lleva_factu_apdx
end type
end forward

global type w_lleva_factu_apdx from window
integer width = 4110
integer height = 1492
boolean titlebar = true
string title = "Llevar procedimientos de Facturación a Apoyo Diagnóstico (Facturas sin Cita)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Query5!"
boolean clientedge = true
boolean center = true
cbx_pasa cbx_pasa
pb_cancel pb_cancel
pb_acep pb_acep
st_1 st_1
dw_trae dw_trae
end type
global w_lleva_factu_apdx w_lleva_factu_apdx

type variables
string ls_varfac
end variables

on w_lleva_factu_apdx.create
this.cbx_pasa=create cbx_pasa
this.pb_cancel=create pb_cancel
this.pb_acep=create pb_acep
this.st_1=create st_1
this.dw_trae=create dw_trae
this.Control[]={this.cbx_pasa,&
this.pb_cancel,&
this.pb_acep,&
this.st_1,&
this.dw_trae}
end on

on w_lleva_factu_apdx.destroy
destroy(this.cbx_pasa)
destroy(this.pb_cancel)
destroy(this.pb_acep)
destroy(this.st_1)
destroy(this.dw_trae)
end on

event open;ls_varfac=message.stringparm
end event

type cbx_pasa from checkbox within w_lleva_factu_apdx
integer x = 2290
integer y = 32
integer width = 425
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Replica Rechazo"
boolean checked = true
end type

type pb_cancel from picturebutton within w_lleva_factu_apdx
integer x = 2034
integer y = 1232
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_acep from picturebutton within w_lleva_factu_apdx
integer x = 1856
integer y = 1232
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_trae.accepttext()=-1 then return
long j,k,cuantos,filas,nnul,nfact,nitemfac,nrec,consec
boolean new_ingreso=false,lbn_pasa=true
string cemp,ccont,snul,cod,clugfac,clugrec,plan,cproceq,cmaneq,naut,clug_consec,tipo_fac,ls_area
string ls_codanul
datetime fnul
setnull(snul)
setnull(nnul)
setnull(fnul)
//solo debe llevar las facturas que no tienen cita porque el módulo de apdx tambien va  atener llevar desde citas

///PAR AVALIDAR MISMA VENTANA EN DOS ESTACIONES
ls_area=w_apoyo_diag2.i_codarea

SELECT 
	Sum(case when factcpo.servadx is null then 0 else 1 end) into :cuantos
FROM 
		factcab INNER JOIN factcpo ON (factcab.tipo = factcpo.tipo) 
		AND (factcab.clugar = factcpo.clugar) AND (factcab.nfact = factcpo.nfact)
WHERE 
		(((factcpo.tipodoc)=:tipdoc) AND ((factcpo.documento)=:docu) 
		AND ((factcab.estado) Is Null) AND ((factcpo.codaadx)=:ls_area)
		AND (factcpo.servadx is null));

if cuantos>0 then 
	messagebox("Atención",'Productos ya atendida en otra estacion')
	dw_trae.retrieve(tipdoc,docu,ls_area)
	return
End if
/////

for j= 1 to dw_trae.rowcount()
	if dw_trae.getitemnumber(j,"esco")>0 then
		cemp=dw_trae.getitemstring(j,"cemp")
		ccont=dw_trae.getitemstring(j,"ccontrato")
		if not new_ingreso or (consec<>dw_trae.getitemnumber(j,"consecutivo") and not isnull(dw_trae.getitemnumber(j,"consecutivo"))) or (clug_consec<>dw_trae.getitemstring(j,"clug_consec") and not isnull(dw_trae.getitemstring(j,"clug_consec"))) then
			consec=dw_trae.getitemnumber(j,"consecutivo")
			clug_consec=dw_trae.getitemstring(j,"clug_consec")
			if w_apoyo_diag2.new_ingre (cemp,ccont,consec,clug_consec)=-1 then return
			new_ingreso=true
		end if
		setnull(cuantos)
		cuantos=dw_trae.getitemnumber(j,"esco")
		for k=1 to cuantos
			cod=dw_trae.getitemstring(j,"proccups")
			nfact=dw_trae.getitemnumber(j,"nfact")
			clugfac=dw_trae.getitemstring(j,"clugar")
			tipo_fac=dw_trae.getitemstring(j,"tipo")
			nitemfac=dw_trae.getitemnumber(j,"nitem")
			nrec=dw_trae.getitemnumber(j,"nrcaj")
			clugrec=dw_trae.getitemstring(j,"clugar_rec")
			plan=dw_trae.getitemstring(j,"plan")
			cproceq=dw_trae.getitemstring(j,"cproced")
			cmaneq=dw_trae.getitemstring(j,"codmanual")
			naut=dw_trae.getitemstring(j,"autorizacion")
			//	p_cod,procequiv,man_eq,empresa,contrato,plan,autoriza,nfactura,clug_fac,item_fac,nreci
			//	clug_rec,item_rec,nitem_rec,ncita,clug_cita,nserv_cita,sec_cant_cit,fecha_cit,hora_cit, conta_os
			// clug_os,norden,nitem_os,facturar
			if w_apoyo_diag2.f_insert_proc(cod,cproceq,cmaneq,cemp,ccont,plan,naut,nfact,clugfac,nitemfac,nrec, &
				clugrec,nnul,nnul,nnul,snul,nnul,nnul,fnul,fnul,nnul, snul,nnul,nnul,1,tipo_fac,'','1')=-1 then
				rollback;
				enabled=false
				return
			end if
		next
	else
		if dw_trae.getitemnumber(j,"rechazar")=1 then
			if lbn_pasa then
				st_xa_anular st_anula
				datetime ldt_fhoy
				st_anula.tipo='AX'
				openwithparm (w_motiv_anula,st_anula)
				st_anula=message.powerobjectparm
				if not isValid(st_anula) then return
				ldt_fhoy=datetime(today(),now())
				if cbx_pasa.checked then
					lbn_pasa=false
				else
					lbn_pasa=true
				end if				
			end if
			
			nfact=dw_trae.getitemnumber(j,"nfact")
			clugfac=dw_trae.getitemstring(j,"clugar")
			tipo_fac=dw_trae.getitemstring(j,"tipo")
			nitemfac=dw_trae.getitemnumber(j,"nitem")
			update factcpo set cod_rech=:st_anula.motivo, usuario_rech=:usuario,motiv_rech=:st_anula.observacion,fecha_rech=:ldt_fhoy
			WHERE (((factcpo.nfact)=:nfact) AND ((factcpo.clugar)=:clugfac) AND ((factcpo.tipo)=:tipo_fac) AND ((factcpo.nitem)=:nitemfac));
		end if
	end if
next
commit;
close(parent)
end event

type st_1 from statictext within w_lleva_factu_apdx
integer x = 37
integer y = 24
integer width = 2130
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccione los procedimientos a atender en Apoyo Diagnóstico (De click sobre la casilla llevar):"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_trae from datawindow within w_lleva_factu_apdx
integer x = 32
integer y = 128
integer width = 3995
integer height = 1080
integer taborder = 10
string title = "none"
string dataobject = "dw_factura_a_apdx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
retrieve(tipdoc,docu,w_apoyo_diag2.i_codarea,ls_varfac)
end event

event itemchanged;if getcolumnname()='esco' then
	setitem(getrow(),"rechazar",'0')
end if
if getcolumnname()='rechazar' then
	setitem(getrow(),"esco",0)
end if
end event

