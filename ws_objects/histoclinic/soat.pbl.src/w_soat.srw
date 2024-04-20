$PBExportHeader$w_soat.srw
forward
global type w_soat from window
end type
type dw_his_acu from datawindow within w_soat
end type
type barra2 from hprogressbar within w_soat
end type
type tab_2 from tab within w_soat
end type
type t1 from userobject within tab_2
end type
type dw_acumcab_todo from datawindow within t1
end type
type t1 from userobject within tab_2
dw_acumcab_todo dw_acumcab_todo
end type
type t2 from userobject within tab_2
end type
type st_5 from statictext within t2
end type
type pb_print from pb_report within t2
end type
type st_4 from statictext within t2
end type
type st_2 from statictext within t2
end type
type pb_guarda_acum from picturebutton within t2
end type
type pb_borra from picturebutton within t2
end type
type pb_aumen from picturebutton within t2
end type
type dw_2 from datawindow within t2
end type
type mle_1 from multilineedit within t2
end type
type t2 from userobject within tab_2
st_5 st_5
pb_print pb_print
st_4 st_4
st_2 st_2
pb_guarda_acum pb_guarda_acum
pb_borra pb_borra
pb_aumen pb_aumen
dw_2 dw_2
mle_1 mle_1
end type
type tab_2 from tab within w_soat
t1 t1
t2 t2
end type
type tab_1 from tab within w_soat
end type
type tp_1 from userobject within tab_1
end type
type pb_save from picturebutton within tp_1
end type
type pb_del from picturebutton within tp_1
end type
type pb_1 from picturebutton within tp_1
end type
type dw_1 from datawindow within tp_1
end type
type st_1 from statictext within tp_1
end type
type tp_1 from userobject within tab_1
pb_save pb_save
pb_del pb_del
pb_1 pb_1
dw_1 dw_1
st_1 st_1
end type
type tp_2 from userobject within tab_1
end type
type pb_futran from pb_report within tp_2
end type
type pb_print_viejo from pb_report within tp_2
end type
type st_3 from statictext within tp_2
end type
type dw_histo from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_futran pb_futran
pb_print_viejo pb_print_viejo
st_3 st_3
dw_histo dw_histo
end type
type tab_1 from tab within w_soat
tp_1 tp_1
tp_2 tp_2
end type
type pb_3 from picturebutton within w_soat
end type
type pb_2 from picturebutton within w_soat
end type
type dw_3 from datawindow within w_soat
end type
end forward

global type w_soat from window
integer width = 4389
integer height = 2612
boolean titlebar = true
string title = "Registro de Accidente para SOAT"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "StopSign!"
boolean clientedge = true
boolean center = true
dw_his_acu dw_his_acu
barra2 barra2
tab_2 tab_2
tab_1 tab_1
pb_3 pb_3
pb_2 pb_2
dw_3 dw_3
end type
global w_soat w_soat

type variables
int xant,yant
string emp1,cont1,clugar_soat1
long consec_soat1
datawindowchild dw_ciudad,idw_ciudad2,idw_ciudad3
st_soat st
end variables

forward prototypes
public function integer valida (string p_asegura)
end prototypes

public function integer valida (string p_asegura);tab_2.t1.dw_acumcab_todo.accepttext()
string marca


//Accidente
if ( isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'sitio_acc'))) or( len(tab_2.t1.dw_acumcab_todo.getitemstring(1,'sitio_acc'))<3) then
	messagebox('Atención','Sitio Accidente es Obligatorio')
	return -1
end if
if isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'ocu_peaton')) then
	messagebox('Atención','Condición Accidente es Obligatorio')
	return -1
end if
if isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'zona')) then
	messagebox('Atención','Zona es Obligatorio')
	return -1
end if
if isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'cdepto')) then
	messagebox('Atención','Departamento Accidente es Obligatorio')
	return -1
end if
if isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'codciudad')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'codciudad'))='' then
	messagebox('Atención','Ciudad Accidente es Obligatorio')
	return -1
end if

//vehiculo
if p_asegura<>'3' then
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'marca')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'marca'))='' or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'marca'))='-') and (p_asegura='1' or p_asegura='2' or p_asegura='4'  ) then
		messagebox('Atención','Marca es Obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'placa_acc')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'placa_acc'))='') and (p_asegura='1' or p_asegura='2' or p_asegura='4' or p_asegura='5' ) then
		messagebox('Atención','Placa es Obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tipo_vehi')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tipo_vehi'))='') and (p_asegura='1' or p_asegura='2' or p_asegura='4' or p_asegura='5' ) then
		messagebox('Atención','Tipo Vehiculo es Obligatorio')
		return -1
	end if
	if isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'cod_asegura')) then
		messagebox('Atención','El Código de la p_asegurara es Obligatorio')
		return -1
	end if
	
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'cod_asegura')) ) and (p_asegura='1' or p_asegura='4' ) then
		messagebox('Atención','p_asegurara es Obligatorio')
		return -1
	end if
	if (isnull(string(tab_2.t1.dw_acumcab_todo.GetItemDateTime(1,'desde'))) or trim(string(tab_2.t1.dw_acumcab_todo.GetItemDateTime(1,'desde')))='') and (p_asegura='1' or p_asegura='4' ) then
		messagebox('Atención','Desde es Obligatorio')
		return -1
	end if
	if (isnull(string(tab_2.t1.dw_acumcab_todo.GetItemDateTime(1,'fecha_termina'))) or trim(string(tab_2.t1.dw_acumcab_todo.GetItemDateTime(1,'fecha_termina')))='' ) and (p_asegura='1' or p_asegura='4' ) then
		messagebox('Atención','Hasta es Obligatorio')
		return -1
	end if
	
	//Propietario
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tdoc_prop')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tdoc_prop'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' ) then
		messagebox('Atención','El tipodoc del Propietario es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'docu_prop')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'docu_prop'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' ) then
		messagebox('Atención','Documento del Propietario es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'ape1_prop')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'ape1_prop'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' ) then
		messagebox('Atención','Apellido 1 del Propietario es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'nom1_prop')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'nom1_prop'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' ) then
		messagebox('Atención','Nombre 1 del Propietario es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'depart_prop')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'depart_prop'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' ) then
		messagebox('Atención','Departamento del Propietario es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'ciudad_prop')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'ciudad_prop'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' ) then
		messagebox('Atención','Ciudad del Propietario es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'direcc_prop')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'direcc_prop'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' ) then
		messagebox('Atención','Direccion del Propietario es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tel_prop')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tel_prop'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' ) then
		messagebox('Atención','Teléfono del Propietario es obligatorio')
		return -1
	end if
	
	//Conductor
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tdoc_cond')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tdoc_cond'))='')  and (p_asegura='1' or p_asegura='2'  or p_asegura='4' )  then
		messagebox('Atención','El tipodoc del conductor es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'docu_cond')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'docu_cond'))='')  and (p_asegura='1' or p_asegura='2'  or p_asegura='4' ) then
		messagebox('Atención','El documento del conductor es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'apellidos_cond')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'apellidos_cond'))='')  and (p_asegura='1' or p_asegura='2'  or p_asegura='4' )  then
		messagebox('Atención','El primer apellido del conductor es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'nombres_cond')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'nombres_cond'))='')  and (p_asegura='1' or p_asegura='2'  or p_asegura='4' )  then
		messagebox('Atención','El primer nombre del conductor es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'direcc_cond')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'direcc_cond'))='')  and (p_asegura='1' or p_asegura='2'  or p_asegura='4' )  then
		messagebox('Atención','La dirección del conductor es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'depart_cond')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'depart_cond'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' )  then
		messagebox('Atención','El Departamento del conductor es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'ciudad_cond')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'ciudad_cond'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' )  then
		messagebox('Atención','La Ciudad del conductor es obligatorio')
		return -1
	end if
	if (isnull(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tel_cond')) or trim(tab_2.t1.dw_acumcab_todo.getitemstring(1,'tel_cond'))='') and (p_asegura='1' or p_asegura='2'  or p_asegura='4' )  then
		messagebox('Atención','Teléfono del conductor es obligatorio')
		return -1
	end if
end if
return 1
end function

on w_soat.create
this.dw_his_acu=create dw_his_acu
this.barra2=create barra2
this.tab_2=create tab_2
this.tab_1=create tab_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.dw_3=create dw_3
this.Control[]={this.dw_his_acu,&
this.barra2,&
this.tab_2,&
this.tab_1,&
this.pb_3,&
this.pb_2,&
this.dw_3}
end on

on w_soat.destroy
destroy(this.dw_his_acu)
destroy(this.barra2)
destroy(this.tab_2)
destroy(this.tab_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.dw_3)
end on

event open;st=message.powerobjectparm
if tab_1.tp_1.dw_1.retrieve(tipdoc,docu,st.newemp,st.newcont) <=0 then
	if not isnull(st.nsoat) then 
		tab_1.tp_1.pb_1.enabled=false
		tab_1.tp_1.dw_1.setfilter("consecutivo="+string(st.nsoat)+" and clugar='"+st.clug_soat+"'")
		tab_1.tp_1.dw_1.filter()
	else
		if st.v_nsoat<>0 then
			tab_2.t1.dw_acumcab_todo.reset()
			tab_2.t1.dw_acumcab_todo.insertrow(1)
		end if
	end if
end if

end event

type dw_his_acu from datawindow within w_soat
boolean visible = false
integer x = 4137
integer y = 1372
integer width = 160
integer height = 256
integer taborder = 60
string title = "none"
string dataobject = "dw_historial_acumcab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type barra2 from hprogressbar within w_soat
integer x = 3250
integer y = 552
integer width = 786
integer height = 48
unsignedinteger maxposition = 100
integer setstep = 10
end type

type tab_2 from tab within w_soat
event create ( )
event destroy ( )
integer x = 37
integer y = 520
integer width = 4096
integer height = 1972
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
t1 t1
t2 t2
end type

on tab_2.create
this.t1=create t1
this.t2=create t2
this.Control[]={this.t1,&
this.t2}
end on

on tab_2.destroy
destroy(this.t1)
destroy(this.t2)
end on

type t1 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4059
integer height = 1844
long backcolor = 67108864
string text = "Datos Generales"
long tabtextcolor = 33554432
string picturename = "campos.ico"
long picturemaskcolor = 536870912
string powertiptext = "Datos del Accidente, Conductor y Dueño del vehículo"
dw_acumcab_todo dw_acumcab_todo
end type

on t1.create
this.dw_acumcab_todo=create dw_acumcab_todo
this.Control[]={this.dw_acumcab_todo}
end on

on t1.destroy
destroy(this.dw_acumcab_todo)
end on

type dw_acumcab_todo from datawindow within t1
integer x = 32
integer width = 4009
integer height = 1848
integer taborder = 50
string title = "none"
string dataobject = "dw_acumcab_todo"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild("codciudad",dw_ciudad)
dw_ciudad.settransobject(sqlca)
getchild("ciudad_prop",idw_ciudad2)
idw_ciudad2.settransobject(sqlca)
getchild("ciudad_cond",idw_ciudad3)
idw_ciudad3.settransobject(sqlca)
end event

event itemchanged;this.accepttext()
tab_1.tp_1.pb_save.enabled=true
choose case dwo.name
	case 'asegurado'
		if data<>'1' or data<>'4'  then
			messagebox("Atención","Eliminará datos del formulario esta Seguro?",question!,OK!,1)
			date fechas
			string nulos
			setnull(fechas)
			setnull(nulos)
			setitem(1,"desde",fechas)
			setitem(1,"fecha_termina",fechas)
			setitem(1,"cod_asegura",'')
			setitem(1,"npoliza",'')
			if data='3' or data='5' then
				if data='3' THEN
					setitem(1,"marca",nulos)
					setitem(1,"tipo_vehi",nulos)
					setitem(1,"placa_acc",nulos)
				end If
				setitem(1,"tdoc_prop",nulos)
				setitem(1,"docu_prop",nulos)
				setitem(1,"ape1_prop",nulos)
				setitem(1,"ape2_prop",nulos)
				setitem(1,"nom1_prop",nulos)
				setitem(1,"nom2_prop",nulos)
				setitem(1,"depart_prop",nulos)
				setitem(1,"ciudad_prop",nulos)
				setitem(1,"direcc_prop",nulos)
				setitem(1,"tel_prop",nulos)
				//conductor
				setitem(1,"tdoc_cond",nulos)
				setitem(1,"docu_cond",nulos)
				setitem(1,"apellidos_cond",nulos)
				setitem(1,"ape2_cond",nulos)
				setitem(1,"nombres_cond",nulos)
				setitem(1,"nom2_cond",nulos)
				setitem(1,"depart_cond",nulos)
				setitem(1,"ciudad_cond",nulos)
				setitem(1,"direcc_cond",nulos)
				setitem(1,"tel_cond",nulos)
			end if
		end if
	case 'cdepto' 
		setitem(1,"codciudad",'')
		dw_ciudad.retrieve(data)
	case 'depart_cond'
		setitem(1,"ciudad_cond",'')
		idw_ciudad3.retrieve(data)
	case 'depart_prop'
		setitem(1,"ciudad_prop",'')
		idw_ciudad2.retrieve(data)
	case 'desde'
		date fecha,hasta
		fecha=date(left(data,10))
		hasta=relativedate(fecha,364)
		setitem(row,'fecha_termina',hasta)
	case  'docu_prop'
		string l_td,l_doc,l_n1,l_n2,l_a1,l_a2,l_dep,l_ciu,l_dir,l_tel
		l_td=getitemstring(row,'tdoc_prop')
		l_doc=getitemstring(row,'docu_prop')
		SELECT Nombre1, Nombre2, Apellido1, Apellido2, CDepto, CCiudad, Direccion, Tel
		INTO :l_n1,:l_n2,:l_a1,:l_a2,:l_dep,:l_ciu,:l_dir,:l_tel
		FROM Pacientes
		WHERE (((Pacientes.TipoDoc)=:l_td) AND ((Pacientes.Documento)=:l_doc));
		setitem(1,"ape1_prop",l_a1)
		setitem(1,"ape2_prop",l_a2)
		setitem(1,"nom1_prop",l_n1)
		setitem(1,"nom2_prop",l_n2)
		setitem(1,"depart_prop",l_dep)
		setitem(1,"ciudad_prop",l_ciu)
		setitem(1,"direcc_prop",l_dir)
		setitem(1,"tel_prop",l_tel)	 
	case  'docu_cond'
		l_td=getitemstring(row,'tdoc_cond')
		l_doc=getitemstring(row,'docu_cond')
		SELECT Nombre1, Nombre2, Apellido1, Apellido2, CDepto, CCiudad, Direccion, Tel
		INTO :l_n1,:l_n2,:l_a1,:l_a2,:l_dep,:l_ciu,:l_dir,:l_tel
		FROM Pacientes
		WHERE (((Pacientes.TipoDoc)=:l_td) AND ((Pacientes.Documento)=:l_doc));
		setitem(1,"apellidos_cond",l_a1)
		setitem(1,"ape2_cond",l_a2)
		setitem(1,"nombres_cond",l_n1)
		setitem(1,"nom2_cond",l_n2)
		setitem(1,"depart_cond",l_dep)
		setitem(1,"ciudad_cond",l_ciu)
		setitem(1,"direcc_cond",l_dir)
		setitem(1,"tel_cond",l_tel)	
end choose
end event

event retrieveend;if rowcount=0 then return
dw_ciudad.retrieve(getitemstring(1,"cdepto"))
idw_ciudad2.retrieve(getitemstring(1,"depart_prop"))
idw_ciudad3.retrieve(getitemstring(1,"depart_cond"))

end event

type t2 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4059
integer height = 1844
long backcolor = 67108864
string text = "Detalles"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Descripción del accidente y detalle de los cargo a la póliza"
st_5 st_5
pb_print pb_print
st_4 st_4
st_2 st_2
pb_guarda_acum pb_guarda_acum
pb_borra pb_borra
pb_aumen pb_aumen
dw_2 dw_2
mle_1 mle_1
end type

on t2.create
this.st_5=create st_5
this.pb_print=create pb_print
this.st_4=create st_4
this.st_2=create st_2
this.pb_guarda_acum=create pb_guarda_acum
this.pb_borra=create pb_borra
this.pb_aumen=create pb_aumen
this.dw_2=create dw_2
this.mle_1=create mle_1
this.Control[]={this.st_5,&
this.pb_print,&
this.st_4,&
this.st_2,&
this.pb_guarda_acum,&
this.pb_borra,&
this.pb_aumen,&
this.dw_2,&
this.mle_1}
end on

on t2.destroy
destroy(this.st_5)
destroy(this.pb_print)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.pb_guarda_acum)
destroy(this.pb_borra)
destroy(this.pb_aumen)
destroy(this.dw_2)
destroy(this.mle_1)
end on

type st_5 from statictext within t2
integer x = 55
integer y = 696
integer width = 590
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción Accidente"
boolean focusrectangle = false
end type

type pb_print from pb_report within t2
integer x = 3849
integer y = 492
integer taborder = 80
string powertiptext = "Imprimir Furips"
string cod_rep = "SO"
string nombre_rep = "Reporte Soat"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_2.rowcount() =0 then return
any par[3]
par[1]=dw_2.getitemnumber(dw_2.getrow(),'nfact')
par[2]=dw_2.getitemstring(dw_2.getrow(),'clugar_fac')
par[3]=dw_2.getitemstring(dw_2.getrow(),'tipo_fac')
imprimir(par,'ips_gci','0')
end event

type st_4 from statictext within t2
integer x = 46
integer y = 572
integer width = 713
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Breve descripción del accidente:"
boolean focusrectangle = false
end type

type st_2 from statictext within t2
integer x = 37
integer y = 24
integer width = 512
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Acumulado:"
boolean focusrectangle = false
end type

type pb_guarda_acum from picturebutton within t2
event mousemove pbm_mousemove
string tag = "Guardar Acumulado"
integer x = 3849
integer y = 352
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                               "
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
end type

event clicked;if dw_2.rowcount()=0 then return
dwItemStatus ojo
ojo=dw_2.getitemstatus(1,0,primary!)
if ojo<>new! and ojo<>newmodified! then return
dw_2.accepttext()
real va
va=dw_2.getitemnumber(1,"total")
tab_2.t1.dw_acumcab_todo.setitem(1,"valor",va)
if dw_2.update()=-1 then
	rollback;
else
	if tab_2.t1.dw_acumcab_todo.update()=-1 then
		rollback;
	else
		commit;
		tab_1.tp_1.dw_1.setitem(tab_1.tp_1.dw_1.getrow(),"valor",va)
	end if
end if

end event

type pb_borra from picturebutton within t2
event mousemove pbm_mousemove
string tag = "Borrar Acumulado"
integer x = 3849
integer y = 212
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
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_2.rowcount()<=0 Then return
if not isnull(dw_2.getitemnumber(dw_2.getrow(),"nfact")) then
	messagebox("Atención","Este registro es de una factura del sistema, no puede borrarlo, solo puede anular la factura para cambiar el acumulado")	
	return
end if
dwItemStatus ojo
ojo=dw_2.getitemstatus(dw_2.getrow(),0,primary!)
if ojo=new! or ojo=newmodified! then
	dw_2.deleterow(dw_2.getrow())
else
	real va
	dw_2.setitem(dw_2.getrow(),'estado','1')
	if dw_2.update()=-1 then
		rollback;
	else
		va=dw_2.getitemnumber(1,"total")
		tab_2.t1.dw_acumcab_todo.setitem(1,"valor",va)
		if tab_2.t1.dw_acumcab_todo.update()=-1 then
			rollback;
		else
			commit;
			tab_1.tp_1.dw_1.setitem(tab_1.tp_1.dw_1.getrow(),"valor",va)
		end if	
	end if
end if


end event

type pb_aumen from picturebutton within t2
event mousemove pbm_mousemove
string tag = "Insertar Acumulado Previo"
integer x = 3849
integer y = 76
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
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;dw_2.insertrow(1)
dw_2.setitem(1,"consecutivo",tab_2.t1.dw_acumcab_todo.getitemnumber(1,"consecutivo"))
dw_2.setitem(1,"clugar",tab_2.t1.dw_acumcab_todo.getitemstring(1,"clugar"))
dw_2.setitem(1,"item",dw_2.rowcount())
dw_2.setitemstatus(1,0,primary!,new!)
end event

type dw_2 from datawindow within t2
integer x = 41
integer y = 76
integer width = 3730
integer height = 608
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_acumdeta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

event itemchanged;this.accepttext()
end event

type mle_1 from multilineedit within t2
integer x = 46
integer y = 776
integer width = 3717
integer height = 872
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event modified;tab_1.tp_1.pb_save.enabled=true
end event

type tab_1 from tab within w_soat
event create ( )
event destroy ( )
integer x = 32
integer width = 4293
integer height = 512
integer taborder = 10
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean showtext = false
tabposition tabposition = tabsonright!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 4146
integer height = 480
long backcolor = 67108864
string text = "Polizas"
long tabtextcolor = 33554432
string picturename = "poliza.ico"
long picturemaskcolor = 536870912
string powertiptext = "Pólizas que posee el Paciente"
pb_save pb_save
pb_del pb_del
pb_1 pb_1
dw_1 dw_1
st_1 st_1
end type

on tp_1.create
this.pb_save=create pb_save
this.pb_del=create pb_del
this.pb_1=create pb_1
this.dw_1=create dw_1
this.st_1=create st_1
this.Control[]={this.pb_save,&
this.pb_del,&
this.pb_1,&
this.dw_1,&
this.st_1}
end on

on tp_1.destroy
destroy(this.pb_save)
destroy(this.pb_del)
destroy(this.pb_1)
destroy(this.dw_1)
destroy(this.st_1)
end on

type pb_save from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 3904
integer y = 272
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Nueva Poliza/Accidente"
end type

event clicked;long consec
string clug_consec

if valida( tab_2.t1.dw_acumcab_todo.getitemstring(1,'asegurado'))=-1 then return
if isnull(tab_2.t1.dw_acumcab_todo.getitemnumber(1,"consecutivo")) then
	setnull(consec)
	select max(consecutivo) into :consec from acumcab where clugar=:clugar;
	if isnull(consec) then consec=0
	consec++
	tab_2.t1.dw_acumcab_todo.setitem(1,"consecutivo",consec)
end if
consec=tab_2.t1.dw_acumcab_todo.getitemnumber(1,"consecutivo")
clug_consec=tab_2.t1.dw_acumcab_todo.getitemstring(1,"clugar")
if tab_2.t1.dw_acumcab_todo.update()=-1 then
	rollback;
	return
else
	commit;
end if
if tab_2.t2.mle_1.text<>'' and not isnull(tab_2.t2.mle_1.text) then
	blob texto
	texto=blob(tab_2.t2.mle_1.text)
	sqlca.autocommit=true
	updateblob acumcab set informe =:texto where consecutivo=:consec and clugar=:clug_consec;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando informe",sqlca.sqlerrtext)
		sqlca.autocommit=false
		rollback;
		return
	end if
	sqlca.autocommit=false
end if
commit;
pb_1.enabled=true
enabled=false
dw_1.retrieve(tipdoc,docu,st.newemp,st.newcont)
dw_1.scrolltorow(1)
tab_2.t2.pb_borra.enabled=true
tab_2.t2.pb_guarda_acum.enabled=true
end event

type pb_del from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 3904
integer y = 148
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Poliza/Accidente"
end type

event clicked;if tab_2.t2.dw_2.rowcount()>0 then
	messagebox("Atención","Esta póliza ya tiene facturas cargadas, no la puede borrar")
else
	if dw_1.rowcount()>1 then
		dw_1.deleterow(0)
		if dw_1.update()=-1 then 
			rollback;
		else
			commit;
		end if
	end if
end if
end event

type pb_1 from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 3904
integer y = 20
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Nueva Poliza/Accidente"
end type

event clicked;long falta
string asegu,cod_furips

setnull(falta)
tab_2.t1.dw_acumcab_todo.reset()
tab_2.t1.dw_acumcab_todo.insertrow(1)
if isnull(st.nsoat) and st.v_nsoat<>0 then
	dw_3.retrieve(st.v_nsoat,st.vclug_soat)
	dw_3.RowsCopy(dw_3.GetRow(), dw_3.RowCount(), Primary!, tab_2.t1.dw_acumcab_todo, 1, Primary!)
end if 
tab_2.t1.dw_acumcab_todo.setitem(1,"consecutivo",falta)
tab_2.t1.dw_acumcab_todo.setitem(1,"clugar",clugar)
tab_2.t1.dw_acumcab_todo.setitem(1,"descontrato",'')
tab_2.t1.dw_acumcab_todo.setitem(1,"fecha",datetime(today()))
tab_2.t1.dw_acumcab_todo.setitem(1,"valor",0)
tab_2.t1.dw_acumcab_todo.setitem(1,"tipodoc",tipdoc)
tab_2.t1.dw_acumcab_todo.setitem(1,"documento",docu)
tab_2.t1.dw_acumcab_todo.setitem(1,"cemp",st.newemp)
tab_2.t1.dw_acumcab_todo.setitem(1,"ccontrato",st.newcont)
tab_2.t1.dw_acumcab_todo.setitem(1,"estado",'1')
SELECT contratos.vtopefijo, Empresa.DesEmp,empresa.cod_furips INTO :falta,:asegu,:cod_furips
FROM contratos INNER JOIN Empresa ON contratos.CodEmp = Empresa.CodEmp
WHERE (((contratos.codemp)=:st.newemp) AND ((contratos.codcontrato)=:st.newcont));
tab_2.t1.dw_acumcab_todo.setitem(1,"npoliza",'')
tab_2.t1.dw_acumcab_todo.setitem(1,"nombre_seguro",asegu)
tab_2.t1.dw_acumcab_todo.setitem(1,"vpendiente",falta)
if isnull(cod_furips) then
	setnull(cod_furips)
	tab_2.t1.dw_acumcab_todo.setitem(1,"cod_asegura",cod_furips)
	Messagebox('Atención','Esta Aseguradora no tiene codigo Furips Favor verifique con Administrador')
else
	tab_2.t1.dw_acumcab_todo.setitem(1,"cod_asegura",cod_furips)
end if

this.enabled=false
pb_save.enabled=true
tab_2.t2.dw_2.reset()
tab_2.t1.dw_acumcab_todo.setfocus()
tab_2.t2.pb_aumen.enabled=false
tab_2.t2.pb_borra.enabled=false
tab_2.t2.pb_guarda_acum.enabled=false

end event

type dw_1 from datawindow within tp_1
integer y = 68
integer width = 3863
integer height = 388
integer taborder = 30
string title = "none"
string dataobject = "dw_acumcab"
boolean border = false
end type

event constructor;settransobject(sqlca)

end event

event doubleclicked;long fila,j,rows
fila=this.getrow()
if fila<1 then return
if not isnull(st.nsoat) then 
	close(w_soat)
	return
end if
if pb_save.enabled then
	messagebox("Atención","No ha guardado el registro")
	return
end if
if this.getitemstring(fila,"estado")<>'1' then
	messagebox("Atención","Esta póliza ya no puede ser utilizada")
	return
end if
if valida(tab_2.t1.dw_acumcab_todo.getitemstring(1,'asegurado'))=-1 then return
st.clug_soat=dw_1.getitemstring(fila,"clugar")
st.nsoat=dw_1.getitemnumber(fila,"consecutivo")
message.stringparm='!'
closewithreturn(w_soat,st)

end event

event itemchanged;pb_save.enabled=true
end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

event rowfocuschanged;long fila,consec
string clug_consec
fila=getrow()
if fila<1 then return
consec=getitemnumber(fila,"consecutivo")
clug_consec=getitemstring(fila,"clugar")
if dw_ciudad.rowcount()=0 then dw_ciudad.insertrow(1)
tab_2.t1.dw_acumcab_todo.reset()
tab_2.t1.dw_acumcab_todo.retrieve(consec,clug_consec)
tab_1.tp_2.dw_histo.retrieve(consec,clug_consec)
tab_2.t2.dw_2.retrieve(consec,clug_consec)
blob texto
sqlca.autocommit=true
selectblob informe into :texto from acumcab where consecutivo=:consec and clugar=:clug_consec ;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo Relato Breve(informe)",sqlca.sqlerrtext)
	sqlca.autocommit=false
	barra2.visible=false
	return 1
end if
sqlca.autocommit=false
tab_2.t2.mle_1.text=string(texto)
barra2.position=100
barra2.visible=false
end event

type st_1 from statictext within tp_1
integer x = 14
integer width = 3858
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "El paciente tiene las siguientes Pólizas, seleccione una para realizar los cargos a esta: (Si no posee alguna debe adicionala)"
boolean focusrectangle = false
end type

type tp_2 from userobject within tab_1
integer x = 18
integer y = 16
integer width = 4146
integer height = 480
long backcolor = 67108864
string text = "Imprimir"
long tabtextcolor = 33554432
string picturename = "print.ico"
long picturemaskcolor = 536870912
string powertiptext = "Impresión del reporte según Ingresos"
pb_futran pb_futran
pb_print_viejo pb_print_viejo
st_3 st_3
dw_histo dw_histo
end type

on tp_2.create
this.pb_futran=create pb_futran
this.pb_print_viejo=create pb_print_viejo
this.st_3=create st_3
this.dw_histo=create dw_histo
this.Control[]={this.pb_futran,&
this.pb_print_viejo,&
this.st_3,&
this.dw_histo}
end on

on tp_2.destroy
destroy(this.pb_futran)
destroy(this.pb_print_viejo)
destroy(this.st_3)
destroy(this.dw_histo)
end on

type pb_futran from pb_report within tp_2
integer x = 3899
integer y = 56
integer taborder = 70
string picturename = "print3.gif"
string disabledname = "d_print3.gif"
string cod_rep = "FUTR"
string nombre_rep = "Reporte Futrans"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if tab_1.tp_1.dw_1.getrow()<1 or dw_histo.rowcount()<1 then return
any par[4]
par[1]=tab_1.tp_1.dw_1.getitemnumber(tab_1.tp_1.dw_1.getrow(),"consecutivo")
par[2]=tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),"clugar")
par[3]=dw_histo.getitemnumber(dw_histo.getrow(),'contador')
par[4]=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
imprimir(par,'ips_gci','0')

end event

type pb_print_viejo from pb_report within tp_2
boolean visible = false
integer x = 3899
integer y = 192
integer taborder = 50
boolean enabled = false
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir Furips"
string cod_rep = "SO"
string nombre_rep = "Reporte Soat"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if tab_1.tp_1.dw_1.getrow()<1 or dw_histo.rowcount()<1 then return
any par[4]
par[1]=tab_1.tp_1.dw_1.getitemnumber(tab_1.tp_1.dw_1.getrow(),"consecutivo")
par[2]=tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),"clugar")
par[3]=dw_histo.getitemnumber(dw_histo.getrow(),'contador')
par[4]=dw_histo.getitemstring(dw_histo.getrow(),'clugar')
imprimir(par,'Imprime Furips','0')

end event

type st_3 from statictext within tp_2
integer x = 14
integer width = 686
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresos Cargados a la Póliza"
boolean focusrectangle = false
end type

type dw_histo from datawindow within tp_2
integer x = 14
integer y = 56
integer width = 3831
integer height = 392
integer taborder = 50
string title = "none"
string dataobject = "dw_histo_soat"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;if rowcount>0 then
	long fila
	fila=find('contador='+string(st.contador)+' and clugar="'+st.clug_his+'"',1,rowcount)
	if fila>0 then 
		setitem(fila,'actual','1')
		scrolltorow(fila)
	end if
end if
end event

event constructor;settransobject(sqlca)
end event

type pb_3 from picturebutton within w_soat
event mousemove pbm_mousemove
integer x = 4155
integer y = 788
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
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;closewithreturn(parent,"!")
end event

type pb_2 from picturebutton within w_soat
event mousemove pbm_mousemove
integer x = 4160
integer y = 636
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "              &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;tab_1.tp_1.dw_1.triggerevent(doubleclicked!)
end event

type dw_3 from datawindow within w_soat
boolean visible = false
integer x = 4178
integer y = 1016
integer width = 169
integer height = 136
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_acumcab_todo_copy"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

