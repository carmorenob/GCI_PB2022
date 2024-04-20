$PBExportHeader$w_pcategorias.srw
forward
global type w_pcategorias from window
end type
type pb_1 from picturebutton within w_pcategorias
end type
type pb_2 from picturebutton within w_pcategorias
end type
type pb_3 from picturebutton within w_pcategorias
end type
type pb_4 from picturebutton within w_pcategorias
end type
type st_5 from statictext within w_pcategorias
end type
type dw_6 from datawindow within w_pcategorias
end type
type dw_5 from datawindow within w_pcategorias
end type
type dw_4 from datawindow within w_pcategorias
end type
type dw_3 from datawindow within w_pcategorias
end type
end forward

global type w_pcategorias from window
integer width = 3136
integer height = 1672
boolean titlebar = true
string title = "Cups - Categorias"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_cate.ico"
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
st_5 st_5
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
end type
global w_pcategorias w_pcategorias

type variables
long mete
datawindowchild dw_subgrp,dw_grp
end variables

on w_pcategorias.create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.st_5=create st_5
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.Control[]={this.pb_1,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.st_5,&
this.dw_6,&
this.dw_5,&
this.dw_4,&
this.dw_3}
end on

on w_pcategorias.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.st_5)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_3)
end on

event open;mete=0
dw_3.settransobject(SQLCA)
dw_3.insertrow(1)

dw_4.settransobject(SQLCA)
dw_4.insertrow(1)
dw_4.getchild('cd_grupo',dw_grp)
dw_grp.settransobject(SQLCA)
dw_grp.retrieve()
dw_grp.setfilter("#1='a'")
dw_grp.filter()

dw_5.settransobject(SQLCA)
dw_5.insertrow(1)
dw_5.getchild("cd_subgrupo",dw_subgrp)
dw_subgrp.settransobject(SQLCA)
dw_subgrp.retrieve()
dw_subgrp.setfilter("#1='a'")
dw_subgrp.filter()


end event

type pb_1 from picturebutton within w_pcategorias
string tag = "&Insertar"
integer x = 1193
integer y = 1424
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
dw_6.setitem(donde,1,dw_subgrp.getitemstring(dw_subgrp.getrow(),1))
dw_6.setitem(donde,2,dw_subgrp.getitemstring(dw_subgrp.getrow(),2))
dw_6.setitem(donde,3,dw_subgrp.getitemstring(dw_subgrp.getrow(),3))

end event

type pb_2 from picturebutton within w_pcategorias
string tag = "&Borrar"
integer x = 1371
integer y = 1424
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

type pb_3 from picturebutton within w_pcategorias
string tag = "&Refrescar"
integer x = 1733
integer y = 1424
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

type pb_4 from picturebutton within w_pcategorias
string tag = "&Guardar"
integer x = 1545
integer y = 1424
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
	commit;
end if
end event

type st_5 from statictext within w_pcategorias
integer x = 59
integer y = 548
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

type dw_6 from datawindow within w_pcategorias
integer x = 46
integer y = 620
integer width = 3063
integer height = 756
integer taborder = 60
string title = "none"
string dataobject = "dw_categoria"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;choose case this.getcolumnname()
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

type dw_5 from datawindow within w_pcategorias
integer x = 64
integer y = 372
integer width = 1961
integer height = 144
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_psubgrupo"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long fila
fila = dw_subgrp.getrow()
if fila <= 0 then return
dw_6.retrieve(dw_subgrp.getitemstring(fila,1),dw_subgrp.getitemstring(fila,2),dw_subgrp.getitemstring(fila,3))

end event

type dw_4 from datawindow within w_pcategorias
integer x = 50
integer y = 200
integer width = 1979
integer height = 156
integer taborder = 40
string title = "none"
string dataobject = "dw_combo_pgrupo"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.accepttext()
dw_subgrp.setfilter("cd_grupo='"+data+"' and cod_version='"+dw_3.getitemstring(1,1)+"'")
dw_subgrp.filter()
//dw_4.setitem(1,1,"")
//dw_5.reset()
//dw_5.retrieve(dw_3.getitemstring(1,1),data)
//dw_6.reset()

end event

type dw_3 from datawindow within w_pcategorias
integer x = 41
integer y = 36
integer width = 1170
integer height = 144
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_vcups"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.accepttext()
dw_grp.setfilter("#1='"+this.getitemstring(1,1)+"'")
dw_grp.filter()
dw_grp.sort()
dw_4.setitem(1,1,"")

end event

