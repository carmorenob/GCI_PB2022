$PBExportHeader$w_funcion_dw.srw
forward
global type w_funcion_dw from window
end type
type dw_1 from datawindow within w_funcion_dw
end type
type sle_copy from singlelineedit within w_funcion_dw
end type
end forward

global type w_funcion_dw from window
integer width = 882
integer height = 836
boolean border = false
windowtype windowtype = popup!
long backcolor = 67108864
dw_1 dw_1
sle_copy sle_copy
end type
global w_funcion_dw w_funcion_dw

type variables
st_dw_xa_funciones i_st
int i_fila,xant,yant
string nombre,colum
boolean salir=true
end variables

on w_funcion_dw.create
this.dw_1=create dw_1
this.sle_copy=create sle_copy
this.Control[]={this.dw_1,&
this.sle_copy}
end on

on w_funcion_dw.destroy
destroy(this.dw_1)
destroy(this.sle_copy)
end on

event open;i_st=message.powerobjectparm
if isnull(i_st.dwo) then 
	close(this)
	return
end if
if i_st.dwo.type<>"column" and i_st.dwo.type<>"compute" and i_st.dwo.type<>"datawindow" then 
	close(this)
	return
end if
if i_st.dwo.type<>"datawindow" then 
	if i_st.row<>i_st.dw.getrow() then i_st.dw.scrolltorow(i_st.row)
	if i_st.dw.getcolumnname()<>i_st.dwo.name then i_st.dw.setcolumn(string(i_st.dwo.name))
end if
if i_st.color_fondo='' or isnull(i_st.color_fondo) then i_st.color_fondo=dw_1.describe('campo.background.color')
long xa,ya
xa=pointerx()
ya=pointery()
if xa+width > ancho +40 then xa=xa - width
if ya+height > alto +40 then ya=ya - height
move(xa,ya)
dw_1.event inicia()

end event

event deactivate;if salir then close(this)
end event

type dw_1 from datawindow within w_funcion_dw
event keyup pbm_dwnkey
event mousemove pbm_dwnmousemove
event clickup pbm_dwnlbuttonup
event inicia ( )
integer x = 5
integer y = 4
integer width = 878
integer height = 832
integer taborder = 10
string title = "none"
string dataobject = "dw_funciones_dw"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event keyup;if keydown(keyescape!) then 
	close(parent)
	return
end if
if keydown(keyenter!) and getcolumnname()<>'campo' then 
	triggerevent(clicked!)
	return
end if
setitem(2,"otro",'0')
end event

event mousemove;if row=0 then return
if getcolumnname()="campo" then return
if xant=xpos and yant=ypos then return
xant=xpos
yant=ypos
if getrow()=row then return
modify("p_"+string(getrow())+".border=0")
scrolltorow(row)
if getitemstring(row,"otro")='1' then modify("p_"+string(row)+".border=6")
end event

event clickup;if not isvalid(this) then return
if isnull(row) then row=getrow()
if row<1 then return
if getitemstring(row,"otro")='0' then return
if i_st.dwo.type="datawindow" then
	f_quitafiltro(i_st.dw,i_st.color_fondo)
	i_st.dw.triggerevent(rowfocuschanged!)
//	if isValid(i_st.dw_cab) then i_st.dw_cab.triggerEvent(rowfocuschanged!)
	close(w_funcion_dw)
	return
end if
if not isvalid(i_st.dwo) or isnull(i_st.dwo) then return
string tipo
tipo=left(i_st.dw.describe(nombre+".coltype"),4)
choose case row
	case 1 //buscar
		scrolltorow(row)
		setcolumn("campo")
	case 2 //buscar otravez
		long donde
		if not isvalid(i_st.dw) then return
		string busca
		busca=getitemstring(1,"campo")
		choose case tipo
			case "char"
				donde=i_st.dw.find("lower("+nombre+") like '%"+lower(busca)+"%'",i_st.dw.getrow()+1,i_st.dw.rowcount())
			case "numb","long","deci",'real'
				if not isnumber(getitemstring(4,"campo")) then
					messagebox("Error","El campo por el que va a buscar es numérico y no acepta caracteres especiales")
					return
				else
					donde=i_st.dw.find(nombre+"="+busca,i_st.dw.getrow()+1,i_st.dw.rowcount())
				end if
			case "date"
		end choose
		if donde=0 then
			salir=false
			messagebox("Atención","No se encontró la cadena de caracteres buscada")
			salir=true
		else
			i_st.dw.setcolumn(colum)
			i_st.dw.scrolltorow(donde)
			close(parent)
		end if
	case 3// filtrar por seleccion
		if dwo.name='y_o' then 
			modify("p_"+string(row)+".border=6")
			return
		end if
		string pafiltro,filtro
		choose case tipo
			case "numb","long",'real'
				if isnull(i_st.dw.getitemnumber(i_fila,nombre)) then
					pafiltro="isnull("+nombre+")"
				else
					if i_st.dw.getcolumnname()<>i_st.dwo.name or i_st.dw.selectedtext()='' or not isnumber(i_st.dw.selectedtext()) then
						pafiltro=nombre+" = "+string(i_st.dw.getitemnumber(i_fila,nombre))
					else
						pafiltro=nombre+" = "+i_st.dw.selectedtext()
					end if
				end if
			case "char"
				if isnull(i_st.dw.getitemstring(i_fila,nombre)) then
					pafiltro="isnull("+nombre+")"
				else
					if i_st.dw.getcolumnname()<>i_st.dwo.name or len(i_st.dw.getitemstring(i_fila,nombre))<len(i_st.dw.selectedtext()) then
						pafiltro="( "+nombre+" like '"+ i_st.dw.getitemstring(i_fila,nombre)+"')"
					else
						pafiltro="( "+nombre+" like '%"+i_st.dw.selectedtext()+"%')"
					end if
				end if
			case "deci"
				if isnull(i_st.dw.getitemdecimal(i_fila,nombre)) then
					pafiltro="isnull("+nombre+")"
				else
					if i_st.dw.getcolumnname()<>i_st.dwo.name then
						pafiltro=nombre+" = dec("+f_remplaza(string(i_st.dw.getitemdecimal(i_fila,nombre),'0.00'),',','.')+')'
					else
						pafiltro=nombre+" = dec("+f_remplaza(string(dec(i_st.dw.selectedtext()),'0.00'),',','.')+')'
					end if
				end if
			case "date"   //////////ojo
				if isnull(i_st.dw.getitemdatetime(i_fila,nombre)) then
					pafiltro="isnull("+nombre+")"
				else
					pafiltro="datetime(date("+nombre+")) = datetime(date('"+string(i_st.dw.getitemdatetime(i_fila,nombre),'yyyy/mm/dd')+"'))"
				end if
		end choose
		filtro=i_st.dw.describe("datawindow.table.filter")
		if getitemstring(3,'y_o')='Y' then
			if filtro<>"?" then pafiltro= filtro +" and "+pafiltro
		else
			if filtro<>"?" then pafiltro= filtro +" or "+pafiltro
		end if
		i_st.dw.setfilter(pafiltro)
		if i_st.dw.filter()=1 then 
			i_st.dw.modify("datawindow.color="+string(rgb(240,240,220)))
			i_st.dw.sort()
			i_st.dw.groupcalc()
			i_st.dw.triggerevent(rowfocuschanged!)
		end if
//		i_st.dw.setredraw(true)
		close(w_funcion_dw)
	case 4
		scrolltorow(row)
		setcolumn("campo")
	case 5 //quitar filtros
		f_quitafiltro(i_st.dw,i_st.color_fondo)
		i_st.dw.triggerevent(rowfocuschanged!)
		//if isValid(i_st.dw_cab) then i_st.dw_cab.triggerEvent(rowfocuschanged!)
		close(w_funcion_dw)
	case 6 //asc
		i_st.dw.setsort(nombre+" A")
		i_st.dw.sort()
		i_st.dw.groupcalc()
		i_st.dw.triggerevent(rowfocuschanged!)
		close(w_funcion_dw)
	case 7 //desc
		i_st.dw.setsort(nombre+" D")
		i_st.dw.sort()
		i_st.dw.groupcalc()
		i_st.dw.triggerevent(rowfocuschanged!)
		close(w_funcion_dw)
	case 8 //copiar
		if i_st.dw.getcolumnname()<>i_st.dwo.name then
			choose case tipo
				case "numb","long",'real'
					sle_copy.text=string(i_st.dw.getitemnumber(i_fila,nombre))
				case "char"
					sle_copy.text=i_st.dw.getitemstring(i_fila,nombre)
				case "deci"
					sle_copy.text=string(i_st.dw.getitemdecimal(i_fila,nombre))
				case "date"
					if i_st.dwo.type="datetime" then
						sle_copy.text=string(i_st.dw.getitemdatetime(i_fila,nombre))
					else
						sle_copy.text=string(i_st.dw.getitemdate(i_fila,nombre))
					end if 
			end choose
			sle_copy.selecttext(1,len(sle_copy.text))
			sle_copy.copy()
		else
			i_st.dw.copy()
		end if
		close(w_funcion_dw)		
	case 9 //pegar
		i_st.dw.paste()
		close(w_funcion_dw)
	case 10 //cortar
		i_st.dw.cut()
		close(w_funcion_dw)
end choose
end event

event inicia();long j
for j=1 to 10
	insertrow(1)
next
setitem(1,"funcion","  Buscar:")
setitem(2,"funcion","  Buscar Siguiente")
setitem(2,"raya","1")
setitem(3,"funcion","  Filtrar por Selección")
setitem(4,"funcion","  Filtrar Por:")
setitem(5,"funcion","  Quitar Filtros")
setitem(5,"raya","1")
setitem(6,"funcion","  Orden Ascendente")
setitem(7,"funcion","  Orden Descendente")
setitem(7,"raya","1")
setitem(8,"funcion","  Copiar")
setitem(9,"funcion","  Pegar")
setitem(10,"funcion","  Cortar")
scrolltorow(1)
if i_st.dw.describe("datawindow.table.filter")='?' then setitem(5,"otro",'0')
if i_st.dwo.type="datawindow" then
	for j=1 to 10
		setitem(j,"otro",'0')
	next
	if i_st.dw.describe("datawindow.table.filter")<>'?' then setitem(5,"otro",'1')
	if i_st.solobuscar then 
		setitem(5,"otro",'0')
	end if
else
	string disonly,protect,temp
	colum=f_trae_string_num(i_st.dw.GetObjectAtPointer ( ),1,'	')
	i_fila=long(f_trae_string_num(i_st.dw.GetObjectAtPointer ( ),2,'	'))
	nombre=i_st.dwo.name
	disonly=i_st.dw.describe(nombre+".edit.displayonly")
	temp=i_st.dw.describe(nombre+".protect")
	if trim(temp)='1' then protect='1'
	if trim(temp)='0' then protect='0'
	temp=trim(mid(temp,3,len(temp)-3))
	if temp<>"" then
		temp=f_remplaza(temp,"'",'"')
		protect=i_st.dw.describe("Evaluate ( '"+temp+"',"+string(i_fila)+" )")
	end if
	
	if disonly="yes" or protect='1' or i_st.dwo.type="compute" then setitem(9,"otro","0")
	if disonly="yes" or protect='1' or i_st.dwo.type="compute" then setitem(10,"otro","0")
	
	if g_nombre_abuscar<>nombre or g_abuscar='' then
		setitem(2,"otro",'0')
		setitem(1,"campo",'')
		g_abuscar=''
	else
		setitem(1,"campo",g_abuscar)
	end if
	g_nombre_abuscar=nombre
	if i_st.solobuscar then 
		setitem(3,"otro",'0')
		setitem(4,"otro",'0')
		setitem(5,"otro",'0')
	end if

end if
end event

event itemchanged;string tipo
accepttext()
tipo=left(i_st.dw.describe(nombre+'.coltype'),4)
if trim(gettext())='' then return
if getitemstring(getrow(),'otro')="0" then return
long donde
if getrow()=1 then
	choose case tipo
		case 'char'
			donde=i_st.dw.find('lower('+nombre+') like "%'+lower(gettext())+'%"',1,i_st.dw.rowcount())
		case 'numb','long','deci',"real"
			if not isnumber(gettext()) then
				messagebox('Error','El campo por el que va a buscar es numérico y no acepta caracteres especiales')
				return
			else
				donde=i_st.dw.find(nombre+'='+gettext(),1,i_st.dw.rowcount())
			end if
		case 'date'
	end choose
	g_abuscar=gettext()
	if donde=0 then
		salir=false
		messagebox('Atención','No se encontró la cadena de caracteres buscada')
		salir=true
	else
		i_st.dw.setcolumn(colum)
		i_st.dw.scrolltorow(donde)
		close(parent)
		return
	end if
end if
if getrow()= 4 then
	string pafiltro,filtro
	choose case tipo
		case 'numb','long','deci',"real"
			if not isnumber(gettext()) then
				salir=false
				messagebox('Atención','El campo que escogió es numerico, y el valor que digitó no lo es')
				salir=true
				return
			end if
			pafiltro=nombre+' = '+gettext()
		case 'char'
			pafiltro='( lower('+nombre+') like "%'+lower(gettext())+'%")'
		case 'date'   //////////ojo
			if i_st.dw.describe(nombre+'.coltype')="datetime" then
				pafiltro=nombre+"=datetime(date('"+gettext()+"'))"
			else
				pafiltro=nombre+"=date('"+gettext()+"')"
			end if
//					if g_dwo.type='datetime' then
//						sle_copy.text=string(i_st.dw.getitemdatetime(fila,nombre))
//					else
//						sle_copy.text=string(i_st.dw.getitemdate(fila,nombre))
//					end if 
	end choose
	filtro=i_st.dw.describe('datawindow.table.filter')
	if getitemstring(3,"y_o")="Y" then
		if filtro<>'?' then pafiltro= filtro +' and '+pafiltro
	else
		if filtro<>'?' then pafiltro= filtro +' or '+pafiltro
	end if
	i_st.dw.setfilter(pafiltro)
	if i_st.dw.filter()=1 then 
		i_st.dw.modify('datawindow.color='+string(rgb(240,240,220)))
		i_st.dw.sort()
		i_st.dw.groupcalc()
		i_st.dw.triggerevent(rowfocuschanged!)
	end if
	close(parent)
end if
end event

event clicked;if isnull(row) then row=getrow()
if row<1 then return
if getitemstring(row,"otro")='0' then return
scrolltorow(row)
modify("p_"+string(row)+".border=5")

end event

event rowfocuschanged;if getitemstring(currentrow,"otro")='0' then return
modify("p_"+string(currentrow)+".border=6")
end event

event rowfocuschanging;this.modify("p_"+string(currentrow)+".border=0")
end event

type sle_copy from singlelineedit within w_funcion_dw
boolean visible = false
integer x = 343
integer y = 728
integer width = 402
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

