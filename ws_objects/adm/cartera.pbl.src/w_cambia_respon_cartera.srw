$PBExportHeader$w_cambia_respon_cartera.srw
forward
global type w_cambia_respon_cartera from window
end type
type dw_2 from datawindow within w_cambia_respon_cartera
end type
type pb_1 from picturebutton within w_cambia_respon_cartera
end type
type pb_2 from picturebutton within w_cambia_respon_cartera
end type
type dw_1 from datawindow within w_cambia_respon_cartera
end type
end forward

global type w_cambia_respon_cartera from window
integer width = 3118
integer height = 1444
boolean titlebar = true
string title = "Cambio Responsable Objección"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_2 dw_2
pb_1 pb_1
pb_2 pb_2
dw_1 dw_1
end type
global w_cambia_respon_cartera w_cambia_respon_cartera

type variables
st_pagos st_p
datawindowchild idw_usu,idw_obj

end variables

event open;st_p = Message.PowerObjectParm
dw_1.retrieve(st_p.coddoc,st_p.clugar,st_p.num_cobro)


end event

on w_cambia_respon_cartera.create
this.dw_2=create dw_2
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.pb_1,&
this.pb_2,&
this.dw_1}
end on

on w_cambia_respon_cartera.destroy
destroy(this.dw_2)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_1)
end on

type dw_2 from datawindow within w_cambia_respon_cartera
integer x = 73
integer width = 1275
integer height = 148
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_usu_respon_sinobj"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
InsertRow(1)
idw_usu.Retrieve('%')

end event

type pb_1 from picturebutton within w_cambia_respon_cartera
integer x = 1399
integer y = 1200
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Llevar Registros"
end type

event clicked;int j,li_ite,li_nob
double ld_nf,ld_ng
string ls_cl,ls_ct,ls_usv,ls_clg,ls_dcg,ls_usn
for j = 1 to dw_1.rowcount()
	if dw_1.getItemNumber(j,'selecc') = 0 then 
		Continue
	else
		ls_dcg=dw_1.getItemstring(j,'coddoc')
		ls_clg=dw_1.getItemstring(j,'clugar')
		ld_ng=dw_1.getItemNumber(j,'num_glosa')
		li_ite=dw_1.getItemNumber(j,'item')
		li_nob=dw_1.getItemNumber(j,'nobjecion')
		ld_nf=dw_1.getItemNumber(j,'nfact')
		ls_cl=dw_1.getItemstring(j,'clugar_fact')
		ls_ct=dw_1.getItemstring(j,'tipo_fact')
		ls_usn=dw_2.getItemstring(1,'usuario')
		if dw_1.getItemNumber(j,'tipo')=1 then
			ls_usv='Error car_glosa_cpo_det'
			update  
				car_glosa_cpo_det  set usu_responde=:ls_usn
			where 
				(coddoc=:ls_dcg) and (clugar=:ls_clg) and	(num_glosa=:ld_ng) and 
				(item=:li_ite) and (nobjecion=:li_nob) and (nfact=:ld_nf) and (clugar_fact=:ls_cl) and 
				(tipo_fact=:ls_ct);
			end if
		if dw_1.getItemNumber(j,'tipo')=2 then
			ls_usv='Error car_glosa_subcpo_det'
			update  
				car_glosa_subcpo_det set usu_responde=:ls_usn
			where 
				(coddoc=:ls_dcg) and (clugar=:ls_clg) and	(num_glosa=:ld_ng) and 
				(item=:li_ite) and (nobjecion=:li_nob) and (nfact=:ld_nf) and (clugar_fact=:ls_cl) and 
				(tipo_fact=:ls_ct);
			end if
		if dw_1.getItemNumber(j,'tipo')=3 then
			ls_usv='Error car_glosa_subfact_det'			
			update  
				car_glosa_subfact_det set usu_responde=:ls_usn
			where 
				(coddoc=:ls_dcg) and (clugar=:ls_clg) and	(num_glosa=:ld_ng) and 
				(item=:li_ite) and (nobjecion=:li_nob) and (nfact=:ld_nf) and (clugar_fact=:ls_cl) and 
				(tipo_fact=:ls_ct);
			end if			
			if sqlca.sqlcode=-1 then
				messagebox(ls_usv,sqlca.sqlerrtext)
				rollback;
				return
			else
			   commit;
			end if

		
	end if
next
close(parent)

end event

type pb_2 from picturebutton within w_cambia_respon_cartera
integer x = 1554
integer y = 1200
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "Llevar Valores"
end type

event clicked;close(parent)

end event

type dw_1 from datawindow within w_cambia_respon_cartera
integer x = 59
integer y = 152
integer width = 2953
integer height = 1032
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cambio_respon"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
getchild('cod_objecion',idw_obj)
idw_obj.settransobject(sqlca)
idw_obj.retrieve('%','%')
end event

event buttonclicked;if dwo.name='b_todos' then 
	int l_i
	for l_i=1 to rowcount()
		if dwo.text='Escoger' then
			dw_1.SetItem(l_i,'selecc',1)	
		else
			dw_1.SetItem(l_i,'selecc',0)
		end if
	next
	if dwo.text='Escoger' then
		modify(string(dwo.name)+'.text="No Escog."')
	else
		modify(string(dwo.name)+'.text="Escoger"')
	end if
end if
end event

