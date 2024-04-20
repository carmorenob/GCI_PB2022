$PBExportHeader$w_insumo.srw
$PBExportComments$impuestos
forward
global type w_insumo from window
end type
type pb_5 from picturebutton within w_insumo
end type
type dw_digita from datawindow within w_insumo
end type
type pb_8 from picturebutton within w_insumo
end type
type st_2 from statictext within w_insumo
end type
type pb_4 from picturebutton within w_insumo
end type
type pb_3 from picturebutton within w_insumo
end type
type pb_2 from picturebutton within w_insumo
end type
type pb_1 from picturebutton within w_insumo
end type
type dw_det from datawindow within w_insumo
end type
type st_1 from statictext within w_insumo
end type
type st_5 from statictext within w_insumo
end type
type st_cuantos from statictext within w_insumo
end type
type dw_1 from datawindow within w_insumo
end type
type gb_1 from groupbox within w_insumo
end type
end forward

global type w_insumo from window
integer width = 2990
integer height = 2084
boolean titlebar = true
string title = "Costos - Tablas Básicas - Insumos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "Query5!"
string pointer = "Arrow!"
event inicializa pbm_open
pb_5 pb_5
dw_digita dw_digita
pb_8 pb_8
st_2 st_2
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_det dw_det
st_1 st_1
st_5 st_5
st_cuantos st_cuantos
dw_1 dw_1
gb_1 gb_1
end type
global w_insumo w_insumo

type variables
string tipo_col,anterior,orden

end variables

forward prototypes
public subroutine muestra ()
end prototypes

public subroutine muestra ();dw_1.accepttext()
if dw_1.rowcount()=0 then return
dw_det.retrieve(dw_1.getitemstring(dw_1.getrow(),'cod_insumo'))

end subroutine

on w_insumo.create
this.pb_5=create pb_5
this.dw_digita=create dw_digita
this.pb_8=create pb_8
this.st_2=create st_2
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_det=create dw_det
this.st_1=create st_1
this.st_5=create st_5
this.st_cuantos=create st_cuantos
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_5,&
this.dw_digita,&
this.pb_8,&
this.st_2,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_det,&
this.st_1,&
this.st_5,&
this.st_cuantos,&
this.dw_1,&
this.gb_1}
end on

on w_insumo.destroy
destroy(this.pb_5)
destroy(this.dw_digita)
destroy(this.pb_8)
destroy(this.st_2)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_det)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_cuantos)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event resize;//dw_1.resize(newwidth - 100 , newheight - 280)
//cb_1.x=(newwidth - 1800)/2
//cb_1.y=newheight - 120
//cb_2.x=(newwidth - 1800)/2 +300
//cb_2.y=newheight - 120
//cb_4.x=(newwidth - 1800)/2 +600
//cb_4.y=newheight - 120
//cb_3.x=(newwidth - 1800)/2 +900
//cb_3.y=newheight - 120
//cb_5.x=(newwidth - 1800)/2 +1200
//cb_5.y=newheight - 120
//cb_6.x=(newwidth - 1800)/2 +1500
//cb_6.y=newheight - 120
//st_cuantos.x=newwidth - 520
//st_cuantos.y=newheight - 170
end event

event open;dw_1.retrieve()
end event

type pb_5 from picturebutton within w_insumo
integer x = 795
integer y = 1036
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "buscar.gif"
string powertiptext = "Buscar genérico"
end type

event clicked;openwithparm(w_busca_gener,dw_digita)
if message.stringparm<>'' then
	dw_digita.setitem(1,1,message.stringparm)
	dw_digita.event itemchanged(1,dw_digita.object.edita,message.stringparm)
end if
end event

type dw_digita from datawindow within w_insumo
event keyup pbm_dwnkey
integer x = 59
integer y = 984
integer width = 663
integer height = 136
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_paraediciones"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event constructor;insertrow(1)
modify('edita.validationmsg="Este generico no existe"')
end event

event itemchanged;if dw_1.rowcount()=0 then return
string descrip,codgen,cmedica
long donde
setnull(descrip)
cmedica=trim(gettext())
if cmedica='' then return
SELECT Medicamentos.Medicamento, sumgenerico.codgenerico
into :descrip,:codgen
FROM Medicamentos INNER JOIN sumgenerico ON Medicamentos.c_medica = sumgenerico.c_medica
WHERE (((Medicamentos.c_medica)=:cmedica));

if isnull(descrip) then
	return 1
else
	donde=dw_det.find('c_medica="'+cmedica+'"',1,dw_det.rowcount())
	if donde=0 then
		dw_det.insertrow(1)
		dw_det.setitem(1,'codgenerico',codgen)
		dw_det.setitem(1,'medicamento',descrip)
		dw_det.setitem(1,'c_medica',cmedica)
		settext('')
		dw_det.setitemstatus(1,0,primary!,datamodified!)
		dw_det.setitemstatus(1,0,primary!,notmodified!)
		dw_det.setitem(1,'cod_insumo',dw_1.getitemstring(dw_1.getrow(),'cod_insumo'))
	else
		dw_det.setrow(donde)
	end if
	dw_det.setrow(1)
	settext('')
	setitem(1,1,'')
	return 2 
end if
end event

type pb_8 from picturebutton within w_insumo
integer x = 965
integer y = 1036
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if messagebox('Atención','Está seguro que desea borrar este registro (Se borra inmediatamente, no es necesario guardar luego)',question!,yesno!,2)=2 then return
string nulo
setnull(nulo)
dw_det.setitem(dw_det.getrow(),'cod_insumo',nulo)
if dw_det.update()=-1 then
	rollback;
else
	commit;
end if
dw_1.triggerevent(rowfocuschanged!)
end event

type st_2 from statictext within w_insumo
integer x = 73
integer y = 1132
integer width = 343
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Genericos:"
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_insumo
integer x = 2235
integer y = 508
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &g"
string picturename = "guardar.gif"
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;dw_1.accepttext()
if dw_1.update()<1 then
	rollback;
	dw_1.reset()
	dw_1.retrieve()
	return
end if
if dw_det.update()=-1 then
	rollback;
	dw_1.reset()
	dw_1.retrieve()
	return
end if
dw_1.triggerevent(rowfocuschanged!)
commit;
end event

type pb_3 from picturebutton within w_insumo
integer x = 2235
integer y = 328
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &r"
string picturename = "refrescar.gif"
string powertiptext = "Refrescar [Alt+R]"
end type

event clicked;dw_1.retrieve()
end event

type pb_2 from picturebutton within w_insumo
integer x = 2235
integer y = 188
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &b"
string picturename = "borrar_fila.gif"
string powertiptext = "Borar [Alt+B]"
end type

event clicked;dw_1.deleterow(0)
end event

type pb_1 from picturebutton within w_insumo
integer x = 2235
integer y = 56
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &i"
string picturename = "insertar.gif"
string powertiptext = "Insertar [Alt+I]"
end type

event clicked;dw_1.scrolltorow(dw_1.insertrow(0))
dw_1.setfocus()
end event

type dw_det from datawindow within w_insumo
integer x = 46
integer y = 1180
integer width = 2843
integer height = 752
integer taborder = 80
string title = "none"
string dataobject = "dw_generico_x_insumo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_1 from statictext within w_insumo
integer x = 18
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Insumos:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_insumo
integer x = 1243
integer y = 4
integer width = 709
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Utilize click Contrario para Menu"
boolean focusrectangle = false
end type

type st_cuantos from statictext within w_insumo
integer x = 448
integer width = 622
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_insumo
event keypres pbm_dwnkey
integer x = 5
integer y = 64
integer width = 2185
integer height = 824
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_insumo"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_det.reset()
st_cuantos.text=''
if getrow()<1 then return
st_cuantos.text="Reg. "+ string(getrow()) +" de " +string(rowcount())
if not isnull(getitemstring(getrow(),'cod_insumo')) then muestra()

end event

event clicked;if dwo.type <> "text" then 
	if dwo.type="column" then
		tipo_col=describe(dwo.name+".coltype")
	end if
	return
end if
string cual,ojo,ss
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior=cual then
	if orden="A" then
		orden="D"
	else
		orden="A"
	end if
else
	orden="A"
end if
dw_1.setsort(cual+" "+orden)
dw_1.sort()
anterior=cual
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event constructor;settransobject(sqlca)
end event

event itemchanged;if dwo.name='cod_insumo' then
	long j
	for j=1 to dw_det.rowcount()
		dw_det.setitem(j,'cod_insumo',data)
	next
end if
end event

type gb_1 from groupbox within w_insumo
integer x = 18
integer y = 924
integer width = 2912
integer height = 1040
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Genéricos agrupados en el Insumo:"
end type

