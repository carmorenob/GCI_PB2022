$PBExportHeader$w_consigna_cheque.srw
forward
global type w_consigna_cheque from window
end type
type pb_cancel from picturebutton within w_consigna_cheque
end type
type pb_ok from picturebutton within w_consigna_cheque
end type
type dw_1 from datawindow within w_consigna_cheque
end type
type st_1 from statictext within w_consigna_cheque
end type
type sle_1 from singlelineedit within w_consigna_cheque
end type
end forward

global type w_consigna_cheque from window
integer width = 1838
integer height = 780
boolean titlebar = true
string title = "Consignar Cheque no Reclamado"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "abono.ico"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
st_1 st_1
sle_1 sle_1
end type
global w_consigna_cheque w_consigna_cheque

type variables
datawindow i_dw
datawindowchild idw_cuenta
end variables

event open;i_dw=message.powerobjectparm
sle_1.text=string(i_dw.getitemnumber(i_dw.getrow(),'nro_cheque'))
dw_1.setitem(1,'valor',i_dw.getitemnumber(i_dw.getrow(),'valor'))
dw_1.setitem(1,'fecha',datetime(today()))
dw_1.setitem(1,'detalle','Consignación de cheque no reclamado nro: '+sle_1.text)
dw_1.setitem(1,'usuario',usuario)
end event

on w_consigna_cheque.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.st_1=create st_1
this.sle_1=create sle_1
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.dw_1,&
this.st_1,&
this.sle_1}
end on

on w_consigna_cheque.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.sle_1)
end on

type pb_cancel from picturebutton within w_consigna_cheque
integer x = 855
integer y = 520
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_consigna_cheque
integer x = 681
integer y = 520
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;string banco,tcuenta,ncuenta
ncuenta=dw_1.getitemstring(1,'numcuenta')
if isnull(ncuenta) then
	messagebox('Atención','Debe escoger el Banco y la cuenta donde se consignará')
	return
end if
banco=dw_1.getitemstring(1,'codbanco')
tcuenta=dw_1.getitemstring(1,'tipo_cuenta')
long item,nnulo
dec valor
string err,snulo
datetime fecha
fecha=dw_1.getitemdatetime(1,'fecha')
setnull(nnulo)
setnull(snulo)
select max(item) into :item from tesocuentasmovi where 
codbanco =:banco and tipo_cuenta =:tcuenta and numcuenta=:ncuenta and clugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo tesocuentasmovi',sqlca.sqlerrtext)
	return
end if
if isnull(item) then item=0 
item ++
dw_1.setitem(1,'item',item)
if dw_1.update(true,false)=-1 then
	return
end if
valor=dw_1.getitemnumber(1,'valor')
insert into tesocuentasmovidet 
(codbanco,tipo_cuenta,numcuenta,item,subitem,forma,valor,num_che) values
(:banco,:tcuenta,:ncuenta,:item,1,'C',:valor,:sle_1.text);
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox('Error insertando en tesocuentasmovidet',err)
	return
end if
i_dw.setitem(i_dw.getrow(),'codbanco_consig',banco)
i_dw.setitem(i_dw.getrow(),'tipo_cuenta_consig',tcuenta)
i_dw.setitem(i_dw.getrow(),'numcuenta_consig',ncuenta)
i_dw.setitem(i_dw.getrow(),'item_consig',item)
if i_dw.update(true,false)=-1 then return
commit;
i_dw.resetupdate()
i_dw.event rowfocuschanged(i_dw.getrow())
close(parent)
	

end event

type dw_1 from datawindow within w_consigna_cheque
integer x = 37
integer y = 124
integer width = 1737
integer height = 324
integer taborder = 20
string title = "none"
string dataobject = "dw_consigna_cheque"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild("numcuenta",idw_cuenta)
idw_cuenta.settransobject(sqlca)
idw_cuenta.retrieve(w_orden_pago2.i_emp)
idw_cuenta.setfilter('#1="aa"')
idw_cuenta.filter()
settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string nulo
setnull(nulo)
choose case dwo.name
	case 'codbanco'
		accepttext()
		setitem(row,'numcuenta',nulo)
		setitem(row,'tipo_cuenta',nulo)
		idw_cuenta.setfilter('codbanco="'+data+'" and tipocaja="0"')
		idw_cuenta.filter()
	case 'numcuenta'
		setitem(getrow(),'tipo_cuenta',idw_cuenta.getitemstring(idw_cuenta.getrow(),'tipo_cuenta'))
end choose
end event

event dberror;rollback;
return 0
end event

type st_1 from statictext within w_consigna_cheque
integer x = 73
integer y = 12
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cheque:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_consigna_cheque
integer x = 297
integer width = 402
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

