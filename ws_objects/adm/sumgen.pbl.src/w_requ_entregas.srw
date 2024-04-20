$PBExportHeader$w_requ_entregas.srw
forward
global type w_requ_entregas from window
end type
type st_1 from statictext within w_requ_entregas
end type
type dp_fin from datepicker within w_requ_entregas
end type
type st_3 from statictext within w_requ_entregas
end type
type dp_ini from datepicker within w_requ_entregas
end type
type st_2 from statictext within w_requ_entregas
end type
type pb_2 from picturebutton within w_requ_entregas
end type
type pb_1 from picturebutton within w_requ_entregas
end type
type dw_1 from datawindow within w_requ_entregas
end type
end forward

global type w_requ_entregas from window
integer width = 2619
integer height = 1656
boolean titlebar = true
string title = "Lleva Requisición desde Entrega"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dp_fin dp_fin
st_3 st_3
dp_ini dp_ini
st_2 st_2
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_requ_entregas w_requ_entregas

type variables
st_lote st_p

end variables

forward prototypes
public subroutine filtra ()
end prototypes

public subroutine filtra ();date fec
datetime fecha1,fecha2
fec =dp_ini.datevalue 
fecha1=datetime(date(fec),time('00:00'))
fec =dp_fin.datevalue
fecha2=datetime(date(fec),time('23:59'))
dw_1.retrieve(st_p.codalmacen,fecha1,fecha2)
end subroutine

on w_requ_entregas.create
this.st_1=create st_1
this.dp_fin=create dp_fin
this.st_3=create st_3
this.dp_ini=create dp_ini
this.st_2=create st_2
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dp_fin,&
this.st_3,&
this.dp_ini,&
this.st_2,&
this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_requ_entregas.destroy
destroy(this.st_1)
destroy(this.dp_fin)
destroy(this.st_3)
destroy(this.dp_ini)
destroy(this.st_2)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;st_p = Message.PowerObjectParm
if g_motor='postgres' then
	dw_1.dataObject='dw_sum_req_entrega_postgres'
else
	dw_1.dataObject='dw_sum_req_entrega'
end if
dw_1.SetTransObject(SQLCA)
filtra()

end event

type st_1 from statictext within w_requ_entregas
integer x = 69
integer y = 12
integer width = 233
integer height = 52
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entregas"
boolean focusrectangle = false
end type

type dp_fin from datepicker within w_requ_entregas
integer x = 937
integer y = 40
integer width = 407
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2022-10-24"), Time("11:04:22.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtra()
end event

type st_3 from statictext within w_requ_entregas
integer x = 754
integer y = 64
integer width = 187
integer height = 68
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta el"
boolean focusrectangle = false
end type

type dp_ini from datepicker within w_requ_entregas
integer x = 329
integer y = 36
integer width = 379
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2022-10-24"), Time("11:04:22.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;filtra()
end event

type st_2 from statictext within w_requ_entregas
integer x = 69
integer y = 64
integer width = 224
integer height = 68
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde el"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_requ_entregas
integer x = 1207
integer y = 1412
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;closewithreturn(parent,'!')
end event

type pb_1 from picturebutton within w_requ_entregas
integer x = 1042
integer y = 1416
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;int j,donde,item=1,l_i
string l_cdd,l_clu
long l_ne
l_ne= dw_1.rowcount()
for j=1 to dw_1.rowcount()
	if dw_1.getitemnumber(j,"esc")=1 then
		l_cdd=dw_1.getitemstring(j,'coddoc')
		l_clu=dw_1.getitemstring(j,'clugar')
		l_ne=dw_1.getitemnumber(j,'numdoc')
		l_i=j
		do
			donde=st_p.dw_cpo.insertrow(0)
			st_p.dw_cpo.setitem(donde,'coddoc',st_p.coddoc)
			st_p.dw_cpo.setitem(donde,'clugar',st_p.clugar)
			st_p.dw_cpo.setitem(donde,'numdoc',st_p.numdoc)
			st_p.dw_cpo.setitem(donde,'codgenerico',dw_1.getitemstring(l_i,'codgenerico'))
			st_p.dw_cpo.setitem(donde,'item',item)
			st_p.dw_cpo.setitem(donde,'codarticulo',dw_1.getitemstring(l_i,'codarticulo'))
			st_p.dw_cpo.setitem(donde,'descripcion',dw_1.getitemstring(l_i,'descripcion'))
			st_p.dw_cpo.setitem(donde,'cantidad',dw_1.getitemnumber(l_i,'cantidad'))
			st_p.dw_cpo.setitem(donde,'coddoc_ori',dw_1.getitemstring(l_i,'coddoc'))
			st_p.dw_cpo.setitem(donde,'clugar_ori',dw_1.getitemstring(l_i,'clugar'))
			st_p.dw_cpo.setitem(donde,'numdoc_ori',dw_1.getitemnumber(l_i,'numdoc'))
			st_p.dw_cpo.setitem(donde,'item_ori	',dw_1.getitemnumber(l_i,'item'))
			st_p.dw_cpo.setitem(donde,'estado','0')
			item++	
			l_i++
			if l_i >dw_1.rowcount() then exit
		LOOP WHILE l_i<=dw_1.rowcount() and dw_1.getitemnumber(l_i,'numdoc')= l_ne
		j=l_i
		update sum_mvto_cab set en_destino='1' where coddoc=:l_cdd and clugar=:l_clu and numdoc=:l_ne;
		if sqlca.sqlcode=-1 then
			messagebox("Error en interface con sum_mvto_cpo",sqlca.sqlerrtext)
			rollback;
			return
		end if
	end if
next
commit;
closewithreturn(parent,'Si')

end event

type dw_1 from datawindow within w_requ_entregas
integer x = 50
integer y = 184
integer width = 2537
integer height = 1212
integer taborder = 10
string title = "none"
string dataobject = "dw_sum_req_entrega"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

