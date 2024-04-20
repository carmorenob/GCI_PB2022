$PBExportHeader$w_empresas.srw
forward
global type w_empresas from window
end type
type dw_1 from datawindow within w_empresas
end type
type pb_3 from picturebutton within w_empresas
end type
type pb_2 from picturebutton within w_empresas
end type
type pb_1 from picturebutton within w_empresas
end type
type tab_1 from tab within w_empresas
end type
type tabpage_1 from userobject within tab_1
end type
type dw_empresas from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_empresas dw_empresas
end type
type tabpage_3 from userobject within tab_1
end type
type pb_4 from picturebutton within tabpage_3
end type
type dw_2 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
pb_4 pb_4
dw_2 dw_2
end type
type tabpage_2 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_3 dw_3
end type
type tab_1 from tab within w_empresas
tabpage_1 tabpage_1
tabpage_3 tabpage_3
tabpage_2 tabpage_2
end type
end forward

global type w_empresas from window
integer width = 2944
integer height = 1296
boolean titlebar = true
string title = "Aseguradoras de Salud"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "respon.ico"
boolean center = true
dw_1 dw_1
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
tab_1 tab_1
end type
global w_empresas w_empresas

type variables
datawindowchild docus,ciudad
string emp

end variables

on w_empresas.create
this.dw_1=create dw_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.tab_1=create tab_1
this.Control[]={this.dw_1,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.tab_1}
end on

on w_empresas.destroy
destroy(this.dw_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.tab_1)
end on

event open;tab_1.tabpage_1.dw_empresas.GetChild('cciudad', ciudad)
ciudad.settransobject(sqlca)
ciudad.retrieve()

tab_1.tabpage_1.dw_empresas.getchild("desciudad",docus)
docus.settransobject(sqlca)
docus.InsertRow(0)

end event

type dw_1 from datawindow within w_empresas
integer x = 50
integer y = 28
integer width = 2107
integer height = 124
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_empresa"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(SQLCA)
insertrow(0)

end event

event itemchanged;accepttext()
emp = this.getitemstring(this.getrow(),'codemp')
tab_1.tabpage_1.dw_empresas.retrieve(emp)
tab_1.tabpage_2.dw_3.retrieve(emp)
tab_1.tabpage_3.dw_2.retrieve(emp)
end event

type pb_3 from picturebutton within w_empresas
string tag = "Buscar"
integer x = 2203
integer y = 16
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "buscar.GIF"
alignment htextalign = left!
end type

event clicked;open(w_busqueda_empresa)
end event

type pb_2 from picturebutton within w_empresas
string tag = "Guardar"
integer x = 2693
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar2.gif"
alignment htextalign = left!
end type

event clicked;if tab_1.tabpage_1.dw_empresas.rowcount()>0 then
	long fila
	fila=tab_1.tabpage_1.dw_empresas.getrow()
	if isnull(tab_1.tabpage_1.dw_empresas.getitemstring(fila,"tipodoc"))  or tab_1.tabpage_1.dw_empresas.getitemstring(fila,"tipodoc")='' then
		messagebox('Atención','Campo tipo doc es obligatorio')
		return -1
	end if
	if isnull(tab_1.tabpage_1.dw_empresas.getitemstring(fila,"nit")) or tab_1.tabpage_1.dw_empresas.getitemstring(fila,"nit")=''  then
		messagebox('Atención','Campo Documento es obligatorio')
		return -1
	end if
	if isnull(tab_1.tabpage_1.dw_empresas.getitemstring(fila,"desemp")) or tab_1.tabpage_1.dw_empresas.getitemstring(fila,"desemp")='' then 
		messagebox('Atención','Campo Nombre es obligatorio')
		return -1
	end if
	if isnull(tab_1.tabpage_1.dw_empresas.getitemstring(fila,"direccion")) or tab_1.tabpage_1.dw_empresas.getitemstring(fila,"direccion")='' then
		messagebox('Atención','Campo direccion es obligatorio')
		return -1
	end if
	if isnull(tab_1.tabpage_1.dw_empresas.getitemstring(fila,"telefono1")) or tab_1.tabpage_1.dw_empresas.getitemstring(fila,"telefono1")='' then
		messagebox('Atención','Campo Telefono 1 es obligatorio')
		return -1
	end if	
	if isnull(tab_1.tabpage_1.dw_empresas.getitemstring(fila,"cdepto")) or tab_1.tabpage_1.dw_empresas.getitemstring(fila,"cdepto")='' then
		messagebox('Atención','Campo Departamento es obligatorio')
		return -1
	end if		
	if isnull(tab_1.tabpage_1.dw_empresas.getitemstring(fila,"desciudad")) or tab_1.tabpage_1.dw_empresas.getitemstring(fila,"desciudad")='' then
		messagebox('Atención','Campo Ciudad es obligatorio')
		return -1
	end if			
	if tab_1.tabpage_3.dw_2.rowcount()=0 then
		messagebox('Atención','Campo Codigo Super es obligatorio')
		return -1
	end if			
	tab_1.tabpage_1.dw_empresas.update()
	
	
	if tab_1.tabpage_3.dw_2.rowcount()>0 then  tab_1.tabpage_3.dw_2.update()

	if tab_1.tabpage_2.dw_3.rowcount()>0 then 
		for fila = 1 to tab_1.tabpage_2.dw_3.rowcount()
			tab_1.tabpage_2.dw_3.setitem(fila ,'codemp',emp)
		next
		tab_1.tabpage_2.dw_3.update()
	end if 	
	commit;
	dw_1.retrieve()
	dw_1.setitem(1,1,emp)
end if

end event

type pb_1 from picturebutton within w_empresas
string tag = "Adicionar"
integer x = 2528
integer y = 16
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Empresa"
end type

event clicked;int maxi,donde

SELECT Max(cast(EMPRESA.CODEMP as integer))  into :maxi
FROM EMPRESA;

if isnull(maxi) then maxi=0
maxi=maxi+1
donde = tab_1.tabpage_1.dw_empresas.insertrow(0)
tab_1.tabpage_1.dw_empresas.setitem(donde,'codemp',string(maxi))
tab_1.tabpage_1.dw_empresas.setitem(donde,'estado','1')
donde = tab_1.tabpage_2.dw_3.insertrow(0)
tab_1.tabpage_2.dw_3.setitem(donde,'codemp',string(maxi))

emp=string(maxi)
end event

type tab_1 from tab within w_empresas
integer x = 41
integer y = 184
integer width = 2821
integer height = 988
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
tabpage_1 tabpage_1
tabpage_3 tabpage_3
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_3=create tabpage_3
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_3,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_3)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2784
integer height = 860
long backcolor = 67108864
string text = "Generales"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
dw_empresas dw_empresas
end type

on tabpage_1.create
this.dw_empresas=create dw_empresas
this.Control[]={this.dw_empresas}
end on

on tabpage_1.destroy
destroy(this.dw_empresas)
end on

type dw_empresas from datawindow within tabpage_1
integer x = 46
integer y = 32
integer width = 2688
integer height = 764
integer taborder = 20
string title = "none"
string dataobject = "dw_empresa_basicos"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string depto,ciud,nul
setnull(nul)
tab_1.tabpage_1.dw_empresas.accepttext()
depto=tab_1.tabpage_1.dw_empresas.getitemstring(1,"cdepto")
ciud=tab_1.tabpage_1.dw_empresas.getitemstring(1,"cciudad")
CHOOSE CASE tab_1.tabpage_1.dw_empresas.getcolumnname()
		case 'cdepto' 
			accepttext()
			setitem(getrow(),'desciudad',nul)
			setitem(getrow(),'cciudad',nul)
			docus.retrieve(getitemstring(getrow(),'cdepto'))
	CASE "correo_dian"
		if not match(data,'^[a-zA-Z0-9][a-zA-Z\0-9\-_\.]*[^.]\@[^.][a-zA-Z\0-9\-_\.]+\.[a-zA-Z\0-9\-_\.]*[a-zA-Z\0-9]+$') then
			tab_1.tabpage_1.dw_empresas.setitem(1,"email",nul)
				messagebox('Atención','No cumple condiciones para email')
			return 1
		end if
	CASE "nit"
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc,dir,t1,t2,fa,cd,cc
		tdoc=getitemstring(getrow(),"tipodoc")
		if isnull(tdoc) then
			setnull(nul)
			setitem(getrow(),"nit",nul)
			setcolumn("tipodoc")
			return 1
		end if
		doc=gettext()
		setnull(persona)
		SELECT Dverificacion, Persona, nombre1, nombre2, apellido1, APELLIDO2, razon_social,direccion,tel1,tel2,fax,cdpto,cciudad
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc,:dir,:t1,:t2,:fa,:cd,:cc
		FROM TERCEROS
		WHERE TipoDoc=:tdoc AND documento=:doc;
		if isnull(persona) then
			if messagebox("Atención","Este Tercero no se encuentra, desea crearlo?",question!,yesno!,2)=2 then
				settext(getitemstring(getrow(),getcolumn()))
				return 1
			else
				st_general messObj
				messObj.valor = getitemstring(getrow(),'tipodoc')
				messObj.documento = doc
				messObj.dw_obj =tab_1.tabpage_1.dw_empresas
				openwithparm(w_cfgterceros, messObj)
				if message.stringparm='' then 
					settext(getitemstring(getrow(),getcolumn()))
					return 1
				end if
			end if
		else
			setitem(getrow(),"dverificacion",dverif)
			setitem(getrow(),"nombre1",nom1)
			setitem(getrow(),"nombre2",nom2)
			setitem(getrow(),"apellido1",ape1)
			setitem(getrow(),"apellido2",ape2)
			setitem(getrow(),"razon_social",rsoc)
			setitem(getrow(),"persona",persona)
			setitem(getrow(),"direccion",dir)
			setitem(getrow(),"telefono1",t1)
			setitem(getrow(),"telefono2",t2)
			setitem(getrow(),"fax",fa)	
			setitem(getrow(),"fax",fa)	
			setitem(getrow(),"fax",fa)	
			setitem(getrow(),"cdepto",cd)
			setitem(getrow(),"cciudad",cc)	
		end if
		setitem(getrow(),"desemp",tab_1.tabpage_1.dw_empresas.getitemstring(getrow(),"terc"))
		docus.retrieve(getitemstring(getrow(),'cdepto'))
	case 'desciudad'
		setitem(getrow(),'cciudad',docus.getitemstring(docus.getrow(),'codciudad'))	
END CHOOSE
tab_1.tabpage_1.dw_empresas.accepttext()
tab_1.tabpage_2.dw_3.accepttext()
end event

event constructor;settransobject(SQLCA)
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2784
integer height = 860
long backcolor = 67108864
string text = "Código RIPS"
long tabtextcolor = 33554432
string picturename = "contratos.ico"
long picturemaskcolor = 536870912
pb_4 pb_4
dw_2 dw_2
end type

on tabpage_3.create
this.pb_4=create pb_4
this.dw_2=create dw_2
this.Control[]={this.pb_4,&
this.dw_2}
end on

on tabpage_3.destroy
destroy(this.pb_4)
destroy(this.dw_2)
end on

type pb_4 from picturebutton within tabpage_3
integer x = 2578
integer y = 36
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
string powertiptext = "Insertar Rips"
end type

event clicked;int ld
ld = dw_2.insertrow(0)
dw_2.setitem(ld,'codemp',tab_1.tabpage_1.dw_empresas.getitemstring(tab_1.tabpage_1.dw_empresas.getrow(),'codemp'))

end event

type dw_2 from datawindow within tabpage_3
integer x = 69
integer y = 36
integer width = 2455
integer height = 788
integer taborder = 40
string title = "none"
string dataobject = "dw_empresas_rips"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(SQLCA)
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2784
integer height = 860
long backcolor = 67108864
string text = "Autorizaciones"
long tabtextcolor = 33554432
string picturename = "configura.ico"
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tabpage_2.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_2.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_2
integer x = 46
integer y = 56
integer width = 2697
integer height = 672
integer taborder = 30
string title = "none"
string dataobject = "dw_empresa_autorizaciones"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(SQLCA)
end event

event itemchanged;string nul
setnull(nul)
CHOOSE CASE tab_1.tabpage_2.dw_3.getcolumnname()
	CASE "correo_urg"
		if not match(data,'^[a-zA-Z0-9][a-zA-Z\0-9\-_\.]*[^.]\@[^.][a-zA-Z\0-9\-_\.]+\.[a-zA-Z\0-9\-_\.]*[a-zA-Z\0-9]+$') then
			tab_1.tabpage_2.dw_3.setitem(1,"correo_urg",nul)
				messagebox('Atención','No cumple condiciones para email')
			return 1
		end if
	CASE "correo_cext"
		if not match(data,'^[a-zA-Z0-9][a-zA-Z\0-9\-_\.]*[^.]\@[^.][a-zA-Z\0-9\-_\.]+\.[a-zA-Z\0-9\-_\.]*[a-zA-Z\0-9]+$') then
			tab_1.tabpage_2.dw_3.setitem(1,"correo_cext",nul)
				messagebox('Atención','No cumple condiciones para email')
			return 1
		end if
	CASE "correo_bd"
		if not match(data,'^[a-zA-Z0-9][a-zA-Z\0-9\-_\.]*[^.]\@[^.][a-zA-Z\0-9\-_\.]+\.[a-zA-Z\0-9\-_\.]*[a-zA-Z\0-9]+$') then
			tab_1.tabpage_2.dw_3.setitem(1,"correo_bd",nul)
				messagebox('Atención','No cumple condiciones para email')
			return 1
		end if		
	CASE "correo_otro"
		if not match(data,'^[a-zA-Z0-9][a-zA-Z\0-9\-_\.]*[^.]\@[^.][a-zA-Z\0-9\-_\.]+\.[a-zA-Z\0-9\-_\.]*[a-zA-Z\0-9]+$') then
			tab_1.tabpage_2.dw_3.setitem(1,"correo_otro",nul)
				messagebox('Atención','No cumple condiciones para email')
			return 1
		end if				
End CHOOSE
end event

