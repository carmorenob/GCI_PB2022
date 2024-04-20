$PBExportHeader$w_busca_cert.srw
forward
global type w_busca_cert from window
end type
type st_1 from statictext within w_busca_cert
end type
type pb_1 from picturebutton within w_busca_cert
end type
type pb_ok from picturebutton within w_busca_cert
end type
type dw_res from datawindow within w_busca_cert
end type
type pb_busca from picturebutton within w_busca_cert
end type
type dw_terce from datawindow within w_busca_cert
end type
end forward

global type w_busca_cert from window
integer width = 2866
integer height = 1116
boolean titlebar = true
string title = "Búsqueda de Certificados"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
st_1 st_1
pb_1 pb_1
pb_ok pb_ok
dw_res dw_res
pb_busca pb_busca
dw_terce dw_terce
end type
global w_busca_cert w_busca_cert

type variables
st_xa_elegir cuall
end variables

on w_busca_cert.create
this.st_1=create st_1
this.pb_1=create pb_1
this.pb_ok=create pb_ok
this.dw_res=create dw_res
this.pb_busca=create pb_busca
this.dw_terce=create dw_terce
this.Control[]={this.st_1,&
this.pb_1,&
this.pb_ok,&
this.dw_res,&
this.pb_busca,&
this.dw_terce}
end on

on w_busca_cert.destroy
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.pb_ok)
destroy(this.dw_res)
destroy(this.pb_busca)
destroy(this.dw_terce)
end on

event open;cuall=message.powerobjectparm
end event

type st_1 from statictext within w_busca_cert
integer x = 2213
integer y = 852
integer width = 603
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_busca_cert
event mousemove pbm_mousemove
integer x = 1531
integer y = 868
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &c"
boolean cancel = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;closewithreturn(parent,cuall)
end event

type pb_ok from picturebutton within w_busca_cert
integer x = 1381
integer y = 868
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &a"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_res.triggerevent(doubleclicked!)
end event

type dw_res from datawindow within w_busca_cert
integer x = 32
integer y = 168
integer width = 2766
integer height = 676
integer taborder = 30
string title = "none"
string dataobject = "dw_certifidos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event doubleclicked;if getrow()<1 then return

cuall.titulo=dw_res.getitemstring(row,'cod_rep')
cuall.ancho=dw_res.getitemnumber(row,'nro_rep')
closewithreturn(parent,cuall)
end event

event rowfocuschanged;st_1.Text = 'Registro ' + string(GetRow()) + ' de ' +string(RowCount())

end event

type pb_busca from picturebutton within w_busca_cert
event mousemove pbm_mousemove
integer x = 2651
integer y = 20
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &b"
boolean default = true
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar [Alt+B]"
end type

event clicked;dw_terce.accepttext()
string sql
if isnull(dw_terce.getitemstring(1,'documento')) then return
if dw_res.retrieve(dw_terce.getitemstring(1,'tipodoc'),dw_terce.getitemstring(1,'documento'))=0 then messagebox('Atención','No se encontraror Registros')
end event

type dw_terce from datawindow within w_busca_cert
integer x = 27
integer y = 12
integer width = 2651
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event doubleclicked;if dwo.name='documento' then
	g_tercerodesde=1
	openwithparm(w_buscater,this)
	setcolumn('documento')
	event itemchanged(1,object.documento,getitemstring(1,'documento'))
end if
end event

event itemchanged;accepttext()
string doc,tdoc
tdoc=getitemstring(1,"tipodoc")
doc=getitemstring(1,"documento")
string snulo
setnull(snulo)
if dwo.name="tipodoc" and doc <> "" then
	setitem(1,"documento",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,'tel1',snulo)
	setitem(1,'persona',snulo)
	return
end if
if dwo.name="documento" and doc = "" then 
	setitem(1,'nombre1',snulo)
	setitem(1,'persona',snulo)
end if
if dwo.name="documento" and doc <> "" then
	if retrieve(tdoc,doc)=0 then
		insertrow(1)
		setitem(1,1,tdoc)
		setitem(1,2,doc)
		messagebox("Atención",'Tercero no existe')
	else
		//tab_3.t3_1.dw_cont.retrieve(tdoc,doc)
	end if
end if
end event

