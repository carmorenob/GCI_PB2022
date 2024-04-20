$PBExportHeader$w_lleva_inventario.srw
forward
global type w_lleva_inventario from window
end type
type st_3 from statictext within w_lleva_inventario
end type
type st_2 from statictext within w_lleva_inventario
end type
type st_1 from statictext within w_lleva_inventario
end type
type dw_bolsas from datawindow within w_lleva_inventario
end type
type pb_can from picturebutton within w_lleva_inventario
end type
type pb_acep from picturebutton within w_lleva_inventario
end type
type dw_inv from datawindow within w_lleva_inventario
end type
end forward

global type w_lleva_inventario from window
integer width = 3963
integer height = 1484
boolean titlebar = true
string title = "Traer desde Inventario"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
st_2 st_2
st_1 st_1
dw_bolsas dw_bolsas
pb_can pb_can
pb_acep pb_acep
dw_inv dw_inv
end type
global w_lleva_inventario w_lleva_inventario

type variables
string l_alm
end variables

on w_lleva_inventario.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_bolsas=create dw_bolsas
this.pb_can=create pb_can
this.pb_acep=create pb_acep
this.dw_inv=create dw_inv
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.dw_bolsas,&
this.pb_can,&
this.pb_acep,&
this.dw_inv}
end on

on w_lleva_inventario.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_bolsas)
destroy(this.pb_can)
destroy(this.pb_acep)
destroy(this.dw_inv)
end on

event open;if isnull(message.stringparm) then return
l_alm=message.stringparm
dw_inv.retrieve(l_alm)
end event

type st_3 from statictext within w_lleva_inventario
integer x = 55
integer y = 20
integer width = 626
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Existencias en Bodega"
boolean focusrectangle = false
end type

type st_2 from statictext within w_lleva_inventario
integer x = 3031
integer y = 20
integer width = 411
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Registros"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_1 from statictext within w_lleva_inventario
integer x = 3483
integer y = 20
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_bolsas from datawindow within w_lleva_inventario
boolean visible = false
integer x = 55
integer y = 1244
integer width = 1371
integer height = 108
integer taborder = 30
string title = "none"
string dataobject = "dw_banco_bolsas"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_can from picturebutton within w_lleva_inventario
integer x = 1774
integer y = 1240
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;closewithreturn(parent,'!')
end event

type pb_acep from picturebutton within w_lleva_inventario
integer x = 1609
integer y = 1236
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
string disabledname = "AlignBottom!"
alignment htextalign = left!
string powertiptext = "Aceptar llevar a Disponible desde Inventario"
end type

event clicked;int l_i,donde,nro_b,l_it
string clug_dona,l_art,l_lot,l_con,l_lre,l_cre,err
datetime l_fv
long dona,ndoc
for l_i=1 to dw_inv.rowcount()
	if  dw_inv.getitemnumber(l_i,'selec')=1 then
		clug_dona=dw_inv.getitemstring(l_i,'clugar_dona')
		dona=dw_inv.getitemnumber(l_i,'nro_donacion')
		l_art=dw_inv.getitemstring(l_i,'codarticulo')
		l_fv=dw_inv.getitemdatetime(l_i,'fecha_venc')
		l_lot=dw_inv.getitemstring(l_i,'lote')
		l_con=dw_inv.getitemstring(l_i,'convenio')
		l_cre=dw_inv.getitemstring(l_i,'coddoc')
		l_lre=dw_inv.getitemstring(l_i,'clugar')
		ndoc=dw_inv.getitemnumber(l_i,'numdoc')
		l_it=dw_inv.getitemnumber(l_i,'item')
		if dw_inv.getitemnumber(l_i,'mmitem')=0 then 
			select max(banco_bolsa.nro_bolsa) into :nro_b
			from banco_bolsa
			where (((banco_bolsa.clugar)=:clug_dona) and ((banco_bolsa.nro_donacion)=:dona));
			if isnull(nro_b) then nro_b=0
		else
			nro_b=dw_inv.getitemnumber(l_i,'mmitem')
		end if
		nro_b=nro_b+1
		dw_inv.setitem(l_i,'mitem',nro_b)
		donde=dw_bolsas.insertrow(0)
		dw_bolsas.setitem(donde,'clugar',clug_dona)
		dw_bolsas.setitem(donde,'nro_donacion',dona)
		dw_bolsas.setitem(donde,'nro_bolsa',nro_b)
		dw_bolsas.setitem(donde,'fecha_aprobacion',dw_inv.getitemdatetime(l_i,'fecha_aprobacion'))
		dw_bolsas.setitem(donde,'nro_sello',dw_inv.getitemnumber(l_i,'nro_sello'))
		dw_bolsas.setitem(donde,'estado','D')
		dw_bolsas.setitem(donde,'fecha_vencimiento',dw_inv.getitemdatetime(l_i,'fecha_venc'))
		dw_bolsas.setitem(donde,'cod_banco',dw_inv.getitemstring(l_i,'cod_banco'))
		dw_bolsas.setitem(donde,'cod_empaque',dw_inv.getitemstring(l_i,'cod_empaque'))
		dw_bolsas.setitem(donde,'nro',dw_inv.getitemnumber(l_i,'nro'))
		dw_bolsas.setitem(donde,'codproced',dw_inv.getitemstring(l_i,'codproced'))
		dw_bolsas.setitem(donde,'coddocref',l_cre)
		dw_bolsas.setitem(donde,'clugarref',l_lre)
		dw_bolsas.setitem(donde,'numdocref',ndoc)
		dw_bolsas.setitem(donde,'itemref',dw_inv.getitemnumber(l_i,'item'))		
		update 
			sum_mvto_lote set cantunidades = 1
		where 
			(((codalmacen)=:l_alm) and ((codarticulo)=:l_art) and ((fecha_venc)=:l_fv) and ((lote)=:l_lot) 
			and ((convenio)=:l_con) and ((coddoc)=:l_cre) and ((clugar)=:l_lre) and ((numdoc)=:ndoc) and ((item)=:l_it));
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando sum_mvto_lote',err)
		end if
	end if
next
if dw_bolsas.update(true,false)=-1 then
	rollback;
	return -1
end if
commit;
dw_inv.retrieve(l_alm)
closewithreturn(parent,'Si')
 
end event

type dw_inv from datawindow within w_lleva_inventario
integer x = 41
integer y = 96
integer width = 3872
integer height = 1108
integer taborder = 10
string title = "none"
string dataobject = "dw_banco_inventario"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event retrieveend;st_1.text=string(dw_inv.rowcount())
end event

event buttonclicked;int j
for j=1 to rowcount()
	if dwo.text='Escoger' then
		setrow(j)
		setitem(j,'selec',1)
	else
		setitem(j,'selec',0)
	end if
next

if dwo.text='Escoger' then modify(string(dwo.name)+'.text="No Escog."') else 	modify(string(dwo.name)+'.text="Escoger"')

end event

