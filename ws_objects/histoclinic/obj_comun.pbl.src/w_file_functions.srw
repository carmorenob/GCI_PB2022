$PBExportHeader$w_file_functions.srw
$PBExportComments$Shows examples of how to Run other programs and check to see if other programs are running.
forward
global type w_file_functions from w_center
end type
type st_5 from statictext within w_file_functions
end type
type st_4 from statictext within w_file_functions
end type
type sle_windowname from singlelineedit within w_file_functions
end type
type st_3 from statictext within w_file_functions
end type
type st_2 from statictext within w_file_functions
end type
type st_1 from statictext within w_file_functions
end type
type sle_result from singlelineedit within w_file_functions
end type
type sle_file from singlelineedit within w_file_functions
end type
type rb_normal from radiobutton within w_file_functions
end type
type rb_min from radiobutton within w_file_functions
end type
type rb_max from radiobutton within w_file_functions
end type
type cb_close from commandbutton within w_file_functions
end type
type cb_run from commandbutton within w_file_functions
end type
type sle_filename from singlelineedit within w_file_functions
end type
type rb_user from radiobutton within w_file_functions
end type
type rb_pre from radiobutton within w_file_functions
end type
type lb_desktop from listbox within w_file_functions
end type
type gb_2 from groupbox within w_file_functions
end type
type gb_run from groupbox within w_file_functions
end type
type gb_1 from groupbox within w_file_functions
end type
end forward

shared variables
boolean flag_window1
boolean flag_fish
boolean flag_train
boolean flag_colors
boolean flag_multwin
end variables

global type w_file_functions from w_center
integer x = 544
integer y = 340
integer width = 1847
integer height = 1512
string title = "Administrador de programas"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_5 st_5
st_4 st_4
sle_windowname sle_windowname
st_3 st_3
st_2 st_2
st_1 st_1
sle_result sle_result
sle_file sle_file
rb_normal rb_normal
rb_min rb_min
rb_max rb_max
cb_close cb_close
cb_run cb_run
sle_filename sle_filename
rb_user rb_user
rb_pre rb_pre
lb_desktop lb_desktop
gb_2 gb_2
gb_run gb_run
gb_1 gb_1
end type
global w_file_functions w_file_functions

type prototypes

end prototypes

forward prototypes
public function string of_getwindowname ()
public function windowstate of_getwindowstate ()
public function string of_getrunnable ()
end prototypes

public function string of_getwindowname ();string	ls_selected 
if rb_pre.checked then
	ls_selected = lb_desktop.selecteditem()
	choose case ls_selected
		case "Calculator"
			return "Calculator"
		case "Notepad"
			return "untitled - notepad"
		case "Solitaire"
			return "Solitaire"
		case "Word Pad"
			return "Document - WordPad"
		case "Paint Brush"
			return "untitled - paint"
		case "Character Map"
			return "Character Map"
		case else
			return ""
	end choose
else
	return (sle_windowname.text)
end if

end function

public function windowstate of_getwindowstate ();//Check state of three radio button on screen and
//return the appropriate enumerated windowstate type

if rb_max.checked then
	return maximized!
elseif rb_min.checked then
	return minimized!
else
	return normal!
end if
end function

public function string of_getrunnable ();string	ls_selected

if rb_pre.checked then
	ls_selected = lb_desktop.selecteditem()
	choose case ls_selected
	case "Generador de Reportes GCI"
		return "greportes"
	case "Configurador GCI"
		return "conf_apdx"
	case "Gestion Clinica Integrada"
		return "histo_clinic"
	case "Gestion Cliente Interno"
		return "clien_inter"	
	case "Calculadora"
		return "calc"
	case "Notepad"
		return "notepad"
	case "Solitario"
		return "Sol"
	case "Word Pad"
		return "write"
	case "Paint Brush"
		return "pbrush"
	case "Mapa de Caracteres"
		return "charmap"
	case else
		return ""
end choose
else
	return (sle_filename.text)
end if
end function

on open;//open event
//select first item
lb_desktop.selectitem(1)
end on

event close;//Close script for w_run_others



end event

on w_file_functions.create
int iCurrent
call super::create
this.st_5=create st_5
this.st_4=create st_4
this.sle_windowname=create sle_windowname
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_result=create sle_result
this.sle_file=create sle_file
this.rb_normal=create rb_normal
this.rb_min=create rb_min
this.rb_max=create rb_max
this.cb_close=create cb_close
this.cb_run=create cb_run
this.sle_filename=create sle_filename
this.rb_user=create rb_user
this.rb_pre=create rb_pre
this.lb_desktop=create lb_desktop
this.gb_2=create gb_2
this.gb_run=create gb_run
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.sle_windowname
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.sle_result
this.Control[iCurrent+8]=this.sle_file
this.Control[iCurrent+9]=this.rb_normal
this.Control[iCurrent+10]=this.rb_min
this.Control[iCurrent+11]=this.rb_max
this.Control[iCurrent+12]=this.cb_close
this.Control[iCurrent+13]=this.cb_run
this.Control[iCurrent+14]=this.sle_filename
this.Control[iCurrent+15]=this.rb_user
this.Control[iCurrent+16]=this.rb_pre
this.Control[iCurrent+17]=this.lb_desktop
this.Control[iCurrent+18]=this.gb_2
this.Control[iCurrent+19]=this.gb_run
this.Control[iCurrent+20]=this.gb_1
end on

on w_file_functions.destroy
call super::destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_windowname)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_result)
destroy(this.sle_file)
destroy(this.rb_normal)
destroy(this.rb_min)
destroy(this.rb_max)
destroy(this.cb_close)
destroy(this.cb_run)
destroy(this.sle_filename)
destroy(this.rb_user)
destroy(this.rb_pre)
destroy(this.lb_desktop)
destroy(this.gb_2)
destroy(this.gb_run)
destroy(this.gb_1)
end on

type pb_grabar from w_center`pb_grabar within w_file_functions
integer textsize = -8
string facename = "Tahoma"
end type

type st_5 from statictext within w_file_functions
integer x = 750
integer y = 484
integer width = 677
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Nombre Ventana(Para titulo):"
boolean focusrectangle = false
end type

type st_4 from statictext within w_file_functions
integer x = 754
integer y = 280
integer width = 663
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Nombre Ejecutable :"
boolean focusrectangle = false
end type

type sle_windowname from singlelineedit within w_file_functions
integer x = 750
integer y = 568
integer width = 645
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
boolean enabled = false
end type

type st_3 from statictext within w_file_functions
integer x = 18
integer y = 16
integer width = 1408
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Seleccione un programa para ejecutar"
boolean focusrectangle = false
end type

type st_2 from statictext within w_file_functions
integer x = 50
integer y = 940
integer width = 256
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Programa:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_file_functions
integer x = 50
integer y = 1140
integer width = 242
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Estado:"
boolean focusrectangle = false
end type

type sle_result from singlelineedit within w_file_functions
integer x = 50
integer y = 1216
integer width = 727
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
boolean autohscroll = false
boolean displayonly = true
end type

type sle_file from singlelineedit within w_file_functions
integer x = 50
integer y = 1024
integer width = 727
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
boolean displayonly = true
end type

type rb_normal from radiobutton within w_file_functions
integer x = 951
integer y = 772
integer width = 384
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
string text = "Norma&l"
boolean checked = true
end type

type rb_min from radiobutton within w_file_functions
integer x = 503
integer y = 772
integer width = 384
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
string text = "Minimi&zado"
end type

type rb_max from radiobutton within w_file_functions
integer x = 37
integer y = 772
integer width = 398
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Maximizado"
end type

type cb_close from commandbutton within w_file_functions
integer x = 1463
integer y = 364
integer width = 306
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cerrar"
end type

on clicked;close(parent)
end on

type cb_run from commandbutton within w_file_functions
integer x = 1472
integer y = 132
integer width = 306
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ejecuta&r"
end type

event clicked;// use the powerscript function RUN to execute the selected filename.
string	ls_filename

ls_filename = of_GetRunnable()

if ls_filename = "" then
	Messagebox ("Requiere el nombre de un archivo","Por favor digite el nombre y luego Ejecutar")
	return
end if

sle_file.text = ls_filename

if Run(ls_filename, of_getwindowstate()) <> 1 then
	Messagebox("Archivo no encontrado","No se encontro el archivo " + upper(ls_filename) +&
		".  Corrija sus datos", Exclamation!)
	sle_result.text = "No ejecuto"
else
	sle_result.text = "Ejecuto bien"
end if


end event

type sle_filename from singlelineedit within w_file_functions
integer x = 754
integer y = 360
integer width = 645
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
boolean enabled = false
end type

on losefocus;//when sle loses focus, move user entered filename to display at bottom
//and blank out the results line.

sle_file.text = sle_filename.text
sle_result.text = ""

end on

type rb_user from radiobutton within w_file_functions
integer x = 750
integer y = 180
integer width = 599
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Definidos por el usuario"
end type

event clicked;//Allow typeing in the sle and erase out results boxes 

sle_filename.enabled = true
sle_windowname.enabled = true
sle_file.text = ""
sle_result.text = ""
end event

type rb_pre from radiobutton within w_file_functions
integer x = 64
integer y = 180
integer width = 421
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Pre-definidos"
boolean checked = true
end type

on clicked;//disallow changing the user filename box anymore

sle_filename.enabled = false
end on

type lb_desktop from listbox within w_file_functions
integer x = 64
integer y = 260
integer width = 617
integer height = 396
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Generador de Reportes GCI","Configurador GCI","Gestion Clinica Integrada","Gestion Cliente Interno","Paint Brush","Mapa de Caracteres","Word Pad","Notepad","Calculadora","Solitario"}
borderstyle borderstyle = stylelowered!
end type

on selectionchanged;//whenever the user changes selected items, move that filename to the text box
//and blank out the results area.

sle_file.text = lb_desktop.SelectedItem( )
sle_result.text = ""
rb_pre.checked = true
end on

type gb_2 from groupbox within w_file_functions
integer x = 14
integer y = 900
integer width = 1367
integer height = 480
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
end type

type gb_run from groupbox within w_file_functions
integer x = 14
integer y = 716
integer width = 1367
integer height = 148
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
string text = "Estado de ejecucion"
end type

type gb_1 from groupbox within w_file_functions
integer x = 14
integer y = 116
integer width = 1422
integer height = 580
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 41943040
long backcolor = 74481808
string text = "Trabajar con programas:"
end type

