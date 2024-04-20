$PBExportHeader$w_planes.srw
forward
global type w_planes from window
end type
type dw_1 from datawindow within w_planes
end type
type tab_1 from tab within w_planes
end type
type tp_1 from userobject within tab_1
end type
type pb_del_grupo from picturebutton within tp_1
end type
type pb_ad_grup from picturebutton within tp_1
end type
type dw_plan_grupo from datawindow within tp_1
end type
type dw_grupos from datawindow within tp_1
end type
type gb_1 from groupbox within tp_1
end type
type gb_2 from groupbox within tp_1
end type
type tp_1 from userobject within tab_1
pb_del_grupo pb_del_grupo
pb_ad_grup pb_ad_grup
dw_plan_grupo dw_plan_grupo
dw_grupos dw_grupos
gb_1 gb_1
gb_2 gb_2
end type
type tp_2 from userobject within tab_1
end type
type pb_del_subgrp from picturebutton within tp_2
end type
type pb_ad_subgrp from picturebutton within tp_2
end type
type st_3 from statictext within tp_2
end type
type dw_plan_subgrp from datawindow within tp_2
end type
type dw_subgrp from datawindow within tp_2
end type
type gb_3 from groupbox within tp_2
end type
type gb_4 from groupbox within tp_2
end type
type tp_2 from userobject within tab_1
pb_del_subgrp pb_del_subgrp
pb_ad_subgrp pb_ad_subgrp
st_3 st_3
dw_plan_subgrp dw_plan_subgrp
dw_subgrp dw_subgrp
gb_3 gb_3
gb_4 gb_4
end type
type tp_3 from userobject within tab_1
end type
type pb_del_categ from picturebutton within tp_3
end type
type pb_ad_categ from picturebutton within tp_3
end type
type dw_plan_categ from datawindow within tp_3
end type
type dw_categor from datawindow within tp_3
end type
type gb_5 from groupbox within tp_3
end type
type gb_6 from groupbox within tp_3
end type
type tp_3 from userobject within tab_1
pb_del_categ pb_del_categ
pb_ad_categ pb_ad_categ
dw_plan_categ dw_plan_categ
dw_categor dw_categor
gb_5 gb_5
gb_6 gb_6
end type
type tp_4 from userobject within tab_1
end type
type dw_plan_proce from datawindow within tp_4
end type
type pb_del_proc from picturebutton within tp_4
end type
type pb_ad_proc from picturebutton within tp_4
end type
type dw_proced from datawindow within tp_4
end type
type gb_7 from groupbox within tp_4
end type
type gb_8 from groupbox within tp_4
end type
type tp_4 from userobject within tab_1
dw_plan_proce dw_plan_proce
pb_del_proc pb_del_proc
pb_ad_proc pb_ad_proc
dw_proced dw_proced
gb_7 gb_7
gb_8 gb_8
end type
type tab_1 from tab within w_planes
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
end type
type pb_guardar from picturebutton within w_planes
end type
type dw_plan_detalle from datawindow within w_planes
end type
type st_1 from statictext within w_planes
end type
type dw_plan from datawindow within w_planes
end type
end forward

global type w_planes from window
integer width = 4878
integer height = 2244
boolean titlebar = true
string title = "Configuración de Planes de Procedimientos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_tarpro.ico"
dw_1 dw_1
tab_1 tab_1
pb_guardar pb_guardar
dw_plan_detalle dw_plan_detalle
st_1 st_1
dw_plan dw_plan
end type
global w_planes w_planes

type variables
string c_grupo,c_subgrp,c_categ,c_proc,c_plan,v_cups
boolean cambios
end variables

on w_planes.create
this.dw_1=create dw_1
this.tab_1=create tab_1
this.pb_guardar=create pb_guardar
this.dw_plan_detalle=create dw_plan_detalle
this.st_1=create st_1
this.dw_plan=create dw_plan
this.Control[]={this.dw_1,&
this.tab_1,&
this.pb_guardar,&
this.dw_plan_detalle,&
this.st_1,&
this.dw_plan}
end on

on w_planes.destroy
destroy(this.dw_1)
destroy(this.tab_1)
destroy(this.pb_guardar)
destroy(this.dw_plan_detalle)
destroy(this.st_1)
destroy(this.dw_plan)
end on

event open;dw_1.settransobject(SQLCA)
dw_1.insertrow(1)
dw_plan.retrieve()
cambios=false
end event

type dw_1 from datawindow within w_planes
integer x = 41
integer y = 240
integer width = 1129
integer height = 140
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_vcups"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;v_cups=data
tab_1.tp_1.dw_grupos.retrieve(v_cups,'%')
tab_1.tp_4.dw_plan_proce.retrieve(v_cups,c_plan)
tab_1.tp_3.dw_plan_categ.retrieve(v_cups,c_plan)
tab_1.tp_2.dw_plan_subgrp.retrieve(v_cups,c_plan)
tab_1.tp_1.dw_plan_grupo.retrieve(v_cups,c_plan)

end event

type tab_1 from tab within w_planes
event create ( )
event destroy ( )
integer x = 50
integer y = 392
integer width = 4773
integer height = 1740
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.tp_4=create tp_4
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3,&
this.tp_4}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
destroy(this.tp_4)
end on

type tp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4736
integer height = 1612
long backcolor = 67108864
string text = "Grupos"
long tabtextcolor = 33554432
string picturename = "grupo.ico"
long picturemaskcolor = 536870912
pb_del_grupo pb_del_grupo
pb_ad_grup pb_ad_grup
dw_plan_grupo dw_plan_grupo
dw_grupos dw_grupos
gb_1 gb_1
gb_2 gb_2
end type

on tp_1.create
this.pb_del_grupo=create pb_del_grupo
this.pb_ad_grup=create pb_ad_grup
this.dw_plan_grupo=create dw_plan_grupo
this.dw_grupos=create dw_grupos
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.pb_del_grupo,&
this.pb_ad_grup,&
this.dw_plan_grupo,&
this.dw_grupos,&
this.gb_1,&
this.gb_2}
end on

on tp_1.destroy
destroy(this.pb_del_grupo)
destroy(this.pb_ad_grup)
destroy(this.dw_plan_grupo)
destroy(this.dw_grupos)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type pb_del_grupo from picturebutton within tp_1
string tag = "&Borrar grupo del plan"
integer x = 2409
integer y = 728
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "             &"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "&Borrar grupo del plan"
end type

event clicked;dw_plan_grupo.deleterow(dw_plan_grupo.getrow())
if dw_plan_grupo.update()<1 then
	rollback;
	dw_plan.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_ad_grup from picturebutton within tp_1
string tag = "Agregar &grupos al plan"
integer x = 2560
integer y = 724
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "           &g"
boolean originalsize = true
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Agregar &grupos al plan"
end type

event clicked;if dw_plan_grupo.visible=false then return
string c_grupoadic,grupo
long fila
fila=dw_grupos.getrow()
c_grupoadic=dw_grupos.getitemstring(fila,2)
grupo=dw_grupos.getitemstring(fila,1)
c_grupo=grupo
fila=dw_plan_grupo.find("cd_grupo='"+c_grupoadic+"'",1,dw_plan_grupo.rowcount())
if fila=0 then
	cambios=true
	fila=dw_plan_grupo.insertrow(0)
	dw_plan_grupo.setitem(fila,1,dw_plan.getitemstring(dw_plan.getrow(),1))
	dw_plan_grupo.setitem(fila,2,v_cups)
	dw_plan_grupo.setitem(fila,3,c_grupoadic)
	dw_plan_grupo.setitem(fila,4,grupo)
	dw_plan_grupo.setitem(fila,5,"1")
end if
if fila<>dw_plan_grupo.getrow() then
	dw_plan_grupo.scrolltorow(fila)
else
	dw_plan_grupo.triggerevent(rowfocuschanged!)
end if

end event

type dw_plan_grupo from datawindow within tp_1
event revisa_todos pbm_custom01
integer x = 50
integer y = 76
integer width = 4608
integer height = 612
integer taborder = 40
string title = "none"
string dataobject = "dw_plan_grupos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event revisa_todos;if this.getrow()<1 then return
if this.getitemstring(this.getrow(),"todos")="1" then
	tab_1.tp_2.dw_plan_subgrp.visible=false
	tab_1.tp_2.dw_subgrp.visible=false
	tab_1.tp_3.dw_plan_categ.visible=false
	tab_1.tp_3.dw_categor.visible=false
	tab_1.tp_4.dw_plan_proce.visible=false
	tab_1.tp_4.dw_proced.visible=false
else
	tab_1.tp_2.dw_plan_subgrp.visible=true
	tab_1.tp_2.dw_subgrp.visible=true
	tab_1.tp_2.dw_plan_subgrp.triggerevent(rowfocuschanged!)
	tab_1.tp_2.dw_plan_subgrp.triggerevent("revisa_todos")
end if

end event

event itemchanged;this.accepttext()
cambios=true
if this.getcolumnname()="todos" then 
	if getitemstring(getrow(),'todos')='0' and data='1' then
		choose case messagebox('Atención', 'Esta operación eliminara todos los hijos',question!,okcancel!,1)
			case 1
				delete from planproced where codplan=:c_plan and cod_version=:v_cups and cd_grupo=:c_grupo;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error planproced",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If
				delete from plancate where codplan=:c_plan and cod_version=:v_cups and cd_grupo=:c_grupo;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error plancate",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If				
				delete from plansubgrupo where codplan=:c_plan and cod_version=:v_cups and cd_grupo=:c_grupo;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error plansubgrupo",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If
				this.setitem(this.getrow(),"todos",data)
			case 2
				this.setitem(this.getrow(),"todos",'0')
		end choose
	else
		this.setitem(this.getrow(),"todos",data)
	end if
	this.triggerevent("revisa_todos")
end if
end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

event rowfocuschanged;long j
j=this.getrow()
if j<1 then return
this.selectrow(j,true)
c_grupo=this.getitemstring(j,3)
tab_1.tp_2.dw_subgrp.retrieve(v_cups,c_grupo)
if not isnull(c_grupo) then
	tab_1.tp_2.dw_plan_subgrp.setfilter("")
	tab_1.tp_2.dw_plan_subgrp.filter()
	if tab_1.tp_2.dw_plan_subgrp.rowcount()>0 then
		tab_1.tp_2.dw_plan_subgrp.setfilter("cd_grupo='"+c_grupo+"'")
		tab_1.tp_2.dw_plan_subgrp.filter()
		tab_1.tp_2.dw_plan_subgrp.scrolltorow(1)
		tab_1.tp_2.dw_plan_subgrp.triggerevent(rowfocuschanged!)
	end if
	this.triggerevent("revisa_todos")
end if
end event

event rowfocuschanging;this.selectrow(this.getrow(),false)
end event

event constructor;this.settransobject(sqlca)
end event

type dw_grupos from datawindow within tp_1
integer x = 50
integer y = 908
integer width = 4613
integer height = 628
integer taborder = 30
string title = "none"
string dataobject = "dw_pgrupo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow()<1 then return
pb_ad_grup.triggerevent(clicked!)
end event

event rowfocuschanged;if this.getrow()<1 then return
this.selectrow(this.getrow(),true)
end event

event rowfocuschanging;this.selectrow(currentrow,false)
end event

event constructor;this.settransobject(sqlca)
end event

type gb_1 from groupbox within tp_1
integer x = 18
integer y = 844
integer width = 4690
integer height = 724
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos disponibles:"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within tp_1
integer x = 23
integer width = 4690
integer height = 720
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos del plan:"
borderstyle borderstyle = styleraised!
end type

type tp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4736
integer height = 1612
long backcolor = 67108864
string text = "Subgrupos"
long tabtextcolor = 33554432
string picturename = "sgrupo.ico"
long picturemaskcolor = 536870912
pb_del_subgrp pb_del_subgrp
pb_ad_subgrp pb_ad_subgrp
st_3 st_3
dw_plan_subgrp dw_plan_subgrp
dw_subgrp dw_subgrp
gb_3 gb_3
gb_4 gb_4
end type

on tp_2.create
this.pb_del_subgrp=create pb_del_subgrp
this.pb_ad_subgrp=create pb_ad_subgrp
this.st_3=create st_3
this.dw_plan_subgrp=create dw_plan_subgrp
this.dw_subgrp=create dw_subgrp
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.pb_del_subgrp,&
this.pb_ad_subgrp,&
this.st_3,&
this.dw_plan_subgrp,&
this.dw_subgrp,&
this.gb_3,&
this.gb_4}
end on

on tp_2.destroy
destroy(this.pb_del_subgrp)
destroy(this.pb_ad_subgrp)
destroy(this.st_3)
destroy(this.dw_plan_subgrp)
destroy(this.dw_subgrp)
destroy(this.gb_3)
destroy(this.gb_4)
end on

type pb_del_subgrp from picturebutton within tp_2
string tag = "Borrar Subgrupo del Grupo"
integer x = 2409
integer y = 728
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
end type

event clicked;dw_plan_subgrp.deleterow(dw_plan_subgrp.getrow())
if dw_plan_subgrp.update()<1 then
	rollback;
	tab_1.tp_1.dw_plan_grupo.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_ad_subgrp from picturebutton within tp_2
string tag = "Agregar Subgrupo al Grupo"
integer x = 2555
integer y = 728
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
end type

event clicked;if dw_plan_subgrp.visible=false then return
string c_subgrpadic,subgrp
long fila
fila=dw_subgrp.getrow()
c_subgrpadic=dw_subgrp.getitemstring(fila,3)
subgrp=dw_subgrp.getitemstring(fila,4)
fila=dw_plan_subgrp.find("cd_grupo='"+c_grupo+"' and cd_subgrupo='"+c_subgrpadic+"'",1,dw_plan_subgrp.rowcount())
if fila=0 then 
	cambios=true
	fila=dw_plan_subgrp.insertrow(0)
	dw_plan_subgrp.setitem(fila,1,dw_plan.getitemstring(dw_plan.getrow(),1))
	dw_plan_subgrp.setitem(fila,2,v_cups)
	dw_plan_subgrp.setitem(fila,3,c_grupo)
	dw_plan_subgrp.setitem(fila,4,c_subgrpadic)
	dw_plan_subgrp.setitem(fila,5,subgrp)
	dw_plan_subgrp.setitem(fila,6,"1")
end if
if fila<>dw_plan_subgrp.getrow() then
	dw_plan_subgrp.scrolltorow(fila)
else
	dw_plan_subgrp.triggerevent(rowfocuschanged!)
end if
end event

type st_3 from statictext within tp_2
integer x = -370
integer y = -544
integer width = 512
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subgrupos del plan:"
boolean focusrectangle = false
end type

type dw_plan_subgrp from datawindow within tp_2
event revisa_todos pbm_custom01
integer x = 50
integer y = 68
integer width = 4626
integer height = 620
integer taborder = 60
string title = "none"
string dataobject = "dw_plan_subgrp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event revisa_todos;if this.getrow()<1 then return
if this.getitemstring(this.getrow(),"todos")="1" then
	tab_1.tp_3.dw_plan_categ.visible=false
	tab_1.tp_3.dw_categor.visible=false
	tab_1.tp_4.dw_plan_proce.visible=false
	tab_1.tp_4.dw_proced.visible=false
else
	tab_1.tp_3.dw_plan_categ.visible=true
	tab_1.tp_3.dw_categor.visible=true
	tab_1.tp_3.dw_plan_categ.triggerevent(rowfocuschanged!)
	tab_1.tp_3.dw_plan_categ.triggerevent("revisa_todos")
end if

end event

event itemchanged;this.accepttext()
cambios=true
if this.getcolumnname()="todos" then 
		if getitemstring(getrow(),'todos')='0' and data='1' then
		choose case messagebox('Atención', 'Esta operación eliminara todos los hijos',question!,okcancel!,1)
			case 1
				delete from planproced where codplan=:c_plan and cod_version=:v_cups and cd_grupo=:c_grupo and cd_subgrupo=:c_subgrp;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error planproced",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If
				delete from plancate where codplan=:c_plan and cod_version=:v_cups and cd_grupo=:c_grupo and cd_subgrupo=:c_subgrp;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error plancate",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If				
				this.setitem(this.getrow(),"todos",data)
			case 2
				this.setitem(this.getrow(),"todos",'0')
		end choose
	else
		this.setitem(this.getrow(),"todos",data)
	end if
	this.triggerevent("revisa_todos")
end if
end event

event rowfocuschanged;long j
j=this.getrow()
if j<1 then return
this.selectrow(j,true)
c_subgrp=this.getitemstring(j,4)
tab_1.tp_3.dw_categor.retrieve(v_cups,c_grupo,c_subgrp)
if not isnull(c_subgrp) then 
	tab_1.tp_3.dw_plan_categ.setfilter("")
	tab_1.tp_3.dw_plan_categ.filter()
	if tab_1.tp_3.dw_plan_categ.rowcount()>0 then
		tab_1.tp_3.dw_plan_categ.setfilter("cd_grupo='"+c_grupo+"' and cd_subgrupo='"+c_subgrp+"'")
		tab_1.tp_3.dw_plan_categ.filter()
		tab_1.tp_3.dw_plan_categ.scrolltorow(1)
		tab_1.tp_3.dw_plan_categ.triggerevent(rowfocuschanged!)
	end if
end if
this.triggerevent("revisa_todos")
end event

event rowfocuschanging;this.selectrow(this.getrow(),false)
end event

event constructor;this.settransobject(sqlca)
end event

type dw_subgrp from datawindow within tp_2
integer x = 59
integer y = 916
integer width = 4622
integer height = 616
integer taborder = 70
string title = "none"
string dataobject = "dw_proc_subgrupo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow()<1 then return
pb_ad_subgrp.triggerevent(clicked!)
end event

event rowfocuschanged;if this.getrow()<1 then return
this.selectrow(this.getrow(),true)
end event

event rowfocuschanging;this.selectrow(currentrow,false)
end event

event constructor;this.settransobject(sqlca)
end event

type gb_3 from groupbox within tp_2
integer x = 23
integer width = 4699
integer height = 720
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subgrupos del plan:"
borderstyle borderstyle = styleraised!
end type

type gb_4 from groupbox within tp_2
integer x = 18
integer y = 844
integer width = 4695
integer height = 724
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subgrupos disponibles:"
borderstyle borderstyle = styleraised!
end type

type tp_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4736
integer height = 1612
long backcolor = 67108864
string text = "Categorias"
long tabtextcolor = 33554432
string picturename = "categoria.ico"
long picturemaskcolor = 536870912
pb_del_categ pb_del_categ
pb_ad_categ pb_ad_categ
dw_plan_categ dw_plan_categ
dw_categor dw_categor
gb_5 gb_5
gb_6 gb_6
end type

on tp_3.create
this.pb_del_categ=create pb_del_categ
this.pb_ad_categ=create pb_ad_categ
this.dw_plan_categ=create dw_plan_categ
this.dw_categor=create dw_categor
this.gb_5=create gb_5
this.gb_6=create gb_6
this.Control[]={this.pb_del_categ,&
this.pb_ad_categ,&
this.dw_plan_categ,&
this.dw_categor,&
this.gb_5,&
this.gb_6}
end on

on tp_3.destroy
destroy(this.pb_del_categ)
destroy(this.pb_ad_categ)
destroy(this.dw_plan_categ)
destroy(this.dw_categor)
destroy(this.gb_5)
destroy(this.gb_6)
end on

type pb_del_categ from picturebutton within tp_3
string tag = "Borrar categoría del Subgrupo"
integer x = 2409
integer y = 724
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
end type

event clicked;dw_plan_categ.deleterow(dw_plan_categ.getrow())
if dw_plan_categ.update()<1 then
	rollback;
	tab_1.tp_2.dw_plan_subgrp.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_ad_categ from picturebutton within tp_3
string tag = "Agregar Categoriía al Subgrupo"
integer x = 2569
integer y = 728
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
end type

event clicked;if dw_plan_categ.visible=false then return
string c_categadic,categ
long fila
fila=dw_categor.getrow()
c_categadic=dw_categor.getitemstring(fila,4)
categ=dw_categor.getitemstring(fila,5)
fila=dw_plan_categ.find("cd_grupo='"+c_grupo+"' and cd_subgrupo='"+c_subgrp+"' and cd_categoria='"+c_categadic+"'",1,dw_plan_categ.rowcount())
if fila=0 then
	cambios=true
	fila=dw_plan_categ.insertrow(0)
	dw_plan_categ.setitem(fila,1,dw_plan.getitemstring(dw_plan.getrow(),1))
	dw_plan_categ.setitem(fila,2,v_cups)
	dw_plan_categ.setitem(fila,3,c_grupo)
	dw_plan_categ.setitem(fila,4,c_subgrp)
	dw_plan_categ.setitem(fila,5,c_categadic)
	dw_plan_categ.setitem(fila,6,categ)
	dw_plan_categ.setitem(fila,7,"1")
end if
if fila<>dw_plan_categ.getrow() then
	dw_plan_categ.scrolltorow(fila)
else
	dw_plan_categ.triggerevent(rowfocuschanged!)
end if
end event

type dw_plan_categ from datawindow within tp_3
event revisa_todos pbm_custom01
integer x = 59
integer y = 64
integer width = 4608
integer height = 624
integer taborder = 70
string title = "none"
string dataobject = "dw_plan_categ"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event revisa_todos;if this.getrow()<1 then return
if this.getitemstring(this.getrow(),"todos")="1" then
	tab_1.tp_4.dw_plan_proce.visible=false
	tab_1.tp_4.dw_proced.visible=false
else
	tab_1.tp_4.dw_plan_proce.visible=true
	tab_1.tp_4.dw_proced.visible=true
	tab_1.tp_4.dw_proced.triggerevent(rowfocuschanged!)
	tab_1.tp_4.dw_proced.triggerevent("revisa_todos")
end if
end event

event itemchanged;this.accepttext()
cambios=true
if this.getcolumnname()="todos" then 
	if getitemstring(getrow(),'todos')='0' and data='1' then
		choose case messagebox('Atención', 'Esta operación eliminara todos los hijos',question!,okcancel!,1)
			case 1
				delete from planproced where codplan=:c_plan and cod_version=:v_cups and cd_grupo=:c_grupo and cd_subgrupo=:c_subgrp and cd_categoria=:c_categ ;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error planproced",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If
				this.setitem(this.getrow(),"todos",data)
			case 2
				this.setitem(this.getrow(),"todos",'0')
		end choose
	else
		this.setitem(this.getrow(),"todos",data)
	end if
	this.triggerevent("revisa_todos")
end if
end event

event rowfocuschanged;long j
j=this.getrow()
if j<1 then return
this.selectrow(this.getrow(),true)
setnull(c_categ)
c_categ=this.getitemstring(j,5)
tab_1.tp_4.dw_proced.retrieve(v_cups,c_grupo,c_subgrp,c_categ)
int jaer
jaer=tab_1.tp_4.dw_proced.rowcount()
if not isnull(c_categ) then
	tab_1.tp_4.dw_plan_proce.setfilter("")
	tab_1.tp_4.dw_plan_proce.filter()
	if tab_1.tp_4.dw_plan_proce.rowcount()>0 then
		tab_1.tp_4.dw_plan_proce.setfilter("cd_grupo='"+c_grupo+"' and cd_subgrupo='"+c_subgrp+"' and cd_categoria='"+c_categ+"'")
		tab_1.tp_4.dw_plan_proce.filter()
		tab_1.tp_4.dw_plan_proce.scrolltorow(1)
		tab_1.tp_4.dw_plan_proce.triggerevent(rowfocuschanged!)
	end if
end if
this.triggerevent("revisa_todos")
end event

event rowfocuschanging;this.selectrow(this.getrow(),false)
end event

event constructor;this.settransobject(sqlca)
end event

type dw_categor from datawindow within tp_3
integer x = 59
integer y = 908
integer width = 4603
integer height = 632
integer taborder = 80
string title = "none"
string dataobject = "dw_categoria"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow()<1 then return
pb_ad_categ.triggerevent(clicked!)
end event

event rowfocuschanged;if this.getrow()<1 then return
this.selectrow(this.getrow(),true)
end event

event rowfocuschanging;this.selectrow(currentrow,false)
end event

event constructor;this.settransobject(sqlca)
end event

type gb_5 from groupbox within tp_3
integer x = 23
integer width = 4690
integer height = 720
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Categorías del plan:"
borderstyle borderstyle = styleraised!
end type

type gb_6 from groupbox within tp_3
integer x = 18
integer y = 844
integer width = 4690
integer height = 724
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Categorías disponibles:"
borderstyle borderstyle = styleraised!
end type

type tp_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4736
integer height = 1612
long backcolor = 67108864
string text = "Procedimiento"
long tabtextcolor = 33554432
string picturename = "scategoria.ico"
long picturemaskcolor = 536870912
dw_plan_proce dw_plan_proce
pb_del_proc pb_del_proc
pb_ad_proc pb_ad_proc
dw_proced dw_proced
gb_7 gb_7
gb_8 gb_8
end type

on tp_4.create
this.dw_plan_proce=create dw_plan_proce
this.pb_del_proc=create pb_del_proc
this.pb_ad_proc=create pb_ad_proc
this.dw_proced=create dw_proced
this.gb_7=create gb_7
this.gb_8=create gb_8
this.Control[]={this.dw_plan_proce,&
this.pb_del_proc,&
this.pb_ad_proc,&
this.dw_proced,&
this.gb_7,&
this.gb_8}
end on

on tp_4.destroy
destroy(this.dw_plan_proce)
destroy(this.pb_del_proc)
destroy(this.pb_ad_proc)
destroy(this.dw_proced)
destroy(this.gb_7)
destroy(this.gb_8)
end on

type dw_plan_proce from datawindow within tp_4
integer x = 55
integer y = 64
integer width = 4585
integer height = 628
integer taborder = 70
string title = "none"
string dataobject = "dw_plan_proced"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_del_proc from picturebutton within tp_4
string tag = "Borrar Procedimiento de la Categoría"
integer x = 2409
integer y = 732
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
end type

event clicked;dw_plan_proce.deleterow(dw_plan_proce.getrow())
if dw_plan_proce.update()<1 then
	rollback;
	tab_1.tp_3.dw_plan_categ.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_ad_proc from picturebutton within tp_4
string tag = "Agregar Procedimiento a la Categoriía"
integer x = 2560
integer y = 732
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
end type

event clicked;if dw_plan_proce.visible=false then return
string c_procedadic,proced
long fila,filab
fila=dw_proced.getrow()
c_procedadic=dw_proced.getitemstring(fila,5)
proced=dw_proced.getitemstring(fila,6)
filab=dw_plan_proce.find("cd_grupo='"+c_grupo+"' and cd_subgrupo='"+c_subgrp+"' and cd_categoria='"+c_categ+"' and codproced='"+c_procedadic+"'",1,dw_plan_proce.rowcount())
if filab=0 then
	cambios=true
	filab=dw_plan_proce.insertrow(0)
	dw_plan_proce.setitem(filab,1,dw_plan.getitemstring(dw_plan.getrow(),1))
	dw_plan_proce.setitem(filab,2,v_cups)
	dw_plan_proce.setitem(filab,3,c_grupo)
	dw_plan_proce.setitem(filab,4,c_subgrp)
	dw_plan_proce.setitem(filab,5,c_categ)
	dw_plan_proce.setitem(filab,6,c_procedadic)
	dw_plan_proce.setitem(filab,7,proced)
	dw_plan_proce.setitem(filab,'cod_cups',dw_proced.getitemstring(fila,'cod_cups'))
end if
if filab<>dw_plan_proce.getrow() then
	dw_plan_proce.scrolltorow(filab)
else
	dw_plan_proce.triggerevent(rowfocuschanged!)
end if
end event

type dw_proced from datawindow within tp_4
integer x = 46
integer y = 908
integer width = 4613
integer height = 628
integer taborder = 80
string title = "none"
string dataobject = "dw_proced"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow()<1 then return
pb_ad_proc.triggerevent(clicked!)
end event

event rowfocuschanged;tab_1.tp_4.dw_plan_proce.visible=true
tab_1.tp_4.dw_proced.visible=true
if this.getrow()<1 then return
this.selectrow(this.getrow(),true)
if this.getrow()<1 then return

end event

event rowfocuschanging;this.selectrow(currentrow,false)
end event

event constructor;this.settransobject(sqlca)
end event

type gb_7 from groupbox within tp_4
integer x = 23
integer width = 4667
integer height = 720
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subcategorias / procedimientos del plan:"
borderstyle borderstyle = styleraised!
end type

type gb_8 from groupbox within tp_4
integer x = 18
integer y = 844
integer width = 4681
integer height = 724
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subcategorias / procedimientos disponibles:"
borderstyle borderstyle = styleraised!
end type

type pb_guardar from picturebutton within w_planes
string tag = "&Guardar Configuración Plan"
integer x = 1856
integer y = 64
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "           &g"
boolean originalsize = true
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
end type

event clicked;if dw_plan_detalle.update()= -1 then
	rollback;
else
	if tab_1.tp_1.dw_plan_grupo.update()= -1 then 
		rollback;
	else
		if tab_1.tp_2.dw_plan_subgrp.update()= -1 then 
			rollback;
		else
			if tab_1.tp_3.dw_plan_categ.update()= -1 then
				rollback;
			else
				if tab_1.tp_4.dw_plan_proce.update()= -1 then
					rollback;
				else
					commit;
					cambios=false
				end if
			end if
		end if
	end if
end if
end event

type dw_plan_detalle from datawindow within w_planes
event revisa_todos pbm_custom01
integer x = 46
integer y = 48
integer width = 1755
integer height = 152
integer taborder = 20
string title = "none"
string dataobject = "dw_plan_detalle"
boolean border = false
boolean livescroll = true
end type

event revisa_todos;if this.getrow()<1 then return
if this.getitemstring(this.getrow(),"todos")="0" then
	tab_1.tp_1.dw_plan_grupo.visible=true
	tab_1.tp_1.dw_grupos.visible=true
	tab_1.tp_1.dw_plan_grupo.triggerevent("revisa_todos")
else
	tab_1.tp_1.dw_plan_grupo.visible=false
	tab_1.tp_1.dw_grupos.visible=false
	tab_1.tp_2.dw_plan_subgrp.visible=false
	tab_1.tp_2.dw_subgrp.visible=false
	tab_1.tp_3.dw_plan_categ.visible=false
	tab_1.tp_3.dw_categor.visible=false
	tab_1.tp_4.dw_plan_proce.visible=false
	tab_1.tp_4.dw_proced.visible=false
end if

end event

event retrieveend;this.triggerevent("revisa_todos")
end event

event itemchanged;this.accepttext()
cambios=true
if this.getcolumnname()="todos" then 
	this.setitem(1,"todos",data)
	this.triggerevent("revisa_todos")
end if
end event

event constructor;this.settransobject(sqlca)
end event

type st_1 from statictext within w_planes
integer x = 2066
integer width = 210
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Planes:"
boolean focusrectangle = false
end type

type dw_plan from datawindow within w_planes
integer x = 2057
integer y = 52
integer width = 2135
integer height = 304
integer taborder = 10
string title = "none"
string dataobject = "dw_plan_resumido"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;tab_1.tp_1.dw_plan_grupo.reset()
if this.getrow()<1 then return
this.selectrow(this.getrow(),true)
v_cups=dw_1.getitemstring(1,1)
c_plan=this.getitemstring(this.getrow(),1)
dw_plan_detalle.retrieve(c_plan)
tab_1.tp_1.dw_grupos.retrieve(v_cups,'%')
tab_1.tp_4.dw_plan_proce.retrieve(v_cups,c_plan)
tab_1.tp_3.dw_plan_categ.retrieve(v_cups,c_plan)
tab_1.tp_2.dw_plan_subgrp.retrieve(v_cups,c_plan)
tab_1.tp_1.dw_plan_grupo.retrieve(v_cups,c_plan)
end event

event rowfocuschanging;if cambios then
	choose case messagebox("Atención","Al plan actual se le realizaron cambios,desea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			pb_guardar.triggerevent(clicked!)
		case 2
			cambios=false
		case 3
			return 1
	end choose
end if
this.selectrow(currentrow,false)
end event

event constructor;this.settransobject(sqlca)
end event

