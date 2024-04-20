$PBExportHeader$w_pre_escoge_ingr.srw
forward
global type w_pre_escoge_ingr from window
end type
type pb_1 from picturebutton within w_pre_escoge_ingr
end type
type st_1 from statictext within w_pre_escoge_ingr
end type
type dw_2 from datawindow within w_pre_escoge_ingr
end type
type pb_ok from picturebutton within w_pre_escoge_ingr
end type
type dw_1 from datawindow within w_pre_escoge_ingr
end type
end forward

global type w_pre_escoge_ingr from window
integer width = 3237
integer height = 1468
boolean titlebar = true
string title = "Escoger Ingresos a Caja"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_1 pb_1
st_1 st_1
dw_2 dw_2
pb_ok pb_ok
dw_1 dw_1
end type
global w_pre_escoge_ingr w_pre_escoge_ingr

type variables
st_interfaz i_st
long i_ingreso
int i_dec_gral,i_aprox_gral


end variables

on w_pre_escoge_ingr.create
this.pb_1=create pb_1
this.st_1=create st_1
this.dw_2=create dw_2
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.st_1,&
this.dw_2,&
this.pb_ok,&
this.dw_1}
end on

on w_pre_escoge_ingr.destroy
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.pb_ok)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
dw_1.retrieve()

string ojo
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

type pb_1 from picturebutton within w_pre_escoge_ingr
integer x = 1906
integer y = 1188
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)

end event

type st_1 from statictext within w_pre_escoge_ingr
integer x = 9
integer y = 820
integer width = 425
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notas del Ingreso:"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_pre_escoge_ingr
integer x = 5
integer y = 876
integer width = 1705
integer height = 432
integer taborder = 20
string title = "none"
string dataobject = "dw_it_ingre_notas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrievestart;return 2
end event

event constructor;settransobject(sqlca)
end event

type pb_ok from picturebutton within w_pre_escoge_ingr
integer x = 1751
integer y = 1188
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
if dw_1.getitemnumber(1,'total')=0 then return
long j,k
do while i_st.dw_it.RowCount() > 0
	i_st.dw_it.DeleteRow(1)
loop
do while i_st.dw_obj.RowCount() > 0
	i_st.dw_obj.DeleteRow(1)
loop
for j=1 to dw_1.rowcount()
	if dw_1.getitemnumber(j,'selec')=0 then continue
	dw_1.setrow(j)
	if isnull(dw_1.getitemstring(j,'cod_total_recon')) or dw_1.getitemstring(j,'cod_total_recon')='' then
		messagebox('Atención','El ingreso no tiene las cuentas Presupuestales')
		return
	end if
	if dw_2.rowcount()=0 then continue
	if dw_2.getitemnumber(1,'compute_1')<>0 then
		messagebox('Atención','El ingreso no ha utilizado el total de la nota')
		return
	end if
next
for j=1 to dw_1.rowcount()
	if dw_1.getitemnumber(j,'selec')=0 then continue
	k=i_st.dw_obj.find("codtotal='"+dw_1.getitemstring(j,'cod_total_recon')+"' and cod_vigencia="+string(dw_1.getitemnumber(j,'cod_vigencia_recon')),1,i_st.dw_obj.rowcount())
	if k=0 then k=i_st.dw_obj.insertrow(0)
	i_st.dw_obj.setitem(k,'coddoc',i_st.coddoc)
	i_st.dw_obj.setitem(k,'clugar',clugar)
	i_st.dw_obj.setitem(k,'item',k)
	i_st.dw_obj.setitem(k,'cod_vigencia',i_st.cod_vigencia)
	i_st.dw_obj.setitem(k,'codtotal',dw_1.getitemstring(j,'cod_total_recon'))
	dec valor

	valor=round(i_st.dw_obj.getitemnumber(k,'monto')+dw_1.getitemnumber(j,'valor'),i_dec_gral)
	if i_dec_gral=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	i_st.dw_obj.setitem(k,'monto',VALOR)
	valor=round(i_st.dw_obj.getitemnumber(k,'monto_vigente')+dw_1.getitemnumber(j,'valor'),i_dec_gral)
	if i_dec_gral=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	i_st.dw_obj.setitem(k,'monto_vigente',valor)
	i_st.dw_obj.setitem(k,'estado','1')
	
	k=i_st.dw_it.find('num_orig1='+string(dw_1.getitemnumber(j,'ningreso'))+" and char_orig1='"+dw_1.getitemstring(j,'codcaja')+"' and char_orig2='"+dw_1.getitemstring(j,'clugar')+"'",1,i_st.dw_it.rowcount())
	if k=0 then k=i_st.dw_it.insertrow(0)

	i_st.dw_it.setitem(k,'codigo','PRCPDPI')
	i_st.dw_it.setitem(k,'char_orig1',dw_1.getitemstring(j,'codcaja'))
	i_st.dw_it.setitem(k,'char_orig2',dw_1.getitemstring(j,'clugar'))
	i_st.dw_it.setitem(k,'char_orig3',dw_1.getitemstring(j,'coddoc'))
	i_st.dw_it.setitem(k,'num_orig1',dw_1.getitemnumber(j,'ningreso'))
	i_st.dw_it.setitem(k,'char_doc1',i_st.coddoc)
	i_st.dw_it.setitem(k,'char_doc2',clugar)
	i_st.dw_it.setitem(k,'num_doc2',k)
	valor=round(i_st.dw_it.getitemnumber(k,'valor')+dw_1.getitemnumber(j,'valor'),i_dec_gral)
	if i_dec_gral=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	i_st.dw_it.setitem(k,'valor',valor)
next
i_st.dw_obj.setrow(i_st.dw_obj.rowcount())
close(parent)
end event

type dw_1 from datawindow within w_pre_escoge_ingr
event p_itemchanged ( long p_row,  string p_colname )
integer x = 5
integer y = 4
integer width = 3200
integer height = 788
integer taborder = 10
string title = "none"
string dataobject = "dw_it_ingre_arqueo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(long p_row, string p_colname);//
end event

event constructor;settransobject(sqlca)

end event

event itemchanged;long nd,sel,i
dec valor, vingre, vnota, vbak,actual
choose case dwo.name
	case 'selec'
		sel=long(data)
		nd = GetItemNumber(GetRow(),'NINGRESO')
		for i = 1 to rowCount()
			if GetItemNumber(i,'NINGRESO') = nd then
				SetItem(i,'selec',sel)
			end if
		next
	case 'valor'
		vnota = double(dw_2.Describe("Evaluate('sum(valor)',0)"))
		valor=dec(gettext())
		actual=getitemnumber(getrow(),'valor')
		if vnota<0 then
			if valor<getitemnumber(getrow(),'backvalor')+vnota or valor>getitemnumber(getrow(),'backvalor') then
				settext(string(actual))
				setitem(getrow(),'valor',actual)
				return 1
			end if
		else
			if valor>getitemnumber(getrow(),'backvalor')+vnota or valor<getitemnumber(getrow(),'backvalor') then
				settext(string(actual))
				setitem(getrow(),'valor',actual)
				return 1
			end if
		end if
		setitem(getrow(),'diff',valor - getitemnumber(getrow(),'backvalor'))
		accepttext()
		vingre = dec(Describe("Evaluate(' sum(if(ningreso=" + string(i_ingreso) + ",valor,0)) ', 0)"))
		vbak  = double(Describe("Evaluate(' sum(if(ningreso=" + string(i_ingreso) + ",backvalor,0)) ', 0)"))
		dw_2.setitem(1,'utilizado',vingre - vbak)

	case 'diff'
		vnota = double(dw_2.Describe("Evaluate('sum(valor)',0)"))
		valor=dec(gettext())
		actual=getitemnumber(getrow(),'diff')
		if vnota<0 then
			if valor>0 or valor<vnota then
				settext(string(actual))
				setitem(getrow(),'diff',actual)
				return 1
			end if
		else
			if valor<0 or valor>vnota then
				settext(string(actual))
				setitem(getrow(),'diff',actual)
				return 1
			end if
		end if
		SetItem(GetRow(),'valor',GetItemNumber(Getrow(),'backvalor') + valor)
		accepttext()
		vbak  = double(Describe("Evaluate(' sum(if(ningreso=" + string(i_ingreso) + ",backvalor,0)) ', 0)"))
		vingre = double(Describe("Evaluate(' sum(if(ningreso=" + string(i_ingreso) + ",valor,0)) ', 0)"))
		dw_2.SetItem(1,'utilizado',vingre - vbak)

end choose
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)


end event

event buttonclicked;int i
if describe("b_1.text") = 'Selec.' then
	dw_1.SetRedraw(FALSE)
	dw_2.SetRedraw(FALSE)
	for i = 1 to rowCount()
		ScrolltoRow(i)
		SetItem(i,'selec',1)
	next
	Modify("b_1.Text='Desel.'")
	dw_1.SetRedraw(TRUE)
	dw_2.SetRedraw(TRUE)
else
	dw_1.SetRedraw(FALSE)
	for i = 1 to rowCount()
		SetItem(i,'selec',0)
	next
	Modify("b_1.Text='Selec.'")
	dw_1.SetRedraw(TRUE)
end if

end event

event rowfocuschanged;if getrow() < 1 then return

i_ingreso=getitemnumber(getrow(),'ningreso')
dw_2.SetFilter("codcaja='"+GetItemString(GetRow(),'codcaja')+"' and clugar_caja='"+GetItemString(GetRow(),'clugar')+"' and coddoc_caja='"+GetItemString(GetRow(),'coddoc')+"' and ningreso_caja="+String(GetItemNumber(GetRow(),'ningreso')))
dw_2.Filter()
if GetItemNumber(GetRow(),'retrieved') = 0 and getitemstring(GetRow(),'arqueo') <> '0' then
	if find("codcaja='"+GetItemString(GetRow(),'codcaja')+"' and clugar='"+GetItemString(GetRow(),'clugar')+"' and coddoc='"+GetItemString(Getrow(),'coddoc')+"' and ningreso="+string(GetItemNumber(Getrow(),'ningreso'))+" and retrieved=1 and arqueo<>'0'",1,rowcount())=0 then
		dw_2.retrieve(GetItemString(GetRow(),'codcaja'),GetItemString(GetRow(),'clugar'),GetItemString(Getrow(),'coddoc'),GetItemNumber(Getrow(),'ningreso'))
		if dw_2.rowcount()>0 then
			setitem(GetRow(),'valor',getitemnumber(GetRow(),'backvalor') + dw_2.getitemnumber(1,'valor'))
			setitem(GetRow(),'diff',dw_2.getitemnumber(1,'valor'))
		end if
	end if
	SetItem(GetRow(),'retrieved',1)
end if


end event

event retrieveend;//long j
//for j=1 to rowcount()
//	setrow(j)
//	event rowfocuschanged(j)
//	if dw_2.rowcount()>0 or getitemstring(j,'arqueo')='0' then continue
//	dw_2.retrieve(GetItemString(j,'codcaja'),GetItemString(j,'clugar'),GetItemString(j,'coddoc'),GetItemNumber(j,'ningreso'))
//	if dw_2.rowcount()>0 then
//		setitem(j,'valor',getitemnumber(j,'backvalor')+dw_2.getitemnumber(1,'valor'))
//		setitem(j,'diff',dw_2.getitemnumber(1,'valor'))
//	end if
//next
//
end event

