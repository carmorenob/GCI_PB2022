$PBExportHeader$uo_imag_diag.sru
forward
global type uo_imag_diag from userobject
end type
type st_zoom from statictext within uo_imag_diag
end type
type p_1 from picture within uo_imag_diag
end type
type dw_1 from datawindow within uo_imag_diag
end type
type hsb_1 from hscrollbar within uo_imag_diag
end type
end forward

global type uo_imag_diag from userobject
integer width = 1573
integer height = 1360
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_zoom st_zoom
p_1 p_1
dw_1 dw_1
hsb_1 hsb_1
end type
global uo_imag_diag uo_imag_diag

forward prototypes
public function integer mostrar_foto (string p_cdoc, string p_clug, long p_nrep, long p_item, long p_imag)
public function integer tamanyo (long p_ancho, long p_alto)
end prototypes

public function integer mostrar_foto (string p_cdoc, string p_clug, long p_nrep, long p_item, long p_imag);blob imag,objs
long nobjs
selectblob imagen into :imag from resultadosimag 
where coddoc=:p_cdoc and clugar=:p_clug and nrepor=:p_nrep and item=:p_item and nro_imag=:p_imag;

select nro_notas into :nobjs from resultadosimag 
where coddoc=:p_cdoc and clugar=:p_clug and nrepor=:p_nrep and item=:p_item and nro_imag=:p_imag;

selectblob objetos into :objs from resultadosimag 
where coddoc=:p_cdoc and clugar=:p_clug and nrepor=:p_nrep and item=:p_item and nro_imag=:p_imag;

String ls_keyword,is_values[],archivo
Integer li_count, li_return,numarc

ContextKeyword lcx_key
li_return = GetContextService ("Keyword", lcx_key)
ls_keyword = 'temp'
lcx_key.GetContextKeywords(ls_keyword, is_values)
archivo =is_values[1]+'\temp00001.jpg'
numarc = fileopen(archivo,StreamMode!,write!,shared!,Replace!)
filewriteex(numarc,imag)
fileclose(numarc)
if nobjs>0 then
	if dw_1.create(string(objs))=-1 then
		dw_1.dataobject='dw_ver_imag'
	end if
else
	dw_1.dataobject='dw_ver_imag'
end if
hsb_1.position=100
st_zoom.text='Zoom: 100%'
dw_1.reset()
dw_1.insertrow(1)
p_1.picturename=archivo
dw_1.object.datawindow.detail.height=p_1.height +100
dw_1.object.p_1.width=p_1.width
dw_1.object.p_1.height=p_1.height
dw_1.modify("p_1.filename='"+f_remplaza(archivo,char(126),char(126)+char(126))+"'")
//eso porque si devuelve un ~ saca error , deben ir dos pegados (~~)
return 1
end function

public function integer tamanyo (long p_ancho, long p_alto);width=p_ancho
height=p_alto
dw_1.resize(p_ancho,p_alto -100)
return 1
end function

on uo_imag_diag.create
this.st_zoom=create st_zoom
this.p_1=create p_1
this.dw_1=create dw_1
this.hsb_1=create hsb_1
this.Control[]={this.st_zoom,&
this.p_1,&
this.dw_1,&
this.hsb_1}
end on

on uo_imag_diag.destroy
destroy(this.st_zoom)
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.hsb_1)
end on

type st_zoom from statictext within uo_imag_diag
integer x = 18
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
string text = "Zoom: 100%"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within uo_imag_diag
boolean visible = false
integer x = 1554
integer y = 56
integer width = 165
integer height = 144
boolean enabled = false
boolean originalsize = true
boolean focusrectangle = false
end type

type dw_1 from datawindow within uo_imag_diag
integer y = 96
integer width = 1518
integer height = 1152
integer taborder = 10
string title = "none"
string dataobject = "dw_ver_imag"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type hsb_1 from hscrollbar within uo_imag_diag
integer y = 40
integer width = 338
integer height = 52
boolean bringtotop = true
boolean stdheight = false
integer minposition = 30
integer maxposition = 700
integer position = 100
end type

event lineleft;if position=30 then return
IF Position < MinPosition + 10 THEN
   Position = MinPosition
ELSE
   Position = Position - 10
END IF
dw_1.object.datawindow.zoom=position
st_zoom.text='Zoom: '+string(position)+' %'
end event

event lineright;if position=maxposition then return
IF Position > MaxPosition - 10 THEN
   Position = MaxPosition
ELSE
   Position = Position + 10
END IF
dw_1.object.datawindow.zoom=position
st_zoom.text='Zoom: '+string(position)+' %'

end event

event moved;dw_1.object.datawindow.zoom=scrollpos
st_zoom.text='Zoom: '+string(scrollpos)+' %'
end event

event pageleft;IF Position < MinPosition + 30 THEN
   Position = MinPosition
ELSE
   Position = Position - 30
END IF
dw_1.object.datawindow.zoom=position
st_zoom.text='Zoom: '+string(position)+' %'
end event

event pageright;IF Position > MaxPosition - 30 THEN
   Position = MaxPosition
ELSE
   Position = Position + 30
END IF
dw_1.object.datawindow.zoom=position
st_zoom.text='Zoom: '+string(position)+' %'
end event

