$PBExportHeader$w_escoge_articulo_enf.srw
forward
global type w_escoge_articulo_enf from window
end type
type st_5 from statictext within w_escoge_articulo_enf
end type
type st_cant from statictext within w_escoge_articulo_enf
end type
type st_3 from statictext within w_escoge_articulo_enf
end type
type st_2 from statictext within w_escoge_articulo_enf
end type
type pb_cancel from picturebutton within w_escoge_articulo_enf
end type
type pb_aceptar from picturebutton within w_escoge_articulo_enf
end type
type st_1 from statictext within w_escoge_articulo_enf
end type
type dw_tarifa from datawindow within w_escoge_articulo_enf
end type
end forward

global type w_escoge_articulo_enf from window
integer width = 4183
integer height = 1016
boolean titlebar = true
string title = "Suministro Medicamento: Escoger Articulos"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "DosEdit5!"
boolean clientedge = true
boolean center = true
st_5 st_5
st_cant st_cant
st_3 st_3
st_2 st_2
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_1 st_1
dw_tarifa dw_tarifa
end type
global w_escoge_articulo_enf w_escoge_articulo_enf

type variables
st_lotes st

end variables

on w_escoge_articulo_enf.create
this.st_5=create st_5
this.st_cant=create st_cant
this.st_3=create st_3
this.st_2=create st_2
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.dw_tarifa=create dw_tarifa
this.Control[]={this.st_5,&
this.st_cant,&
this.st_3,&
this.st_2,&
this.pb_cancel,&
this.pb_aceptar,&
this.st_1,&
this.dw_tarifa}
end on

on w_escoge_articulo_enf.destroy
destroy(this.st_5)
destroy(this.st_cant)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.dw_tarifa)
end on

event open;st = message.powerobjectparm
st_cant.text=string(st.cant)
dw_tarifa.retrieve(st.contador_os,st.clugar_os,st.nsolicitud_os,st.item_os)
if dw_tarifa.rowcount()=1 then
	dw_tarifa.setitem(1,'llevar',st.cant)
end if

end event

type st_5 from statictext within w_escoge_articulo_enf
integer x = 2889
integer y = 132
integer width = 827
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "CANTIDAD A ATENDER"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_cant from statictext within w_escoge_articulo_enf
integer x = 3726
integer y = 124
integer width = 352
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_escoge_articulo_enf
integer x = 375
integer y = 144
integer width = 2423
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;//text=st.desproc


end event

type st_2 from statictext within w_escoge_articulo_enf
integer x = 27
integer y = 140
integer width = 325
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;//text=st.proccups


end event

type pb_cancel from picturebutton within w_escoge_articulo_enf
integer x = 2098
integer y = 764
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;st.cmedica='-1'
closewithreturn(parent,st)
end event

type pb_aceptar from picturebutton within w_escoge_articulo_enf
integer x = 1943
integer y = 764
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;int l_k,l_fila,nserv=0,donde
double l_sums
if  dw_tarifa.rowcount()=0 then return 
 dw_tarifa.accepttext()
if  dw_tarifa.getitemnumber(1,'total')<>st.cant then
	messagebox('Atención','La cantidad a entregar es diferente a la solicitada, revise para poder continuar')
	return 
end if
for l_k=1 to dw_tarifa.rowcount()
	if dw_tarifa.getitemnumber(l_k,'llevar')<>0 then
		l_fila =st.dw_lote_mov.Find("conta_orden="+string(st.contador_os)+ " and clug_orden='"+st.clugar_os+"' and norden_serv="+string(st.nsolicitud_os)+" and item_orden="+string(st.item_os)+" and codarticulo='"+dw_tarifa.getitemstring(l_k,'codarticulo')&
		+"' and coddoc_ent='" +dw_tarifa.getitemstring(l_k,'coddoc')+"' and  clugar_ent='"+dw_tarifa.getitemstring(l_k,'clugar')+"' and numdoc_ent="+string(dw_tarifa.getitemnumber(l_k,'numdoc'))&
		+" and item_ent="+string(dw_tarifa.getitemnumber(l_k,'item'))+" and fecha_venc=datetime('"+string(dw_tarifa.getitemdatetime(l_k,'fecha_venc'))+"')  and lote='"+dw_tarifa.getitemstring(l_k,'lote')&
	    +"' and convenio='"+dw_tarifa.getitemstring(l_k,'convenio')+"'",1, st.dw_lote_mov.RowCount())
		if isnull(l_fila) then l_fila=0
		if l_fila = 0 then
			if nserv=0  then
				select max(nservicio) into :nserv from serviciosingreso where contador=:st.contador_os and clugar=:st.clugar_os;
			end if
			if isnull(nserv) then nserv=0
			nserv ++
			donde=st.dw_lote_mov.insertrow(0)
			st.dw_lote_mov.setitem(donde,'contador',st.contador_os)
			st.dw_lote_mov.setitem(donde,'clugar',st.clugar_os)
			st.dw_lote_mov.setitem(donde,'nservicio',nserv)
			st.dw_lote_mov.setitem(donde,'c_medica',st.cmedica)
			st.dw_lote_mov.setitem(donde,'rips',st.alm)
			st.dw_lote_mov.setitem(donde,'fecha',datetime(today(),time(string(now()))))
			st.dw_lote_mov.setitem(donde,'usuario',st.usu)
			st.dw_lote_mov.setitem(donde,'estria','1')
			st.dw_lote_mov.setitem(donde,'tipo_orden','H')
			st.dw_lote_mov.setitem(donde,'cantidad',dw_tarifa.getitemnumber(l_k,'llevar'))
			st.dw_lote_mov.setitem(donde,'cprof',st.cdoc)  // La Enfermera
			st.dw_lote_mov.setitem(donde,'cesp',st.clug)  // La Enfermera
			st.dw_lote_mov.setitem(donde,"conta_orden",st.contador_os)
			st.dw_lote_mov.setitem(donde,"clug_orden",st.clugar_os)
			st.dw_lote_mov.setitem(donde,"norden_serv",st.nsolicitud_os)
			st.dw_lote_mov.setitem(donde,"item_orden",st.item_os)
			st.dw_lote_mov.setitem(donde,"codarticulo",dw_tarifa.getitemstring(l_k,'codarticulo'))
			st.dw_lote_mov.setitem(donde,"coddoc_ent" ,dw_tarifa.getitemstring(l_k,'coddoc'))
			st.dw_lote_mov.setitem(donde,"clugar_ent",dw_tarifa.getitemstring(l_k,'clugar'))
			st.dw_lote_mov.setitem(donde,"numdoc_ent",dw_tarifa.getitemnumber(l_k,'numdoc'))
			st.dw_lote_mov.setitem(donde,"item_ent",dw_tarifa.getitemnumber(l_k,'iteme'))
			st.dw_lote_mov.setitem(donde,"fecha_venc",dw_tarifa.getitemdatetime(l_k,'fecha_venc'))
			st.dw_lote_mov.setitem(donde,"lote",dw_tarifa.getitemstring(l_k,'lote'))
			st.dw_lote_mov.setitem(donde,"convenio",dw_tarifa.getitemstring(l_k,'convenio'))	
			st.dw_lote_mov.setitem(donde,"nautoriza",st.autoriza)	
 			st.nserv=nserv
			 // PARA CENTROS DE COSTO
			 string i_uf,i_cc
			setnull(i_uf)
			setnull(i_cc)
			select distinct sum_clase.coduf, sum_clase.codcc  into :i_uf ,:i_cc
			from (sumarticulo inner join sumgenerico on sumarticulo.codgenerico = sumgenerico.codgenerico) inner join sum_clase on (sumgenerico.codgrupo = sum_clase.codgrupo) and (sumgenerico.codclase = sum_clase.codclase)
			where (((sumgenerico.c_medica)=:st.cmedica));
			st.dw_lote_mov.setitem(donde,"cufuncional",i_uf)
		   	st.dw_lote_mov.setitem(donde,"cccosto",i_cc)	
		else
			l_sums=st.dw_lote_mov.getitemnumber(l_fila,'cantidad')+dw_tarifa.getitemnumber(l_k,'llevar')
			st.dw_lote_mov.setitem(l_fila,'cprof',st.cdoc)  // La Enfermera
			st.dw_lote_mov.setitem(l_fila,'cesp',st.clug)  // La Enfermera
			st.dw_lote_mov.setitem(l_fila,'fecha',datetime(today(),time(string(now()))))
			st.dw_lote_mov.setitem(l_fila,'cantidad',l_sums)
			st.dw_lote_mov.setitem(l_fila,'c_medica',st.cmedica)
			nserv=st.dw_lote_mov.getitemnumber(l_fila,'nservicio')
 			st.nserv=nserv
		end if
	end if
next
st.cmedica=dw_tarifa.getitemstring(1,'codarticulo')
closewithreturn(parent,st)
end event

type st_1 from statictext within w_escoge_articulo_enf
integer x = 37
integer y = 4
integer width = 4046
integer height = 116
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble click o Aceptar sobre el  Medicamento que va a facturar y de acuerdo a su necesidad y control de kardex, el color rosado indica que no hay existencia del artículo:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_tarifa from datawindow within w_escoge_articulo_enf
integer x = 23
integer y = 224
integer width = 4073
integer height = 536
integer taborder = 10
string title = "none"
string dataobject = "dw_entrega_x_lote_x_atencion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;if this.getrow()<1 then return
If isnull(ROW) then row=1
if  (dw_tarifa.getitemnumber(row,'sumi') ) < dw_tarifa.getitemnumber(row,'ecant') then 

else
	messagebox('Atención','Excede cantidad entregada verifique')
	return -1
end if

end event

