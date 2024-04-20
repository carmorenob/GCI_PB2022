$PBExportHeader$w_acercade.srw
forward
global type w_acercade from window
end type
type p_1 from picture within w_acercade
end type
type p_2 from picture within w_acercade
end type
type sle_1 from singlelineedit within w_acercade
end type
type dw_1 from datawindow within w_acercade
end type
type pb_1 from picturebutton within w_acercade
end type
end forward

global type w_acercade from window
integer width = 2062
integer height = 1348
windowtype windowtype = response!
long backcolor = 12632256
boolean center = true
p_1 p_1
p_2 p_2
sle_1 sle_1
dw_1 dw_1
pb_1 pb_1
end type
global w_acercade w_acercade

type variables
real funciones[10,10],X1,Y1,XX,YY
int num_func,j
oleobject calendar
end variables

forward prototypes
public function integer randi ()
end prototypes

public function integer randi ();double semilla,ui
int escalon
semilla = (Rand(10) -1)/10
escalon = 1
ui = funciones[escalon,7]
DO WHILE semilla > ui
	If escalon = num_func Then return escalon
	If escalon < num_func Then
		escalon = escalon + 1
		ui = ui + funciones[escalon, 7]
	End If
LOOP
return escalon
end function

on w_acercade.create
this.p_1=create p_1
this.p_2=create p_2
this.sle_1=create sle_1
this.dw_1=create dw_1
this.pb_1=create pb_1
this.Control[]={this.p_1,&
this.p_2,&
this.sle_1,&
this.dw_1,&
this.pb_1}
end on

on w_acercade.destroy
destroy(this.p_1)
destroy(this.p_2)
destroy(this.sle_1)
destroy(this.dw_1)
destroy(this.pb_1)
end on

event timer;int e
for e=1 to 30
	dw_1.modify('create line(band=detail x1="'+string(x1 )+'" y1="'+string(y1 )+'" x2="'+string(x1+1)+'" y2="'+string(y1)+'"  name=l_1 pen.style="0" pen.width="1" pen.color="0"  background.mode="2" background.color="16777215" )')
	
	j =   randi()
	xx = funciones[j, 1] * x1 + funciones[j, 2] * y1 + funciones[j, 5] * 320
	yy = funciones[j, 3] * x1 + funciones[j, 4] * y1 + funciones[j, 6] * 240
	x1 = xx
	y1 = yy
next

end event

event open;setpointer(hourglass!)
u_version u_ver
u_ver=create u_version
sle_1.backcolor=rgb(92,202,255)	
sle_1.text+=g_version
if message.stringparm='asis' then
	p_2.picturename='pre_clinico.jpg'
elseif message.stringparm='adm' then
//	title='Gestión Cliente Interno'
	p_2.picturename='pre_cliente.jpg'
	//sle_1.backcolor=rgb(192,192,220)
elseif message.stringparm='conf' then
	//title='GCI Configurador'
	p_2.picturename='pre_configura.jpg'
//	p_2.originalsize=false
//	p_2.width=1900
//	p_2.height=1432
elseif message.stringparm='grep' then
	title='Generador de Reportes GCI'
end if
num_func=3
funciones[1,1]=0.5
funciones[1,2]=0
funciones[1,3]=0
funciones[1,4]=0.5
funciones[1,5]=-0.5
funciones[1,6]=0.5
funciones[1,7]=0.33
funciones[2,1]=0.5
funciones[2,2]=0
funciones[2,3]=0
funciones[2,4]=0.5
funciones[2,5]=0.5
funciones[2,6]=0.5
funciones[2,7]=0.33
funciones[3,1]=0.5
funciones[3,2]=0
funciones[3,3]=0
funciones[3,4]=0.5
funciones[3,5]=-0.5
funciones[3,6]=-0.5
funciones[3,7]=0.34
dw_1.insertrow(1)
randomize(0)

end event

type p_1 from picture within w_acercade
integer y = 1196
integer width = 2057
integer height = 140
string picturename = "derechos.jpg"
boolean focusrectangle = false
end type

type p_2 from picture within w_acercade
integer width = 2057
integer height = 1200
boolean bringtotop = true
string picturename = "pre_clinico.jpg"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_acercade
integer y = 916
integer width = 704
integer height = 116
integer taborder = 20
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 16777215
long backcolor = 0
string text = "  Build "
boolean border = false
boolean displayonly = true
end type

type dw_1 from datawindow within w_acercade
boolean visible = false
integer x = 1417
integer width = 558
integer height = 440
integer taborder = 10
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_factin"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;this.dataobject="dw_rep_prueb"
end event

type pb_1 from picturebutton within w_acercade
integer x = 1769
integer y = 936
integer width = 256
integer height = 100
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cerrar"
boolean cancel = true
boolean default = true
boolean originalsize = true
end type

event clicked;Close(parent)
end event

