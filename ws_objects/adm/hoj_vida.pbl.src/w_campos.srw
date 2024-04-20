$PBExportHeader$w_campos.srw
forward
global type w_campos from window
end type
type t1 from tab within w_campos
end type
type p1 from userobject within t1
end type
type dw_c from datawindow within p1
end type
type p1 from userobject within t1
dw_c dw_c
end type
type p2 from userobject within t1
end type
type dw_fp from datawindow within p2
end type
type p2 from userobject within t1
dw_fp dw_fp
end type
type p3 from userobject within t1
end type
type dw_pre from datawindow within p3
end type
type p3 from userobject within t1
dw_pre dw_pre
end type
type p4 from userobject within t1
end type
type dw_oc from datawindow within p4
end type
type p4 from userobject within t1
dw_oc dw_oc
end type
type p5 from userobject within t1
end type
type dw_ob from datawindow within p5
end type
type p5 from userobject within t1
dw_ob dw_ob
end type
type t1 from tab within w_campos
p1 p1
p2 p2
p3 p3
p4 p4
p5 p5
end type
end forward

global type w_campos from window
integer width = 2039
integer height = 1336
boolean titlebar = true
string title = "Insertar Campo"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "contrato.ico"
t1 t1
end type
global w_campos w_campos

type variables
long informe
st_contrato st_p

end variables

event open;st_p = Message.PowerObjectParm

t1.p1.dw_c.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)
t1.p2.dw_fp.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)
t1.p3.dw_pre.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)
t1.p4.dw_oc.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)
t1.p5.dw_ob.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)

end event

on w_campos.create
this.t1=create t1
this.Control[]={this.t1}
end on

on w_campos.destroy
destroy(this.t1)
end on

type t1 from tab within w_campos
integer x = 41
integer y = 24
integer width = 1934
integer height = 1040
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
boolean boldselectedtext = true
integer selectedtab = 1
p1 p1
p2 p2
p3 p3
p4 p4
p5 p5
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.p3=create p3
this.p4=create p4
this.p5=create p5
this.Control[]={this.p1,&
this.p2,&
this.p3,&
this.p4,&
this.p5}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
destroy(this.p3)
destroy(this.p4)
destroy(this.p5)
end on

type p1 from userobject within t1
integer x = 18
integer y = 104
integer width = 1897
integer height = 920
long backcolor = 67108864
string text = "Contrato"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_c dw_c
end type

on p1.create
this.dw_c=create dw_c
this.Control[]={this.dw_c}
end on

on p1.destroy
destroy(this.dw_c)
end on

type dw_c from datawindow within p1
integer y = 4
integer width = 1865
integer height = 896
integer taborder = 50
string title = "none"
string dataobject = "dw_rtf_concab"
boolean hscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string nombre, valor, tipo

tipo = dwo.Type
if tipo = 'column' or tipo = 'compute' then
	nombre = 'c_' + string(dwo.Name) +'_'+string(getRow())
	tipo = describe(string(dwo.Name)+".coltype")		
	CHOOSE CASE mid(tipo,1,5)
	CASE 'char(', 'char'
			valor = getItemString(getrow(),string(dwo.Name))
		case 'datet'
			valor = string(getItemDateTime(getrow(),string(dwo.Name)),'dd/mm/yyyy')
		case 'numbe','decim','long','real'
			valor = String(getItemNumber(getrow(),string(dwo.Name)),Describe(dwo.Name+'.format'))
	END CHOOSE
end if
w_rte.rte_1.InputFieldInsert(nombre)

if isnull(valor) then
	w_rte.rte_1.InputFieldchangedata(nombre,"sin dato de "+nombre)
else
	w_rte.rte_1.InputFieldchangedata(nombre,valor)
end if

//w_rte.rte_1.SelectText(w_rte.rte_1.SelectedLine(),w_rte.rte_1.LineLength()+1,w_rte.rte_1.SelectedLine(),w_rte.rte_1.LineLength()+1)

end event

event constructor;setTransObject(SQLCA)

end event

type p2 from userobject within t1
integer x = 18
integer y = 104
integer width = 1897
integer height = 920
long backcolor = 67108864
string text = "Formas Pago"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_fp dw_fp
end type

on p2.create
this.dw_fp=create dw_fp
this.Control[]={this.dw_fp}
end on

on p2.destroy
destroy(this.dw_fp)
end on

type dw_fp from datawindow within p2
integer x = 46
integer y = 52
integer width = 1806
integer height = 792
integer taborder = 50
string title = "none"
string dataobject = "dw_rtf_formapago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;string nombre, valor, tipo

tipo = dwo.Type
if tipo = 'column' or tipo = 'compute' then
	nombre = 'f_' + string(dwo.Name) +'_'+string(getRow())
	tipo = describe(string(dwo.Name)+".coltype")			
	CHOOSE CASE mid(tipo,1,5)
	CASE 'char(', 'char'
			valor = getItemString(getrow(),string(dwo.Name))
		case 'datet'
			valor = string(getItemDateTime(getrow(),string(dwo.Name)),'dd/mm/yyyy')
		case 'numbe','decim','long','real'
			valor = String(getItemNumber(getrow(),string(dwo.Name)),Describe(dwo.Name+'.format'))
	END CHOOSE
end if
w_rte.rte_1.InputFieldInsert(nombre)

if isnull(valor) then
	w_rte.rte_1.InputFieldchangedata(nombre,"sin dato de "+nombre)
else
	w_rte.rte_1.InputFieldchangedata(nombre,valor)
end if

end event

event constructor;setTransObject(SQLCA)

end event

type p3 from userobject within t1
integer x = 18
integer y = 104
integer width = 1897
integer height = 920
long backcolor = 67108864
string text = "Presupuesto"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_pre dw_pre
end type

on p3.create
this.dw_pre=create dw_pre
this.Control[]={this.dw_pre}
end on

on p3.destroy
destroy(this.dw_pre)
end on

type dw_pre from datawindow within p3
integer x = 37
integer y = 20
integer width = 1787
integer height = 824
integer taborder = 50
string title = "none"
string dataobject = "dw_contra_ppto_campos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;string nombre, valor, tipo

tipo = dwo.Type
if tipo = 'column' or tipo = 'compute' then
	nombre = 'p_' + string(dwo.Name) +'_'+string(getRow())
	tipo=describe(string(dwo.Name)+".coltype")			
	CHOOSE CASE mid(tipo,1,5)
	CASE 'char(', 'char'
			valor = getItemString(getrow(),string(dwo.Name))
		case 'datet'
			valor = string(getItemDateTime(getrow(),string(dwo.Name)),'dd/mm/yyyy')
		case 'numbe','decim','long','real'
			valor = String(getItemNumber(getrow(),string(dwo.Name)),Describe(dwo.Name+'.format'))
	END CHOOSE
end if
w_rte.rte_1.InputFieldInsert(nombre)

if isnull(valor) then
	w_rte.rte_1.InputFieldchangedata(nombre,"sin dato de "+nombre)
else
	w_rte.rte_1.InputFieldchangedata(nombre,valor)
end if

end event

event constructor;setTransObject(SQLCA)

end event

type p4 from userobject within t1
integer x = 18
integer y = 104
integer width = 1897
integer height = 920
long backcolor = 67108864
string text = "Orden Compra"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_oc dw_oc
end type

on p4.create
this.dw_oc=create dw_oc
this.Control[]={this.dw_oc}
end on

on p4.destroy
destroy(this.dw_oc)
end on

type dw_oc from datawindow within p4
integer x = 27
integer y = 44
integer width = 1815
integer height = 808
integer taborder = 60
string title = "none"
string dataobject = "dw_rtf_contra_oc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;string nombre, valor, tipo

tipo = dwo.Type
if tipo = 'column' or tipo = 'compute' then
	nombre = 'o_' + string(dwo.Name) +'_'+ string(getRow())
	tipo=describe(string(dwo.Name)+".coltype")
	CHOOSE CASE mid(tipo,1,5)
	CASE 'char(', 'char'
			valor = getItemString(getrow(),string(dwo.Name))
		case 'datet'
			valor = string(getItemDateTime(getrow(),string(dwo.Name)),'dd/mm/yyyy')
		case 'numbe','decim','long','real'
			valor = String(getItemNumber(getrow(),string(dwo.Name)),Describe(dwo.Name+'.format'))
	END CHOOSE
end if
w_rte.rte_1.InputFieldInsert(nombre)

if isnull(valor) then
	w_rte.rte_1.InputFieldchangedata(nombre,"sin dato de "+nombre)
else
	w_rte.rte_1.InputFieldchangedata(nombre,valor)
end if

end event

event constructor;setTransObject(SQLCA)

end event

type p5 from userobject within t1
integer x = 18
integer y = 104
integer width = 1897
integer height = 920
long backcolor = 67108864
string text = "Mano de Obra"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_ob dw_ob
end type

on p5.create
this.dw_ob=create dw_ob
this.Control[]={this.dw_ob}
end on

on p5.destroy
destroy(this.dw_ob)
end on

type dw_ob from datawindow within p5
integer x = 64
integer y = 52
integer width = 1787
integer height = 808
integer taborder = 50
string title = "none"
string dataobject = "dw_rtf_contra_obra"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;string nombre, valor, tipo

tipo = dwo.Type
if tipo = 'column' or tipo = 'compute' then
	nombre = 'b_' + string(dwo.Name) +'_'+ string(getRow())
	tipo=describe(string(dwo.Name)+".coltype")			
	CHOOSE CASE mid(tipo,1,5)
	CASE 'char(', 'char'
			valor = getItemString(getrow(),string(dwo.Name))
		case 'datet'
			valor = string(getItemDateTime(getrow(),string(dwo.Name)),'dd/mm/yyyy')
		case 'numbe','decim','long','real'
			valor = String(getItemNumber(getrow(),string(dwo.Name)),Describe(dwo.Name+'.format'))
	END CHOOSE
end if
w_rte.rte_1.InputFieldInsert(nombre)

if isnull(valor) then
	w_rte.rte_1.InputFieldchangedata(nombre,"sin dato de "+nombre)
else
	w_rte.rte_1.InputFieldchangedata(nombre,valor)
end if

end event

event constructor;setTransObject(SQLCA)

end event

