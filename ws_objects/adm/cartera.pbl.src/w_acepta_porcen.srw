$PBExportHeader$w_acepta_porcen.srw
forward
global type w_acepta_porcen from window
end type
type pb_cancel from picturebutton within w_acepta_porcen
end type
type pb_ok from picturebutton within w_acepta_porcen
end type
type st_1 from statictext within w_acepta_porcen
end type
type em_1 from editmask within w_acepta_porcen
end type
type dw_1 from datawindow within w_acepta_porcen
end type
end forward

global type w_acepta_porcen from window
integer width = 1902
integer height = 448
boolean titlebar = true
string title = "Aceptación de Glosa Porcentual"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
st_1 st_1
em_1 em_1
dw_1 dw_1
end type
global w_acepta_porcen w_acepta_porcen

type variables
datawindowchild idw_resp
end variables

forward prototypes
public subroutine coloca_valores (datawindow dw)
public subroutine crea_respu (datawindow dw, datawindow dw_resp, integer cual)
end prototypes

public subroutine coloca_valores (datawindow dw);dec valor[],porcen
porcen=dec(em_1.text)
long j
dw.setfilter('')
dw.filter()
valor=dw.object.valor_objecion.primary
for j=1 to upperbound(valor)
	valor[j] = round(valor[j] * porcen/100	,i_dec_gral_car)
	if dw.dataobject='dw_obje_a_respu_cpo' then
		dw.setitem(j,'estado','R')
		dw.setitem(j,'fecha_respuesta',dw_1.getitemdatetime(1,'fecha'))
	end if
next
dw.object.valor_aceptado.primary=valor

end subroutine

public subroutine crea_respu (datawindow dw, datawindow dw_resp, integer cual);//cual : 0 facts 1:procs 2 sitem
string name
long f,j
double porcen
porcen = dec(em_1.text)
for j=1 to dw.rowcount()
	dw.ScrolltoRow(j)
	if (dw.getitemstring(dw.getrow(),'estado') <>'C' and dw.getitemstring(dw.getrow(),'estado') <>'R') then Continue
	f = w_respu_glosas.pb_1.Event clicked()
	dw_resp.setitem(f,'fecha',dw_1.getitemdatetime(1,'fecha'))
	dw_resp.setitem(f,'usu_causante',dw_1.getitemstring(1,'usu_causante'))
	dw_resp.setitem(f,'cod_respuesta',dw_1.getitemstring(1,'cod_respuesta'))
	dw_resp.setitem(f,'t_aceptado',round(dw.getitemnumber(j,'valor_objecion') * porcen / 100,i_dec_gral_car))
	w_respu_glosas.dw_res.Event p_itemchanged(f)
next

end subroutine

on w_acepta_porcen.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_1=create st_1
this.em_1=create em_1
this.dw_1=create dw_1
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.st_1,&
this.em_1,&
this.dw_1}
end on

on w_acepta_porcen.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.dw_1)
end on

type pb_cancel from picturebutton within w_acepta_porcen
integer x = 901
integer y = 204
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_acepta_porcen
integer x = 750
integer y = 204
integer width = 151
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;dec porcen
porcen=dec(em_1.text)
if porcen<=0 or porcen>100 then return
//coloca_valores(w_respu_glosas.tab_1.tp_1.dw_facts)
//coloca_valores(w_respu_glosas.tab_1.tp_2.dw_procs)
//coloca_valores(w_respu_glosas.tab_1.tp_3.dw_sitem)

crea_respu(w_respu_glosas.dw_objs,w_respu_glosas.dw_res,0)
//crea_respu(w_respu_glosas.tab_1.tp_2.dw_procs,w_respu_glosas.tab_1.tp_2.dw_resp_proc,1)
//crea_respu(w_respu_glosas.tab_1.tp_3.dw_sitem,w_respu_glosas.tab_1.tp_3.dw_resp_sitem,2)
//w_respu_glosas.tab_1.tp_1.dw_facts.setfilter('')
//w_respu_glosas.tab_1.tp_1.dw_facts.filter()
//w_respu_glosas.tab_1.tp_1.dw_facts.event rowfocuschanged(w_respu_glosas.tab_1.tp_1.dw_facts.getrow())
w_respu_glosas.i_cambio=true
close(parent)

end event

type st_1 from statictext within w_acepta_porcen
integer x = 37
integer y = 24
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
string text = "%"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type em_1 from editmask within w_acepta_porcen
integer x = 37
integer y = 80
integer width = 315
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###.00"
string minmax = "0~~100"
end type

type dw_1 from datawindow within w_acepta_porcen
integer x = 343
integer y = 20
integer width = 1518
integer height = 140
integer taborder = 20
string title = "none"
string dataobject = "dw_respu_cpo"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
object.datawindow.footer.height=0
object.t_aceptado.visible=false

getchild('cod_respuesta',idw_resp)
idw_resp.settransobject(sqlca)
idw_resp.retrieve('%')

insertrow(1)
setitem(1,'fecha',datetime(today()))

end event

