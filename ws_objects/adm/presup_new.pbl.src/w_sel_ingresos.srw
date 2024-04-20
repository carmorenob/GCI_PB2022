$PBExportHeader$w_sel_ingresos.srw
forward
global type w_sel_ingresos from window
end type
type t1 from tab within w_sel_ingresos
end type
type p1 from userobject within t1
end type
type pb_llevar_b from picturebutton within p1
end type
type dw_banco from datawindow within p1
end type
type p1 from userobject within t1
pb_llevar_b pb_llevar_b
dw_banco dw_banco
end type
type p2 from userobject within t1
end type
type pb_llevar_c from picturebutton within p2
end type
type dw_caja from datawindow within p2
end type
type p2 from userobject within t1
pb_llevar_c pb_llevar_c
dw_caja dw_caja
end type
type t1 from tab within w_sel_ingresos
p1 p1
p2 p2
end type
type dw_terce from datawindow within w_sel_ingresos
end type
end forward

global type w_sel_ingresos from window
integer width = 3255
integer height = 1472
boolean titlebar = true
string title = "Ingresos para Recaudo temporal"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
t1 t1
dw_terce dw_terce
end type
global w_sel_ingresos w_sel_ingresos

type variables
st_interfaz st_p
double id_vigencia
string is_codtotal, is_descripcion
int i_dec_gral,i_aprox_gral

end variables

on w_sel_ingresos.create
this.t1=create t1
this.dw_terce=create dw_terce
this.Control[]={this.t1,&
this.dw_terce}
end on

on w_sel_ingresos.destroy
destroy(this.t1)
destroy(this.dw_terce)
end on

event open;st_p = message.powerObjectParm
SELECT ips.cod_vigencia_recaudo, ips.codtotal_recaudo, Pre_plan.descrip into :id_vigencia, :is_codtotal, :is_descripcion
FROM ips INNER JOIN Pre_plan ON (ips.codtotal_recaudo = Pre_plan.CodTotal) AND (ips.cod_vigencia_recaudo = Pre_plan.cod_vigencia);
if sqlca.sqlcode = 100 then
	MessageBox('Atención','No está asociado el rubro al que se cargará el ingreso para el Tercero (IPS).')
	setnull(id_vigencia)
	Return 0
elseif sqlca.sqlcode = -1 then
	MessageBox("SQL error", SQLCA.SQLErrText)
	setnull(id_vigencia)
	Return 0
end if

//string ojo
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\presupuesto", "dec_pre", Regstring!, ojo)
//i_dec_gral=long(ojo)
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\presupuesto", "aproxa_gral", Regstring!, ojo)
//i_aprox_gral=long(ojo)
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

type t1 from tab within w_sel_ingresos
event create ( )
event destroy ( )
integer x = 37
integer y = 200
integer width = 3145
integer height = 1136
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
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3109
integer height = 1008
long backcolor = 67108864
string text = "Bancos"
long tabtextcolor = 33554432
string picturename = "factura.ico"
long picturemaskcolor = 536870912
pb_llevar_b pb_llevar_b
dw_banco dw_banco
end type

on p1.create
this.pb_llevar_b=create pb_llevar_b
this.dw_banco=create dw_banco
this.Control[]={this.pb_llevar_b,&
this.dw_banco}
end on

on p1.destroy
destroy(this.pb_llevar_b)
destroy(this.dw_banco)
end on

type pb_llevar_b from picturebutton within p1
integer x = 2926
integer y = 40
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Llevar Ingreso"
end type

event clicked;dec valor
long fila, it, fo
string cb, tc, nc

if dw_banco.getrow() = 0 then return 0
if isNull(id_vigencia) then 
	MessageBox('Atención','No se definió el rubro al que se cargará el ingreso para el tercero (IPS)')
	Return 0
end if
fo = dw_banco.Find("selec=1",1,dw_banco.rowCount())
do while fo > 0
	cb = dw_banco.getItemString(fo,'codbanco')
	tc = dw_banco.getItemString(fo,'tipo_cuenta')
	nc = dw_banco.getItemString(fo,'numcuenta')
	it = dw_banco.getItemNumber(fo,'item')
	
	fila = st_p.dw_it.Find("char_orig1='"+cb+"' and char_orig2='"+tc+"' and char_orig3='"+nc+"' and num_orig1="+string(it),1,st_p.dw_it.rowCount())
	if fila = 0 then
		fila = st_p.dw_it.InsertRow(0)
		st_p.dw_it.setItem(fila,'codigo',st_p.codmod) //
		st_p.dw_it.setItem(fila,'char_orig1',cb) //codbanco
		st_p.dw_it.setItem(fila,'char_orig2',tc) //tipo_cuenta
		st_p.dw_it.setItem(fila,'char_orig3',nc) //numcuenta
		st_p.dw_it.setItem(fila,'num_orig1',it) //item
		st_p.dw_it.setItem(fila,'num_orig2',1) // banco - tesocuentasmovi
		st_p.dw_it.setItem(fila,'char_doc1',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'coddoc'))
		st_p.dw_it.setItem(fila,'char_doc2',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'clugar'))
		st_p.dw_it.setItem(fila,'num_doc1',st_p.dw_cab.getItemNumber(st_p.dw_cab.getRow(),'numdoc'))
	end if
	valor=round(dw_banco.getItemNumber(fo,'valor'),i_dec_gral)
	if i_dec_gral=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	
	st_p.dw_it.setItem(fila,'valor',valor)
	
	fila = st_p.dw_obj.Find("cod_vigencia="+string(id_vigencia)+" and codtotal='"+is_codtotal+"'",1,st_p.dw_obj.rowCount())
	if fila = 0 then
		fila = st_p.dw_obj.insertRow(0)
		st_p.dw_obj.setItem(fila,'coddoc',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'coddoc'))
		st_p.dw_obj.setItem(fila,'clugar',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'clugar'))
		st_p.dw_obj.setItem(fila,'numdoc',st_p.dw_cab.getItemNumber(st_p.dw_cab.getRow(),'numdoc'))
		st_p.dw_obj.setItem(fila,'item',fila)
		st_p.dw_obj.SetItem(fila,'cod_vigencia', id_vigencia)
		st_p.dw_obj.SetItem(fila,'codtotal', is_codtotal)
		st_p.dw_obj.SetItem(fila,'descrip',is_descripcion)
		st_p.dw_obj.SetItem(fila,'estado_cb','0')
	end if
	
	valor=round(st_p.dw_obj.getItemNumber(fila,'monto') + dw_banco.getItemNumber(fo,'valor'),i_dec_gral)
	if i_dec_gral=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	st_p.dw_obj.SetItem(fila,'monto',valor)
	
	valor=round(st_p.dw_obj.getItemNumber(fila,'monto_vigente') + dw_banco.getItemNumber(fo,'valor'),i_dec_gral)
	if i_dec_gral=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	st_p.dw_obj.SetItem(fila,'monto_vigente',valor)
	
	if fo + 1> dw_banco.rowCount() then EXIT
	fo = dw_banco.Find("selec=1",fo+1,dw_banco.rowCount())
loop

end event

type dw_banco from datawindow within p1
integer x = 55
integer y = 40
integer width = 2848
integer height = 940
integer taborder = 30
string title = "none"
string dataobject = "dw_ingresos_bancos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 3109
integer height = 1008
long backcolor = 67108864
string text = "Caja"
long tabtextcolor = 33554432
string picturename = "rec_caja.ico"
long picturemaskcolor = 536870912
pb_llevar_c pb_llevar_c
dw_caja dw_caja
end type

on p2.create
this.pb_llevar_c=create pb_llevar_c
this.dw_caja=create dw_caja
this.Control[]={this.pb_llevar_c,&
this.dw_caja}
end on

on p2.destroy
destroy(this.pb_llevar_c)
destroy(this.dw_caja)
end on

type pb_llevar_c from picturebutton within p2
integer x = 2921
integer y = 24
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Llevar Ingreso"
end type

event clicked;long fila, it, fo
string cb, tc, nc
if dw_caja.getrow() = 0 then return 0
if isNull(id_vigencia) then 
	MessageBox('Atención','No se definió el rubro al que se cargará el ingreso para el tercero (IPS)')
	Return 0
end if
fo = dw_caja.Find("selec=1",1,dw_caja.rowCount())
do while fo > 0
	cb = dw_caja.getItemString(fo,'codcaja')
	tc = dw_caja.getItemString(fo,'clugar')
	nc = dw_caja.getItemString(fo,'coddoc')
	it = dw_caja.getItemNumber(fo,'ningreso')
	
	fila = st_p.dw_it.Find("char_orig1='"+cb+"' and char_orig2='"+tc+"' and char_orig3='"+nc+"' and num_orig1="+string(it),1,st_p.dw_it.rowCount())
	if fila = 0 then
		fila = st_p.dw_it.InsertRow(0)
		st_p.dw_it.setItem(fila,'codigo',st_p.codmod) 
		st_p.dw_it.setItem(fila,'char_orig1',cb) //codcaja
		st_p.dw_it.setItem(fila,'char_orig2',tc) //clugar
		st_p.dw_it.setItem(fila,'char_orig3',nc) //coddoc
		st_p.dw_it.setItem(fila,'num_orig1',it) //ningreso
		st_p.dw_it.setItem(fila,'num_orig2',2) // caja - tesocajaingreso
		st_p.dw_it.setItem(fila,'char_doc1',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'coddoc'))
		st_p.dw_it.setItem(fila,'char_doc2',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'clugar'))
		st_p.dw_it.setItem(fila,'num_doc1',st_p.dw_cab.getItemNumber(st_p.dw_cab.getRow(),'numdoc'))
	end if
	st_p.dw_it.setItem(fila,'valor',dw_caja.getItemNumber(fo,'valor'))
	
	fila = st_p.dw_obj.Find("cod_vigencia="+string(id_vigencia)+" and codtotal='"+is_codtotal+"'",1,st_p.dw_obj.rowCount())
	if fila = 0 then
		fila = st_p.dw_obj.insertRow(0)
		st_p.dw_obj.setItem(fila,'coddoc',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'coddoc'))
		st_p.dw_obj.setItem(fila,'clugar',st_p.dw_cab.getItemString(st_p.dw_cab.getRow(),'clugar'))
		st_p.dw_obj.setItem(fila,'numdoc',st_p.dw_cab.getItemNumber(st_p.dw_cab.getRow(),'numdoc'))
		st_p.dw_obj.setItem(fila,'item',fila)
		st_p.dw_obj.SetItem(fila,'cod_vigencia', id_vigencia)
		st_p.dw_obj.SetItem(fila,'codtotal', is_codtotal)
		st_p.dw_obj.SetItem(fila,'descrip',is_descripcion)
		st_p.dw_obj.SetItem(fila,'estado_cb','0')
	end if
	st_p.dw_obj.SetItem(fila,'monto',st_p.dw_obj.getItemNumber(fila,'monto') + dw_caja.getItemNumber(fo,'valor'))
	st_p.dw_obj.SetItem(fila,'monto_vigente',st_p.dw_obj.getItemNumber(fila,'monto_vigente') + dw_caja.getItemNumber(fo,'valor'))
	
	if fo + 1> dw_caja.rowCount() then EXIT
	fo = dw_caja.Find("selec=1",fo+1,dw_caja.rowCount())
loop

end event

type dw_caja from datawindow within p2
integer x = 55
integer y = 40
integer width = 2843
integer height = 920
integer taborder = 30
string title = "none"
string dataobject = "dw_ingresos_caja"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

type dw_terce from datawindow within w_sel_ingresos
integer x = 41
integer y = 28
integer width = 3159
integer height = 136
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
modify('tipodoc.validationmsg="No puede cambiar el tercero sin guardar"')
modify('documento.validationmsg="Tercero no existe o ya no lo puede cambiar sin guardar"')
insertrow(1)
end event

event doubleclicked;g_tercerodesde=1
openwithparm(w_buscater,dw_terce)
setcolumn('documento')
event itemchanged(1,object.documento,getitemstring(1,'documento'))
end event

event itemchanged;accepttext()
string doc,tdoc
tdoc=getitemstring(1,"tipodoc")
doc=getitemstring(1,"documento")
string snulo
setnull(snulo)
if dwo.name="tipodoc" and doc <> "" then
	setitem(1,"documento",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,'tel1',snulo)
	setitem(1,'persona',snulo)
	return
end if
if dwo.name="documento" and doc = "" then 
	setitem(1,'nombre1',snulo)
	setitem(1,'persona',snulo)
end if
if dwo.name="documento" and doc <> "" then
	if retrieve(tdoc,doc)=0 then
		insertrow(1)
		setitem(1,1,tdoc)
		setitem(1,2,doc)
		messagebox("Atención",'Tercero no existe')
	else
		t1.p1.dw_banco.Retrieve(tdoc,doc)
		t1.p2.dw_caja.Retrieve(tdoc,doc)
	end if
end if

end event

