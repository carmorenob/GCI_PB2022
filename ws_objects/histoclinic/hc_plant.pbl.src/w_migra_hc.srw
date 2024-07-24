$PBExportHeader$w_migra_hc.srw
forward
global type w_migra_hc from window
end type
type pb_1 from picturebutton within w_migra_hc
end type
type st_folder from statictext within w_migra_hc
end type
type st_error from statictext within w_migra_hc
end type
type st_3 from statictext within w_migra_hc
end type
type st_2 from statictext within w_migra_hc
end type
type st_migs from statictext within w_migra_hc
end type
type st_total_regs from statictext within w_migra_hc
end type
type st_1 from statictext within w_migra_hc
end type
type cb_cancel from commandbutton within w_migra_hc
end type
type cb_1 from commandbutton within w_migra_hc
end type
type dw_1 from datawindow within w_migra_hc
end type
end forward

global type w_migra_hc from window
integer width = 4521
integer height = 1716
boolean titlebar = true
string title = "MIGRACIÓN DE HISTORIA CLÍNICA"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event we_post_open ( )
pb_1 pb_1
st_folder st_folder
st_error st_error
st_3 st_3
st_2 st_2
st_migs st_migs
st_total_regs st_total_regs
st_1 st_1
cb_cancel cb_cancel
cb_1 cb_1
dw_1 dw_1
end type
global w_migra_hc w_migra_hc

type variables
long il_total_mig=0 , il_errores=0
boolean ibn_cancelar
oleobject io_ole
end variables

forward prototypes
public function integer wf_migrar ()
end prototypes

event we_post_open();long ll_cuantos

select count(1) into :ll_cuantos
from hclin_reg_valor 
where tipo='M' ;


st_total_regs.text=string(ll_cuantos,'#,##0')

setpointer(arrow!)
end event

public function integer wf_migrar ();dw_1.reset()
dw_1.retrieve()

if dw_1.rowcount() =0 then
	messagebox("Atención","No hay registros para migrar")
	return 0
end if

long j,ll_contador,ll_nregistro,ll_item , ll_leyo
string ls_texto , ls_clug , ls_filename
integer li_arch
blob lbl_texto

sqlca.autocommit=true //para los blobs se necesita así

for j=1 to dw_1.rowcount()
	
	il_total_mig++
	
	st_migs.text=string(il_total_mig,'#,##0')
	
	yield()
	
	if ibn_cancelar then 
		ibn_cancelar=false
		return 0
	end if
	
	ls_texto=		dw_1.getitemstring(j,'long_texto')
	ll_contador=	dw_1.getitemnumber(j,'contador')
	ll_nregistro=	dw_1.getitemnumber(j,'nregistro')
	ll_item=			dw_1.getitemnumber(j,'item')
	ls_clug=			dw_1.getitemstring(j,'clugar')
	
	ls_filename=ls_clug+'-'+string(ll_contador)+'-'+string(ll_nregistro)+'-'+string(ll_item)
	
	if pos(ls_texto,'{\rtf',1)=0 then //no es necesario migrar pero debe actualizar el campo migrado
	
		update hclin_reg_valor set migrado='1' where contador=:ll_contador and clugar =:ls_clug and nregistro =:ll_nregistro and item=:ll_item;
		
		if sqlca.sqlcode<0 then
			
			dw_1.setitem(j,'migrado','E')
			
			update hclin_reg_valor set migrado='E' where contador=:ll_contador and clugar =:ls_clug and nregistro =:ll_nregistro and item=:ll_item;
			
			il_errores++
			st_error.text=string(il_errores,"#,##0")
			
		else
			dw_1.setitem(j,'migrado','1')
		end if
		
	else //migrar: Lo que se trae de la base de datos se escribe a un archivo .rtf que lee luego WORD y se le da guardar en formato TXT con codificación UFT8!
		//  Luego se lee desde PB a una variable de tipo texto que se convierte a BLOB y se manda a la base de datos, luego se actualiza el campo migrado a '1'
		
		li_arch=fileopen(st_folder.text+'\'+ls_filename+'.rtf',textmode!,Write!,Shared!,replace!,EncodingANSI!)
		ll_leyo=fileWriteEx(li_arch,ls_texto)
		fileclose(li_arch)
		
		if ll_leyo=0 then
			update hclin_reg_valor set migrado='E' where contador=:ll_contador and clugar =:ls_clug and nregistro =:ll_nregistro and item=:ll_item;
			il_errores++
			st_error.text=string(il_errores,"#,##0")
			continue
			
		end if
		
		try 
			io_ole.documents.open(st_folder.text+'\'+ls_filename+'.rtf')
			
			//Documentación en 
			//https://learn.microsoft.com/en-us/office/vba/api/word.saveas2
			io_ole.ActiveDocument.SaveAs2(st_folder.text+'\'+ls_filename+'.txt',5,false,"",false,"",true,false,true,false,false,65001,true) //65001 es UTF8!
			io_ole.ActiveDocument.Close()
			
		catch ( RuntimeError ex )
			
			update hclin_reg_valor set migrado='E' where contador=:ll_contador and clugar =:ls_clug and nregistro =:ll_nregistro and item=:ll_item;
			
			dw_1.setitem(j,'migrado','E')
			
			il_errores++
			st_error.text=string(il_errores,"#,##0")
			
			continue
			
		end try
		
		
		li_arch=fileopen(st_folder.text+'\'+ls_filename+'.txt',textmode!,Read!,Shared!,replace!,EncodingUTF8!)
		
		ls_texto=""
		
		ll_leyo= filereadex(li_arch,ls_texto)
		fileclose(li_arch)
		
		if ll_leyo<=0 then
			
			dw_1.setitem(j,'migrado','E')
				
			update hclin_reg_valor set migrado='E' where contador=:ll_contador and clugar =:ls_clug and nregistro =:ll_nregistro and item=:ll_item;
			il_errores++
			st_error.text=string(il_errores,"#,##0")
			
			
		else
			
			lbl_texto=blob(ls_texto)
			
			updateblob hclin_reg_valor set long_texto=:lbl_texto 
			where contador=:ll_contador and clugar =:ls_clug and nregistro =:ll_nregistro and item=:ll_item;
			
			if sqlca.sqlcode<0 then
				
				dw_1.setitem(j,'migrado','E')
				
				update hclin_reg_valor set migrado='E' where contador=:ll_contador and clugar =:ls_clug and nregistro =:ll_nregistro and item=:ll_item;
				
				il_errores++
				st_error.text=string(il_errores,"#,##0")
				
			else
				
				update hclin_reg_valor set migrado='1' where contador=:ll_contador and clugar =:ls_clug and nregistro =:ll_nregistro and item=:ll_item;
				
				dw_1.setitem(j,'migrado','1')
				filedelete(st_folder.text+'\'+ls_filename+'.txt')
				filedelete(st_folder.text+'\'+ls_filename+'.rtf')
				//si todo queda bien, se borran los archivos para no gastar espacio en disco
				//aquí solo se entra cuando la migración del registro queda bien
				
			end if
			
		end if
		
	end if
	
next

sqlca.autocommit=false

return 1
end function

on w_migra_hc.create
this.pb_1=create pb_1
this.st_folder=create st_folder
this.st_error=create st_error
this.st_3=create st_3
this.st_2=create st_2
this.st_migs=create st_migs
this.st_total_regs=create st_total_regs
this.st_1=create st_1
this.cb_cancel=create cb_cancel
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.st_folder,&
this.st_error,&
this.st_3,&
this.st_2,&
this.st_migs,&
this.st_total_regs,&
this.st_1,&
this.cb_cancel,&
this.cb_1,&
this.dw_1}
end on

on w_migra_hc.destroy
destroy(this.pb_1)
destroy(this.st_folder)
destroy(this.st_error)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_migs)
destroy(this.st_total_regs)
destroy(this.st_1)
destroy(this.cb_cancel)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;

setpointer(hourglass!)

post event we_post_open()

end event

type pb_1 from picturebutton within w_migra_hc
integer x = 4279
integer width = 123
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
boolean originalsize = true
string powertiptext = "Elegir carpeta donde se guardaran los RTF"
long backcolor = 67108864
end type

event clicked;GetFolder ( "Elegir Carpeta Temporal", st_folder.text )
end event

type st_folder from statictext within w_migra_hc
integer x = 2688
integer y = 4
integer width = 1586
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_error from statictext within w_migra_hc
integer x = 2149
integer width = 421
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_migra_hc
integer x = 1925
integer y = 16
integer width = 251
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Errores"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_migra_hc
integer x = 1061
integer y = 20
integer width = 297
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_migs from statictext within w_migra_hc
integer x = 1390
integer y = 4
integer width = 421
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_total_regs from statictext within w_migra_hc
integer x = 571
integer y = 8
integer width = 421
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_migra_hc
integer x = 82
integer y = 16
integer width = 475
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros por Migrar"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_migra_hc
integer x = 2240
integer y = 1432
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cancelar"
end type

event clicked;ibn_cancelar=true
enabled=false
cb_1.enabled=true
end event

type cb_1 from commandbutton within w_migra_hc
integer x = 1806
integer y = 1432
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migrar"
end type

event clicked;if st_folder.text='' then
	messagebox("Atención","Debe elegir una carpeta para continuar")
	return 
end if

enabled=false
cb_cancel.enabled=true
int li_result

io_ole=create oleobject

li_result=io_ole.ConnectToNewObject("word.application.8")
IF  li_result<> 0 THEN
	messagebox("Atención","No se pudo conectar al OLE de Word!!")
	return
end if

do while wf_migrar()>0
loop

io_ole.Quit()//cierra la instancia de WORD que se abre

io_ole.DisconnectObject()
destroy io_ole
end event

type dw_1 from datawindow within w_migra_hc
integer x = 69
integer y = 84
integer width = 4343
integer height = 1340
integer taborder = 10
string title = "none"
string dataobject = "dw_xa_migrar_hc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
07w_migra_hc.bin 
2A00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000273fddc80101aaea9aa00a7985949370000000000000000000000000006c628d001da7a1600000003000002c000000000004f00010065006c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000001400000000006f00430074006e006e006500730074000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010200120000000100000003ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000000c200000000004f00020065006c007200500073006500300030000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000020018ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000050000015400000000fffffffe000000020000000300000004fffffffe000000060000000700000008000000090000000afffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
27ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0200000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074725c7b615c31665c69736e69736e61316770635c323532666665646f6e5c306f6369757461706d6665645c676e616c363232396f665c7b6274746e665c7b6c6e665c30665c6c6972616863307465736c614320697262690d7d7d3b2a5c7b0a6e65675c746172655220726f6568636920303264302e30313039312e5c7d313477656976646e696b63755c340a0d20317261705c61735c645c30303237326c736c735c36746c756d30665c313273665c616c5c323031676e7261705c0d7d0a0d0000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffff0000000e0000000400000001ffffffff0000000200000000ffffffe6ffffffe60000012400090001009203000000000000000074007400000626000000de000f43464d57000000010001000000004b7c0001000000bc00000000000000bc000000010000006c00000000000000000000ffff0000ffffffff0000ffff00000000ffe70000ffe7ffff4520ffff0000464d00bc00010005000000010000000000000000000000000000078000000438000001e00000010e0000000000000000000000000000530000001eb0000700120004000c000000010000002000000018000000600000006000000060000000600000002000000018000000600000006000000060000000600000000e000000140000000000000010000000140000000400000103000000050008020b000000000000000000050000020c00040000010200000003000100000000494e414e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17w_migra_hc.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
