$PBExportHeader$w_genera_202.srw
forward
global type w_genera_202 from window
end type
type pb_inicia from picturebutton within w_genera_202
end type
type dw_2 from datawindow within w_genera_202
end type
type st_8 from statictext within w_genera_202
end type
type st_7 from statictext within w_genera_202
end type
type em_21 from editmask within w_genera_202
end type
type em_11 from editmask within w_genera_202
end type
type em_1 from editmask within w_genera_202
end type
type pb_genera from picturebutton within w_genera_202
end type
type dw_1 from datawindow within w_genera_202
end type
type gb_1 from groupbox within w_genera_202
end type
end forward

global type w_genera_202 from window
integer width = 3717
integer height = 1592
boolean titlebar = true
string title = "Genera 202"
boolean controlmenu = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_inicia pb_inicia
dw_2 dw_2
st_8 st_8
st_7 st_7
em_21 em_21
em_11 em_11
em_1 em_1
pb_genera pb_genera
dw_1 dw_1
gb_1 gb_1
end type
global w_genera_202 w_genera_202

type variables


end variables

on w_genera_202.create
this.pb_inicia=create pb_inicia
this.dw_2=create dw_2
this.st_8=create st_8
this.st_7=create st_7
this.em_21=create em_21
this.em_11=create em_11
this.em_1=create em_1
this.pb_genera=create pb_genera
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_inicia,&
this.dw_2,&
this.st_8,&
this.st_7,&
this.em_21,&
this.em_11,&
this.em_1,&
this.pb_genera,&
this.dw_1,&
this.gb_1}
end on

on w_genera_202.destroy
destroy(this.pb_inicia)
destroy(this.dw_2)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.em_21)
destroy(this.em_11)
destroy(this.em_1)
destroy(this.pb_genera)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type pb_inicia from picturebutton within w_genera_202
integer x = 1531
integer y = 72
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
vtextalign vtextalign = top!
string powertiptext = "Inicia Mes"
end type

event clicked; delete from afiliados.tt_trabajo_202;
 If sqlca.sqlcode=-1 then
	  messagebox("Error borrando tt_trabajo_202",sqlca.sqlerrtext)
	  rollback;
	  return
Else
	commit;
End If
Messagebox("Finalizado", "Se ejecuto con exito el proceso" )
end event

type dw_2 from datawindow within w_genera_202
boolean visible = false
integer x = 2075
integer y = 24
integer width = 1531
integer height = 104
integer taborder = 50
string title = "none"
string dataobject = "dw_202_cargue"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_8 from statictext within w_genera_202
integer x = 722
integer y = 112
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

type st_7 from statictext within w_genera_202
integer x = 87
integer y = 116
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

type em_21 from editmask within w_genera_202
integer x = 832
integer y = 104
integer width = 393
integer height = 76
integer taborder = 60
boolean bringtotop = true
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

type em_11 from editmask within w_genera_202
integer x = 256
integer y = 108
integer width = 393
integer height = 76
integer taborder = 50
boolean bringtotop = true
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

type em_1 from editmask within w_genera_202
integer x = 32
integer y = 1252
integer width = 3602
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type pb_genera from picturebutton within w_genera_202
integer x = 1353
integer y = 72
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Emite el archivo"
end type

event clicked;int l_i
string ls_eapb,ls_rec
setnull(ls_eapb)
for l_i=1 to dw_1.rowcount()
	if dw_1.getitemnumber(l_i,'esc')=1 then
		if isnull(ls_eapb) then
			ls_eapb=dw_1.getitemstring(l_i,'codsuper')
		else
			ls_eapb=ls_eapb+','+dw_1.getitemstring(l_i,'codsuper')
		end if
	end if
next

em_1.text= "Se envia'"+ls_eapb+"'"
if g_motor='postgres' then
	if dw_2.retrieve(ls_eapb,datetime(em_11.text),datetime(em_21.text))>0 then
		ls_rec=dw_2.getitemstring(1,'sp_202_cargue')
		commit;
	else
		ls_rec ='No paso'
	end if
else

end if
em_1.text= ls_rec 
dw_1.retrieve()


end event

type dw_1 from datawindow within w_genera_202
integer x = 37
integer y = 268
integer width = 3602
integer height = 976
integer taborder = 30
string title = "none"
string dataobject = "dw_202_eapb"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
retrieve()
end event

type gb_1 from groupbox within w_genera_202
integer x = 37
integer y = 28
integer width = 1262
integer height = 204
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Periodo de Emisión"
end type

