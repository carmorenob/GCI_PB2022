$PBExportHeader$w_pre_escoge_radica.srw
forward
global type w_pre_escoge_radica from window
end type
type pb_traer from picturebutton within w_pre_escoge_radica
end type
type st_8 from statictext within w_pre_escoge_radica
end type
type st_7 from statictext within w_pre_escoge_radica
end type
type em_1 from editmask within w_pre_escoge_radica
end type
type em_2 from editmask within w_pre_escoge_radica
end type
type pb_ok from picturebutton within w_pre_escoge_radica
end type
type dw_1 from datawindow within w_pre_escoge_radica
end type
type gb_6 from groupbox within w_pre_escoge_radica
end type
end forward

global type w_pre_escoge_radica from window
integer width = 4503
integer height = 1884
boolean titlebar = true
string title = "Escoger Cuentas de Cartera"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_traer pb_traer
st_8 st_8
st_7 st_7
em_1 em_1
em_2 em_2
pb_ok pb_ok
dw_1 dw_1
gb_6 gb_6
end type
global w_pre_escoge_radica w_pre_escoge_radica

type variables
st_interfaz i_st
int i_dec_gral,i_aprox_gral
string l_ppto
end variables

on w_pre_escoge_radica.create
this.pb_traer=create pb_traer
this.st_8=create st_8
this.st_7=create st_7
this.em_1=create em_1
this.em_2=create em_2
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.gb_6=create gb_6
this.Control[]={this.pb_traer,&
this.st_8,&
this.st_7,&
this.em_1,&
this.em_2,&
this.pb_ok,&
this.dw_1,&
this.gb_6}
end on

on w_pre_escoge_radica.destroy
destroy(this.pb_traer)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.pb_ok)
destroy(this.dw_1)
destroy(this.gb_6)
end on

event open;i_st=message.powerobjectparm

//string ojo
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

SELECT cadena into :l_ppto
FROM parametros_gen
WHERE (((codigo_para)=76));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 76')
	return 
end if

if i_aprox_gral=0 then i_aprox_gral=1

if l_ppto='0' then
	if g_motor='postgres' then
		dw_1.dataobject='dw_it_recon_recon_postgres'
	else
		dw_1.dataobject='dw_it_recon_recon'
	end if
else
	if g_motor='postgres' then
		dw_1.dataobject='dw_it_recon_recon_contrato_postgres'
	else
		dw_1.dataobject='dw_it_recon_recon_contrato'
	end if
	
end if
dw_1.settransobject(sqlca)

end event

type pb_traer from picturebutton within w_pre_escoge_radica
integer x = 878
integer y = 60
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                 &t"
boolean originalsize = true
string picturename = "refrescar.GIF"
string disabledname = "d_refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Traer Registros [Alt+T]"
end type

event clicked;datetime fecha1,fecha2

fecha1=datetime(date(em_1.text))
fecha2=datetime(date(em_2.text))
dw_1.retrieve(fecha1,fecha2)
if dw_1.rowcount()>0 then
	pb_ok.enabled=true
end if
end event

type st_8 from statictext within w_pre_escoge_radica
integer x = 457
integer y = 160
integer width = 105
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin"
boolean focusrectangle = false
end type

type st_7 from statictext within w_pre_escoge_radica
integer x = 59
integer y = 160
integer width = 155
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio"
boolean focusrectangle = false
end type

type em_1 from editmask within w_pre_escoge_radica
integer x = 46
integer y = 76
integer width = 384
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "01/01/2000~~31/12/2020"
end type

event constructor;this.text="01/"+string(today(),"mm/yyyy")
end event

type em_2 from editmask within w_pre_escoge_radica
integer x = 443
integer y = 76
integer width = 384
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "01/01/2000~~31/12/2020"
end type

event constructor;if isdate("31/"+string(today(),"mm/yyyy")) then
	this.text="31/"+string(today(),"mm/yyyy")
else
	if isdate("30/"+string(today(),"mm/yyyy")) then
		this.text="30/"+string(today(),"mm/yyyy")
	else
		if isdate("29/"+string(today(),"mm/yyyy")) then
			this.text="29/"+string(today(),"mm/yyyy")
		else
			this.text="28/"+string(today(),"mm/yyyy")
		end if
	end if
end if

end event

type pb_ok from picturebutton within w_pre_escoge_radica
integer x = 2181
integer y = 1624
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
if dw_1.getitemnumber(1,'total')=0 then return
if dw_1.find('isnull(cod_total_recon) and selec=1',1,dw_1.rowcount())>0 then
	messagebox('Atención','Hay codigos presupuestales en nulo, no puede continuar')
	return
end if
long j,k,n2
do while i_st.dw_it.RowCount() > 0
	i_st.dw_it.DeleteRow(1)
loop
do while i_st.dw_obj.RowCount() > 0
	i_st.dw_obj.DeleteRow(1)
loop
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
	i_st.dw_obj.setitem(k,'monto',valor)
	
	valor=round(i_st.dw_obj.getitemnumber(k,'monto_vigente')+dw_1.getitemnumber(j,'valor'),i_dec_gral)
	if i_dec_gral=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	i_st.dw_obj.setitem(k,'monto_vigente',valor)
	i_st.dw_obj.setitem(k,'estado','1')
	n2=k
	k=i_st.dw_it.find('num_orig1='+string(dw_1.getitemnumber(j,'num_cobro'))+" and char_orig2='"+dw_1.getitemstring(j,'clugar')+"'",1,i_st.dw_it.rowcount())
	if k=0 then k=i_st.dw_it.insertrow(0)

	i_st.dw_it.setitem(k,'codigo','PRCCXCPI')
	i_st.dw_it.setitem(k,'char_orig1','CXC')
	i_st.dw_it.setitem(k,'char_orig2',dw_1.getitemstring(j,'clugar'))
	i_st.dw_it.setitem(k,'num_orig1',dw_1.getitemnumber(j,'num_cobro'))
	i_st.dw_it.setitem(k,'char_doc1',i_st.coddoc)
	i_st.dw_it.setitem(k,'char_doc2',clugar)
	i_st.dw_it.setitem(k,'num_doc2',n2)
	valor=round(i_st.dw_it.getitemnumber(k,'valor')+dw_1.getitemnumber(j,'valor'),i_dec_gral)
	if i_dec_gral=0 then
		valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
	end if
	i_st.dw_it.setitem(k,'valor',valor)
next
i_st.dw_obj.setrow(i_st.dw_obj.rowcount())
close(parent)
end event

type dw_1 from datawindow within w_pre_escoge_radica
integer y = 240
integer width = 4462
integer height = 1344
integer taborder = 30
string title = "none"
string dataobject = "dw_it_recon_recon_contrato_postgres"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long nd,sel,i
sel=long(data)
nd = GetItemNumber(GetRow(),'num_cobro')
for i = 1 to rowCount()
	if GetItemNumber(i,'num_cobro') = nd then
		SetItem(i,'selec',sel)
	end if
next
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
	for i = 1 to rowCount()
		SetItem(i,'selec',1)
	next
	Modify("b_1.Text='Desel.'")
else
	for i = 1 to rowCount()
		SetItem(i,'selec',0)
	next
	Modify("b_1.Text='Selec.'")
end if



end event

event constructor;//settransobject(sqlca)
//retrieve()
end event

type gb_6 from groupbox within w_pre_escoge_radica
integer x = 27
integer y = 20
integer width = 818
integer height = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango de Fechas a Buscar:"
borderstyle borderstyle = styleraised!
end type

