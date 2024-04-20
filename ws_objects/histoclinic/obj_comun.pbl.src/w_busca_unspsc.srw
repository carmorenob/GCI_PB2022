$PBExportHeader$w_busca_unspsc.srw
forward
global type w_busca_unspsc from window
end type
type pb_1 from picturebutton within w_busca_unspsc
end type
type dw_2 from datawindow within w_busca_unspsc
end type
type dw_1 from datawindow within w_busca_unspsc
end type
type dw_opc from datawindow within w_busca_unspsc
end type
end forward

global type w_busca_unspsc from window
integer width = 2331
integer height = 828
boolean titlebar = true
string title = "Busca Códigos UNSPSC"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "buscar.ico"
pb_1 pb_1
dw_2 dw_2
dw_1 dw_1
dw_opc dw_opc
end type
global w_busca_unspsc w_busca_unspsc

type variables
st_xa_buscarcta i_st
boolean i_semovio
end variables

on w_busca_unspsc.create
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.dw_opc=create dw_opc
this.Control[]={this.pb_1,&
this.dw_2,&
this.dw_1,&
this.dw_opc}
end on

on w_busca_unspsc.destroy
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.dw_opc)
end on

event open;i_st=message.powerobjectparm
select cod_ver into :i_st.codemp from pm_ver_unspsc where val_hasta>=getdate();
if isnull(i_st.codemp) then 
	messagebox("Atención","No existe una versión UNSPSC Activa")
	return
end if
dw_1.retrieve(i_st.codemp)
end event

event resize;long anch,alt,restar=0
if dw_opc.visible then restar=160
if newwidth>3300 or newheight>800 then 
	anch=newwidth
	alt=newheight
	if alt>800 then alt=800
	if anch>3300 then anch=3300
	resize(anch,alt -restar)
	dw_1.resize(anch - 40, alt -100 -restar)
else
	dw_1.resize(newwidth -5 , newheight -5 -restar)
end if


end event

type pb_1 from picturebutton within w_busca_unspsc
integer x = 443
integer y = 12
integer width = 101
integer height = 68
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = ">>"
boolean originalsize = true
vtextalign vtextalign = vcenter!
string powertiptext = "Más Opciones"
end type

event clicked;parent.setredraw(false)
if text='>>' then
	dw_opc.visible=true
	text='<<'
	powertiptext='Ocultar Otras Opciones'
	y=168
	dw_1.y=156
	dw_2.y=164
	dw_1.height -= 160
else
	dw_opc.visible=false
	text='>>'
	powertiptext='Más Opciones'
	y=12
	dw_1.y=0
	dw_2.y=8
	dw_1.height += 160
end if
parent.setredraw(true)
end event

type dw_2 from datawindow within w_busca_unspsc
event keyup pbm_dwnkey
integer y = 8
integer width = 443
integer height = 64
integer taborder = 20
string title = "none"
string dataobject = "dw_paraediciones_2"
boolean border = false
boolean livescroll = true
end type

event keyup;string este="!"
choose case key
	case KeyNumpad0!,key0!
		este='0'
	case KeyNumpad1!,key1!
		este='1'
	case KeyNumpad2!,key2!
		este='2'
	case KeyNumpad3!,key3!
		este='3'
	case KeyNumpad4!,key4!
		este='4'
	case KeyNumpad5!,key5!
		este='5'
	case KeyNumpad6!,key6!
		este='6'
	case KeyNumpad7!,key7!
		este='7'
	case KeyNumpad8!,key8!
		este='8'
	case KeyNumpad9!,key9!
		este='9'
	case KeyNumpad0!,key0!
		este='0'
	case keyback!
		este=gettext()
		este=left(este, len(este) -1)
		if trim(lower(este))="" or isnull(este) then
			dw_opc.event pitemchanged('')
		else
			dw_opc.event pitemchanged(lower(trim(este)))
		end if
		return
	case keya!
		este='a'
	case keyb!
		este='b'
	case keyc!
		este='c'
	case keyd!
		este='d'
	case keye!
		este='e'
	case keyf!
		este='f'
	case keyg!
		este='g'
	case keyh!
		este='h'
	case keyi!
		este='i'
	case keyj!
		este='j'
	case keyk!
		este='k'
	case keyl!
		este='l'
	case keym!
		este='m'
	case keyn!
		este='n'
//	case keyñ!
//		este='ñ'
	case keyo!
		este='o'
	case keyp!
		este='p'
	case keyq!
		este='q'
	case keyr!
		este='r'
	case keys!
		este='s'
	case keyt!
		este='t'
	case keyu!
		este='u'
	case keyv!
		este='v'
	case keyw!
		este='w'
	case keyx!
		este='x'
	case keyy!
		este='y'
	case keyz!
		este='z'
end choose
if este<>"!" /*and isnumber(este)*/ then 
	if not isnull(gettext()) then este=gettext()+este
	if trim(lower(este))="" or isnull(este) then
		dw_opc.event pitemchanged('')
	else
		dw_opc.event pitemchanged(lower(trim(este)))
	end if
end if

end event

event constructor;insertrow(1)
end event

type dw_1 from datawindow within w_busca_unspsc
integer width = 2267
integer height = 672
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_unspsc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if getrow() < 1 then return
if isnull(getitemstring(getrow(),"producto")) then return
if isvalid(i_st.dw) and not i_semovio then
	//i_st.dw.settext(getitemstring(getrow(),1))
	i_st.dw.setitem(i_st.dw.getrow(),i_st.dw.getcolumnname(),getitemstring(getrow(),1))
	i_st.dw.setitem(i_st.dw.getrow(),'unspsc',getitemstring(getrow(),3))
	i_st.dw.setitemstatus(i_st.dw.getrow(),i_st.dw.getcolumnname(),primary!,notmodified!)
	i_st.dw.setfocus()
	i_st.dw.event post itemchanged(i_st.dw.getrow(),dwo,getitemstring(getrow(),1))
end if
end event

event constructor;settransobject(SQLCA)
end event

type dw_opc from datawindow within w_busca_unspsc
event pitemchanged ( string p_escrito )
boolean visible = false
integer width = 2290
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_opc_busca_cta"
boolean border = false
boolean livescroll = true
end type

event pitemchanged(string p_escrito);accepttext()
string filtro=''
if getitemstring(1,'movim')='1' then filtro="movimiento='1' "
choose case getitemstring(1,'mostrar')
	case '0'
	case '1'
		if filtro<>'' then filtro+='and '
		filtro+="tercero='1' "
	case '2'
		if filtro<>'' then filtro+='and '
		filtro+="ccosto='1' "
	case '3'
		if filtro<>'' then filtro+='and '
		filtro+="rfuente='1' "
	case '4'
		if filtro<>'' then filtro+='and '
		filtro+="inven='1' "
	case '5'
		if filtro<>'' then filtro+='and '
		filtro+="afijo='1' "
	case '6'
		if filtro<>'' then filtro+='and '
		filtro+="deprecia='1' "
	case '7'
		if filtro<>'' then filtro+='and '
		filtro+="ajuste='1' "
end choose
dw_2.accepttext()
if dw_2.gettext()<>'' then
	if getitemstring(1,'filtrar')='0' then
		if filtro<>'' then filtro+='and '
		filtro+=" codtotal like '"+p_escrito+"%'"
	else
		if filtro<>'' then filtro+='and '
		filtro+=" lower(descrip) like lower('%"+p_escrito+"%')"
	end if
end if
dw_1.setredraw(false)
dw_1.setfilter(filtro)
dw_1.filter()
dw_1.sort()
dw_1.setredraw(true)
end event

event constructor;insertrow(1)
end event

event itemchanged;if getcolumnname()='filtrar' then dw_2.setitem(1,1,'')
dw_2.accepttext()
post event pitemchanged(dw_2.gettext())
end event

