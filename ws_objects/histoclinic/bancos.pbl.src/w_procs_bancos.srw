$PBExportHeader$w_procs_bancos.srw
forward
global type w_procs_bancos from window
end type
type dw_contra from datawindow within w_procs_bancos
end type
type cb_4 from picturebutton within w_procs_bancos
end type
type cb_1 from picturebutton within w_procs_bancos
end type
type dw_3 from datawindow within w_procs_bancos
end type
type st_1 from statictext within w_procs_bancos
end type
type dw_2 from datawindow within w_procs_bancos
end type
type gb_3 from groupbox within w_procs_bancos
end type
end forward

global type w_procs_bancos from window
integer width = 3424
integer height = 1300
boolean titlebar = true
string title = "Procedimientos Configurados para el Banco"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
dw_contra dw_contra
cb_4 cb_4
cb_1 cb_1
dw_3 dw_3
st_1 st_1
dw_2 dw_2
gb_3 gb_3
end type
global w_procs_bancos w_procs_bancos

type variables
st_pa_proc ist_p
string l_sql
datawindowchild idw_tipo
end variables

on w_procs_bancos.create
this.dw_contra=create dw_contra
this.cb_4=create cb_4
this.cb_1=create cb_1
this.dw_3=create dw_3
this.st_1=create st_1
this.dw_2=create dw_2
this.gb_3=create gb_3
this.Control[]={this.dw_contra,&
this.cb_4,&
this.cb_1,&
this.dw_3,&
this.st_1,&
this.dw_2,&
this.gb_3}
end on

on w_procs_bancos.destroy
destroy(this.dw_contra)
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.gb_3)
end on

event open;ist_p=message.powerobjectparm
if isValid(ist_p) then
	if not isnull(ist_p.emp) and ist_p.emp<>'' then
		l_sql="SELECT manuales.CodManual, manuales.DesManual, serviciosman.codservicio, serviciosman.descripcion, serviciosman.valor &
		FROM (tarifas INNER JOIN serviciosman ON (tarifas.codservicio = serviciosman.codservicio) AND (tarifas.CodManual = serviciosman.CodManual))  &
		INNER JOIN manuales ON tarifas.CodManual = manuales.CodManual " 
		l_sql=l_sql+"WHERE (serviciosman.estado='1' and ("
		dw_contra.retrieve(ist_p.emp ,ist_p.cont,ist_p.t_ingreso)
		if dw_contra.rowcount()>0 then
			int l_i
			for l_i=1 to  dw_contra.rowcount()
				if l_i<>1 then
					l_sql=l_sql+' or '
				end if
				l_sql=l_sql+"(tarifas.CodManual = '"+  dw_contra.getitemstring(l_i,'codmanual')+"')"	
			next
			l_sql=l_sql+'))'
		else
			l_sql=l_sql+"(tarifas.CodManual like '%')))"
		end if
   	else
		l_sql=l_sql+"(tarifas.CodManual like '%')))"
	end if
end if
dw_2.retrieve(ist_p.banco)
end event

type dw_contra from datawindow within w_procs_bancos
boolean visible = false
integer x = 2377
integer y = 1096
integer width = 686
integer height = 88
integer taborder = 90
string title = "none"
string dataobject = "dw_cont_deta_sinmed"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type cb_4 from picturebutton within w_procs_bancos
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 1696
integer y = 1076
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean cancel = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type cb_1 from picturebutton within w_procs_bancos
event mousemove pbm_mousemove
string tag = "&Agregar"
integer x = 1531
integer y = 1076
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean default = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
end type

event clicked;dw_2.triggerevent(doubleclicked!)
end event

type dw_3 from datawindow within w_procs_bancos
integer x = 27
integer y = 564
integer width = 3282
integer height = 476
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_equiv_manual"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;dw_2.triggerevent(doubleclicked!)
end event

type st_1 from statictext within w_procs_bancos
integer x = 23
integer width = 1189
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos configurados para el banco de fluidos:"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_procs_bancos
integer x = 14
integer y = 60
integer width = 3351
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_procs_x_banco"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;getchild('descrip_tipo',idw_tipo)
idw_tipo.settransobject(sqlca)
settransobject(sqlca)
end event

event rowfocuschanged;dw_3.reset()
if getrow()<1 then return
if dw_3.setsqlselect(l_sql+" AND (tarifas.CodProced='"+ getitemstring(getrow(),"codproced")+"')")=-1 then
	l_sql=dw_3.describe('DataWindow.Table.Select')
end if
dw_3.retrieve()


//dw_3.retrieve(getitemstring(getrow(),"codproced"),i_manual)
idw_tipo.retrieve(ist_p.banco,getitemstring(getrow(),"codproced"))
end event

event doubleclicked;if rowcount()<1 then return
triggerevent(rowfocuschanged!)
if isnull(getitemstring(getrow(),'descrip_tipo')) or  getitemstring(getrow(),'descrip_tipo')='' then
	messagebox('Atención','Debe escoger el tipo del procedimiento')
	return
end if
if dw_3.rowcount()=0 then
	messagebox("Atención","Este procedimiento no tiene equivalencias en manuales, por lo tanto no la va a poder cobrar, busque otro con equivalencias")
	return
end if
if isvalid(ist_p) then
	if isvalid(ist_p.sle) then
		ist_p.objeto.insert_proc_banco(getitemstring(getrow(),1),1,ist_p.banco,getitemstring(getrow(),'cod_tsubempaq'),getitemstring(getrow(),'descrip_tipo'))
		return
	end if
end if

end event

event itemchanged;if dwo.name='descrip_tipo' then
	setitem(getrow(),'cod_tsubempaq',idw_tipo.getitemstring(idw_tipo.getrow(),'cod_tsubempaq'))
end if
end event

type gb_3 from groupbox within w_procs_bancos
integer y = 492
integer width = 3369
integer height = 568
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "Equivalencias en Manuales Tarifarios:"
borderstyle borderstyle = styleraised!
end type

