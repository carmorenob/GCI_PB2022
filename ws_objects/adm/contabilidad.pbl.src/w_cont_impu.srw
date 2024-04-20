$PBExportHeader$w_cont_impu.srw
$PBExportComments$impuestos
forward
global type w_cont_impu from window
end type
type cbx_1 from checkbox within w_cont_impu
end type
type dw_digita from datawindow within w_cont_impu
end type
type pb_8 from picturebutton within w_cont_impu
end type
type st_2 from statictext within w_cont_impu
end type
type pb_6 from picturebutton within w_cont_impu
end type
type pb_5 from picturebutton within w_cont_impu
end type
type pb_4 from picturebutton within w_cont_impu
end type
type pb_3 from picturebutton within w_cont_impu
end type
type pb_2 from picturebutton within w_cont_impu
end type
type pb_1 from picturebutton within w_cont_impu
end type
type dw_det from datawindow within w_cont_impu
end type
type dw_emp from datawindow within w_cont_impu
end type
type st_1 from statictext within w_cont_impu
end type
type st_5 from statictext within w_cont_impu
end type
type st_cuantos from statictext within w_cont_impu
end type
type dw_1 from datawindow within w_cont_impu
end type
type gb_1 from groupbox within w_cont_impu
end type
end forward

global type w_cont_impu from window
integer width = 4805
integer height = 2200
boolean titlebar = true
string title = "Impuestos Contables"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_reten.ico"
string pointer = "Arrow!"
event inicializa pbm_open
cbx_1 cbx_1
dw_digita dw_digita
pb_8 pb_8
st_2 st_2
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_det dw_det
dw_emp dw_emp
st_1 st_1
st_5 st_5
st_cuantos st_cuantos
dw_1 dw_1
gb_1 gb_1
end type
global w_cont_impu w_cont_impu

type variables
string tipo_col,anterior,orden,i_operacion

end variables

on w_cont_impu.create
this.cbx_1=create cbx_1
this.dw_digita=create dw_digita
this.pb_8=create pb_8
this.st_2=create st_2
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_det=create dw_det
this.dw_emp=create dw_emp
this.st_1=create st_1
this.st_5=create st_5
this.st_cuantos=create st_cuantos
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cbx_1,&
this.dw_digita,&
this.pb_8,&
this.st_2,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_det,&
this.dw_emp,&
this.st_1,&
this.st_5,&
this.st_cuantos,&
this.dw_1,&
this.gb_1}
end on

on w_cont_impu.destroy
destroy(this.cbx_1)
destroy(this.dw_digita)
destroy(this.pb_8)
destroy(this.st_2)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_det)
destroy(this.dw_emp)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_cuantos)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event resize;//dw_1.resize(newwidth - 100 , newheight - 280)
//cb_1.x=(newwidth - 1800)/2
//cb_1.y=newheight - 120
//cb_2.x=(newwidth - 1800)/2 +300
//cb_2.y=newheight - 120
//cb_4.x=(newwidth - 1800)/2 +600
//cb_4.y=newheight - 120
//cb_3.x=(newwidth - 1800)/2 +900
//cb_3.y=newheight - 120
//cb_5.x=(newwidth - 1800)/2 +1200
//cb_5.y=newheight - 120
//cb_6.x=(newwidth - 1800)/2 +1500
//cb_6.y=newheight - 120
//st_cuantos.x=newwidth - 520
//st_cuantos.y=newheight - 170
end event

event open;dw_1.retrieve()
cbx_1.triggerevent(clicked!)
end event

type cbx_1 from checkbox within w_cont_impu
integer x = 18
integer y = 912
integer width = 603
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar solo los Activos"
boolean checked = true
end type

event clicked;if checked then
	dw_1.setfilter('estado="1"')
else
	dw_1.setfilter('')
end if
dw_1.filter()
st_cuantos.text="Reg. "+ string(dw_1.getrow()) +" de " +string(dw_1.rowcount())
dw_det.retrieve(dw_1.getitemstring(dw_det.getrow(),'cod_concep'))
end event

type dw_digita from datawindow within w_cont_impu
event keyup pbm_dwnkey
integer x = 1248
integer y = 1132
integer width = 663
integer height = 160
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_paraediciones"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event keyup;if isnull(dw_emp.getitemstring(1,1)) or dw_1.rowcount()=0 then return
f_busca_cuenta(key,dw_emp.getitemstring(1,1),this)

end event

event constructor;insertrow(1)
end event

event getfocus;if isvalid(w_busca_cuenta) then 
	w_busca_cuenta.i_st.dw=this
	w_busca_cuenta.i_semovio=false
	if w_busca_cuenta.i_st.codemp<>dw_emp.getitemstring(1,1) then
		w_busca_cuenta.i_st.codemp=dw_emp.getitemstring(1,1)
		w_busca_cuenta.dw_1.retrieve(dw_emp.getitemstring(1,1))
	end if
end if

end event

event itemchanged;if isnull(dw_emp.getitemstring(1,1)) or dw_1.rowcount()=0 then return
string rfuente,natu,otro,descrip,codemp,codimp
setnull(natu)
otro=gettext()
if trim(otro)='' then return
codemp=dw_emp.getitemstring(1,1)
select rfuente,naturaleza,descrip into :rfuente,:natu,:descrip from cont_plan 
	where codtotal=:otro and cod_empresa=:codemp and movimiento='1';
if isnull(natu) then
	return 1
else
	codimp=dw_1.getitemstring(dw_1.getrow(),'cod_concep')
	dw_det.insertrow(1)
	dw_det.setitem(1,'cod_concep',codimp)
	dw_det.setitem(1,'cod_empresa',codemp)
	dw_det.setitem(1,'codtotal',otro)
	dw_det.setitem(1,'descrip',descrip)
	dw_det.setitem(1,'naturaleza',natu)
	dw_det.setitem(1,'movimiento','1')
end if
end event

type pb_8 from picturebutton within w_cont_impu
integer x = 4553
integer y = 1228
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_det.deleterow(0)
end event

type st_2 from statictext within w_cont_impu
integer x = 69
integer y = 1276
integer width = 343
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cuentas:"
boolean focusrectangle = false
end type

type pb_6 from picturebutton within w_cont_impu
integer x = 1934
integer y = 900
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &p"
boolean originalsize = true
string picturename = "import.gif"
string powertiptext = "Importar [Alt+P]"
end type

event clicked;string docname, named
long value
value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
IF value = 1 THEN
	value=dw_1.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
end event

type pb_5 from picturebutton within w_cont_impu
integer x = 1783
integer y = 900
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &x"
boolean originalsize = true
string picturename = "export.gif"
string powertiptext = "Exportar [Alt+X]"
end type

event clicked;openwithparm(w_export,dw_1)
end event

type pb_4 from picturebutton within w_cont_impu
integer x = 1632
integer y = 900
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &g"
boolean originalsize = true
string picturename = "guardar.gif"
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;dw_1.accepttext()
dw_det.accepttext()
i_operacion = 'Delete'
if dw_det.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if dw_1.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = 'Insert'
if dw_1.Update(true,false) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if dw_det.Update(true,false) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = ''
commit;
dw_1.resetupdate()
dw_det.resetupdate()
end event

type pb_3 from picturebutton within w_cont_impu
integer x = 1481
integer y = 900
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &r"
boolean originalsize = true
string picturename = "refrescar.gif"
string powertiptext = "Refrescar [Alt+R]"
end type

event clicked;dw_1.retrieve()
end event

type pb_2 from picturebutton within w_cont_impu
integer x = 1330
integer y = 900
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &b"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Borar [Alt+B]"
end type

event clicked;dw_1.deleterow(0)
end event

type pb_1 from picturebutton within w_cont_impu
integer x = 1179
integer y = 900
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &i"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Insertar [Alt+I]"
end type

event clicked;dw_1.scrolltorow(dw_1.insertrow(0))
dw_1.setfocus()
end event

type dw_det from datawindow within w_cont_impu
integer x = 41
integer y = 1324
integer width = 4434
integer height = 636
integer taborder = 80
string title = "dw_ctas_de_impuestos"
string dataobject = "dw_impu_ctas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

type dw_emp from datawindow within w_cont_impu
integer x = 46
integer y = 1132
integer width = 1083
integer height = 148
integer taborder = 70
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

type st_1 from statictext within w_cont_impu
integer y = 12
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
string text = "Impuestos:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_cont_impu
integer x = 4027
integer width = 709
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Utilize click Contrario para Menu"
boolean focusrectangle = false
end type

type st_cuantos from statictext within w_cont_impu
integer x = 4297
integer y = 800
integer width = 457
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_cont_impu
event keypres pbm_dwnkey
integer y = 68
integer width = 4754
integer height = 824
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_cont_impuesto"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_det.reset()
st_cuantos.text=""
if getrow()<1 then return
st_cuantos.text="Reg. "+ string(getrow()) +" de " +string(rowcount())
dw_det.retrieve(getitemstring(getrow(),'cod_concep'))

end event

event clicked;if dwo.type <> "text" then 
	if dwo.type="column" then
		tipo_col=describe(dwo.name+".coltype")
	end if
	return
end if
string cual,ojo,ss
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior=cual then
	if orden="A" then
		orden="D"
	else
		orden="A"
	end if
else
	orden="A"
end if
dw_1.setsort(cual+" "+orden)
dw_1.sort()
anterior=cual
end event

event itemchanged;accepttext()
string nulo
setnull(nulo)
if dwo.name='sobre' then
	choose case data
		case 'I'
			setitem(row,'accion','2')
			setitem(row,'cartipo',nulo)
		case 'P'
			setitem(row,'accion','N')
		case else
			setitem(row,'cartipo',nulo)
	end choose
end if



end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

type gb_1 from groupbox within w_cont_impu
integer x = 14
integer y = 1068
integer width = 4745
integer height = 924
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Cuentas con este Impuesto:"
end type

