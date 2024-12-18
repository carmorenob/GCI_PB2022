$PBExportHeader$u_version.sru
forward
global type u_version from nonvisualobject
end type
end forward

global type u_version from nonvisualobject
end type
global u_version u_version

type variables
string i_version_asis,i_version_adm,i_vers_conf,i_vers_grep
end variables

on u_version.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_version.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;i_version_asis='6.0.0.121'
i_version_adm='5.0.0.80'
i_vers_conf='6.0.0.44'
i_vers_grep='2.0.0.3'
end event

