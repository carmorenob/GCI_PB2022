$PBExportHeader$w_copiar_urg.srw
forward
global type w_copiar_urg from window
end type
type i_rte from richtextedit within w_copiar_urg
end type
type dw_temp from datawindow within w_copiar_urg
end type
type st_dest from statictext within w_copiar_urg
end type
type st_3 from statictext within w_copiar_urg
end type
type pb_cancel from picturebutton within w_copiar_urg
end type
type pb_ok from picturebutton within w_copiar_urg
end type
type st_2 from statictext within w_copiar_urg
end type
type dw_hist from datawindow within w_copiar_urg
end type
type dw_campos from datawindow within w_copiar_urg
end type
end forward

global type w_copiar_urg from window
integer width = 2290
integer height = 984
boolean titlebar = true
string title = "Copiar Datos de Urgencias Anteriores"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
i_rte i_rte
dw_temp dw_temp
st_dest st_dest
st_3 st_3
pb_cancel pb_cancel
pb_ok pb_ok
st_2 st_2
dw_hist dw_hist
dw_campos dw_campos
end type
global w_copiar_urg w_copiar_urg

type variables
st_copiar_urg i_st

end variables

on w_copiar_urg.create
this.i_rte=create i_rte
this.dw_temp=create dw_temp
this.st_dest=create st_dest
this.st_3=create st_3
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_2=create st_2
this.dw_hist=create dw_hist
this.dw_campos=create dw_campos
this.Control[]={this.i_rte,&
this.dw_temp,&
this.st_dest,&
this.st_3,&
this.pb_cancel,&
this.pb_ok,&
this.st_2,&
this.dw_hist,&
this.dw_campos}
end on

on w_copiar_urg.destroy
destroy(this.i_rte)
destroy(this.dw_temp)
destroy(this.st_dest)
destroy(this.st_3)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.dw_hist)
destroy(this.dw_campos)
end on

event open;i_st=message.powerobjectparm
dw_hist.retrieve(tipdoc,docu,'2')
select desplantilla into :st_dest.text from hclin_plant where codplantilla=:i_st.cplant;
dw_campos.retrieve(i_st.cplant)
end event

type i_rte from richtextedit within w_copiar_urg
boolean visible = false
integer x = 2071
integer y = 424
integer width = 128
integer height = 68
integer taborder = 40
boolean init_wordwrap = true
borderstyle borderstyle = stylelowered!
end type

type dw_temp from datawindow within w_copiar_urg
boolean visible = false
integer x = 2080
integer y = 512
integer width = 133
integer height = 76
integer taborder = 40
string title = "none"
string dataobject = "dw_copiar_hc"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_dest from statictext within w_copiar_urg
integer x = 544
integer width = 1687
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_copiar_urg
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plantilla Destino (Actual)"
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_copiar_urg
integer x = 2066
integer y = 280
integer width = 146
integer height = 128
integer taborder = 30
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

type pb_ok from picturebutton within w_copiar_urg
integer x = 2066
integer y = 144
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_hist.rowcount()=0 or dw_campos.rowcount()=0 then return
long J,donde,donde2,cual,contador,nreg,item, ncampo
string cplant,clug
blob texto
contador = dw_hist.getitemnumber(dw_hist.getrow(),'contador')
clug = dw_hist.getitemstring(dw_hist.getrow(),'clugar')
i_st.dw_datos.setfilter('')
i_st.dw_datos.filter()
FOR J=1 TO dw_campos.rowcount()
	if cplant <> dw_campos.getitemstring(j,'cplant_urg') then
		cplant = dw_campos.getitemstring(j,'cplant_urg')
		dw_temp.retrieve(contador,clug,cplant)
	end if
	donde = dw_temp.find('item='+string(dw_campos.getitemnumber(j,'ncampo_urg')),1,dw_temp.rowcount())
	if donde=0 then continue
	nreg = dw_temp.getitemnumber(donde,'nregistro')
	item = dw_temp.getitemnumber(donde,'item')
//	if isValid (i_st.dw_memos) then
		donde2 = i_st.dw_datos.find('numcampo='+string(dw_campos.getitemnumber(j,'numcampo')),1,i_st.dw_datos.rowcount())
		choose case dw_campos.getitemstring(j,'tipo')
			case 'M'//emo
				cual=i_st.dw_memos.find('numcampo='+string(dw_campos.getitemnumber(j,'numcampo')),1,i_st.dw_memos.rowcount())
				sqlca.autocommit=true
				selectblob long_texto into :texto from hclin_reg_valor where contador =:contador and clugar=:clug and nregistro =:nreg and item =:item;
				sqlca.autocommit=false
				i_st.dw_memos.setitem(cual,'texto',string(texto))
			case 'S','L','T'//:seleccion  //:lista //:texto  
				i_st.dw_datos.setitem(donde2,'texto',dw_temp.getitemstring(donde,'texto'))
			case 'N'//:si/no  
				i_st.dw_datos.setitem(donde2,'sino',dw_temp.getitemstring(donde,'sino'))
			case 'R'//:Numerico 
				i_st.dw_datos.setitem(donde2,'numero',dw_temp.getitemnumber(donde,'numero'))
			case 'F'//:fecha
				i_st.dw_datos.setitem(donde2,'fecha',dw_temp.getitemdatetime(donde,'fecha'))
		end choose
//	else // Formulario
		ncampo = dw_campos.getitemnumber(j,'numcampo')
		choose case dw_campos.getitemstring(j,'tipo')
			case 'M' //memo
				sqlca.autocommit=true
				selectblob long_texto into :texto from hclin_reg_valor where contador =:contador and clugar=:clug and nregistro =:nreg and item =:item;
				sqlca.autocommit=false
				f_pega_a_rtf(i_rte,string(texto),3)
				i_st.dw_frm.SetColumn('memo_'+string(ncampo))
				i_rte.SelectTextAll()
				i_rte.Copy()
				i_st.dw_frm.Paste()
			case 'S' //:seleccion
				i_st.dw_frm.setitem(1,'seleccion_'+string(ncampo),dw_temp.getitemstring(donde,'texto'))
			case 'L' //:lista
				i_st.dw_frm.setitem(1,'lista_'+string(ncampo),dw_temp.getitemstring(donde,'texto'))
			case 'T' //:texto  
				i_st.dw_frm.setitem(1,'texto_'+string(ncampo),dw_temp.getitemstring(donde,'texto'))
			case 'N' //:si/no  
				i_st.dw_frm.setitem(1,'sino_'+string(ncampo),dw_temp.getitemstring(donde,'sino'))
			case 'R' //:Numerico 
				i_st.dw_frm.setitem(1,'numero_'+string(ncampo),dw_temp.getitemnumber(donde,'numero'))
			case 'F' //:fecha
				i_st.dw_frm.setitem(1,'fecha_'+string(ncampo),dw_temp.getitemdatetime(donde,'fecha'))
		end choose		
//	end if
next
closewithreturn(parent,'ok')

end event

type st_2 from statictext within w_copiar_urg
integer x = 9
integer y = 88
integer width = 759
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresos de Urgencias Anteriores:"
boolean focusrectangle = false
end type

type dw_hist from datawindow within w_copiar_urg
integer y = 148
integer width = 2043
integer height = 712
integer taborder = 10
string title = "none"
string dataobject = "dw_historial_tipo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_campos from datawindow within w_copiar_urg
event keypres pbm_dwnkey
boolean visible = false
integer x = 2085
integer y = 604
integer width = 119
integer height = 76
integer taborder = 10
string title = "none"
string dataobject = "dw_copiar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event keypres;if key=keydelete! and getcolumnname()='nuevo' then
	string nulo
	setnull(nulo)
	setitem(getrow(),'nuevo',nulo)
end if
end event

event constructor;settransobject(sqlca)

end event

