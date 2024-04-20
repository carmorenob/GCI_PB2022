$PBExportHeader$w_ch_vigen_recon.srw
forward
global type w_ch_vigen_recon from window
end type
type dw_movi from datawindow within w_ch_vigen_recon
end type
type cbx_1 from checkbox within w_ch_vigen_recon
end type
type st_3 from statictext within w_ch_vigen_recon
end type
type dw_cab from datawindow within w_ch_vigen_recon
end type
type dw_rub from datawindow within w_ch_vigen_recon
end type
type dw_it from datawindow within w_ch_vigen_recon
end type
type pb_grabar from picturebutton within w_ch_vigen_recon
end type
type dw_det from datawindow within w_ch_vigen_recon
end type
type st_2 from statictext within w_ch_vigen_recon
end type
type st_1 from statictext within w_ch_vigen_recon
end type
type dw_vignew from datawindow within w_ch_vigen_recon
end type
type dw_vig from datawindow within w_ch_vigen_recon
end type
type dw_1 from datawindow within w_ch_vigen_recon
end type
end forward

global type w_ch_vigen_recon from window
integer width = 4055
integer height = 1724
boolean titlebar = true
string title = "Presupuesto - Cambio Vigencia para reconocimientos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_movi dw_movi
cbx_1 cbx_1
st_3 st_3
dw_cab dw_cab
dw_rub dw_rub
dw_it dw_it
pb_grabar pb_grabar
dw_det dw_det
st_2 st_2
st_1 st_1
dw_vignew dw_vignew
dw_vig dw_vig
dw_1 dw_1
end type
global w_ch_vigen_recon w_ch_vigen_recon

type variables
datawindowchild idw_año,idw_periodo
long vigencia, periodo,l_año
end variables

on w_ch_vigen_recon.create
this.dw_movi=create dw_movi
this.cbx_1=create cbx_1
this.st_3=create st_3
this.dw_cab=create dw_cab
this.dw_rub=create dw_rub
this.dw_it=create dw_it
this.pb_grabar=create pb_grabar
this.dw_det=create dw_det
this.st_2=create st_2
this.st_1=create st_1
this.dw_vignew=create dw_vignew
this.dw_vig=create dw_vig
this.dw_1=create dw_1
this.Control[]={this.dw_movi,&
this.cbx_1,&
this.st_3,&
this.dw_cab,&
this.dw_rub,&
this.dw_it,&
this.pb_grabar,&
this.dw_det,&
this.st_2,&
this.st_1,&
this.dw_vignew,&
this.dw_vig,&
this.dw_1}
end on

on w_ch_vigen_recon.destroy
destroy(this.dw_movi)
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.dw_cab)
destroy(this.dw_rub)
destroy(this.dw_it)
destroy(this.pb_grabar)
destroy(this.dw_det)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_vignew)
destroy(this.dw_vig)
destroy(this.dw_1)
end on

type dw_movi from datawindow within w_ch_vigen_recon
boolean visible = false
integer x = 837
integer y = 24
integer width = 283
integer height = 136
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_plan_mov_det"
boolean resizable = true
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;rollback;
return 0

end event

type cbx_1 from checkbox within w_ch_vigen_recon
integer x = 987
integer y = 104
integer width = 987
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Replicar hacia abajo a seleccionados"
boolean checked = true
end type

type st_3 from statictext within w_ch_vigen_recon
integer x = 2802
integer y = 28
integer width = 466
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Periodo"
boolean focusrectangle = false
end type

type dw_cab from datawindow within w_ch_vigen_recon
boolean visible = false
integer x = 1824
integer y = 1388
integer width = 576
integer height = 192
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_pre_doc_cab"
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_rub from datawindow within w_ch_vigen_recon
boolean visible = false
integer x = 2432
integer y = 1376
integer width = 1006
integer height = 216
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_pre_doc_cp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 and row<>getrow() then scrolltorow(row)
end event

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event losefocus;if accepttext()=-1 then setfocus()
end event

event sqlpreview;//string tipo
//
//if sqltype = PreviewSelect! then
//	tipo = 'Select'
//	i_operacion = ''
//elseif sqltype = PreviewInsert! then
//	tipo = 'Insert'
//elseif sqltype = PreviewDelete! then
//	tipo = 'Delete'
//elseif sqltype = PreviewUpdate! then
//	tipo = 'Update'
//end if
//
//if i_operacion = 'Delete' then
//	if tipo = 'Delete' then
//		Return 0
//	else
//		Return 2
//	end if
//elseif i_operacion = 'Insert' then
//	if tipo = 'Insert' or tipo = 'Update' then
//		Return 0
//	else
//		Return 2
//	end if
//end if
end event

type dw_it from datawindow within w_ch_vigen_recon
boolean visible = false
integer x = 1134
integer y = 1376
integer width = 663
integer height = 220
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_flujo_2s1n"
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

type pb_grabar from picturebutton within w_ch_vigen_recon
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 50
integer y = 1480
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Crear Reconocimiento con rubros seleccionados"
end type

event clicked;long i, fila, j, item
double ndoc, nc, nrela, final
string cd, cl
dw_1.SetFilter("")
dw_1.Filter()
if dw_1.RowCount() = 0 then Return 0
fila = dw_1.Find("(trim(codtotal_new)='') or (isNull(codtotal_new))",1,dw_1.RowCount())
if fila > 0 then
	MessageBox('Atención','Debe proporcionar todas las cuentas')
	Return -1
end if
if isNull(vigencia) or vigencia = 0 or isnull(periodo) or periodo = 0 then 
	MessageBox('Atención','Debe Seleccionar una vigencia y un periodo donde se adicionará el nuevo reconocimiento')
	Return -1	
end if
dw_cab.SetRedraw(FALSE)
dw_it.SetRedraw(FALSE)
dw_rub.SetRedraw(FALSE)
dw_det.SetRedraw(FALSE)
SetPointer(HourGlass!)
dw_det.Retrieve(dw_vig.GetItemNumber(1,1))
ndoc=f_trae_ndoc('PRC',clugar,'Reconocimientos')
if ndoc=-1 then return -1
final = f_consec(vigencia,'PRC',cLugar)
if final = -1 then 
	MessageBox('Error','Imposible asignar consecutivo al documento - PRE_CONSECS')
	Rollback;
	Return -1
End if
dw_cab.insertrow(1)
dw_cab.setitem(1,'usuario',usuario)
dw_cab.setitem(1,'fecha',datetime(today(),now()))
dw_cab.setitem(1,'coddoc','PRC')
dw_cab.setitem(1,'clugar',clugar)
dw_cab.setitem(1,'numdoc',ndoc)
dw_cab.setitem(1,'fecha_consecu',datetime(today(),now()))
dw_cab.setitem(1,'cod_vigencia',vigencia)
dw_cab.setitem(1,'periodo',periodo)
dw_cab.setitem(1,'estado','0')
dw_cab.setitem(1,'cod_flujo','PRCCXCPI')
dw_cab.setitem(1,'consecutivo',final)
dw_cab.setitem(1,'fecha_consecu',today())
select max(item) into :nrela from mod_relacion_origen
where codigo='PRCCXCPI';
if isNull(nrela) then nrela = 0
for i = 1 to dw_1.RowCount()
//	if dw_1.GetItemNumber(i,'selec') = 0 then Continue
	if isNull(dw_1.GetItemString(i,'codtotal_new')) then Continue
	if Trim(dw_1.GetItemString(i,'codtotal_new')) = '' then Continue
	dw_det.SetFilter("codtotal='"+dw_1.GetItemString(i,'codtotal')+"'")
	dw_det.Filter()
	for j = 1 to dw_det.RowCount()
		fila = dw_rub.InsertRow(0)
		item = long(dw_rub.Describe("Evaluate('max(item)',0)")) + 1
		dw_rub.SetItem(fila,'coddoc','PRC')
		dw_rub.SetItem(fila,'clugar',clugar)
		dw_rub.SetItem(fila,'numdoc',ndoc)
		dw_rub.SetItem(fila,'item', item)
		dw_rub.SetItem(fila,'cod_vigencia',vigencia)
		dw_rub.SetItem(fila,'codtotal',dw_1.GetItemString(i,'codtotal_new'))
		dw_rub.SetItem(fila,'monto',dw_det.GetItemNumber(j,'monto_vigente'))
		dw_rub.SetItem(fila,'monto_vigente',dw_det.GetItemNumber(j,'monto_dif'))
		dw_rub.SetItem(fila,'coddoc_orig',dw_det.GetItemString(j,'coddoc'))
		dw_rub.SetItem(fila,'clugar_orig',dw_det.GetItemString(j,'clugar'))
		dw_rub.SetItem(fila,'numdoc_orig',dw_det.GetItemNumber(j,'numdoc'))
		dw_rub.SetItem(fila,'item_orig', dw_det.GetItemNumber(j,'item'))
		cd = dw_det.GetItemString(j,'coddoc_cob')
		cl = dw_det.GetItemString(j,'clugar_cob')
		nc = dw_det.GetItemNumber(j,'num_cobro')
		fila = dw_it.Find("char_orig1='"+cd+"' and char_orig2='"+cl+"' and num_orig1="+string(nc),1,dw_it.RowCount())
		if fila = 0 then fila = dw_it.InsertRow(0)
		nrela = nrela + 1
		dw_it.SetItem(fila,'codigo',dw_det.GetItemString(j,'codigo'))
		dw_it.SetItem(fila,'item',nrela)
		dw_it.SetItem(fila,'char_doc1','PRC')
		dw_it.SetItem(fila,'char_doc2',clugar)
		dw_it.SetItem(fila,'num_doc1',ndoc)
		dw_it.SetItem(fila,'num_doc2',item)
		dw_it.SetItem(fila,'char_orig1',dw_det.GetItemString(j,'coddoc_cob'))
		dw_it.SetItem(fila,'char_orig2',dw_det.GetItemString(j,'clugar_cob'))
		dw_it.SetItem(fila,'num_orig1',dw_det.GetItemNumber(j,'num_cobro'))
		dw_it.SetItem(fila,'char_orig3','1')
		dw_it.SetItem(fila,'valor',dw_det.GetItemNumber(j,'valor'))
		//end if
		dw_det.SetItem(j,'monto_vigente',dw_det.GetItemNumber(j,'monto_utilizado'))
	next
next

dw_cab.SetRedraw(TRUE)
dw_it.SetRedraw(TRUE)
dw_rub.SetRedraw(TRUE)
dw_det.SetRedraw(TRUE)

if dw_cab.Update(TRUE,FALSE) = -1 then Return -1
if dw_rub.Update(TRUE,FALSE) = -1 then Return -1
if dw_it.Update(TRUE,FALSE) = -1 then Return -1
if dw_det.Update(TRUE,FALSE) = -1 then Return -1

long donde
string codigo,err
for j=1 to dw_rub.rowcount()
	donde=dw_movi.insertrow(0)
	dw_movi.setitem(donde,'cod_vigencia',vigencia)
	codigo = dw_rub.getitemstring(j,'codtotal')
	dw_movi.setitem(donde,'codtotal',codigo)
	dw_movi.setitem(donde,'periodo',periodo)
	dw_movi.setitem(donde,'año',l_año)
	dw_movi.setitem(donde,'fecha',datetime(today(),now()))
	dw_movi.setitem(donde,'coddoc','PRC')
	dw_movi.setitem(donde,'clugar',dw_rub.getitemstring(j,'clugar'))
	dw_movi.setitem(donde,'numdoc',dw_rub.getitemnumber(j,'numdoc'))
	dw_movi.setitem(donde,'item',dw_rub.getitemnumber(j,'item'))
	dw_movi.setitem(donde,'monto_recon',dw_rub.getitemnumber(j,'monto_vigente'))
	
	SELECT Max(pre_plan_movi_deta.num_movi) into :item
	FROM pre_plan_movi_deta
	WHERE pre_plan_movi_deta.cod_vigencia=:vigencia AND pre_plan_movi_deta.CodTotal=:codigo
	AND pre_plan_movi_deta.periodo=:periodo and pre_plan_movi_deta.año=:l_año;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo pre_plan_movi_deta',err)
		return -1
	end if
	if isnull(item) then item=0 
	item++
	dw_movi.setitem(donde,'num_movi',item) 
	if dw_movi.update()=-1 then return -1
next

commit;
dw_cab.ResetUpdate()
dw_rub.ResetUpdate()
dw_it.ResetUpdate()
dw_det.ResetUpdate()
dw_cab.setitem(1,'estado','0')
if dw_cab.ResetUpdate() = -1 then
	Rollback;
	MessageBox('Atención','Se se pudo establecer definitivo el reconocimiento nuevo '+string(ndoc))
	Return -1
end if
commit;
MessageBox('Atención','Se creó el reconocimiento '+string(ndoc))

end event

type dw_det from datawindow within w_ch_vigen_recon
boolean visible = false
integer x = 192
integer y = 1376
integer width = 919
integer height = 240
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_recon_pend_det"
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

event doubleclicked;dw_det.Retrieve(dw_vig.GetItemNumber(1,1))
messageBox('',RowCount())

end event

type st_2 from statictext within w_ch_vigen_recon
integer x = 1934
integer y = 28
integer width = 466
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vigencia Receptora"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ch_vigen_recon
integer x = 59
integer y = 24
integer width = 466
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vigencia Anterior"
boolean focusrectangle = false
end type

type dw_vignew from datawindow within w_ch_vigen_recon
integer x = 2025
integer y = 104
integer width = 1989
integer height = 76
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_vig_per"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;modify('datawindow.header.height=0')
setTransObject(SQLCA)
getchild('ano',idw_año)
getchild('periodo',idw_periodo)
idw_año.settransobject(sqlca)
idw_periodo.settransobject(sqlca)
InsertRow(0)

end event

event itemchanged;long actual, i
string vnul
setNull(vnul)
actual = GetItemNumber(1,string(dwo.name))
if not isNull(actual) then
	choose case messageBox('Atención','Al cambiar la vigencia se borrarán las cuentas ya configuradas. Desea Continuar?',QUESTION!,YESNO!)
		case 1//cambio y debe guardar
			for i = 1 to dw_1.RowCount()
				dw_1.SetItem(i,'codtotal_new',vnul)
				dw_1.SetItem(i,'descrip_new',vnul)
			next
		case 3//cancelar
			setitem(1,1,actual)
			return 1
	end choose
end if
choose case dwo.name
	case 'cod_vigencia'
		vigencia=long(data)
		setnull(l_año)
		setnull(periodo)
		idw_año.retrieve(vigencia)
		setitem(1,'periodo',periodo)
	case 'ano'
		l_año=long(data)
		idw_periodo.retrieve(vigencia,l_año)
	case 'periodo'
		periodo = long(data)
	
end choose

end event

type dw_vig from datawindow within w_ch_vigen_recon
integer x = 59
integer y = 92
integer width = 763
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_vig_per"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;modify('datawindow.header.height=0')
setTransObject(SQLCA)
InsertRow(0)

end event

event itemchanged;AcceptText()
dw_1.Retrieve(GetItemNumber(1,1))

end event

type dw_1 from datawindow within w_ch_vigen_recon
event teclea pbm_dwnkey
integer x = 50
integer y = 200
integer width = 3954
integer height = 1232
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_recon_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event teclea;st_ppto st_parm
st_parm.cod_vigencia = dw_vignew.GetItemNumber(1,1)
st_parm.dw_obj = this
string este
choose case key
	case KeyNumpad0!,key0!
		este='0'
	case KeyNumpad1!,key1!
		este='1'
	case KeyNumpad2!,key2!
		este='2'
	case KeyNumpad3!,key3!
		este='3'
	case KeyNumpad4!,key4!
		este='4'
	case KeyNumpad5!,key5!
		este='5'
	case KeyNumpad6!,key6!
		este='6'
	case KeyNumpad7!,key7!
		este='7'
	case KeyNumpad8!,key8!
		este='8'
	case KeyNumpad9!,key9!
		este='9'
	case KeyNumpad0!,key0!
		este='0'
	case KeyEnter!
		if isValid(w_buscactapre) then close(w_buscactapre)
		TriggerEvent(itemchanged!)
		Return
	case keya!
		este='a'
	case keyb!
		este='b'
	case keyc!
		if keyflags=2 then Return
		este='c'
	case keyd!
		este='d'
	case keye!
		este='e'
	case keyf!
		este='f'
	case keyg!
		este='g'
	case keyh!
		este='h'
	case keyi!
		este='i'
	case keyj!
		este='j'
	case keyk!
		este='k'
	case keyl!
		este='l'
	case keym!
		este='m'
	case keyn!
		este='n'
	case keyo!
		este='o'
	case keyp!
		este='p'
	case keyq!
		este='q'
	case keyr!
		este='r'
	case keys!
		este='s'
	case keyt!
		este='t'
	case keyu!
		este='u'
	case keyv!
		este='v'
	case keyw!
		este='w'
	case keyx!
		este='x'
	case keyy!
		este='y'
	case keyz!
		este='z'//	case keyback!
//		este = GetText()
//		if len(este) > 1 then
//			este=left(este, len(este) - 1)
//		else
//			setNull(este)
//		end if
	case else
		if keyDown(keycontrol!) then
			return
		end if
end choose
if este <> "!" then
	if not isnull(GetText()) then este=GetText() + este
end if
if key = keyback! then
	este = GetText()
	if len(este) > 1 then
		este=left(este, len(este) - 1)
	else
		este=''
	end if
elseif 	key = keyv! and keyflags = 2 then
	este = clipboard()
end if

st_parm.filtro = "(lower(codtotal) like '" + lower(este) + "%') and (tipo='0' and movimiento='1')"
st_parm.dw_sle = this
if isValid(w_buscactapre) then
	w_buscactapre.st_parm.dw_sle=this
	w_buscactapre.dw_1.SetFilter(st_parm.filtro)
	w_buscactapre.dw_1.Filter()
else
	openwithparm(w_buscactapre,st_parm)
end if
SetFocus()

end event

event constructor;setTransObject(SQLCA)

end event

event clicked;if dwo.Name = 'selec_t' then
	int i
	if describe("selec_t.text") = 'Selec.' then
		for i = 1 to rowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to rowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
	Return
end if

end event

event itemchanged;if getColumnName() = 'codtotal_new' then
	long i
	string descrip
	if IsNull(data) then data = GetText()
	select descrip into :descrip from pre_plan 
	where cod_vigencia=:vigencia and codtotal=:data and movimiento='1' and tipo='0';
	if SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
	elseif SQLCA.SQLCode = 100 THEN
		MessageBox("Atención", 'No se encontró la cuenta dada')
		Return 1
	End if
	SetItem(GetRow(),'descrip_new',descrip)
	for i = row to RowCount()
		if GetItemNumber(i,'selec') = 1 then
			SetItem(i,'codtotal_new',data)
			SetItem(i,'descrip_new',descrip)
		end if
	next
end if

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

