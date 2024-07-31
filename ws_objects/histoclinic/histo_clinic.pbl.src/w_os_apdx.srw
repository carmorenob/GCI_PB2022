$PBExportHeader$w_os_apdx.srw
$PBExportComments$lleva desde hosposd o qxosd a ap dx
forward
global type w_os_apdx from window
end type
type rb_qx from radiobutton within w_os_apdx
end type
type rb_1 from radiobutton within w_os_apdx
end type
type pb_cancel from picturebutton within w_os_apdx
end type
type pb_ok from picturebutton within w_os_apdx
end type
type st_1 from statictext within w_os_apdx
end type
type dw_trae from datawindow within w_os_apdx
end type
end forward

global type w_os_apdx from window
integer width = 3799
integer height = 1252
boolean titlebar = true
string title = "Traer Servicios para Apoyo Diagnóstico desde Ordenes de Servicio"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "os.ico"
boolean clientedge = true
boolean center = true
rb_qx rb_qx
rb_1 rb_1
pb_cancel pb_cancel
pb_ok pb_ok
st_1 st_1
dw_trae dw_trae
end type
global w_os_apdx w_os_apdx

type variables
long xant,yant
end variables

on w_os_apdx.create
this.rb_qx=create rb_qx
this.rb_1=create rb_1
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_1=create st_1
this.dw_trae=create dw_trae
this.Control[]={this.rb_qx,&
this.rb_1,&
this.pb_cancel,&
this.pb_ok,&
this.st_1,&
this.dw_trae}
end on

on w_os_apdx.destroy
destroy(this.rb_qx)
destroy(this.rb_1)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_1)
destroy(this.dw_trae)
end on

type rb_qx from radiobutton within w_os_apdx
integer x = 1029
integer y = 104
integer width = 594
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salas Quirúrgicas"
end type

event clicked;dw_trae.retrieve(tipdoc,docu,w_apoyo_diag2.i_tipoing,w_apoyo_diag2.i_codarea,'X')
end event

type rb_1 from radiobutton within w_os_apdx
integer x = 27
integer y = 104
integer width = 805
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hospitalización / Urgencias"
boolean checked = true
end type

event clicked;dw_trae.retrieve(tipdoc,docu,w_apoyo_diag2.i_tipoing,w_apoyo_diag2.i_codarea,'H')
end event

type pb_cancel from picturebutton within w_os_apdx
event mousemove pbm_mousemove
integer x = 1829
integer y = 988
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            "
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)

end event

type pb_ok from picturebutton within w_os_apdx
event mousemove pbm_mousemove
integer x = 1669
integer y = 988
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            "
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Atender Servicios de Hosp/Urg"
end type

event clicked;long j,cuantos,k, donde,cant
long nnul,nh,norden_os,nitem_os,conta_os,facturar
string snul,naut,cod,clug_os,emp,cont,err,obser
datetime fnul
st_xa_anular st_anula

setnull(nnul)
setnull(snul)
setnull(fnul)
cuantos=0
for j=1 to dw_trae.rowcount()
	if dw_trae.getitemstring(j,'rechazar')='3' then 
		st_anula.tipo='AD'
		openwithparm (w_motiv_anula,st_anula)
		st_anula=message.powerobjectparm
		if not isValid(st_anula) then return
		dw_trae.setitem(j,'estado','4')
		dw_trae.setitem(j,'cod_rech',st_anula.motivo)
		dw_trae.setitem(j,'usuario_rech',usuario)
		dw_trae.setitem(j,'motiv_rech',st_anula.observacion)
		dw_trae.setitem(j,'fecha_rech',datetime(today(),now()))
		dw_trae.setitem(j,'cod_rech',st_anula.motivo)
		cuantos ++
	end if
	err=dw_trae.getitemstring(j,"esco")
	if dw_trae.getitemstring(j,"esco")='1' and dw_trae.getitemnumber(j,"asumin")>0 then
		long alli
		if cuantos=0 then
			w_apoyo_diag2.i_contador=dw_trae.getitemnumber(j,"contador")
			w_apoyo_diag2.i_clughis=dw_trae.getitemstring(j,"clugar")
			w_apoyo_diag2.i_emp=dw_trae.getitemstring(j,'cemp')
			w_apoyo_diag2.i_cont=dw_trae.getitemstring(j,'ccontrato')
			if w_apoyo_diag2.pb_newing.event clicked()=-1 then return
			donde=1
		end if
		emp=dw_trae.getitemstring(j,'cemp')
		cont=dw_trae.getitemstring(j,'ccontrato')
		cant=dw_trae.getitemnumber(j,"asumin")
		facturar=dw_trae.getitemnumber(j,"facturar")
		cod=dw_trae.getitemstring(j,"codproced")
		naut=dw_trae.getitemstring(j,"autoriza")
		obser=dw_trae.getitemstring(j,"observaciones")
		for k=1 to cant
			conta_os=dw_trae.getitemnumber(j,"contador")
			clug_os=dw_trae.getitemstring(j,"clugar")
			norden_os=dw_trae.getitemnumber(j,"nsolicitud")
			nitem_os=dw_trae.getitemnumber(j,"item")
			//	p_cod,procequiv,man_eq,empresa,contrato,plan,autoriza,nfactura,clug_fac,item_fac,nreci
			//	clug_rec,item_rec,nitem_rec,ncita,nserv_cita,sec_cant_cit,fecha_cit,hora_cit, 
			// conta_os, clug_os, norden, nitem_os,facturar
			if w_apoyo_diag2.f_insert_proc(cod,snul,snul,emp,cont,snul,naut,nnul,snul,nnul,nnul, &
				snul,nnul,nnul,nnul,snul,nnul,nnul,fnul,fnul,conta_os,clug_os,norden_os,nitem_os,facturar,snul,obser,'1')=-1 then
				rollback;
				enabled=false
				return
			end if		
		next
		dw_trae.setitem(j,"suministrada",dw_trae.getitemnumber(j,"suministrada")+cant)
		if dw_trae.getitemnumber(j,"suministrada")>=dw_trae.getitemnumber(j,"solicitada") then 
			dw_trae.setitem(j,"en_apdx",'1')
			dw_trae.setitem(j,'estado','2')
			delete from oscpo_adx where contador=:conta_os and clugar=:clug_os 
			and nsolicitud=:norden_os and item=:nitem_os;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error actualizando oscpo_adx',err)
				return
			end if
		end if
		cuantos++
	end if
next			
if cuantos>0 then
	if dw_trae.update()=-1 then
		rollback;
		enabled=false
	else
		commit;
		close(parent)
	end if
	w_apoyo_diag2.refres_lista()
	w_apoyo_diag2.tab_1.tp_1.dw_procs.scrolltorow(1)
//	if w_apoyo_diag2.f_crear_resultados()=1 then 
//		w_apoyo_diag2.tab_1.selectedtab=2
//	end if
	w_apoyo_diag2.tab_1.tp_2.pb_insert.enabled=false
	w_apoyo_diag2.tab_1.tp_2.dw_rescpo.setfocus()
else
	messagebox("Atención","Para poder atender los servicios, debe indicar la cantidad a realizar")
end if

end event

type st_1 from statictext within w_os_apdx
integer x = 32
integer y = 20
integer width = 1047
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Procedimientos pendientes de atender:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_trae from datawindow within w_os_apdx
integer x = 27
integer y = 164
integer width = 3703
integer height = 816
integer taborder = 10
string title = "none"
string dataobject = "dw_ord_serv_pa_apdx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
retrieve(tipdoc,docu,w_apoyo_diag2.i_tipoing,w_apoyo_diag2.i_codarea,'H')
end event

event itemchanged;if accepttext()=-1 then 
	setitem(getrow(),"asumin",0)
	return 1
end if
if getcolumnname()='esco' then
	setitem(getrow(),"rechazar",'0')
end if
if getcolumnname()='rechazar' then
	setitem(getrow(),"esco",'0')
end if
end event

event losefocus;accepttext()
end event

event doubleclicked;pb_ok.event clicked()
end event

