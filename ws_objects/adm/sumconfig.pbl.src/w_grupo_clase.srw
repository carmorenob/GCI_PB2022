$PBExportHeader$w_grupo_clase.srw
forward
global type w_grupo_clase from window
end type
type dw_emp from datawindow within w_grupo_clase
end type
type dw_c from datawindow within w_grupo_clase
end type
type pb_3 from picturebutton within w_grupo_clase
end type
type pb_2 from picturebutton within w_grupo_clase
end type
type pb_1 from picturebutton within w_grupo_clase
end type
type pb_grabardef from picturebutton within w_grupo_clase
end type
type pb_insert from picturebutton within w_grupo_clase
end type
type pb_anular from picturebutton within w_grupo_clase
end type
type pb_cancelar from picturebutton within w_grupo_clase
end type
type dw_g from datawindow within w_grupo_clase
end type
type gb_1 from groupbox within w_grupo_clase
end type
type gb_2 from groupbox within w_grupo_clase
end type
end forward

global type w_grupo_clase from window
integer width = 5015
integer height = 2008
boolean titlebar = true
string title = "Suministros- Grupos y Clases"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "hardware.ico"
boolean center = true
dw_emp dw_emp
dw_c dw_c
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
pb_grabardef pb_grabardef
pb_insert pb_insert
pb_anular pb_anular
pb_cancelar pb_cancelar
dw_g dw_g
gb_1 gb_1
gb_2 gb_2
end type
global w_grupo_clase w_grupo_clase

type variables
long xant, yant
string ordenar[4]
boolean i_cambio
string i_empresa
datawindowchild dwc_ccosto


end variables

on w_grupo_clase.create
this.dw_emp=create dw_emp
this.dw_c=create dw_c
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.pb_grabardef=create pb_grabardef
this.pb_insert=create pb_insert
this.pb_anular=create pb_anular
this.pb_cancelar=create pb_cancelar
this.dw_g=create dw_g
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_emp,&
this.dw_c,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.pb_grabardef,&
this.pb_insert,&
this.pb_anular,&
this.pb_cancelar,&
this.dw_g,&
this.gb_1,&
this.gb_2}
end on

on w_grupo_clase.destroy
destroy(this.dw_emp)
destroy(this.dw_c)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.pb_grabardef)
destroy(this.pb_insert)
destroy(this.pb_anular)
destroy(this.pb_cancelar)
destroy(this.dw_g)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event close;rollback;

end event

event closequery;if dw_g.ModifiedCount() > 0 or dw_c.ModifiedCount() > 0 or dw_g.DeletedCount() > 0 or dw_c.DeletedCount() > 0 then
	int ret
	ret = MessageBox('Aviso','Ha realizado cambios. Desea Guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_grabardef.Event Clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

event open;dw_g.Retrieve()

end event

event resize;gb_2.resize(newwidth -50 , newheight - 750)
dw_c.resize(newwidth -150 , newheight - 1000)

pb_cancelar.y=newheight -140
pb_grabardef.y=newheight -140
pb_1.y=newheight -140
end event

type dw_emp from datawindow within w_grupo_clase
integer x = 96
integer y = 668
integer width = 1138
integer height = 140
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(SQLCA)
insertrow(1)
long cuantos
string emp
select count(*),min(cod_empresa) into :cuantos,:emp from
cont_empresa;
if cuantos=1 then 
	setitem(1,1,emp)
	post event itemchanged(1,object.cod_empresa,emp)
	dw_c.setfocus()
end if

end event

event itemchanged;string emp_ant
int ret
emp_ant = GetItemString(1,1)
if i_cambio then
	ret = MessageBox('Atención','Ha hecho cambios. Desea guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		if pb_grabardef.Event clicked() = -1 then
			return 1
		else
			return 0
		end if
	elseif ret = 3 then
		return 1
	end if
end if
accepttext()
i_empresa = GetItemString(1,1)
dw_c.retrieve(dw_g.GetItemString(dw_g.GetRow(),'codgrupo'),i_empresa)

end event

type dw_c from datawindow within w_grupo_clase
event keydown pbm_dwnkey
integer x = 91
integer y = 816
integer width = 4832
integer height = 892
integer taborder = 40
string title = "none"
string dataobject = "dw_sum_clase"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
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

event constructor;SetTransObject(SQLCA)
dw_c.GetChild('codcc', dwc_ccosto)
dwc_ccosto.SetTransObject(SQLCA)
dwc_ccosto.InsertRow(0)
end event

event clicked;if row < 1 then Return
if this.GetRow() <> row then
	this.SetRow(row)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.dw_cab=dw_g
st_dw.color_fondo=string(rgb(255,255,255))
st_dw.solobuscar = TRUE
openwithparm(w_funcion_dw,st_dw)

end event

event itemchanged;AcceptText()
string valor
setnull(valor)
if this.getcolumnname() = 'codtotal' or left(this.getcolumnname(),3) = 'cta' then
	long cuenta
	if 	this.getcolumnname() = 'codtotal'  then 	dw_c.SetItem(row,'cod_empresa', dw_emp.getitemstring(1,1))
	if left(this.getcolumnname(),3) = 'cta' then dw_c.SetItem(row,'cem'+mid(this.getcolumnname(),4,len(this.getcolumnname())), dw_emp.getitemstring(1,1))
	if isNull(data) then data = GetItemString(GetRow(),GetColumnName())
	select count(*) into :cuenta from cont_plan
	where cod_empresa=:i_empresa and codtotal=:data and movimiento='1';
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 1
	elseif cuenta = 0 then
		MessageBox("Atención", 'La cuenta no se existe o no es de movimiento')
		Return 1
	END IF
end if

if this.getcolumnname()  = 'coduf' then
	if dwc_ccosto.Retrieve(data) = 0 then
		dwc_ccosto.InsertRow(0)
	end if
	this.SetItem(row,'codcc',valor)
end if

if this.getcolumnname()  = 'codcc' then
	this.SetItem(row,'codcc',dwc_ccosto.GetItemString(dwc_ccosto.GetRow(),'codcc'))
end if

i_cambio = TRUE

end event

event rowfocuschanged;if this.RowCount() < 1 then Return

if not isNull(dw_c.GetItemString(currentRow,'coduf')) then
	if dwc_ccosto.Retrieve(dw_c.GetItemString(currentRow,'coduf')) = 0 then
		dwc_ccosto.InsertRow(0)
	end if
end if
end event

type pb_3 from picturebutton within w_grupo_clase
event mousemove pbm_mousemove
string tag = "Borrar"
integer x = 2688
integer y = 228
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
string powertiptext = "Borrar"
end type

event clicked;if dw_g.RowCount() = 0 then Return
if dw_c.RowCount() > 0 then
	if MessageBox('Aviso','Esta seguro de querer borrar el Grupo con sus Clases?',QUESTION!,YESNO!,2) = 1 then
		do while dw_c.RowCount() > 0
			dw_c.DeleteRow(0)
		loop
		dw_g.DeleteRow(dw_g.GetRow())
	end if
else
	dw_g.DeleteRow(dw_g.GetRow())
end if

end event

type pb_2 from picturebutton within w_grupo_clase
event mousemove pbm_mousemove
string tag = "Insertar"
integer x = 2688
integer y = 104
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
string powertiptext = "Insertar"
end type

event clicked;long fila
fila = dw_g.InsertRow(0)
dw_g.scrollToRow(fila)

end event

type pb_1 from picturebutton within w_grupo_clase
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 1893
integer y = 1780
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
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir Reporte"
end type

event clicked;uo_report i_rep
any par[]
i_rep=create uo_report
i_rep.tipo_rep='interno!'
i_rep.cod_rep='GC'
i_rep.nombre_rep='Grupos - Clases'
if i_rep.inicia()=-1 then return -1

i_rep.v_preliminar=true
i_rep.dialogo=false
i_rep.cambiar_prop=false
i_rep.imprimir(par,'','0')

return 0

end event

type pb_grabardef from picturebutton within w_grupo_clase
event mousemove pbm_mousemove
string tag = "Grabar"
integer x = 1742
integer y = 1780
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Grabar"
end type

event clicked;if dw_g.AcceptText() = -1 then
	messageBox('Aviso','No todos los datos cumplen sus restricciones')
	Return -1
end if
if dw_c.AcceptText() = -1 then
	messageBox('Aviso','No todos los datos cumplen sus restricciones')
	Return -1
end if
if dw_g.Update() = -1 then
	Rollback;
	Return -1
end if
if dw_c.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
i_cambio = FALSE
Return 0

end event

type pb_insert from picturebutton within w_grupo_clase
event mousemove pbm_mousemove
string tag = "Insertar"
integer x = 3333
integer y = 656
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar"
end type

event clicked;long fila
string ret,gr

if dw_emp.getitemstring(1,1)=''  or  isnull(dw_emp.getitemstring(1,1)) then return
fila = dw_c.InsertRow(0)
dw_c.scrollToRow(fila)

gr = dw_g.GetItemString(dw_g.GetRow(),'codgrupo')
dw_c.SetItem(fila,'codgrupo',gr)
ret = dw_c.Describe("Evaluate(' max(long(if(codgrupo=~~'" + gr + "~~',mid(codclase,2),~~'0~~'))) ', 0)")
ret = string(long(ret)+1,'00')
dw_c.SetItem(dw_c.getRow(),'codclase',gr + ret)
i_cambio = TRUE
end event

type pb_anular from picturebutton within w_grupo_clase
event mousemove pbm_mousemove
string tag = "Borrar"
integer x = 3488
integer y = 656
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar"
end type

event clicked;dw_c.DeleteRow(dw_c.GetRow())
i_cambio = TRUE

end event

type pb_cancelar from picturebutton within w_grupo_clase
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1586
integer y = 1780
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

type dw_g from datawindow within w_grupo_clase
integer x = 105
integer y = 96
integer width = 2523
integer height = 432
integer taborder = 10
string title = "none"
string dataobject = "dw_sum_grupo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanging;if dw_c.ModifiedCount() > 0 or dw_c.DeletedCount() > 0 then
	int ret
	ret = MessageBox('Aviso','Ha realizado cambios en Clases. Desea Guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_grabardef.Event Clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

event constructor;SetTransObject(SQLCA)
end event

event rowfocuschanged;dw_c.Reset()
if not isNull(GetItemString(GetRow(),'codgrupo')) then
	dw_c.Retrieve(GetItemString(GetRow(),'codgrupo'),dw_emp.GetItemString(1,1))
end if

end event

type gb_1 from groupbox within w_grupo_clase
integer x = 37
integer y = 28
integer width = 2857
integer height = 548
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos"
end type

type gb_2 from groupbox within w_grupo_clase
integer x = 32
integer y = 600
integer width = 4946
integer height = 1124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clases"
end type

