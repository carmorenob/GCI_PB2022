$PBExportHeader$w_medgrupo.srw
forward
global type w_medgrupo from window
end type
type pb_8 from picturebutton within w_medgrupo
end type
type dw_7 from datawindow within w_medgrupo
end type
type pb_7 from picturebutton within w_medgrupo
end type
type pb_buscar from picturebutton within w_medgrupo
end type
type pb_borr from picturebutton within w_medgrupo
end type
type pb_guar1 from picturebutton within w_medgrupo
end type
type pb_guar2 from picturebutton within w_medgrupo
end type
type pb_6 from picturebutton within w_medgrupo
end type
type pb_5 from picturebutton within w_medgrupo
end type
type dw_4 from datawindow within w_medgrupo
end type
type pb_4 from picturebutton within w_medgrupo
end type
type pb_3 from picturebutton within w_medgrupo
end type
type pb_2 from picturebutton within w_medgrupo
end type
type pb_1 from picturebutton within w_medgrupo
end type
type dw_3 from datawindow within w_medgrupo
end type
type dw_2 from datawindow within w_medgrupo
end type
type dw_1 from datawindow within w_medgrupo
end type
type st_1 from statictext within w_medgrupo
end type
type gb_1 from groupbox within w_medgrupo
end type
type gb_2 from groupbox within w_medgrupo
end type
type dw_6 from datawindow within w_medgrupo
end type
type dw_5 from datawindow within w_medgrupo
end type
type gb_3 from groupbox within w_medgrupo
end type
end forward

global type w_medgrupo from window
integer width = 5298
integer height = 2064
boolean titlebar = true
string title = "Registro de Medicamentos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
boolean clientedge = true
pb_8 pb_8
dw_7 dw_7
pb_7 pb_7
pb_buscar pb_buscar
pb_borr pb_borr
pb_guar1 pb_guar1
pb_guar2 pb_guar2
pb_6 pb_6
pb_5 pb_5
dw_4 dw_4
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
st_1 st_1
gb_1 gb_1
gb_2 gb_2
dw_6 dw_6
dw_5 dw_5
gb_3 gb_3
end type
global w_medgrupo w_medgrupo

type variables
long nuevos,cuantos
string codigo,medicamento,l_grupo,l_clase
datawindowchild ldw_grupo,ldw_clase,ldw_prinact
end variables

on w_medgrupo.create
this.pb_8=create pb_8
this.dw_7=create dw_7
this.pb_7=create pb_7
this.pb_buscar=create pb_buscar
this.pb_borr=create pb_borr
this.pb_guar1=create pb_guar1
this.pb_guar2=create pb_guar2
this.pb_6=create pb_6
this.pb_5=create pb_5
this.dw_4=create dw_4
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_6=create dw_6
this.dw_5=create dw_5
this.gb_3=create gb_3
this.Control[]={this.pb_8,&
this.dw_7,&
this.pb_7,&
this.pb_buscar,&
this.pb_borr,&
this.pb_guar1,&
this.pb_guar2,&
this.pb_6,&
this.pb_5,&
this.dw_4,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.st_1,&
this.gb_1,&
this.gb_2,&
this.dw_6,&
this.dw_5,&
this.gb_3}
end on

on w_medgrupo.destroy
destroy(this.pb_8)
destroy(this.dw_7)
destroy(this.pb_7)
destroy(this.pb_buscar)
destroy(this.pb_borr)
destroy(this.pb_guar1)
destroy(this.pb_guar2)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.dw_4)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.gb_3)
end on

event open;dw_1.settransobject(SQLCA)
dw_1.insertrow(1)
dw_2.settransobject(SQLCA)
dw_3.settransobject(SQLCA)
dw_4.settransobject(SQLCA)
dw_5.settransobject(SQLCA)
dw_6.settransobject(SQLCA)
dw_7.settransobject(SQLCA)
dw_5.retrieve()
dw_6.retrieve()
dw_7.retrieve()
cuantos=0
dw_4.getchild("sumgenerico_codgrupo",ldw_grupo)
ldw_grupo.settransobject(sqlca)
ldw_grupo.Retrieve()
dw_4.getchild("sumgenerico_codclase",ldw_clase)
ldw_clase.settransobject(sqlca)
ldw_clase.Retrieve()
dw_4.getchild("codprinacti",ldw_prinact)
ldw_prinact.settransobject(sqlca)
ldw_prinact.Retrieve()

end event

event resize;dw_4.resize(newwidth - 100, 552)
end event

type pb_8 from picturebutton within w_medgrupo
integer x = 2638
integer y = 1804
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrador.gif"
alignment htextalign = left!
string powertiptext = "Elimina informacion de campo"
end type

event clicked;string ls_nulo
int li_nulo

setnull(ls_nulo)
setnull(li_nulo)

if messageBox('Aviso','Eliminara información del campo donde esta ubicado. desea continuar?',QUESTION!,YESNO!) = 2 then
	return
end if
if  dw_4.getcolumn()= 18 or dw_4.getcolumn()=25 or dw_4.getcolumn()= 30 or dw_4.getcolumn()= 32 or dw_4.getcolumn()= 33 or dw_4.getcolumn()= 34  then
	dw_4.setitem(dw_4.getrow(),dw_4.getcolumn(),li_nulo)
else
	dw_4.setitem(dw_4.getrow(),dw_4.getcolumn(),ls_nulo)
end if
dw_4.triggerevent(itemchanged!)
end event

type dw_7 from datawindow within w_medgrupo
boolean visible = false
integer x = 3950
integer y = 836
integer width = 498
integer height = 172
integer taborder = 60
string title = "none"
string dataobject = "dw_lista_medumedida"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_7 from picturebutton within w_medgrupo
boolean visible = false
integer x = 3154
integer y = 1820
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Editar.gif"
alignment htextalign = left!
string powertiptext = "Buscar medicamento"
end type

event clicked;//open(w_busca_med)
//st_med st_med
//st_med=message.powerobjectparm
//if isvalid(st_med) then
//	string clase,subclase,grupo
//	long donde
//	select codclase,codsubclase,codgrupo into :clase,:subclase,:grupo 
//	from medicamentos where c_medica=:st_med.cmedica;
//	dw_1.setitem(1,1,clase)
//	dw_1.triggerevent(itemchanged!)
//	donde=dw_2.find('codsubclase="'+subclase+'"',1,dw_2.rowcount())
//	if donde>0 then dw_2.scrolltorow(donde)
//	donde=dw_3.find("grupo='"+grupo+"'",1,dw_3.rowcount())
//	if donde>0 then dw_3.scrolltorow(donde)
//	donde=dw_4.find('c_medica="'+st_med.cmedica+'"',1,dw_4.rowcount())
//	if donde>0 then dw_4.scrolltorow(donde)
//end if
end event

type pb_buscar from picturebutton within w_medgrupo
integer x = 1961
integer y = 1804
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar medicamento"
end type

event clicked;st_pa_medica st_medx

st_medx.origen= '1'
openwithparm(w_busca_med,st_medx)
st_med st_med
st_med=message.powerobjectparm
if isvalid(st_med) then
	string clase,subclase,grupo
	long donde
	select codclase,codsubclase,codgrupo into :clase,:subclase,:grupo 
	from medicamentos where c_medica=:st_med.cmedica;
	dw_1.setitem(1,1,clase)
	dw_1.triggerevent(itemchanged!)
	donde=dw_2.find('codsubclase="'+subclase+'"',1,dw_2.rowcount())
	if donde>0 then dw_2.scrolltorow(donde)
	donde=dw_3.find("grupo='"+grupo+"'",1,dw_3.rowcount())
	if donde>0 then dw_3.scrolltorow(donde)
	donde=dw_4.find('c_medica="'+st_med.cmedica+'"',1,dw_4.rowcount())
	if donde>0 then dw_4.scrolltorow(donde)
end if
end event

type pb_borr from picturebutton within w_medgrupo
integer x = 2318
integer y = 1804
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Medicamento"
end type

event clicked;dw_4.deleterow(0)
end event

type pb_guar1 from picturebutton within w_medgrupo
string tag = "Guardar"
integer x = 2784
integer y = 452
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &g"
boolean originalsize = true
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
end type

event clicked;if dw_2.update()<1 then
	rollback;
else
	commit;
end if
end event

type pb_guar2 from picturebutton within w_medgrupo
string tag = "Guardar"
integer x = 3433
integer y = 948
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &g"
boolean originalsize = true
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
end type

event clicked;if dw_3.update()<1 then
	rollback;
else
	commit;
end if
end event

type pb_6 from picturebutton within w_medgrupo
string tag = "&Guardar"
integer x = 2473
integer y = 1804
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &g"
boolean originalsize = true
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if dw_4.update()<1 then
	rollback;
else
	//commit;
	int l_cuan,i,l_ge
	string l_cod,l_med,l_gru,l_cla,l_pos
	
//	if dw_4.Find("gen=1",1,dw_4.RowCount()) = 0 then Return 
	for i = 1 to dw_4.RowCount()
		if dw_4.getitemstatus(i,0,primary!)=notmodified! then continue
		l_cod=dw_4.getitemstring(i,'c_medica')
		l_med=dw_4.getitemstring(i,'medicamento')
		l_gru=dw_4.getitemstring(i,'sumgenerico_codgrupo')
		l_cla=dw_4.getitemstring(i,'sumgenerico_codclase')
		l_pos=dw_4.getitemstring(i,'pos')
		l_ge=dw_4.getitemnumber(i,'gen')
		update sumgenerico set pos=:l_pos where (((SUMGENERICO.c_medica)=:l_cod));
		
		if l_ge=1 then
			SELECT count(*) into :l_cuan
			FROM SUMGENERICO WHERE (((SUMGENERICO.c_medica)=:l_cod));
			if l_cuan > 0 then
				MessageBox('Atención','Ya existe genrico asociado a este medicamento')
				continue
			end if
			INSERT INTO SUMGENERICO ( codgenerico, descripcion, MEDICAMENTO, c_medica, codgrupo, codclase, POS ) 
			values(:l_cod,:l_med,'1',:l_cod,:l_gru,:l_cla,:l_pos);
			if sqlca.sqlcode=-1 then
				messagebox("Error insertando fila en Sumgenerico",sqlca.sqlerrtext)
				rollback;
				continue
//			else
//				commit;
			end if
		end if
		dw_4.setitem(i,'gen',0)
	next
	commit;
	cuantos=0
end if
end event

type pb_5 from picturebutton within w_medgrupo
string tag = "&Insertar"
integer x = 2167
integer y = 1804
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &i"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Insertar Nuevo Medicamento"
end type

event clicked;if dw_2.rowcount()=0 or dw_3.rowcount()=0 then return
long donde
donde=dw_4.insertrow(0)
dw_4.scrolltorow(donde)
dw_4.setitem(donde,'codclase',dw_1.getitemstring(1,1))
dw_4.setitem(donde,'codsubclase',dw_2.getitemstring(dw_2.getrow(),'codsubclase'))
dw_4.setitem(donde,'codgrupo',dw_3.getitemstring(dw_3.getrow(),'grupo'))
dw_4.setitem(donde,'nuevo',0)
dw_4.setitem(donde,'gen',1)
codigo=dw_3.getitemstring(dw_3.getrow(),'clase')+dw_3.getitemstring(dw_3.getrow(),'subclase')+dw_3.getitemstring(dw_3.getrow(),'grupo')
dw_4.setitem(donde,1,codigo)

//dw_articulos.SetFilter("(codgrupo like '"+dw_gc.GetItemString(1,'codgrupo')+"') and (codclase like '"+dw_gc.GetItemString(1,'codclase')+"')")
//dw_articulos.Filter()
//ret=dw_articulos.getitemnumber(1,'maximo')
//l_ret = string(ret+1,'000')

long l_valor
string l_ret,ret

SELECT Count(Medicamentos.CodMedica) into :l_valor
FROM Medicamentos;

ret = dw_4.Describe("Evaluate(' max(long(c_medica)) ', 0)")
int l_c
l_c=long(mid(ret,len(ret)-2,3))-l_valor
if l_c=0 THEN 
  l_ret = l_clase+string(l_valor+1,'0000')
Else
  l_ret = l_clase+string(l_valor+1,'000')
End If
dw_4.setitem(donde,'c_medica',l_ret)	

cuantos++		
end event

type dw_4 from datawindow within w_medgrupo
integer x = 64
integer y = 1248
integer width = 5065
integer height = 552
integer taborder = 60
string title = "none"
string dataobject = "dw_medicamentos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_4.accepttext()
long cual,entra, l_valor,umv,ump
string principio,forma, l_ret,conc
entra =0
if getColumnName() = 'sumgenerico_codgrupo' then
	if isnull(getitemstring(getrow(),23)) then 
		return
	end if
	l_grupo=dw_4.getitemstring(getrow(),23)
	l_ret="codgrupo='"+ GetItemString(getrow(),'sumgenerico_codgrupo') +"'"
	ldw_clase.SetFilter("codgrupo='"+ GetItemString(getrow(),'sumgenerico_codgrupo') +"'")
	ldw_clase.Filter()
end if
		
if getColumnName()='sumgenerico_codclase' then
	l_clase=dw_4.getitemstring(getrow(),24)
	if dw_4.getitemnumber(getrow(),25)=1 then
		if g_motor='postgres' then 
			SELECT MAX(SUBSTRING(CODGENERICO,position(SUMGENERICO.CODCLASE IN SUMGENERICO.CODGENERICO)+char_length(SUMGENERICO.CODCLASE ),char_length(CODGENERICO) )::int)   into :l_valor
			FROM SUMGENERICO
			GROUP BY SUMGENERICO.CODGRUPO, SUMGENERICO.CODCLASE
			HAVING((SUMGENERICO.CODCLASE)=:l_clase);
		else
			SELECT Max((convert(int ,SUBSTRING(SUMGENERICO.CODGENERICO,locate(SUMGENERICO.CODGENERICO,SUMGENERICO.CODCLASE)+len(SUMGENERICO.CODCLASE),len(SUMGENERICO.CODGENERICO))))) into :l_valor
			FROM SUMGENERICO
			GROUP BY SUMGENERICO.CODGRUPO, SUMGENERICO.CODCLASE
			HAVING  ((SUMGENERICO.CODCLASE)=:l_clase);
		end If
	end if
	setitem(getrow(),'c_medica',l_clase+string(l_valor+1,'000'))
end if

if  getcolumn()= 6 or getcolumn()=36 or getcolumn()= 9 or getcolumn()= 32 or getcolumn()= 33 or getcolumn()= 34  then
	entra=1
	principio=upper(getitemstring(getrow(),'codprinacti'))
	forma=upper(getitemstring(getrow(),'umm'))
	ump=getitemnumber(getrow(),'codum')
	umv=getitemnumber(getrow(),'cum_vol')
	codigo=dw_3.getitemstring(dw_3.getrow(),'clase')+dw_3.getitemstring(dw_3.getrow(),'subclase')+dw_3.getitemstring(dw_3.getrow(),'grupo')
	if isnull(getitemstring(getrow(),'concentracion')) then
		if isnull(getitemstring(getrow(),'codformaf')) then
			if isnull(getitemstring(getrow(),'codprinacti')) then 
				codigo=codigo
				medicamento=getitemstring(getrow(),'medicamento')
			else
				codigo=codigo+getitemstring(getrow(),'codprinacti')
				cual = dw_5.Find("codpactivo = '"+ principio +"'",1, dw_5.RowCount())
				medicamento=upper(dw_5.getitemstring(cual,2))
			end if
		else
			cual = dw_5.Find("codpactivo = '"+ principio +"'",1, dw_5.RowCount())
			medicamento=upper(dw_5.getitemstring(cual,2))
			cual = dw_6.Find("cod_udmidi = '"+ forma +"'",1, dw_6.RowCount())
			medicamento+= upper(" " + dw_6.getitemstring(cual,2))
			codigo=codigo+getitemstring(getrow(),7)+getitemstring(getrow(),7)
		end if
	else
		entra=0
		//
		if not isnull(dw_4.getitemnumber(getrow(),32)) then 	conc+= " " + string(dw_4.getitemnumber(getrow(),'peso')) 
		cual = dw_7.Find("codumeddca = "+ string(ump),1, dw_7.RowCount())
		if not isnull(dw_7.getitemstring(cual,'unidadmed')) then conc+= ' '+dw_7.getitemstring(cual,'unidadmed')
		if not isnull(dw_4.getitemnumber(getrow(),33)) then conc+= "/" + string(dw_4.getitemnumber(getrow(),'volumen'))
		cual = dw_7.Find("codumeddca = "+ string(umv),1, dw_7.RowCount())
		if not isnull(dw_7.getitemstring(cual,'unidadmed')) then 
			if pos(conc,'/')>0 then
				conc+= ' '+dw_7.getitemstring(cual,'unidadmed')
			else
				conc+= '/ '+dw_7.getitemstring(cual,'unidadmed')
			end if
		end if
		cual = dw_5.Find("codpactivo = '"+ principio +"'",1, dw_5.RowCount())
		medicamento=UPPER(dw_5.getitemstring(cual,2))
		cual = dw_6.Find("cod_udmidi  = '"+ forma +"'",1, dw_6.RowCount())
		medicamento+= upper(" " + dw_6.getitemstring(cual,2) )
		
		codigo=codigo+getitemstring(getrow(),6)+getitemstring(getrow(),7)
	end if
	if entra=1 then
		cual = dw_5.Find("codpactivo = '"+ principio +"'",1, dw_5.RowCount())
		medicamento=upper(dw_5.getitemstring(cual,2))
		cual = dw_6.Find("cod_udmidi  = '"+ forma +"'",1, dw_6.RowCount())
		if not isnull(dw_6.getitemstring(cual,2)) then medicamento+=upper( " " + dw_6.getitemstring(cual,2))
		if not isnull(dw_4.getitemstring(getrow(),32)) then conc+= " " + dw_4.getitemstring(getrow(),32)
	
		if not isnull(dw_4.getitemnumber(getrow(),32)) then 	conc+= " " + string(dw_4.getitemnumber(getrow(),'peso')) 
		cual = dw_7.Find("codumeddca = "+ string(ump),1, dw_7.RowCount())
		if not isnull(dw_7.getitemstring(cual,'unidadmed')) then conc+= ' '+dw_7.getitemstring(cual,'unidadmed')
		if not isnull(dw_4.getitemnumber(getrow(),33)) then conc+= "/" + string(dw_4.getitemnumber(getrow(),'volumen'))
		cual = dw_7.Find("codumeddca = "+ string(umv),1, dw_7.RowCount())
		if not isnull(dw_7.getitemstring(cual,'unidadmed')) then conc+= ' '+dw_7.getitemstring(cual,'unidadmed')
		
		codigo=dw_3.getitemstring(dw_3.getrow(),'clase')+dw_3.getitemstring(dw_3.getrow(),'subclase')+dw_3.getitemstring(dw_3.getrow(),'grupo')
		codigo=codigo+getitemstring(getrow(),7)+getitemstring(getrow(),7)			
	end if
	setitem(getrow(),'codigo_unif',codigo)
	setitem(getrow(),'medicamento',medicamento+' '+conc)
	setitem(getrow(),'concentracion',conc)
	setitem(getrow(),23,l_grupo)
	setitem(getrow(),24,l_clase)
end if
end event

type pb_4 from picturebutton within w_medgrupo
integer x = 3433
integer y = 828
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
end type

event clicked;dw_3.deleterow(0)
end event

type pb_3 from picturebutton within w_medgrupo
integer x = 3433
integer y = 704
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_2.rowcount()<1 then return
long donde
donde=dw_3.insertrow(0)
dw_3.scrolltorow(donde)
dw_3.setitem(donde,'clase',dw_1.getitemstring(1,1))
dw_3.setitem(donde,'subclase',dw_2.getitemstring(dw_2.getrow(),'codsubclase'))
end event

type pb_2 from picturebutton within w_medgrupo
integer x = 2784
integer y = 328
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
end type

event clicked;dw_2.deleterow(0)
end event

type pb_1 from picturebutton within w_medgrupo
integer x = 2784
integer y = 204
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
end type

event clicked;if isnull(dw_1.getitemstring(1,1)) then return
long donde
donde=dw_2.insertrow(0)
dw_2.scrolltorow(donde)
dw_2.setitem(donde,1,dw_1.getitemstring(1,1))


end event

type dw_3 from datawindow within w_medgrupo
integer x = 82
integer y = 700
integer width = 3305
integer height = 452
integer taborder = 30
string title = "none"
string dataobject = "dw_medgrupo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dw_3.update()<1 then
	rollback;
else
	commit;
end if
end event

event rowfocuschanged;long fila
fila=getrow()
if fila<1 then return
dw_4.retrieve(getitemstring(fila,'clase'),getitemstring(fila,'subclase'),getitemstring(fila,'grupo'))
ldw_prinact.retrieve()
dw_5.retrieve()
dw_6.retrieve()
end event

type dw_2 from datawindow within w_medgrupo
integer x = 73
integer y = 188
integer width = 2661
integer height = 404
integer taborder = 20
string title = "none"
string dataobject = "dw_medsubclase"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long fila
fila=getrow()
if fila<1 then return
dw_3.reset()
dw_4.reset()
dw_3.retrieve(dw_1.getitemstring(1,1),getitemstring(fila,'codsubclase'))
ldw_prinact.retrieve()
dw_5.retrieve()
dw_6.retrieve()
end event

event itemchanged;if dw_2.update()<1 then
	rollback;
else
	commit;
end if
end event

type dw_1 from datawindow within w_medgrupo
integer x = 645
integer y = 24
integer width = 2043
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_medclase"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;accepttext()
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_2.retrieve(getitemstring(1,1))

end event

type st_1 from statictext within w_medgrupo
integer x = 55
integer y = 28
integer width = 754
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clasificación Anatómica:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_medgrupo
integer x = 41
integer y = 124
integer width = 2926
integer height = 492
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SubClase - Grupo Terapéutico Principal -"
end type

type gb_2 from groupbox within w_medgrupo
integer x = 46
integer y = 640
integer width = 3593
integer height = 536
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo - SubGrupo Terapéutico/Farmacológico - "
end type

type dw_6 from datawindow within w_medgrupo
boolean visible = false
integer x = 4434
integer y = 552
integer width = 416
integer height = 184
integer taborder = 70
string title = "none"
string dataobject = "dw_lista_umdispensa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_medgrupo
boolean visible = false
integer x = 3909
integer y = 544
integer width = 485
integer height = 188
integer taborder = 60
string title = "none"
string dataobject = "dw_lista_medprinactivo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_medgrupo
integer x = 32
integer y = 1184
integer width = 5143
integer height = 600
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medicamentos"
end type

