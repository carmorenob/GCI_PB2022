$PBExportHeader$w_configura_estados.srw
forward
global type w_configura_estados from window
end type
type del_sb from picturebutton within w_configura_estados
end type
type ins_sb from picturebutton within w_configura_estados
end type
type dw_emp from datawindow within w_configura_estados
end type
type dw_grpcta from datawindow within w_configura_estados
end type
type pb_del_grupo from picturebutton within w_configura_estados
end type
type pb_insg from picturebutton within w_configura_estados
end type
type dw_grupo from datawindow within w_configura_estados
end type
type pb_dele from picturebutton within w_configura_estados
end type
type pb_inse from picturebutton within w_configura_estados
end type
type pb_guardar from picturebutton within w_configura_estados
end type
type dw_estados from datawindow within w_configura_estados
end type
type gb_1 from groupbox within w_configura_estados
end type
type gb_2 from groupbox within w_configura_estados
end type
type gb_3 from groupbox within w_configura_estados
end type
end forward

global type w_configura_estados from window
integer width = 3497
integer height = 2188
boolean titlebar = true
string title = " Estados Contables"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_estadosc.ico"
del_sb del_sb
ins_sb ins_sb
dw_emp dw_emp
dw_grpcta dw_grpcta
pb_del_grupo pb_del_grupo
pb_insg pb_insg
dw_grupo dw_grupo
pb_dele pb_dele
pb_inse pb_inse
pb_guardar pb_guardar
dw_estados dw_estados
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_configura_estados w_configura_estados

type variables
string c_codemp
int c_estado,c_grupo,c_subgrp
boolean cambios
end variables

on w_configura_estados.create
this.del_sb=create del_sb
this.ins_sb=create ins_sb
this.dw_emp=create dw_emp
this.dw_grpcta=create dw_grpcta
this.pb_del_grupo=create pb_del_grupo
this.pb_insg=create pb_insg
this.dw_grupo=create dw_grupo
this.pb_dele=create pb_dele
this.pb_inse=create pb_inse
this.pb_guardar=create pb_guardar
this.dw_estados=create dw_estados
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.del_sb,&
this.ins_sb,&
this.dw_emp,&
this.dw_grpcta,&
this.pb_del_grupo,&
this.pb_insg,&
this.dw_grupo,&
this.pb_dele,&
this.pb_inse,&
this.pb_guardar,&
this.dw_estados,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_configura_estados.destroy
destroy(this.del_sb)
destroy(this.ins_sb)
destroy(this.dw_emp)
destroy(this.dw_grpcta)
destroy(this.pb_del_grupo)
destroy(this.pb_insg)
destroy(this.dw_grupo)
destroy(this.pb_dele)
destroy(this.pb_inse)
destroy(this.pb_guardar)
destroy(this.dw_estados)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;cambios=false
end event

type del_sb from picturebutton within w_configura_estados
string tag = "&Borrar grupo del plan"
integer x = 3163
integer y = 1624
integer width = 146
integer height = 128
integer taborder = 80
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

event clicked;dw_grpcta.deleterow(dw_grpcta.getrow())
if dw_grpcta.update()<1 then
	rollback;
	dw_estados.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type ins_sb from picturebutton within w_configura_estados
integer x = 3159
integer y = 1484
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if c_codemp="" or isnull(c_codemp) then return
long l_cod
dw_grpcta.scrolltorow(dw_grpcta.insertrow(0))
dw_grpcta.setitem(dw_grpcta.getrow(),'cod_empresa',c_codemp)
dw_grpcta.setitem(dw_grpcta.getrow(),'codigo',c_estado)
dw_grpcta.setitem(dw_grpcta.getrow(),'item',c_grupo)
l_cod=dw_grpcta.getitemnumber(dw_grpcta.getrow(),'maximos')
if isnull(l_cod) Then
	 l_cod=1
else
	 l_cod++
end If
dw_grpcta.setitem(dw_grpcta.getrow(),'subitem', l_cod)
cambios=true
end event

type dw_emp from datawindow within w_configura_estados
integer x = 41
integer y = 24
integer width = 1125
integer height = 152
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;this.accepttext()
c_codemp=this.getitemstring(1,1)
dw_estados.retrieve(c_codemp)
end event

type dw_grpcta from datawindow within w_configura_estados
integer x = 41
integer y = 1476
integer width = 3063
integer height = 488
integer taborder = 70
string title = "none"
string dataobject = "dw_estados_subg"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event itemchanged;this.accepttext()
cambios=true
string l_nom,l_cta

setnull(l_cta)
l_cta=dw_grpcta.getitemstring(dw_grpcta.getrow(),'mayor')

if not isnull(dw_grpcta.getitemstring(dw_grpcta.getrow(),'grupo')) then 
	l_cta=l_cta+dw_grpcta.getitemstring(dw_grpcta.getrow(),'grupo')
end if
	
if not isnull(dw_grpcta.getitemstring(dw_grpcta.getrow(),'cuenta')) then 
	l_cta=l_cta+dw_grpcta.getitemstring(dw_grpcta.getrow(),'cuenta')
end if

if (this.getcolumnname() = 'mayor') or (this.getcolumnname() = 'grupo') or (this.getcolumnname() = 'cuenta')  then 
	SELECT 
		DESCRIP into :l_nom
	FROM 
		CONT_PLAN
	WHERE 
		(((CONT_PLAN.COD_EMPRESA)=:c_codemp) AND ((CONT_PLAN.CODTOTAL)=:l_cta));
		
	dw_grpcta.setitem(dw_grpcta.getrow(),'descrip',l_nom)
end if
end event

type pb_del_grupo from picturebutton within w_configura_estados
string tag = "&Borrar grupo del plan"
integer x = 3173
integer y = 1032
integer width = 146
integer height = 128
integer taborder = 70
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

event clicked;if dw_grpcta.rowcount()>0 then
	messagebox("Atención","Este Estado Grupo no se puede borrar ya que posee cuentas")
	return
else
	dw_grupo.deleterow(dw_grupo.getrow())
	if dw_grupo.update()<1 then
		rollback;
		dw_estados.triggerevent(rowfocuschanged!)
	else
		commit;
	end if
end if
end event

type pb_insg from picturebutton within w_configura_estados
integer x = 3173
integer y = 892
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if c_codemp="" or isnull(c_codemp) then return
long l_cod
dw_grupo.scrolltorow(dw_grupo.insertrow(0))
dw_grupo.setitem(dw_grupo.getrow(),'cod_empresa',c_codemp)
dw_grupo.setitem(dw_grupo.getrow(),'codigo',c_estado)
l_cod=dw_grupo.getitemnumber(1,'maximos')
if isnull(l_cod) Then
	 l_cod=1
else
	 l_cod++
end If
dw_grupo.setitem(dw_grupo.getrow(),'item', l_cod)
cambios=true
end event

type dw_grupo from datawindow within w_configura_estados
integer x = 64
integer y = 884
integer width = 3054
integer height = 488
integer taborder = 10
string title = "none"
string dataobject = "dw_estados_grupo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.triggerevent(rowfocuschanged!)

end event

event rowfocuschanged;dw_grpcta.reset()
if dw_grupo.getrow()<1 then return
c_grupo=dw_grupo.getitemnumber(dw_grupo.getrow(),'item')
dw_grpcta.retrieve(c_codemp,c_estado,c_grupo)
end event

type pb_dele from picturebutton within w_configura_estados
string tag = "Elimina Estados"
integer x = 3173
integer y = 408
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_grupo.rowcount()>0 then
	messagebox("Atención","Este Estado no se puede borrar ya que posee grupos")
	return
else
	dw_estados.deleterow(dw_estados.getrow())
	if dw_grupo.update()<1 then
		rollback;
		dw_estados.triggerevent(rowfocuschanged!)
	else
		commit;
	end if
end if
end event

type pb_inse from picturebutton within w_configura_estados
string tag = "Inserta Estados"
integer x = 3173
integer y = 276
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if c_codemp="" or isnull(c_codemp) then return
long l_cod
dw_estados.scrolltorow(dw_estados.insertrow(0))
dw_estados.setitem(dw_estados.getrow(),'cod_empresa',c_codemp)
l_cod=dw_estados.getitemnumber(1,'maximos')
if isnull(l_cod) Then
	 l_cod=1
else
	 l_cod++
end If
dw_estados.setitem(dw_estados.getrow(),'codigo', l_cod)
cambios=true

end event

type pb_guardar from picturebutton within w_configura_estados
string tag = "&Guardar Configuración Plan"
integer x = 3163
integer y = 32
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

event clicked;if dw_estados.update()= -1 then
	rollback;
else
	if dw_grupo.update()= -1 then 
		rollback;
	else
		if dw_grpcta.update()= -1 then 
			rollback;
		end if
	end if
end if
cambios=false
end event

type dw_estados from datawindow within w_configura_estados
integer x = 64
integer y = 264
integer width = 3067
integer height = 488
integer taborder = 10
string title = "none"
string dataobject = "dw_estados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanging;//if cambios then
//	choose case messagebox("Atención","Al plan actual se le realizaron cambios,desea guardar los cambios?",question!,yesnocancel!,1)
//		case 1
//			pb_guardar.triggerevent(clicked!)
//		case 2
//			cambios=false
//		case 3
//			return 1
//	end choose
//end if
//this.selectrow(currentrow,false)
end event

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

event rowfocuschanged;dw_grupo.reset()
if dw_estados.getrow()<1 then return
c_estado=dw_estados.getitemnumber(dw_estados.getrow(),'codigo')
dw_grupo.retrieve(c_codemp,c_estado)
end event

type gb_1 from groupbox within w_configura_estados
integer x = 32
integer y = 176
integer width = 3342
integer height = 616
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estados Contables"
end type

type gb_2 from groupbox within w_configura_estados
integer x = 32
integer y = 800
integer width = 3342
integer height = 596
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos del Estado"
end type

type gb_3 from groupbox within w_configura_estados
integer x = 32
integer y = 1416
integer width = 3342
integer height = 600
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo Cuenta"
borderstyle borderstyle = styleraised!
end type

