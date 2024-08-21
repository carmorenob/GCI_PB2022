$PBExportHeader$w_estacion_enf.srw
forward
global type w_estacion_enf from window
end type
type pb_2 from picturebutton within w_estacion_enf
end type
type pb_devolucion from picturebutton within w_estacion_enf
end type
type pb_orden from picturebutton within w_estacion_enf
end type
type t1 from tab within w_estacion_enf
end type
type pt from userobject within t1
end type
type uo_1 from uo_hclin within pt
end type
type pt from userobject within t1
uo_1 uo_1
end type
type pm from userobject within t1
end type
type pb_4 from picturebutton within pm
end type
type pb_3 from pb_report within pm
end type
type dw_o from datawindow within pm
end type
type st_med from statictext within pm
end type
type cb_4 from commandbutton within pm
end type
type cb_3 from commandbutton within pm
end type
type pb_anula from picturebutton within pm
end type
type cbx_1 from checkbox within pm
end type
type st_3 from statictext within pm
end type
type st_prog from statictext within pm
end type
type cb_guarda from picturebutton within pm
end type
type st_2 from statictext within pm
end type
type dp_1 from datepicker within pm
end type
type st_1 from statictext within pm
end type
type cb_2 from picturebutton within pm
end type
type cb_1 from picturebutton within pm
end type
type pb_1 from picturebutton within pm
end type
type dw_5 from datawindow within pm
end type
type dw_os from datawindow within pm
end type
type dw_ctr from datawindow within pm
end type
type pm from userobject within t1
pb_4 pb_4
pb_3 pb_3
dw_o dw_o
st_med st_med
cb_4 cb_4
cb_3 cb_3
pb_anula pb_anula
cbx_1 cbx_1
st_3 st_3
st_prog st_prog
cb_guarda cb_guarda
st_2 st_2
dp_1 dp_1
st_1 st_1
cb_2 cb_2
cb_1 cb_1
pb_1 pb_1
dw_5 dw_5
dw_os dw_os
dw_ctr dw_ctr
end type
type t1 from tab within w_estacion_enf
pt pt
pm pm
end type
type dw_rias from datawindow within w_estacion_enf
end type
end forward

global type w_estacion_enf from window
integer width = 6126
integer height = 2636
boolean titlebar = true
string title = "Estación de Enfermería"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "enfermera.ico"
boolean center = true
pb_2 pb_2
pb_devolucion pb_devolucion
pb_orden pb_orden
t1 t1
dw_rias dw_rias
end type
global w_estacion_enf w_estacion_enf

type variables
long colini, filaini, pres, dia, col_ant, fila_ant, ffin, cfin, i_hora, dia_sel,orden_new
boolean cambio,i_cambiar=true
st_ordenes st_p
datetime desde,hasta,inimes,finmes
m_turnos m_t
uo_dataStore dw_t
uo_ctr_liqs uo_liq
string c_medica, i_edita='',i_cambia_histo
string  usu_enfer,conteo,i_est_hadm_p,i_nautoriza
datawindowchild dwc_orden


end variables

forward prototypes
public function integer suministrar (integer p_dia, integer p_hora)
end prototypes

public function integer suministrar (integer p_dia, integer p_hora);long fila, donde, fs, sums, nserv,l_fila

if t1.pm.dw_5.GetItemString(p_hora+1,'dia'+string(p_dia)) = c_medica and t1.pm.dw_5.GetItemNumber(p_hora+1,'cp'+string(p_dia)) = 0 then
	fila = t1.pm.dw_ctr.Find("prog="+string(t1.pm.dw_5.GetItemNumber(p_hora+1,'cc'+string(p_dia))),1,t1.pm.dw_ctr.RowCount())
	fs = t1.pm.dw_os.GetRow()
	if fila > 0 then
		if t1.pm.dw_ctr.getitemdatetime(fila,'fecha')> datetime(today(),now()) then
			Return -1
		end if
		if MessageBox('Atención','Está seguro de suministrar el medicamento?',QUESTION!,YESNO!) = 2 then Return 0
		if (t1.pm.dw_os.GetItemNumber(fs,"entregada") -   t1.pm.dw_os.GetItemNumber(fs,"devuelta") )< t1.pm.dw_os.GetItemNumber(fs,'suministrada') + 1  then
			MessageBox('Atención','No se puede suministrar mas de lo entregado en farmacia')
			Return -1
		end if
		if dw_rias.RowCount() > 0 then
			if dw_rias.GetItemNumber(dw_rias.GetRow(),"cantidad") >= t1.pm.dw_os.GetItemNumber(fs,'solicitada')  then
				MessageBox('Atención','No se puede suministrar mas de lo solicitado')
				Return -1
			end if
		end if
		st_lotes st_art
		st_art.contador_os=t1.pm.dw_os.getItemNumber(fs,"contador")
		st_art.clugar_os=t1.pm.dw_os.getItemString(fs,"clugar")
		st_art.nsolicitud_os=t1.pm.dw_os.getItemNumber(fs,"nsolicitud")
		st_art.item_os=t1.pm.dw_os.getitemNumber(fs,"item")
		st_art.prog_os=t1.pm.dw_ctr.getitemNumber(fila,"prog")
		st_art.cant=t1.pm.dw_ctr.getitemNumber(fila,"dosis")
		st_art.alm=t1.pm.dw_os.getitemstring(fs,"rips")
		st_art.cdoc=st_p.cprof
		st_art.clug=st_p.cesp
		st_art.dw_lote_mov=dw_rias
		st_art.cmedica=t1.pm.dw_os.getitemstring(fs,"c_medica")
		st_art.autoriza=i_nautoriza
		st_art.usu=st_p.usu
		int l_sumi
		select suministrado into :l_sumi
		from enf_ctr_medica
		where (((contador)=:st_art.contador_os) and ((clugar)=:st_art.clugar_os) and ((nsolicitud)=:st_art.nsolicitud_os) and ((item)=:st_art.item_os) and (prog=:st_art.prog_os));
		if l_sumi=1 then
			MessageBox('Atención','Dosis ya suministrada en otra estación')
			Return -1
		end if	
		openwithparm(w_escoge_articulo_enf,st_art)
		st_art= message.powerobjectparm
		if isnull(st_art.cmedica) or st_art.cmedica='-1' then
		 	return -1
		end if
		t1.pm.dw_5.SetItem(p_hora+1,'cp'+string(p_dia),1)
		t1.pm.dw_ctr.SetItem(fila,'suministrado','1')
		t1.pm.dw_ctr.setitem(fila,'codarticulo',st_art.cmedica)
		t1.pm.dw_ctr.setitem(fila,'contador_si',st_art.contador_os)
		t1.pm.dw_ctr.setitem(fila,'clugar_si',st_art.clugar_os)
		t1.pm.dw_ctr.setitem(fila,'nservicio_si',st_art.nserv)
		sums = long(t1.pm.dw_ctr.Describe("Evaluate('sum(if(estado=~~'1~~' and suministrado=~~'1~~' and codarticulo=~~'"+st_art.cmedica+"~~',dosis,0))',0)"))
		if dw_rias.Update(TRUE,FALSE) = -1 then
			t1.pm.dw_os.TriggerEvent(rowFocusChanged!)
			Return -1
		end if
		if t1.pm.dw_ctr.Update(TRUE,FALSE) = -1 then
			t1.pm.dw_os.TriggerEvent(rowFocusChanged!)
			Return -1
		end if
		sums= t1.pm.dw_ctr.GetItemNumber(1,"tdosis")
		t1.pm.dw_os.SetItem(t1.pm.dw_os.GetRow(),'suministrada',sums)
		if t1.pm.dw_os.GetItemNumber(fs,"entregada") - sums = 0  then
			t1.pm.dw_os.SetItem(t1.pm.dw_os.GetRow(),'estado','2')
		end if
		if t1.pm.dw_os.Update(TRUE,FALSE) = -1 then
			t1.pm.dw_os.Reset()
			t1.pm.dw_os.Retrieve(st_p.contador,st_p.clugar,st_p.norden)
			Return -1
		end if
		t1.pm.dw_ctr.ResetUpdate()
		dw_rias.ResetUpdate()
		t1.pm.dw_os.ResetUpdate()
		commit;
	end if
end if
Return 0

end function

on w_estacion_enf.create
this.pb_2=create pb_2
this.pb_devolucion=create pb_devolucion
this.pb_orden=create pb_orden
this.t1=create t1
this.dw_rias=create dw_rias
this.Control[]={this.pb_2,&
this.pb_devolucion,&
this.pb_orden,&
this.t1,&
this.dw_rias}
end on

on w_estacion_enf.destroy
destroy(this.pb_2)
destroy(this.pb_devolucion)
destroy(this.pb_orden)
destroy(this.t1)
destroy(this.dw_rias)
end on

event open;st_p = Message.PowerObjectParm
long i

title='Nota Enfermería para: -- '+upper(w_principal.dw_1.getitemstring(1,'nombre'))+' --'
m_t = Create m_turnos
dw_t = Create uo_datastore
dw_t.DataObject = 'dw_frecuencia'
dw_t.SetTransObject(SQLCA)
dw_t.Retrieve()
for i =  1 to dw_t.RowCount()
	m_t.Item[i+2].visible = true
	m_t.Item[i+2].toolbaritemvisible = true
	m_t.Item[i+2].enabled = true
	m_t.Item[i+2].text = wordcap(dw_t.GetItemString(i,'descripcion'))
	m_t.Item[i+2].Tag = string(dw_t.GetItemNumber(i,'horas'))
	m_t.Item[i+2].toolbaritemtext=wordcap(dw_t.GetItemString(i,'descripcion'))
	if i = 10 then EXIT
next

select estado,autoriza into :i_est_hadm_p,:i_nautoriza from hospadmi where contador=:st_p.contador and clugar_his=:st_p.clugar;
if i_est_hadm_p<>'1' then i_cambiar=false
dwc_orden.Retrieve(st_p.contador,st_p.clugar)
t1.pm.dw_o.InsertRow(0)
t1.pm.dw_os.Retrieve(st_p.contador,st_p.clugar,st_p.norden)
t1.pm.dp_1.SetValue(today(),now())
t1.pm.dp_1.TriggerEvent('ValueChanged')

t1.pt.uo_1.retrieve(st_p.contador, st_p.clugar,'F','T','I',st_p.cesp,'','',st_p.cprof,0,'','','')
t1.pt.uo_1.tamanyo(t1.pt.width - 70, t1.pt.height - 70)

t1.OpenTab(uo_liq,'uo_ctr_liqs',3)
uo_liq.Resize(t1.width,t1.height)
uo_liq.Text = 'Control de Líquidos'
uo_liq.picturename='crt_liq.ico'
uo_liq.st_p = st_p
uo_liq.dw_p.triggerevent(retrieveend!)

//agrege para controlar que la programacion no la han sino las jefes
usu_enfer=st_p.cprof 
select auxenf into :conteo from profe where usuario=:usu_enfer
and enfermero ='1';
if conteo = '1' or isnull(conteo) then
	t1.pm.cb_guarda.enabled=false
else
	t1.pm.cb_guarda.enabled=true	
End if
select evoluciona into :conteo from profe where usuario=:usu_enfer and enfermero ='0';
if conteo = '1' or isnull(conteo) then
	t1.pt.enabled=false
	t1.pm.enabled=false
	uo_liq.cb_guarda.enabled=false
	t1.post selecttab(3) 
else
	t1.pt.enabled=true	
	t1.pm.enabled=true
	uo_liq.cb_guarda.enabled=true
	t1.post selecttab(1) 
End if

end event

type pb_2 from picturebutton within w_estacion_enf
integer x = 4101
integer y = 8
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print.GIF"
string disabledname = "d_print.GIF"
alignment htextalign = left!
string powertiptext = "Imprimir Datos Enfermería"
end type

event clicked;if f_vent_Padre(this).event closequery()=1 then return
trae historial
historial.numero = st_p.contador
historial.lugar = st_p.clugar
historial.tingres = 'F'

openwithparm(w_print_histor_txt,historial)

end event

type pb_devolucion from picturebutton within w_estacion_enf
integer x = 3941
integer y = 8
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "dev_med.jpg"
string disabledname = "d?dev_med.jpg"
alignment htextalign = left!
string powertiptext = "Ir a Devolución"
end type

event clicked;m_principal.m_3.m_3_7.m_devoluciónmedicamentos.event clicked()
if message.stringparm<>'ok' then return
close(parent)

end event

type pb_orden from picturebutton within w_estacion_enf
integer x = 3776
integer y = 8
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "orden_med.gif"
string disabledname = "d_orden_med.gif"
alignment htextalign = left!
string powertiptext = "Ver Ordenes Medicas"
end type

event clicked;if tag='1' then
	if f_permiso_boton(this,'ESEF')=0 then return
end if
trae st
st.numero=st_p.contador
st.lugar=st_p.clugar
openwithparm(w_solicita,st)
end event

type t1 from tab within w_estacion_enf
integer y = 60
integer width = 6062
integer height = 2448
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
pt pt
pm pm
end type

on t1.create
this.pt=create pt
this.pm=create pm
this.Control[]={this.pt,&
this.pm}
end on

on t1.destroy
destroy(this.pt)
destroy(this.pm)
end on

type pt from userobject within t1
integer x = 18
integer y = 112
integer width = 6025
integer height = 2320
long backcolor = 67108864
string text = "Notas"
long tabtextcolor = 33554432
string picturename = "Nota_enf.ico"
long picturemaskcolor = 536870912
uo_1 uo_1
end type

on pt.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on pt.destroy
destroy(this.uo_1)
end on

type uo_1 from uo_hclin within pt
integer x = 27
integer width = 0
integer height = 2252
integer taborder = 50
boolean bringtotop = true
boolean enabled = true
long backcolor = 0
string text = ""
long tabtextcolor = 0
long picturemaskcolor = 0
string i_ing_sal = ""
end type

on uo_1.destroy
call uo_hclin::destroy
end on

type pm from userobject within t1
integer x = 18
integer y = 112
integer width = 6025
integer height = 2320
long backcolor = 67108864
string text = "Control de Medicamentos"
long tabtextcolor = 33554432
string picturename = "med_enf.ico"
long picturemaskcolor = 536870912
pb_4 pb_4
pb_3 pb_3
dw_o dw_o
st_med st_med
cb_4 cb_4
cb_3 cb_3
pb_anula pb_anula
cbx_1 cbx_1
st_3 st_3
st_prog st_prog
cb_guarda cb_guarda
st_2 st_2
dp_1 dp_1
st_1 st_1
cb_2 cb_2
cb_1 cb_1
pb_1 pb_1
dw_5 dw_5
dw_os dw_os
dw_ctr dw_ctr
end type

on pm.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.dw_o=create dw_o
this.st_med=create st_med
this.cb_4=create cb_4
this.cb_3=create cb_3
this.pb_anula=create pb_anula
this.cbx_1=create cbx_1
this.st_3=create st_3
this.st_prog=create st_prog
this.cb_guarda=create cb_guarda
this.st_2=create st_2
this.dp_1=create dp_1
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.pb_1=create pb_1
this.dw_5=create dw_5
this.dw_os=create dw_os
this.dw_ctr=create dw_ctr
this.Control[]={this.pb_4,&
this.pb_3,&
this.dw_o,&
this.st_med,&
this.cb_4,&
this.cb_3,&
this.pb_anula,&
this.cbx_1,&
this.st_3,&
this.st_prog,&
this.cb_guarda,&
this.st_2,&
this.dp_1,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.pb_1,&
this.dw_5,&
this.dw_os,&
this.dw_ctr}
end on

on pm.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.dw_o)
destroy(this.st_med)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.pb_anula)
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.st_prog)
destroy(this.cb_guarda)
destroy(this.st_2)
destroy(this.dp_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.pb_1)
destroy(this.dw_5)
destroy(this.dw_os)
destroy(this.dw_ctr)
end on

type pb_4 from picturebutton within pm
string tag = "Atender Selecionados"
integer x = 192
integer y = 2100
integer width = 146
integer height = 128
integer taborder = 19
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "jeringa.gif"
string disabledname = "d_jeringa.gif"
end type

event clicked;long l_hora,l_j
string ret

for l_j=1 to t1.pm. dw_ctr.rowcount()
	if t1.pm. dw_ctr.getitemnumber(l_j,'sel')=1 then
		if t1.pm.dw_ctr.getitemdatetime(l_j,'fecha')> datetime(today(),now()) then
			Return -1
		end if
		if  t1.pm. dw_ctr.GetItemDateTime(l_j,'fecha') < desde or  t1.pm. dw_ctr.GetItemDateTime(l_j,'fecha') > hasta then
			t1.pm.dp_1.SetValue( t1.pm. dw_ctr.GetItemDateTime(l_j,'fecha'))
		end if
		dia_sel = f_dianumero(date( t1.pm. dw_ctr.GetItemDateTime(l_j,'fecha')))
		l_hora = hour(time( t1.pm. dw_ctr.GetItemDateTime(l_j,'fecha')))
		suministrar(dia_sel ,l_hora)
		t1.pm. dw_ctr.setitem(l_j,'sel',0)
	end if
next
t1.pm.dw_o.triggerevent(itemchanged!)
end event

type pb_3 from pb_report within pm
integer x = 5829
integer y = 676
integer taborder = 20
string powertiptext = "Imprimir Medicamentos  Suministrados[Alt+P]"
string cod_rep = "CTME"
string nombre_rep = "Control Medicamentos"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[2]
par[1]= dw_os.getItemNumber(1,'contador')
par[2]= dw_os.getitemString(1,'clugar')
imprimir(par,'','0')



end event

type dw_o from datawindow within pm
integer x = 37
integer y = 20
integer width = 905
integer height = 76
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_orden"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
GetChild('norden',dwc_orden)
dwc_orden.SetTransObject(SQLCA)
//dwc_orden.SetFilter("estado='1' or estado='4'")

end event

event itemchanged;AcceptText()
t1.pm.dw_os.Retrieve(st_p.contador,st_p.clugar,getItemNumber(1,1))
setnull(orden_new)
orden_new=getItemNumber(1,1)
t1.pm.dp_1.SetValue(today(),now())
t1.pm.dw_os.TriggerEvent('rowfocuschanged')
t1.pm.dp_1.TriggerEvent('ValueChanged')


end event

type st_med from statictext within pm
integer x = 146
integer y = 1620
integer width = 1413
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within pm
integer x = 4763
integer y = 44
integer width = 411
integer height = 76
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Semana Posterior"
end type

event clicked;date fecha
time hora
dp_1.GetValue(fecha,hora)
t1.pm.dp_1.SetValue(RelativeDate(fecha,7),now())
t1.pm.dp_1.TriggerEvent('ValueChanged')

end event

type cb_3 from commandbutton within pm
integer x = 3858
integer y = 44
integer width = 411
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Semana Anterior"
end type

event clicked;date fecha
time hora
dp_1.GetValue(fecha,hora)
t1.pm.dp_1.SetValue(RelativeDate(fecha,-7),now())
t1.pm.dp_1.TriggerEvent('ValueChanged')

end event

type pb_anula from picturebutton within pm
event mousemove pbm_mousemove
integer x = 37
integer y = 2100
integer width = 146
integer height = 128
integer taborder = 9
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
string powertiptext = "Anular"
end type

event clicked;if dw_ctr.RowCount() = 0 then Return 0
string estado,clu
long sums,nser,cont,sum_a
if dw_ctr.GetItemString(dw_ctr.GetRow(),'estado') = '2' then
	MessageBox('Atención','Registro ya anulado')
	Return 0
end if
if dw_ctr.GetItemString(dw_ctr.GetRow(),'suministrado') = '1'  then
	if dw_rias.RowCount() = 0 then
		MessageBox('Atención','No hay registro en ServiciosIngreso para retirar')
		return 0
	end if
	estado = dw_rias.GetItemString(dw_rias.GetRow(),'hospadmi_estado')
	if  estado = '2' or estado = '3' or estado = '5' then
		MessageBox('Atención','La admisión ya ha sido cerrada')
		return 0
	end if
	if messageBox('Atención','Está seguro de anular el registro?',Question!,YesNo!) = 2 then Return 0
	cont=dw_ctr.GetItemnumber(dw_ctr.GetRow(),'contador_si')
	clu=dw_ctr.GetItemstring(dw_ctr.GetRow(),'clugar_si')
	nser=dw_ctr.GetItemnumber(dw_ctr.GetRow(),'nservicio_si')	
	dw_rias.setfilter("contador="+string(cont)+" and clugar='"+clu+"' and nservicio="+string(nser))
	dw_rias.filter()
	sum_a = long(t1.pm.dw_ctr.Describe("Evaluate('sum(if(estado=~~'1~~' and suministrado=~~'1~~',dosis,0))',0)"))
	dw_ctr.SetItem(dw_ctr.GetRow(),'estado','2')
	sums = long(t1.pm.dw_ctr.Describe("Evaluate('sum(if(estado=~~'1~~' and suministrado=~~'1~~',dosis,0))',0)"))

	if dw_rias.rowcount()>0 then
		if (dw_rias.getitemnumber(dw_rias.GetRow(),'cantidad') - (sum_a - sums))=0 then
			dw_rias.DeleteRow(dw_rias.GetRow())		
		else
			dw_rias.SetItem(dw_rias.GetRow(),'cantidad',sums)
		end if
	end if
	dw_rias.setfilter("")
	dw_rias.filter()
	dw_os.SetItem(dw_os.GetRow(),'suministrada',sums)
	setnull(cont)
	dw_ctr.setitem(dw_ctr.GetRow(),'contador_si',cont)
	setnull(clu)
	dw_ctr.setitem(dw_ctr.GetRow(),'clugar_si',clu)
	setnull(nser)
	dw_ctr.setitem(dw_ctr.GetRow(),'nservicio_si',nser)	
elseif dw_ctr.GetItemString(dw_ctr.GetRow(),'suministrado') = '0'  then
	MessageBox('Atención','Aún no se ha suministrado, puede ser eliminado desde la grilla de programación')
	Return 0
end if
if dw_os.Update() = -1 then
	Rollback;
	Return -1
End if
if dw_ctr.Update() = -1 then
	Rollback;
	Return -1
End if
if dw_rias.Update() = -1 then
	Rollback;
	Return -1
End if
commit;
t1.pm.dw_o.triggerevent(itemchanged!)
Return 0

end event

type cbx_1 from checkbox within pm
boolean visible = false
integer x = 955
integer y = 952
integer width = 599
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aplicar cambios a todos"
boolean checked = true
boolean lefttext = true
end type

type st_3 from statictext within pm
integer x = 955
integer y = 1620
integer width = 599
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registro 0 de 0"
alignment alignment = right!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_prog from statictext within pm
event type long refrescar ( )
boolean visible = false
integer x = 2469
integer y = 2172
integer width = 987
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Programados fuera de la semana: 0"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event type long refrescar();long co, ns, it, total
string cl

co = dw_os.getItemNumber(dw_os.getrow(),'contador')
cl = dw_os.getItemString(dw_os.getrow(),'clugar')
ns = dw_os.getItemNumber(dw_os.getrow(),'nsolicitud')
it = dw_os.getItemNumber(dw_os.getrow(),'item')
select count(*) into :total from enf_ctr_medica
where contador=:co and clugar=:cl and nsolicitud=:ns and item=:it and estado='1' and (fecha < :desde or fecha > :hasta);
Text = 'Programados fuera de la semana: '+ string(total)

Return total

end event

type cb_guarda from picturebutton within pm
event mousemove pbm_mousemove
integer x = 5829
integer y = 548
integer width = 146
integer height = 128
integer taborder = 8
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar"
end type

event clicked;long fila,col,donde, co, prog, hora
date f_dia
time horaini,horafin
string valor
boolean existe

if t1.pm.dw_ctr.AcceptText() = -1 then Return -1
if i_est_hadm_p<>'1' then
	messagebox('Atención','La admisión ya se encuentra cerrada')
	return
end if
if dw_os.RowCount() = 0 then Return 0
if dw_os.GetItemString(dw_os.GetRow(),'enfermeria') = '0' then
	MessageBox('Atención','No puede modificarse desde la Estación de Enfermería')
	Return 0
end if
fila = 1
do while fila <= dw_ctr.RowCount()
	if dw_ctr.GetItemString(fila,'estado') = '2' then 
		fila ++
		Continue
	end if
	if dw_ctr.GetItemNumber(fila,'dosis') = 0 then 
		dw_ctr.DeleteRow(fila)
		fila = fila - 1
	end if
	prog = prog + dw_ctr.GetItemNumber(fila,'dosis')
	fila = fila + 1
loop
if isNull(prog) or prog = 0 and dw_ctr.RowCount() > 0 then
    if fila=1 then
		MessageBox('Atención','No ha programado dosis')
		Return -1
	end if
end if
if prog > dw_os.GetItemNumber(dw_os.GetRow(),'solicitada') then
	MessageBox('Atención','Solo puede programar la cantidad ordenada')
	Return -1
end if
if prog > dw_os.GetItemNumber(dw_os.GetRow(),'entregada') then
	MessageBox('Atención','Solo puede programar la cantidad entregada por farmacia')
	Return -1
end if
f_dia = RelativeDate(date(hasta),1)
for col = 1 to dw_ctr.RowCount()
	if dw_ctr.GetItemString(col,'estado') = '0' then
		dw_ctr.SetItem(col,'estado','1')
	end if
next
if dw_ctr.update() = -1 then
	Rollback;
	Return -1
else
	if dw_ctr.RowCount() > 0 then
		dw_os.SetItem(dw_os.GetRow(),'enfermeria','1')
	else
		setNull(valor)
		dw_os.SetItem(dw_os.GetRow(),'enfermeria',valor)
	end if
	if dw_os.Update() = -1 then
		Rollback;
		Return -1
	end if
	Commit;
end if
dw_ctr.Event muestra()
cambio = FALSE
int ll_row
ll_row=t1.pm.dw_os.getrow()
t1.pm.dw_os.Retrieve(st_p.contador,st_p.clugar,t1.pm.dw_os.getItemNumber(t1.pm.dw_os.getrow(),'nsolicitud'))
t1.pm.dw_os.setrow(ll_row)
ll_row=t1.pm.dw_ctr.getrow()
t1.pm.dw_ctr.Retrieve(st_p.contador,st_p.clugar,t1.pm.dw_os.getItemNumber(t1.pm.dw_os.getrow(),'nsolicitud'),t1.pm.dw_os.getItemNumber(t1.pm.dw_os.getrow(),'item'))
t1.pm.dw_ctr.setrow(ll_row)
Return 0
end event

type st_2 from statictext within pm
integer x = 41
integer y = 952
integer width = 361
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Programado"
boolean focusrectangle = false
end type

type dp_1 from datepicker within pm
integer x = 4306
integer y = 40
integer width = 416
integer height = 80
integer taborder = 3
boolean border = true
borderstyle borderstyle = styleraised!
string customformat = "dd/mm/yyyy"
date maxdate = Date("2998-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2024-08-21"), Time("10:52:16.000000"))
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
weekday firstdayofweek = monday!
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;int ret
date fecha, f_ptr
time hora

getValue(fecha,hora)// = date(object.year(),object.month,object.day())
if DateTime(RelativeDate(fecha,-1*f_diaNumero(fecha) + 1)) <> desde then
	if cambio then 
		ret = MessageBox('Atención','Ha realizado cambios, Desea grabarlos?',QUESTION!,YESNOCANCEL!,3)
		if ret = 1 then
//			cb_guarda.Event clicked()
		elseif ret = 3 then
			setValue(desde)
			Return
		else
			cambio = FALSE
		end if
	end if
	
	desde = DateTime(RelativeDate(fecha,-1*f_diaNumero(fecha) + 1))
	hasta = DateTime(RelativeDate(fecha, 7 - f_diaNumero(fecha)),time('23:59'))
	inimes = datetime(date(year(fecha),month(fecha),1))
	if month(fecha) = 12 then
		finmes = datetime(date(year(fecha) + 1,1,1))
	else
		finmes = datetime(date(year(fecha),month(fecha) + 1,1))
	end if
	finmes = datetime(RelativeDate(date(finmes), -1),time('23:59'))
//	resaltacal()
	f_ptr = date(desde)
	dw_5.Modify("b_dom.Text='Lun "+string(day(f_ptr))+"'")
	f_ptr = RelativeDate(f_ptr, 1)
	dw_5.Modify("b_lun.Text='Mar "+string(day(f_ptr))+"'")
	f_ptr = RelativeDate(f_ptr, 1)
	dw_5.Modify("b_mar.Text='Mie "+string(day(f_ptr))+"'")
	f_ptr = RelativeDate(f_ptr, 1)
	dw_5.Modify("b_mie.Text='Jue "+string(day(f_ptr))+"'")
	f_ptr = RelativeDate(f_ptr, 1)
	dw_5.Modify("b_jue.Text='Vie "+string(day(f_ptr))+"'")
	f_ptr = RelativeDate(f_ptr, 1)
	dw_5.Modify("b_vie.Text='Sáb "+string(day(f_ptr))+"'")
	f_ptr = RelativeDate(f_ptr, 1)
	dw_5.Modify("b_sab.Text='Dom "+string(day(f_ptr))+"'")
	
	dw_ctr.Event Muestra()
//	festivos()
else
//	object.Value(desde)
end if

end event

type st_1 from statictext within pm
integer x = 41
integer y = 112
integer width = 407
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medicamentos"
boolean focusrectangle = false
end type

type cb_2 from picturebutton within pm
event mousemove pbm_mousemove
integer x = 5833
integer y = 284
integer width = 146
integer height = 128
integer taborder = 6
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ocupar.gif"
string disabledname = "d_ocupar.gif"
string powertiptext = "Ocupar"
end type

event clicked;long fil,col
string valor
int veces
setNull(valor)
if dw_os.RowCount() = 0 then Return 0
if dw_os.GetItemString(dw_os.GetRow(),'enfermeria') = '0' then
	MessageBox('Atención','No puede modificarse desde la Estación de Enfermería')
	Return 0
end if
veces = (dw_os.GetItemNumber(dw_os.GetRow(),'entregada') - dw_os.GetItemNumber(dw_os.GetRow(),'devuelta')) - long(dw_ctr.Describe("Evaluate('sum(if(estado=~~'1~~' or estado=~~'0~~',dosis,0))',0)"))

for col=1 to 7
	for fil=1 to dw_5.rowcount()
		if veces>0 then
			if dw_5.getitemstring(fil,'sel'+string(col)) = '1' then
				if not isNull(dw_5.GetitemString(fil,col)) then Continue
				dw_5.setitem(fil,col,c_medica) 
				dw_5.setitem(fil,'sel'+string(col),'0')
				dw_5.setitem(fil,'he'+string(col),'0')
				dw_5.setitem(fil,'cp'+string(col),'0')
				dw_5.setitem(fil,'pro'+string(col),'0')
				dw_5.Event cambia_dw(fil,col)
				veces --	
			end if
     end if
	next
next
cambio = TRUE

end event

type cb_1 from picturebutton within pm
event mosemove pbm_mousemove
integer x = 5829
integer y = 412
integer width = 146
integer height = 128
integer taborder = 7
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "desocupar.gif"
string disabledname = "d_desocupar.gif"
string powertiptext = "Desocupar"
end type

event clicked;long fil,col
string valor
if dw_os.RowCount() = 0 then Return 0
if dw_os.GetItemString(dw_os.GetRow(),'enfermeria') = '0' then
	MessageBox('Atención','No puede modificarse desde la Estación de Enfermería')
	Return 0
end if
setNull(valor)
for fil=1 to dw_5.rowcount()
	for col=1 to 7
		if dw_5.getitemstring(fil,'sel'+string(col))='1' then
			dw_5.setitem(fil,col,valor)
			dw_5.setitem(fil,'ufun'+string(col),valor)
			dw_5.setitem(fil,'cc'+string(col),0)
			dw_5.setitem(fil,'sel'+string(col),'0')
			dw_5.setitem(fil,'he'+string(col),valor)
			dw_5.setitem(fil,'cp'+string(col),valor)
			dw_5.setitem(fil,'pro'+string(col),valor)
			dw_5.Event cambia_dw(fil,col)
		end if
	next
next

cambio = TRUE

end event

type pb_1 from picturebutton within pm
integer x = 5829
integer y = 144
integer width = 151
integer height = 132
integer taborder = 5
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "selec.gif"
alignment htextalign = left!
end type

event clicked;
if PictureName = "selec.gif" then
	PictureName = "deselec.gif"
	PowerTipText = "Deselecccionar"
else
	PictureName = "selec.gif"
	PowerTipText = "Selecccionar"
end if

end event

type dw_5 from datawindow within pm
event clickup pbm_dwnlbuttonup
event mousemove pbm_dwnmousemove
event marcacol ( integer columna )
event marcafila ( integer fila )
event pinta ( )
event marca_turno ( string codigo )
event type integer suministrar ( integer p_dia,  integer p_hora )
event cambia_dw ( integer fila,  integer col )
integer x = 3305
integer y = 132
integer width = 2450
integer height = 1940
integer taborder = 4
string title = "none"
string dataobject = "dw_horario_enf"
boolean hscrollbar = true
boolean border = false
end type

event clickup;pres=0
if row<1 then return
string cual
long columna,i,j
if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	columna=long(cual)
	if columna=colini and row=filaini then
		if this.GetitemNumber(row,"cp"+cual) = 0 then
			if this.getitemstring(row,"sel"+cual)="1" then
				this.setitem(row,"sel"+cual,"0")
			else
				this.setitem(row,"sel"+cual,"1")
			end if
		end if
	end if
end if

end event

event mousemove;if row<1 then return
if pres=0 then Return

string scol
long columna,i,j,fila
string lugar,ufun,ccostos,dlugar,dccostos,dufun

if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	scol = right(string(dwo.name),1)
	columna=long(scol)
	if columna<>colini or row<>filaini then
		int paso1,paso2
		i = filaini
		j = colini
		if (row - filaini)= 0 then 
			paso1=1
		else
			paso1 = (row - filaini) / abs(filaini - row)
		end if
		if (columna - colini) = 0 then 
			paso2=1
		else
			paso2 = (columna - colini) / abs(colini - columna)
		end if
		do 
			do 
				if pb_1.PictureName = 'selec.gif' then
					if (this.GetitemNumber(i,"cp"+string(j)) = 0) then
						this.setitem(i,"sel"+string(j),"1")
					end if
				else
					this.setitem(i,"sel"+string(j),"0")
				end if
				j= j+ paso2
			loop until j = columna + paso2 
			i = i + paso1
			j=colini
		loop until i = row +paso1 
		
	end if
	ffin = row
	cfin = long(scol)
end if

end event

event marcacol(integer columna);long i
for i=1 to rowcount()
	if GetItemNumber(i,'cp'+string(columna)) = 1 then Continue
	if getitemstring(1,"selcol"+string(columna))="0" then
		setitem(i,"sel"+string(columna),"1")
	else
		setitem(i,"sel"+string(columna),"0")
	end if
next
if getitemstring(1,"selcol"+string(columna))="0" then
	setitem(1,"selcol"+string(columna),"1")
else
	setitem(1,"selcol"+string(columna),"0")
end if

end event

event marcafila(integer fila);long i
for i=1 to 7 
	if GetItemNumber(fila,'cp'+string(i)) = 1 then Continue
	if getitemstring(fila,"selfil")="0" then
		setitem(fila,"sel"+string(i),"1")
	else
		setitem(fila,"sel"+string(i),"0")
	end if
next
if getitemstring(fila,"selfil")="0" then
	setitem(fila,"selfil","1")
else
	setitem(fila,"selfil","0")
end if

end event

event pinta();time hora
long cual
SetRedraw(FALSE)
hora=time('00')
reset()

DO WHILE hora < time('23:59')
	cual=insertrow(0)
	setitem(cual,"hora",hora)
	hora=relativetime(hora,60*60)
LOOP
if dia_sel > 0 then
	Modify('dia'+string(dia_sel)+'.Font.Weight="400"')
end if
SetRedraw(TRUE)

end event

event marca_turno(string codigo);long i, col, fila, veces, freq, hora, k
string valor

if dia = 0 then 
	MessageBox('Atención','No seleccionó día válido')
	Return
end if

// Deselec
setNull(valor)
if codigo = 'limpia' then 
	for k = 1 to 7
		for i=1 to dw_5.rowcount()
//			if isNull(dw_5.GetItemNumber(i,'cp'+string(k))) or dw_5.GetItemNumber(i,'cp'+string(k)) = 0 then
			if dw_5.GetItemString(i,'dia'+string(k)) <> '' and dw_5.GetItemNumber(i,'cp'+string(k)) = 0 then
				dw_5.setitem(i,k,valor)
				dw_5.setitem(i,'ufun'+string(k),valor)
				dw_5.setitem(i,'cc'+string(k),0)
				dw_5.setitem(i,'sel'+string(k),'0')
				dw_5.setitem(i,'he'+string(k),valor)
				dw_5.setitem(i,'cp'+string(k),valor)
				dw_5.setitem(i,'pro'+string(k),valor)
				dw_5.Event cambia_dw(i,k)
			end if
		next
	next
	Return
end if
if dw_os.RowCount() = 0 then Return 

//veces = dw_os.GetItemNumber(dw_os.GetRow(),'solicitada') - long(dw_ctr.Describe("Evaluate('sum(if(estado=~~'1~~' or estado=~~'0~~',dosis,0))',0)"))
veces = dw_os.GetItemNumber(dw_os.GetRow(),'programar') - long(dw_ctr.Describe("Evaluate('sum(if(estado=~~'1~~' or estado=~~'0~~',dosis,0))',0)"))
freq = long(codigo)
freq = long(codigo)
hora = i_hora
col = dia
if veces = 0 then Return

fila = find("hora=time('"+string(hora)+":00')",1, RowCount())
dw_5.setitem(fila,'sel'+string(col),'1')
for i = 1 to veces - 1
	col = col + int((hora + freq)/24)
	if col > 7 then
		MessageBox('Atención','Debe programar el restante la siguiente semana')
		EXIT
	end if
	hora = mod(hora + mod(freq,24), 24)
	fila = find("hora=time('"+string(hora)+":00')",1, RowCount())
	if dw_5.GetItemNumber(fila,'cp'+string(col)) = 0 then
		dw_5.setitem(fila,'sel'+string(col),'1')
	end if
next
cb_2.TriggerEvent(clicked!)

end event

event cambia_dw(integer fila, integer col);string valor
long donde
datetime fecha
int veces

if isNull(dw_5.getitemstring(fila,'dia'+string(col))) then
	fecha = datetime(Relativedate(date(desde),col - 1),time(string(fila - 1)))
	donde = dw_ctr.Find("fecha=datetime(date('"+string(fecha,'yyyy-mm-dd')+"'),time('"+string(time(fecha))+"'))",1,dw_ctr.RowCount())
	if donde > 0 then
		dw_ctr.DeleteRow(donde)
	end if
elseif dw_5.getitemstring(fila,'dia'+string(col)) = c_medica and dw_5.GetItemNumber(fila,'cp'+string(col)) = 0 and dw_5.getItemNumber(fila,'cc'+string(col)) = 0 then
	veces = dw_os.GetItemNumber(dw_os.GetRow(),'entregada') - long(dw_ctr.Describe("Evaluate('sum(if(estado=~~'1~~' or estado=~~'0~~',dosis,0))',0)"))
	if veces>0 then 
	valor = dw_ctr.Describe("Evaluate('max(prog)', 1)")
	donde = dw_ctr.insertrow(0)
	dw_ctr.setitem(donde,'contador',dw_os.getItemNumber(dw_os.getrow(),'contador'))
	dw_ctr.setitem(donde,'clugar',dw_os.getitemString(dw_os.getrow(),'clugar'))
	dw_ctr.setitem(donde,'nsolicitud',dw_os.getitemNumber(dw_os.getrow(),'nsolicitud'))
	dw_ctr.setitem(donde,'item',dw_os.getitemNumber(dw_os.getrow(),'item'))
	dw_ctr.setitem(donde,'prog',long(valor) + 1)
	dw_ctr.setitem(donde,'c_medica',dw_os.getitemString(dw_os.getrow(),'c_medica'))
	dw_ctr.setitem(donde,'suministrado',dw_5.getitemNumber(fila,'cp'+string(col)))
	dw_ctr.setitem(donde,'estado','0')
	dw_ctr.setitem(donde,'fecha',DateTime(RelativeDate(date(desde),col - 1),dw_5.GetItemTime(fila,'hora')))
	dw_ctr.setitem(donde,'usuario',st_p.usu)
	dw_ctr.setitem(donde,'via',dw_os.getitemString(dw_os.getrow(),'via'))
end if
end if
dw_ctr.TriggerEvent(RowFocuschanged!)
end event

event buttonclicked;if this.rowcount()<1 then return
if dwo.name<>"b_hora" then
	choose case dwo.name
		case "b_dom"
			Event marcacol(1)
		case "b_lun"
			Event marcacol(2)
		case "b_mar"
			Event marcacol(3)
		case "b_mie"
			Event marcacol(4)
		case "b_jue"
			Event marcacol(5)
		case "b_vie"
			Event marcacol(6)
		case "b_sab"
			Event marcacol(7)
	end choose	
else
	Event marcafila(row)
end if


end event

event clicked;if string(dwo.type)="column" and string(dwo.name)<> "hora" then
	colini = long(right(string(dwo.name),1))
	filaini = row
	pres=1
end if

end event

event rbuttondown;dw_ctr.accepttext()
if left(dwo.Name,3) = 'dia' then
	dia = long(mid(dwo.name,4))
else
	choose case dwo.Name
		case 'b_dom' 
			dia = 1
		case 'b_lun' 
			dia = 2
		case 'b_mar'
			dia = 3
		case 'b_mie' 
			dia = 4
		case 'b_jue'
			dia = 5
		case 'b_vie' 
			dia = 6
		case 'b_sab'
			dia = 7
		case else
			dia = 0
	end choose
end if
if dia > 0 then
	i_hora = hour(GetItemTime(row,'hora'))
	if not isNull(GetItemString(i_hora + 1,'dia'+string(dia)) ) and GetItemNumber(i_hora + 1,'cp'+string(dia)) = 0 and GetItemNumber(i_hora + 1,'cc'+string(dia)) > 0 then
		m_t.Item[1].visible = true
		m_t.Item[1].toolbaritemvisible = true
		m_t.Item[1].enabled = true
		m_t.Item[2].visible = true
	else
		m_t.Item[1].visible = False
		m_t.Item[2].visible = False
	end if
	m_t.popMenu(w_estacion_enf.PointerX(),w_estacion_enf.PointerY())
end if

end event

event constructor;Event pinta()

end event

type dw_os from datawindow within pm
integer x = 37
integer y = 172
integer width = 3241
integer height = 768
integer taborder = 1
boolean bringtotop = true
string title = "none"
string dataobject = "dw_oscpo_med_new"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;setNull(c_medica) 
st_med.Text = ''
if RowCount() = 0 or currentrow = 0 then Return 
dw_ctr.Retrieve(st_p.contador,st_p.clugar,orden_new,getitemNumber(getRow(),'item'))//,desde,datetime(date(hasta),time('23:59')))
dw_rias.Retrieve(st_p.contador,st_p.clugar,orden_new,getitemNumber(getRow(),'item'))
dw_ctr.Event muestra()
//st_prog.Event refrescar()
c_medica = GetItemString(GetRow(),'c_medica')
st_med.Text = GetItemString(GetRow(),'medicamento')
end event

event rowfocuschanging;int rta
if cambio then
//para que no metan goles cuando hacen modificacion y no son jefes
	if conteo = '0'then
		rta = messageBox('Atención','Ha realizado cambios. Desea Guardarlos?',QUESTION!,YESNOCANCEL!,3)
		if rta = 1 then
			cb_guarda.Event clicked()
		elseif rta = 3 then
			Return -1
		end if
	End if
end if
cambio = FALSE

end event

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

type dw_ctr from datawindow within pm
event muestra ( )
event ue_accepttext ( )
integer x = 59
integer y = 1028
integer width = 3168
integer height = 1024
integer taborder = 2
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ctrl_medica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event muestra();Long i, fila
time hora, va
boolean enfoco

dw_5.Event pinta()

for i = 1 to this.rowcount()
	if getitemdatetime(i,"fecha") < desde or getitemdatetime(i,"fecha") > hasta then Continue
	if GetItemString(i,'estado') = '1' then
		if not enfoco then
			ScrolltoRow(i)
			enfoco = TRUE
		end if
		hora=time(this.getitemdatetime(i,'fecha'))
		fila = dw_5.find("hora=time('"+string(hora)+"')",1,dw_5.rowcount())
		dw_5.setitem(fila,'dia'+string(this.getitemnumber(i,"dia")),getitemString(i,'c_medica'))
		dw_5.setitem(fila,'cp'+string(this.getitemnumber(i,"dia")),long(getitemString(i,'suministrado')))
		dw_5.setitem(fila,'cc'+string(this.getitemnumber(i,"dia")),getitemNumber(i,'prog'))
	end if
next
//st_prog.event Refrescar()

end event

event constructor;setTransObject(SQLCA)

end event

event buttonclicked;long l_hora,l_j
string ret

for l_j=1 to rowcount()
	if dwo.text='Escoger' then
		if getitemstring(l_j,'suministrado')<>'1' then 
			setrow(l_j)
			setitem(l_j,'sel',1)
		end if
	else
		setitem(l_j,'sel',0)
	end if
next
if dwo.name<>'b_1' then 
	if dwo.text='Escoger' then modify(string(dwo.name)+'.text="No Escog."') else 	modify(string(dwo.name)+'.text="Escoger"')
end if

if dwo.name='b_1' then 
	if GetItemDateTime(Row,'fecha') < desde or GetItemDateTime(Row,'fecha') > hasta then
		t1.pm.dp_1.SetValue(GetItemDateTime(Row,'fecha'))
		t1.pm.dp_1.TriggerEvent('ValueChanged')
	end if
	ScrolltoRow(row)
	dia_sel = f_dianumero(date(GetItemDateTime(GetRow(),'fecha')))
	l_hora = hour(time(GetItemDateTime(GetRow(),'fecha')))
	ret = dw_5.Modify("dia"+string(dia_sel)+".Font.weight='400~tif(GetRow()="+string(l_hora+1)+",700,400)'")
end if


end event

event rowfocuschanged;st_3.Text = + ' Registro ' + string(GetRow()) +' de ' +string(RowCount())

end event

event itemchanged;long i,actual
				
actual	=GetItemnumber(row,'dosis')
AcceptText()
if cbx_1.Checked then
	if GetColumnName() = 'dosis' then
		if GetItemnumber(1,'cdosis')>dw_os.getitemnumber(dw_os.getrow(),'Entregada') then
			messagebox('Atención','Supera la cantidad entregada')
			SetItem(row,'dosis',actual)
			return 2
		else
			SetItem(i,'dosis',data)
		end if
	elseif GetColumnName() = 'via' then
		for i = 1 to RowCount()
			if GetItemString(i,'suministrado') = '1' then Continue
			SetItem(i,'via',data)
		next	
	end if
end if

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

type dw_rias from datawindow within w_estacion_enf
boolean visible = false
integer x = 3538
integer y = 2140
integer width = 2222
integer height = 288
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_servingreso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

