$PBExportHeader$w_af_cambio_placa.srw
forward
global type w_af_cambio_placa from w_center
end type
type gb_2 from groupbox within w_af_cambio_placa
end type
type pb_cerrar from picturebutton within w_af_cambio_placa
end type
type gb_1 from groupbox within w_af_cambio_placa
end type
type pb_1 from picturebutton within w_af_cambio_placa
end type
type dw_lp from datawindow within w_af_cambio_placa
end type
type pb_2 from picturebutton within w_af_cambio_placa
end type
type dw_c from datawindow within w_af_cambio_placa
end type
type st_2 from statictext within w_af_cambio_placa
end type
type dw_cp from datawindow within w_af_cambio_placa
end type
type hpb_1 from hprogressbar within w_af_cambio_placa
end type
type vpb_1 from hprogressbar within w_af_cambio_placa
end type
type st_t from statictext within w_af_cambio_placa
end type
type st_a from statictext within w_af_cambio_placa
end type
type dw_comp from datawindow within w_af_cambio_placa
end type
type sle_2 from singlelineedit within w_af_cambio_placa
end type
end forward

global type w_af_cambio_placa from w_center
string tag = "Ha realizado cambios. Desea guardarlos?"
integer width = 4846
integer height = 1864
string title = "Activos Fijos- Cambio Placa "
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_cplaca.ico"
boolean center = false
gb_2 gb_2
pb_cerrar pb_cerrar
gb_1 gb_1
pb_1 pb_1
dw_lp dw_lp
pb_2 pb_2
dw_c dw_c
st_2 st_2
dw_cp dw_cp
hpb_1 hpb_1
vpb_1 vpb_1
st_t st_t
st_a st_a
dw_comp dw_comp
sle_2 sle_2
end type
global w_af_cambio_placa w_af_cambio_placa

type variables
long cuenta
DataWindowChild idw_usu

end variables

forward prototypes
public function integer grabar ()
public function integer f_busca_cambio (string placa)
public function integer f_cambia (integer fila)
end prototypes

public function integer grabar ();Return pb_grabar.Event clicked()

end function

public function integer f_busca_cambio (string placa);long fila, f
fila = dw_cp.Find("placa='"+placa+"'",1,dw_cp.RowCount())
if fila > 0 then
	if dw_c.Find("placa='"+dw_cp.GetItemString(fila,'placa_ant')+"'",1,dw_c.RowCount()) > 0 then Return 0
	f = dw_c.InsertRow(0)
	dw_c.SetItem(f,'placa',dw_cp.GetItemString(fila,'placa_ant'))
	dw_c.SetItem(f,'fecha',dw_cp.GetItemDateTime(fila,'fecha'))
	dw_c.SetItem(f,'usuario',dw_cp.GetItemString(fila,'usuario'))
	f_busca_cambio(dw_cp.GetItemString(fila,'placa_ant'))
end if
Return 0

end function

public function integer f_cambia (integer fila);long nd ,it, i, f, item
string placa, nplaca, cd, cl, msg


placa = dw_lp.GetItemString(fila,'placa')
nplaca = dw_lp.GetItemString(fila,'nplaca')
if isNull(placa) or trim(nplaca) = '' then
	dw_lp.SetItem(fila,'selec',0)
	fila = dw_lp.Find("selec=1",1,dw_lp.RowCount())
	Return 0
end if

cd = dw_lp.GetItemString(fila,'coddocu')
cl = dw_lp.GetItemString(fila,'clugar')	
nd = dw_lp.GetItemNumber(fila,'numdoc')
it = dw_lp.GetItemNumber(fila,'item')

dw_comp.Retrieve(cd,cl,nd)

select max(item) into :item from af_registro_cpo
where coddocu=:cd and clugar=:cl and numdoc=:nd;
item = item + 1

Insert into af_registro_cpo (coddocu,clugar,numdoc,item,carticulo,placa,asignado,fechacompra,tipodoc,documento,serial,fechaservicio,garantia,nrogarantia,vidautil,inddeprecia,codalmacen_kar,codarti_kar,ano_kar,mes_kar,item_kar,electrico,energia_x_unid,vrcompra,vractual,vrmantto,vrvaloriza,vrdesvalor,estado)
select coddocu,clugar,numdoc,:item,carticulo,:nplaca,asignado,fechacompra,tipodoc,documento,serial,fechaservicio,garantia,nrogarantia,vidautil,inddeprecia,codalmacen_kar,codarti_kar,ano_kar,mes_kar,item_kar,electrico,energia_x_unid,vrcompra,vractual,vrmantto,vrvaloriza,vrdesvalor,estado
from af_registro_cpo where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error insertando af_registro_cpo", msg)
	Return -1
end if
hpb_1.stepIt()


delete from af_reg_compo
where coddocu=:cd and clugar=:cl and numdoc=:nd and item=:it;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_registro_cpo", msg)
	Return -1
end if
hpb_1.stepIt()

//
//	Insert Into af_reg_compo (coddocu,clugar,numdoc,item,num_compo,carticulo,placa,serial,fechaservicio,vrcompra,garantia,pgarantia,nrogarantia,vidautil,pvidautil,estado,descripcion)
//	select coddocu,clugar,numdoc,:item,num_compo,carticulo,placa,serial,fechaservicio,vrcompra,garantia,pgarantia,nrogarantia,vidautil,pvidautil,estado,descripcion
//	from af_reg_compo where coddocu=:cd and clugar=:cl and numdoc=:nd and item=:it;
//	if SQLCA.SQLCode = -1 then
//		msg = SQLCA.SQLErrText
//		rollback;
//		MessageBox("SQL error insertando af_reg_compo", msg)
//		Return -1
//	end if
//	hpb_1.stepIt()

update af_baja set placa=:nplaca
where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error actualizando af_baja", msg)
	Return -1
end if
hpb_1.stepIt()

update af_comodato set placa=:nplaca
where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error actualizando af_comodato", msg)
	Return -1
end if
hpb_1.stepIt()

update af_deprecia set placa=:nplaca
where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error actualizando af_deprecia", msg)
	Return -1
end if
hpb_1.stepIt()

update af_mantenimiento set placa=:nplaca
where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error actualizando af_mantenimiento", msg)
	Return -1
end if
hpb_1.stepIt()

Insert into af_respon (placa,item,codalmacen,fechaasignacion,coddoc_tras,clugar_tras,numdoc_tras,item_tras,estado,fechatraslado,usuario,anulado,fechaanulado)
select :nplaca,item,codalmacen,fechaasignacion,coddoc_tras,clugar_tras,numdoc_tras,item_tras,estado,fechatraslado,usuario,anulado,fechaanulado
from af_respon where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error insertando af_respon", msg)
	Return -1
end if
hpb_1.stepIt()

Insert into af_respon_usu (placa,item,nrespon,tipodoc,documento,fechaasignacion,estado,fechatraslado,usuario,anulado,fechaanulado)
select :nplaca,item,nrespon,tipodoc,documento,fechaasignacion,estado,fechatraslado,usuario,anulado,fechaanulado 
from af_respon_usu where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error insertando af_respon_usu", msg)
	Return -1
end if
hpb_1.stepIt()

delete from af_respon_usu where placa=:placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_respon_usu", msg)
	Return -1
end if
hpb_1.stepIt()

delete from af_respon where placa=:placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_respon", msg)
	Return -1
end if
hpb_1.stepIt()

delete from af_registro_cpo
where coddocu=:cd and clugar=:cl and numdoc=:nd and item=:it;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_registro_cpo", msg)
	Return -1
end if

update af_registro_cpo set item=:it
where coddocu=:cd and clugar=:cl and numdoc=:nd and item=:item;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_registro_cpo", msg)
	Return -1
end if
hpb_1.stepIt()

for i = 1 to dw_comp.RowCount()
	 dw_comp.SetItemStatus(i, 0, Primary!, NewModified!)
next
if dw_comp.Update() = -1 then
	Rollback;
	Return -1
end if

if g_motor='postgres' then
	UPDATE AF_REG_COMPO SET placa = :nplaca||'-'||CAST(num_compo as varchar(4))
	WHERE 
		(((AF_REG_COMPO.CODDOCU)=:cd) AND ((AF_REG_COMPO.clugar)=:cl) 
		AND ((AF_REG_COMPO.NUMDOC)=:nd) AND ((AF_REG_COMPO.ITEM)=:it));
else
	UPDATE AF_REG_COMPO SET AF_REG_COMPO.placa = :nplaca+'-'+convert(varchar(4),num_compo)
	WHERE 
		(((AF_REG_COMPO.CODDOCU)=:cd) AND ((AF_REG_COMPO.clugar)=:cl) 
		AND ((AF_REG_COMPO.NUMDOC)=:nd) AND ((AF_REG_COMPO.ITEM)=:it));
end if
		
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error Actualizando Placas en Componente", msg)
	Return -1
end if

dw_lp.SetItem(fila,'selec',0)
dw_lp.SetItem(fila,'proceso','Placa Cambiada')

f = dw_cp.InsertRow(0)
dw_cp.SetItem(f,'placa',nplaca)
dw_cp.SetItem(f,'placa_ant',placa)
dw_cp.SetItem(f,'fecha',today())
dw_cp.SetItem(f,'usuario',usuario)
idw_usu.retrieve()
if dw_cp.Update() = -1 then
	Rollback;
	Return -1
end if
cuenta = cuenta + 1
vpb_1.position = cuenta
Return 0

end function

on w_af_cambio_placa.create
int iCurrent
call super::create
this.gb_2=create gb_2
this.pb_cerrar=create pb_cerrar
this.gb_1=create gb_1
this.pb_1=create pb_1
this.dw_lp=create dw_lp
this.pb_2=create pb_2
this.dw_c=create dw_c
this.st_2=create st_2
this.dw_cp=create dw_cp
this.hpb_1=create hpb_1
this.vpb_1=create vpb_1
this.st_t=create st_t
this.st_a=create st_a
this.dw_comp=create dw_comp
this.sle_2=create sle_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_2
this.Control[iCurrent+2]=this.pb_cerrar
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.dw_lp
this.Control[iCurrent+6]=this.pb_2
this.Control[iCurrent+7]=this.dw_c
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.dw_cp
this.Control[iCurrent+10]=this.hpb_1
this.Control[iCurrent+11]=this.vpb_1
this.Control[iCurrent+12]=this.st_t
this.Control[iCurrent+13]=this.st_a
this.Control[iCurrent+14]=this.dw_comp
this.Control[iCurrent+15]=this.sle_2
end on

on w_af_cambio_placa.destroy
call super::destroy
destroy(this.gb_2)
destroy(this.pb_cerrar)
destroy(this.gb_1)
destroy(this.pb_1)
destroy(this.dw_lp)
destroy(this.pb_2)
destroy(this.dw_c)
destroy(this.st_2)
destroy(this.dw_cp)
destroy(this.hpb_1)
destroy(this.vpb_1)
destroy(this.st_t)
destroy(this.st_a)
destroy(this.dw_comp)
destroy(this.sle_2)
end on

event open;dw_lp.SetRedraw(False)
dw_lp.Retrieve()
dw_lp.SetRedraw(True)

end event

event closequery;call super::closequery;if cambio then
	if messageBox('Aviso','El documento nuevo no ha sido guardado. Desea continuar?',QUESTION!,YESNO!) = 2 then
		Return -1
	end if
end if

end event

type pb_grabar from w_center`pb_grabar within w_af_cambio_placa
boolean visible = false
integer x = 1874
integer y = 1836
integer taborder = 100
boolean enabled = false
boolean originalsize = false
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;
//if t1.p1.dw_respon.Update() = -1 then
//	Rollback;
//	Return
//end if

commit;
Return 0

end event

type gb_2 from groupbox within w_af_cambio_placa
integer x = 2405
integer y = 1480
integer width = 855
integer height = 168
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Placas Cambiadas"
end type

type pb_cerrar from picturebutton within w_af_cambio_placa
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 2405
integer y = 1332
integer width = 142
integer height = 124
integer taborder = 90
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
string powertiptext = "Cerrar"
end type

event clicked;close(parent)

end event

type gb_1 from groupbox within w_af_cambio_placa
integer x = 37
integer y = 28
integer width = 4777
integer height = 1696
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Placa"
end type

type pb_1 from picturebutton within w_af_cambio_placa
event mousemove pbm_mousemove
string tag = "Cerrar"
boolean visible = false
integer x = 1728
integer y = 1836
integer width = 142
integer height = 124
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular Registro"
end type

type dw_lp from datawindow within w_af_cambio_placa
integer x = 133
integer y = 116
integer width = 4631
integer height = 1108
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ls_cambio_placa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event itemchanged;long fila
AcceptText()
if GetColumnName() = 'nplaca' then
	if trim(GetItemString(GetRow(),'nplaca')) = '' then
		SetItem(GetRow(),'selec',0)
		SetItem(GetRow(),'proceso','')
	else
		SetItem(GetRow(),'selec',1)
		SetItem(GetRow(),'proceso','A Cambiar')
	end if
end if

end event

event rowfocuschanged;if RowCount() = 0 or currentrow= 0 then Return 0
dw_c.Reset()
f_busca_cambio(GetItemString(getRow(),'placa'))

end event

type pb_2 from picturebutton within w_af_cambio_placa
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 2555
integer y = 1332
integer width = 142
integer height = 124
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Cambiar Placa"
end type

event clicked;long fila, nd ,it, i, f, item
string placa, nplaca, cd, cl, msg

if dw_lp.AcceptText() = -1 then Return -1
cuenta = 0
msg = dw_lp.Describe("Evaluate('sum(if(selec=1,1,0))',0)")
vpb_1.Maxposition = long(msg) * 2
vpb_1.Visible = TRUE
hpb_1.Visible = TRUE
st_a.Visible = TRUE
st_t.Visible = TRUE

fila = dw_lp.Find("selec=1",1,dw_lp.RowCount())
do while fila > 0
	cuenta = cuenta + 1
	vpb_1.position = cuenta
	hpb_1.Position = 0
	if f_cambia(fila) = -1 then EXIT
	commit;
	fila = dw_lp.Find("selec=1",1,dw_lp.RowCount())
loop
vpb_1.Visible = FALSE
hpb_1.Visible = FALSE
st_a.Visible = FALSE
st_t.Visible = FALSE

dw_lp.Reset()
dw_lp.Retrieve()


end event

type dw_c from datawindow within w_af_cambio_placa
integer x = 165
integer y = 1324
integer width = 2194
integer height = 300
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ext_cambios"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
GetChild('usuario',idw_usu)
idw_usu.SetTransObject(SQLCA)
end event

type st_2 from statictext within w_af_cambio_placa
integer x = 178
integer y = 1252
integer width = 453
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cambios de placa"
boolean focusrectangle = false
end type

type dw_cp from datawindow within w_af_cambio_placa
boolean visible = false
integer x = 471
integer y = 1756
integer width = 265
integer height = 140
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cambio_placa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
Retrieve()

end event

type hpb_1 from hprogressbar within w_af_cambio_placa
boolean visible = false
integer x = 151
integer y = 1744
integer width = 1399
integer height = 60
boolean bringtotop = true
unsignedinteger maxposition = 120
integer setstep = 10
end type

type vpb_1 from hprogressbar within w_af_cambio_placa
boolean visible = false
integer x = 151
integer y = 1832
integer width = 1399
integer height = 60
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_t from statictext within w_af_cambio_placa
boolean visible = false
integer x = 1614
integer y = 1836
integer width = 585
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Progreso Total"
boolean focusrectangle = false
end type

type st_a from statictext within w_af_cambio_placa
boolean visible = false
integer x = 1614
integer y = 1764
integer width = 590
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Progreso por Activo"
boolean focusrectangle = false
end type

type dw_comp from datawindow within w_af_cambio_placa
boolean visible = false
integer x = 2569
integer y = 1728
integer width = 256
integer height = 180
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_af_regcom"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type sle_2 from singlelineedit within w_af_cambio_placa
integer x = 2642
integer y = 1540
integer width = 402
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//dw_ter_tmp.TriggerEvent(itemchanged!)

double nd
long fila
string l_buscar, placa
l_buscar = sle_2.Text
if trim(l_buscar) = '' then Return 0
SELECT  af_cambio_placa.placa into :placa
FROM af_cambio_placa
WHERE (((af_cambio_placa.placa_ant)=:l_buscar));
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return 0
elseif SQLCA.SQLCode = 100 THEN
	MessageBox('Atención', 'No se encuentra el activo con placa '+l_buscar)
	Return 0
elseif SQLCA.SQLCode = 0 THEN
	fila = dw_lp.Find("placa='"+placa+"'",1,dw_lp.RowCount())
	if fila > 0 then
		dw_lp.ScrolltoRow(fila)
	end if
	Return 0
END IF


end event

