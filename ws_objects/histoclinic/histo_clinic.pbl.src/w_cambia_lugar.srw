$PBExportHeader$w_cambia_lugar.srw
forward
global type w_cambia_lugar from window
end type
type pb_2 from picturebutton within w_cambia_lugar
end type
type pb_1 from picturebutton within w_cambia_lugar
end type
type dw_1 from datawindow within w_cambia_lugar
end type
end forward

global type w_cambia_lugar from window
integer width = 1454
integer height = 440
boolean titlebar = true
string title = "Cambiar Lugar de Atención"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "r_camlug.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_cambia_lugar w_cambia_lugar

on w_cambia_lugar.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_cambia_lugar.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

type pb_2 from picturebutton within w_cambia_lugar
string tag = "           &c"
integer x = 709
integer y = 168
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
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_cambia_lugar
string tag = "           &a"
integer x = 521
integer y = 168
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;window wSheet
wSheet = w_principal.GetFirstSheet()
IF IsValid (wSheet) THEN
	messagebox('Atención','Debe cerrar todas las ventanas para poder cambiar el Lugar')
	return
end if

string ls_mueve_kardex,ls_alm_cext,ls_alm_hosp,ls_alm_urg,ls_alm_amb,ls_pasa //todas son para mover kardex

if ls_pro=32 THEN
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, ls_mueve_kardex)
end if
if ls_pro=64 THEN
	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, ls_mueve_kardex)
end if

if ls_mueve_kardex='1' then
	if ls_pro=32 THEN	
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_CEXT", Regstring!, ls_alm_cext )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, ls_alm_urg )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, ls_alm_hosp )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, ls_alm_amb )
	end if
	if ls_pro=64 THEN	
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_CEXT", Regstring!, ls_alm_cext )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, ls_alm_urg )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, ls_alm_hosp )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, ls_alm_amb )
	end if
	
	if ls_alm_cext='' or ls_alm_urg='' or ls_alm_hosp='' or ls_alm_amb='' then
		messagebox("Atención","Esta máquina se encuentra configurada para manejar Kardex pero no tiene los códigos de los almacenes para esto") 
		close(parent)		
		return
	end if
	
	SELECT 
		codlugar into :ls_pasa
	FROM 
		sumalmacen
	WHERE 
		(((sumalmacen.codalmacen)=:ls_alm_cext));

	if ls_pasa <>dw_1.getitemstring(1,1) then
		messagebox("Atención","Esta máquina se encuentra configurada para manejar Kardex pero no tiene los códigos de los almacenes adecuados.  Verifique x configurador") 
		close(parent)		
		return
	end if
	
	SELECT 
		codlugar into :ls_pasa
	FROM 
		sumalmacen
	WHERE 
		(((sumalmacen.codalmacen)=:ls_alm_urg));

	if ls_pasa <>dw_1.getitemstring(1,1) then
		messagebox("Atención","Esta máquina se encuentra configurada para manejar Kardex pero no tiene los códigos de los almacenes adecuados.  Verifique x configurador") 
		close(parent)		
		return
	end if

	
	SELECT 
		codlugar into :ls_pasa
	FROM 
		sumalmacen
	WHERE 
		(((sumalmacen.codalmacen)=:ls_alm_hosp));

	if ls_pasa <>dw_1.getitemstring(1,1) then
		messagebox("Atención","Esta máquina se encuentra configurada para manejar Kardex pero no tiene los códigos de los almacenes adecuados.  Verifique x configurador") 
		close(parent)		
		return
	end if	

	SELECT 
		codlugar into :ls_pasa
	FROM 
		sumalmacen
	WHERE 
		(((sumalmacen.codalmacen)=:ls_alm_amb));

	if ls_pasa <>dw_1.getitemstring(1,1) then
		messagebox("Atención","Esta máquina se encuentra configurada para manejar Kardex pero no tiene los códigos de los almacenes adecuados.  Verifique x configurador") 
		close(parent)		
		return
	end if	
	
end if


clugar=dw_1.getitemstring(1,1)
w_principal.lf_titulo()
close(parent)
end event

type dw_1 from datawindow within w_cambia_lugar
integer x = 78
integer width = 1312
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,clugar)
end event

