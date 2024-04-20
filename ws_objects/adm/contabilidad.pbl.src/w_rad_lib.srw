$PBExportHeader$w_rad_lib.srw
forward
global type w_rad_lib from w_center
end type
type dw_1 from datawindow within w_rad_lib
end type
type dw_lib from datawindow within w_rad_lib
end type
type pb_new_lib from picturebutton within w_rad_lib
end type
type dw_rad from datawindow within w_rad_lib
end type
type pb_new_rad from picturebutton within w_rad_lib
end type
type pb_print from picturebutton within w_rad_lib
end type
type dw_print from datawindow within w_rad_lib
end type
end forward

global type w_rad_lib from w_center
string tag = "Realizó cambios en la radicación del libro, desea guardar los cambios ?."
integer width = 3342
integer height = 1332
string title = "Radicación de Libros"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_libro.ico"
dw_1 dw_1
dw_lib dw_lib
pb_new_lib pb_new_lib
dw_rad dw_rad
pb_new_rad pb_new_rad
pb_print pb_print
dw_print dw_print
end type
global w_rad_lib w_rad_lib

type variables
string i_codemp='',i_codlibro=''
boolean i_cam_cab=false,i_cam_det=false
end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();dw_rad.accepttext()
dw_lib.accepttext()
if cambio then
	if i_cam_cab then
		if dw_lib.update(true,false)=-1 then
			rollback;
			return -1
		end if
	end if
	if i_cam_det then
		if dw_rad.update(true,false)=-1 then
			rollback;
			return -1
		end if
	end if
	i_cam_cab=false
	i_cam_det=false
	cambio=false
	pb_new_rad.enabled=true
	blob reporte
	long j
	string clib
	for j=1 to dw_lib.rowcount()
		clib=dw_lib.getitemstring(j,'codlib')
		sqlca.autocommit=true
		if dw_lib.getitemstring(j,'reporte')='' or isnull(dw_lib.getitemstring(j,'reporte')) then
			update cont_lib set reporte=null where cod_empresa=:i_codemp and codlib=:clib;
		else
			reporte=blob(dw_lib.getitemstring(j,'reporte'))
			updateblob cont_lib set reporte=:reporte where cod_empresa=:i_codemp and codlib=:clib;
		end if
		sqlca.autocommit=false
		if sqlca.sqlcode=-1 then
			messagebox('Error actualizando cont_lib',sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	next
end if
commit;
dw_lib.resetupdate()
dw_rad.resetupdate()
return 1
end function

on w_rad_lib.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_lib=create dw_lib
this.pb_new_lib=create pb_new_lib
this.dw_rad=create dw_rad
this.pb_new_rad=create pb_new_rad
this.pb_print=create pb_print
this.dw_print=create dw_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_lib
this.Control[iCurrent+3]=this.pb_new_lib
this.Control[iCurrent+4]=this.dw_rad
this.Control[iCurrent+5]=this.pb_new_rad
this.Control[iCurrent+6]=this.pb_print
this.Control[iCurrent+7]=this.dw_print
end on

on w_rad_lib.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_lib)
destroy(this.pb_new_lib)
destroy(this.dw_rad)
destroy(this.pb_new_rad)
destroy(this.pb_print)
destroy(this.dw_print)
end on

event resize;call super::resize;resize(2930,1620)
end event

type pb_grabar from w_center`pb_grabar within w_rad_lib
integer x = 3081
integer y = 308
integer taborder = 30
integer textsize = -8
string facename = "Tahoma"
string powertiptext = "Guardar Radicación [Alt+G]"
end type

event pb_grabar::clicked;call super::clicked;grabar()
end event

type dw_1 from datawindow within w_rad_lib
integer x = 50
integer y = 12
integer width = 1138
integer height = 148
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event itemchanged;call super::itemchanged;
this.accepttext()
i_codemp=this.getitemstring(1,1)
dw_lib.reset()
dw_rad.reset()
dw_lib.retrieve(i_codemp)

end event

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

type dw_lib from datawindow within w_rad_lib
integer x = 50
integer y = 172
integer width = 3008
integer height = 532
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_libros_todo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then 
	setnull(i_codlibro)
	dw_rad.reset()
	return
end if
i_codlibro=getitemstring(currentrow,"codlib")
dw_rad.retrieve(i_codemp,i_codlibro)
end event

event itemchanged;accepttext()
i_cam_cab=true
cambio=true
choose case getcolumnname()
	case 'camino'
		if trim(gettext())='' then return
		if not fileexists(gettext()) then
			setitem(getrow(),'camino','')
			settext('')
			return 1
		end if
end choose
end event

event buttonclicked;string camino,nomarch,carreta
long file
if row<>getrow() then setrow(row)
if dwo.name='b_1' then
	nomarch=getitemstring(getrow(),'camino')
	if isnull(nomarch) then nomarch=''
	camino=nomarch
	if GetFileOpenName("Abrir Reporte", camino, nomarch, "SRD","Reportes (*.SRD),*.SRD",nomarch) = 1 then
		setitem(getrow(),'camino',camino)
		file=fileopen(nomarch,textmode!)
		if file=-1 then
			messagebox('Error', 'No se pudo abrir el archivo')
			return
		end if
		filereadex(file,carreta)
		setitem(getrow(),'reporte',carreta)
		event itemchanged(getrow(),object.reporte,'')
	end if
else
	camino=getitemstring(getrow(),'camino')
	if GetFileSaveName ( 'Guardar reporte como', camino, nomarch , 'SRD' , 'Reportes (*.srd),*.srd' )<=0 then return
	file=fileopen(nomarch,textmode!,write!,lockwrite!,replace!)
	if file=-1 then
		messagebox('Error creando archivo','No se pudo abrir el archivo para escribirlo')
		return
	end if
	filewriteex(file,getitemstring(getrow(),'reporte'))
end if
fileclose(file)
end event

event rowfocuschanging;choose case f_pregunta()
	case 1
		if grabar()=-1 then return 1
	case 2
		pb_new_rad.enabled=true
	case 3
		return 1
end choose
i_cam_cab=false
i_cam_det=false
cambio=false
end event

event retrieveend;long j
blob reporte
string clib
for j=1 to rowcount
	sqlca.autocommit=true
	clib=getitemstring(j,'codlib')
	selectblob reporte into :reporte from cont_lib where cod_empresa=:i_codemp and codlib=:clib;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo cont_lib',sqlca.sqlerrtext)
		return
	end if
	setitem(j,'reporte',string(reporte))
	sqlca.autocommit=false
next
end event

type pb_new_lib from picturebutton within w_rad_lib
event mousemove pbm_mousemove
integer x = 3081
integer y = 164
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Nuevo Libro"
end type

event clicked;if i_codemp='' then return
long donde
donde=dw_lib.insertrow(0)
dw_lib.setitem(donde,"cod_empresa",i_codemp)
dw_lib.scrolltorow(donde)
cambio=true

end event

type dw_rad from datawindow within w_rad_lib
integer x = 46
integer y = 748
integer width = 1568
integer height = 432
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lib_rad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event itemchanged;accepttext()
i_cam_det=true
cambio=true
end event

type pb_new_rad from picturebutton within w_rad_lib
event mousemove pbm_mousemove
integer x = 1659
integer y = 732
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Nueva radicación"
end type

event clicked;if i_codemp='' or i_codlibro='' then return
long donde,nro
if dw_rad.rowcount()=0 then
	nro=1
else
	nro=dw_rad.getitemnumber(dw_rad.rowcount(),"termina")+1
end if
donde=dw_rad.insertrow(0)
dw_rad.setitem(donde,"cod_empresa",i_codemp)
dw_rad.setitem(donde,"item",donde)
dw_rad.setitem(donde,"codlib",i_codlibro)
dw_rad.setitem(donde,"inicia",nro)
dw_rad.scrolltorow(donde)
this.enabled=false
cambio=true

end event

type pb_print from picturebutton within w_rad_lib
event mousemove pbm_mousemove
integer x = 1659
integer y = 872
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "print.gif"
string disabledname = "d_print.gif"
string powertiptext = "Imprimi radicación"
end type

event clicked;string carreta
carreta=dw_lib.getitemstring(dw_lib.getrow(),"reporte")
if carreta<>"" then
	if dw_print.create(carreta)=-1 then return
	dw_print.settransobject(sqlca)
	long j,k,ini,fin,donde
	j=dw_print.retrieve(i_codemp,i_codlibro,dw_rad.getitemnumber(dw_rad.getrow(),"item"))
	if j=0 then return
	ini=dw_rad.getitemnumber(dw_rad.getrow(),"inicia")
	fin=dw_rad.getitemnumber(dw_rad.getrow(),"termina")
	//dw_print.reset()
	dw_print.setitem(1,'item',ini)
	setpointer(hourglass!)
	for k=ini+1 to fin
		dw_print.rowscopy(1,1,primary!,dw_print,dw_print.rowcount()+1,primary!)
		dw_print.setitem(dw_print.rowcount(),'item',k)
	next
	dw_print.sort()
	dw_print.groupcalc()
	dw_print.print()
end if

end event

type dw_print from datawindow within w_rad_lib
boolean visible = false
integer x = 2235
integer y = 772
integer width = 334
integer height = 208
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

