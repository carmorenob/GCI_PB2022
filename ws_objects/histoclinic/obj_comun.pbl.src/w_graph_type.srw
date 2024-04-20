$PBExportHeader$w_graph_type.srw
$PBExportComments$General response window to modify a graph type
forward
global type w_graph_type from w_center
end type
type uo_1 from u_graph_gallery within w_graph_type
end type
end forward

global type w_graph_type from w_center
integer x = 210
integer y = 168
integer width = 2295
integer height = 1196
string title = "Selección Tipo de Gráfica"
windowtype windowtype = response!
long backcolor = 74481808
string icon = "grafico.ico"
toolbaralignment toolbaralignment = alignatleft!
uo_1 uo_1
end type
global w_graph_type w_graph_type

type variables
graph igr_parm
datawindow idw_parm
object io_passed
end variables

event open;// Receive and remember in the igr_parm or idw_parm instance variable, the
// object that has been passed by the window that opened this.

graphicobject lgro_hold

lgro_hold = message.powerobjectparm

If lgro_hold.TypeOf() = Graph! Then
	io_passed = Graph!
	igr_parm = message.powerobjectparm
Elseif lgro_hold.TypeOf() = Datawindow! Then
	io_passed = Datawindow!
	idw_parm = message.powerobjectparm
End If

end event

on w_graph_type.create
int iCurrent
call super::create
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
end on

on w_graph_type.destroy
call super::destroy
destroy(this.uo_1)
end on

type pb_grabar from w_center`pb_grabar within w_graph_type
boolean visible = false
integer y = 0
string powertiptext = ""
end type

type uo_1 from u_graph_gallery within w_graph_type
boolean border = false
long backcolor = 74481808
end type

event gallery_ok;call super::gallery_ok;int li_col,li_row, li_ret
string ls_graph_type

// Get the graph type from the graph gallery user object.
li_ret = uf_query_gallery (li_row, li_col, ls_graph_type)
if li_ret = 0 then
	messagebox ("Error","Seleccionado Tipo Invalido")
	return
end if


If io_passed = Graph! Then
	// The user clicked on a graph type. Set the type in the passed graph
	// object.
	Choose Case ls_graph_type
		case "area3d"
			igr_parm.graphtype = area3d!
		case "areagraph"
			igr_parm.graphtype = areagraph!
		case "bar3dobjgraph"
			igr_parm.graphtype = bar3dobjgraph!
		case "barstack3dobjgraph"
			igr_parm.graphtype = barstack3dobjgraph!
		case "bargraph"
			igr_parm.graphtype = bargraph!
		case "bar3dgraph"
			igr_parm.graphtype = bar3dgraph!
		case "barstackgraph"
			igr_parm.graphtype = barstackgraph!
		case "col3dgraph"
			igr_parm.graphtype = col3dgraph!
		case "col3dobjgraph"
			igr_parm.graphtype = col3dobjgraph!
		case "colgraph"
			igr_parm.graphtype = colgraph!
		case "colstack3dobjgraph"
			igr_parm.graphtype = colstack3dobjgraph!
		case "colstackgraph"
			igr_parm.graphtype = colstackgraph!
		case "line3d"
			igr_parm.graphtype = line3d!
		case "linegraph"
			igr_parm.graphtype = linegraph!
			igr_parm.SetSeriesStyle('P1',NoSymbol!)
			igr_parm.SetSeriesStyle('P2',NoSymbol!)
			Igr_parm.SetSeriesStyle('P3',NoSymbol!)
			
		case "pie3d"
			igr_parm.graphtype = pie3d!
		case "piegraph"
			igr_parm.graphtype = piegraph!
		case "scattergraph"
			igr_parm.graphtype = scattergraph!
		case else
			messagebox ("Error!", "Tipo de gráfico inválido")
	end choose
Elseif io_passed = Datawindow! Then
	// The user clicked on a graph type. Set the type in the passed 
	// datawindow object.
	Choose Case ls_graph_type
		case "area3d"
			idw_parm.Object.gr_1.graphtype = 15
		case "areagraph"
			idw_parm.Object.gr_1.graphtype = 1
		case "bar3dobjgraph"
			idw_parm.Object.gr_1.graphtype = 4
		case "barstack3dobjgraph"
			idw_parm.Object.gr_1.graphtype = 6
		case "bargraph"
			idw_parm.Object.gr_1.graphtype = 2
		case "bar3dgraph"
			idw_parm.Object.gr_1.graphtype = 3
		case "barstackgraph"
			idw_parm.Object.gr_1.graphtype = 5
			case "col3dgraph"
			idw_parm.Object.gr_1.graphtype = 8
		case "col3dobjgraph"
			idw_parm.Object.gr_1.graphtype = 9
		case "colgraph"
			idw_parm.Object.gr_1.graphtype = 7
		case "colstack3dobjgraph"
			idw_parm.Object.gr_1.graphtype = 11
		case "colstackgraph"
			idw_parm.Object.gr_1.graphtype = 10
		case "line3d"
			idw_parm.Object.gr_1.graphtype = 16
		case "linegraph"
			idw_parm.Object.gr_1.graphtype = 12
		case "pie3d"
			idw_parm.Object.gr_1.graphtype = 17
		case "piegraph"
			idw_parm.Object.gr_1.graphtype = 13
		case "scattergraph"
			idw_parm.Object.gr_1.graphtype = 14
		case else
			messagebox ("Error!", "Tipo de gráfico Inválido")
	end choose
End If
Close (parent)
end event

on gallery_cancel;call u_graph_gallery::gallery_cancel;Close (parent)

end on

on uo_1.destroy
call u_graph_gallery::destroy
end on

