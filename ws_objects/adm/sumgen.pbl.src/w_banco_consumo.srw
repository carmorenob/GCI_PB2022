$PBExportHeader$w_banco_consumo.srw
forward
global type w_banco_consumo from window
end type
type st_cuantos from statictext within w_banco_consumo
end type
type pb_2 from picturebutton within w_banco_consumo
end type
type pb_1 from picturebutton within w_banco_consumo
end type
type dw_1 from datawindow within w_banco_consumo
end type
end forward

global type w_banco_consumo from window
integer width = 3278
integer height = 1656
boolean titlebar = true
string title = "Lleva Consumo desde Banco"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_cuantos st_cuantos
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_banco_consumo w_banco_consumo

type variables
st_lote st_p

end variables

on w_banco_consumo.create
this.st_cuantos=create st_cuantos
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.st_cuantos,&
this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_banco_consumo.destroy
destroy(this.st_cuantos)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;st_p = Message.PowerObjectParm
if st_p.coddoc='SC' then
	w_banco_consumo.title='Lleva Consumo desde Banco'
end if
if st_p.coddoc='SB' then
	w_banco_consumo.title='Lleva Baja desde Banco'
end if

dw_1.retrieve(st_p.codalmacen,st_p.codarticulo,st_p.codalmacendes)

end event

type st_cuantos from statictext within w_banco_consumo
integer x = 2734
integer y = 1408
integer width = 517
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_banco_consumo
integer x = 1646
integer y = 1412
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;closewithreturn(parent,'!')
end event

type pb_1 from picturebutton within w_banco_consumo
integer x = 1481
integer y = 1412
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;int j,donde,item=1,fila,filal
string l_cdd,l_clu,codigo,fecha_venc,lote,clugar_dona
double nro_donacion,nro_bolsa

long l_ne
l_ne= dw_1.rowcount()
for j=1 to dw_1.rowcount()
	codigo=dw_1.getitemstring(j,'codarticulo')
	if codigo='120010-1' then
		J=J
	end if
	fila = st_p.dw_cpo.Find( "codarticulo=" + "'" + codigo + "'", 1, st_p.dw_cpo.RowCount())
	if fila < 1 then	
		donde=st_p.dw_cpo.insertrow(0)
		st_p.dw_cpo.setitem(donde,'coddoc',st_p.coddoc)
		st_p.dw_cpo.setitem(donde,'clugar',st_p.clugar)
		st_p.dw_cpo.setitem(donde,'numdoc',st_p.numdoc)
		st_p.dw_cpo.setitem(donde,'item',item)
		st_p.dw_cpo.setitem(donde,'codarticulo',dw_1.getitemstring(j,'codarticulo'))
		st_p.dw_cpo.setitem(donde,'descripcion',dw_1.getitemstring(j,'descripcion'))
		st_p.dw_cpo.setitem(donde,'cantidad',1)
		st_p.dw_cpo.setitem(donde,'coddoc_ori',dw_1.getitemstring(j,'coddoc'))
		st_p.dw_cpo.setitem(donde,'clugar_ori',dw_1.getitemstring(j,'clugar'))
		st_p.dw_cpo.setitem(donde,'numdoc_ori',dw_1.getitemnumber(j,'numdoc'))
		st_p.dw_cpo.setitem(donde,'item_ori	',dw_1.getitemnumber(j,'item'))
		st_p.dw_cpo.setitem(donde,'estado','0')
		st_p.dw_cpo.setitem(donde,'valor_unit',dw_1.getitemnumber(j,'costoprom'))
		item++	
	else
		st_p.dw_cpo.ScrolltoRow(fila)
	end if
	nro_donacion=dw_1.getitemnumber(j,'nro_donacion')
	nro_bolsa=dw_1.getitemnumber(j,'nro_bolsa')
	clugar_dona=dw_1.getitemstring(j,'clugar')
	update banco_bolsa  set en_destino='1' where clugar=:clugar_dona and nro_donacion=:nro_donacion and nro_bolsa=:nro_bolsa;
	if sqlca.sqlcode=-1 then
		messagebox("Error en interface con sum_mvto_cpo",sqlca.sqlerrtext)
		rollback;
		return
	end if
	lote = dw_1.GetItemString(j,'lote')
	fecha_venc = string(dw_1.GetItemDateTime(j,'fecha_vencimiento'),'yyyy-mm-dd')
	filal = st_p.dw_obj.Find( "codarticulo=" + "'" + codigo + "' and upper(lote)=upper('"+lote+"') and fecha_venc=datetime(date('" + fecha_venc+"'))", 1, st_p.dw_obj.RowCount())
	if filal = 0 then
		filal = st_p.dw_obj.InsertRow(0)
		st_p.dw_obj.SetItem(filal, 'codalmacen',st_p.codalmacen )
		st_p.dw_obj.SetItem(filal, 'codarticulo',dw_1.getitemstring(j,'codarticulo'))
		st_p.dw_obj.SetItem(filal, 'fecha_venc',dw_1.getitemdatetime(j,'fecha_vencimiento') )
		st_p.dw_obj.SetItem(filal, 'lote',dw_1.getitemstring(j,'lote'))
		st_p.dw_obj.SetItem(filal, 'coddoc', st_p.coddoc)
		st_p.dw_obj.SetItem(filal, 'cLugar', st_p.clugar)
		st_p.dw_obj.SetItem(filal, 'numdoc', st_p.numdoc )
		st_p.dw_obj.SetItem(filal, 'fecha_aprobacion',dw_1.getitemdatetime(j,'fecha_aprobacion') )
		st_p.dw_obj.SetItem(filal, 'nro_sello',dw_1.getitemnumber(j,'nro_Sello') )		
		st_p.dw_obj.SetItem(filal, 'item', item - 1 )
		st_p.dw_obj.SetItem(filal, 'convenio',dw_1.getitemstring(j,'convenio') )
		st_p.dw_obj.SetItem(filal, 'Estado','0')
		st_p.dw_obj.SetItem(filal, 'signo',-1)
		st_p.dw_obj.setitem(filal,'cantidad',1)
		st_p.dw_obj.SetItem(filal, 'saldo_lote',1)
		st_p.dw_obj.AcceptText()
		st_p.dw_cpo.SetItem(fila,'cantidad',st_p.dw_obj.getitemnumber(1,'essuma'))
	end if
next
commit;
closewithreturn(parent,'SI')

end event

type dw_1 from datawindow within w_banco_consumo
integer x = 50
integer y = 56
integer width = 3186
integer height = 1340
integer taborder = 10
string title = "none"
string dataobject = "dw_banco_consumo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;st_cuantos.text="Reg. "+ string(getrow()) +" de " +string(rowcount())
end event

