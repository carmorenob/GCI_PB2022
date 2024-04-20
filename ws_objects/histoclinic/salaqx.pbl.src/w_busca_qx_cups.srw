$PBExportHeader$w_busca_qx_cups.srw
forward
global type w_busca_qx_cups from window
end type
type st_3 from statictext within w_busca_qx_cups
end type
type pb_2 from picturebutton within w_busca_qx_cups
end type
type pb_1 from picturebutton within w_busca_qx_cups
end type
type dw_qxconf from datawindow within w_busca_qx_cups
end type
type ddlb_1 from dropdownlistbox within w_busca_qx_cups
end type
type st_cuantos from statictext within w_busca_qx_cups
end type
type st_2 from statictext within w_busca_qx_cups
end type
type dw_busca from datawindow within w_busca_qx_cups
end type
type gb_2 from groupbox within w_busca_qx_cups
end type
type sle_1 from singlelineedit within w_busca_qx_cups
end type
end forward

global type w_busca_qx_cups from window
integer width = 3534
integer height = 1692
boolean titlebar = true
string title = "Buscar Procedimientos Quirúrgicos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean clientedge = true
boolean center = true
st_3 st_3
pb_2 pb_2
pb_1 pb_1
dw_qxconf dw_qxconf
ddlb_1 ddlb_1
st_cuantos st_cuantos
st_2 st_2
dw_busca dw_busca
gb_2 gb_2
sle_1 sle_1
end type
global w_busca_qx_cups w_busca_qx_cups

type variables
string nautoriza,confirma_ge,proccups,rips,cod_concep,req_aut,proced,manual,l_sex_pa
datawindowchild i_dw_espe,idw_anes
st_cirug st
end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();string campo
choose case ddlb_1.text
	case 'Descrip. CUPS'
		campo='descripcion_cups'
	case 'Cód. CUPS'
		campo='codproced'
end choose
dw_busca.setfilter("lower("+campo+") like '"+lower(trim(sle_1.text))+"%'")
dw_busca.filter()
dw_busca.sort()
st_cuantos.text=string(dw_busca.rowcount())+' Registros'
end subroutine

on w_busca_qx_cups.create
this.st_3=create st_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_qxconf=create dw_qxconf
this.ddlb_1=create ddlb_1
this.st_cuantos=create st_cuantos
this.st_2=create st_2
this.dw_busca=create dw_busca
this.gb_2=create gb_2
this.sle_1=create sle_1
this.Control[]={this.st_3,&
this.pb_2,&
this.pb_1,&
this.dw_qxconf,&
this.ddlb_1,&
this.st_cuantos,&
this.st_2,&
this.dw_busca,&
this.gb_2,&
this.sle_1}
end on

on w_busca_qx_cups.destroy
destroy(this.st_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_qxconf)
destroy(this.ddlb_1)
destroy(this.st_cuantos)
destroy(this.st_2)
destroy(this.dw_busca)
destroy(this.gb_2)
destroy(this.sle_1)
end on

event open;st=message.powerobjectparm
datetime ahora
string version,des_vers

if w_principal.dw_1.getitemstring(1,"sexo")='F' then l_sex_pa='2'
if w_principal.dw_1.getitemstring(1,"sexo")='M' then l_sex_pa='1'

ahora=datetime(today())
select cod_version,des_version into :version,:des_vers from pm_cups_version where valido_hasta>=:ahora;
if isnull(version) then 
	messagebox("Atención","No existe una versión de Cups activa")
	return 
end if
if isnull(st.antecedente) then st.antecedente='0'
dw_busca.retrieve(version,l_sex_pa,st.cesp,st.antecedente)
st_3.text='Versión CUPS: '+ des_vers
filtrar()
end event

type st_3 from statictext within w_busca_qx_cups
integer x = 87
integer y = 1312
integer width = 2670
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = StyleRaised!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_busca_qx_cups
integer x = 1595
integer y = 1448
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "aceptar [Alt+A]"
end type

event clicked;dw_busca.triggerevent(doubleclicked!)
end event

type pb_1 from picturebutton within w_busca_qx_cups
integer x = 1755
integer y = 1448
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type dw_qxconf from datawindow within w_busca_qx_cups
boolean visible = false
integer x = 69
integer y = 1416
integer width = 82
integer height = 72
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_qxconf"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;this.settransobject(sqlca)
end event

type ddlb_1 from dropdownlistbox within w_busca_qx_cups
integer x = 91
integer y = 112
integer width = 471
integer height = 352
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Cód. CUPS","Descrip. CUPS","",""}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text='Descrip. CUPS'
end event

type st_cuantos from statictext within w_busca_qx_cups
integer x = 2903
integer y = 1312
integer width = 489
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
borderstyle borderstyle = StyleBox!
boolean focusrectangle = false
end type

type st_2 from statictext within w_busca_qx_cups
integer x = 91
integer y = 60
integer width = 1074
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por:                     (Caracter % es comodín)"
boolean focusrectangle = false
end type

type dw_busca from datawindow within w_busca_qx_cups
integer x = 82
integer y = 236
integer width = 3328
integer height = 1060
integer taborder = 30
string title = "none"
string dataobject = "dw_busca_procqx_cups"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

event doubleclicked;long fila
fila=this.getrow()
if fila<1 then return
proccups=this.getitemstring(fila,"codproced")
rips=this.getitemstring(fila,"rips")
string parto,manu,descrip
parto=this.getitemstring(fila,"parto")
descrip=this.getitemstring(fila,"descripcion_cups")
if dw_qxconf.retrieve(manu,proced)>0 then
	string sex_pa
	sex_pa=w_principal.dw_1.getitemstring(1,"sexo")
	if parto='1' and sex_pa='M' then
		messagebox("Atención","Este procedimiento es unicamente para sexo Femenino")
		return
	end if
	choose case dw_qxconf.getitemstring(1,"sexo")
		case "M"
			if sex_pa="F" then
				messagebox("Atención","Este procedimiento es unicamente para sexo masculino")
				return
			end if
		case "F"
			if sex_pa="M" then
				messagebox("Atención","Este procedimiento es unicamente para sexo femenino")
				return
			end if
		case "A"
	end choose
end if

st.proccups=proccups
st.cmanual=proced
st.descrip=descrip
st.tiempoqx=this.getitemnumber(fila,"tiempoqx")
closewithreturn(parent,st)

end event

type gb_2 from groupbox within w_busca_qx_cups
integer x = 37
integer y = 28
integer width = 3415
integer height = 1384
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type sle_1 from singlelineedit within w_busca_qx_cups
event teclear pbm_keyup
integer x = 576
integer y = 108
integer width = 2825
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

