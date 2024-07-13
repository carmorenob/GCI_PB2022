$PBExportHeader$w_copia_estima.srw
forward
global type w_copia_estima from window
end type
type pb_2 from picturebutton within w_copia_estima
end type
type pb_1 from picturebutton within w_copia_estima
end type
type tab_1 from tab within w_copia_estima
end type
type tabpage_1 from userobject within tab_1
end type
type dw_est from datawindow within tabpage_1
end type
type dw_fp from datawindow within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type gb_2 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_est dw_est
dw_fp dw_fp
gb_1 gb_1
gb_2 gb_2
end type
type tab_1 from tab within w_copia_estima
tabpage_1 tabpage_1
end type
end forward

global type w_copia_estima from window
integer width = 5467
integer height = 1988
boolean titlebar = true
string title = "Copia Estimación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
tab_1 tab_1
end type
global w_copia_estima w_copia_estima

type variables
st_contratos st_parm
end variables

on w_copia_estima.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.tab_1=create tab_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.tab_1}
end on

on w_copia_estima.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.tab_1)
end on

event open;st_parm = Message.PowerObjectParm
tab_1.tabpage_1.dw_fp.retrieve(st_parm.anyo,st_parm.ncon,st_parm.otros,st_parm.item,st_parm.monto)
end event

type pb_2 from picturebutton within w_copia_estima
integer x = 2816
integer y = 1756
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_copia_estima
integer x = 2647
integer y = 1756
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;integer l_itema

l_itema=tab_1.tabpage_1.dw_fp.getitemnumber(tab_1.tabpage_1.dw_fp.getrow(),'item')

INSERT INTO contra_fpago_causa ( ano, ncontrato, otrosi, item, cod_rel, codlugar, coduf, codcc,usuario,monto,monto_vigente )
SELECT 
	ano,ncontrato,otrosi,:st_parm.item,cod_rel,codlugar,coduf,codcc, :usuario,monto,monto_vigente
FROM 
	contra_fpago_causa
WHERE 
	(((contra_fpago_causa.ano)=:st_parm.anyo) 
	AND ((contra_fpago_causa.ncontrato)=:st_parm.ncon) 
	AND ((contra_fpago_causa.otrosi)=:st_parm.otros) 
	AND ((contra_fpago_causa.item)=:l_itema)
	AND ((contra_fpago_causa.monto_vigente)>0));
	
If sqlca.sqlcode=-1 then
	messagebox("Error insertando fpago_causa",sqlca.sqlerrtext)
	rollback;
	return
Else
     commit;
 End If
 close(parent)

end event

type tab_1 from tab within w_copia_estima
integer x = 46
integer y = 20
integer width = 5385
integer height = 1732
integer taborder = 10
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
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5349
integer height = 1604
long backcolor = 67108864
string text = "Pago a Terceros"
long tabtextcolor = 33554432
string picturename = "Calculator.ico"
long picturemaskcolor = 536870912
dw_est dw_est
dw_fp dw_fp
gb_1 gb_1
gb_2 gb_2
end type

on tabpage_1.create
this.dw_est=create dw_est
this.dw_fp=create dw_fp
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_est,&
this.dw_fp,&
this.gb_1,&
this.gb_2}
end on

on tabpage_1.destroy
destroy(this.dw_est)
destroy(this.dw_fp)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type dw_est from datawindow within tabpage_1
integer x = 73
integer y = 780
integer width = 5221
integer height = 748
integer taborder = 30
string title = "none"
string dataobject = "dw_contra_fpago_causa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_fp from datawindow within tabpage_1
integer x = 32
integer y = 88
integer width = 5243
integer height = 528
integer taborder = 20
string title = "none"
string dataobject = "dw_contra_fpago_copy"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)


end event

event retrieveend;long i
if rowcount() = 0 or rowcount = 0 then Return
tab_1.tabpage_1.dw_est.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'),this.GetItemNumber(this.GetRow(),'item'))
for i = 1 to RowCount()
	SetItem(i,'porcentaje',round((GetItemNumber(i,'monto') / st_parm.monto) * 100,2))
next
end event

event rowfocuschanged;if RowCount() = 0 or currentrow = 0 then Return
tab_1.tabpage_1.dw_est.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'),this.GetItemNumber(this.GetRow(),'item'))
end event

type gb_1 from groupbox within tabpage_1
integer x = 32
integer y = 24
integer width = 5294
integer height = 648
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pago a Terceros"
end type

type gb_2 from groupbox within tabpage_1
integer x = 32
integer y = 712
integer width = 5294
integer height = 856
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estimación"
end type

