$PBExportHeader$w_pac_mod_gen.srw
forward
global type w_pac_mod_gen from window
end type
type sle_insertar from singlelineedit within w_pac_mod_gen
end type
type dw_2 from datawindow within w_pac_mod_gen
end type
type pb_buscar from picturebutton within w_pac_mod_gen
end type
type st_1 from statictext within w_pac_mod_gen
end type
type pb_cancelar from picturebutton within w_pac_mod_gen
end type
type pb_grabardef from picturebutton within w_pac_mod_gen
end type
type dw_1 from datawindow within w_pac_mod_gen
end type
type gb_1 from groupbox within w_pac_mod_gen
end type
end forward

global type w_pac_mod_gen from window
integer width = 2875
integer height = 1568
boolean titlebar = true
string title = "Modificación PAC"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_insertar sle_insertar
dw_2 dw_2
pb_buscar pb_buscar
st_1 st_1
pb_cancelar pb_cancelar
pb_grabardef pb_grabardef
dw_1 dw_1
gb_1 gb_1
end type
global w_pac_mod_gen w_pac_mod_gen

type variables
Datawindow dw_obj
long fila
end variables

on w_pac_mod_gen.create
this.sle_insertar=create sle_insertar
this.dw_2=create dw_2
this.pb_buscar=create pb_buscar
this.st_1=create st_1
this.pb_cancelar=create pb_cancelar
this.pb_grabardef=create pb_grabardef
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.sle_insertar,&
this.dw_2,&
this.pb_buscar,&
this.st_1,&
this.pb_cancelar,&
this.pb_grabardef,&
this.dw_1,&
this.gb_1}
end on

on w_pac_mod_gen.destroy
destroy(this.sle_insertar)
destroy(this.dw_2)
destroy(this.pb_buscar)
destroy(this.st_1)
destroy(this.pb_cancelar)
destroy(this.pb_grabardef)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_obj = Message.PowerObjectParm
if dw_obj.RowCount() = 0 then Return 0
dw_1.Retrieve(dw_obj.GetItemString(dw_obj.GetRow(),'codalmacen'), dw_obj.GetItemNumber(dw_obj.GetRow(),'ano'), dw_obj.GetItemNumber(dw_obj.GetRow(),'item'))

end event

type sle_insertar from singlelineedit within w_pac_mod_gen
integer x = 2085
integer y = 668
integer width = 553
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string descripcion, codigo, codgen
long  i, f

If fila=0 then 
	MessageBox("Atencion", 'Debe selecionar el producto ')
	return
end if
codigo = sle_insertar.Text
setNull(codgen)

select codgenerico into :codgen
from sumarticulo where codarticulo = :codigo;
IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
	Rollback;
	Return
end if
if not isNull(codgen) then codigo = codgen

select descripcion into :descripcion
from sumgenerico where codgenerico = :codigo;
IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
	Rollback;
	Return
ELSEIF SQLCA.SQLCode = 100 THEN 
	messageBox('Error','No existe generico con codigo ' + codigo)
ELSE
	f= dw_1.Find("codgenerico='" + codigo +"'",1,dw_1.RowCount())
	if f > 0 then
		messageBox('Aviso','El genérico '+ codigo +' ya esta incluido en el PAC actual debe cambiarlo o actualizar cantidades')
		dw_2.SetRow(f)
		dw_2.scrolltoRow(f)
	else
	//	dw_obj.RowsCopy(fila, fila, Primary!, dw_2, 1, Primary!)
	    dw_1.RowsCopy(fila, fila, Primary!, dw_2, 1, Primary!)
		f= dw_2.Find("codgenerico='" + codigo +"'",1,dw_2.RowCount())
		if f > 0 then
			messageBox('Aviso','El genérico '+ codigo +' ya esta incluido en el PAC actual')
			dw_2.DeleteRow(0)
		else
			f=1
			dw_2.scrolltoRow(f)
			dw_2.SetItem(f,'codalmacen',dw_1.GetItemString(fila,'codalmacen'))
			dw_2.SetItem(f,'ano',dw_1.GetItemNumber(fila,'ano'))
			dw_2.SetItem(f,'item',dw_1.GetItemNumber(fila,'item'))
			dw_2.SetItem(f,'codgenerico',codigo)
			dw_2.SetItem(f,'descripcion',descripcion)
			dw_2.SetItem(f,'fecha',today())
			dw_2.SetItem(f,'codgenerico_rem',dw_1.GetItemString(fila,'codgenerico'))
			dw_2.SetItem(f,'estado','M')
			dw_1.SetItem(fila,'estado','N')
		end if
	end if
	
END IF

end event

type dw_2 from datawindow within w_pac_mod_gen
integer x = 64
integer y = 824
integer width = 2747
integer height = 444
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_paccpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type pb_buscar from picturebutton within w_pac_mod_gen
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 2665
integer y = 652
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.gif"
string disabledname = "d_Buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;openwithParm(w_buscaart,sle_insertar)

end event

type st_1 from statictext within w_pac_mod_gen
integer x = 78
integer y = 656
integer width = 1993
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione el generico que desea cambiar y luego digite el nuevo codigo a reemplazar o busquelo en los vinoculos y realice el cambio especifico"
boolean focusrectangle = false
end type

type pb_cancelar from picturebutton within w_pac_mod_gen
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 2528
integer y = 1332
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
string picturename = "Cancelar.gif"
string disabledname = "d_Cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_grabardef from picturebutton within w_pac_mod_gen
event mousemove pbm_mousemove
string tag = "GrabarTemporal"
integer x = 2674
integer y = 1332
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "GrabarTemporal"
end type

event clicked;long f
string ca
if dw_1.AcceptText() = -1 then Return -1
if f_sol_permiso(this,'PAC') <> 1 then Return
dw_2.RowsCopy(1, dw_2.RowCount(), Primary!, dw_1, 1, Primary!)
if dw_1.Update() = -1 then
	Rollback;
end if

w_pac.dw_paccab.TriggerEvent(rowfocuschanged!)
f = w_pac.dw_paccpo.Find("codgenerico='"+dw_1.GetItemString(1,'codgenerico')+"'",1,w_pac.dw_paccpo.RowCount())
if f> 0 then
	w_pac.dw_paccpo.Scrolltorow(f)
end if
close(parent)

end event

type dw_1 from datawindow within w_pac_mod_gen
integer x = 50
integer y = 40
integer width = 2747
integer height = 572
integer taborder = 10
string title = "none"
string dataobject = "dw_paccpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event clicked;if row>0 then
	dw_1.AcceptText ( )
	sle_insertar.Text=dw_1.GetItemString(row,'codgenerico')
	fila=row
end if
end event

type gb_1 from groupbox within w_pac_mod_gen
integer x = 55
integer y = 592
integer width = 2802
integer height = 220
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

