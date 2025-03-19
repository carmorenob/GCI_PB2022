$PBExportHeader$w_escog_profe.srw
forward
global type w_escog_profe from window
end type
type pb_2 from picturebutton within w_escog_profe
end type
type pb_1 from picturebutton within w_escog_profe
end type
type dw_1 from datawindow within w_escog_profe
end type
end forward

global type w_escog_profe from window
integer width = 4357
integer height = 512
boolean titlebar = true
string title = "Datos Orden Externa"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean clientedge = true
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_escog_profe w_escog_profe

type variables
st_x_ordenext st_sale
DataWindowChild idw_ambproc,idw_fincon
end variables

on w_escog_profe.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_escog_profe.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;st_sale=message.powerobjectparm
idw_ambproc.retrieve('1')
idw_fincon.retrieve('1')
dw_1.insertrow(1)
if st_sale.cual='fact' then 
	if isnull(st_sale.ambp) then
		dw_1.setitem(1,'ambp','01')
		dw_1.setitem(1,'finc','44')
	else
		dw_1.setitem(1,'codrip',st_sale.dx)
		dw_1.setitem(1,'desc',st_sale.descp)
		dw_1.setitem(1,'finc',st_sale.finc)
		dw_1.setitem(1,'ambp',st_sale.ambp)	
		dw_1.setitem(1,'codgeral',st_sale.codgeral)	
	end if
	this.title='Datos Orden Externa'
else
	this.title='Datos Orden Intrahospitalaria'
	if st_sale.serv='2' then 
		dw_1.setitem(1,'ambp','03')
	else
		dw_1.setitem(1,'ambp','04')
	end if
	dw_1.setitem(1,'finc','44')
end if
end event

type pb_2 from picturebutton within w_escog_profe
integer x = 4091
integer y = 196
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;setnull(st_sale.ambp)
setnull(st_sale.finc)
setnull(st_sale.dx)
closewithreturn(parent,st_sale)
end event

type pb_1 from picturebutton within w_escog_profe
integer x = 4087
integer y = 48
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if isnull(dw_1.getitemstring(1,'ambp')) then return
if isnull(dw_1.getitemstring(1,'finc')) then return
if isnull(dw_1.getitemstring(1,'codgeral')) then return
st_sale.ambp=dw_1.getitemstring(1,'ambp')
st_sale.finc=dw_1.getitemstring(1,'finc')
st_sale.codgeral=dw_1.getitemstring(1,'codgeral')
st_sale.dx=dw_1.getitemstring(1,'codrip')
st_sale.descp=dw_1.getitemstring(1,'desc')
closewithreturn(parent,st_sale)
end event

type dw_1 from datawindow within w_escog_profe
integer x = 27
integer y = 28
integer width = 4014
integer height = 368
integer taborder = 10
string title = "none"
string dataobject = "dw_orden_ext"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
getchild('ambp',idw_ambproc)
idw_ambproc.settransobject(sqlca)
getchild('finc',idw_fincon)
idw_fincon.settransobject(sqlca)

end event

event doubleclicked;if dwo.name='codrip' then
	st_edadsexo st_es
	st_diag st_d
	st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
	st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
	st_es.antece='0'
	st_es.proced='1'
	openwithparm(w_busca_diag,st_es)
	st_d=message.powerobjectparm
	if not isValid(st_d) then return
	if not isNull(st_d.codrip) then
		setitem(1,'codgeral',st_d.codgeral)
		setitem(1,'codrip',st_d.codrip)
		setitem(1,'desc',st_d.descripcion)
	end if
end if
end event

event itemchanged;st_return_diags st
string ls_este

if getcolumnname()='codrip' then
	setnull(ls_este)
	if trim(gettext())<>'' then
		st=f_check_diag(data,w_principal.dw_1.getitemstring(1,'sexo'),w_principal.dw_1.getitemnumber(1,'dias'),ls_este,'0','2','0')
		if st.descrip_diag='' or isnull(st.descrip_diag) then
			settext(getitemstring(1,getcolumnname()))
			return 1
		end if
		setitem(1,'codgeral',st.codgeral)
		setitem(1,'codrip',data)
		setitem(1,'desc',st.descrip_diag)
	else
		setitem(1,'codgeral',ls_este)
		setitem(1,'codrip',ls_este)
		setitem(1,'desc',ls_este)
	end if	
end if
end event

