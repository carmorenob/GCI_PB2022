$PBExportHeader$w_test.srw
forward
global type w_test from window
end type
type uo_1 from uo_hc within w_test
end type
end forward

global type w_test from window
integer width = 3483
integer height = 1964
boolean titlebar = true
string title = "Actualización HC"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
uo_1 uo_1
end type
global w_test w_test

type variables
st_evalua st_p

end variables

on w_test.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on w_test.destroy
destroy(this.uo_1)
end on

event closequery;int ret
if uo_1.Modified() then
	ret = MessageBox('Aviso','El documento ha cambiado desea guardarlo?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		if uo_1.Save() = -1 then
			Return -1
		end if
	elseif ret = 3 then
		Return -1
	end if
end if
if isValid(w_evaluacion) then
	if IsValid(w_evaluacion.dw_1) then w_evaluacion.dw_1.TriggerEvent(RowFocusChanged!)
end if

end event

event open;st_p = Message.PowerObjectParm
uo_1.nuevo = st_p.nuevo
uo_1.tipodoc = st_p.tipodoc
uo_1.documento = st_p.documento
uo_1.Retrieve(st_p.numdoc,st_p.lugar,st_p.codplantilla,st_p.ncargo)

end event

event key;if key=uo_1.nextitem or key=uo_1.previtem or key=uo_1.nextchild then uo_1.mover(key)


end event

type uo_1 from uo_hc within w_test
integer x = 5
integer y = 4
integer taborder = 20
string coddoc = "NE"
boolean i_displayonly = false
end type

on uo_1.destroy
call uo_hc::destroy
end on

