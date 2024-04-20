$PBExportHeader$w_embarazo.srw
forward
global type w_embarazo from window
end type
type tab_1 from tab within w_embarazo
end type
type tabpage_emb from userobject within tab_1
end type
type pb_8 from picturebutton within tabpage_emb
end type
type pb_last from picturebutton within tabpage_emb
end type
type pb_next from picturebutton within tabpage_emb
end type
type pb_del from picturebutton within tabpage_emb
end type
type cb_guarda from picturebutton within tabpage_emb
end type
type cb_1 from picturebutton within tabpage_emb
end type
type pb_prior from picturebutton within tabpage_emb
end type
type pb_first from picturebutton within tabpage_emb
end type
type st_diags from statictext within tabpage_emb
end type
type dw_emba from datawindow within tabpage_emb
end type
type tabpage_emb from userobject within tab_1
pb_8 pb_8
pb_last pb_last
pb_next pb_next
pb_del pb_del
cb_guarda cb_guarda
cb_1 cb_1
pb_prior pb_prior
pb_first pb_first
st_diags st_diags
dw_emba dw_emba
end type
type tabpage_cont from userobject within tab_1
end type
type cb_3 from picturebutton within tabpage_cont
end type
type cb_2 from picturebutton within tabpage_cont
end type
type cb_4 from picturebutton within tabpage_cont
end type
type pb_7 from picturebutton within tabpage_cont
end type
type pb_6 from picturebutton within tabpage_cont
end type
type pb_nuevo from picturebutton within tabpage_cont
end type
type pb_5 from picturebutton within tabpage_cont
end type
type pb_4 from picturebutton within tabpage_cont
end type
type pb_3 from picturebutton within tabpage_cont
end type
type pb_2 from picturebutton within tabpage_cont
end type
type pb_1 from picturebutton within tabpage_cont
end type
type dw_exam_control from datawindow within tabpage_cont
end type
type dw_cont_emb from datawindow within tabpage_cont
end type
type tabpage_cont from userobject within tab_1
cb_3 cb_3
cb_2 cb_2
cb_4 cb_4
pb_7 pb_7
pb_6 pb_6
pb_nuevo pb_nuevo
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_exam_control dw_exam_control
dw_cont_emb dw_cont_emb
end type
type tabpage_rn from userobject within tab_1
end type
type pb_last1 from picturebutton within tabpage_rn
end type
type pb_next1 from picturebutton within tabpage_rn
end type
type pb_save from picturebutton within tabpage_rn
end type
type pb_del1 from picturebutton within tabpage_rn
end type
type pb_new from picturebutton within tabpage_rn
end type
type pb_prior1 from picturebutton within tabpage_rn
end type
type pb_first1 from picturebutton within tabpage_rn
end type
type dw_rn from datawindow within tabpage_rn
end type
type tabpage_rn from userobject within tab_1
pb_last1 pb_last1
pb_next1 pb_next1
pb_save pb_save
pb_del1 pb_del1
pb_new pb_new
pb_prior1 pb_prior1
pb_first1 pb_first1
dw_rn dw_rn
end type
type tab_1 from tab within w_embarazo
tabpage_emb tabpage_emb
tabpage_cont tabpage_cont
tabpage_rn tabpage_rn
end type
end forward

global type w_embarazo from window
integer width = 3589
integer height = 1884
boolean titlebar = true
string title = "Embarazos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "emb.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
tab_1 tab_1
end type
global w_embarazo w_embarazo

type variables
long nemba,ncontrol,xant,yant
end variables

on w_embarazo.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_embarazo.destroy
destroy(this.tab_1)
end on

event open;tab_1.tabpage_emb.dw_emba.settransobject(SQLCA)
tab_1.tabpage_cont.dw_cont_emb.settransobject(SQLCA)
tab_1.tabpage_cont.dw_exam_control.settransobject(SQLCA)
tab_1.tabpage_rn.dw_rn.settransobject(sqlca)
tab_1.tabpage_emb.dw_emba.retrieve(histo)




end event

type tab_1 from tab within w_embarazo
integer x = 9
integer width = 3511
integer height = 1772
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_emb tabpage_emb
tabpage_cont tabpage_cont
tabpage_rn tabpage_rn
end type

on tab_1.create
this.tabpage_emb=create tabpage_emb
this.tabpage_cont=create tabpage_cont
this.tabpage_rn=create tabpage_rn
this.Control[]={this.tabpage_emb,&
this.tabpage_cont,&
this.tabpage_rn}
end on

on tab_1.destroy
destroy(this.tabpage_emb)
destroy(this.tabpage_cont)
destroy(this.tabpage_rn)
end on

type tabpage_emb from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3474
integer height = 1644
string dragicon = "none!"
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Embarazo"
long tabtextcolor = 33554432
string picturename = "emb.ico"
long picturemaskcolor = 536870912
pb_8 pb_8
pb_last pb_last
pb_next pb_next
pb_del pb_del
cb_guarda cb_guarda
cb_1 cb_1
pb_prior pb_prior
pb_first pb_first
st_diags st_diags
dw_emba dw_emba
end type

on tabpage_emb.create
this.pb_8=create pb_8
this.pb_last=create pb_last
this.pb_next=create pb_next
this.pb_del=create pb_del
this.cb_guarda=create cb_guarda
this.cb_1=create cb_1
this.pb_prior=create pb_prior
this.pb_first=create pb_first
this.st_diags=create st_diags
this.dw_emba=create dw_emba
this.Control[]={this.pb_8,&
this.pb_last,&
this.pb_next,&
this.pb_del,&
this.cb_guarda,&
this.cb_1,&
this.pb_prior,&
this.pb_first,&
this.st_diags,&
this.dw_emba}
end on

on tabpage_emb.destroy
destroy(this.pb_8)
destroy(this.pb_last)
destroy(this.pb_next)
destroy(this.pb_del)
destroy(this.cb_guarda)
destroy(this.cb_1)
destroy(this.pb_prior)
destroy(this.pb_first)
destroy(this.st_diags)
destroy(this.dw_emba)
end on

type pb_8 from picturebutton within tabpage_emb
event mousemove pbm_mousemove
integer x = 2203
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &y"
boolean originalsize = true
string picturename = "ayuda.gif"
string disabledname = "d_ayuda.gif"
alignment htextalign = left!
string powertiptext = "Ayuda [Alt+Y]"
end type

type pb_last from picturebutton within tabpage_emb
event mousemove pbm_mousemove
integer x = 2043
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &u"
boolean originalsize = true
string picturename = "ultimo.GIF"
string disabledname = "d_ultimo.GIF"
alignment htextalign = left!
string powertiptext = "Ultimo [Alt+U]"
end type

event clicked;dw_emba.scrolltorow(dw_emba.rowcount())
end event

type pb_next from picturebutton within tabpage_emb
event mousemove pbm_mousemove
integer x = 1888
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "              &s"
boolean originalsize = true
string picturename = "adelante_1.GIF"
string disabledname = "d_adelante_1.GIF"
alignment htextalign = left!
string powertiptext = "Siguiente [Alt+S]"
end type

event clicked;dw_emba.scrollnextrow()
end event

type pb_del from picturebutton within tabpage_emb
event mousemove pbm_mousemove
integer x = 1733
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar [Alt+B]"
end type

event clicked;dw_emba.deleterow(0)
end event

type cb_guarda from picturebutton within tabpage_emb
event mousemove pbm_mousemove
integer x = 1577
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &g"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;if tab_1.tabpage_emb.dw_emba.update()=-1 then
	rollback;
else
	commit;
	tab_1.tabpage_cont.enabled=true
	tab_1.tabpage_rn.enabled=true
	tab_1.tabpage_emb.cb_1.enabled=true
end if
end event

type cb_1 from picturebutton within tabpage_emb
event mousemove pbm_mousemove
integer x = 1422
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo [Alt+N]"
end type

event clicked;long fila
fila = tab_1.tabpage_emb.dw_emba.insertrow(0)
tab_1.tabpage_emb.dw_emba.setitem(fila,"fechareg",datetime(today()))
tab_1.tabpage_emb.dw_emba.setitem(fila,"nembarazo",fila)
tab_1.tabpage_emb.dw_emba.setitem(fila,"historia",histo)
tab_1.tabpage_emb.dw_emba.setitem(fila,"contador",w_hist_gral.i_contador)
tab_1.tabpage_emb.dw_emba.setitem(fila,"clugar_his",w_hist_gral.i_clugar_his)
tab_1.tabpage_cont.enabled=false
tab_1.tabpage_rn.enabled=false
this.enabled=false
tab_1.tabpage_emb.dw_emba.scrolltorow(fila)

end event

type pb_prior from picturebutton within tabpage_emb
event mousemove pbm_mousemove
integer x = 1266
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean originalsize = true
string picturename = "atras_1.GIF"
string disabledname = "d_atras_1.gif"
alignment htextalign = left!
string powertiptext = "Anterior [Alt+A]"
end type

event clicked;dw_emba.scrollpriorrow()
end event

type pb_first from picturebutton within tabpage_emb
event mousemove pbm_mousemove
integer x = 1111
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "             &p"
boolean originalsize = true
string picturename = "atras.GIF"
string disabledname = "d_atras.gif"
alignment htextalign = left!
string powertiptext = "Primero [Alt+P]"
end type

event clicked;dw_emba.scrolltorow(1)
end event

type st_diags from statictext within tabpage_emb
integer x = 1349
integer y = 804
integer width = 2094
integer height = 92
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

type dw_emba from datawindow within tabpage_emb
integer width = 3520
integer height = 1284
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_embarazo"
boolean border = false
boolean livescroll = true
end type

event retrieveend;if this.rowcount() < 1 then 
	this.insertrow(1)
	this.setitem(1,"nembarazo",1)
	this.setitem(1,"fechareg",datetime(today()))
	this.setitem(1,"historia",histo)
	this.setitem(1,"contador",w_hist_gral.i_contador)
	tab_1.tabpage_cont.enabled=false
	tab_1.tabpage_rn.enabled=false
	cb_1.enabled=false
end if
this.accepttext()
end event

event rowfocuschanged;long fila
fila=this.getrow()
if this.rowcount()<1 or fila <1 then return
nemba=this.getitemnumber(fila,"nembarazo")
tab_1.tabpage_cont.dw_cont_emb.retrieve(histo,nemba)
tab_1.tabpage_rn.dw_rn.retrieve(histo,nemba)
if not isnull(nemba) then tab_1.tabpage_cont.text="Controles del Embarazo Nro "+string(nemba)

end event

event rowfocuschanging;if currentrow<1 then return
if KeyDown(KeyDownArrow!) OR KeyDown(KeyUpArrow!) or keydown(keytab!) or keydown(keyenter!)then 
	this.scrolltorow(currentrow)
	return 1
end if
end event

event itemfocuschanged;if dwo.name="causacesarea1" or dwo.name="causamuertem1" then
	string uno,dos
	uno = dwo.name
	uno = this.getitemstring(row,  left(uno,len(uno)-1))
	if uno<>"" then 
		select desdiag into :dos from diags where codgeral= :uno;
		st_diags.text=dos
	end if
end if
end event

event itemchanged;if dwo.name="causacesarea1" or dwo.name="causamuertem1" then
	if data="" then 
		st_diags.text=""
		return
	end if
	string uno,este='',nulo
	st_return_diags st
	
	setnull(nulo)
	uno = dwo.name
	st=f_check_diag(data,"F",w_principal.dw_1.getitemnumber(1,"dias"),este,'0')
	if st.descrip_diag="" then 
		setnull(st.descrip_diag)
		st_diags.text=""
		this.setitem(row,uno,st.descrip_diag)
		this.setitem(row,left(uno,len(uno)-1),nulo)
		return 1
	else
		this.setitem(row,left(uno,len(uno)-1),este) 
		st_diags.text=st.descrip_diag
	end if
end if
end event

event doubleclicked;string col,temp
col=dwo.name
if col="causacesarea1" or col="causamuertem1" then
	st_edadsexo st_es
	st_diag st_d
	st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
	st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
	st_es.antece='0'
	openwithparm(w_busca_diag,st_es)
	st_d=message.powerobjectparm
	if not isValid(st_d) then return
	if not isNull(st_d.codrip) then
		setitem(row,left(col,len(col)-1),st_d.codgeral)
		this.setitem(row,col,st_d.codrip)
		AcceptText()
		st_diags.text=st_d.descripcion
	end if
end if
end event

type tabpage_cont from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3474
integer height = 1644
string dragicon = "none!"
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Controles de Embarazo"
long tabtextcolor = 33554432
string picturename = "medico.ico"
long picturemaskcolor = 536870912
cb_3 cb_3
cb_2 cb_2
cb_4 cb_4
pb_7 pb_7
pb_6 pb_6
pb_nuevo pb_nuevo
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_exam_control dw_exam_control
dw_cont_emb dw_cont_emb
end type

on tabpage_cont.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_4=create cb_4
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_nuevo=create pb_nuevo
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_exam_control=create dw_exam_control
this.dw_cont_emb=create dw_cont_emb
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_4,&
this.pb_7,&
this.pb_6,&
this.pb_nuevo,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_exam_control,&
this.dw_cont_emb}
end on

on tabpage_cont.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_nuevo)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_exam_control)
destroy(this.dw_cont_emb)
end on

type cb_3 from picturebutton within tabpage_cont
integer x = 2875
integer y = 380
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &b"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Control [Alt+B]"
end type

event clicked;if dw_cont_emb.rowcount()<1 then return
if dw_cont_emb.getitemstring(dw_cont_emb.getrow(),"clugar")<>clugar then
	messagebox("Atención","Este Control fue realizado en otro lugar")
	return
end if
tab_1.tabpage_cont.dw_cont_emb.deleterow(0)

end event

type cb_2 from picturebutton within tabpage_cont
integer x = 2875
integer y = 256
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Control [Alt+N]"
end type

event clicked;long fila,ncont
fila=tab_1.tabpage_cont.dw_cont_emb.insertrow(0)
tab_1.tabpage_cont.dw_cont_emb.setitem(fila,"historia",histo)
select max(ncontrol) into :ncont from embarazocontrol where historia=:histo and nembarazo=:nemba and clugar=:clugar;
if isnull(ncont) then ncont=0
ncont++
tab_1.tabpage_cont.dw_cont_emb.setitem(fila,"ncontrol",ncont)
tab_1.tabpage_cont.dw_cont_emb.setitem(fila,"clugar",clugar)
tab_1.tabpage_cont.dw_cont_emb.setitem(fila,"nembarazo",nemba)
this.enabled=false


end event

type cb_4 from picturebutton within tabpage_cont
integer x = 2875
integer y = 504
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &g"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Encabezado de Control [Alt+G]"
end type

event clicked;if tab_1.tabpage_cont.dw_cont_emb.update()=1 then
	commit;
	cb_2.enabled=true
end if
end event

type pb_7 from picturebutton within tabpage_cont
event mousemove pbm_mousemove
integer x = 3205
integer y = 1208
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
string powertiptext = "Eliminar Examen"
end type

event clicked;if dw_cont_emb.rowcount()<1 then return
if dw_cont_emb.getitemstring(dw_cont_emb.getrow(),"clugar")<>clugar then
	messagebox("Atención","Este Control fue realizado en otro lugar")
	return
end if
dw_exam_control.deleterow(0)
end event

type pb_6 from picturebutton within tabpage_cont
event mousemove pbm_mousemove
integer x = 3205
integer y = 1340
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;if dw_cont_emb.rowcount()<1 then return
if dw_cont_emb.getitemstring(dw_cont_emb.getrow(),"clugar")<>clugar then
	messagebox("Atención","Este Control fue realizado en otro lugar")
	return
end if
if dw_exam_control.update()=-1 then
	rollback;
	messagebox("Error","Error guardando exámenes")
else
	commit;
end if
end event

type pb_nuevo from picturebutton within tabpage_cont
event mousemove pbm_mousemove
integer x = 3205
integer y = 1076
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
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
string powertiptext = "Nuevo exámen"
end type

event clicked;if dw_cont_emb.rowcount()<1 then return
if dw_cont_emb.getitemstring(dw_cont_emb.getrow(),"clugar")<>clugar then
	messagebox("Atención","Este Control fue realizado en otro lugar")
	return
end if
long j,i
j=dw_exam_control.insertrow(0)
dw_exam_control.scrolltorow(j)
dw_exam_control.setitem(j,"historia",histo)
dw_exam_control.setitem(j,"nembarazo",nemba)
dw_exam_control.setitem(j,"clugar",clugar)
dw_exam_control.setitem(j,"ncontrol",ncontrol)
for i=1 to dw_exam_control.rowcount()
	if dw_exam_control.find("nadx="+string(i),1,dw_exam_control.rowcount())=0 then
		dw_exam_control.setitem(j,"nadx",i)
		exit
	end if
next
dw_exam_control.setfocus()

end event

type pb_5 from picturebutton within tabpage_cont
event mousemove pbm_mousemove
integer x = 3205
integer y = 944
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
string picturename = "buscar2.GIF"
string disabledname = "d_buscar2.GIF"
string powertiptext = "Ordenes Anteriores"
end type

event clicked;if dw_cont_emb.rowcount()<1 then return
if dw_cont_emb.getitemstring(dw_cont_emb.getrow(),"clugar")<>clugar then
	messagebox("Atención","Este Control fue realizado en otro lugar")
	return
end if
open(w_ord_serv_pend)
end event

type pb_4 from picturebutton within tabpage_cont
event mousemove pbm_mousemove
integer x = 3301
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &u"
boolean originalsize = true
string picturename = "ultimo.GIF"
string disabledname = "d_ultimo.GIF"
string powertiptext = "Ultimo [Alt+U]"
end type

event clicked;dw_cont_emb.scrolltorow(dw_cont_emb.rowcount())
end event

type pb_3 from picturebutton within tabpage_cont
event mousemove pbm_mousemove
integer x = 3159
integer y = 32
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &s"
boolean originalsize = true
string picturename = "adelante_1.GIF"
string disabledname = "d_adelante_1.GIF"
string powertiptext = "Siguiente [Alt+S]"
end type

event clicked;dw_cont_emb.scrollnextrow()
end event

type pb_2 from picturebutton within tabpage_cont
event mousemove pbm_mousemove
integer x = 3017
integer y = 32
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean originalsize = true
string picturename = "atras_1.GIF"
string disabledname = "d_atras_1.GIF"
string powertiptext = "Anterior [Alt+A]"
end type

event clicked;dw_cont_emb.scrollpriorrow()
end event

type pb_1 from picturebutton within tabpage_cont
event mousemove pbm_mousemove
integer x = 2875
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &p"
boolean originalsize = true
string picturename = "atras.GIF"
string disabledname = "d_atras.GIF"
string powertiptext = "Primero [Alt+P]"
end type

event clicked;dw_cont_emb.scrolltorow(1)
end event

type dw_exam_control from datawindow within tabpage_cont
integer x = 73
integer y = 904
integer width = 3058
integer height = 720
integer taborder = 80
string title = "none"
string dataobject = "dw_exam_control"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_cont_emb from datawindow within tabpage_cont
integer x = 69
integer y = 36
integer width = 2775
integer height = 764
integer taborder = 20
string dragicon = "none!"
string dataobject = "dw_cont_emb"
boolean border = false
boolean livescroll = true
end type

event retrieveend;if this.rowcount() <1 then	
	this.insertrow(0)
	this.setitem(1,"historia",histo)
	this.setitem(1,"ncontrol",1)
	this.setitem(1,"nembarazo",nemba)
else
	this.triggerevent(rowfocuschanged!)
end if
end event

event rowfocuschanged;if this.getrow()<1 then return
ncontrol=this.getitemnumber(this.getrow(),"ncontrol")
dw_exam_control.retrieve(histo,nemba,ncontrol,this.getitemstring(this.getrow(),"clugar"))
end event

event rowfocuschanging;if KeyDown(KeyDownArrow!) OR KeyDown(KeyUpArrow!) or keydown(keytab!) or keydown(keyenter!)then 
	this.scrolltorow(currentrow)
	return 1
end if
end event

type tabpage_rn from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3474
integer height = 1644
string dragicon = "none!"
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Recien Nacido"
long tabtextcolor = 33554432
string picturename = "rn.ico"
long picturemaskcolor = 536870912
pb_last1 pb_last1
pb_next1 pb_next1
pb_save pb_save
pb_del1 pb_del1
pb_new pb_new
pb_prior1 pb_prior1
pb_first1 pb_first1
dw_rn dw_rn
end type

on tabpage_rn.create
this.pb_last1=create pb_last1
this.pb_next1=create pb_next1
this.pb_save=create pb_save
this.pb_del1=create pb_del1
this.pb_new=create pb_new
this.pb_prior1=create pb_prior1
this.pb_first1=create pb_first1
this.dw_rn=create dw_rn
this.Control[]={this.pb_last1,&
this.pb_next1,&
this.pb_save,&
this.pb_del1,&
this.pb_new,&
this.pb_prior1,&
this.pb_first1,&
this.dw_rn}
end on

on tabpage_rn.destroy
destroy(this.pb_last1)
destroy(this.pb_next1)
destroy(this.pb_save)
destroy(this.pb_del1)
destroy(this.pb_new)
destroy(this.pb_prior1)
destroy(this.pb_first1)
destroy(this.dw_rn)
end on

type pb_last1 from picturebutton within tabpage_rn
event mousemove pbm_mousemove
integer x = 2039
integer y = 1384
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "ultimo.GIF"
string disabledname = "d_ultimo.GIF"
string powertiptext = "Ultimo [Alt+U]"
end type

event clicked;dw_rn.scrolltorow(dw_rn.rowcount())
end event

type pb_next1 from picturebutton within tabpage_rn
event mousemove pbm_mousemove
integer x = 1883
integer y = 1384
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "adelante_1.GIF"
string disabledname = "d_adelante_1.GIF"
string powertiptext = "Siguiente Registro"
end type

event clicked;dw_rn.scrollnextrow()
end event

type pb_save from picturebutton within tabpage_rn
event mousemove pbm_mousemove
integer x = 1728
integer y = 1384
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &g"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;if dw_rn.update()=-1 then
	rollback;
	messagebox("Error","Error guardando Registro de Recien nacido")
else
	commit;
end if
end event

type pb_del1 from picturebutton within tabpage_rn
event mousemove pbm_mousemove
integer x = 1573
integer y = 1384
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
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
string powertiptext = "Borrar registro"
end type

event clicked;dw_rn.deleterow(0)
long j
for j=1 to dw_rn.rowcount()
	dw_rn.setitem(j,"nrn",j)
next
end event

type pb_new from picturebutton within tabpage_rn
event mousemove pbm_mousemove
integer x = 1417
integer y = 1384
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
string powertiptext = "Insertar Registro"
end type

event clicked;long j
j=dw_rn.insertrow(0)
dw_rn.setitem(j,"nrn",j)
dw_rn.setitem(j,"historia",histo)
dw_rn.setitem(j,"nembarazo",nemba)
dw_rn.setitem(j,"contador",w_hist_gral.i_contador)
dw_rn.setitem(j,"clugar_his",w_hist_gral.i_clugar_his)
dw_rn.setitem(j,"fechareg",datetime(today()))
end event

type pb_prior1 from picturebutton within tabpage_rn
event mousemove pbm_mousemove
integer x = 1262
integer y = 1384
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "atras_1.GIF"
string disabledname = "d_atras_1.GIF"
string powertiptext = "Anterior"
end type

event clicked;dw_rn.scrollpriorrow()
end event

type pb_first1 from picturebutton within tabpage_rn
event mousemove pbm_mousemove
integer x = 1106
integer y = 1384
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "atras.GIF"
string disabledname = "d_atras.GIF"
string powertiptext = "Primero"
end type

event clicked;dw_rn.scrolltorow(1)
end event

type dw_rn from datawindow within tabpage_rn
integer x = 571
integer y = 36
integer width = 2395
integer height = 1272
integer taborder = 30
string title = "none"
string dataobject = "dw_emba_rn"
boolean border = false
boolean livescroll = true
end type

event rowfocuschanging;if KeyDown(KeyDownArrow!) OR KeyDown(KeyUpArrow!) or keydown(keytab!) or keydown(keyenter!)then 
	this.scrolltorow(currentrow)
	return 1
end if
end event

