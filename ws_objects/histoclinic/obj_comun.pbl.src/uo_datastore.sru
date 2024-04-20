$PBExportHeader$uo_datastore.sru
forward
global type uo_datastore from datastore
end type
end forward

global type uo_datastore from datastore
end type
global uo_datastore uo_datastore

forward prototypes
public function integer update ()
public function integer update (boolean a)
public function integer update (boolean a, boolean c)
end prototypes

public function integer update ();if Describe("Datawindow.Table.UpdateTable") = '?' then
	Rollback;
	st_error i_st
	i_st.ds_nombre=DataObject
	i_st.msgerror='DataStore no actualizable'
	openwithparm(w_error_ds,i_st)
end if
Return super::Update()

end function

public function integer update (boolean a);if Describe("Datawindow.Table.UpdateTable") = '?' then
	Rollback;
	st_error i_st
	i_st.ds_nombre=DataObject
	i_st.msgerror='DataStore no actualizable'
	openwithparm(w_error_ds,i_st)
end if
Return super::Update(a)

end function

public function integer update (boolean a, boolean c);if Describe("Datawindow.Table.UpdateTable") = '?' then
	Rollback;
	st_error i_st
	i_st.ds_nombre=DataObject
	i_st.msgerror='DataStore no actualizable'
	openwithparm(w_error_ds,i_st)
end if
Return super::Update(a,c)

end function

event dberror;rollback;
if isnull(sqlsyntax) then sqlsyntax=''
if isnull(sqlerrtext) then sqlerrtext=''
st_error i_st
i_st.ds_nombre=DataObject
i_st.msgerror='SqlDbCode: '+string(sqldbcode)+'~r~n~r~nSINTAXIS:~r~n'+sqlsyntax+'~r~n~r~nERROR:~r~n'+sqlerrtext
openwithparm(w_error_ds,i_st)
return 0

end event

on uo_datastore.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_datastore.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

