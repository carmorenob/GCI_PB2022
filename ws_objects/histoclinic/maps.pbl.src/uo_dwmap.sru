$PBExportHeader$uo_dwmap.sru
forward
global type uo_dwmap from userobject
end type
type dw_parm from datawindow within uo_dwmap
end type
type st_2 from statictext within uo_dwmap
end type
type dw_r from datawindow within uo_dwmap
end type
type dw_i from datawindow within uo_dwmap
end type
type dw_val from datawindow within uo_dwmap
end type
type tv_1 from treeview within uo_dwmap
end type
type dw_b from datawindow within uo_dwmap
end type
type dw_p from datawindow within uo_dwmap
end type
type st_1 from statictext within uo_dwmap
end type
type p_1 from picture within uo_dwmap
end type
type dw_1 from datawindow within uo_dwmap
end type
type dw_c from datawindow within uo_dwmap
end type
type dw_d from datawindow within uo_dwmap
end type
end forward

global type uo_dwmap from userobject
integer width = 2857
integer height = 1584
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_parm dw_parm
st_2 st_2
dw_r dw_r
dw_i dw_i
dw_val dw_val
tv_1 tv_1
dw_b dw_b
dw_p dw_p
st_1 st_1
p_1 p_1
dw_1 dw_1
dw_c dw_c
dw_d dw_d
end type
global uo_dwmap uo_dwmap

type variables
string cod_mapa, i_nivel, cod_padre, cod_indicador
boolean edit_map
private boolean i_cambio
private string i_tempo, tmp_file, des_nivel, i_tempo_mod
private blob b_pic
private window w_mdi
datawindow dw_o, dw_m
uo_datastore idw_parm

end variables

forward prototypes
public function integer add_obj (string nombre, long posx, long posy)
public function integer guardar ()
public subroutine reset ()
public function integer retrieve (string p_cod_mapa, string p_cod_padre, string nivel)
public function integer check_objs ()
public function integer create_map (string p_cod_mapa, string p_cod_padre, string p_nivel)
public function integer ubica_dws (string codigo, string p_cod_padre, string nivel)
public function integer resize (long p_width, long p_height)
public function integer ir_mapa_padre (string p_cod_mapa)
public function integer crear_arbol ()
public function integer del_obj (string objeto)
public function integer get_values (string cod_ind)
public function long get_color (long valor)
public function integer cambiar_mapa (string archivo)
public function string replace_parm (string sintaxis)
public function integer check_parm ()
public function integer create_parm ()
end prototypes

public function integer add_obj (string nombre, long posx, long posy);long f
dw_1.Modify("CREATE ellipse(band=detail x='"+string(PixelsToUnits(Posx, XPixelsToUnits!))+"' y='"+string(PixelsToUnits(Posy, YPixelsToUnits!))+"' height='64' width='128'  moveable=1 name=obj_"+nombre+" Tag='obj' visible='1' brush.hatch='6' brush.color='8421376' pen.style='0' pen.width='5' pen.color='16777215'  background.mode='2' background.color='0' ")
//dw_1.Modify("CREATE ellipse(band=detail x='"+string(posx)+"' y='"+string(posy)+"' height='80' width='160'  moveable=1 name="+nombre+" visible='1' brush.hatch='6' brush.color='0' pen.style='0' pen.width='5' pen.color='16777215'  background.mode='2' background.color='0' ")
i_cambio = TRUE
f = dw_o.Find("cod_obj='"+nombre+"'",1,dw_o.RowCount())
if f> 0 then
	dw_o.SetItem(f,'con_mapa','1')
end if
Return 0

end function

public function integer guardar ();string stx, msg
stx = dw_1.Describe("DataWindow.Syntax")
dw_m.SetItem(1,'sintaxis',stx)

if dw_m.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

choose case i_nivel
	case 'P' 
		updateblob paises set mapa=:b_pic where cod_pais = :cod_mapa;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
	case 'D' 
		updateblob departamentos set mapa=:b_pic where coddepar = :cod_mapa;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
	case 'C' 
		updateblob ciudades set mapa=:b_pic where codciudad=:cod_mapa and cdepto=:cod_padre;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
	case else
		MessageBox('Atención','Parámetro nivel erroneo '+i_nivel)
		Return -1
end choose
dw_m.ResetUpdate()
i_cambio = FALSE
Return 0

end function

public subroutine reset ();dw_1.DataObject = 'dw_map'
dw_1.Reset()
dw_1.InsertRow(0)
setNull(cod_mapa)
setNull(i_nivel)
i_cambio = FALSE

end subroutine

public function integer retrieve (string p_cod_mapa, string p_cod_padre, string nivel);string dir_tmp, err, extension, stx, ret, tmp_file_mod
blob b_map
setNull(b_map)
cod_mapa = p_cod_mapa
cod_padre = p_cod_padre
i_nivel = nivel
choose case i_nivel
	case 'P' 
		des_nivel = 'Pais'
	case 'D' 
		des_nivel = 'Departamento'
	case 'C' 
		des_nivel = 'Ciudad'
	case 'B' 
		des_nivel = 'Barrio'
end choose

if tv_1.FindItem(RootTreeItem!, 0) = -1 then
	crear_arbol()
end if

if ubica_dws(cod_mapa, cod_padre, i_nivel) = -1 then
	MessageBox('Atención','No se encontró '+des_nivel+ ' con código '+cod_mapa)
	Return -1
end if
stx = dw_m.GetItemString(1,'sintaxis')
choose case i_nivel
	case 'P' 
		selectblob mapa into :b_map from paises where cod_pais = :cod_mapa;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
	case 'D' 
		selectblob mapa into :b_map from departamentos where coddepar = :cod_mapa;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		cod_padre = dw_d.GetItemString(1,'cod_pais')
	case 'C' 
		selectblob mapa into :b_map from ciudades where codciudad=:cod_mapa and cdepto=:cod_padre;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
	case else
		MessageBox('Atención','Parámetro nivel erroneo '+i_nivel)
		Return -1
end choose

dw_1.Create(stx,err) 
IF Len(err) > 0 THEN
	MessageBox('Error creando datawindow',err)
	Return -1
END IF
if not isNull(b_map) and not isNull(dw_m.GetItemString(1,'extension')) then
	integer li_FileNum
	extension = dw_m.GetItemString(1,'extension')
	if not isNull(tmp_file) or tmp_file <> '' then FileDelete(tmp_file)
	tmp_file = i_tempo+"\"+cod_mapa+string(today(),'yyyymmddhhmmss') +"." +extension
	tmp_file_mod = i_tempo_mod+"\"+cod_mapa+string(today(),'yyyymmddhhmmss') +"." +extension
	li_FileNum = FileOpen(tmp_file, StreamMode!, Write!, LockWrite!, Replace!)
	if isNull(li_FileNum) or li_FileNum < 1 then
		MessageBox('Atención','Error creando archivo temporal de imágen')
		Return -1
	end if
	FileWriteEx ( li_FileNum, b_map)
	FileClose(li_FileNum)
	ret = dw_1.Modify("p_1.Filename='"+tmp_file_mod+"'")
	if ret <> '' then 
		MessageBox('','')
		ret = dw_1.Modify("p_1.Filename=''")
	end if
elseif isNull(stx) then
	if edit_map then
		if MessageBox('Atención','No se ha definido mapa para ' + des_nivel + ' con codigo '+cod_mapa+". Desea crearlo?",Question!,yesno!) = 2 then Return -1
		create_map(p_cod_mapa,p_cod_padre,nivel)
		Return 0
	else
		MessageBox('Atención','No se ha definido mapa para ' + des_nivel + ' con codigo '+cod_mapa) 
		Return -1
	end if
end if

dw_1.InsertRow(0)

b_pic = b_map
if isNull(b_map) then
	string archivo
	archivo = dw_1.Describe("p_1.Filename")
	cambiar_mapa(archivo)
end if
check_objs()
if not isNull(cod_indicador) then
	get_values(cod_indicador)
end if
st_2.Text = dw_m.GetItemString(1,'nombre')
Return 0

end function

public function integer check_objs ();long i
string modifica, ret
if not edit_map then
	modifica = "p_1.moveable=0 "
end if
for i = 1 to dw_o.rowCount()
	if dw_1.describe("obj_"+dw_o.GetItemString(i,'cod_obj')+".type") = 'ellipse' then
		dw_o.SetItem(i,'con_mapa','1')
		if edit_map then 
			modifica = modifica + " obj_"+ dw_o.GetItemString(i,'cod_obj')+".moveable=1 "
		else
			modifica = modifica + " obj_"+ dw_o.GetItemString(i,'cod_obj')+".moveable=0 "
		end if
	else
		dw_o.SetItem(i,'con_mapa','0')
	end if
next
ret = dw_1.Modify(modifica)
if len(ret) > 0 then
	MessageBox('Error '+ret,modifica)
end if
Return 0

end function

public function integer create_map (string p_cod_mapa, string p_cod_padre, string p_nivel);Reset()
cod_mapa = p_cod_mapa
cod_padre = p_cod_padre
i_nivel = p_nivel

choose case i_nivel
	case 'P' 
		des_nivel = 'Pais'
	case 'D' 
		des_nivel = 'Departamento'
	case 'C' 
		des_nivel = 'Ciudad'
	case 'B' 
		des_nivel = 'Barrio'
end choose

if ubica_dws(cod_mapa, cod_padre, i_nivel) = -1 then
	MessageBox('Atención','No se encontró '+des_nivel+ ' con código '+cod_mapa)
	Return -1
end if

dw_1.InsertRow(0)
dw_1.Modify("p_1.Filename='xxx'")
Return 0

end function

public function integer ubica_dws (string codigo, string p_cod_padre, string nivel);choose case i_nivel
	case 'P'
		dw_p.SetFilter("cod_obj='"+codigo+"'")
		dw_p.Filter()
		if dw_p.RowCount() = 0 then Return -1
		dw_d.SetFilter("cod_pais='"+codigo+"'")
		dw_d.Filter()
		dw_o = dw_d
		dw_m = dw_p
	case 'D'
		dw_d.SetFilter("cod_obj='"+codigo+"'")
		dw_d.Filter()
		if dw_d.RowCount() = 0 then Return -1
		dw_p.SetFilter("cod_obj='"+dw_d.GetItemString(1,'cod_pais')+"'")
		dw_p.Filter()
		dw_c.SetFilter("cod_depto='"+codigo+"'")
		dw_c.Filter()
		dw_o = dw_c
		dw_m = dw_d
	case 'C'
		dw_c.SetFilter("cod_obj='"+codigo+"' and cod_depto='"+p_cod_padre+"'")
		dw_c.Filter()
		if dw_c.RowCount() = 0 then Return -1
		dw_d.SetFilter("cod_obj='"+dw_c.GetItemString(1,'cod_depto')+"'")
		dw_d.Filter()
		dw_p.SetFilter("cod_obj='"+dw_d.GetItemString(1,'cod_pais')+"'")
		dw_p.Filter()
		dw_b.SetFilter("cod_ciudad='"+codigo+"' and cod_depto='"+p_cod_padre+"'")
		dw_b.Filter()
		dw_o = dw_b
		dw_m = dw_c
	case else
		Return -1
end choose
Return 0

end function

public function integer resize (long p_width, long p_height);this.Height = p_height
this.Width = p_width
dw_1.Height = this.Height - 50
dw_1.Width = this.Width - 50
tv_1.Height = this.Height - 50
dw_r.x =  p_width - dw_r.width - 10
dw_r.y =  100
dw_parm.x =  p_width - dw_r.width - 10
dw_parm.y =  dw_r.Height + 210
Return 0

end function

public function integer ir_mapa_padre (string p_cod_mapa);choose case i_nivel
	case 'P'
		MessageBox('Atención','País no tiene antecesor')
	case 'D'
		Retrieve(p_cod_mapa,'','P')
	case 'C'
		Retrieve(p_cod_mapa,'','D')
end choose		

Return 0

end function

public function integer crear_arbol ();long p, d, c, b, i_p, i_d, i_c
string des
treeviewitem it

for p = 1 to dw_p.RowCount() //Paises
	des = dw_p.GetItemString(p,'nombre')
	if isnull(des) then des = ''
	i_p = tv_1.InsertItemlast(0, des, 1)
	tv_1.getitem(i_p,it)
	it.data = dw_p.GetitemString(p,'cod_obj')
//	dw_p.setitem(p,'handle',pi)
	tv_1.setitem(i_p,it)
	dw_d.SetFilter("cod_pais='"+dw_p.GetItemString(p,'cod_obj')+"'")
	dw_d.Filter()
	
	for d = 1 to dw_d.RowCount() //Departamentos
		des = dw_d.GetItemString(d,'nombre')
		if isnull(des) then des = ''
		i_d = tv_1.InsertItemlast(i_p, des, 2)
		tv_1.getitem(i_d,it)
		it.data = dw_d.GetitemString(d,'cod_obj')
	//	dw_d.setitem(d,'handle',j)
		tv_1.setitem(i_d,it)
		dw_c.SetFilter("cod_depto='"+dw_d.GetItemString(d,'cod_obj')+"'")
		dw_c.Filter()
		
		for c = 1 to dw_c.RowCount()// Ciudades
			des = dw_c.GetItemString(c,'nombre')
			if isnull(des) then des = ''
			i_c = tv_1.InsertItemlast(i_d, des, 3)
			tv_1.getitem(i_c,it)
			it.data = dw_c.GetitemString(c,'cod_obj')
		//	dw_d.setitem(d,'handle',j)
			tv_1.setitem(i_c,it)
		next
	next
next
dw_d.SetFilter("")
dw_d.Filter()
dw_c.SetFilter("")
dw_c.Filter()
Return 0

end function

public function integer del_obj (string objeto);if dw_1.Describe(objeto+".type") = 'ellipse' then
	long fila
	dw_1.Modify("Destroy "+objeto)
	i_cambio = TRUE
	fila = dw_o.Find("cod_obj='"+mid(objeto,5)+"'",1,dw_o.RowCount())
	if fila > 0 then
		dw_o.SetItem(fila,'con_mapa','0')
	end if
end if
Return 0

end function

public function integer get_values (string cod_ind);long fi, f, i
string consulta, sintaxis, err, modifica, obj
if isNull(cod_ind) or cod_ind = '' then Return 0

fi = dw_i.Find("cod_indicador='"+cod_ind+"'",1,dw_i.RowCount())
if fi = 0 then
	MessageBox('Atención','No se encontró el indicador solicitado')
	Return -1
end if
if cod_indicador <> cod_ind then
	cod_indicador = cod_ind
	dw_parm.Reset()
	if idw_parm.Retrieve(cod_ind) > 0 then
		create_parm()
		dw_parm.Visible = TRUE
		Return 0
	end if
end if

idw_parm.setFilter("nivel='"+i_nivel+"'")
idw_parm.Filter()

if check_parm() = -1 then 
	dw_parm.BringtoTop = TRUE
	Return -1
end if
dw_val.Reset()
dw_r.Retrieve(cod_ind)
choose case i_nivel
	case 'P'
		consulta = dw_i.GetItemString(fi,'sql_pais')
	case 'D' 
		consulta = dw_i.GetItemString(fi,'sql_depto')
	case 'C' 
		consulta = dw_i.GetItemString(fi,'sql_ciudad')
end choose
consulta = replace_parm(consulta)
if not isNull(consulta) and len(trim(consulta)) > 0 then
	sintaxis = SQLCA.SyntaxFromSQL(consulta,'',err)
	if Len(err) > 0 THEN
		MessageBox("Error creando syntaxis desde consulta Indicador", err)
		Return -1
	end if
	if dw_val.Create(sintaxis,err) = -1 then
		MessageBox("Error creando datawindow desde consulta Indicador", err)
		Return -1
	end if
	dw_val.setTransObject(SQLCA)
	choose case i_nivel
		case 'P','D'
			dw_val.Retrieve(cod_mapa)
		case 'C' 
			dw_val.Retrieve(cod_padre,cod_mapa)
	end choose
end if
for i = 1 to dw_o.RowCount()
	f = dw_val.Find("#1='"+dw_o.GetItemString(i,'cod_obj')+"'",1,dw_val.RowCount())
	obj = dw_o.GetItemString(i,'cod_obj')
	if f > 0 and dw_1.Describe("obj_"+obj+".type") = 'ellipse' then
		modifica = modifica + " obj_" + obj + '.brush.color="' + string(get_color(dw_val.GetItemNumber(f,2))) +'"'
	elseif dw_1.Describe("obj_"+obj+".type") = 'ellipse' then
		modifica = modifica + " obj_" + obj + '.brush.color="' + string(RGB(210,210,210)) +'"'
	end if
next
string ret
ret = dw_1.Modify(modifica)
if ret <>'' then
	messageBox(ret,modifica)
end if
Return 0

end function

public function long get_color (long valor);long f
//f = dw_r.Find("min <= "+string(valor) + " and max >= "+string(valor),1,dw_r.RowCount())
f = dw_r.Find(string(valor) + ">= min and "+string(valor) +"<= max",1,dw_r.RowCount())
if f > 0 then
	Return dw_r.GetItemNumber(f,'color')
end if
Return 0

end function

public function integer cambiar_mapa (string archivo);string ls_path,ls_filename, extension, cur_dir
if not isnull(archivo) and len(trim(archivo)) > 0 then
	if FileExists(archivo) then
		ls_path = archivo
	else
		Messagebox('Atención','No existe el archivo '+archivo)
		Return -1		
	end if
else
	cur_dir = GetCurrentDirectory()
	GetFileOpenName("select file to open",ls_path,ls_filename,"JPG","JPEG Files (*.JPG),*.JPG, Bitmap Files (*.BMP),*.BMP, GIF Files (*.GIF),*.GIF, WindosMetaFile Files (*.WMF),*.WMF",cur_dir)
	ChangeDirectory(cur_dir)
	If ls_filename ="" Then return 0	
end if

long flen, bytes_read,li_FileNum,loops,i
SetPointer(HourGlass!)
flen = FileLength(ls_path)
li_FileNum = FileOpen(ls_path, textMode!, Read!, LockRead!)
if li_FileNum = -1 then
	Messagebox('Atención','No puede abrirse archivo '+ls_path)
	Return -1
end if
bytes_read = FileReadex(li_FileNum, b_pic)
FileClose(li_FileNum)
if p_1.setPicture(b_pic) = 1 then
	extension = right(ls_path,3)
	dw_m.SetItem(1,'extension',extension)
end if

string ret
ret = dw_1.Modify("p_1.Filename='"+ls_path+"' p_1.Height="+string(p_1.Height)+" p_1.width="+string(p_1.width))
ret = dw_1.Modify("Datawindow.Detail.height='"+string(p_1.Height + 10)+"'")
i_cambio = TRUE

Return 0

end function

public function string replace_parm (string sintaxis);long p, i
string stx, valor
p = pos(sintaxis,"[cod_pais]")
do while p > 0
	stx = replace(sintaxis,p,10,"'"+dw_p.GetItemString(1,'cod_obj')+"'")
	p = pos(stx,"[cod_pais]")	
loop
p = pos(stx,"[cod_depto]")
do while p > 0
	stx = replace(stx,p,11,"'"+dw_d.GetItemString(1,'cod_obj')+"'")
	p = pos(stx,"[cod_depto]")	
loop
p = pos(stx,"[cod_ciudad]")
do while p > 0
	stx = replace(stx,p,12,"'"+dw_c.GetItemString(1,'cod_obj')+"'")
	p = pos(stx,"[cod_ciudad]")	
loop

for i = 1 to dw_parm.RowCount()
	p = pos(stx,"["+dw_parm.GetItemString(i,'nombre')+"]")
	if dw_parm.GetItemString(i,'tipo') = 'String' then
		valor = "'" + dw_parm.GetItemString(i,'parm_string') + "'"
	elseif dw_parm.GetItemString(i,'tipo') = 'Number' then
		valor = string(dw_parm.GetItemNumber(i,'parm_number'))
	elseif dw_parm.GetItemString(i,'tipo') = 'DateTime' then
		valor = "'" + String(dw_parm.GetItemDateTime(i,'parm_datetime'),'yyyy/mm/dd') + "'"
	elseif dw_parm.GetItemString(i,'tipo') = 'Date' then
		valor = "'" + string(dw_parm.GetItemDate(i,'parm_date'),'yyyy/mm/dd') + "'"
	end if
	do while p > 0
		stx = replace(stx,p,len("["+dw_parm.GetItemString(i,'nombre')+"]"),valor)
		p = pos(stx,"["+dw_parm.GetItemString(i,'nombre')+"]")
	loop
next

Return stx

end function

public function integer check_parm ();long i
for i = 1 to dw_parm.RowCount()
	if dw_parm.GetItemString(i,'tipo') = 'String' then
		if isNull(dw_parm.GetItemString(i,'parm_string')) then
			MessageBox('Atención','No ha suministrado valor para el parámetro '+ dw_parm.GetItemString(i,'nombre'))
			Return -1
		end if
	elseif dw_parm.GetItemString(i,'tipo') = 'Number' then
		if isNull(dw_parm.GetItemNumber(i,'parm_number')) then
			MessageBox('Atención','No ha suministrado valor para el parámetro '+ dw_parm.GetItemString(i,'nombre'))
			Return -1
		end if
	elseif dw_parm.GetItemString(i,'tipo') = 'DateTime' then
		if isNull(dw_parm.GetItemDateTime(i,'parm_datetime')) then
			MessageBox('Atención','No ha suministrado valor para el parámetro '+ dw_parm.GetItemString(i,'nombre'))
			Return -1
		end if
	elseif dw_parm.GetItemString(i,'tipo') = 'Date' then
		if isNull(dw_parm.GetItemDate(i,'parm_date')) then
			MessageBox('Atención','No ha suministrado valor para el parámetro '+ dw_parm.GetItemString(i,'nombre'))
			Return -1
		end if
	end if
next
Return 0

end function

public function integer create_parm ();long i, f
for i = 1 to idw_parm.RowCount()
	f = dw_parm.InsertRow(0)
	dw_parm.SetItem(f,'nombre',idw_parm.GetItemString(i,'nombre'))
	dw_parm.SetItem(f,'tipo',idw_parm.GetItemString(i,'tipo'))
next
Return f

end function

on uo_dwmap.create
this.dw_parm=create dw_parm
this.st_2=create st_2
this.dw_r=create dw_r
this.dw_i=create dw_i
this.dw_val=create dw_val
this.tv_1=create tv_1
this.dw_b=create dw_b
this.dw_p=create dw_p
this.st_1=create st_1
this.p_1=create p_1
this.dw_1=create dw_1
this.dw_c=create dw_c
this.dw_d=create dw_d
this.Control[]={this.dw_parm,&
this.st_2,&
this.dw_r,&
this.dw_i,&
this.dw_val,&
this.tv_1,&
this.dw_b,&
this.dw_p,&
this.st_1,&
this.p_1,&
this.dw_1,&
this.dw_c,&
this.dw_d}
end on

on uo_dwmap.destroy
destroy(this.dw_parm)
destroy(this.st_2)
destroy(this.dw_r)
destroy(this.dw_i)
destroy(this.dw_val)
destroy(this.tv_1)
destroy(this.dw_b)
destroy(this.dw_p)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.dw_c)
destroy(this.dw_d)
end on

event constructor;String ls_keyword,is_values[]
Integer  li_return, posic
ContextKeyword lcx_key

li_return = GetContextService ("Keyword", lcx_key)
ls_keyword = 'temp'
lcx_key.GetContextKeywords(ls_keyword, is_values)
i_tempo = is_values[1]
i_tempo_mod  = i_tempo
posic = pos(i_tempo_mod,'~~')
do while posic > 0
	i_tempo_mod = left(i_tempo_mod,posic) + '~~' +  right(i_tempo_mod,len(i_tempo_mod) - posic)
	posic = pos(i_tempo_mod,'~~', posic + 3)
loop

w_mdi = f_vent_padre(this)
if isValid(w_mdi.parentWindow()) then
	w_mdi = w_mdi.parentWindow()
end if

idw_parm = create uo_datastore
idw_parm.DataObject = 'dw_ind_parm'
idw_parm.SetTransObject(SQLCA)

end event

event destructor;FileDelete(tmp_file)

end event

type dw_parm from datawindow within uo_dwmap
boolean visible = false
integer x = 800
integer y = 640
integer width = 1531
integer height = 456
integer taborder = 10
boolean titlebar = true
string title = "Parámetros"
string dataobject = "dw_get_parm_val"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;get_values(cod_indicador)


end event

type st_2 from statictext within uo_dwmap
integer x = 5
integer y = 4
integer width = 1202
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_r from datawindow within uo_dwmap
boolean visible = false
integer x = 1202
integer y = 132
integer width = 1536
integer height = 412
integer taborder = 30
string title = "none"
string dataobject = "dw_rangos_show"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;setTransObject(SQLCA)
modify("min.edit.displayonly=TRUE max.edit.Displayonly=TRUE descripcion.edit.displayonly=true")
end event

type dw_i from datawindow within uo_dwmap
boolean visible = false
integer x = 2098
integer y = 688
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_indicadores"
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
Retrieve()

end event

type dw_val from datawindow within uo_dwmap
boolean visible = false
integer x = 1623
integer y = 792
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
boolean resizable = true
boolean livescroll = true
end type

type tv_1 from treeview within uo_dwmap
boolean visible = false
integer y = 80
integer width = 896
integer height = 1264
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
string picturename[] = {"Custom042!","PictureButton!","Custom085!"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event doubleclicked;treeviewitem it, it_p
string cod, mapa_ant, padre_ant, nivel_ant
long idx, padre
if handle <= 0 then Return 0
tv_1.getitem(handle,it)
padre = tv_1.FindItem(ParentTreeItem!, handle)
cod = it.data
idx = it.PictureIndex
mapa_ant = cod_mapa
padre_ant = cod_padre
nivel_ant = i_nivel

choose case idx
	case 1
		if Retrieve(cod,'','P') = -1 then
			cod_mapa = mapa_ant
			cod_padre = padre_ant
			i_nivel = nivel_ant
			ubica_dws(mapa_ant, padre_ant, nivel_ant)
		end if
	case 2
		if Retrieve(cod,'','D') = -1 then
			cod_mapa = mapa_ant
			cod_padre = padre_ant
			i_nivel = nivel_ant
			ubica_dws(mapa_ant, padre_ant, nivel_ant)
		end if
	case 3
		tv_1.getitem(padre,it)
		if Retrieve(cod,it.data,'C') = -1 then
			cod_mapa = mapa_ant
			cod_padre = padre_ant
			i_nivel = nivel_ant
			ubica_dws(mapa_ant, padre_ant, nivel_ant)
		end if
end choose
tv_1.Visible = FALSE

end event

type dw_b from datawindow within uo_dwmap
boolean visible = false
integer x = 2158
integer y = 1408
integer width = 576
integer height = 184
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_map_barrios"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
Retrieve()

end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1

end event

type dw_p from datawindow within uo_dwmap
boolean visible = false
integer x = 50
integer y = 1404
integer width = 686
integer height = 188
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_map_paises"
boolean minbox = true
boolean hscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
Retrieve()

end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1

end event

type st_1 from statictext within uo_dwmap
boolean visible = false
integer x = 1938
integer y = 1516
integer width = 562
integer height = 56
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
boolean enabled = false
boolean focusrectangle = false
end type

type p_1 from picture within uo_dwmap
boolean visible = false
integer x = 2295
integer y = 1384
integer width = 229
integer height = 212
boolean enabled = false
boolean originalsize = true
boolean focusrectangle = false
end type

type dw_1 from datawindow within uo_dwmap
event mousemove pbm_dwnmousemove
event clickup pbm_dwnlbuttonup
event lbuttonclick pbm_dwnlbuttonclk
event resize_map ( )
integer y = 76
integer width = 2816
integer height = 1472
integer taborder = 10
string title = "none"
string dataobject = "dw_map"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;string nombre
long f, x_e, y_e
if dwo.type = 'ellipse' then
	nombre = mid(dwo.name,5)
	x_e = round(PointerX()/50,0)*50
	y_e = round(PointerY()/50,0)*50 - 50
	f = dw_o.Find("cod_obj='"+nombre+"'",1,dw_o.RowCount())
	if f > 0 then
		st_1.x = x_e
		st_1.y = y_e
		st_1.Text = dw_o.GetItemString(f,'nombre')
		f = dw_val.Find("#1='"+nombre+"'",1,dw_val.RowCount())
		if f > 0 then
			st_1.Text = st_1.Text +' '+ string(round(dw_val.GetItemNumber(f,2),1))
		end if
		st_1.width = len(st_1.Text) * 30
		st_1.Visible = TRUE
	end if
else
	st_1.Visible = FALSE
end if

end event

event clickup;PostEvent('resize_map')

end event

event resize_map();long h_pic, h_band

h_pic = long(Describe("p_1.y")) + long(Describe("p_1.height")) + 20
h_band = long(Describe("Datawindow.Detail.Height"))
if h_pic <> h_band then
	SetRedraw(FALSE)
	Modify("Datawindow.Detail.Height="+string(h_pic))
	SetRedraw(TRUE)
end if

end event

event constructor;setTransObject(SQLCA)
InsertRow(0)

end event

event rbuttondown;long fila, x_p, y_p, ret
string obj

m_map_obj m_c
m_c = CREATE m_map_obj
message.Stringparm = ''
if tv_1.Visible then
	m_c.m_vernavegador.Text = 'Ocultar Navegador'
else
	m_c.m_vernavegador.Text = 'Ver Navegador'
end if
if dw_r.Visible then
	m_c.m_verrangos.Text = 'Ocultar Convenciones Indicador'
else
	m_c.m_verrangos.Text = 'Ver Convenciones Indicador'
end if
if dw_parm.Visible then
	m_c.m_verparm.Text = 'Ocultar Parámetros'
else
	m_c.m_verparm.Text = 'Ver Parámetros'
end if
if dwo.name = 'p_1' and edit_map then
	m_c.m_cambiarmapa.Visible = TRUE
else
	m_c.m_cambiarmapa.Visible = FALSE
end if
if isNull(cod_indicador) or cod_indicador = '' then
	m_c.m_verrangos.Visible = FALSE
end if
if (dwo.name = 'p_1' or dwo.type = 'ellipse') and edit_map then
	m_c.m_insertarcampo.Visible = TRUE
	m_c.m_borrarcampo.Visible = TRUE
else
	m_c.m_insertarcampo.Visible = FALSE
	m_c.m_borrarcampo.Visible = FALSE
end if

m_c.PopMenu(w_mdi.PointerX(), w_mdi.PointerY() )
if message.stringparm='' then return

choose case message.stringparm
	case 'insertar'
		openwithparm(w_lista_objs,dw_o)
		obj = Message.StringParm
		if obj = '' then
			return
		end if
		x_p = long(dw_1.Object.DataWindow.HorizontalScrollPosition)
		y_p = long(dw_1.Object.DataWindow.VerticalScrollPosition)
		add_obj(obj, xpos + UnitstoPixels(x_p,XUnitsToPixels! ), ypos + UnitstoPixels(y_p,YUnitsToPixels! ))
		i_cambio = FALSE
	case 'consultar'
		
	case 'borrar'
		del_obj(dwo.name)
	case 'cambiar_mapa'
		cambiar_mapa('')
	case 'ir_mapa_padre'
		if i_cambio then
			ret = MessageBox('Atención','Ha hecho cambios. Desea guardarlos',Question!,yesnocancel!)
			if ret = 1 then
				if guardar() = -1 then Return -1
				commit;
			elseif ret = 2 then
				i_cambio = FALSE
			elseif ret = 3 then
				Return 0
			end if
		end if
		ir_mapa_padre(cod_padre)
	case 'ver_navegador'
		if tv_1.Visible then
			tv_1.Visible = FALSE
		else
			tv_1.Visible = TRUE			
		end if
	case 'ver_rangos'
		if dw_r.Visible then
			dw_r.Visible = FALSE
		else
			dw_r.Visible = TRUE			
		end if
	case 'ver_parametros'
		if dw_parm.Visible then
			dw_parm.Visible = FALSE
		else
			dw_parm.Visible = TRUE			
		end if
	case else
		Return 0
end choose

end event

event doubleclicked;if dwo.type = 'ellipse' then
	long f, ret
	string l_mapa, l_cod, mapa_ant, padre_ant, nivel_ant
	l_cod = mid(dwo.name,5)
	f = dw_o.Find("cod_obj='"+l_cod+"'",1,dw_o.RowCount())
	if f > 0 then
		if i_cambio then
			ret = MessageBox('Atención','Ha hecho cambios. Desea guardarlos',Question!,yesnocancel!)
			if ret = 1 then
				if guardar() = -1 then Return -1
				commit;
			elseif ret = 3 then
				Return 0
			end if
		end if
		mapa_ant = cod_mapa
		padre_ant = cod_padre
		nivel_ant = i_nivel
		choose case i_nivel
			case 'P'
				if parent.Retrieve(l_cod,cod_mapa,'D') = -1 then
					cod_mapa = mapa_ant
					cod_padre = padre_ant
					i_nivel = nivel_ant
					ubica_dws(mapa_ant, padre_ant, nivel_ant)
				end if
			case 'D'
				if parent.Retrieve(l_cod,cod_mapa,'C') = -1 then
					cod_mapa = mapa_ant
					cod_padre = padre_ant
					i_nivel = nivel_ant
					ubica_dws(mapa_ant, padre_ant, nivel_ant)
				end if
		end choose
	end if
end if

end event

type dw_c from datawindow within uo_dwmap
boolean visible = false
integer x = 1440
integer y = 1408
integer width = 654
integer height = 184
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_map_ciudades"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
Retrieve()

end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1

end event

type dw_d from datawindow within uo_dwmap
boolean visible = false
integer x = 768
integer y = 1408
integer width = 626
integer height = 184
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_map_deptos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
Retrieve()

end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1

end event

