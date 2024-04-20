$PBExportHeader$w_tablas3.srw
forward
global type w_tablas3 from window
end type
type pb_7 from picturebutton within w_tablas3
end type
type pb_4 from picturebutton within w_tablas3
end type
type pb_3 from picturebutton within w_tablas3
end type
type pb_6 from picturebutton within w_tablas3
end type
type pb_5 from picturebutton within w_tablas3
end type
type pb_2 from picturebutton within w_tablas3
end type
type pb_1 from picturebutton within w_tablas3
end type
type st_1 from statictext within w_tablas3
end type
type st_4 from statictext within w_tablas3
end type
type sle_1 from singlelineedit within w_tablas3
end type
type st_3 from statictext within w_tablas3
end type
type st_2 from statictext within w_tablas3
end type
type dw_2 from datawindow within w_tablas3
end type
type dw_3 from datawindow within w_tablas3
end type
type dw_1 from datawindow within w_tablas3
end type
end forward

global type w_tablas3 from window
integer width = 3973
integer height = 1964
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Form!"
pb_7 pb_7
pb_4 pb_4
pb_3 pb_3
pb_6 pb_6
pb_5 pb_5
pb_2 pb_2
pb_1 pb_1
st_1 st_1
st_4 st_4
sle_1 sle_1
st_3 st_3
st_2 st_2
dw_2 dw_2
dw_3 dw_3
dw_1 dw_1
end type
global w_tablas3 w_tablas3

type variables
datawindowchild dw_ccosto,hija
string tipo_col,anterior,orden
st_ppto st_parm
end variables

forward prototypes
public subroutine inicializa ()
end prototypes

public subroutine inicializa ();dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_2.getchild(dw_2.describe("#1.name"),hija)
hija.settransobject(SQLCA)
hija.retrieve()
dw_1.insertrow(1)
dw_2.insertrow(1)
hija.setfilter("#1='0'")
hija.filter()
if dw_3.dataobject="dw_camas" then
	dw_3.getchild("descripcion",dw_ccosto)
	dw_ccosto.settransobject(sqlca)
	dw_ccosto.retrieve()
end if
if dw_3.dataobject='dw_banco_subemp' then 
	dw_3.getchild('cod_tsubempaq',dw_ccosto)
	dw_ccosto.settransobject(sqlca)
end if
end subroutine

on w_tablas3.create
this.pb_7=create pb_7
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.st_4=create st_4
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_2=create dw_2
this.dw_3=create dw_3
this.dw_1=create dw_1
this.Control[]={this.pb_7,&
this.pb_4,&
this.pb_3,&
this.pb_6,&
this.pb_5,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.st_4,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.dw_2,&
this.dw_3,&
this.dw_1}
end on

on w_tablas3.destroy
destroy(this.pb_7)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.dw_1)
end on

event resize;dw_3.resize(newwidth - 50 , newheight -630)
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

end event

type pb_7 from picturebutton within w_tablas3
boolean visible = false
integer x = 2002
integer y = 1676
integer width = 146
integer height = 128
integer taborder = 60
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

type pb_4 from picturebutton within w_tablas3
string tag = "Guardar"
integer x = 1449
integer y = 1676
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
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

event clicked;if dw_3.update(true,false)<1 then
	rollback;
else
	dw_3.resetupdate()
	commit;
end if
end event

type pb_3 from picturebutton within w_tablas3
string tag = "Refrescar"
integer x = 1266
integer y = 1676
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
end type

event clicked;dw_2.triggerevent(itemchanged!)
end event

type pb_6 from picturebutton within w_tablas3
string tag = "Importar"
integer x = 1838
integer y = 1676
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
string picturename = "import.gif"
string disabledname = "d_import.gif"
alignment htextalign = left!
end type

event clicked;string docname, named
long value
value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
IF value = 1 THEN
	value=dw_3.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
end event

type pb_5 from picturebutton within w_tablas3
string tag = "Exportar"
integer x = 1641
integer y = 1676
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
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
end type

event clicked;openwithparm(w_export,dw_3)
end event

type pb_2 from picturebutton within w_tablas3
string tag = "Borrar"
integer x = 1102
integer y = 1676
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;long fila
fila=dw_3.getrow()
if fila<1 then return
if dw_3.dataobject="dw_camas" then
	if not isnull(dw_3.getitemstring(fila,"documento")) then
		messagebox("Atención","Esta cama se encuentra ocupada, no se puede borrar")
		return
	end if
end if
dw_3.deleterow(0)
end event

type pb_1 from picturebutton within w_tablas3
string tag = "Insertar"
integer x = 905
integer y = 1676
integer width = 146
integer height = 128
integer taborder = 40
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

event clicked;long donde
donde=dw_3.insertrow(0)
dw_3.scrolltorow(donde)
string tipo
tipo=dw_1.describe("#1.coltype")
tipo = left (tipo,5)
choose case tipo
	case "char("
		if isnull(dw_1.getitemstring(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,1,dw_1.getitemstring(1,1))
	case "Date"
		if isnull(dw_1.getitemdate(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,1,dw_1.getitemdate(1,1))
	case "Datet"
		if isnull(dw_1.getitemdatetime(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,1,dw_1.getitemdatetime(1,1))
	case "time"
		if isnull(dw_1.getitemtime(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,1,dw_1.getitemtime(1,1))
	case else
		if isnull(dw_1.getitemnumber(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,1,dw_1.getitemnumber(1,1))
end choose
tipo=dw_2.describe("#1.coltype")
tipo = left (tipo,5)
choose case tipo
	case "char("
		if isnull(dw_2.getitemstring(1,1)) or dw_2.getitemstring(1,1)="" then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,2,dw_2.getitemstring(1,1))
	case "Date"
		if isnull(dw_2.getitemdate(1,1)) or string(dw_2.getitemdate(1,1))="" then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,2,dw_2.getitemdate(1,1))
	case "Datet"
		if isnull(dw_2.getitemdatetime(1,1)) or string(dw_2.getitemdatetime(1,1))="" then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,2,dw_2.getitemdatetime(1,1))
	case "time"
		if isnull(dw_2.getitemtime(1,1)) or string(dw_2.getitemtime(1,1))="" then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,2,dw_2.getitemtime(1,1))
	case else
		if isnull(dw_2.getitemnumber(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_3.deleterow(donde)
			return
		end if
		dw_3.setitem(donde,2,dw_2.getitemnumber(1,1))
end choose
end event

type st_1 from statictext within w_tablas3
integer x = 5
integer y = 344
integer width = 709
integer height = 56
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

type st_4 from statictext within w_tablas3
integer x = 2295
integer y = 160
integer width = 1595
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Puede utilizar el caracter ~'%~' como comodin siempre y cuando el campo a buscar no sea numérico"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_tablas3
integer x = 3250
integer y = 40
integer width = 658
integer height = 76
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

event modified;if trim(this.text)="" then return
if st_3.text="" then return
long donde
choose case mid(tipo_col,1,4)
	case "char"
		donde=dw_3.find("lower("+st_3.text+") like '"+lower(this.text)+"'",1,dw_3.rowcount())
	case "numb"
		if not isnumber(this.text) then
			messagebox("Error","El campo por el que va a buscar es numérico y no acepta caracteres especiales")
			return
		else
			donde=dw_3.find(st_3.text+"="+this.text,1,dw_3.rowcount())
		end if
	case "date"
end choose
if donde=0 then
	messagebox("Atención","No se encontró la cadena de caracteres buscada")
else
	dw_3.scrolltorow(donde)
end if
end event

type st_3 from statictext within w_tablas3
integer x = 2569
integer y = 40
integer width = 663
integer height = 68
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

type st_2 from statictext within w_tablas3
integer x = 2304
integer y = 48
integer width = 270
integer height = 56
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

type dw_2 from datawindow within w_tablas3
integer y = 180
integer width = 2249
integer height = 148
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_ciudad2"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
string tipo1,tipo2
tipo1=dw_1.describe("#1.coltype")
tipo2=this.describe("#1.coltype")
/*	Char (n) 			POSIBLES VALORES
	Date	
	DateTime	
	Decimal (n)
	Int 	
	Long	
	Number	
	Real	
	Time	
	Timestamp	
	ULong*/
tipo2 = left (tipo2,5)
tipo1 = left (tipo1,5)
choose case tipo2
	case "char("
		choose case tipo1
			case "char("
				dw_3.retrieve(dw_1.getitemstring(1,1),dw_2.getitemstring(1,1))
			case "Date"
				dw_3.retrieve(dw_1.getitemdate(1,1),dw_2.getitemstring(1,1))
			case "Datet"
				dw_3.retrieve(dw_1.getitemdatetime(1,1),dw_2.getitemstring(1,1))
			case "time"
				dw_3.retrieve(dw_1.getitemtime(1,1),dw_2.getitemstring(1,1))
			case else
				dw_3.retrieve(dw_1.getitemnumber(1,1),dw_2.getitemstring(1,1))
		end choose
	case "Date"
		choose case tipo1
			case "char("
				dw_3.retrieve(dw_1.getitemstring(1,1),dw_2.getitemdate(1,1))
			case "Date"
				dw_3.retrieve(dw_1.getitemdate(1,1),dw_2.getitemdate(1,1))
			case "Datet"
				dw_3.retrieve(dw_1.getitemdatetime(1,1),dw_2.getitemdate(1,1))
			case "time"
				dw_3.retrieve(dw_1.getitemtime(1,1),dw_2.getitemdate(1,1))
			case else
				dw_3.retrieve(dw_1.getitemnumber(1,1),dw_2.getitemdate(1,1))
		end choose
	case "Datet"
		choose case tipo1
			case "char("
				dw_3.retrieve(dw_1.getitemstring(1,1),dw_2.getitemdatetime(1,1))
			case "Date"
				dw_3.retrieve(dw_1.getitemdate(1,1),dw_2.getitemdatetime(1,1))
			case "Datet"
				dw_3.retrieve(dw_1.getitemdatetime(1,1),dw_2.getitemdatetime(1,1))
			case "time"
				dw_3.retrieve(dw_1.getitemtime(1,1),dw_2.getitemdatetime(1,1))
			case else
				dw_3.retrieve(dw_1.getitemnumber(1,1),dw_2.getitemdatetime(1,1))
		end choose
	case "time"
		choose case tipo1
			case "char("
				dw_3.retrieve(dw_1.getitemstring(1,1),dw_2.getitemtime(1,1))
			case "Date"
				dw_3.retrieve(dw_1.getitemdate(1,1),dw_2.getitemtime(1,1))
			case "Datet"
				dw_3.retrieve(dw_1.getitemdatetime(1,1),dw_2.getitemtime(1,1))
			case "time"
				dw_3.retrieve(dw_1.getitemtime(1,1),dw_2.getitemtime(1,1))
			case else
				dw_3.retrieve(dw_1.getitemnumber(1,1),dw_2.getitemtime(1,1))
		end choose
	case else
		choose case tipo1
			case "char("
				dw_3.retrieve(dw_1.getitemstring(1,1),dw_2.getitemnumber(1,1))
			case "Date"
				dw_3.retrieve(dw_1.getitemdate(1,1),dw_2.getitemnumber(1,1))
			case "Datet"
				dw_3.retrieve(dw_1.getitemdatetime(1,1),dw_2.getitemnumber(1,1))
			case "time"
				dw_3.retrieve(dw_1.getitemtime(1,1),dw_2.getitemnumber(1,1))
			case else
				dw_3.retrieve(dw_1.getitemnumber(1,1),dw_2.getitemnumber(1,1))
		end choose
end choose


end event

type dw_3 from datawindow within w_tablas3
event teclea pbm_dwnkey
integer y = 432
integer width = 3913
integer height = 1216
integer taborder = 20
string title = "none"
string dataobject = "dw_barrios"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event teclea;if getColumnName() = 'cta_pres_recon' then
	st_parm.cod_vigencia = GetItemNumber(GetRow(),'cod_vig_recon')
	if isNull(st_parm.cod_vigencia) then Return -1
	if key = keyBack! then Return -1
	st_parm.filtro = "tipo='0' and movimiento='1'"
	st_parm.dw_obj = this
	st_parm.campo='cta_pres_recon'
	openwithparm(w_buscactapre,st_parm)
end if
if getColumnName() = 'cod_total_arq' then
	st_parm.cod_vigencia = GetItemNumber(GetRow(),'cod_vigencia_arq')
	if isNull(st_parm.cod_vigencia) then Return -1
	if key = keyBack! then Return -1
	st_parm.filtro = "tipo='0' and movimiento='1'"
	st_parm.campo='cod_total_arq'
	st_parm.dw_obj = this
	openwithparm(w_buscactapre,st_parm)
end if
end event

event itemfocuschanged;if dwo.type="column" then 
	tipo_col=this.describe(dwo.name+".coltype")
	st_3.text=dwo.name
else
	tipo_col=""
	st_3.text=""
end if

if getColumnName() = 'cta_pres_recon' then
	st_parm.cod_vigencia = GetItemNumber(GetRow(),'cod_vig_recon')
	if isNull(st_parm.cod_vigencia) then Return -1
	st_parm.filtro = "tipo='0' and movimiento='1'"
	st_parm.campo='cta_pres_recon'
	st_parm.dw_obj = this
	openwithparm(w_buscactapre,st_parm)
end if
if getColumnName() = 'cod_total_arq' then
	st_parm.cod_vigencia = GetItemNumber(GetRow(),'cod_vigencia_arq')
	if isNull(st_parm.cod_vigencia) then Return -1
	st_parm.filtro = "tipo='0' and movimiento='1'"
	st_parm.campo='cod_total_arq'
	st_parm.dw_obj = this
	openwithparm(w_buscactapre,st_parm)
end if
end event

event rowfocuschanged;if getrow()<1 then return
if dataobject="dw_camas" then
	if getitemstring(getrow(),"cufuncional")<>"" and not isnull(getitemstring(getrow(),"cufuncional")) then
		dw_ccosto.setfilter("coduf='"+getitemstring(getrow(),"cufuncional")+"'")
		dw_ccosto.filter()
	end if
end if

end event

event clicked;if dwo.type <> "text" then 
	if dwo.type="column" then
		tipo_col=this.describe(dwo.name+".coltype")
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
this.setsort(cual+" "+orden)
this.sort()
anterior=cual
end event

event itemchanged;if this.dataobject="dw_camas" then
	choose case this.getcolumnname()
		case "cufuncional"
			this.setitem(this.getrow(),"cccosto","")
			this.setitem(this.getrow(),"descripcion","")
			dw_ccosto.setfilter("coduf='"+data+"'")
			dw_ccosto.filter()
		case "descripcion"
			this.setitem(this.getrow(),"cccosto",dw_ccosto.getitemstring(dw_ccosto.getrow(),"codcc"))		
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

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_1 from datawindow within w_tablas3
integer x = 5
integer y = 24
integer width = 2254
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_depart"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
string tipo
tipo=this.describe("#1.coltype")
/*	Char (n) 			POSIBLES VALORES
	Date	
	DateTime	
	Decimal (n)
	Int 	
	Long	
	Number	
	Real	
	Time	
	Timestamp	
	ULong*/
tipo = left (tipo,5)
choose case tipo
	case "char("
		hija.setfilter("#1='"+this.getitemstring(1,1)+"'")
		dw_2.setitem(1,1,"")
	case "Date"
		hija.setfilter("#1='"+string(this.getitemdate(1,1))+"'")
		dw_2.setitem(1,1,"")
	case "Datet"
		hija.setfilter("#1='"+string(this.getitemdatetime(1,1))+"'")
		dw_2.setitem(1,1,"")
	case "time"
		hija.setfilter("#1='"+string(this.getitemtime(1,1))+"'")
		dw_2.setitem(1,1,"")
	case else
		long nulo
		hija.setfilter("#1="+string(this.getitemnumber(1,1)))
		setnull(nulo)
		dw_2.setitem(1,1,nulo)
end choose
dw_3.reset()
hija.filter()
hija.sort()
if dw_3.dataobject='dw_banco_subemp' then
	dw_ccosto.retrieve(data)
end if
end event

