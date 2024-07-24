$PBExportHeader$n_log.sru
forward
global type n_log from nonvisualobject
end type
end forward

global type n_log from nonvisualobject
end type
global n_log n_log

type variables
String is_file = "nn.log"
String is_fileini = "conf.ini"
Long il_arch_log
String is_nivelactual
end variables
forward prototypes
private function integer f_log_archivo (string as_mensaje)
public subroutine fatal (string as_mensaje)
public subroutine error (string as_mensaje)
private function integer f_nivel (string as_nivel)
public subroutine warn (string as_mensaje)
public subroutine info (string as_mensaje)
public subroutine debug (string as_mensaje)
public function integer inicia (string p_nombre)
end prototypes

private function integer f_log_archivo (string as_mensaje);///*******************Parámetros********************************************************							
//*Nombre								 	f_log_archivo
//*Autor										Nicolás Losada Castro - GCI Colombia
//*Fecha de creación						2 - Junio 2009
//*Nombre del módulo o paquete		
//*Descripción 								Creación de log en archivo plano.
//*******************Parámetros*********************************************************							
//*NOMBRE					TIPO			I/O			OBLIGATORIO
//as_mensaje				string			I						X			
//**************************************************************************************
//*Modificaciones
//*************************************************************************************/
changedirectory("c:\tmp\")
il_arch_log = FileOpen(is_file, linemode!, Write!, shared!, append! )
FileWriteEx(il_arch_log, string(datetime(today(),now()))+'  '+as_mensaje)
FileClose ( il_arch_log )

return 0
end function

public subroutine fatal (string as_mensaje);///*******************Parámetros********************************************************							
//*Nombre								 	fatal
//*Autor										Nicolás Losada Castro - GCI Colombia
//*Fecha de creación						9 - Junio 2009
//*Nombre del módulo o paquete		
//*Descripción 								Mensaje Fatal en Log
//*******************Parámetros*********************************************************							
//*NOMBRE					TIPO			I/O			OBLIGATORIO
//as_mensaje				string			I						X			
//**************************************************************************************
//*Modificaciones
//*************************************************************************************/
IF f_nivel( 'Fatal') = 0 THEN
	f_log_archivo("Fatal. "+as_mensaje)
END IF
end subroutine

public subroutine error (string as_mensaje);///*******************Parámetros********************************************************							
//*Nombre								 	error
//*Autor										Nicolás Losada Castro - GCI Colombia
//*Fecha de creación						9 - Junio 2009
//*Nombre del módulo o paquete		
//*Descripción 								Mensaje Fatal en Log
//*******************Parámetros*********************************************************							
//*NOMBRE					TIPO			I/O			OBLIGATORIO
//as_mensaje				string			I						X			
//**************************************************************************************
//*Modificaciones
//*************************************************************************************/
IF f_nivel( 'Error') = 0 THEN
	f_log_archivo("Error. "+as_mensaje)
END IF
end subroutine

private function integer f_nivel (string as_nivel);///*******************Parámetros********************************************************							
//*Nombre								 	f_nivel
//*Autor										Nicolás Losada Castro - GCI Colombia
//*Fecha de creación						9 - Junio 2009
//*Nombre del módulo o paquete		
//*Descripción 								Verifica nivel, para poder registrar en el log
//*******************Parámetros*********************************************************							
//*NOMBRE					TIPO			I/O			OBLIGATORIO
//as_nivel					string			I						X			
//**************************************************************************************
//*Modificaciones
//*************************************************************************************/

String ls_niveles[5]
//String ls_nivelactual
Integer li_ret, i, j, li_nivelactual, li_nivel

ls_niveles = {'Fatal','Error','Warn','Info','Debug'}
li_nivelactual = 4 //Por defecto está en Info.
li_nivel = 5

For  i = 1 to upperbound(ls_niveles) 
	IF is_nivelactual = ls_niveles[i] THEN li_nivelactual = i
	IF as_nivel = ls_niveles[i] THEN li_nivel = i
NEXT
IF li_nivel <= li_nivelactual THEN
	li_ret = 0
ELSE
	li_ret = -1
END IF

RETURN li_ret
end function

public subroutine warn (string as_mensaje);///*******************Parámetros********************************************************							
//*Nombre								 	Warn
//*Autor										Nicolás Losada Castro - GCI Colombia
//*Fecha de creación						9 - Junio 2009
//*Nombre del módulo o paquete		
//*Descripción 								Mensaje Fatal en Log
//*******************Parámetros*********************************************************							
//*NOMBRE					TIPO			I/O			OBLIGATORIO
//as_mensaje				string			I						X			
//**************************************************************************************
//*Modificaciones
//*************************************************************************************/
IF f_nivel( 'Warn') = 0 THEN
	f_log_archivo("Advertencia. "+as_mensaje)
END IF
end subroutine

public subroutine info (string as_mensaje);///*******************Parámetros********************************************************							
//*Nombre								 	Info
//*Autor										Nicolás Losada Castro - GCI Colombia
//*Fecha de creación						9 - Junio 2009
//*Nombre del módulo o paquete		
//*Descripción 								Mensaje Fatal en Log
//*******************Parámetros*********************************************************							
//*NOMBRE					TIPO			I/O			OBLIGATORIO
//as_mensaje				string			I						X			
//**************************************************************************************
//*Modificaciones
//*************************************************************************************/
IF f_nivel( 'Info') = 0 THEN
	f_log_archivo("Info. "+as_mensaje)
END IF
end subroutine

public subroutine debug (string as_mensaje);///*******************Parámetros********************************************************							
//*Nombre								 	Debug
//*Autor										Nicolás Losada Castro - GCI Colombia
//*Fecha de creación						9 - Junio 2009
//*Nombre del módulo o paquete		
//*Descripción 								Mensaje Fatal en Log
//*******************Parámetros*********************************************************							
//*NOMBRE					TIPO			I/O			OBLIGATORIO
//as_mensaje				string			I						X			
//**************************************************************************************
//*Modificaciones
//*************************************************************************************/
IF f_nivel( 'Debug') = 0 THEN
	f_log_archivo("Debug. "+as_mensaje)
END IF
end subroutine

public function integer inicia (string p_nombre);IF Fileexists(is_fileini) THEN
	is_nivelactual 	= ProfileString ( is_fileini, "Log", "Nivel", "Info")	
//	is_file 			= ProfileString ( is_fileini, "File", "Name", "gci.log")
	is_file 			= ProfileString ( is_fileini, "File", "Name", p_nombre)
ELSE
	is_nivelactual 	= "Info"
//	is_file 			= "gci.log"
	is_file				=p_nombre
END IF
return 1

end function

on n_log.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_log.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

