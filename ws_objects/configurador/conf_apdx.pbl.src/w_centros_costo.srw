$PBExportHeader$w_centros_costo.srw
forward
global type w_centros_costo from window
end type
type dw_4 from datawindow within w_centros_costo
end type
type tab_1 from tab within w_centros_costo
end type
type tabpage_1 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_1
end type
type st_cuantos from statictext within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_2 dw_2
st_cuantos st_cuantos
end type
type tabpage_2 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_3 dw_3
end type
type tab_1 from tab within w_centros_costo
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type pb_7 from picturebutton within w_centros_costo
end type
type pb_6 from picturebutton within w_centros_costo
end type
type pb_5 from picturebutton within w_centros_costo
end type
type pb_4 from picturebutton within w_centros_costo
end type
type pb_3 from picturebutton within w_centros_costo
end type
type pb_2 from picturebutton within w_centros_costo
end type
type pb_1 from picturebutton within w_centros_costo
end type
type st_3 from statictext within w_centros_costo
end type
type dw_1 from datawindow within w_centros_costo
end type
type st_2 from statictext within w_centros_costo
end type
type st_1 from statictext within w_centros_costo
end type
end forward

global type w_centros_costo from window
integer width = 4215
integer height = 2176
boolean titlebar = true
string title = "Centros de Costo"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Form!"
dw_4 dw_4
tab_1 tab_1
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_3 st_3
dw_1 dw_1
st_2 st_2
st_1 st_1
end type
global w_centros_costo w_centros_costo

type variables
string tipo_col,anterior,orden
datawindowchild dw_ccosto,idw_cost_urg,idw_cost_hosp,idw_cost_amb,idw_cost_qx,idw_varios,idw_varios_a,docus
transaction sqlte
end variables

on w_centros_costo.create
this.dw_4=create dw_4
this.tab_1=create tab_1
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_3=create st_3
this.dw_1=create dw_1
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.dw_4,&
this.tab_1,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_3,&
this.dw_1,&
this.st_2,&
this.st_1}
end on

on w_centros_costo.destroy
destroy(this.dw_4)
destroy(this.tab_1)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.st_1)
end on

event resize;tab_1.resize(newwidth - 50 , newheight -400)
tab_1.tabpage_1.dw_2.resize(tab_1.tabpage_1.width - 50 , tab_1.tabpage_1.height -100)
tab_1.tabpage_2.dw_3.resize(tab_1.tabpage_2.width - 50 , tab_1.tabpage_2.height -50)
pb_1.x=(newwidth - 1800)/2
pb_1.y=newheight - 140
pb_2.x=(newwidth - 1800)/2 +300
pb_2.y=newheight - 140
pb_3.x=(newwidth - 1800)/2 +600
pb_3.y=newheight - 140
pb_4.x=(newwidth - 1800)/2 +900
pb_4.y=newheight - 140
pb_5.x=(newwidth - 1800)/2 +1200
pb_5.y=newheight - 140
pb_6.x=(newwidth - 1800)/2 +1500
pb_6.y=newheight - 140
pb_7.x=(newwidth - 1800)/2 +1500
pb_7.y=newheight - 140
tab_1.tabpage_1.st_cuantos.y=tab_1.tabpage_1.dw_2.y+tab_1.tabpage_1.dw_2.height +10
st_1.y=tab_1.y+ tab_1.height+10
end event

type dw_4 from datawindow within w_centros_costo
boolean visible = false
integer x = 242
integer y = 1956
integer width = 686
integer height = 400
integer taborder = 110
string title = "none"
string dataobject = "dw_ccosto_fpago"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type tab_1 from tab within w_centros_costo
event create ( )
event destroy ( )
integer x = 46
integer y = 200
integer width = 4073
integer height = 1712
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4037
integer height = 1584
long backcolor = 67108864
string text = "Centro Costo"
long tabtextcolor = 33554432
string picturename = "ribon_costo.ico"
long picturemaskcolor = 536870912
dw_2 dw_2
st_cuantos st_cuantos
end type

on tabpage_1.create
this.dw_2=create dw_2
this.st_cuantos=create st_cuantos
this.Control[]={this.dw_2,&
this.st_cuantos}
end on

on tabpage_1.destroy
destroy(this.dw_2)
destroy(this.st_cuantos)
end on

type dw_2 from datawindow within tabpage_1
event keyup pbm_dwnkey
event cambia_col ( )
integer x = 32
integer y = 40
integer width = 3904
integer height = 1476
integer taborder = 30
string title = "none"
string dataobject = "dw_centro_costos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;if dataobject='dw_cont_impuesto' then
	if getcolumnname()='cuenta' then f_busca_cuenta(key,dw_1.getitemstring(1,1),this)
end if
if dataobject='dw_ctas_uti_perd_desc' then f_busca_cuenta(key,dw_1.getitemstring(1,1),this)
if dataobject='dw_concep_relfact' then
	if getcolumnname()='cod_total' or getcolumnname()='ctatxcod_total' then
		f_busca_cuenta(key,dw_1.getitemstring(1,1),this)
	end if
end if
if dataobject='dw_diags' then
	if key=keydelete! and getcolumnName()='cod_vigila' then
		long nul
		setnull(nul)
		setitem(getrow(),'cod_vigila',nul)
	end if
end if


if dataobject='dw_centro_costos' then
	string codemp
	choose case getcolumnName()
		case 'codtotal_ingreso'
			codemp=getitemstring(getrow(),'cod_empre_ingreso')
		case 'codtotal_glosa'
			codemp=getitemstring(getrow(),'cod_empre_glosa')
		case else 
			return
	end choose
	f_busca_cuenta(key,codemp,this)
end if
end event

event cambia_col();SetColumn('descripcion')
end event

event buttonclicked;long fila
fila=getrow()
if fila<1 then return
string nulo
setnull(nulo)
setitem(fila,"codtingre",nulo)


end event

event clicked;long color
if dwo.name = 'color' then
	color = GetItemNumber(Row,'color')
	if isNull(color) then color = RGB(255,255,255)
	choosecolor(color)
	SetItem(Row,'color',color)
	PostEvent('cambia_col')
end if

if dwo.type <> "text" then 
	if dwo.type="column" then
		tipo_col=describe(dwo.name+".coltype")
		st_3.text=dwo.name
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
setsort(cual+" "+orden)
sort()
anterior=cual



end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event itemchanged;accepttext()
end event

event itemfocuschanged;if dwo.type="column" then 
	tipo_col=describe(dwo.name+".coltype")
	st_3.text=dwo.name
else
	tipo_col=""
	st_3.text=""
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

event rowfocuschanged;tab_1.tabpage_2.dw_3.retrieve(dw_1.getitemstring(dw_1.getrow(),'coduf'),dw_2.getitemstring(dw_2.getrow(),'codcc'))
end event

type st_cuantos from statictext within tabpage_1
integer x = 3406
integer y = 1524
integer width = 517
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4037
integer height = 1584
long backcolor = 67108864
string text = "Cuentas Ingreso"
long tabtextcolor = 33554432
string picturename = "ribon_uf.ico"
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tabpage_2.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_2.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_2
event keyup pbm_dwnkey
integer x = 32
integer y = 40
integer width = 3899
integer height = 1496
integer taborder = 40
string title = "none"
string dataobject = "dw_ccosto_fpago"
boolean border = false
boolean livescroll = true
end type

event keyup;string codemp
choose case getcolumnName()
	case 'codtotal_ingreso'
		codemp=getitemstring(getrow(),'cod_empre_ingreso')
		f_busca_cuenta(key,codemp,this)		
	case 'codtotal_glosa'
		codemp=getitemstring(getrow(),'cod_empre_glosa')
		f_busca_cuenta(key,codemp,this)		
	case else 
		return
end choose




end event

event constructor;settransobject(sqlca)
end event

type pb_7 from picturebutton within w_centros_costo
boolean visible = false
integer x = 2587
integer y = 1936
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_6 from picturebutton within w_centros_costo
string tag = "Importar"
integer x = 2432
integer y = 1936
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "import.gif"
string disabledname = "d_import.gif"
alignment htextalign = left!
end type

event clicked;string docname, named
long value
value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
IF value = 1 THEN
	value=tab_1.tabpage_1.dw_2.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
end event

type pb_5 from picturebutton within w_centros_costo
string tag = "Exportar"
integer x = 2272
integer y = 1936
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
end type

event clicked;openwithparm(w_export,tab_1.tabpage_1.dw_2)

end event

type pb_4 from picturebutton within w_centros_costo
string tag = "Guardar"
integer x = 2112
integer y = 1936
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
end type

event clicked;if tab_1.tabpage_1.dw_2.update(true,false)=-1 then
	rollback;
	return -1
else
	commit;
	tab_1.tabpage_1.dw_2.resetupdate()
end if

int li
int l_i,l_fila
string uf,cc

uf=dw_1.getitemstring(1,1)
cc=tab_1.tabpage_1.dw_2.getitemstring(tab_1.tabpage_1.dw_2.getrow(),'codcc')
delete from centrocostos_fpago
where coduf=:uf and codcc=:cc;
if sqlca.sqlcode=-1 then
	messagebox("Error centrocostos_fpago",sqlca.sqlerrtext)
	rollback;
	return -1
end if

for  l_i = 1 to tab_1.tabpage_2.dw_3.rowcount()		
	l_fila=dw_4.insertrow(0)
	dw_4.setitem(l_fila,"mp_fems",tab_1.tabpage_2.dw_3.getitemstring(l_i,'mp_fems'))
	dw_4.setitem(l_fila ,"coduf",tab_1.tabpage_2.dw_3.getitemstring(l_i,'coduf'))
	dw_4.setitem(l_fila ,"codcc",tab_1.tabpage_2.dw_3.getitemstring(l_i,'codcc'))
	dw_4.setitem(l_fila ,"cod_empre_ingreso",tab_1.tabpage_2.dw_3.getitemstring(l_i,'cod_empre_ingreso'))
	dw_4.setitem(l_fila ,"codtotal_ingreso",tab_1.tabpage_2.dw_3.getitemstring(l_i,'codtotal_ingreso'))
	dw_4.setitem(l_fila ,"cod_empre_glosa",tab_1.tabpage_2.dw_3.getitemstring(l_i,'cod_empre_glosa'))
	dw_4.setitem(l_fila ,"codtotal_glosa",tab_1.tabpage_2.dw_3.getitemstring(l_i,'codtotal_glosa'))	
next	
if dw_4.update(true,false)=-1 then
	rollback;
	return -1
else
	commit;
	dw_4.resetupdate()
end if
end event

type pb_3 from picturebutton within w_centros_costo
string tag = "Refrescar"
integer x = 1952
integer y = 1936
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
end type

event clicked;dw_1.triggerevent(itemchanged!)
end event

type pb_2 from picturebutton within w_centros_costo
string tag = "Borrar"
integer x = 1792
integer y = 1936
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_2.deleterow(0)
end event

type pb_1 from picturebutton within w_centros_costo
string tag = "Insertar"
integer x = 1632
integer y = 1936
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_2.scrolltorow(tab_1.tabpage_1.dw_2.insertrow(0))
tab_1.tabpage_1.dw_2.setfocus()
	

end event

type st_3 from statictext within w_centros_costo
integer x = 2258
integer y = 76
integer width = 663
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_centros_costo
integer y = 36
integer width = 1509
integer height = 152
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_ufun"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
tab_1.tabpage_1.dw_2.retrieve(getitemstring(1,1))


end event

event constructor;settransobject(sqlca)
dw_1.insertrow(1)
end event

type st_2 from statictext within w_centros_costo
integer x = 2263
integer y = 16
integer width = 270
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_centros_costo
integer x = 73
integer y = 1932
integer width = 709
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Utilize click Contrario para Menu"
boolean focusrectangle = false
end type

