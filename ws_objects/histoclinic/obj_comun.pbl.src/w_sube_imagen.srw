$PBExportHeader$w_sube_imagen.srw
forward
global type w_sube_imagen from window
end type
type pb_2 from picturebutton within w_sube_imagen
end type
type pb_1 from picturebutton within w_sube_imagen
end type
type ole_1 from olecustomcontrol within w_sube_imagen
end type
type vsb_1 from vscrollbar within w_sube_imagen
end type
type hsb_1 from hscrollbar within w_sube_imagen
end type
type p_1 from picture within w_sube_imagen
end type
type pb_8 from picturebutton within w_sube_imagen
end type
type pb_9 from picturebutton within w_sube_imagen
end type
type pb_11 from picturebutton within w_sube_imagen
end type
type pb_10 from picturebutton within w_sube_imagen
end type
end forward

global type w_sube_imagen from window
integer width = 2203
integer height = 1232
boolean titlebar = true
boolean resizable = true
long backcolor = 67108864
string icon = "camara_1.jpg"
boolean center = true
pb_2 pb_2
pb_1 pb_1
ole_1 ole_1
vsb_1 vsb_1
hsb_1 hsb_1
p_1 p_1
pb_8 pb_8
pb_9 pb_9
pb_11 pb_11
pb_10 pb_10
end type
global w_sube_imagen w_sube_imagen

type variables
st_usuarios i_l_p
environment ge_environment
blob tot_b
long ancho_ori, alto_ori
end variables

forward prototypes
public function integer setphoto ()
public subroutine setscroll ()
end prototypes

public function integer setphoto ();long h, w, r_alto, r_ancho
r_ancho =1888
h = alto_ori
w = ancho_ori
r_alto = round(r_ancho*h/w,0)
if h > r_alto and w > r_ancho then
	if h > w then
		w = round(w * (r_alto/h),0)
		h = r_alto
	else
		h = round(h * (r_ancho/w),0)
		w = r_ancho		
	end if
elseif h > r_alto then
	w = round(w * (r_alto/h),0)
	h = r_alto
elseif w > r_ancho then
	h = round(h * (r_ancho/w),0)
	w = r_ancho		
end if
p_1.Resize(w,h)
Return 0

end function

public subroutine setscroll ();double altura
altura =  w_sube_imagen.height
if p_1.y + p_1.height >= altura then
	vsb_1.Visible = TRUE
	vsb_1.Tag = '1'
	if p_1.width + p_1.x >= w_sube_imagen.width then
		vsb_1.x =w_sube_imagen.width -  vsb_1.width - 50
	else
		vsb_1.x = p_1.x + p_1.width
	end if
	vsb_1.y = p_1.y
	vsb_1.Height = altura - vsb_1.y - 50
	vsb_1.MinPosition = 0
	vsb_1.MaxPosition = p_1.y + p_1.Height - altura
else
	vsb_1.Visible = FALSE
end if

if p_1.x + p_1.width > w_sube_imagen.width then
	hsb_1.Visible = TRUE
	hsb_1.x = p_1.x
	vsb_1.Tag = '1'
	if p_1.height + p_1.y >= altura then
		hsb_1.y = altura - hsb_1.height
	else
		hsb_1.y = p_1.y + p_1.height
	end if			
	hsb_1.width = w_sube_imagen.width - hsb_1.x - 100
	hsb_1.MinPosition = 0
	hsb_1.MaxPosition = p_1.x + p_1.width - w_sube_imagen.width
else
	hsb_1.Visible = FALSE
end if

end subroutine

on w_sube_imagen.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.ole_1=create ole_1
this.vsb_1=create vsb_1
this.hsb_1=create hsb_1
this.p_1=create p_1
this.pb_8=create pb_8
this.pb_9=create pb_9
this.pb_11=create pb_11
this.pb_10=create pb_10
this.Control[]={this.pb_2,&
this.pb_1,&
this.ole_1,&
this.vsb_1,&
this.hsb_1,&
this.p_1,&
this.pb_8,&
this.pb_9,&
this.pb_11,&
this.pb_10}
end on

on w_sube_imagen.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.ole_1)
destroy(this.vsb_1)
destroy(this.hsb_1)
destroy(this.p_1)
destroy(this.pb_8)
destroy(this.pb_9)
destroy(this.pb_11)
destroy(this.pb_10)
end on

event open;i_l_p=message.powerobjectparm
title='Firma para: '+i_l_p.clave

if i_l_p.destino='profe' then
	selectblob firma into :tot_b from profe
	where codprof=:i_l_p.usuario ;
	if SQLCA.SQLCode <> 0 then
		MessageBox("SQL error",SQLCA.SQLErrText,Information!)
	end if
else
	selectblob firma into :tot_b from ips
	where c_ips=:i_l_p.usuario ;
	if SQLCA.SQLCode <> 0 then
		MessageBox("SQL error",SQLCA.SQLErrText,Information!)
	end if
End if
if isNull(tot_b) then
	p_1.Hide()
else
	p_1.Show()		
	p_1.SetPicture(tot_b)
	//this.TriggerEvent("SetScroll")
	ancho_ori = p_1.Width
	alto_ori = p_1.Height
	setPhoto()
	setScroll()
end if
end event

type pb_2 from picturebutton within w_sube_imagen
string tag = "Guardar Imagen"
integer x = 46
integer y = 292
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Imagen"
end type

event clicked;if i_l_p.destino='profe' then
	updateblob profe set firma= :tot_b
	where codprof=:i_l_p.usuario ;
	if SQLCA.SQLCode <> 0 then
		MessageBox("SQL error",SQLCA.SQLErrText,Information!)
	end if
else
	updateblob ips set firma= :tot_b
	where c_ips=:i_l_p.usuario ;
	if SQLCA.SQLCode <> 0 then
		MessageBox("SQL error",SQLCA.SQLErrText,Information!)
	end if
End If
commit;

end event

type pb_1 from picturebutton within w_sube_imagen
integer x = 46
integer y = 20
integer width = 146
integer height = 128
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ocupar.gif"
alignment htextalign = left!
string powertiptext = "Traer Foto desde archivo"
end type

event clicked;string ls_path,ls_filename

GetFileOpenName("Selecione Archivo de Fotos",ls_path,ls_filename,"JPG","JPEG Files (*.JPG),*.JPG, Bitmap Files (*.BMP),*.BMP, GIF Files (*.GIF),*.GIF, WindosMetaFile Files (*.WMF),*.WMF")
long flen, bytes_read,li_FileNum,loops,i
blob b
SetPointer(HourGlass!)
flen = FileLength(ls_path)
li_FileNum = FileOpen(ls_path, textMode!, Read!, LockRead!)
bytes_read = FileReadex(li_FileNum, tot_b)
FileClose(li_FileNum)

if p_1.setPicture(tot_b) = 1 then
	ancho_ori = p_1.Width
	alto_ori = p_1.Height
	p_1.Show()
	setPhoto()
end if
setScroll()
SetPointer(Arrow!)

end event

type ole_1 from olecustomcontrol within w_sube_imagen
integer x = 2322
integer y = 36
integer width = 128
integer height = 112
integer taborder = 20
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_sube_imagen.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type vsb_1 from vscrollbar within w_sube_imagen
integer x = 1915
integer y = 20
integer width = 78
integer height = 880
boolean bringtotop = true
end type

event linedown;if this.Position < this.MaxPosition - 10 then
	this.Position = this.Position + 10
else
	this.Position = this.MaxPosition
end if
this.TriggerEvent(moved!)
end event

event lineup;if this.Position > this.MinPosition + 10 then
	this.Position = this.Position - 10
else
	this.Position = this.MinPosition
end if
this.TriggerEvent(moved!)

end event

event moved;p_1.y =vsb_1.y - this.Position

end event

event pagedown;if this.Position < this.MaxPosition - 10 then
	this.Position = this.Position + 10
else
	this.Position = this.MaxPosition
end if
this.TriggerEvent(moved!)
end event

event pageup;if this.Position > this.MinPosition + 10 then
	this.Position = this.Position - 10
else
	this.Position = this.MinPosition
end if
this.TriggerEvent(moved!)

end event

type hsb_1 from hscrollbar within w_sube_imagen
integer x = 238
integer y = 916
integer width = 1659
integer height = 68
boolean bringtotop = true
end type

event lineleft;if this.Position > this.MinPosition + 10 then
	this.Position = this.Position - 10
else
	this.Position = this.MinPosition
end if
this.TriggerEvent(moved!)

end event

event lineright;if this.Position < this.MaxPosition - 10 then
	this.Position = this.Position + 10
else
	this.Position = this.MaxPosition
end if
this.TriggerEvent(moved!)

end event

event moved;p_1.x = hsb_1.x - this.Position
end event

event pageleft;if this.Position > this.MinPosition + 10 then
	this.Position = this.Position - 10
else
	this.Position = this.MinPosition
end if
this.TriggerEvent(moved!)

end event

event pageright;if this.Position < this.MaxPosition - 10 then
	this.Position = this.Position + 10
else
	this.Position = this.MaxPosition
end if
this.TriggerEvent(moved!)

end event

type p_1 from picture within w_sube_imagen
integer x = 238
integer y = 20
integer width = 1646
integer height = 888
boolean originalsize = true
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_8 from picturebutton within w_sube_imagen
integer x = 46
integer y = 436
integer width = 146
integer height = 128
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Traer Foto desde archivo"
end type

event clicked;close(parent)
end event

type pb_9 from picturebutton within w_sube_imagen
boolean visible = false
integer x = 46
integer y = 660
integer width = 128
integer height = 124
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "camara_1.jpg"
alignment htextalign = right!
string powertiptext = "Obtener foto desde Camara"
end type

event clicked;//string ls_filename_read
//long ll_arch,ll_leyo,nImageID,ojo
//ole_1.object.setlicensenumber('0430003366978686356442456')
//If ole_1.object.TwainOpenDefaultSource() Then
//	
//	ole_1.object.TwainSetCurrentResolution (300)
//	ole_1.object.TwainSetCurrentPixelType (2) //RGB
//	ole_1.object.TwainSetCurrentBitDepth (8) //24 bpp
//	
//	nImageID = ole_1.object.TwainAcquireToGdPictureImage(1)
//
//	ls_filename_read=tipodoc+ documento+'.jpg'
//	ls_filename_read='foto.jpg'
//	If nImageID <> 0 Then
//
//		ojo=(ole_1.object.Getwidth ()  -(147*ole_1.object.GetHeight()/185))/2
//	
//		ole_1.object.CropLeft (ojo)
//		ole_1.object.Cropright (ojo)
//		
//		ole_1.object.ResizeImage (147, 185, 3)
//		ole_1.object.SaveAsJPEG('c:\windows\temp\'+ls_filename_read, 80)
//		ole_1.object.CloseImage(nImageID)
//	End If
//	ole_1.object.TwainCloseSource()
//	
//	ll_arch=fileopen('c:\windows\temp\'+ls_filename_read,StreamMode! )
//	if ll_arch=-1 then 
//		messagebox('Error','no se pudo abrir el archivo')
//		return
//	end if
//	ll_leyo= filereadex(ll_arch,tot_b)
//	if ll_leyo<=0 then 
//		messagebox('Error','no se pudo leer desde el archivo')
//		return
//	end if
//	fileclose(ll_arch)
//	p_1.setpicture(tot_b)
//	p_2.SetPicture(tot_b)
//	cambia=true
//Else
//	messagebox('Error obteniendo imagen',"No se puede abrir el dispositivo, su estado es: "+ trim(String(ole_1.object.TwainGetState)))
//End If
//
end event

type pb_11 from picturebutton within w_sube_imagen
string tag = "Ajustar"
integer x = 46
integer y = 152
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "camara_3.jpg"
alignment htextalign = right!
string powertiptext = "Ajustar la Foto"
end type

event clicked;long h, w, r_alto, r_ancho
r_alto = 1646
p_1.x =238
p_1.y = 20
if Tag = 'Ajustar' then
	hsb_1.Visible = FALSE
	vsb_1.Visible = FALSE
	h = p_1.Height
	w = p_1.width
	r_ancho = round(r_alto*w/h,0)
	if h > r_alto and w > r_ancho then
		if h > w then
			w = round(w * (r_alto/h),0)
			h = r_alto
		else
			h = round(h * (r_ancho/w),0)
			w = r_ancho		
		end if
	elseif h > r_alto then
		w = round(w * (r_alto/h),0)
		h = r_alto
	elseif w > r_ancho then
		h = round(h * (r_ancho/w),0)
		w = r_ancho		
	end if
	p_1.Resize(w,h)
	Tag = 'Original'
else
	if hsb_1.Tag = '1' then hsb_1.Visible = TRUE
	if vsb_1.Tag = '1' then vsb_1.Visible = TRUE
	//p_1.Resize(ancho_ori,alto_ori)
	Tag = 'Ajustar'
end if

end event

type pb_10 from picturebutton within w_sube_imagen
boolean visible = false
integer x = 46
integer y = 800
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "camara_2.jpg"
alignment htextalign = right!
string powertiptext = "Seleccionar Cámara"
end type

event clicked;//ole_1.object.TwainSelectSource()
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cw_sube_imagen.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cw_sube_imagen.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
