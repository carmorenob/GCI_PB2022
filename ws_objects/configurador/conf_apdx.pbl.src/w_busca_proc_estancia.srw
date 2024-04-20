$PBExportHeader$w_busca_proc_estancia.srw
forward
global type w_busca_proc_estancia from window
end type
type pb_1 from picturebutton within w_busca_proc_estancia
end type
type pb_2 from picturebutton within w_busca_proc_estancia
end type
type st_2 from statictext within w_busca_proc_estancia
end type
type st_1 from statictext within w_busca_proc_estancia
end type
type dw_2 from datawindow within w_busca_proc_estancia
end type
type sle_1 from singlelineedit within w_busca_proc_estancia
end type
end forward

global type w_busca_proc_estancia from window
integer x = 201
integer y = 200
integer width = 3008
integer height = 1244
boolean titlebar = true
string title = "Buscar Procedimento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Query5!"
string pointer = "Arrow!"
event teclear pbm_syskeydown
event filtrar pbm_keyup
pb_1 pb_1
pb_2 pb_2
st_2 st_2
st_1 st_1
dw_2 dw_2
sle_1 sle_1
end type
global w_busca_proc_estancia w_busca_proc_estancia

type variables
datawindowchild capitul,grup
end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();dw_2.setfilter("agrupser='06' and lower(descripcion) like '"+lower(trim(sle_1.text))+"%'")
dw_2.filter()
dw_2.sort()
st_1.text=string(dw_2.rowcount())+' Registros'
end subroutine

on w_busca_proc_estancia.create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_2=create st_2
this.st_1=create st_1
this.dw_2=create dw_2
this.sle_1=create sle_1
this.Control[]={this.pb_1,&
this.pb_2,&
this.st_2,&
this.st_1,&
this.dw_2,&
this.sle_1}
end on

on w_busca_proc_estancia.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.sle_1)
end on

event open;string des_vers,version
//VERIFICAR VERSION ACTIVA CUPS
datetime ahora

ahora=datetime(today())
select cod_version,des_version into :version,:des_vers from pm_cups_version where valido_hasta>=:ahora;
if isnull(version) then 
	messagebox("Atención","No existe una versión de Cups activa")
	return 
end if

dw_2.retrieve(version)
dw_2.setsort("#2 a")
filtrar()
end event

type pb_1 from picturebutton within w_busca_proc_estancia
integer x = 1289
integer y = 1008
integer width = 146
integer height = 128
integer taborder = 50
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

event clicked;dw_2.triggerevent(doubleclicked!)
end event

type pb_2 from picturebutton within w_busca_proc_estancia
integer x = 1463
integer y = 1008
integer width = 151
integer height = 132
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cerrar Ventana"
end type

event clicked;closewithreturn(parent,'')
end event

type st_2 from statictext within w_busca_proc_estancia
integer x = 41
integer y = 20
integer width = 645
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por &Descripción:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_busca_proc_estancia
integer x = 2341
integer y = 996
integer width = 608
integer height = 92
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_busca_proc_estancia
integer x = 27
integer y = 200
integer width = 2926
integer height = 784
integer taborder = 30
string dragicon = "none!"
string dataobject = "dw_procedimi"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;st_1.text=string(this.rowcount())+' Registros'
end event

event doubleclicked;if getrow()<1 then return
IF IsValid(w_contr_estancia) THEN
	long fila
	fila=w_contr_estancia.dw_1.insertrow(0)
	w_contr_estancia.dw_1.setitem(fila,6,getitemstring(getrow(),1))
	w_contr_estancia.dw_1.setitem(fila,7,getitemstring(getrow(),2))
	w_contr_estancia.dw_1.scrolltorow(fila)
	return
end if
closewithreturn(parent,getitemstring(getrow(),"codproced"))
end event

event constructor;settransobject(sqlca)
end event

type sle_1 from singlelineedit within w_busca_proc_estancia
event teclear pbm_keyup
integer x = 41
integer y = 84
integer width = 2039
integer height = 80
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
textcase textcase = upper!
integer accelerator = 100
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

