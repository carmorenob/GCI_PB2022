$PBExportHeader$w_plan2.srw
forward
global type w_plan2 from w_center
end type
type dw_1 from datawindow within w_plan2
end type
type sle_1 from singlelineedit within w_plan2
end type
type dw_muestras from datawindow within w_plan2
end type
type st_2 from statictext within w_plan2
end type
type tab_1 from tab within w_plan2
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
type pb_new_grupo from picturebutton within tabp_2
end type
type pb_del_grupo from picturebutton within tabp_2
end type
type pb_new_cuenta from picturebutton within tabp_2
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
pb_new_cuenta pb_new_cuenta
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
type dw_n4 from datawindow within tabp_4
end type
type dw_n3 from datawindow within tabp_4
end type
type tabp_4 from userobject within tab_1
pb_del_n5 pb_del_n5
pb_new_n5 pb_new_n5
pb_del_n4 pb_del_n4
pb_new_n4 pb_new_n4
pb_del_n3 pb_del_n3
pb_new_n3 pb_new_n3
dw_n5 dw_n5
dw_n4 dw_n4
dw_n3 dw_n3
end type
type tab_1 from tab within w_plan2
tabp_1 tabp_1
tabp_2 tabp_2
tabp_3 tabp_3
tabp_4 tabp_4
end type
end forward

global type w_plan2 from w_center
string tag = "Realizó Cambios en el Plan Contable, desea guardarlos ?."
integer width = 4197
integer height = 2072
string title = " Plan Contable"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
windowstate windowstate = maximized!
string icon = "ribon_plancc.ico"
boolean center = false
dw_1 dw_1
sle_1 sle_1
dw_muestras dw_muestras
st_2 st_2
tab_1 tab_1
end type
global w_plan2 w_plan2

type variables
m_pop_conta menu
string filtro,i_codemp
boolean i_cam_mayor,i_cam_grupo,i_cam_cuenta,i_cam_subcta,i_cam_n1,i_cam_n2,i_cam_n3,i_cam_n4,i_cam_n5,i_cam_gral
long cuantas
datawindowchild idw_cc,idw_cc1,idw_cc2,idw_cc3,idw_cc4,idw_cc5,idw_cc6,idw_cc7,idw_cc8,idw_cc9
end variables

forward prototypes
public subroutine muestra2 (string mostrar, integer xpos, integer ypos)
public subroutine filtrar_1 (integer digitar)
public subroutine f_keyup (datawindow esta, keycode key)
public subroutine f_getfocus (datawindow esta)
public subroutine f_itemfocuschanged (string name_col, datawindow datawin)
public function boolean f_buttonclicked (long row, datawindow dw)
public function integer f_new (datawindow esta, datawindow padre, integer nivel)
public function integer f_chequea (datawindow esta)
public function integer f_actu_cuenta (string nivel, string nuevo, string pedazo_ante)
public function integer grabar ()
public function integer f_itemchanged (datawindow esta, datawindow hija, string data, datawindowchild pdw_cc)
end prototypes

public subroutine muestra2 (string mostrar, integer xpos, integer ypos);
end subroutine

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

public subroutine f_keyup (datawindow esta, keycode key);string colum
colum=esta.getcolumnname()
if colum="cta_ajuste" or colum= "cta_cpartida" or colum="cta_ajuste_dep" or colum="cta_cpartida_dep" then
	f_busca_cuenta(key,i_codemp,esta)
end if
end subroutine

public subroutine f_getfocus (datawindow esta);f_semovio(esta,i_codemp,{"cta_ajuste" ,"cta_cpartida" ,"cta_ajuste_dep" ,"cta_cpartida_dep"})

end subroutine

public subroutine f_itemfocuschanged (string name_col, datawindow datawin);f_semovio(datawin,i_codemp,{"cta_ajuste" ,"cta_cpartida" ,"cta_ajuste_dep" ,"cta_cpartida_dep" })




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
if padre.getitemstring(donde_ant,"movimiento")='1' then
	Messagebox("Atención","No se puede crear esta cuenta ya que su antecesor es de movimiento")
	return -1
end if
donde=esta.insertrow(0)
if nivel>=9 then
	esta.setitem(donde,"nivel4",padre.getitemstring(donde_ant,"nivel4"))
end if
if nivel>=8 then
	esta.setitem(donde,"nivel3",padre.getitemstring(donde_ant,"nivel3"))
end if
if nivel>=7 then
	esta.setitem(donde,"nivel2",padre.getitemstring(donde_ant,"nivel2"))
end if
if nivel>=6 then
	esta.setitem(donde,"nivel1",padre.getitemstring(donde_ant,"nivel1"))
end if
if nivel>=5 then
	esta.setitem(donde,"subcuenta",padre.getitemstring(donde_ant,"subcuenta"))
end if
if nivel>=4 then
	esta.setitem(donde,"cuenta",padre.getitemstring(donde_ant,"cuenta"))
end if
if nivel>=3 then
	esta.setitem(donde,"grupo",padre.getitemstring(donde_ant,"grupo"))
end if
if nivel>=2 then
	esta.setitem(donde,"mayor",padre.getitemstring(donde_ant,"mayor"))
end if
esta.scrolltorow(donde)
if esta.rowcount()>1 then
	long j
	for j=12 to 26
		esta.setitem(donde,j,esta.getitemstring(donde -1 ,j))
	next
	esta.setitem(donde,"vida_util",esta.getitemnumber(donde -1 , "vida_util"))
end if
esta.setitem(donde,"cod_empresa",i_codemp)
esta.setcolumn(nivel)
esta.setfocus()
return 1
end function

public function integer f_chequea (datawindow esta);long j
esta.accepttext()
for j=1 to esta.rowcount()
	if esta.getitemstring(j,"ajuste")='1' then
		if isnull(esta.getitemstring(j,"cta_ajuste")) or trim(esta.getitemstring(j,"cta_ajuste"))='' or isnull(esta.getitemstring(j,"cta_cpartida")) or trim(esta.getitemstring(j,"cta_cpartida"))='' then			return -1
	end if
	if esta.getitemstring(j,"deprecia")='1' then
		if isnull(esta.getitemstring(j,"cta_ajuste_dep")) or trim(esta.getitemstring(j,"cta_ajuste_dep"))='' or isnull(esta.getitemstring(j,"cta_cpartida_dep")) or trim(esta.getitemstring(j,"cta_cpartida_dep"))='' then return -1
	end if
next
return 1
end function

public function integer f_actu_cuenta (string nivel, string nuevo, string pedazo_ante);pedazo_ante+="%"
choose case nivel
	case "mayor"
		if g_motor='postgres' then
			UPDATE CONT_PLAN SET CodTotal = :nuevo||grupo||cuenta||subcuenta||nivel1||nivel2||nivel3||nivel4||nivel5, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		else
			UPDATE CONT_PLAN SET CodTotal = :nuevo+grupo+cuenta+subcuenta+nivel1+nivel2+nivel3+nivel4+nivel5, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = :nuevo||grupo||cuenta||subcuenta||nivel1||nivel2||nivel3||nivel4, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');			
		else
			UPDATE CONT_PLAN SET CodTotal = :nuevo+grupo+cuenta+subcuenta+nivel1+nivel2+nivel3+nivel4, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = :nuevo||grupo||cuenta||subcuenta||nivel1||nivel2||nivel3, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		else
			UPDATE CONT_PLAN SET CodTotal = :nuevo+grupo+cuenta+subcuenta+nivel1+nivel2+nivel3, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then		
			UPDATE CONT_PLAN SET CodTotal = :nuevo||grupo||cuenta||subcuenta||nivel1||nivel2, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');			
		else
			UPDATE CONT_PLAN SET CodTotal = :nuevo+grupo+cuenta+subcuenta+nivel1+nivel2, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = :nuevo||grupo||cuenta||subcuenta||nivel1, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');
		else
			UPDATE CONT_PLAN SET CodTotal = :nuevo+grupo+cuenta+subcuenta+nivel1, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = :nuevo||grupo||cuenta||subcuenta, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND subcuenta Is Not Null And subcuenta<>'' and (nivel1 is null or nivel1='');
		else
			UPDATE CONT_PLAN SET CodTotal = :nuevo+grupo+cuenta+subcuenta, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND subcuenta Is Not Null And subcuenta<>'' and (nivel1 is null or nivel1='');
		End IF
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subcuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = :nuevo||grupo||cuenta, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND cuenta Is Not Null And cuenta<>'' and (subcuenta is null or subcuenta='');
		else
			UPDATE CONT_PLAN SET CodTotal = :nuevo+grupo+cuenta, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND cuenta Is Not Null And cuenta<>'' and (subcuenta is null or subcuenta='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Cuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = :nuevo||grupo, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND grupo Is Not Null And grupo<>'' and (cuenta is null or cuenta='');
		else
			UPDATE CONT_PLAN SET CodTotal = :nuevo+grupo, mayor = :nuevo
			WHERE CodTotal Like :pedazo_ante AND grupo Is Not Null And grupo<>'' and (cuenta is null or cuenta='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Grupo",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		UPDATE CONT_PLAN SET CodTotal = :nuevo, mayor = :nuevo
		WHERE CodTotal like :pedazo_ante and (grupo is null or grupo='');
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Mayor",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "grupo"
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = mayor||:nuevo||cuenta||subcuenta||nivel1||nivel2||nivel3||nivel4||nivel5, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>''		
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+:nuevo+cuenta+subcuenta+nivel1+nivel2+nivel3+nivel4+nivel5, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		End IF
		
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = mayor||:nuevo||cuenta||subcuenta||nivel1||nivel2||nivel3||nivel4, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');			
		Else
			UPDATE CONT_PLAN SET CodTotal = mayor+:nuevo+cuenta+subcuenta+nivel1+nivel2+nivel3+nivel4, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		End IF
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then
			UPDATE CONT_PLAN SET CodTotal = mayor||:nuevo||cuenta||subcuenta||nivel1||nivel2||nivel3, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');			
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+:nuevo+cuenta+subcuenta+nivel1+nivel2+nivel3, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		End IF
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then		
			UPDATE CONT_PLAN SET CodTotal = mayor||:nuevo||cuenta||subcuenta||nivel1||nivel2, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');			
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+:nuevo+cuenta+subcuenta+nivel1+nivel2, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then				
			UPDATE CONT_PLAN SET CodTotal = mayor||:nuevo||cuenta||subcuenta||nivel1, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+:nuevo+cuenta+subcuenta+nivel1, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then				
			UPDATE CONT_PLAN SET CodTotal = mayor||:nuevo||cuenta||subcuenta, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND subcuenta Is Not Null And subcuenta<>'' and (nivel1 is null or nivel1='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+:nuevo+cuenta+subcuenta, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND subcuenta Is Not Null And subcuenta<>'' and (nivel1 is null or nivel1='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subcuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||:nuevo||cuenta, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND cuenta Is Not Null And cuenta<>'' and (subcuenta is null or subcuenta='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+:nuevo+cuenta, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND cuenta Is Not Null And cuenta<>'' and (subcuenta is null or subcuenta='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Cuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then				
			UPDATE CONT_PLAN SET CodTotal = mayor||:nuevo, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND grupo Is Not Null And grupo<>'' and (cuenta is null or cuenta='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+:nuevo, grupo = :nuevo
			WHERE CodTotal Like :pedazo_ante AND grupo Is Not Null And grupo<>'' and (cuenta is null or cuenta='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Grupo",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "cuenta"
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||:nuevo||subcuenta||nivel1||nivel2||nivel3||nivel4||nivel5, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';			
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+:nuevo+subcuenta+nivel1+nivel2+nivel3+nivel4+nivel5, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||:nuevo||subcuenta||nivel1||nivel2||nivel3||nivel4, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');	
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+:nuevo+subcuenta+nivel1+nivel2+nivel3+nivel4, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then				
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||:nuevo||subcuenta||nivel1||nivel2||nivel3, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');	
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+:nuevo+subcuenta+nivel1+nivel2+nivel3, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||:nuevo||subcuenta||nivel1||nivel2, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		else			
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+:nuevo+subcuenta+nivel1+nivel2, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then				
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||:nuevo||subcuenta||nivel1, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+:nuevo+subcuenta+nivel1, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then		
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||:nuevo||subcuenta, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND subcuenta Is Not Null And subcuenta<>'' and (nivel1 is null or nivel1='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+:nuevo+subcuenta, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND subcuenta Is Not Null And subcuenta<>'' and (nivel1 is null or nivel1='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subcuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||:nuevo, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND cuenta Is Not Null And cuenta<>'' and (subcuenta is null or subcuenta='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+:nuevo, cuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND cuenta Is Not Null And cuenta<>'' and (subcuenta is null or subcuenta='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando a Nivel de Cuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "subcuenta"
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||:nuevo||nivel1||nivel2||nivel3||nivel4||nivel5, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+:nuevo+nivel1+nivel2+nivel3+nivel4+nivel5, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||:nuevo||nivel1||nivel2||nivel3||nivel4, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5=''
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+:nuevo+nivel1+nivel2+nivel3+nivel4, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||:nuevo||nivel1||nivel2||nivel3, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+:nuevo+nivel1+nivel2+nivel3, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||:nuevo||nivel1||nivel2, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+:nuevo+nivel1+nivel2, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||:nuevo||nivel1, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+:nuevo+nivel1, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then				
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||:nuevo, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND subcuenta Is Not Null And subcuenta<>'' and (nivel1 is null or nivel1='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+:nuevo, subcuenta = :nuevo
			WHERE CodTotal Like :pedazo_ante AND subcuenta Is Not Null And subcuenta<>'' and (nivel1 is null or nivel1='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando subcuenta",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "nivel1"
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||:nuevo||nivel2||nivel3||nivel4||nivel5, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+:nuevo+nivel2+nivel3+nivel4+nivel5, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||:nuevo||nivel2||nivel3||nivel4, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+:nuevo+nivel2+nivel3+nivel4, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||:nuevo||nivel2||nivel3, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+:nuevo+nivel2+nivel3, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		end if
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||:nuevo||nivel2, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+:nuevo+nivel2, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then				
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||:nuevo, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');		
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+:nuevo, nivel1 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel1 Is Not Null And Nivel1<>'' and (nivel2 is null or nivel2='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel1",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "nivel2"
		if g_motor='postgres' then				
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||nivel1||:nuevo||nivel3||nivel4||nivel5, nivel2 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+nivel1+:nuevo+nivel3+nivel4+nivel5, nivel2 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then		
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||nivel1||:nuevo||nivel3||nivel4, nivel2 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+nivel1+:nuevo+nivel3+nivel4, nivel2 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||nivel1||:nuevo||nivel3, nivel2 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+nivel1+:nuevo+nivel3, nivel2 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||nivel1||:nuevo, nivel2 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+nivel1+:nuevo, nivel2 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel2 Is Not Null And Nivel2<>'' and (nivel3 is null or nivel3='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel2",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "nivel3"
		if g_motor='postgres' then			
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||nivel1||nivel2||:nuevo||nivel4||nivel5, nivel3 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+nivel1+nivel2+:nuevo+nivel4+nivel5, nivel3 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then	
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||nivel1||nivel2||:nuevo||nivel4, nivel3 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');			
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+nivel1+nivel2+:nuevo+nivel4, nivel3 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then		
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||nivel1||nivel2||:nuevo, nivel3 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');			
		else 
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+nivel1+nivel2+:nuevo, nivel3 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel3 Is Not Null And Nivel3<>'' and (nivel4 is null or nivel4='');
		End If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel3",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	case "nivel4"
		if g_motor='postgres' then		
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||nivel1||nivel2||nivel3||:nuevo||nivel5, nivel4 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+nivel1+nivel2+nivel3+:nuevo+nivel5, nivel4 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel5 Is Not Null And Nivel5<>'';
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel5",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
		if g_motor='postgres' then				
			UPDATE CONT_PLAN SET CodTotal = mayor||grupo||cuenta||subcuenta||nivel1||nivel2||nivel3||:nuevo, nivel4 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		else
			UPDATE CONT_PLAN SET CodTotal = mayor+grupo+cuenta+subcuenta+nivel1+nivel2+nivel3+:nuevo, nivel4 = :nuevo
			WHERE CodTotal Like :pedazo_ante AND Nivel4 Is Not Null And Nivel4<>'' and (nivel5 is null or nivel5='');
		end If
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando nivel4",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
end choose
commit;
return 1
end function

public function integer grabar ();w_principal.setmicrohelp("Guardando")
if i_cam_n5 then
	if f_chequea(tab_1.tabp_4.dw_n5)=-1 then
		rollback;
		messagebox("Atención","Complete todos los datos de las cuentas de Nivel 5")
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
		messagebox("Atención","Complete todos los datos de las cuentas de nivel 4")
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
		messagebox("Atención","Complete todos los datos de las cuentas de Nivel3")
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
		messagebox("Atención","Complete todos los datos de las cuentas de Nivel2")
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
		messagebox("Atención","Complete todos los datos de las cuentas de Nivel1")
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
		messagebox("Atención","Complete todos los datos de las Subcuentas")
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
		messagebox("Atención","Complete todos los datos de nivel de Cuentas")
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
		messagebox("Atención","Complete todos los datos de las Cuentas de grupo")
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
		messagebox("Atención","Complete todos los datos a nivel de mayor")
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
		messagebox("Atención","Complete todos los datos de Ajuste o Depreciación")
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
w_principal.setmicrohelp("Gestión Cliente Interno")
return 1
end function

public function integer f_itemchanged (datawindow esta, datawindow hija, string data, datawindowchild pdw_cc);long fila,ctas
fila=esta.getrow()
if fila<0 then return 0
string actual, column,nulo,cta_con
setnull(nulo)
setnull(ctas)
setnull(cta_con)
column=esta.getcolumnname()
choose case column
	case "cta_ajuste","cta_cpartida","cta_ajuste_dep","cta_cpartida_dep"
		string revisa,otro,natu
		natu=esta.getitemstring(fila,"naturaleza")
		if column ="cta_cpartida" or column="cta_cpartida_dep" then
			if natu='C' then
				natu='D'
			else
				natu='C'
			end if
		end if
		otro=esta.gettext()
		setnull(revisa)
		select codtotal into :revisa from cont_plan where codtotal=:otro and cod_empresa=:i_codemp and movimiento='1' and naturaleza=:natu;
		if isnull(revisa) then
			esta.setitem(esta.getrow(),esta.getcolumnname(),revisa)
			return -1
		else
			esta.accepttext()
		end if
	case "mayor","grupo","cuenta","subcuenta","nivel1","nivel2","nivel3","nivel4","nivel5"
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
			case "mayor"
				cod_new=esta.getitemstring(fila,column)
			case "grupo"
				cod_new=esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"grupo")
			case "cuenta"
				cod_new=esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"cuenta")
			case "subcuenta"
				cod_new=esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"cuenta")+esta.getitemstring(fila,"subcuenta")
			case "nivel1"
				cod_new=esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"cuenta")+esta.getitemstring(fila,"subcuenta")+esta.getitemstring(fila,"nivel1")
			case "nivel2"
				cod_new=esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"cuenta")+esta.getitemstring(fila,"subcuenta")+esta.getitemstring(fila,"nivel1")+esta.getitemstring(fila,"nivel2")
			case "nivel3"
				cod_new=esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"cuenta")+esta.getitemstring(fila,"subcuenta")+esta.getitemstring(fila,"nivel1")+esta.getitemstring(fila,"nivel2")+esta.getitemstring(fila,"nivel3")
			case "nivel4"
				cod_new=esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"cuenta")+esta.getitemstring(fila,"subcuenta")+esta.getitemstring(fila,"nivel1")+esta.getitemstring(fila,"nivel2")+esta.getitemstring(fila,"nivel3")+esta.getitemstring(fila,"nivel4")
			case "nivel5"
				cod_new=esta.getitemstring(fila,"mayor")+esta.getitemstring(fila,"grupo")+esta.getitemstring(fila,"cuenta")+esta.getitemstring(fila,"subcuenta")+esta.getitemstring(fila,"nivel1")+esta.getitemstring(fila,"nivel2")+esta.getitemstring(fila,"nivel3")+esta.getitemstring(fila,"nivel4")+esta.getitemstring(fila,"nivel5")
		end choose
		esta.setitem(fila,"codtotal",cod_new)
	case "movimiento"
		actual=esta.getitemstring(fila,"movimiento")
		if not isnull(hija) then
			if hija.rowcount()>0  and actual='0' then 
				esta.setitem(fila,"movimiento",actual)
				return -1
			end if
		end if
	case "tercero"
		actual=esta.getitemstring(fila,"tercero")
		If actual='1' then 
			cta_con=esta.getitemstring(fila,"codtotal")
			SELECT 
				count(cont_doc_cp.cuenta) into :ctas
			 FROM 
				cont_doc_cab inner join (cont_plan inner join cont_doc_cp on (cont_plan.codtotal = cont_doc_cp.cuenta) and (cont_plan.cod_empresa = cont_doc_cp.cod_empresa)) on (cont_doc_cab.ndoc = cont_doc_cp.ndoc) and (cont_doc_cab.cdoc = cont_doc_cp.cdoc) and (cont_doc_cab.ano = cont_doc_cp.ano) and (cont_doc_cab.cod_empresa = cont_doc_cp.cod_empresa) and (cont_doc_cab.mes = cont_doc_cp.mes)
			WHERE 
				(((cont_doc_cp.nit)  Is Not Null ) and ((cont_doc_cp.cod_empresa)=:i_codemp) and ((cont_plan.tercero)='1') and ((cont_doc_cab.estado)='3') and ((cont_plan.codtotal)=:cta_con));
			if ctas>0 then
				messagebox('Atención','Esta cuenta tiene movimientos con tercero debera reabrir periodos y comprobantes')
				esta.setitem(fila,"tercero",actual)
				return -1
			end if
			
			setnull(ctas)
			SELECT 
				count(cont_saldos.cod_empresa)  into :ctas
			FROM 
					cont_plan inner join cont_saldos on (cont_plan.codtotal = cont_saldos.cuenta) and (cont_plan.cod_empresa = cont_saldos.cod_empresa)
			WHERE 
					(((cont_plan.cod_empresa)=:i_codemp) and ((cont_plan.codtotal)=:cta_con) and ((cont_saldos.nit) is not null));
			if ctas>0 then
				messagebox('Atención','Esta cuenta tiene cierres contables con tercero debera anular los cierres')
				esta.setitem(fila,"tercero",actual)
				return -1
			end if
		end if
	case "lugar"
		actual=esta.getitemstring(fila,"lugar")
		If actual='1' then 
			cta_con=esta.getitemstring(fila,"codtotal")
			SELECT 
				count(cont_doc_cp.cuenta) into :ctas
			 FROM 
				cont_doc_cab inner join (cont_plan inner join cont_doc_cp on (cont_plan.codtotal = cont_doc_cp.cuenta) and (cont_plan.cod_empresa = cont_doc_cp.cod_empresa)) on (cont_doc_cab.ndoc = cont_doc_cp.ndoc) and (cont_doc_cab.cdoc = cont_doc_cp.cdoc) and (cont_doc_cab.ano = cont_doc_cp.ano) and (cont_doc_cab.cod_empresa = cont_doc_cp.cod_empresa) and (cont_doc_cab.mes = cont_doc_cp.mes)
			WHERE 
				(((cont_doc_cp.clugar)  Is Not Null ) and ((cont_doc_cp.cod_empresa)=:i_codemp) and ((cont_plan.lugar)='1') and ((cont_doc_cab.estado)='3') and ((cont_plan.codtotal)=:cta_con));
			if ctas>0 then
				messagebox('Atención','Esta cuenta tiene movimientos con lugar debera reabrir periodos y comprobantes')
				esta.setitem(fila,"lugar",actual)
				return -1
			end if
			
			setnull(ctas)
			SELECT 
				count(cont_saldos.cod_empresa)  into :ctas
			FROM 
					cont_plan inner join cont_saldos on (cont_plan.codtotal = cont_saldos.cuenta) and (cont_plan.cod_empresa = cont_saldos.cod_empresa)
			WHERE 
					(((cont_plan.cod_empresa)=:i_codemp) and ((cont_plan.codtotal)=:cta_con) and ((cont_saldos.clugar) is not null));
			if ctas>0 then
				messagebox('Atención','Esta cuenta tiene cierres contables con lugar debera anular los cierres')
				esta.setitem(fila,"lugar",actual)
				return -1
			end if
		end if
	case "ccosto"
		actual=esta.getitemstring(fila,"ccosto")
		If actual='1' then 
			cta_con=esta.getitemstring(fila,"codtotal")
			SELECT 
				count(cont_doc_cp.cuenta) into :ctas
			 FROM 
				cont_doc_cab inner join (cont_plan inner join cont_doc_cp on (cont_plan.codtotal = cont_doc_cp.cuenta) and (cont_plan.cod_empresa = cont_doc_cp.cod_empresa)) on (cont_doc_cab.ndoc = cont_doc_cp.ndoc) and (cont_doc_cab.cdoc = cont_doc_cp.cdoc) and (cont_doc_cab.ano = cont_doc_cp.ano) and (cont_doc_cab.cod_empresa = cont_doc_cp.cod_empresa) and (cont_doc_cab.mes = cont_doc_cp.mes)
			WHERE 
				(((cont_doc_cp.ccosto)  Is Not Null ) and ((cont_doc_cp.cod_empresa)=:i_codemp) and ((cont_plan.lugar)='1') and ((cont_doc_cab.estado)='3') and ((cont_plan.codtotal)=:cta_con));
			if ctas>0 then
				messagebox('Atención','Esta cuenta tiene movimientos con centro de costo debera reabrir periodos y comprobantes')
				esta.setitem(fila,"ccosto",actual)
				return -1
			end if
			
			setnull(ctas)
			SELECT 
				count(cont_saldos.cod_empresa)  into :ctas
			FROM 
					cont_plan inner join cont_saldos on (cont_plan.codtotal = cont_saldos.cuenta) and (cont_plan.cod_empresa = cont_saldos.cod_empresa)
			WHERE 
					(((cont_plan.cod_empresa)=:i_codemp) and ((cont_plan.codtotal)=:cta_con) and ((cont_saldos.ccosto) is not null));
			if ctas>0 then
				messagebox('Atención','Esta cuenta tiene cierres contables con Centro de Costo debera anular los cierres')
				esta.setitem(fila,"ccosto",actual)
				return -1
			end if
		end if

	case 'coduf'		
		actual=esta.getitemstring(fila,"coduf")
		esta.setitem(esta.getrow(),'codcc',nulo)
		esta.setitem(esta.getrow(),'cc_descripcion',nulo)
		pdw_cc.retrieve(data)
		
	case 'cc_descripcion'
		esta.setitem(esta.getrow(),'codcc',pdw_cc.getitemstring(pdw_cc.getrow(),'codcc'))
	case else
		esta.accepttext()
end choose
return 1
end function

event open;menu= create m_pop_conta
end event

on w_plan2.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.sle_1=create sle_1
this.dw_muestras=create dw_muestras
this.st_2=create st_2
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.dw_muestras
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.tab_1
end on

on w_plan2.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.sle_1)
destroy(this.dw_muestras)
destroy(this.st_2)
destroy(this.tab_1)
end on

event resize;call super::resize;tab_1.event resize(newwidth -50 ,newheight -250)


end event

type pb_grabar from w_center`pb_grabar within w_plan2
integer x = 3849
integer y = 24
integer taborder = 40
integer textsize = -8
string facename = "Tahoma"
string powertiptext = "Guardar Cambios [Alt+G]"
end type

event pb_grabar::clicked;call super::clicked;tab_1.tabp_4.dw_n5.accepttext()
tab_1.tabp_4.dw_n4.accepttext()
tab_1.tabp_4.dw_n3.accepttext()
tab_1.tabp_3.dw_n2.accepttext()
tab_1.tabp_3.dw_n1.accepttext()
tab_1.tabp_3.dw_subcta.accepttext()
tab_1.tabp_2.dw_cuenta.accepttext()
tab_1.tabp_2.dw_grupo.accepttext()
tab_1.tabp_2.dw_mayor.accepttext()
tab_1.tabp_1.dw_2.accepttext()
if i_cam_n5 or i_cam_n4 or i_cam_n3 or i_cam_n2 or i_cam_n1 or i_cam_subcta or i_cam_cuenta or i_cam_grupo or i_cam_mayor or i_cam_gral then
	long fil_gral,fil_may,fil_gru,fil_cue,fil_sub,fil_ni1,fil_ni2,fil_ni3,fil_ni4,fil_ni5
	fil_gral=tab_1.tabp_1.dw_2.getrow()
	fil_may=tab_1.tabp_2.dw_mayor.getrow()
	fil_gru=tab_1.tabp_2.dw_grupo.getrow()
	fil_cue=tab_1.tabp_2.dw_cuenta.getrow()
	fil_sub=tab_1.tabp_3.dw_subcta.getrow()
	fil_ni1=tab_1.tabp_3.dw_n1.getrow()
	fil_ni2=tab_1.tabp_3.dw_n2.getrow()
	fil_ni3=tab_1.tabp_4.dw_n3.getrow()
	fil_ni4=tab_1.tabp_4.dw_n4.getrow()
	fil_ni5=tab_1.tabp_4.dw_n5.getrow()
	tab_1.tabp_1.dw_2.setredraw(false)
	tab_1.tabp_2.dw_mayor.setredraw(false)
	tab_1.tabp_2.dw_grupo.setredraw(false)
	tab_1.tabp_2.dw_cuenta.setredraw(false)
	tab_1.tabp_3.dw_subcta.setredraw(false)
	tab_1.tabp_3.dw_n1.setredraw(false)
	tab_1.tabp_3.dw_n2.setredraw(false)
	tab_1.tabp_4.dw_n3.setredraw(false)
	tab_1.tabp_4.dw_n4.setredraw(false)
	tab_1.tabp_4.dw_n5.setredraw(false)
	if grabar()=1 then dw_1.triggerevent(itemchanged!)
	if fil_gral>0 then tab_1.tabp_1.dw_2.scrolltorow(fil_gral)
	if fil_may>0 then tab_1.tabp_2.dw_mayor.scrolltorow(fil_may)
	if fil_gru>0 then tab_1.tabp_2.dw_grupo.scrolltorow(fil_gru)
	if fil_cue>0 then tab_1.tabp_2.dw_cuenta.scrolltorow(fil_cue)
	if fil_sub>0 then tab_1.tabp_3.dw_subcta.scrolltorow(fil_sub)
	if fil_ni1>0 then tab_1.tabp_3.dw_n1.scrolltorow(fil_ni1)
	if fil_ni2>0 then tab_1.tabp_3.dw_n2.scrolltorow(fil_ni2)
	if fil_ni3>0 then tab_1.tabp_4.dw_n3.scrolltorow(fil_ni3)
	if fil_ni4>0 then tab_1.tabp_4.dw_n4.scrolltorow(fil_ni4)
	if fil_ni5>0 then tab_1.tabp_4.dw_n5.scrolltorow(fil_ni5)
	tab_1.tabp_1.dw_2.setredraw(true)
	tab_1.tabp_2.dw_mayor.setredraw(true)
	tab_1.tabp_2.dw_grupo.setredraw(true)
	tab_1.tabp_2.dw_cuenta.setredraw(true)
	tab_1.tabp_3.dw_subcta.setredraw(true)
	tab_1.tabp_3.dw_n1.setredraw(true)
	tab_1.tabp_3.dw_n2.setredraw(true)
	tab_1.tabp_4.dw_n3.setredraw(true)
	tab_1.tabp_4.dw_n4.setredraw(true)
	tab_1.tabp_4.dw_n5.setredraw(true)
end if
end event

type dw_1 from datawindow within w_plan2
integer x = 14
integer y = 24
integer width = 1088
integer height = 148
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event itemchanged;call super::itemchanged;
this.accepttext()
i_codemp=this.getitemstring(1,1)
select count(codtotal) into :cuantas from cont_plan where cod_empresa=:i_codemp;
w_principal.SetMicroHelp("Leyendo Registros")
tab_1.tabp_1.st_1.text=string(tab_1.tabp_1.dw_2.retrieve(i_codemp))+' Registros'
tab_1.tabp_2.dw_mayor.retrieve(i_codemp)
w_principal.setmicrohelp("Gestión Cliente Interno")



end event

event constructor;settransobject(SQLCA)
insertrow(1)
end event

type sle_1 from singlelineedit within w_plan2
event teclear pbm_keyup
integer x = 1147
integer y = 80
integer width = 402
integer height = 76
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

type dw_muestras from datawindow within w_plan2
integer x = 1600
integer y = 24
integer width = 2126
integer height = 152
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_muestras"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_plan2
integer x = 1152
integer y = 24
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

type tab_1 from tab within w_plan2
event create ( )
event destroy ( )
event resize ( integer ai_width,  integer ai_height )
integer x = 9
integer y = 176
integer width = 4014
integer height = 1780
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
tabp_4 tabp_4
end type

on tab_1.create
this.tabp_1=create tabp_1
this.tabp_2=create tabp_2
this.tabp_3=create tabp_3
this.tabp_4=create tabp_4
this.Control[]={this.tabp_1,&
this.tabp_2,&
this.tabp_3,&
this.tabp_4}
end on

on tab_1.destroy
destroy(this.tabp_1)
destroy(this.tabp_2)
destroy(this.tabp_3)
destroy(this.tabp_4)
end on

event resize(integer ai_width, integer ai_height);int pedazo
this.resize(ai_width , ai_height )
tab_1.tabp_1.dw_2.resize(ai_width -100,ai_height -300)

/////1
pedazo= (ai_height / 3) - 70
tab_1.tabp_2.dw_mayor.resize(ai_width -240 , pedazo)

tab_1.tabp_2.dw_grupo.y=tab_1.tabp_2.dw_mayor.y + tab_1.tabp_2.dw_mayor.height +18
tab_1.tabp_2.dw_grupo.resize(ai_width - 240 , pedazo)

tab_1.tabp_2.dw_cuenta.y=tab_1.tabp_2.dw_grupo.y + tab_1.tabp_2.dw_grupo.height +18
tab_1.tabp_2.dw_cuenta.resize(ai_width - 240 ,pedazo)

tab_1.tabp_2.pb_new_mayor.x=ai_width -215
tab_1.tabp_2.pb_del_mayor.x=ai_width -215
tab_1.tabp_2.pb_new_grupo.x=ai_width -215
tab_1.tabp_2.pb_del_grupo.x=ai_width -215
tab_1.tabp_2.pb_new_cuenta.x=ai_width -215
tab_1.tabp_2.pb_del_cta.x=ai_width -215

tab_1.tabp_2.pb_new_grupo.y=tab_1.tabp_2.dw_grupo.y
tab_1.tabp_2.pb_del_grupo.y=tab_1.tabp_2.pb_new_grupo.y+tab_1.tabp_2.pb_new_grupo.height 

tab_1.tabp_2.pb_new_cuenta.y=tab_1.tabp_2.dw_cuenta.y
tab_1.tabp_2.pb_del_cta.y=tab_1.tabp_2.pb_new_cuenta.y+tab_1.tabp_2.pb_new_cuenta.height 

//2
tab_1.tabp_3.dw_subcta.resize(ai_width - 240 , pedazo)

tab_1.tabp_3.dw_n1.y=tab_1.tabp_3.dw_subcta.y +tab_1.tabp_3.dw_subcta.height +18
tab_1.tabp_3.dw_n1.resize(ai_width - 240 ,pedazo)

tab_1.tabp_3.dw_n2.y=tab_1.tabp_3.dw_n1.y +tab_1.tabp_3.dw_n1.height +18
tab_1.tabp_3.dw_n2.resize(ai_width - 240 ,pedazo)

tab_1.tabp_3.pb_new_subcta.x=ai_width -215
tab_1.tabp_3.pb_del_subcta.x=ai_width -215
tab_1.tabp_3.pb_new_n1.x=ai_width -215
tab_1.tabp_3.pb_del_n1.x=ai_width -215
tab_1.tabp_3.pb_new_n2.x=ai_width -215
tab_1.tabp_3.pb_del_n2.x=ai_width -215

tab_1.tabp_3.pb_new_n1.y=tab_1.tabp_3.dw_n1.y
tab_1.tabp_3.pb_del_n1.y=tab_1.tabp_3.pb_new_n1.y+tab_1.tabp_3.pb_new_n1.height 

tab_1.tabp_3.pb_new_n2.y=tab_1.tabp_3.dw_n2.y
tab_1.tabp_3.pb_del_n2.y=tab_1.tabp_3.pb_new_n2.y+tab_1.tabp_3.pb_new_n2.height 

//3
tab_1.tabp_4.dw_n3.resize(ai_width - 240 , pedazo)

tab_1.tabp_4.dw_n4.y=tab_1.tabp_4.dw_n3.y +tab_1.tabp_4.dw_n3.height +18
tab_1.tabp_4.dw_n4.resize(ai_width - 240 ,pedazo)

tab_1.tabp_4.dw_n5.y=tab_1.tabp_4.dw_n4.y +tab_1.tabp_4.dw_n4.height +18
tab_1.tabp_4.dw_n5.resize(ai_width - 240 ,pedazo)

tab_1.tabp_4.pb_new_n3.x=ai_width -215
tab_1.tabp_4.pb_del_n3.x=ai_width -215
tab_1.tabp_4.pb_new_n4.x=ai_width -215
tab_1.tabp_4.pb_del_n4.x=ai_width -215
tab_1.tabp_4.pb_new_n5.x=ai_width -215
tab_1.tabp_4.pb_del_n5.x=ai_width -215

tab_1.tabp_4.pb_new_n4.y=tab_1.tabp_4.dw_n4.y
tab_1.tabp_4.pb_del_n4.y=tab_1.tabp_4.pb_new_n4.y+tab_1.tabp_4.pb_new_n4.height
tab_1.tabp_4.pb_new_n5.y=tab_1.tabp_4.dw_n5.y
tab_1.tabp_4.pb_del_n5.y=tab_1.tabp_4.pb_new_n5.y+tab_1.tabp_4.pb_new_n5.height
end event

type tabp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3977
integer height = 1652
long backcolor = 67108864
string text = "Plan Completo"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra todas las Cuentas del Plan"
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
integer y = 8
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
integer y = 8
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
integer y = 144
integer width = 3959
integer height = 1424
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_plan"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;if getcolumnname()="cta_ajuste" or getcolumnname()= "cta_cpartida" then
	f_busca_cuenta(key,i_codemp,this)
end if
end event

event buttonclicked;if row<1 then return
string nulo
setnull(nulo)
if isnull(getitemstring(row,"rfuente")) then return
setitem(row,"rfuente",nulo)
i_cam_gral=true
cambio=true


end event

event doubleclicked;long fila
fila=getrow()
if fila<1 then return
string mayor,grupo,cuenta,subcta,niv1,niv2,niv3,niv4,niv5,busca
long donde,llego
mayor=getitemstring(fila,"mayor")
grupo=getitemstring(fila,"grupo")
cuenta=getitemstring(fila,"cuenta")
subcta=getitemstring(fila,"subcuenta")
niv1=getitemstring(fila,"nivel1")
niv2=getitemstring(fila,"nivel2")
niv3=getitemstring(fila,"nivel3")
niv4=getitemstring(fila,"nivel4")
niv5=getitemstring(fila,"nivel5")
donde=tab_1.tabp_2.dw_mayor.find("mayor='"+mayor+"'",1,tab_1.tabp_2.dw_mayor.rowcount())
if donde<>tab_1.tabp_2.dw_mayor.getrow() then tab_1.tabp_2.dw_mayor.scrolltorow(donde)
llego=1
if grupo<>"" then
	donde=tab_1.tabp_2.dw_grupo.find("mayor='"+mayor+"' and grupo='"+grupo+"'",1,tab_1.tabp_2.dw_grupo.rowcount())
	if donde<>tab_1.tabp_2.dw_grupo.getrow() then tab_1.tabp_2.dw_grupo.scrolltorow(donde)
	llego=2
end if
if cuenta<>"" then
	donde=tab_1.tabp_2.dw_cuenta.find("mayor='"+mayor+"' and grupo='"+grupo+"' and cuenta='"+cuenta+"'",1,tab_1.tabp_2.dw_cuenta.rowcount())
	if donde<>tab_1.tabp_2.dw_cuenta.getrow() then tab_1.tabp_2.dw_cuenta.scrolltorow(donde)
	llego=3
end if
if subcta<>"" then
	donde=tab_1.tabp_3.dw_subcta.find("mayor='"+mayor+"' and grupo='"+grupo+"' and cuenta='"+cuenta+"' and subcuenta='"+subcta+"'",1,tab_1.tabp_3.dw_subcta.rowcount())
	if donde<>tab_1.tabp_3.dw_subcta.getrow() then tab_1.tabp_3.dw_subcta.scrolltorow(donde)
	llego=4
end if
if niv1<>"" then
	donde=tab_1.tabp_3.dw_n1.find("mayor='"+mayor+"' and grupo='"+grupo+"' and cuenta='"+cuenta+"' and subcuenta='"+subcta+"' and nivel1='"+niv1+"'",1,tab_1.tabp_3.dw_n1.rowcount())
	if donde<>tab_1.tabp_3.dw_n1.getrow() then tab_1.tabp_3.dw_n1.scrolltorow(donde)
	llego=5
end if
if niv2<>"" then
	donde=tab_1.tabp_3.dw_n2.find("mayor='"+mayor+"' and grupo='"+grupo+"' and cuenta='"+cuenta+"' and subcuenta='"+subcta+"' and nivel1='"+niv1+"' and nivel2='"+niv2+"'",1,tab_1.tabp_3.dw_n2.rowcount())
	if donde<>tab_1.tabp_3.dw_n2.getrow() then tab_1.tabp_3.dw_n2.scrolltorow(donde)
	llego=6
end if
if niv3<>"" then
	donde=tab_1.tabp_4.dw_n3.find("mayor='"+mayor+"' and grupo='"+grupo+"' and cuenta='"+cuenta+"' and subcuenta='"+subcta+"' and nivel1='"+niv1+"' and nivel2='"+niv2+"' and nivel3='"+niv3+"'",1,tab_1.tabp_4.dw_n3.rowcount())
	if donde<>tab_1.tabp_4.dw_n3.getrow() then tab_1.tabp_4.dw_n3.scrolltorow(donde)
	llego=7
end if
if niv4<>"" then
	donde=tab_1.tabp_4.dw_n4.find("mayor='"+mayor+"' and grupo='"+grupo+"' and cuenta='"+cuenta+"' and subcuenta='"+subcta+"' and nivel1='"+niv1+"' and nivel2='"+niv2+"' and nivel3='"+niv3+"' and nivel4='"+niv4+"'",1,tab_1.tabp_4.dw_n4.rowcount())
	if donde<>tab_1.tabp_4.dw_n4.getrow() then tab_1.tabp_4.dw_n4.scrolltorow(donde)
	llego=8
end if
if niv5<>"" then
	donde=tab_1.tabp_4.dw_n5.find("mayor='"+mayor+"' and grupo='"+grupo+"' and cuenta='"+cuenta+"' and subcuenta='"+subcta+"' and nivel1='"+niv1+"' and nivel2='"+niv2+"' and nivel3='"+niv3+"' and nivel4='"+niv4+"' and nivel5='"+niv5+"'",1,tab_1.tabp_4.dw_n5.rowcount())
	if donde<>tab_1.tabp_4.dw_n5.getrow() then tab_1.tabp_4.dw_n5.scrolltorow(donde)
	tab_1.selectedtab=4
	tab_1.tabp_4.dw_n5.setfocus()
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
	case 7
		tab_1.selectedtab=4
		tab_1.tabp_4.dw_n3.setfocus()
	case 8
		tab_1.selectedtab=4
		tab_1.tabp_4.dw_n4.setfocus()
end choose
end event

event itemchanged;string nulo
setnull(nulo)
choose case getcolumnname()
	case "cta_ajuste" ,"cta_cpartida"
		string revisa,otro
		otro=gettext()
		setnull(revisa)
		select codtotal into :revisa from cont_plan where codtotal=:otro and cod_empresa=:i_codemp and movimiento='1';
		if isnull(revisa) then
			setitem(getrow(),getcolumnname(),revisa)
			return 1
		else
			accepttext()
			cambio=true
			i_cam_gral=true
		end if
	case 'coduf'
		setitem(getrow(),'codcc',nulo)
		setitem(getrow(),'cc_descripcion',nulo)
		idw_cc.retrieve(data)
		cambio=true
		i_cam_gral=true
	case 'cc_descripcion'
		setitem(getrow(),'codcc',idw_cc.getitemstring(idw_cc.getrow(),'codcc'))
		cambio=true
		i_cam_gral=true
	case else
		accepttext()
		cambio=true
		i_cam_gral=true
end choose
end event

event rbuttondown;long fila
fila=getrow()
if dwo.type<>"column" and dwo.type<>"compute" and dwo.type<>"datawindow" then return
if dwo.type<>"datawindow" then 
	if row<>getrow() then scrolltorow(row)
	fila=row
	if getcolumnname()<>dwo.name then setcolumn(string(dwo.name))
end if
//CHOOSE CASE getcolumnname()
//	CASE "mayor"
//		sle_1.text=getitemstring(fila,"mayor")
//		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
//		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
//		if getitemstring(fila,"mayor")='' or isnull(getitemstring(fila,"mayor")) then
//			menu.m_con_1.m_filtrarpor.enabled=false
//		else
//			menu.m_con_1.m_filtrarpor.enabled=true
//		end if
//		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
//	case "grupo"
//		sle_1.text=getitemstring(fila,"mayor")+getitemstring(getrow(),"grupo")
//		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
//		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
//		if getitemstring(fila,"grupo")='' or isnull(getitemstring(fila,"grupo")) then
//			menu.m_con_1.m_filtrarpor.enabled=false
//		else
//			menu.m_con_1.m_filtrarpor.enabled=true
//		end if
//		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
//	case "cuenta"
//		sle_1.text=getitemstring(fila,"mayor")+getitemstring(getrow(),"grupo")+getitemstring(getrow(),"cuenta")
//		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
//		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
//		if getitemstring(fila,"cuenta")='' or isnull(getitemstring(fila,"cuenta")) then
//			menu.m_con_1.m_filtrarpor.enabled=false
//		else
//			menu.m_con_1.m_filtrarpor.enabled=true
//		end if
//		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
//	case "subcuenta"
//		sle_1.text=getitemstring(fila,"mayor")+getitemstring(getrow(),"grupo")+getitemstring(getrow(),"cuenta")+getitemstring(fila,"subcuenta")
//		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
//		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
//		if getitemstring(fila,"subcuenta")='' or isnull(getitemstring(fila,"subcuenta")) then
//			menu.m_con_1.m_filtrarpor.enabled=false
//		else
//			menu.m_con_1.m_filtrarpor.enabled=true
//		end if
//		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
//	case "nivel1"
//		sle_1.text=getitemstring(fila,"mayor")+getitemstring(getrow(),"grupo")+getitemstring(getrow(),"cuenta")+getitemstring(fila,"subcuenta")+getitemstring(fila,"nivel1")
//		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
//		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
//		if getitemstring(fila,"nivel1")='' or isnull(getitemstring(fila,"nivel1")) then
//			menu.m_con_1.m_filtrarpor.enabled=false
//		else
//			menu.m_con_1.m_filtrarpor.enabled=true
//		end if
//		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
//	case "nivel2"
//		sle_1.text=getitemstring(fila,"mayor")+getitemstring(getrow(),"grupo")+getitemstring(getrow(),"cuenta")+getitemstring(fila,"subcuenta")+getitemstring(fila,"nivel1")+getitemstring(fila,"nivel2")
//		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
//		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
//		if getitemstring(fila,"nivel2")='' or isnull(getitemstring(fila,"nivel2")) then
//			menu.m_con_1.m_filtrarpor.enabled=false
//		else
//			menu.m_con_1.m_filtrarpor.enabled=true
//		end if
//		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
//	case "nivel3"
//		sle_1.text=getitemstring(fila,"mayor")+getitemstring(getrow(),"grupo")+getitemstring(getrow(),"cuenta")+getitemstring(fila,"subcuenta")+getitemstring(fila,"nivel1")+getitemstring(fila,"nivel2")+getitemstring(fila,"nivel3")
//		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
//		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
//		if getitemstring(fila,"nivel3")='' or isnull(getitemstring(fila,"nivel3")) then
//			menu.m_con_1.m_filtrarpor.enabled=false
//		else
//			menu.m_con_1.m_filtrarpor.enabled=true
//		end if
//		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
//	case "nivel4"
//		sle_1.text=getitemstring(fila,"mayor")+getitemstring(getrow(),"grupo")+getitemstring(getrow(),"cuenta")+getitemstring(fila,"subcuenta")+getitemstring(fila,"nivel1")+getitemstring(fila,"nivel2")+getitemstring(fila,"nivel3")+getitemstring(fila,"nivel4")
//		filtro="lower(codtotal) like '"+lower(trim(sle_1.text))+"%'"
//		menu.m_con_1.m_filtrarpor.text="Filtrar por: "+ sle_1.text
//		if getitemstring(fila,"nivel4")='' or isnull(getitemstring(fila,"nivel5")) then
//			menu.m_con_1.m_filtrarpor.enabled=false
//		else
//			menu.m_con_1.m_filtrarpor.enabled=true
//		end if
//		menu.m_con_1.PopMenu (w_principal.PointerX(), w_principal.PointerY())
//	case 'nivel5'
//	case else
		if isnull(dwo) then return
		st_dw_xa_funciones st
		st.dw=this
		st.dwo=dwo
		st.row=row
		openwithparm(w_funcion_dw,st)
//END CHOOSE
end event

event rowfocuschanged;long fila
fila=getrow()
if fila<=0 then return
st_cuenta.text=getitemstring(fila,"descrip")
st_regi.text=getitemstring(fila,"codtotal")
if getitemstring(fila,"Movimiento")="1" then
	st_mvto.text="Es de MVTO."
else
	st_mvto.text="NO es de Mvto."
end if
if getitemstring(fila,"naturaleza")="C" then
	st_nat.text="Crédito"
else
	st_nat.text="Débito"
end if
idw_cc.retrieve(getitemstring(getrow(),'coduf'))
st_1.text="Reg. "+string(fila)+" de "+string(rowcount())
end event

event itemfocuschanged;f_semovio(this,i_codemp,{"cta_ajuste" ,"cta_cpartida"  })


end event

event getfocus;f_semovio(this,i_codemp,{"cta_ajuste" ,"cta_cpartida" })

end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc)
idw_cc.settransobject(sqlca)

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
integer width = 3977
integer height = 1652
long backcolor = 67108864
string text = "Mayor / Grupo / Cuenta"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las cuentas Mayor , Grupo y Cuenta"
pb_del_cta pb_del_cta
pb_new_grupo pb_new_grupo
pb_del_grupo pb_del_grupo
pb_new_cuenta pb_new_cuenta
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
this.pb_new_cuenta=create pb_new_cuenta
this.pb_del_mayor=create pb_del_mayor
this.pb_new_mayor=create pb_new_mayor
this.dw_cuenta=create dw_cuenta
this.dw_grupo=create dw_grupo
this.dw_mayor=create dw_mayor
this.Control[]={this.pb_del_cta,&
this.pb_new_grupo,&
this.pb_del_grupo,&
this.pb_new_cuenta,&
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
destroy(this.pb_new_cuenta)
destroy(this.pb_del_mayor)
destroy(this.pb_new_mayor)
destroy(this.dw_cuenta)
destroy(this.dw_grupo)
destroy(this.dw_mayor)
end on

type pb_del_cta from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 3813
integer y = 1196
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

type pb_new_grupo from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 3813
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
integer x = 3813
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

type pb_new_cuenta from picturebutton within tabp_2
event mousemove pbm_mousemove
integer x = 3813
integer y = 1052
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
integer x = 3813
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
integer x = 3813
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva Cuenta Mayor"
end type

event clicked;if i_codemp="" or isnull(i_codemp) then return
dw_mayor.scrolltorow(dw_mayor.insertrow(0))
dw_mayor.setitem(dw_mayor.getrow(),"cod_empresa",i_codemp)
dw_mayor.setcolumn("mayor")
dw_mayor.setfocus()
cambio=true
i_cam_mayor=true
end event

type dw_cuenta from datawindow within tabp_2
event keyup pbm_dwnkey
integer x = 9
integer y = 1048
integer width = 3749
integer height = 564
integer taborder = 7
boolean bringtotop = true
string title = "none"
string dataobject = "dw_pc_cuenta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc3)
idw_cc3.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
tab_1.tabp_3.dw_subcta.reset()
tab_1.tabp_3.dw_n1.reset()
tab_1.tabp_3.dw_n2.reset()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila<1 then return
idw_cc3.retrieve(getitemstring(fila,'coduf'))
tab_1.tabp_3.dw_subcta.retrieve(i_codemp,getitemstring(fila,"mayor"),getitemstring(fila,"grupo"),getitemstring(fila,"cuenta"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,tab_1.tabp_3.dw_subcta,data,idw_cc3)
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

type dw_grupo from datawindow within tabp_2
event keyup pbm_dwnkey
integer x = 5
integer y = 540
integer width = 3749
integer height = 500
integer taborder = 4
string title = "none"
string dataobject = "dw_pc_grupo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc2)
idw_cc2.settransobject(sqlca)

end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
dw_cuenta.reset()
tab_1.tabp_3.dw_subcta.reset()
tab_1.tabp_3.dw_n1.reset()
tab_1.tabp_3.dw_n2.reset()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila<1 then return
idw_cc2.retrieve(getitemstring(fila,'coduf'))
dw_cuenta.retrieve(i_codemp,getitemstring(fila,"mayor"),getitemstring(fila,"grupo"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_cuenta,data,idw_cc2)
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

type dw_mayor from datawindow within tabp_2
event keyup pbm_dwnkey
integer y = 32
integer width = 3749
integer height = 500
integer taborder = 1
string title = "none"
string dataobject = "dw_pc_mayor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc1)
idw_cc1.settransobject(sqlca)
end event

event rowfocuschanged;long fila
fila=getrow()
dw_cuenta.reset()
dw_grupo.reset()
tab_1.tabp_3.dw_subcta.reset()
tab_1.tabp_3.dw_n1.reset()
tab_1.tabp_3.dw_n2.reset()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila<1 then return
idw_cc1.retrieve(getitemstring(fila,'coduf'))
dw_grupo.retrieve(i_codemp,getitemstring(fila,"mayor"))
end event

event retrieveend;this.sort()
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_grupo,data,idw_cc1)
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

type tabp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3977
integer height = 1652
long backcolor = 67108864
string text = "Subcuenta / Niveles 1-2"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las Subcuentas y las de Nivel 1 y 2"
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
integer x = 3785
integer y = 1216
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Cuenta de Nivel 2"
end type

event clicked;if tab_1.tabp_4.dw_n3.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 3")
	return
else
	if dw_n2.rowcount()>0 then
		dw_n2.deleterow(0)
		cambio=true
		i_cam_n2=true
	end if
end if
end event

type pb_new_n2 from picturebutton within tabp_3
event mousemove pbm_mousemove
integer x = 3785
integer y = 1072
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva Cuenta de Nivel 2"
end type

event clicked;if f_new(dw_n2,dw_n1,6) = -1 then return
i_cam_n2=true
cambio=true
end event

type pb_del_n1 from picturebutton within tabp_3
event mousemove pbm_mousemove
integer x = 3785
integer y = 688
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Cuenta de Nivel 1"
end type

event clicked;if tab_1.tabp_3.dw_n2.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 2")
	return
else
	if dw_n1.rowcount()>0 then
		dw_n1.deleterow(0)
		cambio=true
		i_cam_n1=true
	end if
end if
end event

type pb_new_n1 from picturebutton within tabp_3
event mousemove pbm_mousemove
integer x = 3785
integer y = 540
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva Cuenta de Nivel 1"
end type

event clicked;if f_new(dw_n1,dw_subcta,5) = -1 then return
i_cam_n1=true
cambio=true
end event

type pb_del_subcta from picturebutton within tabp_3
event mousemove pbm_mousemove
integer x = 3785
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar SubCuenta"
end type

event clicked;if tab_1.tabp_3.dw_n1.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 1")
	return
else
	if dw_subcta.rowcount()>0 then
		dw_subcta.deleterow(0)
		cambio=true
		i_cam_subcta=true
	end if
end if
end event

type pb_new_subcta from picturebutton within tabp_3
event mousemove pbm_mousemove
integer x = 3785
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
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar nueva SubCuenta"
end type

event clicked;if f_new(dw_subcta,tab_1.tabp_2.dw_cuenta,4) = -1 then return
i_cam_subcta=true
cambio=true
end event

type dw_n2 from datawindow within tabp_3
event keyup pbm_dwnkey
integer y = 1060
integer width = 3726
integer height = 500
integer taborder = 7
string title = "none"
string dataobject = "dw_pc_n2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc6)
idw_cc6.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila<1 then return
idw_cc6.retrieve(getitemstring(fila,'coduf'))
tab_1.tabp_4.dw_n3.retrieve(i_codemp,getitemstring(fila,"mayor"),getitemstring(fila,"grupo"),getitemstring(fila,"cuenta"),getitemstring(fila,"subcuenta"),getitemstring(fila,"nivel1"),getitemstring(fila,"nivel2"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,tab_1.tabp_4.dw_n3,data,idw_cc6)
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

type dw_n1 from datawindow within tabp_3
event keyup pbm_dwnkey
integer y = 532
integer width = 3726
integer height = 500
integer taborder = 4
string title = "none"
string dataobject = "dw_pc_n1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc5)
idw_cc5.settransobject(sqlca)

end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
dw_n2.reset()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila<1 then return
idw_cc5.retrieve(getitemstring(fila,'coduf'))
dw_n2.retrieve(i_codemp,getitemstring(fila,"mayor"),getitemstring(fila,"grupo"),getitemstring(fila,"cuenta"),getitemstring(fila,"subcuenta"),getitemstring(fila,"nivel1"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n2,data,idw_cc5)
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

type dw_subcta from datawindow within tabp_3
event keyup pbm_dwnkey
integer y = 20
integer width = 3726
integer height = 500
integer taborder = 1
string title = "none"
string dataobject = "dw_pc_subcuenta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc4)
idw_cc4.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
dw_n1.reset()
dw_n2.reset()
tab_1.tabp_4.dw_n3.reset()
tab_1.tabp_4.dw_n4.reset()
tab_1.tabp_4.dw_n5.reset()
if fila<1 then return
idw_cc4.retrieve(getitemstring(fila,'coduf'))
dw_n1.retrieve(i_codemp,getitemstring(fila,"mayor"),getitemstring(fila,"grupo"),getitemstring(fila,"cuenta"),getitemstring(fila,"subcuenta"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n1,data,idw_cc4)
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
if i_cam_n5 or i_cam_n4 or i_cam_n3 or i_cam_n2 or i_cam_n1 then
	choose case messagebox("Atención","Realizó cambios en cuentas de los siguientes niveles:~r~n~r~n"+cambios+"~r~nDesea guardar los cambios?",question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
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

type tabp_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3977
integer height = 1652
long backcolor = 67108864
string text = "Niveles 3-4-5"
long tabtextcolor = 33554432
string picturename = "plan.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las cuentas de Nivel 3 ,4 y 5"
pb_del_n5 pb_del_n5
pb_new_n5 pb_new_n5
pb_del_n4 pb_del_n4
pb_new_n4 pb_new_n4
pb_del_n3 pb_del_n3
pb_new_n3 pb_new_n3
dw_n5 dw_n5
dw_n4 dw_n4
dw_n3 dw_n3
end type

on tabp_4.create
this.pb_del_n5=create pb_del_n5
this.pb_new_n5=create pb_new_n5
this.pb_del_n4=create pb_del_n4
this.pb_new_n4=create pb_new_n4
this.pb_del_n3=create pb_del_n3
this.pb_new_n3=create pb_new_n3
this.dw_n5=create dw_n5
this.dw_n4=create dw_n4
this.dw_n3=create dw_n3
this.Control[]={this.pb_del_n5,&
this.pb_new_n5,&
this.pb_del_n4,&
this.pb_new_n4,&
this.pb_del_n3,&
this.pb_new_n3,&
this.dw_n5,&
this.dw_n4,&
this.dw_n3}
end on

on tabp_4.destroy
destroy(this.pb_del_n5)
destroy(this.pb_new_n5)
destroy(this.pb_del_n4)
destroy(this.pb_new_n4)
destroy(this.pb_del_n3)
destroy(this.pb_new_n3)
destroy(this.dw_n5)
destroy(this.dw_n4)
destroy(this.dw_n3)
end on

type pb_del_n5 from picturebutton within tabp_4
event mousemove pbm_mousemove
integer x = 3803
integer y = 1212
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
string powertiptext = "Borrar Cuenta de Nivel 5"
end type

event clicked;if dw_n5.rowcount()>0 then
	dw_n5.deleterow(0)
	cambio=true
	i_cam_n5=true
end if

end event

type pb_new_n5 from picturebutton within tabp_4
event mousemove pbm_mousemove
integer x = 3803
integer y = 1068
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
string powertiptext = "Insertar nueva Cuenta de Nivel 5"
end type

event clicked;if f_new(dw_n5,dw_n4,9) = -1 then return
i_cam_n5=true
cambio=true
end event

type pb_del_n4 from picturebutton within tabp_4
event mousemove pbm_mousemove
integer x = 3799
integer y = 708
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
string powertiptext = "Borrar Cuenta de Nivel 4"
end type

event clicked;if tab_1.tabp_4.dw_n5.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 5")
	return
else
	if dw_n4.rowcount()>0 then
		dw_n4.deleterow(0)
		cambio=true
		i_cam_n4=true
	end if
end if
end event

type pb_new_n4 from picturebutton within tabp_4
event mousemove pbm_mousemove
integer x = 3799
integer y = 560
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
string powertiptext = "Insertar nueva Cuenta de Nivel 4"
end type

event clicked;if f_new(dw_n4,dw_n3,8) = -1 then return
i_cam_n4=true
cambio=true
end event

type pb_del_n3 from picturebutton within tabp_4
event mousemove pbm_mousemove
integer x = 3794
integer y = 188
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
string powertiptext = "Borrar Cuenta de Nivel 3"
end type

event clicked;if tab_1.tabp_4.dw_n4.rowcount()>0 then
	messagebox("Atención","Este registro no se puede borrar ya que posee cuentas de nivel 4")
	return
else
	if dw_n3.rowcount()>0 then
		dw_n3.deleterow(0)
		cambio=true
		i_cam_n3=true
	end if
end if
end event

type pb_new_n3 from picturebutton within tabp_4
event mousemove pbm_mousemove
integer x = 3794
integer y = 44
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
string powertiptext = "Insertar nueva Cuenta de Nivel 3"
end type

event clicked;if f_new(dw_n3,tab_1.tabp_3.dw_n2,7) = -1 then return
i_cam_n3=true
cambio=true
end event

type dw_n5 from datawindow within tabp_4
event keyup pbm_dwnkey
integer y = 1048
integer width = 3753
integer height = 500
integer taborder = 7
string title = "none"
string dataobject = "dw_pc_n5"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc9)
idw_cc9.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
if fila<1 then return
idw_cc9.retrieve(getitemstring(fila,'coduf'))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;datawindow dwnull
setnull(dwnull)
choose case f_itemchanged(this,dwnull,data,idw_cc9)
	case -1
		return 1
	case 0
	case 1
		cambio=true
		i_cam_n5=true
end choose
//long fila
//fila=this.getrow()
//if fila<0 then return
//if this.getcolumnname()="cta_ajuste" or this.getcolumnname()="cta_cpartida" then
//	string revisa,otro
//	otro=this.gettext()
//	setnull(revisa)
//	select codtotal into :revisa from cont_plan where codtotal=:otro and cod_empresa=:i_codemp and movimiento='1';
//	if isnull(revisa) then
//		this.setitem(this.getrow(),this.getcolumnname(),revisa)
//		return 1
//	else
//		this.accepttext()
//		cambio=true
//		i_cam_n5=true
//	end if
//end if
//string actual
//choose case this.getcolumnname()
//	case "nivel5"
//		if this.find("nivel5='"+data+"'",1,this.rowcount())>0 then
//			this.setitem(fila,"nivel5",actual)
//			return 1
//		end if
//		this.accepttext()
//		this.setitem(fila,"codtotal",this.getitemstring(fila,"mayor")+this.getitemstring(fila,"grupo")+this.getitemstring(fila,"cuenta")+this.getitemstring(fila,"subcuenta")+this.getitemstring(fila,"nivel1")+this.getitemstring(fila,"nivel2")+this.getitemstring(fila,"nivel3")+this.getitemstring(fila,"nivel4")+this.getitemstring(fila,"nivel5"))
//		i_cam_n5=true
//		cambio=true
//	case else
//		this.accepttext()
//		i_cam_n5=true
//		cambio=true
//end choose
end event

event buttonclicked;if not f_buttonclicked(row,this) then return
i_cam_n5=true
cambio=true
end event

event itemfocuschanged;f_itemfocuschanged(this.getcolumnname(),this)
end event

type dw_n4 from datawindow within tabp_4
event keyup pbm_dwnkey
integer y = 540
integer width = 3753
integer height = 500
integer taborder = 4
string title = "none"
string dataobject = "dw_pc_n4"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc8)
idw_cc8.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
if fila<1 then return
idw_cc8.retrieve(getitemstring(fila,'coduf'))
dw_n5.retrieve(i_codemp,getitemstring(fila,"mayor"),getitemstring(fila,"grupo"),getitemstring(fila,"cuenta"),getitemstring(fila,"subcuenta"),getitemstring(fila,"nivel1"),getitemstring(fila,"nivel2"),getitemstring(fila,"nivel3"),getitemstring(fila,"nivel4"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n5,data,idw_cc8)
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

type dw_n3 from datawindow within tabp_4
event keyup pbm_dwnkey
integer y = 32
integer width = 3753
integer height = 500
integer taborder = 1
string title = "none"
string dataobject = "dw_pc_n3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;f_keyup(this,key)
end event

event constructor;settransobject(sqlca)
getchild('cc_descripcion',idw_cc7)
idw_cc7.settransobject(sqlca)
end event

event retrieveend;this.sort()
end event

event rowfocuschanged;long fila
fila=getrow()
dw_n4.reset()
dw_n5.reset()
if fila<1 then return
idw_cc7.retrieve(getitemstring(fila,'coduf'))
dw_n4.retrieve(i_codemp,getitemstring(fila,"mayor"),getitemstring(fila,"grupo"),getitemstring(fila,"cuenta"),getitemstring(fila,"subcuenta"),getitemstring(fila,"nivel1"),getitemstring(fila,"nivel2"),getitemstring(fila,"nivel3"))
end event

event getfocus;f_getfocus(this)
end event

event itemchanged;choose case f_itemchanged(this,dw_n4,data,idw_cc7)
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

