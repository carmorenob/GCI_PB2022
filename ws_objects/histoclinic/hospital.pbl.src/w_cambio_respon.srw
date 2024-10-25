$PBExportHeader$w_cambio_respon.srw
forward
global type w_cambio_respon from window
end type
type st_2 from statictext within w_cambio_respon
end type
type dw_espe from datawindow within w_cambio_respon
end type
type pb_cancel from picturebutton within w_cambio_respon
end type
type pb_aceptar from picturebutton within w_cambio_respon
end type
type st_1 from statictext within w_cambio_respon
end type
type dw_1 from datawindow within w_cambio_respon
end type
end forward

global type w_cambio_respon from window
integer width = 2066
integer height = 1124
boolean titlebar = true
string title = "Cambio de Responsable"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "r_cambio_resp.ico"
boolean clientedge = true
boolean center = true
st_2 st_2
dw_espe dw_espe
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_1 st_1
dw_1 dw_1
end type
global w_cambio_respon w_cambio_respon

type variables
long nitem
end variables

event open;string respon,espe
datetime fentra,hentra
setnull(respon)
SELECT CodProf, cesp, nitem into :respon,:espe,:nitem
FROM HospRespon
WHERE HospRespon.NH=:w_evolucion_new.i_stde.nh and clugar=:w_evolucion_new.i_stde.clug_hadm AND HospRespon.CodTIngre=:w_evolucion_new.i_stde.tingres AND HospRespon.fecha_fin Is Null;
if g_motor='postgres' then
   	dw_1.dataobject='dw_todos_prof_postgres'
else
	dw_1.dataobject='dw_todos_prof'
end if
dw_1.settransobject(sqlca)
dw_1.retrieve(respon,espe)


end event

on w_cambio_respon.create
this.st_2=create st_2
this.dw_espe=create dw_espe
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.st_2,&
this.dw_espe,&
this.pb_cancel,&
this.pb_aceptar,&
this.st_1,&
this.dw_1}
end on

on w_cambio_respon.destroy
destroy(this.st_2)
destroy(this.dw_espe)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.dw_1)
end on

type st_2 from statictext within w_cambio_respon
integer x = 46
integer y = 140
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Especialidad:"
boolean focusrectangle = false
end type

type dw_espe from datawindow within w_cambio_respon
integer x = 37
integer y = 176
integer width = 1609
integer height = 116
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_espe_unicas"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;this.accepttext()
dw_1.retrieve(this.getitemstring(1,1))
end event

type pb_cancel from picturebutton within w_cambio_respon
event mousemove pbm_mousemove
integer x = 1010
integer y = 884
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
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_cambio_respon
event mousemove pbm_mousemove
integer x = 846
integer y = 884
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar Nuevo Responsable"
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type st_1 from statictext within w_cambio_respon
integer x = 37
integer y = 8
integer width = 1957
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Elija la nueva especialidad responsable y luego elija el profesional al que va a ser remitido el paciente."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_cambio_respon
integer x = 41
integer y = 340
integer width = 1970
integer height = 508
integer taborder = 10
string title = "none"
string dataobject = "dw_todos_prof"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//this.settransobject(sqlca)
end event

event doubleclicked;long fila
fila=this.getrow()
if fila<1 then return
string profes,espe,desprofes
datetime fsale,hsale
fsale=datetime(today())
hsale=datetime(today(),time(string(now())))
update hosprespon set fecha_fin=:fsale , hora_fin=:hsale where nh=:w_evolucion_new.i_stde.nh and clugar=:w_evolucion_new.i_stde.clug_hadm and codtingre=:w_evolucion_new.i_stde.tingres and nitem=:nitem;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando el Ultimo responsable",sqlca.sqlerrtext)
	rollback;
	return
end if
select max(nitem) into :nitem from hosprespon where nh=:w_evolucion_new.i_stde.nh and clugar=:w_evolucion_new.i_stde.clug_hadm and codtingre=:w_evolucion_new.i_stde.tingres;
if isnull(nitem) then nitem=0
nitem ++
profes=this.getitemstring(fila,"codprof")
espe=dw_espe.getitemstring(1,1)
desprofes=this.getitemstring(fila,"desprof")
INSERT INTO HospRespon ( NH,clugar, CodTIngre, nitem, CodProf, CEsp, fecha_ini, hora_ini)
values (:w_evolucion_new.i_stde.nh, :w_evolucion_new.i_stde.clug_hadm,:w_evolucion_new.i_stde.tingres,:nitem,:profes,:espe,:fsale,:hsale);
if sqlca.sqlcode=-1 then
	messagebox("Error insertando Nuevo Responsable",sqlca.sqlerrtext)
	rollback;
else
	commit;
	w_evolucion_new.tab_1.tabp_new.st_respon.text=desprofes
	if isvalid(w_new_at_os) then w_new_at_os.uo_1.st_respon.text=desprofes
	close(parent)
end if
end event

