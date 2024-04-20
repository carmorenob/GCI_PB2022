$PBExportHeader$w_busca_proc.srw
forward
global type w_busca_proc from window
end type
type st_5 from statictext within w_busca_proc
end type
type dw_contra from datawindow within w_busca_proc
end type
type gb_3 from groupbox within w_busca_proc
end type
type ddlb_1 from dropdownlistbox within w_busca_proc
end type
type st_proc from statictext within w_busca_proc
end type
type st_info from statictext within w_busca_proc
end type
type st_4 from statictext within w_busca_proc
end type
type cb_4 from picturebutton within w_busca_proc
end type
type cb_1 from picturebutton within w_busca_proc
end type
type cbx_1 from checkbox within w_busca_proc
end type
type st_2 from statictext within w_busca_proc
end type
type st_1 from statictext within w_busca_proc
end type
type dw_2 from datawindow within w_busca_proc
end type
type sle_1 from singlelineedit within w_busca_proc
end type
type dw_1 from datawindow within w_busca_proc
end type
type gb_1 from groupbox within w_busca_proc
end type
type gb_2 from groupbox within w_busca_proc
end type
type dw_3 from datawindow within w_busca_proc
end type
end forward

global type w_busca_proc from window
integer x = 201
integer y = 200
integer width = 3653
integer height = 2340
boolean titlebar = true
string title = "Buscar Procedimento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
event teclear pbm_syskeydown
event filtrar pbm_keyup
st_5 st_5
dw_contra dw_contra
gb_3 gb_3
ddlb_1 ddlb_1
st_proc st_proc
st_info st_info
st_4 st_4
cb_4 cb_4
cb_1 cb_1
cbx_1 cbx_1
st_2 st_2
st_1 st_1
dw_2 dw_2
sle_1 sle_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
dw_3 dw_3
end type
global w_busca_proc w_busca_proc

type variables
datawindowchild capitul,grup,secc
string sort1,sort2,sort3,i_manual,l_sql,l_sex_pa,version
st_pa_proc ist_p
str_proc st_retproc
end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();string campo
if ddlb_1.text='Código' then
	campo='codproced'
else
	campo='descripcion'
end if
if cbx_1.checked and dw_1.getitemstring(1,"cd_grupo")<>"" then
	dw_2.setfilter("(lower("+campo+") like '"+lower(trim(sle_1.text))+"%') and cd_grupo = '" + dw_1.getitemstring(1,"cd_grupo")+" '")
else
	dw_2.setfilter("lower("+campo+") like '"+lower(trim(sle_1.text))+"%'")
end if
dw_2.filter()
dw_2.sort()
dw_2.triggerevent(rowfocuschanged!)
st_1.text=string(dw_2.rowcount())+' Registros'

end subroutine

on w_busca_proc.create
this.st_5=create st_5
this.dw_contra=create dw_contra
this.gb_3=create gb_3
this.ddlb_1=create ddlb_1
this.st_proc=create st_proc
this.st_info=create st_info
this.st_4=create st_4
this.cb_4=create cb_4
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_2=create dw_2
this.sle_1=create sle_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_3=create dw_3
this.Control[]={this.st_5,&
this.dw_contra,&
this.gb_3,&
this.ddlb_1,&
this.st_proc,&
this.st_info,&
this.st_4,&
this.cb_4,&
this.cb_1,&
this.cbx_1,&
this.st_2,&
this.st_1,&
this.dw_2,&
this.sle_1,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.dw_3}
end on

on w_busca_proc.destroy
destroy(this.st_5)
destroy(this.dw_contra)
destroy(this.gb_3)
destroy(this.ddlb_1)
destroy(this.st_proc)
destroy(this.st_info)
destroy(this.st_4)
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.sle_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_3)
end on

event open;ist_p=message.powerobjectparm
datetime ahora
string des_vers

dw_1.GetChild('cd_seccion',secc)
dw_1.GetChild('cd_capitulo',capitul)
dw_1.GetChild('cd_grupo',grup)
secc.settransobject(sqlca)
capitul.settransobject(sqlca)
grup.settransobject(sqlca)
dw_1.settransobject(sqlca)
dw_1.insertrow(0)

if w_principal.dw_1.getitemstring(1,"sexo")='F' then l_sex_pa='2'
if w_principal.dw_1.getitemstring(1,"sexo")='M' then l_sex_pa='1'

l_sql="SELECT manuales.CodManual, manuales.DesManual, serviciosman.codservicio, serviciosman.descripcion, serviciosman.valor &
FROM (tarifas INNER JOIN serviciosman ON (tarifas.codservicio = serviciosman.codservicio) AND (tarifas.CodManual = serviciosman.CodManual))  &
INNER JOIN manuales ON tarifas.CodManual = manuales.CodManual " 
l_sql=l_sql+"WHERE (serviciosman.estado='1' and ("
if isValid(ist_p) then
	if not isnull(ist_p.emp) and ist_p.emp<>'' then
		dw_contra.retrieve(ist_p.emp ,ist_p.cont,ist_p.t_ingreso)
		if dw_contra.rowcount()>0 then
			int l_i
			for l_i=1 to  dw_contra.rowcount()
				if l_i<>1 then
					l_sql=l_sql+' or '
				end if
				l_sql=l_sql+"(tarifas.CodManual = '"+  dw_contra.getitemstring(l_i,'codmanual')+"')"	
			next
			l_sql=l_sql+'))'
		else
			l_sql=l_sql+"(tarifas.CodManual like '%')))"
		end if
	else
		l_sql=l_sql+"(tarifas.CodManual like '%')))"
	end if
else
	l_sql=l_sql+"(tarifas.CodManual like '%')))"
end if

ahora=datetime(today())
select cod_version,des_version into :version,:des_vers from pm_cups_version where valido_hasta>=:ahora;
if isnull(version) then 
	messagebox("Atención","No existe una versión de Cups activa")
	return 
end if
st_5.text='Versión CUPS: '+ des_vers
secc.retrieve(version)
capitul.retrieve(version,'%')
grup.retrieve(version,'%')


long posic
string stx
if isvalid(ist_p) then
	if ist_p.decual = 10 then //Odontologia - Consulta
		stx = dw_2.GetSQLSelect()
		posic = pos(lower(stx),'where') + 5
		if posic > 5 then
			stx = left(stx,posic) + " (proced.odonconsul='1') and " + mid(stx,posic + 1)
			dw_2.Modify('DataWindow.Table.Select="' +stx  + '"')	
		end if
	end if
	if ist_p.decual = 11 then //Odontologia - Procedimientos
		stx = dw_2.GetSQLSelect()
		posic = pos(lower(stx),'where') + 5
		if posic > 5 then
			stx = left(stx,posic) + "(  proced.odonconsul='1' or proced.codproced like '23%' or proced.codproced like '24%' or proced.codproced like '8704%') and " + mid(stx,posic + 1)
			dw_2.Modify('DataWindow.Table.Select="' +stx  + '"')	
		end if
	end if
end if
dw_2.Retrieve(version,l_sex_pa)
w_principal.setmicrohelp('Leyendo Registros .........')
filtrar()

end event

type st_5 from statictext within w_busca_proc
integer x = 64
integer y = 1940
integer width = 2217
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_contra from datawindow within w_busca_proc
boolean visible = false
integer x = 2414
integer y = 2044
integer width = 178
integer height = 96
integer taborder = 50
string title = "none"
string dataobject = "dw_cont_deta_sinmed"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type gb_3 from groupbox within w_busca_proc
integer x = 64
integer y = 1356
integer width = 3438
integer height = 576
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "Equivalencias en Manuales Tarifarios:"
borderstyle borderstyle = styleraised!
end type

type ddlb_1 from dropdownlistbox within w_busca_proc
integer x = 73
integer y = 484
integer width = 443
integer height = 344
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"Código","Descripción"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text='Descripción'
end event

type st_proc from statictext within w_busca_proc
integer x = 73
integer y = 1220
integer width = 3429
integer height = 128
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_info from statictext within w_busca_proc
integer x = 2496
integer y = 152
integer width = 987
integer height = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Puede Utilizar el caracter ~'%~' como comodín en cualquier parte de la cadena a buscar."
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_busca_proc
integer x = 2482
integer y = 1948
integer width = 485
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de Registros:"
boolean focusrectangle = false
end type

type cb_4 from picturebutton within w_busca_proc
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 1979
integer y = 2076
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type cb_1 from picturebutton within w_busca_proc
event mousemove pbm_mousemove
string tag = "&Agregar"
integer x = 1815
integer y = 2076
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
end type

event clicked;dw_2.triggerevent(doubleclicked!)
end event

type cbx_1 from checkbox within w_busca_proc
integer x = 2501
integer y = 68
integer width = 773
integer height = 52
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tener en cuenta para búsqueda"
end type

event clicked;filtrar()
end event

type st_2 from statictext within w_busca_proc
integer x = 78
integer y = 576
integer width = 256
integer height = 52
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar &por:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_busca_proc
integer x = 2981
integer y = 1948
integer width = 494
integer height = 76
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_busca_proc
integer x = 73
integer y = 632
integer width = 3442
integer height = 584
integer taborder = 30
string dragicon = "none!"
string dataobject = "dw_procedimi"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;st_1.text=string(rowcount())+' Registros'
w_principal.setmicrohelp('Gestión Clínica Integrada')
end event

event doubleclicked;if rowcount()<1 then return
triggerevent(rowfocuschanged!)
boolean j1
j1=ist_p.norden
if dw_3.rowcount()=0  then
	if  (ist_p.norden=false or ist_p.t_ingreso <>'1') then
	messagebox("Atención","Este procedimiento no tiene equivalencias en manuales, por lo tanto no la va a poder cobrar, busque otro con equivalencias")
	return
	end if
end if
if isvalid(ist_p) then
	if isvalid(ist_p.dw) then
		long fila
		if isvalid(ist_p.pbut) then ist_p.pbut.event clicked()
		fila=ist_p.dw.getrow()
		ist_p.dw.setitem(fila,ist_p.campo,getitemstring(getrow(),1))
		ist_p.dw.setcolumn(ist_p.campo)
		ist_p.dw.triggerevent(itemchanged!)
		ist_p.dw.setfocus()
		return
	end if
	if isvalid(ist_p.sle) then
		ist_p.sle.text=getitemstring(getrow(),1)
		ist_p.sle.triggerevent(modified!)
		if ist_p.origen='C1' then
			closewithreturn(parent,st_retproc)
		end if
		return
	end if
end if
st_retproc.cproc=getitemstring(getrow(),1)
st_retproc.cups=getitemstring(getrow(),'cod_cups')
st_retproc.descripcion=left(getitemstring(getrow(),'descripcion'),250)
st_retproc.tiempoqx=getitemnumber(getrow(),8)

// carga autorizaciones
if isvalid(ist_p.dw_autoriza) then
	int l_fila,l_item
	l_item=ist_p.dw_autoriza.rowcount()
	if isnull(l_item) then l_item=0
	l_item=l_item+1
	l_fila=ist_p.dw_autoriza.insertrow(0)
	ist_p.dw_autoriza.SetItem(l_fila,'item',l_item)
	ist_p.dw_autoriza.SetItem(l_fila,'codproced',st_retproc.cproc)
	ist_p.dw_autoriza.SetItem(l_fila,'solicitada',1)
	ist_p.dw_autoriza.SetItem(l_fila,'cod_cups',st_retproc.cups)
	
	ist_p.dw_autoriza.SetItem(l_fila,'descripcion',left(st_retproc.descripcion,250))
end if
closewithreturn(parent,st_retproc)
end event

event clicked;if dwo.type="text" then
choose case dwo.name
	case "t_1"
		if sort1="#1 A" then
			sort1="#1 D"
		else
			sort1="#1 A"
		end if
		this.setsort(sort1)
	case "t_2"
		if sort2="#2 A" then
			sort2="#2 D"
		else
			sort2="#2 A"
		end if		
		this.setsort(sort2)		
	case "t_3"
		if sort3="#3 A" then
			sort3="#3 D"
		else
			sort3="#3 A"
		end if		
		this.setsort(sort3)	
end choose
this.sort()
end if
end event

event rowfocuschanged;dw_3.reset()
if getrow()<1 then return
st_proc.text=getitemstring(getrow(),"descripcion")
if dw_3.setsqlselect(l_sql+" AND (tarifas.CodProced='"+ getitemstring(getrow(),"codproced")+"')")=-1 then
	l_sql=dw_3.describe('DataWindow.Table.Select')
end if
dw_3.retrieve()
end event

event constructor;settransobject(sqlca)
end event

type sle_1 from singlelineedit within w_busca_proc
event teclear pbm_keyup
integer x = 539
integer y = 484
integer width = 2967
integer height = 84
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
textcase textcase = upper!
integer accelerator = 100
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

type dw_1 from datawindow within w_busca_proc
integer x = 46
integer y = 52
integer width = 2427
integer height = 304
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_capitulo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
choose case this.getcolumnname()
	case "cd_seccion"
		this.setitem(1,"cd_capitulo","")
		capitul.retrieve(version,this.getitemstring(1,'cd_seccion'))
		this.setitem(1,'cd_grupo','')
		grup.reset()
		if cbx_1.checked then filtrar()
	case "cd_capitulo"
		this.setitem(1,'cd_grupo','')
		grup.retrieve(version,this.getitemstring(1,'cd_capitulo'))
		if cbx_1.checked then filtrar()
	case "cd_grupo"
		if cbx_1.checked then filtrar()
end choose
		
end event

type gb_1 from groupbox within w_busca_proc
integer x = 27
integer width = 3525
integer height = 376
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agrupamiento de Procedimientos"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_busca_proc
integer x = 27
integer y = 380
integer width = 3534
integer height = 1664
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos que cumplen la condición"
borderstyle borderstyle = styleraised!
end type

type dw_3 from datawindow within w_busca_proc
integer x = 91
integer y = 1432
integer width = 3383
integer height = 476
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_equiv_manual"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event doubleclicked;dw_2.triggerevent(doubleclicked!)
end event

