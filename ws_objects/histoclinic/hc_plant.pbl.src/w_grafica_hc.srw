$PBExportHeader$w_grafica_hc.srw
forward
global type w_grafica_hc from window
end type
type gr_1 from graph within w_grafica_hc
end type
type dw_5 from datawindow within w_grafica_hc
end type
type dw_3 from datawindow within w_grafica_hc
end type
type dw_2 from datawindow within w_grafica_hc
end type
type st_1 from statictext within w_grafica_hc
end type
type pb_cancelar from picturebutton within w_grafica_hc
end type
type cb_tipo from picturebutton within w_grafica_hc
end type
type dw_4 from datawindow within w_grafica_hc
end type
type dw_1 from datawindow within w_grafica_hc
end type
end forward

global type w_grafica_hc from window
integer width = 3479
integer height = 2384
boolean titlebar = true
string title = "Curva para "
windowtype windowtype = response!
long backcolor = 67108864
string icon = "area_dx.ico"
boolean center = true
gr_1 gr_1
dw_5 dw_5
dw_3 dw_3
dw_2 dw_2
st_1 st_1
pb_cancelar pb_cancelar
cb_tipo cb_tipo
dw_4 dw_4
dw_1 dw_1
end type
global w_grafica_hc w_grafica_hc

type variables
st_xa_graficas i_stde
string filtro_previo
datawindowchild graf

end variables

forward prototypes
public function st_rango_edad f_ubica_edad (string grafica, double edad1, double edad2, string sexo, integer filas, double edad_b)
end prototypes

public function st_rango_edad f_ubica_edad (string grafica, double edad1, double edad2, string sexo, integer filas, double edad_b);st_rango_edad salida

if g_motor='postgres' then
	salida.edad1=1
	salida.edad2=2
else
	SELECT max(maxi),min(mini) into :salida.edad1,:salida.edad2  FROM 
	(
		 SELECT null as mini, max(edad) as maxi 
		 FROM
			  (SELECT	edad ,ROW_NUMBER () OVER (ORDER BY hclin_grafica_porcentil.edad asc) as fila  FROM HCLIN_GRAFICA_PORCENTIL 
			  WHERE (edad< :edad_b and codgrafica=:grafica  and indsexo in ('2',:sexo) and (edad between :edad1 and :edad2))
			  GROUP BY  edad) as maximo
			  WHERE (fila=1 or ((fila/:filas)*5=:filas))
		 UNION
		 SELECT min(edad) as mini, null as maxi
		 FROM
			  (SELECT	edad ,ROW_NUMBER () OVER (ORDER BY hclin_grafica_porcentil.edad asc) as fila  FROM HCLIN_GRAFICA_PORCENTIL 
			  WHERE (edad>:edad_b and codgrafica=:grafica  and indsexo in ('2',:sexo)  and (edad between :edad1 and :edad2))
			  GROUP BY  edad) as minimo
			  WHERE (fila=1 or ((fila/:filas)*:filas=fila)) 
	) AS todo;
	
	if isnull(salida.edad1) then salida.edad1=0
end if
return salida
end function

on w_grafica_hc.create
this.gr_1=create gr_1
this.dw_5=create dw_5
this.dw_3=create dw_3
this.dw_2=create dw_2
this.st_1=create st_1
this.pb_cancelar=create pb_cancelar
this.cb_tipo=create cb_tipo
this.dw_4=create dw_4
this.dw_1=create dw_1
this.Control[]={this.gr_1,&
this.dw_5,&
this.dw_3,&
this.dw_2,&
this.st_1,&
this.pb_cancelar,&
this.cb_tipo,&
this.dw_4,&
this.dw_1}
end on

on w_grafica_hc.destroy
destroy(this.gr_1)
destroy(this.dw_5)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.pb_cancelar)
destroy(this.cb_tipo)
destroy(this.dw_4)
destroy(this.dw_1)
end on

event open;i_stde=message.powerobjectparm
title+=upper(w_principal.dw_1.getitemstring(1,'nombre'))
filtro_previo=i_stde.dw_captura.Describe ("Datawindow.Table.Filter") 
if dw_2.Retrieve (i_stde.codplantilla,i_stde.numcampo)=0 then 
	MessageBox("Atención", "No hay Gráficos configurados para esta campo")
	Close(w_grafica_hc)
end if
graf.retrieve(i_stde.codplantilla,i_stde.numcampo)
dw_2.event itemchanged(1,dw_2.object.codgrafica,dw_2.getitemstring(1,1))

end event

type gr_1 from graph within w_grafica_hc
integer x = 110
integer y = 152
integer width = 3269
integer height = 1556
boolean border = true
grgraphtype graphtype = linegraph!
long textcolor = 33554432
long backcolor = 12639424
integer spacing = 100
integer elevation = 20
integer rotation = -20
integer perspective = 2
integer depth = 100
boolean focusrectangle = false
end type

on gr_1.create
TitleDispAttr = create grDispAttr
LegendDispAttr = create grDispAttr
PieDispAttr = create grDispAttr
Series = create grAxis
Series.DispAttr = create grDispAttr
Series.LabelDispAttr = create grDispAttr
Category = create grAxis
Category.DispAttr = create grDispAttr
Category.LabelDispAttr = create grDispAttr
Values = create grAxis
Values.DispAttr = create grDispAttr
Values.LabelDispAttr = create grDispAttr
TitleDispAttr.Weight=700
TitleDispAttr.FaceName="Tahoma"
TitleDispAttr.FontCharSet=DefaultCharSet!
TitleDispAttr.FontFamily=Swiss!
TitleDispAttr.FontPitch=Variable!
TitleDispAttr.Alignment=Center!
TitleDispAttr.BackColor=536870912
TitleDispAttr.Format="[General]"
TitleDispAttr.DisplayExpression="title"
TitleDispAttr.AutoSize=true
Category.Label="ss"
Category.AutoScale=true
Category.ShadeBackEdge=true
Category.SecondaryLine=transparent!
Category.MajorGridLine=dot!
Category.MinorGridLine=transparent!
Category.DropLines=transparent!
Category.MajorTic=Outside!
Category.DataType=adtText!
Category.DispAttr.TextSize=12
Category.DispAttr.Weight=400
Category.DispAttr.FaceName="Tahoma"
Category.DispAttr.FontCharSet=DefaultCharSet!
Category.DispAttr.FontFamily=Swiss!
Category.DispAttr.FontPitch=Variable!
Category.DispAttr.Alignment=Center!
Category.DispAttr.BackColor=536870912
Category.DispAttr.Format="[General]"
Category.DispAttr.DisplayExpression="category"
Category.LabelDispAttr.TextSize=12
Category.LabelDispAttr.Weight=400
Category.LabelDispAttr.FaceName="Tahoma"
Category.LabelDispAttr.FontCharSet=DefaultCharSet!
Category.LabelDispAttr.FontFamily=Swiss!
Category.LabelDispAttr.FontPitch=Variable!
Category.LabelDispAttr.Alignment=Center!
Category.LabelDispAttr.BackColor=536870912
Category.LabelDispAttr.Format="[General]"
Category.LabelDispAttr.DisplayExpression="categoryaxislabel"
Values.AutoScale=true
Values.RoundTo=2
Values.MajorDivisions=5
Values.SecondaryLine=transparent!
Values.MajorGridLine=dot!
Values.MinorGridLine=transparent!
Values.DropLines=transparent!
Values.MajorTic=Inside!
Values.MinorTic=Straddle!
Values.DataType=adtDouble!
Values.DispAttr.TextSize=12
Values.DispAttr.Weight=400
Values.DispAttr.FaceName="Tahoma"
Values.DispAttr.FontCharSet=DefaultCharSet!
Values.DispAttr.FontFamily=Swiss!
Values.DispAttr.FontPitch=Variable!
Values.DispAttr.Alignment=Right!
Values.DispAttr.BackColor=536870912
Values.DispAttr.Format="[General]"
Values.DispAttr.DisplayExpression="value"
Values.LabelDispAttr.TextSize=12
Values.LabelDispAttr.Weight=400
Values.LabelDispAttr.FaceName="Tahoma"
Values.LabelDispAttr.FontCharSet=DefaultCharSet!
Values.LabelDispAttr.FontFamily=Swiss!
Values.LabelDispAttr.FontPitch=Variable!
Values.LabelDispAttr.Alignment=Center!
Values.LabelDispAttr.BackColor=536870912
Values.LabelDispAttr.Format="[General]"
Values.LabelDispAttr.DisplayExpression="valuesaxislabel"
Values.LabelDispAttr.Escapement=900
Series.Label="(None)"
Series.AutoScale=true
Series.SecondaryLine=transparent!
Series.MajorGridLine=transparent!
Series.MinorGridLine=transparent!
Series.DropLines=transparent!
Series.OriginLine=transparent!
Series.MajorTic=Outside!
Series.DataType=adtText!
Series.DispAttr.TextSize=12
Series.DispAttr.Weight=400
Series.DispAttr.FaceName="Tahoma"
Series.DispAttr.FontCharSet=DefaultCharSet!
Series.DispAttr.FontFamily=Swiss!
Series.DispAttr.FontPitch=Variable!
Series.DispAttr.BackColor=536870912
Series.DispAttr.Format="[General]"
Series.DispAttr.DisplayExpression="series"
Series.LabelDispAttr.TextSize=11
Series.LabelDispAttr.Weight=400
Series.LabelDispAttr.FaceName="Tahoma"
Series.LabelDispAttr.FontCharSet=DefaultCharSet!
Series.LabelDispAttr.FontFamily=Swiss!
Series.LabelDispAttr.FontPitch=Variable!
Series.LabelDispAttr.Alignment=Center!
Series.LabelDispAttr.BackColor=536870912
Series.LabelDispAttr.Format="[General]"
Series.LabelDispAttr.DisplayExpression="seriesaxislabel"
LegendDispAttr.TextSize=15
LegendDispAttr.Weight=400
LegendDispAttr.FaceName="Tahoma"
LegendDispAttr.FontCharSet=DefaultCharSet!
LegendDispAttr.FontFamily=Swiss!
LegendDispAttr.FontPitch=Variable!
LegendDispAttr.BackColor=536870912
LegendDispAttr.Format="[General]"
LegendDispAttr.DisplayExpression="series"
PieDispAttr.Weight=400
PieDispAttr.FaceName="Tahoma"
PieDispAttr.FontCharSet=DefaultCharSet!
PieDispAttr.FontFamily=Swiss!
PieDispAttr.FontPitch=Variable!
PieDispAttr.BackColor=536870912
PieDispAttr.Format="[General]"
PieDispAttr.DisplayExpression="if(seriescount > 1, series,string(percentofseries,~"0.00%~"))"
PieDispAttr.AutoSize=true
end on

on gr_1.destroy
destroy TitleDispAttr
destroy LegendDispAttr
destroy PieDispAttr
destroy Series.DispAttr
destroy Series.LabelDispAttr
destroy Series
destroy Category.DispAttr
destroy Category.LabelDispAttr
destroy Category
destroy Values.DispAttr
destroy Values.LabelDispAttr
destroy Values
end on

type dw_5 from datawindow within w_grafica_hc
integer x = 1851
integer y = 1748
integer width = 1518
integer height = 484
integer taborder = 50
string title = "none"
string dataobject = "dw_hclin_graficas_interpretacion"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_5.SetTransObject (sqlca)
end event

type dw_3 from datawindow within w_grafica_hc
integer x = 50
integer y = 1764
integer width = 1559
integer height = 484
integer taborder = 40
string dataobject = "dw_datos_plani_pac_graf"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_3.SetTransObject (sqlca)
end event

type dw_2 from datawindow within w_grafica_hc
integer x = 457
integer y = 12
integer width = 1394
integer height = 88
integer taborder = 20
string title = "none"
string dataobject = "dw_graficas_campo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_2.SetTransObject (sqlca)
getchild('codgrafica',graf)
graf.settransobject(sqlca)

end event

event itemchanged;int  li,lk,li_series_num,li_serie_pac,l_e=1,j, fila,l_c,l_cuantos, inf,cen, sup,divide=5 
double l_edad1,l_edad2,l_edad,l_min_val,l_max_val,l_dato,l_min,l_ubic1
st_rango_edad l_ubic
string l_edad_en,l_sex, l_sql_tod,i_sql_edad,l_xy
string titulo_serie
long color

gr_1.SetRedraw (False)
gr_1.reset ( all! )
gr_1.series.Label='' 
choose case i_stde.sexo
	case 'F'  
		l_sex='1'
	case 'M' 
		l_sex='0'
end choose 

if g_motor='postgres' then
	SELECT 
		Min(edad) , Max(edad),Min(P1) , 
		case when Max(P7) is null then  case when Max(P6) is null then case when Max(P5) is null then case when Max(P4) is null then case when Max(P3) is null then case when Max(P2) is null then 0 else Max(P2) end else Max(P3) end  else Max(P4) end else Max(P5) end else Max(P6) end else  Max(P7) end 
	INTO :l_edad1,:l_edad2,:l_min_val,:l_max_val
	FROM hclin_grafica_porcentil
	WHERE (((hclin_grafica_porcentil.codgrafica)=:data) AND ((hclin_grafica_porcentil.IndSexo) in (:l_sex,'2')));
else
	SELECT 
		Min(edad) , Max(edad),Min(P1) , 
		case when Max(P7) is null then case when Max(P6) is null then case when Max(P5) is null then case when Max(P4) is null then case when Max(P3) is null then case when Max(P2) is null then 0 else Max(P2) end else Max(P3) end else Max(P4) end else Max(P5) end  else Max(P6) end  else  Max(P7) end 
	INTO :l_edad1,:l_edad2,:l_min_val,:l_max_val
	FROM hclin_grafica_porcentil
	WHERE (((hclin_grafica_porcentil.codgrafica)=:data) AND ((hclin_grafica_porcentil.IndSexo) in (:l_sex,'2')));
end If
if sqlca.sqlcode=-1 then
	messagebox("Error Leyendo Datos de Grafica",sqlca.sqlerrtext)
end if

If  isnull(l_min_val) and isnull(l_max_val ) then
	MessageBox("Atención", "No hay datos con estos parametros para Graficar")
	 Close(w_grafica_hc)
	return
end if

//para saber el tipo de grafica
l_xy=graf.getitemstring(graf.getrow(),'xy')
Choose Case  l_xy
	Case '0'
	  dw_4.DataObject = 'dw_plantilla_grafica'
	  	if g_motor='sql' then
			i_sql_edad="SELECT round((dbo.f_dias_360( Pacientes.FNacimiento,hclin_registro.fecha_reg) / "
		else
			i_sql_edad="SELECT round((f_dias_360( Pacientes.FNacimiento,hclin_registro.fecha_reg) / "
		End If
		l_sql_tod=" HCLIN_REG_VALOR.numero,hclin_registro.fecha_reg   &
		  FROM ((hclin_registro INNER JOIN Historial ON (hclin_registro.clugar = Historial.clugar) AND (hclin_registro.contador = Historial.Contador)) INNER JOIN HCLIN_REG_VALOR ON &
		(hclin_registro.nregistro = HCLIN_REG_VALOR.nregistro) AND (hclin_registro.clugar = HCLIN_REG_VALOR.clugar) AND (hclin_registro.contador = HCLIN_REG_VALOR.CONTADOR)) INNER JOIN Pacientes ON &
		(Historial.Documento = Pacientes.Documento) AND (Historial.TipoDoc = Pacientes.TipoDoc)&
		WHERE "
	Case '1','2'
		If l_xy='1' then
		 	dw_4.DataObject = 'dw_plantilla_grafica_xy'
		else
			 dw_4.DataObject = 'dw_plantilla_grafica_xyz'
		end if
		 l_sql_tod="SELECT   HCLIN_REG_VALOR_1.numero,HCLIN_REG_VALOR.numero, hclin_registro.fecha_reg&
			FROM (((hclin_registro INNER JOIN Historial ON (hclin_registro.contador = Historial.Contador) AND (hclin_registro.clugar = Historial.clugar)) &
			INNER JOIN HCLIN_REG_VALOR ON (hclin_registro.contador = HCLIN_REG_VALOR.CONTADOR) AND (hclin_registro.clugar = HCLIN_REG_VALOR.clugar) AND &
			(hclin_registro.nregistro = HCLIN_REG_VALOR.nregistro)) INNER JOIN Pacientes ON (Historial.TipoDoc = Pacientes.TipoDoc) AND (Historial.Documento = Pacientes.Documento)) &
			INNER JOIN HCLIN_REG_VALOR AS HCLIN_REG_VALOR_1 ON (hclin_registro.nregistro = HCLIN_REG_VALOR_1.nregistro) AND (hclin_registro.clugar = HCLIN_REG_VALOR_1.clugar) &
			AND (hclin_registro.contador = HCLIN_REG_VALOR_1.CONTADOR)&
			  WHERE "
End Choose

dw_4.SetTransObject (sqlca)
l_edad_en=graf.getitemstring(graf.getrow(),'edad_en')
choose case l_edad_en
	case '1'  
		l_e=360
		l_c=5
		l_edad=round(i_stde.edad /360,0)
		i_sql_edad=i_sql_edad+"360,0),"
		l_edad_en='(Años)'
	case '2'
		l_e=30
		l_c=12		
		l_edad=round(i_stde.edad /360*12,0)		
		i_sql_edad=i_sql_edad+"360*12),0),"	
		l_edad_en='(Meses)'
	case '3'
		l_e=1		
		l_c=365	
		l_edad=round(i_stde.edad /1,0)
		i_sql_edad=i_sql_edad+"1,0),"	
		l_edad_en='(Días)'
	case '4'
		l_e=1		
		l_c=52	
		l_edad=round(i_stde.edad /52,0)
		l_edad_en='(Semanas)'
	case '5'
		l_edad_en=' (Cms)'
end choose
l_edad_en=graf.getitemstring(graf.getrow(),'texto_x') +l_edad_en
dw_4.Retrieve(data)
dw_5.Retrieve(data)
If dw_4.rowcount()>1 then
	For j=1 to dw_4.rowcount()
		If l_xy='0' then
			l_sql_tod+= "((Historial.TipoDoc)='"+w_principal.dw_1.getitemstring(1,'tipodoc')+"') AND ((Historial.Documento)='" +w_principal.dw_1.getitemstring(1,'documento') +"') AND (((hclin_registro.codplantilla)='"+dw_4.getitemstring(j,'codplantilla')+"')"
			l_sql_tod+= "AND ((HCLIN_REG_VALOR.item)=" +string(dw_4.getitemnumber(j,'numcampo'))  +"))"
		End IF
		If l_xy='1' or l_xy='2' then
			l_sql_tod+= " (((Historial.TipoDoc)='"+w_principal.dw_1.getitemstring(1,'tipodoc')+"') AND ((Historial.Documento)='"+w_principal.dw_1.getitemstring(1,'documento') +"') AND ((hclin_registro.codplantilla)='"+dw_4.getitemstring(j,'codplantilla')+"')" 
			l_sql_tod+=" AND ((HCLIN_REG_VALOR.item)="+string(dw_4.getitemnumber(j,'x'))+ ") AND ((HCLIN_REG_VALOR_1.item)="+string(dw_4.getitemnumber(j,'Y'))+"))"
         End If
		If j<dw_4.rowcount() then
			l_sql_tod+= " OR "
		End if
	Next
Else
	If dw_4.rowcount()<>0 then 
		If l_xy='0' then
			l_sql_tod+= "((Historial.TipoDoc)='"+w_principal.dw_1.getitemstring(1,'tipodoc')+"') AND ((Historial.Documento)='" +w_principal.dw_1.getitemstring(1,'documento') +"') AND (((hclin_registro.codplantilla)='"+dw_4.getitemstring(1,'codplantilla')+"')"
			l_sql_tod+= "AND ((HCLIN_REG_VALOR.item)='" +string(dw_4.getitemnumber(1,'numcampo'))  +"'))"
		End If
		If l_xy='1' or  l_xy='2' then
			l_sql_tod+= " (((Historial.TipoDoc)='"+w_principal.dw_1.getitemstring(1,'tipodoc')+"') AND ((Historial.Documento)='"+w_principal.dw_1.getitemstring(1,'documento') +"') AND ((hclin_registro.codplantilla)='"+dw_4.getitemstring(1,'codplantilla')+"')" 
			l_sql_tod+=" AND ((HCLIN_REG_VALOR.item)="+string(dw_4.getitemnumber(1,'X'))+ ") AND ((HCLIN_REG_VALOR_1.item)="+string(dw_4.getitemnumber(1,'Y'))+"))"
		End If
	End if
End if
if isnull(i_sql_edad) then 
	l_sql_tod=l_sql_tod
else
	l_sql_tod=i_sql_edad+l_sql_tod
end if
if dw_3.setsqlselect(l_sql_tod)=-1 then
	i_sql_edad=dw_3.describe('DataWindow.Table.Select')
end if
If l_xy='1' then
	dw_3.Modify("titulo.text='"+graf.getitemstring(graf.getrow(),'texto_y')+"'" )
	dw_3.Modify("numero_t.text='"+graf.getitemstring(graf.getrow(),'texto_x')+"'" )
else
	dw_3.Modify("titulo.text='"+graf.getitemstring(graf.getrow(),'texto_X')+"'" )
	dw_3.Modify("numero_t.text='"+graf.getitemstring(graf.getrow(),'texto_Y')+"'" )	
end if
dw_3.retrieve()
 if dw_3.rowcount()=0 then
	 if round(i_stde.edad /l_e,0) - l_c<= l_edad1 then  l_edad1=round(i_stde.edad /l_e,0) - l_c
 end if
 
//INSERTA ATENCION ACTUAL
if i_stde.origen=1 then 
	fila=dw_3.insertrow(0)
	dw_3.setitem(fila,'fecha_reg', i_stde.fecha)
	If l_xy='0' then
		i_stde.dw_captura.SetFilter('numcampo='+string(i_stde.numcampo))
		i_stde.dw_captura.Filter( )	
		dw_3.setitem(fila,'edad',l_edad)
		dw_3.setitem(fila,'numero',i_stde.dw_captura.getitemnumber(1,'numero'))
	end if
	
	If l_xy='1' or l_xy='2' then
		int l_x,l_y,l_z
		dw_4.SetFilter("codplantilla='"+i_stde.codplantilla+"'")
		dw_4.Filter( )		
		l_x=dw_4.getitemnumber(1,'x')
		l_y=dw_4.getitemnumber(1,'y')
		l_z=0
		i_stde.dw_captura.SetFilter('numcampo='+string(l_x))
		i_stde.dw_captura.Filter( )		
		dw_3.setitem(fila,'numero',i_stde.dw_captura.getitemnumber(1,'numero'))
		i_stde.dw_captura.SetFilter('numcampo='+string(l_y))
		i_stde.dw_captura.Filter( )		
		dw_3.setitem(fila,'edad',i_stde.dw_captura.getitemnumber(1,'numero'))
		if  l_xy='2' then
			l_z=dw_4.getitemnumber(1,'z')
			i_stde.dw_captura.SetFilter('numcampo='+string(l_z))
			i_stde.dw_captura.Filter( )		
			l_z=i_stde.dw_captura.getitemnumber(1,'numero')
		end if
	end if
	i_stde.dw_captura.SetFilter(filtro_previo)
	i_stde.dw_captura.Filter( )	
end if

//TOMA INTERVALO DE ATENCIONES
If l_xy='0' then 
	if dw_3.getitemnumber(1,'min_x')> l_edad1 then l_edad1=dw_3.getitemnumber(1,'min_x')-10
	if dw_3.getitemnumber(1,'max_x')< l_edad2 then l_edad2=dw_3.getitemnumber(1,'max_x')+10
end if
dw_1.Retrieve (data,l_edad1,l_edad2,l_sex,l_z)
if dw_1.Rowcount() =0 then 
	MessageBox("Atención", "No hay datos con estos parametros para Graficar")
	 Close(w_grafica_hc)
	return
else
//DEFINE LAS SERIES DE LA GRAFICA
 If dw_3.Rowcount() > 0 then 
   For li = 1 to dw_3.rowcount()
		If l_xy='0' then 
			l_dato=dw_3.GetItemNumber(li ,'EDAD')
		end if
		If l_xy='1' then 	
			l_dato=dw_3.GetItemNumber(li ,'numero')
		end if
		l_ubic=f_ubica_edad(data,l_edad1,l_edad2,l_sex,divide,l_dato)
		long ll_fila
		ll_fila=dw_1.find("edad="+string(l_dato),1,dw_1.rowcount( ))
		if ll_fila= 0 then
			ll_fila=dw_1.find("edad>"+string(l_ubic.edad1)+'and edad<'+string(l_ubic.edad2),1,dw_1.rowcount( ))
			If l_xy='0' then 
				dw_1.setitem(ll_fila,'usuario',dw_3.GetItemNumber(li ,'numero'))
			end if
			If l_xy='1' then 
				dw_1.setitem(ll_fila,'usuario',dw_3.GetItemNumber(li ,'edad'))
			end if
		else
			If l_xy='0' then 
				dw_1.setitem(ll_fila,'usuario',dw_3.GetItemNumber(li ,'numero'))
			end if
			If l_xy='1' then 
				dw_1.setitem(ll_fila,'usuario',dw_3.GetItemNumber(li ,'edad'))
			end if
		end if
     next		
   end if
   //Monta las filas del retrieve para controlar tamaño
	l_cuantos=dw_1.getitemnumber(1,'cuantos')
	 if l_cuantos >37 then
		dw_1.SetFilter('(fila=1 or int( (fila /'+string(divide)+'))*'+string(divide)+'=fila) or (usuario<>0)')
		dw_1.Filter()	
	  end if
	
	  Lk = 7
	  li_serie_pac = gr_1.addseries ('Usuario')
	  Do While  Lk>0
		If not isnull(graf.getitemstring(graf.getrow(),'np'+String(lk))) then
			titulo_serie=trim(graf.getitemstring(graf.getrow(),'np'+string(lk)))
			color=graf.getitemnumber(graf.getrow(),'cp'+string(lk))	
			li_series_num= gr_1.addseries (titulo_serie)
			gr_1.SetSeriesStyle(titulo_serie,LineColor!, color)	
			gr_1.SetSeriesStyle(titulo_serie,NoSymbol!)
			gr_1.SetSeriesStyle(titulo_serie,Continuous!,2)	
			For li = 1 to dw_1.rowcount()
				//COLOCA LAS ATENCIONES DE PACIENTE EN LA GRAFICA
				if dw_1.GetItemNumber(li ,'usuario')<>0 then
					gr_1.AddData (li_serie_pac,dw_1.GetItemNumber(li ,'usuario'),string(dw_1.GetItemNumber(li ,'EDAD')))
				end if
				gr_1.AddData ( li_series_num, dw_1.GetItemNumber(li ,'P'+string(Lk)),string(dw_1.GetItemNumber(li ,'EDAD')))
			Next
		End if
		Lk= Lk - 1
	loop 
	gr_1.SetSeriesStyle('Usuario', LineColor!,16711808)
	gr_1.SetSeriesStyle('Usuario',SymbolSolidCircle!)
	gr_1.SetSeriesStyle('Usuario',Transparent!,10)
	gr_1.category.Label=l_edad_en
	gr_1.Values.Label=graf.getitemstring(graf.getrow(),'texto_y')
	gr_1.Values.Autoscale =false
	gr_1.Values.MinimumValue = l_min_val - 2
	gr_1.Values.MaximumValue =l_max_val
	gr_1.Values.MajorDivisions =7
	
//	gr_1.Values.MinorDivisions =2
//	gr_1.Values.RoundTo = 0
//	gr_1.Values.MajorTic = Straddle!
//	gr_1.Category.MajorDivisions =10
//	gr_1.Category.DisplayEveryNLabels = 0
//	gr_1.Series.DropLines = Dash!
	gr_1.Series.DisplayEveryNLabels = 10
	gr_1.Render3D=true 
	gr_1.SetRedraw (True)
end if
end event

type st_1 from statictext within w_grafica_hc
integer x = 64
integer y = 24
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Curva Gráfica"
boolean focusrectangle = false
end type

type pb_cancelar from picturebutton within w_grafica_hc
event mousemove pbm_mousemove
integer x = 3223
integer y = 12
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type cb_tipo from picturebutton within w_grafica_hc
event mousemove pbm_mousemove
boolean visible = false
integer x = 3077
integer y = 12
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &T"
boolean originalsize = true
string picturename = "tgrafico.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;OpenWithParm (w_graph_type, gr_1)
end event

type dw_4 from datawindow within w_grafica_hc
boolean visible = false
integer x = 2217
integer y = 12
integer width = 274
integer height = 92
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_plantilla_grafica"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_4.SetTransObject (sqlca)
end event

type dw_1 from datawindow within w_grafica_hc
boolean visible = false
integer x = 1879
integer width = 288
integer height = 112
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_graficas_hc"
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.SetTransObject (sqlca)
end event

