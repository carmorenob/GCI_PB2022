$PBExportHeader$w_corpograma.srw
forward
global type w_corpograma from window
end type
type p_muestra from picture within w_corpograma
end type
type pb_1 from picturebutton within w_corpograma
end type
type pb_gua from picturebutton within w_corpograma
end type
type pb_3 from picturebutton within w_corpograma
end type
type dw_1 from datawindow within w_corpograma
end type
type pb_cancel from picturebutton within w_corpograma
end type
end forward

global type w_corpograma from window
integer width = 2606
integer height = 2712
boolean titlebar = true
string title = "Corpograma"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_muestra p_muestra
pb_1 pb_1
pb_gua pb_gua
pb_3 pb_3
dw_1 dw_1
pb_cancel pb_cancel
end type
global w_corpograma w_corpograma

type variables
st_xa_procs_hc i_st
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

on w_corpograma.create
this.p_muestra=create p_muestra
this.pb_1=create pb_1
this.pb_gua=create pb_gua
this.pb_3=create pb_3
this.dw_1=create dw_1
this.pb_cancel=create pb_cancel
this.Control[]={this.p_muestra,&
this.pb_1,&
this.pb_gua,&
this.pb_3,&
this.dw_1,&
this.pb_cancel}
end on

on w_corpograma.destroy
destroy(this.p_muestra)
destroy(this.pb_1)
destroy(this.pb_gua)
destroy(this.pb_3)
destroy(this.dw_1)
destroy(this.pb_cancel)
end on

event open;i_st=message.powerobjectparm
blob objs
setnull(objs)

selectblob corpograma into :objs from evolucionhc 
where contador=:i_st.contador and clugar=:i_st.clug;
if not isnull(objs) then
	if dw_1.create(string(objs))=-1 then
		dw_1.dataobject='dw_corpograma'
	end if
	i_cont_objs=1
end if
dw_1.settransobject(sqlca)
dw_1.retrieve(i_st.contador,i_st.clug)
if dw_1.rowcount()=0 then dw_1.insertrow(0)
end event

type p_muestra from picture within w_corpograma
integer x = 1906
integer y = 748
integer width = 78
integer height = 68
boolean bringtotop = true
boolean originalsize = true
string picturename = "flecha.gif"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_corpograma
integer x = 2400
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
string picturename = "texto_azul.gif"
alignment htextalign = left!
string powertiptext = "Insertar Texto"
end type

event clicked;string temp,ret,texto

temp='create text(band=detail alignment="0" border="0" color="255" x="919" y="816" height="76" width="485" html.valueishtml="0"  name='+f_busca_nombre('text_')+' resizeable=1 moveable=1 pointer="HyperLink!" visible="1"  font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" '
open(w_texto)
texto=message.stringparm
if trim(texto)='' then return
temp+='text="'+texto+'")'
ret =dw_1.modify(temp)
i_cont_objs++
end event

type pb_gua from picturebutton within w_corpograma
string tag = "Almacena Antecedente"
integer x = 2400
integer y = 296
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;int cuantos
blob texto
if  i_cont_objs> 0 then 
	texto=blob(dw_1.describe('datawindow.syntax'))
	select count(*) into :cuantos from evolucionhc where contador=:i_st.contador and clugar=:i_st.clug;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo evolucionhc',sqlca.sqlerrtext)
		return -1
	end if
		
	if cuantos=0 then
		insert into evolucionhc (contador,clugar) values(:i_st.contador,:i_st.clug);
		if sqlca.sqlcode=-1 then 
			messagebox('Error insertando en evolucionhc (capograma)',sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	end if
	updateblob evolucionhc set corpograma =:texto where contador=:i_st.contador and clugar=:i_st.clug;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando capograma",sqlca.sqlerrtext)
		rollback ;
		return
	end if
	commit;
end if
end event

type pb_3 from picturebutton within w_corpograma
integer x = 2400
integer y = 152
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
string picturename = "pincel.gif"
alignment htextalign = left!
string powertiptext = "Insertar Circulo"
end type

event clicked;string temp,ret

temp='create ellipse(band=detail x="1138" y="1680" height="80" width="80"  name='+f_busca_nombre('oval_')+' pointer="HyperLink!" visible="1" moveable=1 brush.hatch="6" brush.color="255" pen.style="0" pen.width="5" pen.color="16777215"  background.mode="2" background.color="0" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0")'
ret =dw_1.modify(temp)
i_cont_objs++
end event

type dw_1 from datawindow within w_corpograma
event key pbm_dwnkey
integer x = 27
integer y = 8
integer width = 2327
integer height = 2608
integer taborder = 10
string dataobject = "dw_corpograma"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event key;if isnull(i_dwo) or not isvalid(i_dwo) then return
if key=keydelete! then
	modify('destroy '+string(i_dwo.name))
	setnull(i_dwo)
end if
end event

event doubleclicked;if dwo.type='text' then
	openwithparm(w_texto,mid(string(dwo.text),2,len(string(dwo.text))))
	if message.stringparm<>'' then
		dwo.text=f_remplaza(message.stringparm,'"','')
	end if
end if
end event

event clicked;i_dwo=dwo
end event

type pb_cancel from picturebutton within w_corpograma
integer x = 2400
integer y = 436
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

