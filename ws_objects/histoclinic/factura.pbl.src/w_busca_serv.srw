$PBExportHeader$w_busca_serv.srw
forward
global type w_busca_serv from window
end type
type dw_manuales from datawindow within w_busca_serv
end type
type st_serv from statictext within w_busca_serv
end type
type rb_3 from radiobutton within w_busca_serv
end type
type rb_2 from radiobutton within w_busca_serv
end type
type rb_1 from radiobutton within w_busca_serv
end type
type st_3 from statictext within w_busca_serv
end type
type st_2 from statictext within w_busca_serv
end type
type pb_cancel from picturebutton within w_busca_serv
end type
type pb_aceptar from picturebutton within w_busca_serv
end type
type st_1 from statictext within w_busca_serv
end type
type d_filtrar from dropdownlistbox within w_busca_serv
end type
type sle_1 from singlelineedit within w_busca_serv
end type
type dw_busca from datawindow within w_busca_serv
end type
type gb_1 from groupbox within w_busca_serv
end type
end forward

global type w_busca_serv from window
integer width = 3753
integer height = 1476
boolean titlebar = true
string title = "Búsqueda de procedimientos para Facturar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean clientedge = true
boolean center = true
dw_manuales dw_manuales
st_serv st_serv
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
st_3 st_3
st_2 st_2
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_1 st_1
d_filtrar d_filtrar
sle_1 sle_1
dw_busca dw_busca
gb_1 gb_1
end type
global w_busca_serv w_busca_serv

type variables
string anterior,orden,l_sex_pa,i_mueve_kardex,i_alm
st_cargar_a st
string i_manual_proc=" AND tarifas.codmanual IN ("
string i_manual_med=" AND tarifa_medica.CodManual IN ("
end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();choose case d_filtrar.text
	case "Código"
		dw_busca.setfilter("codservicio like '"+trim(sle_1.text)+"%'")
	case "Descripción"
		dw_busca.setfilter("upper(descripcion) like '"+upper(trim(sle_1.text))+"%'")
	case "Articulo"
		dw_busca.setfilter("codarticulo like '"+trim(sle_1.text)+"%'")
		
end choose
dw_busca.filter()
dw_busca.sort()
st_2.text=string(dw_busca.rowcount())+' Registro(s)'
end subroutine

on w_busca_serv.create
this.dw_manuales=create dw_manuales
this.st_serv=create st_serv
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_3=create st_3
this.st_2=create st_2
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.d_filtrar=create d_filtrar
this.sle_1=create sle_1
this.dw_busca=create dw_busca
this.gb_1=create gb_1
this.Control[]={this.dw_manuales,&
this.st_serv,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.st_3,&
this.st_2,&
this.pb_cancel,&
this.pb_aceptar,&
this.st_1,&
this.d_filtrar,&
this.sle_1,&
this.dw_busca,&
this.gb_1}
end on

on w_busca_serv.destroy
destroy(this.dw_manuales)
destroy(this.st_serv)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.d_filtrar)
destroy(this.sle_1)
destroy(this.dw_busca)
destroy(this.gb_1)
end on

event open;st=message.powerobjectparm

if w_principal.dw_1.getitemstring(1,"sexo")='F' then l_sex_pa='2'
if w_principal.dw_1.getitemstring(1,"sexo")='M' then l_sex_pa='1'

dw_manuales.retrieve(st.emp,st.cont)
if dw_manuales.rowcount()<=0 then
	messagebox("Atención","No manuales definidos para este empresa y contrato")
	pb_cancel.triggerevent(clicked!)
	return -1
end If
int l_i, es_med=0,es_pro=0
for l_i=1 to dw_manuales.rowcount()
	if dw_manuales.getitemstring(l_i,'es_medica')='1' then
		 i_manual_med= i_manual_med+"'"+dw_manuales.getitemstring(l_i,'codmanual')+"',"
		 es_med++
	else
		i_manual_proc=i_manual_proc+"'"+dw_manuales.getitemstring(l_i,'codmanual')+"',"
		es_pro++
	end if
next
if es_med> 0 then 
	 i_manual_med=Mid(i_manual_med, 1,len(i_manual_med)-1)+')'
else
	 i_manual_med=" and tarifa_medica.CodManual like '%' "
end If
if es_pro> 0 then 
	 i_manual_proc=Mid(i_manual_proc, 1,len(i_manual_proc)-1)+')'
else
	 i_manual_proc="  AND tarifas.codmanual like '%' "
end If

	 
d_filtrar.text="Descripción"
rb_2.post event clicked()
if ls_pro=32 THEN	
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, i_mueve_kardex)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_CEXT", Regstring!, i_alm )
end If
if ls_pro=64 THEN	
	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, i_mueve_kardex)
	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_CEXT", Regstring!, i_alm )
end If
end event

type dw_manuales from datawindow within w_busca_serv
boolean visible = false
integer x = 55
integer y = 1220
integer width = 965
integer height = 128
integer taborder = 30
string title = "none"
string dataobject = "dw_manuales_contratacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_serv from statictext within w_busca_serv
integer x = 18
integer y = 1076
integer width = 3653
integer height = 120
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

type rb_3 from radiobutton within w_busca_serv
integer x = 1431
integer y = 36
integer width = 393
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medicamentos"
end type

event clicked;string original_select

if i_mueve_kardex='1' then
	dw_busca.dataobject="dw_busca_med_kard"
	dw_busca.settransobject(sqlca)
	original_select = "SELECT medicamentos.c_medica, medicamentos.codigo_unif, medicamentos.Medicamento, tarifa_medica.valor, Sum(SUM_KARDEX.saldoactual) AS disponible, sumarticulo.codarticulo, SUMARTICULO.FABRICANTE FROM  (((medicamentos INNER JOIN tarifa_medica ON medicamentos.c_medica = tarifa_medica.c_medica) INNER JOIN SUMGENERICO ON medicamentos.c_medica = SUMGENERICO.c_medica) INNER JOIN SUMARTICULO ON (SUMARTICULO.codArticulo = tarifa_medica.codarticulo) AND (SUMGENERICO.codgenerico = SUMARTICULO.codgenerico)) INNER JOIN SUM_KARDEX ON SUMARTICULO.codArticulo = SUM_KARDEX.CODARTICULO WHERE (((medicamentos.estado)='1') AND ((SUM_KARDEX.CODALMACEN)=:alm))"+i_manual_med+" GROUP BY medicamentos.c_medica, medicamentos.codigo_unif, medicamentos.Medicamento, tarifa_medica.valor, sumarticulo.codarticulo, SUMARTICULO.FABRICANTE"
	dw_busca.Modify('DataWindow.Table.Select="' +original_select  + '"')	
//	dw_busca.SetSQLSelect(original_select) 
//	dw_busca.retrieve(i_manual_med,i_alm)
	dw_busca.retrieve(i_alm, l_sex_pa)
else
	dw_busca.dataobject="dw_busca_med"
	dw_busca.settransobject(sqlca)
	original_select = dw_busca.GetSQLSelect() +i_manual_med
	dw_busca.Modify('DataWindow.Table.Select="' +original_select  + '"')	
//	dw_busca.retrieve(i_manual_med)
	dw_busca.retrieve( l_sex_pa)
end if

end event

type rb_2 from radiobutton within w_busca_serv
integer x = 288
integer y = 36
integer width = 206
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "CUPS"
boolean checked = true
end type

event clicked;dw_busca.dataobject="dw_cupxman"
dw_busca.settransobject(sqlca)
string original_select

original_select = dw_busca.GetSQLSelect() +i_manual_proc
dw_busca.Modify('DataWindow.Table.Select="' +original_select  + '"')	
dw_busca.retrieve(l_sex_pa)

end event

type rb_1 from radiobutton within w_busca_serv
integer x = 622
integer y = 36
integer width = 672
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos del Manual"
end type

event clicked;dw_busca.dataobject="dw_busca_serv"
dw_busca.settransobject(sqlca)
string original_select

original_select = dw_busca.GetSQLSelect() +i_manual_proc
dw_busca.Modify('DataWindow.Table.Select="' +original_select  + '"')	
dw_busca.retrieve(l_sex_pa)

end event

type st_3 from statictext within w_busca_serv
integer x = 891
integer y = 232
integer width = 1669
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Puede utilizar el caracter ~'%~' como comodín en cualquier parte de la cadena"
boolean focusrectangle = false
end type

type st_2 from statictext within w_busca_serv
integer x = 2693
integer y = 1216
integer width = 960
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

type pb_cancel from picturebutton within w_busca_serv
integer x = 1957
integer y = 1220
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_busca_serv
integer x = 1787
integer y = 1220
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_busca.triggerevent(doubleclicked!)
end event

type st_1 from statictext within w_busca_serv
integer x = 41
integer y = 144
integer width = 274
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por:"
boolean focusrectangle = false
end type

type d_filtrar from dropdownlistbox within w_busca_serv
integer x = 325
integer y = 132
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
string item[] = {"Código","Descripción","Articulo"}
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_busca_serv
event teclear pbm_keyup
integer x = 873
integer y = 136
integer width = 1929
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

type dw_busca from datawindow within w_busca_serv
integer x = 18
integer y = 300
integer width = 3666
integer height = 768
integer taborder = 10
string title = "none"
string dataobject = "dw_busca_med_kard"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow()<1 then return
//38 parametros ( p_codigo,p_desproc, p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta, p_estrato, p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
//  p_sec_cant_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat, p_clug_trat, p_item_trat,p_Articulo,p_tipo_fac)
string sexo,codta,estrato,autoriza,tipo='',desproc,l_codarticulo,l_tipo_fac,siras
long edad
l_tipo_fac=st.tipo_fac
if rb_2.checked then tipo='C'
if rb_3.checked then 
	tipo='M'
	if getitemnumber(getrow(),"disponible")=0 then 
		messagebox("Atención","No hay existencias de este producto en Bodega")
		return 
	end if
end if

edad=w_principal.dw_1.getitemnumber(1,'dias')
sexo=w_principal.dw_1.getitemstring(1,'sexo')
estrato=w_principal.dw_1.getitemstring(1,'estrato')
desproc=left(getitemstring(getrow(),"descripcion"),250)

choose case f_vent_padre(st.sle).classname()
	case 'w_factura'
		autoriza=w_factura.sle_autoriza.text
		codta=w_factura.dw_emppac.getitemstring(w_factura.dw_emppac.getrow(),'codta')
		w_factura.lf_cargar_a(getitemstring(getrow(),"codservicio"),desproc,1,tipo,'1',autoriza,st.emp,st.cont,0, &
		  '',tipdoc,docu,edad,sexo,codta,estrato,'','','',1,0, &
		  '',0,'','','',0,'',0,'',0,&
		  0,0,'',0,0,'',0,'','!',0,0,0,getitemstring(getrow(),"codarticulo"),l_tipo_fac,0,'','',0,'0',siras,'','','','')
	case 'w_rec_caja'
		autoriza=w_rec_caja.sle_autoriza.text
		codta=w_rec_caja.dw_emppac.getitemstring(w_rec_caja.dw_emppac.getrow(),'codta')
		w_rec_caja.lf_cargar_a(getitemstring(getrow(),"codservicio"),desproc,1,tipo,'1',autoriza,st.emp,st.cont,0, &
		  '',tipdoc,docu,edad,sexo,codta,estrato,'','','',1,0, &
		  '',0,'','','',0,'',0,'',0,&
		  0,0,'',0,0,'',0,'','!',0,0,0,getitemstring(getrow(),"codarticulo"),l_tipo_fac,0,'','',0,'0',siras,'','','','')
end choose
		
end event

event clicked;if dwo.type <> "text" then return
string cual,ojo,ss
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior=cual then
	if orden="A" then
		orden="D"
	else
		orden="A"
	end if
else
	orden="A"
end if
dw_busca.setsort(cual+" "+orden)
dw_busca.sort()
anterior=cual


end event

event retrieveend;st_2.text=string(rowcount)+' Registro(s)'
end event

event rowfocuschanged;if isnull(currentrow) or currentrow<1 then return
st_serv.text=this.getitemstring(currentrow,"descripcion")
end event

type gb_1 from groupbox within w_busca_serv
integer x = 37
integer width = 1897
integer height = 116
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar:"
end type

