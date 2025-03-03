$PBExportHeader$w_estad_ria_qx.srw
forward
global type w_estad_ria_qx from window
end type
type st_2 from statictext within w_estad_ria_qx
end type
type cbx_replica from checkbox within w_estad_ria_qx
end type
type sle_5 from singlelineedit within w_estad_ria_qx
end type
type sle_3 from singlelineedit within w_estad_ria_qx
end type
type sle_2 from singlelineedit within w_estad_ria_qx
end type
type sle_1 from singlelineedit within w_estad_ria_qx
end type
type gb_4 from groupbox within w_estad_ria_qx
end type
type gb_3 from groupbox within w_estad_ria_qx
end type
type cb_cancel from picturebutton within w_estad_ria_qx
end type
type cb_guarda from picturebutton within w_estad_ria_qx
end type
type st_1 from statictext within w_estad_ria_qx
end type
type rb_anul from radiobutton within w_estad_ria_qx
end type
type rb_incomp from radiobutton within w_estad_ria_qx
end type
type rb_comp from radiobutton within w_estad_ria_qx
end type
type rb_tod from radiobutton within w_estad_ria_qx
end type
type dw_rias from datawindow within w_estad_ria_qx
end type
type gb_1 from groupbox within w_estad_ria_qx
end type
type sle_4 from singlelineedit within w_estad_ria_qx
end type
end forward

global type w_estad_ria_qx from window
integer width = 6011
integer height = 1736
boolean titlebar = true
string title = "Estado de Rips"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rips.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
st_2 st_2
cbx_replica cbx_replica
sle_5 sle_5
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
gb_4 gb_4
gb_3 gb_3
cb_cancel cb_cancel
cb_guarda cb_guarda
st_1 st_1
rb_anul rb_anul
rb_incomp rb_incomp
rb_comp rb_comp
rb_tod rb_tod
dw_rias dw_rias
gb_1 gb_1
sle_4 sle_4
end type
global w_estad_ria_qx w_estad_ria_qx

type variables
string sexo_paci,is_cext
DataWindowChild idw_fincon,idw_finproc,idw_causaex
end variables
on w_estad_ria_qx.create
this.st_2=create st_2
this.cbx_replica=create cbx_replica
this.sle_5=create sle_5
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.gb_4=create gb_4
this.gb_3=create gb_3
this.cb_cancel=create cb_cancel
this.cb_guarda=create cb_guarda
this.st_1=create st_1
this.rb_anul=create rb_anul
this.rb_incomp=create rb_incomp
this.rb_comp=create rb_comp
this.rb_tod=create rb_tod
this.dw_rias=create dw_rias
this.gb_1=create gb_1
this.sle_4=create sle_4
this.Control[]={this.st_2,&
this.cbx_replica,&
this.sle_5,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.gb_4,&
this.gb_3,&
this.cb_cancel,&
this.cb_guarda,&
this.st_1,&
this.rb_anul,&
this.rb_incomp,&
this.rb_comp,&
this.rb_tod,&
this.dw_rias,&
this.gb_1,&
this.sle_4}
end on

on w_estad_ria_qx.destroy
destroy(this.st_2)
destroy(this.cbx_replica)
destroy(this.sle_5)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.cb_cancel)
destroy(this.cb_guarda)
destroy(this.st_1)
destroy(this.rb_anul)
destroy(this.rb_incomp)
destroy(this.rb_comp)
destroy(this.rb_tod)
destroy(this.dw_rias)
destroy(this.gb_1)
destroy(this.sle_4)
end on

event open;dw_rias.retrieve(w_new_sala_qx.n_ingres,w_new_sala_qx.clugar_acto)
sle_5.backcolor=rgb(255,255,200) //color crema para el mostrario de no obligatorio

end event

type st_2 from statictext within w_estad_ria_qx
integer x = 151
integer y = 216
integer width = 448
integer height = 104
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

type cbx_replica from checkbox within w_estad_ria_qx
integer x = 69
integer y = 228
integer width = 73
integer height = 68
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

type sle_5 from singlelineedit within w_estad_ria_qx
integer x = 3346
integer y = 84
integer width = 343
integer height = 80
integer taborder = 70
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

type sle_3 from singlelineedit within w_estad_ria_qx
integer x = 2510
integer y = 84
integer width = 343
integer height = 80
integer taborder = 60
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

type sle_2 from singlelineedit within w_estad_ria_qx
integer x = 1947
integer y = 84
integer width = 329
integer height = 92
integer taborder = 60
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

type sle_1 from singlelineedit within w_estad_ria_qx
integer x = 1595
integer y = 88
integer width = 329
integer height = 88
integer taborder = 50
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

type gb_4 from groupbox within w_estad_ria_qx
integer x = 2395
integer y = 32
integer width = 1339
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Obligatoriedad de campos"
end type

type gb_3 from groupbox within w_estad_ria_qx
integer x = 1509
integer y = 32
integer width = 809
integer height = 164
integer taborder = 30
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

type cb_cancel from picturebutton within w_estad_ria_qx
event mousemove pbm_mousemove
integer x = 2875
integer y = 1492
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type cb_guarda from picturebutton within w_estad_ria_qx
event mousemove pbm_mousemove
integer x = 2715
integer y = 1492
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &g"
boolean default = true
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;if dw_rias.update() = 1 then 
	commit;
	w_new_sala_qx.dw_historial.triggerevent(rowfocuschanged!)
end if
end event

type st_1 from statictext within w_estad_ria_qx
integer x = 667
integer y = 248
integer width = 3095
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_anul from radiobutton within w_estad_ria_qx
integer x = 1111
integer y = 112
integer width = 302
integer height = 72
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

type rb_incomp from radiobutton within w_estad_ria_qx
integer x = 759
integer y = 112
integer width = 352
integer height = 72
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

type rb_comp from radiobutton within w_estad_ria_qx
integer x = 407
integer y = 112
integer width = 320
integer height = 72
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

type rb_tod from radiobutton within w_estad_ria_qx
integer x = 169
integer y = 112
integer width = 219
integer height = 72
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

type dw_rias from datawindow within w_estad_ria_qx
integer x = 32
integer y = 356
integer width = 5312
integer height = 1124
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_rips_qx"
boolean hscrollbar = true
boolean vscrollbar = true
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
		this.setitem(i,"estria",estr)
	end if
next
end event

event itemchanged;this.accepttext()
string cod,otro,col,este='',nulo
st_return_diags st
long colum,i,veri

setnull(nulo)
colum=this.getcolumn()
col=this.getcolumnname()
if colum=13 then
	setnull(otro)
	select desesp into :otro from especialidades where codesp= :data;
	if otro="" or isnull(otro) then
		this.setitem(row,13,"")
		st_1.text=""
		return 1
	end if
end if
choose case colum
	case 13, 15, 17, 34, 36, 38
		if cbx_replica.checked then
			for i=1 to this.rowcount()
				if i<>row and not isnull(this.getitemstring(i,"r_"+mid(dwo.name,3))) then 
					this.setitem(i,dwo.name,data)
				end if
			next
		end if
end choose
if col='s_diagprin_' or col='s_diagrel1_' or col='s_diagrel2_' or col='s_diagrel3_' or col='s_diagcompli' then
	if data<>"" then
		setnull(veri)
		veri=idw_causaex.find("codcausaexter ='"+this.getitemstring(row,'causaexterna')+"'",1,idw_causaex.rowcount())
		if veri>0 then
			is_cext=idw_causaex.getitemstring(veri,'dxrel')
		else
			is_cext='0'
		end if
		
		
		st=f_check_diag(data,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0',this.getitemstring(row,'rips'),is_cext)
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
end if
end event

event doubleclicked;string colu,carreta,resu,cual,temp
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
	st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
	st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
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
		this.setitem(row,colu,st_d.codrip)
		this.setitem(row,left(colu,len(colu)-1),st_d.codgeral)
		st_1.text=st_d.descripcion
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
string cod,ojo,col
long colum,veri
st_return_diags st

colum=this.getcolumn()
col=this.getcolumnname()
choose case colum
	case 13
		ojo=this.getitemstring(row,colum)
		if ojo<>"" then
			select desesp into :st_1.text from especialidades where codesp= :ojo;
		end if
end choose
if col='s_diagprin_' or col='s_diagrel1_' or col='s_diagrel2_' or col='s_diagrel3_' or col='s_diagcompli' then
	if this.getitemstring(row,colum)<>"" then
		
		setnull(veri)
		veri=idw_causaex.find("codcausaexter ='"+this.getitemstring(row,'causaexterna')+"'",1,idw_causaex.rowcount())
		if veri>0 then
			is_cext=idw_causaex.getitemstring(veri,'dxrel')
		else
			is_cext='0'
		end if
		
		string este
		este=this.getitemstring(row,left(col,len(col)-1))
		st=f_check_diag(this.getitemstring(row,colum),w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0',this.getitemstring(row,'rips'),is_cext)
		if st.descrip_diag="" then
			this.setitem(row,colum,"")
			return 1
		end if
		st_1.text=st.descrip_diag
	else
		st_1.text=""
	end if
end if
end event

event retrievestart;sexo_paci=w_principal.dw_1.getitemstring(1,"sexo")
end event

event retrieveend;if this.update() = 1 then 
	commit;
	w_new_sala_qx.dw_historial.triggerevent(rowfocuschanged!)
end if

end event

event constructor;settransobject(SQLCA)
getchild('s_fin_consulta',idw_fincon)
idw_fincon.settransobject(sqlca)
getchild('s_finalidadproced',idw_finproc)
idw_finproc.settransobject(SQLCA)
getchild('s_causaexterna',idw_causaex)
idw_causaex.settransobject(sqlca)

end event

type gb_1 from groupbox within w_estad_ria_qx
integer x = 37
integer y = 32
integer width = 1435
integer height = 164
integer taborder = 10
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
string text = "&Estado Rips"
end type

type sle_4 from singlelineedit within w_estad_ria_qx
integer x = 2939
integer y = 84
integer width = 343
integer height = 80
integer taborder = 60
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

