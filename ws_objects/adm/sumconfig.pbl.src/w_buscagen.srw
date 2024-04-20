$PBExportHeader$w_buscagen.srw
forward
global type w_buscagen from window
end type
type cbx_2 from checkbox within w_buscagen
end type
type cbx_1 from checkbox within w_buscagen
end type
type rb_d from radiobutton within w_buscagen
end type
type rb_c from radiobutton within w_buscagen
end type
type st_1 from statictext within w_buscagen
end type
type sle_1 from singlelineedit within w_buscagen
end type
type dw_generico from datawindow within w_buscagen
end type
end forward

global type w_buscagen from window
integer width = 3712
integer height = 1044
boolean titlebar = true
string title = "Busqueda Genérico"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "entrega_med.ico"
cbx_2 cbx_2
cbx_1 cbx_1
rb_d rb_d
rb_c rb_c
st_1 st_1
sle_1 sle_1
dw_generico dw_generico
end type
global w_buscagen w_buscagen

type variables
datawindow dw_tmp
string ordenar[4]
end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();string busca
long fila

if sle_1.text='' then
	dw_generico.setfilter('')
else
	busca = upper(trim(sle_1.Text))
	if rb_c.checked then
		fila = dw_generico.setfilter("upper(codgenerico) like '"+busca+"%'")
	else
		fila = dw_generico.setfilter("upper(descripcion) like '"+busca+"%'")
	end if
	dw_generico.filter()
	dw_generico.sort()
end if

end subroutine

on w_buscagen.create
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.rb_d=create rb_d
this.rb_c=create rb_c
this.st_1=create st_1
this.sle_1=create sle_1
this.dw_generico=create dw_generico
this.Control[]={this.cbx_2,&
this.cbx_1,&
this.rb_d,&
this.rb_c,&
this.st_1,&
this.sle_1,&
this.dw_generico}
end on

on w_buscagen.destroy
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.rb_d)
destroy(this.rb_c)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.dw_generico)
end on

event open;dw_generico.SetTransObject(SQLCA)
dw_generico.Retrieve()
dw_tmp = Message.PowerObjectParm

end event

type cbx_2 from checkbox within w_buscagen
integer x = 2958
integer y = 88
integer width = 590
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Excluír Medicamentos"
boolean automatic = false
end type

event clicked;if checked then
	checked = FALSE
	dw_generico.SetFilter("")
	dw_generico.Filter()
else
	checked = TRUE
	cbx_1.checked = FALSE
	dw_generico.SetFilter("medicamento = '0'")
	dw_generico.Filter()
end if

end event

type cbx_1 from checkbox within w_buscagen
integer x = 2958
integer width = 402
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medicamentos"
boolean automatic = false
end type

event clicked;if checked then
	checked = FALSE
	dw_generico.SetFilter("")
	dw_generico.Filter()
else
	checked = TRUE
	cbx_2.checked = FALSE
	dw_generico.SetFilter("medicamento = '1'")
	dw_generico.Filter()
end if

end event

type rb_d from radiobutton within w_buscagen
integer x = 439
integer y = 84
integer width = 389
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción"
boolean checked = true
end type

type rb_c from radiobutton within w_buscagen
integer x = 46
integer y = 84
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código"
end type

type st_1 from statictext within w_buscagen
integer x = 59
integer y = 12
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_buscagen
event teclear pbm_keyup
integer x = 873
integer y = 76
integer width = 1819
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

type dw_generico from datawindow within w_buscagen
integer x = 50
integer y = 176
integer width = 3579
integer height = 728
integer taborder = 10
string title = "none"
string dataobject = "dw_buscagenerico"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event doubleclicked;if this.getrow() < 1 then return
string ret,cg,filtro
int ll, f
dwItemStatus l_status

if isvalid(dw_tmp) then
	f = dw_tmp.GetRow()
	l_status = dw_tmp.GetItemStatus(f,0,Primary!)
	cg = this.getItemString(this.getrow(),'codgenerico')
	
	ll = len(cg) + 2
	
	dw_tmp.SetRedraw(FALSE)
	filtro = dw_tmp.Describe("datawindow.table.Filter")
	if l_status = New! then
		dw_tmp.DeleteRow(f)
	end if
	dw_tmp.SetFilter("")
	dw_tmp.Filter()
	ret = dw_tmp.Describe("Evaluate(' max(long(if(codgenerico=~~'" + cg + "~~',mid(codarticulo,"+string(ll)+"),~~'0~~'))) ', 0)")
	if filtro <> '?' then 
		dw_tmp.SetFilter(filtro)
		dw_tmp.Filter()
	end if
	if l_status = New! then
		f = dw_tmp.InsertRow(0)
	end if
	dw_tmp.SetRedraw(TRUE)
	dw_tmp.ScrolltoRow(f)
	
	if GetItemString(GetRow(),'act_fijo') = '1' then
		dw_tmp.setItem(f,'tipoarticulo','A')
		dw_tmp.setItem(f,'act_fijo','1')
	else
		dw_tmp.setItem(f,'tipoarticulo','')
		dw_tmp.setItem(f,'act_fijo','0')		
	end if
	
	if isNull(ret) then ret = '0'
	if isNumber(ret) then
		if not isNull(dw_tmp.GetItemString(f,'codgenerico')) then
			if cg <> dw_tmp.GetItemString(f,'codgenerico') then
				dw_tmp.setItem(f,'codgenerico',cg)
				dw_tmp.SetItem(f,'codarticulo',cg+'-'+string(long(ret) + 1))
				dw_tmp.setitem(f,'descgen',this.getitemstring(this.getrow(),'descripcion'))
				dw_tmp.SetColumn('fabricante')
				dw_tmp.TriggerEvent(itemchanged!)
			end if
		else
			dw_tmp.setItem(f,'codgenerico',cg)
			dw_tmp.SetItem(f,'codarticulo',cg+'-'+string(long(ret) + 1))
			dw_tmp.setitem(f,'descgen',this.getitemstring(this.getrow(),'descripcion'))
			dw_tmp.SetColumn('fabricante')
			dw_tmp.TriggerEvent(itemchanged!)
		end if
	end if
else
	closewithreturn(parent,getItemString(getrow(),'codgenerico'))
	return
end if
close(parent)

end event

event clicked;if dwo.type="text" then
choose case dwo.name
	case "codgenerico_t"
		if ordenar[1]="#1 A" then
			ordenar[1]="#1 D"
		else
			ordenar[1]="#1 A"
		end if
		this.setsort(ordenar[1])
	case "descripcion_t"
		if ordenar[2]="#2 A" then
			ordenar[2]="#2 D"
		else
			ordenar[2]="#2 A"
		end if
		this.setsort(ordenar[2])
	case "medicamento_t"
		if ordenar[3]="#3 A" then
			ordenar[3]="#3 D"
		else
			ordenar[3]="#3 A"
		end if
		this.setsort(ordenar[3])
	case "c_medica_t"
		if ordenar[4]="#3 A" then
			ordenar[4]="#3 D"
		else
			ordenar[4]="#3 A"
		end if
		this.setsort(ordenar[4])
end choose

this.sort()
end if

end event

