$PBExportHeader$w_procedimientos.srw
forward
global type w_procedimientos from window
end type
type dw_1 from datawindow within w_procedimientos
end type
type pb_1 from picturebutton within w_procedimientos
end type
type pb_2 from picturebutton within w_procedimientos
end type
type pb_3 from picturebutton within w_procedimientos
end type
type pb_4 from picturebutton within w_procedimientos
end type
type st_6 from statictext within w_procedimientos
end type
type st_5 from statictext within w_procedimientos
end type
type dw_6 from datawindow within w_procedimientos
end type
type dw_5 from datawindow within w_procedimientos
end type
type dw_4 from datawindow within w_procedimientos
end type
type dw_3 from datawindow within w_procedimientos
end type
end forward

global type w_procedimientos from window
integer width = 4594
integer height = 2080
boolean titlebar = true
string title = "Procedimientos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_producto.ico"
dw_1 dw_1
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
st_6 st_6
st_5 st_5
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
end type
global w_procedimientos w_procedimientos

type variables
long mete
datawindowchild dw_subgrp,dw_grp
end variables

on w_procedimientos.create
this.dw_1=create dw_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.st_6=create st_6
this.st_5=create st_5
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.Control[]={this.dw_1,&
this.pb_1,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.st_6,&
this.st_5,&
this.dw_6,&
this.dw_5,&
this.dw_4,&
this.dw_3}
end on

on w_procedimientos.destroy
destroy(this.dw_1)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_3)
end on

event open;mete=0
dw_1.settransobject(SQLCA)
dw_1.insertrow(1)

dw_3.getchild('cd_grupo',dw_grp)
dw_grp.settransobject(SQLCA)
dw_grp.retrieve()
dw_grp.setfilter("cod_version='a'")
dw_grp.filter()

dw_3.settransobject(SQLCA)
dw_3.insertrow(1)
dw_4.getchild("cd_subgrupo",dw_subgrp)
dw_subgrp.settransobject(SQLCA)
dw_subgrp.retrieve()
dw_subgrp.setfilter("#1='a'")
dw_subgrp.filter()

dw_4.settransobject(SQLCA)
dw_4.insertrow(1)

end event

type dw_1 from datawindow within w_procedimientos
integer x = 41
integer y = 28
integer width = 1207
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_vcups"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.accepttext()
dw_3.retrieve()
dw_4.retrieve()
dw_grp.setfilter("cod_version='"+this.getitemstring(1,1)+"'")
dw_grp.filter()
dw_grp.sort()
dw_3.setitem(1,1,"")
dw_4.setitem(1,1,"")
end event

type pb_1 from picturebutton within w_procedimientos
string tag = "&Insertar"
integer x = 1902
integer y = 1836
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;long donde
string codigo
donde=dw_6.insertrow(0)
dw_6.scrolltorow(donde)
mete=1
dw_6.setitem(donde,'cod_version',dw_1.getitemstring(1,1))
dw_6.setitem(donde,1,dw_5.getitemstring(dw_5.getrow(),2))
dw_6.setitem(donde,2,dw_5.getitemstring(dw_5.getrow(),3))
dw_6.setitem(donde,3,dw_5.getitemstring(dw_5.getrow(),4))
codigo=dw_5.getitemstring(dw_5.getrow(),2)+dw_5.getitemstring(dw_5.getrow(),3)+dw_5.getitemstring(dw_5.getrow(),4)
dw_6.setitem(donde,5,codigo+'_'+dw_1.getitemstring(1,1))
dw_6.setitem(donde,'cod_cups',codigo)

end event

type pb_2 from picturebutton within w_procedimientos
string tag = "&Borrar"
integer x = 2080
integer y = 1836
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_6.deleterow(0)
end event

type pb_3 from picturebutton within w_procedimientos
string tag = "&Refrescar"
integer x = 2441
integer y = 1836
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
alignment htextalign = left!
end type

event clicked;dw_5.triggerevent(rowfocuschanged!)
end event

type pb_4 from picturebutton within w_procedimientos
string tag = "&Guardar"
integer x = 2254
integer y = 1836
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
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_6.update()<1 then
	rollback;
else
	blob cons
	string proc
	int j
	
	for j=1 to dw_6.rowcount()
		proc=dw_6.getitemstring(j,'codproced')
		cons=blob(dw_6.getitemstring(j,'conse'))
		sqlca.autocommit=true
		if dw_6.getitemstring(j,'conse')='' or isnull(dw_6.getitemstring(j,'conse')) then
			update proced set consenti=null where codproced=:proc;
		else
			updateblob proced set consenti=:cons where codproced=:proc;
		end if
		sqlca.autocommit=false
		if sqlca.sqlcode=-1 then
			messagebox('Error actualizando documentos',sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	next
	commit;
end if
end event

type st_6 from statictext within w_procedimientos
integer x = 50
integer y = 1028
integer width = 425
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_procedimientos
integer x = 50
integer y = 516
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Categorías:"
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_procedimientos
integer x = 41
integer y = 1092
integer width = 4475
integer height = 728
integer taborder = 60
string title = "none"
string dataobject = "dw_proced"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;choose case this.getcolumnname()
	case 	'cd_subcategoria'
		string codigo
		codigo=dw_5.getitemstring(dw_5.getrow(),2)+dw_5.getitemstring(dw_5.getrow(),3)+dw_5.getitemstring(dw_5.getrow(),4)+data
		dw_6.setitem(getrow(),5,codigo+'_'+dw_1.getitemstring(1,1))
		dw_6.setitem(getrow(),'cod_cups',codigo)
	case 'camino'
		if trim(gettext())='' then return
		if not fileexists(gettext()) then
			setitem(getrow(),'camino','')
			settext('')
			return 1
		end if
		uo_datastore dw_temp
		dw_temp=create uo_datastore
		if f_lee_dw_camino(gettext(),dw_temp)=-1 then return
		real factor_umed
		choose case dw_temp.describe("datawindow.units")
			case '0'//powerunits
				factor_umed=1/174
			case '1'//pixels
				factor_umed=1/38
			case '2'//pulgadas
				factor_umed=1/395
			case '3'//centimetros
				factor_umed=1/1000
		end choose
		setitem(getrow(),'tam_papel',dw_temp.describe('datawindow.print.paper.size'))
		setitem(getrow(),'orienta',dw_temp.describe('datawindow.print.orientation'))
		setitem(getrow(),'mar_izq',real(dw_temp.describe('datawindow.print.margin.left'))*factor_umed)
		setitem(getrow(),'mar_der',real(dw_temp.describe('datawindow.print.margin.right'))*factor_umed)
		setitem(getrow(),'mar_sup',real(dw_temp.describe('datawindow.print.margin.top'))*factor_umed)
		setitem(getrow(),'mar_inf',real(dw_temp.describe('datawindow.print.margin.bottom'))*factor_umed)
		setitem(getrow(),'copias',1)
		setitem(getrow(),'tamanyo',100)
		setitem(getrow(),'v_prelim','0')
		setitem(getrow(),'ver_dialogo','1')
		setitem(getrow(),'cambiar_prop','1')
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
		setitem(getrow(),'conse',carreta)
		event itemchanged(getrow(),object.conse,'')
	end if
	fileclose(file)
end if
if dwo.name='b_1' then
	camino=getitemstring(getrow(),'camino')
	if GetFileSaveName ( 'Guardar reporte como', camino, nomarch , 'SRD' , 'Reportes (*.srd),*.srd' )<=0 then return
	file=fileopen(nomarch,textmode!,write!,lockwrite!,replace!)
	if file=-1 then
		messagebox('Error creando archivo','No se pudo abrir el archivo para escribirlo')
		return
	end if
	filewriteex(file,getitemstring(getrow(),'conse'))
	fileclose(file)
end if
if dwo.name='b_prep'  then 
	if row<>getrow() then setrow(row)
	nomarch=getitemstring(getrow(),'preparacion')
	if isnull(nomarch) then nomarch=''
	camino=nomarch
	if GetFileOpenName("Abrir Reporte", camino, nomarch, "PDF","Reportes (*.PDF),*.PDF",nomarch) = 1 then
		setitem(getrow(),'preparacion',camino)
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

event constructor;settransobject(SQLCA)
end event

type dw_5 from datawindow within w_procedimientos
integer x = 46
integer y = 580
integer width = 3077
integer height = 420
integer taborder = 50
string title = "none"
string dataobject = "dw_categoria"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long fila
fila = getrow()
if fila <= 0 then return
selectrow(0,false)
selectrow(fila,true)
dw_6.retrieve(dw_1.getitemstring(1,1),getitemstring(fila,2),getitemstring(fila,3),getitemstring(fila,4))


end event

event constructor;settransobject(SQLCA)
end event

type dw_4 from datawindow within w_procedimientos
integer x = 46
integer y = 352
integer width = 1979
integer height = 140
integer taborder = 40
string title = "none"
string dataobject = "dw_combo_psubgrupo"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;accepttext()
dw_5.reset()
dw_6.reset()
dw_5.retrieve(dw_1.getitemstring(1,1),dw_3.getitemstring(1,1),data)

end event

type dw_3 from datawindow within w_procedimientos
integer x = 37
integer y = 184
integer width = 1975
integer height = 176
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_pgrupo"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.accepttext()
string jaer
jaer="cd_grupo='"+data+"' and cod_version='"+dw_1.getitemstring(1,1)+"'"
dw_subgrp.setfilter("cd_grupo='"+data+"' and cod_version='"+dw_1.getitemstring(1,1)+"'")
dw_subgrp.filter()
dw_4.setitem(1,1,"")
dw_5.reset()
dw_6.reset()
end event

