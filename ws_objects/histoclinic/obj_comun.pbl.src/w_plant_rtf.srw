$PBExportHeader$w_plant_rtf.srw
forward
global type w_plant_rtf from window
end type
type st_7 from statictext within w_plant_rtf
end type
type rb_allwindow from radiobutton within w_plant_rtf
end type
type rb_window from radiobutton within w_plant_rtf
end type
type tab_1 from tab within w_plant_rtf
end type
type tp_1 from userobject within tab_1
end type
type pb_8 from picturebutton within tp_1
end type
type rb_2 from radiobutton within tp_1
end type
type rb_1 from radiobutton within tp_1
end type
type pb_1 from picturebutton within tp_1
end type
type st_3 from statictext within tp_1
end type
type st_2 from statictext within tp_1
end type
type st_1 from statictext within tp_1
end type
type dw_campo from datawindow within tp_1
end type
type dw_plant from datawindow within tp_1
end type
type gb_1 from groupbox within tp_1
end type
type rte_1 from richtextedit within tp_1
end type
type tp_1 from userobject within tab_1
pb_8 pb_8
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
st_3 st_3
st_2 st_2
st_1 st_1
dw_campo dw_campo
dw_plant dw_plant
gb_1 gb_1
rte_1 rte_1
end type
type tp_2 from userobject within tab_1
end type
type st_6 from statictext within tp_2
end type
type st_5 from statictext within tp_2
end type
type st_4 from statictext within tp_2
end type
type pb_9 from picturebutton within tp_2
end type
type pb_7 from picturebutton within tp_2
end type
type pb_6 from picturebutton within tp_2
end type
type pb_save from picturebutton within tp_2
end type
type pb_4 from picturebutton within tp_2
end type
type pb_3 from picturebutton within tp_2
end type
type pb_2 from picturebutton within tp_2
end type
type rte_2 from richtextedit within tp_2
end type
type dw_newcampo from datawindow within tp_2
end type
type dw_newplant from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
st_6 st_6
st_5 st_5
st_4 st_4
pb_9 pb_9
pb_7 pb_7
pb_6 pb_6
pb_save pb_save
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
rte_2 rte_2
dw_newcampo dw_newcampo
dw_newplant dw_newplant
end type
type tab_1 from tab within w_plant_rtf
tp_1 tp_1
tp_2 tp_2
end type
type gb_2 from groupbox within w_plant_rtf
end type
end forward

global type w_plant_rtf from window
integer width = 4283
integer height = 2544
boolean titlebar = true
string title = "Seleccion de Plantillas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "editar.ico"
boolean clientedge = true
boolean center = true
st_7 st_7
rb_allwindow rb_allwindow
rb_window rb_window
tab_1 tab_1
gb_2 gb_2
end type
global w_plant_rtf w_plant_rtf

type variables
st_rte i_st
string i_ventana,i_descampo,i_ayudacampo

end variables

forward prototypes
public subroutine f_lee_campos (richtextedit p_rte, datawindow p_dw)
public subroutine f_rowfocuschanged (datawindow p_dwplant, richtextedit p_rte, datawindow p_dwcampos)
public subroutine f_refrescar ()
public subroutine f_insert_campo (string p_campo, datawindow p_dw, boolean p_rellenar)
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
		campo = p_rte.inputfieldlocate(next!)
		lineaactual = nuevalinea
		nuevalinea = p_rte.selectedline()
		posactual = posnew
		posnew = p_rte.selectedstart()
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
cod_plant=p_dwplant.getitemstring(p_dwplant.getrow(),'cod_plant')
p_dwcampos.reset()
if isnull(cod_plant) then
	f_sel_rtf(p_rte)
	p_rte.clearall()
else
	blob texto
	string str
	sqlca.autocommit=true
	selectblob plantilla into :texto from modulos_vent_plant
	where cod_plant=:cod_plant;
	sqlca.autocommit=false
	str=string(texto)
	if isnull(str) then str=''
	if f_pega_a_rtf(p_rte,str,3)>0 then f_lee_campos(p_rte,p_dwcampos)
end if

end subroutine

public subroutine f_refrescar ();if rb_window.checked then rb_window.triggerevent(clicked!)
if rb_allwindow.checked then rb_allwindow.triggerevent(clicked!)
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

on w_plant_rtf.create
this.st_7=create st_7
this.rb_allwindow=create rb_allwindow
this.rb_window=create rb_window
this.tab_1=create tab_1
this.gb_2=create gb_2
this.Control[]={this.st_7,&
this.rb_allwindow,&
this.rb_window,&
this.tab_1,&
this.gb_2}
end on

on w_plant_rtf.destroy
destroy(this.st_7)
destroy(this.rb_allwindow)
destroy(this.rb_window)
destroy(this.tab_1)
destroy(this.gb_2)
end on

event open;i_st=message.powerobjectparm
string descrip
if g_motor='postgres' then
	select 
	 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
	 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof
	 into :descrip  from profe where codprof=:i_st.c_prof;
else
	select 
	 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
	 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof
	 into :descrip  from profe where codprof=:i_st.c_prof;
end if
title='Plantillas del Profesional: '+upper(descrip)
choose case i_st.ventana
	case 'QX'
		i_ventana='Salas Quirúrgicas'
		rb_window.checked=true
	case 'CEXT'
		i_ventana='Consulta Externa'
		rb_window.checked=true
	case 'ODON'
		i_ventana='Odontología'
		rb_window.checked=true
	case 'RGL'
		i_ventana='Respuesta a Glosas'
		rb_window.Checked = TRUE
	CASE 'APDX'
		i_ventana=i_st.codplantilla
		i_st.ventana=i_st.c_otro
		rb_window.Checked = TRUE
	CASE  'QRS' 	
		i_ventana='Quejas y Reclamos'
		rb_window.Checked = TRUE		
	CASE ELSE
		i_ventana=i_st.ventana
end choose
rb_window.text='Para la Ventana: '+i_ventana
tab_1.tp_1.dw_plant.retrieve(i_st.ventana,i_st.c_prof)
tab_1.tp_2.dw_newplant.retrieve(i_st.ventana,i_st.c_prof)
rb_window.triggerevent(clicked!)
end event

type st_7 from statictext within w_plant_rtf
integer x = 1083
integer y = 140
integer width = 3118
integer height = 72
integer textsize = -8
integer weight = 400
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

type rb_allwindow from radiobutton within w_plant_rtf
integer x = 1390
integer y = 48
integer width = 649
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Para Todas las Ventanas"
end type

event clicked;tab_1.tp_1.dw_plant.retrieve(i_st.ventana,i_st.c_prof)
tab_1.tp_2.dw_newplant.retrieve(i_st.ventana,i_st.c_prof)
tab_1.tp_1.dw_plant.setfilter('')
tab_1.tp_2.dw_newplant.setfilter('')
tab_1.tp_1.dw_plant.filter()
tab_1.tp_2.dw_newplant.filter()
st_7.text='Plantillas que el profesional puede ver en todas las ventanas'

end event

type rb_window from radiobutton within w_plant_rtf
integer x = 32
integer y = 48
integer width = 1294
integer height = 56
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Para la Ventana:"
boolean checked = true
end type

event clicked;tab_1.tp_1.dw_plant.setfilter('todas_vent="0" and cod_ventana="'+i_st.ventana+'"')
tab_1.tp_2.dw_newplant.setfilter('todas_vent="0" and cod_ventana="'+i_st.ventana+'"')
tab_1.tp_1.dw_plant.filter()
tab_1.tp_2.dw_newplant.filter()
tab_1.tp_1.dw_plant.retrieve(i_st.ventana,i_st.c_prof)
tab_1.tp_2.dw_newplant.retrieve(i_st.ventana,i_st.c_prof)
st_7.text='Plantillas que solo se utilizan en la ventana de '+i_ventana

end event

type tab_1 from tab within w_plant_rtf
integer x = 5
integer y = 128
integer width = 4210
integer height = 2256
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4174
integer height = 2128
long backcolor = 67108864
string text = "Seleccionar"
long tabtextcolor = 33554432
string picturename = "rep.ico"
long picturemaskcolor = 536870912
string powertiptext = "Seleccionar y llevar datos"
pb_8 pb_8
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
st_3 st_3
st_2 st_2
st_1 st_1
dw_campo dw_campo
dw_plant dw_plant
gb_1 gb_1
rte_1 rte_1
end type

on tp_1.create
this.pb_8=create pb_8
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_1=create pb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_campo=create dw_campo
this.dw_plant=create dw_plant
this.gb_1=create gb_1
this.rte_1=create rte_1
this.Control[]={this.pb_8,&
this.rb_2,&
this.rb_1,&
this.pb_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_campo,&
this.dw_plant,&
this.gb_1,&
this.rte_1}
end on

on tp_1.destroy
destroy(this.pb_8)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_campo)
destroy(this.dw_plant)
destroy(this.gb_1)
destroy(this.rte_1)
end on

type pb_8 from picturebutton within tp_1
integer x = 315
integer y = 732
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
string picturename = "puerta.gif"
alignment htextalign = left!
string powertiptext = "Salir y Cancelar"
end type

event clicked;close(f_vent_padre(this))
end event

type rb_2 from radiobutton within tp_1
integer x = 530
integer y = 800
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

type rb_1 from radiobutton within tp_1
integer x = 535
integer y = 740
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

type pb_1 from picturebutton within tp_1
integer x = 951
integer y = 728
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
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Llevar datos"
end type

event clicked;dw_campo.accepttext()
if rb_1.checked then i_st.rte.selecttext(999999,999999,0,0)
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
	i_st.rte.pastertf(rte_1.copyrtf(false,detail!))
end if
close(f_vent_padre(this))

end event

type st_3 from statictext within tp_1
integer x = 2085
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

type st_2 from statictext within tp_1
integer x = 18
integer y = 8
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

type st_1 from statictext within tp_1
integer x = 9
integer y = 824
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

type dw_campo from datawindow within tp_1
integer x = 2057
integer y = 52
integer width = 1595
integer height = 808
integer taborder = 20
string title = "none"
string dataobject = "dw_reemp_campo_rtf"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;string campo,selec
campo=getitemstring(row,'nombre')
rte_1.InputFieldChangeData ( campo, data )

end event

type dw_plant from datawindow within tp_1
integer x = 18
integer y = 60
integer width = 1984
integer height = 632
integer taborder = 10
string title = "none"
string dataobject = "dw_plant_vent"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
modify('nombre_plant.width=864')
object.cod_plant.edit.displayonly=true
object.nombre_plant.edit.displayonly=true
object.todas_vent.protect=1
object.todos_prof.protect=1
object.codprof.protect=1
end event

event rowfocuschanged;f_sel_rtf(rte_1)
rte_1.clearall()
f_rowfocuschanged(this,rte_1,dw_campo)

end event

event retrievestart;reset()
dw_campo.reset()
f_sel_rtf(rte_1)
rte_1.clearall()
end event

type gb_1 from groupbox within tp_1
integer x = 498
integer y = 684
integer width = 613
integer height = 184
integer taborder = 30
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

type rte_1 from richtextedit within tp_1
integer x = 9
integer y = 876
integer width = 3657
integer height = 1224
integer taborder = 40
integer textsize = -10
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
boolean init_inputfieldsvisible = true
boolean init_toolbar = true
long init_leftmargin = 2000
long init_rightmargin = 2000
borderstyle borderstyle = stylelowered!
end type

event key;	IF keyflags = 2 THEN
		if key=keyv! then return 1
	end if
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4174
integer height = 2128
long backcolor = 67108864
string text = "Creación / Edición"
long tabtextcolor = 33554432
string picturename = "editar.ico"
long picturemaskcolor = 536870912
string powertiptext = "Crear Nuevas Plantillas o Editar las ya existentes"
st_6 st_6
st_5 st_5
st_4 st_4
pb_9 pb_9
pb_7 pb_7
pb_6 pb_6
pb_save pb_save
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
rte_2 rte_2
dw_newcampo dw_newcampo
dw_newplant dw_newplant
end type

on tp_2.create
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.pb_9=create pb_9
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_save=create pb_save
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.rte_2=create rte_2
this.dw_newcampo=create dw_newcampo
this.dw_newplant=create dw_newplant
this.Control[]={this.st_6,&
this.st_5,&
this.st_4,&
this.pb_9,&
this.pb_7,&
this.pb_6,&
this.pb_save,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.rte_2,&
this.dw_newcampo,&
this.dw_newplant}
end on

on tp_2.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.pb_9)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_save)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.rte_2)
destroy(this.dw_newcampo)
destroy(this.dw_newplant)
end on

type st_6 from statictext within tp_2
integer x = 27
integer y = 708
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

type st_5 from statictext within tp_2
integer x = 2935
integer y = 4
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

type st_4 from statictext within tp_2
integer x = 27
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

type pb_9 from picturebutton within tp_2
integer x = 2674
integer y = 500
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
string picturename = "puerta.gif"
alignment htextalign = left!
string powertiptext = "Salir y Cancelar"
end type

event clicked;close(f_vent_padre(this))
end event

type pb_7 from picturebutton within tp_2
integer x = 2674
integer y = 212
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

type pb_6 from picturebutton within tp_2
integer x = 2674
integer y = 76
integer width = 146
integer height = 128
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

event clicked;long donde,j

donde=dw_newplant.insertrow(0)
dw_newplant.setitem(donde,'codprof',i_st.c_prof)
if rb_window.checked then
	dw_newplant.setitem(donde,'cod_ventana',i_st.ventana)
	dw_newplant.setitem(donde,'todas_vent','0')
end if
dw_newplant.scrolltorow(DONDE)
dw_newplant.setfocus()
rte_2.clearall()
end event

type pb_save from picturebutton within tp_2
integer x = 2674
integer y = 356
integer width = 146
integer height = 128
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

event clicked;blob texto
texto=blob(rte_2.copyrtf(false,detail!))
string cod_plant
long ctas

ctas=dw_newplant.getitemnumber(1,'maximo')
if isnull(ctas) then ctas=0
ctas++
dw_newplant.setitem(dw_newplant.getrow(),'cod_plant',i_st.ventana + '_'+string(ctas))
cod_plant=dw_newplant.getitemstring(dw_newplant.getrow(),'cod_plant')
if dw_newplant.update(true,false)=-1 then 
	rollback;
	return
end if
dw_newplant.ResetUpdate()
commit;
if not isnull(texto) and texto<>blob('') then
	sqlca.autocommit=true
	updateblob modulos_vent_plant set plantilla=:texto 
	where cod_plant=:cod_plant;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando campo plantilla",sqlca.sqlerrtext)
		rollback;
		sqlca.autocommit=false
		f_refrescar()
		return
	end if
	sqlca.autocommit=false
end if
f_refrescar()

end event

type pb_4 from picturebutton within tp_2
integer x = 3936
integer y = 348
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
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Insertar campo en Plantilla"
end type

event clicked;dw_newcampo.accepttext()
rte_2.InputFieldInsert ( dw_newcampo.getitemstring(dw_newcampo.getrow(),'nombre'))
end event

type pb_3 from picturebutton within tp_2
integer x = 3936
integer y = 200
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
end event

type pb_2 from picturebutton within tp_2
integer x = 3936
integer y = 64
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
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo campo"
end type

event clicked;dw_newcampo.insertrow(0)

end event

type rte_2 from richtextedit within tp_2
integer x = 18
integer y = 760
integer width = 4059
integer height = 1328
integer taborder = 90
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

event key;	IF keyflags = 2 THEN
		if key=keyv! then return 1
	end if
end event

type dw_newcampo from datawindow within tp_2
integer x = 2921
integer y = 64
integer width = 997
integer height = 656
integer taborder = 50
string title = "none"
string dataobject = "dw_campo_plant_rtf"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

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

event doubleclicked;if dwo.name='nombre' then pb_4.triggerevent(clicked!)
end event

type dw_newplant from datawindow within tp_2
integer x = 23
integer y = 68
integer width = 2615
integer height = 620
integer taborder = 10
string title = "none"
string dataobject = "dw_plant_vent"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
modify('nombre_plant.edit.displayonly=no')
end event

event rowfocuschanged;f_rowfocuschanged(this,rte_2,dw_newcampo)
end event

event retrievestart;reset()
dw_newcampo.reset()
f_sel_rtf(rte_2)
rte_2.clearall()
end event

type gb_2 from groupbox within w_plant_rtf
integer x = 9
integer width = 4192
integer height = 116
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo de Plantilla"
end type

