$PBExportHeader$w_envia_result_apdx.srw
forward
global type w_envia_result_apdx from window
end type
type l_archivos from dropdownlistbox within w_envia_result_apdx
end type
type dw_prof_resu from datawindow within w_envia_result_apdx
end type
type pb_4 from pb_report within w_envia_result_apdx
end type
type dw_area from datawindow within w_envia_result_apdx
end type
type rte_1 from richtextedit within w_envia_result_apdx
end type
type pb_3 from picturebutton within w_envia_result_apdx
end type
type dw_1 from datawindow within w_envia_result_apdx
end type
type pb_1 from picturebutton within w_envia_result_apdx
end type
type em_hasta from editmask within w_envia_result_apdx
end type
type em_desde from editmask within w_envia_result_apdx
end type
type st_2 from statictext within w_envia_result_apdx
end type
type st_1 from statictext within w_envia_result_apdx
end type
type gb_1 from groupbox within w_envia_result_apdx
end type
end forward

global type w_envia_result_apdx from window
integer width = 3698
integer height = 1580
boolean titlebar = true
string title = "Envia Resultados"
boolean controlmenu = true
boolean maxbox = true
long backcolor = 67108864
string icon = "emasivo.ico"
boolean center = true
l_archivos l_archivos
dw_prof_resu dw_prof_resu
pb_4 pb_4
dw_area dw_area
rte_1 rte_1
pb_3 pb_3
dw_1 dw_1
pb_1 pb_1
em_hasta em_hasta
em_desde em_desde
st_2 st_2
st_1 st_1
gb_1 gb_1
end type
global w_envia_result_apdx w_envia_result_apdx

type variables
datawindowchild l_idw_area
string is_path='c:\windows\temp\'
end variables

on w_envia_result_apdx.create
this.l_archivos=create l_archivos
this.dw_prof_resu=create dw_prof_resu
this.pb_4=create pb_4
this.dw_area=create dw_area
this.rte_1=create rte_1
this.pb_3=create pb_3
this.dw_1=create dw_1
this.pb_1=create pb_1
this.em_hasta=create em_hasta
this.em_desde=create em_desde
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.l_archivos,&
this.dw_prof_resu,&
this.pb_4,&
this.dw_area,&
this.rte_1,&
this.pb_3,&
this.dw_1,&
this.pb_1,&
this.em_hasta,&
this.em_desde,&
this.st_2,&
this.st_1,&
this.gb_1}
end on

on w_envia_result_apdx.destroy
destroy(this.l_archivos)
destroy(this.dw_prof_resu)
destroy(this.pb_4)
destroy(this.dw_area)
destroy(this.rte_1)
destroy(this.pb_3)
destroy(this.dw_1)
destroy(this.pb_1)
destroy(this.em_hasta)
destroy(this.em_desde)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;if g_motor='postgres' then
	dw_1.dataobject='dw_result_apdx_email_postgres'
else
	dw_1.dataobject='dw_result_apdx_email'
end if
dw_1.settransobject(sqlca)

end event

type l_archivos from dropdownlistbox within w_envia_result_apdx
boolean visible = false
integer x = 773
integer y = 1464
integer width = 1120
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type dw_prof_resu from datawindow within w_envia_result_apdx
boolean visible = false
integer x = 46
integer y = 1460
integer width = 686
integer height = 64
integer taborder = 30
string title = "none"
string dataobject = "dw_profe_resultados"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_4 from pb_report within w_envia_result_apdx
integer x = 2615
integer y = 48
integer taborder = 20
boolean originalsize = false
string picturename = "envia_mail.jpg"
string nombre_rep = "Impresión de Apoyo Diagnóstico"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;string crep,lrep, l_servidor, l_puerto,l_usuario,l_clave,l_autentica,l_conexion
string l_email,ls_archivo,p_nombre,l_desc, em,l_asunto,l_area
string  i_tempo, err, stx, ret,l_prof,tmp_file,ls_docu,ls_obs
int l_ci,li_FileNum,l_i
blob b_firma
double nrep

if isnull(l_idw_area.getitemstring(l_idw_area.getrow(),'coddoc')) then return
cod_rep=l_idw_area.getitemstring(l_idw_area.getrow(),'coddoc')
i_clugar=CLUGAR
l_area=dw_area.getitemstring(1,1)
select obs_envio into :ls_obs from areaadx where codaadx=:l_area;
if isnull(ls_obs) then 
	messagebox('Atención','Faltan datos de observacion de Area')
	return
end if
if inicia('documento!',cod_rep,i_clugar)=-1 then return

SELECT servidor, puerto, usuario, clave, autentica, conexion 
INTO   :l_servidor, :l_puerto,:l_usuario,:l_clave,:l_autentica,:l_conexion
FROM ips_correos
WHERE c_ips='01' and ctipo='LA01';
if isnull(l_servidor) then 
	messagebox('Atención','No hay datos configuradorados para LA01')
	return 
end if


for l_ci=1 to dw_1.rowcount()
	if dw_1.getitemnumber(l_ci,"esc")=1 then 
		crep=dw_1.getitemstring(l_ci,"coddoc")
		lrep=dw_1.getitemstring(l_ci,"clugar")
		nrep=dw_1.getitemnumber(l_ci,"nrepor")
		l_email=dw_1.getitemstring(l_ci,"email")
		ls_docu=dw_1.getitemstring(l_ci,"documento")
		l_asunto='RESULTADOS DE '+string(dw_1.getitemstring(l_ci,'descripciongc'))
		report.dw_rep.retrieve(crep,nrep,lrep)
		
		//para firma
		if dw_prof_resu.retrieve(crep,lrep,nrep)>0 then
			for l_i=1 to dw_prof_resu.rowcount()
				l_prof=dw_prof_resu.getitemstring(l_i,'profesional')
				selectblob firma into :b_firma from profe
				where codprof=:l_prof ;
				if SQLCA.SQLCode <> 0 then
					MessageBox("SQL error",SQLCA.SQLErrText,Information!)
					return -1
				end if
				i_tempo="c:\windows\temp\"
				tmp_file = i_tempo +l_prof+crep+lrep+string(nrep)+".jpg"
				li_FileNum = FileOpen(tmp_file, StreamMode!, Write!, LockWrite!, Replace!)
				if isNull(li_FileNum) or li_FileNum < 1 then
					MessageBox('Atención','Error creando archivo temporal de imágen')
					Return -1
				end if
				FileWriteEx ( li_FileNum, b_firma)
				FileClose(li_FileNum)
			next
		end if
		///para firmas
		
		ls_archivo = 'Resultado_'+string(nrep)+'_'+crep+'_'+lrep
		ls_archivo= is_path+ ls_archivo+'.pdf'
		report.dw_rep.Object.DataWindow.Export.PDF.Method = NativePDF!
		report.dw_rep.Object.DataWindow.Export.PDF.NativePDF.Restrictions = 'nomodify!,nocopy!'
		report.dw_rep.Object.DataWindow.Export.PDF.NativePDF.MasterPassword ="x"+ls_docu
		report.dw_rep.Object.DataWindow.Export.PDF.NativePDF.UserPassword=ls_docu
		if report.dw_rep.saveas(ls_archivo,PDF!, true)=-1 then 
			return
		end if
	
		em=f_envia_mail(l_servidor, l_puerto,l_usuario,l_clave,l_autentica,l_conexion,l_email,l_asunto,l_desc,p_nombre,ls_archivo,ls_obs)
		 if em='Correo Enviado Satisfactoriamente' then
			dw_1.setitem(l_ci,'enviado',1)
		 else
			dw_1.setitem(l_ci,'enviado',2)
		end if
		 dw_1.setitem(l_ci,'error',em)
	end if
next
messagebox('Atencíon','Proceso Finalizado')
sqlca.autocommit=false
end event

type dw_area from datawindow within w_envia_result_apdx
integer x = 55
integer y = 68
integer width = 1207
integer height = 76
integer taborder = 10
string title = "none"
string dataobject = "dw_areagral"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('codaadx',l_idw_area)
l_idw_area.settransobject(sqlca)
l_idw_area.retrieve()
insertrow(1)
end event

type rte_1 from richtextedit within w_envia_result_apdx
boolean visible = false
integer x = 3241
integer y = 56
integer width = 105
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type pb_3 from picturebutton within w_envia_result_apdx
integer x = 2793
integer y = 48
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;Integer index
l_archivos.DirList (is_path+"*.jpg",0)
For index=1 To l_archivos.totalItems ( )
     FileDelete ( l_archivos.text(index))
Next

l_archivos.DirList (is_path+"*.pdf",0)
For index=1 To l_archivos.totalItems ( )
     FileDelete ( l_archivos.text(index))
Next
close(parent)
end event

type dw_1 from datawindow within w_envia_result_apdx
integer x = 46
integer y = 204
integer width = 3602
integer height = 1212
integer taborder = 20
string title = "none"
string dataobject = "dw_result_apdx_email"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event clicked;if dwo.name = 'esc_t' then
	if describe("esc_t.Text") = 'Selec.' then
		SetItem(row,'esc',1)
	else
		SetItem(row,'esc',0)
	end if
end if

end event

event buttonclicked;if dwo.name<>'b_1' then 
	if dwo.name = 'esc_t' then
		long i
		if describe("esc_t.Text") = 'Selec.' then
			for i = 1 to RowCount()
				SetItem(row,'esc',1)
			next
			Modify("esc_t.Text='Desel.'")
		else
			for i = 1 to RowCount()
				SetItem(row,'esc',0)
			next
			Modify("esc_t.Text='Selec.'")
		end if
	end if

end if
end event

type pb_1 from picturebutton within w_envia_result_apdx
integer x = 2446
integer y = 48
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.GIF"
alignment htextalign = left!
end type

event clicked;
dw_1.retrieve(dw_area.getitemstring(dw_area.getrow(),1),datetime(em_desde.text),datetime(em_hasta.text+' 23:59:00' ))
end event

type em_hasta from editmask within w_envia_result_apdx
integer x = 2043
integer y = 68
integer width = 366
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string minmax = "~~"
end type

event constructor;text = string(today(),'dd-mm-yyyy')
end event

type em_desde from editmask within w_envia_result_apdx
integer x = 1472
integer y = 68
integer width = 366
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string minmax = "~~"
end type

event constructor;text = string(today(),'dd-mm-yyyy')
end event

type st_2 from statictext within w_envia_result_apdx
integer x = 1865
integer y = 68
integer width = 201
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
boolean focusrectangle = false
end type

type st_1 from statictext within w_envia_result_apdx
integer x = 1285
integer y = 68
integer width = 201
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_envia_result_apdx
integer x = 41
integer width = 2976
integer height = 212
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterios"
end type

