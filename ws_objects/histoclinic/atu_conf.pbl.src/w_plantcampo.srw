$PBExportHeader$w_plantcampo.srw
forward
global type w_plantcampo from window
end type
type st_1 from statictext within w_plantcampo
end type
type rte_2 from richtextedit within w_plantcampo
end type
type pb_9 from picturebutton within w_plantcampo
end type
type pb_5 from picturebutton within w_plantcampo
end type
type pb_4 from picturebutton within w_plantcampo
end type
type dw_campo from datawindow within w_plantcampo
end type
type st_7 from statictext within w_plantcampo
end type
end forward

global type w_plantcampo from window
integer width = 3607
integer height = 1988
boolean titlebar = true
string title = "Seleccion de Plantillas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "editar.ico"
boolean clientedge = true
boolean center = true
st_1 st_1
rte_2 rte_2
pb_9 pb_9
pb_5 pb_5
pb_4 pb_4
dw_campo dw_campo
st_7 st_7
end type
global w_plantcampo w_plantcampo

type variables

string i_descampo,i_ayudacampo
datawindow dw_c

end variables

forward prototypes
public subroutine f_insert_campo (string p_campo, datawindow p_dw)
public subroutine f_lee_campos (richtextedit p_rte, datawindow p_dw)
end prototypes

public subroutine f_insert_campo (string p_campo, datawindow p_dw);long donde
if p_dw.find('nombre="'+p_campo+'"',1,p_dw.rowcount())=0 then
	donde=p_dw.insertrow(0)
	p_dw.setitem(donde,'nombre',p_campo)
end if
end subroutine

public subroutine f_lee_campos (richtextedit p_rte, datawindow p_dw);string campo
long donde,lineaactual=1,nuevalinea,posactual=0,posnew
campo=p_rte.inputfieldlocate(first!)
if campo<>'' then
	nuevalinea=p_rte.selectedline()
	posnew=p_rte.selectedstart()
	do while nuevalinea>lineaactual or (nuevalinea=lineaactual and posnew>posactual)
		f_insert_campo(campo,p_dw)
		campo=p_rte.inputfieldlocate(next!)
		lineaactual=nuevalinea
		nuevalinea=p_rte.selectedline()
		posactual=posnew
		posnew=p_rte.selectedstart()
	loop
end if
end subroutine

on w_plantcampo.create
this.st_1=create st_1
this.rte_2=create rte_2
this.pb_9=create pb_9
this.pb_5=create pb_5
this.pb_4=create pb_4
this.dw_campo=create dw_campo
this.st_7=create st_7
this.Control[]={this.st_1,&
this.rte_2,&
this.pb_9,&
this.pb_5,&
this.pb_4,&
this.dw_campo,&
this.st_7}
end on

on w_plantcampo.destroy
destroy(this.st_1)
destroy(this.rte_2)
destroy(this.pb_9)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.dw_campo)
destroy(this.st_7)
end on

event open;dw_c = message.PowerObjectParm
dw_campo.Modify("nombre.Edit.DisplayOnly=Yes")
int f,n
f = dw_c.GetRow()
if dw_c.GetItemString(f,'tipo_memo') = 'C' then//conducta
	n = dw_campo.InsertRow(0)
	dw_campo.SetItem(n,1,'cantidad')
	n = dw_campo.InsertRow(0)
	dw_campo.SetItem(n,1,'codproced')
	n = dw_campo.InsertRow(0)
	dw_campo.SetItem(n,1,'desproced')
	n = dw_campo.InsertRow(0)
	dw_campo.SetItem(n,1,'codmedica')
	n = dw_campo.InsertRow(0)
	dw_campo.SetItem(n,1,'medicamento')
elseif dw_c.GetItemString(f,'tipo_memo') = 'D' then//diagnostico
	if dw_c.GetItemString(f,'plant_tipo')='C' or dw_c.GetItemString(f,'plant_tipo')='P' or dw_c.GetItemString(f,'plant_tipo')='O' then
		if dw_c.GetItemString(f,'diagprin') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagprin')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagprin')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'tipodiag')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_tipodiag')
		end if
		if dw_c.GetItemString(f,'diagrel1') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagrel1')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagrel1')
		end if
		if dw_c.GetItemString(f,'diagrel2') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagrel2')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagrel2')
		end if
		if dw_c.GetItemString(f,'diagrel3') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagrel3')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagrel3')
		end if
		if dw_c.GetItemString(f,'diagrel4') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagrel4')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagrel4')
		end if
		if dw_c.GetItemString(f,'diagrel5') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagrel5')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagrel5')
		end if
	
	end if
	if (dw_c.GetItemString(f,'plant_tipo')='H' or dw_c.GetItemString(f,'plant_tipo')='Q' ) and dw_c.GetItemString(f,'ingreso') = 'I'  then
		if dw_c.GetItemString(f,'diagingre') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagingre')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagingre')
		end if
		if dw_c.GetItemString(f,'diagingre1') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagingre1')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagingre1')
		end if
		if dw_c.GetItemString(f,'diagingre2') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagingre2')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagingre2')
		end if
		if dw_c.GetItemString(f,'diagingre3') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagingre3')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagingre3')
		end if
		if dw_c.GetItemString(f,'diagcomplica') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagcomplica')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagcomplica')
		end if
	end if
	if (dw_c.GetItemString(f,'plant_tipo')='H' or dw_c.GetItemString(f,'plant_tipo')='Q' ) and dw_c.GetItemString(f,'ingreso') = 'S'  then
		if dw_c.GetItemString(f,'diagegreso') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagegreso')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagegreso')
		end if
		if dw_c.GetItemString(f,'diagegreso1') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagegreso1')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagegreso1')
		end if
		if dw_c.GetItemString(f,'diagegreso2') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagegreso2')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagegreso2')
		end if
		if dw_c.GetItemString(f,'diagegreso3') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagegreso3')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagegreso3')
		end if
		if dw_c.GetItemString(f,'diagcompli') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'diagcompli')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_diagcompli')
		end if
		if dw_c.GetItemString(f,'causamuerte') = '1' then
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'causamuerte')
			n = dw_campo.InsertRow(0)
			dw_campo.SetItem(n,1,'desc_causamuerte')
		end if
		n = dw_campo.InsertRow(0)
		dw_campo.SetItem(n,1,'diasincapacidad')
		n = dw_campo.InsertRow(0)
		dw_campo.SetItem(n,1,'desc_estadosalida')
		n = dw_campo.InsertRow(0)
		dw_campo.SetItem(n,1,'cprof')
		n = dw_campo.InsertRow(0)
		dw_campo.SetItem(n,1,'profesional')
		n = dw_campo.InsertRow(0)
		dw_campo.SetItem(n,1,'conductaurg')
		n = dw_campo.InsertRow(0)
		dw_campo.SetItem(n,1,'desc_conductaurg')
	end if
elseif dw_c.GetItemString(f,'tipo_memo') = 'P' then
	n = dw_campo.InsertRow(0)
	dw_campo.SetItem(n,1,'cproced')
	n = dw_campo.InsertRow(0)
	dw_campo.SetItem(n,1,'descripcion')
	n = dw_campo.InsertRow(0)
	dw_campo.SetItem(n,1,'codrip_prin')
	n = dw_campo.InsertRow(0)
	dw_campo.SetItem(n,1,'desdiag_prin')
end if
blob memo
string cp, texto
int nc

cp = dw_c.GetItemString(f,'codplantilla')
nc = dw_c.GetItemNumber(f,'numcampo')
SQLCA.Autocommit = TRUE
selectblob plantilla into :memo from hclin_plantcampo
where codplantilla=:cp and numcampo=:nc;
SQLCA.Autocommit = FALSE
texto = f_rtf(string(memo),FALSE)
rte_2.PasteRTF(texto,Detail!)
rte_2.Modified = FALSE
end event

event closequery;if rte_2.Modified then
	int ret
	ret = MessageBox('Aviso','Ha realizado cambio. Desea grabarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		if pb_5.Event clicked() = -1 then
			Return -1
		end if
	elseif ret = 3 then
		Return -1
	end if
end if

end event

type st_1 from statictext within w_plantcampo
integer x = 1248
integer y = 636
integer width = 357
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vista Previa"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rte_2 from richtextedit within w_plantcampo
integer x = 50
integer y = 720
integer width = 2711
integer height = 1148
integer taborder = 80
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_toolbar = true
long init_leftmargin = 2000
long init_rightmargin = 2000
borderstyle borderstyle = stylelowered!
end type

type pb_9 from picturebutton within w_plantcampo
integer x = 1234
integer y = 308
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean flatstyle = true
boolean originalsize = true
string picturename = "puerta.gif"
alignment htextalign = left!
string powertiptext = "Salir y Cancelar"
end type

event clicked;close(parent)
end event

type pb_5 from picturebutton within w_plantcampo
integer x = 1234
integer y = 180
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean flatstyle = true
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Plantilla"
end type

event clicked;blob texto
string cp
int nc

texto=blob(rte_2.copyrtf(false,detail!))
cp = dw_c.GetItemString(dw_c.GetRow(),'codplantilla')
nc = dw_c.GetItemNumber(dw_c.GetRow(),'numcampo')
if not isnull(texto) and texto<>blob('') then
	sqlca.autocommit=true
	updateblob hclin_plantcampo set plantilla=:texto 
	where codplantilla=:cp and numcampo=:nc;
	if sqlca.SQLNRows < 1 then
		messagebox("Error actualizando campo plantilla",sqlca.sqlerrtext)
		rollback;
		sqlca.autocommit=false
		return -1
	end if
	sqlca.autocommit=false
end if
rte_2.Modified = FALSE
Return 0

end event

type pb_4 from picturebutton within w_plantcampo
integer x = 1234
integer y = 52
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean flatstyle = true
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Insertar campo en Plantilla"
end type

event clicked;dw_campo.accepttext()
rte_2.InputFieldInsert ( dw_campo.getitemstring(dw_campo.getrow(),'nombre'))
rte_2.SetFocus()
end event

type dw_campo from datawindow within w_plantcampo
integer x = 41
integer y = 40
integer width = 1102
integer height = 632
integer taborder = 50
string title = "none"
string dataobject = "dw_campo_plant_rtf"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if dwo.name='nombre' then pb_4.triggerevent(clicked!)
end event

event itemchanged;string actual
actual=getitemstring(getrow(),'nombre')
if isnull(actual) then actual=''
if actual<>'' then//le cambiaron el nombre y toca ir a cambiarlo
	do while rte_2.inputfieldlocate(first!,actual)<>''
		rte_2.InputFieldDeleteCurrent()
		rte_2.InputFieldInsert ( data)
	loop
end if
end event

type st_7 from statictext within w_plantcampo
integer x = 1445
integer y = 56
integer width = 1751
integer height = 208
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Adicione el texto que considere necesario ubicando los campos de la lista dentro del texto. Estos campos serán remplazados con los valores almacenados en la Base de Datos"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

