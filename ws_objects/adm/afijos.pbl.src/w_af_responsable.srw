$PBExportHeader$w_af_responsable.srw
forward
global type w_af_responsable from window
end type
type dw_1 from datawindow within w_af_responsable
end type
type t1 from tab within w_af_responsable
end type
type p1 from userobject within t1
end type
type pb_nuevo from picturebutton within p1
end type
type cbx_1 from checkbox within p1
end type
type st_9 from statictext within p1
end type
type st_7 from statictext within p1
end type
type dw_req from datawindow within p1
end type
type dw_af from datawindow within p1
end type
type p1 from userobject within t1
pb_nuevo pb_nuevo
cbx_1 cbx_1
st_9 st_9
st_7 st_7
dw_req dw_req
dw_af dw_af
end type
type p2 from userobject within t1
end type
type st_8 from statictext within p2
end type
type st_5 from statictext within p2
end type
type pb_1 from picturebutton within p2
end type
type dw_sin from datawindow within p2
end type
type p2 from userobject within t1
st_8 st_8
st_5 st_5
pb_1 pb_1
dw_sin dw_sin
end type
type p3 from userobject within t1
end type
type pb_anula from picturebutton within p3
end type
type st_6 from statictext within p3
end type
type pb_2 from picturebutton within p3
end type
type dw_ct from datawindow within p3
end type
type p3 from userobject within t1
pb_anula pb_anula
st_6 st_6
pb_2 pb_2
dw_ct dw_ct
end type
type p4 from userobject within t1
end type
type pb_3 from picturebutton within p4
end type
type st_10 from statictext within p4
end type
type dw_tras from datawindow within p4
end type
type dw_af2 from datawindow within p4
end type
type p4 from userobject within t1
pb_3 pb_3
st_10 st_10
dw_tras dw_tras
dw_af2 dw_af2
end type
type t1 from tab within w_af_responsable
p1 p1
p2 p2
p3 p3
p4 p4
end type
type st_4 from statictext within w_af_responsable
end type
type em_1 from editmask within w_af_responsable
end type
type st_2 from statictext within w_af_responsable
end type
type st_1 from statictext within w_af_responsable
end type
type dw_ter from datawindow within w_af_responsable
end type
type dw_cp from datawindow within w_af_responsable
end type
type dw_cb from datawindow within w_af_responsable
end type
type dw_alm from datawindow within w_af_responsable
end type
type dw_respon from datawindow within w_af_responsable
end type
type st_3 from statictext within w_af_responsable
end type
type dw_responusu from datawindow within w_af_responsable
end type
end forward

global type w_af_responsable from window
integer width = 4681
integer height = 2256
boolean titlebar = true
string title = "Cambio Ubicación / Asignación Responsable"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_responsa.ico"
dw_1 dw_1
t1 t1
st_4 st_4
em_1 em_1
st_2 st_2
st_1 st_1
dw_ter dw_ter
dw_cp dw_cp
dw_cb dw_cb
dw_alm dw_alm
dw_respon dw_respon
st_3 st_3
dw_responusu dw_responusu
end type
global w_af_responsable w_af_responsable

type variables
datawindowchild idw_f,dwc_alm,dwc_lugar
boolean b1, b2, b3, b4
string ls_asel

end variables

forward prototypes
public function integer sum_traslado ()
public function integer update_ori (string coddoc, string lugar, double numdoc, double item, double cantidad)
public function integer f_anulatraslado (string coddoc, string lugar, double numdoc, long item)
public function integer f_update_ori (string coddoc, string lugar, long numdoc, long item, double cantidad)
end prototypes

public function integer sum_traslado ();string alm_ori, alm_dest, codarticulo
long fa, fn
double nd

//if dw_respon.RowCount() = 1 then // Primera asignación
//	alm_ori = dw_placa.GetItemString(1,'codalmacen_kar')
//	fn = 1
//else
//	fn = dw_respon.Find("estado='0'",1,dw_respon.RowCount())
//	if fn > 0 then
//		fa = dw_respon.Find("estado='1'",1,dw_respon.RowCount())
//		alm_ori = dw_respon.GetItemString(fa,'codalmacen')
//	end if
//end if
//nd = f_trae_ndoc('ST',clugar,'Traslados')
//if nd < 1 then Return -1
//dw_cb.InsertRow(1)
//dw_cb.SetItem(1,'coddoc','ST')
//dw_cb.SetItem(1,'clugar',clugar)
//dw_cb.SetItem(1,'numdoc',nd)
//dw_cb.SetItem(1,'codalmacen',dw_af.GetItemString())
//dw_cb.SetItem(1,'codalmacen_target',dw_respon.GetItemString(fn,'codalmacen'))
//dw_cb.SetItem(1,'fecha',dw_respon.GetItemDateTime(fn,'fechaasignacion'))
//dw_cb.SetItem(1,'estado','1')
//dw_cb.SetItem(1,'usuario',usuario)

dw_cp.Insertrow(1)

Return 0

end function

public function integer update_ori (string coddoc, string lugar, double numdoc, double item, double cantidad);double nd, it
dec atendido, devuelto, solicitado, valor
string cd,cl,codarticulo, msg
long f,i
uo_DataStore dw_ltr

select codarticulo,cantidad,atendido,coddoc_ori,clugar_ori,numdoc_ori,item_ori into :codarticulo,:solicitado,:atendido,:cd,:cl,:nd,:it 
from sum_mvto_cpo
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and item=:item;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error leyendo sum_mvto_cpo", msg)
	Return -1
elseif SQLCA.SQLCode = 100 THEN
	Rollback;
	MessageBox("Atención", 'No se encuentra el registro origen. Doc:'+string(numdoc)+' item:'+string(item))
	Return -1
END IF

if isNull(atendido) then atendido = 0
if atendido + cantidad > solicitado then
	Rollback;
	Messagebox('Aviso','La cantidad excede lo solicitado. Articulo: '+codarticulo)
	Return -1
end if
valor = round(atendido + cantidad ,2)
update sum_mvto_cpo set atendido = :valor // acumula Devuelto
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and item=:item;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error actualizando sum_mvto_cpo.atendido", msg)
	Return -1
END IF

select count(*) into :atendido from sum_mvto_cpo
where coddoc=:coddoc and clugar=:clugar and numdoc=:numdoc and cantidad <> atendido;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error leyendo count(*) into :atendido from sum_mvto_cpo", msg)
	Return -1
END IF
if atendido = 0 then
	update sum_mvto_cab set estado = '3'
	where coddoc=:coddoc and clugar=:clugar and numdoc=:numdoc;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error actualizando sum_mvto_cab set estado = '3'", msg)
		Return -1
	END IF
elseif atendido > 0 then
	update sum_mvto_cab set estado = '1'
	where coddoc=:coddoc and clugar=:clugar and numdoc=:numdoc;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error actualizando sum_mvto_cab set estado = '1'", msg)
		Return -1
	END IF
end if
Return 0

end function

public function integer f_anulatraslado (string coddoc, string lugar, double numdoc, long item);uo_dataStore dw_kardex, dw_kardexmov
decimal cProm, saldo, cPromIni, valor, cPromAnt, saldokd

dw_kardex = Create uo_dataStore
dw_kardex.DataObject = 'dw_kardex'
dw_kardex.SetTransObject(SQLCA)

dw_kardexmov = Create uo_dataStore
dw_kardexmov.DataObject = 'dw_kardexmov'
dw_kardexmov.SetTransObject(SQLCA)


// Reversa Salidas de Kardex
string codarticulo, alm_origen, alm_target
long fk, fila
Datetime fec
double cantidad

select codalmacen, codalmacen_target into :alm_origen, :alm_target from sum_mvto_cab
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc;

dw_kardexmov.Retrieve(coddoc,Lugar,numdoc,alm_origen)
fk = dw_kardexmov.Find('item='+string(item),1,dw_kardexmov.RowCount())
if fk > 0 then
	codarticulo = dw_kardexmov.GetItemString(fk,'codarti')
	cantidad = dw_kardexmov.GetItemNumber(fk,'salidacant')
	fec = dw_kardexmov.GetItemDateTime(fk,'fecha_anula')
	if (cantidad = 0) or (not isNull(fec)) then Return -1
	cPromIni = dw_kardexmov.GetItemNumber(fk,'valorunit')
	dw_kardexmov.SetItem(fk,'entradacant', cantidad)
	dw_kardexmov.SetItem(fk,'fecha_anula', datetime(today(),now()))
	dw_kardexmov.SetItem(fk,'usu_anula', usuario)

	fila = dw_kardex.Retrieve(alm_origen,codarticulo) 
	if fila = 1 then
		if dw_kardex.GetItemNumber(fila,'saldoActual') + cantidad > 0 then
			dw_kardex.SetItem(fila,'costoprom', round((dw_kardex.GetItemNumber(fila,'costoprom') * dw_kardex.GetItemNumber(fila,'saldoActual') + cPromIni*cantidad)/ (dw_kardex.GetItemNumber(fila,'saldoActual') + cantidad),2))
		end if
		dw_kardex.SetItem(1,'saldoactual',dw_kardex.GetItemNumber(1,'saldoActual') + cantidad)
		if dw_kardex.Update() = -1 then
			Rollback;
			MessageBox('Atención','Error Actualizando Kardex. Art.'+codarticulo+'.' + SQLCA.SQLErrText)
			Return -1
		end if
	else
		Rollback;
		messageBox('Error','Inconsistencia en Kardex con el artículo ' + codarticulo + ' en almacen ' + alm_origen )
		Return -1
	End if

end if

if dw_kardexmov.Update() = -1 then
	Rollback;
	Return -1
end if

dw_kardexmov.Retrieve(coddoc,Lugar,numdoc,alm_target)

fk = dw_kardexmov.Find('item='+string(item),1,dw_kardexmov.RowCount())
if fk > 0 then
	codarticulo = dw_kardexmov.GetItemString(fk,'codarti')
	cantidad = dw_kardexmov.GetItemNumber(fk,'entradacant')
	fec = dw_kardexmov.GetItemDateTime(fk,'fecha_anula')
	if (cantidad = 0) or (not isNull(fec)) then Return -1
	cPromIni = dw_kardexmov.GetItemNumber(fk,'valorunit')
	dw_kardexmov.SetItem(fk,'salidacant', cantidad)
	dw_kardexmov.SetItem(fk,'fecha_anula', datetime(today(),now()))
	dw_kardexmov.SetItem(fk,'usu_anula', usuario)

	fila = dw_kardex.Retrieve(alm_target,codarticulo) 
	if fila = 1 then
		if dw_kardex.GetItemNumber(fila,'saldoActual') - cantidad > 0 then
			dw_kardex.SetItem(fila,'costoprom', round((dw_kardex.GetItemNumber(fila,'costoprom') * dw_kardex.GetItemNumber(fila,'saldoActual') - cPromIni*cantidad)/ (dw_kardex.GetItemNumber(fila,'saldoActual') - cantidad),2))
		end if
		dw_kardex.SetItem(1,'saldoactual',dw_kardex.GetItemNumber(1,'saldoActual') - cantidad)
		if dw_kardex.Update() = -1 then
			Rollback;
			MessageBox('Atención','Error Actualizando Kardex. Art.'+codarticulo+'.' + SQLCA.SQLErrText)
			Return -1
		end if
	else
		Rollback;
		messageBox('Error','Inconsistencia en Kardex con el artículo ' + codarticulo + ' en almacen ' + alm_target )
		Return -1
	End if

end if

if dw_kardexmov.Update() = -1 then
	Rollback;
	Return -1
end if

Return 0

end function

public function integer f_update_ori (string coddoc, string lugar, long numdoc, long item, double cantidad);double nd, it
dec atendido, devuelto, solicitado, valor, atendido_tras
string cd,cl,codarticulo, msg
long f,i
uo_DataStore dw_ltr

select coddoc_ori, clugar_ori, numdoc_ori, item_ori, atendido 
into :cd, :cl, :nd, :it, :atendido_tras
from sum_mvto_cpo
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and item=:item;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error leyendo sum_mvto_cpo", msg)
	Return -1
elseif SQLCA.SQLCode = 100 THEN
	Rollback;
	MessageBox("Atención", 'No se puede determinar el registro origen. Doc:'+string(numdoc)+' item:'+string(item))
	Return -1
END IF
if isNull(atendido_tras) then atendido_tras = 0
select codarticulo, cantidad, atendido
into :codarticulo, :solicitado, :atendido
from sum_mvto_cpo
where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error leyendo sum_mvto_cpo", msg)
	Return -1
elseif SQLCA.SQLCode = 100 THEN
	Rollback;
	MessageBox("Atención", 'No se encuentra el registro origen. Doc:'+string(numdoc)+' item:'+string(item))
	Return -1
END IF


if isNull(atendido) then atendido = 0
if atendido + cantidad > solicitado then
	Rollback;
	Messagebox('Aviso','La cantidad excede lo solicitado. Articulo: '+codarticulo)
	Return -1
end if
if atendido + cantidad < 0 then
	Rollback;
	Messagebox('Aviso','Atendido resultaría negativo. Articulo: '+codarticulo)
	Return -1
end if
valor = round(atendido + cantidad ,2)
update sum_mvto_cpo set atendido = :valor // acumula Devuelto
where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error actualizando sum_mvto_cpo.atendido", msg)
	Return -1
END IF

atendido_tras = atendido_tras - cantidad
update sum_mvto_cpo set atendido = atendido_tras // Para que se vea en el traslado que se anuló ese item
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and item=:item;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error actualizando sum_mvto_cpo.atendido", msg)
	Return -1
END IF


select count(*) into :atendido from sum_mvto_cpo
where coddoc=:cd and clugar=:cl and numdoc=:nd and cantidad <> atendido;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error leyendo count(*) into :atendido from sum_mvto_cpo", msg)
	Return -1
END IF
if atendido = 0 then
	update sum_mvto_cab set estado = '3'
	where coddoc=:cd and clugar=:cl and numdoc=:nd;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error actualizando sum_mvto_cab set estado = '3'", msg)
		Return -1
	END IF
elseif atendido > 0 then
	update sum_mvto_cab set estado = '1'
	where coddoc=:cd and clugar=:cl and numdoc=:nd;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error actualizando sum_mvto_cab set estado = '1'", msg)
		Return -1
	END IF
end if
Return 0

end function

on w_af_responsable.create
this.dw_1=create dw_1
this.t1=create t1
this.st_4=create st_4
this.em_1=create em_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_ter=create dw_ter
this.dw_cp=create dw_cp
this.dw_cb=create dw_cb
this.dw_alm=create dw_alm
this.dw_respon=create dw_respon
this.st_3=create st_3
this.dw_responusu=create dw_responusu
this.Control[]={this.dw_1,&
this.t1,&
this.st_4,&
this.em_1,&
this.st_2,&
this.st_1,&
this.dw_ter,&
this.dw_cp,&
this.dw_cb,&
this.dw_alm,&
this.dw_respon,&
this.st_3,&
this.dw_responusu}
end on

on w_af_responsable.destroy
destroy(this.dw_1)
destroy(this.t1)
destroy(this.st_4)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_ter)
destroy(this.dw_cp)
destroy(this.dw_cb)
destroy(this.dw_alm)
destroy(this.dw_respon)
destroy(this.st_3)
destroy(this.dw_responusu)
end on

event resize;t1.resize((newwidth - 50) , (newheight * 0.80))
//t1.p1.dw_cpo.resize((newwidth - 300 ),772)
//t1.p1.pb_borrar.x=t1.p1.dw_cpo.width+t1.p1.dw_cpo.x+20
//t1.p1.dw_comp.resize((newwidth - 300 ),544)
//t1.p1.pb_inscomp.x=t1.p1.dw_comp.width+t1.p1.dw_comp.x+20
//t1.p1.pb_delcomp.x=t1.p1.dw_comp.width+t1.p1.dw_comp.x+20
//
//t1.p2.dw_kardexmov.resize((newwidth - 100 ),(t1.height *0.73))

st_1.y=t1.y+t1.height+30
dw_ter.y=st_1.y+68

st_4.y=t1.y+t1.height+30
em_1.y=t1.y+t1.height+98
end event

type dw_1 from datawindow within w_af_responsable
integer x = 41
integer y = 12
integer width = 1326
integer height = 132
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar_sumi"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
dw_1.GetChild('codlugar', dwc_lugar)
dwc_lugar.settransobject(sqlca)
dw_alm.SetTransObject(SQLCA)
dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)

if dwc_lugar.retrieve(USUARIO)= 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(1)
else
	if dwc_alm.Retrieve(usuario,'%',clugar) = 0 then
		messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
		dwc_alm.InsertRow(0)
	end if
	dw_alm.setitem(1,'codalmacen','')
	dw_alm.InsertRow(1)
end if
dwc_lugar.insertrow(1)

end event

event itemchanged;string ls_clugar
ls_clugar=data
dw_alm.setitem(row,'codalmacen','')
if dwc_alm.Retrieve(usuario,'%',ls_clugar) = 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(0)
end if

end event

type t1 from tab within w_af_responsable
event create ( )
event destroy ( )
integer x = 46
integer y = 148
integer width = 4567
integer height = 1776
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
p1 p1
p2 p2
p3 p3
p4 p4
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.p3=create p3
this.p4=create p4
this.Control[]={this.p1,&
this.p2,&
this.p3,&
this.p4}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
destroy(this.p3)
destroy(this.p4)
end on

event selectionchanged;if isNull(dw_alm.GetItemString(1,1)) then Return 0
em_1.DisplayOnly = FALSE
em_1.DropDownCalendar = TRUE
if newindex = 1 and not b1 then
	t1.p1.dw_req.Retrieve(dw_alm.GetItemString(1,1))
	t1.p1.dw_af.Modify("selec.protect='0~tif(asignado=~~'1~~' and codalmacen=~~'"+dw_alm.GetItemString(1,1)+"~~',1,0)'")
	b1 = TRUE
elseif newindex = 2 and not b2 then
	t1.p2.dw_sin.Retrieve(dw_alm.GetItemString(1,1))
	b2 = TRUE
elseif newindex = 3 and not b3 then
	t1.p3.dw_ct.Retrieve(dw_alm.GetItemString(1,1))
	b3 = TRUE
elseif newindex = 4 and not b4 then
	t1.p4.dw_tras.Retrieve(dw_alm.GetItemString(1,1))
	b4 = TRUE
	em_1.DisplayOnly = TRUE
	em_1.DropDownCalendar = FALSE
end if

end event

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4530
integer height = 1648
long backcolor = 67108864
string text = "Requisiciones"
long tabtextcolor = 33554432
string picturename = "copiar.ico"
long picturemaskcolor = 536870912
pb_nuevo pb_nuevo
cbx_1 cbx_1
st_9 st_9
st_7 st_7
dw_req dw_req
dw_af dw_af
end type

on p1.create
this.pb_nuevo=create pb_nuevo
this.cbx_1=create cbx_1
this.st_9=create st_9
this.st_7=create st_7
this.dw_req=create dw_req
this.dw_af=create dw_af
this.Control[]={this.pb_nuevo,&
this.cbx_1,&
this.st_9,&
this.st_7,&
this.dw_req,&
this.dw_af}
end on

on p1.destroy
destroy(this.pb_nuevo)
destroy(this.cbx_1)
destroy(this.st_9)
destroy(this.st_7)
destroy(this.dw_req)
destroy(this.dw_af)
end on

type pb_nuevo from picturebutton within p1
integer x = 3995
integer y = 700
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Atender con activos seleccionados"
end type

event clicked;if dw_req.RowCount() < 1 then Return 0
long i, item, f, ff, fu, cuenta = 0
string placa, alm_ori, codarticulo, msg
double nd,cprom
datetime fecha, l_fecha,ld_fechaserv

dw_cb.Reset()
dw_cp.Reset()
dw_respon.Reset()
dw_responusu.Reset()
for i = 1 to dw_af.RowCount()
	if dw_af.GetItemNumber(i,'selec') = 1 then cuenta = cuenta + 1
next
if cuenta = 0 then Return 0
if isNull(dw_ter.GetItemString(1,'documento')) then
	messageBox('Atención','No ha seleccionado un tercero responsable de los activos')
	Return -1
end if
	
if cuenta > dw_req.GetItemNumber(dw_req.GetRow(),'cantidad') - dw_req.GetItemNumber(dw_req.GetRow(),'atendido') then
	messageBox('Atención','Ha seleccionado más activos de los requeridos')
	Return -1
end if
em_1.GetData(fecha)
if isNull(fecha) then
	messageBox('Atención','Debe establecer la fecha de traslado')
	Return -1
elseif fecha < dw_req.GetItemDateTime(dw_req.GetRow(),'fecha') then
	if date(fecha) = date(dw_req.GetItemDateTime(dw_req.GetRow(),'fecha')) then
		fecha = dw_req.GetItemDateTime(dw_req.GetRow(),'fecha')
	else
		messageBox('Atención','La fecha de traslado no puede ser menor a la fecha de la requisición '+string(dw_req.GetItemDateTime(dw_req.GetRow(),'fecha')))	
		Return -1	
	end if
end if
if MessageBox('Atención','Desea atender la requisición y asignar a '+dw_ter.GetItemString(1,'tercero')+ ' con fecha '+string(fecha,'dd/mm/yyyy')+' ?.~r~nNo podrá deshacer los cambios',QUESTION!,YESNO!) > 1 then Return 0


for i = 1 to dw_af.RowCount()
	if dw_af.GetItemNumber(i,'selec') = 0 then Continue
	placa = dw_af.GetItemString(i,'placa')
	select count(*) into :cuenta from af_respon where placa=:placa and (estado ='1' or estado='2') and fechaasignacion > :fecha;
	if cuenta > 0 then
		Rollback;
		MessageBox('Atención','Existe una asignación con fecha posterior para la placa '+placa)
		Return -1
	end if
	
	select min(fechaasignacion ) into :ld_fechaserv from af_respon where placa=:placa and (estado ='1' or estado='2');

	codarticulo = dw_af.GetItemString(i,'codarticulo')
	alm_ori = dw_af.GetItemString(i,'codalmacen')
	select max(item) into :item from af_respon where placa=:placa;
	if isNull(item) then item = 0
	dw_respon.insertRow(1)
	dw_respon.SetRow(1)
	dw_respon.SetItem(1,'placa',placa)
	dw_respon.SetItem(1,'item',item + 1)
	dw_respon.SetItem(1,'fechaasignacion',fecha)
	dw_respon.SetItem(1,'usuario',usuario)
	dw_respon.SetItem(1,'estado','1')
	dw_respon.SetItem(1,'codalmacen',dw_req.GetItemString(dw_req.GetRow(),'codalmacen'))
	l_fecha = datetime(RelativeDate(date(fecha), -1))
	update af_respon set fechatraslado = :fecha, estado='2' where placa=:placa and estado='1';
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error", msg)
		Return -1
	END IF

	dw_responusu.insertRow(1)
	dw_responusu.SetRow(1)
	dw_responusu.SetItem(1,'placa',placa)
	dw_responusu.SetItem(1,'item',item + 1)
	dw_responusu.SetItem(1,'nrespon',1)
	dw_responusu.SetItem(1,'fechaasignacion',fecha)
	dw_responusu.SetItem(1,'tipodoc',dw_ter.GetItemString(1,'tipodoc'))
	dw_responusu.SetItem(1,'documento',dw_ter.GetItemString(1,'documento'))
	dw_responusu.SetItem(1,'usuario',usuario)
	dw_responusu.SetItem(1,'estado','1')
	update af_respon_usu set fechatraslado = :fecha, estado = '2' where placa=:placa and estado='1';
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error actualizando fecha traslado", msg)
		Return -1
	END IF
		update af_registro_cpo set asignado = '1', fechaservicio=:ld_fechaserv  where placa=:placa;
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error Actualizando estado asignado", msg)
		Return -1
	END IF
///////////////////  Crea Traslados  ///////////////////
	f = dw_cb.Find("codalmacen='"+dw_af.GetItemString(i,'codalmacen')+"'",1,dw_cb.RowCount())
	if f = 0 then
		nd = f_trae_ndoc('ST',clugar,'Traslados')
		if nd < 1 then Return -1
		f = dw_cb.InsertRow(0)
		dw_cb.SetItem(f,'coddoc','ST')
		dw_cb.SetItem(f,'clugar',clugar)
		dw_cb.SetItem(f,'numdoc',nd)
		dw_cb.SetItem(f,'codalmacen',alm_ori)
		dw_cb.SetItem(f,'codalmacen_target',dw_req.GetItemString(dw_req.GetRow(),'codalmacen'))
		dw_cb.SetItem(f,'fecha',fecha)
		dw_cb.SetItem(f,'estado','1')
		dw_cb.SetItem(f,'usuario',usuario)
	end if
	ff = dw_cp.InsertRow(0)
	dw_cp.SetItem(ff,'coddoc',dw_cb.GetItemString(f,'coddoc'))
	dw_cp.SetItem(ff,'clugar',dw_cb.GetItemString(f,'clugar'))
	dw_cp.SetItem(ff,'numdoc',dw_cb.GetItemNumber(f,'numdoc'))
	dw_cp.SetItem(ff,'item',long(dw_cp.Describe("Evaluate('max(item)',0)")) + 1)
	dw_cp.SetItem(ff,'codarticulo',dw_af.GetItemString(i,'codarticulo'))
	dw_cp.SetItem(ff,'cantidad',1)
	dw_cp.SetItem(ff,'codarticulo',dw_req.GetItemString(dw_req.GetRow(),'codarticulo'))
	dw_cp.SetItem(ff,'codgenerico',dw_req.GetItemString(dw_req.GetRow(),'codgenerico'))
	dw_cp.SetItem(ff,'coddoc_ori',dw_req.GetItemString(dw_req.GetRow(),'coddoc'))
	dw_cp.SetItem(ff,'clugar_ori',dw_req.GetItemString(dw_req.GetRow(),'clugar'))
	dw_cp.SetItem(ff,'numdoc_ori',dw_req.GetItemNumber(dw_req.GetRow(),'numdoc'))
	dw_cp.SetItem(ff,'item_ori',dw_req.GetItemNumber(dw_req.GetRow(),'item'))
	dw_cp.SetItem(ff,'justificacion',dw_af.GetItemString(i,'placa'))
	dw_cp.SetItem(ff,'estado','1')
	select costoprom into :cprom from sum_kardex where codalmacen=:alm_ori and codarticulo=:codarticulo;
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error", msg)
		Return -1
	END IF
	dw_cp.SetItem(ff,'valor_unit',cprom)	

	dw_respon.SetItem(1,'coddoc_tras',dw_cp.GetItemString(ff,'coddoc'))
	dw_respon.SetItem(1,'clugar_tras',dw_cp.GetItemString(ff,'clugar'))
	dw_respon.SetItem(1,'numdoc_tras',dw_cp.GetItemNumber(ff,'numdoc'))
	dw_respon.SetItem(1,'item_tras',dw_cp.GetItemNumber(ff,'item'))

next
if dw_cb.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if dw_cp.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if dw_respon.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if dw_responusu.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

for i = 1 to dw_cp.RowCount()
	f = dw_cb.Find("numdoc="+string(dw_cp.GetItemNumber(i,'numdoc')),1,dw_cb.RowCount())
	if f > 0 then 
		if f_kardexsalida(dw_cb.GetItemString(f,'codalmacen'),dw_cp.GetItemString(i,'codarticulo'),dw_cp.GetItemNumber(i,'cantidad'),dw_cp.GetItemString(i,'coddoc'),dw_cp.GetItemString(i,'clugar'),dw_cp.GetItemNumber(i,'numdoc'),dw_cp.GetItemNumber(i,'item'),dw_cb.GetItemDateTime(f,'fecha')) = -1 then
			Rollback;
			Return -1
		end if
		if f_kardexentrada(dw_cb.GetItemString(f,'codalmacen_target'),dw_cp.GetItemString(i,'codarticulo'),dw_cp.GetItemNumber(i,'cantidad'),dw_cp.GetItemString(i,'coddoc'),dw_cp.GetItemString(i,'clugar'),dw_cp.GetItemNumber(i,'numdoc'),dw_cp.GetItemNumber(i,'item'),dw_cp.GetItemNumber(i,'valor_unit'),0,dw_cb.GetItemDateTime(f,'fecha')) = -1 then
			Rollback;
			Return -1
		end if
	end if
	if update_ori(dw_cp.GetItemString(i,'coddoc_ori'),dw_cp.GetItemString(i,'clugar_ori'),dw_cp.GetItemNumber(i,'numdoc_ori'),dw_cp.GetItemNumber(i,'item_ori'),dw_cp.GetItemNumber(i,'cantidad')) = -1 then
		Rollback;
		Return -1
	end if
next
commit;
dw_cb.ResetUpdate()
dw_cp.ResetUpdate()
dw_respon.ResetUpdate() 
dw_responusu.ResetUpdate()
msg = ''
for i = 1 to dw_cb.RowCount()
	msg = msg + string(dw_cb.GetItemNumber(i,'numdoc')) +'  '
	if cbx_1.checked then		
		if dw_cb.RowCount() < 1 then Return
		any param[10]
		param[1] = dw_cb.GetItemString(i,'coddoc')
		param[2] = dw_cb.GetItemString(i,'clugar')
		param[3] = dw_cb.GetItemNumber(i,'numdoc')
		f_reporte(dw_cb.GetItemString(i,'coddoc'),"Traslados de Activos",param)
	end if
next
if dw_cb.RowCount() = 1 then
	MessageBox('Atención','Se creó traslado '+msg)
else
	MessageBox('Atención','Se crearon traslados '+msg)
end if
dw_alm.TriggerEvent(itemchanged!)
Return 0

end event

type cbx_1 from checkbox within p1
integer x = 3995
integer y = 836
integer width = 466
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir Traslado"
boolean checked = true
end type

type st_9 from statictext within p1
integer x = 46
integer y = 628
integer width = 1083
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos con los que puede atender la requisición"
boolean focusrectangle = false
end type

type st_7 from statictext within p1
integer x = 3995
integer y = 952
integer width = 535
integer height = 532
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Atiende requisiciones hechas por el almacén seleccionado. Los activos seleccionados se asignan al tercero escogido y se genera TRASLADO de suministros"
boolean focusrectangle = false
end type

type dw_req from datawindow within p1
integer x = 46
integer y = 24
integer width = 4389
integer height = 592
integer taborder = 50
string title = "none"
string dataobject = "dw_af_req_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event rowfocuschanged;dw_af.Reset()
if RowCount() < 1 then Return 0
dw_af.Modify("selec.protect='0~tif(asignado=~~'1~~' and codalmacen=~~'"+GetItemString(GetRow(),'codalmacen')+"~~',1,0)'")
dw_af.Retrieve(ls_asel,GetItemString(GetRow(),'codarticulo'))
end event

type dw_af from datawindow within p1
integer x = 46
integer y = 704
integer width = 3899
integer height = 928
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_existxarticulo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 4530
integer height = 1648
long backcolor = 67108864
string text = "Activos sin Asignar"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
st_8 st_8
st_5 st_5
pb_1 pb_1
dw_sin dw_sin
end type

on p2.create
this.st_8=create st_8
this.st_5=create st_5
this.pb_1=create pb_1
this.dw_sin=create dw_sin
this.Control[]={this.st_8,&
this.st_5,&
this.pb_1,&
this.dw_sin}
end on

on p2.destroy
destroy(this.st_8)
destroy(this.st_5)
destroy(this.pb_1)
destroy(this.dw_sin)
end on

type st_8 from statictext within p2
integer x = 731
integer y = 1508
integer width = 2098
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Para asignar activos que ingresan por Saldos Iniciales o Ajustes y que se dejan en el mismo almacén. Se crea asignación al tercero escogido y No se genera Traslado en suministros"
boolean focusrectangle = false
end type

type st_5 from statictext within p2
integer x = 2085
integer y = 1248
integer width = 731
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_1 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Asignar a almacen y tercero activos"
integer x = 4247
integer y = 48
integer width = 142
integer height = 124
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Asignar a almacen y tercero activos"
end type

event clicked;if dw_sin.RowCount() < 1 then Return 0
long i, item, f, ff, fu
string placa, alm_ori, codarticulo, msg
double nd,cprom
datetime fecha

dw_respon.Reset()
dw_responusu.Reset()

if dw_sin.Find("selec=1",1,dw_sin.RowCount()) = 0 then Return 0
if isNull(dw_ter.GetItemString(1,'documento')) then
	messageBox('Atención','No ha seleccionado un tercero responsable de los activos')
	Return -1
end if

em_1.GetData(fecha)
if isNull(fecha) then
	messageBox('Atención','Debe establecer la fecha de traslado')
	Return -1
end if
if MessageBox('Atención','Desea asignar a '+dw_ter.GetItemString(1,'tercero')+ ' con fecha '+string(fecha,'dd/mm/yyyy')+' ?.~r~n No podrá deshacer los cambios',QUESTION!,YESNO!) > 1 then Return 0

for i = 1 to dw_sin.RowCount()
	if dw_sin.GetItemNumber(i,'selec') = 0 then Continue
	placa = dw_sin.GetItemString(i,'placa')
	alm_ori = dw_sin.GetItemString(i,'codalmacen')
	select max(item) into :item from af_respon where placa=:placa;
	if isNull(item) then item = 0
	dw_respon.insertRow(1)
	dw_respon.SetRow(1)
	dw_respon.SetItem(1,'placa',placa)
	dw_respon.SetItem(1,'item',item + 1)
	dw_respon.SetItem(1,'fechaasignacion',fecha)
	dw_respon.SetItem(1,'usuario',usuario)
	dw_respon.SetItem(1,'estado','1')
	dw_respon.SetItem(1,'codalmacen',dw_alm.GetItemString(1,'codalmacen'))
	update af_respon set fechatraslado = :fecha, estado='2' where placa=:placa and estado='1';
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF

	dw_responusu.insertRow(1)
	dw_responusu.SetRow(1)
	dw_responusu.SetItem(1,'placa',placa)
	dw_responusu.SetItem(1,'item',item + 1)
	dw_responusu.SetItem(1,'nrespon',1)
	dw_responusu.SetItem(1,'fechaasignacion',fecha)
	dw_responusu.SetItem(1,'tipodoc',dw_ter.GetItemString(1,'tipodoc'))
	dw_responusu.SetItem(1,'documento',dw_ter.GetItemString(1,'documento'))
	dw_responusu.SetItem(1,'usuario',usuario)
	dw_responusu.SetItem(1,'estado','1')
	update af_respon_usu set fechatraslado = :fecha, estado = '2' where placa=:placa and estado='1';
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
	update af_registro_cpo set asignado='1' where placa=:placa;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
next
if dw_respon.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if dw_responusu.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

commit;
dw_respon.ResetUpdate() 
dw_responusu.ResetUpdate()
dw_alm.TriggerEvent(itemchanged!)
Return 0

end event

type dw_sin from datawindow within p2
integer x = 46
integer y = 48
integer width = 4128
integer height = 1440
integer taborder = 50
string title = "none"
string dataobject = "dw_af_sinasignar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanged;st_5.Text = 'Registro ' +string(GetRow()) +' de '+string(RowCount())

end event

type p3 from userobject within t1
integer x = 18
integer y = 112
integer width = 4530
integer height = 1648
long backcolor = 67108864
string text = "Cambio Tercero"
long tabtextcolor = 33554432
string picturename = "cambia_doc.ico"
long picturemaskcolor = 536870912
pb_anula pb_anula
st_6 st_6
pb_2 pb_2
dw_ct dw_ct
end type

on p3.create
this.pb_anula=create pb_anula
this.st_6=create st_6
this.pb_2=create pb_2
this.dw_ct=create dw_ct
this.Control[]={this.pb_anula,&
this.st_6,&
this.pb_2,&
this.dw_ct}
end on

on p3.destroy
destroy(this.pb_anula)
destroy(this.st_6)
destroy(this.pb_2)
destroy(this.dw_ct)
end on

type pb_anula from picturebutton within p3
event mousemove pbm_mousemove
integer x = 4155
integer y = 192
integer width = 142
integer height = 124
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Anular asignación"
end type

event clicked;if dw_ct.RowCount() < 1 then Return 0
string placa, cd, cl, msg
long i, nasigna, nusu, nasigna_ant, nusu_ant, fu, fr
double nd, it

dw_respon.Reset()
dw_responusu.Reset()

if dw_ct.Find("selec=1",1,dw_ct.RowCount()) = 0 then Return 0
if messageBox('Atención','Está seguro de anular las asignaciones seleccionadas?',QUESTION!,YESNO!) = 2 then Return 0

for i = 1 to dw_ct.RowCount()
	if dw_ct.GetItemNumber(i,'selec') = 0 then Continue
	placa = dw_ct.GetItemString(i,'placa')
	nasigna = dw_ct.GetItemNumber(i,'item')
	nusu = dw_ct.GetItemNumber(i,'nrespon')
	
	dw_respon.Retrieve(placa)
	fr = dw_respon.Find("estado='1'",1,dw_respon.RowCount())
	if fr > 0 then
		dw_responusu.Retrieve(placa,nasigna)
		fu = dw_responusu.Find("estado='1'",1,dw_responusu.RowCount())
		if fu > 0 then
			dw_responusu.SetItem(fu,'estado','3')
			dw_responusu.SetItem(fu,'anulado',usuario)
			dw_responusu.SetItem(fu,'fechaanulado',datetime(today(),now()))
			if fu = 1 then
				dw_respon.SetItem(fr,'estado','3')
				dw_respon.SetItem(fr,'anulado',usuario)
				dw_respon.SetItem(fr,'fechaanulado',datetime(today(),now()))
				cd = dw_ct.GetItemString(i,'coddoc_tras')
				cl = dw_ct.GetItemString(i,'clugar_tras')
				nd = dw_ct.GetItemNumber(i,'numdoc_tras')
				it = dw_ct.GetItemNumber(i,'item_tras')
				if not isNull(nd) then
					if f_anulatraslado(cd,cl,nd,it) = -1 then Return -1
					if f_update_ori(cd,cl,nd,it, -1) = -1 then Return -1
				end if
				if fr > 1 then
					nasigna_ant = dw_respon.GetItemNumber(fr - 1, 'item')
					select max(nrespon) into :nusu_ant from af_respon_usu where placa=:placa and item=:nasigna_ant;
				elseif fr = 1 then
					setnull(nasigna_ant)
				end if
				setNull(nusu_ant)
			elseif fu >1 then
				nasigna_ant = nasigna
				nusu_ant =  dw_responusu.GetItemNumber(fu - 1, 'nrespon')
			end if
		end if
		
		if not isNull(nasigna_ant) then
			update af_respon set estado='1' where placa=:placa and item = :nasigna_ant; 
			IF SQLCA.SQLCode = -1 THEN
				msg = SQLCA.SQLErrText
				Rollback;
				MessageBox("SQL error", msg)
				Return -1
			END IF
		end if
		if not isNull(nusu_ant) then
			update af_respon_usu set estado = '1' where placa = :placa and item = :nasigna_ant and nrespon=:nusu_ant; 
			IF SQLCA.SQLCode = -1 THEN
				msg = SQLCA.SQLErrText
				Rollback;
				MessageBox("SQL error", msg)
				Return -1
			END IF
		end if
		if dw_respon.Update() = -1 then
			Rollback;
			Return -1
		end if
		if dw_responusu.Update() = -1 then
			Rollback;
			Return -1
		end if
		
	end if
	commit;
	dw_ct.SetItem(i,'selec',0)
next
dw_respon.ResetUpdate() 
dw_responusu.ResetUpdate()
dw_alm.TriggerEvent(itemchanged!)
Return 0

//for i = 1 to dw_ct.RowCount()
//	if dw_ct.GetItemNumber(i,'selec') = 0 then Continue
//	placa = dw_ct.GetItemString(i,'placa')
//	nasigna = dw_ct.GetItemNumber(i,'item')
//	nusu = dw_ct.GetItemNumber(i,'nrespon')
//	
//	update af_respon_usu set estado = '2' where placa = :placa and estado = '1'; 
//	IF SQLCA.SQLCode = -1 THEN
//		msg = SQLCA.SQLErrText
//		Rollback;
//		MessageBox("SQL error", msg)
//		Return -1
//	END IF
//
//	select count(*) into :cambios from af_respon_usu where placa =:placa and item=:nasigna;
//	if cambios = 1 then
//		cd = dw_ct.GetItemString(i,'coddoc_tras')
//		cl = dw_ct.GetItemString(i,'clugar_tras')
//		nd = dw_ct.GetItemNumber(i,'numdoc_tras')
//		it = dw_ct.GetItemNumber(i,'item_tras')
//		if not isNull(nd) then
//			if f_anulatraslado(cd,cl,nd,it) = -1 then Return -1
//			update af_respon set estado = '2' where placa = :placa and estado = '1'; 
//			IF SQLCA.SQLCode = -1 THEN
//				msg = SQLCA.SQLErrText
//				Rollback;
//				MessageBox("SQL error", msg)
//				Return -1
//			END IF
//			select max(item) into :nasigna_ant from af_respon where placa =:placa and item < :nasigna;
//			if not isNull(nasigna_ant) then
//				update af_respon set estado = '1' where placa = :placa and item = :nasigna_ant; 
//				IF SQLCA.SQLCode = -1 THEN
//					msg = SQLCA.SQLErrText
//					Rollback;
//					MessageBox("SQL error", msg)
//					Return -1
//				END IF
//			end if
//		end if
//	else    //cambios
//		nasigna_ant = nasigna
//	end if // cambios
//	
//	if nasigna = nasigna_ant then
//		select max(nrespon) into :nusu_ant from af_respon where placa =:placa and item=:nasigna_ant and nrespon < :nusu;
//	 
//		
//	end if
//	dw_ct.SetItem(i,'selec',0)
//next
//
end event

type st_6 from statictext within p3
integer x = 2107
integer y = 1268
integer width = 731
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_2 from picturebutton within p3
event mousemove pbm_mousemove
integer x = 4160
integer y = 64
integer width = 142
integer height = 124
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Asignar tercero activos"
end type

event clicked;if dw_ct.RowCount() < 1 then Return 0
long i, item, f, ff, fu, nrespon, cuenta = 0
string placa, alm_ori, codarticulo, msg
double nd,cprom
datetime fecha

dw_responusu.Reset()
if dw_ct.Find("selec=1",1,dw_ct.RowCount()) = 0 then Return 0
if isNull(dw_ter.GetItemString(1,'documento')) then
	messageBox('Atención','No ha seleccionado un tercero responsable de los activos')
	Return -1
end if

em_1.GetData(fecha)
if isNull(fecha) then
	messageBox('Atención','Debe establecer la fecha de traslado')
	Return -1
end if
if MessageBox('Atención','Desea asignar a '+dw_ter.GetItemString(1,'tercero')+ ' con fecha '+string(fecha,'dd/mm/yyyy')+' ?.~r~nNo podrá deshacer los cambios',QUESTION!,YESNO!) > 1 then Return 0

for i = 1 to dw_ct.RowCount()
	if dw_ct.GetItemNumber(i,'selec') = 0 then Continue
	placa = dw_ct.GetItemString(i,'placa')
	Select item into :item from af_respon where placa=:placa and estado='1';
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
	Select max(nrespon) into :nrespon from af_respon_usu where placa=:placa and item=:item;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
	dw_responusu.insertRow(1)
	dw_responusu.SetRow(1)
	dw_responusu.SetItem(1,'placa',placa)
	dw_responusu.SetItem(1,'item',item)
	dw_responusu.SetItem(1,'nrespon',nrespon + 1)
	dw_responusu.SetItem(1,'fechaasignacion',fecha)
	dw_responusu.SetItem(1,'tipodoc',dw_ter.GetItemString(1,'tipodoc'))
	dw_responusu.SetItem(1,'documento',dw_ter.GetItemString(1,'documento'))
	dw_responusu.SetItem(1,'usuario',usuario)
	dw_responusu.SetItem(1,'estado','1')
	update af_respon_usu set fechatraslado = :fecha, estado = '2' where placa=:placa and estado='1';
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
next

if dw_responusu.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

commit;
dw_responusu.ResetUpdate()
dw_alm.TriggerEvent(itemchanged!)

Return 0

end event

type dw_ct from datawindow within p3
integer x = 46
integer y = 68
integer width = 4064
integer height = 1492
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_afxalm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanged;st_6.Text = 'Registro ' +string(GetRow()) +' de '+string(RowCount())

end event

type p4 from userobject within t1
integer x = 18
integer y = 112
integer width = 4530
integer height = 1648
long backcolor = 67108864
string text = "Traslados sin asignar"
long tabtextcolor = 33554432
string picturename = "refrescar.gif"
long picturemaskcolor = 536870912
pb_3 pb_3
st_10 st_10
dw_tras dw_tras
dw_af2 dw_af2
end type

on p4.create
this.pb_3=create pb_3
this.st_10=create st_10
this.dw_tras=create dw_tras
this.dw_af2=create dw_af2
this.Control[]={this.pb_3,&
this.st_10,&
this.dw_tras,&
this.dw_af2}
end on

on p4.destroy
destroy(this.pb_3)
destroy(this.st_10)
destroy(this.dw_tras)
destroy(this.dw_af2)
end on

type pb_3 from picturebutton within p4
integer x = 4219
integer y = 716
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
end type

event clicked;if dw_tras.RowCount() < 1 then Return 0
long i, item, f, ff, fu, cuenta = 0
string placa, alm_ori, codarticulo, msg
double nd,cprom
datetime fecha

dw_cb.Reset()
dw_cp.Reset()
dw_respon.Reset()
dw_responusu.Reset()
for i = 1 to dw_af2.RowCount()
	if dw_af2.GetItemNumber(i,'selec') = 1 then cuenta = cuenta + 1
next
if cuenta = 0 then Return 0
if isNull(dw_ter.GetItemString(1,'documento')) then
	messageBox('Atención','No ha seleccionado un tercero responsable de los activos')
	Return -1
end if
	
if cuenta > dw_tras.GetItemNumber(dw_tras.GetRow(),'cantidad') - dw_tras.GetItemNumber(dw_tras.GetRow(),'asignados') then
	messageBox('Atención','Ha seleccionado más activos de los requeridos')
	Return -1
end if
em_1.GetData(fecha)
if isNull(fecha) then
	messageBox('Atención','Debe establecer la fecha de traslado')
	Return -1
elseif fecha < datetime(date(dw_tras.GetItemDateTime(dw_tras.GetRow(),'fecha'))) then
	messageBox('Atención','La fecha de asignación no puede ser menor a la fecha del traslado '+string(dw_tras.GetItemDateTime(dw_tras.GetRow(),'fecha')))
	Return -1	
end if
if MessageBox('Atención','Desea atender la requisición y asignar a '+dw_ter.GetItemString(1,'tercero')+ ' con fecha '+string(fecha,'dd/mm/yyyy')+' ?.~r~nNo podrá deshacer los cambios',QUESTION!,YESNO!) > 1 then Return 0

for i = 1 to dw_af2.RowCount()
	if dw_af2.GetItemNumber(i,'selec') = 0 then Continue
	placa = dw_af2.GetItemString(i,'placa')
	codarticulo = dw_af2.GetItemString(i,'codarticulo')
	alm_ori = dw_af2.GetItemString(i,'codalmacen')
	select max(item) into :item from af_respon where placa=:placa;
	if isNull(item) then item = 0
	dw_respon.insertRow(1)
	dw_respon.SetRow(1)
	dw_respon.SetItem(1,'placa',placa)
	dw_respon.SetItem(1,'item',item + 1)
	dw_respon.SetItem(1,'fechaasignacion',fecha)
	dw_respon.SetItem(1,'usuario',usuario)
	dw_respon.SetItem(1,'estado','1')
	dw_respon.SetItem(1,'codalmacen',dw_tras.GetItemString(dw_tras.GetRow(),'codalmacen_target'))
	dw_respon.SetItem(1,'coddoc_tras',dw_tras.GetItemString(dw_tras.GetRow(),'coddoc'))
	dw_respon.SetItem(1,'clugar_tras',dw_tras.GetItemString(dw_tras.GetRow(),'clugar'))
	dw_respon.SetItem(1,'numdoc_tras',dw_tras.GetItemNumber(dw_tras.GetRow(),'numdoc'))
	dw_respon.SetItem(1,'item_tras',dw_tras.GetItemNumber(dw_tras.GetRow(),'item'))
	update af_respon set fechatraslado = :fecha, estado='2' where placa=:placa and estado='1';
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error", msg)
		Return -1
	END IF

	dw_responusu.insertRow(1)
	dw_responusu.SetRow(1)
	dw_responusu.SetItem(1,'placa',placa)
	dw_responusu.SetItem(1,'item',item + 1)
	dw_responusu.SetItem(1,'nrespon',1)
	dw_responusu.SetItem(1,'fechaasignacion',fecha)
	dw_responusu.SetItem(1,'tipodoc',dw_ter.GetItemString(1,'tipodoc'))
	dw_responusu.SetItem(1,'documento',dw_ter.GetItemString(1,'documento'))
	dw_responusu.SetItem(1,'usuario',usuario)
	dw_responusu.SetItem(1,'estado','1')
	update af_respon_usu set fechatraslado = :fecha, estado = '2' where placa=:placa and estado='1';
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error actualizando fecha traslado", msg)
		Return -1
	END IF
	update af_registro_cpo set asignado = '1' where placa=:placa;
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error Actualizando estado asignado", msg)
		Return -1
	END IF

next
if dw_respon.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if dw_responusu.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
commit;
dw_respon.ResetUpdate() 
dw_responusu.ResetUpdate()
dw_alm.TriggerEvent(itemchanged!)
Return 0

end event

type st_10 from statictext within p4
integer x = 64
integer y = 660
integer width = 741
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos del mismo artículo"
boolean focusrectangle = false
end type

type dw_tras from datawindow within p4
integer x = 55
integer y = 36
integer width = 4375
integer height = 632
integer taborder = 50
string title = "none"
string dataobject = "dw_traslados_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanged;dw_af2.Reset()
if RowCount() < 1 then Return 0
dw_af2.Retrieve(ls_asel,GetItemString(GetRow(),'codarticulo'))
//dw_af2.Retrieve(GetItemString(GetRow(),'codarticulo'))
em_1.Text = string(GetItemDateTime(GetRow(),'fecha'),'dd/mm/yyyy')

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event retrievestart;dw_af2.Reset()

end event

type dw_af2 from datawindow within p4
integer x = 55
integer y = 712
integer width = 4119
integer height = 896
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_existxarticulo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type st_4 from statictext within w_af_responsable
integer x = 3227
integer y = 1984
integer width = 389
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Traslado"
boolean focusrectangle = false
end type

type em_1 from editmask within w_af_responsable
integer x = 3223
integer y = 2052
integer width = 402
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event constructor;Text = string(today(),'dd/mm/yyyy')

end event

type st_2 from statictext within w_af_responsable
integer x = 46
integer y = 648
integer width = 567
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos disponibles"
boolean focusrectangle = false
end type

type st_1 from statictext within w_af_responsable
integer x = 46
integer y = 1936
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
string text = "Tercero a asignar"
boolean focusrectangle = false
end type

type dw_ter from datawindow within w_af_responsable
integer x = 41
integer y = 2004
integer width = 3159
integer height = 140
integer taborder = 40
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
InsertRow(0)

end event

event doubleclicked;g_tercerodesde = 1
openwithparm(w_buscater,dw_ter)
setcolumn('documento')
event itemchanged(1,object.documento,getitemstring(1,'documento'))

end event

event itemchanged;accepttext()
string doc,tdoc
tdoc=getitemstring(1,"tipodoc")
doc=getitemstring(1,"documento")
string snulo
setnull(snulo)
if dwo.name="tipodoc" and doc <> "" then
	setitem(1,"documento",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,'tel1',snulo)
	setitem(1,'persona',snulo)
	return
end if
if dwo.name="documento" and doc = "" then 
	setitem(1,'nombre1',snulo)
	setitem(1,'persona',snulo)
end if
if dwo.name="documento" and doc <> "" then
	if retrieve(tdoc,doc)=0 then
		insertrow(1)
		setitem(1,1,tdoc)
		setitem(1,2,doc)
		messagebox("Atención",'Tercero no existe')
	end if
end if

end event

type dw_cp from datawindow within w_af_responsable
boolean visible = false
integer x = 3643
integer y = 2056
integer width = 352
integer height = 96
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_cb from datawindow within w_af_responsable
boolean visible = false
integer x = 3671
integer y = 1948
integer width = 334
integer height = 112
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_cab_ff"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
GetChild('cod_flujo',idw_f)
idw_f.SetTransObject(SQLCA)
if idw_f.Retrieve('ST') = 0 then
	idw_f.InsertRow(0)
end if

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_alm from datawindow within w_af_responsable
integer x = 1408
integer y = 64
integer width = 1152
integer height = 68
integer taborder = 10
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
end type

event itemchanged;t1.p1.dw_req.Reset()
acceptText()
ls_asel=GetItemString(1,1)
if t1.SelectedTab = 1 then
	t1.p1.dw_req.Reset()
	t1.p1.dw_req.Retrieve(GetItemString(1,1))
	b1 = TRUE
	b2 = FALSE
	b3 = FALSE
	b4 = FALSE
elseif t1.SelectedTab = 2 then
	t1.p2.dw_sin.Retrieve(GetItemString(1,1))
	b1 = FALSE
	b2 = TRUE
	b3 = FALSE
	b4 = FALSE
elseif t1.SelectedTab = 3 then
	t1.p3.dw_ct.Retrieve(GetItemString(1,1))
	b1 = FALSE
	b2 = FALSE
	b3 = TRUE
	b4 = FALSE
else
	t1.p4.dw_tras.Reset()
	t1.p4.dw_tras.Retrieve(GetItemString(1,1))
	b1 = FALSE
	b2 = FALSE
	b3 = FALSE
	b4 = TRUE
end if

end event

type dw_respon from datawindow within w_af_responsable
boolean visible = false
integer x = 2766
integer y = 16
integer width = 512
integer height = 100
integer taborder = 30
string title = "none"
string dataobject = "dw_af_respon"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;//call super::itemfocuschanged;
//if string(dwo.name) = 'clugar_inv' and this.GetItemString(this.GetRow(),'estado') <> '0' then
//	this.modify("clugar_inv.protect=1")
//else
//	this.modify("clugar_inv.protect=0")
//end if
//
//if string(dwo.name) = 'coduf_inv' and this.GetItemString(this.GetRow(),'estado') <> '0' then
//	this.modify("coduf_inv.protect=1")
//else
//	this.modify("coduf_inv.protect=0")
//end if
//
//if string(dwo.name) = 'ccosto' and this.GetItemString(this.GetRow(),'estado') <> '0' then
//	this.modify("ccosto.protect=1")
//else
//	this.modify("ccosto.protect=0")
//end if
//
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event constructor;setTransObject(SQLCA)

end event

type st_3 from statictext within w_af_responsable
integer x = 1408
integer y = 12
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacén"
boolean focusrectangle = false
end type

type dw_responusu from datawindow within w_af_responsable
boolean visible = false
integer x = 2144
integer y = 376
integer width = 1029
integer height = 308
integer taborder = 40
string title = "none"
string dataobject = "dw_af_responusu"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;
//if this.GetItemString(row,'estado') = '0' then
//	g_tercerodesde = 13
//	openwithparm(w_buscater,dw_responusu)
//end if

if this.GetItemString(row,'estado') = '0' then
	g_tercerodesde = 10
	openwithparm(w_buscater,this)
end if

end event

event clicked;if row > 0 then this.SetRow(row)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event constructor;setTRansObject(SQLCA)

end event

