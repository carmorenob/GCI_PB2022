$PBExportHeader$w_elige_ppto_cont.srw
forward
global type w_elige_ppto_cont from window
end type
type st_3 from statictext within w_elige_ppto_cont
end type
type dw_1 from datawindow within w_elige_ppto_cont
end type
type pb_ok from picturebutton within w_elige_ppto_cont
end type
type pb_can from picturebutton within w_elige_ppto_cont
end type
type tab_2 from tab within w_elige_ppto_cont
end type
type t2 from userobject within tab_2
end type
type dw_2 from datawindow within t2
end type
type t2 from userobject within tab_2
dw_2 dw_2
end type
type tab_2 from tab within w_elige_ppto_cont
t2 t2
end type
type tab_1 from tab within w_elige_ppto_cont
end type
type t1 from userobject within tab_1
end type
type dw_cab from datawindow within t1
end type
type t1 from userobject within tab_1
dw_cab dw_cab
end type
type tab_1 from tab within w_elige_ppto_cont
t1 t1
end type
end forward

global type w_elige_ppto_cont from window
integer width = 4311
integer height = 1920
boolean titlebar = true
string title = "Elige Preupuesto para Contrato"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
dw_1 dw_1
pb_ok pb_ok
pb_can pb_can
tab_2 tab_2
tab_1 tab_1
end type
global w_elige_ppto_cont w_elige_ppto_cont

type variables
string  i_orig
int i_dec_gral,i_aprox_gral
boolean i_cambio
datawindowchild idw_concep_cont1
st_xa_antis st_ord
long rfcn,rfci
string rfcl,rfcd
end variables

on w_elige_ppto_cont.create
this.st_3=create st_3
this.dw_1=create dw_1
this.pb_ok=create pb_ok
this.pb_can=create pb_can
this.tab_2=create tab_2
this.tab_1=create tab_1
this.Control[]={this.st_3,&
this.dw_1,&
this.pb_ok,&
this.pb_can,&
this.tab_2,&
this.tab_1}
end on

on w_elige_ppto_cont.destroy
destroy(this.st_3)
destroy(this.dw_1)
destroy(this.pb_ok)
destroy(this.pb_can)
destroy(this.tab_2)
destroy(this.tab_1)
end on

event open;st_ord=message.powerobjectparm
idw_concep_cont1.retrieve('01','R','1')

st_ord.dw_cpo.rowscopy(st_ord.ld_item,st_ord.ld_item,primary!,tab_1.t1.dw_cab,1,primary!)
st_ord.dw_rten.rowscopy(1,st_ord.dw_rten.rowcount(),primary!,tab_2.t2.dw_2,1,primary!)
int i
decimal bruto

for i=1 to tab_2.t2.dw_2.rowcount()
	setnull(bruto)
	tab_2.t2.dw_2.setitem(i,'a_usar',bruto)
next

bruto = tab_1.t1.dw_cab.getItemNumber(st_ord.ld_fila,'t_bruto')
if bruto > 0 then
	i = 1
	do while bruto > 0 and i <= tab_2.t2.dw_2.rowCount()
		if bruto >tab_2.t2.dw_2.getItemNumber(i, "monto_vigente") - tab_2.t2.dw_2.getItemNumber(i, "monto_interfaz") then
			tab_2.t2.dw_2.setItem(i, "a_usar",tab_2.t2.dw_2.getItemNumber(i, "monto_vigente") -tab_2.t2.dw_2.getItemNumber(i, "monto_interfaz"))
			bruto = bruto - ( tab_2.t2.dw_2.getItemNumber(i, "monto_vigente") - tab_2.t2.dw_2.getItemNumber(i, "monto_interfaz") )
			i++
		else
			tab_2.t2.dw_2.setItem(i, "a_usar",  bruto)
			bruto = 0
		end if
	loop
	if bruto > 0 then
		messageBox("Atención","Presupuesto insuficiente para cubrir valor bruto")
	end if
end if

tab_2.t2.dw_2.setfilter('cod_vigencia =0')
tab_2.t2.dw_2.filter()

SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=29));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 29')
	return 
end if

SELECT ENTERO into :i_aprox_gral
FROM parametros_gen
WHERE (((codigo_para)=18));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 18')
	return 
end if
if i_aprox_gral=0 then i_aprox_gral=1
end event

type st_3 from statictext within w_elige_ppto_cont
integer x = 37
integer y = 8
integer width = 622
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vigencia Presupuestal"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_elige_ppto_cont
integer x = 681
integer y = 4
integer width = 654
integer height = 68
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigen"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
double vigencia

vigencia = this.GetItemNumber(this.GetRow(),'cod_vigencia')
tab_2.t2.dw_2.setfilter('cod_vigencia ='+string(vigencia)+" and tipodoc='"+st_ord.ps_tipodoc+"' and documento='"+st_ord.ps_docu+"'")
tab_2.t2.dw_2.filter()

end event

event constructor;dw_1.settransobject(SQLCA)
dw_1.insertrow(1)
end event

type pb_ok from picturebutton within w_elige_ppto_cont
integer x = 1938
integer y = 1692
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;if tab_2.t2.dw_2.rowcount()<1 then return
if tab_2.t2.dw_2.getitemnumber(1,'total')= 0 then return
if messagebox('Atención','Esta seguro?, de esta discriminación presupuestal',question!,yesno!,2)=2 then return

long ld_j,ld_fila
string ls_cdoc,ls_clg,ls_nr,ls_ir


for ld_j = 1 to tab_2.t2.dw_2.rowCount()
	if tab_2.t2.dw_2.getItemNumber(ld_j, 'a_usar') > 0 then
		ls_cdoc=tab_2.t2.dw_2.getItemString(ld_j, "coddoc")
		ls_clg= tab_2.t2.dw_2.getItemString(ld_j, "clugar")
		ls_nr=string(tab_2.t2.dw_2.getItemNumber(ld_j, "numdoc"))
		ls_ir=string(tab_2.t2.dw_2.getItemNumber(ld_j, "item"))
		ld_fila=st_ord.dw_intfaz.find( "char_orig1 ='"+ls_cdoc+ "' and  char_orig2 ='"+ls_clg+"' and num_orig1 ="+ls_nr+" and  num_orig2="+ls_ir+" and  codigo='"+st_ord.ps_flujo+"' and char_orig3='"+st_ord.ps_tipodoc+"' and char_doc3='"+st_ord.ps_docu +"'", 1, st_ord.dw_intfaz.rowCount())
		if ld_fila=0 then
			ld_fila =st_ord.dw_intfaz.InsertRow(0)
			st_ord.dw_intfaz.setItem(ld_fila, 'char_orig1', ls_cdoc)
			st_ord.dw_intfaz.setItem(ld_fila, 'char_orig2', ls_clg)
			st_ord.dw_intfaz.setItem(ld_fila, 'num_orig1', tab_2.t2.dw_2.getItemNumber(ld_j, "numdoc"))
			st_ord.dw_intfaz.setItem(ld_fila, 'num_orig2', tab_2.t2.dw_2.getItemNumber(ld_j, "itemr"))
			
			st_ord.dw_intfaz.setitem(ld_fila,'num_doc2',tab_1.t1.dw_cab.getitemnumber(1,'n_concep'))
			st_ord.dw_intfaz.setItem(ld_fila, 'valor', tab_2.t2.dw_2.getItemNumber(ld_j, "a_usar"))
			st_ord.dw_intfaz.setItem(ld_fila, 'codigo', st_ord.ps_flujo)
			st_ord.dw_intfaz.setItem(ld_fila, 'char_orig3',st_ord.ps_tipodoc)
			st_ord.dw_intfaz.setItem(ld_fila, 'char_doc3',st_ord.ps_docu)
		else
			st_ord.dw_intfaz.setItem(ld_fila, 'valor', +tab_2.t2.dw_2.getItemNumber(ld_j, "a_usar")+ st_ord.dw_intfaz.getitemnumber(ld_fila,'valor'))
		end if
	end if
next

tab_2.t2.dw_2.rowscopy(1,tab_2.t2.dw_2.RowCount(),primary!,st_ord.dw_intfaz,1,primary!)
closewithreturn(parent,'ok')
end event

type pb_can from picturebutton within w_elige_ppto_cont
integer x = 2107
integer y = 1692
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;closewithreturn(parent,'-1')
end event

type tab_2 from tab within w_elige_ppto_cont
integer x = 23
integer y = 828
integer width = 4251
integer height = 852
integer taborder = 40
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
t2 t2
end type

on tab_2.create
this.t2=create t2
this.Control[]={this.t2}
end on

on tab_2.destroy
destroy(this.t2)
end on

type t2 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 4215
integer height = 724
long backcolor = 67108864
string text = "Rubros Presupuesto"
long tabtextcolor = 33554432
string picturename = "ajuste1.ico"
long picturemaskcolor = 536870912
string powertiptext = "Rubros Presupuesto"
dw_2 dw_2
end type

on t2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on t2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within t2
event p_scrollto ( integer p_fila,  string p_column )
integer x = 27
integer y = 28
integer width = 4169
integer height = 672
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_contra_ppto_rfc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_scrollto(integer p_fila, string p_column);setredraw(false)
scrolltorow(p_fila)
setcolumn(p_column)
setredraw(true)
end event

event constructor;settransobject(sqlca)
end event

event itemchanged;dec ld_valor
ld_valor=round(dec(data),i_dec_gral)
if i_dec_gral=0 then
	ld_valor=long(ld_valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((ld_valor -long(ld_valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
end if

if ld_valor > (dw_2.getitemnumber(row,'monto_vigente') - dw_2.getitemnumber(row,'monto_interfaz') )  then
	settext('0')
	setitem(row,'a_usar',0)
	return 1
end if
accepttext()
setitem(row,'a_usar',double(data))	
return 2

end event

type tab_1 from tab within w_elige_ppto_cont
integer x = 23
integer y = 108
integer width = 4251
integer height = 700
integer taborder = 20
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
t1 t1
end type

on tab_1.create
this.t1=create t1
this.Control[]={this.t1}
end on

on tab_1.destroy
destroy(this.t1)
end on

type t1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4215
integer height = 572
long backcolor = 67108864
string text = "Conceptos"
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
string powertiptext = "Conceptos del Pago"
dw_cab dw_cab
end type

on t1.create
this.dw_cab=create dw_cab
this.Control[]={this.dw_cab}
end on

on t1.destroy
destroy(this.dw_cab)
end on

type dw_cab from datawindow within t1
integer x = 41
integer y = 36
integer width = 4146
integer height = 516
integer taborder = 20
string title = "none"
string dataobject = "dw_concep_cont"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_rel',idw_concep_cont1)
idw_concep_cont1.settransobject(sqlca)



end event

