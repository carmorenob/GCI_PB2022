$PBExportHeader$w_formulario.srw
forward
global type w_formulario from window
end type
type vsb_1 from vscrollbar within w_formulario
end type
type cb_2 from commandbutton within w_formulario
end type
type pb_2 from picturebutton within w_formulario
end type
type pb_print from picturebutton within w_formulario
end type
type pb_1 from picturebutton within w_formulario
end type
type cb_1 from commandbutton within w_formulario
end type
type dw_texto from datawindow within w_formulario
end type
type st_1 from statictext within w_formulario
end type
type dw_ls from datawindow within w_formulario
end type
type dw_p from datawindow within w_formulario
end type
type dw_campo from datawindow within w_formulario
end type
type gb_1 from groupbox within w_formulario
end type
end forward

global type w_formulario from window
integer width = 3520
integer height = 1548
boolean titlebar = true
string title = "Historia Clínica - Formulario"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
integer unitsperline = 3
integer unitspercolumn = 5
boolean clientedge = true
boolean center = true
event vscroll pbm_vscroll
vsb_1 vsb_1
cb_2 cb_2
pb_2 pb_2
pb_print pb_print
pb_1 pb_1
cb_1 cb_1
dw_texto dw_texto
st_1 st_1
dw_ls dw_ls
dw_p dw_p
dw_campo dw_campo
gb_1 gb_1
end type
global w_formulario w_formulario

type variables
double contador
string lugar,codplantilla,coddoc
Boolean Ingreso = TRUE
Boolean b_fecha = FALSE
DateTime d_Fecha
Private long ncontrol = 10
Private datawindowchild dwc_p
Private string ocultar, codprof, cesp, indapdx, edita
Private boolean cambia, i_pl[30] 
st_evalua st_p
Long fdiag, fdiag2, fresul, fcond, PosX, PosY, vy = 0
uo_st u_st[]
uo_selec u_sel[]
uo_sino u_sn[]
uo_lista u_ls[]
uo_sle u_sle[]
uo_rte u_rte[]
uo_num u_num[]
uo_fec u_fec[]

end variables

forward prototypes
public function integer closecontrols ()
public function integer addchildren (string agrupa, integer nivel)
public function string getblob (string campo)
public function string getdiagrip (string codgeral)
public function string getdescdiag (string codgeral)
public function integer addcontrol (integer fila)
public function integer grabar ()
public function integer grabarmemo ()
public function string rtfsincampos (richtextedit rte)
public function long changefocus (long taborder)
end prototypes

event vscroll;//setMicroHelp('scrollCode:'+string(scrollcode) + '  scrollPos:'+string(scrollpos))

end event

public function integer closecontrols ();int i 

for i = 1 to upperBound(u_st[])
	CloseUserObject(u_st[i])
next
for i = 1 to upperBound(u_sel[])
	CloseUserObject(u_sel[i])
next
for i = 1 to upperBound(u_sn[])
	CloseUserObject(u_sn[i])
next
for i = 1 to upperBound(u_ls[])
	CloseUserObject(u_ls[i])
next
for i = 1 to upperBound(u_sle[])
	CloseUserObject(u_sle[i])
next
for i = 1 to upperBound(u_rte[])
	CloseUserObject(u_rte[i])
next
//for i = 1 to upperBound(um_rte[])
//	CloseUserObject(um_rte[i])
//next
for i = 1 to upperBound(u_num[])
	CloseUserObject(u_num[i])
next

Return 0

end function

public function integer addchildren (string agrupa, integer nivel);integer fila, f, i, ret
st_uobject st_uo
string modifica, texto

fila = dw_campo.Find("agrupa='" + agrupa +"'",1,dw_campo.RowCount())
do while fila > 0
	PosX = 30 * Nivel
	if addControl(fila) = -1 then
		MessageBox('Error','Error Adicionando control')
		Return -1
	end if
	addChildren(dw_campo.GetItemString(fila,'codplantilla') + String(dw_campo.GetItemNumber(fila,'numcampo')), Nivel + 1)
	if fila = dw_campo.RowCount() then EXIT
	fila = dw_campo.Find("agrupa='" + agrupa +"'",fila + 1,dw_campo.RowCount())
loop
Return 0

end function

public function string getblob (string campo);blob memo
SQLCA.Autocommit = TRUE

choose case campo
	case 'valormemo1'
		selectblob valormemo1 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo2'
		selectblob valormemo2 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo3'
		selectblob valormemo3 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo4'
		selectblob valormemo4 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo5'
		selectblob valormemo5 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo6'
		selectblob valormemo6 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo7'
		selectblob valormemo7 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo8'
		selectblob valormemo8 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo9'
		selectblob valormemo9 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo10'
		selectblob valormemo10 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo11'
		selectblob valormemo11 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo12'
		selectblob valormemo12 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo13'
		selectblob valormemo13 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo14'
		selectblob valormemo14 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo15'
		selectblob valormemo15 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo16'
		selectblob valormemo16 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo17'
		selectblob valormemo17 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo18'
		selectblob valormemo18 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo19'
		selectblob valormemo19 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo20'
		selectblob valormemo20 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo21'
		selectblob valormemo21 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo22'
		selectblob valormemo22 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo23'
		selectblob valormemo23 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo24'
		selectblob valormemo24 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo25'
		selectblob valormemo25 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo26'
		selectblob valormemo26 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo27'
		selectblob valormemo27 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo28'
		selectblob valormemo28 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo29'
		selectblob valormemo29 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
	case 'valormemo30'
		selectblob valormemo30 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
end choose
Return string(memo)

SQLCA.Autocommit = FALSE

end function

public function string getdiagrip (string codgeral);string cod_rip

select cod_rips into :cod_rip from diags where codgeral=:codgeral;
If SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 then
	Return ''
end if
Return cod_rip

end function

public function string getdescdiag (string codgeral);string descripcion

select desdiag into :descripcion from diags where codgeral=:codgeral;
If SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 then
	Return ''
end if
Return descripcion

end function

public function integer addcontrol (integer fila);st_uobject st_uo
int f, i, ret
string modifica, texto
ncontrol = ncontrol + 1
if dw_campo.GetItemString(fila,'tipo') = '0' then
	f = upperBound(u_st[]) + 1
	ret = w_formulario.OpenUserObject(u_st[f],PosX,PosY)
	if ret = -1 then Return -1
	u_st[f].pos = u_st[f].y
	PosY = PosY + u_st[f].Height + 10
	u_st[f].SetLabel(dw_campo.GetItemString(fila,'descampo'))
end if

////Tipo de Control
// Seleccion
if dw_campo.GetItemString(fila,'tipo') = '1' then 
	st_uo.Field = dw_campo.GetItemString(fila,'campoguarda')
	st_uo.sValor = dw_texto.GetItemString(dw_texto.GetRow(),dw_campo.GetItemString(fila,'campoguarda'))
	f = upperBound(u_sel[]) + 1
	ret = w_formulario.OpenUserObjectwithParm(u_sel[f],st_uo,PosX,PosY)
	if ret = -1 then Return -1
	u_sel[f].TabOrder = ncontrol*10
	u_sel[f].pos = u_sel[f].y
	PosY = PosY + u_sel[f].Height + 10
	u_sel[f].SetLabel(dw_campo.GetItemString(fila,'descampo'))
end if
// Si / No
if dw_campo.GetItemString(fila,'tipo') = '2' then
	st_uo.Field = dw_campo.GetItemString(fila,'campoguarda')
	st_uo.sValor = dw_texto.GetItemString(dw_texto.GetRow(),dw_campo.GetItemString(fila,'campoguarda'))
	f = upperBound(u_sn[]) + 1
	ret = w_formulario.OpenUserObjectwithParm(u_sn[f],st_uo,PosX,PosY)
	if ret = -1 then Return -1
	u_sn[f].TabOrder = ncontrol*10
	u_sn[f].pos = u_sn[f].y
	PosY = PosY + u_sn[f].Height + 10
	u_sn[f].SetLabel(dw_campo.GetItemString(fila,'descampo'))
end if
// Lista
if dw_campo.GetItemString(fila,'tipo') = '3' then
	st_uo.Field = dw_campo.GetItemString(fila,'campoguarda')
	st_uo.dValor = dw_texto.GetItemNumber(dw_texto.GetRow(),dw_campo.GetItemString(fila,'campoguarda'))
	f = upperBound(u_ls[]) + 1
	ret = w_formulario.OpenUserObjectwithParm(u_ls[f],st_uo,PosX,PosY)
	if ret = -1 then Return -1
	u_ls[f].TabOrder = ncontrol*10
	u_ls[f].pos = u_ls[f].y
	PosY = PosY + u_ls[f].Height + 10
	u_ls[f].SetLabel(dw_campo.GetItemString(fila,'descampo'))
	dw_ls.Retrieve(dw_campo.GetItemString(fila,'codplantilla'),dw_campo.GetItemNumber(fila,'numcampo'))
	for i = 1 to dw_ls.RowCount()
		modifica = modifica + dw_ls.GetItemString(i,'descripcion') + "~t" + string(dw_ls.GetItemNumber(i,'nitem')) + "/"
	next
	u_ls[f].SetItem(modifica)
end if
// texto
if dw_campo.GetItemString(fila,'tipo') = '4' then
	st_uo.Field = dw_campo.GetItemString(fila,'campoguarda')
	st_uo.sValor = dw_texto.GetItemString(dw_texto.GetRow(),dw_campo.GetItemString(fila,'campoguarda'))
	f = upperBound(u_sle[]) + 1
	ret = w_formulario.OpenUserObjectwithParm(u_sle[f],st_uo,PosX,PosY)
	if ret = -1 then Return -1
	u_sle[f].TabOrder = ncontrol*10
	u_sle[f].pos = u_sle[f].y
	PosY = PosY + u_sle[f].Height + 10
	u_sle[f].SetLabel(dw_campo.GetItemString(fila,'descampo'))
end if
// Memo
if dw_campo.GetItemString(fila,'tipo') = '5' then
	st_uo.Field = dw_campo.GetItemString(fila,'campoguarda')
	
	st_uo.DisplayOnly = TRUE
	f = upperBound(u_rte[]) + 1
//	ret = w_formulario.OpenUserObjectwithParm(u_rte[f],st_uo,PosX + um_rte[f].width + 10,PosY)
	ret = w_formulario.OpenUserObjectwithParm(u_rte[f],st_uo,PosX + 10,PosY)
	if ret = -1 then Return -1
	ncontrol = ncontrol + 1
	u_rte[f].TabOrder = ncontrol*10
	u_rte[f].pos = u_rte[f].y
	PosY = PosY + u_rte[f].Height + 10
	u_rte[f].SetLabel(dw_campo.GetItemString(fila,'descampo'))
	texto = getBlob(st_uo.Field)
	if not (IsNull(texto) or texto = '')then
		texto = f_rtf(texto,TRUE)
		if u_rte[f].SetText(texto) = -1 then
			MessageBox('Error','No puede mostrarse el contenido del campo texto largo')
		end if
	end if

end if
// Numerico
if dw_campo.GetItemString(fila,'tipo') = '6' then
	st_uo.Field = dw_campo.GetItemString(fila,'campoguarda')
	st_uo.dValor = dw_texto.GetItemNumber(dw_texto.GetRow(),dw_campo.GetItemString(fila,'campoguarda'))
	f = upperBound(u_num[]) + 1
	ret = w_formulario.OpenUserObjectwithParm(u_num[f],st_uo,PosX,PosY)
	if ret = -1 then Return -1
	u_num[f].TabOrder = ncontrol*10
	u_num[f].pos = u_num[f].y
	u_num[f].SetLabel(dw_campo.GetItemString(fila,'descampo'))
	u_num[f].SetUnits(dw_campo.GetItemString(fila,'medida'))
	PosY = PosY + u_num[f].Height + 10
end if
// Fecha
if dw_campo.GetItemString(fila,'tipo') = '7' then
	st_uo.Field = dw_campo.GetItemString(fila,'campoguarda')
	st_uo.Fecha = dw_texto.GetItemDateTime(dw_texto.GetRow(),dw_campo.GetItemString(fila,'campoguarda'))
	f = upperBound(u_fec[]) + 1
	ret = w_formulario.OpenUserObjectwithParm(u_fec[f],st_uo,PosX,PosY)
	if ret = -1 then Return -1
	u_fec[f].TabOrder = ncontrol*10
	u_fec[f].pos = u_fec[f].y
	u_fec[f].SetLabel(dw_campo.GetItemString(fila,'descampo'))
	PosY = PosY + u_fec[f].Height + 10
end if
Return 0

end function

public function integer grabar ();IF dw_texto.Update() = 1 THEN
	COMMIT USING SQLCA;
ELSE
	ROLLBACK USING SQLCA;
	MessageBox("Status","Actualización.")
	Return -1
END IF

Return 0

end function

public function integer grabarmemo ();int fila, i, nfilas, ncampo
string texto,tscampos,sfecha //texto de los RichText's sin campos
blob memo
boolean existe=FALSE
DateTime dt

w_formulario.SetRedraw(FALSE)

SQLCA.Autocommit = TRUE

for i = 1 to UpperBound(u_rte[])
	tscampos = ''
	ncampo = integer(mid(u_rte[i].st_p.Field,10))
	if u_rte[i].changed then
		
		texto = u_rte[i].rte_1.CopyRTF(FALSE,Detail!)
		tscampos = RTFsincampos(u_rte[i].rte_1)
		memo = blob(texto)
		
		choose case ncampo
			case 1
				updateblob nom_evalua_cp set valormemo1=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 2
				updateblob nom_evalua_cp set valormemo2=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 3
				updateblob nom_evalua_cp set valormemo3=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 4
				updateblob nom_evalua_cp set valormemo4=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 5
				updateblob nom_evalua_cp set valormemo5=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 6
				updateblob nom_evalua_cp set valormemo6=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 7
				updateblob nom_evalua_cp set valormemo7=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 8
				updateblob nom_evalua_cp set valormemo8=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 9
				updateblob nom_evalua_cp set valormemo9=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 10
				updateblob nom_evalua_cp set valormemo10=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 11
				updateblob nom_evalua_cp set valormemo11=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 12
				updateblob nom_evalua_cp set valormemo12=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 13
				updateblob nom_evalua_cp set valormemo13=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 14
				updateblob nom_evalua_cp set valormemo14=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 15
				updateblob nom_evalua_cp set valormemo15=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 16
				updateblob nom_evalua_cp set valormemo16=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 17
				updateblob nom_evalua_cp set valormemo17=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 18
				updateblob nom_evalua_cp set valormemo18=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 19
				updateblob nom_evalua_cp set valormemo19=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 20
				updateblob nom_evalua_cp set valormemo20=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 21
				updateblob nom_evalua_cp set valormemo21=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 22
				updateblob nom_evalua_cp set valormemo22=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 23
				updateblob nom_evalua_cp set valormemo23=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 24
				updateblob nom_evalua_cp set valormemo24=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 25
				updateblob nom_evalua_cp set valormemo25=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 26
				updateblob nom_evalua_cp set valormemo26=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 27
				updateblob nom_evalua_cp set valormemo27=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 28
				updateblob nom_evalua_cp set valormemo28=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 29
				updateblob nom_evalua_cp set valormemo29=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
			case 30
				updateblob nom_evalua_cp set valormemo30=:memo where numdoc=:contador and clugar=:lugar and coddoc=:coddoc;
		end choose
		if SQLCA.sqlcode=-1 then
			messagebox("Error actualizando campo memo valormemo"+string(i),sqlca.sqlerrtext)
			Rollback;
			SQLCA.AutoCommit=false
			Return -1
		end if
				
	end if
next

SQLCA.Autocommit = FALSE
w_formulario.SetRedraw(TRUE)

Return 0

end function

public function string rtfsincampos (richtextedit rte);string campo, valor

campo = rte.InputFieldLocate(First!)
Do while campo <> ''
	valor = rte.InputFieldGetData(campo)
	rte.InputFieldDeleteCurrent()
	rte.ReplaceText(valor)
	campo = rte.InputFieldLocate(Next!)
Loop

Return rte.CopyRTF(FALSE,Detail!)

end function

public function long changefocus (long taborder);long i, nTab
uo_rte u_rtetmp
uo_lista u_listatmp
uo_num u_numtmp
uo_selec u_selectmp
uo_sino u_sinotmp
uo_sle u_sletmp
for i = 1 to upperBound(control[])
	choose case ClassName(control[i])
		case 'uo_rte'
			u_rtetmp = control[i]
			if u_rtetmp.TabOrder > TabOrder then
				u_rtetmp.rte_1.SetFocus()
				Return u_rtetmp.TabOrder
			end if
		case 'uo_lista'
			u_listatmp = control[i]
			if u_listatmp.TabOrder > TabOrder then
				u_listatmp.dw_1.SetFocus()
				Return u_listatmp.TabOrder
			end if
		case 'uo_num'
			u_numtmp = control[i]
			if u_numtmp.TabOrder > TabOrder then
				u_numtmp.em_1.SetFocus()
				Return u_numtmp.TabOrder
			end if
		case 'uo_selec'
			u_selectmp = control[i]
			if u_selectmp.TabOrder > TabOrder then
				u_selectmp.cbx_1.SetFocus()
				Return u_selectmp.TabOrder
			end if
		case 'uo_sino'
			u_sinotmp = control[i]
			if u_sinotmp.TabOrder > TabOrder then
				u_sinotmp.rb_1.SetFocus()
				Return u_sinotmp.TabOrder
			end if
		case 'uo_sle'
			u_sletmp = control[i]
			if u_sletmp.TabOrder > TabOrder then
				u_sletmp.sle_1.SetFocus()
				Return u_sletmp.TabOrder
			end if
	end choose
next

Return nTab

end function

on w_formulario.create
this.vsb_1=create vsb_1
this.cb_2=create cb_2
this.pb_2=create pb_2
this.pb_print=create pb_print
this.pb_1=create pb_1
this.cb_1=create cb_1
this.dw_texto=create dw_texto
this.st_1=create st_1
this.dw_ls=create dw_ls
this.dw_p=create dw_p
this.dw_campo=create dw_campo
this.gb_1=create gb_1
this.Control[]={this.vsb_1,&
this.cb_2,&
this.pb_2,&
this.pb_print,&
this.pb_1,&
this.cb_1,&
this.dw_texto,&
this.st_1,&
this.dw_ls,&
this.dw_p,&
this.dw_campo,&
this.gb_1}
end on

on w_formulario.destroy
destroy(this.vsb_1)
destroy(this.cb_2)
destroy(this.pb_2)
destroy(this.pb_print)
destroy(this.pb_1)
destroy(this.cb_1)
destroy(this.dw_texto)
destroy(this.st_1)
destroy(this.dw_ls)
destroy(this.dw_p)
destroy(this.dw_campo)
destroy(this.gb_1)
end on

event close;CloseControls()

end event

event open;st_p = Message.PowerObjectParm
if isValid(st_p) then
	coddoc = st_p.coddoc
	contador = st_p.numdoc
	lugar = st_p.lugar
	codplantilla = st_p.codplantilla
end if

select edita into :edita from profe
where codprof=:codprof;
if isNull(edita) then edita = '0'

if not isNull(codplantilla) and codplantilla <> '' then
	dw_p.SetItem(1,'codplantilla',codplantilla)
	dw_p.TriggerEvent(itemchanged!)
else
	if dwc_p.RowCount() > 0 then
		dw_p.SetItem(1,'codplantilla',dwc_p.GetItemString(1,'codplantilla'))
		dwc_p.SetRow(1)
		dw_p.TriggerEvent(itemchanged!)
	end if
end if


end event

event resize;vsb_1.Height = w_formulario.height - 170
vsb_1.MaxPosition = Posy
vsb_1.x = w_formulario.Width - 130
gb_1.Width = w_formulario.Width - 130
end event

event mousemove;//setMicroHelp('x:'+string(xPos) + '  y:'+string(ypos))

end event

type vsb_1 from vscrollbar within w_formulario
integer x = 3333
integer width = 73
integer height = 300
end type

event moved;long i
for i = 1 to upperBound(u_rte[])
	u_rte[i].y = u_rte[i].pos - scrollpos
//	um_rte[i].y = um_rte[i].pos - scrollpos
next
for i = 1 to upperBound(u_sel[])
	u_sel[i].y = u_sel[i].pos - scrollpos
next
for i = 1 to upperBound(u_sn[])
	u_sn[i].y = u_sn[i].pos - scrollpos
next
for i = 1 to upperBound(u_ls[])
	u_ls[i].y = u_ls[i].pos - scrollpos
next
for i = 1 to upperBound(u_sle[])
	u_sle[i].y = u_sle[i].pos - scrollpos
next
for i = 1 to upperBound(u_st[])
	u_st[i].y = u_st[i].pos - scrollpos
next
for i = 1 to upperBound(u_num[])
	u_num[i].y = u_num[i].pos - scrollpos
next
for i = 1 to upperBound(u_fec[])
	u_fec[i].y = u_fec[i].pos - scrollpos
next
Position = scrollpos

end event

event linedown;if position + 50 <= MaxPosition then
	Position = Position + 50
else
	Position = MaxPosition
end if
Event Moved(Position)

end event

event lineup;if position - 50 >= 0 then
	Position = Position - 50
else
	Position = 0
end if
Event Moved(Position)

end event

event pagedown;
if position + 250 <= MaxPosition then
	Position = Position + 250
else
	Position = MaxPosition
end if
Event Moved(Position)

end event

event pageup;if position - 250 >= 0 then
	Position = Position - 250
else
	Position = 0
end if
Event Moved(Position)

end event

type cb_2 from commandbutton within w_formulario
boolean visible = false
integer x = 1499
integer y = 176
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "none"
end type

event clicked;Event vscroll(3,0)
Event vscroll(8,0)

end event

type pb_2 from picturebutton within w_formulario
event mousemove pbm_mousemove
boolean visible = false
integer x = 3186
integer y = 220
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Traer Resultados de Apoyo Dx"
end type

event clicked;
end event

type pb_print from picturebutton within w_formulario
event mousemove pbm_mousemove
integer x = 3022
integer y = 20
integer width = 142
integer height = 124
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "print.gif"
string disabledname = "d_print.gif"
alignment htextalign = left!
string powertiptext = "Imprimir Reporte"
end type

event clicked;DataStore dw_r
dw_r = Create DataStore

if f_lee_dw_camino(tag,dw_r) = -1 then
	MessageBox('Error','No fue posible leer el reporte ' + tag)
end if
dw_r.Retrieve(contador,lugar,codplantilla)
st_xa_print_histo st
st.p_ds=dw_r
st.p_contador=contador
st.p_clug=lugar
st.p_cod_plant=codplantilla
if isvalid(w_reporte_gral) then
	w_reporte_gral.pasar_a_rtf(st)
else
	opensheetwithparm(w_reporte_gral,st,w_principal,7)
end if

end event

type pb_1 from picturebutton within w_formulario
event mousemove pbm_mousemove
integer x = 3168
integer y = 20
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar"
end type

event clicked;int nfilas, fila, i

if isNull(dw_texto.GetItemNumber(1,'numdoc')) then
	dw_texto.SetItem(1,'numdoc',contador)
	dw_texto.SetItem(1,'clugar',lugar)
	dw_texto.SetItem(1,'codplantilla',codplantilla)
	dw_texto.SetItem(1,'fecha',today())
end if

fila = dw_texto.GetRow()

for i = 1 to upperBound(u_sel[])
	if u_sel[i].Changed then
		dw_texto.SetItem(fila, u_sel[i].st_p.Field, u_sel[i].GetValue() )
	end if
next

for i = 1 to upperBound(u_sn[])
	if u_sn[i].Changed then
		dw_texto.SetItem(fila, u_sn[i].st_p.Field, u_sn[i].GetValue() )
	end if
next
for i = 1 to upperBound(u_ls[])
	if u_ls[i].Changed then
		dw_texto.SetItem(fila, u_ls[i].st_p.Field, u_ls[i].GetValue() )
	end if
next
for i = 1 to upperBound(u_sle[])
	if u_sle[i].Changed then
		dw_texto.SetItem(fila, u_sle[i].st_p.Field, u_sle[i].GetValue() )
	end if
next
for i = 1 to upperBound(u_num[])
	if u_num[i].Changed then
		dw_texto.SetItem(fila, u_num[i].st_p.Field, u_num[i].GetValue() )
	end if
next
for i = 1 to upperBound(u_fec[])
	if u_fec[i].Changed then
		dw_texto.SetItem(fila, u_fec[i].st_p.Field, u_fec[i].GetValue() )
	end if
next
if grabar() = 0 then
	if grabarmemo() = 1 then
		Return -1
	end if
else
	Return -1
end if

Return 0

end event

type cb_1 from commandbutton within w_formulario
integer x = 1600
integer y = 32
integer width = 699
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ver en Arbol"
end type

event clicked;opensheetwithparm(w_test,st_p,w_principal,0,layered!)
//w_test.uo_1.Retrieve(st_p.contador, st_p.clugar,st_p.codplantilla,st_p.codprof,st_p.cesp,st_p.indapdx,st_p.codtingre,st_p.cemp,st_p.ccont)
close(parent)

end event

type dw_texto from datawindow within w_formulario
boolean visible = false
integer x = 1998
integer y = 1012
integer width = 526
integer height = 248
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_histoevol"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type st_1 from statictext within w_formulario
integer x = 1115
integer y = 40
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plantilla"
boolean focusrectangle = false
end type

type dw_ls from datawindow within w_formulario
boolean visible = false
integer x = 2002
integer y = 568
integer width = 686
integer height = 400
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_hlista"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type dw_p from datawindow within w_formulario
integer x = 27
integer y = 32
integer width = 1093
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "dw_hlsplantilla"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_p.GetChild('codplantilla',dwc_p)
dwc_p.SetTransObject(SQLCA)
dwc_p.Retrieve()
dw_p.SetTransObject(SQLCA)
dw_p.InsertRow(1)

end event

event itemchanged;this.AcceptText()
int i, inul, fila
string vnul
CloseControls()
codplantilla = this.GetItemString(1,'codplantilla')

dw_texto.Reset()

dw_texto.Retrieve(contador,lugar,coddoc)
if dw_texto.RowCount() > 0 then
	if isNull(dw_texto.GetItemNumber(1,'numdoc')) then
		dw_texto.SetItemStatus(1,0,Primary!,NewModified!)
	end if
else
	dw_texto.InsertRow(1)
	dw_texto.SetItem(1,'viejo',1)
end if

dw_campo.Retrieve(codplantilla)

for i = 1 to 30
	i_pl[i] = FALSE
next

cambia = FALSE

UnitsPerLine = PosY * .95/ 100
LinesPerPage = Height / UnitsPerLine

vsb_1.Event Moved(0)

end event

type dw_campo from datawindow within w_formulario
boolean visible = false
integer x = 2002
integer y = 136
integer width = 686
integer height = 400
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "dw_hcampos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

event constructor;SetTransObject(SQLCA)

end event

event retrieveend;if rowcount = 0 then Return
integer i, f, Nivel=1

PosX = 10
PosY = 210

for i = 1 to this.RowCount()
	if IsNull(this.GetItemString(i,'agrupa')) then
		if addControl(i) = -1 then
			MessageBox('Error','Error Adicionando control')
			Return -1
		end if
		// Children
		addChildren(this.GetItemString(i,'codplantilla') + String(this.GetItemNumber(i,'numcampo')), Nivel + 1)
		//
	end if
next

end event

type gb_1 from groupbox within w_formulario
integer width = 3337
integer height = 152
integer taborder = 30
integer textsize = -2
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

