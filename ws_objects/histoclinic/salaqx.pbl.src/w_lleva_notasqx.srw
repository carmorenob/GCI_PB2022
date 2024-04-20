$PBExportHeader$w_lleva_notasqx.srw
forward
global type w_lleva_notasqx from w_center
end type
type dw_lleva from datawindow within w_lleva_notasqx
end type
type pb_1 from picturebutton within w_lleva_notasqx
end type
type rte_ane from richtextedit within w_lleva_notasqx
end type
type rte_not from richtextedit within w_lleva_notasqx
end type
type st_1 from statictext within w_lleva_notasqx
end type
type st_2 from statictext within w_lleva_notasqx
end type
end forward

global type w_lleva_notasqx from w_center
integer width = 3346
integer height = 1264
string title = "Notas Quirúrgicas sin registrar"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "rip_r.ico"
boolean clientedge = true
dw_lleva dw_lleva
pb_1 pb_1
rte_ane rte_ane
rte_not rte_not
st_1 st_1
st_2 st_2
end type
global w_lleva_notasqx w_lleva_notasqx

type variables
boolean i_cambiar_rte=false
end variables

on w_lleva_notasqx.create
int iCurrent
call super::create
this.dw_lleva=create dw_lleva
this.pb_1=create pb_1
this.rte_ane=create rte_ane
this.rte_not=create rte_not
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_lleva
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.rte_ane
this.Control[iCurrent+4]=this.rte_not
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
end on

on w_lleva_notasqx.destroy
call super::destroy
destroy(this.dw_lleva)
destroy(this.pb_1)
destroy(this.rte_ane)
destroy(this.rte_not)
destroy(this.st_1)
destroy(this.st_2)
end on

type pb_grabar from w_center`pb_grabar within w_lleva_notasqx
integer x = 133
integer y = 1008
boolean default = true
end type

event pb_grabar::clicked;call super::clicked;dw_lleva.accepttext()
long j,cuantos=0,ning
string llevar='',clug,temp
blob texto
sqlca.autocommit=true
for j=1 to dw_lleva.rowcount()
	if dw_lleva.getitemstring(j,"llevar")='1' then
		//if cuantos=0 then f_pega_a_rtf(w_evolucion.tab_1.tabp_2.rte_2,'~nDe los procedimientos Quirúrgicos realizados, se tienen las siguientes notas:~r~n',2)
		cuantos++
		ning=dw_lleva.getitemnumber(j,'numero_ingre')
		clug=dw_lleva.getitemstring(j,'clugar')
		selectblob notas_ane into :texto from qxcabacto 
		where numero_ingre=:ning and clugar=:clug;
		//if not isnull(texto) then f_pega_a_rtf(w_evolucion.tab_1.tabp_2.rte_2,string(texto),2)
		selectblob notasqx into :texto from qxcabacto 
		where numero_ingre=:ning and clugar=:clug;
		if not isnull(texto) then 
			//f_pega_a_rtf(w_evolucion.tab_1.tabp_2.rte_2,'~n-Anestesiológicas:~r~n',2)
			//f_pega_a_rtf(w_evolucion.tab_1.tabp_2.rte_2,string(texto),2)
		end if
		dw_lleva.setitem(j,"en_evol",'1')
	end if
next
sqlca.autocommit=false
if cuantos>0 then
	//w_evolucion.tab_1.tabp_2.cb_10.triggerevent(clicked!)
//	if f_sel_rtf(w_evolucion.tab_1.tabp_2.rte_2)<=0 then
//		if dw_lleva.update()=-1 then
//			rollback;
//		else
//			commit;
//			close(parent)
//		end if
//	end if
end if
end event

type dw_lleva from datawindow within w_lleva_notasqx
integer x = 18
integer y = 12
integer width = 549
integer height = 976
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lleva_notasqx"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
//retrieve(w_evolucion.i_stde.nh,w_evolucion.i_stde.clug_hadm)
end event

event rowfocuschanged;long ning,fila
string clug
blob texto
fila=getrow()
if fila<1 then return
ning=getitemnumber(fila,'numero_ingre')
clug=getitemstring(fila,'clugar')
sqlca.autocommit=true
selectblob notas_ane into :texto from qxcabacto 
where numero_ingre=:ning and clugar=:clug;
if not isnull(texto) then
	i_cambiar_rte=true
	f_pega_a_rtf(rte_ane,string(texto),3)
end if
selectblob notasqx into :texto from qxcabacto 
where numero_ingre=:ning and clugar=:clug;
if not isnull(texto) then
	i_cambiar_rte=true
	f_pega_a_rtf(rte_not,string(texto),3)
end if
sqlca.autocommit=false
end event

type pb_1 from picturebutton within w_lleva_notasqx
event mousemove pbm_mousemove
integer x = 302
integer y = 1008
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event pb_1::clicked;call super::clicked;close(parent)
end event

type rte_ane from richtextedit within w_lleva_notasqx
event p_undo ( boolean p_cambiar )
integer x = 594
integer y = 52
integer width = 2693
integer height = 512
integer taborder = 30
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 67108864
boolean init_wordwrap = true
boolean init_tabbar = true
borderstyle borderstyle = stylelowered!
end type

event p_undo(boolean p_cambiar);if not p_cambiar then
	this.undo()
end if
this.modified=false
i_cambiar_rte=false
end event

event modified;post event p_undo(i_cambiar_rte)
end event

event key;f_rte_key(this,keyflags,key)
end event

type rte_not from richtextedit within w_lleva_notasqx
event p_undo ( boolean p_cambiar )
integer x = 594
integer y = 628
integer width = 2693
integer height = 512
integer taborder = 40
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 67108864
boolean init_wordwrap = true
boolean init_tabbar = true
borderstyle borderstyle = stylelowered!
end type

event p_undo(boolean p_cambiar);if not p_cambiar then
	this.undo()
end if
this.modified=false
i_cambiar_rte=false
end event

event key;f_rte_key(this,keyflags,key)
end event

event modified;post event p_undo(i_cambiar_rte)
end event

type st_1 from statictext within w_lleva_notasqx
integer x = 594
integer width = 581
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notas Anestesilológicas"
boolean focusrectangle = false
end type

type st_2 from statictext within w_lleva_notasqx
integer x = 599
integer y = 576
integer width = 393
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notas Quirúrgicas"
boolean focusrectangle = false
end type

