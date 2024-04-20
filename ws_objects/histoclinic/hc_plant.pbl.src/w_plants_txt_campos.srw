$PBExportHeader$w_plants_txt_campos.srw
forward
global type w_plants_txt_campos from window
end type
type t1 from tab within w_plants_txt_campos
end type
type tp1 from userobject within t1
end type
type mle_1 from uo_multilineedit within tp1
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
mle_1 mle_1
st_2 st_2
st_3 st_3
dw_plant dw_plant
dw_campo dw_campo
st_1 st_1
pb_8 pb_8
rb_1 rb_1
rb_2 rb_2
pb_1 pb_1
gb_1 gb_1
end type
type tp2 from userobject within t1
end type
type mle_2 from uo_multilineedit within tp2
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
type tp2 from userobject within t1
mle_2 mle_2
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
end type
type t1 from tab within w_plants_txt_campos
tp1 tp1
tp2 tp2
end type
type st_4 from statictext within w_plants_txt_campos
end type
end forward

global type w_plants_txt_campos from window
integer width = 4247
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
global w_plants_txt_campos w_plants_txt_campos

type variables
st_rte i_st
string i_ventana,i_descampo,i_ayudacampo,i_tipop 
boolean i_cambio
long i_item
blob iblb_plantilla
end variables

forward prototypes
public subroutine f_insert_campo (string p_campo, datawindow p_dw, boolean p_rellenar)
public subroutine f_refrescar ()
public function integer f_pregunta ()
public subroutine f_lee_campos (string as_fulltext, datawindow adw_campos)
end prototypes

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

public subroutine f_lee_campos (string as_fulltext, datawindow adw_campos);long ll_pos=1 , ll_pos2
string ls_campo

ll_pos=pos(as_fulltext , "#{",ll_pos)

do while ll_pos>0
	ll_pos2=pos(as_fulltext , "}",ll_pos +1)
	
	ls_campo=mid(as_fulltext , ll_pos+2 , ll_pos2 - (ll_pos+2))
	
	if adw_campos.find("nombre='"+ls_campo+"'",1,adw_campos.rowcount())=0 then
		adw_campos.setitem(adw_campos.insertrow(0),'nombre',ls_campo)
	end if
	
	ll_pos=ll_pos2+1
	ll_pos=pos(as_fulltext , "#{",ll_pos)
loop
end subroutine

on w_plants_txt_campos.create
this.t1=create t1
this.st_4=create st_4
this.Control[]={this.t1,&
this.st_4}
end on

on w_plants_txt_campos.destroy
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
st_4.text='Para el Campo :'+i_descampo
if i_ayudacampo<>'' then st_4.text+='('+i_ayudacampo+')'

if i_tipop='F' then
	t1.tp2.dw_newplant.Object.codprof.dddw.name = 'dw_enfermeria'
else
	t1.tp2.dw_newplant.Object.codprof.dddw.name = 'dw_profe'
end if

t1.tp1.dw_plant.retrieve(i_st.codplantilla,i_st.numcampo,i_st.c_prof)
t1.tp2.dw_newplant.retrieve(i_st.codplantilla,i_st.numcampo,i_st.c_prof)

end event

type t1 from tab within w_plants_txt_campos
event create ( )
event destroy ( )
integer y = 80
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
mle_1 mle_1
st_2 st_2
st_3 st_3
dw_plant dw_plant
dw_campo dw_campo
st_1 st_1
pb_8 pb_8
rb_1 rb_1
rb_2 rb_2
pb_1 pb_1
gb_1 gb_1
end type

on tp1.create
this.mle_1=create mle_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_plant=create dw_plant
this.dw_campo=create dw_campo
this.st_1=create st_1
this.pb_8=create pb_8
this.rb_1=create rb_1
this.rb_2=create rb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.mle_1,&
this.st_2,&
this.st_3,&
this.dw_plant,&
this.dw_campo,&
this.st_1,&
this.pb_8,&
this.rb_1,&
this.rb_2,&
this.pb_1,&
this.gb_1}
end on

on tp1.destroy
destroy(this.mle_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_plant)
destroy(this.dw_campo)
destroy(this.st_1)
destroy(this.pb_8)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

type mle_1 from uo_multilineedit within tp1
integer x = 27
integer y = 868
integer width = 4105
integer height = 1036
integer taborder = 80
end type

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
setnull(mle_1.text)

end event

event rowfocuschanged;if currentrow<1 then return

string cod_plant
long ncampo,item

cod_plant=getitemstring(currentrow,'codplantilla')
ncampo=getitemnumber(currentrow,'numcampo')
item=getitemnumber(currentrow,'item')

dw_campo.reset()

if isnull(cod_plant) then
	mle_1.text=""
else

	sqlca.autocommit=true
	selectblob plantilla_new into :iblb_plantilla from hc_plantilla
	where codplantilla=:cod_plant and numcampo=:ncampo and item=:item;
	sqlca.autocommit=false
	
	mle_1.text=string(iblb_plantilla)
	
	f_lee_campos(string(iblb_plantilla),dw_campo)
	
end if

end event

type dw_campo from datawindow within tp1
event post_itemchanged ( )
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

event post_itemchanged();string campo,ls_todo
int i
accepttext()
ls_todo=string(iblb_plantilla)
for i=1 to rowcount()
	campo=upper(getitemstring(i,'nombre'))
	if not isnull(getitemstring(i,'valor')) then ls_todo=gf_replace_all_text(ls_todo,"#{"+campo+"}",getitemstring(i,'valor'))
next

mle_1.text=ls_todo

setfocus()


end event

event itemchanged;post event post_itemchanged()
end event

type st_1 from statictext within tp1
integer x = 18
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

event clicked;
dw_campo.event post_itemchanged()

if dw_campo.find('isnull(valor)',1,dw_campo.rowcount())>0 then
	messagebox("Atención","Debe completar todos los campos de la plantilla")
	dw_campo.setfocus()
	return
end if

if len(mle_1.text)>0 then
	
	if i_st.ventana = 'A' then
		if rb_1.checked then 
			i_st.mle.text +=mle_1.text
		else
			clipboard(mle_1.text)
			i_st.mle.paste()
		end if
		
	elseif i_st.ventana = 'F' then
		clipboard(mle_1.text)
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
mle_2 mle_2
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
end type

on tp2.create
this.mle_2=create mle_2
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
this.Control[]={this.mle_2,&
this.dw_newplant,&
this.st_7,&
this.pb_6,&
this.pb_7,&
this.pb_save,&
this.dw_newcampo,&
this.st_5,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.st_6}
end on

on tp2.destroy
destroy(this.mle_2)
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
end on

type mle_2 from uo_multilineedit within tp2
integer x = 23
integer y = 852
integer width = 4110
integer height = 1056
integer taborder = 80
end type

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
setnull(mle_2.text)

end event

event rowfocuschanged;if getrow()<1 then return
i_item=getitemnumber(getrow(),'item')
dw_newcampo.reset()
blob texto

sqlca.autocommit=true
selectblob plantilla_new into :texto from hc_plantilla
where codplantilla=:i_st.codplantilla and numcampo=:i_st.numcampo and item=:i_item;
sqlca.autocommit=false

mle_2.text=string(texto)
f_lee_campos(mle_2.text,dw_newcampo)
i_cambio=false 
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
integer x = 2537
integer y = 100
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
dw_newcampo.reset()
i_cambio=true
end event

type pb_7 from picturebutton within tp2
integer x = 2537
integer y = 236
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
integer x = 2537
integer y = 388
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

blob texto
texto=blob(mle_2.text)
if not isnull(texto) and texto<>blob('') then
	sqlca.autocommit=true
	updateblob hc_plantilla set plantilla_new=:texto 
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
integer x = 2921
integer y = 92
integer width = 1042
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
//	do while rte_2.inputfieldlocate(first!,actual)<>''
//		rte_2.InputFieldDeleteCurrent()
//		rte_2.InputFieldInsert ( data)
//	loop
end if
end event

type st_5 from statictext within tp2
integer x = 2921
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
integer x = 3986
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
integer x = 3986
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

event clicked;
mle_2.Text = gf_replace_all_text(mle_2.Text,"#{"+dw_newcampo.getitemstring(dw_newcampo.getrow(),'nombre')+"}","")
dw_newcampo.deleterow(0)
i_cambio=true
end event

type pb_4 from picturebutton within tp2
integer x = 3986
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

event clicked;if dw_newcampo.rowcount()=0 then return
dw_newcampo.accepttext()
i_cambio=true
clipboard("#{"+dw_newcampo.getitemstring(dw_newcampo.getrow(),'nombre')+"}")
mle_2.paste()
end event

type st_6 from statictext within tp2
integer x = 18
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

type st_4 from statictext within w_plants_txt_campos
integer x = 14
integer y = 8
integer width = 4197
integer height = 72
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

