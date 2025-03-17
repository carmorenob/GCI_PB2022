$PBExportHeader$w_imag_diag.srw
forward
global type w_imag_diag from window
end type
type uo_2 from uo_imag_diag within w_imag_diag
end type
type dw_t3 from datawindow within w_imag_diag
end type
type dw_t1 from datawindow within w_imag_diag
end type
type dw_barra from datawindow within w_imag_diag
end type
type dw_histo from datawindow within w_imag_diag
end type
type dw_temp2 from datawindow within w_imag_diag
end type
type tab_1 from tab within w_imag_diag
end type
type tp_2 from userobject within tab_1
end type
type pb_2 from picturebutton within tp_2
end type
type pb_1 from picturebutton within tp_2
end type
type dw_1 from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
type tab_1 from tab within w_imag_diag
tp_2 tp_2
end type
type st_vertical from statictext within w_imag_diag
end type
type rte_1 from richtextedit within w_imag_diag
end type
type uo_odon from uo_odontograma within w_imag_diag
end type
type uo_1 from uo_hclin within w_imag_diag
end type
type dw_temp from datawindow within w_imag_diag
end type
end forward

global type w_imag_diag from window
integer width = 4722
integer height = 2684
boolean titlebar = true
string title = "Explorador de Historial Médico del Paciente"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "r_treehc.ico"
boolean center = true
event vscroll pbm_vscroll
event post_open ( )
uo_2 uo_2
dw_t3 dw_t3
dw_t1 dw_t1
dw_barra dw_barra
dw_histo dw_histo
dw_temp2 dw_temp2
tab_1 tab_1
st_vertical st_vertical
rte_1 rte_1
uo_odon uo_odon
uo_1 uo_1
dw_temp dw_temp
end type
global w_imag_diag w_imag_diag

type variables
long i_fila
dwobject i_dwo
boolean i_cambia_rte
DataWindowChild idw_finconold,idw_causaexold
end variables
forward prototypes
public function integer pintar (integer p_numero)
public subroutine cambia_dw (datawindow p_dw, string p_dataobject)
public subroutine mover (long xpos)
public subroutine mostrar (string opcion)
end prototypes

event vscroll;tab_1.y=scrollpos

end event

event post_open();setpointer(hourglass!)
dw_histo.setredraw(false)
dw_histo.reset()
mostrar('')
dw_histo.retrieve(tipdoc,docu)
dw_histo.setredraw(true)
end event

public function integer pintar (integer p_numero);tab_1.width=width
tab_1.tp_2.enabled=true
tab_1.selectedtab=2
vscrollbar=false
setredraw(true)
return 1
end function

public subroutine cambia_dw (datawindow p_dw, string p_dataobject);p_dw.dataobject=p_dataobject
p_dw.settransobject(sqlca)
p_dw.getchild('fin_consulta',idw_finconold)
idw_finconold.settransobject(sqlca)
p_dw.getchild('causaexterna',idw_causaexold)
idw_causaexold.settransobject(sqlca)


//getchild('s_finalidadproced',idw_finproc)
//idw_finproc.settransobject(SQLCA)
//getchild('s_ambitoproced',idw_ambproc)
//idw_ambproc.settransobject(sqlca)

idw_finconold.retrieve('%')
idw_causaexold.retrieve('%')
//idw_finproc.retrieve('1')
//idw_ambproc.retrieve('1')

end subroutine

public subroutine mover (long xpos);dw_histo.width=xpos
dw_temp.x=xpos+16
rte_1.x=dw_temp.x
dw_temp.width=width - xpos -55
rte_1.width=dw_temp.width
uo_1.x=dw_temp.x
uo_odon.x=dw_temp.x
uo_1.tamanyo(dw_temp.width,uo_1.height)
uo_odon.width=dw_temp.width
uo_2.x=dw_temp.x
uo_2.tamanyo(dw_temp.width,dw_temp.height)


end subroutine

public subroutine mostrar (string opcion);setredraw(false)
choose case opcion
	case 'R'//rtf
		dw_temp.visible=false
		uo_1.visible=false
		rte_1.visible=true
		uo_odon.visible=false
		uo_2.visible=false
	case 'A'//arbol de abajo
		dw_temp.visible=false
		uo_odon.visible=false
		rte_1.visible=false
		uo_1.visible=true
		uo_2.visible=false
	case 'D'//datawindow
		dw_temp.visible=true
		uo_1.visible=false
		rte_1.visible=false
		uo_odon.visible=false
		uo_2.visible=false
	case 'O'
		dw_temp.visible=false
		uo_odon.visible=true
		uo_1.visible=false
		rte_1.visible=false
		uo_2.visible=false
	case 'I'
		dw_temp.visible=false
		uo_odon.visible=false
		uo_1.visible=false
		rte_1.visible=false
		uo_2.visible=true
	case else
		dw_temp.visible=false
		uo_odon.visible=false
		uo_1.visible=false
		rte_1.visible=false
		uo_2.visible=false
end choose
setredraw(true)
end subroutine

on w_imag_diag.create
this.uo_2=create uo_2
this.dw_t3=create dw_t3
this.dw_t1=create dw_t1
this.dw_barra=create dw_barra
this.dw_histo=create dw_histo
this.dw_temp2=create dw_temp2
this.tab_1=create tab_1
this.st_vertical=create st_vertical
this.rte_1=create rte_1
this.uo_odon=create uo_odon
this.uo_1=create uo_1
this.dw_temp=create dw_temp
this.Control[]={this.uo_2,&
this.dw_t3,&
this.dw_t1,&
this.dw_barra,&
this.dw_histo,&
this.dw_temp2,&
this.tab_1,&
this.st_vertical,&
this.rte_1,&
this.uo_odon,&
this.uo_1,&
this.dw_temp}
end on

on w_imag_diag.destroy
destroy(this.uo_2)
destroy(this.dw_t3)
destroy(this.dw_t1)
destroy(this.dw_barra)
destroy(this.dw_histo)
destroy(this.dw_temp2)
destroy(this.tab_1)
destroy(this.st_vertical)
destroy(this.rte_1)
destroy(this.uo_odon)
destroy(this.uo_1)
destroy(this.dw_temp)
end on

event resize;st_vertical.y=152
st_vertical.height=width -50
dw_temp.resize(width - dw_temp.x -40,height -208)
rte_1.resize(width - dw_temp.x -40,height -208)
uo_1.tamanyo(width - dw_temp.x -40,height -208)
uo_2.tamanyo(width - dw_temp.x -40,height -208)
uo_odon.resize(width - dw_temp.x -40,height -208)
dw_histo.resize(dw_histo.width,height -208)
if dw_temp.width<1200 then
//	uo_1.tv_1.width=dw_temp.width
else
//	uo_1.tv_1.width=dw_temp.width*0.7
end if
end event

event open;mover(st_vertical.x)
post event post_open()
end event

event mousemove;dw_barra.event mousemove(0,0,1,dw_barra.object.datawindow)
end event

event timer;if i_fila=dw_histo.getrow() then return
timer(0)
dw_histo.event p_rowfocuschanged()
i_fila=dw_histo.getrow()
end event

type uo_2 from uo_imag_diag within w_imag_diag
boolean visible = false
integer x = 1070
integer y = 152
integer width = 763
integer height = 648
integer taborder = 60
end type

on uo_2.destroy
call uo_imag_diag::destroy
end on

type dw_t3 from datawindow within w_imag_diag
boolean visible = false
integer x = 3246
integer y = 832
integer width = 123
integer height = 112
integer taborder = 90
boolean enabled = false
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_t1 from datawindow within w_imag_diag
boolean visible = false
integer x = 3328
integer y = 540
integer width = 91
integer height = 128
integer taborder = 80
boolean enabled = false
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_barra from datawindow within w_imag_diag
event mousemove pbm_dwnmousemove
event clickup pbm_dwnlbuttonup
integer width = 5001
integer height = 148
integer taborder = 20
string title = "none"
string dataobject = "dw_barra"
boolean border = false
boolean livescroll = true
end type

event mousemove;if not isnull(i_dwo) and isvalid(i_dwo) then
	if i_dwo.name<>dwo.name and pos(i_dwo.filename,'barrad_')=0 then
		i_dwo.y=8
		i_dwo.x=long(i_dwo.x)-4
	end if
end if
choose case dwo.name
	case 'p_arr'
		object.p_arr.filename="barra_arriba.bmp"
		object.p_fil.filename="barrad_filtrar.bmp"
		object.p_imp.filename="barrad_imprimir.bmp"
		object.p_det.filename="barrad_detalle.bmp"
		object.p_rep.filename="barrad_verrep.bmp"
		object.p_cam.filename="barrad_campos.bmp"
		object.p_arb.filename="barrad_arbol.bmp"
	case 'p_fil'
		object.p_fil.filename="barra_filtrar.bmp"
		object.p_arr.filename="barrad_arriba.bmp"
		object.p_imp.filename="barrad_imprimir.bmp"
		object.p_det.filename="barrad_detalle.bmp"
		object.p_rep.filename="barrad_verrep.bmp"
		object.p_cam.filename="barrad_campos.bmp"
		object.p_arb.filename="barrad_arbol.bmp"
	case 'p_imp'
		object.p_imp.filename="barra_imprimir.bmp"
		object.p_arr.filename="barrad_arriba.bmp"
		object.p_fil.filename="barrad_filtrar.bmp"
		object.p_det.filename="barrad_detalle.bmp"
		object.p_rep.filename="barrad_verrep.bmp"
		object.p_cam.filename="barrad_campos.bmp"
		object.p_arb.filename="barrad_arbol.bmp"
	case 'p_det'
		object.p_det.filename="barra_detalle.bmp"
		object.p_arr.filename="barrad_arriba.bmp"
		object.p_fil.filename="barrad_filtrar.bmp"
		object.p_imp.filename="barrad_imprimir.bmp"
		object.p_rep.filename="barrad_verrep.bmp"
		object.p_cam.filename="barrad_campos.bmp"
		object.p_arb.filename="barrad_arbol.bmp"
	case 'p_rep'
		object.p_rep.filename="barra_verrep.bmp"
		object.p_arr.filename="barrad_arriba.bmp"
		object.p_fil.filename="barrad_filtrar.bmp"
		object.p_imp.filename="barrad_imprimir.bmp"
		object.p_det.filename="barrad_detalle.bmp"
		object.p_cam.filename="barrad_campos.bmp"
		object.p_arb.filename="barrad_arbol.bmp"
	case 'p_cam'
		object.p_cam.filename="barra_campos.bmp"
		object.p_arr.filename="barrad_arriba.bmp"
		object.p_fil.filename="barrad_filtrar.bmp"
		object.p_imp.filename="barrad_imprimir.bmp"
		object.p_det.filename="barrad_detalle.bmp"
		object.p_rep.filename="barrad_verrep.bmp"
		object.p_arb.filename="barrad_arbol.bmp"
	case 'p_arb'
		object.p_arb.filename="barra_arbol.bmp"
		object.p_arr.filename="barrad_arriba.bmp"
		object.p_fil.filename="barrad_filtrar.bmp"
		object.p_imp.filename="barrad_imprimir.bmp"
		object.p_det.filename="barrad_detalle.bmp"
		object.p_rep.filename="barrad_verrep.bmp"
		object.p_cam.filename="barrad_campos.bmp"
	case else
		setnull(i_dwo)
		object.p_arr.filename="barrad_arriba.bmp"
		object.p_fil.filename="barrad_filtrar.bmp"
		object.p_imp.filename="barrad_imprimir.bmp"
		object.p_det.filename="barrad_detalle.bmp"
		object.p_rep.filename="barrad_verrep.bmp"
		object.p_cam.filename="barrad_campos.bmp"
		object.p_arb.filename="barrad_arbol.bmp"
end choose
end event

event clickup;if not isnull(i_dwo) then
	if i_dwo.name=dwo.name then
		dwo.y=8
		dwo.x=long(dwo.x) -4
		setnull(i_dwo)
		choose case dwo.name
			case 'p_arr'
				if dw_histo.getrow()<1 then return
				if dw_histo.getitemnumber(dw_histo.getrow(),'padre')=0 then return
				dw_histo.scrolltorow(dw_histo.find('fila='+string(dw_histo.getitemnumber(dw_histo.getrow(),'padre')),1,dw_histo.rowcount()))
				dw_histo.setfocus()
		end choose
	end if
end if
end event

event constructor;insertrow(1)
end event

event clicked;if dwo.type<>'bitmap' then 
	setnull(i_dwo)
	return
end if
i_dwo=dwo
modify(dwo.name+'.y=12')
modify(dwo.name+'.x='+string(long(describe(dwo.name+'.x'))+4))

end event

type dw_histo from datawindow within w_imag_diag
event type long inserta ( long p_pos,  string p_label,  integer p_nivel,  long p_padre,  long p_hijos,  string p_indapdx,  datetime p_fecha,  long p_contador,  string p_clug,  long p_llave3,  long p_llave4,  string p_llave_s3,  string p_llave_s4 )
event mousemove pbm_dwnmousemove
event rec_mostrar ( long p_fila,  long p_inicial,  integer p_visible )
event keypres pbm_dwnkey
event crea_hijos ( long row )
event p_rowfocuschanged ( )
event type long crea_hijos_cext ( long contador,  string clug,  long row,  datetime fecha,  integer nivel )
integer y = 160
integer width = 955
integer height = 1600
integer taborder = 10
string title = "none"
string dataobject = "dw_historial_todos"
boolean hscrollbar = true
boolean vscrollbar = true
string icon = "Menu5!"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type long inserta(long p_pos, string p_label, integer p_nivel, long p_padre, long p_hijos, string p_indapdx, datetime p_fecha, long p_contador, string p_clug, long p_llave3, long p_llave4, string p_llave_s3, string p_llave_s4);long donde,cual
donde=insertrow(p_pos)
setitem(donde,'contador',p_contador)
setitem(donde,'clugar',p_clug)
setitem(donde,'label',p_label)
setitem(donde,'fecha',p_fecha)
setitem(donde,'nivel',p_nivel)
setitem(donde,'indapdx',p_indapdx)//S ervicios
cual=long(describe("evaluate('max(fila for all)',0)"))+1
setitem(donde,'fila',cual)
setitem(donde,'padre',p_padre)
setitem(donde,'hijos',p_hijos)
setitem(donde,'llave3',p_llave3)
setitem(donde,'llave4',p_llave4)
setitem(donde,'llave_s3',p_llave_s3)
setitem(donde,'llave_s4',p_llave_s4)
return donde

end event

event mousemove;dw_barra.event mousemove(0,0,1,dw_barra.object.datawindow)
end event

event rec_mostrar(long p_fila, long p_inicial, integer p_visible);long j,cual,p_mostrar
p_mostrar=p_visible
if p_fila<>p_inicial then
	p_mostrar=0
	if p_visible=1 and getitemstring(p_fila,'estado')='1' then p_mostrar=1
end if
if getitemnumber(p_fila,'hijos')>0 then
	cual=p_fila+1
	for j=1 to getitemnumber(p_fila,'hijos')
		cual=find('padre='+string(getitemnumber(p_fila,'fila')),cual,rowcount())
		if cual=0 then 
			messagebox('Atención',"No se encontro una rama de esta")
			continue
		end if
		event rec_mostrar(cual,p_inicial,p_mostrar)
		setitem(cual,'visible',p_mostrar)
		setdetailheight(cual,cual,76 *p_mostrar)
		cual ++
	next
end if
end event

event keypres;if getrow()<1 then return
if key=keyenter! then return 1
if key=keyadd! then
	if getitemstring(getrow(),'estado')='0' then event doubleclicked(10,10,getrow(),object.label)
end if
if key=keysubtract! then
	if getitemstring(getrow(),'estado')='1' then event doubleclicked(10,10,getrow(),object.label)
end if
end event

event crea_hijos(long row);long contador,sumar,nulo,j,padre[],hijos,k,l,m,f
string clug,snulo,temp
datetime fecha
setnull(nulo)
setnull(snulo)
contador=getitemnumber(row,'contador')
clug=getitemstring(row,'clugar')
fecha=getitemdatetime(row,'fecha')
setitem(row,'hijos',0)
setitem(row,'est_revisa',1)
sumar=row +1
choose case getitemstring(row,'indapdx')
	case '1'//ap dx
		if g_motor='postgres' then
			cambia_dw(dw_t1,'dw_servadx_hg_postgres')
		else
			cambia_dw(dw_t1,'dw_servadx_hg')
		end if
		//pos,label,nivel,padre,hijos,apdx,fecha,contador,clug,llave3,llave4,sllave3,sllave4
		if dw_t1.retrieve(contador,clug)>0 then
			setitem(row,'hijos',getitemnumber(row,'hijos') + dw_t1.rowcount())
			for j=1 to dw_t1.rowcount()
				temp=dw_t1.getitemstring(j,'cod_cups')+ ' - '+dw_t1.getitemstring(j,'descripcion')
				cambia_dw(dw_temp2,'dw_imags_diags')
				hijos=dw_temp2.retrieve(dw_t1.getitemstring(j,'coddoc'),dw_t1.getitemstring(j,'clugar_res'),dw_t1.getitemnumber(j,'nrepor'),dw_t1.getitemnumber(j,'item'))
				sumar=1+event inserta(sumar,temp,1,getitemnumber(row,'fila'),hijos,'x',fecha,contador,clug,dw_t1.getitemnumber(j,'nrepor'),dw_t1.getitemnumber(j,'item'),dw_t1.getitemstring(j,'coddoc'),dw_t1.getitemstring(j,'clugar_res'))//apdx			
				padre[1]=sumar -1
				for k=1 to hijos
					sumar=1+event inserta(sumar,'Imagen '+string(dw_temp2.getitemnumber(k,'nro_imag'))+': '+string(dw_temp2.getitemnumber(k,'nro_notas'))+' nota(s)',2,getitemnumber(padre[1],'fila'),0,'i',fecha,contador,clug,dw_t1.getitemnumber(j,'nrepor'),dw_t1.getitemnumber(j,'item'),dw_t1.getitemstring(j,'coddoc'),dw_t1.getitemstring(j,'clugar_res'))//imag apdx			
					setitem(sumar -1,'nimag',dw_temp2.getitemnumber(k,'nro_imag'))
				next
			next
		end if
	case '2','3','4','7'   //urg,hosp,amb
		setitem(row,'hijos',0)
//		sumar=1+event inserta(sumar,'Evolución',1,getitemnumber(row,'fila'),0,'E',fecha,contador,clug,nulo,nulo,snulo,snulo)//Ordenes de SerVicio en hosp
//		sumar=1+event inserta(sumar,'Ordenes Médicas',1,getitemnumber(row,'fila'),0,'D',fecha,contador,clug,nulo,nulo,snulo,snulo)//Ordenes de SerVicio en hosp
		if g_motor='postgres' then
			cambia_dw(dw_t1,'dw_os_hg_postgres')
		else
			cambia_dw(dw_t1,'dw_os_hg')
		end if
		if dw_t1.retrieve(contador,clug)>0 then
			setitem(row,'hijos',getitemnumber(row,'hijos')+1)
			hijos=dw_t1.rowcount()
			padre[1]=event inserta(sumar,string(hijos)+' Orden(es) de Servicio',1,getitemnumber(row,'fila'),hijos,'V',fecha,contador,clug,nulo,nulo,snulo,snulo)//Ordenes de SerVicio en hosp
			sumar=padre[1]+1
			for j=1 to hijos
				sumar=1+event inserta(sumar,'Orden '+string(dw_t1.getitemnumber(j,'nsolicitud')),2,getitemnumber(padre[1],'fila'),0,'v',fecha,contador,clug,dw_t1.getitemnumber(j,'nsolicitud'),nulo,snulo,snulo)//Ordenes de SerVicio en hosp
			next
		end if
		cambia_dw(dw_t1,'dw_ing_apdx_hg')
		if dw_t1.retrieve(contador,clug)>0 then
			setitem(row,'hijos',getitemnumber(row,'hijos')+1)
			hijos=dw_t1.rowcount()
			padre[1]=event inserta(sumar,'Apoyo Diagnóstico',1,getitemnumber(row,'fila'),hijos,'G',fecha,contador,clug,nulo,nulo,snulo,snulo)//apdx en hosp
			sumar=padre[1]+1
			for j=1 to hijos
				if g_motor='postgres' then
					cambia_dw(dw_temp2,'dw_servadx2_hg_postgres')
				else
					cambia_dw(dw_temp2,'dw_servadx2_hg')
				end if
				if dw_temp2.retrieve(contador,clugar,dw_t1.getitemnumber(j,'ningreso'))>0 then
					padre[2]=event inserta(sumar,dw_t1.getitemstring(j,'descripciongc'),2,getitemnumber(padre[1],'fila'),dw_temp2.rowcount(),'g',fecha,contador,clug,dw_t1.getitemnumber(j,'ningreso'),nulo,snulo,snulo)//apdx en hosp
					sumar=padre[2]+1
					for k=1 to dw_temp2.rowcount()
						sumar=1+event inserta(sumar,dw_temp2.getitemstring(k,'cod_cups')+ ' - '+dw_temp2.getitemstring(k,'descripcion'),3,getitemnumber(padre[2],'fila'),0,'x',fecha,contador,clug,dw_temp2.getitemnumber(k,'nrepor'),dw_temp2.getitemnumber(k,'item'),dw_temp2.getitemstring(k,'coddoc'),dw_temp2.getitemstring(k,'clugar_res'))
					next
				end if
			next
		end if
		cambia_dw(dw_t1,'dw_plantillas_x_ing')
		if dw_t1.retrieve(contador,clug)>0 then
			setitem(row,'hijos',getitemnumber(row,'hijos')+1)
			padre[1]=event inserta(sumar,'Registro Médico',1,getitemnumber(row,'fila'),dw_t1.rowcount(),'P',fecha,contador,clug,nulo,nulo,snulo,snulo)//P lantillas
			sumar=padre[1]+1
			for j=1 to dw_t1.rowcount()
//				f = event inserta(sumar,dw_t1.getitemstring(j,'desplantilla') +' '+ dw_t1.getitemstring(j,'ingre'),2,getitemnumber(padre[1],'fila'),0,'p',fecha,contador,clug,nulo,nulo,dw_t1.getitemstring(j,'codplantilla'),snulo)//plantilla
				f = event inserta(sumar,dw_t1.getitemstring(j,'desplantilla') +' '+dw_t1.getitemstring(j,'ingre'),2,getitemnumber(padre[1],'fila'),0,'p',fecha,contador,clug,nulo,nulo,snulo,snulo)//plantilla
				if f > 0 then
					SetItem(f,'tipo',dw_t1.GetItemString(j,'tipo'))
					SetItem(f,'codtingre',dw_t1.GetItemString(j,'codtingre'))
					SetItem(f,'ingreso',dw_t1.GetItemString(j,'ingreso'))
					SetItem(f,'nactoqx',dw_t1.GetItemNumber(j,'numero_ingre'))
					SetItem(f,'clugar_qx',dw_t1.GetItemString(j,'clugar_qx'))
				end if
				sumar = f + 1
			next
		end if
		cambia_dw(dw_t1,'dw_actosqx_hg')
		if dw_t1.retrieve(contador,clug)>0 then
			setitem(row,'hijos',getitemnumber(row,'hijos')+1)
			padre[1]=event inserta(sumar,'Actos Quirúrgicos',1,getitemnumber(row,'fila'),dw_t1.rowcount(),'Q',fecha,contador,clug,nulo,nulo,snulo,snulo)//P lantillas
			sumar=padre[1]+1
			for j=1 to dw_t1.rowcount()
				PADRE[2]=event inserta(sumar ,'Acto ' +string(dw_t1.getitemnumber(j,'numero_ingre')),2,getitemnumber(padre[1],'fila'),2,'q',fecha,contador,clug,dw_t1.getitemnumber(j,'numero_ingre'),nulo,dw_t1.getitemstring(j,'clugar'),snulo)//q lantilla
				sumar=padre[2]+1
					sumar=1+event inserta(sumar ,'Notas Quirúrgicas ' ,3,getitemnumber(padre[2],'fila'),0,'N',fecha,contador,clug,dw_t1.getitemnumber(j,'numero_ingre'),nulo,dw_t1.getitemstring(j,'clugar'),snulo)//
					sumar=1+event inserta(sumar,'Notas Anestesiológicas ' ,3,getitemnumber(padre[2],'fila'),0,'n',fecha,contador,clug,dw_t1.getitemnumber(j,'numero_ingre'),nulo,dw_t1.getitemstring(j,'clugar'),snulo)//
					cambia_dw(dw_temp2,'dw_det_actoqx_hg')
					if dw_temp2.retrieve(dw_t1.getitemnumber(j,'numero_ingre'),dw_t1.getitemstring(j,'clugar'))>0 then
						setitem(padre[2],'hijos',getitemnumber(padre[2],'hijos')+1)
						padre[3]=event inserta(sumar,'Procedimientos' ,3,getitemnumber(padre[2],'fila'),dw_temp2.rowcount(),'Y',fecha,contador,clug,dw_t1.getitemnumber(j,'numero_ingre'),nulo,dw_t1.getitemstring(j,'clugar'),snulo)//
						sumar=padre[3]+1
						for l=1 to dw_temp2.rowcount()
							padre[4]=event inserta(sumar,dw_temp2.getitemstring(l,'cod_cups')+' - '+dw_temp2.getitemstring(l,'descripcion') ,4,getitemnumber(padre[3],'fila'),0,'y',fecha,contador,clug,dw_t1.getitemnumber(j,'numero_ingre'),dw_temp2.getitemnumber(l,'consecutivo'),dw_t1.getitemstring(j,'clugar'),snulo)//
							sumar=padre[4]+1
							cambia_dw(dw_t3,'dw_qxos_hg')
							if dw_t3.retrieve(dw_t1.getitemnumber(j,'numero_ingre'),dw_t1.getitemstring(j,'clugar'),dw_temp2.getitemnumber(l,'consecutivo'))>0 then
								setitem(padre[4],'hijos',1)
								padre[5]=event inserta(sumar ,'Ordenes',5,getitemnumber(padre[4],'fila'),dw_t3.rowcount(),'R',fecha,contador,clug,dw_t1.getitemnumber(j,'numero_ingre'),dw_temp2.getitemnumber(l,'consecutivo'),dw_t1.getitemstring(j,'clugar'),snulo)//
								sumar=padre[5]+1
								long nn,yy,zz,bb
								string aa
								for m=1 to dw_t3.rowcount()
									nn=dw_t3.getitemnumber(m,'nsolicitud')
									yy=dw_t1.getitemnumber(j,'numero_ingre')
									zz=dw_temp2.getitemnumber(l,'consecutivo')
									aa=dw_t1.getitemstring(j,'clugar')
									bb=dw_t3.getitemnumber(m,'nsolicitud')
									sumar=1+event inserta(sumar,'Orden '+string(nn),6,getitemnumber(padre[5],'fila'),0,'r',fecha,contador,clug,yy,zz,aa,string(bb))
								next
							end if
						next
					end if
			next
		end if
	case '0' //cons.ext
		sumar=event crea_hijos_cext(contador,clug,row,fecha,0)
	case '5'//odont
		sumar=event crea_hijos_cext(contador,clug,row,fecha,0)
		long ntrat,nodon
		string clug_trat,clug_odon
		select ntratamiento,clugar,nodontograma,clugar_ocb
		into :ntrat,:clug_trat,:nodon,:clug_odon from odontratacab
		where contador=:contador and clugar_his=:clug;
		setitem(row,'hijos',getitemnumber(row,'hijos')+1)
		padre[1]=event inserta(sumar,'Tratamiento',1,getitemnumber(row,'fila'),2,'T',fecha,contador,clug,ntrat,nulo,clug_trat,snulo)
		sumar=padre[1]+1
		sumar=1+event inserta(sumar,'Odontograma',2,getitemnumber(padre[1],'fila'),0,'t',fecha,contador,clug,nodon,nulo,clug_odon,snulo)
		padre[2]=event inserta(sumar,'Ingresos',2,getitemnumber(padre[1],'fila'),0,'I',fecha,contador,clug,nulo,nulo,snulo,snulo)
		sumar=padre[2]+1
//		cambia_dw(dw_temp2,'dw_ingresos_odon_hg')
		cambia_dw(dw_temp,'dw_ingresos_odon_hg')
		long cont
		string clu
//		if dw_temp2.retrieve(contador,clug)>0 then
		if dw_temp.retrieve(contador,clug)>0 then
			//setitem(padre[2],'hijos',dw_temp2.rowcount())
			setitem(padre[2],'hijos',dw_temp.rowcount())
			for j=1 to dw_temp.rowcount()
				cont=dw_temp.getitemnumber(j,'contador')
				clu=dw_temp.getitemstring(j,'clugar')
				sumar=1+event inserta(sumar,string(dw_temp.getitemdatetime(j,'fecha')),3,getitemnumber(padre[2],'fila'),0,'0',fecha,cont,clu,nulo,nulo,snulo,snulo)
				sumar=event crea_hijos_cext(cont,clu,sumar -1,dw_temp.getitemdatetime(j,'fecha'),3)
			next
		end if
	CASE 'B' //banco de fluidos
		cambia_dw(dw_temp2,'dw_banco_bolsas')
		if dw_temp2.retrieve(clug,contador)>0 then
			setitem(row,'hijos',1)
			sumar=1+event inserta(row +1 ,'Productos Obtenidos',1,getitemnumber(row,'fila'),0,'f',fecha,contador,clug,nulo,nulo,snulo,snulo)			
		end if
	case '6' //pyp
		sumar=event crea_hijos_cext(contador,clug,row,fecha,0)
end choose
if getitemstring(row,'indapdx')<>'B' then
	cambia_dw(dw_t1,'dw_facts_x_ing')
	if dw_t1.retrieve(contador,clug)>0 then
		setitem(row,'hijos',getitemnumber(row,'hijos')+1)
		sumar=event inserta(sumar  ,'Facturas',1,getitemnumber(row,'fila'),dw_t1.rowcount(),'F',fecha,contador,clug,nulo,nulo,snulo,snulo)//facturas	
		padre[1]=sumar
		for j=1 to dw_t1.rowcount()
			sumar=event inserta(sumar+1,string(dw_t1.getitemnumber(j,'nfactura'))+dw_t1.getitemstring(j,'tipo_fac')+' - '+dw_t1.getitemstring(j,'empresa')+' ('+string(dw_t1.getitemdatetime(j,'fecha'),'dd/mm/yyyy')+')',2,getitemnumber(padre[1],'fila'),0,'ñ',fecha,contador,clug,dw_t1.getitemnumber(j,'nfactura'),nulo,dw_t1.getitemstring(j,'clugar_fac'),dw_t1.getitemstring(j,'tipo_fac'))
		next
	end if
end if

end event

event p_rowfocuschanged();blob texto
long llave
string sllave,grabado,snulo=''
choose case getitemstring(getrow(),'indapdx')
	case '0'
		cambia_dw(dw_temp,'dw_res_consext')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'S'
		cambia_dw(dw_temp,'dw_serv_ing_res')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'O'
		cambia_dw(dw_temp,'dw_ordserv_resu')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'M'
		cambia_dw(dw_temp,'dw_formula_resu')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'llave3'))
		mostrar('D')
	case 'e'
		cambia_dw(dw_temp,'dw_ordservdet_resu')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'llave3'))
		mostrar('D')
	case 's'
		if g_motor='postgres' then
			cambia_dw(dw_temp,'dw_serving_det_postgres')
		else
			cambia_dw(dw_temp,'dw_serving_det')
		end if
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'llave3'))
		mostrar('D')
	case 'o'
		cambia_dw(dw_temp,'dw_det_os_form')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'llave3'))
		mostrar('D')
	case 'P'
		cambia_dw(dw_temp,'dw_plantillas_x_ing')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case '1' //apdx
		if g_motor='postgres' then 
			cambia_dw(dw_temp,'dw_servadx_hg_postgres')
		else
			cambia_dw(dw_temp,'dw_servadx_hg')
		end if
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'x' 
		cambia_dw(dw_temp,'dw_xa_resul_hg')
		dw_temp.retrieve(getitemstring(getrow(),'llave_s3'),getitemstring(getrow(),'llave_s4'),getitemnumber(getrow(),'llave3'),getitemnumber(getrow(),'llave4'))
		mostrar('D')
	case 'V' //ordenes de serVicio en hosp
		if g_motor='postgres' then
			cambia_dw(dw_t1,'dw_os_hg_postgres')
		else
			cambia_dw(dw_t1,'dw_os_hg')
		end if
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'v' //ordenes de serVicio en hosp
		cambia_dw(dw_temp,'dw_os_det_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'llave3'))
		mostrar('D')
	case 'G' //
		cambia_dw(dw_temp,'dw_ing_apdx_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'g' //
		cambia_dw(dw_temp,'dw_servadx2_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'llave3'))
		mostrar('D')
	case 'Q' //actos qx
		cambia_dw(dw_temp,'dw_actosqx_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'Y' //
		if g_motor='postgres' then
			cambia_dw(dw_temp,'dw_det_actoqx_hg_postgres')			
		else
			cambia_dw(dw_temp,'dw_det_actoqx_hg')
		end if
		dw_temp.retrieve(getitemnumber(getrow(),'llave3'),getitemstring(getrow(),'llave_s3'))
		mostrar('D')
	case 'R' //
		cambia_dw(dw_temp,'dw_qxos_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'llave3'),getitemstring(getrow(),'llave_s3'),getitemnumber(getrow(),'llave4'))
		mostrar('D')
	case 'N'
		setpointer(hourglass!)
		w_principal.SetMicroHelp ( 'Leyendo' )
		llave=getitemnumber(getrow(),'llave3')
		sllave=getitemstring(getrow(),'llave_s3')
		sqlca.autocommit=true
		selectblob notasqx into :texto from qxcabacto where numero_ingre=:llave and clugar=:sllave;
		sqlca.autocommit=false
		grabado=string(texto)
		if isnull(grabado) then grabado=""
		i_cambia_rte=true
		w_principal.SetMicroHelp ( 'Dando Formato' )
		f_pega_a_rtf(rte_1,grabado,3)
		w_principal.SetMicroHelp ( 'Gestión Clínica Integrada' )
		mostrar('R')
	case 'n'
		setpointer(hourglass!)
		w_principal.SetMicroHelp ( 'Leyendo' )
		llave=getitemnumber(getrow(),'llave3')
		sllave=getitemstring(getrow(),'llave_s3')
		sqlca.autocommit=true
		selectblob notas_ane into :texto from qxcabacto where numero_ingre=:llave and clugar=:sllave;
		sqlca.autocommit=false
		grabado=string(texto)
		if isnull(grabado) then grabado=""
		i_cambia_rte=true
		w_principal.SetMicroHelp ( 'Dando Formato' )
		f_pega_a_rtf(rte_1,grabado,3)
		w_principal.SetMicroHelp ( 'Gestión Clínica Integrada' )
		mostrar('R')
	case 'E'
		setpointer(hourglass!)
		w_principal.SetMicroHelp ( 'Leyendo' )
		llave=getitemnumber(getrow(),'contador')
		sllave=getitemstring(getrow(),'clugar')
		sqlca.autocommit=true
		selectblob evolucion into :texto from evolucionhc where contador=:llave and clugar=:sllave;
		sqlca.autocommit=false
		grabado=string(texto)
		if isnull(grabado) then grabado=""
		i_cambia_rte=true
		w_principal.SetMicroHelp ( 'Dando Formato' )
		f_pega_a_rtf(rte_1,grabado,3)
		w_principal.SetMicroHelp ( 'Gestión Clínica Integrada' )
		mostrar('R')
	case 'D'//ordenes medicas
		setpointer(hourglass!)
		w_principal.SetMicroHelp ( 'Leyendo' )
		llave=getitemnumber(getrow(),'contador')
		sllave=getitemstring(getrow(),'clugar')
		sqlca.autocommit=true
		selectblob ordenes into :texto from evolucionhc where contador=:llave and clugar=:sllave;
		sqlca.autocommit=false
		grabado=string(texto)
		if isnull(grabado) then grabado=""
		i_cambia_rte=true
		w_principal.SetMicroHelp ( 'Dando Formato' )
		f_pega_a_rtf(rte_1,grabado,3)
		w_principal.SetMicroHelp ( 'Gestión Clínica Integrada' )
		mostrar('R')
	case 'y'
		if g_motor='postgres' then
			cambia_dw(dw_temp,'dw_res_procqx_hg_postgres')	
		else
			cambia_dw(dw_temp,'dw_res_procqx_hg')
		end if		
		dw_temp.retrieve(getitemnumber(getrow(),'llave3'),getitemstring(getrow(),'llave_s3'),getitemnumber(getrow(),'llave4'))
		mostrar('D')
	case 'p'
		uo_1.reset()
		uo_1.retrieve(getitemnumber(getrow(),'contador'), getitemstring(getrow(),'clugar'),getitemstring(getrow(),'tipo'),getItemString(getrow(),'codtingre'),getItemString(getrow(),'ingreso'),snulo,snulo,snulo,snulo,getItemNumber(getrow(),'nactoqx'),getItemString(getrow(),'clugar_qx'),'','')
		mostrar('A')	
	case 'q'
		cambia_dw(dw_temp,'dw_res_actoqx_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'llave3'),getitemstring(getrow(),'llave_s3'))
		mostrar('D')
	case '2','3','4','7'
		cambia_dw(dw_temp,'dw_admision_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'r'
		cambia_dw(dw_temp,'dw_osqx_det_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'llave3'),getitemstring(getrow(),'llave_s3'),getitemnumber(getrow(),'llave4'),long(getitemstring(getrow(),'llave_s4')))
		mostrar('D')
	case 'I'
		cambia_dw(dw_temp,'dw_ingresos_odon_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'T'//tratamiento odontologico
		cambia_dw(dw_temp,'dw_tratamientocpo_hg')
		dw_temp.retrieve(getitemnumber(getrow(),'llave3'),getitemstring(getrow(),'llave_s3'))
		mostrar('D')
	case 't' //odontograma
		uo_odon.reset()
		uo_odon.retrieve(getitemnumber(getrow(),'llave3'),getitemstring(getrow(),'llave_s3'))
		mostrar('O')
	case 'B' //banco de fluidos
		cambia_dw(dw_temp,'dw_banco_resu')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'f'
		cambia_dw(dw_temp,'dw_banco_bolsas')
		dw_temp.modify('proced_descripcion.protect="1"')
		dw_temp.retrieve(getitemstring(getrow(),'clugar'),getitemnumber(getrow(),'contador'))
		mostrar('D')
	case 'F'
		cambia_dw(dw_temp,'dw_facts_x_ing')
		dw_temp.retrieve(getitemnumber(getrow(),'contador'),getitemstring(getrow(),'clugar'))
		mostrar('D')
	case 'ñ' //facturas
		if getitemstring(getrow(),'llave_s4')='C' then
			if f_lee_rep_dw('FC',getitemstring(getrow(),'llave_s3'),'Factura',dw_temp)=-1 then return
		End If
		if getitemstring(getrow(),'llave_s4')='F' then 
			if f_lee_rep_dw('FV',getitemstring(getrow(),'llave_s3'),'Factura',dw_temp)=-1 then return	
		End If
			
		dw_temp.retrieve(getitemnumber(getrow(),'llave3'),'1',getitemstring(getrow(),'llave_s3'),getitemstring(getrow(),'llave_s4'))
		mostrar('D')
	case 'i' //imagen de apdx
		uo_2.mostrar_foto(getitemstring(getrow(),'llave_s3'),getitemstring(getrow(),'llave_s4'),getitemnumber(getrow(),'llave3'),getitemnumber(getrow(),'llave4'),getitemnumber(getrow(),'nimag'))
		mostrar('I')
	case else
		dw_temp.visible=false
		rte_1.visible=false
		uo_1.visible=false
end choose
end event

event type long crea_hijos_cext(long contador, string clug, long row, datetime fecha, integer nivel);long ld_j,padre[],sumar,nulo, f
string temp,snulo
sumar=row +1
cambia_dw(dw_t1,'dw_serv_ing_res')
if dw_t1.retrieve(contador,clug)>0 then
	setitem(row,'hijos',1)
	padre[1]=event inserta(sumar,'Servicios',nivel+1,getitemnumber(row,'fila'),dw_t1.rowcount(),'S',fecha,contador,clug,nulo,nulo,snulo,snulo)
	sumar=padre[1]+1
	for ld_j=1 to dw_t1.rowcount()
		if not isnull(string(dw_t1.getitemnumber(ld_j,'nfactura'))) then
			temp=dw_t1.getitemstring(ld_j,'cod_cups')+ ' - '+dw_t1.getitemstring(ld_j,'descripcion')+' - '+string(dw_t1.getitemnumber(ld_j,'nfactura'))
		else
			temp=dw_t1.getitemstring(ld_j,'cod_cups')+ ' - '+dw_t1.getitemstring(ld_j,'descripcion')
		end if
		sumar=1+event inserta(sumar,temp,nivel+2,getitemnumber(padre[1],'fila'),0,'s',fecha,contador,clug,dw_t1.getitemnumber(ld_j,'nservicio'),nulo,snulo,snulo)
	next
end if
cambia_dw(dw_t1,'dw_plantillas_x_ing')
if dw_t1.retrieve(contador,clug)>0 then
	setitem(row,'hijos',getitemnumber(row,'hijos')+1)
	padre[1]=event inserta(sumar,'Registro Médico',nivel+1,getitemnumber(row,'fila'),dw_t1.rowcount(),'P',fecha,contador,clug,nulo,nulo,snulo,snulo)//P lantillas
	sumar=padre[1]+1
	for ld_j=1 to dw_t1.rowcount()
		f = event inserta(sumar,dw_t1.getitemstring(ld_j,'desplantilla')+' '+dw_t1.getitemstring(ld_j,'ingre'),nivel+2,getitemnumber(padre[1],'fila'),0,'p',fecha,contador,clug,nulo,nulo,snulo,snulo)//p lantilla
		if f > 0 then
			SetItem(f,'tipo',dw_t1.GetItemString(ld_j,'tipo'))
			SetItem(f,'codtingre',dw_t1.GetItemString(ld_j,'codtingre'))
			SetItem(f,'ingreso',dw_t1.GetItemString(ld_j,'ingreso'))
			SetItem(f,'nactoqx',dw_t1.GetItemNumber(ld_j,'numero_ingre'))
			SetItem(f,'clugar_qx',dw_t1.GetItemString(ld_j,'clugar_qx'))
		end if
		sumar = f + 1
	next
end if
cambia_dw(dw_t1,'dw_ordserv_resu')
if dw_t1.retrieve(contador,clug)>0 then
	setitem(row,'hijos',getitemnumber(row,'hijos')+1)
	padre[1]=event inserta(sumar,'Ordenes',nivel+1,getitemnumber(row,'fila'),dw_t1.rowcount(),'O',fecha,contador,clug,nulo,nulo,snulo,snulo)//O rdenes
	sumar=padre[1]+1
	for ld_j=1 to dw_t1.rowcount()
		padre[2]=event inserta(sumar,'Orden '+string(dw_t1.getitemnumber(ld_j,'nsolicitud')),nivel+2,getitemnumber(padre[1],'fila'),0,'o',fecha,contador,clug,dw_t1.getitemnumber(ld_j,'nsolicitud'),nulo,snulo,snulo)//o rden
		sumar=padre[2]+1
		cambia_dw(dw_temp2,'dw_formula_resu')
		if dw_temp2.retrieve(contador,clug,dw_t1.getitemnumber(ld_j,'nsolicitud'))>0 then
			setitem(padre[2],'hijos',1)
			sumar=1+event inserta(sumar,'Medicamentos',nivel+3,getitemnumber(padre[2],'fila'),0,'M',fecha,contador,clug,dw_t1.getitemnumber(ld_j,'nsolicitud'),nulo,snulo,snulo)
		end if
		cambia_dw(dw_temp2,'dw_ordservdet_resu')
		if dw_temp2.retrieve(contador,clug,dw_t1.getitemnumber(ld_j,'nsolicitud'))>0 then
			setitem(padre[2],'hijos',getitemnumber(padre[2],'hijos')+1)
			sumar=1 +event inserta(sumar ,'Examenes',nivel+3,getitemnumber(padre[2],'fila'),0,'e',fecha,contador,clug,dw_t1.getitemnumber(ld_j,'nsolicitud'),nulo,snulo,snulo)
		end if
	next
end if
return sumar
end event

event constructor;settransobject(sqlca)
end event

event doubleclicked;if row<1 then return
if dwo.type='datawindow' then return
setredraw(false)
if getitemnumber(row,'est_revisa')=0 then event crea_hijos(row)
if getitemnumber(row,'hijos')=0 then 
	setredraw(true)
	return
end if
if getitemstring(row,'estado')='1' then
	event rec_mostrar(row,row,0)
	setitem(row,'estado','0')
else
	event rec_mostrar(row,row,1)
	setitem(row,'estado','1')
end if
setredraw(true)
end event

event retrieveend;if rowcount=0 then return
string temp
long recorre
for recorre=1 to rowcount
	temp=string(getitemdatetime(recorre,'fecha'),'dd/mm/yyyy')+' - ('
	setitem(recorre,'fila',recorre)
	choose case getitemstring(recorre,'indapdx')
		case '0'
			temp+='Consulta Externa)'
			setitem(recorre,'label',temp)
			setitem(recorre,'hijos',3)
		case '1'
			if isnull(getitemstring(recorre,'descripciongc')) then 
				temp+='Consulta Externa)'
			else
				temp+=getitemstring(recorre,'descripciongc')+')'				
			end if
			setitem(recorre,'label',temp)
		case '2'
			temp+='Urgencias)'
			setitem(recorre,'label',temp)
		case '3'
			temp+='Hospitalización)'
			setitem(recorre,'label',temp)
		case '4'
			temp+='Ambulatorio)'
			setitem(recorre,'label',temp)
		case '5'
			temp+='Odontología)'
			setitem(recorre,'label',temp)
		case '6'
			temp+='Promoción y Prevención)'
			setitem(recorre,'label',temp)
		case 'B' //banco de sangre
			temp+=getitemstring(recorre,'descripciongc')+')'
			setitem(recorre,'label',temp)
		case '7'
				temp+='Uci)'
				setitem(recorre,'label',temp)
	end choose
next
end event

event clicked;if dwo.type='datawindow' then return
if dwo.name='mas' then
	long donde
	donde=getrow()
	if getitemnumber(row,'hijos')=0 then return
	setredraw(false)
	if getitemnumber(row,'est_revisa')=0 then event crea_hijos(row)
	if getitemstring(row,'estado')='1' then
		event rec_mostrar(row,row,0)
		setitem(row,'estado','0')
	else
		event rec_mostrar(row,row,1)
		setitem(row,'estado','1')
	end if 
	setredraw(true)
	return
end if
if row>0 then
	if row<>getrow() then scrolltorow(row)
end if

end event

event rowfocuschanged;if currentrow<1 then return
timer(0.5)
end event

type dw_temp2 from datawindow within w_imag_diag
boolean visible = false
integer x = 3291
integer y = 408
integer width = 123
integer height = 76
integer taborder = 70
boolean enabled = false
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_imag_diag
boolean visible = false
integer x = 3342
integer y = 284
integer width = 78
integer height = 84
integer taborder = 30
boolean enabled = false
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean focusonbuttondown = true
boolean powertips = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tp_2 tp_2
end type

on tab_1.create
this.tp_2=create tp_2
this.Control[]={this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_2)
end on

type tp_2 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 16
integer width = 41
integer height = -44
boolean enabled = false
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "conf_pag.ico"
long picturemaskcolor = 536870912
string powertiptext = "Ver la imagen ampliada"
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type

on tp_2.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on tp_2.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

type pb_2 from picturebutton within tp_2
integer x = 5
integer y = 168
integer width = 110
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
boolean originalsize = true
alignment htextalign = left!
end type

type pb_1 from picturebutton within tp_2
integer y = 20
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "atras.gif"
alignment htextalign = left!
string powertiptext = "Volver a Resumen"
end type

event clicked;tab_1.selectedtab=1
tab_1.tp_2.enabled=false
tab_1.width=864
w_imag_diag.vscrollbar=true
end event

type dw_1 from datawindow within tp_2
integer x = 151
integer y = 12
integer width = 3017
integer height = 1764
integer taborder = 20
string title = "none"
string dataobject = "dw_prueba"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_vertical from statictext within w_imag_diag
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
integer x = 1042
integer y = 152
integer width = 18
integer height = 912
string dragicon = "Exclamation!"
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeWE!"
long textcolor = 255
long backcolor = 255
long bordercolor = 276856960
boolean focusrectangle = false
end type

event mousemove;If KeyDown(keyLeftButton!) Then
	X = Parent.PointerX()
End If

end event

event mouseup;parent.setredraw(false)
mover(x)
BackColor = parent.backcolor
dw_histo.setfocus()
parent.setredraw(true)
end event

event mousedown;SetPosition(ToTop!)
BackColor = 0  // Show Bar in Black while being moved.

end event

event constructor;backcolor=parent.backcolor
end event

type rte_1 from richtextedit within w_imag_diag
event p_undo ( boolean p_cambiar )
boolean visible = false
integer x = 1083
integer y = 156
integer width = 1888
integer height = 812
integer taborder = 20
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_headerfooter = true
long init_leftmargin = 2000
long init_topmargin = 1000
long init_rightmargin = 2000
long init_bottommargin = 1000
boolean init_displayonly = true
borderstyle borderstyle = stylelowered!
end type

event p_undo(boolean p_cambiar);if not p_cambiar then undo()
this.modified=false
i_cambia_rte=false
end event

event key;return f_rte_key(this,keyflags,key)
end event

event modified;//post event p_undo(i_cambia_rte)
end event

type uo_odon from uo_odontograma within w_imag_diag
boolean visible = false
integer x = 1193
integer y = 136
integer width = 992
integer height = 776
integer taborder = 60
boolean hscrollbar = true
end type

on uo_odon.destroy
call uo_odontograma::destroy
end on

type uo_1 from uo_hclin within w_imag_diag
boolean visible = false
integer x = 1079
integer y = 148
integer width = 3419
integer height = 1608
integer taborder = 70
boolean enabled = true
boolean i_displayonly = true
end type

on uo_1.destroy
call uo_hclin::destroy
end on

type dw_temp from datawindow within w_imag_diag
event mousemove pbm_dwnmousemove
boolean visible = false
integer x = 1079
integer y = 152
integer width = 1957
integer height = 1600
integer taborder = 40
string title = "none"
string dataobject = "dw_plantillas_x_ing"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;if dwo.type='text' and long(Object.DataWindow.Processing)=1 then 
	if long(Object.DataWindow.Grid.Lines)=1 then Object.DataWindow.Grid.Lines=0
else
	if long(Object.DataWindow.Grid.Lines)=0 then Object.DataWindow.Grid.Lines=1
end if
dw_barra.event mousemove(0,0,1,dw_barra.object.datawindow)
end event

