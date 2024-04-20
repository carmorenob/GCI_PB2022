$PBExportHeader$w_bancos_cuentas.srw
forward
global type w_bancos_cuentas from w_center
end type
type dw_1 from datawindow within w_bancos_cuentas
end type
type dw_lista from datawindow within w_bancos_cuentas
end type
type gb_1 from groupbox within w_bancos_cuentas
end type
type pb_export from picturebutton within w_bancos_cuentas
end type
type dw_saldo from datawindow within w_bancos_cuentas
end type
type tab_1 from tab within w_bancos_cuentas
end type
type ctas from userobject within tab_1
end type
type pb_cheque from picturebutton within ctas
end type
type dw_2 from datawindow within ctas
end type
type ctas from userobject within tab_1
pb_cheque pb_cheque
dw_2 dw_2
end type
type cheq from userobject within tab_1
end type
type pb_new_cheq from picturebutton within cheq
end type
type dw_chequera from datawindow within cheq
end type
type cheq from userobject within tab_1
pb_new_cheq pb_new_cheq
dw_chequera dw_chequera
end type
type segu from userobject within tab_1
end type
type pb_bseg from picturebutton within segu
end type
type pb_iseg from picturebutton within segu
end type
type dw_seg from datawindow within segu
end type
type segu from userobject within tab_1
pb_bseg pb_bseg
pb_iseg pb_iseg
dw_seg dw_seg
end type
type tab_1 from tab within w_bancos_cuentas
ctas ctas
cheq cheq
segu segu
end type
type sle_1 from singlelineedit within w_bancos_cuentas
end type
type filtro from dropdownlistbox within w_bancos_cuentas
end type
type gb_2 from groupbox within w_bancos_cuentas
end type
end forward

global type w_bancos_cuentas from w_center
integer width = 2825
integer height = 2400
string title = "Cuentas Bancarias"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_boffice.ico"
boolean center = false
dw_1 dw_1
dw_lista dw_lista
gb_1 gb_1
pb_export pb_export
dw_saldo dw_saldo
tab_1 tab_1
sle_1 sle_1
filtro filtro
gb_2 gb_2
end type
global w_bancos_cuentas w_bancos_cuentas

type variables
datawindowchild idw_cmenor,idw_cmayor
string i_empresa
end variables

on w_bancos_cuentas.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.pb_export=create pb_export
this.dw_saldo=create dw_saldo
this.tab_1=create tab_1
this.sle_1=create sle_1
this.filtro=create filtro
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_lista
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.pb_export
this.Control[iCurrent+5]=this.dw_saldo
this.Control[iCurrent+6]=this.tab_1
this.Control[iCurrent+7]=this.sle_1
this.Control[iCurrent+8]=this.filtro
this.Control[iCurrent+9]=this.gb_2
end on

on w_bancos_cuentas.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.pb_export)
destroy(this.dw_saldo)
destroy(this.tab_1)
destroy(this.sle_1)
destroy(this.filtro)
destroy(this.gb_2)
end on

event resize;call super::resize;//resize(2766,2300)
end event

type pb_grabar from w_center`pb_grabar within w_bancos_cuentas
integer x = 2496
integer y = 412
integer textsize = -8
string facename = "Tahoma"
boolean originalsize = false
alignment htextalign = center!
end type

event pb_grabar::clicked;call super::clicked;if tab_1.ctas.dw_2.rowcount()=0 then return
if tab_1.ctas.dw_2.getitemstring(1,'tipocaja')='0' then//caja mayor
	if isnull(tab_1.ctas.dw_2.getitemstring(1,'codcajamayor')) or  tab_1.ctas.dw_2.getitemstring(1,'codcajamayor')='' then
		messagebox("Atención",'Debe elgir la caja mayor')
		return
	end if
else//caja menor
	if isnull(tab_1.ctas.dw_2.getitemstring(1,'codcajamenor')) or tab_1.ctas.dw_2.getitemstring(1,'codcajamenor')='' then
		messagebox("Atención",'Debe elgir la caja menor')
		return
	end if
end if
if tab_1.ctas.dw_2.getitemstring(1,'codtotal')='' or isnull(tab_1.ctas.dw_2.getitemstring(1,'codtotal')) then
	messagebox("Atención",'Debe elgir la cuenta contable')
	return
end if	
if tab_1.ctas.dw_2.update(true,false)=-1 then
	rollback;
	return
end if
if tab_1.cheq.dw_chequera.update(true,false)=-1 then
	rollback;
	return
end if


if tab_1.segu.dw_seg.update(true,false)=-1 then
	rollback;
	return
else
	if tab_1.segu.dw_seg.rowcount() > 0 then
		int li
		string ban,tipoc,cta,codi,notas
		for li=1 to tab_1.segu.dw_seg.rowcount()
			ban= tab_1.segu.dw_seg.getitemstring(li,'codbanco')
			tipoc= tab_1.segu.dw_seg.getitemstring(li,'tipo_cuenta')
			cta= tab_1.segu.dw_seg.getitemstring(li,'numcuenta')
			codi= tab_1.segu.dw_seg.getitemstring(li,'cod_segb')
			notas= tab_1.segu.dw_seg.getitemstring(li,'anotas')
			update TESOCUENTASBAN_SEGU set nota= ENCRYPT( :notas, :ban+:tipoc+:cta  )
			where codbanco=:ban and tipo_cuenta=:tipoc and numcuenta=:cta and cod_segb= :codi;
			if sqlca.sqlcode=-1 then
				messagebox('Error actualizando tesocuentasban_segu',sqlca.sqlerrtext)
				rollback;
				return -1
			end if
		next
		tab_1.segu.dw_seg.accepttext()		
	end if	
end if
commit;
tab_1.ctas.dw_2.resetupdate()
tab_1.cheq.dw_chequera.resetupdate()
dw_1.event itemchanged(1,dw_1.object.codbanco,dw_1.getitemstring(1,1))
 tab_1.SelectTab(1)
end event

type dw_1 from datawindow within w_bancos_cuentas
integer x = 37
integer y = 24
integer width = 1189
integer height = 140
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_banco"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
tab_1.ctas.dw_2.reset()
dw_lista.retrieve(data)
end event

event constructor;settransobject(SQLCA)
insertrow(1)
end event

type dw_lista from datawindow within w_bancos_cuentas
integer x = 78
integer y = 244
integer width = 2395
integer height = 636
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lista_cuentasban"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_1.cheq.dw_chequera.reset()
dw_saldo.reset()
tab_1.ctas.dw_2.reset()
if getrow()<1 then return
dw_saldo.retrieve(getitemstring(getrow(),'codbanco'),getitemstring(getrow(),'tipo_cuenta'),getitemstring(getrow(),'numcuenta'))
tab_1.ctas.dw_2.retrieve(getitemstring(getrow(),'codbanco'),getitemstring(getrow(),'tipo_cuenta'),getitemstring(getrow(),'numcuenta'))
tab_1.cheq.dw_chequera.retrieve(getitemstring(getrow(),'codbanco'),getitemstring(getrow(),'tipo_cuenta'),getitemstring(getrow(),'numcuenta'))
tab_1.segu.dw_seg.retrieve(getitemstring(getrow(),'codbanco'),getitemstring(getrow(),'tipo_cuenta'),getitemstring(getrow(),'numcuenta'))

end event

type gb_1 from groupbox within w_bancos_cuentas
integer x = 46
integer y = 192
integer width = 2642
integer height = 736
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cuentas en la Entidad:"
end type

type pb_export from picturebutton within w_bancos_cuentas
event mousemove pbm_mousemove
integer x = 2496
integer y = 276
integer width = 146
integer height = 128
integer taborder = 21
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string powertiptext = "Insertar Cuenta"
end type

event clicked;tab_1.ctas.dw_2.reset()
tab_1.cheq.dw_chequera.reset()
tab_1.ctas.dw_2.insertrow(1)
tab_1.ctas.dw_2.setitem(1,1,dw_1.getitemstring(1,1))
tab_1.ctas.dw_2.setitem(1,"fecha_apertura",datetime(today()))
end event

type dw_saldo from datawindow within w_bancos_cuentas
integer x = 462
integer y = 1296
integer width = 471
integer height = 80
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_det_cuenta"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
object.datawindow.header.height=0
end event

type tab_1 from tab within w_bancos_cuentas
event create ( )
event destroy ( )
integer x = 73
integer y = 944
integer width = 2610
integer height = 1312
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
ctas ctas
cheq cheq
segu segu
end type

on tab_1.create
this.ctas=create ctas
this.cheq=create cheq
this.segu=create segu
this.Control[]={this.ctas,&
this.cheq,&
this.segu}
end on

on tab_1.destroy
destroy(this.ctas)
destroy(this.cheq)
destroy(this.segu)
end on

event selectionchanged;if selectedtab=3 then
	string l_seg
	select tipo into :l_seg from usuarios where usuario=:usuario;
	if sqlca.sqlcode=-1 then messagebox("Error leyendo Usuarios tipo seguridad bancaria",sqlca.sqlerrtext)
	if isnull(l_seg) or l_seg<>'T' then 
		messagebox("Error",'No tiene perfil para ingresar')
		return -1
	else
		openwithparm(w_conecta_val,usuario)
		st_ordenes st_llega
		st_llega= Message.PowerObjectParm
		if st_llega.clugar='!' then 
			return -1
		end if
		tab_1.segu.dw_seg.visible=true
		tab_1.segu.pb_iseg.enabled=true
		tab_1.segu.pb_bseg.enabled=true
	end if
else
	tab_1.segu.dw_seg.visible=false
	tab_1.segu.pb_iseg.enabled=false
	tab_1.segu.pb_bseg.enabled=false
end if
end event

type ctas from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2574
integer height = 1184
long backcolor = 67108864
string text = "Detalle Cuenta"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
pb_cheque pb_cheque
dw_2 dw_2
end type

on ctas.create
this.pb_cheque=create pb_cheque
this.dw_2=create dw_2
this.Control[]={this.pb_cheque,&
this.dw_2}
end on

on ctas.destroy
destroy(this.pb_cheque)
destroy(this.dw_2)
end on

type pb_cheque from picturebutton within ctas
integer x = 2395
integer y = 60
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "cheque.gif"
string disabledname = "d_cheque.gif"
alignment htextalign = left!
string powertiptext = "Formato Cheque"
end type

event clicked;string camino,nomarch,carreta
long file
if tab_1.ctas.dw_2.rowcount()=0 then return
nomarch=tab_1.ctas.dw_2.getitemstring(tab_1.ctas.dw_2.getrow(),'camino')
if isnull(nomarch) then nomarch=''
camino=nomarch
if GetFileOpenName("Abrir Reporte", camino, nomarch, "SRD","Reportes (*.SRD),*.SRD",nomarch) = 1 then
	tab_1.ctas.dw_2.setitem(tab_1.ctas.dw_2.getrow(),'camino',camino)
	file=fileopen(nomarch,textmode!)
	if file=-1 then
		messagebox('Error', 'No se pudo abrir el archivo')
		return
	end if
	filereadex(file,carreta)
	tab_1.ctas.dw_2.setitem(tab_1.ctas.dw_2.getrow(),'reporte',carreta)
	tab_1.ctas.dw_2.setitem(tab_1.ctas.dw_2.getrow(),'fecha_carga',datetime(today(),now()))
	FileClose(file) 
end if
if tab_1.ctas.dw_2.update(true,false)=-1 then
	rollback;
	return
end if
end event

type dw_2 from datawindow within ctas
event keyup ( )
event keydown pbm_dwnkey
integer x = 23
integer y = 28
integer width = 2350
integer height = 1156
integer taborder = 20
string title = "none"
string dataobject = "dw_cuentas_nuevas"
boolean border = false
boolean livescroll = true
end type

event keydown;if this.getcolumnname() = 'cod_empresa' then
	if key = keyEscape! or key = keyBack!then
		String vnul
		SetNull(vnul)
		SetItem(GetRow(),'cod_empresa',vnul)
		SetItem(GetRow(),'codtotal',vnul)
	end if
elseif this.getcolumnname() = 'codtotal' or left(this.getcolumnname(),3) = 'cta' then
	if isNull(i_empresa) then
		messageBox('Aviso','Debe seleccionar EMPRESA')
		Return
	end if
	f_busca_cuenta(key,i_empresa,this)
end if

end event

event constructor;settransobject(SQLCA)
getchild('codcajamayor',idw_cmayor)
getchild('codcajamenor',idw_cmenor)
idw_cmayor.settransobject(SQLCA)
idw_cmenor.settransobject(SQLCA)

end event

event itemchanged;choose case this.getcolumnname()
	case "codtotal"
		string revisa,otro
		i_empresa=this.getitemstring(this.getrow(),"cod_empresa")
		otro=this.gettext()
		setnull(revisa)
		select descrip into :revisa from cont_plan where codtotal=:otro and cod_empresa=:i_empresa and movimiento='1';
		if isnull(revisa) then
			this.setitem(this.getrow(),this.getcolumnname(),revisa)
			this.setitem(this.getrow(),"descrip",revisa)
			return 1
		else
			this.accepttext()
			this.setitem(this.getrow(),"descrip",revisa)
		end if
	case "cod_empresa"
		this.accepttext()
		string nulo
		setnull(nulo)
		this.setitem(this.getrow(),"descrip",nulo)
		this.setitem(this.getrow(),"codtotal",nulo)
		i_empresa=this.getitemstring(this.getrow(),"cod_empresa")
	case "estado"
		this.accepttext()
		datetime dnulo
		setnull(dnulo)
		if this.gettext()='1' then
			this.setitem(this.getrow(),"fecha_cierre",dnulo)
		else
			this.setitem(this.getrow(),"fecha_cierre",datetime(today()))
		end if
	case 'clugarmenor'
		idw_cmenor.retrieve(data)
		setitem(getrow(),'codcajamenor','')
	case 'clugarmayor'
		idw_cmayor.retrieve(data)
		setitem(getrow(),'codcajamayor','')
	case 'chequera'
		if data='0' then
			tab_1.cheq.dw_chequera.enabled=false
			tab_1.cheq.pb_new_cheq.enabled=false
			pb_cheque.enabled=false
		else
			tab_1.cheq.dw_chequera.enabled=true
			tab_1.cheq.pb_new_cheq.enabled=true
			pb_cheque.enabled=true			
		end if
	case else
		this.accepttext()		
end choose
end event

event itemfocuschanged;f_semovio(this,getitemstring(this.getrow(),"cod_empresa"),{'codtotal'})
end event

event retrieveend;if rowcount>0 then
	idw_cmenor.retrieve(getitemstring(1,'clugarmenor'))
	idw_cmayor.retrieve(getitemstring(1,'clugarmayor'))
	if getitemstring(1,'chequera')='1' then
		tab_1.cheq.dw_chequera.enabled=true
		tab_1.cheq.pb_new_cheq.enabled=true
		tab_1.ctas.pb_cheque.enabled=true					
	else
		tab_1.cheq.dw_chequera.enabled=false
		tab_1.cheq.pb_new_cheq.enabled=false
		tab_1.ctas.pb_cheque.enabled=false
	end if
	i_empresa=dw_2.getitemstring(1,"cod_empresa")
end if

end event

type cheq from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2574
integer height = 1184
long backcolor = 67108864
string text = "Chequeras"
long tabtextcolor = 33554432
string picturename = "cheque.gif"
long picturemaskcolor = 536870912
pb_new_cheq pb_new_cheq
dw_chequera dw_chequera
end type

on cheq.create
this.pb_new_cheq=create pb_new_cheq
this.dw_chequera=create dw_chequera
this.Control[]={this.pb_new_cheq,&
this.dw_chequera}
end on

on cheq.destroy
destroy(this.pb_new_cheq)
destroy(this.dw_chequera)
end on

type pb_new_cheq from picturebutton within cheq
integer x = 2405
integer y = 60
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if dw_lista.rowcount()=0 then return
if dw_chequera.rowcount()>0 then
	if dw_chequera.find('estado="1"',1,dw_chequera.rowcount())>0 then
		messagebox("Atención",'Hay una chequera activa no puede continuar')
		return
	end if
end if
dw_chequera.insertrow(1)
dw_chequera.setitem(1,'codbanco',dw_1.getitemstring(1,1))
dw_chequera.setitem(1,'tipo_cuenta',dw_lista.getitemstring(dw_lista.getrow(),'tipo_cuenta'))
dw_chequera.setitem(1,'numcuenta',dw_lista.getitemstring(dw_lista.getrow(),'numcuenta'))
dw_chequera.setitem(1,'fecha_entrega',datetime(today()))

end event

type dw_chequera from datawindow within cheq
integer x = 64
integer y = 64
integer width = 2295
integer height = 1036
integer taborder = 30
string title = "none"
string dataobject = "dw_chequeras"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settraNSOBJECT(SQLCA)

end event

type segu from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2574
integer height = 1184
long backcolor = 67108864
string text = "Datos Cuenta"
long tabtextcolor = 33554432
string picturename = "seg_bank.gif"
long picturemaskcolor = 536870912
pb_bseg pb_bseg
pb_iseg pb_iseg
dw_seg dw_seg
end type

on segu.create
this.pb_bseg=create pb_bseg
this.pb_iseg=create pb_iseg
this.dw_seg=create dw_seg
this.Control[]={this.pb_bseg,&
this.pb_iseg,&
this.dw_seg}
end on

on segu.destroy
destroy(this.pb_bseg)
destroy(this.pb_iseg)
destroy(this.dw_seg)
end on

type pb_bseg from picturebutton within segu
string tag = "Elimina Nota Seguridad"
integer x = 2391
integer y = 192
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

type pb_iseg from picturebutton within segu
string tag = "Inserta Nota Seguridad"
integer x = 2391
integer y = 60
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if dw_lista.rowcount()=0 then return
dw_seg.insertrow(1)
dw_seg.setitem(1,'codbanco',dw_1.getitemstring(1,1))
dw_seg.setitem(1,'tipo_cuenta',dw_lista.getitemstring(dw_lista.getrow(),'tipo_cuenta'))
dw_seg.setitem(1,'numcuenta',dw_lista.getitemstring(dw_lista.getrow(),'numcuenta'))
dw_seg.setitem(1,'fecha_audita',datetime(today()))
dw_seg.setitem(1,'usuario_audita',usuario)


end event

type dw_seg from datawindow within segu
event p_itemchanged ( string columna )
boolean visible = false
integer x = 50
integer y = 48
integer width = 2304
integer height = 1080
integer taborder = 31
string title = "none"
string dataobject = "dw_bancos_cuentas_seg_any"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(string columna);accepttext()
if not isnull(getitemstring(getrow(),'anotas')) and columna='anotas'  then 
	setitem(getrow(),'anotas',f_encripta_new(getitemstring(getrow(),'anotas')))
end if
end event

event constructor;settransobject(sqlca)
end event

event itemchanged;if getcolumnname()='anotas'  then
	post event p_itemchanged(getcolumnname())
end if
end event

type sle_1 from singlelineedit within w_bancos_cuentas
event keypressed pbm_keyup
integer x = 1938
integer y = 76
integer width = 677
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event keypressed;string texto
texto = upper(text)
if right(texto,1) <> '%' then
	texto = texto + '%'
end if
choose case filtro.text
	case "TIPO CUENTA"
		dw_lista.SetFilter("upper(tipo_cuenta) like '" +upper( texto )+ "'")
	case 'NRO CUENTA'
		dw_lista.SetFilter("upper(numcuenta) like '" +upper( texto )+ "'")
end choose
dw_lista.Filter()

end event

type filtro from dropdownlistbox within w_bancos_cuentas
integer x = 1294
integer y = 76
integer width = 539
integer height = 352
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string item[] = {"TIPO CUENTA","NRO CUENTA"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text="NRO CUENTA"
end event

type gb_2 from groupbox within w_bancos_cuentas
integer x = 1253
integer y = 20
integer width = 1422
integer height = 168
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtro Por"
end type

