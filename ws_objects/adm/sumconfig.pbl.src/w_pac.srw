$PBExportHeader$w_pac.srw
forward
global type w_pac from window
end type
type dw_pacauxt from datawindow within w_pac
end type
type dw_1 from datawindow within w_pac
end type
type pb_4 from picturebutton within w_pac
end type
type pb_mod from picturebutton within w_pac
end type
type pb_3 from picturebutton within w_pac
end type
type pb_2 from picturebutton within w_pac
end type
type st_4 from statictext within w_pac
end type
type pb_1 from picturebutton within w_pac
end type
type st_3 from statictext within w_pac
end type
type pb_anular from picturebutton within w_pac
end type
type st_ayuda from statictext within w_pac
end type
type st_2 from statictext within w_pac
end type
type st_1 from statictext within w_pac
end type
type rb_consumido from radiobutton within w_pac
end type
type rb_planeado from radiobutton within w_pac
end type
type pb_nuevo from picturebutton within w_pac
end type
type pb_grabartmp from picturebutton within w_pac
end type
type dw_pacaux from datawindow within w_pac
end type
type sle_insertar from singlelineedit within w_pac
end type
type pb_buscar from picturebutton within w_pac
end type
type sle_generico from singlelineedit within w_pac
end type
type pb_cancelar from picturebutton within w_pac
end type
type pb_grabardef from picturebutton within w_pac
end type
type dw_paccpo from datawindow within w_pac
end type
type dw_paccab from datawindow within w_pac
end type
type ddlb_anyo from dropdownlistbox within w_pac
end type
type dw_almfuente from datawindow within w_pac
end type
type gb_1 from groupbox within w_pac
end type
type gb_2 from groupbox within w_pac
end type
type gb_3 from groupbox within w_pac
end type
end forward

global type w_pac from window
integer width = 3808
integer height = 2168
boolean titlebar = true
string title = "Suministros - Plan Anual de Compras - PAC"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "rep.ico"
dw_pacauxt dw_pacauxt
dw_1 dw_1
pb_4 pb_4
pb_mod pb_mod
pb_3 pb_3
pb_2 pb_2
st_4 st_4
pb_1 pb_1
st_3 st_3
pb_anular pb_anular
st_ayuda st_ayuda
st_2 st_2
st_1 st_1
rb_consumido rb_consumido
rb_planeado rb_planeado
pb_nuevo pb_nuevo
pb_grabartmp pb_grabartmp
dw_pacaux dw_pacaux
sle_insertar sle_insertar
pb_buscar pb_buscar
sle_generico sle_generico
pb_cancelar pb_cancelar
pb_grabardef pb_grabardef
dw_paccpo dw_paccpo
dw_paccab dw_paccab
ddlb_anyo ddlb_anyo
dw_almfuente dw_almfuente
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_pac w_pac

type variables
DatawindowChild dwc_almfuente
string codDocumento
int anyo,xant,yant
boolean sugerir=FALSE, cambio

end variables

forward prototypes
public subroutine muestra2 (string mostrar, integer xpos, integer ypos)
public subroutine nuevodoc (string tipo)
public function integer grabar (string tipo)
public subroutine org_datos ()
end prototypes

public subroutine muestra2 (string mostrar, integer xpos, integer ypos);if xant=xpos and ypos=yant then return
xant=xpos
yant=ypos
if st_ayuda.visible = false or st_ayuda.text<>mostrar then
	st_ayuda.visible=false
	st_ayuda.text=mostrar
	st_ayuda.width=len(mostrar)*28
	if pointerx() + st_ayuda.width +35 > this.width then 
		xpos=pointerx() - st_ayuda.width -35
	else
		xpos=pointerx() +30
	end if
	if pointery() + 270 > this.height then 
		ypos=pointery() - 100
	else
		ypos=pointery() +80
	end if
	st_ayuda.x=xpos
	st_ayuda.y=ypos
	st_ayuda.visible=true
	timer(5)
end if
end subroutine

public subroutine nuevodoc (string tipo);string codalmacen,l_codigo
int ano, j, anosug, itemsug
long item,fila, i,l_mes

codalmacen = dw_almfuente.GetItemString(1,'codalmacen')
ano = integer(ddlb_anyo.Text)

select max(item) into :item from sumpaccab
where codalmacen = :codalmacen and ano=:ano;
IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
	Rollback;
	Return
END IF

if isNull(item) then
	item = 1
else
	item = item + 1
end if
	
fila = dw_paccab.Insertrow(1)
dw_paccab.SetItem(fila,'codalmacen',codalmacen)
dw_paccab.SetItem(fila,'ano',ano)
dw_paccab.SetItem(fila,'item',item)
dw_paccab.SetItem(fila,'usuario',usuario)
dw_paccab.SetItem(fila,'fecha',today())
dw_paccab.SetItem(fila,'estado','W')
dw_paccab.SetRow(fila)
dw_paccpo.Reset()
dw_pacaux.Reset()
dw_pacauxt.Reset()
if tipo = 'sugerir' then
	sugerir = TRUE
	select max(ano) into :anosug from sumpaccab
	where codalmacen = :codalmacen;
	if not isNull(anosug) then
		select max(item) into :itemsug from sumpaccab
		where codalmacen = :codalmacen and ano=:anosug;
		if not isNull(itemsug) then
	//		dw_pacaux.retrieve(codalmacen,anosug,itemsug,'%')
	//		if itemAnt > 0 then
	//			dw_pacaux.SetFilter("ano=" + string(ano) + " and item=" + string(itemAnt) )
	//		else
	//			dw_pacaux.SetFilter("ano=" + string(dw_pacaux.GetItemNumber(1,'ano'))+ " and item=" + string(dw_pacaux.GetItemNumber(1,'item')) )
	//		end if
	//		dw_pacaux.Filter()
			dw_pacauxt.retrieve(codalmacen,anosug,'%')
			for i = 1 to dw_pacauxt.RowCount()
				if l_codigo<>dw_pacauxt.GetItemString(i,'codgenerico') then
				   l_codigo=dw_pacauxt.GetItemString(i,'codgenerico')
				   fila = dw_paccpo.InsertRow(0)	
			     end if
				dw_paccpo.SetItem(fila,'codalmacen',codalmacen)
				dw_paccpo.SetItem(fila,'ano',ano)
				dw_paccpo.SetItem(fila,'item',item)
				dw_paccpo.SetItem(fila,'fecha',today())
				dw_paccpo.SetItem(fila,'codgenerico',dw_pacauxt.GetItemString(i,'codgenerico'))
				dw_paccpo.SetItem(fila,'descripcion',dw_pacauxt.GetItemString(i,'descripcion'))
				dw_paccpo.SetItem(fila,'estado','A')
				dw_paccpo.SetItem(fila,'nuevo',1)
				l_mes=dw_pacauxt.GetItemNumber(i,'mes')
				if anosug = ano then  // Si no hay documento para ese año, se deben agregar los items existentes
//					for j = 1 to 12
//						dw_paccpo.SetItem(fila,'mes'+string(j),dw_pacaux.GetItemNumber(i,'mes'+ string(j)))
//						if isNull(dw_paccpo.GetItemNumber(fila,'mes'+string(j))) then
//							dw_paccpo.SetItem(fila,'mes'+string(j),0)
//						end if
//					Next
//					for j = 1 to 12
//						dw_paccpo.SetItem(fila,'cmes'+string(j),0)
//						//dw_paccpo.SetItem(fila,'consumomes'+string(j),0)
//					next
				else  // Si no existen documentos para ese año se puede sugerir de años anteriores, lo planeado o por lo consumido
					if rb_planeado.checked then
						if isNull(dw_pacauxt.GetItemNumber(i,'planeado')) then 
							dw_paccpo.SetItem(fila,'mes'+string(l_mes),0)
						else
							dw_paccpo.SetItem(fila,'mes'+string(l_mes),dw_pacauxt.GetItemNumber(i,'planeado'))
						end If
					else
						if isNull(dw_pacauxt.GetItemNumber(i,'consumo')) then 
							dw_paccpo.SetItem(fila,'mes'+string(l_mes),0)
						else
							dw_paccpo.SetItem(fila,'mes'+string(l_mes),dw_pacauxt.GetItemNumber(i,'consumo'))
						end If
					end if
				end if		
			next
		end if
	else
		messageBox('Aviso','No hay ningun documento previo para sugerir')
	end if
else
	sugerir = FALSE
end if

end subroutine

public function integer grabar (string tipo);long fila, filaAnt, i, j

if cambio and dw_paccab.GetItemString(dw_paccab.GetRow(),'estado') = 'A' and tipo = 'definitivo' then
	if f_sol_permiso(pb_grabardef,'PAC') <> 1 then Return -1
else
	if dw_paccab.GetItemString(dw_paccab.GetRow(),'estado') = 'A' or dw_paccab.GetItemString(dw_paccab.GetRow(),'estado') = 'N' then
		messageBox('Aviso','El documento de PAC ya ha sido cerrado. No puede guardarse')
		Return 0
	end if
end if

for i = 1 to dw_paccpo.RowCount()
//	for j = 1 to 12
//		if isNull( dw_paccpo.GetItemNumber(i,'mes'+string(j)) ) then
//			dw_paccpo.SetItem(i,'mes'+string(j),0)
//		end if
//	next
	for j = 1 to 12
		if dw_paccpo.GetItemnumber(i,'nuevo')=1 then
			fila = dw_1.InsertRow(0)
			dw_1.scrolltoRow(fila)
			dw_1.SetItem(fila,'codalmacen',dw_paccpo.GetItemString(i,'codalmacen'))
			dw_1.SetItem(fila,'ano',dw_paccpo.GetItemNumber(i,'ano'))
			dw_1.SetItem(fila,'item',dw_paccpo.GetItemNumber(i,'item'))
			dw_1.SetItem(fila,'codgenerico',dw_paccpo.GetItemString(i,'codgenerico'))
			dw_1.SetItem(fila,'mes',j)
			dw_1.SetItem(fila,'planeado',dw_paccpo.GetItemNumber(i,'mes'+string(j)) )
			dw_1.SetItem(fila,'consumo',dw_paccpo.GetItemNumber(i,'cmes'+string(j)) )
			dw_1.SetItem(fila,'fecha',dw_paccpo.GetItemdatetime(i,'fecha'))
			dw_1.SetItem(fila,'nuevo',1)
			dw_1.SetItem(fila,'estado','A')
		else
			fila = dw_1.Find("codalmacen='"+dw_paccpo.GetItemString(i,'codalmacen')+"'  and ano="+string(dw_paccpo.GetItemNumber(i,'ano'))+"  and item="+string(dw_paccpo.GetItemNumber(i,'item'))+"  and mes="+string(j)+"  and codgenerico='"+dw_paccpo.GetItemString(i,'codgenerico')+"'",1,dw_1.RowCount())
			if fila >0 then
				if  dw_1.GetItemNumber(fila,'planeado') <> dw_paccpo.GetItemNumber(i,'mes'+string(j)) then
					dw_1.SetItem(fila,'planeado',dw_paccpo.GetItemNumber(i,'mes'+string(j)) )
				end if
			end if
		end if
	next
next

if tipo = 'temporal' then
	dw_paccab.SetItem(dw_paccab.GetRow(),'estado','T')
else
	filaAnt = dw_paccab.GetRow()
	fila = dw_paccab.Find("estado='A'",1,dw_paccab.RowCount())
	if fila > 0 then
		dw_paccab.SetItem(fila,'estado','M')
	end if
	dw_paccab.SetItem(filaAnt,'estado','A')
end if
if dw_paccab.Update() = -1 then
	Rollback;
	Return -1
end if

//if dw_paccpo.Update() = -1 then
if dw_1.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
cambio = FALSE
//dw_paccpo.Retrieve(dw_paccab.GetItemString(dw_paccab.GetRow(),'codalmacen'), dw_paccab.GetItemNumber(dw_paccab.GetRow(),'ano'),dw_paccab.GetItemNumber(dw_paccab.GetRow(),'item'))
dw_1.Retrieve(dw_paccab.GetItemString(dw_paccab.GetRow(),'codalmacen'), dw_paccab.GetItemNumber(dw_paccab.GetRow(),'ano'),dw_paccab.GetItemNumber(dw_paccab.GetRow(),'item'))

end function

public subroutine org_datos ();int l_j,l_i,l_fila,l_mes
string l_codigo
dw_paccpo.reset()
if  dw_1.RowCount()>0 then
	l_codigo='x'
	//dw_1.GetItemString(1,'codgenerico')
	//l_fila = dw_paccpo.InsertRow(0)	
end if
for l_i = 1 to dw_1.RowCount()
    if l_codigo<>dw_1.GetItemString(l_i,'codgenerico') then
		l_codigo=dw_1.GetItemString(l_i,'codgenerico')
		l_fila = dw_paccpo.InsertRow(0)
	end if
	l_mes=dw_1.GetItemNumber(l_i,'mes')
	dw_paccpo.SetItem(l_fila,'codalmacen',dw_1.GetItemString(l_i,'codalmacen'))
	dw_paccpo.SetItem(l_fila,'ano',dw_1.GetItemNumber(l_i,'ano'))
	dw_paccpo.SetItem(l_fila,'item',dw_1.GetItemNumber(l_i,'item'))
	dw_paccpo.SetItem(l_fila,'codgenerico',dw_1.GetItemString(l_i,'codgenerico'))
	dw_paccpo.SetItem(l_fila,'descripcion',dw_1.GetItemString(l_i,'descripcion'))
	if dw_1.GetItemString(l_i,'estado') <> 'N' then
		dw_paccpo.SetItem(l_fila,'mes'+string(l_mes),dw_1.GetItemNumber(l_i,'planeado'))
		dw_paccpo.SetItem(l_fila,'cmes'+string(l_mes),dw_1.GetItemNumber(l_i,'consumo'))
	else
		dw_paccpo.SetItem(l_fila,'cmes'+string(l_mes),0)
		dw_paccpo.SetItem(l_fila,'mes'+string(l_mes),0)
	end if
	dw_paccpo.SetItem(l_fila,'fecha',dw_1.GetItemdatetime(l_i,'fecha'))
	dw_paccpo.SetItem(l_fila,'estado',dw_1.GetItemString(l_i,'estado'))
next
end subroutine

on w_pac.create
this.dw_pacauxt=create dw_pacauxt
this.dw_1=create dw_1
this.pb_4=create pb_4
this.pb_mod=create pb_mod
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_4=create st_4
this.pb_1=create pb_1
this.st_3=create st_3
this.pb_anular=create pb_anular
this.st_ayuda=create st_ayuda
this.st_2=create st_2
this.st_1=create st_1
this.rb_consumido=create rb_consumido
this.rb_planeado=create rb_planeado
this.pb_nuevo=create pb_nuevo
this.pb_grabartmp=create pb_grabartmp
this.dw_pacaux=create dw_pacaux
this.sle_insertar=create sle_insertar
this.pb_buscar=create pb_buscar
this.sle_generico=create sle_generico
this.pb_cancelar=create pb_cancelar
this.pb_grabardef=create pb_grabardef
this.dw_paccpo=create dw_paccpo
this.dw_paccab=create dw_paccab
this.ddlb_anyo=create ddlb_anyo
this.dw_almfuente=create dw_almfuente
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.dw_pacauxt,&
this.dw_1,&
this.pb_4,&
this.pb_mod,&
this.pb_3,&
this.pb_2,&
this.st_4,&
this.pb_1,&
this.st_3,&
this.pb_anular,&
this.st_ayuda,&
this.st_2,&
this.st_1,&
this.rb_consumido,&
this.rb_planeado,&
this.pb_nuevo,&
this.pb_grabartmp,&
this.dw_pacaux,&
this.sle_insertar,&
this.pb_buscar,&
this.sle_generico,&
this.pb_cancelar,&
this.pb_grabardef,&
this.dw_paccpo,&
this.dw_paccab,&
this.ddlb_anyo,&
this.dw_almfuente,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_pac.destroy
destroy(this.dw_pacauxt)
destroy(this.dw_1)
destroy(this.pb_4)
destroy(this.pb_mod)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_4)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.pb_anular)
destroy(this.st_ayuda)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_consumido)
destroy(this.rb_planeado)
destroy(this.pb_nuevo)
destroy(this.pb_grabartmp)
destroy(this.dw_pacaux)
destroy(this.sle_insertar)
destroy(this.pb_buscar)
destroy(this.sle_generico)
destroy(this.pb_cancelar)
destroy(this.pb_grabardef)
destroy(this.dw_paccpo)
destroy(this.dw_paccab)
destroy(this.ddlb_anyo)
destroy(this.dw_almfuente)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;// OJO  variables inicializadas

//

anyo =  year(today())
ddlb_anyo.addItem(string(anyo - 4))
ddlb_anyo.addItem(string(anyo - 3))
ddlb_anyo.addItem(string(anyo - 2))
ddlb_anyo.addItem(string(anyo - 1))
ddlb_anyo.addItem(string(anyo))
ddlb_anyo.addItem(string(anyo + 1))
ddlb_anyo.addItem(string(anyo + 2))
ddlb_anyo.SelectItem(string(anyo),1)


dw_almfuente.GetChild('codalmacen', dwc_almfuente)
dwc_almfuente.SetTransObject(SQLCA)
if dwc_almfuente.Retrieve(usuario,'%') = 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_almfuente.InsertRow(0)
end if
dw_almfuente.SetTransObject(SQLCA)
dw_almfuente.InsertRow(0)

dw_paccab.SetTransObject(SQLCA)
dw_paccpo.SetTransObject(SQLCA)
dw_pacaux.SetTransObject(SQLCA)
dw_pacauxt.SetTransObject(SQLCA)
dw_1.SetTransObject(SQLCA)
end event

event timer;st_ayuda.visible=false
end event

event mousemove;st_ayuda.visible=false
end event

type dw_pacauxt from datawindow within w_pac
boolean visible = false
integer x = 3538
integer y = 84
integer width = 215
integer height = 60
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_pacaux_total"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_pac
boolean visible = false
integer x = 3250
integer width = 439
integer height = 152
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_paccpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_4 from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Modificar"
integer x = 3616
integer y = 904
integer width = 151
integer height = 132
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar_borrar.gif"
string disabledname = "d_editar_borrar.gif"
string powertiptext = "Modificar cantidades Artículo del Pac"
end type

event clicked;if dw_paccab.GetItemString( dw_paccab.GetRow(),'estado') = 'A' then
	openwithparm(w_pac_mod,dw_paccpo)
end if
end event

type pb_mod from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Modificar"
integer x = 3616
integer y = 1036
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "import.GIF"
string disabledname = "d_import.GIF"
string powertiptext = "Modificar Artículo del Pac"
end type

event clicked;if dw_paccab.GetItemString( dw_paccab.GetRow(),'estado') = 'A' then
	openwithparm(w_pac_mod_gen,dw_paccpo)
end if

end event

type pb_3 from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 1714
integer y = 416
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_Buscar.gif"
alignment htextalign = left!
string powertiptext = "Borrar documento nuevo"
end type

event clicked;if dw_paccab.RowCount() > 0 then
	if dw_paccab.GetItemString(dw_paccab.Getrow(),'estado') = 'W' then
		dw_paccab.DeleteRow(0)
		dw_paccab.TriggerEvent(rowfocuschanged!)
	else
		MessageBox('Atención','Solo se pueden borrar documentos nuevos.')
	end if
end if

end event

type pb_2 from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 2066
integer y = 720
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_Buscar.gif"
alignment htextalign = left!
string powertiptext = "Eliminar Fila"
end type

event clicked;if dw_paccpo.RowCount() > 0 then
	string l_alm,l_ano,l_item,l_gene
	int l_fila 	
	l_alm=dw_paccpo.GetItemString(dw_paccpo.getrow(),'codalmacen')
	l_ano=string(dw_paccpo.GetItemNumber(dw_paccpo.getrow(),'ano'))
	l_item=string(dw_paccpo.GetItemNumber(dw_paccpo.getrow(),'item'))
	l_gene=dw_paccpo.GetItemString(dw_paccpo.getrow(),'codgenerico')
	dw_paccpo.DeleteRow(0)
	dw_1.setfilter("codalmacen='"+l_alm+"'  and ano="+l_ano+"  and item="+l_item+"  and codgenerico='"+l_gene+"'")
	dw_1.filter()
	DO WHILE dw_1.rowcount()>0
		dw_1.DeleteRow(0)
	LOOP
	dw_1.setfilter("")
	dw_1.filter()
	cambio = TRUE
end if

end event

type st_4 from statictext within w_pac
integer x = 69
integer y = 180
integer width = 571
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documentos de PAC:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 2002
integer y = 1700
integer width = 146
integer height = 128
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir Reporte"
end type

event clicked;if dw_paccab.RowCount() < 1 then Return
any param[10]
param[1] = dw_almfuente.GetItemString(1,'codalmacen')
param[2] = long(ddlb_anyo.Text)
param[3] = dw_paccab.GetItemNumber(dw_paccab.GetRow(),'item')

f_reporte('PAC',"Reporte Plan Anual de Compras",param)


end event

type st_3 from statictext within w_pac
integer x = 2130
integer y = 184
integer width = 1600
integer height = 460
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Navegue por los Documentos de PAC (Plan Anual de Compras) haciendo click sobre el de interés en el Historial de PAC.  Los items en el detalle muestran lo que se planea consumir por mes y el consumo que se ha causado. Para hacer cambios sobre un documento, seleccione Nuevo Documento o digite sobre un campo, el programa le pedirá crear un documento"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_anular from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Anular"
integer x = 1559
integer y = 1700
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Anular"
end type

event clicked;if dw_paccab.RowCount() = 0 then Return
if dw_paccab.GetItemString(dw_paccab.GetRow(),'estado') = 'W' then
	messageBox('Aviso','El documento de PAC aun no ha sido guardado, no necesita anularse')
	Return 0
end if
if messageBox('Atención','Está seguro de querer anular el documento?',QUESTION!,YESNO!) = 2 then Return 0
dw_paccab.SetItem(dw_paccab.GetRow(),'estado','N')

if dw_paccab.update() = -1 then
	rollback;
else
	commit;
end if

end event

type st_ayuda from statictext within w_pac
boolean visible = false
integer x = 2807
integer y = 100
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb(255,255,220)
end event

type st_2 from statictext within w_pac
integer x = 2144
integer y = 24
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_pac
integer x = 73
integer y = 16
integer width = 325
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacen:"
boolean focusrectangle = false
end type

type rb_consumido from radiobutton within w_pac
integer x = 2926
integer y = 776
integer width = 343
integer height = 72
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Consumido"
end type

type rb_planeado from radiobutton within w_pac
integer x = 2560
integer y = 776
integer width = 343
integer height = 72
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Planeado"
boolean checked = true
end type

type pb_nuevo from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Nuevo"
integer x = 1714
integer y = 284
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo"
end type

event clicked;if isnull(dw_almfuente.GetItemString(1,'codalmacen')) then
	messageBox('Aviso','Debe seleccionar un almacén')
	Return
end if
if messageBox('Aviso','Desea usar el anterior documento como sugerido?',Question!,YesNo!) = 1 then
	nuevodoc('sugerir')
else
	nuevodoc('vacio')
end if

end event

type pb_grabartmp from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "GrabarTemporal"
integer x = 1710
integer y = 1700
integer width = 146
integer height = 128
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "GrabarTemporal"
end type

event clicked;grabar('temporal')
end event

type dw_pacaux from datawindow within w_pac
boolean visible = false
integer x = 3538
integer y = 4
integer width = 215
integer height = 60
boolean enabled = false
string title = "none"
string dataobject = "dw_pacaux"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_insertar from singlelineedit within w_pac
integer x = 1088
integer y = 744
integer width = 704
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string descripcion, codigo, codgen
long fila, i, f
if dw_paccab.RowCount() = 0 then Return
codigo = sle_insertar.Text
setNull(codgen)

select codgenerico into :codgen
from sumarticulo where codarticulo = :codigo;
IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
	Rollback;
	Return
end if
if not isNull(codgen) then codigo = codgen

select descripcion into :descripcion
from sumgenerico where codgenerico = :codigo;
IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
	Rollback;
	Return
ELSEIF SQLCA.SQLCode = 100 THEN 
	messageBox('Error','No existe generico con codigo ' + codigo)
ELSE
	fila = dw_paccpo.Find("codgenerico='" + codigo +"'",1,dw_paccpo.RowCount())
	if fila > 0 then
		messageBox('Aviso','El genérico '+ codigo +' ya esta incluido en el PAC actual')
		dw_paccpo.SetRow(fila)
		dw_paccpo.scrolltoRow(fila)
	else
		cambio = TRUE
		fila = dw_paccpo.InsertRow(0)
		dw_paccpo.scrolltoRow(fila)
		dw_paccpo.SetItem(fila,'codalmacen',dw_paccab.GetItemString(dw_paccab.GetRow(),'codalmacen'))
		dw_paccpo.SetItem(fila,'ano',dw_paccab.GetItemNumber(dw_paccab.GetRow(),'ano'))
		dw_paccpo.SetItem(fila,'item',dw_paccab.GetItemNumber(dw_paccab.GetRow(),'item'))
		dw_paccpo.SetItem(fila,'codgenerico',codigo)
		dw_paccpo.SetItem(fila,'descripcion',descripcion)
		dw_paccpo.SetItem(fila,'fecha',today())
		dw_paccpo.SetItem(fila,'nuevo',1)
		dw_paccpo.SetItem(fila,'estado','A')
		f = dw_pacaux.Find("codgenerico='"+codigo+"'",1,dw_pacaux.RowCount())
		if sugerir and f > 0 then
			if rb_planeado.checked then
				for i = 1 to 12
					dw_paccpo.SetItem(fila,'mes'+string(i),dw_pacaux.GetItemNumber(f,'mes'+ string(i)))
				Next
			else
				for i = 1 to 12
					//dw_paccpo.SetItem(fila,'mes'+string(i),dw_pacaux.GetItemNumber(f,'consumomes'+ string(i)))
					dw_paccpo.SetItem(fila,'mes'+string(i),dw_pacaux.GetItemNumber(f,'cmes'+ string(i)))
				Next
			end if
		end if
	end if
END IF

end event

type pb_buscar from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 1833
integer y = 724
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.gif"
string disabledname = "d_Buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;openwithParm(w_buscaart,sle_insertar)

end event

type sle_generico from singlelineedit within w_pac
event teclear pbm_keyup
integer x = 133
integer y = 740
integer width = 763
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event teclear;dw_paccpo.SetFilter("upper(descripcion) like '" + upper(this.Text) + "%'")
dw_paccpo.Filter()

end event

type pb_cancelar from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1408
integer y = 1700
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Cancelar.gif"
string disabledname = "d_Cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_grabardef from picturebutton within w_pac
event mousemove pbm_mousemove
string tag = "Grabar Definitivo"
integer x = 1856
integer y = 1700
integer width = 146
integer height = 128
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Grabar Definitivo"
end type

event clicked;if MessageBox('Aviso','Al salvar definitivo solo podrá hacer modificaciones creando un documento nuevo. Desea Continuar?',Question!,YesNoCancel!) = 1 then
	grabar('definitivo')
end if

end event

type dw_paccpo from datawindow within w_pac
event tecleo pbm_dwnkey
integer x = 37
integer y = 896
integer width = 3566
integer height = 768
integer taborder = 110
string title = "none"
string dataobject = "dw_paccpo_v"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event tecleo;
//if dw_paccab.GetItemString(dw_paccab.GetRow(),'estado') = 'A' then
//	if left(this.GetColumnName(),3) = 'mes' then
//		if messageBox('Aviso','El documento esta cerrado. Si desea editarlo se creará un documento nuevo. Desea Crearlo?',Question!,YesNo!) = 1 then
//			nuevodoc('sugerir')
//		end if
//	end if
//end if
//
end event

event itemchanged;cambio = TRUE

end event

event clicked;if row < 1 then Return
if getrow() <> row then setRow(row)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)

end event

type dw_paccab from datawindow within w_pac
integer x = 64
integer y = 244
integer width = 1609
integer height = 408
integer taborder = 30
string title = "none"
string dataobject = "dw_paccab"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;string modificar
int i
pb_mod.Visible = FALSE
pb_mod.Enabled = FALSE
if rowCount() = 0 or currentRow <= 0 then Return
//dw_paccpo.Retrieve(GetItemString(GetRow(),'codalmacen'), GetItemNumber(GetRow(),'ano'),GetItemNumber(GetRow(),'item'))
dw_1.Retrieve(GetItemString(GetRow(),'codalmacen'), GetItemNumber(GetRow(),'ano'),GetItemNumber(GetRow(),'item'))
org_datos()
if dw_paccab.GetItemString(GetRow(),'estado') = 'T' or dw_paccab.GetItemString(GetRow(),'estado') = 'W' then
//	modificar = "fecha.edit.displayonly=no "
//	for i = 1 to 12
//		modificar = modificar + "mes" + string(i) + ".Edit.displayonly=no "
//	Next
//	dw_paccpo.Modify(modificar)	
else
//	modificar = "fecha.edit.displayonly=yes "
//	for i = 1 to 12
//		modificar = modificar + "mes" + string(i) + ".Edit.displayonly=yes "
//	Next
//	dw_paccpo.Modify(modificar)
	if dw_paccab.GetItemString(GetRow(),'estado') = 'A' or dw_paccab.GetItemString(GetRow(),'estado') = 'M' then
		pb_mod.Visible = TRUE
		pb_mod.Enabled = TRUE
	end if
end if

end event

event rowfocuschanging;//if dw_paccpo.GetNextModified(0, Primary!) > 0 then
//	if messageBox('Aviso','No ha guardado los cambios. Si continua los perdera. desea Continuar?',Question!,YesNo!) = 2 then 
//		Return 1
//	end if
//end if
//
end event

type ddlb_anyo from dropdownlistbox within w_pac
integer x = 2149
integer y = 88
integer width = 375
integer height = 400
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean vscrollbar = true
string item[] = {""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//if dw_paccpo.GetNextModified(0, Primary!) > 0 then
if cambio=true then
	if messageBox('Aviso','No ha guardado los cambios. Si continua los perdera. desea Continuar?',Question!,YesNo!) = 2 then 
		ddlb_anyo.SelectItem(string(anyo),1)
		Return 1
	end if
end if
anyo = integer(ddlb_anyo.Text)
dw_paccpo.Reset()
dw_paccab.Reset()
dw_paccab.Retrieve(dw_almfuente.GetItemString(1,'codalmacen'), long(ddlb_anyo.Text))

end event

type dw_almfuente from datawindow within w_pac
integer x = 64
integer y = 84
integer width = 1161
integer height = 72
integer taborder = 10
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;AcceptText()
dw_paccpo.Reset()
dw_paccab.Reset()
dw_paccab.Retrieve(GetItemString(1,'codalmacen'), long(ddlb_anyo.Text))

end event

type gb_1 from groupbox within w_pac
integer x = 69
integer y = 668
integer width = 910
integer height = 192
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar Genéricos"
end type

type gb_2 from groupbox within w_pac
integer x = 1038
integer y = 672
integer width = 997
integer height = 192
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agregar Genéricos"
end type

type gb_3 from groupbox within w_pac
integer x = 2519
integer y = 696
integer width = 777
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sugerir desde:"
end type

