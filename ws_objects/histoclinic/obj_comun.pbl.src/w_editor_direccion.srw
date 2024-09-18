$PBExportHeader$w_editor_direccion.srw
forward
global type w_editor_direccion from window
end type
type st_2 from statictext within w_editor_direccion
end type
type st_1 from statictext within w_editor_direccion
end type
type pb_3 from picturebutton within w_editor_direccion
end type
type pb_2 from picturebutton within w_editor_direccion
end type
type pb_1 from picturebutton within w_editor_direccion
end type
type sle_1 from singlelineedit within w_editor_direccion
end type
type dw_1 from datawindow within w_editor_direccion
end type
end forward

global type w_editor_direccion from window
integer width = 2702
integer height = 884
windowtype windowtype = response!
long backcolor = 134217732
string icon = "AppIcon!"
boolean center = true
st_2 st_2
st_1 st_1
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
sle_1 sle_1
dw_1 dw_1
end type
global w_editor_direccion w_editor_direccion

type variables
datawindowchild idw_via,idw_bis,idw_cuad

end variables

forward prototypes
public subroutine wf_organiza ()
end prototypes

public subroutine wf_organiza ();int li_i,li_fila
string ls_ped1,ls_ped2,ls_ped3,ls_ped4,ls_ped5,ls_ped6
sle_1.text=''

for li_i=1 to dw_1.rowcount()
	
	if not isnull(dw_1.getitemstring( li_i,'via')) then
		ls_ped1=dw_1.getitemstring( li_i,'via')
		sle_1.text+=' ' +ls_ped1
	end if
	
	if not isnull(dw_1.getitemnumber( li_i,'numero')) then
		ls_ped2=string(dw_1.getitemnumber( li_i,'numero'))
		sle_1.text+=' ' +ls_ped2
	end if

	if not isnull(dw_1.getitemstring( li_i,'nombre')) then
		ls_ped3=dw_1.getitemstring( li_i,'nombre')
		sle_1.text+=' ' +ls_ped3		
	end if
	
	if not isnull(dw_1.getitemstring( li_i,'letras')) then
		ls_ped4=dw_1.getitemstring( li_i,'letras')
		sle_1.text+=' ' +ls_ped4
	end if	
	
	if not isnull(dw_1.getitemstring( li_i,'bis')) then
		ls_ped5=dw_1.getitemstring( li_i,'bis')
		sle_1.text+=' ' +ls_ped5		
	end if	

	if not isnull(dw_1.getitemstring( li_i,'cuadrante')) then
		ls_ped6=dw_1.getitemstring( li_i,'cuadrante')
		sle_1.text+=' ' +ls_ped6		
	end if	
	sle_1.text=trim(sle_1.text)
next

end subroutine

on w_editor_direccion.create
this.st_2=create st_2
this.st_1=create st_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.sle_1=create sle_1
this.dw_1=create dw_1
this.Control[]={this.st_2,&
this.st_1,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.sle_1,&
this.dw_1}
end on

on w_editor_direccion.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.sle_1)
destroy(this.dw_1)
end on

event open;integer li_inip=1,li_pos=1,li_fila,li_row=1,li_li
string ls_parte,ls_cadena,ls_ped
integer li_v=0,li_n=0

sle_1.text=message.stringparm
ls_cadena=sle_1.text
li_pos = Pos(ls_cadena,' ',li_inip)
DO WHILE li_pos  > 0
	ls_parte = mid(ls_cadena,li_inip,li_pos - 1)
	if ls_parte<>' ' then
		//// BUSQUEDA VIA
		li_fila=idw_via.find("id_abreviatura='"+ls_parte+"'",1,idw_via.rowcount())
		if li_fila>0 then
			li_v++
			if li_v>=2 then	
				li_row++
				if li_row>4 then dw_1.insertrow(0)
				li_n=0
			end if
			ls_ped=idw_via.getitemstring(li_fila,'id_abreviatura')
			dw_1.setitem(li_row,'via',ls_ped)		
		else
			//// BUSQUEDA NUMERO
			if IsNumber(ls_parte) then
				li_n++
				if li_n>=2 then	
					li_row++
					if li_row>4 then dw_1.insertrow(0)
				end if
				dw_1.setitem(li_row,'numero',long(ls_parte))				
			else
				//// BUSQUEDA LETRAS
				if len(ls_parte)=1 and asc(ls_parte)>=asc('A') and asc(ls_parte)<=asc('Z') then
					dw_1.setitem(li_row,'letras',ls_parte)					
				else
					//// BUSQUEDA BIS
					li_fila= idw_bis.find("id_abreviatura='"+ls_parte+"'",1, idw_bis.rowcount())
					if li_fila>0 then
						ls_ped= idw_bis.getitemstring(li_fila,'id_abreviatura')
						dw_1.setitem(li_row,'bis',ls_ped)
					else					
						//// BUSQUEDA CUADRANTE	
						li_fila= idw_cuad.find("id_abreviatura='"+ls_parte+"'",1, idw_cuad.rowcount())
						if li_fila>0 then
							ls_ped= idw_cuad.getitemstring(li_fila,'id_abreviatura')
							dw_1.setitem(li_row,'cuadrante',ls_ped)							
						else
							ls_ped=dw_1.getitemstring(li_row,'nombre')
							dw_1.setitem(li_row,'l_n','L')
							if isnull(ls_ped) then
								dw_1.setitem(li_row,'nombre',ls_parte)
							else
								dw_1.setitem(li_row,'nombre',ls_ped+' ' +ls_parte)
							end if
						end if
					end if
				end if
			end if
		end if
	end if
	ls_cadena =mid(ls_cadena,li_pos+1,Len(ls_cadena))	
	li_pos=Pos(ls_cadena,' ',li_inip)
	
	if li_pos=0 and len(ls_cadena)>0 then
		li_pos=len(ls_cadena)+1
	end if
LOOP
end event

type st_2 from statictext within w_editor_direccion
integer x = 27
integer y = 804
integer width = 302
integer height = 44
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "GENERADA"
boolean focusrectangle = false
end type

type st_1 from statictext within w_editor_direccion
integer x = 27
integer y = 760
integer width = 302
integer height = 44
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DIRECCIÓN"
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_editor_direccion
integer x = 2514
integer y = 312
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar Edición"
end type

event clicked;closewithreturn(parent,setnull(sle_1.text))
end event

type pb_2 from picturebutton within w_editor_direccion
integer x = 2510
integer y = 164
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Acepta Edición"
end type

event clicked;closewithreturn(parent,sle_1.text)
end event

type pb_1 from picturebutton within w_editor_direccion
integer x = 2510
integer y = 20
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Agrega Pare Dirección"
end type

event clicked;int li_li
li_li=dw_1.insertrow(0)
dw_1.scrolltorow(li_li)
end event

type sle_1 from singlelineedit within w_editor_direccion
integer x = 338
integer y = 760
integer width = 2304
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15793151
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = StyleLowered!
end type

type dw_1 from datawindow within w_editor_direccion
integer x = 41
integer y = 28
integer width = 2446
integer height = 688
integer taborder = 10
string title = "none"
string dataobject = "dw_direccion_captura"
boolean vscrollbar = true
boolean border = false
borderstyle borderstyle = styleraised!
end type

event constructor;settransobject(sqlca)
getchild('via',idw_via)
idw_via.settransobject(sqlca) 

getchild('bis',idw_bis)
idw_bis.settransobject(sqlca) 

getchild('cuadrante',idw_cuad)
idw_cuad.settransobject(sqlca) 

InsertRow(0)
InsertRow(0)
InsertRow(0)
InsertRow(0)

end event

event itemchanged;AcceptText()
wf_organiza()
end event

event buttonclicked;if dwo.name='b_1' then
	if dw_1.rowcount()>1 then
		dw_1.deleterow(row)
	else
		dw_1.deleterow(row)
		dw_1.insertrow(0)
	end if
	AcceptText()
	wf_organiza()	
end if
end event

