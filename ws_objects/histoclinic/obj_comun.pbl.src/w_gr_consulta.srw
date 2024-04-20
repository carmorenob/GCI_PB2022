$PBExportHeader$w_gr_consulta.srw
forward
global type w_gr_consulta from window
end type
type cb_3 from commandbutton within w_gr_consulta
end type
type cb_2 from commandbutton within w_gr_consulta
end type
type cb_1 from commandbutton within w_gr_consulta
end type
type mle_1 from multilineedit within w_gr_consulta
end type
end forward

global type w_gr_consulta from window
integer width = 2167
integer height = 1108
boolean titlebar = true
string title = "Consulta SQL"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "sql.ico"
boolean center = true
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
mle_1 mle_1
end type
global w_gr_consulta w_gr_consulta

type variables
st_graph st_gr
string sintaxis, s_sql, condicion, agrupa
int ret
constant integer SUCCESS=1
constant integer FAILURE=-1
end variables

on w_gr_consulta.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.mle_1}
end on

on w_gr_consulta.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_1)
end on

event open;st_gr = message.PowerObjectParm

if not isValid(st_gr.dw_obj) then Return
sintaxis = st_gr.dw_obj.GetSQLSelect()
if len(sintaxis) < 1 then 
	mle_1.Text = ''
else
	mle_1.Text = sintaxis
end if

end event

type cb_3 from commandbutton within w_gr_consulta
integer x = 1723
integer y = 440
integer width = 375
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;close(parent)


end event

type cb_2 from commandbutton within w_gr_consulta
integer x = 1723
integer y = 300
integer width = 375
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string error_create, crea_gr, modstring

if trim(mle_1.Text) = '' then Return
cb_1.triggerEvent(clicked!)
if ret = 0 then
	st_gr.dw_obj.Create(sintaxis, error_create)
	IF Len(error_create) > 0 THEN
		MessageBox ("Error Creación", error_create)
		Return
	END IF	
	st_gr.dw_obj.Modify("DataWindow.Table.Select='" + trim(mle_1.Text) + "'")

	if w_graph_gral.inicialize(st_gr.dw_obj.Describe("DataWindow.Syntax")) = -1 then
		Return -1
	end if
	
	crea_gr = 'graph(band=foreground height="984" width="1897" graphtype="8" perspective="2" rotation="-20" color="0" backcolor="16777215" shadecolor="8355711" range= 0 border="0" overlappercent="0" spacing="100" elevation="20" depth="100"x="613" y="148" height="984" width="1897"  name=gr_1 visible="1"  resizeable=1  moveable=1  title="(None)"  title.dispattr.backcolor="536870912"  title.dispattr.alignment="2"  title.dispattr.autosize="1"  title.dispattr.font.charset="0"  title.dispattr.font.escapement="0"  title.dispattr.font.face="Arial"  title.dispattr.font.family="2"  title.dispattr.font.height="0"  title.dispattr.font.italic="0"  title.dispattr.font.orientation="0"  title.dispattr.font.pitch="2"  title.dispattr.font.strikethrough="0"  title.dispattr.font.underline="0"  title.dispattr.font.weight="700"  title.dispattr.format="[General]"  title.dispattr.textcolor="0"  title.dispattr.displayexpression="title"  legend="4"  legend.dispattr.backcolor="536870912"  legend.dispattr.alignment="0"  legend.dispattr.autosize="1"  legend.dispattr.font.charset="0"  legend.dispattr.font.escapement="0"  legend.dispattr.font.face="Arial"  legend.dispattr.font.family="2"  legend.dispattr.font.height="0"  legend.dispattr.font.italic="0"  legend.dispattr.font.orientation="0"  legend.dispattr.font.pitch="2"  legend.dispattr.font.strikethrough="0"  legend.dispattr.font.underline="0"  legend.dispattr.font.weight="400"  legend.dispattr.format="[General]"  legend.dispattr.textcolor="0"  legend.dispattr.displayexpression="series"' + & 
	'series.autoscale="1" series.displayeverynlabels="0"  series.droplines="0"  series.frame="1"  series.label="(None)"  series.majordivisions="0"  series.majorgridline="0"  series.majortic="3"  series.maximumvalue="0"  series.minimumvalue="0"  series.minordivisions="0"  series.minorgridline="0"  series.minortic="1"  series.originline="0"  series.primaryline="1"  series.roundto="0"  series.roundtounit="0"  series.scaletype="1"  series.scalevalue="1"  series.secondaryline="0"  series.shadebackedge="0"  series.dispattr.backcolor="536870912"  series.dispattr.alignment="0"  series.dispattr.autosize="1"  series.dispattr.font.charset="0"  series.dispattr.font.escapement="0"  series.dispattr.font.face="Arial"  series.dispattr.font.family="2"  series.dispattr.font.height="0"  series.dispattr.font.italic="0"  series.dispattr.font.orientation="0"  series.dispattr.font.pitch="2"  series.dispattr.font.strikethrough="0"  series.dispattr.font.underline="0"  series.dispattr.font.weight="400"  series.dispattr.format="[General]"  series.dispattr.textcolor="0"  series.dispattr.displayexpression="series"  series.labeldispattr.backcolor="536870912"  series.labeldispattr.alignment="2"  series.labeldispattr.autosize="1"  series.labeldispattr.font.charset="0"  series.labeldispattr.font.escapement="0"  series.labeldispattr.font.face="Arial"  series.labeldispattr.font.family="2"  series.labeldispattr.font.height="0"  series.labeldispattr.font.italic="0"  series.labeldispattr.font.orientation="0"  series.labeldispattr.font.pitch="2"  series.labeldispattr.font.strikethrough="0"  series.labeldispattr.font.underline="0"  series.labeldispattr.font.weight="400"  series.labeldispattr.format="[General]"  series.labeldispattr.textcolor="0"  series.labeldispattr.displayexpression="seriesaxislabel"  series.sort="1" ' + &
	'category.autoscale="1" category.displayeverynlabels="0"  category.droplines="0"  category.frame="1"  category.label="(None)"  category.majordivisions="0"  category.majorgridline="0"  category.majortic="3"  category.maximumvalue="0"  category.minimumvalue="0"  category.minordivisions="0"  category.minorgridline="0"  category.minortic="1"  category.originline="0"  category.primaryline="1"  category.roundto="0"  category.roundtounit="0"  category.scaletype="1"  category.scalevalue="1"  category.secondaryline="0"  category.shadebackedge="1"  category.dispattr.backcolor="536870912"  category.dispattr.alignment="2"  category.dispattr.autosize="1"  category.dispattr.font.charset="0"  category.dispattr.font.escapement="0"  category.dispattr.font.face="Arial"  category.dispattr.font.family="2"  category.dispattr.font.height="0"  category.dispattr.font.italic="0"  category.dispattr.font.orientation="0"  category.dispattr.font.pitch="2"  category.dispattr.font.strikethrough="0"  category.dispattr.font.underline="0"  category.dispattr.font.weight="400"  category.dispattr.format="[General]"  category.dispattr.textcolor="0"  category.dispattr.displayexpression="category"  category.labeldispattr.backcolor="536870912"  category.labeldispattr.alignment="2"  category.labeldispattr.autosize="1"  category.labeldispattr.font.charset="0"  category.labeldispattr.font.escapement="0"  category.labeldispattr.font.face="Arial"  category.labeldispattr.font.family="2"  category.labeldispattr.font.height="0"  category.labeldispattr.font.italic="0"  category.labeldispattr.font.orientation="0"  category.labeldispattr.font.pitch="2"  category.labeldispattr.font.strikethrough="0"  category.labeldispattr.font.underline="0"  category.labeldispattr.font.weight="400"  category.labeldispattr.format="[General]"  category.labeldispattr.textcolor="0"  category.labeldispattr.displayexpression="categoryaxislabel"  category.sort="1" ' + &
	' values.autoscale="1" values.displayeverynlabels="0"  values.droplines="0"  values.frame="1"  values.label="(None)"  values.majordivisions="0"  values.majorgridline="0"  values.majortic="3"  values.maximumvalue="1000"  values.minimumvalue="0"  values.minordivisions="0"  values.minorgridline="0"  values.minortic="1"  values.originline="1"  values.primaryline="1"  values.roundto="0"  values.roundtounit="0"  values.scaletype="1"  values.scalevalue="1"  values.secondaryline="0"  values.shadebackedge="0"  values.dispattr.backcolor="536870912"  values.dispattr.alignment="1"  values.dispattr.autosize="1"  values.dispattr.font.charset="0"  values.dispattr.font.escapement="0"  values.dispattr.font.face="Arial"  values.dispattr.font.family="2"  values.dispattr.font.height="0"  values.dispattr.font.italic="0"  values.dispattr.font.orientation="0"  values.dispattr.font.pitch="2"  values.dispattr.font.strikethrough="0"  values.dispattr.font.underline="0"  values.dispattr.font.weight="400"  values.dispattr.format="[General]"  values.dispattr.textcolor="0"  values.dispattr.displayexpression="value"  values.labeldispattr.backcolor="536870912"  values.labeldispattr.alignment="2"  values.labeldispattr.autosize="1"  values.labeldispattr.font.charset="0"  values.labeldispattr.font.escapement="900"  values.labeldispattr.font.face="Arial"  values.labeldispattr.font.family="2"  values.labeldispattr.font.height="0"  values.labeldispattr.font.italic="0"  values.labeldispattr.font.orientation="900"  values.labeldispattr.font.pitch="2"  values.labeldispattr.font.strikethrough="0"  values.labeldispattr.font.underline="0"  values.labeldispattr.font.weight="400"  values.labeldispattr.format="[General]"  values.labeldispattr.textcolor="0"  values.labeldispattr.displayexpression="valuesaxislabel" ) '	

	st_gr.dw_obj.Modify("Create " + crea_gr)
	st_gr.dw_obj.SetTransObject(SQLCA)
	
	modstring = 'create compute(band=header alignment="0" expression="pageAcross()"border="0" color="0" x="1138" y="20" height="76" width="256" format="[GENERAL]"  name=pagin_horiz visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
	st_gr.dw_obj.modify(modstring)
	modstring = 'create compute(band=header alignment="0" expression="pagecountAcross()"border="0" color="0" x="1138" y="20" height="76" width="256" format="[GENERAL]"  name=pagin_horizde visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
	st_gr.dw_obj.modify(modstring)
	modstring = 'create compute(band=footer alignment="0" expression="page()"border="0" color="0" x="18" y="4" height="76" width="256" format="[GENERAL]"  name=pagin visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
	st_gr.dw_obj.modify(modstring)
	modstring = 'create compute(band=header alignment="0" expression="pagecount()"border="0" color="0" x="1138" y="20" height="76" width="256" format="[GENERAL]"  name=pagin_de visible="1~t0"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )'
	st_gr.dw_obj.modify(modstring)
	openwithparm(w_graph_conf,st_gr.dw_obj)
	close(parent)
	
end if

end event

type cb_1 from commandbutton within w_gr_consulta
integer x = 1723
integer y = 156
integer width = 375
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Verificar"
end type

event clicked;string error_syntaxfromSQL, error_create, args
long l_cond, ll_pos
if trim(mle_1.Text) = '' then Return
l_cond = pos(mle_1.text,'where')
if l_cond > 0 then
	s_sql = left(mle_1.text, l_cond - 1)
	l_cond = pos(mle_1.text,'group')
	if l_cond > 0 then 
		agrupa = right(mle_1.Text,len(mle_1.Text) - l_cond + 1)
	else
		agrupa = ''
	end if
else
	s_sql = trim(mle_1.text)
end if
condicion = right(mle_1.Text,len(mle_1.Text) - l_cond + 1)

sintaxis = SQLCA.SyntaxFromSQL(s_sql + agrupa , 'Style(Type=grid)', error_syntaxfromSQL)
IF Len(error_syntaxfromSQL) > 0 THEN
	MessageBox ("Error Sintaxis", error_syntaxfromSQL)
	ret = -1
	Return
end if
ll_pos = Pos(sintaxis, 'table(') + 6

args = st_gr.args.Parmtosyntax()

sintaxis = Left(sintaxis, ll_pos) + args + Mid(sintaxis, ll_pos + 1)

ll_pos = 1
do while TRUE
	ll_pos = pos(sintaxis, 'column(', ll_pos) + 6
	if ll_pos = 6 then EXIT
	sintaxis = left(sintaxis, ll_pos) + 'visible="0" ' + Mid(sintaxis, ll_pos + 1)
loop

ll_pos = 1
do while TRUE
	ll_pos = pos(sintaxis, 'text(', ll_pos) + 4
	if ll_pos = 4 then EXIT
	sintaxis = left(sintaxis, ll_pos) + 'visible="0" ' + Mid(sintaxis, ll_pos + 1)
loop

//sintaxis = of_syntaxFromSQL(mle_1.text, '', error_syntaxfromSQL)
ret = 0

end event

type mle_1 from multilineedit within w_gr_consulta
integer x = 151
integer y = 88
integer width = 1522
integer height = 756
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

