$PBExportHeader$w_captur_rip.srw
forward
global type w_captur_rip from window
end type
type tab_1 from tab within w_captur_rip
end type
type tp_1 from userobject within tab_1
end type
type cbx_con from checkbox within tp_1
end type
type cbx_fac from checkbox within tp_1
end type
type st_14 from statictext within tp_1
end type
type st_13 from statictext within tp_1
end type
type sle_7 from singlelineedit within tp_1
end type
type sle_6 from singlelineedit within tp_1
end type
type tp_1 from userobject within tab_1
cbx_con cbx_con
cbx_fac cbx_fac
st_14 st_14
st_13 st_13
sle_7 sle_7
sle_6 sle_6
end type
type tp_2 from userobject within tab_1
end type
type st_3 from statictext within tp_2
end type
type st_12 from statictext within tp_2
end type
type st_11 from statictext within tp_2
end type
type st_10 from statictext within tp_2
end type
type st_9 from statictext within tp_2
end type
type em_4 from editmask within tp_2
end type
type em_3 from editmask within tp_2
end type
type dw_empresa from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
st_3 st_3
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
em_4 em_4
em_3 em_3
dw_empresa dw_empresa
end type
type tp_3 from userobject within tab_1
end type
type st_8 from statictext within tp_3
end type
type st_7 from statictext within tp_3
end type
type em_2 from editmask within tp_3
end type
type em_1 from editmask within tp_3
end type
type tp_3 from userobject within tab_1
st_8 st_8
st_7 st_7
em_2 em_2
em_1 em_1
end type
type tp_4 from userobject within tab_1
end type
type st_6 from statictext within tp_4
end type
type st_5 from statictext within tp_4
end type
type st_4 from statictext within tp_4
end type
type dw_prof_cita from datawindow within tp_4
end type
type em_6 from editmask within tp_4
end type
type em_5 from editmask within tp_4
end type
type tp_4 from userobject within tab_1
st_6 st_6
st_5 st_5
st_4 st_4
dw_prof_cita dw_prof_cita
em_6 em_6
em_5 em_5
end type
type tp_5 from userobject within tab_1
end type
type st_16 from statictext within tp_5
end type
type em_8 from editmask within tp_5
end type
type st_15 from statictext within tp_5
end type
type em_7 from editmask within tp_5
end type
type dw_area from datawindow within tp_5
end type
type tp_5 from userobject within tab_1
st_16 st_16
em_8 em_8
st_15 st_15
em_7 em_7
dw_area dw_area
end type
type tab_1 from tab within w_captur_rip
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
tp_5 tp_5
end type
type st_fact from statictext within w_captur_rip
end type
type s_fact from statictext within w_captur_rip
end type
type dw_2 from datawindow within w_captur_rip
end type
type st_edad from statictext within w_captur_rip
end type
type st_sex from statictext within w_captur_rip
end type
type s_edad from statictext within w_captur_rip
end type
type s_sex from statictext within w_captur_rip
end type
type st_docu from statictext within w_captur_rip
end type
type s_doc from statictext within w_captur_rip
end type
type s_pac from statictext within w_captur_rip
end type
type st_paci from statictext within w_captur_rip
end type
type cbx_1 from checkbox within w_captur_rip
end type
type gb_6 from groupbox within w_captur_rip
end type
type cb_registra from picturebutton within w_captur_rip
end type
type dw_trae from datawindow within w_captur_rip
end type
type st_2 from statictext within w_captur_rip
end type
type cbx_replica from checkbox within w_captur_rip
end type
type sle_5 from singlelineedit within w_captur_rip
end type
type sle_3 from singlelineedit within w_captur_rip
end type
type sle_2 from singlelineedit within w_captur_rip
end type
type sle_1 from singlelineedit within w_captur_rip
end type
type gb_4 from groupbox within w_captur_rip
end type
type gb_3 from groupbox within w_captur_rip
end type
type cb_guarda from picturebutton within w_captur_rip
end type
type st_1 from statictext within w_captur_rip
end type
type rb_anul from radiobutton within w_captur_rip
end type
type rb_incomp from radiobutton within w_captur_rip
end type
type rb_comp from radiobutton within w_captur_rip
end type
type rb_tod from radiobutton within w_captur_rip
end type
type dw_rias from datawindow within w_captur_rip
end type
type sle_4 from singlelineedit within w_captur_rip
end type
type gb_1 from groupbox within w_captur_rip
end type
type gb_2 from groupbox within w_captur_rip
end type
type gb_5 from groupbox within w_captur_rip
end type
type dw_1 from datawindow within w_captur_rip
end type
type cb_trae from picturebutton within w_captur_rip
end type
type gb_7 from groupbox within w_captur_rip
end type
end forward

global type w_captur_rip from window
integer width = 6130
integer height = 2248
boolean titlebar = true
string title = "Captura de RIPS (Facturas no atendidas)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "rip_f.ico"
string pointer = "Arrow!"
tab_1 tab_1
st_fact st_fact
s_fact s_fact
dw_2 dw_2
st_edad st_edad
st_sex st_sex
s_edad s_edad
s_sex s_sex
st_docu st_docu
s_doc s_doc
s_pac s_pac
st_paci st_paci
cbx_1 cbx_1
gb_6 gb_6
cb_registra cb_registra
dw_trae dw_trae
st_2 st_2
cbx_replica cbx_replica
sle_5 sle_5
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
gb_4 gb_4
gb_3 gb_3
cb_guarda cb_guarda
st_1 st_1
rb_anul rb_anul
rb_incomp rb_incomp
rb_comp rb_comp
rb_tod rb_tod
dw_rias dw_rias
sle_4 sle_4
gb_1 gb_1
gb_2 gb_2
gb_5 gb_5
dw_1 dw_1
cb_trae cb_trae
gb_7 gb_7
end type
global w_captur_rip w_captur_rip

type variables
int xant,yant
string sexo_paci,orden,anterior,ord,ant,is_cext
datawindowchild dw_contrato,gc_regimen,idw_finconr,idw_finprocr,idw_causaexr,idw_ambprocr
end variables
on w_captur_rip.create
this.tab_1=create tab_1
this.st_fact=create st_fact
this.s_fact=create s_fact
this.dw_2=create dw_2
this.st_edad=create st_edad
this.st_sex=create st_sex
this.s_edad=create s_edad
this.s_sex=create s_sex
this.st_docu=create st_docu
this.s_doc=create s_doc
this.s_pac=create s_pac
this.st_paci=create st_paci
this.cbx_1=create cbx_1
this.gb_6=create gb_6
this.cb_registra=create cb_registra
this.dw_trae=create dw_trae
this.st_2=create st_2
this.cbx_replica=create cbx_replica
this.sle_5=create sle_5
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.gb_4=create gb_4
this.gb_3=create gb_3
this.cb_guarda=create cb_guarda
this.st_1=create st_1
this.rb_anul=create rb_anul
this.rb_incomp=create rb_incomp
this.rb_comp=create rb_comp
this.rb_tod=create rb_tod
this.dw_rias=create dw_rias
this.sle_4=create sle_4
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_5=create gb_5
this.dw_1=create dw_1
this.cb_trae=create cb_trae
this.gb_7=create gb_7
this.Control[]={this.tab_1,&
this.st_fact,&
this.s_fact,&
this.dw_2,&
this.st_edad,&
this.st_sex,&
this.s_edad,&
this.s_sex,&
this.st_docu,&
this.s_doc,&
this.s_pac,&
this.st_paci,&
this.cbx_1,&
this.gb_6,&
this.cb_registra,&
this.dw_trae,&
this.st_2,&
this.cbx_replica,&
this.sle_5,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.gb_4,&
this.gb_3,&
this.cb_guarda,&
this.st_1,&
this.rb_anul,&
this.rb_incomp,&
this.rb_comp,&
this.rb_tod,&
this.dw_rias,&
this.sle_4,&
this.gb_1,&
this.gb_2,&
this.gb_5,&
this.dw_1,&
this.cb_trae,&
this.gb_7}
end on

on w_captur_rip.destroy
destroy(this.tab_1)
destroy(this.st_fact)
destroy(this.s_fact)
destroy(this.dw_2)
destroy(this.st_edad)
destroy(this.st_sex)
destroy(this.s_edad)
destroy(this.s_sex)
destroy(this.st_docu)
destroy(this.s_doc)
destroy(this.s_pac)
destroy(this.st_paci)
destroy(this.cbx_1)
destroy(this.gb_6)
destroy(this.cb_registra)
destroy(this.dw_trae)
destroy(this.st_2)
destroy(this.cbx_replica)
destroy(this.sle_5)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.cb_guarda)
destroy(this.st_1)
destroy(this.rb_anul)
destroy(this.rb_incomp)
destroy(this.rb_comp)
destroy(this.rb_tod)
destroy(this.dw_rias)
destroy(this.sle_4)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_5)
destroy(this.dw_1)
destroy(this.cb_trae)
destroy(this.gb_7)
end on

event open;string descrip
select descripcion into :descrip from lugar where codlugar=:clugar;
title='Capt. de RIPS (Facts. no atendidas)  Lugar:  ** '+ upper(descrip)+' **'
end event

type tab_1 from tab within w_captur_rip
event create ( )
event destroy ( )
integer x = 18
integer y = 60
integer width = 1682
integer height = 540
integer taborder = 60
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
tp_5 tp_5
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.tp_4=create tp_4
this.tp_5=create tp_5
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3,&
this.tp_4,&
this.tp_5}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
destroy(this.tp_4)
destroy(this.tp_5)
end on

type tp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 1646
integer height = 412
long backcolor = 67108864
string text = "Facturas"
long tabtextcolor = 33554432
string picturename = "facturas.ico"
long picturemaskcolor = 536870912
string powertiptext = "Buca por rango de Facturas"
cbx_con cbx_con
cbx_fac cbx_fac
st_14 st_14
st_13 st_13
sle_7 sle_7
sle_6 sle_6
end type

on tp_1.create
this.cbx_con=create cbx_con
this.cbx_fac=create cbx_fac
this.st_14=create st_14
this.st_13=create st_13
this.sle_7=create sle_7
this.sle_6=create sle_6
this.Control[]={this.cbx_con,&
this.cbx_fac,&
this.st_14,&
this.st_13,&
this.sle_7,&
this.sle_6}
end on

on tp_1.destroy
destroy(this.cbx_con)
destroy(this.cbx_fac)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.sle_7)
destroy(this.sle_6)
end on

type cbx_con from checkbox within tp_1
integer x = 402
integer y = 208
integer width = 375
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Consecutivo"
end type

type cbx_fac from checkbox within tp_1
integer x = 50
integer y = 208
integer width = 311
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factura"
end type

type st_14 from statictext within tp_1
integer x = 439
integer y = 132
integer width = 219
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_13 from statictext within tp_1
integer x = 59
integer y = 132
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Desde:"
boolean focusrectangle = false
end type

type sle_7 from singlelineedit within tp_1
integer x = 434
integer y = 52
integer width = 325
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_6 from singlelineedit within tp_1
integer x = 50
integer y = 52
integer width = 325
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type tp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 1646
integer height = 412
long backcolor = 67108864
string text = "Empresa"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Busca por Contrato y rango de fechas"
st_3 st_3
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
em_4 em_4
em_3 em_3
dw_empresa dw_empresa
end type

on tp_2.create
this.st_3=create st_3
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.em_4=create em_4
this.em_3=create em_3
this.dw_empresa=create dw_empresa
this.Control[]={this.st_3,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.em_4,&
this.em_3,&
this.dw_empresa}
end on

on tp_2.destroy
destroy(this.st_3)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.dw_empresa)
end on

type st_3 from statictext within tp_2
integer x = 9
integer y = 232
integer width = 201
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Régimen"
boolean focusrectangle = false
end type

type st_12 from statictext within tp_2
integer y = 320
integer width = 192
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Contrato"
boolean focusrectangle = false
end type

type st_11 from statictext within tp_2
integer y = 164
integer width = 201
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Empresa"
boolean focusrectangle = false
end type

type st_10 from statictext within tp_2
integer x = 654
integer y = 32
integer width = 197
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_9 from statictext within tp_2
integer x = 9
integer y = 32
integer width = 174
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Desde:"
boolean focusrectangle = false
end type

type em_4 from editmask within tp_2
integer x = 850
integer y = 24
integer width = 370
integer height = 76
integer taborder = 2
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
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

type em_3 from editmask within tp_2
integer x = 192
integer y = 24
integer width = 370
integer height = 76
integer taborder = 1
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;this.text="01/"+string(today(),"mm/yyyy")
end event

type dw_empresa from datawindow within tp_2
integer x = 215
integer y = 144
integer width = 1253
integer height = 268
integer taborder = 3
string title = "none"
string dataobject = "dw_combo_emp_cont2"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
string codem,l_null,regim
setnull(l_null)

if this.getcolumnname() = "codemp" then
	this.accepttext()
	setitem(1,'ctreg',l_null)
	setitem(1,'codcontrato',l_null)
	codem=this.getitemstring(1,"codemp")
	gc_regimen.retrieve(codem)
end if
if this.getcolumnname() = "ctreg" then
	this.accepttext()
	codem=this.getitemstring(1,"codemp")
	setitem(row,'codcontrato',l_null)
	regim=this.getitemstring(1,"ctreg")
	dw_contrato.retrieve(codem,l_null,regim)
end if

end event

event constructor;this.settransobject(sqlca)
this.getchild("codcontrato",dw_contrato)
this.getchild('ctreg',gc_regimen)
gc_regimen.settransobject(sqlca)
dw_contrato.settransobject(sqlca)
this.insertrow(1)

end event

type tp_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 1646
integer height = 412
long backcolor = 67108864
string text = "Fechas"
long tabtextcolor = 33554432
string picturename = "recorda.ico"
long picturemaskcolor = 536870912
string powertiptext = "Busca por fecha de facturación"
st_8 st_8
st_7 st_7
em_2 em_2
em_1 em_1
end type

on tp_3.create
this.st_8=create st_8
this.st_7=create st_7
this.em_2=create em_2
this.em_1=create em_1
this.Control[]={this.st_8,&
this.st_7,&
this.em_2,&
this.em_1}
end on

on tp_3.destroy
destroy(this.st_8)
destroy(this.st_7)
destroy(this.em_2)
destroy(this.em_1)
end on

type st_8 from statictext within tp_3
integer x = 425
integer y = 156
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_7 from statictext within tp_3
integer x = 14
integer y = 156
integer width = 187
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Desde:"
boolean focusrectangle = false
end type

type em_2 from editmask within tp_3
integer x = 416
integer y = 68
integer width = 375
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
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

type em_1 from editmask within tp_3
integer x = 9
integer y = 68
integer width = 379
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;this.text="01/"+string(today(),"mm/yyyy")
end event

type tp_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 1646
integer height = 412
long backcolor = 67108864
string text = "Citas"
long tabtextcolor = 33554432
string picturename = "asig_cita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Buscar por Cita Asignadas"
st_6 st_6
st_5 st_5
st_4 st_4
dw_prof_cita dw_prof_cita
em_6 em_6
em_5 em_5
end type

on tp_4.create
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.dw_prof_cita=create dw_prof_cita
this.em_6=create em_6
this.em_5=create em_5
this.Control[]={this.st_6,&
this.st_5,&
this.st_4,&
this.dw_prof_cita,&
this.em_6,&
this.em_5}
end on

on tp_4.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_prof_cita)
destroy(this.em_6)
destroy(this.em_5)
end on

type st_6 from statictext within tp_4
integer x = 50
integer y = 260
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Profesional:"
boolean focusrectangle = false
end type

type st_5 from statictext within tp_4
integer x = 434
integer y = 108
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_4 from statictext within tp_4
integer x = 23
integer y = 112
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Desde:"
boolean focusrectangle = false
end type

type dw_prof_cita from datawindow within tp_4
integer x = 5
integer y = 180
integer width = 1513
integer height = 92
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;this.accepttext()

end event

type em_6 from editmask within tp_4
integer x = 425
integer y = 32
integer width = 370
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
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

type em_5 from editmask within tp_4
integer x = 18
integer y = 32
integer width = 379
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;this.text="01/"+string(today(),"mm/yyyy")
end event

type tp_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 1646
integer height = 412
long backcolor = 67108864
string text = "Areas"
long tabtextcolor = 33554432
string picturename = "glosa.ico"
long picturemaskcolor = 536870912
string powertiptext = "Buscar por Area de Apoyo Diagnóstico"
st_16 st_16
em_8 em_8
st_15 st_15
em_7 em_7
dw_area dw_area
end type

on tp_5.create
this.st_16=create st_16
this.em_8=create em_8
this.st_15=create st_15
this.em_7=create em_7
this.dw_area=create dw_area
this.Control[]={this.st_16,&
this.em_8,&
this.st_15,&
this.em_7,&
this.dw_area}
end on

on tp_5.destroy
destroy(this.st_16)
destroy(this.em_8)
destroy(this.st_15)
destroy(this.em_7)
destroy(this.dw_area)
end on

type st_16 from statictext within tp_5
integer x = 466
integer y = 240
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Hasta:"
boolean focusrectangle = false
end type

type em_8 from editmask within tp_5
integer x = 457
integer y = 164
integer width = 384
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
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

type st_15 from statictext within tp_5
integer x = 37
integer y = 240
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Desde:"
boolean focusrectangle = false
end type

type em_7 from editmask within tp_5
integer x = 37
integer y = 164
integer width = 375
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event constructor;this.text="01/"+string(today(),"mm/yyyy")
end event

type dw_area from datawindow within tp_5
integer y = 16
integer width = 1179
integer height = 80
integer taborder = 10
string title = "none"
string dataobject = "dw_areagral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
object.codaadx.dddw.autoretrieve='yes'
object.codaadx.x=8
object.codaadx_t.y=68
object.datawindow.detail.height=128
insertrow(1)
end event

type st_fact from statictext within w_captur_rip
integer x = 2299
integer y = 856
integer width = 293
integer height = 60
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type s_fact from statictext within w_captur_rip
integer x = 2144
integer y = 860
integer width = 142
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
string text = "factura"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_captur_rip
boolean visible = false
integer x = 2647
integer y = 856
integer width = 475
integer height = 72
boolean enabled = false
string title = "none"
string dataobject = "dw_trae_rips_solos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_edad from statictext within w_captur_rip
integer x = 1765
integer y = 856
integer width = 293
integer height = 60
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_sex from statictext within w_captur_rip
integer x = 1449
integer y = 856
integer width = 160
integer height = 60
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type s_edad from statictext within w_captur_rip
integer x = 1655
integer y = 860
integer width = 110
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
string text = "Edad"
boolean focusrectangle = false
end type

type s_sex from statictext within w_captur_rip
integer x = 1344
integer y = 856
integer width = 119
integer height = 60
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
string text = "Sexo"
boolean focusrectangle = false
end type

type st_docu from statictext within w_captur_rip
integer x = 864
integer y = 856
integer width = 439
integer height = 60
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type s_doc from statictext within w_captur_rip
integer x = 626
integer y = 856
integer width = 238
integer height = 60
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
string text = "Documento"
boolean focusrectangle = false
end type

type s_pac from statictext within w_captur_rip
integer x = 640
integer y = 928
integer width = 183
integer height = 60
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
string text = "Paciente"
boolean focusrectangle = false
end type

type st_paci from statictext within w_captur_rip
integer x = 864
integer y = 924
integer width = 1193
integer height = 60
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_captur_rip
integer x = 50
integer y = 592
integer width = 553
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Filtrar por profesional"
end type

event clicked;if this.checked then
	dw_1.enabled=true
	dw_1.visible=true
else
	dw_1.enabled=false
	dw_1.visible=false
	dw_1.reset()
	dw_1.insertrow(1)
	dw_trae.setfilter("")
	dw_trae.filter()
end if
end event

type gb_6 from groupbox within w_captur_rip
integer x = 18
integer y = 600
integer width = 1541
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
borderstyle borderstyle = styleraised!
end type

type cb_registra from picturebutton within w_captur_rip
event mousemove pbm_mousemove
integer x = 1577
integer y = 620
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
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Registrar Procedimientos"
end type

event clicked;f_quitafiltro(dw_trae,string(rgb(255,255,255)))
if dw_trae.rowcount()<1 then return
string cemp,ccontrato,tdocu,docum,clugar_fac,clug_soat,nulo,clug_cita,ls_err,tipo_fac
long j,donde,contador,nserv,k,nfact,ncit,nservcit,sec_cant_cita,nitem_fac,cons_soat
datetime fecha,fecha_cit,hora_cit
dw_trae.setsort("nfact A")
dw_trae.sort()
tdocu=""
docum=""
nfact=0
setnull(nulo)
boolean hadicho=false
for j= 1 to dw_trae.rowcount()
	if dw_trae.getitemstring(j,"esco")='1' then
		if not isnull(dw_trae.getitemdatetime(j,"fecha_cit")) then
			datetime cuando,ahora
			cuando=datetime(date(dw_trae.getitemdatetime(j,"fecha_cit")),time(dw_trae.getitemdatetime(j,"hora")))
			ahora=datetime(today(),relativetime(now(),-1200))
			if cuando>=ahora then
				if not hadicho then
					messagebox("Atención","Ha escogido procedimientos con citas posteriores a la fecha y hora actual, estos procedimientos no van a ser guardados")
					hadicho=true
				end if
				dw_trae.setitem(j,'esco','0')
				goto otro
			end if
		end if
		nitem_fac=dw_trae.getitemnumber(j,"nitem")
		if tdocu<>dw_trae.getitemstring(j,"tipodoc") or docum<>dw_trae.getitemstring(j,"documento") or nfact<>dw_trae.getitemnumber(j,"nfact") then
			tdocu=dw_trae.getitemstring(j,"tipodoc")
			docum=dw_trae.getitemstring(j,"documento")
			nfact=dw_trae.getitemnumber(j,"nfact")
			clugar_fac=dw_trae.getitemstring(j,"clugar")
			tipo_fac=dw_trae.getitemstring(j,"tipo_fac")
			cons_soat=dw_trae.getitemnumber(j,"consecutivo")
			clug_soat=dw_trae.getitemstring(j,"clug_acum")
			nserv=1
			setnull(contador)
			fecha=dw_trae.getitemdatetime(j,"fecha_cit")
			if isnull(fecha) then fecha=dw_trae.getitemdatetime(j,"fecha_fact")
			contador=f_trae_ndoc('HIS',clugar,'Historial')
			insert into historial (contador,clugar,tipodoc,documento,fecha,indapdx,consec_soat,clugar_soat) 
			values (:contador,:clugar,:tdocu,:docum,:fecha,'0',:cons_soat,:clug_soat);
			if sqlca.sqlcode= -1 then
				ls_err=sqlca.sqlerrtext
				rollback;
				messagebox("Error insertando registro en Historial",ls_err)
				dw_rias.reset()
				return
			end if
		end if
		cemp=dw_trae.getitemstring(j,"cemp")
		ccontrato=dw_trae.getitemstring(j,"ccontrato")
		for k=1 to dw_trae.getitemnumber(j,"cantidad")
			donde=dw_rias.insertrow(0)
			dw_rias.setitem(donde,"contador",contador)
			dw_rias.setitem(donde,"nservicio",nserv)
			dw_rias.setitem(donde,"usuario",usuario)
			dw_trae.setitem(j,"contador",contador)
			dw_trae.setitem(j,"nservicio",nserv)
			dw_trae.setitem(j,"clugar_ser",clugar)
			dw_2.insertrow(1)
			dw_2.setitem(1,1,contador)
			dw_2.setitem(1,2,nserv)
			dw_2.setitem(1,3,clugar)
			nserv ++
			if not isnull(dw_trae.getitemstring(j,"cproced")) then
				dw_rias.setitem(donde,"cproced",dw_trae.getitemstring(j,"proccups"))
				dw_rias.setitem(donde,"cod_cups",dw_trae.getitemstring(j,"cod_cups"))
			else
				dw_rias.setitem(donde,"c_medica",dw_trae.getitemstring(j,"c_medica"))
			end if
			dw_rias.setitem(donde,"rips_descripcion",dw_trae.getitemstring(j,"ria"))
			dw_rias.setitem(donde,"rips",dw_trae.getitemstring(j,"ria"))
			if dw_trae.getitemstring(j,"ria")='1' then dw_rias.setitem(donde,'s_fin_consulta','10')
			fecha=dw_trae.getitemdatetime(j,"fecha_cit")
			if isnull(fecha) then fecha=dw_trae.getitemdatetime(j,"fecha_fact")
			dw_rias.setitem(donde,"s_fecha",fecha)
			dw_rias.setitem(donde,"s_cantidad",1)
			if dw_trae.getitemstring(j,"prof")='' or isnull(dw_trae.getitemstring(j,"prof")) then
				if dw_trae.getitemstring(j,"prof_atende")='' then 
					dw_rias.setitem(donde,"cprof",nulo)
				else
					dw_rias.setitem(donde,"cprof",dw_trae.getitemstring(j,"prof_atende"))
				end if
			else
				dw_rias.setitem(donde,"cprof",dw_trae.getitemstring(j,"prof"))
			end if
			dw_rias.setitem(donde,"nfactura",nfact)
			dw_rias.setitem(donde,"clugar_fac",clugar_fac)
			dw_rias.setitem(donde,"tipo_fac",tipo_fac)			
			dw_rias.setitem(donde,"nitem",nitem_fac)
			dw_rias.setitem(donde,"nautoriza",dw_trae.getitemstring(j,"autorizacion"))
			//se agrego para qeu salga por defecto de procedimientos//
			if dw_trae.getitemstring(j,"ria")<>'1' then dw_rias.setitem(donde,"s_finalidadproced",dw_trae.getitemstring(j,"tipoproc"))
			dw_rias.setitem(donde,"cprocedeq",dw_trae.getitemstring(j,"cproced"))
			dw_rias.setitem(donde,"cmanual",dw_trae.getitemstring(j,"codmanual"))
			dw_rias.setitem(donde,"cemp",cemp)
			dw_rias.setitem(donde,"cplan",dw_trae.getitemstring(j,"cplan"))
			dw_rias.setitem(donde,"ccontrato",ccontrato)
			dw_rias.setitem(donde,"clugar",clugar)
			dw_rias.setitem(j,"estria","2")
			dw_rias.setitem(donde,"cufuncional",dw_trae.getitemstring(j,"cufuncional"))
			dw_rias.setitem(donde,"cccosto",dw_trae.getitemstring(j,"cccosto"))
		next
otro:
	end if
next
if dw_rias.update()=-1 then
	rollback;
	dw_rias.reset()
else
	if dw_trae.update()=-1 then
		rollback;
		dw_rias.reset()
	else
		for j=1 to dw_trae.rowcount()
			if dw_trae.getitemstring(j,"esco")='1' then
				ncit=dw_trae.getitemnumber(j,"ncita")
				clug_cita=dw_trae.getitemstring(j,"clugar_cita")
				nservcit=dw_trae.getitemnumber(j,"nservcita")
				fecha_cit=dw_trae.getitemdatetime(j,"fecha_cit")
				if not isnull(ncit) and not isnull(nservcit) and not isnull(fecha_cit) then
					contador=dw_trae.getitemnumber(j,"contador")
					nserv=dw_trae.getitemnumber(j,"nservicio")
					hora_cit=dw_trae.getitemdatetime(j,"hora")
					sec_cant_cita=dw_trae.getitemnumber(j,"sec_cant")
					update serciosturno set contador=:contador, clugar_ser=:clugar,nservicio_ingreso=:nserv, control='2' 
					where ncita=:ncit and clugar=:clug_cita and nservicio=:nservcit and sec_cant=:sec_cant_cita;//and fecha=:fecha_cit and hora=:hora_cit;
					if sqlca.sqlcode= -1 then
						ls_err=sqlca.sqlerrtext
						rollback;
						messagebox("Error cambiando estado de cita",ls_err)
						dw_rias.reset()
						return
					end if
				end if
			end if
		next
		commit;
		dw_rias.reset()
		for j=1 to dw_2.rowcount()
			dw_rias.retrieve(dw_2.getitemnumber(j,1),dw_2.getitemnumber(j,2),dw_2.getitemstring(j,3))
		next
		cb_trae.triggerevent(clicked!)
	end if
end if
end event

type dw_trae from datawindow within w_captur_rip
event mousemove pbm_dwnmousemove
integer x = 1792
integer y = 68
integer width = 4174
integer height = 672
integer taborder = 50
string title = "none"
string dataobject = "dw_factu_sin_rip"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event itemchanged;this.accepttext()
end event

event clicked;if dwo.type = "text" then 
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
	dw_trae.setsort(cual+" "+orden)
	dw_trae.sort()
	anterior=cual
end if
end event

event buttonclicked;long j
for j=1 to this.rowcount()
	if this.describe('b_1.text')='Escog' then
		this.setitem(j,'esco','1')
	else
		this.setitem(j,'esco','0')
	end if
next
if this.describe('b_1.text')='Escog' then
	this.modify('b_1.text="No Esco."')
else
	this.modify('b_1.text="Escog"')
end if
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type st_2 from statictext within w_captur_rip
integer x = 155
integer y = 868
integer width = 448
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Replicar cambios en todas las filas"
boolean focusrectangle = false
end type

type cbx_replica from checkbox within w_captur_rip
integer x = 64
integer y = 884
integer width = 73
integer height = 68
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
boolean checked = true
end type

type sle_5 from singlelineedit within w_captur_rip
integer x = 2103
integer y = 1988
integer width = 338
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
string text = "No obligatorio"
borderstyle borderstyle = stylelowered!
end type

event constructor;this.backcolor= rgb(255,255,200)
end event

type sle_3 from singlelineedit within w_captur_rip
integer x = 1728
integer y = 1988
integer width = 338
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 1090519039
string text = "Obligatorio"
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_captur_rip
integer x = 3232
integer y = 1988
integer width = 283
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 1090519039
string text = "Completo"
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_captur_rip
integer x = 2921
integer y = 1988
integer width = 283
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 1090519039
string text = "Incompleto"
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_captur_rip
integer x = 1664
integer y = 1932
integer width = 1216
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "CONVENCIONES: Obligatoriedad"
end type

type gb_3 from groupbox within w_captur_rip
integer x = 2871
integer y = 1932
integer width = 677
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Estado Rips"
end type

type cb_guarda from picturebutton within w_captur_rip
event mousemove pbm_mousemove
integer x = 1403
integer y = 1948
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &g"
boolean originalsize = true
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;if dw_rias.update() = 1 then 
	commit;
	//w_hist_gral.dw_historial.triggerevent(rowfocuschanged!)
end if
end event

type st_1 from statictext within w_captur_rip
integer x = 2139
integer y = 928
integer width = 1413
integer height = 60
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_anul from radiobutton within w_captur_rip
integer x = 1006
integer y = 1984
integer width = 302
integer height = 56
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
string text = "Anulados"
end type

event clicked;dw_rias.setfilter("estado='Anulado'")
dw_rias.filter()
end event

type rb_incomp from radiobutton within w_captur_rip
integer x = 649
integer y = 1984
integer width = 347
integer height = 56
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
string text = "Incompletos"
end type

event clicked;dw_rias.setfilter("estado='Incompleto'")
dw_rias.filter()
end event

type rb_comp from radiobutton within w_captur_rip
integer x = 311
integer y = 1984
integer width = 325
integer height = 56
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
string text = "Completos"
end type

event clicked;dw_rias.setfilter("estado='Completo'")
dw_rias.filter()
end event

type rb_tod from radiobutton within w_captur_rip
integer x = 64
integer y = 1984
integer width = 242
integer height = 56
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
string text = "Todos"
boolean checked = true
end type

event clicked;dw_rias.setfilter("")
dw_rias.filter()
end event

type dw_rias from datawindow within w_captur_rip
integer x = 46
integer y = 992
integer width = 5929
integer height = 908
integer taborder = 80
string dragicon = "none!"
string dataobject = "dw_rips_solo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event updatestart;long i , filas
string nv_est,estr
filas=rowcount()
for i=1 to filas
	nv_est=getitemstring(i,'estado')
	if nv_est<>"Anulado" then 
		choose case nv_est
			case "Completo"
				estr="1"
			case "Incompleto"
				estr="2"
		end choose
		setitem(i,"estria",estr)
	end if
next
end event

event itemchanged;this.accepttext()
string cod,nulo,col,este
long colum,i,veri
st_return_diags st

setnull(nulo)
setnull(este)
col=this.getcolumnname()
colum=this.getcolumn()
if colum=13 then
	select desesp into :st_1.text from especialidades where codesp= :data;
	if st_1.text="" then return 1
end if

choose case colum
	case 7
		if cbx_replica.checked then
			for i=1 to this.rowcount()
				if i<>row then
					if isnull(this.getitemstring(i,string(dwo.name))) then
						this.setitem(i,dwo.name,data)
					end if
				end if
			next
		end if
	case 13, 15, 17, 33, 35, 37
		if cbx_replica.checked then
			for i=1 to this.rowcount()
				if i<>row and not isnull(this.getitemstring(i,"r_"+mid(dwo.name,3))) and this.getitemstring(i,"r_"+mid(dwo.name,3))='1' then
					if isnull(this.getitemstring(i,string(dwo.name))) then
						if (this.getitemstring(i,'s_fin_consulta') >='01' and this.getitemstring(i,'s_fin_consulta') <= '08') then 
							this.setitem(row,'s_causaexterna',"15")
						end if 
						if  (colum =13 or colum=15 or colum=17) then 
							veri=f_valida_fin_con(this.getitemstring(i,'s_fin_consulta'),this.getitemstring(i,'s_causaexterna'),this.getitemstring(i,"sexo"),this.getitemnumber(i,"dias"),this.getitemstring(i,'s_diagprin'))
							if veri=-1 then
								this.setitem(i,dwo.name,nulo)
								return 1
							end if
						end if
						this.setitem(i,dwo.name,data)
					end if
				end if
			next
		end if
		if (this.getitemstring(row,'s_fin_consulta') >='01' and this.getitemstring(row,'s_fin_consulta') <= '08') then 
			this.setitem(row,'s_causaexterna',"15")
		end if 
		if  (colum =13 or colum=15 or colum=17) then 
			veri=f_valida_fin_con(this.getitemstring(row,'s_fin_consulta'),this.getitemstring(row,'s_causaexterna'),this.getitemstring(row,"sexo"),this.getitemnumber(row,"dias"),this.getitemstring(row,'s_diagprin'))
			if veri=-1 then
				this.setitem(row,colum,nulo)
				return 1
			end if
		end if
	case 64,65,66,67,68
		if data<>"" then
			setnull(veri)
			veri=idw_causaexr.find("codcausaexter ='"+this.getitemstring(row,'causaexterna')+"'",1,idw_causaexr.rowcount())
			if veri>0 then
				is_cext=idw_causaexr.getitemstring(veri,'dxrel')
			else
				is_cext='0'
			end if
			
			st=f_check_diag(data,sex_busca,edad_busca,este,'0',this.getitemstring(row,'rips'),is_cext)
			if st.descrip_diag="" then
				this.setitem(row,colum,"")
				this.setitem(row,left(col,len(col)-1),nulo)
				return 1
			end if
			st_1.text=st.descrip_diag
			this.setitem(row,left(col,len(col)-1),este)
		else
			st_1.text=''
			this.setitem(row,left(col,len(col)-1),nulo)
		end if
end choose
end event

event doubleclicked;string colu,carreta,resu,cual,temp,nulo
int l_i

setnull(nulo)
colu= dwo.name
cual="r_" + mid(colu,3)
if right(cual,1)='_' then cual=left(cual,len(cual)-1)
if this.describe(cual+".id")="!" then return
carreta="evaluate ('if ("+ cual +'="0", 1, 0 )'+"'," +string(row) +")"
resu=this.describe(carreta)
if resu="1" then return
if colu="s_diagprin_" or colu="s_diagrel1_" or colu="s_diagrel2_" or colu="s_diagrel3_" or colu="s_diagcompli_" then
	st_edadsexo st_es
	st_diag st_d
	st_es.sexo=getitemstring(row,"sexo")
	st_es.edad=getitemnumber(row,"dias")
	st_es.antece='0'
	if getitemstring(getrow(),'rips')='1' then
		st_es.proced='0'
	else
		st_es.proced='1'
	end if	
	openwithparm(w_busca_diag,st_es)
	st_d=message.powerobjectparm
	if not isValid(st_d) then return
	if not isNull(st_d.codrip) then
		if cbx_replica.checked then
			for l_i=1 to this.rowcount()
				this.setitem(l_i,colu,st_d.codrip)
				this.setitem(l_i,left(colu,len(colu)-1),st_d.codgeral)
			next
		else	
			this.setitem(row,colu,st_d.codrip)
			this.setitem(row,left(colu,len(colu)-1),st_d.codgeral)
			st_1.text=st_d.descripcion
		end if
	end if
end if
if colu="s_codespecialidad" then
	retorna_busqueda=""
	open (w_busca_espe)
	if retorna_busqueda<>"" then
		dw_rias.setitem(dw_rias.getrow(),"s_codespecialidad",retorna_busqueda)
		st_1.text=retorna_des_busqueda
	end if
end if
end event

event itemfocuschanged;this.accepttext()
string cod,ojo,este,col
long colum,veri
st_return_diags st

col=this.getcolumnname()
colum=this.getcolumn()
choose case colum
	case 3
		ojo=this.getitemstring(row,colum)
		if ojo<>"" then
			select descripcion into :st_1.text from proced where codproced= :ojo;
		end if
	case 13
		ojo=this.getitemstring(row,colum)
		if ojo<>"" then
			select desesp into :st_1.text from especialidades where codesp= :ojo;
		end if
	case 64,65,66,67,68
		if this.getitemstring(row,colum)<>"" then
			
			setnull(veri)
			veri=idw_causaexr.find("codcausaexter ='"+this.getitemstring(row,'causaexterna')+"'",1,idw_causaexr.rowcount())
			if veri>0 then
				is_cext=idw_causaexr.getitemstring(veri,'dxrel')
			else
				is_cext='0'
			end if	
			este=this.getitemstring(row,left(col,len(col)-1))
			st=f_check_diag(this.getitemstring(row,colum),this.getitemstring(row,"sexo"),this.getitemnumber(row,"dias"),este,'0',this.getitemstring(row,'rips'),is_cext)
			if st.descrip_diag="" then
				this.setitem(row,colum,"")
				string nulo
				setnull(nulo)
				this.setitem(row,left(col,len(col)-1),nulo)
				return 1
			end if
			st_1.text=st.descrip_diag
		else
			st_1.text=""
		end if
end choose
end event

event retrievestart;return 2
end event

event clicked;if dwo.type = "text" then 
	string cual,ojo,ss
	cual=dwo.name
	cual=mid(cual,1,len(cual) - 2)
	if anterior=cual then
		if ord="A" then
			ord="D"
		else
			orden="A"
		end if
	else
		orden="A"
	end if
	dw_rias.setsort(cual+" "+orden)
	dw_rias.sort()
	ant=cual
end if
end event

event rowfocuschanged;if this.getrow()<1 then return
long cual
cual=this.getrow()
sex_busca=this.getitemstring(cual,"sexo_t")
edad_busca=this.getitemnumber(cual,"dias")
st_docu.text=this.getitemstring(cual,"tipodoc") +" " +this.getitemstring(cual,"documento")
st_paci.text=this.getitemstring(cual,"nombre")
st_sex.text=this.getitemstring(cual,"sexo_t")
st_edad.text=this.getitemstring(cual,"edad")
st_fact.text=string(this.getitemnumber(cual,"nfactura"))
end event

event constructor;dw_rias.settransobject(sqlca)
dw_rias.getchild('s_fin_consulta',idw_finconr)
idw_finconr.settransobject(sqlca)
dw_rias.getchild('s_finalidadproced',idw_finprocr)
idw_finprocr.settransobject(SQLCA)
dw_rias.getchild('s_causaexterna',idw_causaexr)
idw_causaexr.settransobject(sqlca)
dw_rias.getchild('s_ambitoproced',idw_ambprocr)
idw_ambprocr.settransobject(sqlca)

idw_finconr.retrieve('1')
idw_finprocr.retrieve('1')
idw_causaexr.retrieve('1')
idw_ambprocr.retrieve('1')
end event

event itemerror;return 1
end event

type sle_4 from singlelineedit within w_captur_rip
integer x = 2469
integer y = 1988
integer width = 338
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 12632256
string text = "No Requerido"
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_captur_rip
integer x = 37
integer y = 1932
integer width = 1280
integer height = 164
integer taborder = 90
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
string text = "&Estado Rips (Filtrar)"
end type

type gb_2 from groupbox within w_captur_rip
integer x = 18
integer y = 808
integer width = 6011
integer height = 1304
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros Capturados"
borderstyle borderstyle = styleraised!
end type

type gb_5 from groupbox within w_captur_rip
integer width = 1728
integer height = 608
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Buscar por:"
borderstyle borderstyle = styleraised!
end type

type dw_1 from datawindow within w_captur_rip
boolean visible = false
integer x = 37
integer y = 660
integer width = 1504
integer height = 92
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;this.accepttext()
if not isnull(this.getitemstring(1,1)) then
	dw_trae.setfilter("prof='"+this.getitemstring(1,1)+"'")
else
	dw_trae.setfilter("")
end if
dw_trae.filter()

end event

type cb_trae from picturebutton within w_captur_rip
event mousemove pbm_mousemove
integer x = 1495
integer y = 188
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
boolean originalsize = true
string picturename = "refrescar.GIF"
string disabledname = "d_refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Buscar procedimientos sin RIP"
end type

event clicked;string tipo1,tipo2
choose case tab_1.selectedtab
	case 1
		dw_trae.dataobject="dw_factu_sin_rip_nro"
		dw_trae.settransobject(sqlca)
		if not tab_1.tp_1.cbx_fac.checked and not tab_1.tp_1.cbx_con.checked then 
			messagebox("Atención","Seleccione Factura o consecutivo")
			return
		end If	
		if tab_1.tp_1.cbx_fac.checked and tab_1.tp_1.cbx_con.checked then 
			tipo1='C'
			tipo2='F'
		end if
		if tab_1.tp_1.cbx_fac.checked and not tab_1.tp_1.cbx_con.checked then 
			tipo1='F'
			tipo2='F'
		end if
		if not tab_1.tp_1.cbx_fac.checked and tab_1.tp_1.cbx_con.checked then 
			tipo1='C'
			tipo2='C'
		end if
		dw_trae.retrieve(long(tab_1.tp_1.sle_6.text),long(tab_1.tp_1.sle_7.text),clugar,tipo1,tipo2)		
		dw_1.triggerevent(itemchanged!)
	case 2
		dw_trae.dataobject="dw_factu_sin_rip_emp_fecha"
		dw_trae.settransobject(sqlca)
		dw_trae.retrieve(datetime(date(tab_1.tp_2.em_3.text)),datetime(date(tab_1.tp_2.em_4.text)),tab_1.tp_2.dw_empresa.getitemstring(1,1),tab_1.tp_2.dw_empresa.getitemstring(1,2),clugar)
		dw_1.triggerevent(itemchanged!)
	case 3
		dw_trae.dataobject="dw_factu_sin_rip"
		dw_trae.settransobject(sqlca)
		dw_trae.retrieve(datetime(date(tab_1.tp_3.em_1.text)),datetime(date(tab_1.tp_3.em_2.text)),clugar)
		dw_1.triggerevent(itemchanged!)
	case 4
		dw_trae.dataobject="dw_factu_sin_rip_profe"
		dw_trae.settransobject(sqlca)
		dw_trae.retrieve(datetime(date(tab_1.tp_4.em_5.text)),datetime(date(tab_1.tp_4.em_6.text)),tab_1.tp_4.dw_prof_cita.getitemstring(1,1),clugar)
	case 5
		dw_trae.dataobject="dw_factu_sin_rip_area"
		dw_trae.settransobject(sqlca)
		dw_trae.retrieve(datetime(date(tab_1.tp_5.em_7.text)),datetime(date(tab_1.tp_5.em_8.text)),tab_1.tp_5.dw_area.getitemstring(1,1),clugar)
end choose

end event

type gb_7 from groupbox within w_captur_rip
integer x = 1751
integer y = 4
integer width = 4265
integer height = 768
integer taborder = 12
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos que no tienen Registro de prestación:"
borderstyle borderstyle = styleraised!
end type

