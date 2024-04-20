$PBExportHeader$w_busca_med.srw
forward
global type w_busca_med from window
end type
type st_7 from statictext within w_busca_med
end type
type st_6 from statictext within w_busca_med
end type
type st_4 from statictext within w_busca_med
end type
type cb_cancel from picturebutton within w_busca_med
end type
type cb_aceptar from picturebutton within w_busca_med
end type
type dw_2 from datawindow within w_busca_med
end type
type st_1 from statictext within w_busca_med
end type
type st_5 from statictext within w_busca_med
end type
type st_3 from statictext within w_busca_med
end type
type st_2 from statictext within w_busca_med
end type
type sle_1 from singlelineedit within w_busca_med
end type
type dw_1 from datawindow within w_busca_med
end type
type cbx_1 from checkbox within w_busca_med
end type
type gb_1 from groupbox within w_busca_med
end type
type gb_2 from groupbox within w_busca_med
end type
end forward

global type w_busca_med from window
integer width = 3890
integer height = 1688
boolean titlebar = true
string title = "Buscar Medicamento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
event filtrar pbm_open
st_7 st_7
st_6 st_6
st_4 st_4
cb_cancel cb_cancel
cb_aceptar cb_aceptar
dw_2 dw_2
st_1 st_1
st_5 st_5
st_3 st_3
st_2 st_2
sle_1 sle_1
dw_1 dw_1
cbx_1 cbx_1
gb_1 gb_1
gb_2 gb_2
end type
global w_busca_med w_busca_med

type variables
datawindowchild subclase,grupo
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
	if dw_1.getitemstring(1,1)<>"" then filtro = filtro + "codclase='" + dw_1.getitemstring(1,1) +"' and "		
	vuelta++
end if
if vuelta <= nivel then 
	if dw_1.getitemstring(1,2)<>"" then filtro = filtro +"codsubclase='"+dw_1.getitemstring(1,2) +"' and "
	vuelta++
end if
if vuelta <= nivel then 
	if dw_1.getitemstring(1,3)<>"" then filtro = filtro + "codgrupo='"+dw_1.getitemstring(1,3) +"' and "
	vuelta++
end if
if cbx_1.checked then
	filtro = filtro + " lower(medicamento) like '"+lower(sle_1.text)+"%'"
else
	filtro = " lower(medicamento) like '"+lower(sle_1.text)+"%'"
end if
dw_2.setfilter(filtro)
dw_2.filter()
dw_2.sort()
st_1.text=string(dw_2.rowcount())+' Registros'

end subroutine

event open;ist_m=message.powerobjectparm
dw_1.settransobject(SQLCA)
dw_1.getchild('codsubclase',subclase)
dw_1.getchild('codgrupo',grupo)
subclase.settransobject(sqlca)
grupo.settransobject(sqlca)
subclase.retrieve("%")
grupo.retrieve("%","%")
dw_1.retrieve()
subclase.reset()
grupo.reset()
dw_1.setitem(1,1,"")
dw_1.setitem(1,2,"")
dw_1.setitem(1,3,"")
//if not isValid(ist_m) then
if  ist_m.origen<>'1' then
	string  l_i_alm_urg,l_i_alm_hosp ,l_i_alm_amb 
	if ls_pro=32 THEN	
	 	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, l_i_alm_urg )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, l_i_alm_hosp )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, l_i_alm_amb )
	end if
	if ls_pro=64 THEN	
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, l_i_alm_urg )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, l_i_alm_hosp )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, l_i_alm_amb )
	end if
	dw_2.DataObject ='dw_medtodos'
	dw_2.settransobject(SQLCA)

	if not isnull( l_i_alm_urg) then  
		dw_2.retrieve(l_i_alm_urg,sex_busca)
	 else
		 if not isnull( l_i_alm_hosp ) then  
			dw_2.retrieve(l_i_alm_hosp,sex_busca)
		 else  
			  dw_2.retrieve( l_i_alm_amb,sex_busca)
		end if
	end if
else
	if ist_m.origen='1' then
		dw_2.DataObject ='dw_medtodos_cext'
		dw_2.settransobject(SQLCA)
		dw_2.retrieve(sex_busca)
	else
		dw_2.DataObject ='dw_medtodos'
		dw_2.settransobject(SQLCA)
		dw_2.retrieve(ist_m.alm_cext,sex_busca)
	end if
end If
dw_2.setsort("#1 a")
filtrar(4)

end event

on w_busca_med.create
this.st_7=create st_7
this.st_6=create st_6
this.st_4=create st_4
this.cb_cancel=create cb_cancel
this.cb_aceptar=create cb_aceptar
this.dw_2=create dw_2
this.st_1=create st_1
this.st_5=create st_5
this.st_3=create st_3
this.st_2=create st_2
this.sle_1=create sle_1
this.dw_1=create dw_1
this.cbx_1=create cbx_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_7,&
this.st_6,&
this.st_4,&
this.cb_cancel,&
this.cb_aceptar,&
this.dw_2,&
this.st_1,&
this.st_5,&
this.st_3,&
this.st_2,&
this.sle_1,&
this.dw_1,&
this.cbx_1,&
this.gb_1,&
this.gb_2}
end on

on w_busca_med.destroy
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.cb_cancel)
destroy(this.cb_aceptar)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.dw_1)
destroy(this.cbx_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type st_7 from statictext within w_busca_med
boolean visible = false
integer x = 3296
integer y = 1412
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 10789024
string text = "Inactivo"
boolean focusrectangle = false
end type

type st_6 from statictext within w_busca_med
boolean visible = false
integer x = 2921
integer y = 1412
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Activo"
boolean focusrectangle = false
end type

type st_4 from statictext within w_busca_med
boolean visible = false
integer x = 2578
integer y = 1412
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
string text = "No Existencia"
boolean focusrectangle = false
end type

event constructor;backColor=rgb(255,200,200)
end event

type cb_cancel from picturebutton within w_busca_med
event mousemove pbm_mousemove
integer x = 2089
integer y = 1412
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

type cb_aceptar from picturebutton within w_busca_med
event mousemove pbm_mousemove
integer x = 1929
integer y = 1408
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

type dw_2 from datawindow within w_busca_med
integer x = 46
integer y = 768
integer width = 3694
integer height = 592
integer taborder = 60
string dragicon = "none!"
string dataobject = "dw_medtodos"
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

event doubleclicked;long fila
if rowcount()<1  then return
if isvalid(ist_m) then
	if isvalid(ist_m.dw) then//si viene este parametro lo carga en este datawindow
		if ist_m.dw.dataobject='dw_plan_medica' or ist_m.dw.dataobject='dw_tarifa_med' then
			//if ist_m.dw.find("c_medica='"+getitemstring(getrow(),"c_medica")+"'",1,ist_m.dw.rowcount())=0 then
				fila=ist_m.dw.insertrow(0)
				ist_m.dw.scrollToRow(fila)
				ist_m.dw.setfocus()
				ist_m.dw.setitem(fila,ist_m.campo,ist_m.valor)
				ist_m.dw.setitem(fila,"c_medica",getitemstring(getrow(),"c_medica"))
				ist_m.dw.setitem(fila,"medicamento",left(getitemstring(getrow(),"medicamento"),250))
			//end if
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
		ist_m.sle.text=getitemstring(getrow(),'c_medica')
		ist_m.sle.triggerevent(modified!)
		return
	end if
	// carga autorizaciones
	if isvalid(ist_m.dw_autoriza) then
		int l_fila,l_item
		l_item=ist_m.dw_autoriza.rowcount()
		if isnull(l_item) then l_item=0
		l_item=l_item+1
		l_fila=ist_m.dw_autoriza.insertrow(0)
		ist_m.dw_autoriza.SetItem(l_fila,'item',l_item)
		ist_m.dw_autoriza.SetItem(l_fila,'c_medica',getitemstring(getrow(),"c_medica"))
		ist_m.dw_autoriza.SetItem(l_fila,'solicitada',1)
		ist_m.dw_autoriza.SetItem(l_fila,'medicamento',left(getitemstring(getrow(),"medicamento"),250))
	end if
	// alergias
	if isvalid(ist_m.dw_alergia) then
		l_fila=ist_m.dw_alergia.insertrow(0)
		ist_m.dw_alergia.SetItem(l_fila,'cod_tipoa',ist_m.campo)
		ist_m.dw_alergia.SetItem(l_fila,'cod_tipo',ist_m.tipo)
		ist_m.dw_alergia.SetItem(l_fila,'cod_alergia',ist_m.valor)
		ist_m.dw_alergia.SetItem(l_fila,'c_medica',getitemstring(getrow(),"c_medica"))
		ist_m.dw_alergia.SetItem(l_fila,'medicamento',left(getitemstring(getrow(),"medicamento"),250))
	end if
end if
//si no viene ninguno de los parametros anterioes, retorna la estructura
st_med.cmedica=getitemstring(getrow(),'c_medica')
st_med.medicamento=getitemstring(getrow(),'medicamento')
st_med.pos=getitemstring(getrow(),'pos')
st_med.formaf=getitemstring(getrow(),'formaf')
closewithreturn(f_vent_padre(this),st_med)



end event

type st_1 from statictext within w_busca_med
integer x = 3026
integer y = 660
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

type st_5 from statictext within w_busca_med
integer x = 3026
integer y = 604
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

type st_3 from statictext within w_busca_med
integer x = 1783
integer y = 608
integer width = 1147
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

type st_2 from statictext within w_busca_med
integer x = 59
integer y = 696
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
string text = "Buscar por descripción de Medicamento"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_busca_med
event teclear pbm_keyup
integer x = 55
integer y = 608
integer width = 1705
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

type dw_1 from datawindow within w_busca_med
integer x = 101
integer y = 68
integer width = 2226
integer height = 436
integer taborder = 20
string dragicon = "none!"
string dataobject = "dw_med_filtro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
choose case this.getcolumn()
	case 1
		this.setitem(1,2,"")
		this.setitem(1,3,"")
		subclase.retrieve(this.getitemstring(1,1))
		grupo.reset()
		if cbx_1.checked then filtrar(1)
	case 2
		this.setitem(1,3,"")
		grupo.retrieve(this.getitemstring(1,1),this.getitemstring(1,2))
		if cbx_1.checked then filtrar(2)
	case 3
		if cbx_1.checked then filtrar(3)
end choose
end event

type cbx_1 from checkbox within w_busca_med
integer x = 2377
integer y = 380
integer width = 773
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
string text = "Tener en cuenta para búsqueda"
end type

event clicked;filtrar(4)
end event

type gb_1 from groupbox within w_busca_med
integer x = 32
integer y = 20
integer width = 3749
integer height = 496
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

type gb_2 from groupbox within w_busca_med
integer x = 23
integer y = 536
integer width = 3781
integer height = 852
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

