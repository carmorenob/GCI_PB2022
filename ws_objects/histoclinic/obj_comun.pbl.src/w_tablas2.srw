$PBExportHeader$w_tablas2.srw
forward
global type w_tablas2 from window
end type
type pb_7 from picturebutton within w_tablas2
end type
type pb_6 from picturebutton within w_tablas2
end type
type pb_5 from picturebutton within w_tablas2
end type
type pb_4 from picturebutton within w_tablas2
end type
type pb_3 from picturebutton within w_tablas2
end type
type pb_2 from picturebutton within w_tablas2
end type
type pb_1 from picturebutton within w_tablas2
end type
type st_1 from statictext within w_tablas2
end type
type st_cuantos from statictext within w_tablas2
end type
type sle_1 from singlelineedit within w_tablas2
end type
type st_3 from statictext within w_tablas2
end type
type st_2 from statictext within w_tablas2
end type
type dw_2 from datawindow within w_tablas2
end type
type dw_1 from datawindow within w_tablas2
end type
type cbx_cont from checkbox within w_tablas2
end type
end forward

global type w_tablas2 from window
integer width = 3776
integer height = 1584
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Form!"
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_1 st_1
st_cuantos st_cuantos
sle_1 sle_1
st_3 st_3
st_2 st_2
dw_2 dw_2
dw_1 dw_1
cbx_cont cbx_cont
end type
global w_tablas2 w_tablas2

type variables
string tipo_col,anterior,orden
datawindowchild dw_ccosto,idw_cost_urg,idw_cost_hosp,idw_cost_amb,idw_cost_qx,idw_varios,idw_varios_a,docus
transaction sqlte
end variables

forward prototypes
public subroutine inicializa ()
end prototypes

public subroutine inicializa ();dw_1.settransobject(sqlca)
dw_1.insertrow(1)
dw_2.settransobject(sqlca)
if dw_2.dataobject='dw_tarifa_med' then
	cbx_cont.enabled=true
	cbx_cont.visible=true
end if

if dw_2.dataobject='dw_grup_consul' then
	dw_2.getchild("codalmacen",dw_ccosto)
	dw_ccosto.settransobject(sqlca)
	dw_2.getchild("cconsultorio",idw_cost_urg)
	idw_cost_urg.settransobject(sqlca)	
end if

if dw_2.dataobject="dw_espe_profe" then
	dw_2.getchild("cccosto",dw_ccosto)
	dw_ccosto.settransobject(sqlca)
	dw_2.getchild("cc_urg",idw_cost_urg)
	idw_cost_urg.settransobject(sqlca)
	dw_2.getchild("cc_hosp",idw_cost_hosp)
	idw_cost_hosp.settransobject(sqlca)
	dw_2.getchild("cc_amb",idw_cost_amb)
	idw_cost_amb.settransobject(sqlca)
	dw_2.getchild("cc_qx",idw_cost_qx)
	idw_cost_qx.settransobject(sqlca)
end if
if dw_1.dataobject='dw_combo_grupocitaqx' then
	dw_1.getchild('codgc',idw_varios_a)
	idw_varios_a.settransobject(sqlca)
	dw_2.getchild('cconsultorio',idw_varios)
	idw_varios.settransobject(sqlca)
end if

if dw_2.dataobject='dw_prog_grupo' Then
	dw_2.getchild('cd_capitulo',idw_varios_a)
	idw_varios_a.settransobject(sqlca)
end if

if dw_2.dataobject='dw_doc_cont_todo' and g_motor='any' then
	sqlte=create transaction
	sqlte.dbparm=sqlca.dbparm+',StaticBind=0,DisableBind=1'
	sqlte.dbms='ODBC'
	connect using sqlte;
end if
if dw_2.dataobject='dw_ctas_uti_perd_desc' then dw_2.border=false

if dw_1.dataobject='dw_combo_bancos' then
    dw_2.getchild('ciudades_desciudad',docus)
	docus.settransobject(sqlca)
	docus.insertrow(1)
end if
end subroutine

on w_tablas2.create
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.st_cuantos=create st_cuantos
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cbx_cont=create cbx_cont
this.Control[]={this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.st_cuantos,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.dw_2,&
this.dw_1,&
this.cbx_cont}
end on

on w_tablas2.destroy
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.st_cuantos)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cbx_cont)
end on

event resize;dw_2.resize(newwidth - 50 , newheight -480)
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
st_cuantos.x=newwidth - 800
st_cuantos.y=newheight - 140

end event

type pb_7 from picturebutton within w_tablas2
boolean visible = false
integer x = 2085
integer y = 1284
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

type pb_6 from picturebutton within w_tablas2
string tag = "Importar"
integer x = 1929
integer y = 1284
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
	value=dw_2.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
end event

type pb_5 from picturebutton within w_tablas2
string tag = "Exportar"
integer x = 1769
integer y = 1284
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

event clicked;openwithparm(w_export,dw_2)

end event

type pb_4 from picturebutton within w_tablas2
string tag = "Guardar"
integer x = 1609
integer y = 1284
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

event clicked;if dw_2.dataobject='dw_doc_cont_todo' and g_motor='any' then
	dw_2.settransobject(sqlte)
end if
if dw_2.update(true,false)=-1 then
	if dw_2.dataobject='dw_doc_cont_todo' and g_motor='any' then
		rollback using sqlte;
	end if
	rollback;
	return -1
else
	commit;
	dw_2.resetupdate()
	if dw_2.dataobject='dw_doc_cont_todo' and g_motor='any' then
		commit using sqlte;
		dw_2.settransobject(sqlca)
	end if
	return 1
end if
end event

type pb_3 from picturebutton within w_tablas2
string tag = "Refrescar"
integer x = 1449
integer y = 1284
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

type pb_2 from picturebutton within w_tablas2
string tag = "Borrar"
integer x = 1289
integer y = 1284
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

event clicked;dw_2.deleterow(0)
end event

type pb_1 from picturebutton within w_tablas2
string tag = "Insertar"
integer x = 1129
integer y = 1284
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

event clicked;if parent.title="Tarifas de Medicamentos" then
	st_pa_medica st
	st.dw=dw_2
	st.campo='codmanual'
	st.valor=dw_1.getitemstring(1,1)
	openwithparm(w_busca_med,st)
	return
end if
if dw_2.dataobject='dw_diagedad' then return
if dw_2.dataobject='dw_ctas_uti_perd_desc' and dw_2.rowcount()=1 then return

string tipo
long donde,maxi
donde=dw_2.insertrow(0)
dw_2.scrolltorow(donde)
if dw_2.dataobject='dw_vacuna_config' then
	if isnull(dw_2.getitemnumber(1,'maximo')) then 
		maxi=0
	else
		maxi=dw_2.getitemnumber(1,'maximo')
	end if
	maxi=maxi+1
	dw_2.setitem(donde,'ndosis',maxi)
end if
tipo=dw_1.describe("#1.coltype")
tipo = left (tipo,5)
choose case tipo
	case "char("
		if isnull(dw_1.getitemstring(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_2.deleterow(donde)
			return
		end if
		dw_2.setitem(donde,1,dw_1.getitemstring(1,1))
		if dw_2.dataobject='dw_edad_finalidad' then
			if isnull(dw_2.getitemnumber(1,'maximo')) then 
				maxi=0
			else
				maxi=dw_2.getitemnumber(1,'maximo')
			end if
			maxi=maxi+1
			dw_2.setitem(donde,'item',maxi)
		end if
	case "Date"
		if isnull(dw_1.getitemdate(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_2.deleterow(donde)
			return
		end if
		dw_2.setitem(donde,1,dw_1.getitemdate(1,1))
	case "Datet"
		if isnull(dw_1.getitemdatetime(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_2.deleterow(donde)
			return
		end if
		dw_2.setitem(donde,1,dw_1.getitemdatetime(1,1))
	case "time"
		if isnull(dw_1.getitemtime(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_2.deleterow(donde)
			return
		end if
		dw_2.setitem(donde,1,dw_1.getitemtime(1,1))
	case else
		if isnull(dw_1.getitemnumber(1,1)) then
			messagebox("Atención","Seleccione primero un item de la parte superior")
			dw_2.deleterow(donde)
			return
		end if
		dw_2.setitem(donde,1,dw_1.getitemnumber(1,1))
end choose
end event

type st_1 from statictext within w_tablas2
integer x = 18
integer y = 196
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

type st_cuantos from statictext within w_tablas2
integer x = 3205
integer y = 1352
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

type sle_1 from singlelineedit within w_tablas2
integer x = 2953
integer y = 60
integer width = 667
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
		donde=dw_2.find("lower("+st_3.text+") like '"+lower(this.text)+"'",1,dw_2.rowcount())
	case "numb"
		if not isnumber(this.text) then
			messagebox("Error","El campo por el que va a buscar es numérico y no acepta caracteres especiales")
			return
		else
			donde=dw_2.find(st_3.text+"="+this.text,1,dw_2.rowcount())
		end if
	case "date"
end choose
if donde=0 then
	messagebox("Atención","No se encontró la cadena de caracteres buscada")
else
	dw_2.scrolltorow(donde)
end if
end event

type st_3 from statictext within w_tablas2
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

type st_2 from statictext within w_tablas2
integer x = 2263
integer y = 28
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

type dw_2 from datawindow within w_tablas2
event keyup pbm_dwnkey
event cambia_col ( )
integer x = 14
integer y = 264
integer width = 3721
integer height = 1004
integer taborder = 30
string title = "none"
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

event itemfocuschanged;if dwo.type="column" then 
	tipo_col=describe(dwo.name+".coltype")
	st_3.text=dwo.name
else
	tipo_col=""
	st_3.text=""
end if
end event

event rowfocuschanged;if getrow()<1 then return
if dataobject="dw_espe_profe" then
	if getitemstring(getrow(),"cufuncional")<>"" and not isnull(getitemstring(getrow(),"cufuncional")) then
		dw_ccosto.retrieve(getitemstring(getrow(),"cufuncional"))
	else
		dw_ccosto.reset()
	end if
	if getitemstring(getrow(),"uf_urg")<>"" and not isnull(getitemstring(getrow(),"uf_urg")) then
		idw_cost_urg.retrieve(getitemstring(getrow(),"uf_urg"))
	else
		idw_cost_urg.reset()
	end if
	if getitemstring(getrow(),"uf_hosp")<>"" and not isnull(getitemstring(getrow(),"uf_hosp")) then
		idw_cost_urg.retrieve(getitemstring(getrow(),"uf_hosp"))
	else
		idw_cost_urg.reset()
	end if
	if getitemstring(getrow(),"uf_amb")<>"" and not isnull(getitemstring(getrow(),"uf_amb")) then
		idw_cost_urg.retrieve(getitemstring(getrow(),"uf_amb"))
	else
		idw_cost_urg.reset()
	end if
	if getitemstring(getrow(),"uf_qx")<>"" and not isnull(getitemstring(getrow(),"uf_qx")) then
		idw_cost_urg.retrieve(getitemstring(getrow(),"uf_qx"))
	else
		idw_cost_urg.reset()
	end if
end if
if dw_1.dataobject='dw_combo_bancos' then
	if not isnull(this.getitemstring(this.getrow(),'cdepto')) then
		docus.retrieve(this.getitemstring(this.getrow(),'cdepto'))
	else
		docus.reset()
		docus.insertrow(1)
	end if
end if
st_cuantos.text="Reg. "+ string(getrow()) +" de " +string(rowcount())

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

event itemchanged;accepttext()
long donde
string cual,desdiag,geral,nulo,version
datetime ahora
ahora=datetime(today())

if dataobject="dw_tarifas" then
	setnull(nulo)
	if getcolumnname()='cod_cups' then
		cual=data
		select proced.codproced, pm_cups_version.cod_version,proced.descripcion into :geral, :version,:desdiag 
		from proced inner join pm_cups_version on proced.cod_version = pm_cups_version.cod_version 
		where (((proced.cod_cups)=:cual) AND ((getdate()) Between PM_CUPS_VERSION.VALIDO_INICIO And PM_CUPS_VERSION.VALIDO_HASTA));
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo proced",sqlca.sqlerrtext)
			setitem(getrow(),'cod_cups',nulo)
			settext('')
			return 1
		end if
		if isnull(desdiag) then 
			setitem(getrow(),'cod_cups',nulo)
			settext('')
			return 1
		end if
		setitem(getrow(),'tarifas_codproced',geral)
		setitem(getrow(),'cod_version',version)			
		setitem(getrow(),'serviciosman_descripcion',desdiag)
		accepttext()
	end if
	return
end if
if dataobject='dw_grup_consul' then
	if getcolumnname()='cconsultorio' then
		cual=data
		select lugar.descripcion,lugar.codlugar into :desdiag ,:version
		from consultorio inner join lugar on consultorio.codlugar = lugar.codlugar
		where (((consultorio.codconsultorio)=:cual));
		if sqlca.sqlcode=-1 then
			return 1
		end if
		setitem(row,'descripcion',desdiag)
		dw_ccosto.setfilter("codlugar='"+version+"'")
		dw_ccosto.filter()
		return
	end if
	
end if
		
if dataobject="dw_espe_profe" then
	setnull(nulo)
	choose case getcolumnname()
		case "cufuncional"
			setitem(getrow(),"cccosto",nulo)
			dw_ccosto.retrieve(data)
		case "uf_urg"
			setitem(getrow(),"cc_urg",nulo)
			idw_cost_urg.retrieve(data)
		case 'uf_hosp'
			setitem(getrow(),"cc_hosp",nulo)
			idw_cost_hosp.retrieve(data)
		case 'uf_amb'
			setitem(getrow(),"cc_amb",nulo)
			idw_cost_amb.retrieve(data)
		case 'uf_qx'
			setitem(getrow(),"cc_qx",nulo)
			idw_cost_qx.retrieve(data)
	end choose
	return
end if
if dataobject="dw_diags" then
	if getcolumnname()='ccap' or getcolumnname()='coddiag' then
		setitem(getrow(),"codgeral",getitemstring(getrow(),"ccap")+getitemstring(getrow(),"coddiag")+getitemstring(getrow(),"c_version"))
		setitem(getrow(),'cod_rips',getitemstring(getrow(),"ccap")+getitemstring(getrow(),"coddiag"))
	end if
	return
end if

if dw_2.dataobject='dw_diag_finalidad' then	
	if getcolumnname()='diags_cod_rips' then
		select c_version into :version from diags_version where val_hasta>=:ahora;
		if isnull(version) then 
			messagebox("Atención","No existe una versión de diagnósticos activa")
		end if
		cual=gettext()
		donde=find('diags_cod_rips="'+cual+'"',1,rowcount())
		if donde<>getrow() then
			setitem(getrow(),'cod_rips','')
			settext('')
			return 1
		end if
		setnull(desdiag)
		geral=cual+version
		select desdiag into :desdiag from diags where codgeral=:geral;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo diagnóstico",sqlca.sqlerrtext)
			setitem(getrow(),'cod_rips','')
			settext('')
			return 1
		end if
		if isnull(desdiag) then 
			setitem(getrow(),'cod_rips','')
			settext('')
			return 1
		end if
		setitem(getrow(),'cod_rips',geral)
		setitem(getrow(),"diags_cod_rips",cual)
		setitem(getrow(),'diags_desdiag',desdiag)
		accepttext()
	end if
end if

if dataobject="dw_diagedad" then
	if getcolumnname()='cod_rips' then
		cual=gettext()
		donde=find('cod_rips="'+cual+'"',1,rowcount())
		if donde<>getrow() then
			setitem(getrow(),'cod_rips','')
			settext('')
			return 1
		end if
		setnull(desdiag)
		geral=cual+dw_1.getitemstring(1,1)
		select desdiag into :desdiag from diags where codgeral=:geral;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo diagnóstico",sqlca.sqlerrtext)
			setitem(getrow(),'cod_rips','')
			settext('')
			return 1
		end if
		if isnull(desdiag) then 
			setitem(getrow(),'cod_rips','')
			settext('')
			return 1
		end if
		setitem(getrow(),'codgeral',geral)
		setitem(getrow(),'desdiag',desdiag)
		accepttext()
	end if
end if
if dataobject='dw_ctas_uti_perd_desc' then
	string otro,descrip,codemp
	otro=gettext()
	codemp=dw_1.getitemstring(1,1)
	if trim(otro)='' then return 1
	setnull(descrip)
	select descrip into :descrip from cont_plan where codtotal=:otro and cod_empresa=:codemp and movimiento='1';
	if isnull(descrip) then
		return 1
	else
		if getcolumnname()='cuenta_utilidad' then
			setitem(1,"descrip",descrip)
		else
			setitem(1,"descrip_1",descrip)
		end if
		accepttext()
	end if
end if
if dw_1.dataobject='dw_combo_bancos' then
	setitem(getrow(),'codbanco',dw_1.getitemstring(1,1))
	choose case getcolumnname()
		case 'cdepto' 
			docus.retrieve(getitemstring(getrow(),'cdepto'))
		case 'ciudades_desciudad'
			setitem(getrow(),'codciudad',docus.getitemstring(docus.getrow(),'codciudad'))
	end choose
end if

accepttext()
end event

event buttonclicked;if dataobject="dw_centro_costos" then 
	long fila
	fila=getrow()
	if fila<1 then return
	string nulo
	setnull(nulo)
	setitem(fila,"codtingre",nulo)
end if

if dataobject="dw_diags" then 
	string camino,nomarch,carreta
	long file
	if row<>getrow() then setrow(row)
	nomarch=getitemstring(getrow(),'guia')
	if isnull(nomarch) then nomarch=''
	camino=nomarch
	if GetFileOpenName("Abrir Reporte", camino, nomarch, "PDF","Reportes (*.PDF),*.PDF",nomarch) = 1 then
		setitem(getrow(),'guia',camino)
		file=fileopen(nomarch,textmode!)
		if file=-1 then
			messagebox('Error', 'No se pudo abrir el archivo')
			return
		end if
		filereadex(file,carreta)
   end if
   fileclose(file)
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

event doubleclicked;if parent.title="Tarifas de Medicamentos" then
	choose case this.getcolumnname()
 		case "codarticulo"
			st_pa_medica st
			st.dw=dw_2
			st.valor=dw_2.getitemstring(getrow(),2)
			openwithparm(w_busca_articulo,st)
		return
	end choose
end if

if dw_2.dataobject='dw_diag_finalidad' then	
	if dwo.name="diags_cod_rips" then
		st_edadsexo st_es
		st_diag st_d
		st_es.sexo='0'
		st_es.edad=43800
		st_es.antece='0'
		openwithparm(w_busca_diag,st_es)
		st_d=message.powerobjectparm
		if not isValid(st_d) then return
		if not isNull(st_d.codrip) then
			setitem(getrow(),"cod_rips",st_d.codgeral)
			setitem(getrow(),"diags_cod_rips",st_d.codrip)
			setitem(getrow(),"diags_desdiag",st_d.descripcion)
		end if
	end  if
end if
end event

type dw_1 from datawindow within w_tablas2
integer x = 5
integer y = 36
integer width = 2194
integer height = 152
integer taborder = 20
string title = "none"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
string tipo
tipo=describe("#1.coltype")
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
		if dataobject='dw_combo_finconsulta' then
			datetime ahora
			string version
			ahora=datetime(today())
			SELECT c_version into :version
			FROM diags_version
			WHERE ((val_hasta)>=:ahora);
			dw_2.retrieve(getitemstring(1,1),version)
		else
			dw_2.retrieve(getitemstring(1,1))
		end if
	case "Date"
		dw_2.retrieve(getitemdate(1,1))
	case "Datet"
		dw_2.retrieve(getitemdatetime(1,1))
	case "time"
		dw_2.retrieve(getitemtime(1,1))
	case else
		dw_2.retrieve(getitemnumber(1,1))
end choose
if dataobject='dw_combo_grupocitaqx' then
	idw_varios.retrieve(idw_varios_a.getitemstring(idw_varios_a.getrow(),'tipo'))
end if
if dataobject='dw_combo_vcups' Then
	idw_varios_a.retrieve(getitemstring(1,1))
end if

end event

type cbx_cont from checkbox within w_tablas2
boolean visible = false
integer x = 2254
integer y = 168
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Controlado"
end type

event clicked;if  this.checked=true then
	dw_2.setfilter("controlado='1' ")
	dw_2.filter()
else
	dw_2.setfilter('')
	dw_2.filter()
end if
end event

