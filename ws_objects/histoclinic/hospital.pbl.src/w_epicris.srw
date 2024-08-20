$PBExportHeader$w_epicris.srw
forward
global type w_epicris from window
end type
type mle_1 from multilineedit within w_epicris
end type
type pb_cancel from picturebutton within w_epicris
end type
type pb_acep from picturebutton within w_epicris
end type
end forward

global type w_epicris from window
integer width = 4416
integer height = 1700
boolean titlebar = true
string title = "Edición de Epicrisis"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "DosEdit5!"
boolean clientedge = true
boolean center = true
mle_1 mle_1
pb_cancel pb_cancel
pb_acep pb_acep
end type
global w_epicris w_epicris

type variables
long i_contador
string i_clugar_his,i_textnew='!'
st_xa_print_histo i_st
end variables

on w_epicris.create
this.mle_1=create mle_1
this.pb_cancel=create pb_cancel
this.pb_acep=create pb_acep
this.Control[]={this.mle_1,&
this.pb_cancel,&
this.pb_acep}
end on

on w_epicris.destroy
destroy(this.mle_1)
destroy(this.pb_cancel)
destroy(this.pb_acep)
end on

event open;long largo,j
blob texto
i_st = message.powerobjectparm
sqlca.autocommit=true
if i_st.p_cod_plant='EPICRIS!' then
	selectblob resumeningreso into :texto from evolucionhc where contador=:i_st.p_contador and clugar=:i_st.p_clug;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo resumeningreso",sqlca.sqlerrtext)
		close(this)
		return
	end if
elseif i_st.p_cod_plant='NOTAQX!' then
	title='Edición de Notas Quirúrgicas'
	selectblob notasqx into :texto from qxcabacto where numero_ingre=:i_st.p_contador and clugar=:i_st.p_clug;
elseif i_st.p_cod_plant='NOTAANE!' then
	title='Edición de Notas Anestesiológicas'
	selectblob notas_ane into :texto from qxcabacto where numero_ingre=:i_st.p_contador and clugar=:i_st.p_clug;
elseif i_st.p_cod_plant='EVOLU!' then
	title='Edición de Evolución'
	selectblob evolucion into :texto from evolucionhc where contador=:i_st.p_contador and clugar=:i_st.p_clug;
elseif i_st.p_cod_plant='ORDEN!' then
	title='Edición de ordenes médicas'
	selectblob ordenes into :texto from evolucionhc where contador=:i_st.p_contador and clugar=:i_st.p_clug;
else
	title='Edición de Campos'
	choose case i_st.p_campo
		case 'valormemo1'
			selectblob valormemo1 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo2'
			selectblob valormemo2 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo3'
			selectblob valormemo3 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo4'
			selectblob valormemo4 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo5'
			selectblob valormemo5 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo6'
			selectblob valormemo6 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo7'
			selectblob valormemo7 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo8'
			selectblob valormemo8 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo9'
			selectblob valormemo9 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo10'
			selectblob valormemo10 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo11'
			selectblob valormemo11 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo12'
			selectblob valormemo12 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo13'
			selectblob valormemo13 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo14'
			selectblob valormemo14 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo15'
			selectblob valormemo15 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo16'
			selectblob valormemo16 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo17'
			selectblob valormemo17 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo18'
			selectblob valormemo18 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo19'
			selectblob valormemo19 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo20'
			selectblob valormemo20 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo21'
			selectblob valormemo21 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo22'
			selectblob valormemo22 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo23'
			selectblob valormemo23 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo24'
			selectblob valormemo24 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo25'
			selectblob valormemo25 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo26'
			selectblob valormemo26 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo27'
			selectblob valormemo27 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo28'
			selectblob valormemo28 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo29'
			selectblob valormemo29 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
		case 'valormemo30'
			selectblob valormemo30 into :texto from evolhistomemo where contador=:i_st.p_contador and clugar=:i_st.p_clug and codplantilla=:i_st.p_cod_plant;
	end choose
end if
sqlca.autocommit=false
f_pega_a_mle(mle_1,string(texto),3)

end event

event close;sqlca.autocommit=false
closewithreturn(this,i_textnew)
end event

type mle_1 from multilineedit within w_epicris
integer x = 5
integer y = 5
integer width = 4352
integer height = 1448
integer taborder = 10
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean autohscroll = true
boolean autovscroll = true
alignment alignment = Left!
borderstyle borderstyle = stylelowered!
end type

type pb_cancel from picturebutton within w_epicris
event mousemove pbm_mousemove
integer x = 2386
integer y = 1464
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
string text = "       &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)

end event

type pb_acep from picturebutton within w_epicris
event mousemove pbm_mousemove
integer x = 2231
integer y = 1464
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
string text = "          &g"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Cambios [Alt+G]"
end type

event clicked;sqlca.autocommit=true
i_textnew=mle_1.text
blob texto
texto=blob(i_textnew)
if i_st.p_cod_plant='EPICRIS!' then
	long cuantos
	select count(*) into :cuantos from evolucionhc where contador=:i_st.p_contador and clugar=:i_st.p_clug;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo evolucionhc',sqlca.sqlerrtext)
		return -1
	end if
	
	if cuantos=0 then
		insert into evolucionhc (contador,clugar) values(:i_st.p_contador,:i_st.p_clug);
		if sqlca.sqlcode=-1 then 
			messagebox('Error insertando en evolucionhc (epicrisis)',sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	end if
	
	updateblob evolucionhc set resumeningreso =:texto where contador=:i_st.p_contador and clugar=:i_st.p_clug;
elseif i_st.p_cod_plant='NOTAQX!' then
	updateblob qxcabacto set notasqx =:texto where numero_ingre=:i_st.p_contador and clugar=:i_st.p_clug;
elseif i_st.p_cod_plant='NOTAANE!' then
	updateblob qxcabacto set notas_ane =:texto where numero_ingre=:i_st.p_contador and clugar=:i_st.p_clug;
elseif i_st.p_cod_plant='EVOLU!' then
	updateblob evolucionhc set evolucion =:texto where contador=:i_st.p_contador and clugar=:i_st.p_clug;	
elseif i_st.p_cod_plant='ORDEN!' then
	updateblob evolucionhc set ordenes =:texto where contador=:i_st.p_contador and clugar=:i_st.p_clug;	
else
	
end if
sqlca.autocommit=false
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando Campo",sqlca.sqlerrtext)
	rollback ;
	return
end if
commit;
closewithreturn(parent,i_textnew)
end event

