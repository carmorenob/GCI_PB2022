$PBExportHeader$w_cos_deprecia_dep.srw
forward
global type w_cos_deprecia_dep from window
end type
type hpb_1 from hprogressbar within w_cos_deprecia_dep
end type
type st_3 from statictext within w_cos_deprecia_dep
end type
type dd_mes_f from dropdownlistbox within w_cos_deprecia_dep
end type
type dw_d from datawindow within w_cos_deprecia_dep
end type
type st_2 from statictext within w_cos_deprecia_dep
end type
type st_1 from statictext within w_cos_deprecia_dep
end type
type dd_mes_i from dropdownlistbox within w_cos_deprecia_dep
end type
type dd_ano from editmask within w_cos_deprecia_dep
end type
type pb_1 from picturebutton within w_cos_deprecia_dep
end type
type dw_gi from datawindow within w_cos_deprecia_dep
end type
end forward

global type w_cos_deprecia_dep from window
integer width = 3333
integer height = 1532
boolean titlebar = true
string title = "Gastos de depreciación por mes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
hpb_1 hpb_1
st_3 st_3
dd_mes_f dd_mes_f
dw_d dw_d
st_2 st_2
st_1 st_1
dd_mes_i dd_mes_i
dd_ano dd_ano
pb_1 pb_1
dw_gi dw_gi
end type
global w_cos_deprecia_dep w_cos_deprecia_dep

type variables
boolean i_cambio
DataWindowChild dw_cc, dw_dep
string uf,cc
long ano, mes_i,mes_f

end variables

forward prototypes
public function integer f_pregunta ()
end prototypes

public function integer f_pregunta ();if not i_cambio then return 2
return messagebox("Atención",'Realizó cambios, desea guardarlos?' ,question!,yesnocancel!,3)

end function

on w_cos_deprecia_dep.create
this.hpb_1=create hpb_1
this.st_3=create st_3
this.dd_mes_f=create dd_mes_f
this.dw_d=create dw_d
this.st_2=create st_2
this.st_1=create st_1
this.dd_mes_i=create dd_mes_i
this.dd_ano=create dd_ano
this.pb_1=create pb_1
this.dw_gi=create dw_gi
this.Control[]={this.hpb_1,&
this.st_3,&
this.dd_mes_f,&
this.dw_d,&
this.st_2,&
this.st_1,&
this.dd_mes_i,&
this.dd_ano,&
this.pb_1,&
this.dw_gi}
end on

on w_cos_deprecia_dep.destroy
destroy(this.hpb_1)
destroy(this.st_3)
destroy(this.dd_mes_f)
destroy(this.dw_d)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dd_mes_i)
destroy(this.dd_ano)
destroy(this.pb_1)
destroy(this.dw_gi)
end on

event open;dd_ano.Text = string(year(today()))
dd_mes_i.SelectItem(month(today()))
dd_mes_f.SelectItem(month(today()))
ano = year(today())
mes_i = dd_mes_i.FindItem(dd_mes_i.Text,0)
mes_f = dd_mes_f.FindItem(dd_mes_f.Text,0)

dw_gi.Retrieve(ano,mes_i,mes_f)

end event

type hpb_1 from hprogressbar within w_cos_deprecia_dep
boolean visible = false
integer x = 73
integer y = 1368
integer width = 3109
integer height = 44
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_3 from statictext within w_cos_deprecia_dep
integer x = 837
integer y = 44
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes Final"
boolean focusrectangle = false
end type

type dd_mes_f from dropdownlistbox within w_cos_deprecia_dep
integer x = 837
integer y = 116
integer width = 434
integer height = 564
integer taborder = 30
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

event selectionchanged;mes_f = dd_mes_f.FindItem(dd_mes_f.Text,0)
if mes_f  < mes_i  then
	MessageBox('Atención','Debe seleccionar Mes Inicial mayor a mes Final')
	Return -1
end if

dw_gi.Retrieve(ano,mes_i,mes_f)

end event

type dw_d from datawindow within w_cos_deprecia_dep
boolean visible = false
integer x = 1787
integer y = 8
integer width = 1285
integer height = 224
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_deprecia_per"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type st_2 from statictext within w_cos_deprecia_dep
integer x = 366
integer y = 44
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes Inicial"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cos_deprecia_dep
integer x = 78
integer y = 44
integer width = 265
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
boolean focusrectangle = false
end type

type dd_mes_i from dropdownlistbox within w_cos_deprecia_dep
integer x = 384
integer y = 116
integer width = 434
integer height = 564
integer taborder = 20
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

event selectionchanged;mes_i = dd_mes_i.FindItem(dd_mes_i.Text,0)
if mes_i > mes_f then
	MessageBox('Atención','Debe seleccionar Mes Inicla mayor a mes Final')
	Return -1
end if
dw_gi.Retrieve(ano,mes_i,mes_f)

end event

type dd_ano from editmask within w_cos_deprecia_dep
integer x = 64
integer y = 116
integer width = 288
integer height = 88
integer taborder = 10
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

dw_gi.Retrieve(ano,mes_i,mes_f)

end event

type pb_1 from picturebutton within w_cos_deprecia_dep
integer x = 1294
integer y = 84
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "import.gif"
alignment htextalign = left!
string powertiptext = "Traer de Activos Fijos"
end type

event clicked;long conteo, f, nf
string msg, l_uf,l_cc
dec valor

if ano <= 0 or mes_i <= 0 or mes_f <= 0 then 
	MessageBox('Atención','Debe seleccionar año y mes válidos')
	Return 0
end if

select count(*) into :conteo from cos_deprecia_mes
where ano=:ano and (mes between :mes_i and :mes_f);
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF

SetPointer(HourGlass!)
if conteo > 0 then
	if MessageBox('Atención','Ya se tiene información de depreciación para el año y mes dados. Desea borrarlos y recalcularlos desde Activos Fijos?',QUESTION!,YESNO!,2) = 1 then
		delete from cos_deprecia_mes where ano=:ano and (mes between :mes_i and :mes_f);
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			MessageBox("SQL error", msg)
			Return -1
		END IF
	else
		Return 0
	end if
end if

//l_uf=dw_d.GetItemString(f,'coduf')
//l_cc=dw_d.GetItemString(f,'codcc')
//dw_d.Retrieve(ano,mes,l_uf,l_cc)
hpb_1.Visible = TRUE
hpb_1.Position = 0
hpb_1.MinPosition = 0
dw_d.Retrieve(ano,mes_i,mes_f)
hpb_1.MaxPosition = dw_d.RowCount()
hpb_1.SetRange ( 0, dw_d.RowCount() )

f = dw_d.Find("indice=1",1,dw_d.RowCount())
do while f > 0
	if round(dw_d.GetItemNumber(f,'valor_costos'),2) > 0 then
		nf = dw_gi.InsertRow(0)
		dw_gi.SetItem(nf,'ano',ano)
		dw_gi.SetItem(nf,'mes',dw_d.GetItemnumber(f,'mes'))
		dw_gi.SetItem(nf,'coduf',dw_d.GetItemString(f,'codufun'))
		dw_gi.SetItem(nf,'codcc',dw_d.GetItemString(f,'codcencosto'))
		dw_gi.SetItem(nf,'clugar',dw_d.GetItemString(f,'codlugar'))
		dw_gi.SetItem(nf,'valor',round(dw_d.GetItemNumber(f,'valor_costos'),2))
		dw_gi.SetItem(nf,'estado','2')
	end if
	hpb_1.Position = f
	if f + 1 > dw_d.RowCount() THEN EXIT
	f = dw_d.Find("indice=1", f + 1, dw_d.RowCount())
loop
if dw_gi.Update() = -1 then
	rollback;
	Return -1
end if
commit;
dw_gi.Retrieve(ano,mes_i,mes_f)
hpb_1.Visible = false
Return 0

end event

type dw_gi from datawindow within w_cos_deprecia_dep
integer x = 50
integer y = 260
integer width = 3173
integer height = 1064
integer taborder = 20
string title = "none"
string dataobject = "dw_deprecia_dep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
GetChild('codDep',dw_dep)
dw_dep.SetTransObject(SQLCA)

end event

event itemchanged;i_cambio=true
end event

event dberror;rollback;
st_error i_st
i_st.ds_nombre=classname()
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 1
end event

event clicked;if row <= 0 then Return 0
if row <> getRow() then
	SetRow(row)
end if

end event

