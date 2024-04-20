$PBExportHeader$w_nuev_gclin.srw
forward
global type w_nuev_gclin from window
end type
type pb_2 from picturebutton within w_nuev_gclin
end type
type pb_1 from picturebutton within w_nuev_gclin
end type
type dw_1 from datawindow within w_nuev_gclin
end type
end forward

global type w_nuev_gclin from window
integer width = 2560
integer height = 1012
boolean titlebar = true
string title = "Nuevo grupo Clínico"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Query5!"
string pointer = "Arrow!"
event nuevo pbm_open
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_nuev_gclin w_nuev_gclin

type variables
datawindowchild docus,dw_costos
end variables

forward prototypes
public subroutine nuevo ()
public subroutine edita (integer cual)
end prototypes

public subroutine nuevo ();
end subroutine

public subroutine edita (integer cual);
end subroutine

on w_nuev_gclin.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_nuev_gclin.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;this.x=(ancho/2)-this.width/2
this.y=(alto/2)-this.height/2
dw_1.settransobject(SQLCA)
dw_1.getchild("coddoc",docus)
dw_1.getchild("cccosto",dw_costos)
dw_costos.settransobject(SQLCA)
docus.settransobject(SQLCA)
docus.retrieve()
if new_or_edit then
	dw_1.insertrow(0)
	dw_1.setitem(dw_1.getrow(),1,w_grup_clinic.dw_6.getitemstring(1,1))
	long cual
	SELECT max(GClinico.CodGC) into :cual
	FROM GClinico;
	if isnull(cual) then cual =0
	cual++
	dw_1.setitem(1,'codgc',cual)
	dw_costos.setfilter("isnull(coduf)")
else
	this.title="Editar Grupo"
	dw_1.retrieve(w_grup_clinic.dw_1.getitemnumber(w_grup_clinic.dw_1.getrow(),'codgc'))
	if not isnull(dw_1.getitemstring(dw_1.getrow(),"cufuncional")) then
		dw_costos.setfilter("coduf='"+dw_1.getitemstring(dw_1.getrow(),"cufuncional")+"'")
	else
		dw_costos.setfilter("isnull(coduf)")
	end if
end if
dw_costos.filter()

end event

type pb_2 from picturebutton within w_nuev_gclin
integer x = 1207
integer y = 772
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cerrar Ventana"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_nuev_gclin
string tag = "&Guardar"
integer x = 1019
integer y = 772
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_1.getitemstring(1,"tipoimpre")="1" and isnull(dw_1.getitemstring(1,"coddoc")) then
	Messagebox ("Atención","Seleccione un documento")
	return
end if
if dw_1.update()=1 then 
	commit;
	w_grup_clinic.triggerevent(open!)
	close (parent)
end if
end event

type dw_1 from datawindow within w_nuev_gclin
integer x = 23
integer y = 20
integer width = 2450
integer height = 744
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_grpclinico"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
string nulo
if this.getcolumn()=1 then //area
	string tipimp,codoc,clug_doc
	SELECT TipoImpre,coddoc,clugar into :tipimp, :codoc,:clug_doc
	FROM AreaADX
	WHERE AreaADX.CodAADX=:data;
	if tipimp='3' then
		this.setitem(row,3,'3')
		this.setitem(row,4,codoc)
		this.setitem(row,6,clug_doc)
		docus.setfilter("clugar='"+clug_doc+"'")
		docus.filter()
	else
		setnull(nulo)
		this.setitem(row,"tipoimpre",'1')
		this.setitem(row,"coddoc",nulo)
		this.setitem(row,"clugar",nulo)
	end if
end if
if this.getcolumn()=3 then //tipoimpre
	setnull(nulo)
	if data<>'1' then 
		this.setitem(row,"coddoc",nulo)
		this.setitem(row,"clugar",nulo)
	end if
end if
if this.getcolumn()=6 then //clugar
long j
string k
	k="clugar='"+data+"'"
	j=docus.setfilter(k)
	j=docus.filter()
	setnull(nulo)
	this.setitem(row,"coddoc",nulo)
end if
if this.getcolumnname()="cufuncional" then
	dw_costos.setfilter("coduf='"+this.getitemstring(this.getrow(),"cufuncional")+"'")
	dw_costos.filter()
	this.setitem(this.getrow(),"cccosto","")
end if
end event

