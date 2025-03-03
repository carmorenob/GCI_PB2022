$PBExportHeader$w_rn.srw
forward
global type w_rn from window
end type
type cb_first from picturebutton within w_rn
end type
type cb_prior from picturebutton within w_rn
end type
type cb_del from picturebutton within w_rn
end type
type cb_insert from picturebutton within w_rn
end type
type cb_last from picturebutton within w_rn
end type
type cb_next from picturebutton within w_rn
end type
type dw_cuenta from datawindow within w_rn
end type
type cb_cancel from picturebutton within w_rn
end type
type cb_guarda from picturebutton within w_rn
end type
type dw_rn from datawindow within w_rn
end type
end forward

global type w_rn from window
integer width = 2437
integer height = 2136
boolean titlebar = true
string title = "Registro de Recien Nacidos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rn.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
cb_first cb_first
cb_prior cb_prior
cb_del cb_del
cb_insert cb_insert
cb_last cb_last
cb_next cb_next
dw_cuenta dw_cuenta
cb_cancel cb_cancel
cb_guarda cb_guarda
dw_rn dw_rn
end type
global w_rn w_rn

type variables
string sexo_paci,tipo_ingres,clugar_hadm
long nhosp

end variables

on w_rn.create
this.cb_first=create cb_first
this.cb_prior=create cb_prior
this.cb_del=create cb_del
this.cb_insert=create cb_insert
this.cb_last=create cb_last
this.cb_next=create cb_next
this.dw_cuenta=create dw_cuenta
this.cb_cancel=create cb_cancel
this.cb_guarda=create cb_guarda
this.dw_rn=create dw_rn
this.Control[]={this.cb_first,&
this.cb_prior,&
this.cb_del,&
this.cb_insert,&
this.cb_last,&
this.cb_next,&
this.dw_cuenta,&
this.cb_cancel,&
this.cb_guarda,&
this.dw_rn}
end on

on w_rn.destroy
destroy(this.cb_first)
destroy(this.cb_prior)
destroy(this.cb_del)
destroy(this.cb_insert)
destroy(this.cb_last)
destroy(this.cb_next)
destroy(this.dw_cuenta)
destroy(this.cb_cancel)
destroy(this.cb_guarda)
destroy(this.dw_rn)
end on

event open;trae trae2
trae2=message.powerobjectparm
nhosp=trae2.numero
clugar_hadm=trae2.lugar
tipo_ingres=trae2.otro
dw_cuenta.retrieve(nhosp,tipo_ingres,clugar_hadm)
end event

event close;trae lleva
lleva.numero=dw_rn.rowcount()
closewithreturn(this,lleva)
end event

type cb_first from picturebutton within w_rn
event mousemove pbm_mousemove
integer x = 462
integer y = 1864
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras.GIF"
string disabledname = "d_atras.GIF"
alignment htextalign = left!
string powertiptext = "Primer RN"
end type

event clicked;dw_cuenta.scrolltorow(1)
end event

type cb_prior from picturebutton within w_rn
event mousemove pbm_mousemove
integer x = 626
integer y = 1864
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras_1.GIF"
string disabledname = "d_atras_1.GIF"
alignment htextalign = left!
string powertiptext = "Anterior RN"
end type

event clicked;dw_cuenta.scrollpriorrow()
end event

type cb_del from picturebutton within w_rn
event mousemove pbm_mousemove
integer x = 955
integer y = 1864
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar RN [Alt+B]"
end type

event clicked;dw_rn.deleterow(0)
if dw_rn.update()= -1 then
	rollback;
	dw_cuenta.triggerevent(rowfocuschanged!)
else
	commit;
	parent.triggerevent(open!)
end if
end event

type cb_insert from picturebutton within w_rn
event mousemove pbm_mousemove
integer x = 791
integer y = 1864
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &n"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo RN [Alt+N]"
end type

event clicked;dw_cuenta.scrolltorow(dw_cuenta.insertrow(0))
long donde
donde=dw_rn.insertrow(0)
dw_rn.scrolltorow(donde)
dw_rn.setitem(donde,"nh",nhosp)
dw_rn.setitem(donde,"usuario",usuario)
dw_rn.setitem(donde,"clugar",clugar_hadm)
dw_rn.setitem(donde,"codtingre",tipo_ingres)
dw_rn.setitem(donde,"nrn",dw_cuenta.rowcount())
dw_rn.setitem(donde,"fechareg",datetime(today(),time(string(now()))))
end event

type cb_last from picturebutton within w_rn
event mousemove pbm_mousemove
integer x = 1609
integer y = 1864
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ultimo.gif"
string disabledname = "d_ultimo.gif"
alignment htextalign = left!
string powertiptext = "Ultimo RN"
end type

event clicked;dw_cuenta.scrolltorow(dw_cuenta.rowcount())
end event

type cb_next from picturebutton within w_rn
event mousemove pbm_mousemove
integer x = 1445
integer y = 1864
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "adelante_1.GIF"
string disabledname = "d_adelante_1.GIF"
alignment htextalign = left!
string powertiptext = "Siguiente RN"
end type

event clicked;dw_cuenta.scrollnextrow()
end event

type dw_cuenta from datawindow within w_rn
integer x = 78
integer width = 562
integer height = 96
boolean enabled = false
string title = "none"
string dataobject = "dw_cuentarn"
boolean border = false
end type

event constructor;this.settransobject(sqlca)

end event

event rowfocuschanged;if this.getrow()<1 then 
	dw_rn.reset()
	return
end if
dw_rn.retrieve(nhosp,tipo_ingres,this.getitemnumber(this.getrow(),"nrn"),clugar_hadm)

end event

type cb_cancel from picturebutton within w_rn
event mousemove pbm_mousemove
integer x = 1280
integer y = 1864
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type cb_guarda from picturebutton within w_rn
event mousemove pbm_mousemove
integer x = 1120
integer y = 1864
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &g"
boolean default = true
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;long j
for j=1 to dw_rn.rowcount()
	if dw_rn.getitemnumber(j,'edad_gest')=0 or isnull(dw_rn.getitemnumber(j,'edad_gest')) then
		messagebox('Atención','Complete el dato de edad gestacional')
		return		
	end if
	if dw_rn.getitemnumber(j,'pesorn')=0 or isnull(dw_rn.getitemnumber(j,'pesorn')) then
		messagebox('Atención','Complete el dato de peso')
		return		
	end if
	if dw_rn.getitemnumber(j,'tallarn')=0 or isnull(dw_rn.getitemnumber(j,'tallarn')) then
		messagebox('Atención','Complete el dato de Talla')
		return		
	end if
	if dw_rn.getitemstring(j,'diagrn_')='' or isnull(dw_rn.getitemstring(j,'diagrn_')) then
		messagebox('Atención','Complete el dato de Diagnostico')
		return		
	end if
	if dw_rn.getitemstring(j,'estado')='M' and isnull(dw_rn.getitemdatetime(j,'fechamuertern')) then
		messagebox('Atención','Complete el dato de Fecha de muerte')
		return		
	end if
	if dw_rn.getitemstring(j,'estado')='M' and isnull(dw_rn.getitemstring(j,'causamuertern_')) or dw_rn.getitemstring(j,'causamuertern_')='' then
		messagebox('Atención','Complete el dato de Diagnóstico de Muerte')
		return		
	end if
next
if dw_rn.update()=-1 then
	rollback;
	dw_cuenta.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type dw_rn from datawindow within w_rn
integer x = 55
integer y = 104
integer width = 2313
integer height = 1692
integer taborder = 10
string title = "none"
string dataobject = "dw_hosprn"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

event itemchanged;string col,este='',nulo
st_return_diags st

setnull(nulo)
datetime muerte
col=this.getcolumnname()
choose case col
	case "estado"
		if data="M" then
			muerte=datetime(today(),time(string(now())))
		else
			setnull(muerte)
		end if
		this.setitem(this.getrow(),"fechamuertern",muerte)
	case "diagrn_","causamuertern_"
		if isnull(this.getitemstring(1,"sexorn")) then
			messagebox("Atención","Debe escoger el sexo para poder validar los diagnósticos")
			this.setitem(this.getrow(),"diagrn",'')
			return 1
		end if
		sex_busca=this.getitemstring(1,"sexorn")
		edad_busca=daysafter(date(this.getitemdatetime(this.getrow(),'fechareg')),today())
		st=f_check_diag(data,sex_busca,edad_busca,este,'0','1','0')
		if st.descrip_diag="" then
			this.setitem(1,col,"")
			this.setitem(1,left(col,len(col)-1),nulo)
			 if col="diagrn_" then 
				this.setitem(1,'ddxrn',nulo)
			else
				this.setitem(1,'dcm',nulo)
			end if
			return 1
		else
			this.setitem(1,left(col,len(col)-1),este)
			if col="diagrn_" then 
				this.setitem(1,'ddxrn',st.descrip_diag)
			else
				this.setitem(1,'dcm',st.descrip_diag)
			end if
			this.accepttext()
		end if
end choose
end event

event itemfocuschanged;string col
st_return_diags st

col=this.getcolumnname()
choose case col
	case "diagrn_","causamuertern_"
		string data,este
		data=this.getitemstring(1,this.getcolumnname())
		if data<>"" then
			este=this.getitemstring(this.getrow(),left(col,len(col)-1))
			if this.getitemstring(this.getrow(),"sexorn")='M' then sex_busca='1'
			if this.getitemstring(this.getrow(),"sexorn")='F' then sex_busca='2'
			edad_busca=daysafter(date(this.getitemdatetime(this.getrow(),'fechareg')),today())
			st=f_check_diag(data,sex_busca,edad_busca,este,'0','1','0')
			//stt_diag.text=diagn
		else
		//	stt_diag.text=""
		end if
end choose
end event

event doubleclicked;string nombre
nombre=this.getcolumnname()
choose case nombre
	case "diagrn_","causamuertern_"
		if isnull(this.getitemstring(this.getrow(),"sexorn")) then
			messagebox("Atención","Debe escoger el sexo para poder validar los diagnósticos")
			return
		end if
		st_edadsexo st_es
		st_diag st_d
		st_es.sexo=this.getitemstring(this.getrow(),"sexorn")
		st_es.edad=daysafter(date(this.getitemdatetime(this.getrow(),'fechareg')),today())
		st_es.antece='0'
		st_es.proced='0'		
		openwithparm(w_busca_diag,st_es)
		st_d=message.powerobjectparm
		if not isValid(st_d) then return
		if not isNull(st_d.codrip) then
			this.setitem(1,left(nombre,len(nombre)-1),st_d.codgeral)
			this.setitem(1,nombre,st_d.codrip)
			this.accepttext()
			//stt_diag.text=st_d.descripcion
		end if
end choose
end event

