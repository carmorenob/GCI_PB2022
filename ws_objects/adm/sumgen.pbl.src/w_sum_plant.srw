$PBExportHeader$w_sum_plant.srw
forward
global type w_sum_plant from window
end type
type pb_def from picturebutton within w_sum_plant
end type
type pb_2 from picturebutton within w_sum_plant
end type
type pb_1 from picturebutton within w_sum_plant
end type
type t1 from tab within w_sum_plant
end type
type pd from userobject within t1
end type
type pb_4 from picturebutton within pd
end type
type dw_cpo from datawindow within pd
end type
type pd from userobject within t1
pb_4 pb_4
dw_cpo dw_cpo
end type
type pk from userobject within t1
end type
type pb_3 from picturebutton within pk
end type
type pb_7 from picturebutton within pk
end type
type sle_1 from singlelineedit within pk
end type
type rb_2 from radiobutton within pk
end type
type dw_k from datawindow within pk
end type
type rb_1 from radiobutton within pk
end type
type pk from userobject within t1
pb_3 pb_3
pb_7 pb_7
sle_1 sle_1
rb_2 rb_2
dw_k dw_k
rb_1 rb_1
end type
type t1 from tab within w_sum_plant
pd pd
pk pk
end type
type pb_tempo from picturebutton within w_sum_plant
end type
type pb_borrar from picturebutton within w_sum_plant
end type
type pb_nuevo from picturebutton within w_sum_plant
end type
type st_1 from statictext within w_sum_plant
end type
type dw_cab from datawindow within w_sum_plant
end type
end forward

global type w_sum_plant from window
integer width = 3794
integer height = 1748
boolean titlebar = true
string title = "Plantillas de sugeridos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_def pb_def
pb_2 pb_2
pb_1 pb_1
t1 t1
pb_tempo pb_tempo
pb_borrar pb_borrar
pb_nuevo pb_nuevo
st_1 st_1
dw_cab dw_cab
end type
global w_sum_plant w_sum_plant

type variables
boolean cambio
string ordenar[10]
st_otrosi st_p

end variables

on w_sum_plant.create
this.pb_def=create pb_def
this.pb_2=create pb_2
this.pb_1=create pb_1
this.t1=create t1
this.pb_tempo=create pb_tempo
this.pb_borrar=create pb_borrar
this.pb_nuevo=create pb_nuevo
this.st_1=create st_1
this.dw_cab=create dw_cab
this.Control[]={this.pb_def,&
this.pb_2,&
this.pb_1,&
this.t1,&
this.pb_tempo,&
this.pb_borrar,&
this.pb_nuevo,&
this.st_1,&
this.dw_cab}
end on

on w_sum_plant.destroy
destroy(this.pb_def)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.t1)
destroy(this.pb_tempo)
destroy(this.pb_borrar)
destroy(this.pb_nuevo)
destroy(this.st_1)
destroy(this.dw_cab)
end on

event open;st_p = Message.PowerObjectParm
dw_cab.Retrieve(st_p.codalmacen,st_p.coddoc)
t1.pk.dw_k.settransobject(sqlca)
t1.pk.dw_k.Retrieve()
//if g_motor='postgres' then
//	dw_1.dataObject='dw_kardexprelote_postgres'
//end if
//if g_motor='sql' then
//	dw_1.dataObject='dw_kardexprelote_sqlserver'
//end if
//if g_motor<>'postgres' and  g_motor<>'sql' then
//	dw_1.dataObject='dw_kardexprelote'
//end if
//
//dw_1.Retrieve(st_p.codalmacen_target)
end event

type pb_def from picturebutton within w_sum_plant
string tag = "Grabar Definitivo"
integer x = 2386
integer y = 188
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
end type

event clicked;if t1.pd.dw_cpo.RowCount() = 0 then 
	rollback;
	MessageBox('Atención','No ha agregado ningun artículo al detalle del documento')
	Return -1
end if
if isNull(dw_cab.GetItemString(dw_cab.GetRow(),'anulado')) or dw_cab.GetItemString(dw_cab.GetRow(),'anulado') = '' then 
	rollback;
	MessageBox('Atención','No ha dado nombre a la plantilla')
	Return -1
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then return 
long i
double numdoc

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '0' and dw_cab.GetItemnumber(dw_cab.GetRow(),'numdoc') = 0 then
	numdoc = f_trae_ndoc(dw_cab.GetItemString(dw_cab.GetRow(),'coddoc'),clugar,'Plantillas Suministros')
	if numdoc < 0 then Return -1
	dw_cab.SetItem(dw_cab.GetRow(),'numdoc',numdoc)
	for i = 1 to t1.pd.dw_cpo.RowCount()
		t1.pd.dw_cpo.SetItem(i,'numdoc',numdoc)
	next
end if
dw_cab.SetItem(dw_cab.GetRow(),'estado','1')
if dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if
if t1.pd.dw_cpo.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
cambio = FALSE
Return 0
end event

type pb_2 from picturebutton within w_sum_plant
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 1728
integer y = 1508
integer width = 146
integer height = 128
integer taborder = 90
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
string powertiptext = "Llevar plantilla"
end type

event clicked;close(parent)

end event

type pb_1 from picturebutton within w_sum_plant
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 1563
integer y = 1508
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Llevar plantilla"
end type

event clicked;long i,fila_n,fila,fila_t,fila_nl
string valor,l_codigo

for i = 1 to t1.pd.dw_cpo.RowCount()
	l_codigo = t1.pd.dw_cpo.GetItemString(i,'codgenerico')
	fila = st_p.dw_ppto.Find("codgenerico='"+t1.pd.dw_cpo.GetItemString(i,'codgenerico')+"'",1,st_p.dw_ppto.RowCount())
	if fila <> 0 then
		fila_t = st_p.dw_obj.Find( "codgenerico=" + "'" + l_codigo + "'", 1, st_p.dw_obj.RowCount())
		if fila_t = 0 then
			valor = st_p.dw_obj.describe("Evaluate('max(item)', 1)")
			fila_n = st_p.dw_obj.InsertRow(0)
			st_p.dw_obj.SetItem(fila_n,'coddoc',st_p.dw_cab.GetItemString(1,'coddoc'))
			st_p.dw_obj.SetItem(fila_n,'clugar',st_p.dw_cab.GetItemString(1,'clugar'))
			st_p.dw_obj.SetItem(fila_n,'numdoc',st_p.dw_cab.GetItemNumber(1,'numdoc'))
			st_p.dw_obj.SetItem(fila_n,'descripcion',t1.pd.dw_cpo.GetItemString(i,'descripcion'))
			st_p.dw_obj.SetItem(fila_n,'codarticulo',st_p.dw_ppto.GetItemstring(fila,'codarticulo'))
			st_p.dw_obj.SetItem(fila_n, 'vence', st_p.dw_ppto.GetItemstring(fila,'vence'))
			st_p.dw_obj.SetItem(fila_n, 'valor_unit', st_p.dw_ppto.GetItemnumber(fila,'costoprom') )	
			st_p.dw_obj.SetItem(fila_n,'Estado','0')
			st_p.dw_obj.SetItem(fila_n,'item',long(valor) + 1)
			st_p.dw_obj.SetItem(fila_n,'cantidad',t1.pd.dw_cpo.GetItemnumber(i,'cantidad'))
			if isvalid(st_p.dw_lote) then
				if  st_p.dw_ppto.GetItemstring(fila,'vence')='1' then
					fila_nl = st_p.dw_lote.InsertRow(0)
					st_p.dw_lote.SetItem(fila_nl, 'codalmacen', dw_cab.GetItemString(dw_cab.GetRow(),'codalmacen') )
					st_p.dw_lote.SetItem(fila_nl, 'codarticulo', l_codigo )
					if isvalid(w_doc_ori) then 
						w_doc_ori.t1.pr.sle_codprod.text= l_codigo
						w_doc_ori.t1.pr.pb_8.Event clicked()
					else
						st_p.dw_lote.SetItem(fila_nl, 'fecha_venc', st_p.dw_ppto.GetItemDateTime(fila,'fecha_venc') )
						st_p.dw_lote.SetItem(fila_nl, 'lote', st_p.dw_ppto.GetItemstring(fila,'lote'))		
					end if
					st_p.dw_lote.SetItem(fila_nl, 'coddoc', dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') )
					st_p.dw_lote.SetItem(fila_nl, 'clugar', dw_cab.GetItemString(dw_cab.GetRow(),'clugar') )
					st_p.dw_lote.SetItem(fila_nl, 'numdoc', dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc') )
					st_p.dw_lote.SetItem(fila_nl, 'item',   long(valor) + 1 )
					st_p.dw_lote.SetItem(fila_nl, 'convenio',  st_p.dw_ppto.GetItemString(fila,'convenio') )
					st_p.dw_lote.SetItem(fila_nl, 'Estado','0')
					st_p.dw_lote.SetItem(fila_nl, 'signo',-1)
					st_p.dw_lote.SetItem(fila_nl, 'cantidad', t1.pd.dw_cpo.GetItemnumber(i,'cantidad'))	
					st_p.dw_lote.SetItem(fila_nl, 'saldo_lote', st_p.dw_ppto.GetItemNumber(fila,'cantidad'))	
				end if
			end if
			if st_p.dw_cab.GetItemString(1,'coddoc') = 'TR' then
				st_p.dw_obj.SetItem(fila_n, 'tipo','I')
			end if
			if st_p.dw_cab.GetItemString(1,'coddoc') = 'OC' then 
				st_p.dw_obj.SetItem(fila_n, 'cod_impu',t1.pd.dw_cpo.GetItemString(i,'cod_impu'))
				st_p.dw_obj.SetItem(fila_n, 'valor_unit',t1.pd.dw_cpo.GetItemNumber(i,'valor_unit'))
				st_p.dw_obj.SetItem(fila_n,'impu',getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)
			end if
		end if
	end if
next
close(parent)

end event

type t1 from tab within w_sum_plant
event create ( )
event destroy ( )
integer x = 73
integer y = 480
integer width = 3589
integer height = 1012
integer taborder = 70
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
pd pd
pk pk
end type

on t1.create
this.pd=create pd
this.pk=create pk
this.Control[]={this.pd,&
this.pk}
end on

on t1.destroy
destroy(this.pd)
destroy(this.pk)
end on

type pd from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3552
integer height = 884
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
pb_4 pb_4
dw_cpo dw_cpo
end type

on pd.create
this.pb_4=create pb_4
this.dw_cpo=create dw_cpo
this.Control[]={this.pb_4,&
this.dw_cpo}
end on

on pd.destroy
destroy(this.pb_4)
destroy(this.dw_cpo)
end on

type pb_4 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 3314
integer y = 52
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

event clicked;if dw_cpo.RowCount() = 0 then Return 
dw_cpo.DeleteRow(dw_cpo.GetRow())

end event

type dw_cpo from datawindow within pd
integer x = 32
integer y = 44
integer width = 3269
integer height = 776
integer taborder = 30
string title = "none"
string dataobject = "dw_plant_cpo"
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

event dberror;Rollback;
Return 0

end event

event losefocus;AcceptText()

end event

type pk from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3552
integer height = 884
long backcolor = 67108864
string text = "Genericos"
long tabtextcolor = 33554432
string picturename = "insumo.ico"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_7 pb_7
sle_1 sle_1
rb_2 rb_2
dw_k dw_k
rb_1 rb_1
end type

on pk.create
this.pb_3=create pb_3
this.pb_7=create pb_7
this.sle_1=create sle_1
this.rb_2=create rb_2
this.dw_k=create dw_k
this.rb_1=create rb_1
this.Control[]={this.pb_3,&
this.pb_7,&
this.sle_1,&
this.rb_2,&
this.dw_k,&
this.rb_1}
end on

on pk.destroy
destroy(this.pb_3)
destroy(this.pb_7)
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.dw_k)
destroy(this.rb_1)
end on

type pb_3 from picturebutton within pk
event mousemove pbm_mousemove
integer x = 2185
integer y = 8
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

event clicked;
t1.pk.dw_k.Retrieve(st_p.codalmacen)

end event

type pb_7 from picturebutton within pk
event mousemove pbm_mousemove
integer x = 2039
integer y = 4
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Llevar al detalle"
end type

event clicked;int i
long fila, f
string codigo, descripcion, presentacion, valor, lote, fecha_venc
if dw_cab.RowCount() <= 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if
dw_k.SetFilter("")
dw_k.Filter()

for i = 1 to dw_k.RowCount()
	if dw_k.GetItemNumber(i,'selec') = 0 then CONTINUE
	descripcion = dw_k.getitemstring(i,'descripcion')
	if isnull(descripcion) then Continue
	
	codigo = dw_k.getitemstring(i,'codgenerico')

	fila = t1.pd.dw_cpo.Find( "codgenerico=" + "'" + codigo + "'", 1, t1.pd.dw_cpo.RowCount())
	if fila < 1 then
		valor = t1.pd.dw_cpo.describe("Evaluate('max(item)', 1)")
		fila = t1.pd.dw_cpo.InsertRow(0)
		t1.pd.dw_cpo.SetItem(fila, 'coddoc', dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') )
		t1.pd.dw_cpo.SetItem(fila, 'cLugar', dw_cab.GetItemString(dw_cab.GetRow(),'clugar') )
		t1.pd.dw_cpo.SetItem(fila, 'numdoc', dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc') )
		t1.pd.dw_cpo.SetItem(fila, 'descripcion',descripcion)
		t1.pd.dw_cpo.SetItem(fila, 'codgenerico',codigo)
		t1.pd.dw_cpo.SetItem(fila, 'Estado','0')
//		t1.pd.dw_cpo.SetItem(fila, 'vence',dw_k.getitemstring(i,'vence') )
		t1.pd.dw_cpo.SetItem(fila, 'item',long(valor) + 1)
//		t1.pd.dw_cpo.SetItem(fila, 'cod_impu', dw_k.getitemstring(i,'iva') )
		t1.pd.dw_cpo.ScrolltoRow(fila)
	else
		t1.pd.dw_cpo.ScrolltoRow(fila)
	end if
	dw_k.SetItem(i,'selec',0)
Next

if dw_k.describe("selec_t.Text") = 'Desel.' then
	dw_k.Modify("selec_t.Text='Selec.'")
end if

t1.SelectTab(t1.pd)

end event

type sle_1 from singlelineedit within pk
event keypressed pbm_keyup
integer x = 827
integer y = 48
integer width = 1161
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event keypressed;string texto
texto = upper(text)
if right(texto,1) <> '%' then
	texto = texto + '%'
end if
	
if rb_1.checked then
	dw_k.SetFilter("upper(codgenerico) like '" + texto + "'")
else
	dw_k.SetFilter("upper(descripcion) like '" + texto + "'")
end if
dw_k.Filter()

end event

type rb_2 from radiobutton within pk
integer x = 402
integer y = 52
integer width = 347
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción"
boolean checked = true
boolean automatic = false
boolean lefttext = true
end type

event clicked;if not checked then
	checked = TRUE
	rb_1.checked = FALSE
	sle_1.Text = ''
end if

end event

type dw_k from datawindow within pk
integer x = 55
integer y = 152
integer width = 3461
integer height = 700
integer taborder = 50
string title = "none"
string dataobject = "dw_buscagenerico_sel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.type="text" then
choose case dwo.name
	case 'selec_t'
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
	case "codarticulo_t"
		if ordenar[1]="codarticulo A" then
			ordenar[1]="codarticulo D"
		else
			ordenar[1]="codarticulo A"
		end if
		this.setsort(ordenar[1])
	case "fabricante_t"
		if ordenar[2]="fabricante A" then
			ordenar[2]="fabricante D"
		else
			ordenar[2]="fabricante A"
		end if
		this.setsort(ordenar[2])
	case "descripcion_t"
		if ordenar[3]="descripcion A" then
			ordenar[3]="descripcion D"
		else
			ordenar[3]="descripcion A"
		end if
		this.setsort(ordenar[3])
	case "vence_t"
		if ordenar[4]="vence A" then
			ordenar[4]="vence D"
		else
			ordenar[4]="vence A"
		end if
		this.setsort(ordenar[4])
	case "invima_t"
		if ordenar[5]="invima A" then
			ordenar[5]="invima D"
		else
			ordenar[5]="invima A"
		end if
		this.setsort(ordenar[5])
end choose
this.sort()
triggerEvent(rowfocuschanged!)
end if

end event

event constructor;setTransObject(SQLCA)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type rb_1 from radiobutton within pk
integer x = 27
integer y = 52
integer width = 279
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código"
boolean automatic = false
boolean lefttext = true
end type

event clicked;if not checked then
	checked = TRUE
	rb_2.checked = FALSE
	sle_1.Text = ''
end if

end event

type pb_tempo from picturebutton within w_sum_plant
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 2386
integer y = 52
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
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar Temporal"
end type

event clicked;if t1.pd.dw_cpo.RowCount() = 0 then 
	rollback;
	MessageBox('Atención','No ha agregado ningun artículo al detalle del documento')
	Return -1
end if
if isNull(dw_cab.GetItemString(dw_cab.GetRow(),'anulado')) or dw_cab.GetItemString(dw_cab.GetRow(),'anulado') = '' then 
	rollback;
	MessageBox('Atención','No ha dado nombre a la plantilla')
	Return -1
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then return 
long i
double numdoc

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '0' and dw_cab.GetItemnumber(dw_cab.GetRow(),'numdoc') = 0 then
	numdoc = f_trae_ndoc(dw_cab.GetItemString(dw_cab.GetRow(),'coddoc'),clugar,'Plantillas Suministros')
	if numdoc < 0 then Return -1
	dw_cab.SetItem(dw_cab.GetRow(),'numdoc',numdoc)
	for i = 1 to t1.pd.dw_cpo.RowCount()
		t1.pd.dw_cpo.SetItem(i,'numdoc',numdoc)
	next
	dw_cab.SetItem(dw_cab.GetRow(),'estado','0')
end if
if dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if
if t1.pd.dw_cpo.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
cambio = FALSE
Return 0

end event

type pb_borrar from picturebutton within w_sum_plant
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 2226
integer y = 188
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

event clicked;if dw_cab.RowCount() = 0 then Return 

if MessageBox('Aviso','Esta seguro de borrar la plantilla seleccionada?') = 2 then Return
t1.pd.dw_cpo.SetFilter("")
t1.pd.dw_cpo.Filter()

do while t1.pd.dw_cpo.RowCount() > 0 
	t1.pd.dw_cpo.DeleteRow(1)
loop

if t1.pd.dw_cpo.Update() = -1 then
	Rollback;
	Return -1
end if
dw_cab.DeleteRow(dw_cab.GetRow())
if dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if
commit;

end event

type pb_nuevo from picturebutton within w_sum_plant
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 2226
integer y = 52
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo documento"
end type

event clicked;this.Enabled = FALSE
if dw_cab.Find("estado='0'",1,dw_cab.RowCount()) > 0 then
	MessageBox("Atención","existe un documento sin grabar")
	Return -1
end if
dw_cab.InsertRow(1)
dw_cab.SetItem(1,'coddoc','SPT')
dw_cab.SetItem(1,'numdoc',0)
dw_cab.SetItem(1,'clugar',clugar)
dw_cab.SetItem(1,'estado','0')
dw_cab.SetItem(1,'codalmacen',st_p.codalmacen)
dw_cab.SetItem(1,'usuario',usuario)
dw_cab.ScrolltoRow(1)
t1.pd.dw_cpo.Reset()

cambio  = TRUE

end event

type st_1 from statictext within w_sum_plant
integer x = 64
integer y = 8
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plantillas"
boolean focusrectangle = false
end type

type dw_cab from datawindow within w_sum_plant
event borrarnuevo ( integer fila )
integer x = 64
integer y = 72
integer width = 2126
integer height = 392
integer taborder = 10
string title = "none"
string dataobject = "dw_plant_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event borrarnuevo(integer fila);if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	DeleteRow(fila)
	PostEvent(RowFocuschanged!)
end if

end event

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;t1.pd.dw_cpo.Reset()
If currentrow = 0 or rowCount() = 0 then Return
if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	t1.pd.dw_cpo.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
end if
if GetItemString(GetRow(),'estado') = '0' then
	cambio = TRUE
end if

end event

event rowfocuschanging;if currentRow = 0 or dw_cab.RowCount() = 0 then Return 0
integer ret
if cambio then
	ret = MessageBox('Atención','El documento no ha sido guardado, desea Guardar?',QUESTION!,YESNOCANCEL!,3)
	if ret = 1 then 
		if pb_tempo.Event clicked() = -1 then Return -1
	elseif ret = 2 then
		cambio = FALSE
		Return 0
	else
		Return -1
	end if
	Return -1
end if

end event

event dberror;Rollback;
Return 0

end event

event losefocus;AcceptText()

end event

