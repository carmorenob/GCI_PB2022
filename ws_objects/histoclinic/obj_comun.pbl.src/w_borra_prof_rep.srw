$PBExportHeader$w_borra_prof_rep.srw
forward
global type w_borra_prof_rep from window
end type
type pb_1 from picturebutton within w_borra_prof_rep
end type
type sle_2 from singlelineedit within w_borra_prof_rep
end type
type sle_1 from singlelineedit within w_borra_prof_rep
end type
type st_2 from statictext within w_borra_prof_rep
end type
type st_1 from statictext within w_borra_prof_rep
end type
type pb_4 from picturebutton within w_borra_prof_rep
end type
type pb_3 from picturebutton within w_borra_prof_rep
end type
type dw_o from datawindow within w_borra_prof_rep
end type
type dw_d from datawindow within w_borra_prof_rep
end type
type pb_9 from picturebutton within w_borra_prof_rep
end type
type pb_7 from picturebutton within w_borra_prof_rep
end type
end forward

global type w_borra_prof_rep from window
integer width = 2427
integer height = 1340
boolean titlebar = true
string title = "Unificación Usuarios"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "elimi_pac.ico"
boolean center = true
pb_1 pb_1
sle_2 sle_2
sle_1 sle_1
st_2 st_2
st_1 st_1
pb_4 pb_4
pb_3 pb_3
dw_o dw_o
dw_d dw_d
pb_9 pb_9
pb_7 pb_7
end type
global w_borra_prof_rep w_borra_prof_rep

type variables
//
end variables

forward prototypes
public function integer updkardex (string ca, string artd)
end prototypes

public function integer updkardex (string ca, string artd);string alm, fecha,lote,almAnt, msg, conv
long i, f, ano, mes, anoAnt,mesAnt, fr
double cant1, cant2, saldo
uo_DataStore dw_kdo,dw_kdd,dw_kd,dw_ko,dw_lo,dw_ld,dw_mvo,dw_mvd,dw_lm, dw_reg

dw_ko = create uo_DataStore
dw_ko.DataObject = 'dw_kardexunif'
dw_ko.SetTransObject(SQLCA)

dw_kd = create uo_DataStore
dw_kd.DataObject = 'dw_kardexunif'
dw_kd.SetTransObject(SQLCA)

dw_kd.Retrieve(artd)
dw_ko.Retrieve(ca)

for i = 1 to dw_ko.RowCount()
	alm = dw_ko.GetItemString(i,'codalmacen')
	f = dw_kd.Find("codalmacen='"+alm+"'",1,dw_kd.RowCount())
	if f > 0 then
		cant1 = dw_kd.GetItemNumber(f,'SaldoActual')
		cant2 = dw_ko.GetItemNumber(i,'SaldoActual')
		if cant1 + cant2 > 0 then
			dw_kd.SetItem(f,'CostoProm',(dw_kd.GetItemNumber(f,'CostoProm')*cant1 + dw_ko.GetItemNumber(i,'CostoProm')*cant2)/(cant1+cant2) )
		end if
		dw_kd.SetItem(f,'saldoInicial',dw_kd.GetItemNumber(f,'saldoInicial') + dw_ko.GetItemNumber(i,'saldoInicial'))
		dw_kd.SetItem(f,'SaldoActual',cant1 + cant2)
	else
		f = dw_kd.InsertRow(0)
		dw_kd.SetItem(f,'codalmacen',dw_ko.GetItemString(i,'codalmacen'))
		dw_kd.SetItem(f,'codarticulo',artd)
		dw_kd.SetItem(f,'saldoInicial',dw_ko.GetItemNumber(i,'saldoInicial'))
		dw_kd.SetItem(f,'CostoPromInicial',dw_ko.GetItemNumber(i,'CostoPromInicial'))
		dw_kd.SetItem(f,'CostoProm',dw_ko.GetItemNumber(i,'CostoProm'))
		dw_kd.SetItem(f,'SaldoActual',dw_ko.GetItemNumber(i,'SaldoActual'))
	end if
next
do while dw_ko.RowCount() > 0
	dw_ko.DeleteRow(1)
loop
if dw_kd.Update() = -1 then
	Rollback;
	MessageBox("Error Kardex destino", "No se pudieron modificar/adicionar registros para "+artd)
	Return -1
end if

dw_kdo = create uo_DataStore
dw_kdo.DataObject = 'dw_kardexdetaunif'
dw_kdo.SetTransObject(SQLCA)

dw_kdd = create uo_DataStore
dw_kdd.DataObject = 'dw_kardexdetaunif'
dw_kdd.SetTransObject(SQLCA)

//dw_kdd.Retrieve(artd)
//dw_kdo.Retrieve(ca)
//for i = 1 to dw_kdo.RowCount()
//	alm = dw_kdo.GetItemString(i,'codalmacen')
//	ano = dw_kdo.GetItemNumber(i,'ano')
//	mes = dw_kdo.GetItemNumber(i,'mes')
//	f = dw_kdd.Find("codalmacen='"+alm+"' and ano="+string(ano)+" and mes="+string(mes),1,dw_kdd.RowCount())
//	if f > 0 then
//		cant1 = dw_kdd.GetItemNumber(f,'SaldoInicial') + dw_kdd.GetItemNumber(f,'EntradasCant')
//		cant2 = dw_kdo.GetItemNumber(i,'saldoInicial') + dw_kdo.GetItemNumber(i,'EntradasCant')
//		if cant1 +cant2 > 0 then
//			dw_kdd.SetItem(f,'CostoProm',(dw_kdd.GetItemNumber(f,'CostoProm')*cant1 + dw_kdo.GetItemNumber(i,'CostoProm')*cant2)/(cant1+cant2) )
//		end if
//		dw_kdd.SetItem(f,'saldoInicial',dw_kdd.GetItemNumber(f,'saldoInicial') + dw_kdo.GetItemNumber(i,'saldoInicial'))
//		dw_kdd.SetItem(f,'EntradasCant',dw_kdd.GetItemNumber(f,'EntradasCant') + dw_kdo.GetItemNumber(i,'EntradasCant'))
//		dw_kdd.SetItem(f,'EntradasValor',dw_kdd.GetItemNumber(f,'EntradasValor') + dw_kdo.GetItemNumber(i,'EntradasValor'))
//		dw_kdd.SetItem(f,'SalidasCant',dw_kdd.GetItemNumber(f,'SalidasCant') + dw_kdo.GetItemNumber(i,'SalidasCant'))
//		dw_kdd.SetItem(f,'SalidasValor',dw_kdd.GetItemNumber(f,'SalidasValor') + dw_kdo.GetItemNumber(i,'SalidasValor'))
//	else
//		f = dw_kdd.InsertRow(0)
//		dw_kdd.SetItem(f,'codalmacen',dw_kdo.GetItemString(i,'codalmacen'))
//		dw_kdd.SetItem(f,'codarticulo',artd)
//		dw_kdd.SetItem(f,'ano',ano)
//		dw_kdd.SetItem(f,'mes',mes)
//		dw_kdd.SetItem(f,'saldoInicial',dw_kdo.GetItemNumber(i,'saldoInicial'))
//		dw_kdd.SetItem(f,'CostoPromInicial',dw_kdo.GetItemNumber(i,'CostoPromInicial'))
//		dw_kdd.SetItem(f,'EntradasCant',dw_kdo.GetItemNumber(i,'EntradasCant'))
//		dw_kdd.SetItem(f,'EntradasValor',dw_kdo.GetItemNumber(i,'EntradasValor'))
//		dw_kdd.SetItem(f,'SalidasCant',dw_kdo.GetItemNumber(i,'SalidasCant'))
//		dw_kdd.SetItem(f,'SalidasValor',dw_kdo.GetItemNumber(i,'SalidasValor'))
//		dw_kdd.SetItem(f,'CostoProm',dw_kdo.GetItemNumber(i,'CostoProm'))
//	end if
//next
//if dw_kdd.Update() = -1 then
//	Rollback;
//	MessageBox("Error Kardex deta destino", "No se pudieron modificar/adicionar registros para "+artd)
//	Return -1
//end if
//do while dw_kdo.RowCount() > 0
//	dw_kdo.DeleteRow(1)
//loop

//dw_kdd.Retrieve(artd)
//for i = 1 to dw_kdd.RowCount()
//	alm = dw_kdd.GetItemString(i,'codalmacen')
//	if alm <> almAnt then
//		almAnt = alm
//	else
//		dw_kdd.SetItem(i,'saldoinicial',saldo)
//	end if
//	saldo = dw_kdd.GetItemNumber(i,'saldoinicial') + dw_kdd.GetItemNumber(i,'EntradasCant') - dw_kdd.GetItemNumber(i,'SalidasCant')
//next
//
//if dw_kdd.Update() = -1 then
//	Rollback;
//	MessageBox("Error Kardex deta destino", "No se pudieron modificar/adicionar registros para "+artd)
//	Return -1
//end if
//
dw_reg = create uo_DataStore
dw_reg.DataObject = 'dw_af_regunif'
dw_reg.SetTransObject(SQLCA)
dw_reg.Retrieve(ca)

dw_mvo = create uo_DataStore
dw_mvo.DataObject = 'dw_kardexmovunif'
dw_mvo.SetTransObject(SQLCA)
dw_mvd = create uo_DataStore
dw_mvd.DataObject = 'dw_kardexmovunif'
dw_mvd.SetTransObject(SQLCA)

dw_mvo.Retrieve(ca)

for i = 1 to dw_mvo.RowCount()
	alm = dw_mvo.GetItemString(i,'codalmacen')
	ano = dw_mvo.GetItemNumber(i,'ano')
	mes = dw_mvo.GetItemNumber(i,'mes')
	if not (alm=almAnt and ano=anoAnt and mes=mesAnt) then
		almAnt = alm
		anoAnt = ano
		mesAnt = mes
		select max(item) into :cant1 from sum_kardex_mov
		where codalmacen=:alm and codarti=:artd and ano=:ano and mes=:mes;
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			MessageBox("SQL error", msg)
			Rollback;
			Return -1
		END IF
		if isNull(cant1) then cant1 = 0
	end if
	cant1 = cant1 + 1
	f = dw_mvd.Insertrow(0)
	dw_mvd.SetItem(f,'codalmacen',alm)
	dw_mvd.SetItem(f,'codarticulo',artd)
	dw_mvd.SetItem(f,'ano',ano)
	dw_mvd.SetItem(f,'mes',mes)
	dw_mvd.SetItem(f,'item',cant1)
	dw_mvd.SetItem(f,'coddocref',dw_mvo.GetItemString(i,'coddocref'))
	dw_mvd.SetItem(f,'clugarref',dw_mvo.GetItemString(i,'clugarref'))
	dw_mvd.SetItem(f,'numdocref',dw_mvo.GetItemNumber(i,'numdocref'))
	dw_mvd.SetItem(f,'fecha',dw_mvo.GetItemDatetime(i,'fecha'))
	dw_mvd.SetItem(f,'itemref',dw_mvo.GetItemNumber(i,'itemref'))
	dw_mvd.SetItem(f,'entradacant',dw_mvo.GetItemNumber(i,'entradacant'))
	dw_mvd.SetItem(f,'salidacant',dw_mvo.GetItemNumber(i,'salidacant'))
	dw_mvd.SetItem(f,'valorunit',dw_mvo.GetItemNumber(i,'valorunit'))
	dw_mvd.SetItem(f,'cos_prom_ant',dw_mvo.GetItemNumber(i,'cos_prom_ant'))
	dw_mvd.SetItem(f,'fecha_anula',dw_mvo.GetItemDateTime(i,'fecha_anula'))
	dw_mvd.SetItem(f,'placa',dw_mvo.GetItemNumber(i,'placa'))
	dw_mvd.SetItem(f,'usuario',dw_mvo.GetItemString(i,'usuario'))
	dw_mvd.SetItem(f,'usu_anula',dw_mvo.GetItemString(i,'usu_anula'))
	if dw_reg.rowCount() > 0 then
		fr = dw_reg.Find("codalmacen_kar='"+alm+"' and codarti_kar='"+ca+"' and ano_kar="+string(ano)+" and mes_kar="+string(mes)+" and item_kar="+string(dw_mvo.GetItemNumber(i,'item')),1,dw_reg.RowCount())
		do while fr > 0 
			dw_reg.SetItem(fr,'carticulo',artd)
			dw_reg.SetItem(fr,'item_kar',dw_mvd.GetItemNumber(f,'item'))
			dw_reg.SetItem(fr,'codarti_kar',artd)
			fr = dw_reg.Find("codalmacen_kar='"+alm+"' and codarti_kar='"+ca+"' and ano_kar="+string(ano)+" and mes_kar="+string(mes)+" and item_kar="+string(dw_mvo.GetItemNumber(i,'item')),1,dw_reg.RowCount())
		loop
	end if
next
do while dw_mvo.RowCount() > 0
	dw_mvo.DeleteRow(1)
loop

if dw_mvd.Update() = -1 then
	Rollback;
	MessageBox("Error Kardex Mov", "No se pudieron modificar registros para articulo. "+artd)
	Return -1
end if
//////////
if dw_reg.Update() = -1 then
	Rollback;
	MessageBox("Error af_registro", "No se pudieron modificar registros para articulo. "+artd)
	Return -1
end if

//af_reg_compo - carticulo
Update af_reg_compo set carticulo=:artd where carticulo=:ca;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF

//////////

dw_lo = create uo_DataStore
dw_lo.DataObject = 'dw_loteunif'
dw_lo.SetTransObject(SQLCA)

dw_ld = create uo_DataStore
dw_ld.DataObject = 'dw_loteunif'
dw_ld.SetTransObject(SQLCA)

dw_ld.Retrieve(artd)
dw_lo.Retrieve(ca)

for i = 1 to dw_lo.RowCount()
	alm = dw_lo.GetItemString(i,'codalmacen')
	lote = dw_lo.GetItemString(i,'lote')
	conv = dw_lo.GetItemString(i,'convenio')
//	f = dw_ld.find("codalmacen='"+alm+"' and lote='"+lote+"' and convenio='"+conv+"'", 1, dw_ld.RowCount())
	f = dw_ld.find("codalmacen='"+alm+"' and upper(lote)='"+upper(lote)+"' and upper(convenio)='"+upper(conv)+"'", 1, dw_ld.RowCount())
	if f > 0 then
		dw_ld.SetItem(f,'cantidad',dw_ld.GetItemNumber(f,'cantidad') + dw_lo.GetItemNumber(i,'cantidad'))
	else
		f = dw_ld.InsertRow(0)
		dw_ld.SetItem(f,'codalmacen',dw_lo.GetItemString(i,'codalmacen'))
		dw_ld.SetItem(f,'codarticulo',artd)
		dw_ld.SetItem(f,'lote',dw_lo.GetItemString(i,'lote'))
		dw_ld.SetItem(f,'convenio',dw_lo.GetItemString(i,'convenio'))
		dw_ld.SetItem(f,'fecha_venc',dw_lo.GetItemdateTime(i,'fecha_venc'))
		dw_ld.SetItem(f,'cantidad',dw_lo.GetItemNumber(i,'cantidad'))
	end if
next
do while dw_lo.RowCount() > 0
	dw_lo.DeleteRow(1)
loop
if dw_ld.Update() = -1 then
	Rollback;
	MessageBox("Error lote destino", "No se pudieron modificar/adicionar registros para "+artd)
	Return -1
end if

Insert into sum_mvto_lote (codalmacen,codarticulo,lote,convenio,coddoc,clugar,numdoc,item,fecha_venc,cantidad,estado,signo,devuelto)
select codalmacen,:artd,lote,convenio,coddoc,clugar,numdoc,item,fecha_venc,cantidad,estado,signo,devuelto
from sum_mvto_lote where codarticulo=:ca;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF

Update sum_lote_mov set codarticulo=:artd where codarticulo=:ca;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF

Delete from sum_mvto_lote where codarticulo = :ca;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF

if dw_mvo.Update() = -1 then
	Rollback;
	MessageBox("Error Kardex Mov", "No se pudieron borrar registros para "+ca)
	Return -1
end if

if dw_kdo.Update() = -1 then
	Rollback;
	MessageBox("Error Kardex deta origen", "No se pudieron borrar registros para "+ca)
	Return -1
end if

if dw_lo.Update() = -1 then
	Rollback;
	MessageBox("Error lote origen", "No se pudieron borrar registros para "+ca)
	Return -1
end if

if dw_ko.Update() = -1 then
	Rollback;
	MessageBox("Error Kardex origen", "No se pudieron borrar registros para "+ca)
	Return -1
end if

Return 0

end function

on w_borra_prof_rep.create
this.pb_1=create pb_1
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_2=create st_2
this.st_1=create st_1
this.pb_4=create pb_4
this.pb_3=create pb_3
this.dw_o=create dw_o
this.dw_d=create dw_d
this.pb_9=create pb_9
this.pb_7=create pb_7
this.Control[]={this.pb_1,&
this.sle_2,&
this.sle_1,&
this.st_2,&
this.st_1,&
this.pb_4,&
this.pb_3,&
this.dw_o,&
this.dw_d,&
this.pb_9,&
this.pb_7}
end on

on w_borra_prof_rep.destroy
destroy(this.pb_1)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.dw_o)
destroy(this.dw_d)
destroy(this.pb_9)
destroy(this.pb_7)
end on

type pb_1 from picturebutton within w_borra_prof_rep
event mousemove pbm_mousemove
integer x = 2144
integer y = 356
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar Fila"
end type

event clicked;dw_o.ScrolltoRow(dw_o.Insertrow(0))

end event

type sle_2 from singlelineedit within w_borra_prof_rep
boolean visible = false
integer x = 1787
integer y = 1052
integer width = 343
integer height = 72
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;if dw_o.RowCount() = 0 then
	dw_o.InsertRow(1)
	dw_o.ScrolltoRow(1)
end if
dw_o.SetItem(dw_o.GetRow(),'codarticulo',Text)
dw_o.TriggerEvent(itemchanged!)

end event

type sle_1 from singlelineedit within w_borra_prof_rep
boolean visible = false
integer x = 1783
integer y = 220
integer width = 343
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;dw_d.SetItem(1,'codarticulo',Text)
dw_d.TriggerEvent(itemchanged!)

end event

type st_2 from statictext within w_borra_prof_rep
integer x = 78
integer y = 264
integer width = 480
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesional Orígen"
boolean focusrectangle = false
end type

type st_1 from statictext within w_borra_prof_rep
integer x = 78
integer y = 8
integer width = 1435
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesional al que se cargará datos al Unificar"
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_borra_prof_rep
event mousemove pbm_mousemove
integer x = 2149
integer y = 492
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Quitar Fila"
end type

event clicked;if dw_o.RowCount() > 0 then
	dw_o.DeleteRow(0)
end if

end event

type pb_3 from picturebutton within w_borra_prof_rep
event mousemove pbm_mousemove
integer x = 2153
integer y = 80
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar Fila"
end type

event clicked;dw_d.ScrolltoRow(dw_d.Insertrow(0))

end event

type dw_o from datawindow within w_borra_prof_rep
integer x = 69
integer y = 340
integer width = 2053
integer height = 688
integer taborder = 30
string title = "none"
string dataobject = "dw_unifi_profe"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ca,des,cg
if isNull(data) then
	ca = GetItemString(GetRow(),'codarticulo')
else
	ca = data
end if
if g_motor='postgres' then
	select 
		codprof, profe.nombre1 || case when (profe.nombre2 is not null) then ' '||profe.nombre2 else '' end || ' '||profe.apellido1|| case when (profe.apellido2 is not null) then ' '||profe.apellido2 else '' end  as nombre into :ca, :des
	from profe where codprof=:ca;	
else
	select 
		codprof, profe.nombre1 + case when (profe.nombre2 is not null) then +' '+profe.nombre2 else '' end+ ' '+profe.apellido1+ case when (profe.apellido2 is not null) then +' '+profe.apellido2 else '' end  as nombre  into :ca, :des
	from profe where codprof=:ca;
end if
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return 1
END IF

IF SQLCA.SQLCode = 100 THEN
	MessageBox("SQL error",'No se encontró el artículo con el código dado')
	Return 1
END IF
SetItem(GetRow(),'codigo',ca)
SetItem(GetRow(),'nombre',des)


end event

type dw_d from datawindow within w_borra_prof_rep
integer x = 69
integer y = 68
integer width = 2053
integer height = 148
integer taborder = 10
string title = "none"
string dataobject = "dw_unifi_profe"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;InsertRow(0)

end event

event itemchanged;string ca,des
if isNull(data) then
	ca = GetItemString(GetRow(),'codigo')
else
	ca = data
end if

if g_motor='postgres' then
	select 
		codprof, profe.nombre1 || case when (profe.nombre2 is not null) then ' '||profe.nombre2 else '' end || ' '||profe.apellido1|| case when (profe.apellido2 is not null) then ' '||profe.apellido2 else '' end  as nombre into :ca, :des
	from profe where codprof=:ca;
else
	select 
		codprof, profe.nombre1 + case when (profe.nombre2 is not null) then +' '+profe.nombre2 else '' end+ ' '+profe.apellido1+ case when (profe.apellido2 is not null) then +' '+profe.apellido2 else '' end  as nombre  into :ca, :des
	from profe where codprof=:ca;
end if
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return 1
END IF

IF SQLCA.SQLCode = 100 THEN
	MessageBox("SQL error",'No se encontró el Profe con el código dado')
	Return 1
END IF

SetItem(GetRow(),'codigo',ca)
SetItem(GetRow(),'nombre',des)


end event

type pb_9 from picturebutton within w_borra_prof_rep
event mousemove pbm_mousemove
integer x = 1152
integer y = 1060
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
string text = "                     &t"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Realizar cambio"
end type

event clicked;string usu_new,usu_old,msg
long i, j,cuantos
double cant

usu_new= dw_d.GetItemString(1,'codigo')
for i = 1 to dw_o.RowCount()
	usu_old = dw_o.GetItemString(i,'codigo')
	if usu_old = usu_new then Continue
 
	insert into espprof (  codprof,cesp, cufuncional, cccosto, uf_urg, cc_urg, uf_hosp, cc_hosp, uf_amb, cc_amb, uf_qx, cc_qx, cod_emp_cont, operacional, costos, operacional_urg, operacional_hos, operacional_amb, operacional_qx, auxenf, camillero, estado )
	SELECT 
		:usu_new, espprof.cesp, espprof.cufuncional, espprof.cccosto, espprof.uf_urg, espprof.cc_urg, espprof.uf_hosp, espprof.cc_hosp, espprof.uf_amb, espprof.cc_amb, espprof.uf_qx, espprof.cc_qx, espprof.cod_emp_cont, espprof.operacional, espprof.costos, espprof.operacional_urg, espprof.operacional_hos, espprof.operacional_amb, espprof.operacional_qx, espprof.auxenf, espprof.camillero, '1' AS estado
	FROM espprof
	WHERE (( Not (Exists (select espprof1.codprof from espprof as espprof1
				 where (((espprof1.codprof)=:usu_new) and (espprof1.cesp=espprof.cesp))
		))) AND ((espprof.codprof)=:usu_old));
	If SQLCA.SQLCode = -1 then
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	End If
	insert into agendaprof ( prof, codgc, consult, cesp,  fecha, hora, duracion, estcita, ncita, clugar, usuario, fecha_crea, prog )
	select :usu_new, agendaprof.codgc, agendaprof.consult, agendaprof.cesp, agendaprof.fecha, agendaprof.hora, agendaprof.duracion, agendaprof.estcita, agendaprof.ncita, agendaprof.clugar, agendaprof.usuario, agendaprof.fecha_crea, agendaprof.prog
	from agendaprof
	where (((agendaprof.prof)=:usu_old));
	If SQLCA.SQLCode = -1 then
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	End If
	update qxcita_proced set  prof=:usu_new where  prof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If	
	update serciosturno set  prof=:usu_new where  prof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If	
	update horario_suge set  prof=:usu_new where  prof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If	
	update odontratacpo set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If
	update evolucionhc set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If	
	update odongramacb set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		
	update historial set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		
 	update serviciosingreso set cprof=:usu_new where cprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		
 	update odontratacab set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		
 	update hclin_registro set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 	 	 	 	 	 	 	 	 	 	 	
 	update oscabeza set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		
 	update tesorecajcab set codprof =:usu_new where codprof =:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		
 	update tesorecajcab set cprof_ordena=:usu_new where cprof_ordena=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update factcab set codprof =:usu_new where codprof =:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		
 	update factcab set cprof_ordena=:usu_new where cprof_ordena=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update enf_liq_reg set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update pacientesnotas set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update pacientes_antecedente set cprof=:usu_new where cprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update pacientes_alergias set cprof=:usu_new where cprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update hosprespon set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update hc_plantilla set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update modulos_vent_plant set codprof=:usu_new where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update aperhc set cprof=:usu_new where cprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update hospsali set cprof=:usu_new where cprof=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update hospadmi set prof_recibe=:usu_new where prof_recibe=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update resultadoscpo set profesional=:usu_new where profesional=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 	update vacunadosis set profe=:usu_new where profe=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 

  	update qxcpacto set especialista=:usu_new where especialista=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 
  	update qxcpacto set anestesiologo=:usu_new where anestesiologo=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 
  	update qxcpacto set auxiliarqx=:usu_new where auxiliarqx=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 
  	update qxcpacto set circulante=:usu_new where circulante=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 
 
 	update qxcpacto set instrumenta=:usu_new where instrumenta=:usu_old;
	If SQLCA.SQLCode = -1 then
	 msg = SQLCA.SQLErrText
	 Rollback;
	 MessageBox("SQL error", msg)
	 Return -1
	End If		 

next
for i = 1 to dw_o.RowCount()
	usu_old = dw_o.GetItemString(i,'codigo')
	Delete from agendaprof where prof=:usu_old;
	If SQLCA.SQLCode = -1 then
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	End if		
	Delete from espprof where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	End if	
	Delete from profe where codprof=:usu_old;
	If SQLCA.SQLCode = -1 then
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	End if				
next
commit;
MessageBox('Información','Se realizó la unificaición con éxito')
Return 0




end event

type pb_7 from picturebutton within w_borra_prof_rep
event mousemove pbm_mousemove
integer x = 992
integer y = 1060
integer width = 146
integer height = 128
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

