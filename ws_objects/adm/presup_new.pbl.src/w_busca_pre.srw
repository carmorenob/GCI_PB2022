$PBExportHeader$w_busca_pre.srw
forward
global type w_busca_pre from window
end type
type pb_ok from picturebutton within w_busca_pre
end type
type rb_2 from radiobutton within w_busca_pre
end type
type rb_1 from radiobutton within w_busca_pre
end type
type pb_1 from picturebutton within w_busca_pre
end type
type st_1 from statictext within w_busca_pre
end type
type pb_busca from picturebutton within w_busca_pre
end type
type dw_res from datawindow within w_busca_pre
end type
type gb_1 from groupbox within w_busca_pre
end type
type dw_cond from datawindow within w_busca_pre
end type
type dw_terce from datawindow within w_busca_pre
end type
end forward

global type w_busca_pre from window
integer width = 4256
integer height = 1176
boolean titlebar = true
string title = "Búsqueda de Documentos de Presupuesto"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_ok pb_ok
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
st_1 st_1
pb_busca pb_busca
dw_res dw_res
gb_1 gb_1
dw_cond dw_cond
dw_terce dw_terce
end type
global w_busca_pre w_busca_pre

type variables
st_xa_buscar_pre i_st
end variables

on w_busca_pre.create
this.pb_ok=create pb_ok
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_1=create pb_1
this.st_1=create st_1
this.pb_busca=create pb_busca
this.dw_res=create dw_res
this.gb_1=create gb_1
this.dw_cond=create dw_cond
this.dw_terce=create dw_terce
this.Control[]={this.pb_ok,&
this.rb_2,&
this.rb_1,&
this.pb_1,&
this.st_1,&
this.pb_busca,&
this.dw_res,&
this.gb_1,&
this.dw_cond,&
this.dw_terce}
end on

on w_busca_pre.destroy
destroy(this.pb_ok)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.pb_busca)
destroy(this.dw_res)
destroy(this.gb_1)
destroy(this.dw_cond)
destroy(this.dw_terce)
end on

event open;i_st = message.powerobjectparm
dw_cond.setitem(1,1,i_st.cdoc)
dw_res.retrieve(i_st.cdoc,i_st.dw_vig.getitemnumber(1,'cod_vigencia'))
end event

type pb_ok from picturebutton within w_busca_pre
integer x = 1883
integer y = 932
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &a"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_res.triggerevent(doubleclicked!)
end event

type rb_2 from radiobutton within w_busca_pre
integer x = 553
integer y = 64
integer width = 279
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tercero"
end type

event clicked;dw_cond.visible=false
dw_terce.visible=true
end event

type rb_1 from radiobutton within w_busca_pre
integer x = 55
integer y = 64
integer width = 421
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nro documento."
boolean checked = true
end type

event clicked;dw_cond.visible=true
dw_terce.visible=false
end event

type pb_1 from picturebutton within w_busca_pre
event mousemove pbm_mousemove
integer x = 2034
integer y = 932
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type st_1 from statictext within w_busca_pre
integer x = 3566
integer y = 928
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

type pb_busca from picturebutton within w_busca_pre
event mousemove pbm_mousemove
integer x = 4032
integer y = 28
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

event clicked;dw_cond.accepttext()
dw_terce.accepttext()
string sql
If dw_terce.visible then
	if isnull(dw_terce.getitemstring(1,'documento')) then return
	sql="  SELECT pre_docu_cb.coddoc, pre_docu_cb.clugar,   pre_docu_cb.numdoc,  pre_docu_cb.fecha,    pre_docu_cb.cod_vigencia,    pre_docu_cb.periodo,    pre_docu_cb.estado,    pre_docu_cb.consecutivo,    pre_docu_cb.fecha_consecu,    pre_docu_cb.solicita, pre_docu_cb.año   FROM pre_docu_cb,    pre_dispo_ter   WHERE  pre_docu_cb.clugar = pre_dispo_ter.clugar  and    pre_docu_cb.coddoc = pre_dispo_ter.coddocu  and    pre_docu_cb.numdoc = pre_dispo_ter.numdoc  and   pre_dispo_ter.tipodoc ='"+dw_terce.getitemstring(1,'tipodoc')+"'   AND    pre_dispo_ter.documento =  '"+dw_terce.getitemstring(1,'documento')+"'" 
else
	if isnull(dw_cond.getitemnumber(1,'numdoc')) then return

	sql=" SELECT pre_docu_cb.coddoc,  pre_docu_cb.clugar,  pre_docu_cb.numdoc, pre_docu_cb.fecha,  pre_docu_cb.cod_vigencia, pre_docu_cb.periodo, pre_docu_cb.estado,  pre_docu_cb.consecutivo,  pre_docu_cb.fecha_consecu, pre_docu_cb.solicita, pre_docu_cb.año   FROM pre_docu_cb  "
	sql+=" where pre_docu_cb.clugar='"+clugar+"' and pre_docu_cb.coddoc='"+i_st.cdoc+"' and pre_docu_cb.cod_vigencia="+string(i_st.dw_vig.getitemnumber(1,'cod_vigencia'))+ ' and pre_docu_cb.'+dw_cond.getitemstring(1,'campo')+'='+string(dw_cond.getitemnumber(1,'numdoc'))
end if
dw_res.setsqlselect(sql)
if dw_res.retrieve()=0 then messagebox('Atención','No se encontraror Registros')
end event

type dw_res from datawindow within w_busca_pre
integer x = 14
integer y = 240
integer width = 4151
integer height = 676
integer taborder = 10
string title = "none"
string dataobject = "dw_busqueda_orig"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;st_1.Text = 'Registro ' + string(GetRow()) + ' de ' +string(RowCount())

end event

event doubleclicked;if getrow()<1 then return
if isnull(i_st.dw_vig.getitemnumber(1,'periodo')) or i_st.dw_vig.getitemnumber(1,'periodo')<>getitemnumber(getrow(),'periodo') then
	i_st.dw_vig.setcolumn('periodo')
	i_st.dw_vig.settext(string(getitemnumber(getrow(),'periodo')))
	if i_st.dw_vig.event itemchanged(1,i_st.dw_vig.object.periodo,string(getitemnumber(getrow(),'periodo')))=1 then return
	i_st.dw_vig.setitem(1,'ano',getitemnumber(getrow(),'año'))
	i_st.dw_vig.setitem(1,'periodo',getitemnumber(getrow(),'periodo'))
end if
long donde
donde=i_st.dw_histo.find('año='+string(getitemnumber(getrow(),'año'))+' and numdoc='+string(getitemnumber(getrow(),'numdoc')),1,i_st.dw_histo.rowcount())
if donde>0 then
	if i_st.dw_histo.event rowfocuschanging(i_st.dw_histo.getrow(),donde)=1 then return
	i_st.dw_histo.scrolltorow(donde)
end if
close(parent)
end event

type gb_1 from groupbox within w_busca_pre
integer x = 14
integer y = 8
integer width = 832
integer height = 140
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por:"
end type

type dw_cond from datawindow within w_busca_pre
integer x = 887
integer y = 24
integer width = 3131
integer height = 152
integer taborder = 10
string title = "none"
string dataobject = "dw_ext_busqueda"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
InsertRow(1)
SetItem(1,'clugar',clugar)
end event

type dw_terce from datawindow within w_busca_pre
boolean visible = false
integer x = 882
integer y = 24
integer width = 3159
integer height = 144
integer taborder = 20
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
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

event doubleclicked;if dwo.name='documento' then
	g_tercerodesde=1
	openwithparm(w_buscater,this)
	setcolumn('documento')
	event itemchanged(1,object.documento,getitemstring(1,'documento'))
end if
end event

