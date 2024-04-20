$PBExportHeader$w_notaspac.srw
forward
global type w_notaspac from window
end type
type mc_1 from monthcalendar within w_notaspac
end type
type pb_2 from pb_report within w_notaspac
end type
type sle_a from singlelineedit within w_notaspac
end type
type gb_3 from groupbox within w_notaspac
end type
type gb_2 from groupbox within w_notaspac
end type
type ddlb_1 from dropdownlistbox within w_notaspac
end type
type st_3 from statictext within w_notaspac
end type
type t1 from tab within w_notaspac
end type
type p1 from userobject within t1
end type
type mle_1 from multilineedit within p1
end type
type p1 from userobject within t1
mle_1 mle_1
end type
type p2 from userobject within t1
end type
type mle_2 from multilineedit within p2
end type
type p2 from userobject within t1
mle_2 mle_2
end type
type t1 from tab within w_notaspac
p1 p1
p2 p2
end type
type pb_5 from picturebutton within w_notaspac
end type
type pb_4 from picturebutton within w_notaspac
end type
type pb_3 from picturebutton within w_notaspac
end type
type pb_1 from picturebutton within w_notaspac
end type
type st_4 from statictext within w_notaspac
end type
type gb_1 from groupbox within w_notaspac
end type
type dw_1 from datawindow within w_notaspac
end type
end forward

global type w_notaspac from window
integer width = 4251
integer height = 2144
boolean titlebar = true
string title = "Notas del paciente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mc_1 mc_1
pb_2 pb_2
sle_a sle_a
gb_3 gb_3
gb_2 gb_2
ddlb_1 ddlb_1
st_3 st_3
t1 t1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_1 pb_1
st_4 st_4
gb_1 gb_1
dw_1 dw_1
end type
global w_notaspac w_notaspac

type variables
boolean cambio
date l_fec
st_notas st_cl
boolean i_cambia_rte
string ordenar[10]
end variables

forward prototypes
public function integer f_grabarpyp ()
end prototypes

public function integer f_grabarpyp ();int f, n, nota
string td, doc
uo_datastore dw_n
dw_n = CREATE uo_datastore
dw_n.DataObject = 'dw_notas_pac'
dw_n.SetTRansObject(SQLCA)
f = st_cl.dw_pac.Find("selec=1",1,st_cl.dw_pac.RowCount())
do while f > 0
	td = st_cl.dw_pac.GetItemString(f,'tipodoc')
	doc = st_cl.dw_pac.GetItemString(f,'documento')
	select max(num_nota) into :nota from pacientesnotas 
	where tipodoc=:td and documento=:doc;
	if SQLCA.SQLCode <> 0 then
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
	if isNull(nota) then nota = 0
	nota = nota + 1
	n = dw_n.InsertRow(0)
	dw_n.SetItem(n,'tipodoc',td)
	dw_n.SetItem(n,'documento',doc)
	dw_n.SetItem(n,'num_nota',nota)
	dw_n.SetItem(n,'fingreso',today())
	dw_n.SetItem(n,'fllamada',dw_1.GetItemDateTime(dw_1.GetRow(),'fllamada'))
	dw_n.SetItem(n,'tipo',dw_1.GetItemString(dw_1.GetRow(),'tipo'))
	dw_n.SetItem(n,'Asunto',sle_a.Text)
	dw_n.SetItem(n,'codprof',st_cl.profe)
	dw_n.SetItem(n,'estado','0')
	if f = st_cl.dw_pac.RowCount() then EXIT
	f = st_cl.dw_pac.Find("selec=1",f+1,st_cl.dw_pac.RowCount())
loop
if dw_n.Update() = -1 then
	Rollback;
	Return -1
end if

blob memo
string texto
texto = t1.p1.mle_1.text
if not (isNull(texto) or texto = '') then
	SQLCA.Autocommit = True
	memo = blob(texto)
	for f = 1 to dw_n.RowCount()
		td = dw_n.GetItemString(f,'tipodoc')
		doc = dw_n.GetItemString(f,'documento')
		nota = dw_n.GetItemNumber(f,'num_nota')
		updateblob pacientesnotas set solicitud=:memo
		where tipodoc=:td and documento=:doc and num_nota=:nota;
		if SQLCA.SQLnRows = 0 then
			messageBox('Error','No fué posible actualizar el campo Solicitud')
			SQLCA.Autocommit = False
			Return -1
		end if		
	next
	SQLCA.Autocommit = False
end if

cambio = FALSE
Return 0

end function

on w_notaspac.create
this.mc_1=create mc_1
this.pb_2=create pb_2
this.sle_a=create sle_a
this.gb_3=create gb_3
this.gb_2=create gb_2
this.ddlb_1=create ddlb_1
this.st_3=create st_3
this.t1=create t1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_1=create pb_1
this.st_4=create st_4
this.gb_1=create gb_1
this.dw_1=create dw_1
this.Control[]={this.mc_1,&
this.pb_2,&
this.sle_a,&
this.gb_3,&
this.gb_2,&
this.ddlb_1,&
this.st_3,&
this.t1,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_1,&
this.st_4,&
this.gb_1,&
this.dw_1}
end on

on w_notaspac.destroy
destroy(this.mc_1)
destroy(this.pb_2)
destroy(this.sle_a)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.ddlb_1)
destroy(this.st_3)
destroy(this.t1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event open;
st_cl = Message.PowerObjectParm
if isValid(st_cl) then 
	if isValid(st_cl.dw_pac) or isValid(st_cl.dw_acc) then
		ddlb_1.SelectItem(5)
		ddlb_1.Event Selectionchanged(5)
		pb_4.Enabled = FALSE
		pb_5.Enabled = FALSE
		pb_5.TriggerEvent(clicked!)
		sle_a.Text = st_cl.Asunto
		Return 0
	else
		ddlb_1.SelectItem(6)
		ddlb_1.Event Selectionchanged(6)
	end if
else
	ddlb_1.SelectItem(1)
	ddlb_1.Event Selectionchanged(1)
end if

dw_1.Retrieve(tipdoc,docu)
cambio = FALSE

end event

event closequery;int ret
if cambio then
	ret = MessageBox('Aviso','Se realizaron cambios. Desea guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_3.Event Clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

type mc_1 from monthcalendar within w_notaspac
integer x = 23
integer y = 48
integer width = 1111
integer height = 652
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long titletextcolor = 16777215
long trailingtextcolor = 134217745
long backcolor = 134217732
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
borderstyle borderstyle = styleraised!
end type

event constructor;GetSelectedDate ( l_fec )
end event

event datechanged;GetSelectedDate ( l_fec )
dw_1.Retrieve(datetime(l_fec))


end event

type pb_2 from pb_report within w_notaspac
integer x = 3790
integer y = 552
integer taborder = 40
integer weight = 700
string cod_rep = "NPA"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_1.RowCount() = 0 then Return -1
any par[3]
par[1]=dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
par[2]=dw_1.GetItemString(dw_1.GetRow(),'documento')
par[3]=dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')
imprimir(par,'','0')
end event

type sle_a from singlelineedit within w_notaspac
integer x = 1230
integer y = 584
integer width = 1920
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event modified;if dw_1.RowCount() = 0 then Return
dw_1.SetItem(dw_1.GetRow(),'asunto',this.Text)
cambio = TRUE
end event

type gb_3 from groupbox within w_notaspac
integer x = 3195
integer y = 528
integer width = 928
integer height = 160
integer taborder = 30
integer textsize = -4
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_notaspac
integer x = 3397
integer y = 512
integer width = 512
integer height = 176
integer taborder = 20
integer textsize = -4
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "."
end type

type ddlb_1 from dropdownlistbox within w_notaspac
integer x = 3273
integer y = 8
integer width = 558
integer height = 500
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Todos"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Todos","Alertas","Para citas","Certificados","Promoción y Prevención","Ingreso Actual"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if index = 1 then
	dw_1.SetFilter("")
elseif index = 6 then
	dw_1.SetFilter("contador="+string(st_cl.contador)+" and clugar='"+st_cl.clugar+"'")
else
	dw_1.SetFilter("tipo='"+string(index - 2)+"'")
end if
dw_1.Filter()
dw_1.TriggerEvent(RowFocusChanged!)

end event

type st_3 from statictext within w_notaspac
integer x = 3127
integer y = 4
integer width = 128
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ver:"
boolean focusrectangle = false
end type

type t1 from tab within w_notaspac
integer x = 32
integer y = 720
integer width = 4151
integer height = 1296
integer taborder = 30
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
p2 p2
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.Control[]={this.p1,&
this.p2}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
end on

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 4114
integer height = 1168
long backcolor = 67108864
string text = "Solicitud"
long tabtextcolor = 33554432
string picturename = "quejas.ico"
long picturemaskcolor = 536870912
mle_1 mle_1
end type

on p1.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on p1.destroy
destroy(this.mle_1)
end on

type mle_1 from multilineedit within p1
integer x = 27
integer y = 28
integer width = 4055
integer height = 1100
integer taborder = 40
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 4114
integer height = 1168
long backcolor = 67108864
string text = "Gestion"
long tabtextcolor = 33554432
string picturename = "gestion.ico"
long picturemaskcolor = 536870912
mle_2 mle_2
end type

on p2.create
this.mle_2=create mle_2
this.Control[]={this.mle_2}
end on

on p2.destroy
destroy(this.mle_2)
end on

type mle_2 from multilineedit within p2
integer x = 27
integer y = 28
integer width = 4055
integer height = 1100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type pb_5 from picturebutton within w_notaspac
integer x = 3255
integer y = 552
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar"
end type

event clicked;long f
f = dw_1.InsertRow(1)
dw_1.SetItem(f,'tipodoc',tipdoc)
dw_1.SetItem(f,'documento',docu)
dw_1.SetItem(f,'fingreso',today())
dw_1.SetItem(f,'estado','0')
if isValid(st_cl) then
	dw_1.SetItem(f,'contador',st_cl.contador)
	dw_1.SetItem(f,'clugar',st_cl.cLugar)
	dw_1.SetItem(f,'codprof',st_cl.profe)
end if

t1.p1.mle_1.Enabled = TRUE
sle_a.Enabled = TRUE
choose case ddlb_1.Text
	case 'Alertas' 
		dw_1.SetItem(f,'tipo','0')
	case 'Para citas' 
		dw_1.SetItem(f,'tipo','1')
	case 'Certificados' 
		dw_1.SetItem(f,'tipo','2')
	case 'Promoción y Prevención' 
		dw_1.SetItem(f,'tipo','3')
end choose
if isValid(st_cl.dw_acc) then
	int i
	string texto
	f_pega_a_mle(t1.p1.mle_1,'Acciones Pendientes de Promoción y Prevención ~r~n',3)
	for i = 1 to st_cl.dw_acc.RowCount()
		texto = st_cl.dw_acc.GetItemString(i,'descripcion') +' - '+ st_cl.dw_acc.GetItemString(i,'nombreaccion')
		f_pega_a_mle(t1.p1.mle_1,texto+'~r~n',2)
	next
end if
dw_1.scrolltoRow(f)
cambio = TRUE

end event

type pb_4 from picturebutton within w_notaspac
integer x = 3401
integer y = 552
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar"
end type

event clicked;if dw_1.RowCount() = 0 then Return
dw_1.DeleteRow(0)
cambio = TRUE

end event

type pb_3 from picturebutton within w_notaspac
integer x = 3643
integer y = 552
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;long nota
if dw_1.AcceptText() = -1 then Return -1
if isValid(st_cl) then
	if isValid(st_cl.dw_pac) then Return f_grabarPyP()
end if

if dw_1.GetItemString(dw_1.GetRow(),'estado') = '1' or dw_1.GetItemString(dw_1.GetRow(),'estado') = '3' then
	MessageBox('Atención','El documento ya ha sido cerrado')
	Return -1
end if

if cambio and dw_1.RowCount() = 0 then
	if dw_1.Update() = -1 then
		Rollback;
		Return -1
	end if
	commit;
	cambio = FALSE
	Return 0
end if
if not cambio then Return 0
dw_1.SetItem(dw_1.GetRow(),'estado','1')
if isNull(dw_1.GetItemString(dw_1.GetRow(),'tipo')) then
	MessageBox('Atención','Se requiere el tipo de nota')
	Return -1
end if
if dw_1.GetItemString(dw_1.GetRow(),'tipo') = '1' then
	if isNull(dw_1.GetItemDateTime(dw_1.GetRow(),'fllamada')) or dw_1.GetItemDateTime(dw_1.GetRow(),'fllamada') < datetime(today()) then
		MessageBox('Atención','Debe seleccionar una fecha válida para el campo LLAMAR')
		Return -1
	end if
end if
if isNull(dw_1.GetItemNumber(dw_1.GetRow(),'num_nota')) then
	select max(num_nota) into :nota from pacientesnotas
	where tipodoc=:tipdoc and documento=:docu;
	if SQLCA.SQLnRows = 0 then
		messageBox('Error',SQLCA.SQLErrText)
		Return -1
	end if
	if isNull(nota) then
		nota = 1
	else
		nota++
	end if
	dw_1.SetItem(dw_1.getRow(),'num_nota',nota)
else
	nota = dw_1.GetItemNumber(dw_1.getRow(),'num_nota')
end if

if dw_1.Update() = -1 then
	Rollback;
	Return -1
end if
commit;

blob memo
string texto
texto = t1.p1.mle_1.text
if not (isNull(texto) or texto = '') then
	SQLCA.Autocommit = True
	memo = blob(texto)
	updateblob pacientesnotas set solicitud=:memo
	where tipodoc=:tipdoc and documento=:docu and num_nota=:nota;
	if SQLCA.SQLnRows = 0 then
		messageBox('Error','No fué posible actualizar el campo Solicitud')
		SQLCA.Autocommit = False
		Return -1
	end if
	SQLCA.Autocommit = False
end if
//dw_1.TriggerEvent(rowfocuschanged!)
cambio = FALSE
Return 0

end event

type pb_1 from picturebutton within w_notaspac
integer x = 3931
integer y = 552
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Plantilla"
end type

event clicked;st_rte st_r

st_r.ventana = st_cl.ventana
st_r.mle = t1.p1.mle_1
st_r.c_prof = st_cl.profe
st_r.empresa=st_cl.empresa
st_r.dw_pac=w_principal.dw_1
openwithparm(w_plant_rtf_borrar,st_r)

end event

type st_4 from statictext within w_notaspac
integer x = 1225
integer y = 524
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asunto:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_notaspac
integer x = 1184
integer y = 24
integer width = 2994
integer height = 676
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de notas"
end type

type dw_1 from datawindow within w_notaspac
integer x = 1221
integer y = 128
integer width = 2903
integer height = 400
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_notas_pac"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;t1.p1.mle_1.text=''
i_cambia_rte = TRUE
t1.p2.mle_2.text=''
sle_a.Text = ''
if RowCount() = 0 or currentrow = 0 then Return
sle_a.Text = GetItemString(GetRow(),'asunto')
string texto, td, doc
long nota
blob memo
td = getItemString(GetRow(),'tipodoc')
doc = getItemString(GetRow(),'documento')
nota = GetItemNumber(GetRow(),'num_nota')
SQLCA.Autocommit = True
selectblob solicitud into :memo from pacientesnotas
where tipodoc=:td and documento=:doc and num_nota=:nota;
if SQLCA.SQLCode = -1 then
	MessageBox('Error','Imposible traer campo Solicitud')
	SQLCA.Autocommit = False
	Return -1
end if
texto = string(memo)
if not(isNull(texto) or texto = '') then
	t1.p1.mle_1.text=texto
end if
selectblob nota_atiende into :memo from pacientesnotas
where tipodoc=:td and documento=:doc and num_nota=:nota;
if SQLCA.SQLCode = -1 then
	MessageBox('Error','Imposible traer campo Solicitud')
	SQLCA.Autocommit = False
	Return -1
end if
texto = string(memo)
if not(isNull(texto) or texto = '') then
	t1.p2.mle_2.text=texto
end if

cambio = FALSE

SQLCA.Autocommit = False

end event

event rowfocuschanging;int ret
if cambio then
	ret = MessageBox('Aviso','Se realizaron cambios. Desea guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_3.Event Clicked()
	elseif ret = 3 then
		Return -1
	end if
end if

end event

event retrieveend;if dw_1.RowCount() = 0 then
	t1.p1.mle_1.Enabled = FALSE
	sle_a.Enabled = FALSE
end if

end event

event itemchanged;cambio = TRUE
end event

event clicked;if dwo.type="text" then
choose case dwo.name
	case "num_nota_t"
		if ordenar[1]="num_nota A" then
			ordenar[1]="num_nota D"
		else
			ordenar[1]="num_nota A"
		end if
		this.setsort(ordenar[1])
	case "fingreso_t"
		if ordenar[2]="fingreso A" then
			ordenar[2]="fingreso D"
		else
			ordenar[2]="fingreso A"
		end if
		this.setsort(ordenar[2])
	case "fllamada_t"
		if ordenar[3]="fllamada A" then
			ordenar[3]="fllamada D"
		else
			ordenar[3]="fllamada A"
		end if
		this.setsort(ordenar[3])
	case "tipo_t"
		if ordenar[4]="tipo A" then
			ordenar[4]="tipo D"
		else
			ordenar[4]="tipo A"
		end if
		this.setsort(ordenar[4])
	case "codprof_t"
		if ordenar[5]="codprof A" then
			ordenar[5]="codprof D"
		else
			ordenar[5]="codprof A"
		end if
		this.setsort(ordenar[5])
	case "estado_t"
		if ordenar[6]="estado A" then
			ordenar[6]="estado D"
		else
			ordenar[6]="estado A"
		end if
		this.setsort(ordenar[6])
	case "fatiende_t"
		if ordenar[7]="fatiende A" then
			ordenar[7]="fatiende D"
		else
			ordenar[7]="fatiende A"
		end if
		this.setsort(ordenar[7])
end choose
this.sort()
end if

if row < 1 then Return
if GetRow() <> row then
	SetRow(Row)
end if

end event

