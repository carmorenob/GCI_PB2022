$PBExportHeader$uo_dentaldwc.sru
forward
global type uo_dentaldwc from userobject
end type
type st_1 from statictext within uo_dentaldwc
end type
type dwc_dentalobj from datawindow within uo_dentaldwc
end type
end forward

global type uo_dentaldwc from userobject
integer width = 206
integer height = 212
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event type integer clicked ( integer xpos,  integer ypos,  dwobject dwo )
event mousemove ( dwobject dwo )
st_1 st_1
dwc_dentalobj dwc_dentalobj
end type
global uo_dentaldwc uo_dentaldwc

type variables
int nCuadrante
int nPieza
boolean bloqueado = false
//datastore dw_odongrama
int sup1=0, sup2=0, sup3=0, sup4=0, sup5=0
end variables

forward prototypes
public subroutine reset ()
public function integer getsuperficie (string figura)
public function integer retrieve (long nodongrama, string lugar)
public function integer paint ()
public subroutine setbloqueado (boolean valor)
public function boolean getbloqueado ()
public function integer amalgama (string superficie)
public function integer amalgamades (string superficie)
public function integer ausente ()
public function integer autocurado ()
public function integer cariescavi (string superficie)
public function integer cariesncavi (string superficie)
public function integer cariesplaca (string superficie)
public function integer coronades ()
public function integer coronahecha ()
public function integer desdentado ()
public function integer endodonciahecha ()
public function integer endodonciaind ()
public function integer erupcion ()
public function integer extracind ()
public function integer extraido ()
public function integer fotocurado ()
public function integer incluido ()
public function integer ionomero (string superficie)
public function integer nucleo ()
public function integer nucleopend ()
public function integer placa (string superficie)
public function integer resinades (string superficie)
public function integer resinafoto (string superficie)
public function integer rmausente ()
public function integer rmcorona ()
public function integer rmdesdentado ()
public function integer rmdiagsuperf (string superficie)
public function integer rmendodoncia ()
public function integer rmerupcion ()
public function integer rmextrac ()
public function integer rmextraido ()
public function integer rmincluido ()
public function integer rmnucleo ()
public function integer rmsano ()
public function integer sano ()
public function integer setsuperficie (integer convencion)
public function integer extraidot ()
public function integer rmextraidot ()
end prototypes

public subroutine reset ();string ret

bloqueado=false
sup1=0
sup2=0
sup3=0 
sup4=0 
sup5=0
ret = "ov_Corona.Visible=FALSE t_Sano.Visible=FALSE l_v.Visible=FALSE l_1.Visible=FALSE " +&
"l_2.Visible=FALSE ov_Erupcion.Visible=FALSE l_erup1.Visible=FALSE " +&
"l_erup2.Visible=FALSE l_erup3.Visible=FALSE ov_inc.Visible=FALSE " +&
"l_inc1.Visible=FALSE l_inc2.Visible=FALSE l_inc3.Visible=FALSE " +&
"ov_endo.Visible=FALSE l_flecha1.Visible=FALSE l_flecha2.Visible=FALSE " +&
"l_flecha3.Visible=FALSE l_ausente.Visible=FALSE l_desden1.Visible=FALSE " +&
"l_desden2.Visible=FALSE rr_1.Brush.Color="+String(RGB(255,255,255)) +&
" rr_1.Brush.Hatch=6 rr_1.Pen.Color=0 rr_2.Brush.Color="+String(RGB(255,255,255)) +&
" rr_2.Brush.Hatch=6 rr_2.Pen.Color=0 rr_3.Brush.Color="+String(RGB(255,255,255)) +&
" rr_3.Brush.Hatch=6 rr_3.Pen.Color=0 rr_4.Brush.Color="+String(RGB(255,255,255)) +&
" rr_4.Brush.Hatch=6 rr_4.Pen.Color=0 rr_5.Brush.Color="+String(RGB(255,255,255)) +&
" rr_5.Brush.Hatch=6 rr_5.Pen.Color=0"

dwc_dentalobj.modify(ret)

end subroutine

public function integer getsuperficie (string figura);int superf

if figura = 'rr_1' then
	if (nCuadrante = 1) or (nCuadrante = 2) or (nCuadrante = 5) or (nCuadrante = 6) then
		superf = 1
	else
		superf = 4
	end if
elseif figura = 'rr_2' then
	if (nCuadrante = 1) or (nCuadrante = 4) or (nCuadrante = 5) or (nCuadrante = 8) then
		superf = 2
	else
		superf = 3
	end if
elseif figura = 'rr_3' then
	if (nCuadrante = 1) or (nCuadrante = 4) or (nCuadrante = 5) or (nCuadrante = 8) then
		superf = 3
	else
		superf = 2
	end if
elseif figura = 'rr_4' then
	if (nCuadrante = 1) or (nCuadrante = 2) or (nCuadrante = 5) or (nCuadrante = 6) then
		superf = 4
	else
		superf = 1
	end if
elseif figura = 'rr_5' then
	superf = 5
end if

return superf
end function

public function integer retrieve (long nodongrama, string lugar);return 0

end function

public function integer paint ();Return 0

end function

public subroutine setbloqueado (boolean valor);this.bloqueado = valor
end subroutine

public function boolean getbloqueado ();
return this.bloqueado

end function

public function integer amalgama (string superficie);if getBloqueado() then Return -1
if dwc_dentalobj.describe("t_sano.Visible") = '1' then return -1

string ret
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(0,0,255)))
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=6")

return 1
end function

public function integer amalgamades (string superficie);if getBloqueado() then Return -1 
if dwc_dentalobj.describe("t_sano.Visible") = '1' then return -1
String ret
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=6")
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(0,0,255)))
ret = dwc_dentalobj.modify(superficie+".Pen.Color="+String(RGB(255,0,0)))
return 1
end function

public function integer ausente ();string ret 

ret = dwc_dentalobj.modify("l_ausente.Visible=TRUE")
return 1
end function

public function integer autocurado ();if getBloqueado() then Return -1
if dwc_dentalobj.describe("t_sano.Visible") = '1' then return -1
string ret
ret = dwc_dentalobj.modify("t_sano.Visible=TRUE")
ret = dwc_dentalobj.modify("t_sano.Text='SA'")

return 1
end function

public function integer cariescavi (string superficie);if getBloqueado() then Return -1
if dwc_dentalobj.describe("t_sano.Visible") = '1' then return -1
string ret
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(255,0,0)))
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=6")

return 1
end function

public function integer cariesncavi (string superficie);if getBloqueado() then Return -1
if dwc_dentalobj.describe("t_sano.Visible") = '1' then return -1
string ret
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(185,122,87)))
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=6")
return 1
end function

public function integer cariesplaca (string superficie);if getBloqueado() then Return -1
if dwc_dentalobj.describe("t_sano.Visible") = '1' then return -1
string ret
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(0,0,0)))
ret = dwc_dentalobj.modify(superficie+".background.Color="+String(RGB(255,255,94)))
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=5")
return 1
end function

public function integer coronades ();string ret

ret = dwc_dentalobj.modify("ov_Corona.Visible=TRUE")
ret = dwc_dentalobj.modify("ov_Corona.Pen.Color="+String(RGB(255,0,0)))
return 1
end function

public function integer coronahecha ();string ret

ret = dwc_dentalobj.modify("ov_Corona.Visible=TRUE")
//ret = dwc_dentalobj.modify("r_Corona.Brush.Color="+String(RGB(0,0,0)))
ret = dwc_dentalobj.modify("ov_Corona.Pen.Color="+String(RGB(0,0,0)))
return 1
end function

public function integer desdentado ();string ret

ret = dwc_dentalobj.modify("l_desden1.Visible=TRUE")
ret = dwc_dentalobj.modify("l_desden2.Visible=TRUE")
return 1
end function

public function integer endodonciahecha ();string ret

ret = dwc_dentalobj.modify("ov_endo.Visible=TRUE")
ret = dwc_dentalobj.modify("ov_endo.Pen.Color="+String(RGB(0,0,255)))
ret = dwc_dentalobj.modify("l_flecha1.Visible=TRUE")
ret = dwc_dentalobj.modify("l_flecha1.Pen.Color="+String(RGB(0,0,255)))
ret = dwc_dentalobj.modify("l_flecha2.Visible=TRUE")
ret = dwc_dentalobj.modify("l_flecha2.Pen.Color="+String(RGB(0,0,255)))
ret = dwc_dentalobj.modify("l_flecha3.Visible=TRUE")
ret = dwc_dentalobj.modify("l_flecha3.Pen.Color="+String(RGB(0,0,255)))
return 1
end function

public function integer endodonciaind ();string ret

ret = dwc_dentalobj.modify("ov_endo.Visible=TRUE")
ret = dwc_dentalobj.modify("ov_endo.Pen.Color="+String(RGB(255,0,0)))
ret = dwc_dentalobj.modify("l_flecha1.Visible=TRUE")
ret = dwc_dentalobj.modify("l_flecha1.Pen.Color="+String(RGB(255,0,0)))
ret = dwc_dentalobj.modify("l_flecha2.Visible=TRUE")
ret = dwc_dentalobj.modify("l_flecha2.Pen.Color="+String(RGB(255,0,0)))
ret = dwc_dentalobj.modify("l_flecha3.Visible=TRUE")
ret = dwc_dentalobj.modify("l_flecha3.Pen.Color="+String(RGB(255,0,0)))
return 1
end function

public function integer erupcion ();string ret
ret = dwc_dentalobj.modify("ov_erupcion.Visible=TRUE")
ret = dwc_dentalobj.modify("l_erup1.Visible=TRUE")
ret = dwc_dentalobj.modify("l_erup2.Visible=TRUE")
ret = dwc_dentalobj.modify("l_erup3.Visible=TRUE")
this.setBloqueado(true)

return 1
end function

public function integer extracind ();if getBloqueado() then Return -1
string ret 
ret = dwc_dentalobj.modify("l_1.Visible=TRUE")
ret = dwc_dentalobj.modify("l_2.Visible=TRUE")
ret = dwc_dentalobj.modify("l_1.Pen.Color="+String(RGB(255,0,0)))
ret = dwc_dentalobj.modify("l_2.Pen.Color="+String(RGB(255,0,0)))
//this.setBloqueado(true)
return 1
end function

public function integer extraido ();///if getBloqueado() then Return -1
string ret 
ret = dwc_dentalobj.modify("l_v.Visible=TRUE")
ret = dwc_dentalobj.modify("l_v.Pen.Color="+String(RGB(0,0,0)))
this.setBloqueado(true)

return 1
end function

public function integer fotocurado ();string ret
ret = dwc_dentalobj.modify("t_sano.Visible=TRUE")
ret = dwc_dentalobj.modify("t_sano.Text='SF'")

return 1
end function

public function integer incluido ();string ret

ret = dwc_dentalobj.modify("ov_inc.Visible=TRUE")
ret = dwc_dentalobj.modify("l_inc1.Visible=TRUE")
ret = dwc_dentalobj.modify("l_inc2.Visible=TRUE")
ret = dwc_dentalobj.modify("l_inc3.Visible=TRUE")

return 1
end function

public function integer ionomero (string superficie);string ret
if getBloqueado() then Return -1
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(27,158,33)))
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=6")

return 1
end function

public function integer nucleo ();dwc_dentalobj.modify("t_sano.Visible=TRUE t_sano.Text='N' t_sano.color='0'")
return 1
end function

public function integer nucleopend ();dwc_dentalobj.modify("t_sano.Visible=TRUE t_sano.Text='N' t_sano.color='255'")
return 1
end function

public function integer placa (string superficie);string ret
if getBloqueado() then Return -1
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(255,255,94)))
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=6")
return 1
end function

public function integer resinades (string superficie);string ret
if getBloqueado() then Return -1
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(0,0,255)))
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=4")
ret = dwc_dentalobj.modify(superficie+".Pen.Color="+String(RGB(255,0,0)))

return 1
end function

public function integer resinafoto (string superficie);string ret
if getBloqueado() then Return -1
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(0,0,255)))
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=4")

return 1
end function

public function integer rmausente ();string ret 

ret = dwc_dentalobj.modify("l_ausente.Visible=FALSE")

return 1
end function

public function integer rmcorona ();string ret

ret = dwc_dentalobj.modify("ov_Corona.Visible=FALSE")

return 1
end function

public function integer rmdesdentado ();string ret

ret = dwc_dentalobj.modify("l_desden1.Visible=FALSE")
ret = dwc_dentalobj.modify("l_desden2.Visible=FALSE")
this.setBloqueado(true)

return 1
end function

public function integer rmdiagsuperf (string superficie);//if getBloqueado() then Return -1
//if dwc_dentalobj.describe("t_sano.Visible") = '1' then return -1
//
string ret
ret = dwc_dentalobj.modify(superficie+".Brush.Color="+String(RGB(255,255,255)))
ret = dwc_dentalobj.modify(superficie+".Brush.Hatch=6")
ret = dwc_dentalobj.modify(superficie+".Pen.Color="+String(RGB(0,0,0)))

return 1
end function

public function integer rmendodoncia ();//if getBloqueado() then Return -1
//if dwc_dentalobj.describe("t_sano.Visible") = '1' then return -1
//
string ret
ret = dwc_dentalobj.modify("ov_endo.Visible=FALSE")
ret = dwc_dentalobj.modify("l_flecha1.Visible=FALSE")
ret = dwc_dentalobj.modify("l_flecha2.Visible=FALSE")
ret = dwc_dentalobj.modify("l_flecha3.Visible=FALSE")

return 1
end function

public function integer rmerupcion ();string ret
ret = dwc_dentalobj.modify("ov_erupcion.Visible=FALSE")
ret = dwc_dentalobj.modify("l_erup1.Visible=FALSE")
ret = dwc_dentalobj.modify("l_erup2.Visible=FALSE")
ret = dwc_dentalobj.modify("l_erup3.Visible=FALSE")

return 1
end function

public function integer rmextrac ();string ret 

ret = dwc_dentalobj.modify("l_1.Visible=FALSE")
ret = dwc_dentalobj.modify("l_2.Visible=FALSE")
return 1
end function

public function integer rmextraido ();string ret 
ret = dwc_dentalobj.modify("l_v.Visible=FALSE")
return 1
end function

public function integer rmincluido ();string ret
if getBloqueado() then Return -1
ret = dwc_dentalobj.modify("ov_inc.Visible=FALSE")
ret = dwc_dentalobj.modify("l_inc1.Visible=FALSE")
ret = dwc_dentalobj.modify("l_inc2.Visible=FALSE")
ret = dwc_dentalobj.modify("l_inc3.Visible=FALSE")

return 1
end function

public function integer rmnucleo ();dwc_dentalobj.modify("t_sano.Visible=FALSE")

return 1
end function

public function integer rmsano ();string ret
this.setBloqueado(false)
ret = dwc_dentalobj.modify("t_sano.Visible=FALSE")

return 1
end function

public function integer sano ();string ret
ret = dwc_dentalobj.modify("t_sano.Visible=TRUE")
ret = dwc_dentalobj.modify("t_sano.Text='S'")
this.setBloqueado(true)
return 1
end function

public function integer setsuperficie (integer convencion);sup1 = convencion

return 0
end function

public function integer extraidot ();//if getBloqueado() then Return -1
string ret 
ret = dwc_dentalobj.modify("l_v1.Visible=TRUE")
ret = dwc_dentalobj.modify("l_v1.Pen.Color="+String(RGB(0,0,255)))
this.setBloqueado(true)

return 1
end function

public function integer rmextraidot ();string ret 
ret = dwc_dentalobj.modify("l_v1.Visible=FALSE")
return 1
end function

on uo_dentaldwc.create
this.st_1=create st_1
this.dwc_dentalobj=create dwc_dentalobj
this.Control[]={this.st_1,&
this.dwc_dentalobj}
end on

on uo_dentaldwc.destroy
destroy(this.st_1)
destroy(this.dwc_dentalobj)
end on

event constructor;dwc_dentalobj.InsertRow(0)
st_1.Text = string(nCuadrante) + string(nPieza)

end event

type st_1 from statictext within uo_dentaldwc
integer x = 50
integer width = 82
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type dwc_dentalobj from datawindow within uo_dentaldwc
event mousemove pbm_dwnmousemove
integer x = 5
integer y = 52
integer width = 165
integer height = 164
integer taborder = 10
string title = "none"
string dataobject = "dw_dentalobj"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;parent.Event mousemove (dwo)
end event

event clicked;parent.Event clicked (xpos,ypos,dwo)

end event

