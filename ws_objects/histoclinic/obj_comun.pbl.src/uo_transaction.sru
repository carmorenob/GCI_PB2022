$PBExportHeader$uo_transaction.sru
forward
global type uo_transaction from transaction
end type
end forward

global type uo_transaction from transaction
end type
global uo_transaction uo_transaction

event dberror;if sqlerrortext="Transaction already connected" then
	disconnect using gt_sqlca;
	w_principal.setMicrohelp("Reconectando a la base de datos")
	connect using gt_sqlca;
	sqlca=gt_sqlca;
	return 
end if

if pos(sqlerrortext,"timeout")<>0 then
	if messagebox("Atención", "No se ha podido restablecer la conexión a la base de datos, desea intentarlo de nuevo?",question! , yesno!)=1 then 
		connect using gt_sqlca;
		sqlca=gt_sqlca
	else
		halt
	end if
end if

if pos (sqlerrortext , 'connection')<>0 then
	
	connect using gt_sqlca;
	
	sqlca=gt_sqlca
		
	window lw_padre
	lw_padre=w_principal
	gf_ini_transact_objects(lw_padre)
	
	window wSheet
	boolean bValid
	
	wSheet = lw_padre.GetFirstSheet()
	bvalid= IsValid (wSheet)
	DO while bvalid
		gf_ini_transact_objects(wSheet)
		wSheet.setDataDDE("")
		wSheet = lw_padre.GetNextSheet(wSheet)
		bValid = IsValid (wSheet)
	LOOP
	
end if

end event

on uo_transaction.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_transaction.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

