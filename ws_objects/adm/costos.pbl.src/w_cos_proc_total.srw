$PBExportHeader$w_cos_proc_total.srw
forward
global type w_cos_proc_total from window
end type
type pb_borra from picturebutton within w_cos_proc_total
end type
type pb_cerrar from picturebutton within w_cos_proc_total
end type
type pb_2 from picturebutton within w_cos_proc_total
end type
type dd_ano from editmask within w_cos_proc_total
end type
type dd_mes from dropdownlistbox within w_cos_proc_total
end type
type st_5 from statictext within w_cos_proc_total
end type
type dw_tot from datawindow within w_cos_proc_total
end type
type t1 from tab within w_cos_proc_total
end type
type p2 from userobject within t1
end type
type dw_ufcc from datawindow within p2
end type
type dw_cc from datawindow within p2
end type
type p2 from userobject within t1
dw_ufcc dw_ufcc
dw_cc dw_cc
end type
type p3 from userobject within t1
end type
type pb_1 from picturebutton within p3
end type
type dw_p from datawindow within p3
end type
type dw_proc from datawindow within p3
end type
type p3 from userobject within t1
pb_1 pb_1
dw_p dw_p
dw_proc dw_proc
end type
type t1 from tab within w_cos_proc_total
p2 p2
p3 p3
end type
type st_1 from statictext within w_cos_proc_total
end type
end forward

global type w_cos_proc_total from window
integer width = 3918
integer height = 2088
boolean titlebar = true
string title = "Costo por Periodo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_borra pb_borra
pb_cerrar pb_cerrar
pb_2 pb_2
dd_ano dd_ano
dd_mes dd_mes
st_5 st_5
dw_tot dw_tot
t1 t1
st_1 st_1
end type
global w_cos_proc_total w_cos_proc_total

type variables
long ano, mes
datawindowchild dwc_cc

end variables

on w_cos_proc_total.create
this.pb_borra=create pb_borra
this.pb_cerrar=create pb_cerrar
this.pb_2=create pb_2
this.dd_ano=create dd_ano
this.dd_mes=create dd_mes
this.st_5=create st_5
this.dw_tot=create dw_tot
this.t1=create t1
this.st_1=create st_1
this.Control[]={this.pb_borra,&
this.pb_cerrar,&
this.pb_2,&
this.dd_ano,&
this.dd_mes,&
this.st_5,&
this.dw_tot,&
this.t1,&
this.st_1}
end on

on w_cos_proc_total.destroy
destroy(this.pb_borra)
destroy(this.pb_cerrar)
destroy(this.pb_2)
destroy(this.dd_ano)
destroy(this.dd_mes)
destroy(this.st_5)
destroy(this.dw_tot)
destroy(this.t1)
destroy(this.st_1)
end on

event open;
dd_ano.Text = string(year(today()))
dd_mes.SelectItem(month(today()))
ano = year(today())
mes = dd_mes.FindItem(dd_mes.Text,0)

t1.p2.dw_ufcc.GetChild('codcc',dwc_cc)
dwc_cc.SetTransObject(SQLCA)
dwc_cc.Retrieve()
dwc_cc.setfilter("coduf=''")
dwc_cc.filter()
t1.p2.dw_ufcc.insertRow(1)

end event

type pb_borra from picturebutton within w_cos_proc_total
integer x = 960
integer y = 44
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Registro"
end type

event clicked;long cant

// Verificar si ya se hizo
select count(*) into :cant from cos_res_mes_cc
where anyo=:ano and mes=:mes;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF

if cant =  0 then
	MessageBox('Atención','No hay Registros para eliminar')
	Return -1
end if

DELETE FROM cos_nom_mes_cc
WHERE (((cos_nom_mes_cc.ano)=:ano) AND ((cos_nom_mes_cc.mes)=:mes));
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF

DELETE FROM cos_res_mes_cc
WHERE (((cos_res_mes_cc.anyo)=:ano) AND ((cos_res_mes_cc.mes)=:mes));
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF

end event

type pb_cerrar from picturebutton within w_cos_proc_total
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1115
integer y = 44
integer width = 142
integer height = 124
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)

end event

type pb_2 from picturebutton within w_cos_proc_total
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 805
integer y = 44
integer width = 142
integer height = 124
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "calculator.gif"
string disabledname = "d_calculator.gif"
alignment htextalign = left!
string powertiptext = "Calcular Costos periodo seleccionado"
end type

event clicked;long cant

// Verificar si ya se hizo
select count(*) into :cant from cos_res_mes_cc
where anyo=:ano and mes=:mes;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF

if cant > 0 then
	MessageBox('Atención','Ya ha sido calculado el periodo.')
	Return -1
end if

// Calcular
if g_motor='postgres' then
		string l_envio
		select* into  :l_envio  from sp_costos_nom (:ano,:mes);
	else
		DECLARE sp_costos PROCEDURE FOR sp_costos_nom @ano = :ano, @mes = :mes ;
	    EXECUTE sp_costos;
	end if
IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
else
	MessageBox('Atención','El procedimiento se ejecutó con éxito. Seleccione condiciones para ver datos')
	dd_mes.TriggerEvent(selectionchanged!)
	t1.p2.dw_ufcc.TriggerEvent(itemchanged!)
END IF

end event

type dd_ano from editmask within w_cos_proc_total
integer x = 41
integer y = 80
integer width = 288
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "#####"
boolean spin = true
string minmax = "2000~~2050"
end type

event modified;decimal dato

dd_ano.GetData(dato)
ano = long(dato)

t1.p2.dw_cc.Retrieve(ano,mes,t1.p2.dw_ufcc.GetItemString(1,'coduf'),t1.p2.dw_ufcc.GetItemString(1,'codcc'))
dw_tot.Retrieve(ano,mes)

end event

type dd_mes from dropdownlistbox within w_cos_proc_total
integer x = 338
integer y = 80
integer width = 434
integer height = 564
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;mes = dd_mes.FindItem(dd_mes.Text,0)

t1.p2.dw_cc.Retrieve(ano,mes,t1.p2.dw_ufcc.GetItemString(1,'coduf'),t1.p2.dw_ufcc.GetItemString(1,'codcc'))
dw_tot.Retrieve(ano,mes)

end event

type st_5 from statictext within w_cos_proc_total
integer x = 2985
integer y = 20
integer width = 370
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Periodo:"
boolean focusrectangle = false
end type

type dw_tot from datawindow within w_cos_proc_total
integer x = 2985
integer y = 72
integer width = 681
integer height = 84
integer taborder = 30
string title = "none"
string dataobject = "dw_cos_resu_per"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type t1 from tab within w_cos_proc_total
integer x = 41
integer y = 236
integer width = 3808
integer height = 1668
integer taborder = 20
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
p2 p2
p3 p3
end type

on t1.create
this.p2=create p2
this.p3=create p3
this.Control[]={this.p2,&
this.p3}
end on

on t1.destroy
destroy(this.p2)
destroy(this.p3)
end on

type p2 from userobject within t1
integer x = 18
integer y = 100
integer width = 3771
integer height = 1552
long backcolor = 67108864
string text = "Por Centro de Costos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_ufcc dw_ufcc
dw_cc dw_cc
end type

on p2.create
this.dw_ufcc=create dw_ufcc
this.dw_cc=create dw_cc
this.Control[]={this.dw_ufcc,&
this.dw_cc}
end on

on p2.destroy
destroy(this.dw_ufcc)
destroy(this.dw_cc)
end on

type dw_ufcc from datawindow within p2
integer x = 119
integer y = 100
integer width = 1673
integer height = 156
integer taborder = 40
string title = "none"
string dataobject = "dw_uf_cc"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;string vnul
AcceptText()
if this.getColumnName() = 'coduf' then
	setNull(vnul)
	this.setitem(1,'codcc',"")
	dwc_cc.setfilter("coduf='"+this.getitemstring(1,'coduf')+"'")
	dwc_cc.filter()
	acceptText()
	setItem(1,'codcc',vnul)
else
	t1.p2.dw_cc.Retrieve(ano,mes,t1.p2.dw_ufcc.GetItemString(1,'coduf'),t1.p2.dw_ufcc.GetItemString(1,'codcc'))
end if

end event

type dw_cc from datawindow within p2
integer x = 137
integer y = 320
integer width = 1376
integer height = 1048
integer taborder = 30
string title = "none"
string dataobject = "dw_cos_cc_mes"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type p3 from userobject within t1
integer x = 18
integer y = 100
integer width = 3771
integer height = 1552
long backcolor = 67108864
string text = "Por Procedimiento"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_1 pb_1
dw_p dw_p
dw_proc dw_proc
end type

on p3.create
this.pb_1=create pb_1
this.dw_p=create dw_p
this.dw_proc=create dw_proc
this.Control[]={this.pb_1,&
this.dw_p,&
this.dw_proc}
end on

on p3.destroy
destroy(this.pb_1)
destroy(this.dw_p)
destroy(this.dw_proc)
end on

type pb_1 from picturebutton within p3
integer x = 855
integer y = 40
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "buscar.gif"
alignment htextalign = left!
end type

event clicked;open(w_busca_proc)
if message.stringparm<>'' then
	dw_p.event itemchanged(1,dw_p.object.edita,message.stringparm)
end if

end event

type dw_p from datawindow within p3
integer x = 128
integer y = 24
integer width = 681
integer height = 160
integer taborder = 50
string title = "none"
string dataobject = "dw_paraediciones"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
insertRow(0)

end event

event itemchanged;dw_proc.Retrieve(ano,mes,data)

end event

type dw_proc from datawindow within p3
integer x = 123
integer y = 204
integer width = 3461
integer height = 1104
integer taborder = 30
string title = "none"
string dataobject = "dw_cos_proc_mes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type st_1 from statictext within w_cos_proc_total
integer x = 50
integer y = 4
integer width = 402
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año/mes"
boolean focusrectangle = false
end type

