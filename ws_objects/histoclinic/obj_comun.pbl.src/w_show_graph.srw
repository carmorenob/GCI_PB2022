$PBExportHeader$w_show_graph.srw
forward
global type w_show_graph from window
end type
type dw_gr from datawindow within w_show_graph
end type
end forward

global type w_show_graph from window
integer width = 2880
integer height = 1784
boolean titlebar = true
string title = "Gráfica"
string menuname = "m_graph"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "grafico.ico"
boolean center = true
event graph_type pbm_custom01
event graph_color pbm_custom06
event graph_title pbm_custom02
event spacing pbm_custom04
event copy_to_clipboard pbm_custom03
event setfields ( )
event openfile ( )
event getdata ( )
dw_gr dw_gr
end type
global w_show_graph w_show_graph

type variables

end variables

event graph_type;SetPointer(HourGlass!)

// Open the response window to set the graph type. Pass it the graph
// object and it will do the rest.
OpenWithParm (w_graph_type, dw_gr)

end event

event graph_color;SetPointer(HourGlass!)

//open the change color window and pass the graph to it in the 
//message.powerobjectparm
OpenWithParm (w_graph_color, dw_gr)
end event

event graph_title;SetPointer(HourGlass!)

OpenWithParm (w_graph_title, dw_gr)

end event

event spacing;SetPointer(HourGlass!)

// Open the response window to set spacing. Pass it the graph so it
// can make changes.
OpenWithParm (w_graph_spacing, dw_gr)


end event

event copy_to_clipboard;// Copy the graph to the Windows Clipboard.
dw_gr.ClipBoard("gr_1")

end event

event setfields();SetPointer(HourGlass!)

//open the change color window and pass the graph to it in the 
//message.powerobjectparm
OpenWithParm (w_graph_conf, dw_gr)
end event

event openfile();string is_filename, is_fullname
int li_fileid, loops, i, flen, byte
string row_dw

SetPointer (HourGlass!)
if GetFileOpenName ("Open", is_fullname, is_filename, "grf", &
							"graficos GCI (*.grf),*.grf") < 1 then return

flen = FileLength(is_fullname)
li_fileid = FileOpen (is_fullname, textMode!)

FileReadex(li_fileid, row_dw)
FileClose (li_fileid)

Disable (m_graph.m_file.m_guardar)

this.title = Upper (is_filename)

dw_gr.Create(row_dw)
dw_gr.SetTransObject(SQLCA)
end event

event getdata();dw_gr.Retrieve()

end event

on w_show_graph.create
if this.MenuName = "m_graph" then this.MenuID = create m_graph
this.dw_gr=create dw_gr
this.Control[]={this.dw_gr}
end on

on w_show_graph.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_gr)
end on

event open;//dw_gr.SetTransObject(SQLCA)
//dw_gr.Retrieve()

end event

type dw_gr from datawindow within w_show_graph
integer x = 69
integer y = 72
integer width = 2702
integer height = 1412
integer taborder = 10
string title = "none"
string dataobject = "dw_edad_pac"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

