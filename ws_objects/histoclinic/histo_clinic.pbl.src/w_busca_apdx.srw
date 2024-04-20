$PBExportHeader$w_busca_apdx.srw
forward
global type w_busca_apdx from window
end type
type pb_cancel from picturebutton within w_busca_apdx
end type
type pb_ok from picturebutton within w_busca_apdx
end type
type st_1 from statictext within w_busca_apdx
end type
type tab_1 from tab within w_busca_apdx
end type
type tp_1 from userobject within tab_1
end type
type st_regs from statictext within tp_1
end type
type cbx_1 from checkbox within tp_1
end type
type st_2 from statictext within tp_1
end type
type dw_filtros from datawindow within tp_1
end type
type dw_procs from datawindow within tp_1
end type
type dw_grupo from datawindow within tp_1
end type
type gb_1 from groupbox within tp_1
end type
type tp_1 from userobject within tab_1
st_regs st_regs
cbx_1 cbx_1
st_2 st_2
dw_filtros dw_filtros
dw_procs dw_procs
dw_grupo dw_grupo
gb_1 gb_1
end type
type tp_2 from userobject within tab_1
end type
type dw_comun from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
dw_comun dw_comun
end type
type tab_1 from tab within w_busca_apdx
tp_1 tp_1
tp_2 tp_2
end type
end forward

global type w_busca_apdx from window
integer width = 3250
integer height = 1920
boolean titlebar = true
string title = "Buscar Procedimientos de Apoyo Diagnóstico del Area:"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
st_1 st_1
tab_1 tab_1
end type
global w_busca_apdx w_busca_apdx

type variables
datawindowchild idw_grupo
st_busca_apdx st
end variables

forward prototypes
public function long f_llevar (datawindow pdw_temp)
end prototypes

public function long f_llevar (datawindow pdw_temp);string filtro
long j,cuantos,k,cant
filtro=pdw_temp.describe('datawindow.table.filter')
pdw_temp.setredraw(false)
pdw_temp.setfilter('esco=1')
pdw_temp.filter()
cuantos=pdw_temp.rowcount()
for j=1 to cuantos
	cant=pdw_temp.getitemnumber(j,'cant')
	for k=1 to cant
		st.sle.text=pdw_temp.getitemstring(j,'codproced')
		st.sle.event modified()
	next
next
if filtro<>'?' then
	pdw_temp.setfilter(filtro)
else
	pdw_temp.setfilter('')
end if
pdw_temp.filter()
pdw_temp.sort()
pdw_temp.setredraw(true)
return cuantos
end function

on w_busca_apdx.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_1=create st_1
this.tab_1=create tab_1
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.st_1,&
this.tab_1}
end on

on w_busca_apdx.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_1)
destroy(this.tab_1)
end on

event open;st=message.powerobjectparm
st_1.text=st.des_area
idw_grupo.retrieve(st.cod_area)
tab_1.tp_1.dw_procs.retrieve(st.cod_area,'0')
tab_1.tp_2.dw_comun.retrieve(st.cod_area,'1')
end event

type pb_cancel from picturebutton within w_busca_apdx
integer x = 1545
integer y = 1688
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string powertiptext = "Cancelar"
end type

event clicked;Close(parent)
end event

type pb_ok from picturebutton within w_busca_apdx
integer x = 1390
integer y = 1688
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
string picturename = "aceptar.gif"
string powertiptext = "Aceptar"
end type

event clicked;if f_llevar(tab_1.tp_1.dw_procs)=0 and f_llevar(tab_1.tp_2.dw_comun)=0 then
	messagebox("Atención",'Debe escoger procedimientos a llevar')
else
	close(parent)
end if
end event

type st_1 from statictext within w_busca_apdx
integer x = 18
integer y = 8
integer width = 3195
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "none"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type tab_1 from tab within w_busca_apdx
integer x = 18
integer y = 104
integer width = 3205
integer height = 1568
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3168
integer height = 1440
long backcolor = 67108864
string text = "Por Grupos"
long tabtextcolor = 33554432
string picturename = "cascade.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra los Grupos del Area "
st_regs st_regs
cbx_1 cbx_1
st_2 st_2
dw_filtros dw_filtros
dw_procs dw_procs
dw_grupo dw_grupo
gb_1 gb_1
end type

on tp_1.create
this.st_regs=create st_regs
this.cbx_1=create cbx_1
this.st_2=create st_2
this.dw_filtros=create dw_filtros
this.dw_procs=create dw_procs
this.dw_grupo=create dw_grupo
this.gb_1=create gb_1
this.Control[]={this.st_regs,&
this.cbx_1,&
this.st_2,&
this.dw_filtros,&
this.dw_procs,&
this.dw_grupo,&
this.gb_1}
end on

on tp_1.destroy
destroy(this.st_regs)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.dw_filtros)
destroy(this.dw_procs)
destroy(this.dw_grupo)
destroy(this.gb_1)
end on

type st_regs from statictext within tp_1
integer x = 2126
integer y = 1372
integer width = 1001
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within tp_1
integer x = 2135
integer y = 84
integer width = 453
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por Grupo"
boolean checked = true
end type

event clicked;dw_procs.event filtrar()
end event

type st_2 from statictext within tp_1
integer x = 37
integer y = 180
integer width = 553
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por (Condición O):"
boolean focusrectangle = false
end type

type dw_filtros from datawindow within tp_1
integer x = 27
integer y = 224
integer width = 3099
integer height = 236
integer taborder = 60
string title = "none"
string dataobject = "dw_xa_buscar_apdx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
insertrow(1)
end event

event itemchanged;if getrow()=rowcount() then
	insertrow(0)
end if
dw_procs.event filtrar()
end event

type dw_procs from datawindow within tp_1
event filtrar ( )
integer x = 23
integer y = 500
integer width = 3104
integer height = 864
integer taborder = 70
string title = "none"
string dataobject = "dw_procgcli"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event filtrar();string filtro
boolean grupo,cerrar,varios
dw_filtros.accepttext()
dw_grupo.accepttext()
if cbx_1.checked then
	if not isnull(dw_grupo.getitemnumber(1,1)) then
		filtro="codgc="+string(dw_grupo.getitemnumber(1,1))
		grupo=true
	end if
end if
long j
for j=1 to dw_filtros.rowcount()
	if trim(dw_filtros.getitemstring(j,'descrip'))<>'' and not isnull(dw_filtros.getitemstring(j,'descrip'))then
		if grupo then 
			filtro +=' and ( '
			cerrar=true
			grupo=false
		end if
		if varios then filtro +=' or '
		filtro+='(lower('+dw_filtros.getitemstring(j,'campo')+") like lower('"+dw_filtros.getitemstring(j,'descrip')+"%'))"
		varios=true
	end if
next
if cerrar then filtro+=')'
setfilter(filtro)
filter()
sort()
triggerevent(rowfocuschanged!)
end event

event constructor;settransobject(SQLCA)
end event

event doubleclicked;if rowcount()<1 then return

end event

event rowfocuschanged;if getrow()=0 then
	st_regs.text=''
else
	st_regs.text='Reg.'+string(getrow())+' de '+string(rowcount())
end if
end event

type dw_grupo from datawindow within tp_1
integer x = 32
integer y = 80
integer width = 2098
integer height = 76
integer taborder = 50
string title = "none"
string dataobject = "dw_gclinicpeq"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(SQLCA)
getchild("codgc",idw_grupo)
idw_grupo.settransobject(SQLCA)
insertrow(1)
end event

event itemchanged;dw_procs.event filtrar()
end event

type gb_1 from groupbox within tp_1
integer width = 3159
integer height = 1440
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos y procedimientos del Area de Apoyo Diagnóstico"
borderstyle borderstyle = styleraised!
end type

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3168
integer height = 1440
long backcolor = 67108864
string text = "Comunes"
long tabtextcolor = 33554432
string picturename = "campos.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra los procedimientos comunes configurados del Área"
dw_comun dw_comun
end type

on tp_2.create
this.dw_comun=create dw_comun
this.Control[]={this.dw_comun}
end on

on tp_2.destroy
destroy(this.dw_comun)
end on

type dw_comun from datawindow within tp_2
integer x = 32
integer y = 48
integer width = 3104
integer height = 1344
integer taborder = 50
string title = "none"
string dataobject = "dw_procgcli"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

