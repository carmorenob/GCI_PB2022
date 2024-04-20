$PBExportHeader$w_kits_hosp.srw
forward
global type w_kits_hosp from window
end type
type pb_6 from picturebutton within w_kits_hosp
end type
type pb_5 from picturebutton within w_kits_hosp
end type
type pb_4 from picturebutton within w_kits_hosp
end type
type pb_3 from picturebutton within w_kits_hosp
end type
type pb_2 from picturebutton within w_kits_hosp
end type
type pb_1 from picturebutton within w_kits_hosp
end type
type dw_subdeta from datawindow within w_kits_hosp
end type
type dw_osdeta from datawindow within w_kits_hosp
end type
type dw_osarea from datawindow within w_kits_hosp
end type
type gb_1 from groupbox within w_kits_hosp
end type
type gb_2 from groupbox within w_kits_hosp
end type
type gb_3 from groupbox within w_kits_hosp
end type
type pb_sub_ins from picturebutton within w_kits_hosp
end type
type pb_sub_del from picturebutton within w_kits_hosp
end type
type pb_sub_save from picturebutton within w_kits_hosp
end type
end forward

global type w_kits_hosp from window
integer width = 4466
integer height = 2352
boolean titlebar = true
string title = "Procedimientos y/o Kits Frecuentes para Ordenes de Servicio en Hosp/Urg"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
boolean center = true
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_subdeta dw_subdeta
dw_osdeta dw_osdeta
dw_osarea dw_osarea
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
pb_sub_ins pb_sub_ins
pb_sub_del pb_sub_del
pb_sub_save pb_sub_save
end type
global w_kits_hosp w_kits_hosp

type variables
string area
long item
end variables

on w_kits_hosp.create
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_subdeta=create dw_subdeta
this.dw_osdeta=create dw_osdeta
this.dw_osarea=create dw_osarea
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.pb_sub_ins=create pb_sub_ins
this.pb_sub_del=create pb_sub_del
this.pb_sub_save=create pb_sub_save
this.Control[]={this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_subdeta,&
this.dw_osdeta,&
this.dw_osarea,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.pb_sub_ins,&
this.pb_sub_del,&
this.pb_sub_save}
end on

on w_kits_hosp.destroy
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_subdeta)
destroy(this.dw_osdeta)
destroy(this.dw_osarea)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.pb_sub_ins)
destroy(this.pb_sub_del)
destroy(this.pb_sub_save)
end on

event resize;gb_1.resize(newwidth -50,600)
dw_osarea.resize(newwidth -300,512)
pb_1.x=newwidth -200
pb_2.x=newwidth -200
pb_3.x=newwidth -200
gb_2.resize(newwidth -50,812)
dw_osdeta.resize(newwidth -300,716)
pb_4.x=newwidth -200
pb_5.x=newwidth -200
pb_6.x=newwidth -200
gb_3.resize(newwidth -50,780)
dw_subdeta.resize(newwidth -300,696)
pb_sub_ins.x=newwidth -200
pb_sub_save.x=newwidth -200
pb_sub_del.x=newwidth -200
end event

type pb_6 from picturebutton within w_kits_hosp
string tag = "Guardar &Proc."
integer x = 4219
integer y = 1072
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;dw_osdeta.accepttext()
if dw_osdeta.update()=-1 then
	rollback;
else
	commit;
end if
end event

type pb_5 from picturebutton within w_kits_hosp
string tag = "Bor&rar Proc."
integer x = 4219
integer y = 924
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
end type

event clicked;dw_osdeta.deleterow(0)
if dw_osdeta.update()=-1 then
	rollback;
	dw_osarea.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_4 from picturebutton within w_kits_hosp
string tag = "&Insertar Proc."
integer x = 4219
integer y = 772
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = " "
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;long donde

donde=dw_osdeta.insertrow(0)
dw_osdeta.scrolltorow(donde)
item=dw_osdeta.getitemnumber(dw_osdeta.getrow(),'m_deta')
if isnull(item) then item=0
item++
dw_osdeta.setitem(donde,'codarea',area)
dw_osdeta.setitem(donde,'item',item)
dw_osdeta.setfocus()
end event

type pb_3 from picturebutton within w_kits_hosp
string tag = "&Guadar Areas"
integer x = 4219
integer y = 480
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
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;dw_osarea.accepttext()
if dw_osarea.update()=-1 then
	rollback;
else
	commit;
end if
end event

type pb_2 from picturebutton within w_kits_hosp
string tag = "&Borrar Area"
integer x = 4219
integer y = 332
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_osarea.deleterow(0)
if dw_osarea.update()=-1 then
	rollback;
	dw_osarea.retrieve()
else
	commit;
end if
end event

type pb_1 from picturebutton within w_kits_hosp
string tag = "Insertar &Area"
integer x = 4219
integer y = 180
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;long donde
int l_ar
donde=dw_osarea.insertrow(0)
l_ar=dw_osarea.getitemnumber(dw_osarea.getrow(),'m_area')
l_ar++
If l_ar< 10 then 
	area='0'+string(l_ar)
else
	area=string(l_ar)
end if
dw_osarea.setitem(donde,'codarea',area)
dw_osarea.scrolltorow(donde)
dw_osarea.setfocus()
end event

type dw_subdeta from datawindow within w_kits_hosp
integer x = 59
integer y = 1512
integer width = 4151
integer height = 696
integer taborder = 90
string title = "none"
string dataobject = "dw_ossubdeta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event itemchanged;string snulo,veri,pr
setnull(snulo)
if this.getcolumnname()='proced' then
	pr=this.gettext()
	if pr='' then return
	setnull(veri)
	select left(descripcion,190) into :veri from proced where codproced=:pr and estado='1';
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo Proced",sqlca.sqlerrtext)
		return 1
	end if
	if isnull(veri) then return 1
	this.setitem(this.getrow(),'descripcion',veri)
	this.setitem(this.getrow(),'medicamento',snulo)
	this.setitem(this.getrow(),'c_medica',snulo)
	this.accepttext()
end if
if this.getcolumnname()='c_medica' then
	pr=this.gettext()
	if pr='' then return
	setnull(veri)
	select left(medicamento,190) into :veri from medicamentos where c_medica=:pr ;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo Medicamentos",sqlca.sqlerrtext)
		return 1
	end if
	if isnull(veri) then return 1
	this.setitem(this.getrow(),'descripcion',snulo)
	this.setitem(this.getrow(),'medicamento',veri)
	this.setitem(this.getrow(),'proced',snulo)
	this.accepttext()
end if
end event

event doubleclicked;if getcolumnname()='cod_cups' then
		open(w_busca_proc)
		st_proced stp
		stp=message.powerobjectparm
		if not isvalid(stp) then return
		if stp.interno<>'' then
			setitem(getrow(),'proced',stp.interno)
			setitem(getrow(),'cod_cups',stp.cups)
			setitem(getrow(),'cod_version',stp.version)
			setitem(getrow(),'descripcion',stp.descrip)
			triggerevent(itemchanged!)
		end if
end if
if getcolumnname()='c_medica' then
	st_pa_medica st_medx

	st_medx.origen= '1'
	openwithparm(w_busca_med,st_medx)	
	st_med st
	st=message.powerobjectparm
	if not isvalid(st) then return
	if st.cmedica<>'' then
		setitem(getrow(),'c_medica',st.cmedica)
		triggerevent(itemchanged!)
	end if
end if
end event

type dw_osdeta from datawindow within w_kits_hosp
integer x = 64
integer y = 684
integer width = 4105
integer height = 716
integer taborder = 40
string title = "none"
string dataobject = "dw_osdeta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event rowfocuschanged;long fila
fila=this.getrow()
if fila<1 then return
this.selectrow(0,false)
this.selectrow(fila,true)
item=this.getitemnumber(fila,'item')
dw_subdeta.reset()
if this.getitemstring(fila,'tipo')='K' then
	dw_subdeta.retrieve(area,item)
	pb_sub_ins.visible=true
	pb_sub_del.visible=true
	pb_sub_save.visible=true
else
	pb_sub_ins.visible=false
	pb_sub_del.visible=false
	pb_sub_save.visible=false
end if
end event

event itemchanged;if this.getcolumnname()='tipo' then
	string snulo
	setnull(snulo)
	this.setitem(this.getrow(),'proced',snulo)
	this.setitem(this.getrow(),'descripcion',snulo)
	this.setitem(this.getrow(),'ordenmedica',snulo)
	this.setitem(this.getrow(),'des_com',snulo)
	this.accepttext()
	if data='K' then
		dw_subdeta.retrieve(area,item)
		pb_sub_ins.visible=true
		pb_sub_del.visible=true
		pb_sub_save.visible=true
		this.setitem(this.getrow(),'ordenmedica',snulo)
	else
		pb_sub_ins.visible=false
		pb_sub_del.visible=false
		pb_sub_save.visible=false
	end if
end if
if this.getcolumnname()='cod_cups' then
	string veri,pr,vers
	pr=this.gettext()
	if pr='' then return		

	if this.getitemstring(this.getrow(),'tipo')='P' then
		setnull(veri)
		vers=getitemstring(this.getrow(),'cod_version')
		if vers='' then return
		select left(descripcion,190) into :veri from proced where cod_cups=:pr and estado='1' and cod_version=:vers;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo Proced",sqlca.sqlerrtext)
			return 1
		end if
	else
		select left(medicamento,190) into :veri from medicamentos where c_medica=:pr;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo Medicamentos",sqlca.sqlerrtext)
			return 1
		end if
	end if
	if isnull(veri) then return 1
	this.setitem(this.getrow(),'descripcion',veri)
	this.setitem(this.getrow(),'des_com',veri)
	this.accepttext()
end if
if this.getcolumnname()='des_com' then
	if this.getitemstring(this.getrow(),'tipo')='K' then
		this.setitem(this.getrow(),'ordenmedica',data)	
	else
		this.setitem(this.getrow(),'descripcion',data)
	end if
end if
end event

event doubleclicked;If isnull(getitemstring(getrow(),'tipo')) then return
if getcolumnname()='cod_cups' then
	if getitemstring(getrow(),'tipo')='P' then
		open(w_busca_proc)
		st_proced stp
		stp=message.powerobjectparm
		if not isvalid(stp) then return
		if stp.interno<>'' then
			setitem(getrow(),'proced',stp.interno)
			setitem(getrow(),'cod_cups',stp.cups)
			setitem(getrow(),'cod_version',stp.version)
			setitem(getrow(),'des_com',stp.descrip)
			triggerevent(itemchanged!)
		end if
	else
		st_pa_medica st_medx

		st_medx.origen= '1'
		openwithparm(w_busca_med,st_medx)
		st_med st
		st=message.powerobjectparm
		if not isvalid(st) then return
		if st.cmedica<>'' then
			setitem(getrow(),'proced',st.cmedica)
			setitem(getrow(),'cod_cups',st.cmedica)			
			triggerevent(itemchanged!)
		end if
	end if
end if
end event

type dw_osarea from datawindow within w_kits_hosp
integer x = 69
integer y = 76
integer width = 4114
integer height = 512
integer taborder = 10
string title = "none"
string dataobject = "dw_osarea"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve()
end event

event rowfocuschanged;long fila
fila=this.getrow()
if fila<1 then return
this.selectrow(0,false)
this.selectrow(fila,true)
dw_subdeta.reset()
dw_osdeta.reset()
area=this.getitemstring(fila,"codarea")
dw_osdeta.retrieve(area)

end event

type gb_1 from groupbox within w_kits_hosp
integer x = 41
integer y = 20
integer width = 4393
integer height = 600
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Areas"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_kits_hosp
integer x = 37
integer y = 628
integer width = 4393
integer height = 812
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos / Kits del Area:"
borderstyle borderstyle = styleraised!
end type

type gb_3 from groupbox within w_kits_hosp
integer x = 32
integer y = 1452
integer width = 4398
integer height = 780
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de los Kits:"
borderstyle borderstyle = styleraised!
end type

type pb_sub_ins from picturebutton within w_kits_hosp
string tag = "Insertar Proc."
integer x = 4219
integer y = 1596
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;long donde
int l_sdeta

donde=dw_subdeta.insertrow(0)
dw_subdeta.scrolltorow(donde)
l_sdeta=dw_subdeta.getitemnumber(dw_subdeta.getrow(),'m_sdeta')
if isnull(l_sdeta) then l_sdeta=0
l_sdeta++
dw_subdeta.setitem(donde,'codarea',area)
dw_subdeta.setitem(donde,'item',item)
dw_subdeta.setitem(donde,'subitem',l_sdeta)
dw_subdeta.setfocus()
end event

type pb_sub_del from picturebutton within w_kits_hosp
string tag = "Borrar Proc."
integer x = 4219
integer y = 1748
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_subdeta.deleterow(0)
if dw_subdeta.update()=-1 then
	rollback;
	dw_osdeta.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_sub_save from picturebutton within w_kits_hosp
string tag = "Guardar Procs."
integer x = 4219
integer y = 1892
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;dw_subdeta.accepttext()
if dw_subdeta.update()=-1 then
	rollback;
else
	commit;
end if
end event

