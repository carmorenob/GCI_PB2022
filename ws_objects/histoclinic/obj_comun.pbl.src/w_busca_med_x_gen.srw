$PBExportHeader$w_busca_med_x_gen.srw
forward
global type w_busca_med_x_gen from window
end type
type cb_cancel from picturebutton within w_busca_med_x_gen
end type
type cb_aceptar from picturebutton within w_busca_med_x_gen
end type
type dw_2 from datawindow within w_busca_med_x_gen
end type
type st_1 from statictext within w_busca_med_x_gen
end type
type st_5 from statictext within w_busca_med_x_gen
end type
type st_3 from statictext within w_busca_med_x_gen
end type
type st_2 from statictext within w_busca_med_x_gen
end type
type sle_1 from singlelineedit within w_busca_med_x_gen
end type
type dw_1 from datawindow within w_busca_med_x_gen
end type
type st_4 from statictext within w_busca_med_x_gen
end type
type cbx_1 from checkbox within w_busca_med_x_gen
end type
type gb_1 from groupbox within w_busca_med_x_gen
end type
type gb_2 from groupbox within w_busca_med_x_gen
end type
end forward

global type w_busca_med_x_gen from window
integer width = 3122
integer height = 1628
boolean titlebar = true
string title = "Buscar Generico Medico/Quirúrgico"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
event filtrar pbm_open
cb_cancel cb_cancel
cb_aceptar cb_aceptar
dw_2 dw_2
st_1 st_1
st_5 st_5
st_3 st_3
st_2 st_2
sle_1 sle_1
dw_1 dw_1
st_4 st_4
cbx_1 cbx_1
gb_1 gb_1
gb_2 gb_2
end type
global w_busca_med_x_gen w_busca_med_x_gen

type variables
datawindowchild idw_clase
string orden,anterior
st_pa_medica ist_m
st_med st_med
end variables

forward prototypes
public subroutine filtrar (integer nivel)
end prototypes

public subroutine filtrar (integer nivel);string filtro
filtro = ""
long vuelta
vuelta = 1
if vuelta <= nivel then 
	if dw_1.getitemstring(1,1)<>"" then filtro = filtro + "codgrupo='" + dw_1.getitemstring(1,1) +"' and "		
	vuelta++
end if
if vuelta <= nivel then 
	if dw_1.getitemstring(1,2)<>"" then filtro = filtro +"codclase='"+dw_1.getitemstring(1,2) +"' and "
	vuelta++
end if
if cbx_1.checked then
	filtro = filtro + " lower(descripcion) like '"+lower(sle_1.text)+"%'"
else
	filtro = " lower(descripcion) like '"+lower(sle_1.text)+"%'"
end if
dw_2.setfilter(filtro)
dw_2.filter()
dw_2.sort()
st_1.text=string(dw_2.rowcount())+' Registros'

end subroutine

event open;ist_m=message.powerobjectparm
dw_2.retrieve(sex_busca)
dw_2.setsort("#1 a")
filtrar(2)

end event

on w_busca_med_x_gen.create
this.cb_cancel=create cb_cancel
this.cb_aceptar=create cb_aceptar
this.dw_2=create dw_2
this.st_1=create st_1
this.st_5=create st_5
this.st_3=create st_3
this.st_2=create st_2
this.sle_1=create sle_1
this.dw_1=create dw_1
this.st_4=create st_4
this.cbx_1=create cbx_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_cancel,&
this.cb_aceptar,&
this.dw_2,&
this.st_1,&
this.st_5,&
this.st_3,&
this.st_2,&
this.sle_1,&
this.dw_1,&
this.st_4,&
this.cbx_1,&
this.gb_1,&
this.gb_2}
end on

on w_busca_med_x_gen.destroy
destroy(this.cb_cancel)
destroy(this.cb_aceptar)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.dw_1)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_cancel from picturebutton within w_busca_med_x_gen
event mousemove pbm_mousemove
integer x = 1504
integer y = 1384
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+A]"
end type

event clicked;close(f_vent_padre(this))
end event

type cb_aceptar from picturebutton within w_busca_med_x_gen
event mousemove pbm_mousemove
integer x = 1344
integer y = 1384
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_2.triggerevent(doubleclicked!)
end event

type dw_2 from datawindow within w_busca_med_x_gen
integer x = 46
integer y = 612
integer width = 3003
integer height = 736
integer taborder = 60
string dragicon = "none!"
string dataobject = "dw_medica_generic"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.type = "text" then 
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
end if
end event

event doubleclicked;if rowcount()<1  then return
if isvalid(ist_m) then
	if isvalid(ist_m.dw) then//si viene este parametro lo carga en este datawindow
		long fila
		if ist_m.dw.dataobject='dw_plan_med' or ist_m.dw.dataobject='dw_tarifa_med' then
			if ist_m.dw.find("c_medica='"+getitemstring(getrow(),"c_medica")+"'",1,ist_m.dw.rowcount())=0 then
				fila=ist_m.dw.insertrow(0)
				ist_m.dw.scrollToRow(fila)
				ist_m.dw.setitem(fila,ist_m.campo,ist_m.valor)
				ist_m.dw.setitem(fila,"c_medica",getitemstring(getrow(),"c_medica"))
				ist_m.dw.setitem(fila,"medicamento",left(getitemstring(getrow(),"medicamento"),250))
				ist_m.dw.setitem(fila,"via",getitemstring(getrow(),"via"))
			end if
		else
			fila=ist_m.pbut.event clicked()
			ist_m.dw.setitem(fila,ist_m.campo,getitemstring(getrow(),'c_medica'))
			ist_m.dw.setcolumn(ist_m.campo)
			ist_m.dw.triggerevent(itemchanged!)
			ist_m.dw.setfocus()
			return
		end if
	end if
	if isvalid(ist_m.sle) then//si viene este parametro lo carga en este sle
		ist_m.sle.text=getitemstring(getrow(),'codgenerico')
		ist_m.sle.triggerevent(modified!)
		return
	end if
end if
//si no viene ninguno de los parametros anterioes, retorna la estructura
st_med.cmedica=getitemstring(getrow(),'codgenerico')
st_med.medicamento=left(getitemstring(getrow(),'descripcion'),250)
st_med.pos=getitemstring(getrow(),'pos')
st_med.via=getitemstring(getrow(),'via')
//st_med.formaf=getitemstring(getrow(),'formaf')
closewithreturn(f_vent_padre(this),st_med)



end event

event constructor;settransobject(SQLCA)
end event

type st_1 from statictext within w_busca_med_x_gen
integer x = 2464
integer y = 504
integer width = 576
integer height = 76
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_5 from statictext within w_busca_med_x_gen
integer x = 2464
integer y = 448
integer width = 471
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Número de registros:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_busca_med_x_gen
integer x = 1353
integer y = 452
integer width = 1024
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Puede Utilizar el caracter ~'%~' como comodín en cualquier parte de la cadena a buscar."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_busca_med_x_gen
integer x = 59
integer y = 540
integer width = 896
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por descripción de Genérico"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_busca_med_x_gen
event teclear pbm_keyup
integer x = 55
integer y = 452
integer width = 1275
integer height = 88
integer taborder = 50
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event teclear;//
filtrar(4)
end event

type dw_1 from datawindow within w_busca_med_x_gen
integer x = 101
integer y = 68
integer width = 2222
integer height = 264
integer taborder = 20
string dragicon = "none!"
string dataobject = "dw_combo_grup_clase"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
choose case getcolumn()
	case 1
		setitem(1,2,"")
		idw_clase.retrieve(data)
		if cbx_1.checked then filtrar(1)
	case 2
		if cbx_1.checked then filtrar(2)
end choose
end event

event constructor;settransobject(SQLCA)
getchild('codclase',idw_clase)
idw_clase.settransobject(sqlca)
insertrow(1)
end event

type st_4 from statictext within w_busca_med_x_gen
integer x = 2414
integer y = 216
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "para búsqueda"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_busca_med_x_gen
integer x = 2327
integer y = 160
integer width = 475
integer height = 72
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tener en cuenta "
end type

event clicked;filtrar(4)
end event

type gb_1 from groupbox within w_busca_med_x_gen
integer x = 23
integer y = 16
integer width = 2793
integer height = 352
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agrupaciones de los medicamentos"
end type

type gb_2 from groupbox within w_busca_med_x_gen
integer x = 23
integer y = 388
integer width = 3049
integer height = 980
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medicamentos que cumplen la condición"
end type

