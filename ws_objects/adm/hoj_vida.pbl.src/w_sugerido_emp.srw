$PBExportHeader$w_sugerido_emp.srw
forward
global type w_sugerido_emp from window
end type
type st_6 from statictext within w_sugerido_emp
end type
type st_1 from statictext within w_sugerido_emp
end type
type dw_lugar from datawindow within w_sugerido_emp
end type
type pb_31 from picturebutton within w_sugerido_emp
end type
type cbx_1 from checkbox within w_sugerido_emp
end type
type st_11 from statictext within w_sugerido_emp
end type
type st_10 from statictext within w_sugerido_emp
end type
type st_9 from statictext within w_sugerido_emp
end type
type st_ccosto from statictext within w_sugerido_emp
end type
type st_ufun from statictext within w_sugerido_emp
end type
type st_lugar from statictext within w_sugerido_emp
end type
type st_5 from statictext within w_sugerido_emp
end type
type st_4 from statictext within w_sugerido_emp
end type
type dw_2 from datawindow within w_sugerido_emp
end type
type em_2 from editmask within w_sugerido_emp
end type
type em_1 from editmask within w_sugerido_emp
end type
type dw_hora_resu from datawindow within w_sugerido_emp
end type
type dw_dist from datawindow within w_sugerido_emp
end type
type dw_4 from datawindow within w_sugerido_emp
end type
type st_2 from statictext within w_sugerido_emp
end type
type dw_1 from datawindow within w_sugerido_emp
end type
type st_3 from statictext within w_sugerido_emp
end type
type em_cada from editmask within w_sugerido_emp
end type
type dw_5 from datawindow within w_sugerido_emp
end type
type cb_guarda from picturebutton within w_sugerido_emp
end type
type cb_2 from picturebutton within w_sugerido_emp
end type
type cb_1 from picturebutton within w_sugerido_emp
end type
type gb_2 from groupbox within w_sugerido_emp
end type
type gb_1 from groupbox within w_sugerido_emp
end type
end forward

global type w_sugerido_emp from window
integer width = 4014
integer height = 2240
boolean titlebar = true
string title = "Sugerido de empleado"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_vigencia.ico"
st_6 st_6
st_1 st_1
dw_lugar dw_lugar
pb_31 pb_31
cbx_1 cbx_1
st_11 st_11
st_10 st_10
st_9 st_9
st_ccosto st_ccosto
st_ufun st_ufun
st_lugar st_lugar
st_5 st_5
st_4 st_4
dw_2 dw_2
em_2 em_2
em_1 em_1
dw_hora_resu dw_hora_resu
dw_dist dw_dist
dw_4 dw_4
st_2 st_2
dw_1 dw_1
st_3 st_3
em_cada em_cada
dw_5 dw_5
cb_guarda cb_guarda
cb_2 cb_2
cb_1 cb_1
gb_2 gb_2
gb_1 gb_1
end type
global w_sugerido_emp w_sugerido_emp

type variables
datawindowchild dw_ufun,dw_ccosto 
long filaini,colini,pres //para seleccionar los cuadrados
long dura,cuantos,fila_prof,fila_ant,col_ant
datetime desde,hasta
boolean guardo
end variables

forward prototypes
public subroutine pinta ()
public subroutine marcacol (long columna)
public subroutine marcafila (long fila)
end prototypes

public subroutine pinta ();time hora
long cual
hora=time(em_1.text)
dw_5.SetRedraw(FALSE)
dw_5.reset()
//dw_dist.setitem(dw_dist.getrow(),"duracion",long(em_cada.text))
DO WHILE hora < time(em_2.text)
	cual=dw_5.insertrow(0)
	dw_5.setitem(cual,"hora",hora)
	hora=relativetime(hora,long(em_cada.text)*60)
LOOP
dw_5.SetRedraw(TRUE)
end subroutine

public subroutine marcacol (long columna);long i
for i=1 to dw_5.rowcount()
	if dw_5.getitemstring(1,"selcol"+string(columna))="0" then

		dw_5.setitem(i,"sel"+string(columna),"1")
	else
		dw_5.setitem(i,"sel"+string(columna),"0")
	end if
next
if dw_5.getitemstring(1,"selcol"+string(columna))="0" then
	dw_5.setitem(1,"selcol"+string(columna),"1")
else
	dw_5.setitem(1,"selcol"+string(columna),"0")
end if
end subroutine

public subroutine marcafila (long fila);long i
for i=1 to 7 
	if dw_5.getitemstring(fila,"selfil")="0" then
		dw_5.setitem(fila,"sel"+string(i),"1")
	else
		dw_5.setitem(fila,"sel"+string(i),"0")
	end if
next
if dw_5.getitemstring(fila,"selfil")="0" then
	dw_5.setitem(fila,"selfil","1")
else
	dw_5.setitem(fila,"selfil","0")
end if	
end subroutine

on w_sugerido_emp.create
this.st_6=create st_6
this.st_1=create st_1
this.dw_lugar=create dw_lugar
this.pb_31=create pb_31
this.cbx_1=create cbx_1
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_ccosto=create st_ccosto
this.st_ufun=create st_ufun
this.st_lugar=create st_lugar
this.st_5=create st_5
this.st_4=create st_4
this.dw_2=create dw_2
this.em_2=create em_2
this.em_1=create em_1
this.dw_hora_resu=create dw_hora_resu
this.dw_dist=create dw_dist
this.dw_4=create dw_4
this.st_2=create st_2
this.dw_1=create dw_1
this.st_3=create st_3
this.em_cada=create em_cada
this.dw_5=create dw_5
this.cb_guarda=create cb_guarda
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_6,&
this.st_1,&
this.dw_lugar,&
this.pb_31,&
this.cbx_1,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_ccosto,&
this.st_ufun,&
this.st_lugar,&
this.st_5,&
this.st_4,&
this.dw_2,&
this.em_2,&
this.em_1,&
this.dw_hora_resu,&
this.dw_dist,&
this.dw_4,&
this.st_2,&
this.dw_1,&
this.st_3,&
this.em_cada,&
this.dw_5,&
this.cb_guarda,&
this.cb_2,&
this.cb_1,&
this.gb_2,&
this.gb_1}
end on

on w_sugerido_emp.destroy
destroy(this.st_6)
destroy(this.st_1)
destroy(this.dw_lugar)
destroy(this.pb_31)
destroy(this.cbx_1)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_ccosto)
destroy(this.st_ufun)
destroy(this.st_lugar)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_2)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_hora_resu)
destroy(this.dw_dist)
destroy(this.dw_4)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.em_cada)
destroy(this.dw_5)
destroy(this.cb_guarda)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;col_ant=0
fila_ant=0

dw_1.settransobject(SQLCA)
dw_lugar.settransobject(SQLCA)
dw_2.settransobject(SQLCA)
dw_1.insertrow(1)
dw_lugar.insertrow(1)
dw_hora_resu.settransobject(SQLCA)
dw_dist.settransobject(SQLCA)
dw_4.settransobject(SQLCA)
dw_2.getchild("codcc",dw_ccosto)
dw_ccosto.settransobject(SQLCA)
dw_ccosto.retrieve()
dw_ccosto.setfilter("codlugar=''")
dw_ccosto.filter()
dw_2.insertrow(1)
end event

event resize;//
end event

type st_6 from statictext within w_sugerido_emp
integer x = 302
integer y = 856
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type st_1 from statictext within w_sugerido_emp
integer x = 64
integer y = 20
integer width = 187
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type dw_lugar from datawindow within w_sugerido_emp
integer x = 279
integer y = 756
integer width = 768
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dw_lugar_nom"
boolean border = false
boolean livescroll = true
end type

type pb_31 from picturebutton within w_sugerido_emp
event mosemove pbm_mousemove
integer x = 2990
integer y = 1848
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
string picturename = "print.gif"
string disabledname = "d_print.gif"
string powertiptext = "Reporte"
end type

event clicked;//select documentos.camino into :camino from documentos
//where documentos.coddoc='4' and documentos.codtreporte='5';
//long archivo,tamanyo,donde
//tamanyo = FileLength(camino)
//archivo = fileopen(camino,StreamMode!)
//string carreta,todo
//todo = ""
//do while tamanyo > 0 
//	fileread(archivo,carreta)
//	todo = todo + carreta
//	tamanyo = tamanyo - 32765
//loop
//fileclose(archivo)
//carreta=""
//donde=pos(todo,"release ",1)
//carreta=right(todo, len(todo) - donde +1)
/////////////////*********  los cinco pasos para visualizar un reporte
//opensheet (w_reporte,w_principal,4,original!)
//w_reporte.title = "Reportes - " + camino
//w_reporte.dw_rep.create(carreta)
//w_reporte.inicialize()
//w_reporte.dw_rep.retrieve(dw_1.getitemstring(1,1))
//w_reporte.colocapagin()
////Close(w_contrato_vencido)
end event

type cbx_1 from checkbox within w_sugerido_emp
integer x = 2665
integer y = 1728
integer width = 379
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Festivos"
boolean lefttext = true
end type

type st_11 from statictext within w_sugerido_emp
integer x = 1714
integer y = 1888
integer width = 434
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Centro de costo"
boolean focusrectangle = false
end type

type st_10 from statictext within w_sugerido_emp
integer x = 695
integer y = 1888
integer width = 448
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Unidad funcional"
boolean focusrectangle = false
end type

type st_9 from statictext within w_sugerido_emp
integer x = 78
integer y = 1888
integer width = 398
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type st_ccosto from statictext within w_sugerido_emp
integer x = 1710
integer y = 1812
integer width = 869
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_ufun from statictext within w_sugerido_emp
integer x = 690
integer y = 1812
integer width = 1006
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_lugar from statictext within w_sugerido_emp
integer x = 78
integer y = 1812
integer width = 590
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_sugerido_emp
integer x = 2994
integer y = 1752
integer width = 238
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salida"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_sugerido_emp
integer x = 2775
integer y = 1468
integer width = 448
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Horas semanales"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_sugerido_emp
integer x = 1061
integer y = 760
integer width = 2098
integer height = 160
integer taborder = 20
string title = "none"
string dataobject = "dw_uf_cc"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
if this.getColumnName() = 'coduf' then
	this.setitem(1,'codcc',"")
	dw_ccosto.setfilter("coduf='"+this.getitemstring(1,'coduf')+"'")
	dw_ccosto.filter()
end if

end event

type em_2 from editmask within w_sugerido_emp
integer x = 3264
integer y = 1728
integer width = 334
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "23:59"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;dw_hora_resu.triggerevent(retrieveend!)
end event

type em_1 from editmask within w_sugerido_emp
integer x = 3246
integer y = 1548
integer width = 338
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "00:00"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;dw_hora_resu.triggerevent(retrieveend!)
end event

type dw_hora_resu from datawindow within w_sugerido_emp
integer x = 2583
integer y = 964
integer width = 997
integer height = 432
integer taborder = 30
string title = "none"
string dataobject = "dw_hora_prof_t_i"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;if this.rowcount()>0 then
	time horaini,horafin,va
	horaini=relativetime(time("00:00"),this.getitemnumber(1,"menor"))
	horafin=relativetime(time("00:00"),this.getitemnumber(1,"mayor"))
	if horaini < time(em_1.text) then em_1.text=string(horaini)
	if horafin > time(em_2.text) then em_2.text=string(horafin)
	pinta()
	long i,donde
	for i = 1 to this.rowcount()
		horaini=time(this.getitemdatetime(i,"horaini"))
		horafin=time(this.getitemdatetime(i,"horafin"))
		do while horaini < horafin
			donde=dw_5.find("hora=time('"+string(horaini)+"')",1,dw_5.rowcount())
			dw_5.setitem(donde,"dia"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"ccosto"))
			dw_5.setitem(donde,"ufun"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"ufuncional"))
			dw_5.setitem(donde,"cc"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"codlugar"))
			horaini=relativetime(horaini,long(em_cada.text)*60)
		loop	
	next
else
	pinta()
end if

end event

type dw_dist from datawindow within w_sugerido_emp
integer x = 55
integer y = 188
integer width = 3195
integer height = 432
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_emple_lugar"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;if rowcount= 0 then
	dw_hora_resu.reset()
	pinta()
else
	this.triggerevent(rowfocuschanged!)
end if
end event

event rowfocuschanged;string festi

if this.RowCount() < 1 or this.GetRow() < 1 then return
this.selectrow(this.getrow(),true)
dw_2.SetItem(1,'coduf',GetItemString(getRow(),'ufuncional'))
dw_2.SetItem(1,'codcc',GetItemString(getRow(),'ccosto'))
dw_hora_resu.Retrieve(this.getItemString(this.getrow(),"tipodoc"),this.getitemstring(this.getrow(),"documento"),this.getitemnumber(this.getrow(),"ncargo"))
dw_4.retrieve(this.getitemstring(this.getrow(),"tipodoc"),this.getitemstring(this.getrow(),"documento"),this.getitemnumber(this.getrow(),"ncargo"))
if dw_hora_resu.rowcount() < 1 then return
festi=dw_hora_resu.getitemstring(1,"festivos")
if festi="1" then 
	cbx_1.checked=true
else
	cbx_1.checked=false
end if

end event

event rowfocuschanging;if this.getrow()<1 then return
this.selectrow(this.getrow(),false)
end event

event clicked;if this.GetRow() <> row and row > 0  and string(dwo.name) = 'compute_1' then
	this.SetRow(row)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type dw_4 from datawindow within w_sugerido_emp
integer x = 3241
integer y = 1440
integer width = 352
integer height = 120
integer taborder = 40
string title = "none"
string dataobject = "dw_total_obra_suge"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_sugerido_emp
integer x = 64
integer y = 112
integer width = 654
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Personas del lugar"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_sugerido_emp
integer x = 256
integer y = 12
integer width = 1216
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dw_lugar_nom"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
dw_dist.retrieve(dw_1.getitemstring(1,'codlugar'))
dw_lugar.setitem(1,'codlugar',data)
dw_2.setcolumn('coduf')


end event

type st_3 from statictext within w_sugerido_emp
integer x = 3003
integer y = 1552
integer width = 210
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entrada"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_cada from editmask within w_sugerido_emp
integer x = 2839
integer y = 1484
integer width = 165
integer height = 64
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "60"
boolean border = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
string minmax = "5~~180"
end type

event modified;dw_hora_resu.triggerevent(retrieveend!)
end event

type dw_5 from datawindow within w_sugerido_emp
event clickup pbm_dwnlbuttonup
event mousemove pbm_dwnmousemove
integer x = 78
integer y = 964
integer width = 2441
integer height = 764
integer taborder = 40
string title = "none"
string dataobject = "dw_horario2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
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
string cual
long columna,i,j
string lugar,ufun,ccostos,dlugar,dccostos,dufun

if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	if this.getitemstring(row,"dia"+cual)<>"" then
		columna = long(cual)
		ccostos = this.getitemstring(row,"dia"+cual)
		ufun = this.getitemstring(row,"ufun"+cual)
		lugar = this.getitemstring(row,"cc"+cual)
		if col_ant <> columna or fila_ant<>row then
			col_ant = columna
			fila_ant = row
			SELECT descripcion into :dlugar FROM lugar
			WHERE codlugar = :lugar;
			SELECT desufuncional into :dufun FROM ufuncional
			WHERE coduf=:ufun;
			SELECT descripcion into :dccostos FROM centrocostos
			WHERE coduf=:ufun and centrocostos.codcc=:ccostos;
			st_lugar.text = dlugar
			st_ufun.text = dufun
			st_ccosto.text = dccostos
		end if
	else
		st_lugar.text=""
		st_ufun.text=""
		st_ccosto.text=""
		col_ant=0
		fila_ant=0
	end if
end if

if pres=0 then Return

if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	columna=long(cual)
	if columna<>colini or row<>filaini then
		int paso1,paso2
		i = filaini
		j = colini
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

event clicked;
if string(dwo.type)="column" and string(dwo.name)<> "hora" then
	colini = long(right(string(dwo.name),1))
	filaini = row
	pres=1
end if

end event

type cb_guarda from picturebutton within w_sugerido_emp
event mousemove pbm_mousemove
integer x = 3479
integer y = 1848
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
string powertiptext = "Guardar"
end type

event clicked;if dw_dist.rowcount()<1 then 
	messagebox("Atención","Seleccione un empleado")
	return
end if
cb_1.triggerevent(clicked!)
long fila,col,empezo,donde
time horaini,horafin
empezo=0
do while dw_hora_resu.rowcount()>0
	dw_hora_resu.deleterow(1)
loop
string ccost,lugar
for col=1 to 7
	for fila=1 to dw_5.rowcount()
		if dw_5.getitemstring(fila,"dia"+string(col))<>"" and empezo=0 then
			ccost=dw_5.getitemstring(fila,"dia"+string(col))
			lugar=dw_5.getitemstring(fila,"cc"+string(col))
			empezo=1
			horaini=dw_5.getitemtime(fila,"hora")
		else 
			string ojo,lugarojo
			ojo=dw_5.getitemstring(fila,"dia"+string(col))
			lugarojo=dw_5.getitemstring(fila,"cc"+string(col))
			//if ((ojo="" or isnull(ojo)) and empezo=1)or((ojo<>"" and not isnull(ojo))and ojo <> ccost) or((ojo<>"" and not isnull(ojo))and lugarojo <> clugar)then
			if (isnull(ojo) and empezo=1) or (not isnull(ojo) and ojo <> ccost) or (not isnull(ojo) and lugarojo <> lugar)then
				empezo=0
				horafin=dw_5.getitemtime(fila ,"hora")
				donde=dw_hora_resu.insertrow(0)
				dw_hora_resu.setitem(donde,"tipodoc",dw_dist.getitemstring(dw_dist.getrow(),"tipodoc"))
				dw_hora_resu.setitem(donde,"documento",dw_dist.getitemstring(dw_dist.getrow(),"documento"))
				dw_hora_resu.setitem(donde,"ncargo",dw_dist.getitemnumber(dw_dist.getrow(),"ncargo"))
				dw_hora_resu.setitem(donde,"dia",col)
				dw_hora_resu.setitem(donde,"horaini",datetime(today(),horaini))
				dw_hora_resu.setitem(donde,"horafin",datetime(today(),horafin))
				dw_hora_resu.setitem(donde,"codlugar",dw_5.getitemstring(fila - 1,"cc"+string(col)))
				dw_hora_resu.setitem(donde,"ufuncional",dw_5.getitemstring(fila - 1,"ufun"+string(col)))
				dw_hora_resu.setitem(donde,"ccosto",dw_5.getitemstring(fila - 1,"dia"+string(col)))
				if cbx_1.checked then 
					dw_hora_resu.setitem(donde,"festivos","1")
				else 
					dw_hora_resu.setitem(donde,"festivos","0")
				end if
				if (not isnull(ojo) and ojo <> ccost) or (not isnull(ojo) and lugarojo <> lugar) then 
					ccost=dw_5.getitemstring(fila,"dia"+string(col))
					horaini=dw_5.getitemtime(fila,"hora")
					empezo=1
				end if
			end if
		end if
	next
	if empezo=1 then
		horafin=relativetime(dw_5.getitemtime(dw_5.rowcount(),"hora"),60*60)
		empezo=0
		donde=dw_hora_resu.insertrow(0)
		dw_hora_resu.setitem(donde,"tipodoc",dw_dist.getitemstring(dw_dist.getrow(),"tipodoc"))
		dw_hora_resu.setitem(donde,"documento",dw_dist.getitemstring(dw_dist.getrow(),"documento"))
		dw_hora_resu.setitem(donde,"ncargo",dw_dist.getitemnumber(dw_dist.getrow(),"ncargo"))
		dw_hora_resu.setitem(donde,"dia",col)
		dw_hora_resu.setitem(donde,"horaini",datetime(today(),horaini))
		dw_hora_resu.setitem(donde,"horafin",datetime(today(),horafin))
		dw_hora_resu.setitem(donde,"horaini",datetime(today(),horaini))
		dw_hora_resu.setitem(donde,"horafin",datetime(today(),horafin))
		dw_hora_resu.setitem(donde,"codlugar",dw_5.getitemstring(dw_5.rowcount(),"cc"+string(col)))
		dw_hora_resu.setitem(donde,"ufuncional",dw_5.getitemstring(dw_5.rowcount(),"ufun"+string(col)))
		dw_hora_resu.setitem(donde,"ccosto",dw_5.getitemstring(dw_5.rowcount(),"dia"+string(col)))
		if cbx_1.checked then 
			dw_hora_resu.setitem(donde,"festivos","1")
		else 
			dw_hora_resu.setitem(donde,"festivos","0")
		end if
	end if
next
//dw_dist.update()
if dw_hora_resu.update() = -1 then
	rollback;
else
	commit;
end if
dw_4.retrieve(dw_dist.getItemString(dw_dist.getrow(),"tipodoc"),dw_dist.getItemString(dw_dist.getrow(),"documento"),dw_dist.getItemNumber(dw_dist.getrow(),"ncargo"))

end event

type cb_2 from picturebutton within w_sugerido_emp
event mousemove pbm_mousemove
integer x = 3150
integer y = 1848
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ocupar.gif"
string disabledname = "d_ocupar.gif"
string powertiptext = "Ocupar"
end type

event clicked;long fil,col
string valor
if isnull(dw_lugar.getitemstring(1,'codlugar')) then 
	messagebox("Alerta","Favor seleccione un lugar para asignar la mano de obra")
	return
end if
if isnull(dw_2.getitemstring(1,'coduf')) then 
	messagebox("Alerta","Favor seleccione una unidad funcional para asignar la mano de obra")
	return
end if
if isnull(dw_2.getitemstring(1,'codcc')) then 
	messagebox("Alerta","Favor seleccione un centro de costo para asignar la mano de obra")
	return
end if
for fil=1 to dw_5.rowcount()
	for col=1 to 7
		if dw_5.getitemstring(fil,"sel"+string(col)) = "1" then
			valor = dw_2.getitemstring(1,'codcc') //centro de costo
			dw_5.setitem(fil,col,valor)
			valor = dw_2.getitemstring(1,'coduf') //unidad funcional
			dw_5.setitem(fil,"ufun"+string(col),valor) 
			valor = dw_lugar.getitemstring(1,'codlugar') 
			dw_5.setitem(fil,"cc"+string(col),valor)
			dw_5.setitem(fil,"sel"+string(col),"0")
		end if
	next
next
			
end event

type cb_1 from picturebutton within w_sugerido_emp
event mosemove pbm_mousemove
integer x = 3314
integer y = 1848
integer width = 151
integer height = 132
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "desocupar.gif"
string disabledname = "d_desocupar.gif"
string powertiptext = "Desocupar"
end type

event clicked;long fil,col
string valor
setNull(valor)
for fil=1 to dw_5.rowcount()
	for col=1 to 7
		if dw_5.getitemstring(fil,"sel"+string(col))="1" then
			dw_5.setitem(fil,col,valor)
			dw_5.setitem(fil,"ufun"+string(col),valor)
			dw_5.setitem(fil,"cc"+string(col),valor)
			dw_5.setitem(fil,"sel"+string(col),"0")
		end if
	next
next
end event

type gb_2 from groupbox within w_sugerido_emp
integer x = 219
integer y = 700
integer width = 2985
integer height = 232
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_sugerido_emp
event mouse pbm_mousemove
integer x = 14
integer y = 648
integer width = 3666
integer height = 1308
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Distribución de obra semanal"
end type

