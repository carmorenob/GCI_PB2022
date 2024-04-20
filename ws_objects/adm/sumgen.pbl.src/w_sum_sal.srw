$PBExportHeader$w_sum_sal.srw
$PBExportComments$Ventana para documentos que usan otros documentos base
forward
global type w_sum_sal from window
end type
type st_9 from statictext within w_sum_sal
end type
type dw_lug from datawindow within w_sum_sal
end type
type st_8 from statictext within w_sum_sal
end type
type pb_11 from picturebutton within w_sum_sal
end type
type pb_grabartmp from picturebutton within w_sum_sal
end type
type pb_cancelar from picturebutton within w_sum_sal
end type
type pb_anular from picturebutton within w_sum_sal
end type
type pb_grabardef from picturebutton within w_sum_sal
end type
type pb_3 from picturebutton within w_sum_sal
end type
type pb_lote from picturebutton within w_sum_sal
end type
type pb_nuevo from picturebutton within w_sum_sal
end type
type pb_2 from picturebutton within w_sum_sal
end type
type pb_4 from picturebutton within w_sum_sal
end type
type t1 from tab within w_sum_sal
end type
type pp from userobject within t1
end type
type st_3 from statictext within pp
end type
type st_2 from statictext within pp
end type
type pb_ca from picturebutton within pp
end type
type pb_1 from picturebutton within pp
end type
type pb_7 from picturebutton within pp
end type
type dw_p from datawindow within pp
end type
type dw_pc from datawindow within pp
end type
type pp from userobject within t1
st_3 st_3
st_2 st_2
pb_ca pb_ca
pb_1 pb_1
pb_7 pb_7
dw_p dw_p
dw_pc dw_pc
end type
type pr from userobject within t1
end type
type st_4 from statictext within pr
end type
type st_1 from statictext within pr
end type
type rb_m from radiobutton within pr
end type
type rb_s from radiobutton within pr
end type
type pb_delorden from picturebutton within pr
end type
type pb_5 from picturebutton within pr
end type
type dw_r from datawindow within pr
end type
type dw_rl from datawindow within pr
end type
type pb_am from picturebutton within pr
end type
type dw_rc from datawindow within pr
end type
type pr from userobject within t1
st_4 st_4
st_1 st_1
rb_m rb_m
rb_s rb_s
pb_delorden pb_delorden
pb_5 pb_5
dw_r dw_r
dw_rl dw_rl
pb_am pb_am
dw_rc dw_rc
end type
type pd from userobject within t1
end type
type pb_placa from picturebutton within pd
end type
type st_7 from statictext within pd
end type
type st_6 from statictext within pd
end type
type st_5 from statictext within pd
end type
type pb_10 from picturebutton within pd
end type
type pb_9 from picturebutton within pd
end type
type pb_8 from picturebutton within pd
end type
type pb_6 from picturebutton within pd
end type
type dw_cpo from datawindow within pd
end type
type st_af from statictext within pd
end type
type dw_l from datawindow within pd
end type
type pd from userobject within t1
pb_placa pb_placa
st_7 st_7
st_6 st_6
st_5 st_5
pb_10 pb_10
pb_9 pb_9
pb_8 pb_8
pb_6 pb_6
dw_cpo dw_cpo
st_af st_af
dw_l dw_l
end type
type t1 from tab within w_sum_sal
pp pp
pr pr
pd pd
end type
type dw_c from datawindow within w_sum_sal
end type
type dw_alm from datawindow within w_sum_sal
end type
type gb_1 from groupbox within w_sum_sal
end type
type dw_cab from datawindow within w_sum_sal
end type
end forward

global type w_sum_sal from window
integer width = 6464
integer height = 2328
boolean titlebar = true
string title = "Suministros"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
st_9 st_9
dw_lug dw_lug
st_8 st_8
pb_11 pb_11
pb_grabartmp pb_grabartmp
pb_cancelar pb_cancelar
pb_anular pb_anular
pb_grabardef pb_grabardef
pb_3 pb_3
pb_lote pb_lote
pb_nuevo pb_nuevo
pb_2 pb_2
pb_4 pb_4
t1 t1
dw_c dw_c
dw_alm dw_alm
gb_1 gb_1
dw_cab dw_cab
end type
global w_sum_sal w_sum_sal

type variables
string coddocumento, codalm, coddoc_rel
DataWindowChild dwc_alm, dwc_f,idw_lugart,dwc_lugar
long nuevo
boolean cambio, i_afijos
int i_dec_gral,i_aprox_gral


end variables

forward prototypes
public function integer reversa ()
public function integer f_chequea (integer fila, string data)
public function integer update_ori (string coddoc, string lugar, double numdoc, double item, decimal cantidad)
end prototypes

public function integer reversa ();long i,j
dw_cab.SetItem(1,'estado','0')
dw_cab.SetItemStatus(dw_cab.GetRow(),0, Primary!,NewModified!)

t1.pd.dw_cpo.SetRedraw(FALSE)
t1.pd.dw_l.SetRedraw(FALSE)
for i = 1 to t1.pd.dw_cpo.RowCount()
	t1.pd.dw_cpo.Scrolltorow(i)
	t1.pd.dw_cpo.Event RowFocusChanged(i)
	t1.pd.dw_cpo.SetItemStatus(i,0, Primary!,NewModified!)
	for j =  1 to t1.pd.dw_l.RowCount()
		t1.pd.dw_l.SetItemStatus(j,0, Primary!,NewModified!)
	next
next
t1.pd.dw_cpo.SetRedraw(TRUE)
t1.pd.dw_l.SetRedraw(TRUE)

Return 0

end function

public function integer f_chequea (integer fila, string data);t1.pr.dw_rc.ScrolltoRow(fila)
long i
dec cantidad

if data = '1' then
	if t1.pr.dw_rc.GetItemString(fila,'act_fijo') = '1' and i_afijos then
		t1.pr.dw_rc.SetItem(fila,'aentregar',0)
		for i = 1 to t1.pr.dw_rl.RowCount()
			t1.pr.dw_rl.SetItem(i,'aentregar',0)
		next
		t1.pr.dw_rc.SetItem(fila,'selec',0)
		t1.pr.dw_rc.SetText('0')
		Return 2
	end if
	for i = 1 to t1.pr.dw_rl.RowCount()
		if t1.pr.dw_rl.GetItemNumber(i,'aentregar') = 0 then
			if t1.pr.dw_rl.GetItemNumber(i,'cantidad') > t1.pr.dw_rl.GetItemNumber(i,'devuelto') then
				
				if t1.pr.dw_rl.GetItemNumber(i,'cantidad') - t1.pr.dw_rl.GetItemNumber(i,'devuelto') < t1.pr.dw_rl.GetItemNumber(i,'saldoactual') then
					t1.pr.dw_rl.SetItem(i,'aentregar',t1.pr.dw_rl.GetItemNumber(i,'cantidad') - t1.pr.dw_rl.GetItemNumber(i,'devuelto'))
				else
					t1.pr.dw_rl.SetItem(i,'aentregar',t1.pr.dw_rl.GetItemNumber(i,'saldoactual'))
				end if
				
			end if
		end if
		if t1.pr.dw_rl.GetItemNumber(i,'aentregar') > 0 then t1.pr.dw_rl.SetItem(i,'selec',1)
	next
	cantidad = double(t1.pr.dw_rl.Describe("Evaluate('sum(aentregar)',0)"))
	t1.pr.dw_rc.SetItem(fila,'aentregar',cantidad)
	if t1.pr.dw_rc.GetItemNumber(fila,'aentregar') = 0 then
		if t1.pr.dw_rc.GetItemNumber(fila,'cantidad') - t1.pr.dw_rc.GetItemNumber(fila,'atendido') < t1.pr.dw_rc.GetItemNumber(fila,'saldoactual') then
			t1.pr.dw_rc.SetItem(fila,'aentregar',t1.pr.dw_rc.GetItemNumber(fila,'cantidad') - t1.pr.dw_rc.GetItemNumber(fila,'atendido'))
		else
			t1.pr.dw_rc.SetItem(fila,'aentregar',t1.pr.dw_rc.GetItemNumber(fila,'saldoactual'))
		end if
	end if
else
	for i = 1 to t1.pr.dw_rl.RowCount()
		t1.pr.dw_rl.SetItem(i,'selec',0)
	next
end if
Return 0

end function

public function integer update_ori (string coddoc, string lugar, double numdoc, double item, decimal cantidad);double nd, it
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
if round(atendido + cantidad ,i_dec_gral)> solicitado then
	Rollback;
	Messagebox('Aviso','La cantidad excede lo solicitado. Articulo: '+codarticulo)
	Return -1
end if
valor = round(atendido + cantidad ,i_dec_gral)
update sum_mvto_cpo set atendido = :valor // acumula Devuelto
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and item=:item;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error actualizando sum_mvto_cpo.atendido", msg)
	Return -1
END IF

// Lotes de Entrada
dw_ltr = CREATE uo_DataStore
dw_ltr.DataObject = 'dw_mvto_lote'
dw_ltr.SetTransObject(SQLCA)
dw_ltr.Retrieve(coddoc,clugar,numdoc)
dw_ltr.SetFilter("item="+string(item))
dw_ltr.Filter()

for i = 1 to t1.pd.dw_l.RowCount()
//	f = dw_ltr.Find("lote='"+t1.pd.dw_l.GetItemString(i,'lote')+"'",1,dw_ltr.RowCount())
	f = dw_ltr.Find("upper(lote)='"+upper(t1.pd.dw_l.GetItemString(i,'lote'))+"'",1,dw_ltr.RowCount())
	if f > 0 then
		devuelto = dw_ltr.GetItemNumber(f,'devuelto')
		if isNull(devuelto) then devuelto = 0
		dw_ltr.SetItem(f,'devuelto',devuelto + t1.pd.dw_l.GetItemNumber(i,'cantidad'))
	end if
next

if dw_ltr.Update() = -1 then
	Rollback;
	MessageBox("Error", "Error actualizando lotes de entrada.")
	Return -1
end if

if coddoc_rel = 'SE' then
	// Orden de Compra
	update sum_mvto_cpo set atendido=atendido - :cantidad
	where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error actulizando sum_mvto_cpo set atendido=atendido - :cantidad", msg)
		Return -1
	END IF
	select count(*) into :atendido from sum_mvto_cpo
	where coddoc=:cd and clugar=:cl and numdoc=:nd and cantidad <> atendido;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error leyendo count(*) from sum_mvto_cpo", msg)
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
	else
		update sum_mvto_cab set estado = '1'
		where coddoc=:cd and clugar=:cl and numdoc=:nd;
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("Error actualizando sum_mvto_cab set estado = '1'", msg)
			Return -1
		END IF
	end if
end if

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

event open;string ojo
SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=31));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 31')
	return 
end if

SELECT ENTERO into :i_aprox_gral
FROM parametros_gen
WHERE (((codigo_para)=18));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 18')
	return 
end if
if i_aprox_gral=0 then i_aprox_gral=1

codDocumento = Message.StringParm
choose case codDocumento
	case 'SD' 
		Title = 'Suministros - Devoluciones'
		icon='ribon_devolu.ico'
		coddoc_rel = 'SE'
		t1.pp.dw_p.DataObject = 'dw_mvto_oc_pend'
		dw_cab.Modify("codalmacen_target.Visible=FALSE codalmacen_target_t.Visible=FALSE")
		t1.pp.Text = 'Entradas'
		t1.pr.Text = 'Entradas Relacionadas'
		t1.pd.Text = 'Artículos a Devolver'
		t1.pp.pb_ca.Visible = FALSE
		t1.pr.pb_am.Visible = FALSE
		t1.pr.rb_s.Visible = FALSE
		t1.pr.rb_m.Visible = FALSE
		t1.pr.dw_rc.Modify("aentregar_t.Text='a devolver'")
		t1.pd.dw_cpo.Modify("cantidad_t.Text='a devolver'")
		t1.pd.dw_l.Modify("cantidad_t.Text='a devolver'")
		t1.pr.st_4.Text = 'Ubique el cursor sobre el documento de Entrada para desplegar el detalle en la malla Artículos.' +&
		' Seleccione los artículos o digite la cantidad que desea devolver en la malla Artículos si no maneja lotes o en la malla Lotes en caso contrario y presione el botón llevar al detalle.'
	case 'SFR'
		Title = 'Suministro - Reposición Fianza'
		icon='ribon_fianzae.ico'
		coddoc_rel = 'SF'
		t1.pp.dw_p.DataObject = 'dw_mvto_oc_pend'
		dw_cab.Modify("codalmacen_target.Visible=FALSE codalmacen_target_t.Visible=FALSE")
		t1.pp.Text = 'Fianzas Pendientes'
		t1.pr.Text = 'Fianzas Relacionadas'
		t1.pd.Text = 'Artículos a Devolver'
		t1.pp.pb_ca.Visible = TRUE
		t1.pr.pb_am.Visible = TRUE
		t1.pr.dw_rc.Modify("aentregar_t.Text='a devolver'")
		t1.pd.dw_cpo.Modify("cantidad_t.Text='a devolver'")
		t1.pd.dw_l.Modify("cantidad_t.Text='a devolver'")
		t1.pr.st_4.Text = 'Ubique el cursor sobre el documento de Entrada por Fianza para desplegar el detalle en la malla Artículos.' +&
		' Seleccione los artículos o digite la cantidad que desea devolver en la malla Artículos si no maneja lotes o en la malla Lotes en caso contrario y presione el botón llevar al detalle.'
case 'SVR'
		Title = 'Suministro - Reposición Vencimientos'
		icon='ribon_vence.ico'
		coddoc_rel = 'SV'
		t1.pp.dw_p.DataObject = 'dw_mvto_oc_pend'
		dw_cab.Modify("codalmacen_target.Visible=FALSE codalmacen_target_t.Visible=FALSE")
		t1.pp.Text = 'Vencimientos Pendientes'
		t1.pr.Text = 'Vencimientos Relacionadas'
		t1.pd.Text = 'Artículos a Devolver'
		t1.pp.pb_ca.Visible = TRUE
		t1.pr.pb_am.Visible = TRUE
		t1.pr.dw_rc.Modify("aentregar_t.Text='a devolver'")
		t1.pd.dw_cpo.Modify("cantidad_t.Text='a devolver'")
		t1.pd.dw_l.Modify("cantidad_t.Text='a devolver'")
		t1.pr.st_4.Text = 'Ubique el cursor sobre el documento de Entrada por Vencimientos para desplegar el detalle en la malla Artículos.' +&
		' Seleccione los artículos o digite la cantidad que desea devolver en la malla Artículos si no maneja lotes o en la malla Lotes en caso contrario y presione el botón llevar al detalle.'	
case 'ST'
		Title= 'Suministro - Traslados'
		coddoc_rel = 'SR'
		icon='ribon_traslado.ico'
		t1.pp.dw_p.DataObject = 'dw_mvto_req_pend'
		t1.pp.dw_pc.Modify("atendido_t.Text='Atendido'")
		t1.pr.dw_rc.Modify("atendido_t.Text='Atendido'")
		dw_cab.Modify('codalmacen_target_t.Text="Almacén que solicitó"')
		t1.pp.Text = 'Requisiciones Pendientes'
		t1.pr.Text = 'Requisiciones Relacionadas'
		t1.pd.Text = 'Artículos a Trasladar'
		t1.pp.pb_ca.Visible = TRUE
		t1.pr.pb_am.Visible = TRUE
		t1.pr.dw_rc.Modify("aentregar_t.Text='a trasladar'")
		t1.pd.dw_cpo.Modify("cantidad_t.Text='a trasladar' valor_unit.Edit.DisplayOnly=TRUE")
		t1.pd.dw_l.Modify("cantidad_t.Text='a trasladar'")
		t1.pr.st_4.Text = 'Ubique el cursor sobre el documento de Requisición para desplegar el detalle en la malla Artículos.' +&
		' Seleccione los artículos o digite la cantidad que desea devolver en la malla Artículos si no maneja lotes o en la malla Lotes en caso contrario y presione el botón llevar al detalle.'
end choose
t1.pd.dw_cpo.Modify("cantidad.edit.DisplayOnly=TRUE")
t1.pp.dw_p.setTransObject(SQLCA)

dw_alm.SetTransObject(SQLCA)
dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)

dw_cab.GetChild('cod_flujo',dwc_f)
dwc_f.SetTransObject(SQLCA)
if dwc_f.Retrieve(coddocumento) = 0 then
	dw_cab.Modify("cod_flujo.Edit.DisplayOnly=TRUE")
	dwc_f.InsertRow(0)
end if
string s_afijos
if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LIC_ACTI", Regstring!, s_afijos )
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "LIC_ACTI", Regstring!, s_afijos )
if long(s_afijos) > 0 then
	select trasladar_al_asignar into :s_afijos from af_config;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 0
	END IF
	if long(s_afijos) > 0 then
		i_afijos = TRUE
		st_8.Visible = TRUE
		t1.pr.dw_rc.Modify("aentregar.protect='0~tif(act_fijo=~~'1~~',1,0)'")
	else
		i_afijos = FALSE
	end if
else
	i_afijos = FALSE
end if

end event

on w_sum_sal.create
this.st_9=create st_9
this.dw_lug=create dw_lug
this.st_8=create st_8
this.pb_11=create pb_11
this.pb_grabartmp=create pb_grabartmp
this.pb_cancelar=create pb_cancelar
this.pb_anular=create pb_anular
this.pb_grabardef=create pb_grabardef
this.pb_3=create pb_3
this.pb_lote=create pb_lote
this.pb_nuevo=create pb_nuevo
this.pb_2=create pb_2
this.pb_4=create pb_4
this.t1=create t1
this.dw_c=create dw_c
this.dw_alm=create dw_alm
this.gb_1=create gb_1
this.dw_cab=create dw_cab
this.Control[]={this.st_9,&
this.dw_lug,&
this.st_8,&
this.pb_11,&
this.pb_grabartmp,&
this.pb_cancelar,&
this.pb_anular,&
this.pb_grabardef,&
this.pb_3,&
this.pb_lote,&
this.pb_nuevo,&
this.pb_2,&
this.pb_4,&
this.t1,&
this.dw_c,&
this.dw_alm,&
this.gb_1,&
this.dw_cab}
end on

on w_sum_sal.destroy
destroy(this.st_9)
destroy(this.dw_lug)
destroy(this.st_8)
destroy(this.pb_11)
destroy(this.pb_grabartmp)
destroy(this.pb_cancelar)
destroy(this.pb_anular)
destroy(this.pb_grabardef)
destroy(this.pb_3)
destroy(this.pb_lote)
destroy(this.pb_nuevo)
destroy(this.pb_2)
destroy(this.pb_4)
destroy(this.t1)
destroy(this.dw_c)
destroy(this.dw_alm)
destroy(this.gb_1)
destroy(this.dw_cab)
end on

event closequery;if nuevo > 0 or cambio then 
	if messageBox('Aviso','El documento no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	end if
end if

end event

event resize;t1.resize((newwidth - 50) , (newheight * 0.60))
t1.pp.dw_pc.resize(5950,(t1.height *0.53))
t1.pr.dw_rc.resize(310,(t1.height *0.53))
t1.pr.dw_rl.resize(2583,(t1.height *0.53))
t1.pd.dw_l.resize(3858,(t1.height *0.40))
t1.pr.pb_am.x=(newwidth - 50) - 200
end event

type st_9 from statictext within w_sum_sal
integer x = 1445
integer y = 4
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacén"
boolean focusrectangle = false
end type

type dw_lug from datawindow within w_sum_sal
integer x = 32
integer y = 8
integer width = 1285
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar_sumi"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
dw_lug.GetChild('codlugar', dwc_lugar)
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
		close(parent)
	end if
	dw_alm.setitem(1,'codalmacen','')
	dw_alm.InsertRow(1)
end if
//dwc_lugar.insertrow(1)
end event

event itemchanged;string ls_clugar
ls_clugar=data
if dwc_alm.Retrieve(usuario,'%',ls_clugar) = 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(0)
end if
dw_alm.setitem(row,'codalmacen','')
dw_alm.InsertRow(0)
if coddocumento = 'SD'  then 
	dwc_alm.setfilter("principal='1'")
	dwc_alm.filter()
end if

end event

type st_8 from statictext within w_sum_sal
boolean visible = false
integer x = 2674
integer y = 12
integer width = 814
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "Por configuración, no se trasladan activos fijos desde suministros"
boolean focusrectangle = false
end type

type pb_11 from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 3717
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Ver Existencias"
end type

event clicked;if not isNull(dw_alm.GetItemString(1,'codalmacen')) then
	openwithparm(w_kardex,dw_alm.GetItemString(1,'codalmacen'))
end if

end event

type pb_grabartmp from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
boolean visible = false
integer x = 3570
integer y = 12
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar Temporal"
end type

type pb_cancelar from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 4023
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
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

type pb_anular from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Anular Documento"
integer x = 4325
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Anular Documento"
end type

event clicked;long i, item, fila, f,j
string cd,cl
double nd
dec cantidad, devuelto

if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(1,'estado') = '2' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido anulado')
	return
end if
if dw_cab.GetItemString(1,'estado') = '3' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido atendido')
	return
end if
if dw_cab.GetItemString(1,'contabil') = 'C' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido llevado a contabilidad')
	return
end if
if f_valida_periodo_sum(dw_cab.GetItemdatetime(1,'fecha'))= -1 then 
	messageBox('Aviso','Periodo cerrado ya no se puede anular')
	return 
end if
if nuevo > 0 then
	pb_2.triggerEvent(clicked!)
	Return 0
end if
If messageBox('Aviso','Se Anulará el documento y reversarán movimientos en Kardex. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return

string ls_r_pac_org,ls_r_pac_det,ls_alm_org,ls_alm_det
ls_alm_org=dw_cab.GetItemString(1,'codalmacen')
ls_alm_det=dw_cab.GetItemString(1,'codalmacen_target')
select restringepac into :ls_r_pac_org from sumalmacen where codalmacen = :ls_alm_org;
select restringepac into :ls_r_pac_det from sumalmacen where codalmacen = :ls_alm_det;
///fin agrega
st_xa_anular st_anula
st_anula.tipo='SM'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return -1
if dw_cab.GetItemString(1,'estado') = '1' then
	if f_kardexsalanula(dw_cab.GetItemString(1,'coddoc'),dw_cab.GetItemString(1,'clugar'),dw_cab.GetItemNumber(1,'numdoc'),dw_cab.GetItemString(1,'codalmacen')) = -1 then
		rollback;
		Return -1
	end if
	if coddocumento = 'ST' then
		if f_kardexentanula(dw_cab.GetItemString(1,'coddoc'),dw_cab.GetItemString(1,'clugar'),dw_cab.GetItemNumber(1,'numdoc'),dw_cab.GetItemString(1,'codalmacen_target')) = -1 then
			rollback;
			Return -1
		end if
	end if
	
	for i = 1 to t1.pd.dw_cpo.RowCount()
		t1.pd.dw_cpo.ScrolltoRow(i)
		if update_ori(t1.pd.dw_cpo.GetItemString(i,'coddoc_ori'),t1.pd.dw_cpo.GetItemString(i,'clugar_ori'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc_ori'),t1.pd.dw_cpo.GetItemNumber(i,'item_ori'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad')* -1) = -1 then
			Rollback;
			Return -1
		end if
		if coddocumento = 'ST' then
			if ls_r_pac_org='1' then 
				if f_updatePAC(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad') ,dw_cab.GetItemDateTime(1,'fecha')) = -1 then 
					Rollback;
					Return -1
				end if
			end if
			if ls_r_pac_det='1' then 
				if f_updatePAC(dw_cab.GetItemString(1,'codalmacen_target'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad')* -1,dw_cab.GetItemDateTime(1,'fecha')) = -1 then 
					Rollback;
					reversa()
					Return -1
				end if
			end if
		end if
		
	next
end if

dw_cab.SetItem(1,'Estado','2')
dw_cab.SetItem(dw_cab.GetRow(),'anulado',usuario)
dw_cab.SetItem(dw_cab.GetRow(),'fechaanula',datetime(today(),now()))
dw_cab.SetItem(dw_cab.GetRow(),'motivo_anula',st_anula.observacion)
dw_cab.SetItem(dw_cab.GetRow(),'cod_anula',st_anula.motivo)
if dw_cab.Update() = 1 then
	commit;
else
	rollback;
	return -1
end if
dw_c.SetItem(dw_c.GetRow(),'estado','2')
dw_c.SetItem(dw_c.GetRow(),'anulado',usuario)
dw_c.SetItem(dw_c.GetRow(),'fechaanula',today())
dw_cab.triggerEvent(RowFocuschanged!)

end event

type pb_grabardef from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Grabar Definitivo"
integer x = 4475
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Grabar Definitivo"
end type

event clicked;if dw_cab.RowCount() = 0 then Return -1
int ret
if not(dw_cab.GetItemString(1,'estado') = '0') then
	MessageBox('Atención','El documento no es nuevo')
	Return -1
end if

if f_num_compu('s','o') = FALSE then Return -1
t1.pd.dw_cpo.SetFilter("")
t1.pd.dw_cpo.Filter()
if t1.pd.dw_cpo.RowCount() = 0 then 
	MessageBox('Atención','No ha agregado ningun artículo al detalle del documento')
	Return -1
end if
If messageBox('Aviso','Se grabará definitivamente, no podrá realizar cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return 0

long i,j,f
double numdoc

if nuevo > 0 then
	numdoc = f_trae_ndoc(dw_cab.GetItemString(1,'coddoc'),clugar,Parent.Title)
	if numdoc < 0 then Return -1
	dw_cab.SetItem(1,'numdoc',numdoc)
	
	t1.pd.dw_cpo.SetRedraw(FALSE)
	dec monto=0
	for i = 1 to t1.pd.dw_cpo.RowCount()
		t1.pd.dw_cpo.SetItem(i,'numdoc',numdoc)
		t1.pd.dw_cpo.ScrolltoRow(i)
		t1.pd.dw_cpo.Event RowFocuschanged(i)
		if t1.pd.dw_cpo.GetItemString(i,'vence') = '1' and not(t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = double(t1.pd.dw_l.Describe("Evaluate('sum(cantidad)',0)"))) then
			t1.pd.dw_cpo.SetRedraw(TRUE)
			if Messagebox('Aviso','La cantidad no coincide con las cantidades en lotes. Desea retirar el articulo y Continuar?. Articulo:' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'),QUESTION!,YESNO!) = 2 then
				Rollback;
				reversa()
				Return -1
			end if
			t1.pd.pb_6.TriggerEvent(clicked!)
		end if
		for j = 1 to t1.pd.dw_l.RowCount()
			t1.pd.dw_l.SetItem(j,'numdoc',numdoc)
		next
		monto = monto + round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral)
	next
	dw_cab.SetItem(1,'valor_agregado',monto)
	t1.pd.dw_cpo.SetRedraw(TRUE)
end if

dw_cab.SetItem(1,'estado','1')
if dw_cab.Update() = -1 then
	Rollback;
	reversa()
	Return -1
end if

if t1.pd.dw_cpo.Update() = -1 then
	Rollback;
	reversa()
	Return -1
end if
if t1.pd.dw_l.Update() = -1 then
	Rollback;
	reversa()
	Return -1
end if

if codDocumento = 'ST' then
	uo_DataStore dw_l2
	dw_l2 = Create uo_DataStore
	dw_l2.DataObject = 'dw_mvto_lote'
	dw_l2.SetTransObject(SQLCA)
	for i = 1 to t1.pd.dw_cpo.RowCount()
		t1.pd.dw_cpo.ScrolltoRow(i)
		t1.pd.dw_cpo.Event RowFocuschanged(i)
		for j = 1 to t1.pd.dw_l.RowCount()
			f = dw_l2.InsertRow(0)
			dw_l2.SetItem(f,'codalmacen',dw_cab.GetItemString(1,'codalmacen_target'))
			dw_l2.SetItem(f,'codarticulo',t1.pd.dw_l.GetItemString(j,'codarticulo'))
			dw_l2.SetItem(f,'lote',t1.pd.dw_l.GetItemString(j,'lote'))
			dw_l2.SetItem(f,'convenio',t1.pd.dw_l.GetItemString(j,'convenio'))
			dw_l2.SetItem(f,'coddoc',t1.pd.dw_cpo.GetItemString(i,'coddoc'))
			dw_l2.SetItem(f,'clugar',t1.pd.dw_cpo.GetItemString(i,'clugar'))
			dw_l2.SetItem(f,'numdoc',t1.pd.dw_cpo.GetItemNumber(i,'numdoc'))
			dw_l2.SetItem(f,'item',t1.pd.dw_cpo.GetItemNumber(i,'item'))
			dw_l2.SetItem(f,'fecha_venc',t1.pd.dw_l.GetItemDateTime(j,'fecha_venc'))
			dw_l2.SetItem(f,'cantidad',t1.pd.dw_l.GetItemNumber(j,'cantidad'))
			dw_l2.SetItem(f,'signo',t1.pd.dw_l.GetItemNumber(j,'signo') * -1)
			dw_l2.SetItem(f,'estado','1')			
		next
	next
	if dw_l2.Update() = -1 then
		Rollback;
		reversa()
		Return -1
	end if
end if

string ls_r_pac_org,ls_r_pac_det,ls_alm_org,ls_alm_det
ls_alm_org=dw_cab.GetItemString(1,'codalmacen')
ls_alm_det=dw_cab.GetItemString(1,'codalmacen_target')
select restringepac into :ls_r_pac_org from sumalmacen where codalmacen = :ls_alm_org;
select restringepac into :ls_r_pac_det from sumalmacen where codalmacen = :ls_alm_det;
///fin agrega
for i = 1 to t1.pd.dw_cpo.RowCount()
	t1.pd.dw_cpo.ScrolltoRow(i)
	t1.pd.dw_cpo.event rowfocuschanged(i)
	if t1.pd.dw_cpo.GetItemString(i,'vence') = '1' and not(t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = double(t1.pd.dw_l.Describe("Evaluate('sum(cantidad)',0)"))) then Continue

	if f_kardexsalida(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),dw_cab.GetItemDateTime(1,'fecha')) = -1 then
		Rollback;
		reversa()
		Return -1
	end if
	if codDocumento = 'ST' then
		if f_kardexentrada(dw_cab.GetItemString(1,'codalmacen_target'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_cpo.GetItemNumber(i,'valor_unit'),getporcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100,dw_cab.GetItemDateTime(1,'fecha')) = -1 then
			Rollback;
			reversa()
			Return -1
		end if
		if ls_alm_org='1' then 
			if f_updatePAC(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad') * -1,dw_cab.GetItemDateTime(1,'fecha')) = -1 then 
				Rollback;
				Return -1
			end if
		end if
		if ls_alm_det='1' then 
			if f_updatePAC(dw_cab.GetItemString(1,'codalmacen_target'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad'),dw_cab.GetItemDateTime(1,'fecha')) = -1 then 
				Rollback;
				reversa()
				Return -1
			end if
		end if
	end if
	for j = 1 to t1.pd.dw_l.RowCount()
		if  f_act_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_l.GetItemNumber(j,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_l.GetItemString(j,'lote'),t1.pd.dw_l.GetItemDateTime(j,'fecha_venc'),t1.pd.dw_l.GetItemNumber(j,'signo'),dw_cab.GetItemString(1,'codalmacen_target'),t1.pd.dw_l.GetItemString(j,'convenio')) = -1 then		
			Rollback;
			reversa()
			Return -1
		end if
	next
	
	if t1.pd.dw_cpo.GetItemString(i,'vence') = '1' then
		if verificaKardex_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo')) = -1 then
			Rollback;
			reversa()
			messageBox('Error','La cantidad en Kardex no coincide con la cantidad en Lotes. Art:'+t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
			Return -1
		end if
	end if
	if update_ori(t1.pd.dw_cpo.GetItemString(i,'coddoc_ori'),t1.pd.dw_cpo.GetItemString(i,'clugar_ori'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc_ori'),t1.pd.dw_cpo.GetItemNumber(i,'item_ori'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad')) = -1 then
		Rollback;
		reversa()
		Return -1
	end if
	t1.pd.dw_cpo.SetItem(i,'lote','1')
	if mod(i,5) = 0 then GarbageCollect()
next

nuevo = 0
cambio = FALSE
commit;
dw_c.SetItem(dw_c.GetRow(),'numdoc',numdoc)
dw_c.SetItem(dw_c.GetRow(),'estado','1')
Return 0

end event

type pb_3 from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 4174
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir Reporte"
end type

event clicked;if dw_cab.RowCount() < 1 then Return
any param[10]
param[1] = dw_cab.GetItemString(1,'coddoc')
param[2] = dw_cab.GetItemString(1,'clugar')
param[3] = dw_cab.GetItemNumber(1,'numdoc')

f_reporte(dw_cab.GetItemString(1,'coddoc'),Title,param)

end event

type pb_lote from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Asignar Lotes (Vencimiento)"
boolean visible = false
integer x = 3867
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "index.gif"
string disabledname = "d_index.gif"
alignment htextalign = left!
string powertiptext = "Asignar Lotes (Vencimiento)"
end type

event constructor;//if g_vencimiento = '0' then
//	this.Enabled = FALSE
//	this.Visible = FALSE
//end if
//
end event

type pb_nuevo from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 4622
integer y = 12
integer width = 146
integer height = 128
integer taborder = 30
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
string powertiptext = "Nuevo documento"
end type

event clicked;if nuevo > 0 then
	MessageBox('Atención','Existe un documento nuevo sin grabar')
	Return -1
end if
if isNull(dw_alm.GetItemString(1,'codalmacen')) then
	MessageBox('Atención','Debe seleccionar un almacen')
	Return -1
end if
dw_cab.Reset()
dw_c.ScrolltoRow(dw_c.InsertRow(1))
dw_c.SetItem(1,'coddoc',codDocumento)
dw_c.SetItem(1,'clugar',clugar)
dw_c.SetItem(1,'fecha',today())
dw_c.SetItem(1,'estado','0')
dw_c.SetItem(1,'usuario',usuario)

dw_cab.InsertRow(1)
dw_cab.SetItem(1,'coddoc',codDocumento)
dw_cab.SetItem(1,'clugar',clugar)
dw_cab.SetItem(1,'codalmacen',dw_alm.GetItemString(1,'codalmacen'))
dw_cab.SetItem(1,'fecha',today())
dw_cab.SetItem(1,'estado','0')
dw_cab.SetItem(1,'usuario',usuario)

nuevo = 1
Return 0

end event

type pb_2 from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4773
integer y = 12
integer width = 146
integer height = 128
integer taborder = 30
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
string powertiptext = "Eliminar documento Nuevo"
end type

event clicked;if nuevo > 0 then
	dw_c.DeleteRow(nuevo)
	nuevo = 0
	dw_c.TriggerEvent(RowFocusChanged!)
else
	MessageBox('Atención','Solo documentos recientemente creados pueden eliminarse, los guardados temporalmente podrán ser anulados')
end if

end event

type pb_4 from picturebutton within w_sum_sal
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4919
integer y = 12
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "lupa.gif"
string disabledname = "d_lupa.gif"
alignment htextalign = left!
string powertiptext = "Buscar Tercero"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado. ')
	Return 0
end if
if t1.pr.dw_r.RowCount() > 0 then
	MessageBox('Atención','Tiene agregados documentos relacionados. Debe primero retirarlos para cambiar de tercero')
	Return -1
end if
if dw_cab.GetItemString(dw_cab.Getrow(),'estado') = '0' then
	g_tercerodesde=13
	openwithparm(w_buscater,dw_cab)
	dw_cab.SetColumn('documento')
	dw_cab.TriggerEvent(itemchanged!)
end if

end event

type t1 from tab within w_sum_sal
integer x = 37
integer y = 836
integer width = 6121
integer height = 1400
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
pp pp
pr pr
pd pd
end type

on t1.create
this.pp=create pp
this.pr=create pr
this.pd=create pd
this.Control[]={this.pp,&
this.pr,&
this.pd}
end on

on t1.destroy
destroy(this.pp)
destroy(this.pr)
destroy(this.pd)
end on

type pp from userobject within t1
integer x = 18
integer y = 112
integer width = 6085
integer height = 1272
long backcolor = 67108864
string text = "Pendientes"
long tabtextcolor = 33554432
string picturename = "cambia_doc.ico"
long picturemaskcolor = 536870912
string powertiptext = "Relación de Documentos pendientes de atender"
st_3 st_3
st_2 st_2
pb_ca pb_ca
pb_1 pb_1
pb_7 pb_7
dw_p dw_p
dw_pc dw_pc
end type

on pp.create
this.st_3=create st_3
this.st_2=create st_2
this.pb_ca=create pb_ca
this.pb_1=create pb_1
this.pb_7=create pb_7
this.dw_p=create dw_p
this.dw_pc=create dw_pc
this.Control[]={this.st_3,&
this.st_2,&
this.pb_ca,&
this.pb_1,&
this.pb_7,&
this.dw_p,&
this.dw_pc}
end on

on pp.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_ca)
destroy(this.pb_1)
destroy(this.pb_7)
destroy(this.dw_p)
destroy(this.dw_pc)
end on

type st_3 from statictext within pp
integer x = 69
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documentos"
boolean focusrectangle = false
end type

type st_2 from statictext within pp
integer x = 69
integer y = 440
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Artículos"
boolean focusrectangle = false
end type

type pb_ca from picturebutton within pp
event mousemove pbm_mousemove
integer x = 3525
integer y = 304
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Cierre Arbitrario"
end type

event clicked;If messageBox('Atención','Está seguro de querer cambiar el estado del documento '+string(dw_p.GetItemNumber(dw_p.GetRow(),'numdoc'))+' ?') = 2 then Return 
string cd,cl
double nd

cd = dw_p.GetItemString(dw_p.GetRow(),'coddoc')
cl = dw_p.GetItemString(dw_p.GetRow(),'clugar')
nd = dw_p.GetItemNumber(dw_p.GetRow(),'numdoc')

update sum_mvto_cab set estado = '3'
where coddoc=:cd and clugar=:cl and numdoc=:nd;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("Error actualizando sum_mvto_cab set estado = '3'", SQLCA.SQLErrText)
	Return -1
END IF
pb_1.TriggerEvent(clicked!)
commit;

end event

type pb_1 from picturebutton within pp
event mousemove pbm_mousemove
integer x = 3525
integer y = 176
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
string powertiptext = "Refrescar"
end type

event clicked;dw_pc.Reset()
dw_p.Reset()
dw_p.Retrieve(dw_alm.GetItemString(1,'codalmacen'),coddoc_rel)

end event

type pb_7 from picturebutton within pp
event mousemove pbm_mousemove
integer x = 3525
integer y = 48
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
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Llevar a relacionados"
end type

event clicked;long fila, f, i
string cd, cl, td, doc
double nd, it
if dw_cab.RowCount() <= 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	if messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado. Desea crear uno nuevo?',QUESTION!,YESNO!) = 2 then return -1
	if pb_nuevo.Event Clicked() = -1 then Return -1
end if

td = dw_p.GetItemString(dw_p.GetRow(),'tipodoc')
doc = dw_p.GetItemString(dw_p.GetRow(),'documento')
if not isNull(dw_cab.GetItemString(1,'documento')) then
	if not( td = dw_cab.GetItemString(1,'tipodoc') and doc = dw_cab.GetItemString(1,'documento') ) then
		MessageBox('Atención','No puede adicionar documentos de diferentes terceros')
		return -1
	end if
end if

if not isNull(dw_cab.GetItemString(1,'codalmacen_target')) then
	if not( dw_p.GetItemString(dw_p.GetRow(),'codalmacen') = dw_cab.GetItemString(1,'codalmacen_target') ) then
		MessageBox('Atención','No puede adicionar documentos de diferentes almacenes')
		return -1
	end if
end if

cd = dw_p.GetItemString(dw_p.GetRow(),'coddoc')
cl = dw_p.GetItemString(dw_p.GetRow(),'clugar')
nd = dw_p.GetItemNumber(dw_p.GetRow(),'numdoc')
fila = t1.pr.dw_r.Find("coddoc='"+cd+"' and clugar='"+cl+"' and numdoc="+string(nd),1,t1.pr.dw_r.RowCount())
if fila = 0 then
	dw_cab.SetItem(1,'lg_target',cl)
	dw_cab.SetItem(1,'codalmacen_target',dw_p.GetItemString(dw_p.GetRow(),'codalmacen'))
	dw_cab.SetItem(1,'tipodoc',td)
	dw_cab.SetItem(1,'documento',doc)
	dw_cab.SetItem(1,'nombre1',dw_p.GetItemString(dw_p.GetRow(),'nombre1'))
	dw_cab.SetItem(1,'nombre2',dw_p.GetItemString(dw_p.GetRow(),'nombre2'))
	dw_cab.SetItem(1,'apellido1',dw_p.GetItemString(dw_p.GetRow(),'apellido1'))
	dw_cab.SetItem(1,'apellido2',dw_p.GetItemString(dw_p.GetRow(),'apellido2'))
	dw_cab.SetItem(1,'razon_social',dw_p.GetItemString(dw_p.GetRow(),'razon_social'))
	dw_c.SetItem(dw_c.GetRow(),'tipodoc',td)
	dw_c.SetItem(dw_c.GetRow(),'documento',doc)
	dw_c.SetItem(dw_c.GetRow(),'nombre1',dw_p.GetItemString(dw_p.GetRow(),'nombre1'))
	dw_c.SetItem(dw_c.GetRow(),'nombre2',dw_p.GetItemString(dw_p.GetRow(),'nombre2'))
	dw_c.SetItem(dw_c.GetRow(),'apellido1',dw_p.GetItemString(dw_p.GetRow(),'apellido1'))
	dw_c.SetItem(dw_c.GetRow(),'apellido2',dw_p.GetItemString(dw_p.GetRow(),'apellido2'))
	dw_c.SetItem(dw_c.GetRow(),'razon_social',dw_p.GetItemString(dw_p.GetRow(),'razon_social'))
	
	fila = t1.pr.dw_r.InsertRow(0)
	t1.pr.dw_r.SetItem(fila,'coddoc',cd)
	t1.pr.dw_r.SetItem(fila,'clugar',cl)
	t1.pr.dw_r.SetItem(fila,'numdoc',nd)
	t1.pr.dw_r.SetItem(fila,'fecha',dw_p.GetItemDateTime(dw_p.GetRow(),'fecha'))
	t1.pr.dw_r.SetItem(fila,'estado',dw_p.GetItemString(dw_p.GetRow(),'estado'))
	t1.pr.dw_r.SetItem(fila,'usuario',dw_p.GetItemString(dw_p.GetRow(),'usuario'))
	t1.pr.dw_rc.Event Rowfocuschanged(fila)
	t1.pr.dw_rc.Retrieve(cd,cl,nd,dw_cab.GetItemString(1,'codalmacen'))
	if coddocumento = 'SD' then
		t1.pr.dw_rl.Retrieve(cd,cl,nd)
	end if
end if

t1.SelectTab(t1.pr)

end event

type dw_p from datawindow within pp
integer x = 64
integer y = 56
integer width = 3438
integer height = 380
integer taborder = 20
string title = "none"
string dataobject = "dw_mvto_req_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_pc.Reset()
if currentrow = 0 or rowCount() = 0 then Return
dw_pc.Retrieve(GetItemString(Getrow(),'coddoc'),GetItemString(Getrow(),'clugar'),GetItemNumber(Getrow(),'numdoc'))

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event clicked;if row <= 0 then Return

if GetRow() <> row then
	ScrolltoRow(row)
end if

end event

type dw_pc from datawindow within pp
integer x = 64
integer y = 500
integer width = 5952
integer height = 704
integer taborder = 30
string title = "none"
string dataobject = "dw_mvto_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type pr from userobject within t1
integer x = 18
integer y = 112
integer width = 6085
integer height = 1272
long backcolor = 67108864
string text = "Documentos Relacionados"
long tabtextcolor = 33554432
string picturename = "copiar.ico"
long picturemaskcolor = 536870912
string powertiptext = "Documentos que se atienden"
st_4 st_4
st_1 st_1
rb_m rb_m
rb_s rb_s
pb_delorden pb_delorden
pb_5 pb_5
dw_r dw_r
dw_rl dw_rl
pb_am pb_am
dw_rc dw_rc
end type

on pr.create
this.st_4=create st_4
this.st_1=create st_1
this.rb_m=create rb_m
this.rb_s=create rb_s
this.pb_delorden=create pb_delorden
this.pb_5=create pb_5
this.dw_r=create dw_r
this.dw_rl=create dw_rl
this.pb_am=create pb_am
this.dw_rc=create dw_rc
this.Control[]={this.st_4,&
this.st_1,&
this.rb_m,&
this.rb_s,&
this.pb_delorden,&
this.pb_5,&
this.dw_r,&
this.dw_rl,&
this.pb_am,&
this.dw_rc}
end on

on pr.destroy
destroy(this.st_4)
destroy(this.st_1)
destroy(this.rb_m)
destroy(this.rb_s)
destroy(this.pb_delorden)
destroy(this.pb_5)
destroy(this.dw_r)
destroy(this.dw_rl)
destroy(this.pb_am)
destroy(this.dw_rc)
end on

type st_4 from statictext within pr
integer x = 2533
integer y = 36
integer width = 3520
integer height = 448
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
boolean focusrectangle = false
end type

type st_1 from statictext within pr
integer x = 37
integer y = 444
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Artículos"
boolean focusrectangle = false
end type

type rb_m from radiobutton within pr
integer x = 1760
integer y = 156
integer width = 585
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Atender manualmente"
end type

type rb_s from radiobutton within pr
integer x = 1760
integer y = 72
integer width = 677
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sugerir según existencias"
boolean checked = true
end type

type pb_delorden from picturebutton within pr
event mousemove pbm_mousemove
string tag = "Retirar Orden"
integer x = 1545
integer y = 168
integer width = 146
integer height = 128
integer taborder = 120
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
string powertiptext = "Retirar"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return -1
end if

string cd, cl
long nd, fila, i
cd = t1.pr.dw_r.GetItemString(t1.pr.dw_r.Getrow(),'coddoc')
cl = t1.pr.dw_r.GetItemString(t1.pr.dw_r.Getrow(),'clugar')
nd = t1.pr.dw_r.GetItemNumber(t1.pr.dw_r.Getrow(),'numdoc')

fila = t1.pd.dw_cpo.Find("coddoc_ori='" + cd + "' and clugar_ori='" + cl + "' and numdoc_ori=" + string(nd),1,t1.pd.dw_cpo.RowCount())
do while fila > 0
	t1.pd.dw_cpo.ScrolltoRow(fila)
	t1.pd.pb_6.TriggerEvent(clicked!)
	fila = t1.pd.dw_cpo.Find("coddoc_ori='" + cd + "' and clugar_ori='" + cl + "' and numdoc_ori=" + string(nd),1,t1.pd.dw_cpo.RowCount())
loop

dw_rl.SetRedraw(FALSE)
dw_rc.SetRedraw(FALSE)
for i = 1 to dw_rc.RowCount()
	dw_rc.ScrolltoRow(i)
	do while dw_rl.RowCount() > 0
		dw_rl.DeleteRow(1)
	loop
next
do while dw_rc.RowCount() > 0
	dw_rc.scrolltoRow(1)
	dw_rc.DeleteRow(1)
loop
dw_r.DeleteRow(dw_r.Getrow())
dw_rl.SetRedraw(TRUE)
dw_rc.SetRedraw(TRUE)
dw_r.TriggerEvent(rowfocuschanged!)
if dw_r.RowCount() = 0 then
	string vnul
	setNull(vnul)
	dw_cab.SetItem(1,'tipodoc',vnul)
	dw_cab.SetItem(1,'documento',vnul)
	dw_cab.SetItem(1,'nombre1',vnul)
	dw_cab.SetItem(1,'razon_social',vnul)
	dw_c.SetItem(dw_c.GetRow(),'tipodoc',vnul)
	dw_c.SetItem(dw_c.GetRow(),'documento',vnul)
	dw_c.SetItem(dw_c.GetRow(),'nombre1',vnul)
	dw_c.SetItem(dw_c.GetRow(),'razon_social',vnul)
	t1.pp.dw_p.SetFilter("")
	t1.pp.dw_p.Filter()
end if
cambio = TRUE

end event

type pb_5 from picturebutton within pr
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 1545
integer y = 28
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Llevar al detalle"
end type

event clicked;long i, j, fila, v_tmp
string estado, valor
dec entregado

if dw_cab.RowCount() = 0 then Return
dw_r.TriggerEvent(rowFocusChanged!)
if dw_cab.GetItemString(1,'estado') <> '0' then
	messageBox('Aviso','El documento de  ' + string(dw_cab.GetItemNumber(1,'numdoc')) +  ' ya ha sido cerrado')
	return
end if
dw_rc.SetFilter("")
dw_rc.Filter()
if t1.pr.dw_rc.Find('aentregar > 0',1,t1.pr.dw_rc.RowCount()) = 0 then Return
	
if t1.pr.dw_rc.AcceptText() = -1 then
	Return
end if

if rb_s.checked then // Atender sugerido desde kardex
	
For i = 1 to t1.pr.dw_rc.RowCount()
	t1.pr.dw_rc.ScrolltoRow(i)
	if t1.pr.dw_rc.GetItemNumber(i,'aentregar') > 0 and t1.pr.dw_rc.GetItemNumber(i,'selec') = 1 then
		
		fila = t1.pd.dw_cpo.Find("coddoc_ori='" + t1.pr.dw_rc.GetItemString(i,'coddoc') + &
			"' and clugar_ori='" + t1.pr.dw_rc.GetItemString(i,'cLugar') +&
			"' and numdoc_ori=" + string(t1.pr.dw_rc.GetItemNumber(i,'numdoc')) +&
			" and item_ori=" + string(t1.pr.dw_rc.GetItemNumber(i,'item')) , 1, t1.pd.dw_cpo.RowCount())
		if fila = 0 then
			valor = t1.pd.dw_cpo.describe("Evaluate('max(item)', 1)")
			fila = t1.pd.dw_cpo.InsertRow(0)
			t1.pd.dw_cpo.SetItem(fila,'coddoc',dw_cab.GetItemString(1,'coddoc'))
			t1.pd.dw_cpo.SetItem(fila,'cLugar',dw_cab.GetItemString(1,'clugar'))
			t1.pd.dw_cpo.SetItem(fila,'numdoc',dw_cab.GetItemNumber(1,'numdoc'))
			t1.pd.dw_cpo.SetItem(fila,'item',long(valor) + 1)
			t1.pd.dw_cpo.SetItem(fila,'coddoc_ori',t1.pr.dw_rc.GetItemString(i,'coddoc'))
			t1.pd.dw_cpo.SetItem(fila,'cLugar_ori',t1.pr.dw_rc.GetItemString(i,'cLugar'))
			t1.pd.dw_cpo.SetItem(fila,'numdoc_ori',t1.pr.dw_rc.GetItemNumber(i,'numdoc'))
			t1.pd.dw_cpo.SetItem(fila,'item_ori',t1.pr.dw_rc.GetItemNumber(i,'item'))
			t1.pd.dw_cpo.SetItem(fila,'codarticulo',t1.pr.dw_rc.GetItemString(i,'codarticulo'))
			t1.pd.dw_cpo.SetItem(fila,'codgenerico',t1.pr.dw_rc.GetItemString(i,'codgenerico'))
			t1.pd.dw_cpo.SetItem(fila,'cantidad',t1.pr.dw_rc.GetItemNumber(i,'aentregar'))
			t1.pd.dw_cpo.SetItem(fila,'valor_unit',t1.pr.dw_rc.GetItemNumber(i,'valor_unit'))
			t1.pd.dw_cpo.SetItem(fila,'descripcion',t1.pr.dw_rc.GetItemString(i,'descripcion'))
			t1.pd.dw_cpo.SetItem(fila,'estado','1')
			t1.pd.dw_cpo.SetItem(fila,'cod_impu',t1.pr.dw_rc.GetItemString(i,'cod_impu'))
			t1.pd.dw_cpo.SetItem(fila,'vence',t1.pr.dw_rc.GetItemString(i,'vence'))
			t1.pd.dw_cpo.SetItem(fila,'act_fijo',t1.pr.dw_rc.GetItemString(i,'act_fijo'))
			t1.pd.dw_cpo.SetItem(fila,'saldoactual',t1.pr.dw_rc.GetItemNumber(i,'saldoactual'))
		else
			t1.pd.dw_cpo.SetItem(fila,'cantidad', t1.pr.dw_rc.GetItemNumber(i,'aentregar') )
		end if
		t1.pd.dw_cpo.ScrolltoRow(fila)
		for j = 1 to t1.pr.dw_rl.RowCount()
			if t1.pr.dw_rl.GetItemNumber(j,'aentregar') > 0 and t1.pr.dw_rl.GetItemNumber(j,'selec') = 1 then
				fila = t1.pd.dw_l.Find("codarticulo='" + t1.pr.dw_rl.GetItemString(j,'codarticulo') + &
					"' and upper(lote)='" + upper(t1.pr.dw_rl.GetItemString(j,'lote')) + "' and upper(convenio)='"+upper(t1.pr.dw_rl.GetItemString(j,'convenio'))+"'", 1, t1.pd.dw_cpo.RowCount())
				if fila = 0 then
					fila = t1.pd.dw_l.InsertRow(0)
					t1.pd.dw_l.SetItem(fila,'codalmacen',t1.pr.dw_rl.GetItemString(j,'codalmacen'))
					t1.pd.dw_l.SetItem(fila,'codarticulo',t1.pr.dw_rl.GetItemString(j,'codarticulo'))
					t1.pd.dw_l.SetItem(fila,'lote',t1.pr.dw_rl.GetItemString(j,'lote'))
					t1.pd.dw_l.SetItem(fila,'convenio',t1.pr.dw_rl.GetItemString(j,'convenio'))
					t1.pd.dw_l.SetItem(fila,'fecha_venc',t1.pr.dw_rl.GetItemDateTime(j,'fecha_venc'))
					t1.pd.dw_l.SetItem(fila,'coddoc',dw_cab.GetItemString(1,'coddoc'))
					t1.pd.dw_l.SetItem(fila,'cLugar',dw_cab.GetItemString(1,'clugar'))
					t1.pd.dw_l.SetItem(fila,'numdoc',dw_cab.GetItemNumber(1,'numdoc'))
					t1.pd.dw_l.SetItem(fila,'item',t1.pd.dw_cpo.GetItemNumber(t1.pd.dw_cpo.GetRow(),'item'))
					t1.pd.dw_l.SetItem(fila,'cantidad',t1.pr.dw_rl.GetItemNumber(j,'aentregar'))
					t1.pd.dw_l.SetItem(fila,'estado','1')
					t1.pd.dw_l.SetItem(fila,'signo',-1)
					t1.pd.dw_l.SetItem(fila,'saldo_lote',t1.pr.dw_rl.GetItemNumber(j,'saldoactual') - t1.pr.dw_rl.GetItemNumber(j,'devuelto'))
//					t1.pd.dw_l.SetItem(fila,'saldo_lote',t1.pr.dw_rl.GetItemNumber(j,'cantidad') - t1.pr.dw_rl.GetItemNumber(j,'devuelto'))
				else
					t1.pd.dw_l.SetItem(fila,'cantidad', t1.pr.dw_rc.GetItemNumber(j,'aentregar') )
					t1.pd.dw_l.SetItem(fila,'estado','1')					
				end if
			end if
		next
	end if
Next

if codDocumento = 'ST' or codDocumento = 'SFR' then
	sugerirKardex(dw_cab.GetItemString(1,'codalmacen'), t1.pd.dw_cpo, t1.pd.dw_l)
end if

else // Atender manualmente
	For i = 1 to t1.pr.dw_rc.RowCount()
		if t1.pr.dw_rc.GetItemNumber(i,'aentregar') >= 0 and t1.pr.dw_rc.GetItemNumber(i,'selec') = 1 then
			t1.pr.dw_rc.ScrolltoRow(i)
			pb_am.TriggerEvent(clicked!)
		end if
	next
end if
t1.pd.dw_cpo.TriggerEvent(rowfocuschanged!)
t1.SelectTab(t1.pd)
cambio = TRUE

end event

type dw_r from datawindow within pr
integer x = 32
integer y = 28
integer width = 1431
integer height = 404
integer taborder = 30
string title = "none"
string dataobject = "dw_mvto_rel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_rc.SetFilter("")
dw_rc.Filter()

if currentrow = 0 or RowCount() = 0 then Return
string cd,cl
double nd
cd = this.GetItemstring(GetRow(),'coddoc')
cl = this.GetItemstring(GetRow(),'clugar')
nd = this.GetItemNumber(GetRow(),'numdoc')
if not isNull(nd) then
	dw_rc.SetFilter("coddoc='"+cd+"' and clugar='"+cl+"' and numdoc="+string(nd))
	dw_rc.Filter()
end if

end event

event retrieveend;string cd,cl
long nd, i
for i = 1 to rowcount()
	cd = GetItemstring(i,'coddoc')
	cl = GetItemstring(i,'clugar')
	nd = GetItemNumber(i,'numdoc')
	dw_rc.Retrieve(cd, cl, nd,dw_cab.GetItemString(1,'codalmacen'))
	t1.pr.dw_rl.Retrieve(cd,cl,nd)
next

end event

type dw_rl from datawindow within pr
boolean visible = false
integer x = 3465
integer y = 500
integer width = 2583
integer height = 696
integer taborder = 50
string title = "none"
string dataobject = "dw_mvto_lote_rel_sal"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrievestart;Return 2

end event

event constructor;setTransObject(SQLCA)

end event

event itemchanged;if AcceptText() = -1 then Return -1
if GetColumnName() = 'selec' then
	if data = '1' then
		dw_rc.SetItem(dw_rc.GetRow(),'selec',1)
	else
		SetItem(GetRow(),'aentregar',0)
		SetItem(GetRow(),'selec',0)
		if find("selec=1",1,RowCount()) = 0 then
			dw_rc.SetItem(dw_rc.GetRow(),'selec',0)
		end if
	end if
elseif GetColumnName() = 'aentregar' then
	if double(describe("Evaluate('sum(aentregar)',0)")) > (dw_rc.GetItemNumber(dw_rc.GetRow(),'cantidad') - dw_rc.GetItemNumber(dw_rc.GetRow(),'atendido')) then
		MessageBox('Atención','La cantidad a entregar debe estar entre cero y lo disponible')
		SetItem(GetRow(),'aentregar',0)
		SetText('0')
		Return 1
	end if
	dw_rc.SetItem(dw_rc.GetRow(),'aentregar',double(describe("Evaluate('sum(aentregar)',0)")))
	if dw_rc.GetItemNumber(dw_rc.GetRow(),'aentregar') > 0 then
		dw_rc.SetItem(dw_rc.GetRow(),'selec',1)
	else
		dw_rc.SetItem(dw_rc.GetRow(),'selec',0)
	end if
	if GetItemNumber(GetRow(),'aentregar') > 0 then
		dw_rl.SetItem(dw_rl.GetRow(),'selec',1)
	else
		dw_rl.SetItem(dw_rl.GetRow(),'selec',0)
	end if 
end if

end event

event clicked;if dwo.Name = 'selec_t' then
	int i
	if describe("selec_t.text") = 'Selec.' then
		for i = 1 to rowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
		dw_rc.SetItem(dw_rc.GetRow(),'selec',1)
	else
		for i = 1 to rowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
		dw_rc.SetItem(dw_rc.GetRow(),'selec',0)
	end if
end if

end event

event losefocus;setColumn('aentregar')
triggerEvent(itemchanged!)

end event

event retrieveend;long i
SetFilter("")
Filter()
for i = 1 to RowCount()
	if coddocumento = 'ST' then
		if GetItemNumber(i,'aentregar') > 0 then
			SetItem(i,'selec',1)
		end if
	elseif coddocumento = 'SD' then
		SetItem(i,'aentregar',0)
	end if
next
dw_rc.PostEvent(RowFocusChanged!)

end event

type pb_am from picturebutton within pr
event mousemove pbm_mousemove
integer x = 5303
integer y = 500
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Atender Manualmente"
end type

event clicked;st_sumgen st_p
if dw_rc.GetItemString(dw_rc.GetRow(),'act_fijo') = '1' and i_afijos then	Return 0

st_p.codalmacen = dw_cab.GetItemString(1,'codalmacen')
st_p.dw_cb = dw_cab
st_p.dw_cp = t1.pd.dw_cpo
st_p.dw_lt = t1.pd.dw_l
st_p.dw_rc = t1.pr.dw_rc
openwithparm(w_asignaart,st_p)
if t1.pr.dw_rc.rowcount()= 0 then 
	t1.SelectTab(t1.pd)
end if
end event

type dw_rc from datawindow within pr
integer x = 32
integer y = 500
integer width = 3310
integer height = 744
integer taborder = 40
string title = "none"
string dataobject = "dw_mvto_rel_cpo_sal"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

event retrievestart;Return 2

end event

event rowfocuschanged;if currentrow = 0 or RowCount() = 0 then Return
if not isNull(GetItemNumber(GetRow(),'item')) then
	dw_rl.SetFilter("item="+string(GetItemNumber(GetRow(),'item')))
	dw_rl.Filter()
end if

if GetItemString(GetRow(),'vence') = '1' and (coddocumento='SD') then
	Modify("aentregar.Edit.DisplayOnly=YES")
	width = dw_rl.x  - 250
	dw_rl.Visible = TRUE
else
	Modify("aentregar.Edit.DisplayOnly=NO")
	dw_rl.Visible = FALSE
	width =t1.width  - 250
end if

end event

event itemchanged;dec ae
ae = GetItemNumber(GetRow(),'aentregar')
if AcceptText() = -1 then Return -1
long i
if GetColumnName() = 'selec' then
	Return f_chequea(GetRow(),data)
elseif GetColumnName() = 'aentregar' then
	if coddocumento = 'SD'  or coddocumento = 'SFR' then
		if GetItemNumber(GetRow(),'aentregar') > GetItemNumber(GetRow(),'saldoactual') or GetItemNumber(GetRow(),'aentregar') > (GetItemNumber(GetRow(),'cantidad') - GetItemNumber(GetRow(),'atendido'))then
			SetItem(GetRow(),'aentregar',ae)
			SetText(string(ae))
			Return 1
		end if
	elseif codDocumento = 'ST' then
		if GetItemNumber(GetRow(),'aentregar') > GetItemNumber(GetRow(),'saldoactual') or GetItemNumber(GetRow(),'aentregar') > (GetItemNumber(GetRow(),'cantidad') - GetItemNumber(GetRow(),'atendido')) then
			SetItem(GetRow(),'aentregar',ae)
			SetText(string(ae))
			Return 1
		end if
		if GetItemNumber(GetRow(),'aentregar') > 0 then
			SetItem(GetRow(),'selec',1)
		else
			SetItem(GetRow(),'selec',0)
		end if
	end if
end if

end event

event clicked;if dwo.Name = 'selec_t' then
	int i, j
	SetRedraw(FALSE)
	if describe("selec_t.text") = 'Selec.' then
		for i = 1 to rowCount()
			f_chequea(i,'1')
			if GetItemNumber(i,'aentregar') > 0 then SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to rowCount()
			ScrolltoRow(i)
			SetItem(i,'selec',0)
			for j = 1 to dw_rl.RowCount()
				dw_rl.SetItem(j,'selec',0)
			next
		next
		Modify("selec_t.Text='Selec.'")
	end if
	ScrolltoRow(1)
	SetRedraw(TRUE)
end if

end event

event retrieveend;long i
for i = 1 to RowCount()
	if GetItemString(i,'act_fijo') = '1' and i_afijos then
		SetItem(i,'aentregar',0)
	else
		if coddocumento = 'ST' or coddocumento = 'SFR' then
			if GetItemNumber(i,'aentregar') > GetItemNumber(i,'saldoactual') then
				SetItem(i,'aentregar',GetItemNumber(i,'saldoactual'))
			end if
			if GetItemNumber(i,'aentregar') >= 0 then
				SetItem(i,'selec',1)
			end if
		elseif coddocumento = 'SD' then
			SetItem(i,'aentregar',0)
		end if
	end if
next

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type pd from userobject within t1
integer x = 18
integer y = 112
integer width = 6085
integer height = 1272
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Detalle de los productos a atender"
pb_placa pb_placa
st_7 st_7
st_6 st_6
st_5 st_5
pb_10 pb_10
pb_9 pb_9
pb_8 pb_8
pb_6 pb_6
dw_cpo dw_cpo
st_af st_af
dw_l dw_l
end type

on pd.create
this.pb_placa=create pb_placa
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.pb_10=create pb_10
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_6=create pb_6
this.dw_cpo=create dw_cpo
this.st_af=create st_af
this.dw_l=create dw_l
this.Control[]={this.pb_placa,&
this.st_7,&
this.st_6,&
this.st_5,&
this.pb_10,&
this.pb_9,&
this.pb_8,&
this.pb_6,&
this.dw_cpo,&
this.st_af,&
this.dw_l}
end on

on pd.destroy
destroy(this.pb_placa)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.pb_10)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_6)
destroy(this.dw_cpo)
destroy(this.st_af)
destroy(this.dw_l)
end on

type pb_placa from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Asignar Responsable"
boolean visible = false
integer x = 5294
integer y = 192
integer width = 146
integer height = 128
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "carpeta hoja.gif"
string disabledname = "d_carpeta hoja.gif"
alignment htextalign = left!
string powertiptext = "Asignar Responsable"
end type

event clicked;//long asignado, numdoc, item
//string cl
//st_asigna_resp st_p
//if dw_cpo.RowCount() = 0 then Return
//if dw_cpo.AcceptText() = -1 then 
//	Return
//end if
//if not (dw_cab.GetItemString(1,'estado') = '1') then
//	MessageBox('Atención','Sólo cuando haya sido grabado el documento - Estado terminado')
//	Return -1
//end if
//if isNull(dw_cpo.GetItemString(dw_cpo.getRow(),'act_fijo')) then
//	messageBox('Aviso','El artículo seleccionado no es activo fijo')
//	Return
//end if
//
//if dw_cpo.GetItemString(dw_cpo.getRow(),'act_fijo') <> '1' then
//	messageBox('Aviso','El artículo seleccionado no es activo fijo')
//	Return
//end if
//cl = dw_cpo.GetItemString(dw_cpo.getRow(),'clugar') 
//numdoc = dw_cpo.GetItemNumber(dw_cpo.getRow(),'numdoc') 
//item = dw_cpo.GetItemNumber(dw_cpo.getRow(),'item') 
//
//select count(*) into :asignado from af_respon
//where coddoc_tras=:codDocumento and cLugar_tras =:cLugar and numdoc_tras=:numdoc
//	and item_tras=:item;
//if asignado < dw_cpo.GetItemNumber(dw_cpo.getRow(),'cantidad') then
//	st_p.coddoc = dw_cpo.GetItemString(dw_cpo.GetRow(),'coddoc')
//	st_p.clugar = dw_cpo.GetItemString(dw_cpo.GetRow(),'clugar')
//	st_p.numdoc = dw_cpo.GetItemNumber(dw_cpo.GetRow(),'numdoc')
//	st_p.item = dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item')
//	st_p.codarticulo = dw_cpo.GetItemString(dw_cpo.GetRow(),'codarticulo')
//	st_p.codalmacen = dw_cab.GetItemString(1,'codalmacen')
//	st_p.codalmacen_target = dw_cab.GetItemString(1,'codalmacen_target')
//	st_p.item = dw_cpo.GetItemNumber(dw_cpo.GetRow(),'cantidad')
//	openSheetwithParm(w_af_respon,st_p,w_main_adm,10, Original!)
//else
//	messageBox('Aviso','El número de artículos requeridos ya ha sido asignado')
//end if
//
end event

type st_7 from statictext within pd
integer x = 82
integer y = 584
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lotes"
boolean focusrectangle = false
end type

type st_6 from statictext within pd
integer x = 82
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Artículos"
boolean focusrectangle = false
end type

type st_5 from statictext within pd
integer x = 4160
integer y = 812
integer width = 1326
integer height = 324
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Si desea cambiar la cantidad de la grilla Artículos, debe retirar la fila con el botón Retirar Registro y Volverlo a adicionar desde la grilla Artículos de documentos Relacionados"
boolean focusrectangle = false
end type

type pb_10 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 3968
integer y = 616
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Revisar Lotes"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if
if dw_cpo.RowCount() = 0 then Return

st_lote st_p
st_p.codalmacen = dw_cab.GetItemString(1,'codalmacen')
st_p.codarticulo = dw_cpo.GetItemString(dw_cpo.GetRow(),'codarticulo')
st_p.coddoc = dw_cab.GetItemString(1,'coddoc')
st_p.clugar = dw_cab.GetItemString(1,'clugar')
st_p.numdoc = dw_cab.GetItemNumber(1,'numdoc')
st_p.item = dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item')
st_p.c_itm = dw_cpo.GetItemString(dw_cpo.GetRow(),'descripcion')
st_p.c_cant = '1'
st_p.dw_obj = dw_l

openwithparm(w_lotes_articulo, st_p)
//dw_cpo.SetItem(dw_cpo.GetRow(),'cantidad',double(dw_l.Describe("Evaluate('sum(cantidad)',0)")))
cambio = TRUE

end event

type pb_9 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 3968
integer y = 756
integer width = 146
integer height = 128
integer taborder = 50
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
string powertiptext = "Retirar registro"
end type

event clicked;if dw_l.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

string codart
long f
dec cant

codart = dw_l.GetItemString(dw_l.GetRow(),'codarticulo')
cant = dw_l.GetItemNumber(dw_l.GetRow(),'cantidad')
f = dw_cpo.Find("codarticulo='"+codart+"'",1,dw_cpo.RowCount())
if f > 0 then
	dw_l.DeleteRow(0)
	dw_cpo.SetItem(f,'cantidad',double(dw_l.Describe("Evaluate('sum(cantidad)',0)")))
	if dw_cpo.GetItemNumber(f,'cantidad') <= 0 then
		dw_cpo.SetItem(f,'cantidad',0)
	end if
end if
dw_cpo.TriggerEvent(RowFocuschanged!)
cambio = TRUE

end event

type pb_8 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Nuevo documento"
boolean visible = false
integer x = 3968
integer y = 900
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar registro"
end type

event clicked;if dw_cpo.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

long f

f = dw_l.InsertRow(0)
dw_l.SetItem(f,'codalmacen',dw_cab.GetItemString(1,'codalmacen'))
dw_l.SetItem(f,'codarticulo',dw_cpo.GetItemString(dw_cpo.GetRow(),'codarticulo'))
dw_l.SetItem(f,'coddoc',dw_cpo.GetItemString(dw_cpo.GetRow(),'coddoc'))
dw_l.SetItem(f,'clugar',dw_cpo.GetItemString(dw_cpo.GetRow(),'clugar'))
dw_l.SetItem(f,'numdoc',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'numdoc'))
dw_l.SetItem(f,'item',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item'))
dw_l.SetItem(f,'signo',-1)
dw_l.SetItem(f,'estado',0)
dw_l.ScrolltoRow(f)

end event

type pb_6 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 5294
integer y = 60
integer width = 146
integer height = 128
integer taborder = 40
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
string powertiptext = "Retirar registro"
end type

event clicked;if dw_cpo.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

do while dw_l.RowCount() > 0 
	dw_l.DeleteRow(0)
loop

dw_cpo.DeleteRow(dw_cpo.GetRow())
dw_cpo.TriggerEvent(RowFocuschanged!)
cambio = TRUE

end event

type dw_cpo from datawindow within pd
integer x = 73
integer y = 56
integer width = 5179
integer height = 500
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;if this.RowCount() = 0 or currentRow = 0 then Return
if not isNull(GetItemNumber(GetRow(),'item')) then
	dw_l.SetFilter("codalmacen='"+dw_cab.GetItemString(1,'codalmacen')+"' and item="+string(GetItemNumber(GetRow(),'item')))
	dw_l.Filter()
end if
if GetItemString(GetRow(),'vence') = '1' then
	dw_l.Enabled = TRUE
	pb_8.Enabled = TRUE
	pb_9.Enabled = TRUE
	pb_10.Enabled = TRUE
else
	dw_l.Enabled = FALSE
	pb_8.Enabled = FALSE
	pb_9.Enabled = FALSE
	pb_10.Enabled = FALSE
end if

end event

event losefocus;AcceptText()

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event dberror;Rollback;
Return 0

end event

type st_af from statictext within pd
boolean visible = false
integer x = 4151
integer y = 648
integer width = 1467
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Si es un activo fijo, puede asignar responsable cuando guarde el documento."
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_l from datawindow within pd
integer x = 73
integer y = 636
integer width = 3858
integer height = 584
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_lote_sal"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;//long f, it
//if AcceptText() = -1 then Return
//if getColumnName() = 'cantidad' then
//	dw_cpo.SetItem(dw_cpo.GetRow(),'cantidad',long(describe("Evaluate('sum(cantidad)',0)")))
//end if

end event

event losefocus;setColumn('cantidad')
triggerEvent(itemchanged!)

end event

event dberror;Rollback;
Return 0

end event

type dw_c from datawindow within w_sum_sal
event borrarnuevo ( )
integer x = 69
integer y = 200
integer width = 3415
integer height = 556
integer taborder = 20
string title = "none"
string dataobject = "dw_mvto_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event borrarnuevo();if nuevo > 0 then
	DeleteRow(nuevo)
	nuevo = 0
	cambio = FALSE
	PostEvent(RowFocuschanged!)
end if

end event

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;dw_cab.Reset()
if currentrow = 0 or RowCount() = 0 then Return

if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	dw_cab.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
end if

end event

event rowfocuschanging;if nuevo > 0 then
	if MessageBox('Atención','El documento no ha sido guardado, desea continuar?',QUESTION!,YESNO!,2) = 2 then Return -1
	postEvent('borrarnuevo')
	Return -1
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event clicked;if row < 1 then Return 0
if GetRow() <> row then
	SetRow(row)
end if

end event

type dw_alm from datawindow within w_sum_sal
event retornar ( )
integer x = 1445
integer y = 56
integer width = 1157
integer height = 72
integer taborder = 10
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retornar();this.SetItem(1,'descripcion',codalm)

end event

event itemchanged;if nuevo > 0 then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		codalm = this.GetItemString(1,'descripcion')
		this.PostEvent("retornar")
		return -1
	end if
	nuevo = 0
	cambio = FALSE
end if
AcceptText()
dw_c.Reset()
dw_cab.Reset()
t1.pd.dw_l.Reset()
t1.pd.dw_cpo.Reset()
t1.pp.dw_p.Reset()
t1.pr.dw_r.Reset()
t1.pp.dw_p.Retrieve(dw_alm.GetItemString(1,'codalmacen'),coddoc_rel)
dw_c.Retrieve(dw_alm.GetItemString(1,'codalmacen'),codDocumento)

end event

type gb_1 from groupbox within w_sum_sal
integer x = 32
integer y = 136
integer width = 3488
integer height = 660
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial"
end type

type dw_cab from datawindow within w_sum_sal
integer x = 3547
integer y = 164
integer width = 2016
integer height = 640
integer taborder = 30
string title = "none"
string dataobject = "dw_mvto_cab_ff"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;setTransObject(SQLCA)
getchild('lg_target',idw_lugart)
idw_lugart.settransobject(sqlca)
idw_lugart.retrieve()
end event

event rowfocuschanged;t1.pr.dw_r.Reset()
t1.pr.dw_rc.Reset()
t1.pr.dw_rl.Reset()
t1.pd.dw_l.Reset()
t1.pd.dw_cpo.Reset()
if currentRow = 0 or RowCount() = 0 then Return
if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	t1.pr.dw_r.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_l.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_cpo.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
end if

end event

event dberror;Rollback;
Return 0

end event

event itemchanged;string n1,n2,a1,a2,rs,td,doc
if getColumnName() = 'documento' then
	td = GetItemString(GetRow(),'tipodoc')
	if isNull(data) then
		doc = GetItemString(GetRow(),'documento')
	else
		doc = data
	end if
	if td = '' or doc = '' or isNull(td) or isNull(doc) then Return
	select nombre1,nombre2,apellido1,apellido2,razon_social into :n1,:n2,:a1,:a2,:rs
	from terceros where tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("Error leyendo Terceros", SQLCA.SQLErrText)
		Return 1
	elseif SQLCA.SQLCode = 100 THEN
		MessageBox("Atención", "Tercero no existente")
		Return 1
	END IF
	SetItem(GetRow(),'nombre1',n1)
	SetItem(GetRow(),'nombre2',n2)
	SetItem(GetRow(),'apellido1',a1)
	SetItem(GetRow(),'apellido2',a2)
	SetItem(GetRow(),'razon_social',rs)
	dw_c.SetItem(dw_c.GetRow(),'nombre1',n1)
	dw_c.SetItem(dw_c.GetRow(),'nombre2',n2)
	dw_c.SetItem(dw_c.GetRow(),'apellido1',a1)
	dw_c.SetItem(dw_c.GetRow(),'apellido2',a2)
	dw_c.SetItem(dw_c.GetRow(),'razon_social',rs)
	t1.pp.dw_p.SetFilter("tipodoc='"+td+"' and documento='"+doc+"'")
	t1.pp.dw_p.Filter()
end if
if AcceptText() = -1 then Return -1

end event

event getfocus;if t1.pr.dw_r.RowCount() > 0 then
	Modify("tipodoc.Protect='1' documento.Enalbed='1'")
else
	Modify("tipodoc.Protect='0' documento.Enalbed='0'")
end if

end event

