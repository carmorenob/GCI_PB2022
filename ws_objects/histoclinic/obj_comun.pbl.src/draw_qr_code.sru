$PBExportHeader$draw_qr_code.sru
forward
global type draw_qr_code from nonvisualobject
end type
end forward

global type draw_qr_code from nonvisualobject
end type
global draw_qr_code draw_qr_code

type variables
qr_config iqr_config
private reed_solomon_encoder i_rs_encoder
private datastore ids_qr
end variables

forward prototypes
private subroutine draw_base (integer ai_version)
private subroutine if_init_h_data (integer ai_version)
private subroutine if_init_l_data (integer ai_version)
private subroutine if_init_m_data (integer ai_version)
private subroutine if_init_q_data (integer ai_version)
private subroutine if_init_marcas_alineacion (integer ai_version)
private subroutine if_init_tamanyos (integer ai_version)
private function integer if_mask (integer ai_fila, integer ai_col, integer ai_mask)
private subroutine if_init (integer ai_version, string as_level_correction)
private function integer if_data_size (integer ai_version, string as_level_correction)
private subroutine if_format_string (integer ai_mask, string as_level, integer ai_version)
private function string ordenar_mensaje (string as_msg[], string as_nivel_correccion)
public function blob draw_message_blob (string as_msg, string as_level_correction)
public function string draw_msg (string as_msg, string as_level_correction, string as_filename)
end prototypes

private subroutine draw_base (integer ai_version);double li_size
Integer li_reservados=1
li_size= iqr_config.tamanyo
ids_qr.reset()

st_xy lst_vacios[]
iqr_config.reservados=lst_vacios
long j,k,l
int i

for j=1 to li_size
	ids_qr.insertrow(0)
	for k=1 to li_size
		ids_qr.setitem(j,'bit'+string(k),'0')
	next
next

//los tres recuadros grandes
for j=1 to 7
	ids_qr.setitem(1,'bit'+string(j),'1')
	ids_qr.setitem(j,'bit1','1')
	ids_qr.setitem(j,'bit7','1')
	ids_qr.setitem(7,'bit'+string(j),'1')
	
	ids_qr.setitem(1,'bit'+string(j -7+li_size),'1')
	ids_qr.setitem(j,'bit'+string(li_size -6),'1')
	ids_qr.setitem(j,'bit'+string(li_size),'1')
	ids_qr.setitem(7,'bit'+string(j -7+li_size),'1')
	
	ids_qr.setitem(li_size -6,'bit'+string(j),'1')
	ids_qr.setitem(li_size -6 +j,'bit1','1')
	ids_qr.setitem(li_size -6 +j,'bit7','1')
	ids_qr.setitem(li_size,'bit'+string(j),'1')
next

//los tres cuadrados pequeños dentro de los grandes
for j=1 to 3
	ids_qr.setitem(3,'bit'+string(2+j),'1')
	ids_qr.setitem(4,'bit'+string(2+j),'1')
	ids_qr.setitem(5,'bit'+string(2+j),'1')
	
	ids_qr.setitem(3,'bit'+string(li_size -5 +j),'1')
	ids_qr.setitem(4,'bit'+string(li_size -5 +j),'1')
	ids_qr.setitem(5,'bit'+string(li_size -5 +j),'1')
	
	ids_qr.setitem(li_size -5 +j,'bit3','1')
	ids_qr.setitem(li_size -5 +j,'bit4','1')
	ids_qr.setitem(li_size -5 +j,'bit5','1')
	
next

//marcas alineacion intermedias
int li_fila,li_col,li_cuantos
li_cuantos=upperbound(iqr_config.marcas_alineacion[])
for j=1 to li_cuantos
	
	for k=1 to li_cuantos
	
		li_fila=iqr_config.marcas_alineacion[j] +1
		li_col=iqr_config.marcas_alineacion[k] +1
		
		if (li_fila<=7 and li_col<=7) or (li_fila<=7 and li_col>=li_size -6) or (li_fila>=li_size -6 and li_col<=7) then continue
		
		ids_qr.setitem(li_fila ,'bit'+string(li_col ),'1')
		
		for i=1 to 5
			ids_qr.setitem(li_fila -2,'bit'+string(li_col -3 +i),'1')
			ids_qr.setitem(li_fila +2,'bit'+string(li_col -3 +i),'1')
			
			ids_qr.setitem(li_fila -3 +i,'bit'+string(li_col -2),'1')
			ids_qr.setitem(li_fila -3 +i,'bit'+string(li_col +2),'1')
		next
		
		iqr_config.reservados[li_reservados].fila=li_fila -2;	iqr_config.reservados[li_reservados].col=li_col -2
		li_reservados+=1
		
		iqr_config.reservados[li_reservados].fila=li_fila +2;	iqr_config.reservados[li_reservados].col=li_col +2
		li_reservados+=1
	
		
next
	
next
//lineas punteadas
for j=9 to li_size -8 step 2
	ids_qr.setitem(7,'bit'+string(j),'1')
	ids_qr.setitem(j,'bit7','1')
next

//los reservados de las lineas punteadas
iqr_config.reservados[li_reservados].fila=9;	iqr_config.reservados[li_reservados].col=7
li_reservados+=1
iqr_config.reservados[li_reservados].fila=li_size -8;	iqr_config.reservados[li_reservados].col=7
li_reservados+=1

iqr_config.reservados[li_reservados].fila=7;	iqr_config.reservados[li_reservados].col=9
li_reservados+=1
iqr_config.reservados[li_reservados].fila=7;	iqr_config.reservados[li_reservados].col=li_size -8
li_reservados+=1


//los reservados de los tres cuadrados grandes
iqr_config.reservados[li_reservados].fila=1;	iqr_config.reservados[li_reservados].col=1
li_reservados+=1
iqr_config.reservados[li_reservados].fila=9;	iqr_config.reservados[li_reservados].col=9
li_reservados+=1

iqr_config.reservados[li_reservados].fila=1;	iqr_config.reservados[li_reservados].col=li_size -7
li_reservados+=1
iqr_config.reservados[li_reservados].fila=9;	iqr_config.reservados[li_reservados].col=li_size
li_reservados+=1

iqr_config.reservados[li_reservados].fila=li_size -7;	iqr_config.reservados[li_reservados].col=1
li_reservados+=1
iqr_config.reservados[li_reservados].fila=li_size;	iqr_config.reservados[li_reservados].col=9
li_reservados+=1

//los reservados de la version cuando es mayor a 7
if ai_version>=7 then
	iqr_config.reservados[li_reservados].fila=li_size -10;	iqr_config.reservados[li_reservados].col=1
	li_reservados+=1
	iqr_config.reservados[li_reservados].fila=li_size -8;	iqr_config.reservados[li_reservados].col=6
	li_reservados+=1
	
	iqr_config.reservados[li_reservados].fila=1;	iqr_config.reservados[li_reservados].col=li_size -10
	li_reservados+=1
	iqr_config.reservados[li_reservados].fila=6;	iqr_config.reservados[li_reservados].col=li_size -8
	li_reservados+=1
end if


int fil,col
for j=1 to upperbound(iqr_config.reservados) step 2
	
	for fil=iqr_config.reservados[j].fila to iqr_config.reservados[j +1].fila
		for col=iqr_config.reservados[j].col to iqr_config.reservados[j +1].col
			ids_qr.setitem(fil,'reserv'+string(col),1)
		next
	next
	
next
end subroutine

private subroutine if_init_h_data (integer ai_version);//inicia los dayos de bloques y data size para el nivel H
rs_blocks ls_vacio[]
iqr_config.blocks=ls_vacio[]
choose case ai_version
case 1
	iqr_config.data=9
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=26;    iqr_config.blocks[1].k=9;
case 2
	iqr_config.data=16
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=44;    iqr_config.blocks[1].k=16;
case 3
	iqr_config.data=26
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=35;    iqr_config.blocks[1].k=13;
case 4
	iqr_config.data=36
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=25;    iqr_config.blocks[1].k=9;
case 5
	iqr_config.data=46
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=33;    iqr_config.blocks[1].k=11;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=34;    iqr_config.blocks[2].k=12;
case 6
	iqr_config.data=60
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=43;    iqr_config.blocks[1].k=15;
case 7
	iqr_config.data=66
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=39;    iqr_config.blocks[1].k=13;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=40;    iqr_config.blocks[2].k=14;
case 8
	iqr_config.data=86
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=40;    iqr_config.blocks[1].k=14;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=41;    iqr_config.blocks[2].k=15;
case 9
	iqr_config.data=100
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=36;    iqr_config.blocks[1].k=12;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=37;    iqr_config.blocks[2].k=13;
case 10
	iqr_config.data=122
	iqr_config.blocks[1].cantidad=6;   iqr_config.blocks[1].n=43;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=44;    iqr_config.blocks[2].k=16;
case 11
	iqr_config.data=140
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=36;    iqr_config.blocks[1].k=12;    iqr_config.blocks[2].cantidad=8;   iqr_config.blocks[2].n=37;    iqr_config.blocks[2].k=13;
case 12
	iqr_config.data=158
	iqr_config.blocks[1].cantidad=7;   iqr_config.blocks[1].n=42;    iqr_config.blocks[1].k=14;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=43;    iqr_config.blocks[2].k=15;
case 13
	iqr_config.data=180
	iqr_config.blocks[1].cantidad=12;   iqr_config.blocks[1].n=33;    iqr_config.blocks[1].k=11;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=34;    iqr_config.blocks[2].k=12;
case 14
	iqr_config.data=197
	iqr_config.blocks[1].cantidad=11;   iqr_config.blocks[1].n=36;    iqr_config.blocks[1].k=12;    iqr_config.blocks[2].cantidad=5;   iqr_config.blocks[2].n=37;    iqr_config.blocks[2].k=13;
case 15
	iqr_config.data=223
	iqr_config.blocks[1].cantidad=11;   iqr_config.blocks[1].n=36;    iqr_config.blocks[1].k=12;    iqr_config.blocks[2].cantidad=7;   iqr_config.blocks[2].n=37;    iqr_config.blocks[2].k=13;
case 16
	iqr_config.data=253
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=13;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 17
	iqr_config.data=283
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=42;    iqr_config.blocks[1].k=14;    iqr_config.blocks[2].cantidad=17;   iqr_config.blocks[2].n=43;    iqr_config.blocks[2].k=15;
case 18
	iqr_config.data=313
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=42;    iqr_config.blocks[1].k=14;    iqr_config.blocks[2].cantidad=19;   iqr_config.blocks[2].n=43;    iqr_config.blocks[2].k=15;
case 19
	iqr_config.data=341
	iqr_config.blocks[1].cantidad=9;   iqr_config.blocks[1].n=39;    iqr_config.blocks[1].k=13;    iqr_config.blocks[2].cantidad=16;   iqr_config.blocks[2].n=40;    iqr_config.blocks[2].k=14;
case 20
	iqr_config.data=385
	iqr_config.blocks[1].cantidad=15;   iqr_config.blocks[1].n=43;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=10;   iqr_config.blocks[2].n=44;    iqr_config.blocks[2].k=16;
case 21
	iqr_config.data=406
	iqr_config.blocks[1].cantidad=19;   iqr_config.blocks[1].n=46;    iqr_config.blocks[1].k=16;    iqr_config.blocks[2].cantidad=6;   iqr_config.blocks[2].n=47;    iqr_config.blocks[2].k=17;
case 22
	iqr_config.data=442
	iqr_config.blocks[1].cantidad=34;   iqr_config.blocks[1].n=37;    iqr_config.blocks[1].k=13;
case 23
	iqr_config.data=464
	iqr_config.blocks[1].cantidad=16;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=14;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 24
	iqr_config.data=514
	iqr_config.blocks[1].cantidad=30;   iqr_config.blocks[1].n=46;    iqr_config.blocks[1].k=16;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=47;    iqr_config.blocks[2].k=17;
case 25
	iqr_config.data=538
	iqr_config.blocks[1].cantidad=22;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=13;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 26
	iqr_config.data=596
	iqr_config.blocks[1].cantidad=33;   iqr_config.blocks[1].n=46;    iqr_config.blocks[1].k=16;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=47;    iqr_config.blocks[2].k=17;
case 27
	iqr_config.data=628
	iqr_config.blocks[1].cantidad=12;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=28;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 28
	iqr_config.data=661
	iqr_config.blocks[1].cantidad=11;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=31;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 29
	iqr_config.data=701
	iqr_config.blocks[1].cantidad=19;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=26;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 30
	iqr_config.data=745
	iqr_config.blocks[1].cantidad=23;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=25;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 31
	iqr_config.data=793
	iqr_config.blocks[1].cantidad=23;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=28;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 32
	iqr_config.data=845
	iqr_config.blocks[1].cantidad=19;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=35;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 33
	iqr_config.data=901
	iqr_config.blocks[1].cantidad=11;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=46;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 34
	iqr_config.data=961
	iqr_config.blocks[1].cantidad=59;   iqr_config.blocks[1].n=46;    iqr_config.blocks[1].k=16;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=47;    iqr_config.blocks[2].k=17;
case 35
	iqr_config.data=986
	iqr_config.blocks[1].cantidad=22;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=41;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 36
	iqr_config.data=1054
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=64;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 37
	iqr_config.data=1096
	iqr_config.blocks[1].cantidad=24;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=46;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 38
	iqr_config.data=1142
	iqr_config.blocks[1].cantidad=42;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=32;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 39
	iqr_config.data=1222
	iqr_config.blocks[1].cantidad=10;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=67;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
case 40
	iqr_config.data=1276
	iqr_config.blocks[1].cantidad=20;   iqr_config.blocks[1].n=45;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=61;   iqr_config.blocks[2].n=46;    iqr_config.blocks[2].k=16;
end choose
end subroutine

private subroutine if_init_l_data (integer ai_version);//inicia los dayos de bloques y data size para el nivel L
rs_blocks ls_vacio[]
iqr_config.blocks=ls_vacio[]
choose case ai_version
case 1
	iqr_config.data=19
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=26;    iqr_config.blocks[1].k=19;
case 2
	iqr_config.data=34
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=44;    iqr_config.blocks[1].k=34;
case 3
	iqr_config.data=55
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=70;    iqr_config.blocks[1].k=55;
case 4
	iqr_config.data=80
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=100;    iqr_config.blocks[1].k=80;
case 5
	iqr_config.data=108
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=134;    iqr_config.blocks[1].k=108;
case 6
	iqr_config.data=136
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=86;    iqr_config.blocks[1].k=68;
case 7
	iqr_config.data=156
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=98;    iqr_config.blocks[1].k=78;
case 8
	iqr_config.data=194
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=121;    iqr_config.blocks[1].k=97;
case 9
	iqr_config.data=232
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=146;    iqr_config.blocks[1].k=116;
case 10
	iqr_config.data=274
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=86;    iqr_config.blocks[1].k=68;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=87;    iqr_config.blocks[2].k=69;
case 11
	iqr_config.data=324
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=101;    iqr_config.blocks[1].k=81;
case 12
	iqr_config.data=370
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=116;    iqr_config.blocks[1].k=92;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=117;    iqr_config.blocks[2].k=93;
case 13
	iqr_config.data=428
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=133;    iqr_config.blocks[1].k=107;
case 14
	iqr_config.data=461
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=145;    iqr_config.blocks[1].k=115;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=146;    iqr_config.blocks[2].k=116;
case 15
	iqr_config.data=523
	iqr_config.blocks[1].cantidad=5;   iqr_config.blocks[1].n=109;    iqr_config.blocks[1].k=87;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=110;    iqr_config.blocks[2].k=88;
case 16
	iqr_config.data=589
	iqr_config.blocks[1].cantidad=5;   iqr_config.blocks[1].n=122;    iqr_config.blocks[1].k=98;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=123;    iqr_config.blocks[2].k=99;
case 17
	iqr_config.data=647
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=135;    iqr_config.blocks[1].k=107;    iqr_config.blocks[2].cantidad=5;   iqr_config.blocks[2].n=136;    iqr_config.blocks[2].k=108;
case 18
	iqr_config.data=721
	iqr_config.blocks[1].cantidad=5;   iqr_config.blocks[1].n=150;    iqr_config.blocks[1].k=120;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=151;    iqr_config.blocks[2].k=121;
case 19
	iqr_config.data=795
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=141;    iqr_config.blocks[1].k=113;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=142;    iqr_config.blocks[2].k=114;
case 20
	iqr_config.data=861
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=135;    iqr_config.blocks[1].k=107;    iqr_config.blocks[2].cantidad=5;   iqr_config.blocks[2].n=136;    iqr_config.blocks[2].k=108;
case 21
	iqr_config.data=932
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=144;    iqr_config.blocks[1].k=116;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=145;    iqr_config.blocks[2].k=117;
case 22
	iqr_config.data=1006
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=139;    iqr_config.blocks[1].k=111;    iqr_config.blocks[2].cantidad=7;   iqr_config.blocks[2].n=140;    iqr_config.blocks[2].k=112;
case 23
	iqr_config.data=1094
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=151;    iqr_config.blocks[1].k=121;    iqr_config.blocks[2].cantidad=5;   iqr_config.blocks[2].n=152;    iqr_config.blocks[2].k=122;
case 24
	iqr_config.data=1174
	iqr_config.blocks[1].cantidad=6;   iqr_config.blocks[1].n=147;    iqr_config.blocks[1].k=117;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=148;    iqr_config.blocks[2].k=118;
case 25
	iqr_config.data=1276
	iqr_config.blocks[1].cantidad=8;   iqr_config.blocks[1].n=132;    iqr_config.blocks[1].k=106;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=133;    iqr_config.blocks[2].k=107;
case 26
	iqr_config.data=1370
	iqr_config.blocks[1].cantidad=10;   iqr_config.blocks[1].n=142;    iqr_config.blocks[1].k=114;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=143;    iqr_config.blocks[2].k=115;
case 27
	iqr_config.data=1468
	iqr_config.blocks[1].cantidad=8;   iqr_config.blocks[1].n=152;    iqr_config.blocks[1].k=122;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=153;    iqr_config.blocks[2].k=123;
case 28
	iqr_config.data=1531
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=147;    iqr_config.blocks[1].k=117;    iqr_config.blocks[2].cantidad=10;   iqr_config.blocks[2].n=148;    iqr_config.blocks[2].k=118;
case 29
	iqr_config.data=1631
	iqr_config.blocks[1].cantidad=7;   iqr_config.blocks[1].n=146;    iqr_config.blocks[1].k=116;    iqr_config.blocks[2].cantidad=7;   iqr_config.blocks[2].n=147;    iqr_config.blocks[2].k=117;
case 30
	iqr_config.data=1735
	iqr_config.blocks[1].cantidad=5;   iqr_config.blocks[1].n=145;    iqr_config.blocks[1].k=115;    iqr_config.blocks[2].cantidad=10;   iqr_config.blocks[2].n=146;    iqr_config.blocks[2].k=116;
case 31
	iqr_config.data=1843
	iqr_config.blocks[1].cantidad=13;   iqr_config.blocks[1].n=145;    iqr_config.blocks[1].k=115;    iqr_config.blocks[2].cantidad=3;   iqr_config.blocks[2].n=146;    iqr_config.blocks[2].k=116;
case 32
	iqr_config.data=1955
	iqr_config.blocks[1].cantidad=17;   iqr_config.blocks[1].n=145;    iqr_config.blocks[1].k=115;
case 33
	iqr_config.data=2071
	iqr_config.blocks[1].cantidad=17;   iqr_config.blocks[1].n=145;    iqr_config.blocks[1].k=115;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=146;    iqr_config.blocks[2].k=116;
case 34
	iqr_config.data=2191
	iqr_config.blocks[1].cantidad=13;   iqr_config.blocks[1].n=145;    iqr_config.blocks[1].k=115;    iqr_config.blocks[2].cantidad=6;   iqr_config.blocks[2].n=146;    iqr_config.blocks[2].k=116;
case 35
	iqr_config.data=2306
	iqr_config.blocks[1].cantidad=12;   iqr_config.blocks[1].n=151;    iqr_config.blocks[1].k=121;    iqr_config.blocks[2].cantidad=7;   iqr_config.blocks[2].n=152;    iqr_config.blocks[2].k=122;
case 36
	iqr_config.data=2434
	iqr_config.blocks[1].cantidad=6;   iqr_config.blocks[1].n=151;    iqr_config.blocks[1].k=121;    iqr_config.blocks[2].cantidad=14;   iqr_config.blocks[2].n=152;    iqr_config.blocks[2].k=122;
case 37
	iqr_config.data=2566
	iqr_config.blocks[1].cantidad=17;   iqr_config.blocks[1].n=152;    iqr_config.blocks[1].k=122;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=153;    iqr_config.blocks[2].k=123;
case 38
	iqr_config.data=2702
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=152;    iqr_config.blocks[1].k=122;    iqr_config.blocks[2].cantidad=18;   iqr_config.blocks[2].n=153;    iqr_config.blocks[2].k=123;
case 39
	iqr_config.data=2812
	iqr_config.blocks[1].cantidad=20;   iqr_config.blocks[1].n=147;    iqr_config.blocks[1].k=117;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=148;    iqr_config.blocks[2].k=118;
case 40
	iqr_config.data=2956
	iqr_config.blocks[1].cantidad=19;   iqr_config.blocks[1].n=148;    iqr_config.blocks[1].k=118;    iqr_config.blocks[2].cantidad=6;   iqr_config.blocks[2].n=149;    iqr_config.blocks[2].k=119;

end choose
end subroutine

private subroutine if_init_m_data (integer ai_version);//inicia los dayos de bloques y data size para el nivel M
rs_blocks ls_vacio[]
iqr_config.blocks=ls_vacio[]
choose case ai_version
case 1
	iqr_config.data=16
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=26;    iqr_config.blocks[1].k=16;
case 2
	iqr_config.data=28
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=44;    iqr_config.blocks[1].k=28;
case 3
	iqr_config.data=44
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=70;    iqr_config.blocks[1].k=44;
case 4
	iqr_config.data=64
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=50;    iqr_config.blocks[1].k=32;
case 5
	iqr_config.data=86
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=67;    iqr_config.blocks[1].k=43;
case 6
	iqr_config.data=108
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=43;    iqr_config.blocks[1].k=27;
case 7
	iqr_config.data=124
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=49;    iqr_config.blocks[1].k=31;
case 8
	iqr_config.data=154
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=60;    iqr_config.blocks[1].k=38;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=61;    iqr_config.blocks[2].k=39;
case 9
	iqr_config.data=182
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=58;    iqr_config.blocks[1].k=36;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=59;    iqr_config.blocks[2].k=37;
case 10
	iqr_config.data=216
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=69;    iqr_config.blocks[1].k=43;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=70;    iqr_config.blocks[2].k=44;
case 11
	iqr_config.data=254
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=80;    iqr_config.blocks[1].k=50;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=81;    iqr_config.blocks[2].k=51;
case 12
	iqr_config.data=290
	iqr_config.blocks[1].cantidad=6;   iqr_config.blocks[1].n=58;    iqr_config.blocks[1].k=36;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=59;    iqr_config.blocks[2].k=37;
case 13
	iqr_config.data=334
	iqr_config.blocks[1].cantidad=8;   iqr_config.blocks[1].n=59;    iqr_config.blocks[1].k=37;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=60;    iqr_config.blocks[2].k=38;
case 14
	iqr_config.data=365
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=64;    iqr_config.blocks[1].k=40;    iqr_config.blocks[2].cantidad=5;   iqr_config.blocks[2].n=65;    iqr_config.blocks[2].k=41;
case 15
	iqr_config.data=415
	iqr_config.blocks[1].cantidad=5;   iqr_config.blocks[1].n=65;    iqr_config.blocks[1].k=41;    iqr_config.blocks[2].cantidad=5;   iqr_config.blocks[2].n=66;    iqr_config.blocks[2].k=42;
case 16
	iqr_config.data=453
	iqr_config.blocks[1].cantidad=7;   iqr_config.blocks[1].n=73;    iqr_config.blocks[1].k=45;    iqr_config.blocks[2].cantidad=3;   iqr_config.blocks[2].n=74;    iqr_config.blocks[2].k=46;
case 17
	iqr_config.data=507
	iqr_config.blocks[1].cantidad=10;   iqr_config.blocks[1].n=74;    iqr_config.blocks[1].k=46;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=75;    iqr_config.blocks[2].k=47;
case 18
	iqr_config.data=563
	iqr_config.blocks[1].cantidad=9;   iqr_config.blocks[1].n=69;    iqr_config.blocks[1].k=43;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=70;    iqr_config.blocks[2].k=44;
case 19
	iqr_config.data=627
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=70;    iqr_config.blocks[1].k=44;    iqr_config.blocks[2].cantidad=11;   iqr_config.blocks[2].n=71;    iqr_config.blocks[2].k=45;
case 20
	iqr_config.data=669
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=67;    iqr_config.blocks[1].k=41;    iqr_config.blocks[2].cantidad=13;   iqr_config.blocks[2].n=68;    iqr_config.blocks[2].k=42;
case 21
	iqr_config.data=714
	iqr_config.blocks[1].cantidad=17;   iqr_config.blocks[1].n=68;    iqr_config.blocks[1].k=42;
case 22
	iqr_config.data=782
	iqr_config.blocks[1].cantidad=17;   iqr_config.blocks[1].n=74;    iqr_config.blocks[1].k=46;
case 23
	iqr_config.data=860
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=75;    iqr_config.blocks[1].k=47;    iqr_config.blocks[2].cantidad=14;   iqr_config.blocks[2].n=76;    iqr_config.blocks[2].k=48;
case 24
	iqr_config.data=914
	iqr_config.blocks[1].cantidad=6;   iqr_config.blocks[1].n=73;    iqr_config.blocks[1].k=45;    iqr_config.blocks[2].cantidad=14;   iqr_config.blocks[2].n=74;    iqr_config.blocks[2].k=46;
case 25
	iqr_config.data=1000
	iqr_config.blocks[1].cantidad=8;   iqr_config.blocks[1].n=75;    iqr_config.blocks[1].k=47;    iqr_config.blocks[2].cantidad=13;   iqr_config.blocks[2].n=76;    iqr_config.blocks[2].k=48;
case 26
	iqr_config.data=1062
	iqr_config.blocks[1].cantidad=19;   iqr_config.blocks[1].n=74;    iqr_config.blocks[1].k=46;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=75;    iqr_config.blocks[2].k=47;
case 27
	iqr_config.data=1128
	iqr_config.blocks[1].cantidad=22;   iqr_config.blocks[1].n=73;    iqr_config.blocks[1].k=45;    iqr_config.blocks[2].cantidad=3;   iqr_config.blocks[2].n=74;    iqr_config.blocks[2].k=46;
case 28
	iqr_config.data=1193
	iqr_config.blocks[1].cantidad=3;   iqr_config.blocks[1].n=73;    iqr_config.blocks[1].k=45;    iqr_config.blocks[2].cantidad=23;   iqr_config.blocks[2].n=74;    iqr_config.blocks[2].k=46;
case 29
	iqr_config.data=1267
	iqr_config.blocks[1].cantidad=21;   iqr_config.blocks[1].n=73;    iqr_config.blocks[1].k=45;    iqr_config.blocks[2].cantidad=7;   iqr_config.blocks[2].n=74;    iqr_config.blocks[2].k=46;
case 30
	iqr_config.data=1373
	iqr_config.blocks[1].cantidad=19;   iqr_config.blocks[1].n=75;    iqr_config.blocks[1].k=47;    iqr_config.blocks[2].cantidad=10;   iqr_config.blocks[2].n=76;    iqr_config.blocks[2].k=48;
case 31
	iqr_config.data=1455
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=74;    iqr_config.blocks[1].k=46;    iqr_config.blocks[2].cantidad=29;   iqr_config.blocks[2].n=75;    iqr_config.blocks[2].k=47;
case 32
	iqr_config.data=1541
	iqr_config.blocks[1].cantidad=10;   iqr_config.blocks[1].n=74;    iqr_config.blocks[1].k=46;    iqr_config.blocks[2].cantidad=23;   iqr_config.blocks[2].n=75;    iqr_config.blocks[2].k=47;
case 33
	iqr_config.data=1631
	iqr_config.blocks[1].cantidad=14;   iqr_config.blocks[1].n=74;    iqr_config.blocks[1].k=46;    iqr_config.blocks[2].cantidad=21;   iqr_config.blocks[2].n=75;    iqr_config.blocks[2].k=47;
case 34
	iqr_config.data=1725
	iqr_config.blocks[1].cantidad=14;   iqr_config.blocks[1].n=74;    iqr_config.blocks[1].k=46;    iqr_config.blocks[2].cantidad=23;   iqr_config.blocks[2].n=75;    iqr_config.blocks[2].k=47;
case 35
	iqr_config.data=1812
	iqr_config.blocks[1].cantidad=12;   iqr_config.blocks[1].n=75;    iqr_config.blocks[1].k=47;    iqr_config.blocks[2].cantidad=26;   iqr_config.blocks[2].n=76;    iqr_config.blocks[2].k=48;
case 36
	iqr_config.data=1914
	iqr_config.blocks[1].cantidad=6;   iqr_config.blocks[1].n=75;    iqr_config.blocks[1].k=47;    iqr_config.blocks[2].cantidad=34;   iqr_config.blocks[2].n=76;    iqr_config.blocks[2].k=48;
case 37
	iqr_config.data=1992
	iqr_config.blocks[1].cantidad=29;   iqr_config.blocks[1].n=74;    iqr_config.blocks[1].k=46;    iqr_config.blocks[2].cantidad=14;   iqr_config.blocks[2].n=75;    iqr_config.blocks[2].k=47;
case 38
	iqr_config.data=2102
	iqr_config.blocks[1].cantidad=13;   iqr_config.blocks[1].n=74;    iqr_config.blocks[1].k=46;    iqr_config.blocks[2].cantidad=32;   iqr_config.blocks[2].n=75;    iqr_config.blocks[2].k=47;
case 39
	iqr_config.data=2216
	iqr_config.blocks[1].cantidad=40;   iqr_config.blocks[1].n=75;    iqr_config.blocks[1].k=47;    iqr_config.blocks[2].cantidad=7;   iqr_config.blocks[2].n=76;    iqr_config.blocks[2].k=48;
case 40
	iqr_config.data=2334
	iqr_config.blocks[1].cantidad=18;   iqr_config.blocks[1].n=75;    iqr_config.blocks[1].k=47;    iqr_config.blocks[2].cantidad=31;   iqr_config.blocks[2].n=76;    iqr_config.blocks[2].k=48;
end choose


end subroutine

private subroutine if_init_q_data (integer ai_version);//inicia los dayos de bloques y data size para el nivel H
rs_blocks ls_vacio[]
iqr_config.blocks=ls_vacio[]
choose case ai_version
case 1
	iqr_config.data=13
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=26;    iqr_config.blocks[1].k=13;
case 2
	iqr_config.data=22
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=44;    iqr_config.blocks[1].k=22;
case 3
	iqr_config.data=34
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=35;    iqr_config.blocks[1].k=17;
case 4
	iqr_config.data=48
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=50;    iqr_config.blocks[1].k=24;
case 5
	iqr_config.data=62
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=33;    iqr_config.blocks[1].k=15;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=34;    iqr_config.blocks[2].k=16;
case 6
	iqr_config.data=76
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=43;    iqr_config.blocks[1].k=19;
case 7
	iqr_config.data=88
	iqr_config.blocks[1].cantidad=2;   iqr_config.blocks[1].n=32;    iqr_config.blocks[1].k=14;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=33;    iqr_config.blocks[2].k=15;
case 8
	iqr_config.data=110
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=40;    iqr_config.blocks[1].k=18;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=41;    iqr_config.blocks[2].k=19;
case 9
	iqr_config.data=132
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=36;    iqr_config.blocks[1].k=16;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=37;    iqr_config.blocks[2].k=17;
case 10
	iqr_config.data=154
	iqr_config.blocks[1].cantidad=6;   iqr_config.blocks[1].n=43;    iqr_config.blocks[1].k=19;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=44;    iqr_config.blocks[2].k=20;
case 11
	iqr_config.data=180
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=50;    iqr_config.blocks[1].k=22;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=51;    iqr_config.blocks[2].k=23;
case 12
	iqr_config.data=206
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=46;    iqr_config.blocks[1].k=20;    iqr_config.blocks[2].cantidad=6;   iqr_config.blocks[2].n=47;    iqr_config.blocks[2].k=21;
case 13
	iqr_config.data=244
	iqr_config.blocks[1].cantidad=8;   iqr_config.blocks[1].n=44;    iqr_config.blocks[1].k=20;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=45;    iqr_config.blocks[2].k=21;
case 14
	iqr_config.data=261
	iqr_config.blocks[1].cantidad=11;   iqr_config.blocks[1].n=36;    iqr_config.blocks[1].k=16;    iqr_config.blocks[2].cantidad=5;   iqr_config.blocks[2].n=37;    iqr_config.blocks[2].k=17;
case 15
	iqr_config.data=295
	iqr_config.blocks[1].cantidad=5;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=7;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 16
	iqr_config.data=325
	iqr_config.blocks[1].cantidad=15;   iqr_config.blocks[1].n=43;    iqr_config.blocks[1].k=19;    iqr_config.blocks[2].cantidad=2;   iqr_config.blocks[2].n=44;    iqr_config.blocks[2].k=20;
case 17
	iqr_config.data=367
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=50;    iqr_config.blocks[1].k=22;    iqr_config.blocks[2].cantidad=15;   iqr_config.blocks[2].n=51;    iqr_config.blocks[2].k=23;
case 18
	iqr_config.data=397
	iqr_config.blocks[1].cantidad=17;   iqr_config.blocks[1].n=50;    iqr_config.blocks[1].k=22;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=51;    iqr_config.blocks[2].k=23;
case 19
	iqr_config.data=445
	iqr_config.blocks[1].cantidad=17;   iqr_config.blocks[1].n=47;    iqr_config.blocks[1].k=21;    iqr_config.blocks[2].cantidad=4;   iqr_config.blocks[2].n=48;    iqr_config.blocks[2].k=22;
case 20
	iqr_config.data=485
	iqr_config.blocks[1].cantidad=15;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=5;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 21
	iqr_config.data=512
	iqr_config.blocks[1].cantidad=17;   iqr_config.blocks[1].n=50;    iqr_config.blocks[1].k=22;    iqr_config.blocks[2].cantidad=6;   iqr_config.blocks[2].n=51;    iqr_config.blocks[2].k=23;
case 22
	iqr_config.data=568
	iqr_config.blocks[1].cantidad=7;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=16;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 23
	iqr_config.data=614
	iqr_config.blocks[1].cantidad=11;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=14;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 24
	iqr_config.data=664
	iqr_config.blocks[1].cantidad=11;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=16;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 25
	iqr_config.data=718
	iqr_config.blocks[1].cantidad=7;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=22;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 26
	iqr_config.data=754
	iqr_config.blocks[1].cantidad=28;   iqr_config.blocks[1].n=50;    iqr_config.blocks[1].k=22;    iqr_config.blocks[2].cantidad=6;   iqr_config.blocks[2].n=51;    iqr_config.blocks[2].k=23;
case 27
	iqr_config.data=808
	iqr_config.blocks[1].cantidad=8;   iqr_config.blocks[1].n=53;    iqr_config.blocks[1].k=23;    iqr_config.blocks[2].cantidad=26;   iqr_config.blocks[2].n=54;    iqr_config.blocks[2].k=24;
case 28
	iqr_config.data=871
	iqr_config.blocks[1].cantidad=4;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=31;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 29
	iqr_config.data=911
	iqr_config.blocks[1].cantidad=1;   iqr_config.blocks[1].n=53;    iqr_config.blocks[1].k=23;    iqr_config.blocks[2].cantidad=37;   iqr_config.blocks[2].n=54;    iqr_config.blocks[2].k=24;
case 30
	iqr_config.data=985
	iqr_config.blocks[1].cantidad=15;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=25;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 31
	iqr_config.data=1033
	iqr_config.blocks[1].cantidad=42;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=1;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 32
	iqr_config.data=1115
	iqr_config.blocks[1].cantidad=10;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=35;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 33
	iqr_config.data=1171
	iqr_config.blocks[1].cantidad=29;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=19;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 34
	iqr_config.data=1231
	iqr_config.blocks[1].cantidad=44;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=7;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 35
	iqr_config.data=1286
	iqr_config.blocks[1].cantidad=39;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=14;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 36
	iqr_config.data=1354
	iqr_config.blocks[1].cantidad=46;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=10;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 37
	iqr_config.data=1426
	iqr_config.blocks[1].cantidad=49;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=10;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 38
	iqr_config.data=1502
	iqr_config.blocks[1].cantidad=48;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=14;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 39
	iqr_config.data=1582
	iqr_config.blocks[1].cantidad=43;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=22;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
case 40
	iqr_config.data=1666
	iqr_config.blocks[1].cantidad=34;   iqr_config.blocks[1].n=54;    iqr_config.blocks[1].k=24;    iqr_config.blocks[2].cantidad=34;   iqr_config.blocks[2].n=55;    iqr_config.blocks[2].k=25;
end choose

end subroutine

private subroutine if_init_marcas_alineacion (integer ai_version);//tabla basica de marcas de alineacion
integer vacio[]
iqr_config.marcas_alineacion=vacio
choose case ai_version
case 2
	iqr_config.marcas_alineacion[]={18}
case 3
	iqr_config.marcas_alineacion[]={22}
case 4
	iqr_config.marcas_alineacion[]={26}
case 5
	iqr_config.marcas_alineacion[]={30}
case 6
	iqr_config.marcas_alineacion[]={34}
case 7
	iqr_config.marcas_alineacion[]={6, 22, 38}
case 8
	iqr_config.marcas_alineacion[]={6, 24, 42}
case 9
	iqr_config.marcas_alineacion[]={6, 26, 46}
case 10
	iqr_config.marcas_alineacion[]={6, 28, 50}
case 11
	iqr_config.marcas_alineacion[]={6, 30, 54}
case 12
	iqr_config.marcas_alineacion[]={6, 32, 58}
case 13
	iqr_config.marcas_alineacion[]={6, 34, 62}
case 14
	iqr_config.marcas_alineacion[]={6, 26, 46, 66}
case 15
	iqr_config.marcas_alineacion[]={6, 26, 48, 70}
case 16
	iqr_config.marcas_alineacion[]={6, 26, 50, 74}
case 17
	iqr_config.marcas_alineacion[]={6, 30, 54, 78}
case 18
	iqr_config.marcas_alineacion[]={6, 30, 56, 82}
case 19
	iqr_config.marcas_alineacion[]={6, 30, 58, 86}
case 20
	iqr_config.marcas_alineacion[]={6, 34, 62, 90}
case 21
	iqr_config.marcas_alineacion[]={6, 28, 50, 72, 94}
case 22
	iqr_config.marcas_alineacion[]={6, 26, 50, 74, 98}
case 23
	iqr_config.marcas_alineacion[]={6, 30, 54, 78, 102}
case 24
	iqr_config.marcas_alineacion[]={6, 28, 54, 80, 106}
case 25
	iqr_config.marcas_alineacion[]={6, 32, 58, 84, 110}
case 26
	iqr_config.marcas_alineacion[]={6, 30, 58, 86, 114}
case 27
	iqr_config.marcas_alineacion[]={6, 34, 62, 90, 118}
case 28
	iqr_config.marcas_alineacion[]={6, 26, 50, 74, 98, 122}
case 29
	iqr_config.marcas_alineacion[]={6, 30, 54, 78, 102, 126}
case 30
	iqr_config.marcas_alineacion[]={6, 26, 52, 78, 104, 130}
case 31
	iqr_config.marcas_alineacion[]={6, 30, 56, 82, 108, 134}
case 32
	iqr_config.marcas_alineacion[]={6, 34, 60, 86, 112, 138}
case 33
	iqr_config.marcas_alineacion[]={6, 30, 58, 86, 114, 142}
case 34
	iqr_config.marcas_alineacion[]={6, 34, 62, 90, 118, 146}
case 35
	iqr_config.marcas_alineacion[]={6, 30, 54, 78, 102, 126, 150}
case 36
	iqr_config.marcas_alineacion[]={6, 24, 50, 76, 102, 128, 154}
case 37
	iqr_config.marcas_alineacion[]={6, 28, 54, 80, 106, 132, 158}
case 38
	iqr_config.marcas_alineacion[]={6, 32, 58, 84, 110, 136, 162}
case 39
	iqr_config.marcas_alineacion[]={6, 26, 54, 82, 110, 138, 166}
case 40
	iqr_config.marcas_alineacion[]={6, 30, 58, 86, 114, 142, 170}
end choose

end subroutine

private subroutine if_init_tamanyos (integer ai_version);//tabla basica de tamaños deacuerdo a la version
choose case ai_version
case 1
	iqr_config.tamanyo=21
case 2
	iqr_config.tamanyo=25
case 3
	iqr_config.tamanyo=29
case 4
	iqr_config.tamanyo=33
case 5
	iqr_config.tamanyo=37
case 6
	iqr_config.tamanyo=41
case 7
	iqr_config.tamanyo=45
case 8
	iqr_config.tamanyo=49
case 9
	iqr_config.tamanyo=53
case 10
	iqr_config.tamanyo=57
case 11
	iqr_config.tamanyo=61
case 12
	iqr_config.tamanyo=65
case 13
	iqr_config.tamanyo=69
case 14
	iqr_config.tamanyo=73
case 15
	iqr_config.tamanyo=77
case 16
	iqr_config.tamanyo=81
case 17
	iqr_config.tamanyo=85
case 18
	iqr_config.tamanyo=89
case 19
	iqr_config.tamanyo=93
case 20
	iqr_config.tamanyo=97
case 21
	iqr_config.tamanyo=101
case 22
	iqr_config.tamanyo=105
case 23
	iqr_config.tamanyo=109
case 24
	iqr_config.tamanyo=113
case 25
	iqr_config.tamanyo=117
case 26
	iqr_config.tamanyo=121
case 27
	iqr_config.tamanyo=125
case 28
	iqr_config.tamanyo=129
case 29
	iqr_config.tamanyo=133
case 30
	iqr_config.tamanyo=137
case 31
	iqr_config.tamanyo=141
case 32
	iqr_config.tamanyo=145
case 33
	iqr_config.tamanyo=149
case 34
	iqr_config.tamanyo=153
case 35
	iqr_config.tamanyo=157
case 36
	iqr_config.tamanyo=161
case 37
	iqr_config.tamanyo=165
case 38
	iqr_config.tamanyo=169
case 39
	iqr_config.tamanyo=173
case 40
	iqr_config.tamanyo=177
end choose

end subroutine

private function integer if_mask (integer ai_fila, integer ai_col, integer ai_mask);//para aplicar la mascara al dibujar el QR
//como en el dw empiezan desde 1 , aqui se les resta uno a la fila y columna
ai_fila=ai_fila -1
ai_col=ai_col -1
choose case ai_mask
	case 0
		return mod( ai_fila + ai_col , 2)
	case 1
		return mod (ai_fila , 2)
	case 2
		return mod(ai_col ,3)
	case 3
		return mod (ai_fila + ai_col , 3)
	case 4
		return mod ( integer(ai_fila/2) + integer(ai_col /3) , 2)
	case 5
		return mod( ai_fila * ai_col , 2) + mod ( ai_fila * ai_col , 3)
	case 6
		return mod (mod( ai_fila * ai_col , 2) + mod ( ai_fila * ai_col , 3),2)
	case 7
		return mod (mod( ai_fila + ai_col , 2) + mod ( ai_fila * ai_col , 3),2)
end choose
		
return 1
end function

private subroutine if_init (integer ai_version, string as_level_correction);//iniciar valores de bloques depemdiendo de la version
iqr_config.version=ai_version	

if_init_tamanyos(ai_version)
if_init_marcas_alineacion(ai_version)

choose case as_level_correction
	case 'L'
		if_init_l_data(ai_version)
	case 'M'
		if_init_m_data(ai_version)
	case 'Q'
		if_init_q_data(ai_version)
	case 'H'
		if_init_h_data(ai_version)
end choose




end subroutine

private function integer if_data_size (integer ai_version, string as_level_correction);//para saber en que version cabe lo que se envía
if as_level_correction='L' then
	choose case ai_version
	case 1
		return 19
	case 2
		return 34
	case 3
		return 55
	case 4
		return 80
	case 5
		return 108
	case 6
		return 136
	case 7
		return 156
	case 8
		return 194
	case 9
		return 232
	case 10
		return 274
	case 11
		return 324
	case 12
		return 370
	case 13
		return 428
	case 14
		return 461
	case 15
		return 523
	case 16
		return 589
	case 17
		return 647
	case 18
		return 721
	case 19
		return 795
	case 20
		return 861
	case 21
		return 932
	case 22
		return 1006
	case 23
		return 1094
	case 24
		return 1174
	case 25
		return 1276
	case 26
		return 1370
	case 27
		return 1468
	case 28
		return 1531
	case 29
		return 1631
	case 30
		return 1735
	case 31
		return 1843
	case 32
		return 1955
	case 33
		return 2071
	case 34
		return 2191
	case 35
		return 2306
	case 36
		return 2434
	case 37
		return 2566
	case 38
		return 2702
	case 39
		return 2812
	case 40
		return 2956
	end choose
end if

if as_level_correction='M' then
	choose case ai_version
		case 1
			return 16
		case 2
			return 28
		case 3
			return 44
		case 4
			return 64
		case 5
			return 86
		case 6
			return 108
		case 7
			return 124
		case 8
			return 154
		case 9
			return 182
		case 10
			return 216
		case 11
			return 254
		case 12
			return 290
		case 13
			return 334
		case 14
			return 365
		case 15
			return 415
		case 16
			return 453
		case 17
			return 507
		case 18
			return 563
		case 19
			return 627
		case 20
			return 669
		case 21
			return 714
		case 22
			return 782
		case 23
			return 860
		case 24
			return 914
		case 25
			return 1000
		case 26
			return 1062
		case 27
			return 1128
		case 28
			return 1193
		case 29
			return 1267
		case 30
			return 1373
		case 31
			return 1455
		case 32
			return 1541
		case 33
			return 1631
		case 34
			return 1725
		case 35
			return 1812
		case 36
			return 1914
		case 37
			return 1992
		case 38
			return 2102
		case 39
			return 2216
		case 40
			return 2334

	end choose
end if

if as_level_correction='Q' then
	choose case ai_version
		case 1
			return 13
		case 2
			return 22
		case 3
			return 34
		case 4
			return 48
		case 5
			return 62
		case 6
			return 76
		case 7
			return 88
		case 8
			return 110
		case 9
			return 132
		case 10
			return 154
		case 11
			return 180
		case 12
			return 206
		case 13
			return 244
		case 14
			return 261
		case 15
			return 295
		case 16
			return 325
		case 17
			return 367
		case 18
			return 397
		case 19
			return 445
		case 20
			return 485
		case 21
			return 512
		case 22
			return 568
		case 23
			return 614
		case 24
			return 664
		case 25
			return 718
		case 26
			return 754
		case 27
			return 808
		case 28
			return 871
		case 29
			return 911
		case 30
			return 985
		case 31
			return 1033
		case 32
			return 1115
		case 33
			return 1171
		case 34
			return 1231
		case 35
			return 1286
		case 36
			return 1354
		case 37
			return 1426
		case 38
			return 1502
		case 39
			return 1582
		case 40
			return 1666
	end choose
end if

if as_level_correction='H' then
	choose case ai_version
		case 1
			return 9
		case 2
			return 16
		case 3
			return 26
		case 4
			return 36
		case 5
			return 46
		case 6
			return 60
		case 7
			return 66
		case 8
			return 86
		case 9
			return 100
		case 10
			return 122
		case 11
			return 140
		case 12
			return 158
		case 13
			return 180
		case 14
			return 197
		case 15
			return 223
		case 16
			return 253
		case 17
			return 283
		case 18
			return 313
		case 19
			return 341
		case 20
			return 385
		case 21
			return 406
		case 22
			return 442
		case 23
			return 464
		case 24
			return 514
		case 25
			return 538
		case 26
			return 596
		case 27
			return 628
		case 28
			return 661
		case 29
			return 701
		case 30
			return 745
		case 31
			return 793
		case 32
			return 845
		case 33
			return 901
		case 34
			return 961
		case 35
			return 986
		case 36
			return 1054
		case 37
			return 1096
		case 38
			return 1142
		case 39
			return 1222
		case 40
			return 1276
	end choose
end if
end function

private subroutine if_format_string (integer ai_mask, string as_level, integer ai_version);//pone los bits de formato a los lados de los cuadros grandes de referencia y en laz zonas de version cuando la version >=7
string ls_format

if as_level='L' and ai_mask=0 then 
	ls_format='111011111000100'
elseif as_level='L' and ai_mask=1 then 
	ls_format='111001011110011'
elseif as_level='L' and ai_mask=2 then 
	ls_format='111110110101010'
elseif as_level='L' and ai_mask=3 then 
	ls_format='111100010011101'
elseif as_level='L' and ai_mask=4 then 
	ls_format='110011000101111'
elseif as_level='L' and ai_mask=5 then 
	ls_format='110001100011000'
elseif as_level='L' and ai_mask=6 then 
	ls_format='110110001000001'
elseif as_level='L' and ai_mask=7 then 
	ls_format='110100101110110'
elseif as_level='M' and ai_mask=0 then 
	ls_format='101010000010010'
elseif as_level='M' and ai_mask=1 then 
	ls_format='101000100100101'
elseif as_level='M' and ai_mask=2 then 
	ls_format='101111001111100'
elseif as_level='M' and ai_mask=3 then 
	ls_format='101101101001011'
elseif as_level='M' and ai_mask=4 then 
	ls_format='100010111111001'
elseif as_level='M' and ai_mask=5 then 
	ls_format='100000011001110'
elseif as_level='M' and ai_mask=6 then 
	ls_format='100111110010111'
elseif as_level='M' and ai_mask=7 then 
	ls_format='100101010100000'
elseif as_level='Q' and ai_mask=0 then 
	ls_format='011010101011111'
elseif as_level='Q' and ai_mask=1 then 
	ls_format='011000001101000'
elseif as_level='Q' and ai_mask=2 then 
	ls_format='011111100110001'
elseif as_level='Q' and ai_mask=3 then 
	ls_format='011101000000110'
elseif as_level='Q' and ai_mask=4 then 
	ls_format='010010010110100'
elseif as_level='Q' and ai_mask=5 then 
	ls_format='010000110000011'
elseif as_level='Q' and ai_mask=6 then 
	ls_format='010111011011010'
elseif as_level='Q' and ai_mask=7 then 
	ls_format='010101111101101'
elseif as_level='H' and ai_mask=0 then 
	ls_format='001011010001001'
elseif as_level='H' and ai_mask=1 then
	ls_format='001001110111110'
elseif as_level='H' and ai_mask=2 then 
	ls_format='001110011100111'
elseif as_level='H' and ai_mask=3 then 
	ls_format='001100111010000'
elseif as_level='H' and ai_mask=4 then 
	ls_format='000011101100010'
elseif as_level='H' and ai_mask=5 then 
	ls_format='000001001010101'
elseif as_level='H' and ai_mask=6 then 
	ls_format='000110100001100'
elseif as_level='H' and ai_mask=7 then 
	ls_format='000100000111011'
end if

//https://www.thonky.com/qr-code-tutorial/format-version-information

ids_qr.setitem(9,1, mid(ls_format,1,1))
ids_qr.setitem(9,2, mid(ls_format,2,1))
ids_qr.setitem(9,3, mid(ls_format,3,1))
ids_qr.setitem(9,4, mid(ls_format,4,1))
ids_qr.setitem(9,5, mid(ls_format,5,1))
ids_qr.setitem(9,6, mid(ls_format,6,1))
ids_qr.setitem(9,8, mid(ls_format,7,1))
ids_qr.setitem(9,9, mid(ls_format,8,1))

ids_qr.setitem(8,9, mid(ls_format,9,1))
ids_qr.setitem(6,9, mid(ls_format,10,1))
ids_qr.setitem(5,9, mid(ls_format,11,1))
ids_qr.setitem(4,9, mid(ls_format,12,1))
ids_qr.setitem(3,9, mid(ls_format,13,1))
ids_qr.setitem(2,9, mid(ls_format,14,1))
ids_qr.setitem(1,9, mid(ls_format,15,1))

//siempre hay uno negro aqui
ids_qr.setitem(iqr_config.tamanyo -7 , 9 , '1')

ids_qr.setitem(iqr_config.tamanyo,9, mid(ls_format,1,1))
ids_qr.setitem(iqr_config.tamanyo -1,9, mid(ls_format,2,1))
ids_qr.setitem(iqr_config.tamanyo -2,9, mid(ls_format,3,1))
ids_qr.setitem(iqr_config.tamanyo -3,9, mid(ls_format,4,1))
ids_qr.setitem(iqr_config.tamanyo -4,9, mid(ls_format,5,1))
ids_qr.setitem(iqr_config.tamanyo -5,9, mid(ls_format,6,1))
ids_qr.setitem(iqr_config.tamanyo -6,9, mid(ls_format,7,1))

ids_qr.setitem(9, iqr_config.tamanyo -7 , mid(ls_format,8,1))
ids_qr.setitem(9, iqr_config.tamanyo -6 , mid(ls_format,9,1))
ids_qr.setitem(9, iqr_config.tamanyo -5 , mid(ls_format,10,1))
ids_qr.setitem(9, iqr_config.tamanyo -4 , mid(ls_format,11,1))
ids_qr.setitem(9, iqr_config.tamanyo -3 , mid(ls_format,12,1))
ids_qr.setitem(9, iqr_config.tamanyo -2 , mid(ls_format,13,1))
ids_qr.setitem(9, iqr_config.tamanyo -1 , mid(ls_format,14,1))
ids_qr.setitem(9, iqr_config.tamanyo  , mid(ls_format,15,1))

//para la version >=7 lleva estos formatos a los lados 6x13 bits
//https://www.thonky.com/qr-code-tutorial/format-version-information
if ai_version>=7 then
	string ls_format2
	choose case ai_version
		case 7
			ls_format2='000111110010010100'
		case 8
			ls_format2='001000010110111100'
		case 9
			ls_format2='001001101010011001'
		case 10
			ls_format2='001010010011010011'
		case 11
			ls_format2='001011101111110110'
		case 12	
			ls_format2='001100011101100010'
		case 13
			ls_format2='001101100001000111'
		case 14
			ls_format2='001110011000001101'
		case 15
			ls_format2='001111100100101000'
		case 16
			ls_format2='010000101101111000'
		case 17
			ls_format2='010001010001011101'
		case 18
			ls_format2='010010101000010111'
		case 19
			ls_format2='010011010100110010'
		case 20
			ls_format2='010100100110100110'
		case 21
			ls_format2='010101011010000011'
		case 22
			ls_format2='010110100011001001'
		case 23
			ls_format2='010111011111101100'
		case 24
			ls_format2='011000111011000100'
		case 25
			ls_format2='011001000111100001'
		case 26
			ls_format2='011010111110101011'
		case 27
			ls_format2='011011000010001110'
		case 28
			ls_format2='011100110000011010'
		case 29
			ls_format2='011101001100111111'
		case 30
			ls_format2='011110110101110101'
		case 31
			ls_format2='011111001001010000'
		case 32
			ls_format2='100000100111010101'
		case 33
			ls_format2='100001011011110000'
		case 34
			ls_format2='100010100010111010'
		case 35
			ls_format2='100011011110011111'
		case 36
			ls_format2='100100101100001011'
		case 37
			ls_format2='100101010000101110'
		case 38
			ls_format2='100110101001100100'
		case 39
			ls_format2='100111010101000001'
		case 40
			ls_format2='101000110001101001'
	end choose
	
	long fil,col,li_cuenta=18
	for col=1 to 6
		for fil=1 to 3
			ids_qr.setitem( iqr_config.tamanyo -11 +fil, col , mid(ls_format2 , li_cuenta,1))
			//setitem( iqr_config.tamanyo -11 +fil, col , string( li_cuenta))
			li_cuenta -=1
		next
	next
	li_cuenta=18
	
	for fil=1 to 6
		for col=1 to 3
			ids_qr.setitem( fil ,  iqr_config.tamanyo -11 + col , mid(ls_format2 , li_cuenta,1))
			//setitem( fil ,  iqr_config.tamanyo -11 + col , string(li_cuenta))
			li_cuenta -=1
		next
	next
	
end if





end subroutine

private function string ordenar_mensaje (string as_msg[], string as_nivel_correccion);//codifica el mensaje por pedazos, deacuerdo a los bloques que define la version del QR
st_result_poly ls_msg //el de retornar

int j,k,l,m
long ll_sumatoria=1
string ls_pedazo,ls_todo
rs_blocks lst_blocks[]

lst_blocks = iqr_config.blocks


st_result_poly lst_result[] //va almacenando bloque por bloque el mensaje codificado

int li_block_mayor=0, li_data_mayor=1,li_bloque=1
string ls_pedazo_coded[],ls_vacio[]

for k= 1 to upperbound(lst_blocks)
	
	if  li_block_mayor<lst_blocks[k].n then li_block_mayor=lst_blocks[k].n
	if li_data_mayor<lst_blocks[k].k then li_data_mayor=lst_blocks[k].k
	
	for l=1 to lst_blocks[k].cantidad

		ls_pedazo_coded=ls_vacio
		
		for m=1 to lst_blocks[k].k
			ls_pedazo_coded[m]=as_msg[ ll_sumatoria -1 + m] //decimal_to_binary(asc(mid(ls_pedazo,m,1)),8)
		next
		
		ll_sumatoria+=lst_blocks[k].k
		
		lst_result[li_bloque]=i_rs_encoder.rs_encode_msg(ls_pedazo_coded, lst_blocks[k].n - lst_blocks[k].k) //se le agrega los caracteres adicionales
		
		lst_result[li_bloque].cant_data=lst_blocks[k].k
		li_bloque+=1

	next
next

int li_index=1
//intercalar los datos de cada uno de los bloques
for j=1 to li_block_mayor
	for k=1 to upperbound(lst_result)
		
		if j>lst_result[k].cant_data and j<=li_data_mayor then continue
		
		if j>lst_result[k].cant_data and lst_result[k].cant_data<li_data_mayor then
			ls_msg.result_poly[li_index]=lst_result[k].result_poly[j - ( li_data_mayor - lst_result[k].cant_data )]
		else
			ls_msg.result_poly[li_index]=lst_result[k].result_poly[j]
		end if
		
		ls_todo+=ls_msg.result_poly[li_index]
		
		li_index += 1
	next
next

return ls_todo
end function

public function blob draw_message_blob (string as_msg, string as_level_correction);//st_result_poly lst_msg_ordered
string ls_msg_coded,ls_mode,ls_filename
int li_len_msg,j

if isnull(as_level_correction) or as_level_correction='' then
	as_level_correction=ProfileString("qr_config.ini", "qrConfig", "correctionLevel",'-2')
	if as_level_correction='-2' then
		messagebox("Atención","No se puede leer el nivel de corrección del archivo qrConfig.ini ")
		return blob("-1")
	end if
end if

int li_mask
li_mask=ProfileInt("qr_config.ini", "qrConfig", "mask",-1)
if li_mask=-1 then
	//messagebox("Atención","No se puede leer la máscara del archivo qrConfig.ini se tomará por defecto la Nro 3 !!!")
	li_mask=3
end if

ls_filename=ProfileString("qr_config.ini", "qrConfig", "filename","-1")
if as_level_correction='-1' then
	//messagebox("Atención","No se puede leer desde archivo qrConfig.ini el nombre con el cual guardar la imagen QR !!! ")
	return  blob("-1")
end if

li_len_msg=len(as_msg)
int li_bytes_formato=2
for j =1 to 40
	if j>=9 then li_bytes_formato=3
	if if_data_size(j,as_level_correction)>li_len_msg+li_bytes_formato then 
		if_init(j,as_level_correction)
		exit
	end if
next
//https://www.nayuki.io/page/creating-a-qr-code-step-by-step
//se asume modo Byte 
/*
Encoding Mode	Indicator	Length (ver 1 to 9)		Length (ver 10 to 26)	Length (ver 27 to 40)
Numeric			0001			10							12							14
Alphanumeric	0010			9							11							13
Byte				0100			8							16							16
Kanji				1000			8							10							12
*/

if iqr_config.version<=9 then
	ls_mode='0100'+i_rs_encoder.decimal_to_binary(li_len_msg,8)
else
	ls_mode='0100'+i_rs_encoder.decimal_to_binary(li_len_msg,16)
end if

for j=1 to len(as_msg)
	ls_msg_coded+=i_rs_encoder.decimal_to_binary(asc(mid(as_msg,j,1)),8)
next
ls_msg_coded+='0000'//fin del mensaje

do while iqr_config.data>len(ls_mode + ls_msg_coded)/8  //rellenar lo que sobra con hxEC y hx11
	ls_msg_coded+='1110110000010001'
loop
ls_msg_coded=ls_mode+ls_msg_coded

string ls_block[]
j=1
do while j <=iqr_config.data
	ls_block[j]=mid(ls_msg_coded, (( (j -1)*8)+1) ,8)
	j+=1
loop

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ls_msg_coded=ordenar_mensaje(ls_block,as_level_correction)

draw_base(iqr_config.version)

int total,col,fil,count=1
total=iqr_config.tamanyo
col=total

boolean lbn_up=true

do while true
	if lbn_up then
		for fil=total to 1 step -1
			
			if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col))) then
				ids_qr.setitem(fil,col, mid(ls_msg_coded,count,1) )
				count+=1
			end if
			
			if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col -1))) then
				ids_qr.setitem(fil,col -1, mid(ls_msg_coded,count,1) )
				count+=1
			end if
		next
		lbn_up=false
		col=col -2
	else
		for fil=1 to total 
			
			if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col))) then
				ids_qr.setitem(fil,col, mid(ls_msg_coded,count,1))
				count+=1
			end if
			
			
			if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col -1))) then
				ids_qr.setitem(fil,col -1,mid(ls_msg_coded,count,1))
				count+=1
			end if
		next
		lbn_up=true
		col=col -2
	end if
	if col=7 then col=6
	if col<=0 then exit
loop

//mascara
string ls_bit

if_format_string(li_mask,as_level_correction,iqr_config.version)

for fil=1 to total
	for col=1 to total
	
		if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col ))) then 
			if ids_qr.getitemstring(fil,col)='' then ids_qr.setitem(fil,col,'0')
			if if_mask(fil,col,li_mask)=0 then
				ls_bit='0'
				if ids_qr.getitemstring(fil,col)='0' then ls_bit='1'
				ids_qr.setitem(fil,col,ls_bit)
			end if
		end if
	next
next

///////////////// archivo BMP
//https://itnext.io/bits-to-bitmaps-a-simple-walkthrough-of-bmp-image-format-765dc6857393
int li_archivo,ojo
Blob lblb_1
Any a
byte lbyte_array[]

 // initialize array
lbyte_array[] = {66,77,0,0,0,0,0,0,0,0,62,0,0,0,40,0,0,0}

lbyte_array[19]=iqr_config.tamanyo;  	lbyte_array[20]=0;		lbyte_array[21]=0;		lbyte_array[22]=0	//width
lbyte_array[23]=iqr_config.tamanyo; 		lbyte_array[24]=0;		lbyte_array[25]=0;		lbyte_array[26]=0	//height
lbyte_array[27]=1; 							lbyte_array[28]=0;																//planes
lbyte_array[29]=1; 							lbyte_array[30]=0;																//BitsPerPixel

lbyte_array[31]=0; 							lbyte_array[32]=0; 		lbyte_array[33]=0; 		lbyte_array[34]=0; 
lbyte_array[35]=0; 							lbyte_array[36]=0; 		lbyte_array[37]=0; 		lbyte_array[38]=0; 
lbyte_array[39]=0; 							lbyte_array[40]=0; 		lbyte_array[41]=0; 		lbyte_array[42]=0; 
lbyte_array[43]=0; 							lbyte_array[44]=0; 		lbyte_array[45]=0; 		lbyte_array[46]=0; 
lbyte_array[47]=0; 							lbyte_array[48]=0; 		lbyte_array[49]=0; 		lbyte_array[50]=0; 
lbyte_array[51]=0; 							lbyte_array[52]=0; 		lbyte_array[53]=0; 		lbyte_array[54]=0; 

lbyte_array[55]=255; 						lbyte_array[56]=255;		lbyte_array[57]=255;		lbyte_array[58]=0; //color 0's Table
lbyte_array[59]=0; 							lbyte_array[60]=0; 		lbyte_array[61]=0; 		lbyte_array[62]=0; //color 1's Table

int k,li_index=63
string ls_byte
int li_ciclos

li_ciclos=int(iqr_config.tamanyo /32)						//se deben armar filas con multiplos de 4 bytes
if mod(iqr_config.tamanyo,32)<>0 then li_ciclos++	

for j=iqr_config.tamanyo to 1 step -1
	for k=0 to li_ciclos -1
		for col=0 to 3
			ls_byte=''
			if  (col*8) +(32*k) +1<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +1) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +2<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +2) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +3<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +3) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +4<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +4) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +5<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +5) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +6<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +6) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +7<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +7) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +8<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +8) ;	else ; 	ls_byte+='0'; 	end if;
			
			lbyte_array[li_index]=i_rs_encoder.binary_to_decimal(ls_byte)
			li_index ++

		next
	next
next

a = lbyte_array

lblb_1 = Blob(a)


return lblb_1

end function

public function string draw_msg (string as_msg, string as_level_correction, string as_filename);//st_result_poly lst_msg_ordered
string ls_msg_coded,ls_mode,ls_filename
int li_len_msg,j

if isnull(as_level_correction) or as_level_correction='' then
	as_level_correction=ProfileString("qr_config.ini", "qrConfig", "correctionLevel",'-2')
	if as_level_correction='-2' then
		//messagebox("Atención","No se puede leer el nivel de corrección del archivo qrConfig.ini ")
		return "-1"
	end if
end if

int li_mask
li_mask=ProfileInt("qr_config.ini", "qrConfig", "mask",-1)
if li_mask=-1 then
	//messagebox("Atención","No se puede leer la máscara del archivo qrConfig.ini se tomará por defecto la Nro 3 !!!")
	li_mask=3
end if

if isnull(as_filename) or as_filename='' then
	ls_filename=ProfileString("qr_config.ini", "qrConfig", "filename","-1")
	if as_level_correction='-1' then
		messagebox("Atención","No se puede leer desde archivo qrConfig.ini el nombre con el cual guardar la imagen QR !!! ")
		return  "-1"
	end if
else
	ls_filename=as_filename
end if

li_len_msg=len(as_msg)
int li_bytes_formato=2
for j =1 to 40
	if j>=9 then li_bytes_formato=3
	if if_data_size(j,as_level_correction)>li_len_msg+li_bytes_formato then 
		if_init(j,as_level_correction)
		exit
	end if
next
//https://www.nayuki.io/page/creating-a-qr-code-step-by-step
//se asume modo Byte 
/*
Encoding Mode	Indicator	Length (ver 1 to 9)		Length (ver 10 to 26)	Length (ver 27 to 40)
Numeric			0001			10							12							14
Alphanumeric	0010			9							11							13
Byte				0100			8							16							16
Kanji				1000			8							10							12
*/

if iqr_config.version<=9 then
	ls_mode='0100'+i_rs_encoder.decimal_to_binary(li_len_msg,8)
else
	ls_mode='0100'+i_rs_encoder.decimal_to_binary(li_len_msg,16)
end if

for j=1 to len(as_msg)
	ls_msg_coded+=i_rs_encoder.decimal_to_binary(asc(mid(as_msg,j,1)),8)
next
ls_msg_coded+='0000'//fin del mensaje

do while iqr_config.data>len(ls_mode + ls_msg_coded)/8  //rellenar lo que sobra con hxEC y hx11
	ls_msg_coded+='1110110000010001'
loop
ls_msg_coded=ls_mode+ls_msg_coded

string ls_block[]
j=1
do while j <=iqr_config.data
	ls_block[j]=mid(ls_msg_coded, (( (j -1)*8)+1) ,8)
	j+=1
loop

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ls_msg_coded=ordenar_mensaje(ls_block,as_level_correction)

draw_base(iqr_config.version)

int total,col,fil,count=1
total=iqr_config.tamanyo
col=total

boolean lbn_up=true

do while true
	if lbn_up then
		for fil=total to 1 step -1
			
			if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col))) then
				ids_qr.setitem(fil,col, mid(ls_msg_coded,count,1) )
				count+=1
			end if
			
			if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col -1))) then
				ids_qr.setitem(fil,col -1, mid(ls_msg_coded,count,1) )
				count+=1
			end if
		next
		lbn_up=false
		col=col -2
	else
		for fil=1 to total 
			
			if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col))) then
				ids_qr.setitem(fil,col, mid(ls_msg_coded,count,1))
				count+=1
			end if
			
			
			if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col -1))) then
				ids_qr.setitem(fil,col -1,mid(ls_msg_coded,count,1))
				count+=1
			end if
		next
		lbn_up=true
		col=col -2
	end if
	if col=7 then col=6
	if col<=0 then exit
loop

//mascara
string ls_bit

if_format_string(li_mask,as_level_correction,iqr_config.version)

for fil=1 to total
	for col=1 to total
	
		if isnull(ids_qr.getitemnumber(fil,'reserv'+string(col ))) then 
			if ids_qr.getitemstring(fil,col)='' then ids_qr.setitem(fil,col,'0')
			if if_mask(fil,col,li_mask)=0 then
				ls_bit='0'
				if ids_qr.getitemstring(fil,col)='0' then ls_bit='1'
				ids_qr.setitem(fil,col,ls_bit)
			end if
		end if
	next
next

///////////////// archivo BMP
//https://itnext.io/bits-to-bitmaps-a-simple-walkthrough-of-bmp-image-format-765dc6857393
int li_archivo,ojo
Blob lblb_1
Any a
byte lbyte_array[]

 // initialize array
lbyte_array[] = {66,77,0,0,0,0,0,0,0,0,62,0,0,0,40,0,0,0}

lbyte_array[19]=iqr_config.tamanyo;  	lbyte_array[20]=0;		lbyte_array[21]=0;		lbyte_array[22]=0	//width
lbyte_array[23]=iqr_config.tamanyo; 		lbyte_array[24]=0;		lbyte_array[25]=0;		lbyte_array[26]=0	//height
lbyte_array[27]=1; 							lbyte_array[28]=0;																//planes
lbyte_array[29]=1; 							lbyte_array[30]=0;																//BitsPerPixel

lbyte_array[31]=0; 							lbyte_array[32]=0; 		lbyte_array[33]=0; 		lbyte_array[34]=0; 
lbyte_array[35]=0; 							lbyte_array[36]=0; 		lbyte_array[37]=0; 		lbyte_array[38]=0; 
lbyte_array[39]=0; 							lbyte_array[40]=0; 		lbyte_array[41]=0; 		lbyte_array[42]=0; 
lbyte_array[43]=0; 							lbyte_array[44]=0; 		lbyte_array[45]=0; 		lbyte_array[46]=0; 
lbyte_array[47]=0; 							lbyte_array[48]=0; 		lbyte_array[49]=0; 		lbyte_array[50]=0; 
lbyte_array[51]=0; 							lbyte_array[52]=0; 		lbyte_array[53]=0; 		lbyte_array[54]=0; 

lbyte_array[55]=255; 						lbyte_array[56]=255;		lbyte_array[57]=255;		lbyte_array[58]=0; //color 0's Table
lbyte_array[59]=0; 							lbyte_array[60]=0; 		lbyte_array[61]=0; 		lbyte_array[62]=0; //color 1's Table

int k,li_index=63
string ls_byte
int li_ciclos

li_ciclos=int(iqr_config.tamanyo /32)						//se deben armar filas con multiplos de 4 bytes
if mod(iqr_config.tamanyo,32)<>0 then li_ciclos++	

for j=iqr_config.tamanyo to 1 step -1
	for k=0 to li_ciclos -1
		for col=0 to 3
			ls_byte=''
			if  (col*8) +(32*k) +1<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +1) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +2<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +2) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +3<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +3) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +4<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +4) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +5<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +5) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +6<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +6) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +7<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +7) ;	else ; 	ls_byte+='0'; 	end if;
			if  (col*8) +(32*k) +8<= iqr_config.tamanyo then ; ls_byte+=ids_qr.getitemstring(j,  (col*8) +(32*k) +8) ;	else ; 	ls_byte+='0'; 	end if;
			
			lbyte_array[li_index]=i_rs_encoder.binary_to_decimal(ls_byte)
			li_index ++

		next
	next
next

a = lbyte_array

lblb_1 = Blob(a)

li_archivo=fileopen(ls_filename,StreamMode! ,Write!,LockWrite!, Replace!)

ojo=filewriteex(li_archivo,lblb_1)

ojo=fileclose(li_archivo)

return ls_filename

end function

on draw_qr_code.create
call super::create
TriggerEvent( this, "constructor" )
end on

on draw_qr_code.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;i_rs_encoder= create reed_solomon_encoder
ids_qr=create datastore
ids_qr.dataobject='dr_qr'
end event

