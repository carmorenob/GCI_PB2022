$PBExportHeader$w_hoja_vida.srw
forward
global type w_hoja_vida from window
end type
type pb_12 from picturebutton within w_hoja_vida
end type
type p_2 from picture within w_hoja_vida
end type
type pb_3 from picturebutton within w_hoja_vida
end type
type tab_1 from tab within w_hoja_vida
end type
type p_g from userobject within tab_1
end type
type dw_2 from datawindow within p_g
end type
type p_g from userobject within tab_1
dw_2 dw_2
end type
type p_f from userobject within tab_1
end type
type dw_5 from datawindow within p_f
end type
type dw_4 from datawindow within p_f
end type
type dw_3 from datawindow within p_f
end type
type gb_1 from groupbox within p_f
end type
type gb_2 from groupbox within p_f
end type
type p_f from userobject within tab_1
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
gb_1 gb_1
gb_2 gb_2
end type
type p_p from userobject within tab_1
end type
type dw_7 from datawindow within p_p
end type
type dw_6 from datawindow within p_p
end type
type gb_3 from groupbox within p_p
end type
type gb_4 from groupbox within p_p
end type
type p_p from userobject within tab_1
dw_7 dw_7
dw_6 dw_6
gb_3 gb_3
gb_4 gb_4
end type
type tabpage_3 from userobject within tab_1
end type
type pb_5 from picturebutton within tabpage_3
end type
type pb_7 from picturebutton within tabpage_3
end type
type pb_6 from picturebutton within tabpage_3
end type
type pb_4 from picturebutton within tabpage_3
end type
type pb_2 from picturebutton within tabpage_3
end type
type pb_1 from picturebutton within tabpage_3
end type
type dw_9 from datawindow within tabpage_3
end type
type dw_8 from datawindow within tabpage_3
end type
type gb_5 from groupbox within tabpage_3
end type
type tabpage_3 from userobject within tab_1
pb_5 pb_5
pb_7 pb_7
pb_6 pb_6
pb_4 pb_4
pb_2 pb_2
pb_1 pb_1
dw_9 dw_9
dw_8 dw_8
gb_5 gb_5
end type
type tabpage_4 from userobject within tab_1
end type
type dw_10 from datawindow within tabpage_4
end type
type gb_6 from groupbox within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_10 dw_10
gb_6 gb_6
end type
type p_h from userobject within tab_1
end type
type dw_holgaz from datawindow within p_h
end type
type gb_9 from groupbox within p_h
end type
type p_h from userobject within tab_1
dw_holgaz dw_holgaz
gb_9 gb_9
end type
type p_foto from userobject within tab_1
end type
type ole_1 from olecustomcontrol within p_foto
end type
type pb_11 from picturebutton within p_foto
end type
type pb_10 from picturebutton within p_foto
end type
type pb_9 from picturebutton within p_foto
end type
type vsb_1 from vscrollbar within p_foto
end type
type hsb_1 from hscrollbar within p_foto
end type
type pb_8 from picturebutton within p_foto
end type
type p_1 from picture within p_foto
end type
type p_foto from userobject within tab_1
ole_1 ole_1
pb_11 pb_11
pb_10 pb_10
pb_9 pb_9
vsb_1 vsb_1
hsb_1 hsb_1
pb_8 pb_8
p_1 p_1
end type
type tab_1 from tab within w_hoja_vida
p_g p_g
p_f p_f
p_p p_p
tabpage_3 tabpage_3
tabpage_4 tabpage_4
p_h p_h
p_foto p_foto
end type
type dw_1 from datawindow within w_hoja_vida
end type
type gb_8 from groupbox within w_hoja_vida
end type
type dw_emp from datawindow within w_hoja_vida
end type
type dw_11 from datawindow within w_hoja_vida
end type
type gb_7 from groupbox within w_hoja_vida
end type
end forward

global type w_hoja_vida from window
integer width = 3643
integer height = 2104
boolean titlebar = true
string title = "Hoja Unica de Vida"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_hv.ico"
pb_12 pb_12
p_2 p_2
pb_3 pb_3
tab_1 tab_1
dw_1 dw_1
gb_8 gb_8
dw_emp dw_emp
dw_11 dw_11
gb_7 gb_7
end type
global w_hoja_vida w_hoja_vida

type variables
datawindowchild dw_ciudad,dw_ciudad1,dw_ciudad2,dw_ciudad3, dw_ent,dwc_postal
long entidad
string emplea, tipodoc, documento
boolean cambia,recupera
environment ge_environment
blob tot_b
long ancho_ori, alto_ori
end variables

forward prototypes
public subroutine setScroll ()
public function integer setphoto ()
end prototypes

public subroutine setScroll ();double altura
altura = tab_1.p_foto.height
if tab_1.p_foto.p_1.y + tab_1.p_foto.p_1.height >= altura then
	tab_1.p_foto.vsb_1.Visible = TRUE
	if tab_1.p_foto.p_1.width + tab_1.p_foto.p_1.x >= tab_1.width then
		tab_1.p_foto.vsb_1.x = tab_1.width -  tab_1.p_foto.vsb_1.width - 50
	else
		tab_1.p_foto.vsb_1.x = tab_1.p_foto.p_1.x + tab_1.p_foto.p_1.width
	end if
	tab_1.p_foto.vsb_1.y = tab_1.p_foto.p_1.y
	tab_1.p_foto.vsb_1.Height = altura - tab_1.p_foto.vsb_1.y - 50
	tab_1.p_foto.vsb_1.MinPosition = 0
	tab_1.p_foto.vsb_1.MaxPosition = tab_1.p_foto.p_1.y + tab_1.p_foto.p_1.Height - altura
else
	tab_1.p_foto.vsb_1.Visible = FALSE
end if

if tab_1.p_foto.p_1.x + tab_1.p_foto.p_1.width > tab_1.width then
	tab_1.p_foto.hsb_1.Visible = TRUE
	tab_1.p_foto.hsb_1.x = tab_1.p_foto.p_1.x
	if tab_1.p_foto.p_1.height + tab_1.p_foto.p_1.y >= altura then
		tab_1.p_foto.hsb_1.y = altura - tab_1.p_foto.hsb_1.height
	else
		tab_1.p_foto.hsb_1.y = tab_1.p_foto.p_1.y + tab_1.p_foto.p_1.height
	end if			
	tab_1.p_foto.hsb_1.width = tab_1.width - tab_1.p_foto.hsb_1.x - 100
	tab_1.p_foto.hsb_1.MinPosition = 0
	tab_1.p_foto.hsb_1.MaxPosition = tab_1.p_foto.p_1.x + tab_1.p_foto.p_1.width - tab_1.width
else
	tab_1.p_foto.hsb_1.Visible = FALSE
end if

end subroutine

public function integer setphoto ();long h, w, r_alto, r_ancho
r_ancho = 320
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
p_2.Resize(w,h)
Return 0

end function

on w_hoja_vida.create
this.pb_12=create pb_12
this.p_2=create p_2
this.pb_3=create pb_3
this.tab_1=create tab_1
this.dw_1=create dw_1
this.gb_8=create gb_8
this.dw_emp=create dw_emp
this.dw_11=create dw_11
this.gb_7=create gb_7
this.Control[]={this.pb_12,&
this.p_2,&
this.pb_3,&
this.tab_1,&
this.dw_1,&
this.gb_8,&
this.dw_emp,&
this.dw_11,&
this.gb_7}
end on

on w_hoja_vida.destroy
destroy(this.pb_12)
destroy(this.p_2)
destroy(this.pb_3)
destroy(this.tab_1)
destroy(this.dw_1)
destroy(this.gb_8)
destroy(this.dw_emp)
destroy(this.dw_11)
destroy(this.gb_7)
end on

event open;dw_1.settransobject(SQLCA)
dw_emp.settransobject(SQLCA)
dw_1.insertrow(1)
dw_11.GetChild('codigo_1',dw_ent)
dw_ent.SetTransObject(SQLCA)
dw_ent.Retrieve()
dw_11.settransobject(SQLCA)
dw_11.insertrow(1)
if dw_ent.RowCount() > 0 then
	dw_11.SetItem(1,'codigo',dw_ent.GetItemNumber(1,'codigo'))
end if

tab_1.enabled=false
tab_1.p_g.dw_2.settransobject(SQLCA)
tab_1.p_f.dw_5.settransobject(SQLCA)
tab_1.p_f.dw_3.settransobject(SQLCA)
tab_1.p_f.dw_4.settransobject(SQLCA)
tab_1.p_p.dw_6.settransobject(SQLCA)
tab_1.p_p.dw_7.settransobject(SQLCA)
tab_1.tabpage_3.dw_8.settransobject(SQLCA)
tab_1.tabpage_3.dw_9.settransobject(SQLCA)
tab_1.tabpage_4.dw_10.settransobject(SQLCA)
tab_1.p_h.dw_holgaz.settransobject(SQLCA)

tab_1.p_g.dw_2.getchild("mun_naci",dw_ciudad)
tab_1.p_g.dw_2.getchild('cod_postal',dwc_postal)

tab_1.p_g.dw_2.getchild("mun_corr",dw_ciudad1)
tab_1.p_f.dw_5.getchild("mun_esta",dw_ciudad2)
tab_1.tabpage_3.dw_8.getchild("ant_mpio",dw_ciudad3)
dw_ciudad.settransobject(SQLCA)
dw_ciudad1.settransobject(SQLCA)
dw_ciudad2.settransobject(SQLCA)
dw_ciudad3.settransobject(SQLCA)
dwc_postal.SetTransObject(SQLCA)
dwc_postal.InsertRow(0)

end event

event closequery;if not f_demo('ter') then Return
long i,donde,j
dw_emp.AcceptText()
if dw_emp.GetNextModified(0,Primary!) > 0 then
	if dw_emp.Update() = -1 then
		Return
	end if
end if

for j=1 to 7
CHOOSE CASE j
	CASE 1
		if tab_1.p_g.dw_2.GetNextModified(0,primary!) > 0 then
			if tab_1.p_g.dw_2.update() < 1 then
				rollback;
			else
				commit;
			end if
		end if
		
	case 2
		if tab_1.p_f.dw_5.GetNextModified(0,primary!) > 0 then
			if tab_1.p_f.dw_5.update()<1 then
				rollback;
			else
				commit;
			end if
		end if
		if tab_1.p_f.dw_3.GetNextModified(0,primary!) > 0 then
			donde=tab_1.p_f.dw_3.rowcount()
			for i=1 to donde
				if tab_1.p_f.dw_3.getitemnumber(i,'controlg')=0 then
					tab_1.p_f.dw_3.deleterow(i)
					donde=donde - 1
					if donde <> 0 then tab_1.p_f.dw_3.setitem(i,'num_estus',i)
					i= i - 1
				end if
			next
			if tab_1.p_f.dw_3.update()<1 then
				rollback;
			else
				commit;
			end if
		end if
				
		if tab_1.p_f.dw_4.GetNextModified(0,primary!) > 0 then
			donde=tab_1.p_f.dw_4.rowcount()
			for i=1 to donde
				if tab_1.p_f.dw_4.getitemnumber(i,'controlg')=0 then
					tab_1.p_f.dw_4.deleterow(i)
					donde=donde - 1
					if donde <> 0 then tab_1.p_f.dw_4.setitem(i,'num_otro',i)
					i= i - 1
				end if
			next		
			if tab_1.p_f.dw_4.update()<1 then
				rollback;
			else
				commit;
			end if
		end if
		
	case 3
		if tab_1.p_p.dw_6.GetNextModified(0,primary!) > 0 then
			donde=tab_1.p_p.dw_6.rowcount()
			for i=1 to donde
				if tab_1.p_p.dw_6.getitemnumber(i,'controlg')=0 then
					tab_1.p_p.dw_6.deleterow(i)
					donde=donde - 1
					if donde <> 0 then tab_1.p_p.dw_6.setitem(i,'num_logro',i)
					i= i - 1
				end if
			next
			if tab_1.p_p.dw_6.update()<1 then
				rollback;
			else
				commit;
			end if
		end if
		
		if tab_1.p_p.dw_7.GetNextModified(0,primary!) > 0 then
			donde=tab_1.p_p.dw_7.rowcount()
			for i=1 to donde
				if tab_1.p_p.dw_7.getitemnumber(i,'controlg')=0 then
					tab_1.p_p.dw_7.deleterow(i)
					donde=donde - 1
					if donde <> 0 then tab_1.p_p.dw_7.setitem(i,'num_idioma',i)
					i= i - 1
				end if
			next		
			if tab_1.p_p.dw_7.update()<1 then
				rollback;
			else
				commit;
			end if
		end if
		
	case 4
		if tab_1.tabpage_3.dw_9.GetNextModified(0,primary!) > 0 then
			donde=tab_1.tabpage_3.dw_9.rowcount()
			for i=1 to donde
				if tab_1.tabpage_3.dw_9.getitemnumber(i,'controlg')=0 then
					tab_1.tabpage_3.dw_9.deleterow(i)
					donde=donde - 1
					if donde <> 0 then tab_1.tabpage_3.dw_9.setitem(i,'num_acti',i)
					i= i - 1
				end if
			next		
			if tab_1.tabpage_3.dw_9.update()<1 then
				rollback;
			else
				commit;
			end if
		end if
		if tab_1.tabpage_3.dw_8.GetNextModified(0,primary!) > 0 then
			if tab_1.tabpage_3.dw_8.update()<1 then
				rollback;
			else
				commit;
			end if
		end if
		
	case 5
		if tab_1.tabpage_4.dw_10.GetNextModified(0,primary!) > 0 then
			donde=tab_1.tabpage_4.dw_10.rowcount()
			for i=1 to donde
				if tab_1.tabpage_4.dw_10.getitemnumber(i,'controlg')=0 then
					tab_1.tabpage_4.dw_10.deleterow(i)
					donde=donde - 1
					if donde <> 0 then tab_1.tabpage_4.dw_10.setitem(i,'num_hijo',i)
					i= i - 1
				end if
			next		
			if tab_1.tabpage_4.dw_10.update()<1 then
				rollback;
			else
				commit;
			end if
		end if
	case 6
		if tab_1.p_h.dw_holgaz.GetNextModified(0,primary!) > 0 then
			donde=tab_1.p_h.dw_holgaz.rowcount()
			for i=1 to donde
				if tab_1.p_h.dw_holgaz.getitemnumber(i,'controlg')=0 then
					tab_1.p_h.dw_holgaz.deleterow(i)
					donde=donde - 1
					if donde <> 0 then tab_1.p_h.dw_holgaz.setitem(i,'num_pasa',i)
					i= i - 1
				end if
			next		
			if tab_1.p_h.dw_holgaz.update()<1 then
				rollback;
			else
				commit;
			end if
		end if
	case 7
		if cambia = true then
			updateblob empleados set fotografia = :tot_b
			where tipodoc=:tipodoc and documento=:documento;
			if SQLCA.SQLCode <> 0 then
				MessageBox("SQL error",SQLCA.SQLErrText,Information!)
			end if
			cambia=false
			commit;
		end if
END CHOOSE
next

end event

event resize;//
end event

type pb_12 from picturebutton within w_hoja_vida
string tag = "Buscar"
integer x = 2290
integer y = 68
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;long donde,i
if tab_1.p_g.dw_2.update() < 1 then
	rollback;
else
	commit;
end if

if tab_1.p_f.dw_5.update()<1 then
	rollback;
else
	commit;
end if

donde=tab_1.p_f.dw_3.rowcount()
for i=1 to donde
	if tab_1.p_f.dw_3.getitemnumber(i,'controlg')=0 then
		tab_1.p_f.dw_3.deleterow(i)
		donde=donde - 1
		if donde <> 0 then tab_1.p_f.dw_3.setitem(i,'num_estus',i)
		i= i - 1
	end if
next
if tab_1.p_f.dw_3.update()<1 then
	rollback;
else
	commit;
end if

donde=tab_1.p_f.dw_4.rowcount()
for i=1 to donde
	if tab_1.p_f.dw_4.getitemnumber(i,'controlg')=0 then
		tab_1.p_f.dw_4.deleterow(i)
		donde=donde - 1
		if donde <> 0 then tab_1.p_f.dw_4.setitem(i,'num_otro',i)
		i= i - 1
	end if
next		
if tab_1.p_f.dw_4.update()<1 then
	rollback;
else
	commit;
end if

donde=tab_1.p_p.dw_6.rowcount()
for i=1 to donde
	if tab_1.p_p.dw_6.getitemnumber(i,'controlg')=0 then
		tab_1.p_p.dw_6.deleterow(i)
		donde=donde - 1
		if donde <> 0 then tab_1.p_p.dw_6.setitem(i,'num_logro',i)
		i= i - 1
	end if
next
if tab_1.p_p.dw_6.update()<1 then
	rollback;
else
	commit;
end if
		
donde=tab_1.p_p.dw_7.rowcount()
for i=1 to donde
	if tab_1.p_p.dw_7.getitemnumber(i,'controlg')=0 then
		tab_1.p_p.dw_7.deleterow(i)
		donde=donde - 1
		if donde <> 0 then tab_1.p_p.dw_7.setitem(i,'num_idioma',i)
		i= i - 1
	end if
next		
if tab_1.p_p.dw_7.update()<1 then
	rollback;
else
	commit;
end if

donde=tab_1.tabpage_3.dw_9.rowcount()
for i=1 to donde
	if tab_1.tabpage_3.dw_9.getitemnumber(i,'controlg')=0 then
		tab_1.tabpage_3.dw_9.deleterow(i)
		donde=donde - 1
		if donde <> 0 then tab_1.tabpage_3.dw_9.setitem(i,'num_acti',i)
		i= i - 1
	end if
next		
if tab_1.tabpage_3.dw_9.update()<1 then
	rollback;
else
	commit;
end if

if tab_1.tabpage_3.dw_8.update()<1 then
	rollback;
else
	commit;
end if

donde=tab_1.tabpage_4.dw_10.rowcount()
for i=1 to donde
	if tab_1.tabpage_4.dw_10.getitemnumber(i,'controlg')=0 then
		tab_1.tabpage_4.dw_10.deleterow(i)
		donde=donde - 1
		if donde <> 0 then tab_1.tabpage_4.dw_10.setitem(i,'num_hijo',i)
		i= i - 1
	end if
next		
if tab_1.tabpage_4.dw_10.update()<1 then
	rollback;
else
	commit;
end if

donde=tab_1.p_h.dw_holgaz.rowcount()
for i=1 to donde
	if tab_1.p_h.dw_holgaz.getitemnumber(i,'controlg')=0 then
		tab_1.p_h.dw_holgaz.deleterow(i)
		donde=donde - 1
		if donde <> 0 then tab_1.p_h.dw_holgaz.setitem(i,'num_pasa',i)
		i= i - 1
	end if
next		
if tab_1.p_h.dw_holgaz.update()<1 then
	rollback;
else
	commit;
end if

if cambia = true then
	updateblob empleados set fotografia = :tot_b
	where tipodoc=:tipodoc and documento=:documento;
	if SQLCA.SQLCode <> 0 then
		MessageBox("SQL error",SQLCA.SQLErrText,Information!)
	end if
	cambia=false
	commit;
end if
tab_1.p_f.dw_5.retrieve(tipodoc, documento, entidad)

end event

type p_2 from picture within w_hoja_vida
boolean visible = false
integer x = 3150
integer y = 24
integer width = 434
integer height = 340
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_hoja_vida
string tag = "Buscar"
integer x = 2464
integer y = 68
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "lupa.gif"
string disabledname = "d_lupa.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;g_tercerodesde=1
openwithparm(w_busca_emp,dw_1)
if not isNull(dw_1.GetItemString(1,'documento')) then
	dw_1.triggerEvent(itemchanged!)
end if

end event

type tab_1 from tab within w_hoja_vida
integer x = 37
integer y = 300
integer width = 3520
integer height = 1656
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
p_g p_g
p_f p_f
p_p p_p
tabpage_3 tabpage_3
tabpage_4 tabpage_4
p_h p_h
p_foto p_foto
end type

on tab_1.create
this.p_g=create p_g
this.p_f=create p_f
this.p_p=create p_p
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.p_h=create p_h
this.p_foto=create p_foto
this.Control[]={this.p_g,&
this.p_f,&
this.p_p,&
this.tabpage_3,&
this.tabpage_4,&
this.p_h,&
this.p_foto}
end on

on tab_1.destroy
destroy(this.p_g)
destroy(this.p_f)
destroy(this.p_p)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.p_h)
destroy(this.p_foto)
end on

event selectionchanged;if not f_demo('ter') then Return

//long donde,i
//
//CHOOSE CASE oldindex
//	CASE 1
//		if tab_1.p_g.dw_2.GetNextModified(0,primary!) > 0 then
//			if tab_1.p_g.dw_2.update() < 1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//		//tab_1.p_f.dw_5.retrieve(dw_1.getitemstring(1,1),dw_11.getitemnumber(1,1))
//	case 2
//		if tab_1.p_f.dw_5.GetNextModified(0,primary!) > 0 then
//			if tab_1.p_f.dw_5.update()<1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//		if tab_1.p_f.dw_3.GetNextModified(0,primary!) > 0 then
//			donde=tab_1.p_f.dw_3.rowcount()
//			for i=1 to donde
//				if tab_1.p_f.dw_3.getitemnumber(i,'controlg')=0 then
//					tab_1.p_f.dw_3.deleterow(i)
//					donde=donde - 1
//					if donde <> 0 then tab_1.p_f.dw_3.setitem(i,'num_estus',i)
//					i= i - 1
//				end if
//			next
//			if tab_1.p_f.dw_3.update()<1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//				
//		if tab_1.p_f.dw_4.GetNextModified(0,primary!) > 0 then
//			donde=tab_1.p_f.dw_4.rowcount()
//			for i=1 to donde
//				if tab_1.p_f.dw_4.getitemnumber(i,'controlg')=0 then
//					tab_1.p_f.dw_4.deleterow(i)
//					donde=donde - 1
//					if donde <> 0 then tab_1.p_f.dw_4.setitem(i,'num_otro',i)
//					i= i - 1
//				end if
//			next		
//			if tab_1.p_f.dw_4.update()<1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//		
//	case 3
//		if tab_1.p_p.dw_6.GetNextModified(0,primary!) > 0 then
//			donde=tab_1.p_p.dw_6.rowcount()
//			for i=1 to donde
//				if tab_1.p_p.dw_6.getitemnumber(i,'controlg')=0 then
//					tab_1.p_p.dw_6.deleterow(i)
//					donde=donde - 1
//					if donde <> 0 then tab_1.p_p.dw_6.setitem(i,'num_logro',i)
//					i= i - 1
//				end if
//			next
//			if tab_1.p_p.dw_6.update()<1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//		
//		if tab_1.p_p.dw_7.GetNextModified(0,primary!) > 0 then
//			donde=tab_1.p_p.dw_7.rowcount()
//			for i=1 to donde
//				if tab_1.p_p.dw_7.getitemnumber(i,'controlg')=0 then
//					tab_1.p_p.dw_7.deleterow(i)
//					donde=donde - 1
//					if donde <> 0 then tab_1.p_p.dw_7.setitem(i,'num_idioma',i)
//					i= i - 1
//				end if
//			next		
//			if tab_1.p_p.dw_7.update()<1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//		
//	case 4
//		if tab_1.tabpage_3.dw_9.GetNextModified(0,primary!) > 0 then
//			donde=tab_1.tabpage_3.dw_9.rowcount()
//			for i=1 to donde
//				if tab_1.tabpage_3.dw_9.getitemnumber(i,'controlg')=0 then
//					tab_1.tabpage_3.dw_9.deleterow(i)
//					donde=donde - 1
//					if donde <> 0 then tab_1.tabpage_3.dw_9.setitem(i,'num_acti',i)
//					i= i - 1
//				end if
//			next		
//			if tab_1.tabpage_3.dw_9.update()<1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//		if tab_1.tabpage_3.dw_8.GetNextModified(0,primary!) > 0 then
//			if tab_1.tabpage_3.dw_8.update()<1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//		
//	case 5
//		if tab_1.tabpage_4.dw_10.GetNextModified(0,primary!) > 0 then
//			donde=tab_1.tabpage_4.dw_10.rowcount()
//			for i=1 to donde
//				if tab_1.tabpage_4.dw_10.getitemnumber(i,'controlg')=0 then
//					tab_1.tabpage_4.dw_10.deleterow(i)
//					donde=donde - 1
//					if donde <> 0 then tab_1.tabpage_4.dw_10.setitem(i,'num_hijo',i)
//					i= i - 1
//				end if
//			next		
//			if tab_1.tabpage_4.dw_10.update()<1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//	case 6
//		if tab_1.p_h.dw_holgaz.GetNextModified(0,primary!) > 0 then
//			donde=tab_1.p_h.dw_holgaz.rowcount()
//			for i=1 to donde
//				if tab_1.p_h.dw_holgaz.getitemnumber(i,'controlg')=0 then
//					tab_1.p_h.dw_holgaz.deleterow(i)
//					donde=donde - 1
//					if donde <> 0 then tab_1.p_h.dw_holgaz.setitem(i,'num_pasa',i)
//					i= i - 1
//				end if
//			next		
//			if tab_1.p_h.dw_holgaz.update()<1 then
//				rollback;
//			else
//				commit;
//			end if
//		end if
//	case 7
//		if cambia = true then
//			updateblob empleados set fotografia = :tot_b
//			where tipodoc=:tipodoc and documento=:documento;
//			if SQLCA.SQLCode <> 0 then
//				MessageBox("SQL error",SQLCA.SQLErrText,Information!)
//			end if
//			cambia=false
//			commit;
//		end if
//END CHOOSE
//
//if newindex = 2 then
//	tab_1.p_f.dw_5.retrieve(tipodoc, documento, entidad)
//end if
//
end event

type p_g from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3483
integer height = 1528
long backcolor = 67108864
string text = "Generales"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on p_g.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on p_g.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within p_g
integer x = 18
integer y = 32
integer width = 3461
integer height = 1472
integer taborder = 20
string title = "none"
string dataobject = "dw_hc_empledatosgene"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
string filtro,s_dpto,s_ciudad
if this.GetColumnName() = 'sex_empl' then
	if this.getitemstring(this.getrow(),'sex_empl')='F' then
		this.setitem(this.getrow(),'cla_libr','X')
	else
		this.setitem(this.getrow(),'cla_libr','1')
	end if
end if
if this.GetColumnName() = 'nac_empl' and this.getitemstring(this.getrow(),'nac_empl') <> '1' then
	this.setitem(this.getrow(),'cla_libr','X')
end if
	
if this.GetColumnName() = 'dep_naci' then
	dw_ciudad.Retrieve(getitemstring(getrow(),'dep_naci'))
end if
if this.GetColumnName() = 'dep_corr' then
	dw_ciudad1.Retrieve(getitemstring(getrow(),'dep_corr'))
end if

if this.GetColumnName() = "mun_corr" then
	s_dpto=getitemstring(row,'dep_corr')
	s_ciudad=dw_ciudad1.getitemstring(dw_ciudad1.getrow(),'codciudad')
	dwc_postal.Retrieve(s_dpto,s_ciudad)
end if
end event

event retrieveend;if rowcount() = 0 then Return
if not isNull(GetItemString(getrow(),'dep_naci')) then
	dw_ciudad.Retrieve(GetItemString(getrow(),'dep_naci'))
end if
if not isNull(GetItemString(getrow(),'dep_corr')) then
	dw_ciudad1.Retrieve(GetItemString(getrow(),'dep_corr'))
end if

end event

type p_f from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3483
integer height = 1528
long backcolor = 67108864
string text = "Formación"
long tabtextcolor = 33554432
string picturename = "diploma.ico"
long picturemaskcolor = 536870912
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
gb_1 gb_1
gb_2 gb_2
end type

on p_f.create
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_5,&
this.dw_4,&
this.dw_3,&
this.gb_1,&
this.gb_2}
end on

on p_f.destroy
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type dw_5 from datawindow within p_f
integer x = 37
integer y = 12
integer width = 3447
integer height = 424
integer taborder = 30
string title = "none"
string dataobject = "dw_hc_empleedu_basica"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
string filtro
if this.GetColumnName() = 'dep_este' then
	dw_ciudad2.Retrieve(getitemstring(getrow(),'dep_este'))
//	filtro = "cdepto='" + this.getitemstring(this.getrow(),'dep_este') + "'"
//	dw_ciudad2.setfilter(filtro)
//	dw_ciudad2.filter()
end if
end event

event retrieveend;if rowcount = 0 then Return

if not isNull(getitemstring(getrow(),'dep_este')) then
	dw_ciudad2.Retrieve(getitemstring(getrow(),'dep_este'))
end if

end event

type dw_4 from datawindow within p_f
integer x = 101
integer y = 964
integer width = 3227
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_hv_estuotro"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;long fila
string valor
valor = describe("Evaluate('max(num_otro)',0)")
fila = this.insertrow(0)
this.scrollToRow(fila)
this.setitem(fila,'cod_enti',entidad)
this.setitem(fila,'tipodoc', tipodoc)
this.setitem(fila,'documento', documento)
this.setitem(fila,'num_otro',long(valor) + 1)
end event

event rbuttondown;m_gendw m_menu

m_menu = create m_gendw
m_menu.dw_obj = this
m_menu.popMenu(w_principal.PointerX(),w_principal.PointerY())

end event

type dw_3 from datawindow within p_f
integer x = 96
integer y = 504
integer width = 3310
integer height = 372
integer taborder = 30
string title = "none"
string dataobject = "dw_hv_estusuper"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;long ultimo
string valor
valor = describe("Evaluate('max(num_estus)',0)")
this.insertrow(0)
this.scrolltorow(this.rowcount())
this.setitem(this.getrow(),'cod_enti',entidad)
this.setitem(this.getrow(),'tipodoc',tipodoc)
this.setitem(this.getrow(),'documento',documento)
this.setitem(this.getrow(),'num_estus',long(valor) + 1)

end event

event rbuttondown;m_gendw m_menu

m_menu = create m_gendw
m_menu.dw_obj = this
m_menu.popMenu(w_principal.PointerX(),w_principal.PointerY())

end event

type gb_1 from groupbox within p_f
integer x = 55
integer y = 428
integer width = 3383
integer height = 476
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Educación Superior (Pregrado - Posgrado)"
end type

type gb_2 from groupbox within p_f
integer x = 59
integer y = 900
integer width = 3374
integer height = 488
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Otros estudios"
end type

type p_p from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3483
integer height = 1528
long backcolor = 67108864
string text = "Publicaciones / Idiomas"
long tabtextcolor = 33554432
string picturename = "editar.ico"
long picturemaskcolor = 536870912
dw_7 dw_7
dw_6 dw_6
gb_3 gb_3
gb_4 gb_4
end type

on p_p.create
this.dw_7=create dw_7
this.dw_6=create dw_6
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.dw_7,&
this.dw_6,&
this.gb_3,&
this.gb_4}
end on

on p_p.destroy
destroy(this.dw_7)
destroy(this.dw_6)
destroy(this.gb_3)
destroy(this.gb_4)
end on

type dw_7 from datawindow within p_p
integer x = 146
integer y = 704
integer width = 3136
integer height = 460
integer taborder = 40
string title = "none"
string dataobject = "dw_hv_idioma"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;long fila
string valor
valor = describe("Evaluate('max(num_idioma)',0)")
fila = this.insertrow(0)
this.scrolltorow(fila)
this.setitem(fila,'cod_enti',entidad)
this.setitem(fila,'tipodoc',tipodoc)
this.setitem(fila,'documento',documento)
this.setitem(fila,'num_idioma',long(valor) + 1)

end event

event rbuttondown;m_gendw m_menu

m_menu = create m_gendw
m_menu.dw_obj = this
m_menu.popMenu(w_principal.PointerX(),w_principal.PointerY())

end event

type dw_6 from datawindow within p_p
integer x = 142
integer y = 112
integer width = 3136
integer height = 432
integer taborder = 30
string title = "none"
string dataobject = "dw_hv_publicacion"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;long fila
string valor
valor = describe("Evaluate('max(num_logro)',0)")
fila = this.insertrow(0)
this.scrolltoRow(fila)
this.setitem(fila,'cod_enti',entidad)
this.setitem(fila,'tipodoc',tipodoc)
this.setitem(fila,'documento',documento)
this.setitem(fila,'num_logro',long(valor) + 1)
end event

event rbuttondown;m_gendw m_menu

m_menu = create m_gendw
m_menu.dw_obj = this
m_menu.popMenu(w_principal.PointerX(),w_principal.PointerY())

end event

type gb_3 from groupbox within p_p
integer x = 82
integer y = 36
integer width = 3273
integer height = 572
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Publicaciones e investigación"
end type

type gb_4 from groupbox within p_p
integer x = 96
integer y = 628
integer width = 3255
integer height = 576
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Idiomas diferentes al español"
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3483
integer height = 1528
long backcolor = 67108864
string text = "Experiencia"
long tabtextcolor = 33554432
string picturename = "curriculum.ico"
long picturemaskcolor = 536870912
pb_5 pb_5
pb_7 pb_7
pb_6 pb_6
pb_4 pb_4
pb_2 pb_2
pb_1 pb_1
dw_9 dw_9
dw_8 dw_8
gb_5 gb_5
end type

on tabpage_3.create
this.pb_5=create pb_5
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_4=create pb_4
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_9=create dw_9
this.dw_8=create dw_8
this.gb_5=create gb_5
this.Control[]={this.pb_5,&
this.pb_7,&
this.pb_6,&
this.pb_4,&
this.pb_2,&
this.pb_1,&
this.dw_9,&
this.dw_8,&
this.gb_5}
end on

on tabpage_3.destroy
destroy(this.pb_5)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_4)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_9)
destroy(this.dw_8)
destroy(this.gb_5)
end on

type pb_5 from picturebutton within tabpage_3
integer x = 713
integer y = 676
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "adelante_1.gif"
string disabledname = "d_adelante_1.gif"
alignment htextalign = left!
string powertiptext = "Siguiente"
end type

event clicked;tab_1.tabpage_3.dw_8.scrollnextrow()
end event

type pb_7 from picturebutton within tabpage_3
integer x = 855
integer y = 676
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ultimo.gif"
string disabledname = "d_ultimo.gif"
alignment htextalign = left!
string powertiptext = "Ultimo"
end type

event clicked;tab_1.tabpage_3.dw_8.scrolltorow(tab_1.tabpage_3.dw_8.rowcount())
end event

type pb_6 from picturebutton within tabpage_3
integer x = 567
integer y = 676
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar nuevo registro"
end type

event clicked;long fila
fila = dw_8.insertrow(0)
dw_8.scrolltorow(fila)
dw_8.setitem(fila,'cod_enti',entidad)
dw_8.setitem(fila,'tipodoc',tipodoc)
dw_8.setitem(fila,'documento',documento)	
dw_8.setitem(fila,'num_trab',fila)	


end event

type pb_4 from picturebutton within tabpage_3
integer x = 425
integer y = 676
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Registro"
end type

event clicked;tab_1.tabpage_3.dw_8.deleterow(tab_1.tabpage_3.dw_8.getrow());
end event

type pb_2 from picturebutton within tabpage_3
integer x = 283
integer y = 676
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras_1.gif"
string disabledname = "d_atras_1.gif"
alignment htextalign = left!
string powertiptext = "Anterior"
end type

event clicked;tab_1.tabpage_3.dw_8.scrollPriorRow()

end event

type pb_1 from picturebutton within tabpage_3
integer x = 142
integer y = 676
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras.gif"
string disabledname = "d_atras.gif"
alignment htextalign = left!
string powertiptext = "Primero"
end type

event clicked;tab_1.tabpage_3.dw_8.scrolltorow(1)
end event

type dw_9 from datawindow within tabpage_3
integer x = 114
integer y = 896
integer width = 3168
integer height = 432
integer taborder = 40
string title = "none"
string dataobject = "dw_hv_particular"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;long fila
string valor
valor = describe("Evaluate('max(num_acti)',0)")
fila = this.insertrow(0)
this.scrolltorow(fila)
this.setitem(fila,'cod_enti',entidad)
this.setitem(fila,'tipodoc',tipodoc)
this.setitem(fila,'documento',documento)
this.setitem(this.getrow(),'num_acti',long(valor) + 1)

end event

event rbuttondown;m_gendw m_menu

m_menu = create m_gendw
m_menu.dw_obj = this
m_menu.popMenu(w_principal.PointerX(),w_principal.PointerY())

end event

type dw_8 from datawindow within tabpage_3
integer x = 46
integer y = 8
integer width = 3342
integer height = 824
integer taborder = 40
string title = "none"
string dataobject = "dw_hv_empleo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if this.accepttext() = -1 then
	return
end if
string filtro
long calcula,dias,meses,anos
datetime termina
if this.GetColumnName()= 'ant_dpto' then
	dw_ciudad3.Retrieve(getitemstring(getrow(),'ant_dpto'))
//	filtro="cdepto='"+ this.getitemstring(this.getrow(),'ant_dpto') + "'"
//	dw_ciudad3.setfilter(filtro)
//	dw_ciudad3.filter()
end if
if this.getitemstring(this.getrow(),'estado')='1' then 
	termina=datetime(today())
	dias=DaysAfter(date(this.getitemdatetime(this.getrow(),'fec_ings')),date(termina))
else
	dias=DaysAfter(date(this.getitemdatetime(this.getrow(),'fec_ings')),date(this.getitemdatetime(this.getrow(),'fec_reti')))
end if
CHOOSE CASE dias
	CASE is <= 31
		this.setitem(this.getrow(),'dia_serv',dias)
		this.setitem(this.getrow(),'mes_serv',0)
		this.setitem(this.getrow(),'ano_serv',0)
	CASE 31 to 365
		meses=int(dias/30)
		dias = dias - (meses*30)
		this.setitem(this.getrow(),'dia_serv',dias)
		this.setitem(this.getrow(),'mes_serv',meses)
		this.setitem(this.getrow(),'ano_serv',0)
	CASE is > 365
		anos=int(dias/365)
		dias= dias - (anos*365)
		meses=int(dias/30)
		dias= dias - (meses*30)
		this.setitem(this.getrow(),'dia_serv',dias)
		this.setitem(this.getrow(),'mes_serv',meses)
		this.setitem(this.getrow(),'ano_serv',anos)
END CHOOSE

end event

event rowfocuschanged;if rowCount() = 0 or currentRow = 0 then Return

if not isNull(getitemstring(getrow(),'ant_dpto')) then
	dw_ciudad3.Retrieve(getitemstring(getrow(),'ant_dpto'))
end if

end event

type gb_5 from groupbox within tabpage_3
integer x = 78
integer y = 832
integer width = 3269
integer height = 516
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actividad particular"
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3483
integer height = 1528
long backcolor = 67108864
string text = "Hijos"
long tabtextcolor = 33554432
string picturename = "hijo.ico"
long picturemaskcolor = 536870912
dw_10 dw_10
gb_6 gb_6
end type

on tabpage_4.create
this.dw_10=create dw_10
this.gb_6=create gb_6
this.Control[]={this.dw_10,&
this.gb_6}
end on

on tabpage_4.destroy
destroy(this.dw_10)
destroy(this.gb_6)
end on

type dw_10 from datawindow within tabpage_4
integer x = 123
integer y = 128
integer width = 2277
integer height = 520
integer taborder = 40
string title = "none"
string dataobject = "dw_hv_hijos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;long fila
string valor
valor = describe("Evaluate('max(num_hijo)',0)")
fila = this.insertRow(0)
this.scrolltorow(fila)
this.setitem(fila,'cod_enti',entidad)
this.setitem(fila,'tipodoc',tipodoc)
this.setitem(fila,'documento',documento)
this.setitem(fila,'num_hijo',long(valor) + 1)

end event

event rbuttondown;m_gendw m_menu

m_menu = create m_gendw
m_menu.dw_obj = this
m_menu.popMenu(w_principal.PointerX(),w_principal.PointerY())

end event

type gb_6 from groupbox within tabpage_4
integer x = 69
integer y = 60
integer width = 2391
integer height = 640
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hijos del Empleado"
end type

type p_h from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3483
integer height = 1528
long backcolor = 67108864
string text = "Pasatiempos"
long tabtextcolor = 33554432
string picturename = "hobby.ico"
long picturemaskcolor = 536870912
dw_holgaz dw_holgaz
gb_9 gb_9
end type

on p_h.create
this.dw_holgaz=create dw_holgaz
this.gb_9=create gb_9
this.Control[]={this.dw_holgaz,&
this.gb_9}
end on

on p_h.destroy
destroy(this.dw_holgaz)
destroy(this.gb_9)
end on

type dw_holgaz from datawindow within p_h
integer x = 251
integer y = 196
integer width = 2400
integer height = 852
integer taborder = 50
string title = "none"
string dataobject = "dw_pasatiempo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long fila
string valor
valor = describe("Evaluate('max(num_pasa)',0)")
fila = this.insertRow(0)
this.scrolltorow(fila)
this.setitem(fila,'cod_enti',entidad)
this.setitem(fila,'tipodoc',tipodoc)
this.setitem(fila,'documento',documento)
this.setitem(fila,'num_pasa',long(valor) + 1)

end event

event rbuttondown;m_gendw m_menu

m_menu = create m_gendw
m_menu.dw_obj = this
m_menu.popMenu(w_principal.PointerX(),w_principal.PointerY())

end event

type gb_9 from groupbox within p_h
integer x = 178
integer y = 92
integer width = 2537
integer height = 1024
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pasatiempos"
end type

type p_foto from userobject within tab_1
event setscroll ( )
integer x = 18
integer y = 112
integer width = 3483
integer height = 1528
long backcolor = 67108864
string text = "Fotografía"
long tabtextcolor = 33554432
string picturename = "scanner.ico"
long picturemaskcolor = 536870912
ole_1 ole_1
pb_11 pb_11
pb_10 pb_10
pb_9 pb_9
vsb_1 vsb_1
hsb_1 hsb_1
pb_8 pb_8
p_1 p_1
end type

event setscroll();double altura
altura = tab_1.p_foto.height
if p_1.y + p_1.height >= altura then
	vsb_1.Visible = TRUE
	vsb_1.Tag = '1'
	if p_1.width + p_1.x >= tab_1.width then
		vsb_1.x = tab_1.width -  vsb_1.width - 50
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

if p_1.x + p_1.width > tab_1.width then
	hsb_1.Visible = TRUE
	hsb_1.Tag = '1'
	hsb_1.x = p_1.x
	if p_1.height + p_1.y >= altura then
		hsb_1.y = altura - hsb_1.height
	else
		hsb_1.y = p_1.y + p_1.height
	end if			
	hsb_1.width = tab_1.width - hsb_1.x - 100
	hsb_1.MinPosition = 0
	hsb_1.MaxPosition = p_1.x + p_1.width - tab_1.width
else
	hsb_1.Visible = FALSE
end if

end event

on p_foto.create
this.ole_1=create ole_1
this.pb_11=create pb_11
this.pb_10=create pb_10
this.pb_9=create pb_9
this.vsb_1=create vsb_1
this.hsb_1=create hsb_1
this.pb_8=create pb_8
this.p_1=create p_1
this.Control[]={this.ole_1,&
this.pb_11,&
this.pb_10,&
this.pb_9,&
this.vsb_1,&
this.hsb_1,&
this.pb_8,&
this.p_1}
end on

on p_foto.destroy
destroy(this.ole_1)
destroy(this.pb_11)
destroy(this.pb_10)
destroy(this.pb_9)
destroy(this.vsb_1)
destroy(this.hsb_1)
destroy(this.pb_8)
destroy(this.p_1)
end on

type ole_1 from olecustomcontrol within p_foto
boolean visible = false
integer x = 2377
integer y = 80
integer width = 128
integer height = 112
integer taborder = 60
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_hoja_vida.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type pb_11 from picturebutton within p_foto
string tag = "Ajustar"
integer x = 82
integer y = 320
integer width = 137
integer height = 120
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "camara_3.jpg"
alignment htextalign = right!
string powertiptext = "Ajustar la Foto"
end type

event clicked;long h, w, r_alto, r_ancho
r_alto = 1300
p_1.x = 293
p_1.y = 64
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
	p_1.Resize(ancho_ori,alto_ori)
	Tag = 'Ajustar'
end if

end event

type pb_10 from picturebutton within p_foto
integer x = 82
integer y = 448
integer width = 146
integer height = 128
integer taborder = 40
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

event clicked;ole_1.object.TwainSelectSource()
end event

type pb_9 from picturebutton within p_foto
integer x = 82
integer y = 192
integer width = 137
integer height = 120
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "camara_1.jpg"
alignment htextalign = right!
string powertiptext = "Obtener foto desde Camara"
end type

event clicked;string ls_filename_read
long ll_arch,ll_leyo,nImageID,ojo
ole_1.object.setlicensenumber('0430003366978686356442456')
If ole_1.object.TwainOpenDefaultSource() Then
	
	ole_1.object.TwainSetCurrentResolution (300)
	ole_1.object.TwainSetCurrentPixelType (2) //RGB
	ole_1.object.TwainSetCurrentBitDepth (8) //24 bpp
	
	nImageID = ole_1.object.TwainAcquireToGdPictureImage(1)

	ls_filename_read=tipodoc+ documento+'.jpg'
	ls_filename_read='foto.jpg'
	If nImageID <> 0 Then

		ojo=(ole_1.object.Getwidth ()  -(147*ole_1.object.GetHeight()/185))/2
	
		ole_1.object.CropLeft (ojo)
		ole_1.object.Cropright (ojo)
		
		ole_1.object.ResizeImage (147, 185, 3)
		ole_1.object.SaveAsJPEG('c:\windows\temp\'+ls_filename_read, 80)
		ole_1.object.CloseImage(nImageID)
	End If
	ole_1.object.TwainCloseSource()
	
	ll_arch=fileopen('c:\windows\temp\'+ls_filename_read,StreamMode! )
	if ll_arch=-1 then 
		messagebox('Error','no se pudo abrir el archivo')
		return
	end if
	ll_leyo= filereadex(ll_arch,tot_b)
	if ll_leyo<=0 then 
		messagebox('Error','no se pudo leer desde el archivo')
		return
	end if
	fileclose(ll_arch)
	p_1.setpicture(tot_b)
	p_2.SetPicture(tot_b)
	cambia=true
Else
	messagebox('Error obteniendo imagen',"No se puede abrir el dispositivo, su estado es: "+ trim(String(ole_1.object.TwainGetState)))
End If

end event

type vsb_1 from vscrollbar within p_foto
integer x = 2217
integer y = 72
integer width = 78
integer height = 1032
boolean bringtotop = true
end type

event moved;p_1.y = tab_1.p_foto.vsb_1.y - this.Position

end event

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

type hsb_1 from hscrollbar within p_foto
integer x = 297
integer y = 1352
integer width = 1815
integer height = 64
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

event moved;p_1.x = tab_1.p_foto.hsb_1.x - this.Position
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

type pb_8 from picturebutton within p_foto
integer x = 82
integer y = 60
integer width = 137
integer height = 120
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ocupar.gif"
alignment htextalign = left!
string powertiptext = "Traer Foto desde archivo"
end type

event clicked;string ls_path,ls_filename

GetFileOpenName("Selecione Archivo de Fotos",ls_path,ls_filename,"JPG","JPEG Files (*.JPG),*.JPG, Bitmap Files (*.BMP),*.BMP, GIF Files (*.GIF),*.GIF, WindosMetaFile Files (*.WMF),*.WMF")

//If ls_filename ="" Then return
//If ole_1.insertfile(ls_path) = 0 Then
//	st_type.text = ole_1.classlongname
//End If

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
	p_2.SetPicture(tot_b)
	setPhoto()
	p_2.Show()
	cambia = TRUE
end if
setScroll()
SetPointer(Arrow!)

end event

type p_1 from picture within p_foto
integer x = 293
integer y = 64
integer width = 1865
integer height = 1256
boolean originalsize = true
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_hoja_vida
integer x = 59
integer y = 96
integer width = 2176
integer height = 124
integer taborder = 10
string title = "none"
string dataobject = "dw_regla_gen_empleado"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.accepttext()
string filtro
if dw_emp.AcceptText() = -1 then Return -1
if dw_emp.GetNextModified(0,primary!) > 0 then
	if dw_emp.update() < 1 then
		rollback;
	else
		commit;
	end if
end if

tipodoc = this.getitemstring(this.getrow(),'tipodoc')
documento = this.getitemstring(this.getrow(),'documento')
if not isNull(dwo) then
	if (dwo.Name) <> 'documento' then Return
end if

this.retrieve(tipodoc, documento)
IF this.rowcount()=0 THEN
	this.InsertRow(0)
	if messagebox ("Atención","Empleado no encontrado. ~rDesea Crearlo?",Question!,YesNo!,2 )=1 then
		st_general messObj
		messObj.valor = tipodoc
		messObj.documento = documento
		messObj.dw_obj = dw_1
		openwithparm(w_cfgterceros, messObj)
		return
	else
		this.SetItem(this.getrow(),'tipodoc',tipodoc)
		this.SetItem(this.getrow(),'documento',documento)
		this.setcolumn('documento')
		return
	end if
else
	if this.GetItemString(this.GetRow(),'persona') = "J" then 
		messageBox("Error","Solo personas Naturales")
		Return
	end if
	if dw_emp.retrieve(tipodoc, documento) = 0 then
		if messagebox("Aviso","La persona es un tercero pero no empleado.Desea adicionarlo como empleado?",QUESTION!,YESNO!) = 1 then
			dw_emp.insertRow(1)
			dw_emp.SetItem(1,'tipodoc',tipodoc)
			dw_emp.SetItem(1,'documento',documento)
			dw_emp.SetItem(1,'usuario',usuario)
			dw_emp.SetItem(1,'usufecha',today())
			if dw_emp.Update() = 1 then
				commit;
			else
				Return
			end if
		else
			this.SetItem(this.getrow(),'tipodoc',tipodoc)
			this.SetItem(this.getrow(),'documento',documento)
			this.setcolumn('documento')
			Return
		end if
	end if
	cambia = false
	selectblob fotografia into :tot_b from empleados
 	where tipodoc=:tipodoc and documento=:documento;
	if SQLCA.SQLCode < 0 then
		MessageBox("SQL error",SQLCA.SQLErrText,Information!)
	end if
	if isNull(tot_b) then
		p_2.Hide()
		tab_1.p_foto.p_1.Hide()
	else
		tab_1.p_foto.p_1.Show()		
		p_2.SetPicture(tot_b)
		tab_1.p_foto.p_1.SetPicture(tot_b)
		tab_1.p_foto.TriggerEvent("SetScroll")
		ancho_ori = tab_1.p_foto.p_1.Width
		alto_ori = tab_1.p_foto.p_1.Height
		setPhoto()
		setScroll()
		p_2.Show()
	end if

	emplea=dw_1.getitemstring(dw_1.getrow(),'documento')
	entidad=dw_11.getitemnumber(dw_11.getrow(),1)
	tab_1.enabled=true
	tab_1.p_g.dw_2.retrieve(tipodoc, documento, entidad)
	if tab_1.p_g.dw_2.rowcount()= 0 then
		tab_1.p_g.dw_2.insertrow(1)
		tab_1.p_g.dw_2.setitem(1,'cod_enti',entidad)
		tab_1.p_g.dw_2.setitem(1,'tipodoc',dw_1.getitemstring(1,'tipodoc'))
		tab_1.p_g.dw_2.setitem(1,'documento',dw_1.getitemstring(1,'documento'))
		tab_1.p_g.dw_2.setitem(1,'apellido1',dw_1.getitemstring(1,'apellido1'))
		tab_1.p_g.dw_2.setitem(1,'apellido2',dw_1.getitemstring(1,'apellido2'))
		tab_1.p_g.dw_2.setitem(1,'nombre1',dw_1.getitemstring(1,'nombre1'))
		tab_1.p_g.dw_2.setitem(1,'nombre2',dw_1.getitemstring(1,'nombre2'))
		tab_1.p_g.dw_2.setitem(1,'nac_empl','1')
		tab_1.p_g.dw_2.setitem(1,'pai_naci',169)
		tab_1.p_g.dw_2.setitem(1,'pai_corr',169)
		
	end if
	tab_1.p_f.dw_3.retrieve(tipodoc, documento, entidad)
	tab_1.p_f.dw_4.retrieve(tipodoc, documento, entidad)
	tab_1.p_f.dw_5.retrieve(tipodoc, documento, entidad)
	tab_1.tabpage_3.dw_8.retrieve(tipodoc, documento, entidad)
	tab_1.tabpage_3.dw_9.retrieve(tipodoc, documento, entidad)
	tab_1.p_p.dw_6.retrieve(tipodoc,documento,entidad)
	tab_1.p_p.dw_7.retrieve(tipodoc,documento,entidad)
	tab_1.tabpage_4.dw_10.retrieve(tipodoc,documento,entidad)
	tab_1.p_h.dw_holgaz.retrieve(tipodoc,documento,entidad)
END IF

//if not isnull(tab_1.p_g.dw_2.getitemstring(tab_1.p_g.dw_2.getrow(),'dep_naci')) then //or tab_1.p_g.dw_2.getitemstring(tab_1.p_g.dw_2.getrow(),16)="" then 
//	filtro="cdepto='"+tab_1.p_g.dw_2.getitemstring(tab_1.p_g.dw_2.getrow(),'dep_naci')+"'"
//	dw_ciudad.setfilter(filtro)
//	dw_ciudad.filter()
//end if
//
//if not isnull(tab_1.p_g.dw_2.getitemstring(tab_1.p_g.dw_2.getrow(),'dep_corr')) then //or tab_1.p_g.dw_2.getitemstring(tab_1.p_g.dw_2.getrow(),21)="" then 
//	filtro="cdepto='"+tab_1.p_g.dw_2.getitemstring(tab_1.p_g.dw_2.getrow(),'dep_corr')+"'"
//	dw_ciudad1.setfilter(filtro)
//	dw_ciudad1.filter()
//end if

//if tab_1.p_f.dw_5.RowCount() > 0 then
//	if not isnull(tab_1.p_f.dw_5.getitemstring(tab_1.p_f.dw_5.getrow(),'dep_este')) then 
//		filtro="cdepto='"+tab_1.p_f.dw_5.getitemstring(tab_1.p_f.dw_5.getrow(),'dep_este')+"'"
//		dw_ciudad2.setfilter(filtro)
//		dw_ciudad2.filter()
//	end if
//end if

//if tab_1.tabpage_3.dw_8.RowCount() > 0 then
//	if not isnull(tab_1.tabpage_3.dw_8.getitemstring(tab_1.tabpage_3.dw_8.getrow(),'ant_dpto')) then //or tab_1.tabpage_3.dw_8.getitemstring(tab_1.tabpage_3.dw_8.getrow(),7)="" then 
//		filtro="cdepto='"+tab_1.tabpage_3.dw_8.getitemstring(tab_1.tabpage_3.dw_8.getrow(),'ant_dpto')+"'"
//		dw_ciudad3.setfilter(filtro)
//		dw_ciudad3.filter()
//	end if
//end if

end event

type gb_8 from groupbox within w_hoja_vida
integer x = 46
integer y = 28
integer width = 2199
integer height = 224
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empleado"
end type

type dw_emp from datawindow within w_hoja_vida
boolean visible = false
integer x = 2395
integer y = 236
integer width = 1202
integer height = 140
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_emp"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string td,doc
double ncargo
td = GetItemString(1,'tipodoc')
doc = GetItemString(1,'documento')

if GetColumnName() = 'estado' then
	if GetItemString(1,'estado') = '1' then
		if MessageBox("Atención","Al desactivar el empleado se establecerá: fecha de retiro, inactivo el cargo e inactivo el salario. Está seguro de Continuar?",QUESTION!,YESNO!,2) = 2 then 
			SetText('1')
			Return 2
		else
			AcceptText()
			if not isNull(GetItemDateTime(1,'fecha_retiro')) then
				SetItem(1,'fecha_retiro',today())
			end if
			select ncargo into :ncargo from emplecargo
			where tipodoc=:td and documento=:doc and estado='1';
			update emplecargo set estado = '2' 
			where tipodoc=:td and documento=:doc and ncargo=:ncargo and estado='1';
			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			update emplesalario set estado = '2' 
			where tipodoc=:td and documento=:doc and ncargo=:ncargo and estado='1';
			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			update empleubica set estado = '2' 
			where tipodoc=:td and documento=:doc and ncargo=:ncargo and estado='1';
			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			if Update() = -1 then
				rollback;
				Return -1
			end if
		end if
	end if
end if

end event

type dw_11 from datawindow within w_hoja_vida
boolean visible = false
integer x = 2295
integer y = 104
integer width = 777
integer height = 88
integer taborder = 20
string title = "none"
string dataobject = "dw_hv_regla_entidad"
boolean border = false
boolean livescroll = true
end type

type gb_7 from groupbox within w_hoja_vida
boolean visible = false
integer x = 2267
integer y = 20
integer width = 590
integer height = 224
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entidad"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
02w_hoja_vida.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12w_hoja_vida.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
