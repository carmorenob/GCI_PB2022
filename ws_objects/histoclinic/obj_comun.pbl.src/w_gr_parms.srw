$PBExportHeader$w_gr_parms.srw
forward
global type w_gr_parms from window
end type
type cb_i from commandbutton within w_gr_parms
end type
type cb_q from commandbutton within w_gr_parms
end type
type cb_g from commandbutton within w_gr_parms
end type
type cb_c from commandbutton within w_gr_parms
end type
type cb_a from commandbutton within w_gr_parms
end type
type dw_parm from datawindow within w_gr_parms
end type
end forward

global type w_gr_parms from window
integer width = 1979
integer height = 1100
boolean titlebar = true
string title = "Parámetros"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "param.ico"
boolean center = true
cb_i cb_i
cb_q cb_q
cb_g cb_g
cb_c cb_c
cb_a cb_a
dw_parm dw_parm
end type
global w_gr_parms w_gr_parms

type variables
st_graph st_gr
string stx_args

end variables

on w_gr_parms.create
this.cb_i=create cb_i
this.cb_q=create cb_q
this.cb_g=create cb_g
this.cb_c=create cb_c
this.cb_a=create cb_a
this.dw_parm=create dw_parm
this.Control[]={this.cb_i,&
this.cb_q,&
this.cb_g,&
this.cb_c,&
this.cb_a,&
this.dw_parm}
end on

on w_gr_parms.destroy
destroy(this.cb_i)
destroy(this.cb_q)
destroy(this.cb_g)
destroy(this.cb_c)
destroy(this.cb_a)
destroy(this.dw_parm)
end on

event open;string parametros
long i, fila

st_gr = Message.PowerObjectParm

stx_args = st_gr.args.parmtoSyntax()
if st_gr.args.dw_parm.RowCount() > 0 then
	dw_parm.Object.Data = st_gr.args.dw_parm.Object.Data
end if

//for i = 1 to upperbound(st_gr.args.campo)
//	fila = dw_parm.InsertRow(0)
//	dw_parm.SetItem(fila,'campo',st_gr.args.campo[i])
//	dw_parm.SetItem(fila,'tipo',st_gr.args.tipo[i])
//next

//parametros = dw_obj.describe('datawindow.table.arguments')
//parametros = parametros + '~n'
//string pedazo, param[16,2]
//long posic,i, fila
//
//i = 1
//do while TRUE
//	posic = pos(parametros, '~t')
//	if posic > 0 then
//		param[i,1] = trim(left(parametros, posic - 1))
//		parametros = mid(parametros,posic + 1)
//		posic = pos(parametros, '~n')
//		param[i,2] = trim(left(parametros, posic - 1))
//		parametros = mid(parametros,posic + 1)
//		i = i + 1
//	else
//		EXIT
//	end if
//loop
//posic = i - 1
//for i = 1 to posic 
//	fila = dw_parm.InsertRow(0)
//	dw_parm.SetItem(fila,'campo',param[i,1])
//	dw_parm.SetItem(fila,'tipo',param[i,2])
//next
//
end event

type cb_i from commandbutton within w_gr_parms
integer x = 1582
integer y = 528
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Insertar"
end type

event clicked;long fila

fila = dw_parm.GetRow()
if fila <= 1 then
	fila = dw_parm.InsertRow(1)
else
	fila = dw_parm.InsertRow(fila - 1)
end if
dw_parm.SetRow(fila)

end event

type cb_q from commandbutton within w_gr_parms
integer x = 1582
integer y = 632
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Quitar"
end type

event clicked;if dw_parm.RowCount() = 0 then Return

dw_parm.DeleteRow(dw_parm.GetRow())

end event

type cb_g from commandbutton within w_gr_parms
integer x = 1582
integer y = 424
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&gregar"
end type

event clicked;dw_parm.SetRow(dw_parm.InsertRow(0))


end event

type cb_c from commandbutton within w_gr_parms
integer x = 1582
integer y = 216
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(parent)
end event

type cb_a from commandbutton within w_gr_parms
integer x = 1582
integer y = 112
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if dw_parm.RowCount() > 0 then
	st_gr.args.dw_parm.Object.Data = dw_parm.Object.Data
else
	st_gr.args.dw_parm.Reset()
end if

close(parent)

end event

type dw_parm from datawindow within w_gr_parms
integer x = 210
integer y = 116
integer width = 1294
integer height = 728
integer taborder = 10
string title = "none"
string dataobject = "dw_gr_parm"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

