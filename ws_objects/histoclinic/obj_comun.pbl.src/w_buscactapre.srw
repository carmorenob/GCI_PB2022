$PBExportHeader$w_buscactapre.srw
forward
global type w_buscactapre from window
end type
type dw_1 from datawindow within w_buscactapre
end type
end forward

global type w_buscactapre from window
integer width = 5509
integer height = 1580
boolean titlebar = true
string title = "Busqueda Cuentas - Presupuesto"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "plan.ico"
boolean center = true
event npos ( )
dw_1 dw_1
end type
global w_buscactapre w_buscactapre

type variables
st_ppto st_parm
string filtro
end variables

forward prototypes
public function integer filtrar ()
end prototypes

event npos();y = 10
end event

public function integer filtrar ();long ret
if filtro = '' then filtro = st_parm.filtro
ret = dw_1.SetFilter(filtro)
ret = dw_1.Filter()
Return ret
end function

on w_buscactapre.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_buscactapre.destroy
destroy(this.dw_1)
end on

event open;st_parm = Message.PowerObjectParm
dw_1.SetTransObject(SQLCA)

dw_1.SetFilter(st_parm.filtro)
dw_1.Filter()
dw_1.Retrieve(st_parm.cod_vigencia)

PostEvent("npos")

end event

type dw_1 from datawindow within w_buscactapre
integer width = 5426
integer height = 1384
integer taborder = 10
string title = "none"
string dataobject = "dw_plan_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long f,fs
string valor, coddoc
if isValid(st_parm.dw_obj) then
	if st_parm.dw_obj.DataObject = 'dw_recon_pend' then
		st_parm.dw_obj.SetItem(st_parm.dw_obj.GetRow(),'codtotal_new',GetItemString(row,'codtotal'))
		st_parm.dw_obj.SetItem(st_parm.dw_obj.GetRow(),'descrip_new',GetItemString(row,'descrip'))
		st_parm.dw_obj.Event itemchanged(st_parm.dw_obj.GetRow(),st_parm.dw_obj.object.codtotal_new,GetItemString(row,'codtotal'))
		close(parent)
		Return
	end if
	if st_parm.dw_obj.DataObject='dw_reg_ccosto'  then
		if st_parm.filtro = "tipo='0' and movimiento='1'" then
			if st_parm.campo='cta_pres_recon' then
				st_parm.dw_obj.SetItem(st_parm.dw_obj.GetRow(),'cta_pres_recon',GetItemString(row,'codtotal'))
			end if
			if st_parm.campo='cod_total_arq' then
				st_parm.dw_obj.SetItem(st_parm.dw_obj.GetRow(),'cod_total_arq',GetItemString(row,'codtotal'))
			end if
		end if
		close(parent)
		Return
	
//cod_total_arq
	end if
	if st_parm.dw_obj.ClassName() = 'dw_cc' then
		if st_parm.filtro = "tipo='0' and movimiento='1'" then
			st_parm.dw_obj.SetItem(st_parm.dw_obj.GetRow(),'codtotal_ingre',GetItemString(row,'codtotal'))
		else
			st_parm.dw_obj.SetItem(st_parm.dw_obj.GetRow(),'codtotal_gasto',GetItemString(row,'codtotal'))
		end if
		close(parent)
		Return
	end if
	fs = st_parm.dw_src.GetRow()
	coddoc = st_parm.dw_src.GetItemString(fs,'coddoc')
	f = st_parm.dw_obj.Find("codtotal='"+ GetItemString(row,'codtotal') +"'",1,st_parm.dw_obj.RowCount())
	if f = 0 then
		valor = st_parm.dw_obj.Describe("Evaluate('max(sitem)',0)")
		f = st_parm.dw_obj.InsertRow(0)
		st_parm.dw_obj.SetItem(f,'coddoc',st_parm.dw_src.GetItemString(fs,'coddoc'))
		st_parm.dw_obj.SetItem(f,'clugar',st_parm.dw_src.GetItemString(fs,'clugar'))
		st_parm.dw_obj.SetItem(f,'numdoc',st_parm.dw_src.GetItemNumber(fs,'numdoc'))
		st_parm.dw_obj.SetItem(f,'item',st_parm.dw_src.GetItemNumber(fs,'item'))
		st_parm.dw_obj.SetItem(f,'sitem',long(valor) + 1)
		
		st_parm.dw_obj.SetItem(f,'cod_vigencia',GetItemNumber(row,'cod_vigencia'))
		st_parm.dw_obj.SetItem(f,'codtotal',GetItemString(row,'codtotal'))
		st_parm.dw_obj.SetItem(f,'descrip',GetItemString(row,'descrip'))
		st_parm.dw_obj.SetItem(f,'planeado_inicial',GetItemNumber(row,'planeado_inicial'))
		st_parm.dw_obj.SetItem(f,'acum_traslado',GetItemNumber(row,'acum_traslado'))
		st_parm.dw_obj.SetItem(f,'acum_adicion',GetItemNumber(row,'acum_adicion'))
		st_parm.dw_obj.SetItem(f,'acum_recorte',GetItemNumber(row,'acum_recorte'))
		st_parm.dw_obj.SetItem(f,'acum_dispon',GetItemNumber(row,'acum_dispon'))
		st_parm.dw_obj.SetItem(f,'acum_mod_dispo',GetItemNumber(row,'acum_mod_dispo'))
		st_parm.dw_obj.SetItem(f,'acum_reserva',GetItemNumber(row,'acum_reserva'))
		st_parm.dw_obj.SetItem(f,'acum_mod_reserv',GetItemNumber(row,'acum_mod_reserv'))
		st_parm.dw_obj.SetItem(f,'acum_girado',GetItemNumber(row,'tot_girado'))
		st_parm.dw_obj.SetItem(f,'acum_recon',GetItemNumber(row,'tot_recon'))
		st_parm.dw_obj.SetItem(f,'acum_recaudo',GetItemNumber(row,'tot_recau'))
	end if
elseif isValid(st_parm.dw_sle) then
	st_parm.dw_sle.SetItem(1,'codtotal',GetItemString(row,'codtotal'))
	st_parm.dw_sle.TriggerEvent(itemchanged!)
elseif isValid(st_parm.sle_1) then
	st_parm.sle_1.Text = GetItemString(row,'codtotal')
	st_parm.sle_1.TriggerEvent(modified!)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)


end event

