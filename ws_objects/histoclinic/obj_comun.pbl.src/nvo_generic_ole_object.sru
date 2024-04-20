$PBExportHeader$nvo_generic_ole_object.sru
forward
global type nvo_generic_ole_object from oleobject
end type
end forward

global type nvo_generic_ole_object from oleobject
end type
global nvo_generic_ole_object nvo_generic_ole_object

event externalexception;messagebox("Error externo",string(resultcode)+": "+description)
end event

on nvo_generic_ole_object.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_generic_ole_object.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

