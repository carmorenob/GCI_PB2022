$PBExportHeader$w_cos_deprecia.srw
forward
global type w_cos_deprecia from window
end type
type pb_1 from picturebutton within w_cos_deprecia
end type
type pb_save from picturebutton within w_cos_deprecia
end type
type pb_4 from picturebutton within w_cos_deprecia
end type
type pb_2 from picturebutton within w_cos_deprecia
end type
type dw_gi from datawindow within w_cos_deprecia
end type
type dw_ufcc from datawindow within w_cos_deprecia
end type
end forward

global type w_cos_deprecia from window
integer width = 3246
integer height = 1588
boolean titlebar = true
string title = "Gastos Indirectos por mes"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_1 pb_1
pb_save pb_save
pb_4 pb_4
pb_2 pb_2
dw_gi dw_gi
dw_ufcc dw_ufcc
end type
global w_cos_deprecia w_cos_deprecia

type variables
boolean i_cambio
DataWindowChild dw_cc, dw_dep
string uf,cc

end variables

forward prototypes
public function integer f_pregunta ()
end prototypes

public function integer f_pregunta ();if not i_cambio then return 2
return messagebox("Atención",'Realizó cambios, desea guardarlos?' ,question!,yesnocancel!,3)

end function

on w_cos_deprecia.create
this.pb_1=create pb_1
this.pb_save=create pb_save
this.pb_4=create pb_4
this.pb_2=create pb_2
this.dw_gi=create dw_gi
this.dw_ufcc=create dw_ufcc
this.Control[]={this.pb_1,&
this.pb_save,&
this.pb_4,&
this.pb_2,&
this.dw_gi,&
this.dw_ufcc}
end on

on w_cos_deprecia.destroy
destroy(this.pb_1)
destroy(this.pb_save)
destroy(this.pb_4)
destroy(this.pb_2)
destroy(this.dw_gi)
destroy(this.dw_ufcc)
end on

event open;dw_ufcc.GetChild('codcc',dw_cc)
dw_cc.SetTransObject(SQLCA)


end event

type pb_1 from picturebutton within w_cos_deprecia
integer x = 2971
integer y = 672
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

event clicked;open(w_cos_deprecia_dep)
end event

type pb_save from picturebutton within w_cos_deprecia
integer x = 2971
integer y = 468
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
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

type pb_4 from picturebutton within w_cos_deprecia
integer x = 2971
integer y = 340
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
string powertiptext = "Borrar Registro"
end type

event clicked;if dw_gi.RowCount() = 0 then Return 0
if dw_gi.GetItemString(dw_gi.GetRow(),'estado') = '0' then
	dw_gi.DeleteRow(dw_gi.GetRow())
	i_cambio = TRUE
else
	MessageBox('Atención','Solo puede borrar registros en estado Sin utilizar')
end if

end event

type pb_2 from picturebutton within w_cos_deprecia
integer x = 2971
integer y = 212
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
string powertiptext = "Insertar Registro"
end type

event clicked;long ano, mes, f

if isNull(cc) then
	MessageBox('Atención','Debe seleccionar un Centro de Costo')
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
ano = long(dw_gi.Describe("Evaluate('max(ano)',0)"))
mes = long(dw_gi.Describe("Evaluate('max(if(ano="+string(ano)+",mes,0))',0)"))
end if
if mes = 12 then
	ano = ano + 1
	mes = 1
else
	mes = mes + 1
end if
f = dw_gi.InsertRow(0)
dw_gi.SetItem(f,'coduf',uf)
dw_gi.SetItem(f,'codcc',cc)
dw_gi.SetItem(f,'ano',ano)
dw_gi.SetItem(f,'mes',mes)
dw_gi.SetItem(f,'estado','0')
dw_gi.Scrolltorow(f)
i_cambio = TRUE

end event

type dw_gi from datawindow within w_cos_deprecia
integer x = 50
integer y = 208
integer width = 2857
integer height = 1148
integer taborder = 20
string title = "none"
string dataobject = "dw_deprecia_mes"
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

type dw_ufcc from datawindow within w_cos_deprecia
integer x = 41
integer y = 36
integer width = 2263
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_uf_cc"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
dw_ufcc.GetChild('codcc',dw_cc)
dw_cc.SetTransObject(SQLCA)
dw_cc.retrieve()
dw_cc.setfilter("coduf=''")
dw_cc.filter()
InsertRow(1)

end event

event itemchanged;string vnul
uf = GetItemString(1,'coduf')
cc = GetItemString(1,'codcc')
choose case f_pregunta()
	case 1//yes
		if pb_save.Event clicked()=-1 then 
			SetItem(1,'coduf',uf)
			SetItem(1,'codcc',cc)
			return 2
		end if
	case 2//no
		i_cambio=false
	case 3//cancel
		SetItem(1,'coduf',uf)
		SetItem(1,'codcc',cc)
		return 2
end choose

AcceptText()
uf = GetItemString(1,'coduf')
cc = GetItemString(1,'codcc')
if this.getColumnName() = 'coduf' then
	setNull(vnul)
	this.setitem(1,'codcc',"")
	dw_cc.setfilter("coduf='"+uf+"'")
	dw_cc.filter()
	acceptText()
	setItem(1,'codcc',vnul)
	dw_gi.Reset()
else
	if dw_dep.Retrieve(uf,cc) = 0 then
		dw_dep.InsertRow(0)
	end if
	dw_gi.retrieve(uf,cc)
end if

end event

