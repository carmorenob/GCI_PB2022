$PBExportHeader$pb_report.sru
forward
global type pb_report from picturebutton
end type
end forward

global type pb_report from picturebutton
integer width = 146
integer height = 128
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print.gif"
string disabledname = "d_print.gif"
alignment htextalign = left!
end type
global pb_report pb_report

type variables
string cod_rep,nombre_rep,tipo_rep,i_clugar
boolean dialogo=false,v_preliminar=false
long tam_imp=100
int num_cop=1
uo_report report

end variables

forward prototypes
public function integer inicia ()
public function integer inicia (string p_tipo_rep, string p_cod_rep, string p_clugar)
public function integer imprimir (any parametros[], string profes, string qr)
end prototypes

public function integer inicia ();int i
i=report.inicia()
enabled=report.enabled
return i

end function

public function integer inicia (string p_tipo_rep, string p_cod_rep, string p_clugar);int i
tipo_rep=p_tipo_rep
report.tipo_rep=p_tipo_rep
cod_Rep=p_cod_rep
report.cod_rep=p_cod_rep
i_clugar=p_clugar
report.i_clugar=p_clugar
i=report.inicia()
enabled=report.enabled
return i

end function

public function integer imprimir (any parametros[], string profes, string qr);int i
i=report.imprimir(parametros,profes,qr)
enabled=report.enabled
return i

end function

on pb_report.create
end on

on pb_report.destroy
end on

event rbuttondown;if not isvalid(m_conf_pag) then m_conf_pag=create m_conf_pag
if report.dw_rep.describe('datawindow.syntax')='' then
	if inicia()=-1 then return
end if
report.dw_rep.reset()
m_conf_pag.i_rep=report
window w_temp
w_temp=f_vent_padre(this)
if w_temp.windowtype=response! or w_temp.windowtype=popup! then
	m_conf_pag.popmenu(w_temp.pointerx(),w_temp.pointery())
else
	m_conf_pag.popmenu(w_temp.parentwindow().pointerx(),w_temp.parentwindow().pointery())
end if

end event

event constructor;report=create uo_report
i_clugar=clugar
report.i_clugar=clugar
report.cod_rep=cod_rep
report.tipo_rep=tipo_rep
report.nombre_rep=nombre_rep
report.num_cop=num_cop
report.dialogo=dialogo
report.tam_imp=tam_imp
report.v_preliminar=v_preliminar
powertiptext+=' (Click contrario para Propiedades de '+cod_rep+')'


end event

