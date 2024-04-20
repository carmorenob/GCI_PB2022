$PBExportHeader$reed_solomon_encoder.sru
forward
global type reed_solomon_encoder from nonvisualobject
end type
end forward

global type reed_solomon_encoder from nonvisualobject
end type
global reed_solomon_encoder reed_solomon_encoder

type variables
private datastore ids_alfa , ids_posiciones
end variables

forward prototypes
public function long binary_to_decimal (string as_binary)
public function string decimal_to_binary (long al_numero, integer ai_largo)
public subroutine init_tables (string as_binary_prime)
public function string binary_mult_by_2 (string as_binary)
public function string gf_add (string as_x, string as_y)
public function string gf_sub (string as_x, string as_y)
public function string gf_mult (string as_x, string as_y)
public function string gf_div (string as_x, string as_y)
public function st_result_poly gf_poly_mul (string as_poly_a[], string as_poly_b[])
public function st_result_poly rs_generator_poly (integer ai_nro_symbols)
public function st_result_poly gf_poly_div (string as_dividend[], string as_divisor[])
public function st_result_poly rs_encode_msg (string as_msg_in[], integer ai_nro_symbols)
public function string hex_to_bin (string as_hexadecimal)
public function string bin_to_hex (string as_binary)
private function string binary_xor (string as_binary1, string as_binary2)
public function long hex_to_dec (string as_hexadecimal)
end prototypes

public function long binary_to_decimal (string as_binary);Long ll_decimal=0,ll_potencia=1,j


for j= len(as_binary) to 1 step -1
	ll_decimal+=long(mid(as_binary,j,1))*ll_potencia
	ll_potencia=ll_potencia*2
next

return ll_decimal
end function

public function string decimal_to_binary (long al_numero, integer ai_largo);string ls_residuos,ls_binario

if al_numero=0 then ls_residuos='0'

do while al_numero>=1
	ls_residuos+=string(mod(al_numero,2))
	al_numero=long(al_numero/2)
loop
ls_binario=fill('0',ai_largo -1)+reverse(ls_residuos)
return right(ls_binario,ai_largo)
end function

public subroutine init_tables (string as_binary_prime);/*as_binary_prime es el numero primo para utilizar como mascara cuando al multiplicar por alfa^2 sobra un uno 
	(multiplicar por alfa^2 es correr una posicion a la derecha, entonces puede sobrar un uno)  */

string ls_alfa0,ls_carry

ls_alfa0='00000001'

ids_alfa.reset()
ids_posiciones.reset()

ids_alfa.insertrow(1);								ids_alfa.setitem(1,'exponente',0);							ids_alfa.setitem(1,'binario',ls_alfa0)
ids_posiciones.insertrow(1);					ids_posiciones.setitem(1,'numero_decimal',1);			ids_posiciones.setitem(1,'posicion',1)

int j

for j=2 to 512
	ls_alfa0=binary_mult_by_2(ls_alfa0)
	ls_carry=mid(ls_alfa0,1,1)
	ls_alfa0=right(ls_alfa0,8)
	
	if ls_carry='1' then ls_alfa0=right(binary_xor(ls_alfa0,as_binary_prime),8)
	
	ids_alfa.insertrow(j);							ids_alfa.setitem(j,'exponente',j -1);						ids_alfa.setitem(j,'binario',ls_alfa0)					
	
	if j<=255 then
		ids_posiciones.insertrow(j);				ids_posiciones.setitem(j,'numero_decimal',binary_to_decimal(ls_alfa0));	ids_posiciones.setitem(j,'posicion',j )
	end if
next

ids_posiciones.setsort("numero_decimal A")
ids_posiciones.sort()
end subroutine

public function string binary_mult_by_2 (string as_binary);return as_binary+'0'
end function

public function string gf_add (string as_x, string as_y);return binary_xor(as_x,as_y)
end function

public function string gf_sub (string as_x, string as_y);return binary_xor(as_x,as_y)
end function

public function string gf_mult (string as_x, string as_y);string ls_mult
long ll_x,ll_y,ll_pos,ll_suma

ll_x=binary_to_decimal(as_x)
ll_y=binary_to_decimal(as_y)

if ll_x=0 then return as_x
if ll_y=0 then return as_y

ll_suma=ids_alfa.getitemnumber(ids_posiciones.getitemnumber(ll_x,'posicion'),'exponente')+ids_alfa.getitemnumber(ids_posiciones.getitemnumber(ll_y,'posicion'),'exponente')

ls_mult=ids_alfa.getitemstring(ll_suma+1,'binario')

return ls_mult
end function

public function string gf_div (string as_x, string as_y);string ls_div
long ll_x,ll_y,ll_pos

byte ll_resta

ll_x=binary_to_decimal(as_x)
ll_y=binary_to_decimal(as_y)

if ll_x=0 then return as_x
if ll_y=0 then return as_y ////ojooooooooooooo

ll_resta=ids_alfa.getitemnumber(ids_posiciones.getitemnumber(ll_x,'posicion'),'exponente')-ids_alfa.getitemnumber(ids_posiciones.getitemnumber(ll_y,'posicion'),'exponente')

ls_div=ids_alfa.getitemstring(ll_resta+1,'binario')

return ls_div
end function

public function st_result_poly gf_poly_mul (string as_poly_a[], string as_poly_b[]);st_result_poly ls_result

long j,i

for j=1 to upperbound(as_poly_a) +upperbound(as_poly_b) -1
	ls_result.result_poly[j ]=''
next

for j=1 to upperbound(as_poly_a) 
	for i =0 to upperbound(as_poly_b) -1
		if ls_result.result_poly[j +i]='' then
			ls_result.result_poly[j +i]=gf_mult(as_poly_a[j],as_poly_b[i+1])
		else
			ls_result.result_poly[j +i]=gf_add( ls_result.result_poly[j +i], gf_mult(as_poly_a[j],as_poly_b[i+1]) )
		end if
	next
next

return ls_result
end function

public function st_result_poly rs_generator_poly (integer ai_nro_symbols);st_result_poly lst_result

lst_result.result_poly={ ids_alfa.getitemstring(1,'binario') , ids_alfa.getitemstring(1,'binario') }

int j

for j=2 to ai_nro_symbols 
	
	lst_result.result_poly=gf_poly_mul(lst_result.result_poly,{ ids_alfa.getitemstring(1,'binario') , ids_alfa.getitemstring(j,'binario') }).result_poly
next

return lst_result
end function

public function st_result_poly gf_poly_div (string as_dividend[], string as_divisor[]);st_result_poly lst_result

int i,j
string ls_coef=''

for i=0 to upperbound(as_dividend) - upperbound (as_divisor) -1
	for j=1 to upperbound(as_divisor)
		
		lst_result.result_poly[i + j ]=''
	next
next


for i=0 to upperbound(as_dividend) - upperbound (as_divisor) -1
	
	ls_coef = as_dividend[i+1]
	
	for j=1 to upperbound(as_divisor)
		
		if lst_result.result_poly[i + j ]='' then
			lst_result.result_poly[i + j ]=gf_sub( '00000001',gf_mult( as_divisor[j] , ls_coef ) )
		else
			lst_result.result_poly[i + j ]=gf_sub(lst_result.result_poly[i + j ],gf_mult( as_divisor[j] , ls_coef ) )
		end if
		
	next
	
next

return lst_result
end function

public function st_result_poly rs_encode_msg (string as_msg_in[], integer ai_nro_symbols);//codifica el mensaje original con los digitos de correccion de error

st_result_poly lst_result

string ls_gen_poly[],ls_coef

ls_gen_poly=rs_generator_poly(ai_nro_symbols).result_poly

int j,i

for j=1 to upperbound(as_msg_in) + upperbound(ls_gen_poly) -1
	if j<=upperbound(as_msg_in) then
		lst_result.result_poly[j]=as_msg_in[j]
	else
		lst_result.result_poly[j]=''
	end if
next

string ls_mult


for i=1 to upperbound(as_msg_in)
	
	ls_coef=lst_result.result_poly[i]
	
	for j=2 to upperbound(ls_gen_poly)
		
		ls_mult=gf_mult( ls_gen_poly[j] , ls_coef)
		lst_result.result_poly[ i - 1 +j]= gf_add( lst_result.result_poly[ i - 1 +j] , ls_mult ) 
		
	next
	
next

for j=1 to upperbound(as_msg_in) 
	lst_result.result_poly[j]=as_msg_in[j]
next	

return lst_result
end function

public function string hex_to_bin (string as_hexadecimal);string ls_binario

int j,ll_digito

for j=1 to len(as_hexadecimal)
	if not isnumber(mid(as_hexadecimal,j,1)) then
		ll_digito=asc(mid(as_hexadecimal,j,1)) -87
	else
		ll_digito=integer(mid(as_hexadecimal,j,1))
	end if
	ls_binario+=decimal_to_binary(ll_digito,4)
next

return ls_binario
end function

public function string bin_to_hex (string as_binary);string ls_hexa,ls_digito
int li_digito
int j=1

do while j<len(as_binary)
	ls_digito=mid(as_binary,j,4)
	
	li_digito=binary_to_decimal(ls_digito)
	
	ls_digito=string(li_digito)
	if li_digito>=10 then
		ls_digito=char( 87 + li_digito)
	end if
	ls_hexa+=ls_digito
	j+=4
loop

return ls_hexa
end function

private function string binary_xor (string as_binary1, string as_binary2);string ls_xor='',ls_longest,ls_smallest,ls_1,ls_2
long j

ls_longest=reverse(as_binary1)
ls_smallest=reverse(as_binary2)

if len(as_binary2)>len(as_binary1) then 
	ls_longest=reverse(as_binary2)
	ls_smallest=reverse(as_binary1)
end if 

for j=1 to len(ls_longest)
	ls_1=mid(ls_longest,j,1)
	ls_2=mid(ls_smallest,j,1)
	if ls_2='' then ls_2='0'
	if (ls_1='0' and ls_2='0') or (ls_1='1' and ls_2='1') then
		ls_xor+='0'
	else
		ls_xor+='1'
	end if
next

return reverse(ls_xor)
end function

public function long hex_to_dec (string as_hexadecimal);string ls_binario

int j,ll_digito,li_potencia=0
long ll_dec=0

for j=1 to len(as_hexadecimal)
	if not isnumber(mid(as_hexadecimal,j,1)) then
		ll_digito=asc(mid(as_hexadecimal,j,1)) -87
	else
		ll_digito=integer(mid(as_hexadecimal,j,1))
	end if
	ll_dec+=(16^li_potencia)*ll_digito
next

return ll_dec
end function

on reed_solomon_encoder.create
call super::create
TriggerEvent( this, "constructor" )
end on

on reed_solomon_encoder.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_alfa=create datastore
ids_posiciones=create datastore


ids_alfa.dataobject='ds_alfas'
ids_posiciones.dataobject='ds_mapa_alfas'

string ls_prim
ls_prim= hex_to_bin('11d')

init_tables(ls_prim)
end event

