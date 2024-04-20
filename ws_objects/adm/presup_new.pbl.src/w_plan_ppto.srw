$PBExportHeader$w_plan_ppto.srw
forward
global type w_plan_ppto from w_center
end type
type dw_1 from datawindow within w_plan_ppto
end type
type sle_1 from singlelineedit within w_plan_ppto
end type
type st_2 from statictext within w_plan_ppto
end type
type st_3 from statictext within w_plan_ppto
end type
type tab_1 from tab within w_plan_ppto
end type
type tabp_1 from userobject within tab_1
end type
type st_6 from statictext within tabp_1
end type
type em_3 from editmask within tabp_1
end type
type st_5 from statictext within tabp_1
end type
type st_4 from statictext within tabp_1
end type
type em_2 from editmask within tabp_1
end type
type em_1 from editmask within tabp_1
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
st_6 st_6
em_3 em_3
st_5 st_5
st_4 st_4
em_2 em_2
em_1 em_1
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
type pb_new_grupo from picturebutton within tabp_2
end type
type pb_del_grupo from picturebutton within tabp_2
end type
type pb_new_cta from picturebutton within tabp_2
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
pb_new_grupo pb_new_grupo
pb_del_grupo pb_del_grupo
pb_new_cta pb_new_cta
pb_del_mayor pb_del_mayor
pb_new_mayor pb_new_mayor
dw_cuenta dw_cuenta
dw_grupo dw_grupo
dw_mayor dw_mayor
end type
type tabp_3 from userobject within tab_1
end type
type pb_del_n2 from picturebutton within tabp_3
end type
type pb_new_n2 from picturebutton within tabp_3
end type
type pb_del_n1 from picturebutton within tabp_3
end type
type pb_new_n1 from picturebutton within tabp_3
end type
type pb_del_subcta from picturebutton within tabp_3
end type
type pb_new_subcta from picturebutton within tabp_3
end type
type dw_n2 from datawindow within tabp_3
end type
type dw_n1 from datawindow within tabp_3
end type
type dw_subcta from datawindow within tabp_3
end type
type tabp_3 from userobject within tab_1
pb_del_n2 pb_del_n2
pb_new_n2 pb_new_n2
pb_del_n1 pb_del_n1
pb_new_n1 pb_new_n1
pb_del_subcta pb_del_subcta
pb_new_subcta pb_new_subcta
dw_n2 dw_n2
dw_n1 dw_n1
dw_subcta dw_subcta
end type
type tabp_4 from userobject within tab_1
end type
type pb_del_n5 from picturebutton within tabp_4
end type
type pb_new_n5 from picturebutton within tabp_4
end type
type pb_del_n4 from picturebutton within tabp_4
end type
type pb_new_n4 from picturebutton within tabp_4
end type
type pb_del_n3 from picturebutton within tabp_4
end type
type pb_new_n3 from picturebutton within tabp_4
end type
type dw_n5 from datawindow within tabp_4
end type
type dw_n3 from datawindow within tabp_4
end type
type dw_n4 from datawindow within tabp_4
end type
type tabp_4 from userobject within tab_1
pb_del_n5 pb_del_n5
pb_new_n5 pb_new_n5
pb_del_n4 pb_del_n4
pb_new_n4 pb_new_n4
pb_del_n3 pb_del_n3
pb_new_n3 pb_new_n3
dw_n5 dw_n5
dw_n3 dw_n3
dw_n4 dw_n4
end type
type tabp_5 from userobject within tab_1
end type
type pb_del_n6 from picturebutton within tabp_5
end type
type pb_new_n6 from picturebutton within tabp_5
end type
type dw_n6 from datawindow within tabp_5
end type
type tabp_5 from userobject within tab_1
pb_del_n6 pb_del_n6
pb_new_n6 pb_new_n6
dw_n6 dw_n6
end type
type tab_1 from tab within w_plan_ppto
tabp_1 tabp_1
tabp_2 tabp_2
tabp_3 tabp_3
tabp_4 tabp_4
tabp_5 tabp_5
end type
type pb_1 from picturebutton within w_plan_ppto
end type
type dw_muestras from datawindow within w_plan_ppto
end type
type pb_abrir from picturebutton within w_plan_ppto
end type
end forward

global type w_plan_ppto from w_center
string tag = "Realizó Cambios en el Plan Presupuestal, desea guardarlos ?."
integer width = 5769
integer height = 2128
string title = "Presupuesto - Plan Presupuestal"
boolean resizable = false
windowtype windowtype = popup!
string icon = "plan.ico"
dw_1 dw_1
sle_1 sle_1
st_2 st_2
st_3 st_3
tab_1 tab_1
pb_1 pb_1
dw_muestras dw_muestras
pb_abrir pb_abrir
end type
global w_plan_ppto w_plan_ppto

type variables
m_pop_ppto menu
string filtro, i_codemp, estado, equ
boolean i_cam_mayor,i_cam_grupo,i_cam_cuenta,i_cam_subcta,i_cam_n1,i_cam_n2,i_cam_n3,i_cam_n4,i_cam_n5,i_cam_gral,i_cam_n6
long cuantas, vigencia
boolean abierto
end variables

forward prototypes
public subroutine filtrar_1 (integer digitar)
public function boolean f_buttonclicked (long row, datawindow dw)
public function integer f_new (datawindow esta, datawindow padre, integer nivel)
public function integer f_chequea (datawindow esta)
public function integer f_actu_cuenta (string nivel, string nuevo, string pedazo_ante)
public subroutine f_keyup (datawindow esta, keycode key)
public subroutine f_getfocus (datawindow esta)
public function integer grabar ()
public subroutine f_itemfocuschanged (string name_col, datawindow datawin)
public function integer f_itemchanged (datawindow esta, datawindow hija, datawindow padre)
public subroutine f_doubleclicked (string name_col, datawindow dw_obj)
public function integer f_rowfocuschanged (datawindow dw)
end prototypes

public subroutine filtrar_1 (integer digitar);CHOOSE CASE digitar
	case 0
		tab_1.tabp_1.dw_2.setfilter(filtro)
		tab_1.tabp_1.dw_2.filter()
		tab_1.tabp_1.dw_2.sort()
	case 1
		tab_1.tabp_1.dw_2.setfilter("lower(codtotal) like '"+lower(trim(sle_1.text))+"%'")
		tab_1.tabp_1.dw_2.filter()
		tab_1.tabp_1.dw_2.sort()
		digitar=0
	case 2
		sle_1.text=''
		tab_1.tabp_1.dw_2.setfilter("lower(codtotal) like '"+lower(trim(sle_1.text))+"%'")
		tab_1.tabp_1.dw_2.filter()
		tab_1.tabp_1.dw_2.sort()
		digitar=0						
END CHOOSE
tab_1.tabp_1.st_1.text=string(tab_1.tabp_1.dw_2.rowcount())+' Registros'
end subroutine

public function boolean f_buttonclicked (long row, datawindow dw);if row<1 or isnull(row) then return false
if isnull(dw.getitemstring(row,"rfuente")) then return false
string nulo
setnull(nulo)
dw.setitem(row,"rfuente",nulo)
return true

end function

public function integer f_new (datawindow esta, datawindow padre, integer nivel);long donde,donde_ant
string codtotal
donde_ant = padre.getrow()
if donde_ant < 1 then return -1
if padre.GetItemString(donde_ant,"movimiento")='1' then
	Messagebox("Atención","No se puede crear esta cuenta ya que su antecesor es de movimiento")
	return -1
end if
codtotal = ''
donde = esta.InsertRow(0)
if nivel>=10 then
	esta.SetItem(donde,"nivel2",padre.GetItemString(donde_ant,"nivel2"))
	codtotal = padre.GetItemString(donde_ant,"nivel2") + codtotal	
end if
if nivel>=9 then
	esta.SetItem(donde,"nivel1",padre.GetItemString(donde_ant,"nivel1"))
	codtotal = padre.GetItemString(donde_ant,"nivel1") + codtotal	
end if
if nivel>=8 then
	esta.SetItem(donde,"subordinal",padre.GetItemString(donde_ant,"subordinal"))
	codtotal = padre.GetItemString(donde_ant,"subordinal") + codtotal
end if
if nivel>=7 then
	esta.SetItem(donde,"subauxi",padre.GetItemString(donde_ant,"subauxi"))
	codtotal = padre.GetItemString(donde_ant,"subauxi") + codtotal
end if
if nivel>=6 then
	esta.SetItem(donde,"ordinal",padre.GetItemString(donde_ant,"ordinal"))
	codtotal = padre.GetItemString(donde_ant,"ordinal") + codtotal
end if
if nivel>=5 then
	esta.SetItem(donde,"auxiliar",padre.GetItemString(donde_ant,"auxiliar"))
	codtotal = padre.GetItemString(donde_ant,"auxiliar") + codtotal
end if
if nivel>=4 then
	esta.SetItem(donde,"mayor",padre.GetItemString(donde_ant,"mayor"))
	codtotal = padre.GetItemString(donde_ant,"mayor") + codtotal
end if
if nivel>=3 then
	esta.SetItem(donde,"subgrupo",padre.GetItemString(donde_ant,"subgrupo"))
	codtotal = padre.GetItemString(donde_ant,"subgrupo") + codtotal
end if
if nivel>=2 then
	esta.SetItem(donde,"grupo",padre.GetItemString(donde_ant,"grupo"))
	codtotal = padre.GetItemString(donde_ant,"grupo") + codtotal
end if
esta.ScrollToRow(donde)
if esta.rowcount() > 1 then
	long j
	for j = 12 to 15
		esta.SetItem(donde,j,esta.GetItemString(donde -1 ,j))
	next
//	for j = 16 to 21
//		esta.SetItem(donde,j,esta.GetItemNumber(donde -1 ,j))
//	next
	for j = 17 to 24
		esta.SetItem(donde,j,esta.GetItemString(donde -1 ,j))
	next
else
	esta.SetItem(donde,"cod_empresa",padre.GetItemString(donde_ant,"cod_empresa"))
end if

esta.SetItem(donde,"tipo",padre.GetItemString(donde_ant,"tipo"))
esta.SetItem(donde,"movimiento",padre.GetItemString(donde_ant,"movimiento"))
esta.SetItem(donde,"cod_vigencia",vigencia)
esta.SetItem(donde,"codtotal",codtotal)
esta.SetItem(donde,"nuevo",1)
esta.SetColumn(nivel + 2)
esta.SetFocus()
Return 1

end function

public function integer f_chequea (datawindow esta);//long j
//for j=1 to esta.rowcount()
//	if esta.getitemstring(j,"ajuste")='1' then
//		if isnull(esta.getitemstring(j,"cta_ajuste")) or trim(esta.getitemstring(j,"cta_ajuste"))='' or isnull(esta.getitemstring(j,"cta_cpartida")) or trim(esta.getitemstring(j,"cta_cpartida"))='' then			return -1
//	end if
//	if esta.getitemstring(j,"deprecia")='1' then
//		if isnull(esta.getitemstring(j,"cta_ajuste_dep")) or trim(esta.getitemstring(j,"cta_ajuste_dep"))='' or isnull(esta.getitemstring(j,"cta_cpartida_dep")) or trim(esta.getitemstring(j,"cta_cpartida_dep"))='' then return -1
//	end if
//next
return 1

end function

public function integer f_actu_cuenta (string nivel, string nuevo, string pedazo_ante);pedazo_ante+="%"
choose case nivel
	case "grupo"
		UPDATE pre_plan SET CodTotal = :nuevo+subgrupo+mayor+auxiliar+ordinal+subauxi+subordinal+nivel1+nivel2, grupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel2 Is Not Null And nivel2<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = :nuevo+subgrupo+mayor+auxiliar+ordinal+subauxi+subordinal+nivel1, grupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel1 Is Not Null And nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = :nuevo+subgrupo+mayor+auxiliar+ordinal+subauxi+subordinal, grupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subordinal Is Not Null And subordinal<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = :nuevo+subgrupo+mayor+auxiliar+ordinal+subauxi, grupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subauxi Is Not Null And subauxi<>'' and (subordinal is null or subordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subauxi",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = :nuevo+subgrupo+mayor+auxiliar+ordinal, grupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND ordinal Is Not Null And ordinal<>'' and (subauxi is null or subauxi='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando ordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = :nuevo+subgrupo+mayor+auxiliar, grupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND auxiliar Is Not Null And auxiliar<>'' and (ordinal is null or ordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando auxiliar",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = :nuevo+subgrupo+mayor, grupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND mayor Is Not Null And mayor<>'' and (auxiliar is null or auxiliar='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de mayor",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = :nuevo+subgrupo, grupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subgrupo Is Not Null And subgrupo<>'' and (mayor is null or mayor='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de subgrupo",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = :nuevo, grupo = :nuevo
		WHERE CodTotal like :pedazo_ante and (subgrupo is null or subgrupo='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de grupo",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "subgrupo"
		UPDATE pre_plan SET CodTotal = grupo+:nuevo+mayor+auxiliar+ordinal+subauxi+subordinal+nivel1+nivel2, subgrupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel2 Is Not Null And nivel2<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+:nuevo+mayor+auxiliar+ordinal+subauxi+subordinal+nivel1, subgrupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel1 Is Not Null And nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+:nuevo+mayor+auxiliar+ordinal+subauxi+subordinal, subgrupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subordinal Is Not Null And subordinal<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+:nuevo+mayor+auxiliar+ordinal+subauxi, subgrupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subauxi Is Not Null And subauxi<>'' and (subordinal is null or subordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subauxi",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+:nuevo+mayor+auxiliar+ordinal, subgrupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND ordinal Is Not Null And ordinal<>'' and (subauxi is null or subauxi='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando ordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+:nuevo+mayor+auxiliar, subgrupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND auxiliar Is Not Null And auxiliar<>'' and (ordinal is null or ordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando auxiliar",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+:nuevo+mayor, subgrupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND mayor Is Not Null And mayor<>'' and (auxiliar is null or auxiliar='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de mayor",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+:nuevo, subgrupo = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subgrupo Is Not Null And subgrupo<>'' and (mayor is null or mayor='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de subgrupo",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "mayor"
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+:nuevo+auxiliar+ordinal+subauxi+subordinal+nivel1+nivel2, mayor = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel2 Is Not Null And nivel2<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+:nuevo+auxiliar+ordinal+subauxi+subordinal+nivel1, mayor = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel1 Is Not Null And nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+:nuevo+auxiliar+ordinal+subauxi+subordinal, mayor = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subordinal Is Not Null And subordinal<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+:nuevo+auxiliar+ordinal+subauxi, mayor = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subauxi Is Not Null And subauxi<>'' and (subordinal is null or subordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subauxi",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+:nuevo+auxiliar+ordinal, mayor = :nuevo
		WHERE CodTotal Like :pedazo_ante AND ordinal Is Not Null And ordinal<>'' and (subauxi is null or subauxi='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando ordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+:nuevo+auxiliar, mayor = :nuevo
		WHERE CodTotal Like :pedazo_ante AND auxiliar Is Not Null And auxiliar<>'' and (ordinal is null or ordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando auxiliar",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+:nuevo, mayor = :nuevo
		WHERE CodTotal Like :pedazo_ante AND mayor Is Not Null And mayor<>'' and (auxiliar is null or auxiliar='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de mayor",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "auxiliar"
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+:nuevo+ordinal+subauxi+subordinal+nivel1+nivel2, auxiliar = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel2 Is Not Null And nivel2<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+:nuevo+ordinal+subauxi+subordinal+nivel1, auxiliar = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel1 Is Not Null And nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+:nuevo+ordinal+subauxi+subordinal, auxiliar = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subordinal Is Not Null And subordinal<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+:nuevo+ordinal+subauxi, auxiliar = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subauxi Is Not Null And subauxi<>'' and (subordinal is null or subordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subauxi",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+:nuevo+ordinal, auxiliar = :nuevo
		WHERE CodTotal Like :pedazo_ante AND ordinal Is Not Null And ordinal<>'' and (subauxi is null or subauxi='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando ordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+:nuevo, auxiliar = :nuevo
		WHERE CodTotal Like :pedazo_ante AND auxiliar Is Not Null And auxiliar<>'' and (ordinal is null or ordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando auxiliar",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "ordinal"
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+:nuevo+subauxi+subordinal+nivel1+nivel2, ordinal = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel2 Is Not Null And nivel2<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+:nuevo+subauxi+subordinal+nivel1, ordinal = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel1 Is Not Null And nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+:nuevo+subauxi+subordinal, ordinal = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subordinal Is Not Null And subordinal<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+:nuevo+subauxi, ordinal = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subauxi Is Not Null And subauxi<>'' and (subordinal is null or subordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subauxi",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+:nuevo, ordinal = :nuevo
		WHERE CodTotal Like :pedazo_ante AND ordinal Is Not Null And ordinal<>'' and (subauxi is null or subauxi='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando ordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "subauxi"
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+ordinal+:nuevo+subordinal+nivel1+nivel2, subauxi = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel2 Is Not Null And nivel2<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+ordinal+:nuevo+subordinal+nivel1, subauxi = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel1 Is Not Null And nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+ordinal+:nuevo+subordinal, subauxi = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subordinal Is Not Null And subordinal<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+ordinal+:nuevo, subauxi = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subauxi Is Not Null And subauxi<>'' and (subordinal is null or subordinal='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subauxi",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "subordinal"
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+ordinal+subauxi+:nuevo+nivel1+nivel2, subordinal = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel2 Is Not Null And nivel2<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+ordinal+subauxi+:nuevo+nivel1, subordinal = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel1 Is Not Null And nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+ordinal+subauxi+:nuevo, subordinal = :nuevo
		WHERE CodTotal Like :pedazo_ante AND subordinal Is Not Null And subordinal<>'' and (nivel1 is null or nivel1='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subordinal",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "nivel1"
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+ordinal+subauxi+subordinal+:nuevo+nivel2, nivel1 = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel2 Is Not Null And nivel2<>'';
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE pre_plan SET CodTotal = grupo+subgrupo+mayor+auxiliar+ordinal+subauxi+subordinal+:nuevo, nivel1 = :nuevo
		WHERE CodTotal Like :pedazo_ante AND nivel1 Is Not Null And nivel1<>'' and (nivel2 is null or nivel2='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
end choose
commit;
return 1
end function

public subroutine f_keyup (datawindow esta, keycode key);string colum
colum=esta.getcolumnname()
if colum="cta_contable" then
	if isNull(esta.GetItemString(esta.GetRow(),'cod_empresa')) then
		messageBox('Aviso','Debe seleccionar EMPRESA')
		Return 
	end if
	f_busca_cuenta(key,esta.GetItemString(esta.GetRow(),'cod_empresa'),esta)
end if
end subroutine

public subroutine f_getfocus (datawindow esta);f_semovio(esta,i_codemp,{"cta_contable" })

end subroutine

public function integer grabar ();int fila[10]
w_principal.setmicrohelp("Guardando")
if i_cam_n6 then
	if f_chequea(tab_1.tabp_5.dw_n6)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de las cuentas de Nivel 3")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=5
		tab_1.tabp_5.dw_n6.setfocus()
		return -1
	end if
	if tab_1.tabp_5.dw_n6.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_n5 then
	if f_chequea(tab_1.tabp_4.dw_n5)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de las cuentas de Nivel 2")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=4
		tab_1.tabp_4.dw_n5.setfocus()
		return -1
	end if
	if tab_1.tabp_4.dw_n5.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_n4 then
	if f_chequea(tab_1.tabp_4.dw_n4)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de las cuentas de nivel 1")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=4
		tab_1.tabp_4.dw_n4.setfocus()
		return -1
	end if
	if tab_1.tabp_4.dw_n4.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_n3 then
	if f_chequea(tab_1.tabp_4.dw_n3)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de las cuentas de subordinal")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=4
		tab_1.tabp_4.dw_n3.setfocus()
		return -1
	end if
	if tab_1.tabp_4.dw_n3.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_n2 then
	if f_chequea(tab_1.tabp_3.dw_n2)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de las cuentas de Subauxiliar")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=3
		tab_1.tabp_3.dw_n2.setfocus()
		return -1
	end if
	if tab_1.tabp_3.dw_n2.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_n1 then
	if f_chequea(tab_1.tabp_3.dw_n1)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de las cuentas Ordinales")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=3
		tab_1.tabp_3.dw_n1.setfocus()
		return -1
	end if
	if tab_1.tabp_3.dw_n1.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_subcta then
	if f_chequea(tab_1.tabp_3.dw_subcta)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de las cuentas Auxiliares")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=3
		tab_1.tabp_3.dw_subcta.setfocus()
		return -1
	end if
	if tab_1.tabp_3.dw_subcta.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_cuenta then
	if f_chequea(tab_1.tabp_2.dw_cuenta)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de nivel de cuentas Mayores")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=2
		tab_1.tabp_2.dw_cuenta.setfocus()
		return -1
	end if
	if tab_1.tabp_2.dw_cuenta.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_grupo then
	if f_chequea(tab_1.tabp_2.dw_grupo)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de las Cuentas de Subgrupo")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=2
		tab_1.tabp_2.dw_grupo.setfocus()
		return -1
	end if
	if tab_1.tabp_2.dw_grupo.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_mayor then
	if f_chequea(tab_1.tabp_2.dw_mayor)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos a nivel de Grupo")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=2
		tab_1.tabp_2.dw_mayor.setfocus()
		return -1
	end if
	if tab_1.tabp_2.dw_mayor.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if
if i_cam_gral then
	if f_chequea(tab_1.tabp_1.dw_2)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos en Plan Completo")
		w_principal.setmicrohelp("Gestión Cliente Interno")
		tab_1.selectedtab=1
		tab_1.tabp_1.dw_2.setfocus()
		return -1
	end if
	if tab_1.tabp_1.dw_2.update()=-1 then
		rollback;
		w_principal.setmicrohelp("Gestión Cliente Interno")
		return -1
	end if
end if

commit;
i_cam_n6=false
i_cam_n5=false
i_cam_n4=false
i_cam_n3=false
i_cam_n2=false
i_cam_n1=false
i_cam_subcta=false
i_cam_cuenta=false
i_cam_grupo=false
i_cam_mayor=false
i_cam_gral=false
cambio=false
fila[1] = tab_1.tabp_2.dw_mayor.GetRow()
fila[2] = tab_1.tabp_2.dw_grupo.GetRow()
fila[3] = tab_1.tabp_2.dw_cuenta.GetRow()
fila[4] = tab_1.tabp_3.dw_subcta.GetRow()
fila[5] = tab_1.tabp_3.dw_n1.GetRow()
fila[6] = tab_1.tabp_3.dw_n2.GetRow()
fila[7] = tab_1.tabp_4.dw_n3.GetRow()
fila[8] = tab_1.tabp_4.dw_n4.GetRow()
fila[9] = tab_1.tabp_4.dw_n5.GetRow()
fila[9] = tab_1.tabp_5.dw_n6.GetRow()
tab_1.tabp_2.dw_mayor.Reset()
tab_1.tabp_1.dw_2.Retrieve(vigencia)
tab_1.tabp_2.dw_mayor.Retrieve(vigencia)
if fila[1] > 0 then tab_1.tabp_2.dw_mayor.SetRow(fila[1])
if fila[2] > 0 then tab_1.tabp_2.dw_grupo.SetRow(fila[2])
if fila[3] > 0 then tab_1.tabp_2.dw_cuenta.SetRow(fila[3])
if fila[4] > 0 then tab_1.tabp_3.dw_subcta.SetRow(fila[4])
if fila[5] > 0 then tab_1.tabp_3.dw_n1.SetRow(fila[5])
if fila[6] > 0 then tab_1.tabp_3.dw_n2.SetRow(fila[6])
if fila[7] > 0 then tab_1.tabp_4.dw_n3.SetRow(fila[7])
if fila[8] > 0 then tab_1.tabp_4.dw_n4.SetRow(fila[8])
if fila[9] > 0 then tab_1.tabp_4.dw_n5.SetRow(fila[9])
if fila[10] > 0 then tab_1.tabp_5.dw_n6.SetRow(fila[10])

w_principal.setmicrohelp("Gestión Cliente Interno")
return 1

end function

public subroutine f_itemfocuschanged (string name_col, datawindow datawin);f_semovio(datawin,i_codemp,{"cta_contable" })
if name_col = 'planeado_inicial' then
	if (datawin.GetItemString(datawin.GetRow(),'movimiento') = '1' and estado = '0' and equ = '0') or & 
		(datawin.GetItemString(datawin.GetRow(),'movimiento') = '1' and datawin.GetItemString(datawin.GetRow(),'tipo')='0' and equ = '1' and estado = '0') or &
		(datawin.GetItemNumber(datawin.GetRow(),'nuevo') = 1 and abierto) then
		datawin.Modify("planeado_inicial.edit.DisplayOnly=NO ")
	else 
		datawin.Modify("planeado_inicial.edit.DisplayOnly=yes ")
	end if
end if

end subroutine

public function integer f_itemchanged (datawindow esta, datawindow hija, datawindow padre);long fila
fila=esta.getrow()
if fila<0 then return 0
string actual, column, codigos
column=esta.getcolumnname()
choose case column
	case "grupo","subgrupo","mayor","auxiliar","ordinal","subauxi","subordinal","nivel1","nivel2","nivel3"
		actual=esta.getitemstring(fila,column)
		if esta.find(column+"='"+esta.gettext()+"'",1,esta.rowcount())>0 then
			esta.setitem(fila,column,actual)
			return -1
		end if
		if not isnull(hija) then
			if hija.rowcount()>0 then
				choose case messagebox("Atención","Esta cuenta tiene cuentas dependientes, desea cambiarlas tambien?",question!,yesno!,2)
					case 1
						if f_actu_cuenta(column,esta.gettext(),esta.getitemstring(fila,"codtotal"))=1 then
							sle_1.text = esta.GetItemString(esta.GetRow(),'codtotal')
							sle_1.text = left(sle_1.text,len(sle_1.text) - len(esta.GetText()))
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
			case "grupo"
				cod_new=esta.getitemstring(fila,column)
			case "subgrupo"
				cod_new=esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"subgrupo")
			case "mayor"
				cod_new=esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"subgrupo")+esta.getitemstring(fila,"mayor")
			case "auxiliar"
				cod_new=esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"subgrupo")+esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"auxiliar")
			case "ordinal"
				cod_new=esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"subgrupo")+esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"auxiliar")+esta.getitemstring(fila,"ordinal")
			case "subauxi"
				cod_new=esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"subgrupo")+esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"auxiliar")+esta.getitemstring(fila,"ordinal")+esta.getitemstring(fila,"subauxi")
			case "subordinal"
				cod_new=esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"subgrupo")+esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"auxiliar")+esta.getitemstring(fila,"ordinal")+esta.getitemstring(fila,"subauxi")+esta.getitemstring(fila,"subordinal")
			case "nivel1"
				cod_new=esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"subgrupo")+esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"auxiliar")+esta.getitemstring(fila,"ordinal")+esta.getitemstring(fila,"subauxi")+esta.getitemstring(fila,"subordinal")+esta.getitemstring(fila,"nivel1")
			case "nivel2"
				cod_new=esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"subgrupo")+esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"auxiliar")+esta.getitemstring(fila,"ordinal")+esta.getitemstring(fila,"subauxi")+esta.getitemstring(fila,"subordinal")+esta.getitemstring(fila,"nivel1")+esta.getitemstring(fila,"nivel2")
			case "nivel3"
				cod_new=esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"subgrupo")+esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"auxiliar")+esta.getitemstring(fila,"ordinal")+esta.getitemstring(fila,"subauxi")+esta.getitemstring(fila,"subordinal")+esta.getitemstring(fila,"nivel1")+esta.getitemstring(fila,"nivel2")+esta.getitemstring(fila,"nivel3")
		end choose
		esta.setitem(fila,"codtotal",cod_new)
		return 1
	case "movimiento"
		actual=esta.getitemstring(fila,"movimiento")
		if (estado <> '0' and not abierto) then
			esta.setitem(fila,column,actual)
			esta.SetText(actual)
			esta.AcceptText()
			return -1
		end if
		if not isnull(hija) then
			if hija.rowcount()>0  and actual='0' then
				esta.setitem(fila,"movimiento",actual)
				esta.SetText(actual)
				esta.AcceptText()
				return -1
			end if
		end if
		return 1
	case "tipo"
		actual=esta.getitemstring(fila,"tipo")
		if (estado <> '0' and not abierto) then
			esta.setitem(fila,column,actual)
			esta.SetText(actual)
			esta.AcceptText()
			return -1
		end if
		return 1
	case "cod_empresa"
		actual=esta.getitemstring(fila,"cod_empresa")
		if (estado <> '0' and not abierto) then
			esta.setitem(fila,column,actual)
			esta.SetText(actual)
			esta.AcceptText()
			return -1
		end if
		return 1
	case "planeado_inicial"
		dec total = 0
		long i
		if esta.accepttext() = -1 then Return -1
		//esta.SetItem(esta.GetRow(),'planeado_actual',esta.GetItemNumber(esta.getRow(),'planeado_inicial'))
		if not isNull(padre) then
			for i = 1 to esta.RowCount()
				total = total + esta.GetItemNumber(i,'planeado_inicial')
			next
			padre.SetItem(padre.GetRow(),'planeado_inicial',total)
//			padre.SetItem(padre.GetRow(),'planeado_actual',total)
			padre.SetColumn('planeado_inicial')
			padre.TriggerEvent(itemchanged!)
		end if
		if equ = '1' and esta.GetItemString(esta.GetRow(),'movimiento') = '1' then
			st_ppto st_parm
			st_parm.filtro = estado
			st_parm.dw_obj = esta
			openwithparm(w_distmonto,st_parm)
		end if
//		total = f_chkequ(dw_1.GetItemNumber(1,'cod_vigencia'),esta.GetItemString(esta.getRow(),'codtotal'),esta.GetItemString(esta.getRow(),'tipo'),esta.GetItemNumber(esta.getRow(),'planeado_inicial'),codigos)
//		if total <> 0 and codigos <> '' then
//			messageBox('Desequilibrio entre Ingresos y Gastos','Desequilibrio: ' + string(total,'#,##0;[RED](#,##0)') + '. Cuentas relacionadas con ' + esta.GetItemString(esta.getrow(),'codtotal') + ': ' + codigos)
//		end if
		return 1
	case "" 
		string campo
		campo = esta.getcolumnname()
		if campo="cta_ctble_aprobados" or campo="cta_ctble_ejecutar" or campo="cta_ctble_recaudo" or campo="cta_ctble_disponibil" or &
			campo="cta_ctble_gasto" or campo="cta_ctble_compromiso" or campo="cta_ctble_obligacion" or campo="cta_ctble_pago" then
			string revisa,otro
			otro=esta.gettext()
			setnull(revisa)
			select codtotal into :revisa from cont_plan where codtotal=:otro and cod_empresa=:i_codemp and movimiento='1';
			if isnull(revisa) then
				esta.setitem(esta.getrow(),esta.getcolumnname(),revisa)
				return 1
			else
				esta.accepttext()
				cambio=true
				i_cam_gral=true
			end if
		else
			esta.accepttext()
			cambio=true
			i_cam_gral=true
		end if
	case else
		esta.accepttext()
		return 1
end choose

end function

public subroutine f_doubleclicked (string name_col, datawindow dw_obj);if dw_obj.RowCount() = 0 then Return
if estado = '1' and not abierto then
	MessageBox('Error','La vigencia es definitiva, no puede modificarse')
	Return
End if
if equ = '1' and dw_obj.GetItemString(dw_obj.GetRow(),'movimiento') = '1'  and dw_obj.GetItemString(dw_obj.GetRow(),'tipo') = '0' then
	st_ppto st_parm
	st_parm.filtro = estado
	st_parm.dw_obj = dw_obj
	openwithparm(w_distmonto,st_parm)
end if

end subroutine

public function integer f_rowfocuschanged (datawindow dw);if dw.RowCount() = 0 or dw.getrow()<1 then Return 0
string campo
Choose case dw.DataObject
	case 'dw_grupo_ppto' 
		campo = 'grupo'
	case 'dw_subgrupo_ppto' 
		campo = 'subgrupo'
	case 'dw_mayor_ppto'
		campo = 'mayor'
	case 'dw_auxiliar_ppto'
		campo = 'auxiliar'
	case 'dw_ordinal_ppto'
		campo = 'ordinal'
	case 'dw_subauxi_ppto'
		campo = 'subauxi'
	case 'dw_subordi_ppto'
		campo = 'subordinal'
	case 'dw_nivel1_ppto'
		campo = 'nivel1'
	case 'dw_nivel2_ppto'
		campo = 'nivel2'
end choose
if (estado = '1' and not abierto) or estado = '2'then
	//dw.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes auxiliar.edit.DisplayOnly=yes ordinal.edit.DisplayOnly=yes subauxi.edit.DisplayOnly=yes subordinal.edit.DisplayOnly=yes nivel1.edit.DisplayOnly=yes nivel2.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	dw.Modify(campo+".edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes planeado_inicial.edit.DisplayOnly=yes")
elseif estado = '0' or (estado = '1' and abierto and dw.GetItemNumber(dw.getRow(),'nuevo') = 1) then
	dw.Modify(campo+".edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no planeado_inicial.edit.DisplayOnly=yes")
end if

Return 0

end function

event open;dw_1.settransobject(SQLCA)
tab_1.tabp_1.dw_2.settransobject(SQLCA)
dw_1.insertrow(1)

abierto = FALSE

select cod_vigencia, estado into :vigencia,:estado from pre_vigencia;
//where estado='0' or estado='2';
if SQLCA.SQLCode = 0 then
	dw_1.SetItem(1,'cod_vigencia',vigencia)
	dw_1.TriggerEvent(itemchanged!)
end if
string empre_actual

menu = create m_pop_ppto

end event

on w_plan_ppto.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.sle_1=create sle_1
this.st_2=create st_2
this.st_3=create st_3
this.tab_1=create tab_1
this.pb_1=create pb_1
this.dw_muestras=create dw_muestras
this.pb_abrir=create pb_abrir
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.tab_1
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.dw_muestras
this.Control[iCurrent+8]=this.pb_abrir
end on

on w_plan_ppto.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.tab_1)
destroy(this.pb_1)
destroy(this.dw_muestras)
destroy(this.pb_abrir)
end on

event resize;call super::resize;tab_1.event resize(newwidth , newheight -184 )



end event

type pb_grabar from w_center`pb_grabar within w_plan_ppto
integer x = 3785
integer y = 32
integer taborder = 40
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "&Guardar Temporal"
end type

event pb_grabar::clicked;call super::clicked;if estado = '1' then
	MessageBox('Aviso','La vigencia es definitiva. No puede modificarse')
	Return 0
end if

if i_cam_n5 or i_cam_n4 or i_cam_n3 or i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta or i_cam_grupo or i_cam_mayor or i_cam_gral then
	if grabar() = -1 then Return -1
end if

end event

type dw_1 from datawindow within w_plan_ppto
integer x = 27
integer y = 56
integer width = 654
integer height = 72
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigen"
boolean border = false
boolean livescroll = true
end type

event itemchanged;call super::itemchanged;
this.accepttext()
vigencia = this.GetItemNumber(this.GetRow(),'cod_vigencia')
select pplan, equilibrio into :estado,:equ from pre_vigencia where cod_vigencia = :vigencia;
if isNull(equ) then equ = '1'
if isNull(estado) then estado = '0'
if estado <> '0' then
	tab_1.tabp_2.dw_mayor.Modify("grupo.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.Edit.DisplayOnly=yes")
	tab_1.tabp_2.dw_grupo.Modify("subgrupo.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	tab_1.tabp_2.dw_cuenta.Modify("mayor.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	tab_1.tabp_3.dw_subcta.Modify("auxiliar.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	tab_1.tabp_3.dw_n1.Modify("ordinal.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	tab_1.tabp_3.dw_n2.Modify("subauxi.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	tab_1.tabp_4.dw_n3.Modify("subordinal.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	tab_1.tabp_4.dw_n4.Modify("nivel1.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	tab_1.tabp_4.dw_n5.Modify("nivel2.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	//tab_1.tabp_1.dw_2.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes auxiliar.edit.DisplayOnly=yes ordinal.edit.DisplayOnly=yes subauxi.edit.DisplayOnly=yes subordinal.edit.DisplayOnly=yes nivel1.edit.DisplayOnly=yes nivel2.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
	pb_abrir.x = 3922
	pb_abrir.Visible = TRUE
	pb_grabar.Visible = FALSE
else
	tab_1.tabp_2.dw_mayor.Modify("grupo.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.Edit.DisplayOnly=no")
	tab_1.tabp_2.dw_grupo.Modify("subgrupo.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
	tab_1.tabp_2.dw_cuenta.Modify("mayor.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
	tab_1.tabp_3.dw_subcta.Modify("auxiliar.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
	tab_1.tabp_3.dw_n1.Modify("ordinal.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
	tab_1.tabp_3.dw_n2.Modify("subauxi.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
	tab_1.tabp_4.dw_n3.Modify("subordinal.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
	tab_1.tabp_4.dw_n4.Modify("nivel1.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
	tab_1.tabp_4.dw_n5.Modify("nivel2.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
	//tab_1.tabp_1.dw_2.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no mayor.edit.DisplayOnly=no auxiliar.edit.DisplayOnly=no ordinal.edit.DisplayOnly=no subauxi.edit.DisplayOnly=no subordinal.edit.DisplayOnly=no nivel1.edit.DisplayOnly=no nivel2.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
	pb_abrir.Visible = FALSE
	pb_grabar.Visible = TRUE
end if
if estado = '1' then
	st_3.Text = 'Vigencia Definitiva'
elseif estado = '2' then
	st_3.Text = 'Vigencia Anulada'
elseif estado = '0' then
	st_3.Text = 'Vigencia Modificable'
end if

select count(codtotal) into :cuantas from pre_plan where cod_vigencia=:vigencia;
w_principal.SetMicroHelp("Leyendo Registros")
timer(1)
tab_1.tabp_1.st_1.text = string(tab_1.tabp_1.dw_2.Retrieve(vigencia)) + ' Registros'
tab_1.tabp_2.dw_mayor.Reset()
tab_1.tabp_2.dw_mayor.retrieve(vigencia)

w_principal.setmicrohelp("Gestión Cliente Interno")

// Backup
//if estado <> '0' then
//	tab_1.tabp_2.dw_mayor.Modify("grupo.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.Edit.DisplayOnly=yes")
//	tab_1.tabp_2.dw_grupo.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
//	tab_1.tabp_2.dw_cuenta.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
//	tab_1.tabp_3.dw_subcta.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes auxiliar.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
//	tab_1.tabp_3.dw_n1.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes auxiliar.edit.DisplayOnly=yes ordinal.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
//	tab_1.tabp_3.dw_n2.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes auxiliar.edit.DisplayOnly=yes ordinal.edit.DisplayOnly=yes subauxi.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
//	tab_1.tabp_4.dw_n3.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes auxiliar.edit.DisplayOnly=yes ordinal.edit.DisplayOnly=yes subauxi.edit.DisplayOnly=yes subordinal.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
//	tab_1.tabp_4.dw_n4.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes auxiliar.edit.DisplayOnly=yes ordinal.edit.DisplayOnly=yes subauxi.edit.DisplayOnly=yes subordinal.edit.DisplayOnly=yes nivel1.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
//	tab_1.tabp_4.dw_n5.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes auxiliar.edit.DisplayOnly=yes ordinal.edit.DisplayOnly=yes subauxi.edit.DisplayOnly=yes subordinal.edit.DisplayOnly=yes nivel1.edit.DisplayOnly=yes nivel2.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
//	tab_1.tabp_1.dw_2.Modify("grupo.edit.DisplayOnly=yes subgrupo.edit.DisplayOnly=yes mayor.edit.DisplayOnly=yes auxiliar.edit.DisplayOnly=yes ordinal.edit.DisplayOnly=yes subauxi.edit.DisplayOnly=yes subordinal.edit.DisplayOnly=yes nivel1.edit.DisplayOnly=yes nivel2.edit.DisplayOnly=yes codtotal.edit.DisplayOnly=yes descrip.edit.DisplayOnly=yes cta_contable.edit.DisplayOnly=yes")
//	pb_abrir.x = 3333
//	pb_abrir.Visible = TRUE
//	pb_grabar.Visible = FALSE
//else
//	tab_1.tabp_2.dw_mayor.Modify("grupo.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.Edit.DisplayOnly=no")
//	tab_1.tabp_2.dw_grupo.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
//	tab_1.tabp_2.dw_cuenta.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no mayor.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
//	tab_1.tabp_3.dw_subcta.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no mayor.edit.DisplayOnly=no auxiliar.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
//	tab_1.tabp_3.dw_n1.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no mayor.edit.DisplayOnly=no auxiliar.edit.DisplayOnly=no ordinal.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
//	tab_1.tabp_3.dw_n2.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no mayor.edit.DisplayOnly=no auxiliar.edit.DisplayOnly=no ordinal.edit.DisplayOnly=no subauxi.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
//	tab_1.tabp_4.dw_n3.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no mayor.edit.DisplayOnly=no auxiliar.edit.DisplayOnly=no ordinal.edit.DisplayOnly=no subauxi.edit.DisplayOnly=no subordinal.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
//	tab_1.tabp_4.dw_n4.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no mayor.edit.DisplayOnly=no auxiliar.edit.DisplayOnly=no ordinal.edit.DisplayOnly=no subauxi.edit.DisplayOnly=no subordinal.edit.DisplayOnly=no nivel1.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
//	tab_1.tabp_4.dw_n5.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no mayor.edit.DisplayOnly=no auxiliar.edit.DisplayOnly=no ordinal.edit.DisplayOnly=no subauxi.edit.DisplayOnly=no subordinal.edit.DisplayOnly=no nivel1.edit.DisplayOnly=no nivel2.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
//	tab_1.tabp_1.dw_2.Modify("grupo.edit.DisplayOnly=no subgrupo.edit.DisplayOnly=no mayor.edit.DisplayOnly=no auxiliar.edit.DisplayOnly=no ordinal.edit.DisplayOnly=no subauxi.edit.DisplayOnly=no subordinal.edit.DisplayOnly=no nivel1.edit.DisplayOnly=no nivel2.edit.DisplayOnly=no codtotal.edit.DisplayOnly=no descrip.edit.DisplayOnly=no cta_contable.edit.DisplayOnly=no")
//	pb_abrir.Visible = FALSE
//	pb_grabar.Visible = TRUE
//end if
end event

type sle_1 from singlelineedit within w_plan_ppto
event teclear pbm_keyup
integer x = 690
integer y = 60
integer width = 841
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar_1(1)
end event

type st_2 from statictext within w_plan_ppto
integer x = 704
integer y = 8
integer width = 279
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_plan_ppto
integer x = 37
integer y = 8
integer width = 626
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vigencia"
boolean focusrectangle = false
end type

type tab_1 from tab within w_plan_ppto
event create ( )
event destroy ( )
event resize ( integer ai_width,  integer ai_height )
integer x = 27
integer y = 164
integer width = 5673
integer height = 1768
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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
tabp_4 tabp_4
tabp_5 tabp_5
end type

on tab_1.create
this.tabp_1=create tabp_1
this.tabp_2=create tabp_2
this.tabp_3=create tabp_3
this.tabp_4=create tabp_4
this.tabp_5=create tabp_5
this.Control[]={this.tabp_1,&
this.tabp_2,&
this.tabp_3,&
this.tabp_4,&
this.tabp_5}
end on

on tab_1.destroy
destroy(this.tabp_1)
destroy(this.tabp_2)
destroy(this.tabp_3)
destroy(this.tabp_4)
destroy(this.tabp_5)
end on

event resize(integer ai_width, integer ai_height);int pedazo

this.resize(ai_width , ai_height )
tab_1.tabp_1.dw_2.resize(ai_width - 100 , ai_height -420)
tab_1.tabp_1.st_4.y= tab_1.tabp_1.dw_2.height + 184
tab_1.tabp_1.st_5.y= tab_1.tabp_1.dw_2.height + 184
tab_1.tabp_1.st_6.y= tab_1.tabp_1.dw_2.height + 184
tab_1.tabp_1.em_1.y=tab_1.tabp_1.dw_2.height + 180
tab_1.tabp_1.em_2.y=tab_1.tabp_1.dw_2.height + 180
tab_1.tabp_1.em_3.y=tab_1.tabp_1.dw_2.height + 180

///1
pedazo= (ai_height / 3) -100
tab_1.tabp_2.dw_mayor.resize(ai_width - 300 , pedazo)

tab_1.tabp_2.dw_grupo.y=tab_1.tabp_2.dw_mayor.y + tab_1.tabp_2.dw_mayor.height +18
tab_1.tabp_2.dw_grupo.resize(ai_width - 300 , pedazo)

tab_1.tabp_2.dw_cuenta.y=tab_1.tabp_2.dw_grupo.y + tab_1.tabp_2.dw_grupo.height +18
tab_1.tabp_2.dw_cuenta.resize(ai_width - 300 ,pedazo)

tab_1.tabp_2.pb_new_mayor.x=ai_width -215
tab_1.tabp_2.pb_del_mayor.x=ai_width -215
tab_1.tabp_2.pb_new_grupo.x=ai_width -215
tab_1.tabp_2.pb_del_grupo.x=ai_width -215
tab_1.tabp_2.pb_new_cta.x=ai_width -215
tab_1.tabp_2.pb_del_cta.x=ai_width -215

////2
tab_1.tabp_3.dw_subcta.resize(ai_width - 300 , pedazo)

tab_1.tabp_3.dw_n1.y=tab_1.tabp_3.dw_subcta.y +tab_1.tabp_3.dw_subcta.height +18
tab_1.tabp_3.dw_n1.resize(ai_width - 300 ,pedazo)

tab_1.tabp_3.dw_n2.y=tab_1.tabp_3.dw_n1.y +tab_1.tabp_3.dw_n1.height +18
tab_1.tabp_3.dw_n2.resize(ai_width - 300 ,pedazo)

tab_1.tabp_3.pb_new_subcta.x=ai_width -215
tab_1.tabp_3.pb_del_subcta.x=ai_width -215
tab_1.tabp_3.pb_new_n1.x=ai_width -215
tab_1.tabp_3.pb_del_n1.x=ai_width -215
tab_1.tabp_3.pb_new_n2.x=ai_width -215
tab_1.tabp_3.pb_del_n2.x=ai_width -215

//3
tab_1.tabp_4.dw_n3.resize(ai_width - 300 , pedazo)

tab_1.tabp_4.dw_n4.y=tab_1.tabp_4.dw_n3.y +tab_1.tabp_4.dw_n3.height +18
tab_1.tabp_4.dw_n4.resize(ai_width - 300 ,pedazo)

tab_1.tabp_4.dw_n5.y=tab_1.tabp_4.dw_n4.y +tab_1.tabp_4.dw_n4.height +18
tab_1.tabp_4.dw_n5.resize(ai_width - 300 ,pedazo)

tab_1.tabp_4.pb_new_n3.x=ai_width -215
tab_1.tabp_4.pb_del_n3.x=ai_width -215
tab_1.tabp_4.pb_new_n4.x=ai_width -215
tab_1.tabp_4.pb_del_n4.x=ai_width -215
tab_1.tabp_4.pb_new_n5.x=ai_width -215
tab_1.tabp_4.pb_del_n5.x=ai_width -215
///
tab_1.tabp_5.dw_n6.resize(ai_width - 300 , pedazo)
tab_1.tabp_5.pb_new_n6.x=ai_width -215
tab_1.tabp_5.pb_del_n6.x=ai_width -215

end event

type tabp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5637
integer height = 1640
long backcolor = 67108864
string text = "Plan Completo"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra todas las Cuentas del Plan"
st_6 st_6
em_3 em_3
st_5 st_5
st_4 st_4
em_2 em_2
em_1 em_1
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
this.st_6=create st_6
this.em_3=create em_3
this.st_5=create st_5
this.st_4=create st_4
this.em_2=create em_2
this.em_1=create em_1
this.pb_import=create pb_import
this.pb_export=create pb_export
this.dw_2=create dw_2
this.st_regi=create st_regi
this.st_cuenta=create st_cuenta
this.st_nat=create st_nat
this.st_mvto=create st_mvto
this.st_1=create st_1
this.Control[]={this.st_6,&
this.em_3,&
this.st_5,&
this.st_4,&
this.em_2,&
this.em_1,&
this.pb_import,&
this.pb_export,&
this.dw_2,&
this.st_regi,&
this.st_cuenta,&
this.st_nat,&
this.st_mvto,&
this.st_1}
end on

on tabp_1.destroy
destroy(this.st_6)
destroy(this.em_3)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.pb_import)
destroy(this.pb_export)
destroy(this.dw_2)
destroy(this.st_regi)
destroy(this.st_cuenta)
destroy(this.st_nat)
destroy(this.st_mvto)
destroy(this.st_1)
end on

type st_6 from statictext within tabp_1
integer x = 2199
integer y = 1532
integer width = 320
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diferencia :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_3 from editmask within tabp_1
integer x = 2528
integer y = 1520
integer width = 649
integer height = 92
integer taborder = 39
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

type st_5 from statictext within tabp_1
integer x = 1143
integer y = 1532
integer width = 288
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gastos :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within tabp_1
integer x = 73
integer y = 1532
integer width = 302
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresos :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_2 from editmask within tabp_1
integer x = 1454
integer y = 1520
integer width = 649
integer height = 92
integer taborder = 29
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

type em_1 from editmask within tabp_1
integer x = 393
integer y = 1520
integer width = 649
integer height = 92
integer taborder = 19
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

type pb_import from picturebutton within tabp_1
event mousemove pbm_mousemove
string tag = "Importar Plan desde Archivo separado por TAB´s"
integer x = 2834
integer width = 146
integer height = 128
integer taborder = 12
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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
	string grupo,subgrupo,mayor,auxiliar,ordinal,subauxi,subordinal,nivel1,nivel2,toda
	for value=cuantas_f +1 to dw_2.rowcount()
		grupo=dw_2.getitemstring(value,"grupo")
		if isnull(grupo) then grupo =''
		subgrupo=dw_2.getitemstring(value,"subgrupo")
		if isnull(subgrupo) then subgrupo =''
		mayor=dw_2.getitemstring(value,"mayor")
		if isnull(mayor) then mayor =''
		auxiliar=dw_2.getitemstring(value,"auxiliar")
		if isnull(auxiliar) then auxiliar =''
		ordinal=dw_2.getitemstring(value,"ordinal")
		if isnull(ordinal) then ordinal =''
		subauxi=dw_2.getitemstring(value,"subauxi")
		if isnull(subauxi) then subauxi =''
		subordinal=dw_2.getitemstring(value,"subordinal")
		if isnull(subordinal) then subordinal =''
		nivel1=dw_2.getitemstring(value,"nivel1")
		if isnull(nivel1) then nivel1 =''
		nivel2=dw_2.getitemstring(value,"nivel2")
		if isnull(nivel2) then nivel2 =''
		toda=grupo+subgrupo+mayor+auxiliar+ordinal+subauxi+subordinal+nivel1+nivel2
		dw_2.setitem(value,"codtotal",toda)
		dw_2.setitem(value,"cod_vigencia",dw_1.GetItemNumber(dw_1.GetRow(),'cod_vigencia'))
	next
end if

end event

type pb_export from picturebutton within tabp_1
event mousemove pbm_mousemove
string tag = "Exportar Plan"
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
string facename = "Arial"
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
integer width = 5586
integer height = 1372
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_plan_ppto"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;if this.getcolumnname()="cta_ajuste" or this.getcolumnname()= "cta_cpartida" then
	f_busca_cuenta(key,i_codemp,this)
end if
end event

event doubleclicked;long fila
fila = this.getrow()
if fila < 1 then return
string mayor,grupo,cuenta,subcta,niv1,niv2,niv3,niv4,niv5,busca,niv6
long donde,llego
mayor = this.getitemstring(fila,"grupo")
grupo = this.getitemstring(fila,"subgrupo")
cuenta = this.getitemstring(fila,"mayor")
subcta = this.getitemstring(fila,"auxiliar")
niv1 = this.getitemstring(fila,"ordinal")
niv2 = this.getitemstring(fila,"subauxi")
niv3 = this.getitemstring(fila,"subordinal")
niv4 = this.getitemstring(fila,"nivel1")
niv5 = this.getitemstring(fila,"nivel2")
niv6 = this.getitemstring(fila,"nivel3")
donde = tab_1.tabp_2.dw_mayor.find("grupo='"+mayor+"'",1,tab_1.tabp_2.dw_mayor.rowcount())
if donde <> tab_1.tabp_2.dw_mayor.getrow() then tab_1.tabp_2.dw_mayor.scrolltorow(donde)
llego = 1
if grupo <> "" then
	donde = tab_1.tabp_2.dw_grupo.find("grupo='"+mayor+"' and subgrupo='"+grupo+"'",1,tab_1.tabp_2.dw_grupo.rowcount())
	if donde <> tab_1.tabp_2.dw_grupo.getrow() then tab_1.tabp_2.dw_grupo.scrolltorow(donde)
	llego = 2
end if
if cuenta <> "" then
	donde = tab_1.tabp_2.dw_cuenta.find("grupo='"+mayor+"' and subgrupo='"+grupo+"' and mayor='"+cuenta+"'",1,tab_1.tabp_2.dw_cuenta.rowcount())
	if donde <> tab_1.tabp_2.dw_cuenta.getrow() then tab_1.tabp_2.dw_cuenta.scrolltorow(donde)
	llego = 3
end if
if subcta <> "" then
	donde = tab_1.tabp_3.dw_subcta.find("grupo='"+mayor+"' and subgrupo='"+grupo+"' and mayor='"+cuenta+"' and auxiliar='"+subcta+"'",1,tab_1.tabp_3.dw_subcta.rowcount())
	if donde <> tab_1.tabp_3.dw_subcta.getrow() then tab_1.tabp_3.dw_subcta.scrolltorow(donde)
	llego = 4
end if
if niv1 <> "" then
	donde = tab_1.tabp_3.dw_n1.find("grupo='"+mayor+"' and subgrupo='"+grupo+"' and mayor='"+cuenta+"' and auxiliar='"+subcta+"' and ordinal='"+niv1+"'",1,tab_1.tabp_3.dw_n1.rowcount())
	if donde <> tab_1.tabp_3.dw_n1.getrow() then tab_1.tabp_3.dw_n1.scrolltorow(donde)
	llego = 5
end if
if niv2 <> "" then
	donde = tab_1.tabp_3.dw_n2.find("grupo='"+mayor+"' and subgrupo='"+grupo+"' and mayor='"+cuenta+"' and auxiliar='"+subcta+"' and ordinal='"+niv1+"' and subauxi='"+niv2+"'",1,tab_1.tabp_3.dw_n2.rowcount())
	if donde <> tab_1.tabp_3.dw_n2.getrow() then tab_1.tabp_3.dw_n2.scrolltorow(donde)
	llego = 6
end if
if niv3 <> "" then
	donde = tab_1.tabp_4.dw_n3.find("grupo='"+mayor+"' and subgrupo='"+grupo+"' and mayor='"+cuenta+"' and auxiliar='"+subcta+"' and ordinal='"+niv1+"' and subauxi='"+niv2+"' and subordinal='"+niv3+"'",1,tab_1.tabp_4.dw_n3.rowcount())
	if donde <> tab_1.tabp_4.dw_n3.getrow() then tab_1.tabp_4.dw_n3.scrolltorow(donde)
	llego = 7
end if
if niv4 <> "" then
	donde = tab_1.tabp_4.dw_n4.find("grupo='"+mayor+"' and subgrupo='"+grupo+"' and mayor='"+cuenta+"' and auxiliar='"+subcta+"' and ordinal='"+niv1+"' and subauxi='"+niv2+"' and subordinal='"+niv3+"' and nivel1='"+niv4+"'",1,tab_1.tabp_4.dw_n4.rowcount())
	if donde <> tab_1.tabp_4.dw_n4.getrow() then tab_1.tabp_4.dw_n4.scrolltorow(donde)
	llego = 8
end if
if niv5 <> "" then
	donde = tab_1.tabp_4.dw_n5.find("grupo='"+mayor+"' and subgrupo='"+grupo+"' and mayor='"+cuenta+"' and auxiliar='"+subcta+"' and ordinal='"+niv1+"' and subauxi='"+niv2+"' and subordinal='"+niv3+"' and nivel1='"+niv4+"' and nivel2='"+niv5+"'",1,tab_1.tabp_4.dw_n5.rowcount())
	if donde <> tab_1.tabp_4.dw_n5.getrow() then tab_1.tabp_4.dw_n5.scrolltorow(donde)
	tab_1.selectedtab = 4
	llego = 9
	tab_1.tabp_4.dw_n5.setfocus()
end if
if niv6 <> "" then
	donde = tab_1.tabp_5.dw_n6.find("grupo='"+mayor+"' and subgrupo='"+grupo+"' and mayor='"+cuenta+"' and auxiliar='"+subcta+"' and ordinal='"+niv1+"' and subauxi='"+niv2+"' and subordinal='"+niv3+"' and nivel1='"+niv4+"' and nivel2='"+niv5+"'",1,tab_1.tabp_5.dw_n6.rowcount())
	if donde <> tab_1.tabp_4.dw_n5.getrow() then tab_1.tabp_4.dw_n5.scrolltorow(donde)
	tab_1.selectedtab = 5
	tab_1.tabp_5.dw_n6.setfocus()
end if
choose case llego
	case 1
		tab_1.selectedtab = 2
		tab_1.tabp_2.dw_mayor.setfocus()
	case 2
		tab_1.selectedtab = 2
		tab_1.tabp_2.dw_grupo.setfocus()
	case 3
		tab_1.selectedtab = 2
		tab_1.tabp_2.dw_cuenta.setfocus()
	case 4
		tab_1.selectedtab = 3
		tab_1.tabp_3.dw_subcta.setfocus()
	case 5
		tab_1.selectedtab = 3
		tab_1.tabp_3.dw_n1.setfocus()
	case 6
		tab_1.selectedtab = 3
		tab_1.tabp_3.dw_n2.setfocus()
	case 7
		tab_1.selectedtab = 4
		tab_1.tabp_4.dw_n3.setfocus()
	case 8
		tab_1.selectedtab = 4
		tab_1.tabp_4.dw_n4.setfocus()
	case 9
		tab_1.selectedtab = 5
		tab_1.tabp_5.dw_n6.setfocus()		
end choose

end event

event itemchanged;string campo
campo = this.getcolumnname()
if campo="cta_ctble_aprobados" or campo="cta_ctble_ejecutar" or campo="cta_ctble_recaudo" or campo="cta_ctble_disponibil" or &
	campo="cta_ctble_gasto" or campo="cta_ctble_compromiso" or campo="cta_ctble_obligacion" or campo="cta_ctble_pago" then
	string revisa,otro
	otro=this.gettext()
	setnull(revisa)
	select codtotal into :revisa from cont_plan where codtotal=:otro and cod_empresa=:i_codemp and movimiento='1';
	if isnull(revisa) then
		this.setitem(this.getrow(),this.getcolumnname(),revisa)
		return 1
	else
		this.accepttext()
		cambio=true
		i_cam_gral=true
	end if
else
	this.accepttext()
	cambio=true
	i_cam_gral=true
end if

end event

event rbuttondown;long fila
fila=this.getrow()
if dwo.type<>"column" then return
if fila<1 then return
if fila<>row and row>0 then
	fila=row
	this.scrolltorow(row)
end if
if string(dwo.name)<>this.getcolumnname() and dwo.type="column" then this.setcolumn(string(dwo.name))

CHOOSE CASE this.getcolumnname()
	CASE "grupo"
		sle_1.text=this.getitemstring(fila,"grupo")
		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
		if this.getitemstring(fila,"grupo")='' or isnull(this.getitemstring(fila,"grupo")) then
			menu.m_con_1.m_filtrarpor.enabled=false
		else
			menu.m_con_1.m_filtrarpor.enabled=true
		end if
		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
	case "subgrupo"
		sle_1.text=this.getitemstring(fila,"grupo")+this.getitemstring(this.getrow(),"subgrupo")
		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
		if this.getitemstring(fila,"subgrupo")='' or isnull(this.getitemstring(fila,"subgrupo")) then
			menu.m_con_1.m_filtrarpor.enabled=false
		else
			menu.m_con_1.m_filtrarpor.enabled=true
		end if
		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
case "mayor"
		sle_1.text=this.getitemstring(fila,"grupo")+this.getitemstring(this.getrow(),"subgrupo")+this.getitemstring(this.getrow(),"mayor")
		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
		if this.getitemstring(fila,"mayor")='' or isnull(this.getitemstring(fila,"mayor")) then
			menu.m_con_1.m_filtrarpor.enabled=false
		else
			menu.m_con_1.m_filtrarpor.enabled=true
		end if
		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
case "auxiliar"
		sle_1.text=this.getitemstring(fila,"grupo")+this.getitemstring(this.getrow(),"subgrupo")+this.getitemstring(this.getrow(),"mayor")+this.getitemstring(fila,"auxiliar")
		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
		if this.getitemstring(fila,"auxiliar")='' or isnull(this.getitemstring(fila,"auxiliar")) then
			menu.m_con_1.m_filtrarpor.enabled=false
		else
			menu.m_con_1.m_filtrarpor.enabled=true
		end if
		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
case "ordinal"
		sle_1.text=this.getitemstring(fila,"grupo")+this.getitemstring(this.getrow(),"subgrupo")+this.getitemstring(this.getrow(),"mayor")+this.getitemstring(fila,"auxiliar")+this.getitemstring(fila,"ordinal")
		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
		if this.getitemstring(fila,"ordinal")='' or isnull(this.getitemstring(fila,"ordinal")) then
			menu.m_con_1.m_filtrarpor.enabled=false
		else
			menu.m_con_1.m_filtrarpor.enabled=true
		end if
		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
case "subauxi"
		sle_1.text=this.getitemstring(fila,"grupo")+this.getitemstring(this.getrow(),"subgrupo")+this.getitemstring(this.getrow(),"mayor")+this.getitemstring(fila,"auxiliar")+this.getitemstring(fila,"ordinal")+this.getitemstring(fila,"subauxi")
		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
		if this.getitemstring(fila,"subauxi")='' or isnull(this.getitemstring(fila,"subauxi")) then
			menu.m_con_1.m_filtrarpor.enabled=false
		else
			menu.m_con_1.m_filtrarpor.enabled=true
		end if
		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
case "subordinal"
		sle_1.text=this.getitemstring(fila,"grupo")+this.getitemstring(this.getrow(),"subgrupo")+this.getitemstring(this.getrow(),"mayor")+this.getitemstring(fila,"auxiliar")+this.getitemstring(fila,"ordinal")+this.getitemstring(fila,"subauxi")+this.getitemstring(fila,"subordinal")
		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
		if this.getitemstring(fila,"subordinal")='' or isnull(this.getitemstring(fila,"subordinal")) then
			menu.m_con_1.m_filtrarpor.enabled=false
		else
			menu.m_con_1.m_filtrarpor.enabled=true
		end if
		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
case "nivel1"
		sle_1.text=this.getitemstring(fila,"grupo")+this.getitemstring(this.getrow(),"subgrupo")+this.getitemstring(this.getrow(),"mayor")+this.getitemstring(fila,"auxiliar")+this.getitemstring(fila,"ordinal")+this.getitemstring(fila,"subauxi")+this.getitemstring(fila,"subordinal")+this.getitemstring(fila,"nivel1")
		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
		if this.getitemstring(fila,"nivel1")='' or isnull(this.getitemstring(fila,"nivel1")) then
			menu.m_con_1.m_filtrarpor.enabled=false
		else
			menu.m_con_1.m_filtrarpor.enabled=true
		end if
		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
END CHOOSE

end event

event rowfocuschanged;long fila
fila = this.getrow()
if fila <= 0 then return
st_cuenta.text = this.GetItemString(fila,"descrip")
st_regi.text = this.GetItemString(fila,"codtotal")
if this.GetItemString(fila,"Movimiento") = "1" then
	st_mvto.text = "ES DE MVTO."
else
	st_mvto.text = "NO ES DE MVTO."
end if
if this.GetItemString(fila,"tipo") = "0" then
	st_nat.text="Ingreso"
elseif this.GetItemString(fila,"tipo") = "1" then
	st_nat.text="Gasto"
end if
st_1.text="Reg. "+string(fila)+" de "+string(this.rowcount())

end event

event itemfocuschanged;f_semovio(this,i_codemp,{"cta_ajuste",'cta_cpartida' })


end event

event getfocus;f_semovio(this,i_codemp,{"cta_ajuste",'cta_cpartida' })


end event

event retrieveend;dec ingresos, gastos,trasl,adic,recorte
SELECT Sum(pre_plan.planeado_inicial) , Sum(v_pre_suma_acum.acum_traslado) , 
Sum(v_pre_suma_acum.acum_adicion) , Sum(v_pre_suma_acum.acum_recorte) 
INTO :ingresos,:trasl,:adic,:recorte
FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
WHERE pre_plan.cod_vigencia=:vigencia AND pre_plan.tipo='0' AND pre_plan.movimiento='1';
if sqlca.sqlcode=-1 then MessageBox('Error leyendo Ingresos',sqlca.sqlerrtext)
if isnull(ingresos) then gastos=0
if isnull(trasl) then trasl=0
if isnull(adic) then adic=0
if isnull(recorte) then recorte=0
ingresos+=trasl+adic+recorte
SELECT Sum(pre_plan.planeado_inicial) , Sum(v_pre_suma_acum.acum_traslado) , 
Sum(v_pre_suma_acum.acum_adicion) , Sum(v_pre_suma_acum.acum_recorte) 
INTO :gastos,:trasl,:adic,:recorte
FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
WHERE pre_plan.cod_vigencia=:vigencia AND pre_plan.tipo='1' AND pre_plan.movimiento='1';
if sqlca.sqlcode=-1 then MessageBox('Error leyendo gastos',sqlca.sqlerrtext)
if isnull(gastos) then gastos=0
if isnull(trasl) then trasl=0
if isnull(adic) then adic=0
if isnull(recorte) then recorte=0
gastos+=trasl+adic+recorte
em_1.Text = string(ingresos)
em_2.Text = string(gastos)
em_3.Text = string(ingresos - gastos)
end event

type st_regi from statictext within tabp_1
integer x = 5
integer y = 28
integer width = 430
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_cuenta from statictext within tabp_1
integer x = 434
integer y = 28
integer width = 1536
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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
string facename = "Arial"
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
string facename = "Arial"
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
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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
integer width = 5637
integer height = 1640
long backcolor = 67108864
string text = "Grupo / Subgrupo / Mayor"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las cuentas Grupo , subgrupo y Mayor"
pb_del_cta pb_del_cta
pb_new_grupo pb_new_grupo
pb_del_grupo pb_del_grupo
pb_new_cta pb_new_cta
pb_del_mayor pb_del_mayor
pb_new_mayor pb_new_mayor
dw_cuenta dw_cuenta
dw_grupo dw_grupo
dw_mayor dw_mayor
end type

on tabp_2.create
this.pb_del_cta=create pb_del_cta
this.pb_new_grupo=create pb_new_grupo
this.pb_del_grupo=create pb_del_grupo
this.pb_new_cta=create pb_new_cta
this.pb_del_mayor=create pb_del_mayor
this.pb_new_mayor=create pb_new_mayor
this.dw_cuenta=create dw_cuenta
this.dw_grupo=create dw_grupo
this.dw_mayor=create dw_mayor
this.Control[]={this.pb_del_cta,&
this.pb_new_grupo,&
this.pb_del_grupo,&
this.pb_new_cta,&
this.pb_del_mayor,&
this.pb_new_mayor,&
this.dw_cuenta,&
this.dw_grupo,&
this.dw_mayor}
end on

on tabp_2.destroy
destroy(this.pb_del_cta)
destroy(this.pb_new_grupo)
destroy(this.pb_del_grupo)
destroy(this.pb_new_cta)
destroy(this.pb_del_mayor)
destroy(this.pb_new_mayor)
destroy(this.dw_cuenta)
destroy(this.dw_grupo)
destroy(this.dw_mayor)
end on

type pb_del_cta from picturebutton within tabp_2
event mousemove pbm_mousemove
string tag = "Borrar cuenta Mayor"
integer x = 5458
integer y = 1452
integer width = 146
integer height = 128
integer taborder = 9
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar cuenta Mayor"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if tab_1.tabp_3.dw_subcta.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee auxiliares")
	return
elseif (estado = '1' and abierto and dw_cuenta.GetItemNumber(dw_cuenta.GetRow(),'nuevo')=1) or estado = '0' then
	if dw_cuenta.rowcount() > 0 then
		dw_cuenta.deleterow(0)
		cambio=true
		i_cam_cuenta=true
	end if
end if

end event

type pb_new_grupo from picturebutton within tabp_2
event mousemove pbm_mousemove
string tag = "Insertar nueva Cuenta de subgrupo"
integer x = 5458
integer y = 660
integer width = 146
integer height = 128
integer taborder = 5
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string powertiptext = "Insertar nueva Cuenta de subgrupo"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if f_new(dw_grupo,dw_mayor,2) = -1 then return
f_rowfocuschanged(dw_grupo)
cambio = true 
i_cam_grupo = true

end event

type pb_del_grupo from picturebutton within tabp_2
event mousemove pbm_mousemove
string tag = "Borrar subgrupo"
integer x = 5458
integer y = 808
integer width = 146
integer height = 128
integer taborder = 6
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar subgrupo"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if tab_1.tabp_3.dw_subcta.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas Mayores")
	return
elseif (estado = '1' and abierto and dw_grupo.GetItemNumber(dw_grupo.GetRow(),'nuevo')=1) or estado = '0' then
	if dw_grupo.rowcount() > 0 then
		dw_grupo.deleterow(0)
		cambio=true
		i_cam_grupo=true
	end if
end if

end event

type pb_new_cta from picturebutton within tabp_2
event mousemove pbm_mousemove
string tag = "Insertar nueva cuenta Mayor"
integer x = 5458
integer y = 1304
integer width = 146
integer height = 128
integer taborder = 8
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string powertiptext = "Insertar nueva cuenta Mayor"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if f_new(dw_cuenta,dw_grupo,3) = -1 then return
f_rowfocuschanged(dw_cuenta)
i_cam_cuenta=true
cambio=true
end event

type pb_del_mayor from picturebutton within tabp_2
event mousemove pbm_mousemove
string tag = "Borrar Cuenta de Grupo"
integer x = 5458
integer y = 172
integer width = 146
integer height = 128
integer taborder = 3
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar Cuenta de Grupo"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if dw_grupo.rowcount()>0 then
	messagebox("Atención","Esta cuenta no se puede borrar ya que posee subgrupos")
	return
elseif (estado = '1' and abierto and dw_mayor.GetItemNumber(dw_mayor.GetRow(),'nuevo')=1) or estado = '0' then
	if dw_mayor.rowcount() > 0 then
		dw_mayor.deleterow(0)
		cambio = true
		i_cam_mayor = true
	end if
end if

end event

type pb_new_mayor from picturebutton within tabp_2
event mousemove pbm_mousemove
string tag = "Insertar nueva Cuenta de Grupo"
integer x = 5458
integer y = 28
integer width = 146
integer height = 128
integer taborder = 2
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Insertar nueva Cuenta de Grupo"
end type

event clicked;if vigencia = 0 or isnull(vigencia) then return
if (estado = '1' and not abierto) or estado = '2' then Return
dw_mayor.scrolltorow(dw_mayor.insertrow(0))
dw_mayor.setitem(dw_mayor.getrow(),"cod_vigencia",vigencia)
dw_mayor.setitem(dw_mayor.getrow(),"nuevo",1)
dw_mayor.setcolumn("grupo")
f_rowfocuschanged(dw_mayor)
dw_mayor.setfocus()
cambio = true
i_cam_mayor = true

end event

type dw_cuenta from datawindow within tabp_2
event keyup pbm_dwnkey
integer x = 5
integer y = 1280
integer width = 5394
integer height = 600
integer taborder = 7
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mayor_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila = this.getrow()
tab_1.tabp_3.dw_subcta.reset()
tab_1.tabp_3.dw_n1.reset()
tab_1.tabp_3.dw_n2.reset()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila < 1 then return
f_rowFocuschanged(this)
tab_1.tabp_3.dw_subcta.retrieve(vigencia,this.getitemstring(fila,"grupo"),this.getitemstring(fila,"subgrupo"),this.getitemstring(fila,"mayor"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,tab_1.tabp_3.dw_subcta,dw_grupo)
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
if i_cam_n5 then cambios+="-Nivel5~r~n"
if i_cam_n4 then cambios+="-Nivel4~r~n"
if i_cam_n3 then cambios+="-Nivel3~r~n"
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_subcta then cambios+="-Subcuentas~r~n"
if i_cam_n5 or i_cam_n4 or i_cam_n3 or i_cam_n2 or i_cam_n1 or i_cam_subcta then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n5=false
			i_cam_n4=false
			i_cam_n3=false
			i_cam_n2=false
			i_cam_n1=false
			i_cam_subcta=false
			if not i_cam_gral and not i_cam_mayor and not i_cam_grupo and not i_cam_cuenta then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

type dw_grupo from datawindow within tabp_2
event keyup pbm_dwnkey
integer x = 5
integer y = 648
integer width = 5390
integer height = 600
integer taborder = 4
string title = "none"
string dataobject = "dw_subgrupo_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila = this.getrow()
dw_cuenta.reset()
tab_1.tabp_3.dw_subcta.reset()
tab_1.tabp_3.dw_n1.reset()
tab_1.tabp_3.dw_n2.reset()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila < 1 then return
f_rowFocuschanged(this)


dw_cuenta.retrieve(vigencia,this.getitemstring(fila,"grupo"),this.getitemstring(fila,"subgrupo"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_cuenta,dw_mayor)
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
if i_cam_n5 then cambios+="-Nivel5~r~n"
if i_cam_n4 then cambios+="-Nivel4~r~n"
if i_cam_n3 then cambios+="-Nivel3~r~n"
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_subcta then cambios+="-Subcuentas~r~n"
if i_cam_cuenta then cambios+="-Nivel de Cuentas~r~n"
if i_cam_n5 or i_cam_n4 or i_cam_n3 or i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n5=false
			i_cam_n4=false
			i_cam_n3=false
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

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

type dw_mayor from datawindow within tabp_2
event keyup pbm_dwnkey
event teclea pbm_dwnkey
integer y = 32
integer width = 5399
integer height = 600
integer taborder = 1
string title = "none"
string dataobject = "dw_grupo_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event teclea;if this.getcolumnname() = "cta_contable" then
	if isNull(this.getItemString(this.GetRow(),'cod_empresa')) then
		messageBox('Aviso','Debe seleccionar EMPRESA')
		Return
	end if
	f_busca_cuenta(key,this.getItemString(this.GetRow(),'cod_empresa'),this)
end if
end event

event constructor;this.settransobject(sqlca)
end event

event rowfocuschanged;long fila
dw_cuenta.reset()
dw_grupo.reset()
tab_1.tabp_3.dw_subcta.reset()
tab_1.tabp_3.dw_n1.reset()
tab_1.tabp_3.dw_n2.reset()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()

fila = this.getrow()
if fila < 1 then return
f_rowFocuschanged(this)
dw_grupo.retrieve(vigencia,this.GetItemString(fila,"grupo"))

end event

event retrieveend;this.sort()
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;datawindow dw_null
setNull(dw_null)
choose case f_itemchanged(this,dw_grupo, dw_null)
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
if i_cam_n5 then cambios+="-Nivel5~r~n"
if i_cam_n4 then cambios+="-Nivel4~r~n"
if i_cam_n3 then cambios+="-Nivel3~r~n"
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_subcta then cambios+="-Subcuentas~r~n"
if i_cam_cuenta then cambios+="-Nivel de Cuentas~r~n"
if i_cam_grupo then cambios+="-Grupo~r~n"
if i_cam_n5 or i_cam_n4 or i_cam_n3 or i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta or i_cam_grupo then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n5=false
			i_cam_n4=false
			i_cam_n3=false
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

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

type tabp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5637
integer height = 1640
long backcolor = 67108864
string text = "Auxiliar / Ordinal / Subauxiliar"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las cuentas Auxiliares, Ordinales y Subauxiliares"
pb_del_n2 pb_del_n2
pb_new_n2 pb_new_n2
pb_del_n1 pb_del_n1
pb_new_n1 pb_new_n1
pb_del_subcta pb_del_subcta
pb_new_subcta pb_new_subcta
dw_n2 dw_n2
dw_n1 dw_n1
dw_subcta dw_subcta
end type

on tabp_3.create
this.pb_del_n2=create pb_del_n2
this.pb_new_n2=create pb_new_n2
this.pb_del_n1=create pb_del_n1
this.pb_new_n1=create pb_new_n1
this.pb_del_subcta=create pb_del_subcta
this.pb_new_subcta=create pb_new_subcta
this.dw_n2=create dw_n2
this.dw_n1=create dw_n1
this.dw_subcta=create dw_subcta
this.Control[]={this.pb_del_n2,&
this.pb_new_n2,&
this.pb_del_n1,&
this.pb_new_n1,&
this.pb_del_subcta,&
this.pb_new_subcta,&
this.dw_n2,&
this.dw_n1,&
this.dw_subcta}
end on

on tabp_3.destroy
destroy(this.pb_del_n2)
destroy(this.pb_new_n2)
destroy(this.pb_del_n1)
destroy(this.pb_new_n1)
destroy(this.pb_del_subcta)
destroy(this.pb_new_subcta)
destroy(this.dw_n2)
destroy(this.dw_n1)
destroy(this.dw_subcta)
end on

type pb_del_n2 from picturebutton within tabp_3
event mousemove pbm_mousemove
string tag = "Borrar cuenta Subauxiliar"
integer x = 5426
integer y = 1444
integer width = 146
integer height = 128
integer taborder = 9
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar cuenta Subauxiliar"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if tab_1.tabp_4.dw_n3.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas subordinales")
	return
elseif (estado = '1' and abierto and dw_n2.GetItemNumber(dw_n2.GetRow(),'nuevo')=1) or estado = '0' then
	if dw_n2.rowcount() > 0 then
		dw_n2.deleterow(0)
		cambio=true
		i_cam_n2=true
	end if
end if
end event

type pb_new_n2 from picturebutton within tabp_3
event mousemove pbm_mousemove
string tag = "Insertar cuenta Subauxiliar"
integer x = 5426
integer y = 1300
integer width = 146
integer height = 128
integer taborder = 8
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Insertar cuenta Subauxiliar"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if f_new(dw_n2,dw_n1,6) = -1 then return
f_rowfocuschanged(dw_n2)
i_cam_n2=true
cambio=true
end event

type pb_del_n1 from picturebutton within tabp_3
event mousemove pbm_mousemove
string tag = "Borrar cuenta Ordinal"
integer x = 5426
integer y = 800
integer width = 146
integer height = 128
integer taborder = 6
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar cuenta Ordinal"
end type

event clicked;if (estado = '1' and not abierto ) or estado = '2' then Return
if tab_1.tabp_3.dw_n2.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas subauxiliares")
	return
elseif (estado = '1' and abierto and dw_n1.GetItemNumber(dw_n1.GetRow(),'nuevo')=1) or estado = '0' then 
	if dw_n1.rowcount() > 0 then
		dw_n1.deleterow(0)
		cambio=true
		i_cam_n1=true
	end if
end if
end event

type pb_new_n1 from picturebutton within tabp_3
event mousemove pbm_mousemove
string tag = "Insertar nueva cuenta Ordinal"
integer x = 5426
integer y = 652
integer width = 146
integer height = 128
integer taborder = 5
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Insertar nueva cuenta Ordinal"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if f_new(dw_n1,dw_subcta,5) = -1 then return
f_rowfocuschanged(dw_n1)
i_cam_n1=true
cambio=true
end event

type pb_del_subcta from picturebutton within tabp_3
event mousemove pbm_mousemove
string tag = "Borrar cuenta Auxiliar"
integer x = 5426
integer y = 180
integer width = 146
integer height = 128
integer taborder = 3
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar cuenta Auxiliar"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if tab_1.tabp_3.dw_n1.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas ordinales")
	return
elseif (estado = '1' and abierto and dw_subcta.GetItemNumber(dw_subcta.GetRow(),'nuevo')=1) or estado = '0' then
	if dw_subcta.rowcount() > 0 then
		dw_subcta.deleterow(0)
		cambio=true
		i_cam_subcta=true
	end if
end if

end event

type pb_new_subcta from picturebutton within tabp_3
event mousemove pbm_mousemove
string tag = "Insertar nueva cuenta Auxiliar"
integer x = 5426
integer y = 32
integer width = 146
integer height = 128
integer taborder = 2
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Insertar nueva cuenta Auxiliar"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if f_new(dw_subcta,tab_1.tabp_2.dw_cuenta,4) = -1 then return
f_rowfocuschanged(dw_subcta)
i_cam_subcta=true
cambio=true
end event

type dw_n2 from datawindow within tabp_3
event keyup pbm_dwnkey
integer y = 1256
integer width = 5367
integer height = 564
integer taborder = 7
string title = "none"
string dataobject = "dw_subauxi_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila = this.getrow()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila < 1 then return
f_rowFocuschanged(this)


tab_1.tabp_4.dw_n3.retrieve(vigencia,this.getitemstring(fila,"grupo"),this.getitemstring(fila,"subgrupo"),this.getitemstring(fila,"mayor"),this.getitemstring(fila,"auxiliar"),this.getitemstring(fila,"ordinal"),this.getitemstring(fila,"subauxi"))

end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,tab_1.tabp_4.dw_n3,dw_n1)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_n2=true
end choose
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_n2=true
cambio=true
end event

event rowfocuschanging;string cambios=''
if i_cam_n5 then cambios+="-Nivel5~r~n"
if i_cam_n4 then cambios+="-Nivel4~r~n"
if i_cam_n3 then cambios+="-Nivel3~r~n"
if i_cam_n5 or i_cam_n4 or i_cam_n3 then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n5=false
			i_cam_n4=false
			i_cam_n3=false
			if not i_cam_gral and not i_cam_mayor and not i_cam_grupo and not i_cam_cuenta and not i_cam_subcta and not i_cam_n1 and not i_cam_n2 then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

type dw_n1 from datawindow within tabp_3
event keyup pbm_dwnkey
integer y = 632
integer width = 5362
integer height = 600
integer taborder = 4
string title = "none"
string dataobject = "dw_ordinal_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila = this.getrow()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()

if fila < 1 then return
f_rowFocuschanged(this)
dw_n2.reset()

dw_n2.retrieve(vigencia,this.getitemstring(fila,"grupo"),this.getitemstring(fila,"subgrupo"),this.getitemstring(fila,"mayor"),this.getitemstring(fila,"auxiliar"),this.getitemstring(fila,"ordinal"))

end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n2,dw_subcta)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_n1=true
end choose

end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_n1=true
cambio=true
end event

event rowfocuschanging;string cambios=''
if i_cam_n5 then cambios+="-Nivel5~r~n"
if i_cam_n4 then cambios+="-Nivel4~r~n"
if i_cam_n3 then cambios+="-Nivel3~r~n"
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n5 or i_cam_n4 or i_cam_n3 or i_cam_n2 then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n5=false
			i_cam_n4=false
			i_cam_n3=false
			i_cam_n2=false
			if not i_cam_gral and not i_cam_mayor and not i_cam_grupo and not i_cam_cuenta and not i_cam_subcta and not i_cam_n1 then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

type dw_subcta from datawindow within tabp_3
event keyup pbm_dwnkey
integer y = 20
integer width = 5367
integer height = 600
integer taborder = 1
string title = "none"
string dataobject = "dw_auxiliar_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila = this.getrow()
dw_n1.reset()
dw_n2.reset()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila < 1 then return
f_rowFocuschanged(this)


dw_n1.retrieve(vigencia,this.getitemstring(fila,"grupo"),this.getitemstring(fila,"subgrupo"),this.getitemstring(fila,"mayor"),this.getitemstring(fila,"auxiliar"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n1,tab_1.tabp_2.dw_cuenta)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_subcta=true
end choose

end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_subcta=true
cambio=true

end event

event rowfocuschanging;string cambios=''
if i_cam_n5 then cambios+="-Nivel5~r~n"
if i_cam_n4 then cambios+="-Nivel4~r~n"
if i_cam_n3 then cambios+="-Nivel3~r~n"
if i_cam_n2 then cambios+="-Nivel2~r~n"
if i_cam_n1 then cambios+="-Nivel1~r~n"
if i_cam_n6  or i_cam_n5 or i_cam_n4 or i_cam_n3 or i_cam_n2 or i_cam_n1 then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n6=false
			i_cam_n5=false
			i_cam_n4=false
			i_cam_n3=false
			i_cam_n2=false
			i_cam_n1=false
			if not i_cam_gral and not i_cam_mayor and not i_cam_grupo and not i_cam_cuenta and not i_cam_subcta then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

type tabp_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5637
integer height = 1640
long backcolor = 67108864
string text = "Subordinal / Nivel 1-2"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las cuentas Suordinal, Nivel 1 y 2"
pb_del_n5 pb_del_n5
pb_new_n5 pb_new_n5
pb_del_n4 pb_del_n4
pb_new_n4 pb_new_n4
pb_del_n3 pb_del_n3
pb_new_n3 pb_new_n3
dw_n5 dw_n5
dw_n3 dw_n3
dw_n4 dw_n4
end type

on tabp_4.create
this.pb_del_n5=create pb_del_n5
this.pb_new_n5=create pb_new_n5
this.pb_del_n4=create pb_del_n4
this.pb_new_n4=create pb_new_n4
this.pb_del_n3=create pb_del_n3
this.pb_new_n3=create pb_new_n3
this.dw_n5=create dw_n5
this.dw_n3=create dw_n3
this.dw_n4=create dw_n4
this.Control[]={this.pb_del_n5,&
this.pb_new_n5,&
this.pb_del_n4,&
this.pb_new_n4,&
this.pb_del_n3,&
this.pb_new_n3,&
this.dw_n5,&
this.dw_n3,&
this.dw_n4}
end on

on tabp_4.destroy
destroy(this.pb_del_n5)
destroy(this.pb_new_n5)
destroy(this.pb_del_n4)
destroy(this.pb_new_n4)
destroy(this.pb_del_n3)
destroy(this.pb_new_n3)
destroy(this.dw_n5)
destroy(this.dw_n3)
destroy(this.dw_n4)
end on

type pb_del_n5 from picturebutton within tabp_4
event mousemove pbm_mousemove
string tag = "Borrar Cuenta de Nivel 2"
integer x = 5426
integer y = 1416
integer width = 146
integer height = 128
integer taborder = 9
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar Cuenta de Nivel 2"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if dw_n5.rowcount()>0 and (estado = '1' and abierto and dw_n5.GetItemNumber(dw_n5.GetRow(),'nuevo')=1) or estado = '0' then
	dw_n5.deleterow(0)
	cambio=true
	i_cam_n5=true
end if

end event

type pb_new_n5 from picturebutton within tabp_4
event mousemove pbm_mousemove
string tag = "Insertar nueva Cuenta de Nivel 2"
integer x = 5426
integer y = 1272
integer width = 146
integer height = 128
integer taborder = 8
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Insertar nueva Cuenta de Nivel 2"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if f_new(dw_n5,dw_n4,9) = -1 then return
f_rowfocuschanged(dw_n5)
i_cam_n5=true
cambio=true
end event

type pb_del_n4 from picturebutton within tabp_4
event mousemove pbm_mousemove
string tag = "Borrar Cuenta de Nivel 1"
integer x = 5426
integer y = 816
integer width = 146
integer height = 128
integer taborder = 6
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar Cuenta de Nivel 1"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if tab_1.tabp_4.dw_n5.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 2")
	return
elseif (estado = '1' and abierto and dw_n4.GetItemNumber(dw_n4.GetRow(),'nuevo')=1) or estado = '0' then
	if dw_n4.Rowcount() > 0 then
		dw_n4.deleterow(0)
		cambio=true
		i_cam_n4=true
	end if
end if

end event

type pb_new_n4 from picturebutton within tabp_4
event mousemove pbm_mousemove
string tag = "Insertar nueva Cuenta de Nivel 1"
integer x = 5426
integer y = 668
integer width = 146
integer height = 128
integer taborder = 5
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Insertar nueva Cuenta de Nivel 1"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if f_new(dw_n4,dw_n3,8) = -1 then return
f_rowfocuschanged(dw_n4)
i_cam_n4=true
cambio=true

end event

type pb_del_n3 from picturebutton within tabp_4
event mousemove pbm_mousemove
string tag = "Borrar Cuenta Subordinal"
integer x = 5426
integer y = 208
integer width = 146
integer height = 128
integer taborder = 3
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Borrar Cuenta Subordinal"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if tab_1.tabp_4.dw_n4.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 1")
	return
elseif (estado = '1' and abierto and dw_n3.GetItemNumber(dw_n3.GetRow(),'nuevo')=1) or estado = '0' then
	if dw_n3.rowcount() > 0 then
		dw_n3.deleterow(0)
		cambio=true
		i_cam_n3=true
	end if
end if
end event

type pb_new_n3 from picturebutton within tabp_4
event mousemove pbm_mousemove
string tag = "Insertar nueva Cuenta Subordinal"
integer x = 5426
integer y = 64
integer width = 146
integer height = 128
integer taborder = 2
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string powertiptext = "Insertar nueva Cuenta Subordinal"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if f_new(dw_n3,tab_1.tabp_3.dw_n2,7) = -1 then return
f_rowfocuschanged(dw_n3)
i_cam_n3=true
cambio=true
end event

type dw_n5 from datawindow within tabp_4
event keyup pbm_dwnkey
integer y = 1268
integer width = 5358
integer height = 600
integer taborder = 7
string title = "none"
string dataobject = "dw_nivel2_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;datawindow dwnull
setnull(dwnull)
choose case f_itemchanged(this,dwnull,dw_n4)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_n5=true
end choose

end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_n5=true
cambio=true
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

event rowfocuschanged;long fila
fila = this.getrow()
tab_1.tabp_5.dw_n6.Reset()
if fila < 1 then return
f_rowFocuschanged(this)

tab_1.tabp_5.dw_n6.retrieve(vigencia,this.getitemstring(fila,"grupo"),this.getitemstring(fila,"subgrupo"),this.getitemstring(fila,"mayor"),this.getitemstring(fila,"auxiliar"),this.getitemstring(fila,"ordinal"),this.getitemstring(fila,"subauxi"),this.getitemstring(fila,"subordinal"),this.getitemstring(fila,"nivel1"),this.getitemstring(fila,"nivel2"))

end event

type dw_n3 from datawindow within tabp_4
event keyup pbm_dwnkey
integer y = 32
integer width = 5339
integer height = 600
integer taborder = 1
string title = "none"
string dataobject = "dw_subordi_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila = this.getrow()
dw_n4.reset()
dw_n5.reset()
if fila < 1 then return
f_rowFocuschanged(this)

dw_n4.retrieve(vigencia,this.getitemstring(fila,"grupo"),this.getitemstring(fila,"subgrupo"),this.getitemstring(fila,"mayor"),this.getitemstring(fila,"auxiliar"),this.getitemstring(fila,"ordinal"),this.getitemstring(fila,"subauxi"),this.getitemstring(fila,"subordinal"))

end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n4,tab_1.tabp_3.dw_n2)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_n3=true
end choose
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_n3=true
cambio=true
end event

event rowfocuschanging;string cambios=''
if i_cam_n5 then cambios+="-Nivel5~r~n"
if i_cam_n4 then cambios+="-Nivel4~r~n"
if i_cam_n5 or i_cam_n4 then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n5=false
			i_cam_n4=false
			if not i_cam_gral and not i_cam_n3 and not i_cam_mayor and not i_cam_grupo and not i_cam_cuenta and not i_cam_subcta and not i_cam_n1 and not i_cam_n2 then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

type dw_n4 from datawindow within tabp_4
event keyup pbm_dwnkey
integer y = 648
integer width = 5330
integer height = 600
integer taborder = 4
boolean bringtotop = true
string title = "none"
string dataobject = "dw_nivel1_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila = this.getrow()
dw_n5.Reset()
if fila < 1 then return
f_rowFocuschanged(this)

dw_n5.retrieve(vigencia,this.getitemstring(fila,"grupo"),this.getitemstring(fila,"subgrupo"),this.getitemstring(fila,"mayor"),this.getitemstring(fila,"auxiliar"),this.getitemstring(fila,"ordinal"),this.getitemstring(fila,"subauxi"),this.getitemstring(fila,"subordinal"),this.getitemstring(fila,"nivel1"))

end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n5,dw_n3)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_n4=true
end choose
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_n4=true
cambio=true
end event

event rowfocuschanging;string cambios=''
if i_cam_n5 then cambios+="-Nivel5~r~n"
if i_cam_n5 then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cam_n5=false
			if not i_cam_gral and not i_cam_n4 and not i_cam_n3 and not i_cam_mayor and not i_cam_grupo and not i_cam_cuenta and not i_cam_subcta and not i_cam_n1 and not i_cam_n2 then cambio=false //debe preguntar por todos los de arriba de él
		case 3
			return 1
	end choose
end if
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

type tabp_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5637
integer height = 1640
long backcolor = 67108864
string text = "Nivel 3"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
pb_del_n6 pb_del_n6
pb_new_n6 pb_new_n6
dw_n6 dw_n6
end type

on tabp_5.create
this.pb_del_n6=create pb_del_n6
this.pb_new_n6=create pb_new_n6
this.dw_n6=create dw_n6
this.Control[]={this.pb_del_n6,&
this.pb_new_n6,&
this.dw_n6}
end on

on tabp_5.destroy
destroy(this.pb_del_n6)
destroy(this.pb_new_n6)
destroy(this.dw_n6)
end on

type pb_del_n6 from picturebutton within tabp_5
string tag = "Borrar Cuenta Nivel3"
integer x = 5390
integer y = 196
integer width = 146
integer height = 128
integer taborder = 13
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if dw_n6.rowcount()>0 and (estado = '1' and abierto and tab_1.tabp_4.dw_n5.GetItemNumber(tab_1.tabp_4.dw_n5.GetRow(),'nuevo')=1) or estado = '0' then
	dw_n6.deleterow(0)
	cambio=true
	i_cam_n6=true
end if

end event

type pb_new_n6 from picturebutton within tabp_5
string tag = "Insertar nueva Nivel 3"
integer x = 5390
integer y = 44
integer width = 146
integer height = 128
integer taborder = 12
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
end type

event clicked;if (estado = '1' and not abierto) or estado = '2' then Return
if f_new(dw_n6,tab_1.tabp_4.dw_n5,10) = -1 then return
f_rowfocuschanged(dw_n6)
i_cam_n5=true
cambio=true
end event

type dw_n6 from datawindow within tabp_5
integer y = 32
integer width = 5339
integer height = 600
integer taborder = 13
string dataobject = "dw_nivel3_ppto"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_n6=true
cambio=true
end event

event doubleclicked;f_doubleclicked(this.getcolumnname(),this)
end event

event itemchanged;datawindow dwnull
setnull(dwnull)
choose case f_itemchanged(this,dwnull,tab_1.tabp_4.dw_n5)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_n6=true
end choose
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;f_rowFocuschanged(this)
end event

type pb_1 from picturebutton within w_plan_ppto
event mousemove pbm_mousemove
string tag = "Guardar &Definitivo"
integer x = 3634
integer y = 32
integer width = 146
integer height = 128
integer taborder = 22
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "              &d"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
string powertiptext = "Guardar &Definitivo"
end type

event clicked;dec ingresos, gastos,trasl,adic,recorte
string err
if isNull(vigencia) or vigencia = 0 then Return

if abierto then
elseif estado = '1' then
	MessageBox('Aviso','La vigencia es definitiva. No puede modificarse')
	Return 0
end if

if messageBox('Aviso','Al grabar Definitivamente no podrá hacer modificaciones sobre los montos. Desea continuar?',QUESTION!,YESNOCANCEL!) = 1 then
	if grabar() = 1 then
		SELECT Sum(pre_plan.planeado_inicial) , Sum(v_pre_suma_acum.acum_traslado) , 
		Sum(v_pre_suma_acum.acum_adicion) , Sum(v_pre_suma_acum.acum_recorte) 
		INTO :ingresos,:trasl,:adic,:recorte
		FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
		WHERE pre_plan.cod_vigencia=:vigencia AND pre_plan.tipo='0' AND pre_plan.movimiento='1';
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			Rollback;
			MessageBox('Error leyendo Ingresos',err)
			Return -1
		end if
		if isnull(ingresos) then gastos=0
		if isnull(trasl) then trasl=0
		if isnull(adic) then adic=0
		if isnull(recorte) then recorte=0
		ingresos+=trasl+adic+recorte
		SELECT Sum(pre_plan.planeado_inicial) , Sum(v_pre_suma_acum.acum_traslado) , 
		Sum(v_pre_suma_acum.acum_adicion) , Sum(v_pre_suma_acum.acum_recorte) 
		INTO :gastos,:trasl,:adic,:recorte
		FROM pre_plan LEFT outer JOIN v_pre_suma_acum ON (pre_plan.CodTotal = v_pre_suma_acum.a_codtotal) AND (pre_plan.cod_vigencia = v_pre_suma_acum.a_codvigencia)
		WHERE pre_plan.cod_vigencia=:vigencia AND pre_plan.tipo='1' AND pre_plan.movimiento='1';
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			Rollback;
			MessageBox('Error leyendo gastos',err)
			Return -1
		end if
		if isnull(gastos) then gastos=0
		if isnull(trasl) then trasl=0
		if isnull(adic) then adic=0
		if isnull(recorte) then recorte=0
		gastos+=trasl+adic+recorte
		
		if ingresos <> gastos then
			Rollback;
			MessageBox('Error','Los ingresos difieren de los gastos (ingresos - gastos) = ' + string(ingresos - gastos,'#,#00'))
			Return -1
		end if
		
		update pre_vigencia set pplan = '1' where cod_vigencia = :vigencia;
		IF SQLCA.SQLCode = -1 THEN
			err=sqlca.sqlerrtext
			rollback;
			MessageBox("Error actualizando vigencia", err)
			Return -1
		END IF
		commit;
		dw_1.triggerevent(itemchanged!)
	end if
end if
abierto = FALSE
st_3.Text = 'Vigencia Definitiva'
Return 0

end event

type dw_muestras from datawindow within w_plan_ppto
integer x = 1550
integer y = 8
integer width = 2085
integer height = 152
integer taborder = 30
string title = "none"
string dataobject = "dw_muestras_ppto"
boolean border = false
boolean livescroll = true
end type

type pb_abrir from picturebutton within w_plan_ppto
event mousemove pbm_mousemove
string tag = "Guardar &Definitivo"
boolean visible = false
integer x = 3927
integer y = 32
integer width = 146
integer height = 128
integer taborder = 32
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "              &d"
boolean originalsize = true
string picturename = "abrir2.gif"
string disabledname = "d_abrir2.gif"
string powertiptext = "Abrir Plan"
end type

event clicked;abierto = TRUE
MessageBox('Aviso','Puede agregar cuentas y cambiar o borrar cuentas nuevas')
st_3.Text = 'Vigencia Abierta'
update pre_vigencia set pplan = '0' where cod_vigencia = :vigencia;
IF SQLCA.SQLCode = -1 THEN
	rollback;
	MessageBox("Error actualizando vigencia", sqlca.sqlerrtext)
	Return -1
END IF
commit;
dw_1.triggerevent(itemchanged!)
end event

