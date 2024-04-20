$PBExportHeader$w_actualiza_salario.srw
forward
global type w_actualiza_salario from window
end type
type pb_6 from picturebutton within w_actualiza_salario
end type
type pb_1 from picturebutton within w_actualiza_salario
end type
type pb_2 from picturebutton within w_actualiza_salario
end type
type dp_2 from datepicker within w_actualiza_salario
end type
type st_5 from statictext within w_actualiza_salario
end type
type dp_1 from datepicker within w_actualiza_salario
end type
type st_3 from statictext within w_actualiza_salario
end type
type dw_1 from datawindow within w_actualiza_salario
end type
end forward

global type w_actualiza_salario from window
integer width = 4005
integer height = 1880
boolean titlebar = true
string title = "Actualiza Salario"
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_6 pb_6
pb_1 pb_1
pb_2 pb_2
dp_2 dp_2
st_5 st_5
dp_1 dp_1
st_3 st_3
dw_1 dw_1
end type
global w_actualiza_salario w_actualiza_salario

type variables

end variables

on w_actualiza_salario.create
this.pb_6=create pb_6
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dp_2=create dp_2
this.st_5=create st_5
this.dp_1=create dp_1
this.st_3=create st_3
this.dw_1=create dw_1
this.Control[]={this.pb_6,&
this.pb_1,&
this.pb_2,&
this.dp_2,&
this.st_5,&
this.dp_1,&
this.st_3,&
this.dw_1}
end on

on w_actualiza_salario.destroy
destroy(this.pb_6)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dp_2)
destroy(this.st_5)
destroy(this.dp_1)
destroy(this.st_3)
destroy(this.dw_1)
end on

type pb_6 from picturebutton within w_actualiza_salario
integer x = 2240
integer y = 32
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_actualiza_salario
integer x = 2071
integer y = 32
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "           &a"
boolean originalsize = true
string picturename = "Aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;int li_ret
string ls_cargo, ls_nom
decimal ln_salario,ln_saln
datetime ldt_fi,ldt_fecha

ldt_fi=dp_1.value
ldt_fecha=datetime(today(),now())

li_ret = messagebox('Atención','Esta seguro de Actualizar los salarios para los empelado activos', Question!, YesNoCancel!, 2)
if li_ret = 1 then
	for li_ret=1 to dw_1.rowcount()
		if dw_1.getitemnumber(li_ret,'selec')=0 then continue
		ls_cargo=dw_1.getitemstring(li_ret,'cargo')
		ls_nom=dw_1.getitemstring(li_ret,'permanente')
		ln_salario=dw_1.getitemnumber(li_ret,'salario')
		ln_saln=dw_1.getitemnumber(li_ret,'salario_new')
		
		INSERT INTO emplesalario ( tipodoc, documento, ncargo, nsalario, fecha_inicio, estado, usuario, usufecha, beneficio1, beneficio2, beneficio3, beneficio4, beneficio5, cambio, rte_formula, rte_bene, salario )
		SELECT emplesalario.tipodoc, emplesalario.documento, emplesalario.ncargo, emplesalario.nsalario+1, :ldt_fi, emplesalario.estado, :usuario, :ldt_fecha, emplesalario.beneficio1, emplesalario.beneficio2, emplesalario.beneficio3, emplesalario.beneficio4, emplesalario.beneficio5, emplesalario.cambio, emplesalario.rte_formula, emplesalario.rte_bene, :ln_saln
		FROM emplesalario INNER JOIN emplecargo ON (emplesalario.ncargo = emplecargo.ncargo) AND (emplesalario.documento = emplecargo.documento) AND (emplesalario.tipodoc = emplecargo.tipodoc)
		WHERE (((emplesalario.estado)='1') AND ((emplecargo.cargo)=:ls_cargo) AND ((emplecargo.permanente)=:ls_nom) AND ((emplesalario.salario)=:ln_salario));
		if sqlca.sqlcode=-1 then
			messagebox("Error Insertando salario",sqlca.sqlerrtext)
			rollback;
			return
		end if

		UPDATE 
			emplesalario 
		SET 
			estado = '2' 
		FROM 
			emplecargo 
		WHERE 
			(((emplesalario.estado)='1') AND ((emplecargo.cargo)=:ls_cargo) AND ((emplecargo.permanente)=:ls_nom) AND ((emplesalario.salario)=:ln_salario)
			AND ((emplesalario.ncargo = emplecargo.ncargo) AND (emplesalario.documento = emplecargo.documento) 
			AND (emplesalario.tipodoc = emplecargo.tipodoc)));
		if sqlca.sqlcode=-1 then
			messagebox("Error Actualizando estado",sqlca.sqlerrtext)
			rollback;
			return
		end if
	
	next
	commit;

else
	return 0
end if
end event

type pb_2 from picturebutton within w_actualiza_salario
integer x = 1902
integer y = 32
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Refresca Estados"
end type

event clicked;dw_1.retrieve()
end event

type dp_2 from datepicker within w_actualiza_salario
integer x = 1271
integer y = 24
integer width = 507
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2024-03-08"), Time("21:25:46.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;//filtre()
end event

event constructor;datetime ls_date
ls_date=datetime(date('31/12/'+string(year(today()))))
dp_2.value=ls_date
end event

type st_5 from statictext within w_actualiza_salario
integer x = 1006
integer y = 20
integer width = 242
integer height = 104
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FECHA FINAL"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dp_1 from datepicker within w_actualiza_salario
integer x = 334
integer y = 28
integer width = 535
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2024-03-08"), Time("21:25:46.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event constructor;datetime ls_date
ls_date=datetime(date('01/01/'+string(year(today()))))
dp_1.value=ls_date
end event

type st_3 from statictext within w_actualiza_salario
integer x = 101
integer y = 8
integer width = 215
integer height = 104
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FECHA INICIAL"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_actualiza_salario
integer x = 69
integer y = 184
integer width = 3858
integer height = 1560
integer taborder = 10
string title = "none"
string dataobject = "dw_actualiza_salario"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

event itemchanged;accepttext()
if getColumnName() = "salario_new" then 
	if getitemnumber(GetRow(),"salario_new")>=getitemnumber(GetRow(),"salario") then
		setitem(GetRow(),"selec",1)
	end if
end if

end event

