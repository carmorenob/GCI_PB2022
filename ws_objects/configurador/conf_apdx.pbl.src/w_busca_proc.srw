$PBExportHeader$w_busca_proc.srw
forward
global type w_busca_proc from window
end type
type st_3 from statictext within w_busca_proc
end type
type pb_1 from picturebutton within w_busca_proc
end type
type pb_2 from picturebutton within w_busca_proc
end type
type cbx_1 from checkbox within w_busca_proc
end type
type st_2 from statictext within w_busca_proc
end type
type st_1 from statictext within w_busca_proc
end type
type sle_1 from singlelineedit within w_busca_proc
end type
type dw_1 from datawindow within w_busca_proc
end type
type dw_2 from datawindow within w_busca_proc
end type
end forward

global type w_busca_proc from window
integer x = 201
integer y = 200
integer width = 3575
integer height = 1868
boolean titlebar = true
string title = "Buscar Procedimento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Query5!"
string pointer = "Arrow!"
boolean center = true
event teclear pbm_syskeydown
event filtrar pbm_keyup
st_3 st_3
pb_1 pb_1
pb_2 pb_2
cbx_1 cbx_1
st_2 st_2
st_1 st_1
sle_1 sle_1
dw_1 dw_1
dw_2 dw_2
end type
global w_busca_proc w_busca_proc

type variables
datawindowchild capitul,grup,secc
st_proced stpr
string version
end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();if cbx_1.checked and dw_1.getitemstring(1,"cd_grupo")<>"" then
	dw_2.setfilter("(lower(descripcion) like '"+lower(trim(sle_1.text))+"%') and cd_grupo = '" + dw_1.getitemstring(1,"cd_grupo")+" '")
else
	dw_2.setfilter("lower(descripcion) like '"+lower(trim(sle_1.text))+"%'")
end if
dw_2.filter()
dw_2.sort()
st_1.text=string(dw_2.rowcount())+' Registros'
end subroutine

on w_busca_proc.create
this.st_3=create st_3
this.pb_1=create pb_1
this.pb_2=create pb_2
this.cbx_1=create cbx_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.dw_1=create dw_1
this.dw_2=create dw_2
this.Control[]={this.st_3,&
this.pb_1,&
this.pb_2,&
this.cbx_1,&
this.st_2,&
this.st_1,&
this.sle_1,&
this.dw_1,&
this.dw_2}
end on

on w_busca_proc.destroy
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.dw_1)
destroy(this.dw_2)
end on

event open;string des_vers
//VERIFICAR VERSION ACTIVA CUPS
datetime ahora

ahora=datetime(today())
select cod_version,des_version into :version,:des_vers from pm_cups_version where valido_hasta>=:ahora;
if isnull(version) then 
	messagebox("Atención","No existe una versión de Cups activa")
	return 
end if
st_3.text='Versión CUPS: '+ des_vers
dw_1.settransobject(sqlca)
dw_1.GetChild('cd_capitulo', capitul)
dw_1.GetChild('cd_grupo', grup)
dw_1.GetChild('cd_seccion', secc)
secc.settransobject(sqlca)
capitul.settransobject(sqlca)
grup.settransobject(sqlca)
secc.retrieve(version)
capitul.retrieve(version,'%')
grup.retrieve(version,'%')

dw_1.insertrow(0)
capitul.reset()
dw_2.retrieve(version)
grup.reset()




end event

type st_3 from statictext within w_busca_proc
integer x = 773
integer y = 540
integer width = 1435
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_busca_proc
integer x = 1883
integer y = 1612
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
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;dw_2.triggerevent(doubleclicked!)
end event

type pb_2 from picturebutton within w_busca_proc
integer x = 2057
integer y = 1612
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
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cerrar Ventana"
end type

event clicked;closewithreturn(parent,'')
end event

type cbx_1 from checkbox within w_busca_proc
integer x = 2011
integer y = 364
integer width = 786
integer height = 80
string dragicon = "none!"
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tener en cuenta para filtrar"
end type

event clicked;filtrar()
end event

type st_2 from statictext within w_busca_proc
integer x = 73
integer y = 560
integer width = 645
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por &Descripción:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_busca_proc
integer x = 2382
integer y = 612
integer width = 608
integer height = 76
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_busca_proc
event teclear pbm_keyup
integer x = 73
integer y = 620
integer width = 2149
integer height = 72
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
textcase textcase = upper!
integer accelerator = 100
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

type dw_1 from datawindow within w_busca_proc
integer x = 50
integer y = 28
integer width = 2176
integer height = 496
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_capitulo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
choose case this.getcolumnname()
	case "cd_seccion"
		this.setitem(1,"cd_capitulo","")
		capitul.retrieve(version,this.getitemstring(1,'cd_seccion'))
		this.setitem(1,'cd_grupo','')
		grup.reset()
		if cbx_1.checked then filtrar()
	case "cd_capitulo"
		this.setitem(1,'cd_grupo','')
		grup.retrieve(version,this.getitemstring(1,'cd_capitulo'))
		if cbx_1.checked then filtrar()
	case "cd_grupo"
		if cbx_1.checked then filtrar()
end choose
		
end event

type dw_2 from datawindow within w_busca_proc
integer x = 73
integer y = 704
integer width = 3433
integer height = 884
integer taborder = 30
string dragicon = "none!"
boolean bringtotop = true
string dataobject = "dw_procedimi"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;st_1.text=string(this.rowcount())+' Registros'
end event

event doubleclicked;if getrow()<1 then return
window activesheet
activesheet = w_principal.GetActiveSheet()
IF IsValid(activesheet) THEN
	long fila,fila2
	
	if activesheet.Tag="Configuración Reps Cups" then
		fila2=w_reps_cups.t1.p1.dw_2.find("cod_cups='"+getitemstring(getrow(),"cod_cups")+"'",1,w_reps_cups.t1.p1.dw_2.rowcount())
		if fila2= 0 then
			fila=w_reps_cups.t1.p1.dw_2.insertrow(0)
			fila2=w_reps_cups.dw_1.getrow()
			w_reps_cups.t1.p1.dw_2.setitem(fila,'cod_cups',getitemstring(getrow(),1))
			w_reps_cups.t1.p1.dw_2.setitem(fila,'cod_version',version)
			w_reps_cups.t1.p1.dw_2.setitem(fila,'cupsp',getitemstring(getrow(),7))
			w_reps_cups.t1.p1.dw_2.setitem(fila,'descripcion',getitemstring(getrow(),2))
			w_reps_cups.t1.p1.dw_2.setitem(fila,'cod_serv',w_reps_cups.dw_1.getitemstring(fila2,'cod_serv'))
			w_reps_cups.t1.p1.dw_2.scrolltorow(fila)
		else
			w_reps_cups.t1.p1.dw_2.scrolltorow(fila2)
			messagebox("Atención","Este procedimiento ya existe en este servicio")
		end if
	end if		
	if activesheet.Tag="Procedimientos por Especialidad" then
		fila=w_proc_especialidad.dw_2.insertrow(0)
		w_proc_especialidad.dw_2.setitem(fila,2,getitemstring(getrow(),1))
		w_proc_especialidad.dw_2.setitem(fila,3,getitemstring(getrow(),2))
		w_proc_especialidad.dw_2.setitem(fila,'cod_cups',getitemstring(getrow(),7))
		w_proc_especialidad.dw_2.setitem(fila,'cod_version',version)
		w_proc_especialidad.dw_2.setitem(fila,1,w_proc_especialidad.dw_1.getitemstring(1,1))//especialidad
		w_proc_especialidad.dw_2.scrolltorow(fila)
		return
	end if	
	if activesheet.Tag="Procedimientos de Grupos de Citas" then
		fila=w_proc_grupcons.tab_1.tp_1.dw_2.insertrow(0)
		w_proc_grupcons.tab_1.tp_1.dw_2.setitem(fila,2,getitemstring(getrow(),1))
		w_proc_grupcons.tab_1.tp_1.dw_2.setitem(fila,3,getitemstring(getrow(),2))
		w_proc_grupcons.tab_1.tp_1.dw_2.setitem(fila,'cod_cups',getitemstring(getrow(),7))
		w_proc_grupcons.tab_1.tp_1.dw_2.setitem(fila,'cod_version',version)
		w_proc_grupcons.tab_1.tp_1.dw_2.setitem(fila,1,w_proc_grupcons.dw_1.getitemstring(1,1))//grupo de consulta
		w_proc_grupcons.tab_1.tp_1.dw_2.scrolltorow(fila)
		return
	end if
	if activesheet.Tag='Configuración Personalizada Apoyo Dx' then
		fila2=w_grup_clinic.t1.p1.dw_2.find("codproced='"+getitemstring(getrow(),"codproced")+"'",1,w_grup_clinic.t1.p1.dw_2.rowcount())
		if fila2= 0 then
			fila=w_grup_clinic.t1.p1.dw_2.insertrow(0)
			fila2=w_grup_clinic.dw_1.getrow()
			w_grup_clinic.t1.p1.dw_2.setitem(fila,'cod_cups',getitemstring(getrow(),7))
			w_grup_clinic.t1.p1.dw_2.setitem(fila,'cod_version',version)
			w_grup_clinic.t1.p1.dw_2.setitem(fila,'codproced',getitemstring(getrow(),1))
			w_grup_clinic.t1.p1.dw_2.setitem(fila,'descripcion',getitemstring(getrow(),2))
			w_grup_clinic.t1.p1.dw_2.setitem(fila,"codria",getitemstring(getrow(),"rips"))
			w_grup_clinic.t1.p1.dw_2.setitem(fila,'coddoc',w_grup_clinic.dw_1.getitemstring(fila2,4))//docu
			w_grup_clinic.t1.p1.dw_2.setitem(fila,'clugar',w_grup_clinic.dw_1.getitemstring(fila2,'clugar'))//docu
			w_grup_clinic.t1.p1.dw_2.setitem(fila,'tipoimpre',w_grup_clinic.dw_1.getitemstring(fila2,3))//tipo impre
			w_grup_clinic.t1.p1.dw_2.setitem(fila,'codgc',w_grup_clinic.dw_1.getitemnumber(fila2,'codgc'))
		//	w_grup_clinic.t1.p1.dw_2.setitem(fila,'tipo_proced',getitemstring(getrow(),"tipoproc"))
			w_grup_clinic.t1.p1.dw_2.scrolltorow(fila)
		else
			w_grup_clinic.t1.p1.dw_2.scrolltorow(fila2)
			messagebox("Atención","Este procedimiento ya existe en este grupo")
		end if
		return
	END IF
	if activesheet.Tag='Procedimientos a cargar en primera Orden de Servicios' then
		fila=w_primer_orden.tab_1.p1.dw_1.getrow()
		w_primer_orden.tab_1.p1.dw_1.setitem(fila,'cod_cups',getitemstring(getrow(),7))
		w_primer_orden.tab_1.p1.dw_1.setitem(fila,'cod_version',version)
		w_primer_orden.tab_1.p1.dw_1.setitem(fila,'descripcion',getitemstring(getrow(),2))
		w_primer_orden.tab_1.p1.dw_1.setitem(fila,'proced',getitemstring(getrow(),1))		
		w_primer_orden.tab_1.p1.dw_1.scrolltorow(fila)		
	end if

end if
stpr.interno=getitemstring(getrow(),1)
stpr.cups=getitemstring(getrow(),7)
stpr.version=version
stpr.descrip=getitemstring(getrow(),2)
closewithreturn(parent,stpr)
end event

event constructor;dw_2.settransobject(SQLCA)
end event

