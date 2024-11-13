$PBExportHeader$w_tablas.srw
forward
global type w_tablas from window
end type
type pb_8 from picturebutton within w_tablas
end type
type pb_7 from picturebutton within w_tablas
end type
type pb_6 from picturebutton within w_tablas
end type
type pb_5 from picturebutton within w_tablas
end type
type pb_4 from picturebutton within w_tablas
end type
type pb_3 from picturebutton within w_tablas
end type
type pb_2 from picturebutton within w_tablas
end type
type pb_1 from picturebutton within w_tablas
end type
type st_5 from statictext within w_tablas
end type
type st_cuantos from statictext within w_tablas
end type
type st_4 from statictext within w_tablas
end type
type sle_1 from singlelineedit within w_tablas
end type
type st_3 from statictext within w_tablas
end type
type st_2 from statictext within w_tablas
end type
type dw_1 from datawindow within w_tablas
end type
end forward

global type w_tablas from window
integer width = 3099
integer height = 1720
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "Query5!"
string pointer = "Arrow!"
event inicializa pbm_open
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_5 st_5
st_cuantos st_cuantos
st_4 st_4
sle_1 sle_1
st_3 st_3
st_2 st_2
dw_1 dw_1
end type
global w_tablas w_tablas

type variables
string cemp,tipo_col,anterior,orden,i_cemp
datawindowchild docus,dwc_generico,dwc_gen2,dw_ccosto,idw_mcpio,dwc_postal
end variables

forward prototypes
public subroutine inicializa ()
end prototypes

public subroutine inicializa ();if dw_1.dataobject="dw_grupocita" or dw_1.dataobject='dw_fin_consulta' then
	dw_1.getchild("codcc",dw_ccosto)
	dw_ccosto.settransobject(sqlca)
end if
if dw_1.dataobject="dw_areapdx_tabla" then
	dw_1.getchild("coddoc",docus)
	docus.settransobject(sqlca)
	docus.retrieve()
end if
if dw_1.dataobject="dw_tipoingreso" then
	dw_1.getchild("codplantilla",dwc_gen2)
	dwc_gen2.settransobject(sqlca)
	dwc_gen2.insertrow(1)
	dw_1.getchild("numcampo",docus)
	docus.settransobject(sqlca)
	docus.insertrow(1)
end if
if dw_1.dataobject="dw_remitir" then
	dw_1.getchild("desciudad",docus)
	docus.settransobject(sqlca)
	docus.insertrow(1)
end if
if dw_1.dataobject="dw_empresas" then
	dw_1.getchild("desciudad",docus)
	docus.settransobject(sqlca)
	docus.InsertRow(0)
end if
if dw_1.dataobject="dw_areapdx_tabla" then
	dw_1.getchild("coddoc",docus)
	docus.settransobject(sqlca)
	docus.retrieve()
end if
if dw_1.dataobject="dw_articulocfg" then
	dw_1.GetChild('generico', dwc_generico)
	dwc_generico.SetTransObject(SQLCA)
	dwc_generico.Modify("Datawindow.Header.height = 0 codgenerico.visible = FALSE")
	dwc_generico.Retrieve()
end if

if dw_1.dataobject='dw_tipoemplerequicfg' or dw_1.dataobject='dw_nomrequicargocfg' then
	dw_1.GetChild('tipoemple', dwc_generico)
	dwc_generico.SetTransObject(SQLCA)
	dwc_generico.Retrieve()
end if
if dw_1.dataobject='dw_empresa_cont' then
	dw_1.GetChild('desciudad', dwc_generico)
	dwc_generico.SetTransObject(SQLCA)
end if
if dw_1.dataobject='dw_nomtipoaportecfg' or dw_1.dataobject='dw_conf_ausentismo' then
	dw_1.GetChild('cod_concep', dwc_generico)
	dw_1.GetChild('cod_concep_emp', dwc_gen2)
	dwc_generico.SetTransObject(SQLCA)
	dwc_gen2.SetTransObject(SQLCA)
	select cod_empresa into :i_cemp from lugar where codlugar=:clugar;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
		return
	end if
	if isnull(i_cemp) then
		messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
		return
	end if
	dwc_generico.Retrieve(i_cemp)
	dwc_gen2.Retrieve(i_cemp)
end if
if  dw_1.dataobject='dw_profesional' then
	pb_7.visible=true
else
	pb_7.visible=false
end if
if dw_1.dataobject="dw_lugares" then
	dw_1.getchild("desciudad",docus)
	docus.settransobject(sqlca)
	docus.InsertRow(0)
	dw_1.GetChild('cod_postal',dwc_postal)
	dwc_postal.SetTransObject(SQLCA)
	dwc_postal.InsertRow(0)
end if
dw_1.settransobject(SQLCA)
dw_1.retrieve()

end subroutine

on w_tablas.create
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_5=create st_5
this.st_cuantos=create st_cuantos
this.st_4=create st_4
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_1=create dw_1
this.Control[]={this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_5,&
this.st_cuantos,&
this.st_4,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.dw_1}
end on

on w_tablas.destroy
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_5)
destroy(this.st_cuantos)
destroy(this.st_4)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_1)
end on

event resize;dw_1.resize(newwidth - 100 , newheight - 350)
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
pb_8.x=(newwidth - 1800)/2 +1500
pb_8.y=newheight - 140
st_cuantos.x=newwidth - 520
st_cuantos.y=newheight - 170
end event

type pb_8 from picturebutton within w_tablas
boolean visible = false
integer x = 2199
integer y = 1460
integer width = 146
integer height = 128
integer taborder = 20
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

type pb_7 from picturebutton within w_tablas
string tag = "Unifica Profesionales"
boolean visible = false
integer x = 2025
integer y = 1460
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "elimi_pac.gif"
string disabledname = "d_elimi_pac.gif"
alignment htextalign = left!
string powertiptext = "Unifica Profesionales"
end type

event clicked;st_usuarios l_prof 
l_prof.usuario=dw_1.getitemstring(dw_1.getrow(), 'codprof') 
l_prof.destino='profe'
l_prof.clave= dw_1.getitemstring(dw_1.getrow(), 'nombre1') +' '+dw_1.getitemstring(dw_1.getrow(), 'apellido1')
open(w_borra_prof_rep)

end event

type pb_6 from picturebutton within w_tablas
string tag = "Im&portar"
integer x = 1847
integer y = 1460
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
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
	value=dw_1.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
end event

type pb_5 from picturebutton within w_tablas
string tag = "Exportar"
integer x = 1673
integer y = 1460
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
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
end type

event clicked;openwithparm(w_export,dw_1)
end event

type pb_4 from picturebutton within w_tablas
string tag = "Guardar"
integer x = 1499
integer y = 1460
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
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
end type

event clicked;dw_1.accepttext()
if parent.title="Areas de Apoyo Diagnóstico" then 
	long cuantos,i
	string pilas,nulo
	cuantos=dw_1.rowcount()
	for i = 1 to cuantos
		pilas=dw_1.getitemstring(i,3)
		if pilas=" " then //an t isnull(dw_1.getitemstring(i,4)) then 
			setnull(nulo)
			dw_1.setitem(i,4,nulo)
		end if
		if dw_1.getitemstring(i,3)='3' and isnull(dw_1.getitemstring(i,4)) then
			messagebox("Atención","seleccione un documento para la fila "+string(i))
			return
		end if
	next
end if
if dw_1.update(true,false)<1 then
	rollback;
else
	commit;
	dw_1.resetupdate()
end if
end event

type pb_3 from picturebutton within w_tablas
string tag = "Refrescar"
integer x = 1326
integer y = 1460
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
end type

event clicked;dw_1.retrieve()
end event

type pb_2 from picturebutton within w_tablas
string tag = "Borrar"
integer x = 1152
integer y = 1460
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
end type

event clicked;if parent.title="Documentos" then
	string cual
	cual=dw_1.getitemstring(dw_1.getrow(),1)
	if (long(cual)>=0 and long(cual)<=8)or cual='HC' or cual='AP' or cual='CI'or cual='FC' or cual='RA' or cual='RC' then
		messagebox("Error","Estos documentos son predeterminados de la aplicación,no los puede borrar")
		return
	end if
end if
if parent.title="Aseguradoras de Salud" then
	if dw_1.getitemstring(dw_1.getrow(),1)='0' then 
		messagebox("Atención","La empresa Partricular no se puede borrar del sistema")
		return
	end if
end if
dw_1.deleterow(0)
end event

type pb_1 from picturebutton within w_tablas
string tag = "Insertar"
integer x = 978
integer y = 1460
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
alignment htextalign = left!
end type

event clicked;if parent.title="Aseguradoras de Salud" then
	long donde
	for donde=1 to dw_1.rowcount()
		if dw_1.find("codemp='"+string(donde)+"'",1,dw_1.rowcount())=0 then exit
	next
	if donde=dw_1.rowcount() then donde++
	cemp=string(donde)
	open(w_new_empre)
else
	dw_1.scrolltorow(dw_1.insertrow(0))
	dw_1.setfocus()
end if
	

end event

type st_5 from statictext within w_tablas
integer x = 2341
integer y = 80
integer width = 709
integer height = 60
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

type st_cuantos from statictext within w_tablas
integer x = 2587
integer y = 1440
integer width = 457
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_tablas
integer x = 1545
integer y = 28
integer width = 1509
integer height = 104
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

type sle_1 from singlelineedit within w_tablas
integer x = 974
integer y = 44
integer width = 549
integer height = 72
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
		donde=dw_1.find("lower("+st_3.text+") like '"+lower(this.text)+"'",1,dw_1.rowcount())
	case "numb"
		if not isnumber(this.text) then
			messagebox("Error","El campo por el que va a buscar es numérico y no acepta caracteres especiales")
			return
		else
			donde=dw_1.find(st_3.text+"="+this.text,1,dw_1.rowcount())
		end if
	case "date"
end choose
if donde=0 then
	messagebox("Atención","No se encontró la cadena de caracteres buscada")
else
	dw_1.scrolltorow(donde)
end if
end event

type st_3 from statictext within w_tablas
integer x = 288
integer y = 44
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

type st_2 from statictext within w_tablas
integer x = 27
integer y = 56
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

type dw_1 from datawindow within w_tablas
event keypres pbm_dwnkey
integer x = 59
integer y = 140
integer width = 2994
integer height = 1272
integer taborder = 10
string dragicon = "none!"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypres;if key=keydelete! and this.dataobject='dw_consultorios' then
	if this.getcolumnname()='codigosala' then
		string nulo
		setnull(nulo)
		this.setitem(this.getrow(),'codigosala',nulo)
	end if
end if

end event

event doubleclicked;string columna

if dataobject='dw_vacuna' then
	columna=dwo.name
	if columna='codvacuna' then
		st_proced st_pr
		open(w_busca_proc)
		st_pr = Message.PowerObjectParm
		if not isValid(st_pr) then Return -1
		setItem(getrow(),'cod_fact',st_pr.interno)
		setItem(getrow(),'cod_cups',st_pr.cups)
		setItem(getrow(),'descups',st_pr.descrip)
		setItem(getrow(),'cod_version',st_pr.version)

	end if
	if columna="cod_rips" then 
		st_edadsexo st_es
		st_diag st_d
		st_es.sexo='A'
		st_es.edad=0
		st_es.antece='0'
		openwithparm(w_busca_diag,st_es)
		st_d=message.powerobjectparm
		if not isValid(st_d) then return
		if not isNull(st_d.codrip) then
			setitem(1,'dx',st_d.codgeral)
			setitem(1,'cod_rips',st_d.codrip)
		end if
	end if	
	SetColumn(columna)
end if

if dataobject="dw_empresas" then
	columna=dwo.name
	if columna="tipodoc" or columna="dverificacion" or columna="nit" then
		g_tercerodesde=8
		openwithparm(w_buscater, this)
		if getitemstring(getrow(),"nit")<>"" then
			setcolumn("nit")
			event itemchanged(row,dwo,getitemstring(getrow(),"nit"))
		end if
	end if
end if
end event

event itemfocuschanged;string nulo
setnull(nulo)

if dwo.type="column" then 
	tipo_col=this.describe(dwo.name+".coltype")
	st_3.text=dwo.name
else
	tipo_col=""
	st_3.text=""
end if
if dataobject='dw_tipoemplerequicfg' or dataobject='dw_nomrequicargocfg' then
	if getcolumnname()='tipoemple' then
		dwc_generico.SetFilter("codrela='"+GetItemString(GetRow(),'codrela')+"'")
		dwc_generico.Filter()
	else
		dwc_generico.SetFilter("")
		dwc_generico.Filter()
	end if
end if


end event

event rowfocuschanged;if this.getrow()<1 then return
accepttext()
st_cuantos.text="Reg. "+ string(this.getrow()) +" de " +string(this.rowcount())

if dw_1.dataobject="dw_grupocita" then
	if getitemstring(getrow(),"coduf")<>"" and not isnull(getitemstring(getrow(),"coduf")) then
		dw_ccosto.retrieve(getitemstring(getrow(),"coduf"))
	else
		dw_ccosto.reset()
	end if
end if

if this.dataobject='dw_remitir' then
	if not isnull(this.getitemstring(this.getrow(),'cdepto')) then
		docus.retrieve(this.getitemstring(this.getrow(),'cdepto'))
	else
		docus.reset()
		docus.insertrow(1)
	end if
end if
if this.dataobject='dw_ips' then
	if not isnull(this.getitemstring(currentrow,'depto_ips')) then
		docus.retrieve(this.getitemstring(currentrow,'depto_ips'))
	end if
end if
if dataobject='dw_empresa_cont' then
	dwc_generico.retrieve(getitemstring(getrow(),'cdpto'))
end if

if dataobject='dw_tipoingreso' then
	if not isnull(this.getitemstring(currentrow,'codtingre')) then
		dwc_gen2.retrieve(this.getitemstring(currentrow,'codtingre'))
	end if
	docus.retrieve(this.getitemstring(currentrow,'codplantilla'))
end if

if dataobject='dw_lugares' then
	if not isnull(dw_1.getitemstring(dw_1.getrow(),'dpto')) then
		if docus.retrieve(dw_1.getitemstring(dw_1.getrow(),'dpto'))>0 then
			dwc_postal.Retrieve(dw_1.getitemstring(dw_1.getrow(),'dpto'),dw_1.getitemstring(dw_1.getrow(),'ciudad'))		
		end if
	else
		docus.reset()
		docus.insertrow(1)
	end if
end if

if dataobject='dw_fin_consulta' then
	if getitemstring(getrow(),"coduf")<>"" and not isnull(getitemstring(getrow(),"coduf")) then
		dw_ccosto.retrieve(getitemstring(getrow(),"coduf"))
	else
		dw_ccosto.reset()
	end if
end if
end event

event clicked;if dataobject='dw_triage'  or dataobject='dw_semaforo_medica' then
	if dwo.name='n_color' then
		long colo
		if choosecolor(colo)=1 then
			setitem(row,'n_color',colo)
		end if
	end if
end if
if dataobject='dw_hclin_graficas' then
	if dwo.name='cp1' then
		if choosecolor(colo)=1 then
			setitem(row,'cp1',colo)
		end if
	end if
	if dwo.name='cp2' then
		if choosecolor(colo)=1 then
			setitem(row,'cp2',colo)
		end if
	end if
	if dwo.name='cp3' then
		if choosecolor(colo)=1 then
			setitem(row,'cp3',colo)
		end if
	end if
	if dwo.name='cp4' then
		if choosecolor(colo)=1 then
			setitem(row,'cp4',colo)
		end if
	end if
	if dwo.name='cp5' then
		if choosecolor(colo)=1 then
			setitem(row,'cp5',colo)
		end if
	end if
	if dwo.name='cp6' then
		if choosecolor(colo)=1 then
			setitem(row,'cp6',colo)
		end if
	end if
	if dwo.name='cp7' then
		if choosecolor(colo)=1 then
			setitem(row,'cp7',colo)
		end if
	end if	
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
dw_1.setsort(cual+" "+orden)
dw_1.sort()
anterior=cual
end event

event itemchanged;string nulo
string s_dpto,s_ciudad
setnull(nulo)

accepttext( )
if dw_1.dataobject="dw_grupocita" then
	if getcolumnname()="coduf" then
		setitem(getrow(),"codcc",nulo)
		dw_ccosto.retrieve(this.getitemstring(this.getrow(),'coduf'))
	end if
end if

if dataobject='dw_triage' then
	if dw_1.getitemnumber(row, 'total_signos') >1 then
		messagebox('Error', 'No puede haber mas de un registro con signos')
		setitem(getrow(),'signos',0)
		return 1
	end if	
end if

if dataobject="dw_areapdx_tabla" then
	if dwo.name="clugar" then
		setnull(nulo)
		docus.setfilter("clugar='"+data+"'")
		docus.filter()
		setitem(getrow(),"coddoc",nulo)
	end if
end if
if dataobject='dw_tipoingreso' then
	if getcolumnname()='codplantilla' then
		setitem(getrow(),'numcampo','')
		docus.retrieve(data)
	end if
end if

if dataobject='dw_remitir' then
	choose case getcolumnname()
		case 'cdepto' 
			docus.retrieve(getitemstring(getrow(),'cdepto'))
		case 'desciudad'
			setitem(getrow(),'codciudad',docus.getitemstring(docus.getrow(),'codciudad'))
	end choose
end if
if dataobject='dw_lugares' then
	choose case getcolumnname()
		case 'dpto' 
			docus.retrieve(getitemstring(getrow(),'dpto'))
		case 'desciudad'
			setitem(getrow(),'ciudad',docus.getitemstring(docus.getrow(),'codciudad'))
			s_dpto=getitemstring(row,'dpto')
			s_ciudad=docus.getitemstring(docus.getrow(),'codciudad')
			setitem(getrow(),'cciudad',docus.getitemstring(docus.getrow(),'codciudad'))
			dwc_postal.Retrieve(s_dpto,s_ciudad)
	end choose
end if

if dataobject='dw_ips' then
	if getcolumnname()='depto_ips' then
		setitem(getrow(),'ciudad_ips','')
		docus.retrieve(data)
	end if
end if

if dataobject="dw_articulocfg" then
	if string(dwo.Name) = 'generico' then
		SetItem(Row,'codgenerico',dwc_generico.GetItemString(dwc_generico.GetRow(),'codgenerico'))
	end if
end if
if dataobject='dw_empresa_cont' then
	if getcolumnname()='cdpto' then
		dwc_generico.retrieve(data)
		setitem(getrow(),'cciudad','')
		setitem(getrow(),'desciudad','')
	end if
	if getcolumnname()='desciudad' then
		setitem(getrow(),'cciudad',dwc_generico.getitemstring(dwc_generico.getrow(),'codciudad'))
	end if
end if

if dataobject='dw_fin_consulta' then
	if getcolumnname()="coduf" then
		setitem(getrow(),"codcc",nulo)
		dw_ccosto.retrieve(this.getitemstring(this.getrow(),'coduf'))
	end if
end if
accepttext()

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

event buttonclicked;st_usuarios l_prof
if dataobject='dw_profesional' then
	l_prof.usuario=dw_1.getitemstring(row, 'CodProf') 
	l_prof.destino='profe'
	l_prof.clave= dw_1.getitemstring(row, 'nombre1') +' '
	If  not isnull(dw_1.getitemstring(row, 'nombre2'))	then 
		l_prof.clave= l_prof.clave+dw_1.getitemstring(row, 'nombre2')+'  ' 
	end if
	l_prof.clave=l_prof.clave+dw_1.getitemstring(row, 'apellido1') 
	If  not isnull(dw_1.getitemstring(row, 'apellido2'))	then 
		l_prof.clave= l_prof.clave+' '+dw_1.getitemstring(row, 'apellido2') 
	end if
	if dwo.name='b_firma' then 
		openwithparm(w_sube_imagen,l_prof)
	end if
end if


if dataobject='dw_pm_aplicativos' then
	long file
	string nomarch,camino,carreta,capli
	if row<>getrow() then setrow(row)
		if dwo.name='b_1' then
			capli=getitemstring(getrow(),'cod_aplica')
			nomarch=getitemstring(getrow(),'camino')
			if isnull(nomarch) then nomarch=''
			camino=nomarch
			if GetFileOpenName("Abrir Reporte", camino, nomarch, "SRD","Reportes (*.json),*.json",nomarch) = 1 then
				setitem(getrow(),'camino',camino)
				file=fileopen(nomarch,textmode!)
				if file=-1 then
					messagebox('Error', 'No se pudo abrir el archivo')
					return
				end if
				filereadex(file,carreta)
				setitem(getrow(),'fecha_carga',now())
				//setitem(getrow(),'ribon',carreta)
				sqlca.autocommit=true
				blob ribon
				ribon=blob(carreta)
				updateblob pm_aplicativos set ribon=:ribon where cod_aplica=:capli;
				sqlca.autocommit=false
				if sqlca.sqlcode=-1 then
					messagebox('Error actualizando documentos',sqlca.sqlerrtext)
					rollback;
					return -1
				end if				
			end if
		else
			Blob lb_ribon
			string ls_cual
			camino=getitemstring(getrow(),'camino')
			if GetFileSaveName ( 'Guardar reporte como', camino, nomarch , 'JSON' , 'Reportes (*.json),*.json' )<=0 then return
			file=fileopen(nomarch,textmode!,write!,lockwrite!,replace!)

			if file=-1 then
				messagebox('Error creando archivo','No se pudo abrir el archivo para escribirlo')
				return
			end if
						
			ls_cual=getitemstring(getrow(),'cod_aplica')
			SELECTBLOB ribon INTO :lb_ribon
			FROM pm_aplicativos
			WHERE cod_aplica = :ls_cual;
		
			filewriteex(file,lb_ribon)
		end if
		fileclose(file)
end if 
end event

