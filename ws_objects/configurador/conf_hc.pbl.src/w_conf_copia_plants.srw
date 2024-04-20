$PBExportHeader$w_conf_copia_plants.srw
forward
global type w_conf_copia_plants from window
end type
type st_dest from statictext within w_conf_copia_plants
end type
type st_3 from statictext within w_conf_copia_plants
end type
type pb_ok from picturebutton within w_conf_copia_plants
end type
type dw_campos from datawindow within w_conf_copia_plants
end type
end forward

global type w_conf_copia_plants from window
integer width = 3127
integer height = 1748
boolean titlebar = true
string title = "Configuración de Copia de datos de Urgencias Anteriores"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_dest st_dest
st_3 st_3
pb_ok pb_ok
dw_campos dw_campos
end type
global w_conf_copia_plants w_conf_copia_plants

type variables
datawindowchild idw_plants,idw_campos
string i_cplant

end variables

on w_conf_copia_plants.create
this.st_dest=create st_dest
this.st_3=create st_3
this.pb_ok=create pb_ok
this.dw_campos=create dw_campos
this.Control[]={this.st_dest,&
this.st_3,&
this.pb_ok,&
this.dw_campos}
end on

on w_conf_copia_plants.destroy
destroy(this.st_dest)
destroy(this.st_3)
destroy(this.pb_ok)
destroy(this.dw_campos)
end on

event open;i_cplant=message.stringparm
select desplantilla into :st_dest.text from hclin_plant where codplantilla=:i_cplant;
dw_campos.retrieve(i_cplant)
end event

type st_dest from statictext within w_conf_copia_plants
integer x = 544
integer y = 12
integer width = 2295
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

type st_3 from statictext within w_conf_copia_plants
integer y = 12
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

type pb_ok from picturebutton within w_conf_copia_plants
integer x = 2889
integer width = 151
integer height = 132
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;long j
string nulo
setnull(nulo)
for j=1 to dw_campos.rowcount()
	if isnull(dw_campos.getitemstring(j,'descampo2')) and not isnull(dw_campos.getitemstring(j,'cplant_urg')) then
		dw_campos.setitem(j,'cplant_urg',nulo)
	end if
next
if dw_campos.update(true,false)=-1 then
	rollback;
	return
else
	commit;
end if
close(parent)
end event

type dw_campos from datawindow within w_conf_copia_plants
event keypres pbm_dwnkey
integer y = 124
integer width = 3118
integer height = 1536
integer taborder = 10
string title = "none"
string dataobject = "dw_copiar_new"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event keypres;if key=keydelete! then
	string snulo
	long nnulo
	setnull(nnulo)
	setnull(snulo)
	if rowcount()=0 then return
	choose case getcolumnname()
		case 'cplant_urg'
			setitem(getrow(),'cplant_urg',snulo)
			setitem(getrow(),'descampo2',snulo)
			setitem(getrow(),'ncampo_urg',nnulo)
		case 'descampo2'
			setitem(getrow(),'descampo2',snulo)
			setitem(getrow(),'ncampo_urg',nnulo)
	end choose
end if
end event

event constructor;settransobject(sqlca)
getchild('descampo2',idw_campos)
idw_campos.settransobject(sqlca)
settransobject(sqlca)
getchild('cplant_urg',idw_plants)
idw_plants.settransobject(sqlca)
idw_plants.setfilter("(tipo='H' or tipo='Q') and (codtingre='T' or codtingre='2')")
idw_plants.retrieve('%')
insertrow(1)
end event

event rowfocuschanged;if getrow()=0 then return
idw_campos.retrieve(getitemstring(getrow(),'cplant_urg'),getitemstring(getrow(),'tipo'))

end event

event itemchanged;string snulo
long nnulo
setnull(snulo)
setnull(nnulo)
choose case dwo.name
	case 'cplant_urg'
		setitem(row,'descampo2',snulo)
		setitem(row,'ncampo_urg',nnulo)
		idw_campos.retrieve(data,getitemstring(row,'tipo'))
	case 'descampo2'
		setitem(row,'ncampo_urg',idw_campos.getitemnumber(idw_campos.getrow(),'numcampo'))
end choose

end event

