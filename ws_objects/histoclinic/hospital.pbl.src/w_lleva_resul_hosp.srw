$PBExportHeader$w_lleva_resul_hosp.srw
forward
global type w_lleva_resul_hosp from window
end type
type pb_cancel from picturebutton within w_lleva_resul_hosp
end type
type pb_acep from picturebutton within w_lleva_resul_hosp
end type
type st_1 from statictext within w_lleva_resul_hosp
end type
type dw_trae from datawindow within w_lleva_resul_hosp
end type
end forward

global type w_lleva_resul_hosp from window
integer width = 3369
integer height = 1748
boolean titlebar = true
string title = "Registrar Resultados Pendientes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "ap_dx.ico"
boolean clientedge = true
boolean center = true
pb_cancel pb_cancel
pb_acep pb_acep
st_1 st_1
dw_trae dw_trae
end type
global w_lleva_resul_hosp w_lleva_resul_hosp

type variables
st_xa_result i_st
end variables

on w_lleva_resul_hosp.create
this.pb_cancel=create pb_cancel
this.pb_acep=create pb_acep
this.st_1=create st_1
this.dw_trae=create dw_trae
this.Control[]={this.pb_cancel,&
this.pb_acep,&
this.st_1,&
this.dw_trae}
end on

on w_lleva_resul_hosp.destroy
destroy(this.pb_cancel)
destroy(this.pb_acep)
destroy(this.st_1)
destroy(this.dw_trae)
end on

event open;i_st=Message.PowerObjectParm
sqlca.autocommit=true
dw_trae.retrieve(i_st.contador,i_st.clugar)
end event

type pb_cancel from picturebutton within w_lleva_resul_hosp
integer x = 1627
integer y = 1500
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &c"
boolean cancel = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_acep from picturebutton within w_lleva_resul_hosp
integer x = 1458
integer y = 1500
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &a"
boolean default = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;long j,i,nrepor,item
string cod_todo,carreta,des_area,des_grup,des_area_ant,des_grup_ant,cod_todo_ant,cod_doc,clugar_res
des_area_ant=""
des_grup_ant=""
cod_todo_ant=""
carreta="Se realizaron los siguientes examenes:"
for i= 1 to dw_trae.rowcount()
	if dw_trae.getitemstring(i,"esco")='1' then
		des_area=dw_trae.getitemstring(i,"des_area")
		des_grup=dw_trae.getitemstring(i,"descripciongc")
		cod_todo=dw_trae.getitemstring(i,"cod_todo")
		cod_todo_ant=cod_todo
		if des_area<>des_area_ant then 
			carreta+="~r~nArea:"+des_area
			des_area_ant=des_area
		end if
		if des_grup<>des_grup_ant then 
			carreta+="~r~nGrupo:"+des_grup
			des_grup_ant=des_grup
		end if
		carreta+="~r~n"+string(dw_trae.getitemdatetime(i,"fecharesul"),"dd/mmm/yyyy")+' - ('
		carreta+=dw_trae.getitemstring(i,"codproced")+') '
		carreta+=dw_trae.getitemstring(i,"descripcion")+'~r~nValores:'
		j=i
		do
			carreta+='~r~n   -'+dw_trae.getitemstring(j,"todo")
			cod_todo_ant=dw_trae.getitemstring(j,"cod_todo")
			if j=dw_trae.rowcount() then
				j++
			else
				if cod_todo_ant<>dw_trae.getitemstring(j +1,"cod_todo") then 
					j++
					exit
				else
					j++
				end if	
			end if
		LOOP WHILE j<=dw_trae.rowcount()

		nrepor=dw_trae.getitemnumber(i,"nrepor")
		item=dw_trae.getitemnumber(i,"item")
		cod_doc=dw_trae.getitemstring(i,"coddoc")
		clugar_res=dw_trae.getitemstring(i,"clugar")
		update resultadoscpo set enconsultorio='1' where coddoc=:cod_doc and clugar=:clugar_res and nrepor=:nrepor and item=:item;
		if sqlca.sqlcode=-1 then
			messagebox("Error en interface con ResultadosCpo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		i=j -1
	end if
next
commit;
//if f_sel_rtf(w_evolucion.tab_1.tabp_2.rte_2)>0 then f_pega_a_rtf(w_evolucion.tab_1.tabp_2.rte_2,'~n',3)
//f_pega_a_rtf(w_evolucion.tab_1.tabp_2.rte_2,carreta,3)
close(parent)
end event

type st_1 from statictext within w_lleva_resul_hosp
integer x = 37
integer width = 3232
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Seleccione los resultados pendientes del paciente a registrar (De click sobre la casilla llevar):"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_trae from datawindow within w_lleva_resul_hosp
integer x = 32
integer y = 80
integer width = 3246
integer height = 1392
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_trae_resultados_hosp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event buttonclicked;if dwo.name='b_1' then
	open(w_val_norm)
	w_val_norm.dw_1.retrieve(getitemstring(row,'codproced'),getitemnumber(row,'consecampo'))
	w_val_norm.setfocus()
end if
end event

