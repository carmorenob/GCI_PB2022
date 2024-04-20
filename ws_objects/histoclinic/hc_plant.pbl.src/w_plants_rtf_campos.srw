$PBExportHeader$w_plants_rtf_campos.srw
forward
global type w_plants_rtf_campos from window
end type
type t1 from tab within w_plants_rtf_campos
end type
type tp1 from userobject within t1
end type
type st_2 from statictext within tp1
end type
type st_3 from statictext within tp1
end type
type dw_plant from datawindow within tp1
end type
type dw_campo from datawindow within tp1
end type
type st_1 from statictext within tp1
end type
type rte_1 from richtextedit within tp1
end type
type pb_8 from picturebutton within tp1
end type
type rb_1 from radiobutton within tp1
end type
type rb_2 from radiobutton within tp1
end type
type pb_1 from picturebutton within tp1
end type
type gb_1 from groupbox within tp1
end type
type tp1 from userobject within t1
st_2 st_2
st_3 st_3
dw_plant dw_plant
dw_campo dw_campo
st_1 st_1
rte_1 rte_1
pb_8 pb_8
rb_1 rb_1
rb_2 rb_2
pb_1 pb_1
gb_1 gb_1
end type
type tp2 from userobject within t1
end type
type dw_newplant from datawindow within tp2
end type
type st_7 from statictext within tp2
end type
type pb_6 from picturebutton within tp2
end type
type pb_7 from picturebutton within tp2
end type
type pb_save from picturebutton within tp2
end type
type dw_newcampo from datawindow within tp2
end type
type st_5 from statictext within tp2
end type
type pb_2 from picturebutton within tp2
end type
type pb_3 from picturebutton within tp2
end type
type pb_4 from picturebutton within tp2
end type
type st_6 from statictext within tp2
end type
type rte_2 from richtextedit within tp2
end type
type tp2 from userobject within t1
dw_newplant dw_newplant
st_7 st_7
pb_6 pb_6
pb_7 pb_7
pb_save pb_save
dw_newcampo dw_newcampo
st_5 st_5
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
st_6 st_6
rte_2 rte_2
end type
type t1 from tab within w_plants_rtf_campos
tp1 tp1
tp2 tp2
end type
type st_4 from statictext within w_plants_rtf_campos
end type
end forward

global type w_plants_rtf_campos from window
integer width = 4288
integer height = 2256
boolean titlebar = true
string title = "Seleccion de Plantillas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "editar.ico"
boolean clientedge = true
boolean center = true
t1 t1
st_4 st_4
end type
global w_plants_rtf_campos w_plants_rtf_campos

type variables
st_rte i_st
string i_ventana,i_descampo,i_ayudacampo,i_tipop
boolean i_cambio
long i_item

end variables

forward prototypes
public subroutine f_lee_campos (richtextedit p_rte, datawindow p_dw)
public subroutine f_rowfocuschanged (datawindow p_dwplant, richtextedit p_rte, datawindow p_dwcampos)
public subroutine f_insert_campo (string p_campo, datawindow p_dw, boolean p_rellenar)
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
		if p_dw.dataobject='dw_reemp_campo_rtf' then //colocar las del paciente
			f_insert_campo(campo,p_dw,true)
		else
			f_insert_campo(campo,p_dw,false)
		end if
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

public subroutine f_rowfocuschanged (datawindow p_dwplant, richtextedit p_rte, datawindow p_dwcampos);if p_dwplant.getrow()<1 then return
string cod_plant
long ncampo,item
cod_plant=p_dwplant.getitemstring(p_dwplant.getrow(),'codplantilla')
ncampo=p_dwplant.getitemnumber(p_dwplant.getrow(),'numcampo')
item=p_dwplant.getitemnumber(p_dwplant.getrow(),'item')
p_dwcampos.reset()
if isnull(cod_plant) then
	f_sel_rtf(p_rte)
	p_rte.clearall()
else
	blob texto
	string str
	sqlca.autocommit=true
	selectblob plantilla into :texto from hc_plantilla
	where codplantilla=:cod_plant and numcampo=:ncampo and item=:item;
	sqlca.autocommit=false
	str=string(texto)
	if isnull(str) then str=''
	if f_pega_a_rtf(p_rte,str,3)>0 then f_lee_campos(p_rte,p_dwcampos)
end if
p_rte.modified=false
end subroutine

public subroutine f_insert_campo (string p_campo, datawindow p_dw, boolean p_rellenar);long donde
if p_dw.find('nombre="'+p_campo+'"',1,p_dw.rowcount())=0 then
	donde=p_dw.insertrow(0)
	p_dw.setitem(donde,'nombre',p_campo)
	if p_rellenar then
		if p_campo='tipodoc' then
			p_dw.setitem(donde,'valor',i_st.dw_pac.getitemstring(1,'tipodoc'))
		elseif p_campo='documento' then
			p_dw.setitem(donde,'valor',i_st.dw_pac.getitemstring(1,'documento'))
		elseif p_campo='nombre1' then
			p_dw.setitem(donde,'valor',i_st.dw_pac.getitemstring(1,'nombre1'))
		elseif p_campo='nombre2' then
			p_dw.setitem(donde,'valor',i_st.dw_pac.getitemstring(1,'nombre2'))
		elseif p_campo='apellido1' then
			p_dw.setitem(donde,'valor',i_st.dw_pac.getitemstring(1,'apellido1'))
		elseif p_campo='apellido2' then
			p_dw.setitem(donde,'valor',i_st.dw_pac.getitemstring(1,'apellido2'))
		elseif p_campo='fechanace' then
			p_dw.setitem(donde,'valor',string(i_st.dw_pac.getitemdatetime(1,'fnacimiento')))
		elseif p_campo='edad' then
			p_dw.setitem(donde,'valor',i_st.dw_pac.getitemstring(1,'edad'))
		elseif p_campo='empresa' then
			p_dw.setitem(donde,'valor',i_st.empresa)
		end if
	end if
end if
end subroutine

public subroutine f_refrescar ();t1.tp1.dw_plant.reset()
t1.tp1.dw_plant.retrieve(i_st.codplantilla,i_st.numcampo,i_st.c_prof)
end subroutine

public function integer f_pregunta ();if not i_cambio then return 1
choose case messagebox('Atención','Realizó cambios en la plantilla, desea guardarlos ?',question!,yesnocancel!,1)
	case 1
		return t1.tp2.pb_save.event clicked()
	case 2
		i_cambio=false
		return 1
	case 3
		return -1
end choose
end function

on w_plants_rtf_campos.create
this.t1=create t1
this.st_4=create st_4
this.Control[]={this.t1,&
this.st_4}
end on

on w_plants_rtf_campos.destroy
destroy(this.t1)
destroy(this.st_4)
end on

event open;i_st=message.powerobjectparm
string descrip
if g_motor='postgres' then
	select  profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '||
	 profe.apellido1||case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof
	 into :descrip from profe where codprof=:i_st.c_prof;
else
	select  profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
	 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof
	 into :descrip from profe where codprof=:i_st.c_prof;
end if
title='Plantillas generales y del Profesional: '+upper(descrip)
select hclin_plantcampo.descampo,hclin_plantcampo.ayuda, hclin_plant.tipo into :i_descampo,:i_ayudacampo,:i_tipop
from hclin_plant inner join hclin_plantcampo on hclin_plant.codplantilla = hclin_plantcampo.codplantilla
where hclin_plantcampo.codplantilla=:i_st.codplantilla and hclin_plantcampo.numcampo=:i_st.numcampo;
if isnull(i_ayudacampo) then i_ayudacampo=''
st_4.text='Para el Campo :'+i_descampo+'('+i_ayudacampo+')'
if i_tipop='F' then
	t1.tp2.dw_newplant.Object.codprof.dddw.name = 'dw_enfermeria'
else
	t1.tp2.dw_newplant.Object.codprof.dddw.name = 'dw_profe'
end if
t1.tp1.dw_plant.retrieve(i_st.codplantilla,i_st.numcampo,i_st.c_prof)
t1.tp2.dw_newplant.retrieve(i_st.codplantilla,i_st.numcampo,i_st.c_prof)
end event

type t1 from tab within w_plants_rtf_campos
event create ( )
event destroy ( )
integer y = 72
integer width = 4197
integer height = 2064
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tp1 tp1
tp2 tp2
end type

on t1.create
this.tp1=create tp1
this.tp2=create tp2
this.Control[]={this.tp1,&
this.tp2}
end on

on t1.destroy
destroy(this.tp1)
destroy(this.tp2)
end on

type tp1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4160
integer height = 1936
long backcolor = 67108864
string text = "Seleccionar"
long tabtextcolor = 33554432
string picturename = "rep.ico"
long picturemaskcolor = 536870912
string powertiptext = "Seleccionar y llevar datos"
st_2 st_2
st_3 st_3
dw_plant dw_plant
dw_campo dw_campo
st_1 st_1
rte_1 rte_1
pb_8 pb_8
rb_1 rb_1
rb_2 rb_2
pb_1 pb_1
gb_1 gb_1
end type

on tp1.create
this.st_2=create st_2
this.st_3=create st_3
this.dw_plant=create dw_plant
this.dw_campo=create dw_campo
this.st_1=create st_1
this.rte_1=create rte_1
this.pb_8=create pb_8
this.rb_1=create rb_1
this.rb_2=create rb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.st_3,&
this.dw_plant,&
this.dw_campo,&
this.st_1,&
this.rte_1,&
this.pb_8,&
this.rb_1,&
this.rb_2,&
this.pb_1,&
this.gb_1}
end on

on tp1.destroy
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_plant)
destroy(this.dw_campo)
destroy(this.st_1)
destroy(this.rte_1)
destroy(this.pb_8)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

type st_2 from statictext within tp1
integer x = 14
integer width = 635
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plantillas Disponibles:"
boolean focusrectangle = false
end type

type st_3 from statictext within tp1
integer x = 2610
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

type dw_plant from datawindow within tp1
integer x = 14
integer y = 52
integer width = 2514
integer height = 616
integer taborder = 30
string title = "none"
string dataobject = "dw_plant_rtf"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
modify('nombre_plant.width=864')
end event

event retrievestart;reset()
dw_campo.reset()
f_sel_rtf(rte_1)
rte_1.clearall()
end event

event rowfocuschanged;f_rowfocuschanged(this,rte_1,dw_campo)
end event

type dw_campo from datawindow within tp1
integer x = 2610
integer y = 52
integer width = 1554
integer height = 788
integer taborder = 30
string title = "none"
string dataobject = "dw_reemp_campo_rtf"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;string campo,selec
campo=upper(getitemstring(row,'nombre'))
rte_1.InputFieldChangeData ( campo, data )
setfocus()


end event

type st_1 from statictext within tp1
integer x = 5
integer y = 804
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

type rte_1 from richtextedit within tp1
integer x = 5
integer y = 856
integer width = 4105
integer height = 1080
integer taborder = 120
integer textsize = -10
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_inputfieldsvisible = true
long init_leftmargin = 2000
long init_rightmargin = 2000
borderstyle borderstyle = stylelowered!
end type

event key;if  key=i_nextitem or key=i_previtem or key=i_nextchild then 
	//navegar(key)
else
	if g_ctrlv<>'1' then 
		If keyflags = 2 or keydown(KeyControl!) then
			if key=keyv! then return 1	
			IF keydown(KeyAlt!) THEN 
				if key=keyv! then return 1
			end if
		else
			IF keyflags = 1 THEN
				if key=keyinsert! then return 1
			end if
		end if
	end if
end if
end event

type pb_8 from picturebutton within tp1
integer x = 311
integer y = 712
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "puerta.gif"
alignment htextalign = left!
string powertiptext = "Salir y Cancelar"
end type

event clicked;close(f_vent_padre(this))
end event

type rb_1 from radiobutton within tp1
integer x = 530
integer y = 720
integer width = 306
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Al Final"
boolean checked = true
end type

type rb_2 from radiobutton within tp1
integer x = 526
integer y = 780
integer width = 352
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "En el Cursor"
end type

type pb_1 from picturebutton within tp1
integer x = 946
integer y = 696
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Llevar datos"
end type

event clicked;dw_campo.accepttext()
if f_sel_rtf(rte_1)>0 then
	long j
	string reemp,cual
	for j=1 to dw_campo.rowcount()
		cual=dw_campo.getitemstring(j,'nombre')
		reemp=rte_1.InputFieldLocate ( first! , cual )
		do while reemp<>''
			rte_1.InputFieldDeleteCurrent ( )
			rte_1.replacetext(dw_campo.getitemstring(j,'valor'))
			reemp=rte_1.InputFieldLocate ( first! , cual )
		loop
	next
	if i_st.ventana = 'A' then
		if rb_1.checked then i_st.rte.selecttext(999999,999999,0,0)
		i_st.rte.pastertf(rte_1.copyrtf(false,detail!))
	elseif i_st.ventana = 'F' then
		rte_1.SelectTextAll()
		rte_1.Copy()
		i_st.dw_data.Paste()
	end if
end if
close(f_vent_padre(this))

end event

type gb_1 from groupbox within tp1
integer x = 494
integer y = 664
integer width = 613
integer height = 184
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Insertar"
end type

type tp2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4160
integer height = 1936
long backcolor = 67108864
string text = "Creación / Edición"
long tabtextcolor = 33554432
string picturename = "editar.ico"
long picturemaskcolor = 536870912
string powertiptext = "Crear Nuevas Plantillas o Editar las ya existentes"
dw_newplant dw_newplant
st_7 st_7
pb_6 pb_6
pb_7 pb_7
pb_save pb_save
dw_newcampo dw_newcampo
st_5 st_5
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
st_6 st_6
rte_2 rte_2
end type

on tp2.create
this.dw_newplant=create dw_newplant
this.st_7=create st_7
this.pb_6=create pb_6
this.pb_7=create pb_7
this.pb_save=create pb_save
this.dw_newcampo=create dw_newcampo
this.st_5=create st_5
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.st_6=create st_6
this.rte_2=create rte_2
this.Control[]={this.dw_newplant,&
this.st_7,&
this.pb_6,&
this.pb_7,&
this.pb_save,&
this.dw_newcampo,&
this.st_5,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.st_6,&
this.rte_2}
end on

on tp2.destroy
destroy(this.dw_newplant)
destroy(this.st_7)
destroy(this.pb_6)
destroy(this.pb_7)
destroy(this.pb_save)
destroy(this.dw_newcampo)
destroy(this.st_5)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.st_6)
destroy(this.rte_2)
end on

type dw_newplant from datawindow within tp2
integer y = 92
integer width = 2514
integer height = 640
integer taborder = 40
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

event itemchanged;accepttext()
i_cambio=true
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
where codplantilla=:i_st.codplantilla and numcampo=:i_st.numcampo and item=:i_item;
sqlca.autocommit=false
str=string(texto)
if isnull(str) then str=''
if f_pega_a_rtf(rte_2,str,3)>0 then f_lee_campos(rte_2,dw_newcampo)
i_cambio=false //porque o si no alla en f-pega lo cambia
rte_2.modified=false
end event

event rowfocuschanging;if f_pregunta()=-1 then return 1
end event

type st_7 from statictext within tp2
integer x = 5
integer y = 36
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

type pb_6 from picturebutton within tp2
integer x = 2624
integer y = 104
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Nueva Plantilla"
end type

event clicked;if f_pregunta()=-1 then return
long donde,j
string cod_plant
select max(item) into :j from hc_plantilla where codplantilla=:i_st.codplantilla and numcampo=:i_st.numcampo;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo hc_plantilla',sqlca.sqlerrtext)
	return
end if
if isnull(j) then j=0
j++
donde=dw_newplant.insertrow(0)
dw_newplant.setitem(donde,'codplantilla',i_st.codplantilla)
dw_newplant.setitem(donde,'numcampo',i_st.numcampo)
dw_newplant.setitem(donde,'codprof',i_st.c_prof)
i_item=j
dw_newplant.setitem(donde,'item',i_item)

dw_newplant.scrolltorow(DONDE)
dw_newplant.setfocus()
i_cambio=true
end event

type pb_7 from picturebutton within tp2
integer x = 2624
integer y = 240
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
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

type pb_save from picturebutton within tp2
integer x = 2624
integer y = 392
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
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
//i_st.codplantilla,i_st.numcampo)

blob texto
texto=blob(rte_2.copyrtf(false,detail!))
if not isnull(texto) and texto<>blob('') then
	sqlca.autocommit=true
	updateblob hc_plantilla set plantilla=:texto 
	where codplantilla =:i_st.codplantilla  and numcampo =:i_st.numcampo and item=:i_item;
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

type dw_newcampo from datawindow within tp2
integer x = 2894
integer y = 92
integer width = 800
integer height = 648
integer taborder = 20
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

type st_5 from statictext within tp2
integer x = 2894
integer y = 36
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

type pb_2 from picturebutton within tp2
integer x = 3749
integer y = 100
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
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo campo"
end type

event clicked;dw_newcampo.insertrow(0)

end event

type pb_3 from picturebutton within tp2
integer x = 3749
integer y = 228
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
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

type pb_4 from picturebutton within tp2
integer x = 3749
integer y = 384
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Insertar campo en Plantilla"
end type

event clicked;dw_newcampo.accepttext()
rte_2.InputFieldInsert ( dw_newcampo.getitemstring(dw_newcampo.getrow(),'nombre'))
i_cambio=true
end event

type st_6 from statictext within tp2
integer y = 784
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

type rte_2 from richtextedit within tp2
integer y = 836
integer width = 4009
integer height = 1068
integer taborder = 110
integer textsize = -10
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

event key;if  key=i_nextitem or key=i_previtem or key=i_nextchild then 
//	navegar(key)
else
	if g_ctrlv<>'1' then 
		If keyflags = 2 or keydown(KeyControl!) then
			if key=keyv! then return 1	
			IF keydown(KeyAlt!) THEN 
				if key=keyv! then return 1
			end if
		else
			IF keyflags = 1 THEN
				if key=keyinsert! then return 1
			end if
		end if
	end if
end if
end event

type st_4 from statictext within w_plants_rtf_campos
integer x = 9
integer width = 3685
integer height = 68
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

