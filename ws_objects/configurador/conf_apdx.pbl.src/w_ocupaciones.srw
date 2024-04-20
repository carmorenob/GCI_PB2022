$PBExportHeader$w_ocupaciones.srw
forward
global type w_ocupaciones from w_center
end type
type sle_1 from singlelineedit within w_ocupaciones
end type
type st_2 from statictext within w_ocupaciones
end type
type tab_1 from tab within w_ocupaciones
end type
type tabp_1 from userobject within tab_1
end type
type pb_import from picturebutton within tabp_1
end type
type pb_export from picturebutton within tabp_1
end type
type dw_2 from datawindow within tabp_1
end type
type st_regi from statictext within tabp_1
end type
type st_cuenta from statictext within tabp_1
end type
type st_nat from statictext within tabp_1
end type
type st_mvto from statictext within tabp_1
end type
type st_1 from statictext within tabp_1
end type
type tabp_1 from userobject within tab_1
pb_import pb_import
pb_export pb_export
dw_2 dw_2
st_regi st_regi
st_cuenta st_cuenta
st_nat st_nat
st_mvto st_mvto
st_1 st_1
end type
type tabp_2 from userobject within tab_1
end type
type pb_del_cta from picturebutton within tabp_2
end type
type pb_new_cuenta from picturebutton within tabp_2
end type
type pb_del_grupo from picturebutton within tabp_2
end type
type pb_new_grupo from picturebutton within tabp_2
end type
type pb_del_mayor from picturebutton within tabp_2
end type
type pb_new_mayor from picturebutton within tabp_2
end type
type dw_cuenta from datawindow within tabp_2
end type
type dw_grupo from datawindow within tabp_2
end type
type dw_mayor from datawindow within tabp_2
end type
type tabp_2 from userobject within tab_1
pb_del_cta pb_del_cta
pb_new_cuenta pb_new_cuenta
pb_del_grupo pb_del_grupo
pb_new_grupo pb_new_grupo
pb_del_mayor pb_del_mayor
pb_new_mayor pb_new_mayor
dw_cuenta dw_cuenta
dw_grupo dw_grupo
dw_mayor dw_mayor
end type
type tabp_3 from userobject within tab_1
end type
type pb_new_subcta from picturebutton within tabp_3
end type
type pb_del_subcta from picturebutton within tabp_3
end type
type pb_new_n1 from picturebutton within tabp_3
end type
type pb_del_n1 from picturebutton within tabp_3
end type
type pb_new_n2 from picturebutton within tabp_3
end type
type pb_del_n2 from picturebutton within tabp_3
end type
type dw_n2 from datawindow within tabp_3
end type
type dw_n1 from datawindow within tabp_3
end type
type dw_subcta from datawindow within tabp_3
end type
type tabp_3 from userobject within tab_1
pb_new_subcta pb_new_subcta
pb_del_subcta pb_del_subcta
pb_new_n1 pb_new_n1
pb_del_n1 pb_del_n1
pb_new_n2 pb_new_n2
pb_del_n2 pb_del_n2
dw_n2 dw_n2
dw_n1 dw_n1
dw_subcta dw_subcta
end type
type tab_1 from tab within w_ocupaciones
tabp_1 tabp_1
tabp_2 tabp_2
tabp_3 tabp_3
end type
type dw_1 from datawindow within w_ocupaciones
end type
type st_3 from statictext within w_ocupaciones
end type
end forward

global type w_ocupaciones from w_center
string tag = "Realizó Cambios en Ocupaciones, desea guardarlas ?."
integer width = 4526
integer height = 2388
string title = "Ocupaciones"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
windowstate windowstate = maximized!
string icon = "plan.ico"
sle_1 sle_1
st_2 st_2
tab_1 tab_1
dw_1 dw_1
st_3 st_3
end type
global w_ocupaciones w_ocupaciones

type variables
//m_pop_conta menu
string filtro,i_vocup
boolean i_cam_mayor,i_cam_grupo,i_cam_cuenta,i_cam_subcta,i_cam_n1,i_cam_n2,i_cam_n3,i_cam_n4,i_cam_n5,i_cam_gral
long cuantas
end variables

forward prototypes
public subroutine muestra2 (string mostrar, integer xpos, integer ypos)
public subroutine filtrar_1 (integer digitar)
public subroutine f_keyup (datawindow esta, keycode key)
public subroutine f_getfocus (datawindow esta)
public subroutine f_itemfocuschanged (string name_col, datawindow datawin)
public function boolean f_buttonclicked (long row, datawindow dw)
public function integer f_new (datawindow esta, datawindow padre, integer nivel)
public function integer f_actu_cuenta (string nivel, string nuevo, string pedazo_ante)
public function integer grabar ()
public function integer f_itemchanged (datawindow esta, datawindow hija, string data)
end prototypes

public subroutine muestra2 (string mostrar, integer xpos, integer ypos);
end subroutine

public subroutine filtrar_1 (integer digitar);CHOOSE CASE digitar
	case 0
		tab_1.tabp_1.dw_2.setfilter(filtro)
		tab_1.tabp_1.dw_2.filter()
		tab_1.tabp_1.dw_2.sort()
	case 1
		tab_1.tabp_1.dw_2.setfilter("lower(codigo) like '"+lower(trim(sle_1.text))+"%'")
		tab_1.tabp_1.dw_2.filter()
		tab_1.tabp_1.dw_2.sort()
		digitar=0
	case 2
		sle_1.text=''
		tab_1.tabp_1.dw_2.setfilter("lower(codigo) like '"+lower(trim(sle_1.text))+"%'")
		tab_1.tabp_1.dw_2.filter()
		tab_1.tabp_1.dw_2.sort()
		digitar=0						
END CHOOSE
tab_1.tabp_1.st_1.text=string(tab_1.tabp_1.dw_2.rowcount())+' Registros'
end subroutine

public subroutine f_keyup (datawindow esta, keycode key);string colum
colum=esta.getcolumnname()
if colum="cta_ajuste" or colum= "cta_cpartida" or colum="cta_ajuste_dep" or colum="cta_cpartida_dep" then
//	f_busca_cuenta(key,i_codemp,esta)
end if
end subroutine

public subroutine f_getfocus (datawindow esta);//f_semovio(esta,i_codemp,{"cta_ajuste" ,"cta_cpartida" ,"cta_ajuste_dep" ,"cta_cpartida_dep"})

end subroutine

public subroutine f_itemfocuschanged (string name_col, datawindow datawin);//f_semovio(datawin,i_codemp,{"cta_ajuste" ,"cta_cpartida" ,"cta_ajuste_dep" ,"cta_cpartida_dep" })




end subroutine

public function boolean f_buttonclicked (long row, datawindow dw);if row<1 or isnull(row) then return false
if isnull(dw.getitemstring(row,"rfuente")) then return false
string nulo
setnull(nulo)
dw.setitem(row,"rfuente",nulo)
return true

end function

public function integer f_new (datawindow esta, datawindow padre, integer nivel);long donde,donde_ant
donde_ant=padre.getrow()
if donde_ant<1 then return -1
if padre.getitemstring(donde_ant,"agrupa")='0' then
	Messagebox("Atención","No se puede crear esta cuenta ya que su antecesor es de agrupamiento")
	return -1
end if
donde=esta.insertrow(0)
if nivel>=7 then
	esta.setitem(donde,"clase2",padre.getitemstring(donde_ant,"clase2"))
end if
if nivel>=6 then
	esta.setitem(donde,"clase1",padre.getitemstring(donde_ant,"clase1"))
end if
if nivel>=5 then
	esta.setitem(donde,"clase",padre.getitemstring(donde_ant,"clase"))
end if
if nivel>=4 then
	esta.setitem(donde,"subgr",padre.getitemstring(donde_ant,"subgr"))
end if
if nivel>=3 then
	esta.setitem(donde,"psubgr",padre.getitemstring(donde_ant,"psubgr"))
end if
if nivel>=2 then
	esta.setitem(donde,"ggrupo",padre.getitemstring(donde_ant,"ggrupo"))
end if
esta.scrolltorow(donde)
if esta.rowcount()>1 then
	long j
	for j=12 to 26
		esta.setitem(donde,j,esta.getitemstring(donde -1 ,j))
	next
//	esta.setitem(donde,"vida_util",esta.getitemnumber(donde -1 , "vida_util"))
end if
esta.setitem(donde,"version",i_vocup)
esta.setcolumn(nivel)
esta.setfocus()
return 1
end function

public function integer f_actu_cuenta (string nivel, string nuevo, string pedazo_ante);pedazo_ante+="%"
choose case nivel
	case "mayor"
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = :nuevo+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4+cont_plan.nivel5, CONT_PLAN.mayor = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel5 Is Not Null And CONT_PLAN.Nivel5<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = :nuevo+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4, CONT_PLAN.mayor = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel4 Is Not Null And CONT_PLAN.Nivel4<>'' and (nivel5 is null or nivel5='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = :nuevo+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3, CONT_PLAN.mayor = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel3 Is Not Null And CONT_PLAN.Nivel3<>'' and (nivel4 is null or nivel4='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = :nuevo+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2, CONT_PLAN.mayor = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel2 Is Not Null And CONT_PLAN.Nivel2<>'' and (nivel3 is null or nivel3='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = :nuevo+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1, CONT_PLAN.mayor = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel1 Is Not Null And CONT_PLAN.Nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = :nuevo+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta, CONT_PLAN.mayor = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.subcuenta Is Not Null And CONT_PLAN.subcuenta<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subcuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = :nuevo+cont_plan.grupo+cont_plan.cuenta, CONT_PLAN.mayor = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.cuenta Is Not Null And CONT_PLAN.cuenta<>'' and (subcuenta is null or subcuenta='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Cuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = :nuevo+cont_plan.grupo, CONT_PLAN.mayor = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.grupo Is Not Null And CONT_PLAN.grupo<>'' and (cuenta is null or cuenta='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Grupo",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = :nuevo, CONT_PLAN.mayor = :nuevo
		WHERE CONT_PLAN.CodTotal like :pedazo_ante and (grupo is null or grupo='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Mayor",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "grupo"
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+:nuevo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4+cont_plan.nivel5, CONT_PLAN.grupo = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel5 Is Not Null And CONT_PLAN.Nivel5<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+:nuevo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4, CONT_PLAN.grupo = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel4 Is Not Null And CONT_PLAN.Nivel4<>'' and (nivel5 is null or nivel5='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+:nuevo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3, CONT_PLAN.grupo = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel3 Is Not Null And CONT_PLAN.Nivel3<>'' and (nivel4 is null or nivel4='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+:nuevo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2, CONT_PLAN.grupo = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel2 Is Not Null And CONT_PLAN.Nivel2<>'' and (nivel3 is null or nivel3='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+:nuevo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1, CONT_PLAN.grupo = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel1 Is Not Null And CONT_PLAN.Nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+:nuevo+cont_plan.cuenta+cont_plan.subcuenta, CONT_PLAN.grupo = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.subcuenta Is Not Null And CONT_PLAN.subcuenta<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subcuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+:nuevo+cont_plan.cuenta, CONT_PLAN.grupo = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.cuenta Is Not Null And CONT_PLAN.cuenta<>'' and (subcuenta is null or subcuenta='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Cuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+:nuevo, CONT_PLAN.grupo = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.grupo Is Not Null And CONT_PLAN.grupo<>'' and (cuenta is null or cuenta='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Grupo",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "cuenta"
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+:nuevo+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4+cont_plan.nivel5, CONT_PLAN.cuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel5 Is Not Null And CONT_PLAN.Nivel5<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+:nuevo+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4, CONT_PLAN.cuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel4 Is Not Null And CONT_PLAN.Nivel4<>'' and (nivel5 is null or nivel5='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+:nuevo+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3, CONT_PLAN.cuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel3 Is Not Null And CONT_PLAN.Nivel3<>'' and (nivel4 is null or nivel4='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+:nuevo+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2, CONT_PLAN.cuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel2 Is Not Null And CONT_PLAN.Nivel2<>'' and (nivel3 is null or nivel3='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+:nuevo+cont_plan.subcuenta+cont_plan.nivel1, CONT_PLAN.cuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel1 Is Not Null And CONT_PLAN.Nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+:nuevo+cont_plan.subcuenta, CONT_PLAN.cuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.subcuenta Is Not Null And CONT_PLAN.subcuenta<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subcuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+:nuevo, CONT_PLAN.cuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.cuenta Is Not Null And CONT_PLAN.cuenta<>'' and (subcuenta is null or subcuenta='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Cuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "subcuenta"
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+:nuevo+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4+cont_plan.nivel5, CONT_PLAN.subcuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel5 Is Not Null And CONT_PLAN.Nivel5<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+:nuevo+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4, CONT_PLAN.subcuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel4 Is Not Null And CONT_PLAN.Nivel4<>'' and (nivel5 is null or nivel5='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+:nuevo+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3, CONT_PLAN.subcuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel3 Is Not Null And CONT_PLAN.Nivel3<>'' and (nivel4 is null or nivel4='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+:nuevo+cont_plan.nivel1+cont_plan.nivel2, CONT_PLAN.subcuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel2 Is Not Null And CONT_PLAN.Nivel2<>'' and (nivel3 is null or nivel3='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+:nuevo+cont_plan.nivel1, CONT_PLAN.subcuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel1 Is Not Null And CONT_PLAN.Nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+:nuevo, CONT_PLAN.subcuenta = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.subcuenta Is Not Null And CONT_PLAN.subcuenta<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subcuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "nivel1"
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+:nuevo+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4+cont_plan.nivel5, CONT_PLAN.nivel1 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel5 Is Not Null And CONT_PLAN.Nivel5<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+:nuevo+cont_plan.nivel2+cont_plan.nivel3+cont_plan.nivel4, CONT_PLAN.nivel1 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel4 Is Not Null And CONT_PLAN.Nivel4<>'' and (nivel5 is null or nivel5='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+:nuevo+cont_plan.nivel2+cont_plan.nivel3, CONT_PLAN.nivel1 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel3 Is Not Null And CONT_PLAN.Nivel3<>'' and (nivel4 is null or nivel4='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+:nuevo+cont_plan.nivel2, CONT_PLAN.nivel1 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel2 Is Not Null And CONT_PLAN.Nivel2<>'' and (nivel3 is null or nivel3='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+:nuevo, CONT_PLAN.nivel1 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel1 Is Not Null And CONT_PLAN.Nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "nivel2"
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+:nuevo+cont_plan.nivel3+cont_plan.nivel4+cont_plan.nivel5, CONT_PLAN.nivel2 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel5 Is Not Null And CONT_PLAN.Nivel5<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+:nuevo+cont_plan.nivel3+cont_plan.nivel4, CONT_PLAN.nivel2 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel4 Is Not Null And CONT_PLAN.Nivel4<>'' and (nivel5 is null or nivel5='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+:nuevo+cont_plan.nivel3, CONT_PLAN.nivel2 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel3 Is Not Null And CONT_PLAN.Nivel3<>'' and (nivel4 is null or nivel4='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+:nuevo, CONT_PLAN.nivel2 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel2 Is Not Null And CONT_PLAN.Nivel2<>'' and (nivel3 is null or nivel3='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "nivel3"
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+:nuevo+cont_plan.nivel4+cont_plan.nivel5, CONT_PLAN.nivel3 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel5 Is Not Null And CONT_PLAN.Nivel5<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+:nuevo+cont_plan.nivel4, CONT_PLAN.nivel3 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel4 Is Not Null And CONT_PLAN.Nivel4<>'' and (nivel5 is null or nivel5='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+:nuevo, CONT_PLAN.nivel3 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel3 Is Not Null And CONT_PLAN.Nivel3<>'' and (nivel4 is null or nivel4='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "nivel4"
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+:nuevo+cont_plan.nivel5, CONT_PLAN.nivel4 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel5 Is Not Null And CONT_PLAN.Nivel5<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CONT_PLAN.CodTotal = cont_plan.mayor+cont_plan.grupo+cont_plan.cuenta+cont_plan.subcuenta+cont_plan.nivel1+cont_plan.nivel2+cont_plan.nivel3+:nuevo, CONT_PLAN.nivel4 = :nuevo
		WHERE CONT_PLAN.CodTotal Like :pedazo_ante AND CONT_PLAN.Nivel4 Is Not Null And CONT_PLAN.Nivel4<>'' and (nivel5 is null or nivel5='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
end choose
commit;
return 1
end function

public function integer grabar ();if i_cam_n2 then
	if tab_1.tabp_3.dw_n2.update()=-1 then
		rollback;
		return -1
	end if
end if
if i_cam_n1 then
	if tab_1.tabp_3.dw_n1.update()=-1 then
		rollback;
		return -1
	end if
end if
if i_cam_subcta then
	if tab_1.tabp_3.dw_subcta.update()=-1 then
		rollback;
		return -1
	end if
end if
if i_cam_cuenta then
	if tab_1.tabp_2.dw_cuenta.update()=-1 then
		rollback;
		return -1
	end if
end if
if i_cam_grupo then
	if tab_1.tabp_2.dw_grupo.update()=-1 then
		rollback;
		return -1
	end if
end if
if i_cam_mayor then
	if tab_1.tabp_2.dw_mayor.update()=-1 then
		rollback;
		return -1
	end if
end if
if i_cam_gral then
	if tab_1.tabp_1.dw_2.update()=-1 then
		rollback;
		return -1
	end if
end if
commit;
i_cam_n2=false
i_cam_n1=false
i_cam_subcta=false
i_cam_cuenta=false
i_cam_grupo=false
i_cam_mayor=false
i_cam_gral=false
cambio=false
return 1
end function

public function integer f_itemchanged (datawindow esta, datawindow hija, string data);long fila
fila=esta.getrow()
if fila<0 then return 0
string actual, column,nulo
setnull(nulo)
column=esta.getcolumnname()
choose case column
	case "ggrupo","psubgr","subgr","clase","clase1","clase2"
		actual=esta.getitemstring(fila,column)
		if esta.find(column+"='"+esta.gettext()+"'",1,esta.rowcount())>0 then
			esta.setitem(fila,column,actual)
			return -1
		end if
		if not isnull(hija) then
			if hija.rowcount()>0 then
				choose case messagebox("Atención","Esta cuenta tiene cuentas dependientes, desea cambiarlas tambien?",question!,yesno!,2)
					case 1
						if f_actu_cuenta(column,esta.gettext(),esta.getitemstring(fila,"codigo"))=1 then
							sle_1.text=esta.gettext()
							dw_1.triggerevent(itemchanged!)
							filtrar_1(1)
							tab_1.selectedtab=1
							return 0
						else
							esta.setitem(fila,column,actual)
							return -1
						end if
					case 2
						esta.setitem(fila,column,actual)
						return -1
				end choose
			end if
		end if
		string cod_new
		esta.accepttext()
		choose case column
			case "ggrupo"
				cod_new=esta.getitemstring(fila,column)
			case "psubgr"
				cod_new=esta.getitemstring(fila,"ggrupo")+esta.getitemstring(fila,"psubgr")
			case "subgr"
				cod_new=esta.getitemstring(fila,"ggrupo")+esta.getitemstring(fila,"psubgr")+esta.getitemstring(fila,"subgr")
			case "clase"
				cod_new=esta.getitemstring(fila,"ggrupo")+esta.getitemstring(fila,"psubgr")+esta.getitemstring(fila,"subgr")+esta.getitemstring(fila,"clase")
			case "clase1"
				cod_new=esta.getitemstring(fila,"ggrupo")+esta.getitemstring(fila,"psubgr")+esta.getitemstring(fila,"subgr")+esta.getitemstring(fila,"clase")+esta.getitemstring(fila,"clase1")
			case "clase2"
				cod_new=esta.getitemstring(fila,"ggrupo")+esta.getitemstring(fila,"psubgr")+esta.getitemstring(fila,"subgr")+esta.getitemstring(fila,"clase")+esta.getitemstring(fila,"clase1")+esta.getitemstring(fila,"clase2")
		end choose
		esta.setitem(fila,"codigo",cod_new)
 		esta.setitem(fila,"todo",cod_new+i_vocup)
	case "agrupa"
		actual=esta.getitemstring(fila,"agrupa")
		if not isnull(hija) then
			if hija.rowcount()>0  and actual='0' then 
				esta.setitem(fila,"agrupa",actual)
				return -1
			end if
		end if
	case else
		esta.accepttext()
end choose
return 1
end function

on w_ocupaciones.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_2=create st_2
this.tab_1=create tab_1
this.dw_1=create dw_1
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.st_3
end on

on w_ocupaciones.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.tab_1)
destroy(this.dw_1)
destroy(this.st_3)
end on

type pb_grabar from w_center`pb_grabar within w_ocupaciones
integer x = 4229
integer y = 116
integer taborder = 40
integer textsize = -8
string facename = "Tahoma"
string powertiptext = "Guardar Cambios [Alt+G]"
end type

event pb_grabar::clicked;call super::clicked;tab_1.tabp_3.dw_n2.accepttext()
tab_1.tabp_3.dw_n1.accepttext()
tab_1.tabp_3.dw_subcta.accepttext()
tab_1.tabp_2.dw_cuenta.accepttext()
tab_1.tabp_2.dw_grupo.accepttext()
tab_1.tabp_2.dw_mayor.accepttext()
tab_1.tabp_1.dw_2.accepttext()
if i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta or i_cam_grupo or i_cam_mayor or i_cam_gral then
	long fil_gral,fil_may,fil_gru,fil_cue,fil_sub,fil_ni1,fil_ni2,fil_ni3,fil_ni4,fil_ni5
	fil_gral=tab_1.tabp_1.dw_2.getrow()
	fil_may=tab_1.tabp_2.dw_mayor.getrow()
	fil_gru=tab_1.tabp_2.dw_grupo.getrow()
	fil_cue=tab_1.tabp_2.dw_cuenta.getrow()
	fil_sub=tab_1.tabp_3.dw_subcta.getrow()
	fil_ni1=tab_1.tabp_3.dw_n1.getrow()
	fil_ni2=tab_1.tabp_3.dw_n2.getrow()
	tab_1.tabp_1.dw_2.setredraw(false)
	tab_1.tabp_2.dw_mayor.setredraw(false)
	tab_1.tabp_2.dw_grupo.setredraw(false)
	tab_1.tabp_2.dw_cuenta.setredraw(false)
	tab_1.tabp_3.dw_subcta.setredraw(false)
	tab_1.tabp_3.dw_n1.setredraw(false)
	tab_1.tabp_3.dw_n2.setredraw(false)
	if grabar()=1 then dw_1.triggerevent(itemchanged!)
	if fil_gral>0 then tab_1.tabp_1.dw_2.scrolltorow(fil_gral)
	if fil_may>0 then tab_1.tabp_2.dw_mayor.scrolltorow(fil_may)
	if fil_gru>0 then tab_1.tabp_2.dw_grupo.scrolltorow(fil_gru)
	if fil_cue>0 then tab_1.tabp_2.dw_cuenta.scrolltorow(fil_cue)
	if fil_sub>0 then tab_1.tabp_3.dw_subcta.scrolltorow(fil_sub)
	if fil_ni1>0 then tab_1.tabp_3.dw_n1.scrolltorow(fil_ni1)
	if fil_ni2>0 then tab_1.tabp_3.dw_n2.scrolltorow(fil_ni2)
	tab_1.tabp_1.dw_2.setredraw(true)
	tab_1.tabp_2.dw_mayor.setredraw(true)
	tab_1.tabp_2.dw_grupo.setredraw(true)
	tab_1.tabp_2.dw_cuenta.setredraw(true)
	tab_1.tabp_3.dw_subcta.setredraw(true)
	tab_1.tabp_3.dw_n1.setredraw(true)
	tab_1.tabp_3.dw_n2.setredraw(true)
end if
end event

type sle_1 from singlelineedit within w_ocupaciones
event teclear pbm_keyup
integer x = 1326
integer y = 76
integer width = 402
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar_1(1)
end event

type st_2 from statictext within w_ocupaciones
integer x = 1330
integer y = 12
integer width = 279
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por:"
boolean focusrectangle = false
end type

type tab_1 from tab within w_ocupaciones
event create ( )
event destroy ( )
integer x = 18
integer y = 164
integer width = 4485
integer height = 2016
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabp_1 tabp_1
tabp_2 tabp_2
tabp_3 tabp_3
end type

on tab_1.create
this.tabp_1=create tabp_1
this.tabp_2=create tabp_2
this.tabp_3=create tabp_3
this.Control[]={this.tabp_1,&
this.tabp_2,&
this.tabp_3}
end on

on tab_1.destroy
destroy(this.tabp_1)
destroy(this.tabp_2)
destroy(this.tabp_3)
end on

type tabp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4448
integer height = 1888
long backcolor = 67108864
string text = "Ocupaciones"
long tabtextcolor = 33554432
string picturename = "ocupacion.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra todas las Ocupaciomes"
pb_import pb_import
pb_export pb_export
dw_2 dw_2
st_regi st_regi
st_cuenta st_cuenta
st_nat st_nat
st_mvto st_mvto
st_1 st_1
end type

on tabp_1.create
this.pb_import=create pb_import
this.pb_export=create pb_export
this.dw_2=create dw_2
this.st_regi=create st_regi
this.st_cuenta=create st_cuenta
this.st_nat=create st_nat
this.st_mvto=create st_mvto
this.st_1=create st_1
this.Control[]={this.pb_import,&
this.pb_export,&
this.dw_2,&
this.st_regi,&
this.st_cuenta,&
this.st_nat,&
this.st_mvto,&
this.st_1}
end on

on tabp_1.destroy
destroy(this.pb_import)
destroy(this.pb_export)
destroy(this.dw_2)
destroy(this.st_regi)
destroy(this.st_cuenta)
destroy(this.st_nat)
destroy(this.st_mvto)
destroy(this.st_1)
end on

type pb_import from picturebutton within tabp_1
event mousemove pbm_mousemove
integer x = 2834
integer width = 146
integer height = 128
integer taborder = 12
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "import.gif"
string disabledname = "d_import.gif"
string powertiptext = "Importar Plan desde Archivo separado por TAB´s"
end type

event clicked;string docname, named
long value,cuantas_f
value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
cuantas_f=dw_2.rowcount()
IF value = 1 THEN
	value=dw_2.importfile(docname)
	if value < 0 then 
		messagebox("Error "+string(value),"No se pudieron importar los datos")
		return
	end if
end if
if dw_2.rowcount()<>cuantas_f then
	cambio=true
	i_cam_gral=true
	string mayor,grupo,cuenta,subcta,n1,n2,n3,n4,n5,toda
	for value=cuantas_f +1 to dw_2.rowcount()
		mayor=dw_2.getitemstring(value,"mayor")
		if isnull(mayor) then mayor =''
		grupo=dw_2.getitemstring(value,"grupo")
		if isnull(grupo) then grupo =''
		cuenta=dw_2.getitemstring(value,"cuenta")
		if isnull(cuenta) then cuenta =''
		subcta=dw_2.getitemstring(value,"subcuenta")
		if isnull(subcta) then subcta =''
		n1=dw_2.getitemstring(value,"nivel1")
		if isnull(n1) then n1 =''
		n2=dw_2.getitemstring(value,"nivel2")
		if isnull(n2) then n2 =''
		n3=dw_2.getitemstring(value,"nivel3")
		if isnull(n3) then n3 =''
		n4=dw_2.getitemstring(value,"nivel4")
		if isnull(n4) then n4 =''
		n5=dw_2.getitemstring(value,"nivel5")
		if isnull(n5) then n5 =''
		toda=mayor+grupo+cuenta+subcta+n1+n2+n3+n4+n5
		dw_2.setitem(value,"codtotal",toda)
	next
end if

end event

type pb_export from picturebutton within tabp_1
event mousemove pbm_mousemove
integer x = 2670
integer width = 146
integer height = 128
integer taborder = 11
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "export.gif"
string disabledname = "d_export.gif"
string powertiptext = "Exportar Plan"
end type

event clicked;openwithparm(w_export,dw_2)
end event

type dw_2 from datawindow within tabp_1
event keyup pbm_dwnkey
integer y = 128
integer width = 4334
integer height = 1732
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ocupaciones"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;if row<1 then return
string nulo
setnull(nulo)
i_cam_gral=true
cambio=true
end event

event doubleclicked;long fila
fila=getrow()
if fila<1 then return
string mayor,grupo,cuenta,subcta,niv1,niv2
long donde,llego
mayor=getitemstring(fila,"ggrupo")
grupo=getitemstring(fila,"psubgr")
cuenta=getitemstring(fila,"subgr")
subcta=getitemstring(fila,"clase")
niv1=getitemstring(fila,"clase1")
niv2=getitemstring(fila,"clase2")
donde=tab_1.tabp_2.dw_mayor.find("ggrupo='"+mayor+"'",1,tab_1.tabp_2.dw_mayor.rowcount())
if donde<>tab_1.tabp_2.dw_mayor.getrow() then tab_1.tabp_2.dw_mayor.scrolltorow(donde)
llego=1
if grupo<>"" then
	donde=tab_1.tabp_2.dw_grupo.find("ggrupo='"+mayor+"' and psubgr='"+grupo+"'",1,tab_1.tabp_2.dw_grupo.rowcount())
	if donde<>tab_1.tabp_2.dw_grupo.getrow() then tab_1.tabp_2.dw_grupo.scrolltorow(donde)
	llego=2
end if
if cuenta<>"" then
	donde=tab_1.tabp_2.dw_cuenta.find("ggrupo='"+mayor+"' and psubgr='"+grupo+"' and subgr='"+cuenta+"'",1,tab_1.tabp_2.dw_cuenta.rowcount())
	if donde<>tab_1.tabp_2.dw_cuenta.getrow() then tab_1.tabp_2.dw_cuenta.scrolltorow(donde)
	llego=3
end if
if subcta<>"" then
	donde=tab_1.tabp_3.dw_subcta.find("ggrupo='"+mayor+"' and psubgr='"+grupo+"' and subgr='"+cuenta+"' and clase='"+subcta+"'",1,tab_1.tabp_3.dw_subcta.rowcount())
	if donde<>tab_1.tabp_3.dw_subcta.getrow() then tab_1.tabp_3.dw_subcta.scrolltorow(donde)
	llego=4
end if
if niv1<>"" then
	donde=tab_1.tabp_3.dw_n1.find("ggrupo='"+mayor+"' and psubgr='"+grupo+"' and subgr='"+cuenta+"' and clase='"+subcta+"' and clase1='"+niv1+"'",1,tab_1.tabp_3.dw_n1.rowcount())
	if donde<>tab_1.tabp_3.dw_n1.getrow() then tab_1.tabp_3.dw_n1.scrolltorow(donde)
	llego=5
end if
if niv2<>"" then
	donde=tab_1.tabp_3.dw_n2.find("ggrupo='"+mayor+"' and psubgr='"+grupo+"' and subgr='"+cuenta+"' and clase='"+subcta+"' and clase1='"+niv1+"' and clase2='"+niv2+"'",1,tab_1.tabp_3.dw_n2.rowcount())
	if donde<>tab_1.tabp_3.dw_n2.getrow() then tab_1.tabp_3.dw_n2.scrolltorow(donde)
	llego=6
end if
choose case llego
	case 1
		tab_1.selectedtab=2
		tab_1.tabp_2.dw_mayor.setfocus()
	case 2
		tab_1.selectedtab=2
		tab_1.tabp_2.dw_grupo.setfocus()
	case 3
		tab_1.selectedtab=2
		tab_1.tabp_2.dw_cuenta.setfocus()
	case 4
		tab_1.selectedtab=3
		tab_1.tabp_3.dw_subcta.setfocus()
	case 5
		tab_1.selectedtab=3
		tab_1.tabp_3.dw_n1.setfocus()
	case 6
		tab_1.selectedtab=3
		tab_1.tabp_3.dw_n2.setfocus()
end choose
end event

event itemchanged;accepttext()
cambio=true
i_cam_gral=true

end event

event rbuttondown;long fila
fila=getrow()
if dwo.type<>"column" and dwo.type<>"compute" and dwo.type<>"datawindow" then return
if dwo.type<>"datawindow" then 
	if row<>getrow() then scrolltorow(row)
	fila=row
	if getcolumnname()<>dwo.name then setcolumn(string(dwo.name))
end if
CHOOSE CASE getcolumnname()
	CASE "ggrupo"
		sle_1.text=getitemstring(fila,"ggrupo")
		filtro="lower(codigo) like '"+lower(trim(sle_1.text))+"%'"
	case "psubgrp"
		sle_1.text=getitemstring(fila,"ggrupo")+getitemstring(getrow(),"psubgrp")
		filtro="lower(codigo) like '"+lower(trim(sle_1.text))+"%'"
	case "subgrp"
		sle_1.text=getitemstring(fila,"ggrupo")+getitemstring(getrow(),"psubgrp")+getitemstring(getrow(),"subgrp")
		filtro="lower(codigo) like '"+lower(trim(sle_1.text))+"%'"
	case "cuenta"
		sle_1.text=getitemstring(fila,"ggrupo")+getitemstring(getrow(),"psubgrp")+getitemstring(getrow(),"subgrp")+getitemstring(fila,"cuenta")
		filtro="lower(codigo) like '"+lower(trim(sle_1.text))+"%'"
	case "nivel1"
		sle_1.text=getitemstring(fila,"ggrupo")+getitemstring(getrow(),"psubgrp")+getitemstring(getrow(),"subgrp")+getitemstring(fila,"cuenta")+getitemstring(fila,"nivel1")
		filtro="lower(codigo) like '"+lower(trim(sle_1.text))+"%'"
	case "nivel2"
		sle_1.text=getitemstring(fila,"ggrupo")+getitemstring(getrow(),"psubgrp")+getitemstring(getrow(),"subgrp")+getitemstring(fila,"cuenta")+getitemstring(fila,"nivel1")+getitemstring(fila,"nivel2")
		filtro="lower(codigo) like '"+lower(trim(sle_1.text))+"%'"
	case else
		if isnull(dwo) then return
		st_dw_xa_funciones st
		st.dw=this
		st.dwo=dwo
		st.row=row
		openwithparm(w_funcion_dw,st)
END CHOOSE
end event

event rowfocuschanged;long fila
fila=getrow()
if fila<=0 then return
st_cuenta.text=getitemstring(fila,"des_ocup")
st_regi.text=getitemstring(fila,"codigo")
if getitemstring(fila,"agrupa")="1" then
	st_mvto.text="Agrupa."
else
	st_mvto.text="NO Agrupa."
end if
st_1.text="Reg. "+string(fila)+" de "+string(rowcount())
end event

event itemfocuschanged;f_semovio(this,i_vocup,{"cta_ajuste" ,"cta_cpartida"  })


end event

event getfocus;f_semovio(this,i_vocup,{"cta_ajuste" ,"cta_cpartida" })

end event

event constructor;settransobject(sqlca)


end event

type st_regi from statictext within tabp_1
integer x = 5
integer y = 28
integer width = 357
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_cuenta from statictext within tabp_1
integer x = 366
integer y = 28
integer width = 1605
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_nat from statictext within tabp_1
integer x = 1975
integer y = 28
integer width = 233
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_mvto from statictext within tabp_1
integer x = 2213
integer y = 28
integer width = 439
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within tabp_1
integer x = 3003
integer y = 28
integer width = 507
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type tabp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4448
integer height = 1888
long backcolor = 67108864
string text = "Grupos / PSubrupo  / Primarios"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las cuentas Mayor , Grupo y Cuenta"
pb_del_cta pb_del_cta
pb_new_cuenta pb_new_cuenta
pb_del_grupo pb_del_grupo
pb_new_grupo pb_new_grupo
pb_del_mayor pb_del_mayor
pb_new_mayor pb_new_mayor
dw_cuenta dw_cuenta
dw_grupo dw_grupo
dw_mayor dw_mayor
end type

on tabp_2.create
this.pb_del_cta=create pb_del_cta
this.pb_new_cuenta=create pb_new_cuenta
this.pb_del_grupo=create pb_del_grupo
this.pb_new_grupo=create pb_new_grupo
this.pb_del_mayor=create pb_del_mayor
this.pb_new_mayor=create pb_new_mayor
this.dw_cuenta=create dw_cuenta
this.dw_grupo=create dw_grupo
this.dw_mayor=create dw_mayor
this.Control[]={this.pb_del_cta,&
this.pb_new_cuenta,&
this.pb_del_grupo,&
this.pb_new_grupo,&
this.pb_del_mayor,&
this.pb_new_mayor,&
this.dw_cuenta,&
this.dw_grupo,&
this.dw_mayor}
end on

on tabp_2.destroy
destroy(this.pb_del_cta)
destroy(this.pb_new_cuenta)
destroy(this.pb_del_grupo)
destroy(this.pb_new_grupo)
destroy(this.pb_del_mayor)
destroy(this.pb_new_mayor)
destroy(this.dw_cuenta)
destroy(this.dw_grupo)
destroy(this.dw_mayor)
end on

type pb_del_cta from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 4251
integer y = 1324
integer width = 146
integer height = 128
integer taborder = 9
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Cuenta"
end type

event clicked;if tab_1.tabp_3.dw_subcta.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee subcuentas")
	return
else
	if dw_cuenta.rowcount()>0 then
		dw_cuenta.deleterow(0)
		cambio=true
		i_cam_cuenta=true
	end if
end if
end event

type pb_new_cuenta from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 4247
integer y = 548
integer width = 146
integer height = 128
integer taborder = 5
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva Cuenta de Grupo"
end type

event clicked;if f_new(dw_grupo,dw_mayor,2) = -1 then return
cambio=true 
i_cam_grupo=true
end event

type pb_del_grupo from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 4247
integer y = 696
integer width = 146
integer height = 128
integer taborder = 6
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Grupo"
end type

event clicked;if tab_1.tabp_3.dw_subcta.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee subcuentas")
	return
else
	if dw_cuenta.rowcount()>0 then
		dw_cuenta.deleterow(0)
		cambio=true
		i_cam_grupo=true
	end if
end if
end event

type pb_new_grupo from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 4251
integer y = 1180
integer width = 146
integer height = 128
integer taborder = 8
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva Cuenta"
end type

event clicked;if f_new(dw_cuenta,dw_grupo,3) = -1 then return
i_cam_cuenta=true
cambio=true
end event

type pb_del_mayor from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 4247
integer y = 176
integer width = 146
integer height = 128
integer taborder = 3
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Cuenta Mayor"
end type

event clicked;if dw_grupo.rowcount()>0 then
	messagebox("Atención","Esta cuenta no se puede borrar ya que posee grupos")
	return
else
	if dw_mayor.rowcount()>0 then
		dw_mayor.deleterow(0)
		cambio=true
		i_cam_mayor=true
	end if
end if
end event

type pb_new_mayor from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 4251
integer y = 36
integer width = 146
integer height = 128
integer taborder = 2
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva Cuenta Mayor"
end type

event clicked;if i_vocup="" or isnull(i_vocup) then return
dw_mayor.scrolltorow(dw_mayor.insertrow(0))
dw_mayor.setitem(dw_mayor.getrow(),"version",i_vocup)
dw_mayor.setcolumn("mayor")
dw_mayor.setfocus()
cambio=true
i_cam_mayor=true
end event

type dw_cuenta from datawindow within tabp_2
event keyup pbm_dwnkey
integer x = 9
integer y = 1164
integer width = 4201
integer height = 676
integer taborder = 7
boolean bringtotop = true
string dataobject = "dw_subgro_ocupaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)

end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
if fila<1 then return
tab_1.tabp_3.dw_subcta.retrieve(i_vocup,getitemstring(fila,"ggrupo"),getitemstring(fila,"psubgr"),getitemstring(fila,"subgr"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,tab_1.tabp_3.dw_subcta,data)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_cuenta=true
end choose
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_cuenta=true
cambio=true
end event

event rowfocuschanging;string cambios=''
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_subcta then cambios+="-Subcuentas~r~n"
if i_cam_cuenta then cambios+="-Nivel de Cuentas~r~n"
if i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n2=false
			i_cam_n1=false
			i_cam_subcta=false
			i_cam_cuenta=false
			if not i_cam_gral and not i_cam_mayor and not i_cam_grupo then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

type dw_grupo from datawindow within tabp_2
event keyup pbm_dwnkey
integer x = 5
integer y = 540
integer width = 4201
integer height = 588
integer taborder = 4
string dataobject = "dw_psubgro_ocupaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)


end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
dw_cuenta.reset()
if fila<1 then return
dw_cuenta.retrieve(i_vocup,getitemstring(fila,"ggrupo"),getitemstring(fila,"psubgr"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_cuenta,data)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_grupo=true
end choose

end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_grupo=true
cambio=true
end event

event rowfocuschanging;string cambios=''
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_subcta then cambios+="-Subcuentas~r~n"
if i_cam_cuenta then cambios+="-Nivel de Cuentas~r~n"
if i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n2=false
			i_cam_n1=false
			i_cam_subcta=false
			i_cam_cuenta=false
			if not i_cam_gral and not i_cam_mayor and not i_cam_grupo then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

type dw_mayor from datawindow within tabp_2
event keyup pbm_dwnkey
integer y = 32
integer width = 4201
integer height = 460
integer taborder = 1
string dataobject = "dw_ggrupo_ocupaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;long fila
fila=getrow()
dw_cuenta.reset()
dw_grupo.reset()
if fila<1 then return
dw_grupo.retrieve(i_vocup,getitemstring(fila,"ggrupo"))
end event

event retrieveend;this.sort()
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_grupo,data)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_mayor=true
end choose
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_mayor=true
cambio=true
end event

event rowfocuschanging;string cambios=''
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_subcta then cambios+="-Subcuentas~r~n"
if i_cam_cuenta then cambios+="-Nivel de Cuentas~r~n"
if i_cam_grupo then cambios+="-Grupo~r~n"
if i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta or i_cam_grupo then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n2=false
			i_cam_n1=false
			i_cam_subcta=false
			i_cam_cuenta=false
			i_cam_grupo=false
			if not i_cam_gral and not i_cam_mayor then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

type tabp_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4448
integer height = 1888
long backcolor = 67108864
string text = "Agrupación"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
pb_new_subcta pb_new_subcta
pb_del_subcta pb_del_subcta
pb_new_n1 pb_new_n1
pb_del_n1 pb_del_n1
pb_new_n2 pb_new_n2
pb_del_n2 pb_del_n2
dw_n2 dw_n2
dw_n1 dw_n1
dw_subcta dw_subcta
end type

on tabp_3.create
this.pb_new_subcta=create pb_new_subcta
this.pb_del_subcta=create pb_del_subcta
this.pb_new_n1=create pb_new_n1
this.pb_del_n1=create pb_del_n1
this.pb_new_n2=create pb_new_n2
this.pb_del_n2=create pb_del_n2
this.dw_n2=create dw_n2
this.dw_n1=create dw_n1
this.dw_subcta=create dw_subcta
this.Control[]={this.pb_new_subcta,&
this.pb_del_subcta,&
this.pb_new_n1,&
this.pb_del_n1,&
this.pb_new_n2,&
this.pb_del_n2,&
this.dw_n2,&
this.dw_n1,&
this.dw_subcta}
end on

on tabp_3.destroy
destroy(this.pb_new_subcta)
destroy(this.pb_del_subcta)
destroy(this.pb_new_n1)
destroy(this.pb_del_n1)
destroy(this.pb_new_n2)
destroy(this.pb_del_n2)
destroy(this.dw_n2)
destroy(this.dw_n1)
destroy(this.dw_subcta)
end on

type pb_new_subcta from picturebutton within tabp_3
event mousemove pbm_mousemove
integer x = 4219
integer y = 24
integer width = 151
integer height = 132
integer taborder = 12
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva SubCuenta"
end type

event clicked;if f_new(dw_subcta,tab_1.tabp_2.dw_cuenta,4) = -1 then return
i_cam_subcta=true
cambio=true
end event

type pb_del_subcta from picturebutton within tabp_3
event mousemove pbm_mousemove
integer x = 4219
integer y = 172
integer width = 151
integer height = 132
integer taborder = 13
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar SubCuenta"
end type

event clicked;//if tab_1.tabp_3.dw_n1.rowcount()>0 then
//	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 1")
//	return
//else
//	if dw_subcta.rowcount()>0 then
//		dw_subcta.deleterow(0)
//		cambio=true
//		i_cam_subcta=true
//	end if
//end if
end event

type pb_new_n1 from picturebutton within tabp_3
event mousemove pbm_mousemove
boolean visible = false
integer x = 4229
integer y = 536
integer width = 151
integer height = 132
integer taborder = 15
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva Cuenta de Nivel 1"
end type

event clicked;if f_new(dw_n1,dw_subcta,5) = -1 then return
i_cam_n1=true
cambio=true
end event

type pb_del_n1 from picturebutton within tabp_3
event mousemove pbm_mousemove
boolean visible = false
integer x = 4229
integer y = 684
integer width = 151
integer height = 132
integer taborder = 16
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Cuenta de Nivel 1"
end type

event clicked;//if tab_1.tabp_3.dw_n2.rowcount()>0 then
//	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 2")
//	return
//else
//	if dw_n1.rowcount()>0 then
//		dw_n1.deleterow(0)
//		cambio=true
//		i_cam_n1=true
//	end if
//end if
end event

type pb_new_n2 from picturebutton within tabp_3
event mousemove pbm_mousemove
boolean visible = false
integer x = 4229
integer y = 1068
integer width = 151
integer height = 132
integer taborder = 18
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva Cuenta de Nivel 2"
end type

event clicked;if f_new(dw_n2,dw_n1,6) = -1 then return
i_cam_n2=true
cambio=true
end event

type pb_del_n2 from picturebutton within tabp_3
event mousemove pbm_mousemove
boolean visible = false
integer x = 4229
integer y = 1212
integer width = 151
integer height = 132
integer taborder = 19
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Cuenta de Nivel 2"
end type

event clicked;//if tab_1.tabp_4.dw_n3.rowcount()>0 then
//	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 3")
//	return
//else
//	if dw_n2.rowcount()>0 then
//		dw_n2.deleterow(0)
//		cambio=true
//		i_cam_n2=true
//	end if
//end if
end event

type dw_n2 from datawindow within tabp_3
event keyup pbm_dwnkey
boolean visible = false
integer y = 1060
integer width = 4174
integer height = 500
integer taborder = 17
string title = "none"
string dataobject = "dw_n2_ocupaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_n2=true
cambio=true
end event

event constructor;settransobject(sqlca)

end event

event getfocus;f_getfocus(this)
end event

event itemchanged;datawindow dwnull
setnull(dwnull)
choose case f_itemchanged(this,dwnull,data)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_n2=true
end choose
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
if fila<1 then return
end event

event rowfocuschanging;string cambios=''
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_subcta then cambios+="-Subcuentas~r~n"
if i_cam_cuenta then cambios+="-Nivel de Cuentas~r~n"
if i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n2=false
			i_cam_n1=false
			i_cam_subcta=false
			i_cam_cuenta=false
			if not i_cam_gral and not i_cam_mayor and not i_cam_grupo then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

type dw_n1 from datawindow within tabp_3
event keyup pbm_dwnkey
boolean visible = false
integer y = 532
integer width = 4169
integer height = 500
integer taborder = 14
string title = "none"
string dataobject = "dw_n1_ocupaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_n1=true
cambio=true
end event

event constructor;settransobject(sqlca)


end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n2,data)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_n1=true
end choose

end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
dw_n2.reset()
if fila<1 then return
tab_1.tabp_3.dw_n2.retrieve(i_vocup,getitemstring(fila,"ggrupo"),getitemstring(fila,"psubgr"),getitemstring(fila,"subgr"),getitemstring(fila,"clase"),getitemstring(fila,"clase1"))
end event

event rowfocuschanging;string cambios=''
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_subcta then cambios+="-Subcuentas~r~n"
if i_cam_cuenta then cambios+="-Nivel de Cuentas~r~n"
if i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n2=false
			i_cam_n1=false
			i_cam_subcta=false
			i_cam_cuenta=false
			if not i_cam_gral and not i_cam_mayor and not i_cam_grupo then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

type dw_subcta from datawindow within tabp_3
event keyup pbm_dwnkey
integer x = 9
integer y = 16
integer width = 4169
integer height = 500
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_cuenta_ocupaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_subcta=true
cambio=true
end event

event constructor;settransobject(sqlca)


end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n1,data)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_subcta=true
end choose

end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
dw_n1.reset()
dw_n2.reset()
if fila<1 then return
//tab_1.tabp_3.dw_n1.retrieve(i_vocup,getitemstring(fila,"ggrupo"),getitemstring(fila,"psubgr"),getitemstring(fila,"subgr"),getitemstring(fila,"clase"))
end event

event rowfocuschanging;string cambios=''
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_subcta then cambios+="-Subcuentas~r~n"
if i_cam_cuenta then cambios+="-Nivel de Cuentas~r~n"
if i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n2=false
			i_cam_n1=false
			i_cam_subcta=false
			i_cam_cuenta=false
			if not i_cam_gral and not i_cam_mayor and not i_cam_grupo then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

type dw_1 from datawindow within w_ocupaciones
integer x = 37
integer y = 64
integer width = 1179
integer height = 92
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_vocupacion"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(SQLCA)
insertrow(1)
end event

event itemchanged;call super::itemchanged;
this.accepttext()
i_vocup=this.getitemstring(1,1)
select count(codigo) into :cuantas from ocupaciones where version=:i_vocup;
tab_1.tabp_1.st_1.text=string(tab_1.tabp_1.dw_2.retrieve(i_vocup))+' Registros'
tab_1.tabp_2.dw_mayor.retrieve(i_vocup)
end event

type st_3 from statictext within w_ocupaciones
integer x = 59
integer y = 8
integer width = 279
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Versión"
boolean focusrectangle = false
end type

