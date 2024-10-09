$PBExportHeader$uo_menus.sru
forward
global type uo_menus from userobject
end type
type dw_1 from datawindow within uo_menus
end type
type tv_1 from treeview within uo_menus
end type
end forward

global type uo_menus from userobject
integer width = 1641
integer height = 1900
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
tv_1 tv_1
end type
global uo_menus uo_menus

type variables
menu i_menu
string i_grupo,i_aplic
boolean i_scroll
uo_datastore ids_oprsum
end variables

forward prototypes
public function long inserta (long p_pos, menu p_menu)
public subroutine rec_cambiar (long p_handle, integer p_stateindex)
public subroutine rec_revisa_padre (long p_handle)
public function integer iniciar (menu p_menu, string p_grupo, string p_aplic)
public function integer guardar ()
end prototypes

public function long inserta (long p_pos, menu p_menu);treeviewitem ll
long j,k,donde
if p_menu.text='-' or left(p_menu.classname(),5)='m_rep'then return -1
j=tv_1.InsertItemlast(p_pos,p_menu.text, 0)
tv_1.getitem(j,ll)
donde=dw_1.find('codmenu="'+p_menu.classname()+'"',1,dw_1.rowcount())
if donde=0 then
	donde=dw_1.insertrow(0)
	dw_1.setitem(donde,'codmenu',p_menu.classname())
	dw_1.setitem(donde,'codgrupo',i_grupo)
	dw_1.setitem(donde,'aplicacion',i_aplic)
	if pos(p_menu.text,'	')<>0 then
		dw_1.setitem(donde,'mostrar',left(p_menu.text,pos(p_menu.text,'	')-1))
		dw_1.setitem(donde,'shortcut',mid(p_menu.text,pos(p_menu.text,'	')+1))
	else
		dw_1.setitem(donde,'mostrar',p_menu.text)
	end if
	dw_1.setitem(donde,'ayudabarra',p_menu.toolbaritemtext)
	dw_1.setitem(donde,'microayuda',p_menu.microhelp)
	dw_1.setitem(donde,'menuribon',p_menu.tag)
	if p_menu.toolbaritemname<>'' then dw_1.setitem(donde,'toolbar','1')
//	if dw_1.getitemstring(donde,'permiso')='0' then
//		ll.StatePictureIndex	=2
//	else
//		ll.StatePictureIndex	=1
//	end if	
else
	if dw_1.getitemstring(donde,'permiso')='0' then
		ll.StatePictureIndex	=2
	else
		ll.StatePictureIndex	=1
	end if
	if p_menu.toolbaritemname<>'' then 
		dw_1.setitem(donde,'toolbar','1')
	else
		dw_1.setitem(donde,'toolbar','0')
	end if
	string temp
	temp=dw_1.getitemstring(donde,'texto')
	if pos(temp,'~t')<>0 then
		dw_1.setitem(donde,'mostrar',left(temp,pos(temp,'~t')-1))
		dw_1.setitem(donde,'shortcut',mid(temp,pos(temp,'~t')+1))
	else
		dw_1.setitem(donde,'mostrar',temp)
	end if
	dw_1.setitem(donde,'menuribon',p_menu.tag)
end if
ll.data=p_menu.classname()
//lo de suministros
if i_aplic='ADM' and p_menu.getparent().classname()='m_12' then
	menu m_temp
	m_temp=p_menu.getparent()
	for k=1 to upperbound(m_temp.item[])
		if m_temp.item[k]=p_menu then
			if k<=ids_oprsum.rowcount() then
				ll.label=ids_oprsum.getitemstring(k,'desdoc')
				dw_1.setitem(donde,'mostrar',ll.label)
				dw_1.setitem(donde,'sumin','1')
				dw_1.setitem(donde,'menuribon',ids_oprsum.getitemstring(k,'ribbon'))
			else
				tv_1.deleteitem(j)
				dw_1.deleterow(donde)
				return -1
			end if
		end if
	next
end if
// fin lo de suministros
tv_1.setitem(j,ll)
long ll_tvi
ll_tvi = tv_1.FindItem(RootTreeItem! , 0)
if ll_tvi=-1 then return 0
return j
end function

public subroutine rec_cambiar (long p_handle, integer p_stateindex);long handle
treeviewitem tt
tv_1.getitem(p_handle,tt)
if tt.children then
	handle=tv_1.finditem(ChildTreeItem!,p_handle)
	do while handle<>-1
		rec_cambiar(handle,p_stateindex)
		handle=tv_1.finditem(nextTreeItem!,handle)
	loop
end if
tt.statepictureindex=p_stateindex
if p_stateindex=1 then
	dw_1.setitem(dw_1.find('codmenu="'+string(tt.data)+'"',1,dw_1.rowcount()),'permiso','1')
else
	dw_1.setitem(dw_1.find('codmenu="'+string(tt.data)+'"',1,dw_1.rowcount()),'permiso','0')	
end if
tv_1.setitem(p_handle,tt)

end subroutine

public subroutine rec_revisa_padre (long p_handle);treeviewitem tt
long handle,medios=0,todos=0,ori,cuantos=0
handle=tv_1.finditem(ParentTreeItem!,p_handle)
ori=handle
if handle<>-1 then
	handle=tv_1.finditem(ChildTreeItem!,handle)
	do while handle<>-1
		tv_1.getitem(handle,tt)
		cuantos++
		if tt.statepictureindex=1 then
			todos++
		elseif tt.statepictureindex=3 then
			medios++
		end if
		handle=tv_1.finditem(nextTreeItem!,handle)
	loop
	tv_1.getitem(ori,tt)
	dw_1.setitem(dw_1.find('codmenu="'+string(tt.data)+'"',1,dw_1.rowcount()),'permiso','1')
	if medios=0 and todos=0 then
		tt.statepictureindex=2
		dw_1.setitem(dw_1.find('codmenu="'+string(tt.data)+'"',1,dw_1.rowcount()),'permiso','0')
	elseif medios>0 or (todos>0 and todos<cuantos) then
		tt.statepictureindex=3
	else
		tt.statepictureindex=1
	end if
	tv_1.setitem(ori,tt)
	rec_revisa_padre(ori)
end if
end subroutine

public function integer iniciar (menu p_menu, string p_grupo, string p_aplic);i_menu=p_menu
i_grupo=p_grupo
i_aplic=p_aplic
tv_1.DeleteItem(0)
dw_1.settransobject(sqlca)
if i_aplic='ADM' then
	ids_oprsum=create uo_datastore
	ids_oprsum.dataobject='dw_oprsum'
	ids_oprsum.settransobject(sqlca)
	ids_oprsum.retrieve()
end if
dw_1.retrieve(i_grupo,i_aplic)
tv_1.event pinta_menu(p_menu,0)

long ll_tvi
ll_tvi = tv_1.FindItem(RootTreeItem! , 0)
do while ll_tvi > 0
	tv_1.expandall(ll_tvi)
	ll_tvi= tv_1.FindItem(NextVisibleTreeItem!,ll_tvi)
loop
return 1
end function

public function integer guardar ();long j,ll_tvi
string temp
dw_1.accepttext()
for j=1 to dw_1.rowcount()
	temp=trim(dw_1.getitemstring(j,'mostrar'))
	if pos(temp,'~t')<>0 then
		temp=left(temp,pos(temp,'~t')-1)
	end if
		
	//if not isnull(dw_1.getitemstring(j,'shortcut')) then temp+='	'+dw_1.getitemstring(j,'shortcut')
	if isnull(dw_1.getitemstring(j,'texto')) or dw_1.getitemstring(j,'texto')<>temp then dw_1.setitem(j,'texto',temp)
next
return dw_1.update()

end function

on uo_menus.create
this.dw_1=create dw_1
this.tv_1=create tv_1
this.Control[]={this.dw_1,&
this.tv_1}
end on

on uo_menus.destroy
destroy(this.dw_1)
destroy(this.tv_1)
end on

type dw_1 from datawindow within uo_menus
integer x = 9
integer y = 1608
integer width = 1600
integer height = 268
integer taborder = 20
string title = "none"
string dataobject = "dw_seg_menus"
boolean border = false
boolean livescroll = true
end type

event rowfocuschanging;if not i_scroll then return 1
end event

type tv_1 from treeview within uo_menus
event p_revisa ( long p_handle,  integer p_estado )
event pinta_menu ( menu p_menu,  long p_donde )
integer width = 1614
integer height = 1584
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
boolean tooltips = false
boolean checkboxes = true
boolean trackselect = true
boolean fullrowselect = true
long picturemaskcolor = 536870912
string statepicturename[] = {"sel_t.gif","sel_0.gif","sel_a.gif"}
long statepicturemaskcolor = 1073741824
end type

event p_revisa(long p_handle, integer p_estado);treeviewitem tt
getitem(p_handle,tt)
if tt.statepictureindex<>p_estado then
	if p_estado=1 or p_estado=3 then
		tt.statepictureindex=2
	else
		tt.statepictureindex=1
	end if
	setitem(p_handle,tt)
	rec_cambiar(p_handle,tt.statepictureindex)
	rec_revisa_padre(p_handle)
end if
end event

event pinta_menu(menu p_menu, long p_donde);long i,j,cuantos_sel=0,cuantos_medio=0
if isvalid(p_menu.getparent()) then i=inserta(p_donde,p_menu)//si es el primero no lo inserta
if upperbound(p_menu.item[])>0 then
	for j=1 to upperbound(p_menu.item[])
		event pinta_menu(p_menu.item[j],i)
	next
end if
rec_revisa_padre(i)
end event

event clicked;treeviewitem tt
getitem(handle,tt)
selectitem(handle)
post event p_revisa(handle,tt.statepictureindex)

end event

event key;if key=keyspacebar! then
	treeviewitem tt
	getitem(FindItem(CurrentTreeItem!, 0),tt)
	post event p_revisa(tt.itemhandle,tt.statepictureindex)
end if
end event

event selectionchanged;treeviewitem ll
getitem(newhandle,ll)
ll.bold=true
i_scroll=true
dw_1.scrolltorow(dw_1.find('codmenu="'+string(ll.data)+'"',1,dw_1.rowcount()))
i_scroll=false
setitem(newhandle,ll)
end event

event selectionchanging;if dw_1.accepttext()=-1 then 
	dw_1.setfocus()
	return 1
end if
treeviewitem ll
getitem(oldhandle,ll)
ll.bold=false
setitem(oldhandle,ll)
end event

