$PBExportHeader$w_serv_x_cc.srw
forward
global type w_serv_x_cc from window
end type
type dw_1 from datawindow within w_serv_x_cc
end type
type pb_9 from picturebutton within w_serv_x_cc
end type
type dw_ccxuf from datawindow within w_serv_x_cc
end type
type dw_uf from datawindow within w_serv_x_cc
end type
type tab_det1 from tab within w_serv_x_cc
end type
type tp_gr_sbgr from userobject within tab_det1
end type
type dw_grup from datawindow within tp_gr_sbgr
end type
type dw_subgrp from datawindow within tp_gr_sbgr
end type
type st_1 from statictext within tp_gr_sbgr
end type
type st_2 from statictext within tp_gr_sbgr
end type
type dw_gr_rest from datawindow within tp_gr_sbgr
end type
type dw_sbgr_rest from datawindow within tp_gr_sbgr
end type
type st_5 from statictext within tp_gr_sbgr
end type
type st_6 from statictext within tp_gr_sbgr
end type
type pb_1 from picturebutton within tp_gr_sbgr
end type
type pb_2 from picturebutton within tp_gr_sbgr
end type
type pb_3 from picturebutton within tp_gr_sbgr
end type
type pb_4 from picturebutton within tp_gr_sbgr
end type
type tp_gr_sbgr from userobject within tab_det1
dw_grup dw_grup
dw_subgrp dw_subgrp
st_1 st_1
st_2 st_2
dw_gr_rest dw_gr_rest
dw_sbgr_rest dw_sbgr_rest
st_5 st_5
st_6 st_6
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
end type
type tp_cat_proc from userobject within tab_det1
end type
type dw_cat from datawindow within tp_cat_proc
end type
type dw_proc from datawindow within tp_cat_proc
end type
type st_3 from statictext within tp_cat_proc
end type
type st_4 from statictext within tp_cat_proc
end type
type dw_cat_rest from datawindow within tp_cat_proc
end type
type dw_proc_rest from datawindow within tp_cat_proc
end type
type st_7 from statictext within tp_cat_proc
end type
type st_8 from statictext within tp_cat_proc
end type
type pb_5 from picturebutton within tp_cat_proc
end type
type pb_6 from picturebutton within tp_cat_proc
end type
type pb_7 from picturebutton within tp_cat_proc
end type
type pb_8 from picturebutton within tp_cat_proc
end type
type tp_cat_proc from userobject within tab_det1
dw_cat dw_cat
dw_proc dw_proc
st_3 st_3
st_4 st_4
dw_cat_rest dw_cat_rest
dw_proc_rest dw_proc_rest
st_7 st_7
st_8 st_8
pb_5 pb_5
pb_6 pb_6
pb_7 pb_7
pb_8 pb_8
end type
type tab_det1 from tab within w_serv_x_cc
tp_gr_sbgr tp_gr_sbgr
tp_cat_proc tp_cat_proc
end type
end forward

global type w_serv_x_cc from window
integer width = 5216
integer height = 2392
boolean titlebar = true
string title = "Servicios por Centros de Costo"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_tarpro.ico"
boolean center = true
dw_1 dw_1
pb_9 pb_9
dw_ccxuf dw_ccxuf
dw_uf dw_uf
tab_det1 tab_det1
end type
global w_serv_x_cc w_serv_x_cc

type variables
datawindowchild idw_ccuf
string i_uf,i_cc,i_grupo,i_subgrp,i_cat,v_cups
boolean i_cam_grup,i_cam_subgrp,i_cam_categ,i_cam_proc
end variables

forward prototypes
public subroutine reset_x_centro (integer p_nivel)
public subroutine ocultar (integer p_nivel, string p_mostrar)
public function integer guardar ()
end prototypes

public subroutine reset_x_centro (integer p_nivel);if p_nivel<=0 then 
	dw_ccxuf.setitem(1,1,'')
	idw_ccuf.reset()
end if
if p_nivel<=1 then 
	tab_det1.tp_gr_sbgr.dw_grup.reset()
	tab_det1.tp_gr_sbgr.dw_gr_rest.reset()
end if
if p_nivel<=2 then 
	tab_det1.tp_gr_sbgr.dw_subgrp.reset()
	tab_det1.tp_gr_sbgr.dw_sbgr_rest.reset()
end if
if p_nivel<=3 then 
	tab_det1.tp_cat_proc.dw_cat.reset()
	tab_det1.tp_cat_proc.dw_cat_rest.reset()
end if
if p_nivel<=4 then 
	tab_det1.tp_cat_proc.dw_proc.reset()
	tab_det1.tp_cat_proc.dw_proc_rest.reset()
end if

end subroutine

public subroutine ocultar (integer p_nivel, string p_mostrar);boolean mostrar
if p_mostrar='2' then mostrar=true
if p_nivel<=2 then
	tab_det1.tp_gr_sbgr.dw_subgrp.visible=mostrar
	tab_det1.tp_gr_sbgr.dw_sbgr_rest.visible=mostrar
end if
if p_nivel<=3 then
	tab_det1.tp_cat_proc.dw_cat.visible=mostrar
	tab_det1.tp_cat_proc.dw_cat_rest.visible=mostrar
end if
if p_nivel<=4 then 
	tab_det1.tp_cat_proc.dw_proc.visible=mostrar
	tab_det1.tp_cat_proc.dw_proc_rest.visible=mostrar
end if

end subroutine

public function integer guardar ();if i_cam_grup then
	if tab_det1.tp_gr_sbgr.dw_grup.update(true,false)=-1 then return -1
end if
if i_cam_subgrp then
	if tab_det1.tp_gr_sbgr.dw_subgrp.update(true,false)=-1 then return -1
end if
if i_cam_categ then
	if tab_det1.tp_cat_proc.dw_cat.update(true,false)=-1 then return -1
end if
if i_cam_proc then
	if tab_det1.tp_cat_proc.dw_proc.update(true,false)=-1 then return -1
end if
i_cam_grup=false
i_cam_subgrp=false
i_cam_categ=false
i_cam_proc=false
tab_det1.tp_gr_sbgr.dw_grup.resetupdate()
tab_det1.tp_gr_sbgr.dw_subgrp.resetupdate()
tab_det1.tp_cat_proc.dw_cat.resetupdate()
tab_det1.tp_cat_proc.dw_proc.resetupdate()
return 1
end function

on w_serv_x_cc.create
this.dw_1=create dw_1
this.pb_9=create pb_9
this.dw_ccxuf=create dw_ccxuf
this.dw_uf=create dw_uf
this.tab_det1=create tab_det1
this.Control[]={this.dw_1,&
this.pb_9,&
this.dw_ccxuf,&
this.dw_uf,&
this.tab_det1}
end on

on w_serv_x_cc.destroy
destroy(this.dw_1)
destroy(this.pb_9)
destroy(this.dw_ccxuf)
destroy(this.dw_uf)
destroy(this.tab_det1)
end on

event open;dw_1.settransobject(SQLCA)
dw_1.insertrow(1)
end event

type dw_1 from datawindow within w_serv_x_cc
integer x = 3067
integer y = 32
integer width = 1129
integer height = 148
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_vcups"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;v_cups=data
reset_x_centro(1)
tab_det1.tp_gr_sbgr.dw_grup.retrieve(v_cups,i_uf,i_cc)
tab_det1.tp_gr_sbgr.dw_gr_rest.retrieve(v_cups,i_uf,i_cc)

end event

type pb_9 from picturebutton within w_serv_x_cc
integer x = 4325
integer y = 28
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &g"
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar [alt+G]"
end type

event clicked;if guardar()=-1 then
	rollback;
else
	commit;
end if
end event

type dw_ccxuf from datawindow within w_serv_x_cc
integer x = 1495
integer y = 32
integer width = 1541
integer height = 144
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_cc_x_uf"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('codcc',idw_ccuf)
idw_ccuf.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if i_cam_grup or i_cam_subgrp or i_cam_categ or i_cam_proc then
	choose case messagebox('Atención','Cambió la configuración del Centro de Costos, desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if guardar()=-1 then
				rollback;
				setitem(1,1,getitemstring(1,1))
				return 1
			else
				commit;
			end if
		case 2
			i_cam_grup=false
			i_cam_subgrp=false
			i_cam_categ=false
			i_cam_proc=false
		case 3
			setitem(1,1,getitemstring(1,1))
			return 1
	end choose
end if
i_cc=data
reset_x_centro(1)
tab_det1.tp_gr_sbgr.dw_grup.retrieve(v_cups,i_uf,i_cc)
tab_det1.tp_gr_sbgr.dw_gr_rest.retrieve(v_cups,i_uf,i_cc)

end event

type dw_uf from datawindow within w_serv_x_cc
integer x = 23
integer y = 32
integer width = 1458
integer height = 160
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_ufun"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if i_cam_grup or i_cam_subgrp or i_cam_categ or i_cam_proc then
	choose case messagebox('Atención','Cambió la configuración de la Unidad Funcional, desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if guardar()=-1 then
				rollback;
				setitem(1,1,getitemstring(1,1))
				return 1
			else
				commit;
			end if
		case 2
			i_cam_grup=false
			i_cam_subgrp=false
			i_cam_categ=false
			i_cam_proc=false
		case 3
			setitem(1,1,getitemstring(1,1))
			return 1
	end choose
end if
reset_x_centro(0)
i_uf=data
idw_ccuf.retrieve(i_uf,'H')
end event

type tab_det1 from tab within w_serv_x_cc
event create ( )
event destroy ( )
integer x = 23
integer y = 188
integer width = 5175
integer height = 2028
integer taborder = 10
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
tp_gr_sbgr tp_gr_sbgr
tp_cat_proc tp_cat_proc
end type

on tab_det1.create
this.tp_gr_sbgr=create tp_gr_sbgr
this.tp_cat_proc=create tp_cat_proc
this.Control[]={this.tp_gr_sbgr,&
this.tp_cat_proc}
end on

on tab_det1.destroy
destroy(this.tp_gr_sbgr)
destroy(this.tp_cat_proc)
end on

type tp_gr_sbgr from userobject within tab_det1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5138
integer height = 1900
long backcolor = 67108864
string text = "Grupos, Subgrupos"
long tabtextcolor = 33554432
string picturename = "elegir.ico"
long picturemaskcolor = 536870912
dw_grup dw_grup
dw_subgrp dw_subgrp
st_1 st_1
st_2 st_2
dw_gr_rest dw_gr_rest
dw_sbgr_rest dw_sbgr_rest
st_5 st_5
st_6 st_6
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
end type

on tp_gr_sbgr.create
this.dw_grup=create dw_grup
this.dw_subgrp=create dw_subgrp
this.st_1=create st_1
this.st_2=create st_2
this.dw_gr_rest=create dw_gr_rest
this.dw_sbgr_rest=create dw_sbgr_rest
this.st_5=create st_5
this.st_6=create st_6
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.Control[]={this.dw_grup,&
this.dw_subgrp,&
this.st_1,&
this.st_2,&
this.dw_gr_rest,&
this.dw_sbgr_rest,&
this.st_5,&
this.st_6,&
this.pb_1,&
this.pb_2,&
this.pb_3,&
this.pb_4}
end on

on tp_gr_sbgr.destroy
destroy(this.dw_grup)
destroy(this.dw_subgrp)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_gr_rest)
destroy(this.dw_sbgr_rest)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
end on

type dw_grup from datawindow within tp_gr_sbgr
integer x = 18
integer y = 56
integer width = 2455
integer height = 884
integer taborder = 10
string title = "none"
string dataobject = "dw_ccgrupo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cam_grup=true
if this.getcolumnname()="indicador" then 
	if getitemstring(getrow(),'indicador')='2' and data='1' then
		choose case messagebox('Atención', 'Esta operación eliminara todos los hijos',question!,okcancel!,1)
			case 1
				delete from ccproced where coduf=:i_uf and cod_version=:v_cups and codcc=:i_cc and cd_grupo=:i_grupo;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error ccproced",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If
				delete from cccate  where coduf=:i_uf and cod_version=:v_cups and codcc=:i_cc and cd_grupo=:i_grupo;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error plancate",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If				
				delete from ccsubgrupo  where coduf=:i_uf and codcc=:i_cc and cod_version=:v_cups and cd_grupo=:i_grupo;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error plansubgrupo",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If
				this.setitem(this.getrow(),"indicador",data)
			case 2
				this.setitem(this.getrow(),"indicador",'2')
		end choose
	else
		this.setitem(this.getrow(),"indicador",data)
	end if
end if
ocultar(2,data)
end event

event rowfocuschanged;if getrow()<1 then return
reset_x_centro(2)
ocultar(2,dw_grup.getitemstring(getrow(),'indicador'))
i_grupo=dw_grup.getitemstring(getrow(),'cd_grupo')

dw_subgrp.retrieve(v_cups,i_uf,i_cc,i_grupo)
dw_sbgr_rest.retrieve(v_cups,i_uf,i_cc,i_grupo)

//i_subgrp=dw_subgrp.getitemstring(getrow(),'cd_subgrupo')
//tab_det1.tp_cat_proc.dw_cat.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp)
//tab_det1.tp_cat_proc.dw_cat_rest.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp)
//
//i_cat=tab_det1.tp_cat_proc.dw_cat.getitemstring(getrow(),'cd_categoria')
//tab_det1.tp_cat_proc.dw_proc.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp,i_cat)
//tab_det1.tp_cat_proc.dw_proc_rest.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp,i_cat)
//
end event

event rowfocuschanging;if i_cam_subgrp or i_cam_categ or i_cam_proc then
	choose case messagebox('Atención','Cambió la configuración del grupo, desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if guardar()=-1 then
				rollback;
				return 1
			else
				commit;
			end if
		case 2
			i_cam_subgrp=false
			i_cam_categ=false
			i_cam_proc=false
		case 3
			return 1
	end choose
end if
end event

type dw_subgrp from datawindow within tp_gr_sbgr
integer x = 18
integer y = 1024
integer width = 2437
integer height = 856
integer taborder = 40
string title = "none"
string dataobject = "dw_ccsubgrp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cam_subgrp=true
if this.getcolumnname()="indicador" then 
	if getitemstring(getrow(),'indicador')='2' and data='1' then
		choose case messagebox('Atención', 'Esta operación eliminara todos los hijos',question!,okcancel!,1)
			case 1
				delete from ccproced where coduf=:i_uf and codcc=:i_cc and codd_version=:v_cups and cd_grupo=:i_grupo and cd_subgrupo=:i_subgrp;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error ccproced",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If
				delete from cccate  where coduf=:i_uf and codcc=:i_cc and codd_version=:v_cups and cd_grupo=:i_grupo and cd_subgrupo=:i_subgrp;
				If sqlca.sqlcode=-1 then
	  				messagebox("Errorcccate",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If				
				this.setitem(this.getrow(),"indicador",data)
			case 2
				this.setitem(this.getrow(),"indicador",'2')
		end choose
	else
		this.setitem(this.getrow(),"indicador",data)
	end if
end if
ocultar(3,data)
end event

event rowfocuschanged;if getrow()<1 then return
reset_x_centro(3)
ocultar(3,getitemstring(getrow(),'indicador'))
i_subgrp=getitemstring(getrow(),'cd_subgrupo')
tab_det1.tp_cat_proc.dw_cat.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp)
tab_det1.tp_cat_proc.dw_cat_rest.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp)

end event

event rowfocuschanging;if i_cam_categ or i_cam_proc then
	choose case messagebox('Atención','Cambió la configuración del SubGrupo, desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if guardar()=-1 then
				rollback;
				return 1
			else
				commit;
			end if
		case 2
			i_cam_categ=false
			i_cam_proc=false
		case 3
			return 1
	end choose
end if
end event

type st_1 from statictext within tp_gr_sbgr
integer x = 23
integer width = 635
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos del Centro de Costo:"
boolean focusrectangle = false
end type

type st_2 from statictext within tp_gr_sbgr
integer x = 23
integer y = 960
integer width = 485
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subgrupos del Grupo:"
boolean focusrectangle = false
end type

type dw_gr_rest from datawindow within tp_gr_sbgr
integer x = 2679
integer y = 56
integer width = 2400
integer height = 884
integer taborder = 10
string title = "none"
string dataobject = "dw_grup_resto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_sbgr_rest from datawindow within tp_gr_sbgr
integer x = 2679
integer y = 1024
integer width = 2400
integer height = 868
integer taborder = 30
string title = "none"
string dataobject = "dw_subgrp_rest"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_5 from statictext within tp_gr_sbgr
integer x = 2679
integer width = 439
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos Restantes:"
boolean focusrectangle = false
end type

type st_6 from statictext within tp_gr_sbgr
integer x = 2679
integer y = 960
integer width = 498
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subgrupos Restantes:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within tp_gr_sbgr
integer x = 2510
integer y = 60
integer width = 123
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<<"
boolean originalsize = true
end type

event clicked;if dw_gr_rest.rowcount()=0 then return
long donde
donde=dw_grup.insertrow(0)
dw_grup.setitem(donde,'cod_version',v_cups)
dw_grup.setitem(donde,'coduf',i_uf)
dw_grup.setitem(donde,'codcc',i_cc)
dw_grup.setitem(donde,'cd_grupo',dw_gr_rest.getitemstring(dw_gr_rest.getrow(),'cd_grupo'))
dw_grup.setitem(donde,'de_grupo',dw_gr_rest.getitemstring(dw_gr_rest.getrow(),'de_grupo'))
i_grupo=dw_gr_rest.getitemstring(dw_gr_rest.getrow(),'cd_grupo')
dw_gr_rest.deleterow(0)
dw_grup.scrolltorow(donde)
i_cam_grup=true
dw_subgrp.retrieve(v_cups,i_uf,i_cc,i_grupo)
dw_sbgr_rest.retrieve(v_cups,i_uf,i_cc,i_grupo)
end event

type pb_2 from picturebutton within tp_gr_sbgr
integer x = 2510
integer y = 164
integer width = 123
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">>"
boolean originalsize = true
end type

event clicked;if dw_grup.rowcount()=0 then return
if dw_subgrp.rowcount()>0 then return
long donde
donde=dw_gr_rest.insertrow(0)
dw_gr_rest.setitem(donde,'cd_grupo',dw_grup.getitemstring(dw_grup.getrow(),'cd_grupo'))
dw_gr_rest.setitem(donde,'de_grupo',dw_grup.getitemstring(dw_grup.getrow(),'de_grupo'))
dw_gr_rest.scrolltorow(donde)
dw_grup.deleterow(0)
i_cam_grup=true

end event

type pb_3 from picturebutton within tp_gr_sbgr
integer x = 2510
integer y = 1040
integer width = 123
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<<"
boolean originalsize = true
end type

event clicked;if dw_sbgr_rest.rowcount()=0 or not dw_sbgr_rest.visible then return
long donde
donde=dw_subgrp.insertrow(0)
dw_subgrp.setitem(donde,'cod_version',v_cups)
dw_subgrp.setitem(donde,'coduf',i_uf)
dw_subgrp.setitem(donde,'codcc',i_cc)
dw_subgrp.setitem(donde,'cd_grupo',i_grupo)
dw_subgrp.setitem(donde,'cd_subgrupo',dw_sbgr_rest.getitemstring(dw_sbgr_rest.getrow(),'cd_subgrupo'))
dw_subgrp.setitem(donde,'de_subgrupo',dw_sbgr_rest.getitemstring(dw_sbgr_rest.getrow(),'de_subgrupo'))
i_subgrp=dw_sbgr_rest.getitemstring(dw_sbgr_rest.getrow(),'cd_subgrupo')
dw_sbgr_rest.deleterow(0)
dw_subgrp.scrolltorow(donde)
i_cam_subgrp=true
tab_det1.tp_cat_proc.dw_cat.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp)
tab_det1.tp_cat_proc.dw_cat_rest.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp)

end event

type pb_4 from picturebutton within tp_gr_sbgr
integer x = 2510
integer y = 1140
integer width = 123
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">>"
boolean originalsize = true
end type

event clicked;if dw_subgrp.rowcount()=0 or not dw_subgrp.visible then return
if tab_det1.tp_cat_proc.dw_cat.rowcount()>0 then return
long donde
donde=dw_sbgr_rest.insertrow(0)
dw_sbgr_rest.setitem(donde,'cd_subgrupo',dw_subgrp.getitemstring(dw_subgrp.getrow(),'cd_subgrupo'))
dw_sbgr_rest.setitem(donde,'de_subgrupo',dw_subgrp.getitemstring(dw_subgrp.getrow(),'de_subgrupo'))
dw_sbgr_rest.scrolltorow(donde)
dw_subgrp.deleterow(0)
i_cam_subgrp=true

end event

type tp_cat_proc from userobject within tab_det1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5138
integer height = 1900
long backcolor = 67108864
string text = "Categorías, Procedimientos"
long tabtextcolor = 33554432
string picturename = "contratos.ico"
long picturemaskcolor = 536870912
dw_cat dw_cat
dw_proc dw_proc
st_3 st_3
st_4 st_4
dw_cat_rest dw_cat_rest
dw_proc_rest dw_proc_rest
st_7 st_7
st_8 st_8
pb_5 pb_5
pb_6 pb_6
pb_7 pb_7
pb_8 pb_8
end type

on tp_cat_proc.create
this.dw_cat=create dw_cat
this.dw_proc=create dw_proc
this.st_3=create st_3
this.st_4=create st_4
this.dw_cat_rest=create dw_cat_rest
this.dw_proc_rest=create dw_proc_rest
this.st_7=create st_7
this.st_8=create st_8
this.pb_5=create pb_5
this.pb_6=create pb_6
this.pb_7=create pb_7
this.pb_8=create pb_8
this.Control[]={this.dw_cat,&
this.dw_proc,&
this.st_3,&
this.st_4,&
this.dw_cat_rest,&
this.dw_proc_rest,&
this.st_7,&
this.st_8,&
this.pb_5,&
this.pb_6,&
this.pb_7,&
this.pb_8}
end on

on tp_cat_proc.destroy
destroy(this.dw_cat)
destroy(this.dw_proc)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.dw_cat_rest)
destroy(this.dw_proc_rest)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.pb_5)
destroy(this.pb_6)
destroy(this.pb_7)
destroy(this.pb_8)
end on

type dw_cat from datawindow within tp_cat_proc
integer x = 18
integer y = 68
integer width = 2400
integer height = 884
integer taborder = 10
string title = "none"
string dataobject = "dw_cccate"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cam_categ=true
if this.getcolumnname()="indicador" then 
	if getitemstring(getrow(),'indicador')='2' and data='1' then
		choose case messagebox('Atención', 'Esta operación eliminara todos los hijos',question!,okcancel!,1)
			case 1
				delete from ccproced where coduf=:i_uf and codcc=:i_cc and cod_version=:v_cups and cd_grupo=:i_grupo and cd_subgrupo=:i_subgrp and cd_categoria=:i_cat;
				If sqlca.sqlcode=-1 then
	  				messagebox("Error ccproced",sqlca.sqlerrtext)
	  				rollback;
	   				return
				Else
					commit;
				End If
				this.setitem(this.getrow(),"indicador",data)
			case 2
				this.setitem(this.getrow(),"indicador",'2')
		end choose
	else
		this.setitem(this.getrow(),"indicador",data)
	end if
end if
ocultar(4,data)
end event

event rowfocuschanged;if getrow()<1 then return
i_cat=getitemstring(getrow(),'cd_categoria')
ocultar(4,getitemstring(getrow(),'indicador'))
tab_det1.tp_cat_proc.dw_proc.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp,i_cat)
tab_det1.tp_cat_proc.dw_proc_rest.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp,i_cat)

end event

event rowfocuschanging;if i_cam_proc then
	choose case messagebox('Atención','Cambió la configuración de la Categoría, desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if guardar()=-1 then
				rollback;
				return 1
			else
				commit;
			end if
		case 2
			i_cam_proc=false
		case 3
			return 1
	end choose
end if
end event

type dw_proc from datawindow within tp_cat_proc
integer x = 18
integer y = 1028
integer width = 2400
integer height = 832
integer taborder = 50
string title = "none"
string dataobject = "dw_ccproced"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_3 from statictext within tp_cat_proc
integer x = 23
integer y = 8
integer width = 567
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Categorías del Subgrupo:"
boolean focusrectangle = false
end type

type st_4 from statictext within tp_cat_proc
integer x = 23
integer y = 964
integer width = 704
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos de la Categoría:"
boolean focusrectangle = false
end type

type dw_cat_rest from datawindow within tp_cat_proc
integer x = 2679
integer y = 68
integer width = 2400
integer height = 884
integer taborder = 10
string title = "none"
string dataobject = "dw_categ_rest"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_proc_rest from datawindow within tp_cat_proc
integer x = 2679
integer y = 1028
integer width = 2400
integer height = 836
integer taborder = 50
string title = "none"
string dataobject = "dw_ccproc_rest"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_7 from statictext within tp_cat_proc
integer x = 2679
integer y = 8
integer width = 503
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Categorías Restantes:"
boolean focusrectangle = false
end type

type st_8 from statictext within tp_cat_proc
integer x = 2679
integer y = 968
integer width = 594
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos Restantes:"
boolean focusrectangle = false
end type

type pb_5 from picturebutton within tp_cat_proc
integer x = 2482
integer y = 64
integer width = 123
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<<"
boolean originalsize = true
end type

event clicked;if dw_cat_rest.rowcount()=0 or not dw_cat_rest.visible then return
long donde
donde=dw_cat.insertrow(0)
dw_cat.setitem(donde,'cod_version',v_cups)
dw_cat.setitem(donde,'coduf',i_uf)
dw_cat.setitem(donde,'codcc',i_cc)
dw_cat.setitem(donde,'cd_grupo',i_grupo)
dw_cat.setitem(donde,'cd_subgrupo',i_subgrp)
dw_cat.setitem(donde,'cd_categoria',dw_cat_rest.getitemstring(dw_cat_rest.getrow(),'cd_categoria'))
dw_cat.setitem(donde,'de_categoria',dw_cat_rest.getitemstring(dw_cat_rest.getrow(),'de_categoria'))
i_cat=dw_cat_rest.getitemstring(dw_cat_rest.getrow(),'cd_categoria')
dw_cat_rest.deleterow(0)
dw_cat.scrolltorow(donde)
i_cam_categ=true
tab_det1.tp_cat_proc.dw_proc.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp,i_cat)
tab_det1.tp_cat_proc.dw_proc_rest.retrieve(v_cups,i_uf,i_cc,i_grupo,i_subgrp,i_cat)
end event

type pb_6 from picturebutton within tp_cat_proc
integer x = 2482
integer y = 172
integer width = 123
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">>"
boolean originalsize = true
end type

event clicked;if dw_cat.rowcount()=0 or not dw_cat.visible then return
if dw_proc.rowcount()>0 then return
long donde
donde=dw_cat_rest.insertrow(0)
dw_cat_rest.setitem(donde,'cd_categoria',dw_cat.getitemstring(dw_cat.getrow(),'cd_categoria'))
dw_cat_rest.setitem(donde,'de_categoria',dw_cat.getitemstring(dw_cat.getrow(),'de_categoria'))
dw_cat_rest.scrolltorow(donde)
dw_cat.deleterow(0)
i_cam_categ=true

end event

type pb_7 from picturebutton within tp_cat_proc
integer x = 2482
integer y = 1044
integer width = 123
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<<"
boolean originalsize = true
end type

event clicked;if dw_proc_rest.rowcount()=0 or not dw_proc_rest.visible then return
long donde
donde=dw_proc.insertrow(0)
dw_proc.setitem(donde,'cod_version',v_cups)
dw_proc.setitem(donde,'coduf',i_uf)
dw_proc.setitem(donde,'codcc',i_cc)
dw_proc.setitem(donde,'cd_grupo',i_grupo)
dw_proc.setitem(donde,'cd_subgrupo',i_subgrp)
dw_proc.setitem(donde,'cd_categoria',i_cat)
dw_proc.setitem(donde,'codproced',dw_proc_rest.getitemstring(dw_proc_rest.getrow(),'codproced'))
dw_proc.setitem(donde,'cod_cups',dw_proc_rest.getitemstring(dw_proc_rest.getrow(),'cod_cups'))
dw_proc.setitem(donde,'descripcion',dw_proc_rest.getitemstring(dw_proc_rest.getrow(),'descripcion'))
dw_proc_rest.deleterow(0)
dw_proc.scrolltorow(donde)
i_cam_proc=true

end event

type pb_8 from picturebutton within tp_cat_proc
integer x = 2482
integer y = 1144
integer width = 123
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">>"
boolean originalsize = true
end type

event clicked;if dw_proc.rowcount()=0 or not dw_proc.visible then return
long donde
donde=dw_proc_rest.insertrow(0)
dw_proc_rest.setitem(donde,'codproced',dw_proc.getitemstring(dw_proc.getrow(),'codproced'))
dw_proc_rest.setitem(donde,'descripcion',dw_proc.getitemstring(dw_proc.getrow(),'descripcion'))
dw_proc_rest.scrolltorow(donde)
dw_proc.deleterow(0)
i_cam_proc=true

end event

