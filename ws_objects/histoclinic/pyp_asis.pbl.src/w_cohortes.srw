$PBExportHeader$w_cohortes.srw
forward
global type w_cohortes from window
end type
type st_2 from statictext within w_cohortes
end type
type st_1 from statictext within w_cohortes
end type
type pb_save from picturebutton within w_cohortes
end type
type pb_del_trigger from picturebutton within w_cohortes
end type
type pb_new_trigger from picturebutton within w_cohortes
end type
type dw_triggers from uo_datawindow within w_cohortes
end type
type dw_areas from uo_datawindow within w_cohortes
end type
end forward

global type w_cohortes from window
integer width = 4393
integer height = 1844
boolean titlebar = true
string title = "Cohortes"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
st_1 st_1
pb_save pb_save
pb_del_trigger pb_del_trigger
pb_new_trigger pb_new_trigger
dw_triggers dw_triggers
dw_areas dw_areas
end type
global w_cohortes w_cohortes

type variables
boolean ibn_cambio
datawindowchild dw_cpgc
end variables

forward prototypes
public function integer wf_save ()
end prototypes

public function integer wf_save ();long ll_id2,j
	 
select coalesce(max(id_trigger),0) +1 into :ll_id2 from pm_cohortes_triggers;
if sqlca.sqlcode<0 then
	messagebox("Error de SQL","Error consultando pm_cohortes_triggers: "+sqlca.sqlerrtext)
	return -1
end if 

for j=1 to dw_triggers.rowcount()
	if isnull(dw_triggers.getitemnumber(j,'id_trigger')) then
		dw_triggers.setitem(j,'id_trigger',ll_id2)
		ll_id2 ++
	end if
next

	
if dw_triggers.update(TRUE,FALSE)=-1 then
	Return -1
end if


commit;

dw_triggers.resetUpdate()

ibn_cambio=false
return 1
end function

on w_cohortes.create
this.st_2=create st_2
this.st_1=create st_1
this.pb_save=create pb_save
this.pb_del_trigger=create pb_del_trigger
this.pb_new_trigger=create pb_new_trigger
this.dw_triggers=create dw_triggers
this.dw_areas=create dw_areas
this.Control[]={this.st_2,&
this.st_1,&
this.pb_save,&
this.pb_del_trigger,&
this.pb_new_trigger,&
this.dw_triggers,&
this.dw_areas}
end on

on w_cohortes.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_save)
destroy(this.pb_del_trigger)
destroy(this.pb_new_trigger)
destroy(this.dw_triggers)
destroy(this.dw_areas)
end on

event open;dw_areas.settransobject(sqlca)
dw_triggers.settransobject(sqlca)

dw_areas.retrieve()
end event

type st_2 from statictext within w_cohortes
integer x = 69
integer y = 840
integer width = 1719
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos o diagnósticos que crean el Cohorte al paciente:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cohortes
integer x = 64
integer width = 425
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Áreas Cohortes"
boolean focusrectangle = false
end type

type pb_save from picturebutton within w_cohortes
integer x = 2843
integer y = 72
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;wf_save()
end event

type pb_del_trigger from picturebutton within w_cohortes
integer x = 4169
integer y = 1056
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar registro"
end type

event clicked;dw_triggers.deleterow(0)
ibn_cambio=true
end event

type pb_new_trigger from picturebutton within w_cohortes
integer x = 4165
integer y = 912
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Registro"
end type

event clicked;long ll_fila

ll_fila=dw_triggers.insertrow(0)


dw_triggers.setrow(ll_fila)
dw_triggers.setitem(ll_fila,'id_grupoetareo',dw_areas.getitemstring(dw_areas.getrow(),'codgetareo'))

dw_triggers.setfocus()

ibn_cambio=true
end event

type dw_triggers from uo_datawindow within w_cohortes
integer x = 59
integer y = 908
integer width = 4082
integer taborder = 20
string dataobject = "dw_pm_cohortes_triggers"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event itemchanged;call super::itemchanged;ibn_cambio=true
dw_cpgc.retrieve(getitemstring(getrow(),"codproced"))
end event

event doubleclicked;call super::doubleclicked;choose case dwo.name
	case 'cod_rips'
		if getcolumnname()<>dwo.name then return
		st_edadsexo st_es
		st_es.saltar_validacion=true
		openwithparm(w_busca_diag,st_es)
		st_diag st_diag
		st_diag=message.powerobjectparm
		if not isvalid(st_diag) then return
		setitem(row,'id_diag',st_diag.codgeral)
		setitem(row,'cod_rips',st_diag.codrip)
		setitem(row,'desdiag',st_diag.descripcion)

	case 'cod_cups'
		if getcolumnname()<>dwo.name then return
		
		st_proced st_pr
		open(w_busca_proc)

		st_proced lst_proc
		lst_proc=message.powerobjectparm
		
		if not isvalid(lst_proc) then return
		
		setitem(row,'codproced',lst_proc.interno)
		setitem(row,'descripcion',lst_proc.descrip) 
		setitem(row,'cod_cups',lst_proc.cups)
		
end choose
accepttext()
end event

event constructor;call super::constructor;dw_triggers.getchild('consecampo',dw_cpgc)
dw_cpgc.settransobject(sqlca)

end event

event rowfocuschanged;call super::rowfocuschanged;dw_cpgc.retrieve(getitemstring(getrow(),"codproced"))
end event

event retrieveend;call super::retrieveend;if rowcount()>0 then
	dw_cpgc.retrieve(getitemstring(getrow(),"codproced"))
end if
end event

type dw_areas from uo_datawindow within w_cohortes
integer x = 55
integer y = 68
integer width = 2770
integer taborder = 10
string dataobject = "dw_pm_cohortes_areas"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event updateend;call super::updateend;if rowsinserted>0 then 
	
	
end if
end event

event itemchanged;call super::itemchanged;ibn_cambio=true
end event

event rowfocuschanged;call super::rowfocuschanged;IF CURRENTROW<=0 then return

dw_triggers.retrieve(getitemstring(currentrow,'codgetareo'))
end event

