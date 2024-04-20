$PBExportHeader$w_graph_gral.srw
forward
global type w_graph_gral from window
end type
type sle_1 from statictext within w_graph_gral
end type
type dw_temp from datawindow within w_graph_gral
end type
type dw_detrep from datawindow within w_graph_gral
end type
type pb_retri from picturebutton within w_graph_gral
end type
type cb_1 from commandbutton within w_graph_gral
end type
type pb_3 from picturebutton within w_graph_gral
end type
type pb_2 from picturebutton within w_graph_gral
end type
type pb_1 from picturebutton within w_graph_gral
end type
type em_3 from editmask within w_graph_gral
end type
type st_6 from statictext within w_graph_gral
end type
type em_2 from editmask within w_graph_gral
end type
type em_1 from editmask within w_graph_gral
end type
type st_5 from statictext within w_graph_gral
end type
type st_4 from statictext within w_graph_gral
end type
type st_3 from statictext within w_graph_gral
end type
type st_2 from statictext within w_graph_gral
end type
type sle_4 from singlelineedit within w_graph_gral
end type
type cbx_1 from checkbox within w_graph_gral
end type
type st_1 from statictext within w_graph_gral
end type
type dw_rep from datawindow within w_graph_gral
end type
type gb_1 from groupbox within w_graph_gral
end type
end forward

global type w_graph_gral from window
integer width = 3616
integer height = 1796
boolean titlebar = true
string title = "Gráficas"
string menuname = "m_graph"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "grafico.ico"
string pointer = "Arrow!"
event colocapagin pbm_open
event inicialize pbm_open
event copy_to_clipboard pbm_custom03
event graph_color pbm_custom06
event graph_title pbm_custom02
event graph_type pbm_custom01
event openfile ( )
event setfields ( )
event spacing pbm_custom04
event getdata ( )
event setconsulta ( )
event setparms ( )
event guardar ( )
event guardarcomo ( )
event nuevo ( )
sle_1 sle_1
dw_temp dw_temp
dw_detrep dw_detrep
pb_retri pb_retri
cb_1 cb_1
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
em_3 em_3
st_6 st_6
em_2 em_2
em_1 em_1
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
sle_4 sle_4
cbx_1 cbx_1
st_1 st_1
dw_rep dw_rep
gb_1 gb_1
end type
global w_graph_gral w_graph_gral

type variables
string cod_rep='',cod_doc='',des_arch, is_filename, is_fullname
uo_param param[]
st_graph st_gr
st_graph_atu st_pg

end variables

forward prototypes
public subroutine colocapagin ()
public subroutine f_filtrar (integer cual)
public function integer inicialize (string sintaxis)
public function integer setsyntax ()
end prototypes

event copy_to_clipboard;// Copy the graph to the Windows Clipboard.
string objs
objs = dw_rep.Describe("Datawindow.Objects")
if match(lower(objs),'gr_1') then
	dw_rep.ClipBoard("gr_1")
end if

end event

event graph_color;SetPointer(HourGlass!)

//open the change color window and pass the graph to it in the 
//message.powerobjectparm
string objs
objs = dw_rep.Describe("Datawindow.Objects")
if match(lower(objs),'gr_1') then
	OpenWithParm (w_graph_color, dw_rep)
end if

end event

event graph_title;SetPointer(HourGlass!)
string objs
objs = dw_rep.Describe("Datawindow.Objects")
if match(lower(objs),'gr_1') then
	OpenWithParm (w_graph_title, dw_rep)
end if

end event

event graph_type;SetPointer(HourGlass!)

// Open the response window to set the graph type. Pass it the graph
// object and it will do the rest.
string objs
objs = dw_rep.Describe("Datawindow.Objects")
if match(lower(objs),'gr_1') then
	OpenWithParm (w_graph_type, dw_rep)
end if

end event

event openfile();
int li_fileid, loops, i, flen, byte
string row_dw

SetPointer (HourGlass!)
if GetFileOpenName ("Open", is_fullname, is_filename, "grf", &
							"graficos GCI (*.grf),*.grf") < 1 then return

flen = FileLength(is_fullname)
li_fileid = FileOpen (is_fullname, TextMode!)


FileReadex(li_fileid, row_dw)

FileClose (li_fileid)

this.title = Upper (is_filename)

inicialize(row_dw)

end event

event setfields();SetPointer(HourGlass!)

//open the change color window and pass the graph to it in the 
//message.powerobjectparm
string objs
objs = dw_rep.Describe("Datawindow.Objects")
if match(lower(objs),'gr_1') then
	OpenWithParm (w_graph_conf, dw_rep)
end if

end event

event spacing;SetPointer(HourGlass!)

// Open the response window to set spacing. Pass it the graph so it
// can make changes.
string objs
objs = dw_rep.Describe("Datawindow.Objects")
if match(lower(objs),'gr_1') then
	OpenWithParm (w_graph_spacing, dw_rep)
end if

end event

event getdata();dw_rep.Retrieve()

end event

event setconsulta();string objs
objs = dw_rep.Describe("Datawindow.Objects")
if match(lower(objs),'gr_1') then
	openwithparm(w_gr_consulta,st_gr)
else
	messageBox('Aviso',"Seleccione 'Nuevo' desde la barra de herramientas o el menu, para definir una nueva gráfica")
end if

end event

event setparms();string objs
objs = dw_rep.Describe("Datawindow.Objects")
if match(lower(objs),'gr_1') then
	openwithparm(w_gr_parms, st_gr)
end if

end event

event guardar();string sintaxis
int li_rc

sintaxis = dw_rep.Describe("DataWindow.Syntax")
if is_fullname = '' then
	this.TriggerEvent('guardarcomo')
else
	long largo,archivo,cuantos_bytes
	largo = len(sintaxis)
	
	archivo = fileopen(is_fullname,StreamMode!,write!,shared!,replace!)
	do while largo > 0 
		cuantos_bytes=filewrite(archivo,mid(sintaxis,len(sintaxis) -largo +1,32765))
		largo = largo - 32765
	loop
	fileclose(archivo)	
End If

end event

event guardarcomo();string sintaxis, ls_path, ls_file
int li_rc

sintaxis = dw_rep.Describe("DataWindow.Syntax")

li_rc = GetFileSaveName( "Seleccionar Archivo", is_fullname, is_filename, "GRF", "Gráficos GCI(*.GRF),*.GRF;All Files (*.*),*.*" , dir_insta, 32770)

IF li_rc = 1 Then
	long largo,archivo,cuantos_bytes
	largo = len(sintaxis)
	
	archivo = fileopen(is_fullname,StreamMode!,write!,shared!,replace!)
	do while largo > 0 
		cuantos_bytes=filewrite(archivo,mid(sintaxis,len(sintaxis) -largo +1,32765))
		largo = largo - 32765
	loop
	fileclose(archivo)
	
End If

end event

event nuevo();openwithparm(w_gr_consulta,st_gr)

end event

public subroutine colocapagin ();string todo,bb
bb = dw_rep.Describe("DataWindow.FirstRowOnPage")
if bb="!" then return
if dw_rep.rowcount() < 1 then return
todo = "Pag Horizontal~n~r " + string(dw_rep.getitemnumber(1,"pagin_horiz")) + " de "
todo = todo + string(dw_rep.getitemnumber(1,"pagin_horizde"))
st_6.text=todo
sle_1.text=string(dw_rep.getitemnumber(long(bb),"pagin")) + "/" + string(dw_rep.getitemnumber(1,"pagin_de"))

end subroutine

public subroutine f_filtrar (integer cual);choose case param[cual].dw_1.getitemstring(1,'tipo')
	case '4'//dw_s
		choose case param[cual -1].dw_1.getitemstring(1,'tipo')
			case '1'
				param[cual].dw_s.setfilter('#3="'+param[cual -1].dw_1.getitemstring(1,'param_s')+'"')
				param[cual].dw_s.filter()
				param[cual].dw_s.insertrow(1)
				param[cual].dw_s.setitem(1,1,'%')
				param[cual].dw_s.setitem(1,2,'[Todos]')
			case '4'
				param[cual].dw_s.setfilter('#3="'+param[cual -1].dw_s.getitemstring(param[cual -1].dw_s.getrow(),1)+'"')
				param[cual].dw_s.filter()
				param[cual].dw_s.insertrow(1)
				param[cual].dw_s.setitem(1,1,'%')
				param[cual].dw_s.setitem(1,2,'[Todos]')
		end choose
	case '5'//dw_n
		choose case param[cual -1].dw_1.getitemstring(1,'tipo')
			case '2'
				param[cual].dw_n.setfilter('#3='+string(param[cual -1].dw_1.getitemnumber(1,'param_n')))
				param[cual].dw_n.filter()
			case '5'
				param[cual].dw_n.setfilter('#3='+string(param[cual -1].dw_n.getitemnumber(param[cual -1].dw_n.getrow(),1)))
				param[cual].dw_n.filter()
		end choose
end choose
end subroutine

public function integer inicialize (string sintaxis);string error_create
long donde, posic

dw_rep.Create(sintaxis, error_create)
IF Len(error_create) > 0 THEN
	MessageBox ("Error Creación", error_create)
	Return -1
END IF

dw_rep.taborder=200
string parametros,sql,sintax,err, argumentos
parametros = dw_rep.describe('datawindow.table.arguments')
st_gr.args.setParm(dw_rep.describe('datawindow.table.arguments'))
//argumentos = parametros
//do while TRUE
//	posic = pos(argumentos,'~n')
//	if posic = 0 then EXIT
//	argumentos = Replace(argumentos,posic,1,'),("')
//loop
//do while TRUE
//	posic = pos(argumentos,'~t')
//	if posic = 0 then EXIT
//	argumentos = Replace(argumentos,posic,1,'",')
//loop

long j,k,pos=0,i
string t1,t2,tipo

for k = 1 to upperBound(param[])
	if isvalid(param[k]) then
		CloseUserObject(param[k])
		destroy(param[k])
	end if
next
k=f_count_text(parametros,"	")//tabs
if k>0 and not isValid(st_pg) then
	parametros+="~n"
	dw_rep.y = 240
else
	dw_rep.y = 110
end if
long asumar=0
for j=1 to k
	t1=mid(parametros,pos +1,pos(parametros,'	',pos +1) -pos -1)
	pos=pos(parametros,'	',pos +1)
	t2=mid(parametros,pos +1 ,pos(parametros,"~n",pos) - pos -1)
	pos=pos(parametros,"~n",pos)
	donde=dw_detrep.find('nro_param='+string(j),1,dw_detrep.rowcount())
	this.openuserobject(param[j], asumar, 108)//(j -1) * 370
	if t2='datetime' then
		asumar+=488
	else
		param[j].width=364
		asumar+=364
	end if
	param[j].taborder=100 + j
	param[j].st_label.text=t1
	sql=''
	tipo=''
	if donde<>0 then
		
		if dw_detrep.getitemnumber(donde,'filtro_de')>0 then
			param[dw_detrep.getitemnumber(donde,'filtro_de')].ids_filtro_de.insertrow(1)
			param[dw_detrep.getitemnumber(donde,'filtro_de')].ids_filtro_de.setitem(1,1,j)
		end if
		
		//param[j].filtro_de=dw_detrep.getitemnumber(donde,'filtro_de')
		tipo=dw_detrep.getitemstring(donde,'tipo')
		if tipo='S' then sql=dw_detrep.getitemstring(donde,'sql')
	end if
	choose case t2
		case 'string','character'
			param[j].dw_1.setitem(1,'tipo','1')
			param[j].dw_1.setcolumn('param_s')
			if tipo<>'' then
				param[j].dw_1.setitem(1,'tipo','4')
				sqlca.AutoCommit=true
				if tipo='S' then
					sintax=sqlca.syntaxfromsql (sql, '', err)
				else
					sintax=sqlca.syntaxfromsql ("select datotxt,descripcion,datotxt from rep_admlista where cod_rep='"+cod_rep+"' and nro_param="+string(j)+" order by item", '', err)
				end if
				sqlca.AutoCommit=false
				i=dw_temp.create(sintax)
				dw_temp.settransobject(sqlca)
				if dw_temp.retrieve()>0 then
					i=dw_temp.rowscopy(1, dw_temp.rowcount(), primary!, param[j].dw_s, 1, primary!)
				end if
				param[j].dw_s.insertrow(1)
				param[j].dw_s.setitem(1,1,'%')
				param[j].dw_s.setitem(1,2,'[Todos]')
				param[j].dw_1.setcolumn('param_dws')
			end if
		case 'number'
			param[j].dw_1.setitem(1,'tipo','2')
			param[j].dw_1.setcolumn('param_n')
			if tipo<>'' then
				param[j].dw_1.setitem(1,'tipo','5')
				sqlca.AutoCommit=true
				if tipo='S' then
					sintax=sqlca.syntaxfromsql (sql, '', err)
				else
					sintax=sqlca.syntaxfromsql ("select datonum,descripcion,datonum from rep_admlista where cod_rep='"+cod_rep+"' and nro_param="+string(j)+" order by item", '', err)
				end if
				sqlca.AutoCommit=false
				i=dw_temp.create(sintax)
				dw_temp.settransobject(sqlca)
				if dw_temp.retrieve()>0 then
					dw_temp.rowscopy(1, dw_temp.rowcount(), primary!, param[j].dw_n, 1, primary!)
				end if
				param[j].dw_1.setcolumn('param_dwn')
			end if
		case 'datetime'
			param[j].dw_1.setitem(1,'tipo','3')
			param[j].dw_1.setitem(1,'param_d',datetime(today()))
			param[j].dw_1.setcolumn('param_d')
		case 'date'
			param[j].dw_1.setitem(1,'tipo','6')
			param[j].dw_1.setitem(1,'param_d2',today())
			param[j].dw_1.setcolumn('param_d2')
		case 'time'
			param[j].dw_1.setitem(1,'tipo','7')
			param[j].dw_1.setitem(1,'param_t',now())
			param[j].dw_1.setcolumn('param_t')
	end choose
next
if k>0 then param[1].dw_1.setfocus()
dw_rep.settransobject(sqlca)
dw_rep.modify("datawindow.print.preview= 'Yes'")
//dw_rep.modify("datawindow.units=3")
//dw_rep.modify("datawindow.zoom="+string(tamimp))
//dw_rep.modify("datawindow.print.quality="+string(calimp))
//dw_rep.modify("datawindow.print.paper.source="+string(fuepap))
//dw_rep.modify("datawindow.print.margin.right="+string(margder *100))
//dw_rep.modify("datawindow.print.margin.left="+string(margizq *100))
//dw_rep.modify("datawindow.print.margin.top="+string(marsup *100))
//dw_rep.modify("datawindow.print.margin.bottom="+string(marinf *100))
//dw_rep.modify("datawindow.print.orientation="+string(orientacion))
//dw_rep.modify("datawindow.print.paper.size="+string(tampap))
//em_1.text=string(tamimp)
em_1.triggerevent(modified!)
em_2.triggerevent(modified!)
string modstring
modstring = 'create compute(band=header alignment="0" expression="pageAcross()"border="0" color="0" x="1138" y="20" height="76" width="256" format="[GENERAL]"  name=pagin_horiz visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
dw_rep.modify(modstring)
modstring = 'create compute(band=header alignment="0" expression="pagecountAcross()"border="0" color="0" x="1138" y="20" height="76" width="256" format="[GENERAL]"  name=pagin_horizde visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
dw_rep.modify(modstring)
modstring = 'create compute(band=footer alignment="0" expression="page()"border="0" color="0" x="18" y="4" height="76" width="256" format="[GENERAL]"  name=pagin visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
dw_rep.modify(modstring)
modstring = 'create compute(band=header alignment="0" expression="pagecount()"border="0" color="0" x="1138" y="20" height="76" width="256" format="[GENERAL]"  name=pagin_de visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
dw_rep.modify(modstring)
colocapagin()
Return 0

end function

public function integer setsyntax ();string error_syntaxfromSQL, error_create, args, condicion, sintaxis
long l_cond, ll_pos


string crea_gr, modstring

sintaxis = dw_rep.Describe("Datawindow.syntax")
if inicialize(sintaxis) = -1 then
	Return -1
end if

modstring = 'create compute(band=header alignment="0" expression="pageAcross()"border="0" color="0" x="1138" y="20" height="76" width="256" format="[GENERAL]"  name=pagin_horiz visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
dw_rep.modify(modstring)
modstring = 'create compute(band=header alignment="0" expression="pagecountAcross()"border="0" color="0" x="1138" y="20" height="76" width="256" format="[GENERAL]"  name=pagin_horizde visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
dw_rep.modify(modstring)
modstring = 'create compute(band=footer alignment="0" expression="page()"border="0" color="0" x="18" y="4" height="76" width="256" format="[GENERAL]"  name=pagin visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
dw_rep.modify(modstring)
modstring = 'create compute(band=header alignment="0" expression="pagecount()"border="0" color="0" x="1138" y="20" height="76" width="256" format="[GENERAL]"  name=pagin_de visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
dw_rep.modify(modstring)

dw_rep.Object.gr_1.Title = st_pg.st_data.Titulo

pb_retri.event clicked()
Return 0

end function

on w_graph_gral.create
if this.MenuName = "m_graph" then this.MenuID = create m_graph
this.sle_1=create sle_1
this.dw_temp=create dw_temp
this.dw_detrep=create dw_detrep
this.pb_retri=create pb_retri
this.cb_1=create cb_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.em_3=create em_3
this.st_6=create st_6
this.em_2=create em_2
this.em_1=create em_1
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.sle_4=create sle_4
this.cbx_1=create cbx_1
this.st_1=create st_1
this.dw_rep=create dw_rep
this.gb_1=create gb_1
this.Control[]={this.sle_1,&
this.dw_temp,&
this.dw_detrep,&
this.pb_retri,&
this.cb_1,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.em_3,&
this.st_6,&
this.em_2,&
this.em_1,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.sle_4,&
this.cbx_1,&
this.st_1,&
this.dw_rep,&
this.gb_1}
end on

on w_graph_gral.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_1)
destroy(this.dw_temp)
destroy(this.dw_detrep)
destroy(this.pb_retri)
destroy(this.cb_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.em_3)
destroy(this.st_6)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_4)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.dw_rep)
destroy(this.gb_1)
end on

event open;st_pg = Message.PowerObjectParm
string modstr, ret
st_gr.dw_obj = dw_rep
st_gr.args = CREATE u_parm
if isValid(st_pg) then
	st_gr.dw_obj.DataObject = st_pg.dw_syntax
	st_gr.dw_obj.SetTransObject(SQLCA)
	modstr = "DataWindow.Table.Select='"+st_pg.consulta+"'"
	ret = st_gr.dw_obj.Modify(modstr)
	if ret <> '' then
		MessageBox('Atención, error modificando consulta para gráfica' + ret,modstr)
		Return -1
	end if
	setSyntax()
end if

end event

event resize;dw_rep.width=this.width -30
dw_rep.height=this.height -335
if not isValid(st_gr.args) then Return 0
if isValid(st_gr.args.dw_parm) then
	if st_gr.args.dw_parm.RowCount()=0 then dw_rep.height += 130
end if
//st_7.x=this.width - st_7.width - 116

end event

event close;//parentwindow.post event toolbarmoved()
end event

type sle_1 from statictext within w_graph_gral
integer x = 256
integer y = 40
integer width = 215
integer height = 60
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1/1"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_temp from datawindow within w_graph_gral
boolean visible = false
integer x = 2377
integer y = 188
integer width = 686
integer height = 40
boolean enabled = false
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_detrep from datawindow within w_graph_gral
boolean visible = false
integer x = 2377
integer y = 124
integer width = 681
integer height = 44
boolean enabled = false
string title = "none"
string dataobject = "dw_rep"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_retri from picturebutton within w_graph_gral
integer x = 14
integer y = 8
integer width = 101
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean default = true
string picturename = "llevar.GIF"
alignment htextalign = left!
string powertiptext = "Ejecutar Consulta"
end type

event clicked;string sin
sin=dw_rep.describe('datawindow.syntax')
if sin='' then
	Return
end if
any parame[]
long j
for j=1 to st_gr.args.dw_parm.RowCount()
	choose case param[j].dw_1.getitemstring(1,'tipo')
		case '1'
			parame[j]=param[j].dw_1.getitemstring(1,'param_s')
		case '2'
			parame[j]=param[j].dw_1.getitemnumber(1,'param_n')
		case '3'
			parame[j]=param[j].dw_1.getitemdatetime(1,'param_d')
		case '4'
			parame[j]=param[j].dw_1.getitemstring(1,'param_dws')
		case '5'
			parame[j]=param[j].dw_1.getitemnumber(1,'param_dwn')
		case '6'
			parame[j]=param[j].dw_1.getitemdate(1,'param_d2')
		case '7'
			parame[j]=param[j].dw_1.getitemtime(1,'param_t')	
	end choose
next
if isValid(st_pg) then
	parame[] = st_pg.parm[]
end if
choose case st_gr.args.dw_parm.RowCount()
	case 0
		dw_rep.retrieve()
	case 1
		dw_rep.retrieve(parame[1])
	case 2
		dw_rep.retrieve(parame[1],parame[2])
	case 3
		dw_rep.retrieve(parame[1],parame[2],parame[3])
	case 4
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4])
	case 5
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5])
	case 6
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6])
	case 7
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6],parame[7])
	case 8
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6],parame[7],parame[8])
	case 9
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6],parame[7],parame[8],parame[9])
	case 10
		dw_rep.retrieve(parame[1],parame[2],parame[3],parame[4],parame[5],parame[6],parame[7],parame[8],parame[9],parame[10])
	case else
		messagebox('Atención','Este reporte tiene demasiados parámetros')
end choose
commit;
end event

type cb_1 from commandbutton within w_graph_gral
integer x = 3264
integer y = 8
integer width = 279
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&yuda"
end type

event clicked;showhelp(dir_insta+"gciltda.hlp",keyword!,"Ver reporte")
end event

type pb_3 from picturebutton within w_graph_gral
integer x = 2930
integer y = 8
integer width = 311
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
boolean originalsize = true
string picturename = "print_small.GIF"
alignment htextalign = right!
end type

event clicked;dw_rep.print()
//if printSetupPrinter() = 1 then
//	dw_rep.print()
//end if
//
end event

type pb_2 from picturebutton within w_graph_gral
integer x = 485
integer y = 24
integer width = 96
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "der.gif"
alignment htextalign = left!
string powertiptext = "Siguiente Página"
end type

event clicked;dw_rep.scrollnextpage()
colocapagin()
end event

type pb_1 from picturebutton within w_graph_gral
integer x = 160
integer y = 24
integer width = 87
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "izq.gif"
alignment htextalign = left!
string powertiptext = "Página Anterior"
end type

event clicked;dw_rep.scrollpriorpage()
colocapagin()

end event

type em_3 from editmask within w_graph_gral
integer x = 1952
integer y = 4
integer width = 165
integer height = 72
integer taborder = 70
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~99"
end type

event modified;dw_rep.modify("datawindow.print.copies="+this.text)
end event

type st_6 from statictext within w_graph_gral
integer x = 667
integer y = 4
integer width = 453
integer height = 104
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagina Horizontal"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_2 from editmask within w_graph_gral
event cambiando pbm_settext
integer x = 1682
integer y = 4
integer width = 233
integer height = 72
integer taborder = 60
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 5
string minmax = "30~~250"
end type

event cambiando;IF long(text) <30 or long(text)>300 then return
dw_rep.modify("datawindow.print.preview.zoom="+this.text)

end event

event modified;IF long(THIS.text) <30 or long(THIS.text)>300 then
	messagebox("Atención","El valor es entre 30 y 300")
	this.text="100"
end if
dw_rep.modify("datawindow.print.preview.zoom="+this.text)

end event

type em_1 from editmask within w_graph_gral
event cambiando pbm_settext
integer x = 1161
integer y = 4
integer width = 233
integer height = 72
integer taborder = 40
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 5
string minmax = "30~~250"
end type

event cambiando;IF long(text) <30 or long(text)>300 then return
dw_rep.modify("datawindow.zoom="+this.text)
colocapagin()

end event

event modified;IF long(THIS.text) <30 or long(THIS.text)>250 then
	messagebox("Atención","El valor es entre 30 y 250")
	this.text="100"
end if
//tamimp=long(this.text)
dw_rep.modify("datawindow.zoom="+this.text)
colocapagin()

end event

type st_5 from statictext within w_graph_gral
integer x = 2158
integer y = 68
integer width = 763
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Págs. ( separadas por comas o menos )"
boolean focusrectangle = false
end type

type st_4 from statictext within w_graph_gral
integer x = 1957
integer y = 68
integer width = 155
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copias"
boolean focusrectangle = false
end type

type st_3 from statictext within w_graph_gral
integer x = 1723
integer y = 68
integer width = 155
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Zoom"
boolean focusrectangle = false
end type

type st_2 from statictext within w_graph_gral
integer x = 1170
integer y = 68
integer width = 192
integer height = 40
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tamaño"
boolean focusrectangle = false
end type

type sle_4 from singlelineedit within w_graph_gral
integer x = 2167
integer width = 718
integer height = 68
integer taborder = 80
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "ibeam!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string cambiar
cambiar = dw_rep.modify("datawindow.print.page.range='"+this.text+"'")
if cambiar<>"" then messagebox("Error de rangos",cambiar)
	
end event

type cbx_1 from checkbox within w_graph_gral
integer x = 1426
integer y = 20
integer width = 238
integer height = 72
integer taborder = 50
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
string text = "Reglas"
end type

event clicked;if this.checked=true then
	dw_rep.modify("datawindow.print.preview.rulers= 'Yes'")
else
	dw_rep.modify("datawindow.print.preview.rulers= 'No'")
end if
end event

type st_1 from statictext within w_graph_gral
integer x = 288
integer width = 174
integer height = 64
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Página:"
boolean focusrectangle = false
end type

type dw_rep from datawindow within w_graph_gral
event pagderecha pbm_vscroll
event mousemove pbm_dwnmousemove
integer y = 240
integer width = 3570
integer height = 1424
integer taborder = 110
string dragicon = "none!"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;return
end event

event retrieveend;if this.rowcount()<1 then
	messagebox("Atención","No se encontraron registros")
	this.insertrow(0)
	this.enabled=false
else
	this.enabled=true
end if

end event

event doubleclicked;return
end event

event getfocus;return
end event

event scrollvertical;if this.rowcount() >=1 then colocapagin()
end event

event scrollhorizontal;if this.rowcount() >=1 then colocapagin()
end event

event rowfocuschanged;if this.rowcount() >=1 then colocapagin()
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

type gb_1 from groupbox within w_graph_gral
integer y = 76
integer width = 4389
integer height = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

