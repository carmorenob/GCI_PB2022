$PBExportHeader$w_muestra_imag.srw
forward
global type w_muestra_imag from window
end type
type em_2 from editmask within w_muestra_imag
end type
type st_object from statictext within w_muestra_imag
end type
type cbx_1 from checkbox within w_muestra_imag
end type
type st_fondo_t from statictext within w_muestra_imag
end type
type st_linea_t from statictext within w_muestra_imag
end type
type dd_t from dropdownlistbox within w_muestra_imag
end type
type pb_5 from picturebutton within w_muestra_imag
end type
type dd_f from dropdownlistbox within w_muestra_imag
end type
type st_fondo from statictext within w_muestra_imag
end type
type st_linea from statictext within w_muestra_imag
end type
type p_muestra from picture within w_muestra_imag
end type
type p_1 from picture within w_muestra_imag
end type
type dw_1 from datawindow within w_muestra_imag
end type
type pb_4 from picturebutton within w_muestra_imag
end type
type pb_3 from picturebutton within w_muestra_imag
end type
type pb_1 from picturebutton within w_muestra_imag
end type
type st_zoom from statictext within w_muestra_imag
end type
type st_3 from statictext within w_muestra_imag
end type
end forward

global type w_muestra_imag from window
integer width = 3168
integer height = 1716
boolean titlebar = true
string title = "Imágenes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_2 em_2
st_object st_object
cbx_1 cbx_1
st_fondo_t st_fondo_t
st_linea_t st_linea_t
dd_t dd_t
pb_5 pb_5
dd_f dd_f
st_fondo st_fondo
st_linea st_linea
p_muestra p_muestra
p_1 p_1
dw_1 dw_1
pb_4 pb_4
pb_3 pb_3
pb_1 pb_1
st_zoom st_zoom
st_3 st_3
end type
global w_muestra_imag w_muestra_imag

type variables
st_edita_imag i_imag
dwobject i_dwo
long i_cont_objs=0
end variables

forward prototypes
public function string f_busca_nombre (string p_nombre)
end prototypes

public function string f_busca_nombre (string p_nombre);long j=1
string temp
do
	temp=dw_1.describe(p_nombre+string(j)+'.x')
	if temp='!' or temp='?' then exit
	j ++
loop until true=false
return p_nombre+string(j)
end function

on w_muestra_imag.create
this.em_2=create em_2
this.st_object=create st_object
this.cbx_1=create cbx_1
this.st_fondo_t=create st_fondo_t
this.st_linea_t=create st_linea_t
this.dd_t=create dd_t
this.pb_5=create pb_5
this.dd_f=create dd_f
this.st_fondo=create st_fondo
this.st_linea=create st_linea
this.p_muestra=create p_muestra
this.p_1=create p_1
this.dw_1=create dw_1
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_1=create pb_1
this.st_zoom=create st_zoom
this.st_3=create st_3
this.Control[]={this.em_2,&
this.st_object,&
this.cbx_1,&
this.st_fondo_t,&
this.st_linea_t,&
this.dd_t,&
this.pb_5,&
this.dd_f,&
this.st_fondo,&
this.st_linea,&
this.p_muestra,&
this.p_1,&
this.dw_1,&
this.pb_4,&
this.pb_3,&
this.pb_1,&
this.st_zoom,&
this.st_3}
end on

on w_muestra_imag.destroy
destroy(this.em_2)
destroy(this.st_object)
destroy(this.cbx_1)
destroy(this.st_fondo_t)
destroy(this.st_linea_t)
destroy(this.dd_t)
destroy(this.pb_5)
destroy(this.dd_f)
destroy(this.st_fondo)
destroy(this.st_linea)
destroy(this.p_muestra)
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_1)
destroy(this.st_zoom)
destroy(this.st_3)
end on

event open;i_imag=message.powerobjectparm
String ls_keyword,is_values[],archivo
Integer li_count, li_return,numarc
blob tt

archivo =i_imag.ruta
tt=f_lee_file_fisico(i_imag.ruta)
if string(tt)='!' then return
i_imag.image=tt
i_cont_objs=i_imag.nobjs
if isnull(i_cont_objs) then i_cont_objs=0
if i_cont_objs>0 then
	if dw_1.create(string(i_imag.objetos))=-1 then
		dw_1.dataobject='dw_ver_imag'
	end if
end if
dw_1.insertrow(1)
p_1.picturename=archivo
dw_1.object.datawindow.detail.height=p_1.height +100
dw_1.object.p_1.width=p_1.width
dw_1.object.p_1.height=p_1.height
dw_1.modify("p_1.filename='"+f_remplaza(archivo,char(126),char(126)+char(126))+"'")

//eso porque si devuelve un ~ saca error , deben ir dos pegados (~~)

end event

event resize;dw_1.resize(newwidth -4,newheight - 96)
end event

event close;i_imag.nobjs=i_cont_objs
if i_cont_objs>0 then
	i_imag.objetos=blob(dw_1.describe('datawindow.syntax'))
else
	setnull(i_imag.objetos)
end if
closewithreturn(this,i_imag)
end event

type em_2 from editmask within w_muestra_imag
event cambiando pbm_settext
integer x = 654
integer y = 24
integer width = 233
integer height = 72
integer taborder = 60
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 5
string minmax = "30~~250"
end type

event cambiando;IF long(text) <30 or long(text)>300 then return
dw_1.modify("datawindow.zoom="+this.text)
end event

event modified;IF long(THIS.text) <30 or long(THIS.text)>300 then
	messagebox("Atención","El valor es entre 30 y 300")
	this.text="100"
end if
dw_1.object.datawindow.zoom=long(text)


end event

type st_object from statictext within w_muestra_imag
integer x = 2674
integer y = 24
integer width = 306
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_muestra_imag
integer x = 2432
integer y = 40
integer width = 256
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Borde"
boolean checked = true
end type

event clicked;if not isvalid(i_dwo) or isnull(i_dwo) then return
if checked then
	i_dwo.border="2"
else
	i_dwo.border="0"
end if
end event

type st_fondo_t from statictext within w_muestra_imag
integer x = 1280
integer y = 56
integer width = 69
integer height = 52
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "T"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;st_fondo.text='T'
st_fondo.backcolor=backcolor
if not isvalid(i_dwo) or isnull(i_dwo) then return
choose case i_dwo.type
	case 'ellipse','rectangle'
		i_dwo.brush.hatch="7"
	case 'text'
		i_dwo.background.mode="1"
end choose
end event

type st_linea_t from statictext within w_muestra_imag
integer x = 1129
integer y = 56
integer width = 69
integer height = 52
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "T"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;st_linea.text='T'
st_linea.backcolor=backcolor
if not isvalid(i_dwo) or isnull(i_dwo) then return
choose case i_dwo.type
	case 'ellipse','rectangle'
		i_dwo.pen.style="5"
	case 'text'
		//i_dwo.background.mode="1"
end choose
end event

type dd_t from dropdownlistbox within w_muestra_imag
integer x = 2190
integer y = 20
integer width = 201
integer height = 608
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "12"
boolean allowedit = true
boolean vscrollbar = true
string item[] = {"6","7","8","9","10","11","12","14","16","18","20","22","24","26","28","36","48","72"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if not isvalid(i_dwo) or isnull(i_dwo) then return
i_dwo.font.height='-'+string(text)
end event

type pb_5 from picturebutton within w_muestra_imag
integer y = 16
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "flecha_azul.gif"
alignment htextalign = left!
string powertiptext = "Escoger"
end type

event clicked;p_muestra.picturename=picturename

end event

type dd_f from dropdownlistbox within w_muestra_imag
integer x = 1376
integer y = 20
integer width = 791
integer height = 772
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "Tahoma"
boolean allowedit = true
boolean autohscroll = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;environment env
string ruta,fon[]
GetEnvironment(env)
long i,j
Choose Case Env.OSType
	Case Windows!
	  If Env.OSMajorRevision = 4 Or Env.OSMinorRevision = 95 Then
		Ruta="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Fonts"
	  Else
		 Ruta="2"
	  End If
	Case windowsnt!
		Ruta="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Fonts"
End Choose
RegistryValues(Ruta,Fon)
For i=1 To UpperBound(Fon)
	j=Pos(fon[i]," (")
	If j<>0 Then
		AddItem(Mid(Fon[i],1,j - 1))		
	End If
Next
text='Tahoma'
end event

event selectionchanged;if not isvalid(i_dwo) or isnull(i_dwo) then return
i_dwo.font.face=string(text)
end event

type st_fondo from statictext within w_muestra_imag
integer x = 1216
integer y = 56
integer width = 69
integer height = 52
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "T"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;if ChooseColor ( backcolor )=1 then 
	text=''
	if not isvalid(i_dwo) or isnull(i_dwo) then return
	choose case i_dwo.type
		case 'rectangle','ellipse'
			i_dwo.brush.color=backcolor
			i_dwo.brush.hatch="6"
		case 'text'
			i_dwo.background.mode="2"
			i_dwo.background.color=backcolor
	end choose
end if
end event

type st_linea from statictext within w_muestra_imag
integer x = 1079
integer y = 56
integer width = 59
integer height = 56
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 0
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;if ChooseColor ( backcolor )=1 then 
	text=''
	if not isvalid(i_dwo) or isnull(i_dwo) then return
	choose case i_dwo.type
		case 'rectangle','ellipse'
			i_dwo.pen.style="0"
			i_dwo.pen.color=backcolor
		case 'text'
			i_dwo.color=backcolor
	end choose
end if
end event

type p_muestra from picture within w_muestra_imag
integer x = 978
integer y = 28
integer width = 78
integer height = 68
boolean originalsize = true
string picturename = "flecha.gif"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type p_1 from picture within w_muestra_imag
boolean visible = false
integer x = 3013
integer y = 16
integer width = 133
integer height = 84
boolean enabled = false
boolean originalsize = true
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_muestra_imag
event key pbm_dwnkey
integer y = 164
integer width = 3122
integer height = 1420
integer taborder = 30
string title = "none"
string dataobject = "dw_ver_imag"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event key;if isnull(i_dwo) or not isvalid(i_dwo) then return
if key=keydelete! then
	modify('destroy '+string(i_dwo.name))
	setnull(i_dwo)
	st_object.text=''
	i_cont_objs --
end if
end event

event clicked;string temp,texto
choose case dwo.type
	case 'datawindow','bitmap'
		choose case p_muestra.picturename
			case 'texto_azul.gif'
				temp='create text(band=detail alignment="0" color="'+string(st_linea.backcolor)+'" x="'+string(pointerx()*100/long(em_2.text) +long(Object.DataWindow.HorizontalScrollPosition))+'" y="'+string(pointery()*100/long(em_2.text)+long(Object.DataWindow.VerticalScrollPosition))+'" height="250" width="380"  name='+f_busca_nombre('text_')+'  font.face="'+dd_f.text+'" font.height="-'+dd_t.text+'" font.weight="400"  font.family="0" font.pitch="2" font.charset="0" background.color="'+string(st_fondo.backcolor)+'" moveable=1 resizeable=1 pointer="HyperLink!" '
				open(w_texto)
				texto=message.stringparm
				if trim(texto)='' then return
				temp+='text="'+texto+'"'
				if cbx_1.checked then
					temp+=' border="2" ' 
				else
					temp+=' border="0" ' 
				end if
				if st_fondo.text='T' then
					temp+=' background.mode="1" '
				else
					temp+=' background.mode="2" '
				end if
				temp+=' )'
				dw_1.modify(temp)
				st_object.text=''
				i_cont_objs++
			case 'flecha_azul.gif'
				setnull(i_dwo)
				dd_f.enabled=false
				dd_t.enabled=false
				cbx_1.enabled=false
				st_object.text=''
			case 'circulo_azul.gif'
				temp='create ellipse(band=detail x="'+string(pointerx()*100/long(em_2.text) +long(Object.DataWindow.HorizontalScrollPosition))+'" y="'+string(pointery()*100/long(em_2.text)+long(Object.DataWindow.VerticalScrollPosition))+'" height="120" width="137"  name='+f_busca_nombre('oval_')+' visible="1" brush.color="553648127" pen.width="5" pen.color="'+string(st_linea.backcolor)+'"  background.mode="1" background.color="0" moveable=1 resizeable=1 pointer="HyperLink!" '
				if st_linea.text='T' then
					temp+=' pen.style="5" '
				else
					temp+=' pen.style="0" '
				end if
				if st_fondo.text='T' then
					temp+=' brush.hatch="7" '
				else
					temp+=' brush.hatch="6" '
				end if
				temp+=' )'
				dw_1.modify(temp)
				st_object.text=''
				i_cont_objs++
			case 'cuadrado_azul.gif'
				temp='create rectangle(band=detail x="'+string(pointerx()*100/long(em_2.text) +long(Object.DataWindow.HorizontalScrollPosition))+'" y="'+string(pointery()*100/long(em_2.text)+long(Object.DataWindow.VerticalScrollPosition))+'" height="184" width="238"  name='+f_busca_nombre('r_')+' visible="1" brush.color="553648127" pen.width="5" pen.color="'+string(st_linea.backcolor)+'"  background.mode="2" background.color="0" moveable=1 resizeable=1 pointer="HyperLink!" '
				if st_linea.text='T' then
					temp+=' pen.style="5" '
				else
					temp+=' pen.style="0" '
				end if
				if st_fondo.text='T' then
					temp+=' brush.hatch="7" '
				else
					temp+=' brush.hatch="6" '
				end if
				temp+=' )'
				dw_1.modify(temp)
				st_object.text=''
				i_cont_objs++
		end choose
	case 'ellipse','rectangle'
		i_dwo=dwo
		if i_dwo.brush.hatch="7" then
			st_fondo.text='T'
			st_fondo.backcolor=st_fondo_t.backcolor
		else
			st_fondo.text=''
			st_fondo.backcolor=long(dwo.brush.color)
		end if
		if i_dwo.pen.style="5" then
			st_linea.text='T'
			st_linea.backcolor=st_fondo_t.backcolor
		else
			st_linea.text=''
			st_linea.backcolor=long(dwo.pen.color)
		end if
		i_dwo=dwo
		dd_f.enabled=false
		dd_t.enabled=false
		cbx_1.enabled=false
		st_object.text=string(i_dwo.name)
	case 'text'
		i_dwo=dwo
		dd_f.enabled=true
		dd_t.enabled=true
		cbx_1.enabled=true
		if i_dwo.border="2" then
			cbx_1.checked=true
		else
			cbx_1.checked=false
		end if
		dd_f.text=i_dwo.font.face
		dd_t.text=mid(string(i_dwo.font.height),2)
		if i_dwo.background.mode="1" then
			st_fondo.text='T'
			st_fondo.backcolor=st_fondo_t.backcolor
		else
			st_fondo.text=''
			st_fondo.backcolor=long(i_dwo.background.color)
		end if
		st_linea.backcolor=long(i_dwo.color)
		st_object.text=string(i_dwo.name)
end choose
p_muestra.picturename='flecha_azul.gif'
end event

event doubleclicked;if dwo.type='text' then
	openwithparm(w_texto,mid(string(dwo.text),2,len(string(dwo.text))-2))
	if message.stringparm<>'' then
		dwo.text=f_remplaza(message.stringparm,'"','')
	end if
end if
end event

type pb_4 from picturebutton within w_muestra_imag
integer x = 457
integer y = 16
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cuadrado_azul.gif"
alignment htextalign = left!
string powertiptext = "Insertar Cuadrado"
end type

event clicked;p_muestra.picturename=picturename
setnull(i_dwo)
dd_f.enabled=false
dd_t.enabled=false
cbx_1.enabled=false
end event

type pb_3 from picturebutton within w_muestra_imag
integer x = 306
integer y = 16
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "circulo_azul.gif"
alignment htextalign = left!
string powertiptext = "Insertar Circulo"
end type

event clicked;p_muestra.picturename=picturename
setnull(i_dwo)
dd_f.enabled=false
dd_t.enabled=false
cbx_1.enabled=false
end event

type pb_1 from picturebutton within w_muestra_imag
integer x = 151
integer y = 16
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "texto_azul.gif"
alignment htextalign = left!
string powertiptext = "Insertar Texto"
end type

event clicked;p_muestra.picturename=picturename
dd_f.enabled=true
dd_t.enabled=true
cbx_1.enabled=true
setnull(i_dwo)
end event

type st_zoom from statictext within w_muestra_imag
integer x = 649
integer y = 96
integer width = 215
integer height = 48
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "Zoom"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_muestra_imag
integer x = 1070
integer y = 16
integer width = 288
integer height = 48
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "Línea   Fondo"
alignment alignment = center!
boolean focusrectangle = false
end type

