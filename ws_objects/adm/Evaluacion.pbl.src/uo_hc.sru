$PBExportHeader$uo_hc.sru
forward
global type uo_hc from userobject
end type
type cb_1 from commandbutton within uo_hc
end type
type st_emp from statictext within uo_hc
end type
type st_1 from statictext within uo_hc
end type
type sle_1 from singlelineedit within uo_hc
end type
type dw_p from datawindow within uo_hc
end type
type tv_1 from treeview within uo_hc
end type
type pb_1 from picturebutton within uo_hc
end type
type pb_print from picturebutton within uo_hc
end type
type dw_campo from datawindow within uo_hc
end type
type dw_texto from datawindow within uo_hc
end type
type pb_3 from picturebutton within uo_hc
end type
type rte_r from richtextedit within uo_hc
end type
end forward

global type uo_hc from userobject
integer width = 3479
integer height = 1872
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event chdiagnostico ( string p_cdiag )
cb_1 cb_1
st_emp st_emp
st_1 st_1
sle_1 sle_1
dw_p dw_p
tv_1 tv_1
pb_1 pb_1
pb_print pb_print
dw_campo dw_campo
dw_texto dw_texto
pb_3 pb_3
rte_r rte_r
end type
global uo_hc uo_hc

type variables
double contador, ncargo
string lugar,codplantilla, coddoc, tipodoc, documento
Boolean nuevo, i_DisplayOnly = TRUE
DateTime d_Fecha
Private datawindowchild dwc_p
Private string i_cond[30], i_mread[30]
Private boolean i_cambia_rte=false, i_pl[30], cambia, i_pc[30], i_imp[30]
Private string i_edita, ocultar, cesp, vista,i_cemp,i_ccont
keycode nextitem=keyf8!,previtem=keyf7!,nextchild=keyf9!
st_evalua st_p

end variables

forward prototypes
public function integer addchildren (long hand, string agrupa)
public function integer showfields (treeviewitem tvi, string tipo)
public function integer grabar ()
public function string subplantilla (string agrupa)
public function integer poblarlista (string campoguarda, integer numcampo)
public function integer grabarmemo ()
public function boolean modified ()
public function integer save ()
public function integer reset ()
public function string rtfsincampos (richtextedit rte)
public function string getview ()
public function integer getmemo ()
public subroutine mover (keycode key)
public function integer retrieve (double l_numdoc, string l_clugar, string l_codplantilla, double l_ncargo)
end prototypes

public function integer addchildren (long hand, string agrupa);integer fila
long newhand
TreeViewItem ltvi_New
fila = dw_campo.Find("agrupa='" + agrupa +"'",1,dw_campo.RowCount())
do while fila > 0
	if dw_campo.GetItemString(fila,'tipo') = '0' then
		ltvi_New.Children = TRUE
	else
		ltvi_New.Children = FALSE
	end if
	ltvi_New.PictureIndex = integer(dw_campo.GetItemString(fila,'tipo')) + 1
	ltvi_New.SelectedPictureIndex = integer(dw_campo.GetItemString(fila,'tipo')) + 1
	ltvi_New.Label = dw_campo.GetItemString(fila,'descampo')
	ltvi_New.Data = dw_campo.GetItemNumber(fila,'numcampo')
	newhand = tv_1.InsertItemLast(hand, ltvi_New)
	If newhand < 1 Then
		MessageBox("Error", "Error insertando item", Exclamation!)
		Return -1
	End If
	dw_campo.SetItem(fila,'handle',newhand)
	addChildren(newhand,dw_campo.GetItemString(fila,'codplantilla') + String(dw_campo.GetItemNumber(fila,'numcampo')))
	if fila = dw_campo.RowCount() then EXIT
	fila = dw_campo.Find("agrupa='" + agrupa +"'",fila + 1,dw_campo.RowCount())
loop

Return 0

end function

public function integer showfields (treeviewitem tvi, string tipo);long hactual,hpadre

int fpadre, i, x1=10, y1, y2,yant=4, fila, factual , hcl=0
string agrupa, mostrar='', campo, descampo, label, ltipo

ocultar = ''
factual = dw_campo.GetRow()
agrupa = dw_campo.GetItemString(factual,'agrupa')

if tipo='0' or tipo='5' then 
	fpadre = dw_campo.GetRow()
else
	fpadre = dw_campo.Find("codplantilla+string(numcampo)='"+agrupa+"'",1,dw_campo.RowCount())
end if

rte_r.Visible = FALSE
if fpadre > 0 and dw_campo.GetItemString(fpadre,'plantigrupo') = '1' then
	mostrar = subplantilla(dw_campo.GetItemString(fpadre,'codplantilla')+string(dw_campo.GetItemNumber(fpadre,'numcampo')))
else
	if tipo = '5' then
		string texto
		integer idx
		blob memo
		rte_r.Visible = TRUE
		campo = dw_campo.GetItemString(factual,'campoguarda')
		idx = integer(mid(campo,10))
		f_sel_rtf(rte_r)
		i_cambia_rte = TRUE
		rte_r.clearall()
		rte_r.SetPosition(toTop!)
		if pb_print.Visible then
			pb_print.SetPosition(toTop!)
		end if
		pb_3.Visible = TRUE
		pb_3.SetPosition(toTop!)
		texto = i_mread[idx]
		if not (IsNull(texto) or texto = '')then
			texto = f_rtf(texto,TRUE)
			if rte_r.PasteRTF(texto,Detail!) = -1 then
				MessageBox('Error','No puede mostrarse el contenido del campo texto largo')
			end if
		end if
	else // 
		rte_r.Visible = FALSE
		descampo = dw_campo.GetItemString(factual,'descampo')
		campo = dw_campo.GetItemString(factual,'campoguarda')
		mostrar = 'l_1.Visible=True l_1.x=10 l_1.y=4 l_1.Text="'+descampo+'" '+&
					 campo+'.visible=True '+campo+'.x=10 '+campo+'.y=70 '
		ocultar = 'l_1.Visible=False '+campo + '.visible=False '
		if tipo='6' then
			string medida
			label = 't_1'
			medida = dw_campo.GetItemString(factual,'medida')
			if isNull(medida) then medida = ''
			mostrar = mostrar+label+'.Visible=True '+label+'.x=330 '+&
			  label+'.y=70 '+label+'.Text="'+medida+'" '
			ocultar = ocultar + 't_1.Visible=False '
		end if
		if tipo = '3' then
			PoblarLista(campo,dw_campo.GetItemNumber(factual,'numcampo'))
		end if
		dw_texto.modify('datawindow.detail.height=200')
	end if
end if

string ret
ret = dw_texto.Modify(mostrar)
if ret <> "" then
	messageBox(ret,mid(mostrar,1550))
end if
if fpadre > 0 and dw_campo.GetItemString(fpadre,'plantigrupo') = '1' then
	dw_texto.SetColumn(dw_campo.GetItemString(factual,'campoguarda'))
	dw_texto.SetFocus()
end if

Return 0

end function

public function integer grabar ();
string msg

IF dw_texto.Update() = 1 THEN
	COMMIT USING SQLCA;
ELSE
	msg = SQLCA.SQLErrText
	ROLLBACK USING SQLCA;
	MessageBox("Error grabando",msg)
	Return -1
END IF

Return 0

end function

public function string subplantilla (string agrupa);int fila, f, c, j, posx, posy, anchu, altu, antx, anty, nc=0, nl=0
string descampo, campo, ltipo, label, mostrar

for j = 1 to 7
	if j = 5 then CONTINUE
	fila = dw_campo.find("agrupa='"+agrupa +"' and tipo='"+string(j)+"'",1,dw_campo.RowCount())
	f = 1
	c = 0
	ltipo = string(j)
	do while fila > 0
		c++
		nc++
		descampo = dw_campo.GetItemString(fila,'descampo')
		campo = dw_campo.GetItemString(fila,'campoguarda')
		choose case integer(ltipo)
			case 1, 2, 6, 7
				if c = 2 then
					f++
					c= 1
				end if
				anchu = 900
				altu = 160
			case 3
				if c = 2 then
					f++
					c= 1
				end if
				anchu = 1100
				altu = 160
			case 4
				f++
				c = 1
				altu = 160
		end choose
		posx = 10 + anchu*(c - 1)
		if j = 4 then
			posy = 10 + altu*(f - 2) + anty
		else
			posy = 10 + altu*(f - 1) + anty
		end if
		if ltipo='3' then poblarlista(campo,dw_campo.GetItemNumber(fila,'numcampo'))
		if ltipo='6' then
			string medida
			nl++
			label = 't_' + string(nc)
			medida = dw_campo.GetItemString(fila,'medida')
			if isNull(medida) then medida = ''
			mostrar = mostrar+label+'.Visible=True '+label+'.x='+string(posx + 320)+' '+&
			  label+'.y='+string(posy+70)+' '+label+'.Text="'+medida+'" '
			ocultar = ocultar + label+'.Visible=False '
		end if
		label = 'l_' + string(nc)
		mostrar = mostrar + label+'.Visible=True '+label+'.x='+ string(posx)+' '+&
		  label+'.y='+string(posy)+' '+label+'.Text="'+descampo+'" '+campo+'.visible=True '+&
		  campo+'.x='+string(posx)+' '+campo+'.y='+string(posy+70)+' '
		ocultar = ocultar + label+'.Visible=False '+campo + '.visible=False '
		if fila = dw_campo.RowCount() then EXIT
		fila = dw_campo.find("agrupa='"+agrupa +"' and tipo='"+string(j)+"'",fila+1,dw_campo.RowCount())		
	loop
	if posx>0 and posy>0 then
		anty = posy + altu
	end if
	altu = 0
	posx = 0
	posy = 0
next
dw_texto.modify('DataWindow.Detail.Height='+string(anty+30))

Return mostrar

end function

public function integer poblarlista (string campoguarda, integer numcampo);string modifica
integer i
datastore dw_l
dw_l = create datastore
dw_l.DataObject = 'dw_hlista'
dw_l.SetTransObject(SQLCA)
dw_l.Retrieve(codplantilla,numcampo)
modifica = campoguarda+".values='"
for i = 1 to dw_l.RowCount()
	modifica = modifica+dw_l.GetItemString(i,'descripcion')+"~t"+string(dw_l.GetItemNumber(i,'nitem'))+"/"
next
string ret
modifica = modifica+"' "+campoguarda+".ddlb.vscrollbar=yes "
dw_texto.Modify(modifica)

Return 0

end function

public function integer grabarmemo ();int fila, i, nfilas, fdiag
string texto,campo,epicrisis,tscampos,sfecha //texto de los RichText's sin campos
blob memo
boolean existe=FALSE
datetime dt

SQLCA.Autocommit = TRUE

for i = 1 to 30
	fila = dw_campo.Find("tipo='5' and campoguarda='valormemo"+string(i)+"'",1,dw_campo.RowCount())	
	if (i_mread[i]<>'' and not isNull(i_mread[i]))  and fila> 0 then		
		texto = i_mread[i]
		memo = blob(texto)
		choose case i
			case 1
				updateblob nom_evalua_cp set valormemo1=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 2
				updateblob nom_evalua_cp set valormemo2=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 3
				updateblob nom_evalua_cp set valormemo3=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 4
				updateblob nom_evalua_cp set valormemo4=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 5
				updateblob nom_evalua_cp set valormemo5=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 6
				updateblob nom_evalua_cp set valormemo6=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 7
				updateblob nom_evalua_cp set valormemo7=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 8
				updateblob nom_evalua_cp set valormemo8=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 9
				updateblob nom_evalua_cp set valormemo9=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 10
				updateblob nom_evalua_cp set valormemo10=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 11
				updateblob nom_evalua_cp set valormemo11=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 12
				updateblob nom_evalua_cp set valormemo12=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 13
				updateblob nom_evalua_cp set valormemo13=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 14
				updateblob nom_evalua_cp set valormemo14=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 15
				updateblob nom_evalua_cp set valormemo15=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 16
				updateblob nom_evalua_cp set valormemo16=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 17
				updateblob nom_evalua_cp set valormemo17=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 18
				updateblob nom_evalua_cp set valormemo18=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 19
				updateblob nom_evalua_cp set valormemo19=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 20
				updateblob nom_evalua_cp set valormemo20=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 21
				updateblob nom_evalua_cp set valormemo21=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 22
				updateblob nom_evalua_cp set valormemo22=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 23
				updateblob nom_evalua_cp set valormemo23=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 24
				updateblob nom_evalua_cp set valormemo24=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 25
				updateblob nom_evalua_cp set valormemo25=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 26
				updateblob nom_evalua_cp set valormemo26=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 27
				updateblob nom_evalua_cp set valormemo27=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 28
				updateblob nom_evalua_cp set valormemo28=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 29
				updateblob nom_evalua_cp set valormemo29=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 30
				updateblob nom_evalua_cp set valormemo30=:memo where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
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

Return 0

end function

public function boolean modified ();return cambia
end function

public function integer save ();Return pb_1.Event clicked()
end function

public function integer reset ();long hand
hand = tv_1.FindItem(RootTreeItem!,0)
do while hand > 0
	tv_1.DeleteItem(hand)
	hand = tv_1.FindItem(RootTreeItem!,0)
loop
string vnul
setNull(vnul)
dw_p.SetItem(1,'codplantilla',vnul)
dw_texto.Reset()
setNull(contador)
setNull(lugar)
setNull(codplantilla)
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

public function string getview ();Return vista
end function

public function integer getmemo ();SQLCA.Autocommit = TRUE

blob memo
long i
for i = 1 to dw_campo.RowCount()
	if dw_campo.GetItemString(i,'tipo') = '5' then
		choose case dw_campo.GetItemString(i,'campoguarda')
			case 'valormemo1'
				selectblob valormemo1 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo2'
				selectblob valormemo2 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo3'
				selectblob valormemo3 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo4'
				selectblob valormemo4 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo5'
				selectblob valormemo5 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo6'
				selectblob valormemo6 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo7'
				selectblob valormemo7 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo8'
				selectblob valormemo8 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo9'
				selectblob valormemo9 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo10'
				selectblob valormemo10 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo11'
				selectblob valormemo11 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo12'
				selectblob valormemo12 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo13'
				selectblob valormemo13 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo14'
				selectblob valormemo14 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo15'
				selectblob valormemo15 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo16'
				selectblob valormemo16 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo17'
				selectblob valormemo17 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo18'
				selectblob valormemo18 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo19'
				selectblob valormemo19 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo20'
				selectblob valormemo20 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo21'
				selectblob valormemo21 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo22'
				selectblob valormemo22 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo23'
				selectblob valormemo23 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo24'
				selectblob valormemo24 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo25'
				selectblob valormemo25 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo26'
				selectblob valormemo26 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo27'
				selectblob valormemo27 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo28'
				selectblob valormemo28 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo29'
				selectblob valormemo29 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
			case 'valormemo30'
				selectblob valormemo30 into :memo from nom_evalua_cp where numdoc=:contador and clugar=:lugar and codplantilla=:codplantilla;
		end choose
		i_mread[integer(mid(dw_campo.GetItemString(i,'campoguarda'),10))] = string(memo)
	end if
next
SQLCA.Autocommit = FALSE
Return 0

end function

public subroutine mover (keycode key);long tt,act,ojo
if key=nextitem then
	act=tv_1.finditem(currentTreeItem! ,0)
	if act=-1 then act=tv_1.finditem(rootTreeItem! ,0)
	tt=tv_1.finditem(NextTreeItem! ,act)
	if tt=-1 then tt=tv_1.finditem(childTreeItem! ,act)
	if tt=-1 then
		tt=tv_1.finditem(ParentTreeItem! ,act)
		tt=tv_1.finditem(ParentTreeItem! ,tt)
		tt=tv_1.finditem(NextTreeItem! ,tt)
	end if
	ojo=tv_1.selectitem(tt)
elseif key=nextchild then
	act=tv_1.finditem(currentTreeItem! ,0)
	if act=-1 then act=tv_1.finditem(rootTreeItem! ,0)
	treeviewitem l_tviold
	tv_1.GetItem(act, l_tviold)
	if l_tviold.children then
		tt=tv_1.finditem(childTreeItem! ,act)
		if tt=-1 then 
			tt=tv_1.finditem(ParentTreeItem! ,act)
			tt=tv_1.finditem(NextTreeItem! ,tt)
		end if
	else
		tt=tv_1.finditem(NextTreeItem! ,act)
		if tt=-1 then tt=tv_1.finditem(childTreeItem! ,act)
	end if
	ojo=tv_1.selectitem(tt)
elseif key=previtem then
	act=tv_1.finditem(currentTreeItem! ,0)
	if act=-1 then act=tv_1.finditem(rootTreeItem! ,0)
	ojo=tv_1.selectitem(act)
	tt=tv_1.finditem(previousTreeItem! ,act)
	if tt=-1 then tt=tv_1.finditem(ParentTreeItem! ,act)
	ojo=tv_1.selectitem(tt)
end if


end subroutine

public function integer retrieve (double l_numdoc, string l_clugar, string l_codplantilla, double l_ncargo);contador = l_numdoc
lugar = l_clugar
codplantilla = l_codplantilla
ncargo = l_ncargo

if nuevo then
	dw_p.Enabled = TRUE
else
	dw_p.Enabled = FALSE
end if

if not isNull(codplantilla) and codplantilla <> '' then
	select vista into :vista from hisplantilla
	where codplantilla = :codplantilla;
	dw_p.SetItem(1,'codplantilla',codplantilla)
	dw_p.TriggerEvent(itemchanged!)
else
	if dwc_p.RowCount() > 0 then
		dw_p.SetItem(1,'codplantilla',dwc_p.GetItemString(1,'codplantilla'))
		dwc_p.SetRow(1)
		dw_p.TriggerEvent(itemchanged!)
	end if
end if

if isNull(i_edita) or i_edita = '' then i_edita = '0'
Return dwc_p.RowCount()

end function

on uo_hc.create
this.cb_1=create cb_1
this.st_emp=create st_emp
this.st_1=create st_1
this.sle_1=create sle_1
this.dw_p=create dw_p
this.tv_1=create tv_1
this.pb_1=create pb_1
this.pb_print=create pb_print
this.dw_campo=create dw_campo
this.dw_texto=create dw_texto
this.pb_3=create pb_3
this.rte_r=create rte_r
this.Control[]={this.cb_1,&
this.st_emp,&
this.st_1,&
this.sle_1,&
this.dw_p,&
this.tv_1,&
this.pb_1,&
this.pb_print,&
this.dw_campo,&
this.dw_texto,&
this.pb_3,&
this.rte_r}
end on

on uo_hc.destroy
destroy(this.cb_1)
destroy(this.st_emp)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.dw_p)
destroy(this.tv_1)
destroy(this.pb_1)
destroy(this.pb_print)
destroy(this.dw_campo)
destroy(this.dw_texto)
destroy(this.pb_3)
destroy(this.rte_r)
end on

type cb_1 from commandbutton within uo_hc
integer x = 2679
integer y = 88
integer width = 690
integer height = 68
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ver &Formulario"
end type

event clicked;
st_p.tipodoc = tipodoc
st_p.documento = documento
st_p.coddoc = coddoc
st_p.lugar = lugar
st_p.numdoc = contador
st_p.ncargo = ncargo
st_p.codplantilla = codplantilla
st_p.nuevo = FALSE
opensheetWithParm(w_formulario,st_p,w_principal,0,layered!)
close(w_test)

end event

event constructor;window w_temp

w_temp = f_vent_padre(this)

if i_DisplayOnly or w_temp.ClassName() <> 'w_test' then
	this.Visible = False
end if

end event

type st_emp from statictext within uo_hc
integer x = 46
integer y = 28
integer width = 2277
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within uo_hc
integer x = 1120
integer y = 124
integer width = 1280
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 134217856
long backcolor = 67108864
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within uo_hc
boolean visible = false
integer x = 1129
integer y = 1620
integer width = 2231
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
boolean border = false
boolean displayonly = true
end type

type dw_p from datawindow within uo_hc
event keydown pbm_dwnkey
integer x = 9
integer y = 108
integer width = 1093
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "dw_hlsplantilla"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keydown;if key=nextitem or key=previtem or key=nextchild then mover(key)
end event

event itemchanged;this.AcceptText()
int i, inul, fila
string vnul, camino
long hand
hand = tv_1.FindItem(RootTreeItem!,0)
do while hand > 0
	tv_1.DeleteItem(hand)
	hand = tv_1.FindItem(RootTreeItem!,0)
loop
codplantilla = this.GetItemString(1,'codplantilla')
select vista into :vista from hisplantilla
where codplantilla = :codplantilla;

st_1.Text = ''
sle_1.Text = ''
dw_texto.Modify(ocultar)
dw_campo.Retrieve(codplantilla)
dw_texto.Reset()

dw_texto.Retrieve(contador,lugar,coddoc)
if dw_texto.RowCount() = 0 then
	dw_texto.InsertRow(1)
	dw_texto.SetItem(1,'viejo',0)
end if

for i = 1 to 30
	i_pl[i] = FALSE
	i_pc[i] = FALSE
	i_imp[i] = FALSE
	i_mread[i] = ''
next

getMemo()

select reporte into :camino from nom_plantilla where codplantilla = :codplantilla;
if isNull(camino) or camino = '' then
	pb_print.Tag = ''
	pb_print.Visible = FALSE
else
	pb_print.Tag = camino
	pb_print.Visible = TRUE
end if

cambia = FALSE

end event

event constructor;dw_p.GetChild('codplantilla',dwc_p)
dwc_p.SetTransObject(SQLCA)
dwc_p.Retrieve()
dw_p.SetTransObject(SQLCA)
dw_p.InsertRow(1)

end event

type tv_1 from treeview within uo_hc
integer x = 14
integer y = 192
integer width = 1093
integer height = 1488
integer taborder = 30
boolean dragauto = true
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
boolean deleteitems = true
boolean linesatroot = true
boolean disabledragdrop = false
boolean tooltips = false
boolean trackselect = true
string picturename[] = {"My Videos2.ico","CheckBox!","RadioButton!","ListBox!","EditMask!","RichTextEdit!","ComputePage5!","ShowWatch!"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event selectionchanged;Integer fila, idx, fdiag
TreeViewItem ltvi_New
string tipo, campo, ingre, camino
long handle
pb_print.Visible = FALSE
pb_3.Visible = FALSE

if GetItem(oldhandle, ltvi_New) = 1 then
	fila = dw_campo.Find("numcampo=" + string(ltvi_New.Data) ,1,dw_campo.RowCount())
	if fila > 0 then
		tipo = dw_campo.GetItemString(fila,'tipo')
		campo = dw_campo.GetItemString(fila,'campoguarda')
		idx = integer(mid(campo,10))
		ltvi_New.Bold = FALSE
		if tipo = '5' then
			i_mread[idx] = rte_r.copyrtf(false,detail!)
		end if
		SetItem(oldhandle, ltvi_New)
	end if
end if

dw_texto.Modify(ocultar)
if isNull(newhandle) then
	handle = FindItem(currentTreeItem!,0)
else
	handle = newhandle
end if
GetItem(handle, ltvi_New)
fila = dw_campo.Find("numcampo=" + string(ltvi_New.Data) ,1,dw_campo.RowCount())
if fila > 0 then
	ltvi_New.Bold = TRUE
	dw_campo.ScrollToRow(fila)
	tipo = dw_campo.GetItemString(fila,'tipo')
	if tipo = '5' and not i_DisplayOnly then
		campo = dw_campo.GetItemString(fila,'campoguarda')
		camino = dw_campo.GetItemString(fila,'camino')
	end if
	showfields(ltvi_new,tipo)
	st_1.Text = dw_campo.GetItemString(fila,'descampo')
	if not (isNull(dw_campo.GetItemString(fila,'ayuda')) or dw_campo.GetItemString(fila,'ayuda') = '') then
		sle_1.Text = dw_campo.GetItemString(fila,'ayuda')
		sle_1.Visible = True
	else
		sle_1.Visible = False
	end if
	SetItem(handle, ltvi_New)
	if dw_campo.GetItemString(fila,'plantigrupo')='1' then
		dw_texto.ScrolltoRow(1)
		dw_texto.setfocus()
	end if
	
end if

end event

event rightclicked;if handle>0 then selectitem(handle)
if i_edita='1' and not i_displayonly then
	treeviewitem tt
	getitem(handle,tt)
	long fila
	string tipo
	fila = dw_campo.Find("numcampo=" + string(tt.Data) ,1,dw_campo.RowCount())
	if fila > 0 then
		tipo = dw_campo.GetItemString(fila,'tipo')
		if tipo='5' then
			window w_t
			w_t=f_vent_padre(this)
			m_edita = create m_edita
			message.powerobjectparm=parent
			
			if w_t.windowtype=response! then
				m_edita.popmenu(w_t.pointerx(),w_t.pointery())
			else
				m_edita.popmenu(w_principal.pointerx(),w_principal.pointery())
			end if
		end if
	end if
end if
end event

event selectionchanging;dw_texto.AcceptText()

end event

type pb_1 from picturebutton within uo_hc
event mousemove pbm_mousemove
integer x = 3214
integer y = 1700
integer width = 142
integer height = 124
integer taborder = 80
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

event clicked;int i, fila, nfilas, inul
long handle
TreeViewItem tvi
boolean aviso=FALSE
string texto, campo, tipo, vnul, ctipo
if dw_texto.AcceptText() = -1 then Return

handle = tv_1.FindItem(currentTreeItem!,0)
if tv_1.GetItem(handle, tvi) = 1 then
	fila = dw_campo.Find("numcampo=" + string(tvi.Data) ,1,dw_campo.RowCount())
	if fila > 0 then
		campo = dw_campo.GetItemString(fila,'campoguarda')
		ctipo = dw_campo.GetItemString(fila,'tipo')
		if ctipo = '5' then
			i_mread[integer(mid(campo,10))] = rte_r.copyrtf(false,detail!)
		end if
	end if
end if

if nuevo = TRUE and isNull(dw_texto.GetItemNumber(1,'numdoc')) then
	contador = f_trae_ndoc(coddoc,lugar,'Evaluación de desempeño')
	if contador = -1 then
		Rollback;
		Return -1
	end if
	dw_texto.SetItem(1,'numdoc',contador)
	dw_texto.SetItem(1,'coddoc',coddoc)
	dw_texto.SetItem(1,'clugar',lugar)
	dw_texto.SetItem(1,'tipodoc',tipodoc)
	dw_texto.SetItem(1,'documento',documento)
	dw_texto.SetItem(1,'codplantilla',codplantilla)
	dw_texto.SetItem(1,'ncargo',ncargo)
	dw_texto.SetItem(1,'fecha',today())
end if

fila = dw_texto.GetRow()
for i = 1 to 30
	if not IsNull(dw_texto.GetItemString(1,'valortexto'+string(i))) then
		texto = dw_texto.GetItemString(fila,'valortexto'+string(i))
		if isNull(texto) then texto = ''
		if len(texto) > 255 and not aviso then 
			MessageBox('Aviso','Los campos texto son de máximo 255 caracteres, se tomarán los primeros 255')
			aviso=TRUE
		end if
		dw_texto.SetItem(fila,'valortexto'+string(i),left(texto,255))
	end if
next

if grabar() = -1 then
	rollback;
	if ctipo = '5' then rte_r.PasteRTF(i_mread[integer(mid(campo,10))],Detail!)
	rte_r.SetRedraw(TRUE)
	Return -1
end if

if grabarmemo() = -1 then
	rollback;
	if ctipo = '5' then rte_r.PasteRTF(i_mread[integer(mid(campo,10))],Detail!)
	Return -1
end if

if ctipo = '5' then
	tv_1.TriggerEvent(selectionchanged!)
end if
cambia = FALSE

string prof, esp

for i = 1 to 30
	i_pl[i] = FALSE
	i_pc[i] = FALSE
	i_imp[i] = FALSE
next
dw_p.Enabled = FALSE

Return 0

end event

event constructor;if i_DisplayOnly then Visible = False

end event

type pb_print from picturebutton within uo_hc
event mousemove pbm_mousemove
integer x = 2921
integer y = 1700
integer width = 142
integer height = 124
integer taborder = 130
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
if dw_r.Retrieve(contador,lugar,codplantilla)>0 then
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
	if isvalid(w_reporte_gral) then w_reporte_gral.pasar_rtf_dw(3)//para que lo muestre ahora sí
end if
end event

type dw_campo from datawindow within uo_hc
boolean visible = false
integer x = 2039
integer y = 260
integer width = 1010
integer height = 288
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_hcampos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)

end event

event retrieveend;if rowcount = 0 then Return
integer i, fila
long hand
TreeViewItem ltvi_New
for i = 1 to this.RowCount()
	if IsNull(this.GetItemString(i,'agrupa')) then
		ltvi_New.Label = this.GetItemString(i,'descampo')
		ltvi_New.Data = this.GetItemNumber(i,'numcampo')
		ltvi_New.Children = TRUE
		ltvi_New.PictureIndex = long(this.GetItemString(i,'tipo')) + 1
		ltvi_New.SelectedPictureIndex = long(this.GetItemString(i,'tipo')) + 1
		hand = tv_1.InsertItemLast(0, ltvi_New)
		If hand < 1 Then
			MessageBox("Error", "Error insertando item", Exclamation!)
			Return -1
		End If
		this.SetItem(i,'handle',hand)
		// Children
		addChildren(hand,this.GetItemString(i,'codplantilla') + String(this.GetItemNumber(i,'numcampo')))
	end if
next

//this.ResetUpdate()
hand = tv_1.FindItem(RootTreeItem!, 0)
tv_1.ExpandAll(hand)

end event

type dw_texto from datawindow within uo_hc
event key pbm_dwnkey
integer x = 1129
integer y = 204
integer width = 2304
integer height = 1396
integer taborder = 40
string title = "none"
string dataobject = "dw_histoevol"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event key;if key=nextitem or key=previtem or key=nextchild then 
	mover(key)

end if

end event

event constructor;this.SetTransObject(SQLCA)

end event

event dberror;Rollback;
Return 0

end event

type pb_3 from picturebutton within uo_hc
event mousemove pbm_mousemove
boolean visible = false
integer x = 3067
integer y = 1700
integer width = 142
integer height = 124
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Plantillas"
end type

event clicked;st_rte st
//st.c_prof = codprof
st.ventana = 'HC'
st.rte = rte_r
//st.dw_pac = w_principal.dw_1
openwithparm(w_plant_rtf,st)

end event

type rte_r from richtextedit within uo_hc
event p_undo ( boolean p_cambiar )
boolean visible = false
integer x = 1120
integer y = 192
integer width = 2309
integer height = 1404
integer taborder = 50
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
long init_leftmargin = 1
long init_rightmargin = 8000
borderstyle borderstyle = stylelowered!
end type

event p_undo(boolean p_cambiar);if not p_cambiar then
	undo()
end if
modified=false
i_cambia_rte=false

end event

event modified;//post event p_undo(i_cambia_rte)

end event

event key;if key=nextitem or key=previtem or key=nextchild then 
	mover(key)
	return
end if
return f_rte_key(this,keyflags,key)

end event

