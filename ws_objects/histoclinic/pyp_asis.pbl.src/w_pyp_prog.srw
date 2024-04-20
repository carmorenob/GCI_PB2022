$PBExportHeader$w_pyp_prog.srw
forward
global type w_pyp_prog from window
end type
type pb_2 from picturebutton within w_pyp_prog
end type
type pb_1 from picturebutton within w_pyp_prog
end type
type dw_done from datawindow within w_pyp_prog
end type
type dw_pend from datawindow within w_pyp_prog
end type
type st_1 from statictext within w_pyp_prog
end type
type dw_at from datawindow within w_pyp_prog
end type
type dw_sub from datawindow within w_pyp_prog
end type
type dw_p from datawindow within w_pyp_prog
end type
type dw_act from datawindow within w_pyp_prog
end type
type st_2 from statictext within w_pyp_prog
end type
type st_3 from statictext within w_pyp_prog
end type
type st_4 from statictext within w_pyp_prog
end type
type gb_1 from groupbox within w_pyp_prog
end type
end forward

global type w_pyp_prog from window
string tag = "                                                                                                                                               "
integer width = 3653
integer height = 2000
boolean titlebar = true
string title = "Promoción y Prevención - Programas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "diagnostico.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_done dw_done
dw_pend dw_pend
st_1 st_1
dw_at dw_at
dw_sub dw_sub
dw_p dw_p
dw_act dw_act
st_2 st_2
st_3 st_3
st_4 st_4
gb_1 gb_1
end type
global w_pyp_prog w_pyp_prog

type variables
string prof, espe
dataWindowChild dw_cond

end variables

on w_pyp_prog.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_done=create dw_done
this.dw_pend=create dw_pend
this.st_1=create st_1
this.dw_at=create dw_at
this.dw_sub=create dw_sub
this.dw_p=create dw_p
this.dw_act=create dw_act
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.gb_1=create gb_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_done,&
this.dw_pend,&
this.st_1,&
this.dw_at,&
this.dw_sub,&
this.dw_p,&
this.dw_act,&
this.st_2,&
this.st_3,&
this.st_4,&
this.gb_1}
end on

on w_pyp_prog.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_done)
destroy(this.dw_pend)
destroy(this.st_1)
destroy(this.dw_at)
destroy(this.dw_sub)
destroy(this.dw_p)
destroy(this.dw_act)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.gb_1)
end on

event activate;w_principal.dw_profe.Visible = TRUE
end event

event deactivate;w_principal.dw_profe.Visible = FALSE
end event

event open;dw_act.InsertRow(0)

end event

type pb_2 from picturebutton within w_pyp_prog
integer x = 1897
integer y = 992
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "diagnosticar.gif"
string disabledname = "d_diagnosticar.gif"
alignment htextalign = left!
string powertiptext = "Seleccionar Pacientes con Pendientes"
end type

event clicked;int i,f,j, fila, cantidad, itemacc
string codacc
uo_datastore pend, done

pend = create uo_datastore
done = create uo_datastore
pend.DataObject = 'dw_pyp_pendxprog'
done.DataObject = 'dw_pyp_aplicxprog'
pend.SetTransObject(SQLCA)
done.SetTransObject(SQLCA)
f = dw_sub.GetRow()
for i = 1 to dw_p.RowCount()
	done.Retrieve(dw_p.GetItemString(i,'tipodoc'), dw_p.GetItemString(i,'documento'),dw_sub.GetItemString(f,'codact'),dw_sub.GetItemString(f,'codaret'),dw_sub.GetItemString(f,'codprog'),dw_sub.GetItemString(f,'item'))
	pend.Retrieve(dw_sub.GetItemString(f,'codact'),dw_sub.GetItemString(f,'codaret'),dw_sub.GetItemString(f,'codprog'),dw_sub.GetItemString(f,'item'), dw_p.GetItemNumber(i,'dias'), dw_p.GetItemString(i,'sexo'), dw_p.GetItemString(i,'tipodoc'), dw_p.GetItemString(i,'documento'))

	for j = 1 to pend.RowCount()	
		codacc = pend.GetItemString(j,'cod_prodpyp')
		itemacc = pend.GetItemNumber(j,'accion_item')
		if done.RowCount() = 0 then CONTINUE
		fila = done.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),1,done.RowCount())
		Do While fila > 0 
			cantidad = cantidad + done.GetItemNumber(fila,'cantidad')
			if fila = done.RowCount() then EXIT
			fila = done.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),fila + 1,done.RowCount())
		Loop
		
		if cantidad > 0 and cantidad >= pend.GetItemNumber(j,'cantidad') then
			pend.DeleteRow(j)
		else
			if not isNull(pend.GetItemDateTime(j,'fcondicion')) then
				datetime dt
				long dr
				dt = pend.GetItemDateTime(j,'fcondicion')
				dr = pend.GetItemNumber(j,'duracion')
				if ( dr > 0 and RelativeDate(date(dt),dr) > today() ) or pend.GetItemString(j,'estado') ='0' then
					pend.DeleteRow(j)
				end if
			end if
		end if	
	next
	
	if pend.RowCount() > 0 then
		dw_p.SetItem(i,'selec',1)
	else
		dw_p.SetItem(i,'selec',0)
	end if
next

end event

type pb_1 from picturebutton within w_pyp_prog
integer x = 1897
integer y = 864
integer width = 142
integer height = 124
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Elaborar Nota al Paciente"
end type

event clicked;int f
f = dw_p.Find("selec=1",1,dw_p.RowCount())
if f = 0 then Return
st_notas st_parm
if w_principal.dw_profe.Visible = TRUE then
	st_parm.profe = w_principal.dw_profe.GetItemString(1,1)
elseif w_principal.dw_odprofe.Visible = TRUE then
	st_parm.profe = w_principal.dw_odprofe.GetItemString(1,1)
end if
	
st_parm.Asunto = dw_sub.GetItemString(dw_sub.GetRow(),'descripcion')
st_parm.dw_pac = dw_p
st_parm.ventana='PYP'
openWithParm(w_notaspac,st_parm)

end event

type dw_done from datawindow within w_pyp_prog
integer x = 1998
integer y = 1364
integer width = 1513
integer height = 432
integer taborder = 60
string title = "none"
string dataobject = "dw_pyp_aplicxprog"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type dw_pend from datawindow within w_pyp_prog
integer x = 2080
integer y = 852
integer width = 1435
integer height = 420
integer taborder = 50
string title = "none"
string dataobject = "dw_pyp_pendxprog"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event retrieverow;integer fila, cantidad=0, itemacc
string codacc

codacc = GetItemString(row,'cod_prodpyp')
itemacc = GetItemNumber(row,'accion_item')
if dw_done.RowCount() = 0 then Return
fila = dw_done.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),1,dw_done.RowCount())
Do While fila > 0 
	cantidad = cantidad + dw_done.GetItemNumber(fila,'cantidad')
	if fila = dw_done.RowCount() then EXIT
	fila = dw_done.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),fila + 1,dw_done.RowCount())
Loop

if cantidad > 0 and cantidad >= GetItemNumber(row,'cantidad') then
	DeleteRow(row)
else
	if not isNull(GetItemDateTime(row,'fcondicion')) then
		datetime dt
		long dr
		dt = GetItemDateTime(row,'fcondicion')
		dr = GetItemNumber(row,'duracion')
		if ( dr > 0 and RelativeDate(date(dt),dr) > today() ) or GetItemString(row,'estado') ='0' then
			DeleteRow(row)
		end if
	end if
end if

end event

type st_1 from statictext within w_pyp_prog
integer x = 64
integer y = 12
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actividades"
boolean focusrectangle = false
end type

type dw_at from datawindow within w_pyp_prog
integer x = 55
integer y = 156
integer width = 1490
integer height = 584
integer taborder = 20
string title = "none"
string dataobject = "dw_aret_progs"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event rowfocuschanged;//dw_prog.Reset()
//if RowCount() > 0 and currentRow > 0 then
//	dw_prog.Retrieve(GetItemString(GetRow(),'codact'),GetItemString(GetRow(),'codat'))
//end if
dw_sub.Reset()
if RowCount() > 0 and currentrow > 0 then
	dw_sub.Retrieve(GetItemString(GetRow(),'codact'),GetItemString(GetRow(),'codat'),GetItemString(GetRow(),'codprog'))
end if

end event

type dw_sub from datawindow within w_pyp_prog
integer x = 1568
integer y = 156
integer width = 1998
integer height = 584
integer taborder = 30
string title = "none"
string dataobject = "dw_selprogramas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event rowfocuschanged;dw_p.Reset()
if RowCount() = 0 or currentrow = 0 then Return
int f, ano, dias
date hoy, d1, d2
f = GetRow()
hoy = today()
ano = GetItemNumber(f,'edadf')/365
if ano > 0 then
	dias = mod(GetItemNumber(f,'edadf'),365)
	d1 = date( year(hoy) - ano, month(hoy), day(hoy) )
	do while string(d1,'yyyy-mm-dd') = '1900-01-01'
		hoy = RelativeDate(hoy,-1)
		d1 = date( year(hoy) - ano, month(hoy), day(hoy) )
	Loop
	if dias > 0 then
		d1 = RelativeDate(d1,-1 * dias)
	end if
else
	d1 = RelativeDate(hoy,-1 * GetItemNumber(f,'edadf'))
end if
hoy = today()
ano = GetItemNumber(f,'edadi')/365
if ano > 0 then
	dias = mod(GetItemNumber(f,'edadi'),365)
	d2 = date( year(hoy) - ano, month(hoy), day(hoy) )
	do while string(d1,'yyyy-mm-dd') = '1900-01-01'
		hoy = RelativeDate(hoy,-1)
		d2 = date( year(hoy) - ano, month(hoy), day(hoy) )
	Loop
	if dias > 0 then
		d2 = RelativeDate(d1,-1 * dias)
	end if
else
	d2 = RelativeDate(hoy,-1 * GetItemNumber(f,'edadi'))
end if

dw_p.Retrieve(GetItemString(f,'codact'),GetItemString(f,'codaret'),GetItemString(f,'codprog'),GetItemString(f,'item'),DateTime(d1),Datetime(d2))


end event

type dw_p from datawindow within w_pyp_prog
integer x = 46
integer y = 852
integer width = 1819
integer height = 944
integer taborder = 40
string title = "none"
string dataobject = "dw_pyp_pacxprog"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event retrieverow;//integer fila, cantidad=0, itemacc
//string codacc
//
//codacc = GetItemString(row,'cod_prodpyp')
//itemacc = GetItemNumber(row,'accion_item')
//if dw_a.RowCount() = 0 then Return
//fila = dw_a.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),1,dw_a.RowCount())
//Do While fila > 0 
//	cantidad = cantidad + dw_a.GetItemNumber(fila,'cantidad')
//	if fila = dw_a.RowCount() then EXIT
//	fila = dw_a.Find("cod_prodpyp='"+codacc+"' and accion_item="+string(itemacc),fila + 1,dw_a.RowCount())
//Loop
//
//if cantidad > 0 and cantidad >= GetItemNumber(row,'cantidad') then
//	DeleteRow(row)
//else
//	if not isNull(GetItemDateTime(row,'fcondicion')) then
//		datetime dt
//		long dr
//		dt = GetItemDateTime(row,'fcondicion')
//		dr = GetItemNumber(row,'duracion')
//		if ( dr > 0 and RelativeDate(date(dt),dr) > today() ) or GetItemString(row,'estado') ='0' then
//			DeleteRow(row)
//		end if
//	end if
//end if
//
end event

event clicked;int i
if string(dwo.name) = "t_4" then
	if describe("t_4.Text") = 'Sel' then
		Modify("t_4.Text='Des' t_4.Background.color='15780518'")
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
	else
		Modify("t_4.Text='Sel' t_4.background.color='12639424'")
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
	end if
end if

if string(dwo.name) = 'compute_1' then
	SetRow(row)
end if

end event

event rowfocuschanged;dw_done.Reset()
dw_pend.Reset()
if currentrow = 0 or RowCount() = 0 then Return
int f
f = dw_sub.GetRow()
dw_done.Retrieve(GetItemString(GetRow(),'tipodoc'), GetItemString(GetRow(),'documento'),dw_sub.GetItemString(f,'codact'),dw_sub.GetItemString(f,'codaret'),dw_sub.GetItemString(f,'codprog'),dw_sub.GetItemString(f,'item'))
dw_pend.Retrieve(dw_sub.GetItemString(f,'codact'),dw_sub.GetItemString(f,'codaret'),dw_sub.GetItemString(f,'codprog'),dw_sub.GetItemString(f,'item'), GetItemNumber(GetRow(),'dias'), GetItemString(GetRow(),'sexo'), GetItemString(GetRow(),'tipodoc'), GetItemString(GetRow(),'documento'))
end event

event buttonclicked;w_principal.dw_1.SetItem(1,'tipodoc',GetItemString(GetRow(),'tipodoc'))
w_principal.dw_1.SetItem(1,'documento',GetItemString(GetRow(),'documento'))
w_principal.dw_1.SetColumn('documento')
w_principal.dw_1.TriggerEvent(itemchanged!)

open(w_notaspac)

end event

type dw_act from datawindow within w_pyp_prog
integer x = 59
integer y = 64
integer width = 1504
integer height = 80
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_list_act"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;dw_at.Reset()
AcceptText()
if not isNull(GetItemString(1,'codact')) then
	dw_at.Retrieve(GetItemString(1,'codact'))
end if

end event

type st_2 from statictext within w_pyp_prog
integer x = 1998
integer y = 1304
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aplicados:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_pyp_prog
integer x = 2085
integer y = 796
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pendientes:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_pyp_prog
integer x = 50
integer y = 792
integer width = 1344
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pacientes susceptibles de Aplicación del Programa"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_pyp_prog
integer x = 27
integer y = 8
integer width = 3570
integer height = 764
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

