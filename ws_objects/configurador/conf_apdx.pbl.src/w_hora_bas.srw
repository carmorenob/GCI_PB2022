$PBExportHeader$w_hora_bas.srw
forward
global type w_hora_bas from window
end type
type pb_3 from picturebutton within w_hora_bas
end type
type pb_2 from picturebutton within w_hora_bas
end type
type pb_1 from picturebutton within w_hora_bas
end type
type dw_txa_suge from datawindow within w_hora_bas
end type
type st_5 from statictext within w_hora_bas
end type
type st_4 from statictext within w_hora_bas
end type
type st_1 from statictext within w_hora_bas
end type
type em_cada from editmask within w_hora_bas
end type
type em_2 from editmask within w_hora_bas
end type
type em_1 from editmask within w_hora_bas
end type
type dw_dist from datawindow within w_hora_bas
end type
type dw_hora_resu from datawindow within w_hora_bas
end type
type dw_profe from datawindow within w_hora_bas
end type
type dw_1 from datawindow within w_hora_bas
end type
end forward

global type w_hora_bas from window
integer width = 3022
integer height = 2024
boolean titlebar = true
string title = "Programación Horario Profesional"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "Form!"
string pointer = "Arrow!"
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_txa_suge dw_txa_suge
st_5 st_5
st_4 st_4
st_1 st_1
em_cada em_cada
em_2 em_2
em_1 em_1
dw_dist dw_dist
dw_hora_resu dw_hora_resu
dw_profe dw_profe
dw_1 dw_1
end type
global w_hora_bas w_hora_bas

type variables
long filaini,colini,pres //para seleccionar los cuadrados
boolean cambia_cada
//datawindowchild espe 
end variables

forward prototypes
public subroutine marcafila (long fila)
public subroutine pinta ()
public subroutine marcacol (long columna)
end prototypes

public subroutine marcafila (long fila);long i
for i=1 to 7 
	if dw_1.getitemstring(fila,"selfil")="0" then
		dw_1.setitem(fila,"sel"+string(i),"1")
	else
		dw_1.setitem(fila,"sel"+string(i),"0")
	end if
next
if dw_1.getitemstring(fila,"selfil")="0" then
	dw_1.setitem(fila,"selfil","1")
else
	dw_1.setitem(fila,"selfil","0")
end if	
end subroutine

public subroutine pinta ();time hora
long cual
hora=time(em_1.text)
dw_1.reset()
DO WHILE hora < time(em_2.text)
	cual=dw_1.insertrow(0)
	dw_1.setitem(cual,"hora",hora)
	hora=relativetime(hora,long(em_cada.text)*60)
LOOP

end subroutine

public subroutine marcacol (long columna);long i
for i=1 to dw_1.rowcount()
	if dw_1.getitemstring(1,"selcol"+string(columna))="0" then

		dw_1.setitem(i,"sel"+string(columna),"1")
	else
		dw_1.setitem(i,"sel"+string(columna),"0")
	end if
next
if dw_1.getitemstring(1,"selcol"+string(columna))="0" then
	dw_1.setitem(1,"selcol"+string(columna),"1")
else
	dw_1.setitem(1,"selcol"+string(columna),"0")
end if
end subroutine

event open;dw_profe.settransobject(sqlca)
dw_txa_suge.settransobject(sqlca)
dw_profe.retrieve()
dw_1.settransobject(sqlca)
dw_hora_resu.settransobject(SQLCA)
dw_dist.settransobject(SQLCA)
dw_profe.triggerevent(itemchanged!)

end event

on w_hora_bas.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_txa_suge=create dw_txa_suge
this.st_5=create st_5
this.st_4=create st_4
this.st_1=create st_1
this.em_cada=create em_cada
this.em_2=create em_2
this.em_1=create em_1
this.dw_dist=create dw_dist
this.dw_hora_resu=create dw_hora_resu
this.dw_profe=create dw_profe
this.dw_1=create dw_1
this.Control[]={this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_txa_suge,&
this.st_5,&
this.st_4,&
this.st_1,&
this.em_cada,&
this.em_2,&
this.em_1,&
this.dw_dist,&
this.dw_hora_resu,&
this.dw_profe,&
this.dw_1}
end on

on w_hora_bas.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_txa_suge)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.em_cada)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_dist)
destroy(this.dw_hora_resu)
destroy(this.dw_profe)
destroy(this.dw_1)
end on

type pb_3 from picturebutton within w_hora_bas
string tag = "&Guardar"
integer x = 87
integer y = 1552
integer width = 146
integer height = 128
integer taborder = 100
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

event clicked;if dw_dist.rowcount()<1 then 
	messagebox("Atención","Agregue una especialidad")
	return
end if
pb_1.triggerevent(clicked!)
long fila,col,empezo,donde
time horaini,horafin
empezo=0
do while dw_hora_resu.rowcount()>0
	dw_hora_resu.deleterow(1)
loop
for col=1 to 7
	for fila=1 to dw_1.rowcount()
		if dw_1.getitemstring(fila,"dia"+string(col))<>"" and empezo=0 then
			empezo=1
			horaini=dw_1.getitemtime(fila,"hora")
		else 
			string ojo
			ojo=dw_1.getitemstring(fila,"dia"+string(col))
			if (ojo="" or isnull(ojo)) and empezo=1 then
				empezo=0
				horafin=dw_1.getitemtime(fila ,"hora")
				donde=dw_hora_resu.insertrow(0)
				dw_hora_resu.setitem(donde,"prof",dw_dist.getitemstring(dw_dist.getrow(),"prof"))
				dw_hora_resu.setitem(donde,"cesp",dw_dist.getitemstring(dw_dist.getrow(),"cesp"))
				dw_hora_resu.setitem(donde,"dia",col)
				dw_hora_resu.setitem(donde,"horaini",datetime(today(),horaini))
				dw_hora_resu.setitem(donde,"horafin",datetime(today(),horafin))
				dw_hora_resu.setitem(donde,"cada",long(em_cada.text))
			end if
		end if
	next
	if empezo=1 then
		horafin=relativetime(dw_1.getitemtime(dw_1.rowcount(),"hora"),long(em_cada.text)*60)
		empezo=0
		donde=dw_hora_resu.insertrow(0)
		dw_hora_resu.setitem(donde,"prof",dw_dist.getitemstring(dw_dist.getrow(),"prof"))
		dw_hora_resu.setitem(donde,"cesp",dw_dist.getitemstring(dw_dist.getrow(),"cesp"))
		dw_hora_resu.setitem(donde,"dia",col)
		dw_hora_resu.setitem(donde,"horaini",datetime(today(),horaini))
		dw_hora_resu.setitem(donde,"horafin",datetime(today(),horafin))
		dw_hora_resu.setitem(donde,"cada",long(em_cada.text))
	end if
next
if dw_dist.update()=-1 then
	rollback;
else
	if dw_hora_resu.update()=-1 then
		rollback;
	else
		commit;
	end if
end if
end event

type pb_2 from picturebutton within w_hora_bas
string tag = "&Desocupar"
integer x = 82
integer y = 1400
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "desocupar.GIF"
alignment htextalign = left!
end type

event clicked;long fil,col
for fil=1 to dw_1.rowcount()
	for col=1 to 7
		if dw_1.getitemstring(fil,"sel"+string(col))="1" then
			dw_1.setitem(fil,col,"")
			dw_1.setitem(fil,"sel"+string(col),"0")
		end if
	next
next
end event

type pb_1 from picturebutton within w_hora_bas
string tag = "&Ocupar"
integer x = 82
integer y = 1252
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ocupar.GIF"
alignment htextalign = left!
end type

event clicked;long fil,col
for fil=1 to dw_1.rowcount()
	for col=1 to 7
		if dw_1.getitemstring(fil,"sel"+string(col))="1" then
			dw_1.setitem(fil,col,"OCUPADO")
			dw_1.setitem(fil,"sel"+string(col),"0")
		end if
	next
next
		
end event

type dw_txa_suge from datawindow within w_hora_bas
boolean visible = false
integer x = 2048
integer y = 40
integer width = 498
integer height = 96
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_tiempos_xa_sugeri"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_hora_bas
integer x = 18
integer y = 1024
integer width = 279
integer height = 116
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tiempo de Consulta"
boolean focusrectangle = false
end type

type st_4 from statictext within w_hora_bas
integer x = 14
integer y = 844
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
string text = "Hora final:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_hora_bas
integer x = 14
integer y = 688
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
string text = "Hora Inicial:"
boolean focusrectangle = false
end type

type em_cada from editmask within w_hora_bas
integer x = 14
integer y = 1144
integer width = 165
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "15"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
string minmax = "5~~180"
end type

event modified;if dw_hora_resu.rowcount()>0 then
	if messagebox("Atención","Al cambiar el tiempo de duración de cada consulta, el horario sugerido anterior se borrará, desea continuar y volver a crear el horario sugerido?",question!,yesno!,2)=1 then 
		do while dw_hora_resu.rowcount()>0
			dw_hora_resu.deleterow(1)
		loop
		pinta()
	end if
else
	pinta()
end if
end event

type em_2 from editmask within w_hora_bas
integer x = 14
integer y = 904
integer width = 206
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "20:00"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;dw_hora_resu.triggerevent(retrieveend!)
end event

type em_1 from editmask within w_hora_bas
integer x = 18
integer y = 752
integer width = 201
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "6:00"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;dw_hora_resu.triggerevent(retrieveend!)
end event

type dw_dist from datawindow within w_hora_bas
integer x = 165
integer y = 176
integer width = 1550
integer height = 276
integer taborder = 50
string title = "none"
string dataobject = "dw_dist_hora_prof"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.rowcount()<1 or this.getrow()<1 then return
dw_txa_suge.retrieve(this.getitemstring(this.getrow(),"cesp"))
if dw_txa_suge.rowcount()=0 then
	em_cada.text="15"
else
	em_cada.text=string(dw_txa_suge.getitemnumber(1,"duracion"))
end if
this.selectrow(this.getrow(),true)
dw_hora_resu.retrieve(this.getitemstring(this.getrow(),"prof"),this.getitemstring(this.getrow(),"cesp"))


end event

event rowfocuschanging;if this.getrow()<1 then return
this.selectrow(this.getrow(),false)
end event

event retrieveend;if rowcount= 0 then
	dw_hora_resu.reset()
	dw_1.reset()
	messagebox("Atención","Este profesional no tiene asiganadas Especialidades")
else
	this.triggerevent(rowfocuschanged!)
end if
end event

type dw_hora_resu from datawindow within w_hora_bas
integer x = 1947
integer y = 180
integer width = 905
integer height = 396
integer taborder = 50
string title = "none"
string dataobject = "dw_hora_prof_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;if this.rowcount()>0 then
	time horaini,horafin,va
	horaini=relativetime(time("00:00"),this.getitemnumber(1,"menor"))
	horafin=relativetime(time("00:00"),this.getitemnumber(1,"mayor"))
	em_cada.text=string(this.getitemnumber(1,"cada"))
	if horaini < time(em_1.text) then em_1.text=string(horaini)
	if horafin > time(em_2.text) then em_2.text=string(horafin)
	pinta()
	long i,donde
	for i = 1 to this.rowcount()
		horaini=time(this.getitemdatetime(i,"horaini"))
		horafin=time(this.getitemdatetime(i,"horafin"))
		do while horaini < horafin
			donde=dw_1.find("hora=time('"+string(horaini)+"')",1,dw_1.rowcount())
			if donde= 0 then
				em_1.text=string(relativetime(time("00:00"),this.getitemnumber(1,"menor")))
				em_2.text=string(relativetime(time("00:00"),this.getitemnumber(1,"mayor")))
				this.triggerevent(retrieveend!)
				return
			end if
			dw_1.setitem(donde,"dia"+string(this.getitemnumber(i,"dia")),"OCUPADO")
			horaini=relativetime(horaini,long(em_cada.text)*60)
		loop	
	next
else
	pinta()
end if


end event

type dw_profe from datawindow within w_hora_bas
integer x = 37
integer y = 36
integer width = 1929
integer height = 124
integer taborder = 60
string title = "none"
string dataobject = "dw_profe_combo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
choose case this.getcolumn()
	case 1
		dw_dist.retrieve(this.getitemstring(1,1))
	case 2
		if dw_dist.find("cesp='"+this.getitemstring(1,2)+"'",1,dw_dist.rowcount())=0 then
			if messagebox("Atención","Desea agregar un horario para esta especialidad ?",question!,yesno!)=1 then
				long donde
				donde=dw_dist.insertrow(0)
				dw_dist.setitem(donde,"cesp",data)
				dw_dist.setitem(donde,"prof",dw_profe.getitemstring(1,1))
			end if
		end if
end choose
end event

type dw_1 from datawindow within w_hora_bas
event clickup pbm_dwnlbuttonup
event mousemove pbm_dwnmousemove
integer x = 379
integer y = 604
integer width = 2235
integer height = 1332
integer taborder = 60
string title = "none"
string dataobject = "dw_horario2"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clickup;pres=0
if row<1 then return
string cual
long columna,i,j
if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	columna=long(cual)
	if columna=colini and row=filaini then
		if this.getitemstring(row,"sel"+cual)="1" then
			this.setitem(row,"sel"+cual,"0")
		else
			this.setitem(row,"sel"+cual,"1")
		end if
	end if
end if

end event

event mousemove;if row<1 then return
if pres=0 then return
string cual
long columna,i,j
if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	columna=long(cual)
	if columna<>colini or row<>filaini then
		int paso1,paso2
		i=filaini
		j=colini
		if (row - filaini)= 0 then 
			paso1=1
		else
			paso1 = (row - filaini) / abs(filaini - row)
		end if
		if (columna - colini) = 0 then 
			paso2=1
		else
			paso2 = (columna - colini) / abs(colini - columna)
		end if
		do 
			do 
				this.setitem(i,"sel"+string(j),"1")
				j= j+ paso2
			loop until j = columna + paso2 
			i = i + paso1
			j=colini
		loop until i = row +paso1 
	end if
end if

end event

event buttonclicked;if this.rowcount()<1 then return
if dwo.name<>"b_hora" then
	choose case dwo.name
		case "b_dom"
			marcacol(1)
		case "b_lun"
			marcacol(2)
		case "b_mar"
			marcacol(3)
		case "b_mie"
			marcacol(4)
		case "b_jue"
			marcacol(5)
		case "b_vie"
			marcacol(6)
		case "b_sab"
			marcacol(7)
	end choose	
else
	marcafila(row)
end if


end event

event clicked;if string(dwo.type)="column" and string(dwo.name)<> "hora" then
	colini = long(right(string(dwo.name),1))
	filaini = row
	pres=1
end if

end event

