$PBExportHeader$w_genericos.srw
forward
global type w_genericos from window
end type
type sle_des from singlelineedit within w_genericos
end type
type pb_3 from pb_report within w_genericos
end type
type dw_gc from datawindow within w_genericos
end type
type pb_grabardef from picturebutton within w_genericos
end type
type pb_insert from picturebutton within w_genericos
end type
type pb_anular from picturebutton within w_genericos
end type
type pb_cancelar from picturebutton within w_genericos
end type
type dw_articulos from datawindow within w_genericos
end type
end forward

global type w_genericos from window
integer width = 4507
integer height = 1952
boolean titlebar = true
string title = "Génericos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_generico.ico"
sle_des sle_des
pb_3 pb_3
dw_gc dw_gc
pb_grabardef pb_grabardef
pb_insert pb_insert
pb_anular pb_anular
pb_cancelar pb_cancelar
dw_articulos dw_articulos
end type
global w_genericos w_genericos

type variables
long xant, yant
string ordenar[6]
DatawindowChild dwc_clase, dwc_g

end variables

forward prototypes
public subroutine b_cmedica (string busca, datawindow dw_tmp)
end prototypes

public subroutine b_cmedica (string busca, datawindow dw_tmp);if isNull(busca) then Return
if not isvalid(w_cmedica) then 
	openwithParm(w_cmedica,dw_tmp)
	dw_tmp.setfocus()
end if
if w_cmedica.windowstate=minimized! then
	w_cmedica.windowstate=normal!
	if isvalid(dw_tmp) then dw_tmp.setfocus()
end if
if trim(lower(busca))="" or isnull(busca) then
	w_cmedica.dw_cmedica.setfilter("")
else
	w_cmedica.dw_cmedica.setfilter("(lower(c_medica) like '"+lower(trim(busca))+"%')")
end if
w_cmedica.dw_cmedica.filter()
w_cmedica.dw_cmedica.sort()

end subroutine

on w_genericos.create
this.sle_des=create sle_des
this.pb_3=create pb_3
this.dw_gc=create dw_gc
this.pb_grabardef=create pb_grabardef
this.pb_insert=create pb_insert
this.pb_anular=create pb_anular
this.pb_cancelar=create pb_cancelar
this.dw_articulos=create dw_articulos
this.Control[]={this.sle_des,&
this.pb_3,&
this.dw_gc,&
this.pb_grabardef,&
this.pb_insert,&
this.pb_anular,&
this.pb_cancelar,&
this.dw_articulos}
end on

on w_genericos.destroy
destroy(this.sle_des)
destroy(this.pb_3)
destroy(this.dw_gc)
destroy(this.pb_grabardef)
destroy(this.pb_insert)
destroy(this.pb_anular)
destroy(this.pb_cancelar)
destroy(this.dw_articulos)
end on

event open;dw_gc.GetChild('codclase',dwc_clase)
dwc_clase.SetTransObject(SQLCA)
dwc_clase.Retrieve()
dwc_clase.Insertrow(1)
dwc_clase.SetItem(1,'descripcion','Todos')
dwc_clase.SetItem(1,'codclase','%')

dw_gc.GetChild('codgrupo',dwc_g)
dwc_g.SetTransObject(SQLCA)
dwc_g.Retrieve()
dwc_g.Insertrow(1)
dwc_g.SetItem(1,'descripcion','Todos')
dwc_g.SetItem(1,'codgrupo','%')

dw_gc.SetItem(1,'codgrupo','%')
dw_gc.SetItem(1,'codclase','%')
dw_articulos.SetTransObject(SQLCA)
dw_articulos.Retrieve()

end event

event close;rollback;

end event

event closequery;if dw_articulos.ModifiedCount() > 0 then
	int ret
	ret = MessageBox('Aviso','Ha realizado cambio. Desea Guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_grabardef.Event Clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

event resize;dw_articulos.resize(newwidth -100 , newheight -400)
pb_cancelar.y=newheight -140
pb_anular.y=newheight -140
pb_insert.y=newheight -140
pb_grabardef.y=newheight -140
pb_3.y=newheight -140
end event

type sle_des from singlelineedit within w_genericos
boolean visible = false
integer x = 3131
integer y = 48
integer width = 1207
integer height = 72
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

type pb_3 from pb_report within w_genericos
integer x = 2386
integer y = 1692
integer taborder = 110
string text = "        &b"
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir Lista de Genericos [Alt+B]"
string cod_rep = "GEN"
string nombre_rep = "Lista Genericos"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_articulos.rowcount()<1 then return
any par[2]
par[1]=dw_gc.GetItemString(1,'codgrupo')
par[2]=dw_gc.GetItemString(1,'codclase')
imprimir(par,'','0')



end event

type dw_gc from datawindow within w_genericos
integer x = 37
integer y = 28
integer width = 3049
integer height = 140
integer taborder = 30
string title = "none"
string dataobject = "dw_grupo_clase"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
InsertRow(1)

end event

event itemchanged;
AcceptText()
if getColumnName() = 'codgrupo' then
	dwc_clase.SetFilter("codgrupo='"+ GetItemString(1,'codgrupo') +"'")
	dwc_clase.Filter()
	SetItem(1,'codclase','%')
end if
if not(isNull(dw_gc.GetItemString(1,'codgrupo')) or isNull(dw_gc.GetItemString(1,'codclase'))) then
	dw_articulos.SetFilter("(codgrupo like '"+dw_gc.GetItemString(1,'codgrupo')+"') and (codclase like '"+dw_gc.GetItemString(1,'codclase')+"')")
	dw_articulos.Filter()
end if

end event

event rowfocuschanged;//triggerEvent(itemchanged!)

end event

type pb_grabardef from picturebutton within w_genericos
event mousemove pbm_mousemove
string tag = "Grabar"
integer x = 2240
integer y = 1692
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2"
alignment htextalign = left!
string powertiptext = "Grabar"
end type

event clicked;string cg, cc,l_pos,l_cod
long fila

if dw_articulos.AcceptText() = -1 then
	messageBox('Aviso','No todos los datos cumplen sus restricciones')
	Return -1
end if
cg = dw_gc.GetItemString(1,'codgrupo')
cc = dw_gc.GetItemString(1,'codclase')
fila = dw_articulos.GetRow()

dw_gc.SetItem(1,'codgrupo','%')
dw_gc.SetItem(1,'codclase','%')
dw_articulos.setredraw(false)
dw_articulos.SetFilter("")
dw_articulos.Filter()

long i
for i = 1 to dw_articulos.RowCount()
	if dw_articulos.getitemstatus(i,0,primary!)=notModified! then continue
	if isNull(dw_articulos.GetItemString(i,'descripcion')) or trim(dw_articulos.GetItemString(i,'descripcion')) = '' then
		dw_articulos.ScrolltoRow(i)
		MessageBox('Atención','Debe asignar una descripción válida')
		Return -1
	end if
	if dw_articulos.GetItemString(i,'medicamento')='1' then
		l_pos=dw_articulos.GetItemString(i,'pos')
		l_cod=dw_articulos.GetItemString(i,'c_medica')
		update medicamentos set pos=:l_pos where (((c_medica)=:l_cod));
	end if
next
if dw_articulos.Update() = -1 then
	Rollback;
	dw_articulos.Retrieve()
	//Return -1
else
	commit;
end if
dw_gc.SetItem(1,'codgrupo',cg)
dw_gc.SetItem(1,'codclase',cc)
dw_gc.Setcolumn('codclase')
dw_gc.TriggerEvent('itemchanged')
dw_articulos.ScrolltoRow(fila)
pb_insert.enabled=true
dw_articulos.setredraw(true)
Return 0

end event

type pb_insert from picturebutton within w_genericos
event mousemove pbm_mousemove
string tag = "Insertar"
integer x = 2094
integer y = 1692
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar"
end type

event clicked;string filtro,l_ret
long fila, ret
if dw_gc.GetItemString(1,'codgrupo') = '%' or dw_gc.GetItemString(1,'codclase') = '%' then
	Messagebox('Aviso','Debe seleccionar un grupo y una clase')
	Return
end if
dw_articulos.SetRedraw(FALSE)
filtro = dw_articulos.Describe("datawindow.table.Filter")
dw_articulos.SetFilter("(codgrupo like '"+dw_gc.GetItemString(1,'codgrupo')+"') and (codclase like '"+dw_gc.GetItemString(1,'codclase')+"')")
dw_articulos.Filter()
//ret = dw_articulos.Describe("Evaluate('max(mid( codgenerico ,pos( codgenerico ,codclase )+len( codclase ),len( codgenerico ))) ', 0)")
ret=dw_articulos.getitemnumber(1,'maximo')
if isnull(ret) then
	l_ret = '001'
else
	l_ret = string(ret+1,'000')
end if

if filtro <> '?' then 
	dw_articulos.SetFilter(filtro)
	dw_articulos.Filter()
end if

dw_articulos.SetRedraw(TRUE)

fila = dw_articulos.InsertRow(0)
dw_articulos.scrollToRow(fila)
dw_articulos.SetItem(fila,'codgrupo',dw_gc.GetItemString(1,'codgrupo'))
dw_articulos.SetItem(fila,'codclase',dw_gc.GetItemString(1,'codclase'))
dw_articulos.SetItem(fila,'codgenerico',dw_gc.GetItemString(1,'codclase')+l_ret)
pb_insert.enabled=false
end event

type pb_anular from picturebutton within w_genericos
event mousemove pbm_mousemove
string tag = "Borrar"
integer x = 1947
integer y = 1692
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar"
end type

event clicked;dw_articulos.DeleteRow(dw_articulos.GetRow())
pb_insert.enabled=true
end event

type pb_cancelar from picturebutton within w_genericos
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1801
integer y = 1692
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type dw_articulos from datawindow within w_genericos
event teclea pbm_dwnkey
integer x = 37
integer y = 184
integer width = 4274
integer height = 1468
integer taborder = 30
string dataobject = "dw_genericocfg"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event teclea;if this.getcolumnname() = 'codgrupo' then
	if key = keyEscape! or key = keyBack! then
		SetItem(GetRow(),'codgrupo','')
		TriggerEvent(itemchanged!)
	end if
elseif this.getcolumnname() = 'codclase' then
	if key = keyEscape! or key = keyBack! then
		SetItem(GetRow(),'codclase','')
	end if
	TriggerEvent(itemchanged!)
elseif this.getcolumnname() = 'c_medica' then
	string este="!"
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
			if isValid(w_cmedica) then close(w_cmedica)
		case keyback!
			este=this.gettext()
			if len(este) > 1 then
				este=left(este, len(este) - 1)
			else
				setNull(este)
			end if
			b_cmedica(este,this)
			return
	end choose
	if este<>"!" then
		if not isnull(this.gettext()) then este=this.gettext()+este
		b_cmedica(este,this)
	end if
end if
if getcolumnname()="pmc_gunspsc" then 
	f_busca_unspsc(key,this)
end if
end event

event doubleclicked;if rowcount()=0 then return
if string(dwo.Name) = 'c_medica' and this.GetITemString(this.GetRow(),'medicamento') = '1' then
	b_cmedica("",this)
end if
if string(dwo.Name) = 'pmc_gunspsc' and this.GetITemString(this.GetRow(),'medicamento') = '1' then
	st_diag st_d
	open(w_busca_unspscn)
	st_d=message.powerobjectparm
	if not isValid(st_d) then return
	if not isNull(st_d.codrip) then
		setitem(row, 'pmc_gunspsc',st_d.codrip)
		setitem(row, 'unspsc',st_d.codgeral)
		sle_des.text=st_d.descripcion
		sle_des.visible=true
	end if
end if


end event

event itemchanged;int medica
string cmedica, c_ant
if data = '' then Return
if GetColumnName() = 'c_medica' then
	c_ant = GetItemString(row,'c_medica')
	if isNull(data) then
		cmedica = GetItemString(row,'c_medica')
	else
		cmedica = data
	end if
	select count(*) into :medica from medicamentos
	where c_medica = :cmedica;
	
	if medica = 0 then
		SetItem(row,'c_medica',c_ant)
		SetText(c_ant)
		MessageBox('Aviso','El código del medicamento no existe')
		Return 2
	end if
elseif GetColumnName() = 'codgrupo' then
	SetItem(GetRow(),'codclase','')
elseif GetColumnName() = 'codclase' then
	string ret
	ret = Describe("Evaluate(' max(long(if(codclase=~~'" + data + "~~',mid(codgenerico,4),~~'0~~'))) ', 0)")
	ret = string(long(ret)+1,'000')
	SetItem(getRow(),'codgenerico',data+ret)
	AcceptText()
	dwc_clase.SetFilter("")
	dwc_clase.Filter()
end if
if GetColumnName() = 'pmc_gunspsc' then
	c_ant = GetItemString(row,'pmc_gunspsc')
	if isNull(data) then
		cmedica = GetItemString(row,'pmc_gunspsc')
	else
		cmedica = data
	end if
	select count(*) into :medica 
	from pm_ver_unspsc inner join pm_cod_unspsc on pm_ver_unspsc.cod_ver = pm_cod_unspsc.cod_ver
	where (((pm_ver_unspsc.val_hasta)>=getdate())and cod_unspsc= :cmedica);
	if medica = 0 then
		SetItem(row,'pmc_gunspsc',c_ant)
		SetText(c_ant)
		MessageBox('Aviso','El código del UNSPSC no existe')
		Return 2
	end if
end if
SetItem(GetRow(),'usuario',usuario)
setItem(GetRow(),'fecha_audita',datetime(today(),now()))
end event

event clicked;if dwo.type="text" then
choose case dwo.name
	case "codgenerico_t"
		if ordenar[1]="#1 A" then
			ordenar[1]="#1 D"
		else
			ordenar[1]="#1 A"
		end if
		this.setsort(ordenar[1])
	case "descripcion_t"
		if ordenar[2]="#2 A" then
			ordenar[2]="#2 D"
		else
			ordenar[2]="#2 A"
		end if
		this.setsort(ordenar[2])
	case "medicamento_t"
		if ordenar[3]="#3 A" then
			ordenar[3]="#3 D"
		else
			ordenar[3]="#3 A"
		end if
		this.setsort(ordenar[3])
	case "c_medica_t"
		if ordenar[4]="#4 A" then
			ordenar[4]="#4 D"
		else
			ordenar[4]="#4 A"
		end if
		this.setsort(ordenar[4])
	case "codgrupo_t"
		if ordenar[5]="#5 A" then
			ordenar[5]="#5 D"
		else
			ordenar[5]="#5 A"
		end if
		this.setsort(ordenar[5])
	case "codclase_t"
		if ordenar[6]="#6 A" then
			ordenar[6]="#6 D"
		else
			ordenar[6]="#6 A"
		end if
		this.setsort(ordenar[6])
end choose
this.sort()
end if

end event

event itemfocuschanged;sle_des.visible=false
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
st_dw.dw_cab = dw_gc
openwithparm(w_funcion_dw,st_dw)

end event

event buttonclicked;if row <> GetRow() then setRow(row)
openwithparm(w_insumos,dw_articulos)

end event

