$PBExportHeader$w_busca_diag.srw
forward
global type w_busca_diag from window
end type
type st_5 from statictext within w_busca_diag
end type
type ddlb_1 from dropdownlistbox within w_busca_diag
end type
type st_2 from statictext within w_busca_diag
end type
type st_4 from statictext within w_busca_diag
end type
type st_3 from statictext within w_busca_diag
end type
type cb_4 from picturebutton within w_busca_diag
end type
type cb_1 from picturebutton within w_busca_diag
end type
type sle_1 from singlelineedit within w_busca_diag
end type
type st_1 from statictext within w_busca_diag
end type
type dw_1 from datawindow within w_busca_diag
end type
type dw_2 from datawindow within w_busca_diag
end type
type gb_1 from groupbox within w_busca_diag
end type
type gb_2 from groupbox within w_busca_diag
end type
type stt_diag from multilineedit within w_busca_diag
end type
end forward

global type w_busca_diag from window
integer width = 3561
integer height = 1568
boolean titlebar = true
string title = "Buscar Diagnóstico"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
event filtrar pbm_keyup
st_5 st_5
ddlb_1 ddlb_1
st_2 st_2
st_4 st_4
st_3 st_3
cb_4 cb_4
cb_1 cb_1
sle_1 sle_1
st_1 st_1
dw_1 dw_1
dw_2 dw_2
gb_1 gb_1
gb_2 gb_2
stt_diag stt_diag
end type
global w_busca_diag w_busca_diag

type variables
string sort1,sort2
long color
st_edadsexo ist_ed_sex
st_diag ist_di

private string is_sql1="SELECT &
	diags.codgeral,diags.desdiag,diags.coddiag,   &
	diags.ccap,diags.cod_rips,diags_version.val_hasta,   &
	diags.guia,capdiags.antecedente  &
FROM &
	(diags_version INNER JOIN capdiags ON diags_version.c_version = capdiags.c_version) &
	INNER JOIN diags ON (capdiags.codcap = diags.ccap) AND (capdiags.c_version = diags.c_version)&
WHERE diags.estado='1' and diags.c_version='"

/*
	(case when :ante='1'  and capdiags.antecedente='X' then 1 else &
	case when :ante='0'  and capdiags.antecedente in ('0','1') then 1 else 0 end &
	end )=1) "*/

private string is_sql2=" union all SELECT DISTINCT &
	capdiags.codcap, capdiags.descap, capdiags.codcap, diags.ccap, capdiags.codcap, &
	diags_version.val_hasta, diags.guia, capdiags.antecedente &
FROM &
	(diags_version INNER JOIN capdiags ON diags_version.c_version = capdiags.c_version) &
	INNER JOIN diags ON (capdiags.codcap = diags.ccap) AND (capdiags.c_version = diags.c_version)&
WHERE diags.estado='1' and diags.c_version='"
	
//((case when :ante='1' and capdiags.antecedente='1' then 1 else 0 end=1 )&
	

end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();string campo
if ddlb_1.text='Código' then
	campo='cod_rips'
else
	campo='desdiag'
end if
if sle_1.text='' then
	dw_2.setfilter('')
else
	dw_2.setfilter("lower("+campo+") like '"+lower(trim(sle_1.text))+"%'")
end if
dw_2.filter()
dw_2.sort()
st_1.text=string(dw_2.rowcount())+' Registros'

end subroutine

on w_busca_diag.create
this.st_5=create st_5
this.ddlb_1=create ddlb_1
this.st_2=create st_2
this.st_4=create st_4
this.st_3=create st_3
this.cb_4=create cb_4
this.cb_1=create cb_1
this.sle_1=create sle_1
this.st_1=create st_1
this.dw_1=create dw_1
this.dw_2=create dw_2
this.gb_1=create gb_1
this.gb_2=create gb_2
this.stt_diag=create stt_diag
this.Control[]={this.st_5,&
this.ddlb_1,&
this.st_2,&
this.st_4,&
this.st_3,&
this.cb_4,&
this.cb_1,&
this.sle_1,&
this.st_1,&
this.dw_1,&
this.dw_2,&
this.gb_1,&
this.gb_2,&
this.stt_diag}
end on

on w_busca_diag.destroy
destroy(this.st_5)
destroy(this.ddlb_1)
destroy(this.st_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.stt_diag)
end on

event open;ist_ed_sex=message.powerobjectparm
dw_2.setsort("#2 a")
color=long(dw_2.describe("datawindow.color"))
datetime ahora
ahora=datetime(today())
string version
select c_version into :version from diags_version where val_hasta>=:ahora;
if isnull(version) then 
	messagebox("Atención","No existe una versión de diagnósticos activa")
else
	dw_1.setitem(1,1,version)
end if

sle_1.setfocus()
end event

type st_5 from statictext within w_busca_diag
integer x = 517
integer y = 428
integer width = 544
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Condición de Búsqueda:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_busca_diag
integer x = 110
integer y = 340
integer width = 370
integer height = 352
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"Código","Descripción"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text='Descripción'
end event

event modified;sle_1.event modified()
end event

type st_2 from statictext within w_busca_diag
integer x = 1358
integer y = 68
integer width = 1998
integer height = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Elija la versión del Diagnóstico, digite la condición (% es comodín) presione enter para buscar, escoja el deseado y presione aceptar o doble click."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_busca_diag
integer x = 2473
integer y = 428
integer width = 517
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de Registros:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_busca_diag
integer x = 114
integer y = 428
integer width = 283
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por :"
boolean focusrectangle = false
end type

type cb_4 from picturebutton within w_busca_diag
event mousemove pbm_mousemove
integer x = 1810
integer y = 1320
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;retorna_busqueda="!"
close(parent)
end event

type cb_1 from picturebutton within w_busca_diag
event mousemove pbm_mousemove
string tag = "&Agregar"
integer x = 1664
integer y = 1320
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_2.triggerevent(doubleclicked!)
end event

type sle_1 from singlelineedit within w_busca_diag
event teclear pbm_keyup
integer x = 512
integer y = 340
integer width = 1893
integer height = 88
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_sql
if trim(text)='' then return
If ist_ed_sex.antece='1' then	
	ls_sql=is_sql1+dw_1.getitemstring(1,1)+"' and capdiags.antecedente='X'" 
	if ddlb_1.text='Código' then
		ls_sql+=" and diags.coddiag like '%"+text+"%'"
		ls_sql+=is_sql2+dw_1.getitemstring(1,1)+"' and capdiags.antecedente='1'  and diags.cod_rips like '%"+text+"%'"
	else
		ls_sql+=" and diags.desdiag like '%"+text+"%'"
		ls_sql+=is_sql2+dw_1.getitemstring(1,1)+"' and capdiags.antecedente='1'  and diags.desdiag like '%"+text+"%'"
	end if
else
	ls_sql=is_sql1+dw_1.getitemstring(1,1)+"'   and capdiags.antecedente in ('0','1') " 
	if ddlb_1.text='Código' then
		ls_sql+=" and diags.cod_rips like '%"+text+"%'"
	else
		ls_sql+=" and diags.desdiag like '%"+text+"%'"
	end if
end if

int li_ret
li_ret=dw_2.setSqlSelect(ls_sql)
st_1.text=string(dw_2.retrieve())+' Regs.'
end event

type st_1 from statictext within w_busca_diag
integer x = 2464
integer y = 344
integer width = 613
integer height = 84
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_busca_diag
integer x = 69
integer y = 88
integer width = 1275
integer height = 140
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_combo_verdiag"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
sle_1.event modified()
end event

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

type dw_2 from datawindow within w_busca_diag
integer x = 114
integer y = 492
integer width = 3246
integer height = 644
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_diagstodos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;st_return_diags st
string este

if getrow() < 1 then return
este=getitemstring(getrow(),'codgeral')
if getitemdatetime(getrow(),"val_hasta")<datetime(today()) then
	if messagebox("Atención","Este diagnóstico ya no es válido, desea utilizarlo aún asi?",question!,yesno!,2)=2 then return
end if

if not ist_ed_sex.saltar_validacion then 
	st=f_check_diag(getitemstring(getrow(),'cod_rips'),ist_ed_sex.sexo,ist_ed_sex.edad,este,ist_ed_sex.antece)
	if st.descrip_diag="" then return
end if

ist_di.codgeral=este
ist_di.codrip=getitemstring(getrow(),'cod_rips')
ist_di.descripcion=getitemstring(getrow(),2)
ist_di.guia=getitemstring(getrow(),'guia')
ist_di.antecedente=getitemstring(getrow(),'antecedente')
closewithreturn(parent,ist_di)
end event

event clicked;if dwo.type="text" then
choose case dwo.name
	case "t_1"
		if sort1="#1 A" then
			sort1="#1 D"
		else
			sort1="#1 A"
		end if
		this.setsort(sort1)
	case "t_2"
		if sort2="#2 A" then
			sort2="#2 D"
		else
			sort2="#2 A"
		end if		
		this.setsort(sort2)		
end choose
this.sort()
end if
end event

event rowfocuschanged;if getrow()<1 then return
stt_diag.text=getitemstring(getrow(),"desdiag")
end event

event constructor;settransobject(sqlca)
end event

type gb_1 from groupbox within w_busca_diag
integer x = 37
integer y = 20
integer width = 3378
integer height = 248
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Versiones de Diagnósticos"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_busca_diag
integer x = 37
integer y = 276
integer width = 3410
integer height = 1032
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnósticos que cumplen la condición"
borderstyle borderstyle = styleraised!
end type

type stt_diag from multilineedit within w_busca_diag
integer x = 110
integer y = 1148
integer width = 3255
integer height = 136
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

