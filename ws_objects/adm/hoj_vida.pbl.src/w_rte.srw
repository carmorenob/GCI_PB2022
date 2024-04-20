$PBExportHeader$w_rte.srw
$PBExportComments$RichPad RTE control
forward
global type w_rte from w_center
end type
type rte_1 from richtextedit within w_rte
end type
type pb_1 from picturebutton within w_rte
end type
end forward

global type w_rte from w_center
integer y = 4
integer width = 3502
integer height = 2048
string title = ""
string menuname = "m_rte"
windowstate windowstate = maximized!
long backcolor = 74481808
rte_1 rte_1
pb_1 pb_1
end type
global w_rte w_rte

type variables
String	is_FindNext, is_FileName = "SinTitulo"
Boolean	ib_HeadFoot, ib_DataSource
st_contrato st_p
DataStore dw_cb, dw_fp, dw_pre, dw_oc, dw_ob

end variables

forward prototypes
public function integer of_saveas ()
public function integer of_selectall ()
public function integer of_setfind (string as_find)
public function integer of_delete ()
public function integer of_find ()
public function integer of_findnext ()
public function boolean of_canundo ()
public function integer of_copy ()
public function integer of_cut ()
public function boolean of_isprintpreview ()
public function integer of_new ()
public function integer of_paste ()
public function integer of_replace ()
public function integer of_save ()
public function integer of_send ()
public function boolean of_showhf (boolean ab_query)
public function integer of_timedate ()
public function integer of_undo ()
public function integer of_printpreview ()
public function integer of_print ()
public function integer of_open ()
public function integer of_insert_field ()
public function integer insertcompute ()
public function integer trae_campos (datastore dw_obj, string prefijo)
public function integer of_savefile ()
public function integer of_actualiza_campos (string texto)
public function integer inserta_campo (datastore dw_obj, string tipo, long fila, string campo, string nombre)
end prototypes

public function integer of_saveas ();String	ls_File, ls_Path

ls_Path = is_FileName

If GetFileSaveName("Seleccione el Archivo", ls_Path, ls_File, "rtf", "Texto Enriquecidot (*.rtf), *.rtf") = 1 Then
	is_FileName = ls_Path
	This.Title = ls_File + " - Editor de Texto -GCI-"
	
	Return This.of_savefile()
Else
	Return 0
End If

end function

public function integer of_selectall ();Return rte_1.selecttextall()

end function

public function integer of_setfind (string as_find);is_FindNext = as_Find

Return 1

end function

public function integer of_delete ();Return rte_1.clearall()

end function

public function integer of_find ();OpenWithParm(w_rte_find, rte_1)

Return 1

end function

public function integer of_findnext ();If is_FindNext = "" Then
	of_find()
Else
	rte_1.findnext()
End If

Return 0

end function

public function boolean of_canundo ();Return rte_1.canundo()

end function

public function integer of_copy ();Return rte_1.copy()

end function

public function integer of_cut ();Return rte_1.cut()

end function

public function boolean of_isprintpreview ();Return rte_1.ispreview() 

end function

public function integer of_new ();String	ls_File, ls_Path
Integer	li_RC

If rte_1.modified Then
	li_RC = MessageBox("Editor de Texto -GCI-", "El texto en " + is_FileName + &
								" ha cambiado.~r~n¿Desea usted salvar los cambios?", &
								Question!, YesNoCancel!)

	Choose Case li_RC
		Case 1
			This.of_save()
		Case 3
			Return 0
	End Choose
End If

// Display empty rte
rte_1.SetRedraw(False)

of_selectall()
of_delete()
is_FileName = "SinTitulo"
This.Title = "SinTitulo - Editor de Texto -GCI-"
rte_1.modified = False

rte_1.SetRedraw(True)

Return 1

end function

public function integer of_paste ();Return rte_1.paste()

end function

public function integer of_replace ();OpenWithParm(w_rte_replace, rte_1)

Return 1

end function

public function integer of_save ();string texto
blob memo, encab, pie
long m_sup, m_inf, m_izq, m_der
setNull(encab)
setNull(memo)
setNull(pie)
m_sup = rte_1.TopMargin
m_inf = rte_1.BottomMargin
m_izq = rte_1.LeftMargin
m_der = rte_1.RightMargin

if not st_p.DisplayOnly then 
	texto = rte_1.CopyRTF(FALSE,Header!)
	if not trim(texto) = '' then encab = blob(texto)
	texto = rte_1.CopyRTF(FALSE,Footer!)
	if not trim(texto) = '' then pie = blob(texto)
	texto = rte_1.CopyRTF(FALSE,Detail!)
	if not trim(texto) = '' then memo = blob(texto)
	if st_p.fpago > 0 then
		if not isNull(memo) then
			updateblob contra_f_pago set acta=:memo
			where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi and item=:st_p.fpago;
			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			IF SQLCA.SQLnrows = 0 THEN
				MessageBox("SQL error", 'No se actualizó el documento')
				Return -1
			END IF
		end if
		if not isNull(encab) then
			updateblob contra_f_pago set encabezado=:encab
			where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi and item=:st_p.fpago;
			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			IF SQLCA.SQLnrows = 0 THEN
				MessageBox("SQL error", 'No se actualizó el documento')
				Return -1
			END IF
		end if
		if not isNull(pie) then
			updateblob contra_f_pago set pie =:pie
			where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi and item=:st_p.fpago;
			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			IF SQLCA.SQLnrows = 0 THEN
				MessageBox("SQL error", 'No se actualizó el documento')
				Return -1
			END IF
		end if
		update contra_f_pago set m_sup=:m_sup, m_inf=:m_inf, m_izq=:m_izq, m_der=:m_der
		where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi and item=:st_p.fpago;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		IF SQLCA.SQLnrows = 0 THEN
			MessageBox("SQL error", 'No se actualizó el documento')
			Return -1
		END IF
		
	else // Minuta
		
		if not isNull(memo) then
			updateblob contra set minuta=:memo
			where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi;
			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			IF SQLCA.SQLnrows = 0 THEN
				MessageBox("SQL error", 'No se actualizó el documento')
				Return -1
			END IF
		end if
		if not isNull(encab) then
			updateblob contra set encabezado=:encab
			where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi;
			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			IF SQLCA.SQLnrows = 0 THEN
				MessageBox("SQL error", 'No se actualizó el documento')
				Return -1
			END IF
		end if
		if not isNull(pie) then
			updateblob contra set pie =:pie
			where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi;
			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			IF SQLCA.SQLnrows = 0 THEN
				MessageBox("SQL error", 'No se actualizó el documento')
				Return -1
			END IF
		end if
		update contra set m_sup=:m_sup, m_inf=:m_inf, m_izq=:m_izq, m_der=:m_der
		where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi;
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		IF SQLCA.SQLnrows = 0 THEN
			MessageBox("SQL error", 'No se actualizó el documento')
			Return -1
		END IF
	end if
	commit;
	rte_1.modified = False
	Return 0
else
	if st_p.fpago > 0 then
		MessageBox('Atención','La forma de pago ya ha sido autorizada. No podrá guardar los cambios')
	else
		MessageBox('Atención','El contrato ya ha sido cerrado. No podrá guardar los cambios')
	end if
	Return -1
end if

end function

public function integer of_send ();mailSession mSes
mailMessage mMsg
mailReturnCode mRet
mailFileDescription mAttach

// Create a mail session.
This.Enabled = False

mSes = CREATE mailSession

// Log on to the session
mRet = mSes.mailLogon(mailNewSession!)
If mRet <> mailReturnSuccess! Then
	This.Enabled = True
	MessageBox("Editor de Texto -GCI-", "Fallo ingreso al correo electronico.")
	Return 0
End If

mAttach.filename = is_FileName

mMsg.AttachmentFile[1] = mAttach
mRet = mSes.mailAddress(mMsg)
If mRet <> mailReturnSuccess! Then
	MessageBox("Editor de Texto -GCI-", "Fallo dirección del correo.")
Else
	// Send the mail
	mRet = mSes.mailSend(mMsg)
End If

mSes.mailLogoff()

DESTROY mSes

This.Enabled = True

Return 1

end function

public function boolean of_showhf (boolean ab_query);If ab_Query Then Return ib_HeadFoot

If ib_HeadFoot Then
	ib_HeadFoot = False
Else
	ib_HeadFoot = True
End If

rte_1.showheadfoot(ib_HeadFoot)

Return ib_HeadFoot

end function

public function integer of_timedate ();DateTime	ldt_Now

ldt_Now = DateTime(Today(), Now())

rte_1.replacetext(String(ldt_Now, "dd/mm/yyyy"))

Return 1

end function

public function integer of_undo ();Return rte_1.Undo()

end function

public function integer of_printpreview ();Boolean		lb_Preview

if rte_1.ispreview() Then 
	lb_Preview = False
Else
	lb_Preview = True
End If

Return rte_1.preview(lb_Preview)

end function

public function integer of_print ();Return rte_1.print(1, "", True, True)

end function

public function integer of_open ();String	ls_File, ls_Path
Integer	li_RC

If rte_1.modified Then
	li_RC = MessageBox("Editor de Texto -GCI-", "El texto en " + is_FileName + &
								" ha cambiado.~r~n¿Desea usted salvar los cambios?", &
								Question!, YesNoCancel!)

	Choose Case li_RC
		Case 1
			This.of_save()
		Case 3
			Return 0
	End Choose
End If

If GetFileOpenName("Seleccione el Archivo", ls_Path, ls_File, "rtf", "Texto Enriquecido (*.rtF), *.rtf") = 1 Then
	is_FileName = ls_Path
	f_pega_a_rtf(rte_1,'',3)
	rte_1.insertdocument(is_FileName, True, FileTypeRichText!)
	This.Title = ls_File + " - Editor de Texto -GCI-"
	of_actualiza_campos('')

//	long j,num_cols,num_text,num_object,col
//		string nombre,tipo,campos,s1
//		campos=dw_cb.Describe("DataWindow.objects")
//		num_object=f_count_text(campos,'	')+1
//		for col=1 to num_object
//			s1=f_trae_string_num (campos,col,'	')
//			choose case dw_cb.Describe(s1+".type")
//				case "compute"
//					
//					nombre = dw_cb.describe(s1+".name")
//					tipo = dw_cb.describe(s1+".expression")
//					tipo ='Evaluate ("'+ tipo+'", 1 )'
//					tipo = dw_cb.describe(tipo)
//					rte_1.InputFieldchangedata(nombre,upper(tipo))
//					
//				case "column"
//					nombre = dw_cb.describe(s1+".name")
//					tipo = dw_cb.describe(s1+".coltype")
//					CHOOSE CASE mid(tipo,1,5)
//					CASE 'char('
//							if isnull(dw_cb.getitemstring(dw_cb.getrow(),nombre)) then
//								rte_1.InputFieldchangedata(nombre,"sin dato de "+nombre)
//							else
//								rte_1.InputFieldchangedata(nombre,dw_cb.getitemstring(dw_cb.getrow(),nombre))
//							end if
//						case 'datet'
//							if isnull(dw_cb.getitemdatetime(dw_cb.getrow(),nombre)) then
//								rte_1.InputFieldchangedata(nombre,"sin dato de "+nombre)
//							else
//								rte_1.InputFieldchangedata(nombre,string(dw_cb.getitemdatetime(dw_cb.getrow(),nombre)))
//							end if
//						case 'numbe'
//							if isnull(dw_cb.getitemnumber(dw_cb.getrow(),nombre)) then
//								rte_1.InputFieldchangedata(nombre,"sin dato de "+nombre)
//							else
//								rte_1.InputFieldchangedata(nombre,string(dw_cb.getitemnumber(dw_cb.getrow(),nombre)))
//							end if
//						case 'long'
//							if isnull(dw_cb.getitemnumber(dw_cb.getrow(),nombre)) then
//								rte_1.InputFieldchangedata(nombre,"sin dato de "+nombre)
//							else
//								rte_1.InputFieldchangedata(nombre,string(dw_cb.getitemnumber(dw_cb.getrow(),nombre)))
//							end if
//					END CHOOSE
//			END CHOOSE			
//		next
//
	rte_1.modified = False
	Return 0
Else
	Return -1
End If


end function

public function integer of_insert_field ();
openwithparm(w_campos,st_p)

Return 0

end function

public function integer insertcompute ();
openwithparm(w_campos_funcion,st_p)

Return 0

end function

public function integer trae_campos (datastore dw_obj, string prefijo);//string campos,tipo,s1,nombre, campo
//long num_object,col,filas
//
//campos = dw_obj.Describe("DataWindow.objects")
//num_object = f_count_text(campos,'	')+1
//for col = 1 to num_object
//for filas = 1 to dw_obj.RowCount()
//	s1 = f_trae_string_num (campos,col,'	')
//	choose case dw_obj.Describe(s1+".type")			
//		case "column","compute"
//			campo = dw_obj.describe(s1+".name")
//			nombre = prefijo + dw_obj.describe(s1+".name") + string(filas)
//			tipo = dw_obj.describe(s1+".coltype")
//			CHOOSE CASE mid(tipo,1,5)
//			CASE 'char(', 'char'
//					if isnull(dw_obj.getitemstring(filas,campo)) then
//						rte_1.InputFieldChangeData(nombre,'('+campo+')')
//					else
//						rte_1.InputFieldChangeData(nombre,dw_obj.getitemstring(filas,campo))
//					end if
//				case 'datet'
//					if isnull(dw_obj.getitemdatetime(filas,campo)) then
//						rte_1.InputFieldChangeData(nombre,'('+campo+')')
//					else
//						rte_1.InputFieldChangeData(nombre,string(dw_obj.getitemdatetime(filas,campo)))
//					end if
//				case 'numbe'
//					if isnull(dw_obj.getitemnumber(filas,campo)) then
//						rte_1.InputFieldChangeData(nombre,'('+campo+')')
//					else
//						rte_1.InputFieldChangeData(nombre,string(dw_obj.getitemnumber(filas,campo)))
//					end if
//				case 'long'
//					if isnull(dw_obj.getitemnumber(filas,campo)) then
//						rte_1.InputFieldChangeData(nombre,'('+campo+')')
//					else
//						rte_1.InputFieldChangeData(nombre,string(dw_obj.getitemnumber(filas,campo)))
//					end if
//			END CHOOSE
//	END CHOOSE
//next
//next
Return 0
//
end function

public function integer of_savefile ();If is_FileName = "SinTitulo" Then
	Return of_saveas()
Else
	rte_1.modified = False
	Return rte_1.savedocument(is_FileName, FileTypeRichText!)
End If

end function

public function integer of_actualiza_campos (string texto);string campo, col, tipo, tmp
long donde, lineaactual = 1, nuevalinea, posactual = 0, posnew, fila, fila_pre

campo = rte_1.inputfieldlocate(first!)
if campo <> '' then
	nuevalinea = rte_1.selectedLine()
	posnew = rte_1.selectedStart()
	do while nuevalinea > lineaactual or (nuevalinea = lineaactual and posnew > posactual)
		col = mid(campo,3,len(campo) - pos(Right(campo,3),'_') - 2)
		choose case left(campo,2)
			case 'c_'
				tipo = dw_cb.Describe(col+'.colType')
				fila = long(right(campo,3 - pos(Right(campo,3),'_')))
				inserta_campo(dw_cb,tipo,fila,col,campo)
			case 'f_'
				tipo = dw_fp.Describe(col+'.colType')
				fila = long(right(campo,3 - pos(Right(campo,3),'_')))
				inserta_campo(dw_fp,tipo,fila,col,campo)
			case 'p_'
				tipo = dw_pre.Describe(col+'.colType')
				fila = long(right(campo,3 - pos(Right(campo,3),'_')))
				inserta_campo(dw_pre,tipo,fila,col,campo)
			case 'o_'
				tipo = dw_oc.Describe(col+'.colType')
				fila = long(right(campo,3 - pos(Right(campo,3),'_')))
				inserta_campo(dw_oc,tipo,fila,col,campo)
			case 'b_'
				tipo = dw_ob.Describe(col+'.colType')
				fila = long(right(campo,3 - pos(Right(campo,3),'_')))
				inserta_campo(dw_ob,tipo,fila,col,campo)
		end choose	
		campo = rte_1.inputfieldlocate(next!)
		lineaactual = nuevalinea
		nuevalinea = rte_1.selectedline()
		posactual = posnew
		posnew = rte_1.selectedstart()	
	loop
end if

Return 0

end function

public function integer inserta_campo (datastore dw_obj, string tipo, long fila, string campo, string nombre);if fila > dw_obj.RowCount() then
	rte_1.InputFieldChangeData(nombre,'('+campo+')')
else
	CHOOSE CASE left(tipo,5)
		CASE 'char(', 'char'
			if isnull(dw_obj.getitemstring(fila,campo)) then
				rte_1.InputFieldChangeData(nombre,'('+campo+')')
			else
				rte_1.InputFieldChangeData(nombre,dw_obj.getitemstring(fila,campo))
			end if
		case 'datet'
			if isnull(dw_obj.getitemdatetime(fila,campo)) then
				rte_1.InputFieldChangeData(nombre,'('+campo+')')
			else
				rte_1.InputFieldChangeData(nombre,string(dw_obj.getitemdatetime(fila,campo),'dd/mm/yyyy'))
			end if
		case 'numbe', 'decim', 'long', 'real'
			if isnull(dw_obj.getitemnumber(fila,campo)) then
				rte_1.InputFieldChangeData(nombre,'('+campo+')')
			else
				rte_1.InputFieldChangeData(nombre,string(dw_obj.getitemnumber(fila,campo),'#,##0.00'))
			end if
	END CHOOSE
end if
Return 0

end function

on w_rte.create
int iCurrent
call super::create
if this.MenuName = "m_rte" then this.MenuID = create m_rte
this.rte_1=create rte_1
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
this.Control[iCurrent+2]=this.pb_1
end on

on w_rte.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rte_1)
destroy(this.pb_1)
end on

event resize;rte_1.Resize(newwidth - (rte_1.X * 2), newheight - (rte_1.Y * 2) - 200)

pb_1.y = rte_1.x + rte_1.Height + 10
pb_grabar.y = rte_1.x + rte_1.Height + 10

end event

event open;long j,num_cols,num_text,num_object,col
double m_sup, m_inf, m_izq, m_der 
string nombre,tipo,campos,s1, texto
blob memo, encab, pie

dw_cb = Create Datastore
dw_cb.DataObject = 'dw_rtf_concab'
dw_cb.SetTransObject(SQLCA)

dw_fp = Create Datastore
dw_fp.DataObject = 'dw_rtf_formapago'
dw_fp.SetTransObject(SQLCA)

dw_pre = Create Datastore
dw_pre.DataObject = 'dw_contra_ppto_campos'
dw_pre.SetTransObject(SQLCA)

dw_oc = Create Datastore
dw_oc.DataObject = 'dw_rtf_contra_oc'
dw_oc.SetTransObject(SQLCA)

dw_ob = Create Datastore
dw_ob.DataObject = 'dw_rtf_contra_obra'
dw_ob.SetTransObject(SQLCA)

st_p = message.PowerObjectParm

if st_p.fpago > 0 then
	This.Title = "Acta - Editor de Texto -GCI-"
	selectblob acta into :memo from contra_f_pago
	where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi and item=:st_p.fpago;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
else
	This.Title = "Minuta - Editor de Texto -GCI-"
	selectblob minuta into :memo from contra
	where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi;
	selectblob encabezado into :encab from contra
	where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi;
	selectblob pie into :pie from contra
	where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
	select m_sup, m_inf, m_izq, m_der into :m_sup, :m_inf, :m_izq, :m_der from contra
	where ano=:st_p.ano and ncontrato=:st_p.ncontrato and otrosi=:st_p.otrosi;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
end if
texto = string(memo)
clipboard(texto)
rte_1.Paste()
f_pega_a_rtf(rte_1,texto,3)
rte_1.PasteRTF(string(encab), Header!)
rte_1.PasteRTF(string(pie), Footer!)

if m_sup > 0 then 
	rte_1.TopMargin = m_sup
else
	rte_1.TopMargin = 2000
end if
if m_inf > 0 then 
	rte_1.BottomMargin = m_inf
else
	rte_1.BottomMargin = 2000
end if
if m_izq > 0 then 
	rte_1.LeftMargin = m_izq
else
	rte_1.LeftMargin = 2000
end if
if m_der > 0 then 
	rte_1.RightMargin = m_der
else
	rte_1.RightMargin = 2000
end if

dw_cb.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)
dw_fp.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)
dw_pre.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)
dw_oc.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)
dw_ob.Retrieve(st_p.ano,st_p.ncontrato,st_p.otrosi)

of_actualiza_campos('')

rte_1.modified = False

end event

event closequery;Integer	li_RC
if dw_cb.RowCount() > 0 then
	if dw_cb.GetItemString(1,'estado_contra') <> '0' then 
		Return 0
	end if
end if
If rte_1.modified Then
	li_RC = MessageBox("Editor de Texto -GCI-", "El texto en ha cambiado.~r~n¿Desea salvar los cambios?", Question!, YesNoCancel!)
	Choose Case li_RC
		Case 1
			This.of_save()
			Return 0
		Case 2
			Return 0
		Case 3
			Return 1
	End Choose
End If

end event

type pb_grabar from w_center`pb_grabar within w_rte
integer x = 1810
integer y = 1696
end type

event pb_grabar::clicked;call super::clicked;of_save()
end event

type rte_1 from richtextedit within w_rte
integer x = 18
integer y = 4
integer width = 3342
integer height = 1672
integer taborder = 20
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
boolean init_inputfieldsvisible = true
boolean init_tabbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
long init_leftmargin = 2
long init_topmargin = 2
long init_rightmargin = 2
long init_bottommargin = 2
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_rte
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1664
integer y = 1696
integer width = 146
integer height = 128
integer taborder = 100
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

