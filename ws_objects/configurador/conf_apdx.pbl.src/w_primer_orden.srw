$PBExportHeader$w_primer_orden.srw
forward
global type w_primer_orden from window
end type
type tab_1 from tab within w_primer_orden
end type
type p1 from userobject within tab_1
end type
type dw_1 from datawindow within p1
end type
type p1 from userobject within tab_1
dw_1 dw_1
end type
type tab_1 from tab within w_primer_orden
p1 p1
end type
type pb_3 from picturebutton within w_primer_orden
end type
type pb_2 from picturebutton within w_primer_orden
end type
type pb_1 from picturebutton within w_primer_orden
end type
type st_1 from statictext within w_primer_orden
end type
type ddlb_1 from dropdownlistbox within w_primer_orden
end type
end forward

global type w_primer_orden from window
integer width = 3365
integer height = 1380
boolean titlebar = true
string title = "Procedimientos a cargar en primera Orden de Servicios"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_prio.ico"
boolean center = true
tab_1 tab_1
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_1 st_1
ddlb_1 ddlb_1
end type
global w_primer_orden w_primer_orden

type variables
string i_tingres=''
datawindowchild dw_pl
end variables

on w_primer_orden.create
this.tab_1=create tab_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.Control[]={this.tab_1,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.ddlb_1}
end on

on w_primer_orden.destroy
destroy(this.tab_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.ddlb_1)
end on

event open;if i_tingres='' then return
tab_1.p1.dw_1.setitem(tab_1.p1.dw_1.insertrow(0),'tingre',i_tingres)
tab_1.p1.dw_1.scrolltorow(tab_1.p1.dw_1.rowcount())
tab_1.p1.dw_1.setfocus()
end event

type tab_1 from tab within w_primer_orden
integer x = 32
integer y = 148
integer width = 3287
integer height = 1056
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
p1 p1
end type

on tab_1.create
this.p1=create p1
this.Control[]={this.p1}
end on

on tab_1.destroy
destroy(this.p1)
end on

type p1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3250
integer height = 928
long backcolor = 67108864
string text = "Productos"
long tabtextcolor = 33554432
string picturename = "resultados.ico"
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on p1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on p1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within p1
integer x = 23
integer y = 16
integer width = 3191
integer height = 856
integer taborder = 80
string title = "none"
string dataobject = "dw_primer_orden"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if this.getcolumnname()='tipo' then
	string snulo
	setnull(snulo)
	this.setitem(this.getrow(),'proced',snulo)
	this.setitem(this.getrow(),'descripcion',snulo)
	this.accepttext()
end if
if this.getcolumnname()='proced' then
	string veri,pr
	pr=this.gettext()
	if pr='' then return
	setnull(veri)
	if this.getitemstring(this.getrow(),'tipo')='P' then
		select descripcion into :veri from proced where codproced=:pr and estado='1';
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo Proced",sqlca.sqlerrtext)
			return 1
		end if
		this.setitem(this.getrow(),'descripcion',veri)
	else
		select medicamento into :veri from medicamentos where c_medica=:pr;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo Medicamentos",sqlca.sqlerrtext)
			return 1
		end if
		this.setitem(this.getrow(),'medicamento',veri)
	end if
	if isnull(veri) then return 1
	this.accepttext()
end if
this.accepttext()
end event

event constructor;this.settransobject(sqlca)
tab_1.p1.dw_1.getchild('codplantilla',dw_pl)
dw_pl.settransobject(sqlca)

end event

event doubleclicked;if getcolumnname()='cod_cups' then
	if getitemstring(getrow(),'tipo')='P' then
		open(w_busca_proc)
		triggerevent(itemchanged!)
	else
		open(w_busca_med)
		st_med st
		st=message.powerobjectparm
		if not isvalid(st) then return
		if st.cmedica<>'' then
			setitem(getrow(),'proced',st.cmedica)
			setitem(getrow(),'cod_cups',st.cmedica)
			triggerevent(itemchanged!)
		end if
	end if
end if
end event

type pb_3 from picturebutton within w_primer_orden
string tag = "&Guardar"
integer x = 2016
integer y = 24
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if tab_1.p1.dw_1.update()=-1 then
	rollback;
	ddlb_1.triggerevent(selectionchanged!)
else
	commit;
end if
end event

type pb_2 from picturebutton within w_primer_orden
string tag = "&Borrar"
integer x = 1833
integer y = 24
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;tab_1.p1.dw_1.deleterow(0)
if tab_1.p1.dw_1.update()=-1 then
	rollback;
	ddlb_1.triggerevent(selectionchanged!)
else
	commit;
end if
end event

type pb_1 from picturebutton within w_primer_orden
string tag = "&Nuevo"
integer x = 1650
integer y = 24
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
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;if i_tingres='' then return
tab_1.p1.dw_1.setitem(tab_1.p1.dw_1.insertrow(0),'tingre',i_tingres)
tab_1.p1.dw_1.scrolltorow(tab_1.p1.dw_1.rowcount())
tab_1.p1.dw_1.setfocus()
end event

type st_1 from statictext within w_primer_orden
integer x = 37
integer y = 32
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Ingreso:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_primer_orden
integer x = 375
integer y = 24
integer width = 768
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"URGENCIAS","HOSPITALIZACION","AMBULATORIO","SALAS QUIRURGICAS"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index
	case 1
		i_tingres='2'
	case 2
		i_tingres='3'
	case 3
		i_tingres='4'
	case 4
		i_tingres='5'
end choose
tab_1.p1.dw_1.retrieve(i_tingres)
dw_pl.setfilter("codtingre='"+i_tingres+"'")
dw_pl.filter()
end event

