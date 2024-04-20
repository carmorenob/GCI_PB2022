$PBExportHeader$w_meses.srw
forward
global type w_meses from w_center
end type
type dw_meses from datawindow within w_meses
end type
type dw_emp from datawindow within w_meses
end type
type pb_cierre from picturebutton within w_meses
end type
type st_1 from statictext within w_meses
end type
type pb_abre from picturebutton within w_meses
end type
type dw_nuevo from datawindow within w_meses
end type
type pb_nuevo from picturebutton within w_meses
end type
type b_1 from hprogressbar within w_meses
end type
type gb_1 from groupbox within w_meses
end type
end forward

global type w_meses from w_center
integer width = 1531
integer height = 1700
string title = "Periodos Contables"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_vigencia.ico"
boolean clientedge = true
boolean center = false
dw_meses dw_meses
dw_emp dw_emp
pb_cierre pb_cierre
st_1 st_1
pb_abre pb_abre
dw_nuevo dw_nuevo
pb_nuevo pb_nuevo
b_1 b_1
gb_1 gb_1
end type
global w_meses w_meses

type variables
string i_codemp=''
integer li_dec_gral
end variables

on w_meses.create
int iCurrent
call super::create
this.dw_meses=create dw_meses
this.dw_emp=create dw_emp
this.pb_cierre=create pb_cierre
this.st_1=create st_1
this.pb_abre=create pb_abre
this.dw_nuevo=create dw_nuevo
this.pb_nuevo=create pb_nuevo
this.b_1=create b_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_meses
this.Control[iCurrent+2]=this.dw_emp
this.Control[iCurrent+3]=this.pb_cierre
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.pb_abre
this.Control[iCurrent+6]=this.dw_nuevo
this.Control[iCurrent+7]=this.pb_nuevo
this.Control[iCurrent+8]=this.b_1
this.Control[iCurrent+9]=this.gb_1
end on

on w_meses.destroy
call super::destroy
destroy(this.dw_meses)
destroy(this.dw_emp)
destroy(this.pb_cierre)
destroy(this.st_1)
destroy(this.pb_abre)
destroy(this.dw_nuevo)
destroy(this.pb_nuevo)
destroy(this.b_1)
destroy(this.gb_1)
end on

event resize;call super::resize;resize(1504,1700)
end event

event open;call super::open;SELECT ENTERO into :li_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=32));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 32')
	return 
end if
end event

type pb_grabar from w_center`pb_grabar within w_meses
integer x = 754
integer y = 1312
integer textsize = -8
integer weight = 700
string facename = "Tahoma"
boolean enabled = false
string powertiptext = "Guardar Periodo [Alt+G]"
end type

event pb_grabar::clicked;call super::clicked;int ano,mes,anoant,mesant
ano=dw_nuevo.getitemnumber(1,"ano")
mes=dw_nuevo.getitemnumber(1,"mes")
b_1.position=5
dw_meses.insertrow(1)
dw_meses.setitem(1,"cod_empresa",i_codemp)
dw_meses.setitem(1,"ano",ano)
dw_meses.setitem(1,"mes",mes)
if dw_meses.update(true,false)=-1 then
	b_1.position=0
	rollback;
	return
end if
if mes=1 and dw_meses.rowcount()>1 then
	anoant=ano -1
	if g_motor='postgres' then
		string l_envio
		select * into  :l_envio  from sp_comienza_cont(:i_codemp, :anoant,: li_dec_gral);
	else
		DECLARE sp PROCEDURE FOR  sp_comienza_cont @emp = :i_codemp, @anyo = :anoant , @deci=:li_dec_gral;
		execute sp;
	end if
	if sqlca.sqlcode=-1 then
		messagebox('Error ejecutando sp_comienza_cont',sqlca.sqlerrtext)
	end if
//	b_1.position=10
//	mesant=dw_meses.getitemnumber(2,"mes")
//	anoant=dw_meses.getitemnumber(2,"ano")
//	INSERT INTO cont_saldos ( 
//		COD_EMPRESA, ano, mes, cod_general, Cuenta, tipodoc, nit, Dverificacion, CUFuncional, ccosto, 
//		saldodebito, saldocredito, Debito, Credito, cierredebito, cierrecredito ,saldocorriente,
//		saldonocorriente,cierrecorriente,cierrenocorriente,clugar)
//	SELECT 
//		CONT_SALDOS.COD_EMPRESA, :ano as ano, :mes as mes, CONT_SALDOS.cod_general, CONT_SALDOS.Cuenta, 
//		CONT_SALDOS.tipodoc, CONT_SALDOS.nit, CONT_SALDOS.Dverificacion, CONT_SALDOS.CUFuncional, 
//		CONT_SALDOS.ccosto, CONT_SALDOS.cierredebito AS salddeb, CONT_SALDOS.cierrecredito AS salcred, 
//		0 AS deb, 0 AS cred, CONT_SALDOS.cierredebito AS ciedeb, CONT_SALDOS.cierrecredito AS ciecred,
//		CONT_SALDOS.cierrecorriente as saldcorr,CONT_SALDOS.cierrenocorriente as saldnocorr,
//		CONT_SALDOS.cierrecorriente as cie_corr,CONT_SALDOS.cierrenocorriente as cie_nocorr,
//		CONT_SALDOS.clugar
//	FROM CONT_SALDOS
//	WHERE CONT_SALDOS.COD_EMPRESA=:i_codemp AND CONT_SALDOS.ano=:anoant AND CONT_SALDOS.mes=:mesant ;
//	b_1.position=30
//	if sqlca.sqlcode=-1 then 
//		messagebox("Error creando los nuevos saldos iniciales",sqlca.sqlerrtext)
//		rollback;
//		b_1.position=0
//		return
//	end if
end if
b_1.position=80
commit;
dw_meses.resetupdate()
b_1.position=100
dw_emp.triggerevent(itemchanged!)
dw_nuevo.reset()
enabled=false
pb_nuevo.enabled=true
b_1.position=0
end event

type dw_meses from datawindow within w_meses
integer x = 37
integer y = 236
integer width = 1166
integer height = 904
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cierres"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_emp from datawindow within w_meses
integer x = 37
integer y = 24
integer width = 1147
integer height = 148
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event itemchanged;call super::itemchanged;
string actual
actual=this.getitemstring(1,1)
choose case f_pregunta()
	case 1
		if grabar()=-1 then 
			this.setitem(1,1,actual)
			return 1
		end if
	case 2
		cambio=false
	case 3
		this.setitem(1,1,actual)
		return 1
end choose
this.accepttext()
i_codemp=this.getitemstring(1,1)
dw_meses.retrieve(i_codemp)

end event

event constructor;dw_emp.settransobject(SQLCA)
dw_emp.insertrow(1)
end event

type pb_cierre from picturebutton within w_meses
event mousemove pbm_mousemove
integer x = 1221
integer y = 248
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                &c"
boolean originalsize = true
string picturename = "cerrar.GIF"
string disabledname = "d_cerrar.GIF"
string powertiptext = "Cerrar Mes [Alt+C]"
end type

event clicked;long fila,j,hasta
string Mensaje
fila=dw_meses.getrow()
if fila<1 then return
if dw_meses.getitemstring(fila,"estado")='1' then return
mensaje="Está seguro que desea cerrar este mes"
b_1.position=5
if fila= dw_meses.rowcount() then 
	hasta = fila
else
	hasta=0
	for j=fila +1 to dw_meses.rowcount()
		if dw_meses.getitemstring(j,"estado")='1' then
			hasta=j -1
			exit
		end if
	next
	if hasta=0 then hasta=dw_meses.rowcount()
end if
b_1.position=10
if fila<>hasta then mensaje+=" y los anteriores a él"
if messagebox("Atención",mensaje+" ?",question!,yesno!,2)=2 then 
	b_1.position=0
	return
end if
int ano,mes
long cuantos
for j=fila to hasta
	ano=dw_meses.getitemnumber(j,"ano")
	mes=dw_meses.getitemnumber(j,"mes")
	cuantos=0
	select count(*) into :cuantos from cont_doc_cab where cod_empresa=:i_codemp and ano=:ano and mes=:mes and (estado='0' or estado is null);
	if cuantos>0 then
		if messagebox("Atención","En el mes "+string(mes)+" hay documentos no aprobados, desea continuar aún así ?",question!,yesno!,2)=2 then
			b_1.position=0
			return
		end if
	end if
next
for j=fila to hasta
	b_1.position= 10 + ( ((j - fila) * 90)/(hasta - fila +1) )
	dw_meses.setitem(j,"estado",'1')
next
if dw_meses.update()=-1 then
	rollback;
	b_1.position=0
	return
end if
b_1.position=100
commit;
b_1.position=0
end event

type st_1 from statictext within w_meses
integer x = 41
integer y = 180
integer width = 448
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Periodos Contables:"
boolean focusrectangle = false
end type

type pb_abre from picturebutton within w_meses
event mousemove pbm_mousemove
integer x = 1221
integer y = 432
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                &a"
boolean originalsize = true
string picturename = "abrir2.GIF"
string disabledname = "d_abrir2.GIF"
string powertiptext = "Abrir Mes [Alt+A]"
end type

event clicked;long fila,j
string Mensaje
fila=dw_meses.getrow()
if fila<1 then return
if dw_meses.getitemstring(fila,"estado")='0' then return
mensaje="Está seguro que desea abrir este mes"
if fila>1 then mensaje+=" y los posteriores a él"
if messagebox("Atención",mensaje+" ?",question!,yesno!,2)=2 then return
b_1.position=10
for j=1 to fila
	b_1.position= 10 + (J * 90)/fila
	if dw_meses.getitemstring(j,"estado")='1' then
		dw_meses.setitem(j,"estado",'0')
	end if
next
if dw_meses.update()=-1 then
	rollback;
	b_1.position= 0
	return
end if
b_1.position= 100
commit;
b_1.position=0
end event

type dw_nuevo from datawindow within w_meses
integer x = 183
integer y = 1300
integer width = 475
integer height = 176
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_doc_cab"
boolean border = false
boolean livescroll = true
end type

event constructor;this.modify("fecha.protect=1")

end event

type pb_nuevo from picturebutton within w_meses
event mousemove pbm_mousemove
integer x = 1221
integer y = 620
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "               &n"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
string powertiptext = "Nuevo Periodo [Alt+N]"
end type

event clicked;if i_codemp='' then return
int smes,sano
string cerrado
if dw_meses.rowcount()>0 then
	smes=dw_meses.getitemnumber(1,"mes")
	sano=dw_meses.getitemnumber(1,"ano")
	if smes=13 then 
		select cierre_anyo into :cerrado from cont_cierre where cod_empresa=:i_codemp and ano=:sano and mes=12;
		if sqlca.sqlcode=-1 then
			messagebox('Error leyendo cont_cierre',sqlca.sqlerrtext)
			return
		end if
		if cerrado='0' or isnull(cerrado) then
			messagebox('Atención','No se ha cerrado el año debe cerrarlo primero para continuar')
			return
		end if
		smes=1
		sano=sano+1
	else
		smes=smes+1
	end if
else
	sano=year(today())
	smes=month(today())
end if
dw_nuevo.insertrow(1)
dw_nuevo.setitem(1,"ano",sano)
dw_nuevo.setitem(1,"mes",smes)
if dw_meses.rowcount()>0 then dw_nuevo.enabled=false
enabled=false
pb_grabar.enabled=true
end event

type b_1 from hprogressbar within w_meses
integer x = 55
integer y = 1172
integer width = 983
integer height = 52
boolean bringtotop = true
unsignedinteger maxposition = 100
integer setstep = 10
end type

type gb_1 from groupbox within w_meses
integer x = 46
integer y = 1248
integer width = 983
integer height = 248
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nuevo Periodo"
end type

