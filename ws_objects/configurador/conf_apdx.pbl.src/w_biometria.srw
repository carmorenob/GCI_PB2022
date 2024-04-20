$PBExportHeader$w_biometria.srw
forward
global type w_biometria from window
end type
type dw_biometria from datawindow within w_biometria
end type
type pb_1 from picturebutton within w_biometria
end type
type pb_veri from picturebutton within w_biometria
end type
type dw_huella from datawindow within w_biometria
end type
type mle_1 from multilineedit within w_biometria
end type
type cbx_log from checkbox within w_biometria
end type
type pb_salir from picturebutton within w_biometria
end type
type pb_save from picturebutton within w_biometria
end type
type huellas from olecustomcontrol within w_biometria
end type
type log_es from listbox within w_biometria
end type
type p_imagen from picture within w_biometria
end type
end forward

global type w_biometria from window
integer width = 1947
integer height = 1640
boolean titlebar = true
string title = "Biometria"
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_biometria dw_biometria
pb_1 pb_1
pb_veri pb_veri
dw_huella dw_huella
mle_1 mle_1
cbx_log cbx_log
pb_salir pb_salir
pb_save pb_save
huellas huellas
log_es log_es
p_imagen p_imagen
end type
global w_biometria w_biometria

type variables
PRIVATE:
	String TempFilePathName = 'c:\windows\temp\huella_tmp.bmp',documentos="740861625"
	Blob lblob_image
	st_biometria istr_template, istr_db_template
	Boolean lb_file_created = False, l_captura=false//true 
	Integer &
	ContDedos= 0, pos_x,pos_y, &
	ii_contexto 

end variables

on w_biometria.create
this.dw_biometria=create dw_biometria
this.pb_1=create pb_1
this.pb_veri=create pb_veri
this.dw_huella=create dw_huella
this.mle_1=create mle_1
this.cbx_log=create cbx_log
this.pb_salir=create pb_salir
this.pb_save=create pb_save
this.huellas=create huellas
this.log_es=create log_es
this.p_imagen=create p_imagen
this.Control[]={this.dw_biometria,&
this.pb_1,&
this.pb_veri,&
this.dw_huella,&
this.mle_1,&
this.cbx_log,&
this.pb_salir,&
this.pb_save,&
this.huellas,&
this.log_es,&
this.p_imagen}
end on

on w_biometria.destroy
destroy(this.dw_biometria)
destroy(this.pb_1)
destroy(this.pb_veri)
destroy(this.dw_huella)
destroy(this.mle_1)
destroy(this.cbx_log)
destroy(this.pb_salir)
destroy(this.pb_save)
destroy(this.huellas)
destroy(this.log_es)
destroy(this.p_imagen)
end on

event open;integer minutiaeColor, minutiaeMatchColor, segmentsColor, segmentsMatchColor, directionsColor, directionsMatchColor,l_k
byte majorVersion=0, minorVersion=0
string l_version,l_errors

huellas.Object.DestroyContext(ii_contexto)
huellas.Object.Finalize()
l_error=huellas.object.Initialize()

If l_error < 0 Then
	l_errors=f_biometria_error(l_error)
	f_biometria_escribe_log(log_es,l_errors)
	return -1
Else
	f_biometria_escribe_log(log_es,"Biométrica Inicializada Satisfactoriamente")
End If

l_error =huellas.object.GetGrFingerVersion(ref majorVersion, ref minorVersion)
If l_error = GRFINGER_FULL Then l_version = "FULL"
If l_error  = GRFINGER_LIGHT Then l_version = "LIGHT"
f_biometria_escribe_log(log_es,'Version SDK Griaule '+string(majorVersion) +'.' +string(minorVersion) + '.' +' Licencia Tipo '+l_version)
huellas.Object.CapInitialize() 

istr_template.template = Blob(Space(10000))
dw_huella.retrieve('cc',documentos)
dw_biometria.Modify("p_mano.FileName = '"+ f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos,'pac')+"'")


end event

event close;huellas.Object.DestroyContext(ii_contexto)
huellas.Object.Finalize()
FileDelete(TempFilePathName)
end event

type dw_biometria from datawindow within w_biometria
integer x = 987
integer y = 196
integer width = 914
integer height = 936
integer taborder = 20
string dataobject = "dw_biometria_imagen"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;dw_biometria.InsertRow(0)
end event

event clicked;if 	l_captura=false  then 
	If 	dwo.name='p_indice' then
		ContDedos=2
		this.SetItem(row, 'indice', 1)
		f_biometria_escribe_log(log_es,"Capture Huella del dedo INDICE ")
		dw_biometria.Modify("p_mano.FileName = '"+ f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos,'paci')+"'")
		l_captura=true
		dw_biometria.enabled=false
	End if
	
	If dwo.name='p_medio' then
		ContDedos=3
		dw_biometria.Modify("p_mano.FileName = '"+ f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos,'pac')+"'")
		l_captura=true
	end if
	
	If dwo.name='p_anular' then
		ContDedos=4
		f_biometria_escribe_log(log_es,"Capture Huella del dedo ANULAR")
		dw_biometria.Modify("p_mano.FileName = '"+ f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos,'pac')+"'")
		l_captura=true
	end if
	
	//If (pos_x>=905 and pos_x<=1042) and (pos_y>=884 and pos_y<=808) then
	//	ContDedos=1
	//     f_biometria_escribe_log(log_es,"Capture Huella del dedo PULGAR")
	//		p_dedo.picturename=f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos)
	//end if
	
	//If (pos_x>=1315 and pos_x<=1481) and (pos_y>=476 and pos_y<=540) then
	//	ContDedos=5
	//     f_biometria_escribe_log(log_es,"Capture Huella del dedo MEÑIQUE")
	//		p_dedo.picturename=f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos)
	//end if
end if
	

end event

type pb_1 from picturebutton within w_biometria
integer x = 261
integer y = 1412
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "verificad.gif"
string disabledname = "d_verificad.gif"
alignment htextalign = left!
end type

event clicked;String l_rec[2]

l_rec=f_biometria_valida_paciente(istr_template,'%','%',dw_huella,GR_MATCH,huellas,'paciente')
messagebox('1',l_rec[1])
messagebox('2',l_rec[2])


end event

type pb_veri from picturebutton within w_biometria
integer x = 489
integer y = 1416
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "verificad.gif"
string disabledname = "d_verificad.gif"
alignment htextalign = left!
end type

event clicked;String l_rec[2]

l_rec=f_biometria_valida_paciente(istr_template,'cc','7164027',dw_huella,GR_MATCH,huellas,'paciente')
messagebox('1',l_rec[1])
messagebox('2',l_rec[2])


end event

type dw_huella from datawindow within w_biometria
boolean visible = false
integer x = 1262
integer y = 1436
integer width = 539
integer height = 96
integer taborder = 30
string title = "none"
string dataobject = "dw_biometria_pacientes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type mle_1 from multilineedit within w_biometria
integer x = 41
integer y = 12
integer width = 1861
integer height = 172
integer taborder = 10
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Para captuar la huella dactilar, haga click en el dedo de la mano.  Puede borrar la huella haciendo click sobre el dedo.  Los dedos inscritos aparecen en color verde o de manera resaltada."
borderstyle borderstyle = stylelowered!
end type

type cbx_log from checkbox within w_biometria
integer x = 50
integer y = 1180
integer width = 942
integer height = 72
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostar Log del Lector de Huellas"
boolean checked = true
end type

event clicked;if cbx_log.checked then
    log_es.visible = True
Else
    log_es.visible= False
end If
end event

type pb_salir from picturebutton within w_biometria
integer x = 878
integer y = 1416
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "puerta.gif"
alignment htextalign = left!
end type

event clicked;huellas.Object.DestroyContext(ii_contexto)
huellas.Object.Finalize()
FileDelete(TempFilePathName)
close(parent)
end event

type pb_save from picturebutton within w_biometria
integer x = 704
integer y = 1416
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
end type

event clicked;long	l_fila,ll_handle
String ls_error, ls_test
Blob  lblob_aux
int donde

l_captura=false
ls_test="tipodoc='cc'"+" and documento='"+documentos+"' and dedo="+string(ContDedos)
l_fila=dw_huella.find(ls_test,1,dw_huella.rowcount())
if l_fila=0 then
	l_fila	= dw_huella.InsertRow(0)
	dw_huella.setitem(l_fila,'tipodoc','cc')
	dw_huella.setitem(l_fila,'documento',documentos)
	dw_huella.setitem(l_fila,'dedo',ContDedos)
end if
ll_handle = FileOpen(TempFilePathName, StreamMode!)
if ll_handle < 1 then
	f_biometria_escribe_log(log_es,'Error al abrir el archivo temporal de imagen')
	return -1
End if
FileReadEx(ll_handle, lblob_image)
FileClose(ll_handle)

if dw_huella.update()=-1 then
	rollback;
	f_biometria_escribe_log(log_Es,'Error grabando datos Biometricos')
	return -1
end if

//UPDATEBLOB pacientes_biometria SET huella = :lblob_image
//WHERE (((tipodoc)='cc') AND ((documento)=:documentos) AND (dedo=:ContDedos));		
//if SQLCA.SQLCode <> 0 then
//	Rollback;
//	MessageBox( 'Error', 'Error al Grabar la Huella: ')
//	return -1
//Else
	UPDATEBLOB pacientes_biometria SET datos_huella =  :istr_template.template
	WHERE (((tipodoc)='cc') AND ((documento)=:documentos) AND (dedo=:ContDedos));		
	
	if SQLCA.SQLCode <> 0 then
		Rollback;
		MessageBox( 'Error', 'Error al Grabar el Patrón de la Huella ')
		Return -1
	Else
		Commit;
	End if
//End if
dw_huella.retrieve('cc',documentos)
//p_dedo.picturename=f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos)
dw_biometria.enabled=true
p_imagen.picturename = "Erroneo.png"
return 1
end event

type huellas from olecustomcontrol within w_biometria
event sensorplug ( string idsensor )
event sensorunplug ( string idsensor )
event fingerup ( string idsensor )
event fingerdown ( string idsensor )
event imageacquired ( string idsensor,  long ocx_width,  long ocx_height,  any rawimage,  long res )
integer x = 1047
integer y = 1416
integer width = 146
integer height = 128
integer taborder = 20
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_biometria.win"
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event sensorplug(string idsensor);f_biometria_escribe_log(log_es,"Sensor: " + idSensor)
Object.CapStartCapture(idSensor)

end event

event sensorunplug(string idsensor);Object.CapStopCapture(idSensor)
end event

event imageacquired(string idsensor, long ocx_width, long ocx_height, any rawimage, long res);st_biometria lstr_test
ulong ll_handle
integer ret
String ls_test

if 	l_captura=true  then
	p_imagen.picturename = ''
	FileDelete(TempFilePathName)
	//Graba la imagen en archivo para poder mostrarla
	huellas.Object.CapSaveRawImageToFile(rawimage, ocx_width, ocx_Height, TempFilePathName, GRCAP_IMAGE_FORMAT_BMP);
	lstr_test.size = 10000
	lstr_test.template = Blob(Space(lstr_test.size))
	ret= huellas.Object.Extract(ref rawimage, ocx_Width, ocx_Height, Res, Ref lstr_test.template,Ref lstr_test.size, ii_contexto);
	p_imagen.originalsize=true
	If ret = GR_BAD_QUALITY Then
//		 escribe_log("La Huella Dactilar Extraida es de Mala Calidad")
		 p_imagen.picturename = "Erroneo.png"
		 return 
	ElseIf ret = GR_MEDIUM_QUALITY Then
	//	escribe_log("Huella Dactilar Extraida es de Calidad Media.")
		p_imagen.picturename = "Erroneo.png"
		return 
	  ElseIf ret = GR_HIGH_QUALITY Then
		f_biometria_escribe_log(log_es,"Huella Dactilar Extraida Satisfactoriamente. Calidad Excelente.")
	End If
	
	p_imagen.picturename = TempFilePathName
	p_imagen.originalsize=false
	p_imagen.resize(914,936)
	istr_template = lstr_test
	pb_save.enabled=true
end if

end event

type log_es from listbox within w_biometria
integer x = 32
integer y = 1252
integer width = 1861
integer height = 152
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type p_imagen from picture within w_biometria
integer x = 41
integer y = 196
integer width = 914
integer height = 936
boolean originalsize = true
string picturename = "erroneo.png"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
09w_biometria.bin 
2500000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000001000000000000000000000000000000000000000000000000000000002e1f566001cd6a8600000003000000800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff0000000371944dd64558b5d2350402addf392bcb000000002e1f566001cd6a862e1f566001cd6a86000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000000c00000000fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000008000000034f0000034f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000000034f0000034f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19w_biometria.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
