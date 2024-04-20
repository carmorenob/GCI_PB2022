$PBExportHeader$w_cos_gi.srw
forward
global type w_cos_gi from window
end type
type pb_save from picturebutton within w_cos_gi
end type
type pb_4 from picturebutton within w_cos_gi
end type
type pb_2 from picturebutton within w_cos_gi
end type
type dw_gi from datawindow within w_cos_gi
end type
type dw_gasto from datawindow within w_cos_gi
end type
end forward

global type w_cos_gi from window
integer width = 1979
integer height = 1220
boolean titlebar = true
string title = "Gastos Indirectos por mes"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_save pb_save
pb_4 pb_4
pb_2 pb_2
dw_gi dw_gi
dw_gasto dw_gasto
end type
global w_cos_gi w_cos_gi

type variables
boolean i_cambio
end variables

forward prototypes
public function integer f_pregunta ()
end prototypes

public function integer f_pregunta ();if not i_cambio then return 2
return messagebox("Atención",'Realizó cambios, desea guardarlos?' ,question!,yesnocancel!,3)

end function

on w_cos_gi.create
this.pb_save=create pb_save
this.pb_4=create pb_4
this.pb_2=create pb_2
this.dw_gi=create dw_gi
this.dw_gasto=create dw_gasto
this.Control[]={this.pb_save,&
this.pb_4,&
this.pb_2,&
this.dw_gi,&
this.dw_gasto}
end on

on w_cos_gi.destroy
destroy(this.pb_save)
destroy(this.pb_4)
destroy(this.pb_2)
destroy(this.dw_gi)
destroy(this.dw_gasto)
end on

type pb_save from picturebutton within w_cos_gi
integer x = 1746
integer y = 480
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if dw_gi.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
i_cambio = FALSE
Return 0

end event

type pb_4 from picturebutton within w_cos_gi
integer x = 1746
integer y = 332
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_gi.RowCount() = 0 then Return 0
if dw_gi.GetItemString(dw_gi.GetRow(),'estado') = '0' then
	dw_gi.DeleteRow(dw_gi.GetRow())
	i_cambio = TRUE
else
	MessageBox('Atención','Solo puede borrar registros en estado Sin utilizar')
end if

end event

type pb_2 from picturebutton within w_cos_gi
integer x = 1746
integer y = 204
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Llevar todos los centros de Costo"
end type

event clicked;long ano, mes, f
string gasto

gasto = dw_gasto.GetItemString(1,'cod_gasto')
if isNull(gasto) then
	MessageBox('Atención','Debe seleccionar un gasto')
	Return -1
end if
if dw_gi.RowCount() = 0 then
	ano = year(today())
	mes = month(today())
	if mes = 1 then
		ano = ano - 1
		mes = 12
	else
		mes = mes -1
	end if
else
//	select max(anyo) into :ano from cos_gind_mes 
//	where cod_gasto = :gasto;
//	select max(mes) into :mes from cos_gind_mes 
//	where cod_gasto=:gasto and anyo=:ano;
ano = long(dw_gi.Describe("Evaluate('max(anyo)',0)"))
mes = long(dw_gi.Describe("Evaluate('max(if(anyo="+string(ano)+",mes,0))',0)"))
end if
if mes = 12 then
	ano = ano + 1
	mes = 1
else
	mes = mes + 1
end if
f = dw_gi.InsertRow(0)
dw_gi.SetItem(f,'cod_gasto',gasto)
dw_gi.SetItem(f,'anyo',ano)
dw_gi.SetItem(f,'mes',mes)
dw_gi.SetItem(f,'estado','0')
dw_gi.Scrolltorow(f)
i_cambio = TRUE

end event

type dw_gi from datawindow within w_cos_gi
integer x = 18
integer y = 204
integer width = 1650
integer height = 808
integer taborder = 20
string title = "none"
string dataobject = "dw_gind_mes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
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

type dw_gasto from datawindow within w_cos_gi
integer x = 14
integer y = 4
integer width = 1257
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_gi"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string gasto
gasto = GetItemString(1,'cod_gasto')
choose case f_pregunta()
	case 1//yes
		if pb_save.Event clicked()=-1 then 
			SetItem(1,'cod_gasto',gasto)
			return 2
		end if
	case 2//no
		i_cambio=false
	case 3//cancel
		SetItem(1,'cod_gasto',gasto)
		return 2
end choose

dw_gi.retrieve(data)

end event

