$PBExportHeader$w_copia_cont.srw
forward
global type w_copia_cont from window
end type
type pb_2 from picturebutton within w_copia_cont
end type
type pb_1 from picturebutton within w_copia_cont
end type
type dw_2 from datawindow within w_copia_cont
end type
type dw_1 from datawindow within w_copia_cont
end type
end forward

global type w_copia_cont from window
integer width = 3611
integer height = 1116
boolean titlebar = true
string title = "Copiar Contrato a"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
dw_1 dw_1
end type
global w_copia_cont w_copia_cont

type variables
datawindow dw
datawindowchild dw_tipo,dw_regimen
end variables

on w_copia_cont.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_2,&
this.dw_1}
end on

on w_copia_cont.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;dw=message.powerobjectparm
string l_copiacon,l_con


SELECT cadena into :l_copiacon
FROM parametros_gen
WHERE (((parametros_gen.codigo_para)=37));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 37')
	return 
end if
if l_copiacon='1' then 
	dw_2.Modify("clugar.visible=1") 
	dw_2.Modify("clugar_t.visible=1") 
else
	dw_2.Modify("clugar.visible=0") 
	dw_2.Modify("clugar_t.visible=0") 
end if
dw_1.setitem(1,'codemp',dw.getitemstring(1,'codemp'))
dw_1.settext(dw.getitemstring(1,'codemp'))
dw_1.triggerevent(itemchanged!)
dw.rowscopy(dw.getrow(),dw.getrow(),primary!,dw_2,1,primary!)
dw_2.setitem(1,'estado','1')
if l_copiacon='0' then 
	setnull(l_con)
	dw_2.setitem(1,'clugar',l_con)
	dw_2.setitem(1,'lugares','%')
end if

integer codigo

codigo=dw.getitemnumber(1,"maximo")
if isnull(codigo) then codigo=0
codigo++
dw_2.setitem(1,'codcontrato',string(codigo))

end event

type pb_2 from picturebutton within w_copia_cont
integer x = 1627
integer y = 888
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &c"
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_copia_cont
integer x = 1477
integer y = 888
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_2.accepttext()
dw_1.accepttext()
string emp,newemp,cont,newcont
emp=dw.getitemstring(dw.getrow(),'codemp')
cont=dw.getitemstring(dw.getrow(),'codcontrato')
NewEmp=dw_1.getitemstring(1,1)
NewCont=dw_2.getitemstring(1,'codcontrato')
if NewCont='' or isnull(newcont) then 
	messagebox('Atención','Coloque el código del contrato')
	return
end if
if dw_2.update()=-1 then
	rollback;
	return
end if
INSERT INTO contratotest ( CEmp, CContrato, CEstrato, Tope )
SELECT :newemp AS cemp, :newCont AS ccontrato, ContratoTEst.CEstrato, ContratoTEst.Tope
FROM ContratoTEst
WHERE ContratoTEst.CEmp=:emp AND ContratoTEst.CContrato=:cont;
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en ContratoTEst",sqlca.sqlerrtext)
	rollback;
	return
end if
INSERT INTO ContratoDet ( CEmp, CContrato, Cplan, CodTIngre, Tipo, Prioridad, Copago, CuotaMode, CuotaRecu, tipoafil, PagoPart, CodManual, PorManual, Autorizacion )
SELECT :newemp AS CEmp, :newcont AS CContrato, ContratoDet.Cplan, ContratoDet.CodTIngre, ContratoDet.Tipo, ContratoDet.Prioridad, ContratoDet.Copago, ContratoDet.CuotaMode, ContratoDet.CuotaRecu, ContratoDet.tipoafil, ContratoDet.PagoPart, ContratoDet.CodManual, ContratoDet.PorManual, ContratoDet.Autorizacion
FROM ContratoDet
WHERE ContratoDet.CEmp=:emp AND ContratoDet.CContrato=:cont;
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en ContratoDet",sqlca.sqlerrtext)
	rollback;
	return
end if
INSERT INTO ContratoEstCR ( CEmp, CContrato, Cplan, CodTIngre, Tipo, CEstrato, CuotaRecVal, MinimoPor, MaximoPor )
SELECT :newemp AS CEmp, :newcont AS CContrato, ContratoEstCR.Cplan, ContratoEstCR.CodTIngre, ContratoEstCR.Tipo, ContratoEstCR.CEstrato, ContratoEstCR.CuotaRecVal, ContratoEstCR.MinimoPor, ContratoEstCR.MaximoPor
FROM ContratoEstCR
WHERE ContratoEstCR.CEmp=:emp AND ContratoEstCR.CContrato=:cont;
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en ContratoEstCR",sqlca.sqlerrtext)
	rollback;
	return
end if
INSERT INTO ContratoTA ( CEmp, CContrato, Cplan, CodTIngre, Tipo, TAfil, CEstrato, paga, valor, pormin, pormaximo )
SELECT :newemp AS CEmp, :newcont AS CContrato, ContratoTA.Cplan, ContratoTA.CodTIngre, ContratoTA.Tipo, ContratoTA.TAfil, ContratoTA.CEstrato, ContratoTA.paga, ContratoTA.valor, ContratoTA.pormin, ContratoTA.pormaximo
FROM ContratoTA
WHERE ContratoTA.CEmp=:emp AND ContratoTA.CContrato=:cont;
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en ContratoTA",sqlca.sqlerrtext)
	rollback;
	return
end if
INSERT INTO ContratoEstC ( CEmp, CContrato, Cplan, CodTIngre, Tipo, CEstrato, CopagoVal, MinimoPor, MaximoPor )
SELECT :newemp AS CEmp, :newcont AS CContrato, ContratoEstC.Cplan, ContratoEstC.CodTIngre, ContratoEstC.Tipo, ContratoEstC.CEstrato, ContratoEstC.CopagoVal, ContratoEstC.MinimoPor, ContratoEstC.MaximoPor
FROM ContratoEstC
WHERE ContratoEstC.CEmp=:emp AND ContratoEstC.CContrato=:cont;
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en ContratoEstC",sqlca.sqlerrtext)
	rollback;
	return
end if
INSERT INTO ContratoEstCM ( CEmp, CContrato, Cplan, CodTIngre, Tipo, CEstrato, CMVal, MinimoPor, MaximoPor, CMGrupo )
SELECT :newemp AS CEmp, :newcont AS CContrato, ContratoEstCM.Cplan, ContratoEstCM.CodTIngre, ContratoEstCM.Tipo, ContratoEstCM.CEstrato, ContratoEstCM.CMVal, ContratoEstCM.MinimoPor, ContratoEstCM.MaximoPor, ContratoEstCM.CMGrupo
FROM ContratoEstCM
WHERE ContratoEstCM.CEmp=:emp AND ContratoEstCM.CContrato=:cont;
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en ContratoEstCM",sqlca.sqlerrtext)
	rollback;
	return
end if
INSERT INTO ContratoGE ( CEmp, CContrato, Cplan, CodTIngre, Tipo, GEtareo, Confirma )
SELECT :newemp AS CEmp, :newcont AS CContrato, ContratoGE.Cplan, ContratoGE.CodTIngre, ContratoGE.Tipo, ContratoGE.GEtareo, ContratoGE.Confirma
FROM ContratoGE
WHERE ContratoGE.CEmp=:emp AND ContratoGE.CContrato=:cont;
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en ContratoGE",sqlca.sqlerrtext)
	rollback;
	return
end if
commit;
if emp=newemp then
	closewithreturn(parent,'si')
else
	close(parent)
end if
end event

type dw_2 from datawindow within w_copia_cont
integer x = 18
integer y = 488
integer width = 3506
integer height = 368
integer taborder = 20
string title = "none"
string dataobject = "dw_contrato"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
modify('codcontrato.edit.displayonly=no')
getchild('ctcontra',dw_tipo)
getchild('ctreg',dw_regimen)
dw_tipo.settransobject(sqlca)
dw_regimen.settransobject(sqlca)
dw_tipo.retrieve()
dw_regimen.retrieve()
end event

type dw_1 from datawindow within w_copia_cont
integer x = 37
integer y = 24
integer width = 3525
integer height = 408
integer taborder = 10
string title = "none"
string dataobject = "dw_empresa"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
insertrow(1)
modify('gb_1.text="Escoger empresa a copiar Contrato"')
modify('empresa_codemp.tabsequence=10')
end event

event itemchanged;retrieve(dw.getitemstring(1,'codemp'))
dw_2.setitem(1,'codemp',dw.getitemstring(1,'codemp'))
end event

