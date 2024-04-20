$PBExportHeader$w_escog_espe.srw
forward
global type w_escog_espe from window
end type
type pb_aceptar from picturebutton within w_escog_espe
end type
type st_1 from statictext within w_escog_espe
end type
type dw_1 from datawindow within w_escog_espe
end type
end forward

global type w_escog_espe from window
integer width = 2514
integer height = 744
boolean titlebar = true
string title = "Elegir Especialidad del Médico RESPONSABLE"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean clientedge = true
boolean center = true
pb_aceptar pb_aceptar
st_1 st_1
dw_1 dw_1
end type
global w_escog_espe w_escog_espe

type variables
st_pa_evolucion i_stde
end variables

on w_escog_espe.create
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_aceptar,&
this.st_1,&
this.dw_1}
end on

on w_escog_espe.destroy
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;i_stde=message.powerobjectparm
dw_1.settransobject(sqlca)
dw_1.retrieve(i_stde.profes)

end event

type pb_aceptar from picturebutton within w_escog_espe
integer x = 1097
integer y = 488
integer width = 151
integer height = 132
integer taborder = 20
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
string powertiptext = "Aceptar"
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type st_1 from statictext within w_escog_espe
integer x = 37
integer y = 16
integer width = 2414
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Elija la Especialidad que aplique para el profesional, dando doble click sobre la fila o presionando aceptar"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_escog_espe
integer x = 37
integer y = 108
integer width = 2414
integer height = 348
integer taborder = 10
string title = "none"
string dataobject = "dw_espprof"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long fila
fila=getrow()
string espe
if fila<1 then return
datetime fentra,hentra
fentra=datetime(today())
hentra=datetime(today(),time(string(now())))
espe=this.getitemstring(fila,'cesp')
INSERT INTO HospRespon ( NH,clugar, CodTIngre, nitem, CodProf, CEsp, fecha_ini, hora_ini)
values (:i_stde.nh,:i_stde.clug_hadm,:i_stde.tingres,1,:i_stde.profes,:espe,:fentra,:hentra);
if sqlca.sqlcode=-1 then
	messagebox("Error insertando fila en HospRespon",sqlca.sqlerrtext)
	rollback;
else
	commit;
	if i_stde.ventana.classname()='w_new_at_os' then
		if g_motor='postgres' then
			select 
			 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
			 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof
			into :w_new_at_os.uo_1.st_respon.text from profe where codprof=:i_stde.profes;			
		else
			select 
			 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
			 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof
			into :w_new_at_os.uo_1.st_respon.text from profe where codprof=:i_stde.profes;
		end if
	end if
	close(parent)
end if

end event

