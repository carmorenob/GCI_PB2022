$PBExportHeader$w_equilibrio.srw
forward
global type w_equilibrio from w_center
end type
type dw_ing from datawindow within w_equilibrio
end type
type rb_1 from radiobutton within w_equilibrio
end type
type rb_2 from radiobutton within w_equilibrio
end type
type rb_3 from radiobutton within w_equilibrio
end type
type rb_4 from radiobutton within w_equilibrio
end type
type rb_5 from radiobutton within w_equilibrio
end type
type rb_6 from radiobutton within w_equilibrio
end type
type rb_7 from radiobutton within w_equilibrio
end type
type rb_8 from radiobutton within w_equilibrio
end type
type rb_9 from radiobutton within w_equilibrio
end type
type st_1 from statictext within w_equilibrio
end type
type pb_2 from picturebutton within w_equilibrio
end type
type gb_2 from groupbox within w_equilibrio
end type
type dw_10 from datawindow within w_equilibrio
end type
type rb_10 from radiobutton within w_equilibrio
end type
type rb_11 from radiobutton within w_equilibrio
end type
type rb_12 from radiobutton within w_equilibrio
end type
type pb_1 from picturebutton within w_equilibrio
end type
type pb_3 from picturebutton within w_equilibrio
end type
type dw_eq from datawindow within w_equilibrio
end type
type gb_1 from groupbox within w_equilibrio
end type
type gb_3 from groupbox within w_equilibrio
end type
type dw_vig from datawindow within w_equilibrio
end type
type dw_muestras from datawindow within w_equilibrio
end type
type rb_13 from radiobutton within w_equilibrio
end type
type rb_14 from radiobutton within w_equilibrio
end type
end forward

global type w_equilibrio from w_center
string tag = "Realizó Cambios en rubros de equilibrio, desea guardarlos ?."
integer width = 4146
integer height = 2004
string title = "Presupuesto - Rubros de Equilibrio"
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_equip.ico"
dw_ing dw_ing
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
rb_8 rb_8
rb_9 rb_9
st_1 st_1
pb_2 pb_2
gb_2 gb_2
dw_10 dw_10
rb_10 rb_10
rb_11 rb_11
rb_12 rb_12
pb_1 pb_1
pb_3 pb_3
dw_eq dw_eq
gb_1 gb_1
gb_3 gb_3
dw_vig dw_vig
dw_muestras dw_muestras
rb_13 rb_13
rb_14 rb_14
end type
global w_equilibrio w_equilibrio

type variables
long vigencia, i_nivel
boolean cambia
uo_datastore dw_gastos

end variables

forward prototypes
public function integer set_order (integer nivel)
public function integer f_pregunta ()
public function integer grabar ()
public function integer f_set_eqmov (long cod_vigencia)
public function integer check_eq ()
public function integer ch_nivel (integer nivel)
public function string getlevel (string codtotal)
public function string getnextlevel (string codtotal)
public function string getpred (integer fila)
end prototypes

public function integer set_order (integer nivel);string ret

if nivel >= 2 and i_nivel < 2 then
	ret = dw_10.describe("codtotal.x")
	dw_10.Modify('subgrupo.visible=1 subgrupo_t.Visible=1')
	dw_10.Modify('subgrupo.x="'+string(long(ret)-5)+'"')
end if
if nivel >= 3 and i_nivel < 3 then
	ret = dw_10.describe("codtotal.x")
	dw_10.Modify('mayor.visible=1 mayor_t.Visible=1')
	dw_10.Modify('mayor.x="'+string(long(ret)-5)+'"')
end if
if nivel >= 4 and i_nivel < 4 then
	ret = dw_10.describe("codtotal.x")
	dw_10.Modify('auxiliar.visible=1 auxiliar_t.Visible=1')
	dw_10.Modify('auxiliar.x="'+string(long(ret)-5)+'"')
end if
if nivel >= 5 and i_nivel < 5 then
	ret = dw_10.describe("codtotal.x")
	dw_10.Modify('ordinal.visible=1 ordinal_t.Visible=1')
	dw_10.Modify('ordinal.x="'+string(long(ret)-5)+'"')
end if
if nivel >= 6 and i_nivel < 6 then
	ret = dw_10.describe("codtotal.x")
	dw_10.Modify('subauxi.visible=1 subauxi_t.Visible=1')
	dw_10.Modify('subauxi.x="'+string(long(ret)-5)+'"')
end if
if nivel >= 7 and i_nivel < 7 then
	ret = dw_10.describe("codtotal.x")
	dw_10.Modify('subordinal.visible=1 subordinal_t.Visible=1')
	dw_10.Modify('subordinal.x="'+string(long(ret)-5)+'"')
end if
if nivel >= 8 and i_nivel < 8 then
	ret = dw_10.describe("codtotal.x")
	dw_10.Modify('nivel1.visible=1 nivel1_t.Visible=1')
	dw_10.Modify('nivel1.x="'+string(long(ret)-5)+'"')
end if
if nivel = 9 or nivel = 10 or nivel = 11 then
	ret = dw_10.describe("codtotal.x")
	dw_10.Modify('nivel2.visible=1 nivel2_t.Visible=1')
	dw_10.Modify('nivel2.x="'+string(long(ret)-5)+'"')
end if
i_nivel = nivel
Return 0

end function

public function integer f_pregunta ();if not cambia then return 2
return messagebox("Atención, realizó cambios",this.tag,question!,yesnocancel!,3)
end function

public function integer grabar ();if rb_12.checked = TRUE then
	messageBox('Aviso','Modificaciones solo grabables desde la vista Ingresos.')
	Return -1
end if
if dw_eq.Update() = -1 then
	Rollback;
end if
cambia = FALSE
commit;
Return 0

end function

public function integer f_set_eqmov (long cod_vigencia);long i, j, k, fila 
uo_datastore dw_equ, dw_ctai, dw_ctag, dw_eqmv

dw_equ = Create uo_datastore
dw_equ.DataObject = "dw_equilibrio"
dw_equ.SetTransObject(SQLCA)

dw_eqmv = Create uo_datastore
dw_eqmv.DataObject = "dw_eqmov"
dw_eqmv.SetTransObject(SQLCA)
dw_eqmv.Retrieve(cod_vigencia)

dw_ctai = Create uo_datastore
dw_ctai.DataObject = "dw_plan_ppto"
dw_ctai.SetTransObject(SQLCA)
dw_ctai.Retrieve(cod_vigencia)

dw_ctag = Create uo_datastore
dw_ctag.DataObject = "dw_plan_ppto"
dw_ctag.SetTransObject(SQLCA)
dw_ctag.Retrieve(cod_vigencia)

if dw_equ.Retrieve(cod_vigencia,'%','%') > 0 then
	for i = 1 to dw_eq.RowCount()
		dw_ctai.SetFilter("codtotal like '" + dw_equ.GetItemString(i,'codtotal') + "%' and movimiento = '1'")
		dw_ctag.SetFilter("codtotal like '" + dw_equ.GetItemString(i,'codtotal_gasto') + "%' and movimiento = '1'")
		for j = 1 to dw_ctai.RowCount()
			for k = 1 to dw_ctag.RowCount()
				fila = dw_eqmv.Find("codtotal='" + dw_ctai.GetItemString(j,'codtotal') + "' and codtotal_gasto='" + dw_ctag.GetItemString(k,'codtotal') + "'",1,dw_eqmv.RowCount())
				if fila = 0 then
					fila = dw_eqmv.InsertRow(0)
					dw_eqmv.SetItem(fila,'cod_vigencia',cod_vigencia)
					dw_eqmv.SetItem(fila,'codtotal',dw_ctai.GetItemString(j,'codtotal'))
					dw_eqmv.SetItem(fila,'cod_vigen_gasto',cod_vigencia)
					dw_eqmv.SetItem(fila,'codtotal_gasto',dw_ctag.GetItemString(k,'codtotal'))
				end if
			next
		next
	next
end if
if dw_eqmv.Update() = -1 then
	Rollback;
	Return -1
end if

Return 0
end function

public function integer check_eq ();long i, fila, f
string codtotal, nivel

for i = 1 to dw_10.RowCount()
	dw_10.SetItem(i,'selec',0)
Next

For i = 1 to dw_eq.RowCount()
	if rb_11.checked = TRUE then
		codtotal = dw_eq.GetItemString(i,'codtotal_gasto')
	else
		codtotal = dw_eq.GetItemString(i,'codtotal')
	end if
	fila = dw_10.Find("codtotal='"+ codtotal +"'",1,dw_10.RowCount())
	if fila > 0 then
		dw_10.SetItem(fila,'selec',1)
		codtotal = getpred(fila)
		do while codtotal <> ''
			f = dw_10.Find("codtotal='"+ codtotal +"'",1,dw_10.RowCount())
			if f > 0 then
				dw_10.SetItem(f,'selec',10)
				codtotal = getpred(f)
			end if
		loop
	end if
Next

Return 0

end function

public function integer ch_nivel (integer nivel);string ret, filtro
long retorno
if i_nivel = nivel then Return 0
ret = dw_10.describe("codtotal.x")
if rb_11.checked = TRUE then
	Filtro = "tipo='1' "
else
	Filtro = "tipo='0' "
end if	


if nivel = 9 then
	dw_10.SetFilter(filtro)
elseif nivel = 8 then
	dw_10.SetFilter(filtro + "and isNull(nivel2) and not isNull(nivel1)")
	dw_10.Modify('nivel2.Visible=0')
elseif nivel = 7 then
	dw_10.SetFilter(filtro + "and isNull(nivel1) and not isNull(subordinal)")
	dw_10.Modify('nivel1.visible=0 nivel2.Visible=0')
elseif nivel = 6 then
	dw_10.SetFilter(filtro + "and isNull(subordinal) and not isNull(subauxi)")
	dw_10.Modify('subordinal.visible=0 nivel1.visible=0 nivel2.visible=0')
elseif nivel = 5 then
	dw_10.SetFilter(filtro + "and isNull(subauxi) and not isNull(ordinal)")
	dw_10.Modify('subauxi.visible=0 subordinal.visible=0 nivel1.visible=0 nivel2.visible=0')
elseif nivel = 4 then
	dw_10.SetFilter(filtro + "and isNull(ordinal) and not isNull(auxiliar)")
	dw_10.Modify('ordinal.visible=0 subauxi.visible=0 subordinal.visible=0 nivel1.visible=0 nivel2.visible=0')
elseif nivel = 3 then
	dw_10.SetFilter(filtro + "and isNull(auxiliar) and not isNull(mayor)")
	dw_10.Modify('auxiliar.visible=0 ordinal.visible=0 subauxi.visible=0 subordinal.visible=0 nivel1.visible=0 nivel2.visible=0')
elseif nivel = 2 then
	dw_10.SetFilter(filtro + "and isNull(mayor) and not isNull(subgrupo)")
	dw_10.Modify('mayor.visible=0 auxiliar.visible=0 ordinal.visible=0 subauxi.visible=0 subordinal.visible=0 nivel1.visible=0 nivel2.visible=0')
elseif nivel = 1 then
	dw_10.SetFilter(filtro + "and isNull(subgrupo) and not isNull(grupo)")
	dw_10.Modify('subgrupo.visible=0 mayor.visible=0 auxiliar.visible=0 ordinal.visible=0 subauxi.visible=0 subordinal.visible=0 nivel1.visible=0 nivel2.visible=0')
end if

set_order(nivel)
dw_10.Filter()
check_eq()
if nivel = 10 then
	filtro = dw_10.Describe("DataWindow.Table.Filter")
	dw_10.SetFilter(filtro + " and selec=1")
	dw_10.Filter()
elseif nivel = 11 then
	filtro = dw_10.Describe("DataWindow.Table.Filter")
	dw_10.SetFilter(filtro + " and movimiento='1' ")
	dw_10.Filter()	
end if

//dw_ing.TriggerEvent(rowfocuschanged!)
//dw_10.SetSort("grupo A subgrupo A mayor A auxiliar A ordinal A subauxiliar A subordinal A Nivel1 A Nivel2 A")
dw_10.Sort()

Return 0

end function

public function string getlevel (string codtotal);string gr,sg,my,au,od,sa,so,n1,n2

select grupo,subgrupo,mayor,auxiliar,ordinal,subauxi,subordinal,nivel1,nivel2 
into :gr,:sg,:my,:au,:od,:sa,:so,:n1,:n2 from pre_plan
where cod_vigencia=:vigencia and codtotal=:codtotal;

IF SQLCA.SQLCode <> -1 then
	if not isNull(n2) then
		Return 'nivel2'
	elseif not isNull(n1) then
		Return 'nivel1'
	elseif not isNull(so) then
		Return 'subordinal'
	elseif not isNull(sa) then
		Return 'subauxi'	
	elseif not isNull(od) then
		Return 'ordinal'
	elseif not isNull(au) then
		Return 'auxiliar'
	elseif not isNull(my) then
		Return 'mayor'
	elseif not isNull(sg) then
		Return 'subgrupo'
	elseif not isNull(gr) then
		Return 'grupo'
	end if
end if
Return ''

end function

public function string getnextlevel (string codtotal);
string gr,sg,my,au,od,sa,so,n1,n2

select grupo,subgrupo,mayor,auxiliar,ordinal,subauxi,subordinal,nivel1,nivel2 
into :gr,:sg,:my,:au,:od,:sa,:so,:n1,:n2 from pre_plan
where cod_vigencia=:vigencia and codtotal = :codtotal;

IF SQLCA.SQLCode <> -1 then
	if not isNull(n2) then
		Return ''
	elseif not isNull(n1) then
		Return 'nivel2'
	elseif not isNull(so) then
		Return 'nivel1'
	elseif not isNull(sa) then
		Return 'subordinal'	
	elseif not isNull(od) then
		Return 'subauxi'
	elseif not isNull(au) then
		Return 'ordinal'
	elseif not isNull(my) then
		Return 'auxiliar'
	elseif not isNull(sg) then
		Return 'mayor'
	elseif not isNull(gr) then
		Return 'subgrupo'
	end if
end if
Return ''

end function

public function string getpred (integer fila);string codigo, gr,sg,my,au,od,sa,so,n1
int i, nivel, f
double vig

gr = dw_10.GetItemString(fila,'grupo')
sg = dw_10.GetItemString(fila,'subgrupo')
my = dw_10.GetItemString(fila,'mayor')
au = dw_10.GetItemString(fila,'auxiliar')
od = dw_10.GetItemString(fila,'ordinal')
sa = dw_10.GetItemString(fila,'subauxi')
so = dw_10.GetItemString(fila,'subordinal')
n1 = dw_10.GetItemString(fila,'nivel1')

vig = dw_10.GetItemNumber(fila,'cod_vigencia')

for i = 3 to 11
	if isNull(dw_10.GetItemString(fila,i)) or dw_10.GetItemString(fila,i) = '' then
		nivel = i - 4
		EXIT
	end if
next

codigo = ''

if nivel = 8 then
	f = dw_10.Find("grupo='" + gr+ "' and subgrupo='" + sg+ "' and mayor='" + my+ "' and auxiliar='" + au+ "' and ordinal='" + od+ "' and subauxi='" + sa+ "' and subordinal='" + so+ "' and nivel1='" + n1 +"' and isNull(nivel2)",1,dw_10.RowCount())
	if f > 0 then codigo = dw_10.GetItemString(f,'codtotal')
elseif nivel = 7 then
	f = dw_10.Find("grupo='" + gr+ "' and subgrupo='" + sg+ "' and mayor='" + my+ "' and auxiliar='" + au+ "' and ordinal='" + od+ "' and subauxi='" + sa+ "' and subordinal='" + so+ "' and isNull(nivel1)",1,dw_10.RowCount())
	if f > 0 then codigo = dw_10.GetItemString(f,'codtotal')
elseif nivel = 6 then
	f = dw_10.Find("grupo='" + gr+ "' and subgrupo='" + sg+ "' and mayor='" + my+ "' and auxiliar='" + au+ "' and ordinal='" + od+ "' and subauxi='" + sa+ "' and isNull(subordinal)",1,dw_10.RowCount())
	if f > 0 then codigo = dw_10.GetItemString(f,'codtotal')
elseif nivel = 5 then
	f = dw_10.Find("grupo='" + gr+ "' and subgrupo='" + sg+ "' and mayor='" + my+ "' and auxiliar='" + au+ "' and ordinal='" + od+ "' and isNull(subauxi)",1,dw_10.RowCount())
	if f > 0 then codigo = dw_10.GetItemString(f,'codtotal')
elseif nivel = 4 then
	f = dw_10.Find("grupo='" + gr+ "' and subgrupo='" + sg+ "' and mayor='" + my+ "' and auxiliar='" + au+ "' and isNull(ordinal)",1,dw_10.RowCount())
	if f > 0 then codigo = dw_10.GetItemString(f,'codtotal')
elseif nivel = 3 then
	f = dw_10.Find("grupo='" + gr+ "' and subgrupo='" + sg+ "' and mayor='" + my+ "' and isNull(auxiliar)",1,dw_10.RowCount())
	if f > 0 then codigo = dw_10.GetItemString(f,'codtotal')
elseif nivel = 2 then
	f = dw_10.Find("grupo='" + gr+ "' and subgrupo='" + sg+ "' and isNull(mayor)",1,dw_10.RowCount())
	if f > 0 then codigo = dw_10.GetItemString(f,'codtotal')
elseif nivel = 1 then
	f = dw_10.Find("grupo='" + gr+ "' and isNull(subgrupo)",1,dw_10.RowCount())
	if f > 0 then codigo = dw_10.GetItemString(f,'codtotal')
end if

Return codigo

end function

on w_equilibrio.create
int iCurrent
call super::create
this.dw_ing=create dw_ing
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.rb_8=create rb_8
this.rb_9=create rb_9
this.st_1=create st_1
this.pb_2=create pb_2
this.gb_2=create gb_2
this.dw_10=create dw_10
this.rb_10=create rb_10
this.rb_11=create rb_11
this.rb_12=create rb_12
this.pb_1=create pb_1
this.pb_3=create pb_3
this.dw_eq=create dw_eq
this.gb_1=create gb_1
this.gb_3=create gb_3
this.dw_vig=create dw_vig
this.dw_muestras=create dw_muestras
this.rb_13=create rb_13
this.rb_14=create rb_14
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_ing
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.rb_5
this.Control[iCurrent+7]=this.rb_6
this.Control[iCurrent+8]=this.rb_7
this.Control[iCurrent+9]=this.rb_8
this.Control[iCurrent+10]=this.rb_9
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.pb_2
this.Control[iCurrent+13]=this.gb_2
this.Control[iCurrent+14]=this.dw_10
this.Control[iCurrent+15]=this.rb_10
this.Control[iCurrent+16]=this.rb_11
this.Control[iCurrent+17]=this.rb_12
this.Control[iCurrent+18]=this.pb_1
this.Control[iCurrent+19]=this.pb_3
this.Control[iCurrent+20]=this.dw_eq
this.Control[iCurrent+21]=this.gb_1
this.Control[iCurrent+22]=this.gb_3
this.Control[iCurrent+23]=this.dw_vig
this.Control[iCurrent+24]=this.dw_muestras
this.Control[iCurrent+25]=this.rb_13
this.Control[iCurrent+26]=this.rb_14
end on

on w_equilibrio.destroy
call super::destroy
destroy(this.dw_ing)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.rb_8)
destroy(this.rb_9)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.gb_2)
destroy(this.dw_10)
destroy(this.rb_10)
destroy(this.rb_11)
destroy(this.rb_12)
destroy(this.pb_1)
destroy(this.pb_3)
destroy(this.dw_eq)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.dw_vig)
destroy(this.dw_muestras)
destroy(this.rb_13)
destroy(this.rb_14)
end on

event open;call super::open;dw_vig.SetTransObject(SQLCA)
dw_ing.SetTransObject(SQLCA)
dw_10.SetTransObject(SQLCA)
dw_eq.SetTransObject(SQLCA)
dw_gastos = CREATE uo_datastore
dw_gastos.DataObject = dw_10.DataObject
dw_vig.InsertRow(0)
i_nivel = 9
dw_10.SetFilter("tipo='1'")
dw_10.Filter()
dw_ing.SetFilter("tipo='0'")
dw_ing.Filter()

select cod_vigencia into :vigencia from pre_vigencia
where estado = '0';
if SQLCA.SQLCode = 0 then
	dw_vig.SetItem(1,'cod_vigencia',vigencia)
	dw_vig.TriggerEvent(itemchanged!)
end if
cambia = false


end event

event resize;call super::resize;int pedazo
pedazo=(newheight/2)- 400

gb_2.resize(newwidth -80, pedazo + 200)
dw_ing.resize(newwidth -150, pedazo+190)

gb_1.y=gb_2.y+gb_2.height 
gb_1.resize(newwidth -90, pedazo + 220)


rb_1.y=gb_1.y+72
rb_2.y=gb_1.y+72
rb_3.y=gb_1.y+72
rb_4.y=gb_1.y+72
rb_5.y=gb_1.y+72
rb_6.y=gb_1.y+72
rb_7.y=gb_1.y+72
rb_8.y=gb_1.y+72
rb_9.y=gb_1.y+72
rb_10.y=gb_1.y+72
rb_14.y=gb_1.y+72
rb_13.y=gb_1.y+72

dw_10.y=gb_1.y+172
dw_10.resize(newwidth -150,pedazo)


pb_1.y=newheight - 132
pb_3.y=newheight - 132
pb_2.y=newheight - 132
pb_grabar.y=newheight - 132
end event

type pb_grabar from w_center`pb_grabar within w_equilibrio
integer x = 2528
integer y = 1760
integer taborder = 70
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;call super::clicked;if rb_12.checked = TRUE then
	messageBox('Aviso','Modificaciones solo grabables desde la vista Ingresos.')
	Return -1
end if
if dw_eq.Update() = -1 then
	Rollback;
end if
cambia = FALSE
commit;
Return 0
end event

type dw_ing from datawindow within w_equilibrio
integer x = 73
integer y = 252
integer width = 3913
integer height = 440
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cta_ingreso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.RowCount() = 0 or currentRow = 0 then Return
SetPointer(HourGlass!)
string codtotal
long filas, fila
codtotal = this.GetItemString(this.GetRow(),'codTotal')
if rb_11.checked = TRUE then
	dw_eq.SetFilter("codtotal like '" + codtotal + "%'")
else
	dw_eq.SetFilter("codtotal_gasto like '" + codtotal + "%'")
end if	
dw_eq.Filter()
check_eq()

end event

event rowfocuschanging;if cambia then
	int rta
	rta = messageBox('Aviso','Desea guardar los cambios?',Question!,YESNOCANCEL!) 
	if rta = 1 then
		pb_grabar.TriggerEvent(clicked!)
	elseif rta = 2 then
		dw_eq.retrieve(dw_vig.GetItemNumber(1,'cod_vigencia'))
		cambia = False
	elseif rta = 3 then
		Return -1
	end if
end if

//string codtotal_gasto, codtotal
//long filas, fila
//
//if rb_11.checked = TRUE then
//	codtotal = this.GetItemString(newrow,'codTotal')
//	codtotal_gasto = '%'
//else
//	codtotal_gasto = this.GetItemString(newrow,'codTotal')
//	codtotal = '%'
//end if	
//filas = dw_eq.Retrieve(this.GetItemNumber(newrow,'cod_vigencia'),codtotal,codtotal_gasto)
//if filas = 0 then
//	do while filas = 0
//		if len(codtotal) = 1 and len(codtotal_gasto) = 1 then Exit
//		if len(codtotal) > 1 then
//			codtotal = left(codtotal,len(codtotal) - 1)
//		end if
//		if len(codtotal_gasto) > 1 then
//			codtotal_gasto = left(codtotal_gasto,len(codtotal_gasto) - 1)
//		end if
//		filas = dw_eq.Retrieve(this.GetItemNumber(newrow,'cod_vigencia'),codtotal,codtotal_gasto)
//	loop
//	if filas > 0 then
//		string cta_t
//		if rb_11.checked = TRUE then
//			cta_t = codtotal
//		else
//			cta_t = codtotal_gasto
//		end if	
//		Messagebox('Aviso','La cuenta seleccionada esta contenida dentro de la cuenta '+cta_t+' ya esta relacionada')
//		fila = dw_ing.Find("codtotal='"+cta_t+"'",1,dw_ing.RowCount())
//		if fila > 0 then
//			dw_ing.ScrolltoRow(fila)
//		end if
//		Return -1
//	end if
//end if


end event

type rb_1 from radiobutton within w_equilibrio
integer x = 64
integer y = 836
integer width = 242
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(1)
end if

end event

type rb_2 from radiobutton within w_equilibrio
integer x = 306
integer y = 836
integer width = 320
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subgrupo"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(2)
end if

end event

type rb_3 from radiobutton within w_equilibrio
integer x = 645
integer y = 836
integer width = 242
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mayor"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(3)
end if

end event

type rb_4 from radiobutton within w_equilibrio
integer x = 887
integer y = 836
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Auxiliar"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(4)
end if

end event

type rb_5 from radiobutton within w_equilibrio
integer x = 1166
integer y = 836
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordinal"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(5)
end if

end event

type rb_6 from radiobutton within w_equilibrio
integer x = 1445
integer y = 836
integer width = 347
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SubAuxiliar"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(6)
end if

end event

type rb_7 from radiobutton within w_equilibrio
integer x = 1824
integer y = 836
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SubOrdinal"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(7)
end if

end event

type rb_8 from radiobutton within w_equilibrio
integer x = 2181
integer y = 836
integer width = 251
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nivel 1"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(8)
end if

end event

type rb_9 from radiobutton within w_equilibrio
integer x = 2670
integer y = 836
integer width = 238
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;if this.checked = TRUE then
	ch_nivel(9)
end if

end event

type st_1 from statictext within w_equilibrio
integer x = 46
integer y = 8
integer width = 261
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vigencia:"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_equilibrio
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 2373
integer y = 1760
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type gb_2 from groupbox within w_equilibrio
integer x = 37
integer y = 176
integer width = 3991
integer height = 552
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresos"
end type

type dw_10 from datawindow within w_equilibrio
integer x = 73
integer y = 932
integer width = 3909
integer height = 772
integer taborder = 30
string title = "none"
string dataobject = "dw_plan_equ"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if this.Rowcount() = 0 or row = 0 then Return
long filai, fila, i, selant
string campo, cod_ingreso, cod_gasto, nivel

if rb_11.checked = TRUE then
	campo = 'codtotal_gasto'
else
	campo = 'codtotal'
end if

if this.GetColumnName() = 'selec' then
	selant = this.GetItemNumber(this.GetRow(),'selec')
	if dw_ing.GetItemString(dw_ing.GetRow(),'movimiento') = '0' then
		Messagebox('Aviso','En las cuentas de Ingreso, seleccione de movimiento')
		this.SetItem(this.GetRow(),'selec',selant)
		this.SetText(string(selant))
		Return 2
	end if
	
	if GetItemString(GetRow(),'movimiento') = '0' then
		Messagebox('Aviso','Solo puede seleccionar cuentas de movimiento')
		this.SetItem(this.GetRow(),'selec',selant)
		this.SetText(string(selant))
		Return 2
	end if
	
	filai = dw_ing.GetRow()
	cod_ingreso = dw_ing.GetItemString(dw_ing.GetRow(),'codtotal')
	cod_gasto = this.GetItemString(this.GetRow(),'codtotal')
	
	if selant = 10 then
		this.SetItem(this.GetRow(),'selec',selant)
		this.SetText(string(selant))
		return 2
	end if
	
	if selant = 1 then
		fila = dw_eq.Find("monto_gasto > 0 and " + campo +"='" + this.GetItemString(this.GetRow(),'codtotal') + "'",1,dw_eq.RowCount())
		if fila >0 then
			messagebox('Error','Para la cuenta sus montos de gastos son mayores de cero')
			this.SetItem(this.GetRow(),'selec',selant)
			this.SetText(string(selant))
			return 2
		else
			fila = dw_eq.Find(campo + "='" + this.GetItemString(this.GetRow(),'codtotal') + "'",1,dw_eq.RowCount())
			if fila > 0 then
				dw_eq.DeleteRow(fila)
				cambia = TRUE
				this.SetItem(this.GetRow(),'selec',0)
				this.SetText(string(0))
			end if
		end if
	elseif selant = 0 then
		dw_eq.InsertRow(1)
		dw_eq.SetItem(1,'cod_vigencia',dw_ing.GetItemNumber(filai,'cod_vigencia'))
		dw_eq.SetItem(1,'codtotal',dw_ing.GetItemString(filai,'codtotal'))
		dw_eq.SetItem(1,'cod_vigen_gasto',GetItemNumber(GetRow(),'cod_vigencia'))
		dw_eq.SetItem(1,'codtotal_gasto',GetItemString(GetRow(),'codtotal'))
		this.SetItem(this.GetRow(),'selec',1)
		this.SetText(string(1))
	end if
end if

check_eq()
Return 2

end event

type rb_10 from radiobutton within w_equilibrio
integer x = 2912
integer y = 836
integer width = 425
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccionadas"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(10)
end if
end event

type rb_11 from radiobutton within w_equilibrio
integer x = 791
integer y = 76
integer width = 293
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresos"
boolean checked = true
end type

event clicked;dw_ing.SetFilter("tipo='0'")
dw_ing.Filter()
dw_10.SetFilter("tipo='1'")
dw_10.Filter()
dw_ing.Sort()
dw_10.Sort()
dw_10.Modify("selec.protect=0")
gb_2.text = 'Ingresos'
gb_1.text = 'Gastos'

end event

type rb_12 from radiobutton within w_equilibrio
integer x = 1106
integer y = 84
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gastos"
end type

event clicked;if cambia then
	int rta
	rta = messageBox('Aviso','Desea guardar los cambios?',Question!,YESNOCANCEL!) 
	if rta = 1 then
		pb_grabar.TriggerEvent(clicked!)
	elseif rta = 2 then
		cambia = False
	elseif rta = 3 then
		Return -1
	end if
end if
MessageBox('Aviso','Solo para consulta. Las relaciones se establecen desde Ingresos')
dw_ing.SetFilter("tipo='1'")
dw_ing.Filter()
dw_10.SetFilter("tipo='0'")
dw_10.Filter()
dw_ing.Sort()
dw_10.Sort()
dw_10.Modify("selec.protect=1")
gb_1.text = 'Ingresos'
gb_2.text = 'Gastos'

end event

type pb_1 from picturebutton within w_equilibrio
event mousemove pbm_mousemove
string tag = "Exportar Plan"
integer x = 2062
integer y = 1760
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "export.gif"
string disabledname = "d_export.gif"
string powertiptext = "Exportar Plan"
end type

event clicked;dw_eq.Retrieve(dw_vig.GetItemNumber(1,'cod_vigencia'),'%','%')
openwithparm(w_export,dw_eq)
dw_ing.TriggerEvent(rowfocuschanged!)
end event

type pb_3 from picturebutton within w_equilibrio
event mousemove pbm_mousemove
string tag = "Importar Plan desde Archivo separado por TAB´s"
integer x = 2222
integer y = 1760
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "import.gif"
string disabledname = "d_import.gif"
string powertiptext = "Importar Plan desde Archivo separado por TAB´s"
end type

event clicked;string docname, named
long value,cuantas_f
value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
cuantas_f = dw_eq.rowcount()
IF value = 1 THEN
	value = dw_eq.importfile(docname)
	if value < 0 then 
		messagebox("Error "+string(value),"No se pudieron importar los datos")
		return
	end if
end if
if dw_eq.rowcount() <> cuantas_f then
	cambio=true
end if

end event

type dw_eq from datawindow within w_equilibrio
boolean visible = false
integer x = 1769
integer y = 420
integer width = 1481
integer height = 160
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_eqmov"
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_equilibrio
integer x = 37
integer y = 764
integer width = 3977
integer height = 992
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gastos"
end type

type gb_3 from groupbox within w_equilibrio
integer x = 750
integer y = 32
integer width = 645
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vista"
end type

type dw_vig from datawindow within w_equilibrio
integer x = 41
integer y = 72
integer width = 686
integer height = 76
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigen"
boolean border = false
boolean livescroll = true
end type

event itemchanged;call super::itemchanged;
this.accepttext()

vigencia = this.GetItemNumber(this.GetRow(),'cod_vigencia')
w_principal.SetMicroHelp("Leyendo Registros")
timer(1)
dw_eq.Retrieve(vigencia)
dw_ing.Retrieve(vigencia)
dw_10.Retrieve(vigencia)
dw_ing.TriggerEvent(rowfocuschanged!)
//dw_gastos.Retrieve(vigencia)
w_principal.setmicrohelp("Gestión Cliente Interno")
cambia = false
end event

type dw_muestras from datawindow within w_equilibrio
integer x = 1408
integer y = 32
integer width = 2085
integer height = 152
boolean bringtotop = true
string title = "none"
string dataobject = "dw_muestras_ppto"
boolean border = false
boolean livescroll = true
end type

type rb_13 from radiobutton within w_equilibrio
integer x = 3351
integer y = 832
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Movimiento"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(11)
end if
end event

type rb_14 from radiobutton within w_equilibrio
integer x = 2409
integer y = 836
integer width = 251
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nivel 2"
end type

event clicked;if this.checked = TRUE then
	ch_nivel(9)
end if

end event

