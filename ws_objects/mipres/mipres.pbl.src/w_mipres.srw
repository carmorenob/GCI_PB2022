$PBExportHeader$w_mipres.srw
forward
global type w_mipres from window
end type
type dw_comp from uo_datawindow within w_mipres
end type
type dw_nutri from uo_datawindow within w_mipres
end type
type dw_dispo from uo_datawindow within w_mipres
end type
type dw_cups from uo_datawindow within w_mipres
end type
type dw_med from uo_datawindow within w_mipres
end type
type dw_pres from uo_datawindow within w_mipres
end type
type dw_1 from datawindow within w_mipres
end type
type cb_2 from commandbutton within w_mipres
end type
end forward

global type w_mipres from window
integer width = 5193
integer height = 2112
boolean titlebar = true
string title = "SSS"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_comp dw_comp
dw_nutri dw_nutri
dw_dispo dw_dispo
dw_cups dw_cups
dw_med dw_med
dw_pres dw_pres
dw_1 dw_1
cb_2 cb_2
end type
global w_mipres w_mipres

type variables
transaction sqlmpr
string ls_fecha_ret

end variables

on w_mipres.create
this.dw_comp=create dw_comp
this.dw_nutri=create dw_nutri
this.dw_dispo=create dw_dispo
this.dw_cups=create dw_cups
this.dw_med=create dw_med
this.dw_pres=create dw_pres
this.dw_1=create dw_1
this.cb_2=create cb_2
this.Control[]={this.dw_comp,&
this.dw_nutri,&
this.dw_dispo,&
this.dw_cups,&
this.dw_med,&
this.dw_pres,&
this.dw_1,&
this.cb_2}
end on

on w_mipres.destroy
destroy(this.dw_comp)
destroy(this.dw_nutri)
destroy(this.dw_dispo)
destroy(this.dw_cups)
destroy(this.dw_med)
destroy(this.dw_pres)
destroy(this.dw_1)
destroy(this.cb_2)
end on

type dw_comp from uo_datawindow within w_mipres
integer x = 3346
integer y = 920
integer height = 448
integer taborder = 40
string dataobject = "dw_mipres_prescripcion_comp"
end type

type dw_nutri from uo_datawindow within w_mipres
integer x = 3333
integer y = 468
integer width = 1755
integer height = 428
integer taborder = 50
string dataobject = "dw_mipres_prescripcion_nutri"
end type

type dw_dispo from uo_datawindow within w_mipres
integer x = 3323
integer y = 32
integer width = 1787
integer height = 408
integer taborder = 60
string dataobject = "dw_mipres_prescripcion_dispo"
end type

type dw_cups from uo_datawindow within w_mipres
string tag = "Cups"
integer x = 1417
integer y = 932
integer width = 1819
integer height = 432
integer taborder = 50
string dataobject = "dw_mipres_prescripcion_cups"
end type

type dw_med from uo_datawindow within w_mipres
integer x = 1408
integer y = 468
integer width = 1819
integer height = 448
integer taborder = 40
string dataobject = "dw_mipres_prescripcion_med"
boolean vscrollbar = true
end type

type dw_pres from uo_datawindow within w_mipres
string tag = "Prescripcion"
integer x = 1408
integer y = 40
integer width = 1829
integer height = 388
integer taborder = 40
string dataobject = "dw_mipres_prescripcion"
end type

type dw_1 from datawindow within w_mipres
integer x = 64
integer y = 36
integer width = 1257
integer height = 268
integer taborder = 30
string title = "none"
string dataobject = "dw_mipres_pacientes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_mipres
integer x = 425
integer y = 524
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;nvo_mipres mpres

string dbparm2,clave,estado,esta,nombre
string ls_nit,ls_td, ls_doc, ls_fecha,ls_token
long aqui,hastaaqui
string dsn,tipo,usu_nomb
n_osversion in_osver
int l_i

gi_pro=in_osver.of_GetOSBits()
if gi_pro=32 THEN //ambiente a 32 bits
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBMS", Regstring!, SQLCA.DBMS)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM", Regstring!, SQLCA.DBPARM )
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DBPARM2", Regstring!, dbparm2)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DATABASE", Regstring!, sqlca.Database)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "SERVERNAME", Regstring!, sqlca.servername)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGID", Regstring!, sqlca.logid)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LOGPASS", Regstring!, sqlca.logpass)
RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "TOKEN_MIPRES", Regstring!,ls_token)	
end if
if gi_pro=64 THEN //ambiente a 64 bits
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBMS", Regstring!, SQLCA.DBMS)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM", Regstring!, SQLCA.DBPARM )
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DBPARM2", Regstring!, dbparm2)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DATABASE", Regstring!, sqlca.Database)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "SERVERNAME", Regstring!, sqlca.servername)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGID", Regstring!, sqlca.logid)
	RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LOGPASS", Regstring!, sqlca.logpass)
	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "TOKEN_MIPRES", Regstring!, ls_token )
end if
sqlca.logpass=f_descripta( sqlca.logpass)
// fin de SQLCA
sqlca.AutoCommit=false
choose case sqlca.dbms
	case "ODBC"
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources", dsn, Regstring!, tipo)
		if pos(lower(tipo),"anywhere",1)<>0 then //es anywhere
			SQLCA.dbParm =SQLCA.dbParm+sqlca.logid+";PWD="+sqlca.logpass+"',DisableBind=1,DelimitIdentifier='No',OJSyntax='ANSI',DBTextLimit='1000000',Host='sistemas',Host='"+nombre+"',AppName='GCI As."+nombre+"',"		
			gs_motor='anywhere'
		else
			if pos(lower(tipo),"postgresql",1)<>0 then //es PostgreSQL Unicode
				SQLCA.dbParm =SQLCA.dbParm+sqlca.logid+";UID="+sqlca.logid+";PWD="+sqlca.logpass+"',DisableBind=1,DelimitIdentifier='No',OJSyntax='ANSI',Host='"+nombre+"',AppName='GCI As."+nombre+"',"+"PBCatalogOwner='public',"
				gs_motor='postgres'
			else
			//	SQLCA.dbParm =SQLCA.dbParm+sle_usuario.text+";PWD=jorca',OJSyntax='ANSI',DBTextLimit='1000000',Host='"+nombre+"',AppName='GCI As."+nombre+"',"
  				gs_motor='access'
			end If
		end if
	case "MSS Microsoft SQL Server"
		SQLCA.dbParm +="',DBTextLimit='1000000',OptSelectBlob=1,Secure=1,Host='"+nombre+"',AppName='GCI As. "+nombre+"',"
	case "SYC Adaptive Server Enterprise"
//		SQLCA.dbParm +="',DBTextLimit='1000000',Host='"+nombre+"',AppName='AsV"+f_remplaza(u_ver.i_version_asis,'.','')+' '+nombre+"',"
	case 'OLE DB'
		SQLCA.Lock = "RC"
		string provider,file_conex
		if gi_pro=32 THEN
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "OLE_PROVIDER", Regstring!, provider)
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "OLE_FILE", Regstring!, file_conex)
		end If
		if gi_pro=64 THEN
			RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "OLE_PROVIDER", Regstring!, provider)
			RegistryGet( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "OLE_FILE", Regstring!, file_conex)			
		end if
		sqlca.dbparm="PROVIDER='"+provider+"',DATALINK='"+file_conex+"',DelimitIdentifier='No',"
		gs_motor='sql'
end choose
SQLCA.dbParm = SQLCA.dbParm + dbparm2
string ss
ss=SQLCA.dbParm 
connect ;
if SQLCA.SQLCode = -1 then
	messagebox('Error conectando a la base de Lab',sqlca.sqlerrtext)
	return -1
end if

if not isvalid(sqlmpr) then sqlmpr = create transaction
if f_conecta_mipres(sqlmpr)=-1 then
	//close(this)
end if

SELECT cadena into :ls_fecha_ret
FROM parametros_gen
WHERE (((codigo_para)=51));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 51')
	return
end if

dw_1.settransobject(sqlca)
dw_pres.settransobject(sqlmpr)
dw_med.settransobject(sqlmpr)
dw_cups.settransobject(sqlmpr)
dw_dispo.settransobject(sqlmpr)
dw_nutri.settransobject(sqlmpr)
dw_comp.settransobject(sqlmpr)

ls_token=f_descripta(ls_token)
mpres=create nvo_mipres
//dw_1.retrieve(datetime(ls_fecha_ret))
//for l_i=1 to dw_1.rowcount()
//	ls_nit=dw_1.getitemstring(l_i,'nit')
//	ls_td=dw_1.getitemstring(l_i,'ti_mipres')
//	ls_doc=dw_1.getitemstring(l_i,'documento')
//	ls_fecha=string(dw_1.getitemdatetime(l_i,'fecha'),'yyyy-mm-dd')
//	mpres.get_prescripcion_pte_mipres (ls_nit,ls_td, ls_doc, ls_fecha, ls_token, dw_pres,dw_med, dw_cups, dw_dispo, dw_nutri,dw_comp)
//next
//
ls_fecha='2021-01-01'
ls_nit='800193989'
hastaaqui=daysafter(date(ls_fecha),today())
for l_i=1 to hastaaqui
	mpres.get_prescripcion_ips_mipres (ls_nit, ls_fecha, ls_token, dw_pres,dw_med, dw_cups, dw_dispo, dw_nutri,dw_comp)
	ls_fecha=string(relativedate(date(ls_fecha),1),'yyyy-mm-dd')
next

disconnect using sqlmpr;
disconnect using sqlca;

end event

