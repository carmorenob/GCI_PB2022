$PBExportHeader$w_edita_plant_rtf.srw
forward
global type w_edita_plant_rtf from window
end type
type rte_2 from richtextedit within w_edita_plant_rtf
end type
type st_6 from statictext within w_edita_plant_rtf
end type
type pb_4 from picturebutton within w_edita_plant_rtf
end type
type pb_3 from picturebutton within w_edita_plant_rtf
end type
type pb_2 from picturebutton within w_edita_plant_rtf
end type
type st_5 from statictext within w_edita_plant_rtf
end type
type dw_newcampo from datawindow within w_edita_plant_rtf
end type
type pb_save from picturebutton within w_edita_plant_rtf
end type
type pb_7 from picturebutton within w_edita_plant_rtf
end type
type pb_6 from picturebutton within w_edita_plant_rtf
end type
type st_4 from statictext within w_edita_plant_rtf
end type
type dw_newplant from datawindow within w_edita_plant_rtf
end type
end forward

global type w_edita_plant_rtf from window
integer width = 3625
integer height = 1768
boolean titlebar = true
string title = "Plantillas de Campo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "editar.ico"
boolean clientedge = true
boolean center = true
rte_2 rte_2
st_6 st_6
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
st_5 st_5
dw_newcampo dw_newcampo
pb_save pb_save
pb_7 pb_7
pb_6 pb_6
st_4 st_4
dw_newplant dw_newplant
end type
global w_edita_plant_rtf w_edita_plant_rtf

type variables
boolean i_cambio
string i_cplant
long i_ncampo,i_item
datawindow i_dw
end variables

forward prototypes
public subroutine f_lee_campos (richtextedit p_rte, datawindow p_dw)
public subroutine f_rowfocuschanged (datawindow p_dwplant, richtextedit p_rte, datawindow p_dwcampos)
public subroutine f_refrescar ()
public function integer f_pregunta ()
end prototypes

public subroutine f_lee_campos (richtextedit p_rte, datawindow p_dw);string campo
long donde,lineaactual=1,nuevalinea,posactual=0,posnew
campo=p_rte.inputfieldlocate(first!)
if campo<>'' then
	nuevalinea=p_rte.selectedline()
	posnew=p_rte.selectedstart()
	do while nuevalinea>lineaactual or (nuevalinea=lineaactual and posnew>posactual)
		
		donde=p_dw.insertrow(0)
		p_dw.setitem(donde,'nombre',campo)
		campo=p_rte.inputfieldlocate(next!)
		lineaactual=nuevalinea
		nuevalinea=p_rte.selectedline()
		posactual=posnew
		posnew=p_rte.selectedstart()
	loop
end if
if p_dw.dataobject='dw_reemp_campo_rtf' then
	for donde=1 to p_dw.rowcount()
		p_dw.event itemchanged(donde,p_dw.object.valor,p_dw.getitemstring(donde,'valor'))
	next
end if
end subroutine

public subroutine f_rowfocuschanged (datawindow p_dwplant, richtextedit p_rte, datawindow p_dwcampos);
end subroutine

public subroutine f_refrescar ();
end subroutine

public function integer f_pregunta ();if not i_cambio then return 1
choose case messagebox('Atención','Realizó cambios en la plantilla, desea guardarlos ?',question!,yesnocancel!,1)
	case 1
		return pb_save.event clicked()
	case 2
		i_cambio=false
		return 1
	case 3
		return -1
end choose
end function

on w_edita_plant_rtf.create
this.rte_2=create rte_2
this.st_6=create st_6
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_5=create st_5
this.dw_newcampo=create dw_newcampo
this.pb_save=create pb_save
this.pb_7=create pb_7
this.pb_6=create pb_6
this.st_4=create st_4
this.dw_newplant=create dw_newplant
this.Control[]={this.rte_2,&
this.st_6,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.st_5,&
this.dw_newcampo,&
this.pb_save,&
this.pb_7,&
this.pb_6,&
this.st_4,&
this.dw_newplant}
end on

on w_edita_plant_rtf.destroy
destroy(this.rte_2)
destroy(this.st_6)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_5)
destroy(this.dw_newcampo)
destroy(this.pb_save)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.st_4)
destroy(this.dw_newplant)
end on

event open;i_dw=message.powerobjectparm

if i_dw.dataobject="dw_campopgc" then 
//	i_cplant=i_dw.getitemstring(i_dw.getrow(),'codproced')
	i_cplant=i_dw.getitemstring(i_dw.getrow(),'cod_cups')
	i_ncampo=i_dw.getitemnumber(i_dw.getrow(),'consecampo')
else
	i_cplant=i_dw.getitemstring(i_dw.getrow(),'codplantilla')
	i_ncampo=i_dw.getitemnumber(i_dw.getrow(),'numcampo')
end if
dw_newplant.retrieve(i_cplant,i_ncampo)
end event

event closequery;if f_pregunta()=-1 then return 1
	
end event

type rte_2 from richtextedit within w_edita_plant_rtf
integer x = 37
integer y = 796
integer width = 3520
integer height = 828
integer taborder = 60
integer textsize = -8
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
long init_leftmargin = 2000
long init_rightmargin = 2000
borderstyle borderstyle = stylelowered!
end type

event modified;i_cambio=true
end event

type st_6 from statictext within w_edita_plant_rtf
integer x = 41
integer y = 744
integer width = 297
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vista Previa:"
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_edita_plant_rtf
integer x = 3392
integer y = 344
integer width = 137
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Insertar campo en Plantilla"
end type

event clicked;dw_newcampo.accepttext()
rte_2.InputFieldInsert ( dw_newcampo.getitemstring(dw_newcampo.getrow(),'nombre'))
i_cambio=true
end event

type pb_3 from picturebutton within w_edita_plant_rtf
integer x = 3392
integer y = 188
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Campo"
end type

event clicked;string actual
actual=dw_newcampo.getitemstring(dw_newcampo.getrow(),'nombre')
do while rte_2.inputfieldlocate(first!,actual)<>''
	rte_2.InputFieldDeleteCurrent()
loop
dw_newcampo.deleterow(0)
i_cambio=true
end event

type pb_2 from picturebutton within w_edita_plant_rtf
integer x = 3392
integer y = 60
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo campo"
end type

event clicked;dw_newcampo.insertrow(0)

end event

type st_5 from statictext within w_edita_plant_rtf
integer x = 2761
integer width = 576
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Campos de la Plantilla:"
boolean focusrectangle = false
end type

type dw_newcampo from datawindow within w_edita_plant_rtf
integer x = 2761
integer y = 60
integer width = 603
integer height = 648
integer taborder = 10
string title = "none"
string dataobject = "dw_campo_plant_rtf"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if dwo.name='nombre' then pb_4.triggerevent(clicked!)
end event

event itemchanged;string actual
actual=getitemstring(getrow(),'nombre')
if isnull(actual) then actual=''
if actual<>'' then//le cambiaron el nombre y toca ir a cambiarlo
	do while rte_2.inputfieldlocate(first!,actual)<>''
		rte_2.InputFieldDeleteCurrent()
		rte_2.InputFieldInsert ( data)
	loop
end if
end event

type pb_save from picturebutton within w_edita_plant_rtf
integer x = 2542
integer y = 356
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Plantilla"
end type

event clicked;if dw_newplant.update(true,false)=-1 then 
	rollback;
	return -1
end if
dw_newplant.ResetUpdate()
commit;
blob texto
texto=blob(rte_2.copyrtf(false,detail!))
if not isnull(texto) and texto<>blob('') then
	sqlca.autocommit=true
	updateblob hc_plantilla set plantilla=:texto 
	where codplantilla =:i_cplant  and numcampo =:i_ncampo and item=:i_item;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando campo plantilla",sqlca.sqlerrtext)
		rollback;
		sqlca.autocommit=false
		f_refrescar()
		return -1
	end if
	sqlca.autocommit=false
end if
f_refrescar()
i_cambio=false
return 1
end event

type pb_7 from picturebutton within w_edita_plant_rtf
integer x = 2542
integer y = 192
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Plantilla"
end type

event clicked;if messagebox("Atención",'Está seguro que desa borrar esta plantilla ?',question!,yesno!,2)=2 then return
dw_newplant.deleterow(0)
dw_newcampo.reset()
if dw_newplant.update()=-1 then
	rollback;
	f_refrescar()
	return
end if
commit;
f_refrescar()

end event

type pb_6 from picturebutton within w_edita_plant_rtf
integer x = 2542
integer y = 64
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Nueva Plantilla"
end type

event clicked;if f_pregunta()=-1 then return
long donde,j
string cod_plant

donde=dw_newplant.insertrow(0)
for j=1 to dw_newplant.rowcount()
	if dw_newplant.find('item='+string(j),1,dw_newplant.rowcount())=0 then exit
next
dw_newplant.setitem(donde,'codplantilla',i_cplant)
dw_newplant.setitem(donde,'numcampo',i_ncampo)
i_item=j
dw_newplant.setitem(donde,'item',i_item)

dw_newplant.scrolltorow(DONDE)
dw_newplant.setfocus()
i_cambio=true
end event

type st_4 from statictext within w_edita_plant_rtf
integer x = 41
integer y = 12
integer width = 416
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plantillas Actuales:"
boolean focusrectangle = false
end type

type dw_newplant from datawindow within w_edita_plant_rtf
integer x = 37
integer y = 68
integer width = 2437
integer height = 640
integer taborder = 10
string title = "none"
string dataobject = "dw_plant_rtf"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
modify('nombre_plant.edit.displayonly=no')
end event

event retrievestart;reset()
dw_newcampo.reset()
f_sel_rtf(rte_2)
rte_2.clearall()
end event

event rowfocuschanged;if getrow()<1 then return
i_item=getitemnumber(getrow(),'item')
dw_newcampo.reset()
blob texto
string str
sqlca.autocommit=true
selectblob plantilla into :texto from hc_plantilla
where codplantilla=:i_cplant and numcampo=:i_ncampo and item=:i_item;
sqlca.autocommit=false
str=string(texto)
if isnull(str) then str=''
if f_pega_a_rtf(rte_2,str,3)>0 then f_lee_campos(rte_2,dw_newcampo)
i_cambio=false //porque o si no alla en f-pega lo cambia
end event

event itemchanged;accepttext()
i_cambio=true
end event

event rowfocuschanging;if f_pregunta()=-1 then return 1
end event

