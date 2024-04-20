$PBExportHeader$uo_ctr_liqs.sru
forward
global type uo_ctr_liqs from userobject
end type
type rb_h from radiobutton within uo_ctr_liqs
end type
type rb_v from radiobutton within uo_ctr_liqs
end type
type em_1 from editmask within uo_ctr_liqs
end type
type st_2 from statictext within uo_ctr_liqs
end type
type st_3 from statictext within uo_ctr_liqs
end type
type cbx_1 from checkbox within uo_ctr_liqs
end type
type cbx_2 from checkbox within uo_ctr_liqs
end type
type pb_print from picturebutton within uo_ctr_liqs
end type
type cb_guarda from picturebutton within uo_ctr_liqs
end type
type dp_1 from datepicker within uo_ctr_liqs
end type
type dw_1 from datawindow within uo_ctr_liqs
end type
type dw_reg from datawindow within uo_ctr_liqs
end type
type dw_valor from datawindow within uo_ctr_liqs
end type
type dw_campo from datawindow within uo_ctr_liqs
end type
type dw_ls from datawindow within uo_ctr_liqs
end type
type dw_p from datawindow within uo_ctr_liqs
end type
type em_2 from editmask within uo_ctr_liqs
end type
end forward

global type uo_ctr_liqs from userobject
integer width = 3941
integer height = 1884
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
rb_h rb_h
rb_v rb_v
em_1 em_1
st_2 st_2
st_3 st_3
cbx_1 cbx_1
cbx_2 cbx_2
pb_print pb_print
cb_guarda cb_guarda
dp_1 dp_1
dw_1 dw_1
dw_reg dw_reg
dw_valor dw_valor
dw_campo dw_campo
dw_ls dw_ls
dw_p dw_p
em_2 em_2
end type
global uo_ctr_liqs uo_ctr_liqs

type variables
long PosX, PosY, altura, consec, max_level, alto_head
string i_campos, i_columnas, i_textos, i_comps, i_codplantilla, paciente, camposh
boolean cambio
date i_fecha
st_ordenes st_p
datawindowChild dwc_p

end variables

forward prototypes
public function integer borra_nuevo ()
public function string get_tipo (string campo)
public function integer resize (integer w, integer h)
public function integer getheader ()
public function string con_formula (string ls_formula, string ls_campo)
public function integer retrieve (string codplantilla)
end prototypes

public function integer borra_nuevo ();long f

f = dw_reg.Find('old=0',1,dw_reg.RowCount())
do while f > 0 
	dw_reg.DeleteRow(f)
	f = dw_reg.Find('old=0',1,dw_reg.RowCount())
loop
f = dw_valor.Find('old=0',1,dw_valor.RowCount())
do while f > 0 
	dw_valor.DeleteRow(f)
	f = dw_reg.Find('old=0',1,dw_valor.RowCount())
loop

Return 0

end function

public function string get_tipo (string campo);string tipo
if pos(campo,'seleccion') > 0 then
	tipo = 'S'
elseif pos(campo,'sino') > 0 then
	tipo = 'N'
elseif pos(campo,'lista') > 0 then
	tipo = 'L'
elseif pos(campo,'texto') > 0 then
	tipo= 'T'
elseif pos(campo,'numero') > 0 then
	tipo = 'R'
elseif pos(campo,'fecha') > 0 then
	tipo = 'F'
end if
Return tipo

end function

public function integer resize (integer w, integer h);dw_1.Height = h -280
dw_1.width = w - 50
//cb_guarda.x = dw_1.width + 32 - cb_guarda.Width
//pb_print.x = cb_guarda.x - pb_print.width - 20
Return 0

end function

public function integer getheader ();string sintaxis, buffer
blob sintaxdw
long p1, p2

selectblob encab_liquidos into :sintaxdw from lugar where codlugar=:clugar;
sintaxis = string(sintaxdw)
if isNull(sintaxis) or sintaxis = '' then Return 0
p1 = pos(sintaxis,'header(height=')
p2 = pos(sintaxis,' ',p1)
alto_head = long(mid(sintaxis, p1+14, p2 - p1 - 14))

p1 = pos(sintaxis,'bitmap(')
do while p1 > 0
	p2 = pos(sintaxis,'~r~n',p1)
	if p2 > 0 then
		buffer = mid(sintaxis,p1,p2 - p1 - 1)
		camposh = camposh + buffer +' ' +' visible="1~~tif(describe(~~"datawindow.print.preview~~")=~'yes~',1,0)" )' +'~r~n'
		p1 = pos(sintaxis,'bitmap(',p2)
	else
		p1 = 0
	end if
loop

p1 = pos(sintaxis,'text(')
do while p1 > 0
	p2 = pos(sintaxis,'~r~n',p1)
	if p2 > 0 then
		buffer = mid(sintaxis,p1,p2 - p1 - 1)
		camposh = camposh + buffer +' ' +' visible="1~~tif(describe(~~"datawindow.print.preview~~")=~'yes~',1,0)" )' +'~r~n'
		p1 = pos(sintaxis,'text(',p2)
	else
		p1 = 0
	end if
loop

Return 0

end function

public function string con_formula (string ls_formula, string ls_campo);string ls_column,ls_result,ls_oper,ls_null
long j,va,fin,k,fila

ls_null='if(isnull(' 
j=pos(ls_formula,'#',1)
do while j>0
	fin=len(ls_formula) +1
	k=pos(ls_formula,'/',j+1)
	if k<fin and k<>0 then fin=k
	k=pos(ls_formula,'*',j+1)
	if k<fin and k<>0 then fin=k
	k=pos(ls_formula,'-',j+1)
	if k<fin and k<>0 then fin=k
	k=pos(ls_formula,'+',j+1)
	if k<fin and k<>0 then fin=k
	k=pos(ls_formula,'(',j+1)
	if k<fin and k<>0 then fin=k
	k=pos(ls_formula,')',j+1)
	if k<fin and k<>0 then fin=k
	ls_column=mid(ls_formula,j,fin - j)
	ls_column=mid(ls_column,2)
	ls_oper=mid(ls_formula,fin,1)
	ls_result=ls_null+ls_campo+ls_column+"),0,"+ls_campo+ls_column+')'+ls_oper
	ls_formula=mid(ls_formula,1, j - 1 )+ls_result+mid(ls_formula,fin+1,len(ls_formula) +1)
	j=pos(ls_formula,'#',1)
loop
return ls_formula
end function

public function integer retrieve (string codplantilla);string sintaxis, err, n1,n2,a1,a2,rs
long i, subnivel, f
i_campos = ''
i_columnas = ''
i_textos = ''
i_comps =''
consec = 0
PosX = 10
PosY = 4
altura=0
dw_1.Reset()
consec = 1
i_codplantilla = codplantilla

dw_campo.Retrieve(codplantilla,sex_busca)
for i = 1 to dw_campo.RowCount()
	if dw_campo.GetItemNumber(i,'padre') = 0 then
		subnivel = dw_campo.Event max_nivel(dw_campo.GetItemNumber(i,'numcampo'),0)
		if subnivel > max_level then max_level = subnivel
	end if
next
if cbx_2.checked then
	getheader()
else
	alto_head = 0
end if
i_textos = i_textos + 'text(band=header alignment="2" text="horas" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + max_level*66 + alto_head)+'" height="180" width="200" html.valueishtml="0"  name=horas_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'	
i_campos = i_campos + 'column=(type=time updatewhereclause=yes name=horas dbname="horas")~r~n'
if consec=1 then
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="6" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="200" format="hh:mm" html.valueishtml="0"  name=horas Tag="0" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="400~tif(currentrow()=getrow(),700,400)"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="15780518~tif((hour(horas)>=0 and hour(horas)<=7) or( hour(horas)>=19 and hour(horas)<=23),rgb(230,189,192),rgb(187,233,255))" )~r~n'
else
    i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="6" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="300" format="hh:mm" html.valueishtml="0"  name=horas Tag="0" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="400~tif(currentrow()=getrow(),700,400)"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'	
end if
PosX = PosX + 213

SELECT Pacientes.Nombre1, Pacientes.Nombre2, Pacientes.Apellido1, Pacientes.Apellido2 into :n1,:n2,:a1,:a2
FROM Pacientes INNER JOIN Historial ON (Pacientes.Documento = Historial.Documento) AND (Pacientes.TipoDoc = Historial.TipoDoc)
WHERE ((Historial.Contador=:st_p.contador) AND (Historial.clugar=:st_p.clugar));
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF
paciente = ''
if not isNull(n1) then paciente = paciente + n1
if not isNull(n2) then paciente = paciente + ' ' + n2
if not isNull(a1) then paciente = paciente + ' ' + a1
if not isNull(a2) then paciente = paciente + ' ' + a2

consec = consec + 1
i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=etiqueta_0 dbname="etiqueta_0" initial="'+ paciente +'" )~r~n'
i_columnas = i_columnas + 'column(band=header id='+string(consec)+' alignment="2" tabsequence=0 border="6" color="33554432" x="'+String(PosX)+'" y="'+string(4 + alto_head)+'" height="56" width="'+string(dw_campo.Event ancho_hijos(0)/* - 10*/)+'" format="[general]" html.valueishtml="0"  name=etiqueta_0 Tag="0" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="134217739")~r~n'
if dw_campo.event revisar()=-1 THEN 
	return -1
end if

sintaxis = 'release 11.5;~r~n' + &
'datawindow(units=0 timer_interval=0 color=1073741824 processing=0 HTMLDW=no print.printername="" print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.canusedefaultprinter=yes print.prompt=no print.buttons=no print.preview.buttons=no print.cliptext=no print.overrideprintjob=no print.collate=yes print.preview.outline=yes hidegrayline=no grid.lines=0 )~r~n' +&
' header(height=260 color="536870912" )~r~n' +&
' summary(height=0 color="536870912" )~r~n' + &
' footer(height=72 color="536870912" )~r~n' +&
' detail(height=68 color="536870912" ) ~r~n' +&
'table('

i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=nuevo dbname="nuevo" initial="3")~r~n'
i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=control dbname="control" initial="")~r~n'
i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=modificado dbname="modificado" initial="0")~r~n'
sintaxis = sintaxis + i_campos + ') ~r~n'
sintaxis = sintaxis + 'group(level=1 header.height=0 trailer.height=60 by=("if(hour(horas) < 8,1,if(hour(horas) < 14,2,if(hour(horas) < 20,3,0)))" ) header.color="536870912" trailer.color="536870912" ) ~r~n'
sintaxis = sintaxis + i_columnas
sintaxis = sintaxis + camposh
sintaxis = sintaxis + i_textos
sintaxis = sintaxis + i_comps
//i_comps= '~r~n'+'compute(band=detail alignment="0" expression="'+ "if (isRowNew(),'S', 'N')" +'" border="0" color="0" x="4169" y="0" height="64" width="215" format="[GENERAL]" html.valueishtml="0"  name=modificado visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'+'~r~n'
//sintaxis = sintaxis + i_comps
dw_1.Create(sintaxis,err)
if err <> '' then
	messageBox('Error',err)
end if
err = dw_1.Modify('Datawindow.header.height="'+string((max_level + 1)*66 + 100 + alto_head)+'"')

dw_1.SetRedraw(FALSE)
dw_1.GroupCalc()
dw_1.SetRedraw(TRUE)

dp_1.SetValue(today(),now())
dp_1.TriggerEvent('ValueChanged')

Return 0

end function

on uo_ctr_liqs.create
this.rb_h=create rb_h
this.rb_v=create rb_v
this.em_1=create em_1
this.st_2=create st_2
this.st_3=create st_3
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.pb_print=create pb_print
this.cb_guarda=create cb_guarda
this.dp_1=create dp_1
this.dw_1=create dw_1
this.dw_reg=create dw_reg
this.dw_valor=create dw_valor
this.dw_campo=create dw_campo
this.dw_ls=create dw_ls
this.dw_p=create dw_p
this.em_2=create em_2
this.Control[]={this.rb_h,&
this.rb_v,&
this.em_1,&
this.st_2,&
this.st_3,&
this.cbx_1,&
this.cbx_2,&
this.pb_print,&
this.cb_guarda,&
this.dp_1,&
this.dw_1,&
this.dw_reg,&
this.dw_valor,&
this.dw_campo,&
this.dw_ls,&
this.dw_p,&
this.em_2}
end on

on uo_ctr_liqs.destroy
destroy(this.rb_h)
destroy(this.rb_v)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.pb_print)
destroy(this.cb_guarda)
destroy(this.dp_1)
destroy(this.dw_1)
destroy(this.dw_reg)
destroy(this.dw_valor)
destroy(this.dw_campo)
destroy(this.dw_ls)
destroy(this.dw_p)
destroy(this.em_2)
end on

type rb_h from radiobutton within uo_ctr_liqs
integer x = 2176
integer y = 72
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Horizontal"
boolean checked = true
end type

event clicked;dw_1.Modify("DataWindow.Print.Orientation=1")


end event

type rb_v from radiobutton within uo_ctr_liqs
integer x = 2176
integer y = 8
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Vertical"
end type

event clicked;dw_1.Modify("DataWindow.Print.Orientation=2")

end event

type em_1 from editmask within uo_ctr_liqs
event cambiando pbm_settext
integer x = 2551
integer y = 16
integer width = 233
integer height = 72
integer taborder = 70
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
boolean enabled = false
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 5
string minmax = "30~~250"
end type

event cambiando;IF long(text) <30 or long(text)>300 then return
dw_1.modify("datawindow.zoom="+this.text)
//colocapagin()

end event

event modified;IF long(THIS.text) <30 or long(THIS.text)>250 then
	messagebox("Atención","El valor es entre 30 y 250")
	this.text="100"
end if
dw_1.modify("datawindow.zoom="+text)
//colocapagin()

end event

type st_2 from statictext within uo_ctr_liqs
integer x = 2560
integer y = 88
integer width = 192
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tamaño"
boolean focusrectangle = false
end type

type st_3 from statictext within uo_ctr_liqs
integer x = 2843
integer y = 88
integer width = 155
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Zoom"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within uo_ctr_liqs
integer x = 3122
integer y = 8
integer width = 238
integer height = 64
integer taborder = 50
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Reglas"
end type

event clicked;if this.checked=true then
	dw_1.modify("datawindow.print.preview.rulers= 'Yes'")
else
	dw_1.modify("datawindow.print.preview.rulers= 'No'")
end if
end event

type cbx_2 from checkbox within uo_ctr_liqs
integer x = 3122
integer y = 76
integer width = 261
integer height = 52
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Preview"
end type

event clicked;
if this.checked then
	dw_1.Tag = '1'
	Retrieve(i_codplantilla)
	dw_1.modify("datawindow.print.preview= 'Yes'")
	if rb_h.checked then rb_h.Triggerevent(clicked!)
	if rb_v.checked then rb_v.Triggerevent(clicked!)
	pb_print.Enabled = TRUE
	rb_h.Enabled = TRUE
	rb_v.Enabled = TRUE
	em_1.Enabled = TRUE
	em_2.Enabled = TRUE
	cbx_1.Enabled = TRUE
else
	dw_1.Tag = '0'
	Retrieve(i_codplantilla)
	dw_1.modify("datawindow.print.preview= 'No'")
	em_1.Text = '100'
	em_1.TriggerEvent(modified!)
	em_2.Text = '100'
	em_2.TriggerEvent(modified!)
	pb_print.Enabled = FALSE
	rb_h.Enabled = FALSE
	rb_v.Enabled = FALSE
	em_1.Enabled = FALSE
	em_2.Enabled = FALSE
	cbx_1.Enabled = FALSE
end if

end event

type pb_print from picturebutton within uo_ctr_liqs
event mousemove pbm_mousemove
integer x = 3429
integer y = 8
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Guardar"
end type

event clicked;if MessageBox('Atención','Está seguro de imprimir el reporte?',Question!,yesno!) = 2 then Return
dw_1.print()

end event

type cb_guarda from picturebutton within uo_ctr_liqs
event mousemove pbm_mousemove
integer x = 3579
integer y = 8
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
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar"
end type

event clicked;dwItemStatus l_status
long i, col,fv,fr
string campo, valor, tipo
double dato, litem,nregistro,nregistrob
boolean haydatos, hayreg, nuevo
datetime fecha
if dw_1.acceptText() = -1 then Return -1
dw_1.SetRedraw(false)

if st_p.i_est_hadm<>'1' then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
select max(nregistro) into :nregistro from ENF_LIQ_REG
where contador=:st_p.contador and clugar=:st_p.clugar;
if isNull(nregistro) then nregistro = 0
dw_1.setfilter("nuevo=0 or nuevo=1")
dw_1.filter()
for i = 1 to dw_1.RowCount()
	fr=dw_reg.find("contador="+string(st_p.contador)+" and clugar='"+st_p.clugar+"' and fecha=datetime('"+string(datetime(i_fecha,time(dw_1.getitemtime(i,'horas'))))+"') and codplantilla='"+i_codplantilla+"'",1,dw_reg.rowcount())
	if fr=0 and dw_1.GetItemNumber(i,'nuevo') = 1 then 
		nregistro++	
		nuevo=true
		fr = dw_reg.InsertRow(0)
		dw_reg.SetItem(fr,'contador',st_p.contador)
		dw_reg.SetItem(fr,'clugar',st_p.clugar)
		dw_reg.SetItem(fr,'nregistro',nregistro)
		dw_reg.SetItem(fr,'fecha',datetime(i_fecha,time(dw_1.getitemtime(i,'horas'))))
		dw_reg.SetItem(fr,'codplantilla',i_codplantilla)
		dw_reg.SetItem(fr,'codprof',st_p.cprof)
		dw_reg.SetItem(fr,'cesp',st_p.cesp)
		dw_reg.SetItem(fr,'usuario',usuario)
		dw_reg.SetItem(fr,'control',0)
	else
		if dw_1.GetItemNumber(i,'control')>0 then 
			Continue
		else
			if dw_1.getitemnumber(i,'modificado')=1 or dw_1.getitemnumber(i,'modificado')=2 then
				nuevo=false
				nregistrob=dw_reg.GetItemNumber(fr,'control')
				if isnull(nregistrob) then nregistrob=0
				nregistrob++
				dw_reg.SetItem(fr,'control',nregistrob)
				setnull(nregistrob)
			else
				continue
			end if
		end if
	end if

	col = 1
	haydatos = FALSE
	campo = dw_1.Describe("#"+string(col)+".name")
	nregistrob=dw_reg.getitemnumber(fr,'nregistro')
	do while campo <> '!' and 	nregistrob=dw_reg.getitemnumber(fr,'nregistro')
		tipo = get_tipo(campo) 
		if not nuevo and ( tipo='R' or  tipo='S' or tipo='N' or tipo='L' or tipo='T' or tipo='F') then 
				nregistrob=dw_reg.getitemnumber(fr,'nregistro')
				litem=long(dw_1.Describe(campo+".tag"))	
				fv=dw_valor.find("contador="+string(st_p.contador)+" and clugar='"+st_p.clugar+"' and nregistro="+string(nregistrob)+" and item="+string(litem),1,dw_valor.rowcount())
		end if
		hayreg = FALSE
		if tipo='S' or tipo='N' or tipo='L' or tipo='T' then
			valor = dw_1.GetItemString(i,campo)
			if not isNull(valor) and valor <> '' then
				if nuevo then
					fv = dw_valor.InsertRow(0)
				end if
				dw_valor.SetItem(fv,'texto',valor)
				hayreg = TRUE
			else
			end if
		elseif tipo='R' then
			dato = dw_1.GetItemNumber(i,campo)
			l_status = dw_1.GetItemStatus(i, campo, Primary!)
			if l_status = NewModified! or l_status = DataModified! then
				if nuevo then
					fv = dw_valor.InsertRow(0)
				end if
				dw_valor.SetItem(fv,'numero',dato)
				hayreg = TRUE
			end if
		elseif tipo='F' then
			fecha = dw_1.GetItemDateTime(i,campo)
			if not isNull(fecha) then
				if nuevo then
					fv = dw_valor.InsertRow(0)
				end if
				dw_valor.SetItem(fv,'fecha',fecha)
				hayreg = TRUE
			end if
		end if
		if hayreg and nuevo then
			dw_valor.SetItem(fv,'contador',st_p.contador)
			dw_valor.SetItem(fv,'clugar',st_p.clugar)
			dw_valor.SetItem(fv,'nregistro',nregistro)
			dw_valor.SetItem(fv,'fecha',datetime(today(),now()))
			dw_valor.SetItem(fv,'item',long(dw_1.Describe(campo+".tag")))
			dw_valor.SetItem(fv,'tipo',tipo)
			haydatos = TRUE
		else
			if hayreg then haydatos = TRUE
		end if
		col++
		campo = dw_1.Describe("#"+string(col)+".name")
	loop

	if haydatos then
		if dw_reg.Update() = -1 then
			Rollback;
			Return -1
		end if
		if dw_valor.Update() = -1 then
			Rollback;
			Return -1
		end if
		commit;
	end if
next

cambio = FALSE
//dw_valor.Event muestra()
date l_fecha
time hora
//dw_1.reset()
dw_reg.Retrieve(st_p.contador,st_p.clugar,i_codplantilla,datetime(l_fecha,time('00:00')),datetime(RelativeDate(l_fecha, 1),time('00:00')))
dw_1.setfilter("")
dw_1.filter()
dw_1.SetRedraw(true)
dp_1.TriggerEvent('ValueChanged')
Return 0

end event

type dp_1 from datepicker within uo_ctr_liqs
integer x = 1577
integer y = 52
integer width = 466
integer height = 80
integer taborder = 20
boolean border = true
borderstyle borderstyle = styleraised!
datetimeformat format = dtfcustom!
string customformat = "dd/MMM/yyyy"
date maxdate = Date("2998-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2022-09-29"), Time("14:38:36.000000"))
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
weekday firstdayofweek = monday!
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;int ret, i, f
date l_fecha
time hora

getValue(l_fecha,hora)// = date(object.year(),object.month,object.day())
if cambio then 
	ret = MessageBox('Atención','Ha realizado cambios, Desea grabarlos?',QUESTION!,YESNOCANCEL!,3)
	if ret = 1 then
//			cb_guarda.Event clicked()
	elseif ret = 3 then
		setValue(datetime(i_fecha))
		Return
	else
		cambio = FALSE
	end if
end if
i_fecha = l_fecha
dw_1.setRedraw(FALSE)
dw_1.Reset()
//for i = 0 to 23
//	f = dw_1.InsertRow(0)
//	dw_1.SetItem(f,'horas',time(string(i)) )
//next
time horai,horaf
horai=time('00:00:00')
horaf=time('23:59:00')
DO WHILE horai < horaf
	f = dw_1.InsertRow(0)
	dw_1.SetItem(f,'horas',horai) 
	horai=relativetime(horai,900)
LOOP

dw_1.setRedraw(TRUE)

dw_valor.Reset()
dw_reg.Retrieve(st_p.contador,st_p.clugar,i_codplantilla,datetime(l_fecha,time('00:00')),datetime(RelativeDate(l_fecha, 1),time('00:00')))
dw_1.SetItem(1,'etiqueta_0',paciente+"  "+string(l_fecha))

end event

type dw_1 from datawindow within uo_ctr_liqs
integer x = 32
integer y = 148
integer width = 3863
integer height = 1596
integer taborder = 30
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;cambio = TRUE
if dw_1.getitemnumber(row,'nuevo')=3 then dw_1.setitem(row,'nuevo',1)
dw_1.setitem(row,'modificado',1)

end event

event clicked;if row > 0 then
	if row <> GetRow() then ScrolltoRow(row)
end if

end event

event buttonclicked;accepttext()


end event

type dw_reg from datawindow within uo_ctr_liqs
boolean visible = false
integer x = 69
integer y = 1780
integer width = 585
integer height = 76
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liq_reg"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event retrieveend;long i
for i = 1 to RowCount()
	dw_valor.Retrieve(GetItemNumber(i,'contador'),GetItemString(i,'clugar'),GetItemNumber(i,'nregistro'))
next
dw_valor.Event muestra()

end event

type dw_valor from datawindow within uo_ctr_liqs
event muestra ( )
boolean visible = false
integer x = 672
integer y = 1776
integer width = 503
integer height = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liq_valor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event muestra();long i, fila, col
string tipo

for i = 1 to RowCount()
	fila = dw_1.Find("horas="+string(time(GetItemDateTime(i,'fecha_reg'))),1, dw_1.rowcount())
//	fila = hour(time(GetItemDateTime(i,'fecha_reg'))) + 1
	col = GetItemNumber(i,'item')
	choose case GetItemString(i,'tipo')
		case 'S'
			if dw_1.Describe("seleccion_"+string(col)+".coltype") = '!' then 
				MessageBox('Error seleccion','El campo fue retirado de la plantilla '+string(col)) //Continue
				Continue
			end if
			dw_1.SetItem(fila,'seleccion_'+string(col),GetItemString(i,'texto'))
		case 'L'
			if dw_1.Describe("lista_"+string(col)+".coltype") = '!' then 
				MessageBox('Error lista','El campo fue retirado de la plantilla '+string(col)) //Continue
				Continue
			end if
			dw_1.SetItem(fila,'lista_'+string(col),GetItemString(i,'texto'))
		case 'T'
			if dw_1.Describe("texto_"+string(col)+".coltype") = '!' then 
				MessageBox('Error texto','El campo fue retirado de la plantilla '+string(col)) //Continue
				Continue
			end if
			dw_1.SetItem(fila,'texto_'+string(col),GetItemString(i,'texto'))
		case 'N'
			if dw_1.Describe("sino_"+string(col)+".coltype") = '!' then 
				MessageBox('Error sino','El campo fue retirado de la plantilla '+string(col)) //Continue
				Continue
			end if
			dw_1.SetItem(fila,'sino_'+string(col),GetItemString(i,'texto'))
		case 'R'
			if dw_1.Describe("numero_"+string(col)+".coltype") = '!' then 
				MessageBox('Error numero','El campo fue retirado de la plantilla '+string(col)) //Continue
				Continue
			end if
			dw_1.SetItem(fila,'numero_'+string(col),GetItemNumber(i,'numero'))
		case 'F'
			if dw_1.Describe("fecha_"+string(col)+".coltype") = '!' then 
				MessageBox('Error fecha','El campo fue retirado de la plantilla '+string(col)) //Continue
				Continue
			end if
			dw_1.SetItem(fila,'fecha_'+string(col),GetItemDateTime(i,'fecha'))
	end choose
	dw_1.SetItem(fila,'nuevo',0)
	 if dw_1.getitemtime(fila,"horas") <= time(relativetime(now(), -15)) then
		dw_1.SetItem(fila,'control',1)
		dw_1.SetItem(fila,'modificado',2)
	 end if 
next

end event

event constructor;SetTransObject(SQLCA)

end event

event retrievestart;Return 2

end event

type dw_campo from datawindow within uo_ctr_liqs
event type integer addcontrol ( integer fila,  integer nivel )
event type integer addchildren ( string padre,  integer nivel )
event type integer revisar ( )
event type integer max_nivel ( long padre,  long nivel )
event type long ancho_hijos ( integer padre )
boolean visible = false
integer x = 1211
integer y = 1780
integer width = 946
integer height = 76
boolean bringtotop = true
string title = "none"
string dataobject = "dw_plan_campos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer addcontrol(integer fila, integer nivel);string modifica, nombre, medida, limites, agregado, muestracol
long i, ncampo
double vmin, vmax

ncampo = GetItemNumber(fila,'numcampo')
nombre = GetItemString(fila,'descampo')
agregado = GetItemString(fila,'agregado')
vmin = GetItemNumber(fila,'num_min')
vmax = GetItemNumber(fila,'num_max')
muestracol = GetItemString(fila,'diagprin')
if isnull(medida) then medida=''
if isnull(nombre) then nombre='campo '+string(ncampo)
////Tipo de Control
// Etiqueta
if GetItemString(fila,'tipo') = 'E' then 
	consec = consec + 1
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=etiqueta_'+string(ncampo)+' dbname="etiqueta_'+string(ncampo)+'" initial="'+nombre+'" )~r~n'
	i_columnas = i_columnas + 'column(band=header id='+string(consec)+' alignment="2" tabsequence=0 border="6" color="33554432" x="'+String(PosX)+'" y="'+string(4 + (nivel )*66 + alto_head)+'" height="56" width="'+string(Event ancho_hijos(ncampo) - 10)+'" format="[general]" html.valueishtml="0"  name=etiqueta_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="15793151")~r~n'
end if

// Seleccion
if GetItemString(fila,'tipo') = 'S' then 
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="300" html.valueishtml="0"  name=selec_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'	
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=seleccion_'+string(ncampo)+' dbname="seleccion_'+string(ncampo)+'" values="	1/	0" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="300" format="[general]" html.valueishtml="0" protect="0~tif(nuevo=1 or control=0,0,1)"  name=seleccion_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" checkbox.text="" checkbox.on="1" checkbox.off="0" checkbox.scale=no checkbox.threed=yes  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" )~r~n'
	PosX = PosX + 303
end if

// Si / No
if GetItemString(fila,'tipo') = 'N' then
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="300" html.valueishtml="0"  name=sino_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'	
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=sino_'+string(ncampo)+' dbname="sino_'+string(ncampo)+'" values="Si	1/No	0/" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="300" format="[general]" html.valueishtml="0" protect="0~tif(nuevo=1 or control=0,0,1)" name=sino_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" radiobuttons.columns=2 radiobuttons.scale=no radiobuttons.threed=yes  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )" font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" )~r~n'
	PosX = PosX + 303
end if

// Lista
if GetItemString(fila,'tipo') = 'L' then
	dw_ls.Retrieve(GetItemString(fila,'codplantilla'),GetItemNumber(fila,'numcampo'))
	for i = 1 to dw_ls.RowCount()
		modifica = modifica + dw_ls.GetItemString(i,'descripcion') + "~t" + string(dw_ls.GetItemNumber(i,'nitem')) + "/"
	next
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="420" html.valueishtml="0"  name=lista_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'	
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=lista_'+string(ncampo)+' dbname="lista_'+string(ncampo)+'" values="'+modifica+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="420" format="[general]" html.valueishtml="0" protect="0~tif(nuevo=1 or control=0,0,1)" name=lista_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" ddlb.limit=0 ddlb.allowedit=no ddlb.case=any ddlb.vscrollbar=yes ddlb.useasborder=no  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )" font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" )~r~n'
	PosX = PosX + 420
end if

// texto
if GetItemString(fila,'tipo') = 'T' then		
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="300" html.valueishtml="0"  name=texto_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=texto_'+string(ncampo)+' dbname="texto_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="300" format="[general]" html.valueishtml="0" protect="0~tif(nuevo=1 or control=0,0,1)" name=texto_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=255 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autovscroll=yes edit.vscrollbar=yes  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" )~r~n'
	PosX = PosX + 303
end if

// Numerico o //computado
if GetItemString(fila,'tipo') = 'R' or GetItemString(fila,'tipo') = 'C' then
	consec = consec + 1
	if not isNull(vmin) and not isNull(vmin) and (vmin < vmax) then
		limites = 'validation="dec(getText()) >= '+string(vmin) + ' and dec(getText()) <= '+string(vmax) +'"'
	else
		limites=''
	end if
	If GetItemString(fila,'tipo') = 'R' then
		i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="350" html.valueishtml="0"  name=numero_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'
		i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=numero_'+string(ncampo)+' dbname="numero_'+string(ncampo)+'" '+limites+' )~r~n'
		i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0" protect="0~tif(nuevo=1 or control=0,0,1)" name=numero_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1"  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" )~r~n'
	Else
		i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="350" html.valueishtml="0"  name=numero_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'
		i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=numero_'+string(ncampo)+' dbname="numero_'+string(ncampo)+'" '+limites+' )~r~n'
		string form
		form=	con_formula(GetItemString(fila,'formula'),'numero_')
		i_comps = i_comps + 'compute(band=detail alignment="2" expression="'+form+'" border="5" color="0" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0"  name=compute_'+string(consec)+' visible="1"  font.face="Tahoma" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="0" background.color="16777215~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" ) ~r~n'
	End If
	i_textos = i_textos +'text(band=footer alignment="0" text="Totales" border="6" color="0" x="5" y="0" height="52" width="210" html.valueishtml="0"  name=t_total visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="15780518" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'
	PosX = PosX + 350
	if agregado = '1' then  // Promedio
		if muestracol = '1' then
			If GetItemString(fila,'tipo') = 'R' then
				i_textos = i_textos + 'text(band=header alignment="2" text="Prom '+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="350" html.valueishtml="0"  name=numero_tot_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="15780518" )~r~n'
				i_columnas = i_columnas + 'compute(band=detail alignment="2" expression="cumulativesum(numero_'+string(ncampo)+')/cumulativeSum(if(not isNull(numero_'+string(ncampo)+'),1,0))" border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0" name=numero_tot_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" )~r~n'
				i_columnas = i_columnas + 'compute(band=footer alignment="2" expression="cumulativesum(numero_'+string(ncampo)+')/cumulativeSum(if(not isNull(numero_'+string(ncampo)+'),1,0))" border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0" name=numerot_tot_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" )~r~n'
			End If
			PosX = PosX + 350
		end if
	    i_comps = i_comps + 'compute(band=trailer.1 alignment="2" expression="avg(numero_'+string(ncampo)+' for group 1)" border="0" color="0" x="'+String(PosX - 263 )+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0"  name=compute_'+string(ncampo)+' visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" ) ~r~n'
	elseif agregado = '2' then
		if muestracol = '1' then
			If GetItemString(fila,'tipo') = 'R' then
				i_textos = i_textos + 'text(band=header alignment="2" text="Acum '+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="350" html.valueishtml="0"  name=numero_tot_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="15780518" )~r~n'
				i_columnas = i_columnas + 'compute(band=detail alignment="2" expression="cumulativesum(numero_'+string(ncampo)+')" border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0" name=numero_tot_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" )~r~n'
				i_columnas = i_columnas + 'compute(band=footer alignment="2" expression="cumulativesum(numero_'+string(ncampo)+') for all" border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0" name=numerot_tot_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( nuevo=0 ,if(control=0, rgb(220,192,192), rgb(204,230,230)), RGB(255,255,255))" )~r~n'
			End If
			PosX = PosX + 350
		end if
		If GetItemString(fila,'tipo') = 'R' then
	    		i_comps = i_comps + 'compute(band=trailer.1 alignment="2" expression="sum(numero_'+string(ncampo)+' for group 1)" border="0" color="0" x="'+String(PosX -263 )+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0"  name=compute_'+string(ncampo)+' visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" ) ~r~n'
			i_comps = i_comps + 'compute(band=footer alignment="2" expression="sum(compute_'+string(ncampo)+' for all)" border="0" color="0" x="'+String(PosX -263 )+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0"  name=computet_'+string(ncampo)+' visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" ) ~r~n'
		Else
		    	i_comps = i_comps + 'compute(band=trailer.1 alignment="2" expression="sum(compute_'+string(consec)+' for group 1)" border="0" color="0" x="'+String(PosX -263 )+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0"  name=compute_'+string(ncampo)+' visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" ) ~r~n'
		 	i_comps = i_comps + 'compute(band=footer alignment="2" expression="sum(compute_'+string(consec)+' for all)" border="0" color="0" x="'+String(PosX -263 )+'" y="'+string(PosY)+'" height="56" width="350" format="#,##0.00" html.valueishtml="0"  name=computet_'+string(ncampo)+' visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" ) ~r~n'
		End If	
end if
end if

// Fecha
if GetItemString(fila,'tipo') = 'F' then 
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="340" html.valueishtml="0"  name=fecha_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'
	i_campos = i_campos + 'column=(type=datetime updatewhereclause=yes name=fecha_'+string(ncampo)+'  dbname="fecha_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="340" format="dd/mm/yyyy" html.valueishtml="0" protect="0~tif(nuevo=1 or control=0,0,1)" name=fecha_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" editmask.spin=yes editmask.mask="dd/mm/yyyy" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( nuevo=0,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
	PosX = PosX + 350
end if

Return 0

end event

event type integer addchildren(string padre, integer nivel);long fila, f, i, cant
integer ret
st_uobject st_uo
string modifica, texto

fila = dw_campo.Find("padre=" + padre,1,dw_campo.RowCount())
do while fila > 0
	cant = cant + 1
	if Event addControl(fila,nivel) = -1 then
		MessageBox('Error','Error Adicionando control')
		Return -1
	end if
	ret = Event addChildren(String(dw_campo.GetItemNumber(fila,'numcampo')), Nivel + 1)
	if fila = dw_campo.RowCount() then EXIT
	fila = dw_campo.Find("padre=" + padre,fila + 1,dw_campo.RowCount())
loop
Return cant

end event

event type integer revisar();if rowcount() = 0 then Return -1
integer i, f, nivel = 1, col = 0
long padre,f_pad, subnivel

for i = 1 to this.RowCount()
	padre=GetItemNumber(i,'padre')
	f_pad=find('numcampo='+string(padre),1,rowcount())
	if isnull(padre) or (f_pad=0 and padre<>0 ) then 
		MessageBox('Atención','La plantilla tiene campos errónes, revisela para poder trabajar con ella (Hay campos que no tienen campo padre)')
		return -1
	end if
	if padre<>0 then
		if getitemstring(f_pad,'tipo')<>'E' then
			MessageBox('Atención','La plantilla tiene campos errónes, revisela para poder trabajar con ella (Hay campos cuyo padre no es etiqueta)')
			return -1
		end if
	end if
	if padre = 0 then
		if event addControl(i,nivel) = -1 then
			MessageBox('Error','Error Adicionando control')
			Return -1
		end if
		// Children
		event addChildren(String(this.GetItemNumber(i,'numcampo')), Nivel + 1)
	end if
next
return 1

end event

event type integer max_nivel(long padre, long nivel);long f, fila, subnivel, max

max = nivel
fila = dw_campo.Find("padre=" + string(padre),1,dw_campo.RowCount())
do while fila > 0
	subnivel = Event max_nivel(GetItemNumber(fila,'numcampo'),nivel + 1)
	if subnivel > max then max = subnivel
	if fila = dw_campo.RowCount() then EXIT
	fila = dw_campo.Find("padre=" + string(padre),fila + 1,dw_campo.RowCount())
loop
Return max

end event

event type long ancho_hijos(integer padre);long f, fila, l_ancho, campo
string tipo

fila = dw_campo.Find("padre=" + string(padre),1,dw_campo.RowCount())
do while fila > 0
	tipo = GetItemString(fila,'tipo')
	choose case tipo
		case 'S' 
			campo = 300
		case 'N' 
			campo = 300
		case 'L' 
			campo = 421
		case 'T' 
			campo = 400
		case 'R' 
			if (GetItemString(fila,'agregado') = '1' or GetItemString(fila,'agregado') = '2') and GetItemString(fila,'diagprin') = '1' then
				campo = 350 * 2
			else
				campo = 350
			end if
		case 'F' 
			campo = 350
		case 'C' 
			campo = 350	
	end choose
	l_ancho = l_ancho + campo + Event ancho_hijos(GetItemNumber(fila,'numcampo'))
	if fila = dw_campo.RowCount() then EXIT
	fila = dw_campo.Find("padre=" + string(padre),fila + 1,dw_campo.RowCount())
loop
Return l_ancho

end event

event constructor;setTransObject(SQLCA)

end event

type dw_ls from datawindow within uo_ctr_liqs
boolean visible = false
integer x = 2185
integer y = 1772
integer width = 686
integer height = 76
boolean bringtotop = true
string title = "none"
string dataobject = "dw_plan_lista"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type dw_p from datawindow within uo_ctr_liqs
integer x = 37
integer width = 1495
integer height = 128
integer taborder = 10
string title = "none"
string dataobject = "dw_ext_plants"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
GetChild('codplantilla',dwc_p)
dwc_p.SetTransObject(SQLCA)
InsertRow(0)
end event

event itemchanged;int ret
if cambio then 
	ret = MessageBox('Atención','Ha realizado cambios, Desea grabarlos?',QUESTION!,YESNOCANCEL!,3)
	if ret = 1 then
			cb_guarda.Event clicked()
	elseif ret = 3 then
		setText(i_codplantilla)
		Return 2
	else
		cambio = FALSE
	end if
end if
parent.Retrieve(data)


end event

event retrieveend;if dwc_p.Retrieve('L',st_p.cesp,sex_busca) = 0 then
	dwc_p.InsertRow(0)
end if

end event

type em_2 from editmask within uo_ctr_liqs
event cambiando pbm_settext
integer x = 2816
integer y = 16
integer width = 233
integer height = 72
integer taborder = 60
string dragicon = "none!"
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
boolean enabled = false
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 5
string minmax = "30~~250"
end type

event cambiando;IF long(text) <30 or long(text)>300 then return
dw_1.modify("datawindow.print.preview.zoom="+this.text)

end event

event modified;IF long(THIS.text) <30 or long(THIS.text)>300 then
	messagebox("Atención","El valor es entre 30 y 300")
	this.text="100"
end if
dw_1.modify("datawindow.print.preview.zoom="+this.text)
//pb_rep.zoom=long(text)

end event

