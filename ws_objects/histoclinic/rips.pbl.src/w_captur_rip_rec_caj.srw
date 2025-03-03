$PBExportHeader$w_captur_rip_rec_caj.srw
forward
global type w_captur_rip_rec_caj from window
end type
type pb_1 from picturebutton within w_captur_rip_rec_caj
end type
type st_fact from statictext within w_captur_rip_rec_caj
end type
type s_fact from statictext within w_captur_rip_rec_caj
end type
type dw_2 from datawindow within w_captur_rip_rec_caj
end type
type st_edad from statictext within w_captur_rip_rec_caj
end type
type st_sex from statictext within w_captur_rip_rec_caj
end type
type s_edad from statictext within w_captur_rip_rec_caj
end type
type s_sex from statictext within w_captur_rip_rec_caj
end type
type st_docu from statictext within w_captur_rip_rec_caj
end type
type s_doc from statictext within w_captur_rip_rec_caj
end type
type s_pac from statictext within w_captur_rip_rec_caj
end type
type st_paci from statictext within w_captur_rip_rec_caj
end type
type cb_registra from picturebutton within w_captur_rip_rec_caj
end type
type dw_trae from datawindow within w_captur_rip_rec_caj
end type
type st_2 from statictext within w_captur_rip_rec_caj
end type
type cbx_replica from checkbox within w_captur_rip_rec_caj
end type
type sle_5 from singlelineedit within w_captur_rip_rec_caj
end type
type sle_3 from singlelineedit within w_captur_rip_rec_caj
end type
type sle_2 from singlelineedit within w_captur_rip_rec_caj
end type
type sle_1 from singlelineedit within w_captur_rip_rec_caj
end type
type gb_4 from groupbox within w_captur_rip_rec_caj
end type
type gb_3 from groupbox within w_captur_rip_rec_caj
end type
type cb_guarda from picturebutton within w_captur_rip_rec_caj
end type
type st_1 from statictext within w_captur_rip_rec_caj
end type
type rb_anul from radiobutton within w_captur_rip_rec_caj
end type
type rb_incomp from radiobutton within w_captur_rip_rec_caj
end type
type rb_comp from radiobutton within w_captur_rip_rec_caj
end type
type rb_tod from radiobutton within w_captur_rip_rec_caj
end type
type dw_rias from datawindow within w_captur_rip_rec_caj
end type
type sle_4 from singlelineedit within w_captur_rip_rec_caj
end type
type gb_1 from groupbox within w_captur_rip_rec_caj
end type
type gb_2 from groupbox within w_captur_rip_rec_caj
end type
end forward

global type w_captur_rip_rec_caj from window
integer width = 3630
integer height = 1316
boolean titlebar = true
string title = "Captura de RIPS"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rip_f.ico"
string pointer = "Arrow!"
boolean center = true
pb_1 pb_1
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
end type
global w_captur_rip_rec_caj w_captur_rip_rec_caj

type variables
int xant,yant
string sexo_paci,orden,anterior,ord,ant
datawindowchild dw_contrato
end variables

on w_captur_rip_rec_caj.create
this.pb_1=create pb_1
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
this.Control[]={this.pb_1,&
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
this.gb_2}
end on

on w_captur_rip_rec_caj.destroy
destroy(this.pb_1)
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
end on

event open;dw_rias.settransobject(sqlca)
st_factus st
st=message.powerobjectparm
if dw_trae.retrieve(st.desde,st.hasta,clugar)>0 then 
	cb_registra.triggerevent(clicked!)
else
	close(this)
end if
end event

type pb_1 from picturebutton within w_captur_rip_rec_caj
integer x = 1678
integer y = 1092
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type st_fact from statictext within w_captur_rip_rec_caj
integer x = 2313
integer y = 40
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

type s_fact from statictext within w_captur_rip_rec_caj
integer x = 2158
integer y = 44
integer width = 155
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
string text = "Recibo"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_captur_rip_rec_caj
boolean visible = false
integer x = 2661
integer y = 40
integer width = 475
integer height = 72
boolean enabled = false
string title = "none"
string dataobject = "dw_trae_rips_solos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_edad from statictext within w_captur_rip_rec_caj
integer x = 1778
integer y = 40
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

type st_sex from statictext within w_captur_rip_rec_caj
integer x = 1463
integer y = 40
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

type s_edad from statictext within w_captur_rip_rec_caj
integer x = 1669
integer y = 44
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

type s_sex from statictext within w_captur_rip_rec_caj
integer x = 1358
integer y = 40
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

type st_docu from statictext within w_captur_rip_rec_caj
integer x = 878
integer y = 40
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

type s_doc from statictext within w_captur_rip_rec_caj
integer x = 640
integer y = 40
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

type s_pac from statictext within w_captur_rip_rec_caj
integer x = 654
integer y = 112
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

type st_paci from statictext within w_captur_rip_rec_caj
integer x = 878
integer y = 108
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

type cb_registra from picturebutton within w_captur_rip_rec_caj
event mousemove pbm_mousemove
boolean visible = false
integer x = 914
integer y = 1100
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Registrar Procedimientos"
end type

event clicked;if dw_trae.rowcount()<1 then return
string cemp,ccontrato,tdocu,docum,clugar_fac,clugar_rec,clug_cita
long j,donde,contador,nserv,k,nfact,ncit,nservcit,sec_cant_cita,nrec,item_rec,nitem_rec
datetime fecha,fecha_cit,hora_cit
boolean hadicho=false
dw_trae.setsort("nrcaj A")
dw_trae.sort()
tdocu=""
docum=""
nfact=0
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
		item_rec=dw_trae.getitemnumber(j,"items")
		nitem_rec=dw_trae.getitemnumber(j,"nitem")
		if tdocu<>dw_trae.getitemstring(j,"tipodoc") or docum<>dw_trae.getitemstring(j,"documento") or nrec<>dw_trae.getitemnumber(j,"nrcaj") then
			tdocu=dw_trae.getitemstring(j,"tipodoc")
			docum=dw_trae.getitemstring(j,"documento")
			nrec=dw_trae.getitemnumber(j,"nrcaj")
			clugar_rec=dw_trae.getitemstring(j,"clugar")
			setnull(nfact)
			setnull(clugar_fac)//=dw_trae.getitemstring(j,"clugar")
			nserv=1
			setnull(contador)
			fecha=dw_trae.getitemdatetime(j,"fecha_cit")
			if isnull(fecha) then fecha=dw_trae.getitemdatetime(j,"fecha_rec")
//			select max(contador) into :contador from historial where clugar=:clugar;
//			if isnull(contador) then contador=0
//			contador ++
			contador=f_trae_ndoc('HIS',clugar,'Historial')
			insert into historial (contador,clugar,tipodoc,documento,fecha,indapdx) values (:contador,:clugar,:tdocu,:docum,:fecha,'0');
			if sqlca.sqlcode= -1 then
				messagebox("Error insertando registro en Historial",sqlca.sqlerrtext)
				rollback;
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
			dw_trae.setitem(j,"clugar_his",clugar)
			dw_trae.setitem(j,"nservicio",nserv)
			dw_2.insertrow(1)
			dw_2.setitem(1,1,contador)
			dw_2.setitem(1,2,nserv)
			dw_2.setitem(1,3,clugar)
			nserv ++
			if not isnull(dw_trae.getitemstring(j,"cproced")) then
				dw_rias.setitem(donde,"cproced",dw_trae.getitemstring(j,"proccups"))
			else
				dw_rias.setitem(donde,"c_medica",dw_trae.getitemstring(j,"c_medica"))
			end if
			dw_rias.setitem(donde,"rips_descripcion",dw_trae.getitemstring(j,"rips"))
			dw_rias.setitem(donde,"rips",dw_trae.getitemstring(j,"rips"))
			fecha=dw_trae.getitemdatetime(j,"fecha_cit")
			if isnull(fecha) then fecha=dw_trae.getitemdatetime(j,"fecha_rec")
			dw_rias.setitem(donde,"s_fecha",fecha)
			dw_rias.setitem(donde,"s_cantidad",1)
			dw_rias.setitem(donde,"cprof",dw_trae.getitemstring(j,"prof"))
			dw_rias.setitem(donde,"cufuncional",dw_trae.getitemstring(j,"cufuncional"))
			dw_rias.setitem(donde,"cccosto",dw_trae.getitemstring(j,"cccosto"))
			dw_rias.setitem(donde,"nrcaj",nrec)
			dw_rias.setitem(donde,"clugar_rec",clugar_rec)
			dw_rias.setitem(donde,"items",item_rec)
			dw_rias.setitem(donde,"nitem_rec",nitem_rec)
			dw_rias.setitem(donde,"nautoriza",dw_trae.getitemstring(j,"autorizacion"))
			//se agrego para qeu salga por defecto de procedimientos//
			if dw_trae.getitemstring(j,"rips")<>'1' then dw_rias.setitem(donde,"s_finalidadproced",dw_trae.getitemstring(j,"tipoproc"))
			dw_rias.setitem(donde,"cprocedeq",dw_trae.getitemstring(j,"cproced"))
			dw_rias.setitem(donde,"cmanual",dw_trae.getitemstring(j,"codmanual"))
			dw_rias.setitem(donde,"cemp",cemp)
			dw_rias.setitem(donde,"cplan",dw_trae.getitemstring(j,"cplan"))
			dw_rias.setitem(donde,"ccontrato",ccontrato)
			dw_rias.setitem(donde,"clugar",clugar)
			dw_rias.setitem(j,"estria","2")
			dw_rias.setitem(j,"nautoriza",dw_trae.getitemstring(j,"autorizacion"))
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
						messagebox("Error cambiando estado de cita",sqlca.sqlerrtext)
						rollback;
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
//		cb_trae.triggerevent(clicked!)
	end if
end if
end event

type dw_trae from datawindow within w_captur_rip_rec_caj
event mousemove pbm_dwnmousemove
boolean visible = false
integer x = 46
integer y = 1096
integer width = 850
integer height = 116
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dw_rec_sin_rip_nro"
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

event retrieveend;long j
for j=1 to rowcount()
	setitem(j,'esco','1')
next
end event

type st_2 from statictext within w_captur_rip_rec_caj
integer x = 169
integer y = 52
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

type cbx_replica from checkbox within w_captur_rip_rec_caj
integer x = 78
integer y = 56
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

type sle_5 from singlelineedit within w_captur_rip_rec_caj
integer x = 2121
integer y = 976
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

type sle_3 from singlelineedit within w_captur_rip_rec_caj
integer x = 1746
integer y = 976
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

type sle_2 from singlelineedit within w_captur_rip_rec_caj
integer x = 3250
integer y = 976
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

type sle_1 from singlelineedit within w_captur_rip_rec_caj
integer x = 2939
integer y = 976
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

type gb_4 from groupbox within w_captur_rip_rec_caj
integer x = 1682
integer y = 920
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

type gb_3 from groupbox within w_captur_rip_rec_caj
integer x = 2903
integer y = 920
integer width = 672
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

type cb_guarda from picturebutton within w_captur_rip_rec_caj
event mousemove pbm_mousemove
integer x = 1504
integer y = 1092
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
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;if dw_rias.getitemnumber(1,'controles') >0 then 
	messagebox("Atención","Faltan datos obligatorios en alguno de los procedimientos verifique")
end if
if dw_rias.update() = 1 then 
	commit;
	//w_hist_gral.dw_historial.triggerevent(rowfocuschanged!)
end if
end event

type st_1 from statictext within w_captur_rip_rec_caj
integer x = 2153
integer y = 112
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

type rb_anul from radiobutton within w_captur_rip_rec_caj
integer x = 1024
integer y = 980
integer width = 297
integer height = 48
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

type rb_incomp from radiobutton within w_captur_rip_rec_caj
integer x = 667
integer y = 980
integer width = 347
integer height = 48
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

type rb_comp from radiobutton within w_captur_rip_rec_caj
integer x = 329
integer y = 980
integer width = 325
integer height = 48
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

type rb_tod from radiobutton within w_captur_rip_rec_caj
integer x = 82
integer y = 976
integer width = 242
integer height = 64
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

type dw_rias from datawindow within w_captur_rip_rec_caj
integer x = 59
integer y = 176
integer width = 3529
integer height = 744
integer taborder = 80
string dragicon = "none!"
string dataobject = "dw_rips_solo_rec"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event updatestart;long i , filas
string nv_est,estr
filas=this.rowcount()
for i=1 to filas
	nv_est=this.getitemstring(i,'estado')
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
string cod,nulo,col,este=''
long colum,veri
int l_i
st_return_diags st

setnull(nulo)
col=this.getcolumnname()
colum=this.getcolumn()
if colum=13 then
	select desesp into :st_1.text from especialidades where codesp= :data;
	if st_1.text="" then return 1
end if
choose case colum
	case 7
		if cbx_replica.checked then
			for l_i=1 to this.rowcount()
				if l_i<>row then
					if isnull(this.getitemstring(l_i,string(dwo.name))) then
						this.setitem(l_i,dwo.name,data)
					end if
				end if
			next
		end if
	case 9
		if cbx_replica.checked then
			for l_i=1 to rowcount()
				setitem(l_i,"s_fecha",datetime(data))
			next
		end if
	case 13, 15, 17, 33, 35, 37
		if cbx_replica.checked then
			for l_i=1 to this.rowcount()
				if l_i<>row and not isnull(this.getitemstring(l_i,"r_"+mid(dwo.name,3))) then
					if isnull(this.getitemstring(l_i,string(dwo.name))) then
						if (this.getitemstring(row,'s_fin_consulta') >='01' and this.getitemstring(row,'s_fin_consulta') <= '08') then 
							this.setitem(row,'s_causaexterna',"15")
						else
							this.setitem(row,'s_causaexterna',nulo)
						end if 
						veri=f_valida_fin_con(this.getitemstring(l_i,'s_fin_consulta'),this.getitemstring(l_i,'s_causaexterna'),this.getitemstring(l_i,"sexo"),this.getitemnumber(l_i,"dias"),this.getitemstring(l_i,'s_diagprin'))
						if veri=-1 then
							this.setitem(l_i,dwo.name,'')
							return 1
						end if
						this.setitem(l_i,dwo.name,data)
					end if
				end if
			next
		end if
		if (this.getitemstring(row,'s_fin_consulta') >='01' and this.getitemstring(row,'s_fin_consulta') <= '08') then 
			this.setitem(row,'s_causaexterna',"15")
		else
			this.setitem(row,'s_causaexterna',nulo)
		end if 
		veri=f_valida_fin_con(this.getitemstring(row,'s_fin_consulta'),this.getitemstring(row,'s_causaexterna'),this.getitemstring(row,"sexo"),this.getitemnumber(row,"dias"),this.getitemstring(row,'s_diagprin'))
		if veri=-1 then
			this.setitem(row,colum,"")
			return 1
		end if
	case 64,65,66,67,68
		if data<>"" then
			if cbx_replica.checked then
				st=f_check_diag(data,sex_busca,edad_busca,este,'0',this.getitemstring(row,'rips'),'0')
				if st.descrip_diag="" then
					this.setitem(row,colum,"")
					this.setitem(row,left(col,len(col)-1),nulo)
					return 1
				end if
				for l_i=1 to this.rowcount()
					this.setitem(l_i,left(col,len(col)-1),este)
					this.setitem(l_i,left(col,len(col)),data)
				next
			else
				st=f_check_diag(data,sex_busca,edad_busca,este,'0',this.getitemstring(row,'rips'),'0')
				if st.descrip_diag="" then
					this.setitem(row,colum,"")
					this.setitem(row,left(col,len(col)-1),nulo)
					return 1
				end if
				st_1.text=st.descrip_diag
				this.setitem(row,left(col,len(col)-1),este)
			end if
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
long colum
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
			este=this.getitemstring(row,left(col,len(col)-1))
			st=f_check_diag(this.getitemstring(row,colum),this.getitemstring(row,"sexo"),this.getitemnumber(row,"dias"),este,'0',this.getitemstring(row,'rips'),'0')
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

event itemerror;return 1
end event

type sle_4 from singlelineedit within w_captur_rip_rec_caj
integer x = 2487
integer y = 976
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

type gb_1 from groupbox within w_captur_rip_rec_caj
integer x = 55
integer y = 920
integer width = 1280
integer height = 136
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

type gb_2 from groupbox within w_captur_rip_rec_caj
integer x = 32
integer width = 3570
integer height = 1088
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

