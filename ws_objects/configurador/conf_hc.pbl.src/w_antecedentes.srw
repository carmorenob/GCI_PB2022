$PBExportHeader$w_antecedentes.srw
forward
global type w_antecedentes from window
end type
type pb_guan from picturebutton within w_antecedentes
end type
type pb_borra from picturebutton within w_antecedentes
end type
type pb_insa from picturebutton within w_antecedentes
end type
type dw_ant from datawindow within w_antecedentes
end type
type tab_1 from tab within w_antecedentes
end type
type talergia from userobject within tab_1
end type
type pb_guata from picturebutton within talergia
end type
type pb_borrata from picturebutton within talergia
end type
type pb_insta from picturebutton within talergia
end type
type dw_tipoa from datawindow within talergia
end type
type talergia from userobject within tab_1
pb_guata pb_guata
pb_borrata pb_borrata
pb_insta pb_insta
dw_tipoa dw_tipoa
end type
type calergia from userobject within tab_1
end type
type pb_gua from picturebutton within calergia
end type
type pb_borr from picturebutton within calergia
end type
type pb_ins from picturebutton within calergia
end type
type dw_calergia from datawindow within calergia
end type
type calergia from userobject within tab_1
pb_gua pb_gua
pb_borr pb_borr
pb_ins pb_ins
dw_calergia dw_calergia
end type
type medicam from userobject within tab_1
end type
type pb_del from picturebutton within medicam
end type
type pb_find from picturebutton within medicam
end type
type sle_1 from singlelineedit within medicam
end type
type st_3 from statictext within medicam
end type
type pb_gum from picturebutton within medicam
end type
type dw_med_alergia from datawindow within medicam
end type
type medicam from userobject within tab_1
pb_del pb_del
pb_find pb_find
sle_1 sle_1
st_3 st_3
pb_gum pb_gum
dw_med_alergia dw_med_alergia
end type
type tab_1 from tab within w_antecedentes
talergia talergia
calergia calergia
medicam medicam
end type
type gb_1 from groupbox within w_antecedentes
end type
end forward

global type w_antecedentes from window
integer width = 4576
integer height = 1968
boolean titlebar = true
string title = "Antecedentes Clínicos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "D:\libs_115\histoclinic\alergiat.ico"
boolean center = true
pb_guan pb_guan
pb_borra pb_borra
pb_insa pb_insa
dw_ant dw_ant
tab_1 tab_1
gb_1 gb_1
end type
global w_antecedentes w_antecedentes

type variables
string l_medica
end variables

on w_antecedentes.create
this.pb_guan=create pb_guan
this.pb_borra=create pb_borra
this.pb_insa=create pb_insa
this.dw_ant=create dw_ant
this.tab_1=create tab_1
this.gb_1=create gb_1
this.Control[]={this.pb_guan,&
this.pb_borra,&
this.pb_insa,&
this.dw_ant,&
this.tab_1,&
this.gb_1}
end on

on w_antecedentes.destroy
destroy(this.pb_guan)
destroy(this.pb_borra)
destroy(this.pb_insa)
destroy(this.dw_ant)
destroy(this.tab_1)
destroy(this.gb_1)
end on

event open;dw_ant.retrieve()
end event

type pb_guan from picturebutton within w_antecedentes
integer x = 4343
integer y = 356
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_ant.update(true,false)<1 then
	rollback;
	Return -1
else
	commit;
	dw_ant.resetupdate()
end if
end event

type pb_borra from picturebutton within w_antecedentes
integer x = 4343
integer y = 212
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_ant.rowcount()=0 then return
dw_ant.deleterow(0)

end event

type pb_insa from picturebutton within w_antecedentes
string tag = "Inserta Antecedente"
integer x = 4343
integer y = 76
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
end type

event clicked;dw_ant.insertrow(1)
dw_ant.scrolltorow(1)
dw_ant.setfocus()

end event

type dw_ant from datawindow within w_antecedentes
integer x = 82
integer y = 76
integer width = 4229
integer height = 564
integer taborder = 60
string title = "none"
string dataobject = "dw_antecedentes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemfocuschanged;if dw_ant.rowcount()=0 then return
if dw_ant.getitemnumber(row,'ctosdx')>1 then
	messagebox('Atención','Solo puede haber un tipo Dx')
	setitem(row,'dx','0')
	return -1
end if
if dw_ant.getitemnumber(row,'ctosmd')>1 then
	messagebox('Atención','Solo puede haber un tipo Medicamentos')
	setitem(row,'md','0')
	return -1
end if
if dw_ant.getitemnumber(row,'ctosqx')>1 then
	messagebox('Atención','Solo puede haber un tipo Quirurgicos')
	setitem(row,'qx','0')
	return -1
end if
if dw_ant.getitemnumber(row,'ctosfm')>1 then
	messagebox('Atención','Solo puede haber un tipo Familiar')
	setitem(row,'fm','0')
	return -1
end if
if dw_ant.getitemnumber(row,'ctosvac')>1 then
	messagebox('Atención','Solo puede haber un tipo Vacuna')
	setitem(row,'vac','0')
	return -1
end if
if dw_ant.getitemstring(row,'alergia')='1' then
	tab_1.enabled=true
	tab_1.calergia.enabled=true
	tab_1.talergia.enabled=true
	tab_1.talergia.dw_tipoa.enabled=true
	tab_1.calergia.dw_calergia.enabled=true
	tab_1.talergia.pb_insta.enabled=true
	tab_1.talergia.pb_borrata.enabled=true
	tab_1.talergia.pb_guata.enabled=true
else
	tab_1.enabled=false
	tab_1.talergia.enabled=false
	tab_1.talergia.dw_tipoa.reset()
	tab_1.talergia.dw_tipoa.enabled=false
	tab_1.calergia.dw_calergia.reset()
	tab_1.calergia.enabled=false
	tab_1.calergia.dw_calergia.enabled=false
	tab_1.talergia.pb_insta.enabled=false
	tab_1.talergia.pb_borrata.enabled=false
	tab_1.talergia.pb_guata.enabled=false	
end if
tab_1.talergia.dw_tipoa.retrieve(dw_ant.getitemstring( dw_ant.getrow(),'cod_tipoa'))
tab_1.calergia.dw_calergia.retrieve(tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipoa'),tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipo'))
end event

type tab_1 from tab within w_antecedentes
integer x = 41
integer y = 724
integer width = 4485
integer height = 1120
integer taborder = 20
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
talergia talergia
calergia calergia
medicam medicam
end type

on tab_1.create
this.talergia=create talergia
this.calergia=create calergia
this.medicam=create medicam
this.Control[]={this.talergia,&
this.calergia,&
this.medicam}
end on

on tab_1.destroy
destroy(this.talergia)
destroy(this.calergia)
destroy(this.medicam)
end on

type talergia from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4448
integer height = 992
boolean enabled = false
long backcolor = 67108864
string text = "Tipo Alergia"
long tabtextcolor = 33554432
string picturename = "alergiat.ico"
long picturemaskcolor = 536870912
pb_guata pb_guata
pb_borrata pb_borrata
pb_insta pb_insta
dw_tipoa dw_tipoa
end type

on talergia.create
this.pb_guata=create pb_guata
this.pb_borrata=create pb_borrata
this.pb_insta=create pb_insta
this.dw_tipoa=create dw_tipoa
this.Control[]={this.pb_guata,&
this.pb_borrata,&
this.pb_insta,&
this.dw_tipoa}
end on

on talergia.destroy
destroy(this.pb_guata)
destroy(this.pb_borrata)
destroy(this.pb_insta)
destroy(this.dw_tipoa)
end on

type pb_guata from picturebutton within talergia
integer x = 4279
integer y = 304
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
end type

event clicked;if tab_1.talergia.dw_tipoa.update(true,false)<1 then
	rollback;
	Return -1
else
	commit;
	tab_1.talergia.dw_tipoa.resetupdate()
end if
end event

type pb_borrata from picturebutton within talergia
integer x = 4279
integer y = 168
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if tab_1.talergia.dw_tipoa.rowcount()=0 then return
tab_1.talergia.dw_tipoa.deleterow(0)

end event

type pb_insta from picturebutton within talergia
integer x = 4279
integer y = 36
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
end type

event clicked;string valor
int fila

fila =tab_1.talergia.dw_tipoa.insertrow(0)
tab_1.talergia.dw_tipoa.setitem(fila,'cod_tipoa',dw_ant.getitemstring(dw_ant.getrow(),'cod_tipoa'))
valor =tab_1.talergia.dw_tipoa.Describe("Evaluate('max(orden)',0)")
tab_1.talergia.dw_tipoa.SetItem(fila,'orden',long(valor) + 1)
tab_1.talergia.dw_tipoa.scrolltorow(fila)
tab_1.talergia.dw_tipoa.setfocus()
end event

type dw_tipoa from datawindow within talergia
integer x = 37
integer y = 44
integer width = 4201
integer height = 864
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dw_tipo_alergia"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemfocuschanged;if dw_tipoa.rowcount()=0 then 
	tab_1.calergia.enabled=false
	tab_1.calergia.pb_ins.enabled=false
	tab_1.calergia.pb_borr.enabled=false
	tab_1.calergia.pb_gua.enabled=false
	return
else
	tab_1.calergia.dw_calergia.retrieve(dw_tipoa.getitemstring(dw_tipoa.getrow(),'cod_tipoa'),dw_tipoa.getitemstring(dw_tipoa.getrow(),'cod_tipo'))
	tab_1.calergia.enabled=true
	tab_1.calergia.pb_ins.enabled=true
	tab_1.calergia.pb_borr.enabled=true
	tab_1.calergia.pb_gua.enabled=true
	tab_1.calergia.dw_calergia.enabled=true
//	if dw_tipoa.getitemstring(dw_tipoa.getrow(),'medica')='1' then
//		tab_1.medicam.enabled=true
//		tab_1.medicam.dw_med_alergia.enabled=true
//		tab_1.medicam.pb_gum.enabled=true
//		tab_1.medicam.pb_del.enabled=true
//		tab_1.medicam.pb_find.enabled=true
//		tab_1.medicam.sle_1.enabled=true
		if tab_1.calergia.dw_calergia.rowcount()>0 then	
			tab_1.medicam.text='Medicamentos  para '+tab_1.calergia.dw_calergia.getitemstring(tab_1.calergia.dw_calergia.getrow(),'desp_alergia')
			tab_1.medicam.dw_med_alergia.retrieve(dw_tipoa.getitemstring(dw_tipoa.getrow(),'cod_tipoa'),tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipo'),tab_1.calergia.dw_calergia.getitemstring(tab_1.calergia.dw_calergia.getrow(),'cod_alergia'))
		end if
//	else
//		tab_1.medicam.enabled=false
//		tab_1.medicam.dw_med_alergia.enabled=false
//		tab_1.medicam.pb_gum.enabled=false
//		tab_1.medicam.pb_del.enabled=false
//		tab_1.medicam.pb_find.enabled=false
//		tab_1.medicam.sle_1.enabled=false
//		tab_1.medicam.text='Medicamentos'		
//	end if		
end if
end event

type calergia from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4448
integer height = 992
boolean enabled = false
long backcolor = 67108864
string text = "Clase Alergia"
long tabtextcolor = 33554432
string picturename = "alergia.ico"
long picturemaskcolor = 536870912
pb_gua pb_gua
pb_borr pb_borr
pb_ins pb_ins
dw_calergia dw_calergia
end type

on calergia.create
this.pb_gua=create pb_gua
this.pb_borr=create pb_borr
this.pb_ins=create pb_ins
this.dw_calergia=create dw_calergia
this.Control[]={this.pb_gua,&
this.pb_borr,&
this.pb_ins,&
this.dw_calergia}
end on

on calergia.destroy
destroy(this.pb_gua)
destroy(this.pb_borr)
destroy(this.pb_ins)
destroy(this.dw_calergia)
end on

type pb_gua from picturebutton within calergia
integer x = 4274
integer y = 308
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_calergia.update(true,false)<1 then
	rollback;
	Return -1
else
	commit;
	dw_calergia.resetupdate()
end if
end event

type pb_borr from picturebutton within calergia
integer x = 4274
integer y = 168
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_calergia.rowcount()=0 then return
dw_calergia.deleterow(0)

end event

type pb_ins from picturebutton within calergia
integer x = 4279
integer y = 24
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
end type

event clicked;string valor
int fila

fila =tab_1.calergia.dw_calergia.insertrow(0)
tab_1.calergia.dw_calergia.setitem(fila,'cod_tipoa',tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipoa'))
tab_1.calergia.dw_calergia.setitem(fila,'cod_tipo',tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipo'))
valor =tab_1.calergia.dw_calergia.Describe("Evaluate('max(orden)',0)")
tab_1.calergia.dw_calergia.SetItem(fila,'orden',long(valor) + 1)
tab_1.calergia.dw_calergia.SetItem(fila,'cod_alergia',string(long(valor) + 1))
if tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'medica')='1' then
	tab_1.calergia.dw_calergia.SetItem(fila,'tipo','M')
end if
tab_1.calergia.dw_calergia.ScrolltoRow(fila)
tab_1.calergia.dw_calergia.setfocus()
end event

type dw_calergia from datawindow within calergia
integer x = 32
integer y = 28
integer width = 4197
integer height = 920
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_alergias"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event rowfocuschanged;if this.getrow()<1 then return
if dw_calergia.getitemstring(currentrow,'tipo')='M' then
	tab_1.medicam.dw_med_alergia.retrieve(tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipoa'),tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipo'),tab_1.calergia.dw_calergia.getitemstring(tab_1.calergia.dw_calergia.getrow(),'cod_alergia'))
	tab_1.medicam.dw_med_alergia.enabled=true
	tab_1.medicam.pb_gum.enabled=true
	tab_1.medicam.pb_del.enabled=true
	tab_1.medicam.pb_find.enabled=true
	tab_1.medicam.sle_1.enabled=true
	tab_1.medicam.enabled=true
	tab_1.enabled=true
end if
end event

type medicam from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4448
integer height = 992
boolean enabled = false
long backcolor = 67108864
string text = "Medicamentos"
long tabtextcolor = 33554432
string picturename = "dev_med.ico"
long picturemaskcolor = 536870912
pb_del pb_del
pb_find pb_find
sle_1 sle_1
st_3 st_3
pb_gum pb_gum
dw_med_alergia dw_med_alergia
end type

on medicam.create
this.pb_del=create pb_del
this.pb_find=create pb_find
this.sle_1=create sle_1
this.st_3=create st_3
this.pb_gum=create pb_gum
this.dw_med_alergia=create dw_med_alergia
this.Control[]={this.pb_del,&
this.pb_find,&
this.sle_1,&
this.st_3,&
this.pb_gum,&
this.dw_med_alergia}
end on

on medicam.destroy
destroy(this.pb_del)
destroy(this.pb_find)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.pb_gum)
destroy(this.dw_med_alergia)
end on

type pb_del from picturebutton within medicam
integer x = 622
integer y = 48
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "capsula X.GIF"
string disabledname = "d_capsula X.GIF"
alignment htextalign = left!
end type

event clicked;if dw_med_alergia.rowcount()=0 then return
dw_med_alergia.deleterow(0)
end event

type pb_find from picturebutton within medicam
integer x = 466
integer y = 48
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "capsula busca.GIF"
string disabledname = "d_capsula busca.GIF"
alignment htextalign = left!
end type

event clicked;long cuantos,l_fila
cuantos=tab_1.medicam.dw_med_alergia.rowcount()
st_pa_medica st
st_med st_med

st.dw_alergia=tab_1.medicam.dw_med_alergia
st.campo=tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipoa')
st.tipo=tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipo')
st.valor=tab_1.calergia.dw_calergia.getitemstring(tab_1.calergia.dw_calergia.getrow(),'cod_alergia')
st.origen='1' 
openwithparm(w_busca_atc,st)
st_med=message.powerobjectparm
if not isValid(st_med) then Return -1
l_fila=dw_med_alergia.insertrow(0)
dw_med_alergia.SetItem(l_fila,'cod_tipoa',tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipoa'))
dw_med_alergia.SetItem(l_fila,'cod_tipo',tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipo'))
dw_med_alergia.SetItem(l_fila,'cod_alergia',tab_1.calergia.dw_calergia.getitemstring(tab_1.calergia.dw_calergia.getrow(),'cod_alergia'))
dw_med_alergia.SetItem(l_fila,'cod_atc',st_med.cmedica)
dw_med_alergia.SetItem(l_fila,'desp_atc',st_med.medicamento)

end event

type sle_1 from singlelineedit within medicam
integer x = 96
integer y = 88
integer width = 343
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;if text='' or isnull(tab_1.calergia.dw_calergia.getitemstring(1,1))  then return
//st_med stm
//int l_fila
//stm=f_busca_med(text)
//if isnull(stm.medicamento) then return -1
//l_fila=dw_med_alergia.insertrow(0)
//dw_med_alergia.SetItem(l_fila,'cod_tipo',tab_1.talergia.dw_tipoa.getitemstring(tab_1.talergia.dw_tipoa.getrow(),'cod_tipo'))
//dw_med_alergia.SetItem(l_fila,'cod_alergia',tab_1.calergia.dw_calergia.getitemstring(tab_1.calergia.dw_calergia.getrow(),'cod_alergia'))
//dw_med_alergia.SetItem(l_fila,'c_medica',stm.cmedica)
//dw_med_alergia.SetItem(l_fila,'medicamento',stm.medicamento)
//text=''
//
end event

type st_3 from statictext within medicam
integer x = 91
integer y = 36
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código Med:"
boolean focusrectangle = false
end type

type pb_gum from picturebutton within medicam
integer x = 782
integer y = 48
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_med_alergia.update(true,false)<1 then
	rollback;
	Return -1
else
	dw_med_alergia.resetupdate()
	commit;
end if
end event

type dw_med_alergia from datawindow within medicam
integer x = 87
integer y = 192
integer width = 4270
integer height = 772
integer taborder = 40
boolean enabled = false
string dataobject = "dw_alergias_medica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type gb_1 from groupbox within w_antecedentes
integer x = 32
integer y = 12
integer width = 4503
integer height = 676
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedente"
end type

