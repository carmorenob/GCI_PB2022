$PBExportHeader$w_articulos.srw
forward
global type w_articulos from window
end type
type pb_3 from pb_report within w_articulos
end type
type pb_grabardef from picturebutton within w_articulos
end type
type pb_insert from picturebutton within w_articulos
end type
type pb_anular from picturebutton within w_articulos
end type
type pb_cancelar from picturebutton within w_articulos
end type
type rb_descgen from radiobutton within w_articulos
end type
type rb_gen from radiobutton within w_articulos
end type
type rb_descart from radiobutton within w_articulos
end type
type rb_cod from radiobutton within w_articulos
end type
type sle_1 from singlelineedit within w_articulos
end type
type dw_articulos from datawindow within w_articulos
end type
type gb_1 from groupbox within w_articulos
end type
end forward

global type w_articulos from window
integer width = 4466
integer height = 1888
boolean titlebar = true
string title = "Artículos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_articulo.ico"
pb_3 pb_3
pb_grabardef pb_grabardef
pb_insert pb_insert
pb_anular pb_anular
pb_cancelar pb_cancelar
rb_descgen rb_descgen
rb_gen rb_gen
rb_descart rb_descart
rb_cod rb_cod
sle_1 sle_1
dw_articulos dw_articulos
gb_1 gb_1
end type
global w_articulos w_articulos

type variables
long xant, yant
string ordenar[8]
end variables

forward prototypes
public subroutine f_buscagen (string busca, datawindow dw_tmp)
end prototypes

public subroutine f_buscagen (string busca, datawindow dw_tmp);
if not isvalid(w_buscagen) then 
	openwithParm(w_buscagen,dw_tmp)
	dw_tmp.setfocus()
end if
if w_buscagen.windowstate=minimized! then
	w_buscagen.windowstate=normal!
	if isvalid(dw_tmp) then dw_tmp.setfocus()
end if
if trim(lower(busca))="" or isnull(busca) then
	w_buscagen.dw_generico.setfilter("")
else
	w_buscagen.dw_generico.setfilter("(lower(codgenerico) like '"+lower(trim(busca))+"%')")
end if
w_buscagen.dw_generico.filter()
w_buscagen.dw_generico.sort()

end subroutine

on w_articulos.create
this.pb_3=create pb_3
this.pb_grabardef=create pb_grabardef
this.pb_insert=create pb_insert
this.pb_anular=create pb_anular
this.pb_cancelar=create pb_cancelar
this.rb_descgen=create rb_descgen
this.rb_gen=create rb_gen
this.rb_descart=create rb_descart
this.rb_cod=create rb_cod
this.sle_1=create sle_1
this.dw_articulos=create dw_articulos
this.gb_1=create gb_1
this.Control[]={this.pb_3,&
this.pb_grabardef,&
this.pb_insert,&
this.pb_anular,&
this.pb_cancelar,&
this.rb_descgen,&
this.rb_gen,&
this.rb_descart,&
this.rb_cod,&
this.sle_1,&
this.dw_articulos,&
this.gb_1}
end on

on w_articulos.destroy
destroy(this.pb_3)
destroy(this.pb_grabardef)
destroy(this.pb_insert)
destroy(this.pb_anular)
destroy(this.pb_cancelar)
destroy(this.rb_descgen)
destroy(this.rb_gen)
destroy(this.rb_descart)
destroy(this.rb_cod)
destroy(this.sle_1)
destroy(this.dw_articulos)
destroy(this.gb_1)
end on

event open;
dw_articulos.SetTransObject(SQLCA)
dw_articulos.Retrieve()

end event

event close;rollback;

end event

event closequery;if dw_articulos.ModifiedCount() > 0 then
	int ret
	ret = MessageBox('Aviso','Ha realizado cambios. Desea Guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_grabardef.Event Clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

event resize;dw_articulos.resize(newwidth -100 , newheight -500)
pb_cancelar.y=newheight -140
pb_anular.y=newheight -140
pb_insert.y=newheight -140
pb_grabardef.y=newheight -140
pb_3.y=newheight -140
end event

type pb_3 from pb_report within w_articulos
integer x = 2619
integer y = 1640
integer taborder = 110
string text = "        &b"
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir Lista de Articulos [Alt+B]"
string cod_rep = "ART"
string nombre_rep = "Lista Articulos"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_articulos.rowcount()<1 then return
any par[3]
//par[1]=dw_admi.getitemnumber(1,"nh")
//par[2]=tipo_ingres
//par[3]=dw_admi.getitemstring(1,"clugar")
imprimir(par,'','0')



end event

type pb_grabardef from picturebutton within w_articulos
event mousemove pbm_mousemove
string tag = "Grabar"
integer x = 2455
integer y = 1640
integer width = 146
integer height = 128
integer taborder = 100
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
string powertiptext = "Grabar"
end type

event clicked;if dw_articulos.AcceptText() = -1 then
	messageBox('Aviso','No todos los datos cumplen sus restricciones')
	Return -1
end if

st_lote st_lotes
long i,cant
for i = 1 to dw_articulos.RowCount()
	if dw_articulos.getitemstatus(i,'vence',primary!)=notModified! then continue
	if dw_articulos.getitemstatus(i,0,primary!)=newModified! then continue
	if dw_articulos.GetItemString(i,'vence')='1' then
		st_lotes.codarticulo=dw_articulos.GetItemString(i,'codarticulo')
		st_lotes.codalmacendes=dw_articulos.GetItemString(i,'descripcion')
		select count(*) into :cant from sum_kardex_mov
		where codarti=:st_lotes.codarticulo; 
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		if cant > 0 then
			openwithParm(w_asigna_lote,st_lotes)
			if message.stringparm='!' then
				Rollback;
				Return -1
			end if
		end if
	end if
next

if dw_articulos.Update() = -1 then
	Rollback;
	Return -1
else
	commit;
end if
pb_insert.enabled=true
Return 0

end event

type pb_insert from picturebutton within w_articulos
event mousemove pbm_mousemove
string tag = "Insertar"
integer x = 2290
integer y = 1640
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar"
end type

event clicked;long fila
fila = dw_articulos.InsertRow(0)
dw_articulos.scrollToRow(fila)
pb_insert.enabled=false
dw_articulos.setitemstatus(fila,0,primary!,new!)
end event

type pb_anular from picturebutton within w_articulos
event mousemove pbm_mousemove
string tag = "Borrar"
integer x = 2126
integer y = 1640
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar"
end type

event clicked;dw_articulos.DeleteRow(dw_articulos.GetRow())
pb_insert.enabled=true

end event

type pb_cancelar from picturebutton within w_articulos
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1961
integer y = 1640
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type rb_descgen from radiobutton within w_articulos
integer x = 1993
integer y = 72
integer width = 590
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción Genérico"
end type

type rb_gen from radiobutton within w_articulos
integer x = 1993
integer y = 160
integer width = 494
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código Genérico"
end type

type rb_descart from radiobutton within w_articulos
integer x = 1413
integer y = 72
integer width = 530
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción Artículo"
boolean checked = true
end type

type rb_cod from radiobutton within w_articulos
integer x = 1413
integer y = 160
integer width = 498
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código Artículo"
end type

type sle_1 from singlelineedit within w_articulos
event teclear pbm_keyup
integer x = 119
integer y = 132
integer width = 1202
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event teclear;string condicion

if match(trim(sle_1.text),"%$") = TRUE then
	condicion = "'" + upper(trim(sle_1.text)) + "'"
else
	condicion = "'" + upper(trim(sle_1.text)) + "%'"
end if

if rb_cod.checked then
	dw_articulos.setfilter("codarticulo like " + condicion)
elseif rb_descart.checked then
	dw_articulos.setfilter("upper(descripcion) like " + condicion)
elseif rb_descgen.checked then
	dw_articulos.setfilter("upper(descgen) like " + condicion)
elseif rb_gen.checked then
	dw_articulos.setfilter("codgenerico like " + condicion)
end if
if trim(sle_1.text) = '' then
	dw_articulos.setfilter("")
end if
dw_articulos.filter()

end event

type dw_articulos from datawindow within w_articulos
event teclea pbm_dwnkey
integer x = 46
integer y = 304
integer width = 4270
integer height = 1304
integer taborder = 60
string title = "none"
string dataobject = "dw_articulocfg"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
//if GetColumnName() = 'tipoarticulo' then
//	if data = 'A' then 
//		setItem(row,'act_fijo','1')
//	else
//		setItem(row,'act_fijo','0')
//	end if

if GetColumnName() = 'fabricante' or GetColumnName() = 'presentacion' then
	if AcceptText() = -1 then Return
	if not isNull(GetItemString(GetRow(),'descgen')) then 
		SetItem(GetRow(),'descripcion',GetItemString(GetRow(),'descgen'))
	else
		SetItem(GetRow(),'descripcion','')
	end if
	If len(GetItemString(GetRow(),'descripcion'))>=200 then
		SetItem(GetRow(),'descripcion',left(GetItemString(GetRow(),'descripcion'),180))
	end If	

	
	if not isNull(GetItemString(GetRow(),'fabricante')) then
		SetItem(GetRow(),'descripcion',GetItemString(GetRow(),'descripcion') +" "+ GetItemString(GetRow(),'fabricante'))
	end if
	if not isNull(GetItemString(row,'presentacion')) then
		SetItem(GetRow(),'descripcion',GetItemString(GetRow(),'descripcion') +" "+ GetItemString(GetRow(),'presentacion'))
	end if
	
elseif GetColumnName() = 'vence' then
	string codarticulo
	long cant 
	if data = '0' then
		codarticulo = getItemString(GetRow(),'codarticulo')
		select count(*) into :cant from sum_lote
		where codarticulo=:codarticulo;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		if cant > 0 then
			MessageBox('Atención','El articulo tiene asignados cantidades en lotes. No puede cambiarse.')
			SetItem(GetRow(),'vence','1')
			Return 1
		end if
		select count(*) into :cant from sum_kardex_mov
		where codarti=:codarticulo; 
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		if cant > 0 then
			MessageBox('Atención','El articulo tiene movimientos sin lotes. No puede cambiarse.')
			SetItem(GetRow(),'vence','0')
			Return 1
		end if
	end if
	AcceptText()
end if
SetItem(GetRow(),'usuario',usuario)
setItem(GetRow(),'fecha_audita',datetime(today(),now()))
end event

event clicked;if dwo.type="text" then
choose case dwo.name
	case "codarticulo_t"
		if ordenar[1]="codarticulo A" then
			ordenar[1]="codarticulo D"
		else
			ordenar[1]="codarticulo A"
		end if
		this.setsort(ordenar[1])
	case "tipoarticulo_t"
		if ordenar[2]="tipoarticulo A" then
			ordenar[2]="tipoarticulo D"
		else
			ordenar[2]="tipoarticulo A"
		end if
		this.setsort(ordenar[2])
	case "codgenerico_t"
		if ordenar[3]="codgenerico A" then
			ordenar[3]="codgenerico D"
		else
			ordenar[3]="codgenerico A"
		end if
		this.setsort(ordenar[3])
	case "fabricante_t"
		if ordenar[4]="fabricante A" then
			ordenar[4]="fabricante D"
		else
			ordenar[4]="fabricante A"
		end if
		this.setsort(ordenar[4])
	case "presentacion_t"
		if ordenar[5]="presentacion A" then
			ordenar[5]="presentacion D"
		else
			ordenar[5]="presentacion A"
		end if
		this.setsort(ordenar[5])
	case "descripcion_t"
		if ordenar[6]="descripcion A" then
			ordenar[6]="descripcion D"
		else
			ordenar[6]="descripcion A"
		end if
		this.setsort(ordenar[6])
	case "t_6"
		if ordenar[7]="vence A" then
			ordenar[7]="vence D"
		else
			ordenar[7]="vence A"
		end if
		this.setsort(ordenar[7])
	case "iva_t"
		if ordenar[8]="iva A" then
			ordenar[8]="iva D"
		else
			ordenar[8]="iva A"
		end if
		this.setsort(ordenar[8])
end choose
this.sort()
end if

if row < 1 then Return
if this.GetRow() <> row then
	this.SetRow(row)
end if

end event

event buttonclicked;if string(dwo.Name) = 'b_1' then
	openwithParm(w_buscagen,this)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)

end event

type gb_1 from groupbox within w_articulos
integer x = 37
integer y = 8
integer width = 2565
integer height = 252
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar"
end type

