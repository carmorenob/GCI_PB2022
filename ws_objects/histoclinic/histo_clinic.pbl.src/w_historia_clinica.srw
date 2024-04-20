$PBExportHeader$w_historia_clinica.srw
forward
global type w_historia_clinica from window
end type
type cb_1 from commandbutton within w_historia_clinica
end type
type dw_2 from datawindow within w_historia_clinica
end type
type st_1 from statictext within w_historia_clinica
end type
type tab_1 from tab within w_historia_clinica
end type
type tabpage_1 from userobject within tab_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type dw_4 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_4 cb_4
cb_3 cb_3
dw_4 dw_4
end type
type tabpage_2 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_3 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_5 dw_5
end type
type tab_1 from tab within w_historia_clinica
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type dw_1 from datawindow within w_historia_clinica
end type
type gb_1 from groupbox within w_historia_clinica
end type
end forward

global type w_historia_clinica from window
integer width = 3515
integer height = 1952
boolean titlebar = true
string title = "Administración del Archivo Clínico"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "hc.ico"
event cargar ( )
cb_1 cb_1
dw_2 dw_2
st_1 st_1
tab_1 tab_1
dw_1 dw_1
gb_1 gb_1
end type
global w_historia_clinica w_historia_clinica

event cargar();dw_2.settransobject(sqlca)
dw_2.insertrow(0)
dw_2.setitem(1,1,today())
dw_2.setitem(1,2,"1")
dw_1.dataobject="dw_historia_consultorio"
dw_1.settransobject(sqlca)
dw_1.retrieve(dw_2.getitemdate(1,1))
tab_1.tabpage_2.dw_3.settransobject(sqlca)
tab_1.tabpage_2.dw_3.retrieve()
tab_1.tabpage_3.dw_5.settransobject(sqlca)
tab_1.tabpage_3.dw_5.retrieve(datetime(today()))
tab_1.tabpage_1.dw_4.settransobject(sqlca)
tab_1.tabpage_1.dw_4.insertrow(0)
tab_1.tabpage_1.dw_4.setitem(1,8,datetime(today()))
tab_1.tabpage_1.dw_4.setitem(1,9,datetime(today(),now()))
tab_1.tabpage_1.dw_4.setitem(1,10,datetime(today()))
end event

on w_historia_clinica.create
this.cb_1=create cb_1
this.dw_2=create dw_2
this.st_1=create st_1
this.tab_1=create tab_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.dw_2,&
this.st_1,&
this.tab_1,&
this.dw_1,&
this.gb_1}
end on

on w_historia_clinica.destroy
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.tab_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;this.postevent("cargar")
end event

type cb_1 from commandbutton within w_historia_clinica
integer x = 1915
integer y = 72
integer width = 357
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Guardar"
end type

type dw_2 from datawindow within w_historia_clinica
integer x = 645
integer y = 64
integer width = 1285
integer height = 116
integer taborder = 20
string title = "none"
string dataobject = "dw_fecha"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_2.AcceptText ( )

if dw_2.getitemstring(1,2)="1" then
dw_1.dataobject="dw_historia_consultorio"
dw_1.settransobject(sqlca)
dw_1.retrieve(dw_2.getitemdate(1,1))
else
	return
end if
	
end event

type st_1 from statictext within w_historia_clinica
integer x = 123
integer y = 92
integer width = 654
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione el origen"
boolean focusrectangle = false
end type

type tab_1 from tab within w_historia_clinica
integer x = 69
integer y = 732
integer width = 3365
integer height = 1116
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3328
integer height = 1000
long backcolor = 67108864
string text = "Prestamos personales"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_4 cb_4
cb_3 cb_3
dw_4 dw_4
end type

event dragdrop;dw_2.AcceptText ( )
dw_1.retrieve(dw_2.getitemstring(1,1))
end event

on tabpage_1.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_4=create dw_4
this.Control[]={this.cb_4,&
this.cb_3,&
this.dw_4}
end on

on tabpage_1.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_4)
end on

type cb_4 from commandbutton within tabpage_1
integer x = 882
integer y = 860
integer width = 352
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Guardar"
end type

event clicked;long donde,traslado,ultimo
string histor
histor=tab_1.tabpage_1.dw_4.getitemstring(1,1)
donde=tab_1.tabpage_1.dw_4.getrow()
tab_1.tabpage_1.dw_4.setitem(donde,13,'4') //origen
select historiaubica.ntraslado into :traslado from historiaubica where historiaubica.nhistoria=:histor and historiaubica.estado='0';
//		messagebox("ubicacion",sqlca.sqlerrtext)
tab_1.tabpage_1.dw_4.setitem(donde,2,traslado)
SELECT Max(Historiaprestamo.nprestamo) into :ultimo
FROM Historiaprestamo;
ULTIMO++
tab_1.tabpage_1.dw_4.setitem(donde,3,ultimo)
tab_1.tabpage_1.dw_4.setitem(donde,12,"0")
if tab_1.tabpage_1.dw_4.update()<1 then
		rollback;
		return 1
	else
		commit;
		tab_1.tabpage_2.dw_3.retrieve()
end if

end event

type cb_3 from commandbutton within tabpage_1
integer x = 439
integer y = 860
integer width = 352
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Nuevo"
end type

event clicked;tab_1.tabpage_1.dw_4.insertrow(0);


end event

type dw_4 from datawindow within tabpage_1
integer x = 78
integer y = 16
integer width = 3182
integer height = 828
integer taborder = 30
string title = "none"
string dataobject = "dw_prestamo_historia"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long existe,donde,traslado,ultimo
string histor,busca
this.AcceptText ( )
if this.getcolumnname()="nhistoria" then
	busca="nhistoria='"+tab_1.tabpage_1.dw_4.getitemstring(tab_1.tabpage_1.dw_4.getrow(),1)+"' and estado='0'"
	existe=tab_1.tabpage_2.dw_3.find(busca,1,tab_1.tabpage_2.dw_3.rowcount())
	if existe<>0 then
		messagebox("Alerta","La historia clínica esta prestada")
		tab_1.tabpage_2.dw_3.reset()
		return 
	end if
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3328
integer height = 1000
long backcolor = 67108864
string text = "Historias prestadas"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tabpage_2.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_2.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_2
integer x = 27
integer y = 40
integer width = 3269
integer height = 908
integer taborder = 20
string title = "none"
string dataobject = "dw_historiapresta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if this.getcolumnname()="estado" then
	if data = "1" then
		this.setitem(this.getrow(),"estado","1")
		this.accepttext()
		if this.update()=-1 then
			rollback;
			return 1
		else
			commit;
		//tab_1.tabpage_2.dw_3.retrieve()
		end if
	else
		return 1
	end if
else
	this.accepttext()
end if
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3328
integer height = 1000
long backcolor = 67108864
string text = "Entregas pendientes"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_5 dw_5
end type

on tabpage_3.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_3.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_3
integer x = 27
integer y = 40
integer width = 3273
integer height = 844
integer taborder = 30
string title = "none"
string dataobject = "dw_historiapresta_mora"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if this.getcolumnname()="estado" then
	if data = "1" then
		this.setitem(this.getrow(),"estado","1")
		this.accepttext()
		if this.update()=-1 then
			rollback;
			return 1
		else
			commit;
		//tab_1.tabpage_2.dw_3.retrieve()
		end if
	else
		return 1
	end if
else
	this.accepttext()
end if
end event

type dw_1 from datawindow within w_historia_clinica
integer x = 123
integer y = 192
integer width = 3214
integer height = 460
integer taborder = 10
string title = "none"
string dataobject = "dw_historia_consultorio"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long existe,donde,traslado,ultimo
string histor,busca
if data = '1' then
	busca="nhistoria='"+dw_1.getitemstring(dw_1.getrow(),10)+"' and estado='0'"
	existe=tab_1.tabpage_2.dw_3.find(busca,1,tab_1.tabpage_2.dw_3.rowcount())
	
	histor=dw_1.getitemstring(dw_1.getrow(),10)
	if existe=0 then
		donde=tab_1.tabpage_2.dw_3.insertrow(0)
		tab_1.tabpage_2.dw_3.setitem(donde,1,dw_1.getitemstring(dw_1.getrow(),10))
		tab_1.tabpage_2.dw_3.setitem(donde,4,dw_1.getitemstring(dw_1.getrow(),3))
		tab_1.tabpage_2.dw_3.setitem(donde,5,dw_1.getitemstring(dw_1.getrow(),11))
		tab_1.tabpage_2.dw_3.setitem(donde,13,dw_1.getitemstring(dw_1.getrow(),12))
		select historiaubica.ntraslado into :traslado
		from historiaubica 
		where historiaubica.nhistoria=:histor and historiaubica.estado='0';
			//messagebox("ubicacion",sqlca.sqlerrtext)
		tab_1.tabpage_2.dw_3.setitem(donde,2,traslado)
		SELECT Max(Historiaprestamo.nprestamo) into :ultimo
		FROM Historiaprestamo;
		ULTIMO++
		tab_1.tabpage_2.dw_3.setitem(donde,3,ultimo)
		tab_1.tabpage_2.dw_3.setitem(donde,6,"CONSULTA PROGRAMADA")
		tab_1.tabpage_2.dw_3.setitem(donde,7,datetime(today()))
		tab_1.tabpage_2.dw_3.setitem(donde,12,"1")
		tab_1.tabpage_2.dw_3.setitem(donde,11,"0")
		if tab_1.tabpage_2.dw_3.update()<1 then
			rollback;
			return 1
		end if
		if dw_1.update()<1 then
			rollback;
			return 1
		else
			commit;
			this.accepttext()
		end if
	
	else
		return 1
	end if
else
	return 1
end if
end event

type gb_1 from groupbox within w_historia_clinica
integer x = 41
integer y = 12
integer width = 3369
integer height = 672
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitud de Historias Clínicas"
end type

